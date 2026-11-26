// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SIG.....: 68133
Data.......: 09/05/2018
Responsável: Darivaldo Alencar
Descrição..: Validar se existe perfil de investimento cadastrado
//------------------------------------------------------------------------------
Alteração  : (.dfm qryBeneficiarios) sbtnAlteraDataClick, GeraDemonstrativo
Nº SIG.....: 55933
Data.......: 02/10/2017
Responsável: Edilaine Ferraresi
Descrição..: Inclusão do perfil de investimento
//------------------------------------------------------------------------------
Alteração  : sbtnAlteraDataClick
SIG        : 53667
Data       : 05/09/2017
Responsável: André Imakawa
Descrição..: A rotina está alterando indevidamente a situação do participante
             junto a patrocinadora (idsitfunc  - elegpatro) e do participante no
             plano e a do plano (idsitpart/idsitplanprev - partprevplan)
{-------------------------------------------------------------------------------
Alteração  : GeraDemonstrativo
Nº SOL.....: 253577-18174
KTN / PPM  : 1327585
Data       : 31/03/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento do Deficit - gravação de demonstrativos
{-------------------------------------------------------------------------------
Alteração  : (.dfm) montaselect, PreencheDadosTitular,
Nº SOL.....: 253577-18151
KTN / PPM  : 1318910
Data       : 21/03/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - reabertura/renovacao
{-------------------------------------------------------------------------------
Alteração  : Gerademonstrativo, sbtnAlteraDataClick
Nº SOL.....: 253577-17570
KTN / PPM  : 989569
Data       : 15/09/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - reabertura/renovacao
--------------------------------------------------------------------------------}
// Autor(a)    : Daniel Begnami
// Data        : 01/09/2009
// Rotina      : QryTitular
// Pendência   : SOL: 123515 - 620601
// Descricao   : Erro na query do Titular, ocorrendo erro de Faltra de Expressão
//               quando na atualização da tabela ELEGPATRO.
//------------------------------------------------------------------------------
// Autor(a)  :  BRUNO AZEVEDO
// Data      :  30/07/2010
// Pendência :  SOL 140428 KINTANA 885095
// Descricao :  Alteração na query do monta select.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 137519 KINTANA 831220
//Responsável : BRUNO AZEVEDO
//Data        : 16/06/2010
//Descrição   : Ajuste no controle de transação ao fechar a tela.
//--------------------------------------------------------------------------------------------------
// Autor(a)  :  Daniel Begnami
// Data      :  06/10/2009
// Pendência :  SOL 124279 629988
// Descricao :  Fechar a seção com RollBack no evento on-close do formulario, caso a seção esteja aberta.
// --------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/08/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Augusto
// Data        : 25/05/2007
// Pendencia   : 25415
// Descrição   : Atualizar FLGCOBRA independente do tipo de revisão 
// -----------------------------------------------------------------------------
// Rotina      : QryBeneficiarios
// Autor(a)    : Augusto
// Data        : 11/04/2007
// Pendencia   : 25037
// Descrição   : Incluir Join com IDPESSJUR da BFCIARIOTITPLANcom a PARTPREVPLAN
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Augusto
// Data        : 15/03/2007 - 22/03/2007
// Pendencia   : 24729
// Descrição   : Acerto na volta da situação quando encerrado pela folha
// -----------------------------------------------------------------------------
// Rotina      : AtualizaContribuicoes
// Autor(a)    : Augusto
// Data        : 18/01/2007
// Pendencia   : 24239
// Descrição   : Acerto na pesquisa das contribuições a acertar
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Paulo Ramos
// Data        : 22/09/2006
// Pendencia   : 23180 (reabertura)
// Descrição   : Criei nova consulta que não verifique o historico
//               apenas a associação de contribuicao ao evento.
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Gleyber
// Data        : 28/08/2006
// Pendencia   : 23180
// Descrição   : Alteração para cobrar somente se houver contribuições associadas
//               ao evento.
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Augusto
// Data        : 20/06/2006
// Pendencia   : 22606
// Descrição   : Atualizar o SITPROCESSO na PROCESSOBENEF com o mesmo valor do SITBENEFICIO na BENEFBFCIARIO
// -----------------------------------------------------------------------------
// Rotina      : QryBeneficiarios
// Autor(a)    : Augusto
// Data        : 17/01/2006
// Pendencia   : 21249
// Descrição   : Não filtrar os beneifcios do INSS, pois a rotina processa os dois
//               beneficios. Mesmo o de referencia.
//               Processar os beneficios independentemente.
// -----------------------------------------------------------------------------
// Rotina      : QryBeneficiarios
// Autor(a)    : Augusto
// Data        : 09/09/2005
// Pendencia   : 20116
// Descrição   : 1) Filtro para não trazer os beneficios do INSS quando a fundação
//                  não paga INSS.
//               2) Sempre gravar a DATAVOLTA na EVENTOSPREV, pois caso esteja renovando é
//                  sinal de que a data provavel de volta mudou.
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Bruno Bastos
// Data        : 10/06/2005
// Pendencia   : 19451
// Descrição   : Retirei do update na PartPrevPlan a atualização do campo SalAuxDoenca.
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Augusto
// Data        : 10/06/2005
// Pendencia   : 19415
// Descrição   : Acerto nos estados das contribuições depois da renova
//------------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Augusto
// Data        : 03/11/2004
// Pendencia   : 17817
// Descrição   : Caso Renovação, somente cobrar contribuição com FLGCOBRA marcado. 
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick, MostraDemonstrativoConcessaoBeneficiario
// Autor(a)    : Augusto
// Data        : 03/11/2004
// Descrição   : Troca da Query qryResultadoHST pela qryResultado retirando erro no demonstrativo.
// Autor(a)    : Leo
// Data        : 07/10/2004
// Descrição   : troca do uso da variável iIdPlanoPrev pelo idplanoprev do beneficiário
//               para atender casos em que o beneficiário foi migrado e não o participante
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Leo
// Data        : 07/10/2004
// Descrição   : volta da datafinal para nulo na BENEFBFCIARIO
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Augusto
// Data        : 30/09/2004
// Pendencia   : 17817
// Descrição   : Novos filtros para pesquisar contribuicoes a preparar
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick, MostraDemonstrativoConcessaoParticipante e
//               MostraDemonstrativoConcessaoBeneficiario
// Autor(a)    : Gleyber
// Data        : 09/07/2004
// Pendencia   : 17183
// Descrição   : Inclusão da rotina para tratamento diferenciado para participante
//               e beneficiário.
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Camille
// Data        : 24.05.2004
// Pendencia   : 16812
// Descrição   : Alterar data de inicio da contrib. se a data do beneficio foi
//               alterada
// -----------------------------------------------------------------------------
// Rotina      : qryBeneficiarios
// Autor(a)    : Gleyber
// Data        : 21/01/2004
// Pendencia   : 15981
// Descrição   : Alteração na query de beneficiários.
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Gleyber
// Data        : 20/01/2004
// Pendencia   : 15960
// Descrição   : Incluindo filtro para trabalhar apenas com o dependente selecionado
//               quando esta opção for escolhida.
// -----------------------------------------------------------------------------
// Rotina      : sbtnAlteraDataClick
// Autor(a)    : Gleyber
// Data        : 18/12/2003
// Pendencia   : 15829
// Descrição   : Desabilitado o bbtnConfirmar durante a operação de renovação.
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 09.12.2003
// Pendencia   : 15723
// Descrição   : A GeraSalarioRetroativo estava sendo chamada duas vezes (para supl
//               e INSS)
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 03.12.2003
// Descrição   : Tratamento de Dependentes Cancelados
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 17.09.2003
// Pendência   : 14977
// Alteração   : Atualizar flgsalvirtbenef para 1
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 28.07.2003
// Pendência   : 14657
// Alteração   : Criação do campo FLGTPBUSCAVALOR que indica se o valor integral
//               do beneficio deve ser buscado da benefbfciario (0) ou da
//               hstbenefbfciario(1) na rotina de retencao/encerramento
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : sbtnAlteraDataClick(Sender: TObject);
// Autor(a)  : Gleyber
// Data      : 18/12/2002
// Alteração : Verifica a previa também com a MesReferencia
// -----------------------------------------------------------------------------
// Rotina    : sbtnAlteraDataClick(Sender: TObject);
// Autor(a)  : Camille
// Data      : 12.11.2002
// Alteração : Alteração no controle de se volta a situação ou não
// -----------------------------------------------------------------------------
// Rotina    : sbtnAlteraDataClick
// Autor(a)  : Gleyber
// Data      : 11/11/2002
// Alteração : Altera situação do participante na RENOVA
// -----------------------------------------------------------------------------
// Rotina    : sbtnAlteraDataClick
// Autor(a)  : Carlos Guedes
// Data      : 12/09/2002
// Alteração : voltei alteração do dia 12/09 -  "bVoltaSituacao"
// -----------------------------------------------------------------------------
// Rotina    : sbtnAlteraDataClick
// Autor(a)  : Carlos Guedes
// Data      : 12/09/2002
// Alteração : Havia uma crítica para executar a função que retirei "bVoltaSituacao"
// -----------------------------------------------------------------------------
// Rotina    : CriaLogOcorrencia
// Autor(a)  : Camille
// Data      : 13.08.2002
// Alteração : Gravação do Lote da Movimentacao de Beneficio
// -----------------------------------------------------------------------------
// Rotina      : AtualizaDataFinalContribP (nova)
// Autor(a)    : Carlos Guedes
// Data        : 12/07/2002
// Alteração   : No caso de uma prorrogação o campo DATAFINAL na CONTRIBPREVPARTP
//  deve ser atualizado também. 
//------------------------------------------------------------------------------

unit FReaberturaBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, Db, DBTables,
  Wwquery, Mask, wwdbedit, Wwdatsrc, MontaSelect, Menus, DBCtrls, FCmReport, ppReport;

type
  TfrmReaberturaBeneficio = class(TfrmOkCancelar)
    pnlRevisao: TPanel;
    pnlBeneficios: TPanel;
    qryProcesso: TwwQuery;
    dsProcesso: TwwDataSource;
    qryBeneficiarios: TwwQuery;
    dsBeneficiarios: TwwDataSource;
    MontaSelectOLD: TMontaSelect;
    qryTitular: TwwQuery;
    qryAux: TwwQuery;
    dbgrdBeneficiarios: TwwDBGrid;
    qryContrib: TwwQuery;
    qryContaBancaria: TwwQuery;
    qryResultado: TwwQuery;
    qryLogOcorrencia: TwwQuery;
    qryResultadoHst: TwwQuery;
    MontaSelect: TMontaSelect;
    Panel1: TPanel;
    pnlTitular: TPanel;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    pnlBotaoProcurar: TPanel;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    sbtnAlteraData: TSpeedButton;
    Panel2: TPanel;
    dsTitular: TwwDataSource;
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
    iIdPessoa,        // edilaine - SOL 253577-18151 / PPM 1318910
    iIdPessJur,
    iIdPlanoPrev,
    iSeqProposta               : longint;

    sTipoReabertura,
    sReabProrrog               : string;

    // Dados da tela de informacoes do novo beneficiario
    sNovaDataInicio,
    sDataInicioOriginal,
    sNumProcINSS,             sDtRequerimento,
    sDtInicioINSS,            sDtInicioFund,            sDataInicio,
    sDataFinal,               sVlrInfINSS,              sIdTpPagtoBenefic,
    sCodPortForma : string;

    // Dados globais
    sNovaDataFinal,
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

    bRecalculaValor : boolean;

    iFlgDataPrevista,
    iFlgIncluiMesConc : integer;

    bRenovaTodos      : boolean;  

    iIdBeneficiario   : Integer;  
    bBenefEhTit       : boolean;  

    sDataHoraInicioProcesso : string;  // edilaine - SOL 253577-17570 / PPM 989569

    bTemPerfilInvest  : boolean; //Darivaloo Alencar SIG68133

    procedure LimpaTela;
    procedure SelecionaProcesso(piNumeroProcesso : longInt);
    procedure PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
    procedure MostraDemonstrativoConcessaoParticipante;
    procedure MostraDemonstrativoConcessaoBeneficiario;
    Function AtualizaDataFinalContribP: Boolean;
    Function AtualizaContribuicoes: Boolean;

    procedure GeraDemonstrativo(sDataHoraInicioProcesso : string;            // edilaine - SOL 253577-17570 / PPM 989569
                                sStatusDemonstrativo : string = '' );        // edilaine - SOL 253577-18174 / PPM 1327585
  public
    { Public declarations }
  end;

var
  frmReaberturaBeneficio: TfrmReaberturaBeneficio;

implementation

uses UParticipante,     UMensErro,  FAguarde,      UBeneficio,
     UAdmPrev,          DBaseDados, {FReabNovaData,} FDevolveContribuicoes,
     DAPrev,            UDataBase,  UEventos,      FSelecionaLote,
     RDemonstraBeneficios, FPreview,  // edilaine - SOL 253577-17570 / PPM 989569
     FReaberturaData,                 // edilaine - SOL 253577-18151 / PPM 1318910
     UContribuicaoPrev, FMostraAux, USistema,      UFuncoesUteis;

{$R *.DFM}
// ********************************************************************
// ********* ROTINAS AUXILIARES
// ********************************************************************

procedure TfrmReaberturaBeneficio.LimpaTela;
begin
   iNumeroProcesso := -1;
   SelecionaProcesso(-1);
   PreencheDadosTitular(-1, -1, -1, -1);
end; // LimpaTela

procedure TfrmReaberturaBeneficio.SelecionaProcesso(piNumeroProcesso : longInt);
begin
  qryProcesso.Close;
  qryProcesso.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryProcesso.Open;


  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := piNumeroProcesso;
  qryBeneficiarios.Open;

  sDataInicioOriginal := qryBeneficiarios.FieldByName('DataInicio').AsString;


  iIdLoteConcessao := -1;

end; // SelecionaProcesso

procedure TfrmReaberturaBeneficio.PreencheDadosTitular(piIdTitular, piIdPessJur, piIdPlanoPrev, piSeqProposta : longInt);
var
    sMesRef,
    sIdTpPagtoAnt,
    sValorSalario,
    sValorReserva : string;
begin
  qryTitular.Close;
  qryTitular.ParamByName('IdPessoa').Value    := piIdTitular;
  qryTitular.ParamByName('IdPessJur').Value   := piIdPessJur;
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
  // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
  {sValorReserva := CalcReservaPart( piIdPessJur, piIdPlanoPrev, piIdTitular, -1,
                                    piSeqProposta , DateToStr(date), DateToStr(date),
                                    '','',
                                    '-1' , qryAux);

  sMesRef        := Copy(DateToStr(date),7,4)+'/'+Copy(DateToSTr(date),4,2);
  sValorSalario  := CalcSALPART(piIdPessJur, piIdTitular,sMesRef,qryAux);
  sTipoSitFunc   := qryTitular.FieldbyName('TipoSit').AsString;
  }// edilaine - SOL 253577-18151 / PPM 1318910 - fim

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


// ********************************************************************
// ********* ROTINAS DO FORM
// ********************************************************************
procedure TfrmReaberturaBeneficio.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then
  begin
     iNumeroProcesso := StrToInt(MontaSelect.ValoresChave[0]);
     iIdTitular      := StrToInt(MontaSelect.ValoresChave[1]);
     iSeqProposta    := StrToInt(MontaSelect.ValoresChave[2]);
     iIdPessJur      := StrToInt(MontaSelect.ValoresChave[3]);
     iIdPlanoPrev    := StrToInt(MontaSelect.ValoresChave[4]);
     iIdPessoa       := StrToInt(MontaSelect.ValoresChave[7]);          // edilaine - SOL 253577-18151 / PPM 1318910

     SelecionaProcesso(iNumeroProcesso);
     PreencheDadosTitular(iIdTitular, iIdPessJur, iIdPlanoPrev, iSeqProposta);
     sTipoReabertura := '  ';
     sReabProrrog := '';
     sbtnAlteraData.Enabled := True;
     bbtnConfirmar.Enabled  := False;
     bbtnCancelar.Enabled   := False;
  end
  else sbtnAlteraData.Enabled := False;
end;

procedure TfrmReaberturaBeneficio.FormShow(Sender: TObject);
begin
  inherited;
  LimpaTela;
  bbtnConfirmar.Enabled  := False;
  bbtnCancelar.Enabled   := False;
  sbtnAlteraData.Enabled := False;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  
end;

procedure TfrmReaberturaBeneficio.dbgrdDemonstrativoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
//  if not qryHstBenefPagos.Active then Exit;

{  if qryHstBenefPagos.FieldByName('FlgDevolucao').AsInteger = 1
  then AFont.Color := clRed
  else AFont.Color := clWindowText;
  }
end;

procedure TfrmReaberturaBeneficio.sbtnAlteraDataClick(Sender: TObject);
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
    bVoltaSituacao  : Boolean;

    rValorAtualizado,
    rValorIntegral,
    dValorsRB    : double;


    iTipoDevolucao,
    iTipoMovimento : integer;

    iIdPessoaAtual, 
    iIdEventoAnterior,
    iUltDiaMesLote,
    iIdSitPart        : longint;
    sSalarioIntegral,
    sSalarioContribuicao,
    sDataFinalSalario,
    sNovaDataInicioAux : string;
    bPodeRenovar       : boolean;
    sMotivo,
    sDataInicioAnt     : string;

    sAnoMesReferencia  : String;  

    sIdEventosPrev, sIdSitBeneficiosAtualizar : string;  

    bNaoPossuiContribuicao  : Boolean;

    sTabelaContribuicao : string;      // edilaine - SOL 253577-18151 / PPM 1318910
begin
  inherited;

  // edilaine - SOL 253577-17570 / PPM 989569 - inicio
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' select to_char(sysdate,''dd/mm/yyyy hh24:mi'') AS datenow from dual ');
  qryAux.Open;
  sDataHoraInicioProcesso := qryAux.fieldByName('datenow').AsString;
  // edilaine - SOL 253577-17570 / PPM 989569 - fim


  bRenovaTodos := True; 

  iIdCalculoGeral    := 0;
  iIdLoteConcessao   := -1;                  // edilaine - SOL 253577-18151 / PPM 1318910

  // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
  {if qryBeneficiarios.FieldByName('IDTITULAR').AsString <> qryBeneficiarios.FieldbyName('IDPESSOA').AsString
  then begin
     if MsgDlg('Este benefício é pago para BENEFICIÁRIOS. Deseja renová-lo para todos os beneficiários ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo
     then bRenovaTodos := False;

     if (not bRenovaTodos) and (qryBeneficiarios.FieldByName('DATACANCELA').AsString <> '')
     then begin
        MsgDlg('O beneficiário selecionado está CANCELADO. Verifique.','Erro', mtError, [mbOK],0);
        Exit;
     end;

     bBenefEhTit :=  ( (Not bRenovaTodos) and
                       (qryBeneficiarios.FieldByName('IDTITULAR').AsString = qryBeneficiarios.FieldbyName('IDPESSOA').AsString) );
  end
  else Begin }
    bRenovaTodos := True;
    bBenefEhTit  := ( (qryBeneficiarios.RecordCount = 1) and
                      (qryBeneficiarios.FieldByName('IDTITULAR').AsString = qryBeneficiarios.FieldbyName('IDPESSOA').AsString) );
 // End;   // edilaine - SOL 253577-18151 / PPM 1318910 - fim

  bbtnConfirmar.Enabled := False;

  If Not bRenovaTodos
   Then Begin
    qryBeneficiarios.Filter := 'IDPESSOA = '+qryBeneficiarios.FieldbyName('IDPESSOA').AsString;
    qryBeneficiarios.Filtered := True;

    iIdBeneficiario         := qryBeneficiarios.FieldByName('IDPESSOA').AsInteger; 
   End;

  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.RollBack;

  dtmBaseDados.dbBaseDados.StartTransaction;

  sTipoReabertura := '  ';
  sReabProrrog := 'Renovação / Reabertura';

  // edilaine - SOL 253577-18151 / PPM 1318910 - comentado inicio
  {frmReabNovaData := TfrmReabNovaData.Create(Application);

  with frmReabNovaData do
  begin
     iFlgDataPrevista         := qryBeneficiarios.FieldByName('FlgDataPrevista').AsInteger;
     edDtInicioAntes.Text     := qryBeneficiarios.FieldByName('DataInicio').AsString;
     dtInicio.Text            := qryBeneficiarios.FieldByName('DataInicio').AsString;
     dtFinal.Text             := '';
     rgrpReabertura.Visible   := True;
     rgrpReabertura.itemIndex := 1;
     lblDtInicio.Enabled      := True;
     dtInicio.Enabled         := True;
     rgrpDataPrevEfet.Enabled := True;
     rgrpEncerramento.Visible := False;
     dbcbMotivore.Visible     := False;
     grbMatricula.Visible     := False;
     Height                   := 390;
     if iFlgDataPrevista = 1
     then begin
        edDtFinalAntes.Text        := qryBeneficiarios.FieldByName('DataFinalPrevista').AsString;
        rgrpDataPrevEfet.ItemIndex := 0;
     end
     else begin
        edDtFinalAntes.Text        := qryBeneficiarios.FieldByName('DataFinal').AsString;
        rgrpDataPrevEfet.ItemIndex := 1;
     end;


     sDataFinalAnt := edDtFinalAntes.Text;

     Caption := 'Datas para Reabertura de Benefício';
     mrNovaData := ShowModal;

     sNovaDataInicio := Trim(dtInicio.Text);
     sNovaDataFinal  := Trim(dtFinal.Text);

     if rgrpDataPrevEfet.ItemIndex = 0
     then iFlgDataPrevista := 1
     else iFlgDataPrevista := 0;

     // Verificar se é renovacao,  reabertura ou prorrogação
     case rgrpReabertura.ItemIndex of
     0 : begin
            if (Trim(frmReabNovaData.edDtFinalAntes.Text) <> '') and
               (StrToDate(frmReabNovaData.edDtFinalAntes.Text) >= date)
            then begin
               sTipoReabertura := 'PR';  // PRORROGACAO
               sReabProrrog := 'Prorrogação';
            end
            else begin
               sTipoReabertura := 'RN';  // RENOVACAO
               sReabProrrog := 'Renovação';
            end;
         end;
     1 : begin
            sTipoReabertura := 'RB';  // REABERTURA
            sReabProrrog := 'Reabertura';
         end;
     end;
  end;
  if (mrNovaData = mrCancel) or (not frmReabNovaData.bDatasOK)
  then begin
     frmReabNovaData.Free;
     Exit;
  end;
  frmReabNovaData.Free;
  }// edilaine - SOL 253577-18151 / PPM 1318910 - comentado fim


  // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
  try
    frmReaberturaData := TfrmReaberturaData.Create(Application);
    with frmReaberturaData do
    begin
       edDtInicioAntes.Text := qryBeneficiarios.FieldByName('DATAINICIOFUND').AsString;
       dtInicio.Text        := qryBeneficiarios.FieldByName('DATAINICIOFUND').AsString;
       edDtFinalAntes.Text  := qryBeneficiarios.FieldByName('DataFinal').AsString;
       dtFinal.Text         := '';
       dtReabre.date        := date;
       Width                := 600;
       AjustaTela( IntToStr(iNumeroProcesso), qryBeneficiarios.FieldByName('FONTEPAGADORA').AsInteger = 1 );

       sDataFinalAnt := edDtFinalAntes.Text;

       Caption := 'Datas para Reabertura de Benefício';
       mrNovaData := ShowModal;

       sNovaDataInicio := Trim(dtReabre.Text);
       sNovaDataFinal  := Trim(dtFinal.Text);

       iFlgDataPrevista := 0;
       sTipoReabertura := 'RB';  // REABERTURA: RB - RENOVACAO: RN
       sReabProrrog := 'Reabertura';
    end;
  finally
     frmReaberturaData.Free;
  end;

  if (mrNovaData = mrCancel) 
  then begin
     Exit;
  end;

  {recarrega dados que foram atualizados}
  qryBeneficiarios.Close;
  qryBeneficiarios.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
  qryBeneficiarios.Open;
  // edilaine - SOL 253577-18151 / PPM 1318910 - fim

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

  // Se for uma prorrogacao
  // Entao sair, pois basta trocar a data final
  // Senao Se for uma renovacao
  //       Entao pagar benefício desde esta data sem recalcular
  //       Senao pagar beneficio desde esta data, porém recalculando
  if sTipoReabertura <> 'PR'
  then begin
     if iIdLoteConcessao <= 0
     then begin
        iIdLoteConcessao := SelecionaLoteBeneficioAberto( sAnoMesPagamento, iFlgIncluiMesConc );

        if iIdLoteConcessao <= 0
        then begin
           bErro := True;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Nenhum lote selecinado para efetuar a '+sReabProrrog+'. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
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
        sAnoMesReferencia:= FieldByName('MESREFERENCIA').AsString;
     end;
  end
  else begin
     sDataFolha       := DateToStr(date);
     sAnoMesPagamento := Copy(sDataFolha, 7,4)+'/'+Copy(sDataFolha, 4,2);
     sAnoMesReferencia:= Copy(sDataFolha, 7,4)+'/'+Copy(sDataFolha, 4,2);
  end;

  // Verificar se folha já processou este benefício, ou se benefício está na prévia.
  frmAguarde.Mostra('Verificando Folha Mensal ...');
  bPodeRenovar := True;
  qryBeneficiarios.First;
  sMotivo := '';
  while not qryBeneficiarios.Eof do
  begin
     if BenefExistePREVIA ( qryAux,
                            qryBeneficiarios.FieldByName('IDPESSJUR').AsInteger,
                            qryBeneficiarios.FieldByName('IDTITULAR').AsInteger,
                            qryBeneficiarios.FieldByName('IDPLANOPREV').AsInteger,
                            -1,
                            qryBeneficiarios.FieldByName('NUMEROPROCESSO').AsInteger,
                            qryBeneficiarios.FieldByName('IDBENEFICIO').AsInteger,
                            qryBeneficiarios.FieldByName('IDPESSOA').AsInteger,
                            qryBeneficiarios.FieldByName('SEQPROPOSTA').AsInteger,
                            sAnoMesPagamento,
                            sAnoMesReferencia)
     then begin
        bPodeRenovar := False;
        sMotivo      := ' Este Benefício já foi processado pela Prévia da Folha de Benefícios do mês '+Copy(sAnoMesPagamento,6,2)+'/'+Copy(sAnoMesPagamento,1,4)+'.'+#13+
                        ' Favor entrar em contato com o setor de Pagamento de Benefício para desbloquear o benefício. ';
        break;
     end;

     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT COUNT(*) AS TOTAL                               '+
                ' FROM   HSTBENEFBFCIARIO                                '+
                ' WHERE  IDPESSOA        = '+qryBeneficiarios.FieldByName('IDPESSOA').AsString+
                ' AND    MESREFERENCIA   = '''+sAnoMesPagamento+''''+
                ' AND    IDBENEFICIO     = '+qryBeneficiarios.FieldByName('IDBENEFICIO').AsString+
                ' AND    NUMEROPROCESSO  = '+qryBeneficiarios.FieldByName('NUMEROPROCESSO').AsString);
        Open;

        if FieldByName('TOTAL').AsInteger > 0
        then begin
           bPodeRenovar := False;
           sMotivo      := ' Este Benefício já foi calculado para o mês '+Copy(sAnoMesPagamento,6,2)+'/'+Copy(sAnoMesPagamento,1,4)+'.'+#13+
                           ' Favor entrar em contato com o setor de Pagamento de Benefício para desbloquear o benefício. ';
           break;
        end;
     end;
     qryBeneficiarios.Next;
  end;
  frmAguarde.Apaga;
  if not bPodeRenovar
  then begin
     bErro := True;
     MsgDlg('Operação NÃO Permitida. Motivo : '+sMotivo+' Verifique.','Informação',mtInformation,[mbOk],0);
     dtmBaseDados.dbBaseDados.RollBack;
     Exit;
  end;

  // **********************************************************************
  //                         Recalcular Benefícios
  // **********************************************************************
  // Se for renovacao ou prorrogacao, nao precisa recalcular o beneficio
  // Senao, se for reabertura, entao recalcular o beneficio
  if sTipoReabertura = 'PR'
  then begin
     iTipoMovimento  := 2; // Prorrogacao
     bRecalculaValor := False;
  end
  else if sTipoReabertura = 'RN'
       then begin
          iTipoMovimento  := 0;  // Renovacao
          bRecalculaValor := True;
       end
       else begin
          iTipoMovimento  := 1; // Reabertura
          bRecalculaValor := True;
       end;

  iIdPessoaAtual := qryBeneficiarios.FieldByName('IDPESSOA').AsInteger;

  qryBeneficiarios.First;
  while not qryBeneficiarios.Eof do
  begin
     // Se for beneficio de pagamento único, entao ir para próximo
     if BeneficioDePagamentoUnico ( qryBeneficiarios.FieldbyName('IDBENEFICIO').AsInteger )
     then begin
        qryBeneficiarios.Next;
        continue
     end;

     // Se for para renovar para apenas um beneficiario e a query estiver posicionada em
     // outro, entao ir para proximo
     if (not bRenovaTodos) and (qryBeneficiarios.FieldByName('IDPESSOA').AsString <> IntToStr(iIdPessoaAtual))
     then begin
        qryBeneficiarios.Next;
        continue
     end;

     if qryBeneficiarios.FieldByName('DATACANCELA').AsString <> ''
     then begin
        qryBeneficiarios.Next;
        continue;
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

     With qryAux Do
     Begin
       Sql.Clear;
       Sql.Add(
         ' SELECT DECODE(FLGDATAPREVISTA,1,DATAFINALPREVISTA,DATAFINAL) AS DATAFINAL '+
         ' FROM BENEFBFCIARIO  '+
         ' WHERE NUMEROPROCESSO = '+qryBeneficiarios.FieldByName('numeroprocesso').AsString+
         '   AND IDBENEFICIO = ' +qryBeneficiarios.FieldByName('IDBENEFICIO').AsString );

       If Not bRenovaTodos
        Then Sql.Add('   AND IDPESSOA = '+qryBeneficiarios.FieldbyName('IDPESSOA').AsString);

       Open;
       sDataFinalAnt := FieldByName('DATAFINAL').AsString;
       Close;
     End;

     sSQL := ' UPDATE BENEFBFCIARIO SET FLGDATAPREVISTA = '+IntToStr(iFlgDataPrevista);

     if (iFlgDataPrevista = 1) and (Trim(sNovaDataFinal) <> '')
     then begin
        sSQL := sSQL + ', DATAFINAL         = NULL, DATAFINALPREVISTA = TO_DATE('''+sNovaDataFinal+''', ''DD/MM/YYYY'') ';
     end
     else if  (iFlgDataPrevista = 0) and (Trim(sNovaDataFinal) = '') then
     begin
         sSQL := sSQL + ', DATAFINAL         = NULL ';
     end
     else if (Trim(sNovaDataFinal) <> '') Then begin
        sSQL := sSQL + ', DATAFINALPREVISTA = NULL, DATAFINAL         = TO_DATE('''+sNovaDataFinal+''', ''DD/MM/YYYY'') ';
     end;

     // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
     {if sTipoReabertura = 'RB'
     then begin
        sSQL := sSQL + ', DATAINICIO   = TO_DATE('''+sNovaDataInicio+''', ''DD/MM/YYYY'') ';
     end;
     }// edilaine - SOL 253577-18151 / PPM 1318910 - fim

     if (
          (Trim(sNovaDataFinal) <> '') and
          (Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2) <= sAnoMesPagamento)
        )
     then begin
        if (Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2) = sAnoMesPagamento)
        then begin
           if iFlgIncluiMesConc = 0
           then begin
              sSQL := sSQL + ', IDSITBENEFICIO = 1 ';
              bVoltaSituacao := False; 

              sIdSitBeneficiosAtualizar := '1';

           end
           else begin
              if iFlgDataPrevista = 1
              then begin
                 sSQL := sSQL + ', IDSITBENEFICIO = 2 ';
                 bVoltaSituacao := False; 
                 sIdSitBeneficiosAtualizar := '2';
              end
              else begin
                 sSQL := sSQL + ', IDSITBENEFICIO = 3 ';
                 bVoltaSituacao := True;
                 sIdSitBeneficiosAtualizar := '3';
              end;
           end
        end
        else if iFlgDataPrevista = 1
             then begin
                sSQL := sSQL + ', IDSITBENEFICIO = 2 ';
                sIdSitBeneficiosAtualizar := '2';
             end
             else begin
                sSQL := sSQL + ', IDSITBENEFICIO = 3 ';
                bVoltaSituacao := True;
                sIdSitBeneficiosAtualizar := '3';
             end;
     end
     else begin
        sSQL := sSQL + ', IDSITBENEFICIO = 1 ';
        sIdSitBeneficiosAtualizar := '1';
        bVoltaSituacao := False;
     end;

     // Atualizar todos os benefícios da pessoa do processo que não sejam de pagamento único
     // Se o processo for do titular, atualizará todos do participante

     sSQL := sSQL +' WHERE NUMEROPROCESSO = '+ IntToStr(iNumeroProcesso)+
                   ' AND   IDPESSOA       = '+ qryBeneficiarios.FieldByName('IDPESSOA').AsString+
                   ' AND   IDBENEFICIO NOT IN ( SELECT B.IDBENEFICIO                             '+
                   '                            FROM   BENEFICIO B, TPPAGTOBENEFICIO T           '+
                   '                            WHERE  T.FLGFREQUENCIA = ''U''                   '+
                   '                            AND    B.IDTPPAGTOBENEFIC = T.IDTPPAGTOBENEFIC)  '+
                   '  AND IDBENEFICIO = ' +qryBeneficiarios.FieldByName('IDBENEFICIO').AsString  ;


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


     { Atualizar situação do processo na PROCESSOBENEF }
     sSQL := 'UPDATE PROCESSOBENEF SET IDSITPROCESSO = '+ sIdSitBeneficiosAtualizar + '  ' +
             'WHERE NUMEROPROCESSO = '+ IntToStr( iNumeroProcesso) ;

     If Not ExecutarQuery( QryAux, sSQL ) Then Begin

        frmAguarde.Apaga;
        MsgDlg('Erro ao atualizar situação do processo.', 'Erro', mtError, [mbOK],0);
        dtmBaseDados.dbBaseDados.RollBack;
        Exit;

     End;


     with qryLogOcorrencia do
     begin
        Close;
        ParamByName('IDPESSJUR').AsInteger      := qryBeneficiarios.FieldByName('IDPESSJUR').AsInteger;
        ParamByName('IDPLANOPREV').AsInteger    := qryBeneficiarios.FieldByName('IDPLANOPREV').AsInteger;
        ParamByName('IDPLANOORIGEM').AsInteger  := qryBeneficiarios.FieldByName('IDPLANOORIGEM').AsInteger;
        ParamByName('IDTITULAR').AsInteger      := qryBeneficiarios.FieldByName('IDTITULAR').AsInteger;
        ParamByName('SEQPROPOSTA').AsInteger    := qryBeneficiarios.FieldByName('SEQPROPOSTA').AsInteger;
        ParamByName('IDPESSOA').AsInteger       := qryBeneficiarios.FieldByName('IDPESSOA').AsInteger;
        ParamByName('IDBENEFICIO').AsInteger    := qryBeneficiarios.FieldByName('IDBENEFICIO').AsInteger;
        ParamByName('NUMEROPROCESSO').AsInteger := qryBeneficiarios.FieldByName('NUMEROPROCESSO').AsInteger;
        Open;
        if not IsEmpty then First;

        if IsEmpty
        then sDataInicioAnt := qryBeneficiarios.FieldByName('DataInicioAnt').AsString
        else sDataInicioAnt := FieldByName('DataInicio').AsString;
     end;


     if not bRecalculaValor
     then begin
        CriaLogOcorrencia(qryBeneficiarios.FieldByName('idplanoprev').AsString,
                          qryBeneficiarios.FieldByName('idpessjur').AsString,
                          qryBeneficiarios.FieldByName('idtitular').AsString,
                          qryBeneficiarios.FieldByName('idbeneficio').AsString,
                          qryBeneficiarios.FieldByName('numeroprocesso').AsString,
                          qryBeneficiarios.FieldByName('idpessoa').AsString,
                          qryBeneficiarios.FieldByName('seqproposta').AsString,
                          IntToStr(iTipoMovimento),
                          DateToStr(date),
                          FloatToStr(qryBeneficiarios.fieldbyname('valoratual').AsFloat),
                          FloatToStr(qryBeneficiarios.fieldbyname('valortotal').AsFloat),
                          FloatToStr(qryBeneficiarios.fieldbyname('valorcotas').AsFloat),
                          sNovaDataInicio,
                          sNovaDataFinal,
                          qryBeneficiarios.FieldByName('ValorAtualAnt').AsString,
                          sDataInicioAnt, 
                          sDataFinalAnt,
                          qryBeneficiarios.FieldByName('IdSitAnterior').AsString,
                          qryBeneficiarios.FieldByName('FlgDataPrevista').AsInteger,
                          qryAux, '',
                          iIdLoteConcessao,
                          iIdCalculoGeral);
        qryBeneficiarios.Next;
        continue;
     end;

     
     // Se o término do benefício for no mes da folha, entao verificar se ele já foi preparado ou não
     if Copy(sDataFinalAnt,7,4)+'/'+Copy(sDataFinalAnt,4,2) = sAnoMesPagamento
     then begin
        with qryAux do
        begin
           Close;
           SQL.Clear;
           SQL.Add(' SELECT COUNT(*) AS TOTAL                               '+
                   ' FROM   HSTBENEFBFCIARIO                                '+
                   ' WHERE  IDPESSOA        = '+qryBeneficiarios.FieldByName('IDPESSOA').AsString+
                   ' AND    MESREFERENCIA   = '''+Copy(sNovaDataInicio,7,4)+'/'+Copy(sNovaDataInicio,4,2)+''''+
                   ' AND    IDBENEFICIO     = '+qryBeneficiarios.FieldByName('IDBENEFICIO').AsString+
                   ' AND    NUMEROPROCESSO  = '+qryBeneficiarios.FieldByName('NUMEROPROCESSO').AsString);
           Open;

           if FieldByName('TOTAL').AsInteger > 0
           then sNovaDataInicioAux :=  sNovaDataInicio
           else if Copy(sDataInicioOriginal,7,4)+'/'+Copy(sDataInicioOriginal,4,2) <> sAnoMesPagamento
                then sNovaDataInicioAux := '01'+Copy(sNovaDataInicio,3,8)
                else sNovaDataInicioAux := sNovaDataInicio;
        end;
     end
     else sNovaDataInicioAux :=  sNovaDataInicio;

     // ************************************************************************
     // GERAR SALARIOS VIRTUAIS RETROATIVOS
     // ************************************************************************
     if (qryBeneficiarios.FieldbyName('FLGBENEFTEMP').AsInteger = 1) and
        (qryTitular.FieldbyName('FLGSALVIRTBENEF').AsInteger    = 1) and
        (qryBeneficiarios.FieldbyName('FLGREFERENCIA').AsInteger = 0) 
     then begin
        if iFlgIncluiMesConc = 1
        then begin
           iUltDiaMesLote    := TrazUltDiaMes(StrToInt(Copy(sAnoMesPagamento,6,2)), StrToInt(Copy(sAnoMesPagamento,1,4)));
           sDataFinalSalario := IntToStr(iUltDiaMesLote)+'/'+Copy(sAnoMesPagamento,6,2)+'/'+Copy(sAnoMesPagamento,1,4);
        end
        else begin
           iUltDiaMesLote    := TrazUltDiaMes(StrToInt(Copy(SAnoMesAnterior(sAnoMesPagamento),6,2)), StrToInt(Copy(SAnoMesAnterior(sAnoMesPagamento),1,4)));
           sDataFinalSalario := IntToStr(iUltDiaMesLote)+'/'+Copy(SAnoMesAnterior(sAnoMesPagamento),6,2)+'/'+Copy(SAnoMesAnterior(sAnoMesPagamento),1,4);
        end;

        sSalarioIntegral  := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qry,
                                                          iIdPessJur, iIdPlanoPrev, iIdPessoaAtual, iSeqProposta,
                                                          'AS', sAnoMesPagamento);

        if not GeraSalarioRetroativo( iIdPessJur, iIdPlanoPrev, iIdPessoaAtual,
                                      'AS',
                                      sNovaDataInicioAux,
                                      sDataFinalSalario,
                                      sSalarioIntegral,
                                      sSalarioIntegral,
                                      sSalarioIntegral,
                                      qryAux, sMsgErro,
                                      qryProcesso.FieldByName('FLGINTERNO').AsString, True)
        then begin
           frmAguarde.Apaga;
           MsgDlg(' Ocorreram problemas na Geração dos Salários no Histórico.'+#13+
                     '[Erro : '+sMsgErro+']. Verifique.','Erro', mtError, [mbOk],0);
           Exit;
        end;
        sSalarioContribuicao := sSalarioIntegral;
        sSQL := ' UPDATE PARTPREVPLAN SET FLGSALVIRTBENEF = 1 '+ 
                ' WHERE  IDPESSJUR       = '+qryBeneficiarios.FieldByName('IDPESSJUR').AsString+
                ' AND    IDPLANOPREV     = '+qryBeneficiarios.FieldByName('IDPLANOPREV').AsString+
                ' AND    IDPESSOA        = '+qryBeneficiarios.FieldByName('IDTITULAR').AsString+
                ' AND    SEQPROPOSTA     = '+qryBeneficiarios.FieldByName('SEQPROPOSTA').AsString;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQL);
        try
           qryAux.ExecSQL;
        except
           frmAguarde.Apaga;
           MsgDlg('Erro ao atualizar salário virtual.', 'Erro', mtError, [mbOK],0);
           dtmBaseDados.dbBaseDados.RollBack;
           Exit;
        end;
     end
     else sSalarioContribuicao := FloatToStr(rValorIntegral);


     // ************************************************************************
     // PROCESSAR PAGAMENTOS - POSTERIORES A DATA DE INICIO
     // ************************************************************************
     // Pagar beneficios posteriores a nova data de inicio ainda nao pagos
     if (sTipoReabertura <> 'PR') 
     then begin
        if qryBeneficiarios.FieldByName('FLGTPBUSCAVALOR').AsInteger = 1
        then begin
           // Buscar ultimo valor integral
           sSQL := ' SELECT HST.VALORINTEGRAL '+
                   ' FROM   HSTBENEFBFCIARIO HST '+
                   ' WHERE  IDPESSJUR       = '+qryBeneficiarios.FieldByName('IDPESSJUR').AsString+
                   ' AND    IDPLANOPREV     = '+qryBeneficiarios.FieldByName('IDPLANOPREV').AsString+
                   ' AND    NUMEROPROCESSO  = '+qryBeneficiarios.FieldByName('NUMEROPROCESSO').AsString+
                   ' AND    IDBENEFICIO     = '+qryBeneficiarios.FieldByName('IDBENEFICIO').AsString+
                   ' AND    IDTITULAR       = '+qryBeneficiarios.FieldByName('IDTITULAR').AsString+
                   ' AND    IDPESSOA        = '+qryBeneficiarios.FieldByName('IDPESSOA').AsString+
                   ' AND    SEQPROPOSTA     = '+qryBeneficiarios.FieldByName('SEQPROPOSTA').AsString+
                   ' AND    MESREFERENCIA   = '''+Copy(sDataFinalAnt, 7,4)+'/'+Copy(sDataFinalAnt, 4,2)+ '''';

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(sSQL);
           try
              qryAux.Open;
           except
              frmAguarde.Apaga;
              MsgDlg('Erro ao buscar último valor integral.', 'Erro', mtError, [mbOK],0);
              dtmBaseDados.dbBaseDados.RollBack;
              Exit;
           end;

           if not qryAux.IsEmpty
           then rValorIntegral := qryAux.FieldbyName('VALORINTEGRAL').AsFloat
           else rValorIntegral := qryBeneficiarios.FieldbyName('VALORATUAL').AsFloat;

        end
        else begin
           rValorIntegral  := qryBeneficiarios.FieldbyName('VALORATUAL').AsFloat ;
        end;
        sUltMesReajuste := qryBeneficiarios.FieldbyName('ULTMESREAJUSTE').AsString;
        dValorSRB       := qryBeneficiarios.FieldByName('VALORSRB').AsFloat;


        bOk := PreparaBeneficioConcedido(qryAux,
                                         iIdTitular,
                                         qryBeneficiarios.FieldByName('IdPessoa').AsInteger,
                                         iSeqProposta,
                                         iIdPessJur,
                                         qryBeneficiarios.FieldByName('idplanoprev').AsInteger,
                                         iNumeroProcesso,
                                         qryBeneficiarios.FieldByName('IdBeneficio').AsInteger,
                                         3109, //prmIDMOTIVOFOLHABEN,                       // edilaine - SOL 253577-18151 / PPM 1318910
                                         qryBeneficiarios.RecordCount,
                                         qryBeneficiarios.FieldByName('IdRegraCalculo').AsInteger,
                                         -1,
                                         qryBeneficiarios.FieldByName('IdRegraPrimPagto').AsInteger,
                                         qryBeneficiarios.FieldByName('IdRegraUltPagto').AsInteger,
                                         qryBeneficiarios.FieldByName('IdTpPagtoBenefic').AsInteger,
                                         qryBeneficiarios.FieldByName('CODPORTFORMA').AsInteger,
                                         qryBeneficiarios.FieldByName('NomeBeneficio').AsString,
                                         sNomePatro, sNomePlano, sMatricula,
                                         sNovaDataInicioAux,
                                         sNovaDataFinal,
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
                                         iTipoMovimento, iFlgDataPrevista,
                                         dValorSRB,
                                         iIdCalculoGeral,
                                         false, false,                     // edilaine - SOL 253577-18151 / PPM 1318910
                                         qryBeneficiarios.FieldByName('IDPERFILINVEST').AsInteger     //edilaine - SIG55933
                                         );

        if bErro
        then begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg(sMsgErro+' O benefício não será alterado até que o problema seja resolvido. ','Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Exit;
        end;

     end;


     CriaLogOcorrencia(qryBeneficiarios.FieldByName('idplanoprev').AsString,
                       qryBeneficiarios.FieldByName('idpessjur').AsString,
                       qryBeneficiarios.FieldByName('idtitular').AsString,
                       qryBeneficiarios.FieldByName('idbeneficio').AsString,
                       qryBeneficiarios.FieldByName('numeroprocesso').AsString,
                       qryBeneficiarios.FieldByName('idpessoa').AsString,
                       qryBeneficiarios.FieldByName('seqproposta').AsString,
                       IntToStr(iTipoMovimento),
                       DateToStr(date),
                       FloatToStr(qryBeneficiarios.fieldbyname('valoratual').AsFloat),
                       FloatToStr(qryBeneficiarios.fieldbyname('valortotal').AsFloat),
                       FloatToStr(qryBeneficiarios.fieldbyname('valorcotas').AsFloat),
                       sNovaDataInicio,
                       sNovaDataFinal,
                       qryBeneficiarios.FieldByName('ValorAtualAnt').AsString,
                       sDataInicioAnt,
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
  // PROCESSAR COBRANCAS NORMAIS - POSTERIORES A DATA DE INICIO
  // ************************************************************************
  if not bRecalculaValor
  then begin
     AtualizaDataFinalContribP;

     try   // edilaine - SOL 253577-18151 / PPM 1318910 - inicio

        GeraDemonstrativo(sDataHoraInicioProcesso);   // edilaine - SOL 253577-17570 / PPM 989569

        bbtnConfirmarClick(bbtnConfirmar);

      except
        MsgDlg('Erro na geração do demonstrativo.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;    // edilaine - SOL 253577-18151 / PPM 1318910 - fim


     // edilaine - SOL 253577-17570 / PPM 989569 - inicio
     {If Not bBenefEhTit
      Then MostraDemonstrativoConcessaoBeneficiario
      Else MostraDemonstrativoConcessaoParticipante;
     } // edilaine - SOL 253577-17570 / PPM 989569 - fim

     Exit;
  end;

  sTabelaContribuicao := iif(iIdTitular = iIdPessoa, 'CONTRIBPREVPARTP', 'CONTRIBPREVNUCLEO');       // edilaine - SOL 253577-18151 / PPM 1318910

  frmAguarde.Mostra('Verificando contribuições ...');
  // Verificar se já foi feita outra renovacao neste mesmo mês
  // Se houve, entao gerar no flginterno um flg de EXCECAO para que não haja erro
  // de constraint
  with qryAux do
  begin
     sSQL := ' SELECT COUNT(1) AS CONT '+
             ' FROM /*EVENTOGERADOR EG, CONTPREVEVENTO CE,*/ '+sTabelaContribuicao+' CPP, BENEFXTAXA B '+      // edilaine - SOL 253577-18151 / PPM 1318910
             ' WHERE CPP.IDPESSJUR = '+ IntToStr(iIdPessJur)+
             ' AND CPP.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev)+
             ' AND CPP.IDPESSOA    = '+ IntToStr(iIdPessoa)+    {iIdTitular}       // edilaine - SOL 253577-18151 / PPM 1318910
             ' AND CPP.SEQPROPOSTA = '+ IntToStr(iSeqProposta)+
             // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
             ' AND CPP.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
             ' AND CPP.IDCONTRIBUICAO = B.IDCONTRIBUICAO '+
             ' AND CPP.IDBENEFICIO    = B.IDBENEFICIO '+
             iif(iIdTitular = iIdPessoa, '', ' AND CPP.IDTITULAR = '+IntToStr(iIdTitular));
             {' AND CE.IDPLANOPREV = CPP.IDPLANOPREV '+
             ' AND CE.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO '+
             ' AND CE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR '+
             ' AND EG.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString;
             }// edilaine - SOL 253577-18151 / PPM 1318910 - fim
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;

     bNaoPossuiContribuicao := qryAux.fieldbyname('CONT').asinteger=0;

     sSQL := ' SELECT HST.FLGINTEVENTO, COUNT(HST.MESREFERENCIA) AS TOTAL '+
             ' FROM   /*EVENTOGERADOR EG, CONTPREVEVENTO CE,*/ BENEFXTAXA B, '+       // edilaine - SOL 253577-18151 / PPM 1318910
             '       '+sTabelaContribuicao+' CPP, HSTCONTRIBPREV HST    '+            // edilaine - SOL 253577-18151 / PPM 1318910
             ' WHERE CPP.IDPESSJUR      = '+ IntToStr(iIdPessJur)   +
             ' AND   CPP.IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) +
             ' AND   CPP.IDPESSOA       = '+ IntToStr(iIdPessoa)    +        {iIdTitular}         // edilaine - SOL 253577-18151 / PPM 1318910
             ' AND   CPP.SEQPROPOSTA    = '+ IntToStr(iSeqProposta) +
             // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
             iif(iIdTitular = iIdPessoa, '', ' AND CPP.IDTITULAR = '+IntToStr(iIdTitular)) +
             //' AND   CE.IDPLANOPREV     = CPP.IDPLANOPREV           '+
             //' AND   CE.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO         '+
             //' AND   CE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR        '+
             //' AND   EG.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+
             ' AND CPP.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
             ' AND CPP.IDCONTRIBUICAO = B.IDCONTRIBUICAO '+
             ' AND CPP.IDBENEFICIO    = B.IDBENEFICIO '+
             // edilaine - SOL 253577-18151 / PPM 1318910 - fim
             ' AND   HST.IDPESSJUR       = CPP.IDPESSJUR             '+
             ' AND   HST.IDPLANOPREV     = CPP.IDPLANOPREV           '+
             ' AND   HST.IDPESSOA        = CPP.IDPESSOA              '+
             ' AND   HST.SEQPROPOSTA     = CPP.SEQPROPOSTA           '+
             ' AND   HST.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO        '+
             iif(iIdTitular = iIdPessoa, '', ' AND HST.IDTITULAR = CPP.IDTITULAR ') +
             ' AND   HST.MESREFERENCIA   >= '''+Copy(sNovaDataInicio,7,4)+'/'+Copy(sNovaDataInicio,4,2)+''''+
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

  If Not bNaoPossuiContribuicao
  Then Begin
     // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
     If (Trim(sNovaDataFinal) <> '') Then
       sSQL := ' UPDATE /*CONTRIBPREVPARTP*/ '+sTabelaContribuicao+' C SET DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''DD/MM/YYYY'') '
     Else
       sSQL := ' UPDATE /*CONTRIBPREVPARTP*/ '+sTabelaContribuicao+' C SET DATAFINAL = NULL ';

     {if sTipoReabertura = 'RB'
     then begin
        sSQL := sSQL + ', DATAINICIO   = TO_DATE('''+sNovaDataInicio+''', ''DD/MM/YYYY'') ';
     end;}
     // edilaine - SOL 253577-18151 / PPM 1318910 - fim

     { Voltar FLGCOBRA independente do tipo de movimento }
     if ( not bVoltaSituacao ) then sSQL := sSQL + ', FLGCOBRA = 1 ';

     sSQL := sSQL +' WHERE IDPESSJUR      = '+ IntToStr(iIdPessJur)   +
             ' AND   IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) +
             ' AND   IDPESSOA       = '+ IntToStr(iIdPessoa)   +        {iIdTitular}         // edilaine - SOL 253577-18151 / PPM 1318910
             ' AND   SEQPROPOSTA    = '+ IntToStr(iSeqProposta) +
             // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
             //' AND   DATAINICIO >= TO_DATE('''+sDataInicioOriginal+''',''DD/MM/YYYY'') '+
             //' AND   DATAFINAL  = TO_DATE('''+sDataFinalAnt+''',''DD/MM/YYYY'') '+
             ' AND   NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+
             iif(iIdTitular = iIdPessoa, '', ' AND   IDTITULAR = '+IntToStr(iIdTitular)) +
             ' AND   IDCONTRIBUICAO IN ( SELECT IDCONTRIBUICAO FROM BENEFXTAXA B, BENEFBFCIARIO BF '+
             '                            WHERE B.IDBENEFICIO = BF.IDBENEFICIO '+
             '                              AND BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+')';
             {' AND   IDCONTRIBUICAO IN ( SELECT CE.IDCONTRIBUICAO FROM CONTPREVEVENTO CE '+
             '                           WHERE  CE.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+')';
             }// edilaine - SOL 253577-18151 / PPM 1318910 - fim
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
             '        PP.INSCRICAODATA,   PF.DATANASC /*,      CP.ORDEMCALCULO*/               '+
             ' FROM   CONTRIBUICAO C, /*EVENTOGERADOR EG, CONTPREV CP,  CONTPREVEVENTO CE,*/ PARTPREVPLAN PP, '+  // edilaine - SOL 253577-18151 / PPM 1318910
             '        /*CONTRIBPREVPARTP*/ '+sTabelaContribuicao+' CPP,   PESSOAFISICA PF '+    // edilaine - SOL 253577-18151 / PPM 1318910
             ' WHERE CPP.IDPESSJUR      = '+ IntToStr(iIdPessJur)   +
             ' AND   CPP.IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) +
             ' AND   CPP.IDPESSOA       = '+ IntToStr(iIdPessoa)    +        {iIdTitular}       // edilaine - SOL 253577-18151 / PPM 1318910
             ' AND   CPP.SEQPROPOSTA    = '+ IntToStr(iSeqProposta) +
             ' AND   CPP.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+                          // edilaine - SOL 253577-18151 / PPM 1318910
              iif(iIdTitular = iIdPessoa, '', ' AND CPP.IDTITULAR = '+IntToStr(iIdTitular));    // edilaine - SOL 253577-18151 / PPM 1318910

             If (Trim(sNovaDataFinal) <> '') Then
               sSQL := sSQL + ' AND DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''DD/MM/YYYY'') '
             Else
               sSQL := sSQL + ' AND DATAFINAL = NULL ';

             if sTipoReabertura = 'RB' then begin
                sSQL := sSQL + ' AND DATAINICIO   = TO_DATE('''+sNovaDataInicio+''', ''DD/MM/YYYY'') ';
             end;

             if (not bVoltaSituacao) and (sTipoReabertura <> 'RN')  then sSQL := sSQL + ' AND FLGCOBRA = 1 ';

             sSQL := sSQL +
              ' AND   CPP.DATAINICIO >= TO_DATE('''+sDataInicioOriginal+''',''dd/mm/yyyy'') '+
              // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
              {' AND   CE.IDPLANOPREV     = CPP.IDPLANOPREV           '+
              ' AND   CE.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO         '+
              ' AND   CE.IDEVENTOGERADOR = EG.IDEVENTOGERADOR        '+
              ' AND   EG.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+
              }// edilaine - SOL 253577-18151 / PPM 1318910 - fim
              ' AND   CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO          '+
              ' AND   PP.IDPESSJUR       = CPP.IDPESSJUR             '+
              ' AND   PP.IDPLANOPREV     = CPP.IDPLANOPREV           '+
              ' AND   PP.IDPESSOA        = CPP.IDPESSOA              '+
              ' AND   PP.SEQPROPOSTA     = CPP.SEQPROPOSTA           '+
              ' AND   PF.IDPESSOA        = CPP.IDPESSOA              '+
              // edilaine - SOL 253577-18151 / PPM 1318910
              ' AND   IDCONTRIBUICAO IN ( SELECT IDCONTRIBUICAO FROM BENEFXTAXA B, BENEFBFCIARIO BF '+
              '                            WHERE B.IDBENEFICIO = BF.IDBENEFICIO '+
              '                              AND BF.NUMEROPROCESSO = '+IntToStr(iNumeroProcesso)+')';
              {' AND   CP.IDPLANOPREV     = CPP.IDPLANOPREV           '+
              ' AND   CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO        '+
              ' ORDER BY CP.ORDEMCALCULO ';
              }// edilaine - SOL 253577-18151 / PPM 1318910  - fim


     if (qryBeneficiarios.FieldbyName('FLGBENEFTEMP').AsInteger = 1) and
        (qryTitular.FieldbyName('FLGSALVIRTBENEF').AsInteger    = 1)
     then sSalarioContribuicao := sSalarioIntegral
     else sSalarioContribuicao := FloatToStr(rValorIntegral);

     // edilaine - SOL 253577-17570 / PPM 989569 - inicio

     bErro := ExecutaSP_PreparoContribuicao(iNumeroProcesso,
                                            qryBeneficiarios.fieldByName('IDTITULAR').AsInteger,
                                            prmIDMOTIVOFOLHABEN,  //  prmIdMotivoContrib
                                            iIdLoteConcessao,
                                            'Não',                // DbLAlterador.Text
                                            sAnoMesPagamento,     // sAnoMesPagamento
                                            ''
                                           );

     {bErro := PreparaContribuicaoASSISTIDO( iIdPessJur,
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
                                   sSalarioContribuicao,
                                   sIdSitPartDepois,
                                   sFlgIntEvento,
                                   True,
                                   False,
                                   '',
                                   False,
                                   qryProcesso.FieldbyName('IdEventoGerador').AsInteger,
                                   sNovaDataInicioAux,
                                   sNovaDataFinal,
                                   3,
                                   iFlgDataPrevista,
                                   sDataInicioOriginal,
                                   qryBeneficiarios.FieldByName('numeroprocesso').AsInteger);

     } // edilaine - SOL 253577-17570 / PPM 989569 - fim

     if bErro
     then begin
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro ao preparar contribuições ['+sMsgErro+'].' ,'Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Exit;
     end;

  End;

  if (qryBeneficiarios.fieldbyname('IdTitular').AsInteger = qryBeneficiarios.fieldbyname('IdPessoa').AsInteger)
  then begin

     // Andre Imakawa - SIG 53667 - Inicio
     {
     if (bVoltaSituacao)
     then begin
        // Voltar as 3 situacoes do participante para Assistido ...
        // Esta situação está na EventosPrev relativa ao evento que gerou o benefício
        // Caso, por problema de migraçao, a EventosPrev nao esteja preenchida,
        // então pedir situações na tela
        if not VoltaSituacoesParticipante( dtmAPrev.qry, qryAux,
                                           qryTitular.FieldByName('IdPessJur').AsInteger,
                                           qryTitular.FieldByName('IdPlanoPrev').AsInteger,
                                           qryTitular.FieldByName('IdPessoa').AsInteger,
                                           qryTitular.FieldByName('SeqProposta').AsInteger,
                                           qryProcesso.FieldByName('IdEventoGerador').AsInteger,
                                           iIdEventoAnterior, iIdSitPart,
                                           sFlgIntSitPart,    sMsgErro, False)
        then begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro no retorno das situações do participante.','Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Exit;
        end;

        // Atualizar as Contribuições
        If Not AtualizaContribuicoes Then Begin
           frmAguarde.Apaga;
           dtmBaseDados.dbBaseDados.RollBack;
           MsgDlg('Erro ao atualizar a situação das contribuições.',
                  'Erro',mtError,[mbOk,mbHelp],0);
           TiraSQL(qryAux);
           Exit;
        End;

     end else begin 
        if sIdSitFuncDepois <> ''
        then begin
           sSQL := ' UPDATE ELEGPATRO SET IDSITFUNC = '+sIdSitFuncDepois+
                   ' WHERE  IDPESSJUR = '+qryTitular.FieldByName('IdPessJur').AsString+
                   ' AND    IDPESSOA  = '+qryTitular.FieldByName('IdPessoa').AsString;
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(sSQL);
           qryAux.ExecSQL;
        end;

        if sIdSitPartDepois <> ''
        then begin
           sSQL := ' UPDATE PARTPREVPLAN SET IDSITPART = '+ sIdSitPartDepois+', IDSITPLANOPREV = '+sIdSitPlanDepois+
                   ' WHERE  IDPESSJUR   = '+qryTitular.FieldByName('IdPessJur').AsString+
                   ' AND    IDPLANOPREV = '+qryTitular.FieldByName('IdPlanoPrev').AsString+
                   ' AND    IDPESSOA    = '+qryTitular.FieldByName('IdPessoa').AsString+
                   ' AND    SEQPROPOSTA = '+qryTitular.FieldByName('SEQPROPOSTA').AsString;
           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(sSQL);
           qryAux.ExecSQL;
        end;
     end;
     }
     // Andre Imakawa - SIG 53667 - Fim

     { Sempre gravar a DATAVOLTA na EVENTOSPREV, pois caso esteja renovando é  }
     { sinal de que a data provavel de volta mudou.                            }

     // Procurar o Ultimo Evento Gerador da pessoa
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT EP.IDEVENTOSPREV, '+
                    ' EP.IDSITPARTATUAL, EP.IDSITFUNCATUAL, EP.IDSITPLANOATUAL '+ 
                    ' FROM   EVENTOSPREV EP '+
                    ' WHERE  EP.IDPLANOPREV     = '+qryTitular.FieldByName('IdPlanoPrev').AsString+
                    ' AND    EP.IDPESSOA        = '+qryTitular.FieldByName('IdPessoa').AsString+
                    ' AND    EP.IDPESSJUR       = '+qryTitular.FieldByName('IdPessJur').AsString+
                    ' AND    EP.DATAEVENTO      = TO_DATE('+QuotedStr(qryProcesso.FieldByName('DTEVENTO').AsString)+','+
                                                            QuotedStr('DD/MM/YYYY')+')'+
                    ' AND    EP.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString);
     qryAux.Open;
     sIdEventosPrev := OraNumero(qryAux.FieldByName('IdEventosPrev').AsString);

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAVOLTA = TO_DATE(' +
                                  QuotedStr(Trim(sNovaDataFinal))+','+QuotedStr('DD/MM/YYYY')+')' +
                    ' WHERE IDPESSJUR       = ' + qryTitular.FieldByName('IDPESSJUR').AsString   + ' AND ' +
                    '       IDPLANOPREV     = ' + qryTitular.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                    '       IDPESSOA        = ' + qryTitular.FieldByName('IDPESSOA').AsString    + ' AND ' +
                    '       SEQPROPOSTA     = ' + qryTitular.FieldByName('SEQPROPOSTA').AsString + ' AND ' +
                    '       IDEVENTOSPREV   = ' + sIdEventosPrev);
     try
        qryAux.ExecSQL;
     except
        frmAguarde.Apaga;
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Erro na gravação da data de retorno do participante.','Erro',mtError,[mbOk,mbHelp],0);
        TiraSQL(qryAux);
        Exit;
     end;
  end;

  try  // edilaine - SOL 253577-18151 / PPM 1318910 - inicio
    frmAguarde.Apaga;

    GeraDemonstrativo(sDataHoraInicioProcesso);   // edilaine - SOL 253577-17570 / PPM 989569

    bbtnConfirmarClick(bbtnConfirmar)
  except
    MsgDlg('Erro na geração do demonstrativo.','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;    // edilaine - SOL 253577-18151 / PPM 1318910 - fim


  // edilaine - SOL 253577-17570 / PPM 989569 - inicio
  {If Not bBenefEhTit
   Then MostraDemonstrativoConcessaoBeneficiario
   Else MostraDemonstrativoConcessaoParticipante;
  } // edilaine - SOL 253577-17570 / PPM 989569 - fim

  //bbtnConfirmar.Enabled := True;           // edilaine - SOL 253577-18151 / PPM 1318910

  If Not bRenovaTodos
   Then qryBeneficiarios.Filtered := False;
end;

procedure TfrmReaberturaBeneficio.MostraDemonstrativoConcessaoParticipante;
var dTotalBeneficio : double;
    sSalarioNaDib   : string;
    sOpcoesContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo da '+sReabProrrog+' ...');

   qryResultado.Close;
   qryResultado.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
   qryResultado.Open;

  If Not bRenovaTodos
   Then Begin
    qryResultado.Filter := 'IDPESSOA = '+qryBeneficiarios.FieldbyName('IDPESSOA').AsString;
    qryResultado.Filtered := True;
   End;
  
   qryAux.Close;

   frmMostraAux.Caption := 'Resumo da '+sReabProrrog+' de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('----------------------------------------------------------------------------------------------');
      Add('                                DEMONSTRATIVO DE '+PreparaStr(UPPERCASE(sReabProrrog),12)+'            - VERSÃO : '+Sistema.Versao);
      Add('                                                                           LOTE   : '+IntToStr(iIdLoteConcessao));
      Add('USUÁRIO : '+Sistema.NomeUsuario+'                         DATA DA '+UPPERCASE(sReabProrrog)+' : '+DateToStr(date));
      Add('----------------------------------------------------------------------------------------------');
      Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add(PreparaStr('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString,50)+
          PreparaStr('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString,49));

      if qryTitular.FieldByName('FLGISENTOIRRF').AsInteger = 0
      then Add(PreparaStr(' ',50)+
               PreparaStr('Isento de Imposto de Renda : Não ', 49))
      else Add(PreparaStr(' ',50)+
               PreparaStr('Isento de Imposto de Renda : Sim ', 49));

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

            If ( Trim( sDataFinalAnt ) <> '' )
            Then Add(' '+PreparaStr(' ',50)+ PreparaStr('Data Final Anterior : '+ DateToStr( StrToDate(sDataFinalAnt) ),49));

            if sTipoReabertura = 'PR'
            then If ( Trim( sDataFinalAnt ) <> '' )
                 Then Add(' '+PreparaStr(' ',50)+
                      PreparaStr('Nova Data de Início na Fundação : '+ DateToStr( StrToDate(sDataFinalAnt) + 1),49))
            else Add(' '+PreparaStr(' ',50)+
                         PreparaStr('Nova Data de Início na Fundação : '+    sNovaDataInicio,49));

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

         sSalarioNaDib := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qry,
                                                       iIdPessJur,
                                                       iIdPlanoPrev,
                                                       iIdTitular,
                                                       iSeqProposta,
                                                       'AS',
                                                       Copy(sNovaDataInicio,7,4)+'/'+Copy(sNovaDataInicio,4,2));

         Add(' Salário de Participação anterior ao Evento = R$ '+FormatFloat('#0.00', StrToFloat(ClienteNumero(sSalarioNaDib))));
         Add(' Valor do Benefício = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VALORATUAL').AsFloat));

         dTotalBeneficio := dTotalBeneficio + qryResultado.FieldByName('VALORATUAL').AsFloat;
         qryResultado.Next;
      end; // while not qryResultado.Eof

      Add(' Total dos Benefícios do Processo : '+FormatFloat('#0.00', dTotalBeneficio));
      Add('----------------------------------------------------------------------------------------------');

      if sTipoReabertura = 'PR'
      then begin
         Add(' Benefício PRORROGADO. Os pagamentos e cobranças serão feitos na folha de manutenção. ');
      end
      else begin
         if (Trim(sNovaDataFinal) <> '') and
            (Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2) <= sAnoMesPagamento)
         then begin
            if (Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2) = sAnoMesPagamento)
            then begin
               if iFlgIncluiMesConc = 0
               then begin
                  Add(' Data Final coincide com o mês de pagamento. O benefício será encerrado ');
                  Add(' pela Folha de Benefícios. ');
               end
               else begin
                  if iFlgDataPrevista = 1
                  then begin
                     Add(' Data Final Prevista já atingida. Situação do Benefício alterada para "Retido".');
                  end
                  else begin
                     Add(' Data Final Efetiva já atingida. Situação do Benefício alterada para "Encerrado."');
                  end;
               end
            end
            else if iFlgDataPrevista = 1
                 then begin
                    Add(' Data Final Prevista já atingida. Situação do Benefício alterada para "Retido".');
                 end
                 else begin
                    Add(' Data Final Efetiva já atingida. Situação do Benefício alterada para "Encerrado".');
                 end;
         end
         else begin
            Add(' Situação do Benefício alterada para "Normal".');
         end;
      end;
      Add('----------------------------------------------------------------------------------------------');

      qryResultado.First;

      // Mostrar mês a mês quanto será pago e quanto será descontado
      Add('----------------------------------------------------------------------------------------------');
      Add('=> VALORES A PAGAR / RECEBER                                                                                         ');
      Add('----------------------------------------------------------------------------------------------');
      Add('MÊS      ITEM                                     PAGAR       DESCONTAR  [ORIGINAL] SRB     ');

      Add(' ');

      // Buscar BENEFICIOS a pagar no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV, H.VALORPREVMIN, '+
                 '  DECODE(BPP.FLGREFERENCIA,0,H.VALORSRB,NULL) VALORSRB '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev));
         If bRenovaTodos
          Then SQL.Add(' AND    H.IDTITULAR        = '+IntToStr(iIdTitular))
          Else SQL.Add(' AND    H.IDPESSOA         = '+IntToStr(iIdBeneficiario));
         SQL.Add(' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.FLGDEVOLUCAO     = 0 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' AND    BPP.IDBENEFICIO    = H.IDBENEFICIO '+
                 ' AND    BPP.IDPLANOPREV    = H.IDPLANOPREV '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;

         First;
         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                          ,9)+
                 PreparaStr(FieldByName('Nome').AsString                                   ,40)+
                 PreparaStr(' '                                                            ,1)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)    ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                   ,10)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrevMin').AsFloat) ,12)+
                 PreparaStr(FormatFloat('#0.00',FieldByName('VALORSRB').AsFloat)           ,11));
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
                 ' WHERE  HST.IDPESSJUR       = ' + qryResultado.FieldbyName('IDPESSJUR').AsString   +
                 ' AND    HST.IDPLANOPREV     = ' + qryResultado.FieldbyName('IDPLANOPREV').AsString +
                 ' AND    HST.IDPESSOA        = ' + qryResultado.FieldbyName('IDPESSOA').AsString    +
                 ' AND    HST.SEQPROPOSTA     = ' + qryResultado.FieldbyName('SEQPROPOSTA').AsString +
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
                 PreparaStr(FieldByName('Nome').AsString                                    ,40)+
                 PreparaStr(' '                                                             ,1)+
                 PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',0)                                    ,10));
            Next;
         end;
      end;

      // Buscar Beneficios a devolver(descontar) no mês
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT B.NOME, H.MESREFERENCIA, H.VALORPREV, '+
                 '  DECODE(BPP.FLGREFERENCIA,0,H.VALORSRB,NULL) VALORSRB '+
                 ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '+
                 ' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao)+
                 ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                 ' AND    H.IDPLANOPREV  = '+ qryResultado.FieldByName('IdPlanoPrev').AsString + 
                 ' AND    H.IDPESSOA         = '+IntToStr(iIdTitular)+
                 ' AND    H.SEQPROPOSTA      = 1 '+
                 ' AND    H.FLGDEVOLUCAO     = 1 '+
                 ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                 ' AND    BPP.IDBENEFICIO    = H.IDBENEFICIO '+
                 ' AND    BPP.IDPLANOPREV    = H.IDPLANOPREV '+
                 ' ORDER BY B.NOME, H.MESREFERENCIA ');
         Open;

         while not Eof do
         begin
            Add( PreparaStr(FieldByName('MesReferencia').AsString                        ,9)+
                 PreparaStr(FieldByName('Nome').AsString                                 ,40)+
                 PreparaStr(' '                                                          ,1)+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                 ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat)  ,10)+
                 PreparaStr(FormatFloat('#0.00',FieldByName('VALORSRB').AsFloat)         ,11));
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
                 '        HST.MESREFERENCIA, HST.VALORESPERADO, CPP.FLGCOBRA                                           '+
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
                 PreparaStr(FieldByName('Nome').AsString                                     ,40)+
                 PreparaStr(' '                                                              ,1)+
                 PreparaStr('(+)'+FormatFloat('#0.00',0)                                     ,12)+
                 PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat)  ,10));

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

procedure TfrmReaberturaBeneficio.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Rollback;

  MsgDlg(sReabProrrog+' cancelada.','Informação',mtInformation,[mbOk,mbHelp],0);
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

procedure TfrmReaberturaBeneficio.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //Darivaldo Alencar SIG68133 -inicio
  if not(bTemPerfilInvest) then
    begin
      bbtnCancelarClick(Sender);
      Exit;
    end;
  //Darivaldo Alencar SIG68133 -fim

  if MsgDlg('Confirma a '+sReabProrrog+' do Benefício ? ','Confirmação',mtConfirmation, [mbNo, mbYes], 1) = mrNo
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

  // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
  try
    frmAguarde.Apaga;

    MsgDlg(sReabProrrog+' efetuada com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
    GeraDemonstrativo(sDataHoraInicioProcesso, 'homologado');

  except
    MsgDlg('Erro ao gravar o demonstrativo.','Erro',mtError,[mbOk,mbHelp],0);
  end;
  // edilaine - SOL 253577-18174 / PPM 1327585 - fim

  bbtnConfirmar.Enabled  := False;
  bbtnCancelar.Enabled   := False;
  sbtnAlteraData.Enabled := False;
end;

procedure TfrmReaberturaBeneficio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
  // SOL124279 - Daniel Begnami
  //if dtmBaseDados.dbBaseDados.InTransaction then
  //  dtmBaseDados.dbBaseDados.RollBack;
  //ShowMessage('Existe uma transação em aberto. A Transação será cancelada!');
  // FIM SOL124279 - Daniel Begnami
  If (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
end;

procedure TfrmReaberturaBeneficio.bbtnSairClick(Sender: TObject);
begin  
  if dtmBaseDados.dbBaseDados.InTransaction
  then begin
     if MsgDlg('Existe uma operação em aberto. Deseja fechar a tela ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo
     then Abort
     else dtmBaseDados.dbBaseDados.Rollback;
  end;
  inherited;
end;

function TfrmReaberturaBeneficio.AtualizaDataFinalContribP: Boolean;
// Função que atualiza DATAFINAL da CONTRIBPREVPARTP se for uma PRORROGAÇÃO

Var
  sSQL: String;
begin
  If (Trim(sNovaDataFinal) <> '') Then
    sSQL := ' UPDATE CONTRIBPREVPARTP SET DATAFINAL = TO_DATE('''+sNovaDataFinal+''', ''DD/MM/YYYY'') '
  Else
    sSQL := ' UPDATE CONTRIBPREVPARTP SET DATAFINAL =  NULL ) ';
    sSQL :=  sSQL  +
          ' WHERE IDPESSJUR      = '+ IntToStr(iIdPessJur)   +
          ' AND   IDPLANOPREV    = '+ IntToStr(iIdPlanoPrev) +
          ' AND   IDPESSOA       = '+ IntToStr(iIdTitular)   +
          ' AND   SEQPROPOSTA    = '+ IntToStr(iSeqProposta) +
          ' AND   DATAINICIO >= TO_DATE('''+sDataInicioOriginal+''',''DD/MM/YYYY'') '+
          ' AND   DATAFINAL  = TO_DATE('''+sDataFinalAnt+''',''DD/MM/YYYY'') '+
          ' AND   IDCONTRIBUICAO IN ( SELECT CE.IDCONTRIBUICAO FROM CONTPREVEVENTO CE '+
          '                           WHERE  CE.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+')';

   with qryAux do
   begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Try
       ExecSQL;
     Except
       Result := False;
       Exit;
     End;
     Result := True;
   end;
end;

procedure TfrmReaberturaBeneficio.MostraDemonstrativoConcessaoBeneficiario;
var dTotalBeneficio : double;
    sSalarioNaDib   : string;
    sOpcoesContrib  : string;
    iIdContribAtual, iIdContribAnterior : longint;
    bPrimeiraVez,
    bAlgumPagadorPatro : boolean;
    iIdPessoaAtual     : longint;
begin
   frmAguarde.Mostra('Preparando o Demonstrativo da '+sReabProrrog+' ...');

   qryResultado.Close;
   qryResultado.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
   qryResultado.Open;

   If Not bRenovaTodos
   Then Begin
    qryResultado.Filter := 'IDPESSOA = '+qryBeneficiarios.FieldbyName('IDPESSOA').AsString;
    qryResultado.Filtered := True;
   End;

   qryAux.Close;

   frmMostraAux.Caption := 'Resumo da '+sReabProrrog+' de Benefício ... ';

   // Exibir dados do participante
   with frmMostraAux.memResult.Lines do
   begin
      Clear;
      Add('--------------------------------------------------------------------------------------------------');
      Add('                                DEMONSTRATIVO DE '+PreparaStr(UPPERCASE(sReabProrrog),12)+'            - VERSÃO : '+Sistema.Versao);
      Add('                                                                           LOTE   : '+IntToStr(iIdLoteConcessao));
      Add('USUÁRIO : '+Sistema.NomeUsuario+'                         DATA DA '+UPPERCASE(sReabProrrog)+' : '+DateToStr(date));
      Add('--------------------------------------------------------------------------------------------------');
      Add('Participante : '+qryTitular.FieldByName('Nome').AsString);
      Add(' ');
      Add(PreparaStr('Data de Nascimento  : '+qryTitular.FieldByName('DataNasc').AsString,50)+
          PreparaStr('Data do Falecimento : '+qryTitular.FieldByName('DataMorte').AsString,49));

      if qryTitular.FieldByName('FLGISENTOIRRF').AsInteger = 0
      then Add(PreparaStr(' ',50)+
               PreparaStr('Isento de Imposto de Renda : Não ', 49))
      else Add(PreparaStr(' ',50)+
               PreparaStr('Isento de Imposto de Renda : Sim ', 49));
      Add('--------------------------------------------------------------------------------------------------');

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

      Add('--------------------------------------------------------------------------------------------------');
      Add('PROCESSO Nº : '+qryProcesso.FieldbyName('NumeroProcesso').AsString);
      Add('EVENTO : '+qryProcesso.FieldbyName('NOME').AsString+ ' - DATA DO EVENTO : '+qryProcesso.FieldbyName('DTEVENTO').AsString);

      Add('--------------------------------------------------------------------------------------------------');
      Add('=> BENEFÍCIOS :');
      qryResultado.First;
      dTotalBeneficio := 0;
      while not qryResultado.Eof do
      begin
         Add('--------------------------------------------------------------------------------------------------');
         Add('  BENEFICIÁRIO : '+qryResultado.Fieldbyname('NOMEBENEFICIARIO').AsString);
         Add('- '+qryResultado.FieldByName('Nome').AsString);
         Add(' ');
         Add(' '+PreparaStr('Data de Requerimento : '+qryResultado.FieldByName('DataRequerimento').AsString, 50)+
                 PreparaStr('Data de Concessão : '+qryResultado.FieldByName('DataConcessao').AsString, 49));

         if qryResultado.FieldByName('FlgResgate').AsInteger = 0 // nao é resgate
         then begin
            Add(' '+PreparaStr('Data de Início no INSS : '+qryResultado.FieldByName('DataInicioINSS').AsString,50)+
                    PreparaStr('Data de Início na Fundação : '+qryResultado.FieldByName('DataInicioFUND').AsString,49));

            if (qryResultado.FieldByName('FLGDATAPREVISTA').AsInteger = 1) and (qryResultado.FieldByName('DATAFINALPREVISTA').AsString <> '')
            then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Prevista) : '+qryResultado.FieldByName('DATAFINALPREVISTA').AsString,49))
            else if qryResultado.FieldByName('DATAFINAL').AsString <> ''
                 then Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final (Efetiva) : '+qryResultado.FieldByName('DATAFINAL').AsString,49))
                 else Add(PreparaStr(' ',50)+' '+PreparaStr('Data Final : <indefinida> ',49));

            Add(' '+PreparaStr('Valor do INSS : Calculado = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VLRCALCINSS').AsFloat),50)+
                PreparaStr('Informado = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VLRINFINSS').AsFloat),49));
         end
         else begin // é resgate
            Add(' Data de Início na Fundação : '+qryResultado.FieldByName('DataInicioFUND').AsString);
         end;

         sSalarioNaDib := BuscaSalarioPESSOAINTEGRAL ( dtmAPrev.qry,
                                                       iIdPessJur,
                                                       iIdPlanoPrev,
                                                       iIdTitular,
                                                       iSeqProposta,
                                                       'AS',
                                                       Copy(qryResultado.FieldByName('DataInicioFUND').AsString,7,4)+'/'+Copy(qryResultado.FieldByName('DataInicioFUND').AsString,4,2)); 
         Add(' ');
         Add(' Valor do Benefício = R$ '+FormatFloat('#0.00', qryResultado.FieldByName('VALORATUAL').AsFloat));

         dTotalBeneficio := dTotalBeneficio + qryResultado.FieldByName('VALORATUAL').AsFloat;
         qryResultado.Next;
      end; // while not qryResultado.Eof

      // FUNCEF Colocar o total de benefícios
      Add(' Total dos Benefícios do Processo : '+FormatFloat('#0.00', dTotalBeneficio));
      Add('----------------------------------------------------------------------------------------------');
      Add('----------------------------------------------------------------------------------------------');
      Add('=> VALORES A PAGAR / RECEBER                                                                                         ');
      Add('----------------------------------------------------------------------------------------------');

      // Abrir query com beneficiarios que possuem acerto
      qryResultadoHST.Close;
      qryResultadoHst.ParamByName('NumeroProcesso').AsInteger := iNumeroProcesso;
      qryResultadoHst.ParamByName('IdLote').AsInteger         := iIdLoteConcessao;
      qryResultadoHst.Open;

      qryResultadoHST.First;
      iIdPessoaAtual := qryResultadoHST.FieldbyName('IDPESSOA').AsInteger;
      bPrimeiraVez   := True;
      // Mostrar mês a mês quanto será pago e quanto será descontado
      Add('--------------------------------------------------------------------------------------------------');
      Add('BENEFICIÁRIO : '+qryResultadoHST.Fieldbyname('NOMEBENEFICIARIO').AsString);
      Add('MÊS      ITEM                                                   PAGAR          DESCONTAR');
      Add(' ');

      while not qryResultadoHST.Eof do
      begin
         if iIdPessoaAtual <> qryResultadoHST.FieldByName('IDPESSOA').AsInteger
         then begin
            Add('BENEFICIÁRIO : '+qryResultadoHST.Fieldbyname('NOMEBENEFICIARIO').AsString);
            Add('MÊS      ITEM                                                   PAGAR          DESCONTAR');
            Add(' ');
            iIdPessoaAtual := qryResultadoHST.FieldByName('IDPESSOA').AsInteger;
            bPrimeiraVez   := True;
         end
         else begin
            if not bPrimeiraVez
            then begin
               qryResultadoHST.Next;
               continue;
            end;
         end;

         // Buscar BENEFICIOS a pagar no mês
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT P.NOME AS BENEFICIARIO, B.NOME, H.MESREFERENCIA, H.VALORPREV '+
                    ' FROM   PESSOA P, BENEFICIO B, HSTBENEFBFCIARIO H      ');
            SQL.Add(' WHERE  H.IDLOTE           = '+IntToStr(iIdLoteConcessao));
            SQL.Add(' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                    ' AND    H.IDPLANOPREV  = ' + qryResultadoHST.FieldByName('IdPlanoPrev').AsString +
                    ' AND    H.IDTITULAR        = '+IntToStr(iIdTitular)+
                    ' AND    H.IDPESSOA         = '+IntToStr(iIdPessoaAtual)+
                    ' AND    H.SEQPROPOSTA      = 1 '+
                    ' AND    H.FLGDEVOLUCAO     = 0 '+
                    ' AND    H.FLGCONCESSAO     = 1 '+
                    ' AND    NVL(H.FLGENVIADO,0)   = 0 '+
                    ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                    ' AND    P.IDPESSOA         = H.IDPESSOA '+
                    ' ORDER BY P.NOME, B.NOME, H.MESREFERENCIA ');
            Open;

            First;
            while not Eof do
            begin
               Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                    PreparaStr(FieldByName('Nome').AsString                          ,50)+
                    PreparaStr(' '                                                   ,5)+
                    PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,15)+
                    PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,15));
               Next;
            end;
         end; { With }

         // Buscar CONTRIBUICOES a devolver no mês
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT C.NOME, CP.FLGPAGADOR, HST.MESREFERENCIA, HST.VALORESPERADO             '+
                    ' FROM   CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST '+
                    ' WHERE  HST.IDPESSJUR       = ' + qryResultadoHST.FieldByName('IdPessJur').AsString   +
                    ' AND    HST.IDPLANOPREV     = ' + qryResultadoHST.FieldByName('IdPlanoPrev').AsString +
                    ' AND    HST.IDPESSOA        = ' + qryResultadoHST.FieldByName('IdPessoa').AsString    +
                    ' AND    HST.SEQPROPOSTA     = ' + qryResultadoHST.FieldByName('SeqProposta').AsString +
                    ' AND    HST.IDLOTE          = '+IntToStr(iIdLoteConcessao)+
                    ' AND    HST.FLGDEVOLUCAO    = 1 '+
                    ' AND    HST.FLGDESCFOLHA    = 1 '+
                    ' AND    HST.FLGCONCESSAO    = 1 '+
                    ' AND    HST.SITRECEBIMENTO   <= 1 '+
                    ' AND    CP.IDPLANOPREV      = HST.IDPLANOPREV '+
                                        ' AND    CP.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO '+
                    ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO  '+
                    ' ORDER BY C.NOME, HST.MESREFERENCIA');
            Open;

            while not Eof do
            begin

               if FieldByName('FLGPAGADOR').AsString <> 'C'
               then begin
                  bAlgumPagadorPatro := True;
                  Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                       PreparaStr(FieldByName('Nome').AsString                          ,50)+
                       PreparaStr(' '                                                   ,5)+
                       PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15)+
                       PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,15) + '(*)');
               end
               else
                  Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                       PreparaStr(FieldByName('Nome').AsString                          ,50)+
                       PreparaStr(' '                                                   ,5)+
                       PreparaStr('(+)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15)+
                       PreparaStr('(-)'+FormatFloat('#0.00',0)                                ,15));
               Next;
            end;
         end;

         // Buscar Beneficios a devolver(descontar) no mês
         with qryAux do
         begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT H.IDTITULAR, H.IDPESSOA, B.NOME, H.MESREFERENCIA, H.VALORPREV '+
                    ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H      '+
                    ' WHERE  H.IDLOTE      = '+IntToStr(iIdLoteConcessao)+
                    ' AND    H.IDPESSJUR        = '+IntToStr(iIdPessJur)+
                    ' AND    H.IDPLANOPREV      = '+IntToStr(iIdPlanoPrev)+
                    ' AND    H.IDTITULAR        = '+IntToStr(iIdTitular)+
                    ' AND    H.IDPESSOA         = '+qryResultadoHST.FieldByName('IDPESSOA').AsString+
                    ' AND    H.SEQPROPOSTA      = 1 '+
                    ' AND    H.FLGDEVOLUCAO     = 1 '+
                    ' AND    H.FLGCONCESSAO     = 1 '+
                    ' AND    NVL(H.FLGENVIADO,0)   = 0 '+
                    ' AND    B.IDBENEFICIO      = H.IDBENEFICIO '+
                    ' ORDER BY B.NOME, H.MESREFERENCIA ');
            Open;

            while not Eof do
            begin
               Add( PreparaStr(FieldByName('MesReferencia').AsString                 ,9)+
                    PreparaStr(FieldByName('Nome').AsString                          ,50)+
                    PreparaStr(' '                                                   ,5)+
                    PreparaStr('(+)'+FormatFloat('#0.00',0)                                ,15)+
                    PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorPrev').AsFloat) ,15));
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
                    '        HST.MESREFERENCIA, HST.VALORESPERADO, CP.FLGPAGADOR '+
                    ' FROM   CONTRIBUICAO C, CONTPREV CP, CONTRIBPREVPARTP CPP, HSTCONTRIBPREV HST '+
                    ' WHERE  HST.IDPESSJUR       = ' + qryResultadoHST.FieldByName('IdPessJur').AsString   +
                    ' AND    HST.IDPLANOPREV     = ' + qryResultadoHST.FieldByName('IdPlanoPrev').AsString +
                    ' AND    HST.IDPESSOA        = ' + qryResultadoHST.FieldByName('IdPessoa').AsString    +
                    ' AND    HST.SEQPROPOSTA     = ' + qryResultadoHST.FieldByName('SeqProposta').AsString +
                    ' AND    HST.IDLOTE          = '+IntToStr(iIdLoteConcessao)+
                    ' AND    HST.FLGDEVOLUCAO    = 0 '+
                    ' AND    HST.FLGDESCFOLHA    = 1 '+
                    ' AND    HST.FLGCONCESSAO    = 1 '+
                    ' AND    HST.SITRECEBIMENTO   <= 1 '+
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
               if FieldByName('FLGPAGADOR').AsString <> 'C'
               then begin
                  bAlgumPagadorPatro := True;
                  Add( PreparaStr(FieldByName('MesReferencia').AsString      ,9)+
                       PreparaStr(FieldByName('Nome').AsString                          ,50)+
                       PreparaStr(' '                                                   ,5)+
                       PreparaStr('(+)'+FormatFloat('#0.00',0)                          ,15)+
                       PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15)+'(*)');

               end
               else
                  Add( PreparaStr(FieldByName('MesReferencia').AsString      ,9)+
                       PreparaStr(FieldByName('Nome').AsString                          ,50)+
                       PreparaStr(' '                                                   ,5)+
                       PreparaStr('(+)'+FormatFloat('#0.00',0)                          ,15)+
                       PreparaStr('(-)'+FormatFloat('#0.00',FieldByName('ValorEsperado').AsFloat) ,15));

               iIdContribAtual    := FieldByName('IDCONTRIBUICAO').AsInteger;
               if iIdContribAtual <> iIdContribAnterior
               then begin
                  sOpcoesContrib := sOpcoesContrib+#13+#10+
                                    PreparaStr(FieldByName('Nome').AsString    ,50)+
                                    PreparaStr(' '                                                   ,5)+
                                    PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE1').AsFloat) ,13)+
                                    PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE2').AsFloat) ,13)+
                                    PreparaStr(FormatFloat('#0.0000',FieldByName('VALORBASE3').AsFloat) ,7);
                  iIdContribAnterior := FieldByName('IDCONTRIBUICAO').AsInteger;
               end;
               Next;
            end;
         end;

         qryResultadoHST.Next;
      end;

      if bAlgumPagadorPatro
      then begin
         Add('(*) Contribuições Patronais. Estas contribuições serão enviadas para o CAP/CAR. ');
      end;

      // Mostrar opções de contribuições a cobrar
      if Trim(sOpcoesContrib) <> ''
      then begin
         Add('--------------------------------------------------------------------------------------------------');
         Add('=> OPÇÕES DE CONTRIBUIÇÕES A COBRAR  ');
         Add('--------------------------------------------------------------------------------------------------');
         Add('CONTRIBUIÇÃO                                           OPÇÃO 1      OPÇÃO 2      OPÇÃO 3 ');
         Add(sOpcoesContrib);
      end;

      Add('--------------------------------------------------------------------------------------------------');
      Add('                               APENAS PARA CONFERÊNCIA ');
      Add('--------------------------------------------------------------------------------------------------');
   end; // with
   frmAguarde.Apaga;
   frmMostraAux.ShowModal;
end;

function TfrmReaberturaBeneficio.AtualizaContribuicoes: Boolean;
Var
  sSQL : String;
begin
  Result := True;

  { Nas contribuições de assistido - FLGCOBRA = 0}
  sSQL := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 '+
          ' WHERE IDPESSJUR   = '+ IntToStr(iIdPessJur)   +
          ' AND   IDPLANOPREV = '+ IntToStr(iIdPlanoPrev) +
          ' AND   IDPESSOA    = '+ IntToStr(iIdTitular)   +
          ' AND   SEQPROPOSTA = '+ IntToStr(iSeqProposta) +
          ' AND   DATAINICIO >= TO_DATE('''+sDataInicioOriginal+''',''DD/MM/YYYY'') '+
          ' AND   DATAFINAL   = TO_DATE('''+sNovaDataFinal+''',''DD/MM/YYYY'') '+
          ' AND   IDCONTRIBUICAO IN ( SELECT CE.IDCONTRIBUICAO FROM CONTPREVEVENTO CE '+
          '                           WHERE  CE.IDEVENTOGERADOR = '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+')';
  If Not ExecutarQuery(qryAux, sSQL) Then Begin
    Result := False;
    Exit;
  End;

  { Nas contribuições de Ativo - FLGCOBRA = 1 e DATAFINAL = NUL}
  { Nas contribuições de assistido - FLGCOBRA = 0}
  sSQL := ' UPDATE CONTRIBPREVPARTP C1 SET FLGCOBRA = 1, DATAFINAL = NULL '+
          ' WHERE IDPESSJUR   = '+ IntToStr(iIdPessJur)   +
          ' AND   IDPLANOPREV = '+ IntToStr(iIdPlanoPrev) +
          ' AND   IDPESSOA    = '+ IntToStr(iIdTitular)   +
          ' AND   SEQPROPOSTA = '+ IntToStr(iSeqProposta) +
          ' AND   DATAINICIO <= TO_DATE('''+sDataInicioOriginal+''',''DD/MM/YYYY'') '+
          ' AND   DATAFINAL  <= TO_DATE('''+sDataFinalAnt+''',''DD/MM/YYYY'') '+
          ' AND   IDCONTRIBUICAO IN (SELECT CE.IDCONTRIBUICAO FROM CONTPREVEVENTO CE '+
          '                          WHERE  CE.IDEVENTOGERADOR = (SELECT E1.IDEVENTOGERADOR '+
          '                                                       FROM EVENTOSPREV E1 '+
          '                                                       WHERE E1.IDPESSOA = C1.IDPESSOA AND '+
          '                                                             E1.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev) +' AND '+ 
          '                                                             E1.DATAEVENTO = (SELECT MIN(E2.DATAEVENTO) '+
          '                                                                              FROM EVENTOSPREV E2 '+
          '                                                                              WHERE E2.IDPESSOA = C1.IDPESSOA AND '+
          '                                                                                    E2.IDPLANOPREV = '+ IntToStr(iIdPlanoPrev) +' AND '+
          '                                                                                    E2.IDEVENTOGERADOR <> '+qryProcesso.FieldByName('IDEVENTOGERADOR').AsString+
          '                                                                             )'+
          '                                                       )'+
          '                          )';

  If Not ExecutarQuery(qryAux, sSQL) Then Begin
    Result := False;
    Exit;
  End;

end; { AtualizaContribuicoes }


// edilaine - SOL 253577-17570 / PPM 989569 - inicio
procedure TfrmReaberturaBeneficio.GeraDemonstrativo(sDataHoraInicioProcesso : string;
                                                    sStatusDemonstrativo    : string = '' );       // edilaine - SOL 253577-18174 / PPM 1327585
var
  iIdReport : integer;
  sMensagem : String;
  sSituacao : string;
begin
  frmAguarde.Mostra('Preparando o Demonstrativo da '+sReabProrrog+' ...');

  // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
  {qryAux.close;
  qryAux.sql.Text := 'Select idreports from reports where idmodulo = 454 and name = ''Demonstrativos de Benefícios'' ';
  qryAux.Open;
  if not qryAux.IsEmpty then
  begin
    iIdReport := qryAux.Fields[0].AsInteger;
  }// edilaine - SOL 253577-18174 / PPM 1327585 - fim
    sSituacao := '';

    if sTipoReabertura = 'PR' then
    begin
      sSituacao := 'PRORROGADO. Os pagamentos e cobranças serão feitos na folha de manutenção.';
    end
    else
    begin
      if (Trim(sNovaDataFinal) <> '') and
         (Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2) <= sAnoMesPagamento)
      then
      begin
        if (Copy(sNovaDataFinal,7,4)+'/'+Copy(sNovaDataFinal,4,2) = sAnoMesPagamento)
        then begin
           if iFlgIncluiMesConc = 0 then
           begin
             sSituacao := '"Encerrado" pela Folha de Benefícios. Data Final coincide com o mês de pagamento.';
           end
           else
           begin
             if iFlgDataPrevista = 1 then
                sSituacao := '"Retido". Data Final Prevista já atingida.'
              else
                sSituacao := '"Encerrado". Data Final Efetiva já atingida.';
           end
        end
        else if iFlgDataPrevista = 1 then
        begin
          sSituacao := '"Retido". Data Final Prevista já atingida.';
        end
        else
        begin
          sSituacao := '"Encerrado". Data Final Efetiva já atingida.';
        end;
      end
      else
      begin
        sSituacao := 'Normal';
      end;
    end;

    // edilaine - SOL 253577-18174 / PPM 1327585 - inicio
    try
      RptDemonstraBeneficios :=  TRptDemonstraBeneficios.create(self);
      with RptDemonstraBeneficios do
      begin
        CmpRptCM.ParamValues[0].AsString  := 'Reabertura';
        CmpRptCM.ParamValues[1].AsString  := DateToStr(date);
        CmpRptCM.ParamValues[2].AsInteger := iNumeroProcesso;
        CmpRptCM.ParamValues[3].AsInteger := iIdLoteConcessao;
        CmpRptCM.ParamValues[4].AsString  := '';
        CmpRptCM.ParamValues[5].AsString  := sSituacao;
        CmpRptCM.ParamValues[6].AsString  := sDataHoraInicioProcesso;
        CmpRptCM.ParamValues[7].AsString  := '';
        CmpRptCM.ParamValues[8].AsInteger := qryBeneficiarios.FieldByName('IDPESSOA').AsInteger;
        CmpRptCM.ParamValues[9].AsInteger := qryBeneficiarios.FieldByName('IDPERFILINVEST').AsInteger;   //edilaine - SIG55933

        AbreConsultas();
        bTemPerfilInvest:= (sqlDemonstra.FieldByName('NOMEPERFIL').AsString <> EmptyStr); //Darivaldo Alencar SIG68133
        if (bTemPerfilInvest) then                                                        //Darivaldo Alencar SIG68133
          begin
            if sStatusDemonstrativo = '' then
               TFrmPreview.CreateModalPreview(Application, rpDemonstraBeneficios, 'Reabertura de Benefícios')
            else
               SalvarArquivoDemonstrativo();
          end
        else MsgDlg('Não há Perfil de Investimento vinculado ao Processo ' + sqlDemonstra.FieldByName('NUMEROPROCESSO').AsString +'. '+#13#10+ //Darivaldo Alencar SIG68133
                    'Favor regularizar para finalizar a Reabertura do Benefício.' ,'Informação',mtInformation,[mbOk,mbHelp],0);         //Darivaldo Alencar SIG68133
      end;
    finally
      RptDemonstraBeneficios.free;
    end;
    // edilaine - SOL 253577-18174 / PPM 1327585 - fim

   // edilaine - SOL 253577-18174 / PPM 1327585 - comentado inicio 
   { if not TRptDemonstraBeneficios.PrintReport(iIdReport,1, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo,
                                               sReabProrrog               + '|=| ' +   // tipo operacao
                                               DateToStr(date)            + '|=| ' +   // data
                                               IntToStr(iNumeroProcesso)  + '|=| ' +   // numprocesso
                                               IntToStr(iIdLoteConcessao) + '|=| ' +   // numLote
                                               ''                         + '|=| ' +   // Titulo Motivo
                                               sSituacao                  + '|=| ' +   // Situacao
                                               sDataHoraInicioProcesso    + '|=| ' +   // DtHora Inicio Processo
                                               ''                         + '|=| ' +   // Motivo
                                               qryBeneficiarios.FieldByName('IDPESSOA').AsString + '|   ', // idpessoa
                                               '',
                                               'BaseDados',
                                               Sistema.NomeEmpresa,
                                               Sistema.NomeModulo,
                                               sMensagem) then
       MsgDlg(sMensagem, 'Impressão do Demonstrativo de '+sReabProrrog+'.', mtError, [], 0);

  end;
  qryAux.close;
  }// edilaine - SOL 253577-18174 / PPM 1327585 - comentado fim

  frmAguarde.Apaga;

end;
// edilaine - SOL 253577-17570 / PPM 989569 - fim


end.