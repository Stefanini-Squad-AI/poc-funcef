unit FAtuSaldoAnaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo, uCtrlLancamento, uCtrlProcessaContab, uCMTypes;

type
  TfrmAtuSaldoAnaMT = class(TfrmSairAjuda)
    btnAtualizar: TBitBtn;
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
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Periodo    : TCtrlPeriodo;
    Lancamento : TCtrlLancamento;
    ProcessaContab : TCtrlProcessaContab;
    Procedure MensProcessaContab(msg : String);
    Procedure MensPeriodo(msg : String);
  public
    { Public declarations }
  end;

var
  frmAtuSaldoAnaMT: TfrmAtuSaldoAnaMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados;


procedure TfrmAtuSaldoAnaMT.btnAtualizarClick(Sender: TObject);
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
   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active := True;
   End;
   btnAtualizar.Enabled := False;
   bError := False;

   mmStatus.Lines.Clear;
   mmStatus.Lines.Add('Atualizando Saldo das Contas Analíticas');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if not ProcessaContab.ProcessaSaldoAnalitica(Sistema.idEmpresa,Sistema.IdModulo,Sistema.idUsuario,Periodo.Exercicio,Periodo.Periodo,Sistema.UsaPlanoPatro) then bError := true;
   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   if bError then begin
      MsgDlg('Atualização NÃO efetuada. '+ProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end else begin
      MsgDlg('Atualização efetuada com sucesso!','Aviso',mtWarning,[mbOk],0);
   end;
   btnAtualizar.Enabled := True;
   If Anim.Active Then Anim.Active := False;
end;

procedure TfrmAtuSaldoAnaMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsExercicio.Data := Periodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.idEmpresa,tbpSoNaoBloq,0,0);
end;

procedure TfrmAtuSaldoAnaMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensPeriodo);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);

  Lancamento     := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
end;

procedure TfrmAtuSaldoAnaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  Lancamento.Free;
  ProcessaContab.Free;
end;


procedure TfrmAtuSaldoAnaMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;

procedure TfrmAtuSaldoAnaMT.MensProcessaContab(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   prbImportar.Max      := ProcessaContab.MaxProgresso;
   prbImportar.Position := ProcessaContab._Progresso;
   Application.ProcessMessages;
end;

procedure TfrmAtuSaldoAnaMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

end.
