unit FImportaLancamentosMT;

{-------------------------------------------------------------------------------
SIG       : 101426
Rotina    : LeArquivo
Autor     : Edilaine Ferraresi
Data      : 10/08/2020
Descrição : Validação para não converter para ANSI se o arquivo não for UTF8.
-------------------------------------------------------------------------------
SIG       : 100249
Rotina    : converte_utf8_ansi
Autor     : Andre Imakawa
Data      : 24/06/2020
Descrição : Criado função para converter UTF8 em ANSI
-------------------------------------------------------------------------------
Analista  : Alex Pereira
Pendência : 16232
Descrição : Passar a utilizar o "Plano para Importar" para fazer os lançamentos
            contábeis na importação de planilhas, ao invés do plano no parâmetro.
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Mask, wwdbedit, Wwdbspin, wwdblook,
  Db, DBClient, uCMClientDataSet, uCtrlListTerceiros,
  uCtrlPlano,uCtrlContab, uCMTypes, uCtrlImportaContab, uctrlParamintegra;

type
  TfrmImportaLancamentosMT = class(TfrmSairAjuda)
    opdlgtxt: TOpenDialog;
    cdsPlano: TCMClientDataSet;
    cdsTipoOper: TCMClientDataSet;
    btnImportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    edtPath: TEdit;
    btnSelecionar: TBitBtn;
    Label1: TLabel;
    dbspCommit: TwwDBSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    dblkPlano: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    Label5: TLabel;
    lblPlano: TLabel;
    prbImportar: TProgressBar;
    Anim: TAnimate;
    chkHist: TCheckBox;
    Bevel2: TBevel;
    Panel1: TPanel;
    mmLog: TRichEdit;
    Label4: TLabel;
    Animate1: TAnimate;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function LeArquivo(psNomeArquivo: String): TStringList; // Andre Imakawa - SIG 100249

  private
    sTipoOper :string;
    StlArqTexto :TStringList;
    iPlano    :Integer;
    CtrlImportaContab: TCtrlImportaContab;
    CtrlListTerceiros :TCtrlListTerceiros;
    CtrlPlano         :TCtrlPlano;
    CtrlContab        :TCtrlContab;
    procedure ProcMensImp(msg: String);

  public
    { Public declarations }
  end;

var
  frmImportaLancamentosMT: TfrmImportaLancamentosMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema, uData,fTelaAut,  uFuncaoGeral;

{$R *.DFM}


procedure TfrmImportaLancamentosMT.ProcMensImp(msg: String);
begin
  If Sistema.ConnectionSide <> CnsClient Then
  Begin
    If msg <> '*' then
    begin
      if CtrlImportaContab.LinhaTexto <> '' then
         mmLog.Lines.Add(CtrlImportaContab.LinhaTexto);

    end;
    prbImportar.Position := CtrlImportaContab.Progresso;
    Application.ProcessMessages;
  End;
end;

procedure TfrmImportaLancamentosMT.btnSelecionarClick(Sender: TObject);
begin
  inherited;
   mmLog.Clear;
   prbImportar.Position := 0;
   StlArqTexto.Clear;

   //Abre a tela de "Abrir arquivo..."
   Try
      OpDlgTxt.Execute;
      edtPath.Text := OpDlgTxt.FileName;
      //StlArqTexto.LoadFromFile(OpDlgTxt.FileName);  // Andre Imakawa - SIG 100249
      StlArqTexto := LeArquivo(OpDlgTxt.FileName);    // Andre Imakawa - SIG 100249
   Except
      MsgDlg('Houve um erro na abertura do arquivo texto.','Aviso',mtError,[mbOk],0);
   End;
   prbImportar.Max   := StlArqTexto.Count;

end;

procedure TfrmImportaLancamentosMT.btnImportarClick(Sender: TObject);
var
  bTestaConta :Boolean;
  sTipOper :string;
  ArquivoLog  :TextFile;

begin
   if edtPath.Text = '' then
   begin
     MsgDlg('O Arquivo de Importação deve ser selecionado.','Atenção',mtError,[mbOk],0);
     btnSelecionar.SetFocus;
     Exit;
   end;

   If dblkTipoOper.Text = '' Then
   Begin
     MsgDlg('Tipo de Operação não Preenchida.','Atenção',mtError,[mbOk],0);
     dblkTipoOper.Setfocus;
     Exit;
   End;

   if dblkPlano.Text = '' then begin
     MsgDlg('Plano para Importar não preenchido.','Atenção',mtError,[mbOk],0);
     dblkPlano.Setfocus;
     Exit;
   end;

   If MsgDlg('Deseja que os dados sejam importados e INTEGRADOS com a Contabilidade?','Atenção',mtConfirmation,[mbYes, mbNo],0) = mrYes then
      bTestaConta := True
   Else
      bTestaConta := False;


   If dblkTipoOper.Text <> '' Then
      sTipOper := dblkTipoOper.LookupValue;

   mmLog.Lines.Clear;
   mmLog.Lines.Add('----------------------------------------------------');
   mmLog.Lines.Add('******** Planilhas Geradas ************');
   mmLog.Lines.Add('----------------------------------------------------');
   mmLog.Lines.Add(' ');

   If CtrlImportaContab.ImportaLancamentos(StlArqTexto,Sistema.IdEmpresa,
                                          cdsPlano.FieldByName('PLANO').AsInteger,
                                          Sistema.IdUsuario,
                                          Sistema.IdModulo,Trunc(dbspCommit.Value),
                                          sTipoOper,edtPath.text, bTestaConta,chkHist.Checked,
                                          Sistema.UsaPlanoPatro, paramintegra.PlanoCentroCusto) Then

   Begin
     MsgDlg(CtrlImportaContab.MessageInfo,'Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
      MsgDlg(CtrlImportaContab.MessageInfo,'Erro',mtError,[mbOk],0);
   End;

   If Sistema.ConnectionSide = CnsClient Then
   Begin
     mmLog.Lines.Add(CtrlImportaContab.sMensAPS_Log);
   End;

   AssignFile(ArquivoLog,Copy(trim(edtPath.Text),1,Pos('.',trim(edtPath.Text)))+ 'LOG');
   ReWrite(ArquivoLog);
   Try
     WriteLn(ArquivoLog,CtrlImportaContab.sMensAPS_Log);
   Finally
     CloseFile(ArquivoLog);
   End;

   mmLog.Lines.Add(CtrlImportaContab.MessageInfo);

   edtPath.Text := '';

end;

procedure TfrmImportaLancamentosMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlImportaContab := TCtrlImportaContab.Create;
  CtrlImportaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True,ProcMensImp);

  // *** Instancia a classe Terceiros ***
  CtrlListTerceiros := TCtrlListTerceiros.Create;
  CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  cdsTipoOper.Data := CtrlListTerceiros.ListTipoOper(false);

  // *** Instancia a classe Plano ***
  CtrlPlano := TCtrlPlano.Create;
  CtrlPlano.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  cdsPlano.Data := CtrlPlano.ListPlano(0);

  // *** instancia a classe geral contab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  sTipoOper                := CtrlContab.TipoOperImp;
  iPlano                   := CtrlContab.PlanoParam;
  dblkPlano.LookupValue    := IntToStr(CtrlContab.PlanoParam);
  dblkTipoOper.LookupValue := CtrlContab.TipoOperImp;

  StlArqTexto := TStringList.Create;


end;

procedure TfrmImportaLancamentosMT.FormShow(Sender: TObject);
begin
  inherited;

  If Sistema.ConnectionSide = CnsClient Then
  Begin
    prbImportar.Visible := False;
    Label2.Visible := False;
  End Else
  Begin
    prbImportar.Visible := True;
    Label2.Visible := True;
  End;

end;

procedure TfrmImportaLancamentosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  StlArqTexto.free;
  CtrlListTerceiros.free;
  CtrlPlano.free;
  CtrlContab.free;
  CtrlImportaContab.free;

  inherited;
end;

// Andre Imakawa - SIG 100249 - Inicio
function TfrmImportaLancamentosMT.LeArquivo(psNomeArquivo: String): TStringList;
var
  Arquivo : TextFile;
  sLinha  : string;
  LstRetorno : TStringList;
  bConverteUTF8 : Boolean; //SIG101426 - Edilaine Ferraresi

begin
  LstRetorno := TStringList.Create;
  try
    LstRetorno.LoadFromFile(psNomeArquivo);
    bConverteUTF8 := Pos('Ã§Ã£o', LstRetorno.Text) > 0; //SIG101426 - Edilaine Ferraresi

    if bConverteUTF8 then //SIG101426 - Edilaine Ferraresi
    try
      LstRetorno.Clear; //SIG101426 - Edilaine Ferraresi
      AssignFile(Arquivo, psNomeArquivo);
      Reset(Arquivo);
      while not Eof(Arquivo) do
      begin
        Readln(Arquivo, sLinha);
        LstRetorno.Add(FuncaoGeral.converte_utf8_ansi(sLinha));
      end;
      CloseFile(Arquivo); //SIG101426 - Edilaine Ferraresi
    except
      On E : Exception Do
      begin
        MsgDlg('Erro na leitura de arquivo!', 'Erro ', mtError, [mbOk], 0);
      end;
    end;
  Finally
    Result := LstRetorno;
  End;
end;
// Andre Imakawa - SIG 100249 - Fim


end.

