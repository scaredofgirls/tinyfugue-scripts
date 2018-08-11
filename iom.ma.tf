/load .tf/iom.tf
;MA Keys
/def key_f2=!use dragon possession
/def key_f3=!use focus chi
/def key_f4=!use resist pain
/def key_f5=!use inner peace
/def key_f6=!use split essence
/def key_f7=!use chi of yin
/def key_f8=!use forged ego
/def key_f9=!use toad leg power
/def key_f10=!use toad armor
/def key_f11=!use bouncing toad
/def key_f12=!use nature of the beast

;MA Prot Statuses
/status_add -A@world -s1 -x stance:6
/set stance=None
/status_add -Astance -s1 -x dragpos:2
/set dragpos=DP
/status_add -Adragpos -s1 -x foc_chi:2
/set foc_chi=FC
/status_add -Afoc_chi -s1 -x res_pain:2
/set res_pain=RP
/status_add -Ares_pain -s1 -x in_peace:2
/set in_peace=IP
/status_add -Ain_peace -s1 -x spl_ess:2
/set spl_ess=SE
/status_add -Aspl_ess -s1 -x chi_yin:3
/set chi_yin=CoY
/status_add -Achi_yin -s1 -x for_ego:2
/set for_ego=FE
/status_add -Afor_ego -s1 -x leg_pow:3
/set leg_pow=TLP
/status_add -Aleg_pow -s1 -x toad_arm:2
/set toad_arm=TA
/status_add -Atoad_arm -s1 -x bnctd:2
/set bnctd=BT
/status_add -Abnctd -s1 -x nat_bea:3
/set nat_bea=NoB

;RDMP Status Setup
/status_add -Anat_bea -s1 -x  -s1 -x hit_points:12:BCblue
/status_add -Ahit_points -s1 -x spell_points:12:BCblue
/status_add -Aspell_points -s1 -x endurance_points:12:BCblue
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_add -Amy_hunger -s1 -x mon_health:3:BCred

;Ma Stance
/def -p1 -mregexp -t'You form the ([A-Za-z]+) stance.' stance_up = /set stance=%P1
/def -p1 -mglob -t'You lose focus over your martial form.' stance_down = /set stance=None

;MA Prots
/def -p1 -mglob -t'You adjust your stance.' tlp_up = /status_edit leg_pow:3:BCGreen
/def -p1 -mglob -t'You stumble and lose your stance.' tlp_down = /status_edit leg_pow:3:BCRed
/def -p1 -mglob -t'You plant your legs and start to jump about.' bout_up = /status_edit bnctd:2:BCGreen
/def -p1 -mglob -t'You get tired of jumping.' bout_down = /status_edit bnctd:2:BCRed
/def -p1 -mglob -t'You feel the power of the beast.' nat_bea_up = /status_edit nat_bea:3:BCGreen
/def -p1 -mglob -t'You weep as the power of the beast is gone.' nat_bea_down = /status_edit nat_bea:3:BCRed
/def -p1 -mglob -t'You feel as if you could dive off a cliff and not notice.' ego_up = /status_edit for_ego:2:BCGreen
/def -p1 -mglob -t'Your ego is no longer forged as iron.' ego_down = /status_edit for_ego:2:BCRed
/def -p1 -mglob -t'You are possessed by the power of the dragon!' dp_up = /status_edit dragpos:2:BCGreen
/def -p1 -mglob -t'You appear to have survived the dragon possession.' dp_down = /status_edit dragpos:2:BCRed
/def -p1 -mglob -t'You focus your chi.' chi_up = /status_edit foc_chi:2:BCGreen
/def -p1 -mglob -t'Your muscles shrink a bit.' chi_down = /status_edit foc_chi:2:BCRed
/def -p1 -mglob -t'You begin to resist pain.' rp_up = /status_edit res_pain:2:BCGreen
/def -p1 -mglob -t'You stop resisting pain.' rp_down = /status_edit res_pain:2:BCRed
/def -p1 -mglob -t'You have found your inner peace.' ip_up = /status_edit in_peace:2:BCGreen
/def -p1 -mglob -t'Your inner turmoil has returned.' ip_down = /status_edit in_peace:2:BCRed
/def -p1 -mglob -t'You focus on making yourself appear as two.' se_up = /status_edit spl_ess:2:BCGreen
/def -p1 -mglob -t'Your essence is whole again.' se_down = /status_edit spl_ess:2:BCRed
/def -p1 -mglob -t'You get a far off look in your eyes.' ta_up = /status_edit toad_arm:2:BCGreen
/def -p1 -mglob -t'You focus on the here and now' ta_down = /status_edit toad_arm:2:BCRed
/def -p1 -mglob -t'Your fists are surrounded by a faint cyan aura.' foe_elec = \
!%{prot_chan} \%^BOLD\%^CYAN\%^FoE \%^RED\%^\[\%^GREEN\%^Electric\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'Your fists are surrounded by a faint red aura.' foe_fire = \
!%{prot_chan} \%^BOLD\%^CYAN\%^FoE \%^RED\%^\[\%^GREEN\%^Fire\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'Your fists are surrounded by a faint blue aura.' foe_cold = \
!%{prot_chan} \%^BOLD\%^CYAN\%^FoE \%^RED\%^\[\%^GREEN\%^Cold\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You sense your fists returning to normal.' foe_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^FoE \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You prepare for your opponents.' coy_up = /status_edit chi_yin:3:BCGreen
/def -p1 -mglob -t'Your concentration on the Chi of Yin has faltered.' coy_down = /status_edit chi_yin:3:BCRed
;Tiger claw stuffs.
/def -p1 -mregexp -t'You deeply strike (.*) with your balled-up fist' tigerclaw1 = !use tiger claw
/def -p1 -mregexp -t'You are overcome with your killer cat instinct' tigerclaw2 = !use tiger claw
/def -p1 -mregexp -t'All (.*) sees is a blur of movement as you move with tiger-like quickness' tigerclaw4 = !use tiger claw
/def -p1 -mregexp -t'You draw on the raw emotions of your animalistic nature' tigerclaw3 = !use tiger claw
;Punch. Yeah, you heard me.
/def -p1 -mregexp -t'You land a hard punch to .* chin!' re_punch = !use punch
/def -p1 -mregexp -t'You try to punch .* square in the face, but it steps aside and easily avoids the attack.' re_punch1 = !use punch
/def -p1 -mregexp -t'You nick .* with a right-handed punch.' re_punch2 = !use punch
/def -p1 -mregexp -t'You try to punch .* square in the face, but (he|she|it) steps aside and easily avoids the attack.' re_punch3 = !use punch
