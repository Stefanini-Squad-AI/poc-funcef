{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidad               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit rHistoricoPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RRelatWeb, uCmRptManager, TXComp, CmParamReport, DBClient, Provider,
  ADODB, Db, DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  Wwdatsrc, uSistema, FCmReport, uCMClientDataSet, uCmSqlParams, TXRB;

type
  TrptHistoricoPadrao = class(TFrmCmReport)
    dsHist: TwwDataSource;
    pplHist: TppBDEPipeline;
    pplHistppField1: TppField;
    pplHistppField2: TppField;
    rptHist: TppReport;
    ppHeaderBand8: TppHeaderBand;
    pplblSistema: TppLabel;
    ppLine21: TppLine;
    pplblEmpresa: TppLabel;
    ppLabel35: TppLabel;
    ppLine22: TppLine;
    ppLabel36: TppLabel;
    ppLblTituloHist2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine23: TppLine;
    LblSistema1: TppLabel;
    rptHistLabel1: TppLabel;
    lblContHist: TppLabel;
    ppCalc16: TppSystemVariable;
    lblCalcHist: TppSystemVariable;
    sqlHist: TCMSqlParams;
    cdsHist: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppFooterBand8BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iPagIni: Integer;
  public
    { Public declarations }
  end;

implementation

Uses uCtrlPadroes;

{$R *.DFM}

procedure TrptHistoricoPadrao.CrmRptCMBeforePrint(Sender: TObject);
var sTitulo : String;
begin
  inherited;
  sTitulo := '';
  if trim(CmpRptCm.ParamValues[0].AsString) <> '' then
     sTitulo := sTitulo +  '     Histórico Inicial : ' + CmpRptCm.ParamValues[0].AsString;
  if trim(CmpRptCm.ParamValues[1].AsString) <> '' then
     sTitulo := sTitulo +  '     Histórico Final : ' + CmpRptCm.ParamValues[1].AsString;

  pplblTituloHist2.caption := sTitulo;
  iPagIni := CmpRptCm.ParamValues[3].AsInteger;


    with sqlHist do begin
      SQL.Clear;
      SQL.Add('SELECT                                           ');
      SQL.Add('   HITCODHIST, HITDESCR1                         ');
      SQL.Add('FROM                                             ');
      SQL.Add('   HISTOPADRAO                                   ');
      SQL.Add('WHERE                                            ');
      SQL.Add('    (IDPESSOA =:PESSOA) AND                      ');
      SQL.Add('    (RTRIM(HITCODHIST) >= RTRIM(:HISTINI)) AND   ');
      SQL.Add('    (RTRIM(HITCODHIST) <= RTRIM(:HISTFIM))       ');
      SQL.Add('ORDER BY                                         ');
      if CmpRptCM.ParamValues[2].AsInteger = 0 then begin
         SQL.Add('  HITCODHIST                                  ');
      end else begin
         SQL.Add('  HITDESCR1                                   ');
      end;

      Prepare;
      ParamByName('PESSOA').asFloat := CrmRptCM.IdEmpresa;

      if trim(CmpRptCM.ParamValues[0].AsString) <> '' then begin
         ParamByName('HISTINI').asString  := CmpRptCM.ParamValues[0].AsString;
      end else begin
         ParamByName('HISTINI').asString  := '0';
      end;

      if trim(CmpRptCM.ParamValues[1].AsString) <> '' then begin
         ParamByName('HISTFIM').asString := CmpRptCM.ParamValues[1].AsString;
      end else begin
         ParamByName('HISTFIM').asString := 'ZZZZ';
      end;

      Open;

   end;

end;

procedure TrptHistoricoPadrao.ppFooterBand8BeforePrint(Sender: TObject);
begin
  inherited;
   lblContHist.Caption := IntToStr((iPagIni + StrToInt(lblCalcHist.text)) - 1);
end;

procedure TrptHistoricoPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  iPagIni := 1; 
end;

end.
