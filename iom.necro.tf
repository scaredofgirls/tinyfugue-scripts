;Load base settings
/load .tf/iom.tf

;Fkeys
/def key_f2=!cast circle of protection
/def key_f3=!use death rites at 1st corpse
/def key_f4=!cast combine corpses
/def key_f5=!cast blister skin
/def key_f6=!cast mind blast
; Make this a macro TODO
/def key_f7=/nk at a x
/def key_f8=!cast rotting limbs
/def key_f9=!cast energy field
/def key_f10=!cast speak with priest
/def key_f11=!cast speak with magi
/def key_f12=!use repair undead at %{abom_name}
;Other Keys
/def -b'^[1' = !cast mind surge at %{abom_name}
/def -b'^[2' = !cast mind surge at %{mummy_name}
/def -b'^[3' = !cast mind surge at %{vampire_name}
/def -b'^[4' = !cast mind surge at %{wraith_name}
/def -b'^[5' = !cast mind surge at %{zombie_name}
/def -b'^h' = !cast cause light wounds with %{healtarg}

;Helpful info during reinc/training
/def gems = /echo "Bone Mage: Blue, Voodooist: Red, Necroscope: White, Dreadlord: Orange, Scourge: Yellow, Stygian Sorcerer: Green, Embalmer: Purple, Blood Brother: Black, Lords of Undeath: Gold"
;Summon familiars
;Uses spell queue, so you'll need to /set squeue 1 for spells after the first to cast
/def nsum = /qs cast recall minion with mummy%;/qs cast recall minion with vampire%;/qs cast recall minion with wraith%;/qs cast recall minion with zombie%;cast recall minion with abomination

;Attack macros
; nk: "necro kill"
/def nk = do cast voodoo curse %*;order %{zombie_name} use encephalitis %*;order %{abom_name} use bash %*;order %{wraith_name} cast mind intrusion %*;order %{mummy_name} use akh ba attack %*;order %{vampire_name} use kiss of life %*
;/def nk = do order %{abom_name} use bash %*;order %{wraith_name} cast ethereal fist %*
;Familiar stuffs
/def -p1 -mglob -t"Your familiar's name is now Abomination." name_abom = /repeat -5 1 /eval !do order abomination follow;order abomination name %{abom_name};order abomination tank;order abomination autoreport;order abomination wield all;order abomination setwimpy 20
/def -p1 -mglob -t"Your familiar's name is now Zombie." name_zombie = /repeat -5 1 /eval !do order zombie follow;order zombie name %{zombie_name};order zombie setwimpy 30;order zombie wear all
/def -p1 -mglob -t"Your familiar's name is now Wraith." name_wraith = /repeat -5 1 /eval !do order wraith name %{wraith_name};order wraith follow;order wraith setwimpy 30;order wraith wear all;order wraith wield all
/def -p1 -mglob -t"Your familiar's name is now Vampire." name_vampire = /repeat -5 1 /eval !do order vampire name %{vampire_name};order vampire follow;order vampire setwimpy 30;order vampire wear all;order vampire wield all
/def -p1 -mglob -t"Your familiar's name is now Mummy." name_mummy = /repeat -5 1 /eval !do order mummy name %{mummy_name};order mummy follow;order mummy setwimpy 30;order mummy wear all

;Blasts
/def -p1 -mglob -t"You mutter the words 'morrrrm o'r aa'hgda'" re_blist = !cast blister skin
/def -p1 -mglob -t"You concentrate deeply before unleashing a blast of psionic energy at *." re_mblast = !cast mind blast
/def -p1 -mglob -t"You draw symbols of disease on * body!" rott_limb = !cast rotting limbs
/def -p1 -mglob -t"You mutter the words 'fhjja'as kc'tta'" scc = !cast summon carrion crawlers
/def -p1 -mglob -t"Fistandantilus mutters the words 'buuunes 'ot 'ot Flames'" re_bbones = !order fistandantilus cast burning bones
; /def -p1 -mglob -t"LordSoth mutters the words 'Ogmis Yugu Oy'wercs!'" re_eth_fist = order LordSoth cast ethereal fist
/eval /def -p1 -mglob -t"%{abom_name} is ready to perform its skill." re_bash = order %{abom_name} use bash
/eval /def -p1 -mglob -t"%{mummy_name} focuses inwards to connect with his ka, but fails miserably." re_akh_ba = !order %{mummy_name} use akh ba attack
/eval /def -p1 -mglob -t"%{mummy_name} focuses inwards and connects with his ka. *" re_akh_ba2 = !order %{mummy_name} use akh ba attack
; Recast kiss of life. Commented out because the skill has a cooldown and can't be instantly recast
; TODO Figure out how long before recast, and set a timer. Then break that timer when a mob dies
; /eval /def -p1 -mglob -t"%{vampire_name} sinks his fangs deep into * neck, biting and sucking out * life blood." re_kol = !order %{vampire_name} use kiss of life
; To recast when vmap fails kiss of life
/eval /def -p1 -mglob -t"%{vampire_name} is * as his skill *" re_kol = !order %{vampire_name} use kiss of life
/eval /def -p1 -mglob -t"%{wraith_name} mutters the words 'Ogmis Yugu Oy'wercs!'" re_ethfist = !order %{wraith_name} cast ethereal fist
/eval /def -p1 -mglob -t"%{wraith_name} mutters the words 'SPAL inf flff luff!'" do_invade = !order %{wraith_name} cast mind invasion
/eval /def -p1 -mglob -t"%{wraith_name} mutters the words 'kbnaaaang kbNAAANG!'" re_eblast = !order %{wraith_name} cast ethereal blast
/eval /def -p1 -mglob -t"%{wraith_name} mutters the words 'Whooooomp SPLAT!'" re_intrude = !order %{wraith_name} cast mind intrusion

/eval /def -p1 -mglob -t"%{zombie_name} tries to infect *, but fails miserably!" re_ench = !order %{zombie_name} use encephalitis
/eval /def -p1 -mregexp -t'^%{zombie_name} infects (.*) with (anemia|cardiomyopathy|hydrocephalus|encephalitis)\.' disease_up = !say \%%%^BOLD\%%%^CYAN\%%%^$$[toupper({P2}, 1)] \%%%^RED\%%%^\[\%%%^GREEN\%%%^Up\%%%^RED\%%%^\] \%%%^BOLD\%%%^CYAN\%%%^on\%%%^RESET\%%%^BOLD\%%%^ %%P1\%%%^RESET\%%%^
/def -p1 -mregexp -t'^([A-Z][a-z, -]+) recovers from (anemia|cardiomyopathy|hydrocephalus|encephalitis)!' disease_down = !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\] \%^BOLD\%^CYAN\%^on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^
;/eval /def -p1 -mglob -t'%{zombie_name} infects * with encephalitis.' do_decay = !order %{zombie_name} cast touch of decay
; /eval /def -p1 -mglob -t'%{zombie_name} infects * with encephalitis.' do_anemia = !order %{zombie_name} use anemia

;Prots
/def -p1 -mglob -t"You are surrounded by an energy field." efield_up = /status_edit Efield:6:BCGreen
/def -p1 -mglob -t"The energy field around you fades away." efield_down = /status_edit Efield:6:BCRed
/def -p1 -mglob -t"You close your eyes, then open filled with the spirit of the priest." swp_up = /status_edit Swp:6:BCGreen
/def -p1 -mglob -t"You lose your contact with the dead priest." swp_down = /status_edit Swp:6:BCRed
/def -p1 -mregexp -t"You draw runes of power on (your|([A-Z][a-z]+)'s) body." immun_up = \
    /if ({P1} =~ "your") \
        !%{prot_chan} \%^BOLD\%^CYAN\%^CYAN\%^Strengthen Immunity \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^RESET\%^%;\
    /else !%{prot_chan} \%^BOLD\%^CYAN\%^Strengthen Immunity \%^RED\%^[\%^GREEN\%^Up\%^RED\%^]\%^CYAN\%^BOLD\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif
/def -p1 -mregexp -t"(Your|([A-Z][a-z]+)'s) body looks weaker." immun_down = \
    /if ({P1} =~ "Your") \
        !%{prot_chan} \%^BOLD\%^CYAN\%^Strengthen Immunity \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^RESET\%^%;\
    /else !%{prot_chan} \%^BOLD\%^CYAN\%^Strengthen Immunity \%^RED\%^[\%^BLUE\%^Down\%^RED\%^]\%^CYAN\%^BOLD\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
    /endif

/def -p1 -mglob -t"You close your eyes, then open filled with the spirit of the magi." swm_up = /status_edit Swm:4:BCGreen
/def -p1 -mglob -t"You lose your contact with the dead magi." swm_down = /status_edit Swm:4:BCRed
/def -p1 -mglob -t"You close your eyes, then open filled with the spirit of the warrior." sww_up = /status_edit Sww:3:BCGreen
/def -p1 -mglob -t"You lose your contact with the dead warrior." sww_down = /status_edit Sww:3:BCRed
/def -p1 -mglob -t"You are surrounded by a pulsating aura of force!" vt_up = /status_edit VT:2:BCGreen
/def -p1 -mglob -t"The aura around you fades." vt_down = /status_Edit VT:2:BCRed
/def -p1 -mglob -t'You close your eyes, then open filled with the spirit of the rogue.' swr_up = /status_edit Swr:5:BCGreen
/def -p1 -mglob -t'You lose your contact with the dead rogue.' srw_down = /status_edit Swr:5:BCRed

/eval /def -p1 -mglob -t'%{abom_name} focuses its will and forms a powerful shield around itself!' und_shield_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Undying Shield \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%{abom_name}\%^RESET\%^
/eval /def -p1 -mglob -t'%{abom_name} loses its concentration and the shield around it disappears.' und_shield_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Undying Shield \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%{abom_name}\%^RESET\%^

;Debuffs
/def -p1 -mregexp -t"^([A-Za-z' -]+) becomes more susceptible to diseases." vc_up = \
!say \%^BOLD\%^CYAN\%^Voodoo Curse \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"^([A-Za-z' -]+) becomes less susceptible to diseases." vc_down = \
!say \%^BOLD\%^CYAN\%^Voodoo Curse \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"You grin evilly at (.*) as you summon carrion crawlers to infest (his|her|its) wounds!" cc_up = \
!say \%^BOLD\%^CYAN\%^Carrion Crawlers \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"The carrion crawlers disappear from (.*)'s body." cc_down = \
!say \%^BOLD\%^CYAN\%^Carrion Crawlers \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"([A-Za-z -]+)'s limbs start to rot!" rl_up = \
!say \%^BOLD\%^CYAN\%^Rotting Limbs \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^
/def -p1 -mregexp -t"([A-Za-z -]+)'s limbs stop rotting." rl_down = \
!say \%^BOLD\%^CYAN\%^Rotting Limbs \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on \%^RESET\%^BOLD\%^%P1\%^RESET\%^

;Scourge buffs
/eval /def -p1 -mglob -t"%{abom_name} becomes more resistant." parenga_up = \
!%{prot_chan} \%%%^BOLD\%%%^CYAN\%%%^Parenga \%%%^RED\%%%^\[\%%%^GREEN\%%%^Up\%%%^RED\%%%^\]\%%%^CYAN\%%%^ on \%%%^RESET\%%%^BOLD\%%%^%{abom_name}\%%%^RESET\%%%^
/eval /def -p1 -mglob -t"%{abom_name} becomes less resistant." parenga_down = \
!%{prot_chan} \%%%^BOLD\%%%^CYAN\%%%^Parenga \%%%^RED\%%%^\[\%%%^BLUE\%%%^Down\%%%^RED\%%%^\]\%%%^CYAN\%%%^ on \%%%^RESET\%%%^BOLD\%%%^%{abom_name}\%%%^RESET\%%%^
/eval /def -p1 -mglob -t"%{wraith_name} grows smarter." roro_up = \
!%{prot_chan} \%%%^BOLD\%%%^CYAN\%%%^Roro \%%%^RED\%%%^\[\%%%^GREEN\%%%^Up\%%%^RED\%%%^\]\%%%^CYAN\%%%^ on \%%%^RESET\%%%^BOLD\%%%^%{wraith_name}\%%%^RESET\%%%^
/eval /def -p1 -mglob -t"%{wraith_name} becomes dumber." roro_down = \
!%{prot_chan} \%%%^BOLD\%%%^CYAN\%%%^Roro \%%%^RED\%%%^\[\%%%^BLUE\%%%^Down\%%%^RED\%%%^\]\%%%^CYAN\%%%^ on \%%%^RESET\%%%^BOLD\%%%^%{wraith_name}\%%%^RESET\%%%^

;Mindsurge
/def -p1 -mregexp -t"You focus inwards and suddenly a flow of energy passes from you, through your wooden staff of the necromancer into ([A-Z][a-z]+)!" surge_rep = !order %P1 report

;Have the mummy carry corpses. The mummy?! Why? Because mummies are uhh ... good at ... carrying stuff
/def -p1 -mglob -t'Using your wooden staff of the necromancer you draw a conserving rune over * corpse, preserving it for later use.' mummy_get_corpse = !order mummy get a corpse
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
/status_add -AVT -s1 -x  -s1 -x hit_points:12:BCblue
/status_add -Ahit_points -s1 -x spell_points:12:BCblue
/status_add -Aspell_points -s1 -x endurance_points:12:BCblue
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_add -Amy_hunger -s1 -x mon_health:3:BCRed

;mob highlights
/eval /def -aCred -p1 -mregexp -t'^(%{zombie_name}|%{wraith_name}) begins to chant.'
/eval /def -aCred -p1 -mregexp -t'(%{zombie_name}|%{abom_name}|%{mummy_name}|%{vampire_name}) prepares (him|it)self to use a skill.'
