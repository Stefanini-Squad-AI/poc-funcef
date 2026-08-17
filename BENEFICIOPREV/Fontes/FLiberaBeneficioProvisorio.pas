// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 28/09/2006
// Pendência   : 23419
// Rotina      : bbtnRequerParticipClick
// Descricao   : Passar a DataRequerimento nula para a rotina AbreRequerParticip.
//------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Rotina     : sbtnAlteraDataClick
//  Data       : 11/01/2006
//  Pendência  : 19538
//  Alteração  : Inclusão de dois novos parâmetros (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
//  Autor(a)   : Bruno Bastos
//  Rotina     : sbtnAlteraDataClick
//  Data       : 25/10/2005
//  Pendencia  : 20518
//  Alteração  : Passar para a função InsereTmpDesc o número do recebimento
//               inserido na HstContribPrev.
//------------------------------------------------------------------------------
//  Autor(a)   : Gleyber
//  Rotina     : sbtnAlteraDataClick
//  Data       : 12/09/2005
//  Pendencia  : 20169
//  Alteração  : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada da rotina
//               dtmAPrevIntegraBack.BuscaInfIntegra
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Pendencia   :
// Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
// Alteração   : passagem do parâmetro sMsgErro para a função dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
//               uma possível mensagem de erro, já que ela não aciona mais um MSGDLG diretamente
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : sbtnAlteraDataClick
// Autor(a)  : Gleyber
// Data      : 12/02/2003
// Alteração : Abrir a possibilidade do usuário alterar valores no momento da
//             liberação.
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------
unit FLiberaBeneficioProvisorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, Db, DBTables,
  Wwquery, Mask, wwdbedit, Wwdatsrc, MontaSelect, Menus,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmLiberaBeneficioProvisorio = class(TfrmOkCancelar)
    pnlRevisao: TPanel;
    pnlProcesso: TPanel;
    bbtnProcurar: TBitBtn;
    stxtProcesso: TStaticText;
    pnlBeneficios: TPanel;
    Label12: TLabel;
    Label5: TLabel;
    qryProcesso: TwwQuery;
    dsProcesso: TwwDataSource;
    dbedEvento: TwwDBEdit;
    dbedDtEvento: TwwDBEdit;
    Label1: TLabel;
    dbedDtRegistro: TwwDBEdit;
    qryBeneficiarios: TwwQuery;
    dsBeneficiarios: TwwDataSource;
    MontaSelect: TMontaSelect;
    qryTitular: TwwQuery;
    qryAux: TwwQuery;
    Panel1: TPanel;
    StaticText1: TStaticText;
    dbgrdBeneficiarios: TwwDBGrid;
    sbtnAlteraData: TSpeedButton;
    qryContrib: TwwQuery;
    qryContaBancaria: TwwQuery;
    qryResultado: TwwQuery;
    qryAcertos: TwwQuery;
    GroupBox1: TGroupBox;
    lblDtInicio: TLabel;
    dtInicioLiberacao: TCMDateTimePicker;
    Label2: TLabel;
    dtFinalLiberacao: TCMDateTimePicker;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgrdDemonstrativoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure sbtnAlteraDataClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }

    iIdLoteConcessao,
    iNumeroProcesso,
    iIdTitular,
    iIdPessJur,
    iIdPlanoPrev,
    iSeqProposta               : longint;


    // Dados da tela de informacoes do novo beneficiario
    sDataInicioOriginal,
    sNumProcINSS,             sDtRequerimento,
    sDtInicioINSS,            sDtInicioFund,            sDataInicio,
    sDataFinal,               sVlrInfINSS,              sIdTpPagtoBenefic,
    sCodPortForma : string;

    // Dados globais
    sDataFinalAnt,
    sAnoMesPagamento,
    sDataEvento,           sFlgTpDemissao,           sTipoSitFunc,
    sMatricula,            sNomeTitular,             sNomePatro,
    sNomePlano,            sDataDemissao,            sNomeSitPart,
    sNomeSitFunc,          sNomeSitPlano                          : string;

    sFlgInternoAntes,
    sFlgInternoDepois,
    sIdSitPartAntes,
    sIdSitPlanAntes,
    sIdSitFuncAntes,
    sIdSitPartDepois,
    sIdSitPlanDepois,
    sIdSitFuncDepois : string;

    iFlgDataPrevista,
    iFlgIncluiMesConc   : integer;

    sDataEventoMs,
    sIdEventoGerador     : String;

    procedure LimpaTela;
    procedure SelecionaProcesso(piNumeroProcesso : longInt);
    procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure MostraDemonstrativoConcessao; 

  public
    { Public declarations }
  end;

var
  frmLiberaBeneficioProvisorio: TfrmLiberaBeneficioProvisorio;

implementation
{$R *.DFM}
uses 
  UParticipante, UMensErro,  fAguarde, UBeneficio,
  UAdmPrev,      DBaseDados,
  FDevolveContribuicoes, DAPrev, UDataBase, UEventos,
  FSelecionaLote, UContribuicaoPrev, FMostraAux, USistema, UFuncoesUteis,
  DAPrevIntegraBack, FCadRequerBenefParticip;




procedure TfrmLiberaBeneficioProvisorio.LimpaTela;
begin
   iNumeroProcesso := -1;
   SelecionaProcesso(-1);
   PreencheDadosTitular(-1, -1, -1, -1);
end; // LimpaTela

procedure TfrmLiberaBeneficioProvisorio.SelecionaProcesso(piNumeroProcesso : longInt);
begin
  qryProcesso.Close;
  qryProcesso.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryProcesso.Open;


  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryBeneficiarios.Open;

  sDataInicioOriginal := qryBeneficiarios.FieldByName('DataInicio').AsString;

  if piNumeroProcesso <= 0
  then stxtProcesso.Caption := 'Processo Nº '
  else stxtProcesso.Caption := 'Processo Nº '+IntToStr(piNumeroProcesso);

  iIdLoteConcessao := -1;

end; // SelecionaProcesso

procedure TfrmLiberaBeneficioProvisorio.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
var
    sMesRef,
    sIdTpPagtoAnt,
    sFlgBenefMinimo,
    sValorSalario,
    sValorReserva : string;
begin
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value := piIdPessJur;
  qryTitular.ParamByName('IdPlanoPrev').Value := piIdPlanoPrev;
  qryTitular.ParamByName('SeqProposta').Value := piSeqProposta;
  qryTitular.Open;

  with qryContaBancaria do
  begin
     Close;
     ParamByName('IdPessoa').Value := piIdTitular;
     Open;
  end;

  // Dados da Patrocinadora e do Plano
  sNomePatro    := qryTitular.FieldByName('NomePatro').AsString;
  sNomePlano    := qryTitular.FieldByName('NomePlano').AsString;
  sNomeTitular  := qryTitular.FieldByName('Nome').AsString;
  sMatricula    := qryTitular.FieldByName('Matricula').AsString;
  sValorReserva := CalcReservaPart( piIdPessJur, piIdPlanoPrev, piIdTitular, -1,
                                    piSeqProposta , DateToStr(date), DateToStr(date),
                                    '','',
                                    '-1' , qryAux);

  sMesRef        := Copy(DateToStr(date),7,4)+'/'+Copy(DateToSTr(date),4,2);
  sValorSalario  := CalcSALPART(piIdPessJur, piIdTitular,sMesRef,qryAux);
  sTipoSitFunc   := qryTitular.FieldbyName('TipoSit').AsString;

  sNomeSitPart   := qryTitular.FieldByName('NomeSitPart').AsString;
  sNomeSitFunc   := qryTitular.FieldByName('NomeSitFunc').AsString;
  sNomeSitPlano  := qryTitular.FieldByName('NomeSitPlano').AsString;

  with dtmAPrev.qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT EP.IDSITFUNCATUAL, EP.IDSITFUNCNOVO, EP.IDSITPLANOATUAL, EP.IDSITPLANONOVO, '+
             '        EP.IDSITPARTATUAL, EP.IDSITPARTNOVO, SP.FLGINTERNO AS FLGINTERNOATUAL, '+
             '        SP2.FLGINTERNO AS FLGINTERNONOVO                                       '+
             ' FROM   EVENTOSPREV EP, SITPART SP, SITPART SP2  '+
             ' WHERE  EP.IDSITPARTATUAL  = SP.IDSITPART        '+
             ' AND    EP.IDSITPARTNOVO   = SP2.IDSITPART       '+
             ' AND    EP.IDPESSJUR       = '+IntToStr(iIdPessJur)+
             ' AND    EP.IDPLANOPREV     = '+IntToStr(iIdPlanoPrev)+
             ' AND    EP.IDPESSOA        = '+IntToStr(iIdTitular)+
             ' AND    EP.SEQPROPOSTA     = '+IntToStr(iSeqProposta)+
             ' AND    EP.IDEVENTOGERADOR = '+IntToStr(qryProcesso.FieldByName('IdEventoGerador').AsInteger));
     Open;
     if not IsEmpty
     then begin
        sFlgInternoAntes   := FieldByName('FLGINTERNOATUAL').AsString;
        sFlgInternoDepois  := FieldByName('FLGINTERNONOVO').AsString;
        sIdSitPartAntes    := FieldByName('IDSITPARTATUAL').AsString;
        sIdSitPartDepois   := FieldByName('IDSITPARTNOVO').AsString;
        sIdSitFuncAntes    := FieldByName('IDSITFUNCATUAL').AsString;
        sIdSitFuncDepois   := FieldByName('IDSITFUNCNOVO').AsString;
        sIdSitPlanAntes    := FieldByName('IDSITPLANOATUAL').AsString;
        sIdSitPlanDepois   := FieldByName('IDSITPLANONOVO').AsString;
     end
     else begin
        sFlgInternoAntes   := '';
        sFlgInternoDepois  := '';
        sIdSitPartAntes    := '';
        sIdSitPartDepois   := qryTitular.FieldbyName('IdSitPart').AsString;
        sIdSitFuncAntes    := '';
        sIdSitFuncDepois   := qryTitular.FieldbyName('IdSitFunc').AsString;
        sIdSitPlanAntes    := '';
        sIdSitPlanDepois   := qryTitular.FieldbyName('IdSitPlanoPrev').AsString;
     end;
  end;
end; //PreencheDadosTitular



procedure TfrmLiberaBeneficioProvisorio.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
  begin
     iNumeroProcesso  := StrToInt(MontaSelect.ValoresChave[0]);
     iIdTitular       := StrToInt(MontaSelect.ValoresChave[1]);
     iSeqProposta     := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPessJur       := StrToInt(MontaSelect.ValoresChave[3]);
     iIdPlanoPrev     := StrToInt(MontaSelect.ValoresChave[4]);

     sDataEventoMs    := MontaSelect.ValoresChave[5];
     sIdEventoGerador := MontaSelect.ValoresChave[6];

     SelecionaProcesso(iNumeroProcesso);
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);

     sbtnAlteraData.Enabled := True;
     bbtnConfirmar.Enabled  := False;
     bbtnCancelar.Enabled   := False;
  end
  else sbtnAlteraData.Enabled := False;
end;

procedure TfrmLiberaBeneficioProvisorio.FormShow(Sender: TObject);
begin
  inherited;
  LimpaTela;
  bbtnConfirmar.Enabled  := False;
  bbtnCancelar.Enabled   := False;
  sbtnAlteraData.Enabled := False;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 25.06.2003

end;

procedure TfrmLiberaBeneficioProvisorio.dbgrdDemonstrativoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
end;



procedure TfrmLiberaBeneficioProvisorio.sbtnAlteraDataClick(Sender: TObject);
var
    mrNovaData        : TModalResult;
    sSQL,

    sDataFolha,
    sFlgIntSitPart,
    sUltMesReajuste,
    sMsgErro        ,
    sFlgIntEvento   : string;

    bOK,
    bErro,
    bVoltaSituacao,
    bLiberaTodosDepen      : boolean;

    dValorSRB,
    rValorAtualizado,
    rValorIntegral    : double;

    iTipoDevolucao    : integer;

    iIdPessoaAtual,
    iIdEventoAnterior,
    iUltDiaMesLote,
    iIdSitPart,
    iNumRecebimento        : longint;
    sSalarioIntegral,
    sDataFinalSalario,
    sTipCodigo,
    sCodTipRecDes,
    sRecPag,
    sCodTipDoc,
    sCodPortForma,
    sCodCentroRespon,
    sCodSubConta,
    sCodCentroCustoD,
    sIdEmpresa,
    sCodCentroCustoC,
    sPlaContaD,
    sPlano,
    sPlaContaC,
    sUnidNegoc,
    sIdEmpresaProp,
    sPlaContaDProvis,    
    sPlaContaCProvis,    
    sNumProc                : String; 
begin
  inherited;

  if Trim(dtInicioLiberacao.Text) = ''
  then begin
     MsgDlg('Informe a Data de Referência da Liberação','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if MsgDlg('Deseja alterar valores ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes
    Then Begin
         sNumProc := IntToStr(iNumeroProcesso);
         AbreRequerParticip('AV',                      // psTipoChamador  - AV ALTERA VALOR
                            IntToStr(iIdTitular),      // pIdTitular
                            IntToStr(iIdPessjur),      // pIdPessjur
                            IntToStr(iIdPlanoPrev),    // pIdPlanoPrev
                            '1',                       // pSeqProposta
                            sDataEventoMs,             // pDataEvento
                            '',                        // pDataFinalEvento
                            sIdEventoGerador,          // pIdEventoGerador
                            '',                        // pFlgTpDemissao
                            sNumProc,                  // psNumerosProcessos Var
                            '',                        // psTipoSitFuncAntes
                            '',                        // psFlgInternoAntes
                            '',                        // psFlgInternoDepois
                            '',                        // psIdSitPartAntes
                            '',                        // psIdSitPlanAntes
                            '',                        // psIdSitFuncAntes
                            '',                        // psIdSitPartDepois
                            '',                        // psIdSitPlanDepois
                            '',                       // psIdSitPartDepois
                            '',                        // Tempo de Servico 
                            ''); 

         SelecionaProcesso(iNumeroProcesso);
         PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
    End;

  if qryBeneficiarios.FieldByName('IDTITULAR').AsString <> qryBeneficiarios.FieldbyName('IDPESSOA').AsString
  then begin
     if MsgDlg('Este benefício é pago para BENEFICIÁRIOS. Deseja liberá-lo para todos os beneficiários ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes
     then bLiberaTodosDepen := True
     else bLiberaTodosDepen := False;
  end
  else bLiberaTodosDepen    := True;

  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.RollBack;

  dtmBaseDados.dbBaseDados.StartTransaction;

  if qryBeneficiarios.FieldByName('FlgDataPrevista').AsInteger = 1
  then sDataFinalAnt := qryBeneficiarios.FieldByName('DataFinalPrevista').AsString
  else sDataFinalAnt := qryBeneficiarios.FieldByName('DataFinal').AsString;

  sDataInicioOriginal := qryBeneficiarios.FieldByName('DataInicio').AsString;

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

  // Se for uma prorrogacao
  // Entao sair, pois basta trocar a data final
  // Senao Se for uma renovacao
  //       Entao pagar benefício desde esta data sem recalcular
  //       Senao pagar beneficio desde esta data, porém recalculando
  if iIdLoteConcessao <= 0
  then begin
     iIdLoteConcessao := SelecionaLoteBeneficioAberto( sAnoMesPagamento, iFlgIncluiMesConc );

     if iIdLoteConcessao <= 0
     then begin
        bErro := True;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Nenhum lote selecinado para efetuar a Liberação. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;
  end;

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT DATAPREPARO, MESREFERENCIA FROM CTRLINTERFACE '+
             ' WHERE  IDLOTE = '+IntToStr(iIdLoteConcessao));
     Open;
     sDataFolha       := FieldByName('DATAPREPARO').AsString;
     sAnoMesPagamento := FieldByName('MESREFERENCIA').AsString;
  end;

  iIdPessoaAtual := qryBeneficiarios.FieldByName('IDPESSOA').AsInteger;

  qryBeneficiarios.First;
  while not qryBeneficiarios.Eof do
  begin
     // Se for para renovar para apenas um beneficiario e a query estiver posicionada em
     // outro, entao ir para proximo
     if (not bLiberaTodosDepen) and (qryBeneficiarios.FieldByName('IDPESSOA').AsString <> IntToStr(iIdPessoaAtual))
     then begin
        qryBeneficiarios.Next;
        continue
     end;

     // Atualizar situação do benefício
     // Se o beneficio tem datafinal <= MESATUAL
     // Entao Se a data final for no mes ATUAL (mes do lote)
     //       Entao Se o parametro de concessao for para conceder até mes anterior
     //             Entao NAO ENCERRAR BENEFICIO e NAO PAGAR MES ATUAL
     //             Senao ENCERRAR BENEFICIO e PAGAR MES ATUAL
     //       Senao // data final anterior ao mes atual
     //             ENCERRAR BENEFICIO e PAGAR ULTIMO MES
     frmAguarde.Mostra(qryBeneficiarios.FieldByName('Nome').AsString);

     sSQL := ' UPDATE BENEFBFCIARIO SET DATAINICIOFUND    = TO_DATE('''+dtInicioLiberacao.Text+''', ''DD/MM/YYYY''), '+
             '                          DATAFINALPREVISTA = NULL, '+
             '                          FLGPROVISORIO     = 0,    '+ // CAMILLE - 20.12.2002
             '                          FLGDATAPREVISTA   = 0,    '+
             '                          MESPAGLIBERACAO   = '''+sAnoMesPagamento+''','+
             '                          DATALIBERACAO     = TO_DATE('''+DateToStr(date)+''', ''DD/MM/YYYY'') ';

     if Trim(dtFinalLiberacao.Text) = ''
     then sSQL := sSQL +', IDSITBENEFICIO = 1 '
     else begin
        if Copy(Trim(dtFinalLiberacao.Text),7,4)+'/'+Copy(Trim(dtFinalLiberacao.Text),4,2) <= sAnoMesPagamento
        then sSQL := sSQL +', IDSITBENEFICIO = 3 '
        else sSQL := sSQL +', IDSITBENEFICIO = 1 ';
        sSQL      := sSQL +', DATAFINAL         = TO_DATE('''+dtFinalLiberacao.Text+''', ''DD/MM/YYYY'') ';
     end;

     // Atualizar todos os benefícios da pessoa do processo que não sejam de pagamento único
     // Se o processo for do titular, atualizará todos do participante
     sSQL := sSQL +' WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+
                   ' AND   IDPESSOA       = '+ qryBeneficiarios.FieldByName('IDPESSOA').AsString;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSQL);
     try
        qryAux.ExecSQL;
     except
        frmAguarde.Apaga;
        MsgDlg('Erro ao atualizar situação do benefício.', 'Erro', mtError, [mbOK],0);
        dtmBaseDados.dbBaseDados.RollBack;
        Exit;
     end;

     // ************************************************************************
     // RECALCULAR PAGAMENTOS E INSERIR A DEVOLUCAO DO PAGO E O PAGAMENTO DO
     // DO VALOR DO BENEFÍCIO INTEGRAL ( 100% )
     // ************************************************************************
     rValorIntegral  := PegaValorIntegral( qryAux,
                                           iNumeroProcesso,
                                           qryBeneficiarios.FieldByName('IdBeneficio').AsInteger,
                                           qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                           sDataInicioOriginal ); 

     if qryBeneficiarios.FieldByName('PERCPROVISORIO').AsFloat > 0
     then rValorIntegral  := ( rValorIntegral * 100 ) / qryBeneficiarios.FieldByName('PERCPROVISORIO').AsFloat;

     sUltMesReajuste := '0000/00';
     dValorSRB       := qryBeneficiarios.FieldByName('VALORSRB').AsFloat;


     // Calcular o benefício integral desde a data início original e, em seguida,
     // inserir a devolucao de todos os beneficios provisorios pagos
     bOk := PreparaBeneficioConcedido(qryAux,
                                      iIdTitular,
                                      qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                      iSeqProposta,
                                      iIdPessJur,
                                      iIdPlanoPrev,
                                      iNumeroProcesso,
                                      qryBeneficiarios.FieldByName('IdBeneficio').AsInteger,
                                      prmIDMOTIVOFOLHABEN,
                                      qryBeneficiarios.RecordCount,
                                      qryBeneficiarios.FieldByName('IdRegraCalculo').AsInteger,
                                      -1,
                                      qryBeneficiarios.FieldByName('IdRegraPrimPagto').AsInteger,
                                      qryBeneficiarios.FieldByName('IdRegraUltPagto').AsInteger,
                                      qryBeneficiarios.FieldByName('IdTpPagtoBenefic').AsInteger,
                                      qryBeneficiarios.FieldByName('CODPORTFORMA').AsInteger,
                                      qryBeneficiarios.FieldByName('NomeBeneficio').AsString,
                                      sNomePatro, sNomePlano, sMatricula,
                                      dtInicioLiberacao.Text,
                                      dtFinalLiberacao.Text,
                                      qryBeneficiarios.FieldByName('flgCalcTodoMes').AsString,
                                      rValorIntegral,
                                      qryBeneficiarios.FieldByName('ValorCotas').AsFloat,
                                      qryBeneficiarios.FieldByName('ValorTotal').AsFloat,
                                      True,
                                      rValorAtualizado,
                                      rValorAtualizado,
                                      sUltMesReajuste,
                                      bErro,
                                      bAux,
                                      sMsgErro, iIdLoteConcessao,
                                      qryBeneficiarios.FieldByName('DataInicio').AsString,
                                      2, // = reabertura
                                      iFlgDataPrevista,
                                      dValorSRB,
                                      iIdCalculoGeral);


     if bErro
     then begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg(sMsgErro+' O benefício não será alterado até que o problema seja resolvido. ','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Exit;
     end;

     // Inserir devolucoes
     with qryAcertos do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT HST.MESREFERENCIA, HST.NUMEROPROCESSO, HST.IDPESSOA,     HST.IDPESSJUR,         '+
                '        HST.IDPLANOPREV,   HST.SEQPROPOSTA,    HST.IDBENEFICIO,  HST.VALORINTEGRAL,     '+
                '        DECODE(HST.VLBENEFPGTO, NULL, HST.VALORPREV, HST.VLBENEFPGTO) AS VALORDEVOLVER  '+
                ' FROM   HSTBENEFBFCIARIO HST '+
                ' WHERE  HST.IDBENEFICIO    = '+qryBeneficiarios.FieldByName('IDBENEFICIO').AsString+
                ' AND    HST.IDPESSJUR      = '+qryBeneficiarios.FieldByName('IDPESSJUR').AsString+
                ' AND    HST.IDPESSOA       = '+qryBeneficiarios.FieldByName('IDPESSOA').AsString+
                ' AND    HST.IDPLANOPREV    = '+qryBeneficiarios.FieldByName('IDPLANOPREV').AsString+
                ' AND    HST.IDTITULAR      = '+qryBeneficiarios.FieldByName('IDTITULAR').AsString+
                ' AND    HST.IDPLANOORIGEM  = '+qryBeneficiarios.FieldByName('IDPLANOORIGEM').AsString+
                ' AND    HST.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
                ' AND    ((HST.IDLOTE IS NULL) OR (HST.IDLOTE <> '+IntToStr(iIdLoteConcessao)+')) '+
                ' AND    HST.FLGPROVISORIO  = 1 '); 

        Open;

        while not Eof do
        begin
           if not InsereHstBenefBfciario ( qryAux,
                                           1,
                                           iNumeroProcesso,
                                           qryBeneficiarios.FieldByName('IDBENEFICIO').AsInteger,
                                           qryBeneficiarios.FieldByName('IDPESSJUR').AsInteger,
                                           qryBeneficiarios.FieldByName('IDPLANOPREV').AsInteger,
                                           qryBeneficiarios.FieldByName('IDTITULAR').AsInteger,
                                           qryBeneficiarios.FieldByName('SEQPROPOSTA').AsInteger,
                                           qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                                           -1,
                                           prmIdMotivoDevolBen,
                                           qryBeneficiarios.FieldByName('CODPORTFORMA').AsInteger,
                                           FieldByName('MESREFERENCIA').AsString,
                                           sAnoMesPagamento,
                                           '',
                                           '-1',
                                           '',
                                           FieldByName('VALORDEVOLVER').AsFloat,
                                           FieldByName('VALORDEVOLVER').AsFloat,
                                           FieldByName('VALORINTEGRAL').AsFloat,
                                           0,
                                           0,
                                           1,
                                           1,
                                           iIdLoteConcessao,
                                           sMsgErro,sDataFolha )
           then begin
              frmAguarde.Apaga;
              dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro ao inserir devoluções ['+sMsgErro+'].','Erro',mtError,[mbOk,mbHelp],0);
              TiraSQL(qryAux);
              Exit;
           end;

           Next;
        end;

     end;

     CriaLogOcorrencia(qryBeneficiarios.FieldByName('idplanoprev').AsString,
                       qryBeneficiarios.FieldByName('idpessjur').AsString,
                       qryBeneficiarios.FieldByName('idtitular').AsString,
                       qryBeneficiarios.FieldByName('idbeneficio').AsString,
                       qryBeneficiarios.FieldByName('numeroprocesso').AsString,
                       qryBeneficiarios.FieldByName('idpessoa').AsString,
                       qryBeneficiarios.FieldByName('seqproposta').AsString,
                       '11', // sTipoMov
                       DateToStr(date),
                       FloatToStr(qryBeneficiarios.fieldbyname('valoratual').AsFloat),
                       FloatToStr(qryBeneficiarios.fieldbyname('valortotal').AsFloat),
                       FloatToStr(qryBeneficiarios.fieldbyname('valorcotas').AsFloat),
                       sDataInicioOriginal,
                       '', // NovaDataFinal
                       qryBeneficiarios.FieldByName('ValorAtualAnt').AsString,
                       qryBeneficiarios.FieldByName('DataInicioAnt').AsString,
                       sDataFinalAnt,
                       qryBeneficiarios.FieldByName('IdSitAnterior').AsString,
                       qryBeneficiarios.FieldByName('FlgDataPrevista').AsInteger,
                       qryAux,
                       '',
                       iIdLoteConcessao,
                       iIdCalculoGeral
                       );
     qryBeneficiarios.Next;
  end;

  // ************************************************************************
  // RECALCULAR CONTRIBUIÇÕES E INSERIR A DEVOLUCAO DO QUE FOI COBRADO E A
  // COBRANCA DO VALOR INTEGRAL
  // ************************************************************************
  frmAguarde.Mostra('Verificando contribuições ...');
  with qryAux do
  begin
     sSQL := ' SELECT HST.FLGINTEVENTO, COUNT(HST.MESREFERENCIA) AS TOTAL '+
             ' FROM   EVENTOGERADOR EG, CONTPREVEVENTO CE,    '+
             '        CONTRIBPREVPARTP CPP,   HSTCONTRIBPREV HST    '+
             ' WHERE CPP.IDPESSJUR      = '+ IntToStr(iIdPessJur)   +
             ' AND   CPP.IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) +
             ' AND   CPP.IDPESSOA       = '+ IntToStr(iIdTitular)   +
             ' AND   CPP.SEQPROPOSTA    = '+ IntToStr(iSeqProposta) +
             ' AND   CE.IDPLANOPREV     = CPP.IDPLANOPREV           '+
             ' AND   CE.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO         '+
             ' AND   CE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR        '+
             ' AND   EG.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+
             ' AND   HST.IDPESSJUR       = CPP.IDPESSJUR             '+
             ' AND   HST.IDPLANOPREV     = CPP.IDPLANOPREV           '+
             ' AND   HST.IDPESSOA        = CPP.IDPESSOA              '+
             ' AND   HST.SEQPROPOSTA     = CPP.SEQPROPOSTA           '+
             ' AND   HST.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO       '+
             ' AND   HST.MESREFERENCIA   >= '''+Copy(sDataInicioOriginal,7,4)+'/'+Copy(sDataInicioOriginal,4,2)+''''+
             ' GROUP BY HST.FLGINTEVENTO ' +
             ' ORDER BY HST.FLGINTEVENTO ';
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;

     If (not IsEmpty) and (FieldByName('TOTAL').AsInteger > 0)
     then begin
        Last;
        if Copy(FieldByName('FLGINTEVENTO').AsString,1,1) <> 'E'
        then sFlgIntEvento := 'E1'
        else sFlgIntEvento := 'E'+IntToStr(StrToInt(Copy(FieldByName('FLGINTEVENTO').AsString,2,1)));
     end
     else sFlgIntEvento :=  qryProcesso.FieldbyName('FLGINTERNO').AsString;
  end;

  sSQL := ' UPDATE CONTRIBPREVPARTP SET DATAINICIO  = TO_DATE('''+dtInicioLiberacao.Text+''', ''DD/MM/YYYY'') ';

  if Trim(dtFinalLiberacao.Text) = ''
  then begin
     sSQL := sSQL + ', DATAFINAL = NULL, FLGCOBRA  = 1 ';
  end
  else begin
     if Copy(Trim(dtFinalLiberacao.Text),7,4)+'/'+Copy(Trim(dtFinalLiberacao.Text),4,2) <= sAnoMesPagamento
     then sSQL := sSQL +', FLGCOBRA       = 0 '
     else sSQL := sSQL +', FLGCOBRA       = 1 ';
     sSQL := sSQL + ', DATAFINAL = TO_DATE('''+dtFinalLiberacao.Text+''', ''DD/MM/YYYY'') ';
  end;

  sSQL := sSQL +' WHERE IDPESSJUR      = '+ IntToStr(iIdPessJur)   +
                ' AND   IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) +
                ' AND   IDPESSOA       = '+ IntToStr(iIdTitular)   +
                ' AND   SEQPROPOSTA    = '+ IntToStr(iSeqProposta) +
                ' AND   DATAINICIO     >= TO_DATE('''+sDataInicioOriginal+''',''DD/MM/YYYY'') ';
  if Trim(sDataFinalAnt) <> ''
  then sSQL := sSQL + 'AND DATAFINAL = TO_DATE('''+sDataFinalAnt+''',''DD/MM/YYYY'') ';

  sSQL := sSQL +' AND   IDCONTRIBUICAO IN ( SELECT CE.IDCONTRIBUICAO FROM CONTPREVEVENTO CE '+
                '                               WHERE  CE.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+')';

   with qryAux do
   begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     ExecSQL;
   end;

  // Cobrar contribuicoes posteriores a data de inicio
  // Dentro da rotina de preparo, se já houver linha no histórico, a rotina irá inserir apenas a diferença
  sSQL := ' SELECT CPP.IDCONTRIBUICAO, CPP.SEQPROPOSTA,  CPP.IDCONTRIBUICAO, CPP.IDPESSOA,   '+
          '        CPP.CODPORTFORMA,   CPP.FLGDESCFOLHA, CPP.VALORBASE1,     CPP.VALORBASE2, '+
          '        CPP.VALORBASE3,     CPP.DATAINICIO,   CPP.DATAFINAL,      C.NOME,        '+
          '        PP.INSCRICAODATA,   PF.DATANASC,      CP.ORDEMCALCULO                   '+
          ' FROM   CONTRIBUICAO C, EVENTOGERADOR EG, CONTPREV CP,  CONTPREVEVENTO CE, PARTPREVPLAN PP,     '+
          '        CONTRIBPREVPARTP CPP,   PESSOAFISICA PF                               '+
          ' WHERE CPP.IDPESSJUR      = '+ IntToStr(iIdPessJur)   +
          ' AND   CPP.IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) +
          ' AND   CPP.IDPESSOA       = '+ IntToStr(iIdTitular)   +
          ' AND   CPP.SEQPROPOSTA    = '+ IntToStr(iSeqProposta) +
          ' AND   CPP.DATAINICIO     >= TO_DATE('''+dtInicioLiberacao.Text+''',''dd/mm/yyyy'') ';
  if Trim(dtFinalLiberacao.Text) <> ''
  then sSQL := sSQL + ' AND   CPP.DATAFINAL  = TO_DATE('''+dtFinalLiberacao.Text+''',''DD/MM/YYYY'') '
  else sSQL := sSQL + ' AND   CPP.DATAFINAL  IS NULL  ';

  sSQL := sSQL +' AND   CE.IDPLANOPREV     = CPP.IDPLANOPREV           '+
                ' AND   CE.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO         '+
                ' AND   CE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR        '+
                ' AND   EG.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+
                ' AND   CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO          '+
                ' AND   PP.IDPESSJUR       = CPP.IDPESSJUR             '+
                ' AND   PP.IDPLANOPREV     = CPP.IDPLANOPREV           '+
                ' AND   PP.IDPESSOA        = CPP.IDPESSOA              '+
                ' AND   PP.SEQPROPOSTA     = CPP.SEQPROPOSTA           '+
                ' AND   PF.IDPESSOA        = CPP.IDPESSOA              '+
                ' AND   CP.IDPLANOPREV     = CPP.IDPLANOPREV           '+
                ' AND   CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO        '+
                ' ORDER BY CP.ORDEMCALCULO ';

  bErro := PreparaContribuicaoASSISTIDO( iIdPessJur,
                                         iIdPlanoPrev,
                                         prmIDMOTIVOFOLHABEN,
                                         0,
                                         qryContrib, qryAux, sSQL,
                                         '', // sSQLRegra,
                                         '', // sWhereSQLRegra,
                                         '', // sAliasSQLRegra,
                                         'AS',
                                         'Contribuição de Assistido - Matrícula: ' + sMatricula+' - Processo n°: ' + IntToStr(iNumeroProcesso),
                                         'R','1',
                                         False,  // bValorQry
                                         False,  // bParaCobranca
                                         sMsgErro,
                                         iIdLoteConcessao,
                                         FloatToStr(rValorIntegral),
                                         sIdSitPartDepois,
                                         sFlgIntEvento,
                                         True,
                                         False,
                                         '',
                                         False,
                                         qryProcesso.FieldbyName('IdEventoGerador').AsInteger,
                                         dtInicioLiberacao.Text,
                                         dtFinalLiberacao.Text,
                                         3,
                                         0,
                                         sDataInicioOriginal,
                                         qryBeneficiarios.FieldByName('numeroprocesso').AsInteger);
  if bErro
  then begin
     frmAguarde.Apaga;
     dtmBaseDados.dbBaseDados.RollBack;
     MsgDlg('Erro ao preparar contribuições ['+sMsgErro+'].' ,'Erro',mtError,[mbOk,mbHelp],0);
     TiraSQL(qryAux);
     Exit;
  end;

  // Inserir devolucoes de contribuicao
  with qryAcertos do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT HST.MESREFERENCIA, HST.MESCOBRANCA,    HST.IDPESSOA,     HST.IDPESSJUR,                 '+
             '        HST.IDPLANOPREV,   HST.SEQPROPOSTA,    HST.IDCONTRIBUICAO,  HST.VALORESPERADO,          '+
             '        DECODE(HST.VALORRECEBIDO, NULL, HST.VALORESPERADO, HST.VALORRECEBIDO) AS VALORDEVOLVER, '+
             '        DECODE(CP.IDRUBDEVOLADIANT, NULL, CP.IDRUBRICADEVOLUC, CP.IDRUBDEVOLADIANT) AS IDRUBDEVOLADIANT   '+
             ' FROM   CONTPREV CP, CONTPREVEVENTO CE, HSTCONTRIBPREV HST '+
             ' WHERE  HST.IDPESSJUR      = '+qryBeneficiarios.FieldByName('IDPESSJUR').AsString+
             ' AND    HST.IDPLANOPREV    = '+qryBeneficiarios.FieldByName('IDPLANOPREV').AsString+
             ' AND    HST.IDPESSOA       = '+qryBeneficiarios.FieldByName('IDTITULAR').AsString+
             ' AND    HST.SEQPROPOSTA    = '+IntToStr(iSeqProposta)+
             ' AND    ((HST.IDLOTE IS NULL) OR (HST.IDLOTE <> '+IntToStr(iIdLoteConcessao)+')) '+
             ' AND    CP.IDPLANOPREV     = HST.IDPLANOPREV    '+
             ' AND    CP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO '+
             ' AND    CE.IDPLANOPREV     = CP.IDPLANOPREV           '+
             ' AND    CE.IDCONTRIBUICAO  = CP.IDCONTRIBUICAO         '+
             ' AND    CE.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString);
     Open;

     while not Eof do
     begin
        iNumRecebimento := InsereHstContribPREV( qryAux,
                                     qryBeneficiarios.FieldByName('IDTITULAR').AsInteger,
                                     qryBeneficiarios.FieldByName('SEQPROPOSTA').AsInteger,
                                     qryBeneficiarios.FieldByName('IDPESSJUR').AsInteger,
                                     qryBeneficiarios.FieldByName('IDPLANOPREV').AsInteger,
                                     FieldByName('IDCONTRIBUICAO').AsInteger,
                                     prmIdMotivoDevolBen,
                                     FieldByName('MESREFERENCIA').AsString,
                                     sAnoMesPagamento,
                                     -1,
                                     sDataFolha,
                                     '',
                                     FieldByName('VALORDEVOLVER').AsFloat,
                                     FieldByName('VALORDEVOLVER').AsFloat,
                                     0,
                                     -1,
                                     1,
                                     0,
                                     0,
                                     0,
                                     sDataInicioOriginal,
                                     sDataFinalAnt,
                                     'AS',
                                     1,
                                     0,
                                     iIdLoteConcessao,
                                     'F',
                                     0,
                                     1,
                                     1,
                                     1);
        if iNumRecebimento < 0
        then begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro ao inserir devoluções de contribuição.','Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Exit;
        end;

        // ******************************************************************************
        // Preencher Informacoes de Integracao com Financeiro e Contabilidade
        // ******************************************************************************
        if not dtmAPrevIntegraBack.BuscaInfIntegra( FieldByName('IDPESSJUR').AsInteger,
                                FieldByName('IDPLANOPREV').AsInteger,
                                FieldByName('IDPESSOA').AsInteger,
                                FieldByName('IDPESSOA').AsInteger,
                                FieldByName('IDCONTRIBUICAO').AsInteger,
                                'C',
                                'B',
                                1,
                                sAnoMesPagamento,
                                FieldByName('MesReferencia').AsString,
                                sTipCodigo,
                                sCodTipRecDes,
                                sRecPag,
                                sCodTipDoc,
                                sCodPortForma,
                                sCodCentroRespon,
                                sCodSubConta,
                                sCodCentroCustoD,
                                sIdEmpresa,
                                sCodCentroCustoC,
                                sPlaContaD,
                                sPlano,
                                sPlaContaC,
                                sPlaContaDProvis,   
                                sPlaContaCProvis,   
                                sUnidNegoc,
                                sIdEmpresaProp,
                                'R',  
                                True,
                                sMsgErro ) 
        then begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro ao buscar parametrização contábil/financeira para devolução.','Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Exit;
        end;

        // Inserir na TmpDesc
        if not InsereTMPDESC ( qryAux,
                               '',
                               sCodCentroCustoD,  // passar credito como centrocustod
                               sCodCentroCustoC,  // passar debito como centrocustoc
                               sCodCentroRespon,
                               '', '',
                               sCodPortForma, '',
                               sCodSubConta,
                               sCodTipDoc, sCodTipRecDes, '',
                               sDataFolha,
                               '',
                               sDataFolha,
                               'Devolução de Contribuição', '-1', '',
                               'D', 'B', '0',
                               '0',
                               '', 'P',
                               FieldByName('IdContribuicao').AsString,
                               '', sIdEmpresaProp, sIdEmpresaProp,
                               FieldByName('IdPessoa').AsString,
                               IntToStr(iIdFundacao),
                               IntToStr(iIdLoteConcessao),
                               IntToStr(Sistema.IdModulo),
                               IntToStr(prmIdMotivoDevolBen),
                               FieldByName('IdPessJur').AsString,
                               FieldByName('IdPessoa').AsString,
                               FieldByName('IdPlanoPrev').AsString,
                               '',
                               FieldByName('IDRUBDEVOLADIANT').AsString,
                               FieldByName('IDPESSOA').AsString,
                               qryTitular.FieldByName('INSCRICAONUMERO').AsString,
                               '',
                               sAnoMesPagamento,
                               FieldByName('MesReferencia').AsString,
                               '',
                               '-1',
                               sPlaContaD, // passar conta credito como placontad
                               sPlaContaC, // passar conta debido como placontad
                               sPlano,
                               'P',
                               '***',
                               '1',
                               IntToStr(Sistema.IdModulo),
                               '0',
                               prmTpOperFolhaBen,
                               sUnidNegoc,
                               FieldByName('VALORDEVOLVER').AsString,
                               '0',
                               '0',
                               '0',
                               '',
                               '',
                               iNumRecebimento) 
        then begin
           if Trim(sMsgErro) = ''
           then  sMsgErro := ' Erro no da devolução envio para Folha de Benefícios.';
           bErro    := True;
           break;
        end;

        Next;
     end;

  end;

  MostraDemonstrativoConcessao;
end;

procedure TfrmLiberaBeneficioProvisorio.MostraDemonstrativoConcessao;
var dTotalBeneficio : double;
    sSalarioNaDib   : string;
    sOpcoesContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo da Liberação de Benefício ...');

   qryResultado.Close;
   qryResultado.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
   qryResultado.Open;

   qryAux.Close;

   If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);

   frmMostraAux.Caption := 'Resumo da Liberação de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('----------------------------------------------------------------------------------------------');
      Add(PreparaStr(' '                                      , 33)+
          PreparaStr('DEMONSTRATIVO DE LIBERAÇÃO DE BENEFÍCIO', 40)+
          PreparaStr(' - VERSÃO : '+Sistema.Versao            , 25));
      Add(PreparaStr(' '                                      , 33)+
          PreparaStr(' '                                      , 40)+
          PreparaStr('LOTE   : '+IntToStr(iIdLoteConcessao)   , 25));
      Add(PreparaStr('USUÁRIO : '+Sistema.NomeUsuario         , 33)+
          PreparaStr(' '                                      , 40)+
          PreparaStr('DATA DA LIBERAÇÃO : '+DateToStr(date)   , 25));
      Add('----------------------------------------------------------------------------------------------');
      Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString);
      Add('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString);

      // Conta Bancaria
      Add('----------------------------------------------------------------------------------------------');
      Add('Conta Bancária Preferencial : ');
      if not qryContaBancaria.IsEmpty
      then begin
         Add('Banco    : '+qryContaBancaria.FieldByName('Banco').AsString);
         Add('Agência  : '+qryContaBancaria.FieldByName('Agencia').AsString);
         Add('Conta Nº : '+qryContaBancaria.FieldByName('ContaCorrente').AsString);
      end
      else begin
         Add(' < não cadastrada até o momento > ');
      end;
      Add('----------------------------------------------------------------------------------------------');

      // Dados na Patrocinadora
      Add('  ');
      Add(PreparaStr('Patrocinadora  : '  +qryTitular.FieldByName('NomePatro').AsString,50)+
          PreparaStr('Matrícula : '       +qryTitular.FieldByName('Matricula').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Admissão : '+qryTitular.FieldByName('DataAdmissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Data de Demissão : '+qryTitular.FieldByName('DataDemissao').AsString,49));

      Add(PreparaStr(' ',50)+
          PreparaStr('Tempo Serv. Total : '+qryTitular.FieldByName('TempoServTotal').AsString+' anos '+
                                            qryTitular.FieldByName('TempoServTotMes').AsString+' meses '+
                                            qryTitular.FieldByName('TempoServTotDia').AsString+' dias ',49));

      // Dados no Plano
      Add('  ');
      Add('Plano Previdenciário : '+qryTitular.FieldByName('NomePlano').AsString);
      Add('Número de Inscrição  : '+qryTitular.FieldByName('InscricaoNumero').AsString);
      Add('Data de Inscrição    : '+qryTitular.FieldByName('InscricaoData').AsString);

      Add('----------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qryProcesso.FieldbyName('NumeroProcesso').AsString);
      Add('EVENTO : '+qryProcesso.FieldbyName('NOME').AsString+ ' - DATA DO EVENTO : '+qryProcesso.FieldbyName('DTEVENTO').AsString);
      Add('----------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS :');
      qryResultado.First;
      dTotalBeneficio := 0;
      while not qryResultado.Eof do
      begin
         Add('----------------------------------------------------------------------------------------------');
         Add('- '+qryResultado.FieldByName('Nome').AsString);
         Add(' ');
         Add(' '+PreparaStr('Data de Requerimento : '+qryResultado.FieldByName('DataRequerimento').AsString, 50)+
                 PreparaStr('Data de Concessão : '+qryResultado.FieldByName('DataConcessao').AsString, 49));

         if qryResultado.FieldByName('FlgResgate').AsInteger = 0 // nao é resgate
         then begin
            Add(' '+PreparaStr('Data de Início no INSS : '+qryResultado.FieldByName('DataInicioINSS').AsString,50)+
                    PreparaStr('Data de Início na Fundação : '+qryResultado.FieldByName('DataInicioFUND').AsString,49));
            if Trim(sDataFinalAnt) <> ''
            then Add(' '+PreparaStr(' ',50)+
                         PreparaStr('Data Final Anterior : '+ DateToStr( StrToDate(sDataFinalAnt) ),49))
            else Add(' '+PreparaStr(' ',50)+
                         PreparaStr('Data Final Anterior : <indefinida>',49));


            if (qryResultado.FieldByName('FLGDATAPREVISTA').AsInteger = 1) and (qryResultado.FieldByName('DATAFINALPREVISTA').AsString <> '')
            then Add(PreparaStr(' ',50)+' '+PreparaStr('Nova Data Final (Prevista) : '+qryResultado.FieldByName('DATAFINALPREVISTA').AsString,49))
            else if qryResultado.FieldByName('DATAFINAL').AsString <> ''
                 then Add(PreparaStr(' ',50)+' '+PreparaStr('Nova Data Final (Efetiva) : '+qryResultado.FieldByName('DATAFINAL').AsString,49))
                 else Add(PreparaStr(' ',50)+' '+PreparaStr('Nova Data Final : <indefinida> ',49));

            Add(' '+PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VLRCALCINSS').AsFloat),50)+
                PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VLRINFINSS').AsFloat),49));
         end
         else begin // é resgate
            Add(' Data de Início na Fundação : '+qryResultado.FieldByName('DataInicioFUND').AsString);
         end;


         Add(' Salário de Participação anterior ao Evento = R$ '+FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioNaDib))));
         Add(' Valor do Benefício = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VALORATUAL').AsFloat));

         dTotalBeneficio := dTotalBeneficio + qryResultado.FieldByName('VALORATUAL').AsFloat;
         qryResultado.Next;
      end; // while not qryResultado.Eof

      Add(' Total dos Benefícios do Processo : '+FormatFloat('#0.00', dTotalBeneficio));
      Add('----------------------------------------------------------------------------------------------');


      Add('----------------------------------------------------------------------------------------------');

      qryResultado.First;

      // Mostrar mês a mês quanto será pago e quanto será descontado
      Add('----------------------------------------------------------------------------------------------');
      Add('=> VALORES A PAGAR / RECEBER                                                                                         ');
      Add('----------------------------------------------------------------------------------------------');
      Add('MÊS      ITEM                                              PAGAR       DESCONTAR    [ORIGINAL]');
      Add(' ');

      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV, H.VALORPREVMIN '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDPESSOA         = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.FLGDEVOLUCAO     = 0 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;

         First;
         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                 PreparaStr(FieldByName('Nome').AsString                          ,45)+
                 PreparaStr(' '                                                   ,5)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,12)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrevMin').AsFloat) ,12));
            Next;
         end;
      end;

      // Buscar CONTRIBUICOES a devolver no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT C.NOME, HST.MESREFERENCIA, HST.VALORESPERADO             '+
                 ' FROM   CONTRIBUICAO C, HSTCONTRIBPREV HST '+
                 ' WHERE  HST.IDPESSJUR       = ' + qryResultado.FieldByName('IdPessJur').AsString   +
                 ' AND    HST.IDPLANOPREV     = ' + qryResultado.FieldByName('IdPlanoPrev').AsString +
                 ' AND    HST.IDPESSOA        = ' + qryResultado.FieldByName('IdPessoa').AsString    +
                 ' AND    HST.SEQPROPOSTA     = ' + qryResultado.FieldByName('SeqProposta').AsString +
                 ' AND    HST.IDLOTE          = '+IntToStr(iIdLoteConcessao)+
                 ' AND    HST.FLGDEVOLUCAO    = 1 '+
                 ' AND    HST.FLGDESCFOLHA    = 1 '+
                 ' AND    HST.FLGCONCESSAO    = 1 '+
                 ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                 ' ORDER BY C.NOME, HST.MESREFERENCIA');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                           ,9)+
                 PreparaStr(FieldByName('Nome').AsString                                    ,45)+
                 PreparaStr(' '                                                             ,5)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                    ,12));
            Next;
         end;
      end;

      // Buscar Beneficios a devolver(descontar) no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                 ' AND    H.IDPESSOA         = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.FLGDEVOLUCAO     = 1 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                 PreparaStr(FieldByName('Nome').AsString                                 ,45)+
                 PreparaStr(' '                                                          ,5)+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                 ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)  ,12));
            Next;
         end;
      end;

      // Buscar CONTRIBUICOES a COBRAR no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT C.IDCONTRIBUICAO, C.NOME, CP.NOMEVALORBASE1, CP.NOMEVALORBASE2, CP.NOMEVALORBASE3, CP.NUMOPCOES, '+
                 '        CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,                                '+
                 '        HST.MESREFERENCIA, HST.VALORESPERADO                                           '+
                 ' FROM   CONTRIBUICAO C, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST '+
                 ' WHERE  HST.IDPESSJUR       = ' + qryResultado.FieldByName('IdPessJur').AsString   +
                 ' AND    HST.IDPLANOPREV     = ' + qryResultado.FieldByName('IdPlanoPrev').AsString +
                 ' AND    HST.IDPESSOA        = ' + qryResultado.FieldByName('IdPessoa').AsString    +
                 ' AND    HST.SEQPROPOSTA     = ' + qryResultado.FieldByName('SeqProposta').AsString +
                 ' AND    HST.IDLOTE          = '+IntToStr(iIdLoteConcessao)+
                 ' AND    HST.FLGDEVOLUCAO    = 0 '+
                 ' AND    HST.FLGDESCFOLHA    = 1 '+
                 ' AND    HST.FLGCONCESSAO    = 1 '+
                 ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                 ' AND    CPP.IDPESSJUR       = HST.IDPESSJUR       '+
                 ' AND    CPP.IDPLANOPREV     = HST.IDPLANOPREV     '+
                 ' AND    CPP.IDPESSOA        = HST.IDPESSOA        '+
                 ' AND    CPP.SEQPROPOSTA     = HST.SEQPROPOSTA     '+
                 ' AND    CPP.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO  '+
                 ' AND    CP.IDPLANOPREV      = CPP.IDPLANOPREV     '+
                 ' AND    CP.IDCONTRIBUICAO   = CPP.IDCONTRIBUICAO  '+
                 ' ORDER BY C.NOME, HST.MESREFERENCIA ');
         Open;
         sOpcoesContrib     := '';
         iIdContribAnterior := -1;
         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                            ,9)+
                 PreparaStr(FieldByName('Nome').AsString                                     ,45)+
                 PreparaStr(' '                                                              ,5)+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                     ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat)  ,12));

            iIdContribAtual    := FieldByName('IDCONTRIBUICAO').AsInteger;
            if iIdContribAtual <> iIdContribAnterior
            then begin
               sOpcoesContrib := sOpcoesContrib+#13+#10+
                                 PreparaStr(FieldByName('Nome').AsString                             ,50)+
                                 PreparaStr(' '                                                      ,5)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE1').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE2').AsFloat) ,13)+
                                 PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE3').AsFloat) ,7);
               iIdContribAnterior := FieldByName('IDCONTRIBUICAO').AsInteger;
            end;
            Next;
         end;
      end;

      // Mostrar opções de contribuições a cobrar
      Add('----------------------------------------------------------------------------------------------');
      Add('=> OPÇÕES DE CONTRIBUIÇÕES A COBRAR  ');
      Add('----------------------------------------------------------------------------------------------');
      Add('CONTRIBUIÇÃO                                           OPÇÃO 1      OPÇÃO 2      OPÇÃO 3 ');
      Add(sOpcoesContrib);

      Add('----------------------------------------------------------------------------------------------');
      Add('                               APENAS PARA CONFERÊNCIA ');
      Add('----------------------------------------------------------------------------------------------');
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end; // MostraDemonstrativoConcessao

procedure TfrmLiberaBeneficioProvisorio.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;

  MsgDlg('Liberação de Benefício Cancelada.','Informação',mtInformation,[mbOk,mbHelp],0);
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

procedure TfrmLiberaBeneficioProvisorio.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma a Liberação do Benefício ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
  then begin
     bbtnCancelarClick(Sender);
     Exit;
  end;

    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


  dtmBaseDados.dbBaseDados.Commit;
  MsgDlg('Liberação do Benefício efetuada com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  bbtnConfirmar.Enabled  := False;
  bbtnCancelar.Enabled   := False;
  sbtnAlteraData.Enabled := False;
end;

procedure TfrmLiberaBeneficioProvisorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;
  inherited;
end;

procedure TfrmLiberaBeneficioProvisorio.bbtnSairClick(Sender: TObject);
begin  
  if dtmBaseDados.dbBaseDados.InTransaction
  then begin
     if MsgDlg('Existe uma operação em aberto. Deseja fechar a tela ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo
     then Abort
     else dtmBaseDados.dbBaseDados.Rollback;
  end;
  inherited;
end;



end.