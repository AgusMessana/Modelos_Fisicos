ifeq ($(OS),Windows_NT)
    PYTHON = python
    RUNPY = venv\Scripts\$(PYTHON)

else
    PYTHON = python3
    RUNPY = venv/bin/$(PYTHON)

endif


MAIN = TiroParabolico.py

.PHONY: help run install

help:
	@echo "Comandos:"
	@echo "make install - instala las librerias necesarias"
	@echo "make run - ejecuta el programa"

install:
	$(PYTHON) -m venv venv
	$(RUNPY) -m pip install --upgrade pip
	$(RUNPY) -m pip install matplotlib numpy

run: install
	$(RUNPY) $(MAIN)
