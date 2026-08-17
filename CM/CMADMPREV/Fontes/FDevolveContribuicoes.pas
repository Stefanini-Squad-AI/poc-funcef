// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Pendência   : SIG78937
//Responsável : Everson Cunha
//Data        : 10/12/2018
//Descrição   : Inserido hint na consulta SQL (qryHstContrib), conforme pedido
//              pela TMax. FDevolveContribuicoes.dfm
//------------------------------------------------------------------------------
//Pendência   : SOL 130119 KINTANA 789646
//Responsável : BRUNO AZEVEDO
//Data        : 28/04/2010
//Descrição   : Ratear o valor das devoluções de acordo com o fim da manutenção.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : FazerDevolucaoUltimoPagamento e FazerDevolucao
// Data        : 11/01/2006
// Pendência   : 19538
// Alteração   : Inclusão de dois novos parâmetros
//               (sPlaContaDProvis e sPlaContaCProvis)
// -----------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Rotina      : FazerDevolucao / FazerDevolucaoUltimoPagamento
// Data        : 25/10/2005
// Pendencia   : 20518
// Alteração   : Passar para a função InsereTmpDesc o número do recebimento
//               inserido na HstContribPrev.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Rotina      : FazerDevolucao e FazerDevolucaoUltimoPagamento
// Data        : 12/09/2005
// Pendencia   : 20169
// Alteração   : Inclusão de novo parâmetro (sNaturezaDocumento) na chamada
//               da rotina dtmAPrevIntegraBack.BuscaInfIntegra
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 28/04/2005
// Pendencia   :
// Rotina      : chamadas da função dtmAPrevIntegraBack.BuscaInfIntegra
// Alteração   : passagem do parâmetro sMsgErro para a função
//               dtmAPrevIntegraBack.BuscaInfIntegra, para que esta retorne
//               uma possível mensagem de erro, já que ela não aciona mais
//               um MSGDLG diretamente
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : FazerDevolucao
//  Data       : 13.10.2004
//  Descrição  : troquei, em casoi de prim pagto, de IDREGRACALCULO
//               para IDREGRAPRIMPAGTO
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : AbateDaReserva
//  Data       : 20.09.2004
//  Descrição  : passagem dos campos DATAPREVISAORECE e VALORESPERADO
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : qryHstContrib - DevolveContribuicoes
//  Data       : 20.09.2004
//  Descrição  : Inclusão da cláusula AND(HST.FLGSITFUNDACAO = :FLGSITFUNDACAO).
//               Alteração para a tela NÃO mostrar contribuições da
//               situação anterior.
//               Fiz apenas para o evento de retorno para ativo, pois as
//               contrib de ativo do período não devem ser devolvidas.
//               Tratamento na abertura da query.
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Diversas
//  Data       : 19.08.2004
//  Pendência  : MELHORIA
//  Descrição  : A tela não irá mais exibir os check box no grid ( aceita e
//               devolve ), mas sim exibir uma mensagem no começo perguntado
//               se a pessoa deseja devolver. Se sim, abre a tela.
//               Se não, marca as contribuicoes com optratdiverg = 9 e sai.
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : qryHstContrib e qryDocumentos
//  Data       : 14/07/2004
//  Pendência  : 17182
//  Descrição  : Inclusão do campo IDMOTIVO (qryHstContrib) e IDCONTRIBUICAO
//               (qryDocumentos) para não mais dar erro na função
//               EnviaContribuicaoBANCO.
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 07.07.2004
//  Pendência  : 16240
//  Descrição  : Acerto no tratamento do folhaorigem
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : -----
//  Data       : 07.07.2004
//  Pendência  : 17155
//  Descrição  : Gerar RAD na inclusao de documentos
//------------------------------------------------------------------------------
// Rotina      : FazerDevolucao
// Autor(a)    : Camille
// Data        : 12.04.2004
// Pendência   : 16240
// Alteração   : Gravar folha origem
//------------------------------------------------------------------------------
// Rotina      : FazerDevolucao
// Autor(a)    : Camille
// Data        : 12.04.2004
// Pendência   : 16240
// Alteração   : Caso o evento de falecimento seja de uma pessoa que não estava
//               em beneficios, a tela que tratará da devolucao de contribuição
//               será a tela FDevolveContribuicoes, que irá inserir o historico
//               com o motivo de Receber Nao Identificado
//               Caso a pessoa esteja assistida, a propria rotina de
//               encerramento faz o acerto
//------------------------------------------------------------------------------
// Rotina      : FazerDevolucao
// Autor(a)    : Gleyber
// Data        : 01/12/2003
// Pendência   : 15143
// Alteração   : Só executa a função AbateDaReserva caso exista registro na hst
//------------------------------------------------------------------------------
// Rotina      : qryHstContrib
// Autor(a)    : Camille
// Data        : 16/07/2002
// Alteração   : Substitui o SUM(VALORESPERADO) por MAX(VALORESPERADO) pois
//               caso hajam linhas com tratamento de divergencia, a query
//               só deve buscar o valor esperado original, que é igual ou maior
//               que os outros.
//------------------------------------------------------------------------------
// Rotina    : FazerDevolucaoUltimoPagamento
// Autor(a)  : Camille
// Data      : 17.07.2002
// Alteração : se data final = ultimo dia do mes final, nao devolver nada
// -----------------------------------------------------------------------------

unit FDevolveContribuicoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, wwdblook, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
  UCtrlDocumento, UCtrlLancamento, uDiasUteis, Math;

type
  TfrmDevolveContribuicoes = class(TfrmOkCancelar)
    Panel1: TPanel;
    lblParticipante: TLabel;
    lblMatricula: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    qryHstContrib: TwwQuery;
    dbgrdHstContrib: TwwDBGrid;
    dsHstContrib: TwwDataSource;
    rgrpFormaPgto: TRadioGroup;
    rgrpAlteradores: TRadioGroup;
    qryPortForma: TwwQuery;
    grpDevolBanco: TGroupBox;
    Label5: TLabel;
    dblkpcmbPortForma: TwwDBLookupCombo;
    Label6: TLabel;
    dtDevolucao: TCMDateTimePicker;
    qryAux: TwwQuery;
    qryContribPatro: TwwQuery;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    updContabil: TUpdateSQL;
    qryDocumentos: TwwQuery;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosPLANO: TFloatField;
    qryDocumentosPLACONTA: TStringField;
    qryDocumentosPLNCODIGO: TFloatField;
    qryDocumentosNUMLANCTO: TFloatField;
    qryDocumentosUNIDNEGOC: TFloatField;
    qryDocumentosCODCENTRORESPON: TStringField;
    qryDocumentosCODTIPRECDES: TStringField;
    qryDocumentosVALOR: TFloatField;
    updDocumentos: TUpdateSQL;
    updHstContrib: TUpdateSQL;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    qryDocumentosIDPESSJUR: TFloatField;
    qryDocumentosIDPLANOPREV: TFloatField;
    qryReservaXPlano: TwwQuery;
    qryHstContribFLGACEITA: TFloatField;
    qryHstContribFLGDEVOLVE: TFloatField;
    qryHstContribFLGDEVOLUCAO: TFloatField;
    qryHstContribIDRUBRICADEVOLUC: TFloatField;
    qryHstContribIDCONTRIBUICAO: TFloatField;
    qryHstContribMESREFERENCIA: TStringField;
    qryHstContribCODPORTFORMA: TFloatField;
    qryHstContribVALOROP1: TFloatField;
    qryHstContribVALOROP2: TFloatField;
    qryHstContribVALOROP3: TFloatField;
    qryHstContribPARCELA: TFloatField;
    qryHstContribIDPESSOA: TFloatField;
    qryHstContribIDPESSJUR: TFloatField;
    qryHstContribIDPLANOPREV: TFloatField;
    qryHstContribSEQPROPOSTA: TFloatField;
    qryHstContribNOME: TStringField;
    qryHstContribFLGNAOEXIGEREC: TFloatField;
    qryHstContribFLGSITFUNDACAO: TStringField;
    qryHstContribPLACONTADBANCO: TStringField;
    qryHstContribPLACONTADBANCO13: TStringField;
    qryHstContribCODCENTROCUSTOC: TStringField;
    qryHstContribCODCENTROCUSTOD: TStringField;
    qryHstContribPLACONTAC: TStringField;
    qryHstContribPLACONTAD: TStringField;
    qryHstContribCODCCUSTODEVOL: TStringField;
    qryHstContribPLACONTADEVOL: TStringField;
    qryHstContribCODSUBCONTA: TFloatField;
    qryHstContribCODPORTFORMA_1: TFloatField;
    qryHstContribCODTIPRECDES: TStringField;
    qryHstContribCODTIPDESEMBDEVOL: TStringField;
    qryHstContribCODCENTRORESPON: TStringField;
    qryHstContribUNIDNEGOC: TFloatField;
    qryHstContribIDPLANPREVCONTAB: TFloatField;
    qryHstContribDATAINICIO: TDateTimeField;
    qryHstContribDATAFINAL: TDateTimeField;
    qryHstContribIDREGRACALCULO: TFloatField;
    qryHstContribIDREGRAULTPAGTO: TFloatField;
    qryHstContribIDREGRAPRIMPAGTO: TFloatField;
    qryHstContribIDREGRACALCULO13: TFloatField;
    qryHstContribIDREGRAULTPGTO13: TFloatField;
    qryHstContribIDREGRAPRIMPGTO13: TFloatField;
    qryHstContribINSCRICAODATA: TDateTimeField;
    qryHstContribIDSITPART: TFloatField;
    qryHstContribSALPARTICIPACAO: TFloatField;
    qryHstContribINSCRICAONUMERO: TFloatField;
    qryHstContribDATANASC: TDateTimeField;
    qryHstContribSALPARTICIPACAO_1: TFloatField;
    qryHstContribSALAUXDOENCA: TFloatField;
    qryHstContribSALMANTIDO: TFloatField;
    qryHstContribIDRUBSALAUXDOENCA: TFloatField;
    qryHstContribIDRUBSALMANUT: TFloatField;
    qryHstContribIDRUBSALMANUTPARC: TFloatField;
    qryHstContribIDRUBSALPARTICIP: TFloatField;
    qryHstContribPAGADOR: TStringField;
    qryHstContribFLGPAGADOR: TStringField;
    qryHstContribFLGTPVLR: TStringField;
    qryHstContribNUMRECEBIMENTO: TFloatField;
    qryHstContribDATAPREVISAORECE: TDateTimeField;
    qryHstContribDATARECEBIMENTO: TDateTimeField;
    qryHstContribVALORESPERADO: TFloatField;
    qryHstContribVALORRECEBIDO: TFloatField;
    qryDocumentosFLGDEVOLUCAO: TFloatField;
    qryHstContribFLGSALVIRTBENEF: TFloatField;
    qryHstContribIDPARCELAMENTO: TFloatField;
    qryHstContribPERCENTUALPARCELA: TFloatField;
    qryHstContribVLRDIVIDAPART: TFloatField;
    qryHstContribVLRDIVIDAPATRO: TFloatField;
    qryHstContribIDMOTIVO: TFloatField;
    qryDocumentosIDCONTRIBUICAO: TFloatField;
    lblPeriodo: TLabel;
    qryHstContribVALORDEVOLVER: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgrpFormaPgtoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryHstContribCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    CtrlDocumento           : TCtrlDocumento;  
    CtrlLancamento          : TCtrlLancamento; 

    // *********************************************************************
    // Rotina para devolver as contribuicoes de um participante
    // Ela gravara as contribuicoes do Mes de Inicio ate o Mes Final,
    // no historico de contribuicoes e calculará os seus alteradores
    sDataRef,
    sDataFinal,
    sAnoMesInicio,
    sMatricula,
    sSitFundacao,
    sTipoChamada,
    sFlgIntEvento : string;
    iTipoBotao    : integer;
    iIdLote       : longint;
    function FazerDevolucao (var sMsgErro : string)  : boolean;
    function FazerDevolucaoUltimoPagamento (var sMsgErro : string)  : boolean;
    function AcertaContribuicao(var sMsgErro : string)  : boolean;
    function AbateDaReserva(iIdPessoa, iIdPessjur,
                        iIdPlanoPrev , iIdContribuicao, iSeqProposta : Integer;
                        sDataPrevisao, sDataRecebimento, sMesRef, sValor : String; var sErro : String) : Boolean;
  public
    { Public declarations }
    IdEventoGerador : String;
  end;

var
  frmDevolveContribuicoes: TfrmDevolveContribuicoes;




// Rotina para devolver contribuicoes de um período
// Retorno : -1 - não devolver e parar processamento
//            0 - não devolver e continuar processamento
//            1 - devolver

function DevolveContribuicoes ( piIdPessJur, piIdPlanoPrev,
                                piIdPessoa,     piSeqProposta,
                                piIdLote                        : longint;
                                psMatricula, psNomeParticip, psSitFundacao,
                                psDataRef,    // inicio do beneficio, por exemplo
                                psDataFinal,  // data final do evento, para fazer pro-rata de ultimo
                                psAnoMesInicio, psAnoMesFinal : string;
                                piFormaPgto : integer; // -1 = Qualquer,
                                                       //  0 = Banco
                                                       //  1 = Folha da Patrocinadora
                                                       //  2 = Folha de Beneficio
                                psTipoChamada : string; // C - Concessao
                                                        // E - Eventos
                                                        // O - Outros
                                                        // R - Retencao ou Encerramento
                                psFlgIntEvento : string;
                                piIdEventoGerador : String ) : integer;

implementation

uses DBaseDados, DAPrev, UMensErro, UContribuicaoPrev, UDataBase, UAdmPrev,
     UParticipante, USistema, UMovReserva, DAPrevIntegraBack,
     UIntegraBack;

{$R *.DFM}


function DevolveContribuicoes ( piIdPessJur,    piIdPlanoPrev,
                                piIdPessoa,     piSeqProposta,
                                piIdLote                        : longint;
                                psMatricula,    psNomeParticip,
                                psSitFundacao,  psDataRef,
                                psDataFinal,
                                psAnoMesInicio, psAnoMesFinal   : string;
                                piFormaPgto                     : integer;
                                psTipoChamada                   : string; // C - Concessao
                                                                          // E - Eventos
                                                                          // O - Outros
                                                                          // R - Retencao ou  Encerramento
                                psFlgIntEvento                  : string;
                                piIdEventoGerador : String ) : integer;
var dTotalContrib : double;
    sMsgErro      : string;
begin
  Result := -1;
  Application.CreateForm(TfrmDevolveContribuicoes, frmDevolveContribuicoes);
  with frmDevolveContribuicoes do
  begin
     sMatricula       := psMatricula;
     sSitFundacao     := psSitFundacao;
     sDataRef         := psDataRef;
     sDataFinal       := psDataFinal;
     sAnoMesInicio    := psAnoMesInicio;

     if (Trim(psAnoMesFinal) = '') or (Trim(psAnoMesFinal) = '/') Then
       psAnoMesFinal := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                        Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);

     sTipoChamada     := psTipoChamada;
     sFlgIntEvento    := psFlgIntEvento;
     iIdLote          := piIdLote;
     lblParticipante.Caption := 'Participante : '+psNomeParticip;
     lblMatricula.Caption    := 'Matrícula : '+psMatricula;
     lblPeriodo.Caption      := 'Período : '+Copy(psAnoMesInicio,6,2)+'/'+Copy(psAnoMesInicio,1,4)+' a '+Copy(psAnoMesFinal,6,2)+'/'+Copy(psAnoMesFinal,1,4);

     rgrpFormaPgto.Enabled := True;
     if piFormaPgto <> -1
     then begin
        rgrpFormaPgto.ItemIndex := piFormaPgto;
        rgrpFormaPgto.Enabled   := False;
     end;

     qryHstContrib.Close;
     qryHstContrib.ParamByName('IdPessoa').AsInteger       := piIdPessoa;
     qryHstContrib.ParamByName('IdPessJur').AsInteger      := piIdPessJur;
     qryHstContrib.ParamByName('IdPlanoPrev').AsInteger    := piIdPlanoPrev;
     qryHstContrib.ParamByName('SeqProposta').AsInteger    := piSeqProposta;
     qryHstContrib.ParamByName('AnoMesInicio').AsString    := psAnoMesInicio;
     qryHstContrib.ParamByName('AnoMesFinal').AsString     := psAnoMesFinal;


     if uppercase(psFlgIntEvento) = 'RA' then
     qryHstContrib.ParamByName('FLGSITFUNDACAO').AsString     :=  psSitFundacao
     else  qryHstContrib.ParamByName('FLGSITFUNDACAO').AsString     := ' HST.FLGSITFUNDACAO ';
     
     qryHstContrib.Open;
  end;

  if frmDevolveContribuicoes.qryHstContrib.IsEmpty
  then begin
     frmDevolveContribuicoes.Free;
     Result := 0;
     Exit;
  end;

  with frmDevolveContribuicoes do
  begin
     dTotalContrib := 0;
     qryHstContrib.First;
     while not qryHstContrib.Eof do
     begin
        dTotalContrib := dTotalContrib + qryHstContrib.FieldByName('VALORDEVOLVER').AsFloat;
        qryHstContrib.Next;
     end;

     if MsgDlg('O participante '+psNomeParticip+' possui um total de R$ '+FormatFloat('#0.00',dTotalContrib)+#13+
               'de contribuições pagas após a data '+psDataRef+'.'+#13+
               'Deseja DEVOLVER essas contribuições ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        if not AcertaContribuicao(sMsgErro)
        then begin
           MsgDlg('Erro ao atualizar situação de contribuições.','Erro',mtError,[mbOK],0);
           frmDevolveContribuicoes.Free;
           Result := -1;
           Exit;
        end;

        frmDevolveContribuicoes.Free;
        Result := 0;
        Exit;
     end;

     iTipoBotao := -1;
     frmDevolveContribuicoes.IdEventoGerador := piIdEventoGerador; //nicializa variável pública
     ShowModal;
     Result := iTipoBotao;
  end;

  frmDevolveContribuicoes.Free;
end;

procedure TfrmDevolveContribuicoes.bbtnConfirmarClick(Sender: TObject);
var sMsgErro : string;
    bAlgumaDevolucao : boolean;
begin
  inherited;
  // Verificar se tem alguma devolucao marcada, para só pedir os campos de devolucao,
  // em caso positivo
  bAlgumaDevolucao := False;
  qryHstContrib.First;
  while not qryHstContrib.Eof do
  begin
     if qryHstContrib.FieldbyName('FlgDevolve').AsInteger = 1
     then begin
        bAlgumaDevolucao := True;
        break;
     end;
     qryHstContrib.Next;
  end;

  // Verificar campos obrigatorios
  if rgrpFormaPgto.ItemIndex < 0
  then begin
     MsgDlg('Informe a Forma de Pagamento.','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if bAlgumaDevolucao and (rgrpAlteradores.ItemIndex < 0)
  then begin
     MsgDlg('Informe se fará a devolução com ou sem alteradores. ','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if bAlgumaDevolucao and (rgrpFormaPgto.ItemIndex = 0) and  (Trim(dblkpcmbPortForma.Text) = '')
  then begin
     if MsgDlg('Deseja utilizar a Forma de Devolução padrão por plano ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
     then Exit;
  end;

  if bAlgumaDevolucao and (rgrpFormaPgto.ItemIndex = 0) and (Trim(dtDevolucao.Text) = '')
  then begin
     MsgDlg('Informe a Data da Devolução. ','Erro',mtError,[mbOk],0);
     Exit;
  end;

  if not AcertaContribuicao(sMsgErro)
  then begin
     MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
     Exit;
  end;

  if bAlgumaDevolucao
  then begin
     if sTipoChamada <> 'R'
     then begin
        if not FazerDevolucao (sMsgErro)
        then begin
           MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
           Exit;
        end
     end
     else begin
        if not FazerDevolucaoUltimoPagamento (sMsgErro)
        then begin
           MsgDlg(sMsgErro,'Erro',mtError,[mbOk],0);
           Exit;
        end
     end;
  end;
  ModalResult := mrOk;
  iTipoBotao  := 1;
end;

function TfrmDevolveContribuicoes.AcertaContribuicao(var sMsgErro : string)  : boolean;
begin
   Result := False;

   qryHstContrib.First;
   while not qryHstContrib.Eof do
   begin
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV SET OPTRATDIVERG = 9  '+ 
                 ' WHERE   MESREFERENCIA   = '''+ qryHstContrib.FieldByName('MESREFERENCIA').AsString+''''+
                 ' AND     IDPESSJUR       = '+IntToSTr(qryHstContrib.FieldByName('IDPESSJUR').AsInteger)+
                 ' AND     IDPLANOPREV     = '+IntToSTr(qryHstContrib.FieldByName('IDPLANOPREV').AsInteger)+
                 ' AND     IDPESSOA        = '+IntToSTr(qryHstContrib.FieldByName('IDPESSOA').AsInteger)+
                 ' AND     SEQPROPOSTA     = '+IntToSTr(qryHstContrib.FieldByName('SEQPROPOSTA').AsInteger)+
                 ' AND     IDCONTRIBUICAO  = '+IntToSTr(qryHstContrib.FieldByName('IDCONTRIBUICAO').AsInteger));
         try
            ExecSQL;
         except
            MsgDlg('Erro ao acertar valor da contribuição','Erro',mtError,[mbOk, mbHelp],0);
            Exit;
         end;
      end;


      qryHstContrib.Next;
   end;
   Result := True;
end; // AcertaDevolucao

function TfrmDevolveContribuicoes.FazerDevolucao ( var sMsgErro : string) : boolean;
var sSQLValues,        sSQLRegra,
    sValorRegra,       sAnoMesCobranca,
    sValorFinal,       sCamposObrig,
    sValorEncontrado,  sSalarioDoMes,
    sSalarioProRata,   sIdRubSalario,
    sCodPortForma,
    sDataDevolPart,
    sDataDevolPatro,
    sDataEnvioTmpDesc,
    sSalarioOriginal,  sSalarioCorreto,
    sTotalEsperado,
    sAnoMesCorrente,
    sUltMesSalario,
    sAnoHoje,          sMesHoje        : string;
    bErro,             bErroRegra      : boolean;
    iPlnCodigo,
    iIdMotivo,
    iIdPessJur,        iIdPlanoPrev,
    iNumRecebimento                    : longint;
    iNumReg,
    iOpTratDiverg                      : integer;

    rValorEnviado,
    rValorRegra,       rValorContrib,
    rValorFinal,       rTotalLote      : double;

    // Dados para integracao contabil/financeira
    sCodCentroCustoC,
    sCodCentroCustoD,
    sCodCentroRespon,
    sCodSubConta,
    sCodTipRecDes,
    sPlaContaC,
    sPlaContaD,
    sPlano,
    sTipCodigo,
    sIdEmpresa,
    sUnidNegoc,
    sRecPag,
    sCodTipDoc,
    sIdEmpresaProp,
    sPlaContaDProvis,    
    sPlaContaCProvis,    

    sSQLAux, sSQLAux2 : string;
    iIdContribAnt, iCodLancCAPCAR      : longint;

    //BRUNO AZEVEDO SOL 130119 KINTANA 789646
    iAnoAtual, iMesAtual, iUltDia, iUltDiaAtual: Integer;
    sValorRecebido: String;
begin

   Result   := False;
   sMsgErro := '';
   bErro    := False;

   
   sMesHoje    := Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
   sAnoHoje    := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4);

   iIdContribAnt := -1;

   
   if (sFlgIntEvento = 'FL')
   then begin
      if prmIdMotDevolNaoIden > 0
      then iIdMotivo := prmIdMotDevolNaoIden
      else iIdMotivo := prmIDMOTIVOFOLHABEN
   end
   else begin
      if (sSitFundacao = 'AS') or (sTipoChamada  = 'C')
      then iIdMotivo := prmIDMOTIVOFOLHABEN
      else iIdMotivo := prmIdMotivoDiverg;
   end;

   qryHstContrib.First;

   // Gerar lote de contribuicao
   if (iIdLote < 0) and (sTipoChamada <> 'C') and (sFlgIntEvento <> 'FL')
   then begin
      iIdLote := GeraLOTE(qryHstContrib.FieldByName('IdPessJur').AsInteger,True,sAnoMesCobranca,
                          'P', 'Devolução de Contribuição - Matrícula : '+sMatricula,
                          'D','1','0','0','0','0', FormatDateTime('dd/mm/yyyy', Date),'','','',''); 
      if iIdLote < 0
      then begin
         sMsgErro := ' Erro na geração do lote de contribuições. ';
         Exit;
      end;
   end;

   rTotalLote := 0;
   iNumReg    := 0;

   case rgrpFormaPgto.ItemIndex of
        0 : sDataDevolPart := Trim(dtDevolucao.Text);
        1 : sDataDevolPart := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             qryHstContrib.FieldByName('IdPessJur').AsString,
                                             qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                             sSitFundacao, 'D',
                                             sMesHoje, sAnoHoje);
        2 : sDataDevolPart := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             IntToStr(iIdFundacao),
                                             qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                             'AS', 'D',
                                             sMesHoje, sAnoHoje);
   end;

   sDataDevolPatro := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             qryHstContrib.FieldByName('IdPessJur').AsString,
                                             qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                             'PT', 'D',
                                             sMesHoje, sAnoHoje);

   if Trim(sDataDevolPart) = ''  then sDataDevolPart  := FormatDateTime('dd/mm/yyyy', Date);
   if Trim(sDataDevolPatro) = '' then sDataDevolPatro := FormatDateTime('dd/mm/yyyy', Date);

   // Utilizar como DATA DE COBRANCA a data do CALENDARIO, porem usar como MESCOBRANCA o mes do lote
   if iIdLote > 0
   
   then Begin
     sAnoMesCobranca := BuscaMesCobrancaLote( iIdLote, Copy(Trim(sDataDevolPart),7,4)+'/'+Copy(sDataDevolPart,4,2));
     If Trim(sAnoMesCobranca) = ''
      Then sAnoMesCobranca := Copy(sDataDevolPart,7,4)+'/'+Copy(sDataDevolPart,4,2);
   
   end
   else sAnoMesCobranca := Copy(sDataDevolPart,7,4)+'/'+Copy(sDataDevolPart,4,2);

   if sSitFundacao = 'MA'
   then begin
      sSalarioDoMes   := ClienteNumero(qryHstContrib.FieldByName('SalMantido').AsString);
      sIdRubSalario   := qryHstContrib.FieldByName('IDRUBSALMANUT').AsString;
   end
   else if (sSitFundacao = 'AS') and
           (qryHstContrib.FieldByName('FLGSALVIRTBENEF').AsInteger = 1) 
        then begin
           sSalarioDoMes   := ClienteNumero(qryHstContrib.FieldByName('SalAuxDoenca').AsString);
           sIdRubSalario   := qryHstContrib.FieldByName('IDRUBSALAUXDOENCA').AsString;
        end
        else begin
           sSalarioDoMes   := ClienteNumero(qryHstContrib.FieldByName('SalParticipacao').AsString);
           sIdRubSalario   := qryHstContrib.FieldByName('IDRUBSALPARTICIP').AsString;
        end;
   if Trim(sIdRubSalario) = ''
   then begin
      sMsgErro := 'Rubrica relativa ao salário do participante não informada.'+#13+
                  'Verifique o cadastro da patrocinadora.';
      Result   := False;
      Exit;
   end;

   sAnoMesCorrente  := qryHstContrib.FieldByName('MesReferencia').AsString;
   sUltMesSalario   := sAnoMesCorrente;
   sSalarioOriginal := '0';
   sSalarioOriginal := BuscaSalario( qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                     qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                     qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                     qryHstContrib.FieldByName('MesReferencia').AsString,
                                     sSitFundacao,
                                     sSalarioOriginal,
                                     sMsgErro,
                                     qryAux);
   sSalarioDoMes    := sSalarioOriginal;

   while not qryHstContrib.EOF do
   begin
      //BRUNO AZEVEDO SOL 130119 KINTANA 789646
      iAnoAtual := StrToInt(Copy(qryHstContrib.FieldByName('MESREFERENCIA').AsString,1,4));
      iMesAtual := StrToInt(Copy(qryHstContrib.FieldByName('MESREFERENCIA').AsString,6,2));

      if (iMesAtual = DiasUteis.ExtraiMes(StrToDate(sDataFinal))) or (iMesAtual = 13) then begin
        try
          iUltDia   := DiasUteis.ExtraiDia(StrToDate(sDataFinal));
        except
          iUltDia   := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAnoAtual,iMesAtual));
        end;

        //13º 181 DIAS
        if (iMesAtual = 13) then begin
          iUltDiaAtual := 181;
        end else begin
          iUltDiaAtual := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAnoAtual,iMesAtual));
        end;

        try
          sValorRecebido := FloatToStrF(qryHstContrib.FieldByName('ValorRecebido').AsFloat - ((qryHstContrib.FieldByName('ValorRecebido').AsFloat * iUltDia)/ iUltDiaAtual), FFFixed, 10,2);
        except
          sValorRecebido := '';
        end;
      end else begin
        sValorRecebido := FloatToStrF(qryHstContrib.FieldByName('ValorRecebido').AsFloat, FFFixed, 10,2);
      end;
      //BRUNO AZEVEDO SOL 130119 KINTANA 789646

      // Se usuario optou por aceitar, ir para a proxima contribuicao
      if qryHstContrib.FieldByName('FlgAceita').AsInteger = 1
      then begin
         qryHstContrib.Next;
         continue;
      end;
      if Trim(sValorRecebido) <> ''
      then rValorContrib := StrToFloat(sValorRecebido)
      else rValorContrib := qryHstContrib.FieldByName('ValorEsperado').AsFloat;
      sValorFinal        := OraNumero(FloatToStr(rValorContrib));
      rValorRegra        := 0;
      sValorRegra        := '0';

      // Se mudou o mês Entao buscar o salario do mes
      if qryHstContrib.FieldByName('MesReferencia').AsString <> sUltMesSalario
      then begin
         sSalarioDoMes   := BuscaSalario( qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                          qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                          qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                          qryHstContrib.FieldByName('MesReferencia').AsString,
                                          sSitFundacao,
                                          sSalarioOriginal,
                                          sMsgErro,
                                          qryAux);
         sUltMesSalario := qryHstContrib.FieldByName('MesReferencia').AsString;
      end;

      sSalarioProRata := sSalarioDoMes;

      // A.  Se for o ultimo mes de contribuicao (ou seja, o 1o. mes do evento) Entao :
      // A1. Se nao tiver regra de ultimo pagamento Entao :
      //     1.1. Fazer pro-rata do salario
      //     1.2. Chamar regra de calculo da contribuicao, passando este salario
      //     1.3. Devolver a diferenca da contribuicao
      //     1.4. Atualizar salario pro-rata na HistRubSal
      // A2. Se tiver regra de ultimo pagamento Entao :
      //     2.1. Fazer pro-rata da contribuicao atraves da regra de ultimo pagamento
      //     2.2. Fazer pro-rata do salario
      //     2.3. Devolver a diferenca da contribuicao
      //     2.4. Atualizar salario pro-rata na HistRubSal
      // B.  Se nao for ultimo  mes da contribuicao (ou seja, é algum mes posterior
      //     ao mes do evento) Entao :
      //     1. Devolver valor inteiro da contribuicao
      //     2. Apagar salario inteiro da HistRubSal
      if (qryHstContrib.FieldByName('MesReferencia').AsString = sAnoMesInicio)
      then begin
         if Copy(sDataRef,1,2) = '01'
         then begin
            sSalarioProRata := '0';
            sValorRegra     := '0';
         end
         else begin                                // pro rata da data até o ultimo dia do mes
            // Se a devolucao estiver sendo feita por uma concessao, devolver da DIB em diante

            If (sTipoChamada = 'C') or (sTipoChamada = 'R') Then
              sSalarioProRata   := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioDoMes, FormatDateTime('dd/mm/yyyy', StrToDate(sDataRef)-1 )))) 
            Else
              sSalarioProRata   := OraNumero(FloatToStr(ValorProRataUltimo(sSalarioDoMes, FormatDateTime('dd/mm/yyyy', StrToDate(sDataRef) ))));  

            if ((sTipoChamada <> 'R') and (Trim(qryHstContrib.FieldByName('IDREGRAULTPAGTO').AsString) = '')) or
               ((sTipoChamada =  'R') and (Trim(qryHstContrib.FieldByName('IDREGRAPRIMPAGTO').AsString) = ''))
            then begin // nao tem regra de ultimo pagamento
               if (sTipoChamada = 'C') or (sTipoChamada = 'R')
               then sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                iIdMotivo,
                                qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                sAnoMesInicio,
                                FormatDateTime('dd/mm/yyyy', StrToDate(sDataRef)-1 ), 
                                sValorFinal,
                                qryHstContrib.FieldByName('InscricaoData').AsString,
                                qryHstContrib.FieldByName('DataNasc').AsString,
                                'N','HSTCONTRIBPREV','VALORESPERADO',
                                sSalarioProRata,
                                qryHstContrib.FieldByName('IDSITPART').AsString,'','',1,-1,sAnoMesCobranca,iIdLote )
               else sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                iIdMotivo,
                                qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                sAnoMesInicio,
                                sDataRef,
                                sValorFinal,
                                qryHstContrib.FieldByName('InscricaoData').AsString,
                                qryHstContrib.FieldByName('DataNasc').AsString,
                                'N','HSTCONTRIBPREV','VALORESPERADO',
                                sSalarioProRata,
                                qryHstContrib.FieldByName('IDSITPART').AsString,'','',1,-1,sAnoMesCobranca,iIdLote);

               sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString, 
                                            sSQLRegra,bErro,iIdCalculoGeral);
               if bErro
               then begin
                  sMsgErro := 'Erro na Execução da Regra de Cálculo da Contribuição. ';
                  bErro    := True;
                  break;
               end;
               if sValorRegra = ''
               then begin
                  sMsgErro := 'A Regra de Cálculo da Contribuição retornou um valor em branco.';
                  bErro    := True;
                  break;
               end;



            end
            else begin
               if (sTipoChamada = 'C') or (sTipoChamada = 'R')
               then sSQLRegra  := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                iIdMotivo,
                                qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                sAnoMesInicio,
                                FormatDateTime('dd/mm/yyyy', StrToDate(sDataRef)-1 ), 
                                sValorFinal,
                                qryHstContrib.FieldByName('InscricaoData').AsString,
                                qryHstContrib.FieldByName('DataNasc').AsString,
                                'U','HSTCONTRIBPREV','VALORESPERADO',
                                sSalarioProRata,
                                qryHstContrib.FieldByName('IDSITPART').AsString,
                                '',
                                FormatDateTime('dd/mm/yyyy', StrToDate(sDataRef)-1 ), 
                                1,-1,sAnoMesCobranca,iIdLote)
               else sSQLRegra  := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                iIdMotivo,
                                qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                sAnoMesInicio,
                                sDataRef,
                                sValorFinal,
                                qryHstContrib.FieldByName('InscricaoData').AsString,
                                qryHstContrib.FieldByName('DataNasc').AsString,
                                'U','HSTCONTRIBPREV','VALORESPERADO',
                                sSalarioProRata,
                                qryHstContrib.FieldByName('IDSITPART').AsString,
                                '',
                                sDataRef,
                                1,-1,sAnoMesCobranca,iIdLote);

               sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAULTPAGTO').AsString,
                                            sSQLRegra,bErro,iIdCalculoGeral);
               if bErro
               then begin
                  sMsgErro := 'Erro na Execução da Regra de Cálculo do Último Pagamento. ';
                  bErro    := True;
                  break;
               end;

               if sValorRegra = ''
               then begin
                  sMsgErro := 'A Regra de Cálculo do Último Pagamento retornou um valor em branco.';
                  bErro    := True;
                  break;
               end;
            end;
         end;
      end // se for ultimo pagamento
      else if (Trim(sDataFinal) <> '') and
              ((qryHstContrib.FieldByName('MesReferencia').AsString = Copy(sDataFinal,7,4) +'/'+Copy(sDataFinal,4,2)) or
               ((Copy(qryHstContrib.FieldByName('MesReferencia').AsString,6,2) = '13') ) )
           then begin
              if ((Copy(sDataFinal,1,2) = '30') or (Copy(sDataFinal,1,2) = '31') or
                  ((Copy(sDataFinal,4,2) = '02') and (Copy(sDataFinal,1,2) = '28')))
              then begin
                 sSalarioProRata := '0';
                 sValorRegra     := '0';
              end
              else begin
                 // Se a devolucao estiver sendo feita por uma concessao, devolver da DIB em diante
                 if (sTipoChamada = 'C') or (sTipoChamada = 'R') Then
                   sSalarioProRata := OraNumero(FloatToStr(ValorProRataPrimeiro( sSalarioDoMes, FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal)  ))))  
                 else
                   sSalarioProRata := OraNumero(FloatToStr(ValorProRataPrimeiro( sSalarioDoMes, FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal)+1 )))); 

                 if ((sTipoChamada <> 'R') and (Trim(qryHstContrib.FieldByName('IDREGRAPRIMPAGTO').AsString) = '')) or
                    ((sTipoChamada =  'R') and (Trim(qryHstContrib.FieldByName('IDREGRAULTPAGTO').AsString) = ''))
                 then begin // nao tem regra de ultimo pagamento
                    sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                     qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                     qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                     qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                     qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                     iIdMotivo,
                                     qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                     Copy(sDataFinal,7,4) +'/'+Copy(sDataFinal,4,2),
                                     FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal)+1 ), 
                                     sValorFinal,
                                     qryHstContrib.FieldByName('InscricaoData').AsString,
                                     qryHstContrib.FieldByName('DataNasc').AsString,
                                     'N','HSTCONTRIBPREV','VALORESPERADO',
                                     sSalarioProRata,
                                     qryHstContrib.FieldByName('IDSITPART').AsString,'','',1,-1,sAnoMesCobranca,iIdLote);

                    sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRACALCULO').AsString,
                                                 sSQLRegra,bErro,iIdCalculoGeral);
                    if bErro
                    then begin
                       sMsgErro := 'Erro na Execução da Regra de Cálculo da Contribuição. ';
                       bErro    := True;
                       break;
                    end;
                    if sValorRegra = ''
                    then begin
                       sMsgErro := 'A Regra de Cálculo da Contribuição retornou um valor em branco.';
                       bErro    := True;
                       break;
                    end;
                 end
                 else begin
                    if sTipoChamada <> 'R'
                    then sSQLRegra  := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                     qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                     qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                     qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                     qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                     iIdMotivo,
                                     qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                     qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                     FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal)+1 ), 
                                     sValorFinal,
                                     qryHstContrib.FieldByName('InscricaoData').AsString,
                                     qryHstContrib.FieldByName('DataNasc').AsString,
                                     'P','HSTCONTRIBPREV','VALORESPERADO',
                                     sSalarioProRata,
                                     qryHstContrib.FieldByName('IDSITPART').AsString, '','',1,-1,sAnoMesCobranca,iIdLote)
                    else sSQLRegra  := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                      qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                      qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                      qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                      qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                      iIdMotivo,
                                      qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                      qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                      FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal) ), 
                                      sValorFinal,
                                      qryHstContrib.FieldByName('InscricaoData').AsString,
                                      qryHstContrib.FieldByName('DataNasc').AsString,
                                      'U','HSTCONTRIBPREV','VALORESPERADO',
                                      sSalarioProRata,
                                      qryHstContrib.FieldByName('IDSITPART').AsString, '','',1,-1,sAnoMesCobranca,iIdLote);

                    if sTipoChamada <> 'R'
                    then sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAPRIMPAGTO').AsString, sSQLRegra,bErro,iIdCalculoGeral)
                    else sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAULTPAGTO').AsString,  sSQLRegra,bErro,iIdCalculoGeral);

                    if bErro
                    then begin
                       sMsgErro := 'Erro na Execução da Regra de Cálculo do Primeiro Pagamento. ';
                       bErro    := True;
                       break;
                    end;

                    if sValorRegra = ''
                    then begin
                       sMsgErro := 'A Regra de Cálculo do Primeiro Pagamento retornou um valor em branco.';
                       bErro    := True;
                       break;
                    end;
                 end;
              end;
           end // se for primeiro
           else begin // Tratamento para devolucao de contribuicao sobre 13o.
              if Copy(qryHstContrib.FieldByName('MesReferencia').AsString,6,2) = '13' // testar se é 13o.
              then begin
                 if Copy(qryHstContrib.FieldByName('MesReferencia').AsString, 1,4) = Copy(sAnoMesInicio, 1, 4)
                 then begin
                     sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                       qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                       qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                       qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                       qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                       iIdMotivo,
                                                       qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                       qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                       sDataRef,
                                                       sValorFinal,
                                                       qryHstContrib.FieldByName('InscricaoData').AsString,
                                                       qryHstContrib.FieldByName('DataNasc').AsString,
                                                       'N','HSTCONTRIBPREV','VALORESPERADO',
                                                       '0',
                                                       qryHstContrib.FieldByName('IDSITPART').AsString,
                                                       sDataRef,
                                                       sDataFinal, 1,-1,sAnoMesCobranca,iIdLote);
                     sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRACALCULO13').AsString,
                                                   sSQLRegra,bErro,iIdCalculoGeral);
                     sValorFinal := sValorRegra;

                     sSQLRegra   := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                       qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                       qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                       qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                       qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                       iIdMotivo,
                                                       qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                       qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                       sDataRef,
                                                       sValorFinal,
                                                       qryHstContrib.FieldByName('InscricaoData').AsString,
                                                       qryHstContrib.FieldByName('DataNasc').AsString,
                                                       'U','HSTCONTRIBPREV','VALORESPERADO',
                                                       '0',
                                                       qryHstContrib.FieldByName('IDSITPART').AsString,
                                                       sDataRef, sDataFinal, 1,-1,sAnoMesCobranca,iIdLote);
                     sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAULTPGTO13').AsString,
                                                   sSQLRegra,bErro,iIdCalculoGeral);
                 end
                 else if (Trim(sDataFinal) <> '') and
                         (Copy(qryHstContrib.FieldByName('MesReferencia').AsString, 1,4) = Copy(sDataFinal, 7, 4))
                      then begin
                         sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                           qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                           qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                           qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                           qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                           iIdMotivo,
                                                           qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                           qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                           sDataRef,
                                                           sValorFinal,
                                                           qryHstContrib.FieldByName('InscricaoData').AsString,
                                                           qryHstContrib.FieldByName('DataNasc').AsString,
                                                           'N','HSTCONTRIBPREV','VALORESPERADO',
                                                           '0',
                                                           qryHstContrib.FieldByName('IDSITPART').AsString,
                                                           sDataRef, sDataFinal, 1,-1,sAnoMesCobranca,iIdLote);

                         sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRACALCULO13').AsString,
                                                       sSQLRegra,bErro,iIdCalculoGeral);
                         sValorFinal := sValorRegra;

                         sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                       qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                       qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                       qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                       qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                       iIdMotivo,
                                                       qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                       qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                       sDataRef,
                                                       sValorFinal,
                                                       qryHstContrib.FieldByName('InscricaoData').AsString,
                                                       qryHstContrib.FieldByName('DataNasc').AsString,
                                                       'P','HSTCONTRIBPREV','VALORESPERADO',
                                                       '0',
                                                       qryHstContrib.FieldByName('IDSITPART').AsString,
                                                       sDataRef, sDataFinal, 1,-1,sAnoMesCobranca,iIdLote);
                         sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString,
                                                   sSQLRegra,bErro,iIdCalculoGeral);
                      end
                      else sValorRegra := sValorRecebido;

                 if bErro
                 then begin
                    sMsgErro := 'Erro na Execução da Regra de Cálculo da Contribuição sobre 13o. ';
                    bErro    := True;
                    break;
                 end;
                 if sValorRegra = ''
                 then begin
                    sMsgErro := 'A Regra de Cálculo da Contribuição sobre 13o. retornou um valor em branco.';
                    bErro    := True;
                    break;
                 end;
              end;
           end; // fim - tratamento da contribuicao sobre 13o.

      // Verificar quanto foi pago e quanto deveria ter sido pago.
      // Se o participante pagou mais do que deveria , entao devolver
      // Senao, ir para o próximo
      try
         rValorRegra := StrToFloat(ClienteNumero(sValorRegra));

         if Copy(qryHstContrib.FieldByName('MesReferencia').AsString,6,2) = '13' // testar se é 13o.
         then rValorFinal := rValorRegra
         else rValorFinal := rValorContrib - rValorRegra;

         if rValorFinal < 0 then rValorFinal := 0;
         sValorFinal := OraNumero(FloatToStr(rValorFinal));
      except
         sMsgErro := 'Erro ao converter valor da devolução.';
         bErro    := True;
         break;
      end;

      if rValorFinal <= 0
      then begin
        qryHstContrib.Next;
        continue;
      end;

      // Inserir valor final na HSTCONTRIBPREV
      iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');

      sSQLValues := ''''+qryHstContrib.FieldByName('MesReferencia').AsString+'''';
      sSQLValues := sSQLValues+','''+sAnoMesCobranca+'''';
      sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);
      sSQLValues := sSQLValues+',' +IntToStr(iIdMotivo);

      if Trim(dblkpcmbPortForma.Text) <> ''
      then sSQLValues := sSQLValues+', ' +qryPortForma.FieldByName('CodPortForma').AsString
      else begin
         if Trim(qryHstContrib.FieldByName('CodPortForma').AsString) <> ''
         then sSQLValues := sSQLValues+', ' +qryHstContrib.FieldByName('CodPortForma').AsString
         else BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,'CODPORTFORMA',
                                    qryHstContrib.FieldByName('CodPortForma').AsString,
                                    'N',
                                    qryHstContrib.FieldbyName('IdPessJur').AsInteger,
                                    qryHstContrib.FieldbyName('IdPlanoPrev').AsInteger,
                                    qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                    -1 ); 
      end;

      if qryHstContrib.FieldbyName('FlgPagador').AsString = 'P'
      then sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPatro)+''',''DD/MM/YYYY'') '
      else sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPart)+''',''DD/MM/YYYY'') ';

      // Se nao exige Recebimento, colocar datarecebimento = data prevista
      if qryHstContrib.FieldByName('FlgNaoExigeRec').AsInteger = 1
      then begin
         if qryHstContrib.FieldbyName('FlgPagador').AsString = 'P'
         then sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPatro)+''',''DD/MM/YYYY'') '
         else sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPart)+''',''DD/MM/YYYY'') ';
      end
      else sSQLValues := sSQLValues+', NULL ';

      sSQLValues := sSQLValues+', '+OraNumero(sValorFinal); 
      sSQLValues := sSQLValues+', '+OraNumero(sValorFinal); 

      // Se nao exige Recebimento, colocar valorrecebido = esperado
      if qryHstContrib.FieldByName('FlgNaoExigeRec').AsInteger = 1
      then sSQLValues := sSQLValues+', '+OraNumero(sValorFinal) 
      else sSQLValues := sSQLValues+', NULL ';


      if Trim(qryHstContrib.FieldByName('IdRegraCalculo').AsString) <> ''
      then sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdRegraCalculo').AsString
      else sSQLValues := sSQLValues+', NULL ';

      if rgrpFormaPgto.ItemIndex = 0 
      then sSQLValues := sSQLValues+', 0 '
      else sSQLValues := sSQLValues+', 1 ';
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdPessoa').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('SeqProposta').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdPessJur').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdPlanoPrev').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdContribuicao').AsString;
      sSQLValues := sSQLValues+', 1'; 
      if Trim(qryHstContrib.FieldbyName('ValorOp1').AsString) <> ''
      then sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldbyName('ValorOp1').AsString)
      else sSQLValues := sSQLValues+', NULL ';

      if Trim(qryHstContrib.FieldbyName('ValorOp2').AsString) <> ''
      then sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldbyName('ValorOp2').AsString)
      else sSQLValues := sSQLValues+', NULL ';

      if Trim(qryHstContrib.FieldbyName('ValorOp3').AsString) <> ''
      then sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldbyName('ValorOp3').AsString)
      else sSQLValues := sSQLValues+', NULL ';

      sSQLValues := sSQLValues+', TO_DATE('''+qryHstContrib.FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY'') '; 

      if Trim(qryHstContrib.FieldByName('DATAFINAL').AsString) = ''
      then sSQLValues := sSQLValues+', NULL '
      else sSQLValues := sSQLValues+', TO_DATE('''+qryHstContrib.FieldByName('DATAFINAL').AsString+''',''DD/MM/YYYY'') '; 


      sSQLValues := sSQLValues+', '''+sSitFundacao+'''';       

      // Se nao exige Recebimento, colocar sitrecebimento = 2
      // Senao, sitrecebimento = 4
      if qryHstContrib.FieldByName('FlgNaoExigeRec').AsInteger = 1 //SITRECEBIMENTO
      then sSQLValues := sSQLValues+', ''2'' '
      else if (sTipoChamada = 'C') or (sTipoChamada = 'R')
           then  sSQLValues := sSQLValues+', ''1'' '
           else  sSQLValues := sSQLValues+', ''0'' ';

      sSQLValues := sSQLValues+', ''F''';    //TIPO
      if iIdLote > 0
      then sSQLValues := sSQLValues+', '+IntToStr(iIdLote)
      else sSQLValues := sSQLValues+', NULL ';
      
      sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldByName('Parcela').AsString);//PARCELA

      sSQLValues := sSQLValues+', 1';                           // FLGDEVOLUICAO

      if (sTipoChamada = 'C') or (sTipoChamada = 'R')
      then sSQLValues := sSQLValues+', 1'                       // FLGCONCESSAO
      else sSQLValues := sSQLValues+', 0';                      // FLGCONCESSAO

      if (sTipoChamada = 'E') or (sTipoChamada = 'C') or (sTipoChamada = 'R')
      then sSQLValues := sSQLValues+', 1'                       // FLGEVENTO
      else sSQLValues := sSQLValues+', 0';                      // FLGEVENTO

      if (sTipoChamada = 'E')  or (sTipoChamada = 'C') or (sTipoChamada = 'R')
      then if sFlgIntEvento <> ''
           then sSQLValues := sSQLValues+', '''+sFlgIntEvento+''''
           else sSQLValues := sSQLValues+', NULL '
      else sSQLValues := sSQLValues+', NULL ';                      // FLGINTEVENTO

      if sFlgIntEvento = 'FL'
      then sSQLValues := sSQLVAlues+', ''B'' '
      else begin
         case rgrpFormaPgto.ItemIndex of
              0 : sSQLValues := sSQLVAlues+', ''C'' ';
              1 : sSQLValues := sSQLVAlues+', ''P'' ';
              2 : sSQLValues := sSQLVAlues+', ''B'' ';
         end;
      end;

      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
                 '                             CODPORTFORMA,DATAPREVISAORECE,DATARECEBIMENTO, '+
                 '                             VALORESPERADO,VALORCALCULADO,VALORRECEBIDO,IDREGRACALCULO, '+
                 '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                 '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
                 '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA,FLGDEVOLUCAO,FLGCONCESSAO, '+
                 '                             FLGEVENTO, FLGINTEVENTO, FOLHAORIGEM) '+
                 ' VALUES('+sSQLValues+')');
         try
            Execsql;
            inc(iNumReg);
            rTotalLote := rTotalLote + StrToFloat(ClienteNumero(sValorFinal));
          except
            sMsgErro := 'Erro na gravação do Histórico de Contribuições. ';
            bErro := True;
            break;
         end;
      end; //with

      case rgrpFormaPgto.ItemIndex of
           0 : iOpTratDiverg := 5; // banco
           1 : iOpTratDiverg := 4; // ccp
           2 : iOpTratDiverg := 6; // folha beneficio
      end;

      // Atualizar campo OPTRATDIVERG para em outros eventos não pegar estas devoluções
      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV SET OPTRATDIVERG = '+IntToStr(iOpTratDiverg)+
                 ' WHERE   IDPESSOA        = '+IntToSTr(qryHstContrib.FieldByName('IDPESSOA').AsInteger)+
                 ' AND     SEQPROPOSTA     = '+IntToSTr(qryHstContrib.FieldByName('SEQPROPOSTA').AsInteger)+
                 ' AND     MESREFERENCIA   = '''+ qryHstContrib.FieldByName('MESREFERENCIA').AsString+''''+
                 ' AND     IDCONTRIBUICAO  = '+IntToSTr(qryHstContrib.FieldByName('IDCONTRIBUICAO').AsInteger)+
                 ' AND     (((OPTRATDIVERG   NOT IN ( 4,5,6,8 )) OR (OPTRATDIVERG IS NULL) ) ) ');                 


         try
            Execsql;
          except
            sMsgErro := 'Erro na atualização da devolução no Histórico de Contribuições. ';
            bErro := True;
            break;
         end;
      end; //with


      //tratar alimentão de reservas da devolução
      If (not qryHstContrib.IsEmpty) or (qryHstContrib.FieldByName('DataRecebimento').IsNull)
       Then if not AbateDaReserva(qryHstContrib.FieldByName('IdPessoa').AsInteger,
                     qryHstContrib.FieldByName('IdPessjur').AsInteger,
                     qryHstContrib.FieldByName('IdPlanoprev').AsInteger ,
                     qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                     qryHstContrib.FieldByName('SeqProposta').AsInteger,
                     qryHstContrib.FieldByName('DataPrevisaoRece').AsString,
                     qryHstContrib.FieldByName('DataRecebimento').AsString,
                     qryHstContrib.FieldByName('MesReferencia').AsString,
                     sValorFinal,sMsgErro) then
            begin
               bErro    := True;
               break;
            end;

      // Se a devolucao for para a Folha de Beneficio, não calcular os alteradores pois a folha
      // que devera calcular,
      // Senao, calcular e gravar alteradores de devolucao
      if rgrpFormaPgto.ItemIndex <> 2
      then begin
          if qryHstContrib.FieldbyName('FlgPagador').AsString = 'P'
          then begin
             if not GravaAlterador('D',qryHstContrib.FieldByName('MesReferencia').AsString,
                      sAnoMesCobranca,
                      '1',
                      iNumRecebimento,
                      iIdMotivo,
                      qryHstContrib.FieldByName('IdPlanoPrev').AsInteger, //piIdPlanoPrev,
                      qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                      qryHstContrib.FieldByName('IdPessJur').AsInteger, //piIdPessJur,
                      qryHstContrib.FieldByName('DataRecebimento').AsString,// Data referencia
                      qryHstContrib.FieldByName('DataRecebimento').AsString,// Data previsao
                      Trim(sDataDevolPatro),        // Data recebido
                      sValorFinal,
                      sMsgErro )
             then begin
                if Trim(sMsgErro) = ''
                then  sMsgErro := ' Erro na gravação dos alteradores da contribuição. ';
                bErro    := True;
                break;
             end;
          end
          else begin
             if not GravaAlterador('D',qryHstContrib.FieldByName('MesReferencia').AsString,
                         sAnoMesCobranca,
                         '1',
                         iNumRecebimento,
                         iIdMotivo,
                         qryHstContrib.FieldByName('IdPlanoPrev').AsInteger, //piIdPlanoPrev,
                         qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                         qryHstContrib.FieldByName('IdPessJur').AsInteger, //piIdPessJur,
                         qryHstContrib.FieldByName('DataRecebimento').AsString,// Data referencia
                         qryHstContrib.FieldByName('DataRecebimento').AsString,// Data previsao
                         Trim(sDataDevolPart),        // Data recebido
                         sValorFinal,
                         sMsgErro )
             then begin
                if Trim(sMsgErro) = ''
                then  sMsgErro := ' Erro na gravação dos alteradores da contribuição. ';
                bErro    := True;
                break;
             end;
          end;
      end;

      // Se for CONCESSAO DE BENEFICIO, ENTAO ENVIAR CONTRIBUICAO PARA TMPDESC
      if (sTipoChamada = 'C') or (sTipoChamada = 'R')
      then begin
         if qryHstContrib.FieldbyName('FlgPagador').AsString = 'C'
         then begin

            // ******************************************************************************
            // Preencher Informacoes de Integracao com Financeiro e Contabilidade
            // ******************************************************************************

            if IntegraBack.Financeiro <> 'N' then 
            begin
               if not dtmAPrevIntegraBack.BuscaInfIntegra( qryHstContrib.FieldByName('IDPESSJUR').AsInteger,
                                    qryHstContrib.FieldByName('IDPLANOPREV').AsInteger,
                                    qryHstContrib.FieldByName('IDPESSOA').AsInteger,
                                    qryHstContrib.FieldByName('IDPESSOA').AsInteger,
                                    qryHstContrib.FieldByName('IDCONTRIBUICAO').AsInteger,
                                    'C',
                                    'B',
                                    1,
                                    sAnoMesCobranca,
                                    qryHstContrib.FieldByName('MesReferencia').AsString,
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
                                    'P', 
                                    True,
                                    sMsgErro ) 
               then begin
                  MsgDlg('Acerto de Contribuição : Erro ao buscar parametrização financeira. Verifique.','Erro',mtError,[mbOk],0);
                  Exit;
               end;
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
                                   sDataDevolPart, '',
                                   sDataRef,
                                   'Devolução de Contribuição', '-1', '',
                                   'D', 'B', '0',
                                   '0',
                                   '', 'P',
                                   qryHstContrib.FieldByName('IdContribuicao').AsString,
                                   '', sIdEmpresaProp, sIdEmpresaProp,
                                   qryHstContrib.FieldByName('IdPessoa').AsString,
                                   IntToStr(iIdFundacao),
                                   IntToStr(iIdLote),
                                   IntToStr(Sistema.IdModulo),
                                   IntToStr(iIdMotivo),
                                   qryHstContrib.FieldByName('IdPessJur').AsString,
                                   qryHstContrib.FieldByName('IdPessoa').AsString,
                                   qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                   '',
                                   qryHstContrib.FieldByName('IDRUBRICADEVOLUC').AsString,
                                   qryHstContrib.FieldByName('IdPessoa').AsString,
                                   qryHstContrib.FieldByName('INSCRICAONUMERO').AsString,
                                   '',
                                   sAnoMesCobranca,
                                   qryHstContrib.FieldByName('MesReferencia').AsString,
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
                                   sValorFinal,
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
         end
         else begin // Pagador é a patrocinadora

            if IntegraBack.Financeiro <> 'N' then 
            begin
              iCodLancCAPCAR := -1;
              iPlnCodigo := 0;

              rValorEnviado := EnviaContribuicaoBANCO(qryContabil,
                                                      qryDocumentos,
                                                      qryHstContrib,
                                                      qryAux,
                                                      Copy(sAnoMesCobranca,6,2),
                                                      sAnoMesCorrente,
                                                      Copy('Devolução de '+qryHstContrib.FieldByName('Nome').AsString,1,40),
                                                      Copy('Estorno de Receita de '+qryHstContrib.FieldByName('Nome').AsString,1,40),
                                                      sDataDevolPatro,
                                                      qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                      qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                      qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                      qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                      -1,
                                                      CtrlDocumento,
                                                      qryHstContrib.FieldByName('FlgPagador').AsString,
                                                      'AS', 
                                                      -1,
                                                      'P', 
                                                      StrToFloat(ClienteNumero(sValorFinal)),
                                                      sMsgErro, iCodLancCAPCAR, iPlnCodigo);

              if rValorEnviado < 0
              then begin
                 sMsgErro := ' Erro no envio da devolução da patrocinadora para o CAP ['+sMsgErro+'].';
                 bErro    := True;
                 break;
              end;

              
              try
                 
              except
              end;
              iPlnCodigo := 0;

              // Descarrega qryContabil com os Lançamentos contábeis dos envios (mantidos)
              IncluiContabilidade(CtrlLancamento, qryContabil , iPlnCodigo,sMsgErro);
              if iPlnCodigo < 0
              then begin
                 sMsgErro := ' Erro na inclusão do lançamento na contabilidade : '+sMsgErro;
                 bErro := True;
                 break;
              end;

              // Atualiza os documentos gerados no CAP/CAR com o número da planilha gerada
              // para a contabilidade - plncodigo
              qryDocumentos.First;
              While not qryDocumentos.EOF Do
              Begin
                 try
                    AdmPREV_Informa_Planilha(qryAux,iPlnCodigo, 
                                               qryDocumentos.FieldByName ('CODDOCUMENTO').AsInteger,
                                               qryDocumentos.FieldByName ('NUMLANCTO').AsInteger);
                 except
                    sMsgErro := 'Erro ao número da planilha nos documentos gerados.';
                    bErro := True;
                    break;
                 end;
                 qryDocumentos.Next;
              end;

              try
                 if not qryDocumentos.IsEmpty then qryDocumentos.CancelUpdates;
                 if not qryContabil.IsEmpty   then qryContabil.CancelUpdates;
              except
              end;

              if qryHstContrib.FieldByName('IdPessJur').AsInteger <> iIdFundacao
              then begin
                 with dtmAPrev.qryAux do
                 begin
                    Close;
                    SQL.Clear;
                    SQL.Add(' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = '+ IntToStr(iCodLancCAPCAR)+
                            ' WHERE  MESREFERENCIA  = '''+qryHstContrib.FieldByName('MesReferencia').AsString+''''+
                            ' AND    MESCOBRANCA    = '''+sAnoMesCobranca+''''+
                            ' AND    IDMOTIVO       = '+IntToStr(iIdMotivo)+
                            ' AND    NUMRECEBIMENTO = '+IntToStr(iNumRecebimento));
                    try
                       Execsql;
                     except
                       sMsgErro := 'Erro na atualização do Nº do Documento no Histórico de Contribuições. ';
                       bErro := True;
                       break;
                    end;
                 end; //with
              end
              else begin
                 with dtmAPrev.qryAux do
                 begin
                    Close;
                    SQL.Clear;
                    SQL.Add(' UPDATE HSTCONTRIBPREV SET PLNCODIGOPREV = '+ IntToStr(iPlnCodigo)+
                            ' WHERE  MESREFERENCIA  = '''+qryHstContrib.FieldByName('MesReferencia').AsString+''''+
                            ' AND    MESCOBRANCA    = '''+sAnoMesCobranca+''''+
                            ' AND    IDMOTIVO       = '+IntToStr(iIdMotivo)+
                            ' AND    NUMRECEBIMENTO = '+IntToStr(iNumRecebimento));
                    try
                       Execsql;
                     except
                       sMsgErro := 'Erro na atualização do Nº do Documento no Histórico de Contribuições. ';
                       bErro := True;
                       break;
                    end;
                 end; //with
              end;
            end; //if integrado com financeiro

         end;
      end; // Fim do Envio


      // Se o tipo de envio for Envia Base
      // Entao ir para proximo registro, pois a devolucao termina aqui
      // Senao, acertar salarios e outros.
      if (qryHstContrib.FieldbyName('FlgTpVlr').AsString <> 'V')
      then begin
         qryHstContrib.Next;
         continue;
      end;

      iIdPessJur   := qryHstContrib.FieldByName('IdPessJur').AsInteger;
      iIdPlanoPrev := qryHstContrib.FieldByName('IdPlanoPrev').AsInteger;

      qryHstContrib.Next;


   end; // while not qryHstContrib.Eof

   Result := not bErro;
end; // FazerDevolucao

procedure TfrmDevolveContribuicoes.FormActivate(Sender: TObject);
begin
  inherited;
  qryPortForma.Close;
  qryPortForma.Open;
  grpDevolBanco.Visible := (rgrpFormaPgto.ItemIndex = 0);
end;

procedure TfrmDevolveContribuicoes.rgrpFormaPgtoClick(Sender: TObject);
begin
  inherited;
  grpDevolBanco.Visible := (rgrpFormaPgto.ItemIndex = 0);
end;

procedure TfrmDevolveContribuicoes.FormCreate(Sender: TObject);
begin
  inherited;
  qryContabil.ParamByName('PLNCODIGO').AsInteger := -1;
  qryContabil.Prepare;
  qryContabil.Open; // query CachedUpdate que contém os registros a serem
                    // passados à LancaContab

  qryDocumentos.ParamByName('CODDOCUMENTO').AsInteger := -1;
  qryDocumentos.Prepare;
  qryDocumentos.Open; // query CachedUpdate que contém todos os documentos
                      // criados neste processo, que serão (ao final
                      // do mesmo) atualizados com o número da planilha
                      // contábil (plncodigo) gerada na contabilização

   
   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
      Abort;
   end;

   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;
                      
end;

procedure TfrmDevolveContribuicoes.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  iTipoBotao := 0;
end;

procedure TfrmDevolveContribuicoes.bbtnSairClick(Sender: TObject);
begin
  inherited;
  iTipoBotao := -1;
end;

function TfrmDevolveContribuicoes.FazerDevolucaoUltimoPagamento ( var sMsgErro : string) : boolean;
var sSQLValues,        sSQLRegra,
    sValorRegra,       sAnoMesCobranca,
    sValorFinal,       sCamposObrig,
    sValorEncontrado,  sSalarioDoMes,
    sSalarioProRata,   sIdRubSalario,
    sCodPortForma,
    sDataDevolPart,
    sDataDevolPatro,
    sDataEnvioTmpDesc,
    sSalarioOriginal,  sSalarioCorreto,
    sTotalEsperado,
    sAnoMesCorrente,
    sUltMesSalario,
    sAnoHoje,          sMesHoje        : string;
    bErro,             bErroRegra      : boolean;
    iPlnCodigo,
    iIdMotivo,
    iIdPessJur,        iIdPlanoPrev,
    iNumRecebimento                    : longint;
    iNumReg,
    iOpTratDiverg                      : integer;

    rValorEnviado,
    rValorRegra,       rValorContrib,
    rValorFinal,       rTotalLote      : double;

    // Dados para integracao contabil/financeira
    sRecPag,    
    sCodTipDoc,
    sCodCentroCustoC,
    sCodCentroCustoD,
    sCodCentroRespon,
    sCodSubConta,
    sCodTipRecDes,
    sPlaContaC,
    sPlaContaD,
    sPlano,
    sTipCodigo,
    sIdEmpresa,
    sUnidNegoc,
    sIdEmpresaProp,
    sIdRegra,
    sPlaContaDProvis,    
    sPlaContaCProvis,    
    sSQLAux, sSQLAux2 : string;
    iIdContribAnt, iCodLancCAPCAR      : longint;

    //BRUNO AZEVEDO SOL 130119 KINTANA 789646
    iAnoAtual, iMesAtual, iUltDia, iUltDiaAtual: Integer;
    sValorRecebido: String;
begin

   Result   := False;
   sMsgErro := '';
   bErro    := False;

   sMesHoje    := Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
   sAnoHoje    := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4);

   iIdContribAnt := -1;

   if (sSitFundacao = 'AS') or (sTipoChamada  = 'C')
   then begin
      if sFlgIntEvento = 'FL'
      then iIdMotivo := prmIdMotDevolNaoIden
      else iIdMotivo := prmIDMOTIVOFOLHABEN;
   end
   else iIdMotivo := prmIdMotivoDiverg;

   qryHstContrib.First;

   // Gerar lote de contribuicao
   if (iIdLote < 0) and ((sSitFundacao <> 'AS') or (sFlgIntEvento <> 'FL'))
   then begin
      iIdLote := GeraLOTE(qryHstContrib.FieldByName('IdPessJur').AsInteger,True,sAnoMesCobranca,
                          'P', 'Devolução de Contribuição - Matrícula : '+sMatricula,
                          'D','1','0','0','0','0', FormatDateTime('dd/mm/yyyy', Date),'','','',''); 

      if iIdLote < 0
      then begin
         sMsgErro := ' Erro na geração do lote de contribuições. ';
         Exit;
      end;
   end;

   rTotalLote := 0;
   iNumReg    := 0;

   case rgrpFormaPgto.ItemIndex of
        0 : sDataDevolPart := Trim(dtDevolucao.Text);
        1 : sDataDevolPart := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             qryHstContrib.FieldByName('IdPessJur').AsString,
                                             qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                             sSitFundacao, 'D',
                                             sMesHoje, sAnoHoje);
        2 : sDataDevolPart := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             IntToStr(iIdFundacao),
                                             qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                             'AS', 'D',
                                             sMesHoje, sAnoHoje);
   end;

   sDataDevolPatro := CriticaDataCobrancaSit(dtmAPrev.qry,
                                             qryHstContrib.FieldByName('IdPessJur').AsString,
                                             qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                             'PT', 'D',
                                             sMesHoje, sAnoHoje);

   if Trim(sDataDevolPart)  = '' Then sDataDevolPart  := FormatDateTime('dd/mm/yyyy', Date);
   if Trim(sDataDevolPatro) = '' Then sDataDevolPatro := FormatDateTime('dd/mm/yyyy', Date);

   // Utilizar como DATA DE COBRANCA a data do CALENDARIO, porem usar como MESCOBRANCA o mes do lote
   if iIdLote > 0
   then sAnoMesCobranca := BuscaMesCobrancaLote( iIdLote, Copy(Trim(sDataDevolPart),7,4)+'/'+Copy(sDataDevolPart,4,2))
   else sAnoMesCobranca := Copy(sDataDevolPart,7,4)+'/'+Copy(sDataDevolPart,4,2);

   if sSitFundacao = 'MA'
   then begin
      sSalarioDoMes   := ClienteNumero(qryHstContrib.FieldByName('SalMantido').AsString);
      sIdRubSalario   := qryHstContrib.FieldByName('IDRUBSALMANUT').AsString;
   end
   else if sSitFundacao = 'AS'
        then begin
           sSalarioDoMes   := ClienteNumero(qryHstContrib.FieldByName('SalAuxDoenca').AsString);
           sIdRubSalario   := qryHstContrib.FieldByName('IDRUBSALAUXDOENCA').AsString;
        end
        else begin
           sSalarioDoMes   := ClienteNumero(qryHstContrib.FieldByName('SalParticipacao').AsString);
           sIdRubSalario   := qryHstContrib.FieldByName('IDRUBSALPARTICIP').AsString;
        end;
   if Trim(sIdRubSalario) = ''
   then begin
      sMsgErro := 'Rubrica relativa ao salário do participante não informada.'+#13+
                  'Verifique o cadastro da patrocinadora.';
      Result   := False;
      Exit;
   end;

   sAnoMesCorrente  := qryHstContrib.FieldByName('MesReferencia').AsString;
   sUltMesSalario   := sAnoMesCorrente;
   sSalarioOriginal := '0';
   sSalarioOriginal := BuscaSalario( qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                     qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                     qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                     qryHstContrib.FieldByName('MesReferencia').AsString,
                                     sSitFundacao,
                                     sSalarioOriginal,
                                     sMsgErro,
                                     qryAux);
   sSalarioDoMes    := sSalarioOriginal;

   while not qryHstContrib.EOF do
   begin
      //BRUNO AZEVEDO SOL 130119 KINTANA 789646
      iAnoAtual := StrToInt(Copy(qryHstContrib.FieldByName('MESREFERENCIA').AsString,1,4));
      iMesAtual := StrToInt(Copy(qryHstContrib.FieldByName('MESREFERENCIA').AsString,6,2));

      if (iMesAtual = DiasUteis.ExtraiMes(StrToDate(sDataFinal))) or (iMesAtual = 13) then begin
        try
          iUltDia   := DiasUteis.ExtraiDia(StrToDate(sDataFinal));
        except
          iUltDia   := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAnoAtual,iMesAtual));
        end;

        //13º 181 DIAS
        if (iMesAtual = 13) then begin
          iUltDiaAtual := 181;
        end else begin
          iUltDiaAtual := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAnoAtual,iMesAtual));
        end;

        try
          sValorRecebido := FloatToStrF(qryHstContrib.FieldByName('ValorRecebido').AsFloat - ((qryHstContrib.FieldByName('ValorRecebido').AsFloat * iUltDia)/ iUltDiaAtual), FFFixed, 10,2);
        except
          sValorRecebido := '';
        end;
      end else begin
        sValorRecebido := FloatToStrF(qryHstContrib.FieldByName('ValorRecebido').AsFloat, FFFixed, 10,2);
      end;
      //BRUNO AZEVEDO SOL 130119 KINTANA 789646

      // Se usuario optou por aceitar, ir para a proxima contribuicao
      if qryHstContrib.FieldByName('FlgAceita').AsInteger = 1
      then begin
         qryHstContrib.Next;
         continue;
      end;
      if Trim(sValorRecebido) <> ''
      then rValorContrib := StrToFloat(sValorRecebido)
      else rValorContrib := 0;
      sValorFinal        := OraNumero(FloatToStr(rValorContrib));
      rValorRegra        := 0;
      sValorRegra        := '0';

      // Se mudou o mês Entao buscar o salario do mes
      if qryHstContrib.FieldByName('MesReferencia').AsString <> sUltMesSalario
      then begin
         sSalarioDoMes   := BuscaSalario( qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                          qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                          qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                          qryHstContrib.FieldByName('MesReferencia').AsString,
                                          sSitFundacao,
                                          sSalarioOriginal,
                                          sMsgErro,
                                          qryAux);
         sUltMesSalario := qryHstContrib.FieldByName('MesReferencia').AsString;
      end;

      sSalarioProRata := sSalarioDoMes;

      // A.  Se for o ultimo mes de contribuicao (ou seja, o 1o. mes do evento) Entao :
      // A1. Se nao tiver regra de ultimo pagamento Entao :
      //     1.1. Fazer pro-rata do salario
      //     1.2. Chamar regra de calculo da contribuicao, passando este salario
      //     1.3. Devolver a diferenca da contribuicao
      //     1.4. Atualizar salario pro-rata na HistRubSal
      // A2. Se tiver regra de ultimo pagamento Entao :
      //     2.1. Fazer pro-rata da contribuicao atraves da regra de ultimo pagamento
      //     2.2. Fazer pro-rata do salario
      //     2.3. Devolver a diferenca da contribuicao
      //     2.4. Atualizar salario pro-rata na HistRubSal
      // B.  Se nao for ultimo  mes da contribuicao (ou seja, é algum mes posterior
      //     ao mes do evento) Entao :
      //     1. Devolver valor inteiro da contribuicao
      //     2. Apagar salario inteiro da HistRubSal
      if (Trim(sDataFinal) <> '') and
         (qryHstContrib.FieldByName('MesReferencia').AsString = Copy(sDataFinal,7,4) +'/'+Copy(sDataFinal,4,2) )
      then begin
         if ((Copy(sDataFinal,1,2) = '30')  or (Copy(sDataFinal,1,2) = '31') or
             ((Copy(sDataFinal,4,2) = '02') and (Copy(sDataFinal,1,2) = '28')))
         then begin
            sSalarioProRata := '0';
            sValorRegra     := OraNumero(FloatToStr(rValorContrib)); 
         end
         else
         begin
            sSalarioProRata := OraNumero(FloatToStr(ValorProRataPrimeiro( sSalarioDoMes, FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal)))));

            if (Trim(qryHstContrib.FieldByName('IDREGRAULTPAGTO').AsString) = '')
            then begin // nao tem regra de ultimo pagamento
               sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                iIdMotivo,
                                qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                Copy(sDataFinal,7,4) +'/'+Copy(sDataFinal,4,2),
                                FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal)), 
                                sValorFinal,
                                qryHstContrib.FieldByName('InscricaoData').AsString,
                                qryHstContrib.FieldByName('DataNasc').AsString,
                                'N','HSTCONTRIBPREV','VALORESPERADO',
                                sSalarioProRata,
                                qryHstContrib.FieldByName('IDSITPART').AsString,
                                '01/'+Copy(sDataFinal,4,7),
                                sDataFinal,1,-1,sAnoMesCobranca,iIdLote);

               sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRACALCULO').AsString,
                                            sSQLRegra,bErro,iIdCalculoGeral);
               if bErro
               then begin
                  sMsgErro := 'Erro na Execução da Regra de Cálculo da Contribuição. ';
                  bErro    := True;
                  break;
               end;
               if sValorRegra = ''
               then begin
                  sMsgErro := 'A Regra de Cálculo da Contribuição retornou um valor em branco.';
                  bErro    := True;
                  break;
               end;
            end
            else begin
               sSQLRegra  := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                 qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                 qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                 qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                 qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                 iIdMotivo,
                                 qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                 qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                 FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal) ), 
                                 sValorFinal,
                                 qryHstContrib.FieldByName('InscricaoData').AsString,
                                 qryHstContrib.FieldByName('DataNasc').AsString,
                                 'U','HSTCONTRIBPREV','VALORESPERADO',
                                 sSalarioProRata,
                                 qryHstContrib.FieldByName('IDSITPART').AsString,
                                 '01/'+Copy(sDataFinal,4,7),
                                 sDataFinal,1,-1,sAnoMesCobranca,iIdLote);

               sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAULTPAGTO').AsString,  sSQLRegra,bErro,iIdCalculoGeral);

               if bErro
               then begin
                  sMsgErro := 'Erro na Execução da Regra de Cálculo do Primeiro Pagamento. ';
                  bErro    := True;
                  break;
               end;

               if sValorRegra = ''
               then begin
                  sMsgErro := 'A Regra de Cálculo do Primeiro Pagamento retornou um valor em branco.';
                  bErro    := True;
                  break;
               end;
            end;
         end;
      end // se for ultimo
      else begin // Tratamento para devolucao de contribuicao sobre 13o.
         if Copy(qryHstContrib.FieldByName('MesReferencia').AsString,6,2) = '13' // testar se é 13o.
         then begin
            if Copy(qryHstContrib.FieldByName('MesReferencia').AsString, 1,4) = Copy(sDataRef, 7, 4)
            then begin
                sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                  qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                  qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                  qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                  qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                  iIdMotivo,
                                                  qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                  qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                  sDataFinal, 
                                                  sValorFinal,
                                                  qryHstContrib.FieldByName('InscricaoData').AsString,
                                                  qryHstContrib.FieldByName('DataNasc').AsString,
                                                  'N','HSTCONTRIBPREV','VALORESPERADO',
                                                  '0',
                                                  qryHstContrib.FieldByName('IDSITPART').AsString,
                                                  sDataRef,
                                                  FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal) ), 1,-1,sAnoMesCobranca,iIdLote); 

                sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRACALCULO13').AsString,
                                              sSQLRegra,bErro,iIdCalculoGeral);
                sValorFinal := sValorRegra;

                sSQLRegra   := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                  qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                  qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                  qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                  qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                  iIdMotivo,
                                                  qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                  qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                  sDataFinal, 
                                                  sValorFinal,
                                                  qryHstContrib.FieldByName('InscricaoData').AsString,
                                                  qryHstContrib.FieldByName('DataNasc').AsString,
                                                  'P','HSTCONTRIBPREV','VALORESPERADO',
                                                  '0',
                                                  qryHstContrib.FieldByName('IDSITPART').AsString,
                                                  sDataRef,
                                                  FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal) ), 1,-1,sAnoMesCobranca,iIdLote); 

                sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAPRIMPGTO13').AsString,
                                              sSQLRegra,bErro,iIdCalculoGeral);
            end
            else if (Trim(sDataFinal) <> '') and
                    (Copy(qryHstContrib.FieldByName('MesReferencia').AsString, 1,4) = Copy(sDataFinal, 7, 4))
                 then begin
                    sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                      qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                      qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                      qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                      qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                      iIdMotivo,
                                                      qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                      qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                      sDataFinal, 
                                                      sValorFinal,
                                                      qryHstContrib.FieldByName('InscricaoData').AsString,
                                                      qryHstContrib.FieldByName('DataNasc').AsString,
                                                      'N','HSTCONTRIBPREV','VALORESPERADO',
                                                      '0',
                                                      qryHstContrib.FieldByName('IDSITPART').AsString,
                                                      sDataRef,                                                      
                                                      FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal) ), 1,-1,sAnoMesCobranca,iIdLote); 

                    if (qryHstContrib.FieldbyName('IDREGRACALCULO13').AsString <> '')
                    then sIdRegra := qryHstContrib.FieldbyName('IDREGRACALCULO13').AsString
                    else sIdRegra := qryHstContrib.FieldbyName('IDREGRACALCULO').AsString;

                    sValorRegra := RegraNumerica(sIdRegra, sSQLRegra, bErro, iIdCalculoGeral);

                    sValorFinal := sValorRegra;

                    if qryHstContrib.FieldbyName('IDREGRAULTPGTO13').AsString <> ''
                    then begin
                       sSQLRegra := MontaSQLContribNOVA(qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                     qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                     qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                     qryHstContrib.FieldByName('SeqProposta').AsInteger,
                                                     qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                     iIdMotivo,
                                                     qryHstContrib.FieldByName('FLGSITFUNDACAO').AsString,
                                                     qryHstContrib.FieldByName('MESREFERENCIA').AsString,
                                                     sDataFinal, 
                                                     sValorFinal,
                                                     qryHstContrib.FieldByName('InscricaoData').AsString,
                                                     qryHstContrib.FieldByName('DataNasc').AsString,
                                                     'U','HSTCONTRIBPREV','VALORESPERADO',
                                                     '0',
                                                     qryHstContrib.FieldByName('IDSITPART').AsString,
                                                     sDataRef,
                                                     FormatDateTime('dd/mm/yyyy', StrToDate(sDataFinal) ), 1,-1,sAnoMesCobranca,iIdLote); 


                       sValorRegra := RegraNumerica(qryHstContrib.FieldbyName('IDREGRAULTPGTO13').AsString,
                                                 sSQLRegra,bErro,iIdCalculoGeral);
                    end
                 end
                 else sValorRegra := sValorRecebido;

            if bErro
            then begin
               sMsgErro := 'Erro na Execução da Regra de Cálculo da Contribuição sobre 13o. ';
               bErro    := True;
               break;
            end;
            if sValorRegra = ''
            then begin
               sMsgErro := 'A Regra de Cálculo da Contribuição sobre 13o. retornou um valor em branco.';
               bErro    := True;
               break;
            end;
         end;
      end; // fim - tratamento da contribuicao sobre 13o.

      // Verificar quanto foi pago e quanto deveria ter sido pago.
      // Se o participante pagou mais do que deveria , entao devolver
      // Senao, ir para o próximo
      try
         rValorRegra := StrToFloat(ClienteNumero(sValorRegra));
         rValorFinal := rValorContrib - rValorRegra;

         if rValorFinal < 0 then rValorFinal := 0;
         sValorFinal := OraNumero(FloatToStr(rValorFinal));
      except
         sMsgErro := 'Erro ao converter valor da devolução.';
         bErro    := True;
         break;
      end;

      if rValorFinal <= 0
      then begin
        case rgrpFormaPgto.ItemIndex of
             0 : iOpTratDiverg := 5; // banco
             1 : iOpTratDiverg := 4; // ccp
             2 : iOpTratDiverg := 6; // folha beneficio
        end;

        // Atualizar campo OPTRATDIVERG para em outros eventos não pegar estas devoluções
        // Marcar como tratado para que a concessao nao apresente novamente
        with dtmAPrev.qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' UPDATE HSTCONTRIBPREV SET OPTRATDIVERG = '+IntToStr(iOpTratDiverg)+
                   ' WHERE   IDPESSOA        = '+IntToSTr(qryHstContrib.FieldByName('IDPESSOA').AsInteger)+
                   ' AND     SEQPROPOSTA     = '+IntToSTr(qryHstContrib.FieldByName('SEQPROPOSTA').AsInteger)+
                   ' AND     MESREFERENCIA   = '''+ qryHstContrib.FieldByName('MESREFERENCIA').AsString+''''+
                   ' AND     IDCONTRIBUICAO  = '+IntToSTr(qryHstContrib.FieldByName('IDCONTRIBUICAO').AsInteger)+
                 ' AND     (((OPTRATDIVERG   NOT IN ( 4,5,6,8 )) OR (OPTRATDIVERG IS NULL) ) ) ');
           try
              Execsql;
            except
              sMsgErro := 'Erro na atualização da devolução no Histórico de Contribuições. ';
              bErro := True;
              break;
           end;
        end; //with

        qryHstContrib.Next;
        continue;
      end;

      // Inserir valor final na HSTCONTRIBPREV
      iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');

      sSQLValues := ''''+qryHstContrib.FieldByName('MesReferencia').AsString+'''';
      sSQLValues := sSQLValues+','''+sAnoMesCobranca+'''';
      sSQLValues := sSQLValues+',' +IntToStr(iNumRecebimento);

      sSQLValues := sSQLValues+',' +IntToStr(iIdMotivo);

      if Trim(dblkpcmbPortForma.Text) <> ''
      then sSQLValues := sSQLValues+', ' +qryPortForma.FieldByName('CodPortForma').AsString
      else begin
         if Trim(qryHstContrib.FieldByName('CodPortForma').AsString) <> ''
         then sSQLValues := sSQLValues+', ' +qryHstContrib.FieldByName('CodPortForma').AsString
         else BuscaInfFinancContrib(sSQLValues,sCamposObrig,sValorEncontrado,'CODPORTFORMA',
                                    qryHstContrib.FieldByName('CodPortForma').AsString,
                                    'N',
                                    qryHstContrib.FieldbyName('IdPessJur').AsInteger,
                                    qryHstContrib.FieldbyName('IdPlanoPrev').AsInteger,
                                    qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                    -1 ); 
      end;

      if qryHstContrib.FieldbyName('FlgPagador').AsString = 'P'
      then sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPatro)+''',''DD/MM/YYYY'') '
      else sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPart)+''',''DD/MM/YYYY'') ';

      // Se nao exige Recebimento, colocar datarecebimento = data prevista
      if qryHstContrib.FieldByName('FlgNaoExigeRec').AsInteger = 1
      then begin
         if qryHstContrib.FieldbyName('FlgPagador').AsString = 'P'
         then sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPatro)+''',''DD/MM/YYYY'') '
         else sSQLValues := sSQLValues+', TO_DATE('''+Trim(sDataDevolPart)+''',''DD/MM/YYYY'') ';
      end
      else sSQLValues := sSQLValues+', NULL ';

      sSQLValues := sSQLValues+', '+OraNumero(sValorFinal); // ValorEsperado
      sSQLValues := sSQLValues+', '+OraNumero(sValorFinal); // ValorCalculado

      // Se nao exige Recebimento, colocar valorrecebido = esperado
      if qryHstContrib.FieldByName('FlgNaoExigeRec').AsInteger = 1
      then sSQLValues := sSQLValues+', '+OraNumero(sValorFinal) // ValorRecebido
      else sSQLValues := sSQLValues+', NULL ';


      if Trim(qryHstContrib.FieldByName('IdRegraCalculo').AsString) <> ''
      then sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdRegraCalculo').AsString
      else sSQLValues := sSQLValues+', NULL ';

      if rgrpFormaPgto.ItemIndex = 0 // flgdescfolha
      then sSQLValues := sSQLValues+', 0 '
      else sSQLValues := sSQLValues+', 1 ';
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdPessoa').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('SeqProposta').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdPessJur').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdPlanoPrev').AsString;
      sSQLValues := sSQLValues+', '+qryHstContrib.FieldByName('IdContribuicao').AsString;
      sSQLValues := sSQLValues+', 0'; //FLGCALCRESERVA
      if Trim(qryHstContrib.FieldbyName('ValorOp1').AsString) <> ''
      then sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldbyName('ValorOp1').AsString)
      else sSQLValues := sSQLValues+', NULL ';

      if Trim(qryHstContrib.FieldbyName('ValorOp2').AsString) <> ''
      then sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldbyName('ValorOp2').AsString)
      else sSQLValues := sSQLValues+', NULL ';

      if Trim(qryHstContrib.FieldbyName('ValorOp3').AsString) <> ''
      then sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldbyName('ValorOp3').AsString)
      else sSQLValues := sSQLValues+', NULL ';

      sSQLValues := sSQLValues+', TO_DATE('''+qryHstContrib.FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY'') '; // DataInicio

      if Trim(qryHstContrib.FieldByName('DATAFINAL').AsString) = ''
      then sSQLValues := sSQLValues+', NULL '
      else sSQLValues := sSQLValues+', TO_DATE('''+qryHstContrib.FieldByName('DATAFINAL').AsString+''',''DD/MM/YYYY'') '; // DataFINAL


      sSQLValues := sSQLValues+', '''+sSitFundacao+'''';       //FLGSITFUNDACAO

      // Se nao exige Recebimento, colocar sitrecebimento = 2
      // Senao, sitrecebimento = 4
      if qryHstContrib.FieldByName('FlgNaoExigeRec').AsInteger = 1 //SITRECEBIMENTO
      then sSQLValues := sSQLValues+', ''2'' '
      else if (sTipoChamada = 'C') or (sTipoChamada = 'R')
           then  begin
              if sFlgIntEvento = 'FL'
              then sSQLValues := sSQLValues+', ''0'' '
              else sSQLValues := sSQLValues+', ''1'' ';
           end
           else  sSQLValues := sSQLValues+', ''0'' ';

      sSQLValues := sSQLValues+', ''F''';    //TIPO

      if iIdLote > 0
      then sSQLValues := sSQLValues+', '+IntToStr(iIdLote)          //IDLOTE
      else sSQLValues := sSQLValues+', NULL ';
      
      sSQLValues := sSQLValues+', '+OraNumero(qryHstContrib.FieldByName('Parcela').AsString);//PARCELA

      sSQLValues := sSQLValues+', 1';                           // FLGDEVOLUICAO

      if (sTipoChamada = 'C') or (sTipoChamada = 'R')
      then sSQLValues := sSQLValues+', 1'                       // FLGCONCESSAO
      else sSQLValues := sSQLValues+', 0';                      // FLGCONCESSAO

      if (sTipoChamada = 'E') or (sTipoChamada = 'C') or (sTipoChamada = 'R')
      then sSQLValues := sSQLValues+', 1'                       // FLGEVENTO
      else sSQLValues := sSQLValues+', 0';                      // FLGEVENTO

      if (sTipoChamada = 'E')  or (sTipoChamada = 'C') or (sTipoChamada = 'R')
      then if sFlgIntEvento <> ''
           then sSQLValues := sSQLValues+', '''+sFlgIntEvento+''''
           else sSQLValues := sSQLValues+', NULL '
      else sSQLValues := sSQLValues+', NULL ';                      // FLGINTEVENTO

      
      if sFlgIntEvento = 'FL'
      then sSQLValues := sSQLVAlues+', ''B'' '
      else begin
         
         case rgrpFormaPgto.ItemIndex of
              0 : sSQLValues := sSQLVAlues+', ''C'' ';
              1 : sSQLValues := sSQLVAlues+', ''P'' ';
              2 : sSQLValues := sSQLVAlues+', ''B'' ';
         end;
      end;
      
      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' INSERT INTO HSTCONTRIBPREV (MESREFERENCIA,MESCOBRANCA,NUMRECEBIMENTO,IDMOTIVO,'+
                 '                             CODPORTFORMA,DATAPREVISAORECE,DATARECEBIMENTO, '+
                 '                             VALORESPERADO,VALORCALCULADO,VALORRECEBIDO,IDREGRACALCULO, '+
                 '                             FLGDESCFOLHA,IDPESSOA,SEQPROPOSTA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                 '                             FLGCALCRESERVA,VALOROP1,VALOROP2,VALOROP3,DATAINICIO,DATAFINAL,         '+
                 '                             FLGSITFUNDACAO,SITRECEBIMENTO,TIPO,IDLOTE,PARCELA,FLGDEVOLUCAO,FLGCONCESSAO, '+
                 '                             FLGEVENTO, FLGINTEVENTO, FOLHAORIGEM) '+ 
                 ' VALUES('+sSQLValues+')');
         try
            Execsql;
            inc(iNumReg);
            rTotalLote := rTotalLote + StrToFloat(ClienteNumero(sValorFinal));
          except
            sMsgErro := 'Erro na gravação do Histórico de Contribuições. ';
            bErro := True;
            break;
         end;
      end; //with

      case rgrpFormaPgto.ItemIndex of
           0 : iOpTratDiverg := 5; // banco
           1 : iOpTratDiverg := 4; // ccp
           2 : iOpTratDiverg := 6; // folha beneficio
      end;

      // Atualizar campo OPTRATDIVERG para em outros eventos não pegar estas devoluções
      with dtmAPrev.qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' UPDATE HSTCONTRIBPREV SET OPTRATDIVERG = '+IntToStr(iOpTratDiverg)+
                 ' WHERE   IDPESSOA        = '+IntToSTr(qryHstContrib.FieldByName('IDPESSOA').AsInteger)+
                 ' AND     SEQPROPOSTA     = '+IntToSTr(qryHstContrib.FieldByName('SEQPROPOSTA').AsInteger)+
                 ' AND     MESREFERENCIA   = '''+ qryHstContrib.FieldByName('MESREFERENCIA').AsString+''''+
                 ' AND     IDCONTRIBUICAO  = '+IntToSTr(qryHstContrib.FieldByName('IDCONTRIBUICAO').AsInteger)+
                 ' AND     (((OPTRATDIVERG   NOT IN ( 4,5,6,8 )) OR (OPTRATDIVERG IS NULL) ) ) ');                 

         try
            Execsql;
          except
            sMsgErro := 'Erro na atualização da devolução no Histórico de Contribuições. ';
            bErro := True;
            break;
         end;
      end; //with


      // Se a devolucao for para a Folha de Beneficio, não calcular os alteradores pois a folha
      // que devera calcular,
      // Senao, calcular e gravar alteradores de devolucao

      if rgrpFormaPgto.ItemIndex <> 2
      then begin
          if qryHstContrib.FieldbyName('FlgPagador').AsString = 'P'
          then begin
             if not GravaAlterador('D',qryHstContrib.FieldByName('MesReferencia').AsString,
                      sAnoMesCobranca,
                      '1',
                      iNumRecebimento,
                      iIdMotivo,
                      qryHstContrib.FieldByName('IdPlanoPrev').AsInteger, //piIdPlanoPrev,
                      qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                      qryHstContrib.FieldByName('IdPessJur').AsInteger, //piIdPessJur,
                      qryHstContrib.FieldByName('DataRecebimento').AsString,// Data referencia
                      qryHstContrib.FieldByName('DataRecebimento').AsString,// Data previsao
                      Trim(sDataDevolPatro),        // Data recebido
                      sValorFinal,
                      sMsgErro )
             then begin
                if Trim(sMsgErro) = ''
                then  sMsgErro := ' Erro na gravação dos alteradores da contribuição. ';
                bErro    := True;
                break;
             end;
          end
          else begin
             if not GravaAlterador('D',qryHstContrib.FieldByName('MesReferencia').AsString,
                         sAnoMesCobranca,
                         '1',
                         iNumRecebimento,
                         iIdMotivo,
                         qryHstContrib.FieldByName('IdPlanoPrev').AsInteger, //piIdPlanoPrev,
                         qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                         qryHstContrib.FieldByName('IdPessJur').AsInteger, //piIdPessJur,
                         qryHstContrib.FieldByName('DataRecebimento').AsString,// Data referencia
                         qryHstContrib.FieldByName('DataRecebimento').AsString,// Data previsao
                         Trim(sDataDevolPart),        // Data recebido
                         sValorFinal,
                         sMsgErro )
             then begin
                if Trim(sMsgErro) = ''
                then  sMsgErro := ' Erro na gravação dos alteradores da contribuição. ';
                bErro    := True;
                break;
             end;
          end;
      end;

      // Se for CONCESSAO DE BENEFICIO, ENTAO ENVIAR CONTRIBUICAO PARA TMPDESC
      if ((sTipoChamada = 'C') or (sTipoChamada = 'R')) and (sFlgIntEvento <> 'FL')
      then begin
         if qryHstContrib.FieldbyName('FlgPagador').AsString = 'C'
         then begin
            // ******************************************************************************
            // Preencher Informacoes de Integracao com Financeiro e Contabilidade
            // ******************************************************************************

            if IntegraBack.Financeiro <> 'N' then 
            begin
               if not dtmAPrevIntegraBack.BuscaInfIntegra( qryHstContrib.FieldByName('IDPESSJUR').AsInteger,
                                    qryHstContrib.FieldByName('IDPLANOPREV').AsInteger,
                                    qryHstContrib.FieldByName('IDPESSOA').AsInteger,
                                    qryHstContrib.FieldByName('IDPESSOA').AsInteger,
                                    qryHstContrib.FieldByName('IDCONTRIBUICAO').AsInteger,
                                    'C',
                                    'B',
                                    1,
                                    sAnoMesCobranca,
                                    qryHstContrib.FieldByName('MesReferencia').AsString,
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
                                    'P', 
                                    True, sMsgErro ) 
               then begin
                  MsgDlg('Acerto de Contribuição : Erro ao buscar parametrização financeira. Verifique.','Erro',mtError,[mbOk],0);
                  Exit;
               end;
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
                                   sDataDevolPart, '',
                                   sDataRef,
                                   'Devolução de Contribuição', '-1', '',
                                   'D', 'B', '0',
                                   '0',
                                   '', 'P', qryHstContrib.FieldByName('IdContribuicao').AsString,
                                   '', sIdEmpresaProp, sIdEmpresaProp,
                                   qryHstContrib.FieldByName('IdPessoa').AsString,
                                   IntToStr(iIdFundacao),
                                   IntToStr(iIdLote),
                                   IntToStr(Sistema.IdModulo),
                                   IntToStr(iIdMotivo),
                                   qryHstContrib.FieldByName('IdPessJur').AsString,
                                   qryHstContrib.FieldByName('IdPessoa').AsString,
                                   qryHstContrib.FieldByName('IdPlanoPrev').AsString,
                                   '',
                                   qryHstContrib.FieldByName('IDRUBRICADEVOLUC').AsString,
                                   qryHstContrib.FieldByName('IdPessoa').AsString,
                                   qryHstContrib.FieldByName('INSCRICAONUMERO').AsString,
                                   '',
                                   sAnoMesCobranca,
                                   qryHstContrib.FieldByName('MesReferencia').AsString,
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
                                   sValorFinal,
                                   qryHstContrib.FieldbyName('ValorOp1').AsString,
                                   qryHstContrib.FieldbyName('ValorOp2').AsString,
                                   qryHstContrib.FieldbyName('ValorOp3').AsString,
                                   '',
                                   '',
                                   iNumRecebimento) 
            then begin
               if Trim(sMsgErro) = ''
               then  sMsgErro := ' Erro no da devolução envio para Folha de Benefícios.';
               bErro    := True;
               break;
            end;
         end
         else begin // Pagador é a patrocinadora

            iCodLancCAPCAR := -1;
            iPlnCodigo := 0;

            rValorEnviado := EnviaContribuicaoBANCO(qryContabil,
                                                    qryDocumentos,
                                                    qryHstContrib,
                                                    qryAux,
                                                    Copy(sAnoMesCobranca,6,2),
                                                    sAnoMesCorrente,
                                                    Copy('Devolução de '+qryHstContrib.FieldByName('Nome').AsString,1,40),
                                                    Copy('Estorno de Receita de '+qryHstContrib.FieldByName('Nome').AsString,1,40),
                                                    sDataDevolPatro,
                                                    qryHstContrib.FieldByName('IdPessJur').AsInteger,
                                                    qryHstContrib.FieldByName('IdPlanoPrev').AsInteger,
                                                    qryHstContrib.FieldByName('IdPessoa').AsInteger,
                                                    qryHstContrib.FieldByName('IdContribuicao').AsInteger,
                                                    -1,
                                                    CtrlDocumento,
                                                    qryHstContrib.FieldByName('FlgPagador').AsString,
                                                    'AS', // sitpart
                                                    -1,
                                                    'P', // recpag
                                                    StrToFloat(ClienteNumero(sValorFinal)),
                                                    sMsgErro, iCodLancCAPCAR, iPlnCodigo);

            if rValorEnviado < 0
            then begin
               sMsgErro := ' Erro no envio da devolução da patrocinadora para o CAP ['+sMsgErro+'].';
               bErro    := True;
               break;
            end;

            

            iPlnCodigo := 0;

            // Descarrega qryContabil com os Lançamentos contábeis dos envios (mantidos)
            IncluiContabilidade(CtrlLancamento, qryContabil , iPlnCodigo,sMsgErro);
            if iPlnCodigo < 0
            then begin
               sMsgErro := ' Erro na inclusão do lançamento na contabilidade : '+sMsgErro;
               bErro := True;
               break;
            end;

            // Atualiza os documentos gerados no CAP/CAR com o número da planilha gerada
            // para a contabilidade - plncodigo
            qryDocumentos.First;
            While not qryDocumentos.EOF Do
            Begin
               try
                  AdmPREV_Informa_Planilha(qryAux,iPlnCodigo,
                                             qryDocumentos.FieldByName ('CODDOCUMENTO').AsInteger,
                                             qryDocumentos.FieldByName ('NUMLANCTO').AsInteger);
               except
                  sMsgErro := 'Erro ao número da planilha nos documentos gerados.';
                  bErro := True;
                  break;
               end;
               qryDocumentos.Next;
            end;

            try
               if not qryDocumentos.IsEmpty then qryDocumentos.CancelUpdates;
               if not qryContabil.IsEmpty   then qryContabil.CancelUpdates;
            except
            end;

            if qryHstContrib.FieldByName('IdPessJur').AsInteger <> iIdFundacao
            then begin
               with dtmAPrev.qryAux do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' UPDATE HSTCONTRIBPREV SET CODDOCUMENTOPREV = '+ IntToStr(iCodLancCAPCAR )+
                          ' WHERE MESREFERENCIA  = '''+qryHstContrib.FieldByName('MesReferencia').AsString+''''+
                          ' AND   MESCOBRANCA    = '''+sAnoMesCobranca+''''+
                          ' AND   IDMOTIVO       = '+IntToStr(iIdMotivo)+
                          ' AND   NUMRECEBIMENTO = '+IntToStr(iNumRecebimento));
                  try
                     Execsql;
                   except
                     sMsgErro := 'Erro na atualização do Nº do Documento no Histórico de Contribuições. ';
                     bErro := True;
                     break;
                  end;
               end; //with
            end
            else begin
               with dtmAPrev.qryAux do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' UPDATE HSTCONTRIBPREV SET PLNCODIGOPREV = '+ IntToStr(iPlnCodigo)+
                          ' WHERE  MESREFERENCIA  = '''+qryHstContrib.FieldByName('MesReferencia').AsString+''''+
                          ' AND    MESCOBRANCA    = '''+sAnoMesCobranca+''''+
                          ' AND    IDMOTIVO       = '+IntToStr(iIdMotivo)+
                          ' AND    NUMRECEBIMENTO = '+IntToStr(iNumRecebimento));
                  try
                     Execsql;
                   except
                     sMsgErro := 'Erro na atualização do Nº do Documento no Histórico de Contribuições. ';
                     bErro := True;
                     break;
                  end;
               end; //with
            end;

         end;
      end; // Fim do Envio

      // Se o tipo de envio for Envia Base
      // Entao ir para proximo registro, pois a devolucao termina aqui
      // Senao, acertar salarios e outros.
      if (qryHstContrib.FieldbyName('FlgTpVlr').AsString <> 'V')
      then begin
         qryHstContrib.Next;
         continue;
      end;

      iIdPessJur   := qryHstContrib.FieldByName('IdPessJur').AsInteger;
      iIdPlanoPrev := qryHstContrib.FieldByName('IdPlanoPrev').AsInteger;

      qryHstContrib.Next;

   end; // while not qryHstContrib.Eof

   // Atualizar lote
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' UPDATE CTRLINTERFACE SET NUMREG   = NUMREG   + '+IntToStr(iNumReg)+ ', '+
                  '                          VLRTOTAL = VLRTOTAL + '+OraNumero(FloatToStr(rTotalLote))+
                  ' WHERE  (IDLOTE = '+IntToStr(iIdLote)+')');
   try
      qryAux.ExecSQL;
   except
      sMsgErro := 'Erro atualizar lote no controle de interface. ';
      bErro    := True;
      Exit;
   end;

   Result := not bErro;
end; // FazerDevolucaoUltimoPagamento


{para cada contribuição a ser enviada para devolução
alimentar a reserva neste momento, com o valor esperado enviado
marcando cmo alimentadas e anda não recebidas.
}
function TfrmDevolveContribuicoes.AbateDaReserva( iIdPessoa,
                                                  iIdPessjur,
                                                  iIdPlanoPrev ,
                                                  iIdContribuicao,
                                                  iSeqProposta : Integer;
                                                  sDataPrevisao,
                                                  sDataRecebimento,
                                                  sMesRef,
                                                  sValor : String;
                                                  var sErro : String ) : Boolean;
var  PercProd, dValor, dValIndice : Double;
     sSql, sDataRef, sValorCot, sValIndice, sValorRegra, sValorReserva  : String;
     iIdHistorico, iIdCalculo  : Integer;
     bErro : Boolean;
     cAux : Char;
begin

   result := false;

   cAux := decimalseparator;


   qryreservaxplano.close;
   qryreservaxplano.ParamByName('IDPESSJUR').value:= iIdPessjur;
   qryreservaxplano.ParamByName('IDPESSOA').value:= iIdPessoa;
   qryreservaxplano.ParamByName('IDPLANOPREV').value:= iIdPlanoPrev;
   qryreservaxplano.ParamByName('IDCONTRIBUICAO').value:= iIdContribuicao;
   qryreservaxplano.open;

   while not qryreservaxplano.eof do
   begin

      if qryreservaxplano.fieldbyname('FLGRESERVAULTCOT').asstring = '0'
      then sDataRef := sDataPrevisao
      else if qryreservaxplano.fieldbyname('FLGRESERVAULTCOT').asstring = '2'
      then sDataRef := sDataRecebimento;

      decimalseparator := '.';

      dValIndice := VoltaValorCotacao(qryaux,
                                      qryreservaxplano.Fieldbyname('INDICEREAJUSTE').AsString,
                                      IntToStr(iIdPlanoPrev),qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString,
                                      sdataref);
      sValIndice := floattostr(dValIndice);

      if dValIndice <= 0 then
      begin
         decimalseparator := cAux;
         sErro := 'Valor do índice igual a zero. '+
                  'Reserva : ' + Copy(qryreservaxplano.fieldbyname('nome').AsString,1,60);
         exit;
      end;


      if qryreservaxplano.fieldbyname('IDREGRACALCULORE').AsString = ''
      then begin

         PercProd:=qryreservaxplano.FieldByName('PERCENTUAL').AsFloat/100;
         dValor := (StrToFloat(sValor)/dValIndice)*PercProd;
         sValorCot := FloatToStr(dValor);

      end
      else begin
         with qryReservaxPlano do
         begin
            sSQL := ' SELECT '''+ sDataRef                                                     +''' DATAREF,             '+
                             OraNumero(sValor)                                                 +'   VALORRECEBIDO,       '+
                             OraNumero(Fieldbyname('PERCENTUAL').AsString)                     +'   PERCENTUAL,          '+
                             ''''+sDataRef                                                     +''' DATARECEBIMENTO,     '+
                             ''''+Fieldbyname('INDICEREAJUSTE').AsString                       +''' INDICEREAJUSTE,      '+
                             OraNumero(sValIndice)                                             +'   VALORINDICE,         '+
                             OraNumero(Fieldbyname('IDPESSOA').AsString)                       +'   IDPESSOA,            '+
                             OraNumero(Fieldbyname('IDPESSJUR').AsString)                      +'   IDPESSJUR,           '+
                             OraNumero(Fieldbyname('IDPLANOPREV').AsString)                    +'   IDPLANOPREV,         '+
                             QuotedStr(sMesRef)                                                +'   MESREFERENCIA,       '+
                             OraNumero(qryHstContrib.Fieldbyname('IDPARCELAMENTO').AsString)   +'   IDPARCELAMENTO,      '+
                             OraNumero(qryHstContrib.Fieldbyname('PERCENTUALPARCELA').AsString)+'   PERCENTUALPARCELA,   '+
                             OraNumero(qryHstContrib.Fieldbyname('VLRDIVIDAPART').AsString)    +'   VLRDIVIDAPART ,      '+
                             OraNumero(qryHstContrib.Fieldbyname('VLRDIVIDAPATRO').AsString)   +'   VLRDIVIDAPATRO ,     '+
                             OraNumero('0')                                                    +'   SOMAVALORPARARATEIO, '+
                             OraNumero('0')                                                    +'   VALORMAXIMORATEIO,   '+
                             OraNumero('0')                                                    +'   VALORPARARATEIO,     '+
                             OraNumero(qryHstContrib.Fieldbyname('SALPARTICIPACAO').AsString)  +'   SALPARTICIPACAO ,    '+
                             OraNumero('0')                                                    +'   IDMOTIVO ,            '+
                             ' '''+qryHstContrib.Fieldbyname('DATAPREVISAORECE').AsString+'''   DATAPREVISAORECE ,    '+ 
                             OraNumero(qryHstContrib.Fieldbyname('VALORESPERADO').AsString)  +'   VALORESPERADO     '+ 
                    ' FROM DUAL ';                                                     end;

         sValorRegra := RegraNumerica(qryreservaxplano.fieldbyname('IDREGRACALCULORE').AsString,
                                      sSQL,bErro,iIdCalculo);

         if bErro then
         begin
           decimalseparator := cAux;
           sErro := 'Erro ao executar regra - Reserva : ' + Copy(qryreservaxplano.fieldbyname('nome').AsString,1,60)+
                    ' - Regra: '+qryreservaxplano.fieldbyname('IDREGRACALCULORE').AsString+' ';
           exit;
         end;

         if (sValorRegra = '') or (sValorRegra = '0') then
         begin
            decimalseparator := cAux;
            
            qryreservaxplano.next;
            continue;
         end;

         //o valor da regra já retorna em cotas
         sValorCot:=sValorRegra;

      end;


      //tratamento para reservas de valor negativo
      //entrada de valor negativo
      if (qryreservaxplano.FieldByName('VALORRESERVA').AsFloat < 0) and
         (strtofloat(sValorCot) < 0) then
         sValorReserva := FloatToStr(qryreservaxplano.FieldByName('VALORRESERVA').AsFloat + (-strtofloat(sValorCot)))

      //tratamento para reservas de valor negativo
      //entrada de valor positivo
      //e
      //tratamento para reservas de valor positivo
      //entrada de valor positivo
      else    sValorReserva := FloatToStr(qryreservaxplano.FieldByName('VALORRESERVA').AsFloat -strtofloat(sValorCot) );



      if not AlimentaHistorico(qryaux,
                  IntToStr(iidpessjur),
                  IntToStr(iidplanoprev),
                  qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString,
                  IntToStr(iidpessoa),
                  IntToStr(iSeqProposta),
                  sValorCot, //valor mov em cotas
                  sValorReserva,
                  '',
                  IntToStr(iIdcontribuicao),
                  IdEventoGerador,//idevento
                  Trim(qryreservaxplano.Fieldbyname('IDREGRACALCULORE').AsString),
                  sMesRef,
                  0,//flgentrada
                  strtodate(sDataRef),
                  false,
                  StrtoDate(sDataRef),
                  IntToStr(iIdpessoa),
                  iIdHistorico) then
      begin
         decimalseparator := cAux;
         sErro := 'Erro ao alimentar histórico - Reserva : ' + Copy(qryreservaxplano.fieldbyname('nome').AsString,1,60);
         exit;
      end;


      //atualiza reservapart
      qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.add(' UPDATE RESERVAPART SET VALORRESERVA = '+oranumero(sValorReserva)+'  ,'+
                     ' DATAREFERENCIASA = SYSDATE '+
                     ' WHERE (IDPLANOPREV = '''+IntToStr(iIdplanoprev)+''') '+
                     ' AND (IDTIPORESERVA = '''+qryreservaxplano.fieldbyname('IDTIPORESERVA').AsString+''') '+
                     ' AND (IDPESSJUR = '''+IntToStr(iIdPessjur)+''') '+
                     ' AND (IDPESSOA = '''+IntToStr(iIdpessoa)+''') '+
                     ' AND (SEQPROPOSTA = '''+IntToStr(iSeqProposta)+''' ) ');
      try
         qryaux.Execsql;
      except
         decimalseparator := cAux;
         sErro := 'Erro ao atualizar saldo - Reserva : ' + Copy(qryreservaxplano.fieldbyname('nome').AsString,1,60);
         Exit;
      end;

      qryreservaxplano.next;
   end;

   decimalseparator := cAux;

   Result := true;
end;

procedure TfrmDevolveContribuicoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlDocumento );  
  FreeAndNil( CtrlLancamento ); 

  inherited;

end;

//BRUNO AZEVEDO SOL 130119 KINTANA 789646
procedure TfrmDevolveContribuicoes.qryHstContribCalcFields(
  DataSet: TDataSet);
var
  iAnoAtual, iMesAtual, iUltDia, iUltDiaAtual: Integer;
  sValorRecebido: String;
begin
  iAnoAtual := StrToInt(Copy(qryHstContrib.FieldByName('MESREFERENCIA').AsString,1,4));
  iMesAtual := StrToInt(Copy(qryHstContrib.FieldByName('MESREFERENCIA').AsString,6,2));

  if (iMesAtual = DiasUteis.ExtraiMes(StrToDate(sDataFinal))) or (iMesAtual = 13) then begin
    try
      iUltDia   := DiasUteis.ExtraiDia(StrToDate(sDataFinal));
    except
      iUltDia   := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAnoAtual,iMesAtual));
    end;

    //13º 181 DIAS
    if (iMesAtual = 13) then begin
      iUltDiaAtual := 181;
    end else begin
      iUltDiaAtual := DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAnoAtual,iMesAtual));
    end;

    try
      qryHstContrib.FieldByName('ValorDevolver').AsFloat := (qryHstContrib.FieldByName('ValorRecebido').AsFloat - StrToFloat(FloatToStrF((qryHstContrib.FieldByName('ValorRecebido').AsFloat * iUltDia)/ iUltDiaAtual, FFFixed, 10,2)));
    except
      qryHstContrib.FieldByName('ValorDevolver').AsFloat := 0;
    end;
  end else begin
    qryHstContrib.FieldByName('ValorDevolver').AsFloat := qryHstContrib.FieldByName('ValorRecebido').AsFloat;
  end;
end;
//BRUNO AZEVEDO SOL 130119 KINTANA 789646

end.
