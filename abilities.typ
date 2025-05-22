#set page(width: 2.5in, height: 3.5in, margin: 0in)
#set text(font: "Exo 2", size: 12pt)

// https://lospec.com/palette-list/fantasy-24

#let hex = sym.hexa.stroked

// Activation: Once per turn, action, reactionary, passive
// Cost: AP, Heat

#let activation = (
  passive: "passive",
  action: "action",
  reaction: "reaction",
)

#let activation-colors = (
  "passive": rgb("#4b80ca"),
  "reaction": rgb("#efac28"),
  "action": rgb("#ef3a0c"),
)

#let card(name, activation, heat-cost: 0, tags: (), body) = [
  #stack(
    dir: ttb,
    box(width: 100%, height: 15%, fill: activation-colors.at(activation))[
      #align(center + horizon)[#text(size: 16pt)[*#name*]]
    ],
    box(width: 100%, height: 75%)[
      #pad(rest: 7.5%)[#body]
    ],
    box(width: 100%, height: 10%)[
      #align(center, {
        tags.push(activation)
        for tag in tags [
          #text(size: 14pt, fill: gray)[\##tag]
        ]
      })
        
    ]
  )
  #pagebreak()
]

#let abilities = yaml("abilities.yaml")

#for special in abilities.specials {
  let raw = special.at("body")
  let s = eval(raw, mode: "markup", scope: (hex: hex))
  
  card(special.at("name"), special.at("activation"), s, tags: ("special",))
}
