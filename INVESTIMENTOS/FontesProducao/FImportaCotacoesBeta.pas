unit FImportaCotacoesBeta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, wwdblook, ComCtrls, Mask, 
  DBLookup, IvDictio, IvMulti, IvEMulti, OleCtnrs, wwdbdatetimepicker,
  CMDateTimePicker, Udatabase;

type
  TFrmImportaCotacoesBeta = class(TfrmOkCancelar)
    QryCotacoes: TwwQuery;
    DsCotacoes: TwwDataSource;
    QryAux: TwwQuery;
    DsAux: TwwDataSource;
    Label3: TLabel;
    DateEdit1: TCMDateTimePicker;
    Label12: TLabel;
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
    QryUpdParamInvest: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    ProgressBar1: TProgressBar;
    LbProcesso: TLabel;
    QryParamIDPARAMIMPEXCEL: TFloatField;
    qryDelCotacoes: TwwQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    function AtualizaDataImportacao:boolean;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    ExcelApp, Sheet:Variant;
  public
    { Public declarations }
    wImportaAutomatico : Boolean;
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

      Property Duracao:Integer Read FDuracao Write SetDuracao;

  End;

var FrmImportaCotacoesBeta: TFrmImportaCotacoesBeta;

implementation

Uses UBibliotecaInvest, FImportaCotacoes, ComObj, UMensErro, UOperacaoInvest,
     UOperComum, dOperComum, DBaseDados, UDiasUteisInv;

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
//     FrmShowMessage.Free;
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

procedure TFrmImportaCotacoesBeta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Fecha queries
  QryParam.Open;
end;

procedure TFrmImportaCotacoesBeta.bbtnConfirmarClick(Sender: TObject);
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  I, ID      : Integer;
  wDecimal   : Char;
  VlrFechamento:String;
  Comando :String;

  Mensagem:TMessageDlgTimer;
begin
   QryParam.Open;
   QryParam.First;

   wDecimal         := DecimalSeparator;
   DecimalSeparator := '.';

   // Critica Data
   if Trim(DateEdit1.Text) = '' then
   begin
      ShowMessage('Faltam Preencher Data ...');
      Exit;
   end;

   // Testa se Arquivo Especificado Existe
   if not (FileExists(QryParamCAMINHO.AsString)) then
   begin
      ShowMessage('Arquivo não Existe ou Inválido: ' + #13 +
                  QryParamCAMINHO.AsString );
      Exit;
   end;

   // Verifica se a Data da operacao é menor ou Igual que a do Ultimo Fechamento
   if not VerificaFechamentoOperacao(DateEdit1.Text) then
      Exit;

   // Cria Objetos
   Mensagem:= TMessageDlgTimer.Create(Application);

   //------------------------------------------------------------------------------
   // Tenta Abrir o Arquivo e Importar as Cotacoes,
   // conseguindo ou não Fecha o Arquivo
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      Try
         ExecutaQuery(qryDelCotacoes,
           'DELETE FROM COTACAOBETA WHERE DATACOTACAO = '+
           'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'')');
      Except
         MsgDlg('Erro na exclusão de cotações.','Mensagem do Sistema',MtWarning,[MbOk],0);
         DtmBaseDados.dbBaseDados.Rollback;
         Abort;
      End;

      // Conecta com o Excel
      ExcelApp:=IDispatch(ExcelApp);
      ExcelApp:=CreateOleObject('Excel.Application');
      ExcelApp.Visible:=False;

      while not QryParam.Eof do
      begin
         // Abre a Planilha sem Atualizar os Links
         ExcelApp.Workbooks.Open(QryParamCAMINHO.AsString,0);
         // Carrega a Pasta de Trabalho na variável Sheet
         Sheet := ExcelApp.Workbooks[1].WorkSheets[QryParamNOMEPLANILHA.AsString];

         // Pausa para Abrir a Planilha a Importacao
         Application.ProcessMessages;

         ProgressBar1.Min  := 0;
         ProgressBar1.Max  := Sheet.UsedRange.Rows.Count;
         ProgressBar1.Step := 1;

         LbProcesso.Caption := 'Aguarde, Importando ' + QryParamNOMEPARAM.AsString;
         LbProcesso.Repaint;

         // Inicia Processamento
         for I:= StrToInt(QryParamPRIMEIRALINHA.AsString) to (Sheet.UsedRange.Rows.Count) do
         begin
            ProgressBar1.Stepit;

            if Trim(Sheet.Cells[I, VetorEnumerado[QryParamCODACAO.AsString[1]]]) = '' then
               Continue;

            // Preenche o Registro com  as Cotacoes
            VlrFechamento := Trim(Sheet.Cells[I,VetorEnumerado[QryParamFECHAMENTO.AsString[1]]]);

            // Acerta a Cotação
            if (VlrFechamento = '') or (VlrFechamento = 'NA') then
               VlrFechamento := '0';

            //if VlrFechamento <> '0' then
            //begin
               // Busca o IdInvestimento do Papel
               if FazQuery(QryAux,
                  'SELECT IDACAO,QTDELOTE ' +
                  'FROM ACOESXBOLSA '+
                  'WHERE SIGLAACAOBOLSA = '''+Trim(Sheet.Cells[I, VetorEnumerado[QryParamCODACAO.AsString[1]]])+'''') then
               begin
                  // Pesquisa se Cotacao Já Existe
                  if not FazQuery(QryCotacoes,
                     'SELECT IDCOTACAOBETA, IDINVESTIMENTO ' +
                     'FROM COTACAOBETA '+
                     'WHERE DATACOTACAO = TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY'') AND ' +
                     '      IDPARAMIMPEXCEL = ' + QryParamIDPARAMIMPEXCEL.AsString + ' AND ' +
                     '      IDINVESTIMENTO = ' + QryAux.FieldByName('IDACAO').AsString) then
                  begin
                     // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
                     Try
                       ID := LeUltRegistro(nil,'COTACAOBETA');
                       ExecutaQuery(QryCotacoes,
                         'INSERT INTO COTACAOBETA                                     '+
                         '(IDCOTACAOBETA, IDPARAMIMPEXCEL, IDINVESTIMENTO, DATACOTACAO, VLRBETA) VALUES '+
                         '(' + IntToStr(ID) + ', ' + QryParamIDPARAMIMPEXCEL.AsString + ', ' +
                         ''''+QryAux.FieldByName('IDACAO').AsString+''', '    +
                         'TO_DATE('''+DateEdit1.Text+''','+'''DD/MM/YYYY''), '+
                         'NVL('+Trim(TrocaVirgulaPonto(VlrFechamento))+',0))');

                         if not AtualizaDataImportacao then
                            Exception.Create('Não Consigo Atualizar a Data da Importação');
                     Except
                        ShowMessage('Erro na inclusão de nova cotação !'+QryAux.FieldBYName('IDACAO').AsString);
                        DtmBaseDados.dbBaseDados.Rollback;
                        Abort;
                     End;
                  end else begin
                     // Caso Exista Atualiza Cotacao
                     try
                        ExecutaQuery(QryCotacoes,
                          'UPDATE COTACAOBETA '+
                          'SET VLRBETA = NVL(' +Trim(TrocaVirgulaPonto(VlrFechamento)) +',0) '+
                          'WHERE IDCOTACAOBETA = '''+QryCotacoes.FieldByName('IDCOTACAOBETA').AsString+'''');

                          AtualizaDataImportacao;
                     except
                        ShowMessage('Erro na alteração !');
                        DtmBaseDados.dbBaseDados.Rollback;
                        Abort;
                     end;
                  end;
               end;
            //end;
         end;
         DecimalSeparator :=  wDecimal;
         QryParam.Next;
         ExcelApp.Workbooks[1].Close(False);
      end;
      // Heranca
      inherited;
      // Comita as cotações que conseguiu gravar
      DtmBaseDados.dbBaseDados.Commit;
   finally
      DecimalSeparator :=  wDecimal;
      QryAux.Close;
      QryCotacoes.Close;
      ExcelApp.Quit;
   end;

   LbProcesso.Caption := '';
   LbProcesso.Repaint;
   ProgressBar1.Min  := 0;
   ProgressBar1.Max  := 0;
   ProgressBar1.Step := 0;
   ProgressBar1.Stepit;

   Mensagem.Free;

   if wImportaAutomatico = False then
     MsgDlg('Importação manual terminada !','Mensagem do Sistema',MtInformation,[MbOk],0)
   else
     bbtnSair.Click;

end;

function TFrmImportaCotacoesBeta.AtualizaDataImportacao:boolean;
begin
   try
     if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;
     QryUpdParamInvest.Close;
     QryUpdParamInvest.ParamByName('DATAULTIMPCOT').AsDateTime := StrToDate(DateEdit1.Text);
     QryUpdParamInvest.ExecSQL;
     QryUpdParamInvest.Close;
     Result := True;
   except
     dtmBaseDados.dbBaseDados.Rollback;
     Result := False;
     MsgDlg('Não foi possivel atualizar a data de importação. Importação cancelada!','Mensagem do Sistema',MtError,[MbOk],0)
   end;
end;

procedure TFrmImportaCotacoesBeta.FormShow(Sender: TObject);
begin
  inherited;
  DateEdit1.DateTime := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False);
end;

end.


