#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#

unexport MAKEFILE_LIST
MK_NOGENDEPS := $(filter clean,$(MAKECMDGOALS))
override PKGDIR = configPkg
XDCINCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(XPKGPATH))))
XDCCFGDIR = package/cfg/

#
# The following dependencies ensure package.mak is rebuilt
# in the event that some included BOM script changes.
#
ifneq (clean,$(MAKECMDGOALS))
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/utils.js:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/utils.js
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/xdc.tci:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/xdc.tci
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/template.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/template.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/om2.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/om2.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/package.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/package.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs
package.mak: config.bld
/opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/ITarget.xs:
package.mak: /opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/ITarget.xs
/opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/C28_large.xs:
package.mak: /opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/C28_large.xs
/opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/C28_float.xs:
package.mak: /opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/C28_float.xs
/opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/package.xs:
package.mak: /opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/package.xs
package.mak: package.bld
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.opt.xdt:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.opt.xdt
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/io/File.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/io/File.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/io/package.xs:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/services/io/package.xs
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.defs.xdt:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.defs.xdt
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/custom.mak.exe.xdt:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/custom.mak.exe.xdt
/opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/package.xs.xdt:
package.mak: /opt/ti/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/package.xs.xdt
endif

ti.targets.C28_float.rootDir ?= /opt/ti/ccsv7/tools/compiler/ti-cgt-c2000_16.12.0.STS
ti.targets.packageBase ?= /opt/ti/tirtos_c2000_2_16_01_14/products/bios_6_45_02_31/packages/ti/targets/
.PRECIOUS: $(XDCCFGDIR)/%.o28FP
.PHONY: all,28FP .dlls,28FP .executables,28FP test,28FP
all,28FP: .executables,28FP
.executables,28FP: .libraries,28FP
.executables,28FP: .dlls,28FP
.dlls,28FP: .libraries,28FP
.libraries,28FP: .interfaces
	@$(RM) $@
	@$(TOUCH) "$@"

.help::
	@$(ECHO) xdc test,28FP
	@$(ECHO) xdc .executables,28FP
	@$(ECHO) xdc .libraries,28FP
	@$(ECHO) xdc .dlls,28FP


all: .executables 
.executables: .libraries .dlls
.libraries: .interfaces

PKGCFGS := $(wildcard package.xs) package/build.cfg
.interfaces: package/package.xdc.inc package/package.defs.h package.xdc $(PKGCFGS)

-include package/package.xdc.dep
package/%.xdc.inc package/%_configPkg.c package/%.defs.h: %.xdc $(PKGCFGS)
	@$(MSG) generating interfaces for package configPkg" (because $@ is older than $(firstword $?))" ...
	$(XSRUN) -f xdc/services/intern/cmd/build.xs $(MK_IDLOPTS) -m package/package.xdc.dep -i package/package.xdc.inc package.xdc

.dlls,28FP .dlls: app_03.p28FP

-include package/cfg/app_03_p28FP.mak
-include package/cfg/app_03_p28FP.cfg.mak
ifeq (,$(MK_NOGENDEPS))
-include package/cfg/app_03_p28FP.dep
endif
app_03.p28FP: package/cfg/app_03_p28FP.xdl
	@


ifeq (,$(wildcard .libraries,28FP))
app_03.p28FP package/cfg/app_03_p28FP.c: .libraries,28FP
endif

package/cfg/app_03_p28FP.c package/cfg/app_03_p28FP.h package/cfg/app_03_p28FP.xdl: override _PROG_NAME := app_03.x28FP
package/cfg/app_03_p28FP.c: package/cfg/app_03_p28FP.cfg
package/cfg/app_03_p28FP.xdc.inc: package/cfg/app_03_p28FP.xdl
package/cfg/app_03_p28FP.xdl package/cfg/app_03_p28FP.c: .interfaces

clean:: clean,28FP
	-$(RM) package/cfg/app_03_p28FP.cfg
	-$(RM) package/cfg/app_03_p28FP.dep
	-$(RM) package/cfg/app_03_p28FP.c
	-$(RM) package/cfg/app_03_p28FP.xdc.inc

clean,28FP::
	-$(RM) app_03.p28FP
.executables,28FP .executables: app_03.x28FP

app_03.x28FP: |app_03.p28FP

-include package/cfg/app_03.x28FP.mak
app_03.x28FP: package/cfg/app_03_p28FP.o28FP 
	$(RM) $@
	@$(MSG) lnk28FP $@ ...
	$(RM) $(XDCCFGDIR)/$@.map
	$(ti.targets.C28_float.rootDir)/bin/cl2000 -q -u _c_int00 -z  -o $@ package/cfg/app_03_p28FP.o28FP   package/cfg/app_03_p28FP.xdl  -w -c -m $(XDCCFGDIR)/$@.map -l $(ti.targets.C28_float.rootDir)/lib/libc.a
	
app_03.x28FP: export C_DIR=
app_03.x28FP: PATH:=$(ti.targets.C28_float.rootDir)/bin/:$(PATH)

app_03.test test,28FP test: app_03.x28FP.test

app_03.x28FP.test:: app_03.x28FP
ifeq (,$(_TESTLEVEL))
	@$(MAKE) -R -r --no-print-directory -f $(XDCROOT)/packages/xdc/bld/xdc.mak _TESTLEVEL=1 app_03.x28FP.test
else
	@$(MSG) running $<  ...
	$(call EXEC.app_03.x28FP, ) 
endif

clean,28FP::
	-$(RM) $(wildcard .tmp,app_03.x28FP,*)


clean:: clean,28FP

clean,28FP::
	-$(RM) app_03.x28FP
%,copy:
	@$(if $<,,$(MSG) don\'t know how to build $*; exit 1)
	@$(MSG) cp $< $@
	$(RM) $@
	$(CP) $< $@
app_03_p28FP.o28FP,copy : package/cfg/app_03_p28FP.o28FP
app_03_p28FP.s28FP,copy : package/cfg/app_03_p28FP.s28FP

$(XDCCFGDIR)%.c $(XDCCFGDIR)%.h $(XDCCFGDIR)%.xdl: $(XDCCFGDIR)%.cfg $(XDCROOT)/packages/xdc/cfg/Main.xs | .interfaces
	@$(MSG) "configuring $(_PROG_NAME) from $< ..."
	$(CONFIG) $(_PROG_XSOPTS) xdc.cfg $(_PROG_NAME) $(XDCCFGDIR)$*.cfg $(XDCCFGDIR)$*

.PHONY: release,configPkg
ifeq (,$(MK_NOGENDEPS))
-include package/rel/configPkg.tar.dep
endif
package/rel/configPkg/configPkg/package/package.rel.xml: package/package.bld.xml
package/rel/configPkg/configPkg/package/package.rel.xml: package/build.cfg
package/rel/configPkg/configPkg/package/package.rel.xml: package/package.xdc.inc
package/rel/configPkg/configPkg/package/package.rel.xml: .force
	@$(MSG) generating external release references $@ ...
	$(XS) $(JSENV) -f $(XDCROOT)/packages/xdc/bld/rel.js $(MK_RELOPTS) . $@

configPkg.tar: package/rel/configPkg.xdc.inc package/rel/configPkg/configPkg/package/package.rel.xml
	@$(MSG) making release file $@ "(because of $(firstword $?))" ...
	-$(RM) $@
	$(call MKRELTAR,package/rel/configPkg.xdc.inc,package/rel/configPkg.tar.dep)


release release,configPkg: all configPkg.tar
clean:: .clean
	-$(RM) configPkg.tar
	-$(RM) package/rel/configPkg.xdc.inc
	-$(RM) package/rel/configPkg.tar.dep

clean:: .clean
	-$(RM) .libraries $(wildcard .libraries,*)
clean:: 
	-$(RM) .dlls $(wildcard .dlls,*)
#
# The following clean rule removes user specified
# generated files or directories.
#

ifneq (clean,$(MAKECMDGOALS))
ifeq (,$(wildcard package))
    $(shell $(MKDIR) package)
endif
ifeq (,$(wildcard package/cfg))
    $(shell $(MKDIR) package/cfg)
endif
ifeq (,$(wildcard package/lib))
    $(shell $(MKDIR) package/lib)
endif
ifeq (,$(wildcard package/rel))
    $(shell $(MKDIR) package/rel)
endif
ifeq (,$(wildcard package/internal))
    $(shell $(MKDIR) package/internal)
endif
endif
clean::
	-$(RMDIR) package

include custom.mak