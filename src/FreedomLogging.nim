# src/FreedomLogging.nim

# Imports
import os
import times
import terminal
import strutils
import algorithm

## FreedomLogging: Een standalone Nim-module voor logging
## Deze module bied gekleurde console -output en dagelijkse logbestanden
## Met automatische rotatie en backup beheer

# Globake variabele om de status bij te houden binnen de module
var
  gLogDir: string = "logs"
  gMaxBackups: int = 5
  gToConsole: bool = false
  gInitialized: bool = false

# Procedure (functie) om de bestandsnaam te maken
proc getLogFileName(): string =
  ## Interne helper voor de bestandsnaam van vandaag (vb 2026-02-08.log).
  let now = now()
  return now.format("yyyy-MM-dd") & ".log"

# Procedure (functie) voor de logrotatie
proc rotateLogs() =
  ## Verwijderd de oudste logbestanden als GMaxBackups word overschreden.
  if not dirExists(gLogDir): return

  var files: seq[string] = @[]
  for file in walkFiles(joinPath(gLogDir, "*.log")):
    files.add(file)

  if files.len > gMaxBackups:
    # Chronologisch sorteren om de oudste te bepalen
    files.sort()
    for i in 0 ..< (files.len - gMaxBackups):
      removeFile(files[i])

# Procedure (functie) om te schrijven naar het log bestand
proc writeToFile(level, message: string) =
  ## Schrijft het bericht naar het juiste logbestand met een tijdstempel.
  if not gInitialized: return

  let fileName = getLogFileName()
  let fullPath = joinPath(gLogDir, fileName)
  let timestamp = now().format("HH:mm:ss")
  let logEntry = "[$1] $2: $3\n" % [timestamp, level.toUpperAscii(), message]

  try:
    createDir(gLogDir)
    let f = open(fullPath, fmAppend)
    f.write(logEntry)
    f.close()
    rotateLogs()
  except IOError:
    if gToConsole:
      echo "Fout: kan niet schrijven naar " & fullPath

# Procedure (functie) om de logger te initaliseren
proc log_init*(dir: string = "logs", maxBackups: int = 5, toConsole: bool = false) =
  ## Eenmalig aanroepen van de logger
  gLogDir = dir
  gMaxBackups = maxBackups
  gToConsole = toConsole
  gInitialized = true
  createDir(gLogDir)

# Log berichten procedure's
proc log_success*(msg: string) =
  ## Logt een succesbericht in het groen naar console en het bestand.
  if gToConsole:
    stdout.setForegroundColor(fgGreen)
    echo "[SUCCESS] " & msg
    resetAttributes()
  writeToFile("success", msg)

proc log_info*(msg: string) =
  if gToConsole:
    stdout.setForegroundColor(fgCyan)
    echo "[INFO] " & msg
    resetAttributes()
  writeToFile("info", msg)

proc log_warning*(msg: string) =
  if gToConsole:
    stdout.setForegroundColor(fgYellow)
    echo "[WARNING] " & msg
    resetAttributes()
  writeToFile("warning", msg)

proc log_error*(msg: string) =
  if gToConsole:
    stdout.setForegroundColor(fgRed)
    echo "[ERROR] " & msg
    resetAttributes()
  writeToFile("error", msg)

proc log_debug*(msg: string) =
  if gToConsole:
    stdout.setForegroundColor(fgBlue)
    echo "[DEBUG] " & msg
    resetAttributes()
  writeToFile("debug", msg)