unit rDemoLayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, ppVar, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc,
  uCmSqlParams, StdCtrls, DBTables, TXRB;

type
  TrptDemoLayout = class(TFrmCmReport)
    sqlDemoColMes: TCMSqlParams;
    dsDemoLayout: TwwDataSource;
    pplDemoLayout: TppBDEPipeline;
    rpDemoLayout: TppReport;
    ppHeaderBand22: TppHeaderBand;
    ppDetailBand21: TppDetailBand;
    ppFooterBand22: TppFooterBand;
    ppLabel196: TppLabel;
    ppLine54: TppLine;
    ppCalc42: TppSystemVariable;
    ppCalc43: TppSystemVariable;
    cdsDemoColMes: TCMClientDataSet;
    cdsDemoNormal: TCMClientDataSet;
    sqlDemoNormal: TCMSqlParams;
    sqlLayout: TCMSqlParams;
    cdsLayout: TCMClientDataSet;
    sqlReports: TCMSqlParams;
    cdsReports: TCMClientDataSet;
    MemReports: TMemo;
    sqlCalculos: TCMSqlParams;
    cdsCalculos: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FazSqlDemoColMes;
    procedure FazSqlDemoNormal;
    procedure ProcessaSomatorio(iExercicio, iPeriodo: longInt; sConta :String ;
      var rVO, rVR, rVAO, rVAR: double);
  private
    { Private declarations }
    procedure SetaDataPipeline(sNomeForm, sNomePipeline, sNomeFormConfig,
      sNomePipelineConfig: String; var Memo: TMemo);
  public
    { Public declarations }
  end;

var
  rptDemoLayout: TrptDemoLayout;

implementation

uses uSistema, uData, uModulo, uModeloRelatCM, uMensErro;
{$R *.DFM}

procedure TrptDemoLayout.FormCreate(Sender: TObject);
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
  // Cria SQL Parametro Layout
  with CmpRptCM.ParamValues[3].LookupSettings.SQL do begin
    Clear;
    Add('SELECT IDDESENHOORC, NOMELAYOUT');
    Add('FROM DESENHOORC');
    Add('WHERE (IDRELATORC = 0)');
    Add('ORDER BY NOMELAYOUT');
  end;
end;

procedure TrptDemoLayout.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
var sTipo : string;
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
    2 : begin
        // Cria SQL Parametro Layout
        with CmpRptCM.ParamValues[3].LookupSettings.SQL do begin
          Clear;
          Add('SELECT IDDESENHOORC, NOMELAYOUT');
          Add('FROM DESENHOORC');
          Add('WHERE (IDRELATORC = ' +
                             IntToStr(CmpRptCM.ParamValues[2].AsInteger) + ')');
          Add('ORDER BY NOMELAYOUT');
        end;
        end;
    3 : begin
        if Trim(CmpRptCM.ParamValues[3].AsString) <> '' then begin
           // Mostra Tipo de Layout
           with sqlLayout do begin
             Prepare;
             ParamByName('IDRELATORC').AsInteger   :=
                                              CmpRptCM.ParamValues[2].AsInteger;
             ParamByName('IDDESENHOORC').AsInteger :=
                                              CmpRptCM.ParamValues[3].AsInteger;
             Open;
           end;
           sTipo := cdsLayout.FieldByName('FLGTIPOLAYOUT').asString;
           case sTipo[1] of
             '1' : begin
                   CmpRptCM.ParamValues[4].AsString := 'Normal';
                   end;
             '2' : begin
                   CmpRptCM.ParamValues[4].AsString := 'Colunado Mensal';
                   CmpRptCM.ParamValues[1].AsString := '';
                   end;
           end;
        end;
        end;
    4 : begin
        if CmpRptCM.ParamValues[4].AsString = 'Normal' then
          CmpRptCM.ParamValues[1].Required := True
        else
          CmpRptCM.ParamValues[1].Required := False;
        end;
  end;
end;

procedure TrptDemoLayout.CrmRptCMBeforePrint(Sender: TObject);
var sDataCad : String;
begin
  inherited;
  //Faz a sql
  if CmpRptCM.ParamValues[4].AsString = 'Normal' then begin
    FazSqlDemoNormal;
    sDataCad := 'ppConsulta';
  end else begin
    if CmpRptCM.ParamValues[4].AsString = 'Colunado Mensal' then begin
      FazSqlDemoColMes;
      sDataCad := 'ppDemoColMes';
    end;
  end;
  //Seta o relatório para o layout desejado
  cdsLayout.Close;
  with sqlLayout do begin
    Prepare;
    ParamByName('IDRELATORC').AsInteger   := CmpRptCM.ParamValues[2].AsInteger;
    ParamByName('IDDESENHOORC').AsInteger := CmpRptCM.ParamValues[3].AsInteger;
    Open;
  end;
  with sqlReports do begin
    cdsReports.Close;
    Prepare;
    ParamByName('PIDREPORTS').AsInteger :=
                                   cdsLayout.FieldByName('IDREPORTS').AsInteger;
    ParamByName('PORIGEMCM').AsInteger  :=
                                   cdsLayout.FieldByName('ORIGEMCM').AsInteger;
    Open;
  end;
  MemReports.Lines.Clear;
  MemReports.Lines.Text := cdsReports.FieldByName('TEMPLATE').AsString;
  //Substitui o Pipeline do Template pelo Pipeline do Report
  SetaDataPipeline('rptDemoLayout','pplDemoLayout','frmCadLayoutOrcMT',
                   sDataCad,MemReports);
  MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmDefault);
  rpDemoLayout.Template.FileName := Sistema.TempDir + ArqCmDefault;
  rpDemoLayout.Template.LoadFromFile;
end;

procedure TrptDemoLayout.FazSqlDemoColMes;
var sInt1, sInt2, sInt3, sInt4, sEspacos,
    sMes, sFieldReal, sFieldOrc, sFieldAReal, sFieldAOrc : string;
    rValReal  : array[1..12] of double;
    rValOrc   : array[1..12] of double;
    rValAReal : array[1..12] of double;
    rValAOrc  : array[1..12] of double;
    j, i, iLinha1, iLinha2, iLinha3, iLinha4 : Integer;
begin
  dsDemoLayout.DataSet := cdsDemoColMes;
  cdsDemoColMes.Close;
  with sqlDemoColMes do begin
    Prepare;
    ParamByName('IDRELATORC').asInteger := CmpRptCM.ParamValues[2].asInteger;
    Open;
  end;
  //zera o acumulador de salto de pagina
  iLinha1 := 0; iLinha2 := 0; iLinha3 := 0; iLinha4 := 0;
  sInt1 := 'N'; sInt2 := 'N'; sInt3 := 'N'; sInt4 := 'N';
  with cdsDemoColMes do begin
    First;
    while not EOF do begin
      Edit;
      //Configura as linhas do relatório
      if sInt1 = 'E' then begin
        inc(iLinha1);
        sInt1 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'E' then begin
        sInt1 := 'E';
      end;
      FieldByName('LINHA1').asString := IntToStr(iLinha1);
      //Configura as linhas do relatório
      if sInt2 = 'F' then begin
        inc(iLinha2);
        sInt2 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'F' then begin
        sInt2 := 'F';
      end;
      FieldByName('LINHA2').asString := IntTOStr(iLinha2);
      //Configura as linhas do relatório
      if sInt3 = 'G' then begin
        inc(iLinha3);
        sInt3 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'G' then begin
        sInt3 := 'G';
      end;
      FieldByName('LINHA3').asString := IntTOStr(iLinha3);
      //Configura as linhas do relatório
      if sInt4 = 'D' then begin
        inc(iLinha4);
        sInt4 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'D' then begin
        sInt4 := 'D';
      end;
      FieldByName('LINHA4').asString := IntTOStr(iLinha4);
      for j := 1 to 12 do begin
        rValReal[j]  := 0;
        rValOrc[j]   := 0;
        rValAReal[j] := 0;
        rValAOrc[j]  := 0;
      end;
      Edit;
      for j := 1 to 12 do begin
        //Calcula o Ano Atual e o Período Atual
        if j <= CmpRptCM.ParamValues[1].asInteger then
          ProcessaSomatorio(CmpRptCM.ParamValues[0].AsInteger, j,
                            FieldByname('CodigoConta').asString, rValOrc[j],
                            rValReal[j], rValAOrc[j], rValAReal[j]);
        case j of
          1  :  sMes := '01_Janeiro';
          2  :  sMes := '02_Fevereiro';
          3  :  sMes := '03_Marco';
          4  :  sMes := '04_Abril';
          5  :  sMes := '05_Maio';
          6  :  sMes := '06_Junho';
          7  :  sMes := '07_Julho';
          8  :  sMes := '08_Agosto';
          9  :  sMes := '09_Setembro';
          10 : sMes := '10_Outubro';
          11 : sMes := '11_Novembro';
          12 : sMes := '12_Dezembro';
        end;
        sFieldReal  := 'R' + sMes;
        sFieldOrc   := 'O' + sMes;
        sFieldAReal := 'AR' + sMes;
        sFieldAOrc  := 'AO' + sMes;
        FieldByName(sFieldReal).asFloat  := rValReal[j];
        FieldByName(sFieldOrc).asFloat   := rValOrc[j];
        FieldByName(sFieldAReal).asFloat := rValAReal[j];
        FieldByName(sFieldAOrc).asFloat  := rValAOrc[j];
      end;
      FieldByName('Periodo').asString    := CmpRptCM.ParamValues[1].AsString;
      FieldByName('Exercicio').asString  := CmpRptCM.ParamValues[0].AsString;
      sEspacos := '';
      for i := 1 to ((StrToInt(FieldByName('Indentacao').asString) - 1) * 4) do
          begin
        sEspacos := sEspacos + ' ';
      end;
      FieldByName('NomeContaInd').AsString := sEspacos +
                                              FieldByName('NomeConta').AsString;
      FieldByName('SomaLinhaReal').asFloat :=
                                        FieldByName('R01_Janeiro').asFloat +
                                        FieldByName('R02_Fevereiro').asFloat +
                                        FieldByName('R03_Marco').asFloat +
                                        FieldByName('R04_Abril').asFloat +
                                        FieldByName('R05_Maio').asFloat +
                                        FieldByName('R06_Junho').asFloat +
                                        FieldByName('R07_Julho').asFloat +
                                        FieldByName('R08_Agosto').asFloat +
                                        FieldByName('R09_Setembro').asFloat +
                                        FieldByName('R10_Outubro').asFloat +
                                        FieldByName('R11_Novembro').asFloat +
                                        FieldByName('R12_Dezembro').asFloat;
      FieldByName('SomaLinhaOrc').asFloat :=
                                        FieldByName('O01_Janeiro').asFloat +
                                        FieldByName('O02_Fevereiro').asFloat +
                                        FieldByName('O03_Marco').asFloat +
                                        FieldByName('O04_Abril').asFloat +
                                        FieldByName('O05_Maio').asFloat +
                                        FieldByName('O06_Junho').asFloat +
                                        FieldByName('O07_Julho').asFloat +
                                        FieldByName('O08_Agosto').asFloat +
                                        FieldByName('O09_Setembro').asFloat +
                                        FieldByName('O10_Outubro').asFloat +
                                        FieldByName('O11_Novembro').asFloat +
                                        FieldByName('O12_Dezembro').asFloat;
      FieldByName('SomaLinhaAReal').asFloat :=
                                        FieldByName('AR01_Janeiro').asFloat +
                                        FieldByName('AR02_Fevereiro').asFloat +
                                        FieldByName('AR03_Marco').asFloat +
                                        FieldByName('AR04_Abril').asFloat +
                                        FieldByName('AR05_Maio').asFloat +
                                        FieldByName('AR06_Junho').asFloat +
                                        FieldByName('AR07_Julho').asFloat +
                                        FieldByName('AR08_Agosto').asFloat +
                                        FieldByName('AR09_Setembro').asFloat +
                                        FieldByName('AR10_Outubro').asFloat +
                                        FieldByName('AR11_Novembro').asFloat +
                                        FieldByName('AR12_Dezembro').asFloat;
      FieldByName('SomaLinhaAOrc').asFloat :=
                                        FieldByName('AO01_Janeiro').asFloat +
                                        FieldByName('AO02_Fevereiro').asFloat +
                                        FieldByName('AO03_Marco').asFloat +
                                        FieldByName('AO04_Abril').asFloat +
                                        FieldByName('AO05_Maio').asFloat +
                                        FieldByName('AO06_Junho').asFloat +
                                        FieldByName('AO07_Julho').asFloat +
                                        FieldByName('AO08_Agosto').asFloat +
                                        FieldByName('AO09_Setembro').asFloat +
                                        FieldByName('AO10_Outubro').asFloat +
                                        FieldByName('AO11_Novembro').asFloat +
                                        FieldByName('AO12_Dezembro').asFloat;
      Post;
      Next;
    end;
  end;
end;

procedure TrptDemoLayout.FazSqlDemoNormal;
var sInt1, sInt2, sInt3, sInt4, sEspacos : string;
    rValRealPEAT, rValOrcPEAT, rValRealAcumPEAT, rValOrcAcumPEAT,
    rValRealPEAN, rValOrcPEAN, rValRealAcumPEAN, rValOrcAcumPEAN,
    rValRealAEAT, rValOrcAEAT, rValRealAcumAEAT, rValOrcAcumAEAT : double;
    i, iLinha1, iLinha2, iLinha3, iLinha4 : Integer;
begin
  dsDemoLayout.DataSet := cdsDemoNormal;
  cdsDemoNormal.Close;
  with sqlDemoNormal do begin
    Prepare;
    ParamByName('IDRELATORC').asInteger := CmpRptCM.ParamValues[2].asInteger;
    Open;
  end;
  //zera o acumulador de salto de pagina
  iLinha1 := 0; iLinha2 := 0; iLinha3 := 0; iLinha4 := 0;
  sInt1 := 'N'; sInt2 := 'N'; sInt3 := 'N'; sInt4 := 'N';
  with cdsDemoNormal do begin
    First;
    while not EOF do begin
      Edit;
      //Configura as linhas do relatório
      if sInt1 = 'E' then begin
        inc(iLinha1);
        sInt1 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'E' then begin
        sInt1 := 'E';
      end;
      FieldByName('LINHA1').asString := IntTOStr(iLinha1);
      //Configura as linhas do relatório
      if sInt2 = 'F' then begin
        inc(iLinha2);
        sInt2 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'F' then begin
        sInt2 := 'F';
      end;
      FieldByName('LINHA2').asString := IntTOStr(iLinha2);
      //Configura as linhas do relatório
      if sInt3 = 'G' then begin
        inc(iLinha3);
        sInt3 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'G' then begin
        sInt3 := 'G';
      end;
      FieldByName('LINHA3').asString := IntTOStr(iLinha3);
      //Configura as linhas do relatório
      if sInt4 = 'D' then begin
        inc(iLinha4);
        sInt4 := 'N';
      end;
      if FieldByName('FLAGINTERNA1').asString = 'D' then begin
        sInt4 := 'D';
      end;
      FieldByName('LINHA4').asString := IntTOStr(iLinha4);
      rValRealPEAT     := 0;
      rValOrcPEAT      := 0;
      rValRealAcumPEAT := 0;
      rValOrcAcumPEAT  := 0;
      rValRealPEAN     := 0;
      rValRealAcumPEAN := 0;
      rValOrcPEAN      := 0;
      rValOrcAcumPEAN  := 0;
      rValRealAEAT     := 0;
      rValOrcAEAT      := 0;
      rValRealAcumAEAT := 0;
      rValOrcAcumAEAT  := 0;
      //Calcula o Ano Atual e o Período Atual
      ProcessaSomatorio(CmpRptCM.ParamValues[0].AsInteger,
                        CmpRptCM.ParamValues[1].AsInteger,
                        FieldByname('CodigoConta').asString, rValOrcPEAT,
                        rValRealPEAT, rValOrcAcumPEAT, rValRealAcumPEAT);
      //Calcula o Ano Antrerior e o Período Atual
      ProcessaSomatorio(CmpRptCM.ParamValues[0].AsInteger - 1,
                        CmpRptCM.ParamValues[1].AsInteger,
                        FieldByname('CodigoConta').asString, rValOrcPEAN,
                        rValRealPEAN, rValOrcAcumPEAN, rValRealAcumPEAN);
      //Calcula o Ano Atual e o Período Anterior
      ProcessaSomatorio(CmpRptCM.ParamValues[0].AsInteger,
                        CmpRptCM.ParamValues[1].AsInteger - 1,
                        FieldByname('CodigoConta').asString, rValOrcAEAT,
                        rValRealAEAT, rValOrcAcumAEAT, rValRealAcumAEAT);
      Edit;
      FieldByName('SaldoOrcPerEAT').AsFloat    := rValOrcPEAT;
      FieldByName('SaldoOrcAcumEAT').AsFloat   := rValOrcAcumPEAT;
      FieldByName('SaldoRealPerEAT').AsFloat   := rValRealPEAT;
      FieldByName('SaldoRealAcumEAT').AsFloat  := rValRealAcumPEAT;
      FieldByName('SaldoRealPerEAN').AsFloat   := rValRealPEAN;
      FieldByName('SaldoRealAcumEAN').AsFloat  := rValRealAcumPEAN;
      FieldByName('SaldoRealAEAT').AsFloat     := rValRealAEAT;
      FieldByName('SaldoRealAcumAEAT').AsFloat := rValRealAcumAEAT;
      FieldByName('SaldoOrcAEAT').AsFloat      := rValOrcAEAT;
      FieldByName('SaldoOrcAcumAEAT').AsFloat  := rValOrcAcumAEAT;
      FieldByName('Periodo').asString    := CmpRptCM.ParamValues[1].AsString;
      FieldByName('Exercicio').asString  := CmpRptCM.ParamValues[0].AsString;
      sEspacos := '';
      for i := 1 to ((StrToInt(FieldByName('Indentacao').asString) - 1) * 4) do
          begin
        sEspacos := sEspacos + ' ';
      end;
      FieldByName('NomeContaInd').AsString := sEspacos +
                                              FieldByName('NomeConta').AsString;
      if not FieldByName('CodigoConta100').isNull then begin
        rValRealPEAT     := 0;
        rValOrcPEAT      := 0;
        rValRealAcumPEAT := 0;
        rValOrcAcumPEAT  := 0;
        rValRealPEAN     := 0;
        rValRealAcumPEAN := 0;
        rValOrcPEAN      := 0;
        rValOrcAcumPEAN  := 0;
        rValRealAEAT     := 0;
        rValOrcAEAT      := 0;
        rValRealAcumAEAT := 0;
        rValOrcAcumAEAT  := 0;
        //Calcula o Ano Atual e o Período Atual
        ProcessaSomatorio(CmpRptCM.ParamValues[0].AsInteger,
                          CmpRptCM.ParamValues[1].AsInteger,
                          FieldByname('CodigoConta100').asString, rValOrcPEAT,
                          rValRealPEAT, rValOrcAcumPEAT, rValRealAcumPEAT);
        //Calcula o Ano Antrerior e o Período Atual
        ProcessaSomatorio(CmpRptCM.ParamValues[0].AsInteger - 1,
                          CmpRptCM.ParamValues[1].AsInteger,
                          FieldByname('CodigoConta100').asString, rValOrcPEAN,
                          rValRealPEAN, rValOrcAcumPEAN, rValRealAcumPEAN);
        //Calcula o Ano Atual e o Período Anterior
        ProcessaSomatorio(CmpRptCM.ParamValues[0].AsInteger,
                          CmpRptCM.ParamValues[1].AsInteger - 1,
                          FieldByname('CodigoConta100').asString, rValOrcAEAT,
                          rValRealAEAT, rValOrcAcumAEAT, rValRealAcumAEAT);
        if rValOrcPEAT <> 0 then
          FieldByName('AV_OrcPerEAT').AsFloat :=
                          FieldByName('SaldoOrcPerEAT').AsFloat/rValOrcPEAT*100;
        if rValOrcAcumPEAT <> 0 then
          FieldByName('AV_OrcAcumEAT').AsFloat :=
                     FieldByName('SaldoOrcAcumEAT').AsFloat/rValOrcAcumPEAT*100;
        if rValRealPEAT <> 0 then
          FieldByName('AV_RealPerEAT').AsFloat :=
                        FieldByName('SaldoRealPerEAT').AsFloat/rValRealPEAT*100;
        if rValRealAcumPEAT <> 0 then
          FieldByName('AV_RealAcumEAT').AsFloat :=
                   FieldByName('SaldoRealAcumEAT').AsFloat/rValRealAcumPEAT*100;
        if rValRealPEAN <> 0 then
          FieldByName('AV_RealPerEAN').AsFloat :=
                        FieldByName('SaldoRealPerEAN').AsFloat/rValRealPEAN*100;
        if rValRealAcumPEAN <> 0 then
          FieldByName('AV_RealAcumEAN').AsFloat :=
                   FieldByName('SaldoRealAcumEAN').AsFloat/rValRealAcumPEAN*100;
        if rValOrcAEAT <> 0 then
          FieldByName('AV_OrcAEAT').AsFloat :=
                            FieldByName('SaldoOrcAEAT').AsFloat/rValOrcAEAT*100;
        if rValOrcAcumAEAT <> 0 then
          FieldByName('AV_OrcAcumAEAT').AsFloat :=
                    FieldByName('SaldoOrcAcumAEAT').AsFloat/rValOrcAcumAEAT*100;
        if rValRealAEAT <> 0 then
          FieldByName('AV_RealAEAT').AsFloat :=
                          FieldByName('SaldoRealAEAT').AsFloat/rValRealAEAT*100;
        if rValRealAcumAEAT <> 0 then
          FieldByName('AV_RealAcumAEAT').AsFloat :=
                  FieldByName('SaldoRealAcumAEAT').AsFloat/rValRealAcumAEAT*100;
      end;
      //Calula as diferencas
      FieldByName('DifOrcRealPerEAT').AsFloat :=
                                     FieldByName('SaldoRealPerEAT').AsFloat -
                                     FieldByName('SaldoOrcPerEAT').AsFloat;
      FieldByName('DifOrcRealAcumEAT').AsFloat :=
                                     FieldByName('SaldoRealAcumEAT').AsFloat -
                                     FieldByName('SaldoOrcAcumEAT').AsFloat;
      FieldByName('DifOrcRealAEAT').AsFloat :=
                                     FieldByName('SaldoRealAEAT').AsFloat -
                                     FieldByName('SaldoOrcAEAT').AsFloat;
      FieldByName('DifOrcReaAcumAEAT').AsFloat :=
                                     FieldByName('SaldoRealAcumAEAT').AsFloat -
                                     FieldByName('SaldoOrcAcumAEAT').AsFloat;
      //Calula as Análises Horizontais
      if FieldByName('SaldoOrcPerEAT').AsFloat <> 0 then begin
        FieldByName('AH_OrcRealPerEAT').AsFloat :=
                              ((FieldByName('SaldoRealPerEAT').AsFloat * 100) /
                              FieldByName('SaldoOrcPerEAT').AsFloat) - 100;
      end else begin
        FieldByName('AH_OrcRealPerEAT').AsFloat  := 0;
      end;
      if FieldByName('SaldoOrcAcumEAT').AsFloat <> 0 then begin
        FieldByName('AH_OrcRealAcumEAT').AsFloat :=
                             ((FieldByName('SaldoRealAcumEAT').AsFloat * 100) /
                             FieldByName('SaldoOrcAcumEAT').AsFloat) - 100;
      end else begin
        FieldByName('AH_OrcRealAcumEAT').AsFloat := 0;
      end;
      if FieldByName('SaldoRealPerEAN').AsFloat <> 0 then begin
        FieldByName('AH_ExAtuAntPer').AsFloat :=
                              ((FieldByName('SaldoRealPerEAT').AsFloat * 100) /
                              FieldByName('SaldoRealPerEAN').AsFloat) - 100;
      end else begin
        FieldByName('AH_ExAtuAntPer').AsFloat   := 0;
      end;
      if FieldByName('SaldoRealAEAT').AsFloat <> 0 then begin
        FieldByName('AH_PerAtuAntEAT').AsFloat :=
                              ((FieldByName('SaldoRealPerEAT').AsFloat * 100) /
                              FieldByName('SaldoRealAEAT').AsFloat) - 100;
      end else begin
        FieldByName('AH_PerAtuAntEAT').AsFloat   :=  0;
      end;
      if FieldByName('SaldoRealAcumEAN').AsFloat <> 0 then begin
        FieldByName('AH_ExAtuAntAcum').AsFloat :=
                             ((FieldByName('SaldoRealAcumEAT').AsFloat * 100) /
                             FieldByName('SaldoRealAcumEAN').AsFloat) - 100;
      end else begin
        FieldByName('AH_ExAtuAntAcum').AsFloat   := 0;
      end;
      Post;
      Next;
    end;
    if not CmpRptCM.ParamValues[5].AsBoolean then begin
      First;
      while not EOF do begin
        if (FieldByName('SaldoOrcPerEAT').asFloat +
           FieldByName('SaldoOrcAcumEAT').asFloat +
           FieldByName('SaldoRealPerEAT').asFloat +
           FieldByName('SaldoRealAcumEAT').asFloat +
           FieldByName('SaldoRealPerEAN').asFloat +
           FieldByName('SaldoRealAcumEAN').asFloat +
           FieldByName('SaldoRealAEAT').asFloat +
           FieldByName('SaldoRealAcumAEAT').asFloat +
           FieldByName('SaldoOrcAEAT').asFloat +
           FieldByName('SaldoOrcAcumAEAT').asFloat) = 0 then begin
          Delete;
        end;
      end;
    end;
  end;
end;

procedure TrptDemoLayout.ProcessaSomatorio(iExercicio, iPeriodo: longInt;
  sConta :String ; var rVO, rVR, rVAO, rVAR: double);
begin
  rVO  := 0;
  rVR  := 0;
  rVAO := 0;
  rVAR := 0;
  with sqlCalculos do begin
    cdsCalculos.Close;
    SQL.Clear;
    SQL.Add('SELECT VLRORCADO, VLRREALIZADO                        ');
    SQL.Add('FROM                                                  ');
    SQL.Add('   SALDOORCADOANT                                     ');
    SQL.Add('WHERE                                                 ');
    SQL.Add('   (EXERCICIO = :EXERCICIO) AND                       ');
    SQL.Add('   (IDPESSOA = :IDPESSOA) AND                         ');
    SQL.Add('   (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND             ');
    SQL.Add('   (IDPLANOORCAMEN = :IDPLANOORCAMEN)                 ');
    Prepare;
    ParamByName('EXERCICIO').asInteger      := iExercicio;
    ParamByName('IDPESSOA').asInteger       := sistema.idEmpresa;
    ParamByName('IDCONTAORCAMEN').asString  := sConta;
    ParamByName('IDPLANOORCAMEN').asInteger := modulo.iPlanoOrc;
    Open;
  end;
  if not cdsCalculos.isEmpty then begin
    rVAR := rVAR + cdsCalculos.FieldByName('VLRREALIZADO').AsFloat;
    rVAO := rVAO + cdsCalculos.FieldByName('VLRORCADO').AsFloat;
  end;
  with sqlCalculos do begin
    cdsCalculos.Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,                   ');
    SQL.Add('       SUM(VLRREALIZADO) AS VLRREALIZADO, PERIODO     ');
    SQL.Add('FROM                                                  ');
    SQL.Add('   SALDOORCADO                                        ');
    SQL.Add('WHERE                                                 ');
    SQL.Add('   (EXERCICIO = :EXERCICIO) AND                       ');
    SQL.Add('   (PERIODO <= :PERIODO) AND                          ');
    SQL.Add('   (IDPESSOA = :IDPESSOA) AND                         ');
    SQL.Add('   (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND             ');
    SQL.Add('   (IDPLANOORCAMEN = :IDPLANOORCAMEN)                 ');
    SQL.Add('GROUP BY PERIODO                                      ');
    Prepare;
    ParamByName('EXERCICIO').asInteger      := iExercicio;
    ParamByName('PERIODO').asInteger        := iPeriodo;
    ParamByName('IDPESSOA').asInteger       := sistema.idEmpresa;
    ParamByName('IDCONTAORCAMEN').asString  := sConta;
    ParamByName('IDPLANOORCAMEN').asInteger := modulo.iPlanoOrc;
    Open;
  end;
  if not cdsCalculos.isEmpty then begin
    cdsCalculos.First;
    while not cdsCalculos.Eof do begin
      if cdsCalculos.FieldByName('PERIODO').asInteger = iPeriodo then begin
        rVR  := rVR  + cdsCalculos.FieldByName('VLRREALIZADO').AsFloat;
        rVO  := rVO  + cdsCalculos.FieldByName('VLRORCADO').AsFloat;
      end;
      rVAR := rVAR + cdsCalculos.FieldByName('VLRREALIZADO').AsFloat;
      rVAO := rVAO + cdsCalculos.FieldByName('VLRORCADO').AsFloat;
      cdsCalculos.Next;
    end;
  end;
end;

procedure TrptDemoLayout.SetaDataPipeline(sNomeForm, sNomePipeline,
  sNomeFormConfig, sNomePipelineConfig: String; var Memo: TMemo);
var iSelPos: Integer;
begin
  iSelPos := Pos(sNomeFormConfig + '.' + sNomePipelineConfig, Memo.Lines.Text);
  if iSelPos = 0 then begin
    iSelPos := Pos(sNomePipelineConfig, Memo.Lines.Text);
    while iSelPos > 0 do begin
      Memo.SelStart := iSelPos - 1;
      Memo.SelLength := Length(sNomePipelineConfig);
      Memo.SelText := sNomePipeline;
      iSelPos := Pos(sNomePipelineConfig, Memo.Lines.Text);
    end;
  end else begin
    while iSelPos > 0 do begin
      Memo.SelStart := iSelPos - 1;
      Memo.SelLength := Length(sNomeFormConfig + '.' + sNomePipelineConfig);
      Memo.SelText := sNomeForm + '.' + sNomePipeline;
      iSelPos := Pos(sNomeFormConfig + '.' + sNomePipelineConfig,
                     Memo.Lines.Text);
    end;
  end;
end;

end.
