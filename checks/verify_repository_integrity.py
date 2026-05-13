#!/usr/bin/env python3
import hashlib, csv, sys
from pathlib import Path

root = Path(__file__).resolve().parents[1]
manifest = root / 'manifests' / 'PUBLIC_REPOSITORY_FILE_MANIFEST.csv'
errors = []

with manifest.open(newline='', encoding='utf-8') as f:
    for row in csv.DictReader(f):
        rel = row['relative_path']
        p = root / rel
        if not p.exists():
            errors.append(f'MISSING: {rel}')
            continue
        actual_size = p.stat().st_size
        try:
            expected_size = int(row.get('size_bytes', ''))
        except ValueError:
            expected_size = None
        if expected_size is None or actual_size != expected_size:
            errors.append(f'SIZE mismatch: {rel} expected={row.get("size_bytes")} actual={actual_size}')
        sha = hashlib.sha256(p.read_bytes()).hexdigest()
        if sha != row['sha256']:
            errors.append(f'SHA256 mismatch: {rel}')

if errors:
    print('Repository integrity check FAILED')
    for e in errors:
        print(' -', e)
    sys.exit(1)

print('Repository integrity check PASS')
