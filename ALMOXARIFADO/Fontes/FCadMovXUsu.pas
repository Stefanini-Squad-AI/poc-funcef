{ --------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação deste formulário para bloqueio de usuários e informativo dos dias úteis mensais
-------------------------------------------------------------------------------------------------- }

unit FCadMovXUsu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, uCtrlAlmoxCompra, uCtrlPadroes, TREdit;

type
  TfrmCadMovXUsu = class(TfrmOkCancelar)
    Panel3: TPanel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    pgcPrincipal: TPageControl;
    tbsUsuarios: TTabSheet;
    pnlUsuSistema: TPanel;
    pnlGrupoUsu: TPanel;
    lblUnidNegoc: TLabel;
    Label1: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    Panel1: TPanel;
    pnlButtons: TPanel;
    BtnExcluir: TSpeedButton;
    BtnExcluirTodos: TSpeedButton;
    BtnIncluirTodos: TSpeedButton;
    BtnIncluir: TSpeedButton;
    pnlUsuDisp: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    CdsGrupoAcesso: TCMClientDataSet;
    CdsGrupoAcessoIDGRUPO: TFloatField;
    CdsGrupoAcessoNOMEGRUPO: TStringField;
    CMSqlGrupoAcesso: TCMSqlParams;
    cdsUsuBloq: TCMClientDataSet;
    dsUsuBloq: TDataSource;
    cdsUsuDes: TCMClientDataSet;
    dsUsuDes: TDataSource;
    edDiaUtil: TRealEdit;
    Label3: TLabel;
    lblMsgDia: TLabel;
    lvUsuBloq: TListView;
    lvUsuDesbloq: TListView;
    sbtOK: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure dblcUnidNegocChange(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);

    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnIncluirTodosClick(Sender: TObject);
    procedure BtnExcluirTodosClick(Sender: TObject);
    procedure edDiaUtilExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtOKClick(Sender: TObject);
  private
    { Private declarations }
    LimDiaUtil: Integer;
    CtrlAlmoxCompra: TCtrlAlmoxCompra;

  public
    { Public declarations }
    iKey: Integer;
    LV: TListItem;
    procedure MontarUsuariosLibBloq;
    procedure PreencheListaBloq;
    procedure PreencheListaDesbloq;

    //procedure Troca
  end;

var
  frmCadMovXUsu: TfrmCadMovXUsu;
  sLetrasBloqueado, sLetrasLiberado : String;
  
implementation
uses dBaseDados, uSistema, uMensErro, FPrincipal;
{$R *.DFM}

procedure TfrmCadMovXUsu.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAlmoxCompra := TCtrlAlmoxCompra.Create;
  CtrlAlmoxCompra.InitializeAs(Padroes);
  CdsGrupoAcesso.Data:= CtrlAlmoxCompra.SelecionaGrupoUsuario;
  edDiaUtil.Value:= CtrlAlmoxCompra.SelecionaDiaUtilMensal;
  LimDiaUtil:= CtrlAlmoxCompra.LimiteDiaUtil;
  dblcUnidNegoc.Text:= CdsGrupoAcessoNOMEGRUPO.AsString;
end;

procedure TfrmCadMovXUsu.MontarUsuariosLibBloq;
begin
   if Trim(dblcUnidNegoc.Text) = '' then
   begin
     cdsUsuBloq.Data := CtrlAlmoxCompra.SelecionaUsuBloqDes(-1, 'S');
     cdsUsuDes.Data  := CtrlAlmoxCompra.SelecionaUsuBloqDes(-1, 'N');
   end else
   begin
     cdsUsuBloq.Data := CtrlAlmoxCompra.SelecionaUsuBloqDes(CdsGrupoAcessoIDGRUPO.AsInteger, 'S');
     cdsUsuDes.Data  := CtrlAlmoxCompra.SelecionaUsuBloqDes(CdsGrupoAcessoIDGRUPO.AsInteger, 'N');
   end;
end;

procedure TfrmCadMovXUsu.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  MontarUsuariosLibBloq;
  PreencheListaBloq;
  PreencheListaDesbloq;
end;

procedure TfrmCadMovXUsu.dblcUnidNegocChange(Sender: TObject);
begin
  inherited;
  MontarUsuariosLibBloq;
  PreencheListaBloq;
  PreencheListaDesbloq;
end;

procedure TfrmCadMovXUsu.BtnIncluirClick(Sender: TObject);

begin
  inherited;
  if edDiaUtil.Value = 0 then
    abort;

{  if cdsUsuBloq.IsEmpty then
    abort;}

  if lvUsuBloq.Selected <> nil then
  begin
    CtrlAlmoxCompra.AtualizaStatus('N', StrToInt(lvUsuBloq.Selected.SubItems[0]));
    LV:= lvUsuDesbloq.Items.Add;
    LV.Caption:= lvUsuBloq.Selected.Caption;
    LV.SubItems.Add(lvUsuBloq.Selected.SubItems[0]);
    lvUsuBloq.Selected.Delete;
  end;

end;

procedure TfrmCadMovXUsu.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if edDiaUtil.Value = 0 then
    abort;

  {if cdsUsuDes.IsEmpty then
    abort;}

  if lvUsuDesbloq.Selected <> nil then
  begin
    CtrlAlmoxCompra.AtualizaStatus('S', StrToInt(lvUsuDesbloq.Selected.SubItems[0]));
    LV:= lvUsuBloq.Items.Add;
    LV.Caption:= lvUsuDesbloq.Selected.Caption;
    LV.SubItems.Add(lvUsuDesbloq.Selected.SubItems[0]);
    lvUsuDesbloq.Selected.Delete;
  end;

end;

procedure TfrmCadMovXUsu.BtnIncluirTodosClick(Sender: TObject);
var x: integer;
begin
  inherited;
  if edDiaUtil.Value = 0 then
    abort;

{  if cdsUsuBloq.IsEmpty then
    abort;}

  for x:= 0 to lvUsuBloq.Items.Count -1 do
  begin
    CtrlAlmoxCompra.AtualizaStatus('N', StrToInt(lvUsuBloq.Items[x].SubItems[0]));
    LV:= lvUsuDesbloq.Items.Add;
    LV.Caption:= lvUsuBloq.Items[x].Caption;
    LV.SubItems.Add(lvUsuBloq.Items[x].SubItems[0]);
  end;

  lvUsuBloq.Items.Clear;

end;

procedure TfrmCadMovXUsu.BtnExcluirTodosClick(Sender: TObject);
var x: Integer;
begin
  inherited;
  if edDiaUtil.Value = 0 then
    abort;

{  if cdsUsuDes.IsEmpty then
    abort;}

  for x:= 0 to lvUsuDesbloq.Items.Count -1 do
  begin
    CtrlAlmoxCompra.AtualizaStatus('S', StrToInt(lvUsuDesbloq.Items[x].SubItems[0]));
    LV:= lvUsuBloq.Items.Add;
    LV.Caption:= lvUsuDesbloq.Items[x].Caption;
    LV.SubItems.Add(lvUsuDesbloq.Items[x].SubItems[0]);
  end;

  lvUsuDesbloq.Items.Clear;
end;

procedure TfrmCadMovXUsu.edDiaUtilExit(Sender: TObject);
begin
  inherited;
  if (not CtrlAlmoxCompra.Mensagem('Informe o dia útil!', MB_ICONWARNING, edDiaUtil.Value = 0)) or
     (not CtrlAlmoxCompra.Mensagem('Dia útil inválido para o mês de ' + CtrlAlmoxCompra.MesAtualPorExtenso + '.'#13#10 +
                                   ' O limite é de: ' + InttoStr(LimDiaUtil) + ' dias úteis.',
                                   MB_ICONWARNING, (Trunc(edDiaUtil.Value) > LimDiaUtil))) then

    edDiaUtil.SetFocus;
end;

procedure TfrmCadMovXUsu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  if iKey = 83 then
  begin
    iKey:= 0;
    Abort;
  end;}
  inherited;

  CtrlAlmoxCompra.Free;
end;

procedure TfrmCadMovXUsu.PreencheListaBloq;

begin
  lvUsuBloq.Items.Clear;

  cdsUsuBloq.First;
  while not cdsUsuBloq.Eof do
  begin
    LV:= lvUsuBloq.Items.Add;
    LV.Caption:= cdsUsuBloq.FieldByName('NOMEUSUARIO').AsString;
    LV.SubItems.Add(Trim(cdsUsuBloq.FieldByName('IDUSUARIO').AsString));
    cdsUsuBloq.Next;
  end;
end;

procedure TfrmCadMovXUsu.PreencheListaDesbloq;
begin
  lvUsuDesbloq.Items.Clear;

  cdsUsuDes.First;
  while not cdsUsuDes.Eof do
  begin
    LV:= lvUsuDesbloq.Items.Add;
    LV.Caption:= cdsUsuDes.FieldByName('NOMEUSUARIO').AsString;
    LV.SubItems.Add(Trim(cdsUsuDes.FieldByName('IDUSUARIO').AsString));
    cdsUsuDes.Next;
  end;
end;

procedure TfrmCadMovXUsu.sbtOKClick(Sender: TObject);
var tempo: TTime;
begin
  if (not CtrlAlmoxCompra.Mensagem('Informe o dia útil!', MB_ICONWARNING, edDiaUtil.Value = 0)) or
     (not CtrlAlmoxCompra.Mensagem('Dia útil inválido para o mês de ' + CtrlAlmoxCompra.MesAtualPorExtenso + '.'#13#10 +
                                   ' O limite é de: ' + InttoStr(LimDiaUtil) + ' dias úteis.',
                                   MB_ICONWARNING, (Trunc(edDiaUtil.Value) > LimDiaUtil))) then

  begin
    edDiaUtil.SetFocus;
    Abort;
  end;


  CtrlAlmoxCompra.AtualizaDiaUtil(Trunc(edDiaUtil.Value));
  lblMsgDia.Visible:= True;
  Application.ProcessMessages;
  lblMsgDia.Visible:= True;
  Sleep(1000);
  lblMsgDia.Visible:= False;
end;

end.
