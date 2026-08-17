unit RSaldoContas;
//==============================================================================
//
//  Data     : 19/01/2005
//  Autor    : Rodolpho da Silva
//  Pendência: 18121
//  Descrição: Implementar relatório de saldo por plano
//                                                     
//==============================================================================


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet,
  uCmSqlParams, uSistema, TXRB;

type
  TRptSaldoContas = class(TFrmCmReport)
    cdsSaldo: TCMClientDataSet;
    rpSaldo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    pplblDataSaldo: TppLabel;
    ppLine1: TppLine;
    pplblEmpresa: TppLabel;
    rpSaldoLabel1: TppLabel;
    rpSaldoLabel2: TppLabel;
    rpSaldoLine1: TppLine;
    rpSaldoLabel3: TppLabel;
    rpSaldoLabel6: TppLabel;
    pplblStatus: TppLabel;
    rpSaldoLabel5: TppLabel;
    rpSaldoLabel7: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppReport1DBText1: TppDBText;
    rpSaldoDBText1: TppDBText;
    rpSaldoDBText2: TppDBText;
    rpSaldoDBText3: TppDBText;
    rpSaldoDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    pplblSistema: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpSaldoSummaryBand1: TppSummaryBand;
    rpSaldoLabel4: TppLabel;
    rpSaldoDBCalc1: TppDBCalc;
    rpSaldoDBCalc2: TppDBCalc;
    rpSaldoDBCalc3: TppDBCalc;
    pplSaldo: TppBDEPipeline;
    dsSaldo: TwwDataSource;
    CdsSaldoPlano: TCMClientDataSet;
    SqlSaldoPlano: TCMSqlParams;
    dsSaldoPlano: TwwDataSource;
    pplSaldoPlano: TppDBPipeline;
    rptSaldoPlano: TppReport;
    CdsDadosEmpresa: TCMClientDataSet;
    SqlDadosEmpresa: TCMSqlParams;
    dsDadosEmpresa: TwwDataSource;
    ppTitleBand1: TppTitleBand;
    ppDbLogo: TppDBImage;
    ppLbEmpresa: TppLabel;
    ppLabel12: TppLabel;
    ppLbDescPerfil: TppLabel;
    ppLbPeriodo: TppLabel;
    ppLine4: TppLine;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLbNomeSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    CdsSaldoPlanoDESCRICAO: TStringField;
    CdsSaldoPlanoCODPORTADOR: TFloatField;
    CdsSaldoPlanoIDPLANOPREV: TFloatField;
    CdsSaldoPlanoNOME: TStringField;
    CdsSaldoPlanoSALDOANTERIOR: TFloatField;
    CdsSaldoPlanoRECEBTOPAGTO: TFloatField;
    CdsSaldoPlanoSALDOATU: TFloatField;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText3: TppDBText;
    ppShape1: TppShape;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLine5: TppLine;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLine6: TppLine;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppShpCorZebra: TppShape;
    ppLDadosEmpresa: TppDBPipeline;
    ppSummaryBand1: TppSummaryBand;
    ppLabel8: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine7: TppLine;
    spSaldo: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppLbNomeSistemaPrint(Sender: TObject);
    procedure ppLbEmpresaPrint(Sender: TObject);
    procedure ppShpCorZebraPrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptSaldoContas: TRptSaldoContas;

implementation

{$R *.DFM}

procedure TRptSaldoContas.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   // Início - Rodolpho - P: 18121 - 19/01/2005
   //  Verifica se o usuário não selecionou relatório por plano...
   if not CmpRptCM.ParamValues[2].AsBoolean then
   // Fim    - Rodolpho - P: 18121 - 19/01/2005

   begin

      spSaldo.Prepare;
      spSaldo.ParamByName('IDEmpresa').AsFloat:=CrmRptCM.IdEmpresa;
      spSaldo.ParamByName('DataRef').AsString:=
              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);

      spSaldo.SQL.Delete(9);
      case CmpRptCM.ParamValues[1].AsInteger of
         0 : spSaldo.SQL.Insert(9,' (M.STATUSCONCILIA IN (''P'',''X'',''I'',''N'',''C'',''J'')) AND ');
         1 : spSaldo.SQL.Insert(9,' (M.STATUSCONCILIA IN (''X'',''I'')) AND ');
         2 : spSaldo.SQL.Insert(9,' (M.STATUSCONCILIA <> ''C'') AND ');
      end;
     //CATIA p 20752   - 04/09/2006
     if  (CmpRptCM.ParamValues[3].IsNull) then
          spSaldo.SQL.Insert(9,' M.CODPORTADOR =C.CODPORTADOR  AND ')
     else
     begin
           spSaldo.SQL.Insert(9,' M.CODPORTADOR =C.CODPORTADOR  AND C.CODPORTADOR = ' + FloatToStr(CmpRptCM.ParamValues[3].AsFloat)+  ' AND ');
           spSaldo.SQL.Insert(41,' P.CODPORTADOR = ' + FloatToStr(CmpRptCM.ParamValues[3].AsFloat)+  ' AND ');
      end;
      spSaldo.Open;
      pplblDataSaldo.Caption:='Saldo das Contas em '+CmpRptCM.ParamValues[0].AsString;
      pplblStatus.Caption:=CmpRptCM.ParamValues[1].RadioGroupSettings.Items[
                                                CmpRptCM.ParamValues[1].AsInteger];
   end
   else



   // Início - Rodolpho - P: 18121 - 19/01/2005
   //  Caso ele tenha selecionado o relatório por plano...
   begin
     CrmRptCM.Report := rptSaldoPlano;


     //  Abre a qry do logo da empresa
     SqlDadosEmpresa.Prepare;
     SqlDadosEmpresa.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
     SqlDadosEmpresa.Open;


     SqlSaldoPlano.Prepare;
     SqlSaldoPlano.ParamByName('IDEmpresa').AsFloat :=  CrmRptCM.IdEmpresa;
     SqlSaldoPlano.ParamByName('DataRef').AsString  :=  FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime);
     


     case CmpRptCM.ParamValues[1].AsInteger of
         0 : SqlSaldoPlano.SQL.Strings[24] := ' (M.STATUSCONCILIA IN (''P'',''X'',''I'',''N'',''C'',''J'')) AND ';
         1 : SqlSaldoPlano.SQL.Strings[24] := ' (M.STATUSCONCILIA IN (''X'',''I'')) AND ';
         2 : SqlSaldoPlano.SQL.Strings[24] := ' (M.STATUSCONCILIA <> ''C'') AND ';
     end;
     //CATIA p 20752   - 04/09/2006
     if  (CmpRptCM.ParamValues[3].IsNull) then
          SqlSaldoPlano.SQL.Strings[24] := ' (M.CODPORTADOR =C.CODPORTADOR )AND'
     else
         begin
         SqlSaldoPlano.SQL.Strings[24]  := ' (M.CODPORTADOR =C.CODPORTADOR  AND C.CODPORTADOR = ' + FloatToStr(CmpRptCM.ParamValues[3].AsFloat)+ ') AND ';
         SqlSaldoPlano.SQL.Strings[69]  := ' ( P.CODPORTADOR = ' + FloatToStr(CmpRptCM.ParamValues[3].AsFloat)+ ') AND ';
         end;
     SqlSaldoPlano.Open;
     ppLbPeriodo.Caption    := 'Saldo das Contas em:   '+CmpRptCM.ParamValues[0].AsString;
     ppLbDescPerfil.Caption := 'Status:   ' +  CmpRptCM.ParamValues[1].RadioGroupSettings.Items[CmpRptCM.ParamValues[1].AsInteger];

   // Fim    - Rodolpho - P: 18121 - 19/01/2005
   end;
end;





procedure TRptSaldoContas.ppLbNomeSistemaPrint(Sender: TObject);
begin
  inherited;
  ppLbNomeSistema.Caption := Sistema.NomeCompleto;
end;



procedure TRptSaldoContas.ppLbEmpresaPrint(Sender: TObject);
begin
  inherited;
  ppLbEmpresa.Caption := Sistema.NomeEmpresa;
end;



procedure TRptSaldoContas.ppShpCorZebraPrint(Sender: TObject);
begin
  inherited;
  if ppShpCorZebra.Brush.Color = $00C6FFC6 then
     ppShpCorZebra.Brush.Color := clWhite
  else
     ppShpCorZebra.Brush.Color := $00C6FFC6;
end;

procedure TRptSaldoContas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODPORTADOR, '+
                                                    '   DESCRICAO '+
                                                    'FROM PORTADORCONTA '+
                                                    'WHERE (IDPESSOA = '+
                                                     FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY DESCRICAO ';
end;

end.
