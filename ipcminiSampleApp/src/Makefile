TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = ipcminiSample
# ipcminiSample.dbd will be created and installed
DBD += ipcminiSample.dbd

# ipcminiSample.dbd will be made up from these files:
ipcminiSample_DBD += base.dbd
ipcminiSample_DBD += calc.dbd
ipcminiSample_DBD += asyn.dbd
ipcminiSample_DBD += stream.dbd
ipcminiSample_DBD += drvAsynIPPort.dbd
ipcminiSample_DBD += drvAsynSerialPort.dbd
ipcminiSample_DBD += ipcmini.dbd

# Include dbd files from all support applications:
#ipcminiSample_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#ipcminiSample_LIBS += xxx
ipcminiSample_LIBS += asyn
ipcminiSample_LIBS += calc
ipcminiSample_LIBS += stream
ipcminiSample_LIBS += ipcmini

# ipcminiSample_registerRecordDeviceDriver.cpp derives from ipcminiSample.dbd
ipcminiSample_SRCS += ipcminiSample_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
ipcminiSample_SRCS_DEFAULT += ipcminiSampleMain.cpp
ipcminiSample_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ipcminiSample_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
ipcminiSample_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

