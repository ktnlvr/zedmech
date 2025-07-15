#import "@preview/bob-draw:0.1.1": *

#set page("a5", background: image("assets/backdrop.png", fit: "stretch"))
#set document(author: "Artur Roos", title: "Zedmech")
#set text(font: "Inter", size: 14pt)

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
#let heat = sym.triangle.stroked.rounded
#let los = sym.angle.spheric
#let push = sym.arrow.r.quad
#let damage = sym.crossmark

#let half = str.from-unicode(0xBD)
#let thirds = str.from-unicode(0x2154)

#align(center)[#render(```

 ___  ___  ___| _ _  ___  ___ |___ 
 __/ |___)|   || | )|___)|    |   )
/__  |__  |__/ |  / |__  |__  |  / 
                                   

```)]

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

== Specials & Specials

Takes 1 slot. Activating requires 1 action. If reactive, takes 1 action from the next turn.

A Mod also takes 1 slot. Only one Mod can be installed at a time. Make them count.

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

#sym.die.one, #sym.die.two and #sym.die.three are failures. #sym.die.four and #sym.die.five are successes. #sym.die.six is a _critical success_. 

On a _crit_ something extra might happen.

=== Line of Sight

Two positions are visible (#los) if there exists a straight line from one to the other. 

=== Pushing

Move the target away from the attacker by the specified amount in #hex. Shown with the #push symbol.

If a wall is in the way take damage equal to the remaining push.

=== Taking Damage and Heat

Heat (#heat) and Damage (#damage) grow against your Hull. If they overlap the Mech _Detonates_.

== Turn

=== Shooting <shooting>

Choose a weapon. Pick a #los #hex within range. Apply effects described on the weapon.

If the space is occupied by a Mech it may dodge. For that do a roll. Ignore effects on success.

=== Punching

Choose an adjacent #hex.
Gain 1#heat, deal 1#push 2#damage.

If the space is occupied by a Mech it may dodge. For that, do a roll. On a _critical success_ no effects are applied.

=== Moving

Move your Mech by one #hex for each Movement it has or less. Gain 2 #heat.

=== Venting

Remove 3 #heat.

=== Overwatching

Remove 1 #heat. If a Mech enters a Weapon's range you may fire that weapon. Follow the rules for #link(<shooting>)[_shooting_].

The weapon is considered fired for the next activation.

== Overheating

When #heat and #damage overlap the Mech overheats. Roll the amount of dice equal to overlap. Take the lowest. On a success remove all overlap.

== Credit

Thanks to Robert, Unai, Kartik, Shannon and Noah for play-testing and contributing ideas.
