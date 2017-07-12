;Disable warning when I do things like esc+b
/set warn_5keys=off
;Disable Clock Display, gives more room on the status line, and my WM has a clock.
/clock off

;Disable activity/trigger notifcations on the status line.
/def -ag -h'ACTIVITY'
/def -ag -h'BGTRIG'
/status_rm @active

;Start logging
/eval /log %{log_dir}/iom/$[ftime("%F")]
/eval /log -i %{log_dir}/iom/$[ftime("%F")]

;Don't idle off ( Depricated by in game option to set your idle off time)
;/def -p1 -mglob -t'\[plaque\]: Updating guild plaques.' antiidle = !cough%;/repeat -1740 1 /eval !rltime
;/def -p1 -mglob -t'\[plaque\]: Updating combat plaques' antiidle2 = !rltime

;OMFG PANIC
/def -abBCcyan -p1 -mglob -t"\[event\]: Event 'clones' has started."
;run a script when this event runs. sends an email to my cell phone and plays an obnoxious song
; /def -p1 -mglob -t"\[event\]: Event 'Escape from Hell' has started." escape_me = /sys %{script_dir}/escape.sh

;Eat stuff (maybe)
/set aeat null
/def -p1 -mglob -t'You receive * exp.' autoeat = /if ({aeat} =~ "eat") !eat a corpse%;\
/elseif ({aeat} =~ "dig") !dig grave%;\
/elseif ({aeat} =~ "pres") !use death rites at 1st corpse%;\
/elseif ({aeat} =~ "spider") !order spider eat%;\
/elseif ({aeat} =~ "march") !use funeral march at a corpse%;\
/elseif ({aeat} =~ "soul") !cast imprison soul at a corpse%;\
/elseif ({aeat} =~ "eagle") !order eagle get all%;\
/elseif ({aeat} =~ "eagledig") !do dig grave;order eagle get all%;\
/elseif ({aeat} =~ "eagleeat") !do eat a corpse;order eagle get all%;\
/endif

/def -p1 -mglob -t'^Using your wooden staff of the necromancer you draw a conserving rune over * corpse, preserving it for later use.$' get_corpse = !order wilbur get a corpse%;/endif


;Highlights
/def -aBCmagenta -p1 -mglob -t'You prepare yourself to use a skill.'
;/def -aCmagenta -p1 -mglob -t'You are ready to perform your skill.'
/def -aBCmagenta -p1 -mglob -t'You begin to chant.'
;/def -aCmagenta -p1 -mglob -t'You finish the chant.
/load .tf/queue.tf
/newQueue -nspells
/set squeue 0
/def -aCmagenta -p1 -mregexp -t'^You (are ready to perform your skill\.|finish the chant\.)' cq = \
    /if (squeue == 1) \
        /qr -nspells%; \
    	/let this_spell=%{?}%; \
    	/if (this_spell != -1) \
    		/repeat -0.73 1 /eval %{this_spell}%; \
    	/endif%; \
    /endif


;Global Stuffs
/def -p1 -mregexp -t'[A-Za-z+] causes you to blurp out the word \'Tock\'\.' \
me_etock_up = !say \%^BOLD\%^CYAN\%^Etock \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'Your blood pressure returns to normal.' \
me_etock_down = !say \%^BOLD\%^CYAN\%^Etock \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You get a blank look, as if you forgot what you were about to do.' \
forget_up = !say \%^BOLD\%^I don't remember my skills and spells\%^RESET\%^
/def -p1 -mglob -t'You snap your fingers, as if remembering something important.' \
forget_down = !say \%^BOLD\%^I remember my skill and spells!\%^RESET\%^
;"Manual" reporting. Off by default.
/def -p1 -mglob -t'--------| New Round |--------' do_report = /if (report = "1") !report%;/endif%;/if (dobroom = "1") !wave broom%;/endif
/set report 0

;Ferries
/set do_ferries=1
/def -p1 -mglob -t'The ferry has arrived at North island dock.' sti2nti_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'Southcape clipper has arrived.' southcape2goss_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Dock of the southern seas.' southcape2goss_disemb = /if ({do_ferries} == 1) !do disembark;north%;/endif
/def -p1 -mglob -t'The Gnomish Airship descends slowly, landing here.' som2ica_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'Odd World Ferry has arrived.' gos2odd_emb = /if ({do_ferries} == 1) !embark%; /endif
/def -p1 -mglob -t'The ferry has arrived at Odd World Harbor.' gos2odd_disemb = /if ({do_ferries} == 1) !do disembark;east%;/endif
/def -p1 -mglob -t'The ferry has arrived at Ordinary Harbor.' odd2gos_disemb = /if ({do_ferries} == 1) !do disembark;south%;/endif
; The ferry has arrived at Ordinary Harbor.

/def -p1 -mglob -t'Open skies has arrived.' gos2ev_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Rough Trading Port.' eve2gos_disemb = /if ({do_ferries} == 1) !do disembark;out%;/endif
/def -p1 -mglob -t'The ferry has arrived at Dock of the Trading Post.' gos2ev_disemb = /if ({do_ferries} == 1) !do disembark;east%;/endif
/def -p1 -mglob -t'The ferry has arrived.' gos2eme_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Emerald Island Ocean Pier.' gos2eme_disemb = /if ({do_ferries} == 1) !do disembark;north%;/endif
/def -p1 -mglob -t'The ferry has arrived at Gossamer Island North Docks.' eme2god_disemb = /if ({do_ferries} == 1) !do disembark;south%;/endif
/def -p1 -mglob -t'Ethereal schooner, Mists has arrived.' gos2mist_emb = /if ({do_ferries} == 1) !embark%;/endif
;/def -p1 -mglob -t'The ferry has arrived at Harbor.' gos2mist_disemb = /if ({do_ferries} == 1) !do disembark;west%;/endif
/def -p1 -mglob -t'The ferry has arrived at Misty Harbor.' mist2gos_disemb = /if ({do_ferries} == 1) !do disembark;out%;/endif
/def -p1 -mglob -t'The ferry has arrived at Mists Harbor.' gos2mist_disemb = /if ({do_ferries} == 1) !do disembark;west%;/endif
/def -p1 -mglob -t'Darkcavern Isle Boat has arrived.' gos2dc_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Ferry Landing.' gos2dc_disemb = /if ({do_ferries} == 1) !do disembark;north%;/endif
/def -p1 -mglob -t'Little Wanderer has arrived.' gos2bvar_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Little Wanderer Pier.' gos2bvar_disemb = /if ({do_ferries} == 1) !do disembark;north%;/endif
/def -p1 -mglob -t'The ferry has arrived at Blackavar Ferry Dock.' bvar2gos_disemb = /if ({do_ferries} == 1) !do disembark;south%;/endif
/def -p1 -mglob -t'Trading barge, Hildebrand has arrived.' hyb2gos_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Bustling Trading Dock.' hyb2gos_disemb = /if ({do_ferries} == 1) !do disembark;south%;/endif
/def -p1 -mglob -t'Sombre Ferry has arrived.' somb2gos_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Small Port.' somb2gos_disemb = /if ({do_ferries} == 1) !do disembark;out%;/endif
/def -p1 -mglob -t'The ferry has arrived at Sombre Island Harbor.' gos2somb_disemb = /if ({do_ferries} == 1) !do disembark;out%;/endif
/def -p1 -mglob -t'The ferry has arrived at Gossamer Island/Darkcavern Isle Docks.' dark2gos_disemb = /if ({do_ferries} == 1) !do disembark;south%;/endif
/def -p1 -mglob -t'Twin islands barge has arrived.' gos2ti_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Beach pier.' gos2ti_disemb = /if ({do_ferries} == 1) !do disembark;e%;/endif
/def -p1 -mglob -t'Twin islands correctional express has arrived.' ti2facility_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Twin islands mainland dock.' ti2facility_disemb = /if ({do_ferries} == 1) !do disembark;%;/endif
/def -p1 -mglob -t'The ferry has arrived at Twin Islands Barge Dock.' = /if ({do_ferries} == 1) !do disembark;w%;/endif
/def -p1 -mglob -t'A shiny red sleigh attached to eight tiny reindeer comes to a stop at the dock.' cheer2star_emb = /if ({do_ferries} == 1) !do embark%;/endif
/def -p1 -mglob -t"The ferry has arrived at Santa's Star." cheer2star_disemb = /if ({do_ferries} == 1) !do disembark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Dock of Christmas Cheer.' star2cheer_disemb = /if ({do_ferries} == 1) !do disembark;south%;/endif
/def -p1 -mglob -t'Twin Islands hunting canoe has arrived.' nti2sti_emb = /if ({do_ferries} == 1) !embark%;/endif
/def -p1 -mglob -t'The ferry has arrived at South Island Dock.' nti2sti_disemb = /if ({do_ferries} == 1) !disembark%;/endif
/def -p1 -mglob -t'The ferry has arrived at Workshop.' talos2somb_disemb = /if ({do_ferries} == 1) !disembark%;/endi

/def -abBCcyan -p1 -mglob -t'The ocean waters begin to spin, forming a whirlpool!'
/def -abBCcyan -p1 -mglob -t'A whirlpool forms on the surface of the ocean.'

;Stuff to always do on (re)connect.
;;Set/Get RDMP Info.
;;Run "rltime" to start up the rltime loop I use for having a semblance of timestamps in logs.
;;Enable logging
/def -p1 -mglob -t'You enter Islands of Myth.' rdmp_on = !RDMP ON 9575%;!channels add %{prot_chan}%;/eval /log %{log_dir}/iom/$[ftime("%F")]%;/eval /log -i %{log_dir}/iom/$[ftime("%F")]%;!rltime
/def -p1 -mglob -t'A dark, sucking portal appears. You fall from it!' rdmp_on_ld = !RDMP ON 9575%;!channels add %{prot_chan}%;!on %{prot_chan}%;/eval /log %{log_dir}/iom/$[ftime("%F")]%;/eval /log -i %{log_dir}/iom/$[ftime("%F")]%;!rltime
/def -agGL -p1 -mregexp -t'RDMP 9575 HEALTH ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+)' \
my_rdmp_info = /set hit_points %P1(%P2)%;/set spell_points %P3(%P4)%;/set endurance_points %P5(%P6)%;/set my_hunger %P7
/def -agGL -p1 -mregexp -t'RDMP 9575 MONSTER_HEALTH ([\w|\s]+) ([0-9]+)' mon_rdmp_info = /set mon_health %P2
/def -agGL -p1 -mglob -t'RDMP 9575 TARGET_DEATH * died.' 
/def -agGL -p1 -mglob -t'RDMP 9575 MONSTER_DEATH * was killed by *.'


;Run rltime every 30 mins to keep a semblance of timestamps in the logs.
;Timer will be reset of "rltime" is run by hand.
/def -p1 -mglob -t'Mud Local time: *' do_rltime = /kill %rltimePID%;/set rltimePID $[repeat( "-1800 1 !rltime" ) ]

;Setup command to handle prots
/def prots = /quote -S \\!%{prot_chan} !%{script_dir}/prots "%*"
/def eq = converse%;/quote -dexec -S !%{script_dir}/eq '%{*}'%;.

;Repair
/def -p1 -mglob -t'Bifur gives * to you.' repair = /cq

;Racial stuff
/def -p1 -mglob -t'You choke on the air.' lizard_down = !%{prot_chan} You need water

;Crystal dragons
/def -p1 -mglob -t'* glances at you, and sends a stream of lava at you.' cdrag_pers = !p' Stupid dragon. Stupid lava. WOT DID I DO 2 U!!11oneone
/def -p1 -mglob -t'* spews forth lava, sending flaming goo everywhere!' cdrag_all = !p' How dare that bitch spew lava on us.

;Pull the lever to open the trapdoor for wyvern
/def -p1 -mglob -t'Something odd is happening, the room pulls up the lever.' pull_wyvern = !pull lever

;MI does this mind control thing to make you prot him or heal him etc .
/def -p1 -mglob -t'You lose control of your mind and body for a brief moment.' mind_control = say Asswipe is trying to mind control me!

;Yes, I suck
;/def -p1 -mglob -t'Denim tells you: wake up jerk' wakemeup = /sys mplayer /storage/sound/other/wakeup2.wav &> /dev/null
;/def -p1 -mregexp -t'Esoteric beeps you.' beepme = /sys mplayer /storage/sound/other/wakeup2.wav &> /dev/null
;/def -p2 -mregexp -t'[A-Z][a-z]+ beeps you.' beep2 = /sys mplayer /storage/sound/other/fall.wav &> /dev/null

;/def -p1 -mregexp -t'^You tell [A-Z][a-z]+: .*' write_tell_from = /test tfwrite(tell_log, %{P0})
;/def -p1 -mregexp -t'^Qwerty tells you: .*' write_tell_to = /test tfwrite(tell_log, %{P0})

;Enable Keypad movement
/def key_nkp1=!southwest
/def key_nkp2=!south
/def key_nkp3=!southeast
/def key_nkp4=!west
/def key_nkp5=!look
/def key_nkp6=!east
/def key_nkp7=!northwest
/def key_nkp8=!north
/def key_nkp9=!northeast
/def key_nkp+=!down
/def key_nkp-=!up
/def key_nkp*=!last %{prot_chan}
/def -i key_nkpEnt = \
	/if (kblen()==0) \
		/dokey RECALLB%;\
		/else \
		/dokey NEWLINE%;\
		/dokey RECALLB%;\
	/endif

/def -p1 -mregexp -t'^Your (.*) loses its magical enchantment.' ench_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Enchant Armour \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on \%^WHITE\%^%P1\%^RESET\%^
/def -p1 -mregexp -t'^You lay your hands over (.*) and fill it with magical energy!' ench_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Enchant Armour \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on \%^WHITE\%^%P1\%^RESET\%^

/def mt = tithe 50 gold to %{*}

/def rhump = /eval sales ;hump %1%;chat ;hump %1%;myth ;hump %1%;geek ;hump %1%;@_o ;hump %1%;mudclients ;hump %1%;warez ;hump %1%;pancakes ;hump %1%;alien ;hump %1%;bounty ;hump %1%;ghost ;hump %1%;equip ;hump %1%;obscene ;hump %1%;zombie ;hump %1%;parties ;hump %1%; c' ;hump %1%;iomchat ;hump %1

/def ppref = /eval /qs cast portal preferences with %1%;/qs cast create shimmering portal%;/qs enter portal%;/cq

;Light/Dark counter
/if (!light_value) /set light_value=0%;/endif
/def -p1 -mglob -t'You snap your fingers and suddenly become bathed in light.' add_light = /set light_value $[ {light_value} += 1 ]%;/echo -aBCBlue Current Light: %light_value
/def -p1 -mglob -t'You snap your fingers and become enshrouded in darkness.' add_dark = /set light_value $[ {light_value} -= 1 ]%;/echo -aBCBlue Current Light: %light_value
/def -p1 -mglob -t'The darkness around you is lessed as your spell wears off.' rm_dark = /set light_value $[ {light_value} += 1 ]%;/echo -aBCBlue Current Light: %light_value
/def -p1 -mglob -t'The light around you is lessened as your spell wears off.' rm_light = /set light_value $[ {light_value} -=1 ]%;/echo -aBCBlue Current Light: %light_value
