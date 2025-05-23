#set page("a5", background: image("assets/backdrop.png", fit: "stretch"))
#set document(author: "Artur Roos", title: "Zedmech")
#set text(font: "Exo 2", size: 12pt)

// Feedback
// - no melee abilities basically
// - make something to get extra actions
// - with a free shot drones just fire and the firing action can not be used again
// Levitating. Allows to climb elevation without spending extra movement
// Different lingo for venting during your turn and at the end of your turn
// Specify the Undo rules (stuff can only be undone before any dice have been rolled)
// Clarify LOS rules
// Specify the order of activations Specials > Mods
// No bending the Plasma wall, clarify how it works with the edges
// Things miss too often, bump the hit chance
// Bump movement back to 4 
// Tokens for... Overwatch, Cryo, Escalation, Unit names, "Done", Vulnerable, "Resets next turn"
// Lower the damage and HP, very punishing to be able to make 4 attacks per turn (2 Guns + Quantum Double).
// Replace all the "rounding down" with symbols
// Maybe vent works at the start of the turn?
// Pack of names for the drones
// Don't put cover on the edges of elevation
// Abilities that allow you to reroll dice bypass the advantage mechanic with basically equivalent stats
// Overwatch is _Over_powered.
// Too much HP, battles drag
// Convering damage into knockback is too powerful, 
// An ability that allows you to survive one killing blow
// Add "Manufacturers" to separate abilities into easily parseable groups
// Capped advantage way too powerful
// Make abilities alphabetical
// Remove rolls when spawning drones and separate out the rules


#let hex = sym.hexa.stroked

#let half = str.from-unicode(0xBD)
#let thirds = str.from-unicode(0x2154)

#align(center)[#text(size: 24pt)[*Zedmech*]]

A simple rule set for hex-based tabletop mech fighting game. Hackable, simplistic, quick.

Builds on #link("https://berserkerworks.itch.io/mek28")[Bill Ward's  Mek28].

== Assembling

Every mech starts with...

- 8 Hull Points (HP)
- 8 Heat Capacity (H)
- 3 Movement (M), measured in #hex
- 3 Slots (S)
- 1 Mod

You can buy/sell 2HP for 1 Movement and 1 Slot.

=== Manufacturers

Each ability has a Manufacturer behind it. It roughly defines the type of ability it is. Generally abilities of the same Manufacturer play well with each other.

- _Fury_. Militaristic dominance, damage, destruction.
- _Grit_. Close quarters, vitality, shielding.
- _Vigor_. Elegance, speed, alertness.
- _Entropy_. Disruption, chaos, explosions, surprise.
- _Hive_. Support, drones, assistance, cover. 

== Weapons

- *CANNON*. 1 Slot, 8#hex, 2 Heat, 2 Damage, 1 Knock-back.
- *CRYO*. 1 Slot, 8#hex, 1 Heat, 1 Damage. Decrease enemy movement by 1 for 1 turn.
- *HEAVY*. 2 Slots, 9#hex, 2 Heat, 3 Damage, 2 Knock-back. Takes an action to reload.
- *ROCKET*. 1 Slot, 6#hex. 2 Heat, 1 Damage. Blast radius 1#hex.
- *LASER*. 1 Slot, 1  8#hex. 2 Heat, 1 Damage. Pierces on crits, roll for the next enemy in line. Ignore cover.
- *FLAMETHROWER*. 1 Slot, 4#hex, 1 Heat. Fires in a cone. Targets gain +3 Heat. +1 more Heat on a crit.

== Specials

Takes 1 slot. Activating requires 1 action. If reactive, takes 1 action from the next turn.


== Mods

Sometimes you want to give your Mech a little more _zing_. Only
one Mod can be installed at a time. Make them count.

== Taking Turns

Each Mech has 3 actions on its turn. An action can be spent...

- Firing a weapon.
- Brawling in close combat.
- Moving around.
- Activating specials.
- Venting some heat to cool down.

Actions can also be spent out of turn on activating passive reactive specials.

=== Rolling

When asked to roll dice tally your boons and banes.

Ok, I will write this out properly later. In general the formula is...

$#text()[Dice Amount] = 1 + min(1, |#text()[Advantage] - #text()[Disadvantage]|)$

If more advantage than disadvantage pick the highest, otherwise pick the lowest. That's your result.

1, 2 and 3 are failures. 4 and 5 are successes. 6 is a _critical_ success. On a critical success something extra might happen.

=== Line of Sight

When a direct line can be drawn from your Mech's #hex to another #hex the Mech is considered to have _line of sight_ to it or simply _see_ it.  

If a direct line of sight can be drawn from the Mech or any of the Mech's deployable, it is considered to _sense_ it or have it _within sensor distance_.

=== Knock-back

Some weapons will stagger you Mech. When taking knock-back move your Mech the corresponding amount of #hex away from the attacker.

If a wall is in the way take damage equal to the remaining knockback.

== Firing

Chose a weapon. Each weapon may only fire once per turn.

Pick a space in your line of sight, doesn't have to be occupied by anything.

Roll to hit. On a success deal the described damage and apply any effects.

== Brawling

When two Mechs are adjacent they are considered to be in close combat. The attacker may roll to hit for 1 Damage for 2 Heat. If the damage goes through apply 2#hex knockback.

== Moving

You may move up to your Mech's Movement in #hex. Going up one elevation level counts as 1#hex of movement.

== Venting

Remove 2 Heat.

== Ending a Turn

When a Mech has exhausted all its actions or the player voluntarily decides to it may end its turn. When ending a turn it may _Vent_ or go into _Overwatch_.

*Venting* halves the Mech's current heat.

Going into *Overwatch* puts the Mech in "high-alert" mode. If any enemy enters its firing range within its line of sight vision it may perform a reaction shot. Fire like the Mech would on its turn and subtract one action from its next turn. You use your Overwatch shot only once.

== Overheating

When a Mech reaches its Maximum heat, immediately roll on the Overheat
table and take 1 Damage. Add the amount of Heat over Mech's
maximum heat capacity to the roll.

#table(
  columns: (auto, 1fr), 
  inset: 5pt, 
  align: horizon, 
  table.header([*d*], [*Effect*]),
  [1], [Weapon Misfire, fire a random weapon in a random direction], 
  [2], [Vulnerable, add +1 to any Damage taken until next turn], 
  [3], [Locomotion Damaged, half the movement until the next turn], 
  [4], [Immobilized, may not move until next turn], 
  [5], [Shutdown, may not perform any actions except activating Specials or Mods until next turn], 
  [6], [DETONATION, Blast radius of 4#hex. Roll and deal the number +1 Damage and Heat to everything in the blast area. Targets roll, save on a critical success.]
)

== Half-cover

If an object is partially obscured by something the attacker gains Disadvantage on any attack.

If the attacker and target are adjacent the attacker does not gain cover.

== Elevation

Mechs on high ground gets Advantage against all Mechs lower than them. 

Mechs on low ground gets Disadvantage against all Mechs higher than them.

A Mech on a higher elevation can see the Mechs in the lower elevation only if they are on the edge of that respective elevation.

#design[Incentivizes pushing and gives an advantage to aggressive Mech builds. Very good at counting sniper positions.]
If a Mech on a lower elevation stands on the higher elevation it can see it entirely.

== Credits

Thanks to Unai, Kartik, Shannon and Noah for play-testing and contributing ideas.
