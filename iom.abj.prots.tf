;Greater Shields.
;;Up
/def -p1 -mregexp -t'^([A-Z][a-z]+) is encased within a strong magical shield protecting .* from ([a-z]+) damage!' \
mshie_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Greater $[toupper({P2}, 1)] Shield \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mregexp -t'You are encased within a strong magical shield protecting you from ([a-z]+) damage!' \
mshie_upme = !%{prot_chan} \%^BOLD\%^CYAN\%^Greater $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^

;;Refresh
/def -p1 -mregexp -t'The powerful magical shield of (\w+) protection around (\w+) shimmers with resurgent energy.' mshie_new = \
/if ({P2} =~ "you") \
!%{prot_chan} \%^BOLD\%^CYAN\%^Greater $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Greater $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P2 \%^RESET\%^%;\
/endif

;;Down
                     
/def -p1 -mregexp -t"The powerful magical shield of ([a-z]+) protection around ([A-Za-z '-]+) flickers quickly, then disappears completely\." \
mshie_down = /if ({P2} =~ "you") \
!%{prot_chan} \%^BOLD\%^CYAN\%^Greater $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Greater $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P2 \%^RESET\%^%;\
/endif


;Lesser Shields.
/def -p1 -mregexp -t'^([A-Z][a-z]+) is encased within a magical shield protecting .* from ([a-z]+) damage!' \
lshie_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Lesser $[toupper({P2}, 1)] Shield \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mregexp -t'You are encased within a magical shield protecting you from ([a-z]+) damage!' \
lshie_upme = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Lesser $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^

/def -p1 -mregexp -t'The magical shield of (\w+) protection around (\w+) shimmers with resurgent energy.' \
lshie_new = \
/if ({P2} =~ "you") \
!%{prot_chan} \%^BOLD\%^CYAN\%^Lesser $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Lesser $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P2 \%^RESET\%^%;\
/endif

;TODO FIXME

/def -p1 -mregexp -t'The magical shield of (\w+) protection around (\w+) flickers quickly, then disappears completely.' \
lshie_down = /if ({P2} =~ "you") \
!%{prot_chan} \%^BOLD\%^CYAN\%^Lesser $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Lesser $[toupper({P1}, 1)] Shield \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P2 \%^RESET\%^%;\
/endif

;Aura of force.
/def -p1 -mregexp -t'^An aura of force appears around (\w+).' \
aof_up = /if ({P1} =~ "you")  \
!%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Force \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Force \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'The aura of force surrounding (\w+) flares with renewed power.' aof_new = \
/if ({P1} =~ "you")  \
!%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Force \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Force \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^The aura of force surrounding (\w+) disappears.' aof_down = \
/if ({P1} =~ "you") \
!%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Force \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Aura of Force \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

;Iron Will
/def -p1 -mregexp -t"^([A-Z][a-z]+)'.* concentration increases!" iw_up = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Iron Will \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mglob -t'Your concentration increases!' iw_upme = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Iron Will \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^

/def -p1 -mglob -t'Your concentration increases again!' iw_newme = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Iron Will \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^RESET\%^

/def -p1 -mregexp -t"([A-Z][a-z]+)'.* concentration increases again!" iw_new = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Iron Will \%^RED\%^\[\%^YELLOW\%^Renewed\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mregexp -t"^([A-Z][a-z]+)'.*mind wanders off as .* intense concentration is broken." iw_down = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Iron Will \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^

/def -p1 -mglob -t'Your mind wanders off as your intense concentration is broken.' iw_downme = \
!%{prot_chan} \%^BOLD\%^CYAN\%^Iron Will \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^

;Reflects
/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a bright white light.' holref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Holy Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Holy Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing bright white.' holref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Holy Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Holy Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a dark black aura.' unhref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Unholy Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Unoly Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing dark black.' unhref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Unholy Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Unoly Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) flash.* in a shade of green.' orpo_up = \
        /if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Orpo \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
       		 /else !%{prot_chan} \%^BOLD\%^CYAN\%^Orpo \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
	/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) flash.* in a shade of blue.' orpo_down = \
	/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Orpo \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
		/else !%{prot_chan} \%^BOLD\%^CYAN\%^Orpo \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
	/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a cloudy light blue shield' aspref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Asphyxiation Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Asphyxiation Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a swirling bright red shield' firref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Fire Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Fire Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a crackling silver aura' eleref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Electric Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Electric Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a bright pink shield' aciref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Acid Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Acid Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a swirling green aura' poiref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Poison Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Poison Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a sparkling purple shield' magref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Magic Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Magic Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a yellow sphere' psiref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Psionic Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Psionic Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a glowing white aura' colref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Cold Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Cold Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) (is|are) suddenly enveloped in a dull brown shield.' phyref_up = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Physical Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Physical Reflect \%^RED\%^\[\%^GREEN\%^Up\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing dull brown.' phyref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Physical Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Physical Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing white.' colref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Cold Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Cold Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing yellow.' psiref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Psionic Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Psionic Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing purple.' magref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Magic Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Magic Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing green' poiref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Poison Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Poison Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing pink' aciref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Acid Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Acid Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing silver' eleref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Electric Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Electric Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing red' firref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Fire Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Fire Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif

/def -p1 -mregexp -t'^([A-Z][a-z]+) stops? glowing blue' aspref_down = \
/if ({P1} =~ "You") !%{prot_chan} \%^BOLD\%^CYAN\%^Asphyxiation Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^RESET\%^%;\
/else !%{prot_chan} \%^BOLD\%^CYAN\%^Asphyxiation Reflect \%^RED\%^\[\%^BLUE\%^Down\%^RED\%^\]\%^CYAN\%^ on\%^RESET\%^BOLD\%^ %P1 \%^RESET\%^%;\
/endif
