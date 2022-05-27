@ECHO off
REM - Executar como Administrador
REM     if "%~s0"=="%~s1" ( cd %~sp1 & shift ) else (
REM        echo CreateObject^("Shell.Application"^).ShellExecute "%~s0","%~0 %*","","runas",1 >"%tmp%%~n0.vbs" & "%tmp%%~n0.vbs" & del /q "%tmp%%~n0.vbs" & goto :eof
REM )
REM VARIAVEIS
	set instalador=cscript Fusion-Inventory.vbs
	set 
	
	
REM CLIENTES
	:start 
		CLS 
		echo.
		date /t
		echo Computador: %computername% Usuario: %username% 
		echo.
		echo ###############################################
		echo ######        Selecione Cliente          ######
		echo ###############################################
		echo. 
		echo.
		echo ===============================================
		echo 	[1]. NEFRO CLINICA 
		echo 	[2]. BINACIONAL
		echo 	[3]. WASHINGTON TEIXEIRA
		echo 	[4]. AUTO PECAS FOZ
		echo 	[5]. CIOP
		echo 	[6]. CLINICA HEALTH
		echo 	[7]. ALTOMAX
		echo 	[8]. INSTITO ETO
		echo 	[9]. EB TURISMO
		echo 	[10]. HOTEL SUICA
		echo 	[11]. CELEIRO NATURAL
		echo 	[12]. ULTRA IMAGEM
		echo 	[13]. THUEDI
		echo 	[14]. DELLANNO FOZ
		echo 	[15]. POLICLINICA
		echo 	[16]. SIGILUS CONTABILIDADE
		echo 	[17]. OUTROS
		echo.
		echo 0. Sair
		echo ==============================================
		echo.
		set /p choice="Escolha sua opcao: " 
			if "%choice%"=="1" goto submenu_1 
			if "%choice%"=="2" goto submenu_2
			if "%choice%"=="3" goto submenu_3 
			if "%choice%"=="4" goto submenu_4 
			if "%choice%"=="5" goto submenu_5 
			if "%choice%"=="6" goto submenu_6 
			if "%choice%"=="7" goto submenu_7 
			if "%choice%"=="8" goto submenu_8 
			if "%choice%"=="9" goto submenu_9 
			if "%choice%"=="10" goto submenu_10
			if "%choice%"=="11" goto submenu_11
			if "%choice%"=="12" goto submenu_12
			if "%choice%"=="13  goto submenu_13
			if "%choice%"=="14" goto submenu_14
			if "%choice%"=="15" goto submenu_15
			if "%choice%"=="16" goto submenu_16
			if "%choice%"=="17" goto submenu_17
    			
			if "%choice%"=="0" goto exit
			
			:submenu_1
			set empresa=NEFRO CLINICA
			echo %empresa%
			goto submenu_0
			:submenu_2
			set empresa=BINACIONAL
			echo %empresa%
			goto submenu_0
			:submenu_3
			set empresa=WASHINGTON
			echo %empresa%
			goto submenu_0
			:submenu_4
			set empresa=AUTO PECAS FOZ
			echo %empresa%
			goto submenu_0
			:submenu_5
			set empresa=CIOP
			echo %empresa%
			goto submenu_0
			:submenu_6
			set empresa=CLINICA HEALTH
			echo %empresa%
			goto submenu_0
			:submenu_7
			set empresa=ALTOMAX
			echo %empresa%
			goto submenu_0
			:submenu_8
			set empresa=INSTITO ETO
			echo %empresa%
			goto submenu_0
			:submenu_9
			set empresa=EB TURISMO
			echo %empresa%
			goto submenu_0
			:submenu_10
			set empresa=HOTEL SUICA
			echo %empresa%
			goto submenu_0
			:submenu_11
			set empresa=CELEIRO NATURAL
			echo %empresa%
			goto submenu_0
			:submenu_12
			set empresa=ULTRA IMAGEM
			echo %empresa%
			goto submenu_0
			:submenu_13
			set empresa=THUEDI
			echo %empresa%
			goto submenu_0
			:submenu_14
			set empresa=DELLANNO FOZ
			echo %empresa%
			goto submenu_0
			:submenu_15
			set empresa=POLICLINICA
			echo %empresa%
			goto submenu_0
			:submenu_16
			set empresa=SIGILUS CONTABILIDADE
			echo %empresa%
			goto submenu_0
			:submenu_17
			set /p empresa="Cliente:"
			echo %empresa%
			goto submenu_0			
			
		set /p empresa="Empresa/Cliente: " 
		echo %empresa%
			
:submenu_0
			REM Instalar Fusion
				cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #            Instalando Fusion Inventory            #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.   
					cscript Fusion-Inventory.vbs
			REM Instalar Fusion
				cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #            Fusion Inventory Instalado             #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
			REM Copiar arquivo do anydesk
				cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #            Copiando Arquivo do AnyDesk para       #
				echo #                   FusionInventory                 #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					robocopy anydesk\ *AnyDesk.pm* C:\Tools\
					xcopy C:\Tools\AnyDesk.pm "C:\Program Files\FusionInventory-Agent\perl\agent\FusionInventory\Agent\Task\Inventory\Generic\Remote_Mgmt" /f /l /-y
					explorer C:\Program Files\FusionInventory-Agent\perl\agent\FusionInventory\Agent\Task\Inventory\Generic\Remote_Mgmt
				cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #            Arquivo AnyDesk Copiado                #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					cls
				echo.
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo #              Abrir Fusion Status                  #
				echo # - - - - - - - - - - - - - - - - - - - - - - - - - #
				echo.
					start "Chrome" chrome --new-window http://localhost:62354
			pause