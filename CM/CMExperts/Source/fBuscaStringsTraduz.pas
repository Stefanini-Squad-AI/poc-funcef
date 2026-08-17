unit fBuscaStringsTraduz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SQLParserComp, StdCtrls, ExtCtrls, ComCtrls, TB97Ctls, TB97, TB97Tlbr,
  Buttons, uCMListDialog, EditReg;

Const
  COMENTARIO = '{ivlm}';
  FUNCAOTRADUCAO = 'Translate(';

type
  TFrmPrincipal = class(TForm)
    QueryParser: TQueryParserComp;
    Panel1: TPanel;
    panButtons: TPanel;
    rEdtParser: TRichEdit;
    Label3: TLabel;
    BtnIniciar: TBitBtn;
    SpeedButton2: TSpeedButton;
    LstArquivos: TCMListDialog;
    EdtArquivos: TEditReg;
    CkbBkp: TCheckBox;
    LblArquivo: TLabel;
    procedure BtnIniciarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    _sFileName: String;
    procedure SalvaArquivoCorrente;
    function ProcessaArquivoCorrente: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses fBuscaStringsTraduzDlg, JclFileUtils;

{$R *.DFM}

procedure TFrmPrincipal.SalvaArquivoCorrente;
Var
   iPosUnit: Integer;
begin
   iPosUnit := rEdtParser.FindText('ivDictio',0,Length(rEdtParser.Lines.Text),[]);
   if iPosUnit = -1 then
   begin
      iPosUnit := rEdtParser.FindText('Uses',0,Length(rEdtParser.Lines.Text), []);

      if iPosUnit <> -1 then
      begin
        rEdtParser.SetFocus;
        rEdtParser.SelStart := iPosUnit;
        rEdtParser.SelLength := Length('Uses');
        rEdtParser.SelText := rEdtParser.SelText + ' ivDictio, ';
      end;
   end;

   if CkbBkp.Checked then
      CopyFile(Pchar(_sFileName),Pchar(_sFileName + '.cmt'),false);

   DeleteFile(_sFileName);
   rEdtParser.Lines.SaveToFile(_sFileName);
end;

function TFrmPrincipal.ProcessaArquivoCorrente:Boolean;
Var
  iCharAdicionais: Integer;
  bEfetuouAlteracao: Boolean;
begin
  rEdtParser.Lines.LoadFromFile(_sFileName);
  result := true;

  QueryParser.TextToParse := rEdtParser.Text;
  QueryParser.FirstToken;
  iCharAdicionais := 0;


  bEfetuouAlteracao := False;

  While not QueryParser.EOF do
  begin
      if (QueryParser.TokenType = ttString) And (Not (QueryParser.Comment)) then
      begin
         rEdtParser.SetFocus;
         rEdtParser.SelStart := QueryParser.PosIniString + iCharAdicionais - 1;
         rEdtParser.SelLength := (QueryParser.Position + iCharAdicionais) - rEdtParser.SelStart;

         Case FrmBuscaStringsTraduzDlg.ShowModal of
           MRYES:
           begin
             rEdtParser.SelText := FUNCAOTRADUCAO + rEdtParser.SelText + ')';
             iCharAdicionais := iCharAdicionais + Length(FUNCAOTRADUCAO) + 1;
             bEfetuouAlteracao := True;
           end;
           MRNO:
           begin
             rEdtParser.SelText := rEdtParser.SelText + COMENTARIO;
             iCharAdicionais := iCharAdicionais + Length(COMENTARIO);
             bEfetuouAlteracao := True;
           end;
           MRIGNORE:
           begin
           end;
           MRABORT:
           begin
              If bEfetuouAlteracao And
                 (Application.MessageBox('Salva as Alterações ?','Atenção',MB_ICONQUESTION + MB_YESNO) = ID_YES) then
                 SalvaArquivoCorrente;

              result := false;
              Break;
           end;
         end;
      end;
      QueryParser.NextToken;
  end;

  If bEfetuouAlteracao And result then
     SalvaArquivoCorrente;
end;

procedure TFrmPrincipal.BtnIniciarClick(Sender: TObject);
Var
   lstArquivo: TStrings;
   sArquivo, sAuxLista: String;
   iPosSeparador, X: Integer;
begin


   if Trim(EdtArquivos.Text) <> '' then
   begin
      lstArquivo := TStringList.Create;
      Try
         sAuxLista := EdtArquivos.Text;

         iPosSeparador := -1;

         While iPosSeparador <> 0 do
         begin
            iPosSeparador := pos(';', sAuxLista);

            if iPosSeparador = 0 then
               sArquivo := sAuxLista
            Else
               sArquivo := Copy(sAuxLista,1,iPosSeparador - 1);

            sAuxLista := Copy(sAuxLista,iPosSeparador + 1,Length(sAuxLista));

            BuildFileList(sArquivo, faArchive, lstArquivo);

            For X:=0 to pred(lstArquivo.Count) do
            begin
               _sFileName := PathAddSeparator(ExtractFilePath(sArquivo)) + lstArquivo[x];
               LblArquivo.Caption := _sFileName;
               Application.ProcessMessages;

               if not ProcessaArquivoCorrente And (X < pred(lstArquivo.Count)) then
               begin
                  if Application.MessageBox('Processa o próximo arquivo ?','Atenção',MB_ICONQUESTION + MB_YESNO) = ID_NO then
                     Abort;
               end;
            end;
         end;
      finally
         lstArquivo.Free;
      End;
   end;
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
   LstArquivos.Content := EdtArquivos.Text;
   if LstArquivos.Execute then
      EdtArquivos.Text := LstArquivos.Content;
end;

end.



