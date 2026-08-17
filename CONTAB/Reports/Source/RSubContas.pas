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

unit RSubContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, RRelatWeb, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, 
  DBClient, Provider, ADODB, Usistema, uCMClientDataSet, uCmSqlParams, TXRB;

type
  TrptSubContas = class(TFrmCmReport)
    dsSubConta: TwwDataSource;
    pplSubConta: TppBDEPipeline;
    pplSubContappField1: TppField;
    pplSubContappField2: TppField;
    rptSubConta: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel26: TppLabel;
    ppLine18: TppLine;
    lblempresa: TppLabel;
    ppLabel29: TppLabel;
    ppLine19: TppLine;
    ppLabel30: TppLabel;
    ppLblTituloSubConta2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine20: TppLine;
    lblsistema: TppLabel;
    rptSubContaLabel1: TppLabel;
    lblContSubConta: TppLabel;
    ppCalc14: TppSystemVariable;
    lblCalcSubConta: TppSystemVariable;
    sqlSubConta: TCMSqlParams;
    cdsSubConta: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppFooterBand7BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iPagIni: integer;
  public
    { Public declarations }
  end;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TrptSubContas.CrmRptCMBeforePrint(Sender: TObject);
Var
  sTitulo : string;
begin
  inherited;
  sTitulo := '';
   if trim(CmpRptCM.ParamValues[0].AsString) <> '' then
     sTitulo := sTitulo + '     Sub-Conta Inicial : ' + CmpRptCM.ParamValues[0].AsString;

   if trim(CmpRptCM.ParamValues[1].AsString) <> '' then
      sTitulo := sTitulo + '     Sub-Conta Final : ' + CmpRptCM.ParamValues[1].AsString;

   pplblTituloSubConta2.caption := sTitulo;
   iPagIni := CmpRptCM.ParamValues[3].AsInteger;

   with sqlSubConta do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT                             ');
      SQL.Add('   CODSUBCONTA, NOMESUBCONTA       ');
      SQL.Add('FROM                               ');
      SQL.Add('   SUBCONTA                        ');
      SQL.Add('WHERE                              ');
      SQL.Add('    (IDPESSOA =:PESSOA) AND        ');
      SQL.Add('    (CODSUBCONTA >=:CONTAINI) AND  ');
      SQL.Add('    (CODSUBCONTA <=:CONTAFIM)      ');
      SQL.Add('ORDER BY                           ');

      if CmpRptCM.ParamValues[2].AsInteger = 0 then begin
         SQL.Add('  CODSUBCONTA                   ');
      end else begin
         SQL.Add('  NOMESUBCONTA                  ');
      end;

      Prepare;
      ParamByName('PESSOA').asInteger := sistema.idEmpresa;

      if trim(CmpRptCM.ParamValues[0].AsString) <> '' then begin
         ParamByName('CONTAINI').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
      end else begin
         ParamByName('CONTAINI').asInteger := 0;
      end;

      if trim(CmpRptCM.ParamValues[1].AsString) <> '' then begin
         ParamByName('CONTAFIM').asInteger := StrToInt(CmpRptCM.ParamValues[1].AsString);
      end else begin
         ParamByName('CONTAFIM').asInteger := 999999;
      end;

      Open;

   end;

end;

procedure TrptSubContas.ppFooterBand7BeforePrint(Sender: TObject);
begin
  inherited;
  lblContSubConta.Caption := IntToStr((iPagIni + StrToInt(lblCalcSubConta.text)) - 1);
end;

procedure TrptSubContas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;

  CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := 'SELECT  '+
                                                     ' CODSUBCONTA, NOMESUBCONTA '+
                                                     '  FROM SUBCONTA '+
                                                     ' WHERE IDPESSOA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                     ' ORDER BY CODSUBCONTA ';

  CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := 'SELECT  '+
                                                     ' CODSUBCONTA, NOMESUBCONTA '+
                                                     '  FROM SUBCONTA '+
                                                     ' WHERE IDPESSOA = ' + floattostr(crmRptCM.IdEmpresa) +
                                                     ' ORDER BY CODSUBCONTA ';



end;

procedure TrptSubContas.FormCreate(Sender: TObject);
begin
  inherited;
  iPagIni := 1;
end;

end.
