@echo off

set DIR=..\venv

set PATH=%DIR%\git\bin;%DIR%\python;%DIR%\Scripts;%PATH%
set PY_LIBS=%DIR%\Scripts\Lib;%DIR%\Scripts\Lib\site-packages
set PY_PIP=%DIR%\Scripts
set SKIP_VENV=1