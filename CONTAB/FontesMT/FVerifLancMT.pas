unit FVerifLancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo,  uCtrlProcessaContab;

type
  TfrmVerifLancMT = class(TfrmSairAjuda)
    btnVerificar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    prbImportar: TProgressBar;
    mmStatus: TRichEdit;
    Label1: TLabel;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    Anim: TAnimate;
    procedure btnVerificarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Periodo    : TCtrlPeriodo;
    ProcessaContab : TCtrlProcessaContab;
    Procedure MensProcessaContab(msg : String);
    Procedure MensPeriodo(msg : String);
  public
    { Public declarations }
  end;

var
  frmVerifLancMT: TfrmVerifLancMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados, uCMTypes;


procedure TfrmVerifLancMT.btnVerificarClick(Sender: TObject);
var bError : Boolean;
begin
   inherited;
   Periodo.Exercicio := StrToIntDef(dblkExercicio.LookUpValue,0);
   Periodo.Periodo   := StrToIntDef(dblkPeriodo.LookUpValue,0);
   mmStatus.Lines.Clear;
   if not Periodo.ValidaExercicio then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;
   if not Periodo.ValidaPeriodo then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;
   btnVerificar.Enabled := False;
   bError := False;
   //
   mmStatus.Lines.Clear;
   if MsgDlg('Deseja arredondar os valores dos lançamentos para 2 casas decimais?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
      If Sistema.ConnectionSide = CnsClient Then
      Begin
        Anim.Visible := True;
        Anim.Active := True;
      End;
      mmStatus.Lines.Add('Arredondando valores dos lançamentos para 2 casas decimais');
      mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
      Application.ProcessMessages;
      screen.cursor := crSQLWait;
      if not ProcessaContab.ArredondaValores(Sistema.idEmpresa,Sistema.IdModulo,Sistema.IdUsuario) then bError := true;
      screen.cursor := crDefault;
      mmStatus.Lines.Add('Final :'+TimeToStr(Time));
      Application.ProcessMessages;
      If Anim.Active Then Anim.Active := False;
   end;
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   screen.cursor := crSQLWait;
   mmStatus.Lines.Add('Atualizando o tipo do saldo pelo tipo da conta');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   screen.cursor := crSQLWait;
   if not ProcessaContab.AcertaTipoSaldopeloTipoConta(Sistema.idEmpresa,Sistema.IdModulo,Sistema.IdUsuario, Periodo.Exercicio, Periodo.Periodo) then bError := true;
   screen.cursor := crDefault;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   If Anim.Active Then Anim.Active := False;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   mmStatus.Lines.Add('Verificando consistencia dos lançamentos');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.TestaConsistenciaLanc(Sistema.idEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Periodo.Exercicio,Periodo.Periodo) then bError := true;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;

   if bError then begin
      MsgDlg('Verificação Efetuada Parcialmente. Verifique as mensagens!','Erro',mtError,[mbOk], 0);
   end else begin
      MsgDlg(ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   end;

   btnVerificar.Enabled := True;
   If Anim.Active Then Anim.Active := False;
end;

procedure TfrmVerifLancMT.FormActivate(Sender: TObject);
begin
  inherited;

  cdsExercicio.Data := Periodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.idEmpresa,tbpSoNaoBloq,0,0);

end;

procedure TfrmVerifLancMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensPeriodo);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);

end;

procedure TfrmVerifLancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  ProcessaContab.Free;
end;


procedure TfrmVerifLancMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;

procedure TfrmVerifLancMT.MensProcessaContab(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   prbImportar.Max      := ProcessaContab.MaxProgresso;
   prbImportar.Position := ProcessaContab._Progresso;
   Application.ProcessMessages;
end;

procedure TfrmVerifLancMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

end.
