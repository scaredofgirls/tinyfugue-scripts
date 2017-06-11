#!/usr/bin/env python3

from random import randint
from sys import argv, exit

if len(argv) > 2:
    print("/echo You've specified too many arguments.")
    exit(1)

try:
    target = argv[1]
except IndexError:
    target = "me"

if target == "":
    target = "me"

sTypes = {
    "greater": 1,
    "lesser": 2,
}

numAOF = 3

dTypes = ["poison", "asphyxiation", "acid", "cold", "fire", "magical",
          "electric", "psionic", "physical"]
rTypes = ["berqa", "hsieb", "kiesah", "loghob", "qares", "seher", "velenu",
          "xeraq"]
spells = ["/qs !cast iron will at {0}".format(target),
          "/qs !cast orpo at {0}".format(target),
          "/qs !cast {0} at {1}".format(rTypes[randint(0, (len(rTypes) - 1))],
                                        target)
          ]

for spell in range(0, len(spells)):
    thisSpell = spells.pop(randint(0, (len(spells) - 1)))
    print(thisSpell)
    if thisSpell.split(" ")[2] in rTypes:
        print("/qs !cast nohexeqekor at {0}".format(target))
    print("/qs !cast aura detection at {0}".format(target))

for sType in sTypes.keys():
    for cast in range(0, sTypes[sType]):
        popInt = randint(0, (len(dTypes) - 1))
        print("/qs !cast {0} {1} shield at {2}".format(sType,
                                                       dTypes.pop(popInt),
                                                       target))
        print("/qs !cast aura detection at {0}".format(target))
        print("/qs !cast remove shields at {0}".format(target))

for x in range(0, numAOF):
    print("/qs !cast aura of force at {0}".format(target))
