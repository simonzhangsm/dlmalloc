#!/usr/bin/make -f
# Generated automatically from Makefile.in by configure.
# Un*x Makefile for GNU tar program.
# Copyright (C) 1991 Free Software Foundation, Inc.
# This program is free software; you can redistribute
# it and/or modify it under the terms of the GNU
# General Public License 


#### Start of system configuration section. ####
SHELL = /bin/sh

# If you use gcc, you should either run the
# fixincludes script that comes with it or else use
# gcc with the -traditional option.  Otherwise ioctl
# calls will be compiled incorrectly on some systems.
CC = gcc -O
CXX= g++
YACC = bison -y
INSTALL = /usr/local/bin/install -c
INSTALLDATA = /usr/local/bin/install -c -m 644

# Things you might add to DEFS:
# -DSTDC_HEADERS        If you have ANSI C headers and
#                       libraries.
# -DPOSIX               If you have POSIX.1 headers and
#                       libraries.
# -DBSD42               If you have sys/dir.h (unless
#                       you use -DPOSIX), sys/file.h,
#                       and st_blocks in `struct stat'.
# -DUSG                 If you have System V/ANSI C
#                       string and memory functions
#                       and headers, sys/sysmacros.h,
#                       fcntl.h, getcwd, no valloc,
#                       and ndir.h (unless
#                       you use -DDIRENT).
# -DNO_MEMORY_H         If USG or STDC_HEADERS but do not
#                       include memory.h.
# -DDIRENT              If USG and you have dirent.h
#                       instead of ndir.h.
# -DSIGTYPE=int         If your signal handlers
#                       return int, not void.
# -DNO_MTIO             If you lack sys/mtio.h
#                       (magtape ioctls).
# -DNO_REMOTE           If you do not have a remote shell
#                       or rexec.
# -DUSE_REXEC           To use rexec for remote tape
#                       operations instead of
#                       forking rsh or remsh.
# -DVPRINTF_MISSING     If you lack vprintf function
#                       (but have _doprnt).
# -DDOPRNT_MISSING      If you lack _doprnt function.
#                       Also need to define
#                       -DVPRINTF_MISSING.
# -DFTIME_MISSING       If you lack ftime system call.
# -DSTRSTR_MISSING      If you lack strstr function.
# -DVALLOC_MISSING      If you lack valloc function.
# -DMKDIR_MISSING       If you lack mkdir and
#                       rmdir system calls.
# -DRENAME_MISSING      If you lack rename system call.
# -DFTRUNCATE_MISSING   If you lack ftruncate
#                       system call.
# -DV7                  On Version 7 Unix (not
#                       tested in a long time).
# -DEMUL_OPEN3          If you lack a 3-argument version
#                       of open, and want to emulate it
#                       with system calls you do have.
# -DNO_OPEN3            If you lack the 3-argument open
#                       and want to disable the tar -k
#                       option instead of emulating open.
# -DXENIX               If you have sys/inode.h
#                       and need it 94 to be included.

DEFS =  -DSIGTYPE=int -DDIRENT -DSTRSTR_MISSING \
        -DVPRINTF_MISSING -DBSD42

# define any libraries to link into executable:
#   if I want to link in libraries (libx.so or libx.a) I use the -llibname 
#   option, something like (this will link in libmylib.so and libm.so:

LIBS =	-lm

# define any directories containing header files other than /usr/include
INCLUDES = -I$(SRCDIR)

# define library paths in addition to /usr/lib
#   if I wanted to include libraries not in /usr/lib I'd specify
#   their path using -Lpath, something like:
LFLAGS = -L/home/newhall/lib  -L../lib

CDEBUG 				= -g
FLAGS  				= -std=gnu99 -Iinclude
CFLAGS 				= $(DEFS) $(FLAGS) $(CDEBUG) $(INCLUDES) \
							 	-fPIC -pedantic -Wall -Wextra -march=native -ggdb3
LDFLAGS				= -shared
RELEASEFLAGS 	= -O2 -D NDEBUG -combine -fwhole-program

CC    = gcc
CXX   = g++

PREFIX = $(DESTDIR)/usr/local
BINDIR = $(PREFIX)/bin
INFODIR= $(PREFIX)/info

#### End of system configuration section. ####

SRCDIR 	= .
DESTDIR = .

TARGET  		= dlmalloc.so

SOURCES_C 	= $(shell echo *.c)
SOURCES_CC 	= $(shell echo *.cc)
SOURCES_CPP = $(shell echo *.cpp)

OBJECTS = $(SOURCES_C:.c=.o) $(SOURCES_CC:.cc=.o) $(SOURCES_CPP:.cpp=.o)
HEADERS = $(SHELL echo *.h)

AUX =   README COPYING ChangeLog 

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $(LIBS) -o $@ $<
        
$(OBJECTS): $(HEADERS)

.c.o:
	$(CC)  -c	$(CFLAGS) $(LIBS) -o $@ $<

.cc.o:
	$(CXX) -c $(CFLAGS) $(LIBS) -o $@ $<

.cpp.o:
	$(CXX) -c $(CFLAGS) $(LIBS) -o $@ $<

clean:
	rm -rf $(TARGET) $(OBJECTS) 

