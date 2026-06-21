+++
title = "The network that survives the move"
date = 2026-06-18
dispatch_no = "No 03"
dek = "Infrastructure that breaks the moment you unplug it was never infrastructure. It was a magic trick with good lighting."
categories = ["HOMELAB"]
tags = ["homelab", "resilience", "portability", "infrastructure", "backups", "out-of-band", "change-control"]
+++
The real test of infrastructure isn't whether it works. It's whether it works after someone unplugs it, ships it across the state, and hands it a different internet connection.

Most homelabs fail that test. They're tuned to one address, one ISP, one static gateway someone typed in at 2am and never wrote down. Pretty. Fragile. The day the wiring changes the whole thing falls over, and the person who built it spends a weekend on the floor with a console cable, rediscovering settings they should have documented the first time.

I build for the move. Not because I move constantly — because a rig designed to survive relocation also survives the dead drive, the dropped ISP, the 3am outage. Portability and resilience are the same discipline wearing different masks. This is Vol. 002, so let me show you the mask I wear when I build.

## Assume the floor moves

Start from a hostile premise: the environment will change without warning. The power blips. The upstream provider hands you a new address. A disk that passed every check yesterday throws errors today. Build like all of that is scheduled, because eventually it is.

That premise kills a lot of bad habits. You stop hardcoding the things that aren't yours to hardcode.

> Anything you typed in by hand is a single point of failure wearing a clever disguise.

## Don't pin what the world owns

The cleanest example is the WAN. A lab that hardcodes its upstream gateway is married to one ISP at one location. Let the edge **learn** its gateway from DHCP instead, and the same box that worked behind one provider comes up clean behind another with no edits. You don't own that address. Stop pretending you do.

Same logic, one layer in: don't scatter raw addresses through every config. Reference things by name, by role, by alias — so when the underlying number changes, you change it once. Hostnames over hardcoded IPs. Roles over machines. The map should describe what a thing *is*, not which socket it happened to sit in.

## No single point of failure — including you

The honest failure mode in most home setups isn't a server. It's the one path in. One key on one laptop, and if that laptop is across the room from the rack that's down, you're locked out of your own house.

Design access in tiers, each independent of the last:

| Tier | Path | Survives |
| --- | --- | --- |
| 1 | Primary key, normal route | The happy day |
| 2 | Backup credential, alternate route | A lost key |
| 3 | Out-of-band console | The network being down |

If tier 1 dies, tier 2 carries it. If the whole network's dark, tier 3 — a console that doesn't care whether routing works — gets you in anyway. Access should never depend on the thing you're trying to fix being healthy. That's the trap: needing the network to fix the network.

The same shape applies to services. A second instance that quietly takes over isn't paranoia. It's the difference between a hiccup and a long night.

## Backups you've actually restored

A backup you've never restored is a rumor. Encrypt them — they leave the building, they ride a cloud, they live somewhere that isn't the rack — and then *test the restore*, on purpose, before the day you need it. The restore is the product. The backup is just the receipt.

## Documentation is the operating manual

This is the part people skip because it isn't fun. Write it down anyway. When something's down and the clock's running, memory is the first thing to fail. The map, the runbook, the if-this-then-that — that's what lets you act instead of reverse-engineer your own setup under pressure. Future-you, at 3am, on one bar of signal, is the user you're writing for. Be kind to that person.

And every risky change gets a way back before it goes in. A config backup. A fallback route. A timer that reverts you if you don't check in. You change things knowing you can undo them — which, paradoxically, is the only state in which you change things calmly.

---

Here's the heel turn nobody expects: none of this is about disaster. It's about contempt for the leash. A rig that survives the move doesn't tie you to a room. Relocate, switch providers, lose a drive, and keep running — 限定 to no one's permission but your own. The infrastructure stops being a thing you tend and becomes a thing you trust.

One run. No restock. Build it so it follows you anywhere.
