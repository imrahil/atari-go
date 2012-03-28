cls
call "%PLAYBOOK_HOME%\bin\amxmlc.bat" -define=CONFIG::debugMode,false -define=CONFIG::device,true -library-path+=libs -output bin-release\AtariGo.swf src\AtariGo.as

