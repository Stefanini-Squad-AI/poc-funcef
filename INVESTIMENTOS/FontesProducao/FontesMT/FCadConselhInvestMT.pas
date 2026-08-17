//*****************************************************************************
// Data	     : 14/03/2006
// Código    :
// Pendencia : 20704
// SOL       : 36184
// Motivo(S) : Implementação da CdsConselhInvest e suas funções
//*****************************************************************************
unit FCadConselhInvestMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, Db, MontaSelect, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, ExtCtrls, CMProcura,
  StdCtrls, CheckLst, ComCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn,
  uCmSqlParams, uCtrlPessoaConselhInvest, uCtrlPessoa,
  DBaseDados, uMensErro, uSistema, uCMTypes, uCtrlPadroes;

type
  TFrmCadConselhInvestMT = class(TFrmPessoaMT)
    tbsConselheiro: TTabSheet;
    pnlSubTipo: TPanel;
    lblConselheiro: TLabel;
    dbeConselheiro: TwwDBEdit;
    CMSqlParams2: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;
  end;

var
  FrmCadConselhInvestMT: TFrmCadConselhInvestMT;

implementation

{$R *.DFM}

{ TFrmCadConselhInvestMT }

procedure TFrmCadConselhInvestMT.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaConselhInvest(Pessoa).SelecionaConselhInvest( rIdPessoa );
end;

procedure TFrmCadConselhInvestMT.FormCreate(Sender: TObject);
begin
   // Cria e inicializa o objeto de controle do subtipo ( já declarado no form pai )
   Pessoa := TCtrlPessoaConselhInvest.Create;
   Pessoa.InitializeAs(Padroes);

   // Atribui informações para o Subtipo
   Pessoa.SubTipo     := stConselheiro;
   Pessoa.TipoPessoa  := tpOpcional;
   Pessoa.MudaCaption := False;
   Pessoa.FormCaption := 'Cadastro de Conselheiros de Investimento';
  inherited;
end;

end.
