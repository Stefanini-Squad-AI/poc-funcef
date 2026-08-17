unit FImportaPlanoContasMT;

{----------------------------------------------------------------------------------------
  Desenvolvedor: Antonio Marcos (amf)
  Método       : ImportaPlanoContas
  Data         : 17.05.2006 - 18.05.2006
  Pendência    : 22377
  Descrição    : Exibe na tela as mensagens de erro vindas da uCtrlProcessaContab.
----------------------------------------------------------------------------------------}

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContab,uCtrlProcessaContab, FSairAjuda, Db, DBClient,
  uCMClientDataSet, ExtCtrls, StdCtrls, ComCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,uCtrlContaContabil,
  uCMTypes;

type
  TfrmImportaPlanoContasMT = class(TfrmSairAjuda)
    btnSelecionar: TBitBtn;
    edtPath: TEdit;
    dblkPlano: TwwDBLookupCombo;
    prbImportar: TProgressBar;
    lblPlano: TLabel;
    Label4: TLabel;
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    opdlgtxt: TOpenDialog;
    cdsPlanos: TCMClientDataSet;
    Anim: TAnimate;
    Label1: TLabel;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    Rdghist: TRadioGroup;
    chkRestricao: TCheckBox;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
    iPlano :integer;
    CtrlContab : TCtrlContab;
    CtrlProcessaContab :TCtrlProcessaContab;
    CtrlContaContabil  :TCtrlContaContabil;

    procedure ProcMensPC(msg: String);

  public
    { Public declarations }
  end;

var
  frmImportaPlanoContasMT: TfrmImportaPlanoContasMT;

implementation

uses uMensErro,uDataBase, DBaseDados,uSistema,uString;

var
   StlArqTexto :TStringList;

{$R *.DFM}

procedure TfrmImportaPlanoContasMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
   mmLog.Clear;
   prbImportar.Position := 0;

   StlArqTexto.Clear;
   Try
      OpDlgTxt.Execute;
      edtPath.Text := OpDlgTxt.FileName;
      StlArqTexto.LoadFromFile(OpDlgTxt.FileName);
   Except
      MsgDlg('Houve um erro na abertura do arquivo texto.','Aviso',mtError,[mbOk],0);
   End;
   prbImportar.Max   := StlArqTexto.Count;

end;

procedure TfrmImportaPlanoContasMT.FormCreate(Sender: TObject);
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
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensPC);
  StlArqTexto := TStringList.Create;

end;

procedure TfrmImportaPlanoContasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlProcessaContab.free;
  CtrlContaContabil.free;
  StlArqTexto.free;


end;

procedure TfrmImportaPlanoContasMT.btnImportarClick(Sender: TObject);
var
   ArquivoLog  :TextFile;
   i: integer;
begin

   inherited;

   if dblkPlano.Text = '' then
   begin
      MsgDlg('É obrigatório informar o campo Plano para Importar.','Aviso',mtWarning,[mbOk],0);
      dblkPlano.SetFocus;
      exit;
   end;
   iPlano :=  StrToInt(dblkPlano.LookupValue);

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


   If Rdghist.ItemIndex = 1  then
   begin
     If CtrlProcessaContab.ImportaDescPlanoContas(StlArqTexto,CtrlContaContabil.MascaraConta,edtPath.text,
                                                  iPlano, Sistema.idEmpresa,
                                                  Sistema.IdModulo,Sistema.idUsuario) Then

     Begin
          MsgDlg('Processo concluído!','Aviso',mtWarning,[mbOk], 0);
     End Else
     Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
     End;
   end
   else
   //


   If CtrlProcessaContab.ImportaPlanoContas(StlArqTexto,CtrlContaContabil.MascaraConta,edtPath.text,
                                            iPlano, Sistema.idEmpresa,
                                            Sistema.IdModulo,Sistema.idUsuario,
                                            chkRestricao.Checked) Then

   Begin

       mmLog.Lines.Add('------------------------------------------------');
       if CtrlProcessaContab.stlMsgAPS.Count = 0 then
          mmLog.Lines.Add('*** Importação Realizada com Sucesso ***')
       else
          mmLog.Lines.Add('*** Importação Realizada Parcialmente ***');

       mmLog.Lines.Add('------------------------------------------------');
       mmLog.Lines.Add(' ');

       MsgDlg('Processo concluído!','Aviso',mtWarning,[mbOk], 0);

      for i := 0 to Pred(CtrlProcessaContab.stlMsgAPS.Count) do
        mmLog.Lines.Add(CtrlProcessaContab.stlMsgAPS.Strings[i]);

   End Else
   Begin
      MsgDlg(CtrlProcessaContab.MessageInfo,'Erro',mtError,[mbOk],0);
      for i := 0 to Pred(CtrlProcessaContab.stlMsgAPS.Count) do
        mmLog.Lines.Add(CtrlProcessaContab.stlMsgAPS.Strings[i]);

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

procedure TfrmImportaPlanoContasMT.ProcMensPC(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
      mmLog.Lines.Add(msg);

    prbImportar.Position := CtrlProcessaContab._Progresso;
    Application.ProcessMessages;
  End;

end;

end.
