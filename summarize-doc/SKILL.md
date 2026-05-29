---
name: summarize-doc
version: 1.0.0
description: Compress heavy documents to 20-30% original length. Trigger on /summarize-doc slash command or when user has PDF, Word doc, or other lengthy document they want condensed for quick review. Preserves all facts, names, dates, claims, instructions without losing substance.
---

# Document Compression Skill

Condense large documents (especially image-heavy or scanned PDFs) while preserving all critical information.

## When to Use

- User uploads PDF, docx, or other long document
- Context window is tight and document is eating tokens
- Need quick reference version of lengthy material
- Document has filler, repeated sections, marketing language

## Process

Read document end to end. Output condensed plain-text version preserving:

1. All factual claims, numbers, dates, names
2. Every actionable instruction or recommendation
3. Document structure as short headings

Drop: filler phrases, repeated context, marketing language, formatting artifacts, page headers/footers.

Target: 20-30% original length. Output only condensed text, no commentary.

## Input

Any document (PDF, Word, image, text file).

## Output

Plain text. Headings. Bullet points for lists. No markdown extras. No preamble.

## Notes

Works best on text-searchable PDFs. For scanned/image-heavy PDFs, may need OCR preprocessing first.
