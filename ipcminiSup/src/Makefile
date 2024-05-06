TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#==================================================
# build a support library

LIBRARY_IOC += ipcmini

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxxRecord
# install ipcmini.dbd into <top>/dbd
DBD += ipcmini.dbd

# specify all source files to be compiled and added to the library
ipcmini_SRCS += ipcDeviceNumber.c


#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

