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

// ideas:
// concentration

#let hex = sym.hexa.stroked
#let heat = sym.triangle.stroked.rounded
#let los = sym.angle.spheric
#let push = sym.arrow.r.quad
#let damage = sym.Chi
#let radius = sym.circle.stroked

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

- 18 Hull Points (HP), how tough your mech is
- 3 Movement (M), how fast your mech moves
- 3 Load (L), how much your mech can carry

You can buy/sell 2HP and 1 Load for extra 1 Movement. For example, you sell 2HP and 1 Load for a movement,
so now you get a 16 Hull / 4 Move / 3 Load.

== Equipment

Your Mech can bear 2 types of equipment: *Weapons* and *Specials*. They take 1 Load. No repeats.

== Taking a Turn

1. Choose a Mech to activate that wasn't activated before.
2. Perform as many actions as you wish. You can...
  - *Shoot* a visible Mech.
  - *Punch* an adjacent Mech.
  - *Move* to available spaces.
  - *Activate* your equipment.
3. When done, *Vent* or *Overwatch*.
4. Pass the turn to the next person.
5. Repeat until someone wins.

=== Rolling

Roll a standard dice. 

#sym.die.one, #sym.die.two and #sym.die.three are failures. #sym.die.four and #sym.die.five are successes. #sym.die.six is a _critical success_. 

On a _crit_ something extra might happen.

=== Line of Sight

Two positions are visible if there exists a straight line from one to the other. 

=== Pushing

Move the target away from the attacker by the specified amount in #hex. Shown with the #push symbol.

If a wall is in the way take damage equal to the remaining push.

If another Mech is in the way, they both move as if pushed.

=== Taking Damage and Heat

Heat (#heat) and Damage (#damage) grow against your Hull. If they overlap the Mech _Overheats_.

== Turn

=== Shooting <shooting>

Choose a weapon. Pick a #los #hex within range. Apply effects described on the weapon.

If the space is occupied by a Mech it may dodge. For that do a roll. Ignore effects on success.

=== Punching

Choose an adjacent #hex.
Gain 3#heat, deal 1#push 2#damage.

If the space is occupied by a Mech it may dodge. For that, do a roll. On a success no effects are applied.

=== Moving

Move your Mech by one #hex for each Movement it has or less. Gain 2 #heat.

=== Activating

Perform the action described on the ability. An ability may only be used once per activation.

=== Reactions

A reaction is formatted as "_A trigger_. An effect". 
After the event described on the trigger has happened the event is activated.
Reactions are executed in turn order around the table.

=== Deployables

A _deployable_ can be placed with an action. They occupy a #hex and block line of sight. They have 1 Hull and are destroyed if taking damage or an effect. They never roll to evade. They are immune to heat. Only one deployable from an ability may be active at a time.

=== Venting

Remove 6 #heat.

=== Overwatching

Remove 2 #heat. If a Mech enters a Weapon's range you may fire that weapon. Follow the rules for #link(<shooting>)[_shooting_].

The weapon is considered fired for the next activation.

== Overheating

When #heat and #damage overlap the Mech overheats. Roll the amount of dice equal to overlap. Take the lowest. On a success remove all overlap.

An Overheating Mech explodes. All mech in 4#radius evade on a crit. Otherwise they take 3X and 2#heat. 

=== Conditions

Conditions effect Mechs temporarily. They are written as "Name X", where X is the number of activations that this effect sustains. All conditions tick down at the end of an activation.

- *Burn X*. When ending an activation gain 1#heat and 1#damage. 
- *Exposed X*. Roll an extra dice for all attempts to dodge. Take lowest. The condition is automatically removed when the Mech takes damage.

Conditions do not stack. Instead chose the highest number.

=== Difficult Terrain

Terrain can obstruct your movement.

- Moving in or out of water is an equvialent of a Movement action.
- Moving up an elevation requires an additional move.

== Takesies-backsies

Any actions may be rolled back up to a dice roll.

== Credit

Thanks to Robert, Unai, Kartik, Shannon and Noah for play-testing and contributing ideas.
