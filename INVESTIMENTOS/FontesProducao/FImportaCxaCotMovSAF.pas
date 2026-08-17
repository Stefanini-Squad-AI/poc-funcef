// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------

unit FImportaCxaCotMovSAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, Buttons, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, fcLabel, ExtCtrls,
  Db, DBTables, Wwquery, wwdblook, Wwdatsrc, OleCtnrs, ComObj, ComCtrls,
  TREdit, uSistema;

type
  TFrmImportaCxCotMovSAF = class(TfrmOkCancelarInv)
    OpenDialog1: TOpenDialog;
    QryImportacao: TwwQuery;
    QryAux: TwwQuery;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    Panel2: TPanel;
    Label1: TLabel;
    edtArquivo: TEdit;
    SB1: TSpeedButton;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    DbLkcPatroPlano: TwwDBLookupCombo;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    DbLkcBolsa: TwwDBLookupCombo;
    Label2: TLabel;
    RdgTabelas: TRadioGroup;
    qryDetalhe: TwwQuery;
    updDetalhe: TUpdateSQL;
    dsDet: TwwDataSource;
    qryDetalheIDHISTCAIXA: TFloatField;
    qryDetalheIDCARTEIRAXEVENTO: TFloatField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalheDATAHISTCAIXA: TDateTimeField;
    qryDetalheVLRHISTCAIXA: TFloatField;
    qryDetalheSLDHISTCAIXA: TFloatField;
    qryDetalheTRGDTINCLUSAO: TDateTimeField;
    qryDetalheTRGUSERINCLUSAO: TStringField;
    qryDetalheIDOPERACAOINVEST: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDCARTEIRAGERENC: TFloatField;
    LblCaixaCota: TLabel;
    procedure SB1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ExcelApp, Sheet : Variant;
    function  IntegracaoHistCota        : Boolean;
    function  IntegracaoHistCaixa       : Boolean;
  public
    { Public declarations }
  end;

var
  FrmImportaCxCotMovSAF: TFrmImportaCxCotMovSAF;

implementation

uses UBibliotecaInvest, DBaseDados, UDataBase, UMensErro;

{$R *.DFM}

procedure TFrmImportaCxCotMovSAF.SB1Click(Sender: TObject);
begin
  inherited;
// Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
  End;
end;

function TFrmImportaCxCotMovSAF.IntegracaoHistCota : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         Data          : String;
                         Tipo          : String;
                         Codigo        : String;
                         Financeiro    : String;
                         SaldoCaixa    : String;
                         Carteira      : String;
                     End;
   I, iHistCaixa, iCarteiraInvest, iCarteiraGerenc, iOperacaoInvest,
   iCarteiraXEvento, iInvestimento, iTipoOperacao : Integer;

begin

   iCarteiraXEvento := 0;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   for I := 2 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      ProgressBar1.Stepit;
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.Data       := Trim(Sheet.Cells[I,VetorEnumerado['A']]);
      RegCotacoes.Tipo       := Trim(Sheet.Cells[I,VetorEnumerado['B']]);
      RegCotacoes.Codigo     := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.Financeiro := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.SaldoCaixa := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.Carteira   := Trim(Sheet.Cells[I,VetorEnumerado['I']]);

      // Acerta Operações
      if (RegCotacoes.Data  = '') or (RegCotacoes.Data   = 'NA') then
          RegCotacoes.Data := '';

      if (RegCotacoes.Tipo  = '') or (RegCotacoes.Tipo   = 'NA') then
          RegCotacoes.Tipo := '';

      if (RegCotacoes.Codigo       = '')  or (RegCotacoes.Codigo  = 'NA') then
          RegCotacoes.Codigo      := '';

      if (RegCotacoes.Financeiro  = '')  or (RegCotacoes.Financeiro  = 'NA') then
          RegCotacoes.Financeiro := '0';

      if (RegCotacoes.SaldoCaixa   = '')  or (RegCotacoes.SaldoCaixa   = 'NA') then
          RegCotacoes.SaldoCaixa  := '0';

      if (RegCotacoes.Carteira   = '')  or (RegCotacoes.Carteira   = 'NA') then
          RegCotacoes.Carteira   := '';

      if (RegCotacoes.Financeiro <> '0') And (RegCotacoes.Carteira <> '') And
         (RegCotacoes.Codigo <> '') then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try
            If UpperCase(RegCotacoes.Carteira) = 'ATIVA' Then
            Begin
               iCarteiraInvest := 1;
               iCarteiraGerenc := 10;
            End
            Else
            Begin
               iCarteiraInvest := 1;
               iCarteiraGerenc := 11;
            End;

            If UpperCase(RegCotacoes.Tipo) = 'COMPRA' Then
               iTipoOperacao := 1
            Else
               iTipoOperacao := 2;

            //deleta operações do dia
            ExecutaQuery(QryImportacao,'DELETE FROM HISTCAIXA WHERE     '+
             ' IDINVESTIMENTO     = '+IntToStr(iTipoOperacao)+'     AND '+
             ' IDCARTEIRAINVEST   = '+IntToStr(iCarteiraInvest)+'   AND '+
             ' IDCARTEIRAGERENC   = '+IntToStr(iCarteiraGerenc)+'   AND '+
             ' IDPLANPREVCTBPATR  = '+DbLkcPatroPlano.LookupValue+' AND '+
             ' DATAHISTCAIXA      = '+'TO_DATE('''+RegCotacoes.Data+''','+'''DD/MM/YYYY'')');

            //procura o investimento
            FazQuery(QryAux,
               'SELECT IDACAO ' +
               'FROM ACOESXBOLSA '+
               'WHERE IDBOLSAVALORES = '''+
                QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
               '      SIGLAACAOBOLSA = '''+RegCotacoes.Codigo+'''');
            iInvestimento := QryAux.FieldByName('IDACAO').AsInteger;

            //prepara o insert na Tabela de Operações
            iOperacaoInvest := LeUltRegistro(Nil,'OPERACAOINVEST');

            ExecutaQuery(QryImportacao,
              'INSERT INTO OPERACAOINVEST ('+
              'IDOPERACAOINVEST, IDCARTEIRAINVEST, IDCARTEIRAGERENC, '+
              'IDINVESTIMENTO, IDTIPOINVEST, IDTIPOOPERACAO, IDPLANPREVCTBPATR, '+
              'DATAOPERACAO, VLROPERACAO) VALUES '+
              '('+IntToStr(iOperacaoInvest)+', '+
              IntToStr(iCarteiraInvest)+', '+
              IntToStr(iCarteiraGerenc)+', '+
              IntToStr(iInvestimento)+', '+
              '2,'+IntToStr(iTipoOperacao)+', '+
              DbLkcPatroPlano.LookupValue+', '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.Data))+''','+'''DD/MM/YY''), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0))');

            iHistCaixa := LeUltRegistro(Nil,'HISTCAIXA');

            ExecutaQuery(QryImportacao,
              'INSERT INTO HISTCAIXA ('+
              'IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, DATAHISTCAIXA,'+
              'VLRHISTCAIXA, SLDHISTCAIXA, IDOPERACAOINVEST, IDCARTEIRAINVEST, '+
              'IDCARTEIRAGERENC) VALUES '+
              '('+IntToStr(iHistCaixa)+', '+
              IntToStr(iCarteiraXEvento)+', '+
              DbLkcPatroPlano.LookupValue+', '+
              'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.Data))+''','+'''DD/MM/YY''), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0), '+
              'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.SaldoCaixa))    +',0), '+
              IntToStr(iOperacaoInvest)+', '+
              IntToStr(iCarteiraInvest)+', '+
              IntToStr(iCarteiraGerenc)+') ');

         Except
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
   Result := True;
   QryImportacao.Close;
end;

function TFrmImportaCxCotMovSAF.IntegracaoHistCaixa : Boolean;
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  RegCotacoes     :  Record
                         Data          : String;
                         Tipo          : String;
                         Codigo        : String;
                         Financeiro    : String;
                         SaldoCaixa    : String;
                         Carteira      : String;
                     End;
   I, iHistCaixa, iCarteiraInvest, iCarteiraGerenc, iOperacaoInvest,
   iCarteiraXEvento, iInvestimento, iTipoOperacao : Integer;
   fSaldo : Double;
begin

   iCarteiraXEvento := 0;
   iOperacaoInvest  := 0;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   //deleta operações do dia
   ExecutaQuery(QryImportacao,'DELETE FROM HISTCAIXA');

   QryImportacao.Close;

   ExecutaQuery(QryImportacao,'DELETE FROM OPERACAOINVEST WHERE '+
                              '(IDCUSTODIANTE IS NULL) AND (QTDEOPERACAO IS NULL)');

   QryImportacao.Close;

   LblCaixaCota.Caption := '  Importando ...';
   LblCaixaCota.Repaint;

   for I := 1 to (Sheet.UsedRange.Rows.Count+1) do
   begin
      // Preenche o Registro com  as Cotacoes
      RegCotacoes.Data       := Trim(Sheet.Cells[I,VetorEnumerado['A']]);
      RegCotacoes.Tipo       := Trim(Sheet.Cells[I,VetorEnumerado['B']]);
      RegCotacoes.Codigo     := Trim(Sheet.Cells[I,VetorEnumerado['D']]);
      RegCotacoes.Financeiro := Trim(Sheet.Cells[I,VetorEnumerado['F']]);
      RegCotacoes.SaldoCaixa := Trim(Sheet.Cells[I,VetorEnumerado['G']]);
      RegCotacoes.Carteira   := Trim(Sheet.Cells[I,VetorEnumerado['I']]);

      // Acerta Operações
      if (RegCotacoes.Data        = '') or (RegCotacoes.Data         = 'NA') then
          RegCotacoes.Data       := '';

      if (RegCotacoes.Tipo        = '') or (RegCotacoes.Tipo         = 'NA') then
          RegCotacoes.Tipo       := '';

      if (RegCotacoes.Codigo      = '')  or (RegCotacoes.Codigo      = 'NA') then
          RegCotacoes.Codigo     := '';

      if (RegCotacoes.Financeiro  = '')  or (RegCotacoes.Financeiro  = 'NA') then
          RegCotacoes.Financeiro := '0';

      if (RegCotacoes.SaldoCaixa  = '')  or (RegCotacoes.SaldoCaixa  = 'NA') then
          RegCotacoes.SaldoCaixa := '0';

      if (RegCotacoes.Carteira    = '')  or (RegCotacoes.Carteira    = 'NA') then
          RegCotacoes.Carteira   := '';

      if (RegCotacoes.Financeiro <> '0') And (RegCotacoes.Carteira  <> '') then
      begin
         // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
         Try
            If UpperCase(RegCotacoes.Carteira) = 'ATIVA' Then
            Begin
               iCarteiraInvest := 1;
               iCarteiraGerenc := 10;
            End
            Else
            Begin
               iCarteiraInvest := 1;
               iCarteiraGerenc := 11;
            End;

            If UpperCase(RegCotacoes.Tipo)      = 'COMPRA' Then
               iTipoOperacao := 1
            Else If UpperCase(RegCotacoes.Tipo) = 'VENDA' Then
               iTipoOperacao := 2
            Else If UpperCase(RegCotacoes.Tipo) = 'DIVIDENDOS' Then
               iTipoOperacao := 5
            Else If UpperCase(RegCotacoes.Tipo) = 'SUBSCRIÇÃO' Then
               iTipoOperacao := 6
            Else If UpperCase(RegCotacoes.Tipo) = 'JUROS' Then
               iTipoOperacao := 8
            Else If UpperCase(RegCotacoes.Tipo) = 'TRANSFERÊNCIA ENTRADA' Then
               iTipoOperacao := 37
            Else If UpperCase(RegCotacoes.Tipo) = 'TRANSFERÊNCIA SAÍDA' Then
               iTipoOperacao := 38
            Else
               iTipoOperacao := 0;

            //procura o investimento
            If RegCotacoes.Codigo <> '' Then
            Begin
               FazQuery(QryAux,
                 'SELECT IDACAO ' +
                 'FROM ACOESXBOLSA '+
                 'WHERE IDBOLSAVALORES = '''+
                  QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
                 '      SIGLAACAOBOLSA = '''+RegCotacoes.Codigo+'''');
               iInvestimento := QryAux.FieldByName('IDACAO').AsInteger;
            End
            Else
               iInvestimento := -1;

            If iInvestimento <> 0 Then
            Begin
               //procura o evento
               If iTipoOperacao <> 0 Then
               Begin
                  FazQuery(QryAux,
                    'SELECT IDCARTEIRAXEVENTO '+
                    'FROM EVENTOCAIXACOTA EC, CARTEIRAXEVENTO CE '+
                    'WHERE IDTIPOOPERACAO = '+IntToStr(iTipoOperacao)+'   AND IDTIPOINVEST = 2 AND '+
                    'CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA(+)       AND '+
                    'IDCARTEIRAINVEST     = '+IntToStr(iCarteiraInvest)+' AND '+
                    'IDCARTEIRAGERENC     = '+IntToStr(iCarteiraGerenc));
                  iCarteiraXEvento   := QryAux.FieldByName('IDCARTEIRAXEVENTO').AsInteger;
                  QryAux.Close;
               End
               Else
               Begin
                  If RegCotacoes.Tipo = 'CPMF' Then
                  Begin
                     If (iCarteiraInvest  = 1) And (iCarteiraGerenc = 10) Then
                         iCarteiraXEvento:=74
                     Else
                         iCarteiraXEvento:=75;
                  End
                  Else If RegCotacoes.Tipo = 'FUTURO' Then
                  Begin
                     If (iCarteiraInvest  = 1) And (iCarteiraGerenc = 10) Then
                         iCarteiraXEvento:=78
                     Else
                         iCarteiraXEvento:=80;
                  End
                  Else If RegCotacoes.Tipo = 'REMUNERAÇÃO' Then
                  Begin
                     If (iCarteiraInvest  = 1) And (iCarteiraGerenc = 10) Then
                         iCarteiraXEvento:=76
                     Else
                         iCarteiraXEvento:=77;
                  End;
               End;

               If (iInvestimento <> -1) And (iTipoOperacao <> 10) Then
               Begin
                  //prepara o insert na Tabela de Operações
                  iOperacaoInvest := LeUltRegistro(Nil,'OPERACAOINVEST');

                  ExecutaQuery(QryImportacao,
                    'INSERT INTO OPERACAOINVEST ('+
                    'IDOPERACAOINVEST, IDCARTEIRAINVEST, IDCARTEIRAGERENC, '+
                    'IDINVESTIMENTO, IDTIPOINVEST, IDTIPOOPERACAO, IDPLANPREVCTBPATR, '+
                    'DATAOPERACAO, VLROPERACAO) VALUES '+
                    '('+IntToStr(iOperacaoInvest)+', '+
                    IntToStr(iCarteiraInvest)+', '+
                    IntToStr(iCarteiraGerenc)+', '+
                    IntToStr(iInvestimento)+', '+
                    '2,'+IntToStr(iTipoOperacao)+', '+
                    DbLkcPatroPlano.LookupValue+', '+
                    'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.Data))+''','+'''DD/MM/YY''), '+
                    'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0))');
                  QryImportacao.Close;
               End;

               iHistCaixa := LeUltRegistro(Nil,'HISTCAIXA');

               //prepara o insert na Tabela do Histórico de Caixa
               If iInvestimento <> -1 Then
               Begin
                  ExecutaQuery(QryImportacao,
                    'INSERT INTO HISTCAIXA ('+
                    'IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, DATAHISTCAIXA,'+
                    'VLRHISTCAIXA, SLDHISTCAIXA, IDOPERACAOINVEST, IDCARTEIRAINVEST, '+
                    'IDCARTEIRAGERENC) VALUES '+
                    '('+IntToStr(iHistCaixa)+', '+
                    IntToStr(iCarteiraXEvento)+', '+
                    DbLkcPatroPlano.LookupValue+', '+
                    'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.Data))+''','+'''DD/MM/YY''), '+
                    'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0), '+
                    'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.SaldoCaixa))    +',0), '+
                    IntToStr(iOperacaoInvest)+', '+
                    IntToStr(iCarteiraInvest)+', '+
                    IntToStr(iCarteiraGerenc)+') ');
               End
               Else
               Begin
                  ExecutaQuery(QryImportacao,
                    'INSERT INTO HISTCAIXA ('+
                    'IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, DATAHISTCAIXA,'+
                    'VLRHISTCAIXA, SLDHISTCAIXA, IDCARTEIRAINVEST, '+
                    'IDCARTEIRAGERENC) VALUES '+
                    '('+IntToStr(iHistCaixa)+', '+
                    IntToStr(iCarteiraXEvento)+', '+
                    DbLkcPatroPlano.LookupValue+', '+
                    'TO_DATE('''+Trim(TrocaVirgulaPonto(RegCotacoes.Data))+''','+'''DD/MM/YY''), '+
                    'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.Financeiro))    +',0), '+
                    'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.SaldoCaixa))    +',0), '+
                    IntToStr(iCarteiraInvest)+', '+
                    IntToStr(iCarteiraGerenc)+') ');
               End;

               QryImportacao.Close;
            End;
         Except
            LblCaixaCota.Caption := '';
            LblCaixaCota.Repaint;
            ShowMessage('Erro na nova inclusão !');
            DtmBaseDados.dbBaseDados.Rollback;
            QryImportacao.Close;
            Result := False;
            Exit;
         End;
      end;
      ProgressBar1.Stepit;
   End;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   qryDetalhe.Close;
   qryDetalhe.Open;

   LblCaixaCota.Caption := '  Corrigíndo o Saldo ...';
   LblCaixaCota.Repaint;

   ProgressBar1.Min  := 0;
   ProgressBar1.Max  := 0;
   ProgressBar1.Step := 0;
   ProgressBar1.Stepit;

   qryDetalhe.First;

   ProgressBar1.Min  := 0;
   ProgressBar1.Max  := qryDetalhe.RecordCount;
   ProgressBar1.Step := 1;

   fSaldo := 0;

   While Not qryDetalhe.EOF DO
   Begin
      fSaldo := fSaldo + qryDetalhe.FieldByName('VLRHISTCAIXA').AsFloat;
      qryDetalhe.Edit;
      qryDetalhe.FieldByName('SLDHISTCAIXA').AsFloat := fSaldo;
      qryDetalhe.Post;
      qryDetalhe.ApplyUpdates;
      qryDetalhe.Next;
      ProgressBar1.Stepit;      
   End;

   LblCaixaCota.Caption := '';
   LblCaixaCota.Repaint;

   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

   Result := True;
   qryDetalhe.Close;   
   QryImportacao.Close;
end;

procedure TFrmImportaCxCotMovSAF.bbtnConfirmarClick(Sender: TObject);
Var
  wDecimal   : Char;
  sNomeArq   : String;
begin
   wDecimal         := DecimalSeparator;
   DecimalSeparator := '.';
   // Critica Dados
   if (DbLkcBolsa.Text  = '') or (edtArquivo.Text = '') or (DbLkcPatroPlano.Text  = '') then
   begin
      ShowMessage('Faltam Preencher Campos ...');
      Exit;
   end;

   // Testa se Arquivo Especificado Existe
   if not (FileExists(edtArquivo.Text)) then
   begin
      ShowMessage('Arquivo não Existe ou Inválido ...');
      Exit;
   end;

   //------------------------------------------------------------------------------
   // Tenta Abrir o Arquivo e Importar as Cotacoes,
   // conseguindo ou não Fecha o Arquivo
   try
      // Conecta com o Excel
      ExcelApp:=IDispatch(ExcelApp);
      ExcelApp:=CreateOleObject('Excel.Application');
      ExcelApp.Visible:=False;

      // Abre o arquivo
      ExcelApp.Workbooks.Open(EdtArquivo.Text,3);

      sNomeArq := Copy(edtArquivo.Text,Length(edtArquivo.Text)-9, 6);

      // Inicia Processamento
      Sheet := ExcelApp.Workbooks[1].WorkSheets[sNomeArq];

      // Pausa para Abrir a Planilha a Importacao
      Application.ProcessMessages;

      ProgressBar1.Min  := 0;
      ProgressBar1.Max  := Sheet.UsedRange.Rows.Count;
      ProgressBar1.Step := 1;

      If RdgTabelas.ItemIndex = 0 Then      // Histórico de cotas
      Begin
         If Not IntegracaoHistCota Then
            Abort;
      End
      Else If RdgTabelas.ItemIndex = 1 Then // Histórico de caixa
      Begin
         If Not IntegracaoHistCaixa Then
            Abort;
      End;

      ProgressBar1.Min  := 0;
      ProgressBar1.Max  := 0;
      ProgressBar1.Step := 0;
      ProgressBar1.Stepit;

      DecimalSeparator :=  wDecimal;
      // Heranca
      inherited;
   finally
      DecimalSeparator :=  wDecimal;
      ExcelApp.Workbooks[1].Close(False);
      ExcelApp.Quit;
   end;

   MsgDlg('Importação manual terminada !','Mensagem do Sistema',MtInformation,[MbOk],0)

end;

procedure TFrmImportaCxCotMovSAF.FormShow(Sender: TObject);
begin
  inherited;
  QryBolsaValores.Open;
  QryPatroPlanPrevContab.Open;
  DbLkcBolsa.Text  := 'BOVESPA';
  QryBolsaValores.Locate('SGLBOLSAVALORES',DbLkcBolsa.Text,[loPartialKey]);
  edtArquivo.Text  :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //edtArquivo.Text  := 'C:\';
  //Jéssica Lana SOL 109421 KINTANA 496332


end;

procedure TFrmImportaCxCotMovSAF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryAux.Close;
  QryImportacao.Close;
  QryBolsaValores.Close;
end;

procedure TFrmImportaCxCotMovSAF.FormCreate(Sender: TObject);
begin
  inherited;
   OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Jéssica Lana SOL 109421 KINTANA 496332
end;

end.
