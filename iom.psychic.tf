/load ~/.tf/iom.tf

;This ensures we get don't false positives when seeing if we got this damage level
/set gzti none
/set gzai none
/set gzir none
/set gzer none
/set gzvr none
/set gzqr none
/set gzr none%
/set gzsr none
/set gzsv none
/set gzv none
/set gzqv none
/set gzvv none

/def -p1 -mregexp -t'Hit Points:   ([0-9]+)\%' gazestart = /set gzhp %P1
/def -p1 -mregexp -t'^\s+ Race/Type:   ([\w|\s]+)' gazetype = /set gzty %P1
/def -p1 -mregexp -t'^\s+ Combat Strength:\s+(\d+)' gazecomb = /set gzcs %P1
/def -p1 -mregexp -t'^\s+ Exp Worth:\s+(\d+)' gazeexp = /set gzxp %P1
/def -p1 -mregexp -t'^\s+ Least resistant:   (\w+)' gazeleast = /set gzlr %P1
/def -p1 -mregexp -t'^\s+ Most resistant:   (\w+)' gazemost = /set gzmr %P1
/def -p1 -mregexp -t'^\s+ Totally invulnerable:\s+(\w+)' gazeti = \
	/if (gzti =~ "none") /set gzti %P1%; \
	/else /set gzti $[%{gzti}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Almost invulnerable:\s+(\w+)' gazeai = \
	/if (gzai =~ "none") /set gzai %P1%; \
	/else /set gzai $[%{gzai}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Incredibly resistant:\s+(\w+)' gazeir = \
	/if (gzir =~ "none") /set gzir %P1%; \
	/else /set gzir $[%{gzir}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Extremely resistant:\s+(\w+)' gazeer = \
	/if (gzer =~ "none") /set gzer %P1%; \
	/else /set gzer $[%{gzer}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Very resistant:\s+(\w+)' gazevr = \
	/if (gzvr =~ "none") /set gzvr %P1%; \
	/else /set gzvr $[%{gzvr}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Quite resistant:\s+(\w+)' gazeqr = \
	/if (gzqr =~ "none") /set gzqr %P1%; \
	/else /set gzqr $[%{gzqr}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Resistant:\s+(\w+)' gazer = \
	/if (gzr =~ "none") /set gzr %P1%; \
	/else /set gzr $[%{gzr}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Slightly resistant:\s+(\w+)' gazesr = \
	/if (gzsr =~ "none") /set gzsr %P1%; \
	/else /set gzsr $[%{gzsr}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Slightly vulnerable:\s+(\w+)' gazesv = \
	/if (gzsv =~ "none") /set gzsv %P1%; \
	/else /set gzsv $[%{gzsv}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Vulnerable:\s+(\w+)' gazev = \
	/if (gzv =~ "none") /set gzv %P1%; \
	/else /set gzv $[%{gzv}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Quite vulnerable:\s+(\w+)' gazeqv = \
	/if (gzqv =~ "none") /set gzqv %P1%; \
	/else /set gzqv $[%{gzqv}], %P1%; \
	/endif
/def -p1 -mregexp -t'^\s+ Very vulnerable:\s+(\w+)' gazevv = \
	/if (gzvv =~ "none") /set gzvv %P1%; \
	/else /set gzvv $[%{gzvv}], %P1%; \
	/endif
/def -p1 -mregexp -t'^You gaze at (.+) and absorb some information.' gaze_done = \
	!say %P1 gazed.%; \
	!say %%\^BOLD%%\^%%\^YELLOW%%\^Health: %gzhp%%\^RESET%%\^%; \
	!say %%\^BOLD%%\^%%\^BLACK%%\^Combat Strength: %gzcs%%\^RESET%%\^%; \
	!say %%\^BOLD%%\^Monster Type: %gzty%%\^RESET%%\^%; \
	!say %%\^BOLD%%\^%%\^MAGENTA%%\^Exp Worth: %gzxp%%\^RESET%%\^%; \
	!say %%\^BOLD%%\^%%\^GREEN%%\^Least Resistant: %gzlr%%\^RESET%%\^%; \
	!say %%\^BOLD%%\^%%\^RED%%\^Most Resistant: %gzmr%%\^RESET%%\^%; \
	/if (gzvv !~ "none") !say %%\^ORANGE%%\^Very Vulnerable: %gzvv%%\^RESET%%\^%; \
	/endif%; \
	/if (gzqv !~ "none") !say %%\^ORANGE%%\^Quite Vulnerable: %gzqv%%\^RESET%%\^%; \
	/endif%; \
	/if (gzv !~ "none") !say %%\^ORANGE%%\^Vulnerable: %gzv%%\^RESET%%\^%; \
	/endif%; \
	/if (gzsv !~ "none") !say %%\^ORANGE%%\^Slightly Vulnerable: %gzsv%%\^RESET%%\^%; \
	/endif%; \
	/if (gzsr !~ "none") !say %%\^ORANGE%%\^Slightly Resistant: %gzir%%\^RESET%%\^%; \
	/endif%; \
	/if (gzr !~ "none") !say %%\^ORANGE%%\^Resistant: %gzr%%\^RESET%%\^%; \
	/endif%; \
	/if (gzqr !~ "none") !say %%\^ORANGE%%\^Quite Resistant: %gzqr%%\^RESET%%\^%; \
	/endif%; \
	/if (gzvr !~ "none") !say %%\^ORANGE%%\^Very Resistant: %gzvr%%\^RESET%%\^%; \
	/endif%; \
	/if (gzer !~ "none") !say %%\^ORANGE%%\^Extremely Resistant: %gzer%%\^RESET%%\^%; \
	/endif%; \
	/if (gzir !~ "none") !say %%\^ORANGE%%\^Incredibly Resistant: %gzir%%\^RESET%%\^%; \
	/endif%; \
	/if (gzai !~ "none") !say %%\^ORANGE%%\^Almost Invulnerable: %gzai%%\^RESET%%\^%; \
	/endif%; \
	/if (gzti !~ "none") !say %%\^ORANGE%%\^Totally Invulnerable: %gzti%%\^RESET%%\^%; \
	/endif%; \
	/set gzti none%; \
	/set gzai none%; \
	/set gzir none%; \
	/set gzer none%; \
	/set gzvr none%; \
	/set gzqr none%; \
	/set gzr none%; \
	/set gzsr none%; \
	/set gzsv none%; \
	/set gzv none%; \
	/set gzqv none%; \
	/set gzvv none

/def -p1 -mglob -t"You mutter the words 'Evol Eht Leefuoy Nac!'" re_nof = !cast nerves of fire

/set blastspell nerves of fire
/def key_f2=!cast soil shield
/def key_f3=!cast harmony of nature
/def key_f4=!cast embrace of gaia
/def key_f5=!cast %blastspell
/def key_f6=!cast %blastspell at a x
/def key_f7=!cast %blastspell at 2nd x
/def key_f8=!cast %blastspell at 3rd x
/def key_f9=!cast charge broom
/def key_f10=!use drain soil energy

;Druid statusline
/status_add -A@world -s1 -x  -s1 -x hit_points:12:BCblue
/status_add -Ahit_points -s1 -x spell_points:12:BCblue
/status_add -Aspell_points -s1 -x endurance_points:12:BCblue
/status_add -Aendurance_points -s1 -x my_hunger:2:BCcyan
/status_add -Amy_hunger -s1 -x mon_health:3:BCred
