#set page(width: 120mm, height: 70mm, margin: 0in)
#set text(font: "Inter", size: 14pt)

#let cards = yaml("cards.yaml")

#let hex = sym.hexa.stroked
#let heat = sym.triangle.stroked.rounded
#let los = sym.angle.spheric
#let push = sym.arrow.r.quad

#let half = str.from-unicode(0xBD)
#let thirds = str.from-unicode(0x2154)

#let scope = (hex: hex, half: half, thirds: thirds, heat: heat, push: push);

#for card in cards.at("cards") {
  pad(rest: 15pt)[
    = #text(size: 24pt)[#eval(card.name, mode: "markup", scope: scope)]
    #if card.at("brief") != none {
      text(size: 16pt)[#eval(card.brief, mode: "markup", scope: scope)]
    }
    
    #eval(card.text, mode: "markup", scope: scope)
  ]
  pagebreak()
}
