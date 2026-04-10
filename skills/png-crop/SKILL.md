---
name: png-crop
description: Auto-crop PNG files to minimal bounding box of non-transparent content
---
Use Python with Pillow to auto-crop PNG files.

Reference implementation: `scripts/autocrop.py`

```sh
python3 autocrop.py input.png            # crop in-place
python3 autocrop.py input.png output.png # crop to new file
```

## Dependencies
On Mac, run `brew install pillow`.


## Algorithm
Find bounding box of non-transparent pixels via alpha channel, crop to that box.

Notes:
- Crop based on alpha channel only (`getchannel("A").getbbox()`), not RGB content
- Always convert to RGBA before cropping to ensure alpha channel exists
- Overwrite in-place unless output path specified
- Support glob patterns and batch processing when multiple files given
- Preserve original format/metadata (`img.info`) on save
