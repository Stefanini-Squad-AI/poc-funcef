//******************************************************************************
// Rotina     : DBEQtdCotaExit
// SOL        : 92333
// Kintana    : 394049
// Data       : 18/08/2008 
// Responsável: André L. Santos
// Descrição  : Ajuste para identificar a quaatidade de cotas informada
//******************************************************************************
// Data      : 20/06/2007 
// Código    : AL_44
// Pendencia : 25539
// SOL       : 56257
// Motivo    : Implementação do filtro de tipo de fundo
//******************************************************************************
// Data      : 20/06/2007
// Código    : AL_43
// Pendencia : 25594
// SOL       : 56257
// Motivo    : Implementação da taxa de ingresso conforme especificação
//******************************************************************************
// Data      : 09/05/2007
// Código    : AL_42
// Pendencia : 25308
// SOL       : 59872
// Motivo    : Acerto na data de parâmetro passado para verificar se há integralização no dia.
//******************************************************************************
// Data      : 19/04/2007
// Código    : Al_41
// Pendencia : 23857
// Motivo    : Implementação de ajustes para aceitar "n" subscrições(total), com a mesma
//             data de subscrição.
//******************************************************************************
// Data      : 15/03/2007
// Código    : Al_40
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do fechto das query(qryCotaIntegrFundo)
//             determinando o dmfundocomum e com a função OperComum.LimpaParametros.
//******************************************************************************
// Data      : 14/03/2007
// Código    : AL_39
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do filtro por TIPMOVCOTAINTEGR <> 'TRP'
//******************************************************************************
// Data      : 12/03/2007
// Código    : AL_38
// Pendencia : 24658
// SOL       : 55067
// Motivo    : Implementação do filtro por plano no montaselect e na exclusão do
//             registro
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_37
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 08/01/2006
// Código    : AL_36
// Pendencia : 24153
// Motivo    : Implementação da busca do titulo para parametrizar a contabilização
//             da variação
//******************************************************************************
// Data      : 08/01/2006
// Código    : AL_35
// Pendencia : 23857
// SOL       :
// Motivo    : Implementação de ajustes para aceitar "n" subscrições(total), com a mesma
//             data de subscrição.
//******************************************************************************
// Data      : 24/08/2006
// Código    : AL_34
// Pendencia : 23121
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 26/07/2006
// Código    : AL_33
// Pendencia :
// SOL       :
// Motivo    : A exclusão dos historicos de fundos foi retirada devido ao
//             reprocessamento do fundo executar a atualização apenas de um fundo.
//             Implementada apenas a exclusão do registro referente ao fundo em questão.
//             Implementação de mensagem para executação de uma exclusão
//******************************************************************************
// Data      : 25/07/2006
// Código    : AL_32
// Motivo    : Ajuste no Form, retirada de processos, implementações, ajustes em mensagens e
//             tratamento de tela
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_31
// Pendencia :
// SOL       :
// Motivo    : Ajuste na rotina de exclusão, no item historico do fundo
//******************************************************************************
// Data      : 24/07/2006
// Código    : AL_30
// Motivo    : Retirado os fieds da qryTipoOperacao
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_29
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 16/05/2006
// Código    : AL_28
// Motivo    : Ajuste na busca das operações, para não passar duas vezes
//******************************************************************************
// Data      : 16/05/2006
// Código    : AL_27
// SOL       : 42338
// Motivo    : Ajuste no tratamento dos botões de detalhe, não eram habilitados,
//             devido pnlMestre não ser desabilitado na inclusão.
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_26
// Motivo    : Ajuste no tratamento da data da subscrição na GravaHistCotaIntegraliza.
//******************************************************************************
// Data      : 20/03/2006
// Código    : AL_25
// Motivo    : Ajuste na busca dos Fundos, para trazer todos referentes ao
//            tipo de fundo FIDC(qryInvest)
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_24
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 12/12/2005
// Código   : AL_23
// Motivo   : Implementação do tratamento de saldo sintetico conforme a susbcrição
//******************************************************************************
// Data     : 15/08/2005
// Código   : AL_22
// Motivo   : Implementação do fechamento das query´s qryAux e qryAux1
//******************************************************************************
// Data     : 15/08/2005
// Código   : AL_21
// Motivo   : Implementação da Operação e Atualização do Histórico de Cotas a Integralizar e do Reprocessamento
//******************************************************************************
// Data     : 15/08/2005
// Código   : AL_20
// Motivo   : Retirado o abort e implementado a mensagem.
//******************************************************************************
// Data     : 15/08/2005
// Código   : AL_19
// Motivo   : Implementação da exclusão do fluxo de cotas e variações contabeis.
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_18
// Motivo   : Implementação de variáveis para guardar conteudo a ser utilizado no reprocessamento
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_17
// Motivo   : Retirada a abertura da query QryCotasIntegraliza
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_16
// Motivo   : Implementação da unit dFundoComum
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_15
// Motivo   : Implementação do exit da data para abertura da query QryCotasIntegraliza
//            que busca a qtd de cotas q pode ser integralizada
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_14
// Motivo   : Implementação do valor liquido no exit da quantidade
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_13
// Motivo   : Alterado campo e o sql da query QryCotasIntegraliza de QTDINTEGRALIZAR para QTDHISTCOTAINTEGR,
//            devido a troca de tabela a ser usada na integralização de cotas
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_12
// Motivo   : Implementação a Query QryAux1
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_11
// Motivo   : Retirada a query QryUpdQtdIntegralizar
//******************************************************************************
// Data     : 10/08/2005
// Código   : AL_10
// Motivo   : Implementação de campos na query QryCotasIntegraliza e na qryInvest
//******************************************************************************
// Data     : 24/06/2005
// Código   : AL_9
// Motivo   : Implementação da aplicaAlteracoes para confirmar a deleção do detalhe
//******************************************************************************
// Data     : 24/06/2005
// Código   : AL_8
// Motivo   : Implementação da DTAINIPROC na query qryInvest
//******************************************************************************
// Data     : 31/05/2005
// Código   : AL_7
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_6
// Motivo   : Retirado o tratamento de "erro" das mensagens
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_5
// Motivo   : Acerto na rotina de exclusão, essa deixava o contabil e financeiro
//            Implementação de variavéis para guardar parametros a serem utilizados
//            Retirada a query QryVerDelAplicacao
//******************************************************************************
// Data     : 30/05/2005
// Linha(s) : Al_4
// Motivo   : Implementação da flag de conta de investimento, no momento da integralização
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_3
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 23/03/2005
// Linha(s) : AL_2
// Motivo   : Implementada a Gravação do PLNCODIGO, PLANO e CODDOCUMENTO. Alterado PAS e DFM.
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvest e na funcao Reprocessamento
//*******************************************************************************
//Data	    : 06/04/2004
//Função    : Integralização de Cotas para Fundos de Direito Creditórios
//*******************************************************************************

unit FCadCotasIntegrDirCred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroRMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, uOperacaoInvest, TREdit, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls, uCtrlInvContab;

type
  TfrmCadCotasIntegrDirCred = class(TfrmCadastroRMDetInv)
    qryInvest: TwwQuery;
    qryInvestDESCFUNDOINVEST: TStringField;
    qryInvestIDFUNDOINVEST: TFloatField;
    qryInvestIDGESTORCARTEIRA: TFloatField;
    qryInvestTRGDTINCLUSAO: TDateTimeField;
    qryInvestTRGUSERINCLUSAO: TStringField;
    qryInvestMOECODIGO: TFloatField;
    qryInvestIDCARTEIRAINVEST: TFloatField;
    qryInvestIDTIPOFUNDOINVEST: TFloatField;
    qryInvestCNPJFUNDO: TStringField;
    qryInvestSTAEXCLUSIVO: TStringField;
    qryInvestPZOCARENCIA: TFloatField;
    qryInvestPZOANIVERSARIO: TFloatField;
    qryInvestPZOLIQAPLIC: TFloatField;
    qryInvestPZOLIQRESG: TFloatField;
    qryInvestQTDDECQTD: TFloatField;
    qryInvestQTDDECVALOR: TFloatField;
    qryInvestSTAFUNDO: TStringField;
    qryInvestPZOAMORTIZACAO: TFloatField;
    qryInvestPERCTXPERFORM: TFloatField;
    qryInvestPERCTXADM: TFloatField;
    qryInvestCODFUNCETIP: TStringField;
    qryInvestSTAPROVISIONAIR: TStringField;
    qryInvestSTAPROVISIONAIOF: TStringField;
    qryInvestCONTRCETIP: TStringField;
    qryInvestDATAREFERENCIA: TStringField;
    qryInvestIDTIPOINVEST: TFloatField;    
    QryCotasIntegraliza: TwwQuery;
    //Al_23
    QryCotasIntegralizaIDFUNDOINVEST: TFloatField;
    //AL_10
    QryCotasIntegralizaIDTIPOCOTA: TFloatField;
    QryCotasIntegralizaIDTIPOINVEST: TFloatField;
    QryCotasIntegralizaIDPLANPREVCTBPATR: TFloatField;
    QryCotasIntegralizaDATAHISTCOTAINTEG: TDateTimeField;
    QryCotasIntegralizaQTDHISTCOTAINTEGR: TFloatField;
    //AL_10 - Fim
    //Al_23
    QryCotasIntegralizaIDOPERACAOFUNDO: TFloatField;
    QryCotasIntegralizaDATAAPLICACAO: TDateTimeField;
    //AL_13
    qryAux: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    //AL_43
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDPEDIDOFUNDO: TFloatField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheIDTIPOOPERACAO: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAOPERACAO: TDateTimeField;
    qryDetalheDATALIQUIDACAO: TDateTimeField;
    qryDetalheQTDOPERACAO: TFloatField;
    qryDetalheVLROPERACAO: TFloatField;
    qryDetalheVLRCOTA: TFloatField;
    qryDetalheVLRIR: TFloatField;
    qryDetalheVLRIOF: TFloatField;
    qryDetalheVLRRENDIMENTO: TFloatField;
    qryDetalheSTACONFIRMA: TStringField;
    qryDetalheIDOPERACAOORIGEM: TFloatField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalheDATACOTIZACAO: TDateTimeField;
    qryDetalheVLRDESCONTO: TFloatField;
    qryDetalheVLRPAGO: TFloatField;
    QryTipoCota: TwwQuery;
    dblTipoCota: TwwDBLookupCombo;
    Tipocota: TLabel;
    qryDetalheIDTIPOCOTA: TFloatField;
    qryDetalheDESCTIPOCOTA: TStringField;
    //AL_43
    qryTipoOperacao: TwwQuery;
    //AL_43
    //Al_23
    qryDetalhePLANO: TFloatField;
    qryDetalhePLNCODIGO: TFloatField;
    qryDetalheCODDOCUMENTO: TFloatField;
    qryInvestDTAINIPROC: TDateTimeField;
    //AL_10
    qryInvestDATAULTFECH: TDateTimeField;
    //AL_12
    qryAux1: TwwQuery;
    dsTipoOperacao: TwwDataSource;
    //AL_34
    dblTipoFundo: TwwDBLookupCombo;
    TipoFundo: TLabel;
    QryTipoFundo: TwwQuery;
    QryVerIntegrCotas: TwwQuery;
    //AL_35
    QryVerOperSubDia: TwwQuery;
    //Al_41
    qryDetalheIDCOTAINTEGRALIZA: TFloatField;
    qryDetalheID: TFloatField;
    QryCotasIntegralizaID: TFloatField;
    //AL_43
    qryDetalheVLRTAXAS: TFloatField;
    pgcOperacao: TPageControl;
    tbsOper: TTabSheet;
    Label9: TLabel;
    dbeTipoOperacao: TDBEdit;
    Label2: TLabel;
    dbdDta: TCMDateTimePicker;
    Label3: TLabel;
    dblDataIntegraliza: TwwDBLookupCombo;
    Label1: TLabel;
    DBEQtdCota: TDBRealEdit;
    Label4: TLabel;
    DBEVlrCota: TDBRealEdit;
    Label5: TLabel;
    DBEVlrPago: TDBRealEdit;
    Label6: TLabel;
    DBEVlrDesconto: TDBRealEdit;
    Label7: TLabel;
    DBEVlrLiquido: TDBRealEdit;
    tbsTaxa: TTabSheet;
    Label10: TLabel;
    dbeTipoOperTx: TDBEdit;
    Label8: TLabel;
    DBEVlrTaxa: TDBRealEdit;
    qryTipoOperTx: TwwQuery;
    dsTipoOperTx: TwwDataSource;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblDataIntegralizaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBEQtdCotaExit(Sender: TObject);
    procedure DBEVlrDescontoExit(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    //AL_15
    procedure dbdDtaExit(Sender: TObject);
    procedure dblDataIntegralizaExit(Sender: TObject);
    procedure dblTipoCotaExit(Sender: TObject);
    procedure dblInvestExit(Sender: TObject);
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_34
    procedure FormCreate(Sender: TObject);
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure sbtnConsDetClick(Sender: TObject);
    //AL_43
    procedure dblTipoFundoEnter(Sender: TObject);
    procedure dblInvestEnter(Sender: TObject);
    procedure dblTipoCotaEnter(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    //AL_35
    { Private declarations }   
    bModif : Boolean;
    //AL_43
    sVarAnt: String;

    procedure StatusGeral;
    procedure StatusInclui;
    // AL_7 - Rotinas não utilizadas
    procedure Decimais;
    procedure PreparaGrid;

    function  VerificaResgates : boolean;
    function  VerIntegralizaCotas : Boolean;
    //AL_35
  public
    { Public declarations }
  end;

var
  frmCadCotasIntegrDirCred: TfrmCadCotasIntegrDirCred;
  //AL_28
  bMod : Boolean;
  //Al_33
  iFundoInvest, iTipoCota, iIdTipoOperacao, iFlgContaInvest : Integer;

  sDescOperacao : String;

implementation

//AL_16
uses UDataBase, UOperComum, UmensErro, UBibliotecaInvest, dBaseDados,
     UFundoComum, dFundoComum, uSistema;

{$R *.DFM}

procedure TfrmCadCotasIntegrDirCred.sbtnProcurarClick(Sender: TObject);
var x: Integer;
    wDisplay: String;
begin
   inherited;
   try
      PnlFundo.Enabled      :=True;
      pnlMestre.Enabled     :=True;

      sbtnInsDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;

      dblInvest.Enabled     := True;

      if MontaSelect.RetornouValor then
      begin
         //AL_34
         // Seleciona o Tipo de Fundo
         dblTipoFundo.LookupValue := MontaSelect.ValoresChave[4];
         dblTipoFundo.Text := MontaSelect.ValoresChave[5];
         dblTipoFundo.PerformSearch;

         // Seleciona o Fundo
         dblInvest.LookupValue := MontaSelect.ValoresChave[0];
         dblInvest.Text := MontaSelect.ValoresChave[1];
         dblInvest.PerformSearch;

         // Seleciona a Cota
         dblTipoCota.LookupValue := MontaSelect.ValoresChave[2];
         dblTipoCota.Text := MontaSelect.ValoresChave[3];
         dblTipoCota.PerformSearch;

         //AL_34
         dblTipoCotaCloseUp(Self, nil, nil, True);
         //AL_43
      end;
   finally
      // Define o status dos controles do form
      StatusGeral;
   end;
end;

procedure TfrmCadCotasIntegrDirCred.dblDataIntegralizaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
//AL_35
var DadosCota : TDadosCota;
begin
  inherited;
   //AL_35
   bModif := modified;
   if ((modified) and (Trim(dblDataIntegraliza.Text) <> '')) then
   begin
      //AL_13
      DBEQtdCota.Value := QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').AsFloat;
      If ((dbdDta.Text <> '') And (QryDetalhe.State = dsInsert)) Then
      begin
         //Busca dados da Cota
         DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                                 StrToInt(dblInvest.LookupValue),
                                                 StrToDate(dbdDta.Text));

         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
         DBEVlrCota.Value   := DadosCota.VlrCota;

         QryAux.Close;
      end;
   end;
end;

procedure TfrmCadCotasIntegrDirCred.DBEQtdCotaExit(Sender: TObject);
begin
  inherited;
   //AL_13
   //André L. Santos - 18/08/2008 - N. Sol 92333 -  N. Kintana 394049
   If (StrToFloat(QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').AsString) < StrToFloat(DBEQtdCota.Text)) Then
   begin
     ShowMessage('A Quantidade de Cotas é maior que a Quantidade de Cotas a Integralizar ( '+
          FloatToStrF(QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').Asfloat,ffNumber,23,8)+')');
     DBEQtdCota.SetFocus;
     Exit;
   end;
   DBEVlrPago.Value    := DBEQtdCota.Value*DBEVlrCota.Value;
   //AL_14
   DBEVlrLiquido.Value := DBEVlrPago.Value - DBEVlrDesconto.Value;
end;

procedure TfrmCadCotasIntegrDirCred.DBEVlrDescontoExit(
  Sender: TObject);
begin
  inherited;
   DBEVlrLiquido.Value := DBEVlrPago.Value - DBEVlrDesconto.Value;
end;

procedure TfrmCadCotasIntegrDirCred.sbtnInsDetClick(Sender: TObject);
begin
  //AL_34
  //Al_23
  If trim(dblTipoFundo.text) = '' then
  Begin
     MsgDlg('Informe o Tipo de Fundo para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
     if dblTipoFundo.CanFocus then
        dblTipoFundo.SetFocus;
     Exit;
  End;

  If trim(dblInvest.text) = '' then
  Begin
     MsgDlg('Informe o Fundo de Investimento para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
     if dblInvest.CanFocus then
        dblInvest.SetFocus;
     Exit;
  End;

  //AL_34
  If trim(dblTipoCota.text) = '' then
  Begin
     MsgDlg('Informe o Tipo de Cota para realizar a Operação.','Mensagem do Sistema', mtInformation,[MbOk],0);
     if dblTipoCota.CanFocus then
        dblTipoCota.SetFocus;
     Exit;
  End;

  //AL_27
  pnlMestre.Enabled    := False;

  //AL_34
  TipoFundo.Enabled    := False;
  dblTipoFundo.Enabled := False;
  Investimento.Enabled := False;
  dblInvest.Enabled    := False;
  Tipocota.Enabled     := False;
  dblTipoCota.Enabled  := False;

  StatusInclui;

  inherited;

  //AL_34
  QryDetalhe.FieldByName('DATAOPERACAO').AsString := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
  dbdDta.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;

  if dbdDta.CanFocus then
     dbdDta.SetFocus;

end;

procedure TfrmCadCotasIntegrDirCred.sbtnExcluiDetClick(Sender: TObject);
var
  //Al_18
  //Al_5
  //Al_23
  iOperacao, iTipoFundoInvest, iFundo, iTipoCota, iPlanilha, iDocumento, iPlano : Integer;
  dDataIniProc, dDataUltFech, dDataOper : TDateTime;
 //Al_5 - Fim
begin
   //AL_7 - Inicio
   try
      if (not qryDetalhe.IsEmpty) then
      begin
         If Not VerificaResgates Then
         Begin
            MsgDlg('Já ocorreram Resgates para essa Aplicação, não é possível excluir essa Operação.','Mensagem do Sistema',
                   mtInformation,[MbOk],0);
            StatusGeral;
            Exit;
         End;

         //AL_35

         //AL_24
         if VerEmAbertura(qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
            Exit;

         // Testa periodo contábil
         //AL_29
         if not CtrlInvContab.TestaPeriodo(qryDetalheDATAOPERACAO.AsString, iTipoInvestUsu) then
         begin
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            Exit;
         end;

         //AL_35

         If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
                   [mbYes, mbNo],0) = mrYes Then
         Begin
            Try
               //Al_5
               //Al_23
               iOperacao        := qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
               iDocumento       := qryDetalhe.FieldByName('CODDOCUMENTO').AsInteger;
               iPlanilha        := qryDetalhe.FieldByName('PLNCODIGO').AsInteger;
               iPlano           := qryDetalhe.FieldByName('PLANO').AsInteger;
               iFundo           := qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
               iTipoCota        := qryDetalhe.FieldByName('IDTIPOCOTA').AsInteger;
               dDataOper        := qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime;
               //Al_18
               dDataIniProc     := qryInvest.FieldByName('DTAINIPROC').AsDateTime;
               dDataUltFech     := qryInvest.FieldByName('DATAULTFECH').AsDateTime;
               iTipoFundoInvest := qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
               //Al_18 - Fim
               // Inicia Transação
               If not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               //AL_39   
               //AL_38
               //Al_19
               //Al_23
               FazQuery(qryAux, 'SELECT PLANO, PLNCODIGO FROM HISTCOTAINTEGRALIZA WHERE '+
                                'DATAHISTCOTAINTEG  >= TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') '+
                                ' AND IDOPERACAOFUNDO    = '+qryDetalheIDOPERACAOORIGEM.AsString+
                                ' AND IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+
                                ' AND TIPMOVCOTAINTEGR   <> ''TRP''');
               //AL_39
               //AL_38
               //Al_33
               //Al_23
               if Not ExecutaQuery(qryAux1, 'UPDATE HISTCOTAINTEGRALIZA SET PLANO = NULL, PLNCODIGO = NULL WHERE '+
                                            'DATAHISTCOTAINTEG >= TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') '+
                                            ' AND IDOPERACAOFUNDO    = '+qryDetalheIDOPERACAOORIGEM.AsString+
                                            ' AND IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+
                                            ' AND TIPMOVCOTAINTEGR   <> ''TRP''') then
                  Raise Exception.Create('Ocorreu um Problema na exclusão da operação.');

               //AL_31
               While Not qryAux.Eof Do
               begin
                  If ((qryAux.FieldByName('PLANO').AsInteger > 0) And
                      (qryAux.FieldByName('PLNCODIGO').AsInteger > 0)) Then
                  begin
                     If Not ProcExcluiContabil(qryAux.FieldByName('PLANO').AsInteger,
                                               qryAux.FieldByName('PLNCODIGO').AsInteger) Then
                        Raise Exception.Create('Ocorreu um problema na exclusão dos Resgistros de Atualização da Integralização - Contábil.');
                  end;
                  qryAux.Next;
               end;

               //AL_39
               //AL_38
               //Al_33
               //Al_23
               if Not ExecutaQuery(qryAux, 'DELETE FROM HISTCOTAINTEGRALIZA WHERE '+
                                           'DATAHISTCOTAINTEG >= TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') '+
                                           ' AND IDOPERACAOFUNDO    = '+qryDetalheIDOPERACAOORIGEM.AsString+
                                           ' AND IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+
                                           ' AND TIPMOVCOTAINTEGR   <> ''TRP''') then
                  Raise Exception.Create('Ocorreu um Problema na exclusão da operação.');

               //AL_34
               if Not ExecutaQuery(qryAux, 'DELETE FROM HISTFUNDO WHERE '+
                                           'IDTIPOINVEST           = '+IntToStr(iTipoInvestUsu)+' AND '+
                                           'IDPLANPREVCTBPATR      = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                                           'IDFUNDOINVEST          = '+IntToStr(iFundo)+' AND '+
                                           'DATAAPLICACAO          = TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND '+
                                           'DATAMOVFUNDO           = TO_DATE(' + QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND '+
                                           'IDTIPOCOTA             = '+IntToStr(iTipoCota)) then
                  Raise Exception.Create('Ocorreu um Problema na exclusão da operação.');

               // Exclui Dados do Historico
               If Not ProcExcluiFundo(iDocumento, iPlanilha, iPlano, iTipoInvestUsu, dDataOper, True) Then
                  Raise Exception.Create('Ocorreu um Problema na exclusão do Contábil da operação.');

               //AL_43
               if FazQuery(qryAux, 'SELECT PLANO, PLNCODIGO, CODDOCUMENTO FROM OPERACAOFUNDO WHERE '+
                                   'IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                                   'IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                                   'IDFUNDOINVEST     = '+IntToStr(iFundo)+' AND '+
                                   'DATAOPERACAO      = TO_DATE('+ QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND '+
                                   'IDTIPOOPERACAO     = -174 AND '+
                                   'IDTIPOCOTA        = '+IntToStr(iTipoCota)+' AND '+                                   
                                   'IDOPERACAOORIGEM   = '+qryDetalheIDOPERACAOFUNDO.AsString) then
               begin
                  if Not ExecutaQuery(qryAux1, 'DELETE FROM OPERACAOFUNDO WHERE '+
                                               'IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                                               'IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                                               'IDFUNDOINVEST     = '+IntToStr(iFundo)+' AND '+
                                               'DATAOPERACAO      = TO_DATE('+ QuotedStr(DateToStr(dDataOper)) + ',' + QuotedStr('dd/mm/yyyy') + ') AND '+
                                               'IDTIPOOPERACAO     = -174 AND '+                  
                                               'IDTIPOCOTA        = '+IntToStr(iTipoCota)+' AND '+
                                               'IDOPERACAOORIGEM   = '+qryDetalheIDOPERACAOFUNDO.AsString) then
                     Raise Exception.Create('Ocorreu um problema na exclusão da taxa de ingresso da operação.');

                  if Not ProcExcluiFundo(qryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                         qryAux.FieldByName('PLNCODIGO').AsInteger,
                                         qryAux.FieldByName('PLANO').AsInteger,
                                         iTipoInvestUsu, dDataOper, True) Then
                     Raise Exception.Create('Ocorreu um problema na exclusão do resgistro contábil da taxa de ingresso.');                     
               end;

               qryAux.Close;
               qryAux1.Close;               
               
               inherited;

               //Al_33

               // Confirma Transação
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Commit;

               //Al_21
               aplicaAlteracoes([qryDetalhe]);

               //Al_23
               If dDataOper <= dDataUltFech Then
               begin
                  If Not Reprocessamento(iTipoInvestUsu, iTipoFundoInvest, iFundo, -1,
                                         dDataOper, dDataUltFech, dDataIniProc,
                                         True, iTipoCota) Then
                     MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                            'Mensagem do Sistema', MtInformation,[MbOk],0)
                  else
                     MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
               end
               else
                  MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

              //Al_21 - Fim

            Except
               On E:Exception Do
               Begin
                  //Al_6
                  MsgDlg('Não foi possível excluir a Integralização:'+#13+
                          E.Message,'Mensagem do Sitema',mtWarning,[mbOk],0);
                  // Cancela Transação
                  //AL_43
                  If dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.Rollback;
                  //Al_32
                  pnlControlesDet.SendToBack;
                  CmeDetalhe.Cancel(Self);
                  AplicaAlteracoes([qryDetalhe]);
               End;
            End;
         end;
      end;
   finally
      //Al_32
      bbtnCancelarDetClick(Sender);
      StatusGeral;
      PreparaGrid;
      QryAux.Close;
      QryAux1.Close;
      QryTipoFundoInvest.Close;
   end;
end;

procedure TfrmCadCotasIntegrDirCred.bbtnOkDetClick(Sender: TObject);
Var
  //Al_4
  //AL_43
  dData : TDateTime;
  iOperacaoFundo, iTipoOperacao, iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
  fVlrTaxas, fVlrAtualizado, fVlrCustoAcoes, fVlrVarAcoes : Currency;
  //AL_36
  sComplemento, sTipoTitulo, sNatureza, sMens : String;
  DadosCota  : TDadosCota;
begin
   fVlrCustoAcoes := 0;
   fVlrVarAcoes   := 0;
   fVlrTaxas      := 0;

   //AL_35
   //AL_24
   if VerEmAbertura(qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   // AL_7 - Inicio
   if dbdDta.Text = '' then
   begin
     MsgDlg('O Campo DATA deve ser preenchido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdDta.Canfocus then
         dbdDta.SetFocus;
      Exit;
   end;         

   // Testa período contabil
   //AL_29
   if not CtrlInvContab.TestaPeriodo(dbdDta.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdDta.Canfocus then
         dbdDta.SetFocus;
     Exit;
   end;

   //AL_35

   if dblDataIntegraliza.Text = '' then
   begin
      MsgDlg('O Campo Data da Integralização deve ser preenchido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblDataIntegraliza.CanFocus then
         dblDataIntegraliza.SetFocus;
      Exit;
   end;

   //AL_35

   if DBEQtdCota.Value <= 0 then
   begin
      MsgDlg('O Campo Quantidade de Cotas deve ser maior que zero.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if DBEQtdCota.CanFocus then
         DBEQtdCota.SetFocus;
      Exit;
   end;

   if DBEVlrCota.value <= 0 then
   begin
      MsgDlg('O Campo Valor da Cota Integralizada deve ser maior que zero.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if DBEVlrCota.CanFocus then
         DBEVlrCota.SetFocus;
      Exit;
   end;

   if DBEVlrPago.value <= 0 Then
   begin
      MsgDlg('O Campo Valor Pago deve ser maior que zero.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if DBEVlrPago.CanFocus then
         DBEVlrPago.SetFocus;
      Exit;
   end;

   if DBEVlrLiquido.value <= 0 Then
   begin
      MsgDlg('O Campo Valor Líquido deve ser maior que zero.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if DBEVlrLiquido.CanFocus then
         DBEVlrLiquido.SetFocus;
      Exit;
   end;
   // AL_7 - Fim

   //AL_43
   if DBEVlrTaxa.Value <> 0 then
   begin
      if qryTipoOperTx.IsEmpty then
      begin
         MsgDlg('Não foi cadastrado o tipo de operação -174 da Taxa de Ingresso.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         if DBEVlrTaxa.CanFocus then
            DBEVlrTaxa.SetFocus;
         Exit;
      end;
   end;

   //AL_35
   //AL_34
   //Verifica se já ocorreu integralização de cotas desse fundo para datas futuras
   if not VerIntegralizaCotas then
   begin
      if dblDataIntegraliza.CanFocus then
         dblDataIntegraliza.SetFocus;
      Exit;
   end;   

   OperComum.LimpaParametros(QryVerOperSubDia);
   QryVerOperSubDia.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryVerOperSubDia.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
   //AL_42
   QryVerOperSubDia.ParamByName('DATAOPERACAO').AsString       := dbdDta.Text;
   QryVerOperSubDia.ParamByName('DATACOTIZACAO').AsString      :=
                    QryCotasIntegraliza.FieldByName('DATAAPLICACAO').AsString;
   QryVerOperSubDia.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryVerOperSubDia.ParamByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
   QryVerOperSubDia.ParamByName('IDOPERACAOORIGEM').AsInteger  := QryCotasIntegraliza.FieldByName('ID').AsInteger;
   QryVerOperSubDia.Open;
   If Not QryVerOperSubDia.IsEmpty Then
   begin
      MsgDlg('Já existe operação para essa Data de Susbcrição.','Mensagem do Sistema',
              mtInformation,[MbOk],0);
      QryVerOperSubDia.Close;
      bbtnCancelarDetClick(Sender);
      Exit;
   end;
   QryVerOperSubDia.Close; 

   try
      Try
        //AL_30
        //Al_4
        //AL_27
        //Al_17
        // Inicia Transação
        If not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

        //AL_43
        iOperacaoFundo := LeUltRegistro(nil,'OPERACAOFUNDO');
        qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger   := iOperacaoFundo;
        qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
        qryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger    := iIdTipoOperacao;
        qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
        //AL_35
        qryDetalhe.FieldByName('DATACOTIZACAO').AsDateTime    := QryCotasIntegraliza.FieldByName('DATAAPLICACAO').AsDateTime;
        qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime   := StrToDate(dbdDta.Text);
        qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  := qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;
        qryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
        //AL_35
        if Trim(dblTipoCota.Text) <> '' then
           qryDetalhe.FieldByName('IDTIPOCOTA').AsInteger        := StrToInt(dblTipoCota.LookupValue);
        qryDetalhe.FieldByName('STACONFIRMA').AsString        := 'S';
        qryDetalhe.FieldByName('VLRCOTA').AsFloat             := DBEVlrCota.Value;
        //Al_23
        qryDetalhe.FieldByName('IDOPERACAOORIGEM').AsInteger  := QryCotasIntegraliza.FieldByName('IDOPERACAOFUNDO').AsInteger;

        //AL_35
        //AL_26
        //Al_21
        //Al_23
        If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                        StrToInt(dblInvest.LookupValue),
                                        OperComum.IIF(Trim(dblTipoCota.Text)<>'', StrToInt(dblTipoCota.LookupValue), -1),
                                        -1, -1, -1,
                                        iPlanPrevCtbPatro,
                                        qryDetalhe.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                        StrToDate(dbdDta.Text),
                                        StrToDate(dblDataIntegraliza.Text),
                                        DBEVlrPago.Value,
                                        DBEQtdCota.Value, DBEQtdCota.Value,
                                        DBEVlrCota.Value, 0, 'OPE') then
           Raise Exception.Create('Ocorreu um problema ao Alimentar o Histórico da Integralização.');

        with DmFundoComum do
        begin
           //Al_40
           OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
           //AL_35
           if Trim(dblTipoCota.Text) <> '' then
              qryCotaIntegrFundo.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCota.LookupValue);
           qryCotaIntegrFundo.ParamByName('IDFUNDOINVEST').AsInteger := StrToInt(dblInvest.LookupValue);
           qryCotaIntegrFundo.ParamByName('DATACOTA').AsString       := dbdDta.Text;
           qryCotaIntegrFundo.Open;
        end;

        //AL_35
        //AL_26
        //Al_23
        If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                        StrToInt(dblInvest.LookupValue),
                                        OperComum.IIF(Trim(dblTipoCota.Text)<>'', StrToInt(dblTipoCota.LookupValue), -1),
                                        -1, -1, -1,
                                        iPlanPrevCtbPatro,
                                        qryDetalhe.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                        StrToDate(dbdDta.Text),
                                        StrToDate(dblDataIntegraliza.Text),
                                        OperComum.Round((QryCotasIntegralizaQTDHISTCOTAINTEGR.AsFloat-DBEQtdCota.Value)*
                                                         DmFundoComum.qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat,2),
                                        QryCotasIntegralizaQTDHISTCOTAINTEGR.AsFloat-DBEQtdCota.Value,
                                        DBEQtdCota.Value,
                                        DmFundoComum.qryCotaIntegrFundo.FieldByName('VLRCOTA').AsFloat, 0, 'ATU') then
           Raise Exception.Create('Ocorreu um problema ao Alimentar o Histórico da Integralização.');

        //Al_40
        OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
        //Al_21 - Fim

        bbtnConfirmar.Enabled := True;

       //Al_41
       //Al_17
       //Apuração da atualização de ganho ou perda conforme a cota cadastrada para o dia da operação
       DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                               qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                               qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime);

       DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
       DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

       fVlrAtualizado     := qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
       fVlrVarAcoes       := 0;
       if DadosCota.VlrCota <> 0 then
       begin
          fVlrAtualizado  := OperComum.Round(qryDetalhe.FieldByName('QTDOPERACAO').AsFloat*DadosCota.VlrCota,2);

          fVlrVarAcoes    := fVlrAtualizado - qryDetalhe.FieldByName('VLROPERACAO').AsFloat;
       end;

       if Not GravaAplicacaoResgate(iTipoInvestUsu,
                                    iIdTipoOperacao,
                                    qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                    qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                    qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                    qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                    qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                    qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                    Trim(sDescOperacao)+' / '+qryInvest.FieldbyName('DESCFUNDOINVEST').AsString,
                                    'A', 'OPE',
                                    qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                    qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                    0, 0, fVlrVarAcoes,
                                    qryDetalhe.FieldByName('QTDOPERACAO').AsFloat,
                                    qryDetalhe.FieldByName('QTDOPERACAO').AsFloat,
                                    fVlrAtualizado,
                                    qryDetalhe.FieldByName('VLRCOTA').AsFloat,
                                    qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                    iPlanPrevCtbPatro, -1, 0,
                                    StrToInt(dblTipoCota.lookupvalue)) Then
          Raise Exception.Create('Não foi possível efetuar Atualização de Variação da Operação.');

       if not PesqAplicMesmoDia(iTipoInvestUsu,
                                iIdTipoOperacao,
                                qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                qryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                -1, -1,
                                qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                qryDetalhe.FieldByName('VLRCOTA').AsFloat,
                                'A',
                                Trim(sDescOperacao)+' / '+qryInvest.FieldbyName('DESCFUNDOINVEST').AsString,
                                StrToInt(dblTipoCota.lookupvalue)) then
          Raise Exception.Create('Não efetuar a unificação das aplicações na operação de Integralização de Cotas do Fundo : '+#13+
                                 qryInvest.FieldByName('DESCFUNDOINVEST').AsString +#13+
                                 'No dia : '+qryDetalhe.FieldByName('DATAOPERACAO').AsString);

       iPlanilha  := -1;
       iDocumento := -1;
       iPlano     := -1;

       iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                          qryInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                          iIdTipoOperacao, pRPI.IDTIPOCLIENTEEMI);
       //Al_41
       //Al_4
       //Al_3
       If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                       iIdTipoOperacao,
                                       iTipoInvestUsu,
                                       qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                       iIdForCli,
                                       qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                       qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                       qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
                                       'OPE', 'A',
                                       qryInvest.FieldbyName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                       True,
                                       qryDetalhe.FieldByName('VLROPERACAO').AsFloat,
                                       0, 0, 0, 0, 0, 0,
                                       StrToInt(dblTipoCota.lookupvalue),
                                       0, 0, 0,
                                       iFlgContaInvest) Then
          //Al_6
          Raise Exception.Create('Ocorreu um problema ao contabilizar a Operação.');
       // Al_4 - Fim

       //Apuração da atualização de ganho ou perda conforme a cota cadastrada para o dia da operação
       DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime);

       DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
       DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;

       //Al_41
       if fVlrVarAcoes <> 0 then
       begin
          if fVlrVarAcoes < 0 then
             iTipoOperacao := -13   //Atualização Negativa
          else
             iTipoOperacao := -12;  //Atualização Positiva

          sTipoTitulo := '';

          //AL_43
          iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                             qryInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                             iTipoOperacao,
                                             pRPI.IDTIPOCLIENTEEMI);
          //AL_36
          if not BuscaTipoTitulo(qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger, iTipoInvestUsu, '',
                                 sTipoTitulo, sComplemento) then
             Raise Exception.Create('Não foi possível determinar o Tipo de Título para contabilização');

          //Al_41
          If Not ContabilizaAtualizacao(iTipoOperacao, Sistema.IdEmpresa, Sistema.IdModulo,
                                        iTipoInvestUsu,
                                        qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                        iIdForCli,
                                        iPlanoPrevContab,
                                        iPatrocinadora,
                                        ABS(fVlrVarAcoes),
                                        sTipoTitulo,
                                        Trim(sDescOperacao) + ' - '+
                                           Trim(qryInvest.FieldByName('DESCFUNDOINVEST').AsString)+' / '+
                                              sPlanPrevCtbPatro,
                                        qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                        True, iPlano, iPlanilha, iDocumento) Then
             Raise Exception.Create('Ocorreu um problema na integralização do Contábil/Financeiro de Variação da Operação.');
        end;

        //AL_43        
        dData     := StrToDate(dbdDta.Text);
        fVlrTaxas := DBEVlrTaxa.Value;
        qryDetalhe.FieldByName('VLRTAXAS').Clear;

        // AL_2
        // Update no Plano,CodDocumento e PlnCodigo na OPERACAOFUNDO
        qryDetalhe.FieldByName('PLANO').Clear;
        if iPlano > 0 then
           qryDetalhe.FieldByName('PLANO').AsInteger     := iPlano;

        qryDetalhe.FieldByName('PLNCODIGO').Clear;
        if iPlanilha > 0 then
           qryDetalhe.FieldByName('PLNCODIGO').AsInteger := iPlanilha;

        qryDetalhe.FieldByName('CODDOCUMENTO').Clear;
        if iDocumento > 0 then
           qryDetalhe.FieldByName('CODDOCUMENTO').AsInteger := iDocumento;
        // AL_2

        // Só atualiza se não der nenhum erro nas operações acima
        qryDetalhe.Post;
        qryDetalhe.CommitUpdates;

        //AL_43
        if fVlrTaxas <> 0 then
        begin
           qryDetalhe.Insert;
           qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger   := LeUltRegistro(nil,'OPERACAOFUNDO');

           qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
           qryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger    := qryTipoOperTx.FieldByName('IDTIPOOPERACAO').AsInteger;
           qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
           qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime     := dData;
           qryDetalhe.FieldByName('DATACOTIZACAO').AsDateTime    := dData;
           qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime   := dData;
           qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  := qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;
           qryDetalhe.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
           if Trim(dblTipoCota.Text) <> '' then
              qryDetalhe.FieldByName('IDTIPOCOTA').AsInteger     := StrToInt(dblTipoCota.LookupValue);

           qryDetalhe.FieldByName('IDOPERACAOORIGEM').AsInteger  := iOperacaoFundo;

           DBEVlrTaxa.Value := fVlrTaxas;
           
           qryDetalhe.FieldByName('VLRTAXAS').AsFloat            := fVlrTaxas;

           iPlano     := -1;
           iPlanilha  := -1;
           iDocumento := -1;

           iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                              qryInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                              qryTipoOperTx.FieldByName('IDTIPOOPERACAO').AsInteger,
                                              pRPI.IDTIPOCLIENTEEMI);

           If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                           qryTipoOperTx.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           iTipoInvestUsu,
                                           qryInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                           iIdForCli,
                                           qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                           qryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
                                           qryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
                                           qryTipoOperTx.FieldByName('TIPOMOVTO').AsString,
                                           qryTipoOperTx.FieldByName('NATUREZAOPERACAO').AsString,
                                           qryInvest.FieldbyName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                           True,
                                           qryDetalhe.FieldByName('VLRTAXAS').AsFloat,
                                           0, 0, 0, 0, 0, 0,
                                           StrToInt(dblTipoCota.lookupvalue),
                                           0, 0, 0,
                                           qryTipoOperTx.FieldByName('FLGCONTAINVEST').AsInteger) Then
              Raise Exception.Create('Ocorreu um problema na integralização do Contábil/Financeiro na Taxa de Ingresso da Operação.');

           qryDetalhe.FieldByName('PLANO').Clear;
           if iPlano > 0 then
              qryDetalhe.FieldByName('PLANO').AsInteger     := iPlano;

           qryDetalhe.FieldByName('PLNCODIGO').Clear;
           if iPlanilha > 0 then
              qryDetalhe.FieldByName('PLNCODIGO').AsInteger := iPlanilha;

           qryDetalhe.FieldByName('CODDOCUMENTO').Clear;
           if iDocumento > 0 then
           qryDetalhe.FieldByName('CODDOCUMENTO').AsInteger := iDocumento;

           qryDetalhe.Post;
           qryDetalhe.CommitUpdates;

        end;

        inherited;

        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Commit;

        //Al_23
        //Al_9
        aplicaAlteracoes([qryDetalhe]);
        pnlControlesDet.SendToBack;
        CmeDetalhe.Cancel(Self);

        OperComum.LimpaParametros(QryTipoFundoInvest);
        QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                           qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        QryTipoFundoInvest.Open;

        If StrToDate(dbdDta.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
        begin
           //Alt_1
           If Not Reprocessamento(iTipoInvestUsu,
                                  qryInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                  qryInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                  iPlanPrevCtbPatro,
                                  StrToDate(dbdDta.Text),
                                  QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                  qryInvest.FieldByName('DTAINIPROC').AsDateTime,
                                  True,
                                  QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger) Then
              MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                     'Mensagem do Sistema', MtInformation,[MbOk],0)
           else
              MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
        end
        else
           MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      Except
        On E:Exception Do Begin
          //Al_6
          //AL_38
          MsgDlg('Não foi possível efetuar a operação' + #13 +
                 'Mensagem: ' + #13 + E.Message,
                 'Mensagem do Sitema',mtWarning,[mbOk],0);
          dtmBaseDados.dbBaseDados.Rollback;
          //Al_32
          pnlControlesDet.SendToBack;
          CmeDetalhe.Cancel(Self);
          AplicaAlteracoes([qryDetalhe]);
        End;
      End;
   finally
      //Al_32
      bbtnCancelarDetClick(Sender);
      StatusGeral;
      PreparaGrid;
      QryAux.Close;
      QryAux1.Close;
      QryTipoFundoInvest.Close;
      //Al_40
      OperComum.LimpaParametros(DmFundoComum.qryCotaIntegrFundo);
   end;
end;

procedure TfrmCadCotasIntegrDirCred.StatusGeral;
begin
   //AL_27
   sbtnProcurar.Enabled := True;

   pnlMestre.Enabled    := True;

   //AL_34
   TipoFundo.Enabled    := True;
   dblTipoFundo.Enabled := True;
   Investimento.Enabled := True;
   dblInvest.Enabled    := True;
   tipocota.Enabled     := True;
   dblTipoCota.Enabled  := True;

   //AL_34
   if ((Trim(dblTipoFundo.Text) = '') or
       (Trim(dblInvest.Text) = '') or
       (Trim(dblTipoCota.Text) = '')) then
   begin
      sbtnInsDet.Enabled    := False;
      sbtnAltDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
   end
   else
   begin
      sbtnInsDet.Enabled    := True;
      if qryDetalhe.IsEmpty then
      begin
         sbtnAltDet.Enabled    := False;
         sbtnExcluiDet.Enabled := False;
         sbtnConsDet.Enabled   := False;
      end
      else
      begin
         sbtnAltDet.Enabled    := True;
         sbtnExcluiDet.Enabled := True;
         sbtnConsDet.Enabled   := True;
      end;
   end;
   bbtnOkDet.Visible := True;
   bbtnCancelarDet.Visible := True;

   bbtnOkDet.Enabled       := False;
   bbtnCancelarDet.Enabled := False;
   bbtnVoltarDet.Enabled   := False;
   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
   //AL_43
   pgcOperacao.ActivePage  := tbsOper;   
   tbsOper.Enabled         := True;
   tbsTaxa.Enabled         := True;

end;

procedure TfrmCadCotasIntegrDirCred.StatusInclui;
begin
   sbtnProcurar.Enabled    := False;
   dblInvest.Enabled       := False;

   sbtnExcluiDet.Enabled   := False;
   //AL_43
   pgcOperacao.ActivePage  := tbsOper;
   tbsOper.Enabled         := True;
   tbsTaxa.Enabled         := True;

   bbtnOkDet.Enabled       := True;
   bbtnCancelarDet.Enabled := True;
   bbtnVoltarDet.Enabled   := True;
end;

// AL_7
//AL_43

function  TfrmCadCotasIntegrDirCred.VerificaResgates : Boolean;
begin
   //AL_43
   if not FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE IDTIPOOPERACAO <> -174 AND IDOPERACAOORIGEM = '+
                           qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsString) then   
      Result := True;
   QryAux.Close;
end;

procedure TfrmCadCotasIntegrDirCred.FormShow(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;

  //AL_34
  //AL_43
  OperComum.LimpaParametros(QryTipoFundo);
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;
  if QryTipoFundo.RecordCount = 1 then
  begin
     dblTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;
     dblTipoFundo.PerFormSearch;
  end;

  //AL_34
 //Abre Qry's
  OperComum.LimpaParametros(qryInvest);
  qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  //AL_43
  if (Trim(dblTipoFundo.Text) <> '') then
  begin
     qryInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
     qryInvest.ParamByName('DATAMOVFUNDO').AsString       := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
  end;
  qryInvest.Open;

  //AL_43
  OperComum.LimpaParametros(QryTipoCota);  
  QryTipoCota.Open;

  //AL_43

//Mostra a Grid do Detalhe
  dbgrdDet.BringToFront;

// Carrega quantidade de casas decimais
  Decimais;

// Define o status dos controles do form
  StatusGeral;

  //AL_34
  //Al_25
  //AL_43
  OperComum.LimpaParametros(qryTipoOperacao);
  qryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryTipoOperacao.Open;
  if qryTipoOperacao.IsEmpty then
  begin
     if iTipoInvestUsu = 9 then
        MsgDlg('O tipo de operação Integralização de Cotas(-100), não foi cadastrado! Não será possível efetuar a operação.',
               'Mensagem do Sistema',mtInformation,[MbOk],0)
     else
        MsgDlg('O tipo de operação Integralização de Cotas(-100), não foi cadastrado! Não será possível efetuar a operação.',
               'Mensagem do Sistema',mtInformation,[MbOk],0);
  end;

  //AL_43
  OperComum.LimpaParametros(qryTipoOperTx);
  qryTipoOperTx.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  qryTipoOperTx.Open;

  //Al_6
  iFlgContaInvest := qryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger;
  iIdTipoOperacao := qryTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger;
  sDescOperacao   := qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;

  //AL_43
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro));

  //AL_34
  if QryTipoFundo.RecordCount = 1 then
  begin
     if dblInvest.CanFocus then
        dblInvest.SetFocus;
  end
  else
  begin
     if dblTipoFundo.CanFocus then
        dblTipoFundo.SetFocus;  
  end;
end;

Procedure TfrmCadCotasIntegrDirCred.Decimais;
var tmpQry : TQuery;
begin
   tmpQry := TQuery.Create(Self);
   tmpQry.DatabaseName := 'BaseDados';
   tmpQry.sql.Add('SELECT MAX(QTDDECQTD) AS DECIMAIS FROM FUNDOINVEST');
   tmpQry.Open;

   if tmpQry.RecordCount > 0 then
      DBEQtdCOTA.DecDigits := tmpQry.FieldByName('DECIMAIS').AsInteger
   else
      DBEQtdCOTA.DecDigits := 0;

   tmpQry.Free;
end;

procedure TfrmCadCotasIntegrDirCred.dblInvestCloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified : Boolean);
begin
  inherited;
   //AL_34
   //AL_28
   bMod := modified;
   //AL_43
   if ((modified) and (Trim(dblTipoFundo.Text) <> '') and (Trim(dblInvest.Text) <> '') and
       (Trim(dblTipoCota.Text) <> '')) then
      PreparaGrid;
end;

procedure TfrmCadCotasIntegrDirCred.dblTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   //AL_34
   //AL_28
   bMod := modified;
   //AL_43
   if ((modified) and (Trim(dblTipoFundo.Text) <> '') and (Trim(dblInvest.Text) <> '') and 
       (Trim(dblTipoCota.Text) <> '')) then
      PreparaGrid;
end;

procedure TfrmCadCotasIntegrDirCred.dblTipoCotaExit(Sender: TObject);
begin
  inherited;
   //AL_34
   //AL_28
   //AL_43
   if ((not bMod) and (Trim(dblTipoFundo.Text) <> '') and (Trim(dblInvest.Text) <> '') and
       (Trim(dblTipoCota.Text) <> '') and (sVarAnt <> dblTipoCota.LookupValue)) then
      PreparaGrid;

   bMod := false;
end;

procedure TfrmCadCotasIntegrDirCred.dblInvestExit(Sender: TObject);
begin
  inherited;
   //AL_34
   //AL_28
   //AL_43
   if ((not bMod) and (Trim(dblTipoFundo.Text) <> '') and (Trim(dblInvest.Text) <> '') and
       (sVarAnt <> dblInvest.LookupValue) and (Trim(dblTipoCota.Text) <> '')) then
      PreparaGrid;

   bMod := false;   
end;

// AL_7
//AL_43

procedure TfrmCadCotasIntegrDirCred.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;

    QryDetalhe.Cancel;

    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Rollback;

    sbtnConsDet.Down := False;

    StatusGeral;
end;

procedure TfrmCadCotasIntegrDirCred.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;

    QryDetalhe.Cancel;

    If dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Rollback;

    sbtnConsDet.Down := False;

    StatusGeral;
end;

procedure TfrmCadCotasIntegrDirCred.sbtnAltDetClick(Sender: TObject);
begin
//  Transforma o botão de alteração em botão de consulta
//  inherited;
   if sbtnAltDet.Down then
   begin
      Dock974.Visible := True;
      tb97Detalhe.Visible := True;
      pnlControlesDet.BringToFront;
      bbtnOkDet.Visible := False;
      bbtnCancelarDet.Visible := False;
      bbtnVoltarDet.Enabled := True;
      bbtnVoltarDet.Visible := True;
   end
   else
      bbtnVoltarDet.Click;
end;

//AL_15
procedure TfrmCadCotasIntegrDirCred.dbdDtaExit(Sender: TObject);
begin
  inherited;
   OperComum.LimpaParametros(QryCotasIntegraliza);
   QryCotasIntegraliza.ParamByName('IDFUNDOINVEST').AsInteger       := StrToInt(dblInvest.LookupValue);
   QryCotasIntegraliza.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrevCtbPatro;
   //AL_35
   If Trim(dblTipoCota.Text) <> '' then
      QryCotasIntegraliza.ParamByName('IDTIPOCOTA').AsInteger       := StrToInt(dblTipoCota.LookupValue);
   //Al_23
   QryCotasIntegraliza.ParamByName('IDTIPOINVEST').AsInteger        := iTipoInvestUsu;
   QryCotasIntegraliza.ParamByName('DATAHISTCOTAINTEG').AsString    := dbdDta.Text;
   QryCotasIntegraliza.Open;

   if QryCotasIntegraliza.IsEmpty Then
   begin
      MsgDlg('Não há Quantidade de Cotas a Integralizar para esse Fundo de Investimento.','Mensagem do Sistema',
             mtInformation,[MbOk],0);
      bbtnCancelarDetClick(Sender);
      //AL_34
      if dblTipoCota.CanFocus then
         dblTipoCota.SetFocus;
   end
   else
   begin
      if dblDataIntegraliza.CanFocus then
         dblDataIntegraliza.SetFocus;

      //AL_43
      if QryCotasIntegraliza.RecordCount = 1 Then
      begin
         dblDataIntegraliza.Text        := QryCotasIntegraliza.fieldByname('DATAAPLICACAO').AsString;
         dblDataIntegraliza.LookupValue := QryCotasIntegraliza.fieldByname('ID').AsString;
      end;
   end;
end;

procedure TfrmCadCotasIntegrDirCred.dblDataIntegralizaExit(Sender: TObject);
//AL_35
var DadosCota : TDadosCota;
begin
   inherited;
   //AL_35
   if ((Not bModif) and (Trim(dblDataIntegraliza.Text) <> '')) then
   begin
      //AL_13
      DBEQtdCota.Value := QryCotasIntegraliza.FieldByName('QTDHISTCOTAINTEGR').AsFloat;
      If ((dbdDta.Text <> '') And (QryDetalhe.State = dsInsert)) Then
      begin
         // Busca dados da Cota
         DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                                 StrToInt(dblInvest.LookupValue),
                                                 StrToDate(dbdDta.Text));

         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
         DBEVlrCota.Value   := DadosCota.VlrCota;

         QryAux.Close;
      end;
   end;

   bModif := False;
end;

procedure TfrmCadCotasIntegrDirCred.PreparaGrid;
begin
   if ((Trim(dblInvest.Text) <> '') And (Trim(dblTipoCota.Text) <> '')) then
   begin
      inherited;
      //AL_34
      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.ParambyName('IDFUNDOINVEST').asInteger     := StrToInt(dblInvest.LookupValue);
      qryDetalhe.ParambyName('IDTIPOCOTA').asInteger        := StrToInt(dblTipoCota.LookupValue);
      qryDetalhe.ParambyName('IDTIPOFUNDOINVEST').asInteger := StrToInt(dblTipoFundo.LookupValue);
      qryDetalhe.ParambyName('IDTIPOINVEST').asInteger      := iTipoInvestUsu;
      qryDetalhe.ParambyName('IDPLANPREVCTBPATR').asInteger := iPlanPrevCtbPatro;
      qryDetalhe.Open;

      sbtnInsDet.Enabled    := True;
      sbtnExcluiDet.Enabled := True;
      dblInvest.Enabled     := True;

      case dsDet.State of
           dsInsert : dbdDta.SetFocus;
      end;

      // Altera Formato do Valor da Cota      
      DBEQtdCota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      qryDetalheQTDOPERACAO.DisplayFormat := MontaMascaraDecQtd(StrToInt(dblInvest.LookupValue));
      DBEVlrCota.DecDigits   := QryInvest.FieldByName('QTDDECVALOR').AsInteger;
      qryDetalheVLRCOTA.DisplayFormat := MontaMascaraDecVlr(StrToInt(dblInvest.LookupValue));

      qryDetalheVLRDESCONTO.DisplayFormat := '###,###,###,#0.00';
      qryDetalheVLROPERACAO.DisplayFormat := '###,###,###,#0.00';
      qryDetalheVLRPAGO.DisplayFormat     := '###,###,###,#0.00';
      //AL_43
      qryDetalheVLRTAXAS.DisplayFormat    := '###,###,###,#0.00';      
      //AL_13
      QryCotasIntegralizaQTDHISTCOTAINTEGR.DisplayFormat := MontaMascaraDecQtd(StrToInt(dblInvest.LookupValue));

      OperComum.LimpaParametros(QryCotasIntegraliza);
      QryCotasIntegraliza.ParamByName('IDFUNDOINVEST').AsInteger    := StrToInt(dblInvest.LookupValue);
      QryCotasIntegraliza.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
      //AL_35
      If Trim(dblTipoCota.Text) <> '' then
         QryCotasIntegraliza.ParamByName('IDTIPOCOTA').AsInteger    :=  StrToInt(dblTipoCota.LookupValue);
      //AL_13 - Fim
      QryCotasIntegraliza.Open;
   end
   else
   begin
      sbtnInsDet.Enabled    := False;
      sbtnExcluiDet.Enabled := False;
      dblInvest.Enabled     := True;

      case dsDet.State of
           dsInsert : dbdDta.SetFocus;
      end;

      // Altera Formato do Valor da Cota
      DBEQtdCota.DecDigits   := QryInvest.FieldByName('QTDDECQTD').AsInteger;
      qryDetalheQTDOPERACAO.DisplayFormat := MontaMascaraDecQtd(StrToInt(dblInvest.LookupValue));
      DBEVlrCota.DecDigits   := QryInvest.FieldByName('QTDDECVALOR').AsInteger;
      qryDetalheVLRCOTA.DisplayFormat := MontaMascaraDecVlr(StrToInt(dblInvest.LookupValue));

      qryDetalheVLRDESCONTO.DisplayFormat := '###,###,###,#0.00';
      qryDetalheVLROPERACAO.DisplayFormat := '###,###,###,#0.00';
      qryDetalheVLRPAGO.DisplayFormat     := '###,###,###,#0.00';
      //AL_43
      qryDetalheVLRTAXAS.DisplayFormat    := '###,###,###,#0.00';      
      //AL_13
      QryCotasIntegralizaQTDHISTCOTAINTEGR.DisplayFormat := MontaMascaraDecQtd(StrToInt(dblInvest.LookupValue));

      OperComum.LimpaParametros(QryCotasIntegraliza);
      QryCotasIntegraliza.Open;
   end;
   // Define o status dos controles do form
   StatusGeral;
end;


//AL_34
procedure TfrmCadCotasIntegrDirCred.FormCreate(Sender: TObject);
begin
  inherited;
  //Al_32 
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST   = '+IntToStr(iTipoInvestUsu));
  //AL_38
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro));  
end;

//AL_34
procedure TfrmCadCotasIntegrDirCred.dblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bMod := modified;
   if modified then
   begin
      OperComum.LimpaParametros(qryInvest);
      qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      //AL_43
      if (Trim(dblTipoFundo.LookupValue) <> '') then
      begin
         qryInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
         qryInvest.ParamByName('DATAMOVFUNDO').AsString       := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      end;
      qryInvest.Open;

      qryDetalhe.Close;

      StatusGeral;      
   end;
end;

//AL_34
procedure TfrmCadCotasIntegrDirCred.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
   //AL_43
   if ((not bMod) and (Trim(dblTipoFundo.Text) <> '') and (sVarAnt <> dblTipoFundo.LookupValue)) then
   begin
      OperComum.LimpaParametros(qryInvest);
      qryInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      if (Trim(dblTipoFundo.LookupValue) <> '') then
      begin
         qryInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
         qryInvest.ParamByName('DATAMOVFUNDO').AsString       := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      end;
      qryInvest.Open;

      qryDetalhe.Close;      

      StatusGeral;      
   end;
   bMod := false;
end;

//Al_34
function TfrmCadCotasIntegrDirCred.VerIntegralizaCotas : Boolean;
begin
   OperComum.LimpaParametros(QryVerIntegrCotas);
   QryVerIntegrCotas.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
   QryVerIntegrCotas.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryVerIntegrCotas.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryVerIntegrCotas.ParamByName('DATAHISTCOTAINTEG').AsString  := dbdDta.Text;
   //Al_41
   QryVerIntegrCotas.ParamByName('IDOPERACAOFUNDO').AsInteger   := StrToInt(dblDataIntegraliza.LookupValue);
   QryVerIntegrCotas.Open;

   Result := True;

   if not QryVerIntegrCotas.IsEmpty then
   begin
      if QryVerIntegrCotas.FieldByName('QTDHISTCOTAINTEGR').AsFloat = 0 then
      begin
         MsgDlg('A subscrição do dia  "'+dblDataIntegraliza.Text+'" já sofreu Integralização de Cotas Total. '#13+
                'Verificar lançamentos Futuros.','Mensagem do Sistema', mtInformation,[MbOk],0);
         Result := False;
      end;
   end;

   OperComum.LimpaParametros(QryVerIntegrCotas);
end;   

procedure TfrmCadCotasIntegrDirCred.sbtnConsDetClick(Sender: TObject);
begin
  inherited;
   bbtnVoltarDet.Enabled   := True;
   sbtnConsDet.Enabled     := False;
   sbtnInsDet.Enabled      := False;
   sbtnExcluiDet.Enabled   := False;
   TipoFundo.Enabled       := False;
   dblTipoFundo.Enabled    := False;
   dblInvest.Enabled       := False;
   Investimento.Enabled    := False;
   Tipocota.Enabled        := False;
   dblTipoCota.Enabled     := False;
   //AL_43
   pgcOperacao.ActivePage  := tbsOper;
   tbsOper.Enabled         := False;
   tbsTaxa.Enabled         := False;
   sbtnProcurar.Enabled    := False;

   //AL_43
   OperComum.LimpaParametros(QryCotasIntegraliza);
   QryCotasIntegraliza.ParamByName('IDTIPOINVEST').AsInteger        := iTipoInvestUsu;
   QryCotasIntegraliza.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrevCtbPatro;   
   If Trim(dblInvest.Text) <> '' then
      QryCotasIntegraliza.ParamByName('IDFUNDOINVEST').AsInteger    := StrToInt(dblInvest.LookupValue);
   If Trim(dblTipoCota.Text) <> '' then
      QryCotasIntegraliza.ParamByName('IDTIPOCOTA').AsInteger       := StrToInt(dblTipoCota.LookupValue);
   QryCotasIntegraliza.ParamByName('DATAHISTCOTAINTEG').AsString    := qryDetalhe.FieldByName('DATAOPERACAO').AsString;
   QryCotasIntegraliza.Open;
end;

//AL_43
procedure TfrmCadCotasIntegrDirCred.dblTipoFundoEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblTipoFundo.LookupValue;
end;

//AL_43
procedure TfrmCadCotasIntegrDirCred.dblInvestEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblInvest.LookupValue;
end;

//AL_43
procedure TfrmCadCotasIntegrDirCred.dblTipoCotaEnter(Sender: TObject);
begin
  inherited;
   sVarAnt := dblTipoCota.LookupValue;
end;

//AL_43
procedure TfrmCadCotasIntegrDirCred.bbtnSairClick(Sender: TObject);
begin
   qryDetalhe.Open;
  inherited;

end;

//AL_43
procedure TfrmCadCotasIntegrDirCred.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   OperComum.LimpaParametros(qryTipoOperTx);
   OperComum.LimpaParametros(qryTipoOperacao);
   OperComum.LimpaParametros(qryDetalhe);
   OperComum.LimpaParametros(QryTipoFundo);
   OperComum.LimpaParametros(qryInvest);
   OperComum.LimpaParametros(QryTipoCota);
   OperComum.LimpaParametros(QryVerOperSubDia);
   OperComum.LimpaParametros(QryCotasIntegraliza);
   OperComum.LimpaParametros(QryTipoFundoInvest);
   OperComum.LimpaParametros(QryVerIntegrCotas);
   OperComum.LimpaParametros(qryAux);
   OperComum.LimpaParametros(qryAux1);
end;

end.
