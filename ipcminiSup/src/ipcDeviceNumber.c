#include <stdio.h>
#include <aSubRecord.h>
#include <registryFunction.h>
#include <epicsExport.h>

static void publishNumberDescription(aSubRecord *precord, const long deviceNumber, const char * deviceDescription) {
    sprintf((char *) precord->vala, "%ld: %s", deviceNumber, deviceDescription);
}

static int processDeviceNumber(aSubRecord *precord)
{
    const long deviceNumber = *((long *) precord->a);
    switch (deviceNumber) {
        case 0:
            publishNumberDescription(precord, deviceNumber, "Spare");
        case 1:
            publishNumberDescription(precord, deviceNumber, "500 StarCell"); break;
        case 2:
            publishNumberDescription(precord, deviceNumber, "300 StarCell");
            break;
        case 16:
            publishNumberDescription(precord, deviceNumber, "200 StarCell");
            break;
        case 3:
            publishNumberDescription(precord, deviceNumber, "150 StarCell");
            break;
        case 4:
            publishNumberDescription(precord, deviceNumber, "75-55-40 StarCell");
            break;
        case 5:
            publishNumberDescription(precord, deviceNumber, "20 StarCell");
            break;
        case 20:
            publishNumberDescription(precord, deviceNumber, "20 NEXTorr-SC");
            break;
        case 6:
            publishNumberDescription(precord, deviceNumber, "500 diode");
            break;
        case 7:
            publishNumberDescription(precord, deviceNumber, "300 diode");
            break;
        case 15:
            publishNumberDescription(precord, deviceNumber, "200 diode");
            break;
        case 8:
            publishNumberDescription(precord, deviceNumber, "150 diode");
            break;
        case 9:
            publishNumberDescription(precord, deviceNumber, "75-55-40 diode");
            break;
        case 10:
            publishNumberDescription(precord, deviceNumber, "20 diode");
            break;
        case 11:
            publishNumberDescription(precord, deviceNumber, "10 diode");
            break;
        case 12:
            publishNumberDescription(precord, deviceNumber, "75 Sem");
            break;
        case 13:
            publishNumberDescription(precord, deviceNumber, "25 Sem");
            break;
        case 14:
            publishNumberDescription(precord, deviceNumber, "10 Sem");
            break;
        case 17:
            publishNumberDescription(precord, deviceNumber, "2 Diode");
            break;
        case 18:
            publishNumberDescription(precord, deviceNumber, "0.2 Diode 1250 Gauss");
            break;
        case 19:
            publishNumberDescription(precord, deviceNumber, "0.2 Diode 800 Gauss");
            break;
        default:
        publishNumberDescription(precord, deviceNumber, "Unsupported device");
    }
    return 0;
}

epicsRegisterFunction(processDeviceNumber);


