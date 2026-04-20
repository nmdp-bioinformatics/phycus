"""
Static Site Generator - Generate searchable HTML table from HFX metadata.
"""

from datetime import datetime
from pathlib import Path

from jinja2 import Environment, FileSystemLoader, select_autoescape

from phycus.metadata_parser import HFXMetadataParser


class StaticSiteGenerator:
    """Generate static HTML site from HFX metadata."""

    def __init__(self, submission_dir: Path | str = "submission", output_dir: Path | str = "docs"):
        """Initialize site generator.

        Args:
            submission_dir: Directory containing HFX metadata files
            output_dir: Directory where HTML will be generated
        """
        self.submission_dir = Path(submission_dir)
        self.output_dir = Path(output_dir)
        self.parser = HFXMetadataParser(submission_dir)

        # Set up Jinja2 environment
        template_dir = Path(__file__).parent / "templates"
        self.env = Environment(
            loader=FileSystemLoader(template_dir),
            autoescape=select_autoescape(["html", "xml"]),
        )

    def generate(self) -> None:
        """Generate static HTML site from all metadata files."""
        # Parse all metadata
        metadata_list = self.parser.parse_all()

        # Prepare data for template
        table_data = [m.to_dict() for m in metadata_list]

        # Load and render template
        template = self.env.get_template("index.html")
        html_content = template.render(
            submissions=table_data,
            total_submissions=len(table_data),
            now=datetime.now().strftime("%Y-%m-%d %H:%M"),
        )

        # Create output directory if needed
        self.output_dir.mkdir(parents=True, exist_ok=True)

        # Write HTML file
        output_file = self.output_dir / "index.html"
        with open(output_file, "w") as f:
            f.write(html_content)

        print(f"Generated {output_file}")
