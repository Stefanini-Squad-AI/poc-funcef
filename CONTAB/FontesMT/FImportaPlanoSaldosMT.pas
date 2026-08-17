unit FImportaPlanoSaldosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContaContabil,uCtrlContab,uCtrlProcessaContab,uCtrlPeriodo,
  FSairAjuda, ComCtrls, Db, DBClient, uCMClientDataSet, StdCtrls, wwdblook,
  IvDictio, IvMulti, IvEMulti,   MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  uCMTypes;

type
  TfrmImportaSaldosMT = class(TfrmSairAjuda)
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    dblkExercicio: TwwDBLookupCombo;
    Label1: TLabel;
    dblkPlano: TwwDBLookupCombo;
    lblPlano: TLabel;
    Label4: TLabel;
    opdlgtxt: TOpenDialog;
    cdsPlanos: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    Label3: TLabel;
    prbImportar: TProgressBar;
    Anim: TAnimate;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportarClick(Sender: TObject);
  private
    iPlano :Integer;
    CtrlPeriodo  : TCtrlPeriodo;
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlContaContabil  :TCtrlContaContabil;
    procedure ProcMensSA(msg: String);
  public
    { Public declarations }
  end;

var
  frmImportaSaldosMT: TfrmImportaSaldosMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;
var
  StlArqTexto :TStringList;

{$R *.DFM}

procedure TfrmImportaSaldosMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
   mmLog.Clear;
   prbImportar.Position := 0;

   StlArqTexto.Clear;

   //Abre a tela de "Abrir arquivo..."
   Try
      OpDlgTxt.Execute;
      edtPath.Text := OpDlgTxt.FileName;
      StlArqTexto.LoadFromFile(OpDlgTxt.FileName);
   Except
      MsgDlg('Houve um erro na abertura do arquivo texto.','Aviso',mtError,[mbOk],0);
   End;
   prbImportar.Max   := StlArqTexto.Count;

end;

procedure TfrmImportaSaldosMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  iPlano := CtrlContab.PlanoParam;

  // *** Instancia a classe Contacontabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


  CdsPlanos.Data := CtrlContaContabil.ListPlanosContas(Sistema.IdEmpresa);

  dblkPlano.LookupValue  := IntToStr(CtrlContab.PlanoParam);

  // *** Instancia a classe lancamento ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensSA);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.Idempresa,False);
   StlArqTexto := TStringList.Create;

end;

procedure TfrmImportaSaldosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  CtrlPeriodo.free;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlContaContabil.free;
  StlArqTexto.free;

end;

procedure TfrmImportaSaldosMT.ProcMensSA(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
      mmLog.Lines.Add(msg);

    prbImportar.Position := CtrlProcessaContab._Progresso;
    Application.ProcessMessages;
  End;

end;

procedure TfrmImportaSaldosMT.btnImportarClick(Sender: TObject);
var
  ArquivoLog  :TextFile;

begin
  inherited;

   if dblkExercicio.text = '' then
   begin
      MsgDlg('Exercício não selecionado.','Aviso',mtWarning,[mbOk],0);
      exit;
   end;

   if dblkPlano.Text <> '' then
   begin
      iPlano :=  StrToInt(dblkPlano.LookupValue);
   end;

   If not CtrlContaContabil.BuscaMascaraConta(iPlano) then
   begin
      MsgDlg('Máscara do Plano de Contas não Cadastrada.','Aviso',mtWarning,[mbOk],0);
      exit;
   end;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
   End;

   mmLog.Lines.Add('------------------------------------------------------');
   mmLog.Lines.Add('*** Importação de Saldos Anteriores ***');
   mmLog.Lines.Add('------------------------------------------------------');
   mmLog.Lines.Add(' ');

   If CtrlProcessaContab.ImportaSaldoAnterior(StlArqTexto,dblkExercicio.LookupValue,edtPath.Text,
                                CtrlContaContabil.MascaraConta,iPlano,Sistema.IdUsuario,
                                Sistema.idEmpresa,Sistema.IdModulo)  Then
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   End;

   btnImportar.enabled := False;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAPS);
   End;

  If Anim.Active Then Anim.Active := False;

   AssignFile(ArquivoLog,Copy(trim(edtPath.Text),1,Pos('.',trim(edtPath.Text)))+ 'LOG');
   ReWrite(ArquivoLog);
   Try
     WriteLn(ArquivoLog,CtrlProcessaContab.sMensAPS);
   Finally
     CloseFile(ArquivoLog);
   End;

   mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
   edtPath.Text := '';

end;

end.
