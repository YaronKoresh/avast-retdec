@echo off
cd "%~dp0"

set "email=aharonkoresh1@gmail.com"
set "name=Yaron Koresh"

echo.
echo Email: %email%
echo.
echo Name: %name%
echo.

call git config --global user.email "%email%"
call git config --global user.name "%name%"
call git lfs update --force
call git lfs install
call git fetch
call git checkout
call git add --all .
call git commit -am "commit"
( call git rebase ) || (
	call :conflicts
)
( call git push ) && (
	echo Finished.
	pause
	exit /b 0
) || (
	echo Error: Failed to push!
	pause
	exit /b 1
)

:conflicts
call git add --all .
call git rebase --continue || call :conflicts
echo Please fix the conflicts, then, press any key to continue
pause