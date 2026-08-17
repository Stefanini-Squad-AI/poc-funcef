unit fCadEntid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, TB97, Grids,
  Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons,
  Wwdbigrd, Wwdbgrid, checklst, DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit, TREdit,
  ExtCtrls, ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, Wwdbspin, ImgList,
  CMDBLookupCombo, CmEventosCadastro, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  DBClient, uCMClientDataSet, CMProcura, TB97Tlwn, fpessoaMT;

type
  TfrmCadEntid = class(TfrmPessoaMT)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnFisJurClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  protected
    procedure SelSubTipo(IdPessoa: double); override;
  end;

var
  frmCadEntid: TfrmCadEntid;

implementation

uses uCMTypes, uSistema, uCtrlPessoa, uCtrlPadroes, uCtrlFuncoesRH, uCtrlPessoaEntid;

{$R *.DFM}

procedure TfrmCadEntid.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaEntid.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stTerceiro;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.MostraFoto := false;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;

  case (Sistema.IdModulo) of
    MODCES :
    begin
      Pessoa.FormCaption := 'Cadastro de Empresas e Entidades';
      MontaSelect.Caption := 'Seleciona Empresa ou Entidade';
      HelpContext := 740009;
      bbtnAjuda.HelpContext := 740009;
    end;
    MODFOL :
    begin
      Pessoa.FormCaption := 'Cadastro de Empresas de Transporte';
      MontaSelect.Caption := 'Seleciona Empresa de Transporte';
      HelpContext := 210031;
      bbtnAjuda.HelpContext := 210031;
    end;
    MODTRN :
    begin
      Pessoa.FormCaption := 'Cadastro de Empresas, Entidades e Instrutores';
      MontaSelect.Caption := 'Seleciona Empresa, Entidade ou Instrutor';
      Pessoa.TipoPessoa := tpOpcional;
      HelpContext := 720010;
      bbtnAjuda.HelpContext := 720010;
    end;
  end;
  inherited;
end;

procedure TfrmCadEntid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  inherited;
end;

procedure TfrmCadEntid.sbtnFisJurClick(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = MODTRN) then
  begin
    pnlMestre.Height := 105;
    LabelRAZAOSOCIAL.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
    dbedRazaoSocial.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
  end;
end;

procedure TfrmCadEntid.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = MODTRN) then
  begin
    pnlMestre.Height := 105;
    LabelRAZAOSOCIAL.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
    dbedRazaoSocial.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
  end;
end;

procedure TfrmCadEntid.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadEntid.SelSubTipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaEntid(Pessoa).ListSubTipo(IdPessoa);
end;

end.
