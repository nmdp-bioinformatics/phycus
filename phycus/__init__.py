"""
Phycus: Public Haplotype Frequency Curation Service
Publish and index HFX files with searchable static table.
"""

__version__ = "0.0.1"

from phycus.metadata_parser import HFXMetadataParser
from phycus.site_generator import StaticSiteGenerator

__all__ = ["HFXMetadataParser", "StaticSiteGenerator"]
