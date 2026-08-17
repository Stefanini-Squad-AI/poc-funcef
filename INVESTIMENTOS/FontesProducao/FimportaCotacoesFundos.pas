// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  19/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
//------------------------------------------------------------------------------
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_11
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_10
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 17/05/2006
// Código    : AL_9
// Pendencia : 22379
// Motivo    : Implementação de startar a transação somento qdo inserir ou alterar
//             uma cota, fazendo o commit por registro.
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_8
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data      : 05/01/2005
// Código    : AL_7
// Motivo    : Alterado o posicionamento do Teste do período Contábil para o momento da gravação
//******************************************************************************
// Data      : 05/01/2005
// Código    : AL_6
// SOL       : 39526
// Motivo    : Implementação do tratamento do reprocessamento especifico para fundos imóbiliarios e
//             tratamento especifico para os outros fundos
//*******************************************************************************************
// Data     : 08/09/2005
// Linha(s) : AL_5
// Motivo   : Inicialização da data de controle de reprocessamento
//*******************************************************************************************
// Data     : 01/09/2005
// Linha(s) : AL_4
// Motivo   : Implementãção para reprocessar apenas a menor data do fundo
//*******************************************************************************************
// Data     : 25/05/2005
// Linha(s) : AL_3
// Motivo   : Implementação do teste de período contabil em 3 camadas
//*******************************************************************************************
// Data     : 17/03/2005
// Linha(s) : Alt_2
// Motivo   : Alteração incluindo o filtro pela variável idfundoinvest ao inves da query
//            alguma hora esta perdendo o conteudo da variável
//*******************************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvest e na funcao Reprocessamento
//*******************************************************************************************
//Data	 : 07/04/2004
//Função	 : bbtnConfirmarClick : Implementado a busca do Fundo pelo CNPJ primeiramente na
//                         tabela HISTFUNDOINVEST e caso não seja encontrado, busca na FUNDOINVEST
//Linha          : 217
//*******************************************************************************************

Unit FimportaCotacoesFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, ComObj, USistema, uCtrlInvContab,
  faMensagem;

type
  TFrmImportaCotacoesFundos = class(TfrmOkCancelarInv)
    Label3: TLabel;
    lblArquivo: TLabel;
    edtArquivo: TEdit;
    qryFundoInvest: TwwQuery;
    qryFundoInvestIDFUNDOINVEST: TFloatField;
    qryFundoInvestDESCFUNDOINVEST: TStringField;
    qryFundoInvestCNPJFUNDO: TStringField;
    SB1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    QryInsCotaFundo: TwwQuery;
    QryUpdCotaFundo: TwwQuery;
    qryUpdParamInvest: TwwQuery;
    qryBuscaCotaFundo: TwwQuery;
    qryBuscaCotaFundoVLRCOTA: TFloatField;
    Label14: TLabel;
    edtLinha: TEdit;
    lblNomFdo: TLabel;
    edtNomFdo: TEdit;
    lblData: TLabel;
    edtData: TEdit;
    lblCota: TLabel;
    edtCota: TEdit;
    lblCNPJ: TLabel;
    edtCNPJ: TEdit;
    Bevel1: TBevel;
    Label1: TLabel;
    QryTipoFundoInvest: TwwQuery;
    qryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    lblNomPlanilha: TLabel;
    edtNomPlanilha: TEdit;
    qryHistFundoInvest: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    qryFundoInvestDTAINIPROC: TDateTimeField;
    fraMensProc: TfraMensagem;
    procedure SB1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ExcelApp, Sheet:Variant;
    function ValidaCampos:boolean;
    function ExisteCotaFundo(iFundoInvest:Integer;dDataCota:String):boolean;
  public
    { Public declarations }
  end;

  TMessageDlgTimer=Class(TComponent)
    Private
      FrmShowMessage:TForm;
      FDuracao:Integer;
      Timer:TTimer;
      Inicio:TTime;
    Public
      Procedure Mostrar(Titulo, Mensagem:String;Duracao:Integer);
      Procedure Fechar;
      Procedure MessageDlgTimer(Sender: TObject);
      Procedure SetDuracao(iDuracao:Integer);
      Property Duracao:Integer Read FDuracao Write SetDuracao;
  end;

var
  FrmImportaCotacoesFundos: TFrmImportaCotacoesFundos;

implementation

uses UDiasUteisInv, UOperComum, UBibliotecaInvest, fAguarde, DBaseDados, UDataBase, UMensErro,
     UFundoComum;

{$R *.DFM}

procedure TMessageDlgTimer.Mostrar(Titulo, Mensagem:String;Duracao:Integer);
begin
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
end;

procedure TMessageDlgTimer.Fechar;
begin
   FDuracao :=0;
   MessageDlgTimer(Self);
end;

// Tempo do Objeto
procedure TMessageDlgTimer.MessageDlgTimer(Sender: TObject);
begin
   // Caso caixa não tenha sido Fechada, Fecha Libera
   if ( StrToInt(FormatDateTime('NN', Time - Inicio )) >= FDuracao ) then
   begin
      try
         // Fecha o DialogBox
         FrmShowMessage.Close;
         // Desliga Timer
         Timer.OnTimer := Nil;
         Timer.Enabled :=False;
      finally
      end;
   end;
end;

procedure TMessageDlgTimer.SetDuracao(iDuracao:Integer);
begin
   if iDuracao > 60 then
     iDuracao  := 60;
   FDuracao := iDuracao;
end;

procedure TFrmImportaCotacoesFundos.SB1Click(Sender: TObject);
begin
  inherited;
  If (OpenDialog1.Execute) Then
      edtArquivo.Text := UpperCase(OpenDialog1.FileName);
end;

procedure TFrmImportaCotacoesFundos.bbtnConfirmarClick(Sender: TObject);
Const
  VetorEnumerado  : Array['A'..'Z'] Of Integer = (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26);
Var
  I , iIdFundoInvest : Integer;
  wDecimal   : Char;
  RegCotaFdo : Record
                   Data : String;
                   Cota : String;
                   CNPJ : String;
                   NomeFdo : String;
               End;
  sPlanilha  : String;

  Mensagem   : TMessageDlgTimer;
  fVlrCota   : string;

  dDataIniReproc, dDtaIniProc: TDateTime;
begin
   // AL_3 - Inicio
   // Tenta Abrir o Arquivo e Importar as Cotacoes e conseguindo ou não Fecha o Arquivo
   try
      wDecimal         := DecimalSeparator;

      if not ValidaCampos then
         Exit;

      // Cria Objetos
      Mensagem := TMessageDlgTimer.Create(Application);

      // Conecta com o Excel
      ExcelApp := IDispatch(ExcelApp);
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := False;
      // Abre o arquivo
      ExcelApp.Workbooks.Open(edtArquivo.Text,0);
      sPlanilha := edtNomPlanilha.Text;
      Sheet     := ExcelApp.Workbooks[1].WorkSheets[sPlanilha];

      // Pausa para Abrir a Planilha a Importacao
      Application.ProcessMessages;

      // Inicia Processamento
      Try
         fraMensProc.Mostra;
         fraMensProc.Pos := 0;
         fraMensProc.Max := Sheet.UsedRange.Rows.Count - StrToInt(edtlinha.Text);

         //AL_5 - 08/09/2005
         dDataIniReproc  := Date;

         for I := StrToInt(edtlinha.Text) to (Sheet.UsedRange.Rows.Count) do
         begin
            // Preenche o Registro com  as Cotacoes
            RegCotaFdo.Data    := Trim(Sheet.Cells[I,VetorEnumerado[edtData.Text[1]]]);
            RegCotaFdo.Cota    := Trim(Sheet.Cells[I,VetorEnumerado[edtCota.Text[1]]]);
            RegCotaFdo.CNPJ    := Trim(Sheet.Cells[I,VetorEnumerado[edtCNPJ.Text[1]]]);
            RegCotaFdo.NomeFdo := Trim(Sheet.Cells[I,VetorEnumerado[edtNomFdo.Text[1]]]);

            //AL_4 - 01/09/2005
            if ((Trim(RegCotaFdo.Data) <> '') and (dDataIniReproc > StrToDate(RegCotaFdo.Data))) then
               dDataIniReproc  := StrToDate(RegCotaFdo.Data);

            fraMensProc.Mes    := RegCotaFdo.NomeFdo;

            if ((Trim(RegCotaFdo.CNPJ) <> '') and (Trim(RegCotaFdo.NomeFdo) <> '') and
                (Trim(RegCotaFdo.Data) <> '') and (Trim(RegCotaFdo.Cota)    <> '')) then
            begin

               //AL_9 - 17/05/2006

               if (RegCotaFdo.Cota <> '0') then
               begin
                  iIdFundoInvest := 0;
                  OperComum.LimpaParametros(qryHistFundoInvest);
                  qryHistFundoInvest.ParamByName('CNPJFUNDO').AsString :=  RegCotaFdo.CNPJ;
                  qryHistFundoInvest.Open;
                  if not qryHistFundoInvest.IsEmpty then
                  begin
                     iIdFundoInvest := qryHistFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
                  end
                  else
                  begin
                     OperComum.LimpaParametros(qryFundoInvest);
                     qryFundoInvest.ParamByName('CNPJFUNDO').AsString :=  RegCotaFdo.CNPJ;
                     qryFundoInvest.Open;
                     if not qryFundoInvest.IsEmpty then
                        iIdFundoInvest := qryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
                  end;
                  if iIdFundoInvest <> 0 then
                  begin
                     if not ExisteCotaFundo(iIdFundoInvest,RegCotaFdo.Data) then
                     begin
                        //AL_7 - 05/01/2006
                        //AL_3 - Testa o período Contábil
                        //AL_10
                        if not CtrlInvContab.TestaPeriodo(RegCotaFdo.Data, iTipoInvestUsu) then
                           Raise Exception.Create(CtrlInvContab.MessageInfo);

                        //AL_9 - 17/05/2006
                        if not dtmBaseDados.dbBaseDados.InTransaction then
                           dtmBaseDados.dbBaseDados.StartTransaction;

                        //AL_8 - 20/02/2006
                        QryTipoFundoInvest.Close;
                        QryTipoFundoInvest.ParamByname('IDFUNDOINVEST').AsInteger := iIdFundoInvest;
                        QryTipoFundoInvest.Open;
                        if VerEmAbertura(QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
                           Raise Exception.Create('Atualização de Saldo em andamento.');

                        OperComum.LimpaParametros(QryInsCotaFundo);
                        QryInsCotaFundo.ParamByName('IDCOTAFUNDO').AsInteger   := LeUltRegistro(nil,'COTAFUNDO');
                        QryInsCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := iIdFundoInvest;
                        QryInsCotaFundo.ParamByName('DATACOTA').AsString       := RegCotaFdo.Data;
                        QryInsCotaFundo.ParamByName('VLRCOTA').AsFloat         := StrToFloat(RegCotaFdo.Cota);
                        QryInsCotaFundo.ExecSql;

                        //AL_9 - 17/05/2006
                        if dtmBaseDados.dbBaseDados.InTransaction then
                           DtmBaseDados.dbBaseDados.Commit;
                     end
                     else
                     begin
                        fVlrCota :=  TrocaPontoVirgula(qryBuscaCotaFundo.FieldByName('VLRCOTA').AsString);
                        if RegCotaFdo.Cota <> fVlrCota then
                        begin
                           //AL_7 - 05/01/2006
                           //AL_3 - Testa o período Contábil
                           //AL_10
                           if not CtrlInvContab.TestaPeriodo(RegCotaFdo.Data, iTipoInvestUsu) then
                              Raise Exception.Create(CtrlInvContab.MessageInfo);

                           //AL_9 - 17/05/2006
                           if not dtmBaseDados.dbBaseDados.InTransaction then
                              dtmBaseDados.dbBaseDados.StartTransaction;

                           //Al_04 - 01/09/2005
                           QryTipoFundoInvest.Close;
                           QryTipoFundoInvest.ParamByname('IDFUNDOINVEST').AsInteger := iIdFundoInvest;
                           QryTipoFundoInvest.Open;
                           //AL_8 - 20/02/2006
                           if VerEmAbertura(QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
                              Raise Exception.Create('Atualização de Saldo em andamento.');

                           // Alt_2
                           OperComum.LimpaParametros(QryUpdCotaFundo);
                           QryUpdCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := iIdFundoInvest;
                           QryUpdCotaFundo.ParamByName('DATACOTA').AsString       := RegCotaFdo.Data;
                           QryUpdCotaFundo.ParamByName('VLRCOTA').AsFloat         := StrToFloat(RegCotaFdo.Cota);
                           QryUpdCotaFundo.ExecSql;

                           //AL_9 - 17/05/2006
                           if dtmBaseDados.dbBaseDados.InTransaction then
                              DtmBaseDados.dbBaseDados.Commit;

                           //AL_6 - 05/01/2006
                           //Importa o arquivo diário que vem com "n" fundos e "n" dias de cotação
                           if iTipoInvestUsu <> 7 then
                           begin
                              //Al_04 - 01/09/2005
                              //Reprocessa o Fundo
                              QryTipoFundoInvest.Close;
                              QryTipoFundoInvest.ParamByname('IDFUNDOINVEST').AsInteger := iIdFundoInvest;
                              // Renan Cristiano Sol 129398 | Kintana 709666 Inicio
                              QryTipoFundoInvest.ParamByName('DATA').AsString           := RegCotaFdo.Data;
                              // Renan Cristiano Sol 129398 | Kintana 709666 Fim
                              QryTipoFundoInvest.Open;

                              if QryFundoInvest.FieldByName('DTAINIPROC').IsNull Then
                                 dDtaIniProc := QryTipoFundoInvest.FieldByName('DTAINIPROC').AsDateTime
                              else
                                 dDtaIniProc := QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime;

                              if dDataIniReproc <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
                              begin
                                 //Alt_1
                                 If Not Reprocessamento(iTipoInvestUsu,
                                                        QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                                        iIdFundoInvest,
                                                        -1,
                                                        dDataIniReproc,
                                                        QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                                        dDtaIniProc,
                                                        True) Then
                                    //AL_11                    
                                    Raise Exception.Create('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!');

                              end;
                              //AL_04 - Fim
                           end;
                           //AL_6 - Fim
                        end;
                     end;
                  end
                  else
                     Raise Exception.Create('Não foi encontrado o Fundo para o CNPJ : '+RegCotaFdo.CNPJ+' ! ');
               end;
            end;
            fraMensProc.Incrementa;
         end;

         //AL_9 - 17/05/2006
         //AL_6 - 05/01/2006
         //Importa fundo imobiliario conforme o arquivo mensal, que vem com um fundo e todos os dias de cota do mês
         if iTipoInvestUsu = 7 then
         begin
            //Al_04 - 01/09/2005
            // Reprocessa o Fundo
            QryTipoFundoInvest.Close;
            QryTipoFundoInvest.ParamByname('IDFUNDOINVEST').AsInteger := iIdFundoInvest;
            QryTipoFundoInvest.ParamByName('DATA').AsString           := RegCotaFdo.Data;            
            QryTipoFundoInvest.Open;

            if QryFundoInvest.FieldByName('DTAINIPROC').IsNull Then
               dDtaIniProc := QryTipoFundoInvest.FieldByName('DTAINIPROC').AsDateTime
            else
               dDtaIniProc := QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime;

            if dDataIniReproc <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
            begin
               //Alt_1
               If Not Reprocessamento(iTipoInvestUsu,
                                      QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                      iIdFundoInvest,
                                      -1,
                                      dDataIniReproc,
                                      QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                      dDtaIniProc,
                                      True) Then
                  //AL_11                    
                  Raise Exception.Create('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!');
            end;
            //Al_04 - Fim
         end;
         //AL_6 - Fim

         MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema ',mtConfirmation,[mbOK],0);

      Except
         on E: Exception do
         begin
            //AL_9 - 17/05/2006
            if dtmBaseDados.dbBaseDados.InTransaction then
               DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Não foi possível realizar a Importação dos Fundos' + #13 +
                   E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      End;
   Finally
      // Fecha os Arquivos e destroi os componentes independente do resultado da Operacao
      fraMensProc.Mostra;
      qryFundoInvest.Close;
      QryTipoFundoInvest.Close;
      ExcelApp.Workbooks[1].Close(False);
      ExcelApp.Quit;
      Mensagem.Free;
      inherited;
   end;
   // AL_3 - Inicio
end;

function TFrmImportaCotacoesFundos.ValidaCampos:boolean;
begin
   Result := True;
   if (edtArquivo.Text = '')  then
   begin
      ShowMessage('Nome do Arquivo não informado.');
      Result := False;
      Exit;
   end
   // Testa se Arquivo Especificado Existe
   else if not (FileExists(edtArquivo.Text)) then
   begin
      ShowMessage('Arquivo não Existe ou Inválido.');
      Result := False;
      Exit;
   end;

   if (edtLinha.Text    = '') then
   begin
      ShowMessage('Linha de início de pesquisa não informada.');
      Result := False;
      Exit;
   end;
   if  (edtData.Text  = '')  then
   begin
      ShowMessage('Coluna da Data não informada.');
      Result := False;
      Exit;
   end;

   if (edtCota.Text  = '')  then
   begin
      ShowMessage('Coluna da Cota não informada.');
      Result := False;
      Exit;
   end;
end;

function TFrmImportaCotacoesFundos.ExisteCotaFundo(iFundoInvest:Integer;dDataCota:String):boolean;
begin
   Result := False;
   OperComum.LimpaParametros(qryBuscaCotaFundo);
   qryBuscaCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvest;
   qryBuscaCotaFundo.ParamByName('DATACOTA').AsString       := dDataCota;
   qryBuscaCotaFundo.Open;
   if not qryBuscaCotaFundo.IsEmpty then
      Result := True;
end;

procedure TFrmImportaCotacoesFundos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryBuscaCotaFundo.Close;
end;

procedure TFrmImportaCotacoesFundos.FormCreate(Sender: TObject);
begin
  inherited;
   OpenDialog1.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Jéssica Lana SOL 109421 KINTANA 496332

end;

end.
