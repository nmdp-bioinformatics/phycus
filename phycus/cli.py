"""
CLI for phycus - generate static HFX index site.
"""

import argparse
from pathlib import Path

from phycus.site_generator import StaticSiteGenerator


def main():
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(
        description="Generate searchable static HFX index site",
    )
    parser.add_argument(
        "--submission-dir",
        type=Path,
        default="submission",
        help="Directory containing HFX metadata files (default: submission)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default="docs",
        help="Output directory for generated HTML (default: docs)",
    )

    args = parser.parse_args()

    generator = StaticSiteGenerator(
        submission_dir=args.submission_dir,
        output_dir=args.output_dir,
    )
    generator.generate()


if __name__ == "__main__":
    main()
