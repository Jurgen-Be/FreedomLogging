# FreedomLogging for Nim

**FreedomLogging** is een krachtige, standalone logging-module voor Nim. Het biedt een eenvoudige interface voor zowel gekleurde console-output als gestructureerde dagelijkse logbestanden met automatische rotatie.

## Kenmerken
*   **Eenvoudige Initialisatie:** Eénmalig configureren via `log_init` en vervolgens overal in het project te gebruiken.
*   **Gekleurde Terminal Output:** Visuele ondersteuning voor verschillende log-niveaus (`log_success`, `log_warning`, `log_error`, etc.) via de standaard `terminal` module.
*   **Dagelijkse Logbestanden:** Maakt automatisch een nieuw logbestand aan per dag (formaat: `yyyy-MM-dd.log`).
*   **Filerotatie & Backupbeheer:** Beperkt automatisch het aantal bewaarde logbestanden op basis van de `maxBackups` instelling om schijfruimte te besparen.
*   **Optionele Console Output:** Flexibiliteit om console-output in of uit te schakelen, terwijl de logging naar bestanden altijd doorgaat.
*   **Geen Externe Afhankelijkheden:** Gebruikt uitsluitend de ingebouwde Nim-bibliotheken zoals `os`, `times`, `terminal` en `strutils`.
*   **Cross-platform:** Ontwikkeld en getest om correct te functioneren op zowel **Windows als Linux**.

## Installatie
Dankzij het meegeleverde `.nimble` bestand kan de module direct via Nimble worden geïnstalleerd vanaf GitHub:

```bash
nimble install https://github.com/Jurgen-Be/FreedomLogging
```

## Gebruik

### Initialisatie
Roep `log_init` eenmalig aan bij het opstarten van je applicatie om de map en rotatie-instellingen vast te leggen.

```nim
import FreedomLogging

# Initialisatie met logmap, max 7 backups en console-output AAN
log_init(dir = "logs", maxBackups = 7, toConsole = true)
```

### Loggen
Gebruik de specifieke log-functies voor duidelijke en visueel gescheiden meldingen:

```nim
log_success("Operatie succesvol voltooid.")   # Groen
log_info("Systeeminformatie bijgewerkt.")      # Cyan
log_warning("Aandacht vereist: bijna vol.")    # Geel
log_error("Kritieke fout in de verwerking!")   # Rood
log_debug("Debug-informatie voor analyse.")    # Blauw
```

## Projectstructuur
De module is als volgt ingedeeld:
*   `src/freedomlogging.nim`: De kernmodule met alle logica.
*   `freedomlogging.nimble`: Pakketconfiguratie voor installatie.
*   `tests/test_logger.nim`: Testscripts voor validatie van de werking.

## Licentie
Nog te bepalen, neem contact op met de maker.

***
