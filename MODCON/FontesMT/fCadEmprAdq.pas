unit fCadEmprAdq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtDlgs, Db,
  IvDictio, IvMulti, IvEMulti, MontaSelect,  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  TB97Tlbr, Buttons, TB97, StdCtrls, DBCtrls, checklst, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  ExtCtrls, Mask, wwdbedit, TabControlDetalhe, CMDBLookupCombo, CmEventosCadastro, ImgList,
  wwdbdatetimepicker, Menus, CMDateTimePicker, Wwdbspin, wwdblook, TREdit, fpessoaMT,
  DBClient, uCMClientDataSet, CMProcura, TB97Tlwn;

type
  TfrmCadEmprAdq = class(TfrmPessoaMT)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  protected
    procedure SelSubTipo(IdPessoa: double); override;
  end;

var
  frmCadEmprAdq: TfrmCadEmprAdq;

implementation

uses uCMTypes, uSistema, uCtrlPessoa, uCtrlPadroes, uCtrlFuncoesRH, uCtrlPessoaFornServ;

{$R *.DFM}

procedure TfrmCadEmprAdq.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaFornServ.Create;
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stFornecedor;
  Pessoa.TipoPessoa := tpOpcional;
  Pessoa.MostraFoto := false;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;

  case (Sistema.IdModulo) of
    MODCON : Pessoa.FormCaption := 'Cadastro de Empresas Adquiridas ou Adquirentes';
    else     Pessoa.FormCaption := 'Cadastro de Requerentes, Requeridos ou Litisconsortes';
  end;
  inherited;

  case (Sistema.IdModulo) of
    MODCON :
    begin
      HelpContext := 760006;
      bbtnAjuda.HelpContext := 760006;
    end;
    PROCJUD, PROCPREV :
    begin
      HelpContext := 1110003;
      bbtnAjuda.HelpContext := 1110003;
    end;
    SISTJURCONS :
    begin
      HelpContext := 7190007;
      bbtnAjuda.HelpContext := 7190007;
    end;
  end;
end;

procedure TfrmCadEmprAdq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  inherited;
end;

procedure TfrmCadEmprAdq.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmCadEmprAdq.SelSubTipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaFornServ(Pessoa).SelFornServ(IdPessoa);
end;

end.
