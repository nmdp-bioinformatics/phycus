"""
HFX Metadata Parser - Extract and normalize HFX metadata for indexing.
Handles both raw JSON metadata files and HFX wheel archives.
"""

import json
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any
from zipfile import ZipFile


@dataclass
class Population:
    """Represents a population in HFX metadata."""

    name: str
    population_size: int
    iso3166: str | None = None
    subdivision: str | None = None


@dataclass
class HFXMetadata:
    """Represents parsed HFX metadata."""

    filename: str
    cohort_size: int
    species: str
    populations: list[Population]
    loci: list[str]
    method: str
    data_source: str
    nomenclature_database: str | None = None

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary for templating."""
        return {
            "filename": self.filename,
            "cohort_size": self.cohort_size,
            "species": self.species,
            "populations": [asdict(p) for p in self.populations],
            "loci": ", ".join(self.loci),
            "method": self.method,
            "data_source": self.data_source,
            "nomenclature_database": self.nomenclature_database or "N/A",
        }


class HFXMetadataParser:
    """Parse HFX metadata from JSON files and HFX wheel archives."""

    def __init__(self, submission_dir: Path | str = "submission"):
        """Initialize parser with submission directory path."""
        self.submission_dir = Path(submission_dir)

    def _parse_metadata_dict(self, data: dict, filename: str) -> HFXMetadata | None:
        """Parse metadata from a dictionary.

        Args:
            data: Metadata dictionary (top-level or under 'metadata' key)
            filename: Original filename for reference

        Returns:
            HFXMetadata object or None if parsing fails
        """
        try:
            # Check if data has "metadata" key or is metadata directly
            metadata_obj = data.get("metadata", data)

            # Extract basic info
            cohort_desc = metadata_obj.get("cohortDescription", {})
            hfe_method = metadata_obj.get("hfeMethod", {})
            output_resolution = metadata_obj.get("outputResolution", [])
            nomenclature = metadata_obj.get("nomenclatureUsed", {})

            # Extract loci from outputResolution
            loci = [item.get("locus") for item in output_resolution if "locus" in item]

            # Extract populations
            populations = []
            pop_data = cohort_desc.get("population", [])
            for pop in pop_data:
                geo = pop.get("geoLocation", {})
                populations.append(
                    Population(
                        name=pop.get("name", "Unknown"),
                        population_size=pop.get("populationSize", 0),
                        iso3166=geo.get("ISO3166"),
                        subdivision=", ".join(geo.get("subdivision", []))
                        if geo.get("subdivision")
                        else None,
                    )
                )

            return HFXMetadata(
                filename=filename,
                cohort_size=cohort_desc.get("cohortSize", 0),
                species=cohort_desc.get("species", "Unknown"),
                populations=populations,
                loci=loci,
                method=hfe_method.get("method", "Unknown"),
                data_source=cohort_desc.get("dataSource", "Unknown"),
                nomenclature_database=nomenclature.get("database"),
            )
        except Exception as e:
            print(f"Error parsing metadata from {filename}: {e}")
            return None

    def parse_hfx_file(self, filepath: Path | str) -> HFXMetadata | None:
        """Parse HFX wheel archive (.hfx file).

        Args:
            filepath: Path to the .hfx wheel archive

        Returns:
            HFXMetadata object or None if parsing fails
        """
        filepath = Path(filepath)

        try:
            with ZipFile(filepath, "r") as hfx_archive:
                # HFX archives should contain metadata.json or METADATA.json at root
                metadata_filenames = ["metadata.json", "METADATA.json"]

                for metadata_name in metadata_filenames:
                    if metadata_name in hfx_archive.namelist():
                        with hfx_archive.open(metadata_name) as f:
                            data = json.load(f)
                        return self._parse_metadata_dict(data, filepath.name)

                # If no metadata.json found, list what's in the archive
                print(
                    f"No metadata.json found in {filepath}. Contents: {hfx_archive.namelist()}"
                )
                return None

        except Exception as e:
            print(f"Error parsing HFX file {filepath}: {e}")
            return None

    def parse_json_file(self, filepath: Path | str) -> HFXMetadata | None:
        """Parse raw HFX metadata JSON file.

        Args:
            filepath: Path to the HFX metadata JSON file

        Returns:
            HFXMetadata object or None if parsing fails
        """
        filepath = Path(filepath)

        try:
            with open(filepath) as f:
                data = json.load(f)

            return self._parse_metadata_dict(data, filepath.name)

        except Exception as e:
            print(f"Error parsing JSON file {filepath}: {e}")
            return None

    def parse_file(self, filepath: Path | str) -> HFXMetadata | None:
        """Parse HFX metadata from file (auto-detects format).

        Args:
            filepath: Path to HFX file (.hfx archive or .json metadata)

        Returns:
            HFXMetadata object or None if parsing fails
        """
        filepath = Path(filepath)

        if filepath.suffix == ".hfx":
            return self.parse_hfx_file(filepath)
        elif filepath.suffix == ".json":
            return self.parse_json_file(filepath)
        else:
            print(f"Unknown file format: {filepath}")
            return None

    def parse_all(self) -> list[HFXMetadata]:
        """Parse all HFX metadata from submission directory.

        Finds .hfx wheel files and .json metadata files, skipping invalid files.

        Returns:
            List of HFXMetadata objects
        """
        metadata_list = []

        if not self.submission_dir.exists():
            return metadata_list

        # Find .hfx wheel files
        for filepath in self.submission_dir.glob("*.hfx"):
            metadata = self.parse_hfx_file(filepath)
            if metadata:
                metadata_list.append(metadata)

        # Also find raw JSON metadata files (for legacy support)
        for filepath in self.submission_dir.glob("*.hfx-metadata.json"):
            # Skip invalid files
            if filepath.name.startswith("invalid-"):
                continue

            metadata = self.parse_json_file(filepath)
            if metadata:
                metadata_list.append(metadata)

        return metadata_list
