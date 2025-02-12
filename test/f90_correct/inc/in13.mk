#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#


########## Make rule for test in13  ########


in13: run
	

fcheck.$(OBJX): $(SRC)/check_mod.F90
	-$(FC) -c $(FFLAGS) $(SRC)/check_mod.F90 -o fcheck.$(OBJX)

build:  $(SRC)/in13.f90 $(SRC)/in13_expct.c fcheck.$(OBJX)
	-$(RM) in13.$(EXESUFFIX) in13.$(OBJX) in13_expct.$(OBJX)
	@echo ------------------------------------ building test $@
	-$(CC) -c $(CFLAGS) $(SRC)/in13_expct.c -o in13_expct.$(OBJX)
	-$(FC) -c $(FFLAGS) $(LDFLAGS) $(SRC)/in13.f90 -o in13.$(OBJX)
	-$(FC) $(FFLAGS) $(LDFLAGS) in13.$(OBJX) in13_expct.$(OBJX) fcheck.$(OBJX) $(LIBS) -o in13.$(EXESUFFIX)


run:
	@echo ------------------------------------ executing test in13
	in13.$(EXESUFFIX)

verify: ;

in13.run: run

