//******************************************************************************
// Data      : 28/05/2007
// Código    : AL_12
// Pendencia : 24176
// Motivo    : Implementação de otimização e atualização da query qryDetalhe, que
//             busca o saldo.
//******************************************************************************
// Data      : 28/05/2007
// Código    : AL_11
// Pendencia : 24176
// Motivo    : Implementação para excluir mais de cancalemaneto no mesmo dia
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_10
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_9
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 11/01/2007
// Código    : AL_8
// Pendencia : 24176
// SOL       :
// Desc      : Acerto na query que identifica o tipo de fundo
//******************************************************************************
// Data      : 11/01/2007
// Código    : AL_7
// Desc      : Ajuste na busca do Fundo.
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_6
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_5
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 02/09/2005
// Código   : AL_4
// Motivo   : Implementação da variação e retirada a gravação do contabil na histfundo(QryUpdHistFundo)
//******************************************************************************
// Data     : 30/05/2005
// Código   : AL_3
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_2
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoInvest e na funcao Reprocessamento
//******************************************************************************
//Data	    : 25/08/2004
//Origem    : FUNCEF
//Motivo(S) : Criação
//******************************************************************************

unit FCadCancelaSubsCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbedit, Mask, wwdblook, DBCtrls2, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, TREdit, wwriched, fcLabel,
  //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
  UFundoComum, uCtrlInvContab, uCMMath;

type

  TfrmCadCancelaSubsCotas = class(TfrmCadMestreDetalheCS)
    qryDetalhe: TwwQuery;
    dblInvest: TwwDBLookupCombo;
    Investimento: TLabel;
    QryFundoInvest: TwwQuery;
    dsInvest: TwwDataSource;
    updDet: TUpdateSQL;
    QryFundoInvestIDFUNDOINVEST: TFloatField;
    QryFundoInvestDESCFUNDOINVEST: TStringField;
    QryFundoInvestIDGESTORCARTEIRA: TFloatField;
    QryFundoInvestTRGDTINCLUSAO: TDateTimeField;
    QryFundoInvestTRGUSERINCLUSAO: TStringField;
    QryFundoInvestMOECODIGO: TFloatField;
    QryFundoInvestIDCARTEIRAINVEST: TFloatField;
    QryFundoInvestIDTIPOFUNDOINVEST: TFloatField;
    QryFundoInvestCNPJFUNDO: TStringField;
    QryFundoInvestSTAEXCLUSIVO: TStringField;
    QryFundoInvestPZOCARENCIA: TFloatField;
    QryFundoInvestPZOANIVERSARIO: TFloatField;
    QryFundoInvestPZOLIQAPLIC: TFloatField;
    QryFundoInvestPZOLIQRESG: TFloatField;
    QryFundoInvestQTDDECQTD: TFloatField;
    QryFundoInvestQTDDECVALOR: TFloatField;
    QryFundoInvestSTAFUNDO: TStringField;
    QryFundoInvestPZOAMORTIZACAO: TFloatField;
    QryFundoInvestPERCTXPERFORM: TFloatField;
    QryFundoInvestPERCTXADM: TFloatField;
    QryFundoInvestCODFUNCETIP: TStringField;
    QryFundoInvestSTAPROVISIONAIR: TStringField;
    QryFundoInvestSTAPROVISIONAIOF: TStringField;
    QryFundoInvestCONTRCETIP: TStringField;
    DblTipoFundo: TwwDBLookupCombo;
    Label7: TLabel;
    QryTipoFundo: TwwQuery;
    QryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoIDTIPOINVEST: TFloatField;
    QryTipoFundoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoDATAULTFECH: TDateTimeField;
    DbDtRefSaldo: TCMDateTimePicker;
    Label1: TLabel;
    qryDetalheDESCFUNDOINVEST: TStringField;
    qryDetalheIDPLANPREVCTBPATR: TFloatField;
    qryDetalheIDTIPOINVEST: TFloatField;
    qryDetalheIDCARTEIRAINVEST: TFloatField;
    qryDetalheIDFUNDOINVEST: TFloatField;
    qryDetalheDATAAPLICACAO: TDateTimeField;
    qryDetalheDATAMOVFUNDO: TDateTimeField;
    qryDetalheVLRAPLICADO: TFloatField;
    qryDetalheSALDOVLRFUNDO: TFloatField;
    qryDetalheVLRCOTAAPLICACAO: TFloatField;
    qryDetalheDATAULTPGTOIR: TDateTimeField;
    qryDetalheVLRIRPROV: TFloatField;
    qryDetalheVLRIOFPROV: TFloatField;
    qryDetalheVLRVARIACAO: TFloatField;
    QryInsertOperacaoFundo: TwwQuery;
    dsTipoFundo: TDataSource;
    dbgrdDetIButton: TwwIButton;
    qryUltimoMovimento: TwwQuery;
    qryUltimoMovimentoDATAMOVFUNDO: TDateTimeField;
    qryDetalheSALDOQTDCOTAS: TFloatField;
    //Al_4
    QryAux: TwwQuery;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    Panel1: TPanel;
    pnlObs: TPanel;
    memObs: TMemo;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtQtdCota: TDBRealEdit;
    edtQtdCancelada: TRealEdit;
    QryUpdOperacaoApl: TwwQuery;
    QryBuscaOperacao: TwwQuery;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    QryTipoFundoInvest: TwwQuery;
    QryUpdOperAjusteCert: TwwQuery;
    Panel2: TPanel;
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    edtQtdAtual: TRealEdit;
    Label5: TLabel;
    QryOperAjusteCert: TwwQuery;
    QryFundoInvestDTAINIPROC: TDateTimeField;
    //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
    QryTipoCota: TwwQuery;
    dblTipoCota: TwwDBLookupCombo;
    lbTipoCota: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DblTipoFundoChange(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure dblInvestChange(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblInvestEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure edtQtdCanceladaExit(Sender: TObject);
    procedure DbDtRefSaldoChange(Sender: TObject);
    procedure DblTipoFundoExit(Sender: TObject);
    procedure DblTipoFundoEnter(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure DbDtRefSaldoExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
    procedure dblTipoCotaChange(Sender: TObject);
    procedure dblTipoCotaEnter(Sender: TObject);
    procedure dblTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

  private
    { Private declarations }
    wQtdDec : Integer;
    // AL_3
    wMuda   : Boolean;
    sMascara: String;
    wTipoInv: String;
    procedure AjustaQuant(pQtdDec: Integer);
    procedure FazQry;
  public
    { Public declarations }
  end;

var
  frmCadCancelaSubsCotas: TfrmCadCancelaSubsCotas;
  bSair       : Boolean;
  DadosCota   : TDadosCota;
  //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
  iQtdDec     : Integer;

implementation

uses UDataBase, uMensErro,UDiasUteisInv, dFundoComum, dBaseDados,
     UOperComum, UBibliotecaInvest, FTelaAut, FParamOperAjuste;
{$R *.DFM}

procedure TfrmCadCancelaSubsCotas.FormShow(Sender: TObject);
begin
  bSair                   := False;
  sbtnAltDet.Enabled      := False;
  sbtnExcluiDet.Enabled   := False;  
  dbgrdDet.BringToFront;
  dbgrdDet.Enabled        := False;
  pnlControlesDet.Enabled := False;
  QryFundoInvest.Open;
  //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
  QryTipoCota.Open;
  lbTipoCota.Visible      := (iTipoInvestUsu in [9,10]);
  dblTipoCota.Visible     := (iTipoInvestUsu in [9,10]);
end;

procedure TfrmCadCancelaSubsCotas.bbtnOkDetClick(Sender: TObject);
var wTipo    : Char;
    sMessage, slMascara, wTipoRecDesBol, sMens : String;
    iPlanilha, iDocumento, iPlano, iIDOperacao, I,
    iTipoOperacao, iIdForCli, iIdHistFundo        : Integer;

    dDataAntCanc : TDateTime;

    bCriaLancto  : boolean;

    fVlrCustoAcoes, fVlrVarAcoes            : Currency;

    fVlrCotaApl, fVlrCotaAtu, fVlrCotaCusto : Double;
begin

  // Contabiliza o Ajuste
  iPlanilha      := -1;
  iDocumento     := -1;
  iPlano         := -1;

  bCriaLancto    := False;
  wTipoRecDesBol := '';

  fVlrCustoAcoes := 0;
  fVlrVarAcoes   := 0;

  iTipoOperacao  := -106;

  // AL_3 - Inicio
  //AL_6
  if not CtrlInvContab.TestaPeriodo(DbDtRefSaldo.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     Exit;
  end;

  //AL_5
  if VerEmAbertura(QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  try
    // Busca dados da Cota
    DadosCota       := UFundoComum.BuscaCotaFundo(QryAux,
                                   qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                   qryDetalhe.FieldByName('DATAAPLICACAO').AsDateTime);

    fVlrCotaCusto   := DadosCota.VlrCota;

    fVlrCustoAcoes  := OperComum.Round(edtQtdCancelada.Value*fVlrCotaCusto,2);

    dDataAntCanc    := DbDtRefSaldo.Date - 1;
    While not DiasUteisInv.DiaUtil(dDataAntCanc,-1,1,'',True,False,False) Do
       dDataAntCanc := dDataAntCanc - 1;

    DadosCota       := UFundoComum.BuscaCotaFundo(QryAux,
                                   qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                   dDataAntCanc);

    fVlrVarAcoes    := OperComum.Round(edtQtdCancelada.Value*(DadosCota.VlrCota-fVlrCotaCusto),2);

    with qryTipoOperacao do
    begin
       Close;
       //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
       ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvestUsu;
       ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
       Open;
       //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
       if IsEmpty then
       begin
          MsgDlg('O tipo de operação "Cancelamento de Cotas"(código -106) não foi cadatrado para o Tipo de Fundo!'#13+
                 'Por favor parametrizar o mesmo no Cadastro de Tipo de Operação.',
                 'Mensagem do Sistema', MtInformation ,[MbOk],0);
          Exit;
       end;
    end;

    // Inicia Transação
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    //  Atualiza a Tabela de Operações de Fundos
    with QryInsertOperacaoFundo do
    begin
       iIDOperacao := LeUltRegistro(Nil,'OPERACAOFUNDO');
       Close;
       ParamByName('IDOPERACAOFUNDO').AsInteger   := iIDOperacao;
       ParamByName('IDCARTEIRAINVEST').AsInteger  := qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger;
       ParamByName('IDTIPOINVEST').AsInteger      := qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger;
       ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
       ParamByName('IDFUNDOINVEST').AsInteger     := qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
       ParamByName('DATAOPERACAO').AsDateTime     := DbDtRefSaldo.DateTime;
       ParamByName('DATACOTIZACAO').AsDateTime    := DbDtRefSaldo.DateTime;
       ParamByName('DATALIQUIDACAO').AsDateTime   := DbDtRefSaldo.DateTime;
       ParamByName('QTDOPERACAO').AsFloat         := edtQtdCancelada.Value;
       ParamByName('VLROPERACAO').AsFloat         := OperComum.Round(edtQtdCancelada.Value * DadosCota.VlrCota,2);
       ParamByName('VLRCOTA').AsFloat             := DadosCota.VlrCota;
       ParamByName('VLRIR').AsFloat               := 0;
       ParamByName('VLRIOF').AsFloat              := 0;
       ParamByName('VLRRENDIMENTO').AsFloat       := 0;
       ParamByName('IDOPERACAOORIGEM').AsInteger  := qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
       ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
       ParamByName('OBSERVACAO').AsString         := copy(memObs.Text,1,300);
       ParamByName('STACONFIRMA').Clear;
       ParamByName('IDPEDIDOFUNDO').Clear;
       //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
       if ((dblTipoCota.Text <> '') and (iTipoInvestUsu in [9,10])) then
          ParamByName('IDTIPOCOTA').AsInteger     := StrToInt(dblTipoCota.Lookupvalue);
       if not(Prepared) then
          Prepare;
       ExecSql;
       Close;
    end;

    //Al_4
    //AL_9
    //Rotina de confirmação das operações
    If Not AlimentaFundo(qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
                         iTipoOperacao,
                         qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
                         qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                         iPlanoPrevContab,
                         iPatrocinadora,
                         iIDOperacao,
                         qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
                         QryFundoInvest.FieldByName('QTDDECQTD').AsInteger,
                         QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                         iIdForCli,
                         qryDetalhe.FieldByName('DATAAPLICACAO').AsDateTime,
                         DbDtRefSaldo.DateTime,
                         DbDtRefSaldo.DateTime,
                         edtQtdCancelada.Value,
                         DadosCota.VlrCota,
                         OperComum.Round(edtQtdCancelada.Value*DadosCota.VlrCota,2),
                         0, 0, qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                         qryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString+' / '+dblInvest.Text,
                         'OPE' , True, iPlanPrevCtbPatro, -1, -1,
                         //Ricardo Cristiano - 24/02/2010 - N. Sol 131393 -  N. Kintana 747826
//                         OperComum.Round(edtQtdCancelada.Value * DadosCota.VlrCota,2), sMens,                         
                         0, sMens,
                         //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
                         OperComum.IIF(((dblTipoCota.Text <> '') and (iTipoInvestUsu in [9,10])), StrToInt(dblTipoCota.Lookupvalue), -1)) Then
    begin
       //AL_9
       if sMens <> '' then
          Raise Exception.Create(sMens)
       else
          Raise Exception.Create('Ocorreu um problema durante o processo de gravação' + #13 +
                                 'Refaça a operação');
    end;

    //Al_2
    If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                    iTipoOperacao,
                                    qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
                                    -1,
                                    StrToInt(DblTipoFundo.LookupValue),
                                    iIdForCli,
                                    qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                    DbDtRefSaldo.Date,
                                    DbDtRefSaldo.Date,
                                    'OPE',
                                    qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                    dblInvest.Text+' / '+sPlanPrevCtbPatro,
                                    True, 0, 0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes) Then
    begin
       MsgDlg('Atenção: Ocorreu um erro na contabilização do Cancelamento de Subscrição de Cotas.',
              'Mensagem do Sistema', MtWarning, [MbOk], 0);
       dtmBaseDados.dbBaseDados.Rollback;
       Exit;
    end;

    //Al_4
    if (iPlanilha > 0) And (iPlanilha > 0) then
    begin
       With QryUpdOperacaoApl Do
       Begin
         Close;
         ParamByName('IDOPERACAOFUNDO').AsInteger := iIDOperacao;
         ParamByName('PLANO').AsInteger           := iPlano;
         ParamByName('PLNCODIGO').AsInteger       := iPlanilha;
         ExecSQL;
         Close;
       end;
    end;

    dtmBaseDados.dbBaseDados.Commit;

    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                          QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    if DbDtRefSaldo.Date < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       //Alt_1
       If Not Reprocessamento(iTipoInvestUsu,
                              QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              DbDtRefSaldo.Date,
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                              True,
                              //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
                              OperComum.IIF(((dblTipoCota.Text <> '') and (iTipoInvestUsu in [9,10])), StrToInt(dblTipoCota.Lookupvalue), -1)) Then
          //AL_10                              
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end;

    dblInvestChange(Self);
    dblInvestCloseUp(Self,QryFundoInvest,nil,True);

  Except
     //AL_9
     On E:Exception Do Begin
        MsgDlg('Ocorreu um problema ao Incluir o Ajuste.'#13+
               'Mensagem: '#13+ E.Message,
               'Mensagem do Sistema',mtWarning,[mbOk],0);
        // Cancela Transação
        dtmBaseDados.dbBaseDados.Rollback;
     end;
  end;

  dblInvestChange(Self);

// Volta Ambiente
  dbgrdDet.BringToFront;
  CmeDetalhe.Cancel(Self);
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

end;

procedure TfrmCadCancelaSubsCotas.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadCancelaSubsCotas.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  QryDetalhe.Cancel;
  sbtnInsDet.Enabled    := False;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TfrmCadCancelaSubsCotas.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     //AL_7
     DblTipoFundo.LookupValue := MontaSelect.ValoresChave[1];
     DblTipoFundo.PerformSearch;

     DbDtRefSaldo.Text := MontaSelect.ValoresChave[2];
     DbDtRefSaldo.DateTime := StrToDate(MontaSelect.ValoresChave[2]);

     //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
     OperComum.LimpaParametros(QryFundoInvest);
     QryFundoInvest.ParamByName('DTAVIGENCIA').AsString       := MontaSelect.ValoresChave[2];
     QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsString := MontaSelect.ValoresChave[1];
     QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;
     QryFundoInvest.Open;

     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerFormSearch;

     qryDetalhe.Close;
     // Alterar a quantidade de casas decimais
     AjustaQuant(QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);
     qryDetalhe.ParambyName('DATAMOVFUNDO').asString       := MontaSelect.ValoresChave[2];
     qryDetalhe.ParambyName('IDFUNDOINVEST').AsString      := MontaSelect.ValoresChave[0];
     qryDetalhe.ParambyName('IDTIPOFUNDOINVEST').AsString  := MontaSelect.ValoresChave[1];
     qryDetalhe.ParambyName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     qryDetalhe.Open;

     sbtnAltDet.Enabled    := True;
     sbtnExcluiDet.Enabled := True;     
     dblInvest.Enabled     := True;

     dblInvestChange(Self);
     dblInvestCloseUp(Self,QryFundoInvest,nil,True);
  end;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadCancelaSubsCotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryFundoInvest.Close;
  QryTipoFundo.Close;
  QryDetalhe.Close;
  qryTipoOperacao.Close;

end;

procedure TfrmCadCancelaSubsCotas.DblTipoFundoChange(Sender: TObject);
begin
  inherited;
  wMuda := True;
end;

procedure TfrmCadCancelaSubsCotas.AjustaQuant(pQtdDec: Integer);
begin
  // Alterar a quantidade de casas decimais
  //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
  iQtdDec                     := pQtdDec; //variavel global - Renan
  wQtdDec                     := pQtdDec;
  edtQtdCota.DecDigits        := pQtdDec;
  edtQtdCota.IntDigits        := 21 - pQtdDec;

  edtQtdCancelada.DecDigits   := pQtdDec;
  edtQtdCancelada.IntDigits   := 21 - pQtdDec;

  edtQtdAtual.DecDigits       := pQtdDec;
  edtQtdAtual.IntDigits       := 21 - pQtdDec;
  
  qryDetalheSALDOQTDCOTAS.Precision     := pQtdDec;

  sMascara := MontaMascaraDecQtd(QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger);

  qryDetalheSALDOQTDCOTAS.DisplayFormat := sMascara;
  qryDetalheSALDOQTDCOTAS.EditFormat    := sMascara + ';' + sMascara;
end;

procedure TfrmCadCancelaSubsCotas.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDetClick(Sender);
end;

procedure TfrmCadCancelaSubsCotas.dblInvestChange(Sender: TObject);
begin
  inherited;
  wMuda := True;
end;

procedure TfrmCadCancelaSubsCotas.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
  if ( ((wMuda) and ((dblTipoCota.Text <> '') and (iTipoInvestUsu in [9,10])) ) or
     (  (wMuda) and (not (iTipoInvestUsu in [9,10])) ) )then
  begin
     FazQry;
     wMuda := False;
  end;

  edtQtdCota.DecDigits      := QryFundoInvestQTDDECQTD.AsInteger;
  edtQtdAtual.DecDigits     := QryFundoInvestQTDDECQTD.AsInteger;
  edtQtdCancelada.DecDigits := QryFundoInvestQTDDECQTD.AsInteger;  

end;

procedure TfrmCadCancelaSubsCotas.dblInvestEnter(Sender: TObject);
begin
  inherited;
  wMuda := False;
end;

procedure TfrmCadCancelaSubsCotas.FormCreate(Sender: TObject);
begin
  inherited;
  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;  
  if iTipoInvestUsu <> 0 then
     MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));
end;

procedure TfrmCadCancelaSubsCotas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then
     SelectNext(ActiveControl,True,True)

end;

procedure TfrmCadCancelaSubsCotas.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  AjustaQuant(QryFundoInvestQTDDECQTD.AsInteger);

  edtQtdCancelada.SelectAll;

  bbtnVoltarDet.SetFocus;

  edtQtdCancelada.SetFocus;
  edtQtdCancelada.SelectAll;

  // Pega data da última movimentação
  qryUltimoMovimento.Close;
  qryUltimoMovimento.ParamByName('IDFUNDOINVEST').AsInteger :=
                     qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
  qryUltimoMovimento.ParamByName('DATAAPLICACAO').AsDateTime :=
                     qryDetalhe.FieldByName('DATAAPLICACAO').AsDateTime;
  qryUltimoMovimento.Prepare;
  qryUltimoMovimento.Open;

  edtQtdAtual.Value       := 0;
  edtQtdCancelada.Value   := 0;
end;

procedure TfrmCadCancelaSubsCotas.edtQtdCanceladaExit(Sender: TObject);
begin
  inherited;

  //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
  If (RoundCM(edtQtdCancelada.Value, iQtdDec) > RoundCM(edtQtdCota.Value, iQtdDec)) Then
  Begin
     MsgDlg('A quantidade Cancelada tem que ser menor ou igual a quantidade Anterior !',
        'Mensagem do Sistema', MtInformation, [MbOk], 0);
     Exit;
  End;

  edtQtdAtual.Value  := edtQtdCota.Value - edtQtdCancelada.Value;

end;

procedure TfrmCadCancelaSubsCotas.DbDtRefSaldoChange(Sender: TObject);
begin
  inherited;
  wMuda := True;
end;

procedure TfrmCadCancelaSubsCotas.FazQry;
var Ok: Boolean;
begin
  Ok := True;
  if Trim(DblTipoFundo.Text) = '' then
     Ok := False;
  if Trim(dblInvest.Text) = '' then
     Ok := False;
  if Trim(DbDtRefSaldo.Text) = '' then
     Ok := False;
  //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748     
  if ((dblTipoCota.Text = '') and (iTipoInvestUsu in [9,10])) then
     Ok := False;

  qryDetalhe.Close;
  if Not (bSair) then
  begin
     if (Ok) then
     begin
        qryDetalhe.ParamByName('DATAMOVFUNDO').AsString       := DbDtRefSaldo.Text;
        qryDetalhe.ParamByName('IDTIPOFUNDOINVEST').AsString  := DblTipoFundo.LookupValue;
        qryDetalhe.ParamByName('IDFUNDOINVEST').AsString      := dblInvest.LookupValue;
        qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
        qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
        //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
        if ((dblTipoCota.Text <> '') and (iTipoInvestUsu in [9,10])) then
            qryDetalhe.ParamByName('IDTIPOCOTA').AsInteger     := StrToInt(dblTipoCota.Lookupvalue);
        qryDetalhe.Open;
        // Alterar a quantidade de casas decimais
        AjustaQuant( QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);
        //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
        sbtnAltDet.Enabled      := (not qryDetalhe.isEmpty);
        sbtnExcluiDet.Enabled   := (not qryDetalhe.isEmpty);
        dbgrdDet.Enabled        := (not qryDetalhe.isEmpty);
        pnlControlesDet.Enabled := (not qryDetalhe.isEmpty);
     end else
     begin
        if qryDetalhe.State <> dsInactive then
        begin
           qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger := -1;
           qryDetalhe.Open;
        end;
        sbtnAltDet.Enabled      := False;
        sbtnExcluiDet.Enabled   := False;
        dbgrdDet.Enabled        := False;
        pnlControlesDet.Enabled := False;
     end;
  end;
end;

procedure TfrmCadCancelaSubsCotas.DblTipoFundoExit(Sender: TObject);
begin
  inherited;
  if (wTipoInv <> DblTipoFundo.Text) or
     (wTipoInv = Trim(DblTipoFundo.Text)) then
  begin
     QryFundoInvest.Close;
     if Trim(DblTipoFundo.Text) = '' then
     begin
        QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').Clear;
        DbDtRefSaldo.Clear;
     end
     else
     begin
        //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
        QryFundoInvest.ParamByName('DTAVIGENCIA').AsString := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
        QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsString := DblTipoFundo.LookupValue;
        DbDtRefSaldo.DateTime := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
     end;
     //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
     QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     QryFundoInvest.Open;
     FazQry;
  end;
end;

procedure TfrmCadCancelaSubsCotas.DblTipoFundoEnter(Sender: TObject);
begin
  inherited;
  wTipoInv := DblTipoFundo.Text; 
end;

procedure TfrmCadCancelaSubsCotas.bbtnSairClick(Sender: TObject);
begin
   bSair := True;
  inherited;

end;

procedure TfrmCadCancelaSubsCotas.DbDtRefSaldoExit(Sender: TObject);
begin
  inherited;
  if (wMuda) And (Trim(DblTipoFundo.Text) <> '') then
  begin
     //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
     OperComum.LimpaParametros(QryFundoInvest);
     QryFundoInvest.ParamByName('DTAVIGENCIA').AsString := DbDtRefSaldo.Text;
     QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsString := DblTipoFundo.LookupValue;
     QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     QryFundoInvest.Open;

     FazQry;
     wMuda := False;
  end;
end;

procedure TfrmCadCancelaSubsCotas.sbtnExcluiDetClick(Sender: TObject);
var
   wStr     : String;
   wQtdOper : Double;
   wDataOper: TDateTime;
begin
   if (not qryDetalhe.IsEmpty) then
   begin
      // AL_3 - Inicio
      //AL_6
      if CtrlInvContab.TestaPeriodo(DbDtRefSaldo.Text, iTipoInvestUsu) then
      begin
         //AL_8 
         //AL_5
         if VerEmAbertura(QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
            Exit;

         If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
                   [mbYes, mbNo],0) = mrYes Then
         Begin
            OperComum.LimpaParametros(QryBuscaOperacao);
            QryBuscaOperacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                             QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
            QryBuscaOperacao.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
            QryBuscaOperacao.ParamByName('DATAOPERACAO').AsDateTime     := DbDtRefSaldo.Date;
            QryBuscaOperacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            QryBuscaOperacao.Open;

            If QryBuscaOperacao.IsEmpty Then
            begin
               MsgDlg('Nessa data, não há Cancelamento de Subscrição para esse Fundo de Investimento.'+#13+
                      'Essa Operação será cancelada!','Mensagem do Sistema', MtInformation,[MbOk],0);
               QryBuscaOperacao.Close;
               Exit;
            end;

            Try
               // Inicia Transação
               If not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               //AL_11   
               while not QryBuscaOperacao.Eof Do
               begin
                  // Exclui Dados do Historico
                  If Not ProcExcluiFundo(QryBuscaOperacao.FieldByName('CODDOCUMENTO').AsInteger,
                                         QryBuscaOperacao.FieldByName('PLNCODIGO').AsInteger,
                                         QryBuscaOperacao.FieldByName('PLANO').AsInteger,
                                         QryBuscaOperacao.FieldByName('IDTIPOINVEST').AsInteger,
                                         QryBuscaOperacao.FieldByName('DATAOPERACAO').AsDateTime,
                                         True) Then
                    Abort;

                  wStr := 'DELETE FROM OPERACAOFUNDO WHERE IDOPERACAOFUNDO = '+
                                  QryBuscaOperacao.FieldByName('IDOPERACAOFUNDO').AsString;

                  If Not ExecutaQuery(QryAux,wStr) Then
                  Begin
                    QryAux.Close;
                    Abort;
                  End;

                  QryAux.Close;

                  wStr := 'DELETE FROM HISTFUNDO WHERE IDOPERACAOFUNDO = '+
                                  QryBuscaOperacao.FieldByName('IDOPERACAOFUNDO').AsString;

                  If Not ExecutaQuery(QryAux,wStr) Then
                  Begin
                    QryAux.Close;
                    Abort;
                  End;

                  QryAux.Close;
                  QryBuscaOperacao.Next;
               end;

                // Confirma Transação
               If dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Commit;

               QryTipoFundoInvest.Close;
               QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                                     QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
               QryTipoFundoInvest.Open;

               if DbDtRefSaldo.Date <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
               begin
                  //Alt_1
                  If Not Reprocessamento(iTipoInvestUsu,
                                         QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                         QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                         iPlanPrevCtbPatro,
                                         DbDtRefSaldo.Date,
                                         QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                         QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                                         True,
                                         //Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
                                         OperComum.IIF(((dblTipoCota.Text <> '') and (iTipoInvestUsu in [9,10])), StrToInt(dblTipoCota.Lookupvalue), -1)) Then
                     //AL_10                    
                     MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                            'Mensagem do Sistema', MtInformation,[MbOk],0);
               end;

               FazQry;

            Except
               On E:Exception Do Begin
                 MsgDlg('Erro ao Excluir Aplicação do Cadastro:'#13+
                        E.Message,'Erro',mtError,[mbOk],0);
                 dtmBaseDados.dbBaseDados.Rollback;
                 Exit;
               End;
            End;
         end;
      end
      else
         MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      // AL_3 - Fim
   end;
end;

//Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
procedure TfrmCadCancelaSubsCotas.dblTipoCotaChange(Sender: TObject);
begin
  inherited;
   wMuda := True;
end;

//Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
procedure TfrmCadCancelaSubsCotas.dblTipoCotaEnter(Sender: TObject);
begin
  inherited;
   wMuda := False;
end;

//Ricardo Cristiano - 05/02/2010 - N. Sol 130405 -  N. Kintana 732748
procedure TfrmCadCancelaSubsCotas.dblTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (wMuda) then
  begin
     FazQry;
     wMuda := False;
  end;
end;

end.
