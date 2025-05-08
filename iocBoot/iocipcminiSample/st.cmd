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
epicsEnvSet("DEVICE", "SPARC:VACUUM")
epicsEnvSet("PORT", "ipcmini1")
epicsEnvSet("IP", "192.168.197.105:4002")
## Create asyn IP port for communication over TCP/IP
drvAsynIPPortConfigure ("$(PORT)", "$(IP)")
## Load record instances
epicsEnvSet("AD485",0x86)
dbLoadRecords("db/asynRecord.db","P=$(DEVICE):RFDSIP01:, R=ASYNRECORD, PORT=$(PORT), ADDR=0x85, IMAX=100, OMAX=100")
dbLoadRecords("db/asynRecord.db","P=$(DEVICE):PTLSIP01:, R=ASYNRECORD, PORT=$(PORT), ADDR=0x86, IMAX=100, OMAX=100")
dbLoadRecords("db/asynRecord.db","P=$(DEVICE):PTLSIP02:, R=ASYNRECORD, PORT=$(PORT), ADDR=0x87, IMAX=100, OMAX=100")

dbLoadRecords("db/ipc.template","DEVICE=$(DEVICE):RFDSIP01,ADDR=0x85, PORT=$(PORT),SCANRATE=1 second")
dbLoadRecords("db/ipc.template","DEVICE=$(DEVICE):PTLSIP01,ADDR=0x86, PORT=$(PORT),SCANRATE=1 second")
dbLoadRecords("db/ipc.template","DEVICE=$(DEVICE):PTLSIP02,ADDR=0x87, PORT=$(PORT),SCANRATE=1 second")


#
#drvAsynSerialPortConfigure("PSIOPGUN01_PORT", "/dev/ttyACM16", 0, 0, 0)
#asynSetOption("PSIOPGUN01_PORT", -1, "baud", "9600")
#asynSetOption("PSIOPGUN01_PORT", -1, "bits", "8")
#asynSetOption("PSIOPGUN01_PORT", -1, "parity", "none")
#asynSetOption("PSIOPGUN01_PORT", -1, "stop", "1")
#asynSetOption("PSIOPGUN01_PORT", -1, "clocal", "Y")
#asynSetOption("PSIOPGUN01_PORT", -1, "crtscts", "N")


#asynSetTraceMask("$(DEVICE)",-1,0x9)
#asynSetTraceIOMask("$(DEVICE)",-1,0x2)
#asynSetTraceMask("ipcmini1", -1, 0xFF)
#asynSetTraceIOMask("ipcmini1", -1, 0x2)

cd "${TOP}/iocBoot/${IOC}"
iocInit
epicsThreadSleep(1.5)
dbpf $(DEVICE):RFDSIP01:MODEL_RB.PROC 1
dbpf $(DEVICE):PTLSIP01:MODEL_RB.PROC 1
dbpf $(DEVICE):PTLSIP02:MODEL_RB.PROC 1
dbpf $(DEVICE):RFDSIP01:SERNUM_RB.PROC 1
dbpf $(DEVICE):PTLSIP01:SERNUM_RB.PROC 1
dbpf $(DEVICE):PTLSIP02:SERNUM_RB.PROC 1

