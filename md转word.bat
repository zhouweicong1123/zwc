@echo off
if "%~x1"==".md" (goto single) else (goto all)


:single
pandoc -t latex "%1" | pandoc -f latex --data-dir=template\ -o "%cd%\%~n1.docx"
goto end

:all
for  %%I in (%cd%\*.md) do (
        pandoc -t latex "%%I" | pandoc -f latex --data-dir="D:\git\zwc\" -o "%%~dpnI.docx"
        echo %%I done!
)
goto end

:end
pause