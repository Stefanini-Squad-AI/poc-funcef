unit FCadAtivProdServMT;
   
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlListaServicos, uCtrlModeloscnab, Grids, Wwdbigrd, Wwdbgrid, wwdblook, CMDBLookupCombo,
  DBCtrls, Mask, wwdbedit, DBTables, uCMTypes, CMDatabase, uCmSqlParams,
  FCadastroMT, ComCtrls, TabControlDetalhe, Wwdbspin, uCtrlTipoalterador,
  TREdit;

type
  TFrmCadAtivProdServMT = class(TFrmCadastroMestreDetMT)
    cdsNaturezaRendimento: TCMClientDataSet;
    lkpNaturezaRendimento: TwwDBLookupCombo;
    edtCodigo: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    CdsDet: TCMClientDataSet;
    Label5: TLabel;
    Label7: TLabel;
    lkpAlterador: TwwDBLookupCombo;
    cdsAlterador: TCMClientDataSet;
    rgTipoTributacao: TDBRadioGroup;
    Label8: TLabel;
    edtDescricao: TwwDBEdit;
    edtNome: TwwDBEdit;
    edtAliquota: TDBRealEdit;
    rgPeriodoTributacao: TDBRadioGroup;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure rgTipoTributacaoChange(Sender: TObject);
    procedure CmeDetalheAfterConfirma(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure rgPeriodoTributacaoChange(Sender: TObject);
    procedure lkpAlteradorChange(Sender: TObject);
  private
    { Private declarations }
    CtrlListaServicos : TCtrlListaServicos;
    CtrlTipoAlterador : TCtrlTipoalterador;
    function ValidaAlteradorTributo(iCodAlterador: Integer; var sMsg: string): Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadAtivProdServMT: TFrmCadAtivProdServMT;

implementation

uses uMensErro,DBaseDados, uSistema, uModulo, uCtrlParamIntegra;

{$R *.DFM}
{ TFrmCadBancosxCodigosMT }

procedure TFrmCadAtivProdServMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     cds.data := CtrlListaServicos.ListServicos(StrToIntDef(MontaSelect.ValoresChave[0],0));
     cdsDet.data   := CtrlListaServicos.ListTributacaoServico(StrToIntDef(MontaSelect.ValoresChave[0],0));
  end;
end;

procedure TFrmCadAtivProdServMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListaServicos := TCtrlListaServicos.Create;
  CtrlListaServicos.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  CtrlTipoAlterador:= TCtrlTipoalterador.Create;
  CtrlTipoAlterador.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  CtrlListaServicos.cds := cds;
  CtrlListaServicos.cdsDet := cdsDet;

  cds.Data := CtrlListaServicos.ListServicos(-1);
  cdsDet.data   := CtrlListaServicos.ListTributacaoServico(-1);
  cdsAlterador.Data := CtrlTipoAlterador.ListTipoalterador(Sistema.IdEmpresa, 'P', 0, '');
  cdsNaturezaRendimento.Data := CtrlListaServicos.ListNaturezaRendimentoREINF(-1);
end;

procedure TFrmCadAtivProdServMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  bbtnCancelarDetClick(Sender);  
  inherited;

end;

procedure TFrmCadAtivProdServMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlListaServicos.ExcluirServico;
end;

procedure TFrmCadAtivProdServMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlListaServicos.GravarServico;
end;

procedure TFrmCadAtivProdServMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlListaServicos.GravarServico;
end;

procedure TFrmCadAtivProdServMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if CtrlListaServicos.MessageInfo <> '' then
     MsgDlg(CtrlListaServicos.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadAtivProdServMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 136888 - Início
  {if Cds.State in [dsInsert] then
  begin
    if (CtrlListaServicos.VerificaServicoExistente(edtCodigo.Text)) then
    begin
      MsgDlg('Já existe um tipo identificado por este código.', 'Aviso', mtWarning, [mbOk], 0);
      edtCodigo.SetFocus;
      Accept := False;
      Exit;
    end;
  end;}
  //Cássio Rovaroto - SIG nº 136888 - Fim

  if Cds.State in [dsEdit, dsInsert] Then
  begin
    if (edtCodigo.Text =  '') then
    begin
      MsgDlg('Defina o código para este tipo.', 'Aviso', mtWarning, [mbOk], 0);
      edtCodigo.SetFocus;
      Accept := False;
      Exit;
    end;

    if (edtNome.Text =  '') then
    begin
      MsgDlg('Defina um nome para este tipo.', 'Aviso', mtWarning, [mbOk], 0);
      edtNome.SetFocus;
      Accept := False;
      Exit;
    end;

    if (edtDescricao.Text = '') then
    begin
      MsgDlg('Descrição não informada.','Aviso',mtWarning,[mbOk],0);
      edtDescricao.SetFocus;
      Accept := False;
      Exit;
    end;

    if (lkpNaturezaRendimento.Text =  '') then
    begin
      MsgDlg('Defina a natureza de rendimento.', 'Aviso', mtWarning, [mbOk], 0);
      lkpNaturezaRendimento.SetFocus;
      Accept := False;
      Exit;
    end;
  end;
end;

procedure TFrmCadAtivProdServMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
  sMsg: String;
begin
  inherited;
  if CdsDet.State in [dsInsert, dsEdit] then
  begin
    CdsDet.DisableControls;
    if not ValidaAlteradorTributo(cdsAlterador.FieldByName('CODALTERADOR').AsInteger, sMsg) then
    begin
      Accept := False;
      MsgDlg(sMsg, 'Aviso', mtWarning, [mbOK], 0);
      CdsDet.EnableControls;
      Exit;
    end;

    if lkpAlterador.Text <> EmptyStr then
    begin
      if rgTipoTributacao.ItemIndex = -1 then
      begin
        Accept := False;
        MsgDlg('Não foi definido o tipo de tributação.', 'Aviso', mtWarning, [mbOK], 0);
        CdsDet.EnableControls;
        Exit;
      end;

      if edtAliquota.Value = 0 then
      begin
        Accept := False;
        MsgDlg('Não foi definido a alíquota de retenção tributária.', 'Aviso', mtWarning, [mbOK], 0);
        CdsDet.EnableControls;
        Exit;
      end;

      if rgPeriodoTributacao.ItemIndex = -1 then
      begin
        Accept := False;
        MsgDlg('Não foi definido o período de tributação.', 'Aviso', mtWarning, [mbOK], 0);
        CdsDet.EnableControls;
        Exit;
      end;
    end;
    CdsDet.EnableControls;
  end;
end;

function TFrmCadAtivProdServMT.ValidaAlteradorTributo(iCodAlterador: Integer; var sMsg: string): Boolean;
var
  iQtdAlterador: Integer;
begin
  Result := True;
  iQtdAlterador := 0;
  CdsDet.First;
  while CdsDet.Eof do
  begin
    if CdsDet.FieldByName('CODALTERADOR').asInteger =  iCodAlterador then
      iQtdAlterador := iQtdAlterador + 1;

    if iQtdAlterador > 1 then
    begin
      Result := False;
      sMsg :=  'Este alterador já foi inserido anteriormente.';
      Exit;
    end;

    CdsDet.Next;
  end;
end;

procedure TFrmCadAtivProdServMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsDet.Data := CtrlListaServicos.ListTributacaoServico(-1);
  edtCodigo.SetFocus;
end;

procedure TFrmCadAtivProdServMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  lkpAlterador.SetFocus;
end;

procedure TFrmCadAtivProdServMT.edtNomeExit(Sender: TObject);
begin
  inherited;
   if edtDescricao.Text = EmptyStr then
    edtDescricao.Text := edtNome.Text;
end;

procedure TFrmCadAtivProdServMT.rgTipoTributacaoChange(Sender: TObject);
begin
  inherited;
  if CdsDet.State in [dsInsert, dsEdit] then
  begin
    case rgTipoTributacao.ItemIndex of
      0: CdsDet.FieldByName('DESC_TIPOTRIBUTO').asString := 'IRRF';
      1: CdsDet.FieldByName('DESC_TIPOTRIBUTO').asString := 'PIS';
      2: CdsDet.FieldByName('DESC_TIPOTRIBUTO').asString := 'COFINS';
      3: CdsDet.FieldByName('DESC_TIPOTRIBUTO').asString := 'CSLL';
      4: CdsDet.FieldByName('DESC_TIPOTRIBUTO').asString := 'Agregado';
    end;
  end;                                       
end;

procedure TFrmCadAtivProdServMT.CmeDetalheAfterConfirma(Sender: TObject);
begin
  inherited;
  bbtnVoltarDetClick(Self);
end;

procedure TFrmCadAtivProdServMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down then
    CdsDet.Data := CtrlListaServicos.ListTributacaoServico(-1);
end;

procedure TFrmCadAtivProdServMT.rgPeriodoTributacaoChange(Sender: TObject);
begin
  inherited;

  if CdsDet.State in [dsInsert, dsEdit] then
    case rgPeriodoTributacao.ItemIndex of
        0: CdsDet.FieldByName('DESC_PERTRIBUTO').asString := 'No lançamento';
        1: CdsDet.FieldByName('DESC_PERTRIBUTO').asString := 'Na liquidação';
    end;
end;

procedure TFrmCadAtivProdServMT.lkpAlteradorChange(Sender: TObject);
begin
  inherited;
  if CdsDet.State in [dsInsert, dsEdit] then
    CdsDet.FieldByName('DESC_ALTERADOR').asString := lkpAlterador.Text;
end;

end.
