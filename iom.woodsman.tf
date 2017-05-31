;#Notes
;Please note that my leaf blades are redeemer and wyrmslayer, 
;my rootstaff is wyrmcrusher, and my twigshield is wyrmsbane. 
;You will have to change the driggers accordingly, and will likley want to change the 
;stats lines to reflect your names and not my "WS" "RD" etc.

;Woodsman Keypad
/load .tf/iom.tf
/def key_f2=!use willow roots
/def key_f3=!use intuitive awareness
/def key_f4=!use inner walls
/def key_f5=!use %wood_attack
/def key_f6=!use %wood_attack at 1st x
/def key_f7=!use %wood_attack at 2nd x
/def key_f8=!use %wood_attack at 3rd x
/def key_f9=!use hide tracks
/def key_f10=!use find herbs
/def key_f11=!cast womb of gaia
/def key_f12=!use build campfire

;Familiar naming crap.
/def -p1 -mglob -t"Your familiar's name is now Eagle." name_eagle = !do order eagle follow;order eagle name Fawkes
/def -p1 -mglob -t"Your familiar's name is now Bear." name_bear = !do order bear follow;order bear name Cuteninja
/def -p1 -mglob -t"Your familiar's name is now Falcon." name_faclon = !do order falcon follow;order falcon name Våffla

;Set eaglesell stuffs
/set eagle_sell=0

/def -p1 -mregexp -t'Fawkes gives you ([0-9]+) gold' eagle_sold = \
	/if (eagle_sell = "1") !party contribute %P1%; \
	/endif

;Woodsman Prots
/def -p1 -mglob -t'You focus your mind and create inner walls within you.' inw_up = /status_edit inner_walls:2:BCGreen
/def -p1 -mglob -t'Your inner walls crumble as you lose the focus to maintain them.' inw_down = /status_edit inner_walls:2:BCRed
/def -p1 -mglob -t'You get into a trance-like state and focus all your senses.' ia_up = /status_edit intuitive_awareness:2:BCGreen
/def -p1 -mglob -t'You lose your trance-like state.' ia_down = /status_edit intuitive_awareness:2:BCRed
/def -p1 -mglob -t'You stand immobile, drawing power from the Earth!' wr_up = /status_edit willow_roots:2:BCGreen
/def -p1 -mglob -t'You lift up your feet, shake yourself out, and regain a normal sense of your surroundings.' wr_down = /status_edit willow_roots:2:BCRed
/def -p1 -mglob -t'You quickly and efficiently erase all tracks around you.' ht_up =  /status_edit hide_tracks:2:BCGreen
/def -p1 -mglob -t'You are no longer hiding your tracks.' ht_down = /status_edit hide_tracks:2:BCRed
;Weapon Enchants
/def -p1 -mglob -t'You ward * from raw force.' ward_force = /status_edit ward:4:BCWhite
/def -p1 -mglob -t'You ward * named * with special powers against acidic damage.' ward_acid = /status_edit ward:4:BCBlack
/def -p1 -mglob -t'You ward enchanted * named * against fire.' ward_fire = /status_edit ward:4:BCRed
/def -p1 -mglob -t'You ward enchanted * named * against venoms.' ward_poison = /status_edit ward:4:BCGreen
/def -p1 -mglob -t'You ward enchanted * named * against lightning.' = /status_edit ward:4:BCYellow
/def -p1 -mglob -t'Enchanted * loses its * warding.' ward_down = /status_edit ward:4:BCBlue
/def -p1  -mregexp -t'You infuse enchanted rootstaff named "WyrmCrusher" with ([a-z]+) power!' staff_inf_up = \
        /if ({P1} =~ "lightning") /status_edit wyrm_crusher:2:BCYellow%;\
        /elseif ({P1} =~ "fiery") /status_edit wyrm_crusher:2:CRed%;\
        /elseif ({P1} =~ "acid") /status_edit wyrm_crusher:2:BCBlack%;\
        /elseif ({P1} =~ "raw") /status_edit wyrm_crusher:2:BCWhite%;\
        /elseif ({P1} =~ "poison") /status_edit wyrm_crusher:2:BCGreen%;\
        /endif
/def -p1 -mregexp -t'Enchanted leafblade named "WyrmSlayer" glows brightly as it is infused with ([a-z]+) power.' wyrm_inf_up = \
	/if ({P1} =~ "lightning") /status_edit wyrm_slayer:2:BCYellow%;\
	/elseif ({P1} =~ "fiery") /status_edit wyrm_slayer:2:CRed%;\
	/elseif ({P1} =~ "acid") /status_edit wyrm_slayer:2:BCBlack%;\
	/elseif ({P1} =~ "raw") /status_edit wyrm_slayer:2:BCWhite%;\
	/elseif ({P1} =~ "venomous") /status_edit wyrm_slayer:2:BCGreen%;\
	/endif
/def -p1 -mregexp -t'Enchanted leafblade named "Redeemer" glows brightly as it is infused with ([a-z]+) power.' redeemer_inf_up = \
        /if ({P1} =~ "lightning") /status_edit redeemer:2:BCYellow%;\
        /elseif ({P1} =~ "fiery") /status_edit redeemer:2:CRed%;\
        /elseif ({P1} =~ "acid") /status_edit redeemer:2:BCBlack%;\
        /elseif ({P1} =~ "raw") /status_edit redeemer:2:BCWhite%;\
        /elseif ({P1} =~ "venomous") /status_edit redeemer:2:BCGreen%;\
        /endif
/def -p1 -mglob -t'Enchanted leafblade named "WyrmSlayer" loses its * power.' wyrm_inf_down = /status_edit wyrm_slayer:2:BCBlue
/def -p1 -mglob -t'Enchanted leafblade named "Redeemer" loses its * power.' redeem_inf_down = /status_edit redeemer:2:BCBlue
/def -p1 -mglob -t'Enchanted rootstaff named "WyrmCrusher" loses its * power.' staff_inf_down = /status_edit wyrm_crusher:2:BCBlue
/def -p1 -mregexp -t'You lay your hands over enchanted .* named \"(.*)\" and pray for mother earth\'s blessing.' wrath_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Wrath of Mother Earth \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'Enchanted .* named \"(.*)\" flickers as the blessing leaves it.' wrath_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Wrath of Mother Earth \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

;Attack skills
/def -p1 -mglob -t'You wield enchanted rootstaff named "WyrmCrusher" in your right and left hands.' set_at_staff = /set wood_attack drumming limbs
/def -p1 -mglob -t'You wield enchanted leafblade named * in your * hand.' set_at_blade = /set wood_attack whirling branches

/def -p1 -mglob -t'You draw on the exceptional qualities of your rootstaff to launch a blinding attack *' re_drum = !use drumming limbs
/def -p1 -mglob -t'You whirl both your leafblades with exceptional speed and launch them *' re_2whirl = !use whirling branches
/def -p1 -mglob -t'You explode into action as your rootstaff seems to drum *' re_drum2 = !use drumming limbs
/def -p1 -mglob -t'You scream as a lunatic as you whirl your leafblade through *' re_whirl2 = !use whirling branches
/def -p1 -mglob -t'You cross your arms, then unfold them, sending both your blades whirling and slicing through *!' re_whirl3 = !use whirling branches
/def -p1 -mglob -t'You whirl both your leafblades and hack at *, flicking your wrists to cause greater damage.' re_whirl4 = !use whirling branches
/def -p1 -mglob -t'You whirl out at * but fumble and miss totally.' re_whirl5 = !use whirling branches
/def -p1 -mglob -t"You mutter the words 'breeeze ekirts'" re_sw = !cast spirit wind

;Coloring of spiritual transfer procs
/def -aCgreen -p1 -mglob -t'* screams as a potent poison infests * body and sends terrible waves of pain into *'
/def -aCgreen -p1 -mglob -t'* whines in pain as a terribly strong venom shoots through * blood!'
/def -aCgreen -p1 -mglob -t'* screams in agony as the venom inside * body creates spasms of pain!'
/def -aBCwhite -p1 -mglob -t'You are healed by energy transferred from enchanted * named *'
/def -aBCwhite -p1 -mglob -t'You are healed by the energy transferred from enchanted * named *'
/def -aBCgreen -p1 -mglob -t'You are healed and refreshed by the energy transferred *'
/def -aCyellow -p1 -mglob -t'A lightning bolt suddenly comes out from * sending a wave *'
/def -aCyellow -p1 -mglob -t'A flash of electricity suddenly arcs from enchanted * named * to *, hitting * right into the head!'
/def -aBCyellow -p1 -mglob -t'* is dazed by the sudden flash and stands still for a while!'
/def -aBCwhite -p1 -mglob -t'You glow as your weapon spreads a shield of energy around yourself!'
/def -aCwhite -p1 -mglob -t'Enchanted rootstaff named "WyrmCrusher" impacts * with amazing strength *'
/def -aCblack -p1 -mglob -t'You are refreshed both physically and mentally by the energy transferred from the powers inside *'
    
;Woodsman Status Setup
/status_rm wyrm_slayer
/status_add -A@world -s1 -x wyrm_slayer:2:BCBlue
/set wyrm_slayer WS

/status_rm redeemer
/status_add -Awyrm_slayer -s1 -x redeemer:2:BCBlue
/set redeemer RD

/status_rm wyrm_crusher
/status_add -Aredeemer -s1 -x wyrm_crusher:2:BCBlue
/set wyrm_crusher WC

/status_rm wyrm_bane
/status_add -Awyrm_crusher -s1 -x wyrm_bane:2:BCBlue
/set wyrm_bane WB

/status_rm ward
/status_add -Awyrm_bane -s1 -x ward:4:BCBlue
/set ward Ward

/status_rm willow_roots
/status_add -Award -s1 -x willow_roots:2:BCBlue
/set willow_roots WR

/status_rm intuitive_awareness
/status_add -Awillow_roots -s1 -x intuitive_awareness:2:BCBlue
/set intuitive_awareness IA

/status_rm inner_walls
/status_add -Aintuitive_awareness -s1 -x inner_walls:2:BCBlue
/set inner_walls IW

/status_rm hide_tracks
/status_add -Ainner_walls -s1 -x hide_tracks:2:BCBlue
/set hide_tracks HT

;RDMP Status Setup
/status_rm hit_points
/status_add -Ahide_tracks -s1 -x hit_points:10:BCblue
/status_rm spell_points
/status_add -Ahit_points -s1 -x spell_points:10:BCblue
/status_rm endurance_points
/status_add -Aspell_points -s1 -x endurance_points:10:BCblue
/status_rm my_hunger
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_rm mon_health
/status_add -Amy_hunger -s1 -x mon_health:3:BCred
