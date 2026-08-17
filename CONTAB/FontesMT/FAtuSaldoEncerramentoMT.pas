unit FAtuSaldoEncerramentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo, uCtrlLancamento, uCtrlProcessaContab, uCMTypes, Mask,
  DBCtrls, uCtrlContab, DBTables, Wwquery;

type
  TfrmAtuSaldoEncerramentoMT = class(TfrmSairAjuda)
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
    Label2: TLabel;
    EdOper: TDBEdit;
    qryAux: TwwQuery;
    dsqryaux: TDataSource;
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
    CtrlContab     : TCtrlContab;
    Procedure MensProcessaContab(msg : String);
    Procedure MensPeriodo(msg : String);
  public
    { Public declarations }
  end;

var
  frmAtuSaldoEncerramentoMT: TfrmAtuSaldoEncerramentoMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados;


procedure TfrmAtuSaldoEncerramentoMT.btnAtualizarClick(Sender: TObject);
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
   mmStatus.Lines.Add('Atualizando Saldo de Encerramento das Contas Analíticas');
   mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
   Application.ProcessMessages;
   if ProcessaContab.ProcessaSaldoEncerramentoAnalitico(Sistema.idEmpresa,
                                                        Sistema.idUsuario,
                                                        Sistema.IdModulo,
                                                        Periodo.Exercicio,
                                                        Periodo.Periodo,
                                                        qryAux.FieldByName('TIPCODIGO').asInteger) then
   begin
     bError := not ProcessaContab.ProcessaSaldoEncerramentoSintetico(Sistema.idEmpresa,
                                                                     Sistema.idUsuario,
                                                                     Sistema.IdModulo,
                                                                     Periodo.Exercicio,
                                                                     Periodo.Periodo);
   end
   else
     bError := true;

   mmStatus.Lines.Add('Final :'+TimeToStr(Time));
   Application.ProcessMessages;
   if bError then
     MsgDlg('Atualização NÃO efetuada. '+ProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0)
   else
     MsgDlg('Atualização efetuada com sucesso!','Aviso',mtWarning,[mbOk],0);
   btnAtualizar.Enabled := True;
   If Anim.Active Then
     Anim.Active := False;
end;

procedure TfrmAtuSaldoEncerramentoMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsExercicio.Data := Periodo.ListExercicios(Sistema.idEmpresa,true);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);
end;

procedure TfrmAtuSaldoEncerramentoMT.FormCreate(Sender: TObject);

begin
  inherited;
  //Criação da Classe de Negócio
  Periodo        := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensPeriodo);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False,MensProcessaContab);
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
  Begin
    MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);
  End
  Else
  Begin
    qryaux.Close;
    qryaux.Sql.Text := 'SELECT T.TIPDESCRICAO,T.TIPCODIGO FROM TIPOPER T, PARAMCONTAB P WHERE T.TIPCODIGO=PACTIPOPERRESULT';
    qryaux.Open;
  End;

  Lancamento     := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
end;

procedure TfrmAtuSaldoEncerramentoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  Lancamento.Free;
  ProcessaContab.Free;
end;


procedure TfrmAtuSaldoEncerramentoMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;

procedure TfrmAtuSaldoEncerramentoMT.MensProcessaContab(msg: String);
begin
   if msg <> '*' then
      mmStatus.Lines.Add(msg);
   prbImportar.Max      := ProcessaContab.MaxProgresso;
   prbImportar.Position := ProcessaContab._Progresso;
   Application.ProcessMessages;
end;

procedure TfrmAtuSaldoEncerramentoMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

end.
