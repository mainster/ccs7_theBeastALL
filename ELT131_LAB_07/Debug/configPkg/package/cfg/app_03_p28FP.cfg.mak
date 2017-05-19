# invoke SourceDir generated makefile for app_03.p28FP
app_03.p28FP: .libraries,app_03.p28FP
.libraries,app_03.p28FP: package/cfg/app_03_p28FP.xdl
	$(MAKE) -f /media/data/CODES/ccs7_theBeast/ELT131_LAB_07/src/makefile.libs

clean::
	$(MAKE) -f /media/data/CODES/ccs7_theBeast/ELT131_LAB_07/src/makefile.libs clean

