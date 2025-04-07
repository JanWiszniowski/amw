rmdir /s /q ..\build\html
rem rmdir /s /q ..\build\latex

sphinx-build -M html .\source\ ..\build\html\
rem sphinx-build -M latex .\source\ ..\build\latex\
