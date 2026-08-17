unit dRelMovimContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls, ppClass,
  ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, Db,
  uCmSqlParams, DBClient, uCmRptManager, TXComp, CmParamReport, ppStrtch,
  ppSubRpt, uCtrlRelAlienacao, TXRB, uDiasUteis, fProgresso, fAguarde;

type
  TdtmRelMovimContabil = class(TFrmCmReportImob)
    rptMovimContabil: TppReport;
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
    CMSqlParams1: TCMSqlParams;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    pplblSaldoIni: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel5: TppLabel;
    lblData: TppLabel;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel119: TppLabel;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    cdsIDCONTRATOIMOVEL: TFloatField;
    cdsCONNUMERO: TStringField;
    cdsCONNOME: TStringField;
    cdsRAZAOSOCIAL: TStringField;
    cdsSEGMENTO: TStringField;
    cdsVALOR: TFloatField;
    cdsSALDOINICIAL: TFloatField;
    cdsCORR_INAD: TFloatField;
    cdsJUROS_INAD: TFloatField;
    cdsMULTA_INAD: TFloatField;
    cdsRESIDUO: TFloatField;
    cdsJUROS_MES: TFloatField;
    cdsCORRRESID_MES: TFloatField;
    cdsCORRSALDO_MES: TFloatField;
    cdsRECEBIMENTOS: TFloatField;
    cdsSALDOFINAL: TFloatField;
    cdsDadosParcela: TClientDataSet;
    cdsDadosInadimp: TClientDataSet;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppLabel4: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppLine2: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelAlienacao : TCtrlRelAlienacao;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;
  public
    { Public declarations }
  end;

var
  dtmRelMovimContabil: TdtmRelMovimContabil;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento, uFuncAlienacao;

{$R *.DFM}



procedure TdtmRelMovimContabil.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor           : Integer;
    fResiduo, fPrestMes, fSaldo, fTotalResiduo : Extended;
    dDataSaldoInicial : TDateTime;
    iAno, iMes, iDia  : Word;

    fTotalCMInad, fTotalJurosInad, fTotalMultaInad : Currency;
    fTotalJuros, fTotalCorrResid, fTotalCorrSaldo  : Currency;
    fTotalRecebimento, fSaldoAtual                 : Currency;

    iContadorCont : Integer;
begin
   inherited;
   // Cria e inicializa o CtrlObject do objeto de Relatórios
   CtrlRelAlienacao := TCtrlRelAlienacao.Create;
   CtrlRelAlienacao.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);

   dDataSaldoInicial := DiasUteis.SomaMeses(CmpRptCM.ParamValues[2].AsDateTime,-1);
   DecodeDate(dDataSaldoInicial,iAno, iMes, iDia);
   dDataSaldoInicial := DiasUteis.UltDiaMes(iAno, iMes);

   frmaguarde.Mostra('Selecionando Dados do(s) Contrato(s)');
   cds.Data := CtrlRelAlienacao.LookupContratosEstoque(CmpRptCM.ParamValues[0].AsString,
                                                       CmpRptCM.ParamValues[1].AsInteger,
                                                       CmpRptCM.ParamValues[6].AsInteger);

   frmAguarde.Apaga;

   frmProgresso.MostraFormProgresso('Processando Contratos...',
                                    False,
                                    False,
                                    True,
                                    0
                                    cds.RecordCount);


   iContadorCont := 0;

   cds.First;
   while not cds.eof do
   begin

      cdsParc.Data := CtrlRelAlienacao.SelecionaRelEstoqueFinanceiro(CmpRptCM.ParamValues[0].AsString,
                                                                     cds.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                     dDataSaldoInicial,
                                                                     CmpRptCM.ParamValues[6].AsInteger);


      cdsParc.First;

      Inc(iContadorCont);
      frmProgresso.AndaFormProgresso(iContadorCont);

      fTotalResiduo := 0;
      fPrestMes     := 0;
      fResiduo      := 0;

      while not cdsParc.eof do
      begin

         if (cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime >= dDataSaldoInicial) and
            (cdsParc.FieldByName('DATAPAGAMENTO').IsNull) then
         begin
            cdsParc.Edit;
            cdsParc.FieldByName('VLRDIF').AsFloat := 0;
            cdsParc.Post;
         end;

         if ( (cdsParc.FieldByName('FLGRESIDUOINCORP').AsString = 'N') and
              (cdsParc.FieldByName('FLGLANCINTEGRA').AsInteger <> 5   ) and
              (cdsParc.FieldByName('FLGLANCINTEGRA').AsInteger <> 6   ) and
              ((cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime <= dDataSaldoInicial) or
               (cdsParc.FieldByName('DATAPAGAMENTO').AsDateTime <= dDataSaldoInicial)  ) ) or
            ( (cdsParc.FieldByName('FLGRESIDUOINCORP').AsString = 'C') and
              (cdsParc.FieldByName('DATACOBRES').AsDateTime > dDataSaldoInicial) ) then begin
            fTotalResiduo := fTotalResiduo + cdsParc.FieldByName('VLRRESIDUO').AsFloat + cdsParc.FieldByName('VLRRESIDUOCORRIG').AsFloat;
         end;

         if (cdsParc.FieldByName('NUMPARC').AsInteger > 0) and
            (cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime >= dDataSaldoInicial) and
            (FormatDateTime('yyyymm',cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime) = FormatDateTime('yyyymm',dDataSaldoInicial)) and
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
            (cdsParc.FieldByName('FLGCONCILIADO').AsString = 'P') or
            (cdsParc.FieldByName('FLGCONCILIADO').AsString = 'S') then
            cdsParc.Delete
         else
            cdsParc.Next;
      end;

      cdsParc.First;
      while not cdsParc.eof do
      begin
         cds.Edit;
         cds.FieldByName('SALDOINICIAL').AsFloat := cds.FieldByName('SALDOINICIAL').AsFloat + cdsParc.FieldByName('VLRDIF').AsFloat;
         cds.Post;
         cdsParc.Next;
      end;

      fSaldo := FuncAlienacao.CalcSaldoDevedor(cds.FieldByName('IDCONTRATOIMOVEL').AsInteger,-1, dDataSaldoInicial);

      cds.Edit;
      cds.FieldByName('SALDOINICIAL').AsFloat := cds.FieldByName('SALDOINICIAL').AsFloat + fTotalResiduo + fSaldo + fPrestMes;
      cds.Post;


      // ----------------------------------------------------------------------------------------------------------------
      // Faz a Busca dos dados para a movimentação do mes


      cdsParc.Data := CtrlRelAlienacao.SelecionaRelEstoqueFinanceiro(CmpRptCM.ParamValues[0].AsString,
                                                                     cds.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                     CmpRptCM.ParamValues[2].AsDateTime,
                                                                     CmpRptCM.ParamValues[6].AsInteger);

      cdsParc.First;

      fTotalResiduo       := 0;
      fTotalCMInad        := 0;
      fTotalJurosInad     := 0;
      fTotalMultaInad     := 0;
      fTotalJuros         := 0;
      fTotalCorrResid     := 0;
      fTotalCorrSaldo     := 0;
      fTotalRecebimento   := 0;
      fSaldoAtual         := 0;

      cdsParc.First;
      while not cdsParc.eof do
      begin
         if (cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime >= CmpRptCM.ParamValues[2].AsDateTime) and
            (cdsParc.FieldByName('DATAPAGAMENTO').IsNull) then
         begin
            cdsParc.Edit;
            cdsParc.FieldByName('VLRDIF').AsFloat := 0;
            cdsParc.Post;
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

      cdsDadosInadimp.Data := CtrlRelAlienacao.LookupAtualizaInad(cds.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                  dDataSaldoInicial,
                                                                  CmpRptCM.ParamValues[2].AsDateTime);

      fTotalCMInad      := cdsDadosInadimp.FieldByName('VLRCORRIGIDOCM').AsCurrency;
      fTotalJurosInad   := cdsDadosInadimp.FieldByName('VLRCORRIGIDOJUROS').AsCurrency;
      fTotalMultaInad   := cdsDadosInadimp.FieldByName('VLRCORRIGIDOMULTA').AsCurrency;
      fTotalResiduo     := cdsDadosInadimp.FieldByName('VLRCORRIGIDORES').AsCurrency;
      fTotalRecebimento := cdsDadosInadimp.FieldByName('VLRPAGO').AsCurrency;

      while not cdsParc.eof do
      begin

         if (cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime > dDataSaldoInicial) and
            (cdsParc.FieldByName('DATAVENCIMENTO').AsDateTime <= CmpRptCM.ParamValues[2].AsDateTime) then
         begin

            cdsDadosParcela.Data := CtrlRelAlienacao.LookupParcelas(cdsParc.FieldByName('IDPARCFINANCIMOV').AsInteger);

            fTotalJuros          := fTotalJuros       + cdsDadosParcela.FieldByName('VLRJUROS').AsCurrency +
                                                        cdsDadosParcela.FieldByName('VLRJUROSPARC').AsCurrency;

            fTotalCorrResid      := fTotalCorrResid   + cdsParc.FieldByName('VLRRESIDUO').AsCurrency;
            fTotalCorrSaldo      := fTotalCorrSaldo   + cdsDadosParcela.FieldByName('VLRCORRSALDO').AsCurrency;

         end;
         cdsParc.Next;
      end;

      fSaldoAtual := fTotalCMInad + fTotalJurosInad + fTotalMultaInad + fTotalResiduo +
                     fTotalJuros  + fTotalCorrResid + fTotalCorrSaldo -
                     fTotalRecebimento;

      cds.Edit;
      cds.FieldByName('CORR_INAD').AsCurrency      := fTotalCMInad;
      cds.FieldByName('JUROS_INAD').AsCurrency     := fTotalJurosInad;
      cds.FieldByName('MULTA_INAD').AsCurrency     := fTotalMultaInad;
      cds.FieldByName('RESIDUO').AsCurrency        := fTotalResiduo;
      cds.FieldByName('JUROS_MES').AsCurrency      := fTotalJuros;
      cds.FieldByName('CORRRESID_MES').AsCurrency  := fTotalCorrResid;
      cds.FieldByName('CORRSALDO_MES').AsCurrency  := fTotalCorrSaldo;
      cds.FieldByName('RECEBIMENTOS').AsCurrency   := fTotalRecebimento;
      cds.FieldByName('SALDOFINAL').AsCurrency     := cds.FieldByName('SALDOINICIAL').AsFloat + fSaldoAtual;
      cds.Post;

      cds.Next;
   end;

   cds.First;
   while not cds.eof do
   begin
      if ((cds.FieldByName('SALDOINICIAL').AsCurrency  + cds.FieldByName('CORR_INAD').AsCurrency  +
           cds.FieldByName('JUROS_INAD').AsCurrency    + cds.FieldByName('MULTA_INAD').AsCurrency +
           cds.FieldByName('RESIDUO').AsCurrency       + cds.FieldByName('JUROS_MES').AsCurrency  +
           cds.FieldByName('CORRRESID_MES').AsCurrency + cds.FieldByName('CORRSALDO_MES').AsCurrency) = 0) and
         (cds.FieldByName('RECEBIMENTOS').AsCurrency = 0) and
         (cds.FieldByName('SALDOFINAL').AsCurrency = 0) then
         cds.Delete
      else
         cds.Next;
   end;

   frmProgresso.EscondeFormProgresso;
   cdsParc.Filtered := False;
   cdsParc.First;

   cds.First;

   // Carrega variáveis com os parametros de cores de linha e separadores
   bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
   bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
   iPosCor    := CmpRptCM.ParamValues[5].AsInteger;

   pplblSaldoIni.Caption := 'Saldo em ' + FormatDateTime('dd/mm/yyyy',dDataSaldoInicial);

   lblData.Caption     := 'Data Considerada: ' + FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[2].AsDateTime);

   ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
end;



procedure TdtmRelMovimContabil.ppsCorPrint(Sender: TObject);
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



procedure TdtmRelMovimContabil.pplSeparadorPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



end.








