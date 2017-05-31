/load .tf/iom.tf

/def -p1 -mglob -t'You *stab *in the *.' re_stab = !use stab

;Set Status bar
/status_add -A@world -s1 -x acro:4
/set acro Acro
/status_add -Aacro -s1 -x limber:6
/set limber Limber

;RDMP Status Setup
/status_rm hit_points
/status_add -Alimber -s1 -x hit_points:10:BCblue
/status_rm spell_points
/status_add -Ahit_points -s1 -x spell_points:10:BCblue
/status_rm endurance_points
/status_add -Aspell_points -s1 -x endurance_points:10:BCblue
/status_rm my_hunger
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_rm mon_health
/status_add -Amy_hunger -s1 -x mon_health:3:BCred

;Fkeys
/def key_f2=!use acrobat stance
/def key_f3=!use limber up
/def key_f4=!use backstab at a x
/def key_f5=!use stab
/def key_f6=!use stab at a x
/def key_f9=!cast touch of darkness at me

;Never underestimate the sneakyness
/def -aCmagenta -p1 -mglob -t'You manage to conceal your skill using.'
/def -aCmagenta -p1 -mglob -t'You are ready to perform your skill. (concealed)'
/def -aCblack -p1 -mglob -t'A shadow encircles you, seeming to replenish some of your health.'
;Tricky!
/def -p1 -mglob -t"You say 'Hey you, what are you doing?! Can't we all just get along??'" re_ft = !use fast talk
/def -p1 -mglob -t'You try to confuse *, but fail.' re_ft1 = !use fast talk

;Prots
/def -p1 -mglob -t'You enter an acrobat stance.' acro_up = /status_edit acro:4:BCGreen
/def -p1 -mglob -t'You feel your body control return to normal.' acro_down = /status_edit acro:4:BCRed
/def -p1 -mglob -t'You do some stretching exercises.' limber_up = /status_edit limber:6:BCGreen
/def -p1 -mglob -t'You feel your muscles tighten up.' limber_down = /status_edit limber:6:BCRed
/def -p1 -mglob -t'You slip into the shadows.' hide_up = !%{prot_chan} Hide [Up]
/def -p1 -mglob -t'You are no longer hidden.' hide_down = !%{prot_chan} Hide [Down]
/def -p1 -mglob -t'You feel more stealthy.' stealth_up = !%{prot_chan} Stealth [Up]
/def -p1 -mglob -t'You feel less stealthy.' stealth_down = !%{prot_chan} Stealth [Down]
/def -p1 -mglob -t'You feel shadows surround you and solidify to form a shield!' fs_up = !%{prot_chan} Fluttering Shadows [Up]
/def -p1 -mglob -t'You feel the shadows disappear from your body.' fs_down = !%{prot_chan} Fluttering Shadow [Down]

;weapon buffs
/def -p1 -mglob -t"Demon slicer glows briefly as poison is applied to it." poi_up = !%{prot_chan} Poison [Up] On Slicer
/def -p1 -mglob -t"Demon slicer loses its light aura." sw_down1 = !%{prot_chan} Sharpen Weapon [Down] on Slicer
/def -p1 -mglob -t"Demon slicer loses the last bits of poison covering it." poi_down = !%{prot_chan} Poison [Down] on Slicer
/def -p1 -mglob -t"Lurker's Kukri glows briefly as poison is applied to it." poi_up1 = !%{prot_chan} Poison [Up] On Kukri
/def -p1 -mglob -t"Lurker's Kukri loses its light aura." sw_down = !%{prot_chan} Sharpen Weapon [Down] on Kukri
/def -p1 -mglob -t"Lurker's Kukri loses the last bits of poison covering it." poi_down1 = !%{prot_chan} Poison [Down] on Kukri
/def -p1 -mregexp -t"You concentrate your mind over (.*) and invest it with enhanced powers." sw_up = !%{prot_chan} Sharpen Weapon [Up] on %P1

;Stretch it
/set shadNum 1st
/def -p1 -mglob -t"You feel your shadow growing!" re_st = /if ({re_st} == 1) !use stretch shadow at %shadNum shadow%;/endif
