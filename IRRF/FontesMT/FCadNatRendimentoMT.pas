unit FCadNatRendimentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uSistema,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBaseDados,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uMensErro,
  wwdblook, CMProcuraSubTipo, Mask, wwdbedit, uCtrlNatuRendimento, uCtrlUtil,
  DBCtrls, uCMTypes;

type
  TfrmCadNatRendimentoMT = class(TFrmCadastroMT)
    lblCodigo: TLabel;
    dbedCodigo: TwwDBEdit;
    Label1: TLabel;
    dbedHistorico: TwwDBEdit;
    gbDarf: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    rgTributo: TLabel;
    Label4: TLabel;
    cmfcFornDarf: TCMProcuraSubTipo;
    dblcTipoDesemb: TwwDBLookupCombo;
    dblcFormaPG: TwwDBLookupCombo;
    cbTributo: TComboBox;
    cbPeriodicidade: TComboBox;
    cdsTipoDesembolso: TCMClientDataSet;
    cdsFormaPagamento: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    dbcResid: TDBCheckBox;
    dbcDepositoJud: TDBCheckBox;
    dbcDIRF: TDBCheckBox;
    Bevel1: TBevel;
    dbcDCTF: TDBCheckBox;
    dbedtVariacao: TwwDBEdit;
    lblVariacao: TLabel;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure dbcDCTFClick(Sender: TObject);
  private
    NatuRendimento : TCtrlNatuRendimento;
    CtrlUtil : TCtrlUtil;
    procedure VerificaAtributos;
  public
    { Public declarations }
  end;



var
  frmCadNatRendimentoMT: TfrmCadNatRendimentoMT;



implementation
{$R *.DFM}



procedure TfrmCadNatRendimentoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  VerificaAtributos;

  dbedCodigo.Enabled := False;

  if cds.fieldByname('FLGUSADONADCTF').IsNull then
     dbcDCTF.Checked  := True;
  if cds.fieldByname('FLGRESIDEXTERIOR').IsNull then
     dbcResid.Checked  := False;
  if cds.fieldByname('FLGDEPOSITOJUDIC').IsNull then
     dbcDepositoJud.Checked  := False;
  if cds.fieldByname('FLGUSADONADIRF').IsNull then
     dbcDIRF.Checked  := False;

  dbedHistorico.SetFocus;
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  cbTributo.ItemIndex       := -1;
  cbPeriodicidade.ItemIndex := -1;
  dbcDIRF.Checked           := True;
  dbedCodigo.Enabled        := True;
  dbcDCTF.Checked           := True;
  dbcResid.Checked          := False;
  dbcDepositoJud.Checked    := False;
  dbedCodigo.SetFocus;
end;



procedure TfrmCadNatRendimentoMT.bbtnConfirmarClick(Sender: TObject);
begin
  if Length(Trim(dbedCodigo.Text)) < 4 then
  Begin
    MsgDlg('Obrigatório preencher os 4 dígitos do Código','Erro',mtError,[mbOK],0);
    dbedCodigo.SetFocus;
    exit;
  End;
  if Trim(dbedHistorico.Text) = '' then
  Begin
    MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOK],0);
    dbedHistorico.SetFocus;
    exit;
  End;

  if (sbtnInserir.Down = True) then
  Begin
     cdsAux.data := NatuRendimento.ProcurarNaturendimento(dbedCodigo.Text);
     if not cdsAux.IsEmpty  then
     Begin
       MsgDlg('Natureza de Rendimento Já Cadastrada','Erro',mtError,[mbOK],0);
       dbedCodigo.SetFocus;
       exit;
     end;
  end;
  cds.FieldByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  cds.FieldByName('RECPAG').AsString    := 'P';

  if (cds.state in [dsInsert, DsEdit]) and (Trim(cbTributo.Text) <> '') then
     cds.fieldByname('GRUPOTRIBUTO').Asstring := '0' + intTostr(cbTributo.itemIndex + 1);
  if (cds.state in [dsInsert, DsEdit]) and (cbTributo.ItemIndex > 9 ) then
     cds.fieldByname('GRUPOTRIBUTO').Asstring :=  intTostr(cbTributo.itemIndex+1);
  if (cds.state in [dsInsert, DsEdit]) and (Trim(cbPeriodicidade.Text) <> '') then
     cds.fieldByname('PERIODICIDADE').Asstring := copy(cbPeriodicidade.text, 1, 1);

  if ( Length(dbedtVariacao.Text) < 2 ) and
     ( dbcDCTF.Checked                ) then
  begin
    MsgDlg('A variação tem de ter 2 caracteres.', 'Informação', mtInformation, [mbOK], 0);
    dbedtVariacao.SetFocus;
    exit;
  end;
  inherited;
end;



procedure TfrmCadNatRendimentoMT.FormCreate(Sender: TObject);
begin
  inherited;

  //Cria as classes a serem usadas
  Naturendimento := TCtrlNatuRendimento.Create;
  NatuRendimento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  cds.data := NatuRendimento.ProcurarNaturendimento('0');
  NatuRendimento.CdsNaturendimento := cds;

  CtrlUtil := TCtrlUtil.Create;
  CtrlUtil.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  cdsFormaPagamento.data := CtrlUtil.ListFormaPagto;
  cdsTipoDesembolso.data := CtrlUtil.ListTipoDesemb;
end;



procedure TfrmCadNatRendimentoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  NatuRendimento.free;
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  NatuRendimento.GravarNaturendimento;
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  NatuRendimento.GravarNaturendimento;
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  NatuRendimento.GravarNaturendimento;
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
   Begin
     cds.data :=  NatuRendimento.ProcurarNaturendimento(MontaSelect.ValoresChave[0]);
     NatuRendimento.CdsNaturendimento := cds;
     VerificaAtributos;
   end;
end;



procedure TfrmCadNatRendimentoMT.VerificaAtributos;
begin
  if trim(cds.fieldByname('GRUPOTRIBUTO').Asstring) <> '' then
     cbTributo.ItemIndex := cds.fieldByname('GRUPOTRIBUTO').Asinteger - 1
  else
     cbTributo.ItemIndex := - 1;

  if trim(cds.fieldByname('PERIODICIDADE').Asstring) <> '' then
     Begin
       if cds.fieldByname('PERIODICIDADE').Asstring = 'D' then
          cbPeriodicidade.ItemIndex := 0
       else if cds.fieldByname('PERIODICIDADE').Asstring = 'S' then
          cbPeriodicidade.ItemIndex := 1
       else if cds.fieldByname('PERIODICIDADE').Asstring = 'X' then
          cbPeriodicidade.ItemIndex := 2
       else if cds.fieldByname('PERIODICIDADE').Asstring = 'Q' then
          cbPeriodicidade.ItemIndex := 3
       else if cds.fieldByname('PERIODICIDADE').Asstring = 'M' then
          cbPeriodicidade.ItemIndex := 4
       else if cds.fieldByname('PERIODICIDADE').Asstring = 'T' then
          cbPeriodicidade.ItemIndex := 5
       else if cds.fieldByname('PERIODICIDADE').Asstring = 'A' then
          cbPeriodicidade.ItemIndex := 6;
     end
  else
     cbPeriodicidade.ItemIndex := - 1;
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  cbTributo.ItemIndex := -1;
  cbPeriodicidade.ItemIndex := -1;
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;



procedure TfrmCadNatRendimentoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cds.data := NatuRendimento.ProcurarNaturendimento('0');
end;



procedure TfrmCadNatRendimentoMT.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;

  if OrigemAbortConfirma in [ OaApplyInsert, OaApplyDelete, OaApplyEdit ] then
     MsgDlg(NatuRendimento.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;



procedure TfrmCadNatRendimentoMT.dbcDCTFClick(Sender: TObject);
begin
  inherited;
  if dbcDCTF.Checked then
  begin
    dbedtVariacao.Visible := True;
    lblVariacao.Visible   := True;
  end
  else
  begin
    dbedtVariacao.Clear;
    dbedtVariacao.Visible := False;
    lblVariacao.Visible   := False;
  end;
end;

end.
