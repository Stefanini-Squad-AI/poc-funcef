// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_1
//Pendencia :
//SOL       :
//Motivo(S) : Implementação da trava de fechamento de renda variavel
//*****************************************************************************

unit FImportaConciliacaoExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, wwdblook, ComCtrls, Mask,
  DBLookup, IvDictio, IvMulti, IvEMulti, OleCtnrs, wwdbdatetimepicker,
  CMDateTimePicker, TB97Ctls, uSistema;

type
  TFrmImportaConciliacaoExcel = class(TfrmOkCancelar)
    Label1: TLabel;
    edtArquivo: TEdit;
    SB1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    DsCotacoes: TwwDataSource;
    QryAux: TwwQuery;
    DsAux: TwwDataSource;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    DsBolsaValores: TwwDataSource;
    Label3: TLabel;
    DateEdit1: TCMDateTimePicker;
    Label5: TLabel;
    edtPlanilha: TEdit;
    edtCodAcao: TEdit;
    edtFecha: TEdit;
    Label12: TLabel;
    Label14: TLabel;
    edtlinha: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    QryParam: TwwQuery;
    QryParamIDBOLSAVALORES: TFloatField;
    QryParamNOMEPARAM: TStringField;
    QryParamATUALIZALINK: TStringField;
    QryParamHORA: TStringField;
    QryParamPERIODICIDADE: TStringField;
    QryParamDTCOTACAO: TDateTimeField;
    QryParamNOMEPLANILHA: TStringField;
    QryParamPRIMEIRALINHA: TFloatField;
    QryParamCODACAO: TStringField;
    QryParamABERTURA: TStringField;
    QryParamCAMINHO: TStringField;
    QryParamFECHAMENTO: TStringField;
    QryParamMAXIMA: TStringField;
    QryParamMINIMA: TStringField;
    QryParamMEDIO: TStringField;
    QryParamVOLUME: TStringField;
    QryCotacoes: TwwQuery;
    ProgressBar1: TProgressBar;
    QryVerificaISIN: TwwQuery;
    LbProcesso: TLabel;
    Label2: TLabel;
    DbLkcBolsa: TwwDBLookupCombo;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnConiliacao: TToolbarButton97;
    procedure SB1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DbLkcBolsaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnConiliacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     ExcelApp, Sheet:Variant;
  public
    { Public declarations }
    wImportaAutomatico : Boolean;    
    function VerificaISIN(CodISIN : String) : Boolean;
  end;


//******************************************************************************
// DECLARACAO DE OBJETOS E COMPONENTES

// DialogBox com Duracao para fechar.
  TMessageDlgTimer=Class(TComponent)
    Private
// Variaveis Privadas
      FrmShowMessage:TForm;
      FDuracao:Integer;
      Timer:TTimer;
      Inicio:TTime;
    Public
// Procedimentos Publicos
      Procedure Mostrar(Titulo, Mensagem:String;Duracao:Integer);
      Procedure Fechar;
      Procedure MessageDlgTimer(Sender: TObject);

      Procedure SetDuracao(iDuracao:Integer);

      Property  Duracao:Integer Read FDuracao Write SetDuracao;

  End;

var FrmImportaConciliacaoExcel: TFrmImportaConciliacaoExcel;

implementation

Uses UBibliotecaInvest, FImportaCotacoes, ComObj, UMensErro, UOperacaoInvest, UOperComum,
     dOperComum, UDataBase, dBaseDados, FConciliaCustodia, FTelaAut,
  URendaVariavel;

{$R *.DFM}

//******************************************************************************
// PROCEDIMENTOS DO OBJETO DA MENSAGEM DE DIALOGO

// Cria e Mostra o Objeto
Procedure TMessageDlgTimer.Mostrar(Titulo, Mensagem:String;Duracao:Integer);
Begin
// Cria Objetos Locais
  Timer := TTimer.Create(Nil);

// Cria Caixa de Dialogo propria
  FrmShowMessage := CreateMessageDialog(Mensagem,  mtInformation,  [mbOK]);
  FrmShowMessage.Caption := Titulo;

// Guarda o Inicio e Dispara o Timer
  Inicio :=  Time;

// Parametriza o Timer
  Timer.Interval := 4000;
  Timer.OnTimer  := MessageDlgTimer;
  Timer.Enabled  :=True;

  SetDuracao(Duracao);

// mostra Caixa de Dialogo
  FrmShowMessage.ShowModal;
End;

// Metodo de Fechar o Componente
Procedure TMessageDlgTimer.Fechar;
Begin
  FDuracao :=0;
  MessageDlgTimer(Self);
End;

//------------------------------------------------------------------------------
// Tempo do Objeto
Procedure TMessageDlgTimer.MessageDlgTimer(Sender: TObject);
Begin

// FrmShowMessage.caption := FormatDateTime('NN:SS', Time - Inicio );

// Caso caixa não tenha sido Fechada, Fecha Libera
 If ( StrToInt(FormatDateTime('NN', Time - Inicio )) >= FDuracao ) Then Begin
   Try
// Fecha o DialogBox
     FrmShowMessage.Close;
// Desliga Timer
     Timer.OnTimer := Nil;
     Timer.Enabled :=False;
   Finally
   End;
 End;

End;

Procedure TMessageDlgTimer.SetDuracao(iDuracao:Integer);
Begin
  If iDuracao > 60 Then Begin
    iDuracao  := 60;
  End;
  FDuracao := iDuracao;
End;

// FIM DOS PROCEDIMENTOS
//******************************************************************************

//------------------------------------------------------
// Busca Arquivo de Importação ..
procedure TFrmImportaConciliacaoExcel.SB1Click(Sender: TObject);
begin
  inherited;
// Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
  End;
end;

procedure TFrmImportaConciliacaoExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Fecha queries
  QryBolsaValores.Close;
  QryParam.Open;
end;

procedure TFrmImportaConciliacaoExcel.bbtnConfirmarClick(Sender: TObject);
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  I          : Integer;
  wDecimal   : Char;
  RegCotacoes:  Record
                   CodISIN      :String;
                   VlrAbertura  :String;
                   VlrFechamento:String;
                   VlrMaxima    :String;
                   VlrMinima    :String;
                   VlrMedia     :String;
                   VolNegociado :String;
                End;
  Comando :String;

  Mensagem:TMessageDlgTimer;
begin
   // AL_1
   if RendaVariavel.VerEmAbertura then
      Exit;

   wDecimal         := DecimalSeparator;
   DecimalSeparator := '.';
// Critica Dados
  If (edtArquivo.Text = '') Or (edtPlanilha.Text = '') Or
     (edtlinha.Text = '')   Or (edtCodAcao.Text = '')  Or (edtFecha.Text = '') Then
  Begin
     ShowMessage('Faltam Preencher Campos ...');
     Exit;
  End;

  If Trim(DateEdit1.Text) = '' Then
    DateEdit1.Date := Date;

// Testa se Arquivo Especificado Existe
  If Not (FileExists(edtArquivo.Text)) Then Begin
    ShowMessage('Arquivo não Existe ou Inválido ...');
    Exit;
  End;

// Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento

// Cria Objetos
  Mensagem:= TMessageDlgTimer.Create(Application);

//------------------------------------------------------------------------------
// Tenta Abrir o Arquivo e Importar as Cotacoes,
// conseguindo ou não Fecha o Arquivo
  Try
    LbProcesso.Visible:= True;
    LbProcesso.Caption:='Conectando com o Excell.';
// Conecta com o Excel
    ExcelApp:=IDispatch(ExcelApp);
    ExcelApp:=CreateOleObject('Excel.Application');

// Abre o arquivo
// Se ATUALIZALINK = 'N', não atualiza senão atualiza
    If QryParam.FieldByName('ATUALIZALINK').AsString = 'N' Then
      ExcelApp.Workbooks.Open(EdtArquivo.Text,0)
    Else
      ExcelApp.Workbooks.Open(EdtArquivo.Text,3);

    LbProcesso.Caption:='Importar dados do EXCEL, Aguarde!';

    Sheet := ExcelApp.Workbooks[1].WorkSheets[edtPlanilha.Text];

// Pausa para Abrir a Planilha a Importacao
    Application.ProcessMessages;

    ProgressBar1.Min  := 0;
    ProgressBar1.Max  := Sheet.UsedRange.Rows.Count-StrToInt(edtlinha.Text);
    ProgressBar1.Step := 1;

    QryCotacoes.Close;
    QryCotacoes.ParamByName('DATAREFERENCIA').AsDateTime := StrToDate(DateEdit1.Text);
    QryCotacoes.Open;
    If Not QryCotacoes.Eof Then
    Begin
       Try
// Executa Query
          ExecutaQuery(QryAux,
            'DELETE FROM CONCILIACUSTODIA '+
            'WHERE '+
            'DATAREFERENCIA   = TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');
       Except
// Trata Erro
          ShowMessage('Erro na deleção da importação para esse dia!');
          Exit;
       End;
    End;

// Inicia Processamento
    For I:= StrToInt(edtlinha.Text) To (Sheet.UsedRange.Rows.Count) Do
    Begin
       ProgressBar1.Stepit;
// Preenche o Registro com  as Cotacoes
       RegCotacoes.CodISIN       := Trim(Sheet.Cells[I,VetorEnumerado[edtCodAcao.Text[1]]]);
       RegCotacoes.VlrFechamento := Trim(Sheet.Cells[I,VetorEnumerado[edtFecha.Text[1]]]);
       If Length(RegCotacoes.CodISIN) = 0 Then
          Break;
// Acerta as Cotacoes
       If (RegCotacoes.VlrFechamento = '') or (RegCotacoes.VlrFechamento = 'NA') Then
           RegCotacoes.VlrFechamento := '0';

// Pesquisa se Cotacao Já Existe
       If (Trim(RegCotacoes.CodISIN) <> '') Then
       Begin
// Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
          Try
            ExecutaQuery(QryAux,
             'INSERT INTO CONCILIACUSTODIA '+
             '(IDCONCILIACUSTODIA, DATAREFERENCIA, CODISIN, QTDTITULOS) VALUES ('+
             ''''+ FloatToStr(LeUltRegistro(Nil,'CONCILIACUSTODIA'))+''', '+
             'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
             ''''+Trim(RegCotacoes.CodISIN)+''', '+
             'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrFechamento))+',0))');
          Except
// Trata Erro
            ShowMessage('Erro na inclusão da Conciliação Automática !'+QryCotacoes.FieldBYName('CODISIN').AsString);
            Exit;
          End;
       End;
    End;
    DecimalSeparator :=  wDecimal;

// Heranca
    inherited;

// Fecha o Arquivo Independente do resultado da Operacao
  Finally
    ExcelApp.Workbooks[1].Close(False);
    ExcelApp.Quit;
  End;

  ProgressBar1.Min  := 0;
  ProgressBar1.Max  := 0;
  ProgressBar1.Step := 0;

  LbProcesso.Visible   := False;
  If wImportaAutomatico = False Then
    MsgDlg('Importação Terminada !','Mensagem do Sistema',MtInformation,[MbOk],0)
  Else Begin
    Mensagem.Mostrar('Mensagem do Sistema','Importação Terminada !!',1);
    Close;
  End;

// Libera Objetos
  Mensagem.Free;
end;

function TFrmImportaConciliacaoExcel.VerificaISIN(CodISIN : String) : Boolean;
begin
   QryVerificaISIN.Close;
   QryVerificaISIN.ParamByName('CODISIN').AsString := CodISIN;
   QryVerificaISIN.Open;
   If QryVerificaISIN.Eof Then
      Result := False
   Else
      Result := True;
   QryVerificaISIN.Close;      
end;

procedure TFrmImportaConciliacaoExcel.DbLkcBolsaExit(Sender: TObject);
begin
  inherited;
  // Pega os parametros...
  QryParam.Close;
  QryParam.ParamByName('IDBOLSAVALORES').AsInteger :=
           QryBolsaValores.FieldByName('IDBOLSAVALORES').AsInteger;
  QryParam.Open;
  DateEdit1.Date         := NOW;
  edtArquivo.Text        := QryParam.FieldByName('CAMINHO').AsString;
  edtPlanilha.Text       := QryParam.FieldByName('NOMEPLANILHA').AsString;
  edtlinha.Text          := QryParam.FieldByName('PRIMEIRALINHA').AsString;
  edtCodAcao.Text        := QryParam.FieldByName('CODACAO').AsString;
  edtFecha.Text          := QryParam.FieldByName('FECHAMENTO').AsString;  
end;

procedure TFrmImportaConciliacaoExcel.FormShow(Sender: TObject);
begin
  inherited;
   QryBolsaValores.Open;
end;

procedure TFrmImportaConciliacaoExcel.sbtnConiliacaoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(FrmConciliaCustodia, TFrmConciliaCustodia, False);
   If DateEdit1.Text <> '' Then
      FrmConciliaCustodia.edData.Date := DateEdit1.Date
   Else
      FrmConciliaCustodia.edData.Date := Date;
   FrmConciliaCustodia.bbtnConfirmar.Click;
end;

procedure TFrmImportaConciliacaoExcel.FormCreate(Sender: TObject);
begin
  inherited;
  OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Jéssica Lana SOL 109421 KINTANA 496332

end;

end.


