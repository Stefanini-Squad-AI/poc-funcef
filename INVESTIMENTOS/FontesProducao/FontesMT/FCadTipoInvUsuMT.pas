//******************************************************************************
// Data     : 18/01/2007
// Pendencia: 24235
// Desc     : Implementação do cadastramento Tipo de Investimento por Usuário
//            em 3 camadas. Estou permitindo o Tipo de Investimento em branco,
//            porém afterlogin o sistema dá um update em usuariotipomenu e coloca
//            tipomenu=´A´
//******************************************************************************
unit FCadTipoInvUsuMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uctrlinvestimento,uCtrlPadroes,
  uMensErro,uCMTypes, DBCtrls, wwdblook,uCtrlParamInvest;

type
  TFrmCadTipoInvUsuMT = class(TFrmCadastroGridMTInv)
    dblUsuario: TwwDBLookupCombo;
    Label2: TLabel;
    dblTipoInvest: TwwDBLookupCombo;
    Label3: TLabel;
    dblPlano: TwwDBLookupCombo;
    Label1: TLabel;
    CdsUsuario: TCMClientDataSet;
    CdsTipoInvest: TCMClientDataSet;
    CdsPlanoPatro: TCMClientDataSet;
    Panel1: TPanel;
    dbrMenuSelecionado: TDBRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure dblTipoInvestExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestimento: TCtrlInvestimento;
    Procedure Seleciona(iIdUsuario: Integer = -1);
  public
    { Public declarations }
    iIdUsuarioAnt: Integer;

  end;

var
  FrmCadTipoInvUsuMT: TFrmCadTipoInvUsuMT;

implementation

uses FPrincipal;

{$R *.DFM}

{ TFrmCadastroGridMTInv1 }

procedure TFrmCadTipoInvUsuMT.Seleciona(iIdUsuario: Integer = -1);
begin
   Cds.Data := CtrlInvestimento.ListTipoInvUsu;
   If iIdUsuario > 0 then
     Cds.Locate('IDUSUARIO',iIdUsuario,[lopartialkey]);
end;

procedure TFrmCadTipoInvUsuMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlInvestimento);
end;

procedure TFrmCadTipoInvUsuMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlInvestimento := TCtrlInvestimento.Create;
  CtrlInvestimento.InitializeAs(Padroes);
  CtrlInvestimento.CdsTipoInvUsu := Cds;
  CdsTipoInvest.data := CtrlInvestimento.ListTipoInvest;
  CdsUsuario.data := CtrlInvestimento.ListUsuario;
  CdsPlanoPatro.Data := CtrlInvestimento.ListPlanoPatro;
  Seleciona;
end;

procedure TFrmCadTipoInvUsuMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  //==========================================================
  // Está aqui pois o grid não está sendo atualizado
  // automaticamente ao cancelar as operações
  // ==========================================================
  Seleciona(iIdUsuarioAnt);
end;

procedure TFrmCadTipoInvUsuMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
      Cds.Locate('IDUSUARIO',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadTipoInvUsuMT.bbtnConfirmarClick(Sender: TObject);
Var iTipoInvestUsu: Integer;
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
  Seleciona(iIdUsuarioAnt);
  // Se o usuário logado for o alterado mudo o menu principal de acordo com o
  // menu selecionado
  If Cds.Fieldbyname('IDUSUARIO').AsInteger = CtrlPInv.IDUsuario then
  begin
     iTipoInvestUsu := Cds.Fieldbyname('IDTIPOINVEST').AsInteger;
     case dbrMenuSelecionado.ItemIndex of
          0: FrmPrincipal.MudaMenu(iTipoInvestUsu,'F');
          1: FrmPrincipal.MudaMenu(iTipoInvestUsu,'V');
          2: FrmPrincipal.MudaMenu(iTipoInvestUsu,'B');
          3: FrmPrincipal.MudaMenu(iTipoInvestUsu,'I');
          4: FrmPrincipal.MudaMenu(iTipoInvestUsu,'A'); // Todos
     end;
  end;
end;

procedure TFrmCadTipoInvUsuMT.sbtnAlterarClick(Sender: TObject);
begin
  if not Cds.IsEmpty then
     iIdUsuarioAnt := cds.FieldByName('IDUSUARIO').AsInteger;
  inherited;
   if dblUsuario.CanFocus then
     dblUsuario.SetFocus;

end;

procedure TFrmCadTipoInvUsuMT.sbtnInserirClick(Sender: TObject);
begin
  if not Cds.IsEmpty then
     iIdUsuarioAnt := cds.FieldByName('IDUSUARIO').AsInteger;
  inherited;
  if dblUsuario.CanFocus then
    dblUsuario.SetFocus;
end;

procedure TFrmCadTipoInvUsuMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);

begin
  inherited;
  Accept := True;
  if CmeCadastro.Operacao in [OpInserir,OpAlterar] then;
   begin
      if Trim(dblUsuario.Text) = '' then
      begin
         MsgDlg('Usuário não Informado.','Atenção' ,MtWarning,[mbok],0);
         if dblUsuario.CanFocus then
            dblUsuario.SetFocus;
         Accept := False;
      end
      else if dbrMenuSelecionado.ItemIndex = -1 then
      begin
         MsgDlg('Selecione um Tipo de Menu.','Atenção' ,MtWarning,[mbok],0);
         if dbrMenuSelecionado.CanFocus then
            dbrMenuSelecionado.SetFocus;
         Accept := False;
      end;
  end;
end;

procedure TFrmCadTipoInvUsuMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin


  Accept := CtrlInvestimento.AplicaTipoInvUsu;

   If CmeCadastro.Operacao in [OpInserir] then
    iIdUsuarioAnt := CtrlInvestimento.IdUsuario;

  if not Accept then
  begin
     If Pos('XPK' , uppercase(CtrlInvestimento.MessageInfo)) > 0 then
        MsgDlg('Usuário já Cadastrado!','Mensagem do Sistema',mtwarning,[mbOk],0)
     else
        MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
               'Motivo: ' + CtrlInvestimento.MessageInfo,'Mensagem do Sistema',mtwarning,[mbOk],0);
     exit;
  end;

  inherited;
end;

procedure TFrmCadTipoInvUsuMT.dblTipoInvestExit(Sender: TObject);
begin
  inherited;
  case CdsTipoInvest.fieldbyname('idtipoinvest').asinteger  of
    1: dbrMenuSelecionado.itemindex := 0;
    2: dbrMenuSelecionado.itemindex := 1;
    5: dbrMenuSelecionado.itemindex := 3;
    6: dbrMenuSelecionado.itemindex := 3;
    7: dbrMenuSelecionado.itemindex := 3;
    8: dbrMenuSelecionado.itemindex := 2;
    9: dbrMenuSelecionado.itemindex := 3;
    10: dbrMenuSelecionado.itemindex := 3;
  else
    dbrMenuSelecionado.itemindex := 4; // Todos
  end;

  //** Se o Tipo de Investimento não for escolhido será habilitado todo menu
  If dblTipoInvest.text = '' then
     dbrMenuSelecionado.itemindex := 4; // Todos

end;

procedure TFrmCadTipoInvUsuMT.sbtnApagarClick(Sender: TObject);
begin
 if not Cds.IsEmpty then
   iIdUsuarioAnt := cds.FieldByName('IDUSUARIO').AsInteger;
  inherited;
 Seleciona(iIdUsuarioAnt);
end;

procedure TFrmCadTipoInvUsuMT.dbGrdDblClick(Sender: TObject);
begin
  if not Cds.IsEmpty then
     iIdUsuarioAnt := cds.FieldByName('IDUSUARIO').AsInteger;
  inherited;
  if dblUsuario.CanFocus then
    dblUsuario.SetFocus;
end;

end.
