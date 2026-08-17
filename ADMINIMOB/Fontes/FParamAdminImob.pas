unit FParamAdminImob;
{
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172601/14639
Nº KINTANA..: 2019067
Data........: 11/10/2013
Responsável.: Felipe A. Santos
Descrição...: Foi criado os campos PathETLProducao e PathETLHOM para cadastrar
              o caminho do ETL.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 163982/7003
Nº KINTANA..: 1489901
Data........: 22/11/2011
Responsável.: Monica da Silva Gonzaga
Descrição...: Trazer somente as atividades/projetos ativos.
-----------------------------------------------------------------------------------------------------
}

// Ádler Souza   : 68478 / 22/04/2009
// Observação    : Alteração na Query qryLookCentroRespon, linstando apenas ativos.
// -----------------------------------------------------------------------------------------------------
// Daniel Simões : 19/04/2006
// Observação    : Mudei o Caption da CheckBox "DBCheckBox26" ( "Histórico Contábil (concatenado) diferente da
//                 observação da AP" ) para ( "Histórico Contábil (concatenado) diferente da observação do Documento" )
// -----------------------------------------------------------------------------------------------------
//
//	      Parâmetros do Sistema de Administração Imobiliária
//
//	Autor             :  André Pontes
//	Data de Início    :  26/01/1999
//	Data de Término   :  26/01/1999
//
//	Modificações      :  09/03/1999  1) Integração com Gestão de Investimentos e Ativo Fixo (só checkboxes)
//                      17/05/1999  2) Flags referentes ao uso preferencial da SubContas ligadas ao
//                                     Imóvel e ao Locatário
//                      24/05/1999  3) Tipos de Custos e Receitas associados a Venda / Aquisição de Cotas
//                      25/05/1999  4) Tipos de Operação ligados a Venda / Aquisição de Cotas
//                      24/08/1999  5) Exclusão dos itens (3) e (4)
//                      07/10/1999  6) Exclusão do item (2)
//                      07/01/2000  7) Cadastro dos Parâmetros de Investimento
//                      29/01/2000  8) Novos parâmetros ligados à alimentação de carteira
//                      25/05/2000  9) Uma série de novos parâmetros
//                                 10) Parâmetros ligados à alimentação da carteira "escondidos"
//                      03/08/2000 11) Tela totalmente refeita, com parâmetros novos
//                      18/12/2000 12) Novo parâmetro: IDTCUSTORECIMOCOM (Alex Pereira)
//                      09/01/2001 13) Novo parâmetro: FLGUSAAP (André Pontes)
//                      05/02/2001 14) Novos parâmetros: Centro de Custo e Programa (Andre Pontes)
//                      19/02/2001 15) Novo parâmetros: FlgReembolsoAut (Andre Pontes)
//                      23/02/2001 16) Novos parâmetros: FlgAluguelZERO e FlgConsideraResp (Andre Pontes)
//                      02/03/2001 17) Eliminado a funcionalidade do campo FlgConsideraResp (Alex Pereira)
//                                     Para o campo acima será utilizado o FlgReembolsoAut
//                      19/02/2004 18) Acrescentado parâmetro para permitir lançamentos contábeis fora
//                                     do período gerencial. (Marcio Motta)
//
// -----------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------
//
//       Parâmetros:
//
//    IDPESSOA          :  Empresa Proprietária
//
//    CODCENTRORESPON   :  Centro de Responsabilidade default p/ Receitas e Despesas de Imóveis
//    UNIDNEGOC         :  Atividade/Projeto default p/ Receitas e Despesas de Imóveis
//    CODPORTFORMA      :  Portador-Forma default p/ Receitas e Despesas de Imóveis
//
//    FLGINTEGRACONTAB  :  Indica se o Sistema se integra com Contabilidade
//    FLGINTEGRACAPCAR  :  Indica se o Sistema se integra com Contas a Pager e Receber
//    FLGINTEGRAGESTAO  :  Indica se o Sistema se integra com Investimentos / Gestão de Investimentos
//    FLGINTEGRAATIVO   :  Indica se o Sistema se integra com Ativo Fixo
//
//    FLGUSASCIMOVEL    :  Obriga o uso de SubConta (SC) ligada ao Imóvel
//    FLGUSASCLOCATARIO :  Obriga o uso de SubConta (SC) ligada ao Locatário
//
//    FLGALIMENTADEPREC :  Indica se a depreciação alimenta Carteira
//    FLGALIMENTAALTER  :  Indica se alteradores alimentam Carteira
//    FLGALIMENTADATA   :  Indica em que data a Carteira deve ser Alimentada
//                            | 'E' - na data de efetivo pagamento / recebimento (Baixa)
//                            | 'V' - na data de vencimento
//
//    FLGEXIBELABELCOBR :  Indica se deve ser exibido o label "Gerar Cobrança Automática..." no Contrato
//    FLGOBRIGATIVIDADE :  Indica se é obrigatória a indicação da Atividade do Locatário no Contrato
//    PRAZOAVISO        :  Indica se o prazo de antecedência para aviso das datas contratuais
//                         (para preenchimento automático)
//    FLGSUGERECONTRATO :  Indica se o número do Contrato deve ser sugerido
//    FLGCONCATENAANO   :  Indica se o deve-se concatenar o ano corrente ao número sugerido para o Contrato
//    FLGUSAATIVIDADE   :
//    FLGAUTORESCISAO   :  Indica o comportamento dos Contratos ao se atingir a data de fim
//                            | '0' - prorrogação por tempo indetermindado
//                            | '1' - rescisão automática
//
//    FLGGERATXADMIN    :  Indica se a Taxa de Administração deve ser calculada e gerada quando da Folha de Aluguéis
//    QTDEMESPREVFOLHA  :  Indica se o Sistema integra com Contabilidade
//    FLGMESPOSTERIOR   :  Indica se se deve impedir que a Folha seja executada p/ mês posterior ao atual
//
//    FLGINTEGRAFOLHA   :  (?)
//    FLGINTEGRARECEB   :  (?)
//    FLGINTEGRAPAG     :  (?)
//
//    NOMEVLRAQUISICAO  :  Indica o nome do label "Valor de Aquisição" ao longo do sistema (Desativado)
//
//    FLGREAVALMERCADO  :  (?)
//
//    FLGOBRIGACONTRATO :  Indica se é obrigatório indicar o idContrato nos lançamentos A PAGAR
//    FLGLANCPAGENCERRA :  Indica se é permitido indicar Contratos ENCERRADOS nos lançamentos A PAGAR
//    FLGLANCRECENCERRA :  Indica se é permitido indicar Contratos ENCERRADOS nos lançamentos A RECEBER
//
//    FLGLANCRESCINDIDO :  Indica se é permitido indicar um contrato já rescindido no Lançamento
//    FLGCOMISSAOALT    :  Indica como deve ser lançada a taxa de administração: como alterador ou
//                            | '0' - como alterador do lançamento do aluguel
//                            | '1' - como um lançamento à parte
//    IDTCUSTORECIMOCOM :  Tipo de despesa da Comissão (de acordo com o parâmetro acima)
//    FLGUSAAP          :  Indica se é obrigatório o preenchimento dos campos necessários às APs
//    FLGCONSIDERARESP  :  Indica se se deve levar em conta o responsável por uma despesa quando do lançamento
//    FLGREEMBOLSOAUT   :  Define o que fazer quando se tenta um lançamento de despesa originalmente de
//                         responsabilidade do Locatário
//                            | '0' - não permite o lançamento
//                            | '1' - lança automaticamente o reembolso
//
//    FLGALUGUELZERO    :  Indica se é permitido o cadastro de aluguéis ZERADOS para imóveis e se a Folha
//                         deve fazer essa crítica
//
//    FLGALTERAEVENTO   :  Indica se é permitido a um usuário alterar/excluir eventos "automáticos"
//                         gerados pelo Sistema
//    FLGEVENTOUSUARIO  :  Indica se é permitido a um usuário alterar/excluir eventos não cadastrados
//                         pelo mesmo
//
//    FLGLANCFORACOMP   : Indica se é permitido efetuar lançamentos contábeis fora da competência gerencial
//    FLGATUALDATAPROG  : Indica se a data programada será atualizada no processo de contabilizaçào diária
//
//    FLGBLOQDTLANC     : Indica se é permitido ao usuário realizar um lançamento após a data de vencimento do mesmo
// -----------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook,
  DBCtrls, IvDictio, IvMulti, IvEMulti, Mask, wwdbedit, Wwdbspin,
  CmEventosCadastro, ImgList, Wwdotdot, Wwdbcomb, DBClient,
  uCMClientDataSet, uCtrlGrpRegra, mRegraDB, uModuloImobiliario;

type
  TfrmParamAdminImob = class(TfrmCadastroCS)
    pgcParametros: TPageControl;
    qryLookUnidNegocio: TwwQuery;
    qryLookCentroRespon: TwwQuery;
    qryLookUnidNegocioUNIDNEGOC: TFloatField;
    qryLookUnidNegocioNOME: TStringField;
    qryLookCentroResponCODCENTRORESPON: TStringField;
    qryLookCentroResponNOME: TStringField;
    qryLookPortadorForma: TwwQuery;
    qryLookPortadorFormaCODPORTFORMA: TFloatField;
    qryLookPortadorFormaDESCRICAO: TStringField;
    qryParamGlobal: TwwQuery;
    qryLookPrograma: TwwQuery;
    tbsGeral: TTabSheet;
    tbsContratos: TTabSheet;
    tbsFolha: TTabSheet;
    Label10: TLabel;
    GroupBox4: TGroupBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    qryCODCENTRORESPON: TStringField;
    qryUNIDNEGOC: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryFLGINTEGRACONTAB: TFloatField;
    qryFLGINTEGRACAPCAR: TFloatField;
    qryFLGINTEGRAGESTAO: TFloatField;
    qryFLGINTEGRAATIVO: TFloatField;
    qryFLGUSASCIMOVEL: TFloatField;
    qryFLGUSASCLOCATARIO: TFloatField;
    qryFLGALIMENTAALTER: TFloatField;
    qryFLGALIMENTADATA: TStringField;
    qryFLGALIMENTADEPREC: TFloatField;
    qryFLGSUGERECONTRATO: TFloatField;
    qryFLGCONCATENAANO: TFloatField;
    qryFLGAUTORESCISAO: TFloatField;
    qryFLGOBRIGATIVIDADE: TFloatField;
    qryFLGINTEGRARECEB: TFloatField;
    qryFLGINTEGRAPAG: TFloatField;
    qryNOMEVLRAQUISICAO: TStringField;
    qryFLGINTEGRAFOLHA: TFloatField;
    qryFLGGERATXADMIN: TFloatField;
    qryQTDEMESPREVFOLHA: TFloatField;
    qryFLGMESPOSTERIOR: TFloatField;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    qryIDPESSOA: TFloatField;
    qryPROXNUMCONTRATO: TFloatField;
    qryFLGVENCDIAUTIL: TFloatField;
    tbsLancamento: TTabSheet;
    qryFLGREAVALMERCADO: TFloatField;
    qryFLGOBRIGACONTRATO: TFloatField;
    qryFLGCOMISSAOALT: TFloatField;
    qryFLGLANCRESCINDIDO: TFloatField;
    qryIDTCUSTORECIMOCOM: TFloatField;
    qryFLGUSAAP: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    qryIDPROGRAMA: TFloatField;
    qryLookProgramaIDPROGRAMA: TFloatField;
    qryLookProgramaCODPROGRAMA: TStringField;
    qryLookProgramaDESCPROGRAMA: TStringField;
    qryFLGREEMBOLSOAUT: TFloatField;
    qryFLGLANCRECENCERRA: TFloatField;
    qryFLGLANCPAGENCERRA: TFloatField;
    qryFLGCONSIDERARESP: TFloatField;
    qryFLGALUGUELZERO: TFloatField;
    qryFLGDIAUTILAP: TStringField;
    qryFLGFILTRAREAJUSTE: TFloatField;
    qryFLGFILTRAENCERRA: TFloatField;
    tbsIntegra: TTabSheet;
    qryFLGALTERAEVENTO: TFloatField;
    qryFLGEVENTOUSUARIO: TFloatField;
    TabSheet1: TTabSheet;
    qryFLGPARTPIM: TFloatField;
    qryFLGPARTPDES: TFloatField;
    qryFLGPARIM: TFloatField;
    qryFLGPARCON: TFloatField;
    qryFLGPARTDTPIM: TFloatField;
    qryFLGPARTDIM: TFloatField;
    qryFLGPARTDCON: TFloatField;
    qryFLGMULTITIPO: TFloatField;
    qryFLGHISTCONTDIFAP: TFloatField;
    qryFLGDIARIO: TStringField;
    qryMESCOMPETENCIA: TFloatField;
    qryANOCOMPETENCIA: TFloatField;
    qryFLGUSAINVESTIMOB: TStringField;
    qryFLGLANCRECINATIVO: TFloatField;
    qryMESBLOQLANCTO: TFloatField;
    qryIDTCUSTORECIMOALU: TFloatField;
    pnlIntegra: TPanel;
    Label14: TLabel;
    CheckBox1: TDBCheckBox;
    CheckBox5: TDBCheckBox;
    CheckBox3: TDBCheckBox;
    panDiario: TPanel;
    Label5: TLabel;
    dbchkDiario: TDBCheckBox;
    cboMes: TwwDBComboBox;
    DBspnAno: TwwDBSpinEdit;
    cbInvestImob: TDBCheckBox;
    pnlPadrao: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label15: TLabel;
    DBcboCentroRespon: TwwDBLookupCombo;
    DBcboUnidNegocios: TwwDBLookupCombo;
    DBcboPortadorForma: TwwDBLookupCombo;
    DBcboLookCentroCusto: TwwDBLookupCombo;
    DBcboPrograma: TwwDBLookupCombo;
    dbCboTipoReceitaAluguel: TwwDBLookupCombo;
    pnlContratos: TPanel;
    DBrdgAutoRescisao: TDBRadioGroup;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    pnlFolha: TPanel;
    Label11: TLabel;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    grpComissao: TGroupBox;
    Label16: TLabel;
    cboComissaoLanc: TwwDBLookupCombo;
    DBrdgComissao: TDBRadioGroup;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    pnlLanca: TPanel;
    lblBloqueio1: TLabel;
    lblBloqueio2: TLabel;
    DBrdgResponsavel: TDBRadioGroup;
    GroupBox3: TGroupBox;
    DBCheckBox12: TCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    b: TGroupBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    spnMesBloq: TwwDBSpinEdit;
    pnlParam: TPanel;
    GroupBox2: TGroupBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    qryFLGLANCPAGINATIVO: TStringField;
    DBCheckBox27: TDBCheckBox;
    qryFLGINTEGRAORCAMEN: TFloatField;
    dbcbIntegraOrcamento: TDBCheckBox;
    qryFLGAVISO: TStringField;
    tbsCarta: TTabSheet;
    pnlAvisos: TPanel;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    qryTIPOIMOVELPATRO: TStringField;
    GroupBox8: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    wwDBSpinEdit3: TwwDBSpinEdit;
    DBCheckBox2: TDBCheckBox;
    qryIDGRUPOREGRA: TFloatField;
    GroupBox9: TGroupBox;
    cdsGrpRegra: TCMClientDataSet;
    cdsGrpRegraDESCRICAO: TStringField;
    cdsGrpRegraIDGRUPOREGRA: TFloatField;
    dblcGrpRegra: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    Label13: TLabel;
    wwDBSpinEdit2: TwwDBSpinEdit;
    Label9: TLabel;
    dbrgPrevFolha: TDBRadioGroup;
    qryFLGPREVFOLHA: TFloatField;
    tsOperacoes: TTabSheet;
    qryLookTipoOper: TwwQuery;
    qryLookTipoOperDESCCUSTORECIMO: TStringField;
    qryLookTipoOperIDTIPOCUSTORECIMO: TFloatField;
    qryLookTipoOperRECCUSTO: TStringField;
    qryLookTipoOperCODTIPDOC: TFloatField;
    qryLookTipoOperFLGOBRIGAORC: TFloatField;
    qryLookTipoOperIDTIPODESPESA: TFloatField;
    qryLookTipoOperFLGDIARIO: TStringField;
    pnlOperacao: TPanel;
    qryIDOPERATUALMULTA: TFloatField;
    qryIDOPERATUALJUROS: TFloatField;
    qryIDOPERATUALCM: TFloatField;
    qryIDOPERPROVPER: TFloatField;
    DBchkUsaAP: TDBCheckBox;
    DBchkDiaUtilAP: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    qryIDOPERPROVREC: TFloatField;
    dbCkbLogotipo: TDBCheckBox;
    qryFLGLOGORELAT: TStringField;
    DBCheckBox29: TDBCheckBox;
    qryIDCARTACOBRANCA1: TFloatField;
    qryIDCARTACOBRANCA2: TFloatField;
    qryIDCARTACOBRANCA3: TFloatField;
    qryIDCARTACOBRANCA4: TFloatField;
    Label8: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    wwDBLookupCombo8: TwwDBLookupCombo;
    wwDBLookupCombo9: TwwDBLookupCombo;
    wwDBLookupCombo10: TwwDBLookupCombo;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    qryCartaCobranca: TwwQuery;
    qryCartaCobrancaIDCARTACOBRANCA: TFloatField;
    qryCartaCobrancaMODELOCARTA: TStringField;
    qryCartaCobrancaIDREPORTS: TFloatField;
    qryCartaCobrancaORIGEMCM: TFloatField;
    qryCartaCobrancaFLGTIPOCARTA: TStringField;
    qryFLGLANCFORACOMP: TStringField;
    dbrdgrpCalculoInsadimp: TDBRadioGroup;
    qryFLGCALCINADIMP: TStringField;
    molRegraDB: TmolRegraDB;
    qryIDREGRAMULTA: TFloatField;
    qryNOMEREGRA: TStringField;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    qryFLGBLOQRECALUGUEL: TFloatField;
    qryFLGATUALDATAPROG: TFloatField;
    qryFLGTIPODATAPROG: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label3: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBLookupCombo6: TwwDBLookupCombo;
    wwDBLookupCombo7: TwwDBLookupCombo;
    DBCheckBox30: TDBCheckBox;
    Label7: TLabel;
    Label12: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBLookupCombo4: TwwDBLookupCombo;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    wwDBLookupCombo11: TwwDBLookupCombo;
    wwDBLookupCombo12: TwwDBLookupCombo;
    wwDBLookupCombo13: TwwDBLookupCombo;
    qryIDOPERABONOMULTA: TFloatField;
    qryIDOPERABONOJUROS: TFloatField;
    qryIDOPERABONOCM: TFloatField;
    GroupBox5: TGroupBox;
    cbPermiteAlteracao: TDBCheckBox;
    dbrdgrpProcessoCorrecao: TDBRadioGroup;
    qryFLGINDMESANTERIOR: TFloatField;
    qryMASCARACOMPL: TStringField;
    Label29: TLabel;
    GbAtividadeProjeto: TGroupBox;
    Label28: TLabel;
    dbedMascaraAP: TwwDBEdit;
    GroupBox6: TGroupBox;
    DBCheckBox17: TDBCheckBox;
    qryFLGREGEVENTO: TFloatField;
    qryFLGBLOQDTLANC: TFloatField;
    qryFLGUSAUNIDADE: TFloatField;
    DBCheckBox31: TDBCheckBox;
    Label6: TLabel;
    GroupBox11: TGroupBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    qryFLGAUTCOD: TStringField;
    qryFLGVALCOD: TStringField;
    grbPathETL: TGroupBox;
    lblPathETLProducao: TLabel;
    lblPathETLHomologacao: TLabel;
    dbedtPathETLProducao: TwwDBEdit;
    dbedtPathETLHom: TwwDBEdit;
    qryPATHETLHOM: TStringField;
    qryPATHETLPRODUCAO: TStringField;

    // procedimentos definidos
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);

    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);

    procedure Sel(iEmpresaProp: integer);

    procedure PreencheDefaults;
    function VerificaPreenchimento: boolean;

    procedure AbreQueries(i: integer);
    procedure FechaQueries;

    // outros procedimentos
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBrdgComissaoClick(Sender: TObject);
    procedure dbchkDiarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure molRegraDBbtnBuscaRegraClick(Sender: TObject);


  private { Private declarations }
    CtrlGrpRegra : TCtrlGrpRegra;

    sFiltro      : String;

  public { Public declarations }

  end;

var
  frmParamAdminImob: TfrmParamAdminImob;

implementation
{$R *.DFM}
Uses
  USistema, UMensErro, UDatabase, DBaseDados, UComunsImobiliario, uVerificaPreenchimento,
  FPrincipal, uFuncoesImob, dLookImobiliario, dImobiliario;


procedure TfrmParamAdminImob.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   // só permite alteração
   sbtnInserir.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
   sbtnAlterar.Enabled  := True;
end;



procedure TfrmParamAdminImob.CmeCadastroEdit(Sender: TObject);
begin
   // o primeiro Edit na query será um Insert
   if (qry.IsEmpty) then begin
      qry.Insert;
      qryIDPESSOA.AsInteger := Sistema.idEmpresa;
   end else begin
      inherited; 
   end;

   // habilita paineis das guias
   pnlIntegra.Enabled   := True;
   pnlContratos.Enabled := True;
   pnlFolha.Enabled     := True;
   pnlLanca.Enabled     := True;
   pnlPadrao.Enabled    := True;
   pnlParam.Enabled     := True;
   pnlAvisos.Enabled    := True;
   pnlOperacao.Enabled  := True;   

   // Preenche valores default --------------------------------------------------------------------------
   if qry.State in dsEditModes then PreencheDefaults;
end;



procedure TfrmParamAdminImob.Sel(iEmpresaProp: integer);
begin
   with qry do begin
      LimpaParametros(qry);
      ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
      Open;
   end;
end;



procedure TfrmParamAdminImob.CmeCadastroConfirma(Sender: TObject);
begin
   // Obriga alguns valores ------------------------------------------------------------------------------
   if VerificaPreenchimento then
   begin
      if qry.State in dsEditModes then
      begin
         qryFLGINTEGRAATIVO.AsInteger      := 1;
         qryFLGINTEGRACONTAB.AsInteger     := 1;
         qryFLGINTEGRACAPCAR.AsInteger     := 1;
         qryFLGALIMENTADEPREC.AsInteger    := 1;
         qryFLGALIMENTAALTER.AsInteger     := 0;
         qryFLGALIMENTADATA.AsString       := 'V';
         qryFLGCONSIDERARESP.AsInteger     := 1; // Marcio Motta - 12/02/2004

         // Preenche o que ainda tiver sido indicado -------------------------------------------------------
         PreencheDefaults;

         // verifica a empresa do Centro de Custo
         if qryCODCENTROCUSTO.IsNull then
         begin
            qryIDEMPRESA.Clear;
         end
         else
         begin
            qryIDEMPRESA.AsInteger := Sistema.idEmpresa;
         end;
      end;

      inherited;
   end;
end;



procedure TfrmParamAdminImob.PreencheDefaults;
begin
   if qryFLGINTEGRAATIVO.isNULL     then qryFLGINTEGRAATIVO.AsInteger      := 1;
   if qryFLGINTEGRACONTAB.isNULL    then qryFLGINTEGRACONTAB.AsInteger     := 1;
   if qryFLGINTEGRACAPCAR.isNULL    then qryFLGINTEGRACAPCAR.AsInteger     := 1;

   if qryFLGALIMENTADEPREC.isNULL   then qryFLGALIMENTADEPREC.AsInteger    := 1;
   if qryFLGALIMENTAALTER.isNULL    then qryFLGALIMENTAALTER.AsInteger     := 0;
   if qryFLGALIMENTADATA.isNULL     then qryFLGALIMENTADATA.asString       := 'V';

   if qryFLGUSASCIMOVEL.isNULL      then qryFLGUSASCIMOVEL.AsInteger       := 0;
   if qryFLGUSASCLOCATARIO.isNULL   then qryFLGUSASCLOCATARIO.AsInteger    := 0;

   if qryFLGOBRIGATIVIDADE.isNULL   then qryFLGOBRIGATIVIDADE.AsInteger    := 0;

   if qryFLGSUGERECONTRATO.isNULL   then qryFLGSUGERECONTRATO.AsInteger    := 0;
   if qryFLGCONCATENAANO.isNULL     then qryFLGCONCATENAANO.AsInteger      := 0;
   if qryFLGAUTORESCISAO.isNULL     then qryFLGAUTORESCISAO.AsInteger      := 0;

   if qryFLGGERATXADMIN.isNULL      then qryFLGGERATXADMIN.AsInteger       := 1;
   if qryFLGCOMISSAOALT.isNULL      then qryFLGCOMISSAOALT.AsInteger       := 0;
   if qryQTDEMESPREVFOLHA.isNULL    then qryQTDEMESPREVFOLHA.AsInteger     := 0;
   if qryFLGMESPOSTERIOR.isNULL     then qryFLGMESPOSTERIOR.AsInteger      := 1;
   if qryFLGVENCDIAUTIL.isNULL      then qryFLGVENCDIAUTIL.AsInteger       := 0;

   if qryFLGOBRIGACONTRATO.isNULL   then qryFLGOBRIGACONTRATO.AsInteger    := 1;
   if qryFLGLANCRESCINDIDO.isNULL   then qryFLGLANCRESCINDIDO.AsInteger    := 1;

   if qryFLGALTERAEVENTO.isNULL     then qryFLGALTERAEVENTO.AsInteger      := 0;
   if qryFLGEVENTOUSUARIO.isNULL    then qryFLGEVENTOUSUARIO.AsInteger     := 0;

   if qryFLGATUALDATAPROG.isNull    then qryFLGATUALDATAPROG.AsInteger     := 0;

   if qryFLGINDMESANTERIOR.isNull   then qryFLGINDMESANTERIOR.AsInteger    := 0; // Daniel - 22693

   if qryFLGREGEVENTO.IsNull        then qryFLGREGEVENTO.AsInteger         := 0; // Daniel - 21413

   if qryFLGBLOQDTLANC.IsNull       then qryFLGBLOQDTLANC.AsInteger        := 0; // Daniel - 22688

   if qryFLGUSAUNIDADE.IsNull       then qryFLGUSAUNIDADE.AsInteger        := 0; // Daniel - 24085
end;



function TfrmParamAdminImob.VerificaPreenchimento: boolean;
begin
// Código comentado por não estar sendo utilizado temporariamente
// Marcio Motta - 06/02/2004

   Result := True;
end;



procedure TfrmParamAdminImob.AbreQueries(i: integer);
begin
   with qryLookCentroRespon do begin
      LimpaParametros(qryLookCentroRespon);
      Params[0].AsInteger := i;
      Open;
   end;

   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
      Params[0].AsInteger := i;
      Open;
   end;

   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      ParamByName('PRECCUSTO').AsString  := 'R';
      Open;
   end;

   with dtmLookImobiliario.qryLookTipoImovel do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
      Open;
   end;

   with qryLookUnidNegocio do begin
      LimpaParametros(qryLookUnidNegocio);
      Params[0].AsInteger := i;
      Open;
   end;

   with qryLookPortadorForma do begin
      LimpaParametros(qryLookPortadorForma);
      Params[0].AsInteger := i;
      Open;
   end;

   with qryLookTipoOper do begin
      LimpaParametros(qryLookTipoOper);
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      ParamByName('PRECCUSTO').AsString  := 'O';
      Open;
   end;

   with qryCartaCobranca do begin
      LimpaParametros(qryCartaCobranca);
      Open;
   end;

   Sel(i);

   qryLookPrograma.Open;
end;



procedure TfrmParamAdminImob.FechaQueries;
var i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLookImobiliario.qryLookCentroCusto.Close;
   dtmLookImobiliario.qryLookTipoRecDes.Close;

   // força o fechamento dos parâmetros do sistema para atualizar flags em outras telas.
   if dtmImobiliario.qryParamImob.Active then dtmImobiliario.qryParamImob.Close;
end;



procedure TfrmParamAdminImob.FormShow(Sender: TObject);
begin
   inherited;

   pnlFundo.Enabled     := True;
   pnlIntegra.Enabled   := False;
   pnlContratos.Enabled := False;
   pnlFolha.Enabled     := False;
   pnlLanca.Enabled     := False;
   pnlPadrao.Enabled    := False;
   pnlParam.Enabled     := False;
   pnlAvisos.Enabled    := False;
   pnlOperacao.Enabled  := False;

   sFiltro := molRegraDB.MS_Regra.Filtro.Text;

   // Pendência 19522 - Marcos Topini
   // Passar a habililitar o flag 'Integera com Orçamento', independente
   // do usuário que se loga
   dbcbIntegraOrcamento.Enabled := True;

   pgcParametros.ActivePage := tbsIntegra;
   Application.ProcessMessages;

   // filtra pela Empresa Proprietária
   AbreQueries(Sistema.idEmpresa);

   if qryFLGCOMISSAOALT.AsInteger = 0 then cboComissaoLanc.Enabled := True;

   // Habilita as informações referentes a contabilização diária
   lblBloqueio1.Visible   := dbChkDiario.Checked;
   lblBloqueio2.Visible   := dbChkDiario.Checked;
   spnMesBloq.Visible     := dbChkDiario.Checked;
   tsOperacoes.TabVisible := dbChkDiario.Checked;
end;



procedure TfrmParamAdminImob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   FreeAndNil( CtrlGrpRegra );
   // chama a procedure AposLogin para atualizar as variáveis do Modulo
   ModuloImobiliario.AdminImob.GetParam( Sistema.idEmpresa );

   inherited;

end;



procedure TfrmParamAdminImob.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   pgcParametros.ActivePage := tbsIntegra;

   pnlFundo.Enabled     := True;
   pnlIntegra.Enabled   := False;
   pnlContratos.Enabled := False;
   pnlFolha.Enabled     := False;
   pnlLanca.Enabled     := False;
   pnlPadrao.Enabled    := False;
   pnlParam.Enabled     := False;
   pnlAvisos.Enabled    := False;
   pnlOperacao.Enabled  := False;    
end;



procedure TfrmParamAdminImob.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   pgcParametros.ActivePage := tbsIntegra;

   pnlFundo.Enabled     := True;
   pnlIntegra.Enabled   := False;
   pnlContratos.Enabled := False;
   pnlFolha.Enabled     := False;
   pnlLanca.Enabled     := False;
   pnlPadrao.Enabled    := False;
   pnlParam.Enabled     := False;
   pnlAvisos.Enabled    := False;
   pnlOperacao.Enabled  := False;
end;



procedure TfrmParamAdminImob.DBrdgComissaoClick(Sender: TObject);
begin
   if qry.State in dsEditModes then begin
      if qryFLGCOMISSAOALT.AsInteger = 1 then begin
         qryIDTCUSTORECIMOCOM.Clear;
         cboComissaoLanc.Enabled := False;
      end else begin
         cboComissaoLanc.Enabled := True;
      end;
   end;
end;



procedure TfrmParamAdminImob.dbchkDiarioClick(Sender: TObject);
begin
   inherited;

   lblBloqueio1.Visible    := dbChkDiario.Checked;
   lblBloqueio2.Visible    := dbChkDiario.Checked;
   spnMesBloq.Visible      := dbChkDiario.Checked;
   tsOperacoes.TabVisible  := dbChkDiario.Checked;
end;



procedure TfrmParamAdminImob.FormCreate(Sender: TObject);
begin
   inherited;

   CtrlGrpRegra := TCtrlGrpRegra.Create;

   CtrlGrpRegra.Initialize(dtmBaseDados.dbBaseDados,
                           True,
                           Sistema.ConnectionType,
                           Sistema.ConnectionSide,
                           Sistema.AppRemoteServer,
                           True,
                           ComunsImobiliario.MensErroMT
                          );

   cdsGrpRegra.Data := CtrlGrpRegra.ListaGrpRegra;
end;



procedure TfrmParamAdminImob.molRegraDBbtnBuscaRegraClick(Sender: TObject);
begin
   inherited;

   molRegraDB.MS_Regra.Filtro.Add('TR.IDGRUPOREGRA = ' + qryIDGRUPOREGRA.AsString);
   molRegraDB.btnBuscaRegraClick(Sender);
   molRegraDB.MS_Regra.Filtro.Text := sFiltro;
end;



end.
