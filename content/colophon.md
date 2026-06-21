+++
title = "Colophon"
date = 2026-06-20
layout = "page"
eyebrow = "HOW IT'S BUILT"
dek = "The wiring behind Cheese Violence — the stack, the palette, the type, and the rule that governs all of it."
tags = ["colophon", "design", "static-site", "typography", "brand"]
+++
Every site is a confession. This is the part where I show you the wiring.

## The stack

Hugo. Static output, no database, no backend to compromise — there's nothing here to breach but a bag of HTML files. That's the point. The whole thing builds in the time it takes to pour a coffee, ships as flat files, and gets thrown to the edge by a CDN. Cutting the runtime cuts most of the attack surface — not all of it; DNS, TLS, the edge, and the build chain are still real. But there's no app server here to own. A honeypot wants something to hit. This gives them a wall.

The theme is hand-built. No starter, no marketplace skin, no borrowed grid. I'd rather own every line than inherit somebody else's defaults and spend a week deleting them. It's slower. It's also mine.

## The look

A near-black void, because everything reads louder in the dark. On top of it, two colors that don't apologize:

| Token | Hex | Job |
|---|---|---|
| Brand gold | `#C9A84C` | filigree, accents, the heel's crown |
| Blood red | `#D4001A` | alarms, hover, the wound |
| Bone paper | `#EDE6D6` | the text that has to survive the void |

Hard edges everywhere. No soft shadows, no rounded corners begging to be liked — brutalist, square, load-bearing. The corners are sharp on purpose.

And the holes. The Swiss-cheese motif runs through the whole system: punched circles in the dividers, the bullets, the framing. Cheese holes that read as bullet holes if you stand at the right angle. Funny and menacing, same shape. That's the brand in one glyph.

## The type

> Three voices, three jobs, no overlap.

**Bebas Neue** for the masthead — tall, condensed, shouting from the marquee. **Inter** for the body, because the joke only works if you can actually read it. **Space Mono** for the machine voice: timestamps, build IDs, the cold parts. When the site needs to sound like a terminal, it switches to mono and drops the act.

## One run, no restock

The merch rule applies to the code. Build it right, ship it once, don't endlessly fiddle. I'd rather ship a deliberate thing and move than respin forever. Documentation is the operating manual — if it isn't written down, it didn't happen.

Built by N0CS, with a machine at the other end of the wire. 個人誌.

One run. No restock.
