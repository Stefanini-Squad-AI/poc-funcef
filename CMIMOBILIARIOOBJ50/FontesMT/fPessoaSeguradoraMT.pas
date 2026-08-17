unit fPessoaSeguradoraMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE PESSOA - SEGURADORA  ( MT )
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
  TfrmPessoaSeguradoraMT = class(TFrmPessoaMT)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;

  end;

var
  frmPessoaSeguradoraMT: TfrmPessoaSeguradoraMT;

implementation

Uses dBaseDados, uCtrlPessoaSeguradora, uCtrlPessoa, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmPessoaSeguradoraMT.FormCreate(Sender: TObject);
begin
  // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
  Pessoa := TCtrlPessoaSeguradora.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

  // Atribui informações para o Subtipo
  Pessoa.SubTipo     := stSeguradora;
  Pessoa.TipoPessoa  := tpJuridica;
  Pessoa.MudaCaption := False;
  Pessoa.FormCaption := 'Cadastro de Seguradoras';
  inherited;
end;

procedure TfrmPessoaSeguradoraMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaSeguradora(Pessoa).SelecionaSeguradora( rIdPessoa );
end;

end.
