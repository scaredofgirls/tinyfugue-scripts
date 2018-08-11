;Load mudwide settings
/load .tf/iom.tf

;Handle weapons for saccing
/def -p1 -mglob -t'You collect the blood drained from the corpse into your magical vessel.' autosac2 = !do remove ritual dagger;wield sceptre

;DOTS! THROW MORE DOTS!
;;habo
/def -p1 -mregexp -t"^You channel magical energy into ([A-Za-z' -]+)'s* body." habo_up = /echo -aBCWhite [--> Harm Body [Up] on %P1 <--]
/def -p1 -mregexp -t"^([A-Za-z' -]+) sighs in relief as the last of the energy dissipates from (his|her|its) body." habo_down = /echo -aBCWhite [--> Harm Body [Down] on %P1 <--]
;;Harm Good
/def -p1 -mglob -t"You mutter the words 'Glowing good girls crow, cloning great grown gills.'" hg_up = /echo -aBCWhite [--> Harm Good [Up] <--]
/def -p1 -mregexp -t"^([A-Za-z' -]+) regains some faith in the world." hg_down = /echo -aBCWhite [--> Harm Good [Down] on %P1 <--]
;;Peel Flesh
/def -p1 -mregexp -t"You take out your instruments, spout some magical nonsense, and begin to torture ([A-Za-z' -]+)." peel_up = /echo -aBCBlack [--> Peel Flesh [Up] on %P1 <--]
/def -p1 -mregexp -t"You put away your instruments, and stop torturing (.*)\." peel_down = /echo -aBCBlack [--> Peel Flesh on [Down] %P1 <--]
;;Blood Fire
/def -p1 -mregexp -t"^You point at ([A-Za-z' ,-]+), and cheesy special effects cause (his|her|its) blood to burn!!!" bf_up = /echo -aCRed [--> Blood Fire [Up] on %P1 <--]
/def -p1 -mregexp -t"^([A-Za-z' -]+)'s? blood turns to ice." bf_down = /echo -aCRed [--> Blood Fire [Down] on %P1 <--]



;;Spider Bite
/def -p1 -mregexp -t"You bite ([A-Za-z' -]+) hard." sbite_up = !say Spider Bite [up] %P1
/def -p1 -mregexp -t"([A-Za-z' -]+) finally purges the last of the poison from (his|her|its) body." sbite_down = /echo -aCrgb204  Spider Bite [Down] %P1 
;;Magical Brand
/def -p1 -mglob -t"You mutter the words 'YeBe Myn'" brand_up = /echo -aBCRed [--> Magical Brand [Up] <--]
/def -p1 -mregexp -t'Shaken, but no longer in flames, (.*) begins to grow accustomed to (his|her|its) brand.' brand_down = /echo -aBCRed [--> Magical Brand [Down] <--]

;now a dot
;;Burning Aura
/def -p1 -mregexp -t'You create a burning aura around (.*)\.' ba_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Burning Aura \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t"(.*)'.* burning aura disappears." ba_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Burning Aura \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
;;Stench of Death
/def -p1 -mregexp -t'You surround (.*) with the stench of death.' stench_up = /echo -aCrgb204 [--> Stench [Up] on %P1 <--]
/def -p1 -mregexp -t'(\w+) breathes a sigh of relief as the deadly fumes pervading the room dissipate.' stench_down = /echo -aCrgb204 [--> Stench [Down] on %P1 <--]

;rituals
/set rit_god shirija
/def -p1 -mglob -t'* chants, "Malleus Malificarum, animae nostrae servate!"' cr = !stand on %{rit_god} point%;cast stop%;!%{prot_chan} \%^BOLD\%^CYAN\%^Ritual Circle \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'Its energy spent, the ritual circle flares briefly, and disappears.' rc_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Ritual Circle \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You mutter sanguinary, morose incantations, and are rewarded with a small leech.' leech_up = !order leech name yy
/def -p1 -mglob -t'The leech drops off *, finding little left in * to eat.' get_yy = !get yy
;Yy returns to the hell from whence it came.
/def -p1 -mglob -t'The leech drops off *, satiated.' = /get_yy%;!order yy disgorge


;Harmer Blasts
;;Blood Spray
/def -p1 -mglob -t"You mutter the words 'koyt HCl buuuuurnnn'" re_blspray = !cast blood spray
/def -p1 -mglob -t"You mutter the word 'Eerrroooobbbbbddddddeeeeelllllllaa!'" re_ld = !cast life drain
/def -p1 -mglob -t"You mutter the words 'Pedes volete!'" re_sould = !cast soul drain
/def -p1 -mglob -t"You mutter the word 'Oocccttttoooooccccccuuuuullllaaatta!'" re_ed = !cast energy drain

;Harmer Status Bar
/status_add -A@world -s1 -x Pfg:3
/set Pfg Pfg
/status_add -APfg -s1 -x Scab:4
/set Scab Scab
/status_add -AScab -s1 -x Prayer:6
/set Prayer Prayer

;harmer prots
/def -p1 -mglob -t'You are surrounded by a black aura.' pfg_upme = /status_edit Pfg:3:BCGreen
/def -p1 -mglob -t'You lose the black aura protecting you.' pfg_downme = /status_edit Pfg:3:BCRed
/def -p1 -mregexp -t"^(\w+) is surrounded by a black aura.$" pfg_up =\
!%{prot_chan} \%^BOLD\%^CYAN\%^Pfg \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^\ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'^(\w+) loses the black aura protecting (him|it|her).$' pfg_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Pfg \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
;;massive scab
/def -p1 -mglob -t'You are covered with scabs.' ms_up = /status_edit Scab:4:BCGreen
/def -p1 -mglob -t'The scabs fall off of you, leaving pink new skin.' ms_down = /status_edit Scab:4:BCRed


;;Berzerk
/def -p1 -mglob -t'You aim for Valhalla!' berz_up = !say Berzerking [Up]
/def -p1 -mglob -t'You aim for Valhalla once more!' reberz = !say Berzerking [Refd]
/def -p1 -mglob -t'You set your sights back on earth.' berz_down = !say Berzerking [Down]
/def -p1 -mregexp -t'^([A-Z][a-z]+) looks? sallow.' bl_up = \
    /if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Bloodletting \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
        /else !%{prot_chan} \%^BOLD\%^CYAN\%^Bloodletting \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif
/def -p1 -mregexp -t"^(Your|[A-Z][a-z]+)'?s? sacrifice has run its course." bl_down = \
    /if ({P1} =~ "Your") !%{prot_chan} \%^BOLD\%^CYAN\%^Bloodletting \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
        /else !%{prot_chan} \%^BOLD\%^CYAN\%^Bloodletting \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif
;/def -p1 -mregexp -t'^You chant a prayer, and gently slash ([A-Z][a-z0-9]+) on the arm.' bb_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Blood Brotherhood \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;/repeat -720 1 /echo BB FALLING
/def -p1 -mregexp -t'^You chant a prayer, and gently slash ([A-Z][a-z0-9]+) on the arm.' bb_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Blood Brotherhood \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'^([A-Z][a-z0-9]+) stops (his|her|its) fraternization!$' bb_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Blood Brotherhood \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'The cloud of darkness melts away, revealing Shirija herself.' shi_av_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Avatar of Shirija \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'Shirija leaves you, leaving yourself weak and helpless.' shi_av_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Avatar of Shirija \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'^You smile at (yourself|[A-Z][a-z]+).$' shi_sac_up = \
    /if ({P1} =~ "yourself") !%{prot_chan} \%^BOLD\%^CYAN\%^Sacrifice to Shirija \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
        /else !%{prot_chan} \%^BOLD\%^CYAN\%^Sacrifice to Shirija \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif

/def -p1 -mregexp -t'^(You|[A-Z][a-z]+) feels? out of touch with death.' shi_sac_down = \
    /if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Sacrifice to Shirija \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
        /else !%{prot_chan} \%^BOLD\%^CYAN\%^Sacrifice to Shirija \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif
;Unholy prayer stuff
/def -p1 -mglob -t'A bloody black light surrounds you as Mordulak blesses you.' unh_mord_up = /status_edit Prayer:8:CRed%;/set Prayer Mordulak    
/def -p1 -mglob -t'The bloody black light around you brightens to nothing.' unh_mord_down = /status_edit Prayer:6%;/set Prayer Prayer

/def -p1 -mglob -t'You feel you could drink an ocean!' unh_talakh_up = /status_edit Prayer:6:CRed%;/set Prayer Talakh
/def -p1 -mglob -t'You get a bit frantic.' unh_talakh_up = /status_edit Prayer:6:%;/set Prayer Prayer

/def -p1 -mglob -t'You lift your hands, and call forth *.' summon_undead = !do order all follow;order all name xx

;add possiblity to csat on otjhers
/def -p1 -mregexp -t'^([A-Z][a-z0-9]+) (?:is|are) stabbed through the heart.' unh_shirija_up = \
    /if ({P1} =~ "You") /status_edit Prayer:7:BCBlack%;/set Prayer Shirija%; \
        /else !%{prot_chan} \%^BOLD\%^CYAN\%^Unholy Prayer \%^WHITE\%^(\%^BLACK\%^Shirija\%^WHITE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif
/def -p1 -mregexp -t"^([A-Z][a-z]+)(?:'s)? chest cavity seals up again." unh_shirija_down = \
    /if ({P1} =~ "Your") /status_edit Prayer:6%;/set Prayer Prayer%; \
        /else !%{prot_chan} \%^BOLD\%^CYAN\%^Unholy Prayer \%^WHITE\%^(\%^BLACK\%^Shirija\%^WHITE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif

/def -p1 -mglob -t"You feel you could drink an ocean!" unh_talakh_up = /status_edit Prayer:6:CRed%;/set Prayer Talakh
/def -p1 -mglob -t"You get a bit frantic." unh_talakh_down = /status_edit Prayer:6%;/set Prayer Prayer


;;TODO make vatars and sacrifices status bar "icons"
;;TODO Add Armor of scorn

;Other crap
/def -p1 -mglob -t'You create some food.' \
do_food = /if (bot_food=1) /let food_time=$[rand(3,12)]%;/repeat -%food_time 1 !cast create food%;/endif
/set bot_food=0

;Harmer keys
/def key_f1=!pfg me
/def key_f2=!cast harm good
/def key_f3=!cast harm body
/def key_f4=!cast peel flesh
/def key_f5=!cast blood fire
/def key_f6=!cast life drain
/def key_f7=!cast energy drain
/def key_f8=!cast imprison soul at a corpse
/def key_f9=!use taunt at a x
/def key_f10=!use berserk
/def key_f11=!cast cause light wounds with me
/def key_f12=!cast sacrifice to shirija at me

;RDMP Status Setup
/status_rm hit_points
/status_add -APrayer -s1 -x  -s1 -x hit_points:12:BCblue
/status_rm spell_points
/status_add -Ahit_points -s1 -x spell_points:12:BCblue
/status_rm endurance_points
/status_add -Aspell_points -s1 -x endurance_points:12:BCblue
/status_rm my_hunger
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_rm mon_health
/status_add -Amy_hunger -s1 -x mon_health:3:BCred

/set adrain life drain
/def ba = /if ({*} =~ "") /set atarg x%;/else /set atarg %{*}%;/endif%;/qs cast blood fire%;/qs pfl%;/qs hg%;/qs cast %{adrain}%;do sod at a %{atarg};order leech drain a %{atarg}
/def aa = /if ({*} =~ "") /set atarg x%;/else /set atarg %{*}%;/endif%;cast blood fire at a %{atarg}%;order leech drain a %{atarg}
/def la = /if ({*} =~ "") /set atarg x%;/else /set atarg %{*}%;/endif%;/qs cast blood fire%;/qs cast %{adrain}%;do sod at a %{atarg};order leech drain a %{atarg}

;Harmer prayers
;;Depricated :(
;;/def -p1 -mglob -t'You are blessed by Mordulak.' mordu_up = /status_edit Mordulak:8:BCGreen
;;/def -p1 -mglob -t'You are no longer blessed by Mordulak.' mordu_down = /status_edit Mordulak:8:BCRed
;;/def -p1 -mglob -t'You are blessed by Grithmal.' grith_upme = /status_edit Grithmal:8:BCGreen
;;/def -p1 -mglob -t'You are no longer blessed by Grithmal.' grith_downme = /status_edit Grithmal:8:BCRed
;;/def -p1 -mglob -t"You are granted Loke's blessing." loke_upme = /status_edit Loke:4:BCGreen
;;/def -p1 -mglob -t"You lose Loke's blessing." loke_downme = /status_edit Loke:4:BCRed
;;/def -p1 -mglob -t"You receive Kali's blessing." kali_up = /status_edit Kali:4:BCGreen
;;/def -p1 -mglob -t"You lose Kali's blessing." kali_down = /status_edit Kali:4:BCRed
;;/def -p1 -mglob -t"You receive Morgoth's help." morgo_up = /status_edit Morgoth:7:BCGreen
;;/def -p1 -mglob -t'You are no longer blessed by Morgoth.' morgo_down = /status_edit Morgoth:7:BCRed
;;/def -p1 -mregexp -t'^(\w+) is blessed by Grithmal.' grith_up = \
;;!%{prot_chan} \%^BOLD\%^CYAN\%^Prayer to Grithmal \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
;;/def -p1 -mregexp -t'^(\w+) is no longer blessed by Grithmal.' grith_down = \
;;!%{prot_chan} \%^BOLD\%^CYAN\%^Prayer to Grithmal \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
;;/def -p1 -mregexp -t"^(\w+) is granted Loke's blessing." loke_up = \
;;!%{prot_chan} \%^BOLD\%^CYAN\%^Prayer to Loke \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
;;/def -p1 -mregexp -t"^(\w+) loses Loke's blessing." loke_down = \
;;!%{prot_chan} \%^BOLD\%^CYAN\%^Prayer to Loke \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

