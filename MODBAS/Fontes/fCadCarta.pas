unit fCadCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS, Mask,
  StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, TB97, Wwdatsrc,
  Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, ExtCtrls, DBCtrls, ImgList, ComCtrls,
  fcCombo, fctreecombo, wwriched, wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro,
  ToolWin, ActnList, fcFontCombo, OleServer, Word97;

type
  TfrmCadCarta = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    dbedNumCarta: TDBEdit;
    dblcCodTipo: TwwDBLookupCombo;
    dbedAssunto: TDBEdit;
    dbedDatCarta: TCMDateTimePicker;
    qryMotivo: TwwQuery;
    Toolbar972: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    sbtnImprimirCarta: TSpeedButton;
    sbtnConfigEtiqueta: TSpeedButton;
    sbtnDesfConfigCartaComunic: TSpeedButton;
    ToolbarSep973: TToolbarSep97;
    pnlTexto: TPanel;
    pnlTituloTexto: TPanel;
    Label6: TLabel;
    TreeLegenda: TfcTreeCombo;
    StandardToolBar: TToolBar;
    tbtDesfazer: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    edTamFonte: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    tbtNegrito: TToolButton;
    tbtItalico: TToolButton;
    tbtSublinhado: TToolButton;
    ToolButton16: TToolButton;
    tbtAlinhamEsq: TToolButton;
    tbtAlinhamCen: TToolButton;
    tbtAlinhamDir: TToolButton;
    ToolButton20: TToolButton;
    tbtMarcador: TToolButton;
    ftcmbNomeFonte: TfcFontCombo;
    dbrcedTexto: TDBRichEdit;
    tbtCorTexto: TToolButton;
    ColorDialog: TColorDialog;
    bbtnEditMSWod: TBitBtn;
    MSWord: TWordApplication;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnImprimirCartaClick(Sender: TObject);
    procedure sbtnConfigEtiquetaClick(Sender: TObject);
    procedure sbtnDesfConfigCartaComunicClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure tbtDesfazerClick(Sender: TObject);
    procedure edTamFonteChange(Sender: TObject);
    procedure tbtNegritoClick(Sender: TObject);
    procedure tbtItalicoClick(Sender: TObject);
    procedure tbtSublinhadoClick(Sender: TObject);
    procedure tbtAlinhamEsqClick(Sender: TObject);
    procedure tbtAlinhamCenClick(Sender: TObject);
    procedure tbtAlinhamDirClick(Sender: TObject);
    procedure tbtMarcadorClick(Sender: TObject);
    procedure ftcmbNomeFonteChange(Sender: TObject);
    procedure rcedTextoSelectionChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure tbtCorTextoClick(Sender: TObject);
    procedure bbtnEditMSWodClick(Sender: TObject);
    procedure TreeLegendaCloseUp(Sender: TObject; Select: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure MSWordQuit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    bMudouTexto: boolean;
    procedure Sel(NumCarta: integer);
    function  CurrText: TTextAttributes;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure HabilitarBtImprimir(Opcao: boolean);
  end;

var
  frmCadCarta: TfrmCadCarta;

implementation

uses ShellAPI, uSistema, uDatabase, uMensErro, fTelaAut, uImprimeRelatorio, fAguarde,
  fParamCartaComun, fParamCartaComunAux, dRelatorioCartaComun;

{$R *.DFM}

procedure TfrmCadCarta.FormCreate(Sender: TObject);
begin
  ImprimeRelatorio := TImprimeRelatorio.Create;
  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioCartaComun) do
    ImprimeRelatorio.Iniciar(dsgnCartaComun, rpCartaComun, ppCartaComun, qryCartaComun,
      GetLayoutPadrao, 'Cartas ou Comunicados', 'rpCartaComun', 'CartaComun.tmp', 69);

  qry.Prepare;
  qryMotivo.Open;

  sbtnProcurarClick(Sender);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  inherited;
end;

procedure TfrmCadCarta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryMotivo.Close;
  qry.Close;
  qry.UnPrepare;
  inherited;
  FreeAndNil(ImprimeRelatorio);
end;

procedure TfrmCadCarta.FormShow(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Handle, true);
end;

procedure TfrmCadCarta.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('NUMCARTA').asInteger := LeUltRegistro(nil, 'CARTA');
end;

procedure TfrmCadCarta.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCarta.dsStateChange(Sender: TObject);
begin
  inherited;
  HabilitarBtImprimir(not(qry.State in [dsInsert, dsEdit]));
  if (qry.State in [dsInsert, dsEdit]) then
    dbedNumCarta.SetFocus;
end;

procedure TfrmCadCarta.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dbrcedTexto.Text) = '') then
  begin
    MsgDlg('Falta preencher o Texto da Carta.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbrcedTexto.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadCarta.sbtnImprimirCartaClick(Sender: TObject);
var
  bImprimir: boolean;
begin
  frmParamCartaComun := TfrmParamCartaComun.Create(Application);
  frmParamCartaComun.NumCarta := qry.FieldByName('NumCarta').asString;
  bImprimir := false;
  if (AbrirFormModal(frmParamCartaComun, TfrmParamCartaComun) = mrOk) then
    if (dtmRelatorioCartaComun.bSelecPessoa) then
      bImprimir := (AbrirFormModal(frmParamCartaComunAux, TfrmParamCartaComunAux) = mrOk)
    else
      bImprimir := true;

  if (bImprimir) then
  begin
    ImprimeRelatorio.QueryDados.Assign(dtmRelatorioCartaComun.qryCartaComun.SQL);
    ImprimeRelatorio.Imprimir([null]);
  end;
end;

procedure TfrmCadCarta.sbtnConfigEtiquetaClick(Sender: TObject);
begin
  ImprimeRelatorio.Configurar;
end;

procedure TfrmCadCarta.sbtnDesfConfigCartaComunicClick(Sender: TObject);
begin
  ImprimeRelatorio.RestaurarConfiguracao;
end;

procedure TfrmCadCarta.ftcmbNomeFonteChange(Sender: TObject);
begin
  if not(bMudouTexto) then
    CurrText.Name := ftcmbNomeFonte.SelectedFont;
end;

procedure TfrmCadCarta.edTamFonteChange(Sender: TObject);
begin
  if not(bMudouTexto) then
    CurrText.Size := StrToInt(edTamFonte.Text);
end;

procedure TfrmCadCarta.TreeLegendaCloseUp(Sender: TObject; Select: Boolean);
begin
  if (Select) and (qry.State in [dsInsert,dsEdit]) then
  begin
    dbrcedTexto.SelLength := 0;
    dbrcedTexto.SelText := Copy(TreeLegenda.Text, 1, Pos('>', TreeLegenda.Text))
  end;
end;

procedure TfrmCadCarta.rcedTextoSelectionChange(Sender: TObject);
begin
  with (dbrcedTexto.Paragraph) do
  try
    bMudouTexto := true;
    tbtNegrito.Down := (fsBold in dbrcedTexto.SelAttributes.Style);
    tbtItalico.Down := (fsItalic in dbrcedTexto.SelAttributes.Style);
    tbtSublinhado.Down := (fsUnderline in dbrcedTexto.SelAttributes.Style);
    tbtMarcador.Down := boolean(Numbering);
    edTamFonte.Text := IntToStr(dbrcedTexto.SelAttributes.Size);
    ftcmbNomeFonte.Text := dbrcedTexto.SelAttributes.Name;
    case Ord(Alignment) of
      0: tbtAlinhamEsq.Down := true;
      1: tbtAlinhamDir.Down := true;
      2: tbtAlinhamCen.Down := true;
    end;
  finally
    bMudouTexto := false;
  end;
end;

procedure TfrmCadCarta.tbtDesfazerClick(Sender: TObject);
begin
  if (dbrcedTexto.HandleAllocated) then
    SendMessage(dbrcedTexto.Handle, EM_UNDO, 0, 0);
end;

procedure TfrmCadCarta.tbtNegritoClick(Sender: TObject);
begin
  if not(bMudouTexto) then
    if (tbtNegrito.Down) then
      CurrText.Style := CurrText.Style + [fsBold]
    else
      CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TfrmCadCarta.tbtItalicoClick(Sender: TObject);
begin
  if not(bMudouTexto) then
    if (tbtItalico.Down) then
      CurrText.Style := CurrText.Style + [fsItalic]
    else
      CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TfrmCadCarta.tbtSublinhadoClick(Sender: TObject);
begin
  if not(bMudouTexto) then
    if (tbtSublinhado.Down) then
      CurrText.Style := CurrText.Style + [fsUnderline]
    else
      CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TfrmCadCarta.tbtCorTextoClick(Sender: TObject);
begin
  if not(bMudouTexto) then
  begin
    tbtCorTexto.Down := false;
    if (ColorDialog.Execute) then
      CurrText.Color := ColorDialog.Color;
  end;
end;

procedure TfrmCadCarta.tbtAlinhamEsqClick(Sender: TObject);
begin
  if not(bMudouTexto) then
    dbrcedTexto.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfrmCadCarta.tbtAlinhamCenClick(Sender: TObject);
begin
  if not(bMudouTexto) then
    dbrcedTexto.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfrmCadCarta.tbtAlinhamDirClick(Sender: TObject);
begin
  if not(bMudouTexto) then
    dbrcedTexto.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfrmCadCarta.tbtMarcadorClick(Sender: TObject);
begin
  if not(bMudouTexto) then
    dbrcedTexto.Paragraph.Numbering := TNumberingStyle(tbtMarcador.Down);
end;

function ProcuraJanelaWord(Wnd: HWnd; Form: TfrmCadCarta): bool; StdCall;
var
  ClassName: string;
begin
  SetLength(ClassName, 100);
  GetClassName(Wnd, PChar(ClassName), Length(ClassName));
  ClassName := PChar(ClassName);

  Result := (ClassName = 'OpusApp');
  if (ClassName = 'OpusApp') then
    SetForegroundWindow(Wnd);
end;

procedure TfrmCadCarta.bbtnEditMSWodClick(Sender: TObject);
var
  FileAux: TextFile;
  FileName, ConfirmConversions, ReadOnly, AddToRecentFiles, PasswordDocument,
  PasswordTemplate, Revert, WritePasswordDocument, WritePasswordTemplate,
  Format: OleVariant;
begin
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Abrindo Documento no Microsoft Word ...');
  FileName := 'C:\CartaAux.rtf';
  ConfirmConversions := false;
  ReadOnly := false;
  AddToRecentFiles := false;
  PasswordDocument := '';
  PasswordTemplate := '';
  Revert := false;
  WritePasswordDocument := '';
  WritePasswordTemplate := '';
  Format := wdOpenFormatRTF;

  try // Gravo o arquivo auxiliar
    AssignFile(FileAux, FileName);
    Rewrite(FileAux);
    Write(FileAux, qry.FieldByName('TEXTO').asString);
  finally
    CloseFile(FileAux);
  end;

  frmAguarde.Update;
  MSWord.Connect;
  MSWord.Documents.Application.Caption := 'Carta ou Comunicado';
  frmAguarde.Update;
  MSWord.Documents.Open(
    FileName, // O nome do documento (caminhos são aceitos).
    ConfirmConversions, // True para exibir a caixa de diálogo Converter arquivo se o arquivo
                        // não estiver no formato do Microsoft Word.
    ReadOnly, // True para abrir o documento como somente leitura.
    AddToRecentFiles, // True para adicionar o nome do arquivo à lista de arquivos
                      // recém-utilizados, na parte inferior do menu Arquivo.
    PasswordDocument, // A senha para abertura do documento.
    PasswordTemplate, // A senha para abertura do modelo.
    Revert, // Controla o que acontece quando Name é o nome de arquivo de um
            // documento aberto. True para descartar quaisquer alterações não
            //gravadas no documento aberto e reabrir o arquivo.
            // False para ativar o documento aberto.
    WritePasswordDocument, // A senha para gravação de alterações no documento.
    WritePasswordTemplate, // A senha para gravação de alterações no modelo.
    Format); // O conversor de arquivo a ser usado para abrir o documento.
             // Pode ser uma das seguintes constantes WdOpenFormat:
             // wdOpenFormatAllWord, wdOpenFormatAuto, wdOpenFormatDocument,
             // wdOpenFormatEncodedText, wdOpenFormatRTF, wdOpenFormatTemplate,
             // wdOpenFormatText, wdOpenFormatUnicodeText ou
             // wdOpenFormatWebPages. O valor padrão é wdOpenFormatAuto.
  frmAguarde.Update;
  frmAguarde.Apaga;
  frmAguarde.pbAguarde.Visible := true;
  MSWord.Visible := true;
  EnumWindows(@ProcuraJanelaWord, LongInt(Self));
  Application.Minimize;

  bbtnEditMSWod.Enabled := false;
end;

procedure TfrmCadCarta.WMDropFiles(var Msg: TWMDropFiles);
var
  CFileName: array[0..MAX_PATH] of char;
begin
  try
    if (qry.State in [dsInsert, dsEdit]) and
       (DragQueryFile(Msg.Drop, 0, CFileName, MAX_PATH) > 0) then
    begin
      dbrcedTexto.Lines.LoadFromFile(CFileName);
      dbrcedTexto.Modified := false;
      Msg.Result := 0;
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

function TfrmCadCarta.CurrText: TTextAttributes;
begin
  if (dbrcedTexto.SelLength > 0) then
    Result := dbrcedTexto.SelAttributes
  else
    Result := dbrcedTexto.DefAttributes;
end;

procedure TfrmCadCarta.Sel(NumCarta: integer);
begin
  qry.Close;
  qry.ParamByName('NumCarta').asInteger := NumCarta;
  qry.Open;

  HabilitarBtImprimir(not(qry.IsEmpty));
end;

procedure TfrmCadCarta.HabilitarBtImprimir(Opcao: boolean);
begin
  sbtnImprimirCarta.Enabled := Opcao;
  sbtnConfigEtiqueta.Enabled := Opcao;
  sbtnDesfConfigCartaComunic.Enabled := Opcao;
end;

procedure TfrmCadCarta.MSWordQuit(Sender: TObject);
begin
{  MSWord.Visible := false;
  MSWord.Disconnect;
  try
    dbrcedTexto.Lines.LoadFromFile('C:\CartaAux.rtf');
    DeleteFile('C:\CartaAux.rtf');
  except
  end;
  Application.Restore;
  bbtnEditMSWod.Enabled := true;}
end;

procedure TfrmCadCarta.bbtnSairClick(Sender: TObject);
begin
{  if not(MSWord.Visible) then
    MsgDlg('Não é permitido fechar esta tela pois a carta ainda está sendo editada no Word.',
           'Aviso', mtWarning, [mbOk,mbHelp], 0)
  else}
    inherited;
end;

end.
