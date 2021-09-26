# Created by Fernando Oleo Blanco <irvise.xyz>

# Files
PROJ_FILE= scheme.gpr
SCHEME_FILES= chicken_ada.scm
ADA_FILES= scheme_test
LIB_NAME= scheme_hello
EXECUTABLE= scheme_ada

# Builder settings
LIBDIR= lib
OBJDIR= obj

# Compiler settings
# ADAC will be filled with the compiler toolchain detected in tooling:
ADAC=
ADAFLAGS+= -fPIC -ggdb -O1 -gnata
LINKFLAGS+= -shared
# Chicken flags. We are using Chicken Scheme here
CHICKENFLAGS= -L./lib -L -l${LIB_NAME} -Wl,-R./lib -v

# Build command, detect available toolchain
# As taken from https://stackoverflow.com/a/34756868
BUILDER:= $(shell command -v gprbuild 2> /dev/null)

.PHONY: all
all: scheme

# Buifld Scheme program
.PHONY: scheme
scheme: library
	csc ${SCHEME_FILES} ${CHICKENFLAGS} -o ${EXECUTABLE}

# Build library
.PHONY: library
library: tooling
ifdef BUILDER
	${ADAC} -P${PROJ_FILE}
else
	${ADAC} -c -b $(addprefix src/, ${ADA_FILES}) ${ADAFLAGS} \
		-D ${OBJDIR} -bargs -n -a
	gcc ${LINKFLAGS} $(addprefix ${OBJDIR}/, $(addsufix .o, ${ADA_FILES})) \
		-o $(addprefix $(LIBDIR)/lib, $(addsuffix .so, ${LIBNAME}))
endif

# Check what toolchain we have available.
# Use gprbuild if available, gnattools otherwise.
.PHONY: tooling
tooling:
ifndef BUILDER
	@echo GPRBUILD is not available in the system. Defaulting to GNATTOOLS.
	$(eval ADAC=gnatmake)
else
	$(eval ADAC=gprbuild)
endif

# Clean project files
.PHONY: clean
clean: tooling
ifdef BUILDER
	gprclean
else
	gnatclean $(addprefix src/, ${ADA_FILES}) -D ${OBJDIR}
endif
	@rm -f ${EXECUTABLE}
	@rm -f *.o
