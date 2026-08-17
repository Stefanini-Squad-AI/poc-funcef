unit fCadAdvog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, Menus,TB97,
  MontaSelect, DBTables, Wwquery, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, checklst, DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit, ExtCtrls,
  ExtDlgs, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin,
  CmEventosCadastro, ImgList, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
  fpessoaMT, DBClient, uCMClientDataSet, CMProcura, TB97Tlwn;

type
  TfrmCadAdvog = class(TfrmPessoaMT)
    tbsHonor: TTabSheet;
    Label2: TLabel;
    dbedFator: TDBRealEdit;
    Label3: TLabel;
    qryTipoDoc: TwwQuery;
    qryTipoDocIDDOCUMENTO: TFloatField;
    qryTipoDocNOMEDOCUMENTO: TStringField;
    qryTipoDocIDREGRA: TFloatField;
    qryTipoDocFISICAJURIDICA: TStringField;
    qryTipoDocMASCARA: TStringField;
    qryTipoDocDOCCHAVE: TStringField;
    qryTipoDocOBRIGAUF: TStringField;
    qryTipoDocOBRIGAORGAO: TStringField;
    qryTipoDocOBRIGAEMISSAO: TStringField;
    qryTipoDocFLGOBRIGAVALIDADE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnFisJurClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  protected
    procedure SelSubTipo(IdPessoa: double); override;
  end;

var
  frmCadAdvog: TfrmCadAdvog;

implementation

uses uCMTypes, uSistema, uCtrlPessoa, uCtrlPadroes, uCtrlFuncoesRH, uCtrlPessoaAdvogado;

{$R *.DFM}

procedure TfrmCadAdvog.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaAdvogado.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stAdvogado;
  Pessoa.TipoPessoa := tpOpcional;
  Pessoa.MostraFoto := false;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;
  inherited;
  case (Sistema.IdModulo) of
    MODCON   :
    begin
      HelpContext := 760005;
      bbtnAjuda.HelpContext := 760005;
    end;
    PROCJUD  :
    begin
      HelpContext := 1110002;
      bbtnAjuda.HelpContext := 1110002;
    end;
    PROCPREV :
    begin
      HelpContext := 1100002;
      bbtnAjuda.HelpContext := 1100002;
    end;
    SISTJURCONS :
    begin
      HelpContext := 7190005;
      bbtnAjuda.HelpContext := 7190005;
    end;
  end;
end;

procedure TfrmCadAdvog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  inherited;
end;

procedure TfrmCadAdvog.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsSubTipo.FieldByName('FATORHONORADVOG').asFloat := 0;
end;

procedure TfrmCadAdvog.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);
end;

procedure TfrmCadAdvog.sbtnFisJurClick(Sender: TObject);
begin
  inherited;
  pnlMestre.Height := 105;
  LabelRAZAOSOCIAL.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
  dbedRazaoSocial.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
end;

procedure TfrmCadAdvog.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  pnlMestre.Height := 105;
  LabelRAZAOSOCIAL.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
  dbedRazaoSocial.Visible := sbtnFisJur.Caption = 'Pessoa Jurídica';
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadAdvog.SelSubTipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaAdvogado(Pessoa).ListSubTipo(IdPessoa);
end;

end.
