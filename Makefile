#################################################################
## This Makefile Exported by MinGW Developer Studio
## Copyright (c) 2002-2004 by Parinya Thipchart
#################################################################

ifneq (,$(findstring Release, $(CFG)))
  override CFG = Release
else
  override CFG = Debug
endif

PROJECT = geodesic
CC = gcc.exe

WINDRES = "$(COMPILER_BIN)windres.exe"
ifeq ($(CFG),Debug)
  OBJ_DIR = bin\Debug
  OUTPUT_DIR = bin\Debug
  TARGET = geodesic.dll
  C_INCLUDE_DIRS = 
  C_PREPROC = 
  CFLAGS = -pipe -std=c99 -Wall -g2 -O0 
  RC_INCLUDE_DIRS = 
  RC_PREPROC = 
  RCFLAGS = 
  LIB_DIRS = 
  LIBS = 
  LDFLAGS = -pipe -shared -Wl,--output-def,"$(OBJ_DIR)\geodesic.def",--out-implib,"$(OBJ_DIR)\libgeodesic.dll.a" -static-libgcc
endif

ifeq ($(CFG),Release)
  OBJ_DIR = bin\Release
  OUTPUT_DIR = bin\Release
  TARGET = geodesic.dll
  C_INCLUDE_DIRS = 
  C_PREPROC = -DHAVE_C99_MATH 
  CFLAGS = -fPIE -pipe -std=c99 -g0 -O2 -Wall -Wextra -Wfloat-conversion -Wno-array-bounds -pedantic
  RC_INCLUDE_DIRS = 
  RC_PREPROC = 
  RCFLAGS = 
  LIB_DIRS = 
  LIBS = 
  LDFLAGS = -pipe -shared -Wl,--output-def,"$(OBJ_DIR)\geodesic.def",--out-implib,"$(OBJ_DIR)\libgeodesic.dll.a" -s -static-libgcc
endif

ifeq ($(OS),Windows_NT)
  NULL =
else
  NULL = nul
endif

SRC_OBJS = \
  $(OBJ_DIR)/geodesic.o

RSRC_OBJS = \
  $(OBJ_DIR)/geodesic.res

define build_target
@echo Linking...
@$(CC) -o "$(OUTPUT_DIR)\$(TARGET)" $(SRC_OBJS) $(RSRC_OBJS) $(LIB_DIRS) $(LIBS) $(LDFLAGS)
endef

define compile_resource
@echo Compiling $<
@$(WINDRES) $(RCFLAGS) $(RC_PREPROC) $(RC_INCLUDE_DIRS) -O COFF -i "$<" -o "$@"
endef

define compile_source
@echo Compiling $<
@$(CC) $(CFLAGS) $(C_PREPROC) $(C_INCLUDE_DIRS) -c "$<" -o "$@"
endef

.PHONY: print_header directories

$(TARGET): print_header directories $(RSRC_OBJS) $(SRC_OBJS)
	$(build_target)

.PHONY: clean cleanall

cleanall:
	@echo Deleting intermediate files for 'geodesic - $(CFG)'
	-@del $(OBJ_DIR)\*.o
	-@del $(OBJ_DIR)\*.res
	-@del "$(OUTPUT_DIR)\$(TARGET)"
	-@del "$(OBJ_DIR)\$(PROJECT).def"
	-@del "$(OBJ_DIR)\lib$(PROJECT).dll.a"
	-@rmdir "$(OUTPUT_DIR)"

clean:
	@echo Deleting intermediate files for 'geodesic - $(CFG)'
	-@del $(OBJ_DIR)\*.o
	-@del $(OBJ_DIR)\*.res

print_header:
	@echo ----------Configuration: geodesic - $(CFG)----------

directories:
	-@if not exist "$(OUTPUT_DIR)\$(NULL)" mkdir "$(OUTPUT_DIR)"
	-@if not exist "$(OBJ_DIR)\$(NULL)" mkdir "$(OBJ_DIR)"

$(OBJ_DIR)/geodesic.res: geodesic.rc

	$(compile_resource)

$(OBJ_DIR)/geodesic.o: geodesic.c	\
geodesic.h
	$(compile_source)

