//Alterações:
{ --------------------------------------------------------------------------------------------------
Rotinas   : Várias
Data      : 07/07/2006
Autor     : Rodolpho da Silva
Pendencia : 22478
Descrição : Corrigido o erro em que em cada conta apresentava-se o total geral do grupo
{ --------------------------------------------------------------------------------------------------
Rotinas   : Várias
Data      : 30/06/2004 (término)
Autor     : David Ayrolla
Pendencia : 16822
Descrição : Permitir que o relatório só leve em consideração para efeito de cálculo de percentual
            realizado os dados referentes a até certo período, permitindo análise horizontal.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotinas   : Várias
Data      : 25/06/2004 (término)
Autor     : David Ayrolla
Pendencia : 16808
Descrição : Permitir impressão de contas sintéticas.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 13/05/2004
Autor     : Marchetti
Pendencia : 16012
Descrição : Respeitar o sinal da conta conforme solicitação no parâmetro da tela de filtro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 06/05/2004
Autor     : Marchetti
Pendencia : 15892
Descrição : Respeitar os filtros do Parametro II
---------------------------------------------------------------------------------------------------}

unit rOrcxRealGrupoConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlOrcamento, uFuncoesOrcamento, JCLSysUtils, ppModule, raCodMod, TXRB;

type
  TrptOrcxRealGrupoConta = class(TFrmCmReport)
    sqlCompSaldo: TCMSqlParams;
    cdsCompSaldo: TCMClientDataSet;
    dsRelatGrupo: TwwDataSource;
    pplRelatOrcxConta: TppBDEPipeline;
    rpRelatOrcxGrupoConta: TppReport;
    sqlCompSaldoC: TCMSqlParams;
    cdsCompSaldoC: TCMClientDataSet;
    sqlPeriodos: TCMSqlParams;
    cdsPeriodos: TCMClientDataSet;
    sqlRelatGrupo: TCMSqlParams;
    cdsRelatOrcxConta: TCMClientDataSet;
    sqlGrupoOrc: TCMSqlParams;
    cdsGrupoOrc: TCMClientDataSet;
    sqlCResp: TCMSqlParams;
    cdsCResp: TCMClientDataSet;
    sqlMoeda: TCMSqlParams;
    cdsMoeda: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    cdsCCusto: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    sqlCenario: TCMSqlParams;
    cdsCenario: TCMClientDataSet;
    sqlPPrev: TCMSqlParams;
    cdsPPrev: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    sqlGrupoIni: TCMSqlParams;
    cdsGrupoIni: TCMClientDataSet;
    ppHeaderBand24: TppHeaderBand;
    ppShape7: TppShape;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppLabel83: TppLabel;
    ppLine61: TppLine;
    ppHeaderEmpresa: TppLabel;
    rpRelatGrupoLabel1: TppLabel;
    rpRelatGrupoLabel2: TppLabel;
    rpTitMes01: TppLabel;
    rpTitMes01_O: TppLabel;
    rpTitMes01_R: TppLabel;
    rpTitMes02: TppLabel;
    rpTitMes02_O: TppLabel;
    rpTitMes02_R: TppLabel;
    rpTitMes03: TppLabel;
    rpTitMes03_O: TppLabel;
    rpTitMes03_R: TppLabel;
    rpTitMes04: TppLabel;
    rpTitMes04_O: TppLabel;
    rpTitMes04_R: TppLabel;
    rpTitMes05: TppLabel;
    rpTitMes05_O: TppLabel;
    rpTitMes05_R: TppLabel;
    rpTitMes06: TppLabel;
    rpTitMes06_O: TppLabel;
    rpTitMes06_R: TppLabel;
    rpRelatGrupoLabel29: TppLabel;
    rpRelatGrupoLabel22: TppLabel;
    rpRelatGrupoLabel21: TppLabel;
    rpRelatGrupoLabel23: TppLabel;
    rpRelatGrupoLabel24: TppLabel;
    ppLabel294: TppLabel;
    rpRelatGrupoLabel25: TppLabel;
    rpRelatGrupoLabel26: TppLabel;
    ppDetailBand24: TppDetailBand;
    dbORC01: TppDBText;
    dbREA01: TppDBText;
    dbORC02: TppDBText;
    dbREA02: TppDBText;
    dbORC03: TppDBText;
    dbREA03: TppDBText;
    dbORC04: TppDBText;
    dbREA04: TppDBText;
    dbORC05: TppDBText;
    dbREA05: TppDBText;
    dbORC06: TppDBText;
    dbREA06: TppDBText;
    rpRelatGrupoDBText15: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand24: TppFooterBand;
    ppCalc46: TppSystemVariable;
    ppLabel206: TppLabel;
    ppLine62: TppLine;
    ppCalc47: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure sqlCompSaldoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlCompSaldoCFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    bImpPer01,
    bImpPer02,
    bImpPer03,
    bImpPer04,
    bImpPer05,
    bImpPer06 : boolean;
  public
    { Public declarations }
  end;

var
  rptOrcxRealGrupoConta: TrptOrcxRealGrupoConta;

implementation

uses uSistema, uData, uFuncaoGeral, uModulo, uMensErro, uString,
  mPlanoOrcamentarioMT;

{$R *.DFM}

procedure TrptOrcxRealGrupoConta.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria SQL Parametro Exercício
  with CmpRptCM.ParamValues[0].LookupSettings.SQL do begin
    Clear;
    Add('SELECT DISTINCT EXERCICIO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE IDPESSOA = ' + IntToStr(sistema.idEmpresa));
    Add('ORDER BY EXERCICIO');
  end;
  // Cria SQL Parametro Período Inicial
  with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;
  // Cria SQL Parametro Centro de Responsabilidade
  with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTRORESPON, NOME');
    Add('FROM CENTRESPON');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('ORDER BY NOME');
  end;
  // Cria SQL Parametro Centro de Custo
  with CmpRptCM.ParamValues[23].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTROCUSTO, NOME');
    Add('FROM CENTCUST');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('AND (ATIVO = ''S'') ');
    Add('ORDER BY NOME');
  end;
  // Cria SQL Parametro Atividade/Projeto
  with CmpRptCM.ParamValues[24].LookupSettings.SQL do begin
    Clear;
    Add('SELECT UNIDNEGOC, NOME');
    Add('FROM UNIDNEGOCIO');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('ORDER BY NOME');
  end;

  with CmpRptCM.ParamValues[30].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;
end;

procedure TrptOrcxRealGrupoConta.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  case Index of
    0 : begin
        // Cria SQL Parametro Período Inicial
        with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
          Clear;
          Add('SELECT PERIODO, NOMEPERIODO');
          Add('FROM PERIODOORCAMEN');
          Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
          Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
          Add('ORDER BY PERIODO');
        end;
        end;
    1 : begin
        // Cria SQL Parametro Período Final
        with CmpRptCM.ParamValues[30].LookupSettings.SQL do begin
          Clear;
          Add('SELECT PERIODO, NOMEPERIODO');
          Add('FROM PERIODOORCAMEN');
          Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
          Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) +  ') ');
          Add('(PERIODO >= ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger) +  ') ');
          Add('ORDER BY PERIODO');
        end;
        end;
  end;
end;

procedure TrptOrcxRealGrupoConta.sqlCompSaldoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'GRUPO') or (sParamName = 'USUARIO') or
     (sParamName = 'CRESP') or (sParamName = 'CCUSTO') or
     (sParamName = 'ATIVPROJ') or (sParamName = 'PPREV') or
     (sParamName = 'PATRO') or (sParamName = 'PARAMETRO1') or
     (sParamName = 'PARAMETRO2') or (sParamName = 'PARAMETRO3') or
     (sParamName = 'PARAMETRO4') then
    sNewValue := sOldValue;
end;

procedure TrptOrcxRealGrupoConta.sqlCompSaldoCFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'GRUPO') or (sParamName = 'USUARIO') or
     (sParamName = 'CRESP') or (sParamName = 'CCUSTO') or
     (sParamName = 'ATIVPROJ') or (sParamName = 'PPREV') or
     (sParamName = 'PATRO') or (sParamName = 'PARAMETRO1') or
     (sParamName = 'PARAMETRO2') or (sParamName = 'PARAMETRO3') or
     (sParamName = 'PARAMETRO4') then
    sNewValue := sOldValue;
end;

procedure TrptOrcxRealGrupoConta.CrmRptCMBeforePrint(Sender: TObject);
var
  x, iNumDigGrau,
  TotalDeLinhas     : Integer;
  rValCot, rValCot1, rValCot2, rValCot3, rValCot4, rValCot5, rValCot6: Double;
  sGrupos           : String;
  bSair             : Boolean;
  sSQL              : String;
begin
   if OrcamentoBackMT.DiasNoPeriodo(CmpRptCM.ParamValues[0].AsInteger,
       CmpRptCM.ParamValues[1].AsInteger) = 0 then begin
      MsgDlg('O Período Inicial não existe para o Exercício selecionado.',
             'Erro',mtError,[mbOk],0);
      CmpRptCM.Execute;
   end else begin
      MostraStatusRelatGrupo( 'Abrindo - Centro de Responsabilidade' );
      sqlCResp.Prepare;
      sqlCResp.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
      sqlCResp.ParamByName('CODCENTRORESPON').asString :=
                                         Trim(CmpRptCM.ParamValues[2].AsString);
      sqlCResp.Open;

      MostraStatusRelatGrupo( 'Abrindo - Centro de Custo' );
      sqlCCusto.Prepare;
      sqlCCusto.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
      sqlCCusto.ParamByName('CODCENTROCUSTO').asString :=
                                        Trim(CmpRptCM.ParamValues[23].AsString);
      sqlCCusto.Open;

      MostraStatusRelatGrupo( 'Abrindo - Atividade/Projeto' );
      sqlAtivProj.Prepare;
      sqlAtivProj.ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
      sqlAtivProj.ParamByName('UNIDNEGOC').asInteger :=
                                             CmpRptCM.ParamValues[24].AsInteger;
      sqlAtivProj.Open;

      MostraStatusRelatGrupo( 'Abrindo - Plano Previdenciário' );
      sqlPPrev.Prepare;
      sqlPPrev.ParamByName('IDPLANOPREV').AsInteger :=
                                             CmpRptCM.ParamValues[25].AsInteger;
      sqlPPrev.Open;

      MostraStatusRelatGrupo( 'Abrindo - Patrocinadora' );
      sqlPatro.Prepare;
      sqlPatro.ParamByName('IDPESSOA').AsInteger :=
                                             CmpRptCM.ParamValues[26].AsInteger;
      sqlPatro.Open;

      MostraStatusRelatGrupo( 'Abrindo - Grupo Inicial' );
      sqlGrupoIni.Prepare;
      sqlGrupoIni.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[28].AsInteger;
      sqlGrupoIni.Open;
      cdsGrupoIni.First;
      if CmpRptCM.ParamValues[3].AsString >
         cdsGrupoIni.FieldByName('CODGRUPOORC').AsString then begin
      end else begin
        cdsGrupoIni.Last;
        if CmpRptCM.ParamValues[3].AsString <
           cdsGrupoIni.FieldByName('CODGRUPOORC').AsString then begin
        end;
      end;
      cdsGrupoIni.Close;

      rpRelatGrupoLabel21.Caption := IntToStr(CmpRptCM.ParamValues[0].AsInteger);

      if trim(CmpRptCM.ParamValues[10].AsString) <> '' then
        rpRelatGrupoLabel23.Caption := trim(CmpRptCM.ParamValues[09].AsString)
                              + ': ' + trim(CmpRptCM.ParamValues[10].AsString)
      else
        rpRelatGrupoLabel23.Caption  := '';

      if trim(CmpRptCM.ParamValues[14].AsString) <> '' then
        rpRelatGrupoLabel24.Caption := trim(CmpRptCM.ParamValues[13].AsString)
                              + ': ' + trim(CmpRptCM.ParamValues[14].AsString)
      else
        rpRelatGrupoLabel24.Caption  := '';

      if trim(CmpRptCM.ParamValues[18].AsString) <> '' then
        rpRelatGrupoLabel25.Caption := trim(CmpRptCM.ParamValues[17].AsString)
                              + ': ' + trim(CmpRptCM.ParamValues[18].AsString)
      else
        rpRelatGrupoLabel25.Caption  := '';

      if trim(CmpRptCM.ParamValues[22].AsString) <> '' then
        rpRelatGrupoLabel26.Caption := trim(CmpRptCM.ParamValues[21].AsString)
                              + ': ' + trim(CmpRptCM.ParamValues[22].AsString)
      else
        rpRelatGrupoLabel26.Caption  := '';


      ppLabel294.Caption := '';
      if not cdsCCusto.IsEmpty then
        ppLabel294.Caption := 'Centro de Custo: ' +
                                   trim(cdsCCusto.FieldByName('NOME').AsString);
      if ppLabel294.Caption <> '' then
        ppLabel294.Caption := ppLabel294.Caption + '   ';
      if not cdsAtivProj.IsEmpty then
        ppLabel294.Caption := ppLabel294.Caption + 'Atividade/Projeto: ' +
                                 trim(cdsAtivProj.FieldByName('NOME').AsString);
      if ppLabel294.Caption <> '' then
        ppLabel294.Caption := ppLabel294.Caption + '   ';
      if not cdsPPrev.IsEmpty then
        ppLabel294.Caption := ppLabel294.Caption + 'Plano Previdenciário: ' +
                                    trim(cdsPPrev.FieldByName('NOME').AsString);
      if ppLabel294.Caption <> '' then
        ppLabel294.Caption := ppLabel294.Caption + '   ';
      if not cdsPatro.IsEmpty then
        ppLabel294.Caption := ppLabel294.Caption + 'Patrocinadora: ' +
                                    trim(cdsPatro.FieldByName('NOME').AsString);
      with cdsPeriodos do begin
        rValCot  := 1;
        rValCot1 := 1;
        rValCot2 := 1;
        rValCot3 := 1;
        rValCot4 := 1;
        rValCot5 := 1;
        rValCot6 := 1;
        Close;

        MostraStatusRelatGrupo( 'Abrindo - Períodos' );
        sqlPeriodos.Prepare;
        sqlPeriodos.ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
        sqlPeriodos.ParamByName('EXERCICIO').asInteger  := CmpRptCM.ParamValues[0].AsInteger;
        sqlPeriodos.ParamByName('PERIODOINI').asInteger := CmpRptCM.ParamValues[1].AsInteger;

        sqlPeriodos.ParamByName('PERIODOFIM').asInteger := CmpRptCM.ParamValues[30].AsInteger + 5;

        sqlPeriodos.Open;
        First;
        x := 0;

        TotalDeLinhas := cdsPeriodos.RecordCount;
        MostraStatusRelatGrupo( 'Lendo - Períodos - ' + IntToStr( TotalDeLinhas ) );


        rpTitMes01.Visible   := False;
        rpTitMes01_O.Visible := False;
        rpTitMes01_R.Visible := False;
        dbORC01.Visible      := False;
        dbREA01.Visible      := False;
        bImpPer01            := False;

        rpTitMes02.Visible   := False;
        rpTitMes02_O.Visible := False;
        rpTitMes02_R.Visible := False;
        dbORC02.Visible      := False;
        dbREA02.Visible      := False;
        bImpPer02            := False;

        rpTitMes03.Visible   := False;
        rpTitMes03_O.Visible := False;
        rpTitMes03_R.Visible := False;
        dbORC03.Visible      := False;
        dbREA03.Visible      := False;
        bImpPer03            := False;

        rpTitMes04.Visible   := False;
        rpTitMes04_O.Visible := False;
        rpTitMes04_R.Visible := False;
        dbORC04.Visible      := False;
        dbREA04.Visible      := False;
        bImpPer04            := False;

        rpTitMes05.Visible   := False;
        rpTitMes05_O.Visible := False;
        rpTitMes05_R.Visible := False;
        dbORC05.Visible      := False;
        dbREA05.Visible      := False;
        bImpPer05            := False;

        rpTitMes06.Visible   := False;
        rpTitMes06_O.Visible := False;
        rpTitMes06_R.Visible := False;
        dbORC06.Visible      := False;
        dbREA06.Visible      := False;
        bImpPer06            := False;

        While not Eof do begin
          if not cdsMoeda.IsEmpty then
            rValCot := FuncaoGeral.TestaCotacaoMoeda
                       (CmpRptCM.ParamValues[4].AsInteger,
                       FieldByName('DATAFIMPERIODO').AsString,'N');
          if rValCot = 0 then
            rValCot := 1;
          x := x + 1;
          if x = 1 then begin
            rpTitMes01.Caption := Copy(FieldByName('NOMEPERIODO').AsString,1,3);
            rValCot1 := rValCot;
            rpTitMes01.Visible   := True;
            rpTitMes01_O.Visible := True;
            rpTitMes01_R.Visible := True;
            dbORC01.Visible      := True;
            dbREA01.Visible      := True;
            bImpPer01            := ( FieldByName('PERIODO').AsInteger <= StrToIntDef( CmpRptCM.ParamValues[30].AsString, 12 ) );
          end else begin
            if x = 2 then begin
              rpTitMes02.Caption := Copy(FieldByName('NOMEPERIODO').AsString,1,3);
              rValCot2 := rValCot;
              rpTitMes02.Visible   := True;
              rpTitMes02_O.Visible := True;
              rpTitMes02_R.Visible := True;
              dbORC02.Visible      := True;
              dbREA02.Visible      := True;
              bImpPer02            := ( FieldByName('PERIODO').AsInteger <= StrToIntDef( CmpRptCM.ParamValues[30].AsString, 12 ) );
            end else begin
              if x = 3 then begin
                rpTitMes03.Caption := Copy(FieldByName('NOMEPERIODO').AsString,1,3);
                rValCot3 := rValCot;
                rpTitMes03.Visible   := True;
                rpTitMes03_O.Visible := True;
                rpTitMes03_R.Visible := True;
                dbORC03.Visible      := True;
                dbREA03.Visible      := True;
                bImpPer03            := ( FieldByName('PERIODO').AsInteger <= StrToIntDef( CmpRptCM.ParamValues[30].AsString, 12 ) );
              end else begin
                if x = 4 then begin
                  rpTitMes04.Caption := Copy(FieldByName('NOMEPERIODO').AsString,1,3);
                  rValCot4 := rValCot;
                  rpTitMes04.Visible   := True;
                  rpTitMes04_O.Visible := True;
                  rpTitMes04_R.Visible := True;
                  dbORC04.Visible      := True;
                  dbREA04.Visible      := True;
                  bImpPer04            := ( FieldByName('PERIODO').AsInteger <= StrToIntDef( CmpRptCM.ParamValues[30].AsString, 12 ) );
                end else begin
                  if x = 5 then begin
                    rpTitMes05.Caption := Copy(FieldByName('NOMEPERIODO').AsString,1,3);
                    rValCot5 := rValCot;
                    rpTitMes05.Visible   := True;
                    rpTitMes05_O.Visible := True;
                    rpTitMes05_R.Visible := True;
                    dbORC05.Visible      := True;
                    dbREA05.Visible      := True;
                    bImpPer05            := ( FieldByName('PERIODO').AsInteger <= StrToIntDef( CmpRptCM.ParamValues[30].AsString, 12 ) );
                  end else begin
                    if x = 6 then begin
                      rpTitMes06.Caption := Copy(FieldByName('NOMEPERIODO').AsString,1,3);
                      rValCot6 := rValCot;
                      rpTitMes06.Visible   := True;
                      rpTitMes06_O.Visible := True;
                      rpTitMes06_R.Visible := True;
                      dbORC06.Visible      := True;
                      dbREA06.Visible      := True;
                      bImpPer06            := ( FieldByName('PERIODO').AsInteger <= StrToIntDef( CmpRptCM.ParamValues[30].AsString, 12 ) );
                    end;
                  end;
                end;
              end;
            end;
          end;

          Dec( TotalDeLinhas );
          MostraStatusRelatGrupo( 'Lendo - Períodos - ' + IntToStr( TotalDeLinhas ) );

          Next;
        end;
      end;
      with cdsRelatOrcxConta do begin
        Close;

        MostraStatusRelatGrupo( 'Abrindo - Relatório' );
        sqlRelatGrupo.Sql.Clear;
        sSQL :=
        'SELECT DISTINCT ' + #13 +
        '  G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, ' + #13 +
        '  0 AS ORC01, 0 AS REA01, ' + #13 +
        '  0 AS ORC02, 0 AS REA02, ' + #13 +
        '  0 AS ORC03, 0 AS REA03, ' + #13 +
        '  0 AS ORC04, 0 AS REA04, ' + #13 +
        '  0 AS ORC05, 0 AS REA05, ' + #13 +
        '  0 AS ORC06, 0 AS REA06, ' + #13 +
        '  0 AS TOTORC, 0 AS TOTREA, ' + #13 +
        '  0 AS PERORC, 0 AS PERREA, ' + #13 +
        '  C.IDCONTAORCAMEN, C.NOMECONTAORCAMEN '+
        'FROM ' + #13 +
        '  GRUPOORCAMEN G ' + #13 +
        ', CONTASORCAMEN C ' + #13 +

        'WHERE ' + #13 +
        '  (G.CODGRUPOORC >= '+ QuotedStr(Espaco(CmpRptCM.ParamValues[3].AsString,10)) + ') AND ' + #13 +
        '  (G.CODGRUPOORC <= '+ QuotedStr(Espaco(CmpRptCM.ParamValues[4].AsString,10)) + ') AND ' + #13;

        if (Trim(CmpRptCM.ParamValues[23].AsString) <> '') and
           (Trim(CmpRptCM.ParamValues[23].AsString) <> '0') then begin
          sSQL := sSQL + '(C.CODCENTROCUSTO LIKE ''' +
                           Trim(CmpRptCM.ParamValues[23].AsString) +
                           '%'') AND (C.IDEMPRESA = ' +
                           IntToStr(Sistema.idEmpresa) + ') AND ';
        end;

        if (Trim(CmpRptCM.ParamValues[25].AsString) <> '') and
           (Trim(CmpRptCM.ParamValues[25].AsString) <> '0') then begin
          sSQL := sSQL + 'C.IDPLANOPREV = ' +
                           Trim(CmpRptCM.ParamValues[25].AsString)  + ' AND';
        end;

        if (Trim(CmpRptCM.ParamValues[26].AsString) <> '') and
           (Trim(CmpRptCM.ParamValues[26].AsString) <> '0') then begin
          sSQL := sSQL + 'C.IDPATRO = ' +
                           Trim(CmpRptCM.ParamValues[26].AsString)  + ' AND';
        end;

        if (Trim(CmpRptCM.ParamValues[24].AsString) <> '') and
           (Trim(CmpRptCM.ParamValues[24].AsString) <> '0') then begin
          sSQL := sSQL + 'C.UNIDNEGOC = ' +
                           Trim(CmpRptCM.ParamValues[24].AsString)  + ' AND';
        end;

        if (Trim(CmpRptCM.ParamValues[2].AsString) <> '') and
           (Trim(CmpRptCM.ParamValues[2].AsString) <> '0') then begin
          sSQL := sSQL + 'C.CODCENTRORESPON = ' +
                           QuotedStr(Trim(CmpRptCM.ParamValues[2].AsString))  + ' AND';
        end;


        sSQL := sSQL +
        '  (G.IDPLANOORCAMEN = ' + IntToSTr(CmpRptCM.ParamValues[28].AsInteger) + ') ' + #13 +

        ' AND (C.IDGRUPOORCAMEN(+) = G.IDGRUPOORCAMEN) ' + #13 +
        ' AND (C.IDCONTAORCAMEN IS NOT NULL )'+ #13+

        'ORDER BY ' + #13 +
        'C.IDCONTAORCAMEN '+#13;

        sqlRelatGrupo.Sql.Text := sSQL;
        sqlRelatGrupo.Open;
        bSair              := False;
        First;

        TotalDeLinhas := cdsRelatOrcxConta.RecordCount;
        MostraStatusRelatGrupo( 'Linhas restantes ' + IntToStr( TotalDeLinhas ) );

        While (not Eof) and (not bSair) do begin
          cdsGrupoOrc.Close;
          sqlGrupoOrc.Prepare;
          sqlGrupoOrc.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[28].AsInteger;
          sqlGrupoOrc.ParamByName('CODGRUPOORC').asString :=
                                      FieldByName('CODGRUPOORC').AsString + '%';
          sqlGrupoOrc.Open;
          sGrupos := '';
          if cdsGrupoOrc.IsEmpty then
            sGrupos := '0';
          while not cdsGrupoOrc.Eof do begin
            if sGrupos = '' then
              sGrupos := cdsGrupoOrc.FieldByName('IDGRUPOORCAMEN').AsString
            else
              sGrupos := sGrupos + ',' +
                         cdsGrupoOrc.FieldByName('IDGRUPOORCAMEN').AsString;
            cdsGrupoOrc.Next;
          end;

          if cdsCenario.IsEmpty then begin
            cdsCompSaldo.Close;
            sqlCompSaldo.Prepare;
            sqlCompSaldo.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[28].AsInteger;
            sqlCompSaldo.ParamByName('GRUPO').AsString := sGrupos;
            sqlCompSaldo.ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
            sqlCompSaldo.ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
            sqlCompSaldo.ParamByName('PERIODOINI').asInteger := CmpRptCM.ParamValues[1].AsInteger;

            sqlCompSaldo.ParamByName('PERIODOFIM').asInteger := CmpRptCM.ParamValues[1].AsInteger + 5;

            if CmpRptCM.ParamValues[6].AsInteger = 0 then begin
              sqlCompSaldo.ParamByName('USUARIO').AsString :=
                             'EXISTS (SELECT UXC.IDPESSOAACESSO ' +
                             'FROM PESSOAXCRESP UXC ' +
                             'WHERE (UXC.IDPESSOAACESSO = ' +
                             IntToStr(Sistema.idUsuario) + ') ' +
                             'AND (UXC.CODCENTRORESPON = C.CODCENTRORESPON) ' +
                             'AND (UXC.IDPESSOA = C.IDPESSOA)  ) AND ';
            end else begin
              sqlCompSaldo.ParamByName('USUARIO').AsString :=
                               'EXISTS (SELECT UXC.IDUSUARIO ' +
                               'FROM USCCUSTO UXC ' +
                               'WHERE (UXC.IDUSUARIO = ' +
                               IntToStr(Sistema.idUsuario) + ') ' +
                               'AND (UXC.IDPESSOA = ' +
                               IntToStr(Sistema.idEmpresa) + ') ' +
                               'AND (UXC.CODCENTROCUSTO = C.CODCENTROCUSTO) ' +
                               'AND (UXC.IDEMPRESA = C.IDEMPRESA) ' +
                               'GROUP BY UXC.IDUSUARIO ) AND ';
            end;
            if not cdsCResp.IsEmpty then begin
              sqlCompSaldo.ParamByName('CRESP').AsString :=
                               '(C.CODCENTRORESPON LIKE ''' +
                               Trim(CmpRptCM.ParamValues[2].AsString) +
                               '%'') AND (C.IDPESSOA = ' +
                               IntToStr(Sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('CRESP').AsString := '(1 = 1) AND ';
            end;
            if not cdsCCusto.IsEmpty then begin
              sqlCompSaldo.ParamByName('CCUSTO').AsString :=
                               '(C.CODCENTROCUSTO LIKE ''' +
                               Trim(CmpRptCM.ParamValues[23].AsString) +
                               '%'') AND (C.IDEMPRESA = ' +
                               IntToStr(Sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('CCUSTO').AsString := '(1 = 1) AND ';
            end;
            if not cdsAtivProj.IsEmpty then begin
              sqlCompSaldo.ParamByName('ATIVPROJ').AsString :=
                               '(C.UNIDNEGOC = ' +
                               IntToStr(CmpRptCM.ParamValues[24].AsInteger) +
                               ') AND (C.IDPESSOA = ' +
                               IntToStr(Sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('ATIVPROJ').AsString := '(1 = 1) AND ';
            end;
            if not cdsPPrev.IsEmpty then begin
              sqlCompSaldo.ParamByName('PPREV').AsString :=
                               '(C.IDPLANOPREV = ' +
                               IntToStr(CmpRptCM.ParamValues[25].AsInteger) +
                               ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('PPREV').AsString := '(1 = 1) AND ';
            end;
            if not cdsPatro.IsEmpty then begin
              sqlCompSaldo.ParamByName('PATRO').AsString :=
                               '(C.IDPATRO = ' +
                               IntToStr(CmpRptCM.ParamValues[26].AsInteger) +
                               ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('PATRO').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[10].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO1').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[07].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[08].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[10].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO1').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO2').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[11].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[12].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[14].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO2').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[18].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO3').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[15].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[16].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[18].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO3').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[22].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO4').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[19].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[20].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[22].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO4').AsString := '(1 = 1) AND ';
            end;

            if CmpRptCM.ParamValues[29].AsInteger = 0 then
            begin
               sSQL :=

               'ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO, ' +
               '     (S.VLRORCADO)))),2) AS VLRORCADOS, '                                    +
               'ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '          +
               '     S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOS, '               +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCADO,NULL,0, '             +
               '     DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO,(S.VLRORCADO)))), '            +
               '     SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO, '  +
               '     (S.VLRORCADO))))*-1),2) AS VLRORCADO, '                                 +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRREALIZADO,NULL,0, '          +
               '     DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO)))), '      +
               '     SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '           +
               '     S.VLRREALIZADO,(S.VLRREALIZADO))))*-1),2) AS VLRREALIZADO';

            end
            else
            begin
               sSQL :=
               'ROUND(SUM(S.VLRORCADO),2) AS VLRORCADOS, '                                      +
               'ROUND(SUM(S.VLRREALIZADO),2) AS VLRREALIZADOS, '                                +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCADO,NULL,0, '             +
               '      DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO,(S.VLRORCADO)))), '              +
               '      SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO, ' +
               '     (S.VLRORCADO))))),2) AS VLRORCADO, '                                       +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRREALIZADO,NULL,0, '          +
               '     DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO)))), '         +
               '     SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '           +
               '     S.VLRREALIZADO,(S.VLRREALIZADO))))),2) AS VLRREALIZADO';
            end;
            sqlCompSaldo.SQL[2] := sSQL;

            sqlCompSaldo.Open;
            cdsCompSaldo.First;

            CdsCompSaldo.Filtered := False;
            CdsCompSaldo.Filter   := 'IDCONTAORCAMEN = ' + QuotedStr(FieldByName('IDCONTAORCAMEN').AsString);
            CdsCompSaldo.Filtered := True;



            Edit;
            While not cdsCompSaldo.Eof do
            begin
              x := CmpRptCM.ParamValues[1].AsInteger - 1;

              cdsPeriodos.First;
              While not cdsPeriodos.Eof do
              begin
                x := x + 1;
                if cdsCompSaldo.FieldByName('PERIODO').AsInteger = x then
                begin

                  // Periodo 1
                  if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 1 then
                  begin
                    FieldByName('ORC01').AsFloat :=
                         FieldByName('ORC01').AsFloat +
                         cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot1;
                    FieldByName('REA01').AsFloat :=
                         FieldByName('REA01').AsFloat +
                         cdsCompSaldo.FieldByName('VLRREALIZADO').AsFloat/
                         rValCot1;
                    Break;
                  end
                  else
                  begin

                    // Periodo 2
                    if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 2 then
                    begin
                      FieldByName('ORC02').AsFloat :=
                           FieldByName('ORC02').AsFloat +
                           cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/
                           rValCot2;
                      FieldByName('REA02').AsFloat :=
                           FieldByName('REA02').AsFloat +
                           cdsCompSaldo.FieldByName('VLRREALIZADO').AsFloat/
                           rValCot2;
                      Break;
                    end
                    else
                    begin

                      // Periodo 3
                      if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 3 then
                      begin
                        FieldByName('ORC03').AsFloat :=
                             FieldByName('ORC03').AsFloat +
                             cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/
                             rValCot3;
                        FieldByName('REA03').AsFloat :=
                             FieldByName('REA03').AsFloat +
                             cdsCompSaldo.FieldByName('VLRREALIZADO').AsFloat/
                             rValCot3;
                        Break;
                      end
                      else
                      begin

                        // Periodo 4
                        if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 4 then
                        begin
                          FieldByName('ORC04').AsFloat :=
                               FieldByName('ORC04').AsFloat +
                               cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/
                               rValCot4;
                          FieldByName('REA04').AsFloat :=
                               FieldByName('REA04').AsFloat +
                               cdsCompSaldo.FieldByName('VLRREALIZADO').AsFloat/
                               rValCot4;
                          Break;
                        end
                        else
                        begin

                          // Periodo 5
                          if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 5 then
                          begin
                            FieldByName('ORC05').AsFloat :=
                                 FieldByName('ORC05').AsFloat +
                                 cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/
                                 rValCot5;
                            FieldByName('REA05').AsFloat :=
                                 FieldByName('REA05').AsFloat +
                                 cdsCompSaldo.FieldByName
                                 ('VLRREALIZADO').AsFloat/rValCot5;
                            Break;
                          end
                          else
                          begin

                            // Periodo 6
                            if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 6 then
                            begin
                              FieldByName('ORC06').AsFloat :=
                                   FieldByName('ORC06').AsFloat +
                                   cdsCompSaldo.FieldByName
                                   ('VLRORCADO').AsFloat/rValCot6;
                              FieldByName('REA06').AsFloat :=
                                   FieldByName('REA06').AsFloat +
                                   cdsCompSaldo.FieldByName(
                                   'VLRREALIZADO').AsFloat/rValCot6;
                              Break;
                            end;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
                cdsPeriodos.Next;
              end;
              cdsCompSaldo.Next;
            end;
          end else begin
            cdsCompSaldoC.Close;
            sqlCompSaldoC.Prepare;
            sqlCompSaldo.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[28].AsInteger;
            sqlCompSaldoC.ParamByName('GRUPO').AsString := sGrupos;
            sqlCompSaldoC.ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
            sqlCompSaldoC.ParamByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
            sqlCompSaldoC.ParamByName('PERIODOINI').asInteger := CmpRptCM.ParamValues[1].AsInteger;

            sqlCompSaldoC.ParamByName('PERIODOFIM').asInteger := CmpRptCM.ParamValues[1].AsInteger + 5;

            if CmpRptCM.ParamValues[6].AsInteger = 0 then begin
              sqlCompSaldoC.ParamByName('USUARIO').AsString :=
                             'EXISTS (SELECT UXC.IDPESSOAACESSO ' +
                             'FROM PESSOAXCRESP UXC ' +
                             'WHERE (UXC.IDPESSOAACESSO = ' +
                             IntToStr(Sistema.idUsuario) + ') ' +
                             'AND (UXC.CODCENTRORESPON = C.CODCENTRORESPON) ' +
                             'AND (UXC.IDPESSOA = C.IDPESSOA)  ) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('USUARIO').AsString :=
                               'EXISTS (SELECT UXC.IDUSUARIO ' +
                               'FROM USCCUSTO UXC ' +
                               'WHERE (UXC.IDUSUARIO = ' +
                               IntToStr(Sistema.idUsuario) + ') ' +
                               'AND (UXC.IDPESSOA = ' +
                               IntToStr(Sistema.idEmpresa) + ') ' +
                               'AND (UXC.CODCENTROCUSTO = C.CODCENTROCUSTO) ' +
                               'AND (UXC.IDEMPRESA = C.IDEMPRESA) ' +
                               'GROUP BY UXC.IDUSUARIO ) AND ';
            end;
            if not cdsCResp.IsEmpty then begin
              sqlCompSaldoC.ParamByName('CRESP').AsString :=
                               '(C.CODCENTRORESPON LIKE ''' +
                               Trim(CmpRptCM.ParamValues[2].AsString) +
                               '%'') AND (C.IDPESSOA = ' +
                               IntToStr(Sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('CRESP').AsString := '(1 = 1) AND ';
            end;
            if not cdsCCusto.IsEmpty then begin
              sqlCompSaldoC.ParamByName('CCUSTO').AsString :=
                               '(C.CODCENTROCUSTO LIKE ''' +
                               Trim(CmpRptCM.ParamValues[23].AsString) +
                               '%'') AND (C.IDEMPRESA = ' +
                               IntToStr(Sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('CCUSTO').AsString := '(1 = 1) AND ';
            end;
            if not cdsAtivProj.IsEmpty then begin
              sqlCompSaldoC.ParamByName('ATIVPROJ').AsString :=
                               '(C.UNIDNEGOC = ' +
                               IntToStr(CmpRptCM.ParamValues[24].AsInteger) +
                               ') AND (C.IDPESSOA = ' +
                               IntToStr(Sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('ATIVPROJ').AsString := '(1 = 1) AND ';
            end;
            if not cdsPPrev.IsEmpty then begin
              sqlCompSaldoC.ParamByName('PPREV').AsString :=
                               '(C.IDPLANOPREV = ' +
                               IntToStr(CmpRptCM.ParamValues[25].AsInteger) +
                               ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PPREV').AsString := '(1 = 1) AND ';
            end;
            if not cdsPatro.IsEmpty then begin
              sqlCompSaldoC.ParamByName('PATRO').AsString :=
                               '(C.IDPATRO = ' +
                               IntToStr(CmpRptCM.ParamValues[26].AsInteger) +
                               ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PATRO').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[10].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO1').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[07].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[08].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[10].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO1').AsString :=
                               '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[14].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO2').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[11].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[12].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[14].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO2').AsString :=
                               '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[18].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO3').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[15].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[16].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[18].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO3').AsString :=
                               '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[22].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO4').AsString :=
                           '(SUBSTR(S.IDCONTAORCAMEN,' +
                           IntToStr(CmpRptCM.ParamValues[19].AsInteger) + ',' +
                           IntToStr(CmpRptCM.ParamValues[20].AsInteger) +
                           ') IN (' + Trim(CmpRptCM.ParamValues[22].AsString) +
                           ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO4').AsString :=
                               '(1 = 1) AND ';
            end;

            if CmpRptCM.ParamValues[29].AsInteger = 0 then
            begin
               sSQL :=
               '(0) AS VLRORCADOS, '                                                             +
               'ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '           +
               'S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOS, '                     +
               '(0) AS VLRORCADO, '                                                              +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRREALIZADO,NULL,0, '           +
               'DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))), '            +
               'SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO, '  +
               '(S.VLRREALIZADO*-1))))*-1),2) AS VLRREALIZADO';
               sqlCompSaldoC.SQL[9] := sSQL;

               sSQL :=
               'ROUND(SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '          +
               'S.VLRORCCENARIO,(S.VLRORCCENARIO*-1)))),2) AS VLRORCADOS, '                      +
               '(0) AS VLRREALIZADOS, '                                                          +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCCENARIO,NULL,0, '          +
               'DECODE(C.FLGSINALCONTA,''P'',S.VLRORCCENARIO,(S.VLRORCCENARIO)))), '          +
               'SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '                +
               'S.VLRORCCENARIO,(S.VLRORCCENARIO))))*-1),2) AS VLRORCADO, '                   +

               '(0) AS VLRREALIZADO, ';
               sqlCompSaldoC.SQL[40] := sSQL;

            end
            else
            begin
               sSQL :=
               '(0) AS VLRORCADOS, '                                                             +
               'ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '           +
               'S.VLRREALIZADO,(S.VLRREALIZADO)))),2) AS VLRREALIZADOS, '                        +
               '(0) AS VLRORCADO, '                                                              +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRREALIZADO,NULL,0, '           +
               'DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO)))), '               +
               'SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO, '  +
               '(S.VLRREALIZADO))))),2) AS VLRREALIZADO';
               sqlCompSaldoC.SQL[9] := sSQL;

               sSQL :=
               'ROUND(SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '          +
               'S.VLRORCCENARIO,(S.VLRORCCENARIO)))),2) AS VLRORCADOS, '                         +
               '(0) AS VLRREALIZADOS, '                                                          +
               'ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCCENARIO,NULL,0, '          +
               'DECODE(C.FLGSINALCONTA,''P'',S.VLRORCCENARIO,(S.VLRORCCENARIO)))), '             +
               'SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'', '                +
               'S.VLRORCCENARIO,(S.VLRORCCENARIO))))),2) AS VLRORCADO, '                         +
               '(0) AS VLRREALIZADO, ';
               sqlCompSaldoC.SQL[40] := sSQL;
            end;

            sqlCompSaldoC.Open;
            cdsCompSaldoC.First;
            Edit;
            While not cdsCompSaldoC.Eof do begin
              x := CmpRptCM.ParamValues[1].AsInteger - 1;
              cdsPeriodos.First;
              While not cdsPeriodos.Eof do begin
                x := x + 1;
                if cdsCompSaldoC.FieldByName('PERIODO').AsInteger = x then
                   begin
                  if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 1 then begin
                    FieldByName('ORC01').AsFloat :=
                         FieldByName('ORC01').AsFloat +
                         cdsCompSaldoC.FieldByName
                         ('VLRORCADO').AsFloat/rValCot1;
                    FieldByName('REA01').AsFloat :=
                         FieldByName('REA01').AsFloat +
                         cdsCompSaldoC.FieldByName('VLRREALIZADO').AsFloat/
                         rValCot1;
                    Break;
                  end else begin
                    if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 2 then
                       begin
                      FieldByName('ORC02').AsFloat :=
                           FieldByName('ORC02').AsFloat +
                           cdsCompSaldoC.FieldByName('VLRORCADO').AsFloat/
                           rValCot2;
                      FieldByName('REA02').AsFloat :=
                           FieldByName('REA02').AsFloat +
                           cdsCompSaldoC.FieldByName('VLRREALIZADO').AsFloat/
                           rValCot2;
                      Break;
                    end else begin
                      if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 3 then
                         begin
                        FieldByName('ORC03').AsFloat :=
                             FieldByName('ORC03').AsFloat +
                             cdsCompSaldoC.FieldByName('VLRORCADO').AsFloat/
                             rValCot3;
                        FieldByName('REA03').AsFloat :=
                             FieldByName('REA03').AsFloat +
                             cdsCompSaldoC.FieldByName('VLRREALIZADO').AsFloat/
                             rValCot3;
                        Break;
                      end else begin
                        if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 4 then
                           begin
                          FieldByName('ORC04').AsFloat :=
                               FieldByName('ORC04').AsFloat +
                               cdsCompSaldoC.FieldByName('VLRORCADO').AsFloat/
                               rValCot4;
                          FieldByName('REA04').AsFloat :=
                               FieldByName('REA04').AsFloat +
                               cdsCompSaldoC.FieldByName('VLRREALIZADO').AsFloat/
                               rValCot4;
                          Break;
                        end else begin
                          if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 5
                             then begin
                            FieldByName('ORC05').AsFloat :=
                                 FieldByName('ORC05').AsFloat +
                                 cdsCompSaldoC.FieldByName('VLRORCADO').AsFloat/
                                 rValCot5;
                            FieldByName('REA05').AsFloat :=
                                 FieldByName('REA05').AsFloat +
                                 cdsCompSaldoC.FieldByName
                                 ('VLRREALIZADO').AsFloat/rValCot5;
                            Break;
                          end else begin
                            if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 6
                               then begin
                              FieldByName('ORC06').AsFloat :=
                                   FieldByName('ORC06').AsFloat +
                                   cdsCompSaldoC.FieldByName
                                   ('VLRORCADO').AsFloat/rValCot6;
                              FieldByName('REA06').AsFloat :=
                                   FieldByName('REA06').AsFloat +
                                   cdsCompSaldoC.FieldByName
                                   ('VLRREALIZADO').AsFloat/rValCot6;
                              Break;
                            end;
                          end;
                        end;
                      end;
                    end;
                  end;
                end;
                cdsPeriodos.Next;
              end;
              cdsCompSaldoC.Next;
            end;
          end;
          cdsCResp.Close;
          cdsMoeda.Close;
          cdsCenario.Close;
          cdsCCusto.Close;
          cdsAtivProj.Close;
          cdsPPrev.Close;
          cdsPatro.Close;

          FieldByName('TOTORC').AsFloat :=
                 Iff( bImpPer01, FieldByName('ORC01').AsFloat, 0 ) +
                 Iff( bImpPer02, FieldByName('ORC02').AsFloat, 0 ) +
                 Iff( bImpPer03, FieldByName('ORC03').AsFloat, 0 ) +
                 Iff( bImpPer04, FieldByName('ORC04').AsFloat, 0 ) +
                 Iff( bImpPer05, FieldByName('ORC05').AsFloat, 0 ) +
                 Iff( bImpPer06, FieldByName('ORC06').AsFloat, 0 ) ;

          FieldByName('TOTREA').AsFloat :=
                 Iff( bImpPer01, FieldByName('REA01').AsFloat, 0 ) +
                 Iff( bImpPer02, FieldByName('REA02').AsFloat, 0 ) +
                 Iff( bImpPer03, FieldByName('REA03').AsFloat, 0 ) +
                 Iff( bImpPer04, FieldByName('REA04').AsFloat, 0 ) +
                 Iff( bImpPer05, FieldByName('REA05').AsFloat, 0 ) +
                 Iff( bImpPer06, FieldByName('REA06').AsFloat, 0 ) ;

          If FieldByName('TOTORC').AsFloat <> 0 then
            FieldByName('PERORC').AsFloat := ((FieldByName('TOTORC').AsFloat -
                   FieldByName('TOTREA').AsFloat) /
                   FieldByName('TOTORC').AsFloat)*100;
          If FieldByName('TOTREA').AsFloat <> 0 then
            FieldByName('PERREA').AsFloat := ((FieldByName('TOTREA').AsFloat -
                   FieldByName('TOTORC').AsFloat) /
                   FieldByName('TOTREA').AsFloat)*100;

          if not CmpRptCM.ParamValues[3].AsBoolean then begin
            If (FieldByName('ORC01').AsFloat = 0) and
               (FieldByName('REA01').AsFloat = 0) and
               (FieldByName('ORC02').AsFloat = 0) and
               (FieldByName('REA02').AsFloat = 0) and
               (FieldByName('ORC03').AsFloat = 0) and
               (FieldByName('REA03').AsFloat = 0) and
               (FieldByName('ORC04').AsFloat = 0) and
               (FieldByName('REA04').AsFloat = 0) and
               (FieldByName('ORC05').AsFloat = 0) and
               (FieldByName('REA05').AsFloat = 0) and
               (FieldByName('ORC06').AsFloat = 0) and
               (FieldByName('REA06').AsFloat = 0) then begin
              Next;
              if Eof then
                bSair := True
              else
                Prior;
              Delete;
            end else begin
              Post;
              Next;
            end;
          end else begin
            Post;
            Next;
          end;

          Dec( TotalDeLinhas );
          MostraStatusRelatGrupo( 'Linhas restantes ' + IntToStr( TotalDeLinhas ) );
        end;
      end;

      If ( CmpRptCM.ParamByName( 'PARENTESES' ).AsString = 'P' ) Then Begin

        dbORC01.DisplayFormat := '#,0.00;(#,0.00)';
        dbREA01.DisplayFormat := '#,0.00;(#,0.00)';
        dbORC02.DisplayFormat := '#,0.00;(#,0.00)';
        dbREA02.DisplayFormat := '#,0.00;(#,0.00)';
        dbORC03.DisplayFormat := '#,0.00;(#,0.00)';
        dbREA03.DisplayFormat := '#,0.00;(#,0.00)';
        dbORC04.DisplayFormat := '#,0.00;(#,0.00)';
        dbREA04.DisplayFormat := '#,0.00;(#,0.00)';
        dbORC05.DisplayFormat := '#,0.00;(#,0.00)';
        dbREA05.DisplayFormat := '#,0.00;(#,0.00)';
        dbORC06.DisplayFormat := '#,0.00;(#,0.00)';
        dbREA06.DisplayFormat := '#,0.00;(#,0.00)';
        rpRelatGrupoDbText15.DisplayFormat := '#,0.00;(#,0.00)';

      End Else Begin

        dbORC01.DisplayFormat := '#,0.00';
        dbREA01.DisplayFormat := '#,0.00';
        dbORC02.DisplayFormat := '#,0.00';
        dbREA02.DisplayFormat := '#,0.00';
        dbORC03.DisplayFormat := '#,0.00';
        dbREA03.DisplayFormat := '#,0.00';
        dbORC04.DisplayFormat := '#,0.00';
        dbREA04.DisplayFormat := '#,0.00';
        dbORC05.DisplayFormat := '#,0.00';
        dbREA05.DisplayFormat := '#,0.00';
        dbORC06.DisplayFormat := '#,0.00';
        dbREA06.DisplayFormat := '#,0.00';
        rpRelatGrupoDbText15.DisplayFormat := '#,0.00';
      End;
  end;
  MostraStatusRelatGrupo( '' );
end;

end.
