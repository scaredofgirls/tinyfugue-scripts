/eval /log -w %{log_dir}/zombie/$[ftime("%F")]
/eval /log -i %{log_dir}/zombie/$[ftime("%F")]

; On (re)connect:
; set color_map on
; term ansi+
; set autoloot always
; set report_fatigue on
; set delimiter ;
/def -aBCmagenta -p1 -mglob -t'You start concentrating on the skill.' 
/def -aBCmagenta -p1 -mglob -t'You start chanting.'
/def -aCgreen -p1 -mglob -t'Fatigue changed: *'

/load .tf/queue.tf
/newQueue -nspells
/set squeue 0
/def -aCmagenta -p1 -mregexp -t'^You (are prepared to do the skill\.|are done with the chant\.)' cq = \
    /if (squeue == 1) \
        /qr -nspells%; \
    	/let this_spell=%{?}%; \
    	/if (this_spell != -1) \
    		/repeat -0.73 1 /eval %{this_spell}%; \
    	/endif%; \
    /endif

;ranger
/def -p1 -mglob -t'The wolf nods friendly at you.' wolf_up = !use beast speech at follow me
/def -p1 -mglob -t'You see an obvious opening in * defense, *' re_cleave = !use cleave

/def key_f2=!use beast speech at eat corpse
/def key_f5=!use cleave
/def key_f6=!use cleave at x
; samaurai
/def -p1 -mglob -t'You make a shuriken.' fopsafkd = /if (bot=1) use make shuriken%;/endif
/def -p1 -mglob -t'You fail to make a shuriken.' 4fopsafkd = /if (bot=1) use make shuriken%;/endif
/def gobogimps = brief on%; 9 w%;20 sw%;14 w%;14 w%;3 sw%;brief off
/def rebogimps = brief on%; 3 ne%;14 e%;14 e%;20 ne%;9 e%;brief off
/def godarkwater = brief on%; 15 w%;9 n%;15 nw%;15 w%;15 n%;15 n%;brief off
/def redarkwater = brief on%; 15 s%;15 s%;15 e%;15 se%;9 s%;15 e%;brief off
/def gosirros = brief on%; 10 s%;20 w%;20 w%;18 n%;brief off
/def resirros = brief on%; 18 s%;20 e%;20 e%;10 n%;brief off
/def godryad = brief on;16 e;3 s;12 se;brief off
/def redryad = brief on;12 nw;3 n;16 w;brief off
/def godruidcastle = brief on;9 s;10 w;10 w;6 w;brief off
/def redruidcastle = brief on;6 e;10 e;10 e;9 n;brief off

;Enable Keypad movement
/def key_nkp1=!southwest
/def key_nkp2=!south
/def key_nkp3=!southeast
/def key_nkp4=!west
/def key_nkp5=!look
/def key_nkp6=!east
/def key_nkp7=!northwest
/def key_nkp8=!north
/def key_nkp9=!northeast
/def key_nkp+=!down
/def key_nkp-=!up
/def key_nkp*=!last %{prot_chan}
/def -i key_nkpEnt = \
	/if (kblen()==0) \
		/dokey RECALLB%;\
		/else \
		/dokey NEWLINE%;\
		/dokey RECALLB%;\
	/endif
