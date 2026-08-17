// Alterações:
{ ------------------------------------------------------------------------------
// Data      : 6/05/2007
// Autor     : Marcus Oliveira
// Pendência : 25530
// Descrição : Passando a banda para Static 
{ --------------------------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 16/12/2003
Autor     : André Pontes
Pendencia : Correção da impressão dos dados bancários
Descrição : Foi criado uma query que traz o campo FLGDADOSBANCARIOS da forma de pagamento
            (FormaRecPag). Se for 'N', não deve imprimir os dados bancários. Definido por Geisa.
---------------------------------------------------------------------------------------------------}

unit rEmissBDebitoMod2;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass,
   ppCtrls, ppStrtch, ppRegion, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
   Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlEmissBordero, uCtrlParamIntegra,
  TXRB;

type
   TRptEmissBDebitoMod2 = Class(TFrmCmReport)
      ppBordDebitoMod2: TppBDEPipeline;
      DsBordDebitoMod2: TwwDataSource;
      RptBordDebitoMod2: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppCalc1: TppSystemVariable;
      ppCalc2: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      RptBordDebitoMod2DBText1: TppDBText;
      RptBordDebitoMod2DBText2: TppDBText;
      RptBordDebitoMod2DBText3: TppDBText;
      RptBordDebitoMod2DBText5: TppDBText;
      RptBordDebitoMod2DBText4: TppDBText;
      RptBordDebitoMod2DBText9: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      RptBordDebitoMod2Label2: TppLabel;
      RptBordDebitoMod2DBCalc1: TppDBCalc;
      RptBordDebitoMod2SummaryBand1: TppSummaryBand;
      RptBordDebitoMod2Line3: TppLine;
      RptBordDebitoMod2Label3: TppLabel;
      RptBordDebitoMod2DBCalc2: TppDBCalc;
      RptBordDebitoMod2Group1: TppGroup;
      RptBordDebitoMod2GroupHeaderBand1: TppGroupHeaderBand;
      RptBordDebitoLabel1: TppLabel;
      RptBordDebitoLabel2: TppLabel;
      RptBordDebitoLabel3: TppLabel;
      RptBordDebitoLabel4: TppLabel;
      LblFraseBord: TppLabel;
      RptBordDebitoDBText3: TppDBText;
      RptBordDebitoDBText2: TppDBText;
      RptBordDebitoDBText15: TppDBText;
      RptBordDebitoDBText16: TppDBText;
      RptBordDebitoDBText17: TppDBText;
      RptBPagtoDBText1: TppDBText;
      ppLine1: TppLine;
      RptBordDebitoLabel6: TppLabel;
      RptBordDebitoLabel9: TppLabel;
      RptBordDebitoLabel15: TppLabel;
      RptBPagtoLabel1: TppLabel;
      RptBordDebitoLabel11: TppLabel;
      RptBordDebitoLabel12: TppLabel;
      RptBordDebitoLabel13: TppLabel;
      RptBordDebitoMod2Label1: TppLabel;
      RptBordDebitoMod2Line1: TppLine;
      RptBordDebitoMod2Line2: TppLine;
      RptBordDebitoMod2Label4: TppLabel;
      RptBordDebitoMod2GroupFooterBand1: TppGroupFooterBand;
      SqlBordDebitoMod2: TCMSqlParams;
      CdsBordDebitoMod2: TCMClientDataSet;
      SqlBuscaCentroRespon: TCMSqlParams;
      CdsBuscaCentroRespon: TCMClientDataSet;
      SqlBuscaCentroRespon3: TCMSqlParams;
      CdsBuscaCentroRespon3: TCMClientDataSet;
    sqlFormaRecPag: TCMSqlParams;
    cdsFormaRecPag: TCMClientDataSet;
    RptBordDebitoMod2DBText6: TppDBText;
    RptBordDebitoMod2DBText7: TppDBText;
    RptBordDebitoMod2DBText8: TppDBText;

      procedure CrmRptCMBeforePrint(Sender: TObject);
      procedure RptBordDebitoMod2PrintingComplete(Sender: TObject);
      procedure FormCreate(Sender: TObject);


   private  // Private declarations

   public   // Public declarations

      CtrlEmissBordero: TCtrlEmissBordero;
      sLoteBordero, sDataBorderoLocal, sCodPortForma, sLancaFinan: String;


   end;




var
  RptEmissBDebitoMod2: TRptEmissBDebitoMod2;




implementation
{$R *.DFM}
uses
   DDadosBancarios, umensErro;



procedure TRptEmissBDebitoMod2.CrmRptCMBeforePrint(Sender: TObject);
var
   rValor: Real;
begin
   inherited;

   sLoteBordero      := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
   sDataBorderoLocal := CmpRptCM.ParamValues[1].AsString;
   sCodPortForma     := IntToStr(CmpRptCM.ParamValues[2].AsInteger);

   SqlBordDebitoMod2.Prepare;
   SqlBordDebitoMod2.ParamByName('NumLote').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
   SqlBordDebitoMod2.Open;
   CdsBordDebitoMod2.First;

   rValor := 0;

   while not(CdsBordDebitoMod2.EOF) do
   begin
      with DtmDadosBancarios do
      begin
         BuscaContaDoc(CdsBordDebitoMod2.FieldByName('CODDOCUMENTO').AsFloat);

         cdsFormaRecPag.Close;
         sqlFormaRecPag.Prepare;
         sqlFormaRecPag.ParamByName('PCODDOCUMENTO').AsFloat := CdsBordDebitoMod2.FieldByName('CODDOCUMENTO').AsFloat;
         sqlFormaRecPag.Open;

         CdsBordDebitoMod2.Edit;

         if cdsFormaRecPag.FieldByName('FLGDADOSBANCARIOS').AsString = 'S' then
         begin
            CdsBordDebitoMod2.FieldByName('NUMBANCO').AsString    := ContaBancaria.Banco;
            CdsBordDebitoMod2.FieldByName('NOMEBANCO').AsString   := ContaBancaria.NomeBanco;
            CdsBordDebitoMod2.FieldByName('NUMAGENCIA').AsString  := ContaBancaria.AgenciaFormat;
            CdsBordDebitoMod2.FieldByName('NOMEAGENCIA').AsString := ContaBancaria.Nomeagencia;
            CdsBordDebitoMod2.FieldByName('CONTAFORNE').AsString  := ContaBancaria.NumeroFormat;
         end
         else
         begin
            CdsBordDebitoMod2.FieldByName('NUMBANCO').AsString    := '';
            CdsBordDebitoMod2.FieldByName('NOMEBANCO').AsString   := '';
            CdsBordDebitoMod2.FieldByName('NUMAGENCIA').AsString  := '';
            CdsBordDebitoMod2.FieldByName('NOMEAGENCIA').AsString := '';
            CdsBordDebitoMod2.FieldByName('CONTAFORNE').AsString  := '';
         end;
      end;

      if CdsBordDebitoMod2.FieldByName('NUMFATURA').IsNull then
      begin
         if CdsBuscaCentroRespon.Active then CdsBuscaCentroRespon.Close;

         SqlBuscaCentroRespon.Prepare;
         SqlBuscaCentroRespon.Params[0].AsFloat := CdsBordDebitoMod2.FieldByName('CODDOCUMENTO').AsFloat;
         SqlBuscaCentroRespon.Open;

         if CdsBuscaCentroRespon.IsEmpty then
            CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := 'Nil'
         else
            CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := CdsBuscaCentroRespon.Fields[0].asstring;
      end
      else
      begin
         if CdsBuscaCentroRespon3.Active then CdsBuscaCentroRespon3.Close;

         SqlBuscaCentroRespon3.Prepare;
         SqlBuscaCentroRespon3.Params[0].AsFloat := CdsBordDebitoMod2.FieldByName('NUMFATURA').AsFloat;
         SqlBuscaCentroRespon3.Open;

         if CdsBuscaCentroRespon3.IsEmpty then
            CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := 'Nil'
         else
            CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := CdsBuscaCentroRespon3.Fields[0].asstring;
      end;

      CdsBordDebitoMod2.Post;

      rValor := rValor + CdsBordDebitoMod2.FieldByName('VALOR').AsFloat;

      CdsBordDebitoMod2.Next;
   end;

   lblFraseBord.Caption := 'Autorizo o débito na conta acima para pagamento referente ao dia ' +
                           sDataBorderoLocal +
                           ' no valor total de R$ ' +
                           Trim(FloatToStrF(rValor, ffNumber, 17, 2)) +
                           ' do(s) documento(s) abaixo listado(s).'
end;



procedure TRptEmissBDebitoMod2.RptBordDebitoMod2PrintingComplete(Sender: TObject);
begin
   inherited;

   // Verifica se o borderô foi impresso corretamente e Flega como impresso
   // Caso o preview seja via tela de Relatorios, recria o form de parâmetros para
   // Atualizar a querie

   if CtrlEmissBordero.VerificaImpresaoBordero(StrToInt(sLoteBordero)) then Exit;

   if CdsBordDebitoMod2.FieldByName('FLAGEMISSAO').AsString = '1' then Exit;

   if MsgDlg(' O relatório foi emitido corretamente ?','Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      if not(CtrlEmissBordero.EmissaoBDebito(ParamIntegra.RecPAg,
                                             sLoteBordero,
                                             sDataBorderoLocal,
                                             sCodPortForma,
                                             CrmRptCM.idEmpresa,
                                             CrmRptCM.IdModulo,
                                             CrmRptCM.IdUsuario,
                                             ParamIntegra.Plano,
                                             ParamIntegra.IntegraContab)) then
      begin
         Exit;
      end;

   end;
   Repaint;
end;



procedure TRptEmissBDebitoMod2.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlEmissBordero := TCtrlEmissBordero.Create(CrmRptCM.idEmpresa, CrmRptCM.idmodulo, CrmRptCM.idusuario, True);
   CtrlEmissBordero.InitializeAs(ParamIntegra);
end;



end.
