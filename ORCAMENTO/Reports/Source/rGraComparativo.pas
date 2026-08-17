// Marcus Oliveira P.24442 09/10/2007
// Andre Tavares - pendência 20264 - 01/11/2005 - inclui os parâmetros idplanoprev, idpatro, codcentrocusto
// Augusto - pendência 24442 - 03/11/2007 - Ajuste nas pesquisa de Grupo de Orçamento Sintético
unit rGraComparativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, uCmRptManager, TXComp, CmParamReport, ppVar,
  ppBands, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DBChart, ppChrtDB,
  ppChrt, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, MontaSelect, TXRB,
  uCtrlTransacoesPorGrupo, uCtrlPadroes;

type
  TrptGraComparativo = class(TFrmCmReport)
    sqlGraComparativo: TCMSqlParams;
    cdsGraComparativo: TCMClientDataSet;
    dsGraComparativo: TwwDataSource;
    pplGraComparativo: TppBDEPipeline;
    rpGraComparativo: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine6: TppLine;
    ppLabel11: TppLabel;
    rptGraComparativoDBTeeChart2: TppDBTeeChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine8: TppLine;
    ppLabel31: TppLabel;
    ppCalc5: TppSystemVariable;
    rptGraComparativoCalc1: TppSystemVariable;
    cdsGraComparativoVLRORCADO: TCurrencyField;
    cdsGraComparativoVLRREALIZADO: TCurrencyField;
    cdsGraComparativoPERIODO: TFloatField;
    lblFiltro: TppLabel;
    ppDBImage1: TppDBImage; 
    pplCdsImagem: TppBDEPipeline;
    dsImagem: TDataSource;
    CdsImagem: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlGraComparativoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    CtrlTransacoesPorGrupo : TCtrlTransacoesPorGrupo;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptGraComparativo: TrptGraComparativo;

implementation

uses uSistema, uModulo, uData;

{$R *.DFM}

procedure TrptGraComparativo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  sqlGraComparativo.SQL.Clear;
  sqlGraComparativo.SQL.Add( ' SELECT SUM(S.VLRORCADO) AS VLRORCADO, ');
  sqlGraComparativo.SQL.Add( '        SUM(S.VLRREALIZADO) AS VLRREALIZADO, ');
  sqlGraComparativo.SQL.Add( '        S.PERIODO ');
  sqlGraComparativo.SQL.Add( ' FROM SALDOORCADO S, CONTASORCAMEN C ');

  if trim(CmpRptCM.ParamValues[8].AsString) <> '' then
     sqlGraComparativo.SQL.Add( ' , GRUPOORCAMEN GO       ');

  sqlGraComparativo.SQL.Add( ' WHERE S.IDCONTAORCAMEN = C.IDCONTAORCAMEN ');
  sqlGraComparativo.SQL.Add( '       AND S.EXERCICIO = '+ CmpRptCM.ParamValues[0].AsString);
  sqlGraComparativo.SQL.Add( '       AND S.IDPESSOA =  '+ intToStr(sistema.IdEmpresa));
  sqlGraComparativo.SQL.Add( '       AND S.PERIODO BETWEEN '+ CmpRptCM.ParamValues[1].AsString +' AND '+ CmpRptCM.ParamValues[2].AsString);
  if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
    sqlGraComparativo.SQL.Add( '       AND S.IDCONTAORCAMEN = '+ quotedStr(CmpRptCM.ParamValues[3].AsString));
  if trim(CmpRptCM.ParamValues[6].AsString) <> '' then
    sqlGraComparativo.SQL.Add( '       AND C.IDPLANOPREV = '+ CmpRptCM.ParamValues[6].AsString);
  if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
    sqlGraComparativo.SQL.Add( '       AND C.IDPATRO = '+ CmpRptCM.ParamValues[5].AsString);
  if trim(CmpRptCM.ParamValues[7].AsString) <> '' then
    sqlGraComparativo.SQL.Add( '       AND C.CODCENTROCUSTO =  '+ CmpRptCM.ParamValues[7].AsString);

  if trim(CmpRptCM.ParamValues[8].AsString) <> '' then
  begin

    { Caso tenha sido selecionada um grupo sintético, filtrar todos os grupos  }
    { que possuam CODGRUPOORC "abaixo" do selecionado.                         }
    { Ex.: Caso selecionado CODGRUPOORC = "04" então listar todos "04...."     }
    If ( CmpRptCM.ParamValues[10].AsString = 'S' ) Then Begin

      sqlGraComparativo.SQL.Add( ' AND SUBSTR( GO.CODGRUPOORC, 1, '+
                                 IntToStr( Length( CmpRptCM.ParamValues[11].AsString ) ) +' ) =  '+ QuotedStr( CmpRptCM.ParamValues[11].AsString) ) ;

    End Else Begin

      sqlGraComparativo.SQL.Add( ' AND GO.IDGRUPOORCAMEN = '+ CmpRptCM.ParamValues[8].AsString );

    End;
    {                                                                          }


    sqlGraComparativo.SQL.Add( ' AND GO.IDPLANOORCAMEN = C.IDPLANOORCAMEN ' );
    sqlGraComparativo.SQL.Add( ' AND GO.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN ' );
  end;

  sqlGraComparativo.SQL.Add( ' GROUP BY S.PERIODO ');
  sqlGraComparativo.Prepare;
  sqlGraComparativo.Open;

  lblFiltro.Caption := CmpRptCM.ParamValues[9].AsString;

end;

procedure TrptGraComparativo.sqlGraComparativoFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'CONTA') then
    sNewValue := sOldValue;
end;

procedure TrptGraComparativo.FormCreate(Sender: TObject);
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
end;

procedure TrptGraComparativo.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
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
end;

end.

