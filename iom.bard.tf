;Load mudwide settings
/load .tf/iom.tf

;Fkeys
/def key_f2=!use acrobat stance
/def key_f3=!use limber up
/def key_f4=!use chant of smaug
/def key_f5=!use throw knife
/def key_f6=!use throw knife at a x
/def key_f7=!use funeral march at a corpse
/def key_f8=!use psalm of protection at me

;Set Status bar
/status_rm acro
/status_add -A@world -s1 -x acro:4
/set acro Acro
/status_rm limber
/status_add -Aacro -s1 -x limber:6
/set limber Limber

;Get knives
;/def -p1 -mglob -t'Your knife clatters to the ground.' get_knife = !get a knife
/def -p1 -mglob -t"You throw your knife *" re_throw = !draw kozaki throwing dagger from bandolier%;!use throw knife

/def -p1 -mglob -t'You feel the energy course through you as you finish the funeral march!' march_down = /echo [--> MARCH DOWN <--]
;Prots
/def -p1 -mglob -t'You enter an acrobat stance.' acro_up = /status_edit acro:4:BCGreen
/def -p1 -mglob -t'You feel your body control return to normal.' acro_down = /status_edit acro:4:BCRed
/def -p1 -mglob -t'You do some stretching exercises.' limber_up = /status_edit limber:6:BCGreen
/def -p1 -mglob -t'You feel your muscles tighten up.' limber_down = /status_edit limber:6:BCRed

;Songs
/def -p1 -mglob -t'You feel the wisdom of Mitra.' wis_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn to Mitra \%^BLUE\%^(\%^GREEN\%^Wis\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You no longer hold the wisdom of Mitra.' wis_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn to Mitra \%^BLUE\%^(\%^GREEN\%^Wis\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'^([A-Z][a-z]+) feels the wisdom of Mitra.' wis_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn to Mitra \%^BLUE\%^(\%^GREEN\%^Wis\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'^([A-Z][a-z]+) no longer holds the wisdom of Mitra.' wis_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn to Mitra \%^BLUE\%^(\%^GREEN\%^Wis\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You feel closer to the spirits of the gods.' spr_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Spirit \%^BLUE\%^(\%^GREEN\%^Spr\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You no longer feel close to the gods.' spr_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Spirit \%^BLUE\%^(\%^GREEN\%^Spr\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels closer to the spirits of the gods.' spr_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Spirit \%^BLUE\%^(\%^GREEN\%^Spr\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) no longer feels close to the gods.' spr_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Spirit \%^BLUE\%^(\%^GREEN\%^Spr\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You feel strengthened by the warsong of Mithren!' str_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Mithren's Warsong \%^BLUE\%^(\%^GREEN\%^Str\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t"You no longer feel the affects of Mithren's warsong." str_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Mithren's Warsong \%^BLUE\%^(\%^GREEN\%^Str\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels strengthened by the warsong of Mithren!' str_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Mithren's Warsong \%^BLUE\%^(\%^GREEN\%^Str\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+) no longer feels the affects of Mithren's warsong." str_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Mithren's Warsong \%^BLUE\%^(\%^GREEN\%^Str\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You swell in size!' con_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Grithmals Chant \%^BLUE\%^(\%^GREEN\%^Con\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You shrink.' con_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Grithmals Chant \%^BLUE\%^(\%^GREEN\%^Con\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) swells in size!' con_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Grithmals Chant \%^BLUE\%^(\%^GREEN\%^Con\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) shrinks.' con_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Grithmals Chant \%^BLUE\%^(\%^GREEN\%^Con\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You shudder as the song of the streets beats through your blood.' dex_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of the Streets \%^BLUE\%^(\%^GREEN\%^Dex\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You no longer feel the song of the streets.' dex_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of the Streets \%^BLUE\%^(\%^GREEN\%^Dex\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) shudders as the song of the streets beats through .* blood.' dex_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of the Streets \%^BLUE\%^(\%^GREEN\%^Dex\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) no longer feels the song of the streets.' dex_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of the Streets \%^BLUE\%^(\%^GREEN\%^Dex\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You feel just like Sinbad and can fight forever now.' sta_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Sinbad \%^BLUE\%^(\%^GREEN\%^Sta\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You feel less like Sinbad.' sta_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Sinbad \%^BLUE\%^(\%^GREEN\%^Sta\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels just like Sinbad and can fight forever now.' sta_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Sinbad \%^BLUE\%^(\%^GREEN\%^Sta\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels less like Sinbad.' sta_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Sinbad \%^BLUE\%^(\%^GREEN\%^Sta\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t"You feel more witty from Arabidopsis's story." int_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Arabidopsis \%^BLUE\%^(\%^GREEN\%^Int\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You no longer feel witty.' int_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Arabidopsis \%^BLUE\%^(\%^GREEN\%^Int\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+) feels more witty from Arabidopsis's story." int_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Arabidopsis \%^BLUE\%^(\%^GREEN\%^Int\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) no longer feels witty.' int_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Arabidopsis \%^BLUE\%^(\%^GREEN\%^Int\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You look more attractive.' cha_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Eye of the Beholder \%^BLUE\%^(\%^GREEN\%^Cha\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You are ugly again.' cha_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Eye of the Beholder \%^BLUE\%^(\%^GREEN\%^Cha\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) looks more attractive.' cha_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Eye of the Beholder \%^BLUE\%^(\%^GREEN\%^Cha\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) is ugly again.' cha_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Eye of the Beholder \%^BLUE\%^(\%^GREEN\%^Cha\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You feel honored by the gods!' hpr_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Honor \%^BLUE\%^(\%^GREEN\%^Hpr\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You no longer feel the honor of the gods.' hpr_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Honor \%^BLUE\%^(\%^GREEN\%^Hpr\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels honored by the gods!' hpr_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Honor \%^BLUE\%^(\%^GREEN\%^Hpr\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) no longer feels the honor of the gods.' hpr_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Honor \%^BLUE\%^(\%^GREEN\%^Hpr\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You feel the endowment of the gods.' epr_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Endowment \%^BLUE\%^(\%^GREEN\%^Epr\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You no longer feel the endowment of the gods.' epr_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Endowment \%^BLUE\%^(\%^GREEN\%^Epr\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels the endowment of the gods.' epr_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Endowment \%^BLUE\%^(\%^GREEN\%^Epr\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) no longer feels the endowment of the gods.' epr_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Endowment \%^BLUE\%^(\%^GREEN\%^Epr\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) surges with the power of Kreativ!' krea_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Glory of Kreativ \%^BLUE\%^(\%^GREEN\%^Hp Max\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) seems to shrivel slightly as the Glory of Kreativ fades.' krea_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Glory of Kreativ \%^BLUE\%^(\%^GREEN\%^Hp Max\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'You surge with the power of Kreativ!' krea_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Glory of Kreativ \%^BLUE\%^(\%^GREEN\%^Hp Max\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'You seem to  shrivel slightly as the Glory of Kreativ fades.' krea_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Glory of Kreativ \%^BLUE\%^(\%^GREEN\%^Hp Max\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You get protected by the power of the Psalm!' psprot_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Psalm of Protection \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You feel more vulnerable as the energy of the Psalm fades away.' psprot_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Psalm of Protection \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) gets protected by the power of the Psalm!' psprot_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Psalm of Protection \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels more vulnerable as the energy of the Psalm fades away.' psprot_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Psalm of Protection \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You blink as the effect of the legend of Sear leaves you.' sear_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Sear \%^BLUE\%^(\%^GREEN\%^Crit\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You seem entranced by the legend of Sear!' sear_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Sear \%^BLUE\%^(\%^GREEN\%^Crit\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) blinks as the effect of the legend of Sear leaves (him|her|it)\.' sear_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Sear \%^BLUE\%^(\%^GREEN\%^Crit\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) seems entranced by the legend of Sear!' sear_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Sear \%^BLUE\%^(\%^GREEN\%^Crit\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t"You feel some tiredness as Secs' blessing leaves you." secs_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Secs \%^BLUE\%^(\%^GREEN\%^Ep Max\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
;Denim suddenly feels tireless as the blessings of Secs enter his body!
/def -p1 -mregexp -t'You sing the Legend of Secs, and fill ([A-Z]?[a-z]+) with endurance and energy!' secs_up = \
	/if ({P1} =~ "yourself") !%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Secs \%^BLUE\%^(\%^GREEN\%^Ep Max\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%; \
	/else !%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Secs \%^BLUE\%^(\%^GREEN\%^Ep Max\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%; \
	/endif
/def -p1 -mregexp -t"([A-Z][a-z]+) feels some tiredness as Secs' blessing leaves (him|her|it)." secs_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Legend of Secs \%^BLUE\%^(\%^GREEN\%^Ep Max\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^
/def -p1 -mglob -t'You become less inspired as the memory of the epic of Aurvex fades.' aur_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Aurvex \%^BLUE\%^(\%^GREEN\%^Weapon Skill\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t"You seem inspired by Aurvex's epic tale!" aur_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Aurvex \%^BLUE\%^(\%^GREEN\%^Weapon Skill\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+) seems inspired by Aurvex's epic tale!" aur_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Aurvex \%^BLUE\%^(\%^GREEN\%^Weapon Skill\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) becomes less inspired as the memory of the epic of Aurvex fades.' aur_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Epic of Aurvex \%^BLUE\%^(\%^GREEN\%^Weapon Skill\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+) feels a loss of magical power as Ona's blessing leaves .*." ona_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Ode to Ona \%^BLUE\%^(\%^GREEN\%^Sp Max\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+)'s mind surges with the power of Ona!" ona_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Ode to Ona \%^BLUE\%^(\%^GREEN\%^Sp Max\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'Your mind surges with the power of Ona!' ona_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Ode to Ona \%^BLUE\%^(\%^GREEN\%^Sp Max\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t"You feel a loss of magical power as Ona's blessing leaves you." ona_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Ode to Ona \%^BLUE\%^(\%^GREEN\%^Sp Max\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) appears a bit confused for a moment as the energy of the song of destruction leaves .*.' dest_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Destruction \%^BLUE\%^(\%^GREEN\%^Melee Dmg\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) roars as the battle song fills .* with power.' dest_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Destruction \%^BLUE\%^(\%^GREEN\%^Melee Dmg\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You roar as the battle song fills you with power.' dest_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Destruction \%^BLUE\%^(\%^GREEN\%^Melee Dmg\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You appear a bit confused for a moment as the energy of the song of destruction leaves you.' dest_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Destruction \%^BLUE\%^(\%^GREEN\%^Melee Dmg\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You feel filled with hope and feel invulnerable!' resi_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Resilience \%^BLUE\%^(\%^GREEN\%^Phys Res\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'Your hope fades as the song of resilience loses its power.' resi_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Resilience \%^BLUE\%^(\%^GREEN\%^Phys Res\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels filled with hope and feels invulnerable!' resi_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Resilience \%^BLUE\%^(\%^GREEN\%^Phys Res\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+)'s hope fades as the song of resilience loses its power." resi_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Song of Resilience \%^BLUE\%^(\%^GREEN\%^Phys Res\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^

/def -p1 -mglob -t'You feel the blessing of Rawknrhol burn through you!' rawk_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Rawknrhol \%^BLUE\%^(\%^GREEN\%^Hpr/Str/Dex\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t"You feel weaker as Rawknrhol's favor leaves you." rawk_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Rawknrhol \%^BLUE\%^(\%^GREEN\%^Hpr/Str/Dex\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+) feels weaker as Rawknrhol's favor leaves .*." rawk_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Rawknrhol \%^BLUE\%^(\%^GREEN\%^Hpr/Str/Dex\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels the blessing of Rawknrhol burn through .*.!' rawk_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Rawknrhol \%^BLUE\%^(\%^GREEN\%^Hpr/Str/Dex\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels .* mind blessed by the song!' enl_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Enlightenment \%^BLUE\%^(\%^GREEN\%^Spr/Wis/Int\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You feel your mind blessed by the song!' enl_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Enlightenment \%^BLUE\%^(\%^GREEN\%^Spr/Wis/Int\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t"You feel that you lost the gods' enlightenment." enl_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Enlightenment \%^BLUE\%^(\%^GREEN\%^Spr/Wis/Int\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t"([A-Z][a-z]+) feels that she lost the gods' enlightenment." enl_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Hymn of Enlightenment \%^BLUE\%^(\%^GREEN\%^Spr/Wis/Int\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels its magic knowledge enhanced!' athol_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Allegory of Athol \%^BLUE\%^(\%^GREEN\%^Spell \%\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You feel your magic knowledge enhanced!' athol_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Allegory of Athol \%^BLUE\%^(\%^GREEN\%^Spell \%\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'You feel your grasp over magic returning to normal.' athol_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Allegory of Athol \%^BLUE\%^(\%^GREEN\%^Spell \%\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) feels her grasp over magic returning to normal.' athol_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Allegory of Athol \%^BLUE\%^(\%^GREEN\%^Spell \%\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1\%^RESET\%^
/def -p1 -mglob -t'You get encouraged by the tale of Achman!' achman_up_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Tale of Achman \%^BLUE\%^(\%^GREEN\%^Skill \%\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) gets encouraged by the tale of Achman!' achman_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Tale of Achman \%^BLUE\%^(\%^GREEN\%^Skill \%\%^BLUE\%^) \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mregexp -t'([A-Z][a-z]+) loses his enhanced knowledge as the effects of the tale of Achman fade.' achman_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Tale of Achman \%^BLUE\%^(\%^GREEN\%^Skill \%\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^
/def -p1 -mglob -t'You lose your enhanced knowledge as the effects of the tale of Achman fade.' achman_down_me = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Tale of Achman \%^BLUE\%^(\%^GREEN\%^Skill \%\%^BLUE\%^) \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^

;Macros
/def sing_hit = /qs strs %{*}%;/qs dexs %{*}%;/qs eprs %{*}%;/qs stas %{*}%;/qs use epic of aurvex at %{*}%;/qs use legend of secs at %{*}%;/qs use legend of sear at %{*}
/def sing_cast = /qs ints %{*}%;/qs wiss %{*}%;/qs sprs %{*}%;/qs use ode to ona at %{*}
/def sing_tank = /sing_hit %{*}%;/qs cons %{*}%;/qs hprs %{*}%;/qs psp %{*}%;/qs use glory of kreativ at %{*}
/def sing_all = /qs chas %{*}%;/sing_tank %{*}%;/sing_cast %{*}
/def sing_party = /qs ban glory of kreativ%;/qs ron epic of endowment%;/qs ron eye of the beholder%;/qs ron grithmals chant%;/qs ron hymn of honor%;/qs ron hymn to mitra%;/qs ron legend of arabidopsis%;/qs ron mithrens warsong%;/qs ron song of sinbad%;/qs ron song of spirit%;/qs ron song of the streets%;/qs use hymn of enlightenment%;/qs use hymn of rawknrhol%;/qs ban epic of aurvex%;/qs ban legend of sear%;/qs ban legend of secs%;/qs ban ode to ona%;/qs mr tale of achman%;/qs use song of resilience%;/qs use song of destruction

;RDMP Status Setup
/status_rm hit_points
/status_add -Alimber -s1 -x hit_points:12:BCblue
/status_rm spell_points
/status_add -Ahit_points -s1 -x spell_points:12:BCblue
/status_rm endurance_points
/status_add -Aspell_points -s1 -x endurance_points:12:BCblue
/status_rm my_hunger
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_rm mon_health
/status_add -Amy_hunger -s1 -x mon_health:3:BCred
