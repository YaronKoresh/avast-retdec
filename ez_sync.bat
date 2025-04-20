@echo off
cd "%~dp0"

echo.
echo Easily sync your GitHub local and remote code
echo.
echo You should locate it inside your repository root folder
echo.
echo Author: Yaron Koresh
echo.

set /p "email=Your Github email address: "
set /p "name=Your Github username: "

call git config --global user.email "%email%"
call git config --global user.name "%name%"
call git lfs update --force
call git lfs install
call git fetch
call git checkout
call git lfs track "*"
call git add .gitattributes
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