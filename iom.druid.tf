/load ~/.tf/iom.tf
/set heal_targ me

;Familiar crapola
/set omg 0
/def -p1 -mglob -t"Your familiar's name is now Wolf." wolf_name = /if ({omg} = 1) /eval !do order 1st wolf follow;order 1st wolf name Herp%;/set omg 0%;\
	/else /eval !do order 1st wolf follow;order 1st wolf name Derp%;/set omg 1%;\
/endif
/def -p1 -mglob -t"Your familiar's name is now Eagle." eagle_name = !do order eagle follow;order eagle name Fawkes
/def -p1 -mglob -t'You kneel down on the earth and pray briefly. *' dryad_name = !do order dryad follow;order dryad name Roflcopter

;Druid blasts
/def -p1 -mglob -t"You mutter the words 'dfjize ezihfo'" re_hurl = !cast hurl rock
/def -p1 -mglob -t"You mutter the words 'mhoortehl zaap'" re_zap = !cast call lightning
/def -p1 -mglob -t"You mutter the words 'zrna iivy ahro'" re_dart = !cast poison dart
/def -p1 -mglob -t"You hardly touch * with your staff bash." re_bash0 = !use soil staff bash
/def -p1 -mglob -t"You barely graze * with your staff." re_bash1 = !use soil staff bash
/def -p1 -mglob -t"You slightly hit * with your staff. *" re_bash2 = !use soil staff bash
/def -p1 -mglob -t"You bash * with your staff, *" re_bash3 = !use soil staff bash
/def -p1 -mglob -t"You slam your druidic staff into * face, *" re_bash4 = !use soil staff bash
/def -p1 -mglob -t"You violently ram your staff into *" re_bash5 = !use soil staff bash
/def -p1 -mglob -t"You swing your staff and hit * with a TERRIBLE blow, *" re_bash6 = !use soil staff bash

;Druid Prots
/def -p1 -mglob -t'You create a whirling shield of soil around you!' ss_up = /status_edit soilshield:2:BCGreen
/def -p1 -mglob -t'You can be clearly seen again as the whirling soil shield around you disappears.' ss_down = /status_edit soilshield:2:BCRed
/def -p1 -mglob -t"Your face looks serene as it is filled by Nature's harmony." hon_up = /status_edit hon:3:BCGreen
/def -p1 -mglob -t"You look troubled as Nature's harmony leaves you." hon_down = /status_edit hon:3:BCRed
/def -p1 -mglob -t"You shimmer slightly as Gaia's blessing fills you." eog_up = /status_edit eog:3:BCGreen
/def -p1 -mglob -t"You look weak and frail as Gaia's blessing leaves you." eog_down = /status_edit eog:3:BCRed

/set eagle_sell=0
/def -p1 -mregexp -t'Fawkes gives you ([0-9]+) gold' eagle_sold = \
    /if (eagle_sell = "1") !party contribute %P1%; \
    /endif

;potions
/def -p1 -mglob -t'Your skin shimmers a while and seems to be hardened.' balm_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Prot Balm \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^
/def -p1 -mglob -t'Your skin seems to be soft again.' balm_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Prot Balm \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^
/def -p1 -mglob -t'You feel your wisdom and faith boosted by the potion!' pop_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Potion of the Priest \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^
/def -p1 -mglob -t'Your potion generated trance leaves you.' pop_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Potion \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

;Nomnom
/def -p1 -mglob -t"You mutter the words 'Tuorp sk'ci Uq!'" re_grow = \
/if (bot_food=1) /let food_time=$[rand(3,12)]%;/repeat -%food_time 1 !cast magical growth%;/endif

/set bot_food=0

;Druid keys
/set blastspell hurl rock
/def key_f2=!cast soil shield
/def key_f3=!cast harmony of nature
/def key_f4=!cast embrace of gaia
/def key_f5=!cast %blastspell
/def key_f6=!cast %blastspell at a x
/def key_f7=!cast %blastspell at 2nd x
/def key_f8=!cast %blastspell at 3rd x
/def key_f9=!cast gaian touch at %heal_targ
/def key_f10=!use drain soil energy
/def key_f11=!use soil staff bash

;Druid statusline
/status_rm soilshield
/status_add -A@world -s1 -x soilshield:2
/set soilshield SS
/status_rm hon
/status_add -Asoilshield -s1 -x hon:3
/set hon HoN
/status_rm eog
/status_add -Ahon -s1 -x eog:3
/set eog EoG
/status_add -Aeog -s1 -x  -s1 -x hit_points:10:BCblue
/status_add -Ahit_points -s1 -x spell_points:10:BCblue
/status_add -Aspell_points -s1 -x endurance_points:10:BCblue
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_add -Amy_hunger -s1 -x mon_health:3:BCred
