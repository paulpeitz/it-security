#!/usr/bin/env python3
"""
DHBW IT-Security Lecture Script to PDF Exporter via Typst
Converts Markdown lecture scripts (*-script.md) into professionally styled,
academic PDFs using Typst.
"""

import sys
import os
import re
import subprocess
from pathlib import Path

LUA_FILTER = """-- Pandoc Lua filter for DHBW IT-Security script export to Typst

local function is_callout_header(block)
  if block.t == "Header" and block.level == 3 then
    local text = pandoc.utils.stringify(block)
    if text:find("💡") then
      return "didaktik", text:gsub("^%s*💡%s*", "")
    elseif text:find("🎯") then
      return "exam", text:gsub("^%s*🎯%s*", "")
    elseif text:find("❓") then
      return "quiz", text:gsub("^%s*❓%s*", "")
    end
  end
  return nil, nil
end

function BlockQuote(el)
  local res = { pandoc.RawBlock('typst', '#quote-box[\\n') }
  for _, b in ipairs(el.content) do
    table.insert(res, b)
  end
  table.insert(res, pandoc.RawBlock('typst', ']\\n'))
  return res
end

function Div(el)
  if el.classes:includes('columns') then
    local cols = {}
    for _, item in ipairs(el.content) do
      if item.t == "Div" and item.classes:includes("col") then
        table.insert(cols, item.content)
      end
    end
    if #cols == 2 then
      local res = { pandoc.RawBlock('typst', '#grid(columns: (1fr, 1fr), gutter: 14pt, [\\n') }
      for _, b in ipairs(cols[1]) do table.insert(res, b) end
      table.insert(res, pandoc.RawBlock('typst', '], [\\n'))
      for _, b in ipairs(cols[2]) do table.insert(res, b) end
      table.insert(res, pandoc.RawBlock('typst', '])\\n'))
      return res
    end
  end
  return nil
end

function Pandoc(doc)
  local new_blocks = {}
  local i = 1
  local n = #doc.blocks

  while i <= n do
    local block = doc.blocks[i]
    local callout_type, callout_title = is_callout_header(block)

    if callout_type then
      local content = {}
      i = i + 1
      while i <= n do
        local next_b = doc.blocks[i]
        if next_b.t == "Header" or next_b.t == "HorizontalRule" then
          break
        end
        table.insert(content, next_b)
        i = i + 1
      end

      local func_name = callout_type .. "-box"
      table.insert(new_blocks, pandoc.RawBlock('typst', '#' .. func_name .. '(title: [' .. callout_title .. '])[\\n'))
      for _, cb in ipairs(content) do
        table.insert(new_blocks, cb)
      end
      table.insert(new_blocks, pandoc.RawBlock('typst', ']\\n'))
    elseif block.t == "HorizontalRule" then
      table.insert(new_blocks, pandoc.RawBlock('typst', '#pagebreak(weak: true)\\n'))
      i = i + 1
    else
      table.insert(new_blocks, block)
      i = i + 1
    end
  end

  return pandoc.Pandoc(new_blocks, doc.meta)
end
"""

def generate_preamble(topic_name: str) -> str:
    return f"""#set page(
  paper: "a4",
  margin: (top: 1.8cm, bottom: 1.8cm, left: 2.0cm, right: 2.0cm),
  header: context {{
    if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(size: 8.5pt, fill: rgb("#64748b"), weight: "bold")[DHBW Karlsruhe · IT-Sicherheit]],
        align(right)[#text(size: 8.5pt, fill: rgb("#94a3b8"))[{topic_name}]]
      )
      #v(-4pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    ]
  }},
  footer: context [
    #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
    #v(3pt)
    #grid(
      columns: (1fr, 1fr),
      align(left)[#text(size: 8.5pt, fill: rgb("#94a3b8"))[Lernskript & Klausurvorbereitung]],
      align(right)[
        #let current = counter(page).get().first()
        #let total = counter(page).final().first()
        #text(size: 8.5pt, fill: rgb("#64748b"))[Seite #current von #total]
      ]
    )
  ]
)

#set text(
  font: ("Segoe UI", "Arial"),
  size: 9.75pt,
  lang: "de",
  fill: rgb("#1e293b")
)

#set par(
  justify: true,
  leading: 0.7em,
  spacing: 0.85em
)

#set list(
  spacing: 0.55em,
  marker: ([•], [--], [▸])
)

#show heading.where(level: 1): it => block(
  width: 100%,
  breakable: false,
  inset: (top: 4pt, bottom: 6pt),
)[
  #text(size: 16pt, weight: "bold", fill: rgb("#0f172a"))[#it.body]
  #v(2pt)
  #line(length: 100%, stroke: 1.5pt + rgb("#e2001a"))
  #v(3pt)
]

#show heading.where(level: 2): it => block(
  width: 100%,
  breakable: false,
  inset: (top: 2pt, bottom: 4pt),
)[
  #text(size: 12pt, weight: "bold", fill: rgb("#475569"))[#it.body]
]

#show heading.where(level: 3): it => block(
  width: 100%,
  breakable: false,
  inset: (top: 2pt, bottom: 3pt),
)[
  #text(size: 10.5pt, weight: "bold", fill: rgb("#1e293b"))[#it.body]
]

#show figure.where(kind: image): it => align(center)[
  #box(radius: 5pt, clip: true, stroke: 1pt + rgb("#cbd5e1"))[#it.body]
  #if it.caption != none [
    #v(2pt)
    #text(size: 8pt, fill: rgb("#64748b"))[#it.caption]
  ]
]

#set image(width: 38%)

#let didaktik-box(title: none, body) = block(
  width: 100%,
  fill: rgb("#f0f7ff"),
  stroke: (left: 3.5pt + rgb("#0284c7")),
  radius: (right: 4pt),
  inset: (x: 10pt, y: 7.5pt),
  spacing: 8pt,
  breakable: false,
)[
  #if title != none [
    #text(weight: "bold", fill: rgb("#0369a1"), size: 9.75pt)[💡 #title]
    #v(3pt)
  ]
  #body
]

#let exam-box(title: none, body) = block(
  width: 100%,
  fill: rgb("#faf5ff"),
  stroke: (left: 3.5pt + rgb("#7c3aed")),
  radius: (right: 4pt),
  inset: (x: 10pt, y: 7.5pt),
  spacing: 8pt,
  breakable: false,
)[
  #if title != none [
    #text(weight: "bold", fill: rgb("#6d28d9"), size: 9.75pt)[🎯 #title]
    #v(3pt)
  ]
  #body
]

#let quiz-box(title: none, body) = block(
  width: 100%,
  fill: rgb("#f0fdf4"),
  stroke: (left: 3.5pt + rgb("#16a34a")),
  radius: (right: 4pt),
  inset: (x: 10pt, y: 7.5pt),
  spacing: 8pt,
  breakable: false,
)[
  #if title != none [
    #text(weight: "bold", fill: rgb("#15803d"), size: 9.75pt)[❓ #title]
    #v(3pt)
  ]
  #body
]

#let quote-box(body) = block(
  width: 100%,
  fill: rgb("#f8fafc"),
  stroke: (left: 3pt + rgb("#64748b")),
  radius: (right: 4pt),
  inset: (x: 9pt, y: 6.5pt),
  spacing: 7pt,
  breakable: false,
)[
  #text(style: "italic", fill: rgb("#334155"))[#body]
]
"""

def extract_topic_name(file_stem: str) -> str:
    cleaned = file_stem.replace(" - script", "")
    parts = cleaned.split(" - ")
    if len(parts) >= 2:
        return f"{parts[0]} · {parts[1].capitalize()}"
    return cleaned

def export_file(input_path: Path, output_pdf_path: Path = None):
    input_path = input_path.resolve()
    if not input_path.exists():
        print(f"Fehler: Datei nicht gefunden: {input_path}")
        sys.exit(1)

    work_dir = input_path.parent
    print(f"Exportiere {input_path.name} nach PDF mit Typst...")
    content = input_path.read_text(encoding="utf-8")

    # 1. Listen-Abstände bereinigen, damit Pandoc alle Listen exakt parst
    lines = content.split('\n')
    fixed_lines = []
    in_list = False
    for line in lines:
        stripped = line.strip()
        is_list_item = bool(re.match(r'^([-*+]|\d+\.)\s+', stripped))
        if is_list_item:
            if not in_list:
                if fixed_lines and fixed_lines[-1].strip() != '':
                    fixed_lines.append('')
                in_list = True
        else:
            if stripped != '':
                in_list = False
        fixed_lines.append(line)
    content = '\n'.join(fixed_lines)

    # 2. Spalten <div class="columns"> in fenced divs übersetzen
    col_pattern = re.compile(
        r'<div class="columns">\s*<div>(.*?)</div>\s*<div>(.*?)</div>\s*</div>',
        re.DOTALL
    )
    def replace_col(m):
        c1 = m.group(1).strip()
        c2 = m.group(2).strip()
        return f"\n::: columns\n::: col\n{c1}\n:::\n::: col\n{c2}\n:::\n:::\n"
    content = col_pattern.sub(replace_col, content)

    # Temporäre Zwischendateien in work_dir / scratch
    scratch_dir = work_dir / "scratch"
    scratch_dir.mkdir(exist_ok=True)
    
    tmp_md = scratch_dir / f"tmp_{input_path.stem}.md"
    tmp_lua = scratch_dir / "typst_filter.lua"
    tmp_body = scratch_dir / f"tmp_{input_path.stem}_body.typ"
    
    tmp_md.write_text(content, encoding="utf-8")
    tmp_lua.write_text(LUA_FILTER, encoding="utf-8")

    # 3. Pandoc-Aufruf zur Erzeugung des Typst-Bodys
    pandoc_cmd = [
        "pandoc",
        "-f", "markdown+fenced_divs",
        f"--lua-filter={tmp_lua}",
        "-t", "typst",
        str(tmp_md),
        "-o", str(tmp_body)
    ]
    subprocess.run(pandoc_cmd, check=True, cwd=str(work_dir))

    # 4. Typst-Gesamtdokument zusammensetzen
    topic_name = extract_topic_name(input_path.stem)
    preamble = generate_preamble(topic_name)
    body_content = tmp_body.read_text(encoding="utf-8")
    full_typ = preamble + "\n" + body_content

    output_typ = input_path.with_suffix(".typ")
    output_typ.write_text(full_typ, encoding="utf-8")

    # 5. Typst-Kompilierung nach PDF
    if output_pdf_path is None:
        pdf_dir = work_dir / "pdf"
        pdf_dir.mkdir(exist_ok=True)
        output_pdf = pdf_dir / f"{input_path.stem}.pdf"
    else:
        output_pdf = output_pdf_path.resolve()
        output_pdf.parent.mkdir(parents=True, exist_ok=True)

    typst_cmd = ["typst", "compile", str(output_typ), str(output_pdf)]
    subprocess.run(typst_cmd, check=True, cwd=str(work_dir))

    # Aufräumen temporärer Hilfsdateien
    for tmp_file in [tmp_md, tmp_lua, tmp_body]:
        try:
            tmp_file.unlink(missing_ok=True)
        except Exception:
            pass

    # Seitenanzahl ermitteln
    p_pages = subprocess.run(
        ["typst", "eval", "query(heading.where(level: 1)).map(h => h.location().page()).last()", "--in", str(output_typ)],
        capture_output=True,
        text=True,
        cwd=str(work_dir)
    )
    pages = p_pages.stdout.strip() if p_pages.returncode == 0 and p_pages.stdout.strip() else "?"
    file_size_kb = output_pdf.stat().st_size / 1024

    print(f"ERFOLG: {output_pdf.name} erstellt unter {output_pdf}")
    print(f"Seitenanzahl: {pages}")
    print(f"Dateigröße: {file_size_kb:.1f} KB")

def main():
    if len(sys.argv) < 2:
        print("Verwendung: python export_to_typst.py <Eingabedatei.md> [<Ausgabedatei.pdf>]")
        sys.exit(1)

    target = Path(sys.argv[1])
    out_target = Path(sys.argv[2]) if len(sys.argv) > 2 else None
    export_file(target, out_target)

if __name__ == "__main__":
    main()
