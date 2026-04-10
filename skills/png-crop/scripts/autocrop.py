from pathlib import Path

from PIL import Image


def autocrop(src: str | Path, dst: str | Path | None = None) -> None:
    src = Path(src)
    dst = Path(dst) if dst else src
    img = Image.open(src).convert("RGBA")
    bbox = img.getchannel("A").getbbox()  # bounding box of non-transparent pixels
    if bbox is None:
        raise ValueError(f"Image is fully transparent: {src}")
    img.crop(bbox).save(dst, **img.info)


if __name__ == "__main__":
    import sys

    args = sys.argv[1:]
    if len(args) not in (1, 2):
        print("Usage: python3 autocrop.py <input> [output]", file=sys.stderr)
        sys.exit(1)
    autocrop(*args)
