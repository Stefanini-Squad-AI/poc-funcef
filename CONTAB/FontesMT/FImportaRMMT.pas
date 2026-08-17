unit FImportaRMMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, StdCtrls, ExtCtrls, TREdit, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,uCtrlContab,Wwdbspin,
  uCtrlListTerceiros,uCtrlProcessaContab,uCMClientDataSet, Db, DBClient,
  {$IFDEF VERSAO0505} uComum, Mask, wwdbedit, Wwdbspin {$ELSE} uCMTypes {$ENDIF};

type
  TfrmImportaRMMT = class(TfrmSairAjuda)
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    dblkTipoOper: TwwDBLookupCombo;
    Label1: TLabel;
    dblkAtivProj: TwwDBLookupCombo;
    Label6: TLabel;
    Label5: TLabel;
    rgVersao: TRadioGroup;
    prbImportar: TProgressBar;
    Label4: TLabel;
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsTipoOper: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    Anim: TAnimate;
    opdlgtxt: TOpenDialog;
    redNumColunas: TwwDBSpinEdit;
    Label7: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlProcessaContab:TCtrlProcessaContab;
    ListTerceiros :TCtrlListTerceiros;
    CtrlContab    :TCtrlContab;
    procedure ProcMensRM(msg: String);

  public
    { Public declarations }
  end;

var
  frmImportaRMMT: TfrmImportaRMMT;

implementation

{$R *.DFM}

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uString,
    uData, fTelaAut;

var
   sLinha       : string;
   StlArqTexto :TStringList;
   ArquivoTexto : TextFile;

procedure TfrmImportaRMMT.btnSelecionarClick(Sender: TObject);
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

procedure TfrmImportaRMMT.btnImportarClick(Sender: TObject);
var
  MensLog :string;
  ArquivoLog : TextFile;

begin
  inherited;

   If dblkTipoOper.Text = '' Then
   Begin
     MsgDlg('Tipo de Operação não Preenchida.','Atenção',mtError,[mbOk],0);
     dblkTipoOper.Setfocus;
     Exit;
   End;

  If redNumColunas.Value = 0 Then
  Begin
    MsgDlg('Número de colunas do arquivo a ser importado não informado.', 'Erro', mtError,[mbOK], 0);
    redNumColunas.SetFocus;
    Exit;
  End;

  If redNumColunas.Value < 297 Then
  Begin
    MsgDlg('Número de colunas do arquivo deve ser de no mínimo 297 caracteres.', 'Erro', mtError,[mbOK], 0);
    redNumColunas.SetFocus;
    Exit;
  End;

   mmLog.Lines.Clear;
   mmLog.Lines.Add('------------------------------------------------------------');
   mmLog.Lines.Add('******** Importando dados da RM ************');
   mmLog.Lines.Add('------------------------------------------------------------');
   mmLog.Lines.Add(' ');

  AssignFile(ArquivoTexto, edtPath.Text);
  Reset(ArquivoTexto);
  Read(ArquivoTexto, sLinha);
  CloseFile(ArquivoTexto);

  AssignFile(ArquivoLog,Copy(trim(edtPath.Text),1,Pos('.',trim(edtPath.Text)))+ 'LOG');
  ReWrite(ArquivoLog);


  If Length(sLinha) <> redNumColunas.Value Then
  Begin
    MensLog := 'Arquivo texto com formato incompatível. Verifique o número de colunas.';

    MsgDlg('Arquivo texto com formato incompatível. Verifique o número de colunas.', 'Atenção', mtError,[mbOK], 0);
    CloseFile(ArquivoTexto);

    WriteLn(ArquivoLog,MensLog);
    CloseFile(ArquivoLog);

    Exit;
  End;

  If Sistema.ConnectionSide = CnsClient Then
  Begin
    Anim.Visible := True;
    Anim.Active := True;
  End;

  If CtrlProcessaContab.ImportaDadosRM(StlArqTexto,Sistema.IdEmpresa,CtrlContab.PlanoParam,
                                   Sistema.IdModulo, Sistema.IdUsuario,rgVersao.ItemIndex,
                                   dblkTipoOper.LookupValue, dblkAtivProj.LookupValue,edtPath.Text,
                                   Sistema.UsaPlanoPatro) Then
  Begin
     MsgDlg('Lançamentos efetuados com sucesso!','Aviso',mtInformation,[mbOk],0);
     mmLog.Lines.Add('Lançamentos efetuados com sucesso!');
  End Else
  Begin
     If  (Sistema.ConnectionSide = CnsClient) Then
     Begin
        MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
        mmLog.Lines.Add('Erro: ' + CtrlProcessaContab.MessageInfo + chr(13));
     End Else
     Begin
        WriteLn(ArquivoLog,CtrlProcessaContab.sMensAPS_Log);

        MensLog := 'Houve erros na importação.' + CHR(13) +
                   'Linha do Arquivo: '+ IntToStr(CtrlProcessaContab.ContaLinhaTexto) + ' - '  + CtrlProcessaContab.MessageInfo  + CHR(13) + CHR(13) +
                   'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
                   'Verifique os Lançamentos com inconsistências.' + chr(13);

        MsgDlg('Houve erros na importação.' + CHR(13) +
               'Linha do Arquivo: '+ IntToStr(CtrlProcessaContab.ContaLinhaTexto) + ' - '  + CtrlProcessaContab.MessageInfo  + CHR(13) + CHR(13) +
               'O estado anterior do Banco de Dados foi retornado. ' + CHR(13) +
               'Verifique os Lançamentos com inconsistências.','Erro',mtError,[mbOk],0);

       mmLog.Lines.Add('Lançamentos NÃO efetuados!');

       MensLog := MensLog + 'Lançamentos NÃO efetuados!.';

       WriteLn(ArquivoLog,MensLog);
     End;
  End;


  If Anim.Active Then Anim.Active := False;

  mmLog.Lines.Add(CtrlProcessaContab.MessageInfo);
  edtPath.Text := '';
  CloseFile(ArquivoLog);


end;

procedure TfrmImportaRMMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  ListTerceiros.free;
  CtrlProcessaContab.free;
  StlArqTexto.free;

end;

procedure TfrmImportaRMMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe lancamento ***
  CtrlProcessaContab := TCtrlProcessaContab.Create;
  CtrlProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensRM);

  // *** Instancia a classe Terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsTipoOper.Data := ListTerceiros.ListTipoOper(false);
  cdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.idEmpresa,0,'',tapAmbos,toapNome);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   StlArqTexto := TStringList.create;

end;

procedure TfrmImportaRMMT.ProcMensRM(msg:string);
begin
   If Not (Sistema.ConnectionSide = CnsClient) Then
   Begin
      If msg <> '*' then
         mmLog.Lines.Add(msg);
      prbImportar.Position := CtrlProcessaContab.Progresso;
      Application.ProcessMessages;
   End;

end;

procedure TfrmImportaRMMT.FormShow(Sender: TObject);
begin
  inherited;
  redNumColunas.Value := 327;

end;

end.
