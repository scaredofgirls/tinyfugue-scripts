;Load base settings
/load .tf/iom.tf

;Fkeys
/def key_f2=!cast circle of protection
/def key_f3=!use death rites at 1st corpse
/def key_f4=!cast combine corpses
/def key_f5=!cast blister skin
/def key_f6=!cast mind blast
/def key_f7=!do vc at a x;nk at a x
/def key_f8=!cast rotting limbs
/def key_f9=!cast energy field
/def key_f10=!cast speak with priest
/def key_f11=!cast speak with magi
/def key_f12=!use repair undead at nessy
;Other Keys
/def -b'^[1' = !cast mind surge at nessy
/def -b'^[2' = !cast mind surge at tp
/def -b'^[3' = !cast mind surge at korfula
/def -b'^[4' = !cast mind surge at rott
/def -b'^[5' = !cast mind surge at wilbur
/def -b'^h' = !cast cause light wounds with %{healtarg}

;Familiar stuffs
/def -p1 -mglob -t"Your familiar's name is now Abomination." name_nessy = /repeat -5 1 /eval !do order abomination follow;order abomination name Nessy;order abomination tank;order abomination autoreport;order abomination wield all;order abomination setwimpy 20
/def -p1 -mglob -t"Your familiar's name is now Zombie." name_rott = /repeat -5 1 /eval !do order zombie follow;order zombie name Rott;order zombie setwimpy 30;order zombie wear all
/def -p1 -mglob -t"Your familiar's name is now Wraith." name_wilbur = /repeat -5 1 /eval !do order wraith name Wilbur;order wraith follow;order wraith setwimpy 30;order wraith wear all;order wraith wield all
/def -p1 -mglob -t"Your familiar's name is now Vampire." name_korfula = /repeat -5 1 /eval !do order vampire name Korfula;order vampire follow;order vampire setwimpy 30;order vampire wear all;order vampire wield all
/def -p1 -mglob -t"Your familiar's name is now Mummy." name_tp = /repeat -5 1 /eval !do order mummy name Tp;order mummy follow;order mummy setwimpy 30;order mummy wear all
;Blasts
/def -p1 -mglob -t"You mutter the words 'morrrrm o'r aa'hgda'" re_blist = !cast blister skin
/def -p1 -mglob -t"You concentrate deeply before unleashing a blast of psionic energy at *." re_mblast = !cast mind blast
/def -p1 -mglob -t"You draw symbols of disease on * body!" rott_limb = !cast rotting limbs
/def -p1 -mglob -t"You mutter the words 'fhjja'as kc'tta'" scc = !cast summon carrion crawlers
/def -p1 -mglob -t"Fistandantilus mutters the words 'buuunes 'ot 'ot Flames'" re_bbones = !order fistandantilus cast burning bones
/def -p1 -mglob -t"Nessy is ready to perform its skill." re_bash = order nessy use bash
/def -p1 -mglob -t"LordSoth mutters the words 'Ogmis Yugu Oy'wercs!'" re_eth_fist = order LordSoth cast ethereal fist
/def -p1 -mglob -t"Wilbur mutters the words 'Ogmis Yugu Oy'wercs!'" re_ethfist = !order wilbur cast ethereal fist
/def -p1 -mglob -t"Rott tries to infect *, but fails miserably!" re_ench = !order rott use encephalitis
/def -p1 -mglob -t"Wilbur mutters the words 'Whooooomp SPLAT!'" re_intrude = !order wilbur cast mind intrusion
/def -p1 -mglob -t"Tp focuses inwards to connect with his ka, but fails miserably." re_akh_ba = !order tp use akh ba attack
/def -p1 -mglob -t"Tp focuses inwards and connects with his ka. *" re_akh_ba2 = !order tp use akh ba attack
/def -p1 -mglob -t"Korfula is * as his skill *" re_kol = !order korfula use kiss of life
/def -p1 -mglob -t"Wilbur mutters the words 'kbnaaaang kbNAAANG!'" re_eblast = !order wilbur cast ethereal blast
/def -p1 -mglob -t'Rott infects * with encephalitis.' do_decay = !order rott cast touch of decay
/def -p1 -mglob -t"Wilbur mutters the words 'SPAL inf flff luff!'" do_invade = !order wilbur cast mind invasion

;Prots
/def -p1 -mglob -t"You are surrounded by an energy field." efield_up = /status_edit Efield:6:BCGreen
/def -p1 -mglob -t"The energy field around you fades away." efield_down = /status_edit Efield:6:BCRed
/def -p1 -mglob -t"You close your eyes, then open filled with the spirit of the priest." swp_up = /status_edit Swp:6:BCGreen
/def -p1 -mglob -t"You lose your contact with the dead priest." swp_down = /status_edit Swp:6:BCRed
/def -p1 -mregexp -t"You draw runes of power on ([A-Z][a-z]+)'s body." immun_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Strengthen Immunity \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^BOLD\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t"[A-Za-z+]'s body looks weaker." immun_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Strengthen Immunity \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^BOLD\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t"You close your eyes, then open filled with the spirit of the magi." swm_up = /status_edit Swm:4:BCGreen
/def -p1 -mglob -t"You lose your contact with the dead magi." swm_down = /status_edit Swm:4:BCRed
/def -p1 -mglob -t"You close your eyes, then open filled with the spirit of the warrior." sww_up = /status_edit Sww:3:BCGreen
/def -p1 -mglob -t"You lose your contact with the dead warrior." sww_down = /status_edit Sww:3:BCRed
/def -p1 -mglob -t"You are surrounded by a pulsating aura of force!" vt_up = /status_edit VT:2:BCGreen
/def -p1 -mglob -t"The aura around you fades." vt_down = /status_Edit VT:2:BCRed
/def -p1 -mglob -t'You close your eyes, then open filled with the spirit of the rogue.' swr_up = /status_edit Swr:5:BCGreen
/def -p1 -mglob -t'You lose your contact with the dead rogue.' srw_down = /status_edit Swr:5:BCRed

/def -p1 -mglob -t'Nessy focuses its will and forms a powerful shield around itself!' und_shield_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Undying Shield \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^Nessy\%^RESET\%^
/def -p1 -mglob -t'Nessy loses its concentration and the shield around it disappears.' und_shield_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Undying Shield \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^Nessy\%^RESET\%^

;Debuffs
/def -p1 -mregexp -t'^([A-Z][a-z]+) becomes more susceptible to diseases.' vc_up = \
!say \%^BOLD\%^CYAN\%^Voodoo Curse \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t'^([A-Z][a-z]+) becomes less susceptible to diseases.' vc_down = \
!say \%^BOLD\%^CYAN\%^Voodoo Curse \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"You grin evilly at (.*) as you summon carrion crawlers to infest his wounds!" cc_up = \
!say \%^BOLD\%^CYAN\%^Carrion Crawlers \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"The carrion crawlers disappear from (.*)'s body." cc_down = \
!say \%^BOLD\%^CYAN\%^Carrion Crawlers \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+)'s limbs starts to rot!" rl_up = \
!say \%^BOLD\%^CYAN\%^Rotting Limbs \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+)'s limbs stops rotting." rl_down = \
!say \%^BOLD\%^CYAN\%^Rotting Limbs \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^

;Scourge buffs
/def -p1 -mglob -t"Nessy becomes more resistant." parenga_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Parenga \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^Nessy\%^RESET\%^
/def -p1 -mglob -t"Nessy becomes less resistant." parenga_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Parenga \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^Nessy\%^RESET\%^
/def -p1 -mglob -t"Wilbur grows smarter." roro_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Roro \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^Wilbur\%^RESET\%^
/def -p1 -mglob -t"Wilbur becomes dumber." roro_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Roro \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^Wilbur\%^RESET\%^

;Mindsurge
/def -p1 -mregexp -t"You focus inwards and suddenly a flow of energy passes from you, through your wooden staff of the necromancer into ([A-Z][a-z]+)!" surge_rep = !order %P1 report

;Status
/status_add -A@world -s1 -x Efield:6
/set Efield Efield
/status_add -AEfield -s1 -x Swp:6
/set Swp Priest
/status_add -ASwp -s1 -x Swm:4
/set Swm Magi
/status_add -ASwm -s1 -x Sww:3
/set Sww War
/status_add -ASww -s1 -x Swr:5
/set Swr Rogue
/status_add -ASwr -s1 -x VT:2
/set VT VT

;RDMP info for the status line
/status_add -AVT -s1 -x  -s1 -x hit_points:10:BCblue
/status_add -Ahit_points -s1 -x spell_points:10:BCblue
/status_add -Aspell_points -s1 -x endurance_points:10:BCblue
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_add -Amy_hunger -s1 -x mon_health:3:BCRed

;mob highlights
/def -aCred -p1 -mregexp -t'(Rott||Wilbur) begins to chant.'
/def -aCred -p1 -mregexp -t'(Rott|Nessy|Tp|Korfula) prepares (him|it)self to use a skill.'
