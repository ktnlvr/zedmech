#set page(width: 120mm, height: 70mm, margin: 0in)
#set text(font: "Inter", size: 14pt)

#let cards = yaml("cards.yaml")

#let hex = sym.hexa.stroked
#let heat = sym.triangle.stroked.rounded
#let los = sym.angle.spheric
#let push = sym.arrow.r.quad
#let damage = sym.Chi
#let radius = sym.circle.stroked
#let cone = sym.triangle.stroked.l

#let reaction = sym.arrow.l.turn
#let active = sym.arrow.b.stop
#let passive = sym.diamond.stroked

#let half = str.from-unicode(0xBD)
#let thirds = str.from-unicode(0x2154)

#let scope = (
  hex: hex,
  half: half,
  thirds: thirds,
  heat: heat,
  push: push,
  damage: damage,
  radius: radius,
  cone: cone,
  reaction: reaction,
  active: active,
  passive: passive
);

#let families = (
  "attack": sym.Alpha,
  "defence": sym.Sigma,
  "control": sym.Kappa,
  "support": sym.Zeta,
  "heat": sym.Delta,
  "mobility": sym.Epsilon,
  "trickery": sym.Omega
)

#for card in cards.at("cards") {
  pad(rest: 15pt)[
    #if card.at("family", default: none) != none {
      let symbol = families.at(card.at("family"))
      place[#box(width: 100%, height: 100%)[
        #align(center + horizon)[
          #text(size: 27mm, fill: silver, font: "Charter")[#symbol]
        ]
      ]]
    }

    #if card.at("icon", default: none) != none {
      place[#box(width: 100%, height: 100%)[
        #align(top + right)[
          #image("external/game-icons/_out/DDDDDD/transparent/1x1/" + card.at("icon"), width: 52pt)
        ]
      ]]
    }
  
    = #text(size: 24pt)[#eval(card.name, mode: "markup", scope: scope)]
    #if card.at("brief", default: none) != none {
      text(size: 16pt)[#eval(card.brief, mode: "markup", scope: scope)]
    } else {
      v(8pt)
    }

    #if card.at("text", default: none) != none {
      eval(card.text, mode: "markup", scope: scope)
    }
  ]
  pagebreak()
}