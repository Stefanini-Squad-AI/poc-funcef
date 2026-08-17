unit FImportaSRHMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, Wwdatsrc, DBTables, Wwquery, ExtCtrls, StdCtrls,
  ComCtrls, wwdblook, MAHlpBtn, Buttons, TB97Tlbr, TB97, IvDictio, IvMulti,
  IvEMulti, TREdit,uCtrlListTerceiros,uCtrlContab,uCtrlProcessaContab,DBClient,
   uCMClientDataSet , {$IFNDEF VERSAO0505} uCMTypes, Mask, wwdbedit,
  Wwdbspin{$ENDIF};

type
  TfrmImportaSRHMT = class(TfrmSairAjuda)
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    Label1: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    prbImportar: TProgressBar;
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    opdlgtxt: TOpenDialog;
    Label4: TLabel;
    dblkAtivProj: TwwDBLookupCombo;
    Label6: TLabel;
    Label5: TLabel;
    cdsTipoOper: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    Label7: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    dbspCommit: TwwDBSpinEdit;
    Animate1: TAnimate;
    procedure btnImportarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    iPlano :Integer;
    sTipoOper,sAtivProj :String;
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlListTerceiros :TCtrlListTerceiros;
    procedure ProcMensSRH(msg: String);

  public
  end;

var
  frmImportaSRHMT: TfrmImportaSRHMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;

var
  StlArqTexto :TStringList;
  iContMax :LongInt;


{$R *.DFM}



procedure TfrmImportaSRHMT.btnImportarClick(Sender: TObject);
var
  iModulo :Integer;
  ArquivoLog  :TextFile;

begin
  sAtivProj := '';
  sTipoOper := '';
  iModulo   := 1;
  if dbspCommit.Text = '' then
  begin
    MsgDlg('Número de colunas do arquivo a ser importado não informado.', 'Erro', mtError,[mbOK], 0);
    dbspCommit.SetFocus;
    Exit;
  end;

  if dbspCommit.Value < 36 then
  begin
    MsgDlg('Número de colunas do arquivo deve ser de no mínimo 297 caracteres.', 'Erro', mtError,[mbOK], 0);
    dbspCommit.SetFocus;
    Exit;
  end;

  If dblkTipoOper.Text <> '' Then
      sTipoOper := dblkTipoOper.LookupValue;

   if dblkAtivProj.Text <> '' then
      sAtivProj := dblkAtivProj.LookupValue;


   mmLog.Lines.Add('------------------------------------------------');
   mmLog.Lines.Add('*** Importação dos Dados do SRH Plus ***');
   mmLog.Lines.Add('------------------------------------------------');
   mmLog.Lines.Add(' ');


   If CtrlProcessaContab.ImportaSRH(StlArqTexto,sTipoOper, edtPath.text,sAtivProj,
                                iModulo, Sistema.IdUsuario,iPlano,iContMax,
                                dbspCommit.Value, Sistema.IdEmpresa,
                                Sistema.UsaPlanoPatro) then
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   End;

   AssignFile(ArquivoLog,Copy(trim(edtPath.Text),1,Pos('.',trim(edtPath.Text)))+ 'LOG');
   ReWrite(ArquivoLog);
   Try
     WriteLn(ArquivoLog,CtrlProcessaContab.sMensAPS);
   Finally
     CloseFile(ArquivoLog);
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlProcessaContab.sMensAPS);
   End;

   mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
   edtPath.Text := '';

end;

procedure TfrmImportaSRHMT.btnSelecionarClick(Sender: TObject);
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
   iContMax          := StlArqTexto.Count;

end;

procedure TfrmImportaSRHMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  iPlano    := CtrlContab.PlanoParam;
  sTipoOper := CtrlContab.TipoOperImp;

  // *** Instancia a classe Terceiros ***
  CtrlListTerceiros := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsAtivProj.Data := CtrlListTerceiros.ListAtivProj(Sistema.idEmpresa,0,'',tapAmbos,toapNome);
  cdsTipoOper.Data := CtrlListTerceiros.ListTipoOper(False);

  // *** Instancia a classe lancamento ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensSRH);

   StlArqTexto := TStringList.Create;

end;

procedure TfrmImportaSRHMT.FormShow(Sender: TObject);
begin
  inherited;
  dbspCommit.Value := 36;
end;

procedure TfrmImportaSRHMT.ProcMensSRH(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
      mmLog.Lines.Add(msg);

    prbImportar.Position := CtrlProcessaContab.Progresso;
    Application.ProcessMessages;
  End;
end;

procedure TfrmImportaSRHMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlListTerceiros.free;
  StlArqTexto.free;

end;

end.

