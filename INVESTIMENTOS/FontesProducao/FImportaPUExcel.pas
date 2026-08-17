// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
//------------------------------------------------------------------------------
//******************************************************************************
// Data      : 01/08/2006
// Código    : AL_2
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data   : 13/09/2004
// Código : AL_1
// Função : Controle do processo de abertura
//******************************************************************************

unit FImportaPUExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  Wwdatsrc, DBTables, Wwquery, wwdblook, ComCtrls, Mask, ComObj, 
  DBLookup, IvDictio, IvMulti, IvEMulti, OleCtnrs, wwdbdatetimepicker,
  CMDateTimePicker, uSistema;

type
  TFrmImportaPUExcel = class(TfrmOkCancelar)
    Label1: TLabel;
    edtArquivo: TEdit;
    SB1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    QryCotacoes: TwwQuery;
    DsCotacoes: TwwDataSource;
    QryAux: TwwQuery;
    DsAux: TwwDataSource;
    Label5: TLabel;
    edtPlanilha: TEdit;
    Label12: TLabel;
    Label14: TLabel;
    edtlinha: TEdit;
    grpColunas: TGroupBox;
    Label11: TLabel;
    Label6: TLabel;
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
    prgAndamento: TProgressBar;
    LbProcesso: TLabel;
    dteDataImportacao: TCMDateTimePicker;
    Label3: TLabel;
    edtCodAcao: TEdit;
    edtPU: TEdit;
    Label2: TLabel;
    edtDtVencimento: TEdit;
    QryParamFLGTPCOTACAO: TStringField;
    procedure SB1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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

var FrmImportaPUExcel: TFrmImportaPUExcel;

implementation

Uses UBibliotecaInvest, FImportaCotacoes, UMensErro, UOperacaoInvest,
     UOperComum, dOperComum, DBaseDados, UDiasUteisInv, URendaVariavel,
  dRendaVariavel, URendaFixa,
  //AL_2
  uCtrlInvContab;

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
procedure TFrmImportaPUExcel.SB1Click(Sender: TObject);
begin
  inherited;
  // Abre a Pesquisa e Testa Retorno
  If (OpenDialog1.Execute) Then Begin
    edtArquivo.Text := UpperCase(OpenDialog1.FileName);
  End;
end;

procedure TFrmImportaPUExcel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryParam.Close;
end;

procedure TFrmImportaPUExcel.bbtnConfirmarClick(Sender: TObject);
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  I          : Integer;
  wDecimal   : Char;
  fVlrPU     : Double;
  RegPU      : Record
                 dtVemcimento :String;
                 PU           :String;
               End;
  bReproc    : Boolean;
  Mensagem   : TMessageDlgTimer;
begin

   // AL_1 - Controle do processo de abertura de renda fixa
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then Exit;

   //AL_2
   if not CtrlInvContab.TestaPeriodo(dteDataImportacao.Text, 1) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dteDataImportacao.CanFocus then
         dteDataImportacao.SetFocus;
      Exit;
   end;

   wDecimal         := DecimalSeparator;
   DecimalSeparator := '.';
   bReproc          := False;

   // Critica Dados
   if (Trim(edtArquivo.Text) = '') or (Trim(edtPlanilha.Text) = '') or
      (Trim(edtlinha.Text) = '') or (Trim(edtCodAcao.Text) = '') or (Trim(edtPU.Text) = '') then
   begin
      MsgDlg('Existem Campos não Preenchidos', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
      Exit;
   end;

   if Trim(dteDataImportacao.Text) = '' then
   begin
      if MsgDlg('Data não Preenchida. Confirma importação em ' + DateToStr(Date),
                'Mensagem do Sistema', mtConfirmation, [MbYes, MbNo], 0) = mrNo then
      begin
         if dteDataImportacao.CanFocus then
            dteDataImportacao.SetFocus;
         Exit;
      end
      else
         dteDataImportacao.Date := Date;
   end;

   // Testa se Arquivo Especificado Existe
   if not (FileExists(edtArquivo.Text)) then
   begin
      MsgDlg('o Arquivo Informado Não Existe ou é Inválido', 'Mensagem do Sistema', mtWarning, [MbOk], 0);
      Exit;
   end;

   // Cria Objetos
   Mensagem:= TMessageDlgTimer.Create(Application);

   //------------------------------------------------------------------------------
   // Tenta Abrir o Arquivo e Importar as Cotacoes,
   // conseguindo ou não Fecha o Arquivo
   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         if pRPI.DATAULTFECHRF >= dteDataImportacao.DateTime then
            bReproc := True;

         // Conecta com o Excel
         ExcelApp:=IDispatch(ExcelApp);
         ExcelApp:=CreateOleObject('Excel.Application');
         if ChBxVisualiza.Checked then
            ExcelApp.Visible:=True
         else
            ExcelApp.Visible:=False;

         // Abre o Arquivo de importações
         ExcelApp.Workbooks.Open(EdtArquivo.Text,0);

         Sheet := ExcelApp.Workbooks[1].WorkSheets[edtPlanilha.Text];

         prgAndamento.Min  := 0;
         prgAndamento.Max  := Sheet.UsedRange.Rows.Count - StrToInt(edtlinha.Text) + 1;
         prgAndamento.Step := 1;
         prgAndamento.Position := 0;

         LbProcesso.Caption := 'Aguarde, Importando PUs.';
         LbProcesso.Repaint;

         // Pausa para Abrir a Planilha a Importacao
         Application.ProcessMessages;

         // Inicia Processamento
         for I:= StrToInt(edtlinha.Text) to (Sheet.UsedRange.Rows.Count) do
         begin
            // Preenche o Registro com  as Cotacoes
            RegPU.dtVemcimento := Trim(Sheet.Cells[I,VetorEnumerado[edtDtVencimento.Text[1]]]);
            RegPU.PU           := Trim(Sheet.Cells[I,VetorEnumerado[edtPU.Text[1]]]);

            // Acerta o Vencimento
            if Trim(RegPU.dtVemcimento) <> '' then
               RegPU.dtVemcimento := FormatDateTime('dd/mm/yyyy', StrToDate(RegPU.dtVemcimento));
            // Acerta o PU
            if (RegPU.PU = '') or (RegPU.PU = 'NA') then
               RegPU.PU := '0';

            // Trunca o Valor com no máximo 9 casas (Limitação do Banco)
            RegPU.PU := FormatFloat('#0.#########',StrToFloat(Trim(TrocaVirgulaPonto(RegPU.PU))));

            // Inicia Importação
            if RegPU.PU <> '0' then
            begin
               // Verifica Código Interno do Título
               if FazQuery(QryAux,
                    'SELECT IDINVESTIMENTO, DESCINVESTIMENTO ' +
                    'FROM INVESTIMENTO ' +
                    'WHERE IDTIPOINVEST = 1 ' +
                    '  AND CODISIN = '''+Trim(Sheet.Cells[ I, VetorEnumerado[edtCodAcao.Text[1]]])+'''') then
               begin
                  // Pesquisa se Cotacao Já Existe
                  if not FazQuery(QryCotacoes,
                     'SELECT IDINVESTIMENTO, VLRCOTACAO ' +
                     'FROM COTACAORENFIX '+
                     'WHERE DATACOTACAO  = TO_DATE(''' + dteDataImportacao.Text + ''',''DD/MM/YYYY'') '+
                     '  AND DATAVENCTO   = TO_DATE(''' + RegPU.dtVemcimento + ''',''DD/MM/YYYY'') '+
                     '  AND IDINVESTIMENTO = ' + QryAux.FieldByName('IDINVESTIMENTO').AsString) then
                  begin
                     // Caso não exista Tenta Inserir Registro no Arquivo de Cotacoes
                     if not ExecutaQuery(QryCotacoes,
                           'INSERT INTO COTACAORENFIX ' +
                           '(DATACOTACAO, IDINVESTIMENTO, DATAVENCTO, VLRCOTACAO) ' +
                           'VALUES ' +
                           '(TO_DATE('''+dteDataImportacao.Text+''','+'''DD/MM/YYYY''), '+
                             QryAux.FieldByName('IDINVESTIMENTO').AsString + ', '    +
                           'TO_DATE(''' + RegPU.dtVemcimento + ''',''DD/MM/YYYY''), '+
                           'NVL('+Trim(TrocaVirgulaPonto(RegPU.PU))+',0))') then
                        Raise Exception.Create('Não foi Possível Importar Cotação para este Título:' + #13 +
                                               QryAux.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                               'As Cotações não Foram Importadas.');

                     if bReproc then
                     begin
                        if RendaFixa.MarcaInvRep(dteDataImportacao.DateTime,
                                                 QryAux.FieldByName('IDINVESTIMENTO').AsInteger,-1,-1) = -1 then
                           Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento:' + #13 +
                                                  QryAux.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                                  'As Cotações não Foram Importadas.');
                     end;
                  end
                  else
                  begin
                     fVlrPU := qryCotacoes.FieldByName('VLRCOTACAO').AsFloat;
                     // Caso Exista Atualiza Cotacao
                     if (Trim(FloatToStr(fVlrPU)) <> Trim(TrocaVirgulaPonto(RegPU.PU)) ) then
                     begin
                        if not ExecutaQuery(QryCotacoes,
                             'UPDATE COTACAORENFIX '+
                             'SET '+
                             'VLRCOTACAO = NVL(' +Trim(TrocaVirgulaPonto(RegPU.PU)) +',0) ' +
                             'WHERE IDINVESTIMENTO = ' + QryAux.FieldByName('IDINVESTIMENTO').AsString + ' ' +
                             '  AND DATACOTACAO = TO_DATE('''+dteDataImportacao.Text+''',''DD/MM/YYYY'') '+
                             '  AND DATAVENCTO  = TO_DATE('''+RegPU.dtVemcimento+''',''DD/MM/YYYY'')') then
                           Raise Exception.Create('Não foi Possível Atualizar a Cotação para este Título:' + #13 +
                                                  QryAux.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                                  'As Cotações não Foram Importadas.');


                        if (bReproc) then
                        begin
                           if RendaFixa.MarcaInvRep(dteDataImportacao.DateTime,
                                                    QryAux.FieldByName('IDINVESTIMENTO').AsInteger,-1,-1) = -1 then
                              Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento:' + #13 +
                                                     QryAux.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                                     'As Cotaçõies não Foram Importadas.');
                        end;
                     end;
                  end;
               end;
            end;
            prgAndamento.Stepit;
         end;
         DecimalSeparator :=  wDecimal;

         // Heranca
         inherited;

         // Confirma as Importações
         DtmBaseDados.dbBaseDados.Commit;

         if wImportaAutomatico = False then
           MsgDlg('Importação Terminada !','Mensagem do Sistema',MtInformation,[MbOk],0)
         else
           bbtnSair.Click;

      except on E: Exception do
         begin
            dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema na Importação das Cotações:' + #13 +
                   E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      DecimalSeparator :=  wDecimal;
      QryAux.Close;
      QryCotacoes.Close;
      ExcelApp.Workbooks[1].Close(False);
      ExcelApp.Quit;

      LbProcesso.Caption := '';
      LbProcesso.Repaint;
      prgAndamento.Min  := 0;
      prgAndamento.Position := 0;
      prgAndamento.Max  := 0;
      prgAndamento.Step := 0;
      prgAndamento.Stepit;

      Mensagem.Free;
   end;
end;

procedure TFrmImportaPUExcel.FormCreate(Sender: TObject);
begin
  inherited;
   OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Jéssica Lana SOL 109421 KINTANA 496332

  LbProcesso.Caption := '';
  // Pega os parametros...
  QryParam.Open;
  if QryParam.Locate('FLGTPCOTACAO', 'P', []) then
  begin
     //  Preenche campos
     dteDataImportacao.DateTime := pRPI.DATAULTFECHRF + 1;
     edtArquivo.Text            := QryParam.FieldByName('CAMINHO').AsString;
     edtPlanilha.Text           := QryParam.FieldByName('NOMEPLANILHA').AsString;
     edtlinha.Text              := QryParam.FieldByName('PRIMEIRALINHA').AsString;
     edtCodAcao.Text            := QryParam.FieldByName('CODACAO').AsString;
     edtDtVencimento.Text       := QryParam.FieldByName('ABERTURA').AsString;
     edtPU.Text                 := QryParam.FieldByName('FECHAMENTO').AsString;
  end
  else
  begin
     dteDataImportacao.Date     := pRPI.DATAULTFECHRF + 1;
     edtArquivo.Text            := '';
     edtPlanilha.Text           := '';
     edtlinha.Text              := '';
     edtCodAcao.Text            := '';
     edtDtVencimento.Text       := '';
     edtPU.Text             := '';
  end;
end;

end.


