unit fPessoaResponsavelMT;

// -----------------------------------------------------------------------------
//
//      CADASTRO DE PESSOA - RESPONSAVEL  ( MT )
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
  TfrmPessoaResponsavelMT = class(TFrmPessoaMT)
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SelPessoa(rIdPessoa: Double); Override;       
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;

  end;

var
  frmPessoaResponsavelMT: TfrmPessoaResponsavelMT;

implementation

Uses dBaseDados, uCtrlPessoaResponsavel, uCtrlPessoa, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmPessoaResponsavelMT.FormCreate(Sender: TObject);
begin
  // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
  Pessoa := TCtrlPessoaResponsavel.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);

  // Atribui informações para o Subtipo
  Pessoa.SubTipo     := stResponsavel;
  Pessoa.TipoPessoa  := tpFisica;
  Pessoa.MudaCaption := False;
  Pessoa.FormCaption := 'Cadastro de Responsáveis';
  inherited;
end;

procedure TfrmPessoaResponsavelMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaResponsavel(Pessoa).SelecionaResponsavel( rIdPessoa );
end;

procedure TfrmPessoaResponsavelMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  CdsSubTipo.FieldByName('FLGIMOBILIARIO').AsInteger := 1;
  inherited;
end;

procedure TfrmPessoaResponsavelMT.SelPessoa(rIdPessoa: Double);
begin
  // Usado pelo molResponsavel para abrir o cadastro de pessoa
  inherited;
end;

end.
