@taskkill /F /IM delphi32.exe

@attrib -r -s -h C:\ProjetosCM5\*.* /s

@del C:\ProjetosCM5\*.~* /s /f
@del "%ProgramFiles%\Borland\Delphi5\Projects\Bpl\cm*.*" /s /f
@del "%ProgramFiles(x86)%\Borland\Delphi5\Projects\Bpl\cm*.*" /s /f

@mkdir C:\ProjetosCM5\BIN
@mkdir C:\ProjetosCM5\BIN\DCU
@mkdir C:\ProjetosCM5\BIN\LOG
@mkdir C:\ProjetosCM5\BIN\TEMP
@mkdir C:\ProjetosCM5\CM\CMADMPREV\DCU
@mkdir C:\ProjetosCM5\CM\CmBussines\Lib
@mkdir C:\ProjetosCM5\CM\CMExperts\DCU
@mkdir C:\ProjetosCM5\CM\CMPrevMT50\DCU
@mkdir C:\ProjetosCM5\CM\CMResource50\Lib
@mkdir C:\ProjetosCM5\CM\CmSql\Lib
@mkdir C:\ProjetosCM5\CM\ComponentesCMOld\Package
@mkdir C:\ProjetosCM5\CM\ComponentesCMOld\source
@mkdir C:\ProjetosCM5\CM\ComponentesXT\CMAdd50\Lib
@mkdir C:\ProjetosCM5\CM\DCU
@mkdir C:\ProjetosCM5\CM\Parser\Lib
@mkdir C:\ProjetosCM5\CM\Relats\Lib
@mkdir C:\ProjetosCM5\CMBACK\Lib
@mkdir C:\ProjetosCM5\CMCAFOBJ50\DCU
@mkdir C:\ProjetosCM5\CMCFINANOBJ50\DCU
@mkdir C:\ProjetosCM5\CMCONTABOBJ50\DCU
@mkdir C:\ProjetosCM5\CMGLOBALOBJ50\Lib
@mkdir C:\ProjetosCM5\CMINTBANCOMT50\Lib
@mkdir C:\ProjetosCM5\CMRELATORIOOBJ50\Lib
@mkdir C:\ProjetosCM5\DCU
@mkdir C:\ProjetosCM5\DCU\AdminImob
@mkdir C:\ProjetosCM5\DCU\Agendamento
@mkdir C:\ProjetosCM5\DCU\Alienacao
@mkdir C:\ProjetosCM5\DCU\Almoxarifado
@mkdir C:\ProjetosCM5\DCU\Assistencial
@mkdir C:\ProjetosCM5\DCU\AutoAtendimento
@mkdir C:\ProjetosCM5\DCU\BeneficioPrev
@mkdir C:\ProjetosCM5\DCU\CadastroPrev
@mkdir C:\ProjetosCM5\DCU\CAF
@mkdir C:\ProjetosCM5\DCU\CBS
@mkdir C:\ProjetosCM5\DCU\CentralAp
@mkdir C:\ProjetosCM5\DCU\CFINAN
@mkdir C:\ProjetosCM5\DCU\Compras
@mkdir C:\ProjetosCM5\DCU\Contab
@mkdir C:\ProjetosCM5\DCU\ContasaPagar
@mkdir C:\ProjetosCM5\DCU\ContasaReceber
@mkdir C:\ProjetosCM5\DCU\contrato
@mkdir C:\ProjetosCM5\DCU\ContribuicaoPrev
@mkdir C:\ProjetosCM5\DCU\Cotas
@mkdir C:\ProjetosCM5\DCU\CotasPatrim
@mkdir C:\ProjetosCM5\DCU\Emprestimo
@mkdir C:\ProjetosCM5\DCU\FCRT
@mkdir C:\ProjetosCM5\DCU\Folha
@mkdir C:\ProjetosCM5\DCU\Funcef
@mkdir C:\ProjetosCM5\DCU\GerenciaAA
@mkdir C:\ProjetosCM5\DCU\GlobalCM
@mkdir C:\ProjetosCM5\DCU\Impostos
@mkdir C:\ProjetosCM5\DCU\Indicadores
@mkdir C:\ProjetosCM5\DCU\IntegraSAF
@mkdir C:\ProjetosCM5\DCU\InterfacePrev
@mkdir C:\ProjetosCM5\DCU\InvestFDO
@mkdir C:\ProjetosCM5\DCU\Investimentos
@mkdir C:\ProjetosCM5\DCU\InvestImob
@mkdir C:\ProjetosCM5\DCU\ModAcesso
@mkdir C:\ProjetosCM5\DCU\ModAsm
@mkdir C:\ProjetosCM5\DCU\ModAuto
@mkdir C:\ProjetosCM5\DCU\ModAva
@mkdir C:\ProjetosCM5\DCU\ModBas
@mkdir C:\ProjetosCM5\DCU\ModBen
@mkdir C:\ProjetosCM5\DCU\ModCes
@mkdir C:\ProjetosCM5\DCU\ModCon
@mkdir C:\ProjetosCM5\DCU\ModFol
@mkdir C:\ProjetosCM5\DCU\ModRes
@mkdir C:\ProjetosCM5\DCU\ModTrn
@mkdir C:\ProjetosCM5\DCU\Orcamento
@mkdir C:\ProjetosCM5\DCU\ParamPrev
@mkdir C:\ProjetosCM5\DCU\ProcJud
@mkdir C:\ProjetosCM5\DCU\ProcPrev
@mkdir C:\ProjetosCM5\DCU\ProjetoAtuarial
@mkdir C:\ProjetosCM5\DCU\RADG
@mkdir C:\ProjetosCM5\DCU\recmerc
@mkdir C:\ProjetosCM5\DCU\REFER
@mkdir C:\ProjetosCM5\DCU\Regra
@mkdir C:\ProjetosCM5\DCU\RelatoriosCm
@mkdir C:\ProjetosCM5\DCU\SCQ
@mkdir C:\ProjetosCM5\DCU\SimuladorBrTPREV
@mkdir C:\ProjetosCM5\DCU\SistJur
@mkdir C:\ProjetosCM5\DCU\SistJurCons
@mkdir C:\ProjetosCM5\DCU\SrhCs
@mkdir C:\ProjetosCM5\GLOBALCM\DCU
@mkdir C:\ProjetosCM5\MODATN\DCU
@mkdir C:\ProjetosCM5\MODFOL\DCU
@mkdir C:\ProjetosCM5\SHARED\ModComp\DCU

@C:
@cd C:\ProjetosCM5\

@del /F 1-BPL.Padrao.err
@del /F 2-BPL.Negocio.err

@regedit /s _BuildAux01.reg
delphi32 -m 1-BPL.Padrao.bpg
@findstr /n "Error" 1-BPL.Padrao.err
@IF %ERRORLEVEL% == 0 GOTO erro1 

delphi32 -m 2-BPL.Negocio.bpg
@findstr /n "Error" 2-BPL.Negocio.err
@IF %ERRORLEVEL% == 0 GOTO erro2

@regedit /s _BuildAux02.reg

@del C:\ProjetosCM5\*.~* /s /f

@echo.
@echo.SUCESSO!!!
@echo.
@GOTO fim


:erro1
@type 1-BPL.Padrao.err
@GOTO fim

:erro2
@type 2-BPL.Negocio.err
@GOTO FIM

:fim
@echo.
@echo.%date% %time%
@echo.
@pause