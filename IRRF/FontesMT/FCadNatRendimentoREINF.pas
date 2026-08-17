unit FCadNatRendimentoREINF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, uSistema,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBaseDados,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uMensErro,
  wwdblook, CMProcuraSubTipo, Mask, wwdbedit, uCtrlNaturezaRendimentoREINF, uCtrlUtil,
  DBCtrls, uCMTypes, uCtrlNatuRendimento;

type
  TfrmCadNatRendimentoREINF = class(TFrmCadastroMT)
    lblCodigo: TLabel;
    edtCodigo: TwwDBEdit;
    Label1: TLabel;
    edtTitulo: TwwDBEdit;
    cdsAux: TCMClientDataSet;
    Label2: TLabel;
    edtDescricao: TwwDBEdit;
    Label3: TLabel;
    edtGrupoRendimento: TEdit;
    rgTipoDeclarante: TRadioGroup;
    Label4: TLabel;
    lkpCodDirf: TwwDBLookupCombo;
    cdsNatuRendimento: TCMClientDataSet;
    chkResidExt: TCheckBox;
    chkTribRend13: TCheckBox;
    chkTribRendRRA: TCheckBox;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtTituloChange(Sender: TObject);
    procedure rgTipoDeclaranteClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure chkResidExtClick(Sender: TObject);
    procedure chkTribRend13Click(Sender: TObject);
    procedure chkTribRendRRAClick(Sender: TObject);
  private
    //CtrlUtil : TCtrlUtil;
    CtrlNaturezaRendimentoREINF: TCtrlNaturezaRendimentoREINF;
    CtrlNatuRendimento : TCtrlNatuRendimento;
    iCodGrupo: Integer;
    procedure VerificaAtributos;
  public
    { Public declarations }
  end;

var
  frmCadNatRendimentoREINF: TfrmCadNatRendimentoREINF;

implementation
{$R *.DFM}

procedure TfrmCadNatRendimentoREINF.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  VerificaAtributos;
  edtTitulo.SetFocus;
end;

procedure TfrmCadNatRendimentoREINF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edtCodigo.SetFocus;
end;

procedure TfrmCadNatRendimentoREINF.bbtnConfirmarClick(Sender: TObject);
begin
  if Length(Trim(edtCodigo.Text)) < 5 then
  begin
    MsgDlg('Obrigatório preencher os 5 dígitos do Código','Erro',mtError,[mbOK],0);
    edtCodigo.SetFocus;
    Exit;
  end;

  if Trim(edtDescricao.Text) = '' then
  begin
    MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOK],0);
    edtDescricao.SetFocus;
    Exit;
  end;

  if (sbtnInserir.Down = True) then
  begin
     if CtrlNaturezaRendimentoREINF.VerificaExistenciaNatureza(StrToInt(edtCodigo.Text)) then
     begin
       MsgDlg('Já existe uma Natureza de Rendimento com este código.','Aviso',mtWarning,[mbOK],0);
       edtCodigo.SetFocus;
       edtCodigo.Text := EmptyStr;
       Exit;
     end;
  end;
  inherited;
end;



procedure TfrmCadNatRendimentoREINF.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria as classes a serem usadas
  CtrlNaturezaRendimentoREINF := TCtrlNaturezaRendimentoREINF.Create;
  CtrlNaturezaRendimentoREINF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                                         Sistema.AppRemoteServer,True,nil,nil,False);
  CtrlNaturendimento := TCtrlNatuRendimento.Create;
  CtrlNatuRendimento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,True,nil,nil,False);
  cds.data := CtrlNaturezaRendimentoREINF.ListRendimentosREINF(-1);
  CtrlNaturezaRendimentoREINF.CdsNaturendimentoREINF := cds;
  cdsNatuRendimento.Data := CtrlNatuRendimento.ListNaturendimento;
  iCodGrupo := -1;
end;



procedure TfrmCadNatRendimentoREINF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlNaturezaRendimentoREINF);
  FreeAndNil(CtrlNatuRendimento);
end;



procedure TfrmCadNatRendimentoREINF.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;

  if not CtrlNaturezaRendimentoREINF.GravaRendimentoREINF then
     MsgDlg(CtrlNaturezaRendimentoREINF.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;



procedure TfrmCadNatRendimentoREINF.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;

  if not CtrlNaturezaRendimentoREINF.GravaRendimentoREINF then
    MsgDlg(CtrlNaturezaRendimentoREINF.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;



procedure TfrmCadNatRendimentoREINF.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;

  if not CtrlNaturezaRendimentoREINF.GravaRendimentoREINF then
     MsgDlg(CtrlNaturezaRendimentoREINF.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;



procedure TfrmCadNatRendimentoREINF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
   Begin
     cds.data := CtrlNaturezaRendimentoREINF.ListRendimentosREINF(StrToInt(MontaSelect.ValoresChave[0]));
     CtrlNaturezaRendimentoREINF.CdsNaturendimentoREINF := cds;
     VerificaAtributos;
   end;
end;



procedure TfrmCadNatRendimentoREINF.VerificaAtributos;

begin
  edtGrupoRendimento.Enabled := True;
  edtGrupoRendimento.Text := CtrlNaturezaRendimentoREINF.DescricaoGruporendimentoREINF(
                                          Cds.FieldByName('CODGRUPONATUREZA').AsInteger, iCodGrupo);
  edtGrupoRendimento.Enabled := False;

   if Cds.FieldByName('TIPODECLARANTE').AsString = 'F' then
    rgTipoDeclarante.ItemIndex := 0
   else
    if Cds.FieldByName('TIPODECLARANTE').AsString = 'J' then
      rgTipoDeclarante.ItemIndex := 1
    else
      rgTipoDeclarante.ItemIndex := 2;

  if Cds.FieldByName('TRIBUTACAOEXTERIOR').asString = 'S' then
    chkResidExt.Checked :=  True
  else
    chkResidExt.Checked :=  False;

  if Cds.FieldByName('INDNATUREZA13').asString = 'S' then
    chkTribRend13.Checked := True
  else
    chkTribRend13.Checked := False;

  if Cds.FieldByName('INDNATUREZARRA').asString = 'S' then
    chkTribRendRRA.Checked := True
  else
    chkTribRendRRA.Checked := False;
end;

procedure TfrmCadNatRendimentoREINF.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cds.data := CtrlNaturezaRendimentoREINF.ListRendimentosREINF(-1);
end;

procedure TfrmCadNatRendimentoREINF.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if OrigemAbortConfirma in [ OaApplyInsert, OaApplyDelete, OaApplyEdit ] then
     MsgDlg(CtrlNaturezaRendimentoREINF.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;

procedure TfrmCadNatRendimentoREINF.edtDescricaoExit(Sender: TObject);
begin
  inherited;
  if edtTitulo.Text = EmptyStr then
    edtTitulo.Text := Copy(edtDescricao.Text, 1, 50);
end;

procedure TfrmCadNatRendimentoREINF.edtTituloChange(Sender: TObject);
begin
  inherited;
  if Cds.State in [dsInsert, dsEdit] then
    cds.FieldByName('TITULO').asString := edtTitulo.Text;
end;

procedure TfrmCadNatRendimentoREINF.rgTipoDeclaranteClick(Sender: TObject);
begin
  inherited;
  if Cds.State in [dsInsert, dsEdit] then
    case rgTipoDeclarante.ItemIndex of
      0: cds.FieldByName('TIPODECLARANTE').AsString := 'F';
      1: cds.FieldByName('TIPODECLARANTE').AsString := 'J';
    else
        cds.FieldByName('TIPODECLARANTE').AsString := 'A';
    end;
end;

procedure TfrmCadNatRendimentoREINF.edtCodigoExit(Sender: TObject);
begin
  inherited;
  iCodGrupo := -1;
  if edtCodigo.Text <> EmptyStr  then
    edtGrupoRendimento.Text := CtrlNaturezaRendimentoREINF.DescricaoGruporendimentoREINF(
                                              StrToInt(Copy(edtCodigo.Text,1, 2)), iCodGrupo);
  if (Cds.State in [dsInsert, dsEdit]) and (iCodGrupo > 0) then
    cds.FieldByName('CODGRUPONATUREZA').AsInteger := StrToInt(Copy(edtCodigo.Text,1, 2));

end;

procedure TfrmCadNatRendimentoREINF.edtCodigoEnter(Sender: TObject);
begin
  inherited;
  edtGrupoRendimento.Enabled := True;
  edtGrupoRendimento.Text := EmptyStr;
  edtGrupoRendimento.Enabled := False;
end;

procedure TfrmCadNatRendimentoREINF.chkResidExtClick(Sender: TObject);
begin
  inherited;

  if Cds.State in [dsInsert, dsEdit] then
  begin
    if chkResidExt.Checked then
      Cds.FieldByName('TRIBUTACAOEXTERIOR').AsString := 'S'
    else
      Cds.FieldByName('TRIBUTACAOEXTERIOR').AsString := 'N'
  end;
end;

procedure TfrmCadNatRendimentoREINF.chkTribRend13Click(Sender: TObject);
begin
  inherited;

  if Cds.State in [dsInsert, dsEdit] then
  begin
    if chkTribRend13.Checked then
      Cds.FieldByName('INDNATUREZA13').AsString := 'S'
    else
      Cds.FieldByName('INDNATUREZA13').AsString := 'N'
  end;
end;

procedure TfrmCadNatRendimentoREINF.chkTribRendRRAClick(Sender: TObject);
begin
  inherited;

  if Cds.State in [dsInsert, dsEdit] then
  begin
    if chkTribRendRRA.Checked then
      Cds.FieldByName('INDNATUREZARRA').AsString := 'S'
    else
      Cds.FieldByName('INDNATUREZARRA').AsString := 'N'
  end;
end;

end.
