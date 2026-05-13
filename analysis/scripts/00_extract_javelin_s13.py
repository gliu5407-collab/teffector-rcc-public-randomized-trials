#!/usr/bin/env python3
"""Extract JAVELIN Renal 101 S13 expression sheet from a local source workbook.

This helper does not ship the source workbook. Obtain the published supplementary
workbook from the original source and provide its path.

Example:
    python 00_extract_javelin_s13.py --source /path/to/javelin_MOESM3.xlsx --out data/javelin_S13_full_expression_log2tpm.csv
"""
import argparse
from pathlib import Path
import pandas as pd

parser = argparse.ArgumentParser()
parser.add_argument('--source', required=True, help='Path to local JAVELIN supplementary Excel workbook containing S13_Gene_expression_TPM')
parser.add_argument('--out', required=True, help='Output CSV path for S13 expression table')
parser.add_argument('--sheet', default='S13_Gene_expression_TPM', help='Excel sheet name')
args = parser.parse_args()

src = Path(args.source)
out = Path(args.out)
out.parent.mkdir(parents=True, exist_ok=True)
if not src.exists():
    raise FileNotFoundError(src)

# The workbook sheet format used in the public supplementary file may include a title row.
# Try a normal read first; if the first column does not look like gene symbols, retry skipping the first row.
df = pd.read_excel(src, sheet_name=args.sheet)
first_col = str(df.columns[0]).lower()
if 'gene' not in first_col and 'symbol' not in first_col:
    df = pd.read_excel(src, sheet_name=args.sheet, skiprows=1)

df.to_csv(out, index=False)
print(f'Wrote {out} with shape {df.shape}')
