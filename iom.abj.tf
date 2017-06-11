; Load base trigs
/load .tf/iom.tf
; Abj Keys
/def key_f1=/kill %vuln1PID%;!cast %vuln1%;/set vuln1PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln1}, 1)] falling.") ]
/def key_f2=/kill %vuln1PID%;!cast %vuln1 at first x%;/set vuln1PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln1}, 1)] falling.") ]
/def key_f3=/kill %vuln1PID%;!cast %vuln1 at second x%;/set vuln1PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln1}, 1)] falling.") ]
/def key_f4=/kill %vuln1PID%;!cast %vuln1 at third x%;/set vuln1PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln1}, 1)] falling.") ]
/def key_f5=/kill %vuln2PID%;!cast %vuln2%;/set vuln2PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln2}, 1)] falling.") ]
/def key_f6=/kill %vuln2PID%;!cast %vuln2 at first x%;/set vuln2PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln2}, 1)] falling.") ]
/def key_f7=/kill %vuln2PID%;!cast %vuln2 at second x%;/set vuln2PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln2}, 1)] falling.") ]
/def key_f8=/kill %vuln2PID%;!cast %vuln2 at third x%;/set vuln2PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln2}, 1)] falling.") ]
/def key_f9=/kill %vuln3PID%;!cast %vuln3%;/set vuln3PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln3}, 1)] falling.") ]
/def key_f10=/kill %vuln3PID%;!cast %vuln3 at first x%;/set vuln3PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln3}, 1)] falling.") ]
/def key_f11=/kill %vuln3PID%;!cast %vuln3 at second x%;/set vuln3PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln3}, 1)] falling.") ]
/def key_f12=/kill %vuln3PID%;!cast %vuln3 at third x%;/set vuln3PID $[repeat( "-54 1 /echo -aBCRed $[toupper({vuln3}, 1)] falling.") ]

; %;/repeat -60 1 /echo -aBCRed $[toupper({vuln3}, 1)] falling.

; Blasts
/def -p1 -mglob -t"You mutter the words 'whirrrl ad'appt'" recham = !cb

; Shields. Seperate file so other classes can use.
/load ~/.tf/iom.abj.prots.tf

; Disrupts/vulns.
/def -p1 -mregexp -t'^(.*) feels? extremely vulnerable to ([a-z]+) damage\.$' rupt_up = \
/if ({P1} =~ "You") \
    !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Disrupt \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Disrupt \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^(.*) feels? extremely vulnerable to ([a-z]+) damage again\.$' rupt_new = \
/if ({P1} =~ "You") \
    !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Disrupt \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\] \%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Disrupt \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^(.*) feels? (?:his|her|its) extreme vulnerability to ([a-z]+) damage fade\.$' rupt_down = \
/if ({P1} =~ "You") \
    !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Disrupt \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Disrupt \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^(.*) feels? more vulnerable to ([a-z]+) damage\.$' vuln_up = \
/if ({P1} =~ "You") \
    !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Vuln \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Vuln \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^(.*) feels? vulnerable to ([a-z]+) damage again\.$' vuln_new = \
/if ({P1}  =~ "You") \
    !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Vuln \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Vuln \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^(.*) feels? (?:his|her|its) vulnerability to ([a-z]+) damage fade\.$' vuln_down = \
/if ({P1}  =~ "You") \
    !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Vuln \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !say \%^BOLD\%^CYAN\%^$[toupper({P2}, 1)] Vuln \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^(.*) feels? .* willpower reduced\.$' weakwill_up = \
/if ({P1}  =~ "You") \
    !say \%^BOLD\%^CYAN\%^Weaken Willpower \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^Weaken Willpower \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^(.*) feels? .* willpower lowered again\.$' weakwill_new = \
/if ({P1}  =~ "You") \
    !say \%^BOLD\%^CYAN\%^Weaken Willpower \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^Weaken Willpower \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

; Quickwood tree's
/def -p1 -mregexp -t"^(.*?)'s? willpower is back at full strength\.$" weakwill_down = \
/if ({P1}  =~ "Your") \
    !say \%^BOLD\%^CYAN\%^Weaken Willpower \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
    /else !say \%^BOLD\%^CYAN\%^Weaken Willpower \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

; Highlight for aura detection
; /def -aCcyan -p1 -mregexp -t'[A-Z][a-z]+ is affected by the following spells: ([a-z]+ ?)+,? (and ([a-z]+ ?)+)?\.'
; one or more words, seperated by a space, either followed by a comma, or "[space]and[space]one or more words seperated by a space [period]

; iron will, aura of force, lesser acid shield, embrace of gaia, velenu and damage probe.
; RDMP Status Setup
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

; Run script to add shit to queue.
/def grank = /quote -dexec -S !%{script_dir}/grank.py "%*"
/def sshields = /qs gphy %*%;/qs iw %*%;/qs aof %*%;/qs aof %*%;/qs aof %*%;/qs cast xaqerb at %* with vehqetak%;/cq
/def rref = /quote -dexec -S !%{script_dir}/rref %*

;  Some defaults for vuln hotkeys
/set vuln1 weakened body
/set vuln2 weaken willpower
/set vuln3 chameleon energy blast
; wall down The forcefield vanishes.
; The forcefield vanishes.
; shelter up You create a shimmering forcefield.
