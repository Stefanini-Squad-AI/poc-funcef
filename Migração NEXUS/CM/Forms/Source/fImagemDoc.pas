unit fImagemDoc;

{-------------------------------------------------------------------------------
ALTERAÇÃOES / IMPLEMENTAÇÕES ---------------------------------------------------
--------------------------------------------------------------------------------
WO          : 41032 (40760)
Responsável : Edilaine
Data        : 07/07/2026
Descrição   : Trocar componente para apresentação das fotos
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, TB97, DBCtrls, fPessoa,
  Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, Wwdatsrc, ExtDlgs, db, wwQuery,
  uDataBase, DBTables, TB97Tlbr, IvDictio, IvMulti, IvEMulti, uCmSqlParams,
  DBClient, jPeg, uCMFileUtils;

type
  TfrmImagemDoc = class(TfrmSairAjuda)
    bbtnAssociar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    opnpicDoc: TOpenPictureDialog;
    bbtnLimpar: TBitBtn;
    ScrollBox1: TScrollBox;
    imgDoc: TImage;
    ToolbarSep972: TToolbarSep97;
    CdsImagemDoc: TClientDataSet;
    SQLImagemDoc: TCMSqlParams;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnAssociarClick(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    FdsImg    : TwwDataSource;
    FCampoPai : TFloatField;
    FImagem   : TBlobField;
    procedure ReTamanho;
  public
    { Public declarations }
   property dsImagem : TwwDataSource read FdsImg write FdsImg;
   property CampoPai : TFloatField read FCampoPai write FCampoPai;
   property Imagem   : TBlobField read FImagem write FImagem;
  end;

var
  frmImagemDoc: TfrmImagemDoc;

implementation
uses uMensErro, uSistema, uCMTypes, uCtrlPadroes, uAutorizacao;

{$R *.DFM}

procedure TfrmImagemDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{  inherited;
  FdsImg := nil;
  FCampoPai := nil;
  Action := caFree;   }
end;

procedure TfrmImagemDoc.bbtnAssociarClick(Sender: TObject);
Var
  sFileName, sNewFile: String;
  bDeleteFile: Boolean;
begin
  inherited;
  if opnPicDoc.Execute then
  begin
       bDeleteFile := False;

       with FdsImg.DataSet do
       begin
          sFileName := OpnPicDoc.FileName;

          If (Pos('.jpg', LowerCase(sFileName)) <> 0) Or
             (Pos('.jpeg', LowerCase(sFileName)) <> 0) Then
          Begin
             sNewFile := cmGetTempPath + IntToStr(GetTickCount) + '.bmp';
             CMJPegToBitmap(sFileName, sNewFile);
             sFileName := sNewFile;
             bDeleteFile := True;
          End;

          imgDoc.Picture.LoadFromFile(sFileName); //Assign(FieldByName('Imagem'));

          Edit;
          FCampoPai.AsFloat := FieldByName('IDIMAGEM').AsFloat;
          FieldByName('DESCRIMAGEM').Value := Caption;
          TBlobField(FieldByName('Imagem')).LoadFromFile(sFileName);
          Post;

          If bDeleteFile Then DeleteFile(sFileName);
       end;

       ReTamanho;
  end;
end;

procedure TfrmImagemDoc.bbtnLimparClick(Sender: TObject);
begin
  inherited;
  with FdsImg.DataSet do
  begin
       if (not eof) and
       (MsgDlg('Deseja desassociar a imagem?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
     begin
          Edit;
          TBlobField(FieldByName('Imagem')).Clear;
          Post;
          FCampoPai.Clear;
          imgDoc.Picture.Assign(FieldByName('Imagem'));
          ReTamanho;
     end;
  end;
end;

procedure TfrmImagemDoc.FormShow(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     inherited;
     with FdsImg.DataSet do
     begin
          if FCampoPai.Value <= 0 then
          begin
               Insert;
               If Sistema.ConnectionSide = CnsServer Then
                  FieldByName('IDIMAGEM').AsFloat := LeUltRegistro(nil,'IMAGENSDIGITALIZADAS')
               Else
                  FieldByName('IDIMAGEM').AsFloat := Padroes.GetNextID;
               Post;
          end;
     end;

     with SQLImagemDoc do
     begin
          if FCampoPai.Value <= 0 then
             imgDoc.Picture.Assign(nil)
          else
          if FImagem.IsNull then
             begin
                  Prepare;
                  ParamByName('IDIMAGEM').AsFloat := FCampoPai.AsFloat;
                  close;
                  open;
                  //imgDoc.Picture.Assign(CdsImagemDoc.FieldByName('Imagem'));              //edilaine WO41032
                  Autorizacao.CarregarImagem(TBlobField(CdsImagemDoc.FieldByName('Imagem')), imgDoc);   //edilaine WO41032
                  CdsImagemDoc.close;
             end
          else
              //imgDoc.Picture.Assign(FImagem);              //edilaine WO41032
              Autorizacao.CarregarImagem(TBlobField(FImagem), imgDoc);   //edilaine WO41032

     end;
     ReTamanho;
     Screen.Cursor := crDefault;
end;

procedure TfrmImagemDoc.ReTamanho;
begin
  if (FCampoPai.Value > 0) then
  begin
       imgDoc.Width  := imgDoc.Picture.Width +20;
       imgDoc.Height := imgDoc.Picture.Height +20;
  end
  else
  begin
      imgDoc.Height := 224;
      imgDoc.Width := 342;
  end;
  Width := imgDoc.Width+18;
  Height := imgDoc.Height+76;
  if width < 360 then
     width := 360;
  if width > Screen.Width then
     width := Screen.Width;
  if Height < 300 then
     Height := 300;
  if Height > Screen.Height then
     Height := Screen.Height;

  Top  := Round((Screen.Height - Height) / 2);
  Left := Round((Screen.width - width) / 2);
end;

procedure TfrmImagemDoc.bbtnSairClick(Sender: TObject);
begin
  inherited;
  if FCampoPai.Value <= 0 then
     FdsImg.DataSet.Delete;
end;

end.


