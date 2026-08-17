unit RLancFinanc;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : - (spLancFinanc)
Data      : 02/10/2007
Autor     : Marcus Oliveira
Pendencia : 25555
Descrição : alterado - Pode passar nenhum Desembolso/Recebimento
{ --------------------------------------------------------------------------------------------------
Rotina    : - (spLancFinanc)
Data      : 19/06/2007
Autor     : Marcus Oliveira
Pendencia : 25555
Descrição : O Tipo de Desembolso foi alterado para um montaselect para trazer codtiprecdes e o recpag
{ --------------------------------------------------------------------------------------------------
Rotina    : - (spLancFinanc)
Data      : 15/08/2003
Autor     : André Pontes
Pendencia : 14391
Descrição : Incluídos campos de Plano, Patro e Programa, com respectivos joins
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppClass, ppReport,
  ppStrtch, ppSubRpt, ppVar, ppPrnabl, ppCache, ppProd, Wwdatsrc, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, TXRB, MontaSelect;

type
  TRptLancFinanc = class(TFrmCmReport)
    spLancFinanc: TCMSqlParams;
    cdsLancFinanc: TCMClientDataSet;
    cdsPrevisao: TCMClientDataSet;
    spPrevisao: TCMSqlParams;
    pplPrevisao: TppBDEPipeline;
    pplPrevisaoppField1: TppField;
    pplPrevisaoppField2: TppField;
    pplPrevisaoppField3: TppField;
    pplPrevisaoppField4: TppField;
    pplPrevisaoppField5: TppField;
    pplPrevisaoppField6: TppField;
    dsPrevisao: TwwDataSource;
    rpLancamento: TppReport;
    ppHeaderBand4: TppHeaderBand;
    rpLancamentoLabel2: TppLabel;
    pplblEmpresa: TppLabel;
    lblDataLancamento: TppLabel;
    rpLancamentoLabel4: TppLabel;
    rpLancamentoLabel15: TppLabel;
    rpLancamentoDBText6: TppDBText;
    ppDetailBand4: TppDetailBand;
    rpLancamentoDBText9: TppDBText;
    rpLancamentoDBText2: TppDBText;
    rpLancamentoDBText4: TppDBText;
    rpLancamentoDBText5: TppDBText;
    rpLancamentoDBText10: TppDBText;
    rpLancamentoDBText3: TppDBText;
    rpLancamentoDBText7: TppDBText;
    rpLancamentoDBText1: TppDBText;
    ppFooterBand4: TppFooterBand;
    pplblSistema: TppLabel;
    rpLancamentoLine1: TppLine;
    ppCalc1: TppSystemVariable;
    rpLancamentoCalc2: TppSystemVariable;
    rpLancamentoSummaryBand1: TppSummaryBand;
    rpLancamentoShape1: TppShape;
    rpLancamentoLabel7: TppLabel;
    rpLancamentoDBText8: TppDBText;
    rpLancamentoDBText12: TppDBText;
    rpLancamentoDBText13: TppDBText;
    rpLancamentoLabel12: TppLabel;
    rpLancamentoLabel16: TppLabel;
    rpLancamentoSubReport1: TppSubReport;
    rpLancamentoChildReport1: TppChildReport;
    rpLancamentoChildReport1DetailBand1: TppDetailBand;
    rpLancamentoChildReport1Shape1: TppShape;
    rpLancamentoChildReport1Label1: TppLabel;
    rpLancamentoChildReport1Label2: TppLabel;
    rpLancamentoChildReport1DBText1: TppDBText;
    rpLancamentoChildReport1DBText2: TppDBText;
    rpLancamentoChildReport1Label3: TppLabel;
    rpLancamentoChildReport1Label4: TppLabel;
    dbtValorRHoje1: TppDBText;
    dbtValorPHoje1: TppDBText;
    rpLancamentoChildReport1Label5: TppLabel;
    rpLancamentoChildReport1Label6: TppLabel;
    rpLancamentoChildReport1DBText5: TppDBText;
    rpLancamentoChildReport1DBText6: TppDBText;
    rpLancamentoChildReport1Label7: TppLabel;
    pplblTotal: TppLabel;
    dbtValorAtual: TppDBText;
    dbtValorPHoje: TppDBText;
    dbtValorRHoje: TppDBText;
    rpLancamentoGroup4: TppGroup;
    rpLancamentoGroupHeaderBand4: TppGroupHeaderBand;
    rpLancamentoShape3: TppShape;
    rpLancamentoDBText11: TppDBText;
    rpLancamentoLabel11: TppLabel;
    rpLancamentoLabel13: TppLabel;
    rpLancamentoLabel8: TppLabel;
    rpLancamentoLabel10: TppLabel;
    rpLancamentoLabel14: TppLabel;
    rpLancamentoLabel9: TppLabel;
    rpLancamentoLabel6: TppLabel;
    Label9: TppLabel;
    rpLancamentoGroupFooterBand4: TppGroupFooterBand;
    rpLancamentoDBCalc2: TppDBCalc;
    rpLancamentoLabel5: TppLabel;
    dsLancFinanc: TwwDataSource;
    pplLancFinanc: TppBDEPipeline;
    ppLabel1: TppLabel;
    ppLblModulo: TppLabel;
    MontaSelect1: TMontaSelect;

    procedure pplblTotalPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppLblModuloPrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure spLancFinancFormartParam(sParamName, sOldValue: String; var sNewValue: String);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  RptLancFinanc: TRptLancFinanc;



implementation
{$R *.DFM}



procedure TRptLancFinanc.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   spPrevisao.Prepare;
   spPrevisao.ParamByName('IDPessoa').AsFloat:=CrmRptCM.IdEmpresa;
   spPrevisao.ParamByName('DATAREF').AsString:=FormatDateTime('dd/mm/yyyy',Date);
   spPrevisao.Open;

   spLancFinanc.Prepare;
   spLancFinanc.ParamByName('IDPESSOA').AsFloat:=CrmRptCM.IdEmpresa;
   spLancFinanc.ParamByName('DATAINI').AsString:=
                FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
   spLancFinanc.ParamByName('DATAFIM').AsString:=
                FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);

   spLancFinanc.ParamByName('IDMODULO').AsString:= CmpRptCM.ParamValues[2].AsString;

   if (Trim( CmpRptCM.ParamValues[3].AsString) <> '' ) then
   begin
     spLancFinanc.ParamByName('CODTIPRECDES').AsString :=
        ' AND ((T.CODTIPRECDES = ' + MontaSelect1.ValoresChave[2] + ') OR  (' + MontaSelect1.ValoresChave[2] + 'IS NULL)) ';
     spLancFinanc.ParamByName('RECPAG').AsString := ' AND (R.RECPAG = ' + QuotedStr( MontaSelect1.ValoresChave[1] ) + ')';
   end
   else
   begin
     spLancFinanc.ParamByName('CODTIPRECDES').AsString := 'AND (1 = 1)';
     spLancFinanc.ParamByName('RECPAG').AsString := 'AND (1 = 1)';
   end;

   spLancFinanc.Open;
   lblDataLancamento.Caption:=FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+' à '+
                              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime);
end;



procedure TRptLancFinanc.pplblTotalPrint(Sender: TObject);
var
   rValor1,rValor2,rValor3,rValorTotal: Extended;
begin
   inherited;
   rValor1:=0;
   rValor2:=0;
   rValor3:=0;
   if Trim(dbtValorAtual.GetText)<>'' then rValor1:=StrToFloat(dbtValorAtual.GetText);
   if Trim(dbtValorRHoje.GetText)<>'' then rValor2:=StrToFloat(dbtValorRHoje.GetText);
   if Trim(dbtValorPHoje.GetText)<>'' then rValor3:=StrToFloat(dbtValorPHoje.GetText);
   rValorTotal:=rValor1+rValor2-rValor3;
   pplblTotal.Caption:= FormatFloat('#,##0.00',rValorTotal);
end;



procedure TRptLancFinanc.ppLblModuloPrint(Sender: TObject);
begin
  inherited;
  if trim( CmpRptCM.ParamValues[2].AsString ) = '' then
    ppLblModulo.Caption := 'Todos'
  else
    ppLblModulo.Caption := cdsLancFinanc.FieldByName('NOMEMODULO').AsString;
end;



procedure TRptLancFinanc.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  if (Trim( CmpRptCM.ParamValues[3].AsString) <> '' ) then
    MontaSelect1.Filtro.Add('IDPESSOA = '+ FloatToStr( CrmRptCM.IdEmpresa) );
end;



procedure TRptLancFinanc.spLancFinancFormartParam(sParamName, sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'CODTIPRECDES') or (sParamName = 'RECPAG') then
     sNewValue := Copy(sOldValue,1,Length(sOldValue));
end;



end.
