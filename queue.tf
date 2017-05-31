/def newQueue = \
	/if (!getopts("n:")) \
		/eval /echo -p % Please supply a queue name with -n.%; \
		/return -1%; \
	/endif%; \
	/if (opt_n =~ "") \
		/eval /echo -p % Please supply a queue name.%; \
		/echo {opt_n} %; \
		/return -1%; \
	/endif%; \
	/set %{opt_n}_id=$[tfopen({opt_n}, "q")]

/def qi = \
	/if (!getopts("n:d:")) \
		/eval /echo -p % Please supply a queue name with -n and data to insert with -d.%; \
		/return -1%; \
	/endif%; \
	/let this_id $(/expr %{opt_n}_id)%; \
	/if (!this_id) \
		/eval /echo -p % Please supply a queue name.%; \
		/return -1%; \
	/endif%; \
	/if (opt_d =~ "") \
		/eval /echo -p % Please supply data to insert.%; \
		/return -1%; \
	/endif%; \
	/if (!tfwrite(this_id, opt_d)) \
		/eval /echo -p % Error writing to stream.%; \
		/return -1%; \
	/endif

/def qr = \
;Force the variable data into local scope.
    /let data=%; \
	/if (!getopts("n:")) \
		/eval /echo -p % Please supply the name of a queue to read from with -n.%; \
		/return -1%; \
	/endif%; \
	/let this_id $(/expr %{opt_n}_id) %; \
	/if (!this_id) \
		/eval /echo -p % Please supply the name of a queue to read from.%; \
		/return -1%; \
	/endif%; \
	/if (tfread(this_id, data) <= 0) \
		/return -1%; \
	/else \
		/return data%; \
	/endif

/def killQueue = \
	/if (!getopts("n:")) \
		/eval /echo -p % %{opt_n}; \
		/return -1%; \
	/endif%; \
	/if (opt_n =~ "") \
		/echo /echo -p % opt_n is unset.%; \
		/return -1%; \
	/endif%; \
	/let this_id $(/expr %{opt_n}_id) %; \
	/if (tfclose(this_id)) \
		/eval /echo -p % Error closing stream. %; \
	/endif%; \
	/unset %{opt_n}_id

/def qs = /qi -nspells -d"%{*}"
