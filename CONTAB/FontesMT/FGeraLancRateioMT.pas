unit FGeraLancRateioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlPeriodo,uCtrlProcessaContab,uCtrlContab,uCtrlListTerceiros,
  FOkCancelar, Db, DBClient, uCMClientDataSet, ExtCtrls, StdCtrls,
  ComCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97,  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmGeraLancRateioMT = class(TfrmOkCancelar)
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    Label3: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    Label5: TLabel;
    dblkUnidNegoc: TwwDBLookupCombo;
    lblAtivProj: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pgbStatus: TProgressBar;
    mmLog: TRichEdit;
    Label6: TLabel;
    Bevel1: TBevel;
    cdsPeriodo: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    Anim: TAnimate;
    LblRateio: TLabel;
    LblConta: TLabel;
    procedure dblkExercicioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlPeriodo        :TCtrlPeriodo;
    CtrlListTerceiros  :TCtrlListTerceiros;
    procedure ProcMensLRAT(msg: String);

  public
    { Public declarations }
  end;

var
  frmGeraLancRateioMT: TfrmGeraLancRateioMT;

implementation

uses  UMensErro, uDatabase, DBaseDados,
      uSistema, uModulo, uFuncaoGeral, uData;

{$R *.DFM}

procedure TfrmGeraLancRateioMT.dblkExercicioClick(Sender: TObject);
begin
  inherited;
   //Preenche a combo-box de período
   if dblkExercicio.text <> '' then begin
      cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.text),0);

   end;

end;

procedure TfrmGeraLancRateioMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensLRat);

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
  cdsAtivProj.Data  := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,'',tapAmbos,toapNome);

end;

procedure TfrmGeraLancRateioMT.ProcMensLRAT(msg: String);
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

procedure TfrmGeraLancRateioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlPeriodo.free;
  CtrlListTerceiros.free;

end;

procedure TfrmGeraLancRateioMT.bbtnConfirmarClick(Sender: TObject);
var
  iUnidNegoc :Integer;
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

   if dblkUnidNegoc.text = '' then
      iUnidNegoc := 0
   else
      iUnidNegoc := StrToInt(dblkUnidNegoc.LookupValue);

   mmLog.Lines.Clear;
   mmLog.Lines.Add('*********** Lançamentos Gerados ************');
   mmLog.Lines.Add(' ');

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

   //=== processa lancamento do rateio  ===
   If CtrlProcessaContab.GeraLancaRateioAtivProj(Sistema.IdEmpresa,Sistema.idUsuario,
                                  CtrlContab.PlanoParam,StrToInt(dblkExercicio.LookupValue),
                                  StrToInt(dblkPeriodo.LookupValue),iUnidNegoc,
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

end.
