;load bast settings
/load .tf/iom.tf

;Fkeys
/def key_f2=!cast body of nether
/def key_f3=!cast stoneskin
/def key_f4=!cast stun shield
/def key_f5=!cast project energy blast
/def key_f6=!cast project energy blast at 1st x
/def key_f7=!cast project energy blast at 2nd x
/def key_f8=!cast project energy blast at 3rd x
;/def key_f5=!cast project energy blast
;/def key_f6=!cast project energy blast at 1st x
;/def key_f7=!cast project energy blast at 2nd x
;/def key_f8=!cast project energy blast at 3rd x
/def key_f9=!cast chain elemental bolts
/def key_f10=!cast chain elemental bolts at 1st x
/def key_f11=!cast chain elemental bolts at 2nd x
/def key_f12=!cast chain elemental bolts at 3rd x

;Prots
/def -p1 -mglob -t'You weave a pattern with the elemental energy stored in your nether body, surrounding yourself with a wall of elemental energy!' ele_wall_up = !%{prot_chan} \%^BOLD\%^CYAN\%^Elemental Wall \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'The elemental wall surrounding you fades away.' ele_wall_down = !%{prot_chan} \%^BOLD\%^CYAN\%^Elemental Wall \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^
/def -p1 -mglob -t'A blue shield surrounds you.' stsh_up = /status_edit stunshield:4:BCGreen
/def -p1 -mglob -t'The blue shield around you slowly disappears.' stsh_down = /status_edit stunshield:4:BCRed
/def -p1 -mglob -t'You concentrate and turn your body into a misty figure without substance!' bom_up = /status_edit ele_body:4:CGreen%;/set ele_body Mist
/def -p1 -mglob -t'Your body becomes solid again.' bom_down = /status_edit ele_body:6:CWhite%;/set ele_body Mortal
/def -p1 -mglob -t'You turn yourself into a fire elemental.' bof_up = /status_edit ele_body:4:CRed%;/set ele_body Fire
/def -p1 -mglob -t'You are no longer made of fire.' bof_down = /status_edit ele_body:6:CWhite%;/set ele_body Mortal
/def -p1 -mglob -t'Your body turns into stone.' bos_up = /status_edit ele_body:5:Crgb210%;/set ele_body Stone
/def -p1 -mglob -t'You are no longer made of stone.' bos_down = /status_edit ele_body:6:CWhite%;/set ele_body Mortal
/def -p1 -mglob -t'You flicker and warp, transforming yourself into an air elemental.' boa_up = /status_edit ele_body:5:CBlue%;/set ele_body Water
/def -p1 -mglob -t'You no longer are made of air.' boa_down = /status_edit ele_body:6:CWhite%;/set ele_body Mortal
/def -p1 -mglob -t'You call some tremendous elemental powers and turn your body into a nether form.' bon_up = /status_edit ele_body:6:CGreen%;/set ele_body Nether
/def -p1 -mglob -t'You feel that your nether form is weakening!' bon_falling = /status_edit ele_body:6:CYellow%;/set ele_body Nether
/def -p1 -mglob -t'You feel your body twitch as you rebuild the magic of your nether form.' bon_ref = /status_edit ele_body:6:CGreen%;/set ele_body Nether
/def -p1 -mglob -t'Your nether form fades away and your body turns back to flesh.' bon_down = /status_edit ele_body:6:CWhite%;/set ele_body Mortal
/def -p1 -mglob -t'You are surrounded by fumes and emerge in a lava form!' body_lava = /status_edit ele_body:4:CRed%;/set ele_body Lava
/def -p1 -mglob -t'You are no longer made of lava.' lava_body_down = /status_edit ele_body:6:CWhite%;/set ele_body Mortal
/def -p1 -mglob -t'Your body turns into water.' body_water = /status_edit ele_body:5:Cblue%;/set ele_body Water
/def -p1 -mglob -t'You are no longer made of water.' water_body_down = /status_edit ele_body:6:CWhite%;/set ele_body Mortal
/def -p1 -mglob -t'You feel your body twitch as you rebuild the magic that makes you a lava elemental.' bol_ref = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Body of Lava \%^RED\%^[\%^YELLOW\%^Refreshed\%^RED\%^]\%^RESET\%^
/def -p1 -mglob -t'You look like a statue.' stsk_up = /status_edit stoneskin:4:BCGreen
/def -p1 -mglob -t'You grow softer.' stsk_down = /status_edit stoneskin:4:BCRed
/def -p1 -mglob -t'You concentrate your mind over your nether form and enhance your control over the elemental energy flows.' control_up = /status_edit cee:1:BCGreen
/def -p1 -mglob -t'You concentrate and renew your controlling spell.' control_ref = /status_edit cee:1:BCGreen
/def -p1 -mglob -t'You feel that your controlling spell is about to fade away.' control_fade = /status_edit cee:1:BCYellow
/def -p1 -mglob -t'You feel your controlling spell fading away.' control_down = /status_edit cee:1:BCRed
/def -p1 -mglob -t'You weave an enchantment over your nether body, allowing it to absorb elemental damage.' aee_up = /status_edit aee:1:BCGreen
/def -p1 -mglob -t'Your nether form loses its absorbing powers.' aee_down = /status_edit aee:1:BCRed
;Blasts
/def -p1 -mglob -t"You mutter the words 'Vesuvii Fiiirre!'" re_magma = !cast magma boulder
/def -p1 -mglob -t"You mutter the words 'Bruuume verrrte!'" re_gmist = !cast green mist
/def -p1 -mglob -t"You mutter the words 'terra fista'" re_sf = !cast stone fist
/def -p1 -mglob -t"You mutter the words 'ram dam zaaaaaaap!!!!!'" re_lb = !cast lightning bolt
/def -p1 -mglob -t"You gather some energy from your nether body and project it into a blast of energy at *!" re_peb = !cast project energy blast
/def -p1 -mglob -t"Your elemental ball disappears in a flash of light!" ball_gone = /echo -p @{BCcyan}\[-->Ball Dispelled<--\]
/def -aBCgreen -p1 -mglob -t'A bolt of * energy darts from the energy ball summoned by you *'
/def -aBCgreen -p1 -mglob -t'A surprising flow of * energy escapes the energy ball you summoned *'

/def -p1 -mglob -t"Your floating disc weakens." re_disc = /echo -p @{BCcyan}\[-->Disc Weakening<--\]
;Status Line
/status_rm ele_body
/status_add -A@world -s1 -x ele_body:6
/set ele_body Mortal
/status_rm stoneskin
/status_add -Aele_body -s1 -x stoneskin:4
/set stoneskin StSk
/status_rm stunshield
/status_add -Astoneskin -s1 -x stunshield:4
/set stunshield StSh
/status_rm aee
/status_add -Astunshield -s1 -x aee:1
/set aee A
/status_rm cee
/status_add -Aaee -s1 -x cee:1
/set cee C
;RDMP Status Setup
/status_rm hit_points
/status_add -Acee -s1 -x hit_points:12:BCblue
/status_rm spell_points
/status_add -Ahit_points -s1 -x spell_points:12:BCblue
/status_rm endurance_points
/status_add -Aspell_points -s1 -x endurance_points:12:BCblue
/status_rm my_hunger
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_rm mon_health
/status_add -Amy_hunger -s1 -x mon_health:3:BCred
