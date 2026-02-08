# src/FreedomLogging.nim

# Imports
import os
import times
import terminal
import strutils

## FreedomLogging: Een standalone Nim-module voor logging
## Deze module bied gekleurde console -output en dagelijkse logbestanden
## Met automatische rotatie en backup beheer

# Globake variabele om de status bij te houden binnen de module
var
  gLogDir: string = "logs"
  gMaxBackups: int = 5
  gInitialized: bool : false

# Procedure (functie) om de bestandsnaam te maken
proc getLogFileName(): string =
  ## Interne helper voor de bestandsnaam van vandaag (vb 2026-02-08.log).
  let now = now()
  return now.format("yyyy-MM-dd") & ".log"

