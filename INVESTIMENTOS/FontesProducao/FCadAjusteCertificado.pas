//******************************************************************************
// Data      : 28/01/2008
// Código    : AL_11
// Pendencia : 25413
// SOL       :
// Desc      : Coloquei o trunc na QryFundoInvest
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_10
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores a transferência
//******************************************************************************
// Data     : 26/10/2007
// Código   : AL_9
// Pendencia: 26731
// SOL      :
// Motivo   : Alterei a query QryOperAjusteCert que não estava pegando a operação
//            de ajuste de RV -144
//******************************************************************************
// Data     : 28/05/2007
// Código   : AL_8
// Pendencia:
// SOL      :
// Motivo   : Implementação de tratamento de tela para inibir as funcionalidades
//            que estáo fora da alteração de quantidade
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_10
// Pendencia :
// SOL       :
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_9
// Pendencia : 20453
// SOL       : 33866
// Motivo    : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 09/05/2006
// Código    : AL_8
// Pendencia : 22180
// SOL       : 42536
// Motivo    : Implementação da exclusão.
//******************************************************************************
// Data      : 19/04/2006
// Código    : AL_7
// Pendencia :
// SOL       :
// Motivo    : Implementado a gravação do valor da variação, movimento e saldo
//             após o ajuste
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_6
// Pendencia :
// SOL       :
// Motivo    : Ajuste na identificação do certificado para buscar a
//             corretamente no reprocessamento .
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_5
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 18/11/2005
// Linha(s) : Al_4
// Motivo   : Alterado o tipo de operação de -67(esse está sendo utilizado como transf. no Renda Var.)
//            para o então criado -144.
//            E implementação da descrição do tipo de operação e natureza no ajuste de certificado
//******************************************************************************
// Data     : 25/05/2005
// Linha(s) : Al_3
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
//Data	    : 29/06/2004
//Origem    : FUNCEF
//Query     : qryDetalhe
//Motivo(S) : Passado o Active da qry para 'False'
//******************************************************************************

unit FCadAjusteCertificado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbedit, Mask, wwdblook, DBCtrls2, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, TREdit, wwriched, fcLabel,
  uCtrlInvContab;

type
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double
               End;

  TfrmCadAjusteCertificado = class(TfrmCadMestreDetalheCS)
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
    //Al_8
    qryDetalheVLRIRPROV: TFloatField;
    qryDetalheVLRIOFPROV: TFloatField;
    qryDetalheVLRVARIACAO: TFloatField;
    QryInsertOperacaoFundo: TwwQuery;
    dsTipoFundo: TDataSource;
    dbgrdDetIButton: TwwIButton;
    qryUltimoMovimento: TwwQuery;
    qryUltimoMovimentoDATAMOVFUNDO: TDateTimeField;
    qryDetalheSALDOQTDCOTAS: TFloatField;
    sbtnImprime: TToolbarButton97;
    QryAux: TwwQuery;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;    
    pnlObs: TPanel;
    memObs: TMemo;
    QryUpdOperacaoApl: TwwQuery;
    QryVerDelAplicacao: TwwQuery;
    qryDetalheIDOPERACAOFUNDO: TFloatField;
    //Al_8
    QryOperAjusteCert: TwwQuery;
    Panel2: TPanel;
    Bevel1: TBevel;
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    QryFundoInvestDTAINIPROC: TDateTimeField;
    //Al_8
    TbsOper: TTabSheet;
    dbgrdOper: TwwDBGrid;
    wwIButton1: TwwIButton;
    QryOperacao: TwwQuery;
    DsOperacao: TwwDataSource;
    UpdOperacao: TUpdateSQL;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtQtdCota: TDBRealEdit;
    edtQtdAtual: TRealEdit;
    GroupBox2: TGroupBox;
    edtDiferenca: TRealEdit;
    QryOperacaoIDOPERACAOFUNDO: TFloatField;
    QryOperacaoIDFUNDOINVEST: TFloatField;
    QryOperacaoDATAOPERACAO: TDateTimeField;
    QryOperacaoQTDOPERACAO: TFloatField;
    QryOperacaoPLANO: TFloatField;
    QryOperacaoPLNCODIGO: TFloatField;
    QryOperacaoCODDOCUMENTO: TFloatField;
    QryOperacaoIDOPERACAOORIGEM: TFloatField;
    QryOperacaoDATACOTIZACAO: TDateTimeField;
    QryOperacaoDATAAPLICACAO: TDateTimeField;
    QryOperacaoIDTIPOFUNDOINVEST: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DblTipoFundoChange(Sender: TObject);
    procedure edtDiferencaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure dblInvestChange(Sender: TObject);
    procedure dblInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblInvestEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure edtQtdAtualExit(Sender: TObject);
    procedure DbDtRefSaldoChange(Sender: TObject);
    procedure sbtnImprimeClick(Sender: TObject);
    //Al_8
    procedure DblTipoFundoEnter(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure DbDtRefSaldoExit(Sender: TObject);
    //Al_8
    procedure tbcDetalheChange(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);

  private
    { Private declarations }
    wQtdAjuste: Double;
    wQtdDec: Integer;
    wQtdAnt: Extended;
    wMuda: Boolean;
    sMascara: String;
    wTipoInv: String;
    procedure AjustaQuant(pQtdDec: Integer);
    procedure FazQry;
  public
    { Public declarations }
  end;

var
  frmCadAjusteCertificado: TfrmCadAjusteCertificado;
  bSair : Boolean;

implementation
uses UDataBase, uMensErro,UDiasUteisInv, UFundoComum, dFundoComum, dBaseDados,
  UOperComum, UBibliotecaInvest, FTelaAut, FParamOperAjuste;
{$R *.DFM}

procedure TfrmCadAjusteCertificado.FormShow(Sender: TObject);
begin
  bSair := False;
  dbgrdDet.BringToFront;
  sbtnAltDet.Enabled := False;
  dbgrdDet.Enabled := False;
  pnlControlesDet.Enabled := False;
  QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString := DateToStr(Date);
  QryFundoInvest.Open;
end;

procedure TfrmCadAjusteCertificado.bbtnOkDetClick(Sender: TObject);
var
    sQtdDif, wTipoRecDesBol : String;
    iPlanilha, iDocumento, iPlano, iIDOperacao, I, iTipoOperacao,iIdForCli,iIdHistFundo : Integer;
    bCriaLancto : boolean;
    DadosCota   : TDadosCota;
    fQtdDif, fVlrAjuste  : Double;
    fVlrCustoAcoes, fVlrVarAcoes : Currency;
begin
  //AL_3
  //AL_9
  if not CtrlInvContab.TestaPeriodo(DbDtRefSaldo.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     Exit;
  end;

  //AL_5
  if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  //AL_10
  // Verifica se existem Transferência entre planos posterior a data a ser transferida
  If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                             QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                             iPlanPrevCtbPatro,
                                             DbDtRefSaldo.DateTime) then
   Begin
       MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação.'+'.'#13+
              'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
       bbtnCancelarDetClick(sender);
       Exit;
   End; // Fim AL_10
   
  fVlrCustoAcoes := 0;
  fVlrVarAcoes   := 0;
  iTipoOperacao  := 0;
  if edtDiferenca.Value = 0 Then
     Exit;

  sQtdDif := edtDiferenca.Text;
  sQtdDif := Trim(sQtdDif);
  fQtdDif := StrToFloat(sQtdDif);

  try

    //AL_6

    // Busca dados da Cota
    DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                            qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                            DbDtRefSaldo.Date);

    QryOperAjusteCert.Close;
    OperComum.LimpaParametros(QryOperAjusteCert);
    QryOperAjusteCert.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;;
    QryOperAjusteCert.ParamByName('IDFUNDOINVEST').AsInteger     :=
                     qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
    QryOperAjusteCert.ParamByName('IDOPERACAOORIGEM').AsInteger  :=
                     qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
    QryOperAjusteCert.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryOperAjusteCert.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
    QryOperAjusteCert.ParamByName('DATAOPERACAO').AsString       := DbDtRefSaldo.Text;
    QryOperAjusteCert.Open;
    QryOperAjusteCert.First;

    If QryOperAjusteCert.RecordCount = 1 Then
    begin
       If fQtdDif > QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat Then
          fQtdDif := fQtdDif + QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat
       Else If fQtdDif < QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat Then
          fQtdDif := QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat + fQtdDif
       Else If fQtdDif = QryOperAjusteCert.FieldByName('QTDOPERACAO').AsFloat Then
          fQtdDif := 0;
    end;

    fVlrAjuste :=  fQtdDif * DadosCota.VlrCota;

    if fVlrAjuste <> 0 then
    begin
       if fVlrAjuste > 0 then
       begin
          if iTipoInvestUsu = 5 then
             iTipoOperacao := -36
          else if iTipoInvestUsu = 6 then
             iTipoOperacao := -37;
       end
       else
       begin
          //Al_4
          if iTipoInvestUsu = 5 then
             iTipoOperacao := -66
          else if iTipoInvestUsu = 6 then
             iTipoOperacao := -144;
       end;
    end
    Else
       Exit;

    //Al_8
    //Al_4
    OperComum.LimpaParametros(qryTipoOperacao);
    qryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger   := iTipoInvestUsu;
    qryTipoOperacao.ParamByName('IDTIPOOPERACAO').AsInteger := iTipoOperacao;
    qryTipoOperacao.Open;
    if qryTipoOperacao.IsEmpty then
    begin
       MsgDlg('Atenção : Não foi cadastrado o Tipo de Operação para esse Tipo de Fundo.',
              'Mensagem do Sistema', MtWarning, [MbOk], 0);
       exit;
    end;

    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    With QryVerDelAplicacao Do
    begin
       Close;
       ParamByName('IDOPERACAOORIGEM').AsInteger  := qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
       ParamByName('IDFUNDOINVEST').AsInteger     := qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
       ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
       ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
       ParamByName('DATAOPERACAO').AsDateTime     := DbDtRefSaldo.DateTime;
       Open;
       First;

       While Not Eof Do
       begin
          If Not ProcExcluiFundo(FieldByName('CODDOCUMENTO').AsInteger,
                                 FieldByName('PLNCODIGO').AsInteger,
                                 FieldByName('PLANO').AsInteger,
                                 iTipoInvestUsu,
                                 FieldByName('DATAOPERACAO').AsDateTime, True) Then
          begin
             dtmBaseDados.dbBaseDados.Rollback;
             Exit;
          end;

          Next;
       end;
    end;

    //Al_8
    with QryInsertOperacaoFundo do
    begin
       iIDOperacao := LeUltRegistro(Nil,'OPERACAOFUNDO');
       Close;
       ParamByName('IDOPERACAOFUNDO').AsInteger   := iIDOperacao;
       ParamByName('IDCARTEIRAINVEST').AsInteger  := qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger;
       ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
       ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;//QryTipoFundo.FieldByName('IDTIPOOPERACAO').AsInteger;
       ParamByName('IDFUNDOINVEST').AsInteger     := qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
       ParamByName('DATAOPERACAO').AsDateTime     := DbDtRefSaldo.DateTime;
       ParamByName('DATALIQUIDACAO').AsDateTime   := DbDtRefSaldo.DateTime;
       //AL_6
       ParamByName('DATACOTIZACAO').AsDateTime    := qryDetalhe.FieldByName('DATAAPLICACAO').AsDateTime;
       ParamByName('QTDOPERACAO').AsFloat         := fQtdDif;
       //AL_7
       ParamByName('VLROPERACAO').AsFloat         := fVlrAjuste;
       ParamByName('VLRCOTA').AsInteger           := 0;
       ParamByName('VLRIR').AsInteger             := 0;
       ParamByName('VLRIOF').AsInteger            := 0;
       ParamByName('VLRRENDIMENTO').AsInteger     := 0;
       //AL_6
       ParamByName('IDOPERACAOORIGEM').AsInteger  := qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
       ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
       ParamByName('OBSERVACAO').AsString         := copy(memObs.Text,1,300);
       ParamByName('STACONFIRMA').Clear;
       ParamByName('IDPEDIDOFUNDO').Clear;
       if not(Prepared) then
          Prepare;
       ExecSql;
       Close;
    end;

    with DmFundoComum.qryInsertHistFundo do
    begin
       Close;
       iIdHistFundo := LeUltRegistro(nil, 'HISTFUNDO');
       ParamByName('IDHISTFUNDO').AsInteger       := iIdHistFundo;
       ParamByName('IDOPERACAOFUNDO').AsInteger   := qryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger;
       ParamByName('CODDOCUMENTO').Clear;
       ParamByName('PLNCODIGO').Clear;
       ParamByName('PLANO').Clear;
       ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
       ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
       ParamByName('IDCARTEIRAINVEST').AsInteger  := qryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger;
       ParamByName('IDFUNDOINVEST').AsInteger     := qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
       ParamByName('DATAAPLICACAO').AsDateTime    := qryDetalhe.FieldByName('DATAAPLICACAO').AsDateTime;
       ParamByName('DATAMOVFUNDO').AsDateTime     := DbDtRefSaldo.DateTime;
       ParamByName('DATAULTPGTOIR').AsDateTime    := qryDetalhe.FieldByName('DATAULTPGTOIR').AsDateTime;
       //Al_4
       ParamByName('HISTMOVFUNDO').AsString       := COPY(Trim(qryTipoOperacaoDESCTIPOOPERACAO.AsString)+' / '+ Trim(dblInvest.Text),1,60);
       ParamByName('NATURMOVFUNDO').AsString      := qryTipoOperacaoNATUREZAOPERACAO.AsString;
       ParamByName('TIPMOVFUNDO').AsString        := 'AJU';
       ParamByName('VLRAPLICADO').AsFloat         := qryDetalhe.FieldByName('VLRAPLICADO').AsFloat;
       ParamByName('VLRIRPROV').AsFloat           := qryDetalhe.FieldByName('VLRIRPROV').AsFloat;
       ParamByName('VLRIOFPROV').AsFloat          := qryDetalhe.FieldByName('VLRIOFPROV').AsFloat;
       //AL_7
       ParamByName('VLRVARIACAO').AsFloat         := fVlrAjuste;
       ParamByName('COTASMOVFUNDO').AsFloat       := fQtdDif;
       ParamByName('VLRMOVFUNDO').AsFloat         := fVlrAjuste;
       ParamByName('FLGCALCSALDO').AsString       := '1';
       ParamByName('COTAAPLICACAO').AsFloat       := qryDetalhe.FieldByName('VLRCOTAAPLICACAO').AsFloat;
       ParamByName('SALDOQTDCOTAS').AsFloat       := edtQtdAtual.Value;
       //AL_7
       ParamByName('SALDOVLRFUNDO').AsFloat       := qryDetalhe.FieldByName('SALDOVLRFUNDO').AsFloat+fVlrAjuste;
       ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
       if not(Prepared) then
          Prepare;
       ExecSql;
       Close;
    end;

    //AL_6
    //Contabiliza o Ajuste
    iPlanilha  := -1;
    iDocumento := -1;
    iPlano     := -1;
    bCriaLancto := False;

    //Al_8
    iIdForCli := OperComum.BuscaForCli(qryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
                 QryFundoInvestIDGESTORCARTEIRA.AsInteger,
                 iTipoOperacao, pRPI.IDTIPOCLIENTEEMI);

    wTipoRecDesBol := '';

    //Al_2
    If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                    iTipoOperacao,
                                    iTipoInvestUsu,
                                    -1,
                                    StrToInt(DblTipoFundo.LookupValue),
                                    iIdForCli,
                                    qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                    DbDtRefSaldo.Date,
                                    DbDtRefSaldo.Date,
                                    'OPE', qryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                                    dblInvest.Text+' / '+sPlanPrevCtbPatro,
                                    True, Abs(fVlrAjuste),
                                    0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes) Then
    begin
       MsgDlg('Atenção: Ocorreu um problema na contabilização do ajuste ',
              'Mensagem do Sistema', MtWarning, [MbOk], 0);
       dtmBaseDados.dbBaseDados.Rollback;
       Exit;
    end;

    //AL_6
    if (iPlanilha > 0) then
    begin
       With QryUpdOperacaoApl Do
       Begin
         Close;
         ParamByName('IDOPERACAOFUNDO').AsInteger := iIDOperacao;
         ParamByName('PLANO').AsInteger           := iPlano;
         ParamByName('PLNCODIGO').AsInteger       := iPlanilha;
         ExecSQL;
         Close;
       End;
    end;

    dtmBaseDados.dbBaseDados.Commit;

    //Al_8
    if DbDtRefSaldo.Date < QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       //AL_10    
       //Alt_1
       If Not Reprocessamento(iTipoInvestUsu,
                              QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                              iPlanPrevCtbPatro,
                              DbDtRefSaldo.Date,
                              QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                              True) Then
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                  'Mensagem do Sistema', MtInformation ,[MbOk],0);
    end;

  Except
    On E:Exception Do Begin
      // AL_3
      MsgDlg('Não foi possível efetuar o Ajuste:' + #13+
             E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
      dtmBaseDados.dbBaseDados.Rollback;
    end;
  end;

  dblInvestChange(Self);

  FazQry;

  dbgrdDet.BringToFront;
  CmeDetalhe.Cancel(Self);
  sbtnAltDet.Enabled := True;
  //AL_8
  pnlMestre.Enabled  := True;
  sbtnProcurar.Enabled := True;
  sbtnImprime.Enabled  := True;

end;

procedure TfrmCadAjusteCertificado.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadAjusteCertificado.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  QryDetalhe.Cancel;
  sbtnInsDet.Enabled    := False;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := False;
  //AL_8
  pnlMestre.Enabled     := True;
  sbtnProcurar.Enabled  := True;
  sbtnImprime.Enabled   := True;
end;

procedure TfrmCadAjusteCertificado.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then begin

     DbDtRefSaldo.Text := MontaSelect.ValoresChave[2];
     DbDtRefSaldo.DateTime := StrToDate(MontaSelect.ValoresChave[2]);

     DblTipoFundo.LookupValue := MontaSelect.ValoresChave[1];
     DblTipoFundo.PerformSearch;

     dblInvest.LookupValue := MontaSelect.ValoresChave[0];
     dblInvest.PerFormSearch;

     //Al_8
     OperComum.LimpaParametros(qryDetalhe);
     qryDetalhe.ParambyName('DATAMOVFUNDO').AsString       := MontaSelect.ValoresChave[2];
     qryDetalhe.ParambyName('IDFUNDOINVEST').AsInteger     := StrToInt(MontaSelect.ValoresChave[0]);
     qryDetalhe.ParambyName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     qryDetalhe.ParambyName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     qryDetalhe.Open;

     //Al_8
     OperComum.LimpaParametros(QryOperacao);
     QryOperacao.ParambyName('DATAOPERACAO').AsString       := MontaSelect.ValoresChave[2];
     QryOperacao.ParambyName('IDFUNDOINVEST').AsInteger     := StrToInt(MontaSelect.ValoresChave[0]);
     QryOperacao.ParambyName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     QryOperacao.ParambyName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QryOperacao.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryOperacao.Open;

     //Alterar a quantidade de casas decimais
     AjustaQuant(QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);

     sbtnAltDet.Enabled    := True;
     dblInvest.Enabled     := True;

     //Al_8
     if Not QryOperacao.IsEmpty then
     begin
        if pgctrlDetalhe.ActivePage = TbsOper then
           sbtnExcluiDet.Enabled := True
        else
           sbtnExcluiDet.Enabled := False;
     end
     else
       sbtnExcluiDet.Enabled := False;

     dblInvestChange(Self);
  end;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadAjusteCertificado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryFundoInvest.Close;
   QryTipoFundo.Close;
   QryDetalhe.Close;
   QryTipoOperacao.Close;
end;

procedure TfrmCadAjusteCertificado.DblTipoFundoChange(Sender: TObject);
begin
  inherited;
  wMuda := True;
  //Al_8
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
        QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsString := DblTipoFundo.LookupValue;
        DbDtRefSaldo.DateTime := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
     end;
     QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
     QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString  := DbDtRefSaldo.Text;
     QryFundoInvest.Open;
  end;
end;

procedure TfrmCadAjusteCertificado.AjustaQuant(pQtdDec: Integer);
begin
  // Alterar a quantidade de casas decimais
  wQtdDec := pQtdDec;
  edtQtdCota.DecDigits   := pQtdDec;
  edtQtdCota.IntDigits   := 21 - pQtdDec;
  edtDiferenca.DecDigits := pQtdDec;
  edtQtdAtual.DecDigits  := pQtdDec;
  edtQtdAtual.IntDigits  := 21 - pQtdDec;
  qryDetalheSALDOQTDCOTAS.Precision := pQtdDec;
  sMascara := MontaMascaraDecQtd(QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger);
  qryDetalheSALDOQTDCOTAS.DisplayFormat := sMascara;
  qryDetalheSALDOQTDCOTAS.EditFormat    := sMascara + ';' + sMascara;
  //Al_8
  QryOperacaoQTDOPERACAO.EditFormat     := sMascara + ';' + sMascara;
end;

procedure TfrmCadAjusteCertificado.edtDiferencaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = '.' Then Key := ',';
end;

procedure TfrmCadAjusteCertificado.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  sbtnAltDetClick(Sender);
end;

procedure TfrmCadAjusteCertificado.dblInvestChange(Sender: TObject);
begin
  inherited;
  wMuda := True;
end;

procedure TfrmCadAjusteCertificado.dblInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if wMuda then
  begin
     FazQry;
     wMuda := False;
  end;

  edtQtdCota.DecDigits  := QryFundoInvestQTDDECQTD.AsInteger;
  edtQtdAtual.DecDigits := QryFundoInvestQTDDECQTD.AsInteger;

end;

procedure TfrmCadAjusteCertificado.dblInvestEnter(Sender: TObject);
begin
  inherited;
  wMuda := False;
end;

procedure TfrmCadAjusteCertificado.FormCreate(Sender: TObject);
begin
  inherited;

  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundo.Open;

  MontaSelect.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST    = ' + IntToStr(iTipoInvestUsu));
  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
end;

procedure TfrmCadAjusteCertificado.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmCadAjusteCertificado.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  AjustaQuant(QryFundoInvestQTDDECQTD.AsInteger);

  edtQtdAtual.Value := qryDetalheSALDOQTDCOTAS.Value;
  edtQtdAtual.SelectAll;

  bbtnVoltarDet.SetFocus;

  edtQtdAtual.SetFocus;
  edtQtdAtual.SelectAll;

  qryUltimoMovimento.Close;
  qryUltimoMovimento.ParamByName('IDFUNDOINVEST').AsInteger :=
                     qryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
  qryUltimoMovimento.ParamByName('DATAAPLICACAO').AsDateTime :=
                     qryDetalhe.FieldByName('DATAAPLICACAO').AsDateTime;
  qryUltimoMovimento.Prepare;
  qryUltimoMovimento.Open;

  //AL_8
  pnlMestre.Enabled    := False;
  sbtnProcurar.Enabled := False;
  sbtnImprime.Enabled  := False;
end;

procedure TfrmCadAjusteCertificado.edtQtdAtualExit(Sender: TObject);
begin
  inherited;
   edtDiferenca.Text := FormatFloat(sMascara, edtQtdAtual.Value -
                                              qryDetalhe.FieldByName('SALDOQTDCOTAS').Value);
end;

procedure TfrmCadAjusteCertificado.DbDtRefSaldoChange(Sender: TObject);
begin
  inherited;
   wMuda := True;
end;

procedure TfrmCadAjusteCertificado.sbtnImprimeClick(Sender: TObject);
begin
  inherited;
   AbrirFormModal(frmParamOperAjuste,TfrmParamOperAjuste);
   sbtnImprime.Down := False;
end;

procedure TfrmCadAjusteCertificado.FazQry;
var Ok: Boolean;
begin
  Ok := True;
  if Trim(DblTipoFundo.Text) = '' then
     Ok := False;
  if Trim(dblInvest.Text) = '' then
     Ok := False;
  if Trim(DbDtRefSaldo.Text) = '' then
     Ok := False;

  if Not (bSair) then
  begin
     if (Ok) then
     begin
        //Al_8
        OperComum.LimpaParametros(qryDetalhe);
        qryDetalhe.ParamByName('DATAMOVFUNDO').AsString       := DbDtRefSaldo.Text;
        qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
        qryDetalhe.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
        qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
        qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
        qryDetalhe.Open;

        //Al_8
        OperComum.LimpaParametros(QryOperacao);
        QryOperacao.ParambyName('DATAOPERACAO').asString       := DbDtRefSaldo.Text;
        QryOperacao.ParambyName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
        QryOperacao.ParambyName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
        QryOperacao.ParambyName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
        QryOperacao.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
        QryOperacao.Open;

        //Alterar a quantidade de casas decimais
        AjustaQuant(QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);

        sbtnAltDet.Enabled      := True;
        dbgrdDet.Enabled        := True;
        pnlControlesDet.Enabled := True;
     end else
     begin
        if qryDetalhe.State <> dsInactive then
        begin
           //Al_8
           OperComum.LimpaParametros(qryDetalhe);
           qryDetalhe.Open;

           OperComum.LimpaParametros(QryOperacao);
           QryOperacao.Open;
        end;
        sbtnAltDet.Enabled      := False;
        dbgrdDet.Enabled        := False;
        pnlControlesDet.Enabled := False;
     end;
  end;
end;

//Al_8

procedure TfrmCadAjusteCertificado.DblTipoFundoEnter(Sender: TObject);
begin
  inherited;
  wTipoInv := DblTipoFundo.Text;
end;

procedure TfrmCadAjusteCertificado.bbtnSairClick(Sender: TObject);
begin
   bSair := True;
  inherited;

end;

procedure TfrmCadAjusteCertificado.DbDtRefSaldoExit(Sender: TObject);
begin
  inherited;
  if (wMuda) And (Trim(dblInvest.Text) <> '') then
  begin
     FazQry;
     wMuda := False;
  end;
end;

//Al_8
procedure TfrmCadAjusteCertificado.tbcDetalheChange(Sender: TObject);
begin
  inherited;
   sbtnAltDet.Enabled    := True;
   sbtnExcluiDet.Enabled := False;

   if pgctrlDetalhe.ActivePage = TbsOper then
   begin
      sbtnAltDet.Enabled      := False;
      if Not QryOperacao.IsEmpty then
        sbtnExcluiDet.Enabled := True;
      //AL_8
      pnlMestre.Enabled    := True;
      sbtnProcurar.Enabled := True;
      sbtnImprime.Enabled  := True;
   end
   else
      sbtnExcluiDet.Enabled   := False;
end;

procedure TfrmCadAjusteCertificado.sbtnExcluiDetClick(Sender: TObject);
var dDataOper : TDateTime;
begin
   dDataOper := QryOperacao.FieldByName('DATAOPERACAO').AsDateTime;
   //AL_9
   if not CtrlInvContab.TestaPeriodo(DateToStr(dDataOper), iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   //AL_5
   if VerEmAbertura(QryOperacao.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   Try
      If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If Not ProcExcluiContabil(QryOperacao.FieldByName('PLANO').AsInteger,
                                QryOperacao.FieldByName('PLNCODIGO').AsInteger) Then
         Raise Exception.Create('Ocorreu um problema na exclusão Contábil da operação.');

      FazQuery(QryAux,'SELECT IDHISTFUNDO, PLANO, PLNCODIGO FROM HISTFUNDO WHERE   '+
                          'IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                          'IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                          'IDFUNDOINVEST     = '+QryOperacao.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                          'DATAMOVFUNDO     >= TO_DATE('+QuotedStr(QryOperacao.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')  AND '+
                          'IDOPERACAOFUNDO   = '+QryOperacao.FieldByName('IDOPERACAOORIGEM').AsString);
      While Not QryAux.Eof do
      begin
         If Not ProcExcluiContabil(QryAux.FieldByName('PLANO').AsInteger,
                                   QryAux.FieldByName('PLNCODIGO').AsInteger) Then
            Raise Exception.Create('Ocorreu um problema na exclusão Contábil do histórico.');
         QryAux.Next;
      end;

      ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE '+
                          'IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+'    AND '+
                          'IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                          'IDFUNDOINVEST     = '+QryOperacao.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                          'DATAMOVFUNDO     >= TO_DATE('+QuotedStr(QryOperacao.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')  AND '+
                          'IDOPERACAOFUNDO   = '+QryOperacao.FieldByName('IDOPERACAOORIGEM').AsString);

      ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE '+
                          'IDOPERACAOFUNDO   = '+QryOperacao.FieldByName('IDOPERACAOFUNDO').AsString);

      dtmBaseDados.dbBaseDados.Commit;

      OperComum.LimpaParametros(QryOperacao);
      QryOperacao.ParambyName('DATAOPERACAO').asString       := DbDtRefSaldo.Text;
      QryOperacao.ParambyName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
      QryOperacao.ParambyName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
      QryOperacao.ParambyName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryOperacao.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryOperacao.Open;

      If (dDataOper <= QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime) Then
      begin
         If Not Reprocessamento(iTipoInvestUsu,
                                QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                iPlanPrevCtbPatro,
                                dDataOper,
                                QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime,
                                True) Then
            //AL_10
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
      end;

      OperComum.LimpaParametros(qryDetalhe);
      qryDetalhe.ParamByName('DATAMOVFUNDO').AsString       := DbDtRefSaldo.Text;
      qryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblInvest.LookupValue);
      qryDetalhe.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
      qryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      qryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      qryDetalhe.Open;

   Except
      On E:Exception Do Begin
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         dtmBaseDados.dbBaseDados.Rollback;
         QryAux.Close;
      End;
   end;

end;

end.
