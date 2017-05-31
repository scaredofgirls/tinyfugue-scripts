;Load base trigs
/load .tf/iom.tf
/load .tf/iom.abj.prots.tf

;Warrior Prot Trigs
/def -p1 -mglob -t'You concentrate briefly and use your body control to enhance your strength.' fevstr_up = \
/status_edit FevStr:6:BCgreen
/def -p1 -mglob -t'You grow a bit weaker.' fevstr_down = /status_edit FevStr:6:BCred
/def -p1 -mglob -t'You begin to resist pain.' rpain_up = /status_edit Rpain:5:BCgreen
/def -p1 -mglob -t'You stop resisting pain.' rpain_down = /status_edit Rpain:5:BCred
/def -p1 -mglob -t'You focus your will and enter a Champion trance!' champ_up = /status_edit ChampTrance:11:BCgreen
/def -p1 -mglob -t'You blink out of your champion trance.' champ_down = /status_edit ChampTrance:11:BCred
/def -p1 -mglob -t'You close your eyes and start to hum.*' bd_up = /status_edit BD:2:BCgreen
/def -p1 -mglob -t'You gasp as your glowing aura flickers and fades away.' bd_down = /status_edit BD:2:BCred
/def -p1 -mglob -t'You ignore pain.' ipain_up = /status_edit Ipain:5:BCgreen
/def -p1 -mglob -t'You feel pain again.' ipain_down = /status_edit Ipain:5:BCred
/def -p1 -mglob -t'You place yourself in a berserker stance.' berz_up = /status_edit BS:2:BCgreen
/def -p1 -mglob -t'You lose your berserker stance.' berz_down = /status_edit BS:2:BCred

;Acrobat prots should we have these levels
/def -p1 -mglob -t'You enter an acrobat stance.' acro_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Acrobat Stance \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You feel your body control return to normal.' acro_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Acrobat Stance \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You do some stretching exercises.' limber_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Limber Up \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You feel your muscles tighten up.' limber_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Limber Up \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^

;Warrior Combat Trigs
/def -p1 -mglob -t'You violently stab your weapon into *' reimp0 = !use impale
/def -p1 -mglob -t'You slam your weapon with terrible force straight into *' reimp1 = !use impale
/def -p1 -mglob -t'You impale *' reimp2 = !use impale
/def -p1 -mglob -t'Your eyes gleam with utter hatred *' redb0 = !use deathblow
/def -p1 -mglob -t'You mutilate * with your unbelievably cruel deathblow!' redb1 = !use deathblow
/def -p1 -mglob -t'You helicopter your *' rebf0 = !use bladed fury
/def -p1 -mglob -t'You helicopter *, cutting into * body from both sides. Body parts fall from the sky!' rebf1 = !use bladed fury
/def -p1 -mglob -t'You deeply lash * in the face, maiming and scarring *' re_lac = !use lacerate
/def -p1 -mglob -t'You cruelly slash at ugly paladin warrior making him scream in pain!' re_lac2 = !use lacerate
/def -p1 -mglob -t"You violently slam your shield in * stomach!" re_ub = !use unbalancing blow
/def -p1 -mglob -t"You ram * with your shield with extraordinary strength!" re_ub2 = !use unbalancing blow
/def -p1 -mglob -t"You grin FIENDISHLY as your * strike * in * midsection!" re_strike0 = !use strike
/def -p1 -mglob -t"You hack your * into *, cutting flesh and splatter blood everywhere. * stumbles backwards a few feet shocked and disoriented." re_strike1 = !use strike
/def -p1 -mglob -t"You BLAST your * into *, incising flesh and splatter blood everywhere." re_strike2 = !use strike
/def -p1 -mglob -t"You grin FIENDISHLY as your * strikes * in the midsection." re_strike3 = !use strike
/def -p1 -mglob -t"You strike at *, but only hit air." re_strike4 = !use strike
/def -p1 -mglob -t"You hack your * and * into *, cutting flesh and splatter blood everywhere. *" re_strike5 = !use strike
/def -p1 -mglob -t"You Mutilate * cutting into * body from both sides. *" re_strike6 = !use strike
;The warrior weapon enchants are ambiguous. The enchant is on the weapon, not you so there is nothing
;to identify it as being yours. To limit the spam of triggers off of other warriors weapons
;I specify the weapons I'm using.
/def -p1 -mglob -t'You focus your energy on Demons whip and it seems to start pulsating on its own.' lw_dw_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Lightning Whip \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ Demons Whip\%^RESET\%^
/def -p1 -mglob -t'Demons whip loses the life that seemed to inhabit it.' lwhip_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Lightning Whip \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ Demons Whip\%^RESET\%^
/def -p1 -mglob -t'    Shihuang Lightning Blade vibrates, singing its own song!' sb_lb_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Singing Blade \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ Shihuang Lightning Blade\%^RESET\%^
/def -p1 -mglob -t'Shihuang Lightning Blade loses its humming song.' sb_lb_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Singing Blade \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ Shihuang Lightning Blade\%^RESET\%^
/def -p1 -mglob -t'    Red-handled longsword vibrates, singing its own song!' sb_rhls_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Singing Blade \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ Red-handled Longsword\%^RESET\%^
/def -p1 -mglob -t'Red-handled longsword loses its humming song.' sb_rhls_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Singing Blade \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ Red-handled Longsword\%^RESET\%^
/def -p1 -mglob -t'    DragonSlayer vibrates, singing its own song!' sb_ds_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Singing Blade \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ DragonSlayer\%^RESET\%^
/def -p1 -mglob -t'DragonSlayer loses its humming song.' sb_ds_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Singing Blade \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ DragonSlayer\%^RESET\%^

;Define warrior Fkeys
/def key_f1=!use unbalancing blow
/def key_f2=!use champion trance
/def key_f3=!use fevered strength
/def key_f4=!use resist pain
/def key_f5=!use immobilize
/def key_f6=!use strike
/def key_f7=!use deathblow
/def key_f8=!use charge at a x
/def key_f9=!use ignore pain
/def key_f10=!use blade dance
/def key_f11=!use biofeedback
/def key_f12=!use entangle

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

;Warrior Prot Status Setup
/status_add -Amon_health  -s1 -x ChampTrance:11
/set ChampTrance ChampTrance
/status_add -AChampTrance -s1 -x FevStr:6
/set FevStr FevStr
/status_add -AFevStr -s1 -x Rpain:5
/set Rpain Rpain
/status_add -ARpain -s1 -x Ipain:5
/set Ipain Ipain
/status_add -AIpain -s1 -x BS:2
/set BS BS
