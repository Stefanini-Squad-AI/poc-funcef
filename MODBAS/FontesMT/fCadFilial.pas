unit fCadFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, ExtDlgs,
  Menus, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, checklst, DBCtrls, ExtCtrls, TabControlDetalhe, wwdblook, Mask, TREdit,
  wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin,
  CmEventosCadastro, ImgList, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, fpessoaMT,
  DBClient, uCMClientDataSet, CMProcura, TB97Tlwn, uCtrlListTerceirosRH;

type
  TfrmCadFilial = class(TfrmPessoaMT)
    tbshSegmento: TTabSheet;
    dblcRamo: TwwDBLookupCombo;
    CdsRamo: TCMClientDataSet;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  protected
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure SelSubTipo(IdPessoa: double); override;
  end;

var
  frmCadFilial: TfrmCadFilial;

implementation

uses uCMTypes, uSistema, uMensErro, uCtrlPessoa, uCtrlPessoaFilialPessoa, uCtrlPadroes,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadFilial.FormCreate(Sender: TObject);
begin
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  Pessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stFilial;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;

  inherited;
  if (CtrlUsoGeralRH.UsuXFilial <> '') then
    MontaSelect.Filtro.Add('FILIALPESSOA.IDFILIALPESSOA IN ' +CtrlUsoGeralRH.UsuXFilial);

  CdsRamo.Data := CtrlListTerceirosRH.ListRamoFornecedor;
end;

procedure TfrmCadFilial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadFilial.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(CmpGrupo.Text) = '') then
    MsgDlg('Indique a que Empresa/Grupo/Estabelecimento pertence.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0)
  else
    inherited;
end;

procedure TfrmCadFilial.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmCadFilial.SelSubTipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaFilialPessoa(Pessoa).ListSubTipo(IdPessoa);
end;

end.
