unit dRelEstoqueFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppClass,
  ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, Db,
  uCmSqlParams, DBClient, uCmRptManager, TXComp, CmParamReport, ppStrtch,
  ppSubRpt, uCtrlRelAlienacao, TXRB;

type
  TdtmRelEstoqueFinanceiro = class(TFrmCmReportImob)
    rptEstoqueFinanceiro: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppl: TppBDEPipeline;
    cdsParc: TClientDataSet;
    dsParc: TDataSource;
    pplParc: TppBDEPipeline;
    CMSqlParams1: TCMSqlParams;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    rptParcelas: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel12: TppLabel;
    ppDBText19: TppDBText;
    lblData: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure rptParcelasPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelAlienacao : TCtrlRelAlienacao;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelEstoqueFinanceiro: TdtmRelEstoqueFinanceiro;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uFuncAlienacao;

{$R *.DFM}



procedure TdtmRelEstoqueFinanceiro.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor       : Integer;
    fResiduo, fPrestMes, fSaldo, fTotalResiduo : Extended;
begin
   inherited;
   // Cria e inicializa o CtrlObject do objeto de Relatórios
   CtrlRelAlienacao := TCtrlRelAlienacao.Create;
   CtrlRelAlienacao.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);

   cds.Data := CtrlRelAlienacao.LookupContratosEstoque(CmpRptCM.ParamValues[0].AsString,
                                                       CmpRptCM.ParamValues[1].AsInteger,
                                                       CmpRptCM.ParamValues[7].AsInteger);


   cdsParc.Data := CtrlRelAlienacao.SelecionaRelEstoqueFinanceiro(CmpRptCM.ParamValues[0].AsString,
                                                                  CmpRptCM.ParamValues[1].AsInteger,
                                                                  CmpRptCM.ParamValues[2].AsDateTime,
                                                                  CmpRptCM.ParamValues[7].AsInteger);

   cds.First;
   while not cds.eof do
   begin

      cdsParc.Filtered := False;
      cdsParc.Filter   := 'IDCONTRATOIMOVEL = ' + cds.FieldByName('IDCONTRATOIMOVEL').AsString;

      cdsParc.Filtered := True;
      cdsParc.First;

      fTotalResiduo := 0;
      fPrestMes     := 0;
      fResiduo      := 0;

      while not cdsParc.eof do
      begin

         if (cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime >= CmpRptCM.ParamValues[2].AsDateTime) and
            (cdsParc.FieldByName('DATAPAGAMENTO').IsNull) then
         begin
            cdsParc.Edit;
            cdsParc.FieldByName('VLRDIF').AsFloat := 0;
            cdsParc.Post;
         end;

         cdsParc.Edit;
         cdsParc.FieldByName('CAL_TIPO').AsString := FuncAlienacao.TipoParcela(cdsParc.FieldByName('FLGTIPOLANC').AsInteger,
                                                                               cdsParc.FieldByName('FLGLANCINTEGRA').AsInteger);
         cdsParc.Post;

         if ( (cdsParc.FieldByName('FLGRESIDUOINCORP').AsString = 'N') and
              (cdsParc.FieldByName('FLGLANCINTEGRA').AsInteger <> 5   ) and
              (cdsParc.FieldByName('FLGLANCINTEGRA').AsInteger <> 6   ) and
              ((cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime <= CmpRptCM.ParamValues[2].AsDateTime) or
               (cdsParc.FieldByName('DATAPAGAMENTO').AsDateTime <= CmpRptCM.ParamValues[2].AsDateTime)  ) ) or
            ( (cdsParc.FieldByName('FLGRESIDUOINCORP').AsString = 'C') and
              (cdsParc.FieldByName('DATACOBRES').AsDateTime > CmpRptCM.ParamValues[2].AsDateTime) ) then begin
            fTotalResiduo := fTotalResiduo + cdsParc.FieldByName('VLRRESIDUO').AsFloat + cdsParc.FieldByName('VLRRESIDUOCORRIG').AsFloat;
         end;

         if (cdsParc.FieldByName('NUMPARC').AsInteger > 0) and
            (cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime >= CmpRptCM.ParamValues[2].AsDateTime) and
            (FormatDateTime('yyyymm',cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime) = FormatDateTime('yyyymm',CmpRptCM.ParamValues[2].AsDateTime)) and
            ( (cdsParc.FieldByName('DATAPAGAMENTO').AsDateTime > cdsParc.FieldByName('DATALIMITE').AsDateTime) or
              (cdsParc.FieldByName('DATAPAGAMENTO').IsNull) ) then begin
            fPrestMes := fPrestMes + cdsParc.FieldByName('VLRPRESTACAO').AsFloat;
         end;

         cdsParc.Next;
      end;

      cdsParc.First;
      while not cdsParc.eof do
      begin
         if (cdsParc.FieldByName('VLRDIF').AsFloat = 0) or
            (cdsParc.FieldByName('FLGLANCINTEGRA').AsInteger = 5) or
            (cdsParc.FieldByName('FLGLANCINTEGRA').AsInteger = 6) or
            (cdsParc.FieldByName('FLGCONCILIADO').AsString = 'C') or
            (cdsParc.FieldByName('FLGCONCILIADO').AsString = 'S') then
            cdsParc.Delete
         else
            cdsParc.Next;
      end;

      cdsParc.First;
      while not cdsParc.eof do
      begin
         cds.Edit;
         cds.FieldByName('VALOR').AsFloat := cds.FieldByName('VALOR').AsFloat + cdsParc.FieldByName('VLRDIF').AsFloat;
         cds.Post;
         cdsParc.Next;
      end;

      if fTotalResiduo <> 0 then
      begin
         cdsParc.Append;
         cdsParc.FieldByName('SEGMENTO').AsString          := cds.FieldByName('SEGMENTO').AsString;
         cdsParc.FieldByName('IDCONTRATOIMOVEL').AsInteger := cds.FieldByName('IDCONTRATOIMOVEL').AsInteger;
         cdsParc.FieldByName('CAL_TIPO').AsString          := 'Resíduo Atualizado';
         cdsParc.FieldByName('VLRDIF').AsFloat             := fTotalResiduo;
         cdsParc.Post;
      end;


      fSaldo := FuncAlienacao.CalcSaldoDevedor(cds.FieldByName('IDCONTRATOIMOVEL').AsInteger,-1, CmpRptCM.ParamValues[2].AsDateTime);

      if fSaldo <> 0 then
      begin
         cdsParc.Append;
         cdsParc.FieldByName('SEGMENTO').AsString          := cds.FieldByName('SEGMENTO').AsString;
         cdsParc.FieldByName('IDCONTRATOIMOVEL').AsInteger := cds.FieldByName('IDCONTRATOIMOVEL').AsInteger;
         cdsParc.FieldByName('CAL_TIPO').AsString          := 'Saldo Devedor Vincendo';
         cdsParc.FieldByName('VLRDIF').AsFloat             := fSaldo;
         cdsParc.Post;
      end;

      if fPrestMes <> 0 then
      begin
         cdsParc.Append;
         cdsParc.FieldByName('SEGMENTO').AsString          := cds.FieldByName('SEGMENTO').AsString;
         cdsParc.FieldByName('IDCONTRATOIMOVEL').AsInteger := cds.FieldByName('IDCONTRATOIMOVEL').AsInteger;
         cdsParc.FieldByName('CAL_TIPO').AsString          := 'Prestações a vencer';
         cdsParc.FieldByName('VLRDIF').AsFloat             := fPrestMes;
         cdsParc.Post;
      end;

      cds.Edit;
      cds.FieldByName('VALOR').AsFloat := cds.FieldByName('VALOR').AsFloat + fTotalResiduo + fSaldo + fPrestMes;
      cds.Post;

      cds.Next;
   end;


   cdsParc.Filtered := False;
   cdsParc.First;

   cds.First;
   while not cds.eof do
   begin
      if cds.FieldByName('VALOR').AsFloat = 0 then cds.Delete
      else                                         cds.Next;
   end;
   
   cds.First;

   // Carrega variáveis com os parametros de cores de linha e separadores
   bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
   bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
   iPosCor    := CmpRptCM.ParamValues[5].AsInteger;

   rptParcelas.Visible   := (CmpRptCM.ParamValues[6].AsInteger = 1);
   rptParcelas.ExpandAll := rptParcelas.Visible;

   lblData.Caption     := 'Data Final: ' + FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[2].AsDateTime);

   ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;



procedure TdtmRelEstoqueFinanceiro.ppsCorPrint(Sender: TObject);
begin
   inherited;
   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelEstoqueFinanceiro.pplSeparadorPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelEstoqueFinanceiro.rptParcelasPrint(Sender: TObject);
begin
   inherited;
   if rptParcelas.Visible then
   begin
      cdsParc.Filtered := False;
      cdsParc.Filter   := 'IDCONTRATOIMOVEL = ' + cds.FieldByName('IDCONTRATOIMOVEL').AsString;
      cdsParc.Filtered := True;
      cdsParc.First;
   end;
end;


end.








