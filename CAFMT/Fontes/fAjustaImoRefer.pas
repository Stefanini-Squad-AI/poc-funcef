unit fAjustaImoRefer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, ComCtrls, Gauges,
  Db, DBTables, Wwquery, CMDateTimePicker, wwdblook, wwdbdatetimepicker;

type
  TfrmAjustaImoRefer = class(TfrmSairAjuda)
    updImoCustos: TUpdateSQL;
    qryImoCustos: TwwQuery;
    qryImoCustosPLACA: TFloatField;
    qryImoCustosIDBEM: TFloatField;
    qryImoCustosIDPESSOA: TFloatField;
    qryImoCustosIDGRUPO: TFloatField;
    qryImoCustosVALORG: TFloatField;
    qryImoCustosCMBEM: TFloatField;
    qryImoCustosDEPLANC: TFloatField;
    qryImoCustosTAXADEP: TFloatField;
    qryImoCustosVALAQUIS: TFloatField;
    qryImoMestre: TwwQuery;
    qryImoMestreVALAQUIS: TFloatField;
    updReset: TUpdateSQL;
    qryReset: TwwQuery;
    qryResetPLACA: TFloatField;
    qryResetIDBEM: TFloatField;
    qryResetIDPESSOA: TFloatField;
    qryResetIDGRUPO: TFloatField;
    qryResetVALORG: TFloatField;
    qryResetCMBEM: TFloatField;
    qryResetDEPLANC: TFloatField;
    qryResetTAXADEP: TFloatField;
    qryGrupoIni: TwwQuery;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    updReavaliacao: TUpdateSQL;
    qryReavaliacao: TwwQuery;
    qryReavaliacaoIDBEM: TFloatField;
    qryReavaliacaoIDPESSOA: TFloatField;
    qryReavaliacaoIDREAVALIACAO: TFloatField;
    qryReavaliacaoDEPLANC: TFloatField;
    updImoveis: TUpdateSQL;
    qryImoveis: TwwQuery;
    qryImoveisPLACA: TFloatField;
    qryImoveisIDBEM: TFloatField;
    qryImoveisIDPESSOA: TFloatField;
    qryImoveisIDGRUPO: TFloatField;
    qryImoveisVALORG: TFloatField;
    qryImoveisDEPLANC: TFloatField;
    qryImoveisVALDEPBEM: TFloatField;
    qryImoveisVALDEPREAV: TFloatField;
    qryImoveisVALCTB: TFloatField;
    qryImoveisVALAQUIS: TFloatField;
    qryImoveisCMBEM: TFloatField;
    qrySldCtbGrp: TwwQuery;
    qrySldCtbGrpVALCTB: TFloatField;
    qryMovBem: TwwQuery;
    qryMovBemVALOFI: TFloatField;
    qryMovBemTAXADEP: TFloatField;
    qryImovelMestre: TwwQuery;
    qryImovelMestreIMENOME: TStringField;
    qryImovelMestreIDIMOVEL: TFloatField;
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    PageControl1: TPageControl;
    TabAquisicao: TTabSheet;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edValAquis: TRealEdit;
    edDataBase1: TCMDateTimePicker;
    cmbImovelMestre: TwwDBLookupCombo;
    cmbGrupo: TwwDBLookupCombo;
    bbtnAquisicao: TBitBtn;
    bbtnCancAquisicao: TBitBtn;
    bbtnReset: TBitBtn;
    TabSldCtb: TTabSheet;
    Label2: TLabel;
    Grupo: TLabel;
    Label4: TLabel;
    edDataBase: TCMDateTimePicker;
    cmbGrupoIni: TwwDBLookupCombo;
    edSldCtb: TRealEdit;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    edFiltro: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnAquisicaoClick(Sender: TObject);
    procedure bbtnCancAquisicaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnResetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function RegistraMovimentacao(iBem, iEmpresaProp, iTipoMovimentacao, iPlanilha,
                                  iEstorno, iModulo: longint; dDataMovimentacao: TDate;
                                  bMostraMsg: boolean) : Integer;
    function RegistraValorMovimentacao(iSeqHist : Integer;
                                       fValOfi,fValFis,fValGer : Extended;
                                       bMostraMsg : Boolean) : Boolean;
    function RegistraDeprecReaval(iSeqHist, iIdMov : Integer;
                                  dDataUltDep : tDateTime) : Boolean;
    function RegistraReaval(iSeqHist : integer; fTaxaDep, fValLaudo, fValOrgAnt : Double;
                            sObs : string; bMostraMsg : Boolean) : Boolean;
  end;

var
  frmAjustaImoRefer: TfrmAjustaImoRefer;

implementation

uses
   uSistema, dBaseDados, uDatabase, dAtivoFixo, uMensErro;

{$R *.DFM}

procedure TfrmAjustaImoRefer.FormCreate(Sender: TObject);
begin
   inherited;
   qryImovelMestre.Prepare;
   qryImoCustos.Prepare;
   qryImoMestre.Prepare;
   qryImoveis.Prepare;
   qryReavaliacao.Prepare;
   qrySldCtbGrp.Prepare;
   qryMovBem.Prepare;
   qryGrupoIni.Prepare;
   qryGrupoIni.Open;
   qryImovelMestre.Open;
   edDataBase1.Date  := strtodate('30/09/1999');
   edDataBase.Date   := strtodate('31/10/2000');
   TabAquisicao.TabVisible := False;
   PageControl1.ActivePage := TabSldCtb;
end;
//========================================================================================
procedure TfrmAjustaImoRefer.bbtnConfirmarClick(Sender: TObject);
var
   bTransacao : boolean;
   fProporcao, fValDep, fValDif,
   fPropDepBem, fPropDepReav,
   fValDepBem, fValDepReav   : Double;
   iSeqHist : Integer;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   Screen.Cursor := crSQLWait;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Incluir Filtragem
   //-------------------------------------------------------------------------------------
   qrySldCtbGrp.Close;
   qryImoveis.Close;
   if (edFiltro.Text <> '') then
   begin
      qrySldCtbGrp.SQL.Strings[205] := 'AND (UPPER(B.DESBEM) LIKE ' + #39 + '%' + AnsiUpperCase(edFiltro.Text) + '%' + #39 + ')';
      qryImoveis.SQL.Strings[213]   := 'AND (UPPER(B.DESBEM) LIKE ' + #39 + '%' + AnsiUpperCase(edFiltro.Text) + '%' + #39 + ')';
   end else
   begin
      qrySldCtbGrp.SQL.Strings[205] := ' ';
      qryImoveis.SQL.Strings[213]   := ' ';
   end;
   //-------------------------------------------------------------------------------------
   // Posiciona os Imóveis do Grupo Selecionado
   //-------------------------------------------------------------------------------------
   qryImoveis.ParamByName('PIDGRUPO').AsInteger  := qryGrupoIniIDGRUPO.AsInteger;
   qryImoveis.ParamByName('PDATAMOV').AsDateTime := edDataBase.Date;
   qryImoveis.Open;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula o Saldo Contábil do Grupo Contábil
   //-------------------------------------------------------------------------------------
   qrySldCtbGrp.ParamByName('PIDGRUPO').AsInteger  := qryGrupoIniIDGRUPO.AsInteger;
   qrySldCtbGrp.ParamByName('PDATAMOV').AsDateTime := edDataBase.Date;
   qrySldCtbGrp.Open;
   fValDif := qrySldCtbGrpVALCTB.AsCurrency - edSldCtb.Value;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryImoveis.RecordCount;
   try
      while not qryImoveis.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Processando Placa ' + qryImoveisPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Calcula a proporção
         //-------------------------------------------------------------------------------
         fProporcao := qryImoveisVALCTB.AsCurrency / qrySldCtbGrpVALCTB.AsCurrency;
         fValDep := strtofloat(FormatFloat('###########0.0000',((fValDif * fProporcao * 10000) / 10000)));

         fPropDepBem  := qryImoveisVALDEPBEM.AsCurrency /  (qryImoveisVALDEPBEM.AsCurrency + qryImoveisVALDEPREAV.AsCurrency);
         fPropDepReav := qryImoveisVALDEPREAV.AsCurrency / (qryImoveisVALDEPBEM.AsCurrency + qryImoveisVALDEPREAV.AsCurrency);

         fValDepBem  := strtofloat(FormatFloat('###########0.0000',((fValDep * fPropDepBem  * 10000) / 10000)));
         fValDepReav := strtofloat(FormatFloat('###########0.0000',((fValDep * fPropDepReav * 10000) / 10000)));
         //-------------------------------------------------------------------------------
         // Aplica a diferença no campo DEPLANC da tabela BEM
         //-------------------------------------------------------------------------------
         qryImoveis.Edit;
         qryImoveisDEPLANC.AsCurrency := qryImoveisDEPLANC.AsCurrency + fValDep;
         qryImoveis.Post;
         qryImoveis.ApplyUpdates;
         //-------------------------------------------------------------------------------
         // Aplica a diferença no campo DEPLANC da tabela REAVALIACAO
         //-------------------------------------------------------------------------------
         if fValDepReav <> 0 then
         begin
            qryReavaliacao.Close;
            qryReavaliacao.ParamByName('PIDBEM').AsInteger    := qryImoveisIDBEM.AsInteger;
            qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := qryImoveisIDPESSOA.AsInteger;
            qryReavaliacao.Open;
            qryReavaliacao.Edit;
            qryReavaliacaoDEPLANC.AsCurrency := qryReavaliacaoDEPLANC.AsCurrency + fValDepReav;
            qryReavaliacao.Post;
            qryReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentação - Depreciação do Custo
         //-------------------------------------------------------------------------------
         iSeqHist := RegistraMovimentacao(qryImoveisIDBEM.AsInteger,
                                          Sistema.IdEmpresa,43,-1,-1,
                                          Sistema.IdModulo,
                                          edDataBase.Date,True);
         RegistraValorMovimentacao(iSeqHist, fValDepBem, 0, 0, True);
         //-------------------------------------------------------------------------------
         // Registra a Movimentação - Depreciação da Reavaliacao
         //-------------------------------------------------------------------------------
         if fValDepReav <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(qryImoveisIDBEM.AsInteger,
                                             Sistema.IdEmpresa,47,-1,-1,
                                             Sistema.IdModulo,
                                             edDataBase.Date,True);
            RegistraValorMovimentacao(iSeqHist, fValDepReav, 0, 0, True);
            RegistraDeprecReaval(iSeqHist, qryReavaliacaoIDREAVALIACAO.AsInteger,
                                 edDataBase.Date);
         end;
         //-------------------------------------------------------------------------------
         qryImoveis.Next;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      if bTransacao then
         CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      Screen.Cursor := crDefault;
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Processamento Abortado.','Erro',mtError,[mbOk],0) ;
   end;
   bbtnConfirmar.Enabled := True;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaImoRefer.bbtnCancelarClick(Sender: TObject);
var
   bTransacao : boolean;
   fValDepBem, fValDepReav   : Double;

begin
   inherited;
   bbtnCancelar.Enabled := False;
   Screen.Cursor := crSQLWait;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Posiciona os Imóveis do Grupo Selecionado
   //-------------------------------------------------------------------------------------
   qryImoveis.Close;
   qryImoveis.ParamByName('PIDGRUPO').AsInteger  := qryGrupoIniIDGRUPO.AsInteger;
   qryImoveis.ParamByName('PDATAMOV').AsDateTime := edDataBase.Date;
   qryImoveis.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryImoveis.RecordCount;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      while not qryImoveis.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Removendo - Processando Placa ' + qryImoveisPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoveisIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoveisIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 43;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase.Date;
         qryMovBem.Open;
         fValDepBem := qryMovBemVALOFI.AsFloat;
         //-------------------------------------------------------------------------------
         // Aplica a diferença no campo DEPLANC da tabela BEM
         //-------------------------------------------------------------------------------
         qryImoveis.Edit;
         qryImoveisDEPLANC.AsCurrency := qryImoveisDEPLANC.AsCurrency - fValDepBem;
         qryImoveis.Post;
         qryImoveis.ApplyUpdates;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - Reavaliacao
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoveisIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoveisIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 47;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
         begin
            fValDepReav := qryMovBemVALOFI.AsCurrency;
            qryReavaliacao.Close;
            qryReavaliacao.ParamByName('PIDBEM').AsInteger    := qryImoveisIDBEM.AsInteger;
            qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := qryImoveisIDPESSOA.AsInteger;
            qryReavaliacao.Open;
            qryReavaliacao.Edit;
            qryReavaliacaoDEPLANC.AsCurrency := qryReavaliacaoDEPLANC.AsCurrency - fValDepReav;
            qryReavaliacao.Post;
            qryReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryImoveis.Next;
      end;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Removendo os Lancamentos';
      Application.ProcessMessages;
      with dtmAtivoFixo do
      begin
         sqlScript.Script.Text := ' DELETE FROM VALORMOVIMENTACAO VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (43,47)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(edDataBase.Date) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ' +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM) )); '+
                                  ' DELETE FROM HISTORICOMOVIMENTACAO HMOV' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (43,47)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + datetostr(edDataBase.Date) + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ' +
                                  '                    AND (HMOV.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM) )); ';
         sqlScript.Execute;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      if bTransacao then
         CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      Screen.Cursor := crDefault;
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Processamento Abortado.','Erro',mtError,[mbOk],0) ;
   end;
   bbtnCancelar.Enabled := True;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaImoRefer.bbtnAquisicaoClick(Sender: TObject);
var
   bTransacao : boolean;
   fValDifMestre, fValDif,
   fProporcao, fPropBem,
   fValBem, fValCmBem, fValDepLanc,
   fNovaTaxaDep,
   fNovoCustoCorr : Double;
   iSeqHist : Integer;

begin
   inherited;
   bbtnAquisicao.Enabled := False;
   Screen.Cursor := crSQLWait;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Calcula o Custo Total da Aquisicao Importada do Imovel Mestre
   //-------------------------------------------------------------------------------------
   qryImoMestre.Close;
   qryImoMestre.ParamByName('PIDGRUPO').AsInteger     := qryGrupoIniIDGRUPO.AsInteger;
   qryImoMestre.ParamByName('PIDIMOMESTRE').AsInteger := qryImovelMestreIDIMOVEL.AsInteger;
   qryImoMestre.ParamByName('PDATAMOV').AsDateTime    := edDataBase1.Date;
   qryImoMestre.Open;
   Application.ProcessMessages;
   fValDifMestre := edValAquis.Value - qryImoMestreVALAQUIS.AsCurrency;
   //-------------------------------------------------------------------------------------
   // Calcula os Custos Corrigidos por Imóvel
   //-------------------------------------------------------------------------------------
   qryImoCustos.Close;
   qryImoCustos.ParamByName('PIDGRUPO').AsInteger     := qryGrupoIniIDGRUPO.AsInteger;
   qryImoCustos.ParamByName('PIDIMOMESTRE').AsInteger := qryImovelMestreIDIMOVEL.AsInteger;
   qryImoCustos.ParamByName('PDATAMOV').AsDateTime    := edDataBase1.Date;
   qryImoCustos.Open;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryImoCustos.RecordCount;
   try
      while not qryImoCustos.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Processando Placa ' + qryImoCustosPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Calcula a proporção
         //-------------------------------------------------------------------------------
         fProporcao := qryImoCustosVALAQUIS.AsCurrency / qryImoMestreVALAQUIS.AsCurrency;
         fValDif    := strtofloat(FormatFloat('###########0.0000',((fValDifMestre * fProporcao * 10000) / 10000)));

         fPropBem   := qryImoCustosVALORG.AsCurrency / (qryImoCustosVALORG.AsCurrency +
                                                        qryImoCustosCMBEM.AsCurrency);

         fValBem     := strtofloat(FormatFloat('###########0.0000',((fValDif * fPropBem   * 10000) / 10000)));
         fValCmBem   := strtofloat(FormatFloat('###########0.0000',(((fValDif - fValBem) * 10000) / 10000)));
         fValDepLanc := strtofloat(FormatFloat('###########0.0000',((fValDif * 10000) / 10000)));
         //-------------------------------------------------------------------------------
         // Calcula o novo total depreciado
         //-------------------------------------------------------------------------------
         fNovoCustoCorr := (qryImoCustosVALORG.AsCurrency +
                            qryImoCustosCMBEM.AsCurrency + fValBem + fValCmBem);
         fNovaTaxaDep := ((qryImoCustosVALORG.AsCurrency + qryImoCustosCMBEM.AsCurrency)) *
                         (qryImoCustosTAXADEP.AsFloat / 100);
         fNovaTaxaDep := fNovaTaxaDep / fNovoCustoCorr * 100;
         fNovaTaxaDep := strtofloat(FormatFloat('###########0.0000',((fNovaTaxaDep * 10000) / 10000)));
         //-------------------------------------------------------------------------------
         // Registra a Movimentação - Custo de Aquisicao
         //-------------------------------------------------------------------------------
         if fValBem <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(qryImoCustosIDBEM.AsInteger,
                                             Sistema.IdEmpresa,41,-1,-1,
                                             Sistema.IdModulo,
                                             edDataBase1.Date,True);
            RegistraValorMovimentacao(iSeqHist, fValBem, 0, 0, True);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentação - Corr.Monetária da Aquisição
         //-------------------------------------------------------------------------------
         if fValCmBem <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(qryImoCustosIDBEM.AsInteger,
                                             Sistema.IdEmpresa,42,-1,-1,
                                             Sistema.IdModulo,
                                             edDataBase1.Date,True);
            RegistraValorMovimentacao(iSeqHist, fValCmBem, 0, 0, True);
         end;
         //-------------------------------------------------------------------------------
         // Registra a Movimentação - Corr.Monetária da Aquisição
         //-------------------------------------------------------------------------------
         if fValDepLanc <> 0 then
         begin
            iSeqHist := RegistraMovimentacao(qryImoCustosIDBEM.AsInteger,
                                             Sistema.IdEmpresa,43,-1,-1,
                                             Sistema.IdModulo,
                                             edDataBase1.Date,True);
            RegistraValorMovimentacao(iSeqHist, fValDepLanc, 0, 0, True);
            RegistraReaval(iSeqHist, qryImoCustosTAXADEP.asFloat, 0, 0, '', True);
         end;
         //-------------------------------------------------------------------------------
         // Aplica as diferenças na tabela BEM
         //-------------------------------------------------------------------------------
         qryImoCustos.Edit;
         qryImoCustosVALORG.AsCurrency  := qryImoCustosVALORG.AsCurrency + fValBem;
         qryImoCustosCMBEM.AsCurrency   := qryImoCustosCMBEM.AsCurrency + fValCmBem;
         qryImoCustosDEPLANC.AsCurrency := qryImoCustosDEPLANC.AsCurrency + fValDepLanc;
         qryImoCustosTAXADEP.AsFloat    := fNovaTaxaDep;
         qryImoCustos.Post;
         qryImoCustos.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryImoCustos.Next;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      if bTransacao then
         CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      Screen.Cursor := crDefault;
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Processamento Abortado.','Erro',mtError,[mbOk],0);
   end;
   qryImoMestre.Close;
   qryImoCustos.Close;
   bbtnAquisicao.Enabled := True;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaImoRefer.bbtnCancAquisicaoClick(Sender: TObject);
var
   bTransacao : boolean;
   fValBem, fValCmBem, fValDepLanc : Double;

begin
   inherited;
   bbtnCancAquisicao.Enabled := False;
   Screen.Cursor := crSQLWait;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryImoCustos.Close;
   qryImoCustos.ParamByName('PIDGRUPO').AsInteger     := qryGrupoIniIDGRUPO.AsInteger;
   qryImoCustos.ParamByName('PIDIMOMESTRE').AsInteger := qryImovelMestreIDIMOVEL.AsInteger;
   qryImoCustos.ParamByName('PDATAMOV').AsDateTime    := edDataBase1.Date;
   qryImoCustos.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryImoCustos.RecordCount;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      while not qryImoCustos.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Removendo - Processando Placa ' + qryImoCustosPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - Aquisição
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoCustosIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoCustosIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 01;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
         begin
            fValBem := qryMovBemVALOFI.AsFloat;
            qryImoCustos.Edit;
            qryImoCustosVALORG.AsCurrency := fValBem;
            qryImoCustos.Post;
            qryImoCustos.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - CM Aquisição
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoCustosIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoCustosIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 15;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
         begin
            fValCmBem := qryMovBemVALOFI.AsCurrency;
            qryImoCustos.Edit;
            qryImoCustosCMBEM.AsCurrency := fValCmBem;
            qryImoCustos.Post;
            qryImoCustos.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - Depreciacao
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoCustosIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoCustosIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 17;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
         begin
            fValDepLanc := qryMovBemVALOFI.AsCurrency;
            qryImoCustos.Edit;
            qryImoCustosDEPLANC.AsCurrency := fValDepLanc;
            qryImoCustos.Post;
            qryImoCustos.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - Taxa de Depreciacao
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryImoCustosIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryImoCustosIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 43;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if (not qryMovBem.IsEmpty) then
            if (not qryMovBemTAXADEP.IsNull) then
            begin
               qryImoCustos.Edit;
               qryImoCustosTAXADEP.AsFloat := qryMovBemTAXADEP.AsFloat;
               qryImoCustos.Post;
               qryImoCustos.ApplyUpdates;
            end;
         //-------------------------------------------------------------------------------
         qryImoCustos.Next;
      end;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Removendo os Lancamentos';
      Application.ProcessMessages;
      with dtmAtivoFixo do
      begin
         sqlScript.Script.Text := ' DELETE FROM REAVAL VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        IMOVELXBEM IXB,' +
                                  '                        IMOVEL I '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO = 43) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataBase1.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ') ' +
                                  '                    AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ' +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM)           ' +
                                  '                    AND (B.IDBEM      = IXB.IDBEM)     ' +
                                  '                    AND (B.IDPESSOA   = IXB.IDPESSOA)  ' +
                                  '                    AND (IXB.IDIMOVEL = I.IDIMOVEL) ));' +
                                  ' DELETE FROM VALORMOVIMENTACAO VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        IMOVELXBEM IXB,' +
                                  '                        IMOVEL I '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (41,42,43)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataBase1.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ') ' +
                                  '                    AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ' +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM)'+
                                  '                    AND (B.IDBEM      = IXB.IDBEM)     ' +
                                  '                    AND (B.IDPESSOA   = IXB.IDPESSOA)  ' +
                                  '                    AND (IXB.IDIMOVEL = I.IDIMOVEL) ));' +
                                  ' DELETE FROM DEPRECIACAOREAVAL VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        IMOVELXBEM IXB,' +
                                  '                        IMOVEL I '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO = 47)' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataBase1.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ') ' +
                                  '                    AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ' +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM)'+
                                  '                    AND (B.IDBEM = IXB.IDBEM)     ' +
                                  '                    AND (B.IDPESSOA = IXB.IDPESSOA)  ' +
                                  '                    AND (IXB.IDIMOVEL = I.IDIMOVEL) ));' +
                                  ' DELETE FROM HISTORICOMOVIMENTACAO HMOV' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        IMOVELXBEM IXB,' +
                                  '                        IMOVEL I '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (41,42,43)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataBase1.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (I.IDIMOVELMESTRE = ' + qryImovelMestreIDIMOVEL.AsString + ') ' +
                                  '                    AND (B.IDGRUPO = ' + qryGrupoIniIDGRUPO.AsString + ') ' +
                                  '                    AND (HMOV.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM) ' +
                                  '                    AND (B.IDBEM      = IXB.IDBEM)     ' +
                                  '                    AND (B.IDPESSOA   = IXB.IDPESSOA)  ' +
                                  '                    AND (IXB.IDIMOVEL = I.IDIMOVEL) ));' ;
         sqlScript.Execute;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      if bTransacao then
         CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      Screen.Cursor := crDefault;
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Processamento Abortado.','Erro',mtError,[mbOk],0);
   end;
   qryImoCustos.Close;
   bbtnCancAquisicao.Enabled := True;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaImoRefer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryReset.Close;
   qryImovelMestre.Close;
   qryImoCustos.Close;
   qryImoMestre.Close;
   qryImoveis.Close;
   qrySldCtbGrp.Close;
   qryGrupoIni.Close;
   qryMovBem.Close;
   qryReavaliacao.Close;
   qryReset.UnPrepare;
   qryImovelMestre.UnPrepare;
   qryImoCustos.UnPrepare;
   qryImoMestre.UnPrepare;
   qryReavaliacao.UnPrepare;
   qryImoveis.UnPrepare;
   qrySldCtbGrp.UnPrepare;
   qryGrupoIni.UnPrepare;
   qryMovBem.UnPrepare;
end;
//========================================================================================
function TfrmAjustaImoRefer.RegistraMovimentacao(iBem, iEmpresaProp, iTipoMovimentacao, iPlanilha,
                                                iEstorno, iModulo: longint; dDataMovimentacao: TDate;
                                                bMostraMsg: boolean) : Integer;
var
   iMovimentacao           : LongInt;
   qryRegistraMovimentacao : TwwQuery;
   bTransacao              : Boolean;

begin
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   iMovimentacao           := LeUltRegistro(nil, 'HISTORICOMOVIMENTACAO');
   qryRegistraMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraMovimentacao);
   //-------------------------------------------------------------------------------------
   try
      with qryRegistraMovimentacao do
      begin
         Close;
         ParamByName('MOVIMENTACAO').asInteger     := iMovimentacao;
         ParamByName('BEM').asInteger              := iBem;
         ParamByName('EMPRESAPROP').asInteger      := iEmpresaProp;
         ParamByName('TIPOMOVIMENTACAO').asInteger := iTipoMovimentacao;
         ParamByName('MODULO').asInteger           := iModulo;
         //-------------------------------------------------------------------------------
         if iEstorno = -1 then
            ParamByName('ESTORNO').Clear
         else
            ParamByName('ESTORNO').asInteger        := iEstorno;
         //-------------------------------------------------------------------------------
         if iPlanilha = -1 then
            ParamByName('PLANILHA').Clear
         else
            ParamByName('PLANILHA').asInteger       := iPlanilha;
         //-------------------------------------------------------------------------------
         ParamByName('DATAMOVIMENTACAO').asDateTime := dDataMovimentacao;
         //-------------------------------------------------------------------------------
         ExecSQL;
         if bTransacao then
            CommitTransacao;
         result := iMovimentacao;
      end;
   //-------------------------------------------------------------------------------------
   except
      if bTransacao then
         RollBackTransacao;
      if bMostraMsg then
         Raise;
      result := -1;
   end;
end;
//========================================================================================
Function TfrmAjustaImoRefer.RegistraValorMovimentacao(iSeqHist : Integer;
                                                     fValOfi,fValFis,fValGer : Extended;
                                                     bMostraMsg : Boolean) : Boolean;
var
   qryValorMovimentacao : TwwQuery;
   bTransacao           : Boolean;

begin
   if fValOfi <> 0 then
   begin
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end else
         bTransacao := False;
      //----------------------------------------------------------------------------------
      qryValorMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraValorMovimentacao);
      //----------------------------------------------------------------------------------
      try
         with qryValorMovimentacao do
         begin
            ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
            ParamByName('PVALOFI').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValOfi * 100) / 100)));
            ParamByName('PVALGER').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValGer * 100) / 100)));
            ParamByName('PVALFIS').AsCurrency := strtofloat(FormatFloat('###########0.00',((fValFis * 100) / 100)));
            ExecSQL;
            //----------------------------------------------------------------------------
            if bTransacao then
               CommitTransacao;
            Result := True;
         end;
      //----------------------------------------------------------------------------------
      except
         if bTransacao then
            RollBackTransacao;
         if bMostraMsg then
            Raise;
         Result := False;
      end;
   end else
   begin
      result := True;
   end;
end;
//========================================================================================
function TfrmAjustaImoRefer.RegistraDeprecReaval(iSeqHist, iIdMov : Integer; dDataUltDep : tDateTime) : Boolean;
begin
   try
      dtmAtivoFixo.qryDeprecReav.ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
      dtmAtivoFixo.qryDeprecReav.ParamByName('PIDREAVALIACAO').AsInteger  := iIdMov;
      dtmAtivoFixo.qryDeprecReav.ParamByName('PDATAULTDEP').AsDateTime    := dDataUltDep;
      dtmAtivoFixo.qryDeprecReav.ExecSQL;
      result := True;
   except
      result := False;
   end;
end;
//========================================================================================
Function TfrmAjustaImoRefer.RegistraReaval(iSeqHist:integer; fTaxaDep,fValLaudo,fValOrgAnt:Double;
                                   sObs : string; bMostraMsg : Boolean) : Boolean;
var
   qryReaval  : TwwQuery;

begin
   qryReaval := TwwQuery(dtmAtivoFixo.qryRegistraReaval);
   //-------------------------------------------------------------------------------------
   try
      with qryReaval do
      begin
         ParamByName('PIDMOVIMENTACAO').AsInteger := iSeqHist;
         ParamByName('PTAXADEPORG').AsFloat       := fTaxaDep;
         ParamByName('PVALORGLAUDO').AsFloat      := fValLaudo;
         ParamByName('PVALORGANT').AsFloat        := fValOrgAnt;
         ParamByName('POBS').AsString             := sObs;
         ExecSQL;
      end;
      Result := True;
   //-------------------------------------------------------------------------------------
   except
      if bMostraMsg then
         Raise;
      Result := False;
   end;
end;
//========================================================================================
procedure TfrmAjustaImoRefer.bbtnResetClick(Sender: TObject);
var
   bTransacao : boolean;
   fValBem, fValCmBem, fValDepLanc : Double;

begin
   inherited;
   bbtnReset.Enabled := False;
   Screen.Cursor := crSQLWait;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryReset.Open;
   //-------------------------------------------------------------------------------------
   prgBar.Progress := 0;
   prgbar.MaxValue := qryReset.RecordCount;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
      bTransacao := False;
   //-------------------------------------------------------------------------------------
   try
      while not qryReset.EOF do
      begin
         prgBar.Progress := prgBar.Progress + 1;
         lblStatus.Caption := 'Removendo - Processando Placa ' + qryResetPLACA.AsString;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - Aquisição
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryResetIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryResetIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 01;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
         begin
            fValBem := qryMovBemVALOFI.AsFloat;
            qryReset.Edit;
            qryResetVALORG.AsCurrency := fValBem;
            qryReset.Post;
            qryReset.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - CM Aquisição
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryResetIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryResetIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 15;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
         begin
            fValCmBem := qryMovBemVALOFI.AsCurrency;
            qryReset.Edit;
            qryResetCMBEM.AsCurrency := fValCmBem;
            qryReset.Post;
            qryReset.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - Depreciacao
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryResetIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryResetIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 17;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if not qryMovBem.IsEmpty then
         begin
            fValDepLanc := qryMovBemVALOFI.AsCurrency;
            qryReset.Edit;
            qryResetDEPLANC.AsCurrency := fValDepLanc;
            qryReset.Post;
            qryReset.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         // Pesquisa o Lancamento - Taxa de Depreciacao
         //-------------------------------------------------------------------------------
         qryMovBem.Close;
         qryMovBem.ParamByName('PIDBEM').AsInteger     := qryResetIDBEM.AsInteger;
         qryMovBem.ParamByName('PIDPESSOA').AsInteger  := qryResetIDPESSOA.AsInteger;
         qryMovBem.ParamByName('PIDTIPOMOV').AsInteger := 43;
         qryMovBem.ParamByName('PDATAMOV').AsDateTime  := edDataBase1.Date;
         qryMovBem.Open;
         if (not qryMovBem.IsEmpty) then
            if (not qryMovBemTAXADEP.IsNull) then
            begin
               qryReset.Edit;
               qryResetTAXADEP.AsFloat := qryMovBemTAXADEP.AsFloat;
               qryReset.Post;
               qryReset.ApplyUpdates;
            end;
         //-------------------------------------------------------------------------------
         qryReset.Next;
      end;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Removendo os Lancamentos';
      Application.ProcessMessages;
      with dtmAtivoFixo do
      begin
         sqlScript.Script.Text := ' DELETE FROM REAVAL VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        GRUPO G '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO = 43) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataBase1.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM)           ' +
                                  '                    AND (B.IDGRUPO = G.IDGRUPO)     ' +
                                  '                    AND (G.FLGIMOVEL = 1) ));' +
                                  ' DELETE FROM VALORMOVIMENTACAO VM ' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        GRUPO G '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (41,42,43)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataBase1.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM)'+
                                  '                    AND (B.IDGRUPO = G.IDGRUPO)     ' +
                                  '                    AND (G.FLGIMOVEL = 1) ));' +
                                  ' DELETE FROM HISTORICOMOVIMENTACAO HMOV' +
                                  ' WHERE ( EXISTS ( SELECT HM.IDMOVIMENTACAO ' +
                                  '                  FROM  HISTORICOMOVIMENTACAO HM, ' +
                                  '                        BEM B, '+
                                  '                        GRUPO G '+
                                  '                  WHERE (HM.IDTIPOMOVIMENTACAO IN (41,42,43)) ' +
                                  '                    AND (HM.DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataBase1.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                                  '                    AND (HMOV.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' +
                                  '                    AND (HM.IDBEM = B.IDBEM) ' +
                                  '                    AND (B.IDGRUPO = G.IDGRUPO)     ' +
                                  '                    AND (G.FLGIMOVEL = 1) ));';
         sqlScript.Execute;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      if bTransacao then
         CommitTransacao;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      Screen.Cursor := crDefault;
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Processamento Abortado.','Erro',mtError,[mbOk],0);
   end;
   qryReset.Close;
   bbtnReset.Enabled := True;
   pnlStatus.Visible := False;
end;

end.
