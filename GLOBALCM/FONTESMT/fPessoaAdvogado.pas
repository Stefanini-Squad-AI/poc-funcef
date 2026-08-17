unit fPessoaAdvogado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, uCtrlPessoaAdvogadoAlex,
  dBaseDados;

type
  TFrmPessoaAdvogado = class(TFrmPessoaMT)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Pessoa : TCtrlPessoaAdvogadoAlex;
  public
    { Public declarations }
  protected
    {Método a ser sobrescrito para atribuição do Data do
    ClientDataSet do subtipo e dos outros adicionais ao
    pessoa}
    procedure SelSubTipo(rIdPessoa: Double); Override;
  end;

var
  FrmPessoaAdvogado: TFrmPessoaAdvogado;

implementation

{$R *.DFM}

{ TFrmPessoaAdvogado }

procedure TFrmPessoaAdvogado.SelSubTipo(rIdPessoa: Double);
begin
  inherited;

end;

procedure TFrmPessoaAdvogado.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaAdvogadoAlex.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True,
                   Sistema.ConnectionType,
                   Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True);
  Pessoa.SubTipo := stAdvogadoAlex;
  Pessoa.TipoPessoa := tpOpcional;

  inherited;

end;

end.
