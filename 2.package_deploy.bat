cls
call "%PLAYBOOK_HOME%\bin\blackberry-airpackager.bat" -package "bin-release\AtariGo.bar" src\AtariGo-app.xml -C bin-release bin-release\AtariGo.swf -C src src\blackberry-tablet.xml -devMode -debugToken debugtoken_imrahil.bar -installApp -launchApp -password jarek -device 192.168.1.10

rem src\atarigo-icon.png src\atarigo-splash.png 
rem -target bar-debug -connect 192.168.1.12 