//Thiago Passos 21/09/2009 SOL124596 Kintana 633697
//******************************************************************************
// Rotina     : FormClose
// SOL        : 124596
// Kintana    : 633697
// Data       : 21/09/2009
// Responsável: Thiago Passos
// Descrição  : Correção do Erro Access Violation
//******************************************************************************
// Rotina     : RendaVariavel.SincronizacaCotacaoAcaoXCotacaoInvest,bbtnConfirmarClick
// SOL        : 122382
// Kintana    : 605342
// Data       : 21/08/2009
// Responsável: Thiago Passos
// Descrição  : Sincronização das Tabelas CotacaoAcao com CotacaoInvest
//******************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
// *****************************************************************************
// Rotina     : DbLkcBolsaExit
// SOL        : 97025
// Kintana    : 421094
// Data       : 29/09/2008
// Responsável: André L. Santos                   
// Descrição  : Acerto para manter o nome o caminho do arquivo de importação escolhido
//              pelo cliente.
//******************************************************************************
// Rotina     : bbtnConfirmarClick
// SOL        : 92822
// Kintana    : 389089
// Data       : 27/08/2008 
// Responsável: André Luiz
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************
// Data      : 12/06/2008
// Código    : AL_8
// Pendencia : 27565
// SOL       : 80638
// Desc      : Acerto para fazer a reimportação do arquivo de cotação.
//******************************************************************************
// Data      : 23/10/2007
// Código    : AL_7
// Pendencia : 26737
// Desc      : Melhoria na crítica de atualização da data do parâmetro após a
//              importação de cotações
//******************************************************************************
// Data      : 09/01/2007
// Código    : AL_6
// Desc      : Implementação da busca do próximo dia util após o ultimo fechamento,
//             como data de sugestão e importação automática.
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_5
// Desc      : Ajuste na tela, a mensagem a cima do progressBar não estava aparecendo.
//******************************************************************************
// Data      : 28/06/2006
// Código    : AL_4
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 06/03/2006
// Codigo   : AL_3
// Motivo   : Implementação da trava de processamento
//******************************************************************************
// Data     : 09/11/2005
// Codigo   : AL_2
// Motivo   : Retirada a chamada da rotina para alterar a data de fechamento
//******************************************************************************
// Data     : 28/07/2005
// Codigo   : AL_1
// Motivo   : Troca do qryAuxIDACAO pela variável iIdAcao
//******************************************************************************
// Data     : 14/07/2004
// Motivo   : Retirado o Owner CM. das qrys : QryBolsaValores
//******************************************************************************

unit FImportaCotacoesExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, wwdblook, ComCtrls, Mask, ComObj,
  DBLookup, IvDictio, IvMulti, IvEMulti, OleCtnrs, wwdbdatetimepicker,
  CMDateTimePicker, FOkCancelarInv, uCtrlPadroes, fcLabel, uSistema;

type
  TFrmImportaCotacoesExcel = class(TfrmOkCancelarInv)
    Label1: TLabel;
    edtArquivo: TEdit;
    SB1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    QryCotacoes: TwwQuery;
    DsCotacoes: TwwDataSource;
    QryAux: TwwQuery;
    DsAux: TwwDataSource;
    QryBolsaValores: TwwQuery;
    QryBolsaValoresSGLBOLSAVALORES: TStringField;
    QryBolsaValoresIDBOLSAVALORES: TFloatField;
    DsBolsaValores: TwwDataSource;
    Label2: TLabel;
    DbLkcBolsa: TwwDBLookupCombo;
    Label5: TLabel;
    edtPlanilha: TEdit;
    edtCodAcao: TEdit;
    edtAbert: TEdit;
    edtMax: TEdit;
    edtMin: TEdit;
    edtMedio: TEdit;
    edtVolume: TEdit;
    edtFecha: TEdit;
    Label12: TLabel;
    Label14: TLabel;
    edtlinha: TEdit;
    grpColunas: TGroupBox;
    Label13: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
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
    ChBxVisualiza: TCheckBox;
    QryUpdParamInvest: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    prgAndamento: TProgressBar;
    LbProcesso: TLabel;
    dteDataImportacao: TCMDateTimePicker;
    Label3: TLabel;
    procedure SB1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DbLkcBolsaExit(Sender: TObject);
    function AtualizaDataImportacao:boolean;
    procedure pnlFundoEnter(Sender: TObject);

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

var FrmImportaCotacoesExcel: TFrmImportaCotacoesExcel;

implementation

Uses UBibliotecaInvest, FImportaCotacoes, UMensErro, UOperacaoInvest,
     UOperComum, dOperComum, DBaseDados, UDiasUteisInv, URendaVariavel,
  dRendaVariavel,
  //AL_4
  uCtrlInvContab,
  //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
  uCtrlParamCotacaoRV;

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
// Busca Arquivo de Importação ..
procedure TFrmImportaCotacoesExcel.SB1Click(Sender: TObject);
begin
  inherited;
// Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
  End;
end;

procedure TFrmImportaCotacoesExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Fecha queries
  QryBolsaValores.Close;
  QryParam.Open;
//  FreeAndNil(CtrlInvContab); //Thiago Passos 21/09/2009 SOL124596 Kintana 633697
  Action := cafree;
  inherited;

end;

procedure TFrmImportaCotacoesExcel.bbtnConfirmarClick(Sender: TObject);
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  I,iIdAcao          : Integer;
  wDecimal   : Char;
  fVlrMedia  : Double;
  RegCotacoes:  Record
                   VlrAbertura  :String;
                   VlrFechamento:String;
                   VlrMaxima    :String;
                   VlrMinima    :String;
                   VlrMedia     :String;
                   VolNegociado :String;
                End;
  Comando :String;
  bReproc : Boolean;
  Mensagem:TMessageDlgTimer;
  //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
  CtrlParamCotacaoRV : TCtrlParamCotacaoRV;
  sCampo, sTipoCotacao  : String;
  sComparaRegCotacao  : String;
begin
   wDecimal         := DecimalSeparator;
   DecimalSeparator := '.';
   bReproc          := False;
   //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
   CtrlParamCotacaoRV := TCtrlParamCotacaoRV.Create;
   CtrlParamCotacaoRV.InitializeAs(Padroes);
   //AL_6
   if Trim(dteDataImportacao.Text) = '' then
      dteDataImportacao.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False);

   //AL_6
   // Critica Dados
   if (DbLkcBolsa.Text  = '') or (edtArquivo.Text = '') or (dteDataImportacao.Text = '') or
      (edtPlanilha.Text = '') or (edtlinha.Text = '') or (edtCodAcao.Text = '') or
      (edtAbert.Text = '') or (edtFecha.Text = '') or (edtMax.Text = '') or
      (edtMin.Text = '') or (edtMedio.Text = '') or (edtVolume.Text = '') then
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

   //AL_4
   if not CtrlInvContab.TestaPeriodo(dteDataImportacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
      Exit;
   end;

   // Cria Objetos
   Mensagem:= TMessageDlgTimer.Create(Application);

   //------------------------------------------------------------------------------
   // Tenta Abrir o Arquivo e Importar as Cotacoes,
   // conseguindo ou não Fecha o Arquivo
   try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      if pRPI.DATAULTFECH >= dteDataImportacao.DateTime then
         bReproc := True;

      // Conecta com o Excel
      ExcelApp:=IDispatch(ExcelApp);
      ExcelApp:=CreateOleObject('Excel.Application');
      if ChBxVisualiza.Checked then
         ExcelApp.Visible:=True
      else
         ExcelApp.Visible:=False;
      // Abre o arquivo
      // Se ATUALIZALINK = 'N', não atualiza senão atualiza
      if QryParam.FieldByName('ATUALIZALINK').AsString = 'N' then
        ExcelApp.Workbooks.Open(EdtArquivo.Text,0)
      else
        ExcelApp.Workbooks.Open(EdtArquivo.Text,3);

      // Está processando muito rápido e não dá tempo para a planilha se atualizar completamente
      //     portanto aguarda 3 segundos até terminar a atualização da planilha
      Sleep(3000);

      Sheet := ExcelApp.Workbooks[1].WorkSheets[edtPlanilha.Text];

      // Pausa para Abrir a Planilha a Importacao
      Application.ProcessMessages;

      prgAndamento.Min  := 0;
      prgAndamento.Max  := Sheet.UsedRange.Rows.Count;
      prgAndamento.Step := 1;

      LbProcesso.Caption := 'Aguarde, importando cotações.';
      LbProcesso.Repaint;

      // Inicia Processamento
      for I:= StrToInt(edtlinha.Text) to (Sheet.UsedRange.Rows.Count) do
      begin
         prgAndamento.Stepit;
         // Preenche o Registro com  as Cotacoes
         RegCotacoes.VlrAbertura   := Trim(Sheet.Cells[I,VetorEnumerado[edtAbert.Text[1]]]);
         RegCotacoes.VlrFechamento := Trim(Sheet.Cells[I,VetorEnumerado[edtFecha.Text[1]]]);
         RegCotacoes.VlrMaxima     := Trim(Sheet.Cells[I,VetorEnumerado[edtMax.Text[1]]]);
         RegCotacoes.VlrMinima     := Trim(Sheet.Cells[I,VetorEnumerado[edtMin.Text[1]]]);
         RegCotacoes.VlrMedia      := Trim(Sheet.Cells[I,VetorEnumerado[edtMedio.Text[1]]]);
         RegCotacoes.VolNegociado  := Trim(Sheet.Cells[I,VetorEnumerado[edtVolume.Text[1]]]);

         // Acerta as Cotacoes
         if (RegCotacoes.VlrAbertura   = '') or (RegCotacoes.VlrAbertura   = 'NA') then
            RegCotacoes.VlrAbertura   := '0';
         if (RegCotacoes.VlrFechamento = '') or (RegCotacoes.VlrFechamento = 'NA') then
            RegCotacoes.VlrFechamento := '0';
         if (RegCotacoes.VlrMaxima     = '') or (RegCotacoes.VlrMaxima     = 'NA') then
            RegCotacoes.VlrMaxima     := '0';
         if (RegCotacoes.VlrMinima     = '') or (RegCotacoes.VlrMinima     = 'NA') then
            RegCotacoes.VlrMinima     := '0';
         if (RegCotacoes.VlrMedia      = '') or (RegCotacoes.VlrMedia      = 'NA') Then
            RegCotacoes.VlrMedia      := '0';
         if (RegCotacoes.VolNegociado  = '') or (RegCotacoes.VolNegociado  = 'NA') then
            RegCotacoes.VolNegociado  := '0';

         //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
         sCampo := CtrlParamCotacaoRV.RetornaCotacaoVigente(dteDataImportacao.Date,sTipoCotacao);

         if sTipoCotacao = 'A' then
           sComparaRegCotacao :=  RegCotacoes.VlrAbertura
         else
         if sTipoCotacao = 'F' then
           sComparaRegCotacao :=  RegCotacoes.VlrFechamento
         else
         if sTipoCotacao = 'X' then
           sComparaRegCotacao :=  RegCotacoes.VlrMaxima
         else
         if sTipoCotacao = 'M' then
           sComparaRegCotacao :=  RegCotacoes.VlrMinima;
         //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
         if  sComparaRegCotacao  <> '0' then
         begin
            QryCotacoes.Close;

            if FazQuery(QryAux,
               'SELECT IDACAO,IDEMISSOR,QTDELOTE ' +
               'FROM ACOESXBOLSA '+
               'WHERE IDBOLSAVALORES = '''+
               QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
               '      SIGLAACAOBOLSA = '''+Trim(Sheet.Cells[ I, VetorEnumerado[edtCodAcao.Text[1]]])+'''') then
            begin
               //AL_1
               iIdAcao := QryAux.FieldByName('IDACAO').AsInteger;
               //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
               // Pesquisa se Cotacao Já Existe
               QryCotacoes.Close;
               if not FazQuery(QryCotacoes,
                  'SELECT IDACAO, '+sCampo+' as VLRMEDIA ' +
                  'FROM COTACAOACAO '+
                  'WHERE IDBOLSAVALORES = '''+
                  QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
                  '      DATACOTAACAO   = TO_DATE('''+dteDataImportacao.Text+''','+'''DD/MM/YYYY'') AND '+
                  '      IDACAO         = '''+IntToStr(iIdAcao)+'''') then
               begin
                  // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
                  Try
                  QryCotacoes.Close;
                    ExecutaQuery(QryCotacoes,
                      'INSERT INTO COTACAOACAO                                     '+
                      '(IDBOLSAVALORES, IDEMISSOR, QTDELOTE, DATACOTAACAO, IDACAO, '+
                      'VLRABERTURA, VLRFECHAMENTO, VLRMAXIMA, VLRMINIMA, '          +
                      'VLRMEDIA, VOLNEGOCIADO ) VALUES '                            +
                      '('''+QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''', '+
                      ''''+QryAux.FieldByName('IDEMISSOR').AsString+''', ' +
                      ''''+QryAux.FieldByName('QTDELOTE').AsString+''', '  +
                      'TO_DATE('''+dteDataImportacao.Text+''','+'''DD/MM/YYYY''), '+
                      ''''+IntToStr(iIdAcao)+''', '    +
                      'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrAbertura))  +',0), '+
                      'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrFechamento))+',0), '+
                      'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrMaxima))    +',0), '+
                      'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrMinima))    +',0), '+
                      'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VlrMedia))     +',0), '+
                      'NVL('+Trim(TrocaVirgulaPonto(RegCotacoes.VolNegociado)) +',0))');

                      if bReproc then
                      begin
                         with DMRendaVariavel do
                         begin
                            // Verifica se o Investimento possui Cotação, ou Operações no dia
                            OperComum.LimpaParametros(qryVerMarcaReproc);
                            //AL_1
                            qryVerMarcaReproc.ParamByName('IDINVESTIMENTO').AsInteger    := iIdAcao;
                            qryVerMarcaReproc.ParamByName('DATAINI').AsString            := dteDataImportacao.Text;
                            qryVerMarcaReproc.ParamByName('DATAFIM').AsString            := dteDataImportacao.Text;
                            qryVerMarcaReproc.Open;
                            if not qryVerMarcaReproc.IsEmpty then
                               //AL_1
                               RendaVariavel.MarcarFlagReproc(iIdAcao,
                                                              -1, -1, dteDataImportacao.DateTime);
                            qryVerMarcaReproc.Close;
                         end;
                      end;
                  Except
                     //AL_1
                     ShowMessage('Erro na inclusão de nova cotação !'+IntToStr(iIdAcao));
                     DtmBaseDados.dbBaseDados.Rollback;
                     Abort;
                  End;
               end
               else
               begin
                  //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
                  fVlrMedia := qryCotacoes.FieldByName('VLRMEDIA').AsFloat;
                  // Caso Exista Atualiza Cotacao
                  try
                  QryCotacoes.Close;
                     ExecutaQuery(QryCotacoes,
                       'UPDATE COTACAOACAO '+
                       'SET QTDELOTE  = ''' +QryAux.FieldByName('QTDELOTE').AsString+''', '+
                       'VLRABERTURA   = NVL(' +Trim(TrocaVirgulaPonto(RegCotacoes.VlrAbertura))   +',0), '+
                       'VLRFECHAMENTO = NVL(' +Trim(TrocaVirgulaPonto(RegCotacoes.VlrFechamento)) +',0), '+
                       'VLRMAXIMA     = NVL(' +Trim(TrocaVirgulaPonto(RegCotacoes.VlrMaxima))     +',0), '+
                       'VLRMINIMA     = NVL(' +Trim(TrocaVirgulaPonto(RegCotacoes.VlrMinima))     +',0), '+
                       'VLRMEDIA      = NVL(' +Trim(TrocaVirgulaPonto(RegCotacoes.VlrMedia))      +',0), '+
                       'VOLNEGOCIADO  = NVL(' +Trim(TrocaVirgulaPonto(RegCotacoes.VolNegociado))  +',0)'  +
                       'WHERE IDBOLSAVALORES = '''+
                         QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString+''' AND '+
                       '      DATACOTAACAO   = TO_DATE('''+dteDataImportacao.Text+''','+'''DD/MM/YYYY'') AND '+
                       //AL_1
                       '      IDACAO         = '''+IntToStr(iIdAcao)+'''');
                     //André Luiz - 27/08/2008 - N. Sol 92822 -  N. Kintana 389089
                     if (Trim(FloatToStr(fVlrMedia)) <> Trim(TrocaVirgulaPonto(sComparaRegCotacao))) and
                        (bReproc) then
                     begin
                        RendaVariavel.MarcarFlagReproc(iIdAcao,
                                                       -1, -1, dteDataImportacao.DateTime);
                     end;
                  except
                     ShowMessage('Erro na alteração !');
                     DtmBaseDados.dbBaseDados.Rollback;
                     Abort;
                  end;

               end;
               //AL_8
                    //SOL 122382 Kintana 605342 Thiago Passos - 21/08/2009
                   //Sincroniza Tabelas CotacaoAcao com CotacacaoInvest
                  if not RendaVariavel.SincronizacaCotacaoAcaoXCotacaoInvest(iIdAcao,dteDataImportacao.DateTime) then
                    begin
                      ShowMessage('Erro na Sincronizacao entre a CotacaoAcao com a CotacaoInvest !');
                      Abort;
                    end;

               if not bReproc then
                  AtualizaDataImportacao;
            end;
         end;
      end;
      DecimalSeparator :=  wDecimal;
      // Heranca
      inherited;

      // Fecha o Arquivo Independente do resultado da Operacao
      DtmBaseDados.dbBaseDados.Commit;
   finally
      DecimalSeparator :=  wDecimal;
      QryAux.Close;
      QryCotacoes.Close;
      ExcelApp.Workbooks[1].Close(False);
      ExcelApp.Quit;
      FreeAndNil(CtrlParamCotacaoRV);

   end;

   LbProcesso.Caption := '';
   LbProcesso.Repaint;
   prgAndamento.Min  := 0;
   prgAndamento.Max  := 0;
   prgAndamento.Step := 0;
   prgAndamento.Stepit;

   Mensagem.Free;

   if wImportaAutomatico = False then
     MsgDlg('Importação manual terminada !','Mensagem do Sistema',MtInformation,[MbOk],0)
   else
     bbtnSair.Click;

end;

function TFrmImportaCotacoesExcel.AtualizaDataImportacao:boolean;
begin
   //AL_7
   If (StrToDate(dteDataImportacao.Text) > pRPI.DATAULTFECH) or
      (StrToDate(dteDataImportacao.Text) > pRPI.DATAULTIMPCOT) Then
   begin
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;
         QryUpdParamInvest.Close;
         QryUpdParamInvest.ParamByName('DATAULTIMPCOT').AsDateTime := StrToDate(dteDataImportacao.Text);
         QryUpdParamInvest.ExecSQL;
         QryUpdParamInvest.Close;
         Result := True;
      except
         dtmBaseDados.dbBaseDados.Rollback;
         Result := False;
         MsgDlg('Não foi possivel atualizar a data de importação. Importação cancelada!','Mensagem do Sistema',MtError,[MbOk],0)
      end;
   end;
end;

procedure TFrmImportaCotacoesExcel.FormCreate(Sender: TObject);
begin
  inherited;
   //Jéssica Lana SOL 109421 KINTANA 496332
   OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Fim Jéssica
  QryBolsaValores.Open;
  // Pega os parametros...
  QryParam.Open;
  QryParam.First;

  //  Preenche campos
  DbLkcBolsa.LookupValue := QryParam.FieldByName('IDBOLSAVALORES').AsString;
  //AL_6
  dteDataImportacao.Date := DiasUteisInv.PrimeiroDiaUtilPosterior(pRPI.DATAULTFECH,-1,1,'',True,False,False);;
  edtArquivo.Text        := QryParam.FieldByName('CAMINHO').AsString;
  edtPlanilha.Text       := QryParam.FieldByName('NOMEPLANILHA').AsString;
  edtlinha.Text          := QryParam.FieldByName('PRIMEIRALINHA').AsString;
  edtCodAcao.Text        := QryParam.FieldByName('CODACAO').AsString;
  edtAbert.Text          := QryParam.FieldByName('ABERTURA').AsString;
  edtFecha.Text          := QryParam.FieldByName('FECHAMENTO').AsString;
  edtMax.Text            := QryParam.FieldByName('MAXIMA').AsString;
  edtMin.Text            := QryParam.FieldByName('MINIMA').AsString;
  edtMedio.Text          := QryParam.FieldByName('MEDIO').AsString;
  edtVolume.Text         := QryParam.FieldByName('VOLUME').AsString;
end;

procedure TFrmImportaCotacoesExcel.DbLkcBolsaExit(Sender: TObject);
begin
  inherited;
  QryParam.Locate('IDBOLSAVALORES',QryBolsaValores.FieldByName('IDBOLSAVALORES').AsString,[loCaseInsensitive]);
  //// Andre L. Santos SOL : 92477  Kintana    : 394862
  //edtArquivo.Text        := QryParam.FieldByName('CAMINHO').AsString;
  edtPlanilha.Text       := QryParam.FieldByName('NOMEPLANILHA').AsString;
  edtlinha.Text          := QryParam.FieldByName('PRIMEIRALINHA').AsString;
  edtCodAcao.Text        := QryParam.FieldByName('CODACAO').AsString;
  edtAbert.Text          := QryParam.FieldByName('ABERTURA').AsString;
  edtFecha.Text          := QryParam.FieldByName('FECHAMENTO').AsString;
  edtMax.Text            := QryParam.FieldByName('MAXIMA').AsString;
  edtMin.Text            := QryParam.FieldByName('MINIMA').AsString;
  edtMedio.Text          := QryParam.FieldByName('MEDIO').AsString;
  edtVolume.Text         := QryParam.FieldByName('VOLUME').AsString;
end;

procedure TFrmImportaCotacoesExcel.pnlFundoEnter(Sender: TObject);
begin
   inherited;
   // AL_3
   if RendaVariavel.VerEmAbertura then
   begin
      pnlFundo.Enabled := False;
      bbtnConfirmar.Enabled := False;
   end;

end;

end.


