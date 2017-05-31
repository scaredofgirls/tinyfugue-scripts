/def rcalc = \
/set rsksp 0%;\
/if ({1} =~ "cromagnon" & {2} =~ "skill") /set rsksp 0.68%;\
/elseif ({1} =~ "cromagnon" & {2} =~ "spell") /set rsksp 0.84%;\
/elseif ({1} =~ "drow" & {2} =~ "skill") /set rsksp 0.94%;\
/elseif ({1} =~ "drow" & {2} =~ "spell") /set rsksp 0.8%;\
/elseif ({1} =~ "dwarf" & {2} =~ "skill") /set rsksp 0.72%;\
/elseif ({1} =~ "dwarf" & {2} =~ "spell") /set rsksp 0.92%;\
/elseif ({1} =~ "elf" & {2} =~ "skill") /set rsksp 0.96%;\
/elseif ({1} =! "elf" & {2} =~ "spell") /set rsksp 0.8%;\
/elseif ({1} =~ "ent" & {2} =~ "skill") /set rsksp 1.04%;\
/elseif ({1} =~ "ent" & {2} =~ "spell") /set rsksp 0.8%;\
/elseif ({1} =~ "faerie" & {2} =~ "skill") /set rsksp  0.88%;\
/elseif ({1} =~ "faerie" & {2} =~ "spell") /set rsksp 0.72%;\
/elseif ({1} =~ "gargoyle" & {2} =~ "skill") /set rsksp 0.8%;\
/elseif ({1} =~ "gargoyle" & {2} =~ "spell") /set rsksp 0.72%;\
/elseif ({1} =~ "giant" & {2} =~ "skill") /set rsksp 1%;\
/elseif ({1} =~ "giant" & {2} =~ "spell") /set rsksp 1.6%;\
/elseif ({1} =~ "gnome" & {2} =~ "skill") /set rsksp 0.84%;\
/elseif ({1} =~ "gnome" & {2} =~ "spell") /set rsksp 0.8%;\
/elseif ({1} =~ "goblin" & {2} =~ "skill") /set rsksp 0.8%;\
/elseif ({1} =~ "goblin" & {2} =~ "spell") /set rsksp 1.28%;\
/elseif ({1} =~ "grorrark" & {2} =~ "skill") /set rsksp 0.76%;\
/elseif ({1} =~ "grorrark" & {2} =~ "spell") /set rsksp 1.28%;\
/elseif ({1} =~ "halfelf" & {2} =~ "skill") /set rsksp 0.84%;\
/elseif ({1} =~ "halfelf" & {2} =~ "spell") /set rsksp 0.76%;\
/elseif ({1} =~ "hobbit" & {2} =~ "skill") /set rsksp 0.76%;\
/elseif ({1} =~ "hobbit" & {2} =~ "spell") /set rsksp 0.96%;\
/elseif ({1} =~ "human") /set rsksp 0.8%;\
/elseif ({1} =~ "kobold" & {2} =~ "skill") /set rsksp 0.8%;\
/elseif ({1} =~ "kobold" & {2} =~ "spell") /set rsksp 0.84%;\
/elseif ({1} =~ "leprechaun" & {2} =~ "skill") /set rsksp 0.84%;\
/elseif ({1} =~ "leprechaun" & {2} =~ "spell") /set rsksp 0.72%;\
/elseif ({1} =~ "lizardman" & {2} =~ "skill") /set rsksp 0.88%;\
/elseif ({1} =~ "lizardman" & {2} =~ "spell") /set rsksp 0.96%;\
/elseif ({1} =~ "mindflayer" & {2} =~ "skill") /set rsksp 1.12%;\
/elseif ({1} =~ "mindflayer" & {2} =~ "spell") /set rsksp 0.72%;\
/elseif ({1} =~ "minotaur" & {2} =~ "skill") /set rsksp 0.8%;\
/elseif ({1} =~ "minotaur" & {2} =~ "spell") /set rsksp 1.2%;\
/elseif ({1} =~ "ogier" & {2} =~ "skill") /set rsksp 0.92%;\
/elseif ({1} =~ "ogier" & {2} =~ "spell") /set rsksp 1.12%;\
/elseif ({1} =~ "phoenix" & {2} =~ "skill") /set rsksp 0.92%;\
/elseif ({1} =~ "phoenix" & {2} =~ "spell") /set rsksp 0.76%;\
/elseif ({1} =~ "snakeman" & {2} =~ "skill") /set rsksp 0.96%;\
/elseif ({1} =~ "snakeman" & {2} =~ "spell") /set rsksp 0.72%;\
/elseif ({1} =~ "thrikhren" & {2} =~ "skill") /set rsksp 0.88%;\
/elseif ({1} =~ "thrikhren" & {2} =~ "spell") /set rsksp 0.8%;\
/elseif ({1} =~ "troll" & {2} =~ "skill") /set rsksp 1.04%;\
/elseif ({1} =~ "troll" & {2} =~ "spell") /set rsksp 1.6%;\
/elseif ({1} =~ "vampire" & {2} =~ "skill") /set rsksp 0.88%;\
/elseif ({1} =~ "vampire" & {2} =~ "spell") /set rsksp 0.8%;\
/elseif ({1} =~ "vinnipier") /set rsksp 0.8%;\
/elseif ({1} =~ "xorn" & {2} =~ "skill") /set rsksp 0.88%;\
/elseif ({1} =~ "xorn" & {2} =~ "spell") /set rsksp 1.6%;\
/endif%;\
/if (!rsksp) /echo -p @{BCred}ERROR IN RCALC!@{n}%;/return%;\
/endif%;\
/echo -p @{BCcyan}%{1} %{2} %{3}@{n}%;\
/echo -p @{BCcyan}10  : $[rsksp*{3}]@{n}%;\
/echo -p @{BCcyan}15  : $[rsksp*{3}*2]@{n}%;\
/echo -p @{BCcyan}20  : $[rsksp*{3}*4]@{n}%;\
/echo -p @{BCcyan}25  : $[rsksp*{3}*7]@{n}%;\
/echo -p @{BCcyan}30  : $[rsksp*{3}*13]@{n}%;\
/echo -p @{BCcyan}35  : $[rsksp*{3}*24]@{n}%;\
/echo -p @{BCcyan}40  : $[rsksp*{3}*42]@{n}%;\
/echo -p @{BCcyan}45  : $[rsksp*{3}*70]@{n}%;\
/echo -p @{BCcyan}50  : $[rsksp*{3}*114]@{n}%;\
/echo -p @{BCcyan}55  : $[rsksp*{3}*180]@{n}%;\
/echo -p @{BCcyan}60  : $[rsksp*{3}*277]@{n}%;\
/echo -p @{BCcyan}65  : $[rsksp*{3}*416]@{n}%;\
/echo -p @{BCcyan}70  : $[rsksp*{3}*610]@{n}%;\
/echo -p @{BCcyan}75  : $[rsksp*{3}*877]@{n}%;\
/echo -p @{BCcyan}80  : $[rsksp*{3}*1237]@{n}%;\
/echo -p @{BCcyan}85  : $[rsksp*{3}*1716]@{n}%;\
/echo -p @{BCcyan}90  : $[rsksp*{3}*2344]@{n}%;\
/echo -p @{BCcyan}95  : $[rsksp*{3}*3157]@{n}%;\
/echo -p @{BCcyan}100 : $[rsksp*{3}*4198]@{n}%;\
/echo -p @{BCcyan}105 : $[rsksp*{3}*5515]@{n}%;\
/echo -p @{BCcyan}110 : $[rsksp*{3}*7166]@{n}%;\
/echo -p 

