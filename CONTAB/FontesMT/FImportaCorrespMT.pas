unit FImportaCorrespMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls,uCtrlContab,uCtrlProcessaContab,
  uCMTypes;

type
  TfrmImportaCorrespMT = class(TfrmSairAjuda)
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    Label4: TLabel;
    opdlgtxt: TOpenDialog;
    prbImportar: TProgressBar;
    Anim: TAnimate;
    Panel1: TPanel;
    Label1: TLabel;
    mmLog: TRichEdit;
    Bevel2: TBevel;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportarClick(Sender: TObject);
  private
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    procedure ProcMensCC(msg: String);
  public
    { Public declarations }
  end;

var
  frmImportaCorrespMT: TfrmImportaCorrespMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;

var
   StlArqTexto :TStringList;

{$R *.DFM}

procedure TfrmImportaCorrespMT.btnSelecionarClick(Sender: TObject);
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

procedure TfrmImportaCorrespMT.ProcMensCC(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
      mmLog.Lines.Add(msg);

    prbImportar.Position := CtrlProcessaContab._Progresso;
    Application.ProcessMessages;
  End;

end;

procedure TfrmImportaCorrespMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe lancamento ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensCC);

   StlArqTexto := TStringList.Create;

end;

procedure TfrmImportaCorrespMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  StlArqTexto.free;


end;

procedure TfrmImportaCorrespMT.btnImportarClick(Sender: TObject);
var
  ArquivoLog  :TextFile;
begin
  inherited;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     Anim.Visible := True;
     Anim.Active  := True;
   End;

   mmLog.Lines.Add('---------------------------------------------------');
   mmLog.Lines.Add('*** Importação das Contas Correspondentes ***');
   mmLog.Lines.Add('---------------------------------------------------');
   mmLog.Lines.Add(' ');


   If CtrlProcessaContab.ImportaContaCorresp(StlArqTexto,edtPath.Text,CtrlContab.PlanoParam,Sistema.idEmpresa,Sistema.IdModulo,Sistema.idUsuario)  Then
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

   AssignFile(ArquivoLog,Copy(trim(edtPath.Text),1,Pos('.',trim(edtPath.Text)))+ 'LOG');
   ReWrite(ArquivoLog);
   Try
     WriteLn(ArquivoLog,CtrlProcessaContab.sMensAPS);
   Finally
     CloseFile(ArquivoLog);
   End;

   If Anim.Active Then Anim.Active := False;

   mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
   edtPath.Text := '';
end;

end.
