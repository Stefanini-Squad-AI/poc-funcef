unit FCadLocatario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadCliente, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, CMProcuraMask, Buttons, DBCtrls, ExtCtrls,
  CMProcura, StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, uCtrlPessoaLocatario, TB97Tlwn;

type
  TfrmCadLocatario = class(TfrmCadCliente)
    cdsLocatario: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SelPessoa(rIdPessoa: Double); Override;
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;
  end;
var
  frmCadLocatario: TfrmCadLocatario;

implementation

Uses dBaseDados, uCtrlPessoaCliente, uSistema, uCMTypes,
     uModuloImobiliario;

{$R *.DFM}

procedure TfrmCadLocatario.FormCreate(Sender: TObject);
begin

   Pessoa := TCtrlPessoaLocatario.Create;
   Pessoa.Initialize(DtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

   // Atribui informações para o Subtipo
   Pessoa.SubTipo      := stLocatario;
   Pessoa.TipoPessoa   := tpOpcional;
   Pessoa.MudaCaption  := False;
   Pessoa.CdsSubTipo   := cdsSubTipo;
   Pessoa.FormCaption  := 'Cadastro de Proprietários / Locatários';

   inherited;

end;



procedure TfrmCadLocatario.SelPessoa(rIdPessoa: Double);
begin
   // Usado pelo molLocatario para abrir o cadastro de pessoa
   inherited;

end;



procedure TfrmCadLocatario.SelSubTipo(rIdPessoa: Double);
begin
   inherited;
   cdsSubTipo.Data := TCtrlPessoaLocatario(Pessoa).SelecionaLocatario( rIdPessoa );
end;



procedure TfrmCadLocatario.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   cdsSubTipo.FieldByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
   cdsSubTipo.FieldByName('IDLOCATARIO').AsInteger := cds.FieldByName('IDPESSOA').AsInteger;
   inherited;
   if Accept then GravaCliente;
end;



procedure TfrmCadLocatario.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if Accept then GravaCliente;
end;


end.
