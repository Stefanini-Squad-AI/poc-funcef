unit FCadAdmFdoInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn,
  DBaseDados, uMensErro, uSistema, uCMTypes, uCmSqlParams, uCtrlPessoaAdmFdoInvest,
  uCtrlPessoa;

type
  TFrmCadAdmFdoInvestMT = class(TFrmPessoaMT)
    CMSqlParams1: TCMSqlParams;
    tbsAdmFdo: TTabSheet;
    pnlSubTipo: TPanel;
    lblAdmFdo: TLabel;
    dbeAdmFdo: TwwDBEdit;
    CMSqlParams2: TCMSqlParams;
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
  FrmCadAdmFdoInvestMT: TFrmCadAdmFdoInvestMT;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TFrmCadAdmFdoInvestMT.FormCreate(Sender: TObject);
begin
   // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
   Pessoa := TCtrlPessoaAdmFdoInvest.Create;
   Pessoa.InitializeAs(Padroes);

   // Atribui informações para o Subtipo
   Pessoa.SubTipo     := stAdmFdoInvest;
   Pessoa.TipoPessoa  := tpOpcional;
   Pessoa.MudaCaption := False;
   Pessoa.FormCaption := 'Cadastro de Adm. Fundos';
  inherited;
end;

procedure TFrmCadAdmFdoInvestMT.SelPessoa(rIdPessoa: Double);
begin
  // Usado pelo molAdministradora para abrir o cadastro de pessoa
  inherited;
end;

procedure TFrmCadAdmFdoInvestMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaAdmFdoInvest(Pessoa).SelecionaAdmFdoInvest( rIdPessoa );
end;

end.

