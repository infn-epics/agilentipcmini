#!../../bin/linux-x86_64/ipcminiSample

#- You may have to change ipcminiSample to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

# Evironment variables
epicsEnvSet("STREAM_PROTOCOL_PATH", "${TOP}/db")
epicsEnvSet("BOOT","${TOP}/iocBoot/${IOC}")

## Register all support components
dbLoadDatabase "dbd/ipcminiSample.dbd"
ipcminiSample_registerRecordDeviceDriver pdbbase

### Create a IPCMini device instance
epicsEnvSet("DEVICE", "PSIOPDGL02")
epicsEnvSet("PORT", "ipcmini1")
epicsEnvSet("ADDR", "psiopdgl02.star.unical.it:23")
## Create asyn IP port for communication over TCP/IP
drvAsynIPPortConfigure ("$(PORT)", "$(ADDR)")
## Load record instances
dbLoadRecords("db/asynRecord.db","P=$(DEVICE):, R=ASYNRECORD, PORT=$(PORT), ADDR=0, IMAX=100, OMAX=100")
dbLoadRecords("db/ipc.template","DEVICE=$(DEVICE), PORT=$(PORT)")

#drvAsynSerialPortConfigure("PSIOPGUN01_PORT", "/dev/ttyACM16", 0, 0, 0)
#asynSetOption("PSIOPGUN01_PORT", -1, "baud", "9600")
#asynSetOption("PSIOPGUN01_PORT", -1, "bits", "8")
#asynSetOption("PSIOPGUN01_PORT", -1, "parity", "none")
#asynSetOption("PSIOPGUN01_PORT", -1, "stop", "1")
#asynSetOption("PSIOPGUN01_PORT", -1, "clocal", "Y")
#asynSetOption("PSIOPGUN01_PORT", -1, "crtscts", "N")
#dbLoadRecords("db/asynRecord.db","P=PSIOPGUN01:, R=ASYNRECORD, PORT=PSIOPGUN01_PORT, ADDR=0, IMAX=100, OMAX=100")
#dbLoadRecords("db/ipc.template","DEVICE=PSIOPGUN01, PORT=PSIOPGUN01_PORT")

#asynSetTraceMask("$(DEVICE)",-1,0x9)
#asynSetTraceIOMask("$(DEVICE)",-1,0x2)

cd "${TOP}/iocBoot/${IOC}"
iocInit

