;buff file format is
;target buffname status
;status is up or down

/set bufflog=~/.tf/buff.log

/def read_buffs = \
	/let fh_read=$[tfopen({bufflog}, 'r')]%;\
	/test tfread(fh_read,line)%;\
	/eval /echo %line%;\
	/test tfclose(fh_read)

/def write_buff = \
	/test fwrite({bufflog}, "fuck")
