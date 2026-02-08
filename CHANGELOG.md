CHANGELOG - FreedomLogging

Dit document houdt de wijzigingen en versies bij van de FreedomLogging module, gebaseerd op de Nim-implementatie van de FreedomLog suite.

[0.1.0] - Initiële Release (2024-05-22)

Toegevoegd

* De initiële release van FreedomLogging als een standalone Nim-module die functioneel identiek is aan de Python-versie van FreedomLog. Deze module is ontworpen voor eenvoudige integratie binnen grotere Nim-projecten.
* Implementatie van de volledige logging-suite met de volgende geëxporteerde procedures voor extern gebruik: log_init, log_success, log_info, log_warning, log_error, en log_debug.
* Introductie van log_init als het centrale configuratiepunt voor het initialiseren van terminalinstellingen en het opzetten van file-handles voor persistente logging.
* Gekleurde console-output via de Nim terminal module voor de niveaus success, warning en error. De correcte weergave van kleuren en bestandsafhandeling is geverifieerd op zowel Windows als Linux.
* Ondersteuning voor dagelijkse logbestanden inclusief automatische logica voor dagelijkse rotatie om de bestandsgrootte beheersbaar te houden.
* Mogelijkheid tot het configureren van de console-weergave, waardoor de gebruiker controle heeft over de visuele output tijdens runtime.

Technische Details

De module is bewust ontwikkeld met een "zero-dependency" filosofie om een naadloze integratie in de bredere Suite-architectuur te garanderen. De implementatie steunt uitsluitend op de Nim Standaardbibliotheek:

* os: Voor robuust mappen- en bestandsbeheer over verschillende besturingssystemen heen.
* times: Voor het genereren van nauwkeurige tijdstempels noodzakelijk voor de logbestanden.
* terminal: Voor cross-platform ondersteuning van gekleurde output in de console.
* strutils: Voor efficiënte tekstbewerking en formattering van logberichten.

Projectstructuur

De module hanteert de volgende indeling voor optimale compatibiliteit met de Nimble package manager:

* freedomlogging.nimble (Projectconfiguratie)
* src/freedomlogging.nim (Hoofdimplementatie van de module)
* tests/test_logger.nim (Testbestand voor functionele validatie)

Voor integratie in grotere Suite-projecten kan de volledige inhoud van de src/ map geëxporteerd worden naar de lokale src/utils/ directory om consistentie in de projectarchitectuur te bewaren.

Slotopmerkingen

Deze release legt de focus op eenvoud en gebruiksgemak, waarbij de vertrouwde workflow van de Python-versie behouden blijft binnen het Nim-ecosysteem. De nadruk ligt op een lichtgewicht voetafdruk zonder externe afhankelijkheden.
