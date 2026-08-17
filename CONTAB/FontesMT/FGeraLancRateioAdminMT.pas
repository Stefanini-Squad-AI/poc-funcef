unit FGeraLancRateioAdminMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, Db, DBClient, uCMClientDataSet, StdCtrls,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls,uCtrlPeriodo,uCtrlProcessaContab,uCtrlContab,uCtrlListTerceiros,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


type
  TfrmGeraLancRateioAdminMT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    Label2: TLabel;
    pgbStatus: TProgressBar;
    Label1: TLabel;
    mmLog: TRichEdit;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    Anim: TAnimate;
    cdsTipoOper: TCMClientDataSet;
    Label5: TLabel;
    Label6: TLabel;
    LblConta: TLabel;
    LblRateio: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    CtrlListTerceiros  :TCtrlListTerceiros;
    procedure ProcMensADM(msg: String);
  public
    { Public declarations }
  end;

var
  frmGeraLancRateioAdminMT: TfrmGeraLancRateioAdminMT;

implementation

uses  UMensErro, uDatabase, DBaseDados,
      uSistema, uModulo, uFuncaoGeral, uData;

{$R *.DFM}

procedure TfrmGeraLancRateioAdminMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensADM);

  //Criação da Classe de Negócio
  CtrlPeriodo        := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

  //Criação da Classe de terceiros
  CtrlListTerceiros        := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsTipoOPer.Data  := CtrlListTerceiros.ListTipoOper(False);

end;

procedure TfrmGeraLancRateioAdminMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlPeriodo.free;
  CtrlListTerceiros.free;

end;

procedure TfrmGeraLancRateioAdminMT.ProcMensADM(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
       lblRateio.Caption := CtrlProcessaContab.NomeRateio;
       lblConta.Caption  := CtrlProcessaContab.NomeCampo;
       if msg <> 'a' then
          mmLog.Lines.Add(msg);
    end;
    pgbStatus.Position := CtrlProcessaContab.Progresso;
    pgbStatus.Max      := CtrlProcessaContab.MaxProgresso;

    Application.ProcessMessages;
  End;

end;

procedure TfrmGeraLancRateioAdminMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('Exercício não selecionado.','Aviso',mtWarning,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;

   if dblkPeriodo.text = '' then begin
      MsgDlg('Período não selecionado.','Aviso',mtWarning,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible      := True;
     Anim.Active       := True;
     Label1.Visible    := False;
     Label2.Visible    := False;
     lblRateio.Visible := False;
     lblConta.Visible  := False;
   End Else
   Begin
     Label1.Visible    := True;
     Label2.Visible    := True;
     lblRateio.Visible := True;
     lblConta.Visible  := True;
   End;

   mmLog.Lines.Clear;
   mmLog.Lines.Add('*********** Lançamentos Gerados ************');
   mmLog.Lines.Add(' ');

   //=== processa lancamento do rateio  ===
   If CtrlProcessaContab.GeraLancaRateioADM(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.idUsuario,
                                  CtrlContab.PlanoParam,StrToInt(dblkExercicio.LookupValue),
                                  StrToInt(dblkPeriodo.LookupValue),
                                  dblkTipoOper.LookupValue,cdsPeriodo.FieldByName('PERDATFIM').asString,
                                  Sistema.UsaPlanoPatro) then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end else
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAPS_Log);
   End;

   If Anim.Active Then Anim.Active := False;


end;

procedure TfrmGeraLancRateioAdminMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToIntDef(dblkExercicio.LookupValue,0),0);

end;

end.
