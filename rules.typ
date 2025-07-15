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
// abilities that increase range

#let hex = sym.hexa.stroked

#let half = str.from-unicode(0xBD)
#let thirds = str.from-unicode(0x2154)

#align(center)[#text(size: 24pt)[*Zedmech*]]

#outline()
#pagebreak()

A simple rule set for hex-based tabletop mech fighting game. Hackable, simple, quick.

Inspired by #link("https://berserkerworks.itch.io/mek28")[Bill Ward's  Mek28].

== Assembling

Every mech starts with...

- 7 Hull Points (HP)
- 4 Movement (M), measured in #hex
- 3 Slots (S)
- 1 Mod

You can buy/sell 2HP and 1 Slot for 1 Movement.

```
A: I want a quick Mech, so I will drop 2 HP and gain 1 movement and 1 slot. That makes a 5HP/5M/4S Mech.
```

== Heat

Heat grows against your Hull. If one overflows into another your mech _Detonates_.


== Specials

Takes 1 slot. Activating requires 1 action. If reactive, takes 1 action from the next turn.

== Mods

Sometimes you want to give your Mech a little more _zing_. Only
one Mod can be installed at a time. Make them count.


== Taking a Turn

1. Choose a Mech to activate that wasn't activated before.
2. Perform as many actions as you wish. You can...
  - *Shoot* a visible Mech.
  - *Punch* an adjacent Mech.
  - *Move* to available spaces.
3. When done, *Vent* or *Overwatch*.
4. Pass the turn to the next person.


=== Rolling

Roll 1 dice. 

1, 2 and 3 are failures. 4 and 5 are successes. 6 is a _crit_. On a _crit_ something extra might happen.

=== Line of Sight

Two Mechs are in line of sight if a straight line can be drawn from one to the other.

=== Knock-back

Move the target away from the attacker by N #hex.

If a wall is in the way take damage equal to the remaining knock-back.

== Turn

=== Shooting <shooting>

Choose a weapon. Pick a #hex in your line of sight. Apply effects described on the weapon.

If the space is occupied by a Mech it may dodge. For that do a roll. Ignore effects on success.

=== Punching

Chose an adjacent #hex. 1 _Knock-back_, 2 _Damage_. _+1 Heat_.

If the space is occupied by a Mech it may dodge. For that, do a roll. On a _critical success_ no effects are applied.

=== Moving

Move your Mech by one #hex for each Movement it has or less. _+2 Heat_.

=== Venting

Remove _3 Heat_.

=== Overwatching

Remove 1 Heat. If a Mech enters a Weapon's range you may fire that weapon. Follow the rules for #link(<shooting>)[_shooting_].

The weapon is considered fired for the next activation.

== Overheating

When Heat and Damage would overlap the Mech overheats. Roll the amount of dice equal to overlap. Take the lowest. On a success remove all overlap.

== Credit

Thanks to Robert, Unai, Kartik, Shannon and Noah for play-testing and contributing ideas.
