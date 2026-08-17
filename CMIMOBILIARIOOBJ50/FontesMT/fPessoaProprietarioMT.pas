unit fPessoaProprietarioMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE PESSOA - PROPRIETARIO  ( MT )
//
//      Módulo          :  Comuns Imobiliario
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  27/09/2002
//      Data de Término :  27/09/2002
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
  TfrmPessoaProprietarioMT = class(TFrmPessoaMT)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SelPessoa(rIdPessoa: Double); Override;    
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;

  end;

var
  frmPessoaProprietarioMT: TfrmPessoaProprietarioMT;

implementation

Uses dBaseDados, uCtrlPessoaProprietario, uCtrlPessoa, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmPessoaProprietarioMT.FormCreate(Sender: TObject);
begin
  // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
  Pessoa := TCtrlPessoaProprietario.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

  // Atribui informações para o Subtipo
  Pessoa.SubTipo     := stProprietarioUH;
  Pessoa.TipoPessoa  := tpOpcional;
  Pessoa.MudaCaption := False;
  Pessoa.FormCaption := 'Cadastro de Proprietários';
  inherited;
end;

procedure TfrmPessoaProprietarioMT.SelPessoa(rIdPessoa: Double);
begin
  // Usado pelo molProponente para abrir o cadastro de pessoa
  inherited;
end;

procedure TfrmPessoaProprietarioMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaProprietario(Pessoa).SelecionaProprietario( rIdPessoa );
end;

end.
