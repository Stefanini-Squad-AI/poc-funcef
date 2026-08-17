//********************************************************************************************************
// Data     : 06/10/2004
// Código   : AL_1
// Motivo   : Alteração Legislação CPMF
//********************************************************************************************************
unit fOperRenFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, StdCtrls, TREdit, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, ExtCtrls;

type
  TfrmOperRenFixa = class(TfrmCadastroCS)
    Label4: TLabel;
    dDataOper: TCMDateTimePicker;
    dDataVenc: TCMDateTimePicker;
    Label18: TLabel;
    Label5: TLabel;
    dblkTipoOperacao: TwwDBLookupCombo;
    Label19: TLabel;
    dblkCarteiraInvest: TwwDBLookupCombo;
    Label2: TLabel;
    dblkCustodiante: TwwDBLookupCombo;
    Label3: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    Label6: TLabel;
    edQuantidade: TRealEdit;
    Label8: TLabel;
    edValor: TRealEdit;
    Label10: TLabel;
    edObs: TEdit;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoIDMERCADO: TFloatField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoTIPOCUSTODIA: TStringField;
    qryTipoOperacaoVENCIMENTO: TFloatField;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoRECPAG: TStringField;
    qryTipoOperacaoTIPCREDOR: TStringField;
    qryTipoOperacaoFLGGERACAF: TFloatField;
    qryTipoOperacaoFLGTRANSF: TStringField;
    qryTipoOperacaoTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperacaoTRGUSERINCLUSAO: TStringField;
    qryTipoOperacaoFLGCORRET: TStringField;
    qryTipoOperacaoFLGORDMOVINV: TStringField;
    qryTipoOperacaoIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperacaoFLGOPDIREITO: TStringField;
    qryTipoOperacaoFLGAGE: TStringField;
    qryTipoOperacaoFLGDATAEX: TStringField;
    qryTipoOperacaoFLGDATACOM: TStringField;
    qryTipoOperacaoFLGINVORIGEM: TStringField;
    qryTipoOperacaoFLGPERC: TStringField;
    qryTipoOperacaoFLGPARIDADE: TStringField;
    qryTipoOperacaoFLGPRZBOLSA: TStringField;
    qryTipoOperacaoFLGPRZEMP: TStringField;
    qryTipoOperacaoFLGATADEC: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC: TStringField;
    qryTipoOperacaoFLGDIVACAO: TStringField;
    qryTipoOperacaoFLGINIPAG: TStringField;
    qryTipoOperacaoFLGJUROS: TStringField;
    qryTipoOperacaoMOTBLOQCARTORIG: TFloatField;
    qryTipoOperacaoMOTBLOQCARTDEST: TFloatField;
    qryTipoOperacaoTIPSALDOCARTORIG: TStringField;
    qryTipoOperacaoTIPSALDOCARTDEST: TStringField;
    qryTipoOperacaoFLGTRATAIR: TStringField;
    qryTipoOperacaoSIGLATIPOOPER: TStringField;
    qryTipoOperacaoFLGISENTOIR: TStringField;
    qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperacaoFLGOPGERENC: TStringField;
    qryTipoOperacaoTIPOMOVTO: TStringField;
    qryTipoOperacaoSTAATIVO: TStringField;
    qryTipoOperacaoFLGRENTABILIDADE: TStringField;
    qryCarteiraInvest: TwwQuery;
    qryCarteiraInvestDESCCARTINVEST: TStringField;
    qryCarteiraInvestIDCARTEIRAINVEST: TFloatField;
    qryCarteiraInvestIDGESTORCARTEIRA: TFloatField;
    qryCarteiraInvestFLGCARTPROP: TFloatField;
    qryCarteiraInvestFLGCALCDIARIO: TStringField;
    qryCarteiraInvestDATAINICIO: TDateTimeField;
    qryCarteiraInvestTRGDTINCLUSAO: TDateTimeField;
    qryCarteiraInvestTRGUSERINCLUSAO: TStringField;
    qryCarteiraInvestFLGTRATALOTE: TStringField;
    qryCarteiraInvestIDPLANOPREV: TFloatField;
    qryCarteiraInvestIDPATROCINADORA: TFloatField;
    qryCarteiraInvestIDTIPOINVEST: TFloatField;
    qryCarteiraInvestIDMERCADO: TFloatField;
    qryCarteiraInvestFLGORDMOVINV: TStringField;
    qryCarteiraInvestDATAULTFECH: TDateTimeField;
    qryCarteiraInvestIDDAIEACART: TFloatField;
    qryCarteiraInvestFLGCARTLASTRO: TStringField;
    qryCarteiraInvestFLGCARTTERC: TStringField;
    qryCustodiante: TwwQuery;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodianteTRGDTINCLUSAO: TDateTimeField;
    qryCustodianteTRGUSERINCLUSAO: TStringField;
    qryCustodianteFLGCODATIVOCUST: TStringField;
    qryInsOperacaoInvest: TwwQuery;
    qryBuscaLote: TwwQuery;
    qryBuscaLoteIDLOTE: TStringField;
    qryBuscaLoteIDPLANPREVCTBPATR: TFloatField;
    qryBuscaLoteDATAMOVCARTINV: TDateTimeField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoIDMOEDACONTAB: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    qryInvestimentoIDTIPOINVEST: TFloatField;
    qryInvestimentoFLGATIVO: TStringField;
    qryInvestimentoOBSINVESTIMENTO: TStringField;
    qryInvestimentoDESCCLASSINVEST: TStringField;
    qryInvestimentoCODISIN: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryInvestimentoCARENCIA: TFloatField;
    qryInvestimentoTRGDTINCLUSAO: TDateTimeField;
    qryInvestimentoTRGUSERINCLUSAO: TStringField;
    qryInvestimentoSTAOPCAO: TStringField;
    qryInvestimentoIDCARTEIRASPC: TFloatField;
    qryInvestimentoFLGRFXANTIGO: TStringField;
    qryInsHistCartinv: TwwQuery;
    edBoleta: TEdit;
    lblBoleta: TLabel;
    edPUOper: TRealEdit;
    lblPUOper: TLabel;
    qryIDOPERACAOINVEST: TFloatField;
    qryMOECODIGO: TFloatField;
    qryEMPRESAPROP: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryNUMDOCUMENTO: TStringField;
    qryQTDEOPERACAO: TFloatField;
    qryPRECOUNITOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryDATAVENCOPER: TDateTimeField;
    qryIDFORCLI: TFloatField;
    qryOBSERVACAO: TStringField;
    qryIDLOTE: TStringField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryAux: TwwQuery;
    qryIDCUSTODIANTE: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dblkInvestimentoExit(Sender: TObject);
    procedure dDataOperExit(Sender: TObject);
    procedure dblkCarteiraInvestExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    function VerificaCampos:boolean;
    procedure LimpaCampos;
    procedure BuscaSaldos;

  public
    { Public declarations }
  end;

var
  frmOperRenFixa: TfrmOperRenFixa;
  fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend,
  fSdoMercado, fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv, fSdoIOFApu,
  fSdoAgio,fSdoQtdLibCustodia, fSaldoQTDCPMF: double;

implementation

uses
   uOperComum, uMensErro, uSistema, DBaseDados, uDataBase, UBibliotecaInvest,
   uRendaFixa, ULancContab;

{$R *.DFM}

procedure TfrmOperRenFixa.bbtnConfirmarClick(Sender: TObject);
var
  bCriaLancto : boolean;
  iPlanilha, iPlano, iDocumento, iIdOperacaoInvest, iIdHistCartinv : Integer;
  sMensErro, sTipoRecDesBol : String;
begin
    if not VerificaCampos then
       Exit;

    Try
       if not DtmBaseDados.dbBaseDados.InTransaction then
          DtmBaseDados.dbBaseDados.StartTransaction;

      // Inclui Dados na Tabela OPERACAOINVEST
      iIdOperacaoInvest := LeUltRegistro(Nil,'OPERACAOINVEST');
      QryIDOPERACAOINVEST.AsInteger := iIdOperacaoInvest;
      QryMOECODIGO.AsInteger        := pRPI.MOECODIGO;
      QryEMPRESAPROP.AsInteger      := Sistema.IdEmpresa;
      QryIDINVESTIMENTO.AsInteger   := QryInvestimentoIDINVESTIMENTO.AsInteger;
      QryIDCARTEIRAINVEST.AsInteger := QryCarteiraInvestIDCARTEIRAINVEST.AsInteger;
      QryIDTIPOINVEST.AsInteger     := 1;
      QryIDTIPOOPERACAO.AsInteger   := QryTipoOperacaoIDTIPOOPERACAO.AsInteger;
      QryDATAOPERACAO.AsDateTime    := dDataOper.Date;
      QryNUMDOCUMENTO.AsString      := edBoleta.Text;
      QryQTDEOPERACAO.AsFloat       := edQuantidade.Value;
      QryPRECOUNITOPERACAO.AsFloat  := edPUOper.Value;
      QryVLROPERACAO.AsFloat        := edValor.Value;
      QryDATAVENCOPER.AsDateTime    := dDataVenc.Date;
      QryIDFORCLI.AsInteger         := qryCustodianteIDCUSTODIANTE.AsInteger ;
      QryOBSERVACAO.AsString        := edObs.Text;
      QryIDLOTE.AsString            := qryBuscaLoteIDLOTE.AsString;
      QryIDPLANPREVCTBPATR.AsInteger:= qryBuscaLoteIDPLANPREVCTBPATR.AsInteger;
      QryIDCUSTODIANTE.AsInteger    := qryCustodianteIDCUSTODIANTE.AsInteger;

      qry.Post;
      qry.ApplyUpdates;
      // Inclui Dados na Tabela de Operacao, HISTCARTINV
      OperComum.LimpaParametros(qryInsHistCartinv);

      iIdHistCartinv := LeUltRegistro(Nil,'HISTCARTINV');
      qryInsHistCartinv.ParamByName('IDHISTCARTINV').AsInteger     := iIdHistCartinv;
      qryInsHistCartinv.ParamByName('IDTIPOINVEST').AsInteger      := 1;
      qryInsHistCartinv.ParamByName('IDOPERACAOINVEST').AsInteger  := iIdOperacaoInvest;
      qryInsHistCartinv.ParamByName('IDMODULO').AsInteger          := Sistema.IdModulo;
      qryInsHistCartinv.ParamByName('IDEMPRESAPROP').AsInteger     := Sistema.IdEmpresa;
      qryInsHistCartinv.ParamByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperacaoIDTIPOOPERACAO.AsInteger;
      qryInsHistCartinv.ParamByName('IDINVESTIMENTO').AsInteger    := QryInvestimentoIDINVESTIMENTO.AsInteger;
      qryInsHistCartinv.ParamByName('IDCARTEIRAINVEST').AsInteger  := QryCarteiraInvestIDCARTEIRAINVEST.AsInteger;
      qryInsHistCartinv.ParamByName('DATAMOVCARTINV').AsDateTime   := dDataOper.Date;
      qryInsHistCartinv.ParamByName('VLRMOVCARTINV').AsFloat       := edValor.Value;
      qryInsHistCartinv.ParamByName('SALDOVLRINVCART').AsFloat     := fSdoVlrInvCart;
      qryInsHistCartinv.ParamByName('SALDOQTDEINVCART').AsFloat    := fSdoQtdeInvCart;
      qryInsHistCartinv.ParamByName('HISTMOVCARTINV').AsString     := qryTipoOperacaoDESCTIPOOPERACAO.AsString;
      qryInsHistCartinv.ParamByName('NATURMOVCARTINV').AsString    := qryTipoOperacaoNATUREZAOPERACAO.AsString;
      qryInsHistCartinv.ParamByName('TIPMOVCARTINV').AsString      := 'OPE';
      qryInsHistCartinv.ParamByName('SALDOATU').AsFloat            := fSdoAtu;
      qryInsHistCartinv.ParamByName('SALDOCAR').AsFloat            := fSdoCar;
      qryInsHistCartinv.ParamByName('IDLOTE').AsString             := qryBuscaLoteIDLOTE.AsString;
      qryInsHistCartinv.ParamByName('SALDOAQUI').AsFloat           := fSdoAqui;
      qryInsHistCartinv.ParamByName('SALDOREND').AsFloat           := fSdoRend;
      qryInsHistCartinv.ParamByName('QTDEMOVINVCART').AsFloat      := edQuantidade.Value;
      qryInsHistCartinv.ParamByName('SALDOJUROS').AsFloat          := fSdoJur;
      qryInsHistCartinv.ParamByName('SALDOPREMIO').AsFloat         := fSdoPre;
      qryInsHistCartinv.ParamByName('SALDOVARIACAO').AsFloat       := fSdoVar;
      qryInsHistCartinv.ParamByName('SALDOIRPROV').AsFloat         := fSdoIRProv;
      qryInsHistCartinv.ParamByName('SALDOIRAPU').AsFloat          := fSdoIRApu;
      qryInsHistCartinv.ParamByName('SALDOIOFPROV').AsFloat        := fSdoIOFProv;
      qryInsHistCartinv.ParamByName('SALDOIOFAPU').AsFloat         := fSdoIOFApu;
      qryInsHistCartinv.ParamByName('SALDOAGIO').AsFloat           := fSdoAgio;
      qryInsHistCartinv.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryBuscaLoteIDPLANPREVCTBPATR.AsInteger;
      qryInsHistCartinv.ExecSql;

      // Contabiliza
      bCriaLancto := True;
      iPlanilha := -1;
      iPlano    := -1;
      iDocumento:= -1;

      if OperComum.LancaOperRFRV(
            Sistema.IdEmpresa, Sistema.IdModulo, 1,
            QryInvestimentoIDINVESTIMENTO.AsInteger,
            QryTipoOperacaoIDTIPOOPERACAO.AsInteger,
            iIdOperacaoInvest,
            qryInvestimentoIDEMISSOR.AsInteger,
            qryCarteiraInvestIDCARTEIRAINVEST.AsInteger,
            pRPI.MOECODIGO,
            '',
            qryBuscaLoteIDLOTE.AsString,
            edBoleta.Text,
            qryTipoOperacaoDESCTIPOOPERACAO.AsString,
            '',
            sTipoRecDesBol, bCriaLancto,
            edValor.Value,
            edValor.Value,
            dDataOper.Date,
            dDataVenc.Date,
            iPlano, iPlanilha, iDocumento, sMensErro) <> 0 then
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
         Exit;
      end;

      qry.CommitUpdates;

      dtmBaseDados.dbBaseDados.Commit;

      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
      LimpaCampos;

   except
      on E: Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao  ...'+E.Message,
                'Mensagem do Sistema ',mtError,[mbOK],0);
         Exit;
      end;
   end;
  inherited;
end;

function TfrmOperRenFixa.VerificaCampos:boolean;
begin
   Result := True;
end;

procedure TfrmOperRenFixa.FormShow(Sender: TObject);
begin
  inherited;
   qry.Open;
   qryTipoOperacao.Open;
   qryCarteiraInvest.Open;
   qryInvestimento.Open;
   qryCustodiante.Open;
end;

procedure TfrmOperRenFixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryTipoOperacao.Close;
   qryCarteiraInvest.Close;
   qryInvestimento.Close;
   qryCustodiante.Close;
end;


procedure TfrmOperRenFixa.dblkInvestimentoExit(Sender: TObject);
begin
  inherited;
   if Trim(dblkInvestimento.Text) <> '' then
   begin
      OperComum.LimpaParametros(qryBuscaLote);
      qryBuscaLote.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      qryBuscaLote.ParamByName('DATAREF').AsString         := dDataOper.Text;
      qryBuscaLote.Open;
   end;
   BuscaSaldos;
end;

procedure TfrmOperRenFixa.LimpaCampos;
begin
   dDataOper.Text := '';
   dDataVenc.Text := '';
   dblkTipoOperacao.Text := '';
   dblkCarteiraInvest.Text := '';
   dblkCustodiante.Text := '';
   dblkInvestimento.Text := '';
   EdQuantidade.Text := '';
   edPuOper.Text := '';
   edValor.Text := '';
   edBoleta.Text := '';
   edObs.Text := '';
end;

procedure TfrmOperRenFixa.BuscaSaldos;
begin
   if (QryCarteiraInvestIDCARTEIRAINVEST.AsInteger <> 0) and
      (qryInvestimentoIDINVESTIMENTO.AsInteger <> 0) and
      (Trim(qryBuscaLoteIDLOTE.AsString) <> '') and
      (Trim(DateToStr(dDataOper.Date)) <> '') then
   begin
      //AL_1
      OperComum.BuscaTodosSaldosInvestLote(
         QryCarteiraInvestIDCARTEIRAINVEST.AsInteger,
         0,
         qryInvestimentoIDINVESTIMENTO.AsInteger,
         9999999,-1,
         qryBuscaLoteIDLOTE.AsString,
         DateToStr(dDataOper.Date),-1,
         fSdoQtdeInvCart, fSdoVlrInvCart, fSdoAtu, fSdoCar, fSdoAqui, fSdoRend,
         fSdoMercado, fSdoVar, fSdoJur, fSdoPre, fSdoIRProv, fSdoIRApu, fSdoIOFProv,
         fSdoIOFApu, fSdoAgio,fSdoQtdLibCustodia, fSaldoQTDCPMF);

      EdQuantidade.Value := fSdoQtdeInvCart;
      edValor.Value      := fSdoVlrInvCart;
      edPuOper.Value     := OperComum.DivValorZero(fSdoVlrInvCart,fSdoQtdeInvCart);
   end;
end;

procedure TfrmOperRenFixa.dDataOperExit(Sender: TObject);
begin
  inherited;
   BuscaSaldos;
end;

procedure TfrmOperRenFixa.dblkCarteiraInvestExit(Sender: TObject);
begin
  inherited;
   BuscaSaldos;
end;

procedure TfrmOperRenFixa.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   LimpaCampos;
   if dDataOper.Canfocus then
      dDataOper.SetFocus;
end;

procedure TfrmOperRenFixa.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      sbtnApagar.Enabled := True;
      // Preencher os campos
      dDataOper.Text := MontaSelect.ValoresChave[11];
      dDataVenc.Text := MontaSelect.ValoresChave[12];

      dblkTipoOperacao.LookupValue := MontaSelect.ValoresChave[13];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCTIPOOPERACAO FROM TIPOOPERACAO WHERE IDTIPOOPERACAO = ' + MontaSelect.ValoresChave[13]);
      qryAux.Open;
      dblkTipoOperacao.Text := qryAux.FieldByName('DESCTIPOOPERACAO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkTipoOperacao, qryTipoOperacao);

      dblkCarteiraInvest.LookupValue := MontaSelect.ValoresChave[4];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCCARTINVEST FROM CARTEIRAINVEST WHERE IDCARTEIRAINVEST = ' + MontaSelect.ValoresChave[4]);
      qryAux.Open;
      dblkCarteiraInvest.Text := qryAux.FieldByName('DESCCARTINVEST').AsString;
      OperComum.PosicionaWWLookUpQry(dblkCarteiraInvest, qryCarteiraInvest);

      dblkCustodiante.LookupValue := MontaSelect.ValoresChave[7];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT SGLCUSTODIANTE FROM CUSTODIANTE WHERE IDCUSTODIANTE = ' + MontaSelect.ValoresChave[7]);
      qryAux.Open;
      dblkCustodiante.Text := qryAux.FieldByName('SGLCUSTODIANTE').AsString;
      OperComum.PosicionaWWLookUpQry(dblkCustodiante, qryCustodiante);

      dblkInvestimento.LookupValue := MontaSelect.ValoresChave[3];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDINVESTIMENTO = ' + MontaSelect.ValoresChave[3]);
      qryAux.Open;
      dblkInvestimento.Text := qryAux.FieldByName('DESCINVESTIMENTO').AsString;
      OperComum.PosicionaWWLookUpQry(dblkInvestimento, qryInvestimento);

      edQuantidade.Text := MontaSelect.ValoresChave[6];
      edPuOper.Text     := MontaSelect.ValoresChave[9];
      edValor.Text      := MontaSelect.ValoresChave[5];
      edBoleta.Text     := MontaSelect.ValoresChave[8];
      edObs.Text        := MontaSelect.ValoresChave[10];
   end
   else
      sbtnApagar.Enabled := False;
end;

procedure TfrmOperRenFixa.sbtnApagarClick(Sender: TObject);
var
   iExercicio,iPeriodo,iEmpresa: Integer;
   wMensContab : String;
begin
  inherited;
   if pRPI.FLGCONTABILIZA <> 'N' then
   begin
      iEmpresa := Sistema.IdEmpresa;
      iExercicio := 0;
      iPeriodo := 0;
      if TestaPeriodo(True, 'BASEDADOS', MontaSelect.ValoresChave[12], IntToStr(Sistema.IdModulo),
                      iExercicio, iPeriodo, iEmpresa, wMensContab) <> 0 Then
      begin
         MsgDlg('Período contábil bloqueado.','Mensagem do Sistema',mtWarning,[mbOk],0);
         Exit;
      end;
   end;

   try
      if not DtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.StartTransaction;

      // Deleta Histcartinv
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE FROM HISTCARTINV WHERE IDHISTCARTINV = ' + MontaSelect.ValoresChave[0]);
      qryAux.ExecSql;

      // Deleta Operacaoinvest

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('DELETE FROM OPERACAOINVEST WHERE IDOPERACAOINVEST = ' + MontaSelect.ValoresChave[14]);
      qryAux.ExecSql;

      // Limpa Contabilidade
      // Exclui Lançamentos Contábeis da Planilha sem excluir a Planilha
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DISTINCT PLANO FROM LANCAMENTO WHERE PLNCODIGO = ' + MontaSelect.ValoresChave[1]);
      qryAux.Open;
      if ExcluiLanc(False,
                    StrToInt(MontaSelect.ValoresChave[1]),
                    'BaseDados',
                    IntToStr(Sistema.IdModulo),
                    qryAux.FieldByName('PLANO').AsInteger,
                    Sistema.IdEmpresa,
                    Sistema.IdUsuario,
                    False,
                    0,
                    OperComum.GetMascaraPlano(qryAux.FieldByName('PLANO').AsInteger)) = -1 then
         Raise Exception.Create('Não foi Possível Excluir os Lançamentos Contábeis da Planilha ' + MontaSelect.ValoresChave[1]);

      // Limpa Financeiro
      if not RendaFixa.ExcluiFinanceiroRenFix(StrToInt(MontaSelect.ValoresChave[2])) then
         Raise Exception.Create('Não foi Possível Excluir os Lançamentos Financeiros ');

      dtmBaseDados.dbBaseDados.Commit;

      MsgDlg('Operação concluída com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);
      LimpaCampos;

   except
      on E: Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao  ...',
                'Mensagem do Sistema ',mtError,[mbOK],0);
         Exit;
      end;
   end;

end;

end.
