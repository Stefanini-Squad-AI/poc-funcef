unit FRegDepositoVHFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBTables, Wwquery, wwdblook, CMDBLookupCombo, DBClient,uCtrlPeriodo,
  uCMClientDataSet, uCmSqlParams,uCtrlContab,uCtrlProcessaContab,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TfrmRegDepositoVHFMT = class(TfrmSairAjuda)
    gbHotel: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    dbInicial: TCMDateTimePicker;
    dbFinal: TCMDateTimePicker;
    dblcHotel: TCMDBLookupCombo;
    prgBarAtualizaLanc: TProgressBar;
    prgBarAtualizaData: TProgressBar;
    cdsHotel: TCMClientDataSet;
    Anim2: TAnimate;
    Anim1: TAnimate;
    edDataContab: TCMDateTimePicker;
    Label6: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlPeriodo   :TCtrlPeriodo;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlContab  :TCtrlContab;
    procedure ProcMensVHF(msg: String);
  public
    { Public declarations }
  end;

var
  frmRegDepositoVHFMT: TfrmRegDepositoVHFMT;

implementation

{$R *.DFM}

Uses uLancContab, uDataBase, DBaseDados, uMensErro, uSistema, uFuncaoGeral;

procedure TfrmRegDepositoVHFMT.FormCreate(Sender: TObject);
begin
  inherited;
   // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** Instancia a classe terceiros ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False,ProcMensVHF);

  cdsHotel.Data := CtrlProcessaContab.ListaHoteis(Sistema.idEmpresa);

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

end;

procedure TfrmRegDepositoVHFMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.idEmpresa, edDataContab.Text) then
  begin
    MsgDlg(CtrlPeriodo.MessageInfo,'Erro',mtError,[mbOk],0);
    Exit;
  end;

  bbtnConfirmar.Enabled := False;
  prgBarAtualizaData.Position :=0;
  prgBarAtualizaLanc.Position :=0;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim1.Visible := True;
     Anim1.Active  := True;
     Anim2.Visible := True;
     Anim2.Active  := True;
   End Else
   Begin
     Anim1.Visible := False;
     Anim1.Active  := False;
     Anim2.Visible := False;
     Anim2.Active  := False;
   End;

   //=== processa rateio por periodo ===
   If CtrlProcessaContab.ProcessaDepositoVHF(Sistema.IdEmpresa,CtrlContab.PlanoParam,
                               CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,
                               StrToIntDef(dblcHotel.LookupValue,0),Sistema.IdUsuario,edDataContab.Text,dbInicial.Date,dbFinal.Date) Then
   begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
      bbtnConfirmar.Enabled := True;
   end else
   begin
     MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
     bbtnConfirmar.Enabled := True;
   end;

   If Anim1.Active Then Anim1.Active := False;
   If Anim2.Active Then Anim2.Active := False;

end;



procedure TfrmRegDepositoVHFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.free;
  CtrlProcessaContab.free;
  CtrlContab.free;

end;

procedure TfrmRegDepositoVHFMT.ProcMensVHF(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    prgBarAtualizaData.Position := CtrlProcessaContab.Progresso;
    prgBarAtualizaData.Max      := CtrlProcessaContab.MaxProgresso;

    prgBarAtualizaLanc.Position := CtrlProcessaContab.ProgressoOutro;
    prgBarAtualizaLanc.Max      := CtrlProcessaContab.MaxProgressoOutro;

    Application.ProcessMessages;
  End;

end;

end.
