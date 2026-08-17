// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
//------------------------------------------------------------------------------
unit FExportaDadoTexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, uSistema, TREdit;

type
  TfrmExportaDadoTexto = class(TfrmOkCancelar)
    rgTipoInvest: TRadioGroup;
    QryOperacaoFundos: TwwQuery;
    edtArquivo: TEdit;
    sbProcuraArquivo: TSpeedButton;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    dDtFim: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    dDtIni: TCMDateTimePicker;
    QryOperacaoBolsa: TwwQuery;
    Label5: TLabel;
    rSequencial: TRealEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbProcuraArquivoClick(Sender: TObject);

    procedure RendaVariavel;
    procedure Fundos;
    procedure FormShow(Sender: TObject);

    function  VerificaCaminhoArq(var sTexto : string) : Boolean;
    procedure rgTipoInvestClick(Sender: TObject);
    procedure dDtIniExit(Sender: TObject);
    procedure dDtFimExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    function Inteiro(Value : String) : String;
    function Decimal(Value : String) : String;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportaDadoTexto: TfrmExportaDadoTexto;

implementation

uses fAguarde, UBibliotecaInvest, UMensErro;

{$R *.DFM}

procedure TfrmExportaDadoTexto.sbProcuraArquivoClick(Sender: TObject);
begin
  inherited;
// Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
  End;
end;

function  TfrmExportaDadoTexto.VerificaCaminhoArq(var sTexto : string) : Boolean;
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

procedure TfrmExportaDadoTexto.bbtnConfirmarClick(Sender: TObject);
Var
   sTexto : String;
begin
  inherited;
  If Not VerificaCaminhoArq(sTexto) Then
  Begin
     MsgDlg(sTexto+'!','Mensagem do Sistema',MtInformation,[MbOk],0);
     Exit;
  End;

  If rgTipoInvest.ItemIndex = 3 Then
     RendaVariavel
  Else If rgTipoInvest.ItemIndex = 1 Then
     Fundos;
end;

Procedure TfrmExportaDadoTexto.RendaVariavel;
Var
    sLinhaTexto    : TStringList;
    sTpMov         : Char;
    sMercado       : String;
Begin
   sTpMov          := ' ';
   sLinhaTexto     := TStringList.Create;

   QryOperacaoBolsa.Close;
   QryOperacaoBolsa.ParamByName('DATAOPERACAOINI').AsDateTime := dDtIni.DateTime;
   QryOperacaoBolsa.ParamByName('DATAOPERACAOFIM').AsDateTime := dDtFim.DateTime;
   QryOperacaoBolsa.Open;

   frmAguarde.Pos := 0;
   frmAguarde.Max := QryOperacaoBolsa.RecordCount;
   frmAguarde.Mostra('Aguarde, Processando ...');

   Try
      While Not QryOperacaoBolsa.EOF Do
      Begin
         If QryOperacaoBolsa.FieldByName('TIPOCUSTODIA').AsString = 'C' Then
            sTpMov := '0'
         Else If QryOperacaoBolsa.FieldByName('TIPOCUSTODIA').AsString = 'V' Then
            sTpMov := '1';

        If POS('VIS',UpperCase(QryOperacaoBolsa.FieldByName('DESCMERCADO').AsString)) <> 0 Then
           sMercado := 'VIS'
        Else If POS('OP',UpperCase(QryOperacaoBolsa.FieldByName('DESCMERCADO').AsString)) <> 0 Then
           sMercado := 'OPC'
        Else If POS('TER',UpperCase(QryOperacaoBolsa.FieldByName('DESCMERCADO').AsString)) <> 0 Then
           sMercado := 'TER'
        Else
           sMercado := ' ';

         sLinhaTexto.Add(Alinha(Trim(rSequencial.Text),5,'D','0')+
         Alinha(COPY(QryOperacaoBolsa.FieldByName('DATAOPERACAO').AsString,7,4)+
                COPY(QryOperacaoBolsa.FieldByName('DATAOPERACAO').AsString,4,2)+
                COPY(QryOperacaoBolsa.FieldByName('DATAOPERACAO').AsString,1,2),8,'D',' ')+
         Alinha('PA',2,'D',' ')+
         Alinha(COPY(QryOperacaoBolsa.FieldByName('MOEDESC').AsString,1,3),3,'E',' ')+
         Alinha(QryOperacaoBolsa.FieldByName('QTDELOTE').AsString,11,'D',' ')+
         Alinha(QryOperacaoBolsa.FieldByName('IDCORRETVALORES').AsString,11,'D',' ')+
         Alinha(QryOperacaoBolsa.FieldByName('IDCUSTODIANTE').AsString,11,'D',' ')+
         Alinha(Inteiro(QryOperacaoBolsa.FieldByName('QTDEOPERACAO').AsString),10,'D','0')+
         Alinha(Decimal(QryOperacaoBolsa.FieldByName('QTDEOPERACAO').AsString),8,'E','0')+
         Alinha(Inteiro(QryOperacaoBolsa.FieldByName('PRECOUNITOPERACAO').AsString),10,'D','0')+
         Alinha(Decimal(QryOperacaoBolsa.FieldByName('PRECOUNITOPERACAO').AsString),8,'E','0')+
         Alinha(Inteiro(QryOperacaoBolsa.FieldByName('VLROPERACAO').AsString),10,'D','0')+
         Alinha(Decimal(QryOperacaoBolsa.FieldByName('VLROPERACAO').AsString),8,'E','0')+
         Alinha(sMercado,3,'E',' ')+
         sTpMov+
         Alinha(QryOperacaoBolsa.FieldByName('SIGLAACAOBOLSA').AsString,20,'D',' ')+
         Alinha(QryOperacaoBolsa.FieldByName('VENCIMENTO').AsString,4,'D','0'));

         frmAguarde.Pos    := frmAguarde.Pos    + 1;
         rSequencial.Value := rSequencial.Value + 1;
         QryOperacaoBolsa.Next;
      End;
      If QryOperacaoBolsa.RecordCount > 1 Then
         sLinhaTexto.SaveToFile(edtArquivo.Text);

      frmAguarde.Apaga;
      MsgDlg('Processo Concluído!','Mensagem do Sistema',MtInformation,[MbOk],0)
   Except
      frmAguarde.Apaga;
      MsgDlg('Não foi possível gravar o arquivo texto!','Mensagem do Sistema',MtInformation,[MbOk],0);
   End;
   QryOperacaoBolsa.Close;
End;

Procedure TfrmExportaDadoTexto.Fundos;
Var
    sLinhaTexto    : TStringList;
    sTpMov, sCetip : Char;
Begin
   sLinhaTexto     := TStringList.Create;

   QryOperacaoFundos.Close;
   QryOperacaoFundos.ParamByName('DATAOPERACAOINI').AsDateTime := dDtIni.DateTime;
   QryOperacaoFundos.ParamByName('DATAOPERACAOFIM').AsDateTime := dDtFim.DateTime;
   QryOperacaoFundos.Open;

   frmAguarde.Pos := 0;
   frmAguarde.Max := QryOperacaoFundos.RecordCount;
   frmAguarde.Mostra('Aguarde, Processando ...');

   Try
      While Not QryOperacaoFundos.EOF Do
      Begin
         If QryOperacaoFundos.FieldByName('NATUREZAOPERACAO').AsString = 'A' Then
            sTpMov := '0'
         Else
            sTpMov := '1';

         If Trim(QryOperacaoFundos.FieldByName('CODFUNCETIP').AsString) = '' Then
            sCetip := '0'
         Else
            sCetip := '1';

         sLinhaTexto.Add(Alinha(Trim(rSequencial.Text),5,'D','0')+Alinha(' ',2,'D',' ')+sCetip+Alinha(' ',20,'D',' ')+
         Alinha(COPY(QryOperacaoFundos.FieldByName('DATAOPERACAO').AsString,7,4)+
                COPY(QryOperacaoFundos.FieldByName('DATAOPERACAO').AsString,4,2)+
                COPY(QryOperacaoFundos.FieldByName('DATAOPERACAO').AsString,1,2),8,'D',' ')+

         Alinha(COPY(QryOperacaoFundos.FieldByName('DATALIQUIDACAO').AsString,7,4)+
                COPY(QryOperacaoFundos.FieldByName('DATALIQUIDACAO').AsString,4,2)+
                COPY(QryOperacaoFundos.FieldByName('DATALIQUIDACAO').AsString,1,2),8,'D',' ')+

         Alinha(COPY(QryOperacaoFundos.FieldByName('DATACOTIZACAO').AsString,7,4)+
                COPY(QryOperacaoFundos.FieldByName('DATACOTIZACAO').AsString,4,2)+
                COPY(QryOperacaoFundos.FieldByName('DATACOTIZACAO').AsString,1,2),8,'D',' ')+
         sTpMov+
         Alinha(QryOperacaoFundos.FieldByName('IDGESTORCARTEIRA').AsString,11,'E',' ')+
         Alinha(Inteiro(QryOperacaoFundos.FieldByName('QTDOPERACAO').AsString),10,'D','0')+
         Alinha(Decimal(QryOperacaoFundos.FieldByName('QTDOPERACAO').AsString),8,'E','0')+
         Alinha(Inteiro(QryOperacaoFundos.FieldByName('VLRCOTA').AsString),10,'D','0')+
         Alinha(Decimal(QryOperacaoFundos.FieldByName('VLRCOTA').AsString),8,'E','0')+
         Alinha(Inteiro(QryOperacaoFundos.FieldByName('VLROPERACAO').AsString),10,'D','0')+
         Alinha(Decimal(QryOperacaoFundos.FieldByName('VLROPERACAO').AsString),8,'E','0'));

         frmAguarde.Pos    := frmAguarde.Pos    + 1;
         rSequencial.Value := rSequencial.Value + 1;
         QryOperacaoFundos.Next;
      End;

      If QryOperacaoFundos.RecordCount > 1 Then
         sLinhaTexto.SaveToFile(edtArquivo.Text);

      frmAguarde.Apaga;
      MsgDlg('Processo Concluído!','Mensagem do Sistema',MtInformation,[MbOk],0)
   Except
      frmAguarde.Apaga;
      MsgDlg('Não foi possível gravar o arquivo texto!','Mensagem do Sistema',MtInformation,[MbOk],0);
   End;
   QryOperacaoFundos.Close;
End;


procedure TfrmExportaDadoTexto.FormShow(Sender: TObject);
begin
  inherited;
   dDtIni.Date := Date;
   dDtFim.Date := Date;
   rgTipoInvestClick(Sender);
   rSequencial.Value := 1;
end;

procedure TfrmExportaDadoTexto.rgTipoInvestClick(Sender: TObject);
Var
   wDia, wMes, wAno : Word;
begin
  inherited;
   edtArquivo.Text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\';
   //edtArquivo.Text := 'C:\';
   //Jéssica Lana SOL 109421 KINTANA 496332

  If rgTipoInvest.ItemIndex = 0 Then
     edtArquivo.Text := edtArquivo.Text + 'BMF'
  Else If rgTipoInvest.ItemIndex = 1 Then
     edtArquivo.Text := edtArquivo.Text + 'FDO'
  Else If rgTipoInvest.ItemIndex = 2 Then
     edtArquivo.Text := edtArquivo.Text + 'RFIX'
  Else If rgTipoInvest.ItemIndex = 3 Then
     edtArquivo.Text := edtArquivo.Text + 'RVAR';

  If dDtIni.Date = dDtFim.Date Then
  Begin
     DecodeDate(dDtIni.Date, wAno, wMes, wDia);
     edtArquivo.Text := edtArquivo.Text + IntToStr(wDia)+IntToStr(wMes)+IntToStr(wAno);
  End;

  edtArquivo.Text := UpperCase(edtArquivo.Text)+'.TXT';  

end;

procedure TfrmExportaDadoTexto.dDtIniExit(Sender: TObject);
begin
  inherited;
  rgTipoInvestClick(Sender);
end;

procedure TfrmExportaDadoTexto.dDtFimExit(Sender: TObject);
begin
  inherited;
  rgTipoInvestClick(Sender);
end;

function TfrmExportaDadoTexto.Inteiro(Value : String) : String;
var
  i : Integer;
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1);
  Result:=Value;
end;

function TfrmExportaDadoTexto.Decimal(Value : String) : String;
var
  i : Integer;
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,iPosVirg+1,length(Value))
  Else
    Value := '0';
  Result:=Value;
end;

procedure TfrmExportaDadoTexto.FormCreate(Sender: TObject);
begin
  inherited;
   OpenDialog1.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Jéssica Lana SOL 109421 KINTANA 496332

end;

end.
