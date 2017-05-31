;Disable Clock Display, gives more room on the status line, and my WM has a clock.
/clock off

;Disable activity/trigger notifcations on the status line.
/def -ag -h'ACTIVITY'
/def -ag -h'BGTRIG'
/status_rm @active

;Start logging
/eval /log %{log_dir}/iom/wiz.$[ftime("%F")]
/eval /log -i %{log_dir}/iom/wiz.$[ftime("%F")]

;Enable Keypad ovement
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

;/def -p1 -mregexp -t'Mantrovant enters Islands of Myth' lol = !curse mantrovant omglol
