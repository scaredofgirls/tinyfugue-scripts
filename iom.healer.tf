;Load base trigs
/load .tf/iom.tf

;Healer RDMP
/def -ag -p1 -mregexp -t'RDMP [0-9]+ PARTY_HEALTH ([0-9]+) ([A-Za-z]+) ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+) ([0-9]+)' ptank_health = \
/if ({P1} = '1') /set tank_hp %P3(%P4)%;/set tank_ep %P7(%P8)%;/set tank %P2%;\
	/elseif ({P2} =/ {ma1}) /set ma1_ep %P7(%P8)%; \
	/elseif ({P2} =/ {ma2}) /set ma2_ep %P7(%P8)%; \
/endif

;Healer general
/def -p1 -mglob -t'The yellow mist seems to suck up the energy from your spell.' do_mist = cohp %tank
/def -p1 -mglob -t'The holy circle fades away.' consecrate_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Consecrate Ground \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

;Healer prots
/def -p1 -mglob -t'The Gods grant you a quicker pulse.' avareg_up = /status_edit Avareg:2:BCGreen
/def -p1 -mglob -t'You feel that your pulse runs slower.' avareg_down = /status_edit Avareg:2:BCRed
/def -p2 -mglob -t'You feel your heart beat quicken.' etock_up_me = /status_edit Etock:5:BCGreen
/def -p2 -mglob -t'Your blood pressure returns to normal.' etock_down_me = /status_edit Etock:5:BCRed
/def -p1 -mglob -t"You receive the Gods' help." holyp_up = /status_edit HolyP:2:BCGreen
/def -p1 -mglob -t"You feel that the Gods' help is gone." holyp_down = /status_edit HolyP:2:BCRed
/def -p1 -mglob -t'You are shrouded in an aura of life.' death_rit_up = /status_edit DeathRit:2:BCGreen
/def -p1 -mglob -t'You shimmer as your aura of life leave you empty.' death_rit_down = /status_edit DeathRit:2:BCRed

/def -p1 -mglob -t'You pray to your gods and strengthen your beliefs.' firm_belief_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Firm Belief \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^

/def -p1 -mglob -t'You lose your enhanced belief.' firm_belief_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Firm Belief \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

/def -p1 -mglob -t'You are engulfed in a righteous radiance as immortal light shines down from the heavens on you.' pftc_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Pftc \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^

/def -p1 -mglob -t'You lose your righteous posture and the light around you fades.' pftc_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Pftc \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

/def -p1 -mregexp -t"([A-Za-z]+) is engulfed in a righteous radiance as immortal light shines down from the heavens on (him|her|it)." \
pftc_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Pftc \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mregexp -t"([A-Za-z]+) loses (his|her|it's) righteous posture and the light around .* fades." pftc_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Pftc \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mregexp -t"([A-Za-z]+) feels (his|her|its) heart beat quicken." etock_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Etock \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p2 -mregexp -t"([A-Za-z]+)'.* blood pressure returns to normal." etock_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Etock \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mregexp -t"([A-Za-z]+).* image becomes more firm." aof_up = \
/if (%P1 =/ "Your") !%{prot_chan} \%^BOLD\%^CYAN\%^Armor of Faith \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Armor of Faith \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t"([A-Za-z]+).* image fades slightly." aof_down = \
/if ({P1} =/ "Your") !%{prot_chan} \%^BOLD\%^CYAN\%^Armor of Faith \%^RED\%^[\%^BLUE\%^Down\%^RED\%^] \%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Armor of Faith \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'Holy radiance covers (you|[A-Za-z]+) as the Gods grant (him|her|it|you) protection.' pfp_up = \
/if ({P1} =/ "you") !%{prot_chan} \%^BOLD\%^CYAN\%^Prayer for Protection \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Prayer for Protection \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'The holy glow around (you|[A-Za-z]+) fades.' pfp_down = \
/if ({P1} =/ "you") !%{prot_chan} \%^BOLD\%^CYAN\%^Prayer for Protection \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Prayer for Protection \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'([A-Za-z]+) (is|are) encompassed by a white aura.' pfe_up = \
/if ({P1} =/ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Pfe \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Pfe \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t"([A-Za-z]+) shimmers as (his|her|it's) white aura fades away." pfe_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Pfe \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mglob -t'You shimmer as your white aura fades away.' pfe_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Pfe \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

/def -p1 -mregexp -t'^You create a mystic link with ([A-Za-z]+) and share (his|her|its) pain.$' share_suff_up = \
    !%{prot_chan} \%^BOLD\%^CYAN\%^Share Suffering \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^] on \%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mglob -t'You are basked in holy light as your faith is rewarded by the gods.' cru_faith_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Faith of the Crusader \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^

/def -p1 -mglob -t"As the power of the crusader's faith leaves you, you feel drained and tired." cru_faith_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Faith of the Crusader \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

/def -p1 -mregexp -t"([A-Za-z]+\s*[A-Za-z]*) loses its consecration." cons_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Consecration \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mregexp -t"([A-Za-z]+\s*[A-Za-z]*) sounds loudly as it is filled with holy energy." cons_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Consecration \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mglob -t'You release an ancient shield of the martyr on yourself.' pray_mart_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Prayer of the Martyr \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^

/def -p1 -mglob -t'The ancient shield on you flickers and then fades.' pray_mart_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Prayer of the Martyr \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

/def -p1 -mregexp -t'(You|[A-Za-z]+) (is|are) surrounded by a soft blue aura.' haura_up = \
/if ({P1} =/ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Healing \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Healing \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'The blue aura around (you|[A-Za-z]+) fades.' haura_down = \
/if ({P1} =/ "you") !%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Healing \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Healing \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'([A-Za-z]+) (is|are) encompassed by protection of the pilgrims.' pilprot_up = \
/if ({P1} =/ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Pilgrims Protection \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Pilgrims Protection \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'([A-Za-z]+) shimmer(s{0,1}) as (his|her|its|your) aid from the pilgrims vanish(es){0,1}.' pilprot_down = \
/if ({P1} =/ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Pilgrims Protection \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^%;\
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Pilgrims Protection \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mglob -t'As you pray for a moment your eyes begin to glow and suddenly your aura flashes brightly enveloping everyone in the room.' mp_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Martyric Presence \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^

/def -p1 -mglob -t'Your shoulders slump down a bit and the light in your eyes fades.' mp_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Martyric Presence \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

/def -p1 -mregexp -t"You clap your hands and ([A-Za-z]+) is engulfed in a blue magical cloud that refreshes (him|her|it)." time_mref = \
    /repeat -120 1 /echo -aBCGreen [--> Refresh usable again! <--]

/def -p1 -mglob -t"You feel weakened by the life link." lifelink_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Life Link \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^

/def -p1 -mglob -t"You feel your strength returning as the life link dissolves." lifelink_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Life Link \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^

;ZOMG
/def -p1 -mglob -t'You create some food.' \
do_food = /if (bot_food=1) /let food_time=$[rand(3,12)]%;/repeat -%food_time 1 !cast create food%;/endif

/def healer_idle = \
    /if (rand(1,2) > 1) \
        /let bot_spell="haim"%;\
    /else \
        /let bot_spell="cast create food"%; \
    /endif%; \
    /let bot_time=$[rand(3,20)]%;\
    /qs /repeat -%bot_time 1 !%bot_spell

/set bot_food=0
;Healer blasts
/def -p1 -mglob -t"You mutter the words 'roast in hell'" re_wf = cast white flame
/def -p1 -mglob -t"You mutter the words 'au lhy mano'" re_hog = hog

;Healer Keys
/def key_f2=!mref %tank
/def key_f3=!mref %ma1
/def key_f4=!mref %ma2
/def key_f5=!pheal
/def key_f6=!pref
/def key_f7=!cast heal at %tank
/def key_f8=!healb %tank
/def key_f9=!avareg
/def key_f10=!cast holy prayer
/def key_f11=!cast martyric presence
/def key_f12=!use consecrate ground

;RDMP Status Setup
/status_rm hit_points
/status_add -A@world -s1 -x  -s1 -x hit_points:10:BCblue
/status_rm spell_points
/status_add -Ahit_points -s1 -x spell_points:10:BCblue
/status_rm endurance_points
/status_add -Aspell_points -s1 -x endurance_points:10:BCblue
/status_rm my_hunger
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_rm mon_health
/status_add -Amy_hunger -s1 -x mon_health:3:BCred

;Healer Status Line
/status_add -Amon_health -s1 -x tank_hp:10:Cgreen
/set tank_hp ()
/status_add -Atank_hp -s1 -x tank_ep:10:Cyellow
/set tank_ep ()
/status_add -Atank_ep -s1 -x ma1_ep:10
/set ma1_ep ()
/status_add -Ama1_ep -s1 -x ma2_ep:10
/set ma2_ep ()
/status_add -Ama2_ep -s1 -x Avareg:2
/set Avareg AR
/status_add -AAvareg -s1 -x HolyP:2
/set HolyP HP
/status_add -AHolyP -s1 -x DeathRit:2
/set DeathRit DR
/status_add -ADeathRit -s1 -x Etock:5
/set Etock Etock
