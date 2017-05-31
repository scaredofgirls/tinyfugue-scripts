/load .tf/iom.tf
/def key_f2=/sa a x
/def key_f3=!cast mend beast at me
/def key_f4=!cast balsamic bestial bath at me
/def key_f5=!use bite attack
/def key_f6=!use bite attack at a x
/def key_f7=!use claw attack
/def key_f8=!use claw attack at a x
/def key_f9=!use batter attack
/def key_f10=!use batter attack at a x
/def key_f11=!use hug attack
/def key_f12=!use hug attack at a x
;/def -b"^[OQ"=!cast mend beast at me

;Familiar naming crap.
/def -p1 -mglob -t"Your familiar's name is now Eagle." name_eagle = !do order eagle follow;order eagle name Fawkes
/def -p1 -mglob -t"Your familiar's name is now Bear." name_bear = !do order bear follow;order bear name Cuteninja
/def -p1 -mglob -t"Your familiar's name is now Falcon." name_faclon = !do order falcon follow;order falcon name Våffla
/def -p1 -mglob -t"Your familiar's name is now Wolf." name_wolf = !do order 1st wolf name rofl;order 2nd wolf name copter;order wolves follow

;Set eaglesell stuffs
/set eagle_sell=0
/def -p1 -mregexp -t'Fawkes gives you ([0-9]+) gold' eagle_sold = \
	/if (eagle_sell = "1") !party contribute %P1%; \
	/endif

;Attack skills
/def sa = !use bite attack at %*%;/qs !use claw attack
/def re_claw = !use claw attack

; Looks like this message is just an indicator that your bite is still up. Maybe something can be done though?
; /def -p1 -mglob -t'Jaws clenched, you rake * horribly with your sharp claws.' = /re_claw
/def -p1 -mglob -t'You rip at * with your claws, but only hit air.' = /re_claw
/def -p1 -mglob -t'You rip a hole in * side.' = /re_claw
/def -p1 -mglob -t'You tear * belly.  Blood and guts scatter everywhere.' = /re_claw
/def -p1 -mglob -t'You swing at *, connecting solidly.' re_batter = !use batter attack
/def -p1 -mglob -t'You swing at *, connecting very solidly. * is thrown backwards a few feet.' re_batter2 = !use batter attack

;Buffs
/def -p1 -mglob -t'You enter an acrobat stance.' acro_up = /status_edit acro:4:BCGreen
/def -p1 -mglob -t'You feel your body control return to normal.' acro_down = /status_edit acro:4:BCRed

;Status Bars
/set acro Acro
/status_add -A@world -s1 -x  -s1 -x acro:4
/status_add -Aacro -s1 -x  -s1 -x hit_points:10:BCblue
/status_add -Ahit_points -s1 -x spell_points:10:BCblue
/status_add -Aspell_points -s1 -x endurance_points:10:BCblue
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_add -Amy_hunger -s1 -x mon_health:3:BCred
