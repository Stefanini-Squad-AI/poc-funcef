// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
// Data     : 01/03/2005
// Código   : AL_01
// Motivo   : Tratamento para qdo não hover posição
//******************************************************************************

unit FExportaCargaMaps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  Db, DBTables, Wwquery, ComCtrls, uSistema;

type
  TfrmExportaCargaMaps = class(TfrmOkCancelarInv)
    dDataExp: TCMDateTimePicker;
    Label3: TLabel;
    edtArquivo: TEdit;
    Label1: TLabel;
    sbProcuraArquivo: TSpeedButton;
    QryOperacaoBolsa: TwwQuery;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    LblSiglaAcao: TLabel;
    QryPosicaoBolsa: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbProcuraArquivoClick(Sender: TObject);
    procedure dDataExpExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function  VerificaCaminhoArq(var sTexto : string) : Boolean;
    procedure Exportacao;
  public
    { Public declarations }
  end;

var
  frmExportaCargaMaps: TfrmExportaCargaMaps;

implementation

uses UBibliotecaInvest, UMensErro;

{$R *.DFM}

function  TfrmExportaCargaMaps.VerificaCaminhoArq(var sTexto : string) : Boolean;
Var
   i : Integer;
   sErro : Char;
begin
   sErro := ' ';
   If (Trim(Copy(edtArquivo.text,1,1)) = '')   Or (Trim(Copy(edtArquivo.text,2,1)) = '') Or
      (Trim(Copy(edtArquivo.text,3,1)) = '')   Or
      (Trim(Copy(edtArquivo.text,2,1)) <> ':') Or
      (Trim(Copy(edtArquivo.text,3,1)) <> '\') Then
       sErro := 'D'   //Diretório
   Else If Trim(Copy(edtArquivo.text,4,Length(Trim(edtArquivo.text))-7)) = '' Then
       sErro := 'A'   //Arquivo
   Else If (Trim(Copy(edtArquivo.text,Length(Trim(edtArquivo.text))-2,3)) = '') Or
          ((UpperCase(Trim(Copy(edtArquivo.text,Length(Trim(edtArquivo.text))-2,3))) <> 'TXT') And
           (UpperCase(Trim(Copy(edtArquivo.text,Length(Trim(edtArquivo.text))-2,3))) <> 'DOC')) Then
       sErro := 'T';  //Tipo de arquivo

   If sErro = 'D' Then
      sTexto := 'Diretório não identificado'
   Else If sErro = 'A' Then
      sTexto := 'Arquivo inválido'
   Else If sErro = 'T' Then
      sTexto := 'Tipo de arquivo não identificado';

   Result := True;
   If Trim(sTexto) <> '' Then
      Result := False;

end;

Procedure TfrmExportaCargaMaps.Exportacao;
Var
    sLinhaTexto    : TStringList;
    sTipo          : Char;
    sDescCart      : String;
    iSequencial    : Integer;
Begin

   QryPosicaoBolsa.Close;
   QryPosicaoBolsa.ParamByName('DATA').AsString := dDataExp.Text;
   QryPosicaoBolsa.Open;
   //Al_01
   If QryPosicaoBolsa.EOF Then
   begin
      MsgDlg('Não há posição para essa data!','Mensagem do Sistema',MtInformation,[MbOk],0);
      QryPosicaoBolsa.Close;
      Exit;
   end;

   sLinhaTexto     := TStringList.Create;

   iSequencial     := 1;

   Try

      sLinhaTexto.Add(COPY(dDataExp.Text,4,2)+'/'+COPY(dDataExp.Text,1,2)+'/'+
                      COPY(dDataExp.Text,7,4));

      sLinhaTexto.Add(IntToStr(QryPosicaoBolsa.RecordCount+3));

      ProgressBar1.Position := 0;
      ProgressBar1.Max      := QryPosicaoBolsa.RecordCount;

      While Not QryPosicaoBolsa.EOF Do
      Begin
         LblSiglaAcao.Caption := QryPosicaoBolsa.FieldByName('SIGLAACAOBOLSA').AsString;

         If Pos('ATIVA', UpperCase(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString)) > 0 Then
            sDescCart := Copy(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString,
                           Pos('ATIVA',UpperCase(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString)),
                           Length(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString))
         Else If Pos('PASSIVA',UpperCase(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString)) > 0 Then
            sDescCart := Copy(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString,
                           Pos('PASSIVA',UpperCase(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString)),
                           Length(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString))
         Else If Pos('OUTRO',UpperCase(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString)) > 0 Then
            sDescCart := Copy(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString,
                           Pos('OUTRO',UpperCase(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString)),
                           Length(QryPosicaoBolsa.FieldByName('DESCCARTGERENC').AsString));

         sLinhaTexto.Add(IntToStr(iSequencial)+Chr(vk_tab)+
         QryPosicaoBolsa.FieldByName('SIGLAACAOBOLSA').AsString+'_prd'+Chr(vk_tab)+
         'NA'+Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         'RV'+Chr(vk_tab)+
         'Proprio - RV'+Chr(vk_tab)+
         sDescCart+Chr(vk_tab)+
         'NA'+Chr(vk_tab)+
         'NA'+Chr(vk_tab)+
         'NA'+Chr(vk_tab)+
         'NA'+Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         'a'+Chr(vk_tab)+
         'c'+Chr(vk_tab)+
         QryPosicaoBolsa.FieldByName('QTDE').AsString+Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab)+
         Chr(vk_tab));

         iSequencial := iSequencial + 1;

         QryPosicaoBolsa.Next;
         ProgressBar1.StepIt;
      End;

      If Not QryPosicaoBolsa.IsEmpty Then
         sLinhaTexto.Add('Checksum');

      If QryPosicaoBolsa.RecordCount > 1 Then
         sLinhaTexto.SaveToFile(edtArquivo.Text);

      MsgDlg('Processo Concluído!','Mensagem do Sistema',MtInformation,[MbOk],0)

   Except

      MsgDlg('Não foi possível gravar o arquivo texto!','Mensagem do Sistema',MtInformation,[MbOk],0);

   End;

   LblSiglaAcao.Caption := '';
   ProgressBar1.Max     := 0;
   ProgressBar1.StepIt;

   QryPosicaoBolsa.Close;

End;

procedure TfrmExportaCargaMaps.bbtnConfirmarClick(Sender: TObject);
Var
   sTexto : String;
begin
  inherited;
  If Not VerificaCaminhoArq(sTexto) Then
  Begin
     MsgDlg(sTexto+'!','Mensagem do Sistema',MtInformation,[MbOk],0);
     Exit;
  End;

  Exportacao;

end;

procedure TfrmExportaCargaMaps.sbProcuraArquivoClick(Sender: TObject);
begin
  inherited;
  If (OpenDialog1.Execute) Then
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
end;

procedure TfrmExportaCargaMaps.dDataExpExit(Sender: TObject);
Var
   wDia, wMes, wAno : Word;
begin
  inherited;
  DecodeDate(dDataExp.Date, wAno, wMes, wDia);

  //Jéssica Lana SOL 109421 KINTANA 496332
  //edtArquivo.Text := 'C:\';
  edtArquivo.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\';

  edtArquivo.Text := edtArquivo.Text + IntToStr(wDia)+IntToStr(wMes)+IntToStr(wAno);
end;

procedure TfrmExportaCargaMaps.FormShow(Sender: TObject);
begin
  inherited;
   dDataExp.Date := pRPI.DATAULTFECH;
end;

procedure TfrmExportaCargaMaps.FormCreate(Sender: TObject);
begin
  inherited;

  //Jéssica Lana SOL 109421 KINTANA 496332
  OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  edtArquivo.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\';


end;

end.

