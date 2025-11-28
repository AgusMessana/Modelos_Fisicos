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
	@echo "  make install  - crea el entorno virtual e instala las librerias necesarias"
	@echo "  make run      - ejecuta el programa usando el entorno virtual"

# Target REAL: la carpeta venv
venv:
	$(PYTHON) -m venv venv
	$(RUNPY) -m pip install --upgrade pip
	$(RUNPY) -m pip install numpy
	$(RUNPY) -m pip install matplotlib==3.8.2

# Alias "install" que solo asegura que exista venv
install: venv
	@echo "Entorno virtual listo."

# Para correr el programa alcanza con garantizar venv
run: venv
	$(RUNPY) $(MAIN)

# Si se quiere instalar todo nuevamente, borrar la carpeta venv y ejecutar el make