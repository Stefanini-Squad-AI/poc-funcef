unit fPessoaCartorioMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE PESSOA - CARTORIO  ( MT )
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
  TfrmPessoaCartorioMT = class(TFrmPessoaMT)
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
  frmPessoaCartorioMT: TfrmPessoaCartorioMT;

implementation

Uses dBaseDados, uCtrlPessoaCartorio, uCtrlPessoa, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmPessoaCartorioMT.FormCreate(Sender: TObject);
begin
  // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
  Pessoa := TCtrlPessoaCartorio.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

  // Atribui informações para o Subtipo
  Pessoa.SubTipo     := stCartorio;
  Pessoa.TipoPessoa  := tpJuridica;
  Pessoa.MudaCaption := False;
  Pessoa.FormCaption := 'Cadastro de Cartórios';
  inherited;
end;

procedure TfrmPessoaCartorioMT.SelPessoa(rIdPessoa: Double);
begin
  // Usado pelo molCartorio para abrir o cadastro de pessoa
  inherited;
end;

procedure TfrmPessoaCartorioMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaCartorio(Pessoa).SelecionaCartorio( rIdPessoa );
end;

end.
