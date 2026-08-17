unit FGeraSalContMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContab,uCtrlProcessaContab,uCtrlPeriodo,uCtrlListTerceiros,
  FOkCancelar, Db, DBClient,  uCMClientDataSet, ComCtrls, StdCtrls, wwdblook, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, BfDialogs, BrowseFolder,
  uProcuraDir, uCMTypes, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb;


type
  TfrmGeraSALCONTMT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    edtEntidade: TEdit;
    edtPlano: TEdit;
    Label5: TLabel;
    Label1: TLabel;
    pgbStatus: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    Label6: TLabel;
    ProcuraDir: TProcuraDirDlg;
    cdsPlanoPrev: TClientDataSet;
    lblPlanoPrev: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    CbTipoBalancete: TwwDBComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ProcuraDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CbTipoBalanceteChange(Sender: TObject);
  private
    CtrlContab         :TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    CtrlListTerceiros  :TCtrlListTerceiros;
    procedure ProcMensArq(msg: String);

  public
    { Public declarations }
  end;

var
  frmGeraSALCONTMT: TfrmGeraSALCONTMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uData;

{$R *.DFM}

procedure TfrmGeraSALCONTMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe processa contab ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensArq);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlListTerceiros  := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);
  cdsPlanoPrev.Data := CtrlListTerceiros.ListPlanoPrev;

end;

procedure TfrmGeraSALCONTMT.ProcMensArq(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    pgbStatus.Max      := CtrlProcessaContab.MaxProgresso;
    pgbStatus.Position := CtrlProcessaContab._Progresso;
    Application.ProcessMessages;
  End;

end;

procedure TfrmGeraSALCONTMT.bbtnConfirmarClick(Sender: TObject);
Var
  sTipoBalancete : String;
begin
  inherited;

   if dblkExercicio.text = '' then
   begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if dblkPeriodo.text = '' then
   begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if edtEntidade.text = '' then
   begin
      MsgDlg('O Código da Entidade deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if edtPlano.text = '' then
   begin
      MsgDlg('O Plano Contábil deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end;

   if edtPath.text = '' then
   begin
      MsgDlg('O Caminho usado para a Gravação do Balancete deve ser Selecionado.','Erro',mtError,[mbOk],0);
      btnSelecionar.SetFocus;
      Exit;
   end;


   if Trim(CbTipoBalancete.Text) = '' then
   begin
      MsgDlg('O Tipo de Balancete deve ser informado.','Erro',mtError,[mbOk],0);
      btnSelecionar.SetFocus;
      Exit;
   end;

   //=== vewrifica se o periodo esta encerrado neste exercicio ====
   If Not CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.idEmpresa,tbBloqueado,StrToInt(dblkPeriodo.LookupValue),StrToInt(dblkExercicio.LookupValue),True) Then
   Begin
     MsgDlg('Existem Períodos  Não encerrados Neste Exercicio.','Erro',mtError,[mbOk],0);
   End;

   sTipoBalancete := CbTipoBalancete.Value;
   If CbTipoBalancete.ItemIndex = 3 Then sTipoBalancete := dblcPlanoPrev.LookUpValue;

   If CtrlProcessaContab.GeraArquivo_SIPC(Sistema.IdEmpresa,CtrlContab.PlanoParam,
                                          StrToInt(dblkExercicio.LookupValue),
                                          StrToInt(dblkPeriodo.LookupValue),
                                          StrToIntDef(dblcPlanoPrev.LookupValue,0),
                                          edtPlano.Text,edtEntidade.Text,edtPath.Text,
                                          sTipoBalancete) then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;
   pgbStatus.Position := 0; 
end;

procedure TfrmGeraSALCONTMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  ProcuraDir.Execute;
end;

procedure TfrmGeraSALCONTMT.ProcuraDirSelectionChanged(Sender: TObject;
  Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
  edtPath.Text := Path;
end;

procedure TfrmGeraSALCONTMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.LookupValue),0);

end;

procedure TfrmGeraSALCONTMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.Free;
  CtrlProcessaContab.Free;
  CtrlPeriodo.Free;
  CtrlListTerceiros.Free;
end;

procedure TfrmGeraSALCONTMT.CbTipoBalanceteChange(Sender: TObject);
begin
  inherited;
  Case CbTipoBalancete.ItemIndex of
    0:Begin
        dblcPlanoPrev.Enabled := False;
        dblcPlanoPrev.Clear;
      End
  Else
    dblcPlanoPrev.Enabled := True;
  End;
end;

end.
