import ../src/FreedomLogging
import os

# 1. Initialiseer de logger
# We gebruiken een aparte map voor de testlogs en zetten de console-output AAN.
log_init(dir = "test_logs", maxBackups = 3, toConsole = true)

echo "--- Start van de Logger Test ---"

# 2. Test alle verschillende log-niveaus
log_success("Dit is een succesbericht (Groen)")
log_info("Dit is een informatiebericht (Cyan)")
log_warning("Dit is een waarschuwing (Geel)")
log_error("Dit is een foutmelding (Rood)")
log_debug("Dit is een debug-bericht (Blauw)")

# 3. Test de bestandscreatie
if dirExists("test_logs"):
  echo "\n[TEST] De map 'test_logs' is succesvol aangemaakt."
else:
  echo "\n[TEST] FOUT: Map 'test_logs' niet gevonden!"

echo "--- Einde van de Test ---"