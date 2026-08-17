unit fAchaTroca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TB97Ctls, filectrl,
  MAHlpBtn, Buttons, StdCtrls;

type
    TAcaoSubstitui = (asSim, asNao, asSimTodos, asCancela, asNada);
  TfrmAchaTroca = class(TForm)
    tbConfirma: TToolbar97;
    btnSim: TToolbarButton97;
    btnTodos: TToolbarButton97;
    btnNao: TToolbarButton97;
    btnParar: TToolbarButton97;
    pnlFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblArquivo: TLabel;
    GroupBox2: TGroupBox;
    chkMatch: TCheckBox;
    chkPedeConfirma: TCheckBox;
    chkSubDir: TCheckBox;
    cmbProcura: TComboBox;
    cmbSubstitui: TComboBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    edPasta: TEdit;
    edMascara: TEdit;
    MemoBusca: TRichEdit;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    lConfirma : boolean;
    Acao : TAcaoSubstitui;
    procedure AtuDir(dir:string);
    procedure AtuSubDir(dir:string);
    function IsDfmText(sArqTexto: String): Boolean;
  public
    { Public declarations }
  end;

var
  frmAchaTroca: TfrmAchaTroca;


implementation

uses fEscolheArquivos, uCMFileUtils;

{$R *.DFM}

procedure TfrmAchaTroca.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with TfrmEscolheArquivos.Create(self) do
  begin
       lstBoxDir.Directory := edPasta.Text;
       edArquivos.Text     := edmascara.text;
       if ShowModal = mrOk then
       begin
            edPasta.Text := lstBoxDir.Directory ;
            edMascara.Text := edArquivos.Text ;
       end;
       free;
  end;

end;

procedure TfrmAchaTroca.FormCreate(Sender: TObject);
begin
  inherited;
  edPasta.Text := GetCurrentDir ;
  tbConfirma.visible := false;
end;

procedure TfrmAchaTroca.bbtnConfirmarClick(Sender: TObject);
var Opcoes : TSearchTypes ;
begin
  inherited;
  if (cmbProcura.Text <> '') and
     (cmbSubstitui.Text <> '') then
  begin
       if cmbProcura.Items.IndexOf(cmbProcura.Text) < 0 then
          cmbProcura.Items.Insert(0,cmbProcura.Text);

       if cmbSubstitui.Items.IndexOf(cmbSubstitui.Text) < 0 then
          cmbSubstitui.Items.Insert(0,cmbSubstitui.Text);

       if chkMatch.Checked then
          Opcoes := [stMatchCase]
       else
           Opcoes := [];

       if chkPedeConfirma.Checked then
          Acao := asNada
       else
           Acao := asSimTodos;

       if chkSubDir.Checked then
          AtuSubDir(edPasta.Text)
       else
          AtuDir(edPasta.Text);

       pnlFundo.Enabled := false;
       pnlFundo.Enabled := true;
       MemoBusca.Lines.Clear;
  end;
end;

procedure TfrmAchaTroca.btnSimClick(Sender: TObject);
begin
  inherited;
  lConfirma := true;
  Acao := asSim ;
end;

procedure TfrmAchaTroca.btnNaoClick(Sender: TObject);
begin
  inherited;
  lConfirma := true;
  Acao := asNao ;

end;

procedure TfrmAchaTroca.btnTodosClick(Sender: TObject);
begin
  inherited;
  lConfirma := true;
  Acao := asSimTodos ;

end;

procedure TfrmAchaTroca.btnPararClick(Sender: TObject);
begin
     inherited;
     lConfirma := true;
     Acao := asCancela ;
end;

procedure TfrmAchaTroca.bbtnSairClick(Sender: TObject);
begin
   btnParar.Click ;
   ModalResult := mrOk;

   if Application.MainForm = Self then Application.Terminate;
end;

procedure TfrmAchaTroca.bbtnCancelarClick(Sender: TObject);
begin
     btnParar.Click ;
     inherited;
end;

procedure TfrmAchaTroca.AtuSubDir(dir:string);
var ListaDir : TFileListBox;
    i : integer;
begin
     ListaDir := TFileListBox.Create(self);
     with ListaDir do
     begin
          Visible := false;
          Parent := self;
          Directory := dir;
          FileType := [ftDirectory];
          ApplyFilePath(dir);
          for i := 0 to Items.Count -1 do
              if (Items[i] <> '[..]') and
                 (Items[i] <> '[.]') then
                 AtuSubDir(dir+'\'+Copy(Items[i],2,Length(Items[i])-2));
          AtuDir(dir);
     end;
     ListaDir.Free;
end;

procedure TfrmAchaTroca.AtuDir(dir:string);
var ListaArquivos : TFileListBox;
    i, iAchou, TamText : integer;
    sArqCompleto, sArqTxt : string;
    UltColor : TColor;
    Opcoes : TSearchTypes ;
    lGrava, lDFM, lFim, lDfmText : boolean;
    j : integer;
begin
       ListaArquivos := TFileListBox.Create(self);
       with ListaArquivos do
       begin
            Visible := false;
            Parent := self;
            Directory := dir;
            Mask := edMascara.Text;
            ApplyFilePath(dir);
            for i := 0 to (Items.Count -1) do
            begin
                 lDfmText := false;
                 lGrava := false;
                 sArqCompleto := dir+'\'+Items[i];
                 lblArquivo.Caption := sArqCompleto;
                 //Testa se é DFM

                 SetCurrentDir(ExtractFilePath(sArqCompleto));

                 if uppercase(Copy(Items[i],Length(Items[i])-3,4)) = '.DFM' then
                 begin
                      lDFM := true;
                      lDfmText := IsDfmtext(sArqCompleto);

                      sArqTxt := Copy(sArqCompleto, 1, Length(sArqCompleto)-3)+'TXT';

                      If Not lDfmText Then
                         ExecuteFile( 'C:\ProjetosCM5\Cm\Packages\convert.exe', sArqCompleto, true, false);


                      If Not FileExists(sArqTxt) Then
                         CopyFile(PChar(sArqCompleto),PChar(sArqTxt),false);
                 end
                 else
                     lDFM := false;

                 if lDFM then
                 begin
                      lFim := false;
                      while not lFim do
                      begin
                           try
                              MemoBusca.Lines.LoadFromFile(sArqTxt);
                              lFim := true;
                           except

                           end;
                      end;
                 end
                 else
                     MemoBusca.Lines.LoadFromFile(sArqCompleto);
                 TamText := Length(MemoBusca.Text);
                 iAchou := MemoBusca.FindText(trim(cmbProcura.Text), 0, TamText,Opcoes);
                 while (iAchou >= 0) do
                 begin
                      pnlFundo.Enabled := true;
                      MemoBusca.SetFocus;
                      MemoBusca.SelStart := iAchou;
                      MemoBusca.SelLength := Length(cmbProcura.Text);
                      UltColor := MemoBusca.SelAttributes.Color;
                      MemoBusca.SelAttributes.Color := clRed;
                      MemoBusca.SelAttributes.Style := [fsBold];
                      pnlFundo.Enabled := false;

                      if (chkPedeConfirma.Checked) and (Acao <> asSimTodos) then
                      begin
                           tbConfirma.visible := true;
                           lConfirma := false;
                           while not lConfirma do
                           begin
                                if not MemoBusca.Focused then ;
                                Application.ProcessMessages;
                           end;
                           tbConfirma.visible := false;
                      end;

                      case Acao of
                      asSim, asSimTodos :
                             begin
                                  MemoBusca.SelAttributes.Color := clBlue;
                                  MemoBusca.SelText := cmbSubstitui.Text ;
                                  lGrava := true;
                             end;
                      asNao, asNada :
                             begin
                                  MemoBusca.SelAttributes.Color := UltColor;
                                  MemoBusca.SelAttributes.Style := [];
                             end;
                      asCancela :
                                begin
                                     pnlFundo.Enabled := true;
                                     MemoBusca.Lines.Clear;
                                     exit;
                                end;
                      end;
                      iAchou := iAchou+Length(cmbSubstitui.Text);
                      iAchou := MemoBusca.FindText(trim(cmbProcura.Text), iAchou, TamText,Opcoes);
                 end;
                 if lGrava then
                 begin
                      if lDFM then
                      begin
                           SetCurrentDir(ExtractFilePath(sArqTxt));
                           MemoBusca.Lines.SaveToFile(sArqTxt);

                           If Not lDfmText Then
                              ExecuteFile( 'C:\ProjetosCM5\Cm\Packages\convert.exe', sArqTxt, true, false)
                           Else
                              CopyFile(PChar(sArqTxt),PChar(sArqCompleto),false);

                           for j := 0 to 1000000000 do;
                      end
                      else
                          MemoBusca.Lines.SaveToFile(sArqCompleto);
                 end;
                 if lDFM then
                    while FileExists(sArqTxt) do
                          DeleteFile(sArqTxt);

            end;
       end;
end;

function TfrmAchaTroca.IsDfmText(sArqTexto:String):Boolean;
Begin
  With TStringList.Create Do
     Try
        LoadFroMFile(sArqTexto);
        Result := (Pos('Object',UpperCase(Text)) > 0);
     finally
        free;
     End;
End;

end.
