{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidad               }
{                                                       }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit RPeriodos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, RRelatWeb, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, 
  DBClient, Provider, ADODB, mconnect, uSistema, uCmSqlParams,
  uCMClientDataSet, TXRB;

type
  TRptPeriodos = class(TFrmCmReport)
    dsPeriodo: TwwDataSource;
    pplPeriodo: TppBDEPipeline;
    rptPeriodo: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel37: TppLabel;
    ppLine24: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLine25: TppLine;
    ppLabel41: TppLabel;
    ppLblTituloPeriodo2: TppLabel;
    rptPeriodoLabel1: TppLabel;
    rptPeriodoLabel2: TppLabel;
    rptPeriodoLabel3: TppLabel;
    rptPeriodoLabel4: TppLabel;
    rptPeriodoLabel5: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    rptPeriodoDBText1: TppDBText;
    rptPeriodoDBText2: TppDBText;
    rptPeriodoDBText3: TppDBText;
    rptPeriodoDBText4: TppDBText;
    rptPeriodoDBText5: TppDBText;
    rptPeriodoLabel6: TppLabel;
    ppFooterBand9: TppFooterBand;
    ppLine26: TppLine;
    ppLabel43: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    cdsPeriodo: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

Uses uCtrlPadroes;

{$R *.DFM}

procedure TRptPeriodos.CrmRptCMBeforePrint(Sender: TObject);
Var
  sTitulo : string;
begin
  inherited;

  sTitulo := '';
  if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
    sTitulo := sTitulo + '     Exercício Inicial : ' + CmpRptCM.ParamValues[0].AsString;

  if trim(CmpRptCM.ParamValues[1].AsString) <> '' then
    sTitulo := sTitulo + '     Exercício Final : ' + CmpRptCM.ParamValues[1].AsString;

  pplblTituloPeriodo2.caption := sTitulo;

   with sqlPeriodo do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT                                           ');
      SQL.Add('   PEREXERCICIO, PERNUMERO, PERNOME,             ');
      SQL.Add('   PERDATINI, PERDATFIM, PERBLOQUE, PERBLOINT    ');
      SQL.Add('FROM                                             ');
      SQL.Add('   PERIODO                                       ');
      SQL.Add('WHERE                                            ');
      SQL.Add('    (IDPESSOA =:PESSOA) AND                      ');
      SQL.Add('    ((PEREXERCICIO >=:EXINI) AND                 ');
      SQL.Add('    (PEREXERCICIO <=:EXFIM))                     ');
      SQL.Add('ORDER BY                                         ');
      SQL.Add('  PEREXERCICIO, PERNUMERO                        ');

      Prepare;
      ParamByName('PESSOA').asFloat := CrmRptCM.IdEmpresa;

      if trim(CmpRptCM.ParamValues[0].asString) <> '' then begin
         ParamByName('EXINI').asInteger := StrToInt(CmpRptCM.ParamValues[0].asString);
      end else begin
         ParamByName('EXINI').asInteger := 0;
      end;

      if trim(CmpRptCM.ParamValues[1].asString) <> '' then begin
         ParamByName('EXFIM').asInteger := StrToInt(CmpRptCM.ParamValues[1].asString);
      end else begin
         ParamByName('EXFIM').asInteger := 9999;
      end;

      Open;

   end;
end;

procedure TRptPeriodos.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;

  CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

  CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';


end;

end.
