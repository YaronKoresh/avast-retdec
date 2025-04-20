@echo off
setlocal ENABLEDELAYEDEXPANSION

set "dp=%~dp0"
cd "%dp%"

set /p "rd=RetDec folder path: "
set /p "pth=Binary file path: "
set "c=%pth%.c"

%rd%\bin\retdec-decompiler.exe --no-memory-limit --cleanup --backend-keep-library-funcs -o "%c%" "%pth%"

echo int32_t WinMain() { entry_point(); return 0; } >> "%c%"

pause