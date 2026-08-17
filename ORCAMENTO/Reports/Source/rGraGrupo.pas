{=========================================================================================
 Autor     : Marcus Oliveira
 Pendência : 20394
 Data      : 03/08/2007
 Descrição : Criado os filtros do Plano, Patro e C.Custo
=========================================================================================}

unit rGraGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, DBChart, ppChrtDB, ppChrt,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  uCmSqlParams, TXRB, uCtrlTransacoesPorGrupo, uCtrlpadroes, ppStrtch,
  ppMemo, uMensErro;

type
  TrptGraGrupo = class(TFrmCmReport)
    sqlGraGrupo: TCMSqlParams;
    cdsGraGrupo: TCMClientDataSet;
    dsGraGrupo: TwwDataSource;
    pplGraGrupo: TppBDEPipeline;
    rpGraGrupo: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel104: TppLabel;
    ppLine28: TppLine;
    ppDBTeeChart2: TppDBTeeChart;
    PieSeries1: TPieSeries;
    ppDetailBand11: TppDetailBand;
    ppFooterBand11: TppFooterBand;
    ppLine29: TppLine;
    ppLabel108: TppLabel;
    ppCalc20: TppSystemVariable;
    ppCalc21: TppSystemVariable;
    cdsGraGrupoNOMEGRUPOORCAMEN: TStringField;
    cdsGraGrupoSOMA: TCurrencyField;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    dsImagem: TDataSource;
    pplCdsImagem: TppBDEPipeline;
    CdsImagem: TCMClientDataSet;
    mParametros: TppMemo;
    sqlVerificaPeriodo: TCMSqlParams;
    cdsVerificaPeriodo: TCMClientDataSet;
    procedure sqlGraGrupoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo ;

  public
    { Public declarations }
  end;

var
  rptGraGrupo: TrptGraGrupo;

implementation

uses uSistema, uData;

{$R *.DFM}

procedure TrptGraGrupo.sqlGraGrupoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'SALDO') or (sParamName = 'IDPATRO') or
     (sParamName = 'IDPLANO') or (sParamName = 'CENTCUST') then

    sNewValue := sOldValue;

end;

procedure TrptGraGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);

  CdsImagem.Data := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);


  // Cria SQL Parametro Exercício
  with CmpRptCM.ParamValues[0].LookupSettings.SQL do begin
    Clear;
    Add('SELECT DISTINCT EXERCICIO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE IDPESSOA = ' + IntToStr(sistema.idEmpresa));
    Add('ORDER BY EXERCICIO');
  end;

{ início - pendência 20394 - 31/03/2008

  // Cria SQL Parametro Período Inicial
  with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;
  // Cria SQL Parametro Período Final
  with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PERIODO, NOMEPERIODO');
    Add('FROM PERIODOORCAMEN');
    Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
    Add('      (EXERCICIO = ' + IntToStr(Year(Date)) + ') ');
    Add('ORDER BY PERIODO');
  end;

}

//fim - pendência 20394 - 31/03/2008

  // Cria SQL Parametro Plano
  with CmpRptCM.ParamValues[3].LookupSettings.SQL do begin
    Clear;
    Add('SELECT NOME, IDPLANOPREV   ' );
    Add('FROM PLANPREVCONTABIL      ' );
    Add('WHERE ATIVO = ''S''        ' );
    Add('ORDER BY NOME              ' );

  end;

  // Cria SQL Parametro Patro
  with CmpRptCM.ParamValues[4].LookupSettings.SQL do begin
    Clear;
    Add('SELECT PT.IDPESSOA, P.NOME     ' );
    Add('FROM PATRO PT, PESSOA P        ' );
    Add('WHERE PT.IDPESSOA = P.IDPESSOA ' );
    Add('ORDER BY P.NOME                ' );

  end;

  // Cria SQL Parametro Centro de Custo
  with CmpRptCM.ParamValues[5].LookupSettings.SQL do begin
    Clear;
    Add('SELECT CODCENTROCUSTO, NOME');
    Add('FROM CENTCUST');
    Add('WHERE (IDEMPRESA = ' + IntToStr(sistema.idEmpresa) + ') ');
    Add('AND (ATIVO = ''S'') ');
    Add('ORDER BY NOME');
  end;


end;

procedure TrptGraGrupo.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  { início - pendência 20394 - 31/03/2008 - este evento aé funciona, mas não temos como reexecutar os sqls abaixo

  if Index = 0 then begin
    // Cria SQL Parametro Período Inicial
    with CmpRptCM.ParamValues[1].LookupSettings.SQL do begin
      Clear;
      Add('SELECT PERIODO, NOMEPERIODO');
      Add('FROM PERIODOORCAMEN');
      Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
      Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
      Add('ORDER BY PERIODO');
    end;
    // Cria SQL Parametro Período Final
    with CmpRptCM.ParamValues[2].LookupSettings.SQL do begin
      Clear;
      Add('SELECT PERIODO, NOMEPERIODO');
      Add('FROM PERIODOORCAMEN');
      Add('WHERE (IDPESSOA = ' + IntToStr(sistema.idEmpresa) + ') AND ');
      Add('(EXERCICIO = ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ') ');
      Add('ORDER BY PERIODO');
    end;
  end;
  }
end;

Procedure TrptGraGrupo.CrmRptCMBeforePrint(Sender: TObject);
var
sMontaHist : String;

Begin
  //pendência 20394 - 31/03/2008
  if CmpRptCM.ParamValues[1].AsInteger > 0 then
  begin
    cdsVerificaPeriodo.Close;
    sqlVerificaPeriodo.Prepare;
    sqlVerificaPeriodo.paramByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
    sqlVerificaPeriodo.paramByName('IDPESSOA').asInteger  := sistema.idEmpresa;
    sqlVerificaPeriodo.paramByName('PERIODO').asInteger   := CmpRptCM.ParamValues[1].AsInteger;
    sqlVerificaPeriodo.Open;
    if cdsVerificaPeriodo.IsEmpty then
    begin
      MsgDlg('O período inicial '+ CmpRptCM.ParamValues[1].asString +' não pertence ao Exercício '+ CmpRptCM.ParamValues[0].asString, 'Erro', mtError, [mbOK], 0);
      exit;
    end;
  end;
  if CmpRptCM.ParamValues[1].asInteger = 0 then
    CmpRptCM.ParamValues[1].asString := '';

  //pendência 20394 - 31/03/2008
  if CmpRptCM.ParamValues[2].AsInteger > 0 then
  begin
    cdsVerificaPeriodo.Close;
    sqlVerificaPeriodo.Prepare;
    sqlVerificaPeriodo.paramByName('EXERCICIO').asInteger := CmpRptCM.ParamValues[0].AsInteger;
    sqlVerificaPeriodo.paramByName('IDPESSOA').asInteger  := sistema.idEmpresa;
    sqlVerificaPeriodo.paramByName('PERIODO').asInteger   := CmpRptCM.ParamValues[2].AsInteger;
    sqlVerificaPeriodo.Open;
    if cdsVerificaPeriodo.IsEmpty then
    begin
      MsgDlg('O período final '+ CmpRptCM.ParamValues[2].asString +' não pertence a nenhum Exercício '+ CmpRptCM.ParamValues[0].asString, 'Erro', mtError, [mbOK], 0);
      exit;
    end;
  end;
  if CmpRptCM.ParamValues[2].asInteger = 0 then
    CmpRptCM.ParamValues[2].asString := '';


  //If ( CmpRptCM.ParamValues[0].AsString <> '' ) And
  //   ( CmpRptCM.ParamValues[1].AsString <> '' ) And
  //   ( CmpRptCM.ParamValues[2].AsString <> '' ) Then
  //   Begin

    With sqlGraGrupo Do Begin
      Prepare;
      ParamByName('EXERCICIO').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
      ParamByName('PERIODOINI').AsInteger := CmpRptCM.ParamValues[1].AsInteger;
      ParamByName('PERIODOFIM').AsInteger := CmpRptCM.ParamValues[2].AsInteger;
      ParamByName('IDPESSOA').AsInteger := sistema.IdEmpresa;

    if Trim( CmpRptCM.ParamValues[3].AsString ) <> '' then
      ParamByName('IDPLANO').AsString := 'AND (C.IDPLANOPREV = ' + CmpRptCM.ParamValues[3].AsString + ')'
      else
      ParamByName('IDPLANO').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[4].AsString ) <> '' then
      ParamByName('IDPATRO').AsString := 'AND (C.IDPATRO = ' + CmpRptCM.ParamValues[4].AsString + ')'
      else
      ParamByName('IDPATRO').AsString := 'AND (1 = 1)';

    if Trim( CmpRptCM.ParamValues[5].AsString ) <> '' then
      ParamByName('CENTCUST').AsString := 'AND (C.CODCENTROCUSTO = ' + QuotedStr( CmpRptCM.ParamValues[5].AsString ) + ')'
      else
      ParamByName('CENTCUST').AsString := 'AND (1 = 1)';

    //Recebe o Periodo Inicial, final e o ano
    sMontaHist := 'Período de ' + CmpRptCM.ParamValues[1].DispalyText + ' a ' + CmpRptCM.ParamValues[2].DispalyText + ' de ' + CmpRptCM.ParamValues[0].AsString ;

    if Trim(CmpRptCM.ParamValues[3].AsString) <> '' then
       sMontaHist := sMontaHist + ' Plano: ' + CmpRptCM.ParamValues[3].DispalyText;

    if Trim(CmpRptCM.ParamValues[4].AsString) <> '' then
       sMontaHist := sMontaHist + ' Patro: ' + CmpRptCM.ParamValues[4].DispalyText;

    if Trim(CmpRptCM.ParamValues[5].AsString) <> '' then
       sMontaHist := sMontaHist + ' Centro de Custo: ' + CmpRptCM.ParamValues[5].DispalyText;

    //Recebe Distribuição de Saldo o RadioGroup
    sMontaHist := sMontaHist + ' Distribuição do Saldo: ' + CmpRptCM.ParamValues[6].RadioGroupSettings.Items.Strings[strtoint(CmpRptCM.ParamValues[6].AsString)] ;
    mParametros.Lines.Add(sMontaHist);

      Case CmpRptCM.ParamValues[6].AsInteger Of
        0 : ParamByName('SALDO').AsString := 'SUM(S.VLRORCADO) AS SOMA ';
        1 : ParamByName('SALDO').AsString := 'SUM(S.VLRREALIZADO) AS SOMA ';
        2 : ParamByName('SALDO').AsString := 'SUM(S.VLRRESERVADO) AS SOMA ';
        3 : ParamByName('SALDO').AsString := 'SUM(S.VLRCOMPROMETIDO) AS SOMA ';
      End;
      Open;
    End;
  //End;
End;

procedure TrptGraGrupo.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo.free;
end;

end.
