compile:
    typst compile cards.typ cards.pdf
    typst compile rules.typ rules.pdf
    typst compile codex.typ codex.pdf
    mkdir -p output/
    cp index.html output/
    cp rules.pdf cards.pdf codex.pdf output/

warmup:
    mkdir -p artifacts
    mkdir -p output

    for f in external/game-icons/_out/DDDDDD/transparent/1x1/*/*.svg; do mv -f "$f" artifacts/"$(basename "$(dirname "$f")")-$(basename "$f" .svg).svg"; done

[working-directory: 'exteral/game-icons']
colorize:
    (sed '1i fd() { fdfind "$@"; }' ./colorize-svgs.sh) | bash

pull-submodules:
    echo "Not implemented, just think of it as if it was pulled"