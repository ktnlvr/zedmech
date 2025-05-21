#set page("a5", background: image("assets/backdrop.png", fit: "stretch"))
#set document(author: "Artur Roos", title: "Zedmech")
#set text(font: "Exo 2", size: 12pt)

#let cheatsheet = false
#let verbose-math = false

#let secret(body) = if cheatsheet [
  #text(font: "New Computer Modern")[#body]] else []

#let verbose(body) = if verbose-math [#secret(body)] else []

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

== Weapons

- *CANNON*. 1 Slot, 8#hex, 2 Heat, 2 Damage, Knock-back.
- *CRYO*. 1 Slot, 8#hex, 1 Heat, 1 Damage. Decrease enemy movement by 1 for 1 turn.
- *HEAVY*. 2 Slots, 9#hex, 2 Heat, 3 Damage, 2 Knock-back. Takes an action to reload.
- *ROCKET*. 1 Slot, 6#hex. 2 Heat, 1 Damage. Blast radius 1#hex.
- *LASER*. 1 Slot, 18#hex. 2 Heat, 1 Damage. Pierces on crits, roll for the next enemy in line. Ignore cover.
- *FLAMETHROWER*. 1 Slot, 4#hex, 1 Heat. Fires in a cone. Targets gain +3 Heat. +1 more Heat on a crit.

== Specials

Takes 1 slot. Activating requires 1 action. If reactive, takes 1 action from the next turn.

=== Escalation
Gain +1 to hit every time you critically hit. Resets on a miss.

#secret[
  $t = #text[Turn Number]$

  
  $b_t = #text[Bonus Damage at turn] t$
  
  $E(b_t) = #text[Expected Bonus Damage on turn] t$

  $E[B_t] = #text[Expected Bonus Damage _accumulated_ by turn] t$

  $E[B_t] = sum_i E[b_i] $ by linearity

  $ b_0 = 0, E[b_0] = 0 $
  
  1. With $P = 1/6$ crits: $b_t = b_(t-1) + 4$ 
  2. With $P = 3/6$ hit, so: $b_t = b_(t-1)$
  3. With $P = 2/6$ misses: $b_t = 0$

  $ E[b_t] &= 2/6 dot 0 + 4/6 (E[b_(t-1)] + 1/6 dot 1)\
          &= 4/6 E[b_(t - 1)] + 4/36\
          &= 2/3 E[b_(t - 1)] + 1/9 $
          
  $ therefore $

  //$r = lim_(t arrow infinity) (E[b_t]) / (E[b_(t - 1)]) = 3/2$

  $ Delta E[b_t] &= E[b_(t + 1)] - E[b_(t)]\
            &= 2/3 E[b_(t)] + 1/9 - E[b_t]
            &= 1/9 -1/3E[b_t] $

  $ Delta E[b_t] + 1/3 E[b_t] = 1/9 $

  #verbose[
    $ e^(integral 1/3 d t)  &= e^(t/3) \ 
      e^(t/3) E[b_t]
    
    $
  ]
]

=== Assault Weapon
On a critical hit you may try to fire again at a different target. Can not be repeated more than once per turn.

=== Active Chamber
On a miss once per turn you may spend the same price in Heat to shoot from the same gun at another target.

=== Homing Shots
For 1 Heat fire at a target within half range. Ignore all advantage and disadvantage.

=== Heat Sinks
Has 2 extra heat capacity.

=== Shield
Reduce incoming damage by 1, but not lower than 0. Ignored on crits.

=== Molten Core
When heat is above #half gain Advantage on firing.

=== Stabilized
When knocked back you may decide to be knocked back diagonally.

=== Leap Springs
Ignore 1#hex obstacle or difficult terrain per movement. You may not end a movement in an obstacle.

=== Nitro
Move extra 2#hex per movement.

=== Beacon

If a target is in cover to you, but not to any of your deployables - ignore cover.

=== Gauss Hook

Instead of knock-back pull an enemy towards yourself. Knock-back rules apply as if the enemy is being knocked-back from the opposite direction.

=== Cloak

Disadvantage to any long-range (1#hex or more) attacks against a Mech if it didn't move during this and previous turns.

=== Recoil Inverter

After knocking back an enemy move 1#hex in the opposite direction.

=== Thrusters

After moving 3#hex or more gain Advantage to hit in close combat. Does not stack.

=== Repulsion Well
At the end of Mech's turn if took damage knock-back all adjacent Mechs by 1 #hex.

=== Hunter Mode

After destroying a Mech regain 1 HP and optionally immediately move 2 #hex.

=== Kinetic Convertor

Gain 1 free movement on the next turn after getting knocked back.

=== Pathfinder Override

If you are not ending movement in difficult terrain you may ignore all effects, but gain 1 Heat per movement.

=== Echo Barrage
On a critical hit you may redirect the effects to an enemy within 3#hex. On an ordinary hit you may roll to hit again.

=== Gravity Well

2 Heat. Chose a visible point within 5#hex. All units in a 2#hex radius are pulled 2#hex to the center. Gain 1 Heat per unit moved.

=== Lockstep Sync

When another Mech fires its Overwatch you may fire too. Applies to both friendly and enemy Mechs.

=== Sensor Bait

Advantage against Mechs that targeted this Mech last turn.

=== Reactive Mesh

Every time you would take knock-back ignore it and gain 1 Heat and an advantage to your next roll instead.

=== Loud Comms

2 Heat. Allied Mechs within 3#hex gain Advantage on all their attacks. Allied Mechs outside gain Disadvantage on all their attacks.

=== Turret
1 Heat. Use once. One action. Spawn a 3HP/3H/0M/0S turret with 2 Actions per turn on an adjacent #hex. Activates separately.

=== Repair Kit
1 Heat. Use once. Target the activating Mech or a Mech visible to sensors. Recover 2HP.

=== Plasma Wall
1 Heat. Only one wall of the same Mech may exist at a time. Place 2x1 immobile wall within 6#hex sensor distance. Disappears when the Mech loses sensor visibility of it or when hit once.

=== Deployable Drone
1 Heat. Roll. On a success place a small drone on an adjacent #hex. It activates with this Mech. Considered to be 2HP/4H/4M/0S with a Cannon. Activates on the same turn as the creator Mech and uses its actions, but all the drones activate at once. Destroyed when overheating. A Mech may only have (HP / 2 - 1) drones at a time.

=== Decoy
2 Heat. Use once. Place a decoy within Mech's line of
sight. When an enemy can see both the Mech and the Decoy it
may only attack the decoy. Destroyed when hit once.

=== Lock In
2 Heat. Chose an enemy Mech visible to the sensors. All attacks against them from allied Mechs gain Advantage until your next turn.

=== Blink Engine
2 Heat. Teleport 3#hex in any direction through any obstacles. Does not count as movement.

=== Overcharged Lance
5 Heat. Once per turn. Fire a beam of up to 12#hex dealing 2 Damage. Ignore cover.

=== Thermal Bloom
2 Heat. Choose a spot within 6#hex. All mechs within 3#hex gain 1 heat. Add 2 more heat if they end their turn in that area. 

=== Collapse Mode

If you critically hit an enemy they can not enter Overwatch on the next turn.

=== Fire!
Mech fires all weapons at once.

=== Optical Flare
2 Heat. Choose 2#hex blast radius within 7#hex. Enemies in that area suffer Disadvantage on all attacks until your next turn.

== Mods

Sometimes you want to give your Mech a little more _zing_. Only
one Mod can be installed at a time. Make them count.

=== Adaptive Logic Core

Once per turn you may reroll a miss. On a hit gain the heat again.

//=== Molten Core

//=== Shadow Step

=== Nanites

Must have at least 2 deployables. Once per turn. Destroy all deployables and vent the equivalent in Heat.

=== Overload Sigil

Once per game. Immediately DETONATE when overheated. Vent all remaining 

=== Motor Furnace

Once per turn, when getting 1 Heat convert it into 1#hex of free movement.

//=== Blazing Matrix

=== Supression Protocol

The target takes 1 Damage for every layer of elevation they lose due to knock-back from your attack.

=== Hexdense Plating

Once per turn convert incoming damage into heat and take knock-back equal to damage.

=== Reactive Overdrive

If you end your turn above #half your heat capacity gain 1#hex of free movement and immediately vent 1 Heat.

=== Gratitude Circuit

When landing a critical heat immediately vent 1 Heat.

=== Havoc Driver
After destroying a Mech immediately fire a weapon.

=== Quantum Double
Every weapon fires twice for the same Heat. If either shot fails take 1 Damage and 1 Heat.

=== Magnetic Resonance.
3 Heat. Force a target in line of sight to roll on the
Overheat table for any effect except DETONATION.

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

$#text()[Dice Amount] = 1 + |#text()[Advantage] - #text()[Disadvantage]|$

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

When two Mechs are adjacent they are considered to be in close combat. The attacker may roll to hit for 1 Damage. If the damage goes through apply 2#hex knockback.

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
  [5], [Shutdown, may not perform any actions except activating Equipment or Mods until next turn], 
  [6], [DETONATION, Blast radius of 4#hex. Roll and deal the number +1 Damage and Heat to everything in the blast area. Targets roll, save on a critical success.]
)

== Half-cover

If an object is partially obscured by something the attacker gains Disadvantage on any attack.

If the attacker and target are adjacent the attacker does not gain cover.

== Elevation

Mechs on high ground gets Advantage against all Mechs lower than them. 

Mechs on low ground gets Disadvantage against all Mechs higher than them.

A Mech on a higher elevation can see the Mechs in the lower elevation only if they are on the edge of that respective elevation.

#pagebreak()

#align(center + horizon)[This page intentionally left blank.]

#pagebreak()

#align(center)[#text(size: 24pt)[*Zedmech: Designer's Codex*]]


1. *No Redundancy.* Avoid functional overlap unless it introduces a new synergy or cost. Variants of the same thing must interact with different abilities similarly.
2. *Multiplicative Complexity.* Every ability should feed into an existing system, not into another specific ability. Every ability should feel like it works well with something else. No ability should bypass systems.
3. *Heat = Power + Risk*. Abilities that cost _heat_ should be risky, but more powerful. Being dangerous should be encouraged.
4. *Space is Valuable*. Abilities should care about distances, obstacles, adjacency and so on. Avoid global effects.
5. *Thematic Clarity*. Vortices should pull and distort, cannons should shoot, fire must burn and heat things up. The ability's name and flavoring should somewhat aligned and intuitive, not opaque.
6. *Prefer Input Randomness*. Favor random outcomes that are opt-in. Risky skills should be optional, but encouraged and rewarded.
7. *Pink Noise*. Small random outcomes should be more likely than large ones. Big events must be unexpected.
8. *5 Seconds per Skill.* Every feature should be explainable in 5 seconds. Cut it out or rewrite it otherwise.
