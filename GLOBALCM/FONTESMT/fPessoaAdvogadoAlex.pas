unit fPessoaAdvogadoAlex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, uCtrlPessoaAdvogadoAlex,
  dBaseDados, uSistema, uCmTypes,
  uCtrlPessoa;

type
  TFrmPessoaAdvogadoAlex = class(TFrmPessoaMT)
    TabSheet1: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    Panel4: TPanel;
    Label2: TLabel;
    wwDBEdit1: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  protected
    {Método a ser sobrescrito para atribuição do Data do
    ClientDataSet do subtipo e dos outros adicionais ao
    pessoa}
    procedure SelSubTipo(rIdPessoa: Double); Override;
  end;

var
  FrmPessoaAdvogadoAlex: TFrmPessoaAdvogadoAlex;

implementation

{$R *.DFM}

{ TFrmPessoaAdvogado }

procedure TFrmPessoaAdvogadoAlex.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data :=
           TCtrlPessoaAdvogadoAlex(Pessoa).SelAdvogadoAlex(rIdPessoa);

end;

procedure TFrmPessoaAdvogadoAlex.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaAdvogadoAlex.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True,
                   Sistema.ConnectionType,
                   Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True);
  Pessoa.SubTipo := stAdvogado;
  Pessoa.TipoPessoa := tpOpcional;

  // alex
  Pessoa.MudaCaption := false;

  inherited;

end;

end.
