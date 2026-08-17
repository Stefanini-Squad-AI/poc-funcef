unit rRelatGrupoCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlOrcamento;

type
  TrptRelatGrupoCCusto = class(TFrmCmReport)
    sqlRelatGrupoCCusto: TCMSqlParams;
    cdsRelatGrupoCCusto: TCMClientDataSet;
    dsRelatGrupoCCust: TwwDataSource;
    pplRelatGrupoCCust: TppBDEPipeline;
    pplRelatGrupoCCustppField1: TppField;
    pplRelatGrupoCCustppField2: TppField;
    pplRelatGrupoCCustppField3: TppField;
    pplRelatGrupoCCustppField4: TppField;
    pplRelatGrupoCCustppField5: TppField;
    pplRelatGrupoCCustppField6: TppField;
    pplRelatGrupoCCustppField7: TppField;
    pplRelatGrupoCCustppField8: TppField;
    pplRelatGrupoCCustppField9: TppField;
    pplRelatGrupoCCustppField10: TppField;
    pplRelatGrupoCCustppField11: TppField;
    pplRelatGrupoCCustppField12: TppField;
    pplRelatGrupoCCustppField13: TppField;
    pplRelatGrupoCCustppField14: TppField;
    pplRelatGrupoCCustppField15: TppField;
    pplRelatGrupoCCustppField16: TppField;
    pplRelatGrupoCCustppField17: TppField;
    pplRelatGrupoCCustppField18: TppField;
    pplRelatGrupoCCustppField19: TppField;
    pplRelatGrupoCCustppField20: TppField;
    rpRelatGrupoCCust: TppReport;
    ppHeaderBand28: TppHeaderBand;
    ppLabel265: TppLabel;
    ppLine95: TppLine;
    ppLabel268: TppLabel;
    ppLabel271: TppLabel;
    ppLabel274: TppLabel;
    ppLine96: TppLine;
    ppLine97: TppLine;
    rpRelatGrupoCCustoLabel262: TppLabel;
    ppLabel280: TppLabel;
    ppLabel282: TppLabel;
    ppLine98: TppLine;
    ppLine99: TppLine;
    rpRelatGrupoCCustoLabel265: TppLabel;
    ppLabel284: TppLabel;
    ppLabel285: TppLabel;
    ppLine100: TppLine;
    ppLine101: TppLine;
    rpRelatGrupoCCustoLabel268: TppLabel;
    ppLabel287: TppLabel;
    ppLabel290: TppLabel;
    ppLine102: TppLine;
    ppLine103: TppLine;
    rpRelatGrupoCCustoLabel271: TppLabel;
    ppLabel292: TppLabel;
    ppLabel293: TppLabel;
    ppLine104: TppLine;
    ppLine105: TppLine;
    rpRelatGrupoCCustoLabel274: TppLabel;
    ppLabel295: TppLabel;
    ppLabel296: TppLabel;
    ppLine106: TppLine;
    ppLine107: TppLine;
    rpRelatGrupoCCustoLabel277: TppLabel;
    ppLabel298: TppLabel;
    ppLabel299: TppLabel;
    ppLine108: TppLine;
    rpRelatGrupoCCustoLabel280: TppLabel;
    ppLabel301: TppLabel;
    rpRelatGrupoCCustoLabel282: TppLabel;
    rpRelatGrupoCCustoLabel283: TppLabel;
    rpRelatGrupoCCustoLabel284: TppLabel;
    rpRelatGrupoCCustoLabel285: TppLabel;
    rpRelatGrupoCCustoLabel286: TppLabel;
    rpRelatGrupoCCustoLabel287: TppLabel;
    ppLabel308: TppLabel;
    ppLabel297: TppLabel;
    ppDetailBand28: TppDetailBand;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppFooterBand28: TppFooterBand;
    ppLabel309: TppLabel;
    ppLine109: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel310: TppLabel;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    sqlCompSaldo: TCMSqlParams;
    cdsCompSaldo: TCMClientDataSet;
    sqlCompSaldoC: TCMSqlParams;
    cdsCompSaldoC: TCMClientDataSet;
    sqlPeriodos: TCMSqlParams;
    cdsPeriodos: TCMClientDataSet;
    sqlGrupoOrc: TCMSqlParams;
    cdsGrupoOrc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure sqlCompSaldoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure sqlCompSaldoCFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptRelatGrupoCCusto: TrptRelatGrupoCCusto;

implementation

uses uSistema, uData, uFuncaoGeral, uModulo, uMensErro, uString;

{$R *.DFM}

procedure TrptRelatGrupoCCusto.FormCreate(Sender: TObject);
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
  with CmpRptCM.ParamValues[25].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTROCUSTO, NOME');
    Add('FROM CENTCUST');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('AND (ATIVO = ''S'') ');
    Add('ORDER BY NOME');
  end;
  // Cria SQL Parametro Atividade/Projeto
  with CmpRptCM.ParamValues[26].LookupSettings.SQL do begin
    Clear;
    Add('SELECT UNIDNEGOC, NOME');
    Add('FROM UNIDNEGOCIO');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('ORDER BY NOME');
  end;
  // Inicializa Parametro Grau
  with CmpRptCM.ParamValues[5].SpinEditSettings do begin
   MaxValue := FuncaoGeral.CalcGrauMax(Modulo.sMascaraGrupo);
   Value    := MaxValue;
   MinValue := 1;
  end;
end;

procedure TrptRelatGrupoCCusto.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
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
          Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) +
                                                                          ') ');
          Add('ORDER BY PERIODO');
        end;
        end;
  end;
end;

procedure TrptRelatGrupoCCusto.sqlCompSaldoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'GRUPO') or (sParamName = 'CRESP') or
     (sParamName = 'CCUSTO') or (sParamName = 'ATIVPROJ') or
     (sParamName = 'PPREV') or (sParamName = 'PATRO') or
     (sParamName = 'PARAMETRO1') or (sParamName = 'PARAMETRO2') or
     (sParamName = 'PARAMETRO3') or (sParamName = 'PARAMETRO4') then
    sNewValue := sOldValue;
end;

procedure TrptRelatGrupoCCusto.sqlCompSaldoCFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'GRUPO') or (sParamName = 'CRESP') or
     (sParamName = 'CCUSTO') or (sParamName = 'ATIVPROJ') or
     (sParamName = 'PPREV') or (sParamName = 'PATRO') or
     (sParamName = 'PARAMETRO1') or (sParamName = 'PARAMETRO2') or
     (sParamName = 'PARAMETRO3') or (sParamName = 'PARAMETRO4') then
    sNewValue := sOldValue;
end;

procedure TrptRelatGrupoCCusto.CrmRptCMBeforePrint(Sender: TObject);
var x, iNumDigGrau: Integer;
    rValCot, rValCot1, rValCot2, rValCot3, rValCot4, rValCot5, rValCot6: Double;
    sGrupos: String;
    bSair: Boolean;
begin
  iNumDigGrau := FuncaoGeral.CalcNumEleGrau
                 (Modulo.sMascaraGrupo,CmpRptCM.ParamValues[5].AsInteger);
  //Filtra os dados da tela para passar a ordenação correta para o relatório
  if (Trim(CmpRptCM.ParamValues[1].AsString) = '') then begin
    MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
    ModalResult := mrNone;
  end else begin
    if OrcamentoBackMT.DiasNoPeriodo(CmpRptCM.ParamValues[0].AsInteger,
       CmpRptCM.ParamValues[1].AsInteger) = 0 then begin
      MsgDlg('O Período Inicial não existe para o Exercício selecionado.',
             'Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
    end else begin
      If trim(Trim(CmpRptCM.ParamValues[8].AsString)) = '' then
        rpRelatGrupoCCustoLabel280.Caption :=
                               Trim(CmpRptCM.ParamValues[0].AsString)
      else
        rpRelatGrupoCCustoLabel280.Caption :=
                               Trim(CmpRptCM.ParamValues[0].AsString) +
                               ' - ' + Trim(CmpRptCM.ParamValues[8].AsString);
      if Trim(CmpRptCM.ParamValues[12].AsString) <> '' then
        rpRelatGrupoCCustoLabel282.Caption :=
                               Trim(CmpRptCM.ParamValues[11].AsString) +
                               ': ' + Trim(CmpRptCM.ParamValues[12].AsString)
      else
        rpRelatGrupoCCustoLabel282.Caption := '';
      if Trim(CmpRptCM.ParamValues[16].AsString) <> '' then
        rpRelatGrupoCCustoLabel283.Caption :=
                               Trim(CmpRptCM.ParamValues[15].AsString) +
                               ': ' + Trim(CmpRptCM.ParamValues[16].AsString)
      else
        rpRelatGrupoCCustoLabel283.Caption := '';
      if Trim(CmpRptCM.ParamValues[20].AsString) <> '' then
        rpRelatGrupoCCustoLabel284.Caption :=
                               Trim(CmpRptCM.ParamValues[19].AsString) +
                               ': ' + Trim(CmpRptCM.ParamValues[20].AsString)
      else
        rpRelatGrupoCCustoLabel284.Caption := '';
      if Trim(CmpRptCM.ParamValues[24].AsString) <> '' then
        rpRelatGrupoCCustoLabel285.Caption :=
                               Trim(CmpRptCM.ParamValues[23].AsString) +
                               ': ' + Trim(CmpRptCM.ParamValues[24].AsString)
      else
        rpRelatGrupoCCustoLabel285.Caption := '';
      if Trim(CmpRptCM.ParamValues[5].AsString) <> '' then
        rpRelatGrupoCCustoLabel286.Caption := 'Moeda: ' +
                               Trim(CmpRptCM.ParamValues[5].AsString)
      else
        rpRelatGrupoCCustoLabel286.Caption := '';
      if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
        rpRelatGrupoCCustoLabel287.Caption := 'C.Responsabilidade: ' +
                               Trim(CmpRptCM.ParamValues[2].AsString)
      else
        rpRelatGrupoCCustoLabel287.Caption := '';
      ppLabel297.Caption := '';
      if Trim(CmpRptCM.ParamValues[25].AsString) <> '' then
        ppLabel297.Caption := 'Centro de Custo: ' +
                   Trim(CmpRptCM.ParamValues[25].AsString);
      if ppLabel297.Caption <> '' then
        ppLabel297.Caption := ppLabel297.Caption + '   ';
      if Trim(CmpRptCM.ParamValues[26].AsString) <> '' then
        ppLabel297.Caption := ppLabel297.Caption + 'Atividade/Projeto: ' +
                   Trim(CmpRptCM.ParamValues[26].AsString);
      if ppLabel297.Caption <> '' then
        ppLabel297.Caption := ppLabel297.Caption + '   ';
      if Trim(CmpRptCM.ParamValues[27].AsString) <> '' then
        ppLabel297.Caption := ppLabel297.Caption + 'Plano Previdenciário: ' +
                   Trim(CmpRptCM.ParamValues[27].AsString);
      if ppLabel297.Caption <> '' then
        ppLabel297.Caption := ppLabel297.Caption + '   ';
      if Trim(CmpRptCM.ParamValues[28].AsString) <> '' then
        ppLabel297.Caption := ppLabel297.Caption + 'Patrocinadora: ' +
                   Trim(CmpRptCM.ParamValues[28].AsString);
      with cdsPeriodos do begin
        rValCot := 1;
        rValCot1 := 1;
        rValCot2 := 1;
        rValCot3 := 1;
        rValCot4 := 1;
        rValCot5 := 1;
        rValCot6 := 1;
        Close;
        sqlPeriodos.Prepare;
        sqlPeriodos.ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
        sqlPeriodos.ParamByName('EXERCICIO').asInteger :=
                           CmpRptCM.ParamValues[0].AsInteger;
        sqlPeriodos.ParamByName('PERIODOINI').asInteger :=
                           CmpRptCM.ParamValues[1].AsInteger;
        sqlPeriodos.ParamByName('PERIODOFIM').asInteger :=
                           CmpRptCM.ParamValues[1].AsInteger + 5;
        sqlPeriodos.Open;
        First;
        x := 0;
        While not Eof do begin
          if Trim(CmpRptCM.ParamValues[4].AsString) <> '' then
            rValCot := FuncaoGeral.TestaCotacaoMoeda
                       (CmpRptCM.ParamValues[4].AsInteger,
                       cdsPeriodos.FieldByName('DATAFIMPERIODO').AsString,'N');
          if rValCot = 0 then
            rValCot := 1;
          x := x + 1;
          if x = 1 then begin
            rpRelatGrupoCCustoLabel262.Caption :=
                      Copy(cdsPeriodos.FieldByName('NOMEPERIODO').AsString,1,3);
            rValCot1 := rValCot;
          end else begin
            if x = 2 then begin
              rpRelatGrupoCCustoLabel265.Caption :=
                      Copy(cdsPeriodos.FieldByName('NOMEPERIODO').AsString,1,3);
              rValCot2 := rValCot;
            end else begin
              if x = 3 then begin
                rpRelatGrupoCCustoLabel268.Caption :=
                      Copy(cdsPeriodos.FieldByName('NOMEPERIODO').AsString,1,3);
                rValCot3 := rValCot;
              end else begin
                if x = 4 then begin
                  rpRelatGrupoCCustoLabel271.Caption :=
                      Copy(cdsPeriodos.FieldByName('NOMEPERIODO').AsString,1,3);
                  rValCot4 := rValCot;
                end else begin
                  if x = 5 then begin
                    rpRelatGrupoCCustoLabel274.Caption := Copy
                          (cdsPeriodos.FieldByName('NOMEPERIODO').AsString,1,3);
                    rValCot5 := rValCot;
                  end else begin
                    if x = 6 then begin
                      rpRelatGrupoCCustoLabel277.Caption := Copy
                          (cdsPeriodos.FieldByName('NOMEPERIODO').AsString,1,3);
                      rValCot6 := rValCot;
                    end;
                  end;
                end;
              end;
            end;
          end;
          Next;
        end;
      end;
      with cdsRelatGrupoCCusto do begin
        Close;
        sqlRelatGrupoCCusto.Prepare;
        sqlRelatGrupoCCusto.ParamByName('IDEMPRESA').AsInteger :=
                                   Sistema.idEmpresa;
        sqlRelatGrupoCCusto.ParamByName('NUMDIGGRAU').AsInteger := iNumDigGrau;
        sqlRelatGrupoCCusto.ParamByName('CODGRUPOINI').AsString :=
                                   Espaco(CmpRptCM.ParamValues[6].AsString,10);
        sqlRelatGrupoCCusto.ParamByName('CODGRUPOFIM').AsString :=
                                   Espaco(CmpRptCM.ParamValues[7].AsString,10);
        sqlRelatGrupoCCusto.Open;
        bSair := False;
        First;
        While (not Eof) and (not bSair) do begin
          cdsGrupoOrc.Close;
          cdsGrupoOrc.ParamByName('CODGRUPOORC').asString :=
                             FieldByName('CODGRUPOORC').AsString + '%';
          cdsGrupoOrc.Open;
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
          if trim(CmpRptCM.ParamValues[8].AsString) = '' then begin
            cdsCompSaldo.Close;
            sqlCompSaldo.Prepare;
            sqlCompSaldo.ParamByName('GRUPO').AsString := sGrupos;
            sqlCompSaldo.ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
            sqlCompSaldo.ParamByName('EXERCICIO').asInteger :=
                                CmpRptCM.ParamValues[0].AsInteger;
            sqlCompSaldo.ParamByName('PERIODOINI').asInteger := 
                                CmpRptCM.ParamValues[1].AsInteger;
            sqlCompSaldo.ParamByName('PERIODOFIM').asInteger :=
                                CmpRptCM.ParamValues[1].AsInteger + 5;
            sqlCompSaldo.ParamByName('CODCENTROCUSTO').AsString :=
                              Espaco(FieldByName('CODCENTROCUSTO').AsString,10);
            if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('CRESP').AsString :=
                                '(C.CODCENTRORESPON LIKE ''' +
                                Trim(CmpRptCM.ParamValues[2].AsString) +
                                '%'') AND (C.IDPESSOA = ' +
                                IntToStr(sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('CRESP').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[25].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('CCUSTO').AsString :=
                                '(C.CODCENTROCUSTO LIKE ''' +
                                Trim(CmpRptCM.ParamValues[26].AsString) +
                                '%'') AND (C.IDEMPRESA = ' +
                                IntToStr(sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('CCUSTO').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[26].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('ATIVPROJ').AsString :=
                                '(C.UNIDNEGOC = ' +
                                Trim(CmpRptCM.ParamValues[26].AsString) +
                                ') AND (C.IDPESSOA = ' +
                                IntToStr(sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('ATIVPROJ').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[27].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PPREV').AsString :=
                                '(C.IDPLANOPREV = ' +
                                Trim(CmpRptCM.ParamValues[27].AsString) +
                                ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('PPREV').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[28].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PATRO').AsString :=
                                '(C.IDPATRO = ' +
                                Trim(CmpRptCM.ParamValues[28].AsString) +
                                ') AND ';
            end else begin
              sqlCompSaldo.ParamByName('PATRO').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[12].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO1').AsString :=
                                '(SUBSTR(S.IDCONTAORCAMEN,' +
                                Trim(CmpRptCM.ParamValues[9].AsString) + ',' +
                                Trim(CmpRptCM.ParamValues[10].AsString) +
                                ') IN (' +
                                Trim(CmpRptCM.ParamValues[12].AsString) +
                                ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO1').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[16].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO2').AsString :=
                                '(SUBSTR(S.IDCONTAORCAMEN,' +
                                Trim(CmpRptCM.ParamValues[13].AsString) + ',' +
                                Trim(CmpRptCM.ParamValues[14].AsString) +
                                ') IN (' +
                                Trim(CmpRptCM.ParamValues[16].AsString) +
                                ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO2').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[20].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO3').AsString :=
                                '(SUBSTR(S.IDCONTAORCAMEN,' +
                                Trim(CmpRptCM.ParamValues[17].AsString) + ',' +
                                Trim(CmpRptCM.ParamValues[18].AsString) +
                                ') IN (' +
                                Trim(CmpRptCM.ParamValues[20].AsString) +
                                ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO3').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[24].AsString) <> '' then begin
              sqlCompSaldo.ParamByName('PARAMETRO4').AsString :=
                                '(SUBSTR(S.IDCONTAORCAMEN,' +
                                Trim(CmpRptCM.ParamValues[21].AsString) + ',' +
                                Trim(CmpRptCM.ParamValues[22].AsString) +
                                ') IN (' +
                                Trim(CmpRptCM.ParamValues[24].AsString) +
                                ')) AND ';
            end else begin
              sqlCompSaldo.ParamByName('PARAMETRO4').AsString := '(1 = 1) AND ';
            end;
            sqlCompSaldo.Open;
            cdsCompSaldo.First;
            Edit;
            While not cdsCompSaldo.Eof do begin
              x := CmpRptCM.ParamValues[1].AsInteger - 1;
              cdsPeriodos.First;
              While not cdsPeriodos.Eof do begin
                x := x + 1;
                if cdsCompSaldo.FieldByName('PERIODO').AsInteger = x then begin
                  if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 1 then begin
                    FieldByName('ORC01').AsFloat :=
                         FieldByName('ORC01').AsFloat +
                         cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot1;
                    FieldByName('REA01').AsFloat :=
                         FieldByName('REA01').AsFloat +
                         cdsCompSaldo.FieldByName('VLRREALIZADO').AsFloat/
                         rValCot1;
                    Break;
                  end else begin
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
                    end else begin
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
                      end else begin
                        if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 4 then
                           begin
                          FieldByName('ORC04').AsFloat :=
                               FieldByName('ORC04').AsFloat +
                               cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/
                               rValCot4;
                          FieldByName('REA04').AsFloat :=
                               FieldByName('REA04').AsFloat +
                               cdsCompSaldo.FieldByName
                               ('VLRREALIZADO').AsFloat/rValCot4;
                          Break;
                        end else begin
                          if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 5
                             then begin
                            FieldByName('ORC05').AsFloat :=
                                 FieldByName('ORC05').AsFloat +
                                 cdsCompSaldo.FieldByName('VLRORCADO').AsFloat/
                                 rValCot5;
                            FieldByName('REA05').AsFloat :=
                                 FieldByName('REA05').AsFloat +
                                 cdsCompSaldo.FieldByName
                                 ('VLRREALIZADO').AsFloat/rValCot5;
                            Break;
                          end else begin
                            if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 6
                               then begin
                              FieldByName('ORC06').AsFloat :=
                                   FieldByName('ORC06').AsFloat +
                                   cdsCompSaldo.FieldByName
                                   ('VLRORCADO').AsFloat/rValCot6;
                              FieldByName('REA06').AsFloat :=
                                   FieldByName('REA06').AsFloat +
                                   cdsCompSaldo.FieldByName
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
              cdsCompSaldo.Next;
            end;
          end else begin
            cdsCompSaldoC.Close;
            sqlCompSaldoC.Prepare;
            sqlCompSaldoC.ParamByName('GRUPO').AsString := sGrupos;
            sqlCompSaldoC.ParamByName('IDPESSOA').asInteger :=
                               Sistema.idEmpresa;
            sqlCompSaldoC.ParamByName('EXERCICIO').asInteger :=
                               CmpRptCM.ParamValues[0].AsInteger;
            sqlCompSaldoC.ParamByName('PERIODOINI').asInteger :=
                               CmpRptCM.ParamValues[1].AsInteger;
            sqlCompSaldoC.ParamByName('PERIODOFIM').asInteger :=
                               CmpRptCM.ParamValues[1].AsInteger + 5;
            sqlCompSaldoC.ParamByName('CODCENTROCUSTO').AsString :=
                              Espaco(Fieldbyname('CODCENTROCUSTO').AsString,10);
            if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('CRESP').AsString :=
                                 '(C.CODCENTRORESPON LIKE ''' +
                                 Trim(CmpRptCM.ParamValues[2].AsString) +
                                 '%'') AND (C.IDPESSOA = ' +
                                 IntToStr(sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('CRESP').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[25].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('CCUSTO').AsString :=
                                 '(C.CODCENTROCUSTO LIKE ''' +
                                 Trim(CmpRptCM.ParamValues[25].AsString) +
                                 '%'') AND (C.IDEMPRESA = ' +
                                 IntToStr(sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('CCUSTO').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[26].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('ATIVPROJ').AsString :=
                                 '(C.UNIDNEGOC = ' +
                                 Trim(CmpRptCM.ParamValues[26].AsString) +
                                 ') AND (C.IDPESSOA = ' +
                                 IntToStr(sistema.idEmpresa) + ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('ATIVPROJ').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[27].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PPREV').AsString :=
                                 '(C.IDPLANOPREV = ' +
                                 Trim(CmpRptCM.ParamValues[27].AsString) +
                                 ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PPREV').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[28].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PATRO').AsString :=
                                 '(C.IDPATRO = ' +
                                 Trim(CmpRptCM.ParamValues[28].AsString) +
                                 ') AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PATRO').AsString := '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[12].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO1').AsString :=
                                 '(SUBSTR(S.IDCONTAORCAMEN,' +
                                 Trim(CmpRptCM.ParamValues[9].AsString) +
                                 ',' +
                                 Trim(CmpRptCM.ParamValues[10].AsString) +
                                 ') IN (' +
                                 Trim(CmpRptCM.ParamValues[12].AsString) +
                                 ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO1').AsString :=
                                 '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[16].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO2').AsString :=
                                 '(SUBSTR(S.IDCONTAORCAMEN,' +
                                 Trim(CmpRptCM.ParamValues[13].AsString) +
                                 ',' +
                                 Trim(CmpRptCM.ParamValues[14].AsString) +
                                 ') IN (' +
                                 Trim(CmpRptCM.ParamValues[16].AsString) +
                                 ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO2').AsString :=
                                 '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[20].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO3').AsString :=
                                 '(SUBSTR(S.IDCONTAORCAMEN,' +
                                 Trim(CmpRptCM.ParamValues[17].AsString) +
                                 ',' +
                                 Trim(CmpRptCM.ParamValues[18].AsString) +
                                 ') IN (' +
                                 Trim(CmpRptCM.ParamValues[20].AsString) +
                                 ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO3').AsString :=
                                 '(1 = 1) AND ';
            end;
            if Trim(CmpRptCM.ParamValues[24].AsString) <> '' then begin
              sqlCompSaldoC.ParamByName('PARAMETRO4').AsString :=
                                 '(SUBSTR(S.IDCONTAORCAMEN,' +
                                 Trim(CmpRptCM.ParamValues[21].AsString) +
                                 ',' +
                                 Trim(CmpRptCM.ParamValues[22].AsString) +
                                 ') IN (' +
                                 Trim(CmpRptCM.ParamValues[24].AsString) +
                                 ')) AND ';
            end else begin
              sqlCompSaldoC.ParamByName('PARAMETRO4').AsString :=
                                 '(1 = 1) AND ';
            end;
            sqlCompSaldoC.ParamByName('IDCENARIOORCAMEN').AsInteger :=
                               CmpRptCM.ParamValues[8].AsInteger;
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
                         cdsCompSaldoC.FieldByName('VLRORCADO').AsFloat/
                         rValCot1;
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
                               cdsCompSaldoC.FieldByName
                               ('VLRREALIZADO').AsFloat/rValCot4;
                          Break;
                        end else begin
                          if (x - CmpRptCM.ParamValues[1].AsInteger + 1) = 5
                             then begin
                            FieldByName('ORC05').AsFloat :=
                                 FieldByName('ORC05').AsFloat +
                                 cdsCompSaldoC.FieldByName
                                 ('VLRORCADO').AsFloat/rValCot5;
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
          FieldByName('TOTORC').AsFloat := FieldByName('ORC01').AsFloat +
                                           FieldByName('ORC02').AsFloat +
                                           FieldByName('ORC03').AsFloat +
                                           FieldByName('ORC04').AsFloat +
                                           FieldByName('ORC05').AsFloat +
                                           FieldByName('ORC06').AsFloat;
          FieldByName('TOTREA').AsFloat := FieldByName('REA01').AsFloat +
                                           FieldByName('REA02').AsFloat +
                                           FieldByName('REA03').AsFloat +
                                           FieldByName('REA04').AsFloat +
                                           FieldByName('REA05').AsFloat +
                                           FieldByName('REA06').AsFloat;
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
        end;
      end;
    end;
  end;
end;

end.
