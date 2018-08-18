#
# @section License
#
# The MIT License (MIT)
#
# Copyright (c) 2014-2018, Erik Moqvist
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use, copy,
# modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# This file is part of the Simba project.
#

INC += $(SIMBA_ROOT)/src/boards/arduino_due
SRC += $(SIMBA_ROOT)/src/boards/arduino_due/board.c

BOARD_HOMEPAGE = "https://www.arduino.cc/en/Main/ArduinoBoardDue"
BOARD_PINOUT = "arduino-due-pinout.png"
BOARD_DESC = "Arduino Due"

MCU = sam3x8e

SERIAL_PORT ?= /dev/arduino
BOARD_PY = $(SIMBA_ROOT)/src/boards/arduino_due/board.py
TIMEOUT ?= 10
BAUDRATE ?= 115200

# Set to "yes" to unlock flash regions. Solves "Flash page is locked".
UNLOCK ?= no

ifeq ($(UNLOCK), yes)
UNLOCK_ARG = --unlock
endif

upload:
	@echo "Uploading '$(EXE)'."
	python -u $(BOARD_PY) upload --port $(SERIAL_PORT) $(UNLOCK_ARG) $(BIN)

rerun:
	@echo "Running '$(EXE)'."
	python -u $(RUN_PY) --port $(SERIAL_PORT) \
			    --timeout $(TIMEOUT) \
			    --baudrate $(BAUDRATE) \
	 		    --pattern $(RUN_END_PATTERN)\
			    --pattern-success $(RUN_END_PATTERN_SUCCESS) \
			    | python3 -u $(BACKTRACE_PY) $(EXE) $(CROSS_COMPILE) \
			    | tee $(RUNLOG) ; test $${PIPESTATUS[0]} -eq 0
