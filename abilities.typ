#set page(width: 2.5in, height: 3.5in, margin: 0in)
#set text(font: "Exo 2", size: 12pt)

// https://lospec.com/palette-list/fantasy-24

#let hex = sym.hexa.stroked

#let half = str.from-unicode(0xBD)
#let thirds = str.from-unicode(0x2154)

// Activation: Once per turn, action, reactionary, passive
// Cost: AP, Heat

#let activation = (
  passive: "passive",
  action: "action",
  reaction: "reaction",
  free: "free",
)

#let activation-colors = (
  "passive": rgb("#4b80ca"),
  "reaction": rgb("#efac28"),
  "action": rgb("#ef3a0c"),
  "free": rgb("#3c9f9c")
)

#let card(name, activation, heat-cost: 0, is-mod: false, tags: (), body) = [
  #stack(
    dir: ttb,
    box(width: 100%, height: 15%, fill: activation-colors.at(activation))[
      #align(center + horizon)[== #text(size: 16pt, fill: white)[#name]]
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
  let s = eval(raw, mode: "markup", scope: (hex: hex, half: half, thirds: thirds))
  let n = upper(special.at("name"))
  
  card(n, special.at("activation"), s, tags: ("special",))
}

#for mod in abilities.mods {
  let raw = mod.at("body")
  let s = eval(raw, mode: "markup", scope: (hex: hex, half: half, thirds: thirds))
  let n = upper(mod.at("name"))
  
  card(n, mod.at("activation"), s, tags: ("mod",), is-mod: true)
}
