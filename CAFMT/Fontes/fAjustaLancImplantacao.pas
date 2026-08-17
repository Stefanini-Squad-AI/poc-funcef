unit fAjustaLancImplantacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, ComCtrls, Gauges,
  Db, DBTables, Wwquery, CMDateTimePicker, wwdblook, wwdbdatetimepicker,
  wwriched, fcLabel, Wwdatsrc;

type
  TfrmAjustaLancImplantacao = class(TfrmSairAjuda)
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    bbtnCancelar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    qryRemHistMovBem: TwwQuery;
    qryHistMovBem: TwwQuery;
    qrySelBem: TwwQuery;
    dbeDesBem: TwwDBRichEdit;
    bbtnSelBem: TBitBtn;
    Label2: TLabel;
    edDataBase: TCMDateTimePicker;
    Label26: TLabel;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    DBRealEdit3: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    edValCtbAtual: TRealEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edValOrg: TRealEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edDepLanc: TRealEdit;
    edCmBem: TRealEdit;
    edCmDep: TRealEdit;
    fcLabel1: TfcLabel;
    dsSelbem: TwwDataSource;
    qryAtuBem: TwwQuery;
    updAtuBem: TUpdateSQL;
    qryRemSaldoContabBem: TwwQuery;
    qrySaldoContabBem: TwwQuery;
    qrySaldoContabBemIDBEM: TFloatField;
    qrySaldoContabBemIDPESSOA: TFloatField;
    qrySaldoContabBemDATASLDBEM: TDateTimeField;
    qrySaldoContabBemVALORG: TFloatField;
    qrySaldoContabBemCMBEM: TFloatField;
    qrySaldoContabBemDEPLANC: TFloatField;
    qrySaldoContabBemCMDEP: TFloatField;
    qrySaldoContabBemREAVVALORG: TFloatField;
    qrySaldoContabBemREAVCMBEM: TFloatField;
    qrySaldoContabBemREAVDEPLANC: TFloatField;
    qrySaldoContabBemREAVCMDEP: TFloatField;
    qrySaldoContabBemULTREAVVALORG: TFloatField;
    qrySaldoContabBemULTREAVCMBEM: TFloatField;
    qrySaldoContabBemULTREAVDEPLANC: TFloatField;
    qrySaldoContabBemULTREAVCMDEP: TFloatField;
    qrySaldoContabBemIDGRUPO: TFloatField;
    qrySaldoContabBemIDLOCALIZACAO: TFloatField;
    qrySaldoContabBemIDRESPONSAVEL: TFloatField;
    qryMovContabBem: TwwQuery;
    qryMovContabBemIDBEM: TFloatField;
    qryMovContabBemIDPESSOA: TFloatField;
    qryMovContabBemDATAMOVIMENTACAO: TDateTimeField;
    qryMovContabBemVALORG: TFloatField;
    qryMovContabBemCMBEM: TFloatField;
    qryMovContabBemDEPLANC: TFloatField;
    qryMovContabBemCMDEP: TFloatField;
    qryMovContabBemREAVVALORG: TFloatField;
    qryMovContabBemREAVCMBEM: TFloatField;
    qryMovContabBemREAVDEPLANC: TFloatField;
    qryMovContabBemREAVCMDEP: TFloatField;
    qryMovContabBemULTREAVVALORG: TFloatField;
    qryMovContabBemULTREAVCMBEM: TFloatField;
    qryMovContabBemULTREAVDEPLANC: TFloatField;
    qryMovContabBemULTREAVCMDEP: TFloatField;
    qryDelSaldoContabBem: TwwQuery;
    qryUpdSaldoContabBem: TwwQuery;
    qryInsSaldoContabBem: TwwQuery;
    qrySCBTransf: TwwQuery;
    qryBemAtual: TwwQuery;
    qryMovTransf: TwwQuery;
    qryAtuReavaliacao: TwwQuery;
    updAtuReavaliacao: TUpdateSQL;
    qryAtuAcrescimo: TwwQuery;
    updAtuAcrescimo: TUpdateSQL;
    qryUpdSCBTransf: TwwQuery;
    qryGrupoExiste: TwwQuery;
    qryLocalExiste: TwwQuery;
    qryRespExiste: TwwQuery;
    qryUltMovBem: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edDataBaseChange(Sender: TObject);
  private
    { Private declarations }
    MessageInfo : String;
    function ConvNum(fNum : Extended) : Extended;
    function RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                  iTipoMovimentacao : Integer;
                                  dDataMovimentacao : TDate;
                                  iReavalAcresc : LongInt;
                                  fValOfi, fValFis, fValGer : Extended;
                                  dDataUltDep : TDate;
                                  iGrupAnt, iConjAnt, iLocalAnt, iRespAnt : LongInt;
                                  fPlacaAnt : Extended;
                                  iPlanilha, iEstorno : LongInt;
                                  fTaxaDepAnt, fValorgLaudo : Extended;
                                  sObsReaval : String; iTipDepProRata : Integer;
                                  bMostraMsg: boolean) : Integer;
    function ReconstroiSaldoContabil(fIdBem, fIdPessoa : Extended) : Boolean;
    function GrupoExiste(fGrupo : Extended) : Boolean;
    function LocalExiste(fLocal : Extended) : Boolean;
    function RespExiste(fResp : Extended) : Boolean;
  public
    { Public declarations }
  end;

var
  frmAjustaLancImplantacao: TfrmAjustaLancImplantacao;

implementation

uses
   uSistema, dBaseDados, uDatabase, dAtivoFixo, uMensErro, uAtivoFixo;

{$R *.DFM}

function TfrmAjustaLancImplantacao.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;
//========================================================================================
procedure TfrmAjustaLancImplantacao.FormCreate(Sender: TObject);
begin
   inherited;
   qrySelBem.Prepare;
   qryRemSaldoContabBem.Prepare;
   qryMovContabBem.Prepare;
   qrySaldoContabBem.Prepare;
   qryInsSaldoContabBem.Prepare;
   qryUpdSaldoContabBem.Prepare;
   qryDelSaldoContabBem.Prepare;
   qrySCBTransf.Prepare;
   qryUpdSCBTransf.Prepare;
   qryBemAtual.Prepare;
   qryMovTransf.Prepare;
   qryAtuBem.Prepare;
   qryAtuReavaliacao.Prepare;
   qryAtuAcrescimo.Prepare;
   qryHistMovBem.Prepare;
   qryRemHistMovBem.Prepare;
   qryRespExiste.Prepare;
   qryLocalExiste.Prepare;
   qryGrupoExiste.Prepare;
   qryUltMovBem.Prepare;
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   qrySelBem.ParamByName('IDBEM').Clear;
   qrySelBem.ParamByName('IDPESSOA').Clear;
   qrySelBem.Open;
   edDataBase.Text := '';
end;
//========================================================================================
procedure TfrmAjustaLancImplantacao.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      if not ReconstroiSaldoContabil(strtofloat(dtmAtivoFixo.MSBem.ValoresChave[1]),
                                     strtofloat(dtmAtivoFixo.MSBem.ValoresChave[0])) then
         raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      qrySelBem.ParamByName('IDBEM').AsFloat    := strtofloat(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.ParamByName('IDPESSOA').AsFloat := strtofloat(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      edValCtbAtual.Value := qrySelBem.FieldByName('VALORG').AsFloat + qrySelBem.FieldByName('CMBEM').AsFloat -
                             qrySelBem.FieldByName('DEPLANC').AsFloat - qrySelBem.FieldByName('CMDEP').AsFloat;
      //----------------------------------------------------------------------------------
      qryUltMovBem.Close;
      qryUltMovBem.ParamByName('IDBEM').AsFloat    := strtofloat(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qryUltMovBem.ParamByName('IDPESSOA').AsFloat := strtofloat(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qryUltMovBem.Open;
      if not qryUltMovBem.IsEmpty then
         edDataBase.Date := qryUltMovBem.FieldByName('DATAULTMOV').AsDateTime
      else
         edDataBase.Text := '';
      edValOrg.SetFocus;
   end else
      bbtnSelBem.SetFocus;
end;
//========================================================================================
procedure TfrmAjustaLancImplantacao.edDataBaseChange(Sender: TObject);
begin
   inherited;
   if edDataBase.Date < qryUltMovBem.FieldByName('DATAULTMOV').AsDateTime then
   begin
      if not qryUltMovBem.IsEmpty then
      begin
         edDataBase.Date := qryUltMovBem.FieldByName('DATAULTMOV').AsDateTime;
      end else
      begin
         edDataBase.Text := '';
      end;
   end;

end;
//========================================================================================
procedure TfrmAjustaLancImplantacao.bbtnConfirmarClick(Sender: TObject);
var
   fIdBem, fIdPessoa  : Extended;
   iSeqHist : Integer;

begin
   inherited;
   prgBar.Progress   := 0;
   prgBar.MaxValue   := 1;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   try
      fIdBem    := qrySelBem.FieldByName('IDBEM').AsFloat;
      fIdPessoa := qrySelBem.FieldByName('IDPESSOA').AsFloat;
      //----------------------------------------------------------------------------------
      StartTransacao;
      //----------------------------------------------------------------------------------
      qrySelBem.Close;
      qrySelBem.ParamByName('IDBEM').AsFloat    := fIdBem;
      qrySelBem.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      prgBar.Progress := prgBar.Progress + 1;
      lblStatus.Caption := 'Processando Placa ' + trim(qrySelBem.FieldByName('PLACA').AsString) + '                      ';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Processa a diferença no Custo
      //----------------------------------------------------------------------------------
      if edValOrg.Value <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(qrySelBem.FieldByName('IDBEM').AsInteger,
                                          qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                          Sistema.IdModulo,41,edDataBase.Date, -1,
                                          edValOrg.Value, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                          True);
         if iSeqHist <= 0 then
            Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if edCmBem.Value <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(qrySelBem.FieldByName('IDBEM').AsInteger,
                                          qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                          Sistema.IdModulo,42,edDataBase.Date, -1,
                                          edCmBem.Value, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                          True);
         if iSeqHist <= 0 then
            Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if edDepLanc.Value <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(qrySelBem.FieldByName('IDBEM').AsInteger,
                                          qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                          Sistema.IdModulo,43,edDataBase.Date, -1,
                                          edDepLanc.Value, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                          True);
         if iSeqHist <= 0 then
            Raise Exception.Create(MessageInfo);
      end;
      //----------------------------------------------------------------------------------
      if edCmDep.Value <> 0 then
      begin
         iSeqHist := RegistraMovimentacao(qrySelBem.FieldByName('IDBEM').AsInteger,
                                          qrySelBem.FieldByName('IDPESSOA').AsInteger,
                                          Sistema.IdModulo,44,edDataBase.Date, -1,
                                          edCmDep.Value, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,'',1,
                                          True);
         if iSeqHist <= 0 then
            Raise Exception.Create(MessageInfo);
      end;
      CommitTransacao;
      //----------------------------------------------------------------------------------
      if not ReconstroiSaldoContabil(fIdBem, fIdPessoa) then
         raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      qrySelBem.Close;
      qrySelBem.ParamByName('IDBEM').AsFloat    := fIdBem;
      qrySelBem.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      edValCtbAtual.Value := qrySelBem.FieldByName('VALORG').AsFloat + qrySelBem.FieldByName('CMBEM').AsFloat -
                             qrySelBem.FieldByName('DEPLANC').AsFloat - qrySelBem.FieldByName('CMDEP').AsFloat;
      //----------------------------------------------------------------------------------
      qryUltMovBem.Close;
      qryUltMovBem.ParamByName('IDBEM').AsFloat    := fIdBem;
      qryUltMovBem.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      qryUltMovBem.Open;
      if not qryUltMovBem.IsEmpty then
         edDataBase.Date := qryUltMovBem.FieldByName('DATAULTMOV').AsDateTime
      else
         edDataBase.Text := '';
      //----------------------------------------------------------------------------------
      Application.ProcessMessages; 
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      On E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Excessão : ' + #13 + #13 + E.Message + #13 + #13 +
                'Processamento Abortado.', 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaLancImplantacao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   prgBar.Progress   := 0;
   prgbar.MaxValue   := 2;
   lblStatus.Caption := 'Iniciando ...';
   pnlStatus.Visible := True;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   // Posiciona os Bens do Imóvel Mestre que será ajustado
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      lblStatus.Caption := 'Removendo os Lançamentos da Placa ' + trim(qrySelBem.FieldByName('PLACA').AsString) + '                      ';
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      qryRemHistMovBem.Close;
      qryRemHistMovBem.ParamByName('IDBEM').AsFloat      := qrySelBem.FieldByName('IDBEM').AsFloat;
      qryRemHistMovBem.ParamByName('IDPESSOA').AsFloat   := qrySelBem.FieldByName('IDPESSOA').AsFloat;
      qryRemHistMovBem.ParamByName('DATAMOV').AsDateTime := edDataBase.Date;
      qryRemHistMovBem.ExecSQL;
      if qryRemHistMovBem.RowsAffected <= 0 then
         Raise Exception.Create('Erro na Remoção da Movimentação de Ajuste do Bem ' +
                                 qrySelBem.FieldByName('PLACA').AsString);
      CommitTransacao;
      prgBar.Progress := 1;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if not ReconstroiSaldoContabil(qrySelBem.FieldByName('IDBEM').AsFloat, qrySelBem.FieldByName('IDPESSOA').AsFloat) then
         raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      qrySelBem.Close;
      qrySelBem.ParamByName('IDBEM').AsFloat    := strtofloat(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.ParamByName('IDPESSOA').AsFloat := strtofloat(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      edValCtbAtual.Value := qrySelBem.FieldByName('VALORG').AsFloat  + qrySelBem.FieldByName('CMBEM').AsFloat -
                             qrySelBem.FieldByName('DEPLANC').AsFloat - qrySelBem.FieldByName('CMDEP').AsFloat;
      //----------------------------------------------------------------------------------
      qryUltMovBem.Close;
      qryUltMovBem.ParamByName('IDBEM').AsFloat    := qrySelBem.FieldByName('IDBEM').AsFloat;
      qryUltMovBem.ParamByName('IDPESSOA').AsFloat := qrySelBem.FieldByName('IDPESSOA').AsFloat;
      qryUltMovBem.Open;
      if not qryUltMovBem.IsEmpty then
         edDataBase.Date := qryUltMovBem.FieldByName('DATAULTMOV').AsDateTime
      else
         edDataBase.Text := '';
      //----------------------------------------------------------------------------------
      prgBar.Progress := 2;
      Application.ProcessMessages;
      MsgDlg('Processamento Encerrado.','Informação',mtInformation,[mbOk],0);
   except
      On E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Excessão : ' + #13 + #13 + E.Message + #13 + #13 +
                'Processamento Abortado.', 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmAjustaLancImplantacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryMovContabBem.Close;
   qrySaldoContabBem.Close;
   qrySCBTransf.Close;
   qryBemAtual.Close;
   qryMovTransf.Close;
   qryHistMovBem.Close;
   qryRespExiste.Close;
   qryLocalExiste.Close;
   qryGrupoExiste.Close;
   qryUltMovBem.Close;
   qryAtuBem.Close;
   qryAtuReavaliacao.Close;
   qryAtuAcrescimo.Close;
   qrySelBem.UnPrepare;
   qryRemSaldoContabBem.UnPrepare;
   qryMovContabBem.UnPrepare;
   qrySaldoContabBem.UnPrepare;
   qryInsSaldoContabBem.UnPrepare;
   qryUpdSaldoContabBem.UnPrepare;
   qryDelSaldoContabBem.UnPrepare;
   qrySCBTransf.UnPrepare;
   qryUpdSCBTransf.UnPrepare;
   qryBemAtual.UnPrepare;
   qryMovTransf.UnPrepare;
   qryAtuBem.UnPrepare;
   qryAtuReavaliacao.UnPrepare;
   qryAtuAcrescimo.UnPrepare;
   qryHistMovBem.UnPrepare;
   qryRemHistMovBem.UnPrepare;
   qryRespExiste.UnPrepare;
   qryLocalExiste.UnPrepare;
   qryGrupoExiste.UnPrepare;
   qryUltMovBem.UnPrepare;
end;
//========================================================================================
function TfrmAjustaLancImplantacao.RegistraMovimentacao(iBem, iEmpresaProp, iModulo,
                                                  iTipoMovimentacao : Integer;
                                                  dDataMovimentacao : TDate;
                                                  iReavalAcresc : LongInt;
                                                  fValOfi, fValFis, fValGer : Extended;
                                                  dDataUltDep : TDate;
                                                  iGrupAnt, iConjAnt, iLocalAnt, iRespAnt : LongInt;
                                                  fPlacaAnt : Extended;
                                                  iPlanilha, iEstorno : LongInt;
                                                  fTaxaDepAnt, fValorgLaudo : Extended;
                                                  sObsReaval : String; iTipDepProRata : Integer;
                                                  bMostraMsg: boolean) : Integer;
var
   iMovimentacao           : LongInt;
   qryRegistraMovimentacao : TwwQuery;

begin
   try
      if not dtmAtivoFixo.qryRegistraMovimentacao.Prepared then
         dtmAtivoFixo.qryRegistraMovimentacao.Prepare;
      //----------------------------------------------------------------------------------
      iMovimentacao           := LeUltRegistro(nil, 'HISTORICOMOVIMENTACAO');
      qryRegistraMovimentacao := TwwQuery(dtmAtivoFixo.qryRegistraMovimentacao);
      //----------------------------------------------------------------------------------
      with qryRegistraMovimentacao do
      begin
         Close;
         ParamByName('MOVIMENTACAO').asInteger      := iMovimentacao;
         ParamByName('BEM').asInteger               := iBem;
         ParamByName('EMPRESAPROP').asInteger       := iEmpresaProp;
         ParamByName('MODULO').asInteger            := iModulo;
         ParamByName('TIPOMOVIMENTACAO').asInteger  := iTipoMovimentacao;
         ParamByName('DATAMOVIMENTACAO').asDateTime := dDataMovimentacao;
         //-------------------------------------------------------------------------------
         // Códigos :
         // 0 - [DataMovimentacao - 1] , 1 - [DataMovimentacao] , 2 - [Fechamento]
         //-------------------------------------------------------------------------------
         ParamByName('TIPDEPPRORATA').asInteger     := iTipDepProRata;
         //-------------------------------------------------------------------------------
         if iReavalAcresc = -1 then
            ParamByName('IDREAVALACRESC').Clear
         else
            ParamByName('IDREAVALACRESC').AsInteger := iReavalAcresc;
         //-------------------------------------------------------------------------------
         if abs(fValOfi) >= 0.01 then
         begin
            ParamByName('VALOFI').AsCurrency := strtofloat(FormatFloat('#0.00',((fValOfi * 100) / 100)));
            ParamByName('VALGER').AsCurrency := strtofloat(FormatFloat('#0.00',((fValGer * 100) / 100)));
            ParamByName('VALFIS').AsCurrency := strtofloat(FormatFloat('#0.00',((fValFis * 100) / 100)));
         end else
         begin
            ParamByName('VALOFI').AsFloat := fValOfi;
            ParamByName('VALGER').AsFloat := fValGer;
            ParamByName('VALFIS').AsFloat := fValFis;
         end;
         //-------------------------------------------------------------------------------
         if dDataUltDep = -1 then
            ParamByName('DATAULTDEP').Clear
         else
            ParamByName('DATAULTDEP').AsDateTime := dDataUltDep;
         //-------------------------------------------------------------------------------
         if iGrupAnt = -1 then
            ParamByName('IDGRUPANT').Clear
         else
            ParamByName('IDGRUPANT').AsInteger := iGrupAnt;
         //-------------------------------------------------------------------------------
         if iConjAnt = -1 then
            ParamByName('IDCONJANT').Clear
         else
            ParamByName('IDCONJANT').AsInteger := iConjAnt;
         //-------------------------------------------------------------------------------
         if iLocalAnt = -1 then
            ParamByName('IDLOCALANT').Clear
         else
            ParamByName('IDLOCALANT').AsInteger := iLocalAnt;
         //-------------------------------------------------------------------------------
         if iRespAnt = -1 then
            ParamByName('IDRESPANT').Clear
         else
            ParamByName('IDRESPANT').AsInteger := iRespAnt;
         //-------------------------------------------------------------------------------
         if fPlacaAnt = -1 then
            ParamByName('PLACAANT').Clear
         else
            ParamByName('PLACAANT').AsFloat := fPlacaAnt;
         //-------------------------------------------------------------------------------
         if fTaxaDepAnt = -1 then
            ParamByName('TAXADEPANT').Clear
         else
            ParamByName('TAXADEPANT').AsFloat := fTaxaDepAnt;
         //-------------------------------------------------------------------------------
         if fValorgLaudo = -1 then
            ParamByName('VALORGLAUDO').Clear
         else
            ParamByName('VALORGLAUDO').AsFloat := fValorgLaudo;
         //-------------------------------------------------------------------------------
         ParamByName('OBSREAVAL').AsString := sObsReaval;
         //-------------------------------------------------------------------------------
         if iPlanilha = -1 then
            ParamByName('PLANILHA').Clear
         else
            ParamByName('PLANILHA').asInteger := iPlanilha;
         //-------------------------------------------------------------------------------
         // Registra para o trigger da tabela que é o NOVO CAF que está sendo executado
         //-------------------------------------------------------------------------------
         ParamByName('FLGNCAF').asInteger := 1;
         //-------------------------------------------------------------------------------
         ExecSQL;
         if RowsAffected = 0 then
            Raise Exception.Create('RegistraMovimentacao : Erro na gravação');
      end;
      Result := iMovimentacao;
   except
      On E : Exception do
      begin
         Result := -1;
         MessageInfo := E.Message;
      end;
   end;
end;
//========================================================================================
function TfrmAjustaLancImplantacao.ReconstroiSaldoContabil(fIdBem, fIdPessoa : Extended) : Boolean;
var
   fValOrg, fCmBem,
   fDepLanc, fCmDep,
   fReavValOrg, fReavCmBem,
   fReavDepLanc, fReavCmDep,
   fUltReavValOrg, fUltReavCmBem,
   fUltReavDepLanc, fUltReavCmDep : Extended;
   iGrupo,iLocal,iResp            : Integer;
   sDataMov                       : String;
   dDataMov                       : tDateTime;

begin
   inherited;
   Result := True;
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      // Remove os saldos anteriores
      //----------------------------------------------------------------------------------
      qryRemSaldoContabBem.ParamByName('IDBEM').AsFloat    := fIdBem;
      qryRemSaldoContabBem.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      qryRemSaldoContabBem.ExecSQL;
      //----------------------------------------------------------------------------------
      CommitTransacao;
   except
      on E : Exception do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fReavValOrg  := 0;
      fReavCmBem   := 0;
      fReavDepLanc := 0;
      fReavCmDep   := 0;
      fUltReavValOrg  := 0;
      fUltReavCmBem   := 0;
      fUltReavDepLanc := 0;
      fUltReavCmDep   := 0;
      //----------------------------------------------------------------------------------
      qrySaldoContabBem.Close;
      qrySaldoContabBem.ParamByName('IDBEM').AsFloat    := fIdBem;
      qrySaldoContabBem.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      qrySaldoContabBem.Open;
      qryMovContabBem.Close;
      qryMovContabBem.ParamByName('IDBEM').AsFloat    := fIdBem;
      qryMovContabBem.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      qryMovContabBem.Open;
      while not qryMovContabBem.EOF do
      begin
         fValOrg         := ConvNum(fValOrg         + qryMovContabBem.FieldByName('VALORG').AsFloat);
         fCmBem          := ConvNum(fCmBem          + qryMovContabBem.FieldByName('CMBEM').AsFloat);
         fDepLanc        := ConvNum(fDepLanc        + qryMovContabBem.FieldByName('DEPLANC').AsFloat);
         fCmDep          := ConvNum(fCmDep          + qryMovContabBem.FieldByName('CMDEP').AsFloat);
         fReavValOrg     := ConvNum(fReavValOrg     + qryMovContabBem.FieldByName('REAVVALORG').AsFloat);
         fReavCmBem      := ConvNum(fReavCmBem      + qryMovContabBem.FieldByName('REAVCMBEM').AsFloat);
         fReavDepLanc    := ConvNum(fReavDepLanc    + qryMovContabBem.FieldByName('REAVDEPLANC').AsFloat);
         fReavCmDep      := ConvNum(fReavCmDep      + qryMovContabBem.FieldByName('REAVCMDEP').AsFloat);
         fUltReavValOrg  := ConvNum(fUltReavValOrg  + qryMovContabBem.FieldByName('ULTREAVVALORG').AsFloat);
         fUltReavCmBem   := ConvNum(fUltReavCmBem   + qryMovContabBem.FieldByName('ULTREAVCMBEM').AsFloat);
         fUltReavDepLanc := ConvNum(fUltReavDepLanc + qryMovContabBem.FieldByName('ULTREAVDEPLANC').AsFloat);
         fUltReavCmDep   := ConvNum(fUltReavCmDep   + qryMovContabBem.FieldByName('ULTREAVCMDEP').AsFloat);
         //-------------------------------------------------------------------------------
         if not qrySaldoContabBem.EOF then
         begin
            if qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime = qrySaldoContabBem.FieldByName('DATASLDBEM').AsDateTime then
            begin
               qryUpdSaldoContabBem.ParamByName('IDBEM').AsInteger           := qryMovContabBem.FieldByName('IDBEM').AsInteger;
               qryUpdSaldoContabBem.ParamByName('IDPESSOA').AsInteger        := qryMovContabBem.FieldByName('IDPESSOA').AsInteger;
               qryUpdSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime     := qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               qryUpdSaldoContabBem.ParamByName('VALORG').AsCurrency         := fValOrg;
               qryUpdSaldoContabBem.ParamByName('CMBEM').AsCurrency          := fCmBem;
               qryUpdSaldoContabBem.ParamByName('DEPLANC').AsCurrency        := fDepLanc;
               qryUpdSaldoContabBem.ParamByName('CMDEP').AsCurrency          := fCmDep;
               qryUpdSaldoContabBem.ParamByName('REAVVALORG').AsCurrency     := fReavValOrg;
               qryUpdSaldoContabBem.ParamByName('REAVCMBEM').AsCurrency      := fReavCmBem;
               qryUpdSaldoContabBem.ParamByName('REAVDEPLANC').AsCurrency    := fReavDepLanc;
               qryUpdSaldoContabBem.ParamByName('REAVCMDEP').AsCurrency      := fReavCmDep;
               qryUpdSaldoContabBem.ParamByName('ULTREAVVALORG').AsCurrency  := fUltReavValOrg;
               qryUpdSaldoContabBem.ParamByName('ULTREAVCMBEM').AsCurrency   := fUltReavCmBem;
               qryUpdSaldoContabBem.ParamByName('ULTREAVDEPLANC').AsCurrency := fUltReavDepLanc;
               qryUpdSaldoContabBem.ParamByName('ULTREAVCMDEP').AsCurrency   := fUltReavCmDep;
               qryUpdSaldoContabBem.ExecSQL;
               if qryUpdSaldoContabBem.RowsAffected <= 0 then
                  Raise Exception.Create('Preparando Saldos : qryUpdSaldoContabBem : IdBem = ' + qryMovContabBem.FieldByName('IDBEM').AsString);
               //-------------------------------------------------------------------------
               qryMovContabBem.Next;
               qrySaldoContabBem.Next;
            end else
            if qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime < qrySaldoContabBem.FieldByName('DATASLDBEM').AsDateTime then
            begin
               qryInsSaldoContabBem.ParamByName('IDBEM').AsInteger           := qryMovContabBem.FieldByName('IDBEM').AsInteger;
               qryInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger        := qryMovContabBem.FieldByName('IDPESSOA').AsInteger;
               qryInsSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime     := qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               qryInsSaldoContabBem.ParamByName('VALORG').AsCurrency         := fValOrg;
               qryInsSaldoContabBem.ParamByName('CMBEM').AsCurrency          := fCmBem;
               qryInsSaldoContabBem.ParamByName('DEPLANC').AsCurrency        := fDepLanc;
               qryInsSaldoContabBem.ParamByName('CMDEP').AsCurrency          := fCmDep;
               qryInsSaldoContabBem.ParamByName('REAVVALORG').AsCurrency     := fReavValOrg;
               qryInsSaldoContabBem.ParamByName('REAVCMBEM').AsCurrency      := fReavCmBem;
               qryInsSaldoContabBem.ParamByName('REAVDEPLANC').AsCurrency    := fReavDepLanc;
               qryInsSaldoContabBem.ParamByName('REAVCMDEP').AsCurrency      := fReavCmDep;
               qryInsSaldoContabBem.ParamByName('ULTREAVVALORG').AsCurrency  := fUltReavValOrg;
               qryInsSaldoContabBem.ParamByName('ULTREAVCMBEM').AsCurrency   := fUltReavCmBem;
               qryInsSaldoContabBem.ParamByName('ULTREAVDEPLANC').AsCurrency := fUltReavDepLanc;
               qryInsSaldoContabBem.ParamByName('ULTREAVCMDEP').AsCurrency   := fUltReavCmDep;
               qryInsSaldoContabBem.ExecSQL;
               if qryInsSaldoContabBem.RowsAffected <= 0 then
                  Raise Exception.Create('Erro qryInsSaldoContabBem : IdBem = ' + qryMovContabBem.FieldByName('IDBEM').AsString);
               //-------------------------------------------------------------------------
               qryMovContabBem.Next;
            end else
            if qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime > qrySaldoContabBem.FieldByName('DATASLDBEM').AsDateTime then
            begin
               qryDelSaldoContabBem.ParamByName('IDBEM').AsInteger        := qryMovContabBem.FieldByName('IDBEM').AsInteger;
               qryDelSaldoContabBem.ParamByName('IDPESSOA').AsInteger     := qryMovContabBem.FieldByName('IDPESSOA').AsInteger;
               qryDelSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime  := qryMovContabBem.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               qryDelSaldoContabBem.ExecSQL;
               if qryDelSaldoContabBem.RowsAffected <= 0 then
                  Raise Exception.Create('Erro qryDelSaldoContabBem : IdBem = '+qryMovContabBem.FieldByName('IDBEM').AsString);
               //-------------------------------------------------------------------------
               qrySaldoContabBem.Next;
            end;
         end else
         begin
            qryInsSaldoContabBem.ParamByName('IDBEM').AsInteger           := qryMovContabBemIDBEM.AsInteger;
            qryInsSaldoContabBem.ParamByName('IDPESSOA').AsInteger        := qryMovContabBemIDPESSOA.AsInteger;
            qryInsSaldoContabBem.ParamByName('DATASLDBEM').AsDateTime     := qryMovContabBemDATAMOVIMENTACAO.AsDateTime;
            qryInsSaldoContabBem.ParamByName('VALORG').AsCurrency         := fValOrg;
            qryInsSaldoContabBem.ParamByName('CMBEM').AsCurrency          := fCmBem;
            qryInsSaldoContabBem.ParamByName('DEPLANC').AsCurrency        := fDepLanc;
            qryInsSaldoContabBem.ParamByName('CMDEP').AsCurrency          := fCmDep;
            qryInsSaldoContabBem.ParamByName('REAVVALORG').AsCurrency     := fReavValOrg;
            qryInsSaldoContabBem.ParamByName('REAVCMBEM').AsCurrency      := fReavCmBem;
            qryInsSaldoContabBem.ParamByName('REAVDEPLANC').AsCurrency    := fReavDepLanc;
            qryInsSaldoContabBem.ParamByName('REAVCMDEP').AsCurrency      := fReavCmDep;
            qryInsSaldoContabBem.ParamByName('ULTREAVVALORG').AsCurrency  := fUltReavValOrg;
            qryInsSaldoContabBem.ParamByName('ULTREAVCMBEM').AsCurrency   := fUltReavCmBem;
            qryInsSaldoContabBem.ParamByName('ULTREAVDEPLANC').AsCurrency := fUltReavDepLanc;
            qryInsSaldoContabBem.ParamByName('ULTREAVCMDEP').AsCurrency   := fUltReavCmDep;
            qryInsSaldoContabBem.ExecSQL;
            if qryInsSaldoContabBem.RowsAffected <= 0 then
               Raise Exception.Create('Erro qryInsSaldoContabBem : IdBem = '+qryMovContabBem.FieldByName('IDBEM').AsString);
            //----------------------------------------------------------------------------
            qryMovContabBem.Next;
         end;
      end;
      CommitTransacao;
      StartTransacao;
      //----------------------------------------------------------------------------------
      // Atualização do histórico de transferências
      //----------------------------------------------------------------------------------
      qrySCBTransf.Close;
      qrySCBTransf.ParamByName('IDBEM').AsFloat    := fIdBem;
      qrySCBTransf.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      qrySCBTransf.Open;
      //----------------------------------------------------------------------------------
      while not qrySCBTransf.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Dados atuais do bem
         //-------------------------------------------------------------------------------
         qryBemAtual.Close;
         qryBemAtual.ParamByName('IDBEM').AsFloat    := fIdBem;
         qryBemAtual.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
         qryBemAtual.Open;
         if qryBemAtual.IsEmpty then
            Raise Exception.Create('Dados do Bem na query SCBTRANSF são inválidos ou não possui conjunto associado!' + #13 +
                                   'IDBEM = ' + floattostr(fIdBem) + 'IDPESSOA = ' + floattostr(fIdPessoa));
         iGrupo := qryBemAtual.FieldByName('IDGRUPO').AsInteger;
         iLocal := qryBemAtual.FieldByName('IDLOCALIZACAO').AsInteger;
         iResp  := qryBemAtual.FieldByName('IDRESPONSAVEL').AsInteger;
         if (iGrupo = 0) or (iLocal = 0) or (iResp = 0) then
            Raise Exception.Create('Dados do Bem na query BEMATUAL é inválido!' + #13 +
                                   'IDGRUPO = ' + inttostr(iGrupo) + 'IDLOCALIZACAO = ' + inttostr(iLocal) + 'IDRESPONSAVEL = ' + inttostr(iResp));
         //-------------------------------------------------------------------------------
         // Dados de transferencia anteriores do bem
         //-------------------------------------------------------------------------------
         qryMovTransf.Close;
         qryMovTransf.ParamByName('IDBEM').AsFloat    := fIdBem;
         qryMovTransf.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
         qryMovTransf.Open;
         //-------------------------------------------------------------------------------
         while (not qrySCBTransf.EOF) and (qrySCBTransf.FieldByName('IDBEM').AsFloat = fIdBem) and
                                          (qrySCBTransf.FieldByName('IDPESSOA').AsFloat = fIdPessoa) do
         begin
            //----------------------------------------------------------------------------
            // Atualiza os dados na tabela SALDOCONTABBEM
            //----------------------------------------------------------------------------
            sDataMov := qrySCBTransf.FieldByName('DATASLDBEM').AsString;
            qryUpdSCBTransf.ParamByName('IDBEM').AsFloat           := fIdBem;
            qryUpdSCBTransf.ParamByName('IDPESSOA').AsFloat        := fIdPessoa;
            qryUpdSCBTransf.ParamByName('DATASLDBEM').AsDateTime   := qrySCBTransf.FieldByName('DATASLDBEM').AsDateTime;
            qryUpdSCBTransf.ParamByName('IDGRUPO').AsInteger       := iGrupo;
            qryUpdSCBTransf.ParamByName('IDLOCALIZACAO').AsInteger := iLocal;
            qryUpdSCBTransf.ParamByName('IDRESPONSAVEL').AsInteger := iResp;
            qryUpdSCBTransf.ExecSQL;
            //----------------------------------------------------------------------------
            // Verifica mudança no grupo, localização ou responsável do bem
            //----------------------------------------------------------------------------
            if not qryMovTransf.IsEmpty then
            begin
               if qrySCBTransf.FieldByName('DATASLDBEM').AsDateTime = qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime then
               begin
                  dDataMov := qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime;
                  while (not qryMovTransf.EOF) and
                        (qryMovTransf.FieldByName('DATAMOVIMENTACAO').AsDateTime = dDataMov) do
                  begin
                     if not qryMovTransf.FieldByName('IDGRUPANT').IsNull then
                        if GrupoExiste(qryMovTransf.FieldByName('IDGRUPANT').AsFloat) then
                           iGrupo := qryMovTransf.FieldByName('IDGRUPANT').AsInteger;
                     if not qryMovTransf.FieldByName('IDLOCALANT').IsNull then
                        if LocalExiste(qryMovTransf.FieldByName('IDLOCALANT').AsFloat) then
                           iLocal := qryMovTransf.FieldByName('IDLOCALANT').AsInteger;
                     if not qryMovTransf.FieldByName('IDRESPANT').IsNull then
                        if RespExiste(qryMovTransf.FieldByName('IDRESPANT').AsFloat) then
                           iResp  := qryMovTransf.FieldByName('IDRESPANT').AsInteger;
                     //-------------------------------------------------------------------
                     qryMovTransf.Next;
                  end;
               end;
            end;
            //----------------------------------------------------------------------------
            qrySCBTransf.Next;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Ajusta os Saldos das Tabelas BEM, REAVALIACAO e ACRESCIMOVALOR
      //----------------------------------------------------------------------------------
      // Posiciona a tabela Bem
      //----------------------------------------------------------------------------------
      qryAtuBem.Close;
      qryAtuBem.ParamByName('PDATAMOV').AsDateTime  := date;
      qryAtuBem.ParamByName('IDBEM').AsFloat        := fIdBem;
      qryAtuBem.ParamByName('IDPESSOA').AsFloat     := fIdPessoa;
      qryAtuBem.Open;
      //----------------------------------------------------------------------------------
      prgbar.MaxValue := qryAtuBem.RecordCount;
      while not qryAtuBem.EOF do
      begin
         if abs(qryAtuBem.FieldByName('VALORG').AsFloat - qryAtuBem.FieldByName('VALORG0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('VALORG').AsCurrency := qryAtuBem.FieldByName('VALORG0').AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBem.FieldByName('CMBEM').AsFloat - qryAtuBem.FieldByName('CMBEM0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('CMBEM').AsCurrency := qryAtuBem.FieldByName('CMBEM0').AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBem.FieldByName('DEPLANC').AsFloat - qryAtuBem.FieldByName('DEPLANC0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('DEPLANC').AsCurrency := qryAtuBem.FieldByName('DEPLANC0').AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuBem.FieldByName('CMDEP').AsFloat - qryAtuBem.FieldByName('CMDEP0').AsFloat) >= 0.01 then
         begin
            qryAtuBem.Edit;
            qryAtuBem.FieldByName('CMDEP').AsCurrency := qryAtuBem.FieldByName('CMDEP0').AsCurrency;
            qryAtuBem.Post;
            qryAtuBem.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryAtuBem.Next;
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a tabela Reavaliacao
      //----------------------------------------------------------------------------------
      qryAtuReavaliacao.Close;
      qryAtuReavaliacao.ParamByName('IDBEM').AsFloat        := fIdBem;
      qryAtuReavaliacao.ParamByName('IDPESSOA').AsFloat     := fIdPessoa;
      qryAtuReavaliacao.ParamByName('PDATAMOV').AsDateTime  := Date;
      qryAtuReavaliacao.Open;
      //----------------------------------------------------------------------------------
      while not qryAtuReavaliacao.EOF do
      begin
         if abs(qryAtuReavaliacao.FieldbyName('VALORG').AsFloat - qryAtuReavaliacao.FieldbyName('VALORG0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldbyName('VALORG').AsCurrency := qryAtuReavaliacao.FieldbyName('VALORG0').AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacao.FieldbyName('CMBEM').AsFloat - qryAtuReavaliacao.FieldbyName('CMBEM0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldbyName('CMBEM').AsCurrency := qryAtuReavaliacao.FieldbyName('CMBEM0').AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacao.FieldbyName('DEPLANC').AsFloat - qryAtuReavaliacao.FieldbyName('DEPLANC0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldbyName('DEPLANC').AsCurrency := qryAtuReavaliacao.FieldbyName('DEPLANC0').AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuReavaliacao.FieldbyName('CMDEP').AsFloat - qryAtuReavaliacao.FieldbyName('CMDEP0').AsFloat) >= 0.01 then
         begin
            qryAtuReavaliacao.Edit;
            qryAtuReavaliacao.FieldbyName('CMDEP').AsCurrency := qryAtuReavaliacao.FieldbyName('CMDEP0').AsCurrency;
            qryAtuReavaliacao.Post;
            qryAtuReavaliacao.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryAtuReavaliacao.Next;
      end;
      //----------------------------------------------------------------------------------
      // Posiciona a tabela AcrescimoValor
      //----------------------------------------------------------------------------------
      qryAtuAcrescimo.Close;
      qryAtuAcrescimo.ParamByName('IDBEM').AsFloat        := fIdBem;
      qryAtuAcrescimo.ParamByName('IDPESSOA').AsFloat     := fIdPessoa;
      qryAtuAcrescimo.ParamByName('PDATAMOV').AsDateTime  := Date;
      qryAtuAcrescimo.Open;
      //----------------------------------------------------------------------------------
      while not qryAtuAcrescimo.EOF do
      begin
         if abs(qryAtuAcrescimo.FieldbyName('VALORG').AsFloat - qryAtuAcrescimo.FieldbyName('VALORG0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldbyName('VALORG').AsCurrency := qryAtuAcrescimo.FieldbyName('VALORG0').AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimo.FieldbyName('CMBEM').AsFloat - qryAtuAcrescimo.FieldbyName('CMBEM0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldbyName('CMBEM').AsCurrency := qryAtuAcrescimo.FieldbyName('CMBEM0').AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimo.FieldbyName('DEPLANC').AsFloat - qryAtuAcrescimo.FieldbyName('DEPLANC0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldbyName('DEPLANC').AsCurrency := qryAtuAcrescimo.FieldbyName('DEPLANC0').AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         if abs(qryAtuAcrescimo.FieldbyName('CMDEP').AsFloat - qryAtuAcrescimo.FieldbyName('CMDEP0').AsFloat) >= 0.01 then
         begin
            qryAtuAcrescimo.Edit;
            qryAtuAcrescimo.FieldbyName('CMDEP').AsCurrency := qryAtuAcrescimo.FieldbyName('CMDEP0').AsCurrency;
            qryAtuAcrescimo.Post;
            qryAtuAcrescimo.ApplyUpdates;
         end;
         //-------------------------------------------------------------------------------
         qryAtuAcrescimo.Next;
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
   except
      on E : Exception do
      begin
         MessageInfo := E.Message;
         Result := False;
      end;
   end;
end;
//========================================================================================
function TfrmAjustaLancImplantacao.GrupoExiste(fGrupo : Extended) : Boolean;
begin
   qryGrupoExiste.Close;
   qryGrupoExiste.ParamByName('IDGRUPO').AsFloat  := fGrupo;
   qryGrupoExiste.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryGrupoExiste.Open;
   if qryGrupoExiste.IsEmpty then
   begin
      result := False;
   end else
      result := True;
end;
//========================================================================================
function TfrmAjustaLancImplantacao.LocalExiste(fLocal : Extended) : Boolean;
begin
   qryLocalExiste.Close;
   qryLocalExiste.ParamByName('IDLOCALIZACAO').AsFloat := fLocal;
   qryLocalExiste.ParamByName('IDPESSOA').AsFloat      := Sistema.IdEmpresa;
   qryLocalExiste.Open;
   if qryLocalExiste.IsEmpty then
   begin
      result := False;
   end else
      result := True;
end;
//========================================================================================
function TfrmAjustaLancImplantacao.RespExiste(fResp : Extended) : Boolean;
begin
   qryRespExiste.Close;
   qryRespExiste.ParamByName('IDRESPONSAVEL').AsFloat := fResp;
   qryRespExiste.Open;
   if qryRespExiste.IsEmpty then
   begin
      result := False;
   end else
      result := True;
end;

end.
