unit FCadTermoDiarioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, DBTables, Wwquery, Usistema,
  wwriched, fPrincipal, Menus, RichEdit, uautorizacao, ColorGrd, TB97,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ppTypes, TREdit,
  CmEventosCadastro, wwDialog, ImgList, uCtrlTermoDiario, FCadastroMT,
  MontaSelect, DBClient, uCMClientDataSet, uCMTypes;


type
  TfrmCadTermoDiarioMT = class(TFrmCadastroMT)
    Label1: TLabel;
    redPagIni: TRealEdit;
    Label2: TLabel;
    redPagFim: TRealEdit;
    CdsAux: TCMClientDataSet;
    ImageList1: TImageList;
    ToolbarImages: TImageList;
    pgctrlParametros: TPageControl;
    tbshtParametros1: TTabSheet;
    ToolBar: TToolBar;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    Corbutton: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    tbshtParametros2: TTabSheet;
    RichEncerra: TwwDBRichEdit;
    RichAbertura: TwwDBRichEdit;
    btnImprime: TToolbarButton97;
    procedure btnImprimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AlignButtonClick2(Sender: TObject);
    procedure RichAberturaSelectionChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure RichAberturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RichAberturaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UndoButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure CenterAlignClick(Sender: TObject);
    procedure RichAberturaOnChange2(Sender: TObject);
    procedure RichAberturaOnSelectionChange2(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure CorbuttonClick(Sender: TObject);
    procedure pgctrlParametrosChange(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RichEncerraMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RichEncerraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnSairClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FontSizeChange(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
  private
    SairDaTela :Boolean;
    Editor:TwwDBRichEdit;
    FUpdating: Boolean;
    FClipboardOwner: HWnd;
    CtrlTermoDiario :TCtrlTermoDiario;
    procedure GetFontNames;
    procedure UpdateCursorPos;
    procedure RetornaDadosParaTela;

  public
    { Public declarations }
  end;

var
  frmCadTermoDiarioMT: TfrmCadTermoDiarioMT;

implementation

uses Clipbrd, DBaseDados, UMensErro, dTermoDiario;

{$R *.DFM}
procedure TfrmCadTermoDiarioMT.RetornaDadosParaTela;
begin
  // Traz campos de volta para a tela
   RichAbertura.Lines.Clear;
   RichEncerra.Lines.Clear;
   Cds.First;
   While Not Cds.Eof Do
   Begin
     If Cds.FieldByName('ABERTFECHAM').AsString = 'A' Then
     Begin
        RichAbertura.Lines.Assign(Cds.FieldByName('TERTEXTO'))
     End Else
     Begin
        RichEncerra.Lines.Assign(Cds.FieldByName('TERTEXTO'));
     End;
     Cds.Next;
   End;
end;

procedure TfrmCadTermoDiarioMT.RichAberturaOnSelectionChange2(Sender: TObject);
begin
   with Editor.Paragraph do
      try
         FUpdating := True;
         BoldButton.Down := fsBold in Editor.SelAttributes.Style;
         ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
         UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
         BulletsButton.Down := Boolean(Numbering);
         FontSize.Text := '10';
         FontName.Text := Editor.SelAttributes.Name;

         case Ord(Alignment) of
            0: LeftAlign.Down := True;
            1: RightAlign.Down := True;
            2: CenterAlign.Down := True;
         end;

         UpdateCursorPos;
      finally
         FUpdating := False;
   end;

end;

procedure TfrmCadTermoDiarioMT.UpdateCursorPos;
begin
   CopyButton.Enabled := Editor.SelLength > 0;
   CutButton.Enabled := CopyButton.Enabled;
end;


procedure TfrmCadTermoDiarioMT.btnImprimeClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmTermo, dtmTermo);

  dtmTermo.cdsTermo.Data := CtrlTermoDiario.ListRptTermo(Sistema.idEmpresa);
  dtmTermo.FazOnCalcField(StrToInt(redPagIni.text),StrToInt(redPagFim.text));
  dtmTermo.cdsTermo.First;

  dtmTermo.rptTermos.language := lgPortugueseBrazil;
  dtmTermo.rptTermos.Device   := dvScreen;
  dtmTermo.rpttermos.Print;


end;

procedure TfrmCadTermoDiarioMT.FormCreate(Sender: TObject);
begin
  inherited;
   // *** Instancia a classe principal***
  CtrlTermoDiario := TCtrlTermoDiario.Create;
  CtrlTermoDiario.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   CtrlTermoDiario.CdsTermoDiario   := Cds;
   Cds.Data := CtrlTermoDiario.ListTermoDiario(-1,'',False);


   CdsAux.Data := CtrlTermoDiario.ListTermoDiario(Sistema.IdEmpresa,'',False);
   If CdsAux.IsEmpty  Then
   Begin
        RichAbertura.Text := '';
        RichAbertura.Lines.Clear;
        RichEncerra.Text := '';
        RichEncerra.Lines.Clear;

        {Se não retornar nada, insere }

         RichAbertura.Text := 'Contém este livro ___ (por extenso) folhas numeradas seguidamente de 001 a ' +
                              '___ que servirá de Livro Diário número ___ da empresa _____________, ' +
                              'estabelecida na ___________________________, registrada sob o número ' +
                              '________________ em __/__/__ na junta comercial do estado e inscrita no ' +
                              'CGC(MF) No. __.___.___/____-__.'#13'Declaramos sob pena de responsabilidade '+
                              'que foram escrituradas folhas de número 001 a ___ de acordo com instrução '+
                              'normativa No. 54 de 15/03/96, baixada pelo diretor regional do registro do '+
                              'comércio, que autoriza a escrituração mercantil pelo sistema de processamento '+
                              'por computador.'#13' <Local>, <dia> de <mes> de <ano>'#13'______________________'+
                              '              _____________________'#13'(Representante Legal)                  (Contador)';

         RichEncerra.Text := 'Contém este livro ___ (por extenso) folhas numeradas seguidamente de 001 a ' +
                             '___ que servirá de Livro Diário número ___ da empresa _____________, ' +
                             'estabelecida na ___________________________, registrada sob o número ' +
                             '________________ em __/__/__ na junta comercial do estado e inscrita no ' +
                             'CGC(MF) No. __.___.___/____-__.'#13'Declaramos sob pena de responsabilidade '+
                             'que foram escrituradas folhas de número 001 a ___ de acordo com instrução '+
                             'normativa No. 54 de 15/03/96, baixada pelo diretor regional do registro do '+
                             'comércio, que autoriza a escrituração mercantil pelo sistema de processamento '+
                             'por computador.'#13' <Local>, <dia> de <mes> de <ano>'#13'______________________'+
                             '              _____________________'#13'(Representante Legal)                  (Contador)';


       Cds.Insert;
       Cds.FieldByName('ABERTFECHAM').AsString        := 'A';
       Cds.FieldByName('TERTEXTO').AsString           := RichAbertura.Text;
       Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
       Cds.FieldByName('IDPESSOA').AsInteger          := Sistema.idEmpresa;
       CtrlTermoDiario.Gravar;
       //
       Cds.Insert;
       Cds.FieldByName('ABERTFECHAM').AsString        := 'F';
       Cds.FieldByName('TERTEXTO').AsString           := RichEncerra.Text;
       Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
       Cds.FieldByName('IDPESSOA').AsInteger          := Sistema.idempresa;
       CtrlTermoDiario.Gravar;
   End Else
   Begin
     Cds.Data := CdsAux.Data;
     CdsAux.First;
     While Not CdsAux.Eof do
     Begin
        If CdsAux.FieldByName('ABERTFECHAM').AsString = 'A' Then
        Begin
           RichAbertura.Lines.Assign(CdsAux.FieldByName('TerTexto'))
        End Else
        Begin
           RichEncerra.Lines.Assign(CdsAux.FieldByName('TerTexto'));
        End;
        CdsAux.Next;
     End;
  End;
  //Inicializa o Editor
  Editor := RichAbertura;
  GetFontNames;
  RichAbertura.OnSelectionChange := RichAberturaOnSelectionChange2;
  RichAbertura.OnChange          := RichAberturaOnChange2;
  RichAberturaSelectionChange(Self);

  FClipboardOwner       := SetClipboardViewer(Handle);
  RichAbertura.ReadOnly := true;
  RichEncerra.ReadOnly  := true;

end;


function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
   TStrings(Data).Add(LogFont.lfFaceName);
   Result := 1;
end;

procedure TfrmCadTermoDiarioMT.GetFontNames;
var
  DC: HDC;
begin
   DC := GetDC(0);
   EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
   ReleaseDC(0, DC);
   FontName.Sorted := True;
end;

procedure TfrmCadTermoDiarioMT.RichAberturaSelectionChange(
  Sender: TObject);
begin
  inherited;
   with Editor.Paragraph do
      try
         FUpdating := True;
         BoldButton.Down := fsBold in Editor.SelAttributes.Style;
         ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
         UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
         BulletsButton.Down := Boolean(Numbering);
         FontSize.Text := '10';
         FontName.Text := Editor.SelAttributes.Name;

         case Ord(Alignment) of
            0: LeftAlign.Down := True;
            1: RightAlign.Down := True;
            2: CenterAlign.Down := True;
         end;

         UpdateCursorPos;
      finally
         FUpdating := False;
   end;

end;

procedure TfrmCadTermoDiarioMT.FormActivate(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible    := False;
  sbtnalterar.Enabled    := True;
  sbtnProcurar.Visible   := False;
  sbtnApagar.Visible     := False;
  TB97oKCancelar.Visible := False;

end;

procedure TfrmCadTermoDiarioMT.CmeCadastroEdit(Sender: TObject);
begin
   RichAbertura.ReadOnly   := false;
   RichEncerra.ReadOnly    := false;
   inherited;

   cutbutton.Enabled       := true;
   copybutton.enabled      := true;
   pastebutton.enabled     := true;
   fontname.enabled        := true;
   fontsize.enabled        := true;
   updown1.enabled         := true;
   boldbutton.enabled      := true;
   italicbutton.enabled    := true;
   underlinebutton.enabled := true;
   leftalign.Enabled       := true;
   centeralign.enabled     := true;
   rightalign.enabled      := true;
   bulletsbutton.Enabled   := true;
   corbutton.enabled       := true;
   undobutton.enabled      := true;
   TB97oKCancelar.Visible := True;

end;


procedure TfrmCadTermoDiarioMT.RichAberturaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   with editor do begin
      BoldButton.Down := fsBold in Editor.SelAttributes.Style;
      ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
      UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
      FontSize.Text := '10';
      FontName.Text := Editor.SelAttributes.Name;
   end;

   with editor.paragraph do begin
      BulletsButton.Down := Boolean(Numbering);
      case Ord(Alignment) of
         0: LeftAlign.Down := True;
         1: RightAlign.Down := True;
         2: CenterAlign.Down := True;
       end;
   end;

end;

procedure TfrmCadTermoDiarioMT.RichAberturaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   with editor do begin
      BoldButton.Down := fsBold in Editor.SelAttributes.Style;
      ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
      UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
      FontSize.Text := '10';
      FontName.Text := Editor.SelAttributes.Name;
   end;

   with editor.paragraph do begin
      BulletsButton.Down := Boolean(Numbering);
      case Ord(Alignment) of
         0: begin
            LeftAlign.Down := True;
            RightAlign.Down := False;
            CenterAlign.Down := False;
            end;
         1: begin
            RightAlign.Down := True;
            LeftAlign.Down := False;
            CenterAlign.Down := False;
            end;
         2: begin
            CenterAlign.Down := True;
            LeftAlign.Down := False;
            RightAlign.Down := False;
            end;
      end;
   end;    

end;

procedure TfrmCadTermoDiarioMT.UndoButtonClick(Sender: TObject);
begin
  inherited;
  with Editor do
     if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);

end;

procedure TfrmCadTermoDiarioMT.AlignButtonClick2(Sender: TObject);
begin
   if FUpdating then Exit;
   Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfrmCadTermoDiarioMT.LeftAlignClick(Sender: TObject);
begin
  inherited;
   if FUpdating then Exit;
   Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);

end;

procedure TfrmCadTermoDiarioMT.CenterAlignClick(Sender: TObject);
begin
  inherited;
   if FUpdating then Exit;
   Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);

end;

procedure TfrmCadTermoDiarioMT.RichAberturaOnChange2(Sender: TObject);
begin
  Editor.Modified;
  UndoButton.Enabled := SendMessage(Editor.Handle, EM_CANUNDO, 0, 0) <> 0;
end;


procedure TfrmCadTermoDiarioMT.BulletsButtonClick(Sender: TObject);
begin
  inherited;
   if FUpdating then Exit;
   Editor.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);

end;

procedure TfrmCadTermoDiarioMT.CutButtonClick(Sender: TObject);
begin
  inherited;
  Editor.CutToClipboard;

end;

procedure TfrmCadTermoDiarioMT.CopyButtonClick(Sender: TObject);
begin
  inherited;
  Editor.CopyToClipboard;

end;

procedure TfrmCadTermoDiarioMT.PasteButtonClick(Sender: TObject);
begin
  inherited;
   Editor.PasteFromClipboard;

end;

procedure TfrmCadTermoDiarioMT.FontNameChange(Sender: TObject);
begin
  inherited;
   if FUpdating then Exit;
   editor.selattributes.Name := FontName.Text;

end;

procedure TfrmCadTermoDiarioMT.CorbuttonClick(Sender: TObject);
var
  CaixaDeCor :TColorDialog;
begin
   inherited;
  CaixaDeCor := TColorDialog.Create(Self);

  If CaixaDeCor.Execute Then
  Begin
     Editor.selattributes.color := CaixaDeCor.Color;
     CaixaDeCor.Free;
  End;


end;

procedure TfrmCadTermoDiarioMT.pgctrlParametrosChange(Sender: TObject);
begin
  inherited;
   ToolBar.Parent := pgctrlParametros.ActivePage;
   If pgctrlParametros.ActivePage.PageIndex = 0 Then
      Editor:=RichAbertura
   Else
      Editor:=RichEncerra;

end;

procedure TfrmCadTermoDiarioMT.CmeCadastroCancel(Sender: TObject);
begin
  If Not SairDaTela Then
     RetornaDadosParaTela;
  inherited;

end;

procedure TfrmCadTermoDiarioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlTermoDiario.Free;
end;


procedure TfrmCadTermoDiarioMT.FormShow(Sender: TObject);
begin
  inherited;
  SairDaTela := False;
  UpdateCursorPos;
end;

procedure TfrmCadTermoDiarioMT.RichEncerraMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   with editor do begin
      BoldButton.Down := fsBold in Editor.SelAttributes.Style;
      ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
      UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
      FontSize.Text := '10';
      FontName.Text := Editor.SelAttributes.Name;
   end;

   with editor.paragraph do begin
      BulletsButton.Down := Boolean(Numbering);
      case Ord(Alignment) of
         0: begin
            LeftAlign.Down := True;
            RightAlign.Down := False;
            CenterAlign.Down := False;
            end;
         1: begin
            RightAlign.Down := True;
            LeftAlign.Down := False;
            CenterAlign.Down := False;
            end;
         2: begin
            CenterAlign.Down := True;
            LeftAlign.Down := False;
            RightAlign.Down := False;
            end;
      end;
   end;

end;

procedure TfrmCadTermoDiarioMT.RichEncerraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   with editor do begin
      BoldButton.Down := fsBold in Editor.SelAttributes.Style;
      ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
      UnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
      FontSize.Text := '10';
      FontName.Text := Editor.SelAttributes.Name;
   end;

   with editor.paragraph do begin
      BulletsButton.Down := Boolean(Numbering);
      case Ord(Alignment) of
         0: LeftAlign.Down := True;
         1: RightAlign.Down := True;
         2: CenterAlign.Down := True;
       end;
   end;      

end;

procedure TfrmCadTermoDiarioMT.bbtnSairClick(Sender: TObject);
begin
  inherited;
  SairDaTela := True;
end;

procedure TfrmCadTermoDiarioMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;

end;

procedure TfrmCadTermoDiarioMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlTermoDiario.Gravar;
end;

procedure TfrmCadTermoDiarioMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlTermoDiario.Gravar;

end;

procedure TfrmCadTermoDiarioMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlTermoDiario.Gravar;

end;

procedure TfrmCadTermoDiarioMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

   // Edita os termos diarios
   While Not Cds.Eof Do
   Begin
     // Edita regsitro
     Cds.Edit;
     If Cds.FieldByName('ABERTFECHAM').AsString = 'A' Then
     Begin
        Cds.Fieldbyname('TERTEXTO').AsString := RichAbertura.Text;
     End Else
     Begin
        Cds.FieldByName('TERTEXTO').asString := RichEncerra.Text;
     End;

     Cds.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
     Cds.FieldByName('IDPESSOA').AsInteger          := Sistema.idempresa;
     Cds.Post;

     Cds.Next;
   End;

end;

procedure TfrmCadTermoDiarioMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlTermoDiario.MessageInfo <> '' Then
     MsgDlg(CtrlTermoDiario.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadTermoDiarioMT.FontSizeChange(Sender: TObject);
begin
  inherited;
  editor.selattributes.Size := StrToInt(FontSize.Text);

end;

procedure TfrmCadTermoDiarioMT.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  editor.selattributes.Size := StrToInt(FontSize.Text);

end;

end.
