unit fPessoaAvalistaMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE PESSOA - AVALISTA  ( MT )
//
//      Módulo          :  AdminImob
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  26/09/2002
//      Data de Término :  26/09/2002
//
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn;

type
  TfrmPessoaAvalistaMT = class(TFrmPessoaMT)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;

  end;

var
  frmPessoaAvalistaMT: TfrmPessoaAvalistaMT;

implementation

Uses dBaseDados, uCtrlPessoaAvalista, uCtrlPessoa, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmPessoaAvalistaMT.FormCreate(Sender: TObject);
begin
  // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
  Pessoa := TCtrlPessoaAvalista.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

  // Atribui informações para o Subtipo
  Pessoa.SubTipo     := stAvalista;
  Pessoa.TipoPessoa  := tpOpcional;
  Pessoa.MudaCaption := False;
  Pessoa.FormCaption := 'Cadastro de Avalistas / Fiadores';
  inherited;
end;

procedure TfrmPessoaAvalistaMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaAvalista(Pessoa).SelecionaAvalista( rIdPessoa );
end;

end.
