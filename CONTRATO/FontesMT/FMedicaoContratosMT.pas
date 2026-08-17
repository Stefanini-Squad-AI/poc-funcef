{-------------------------------------------------------------------------------
------------------------- ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------
-------------------------------------------------------------------------------------
N.WO............: WO39052
Data............: 28/05/2026
Responsável.....: Paulo Nobre
Descrição.......: .Ajustes na mensagem de aviso sobre o saldo negativo.
                  .Ajustes para aprimorar as criticas de realizar o pagamento de
                   uma medição sem o devido saldo suficiente para isso.
-------------------------------------------------------------------------------------
N.WO............: WO30552
Data............: 09/01/2026
Responsável.....: Paulo Nobre
Descrição.......: Na regra que altera as datas dos alteradores da AP, quando
                  da alteração da data de lançamento da medição, foi incluso
                  regra pra só alterar a data do alterador quando este for um
                  alterador de codnatureza: 1708 - IRRF S/ SERVICOS TERCEIROS
                  - PJ..   
--------------------------------------------------------------------------------
N.WO............: WO15750 (WO15652 e WO15653)
Data............: 10/12/2024
Responsável.....: Paulo Nobre
Descrição.......: .Implementado recurso para a inclusão de uma identificação de
                  qual tipo de documento estará na combo lista de  
                  Serviço/Produto: "Contrato e/ou Aditamento".
                  .Foi incorporado a esta demanda o solicitado na WO15653:
                  Impossibilitar que as medições ultrapassem o valor do
                  "saldo a pagar" de cada contrato. Contudo, se a marcação de NÃO
                  SE APLICA estiver preenchida, no campo de vlr orçado/aprovado,
                  a referida regra não se aplicará, ou seja, a COFIN poderá
                  prosseguir com os pagamentos.
--------------------------------------------------------------------------------
Rotina .......: (dfm edNumFDO maskedit) 
N. Atender....: WO18371
Dt Alteração..: 24/01/2025
Responsável...: Edilaine
Descrição.....: Na máscara do FDO, permitir informar o mês/parcela com 2 digitos
--------------------------------------------------------------------------------
N. Atender....: WO15134
Dt Alteração..: 28/10/2024
Responsável...: Paulo Nobre
Descrição.....: Permitir o lançamento de multiplos FDOs para um item do contrato
--------------------------------------------------------------------------------
N. Atender....: WO11853 - Contas a Pagar - Nota Fiscal Contrato x Contas a Pagar
Dt Alteração..: 28/06/2024
Responsável...: Arnaldo Vicente Scarin
Descrição.....: Inclusão do Update dos dados da Nota Fiscal ao gerar uma
                medição do contrato, para que não seja necessário fazer a
                rotina de atualização de nota fiscal no Contas a Pagar
--------------------------------------------------------------------------------
N. Atender....: WO 8227
Dt Alteração..: 07/03/2024
Responsável...: Helen V Bianchi
Descrição.....: Correção da Tributação quando alterado as Dt Medição e Vencimento
--------------------------------------------------------------------------------
N. Solicitação: WO 3185
Dt Alteração..: 22/09/2023
Responsável...: Everson Cunha
Descrição.....: Alteração de label na aba Nota Fiscal de Serviço
                De: Empresa optante pelo Simples Nacional
                Para: Empresa isenta de tributação ou optante pelo Simples
                Nacional
                Pedido Leo Wagner CONTAB
--------------------------------------------------------------------------------
N. Atender....: WO 2795
Dt Alteração..: 11/09/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Correção no cálculo de impostos retidos.
--------------------------------------------------------------------------------
N. Atender....: WO 2824
Dt Alteração..: 08/09/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Retirada de função que calculava automaticamente impostos retidos.
--------------------------------------------------------------------------------
N. Solicitação: WO 2626
Dt Alteração..: 01/09/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Adequação do processo de lançamento de tributação,
                não permitindo o lançamento de outros alteradores.
--------------------------------------------------------------------------------
N. Solicitação: WO 2522
Dt Alteração..: 28/08/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Correção no lançamento de alteradores de tributação.
--------------------------------------------------------------------------------
N. Solicitação.....: WO 1728
Dt Alteração.......: 02/08/2023
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Adaptações para as definições de tipo de serviços.
--------------------------------------------------------------------------------
N. SIG........: 136888
Dt Alteração..: 23/06/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Inclusão de opção para definição de optante pelo Simples Nacional.
--------------------------------------------------------------------------------
N. SIG........: 135203
Dt Alteração..: 02/05/2023
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Verificação de existência de serviços cadastrados para validação.
--------------------------------------------------------------------------------
N. SIG........: 133236
Dt Alteração..: 27/04/2023  
Responsável...: Cássio Florencio Rovaroto
Descrição.....: Inclusão do tratamento de tributação de notas fiscais de serviço.
--------------------------------------------------------------------------------
N. SIG........: 134176
Dt Alteração..: 29/03/2023
Responsável...: Cássio Rovaroto
Descrição.....: Correção no lançamento de medição, em casos de primeiro
                lançamento do contrato.
--------------------------------------------------------------------------------
Rotina.............: btnRateioFDOClick
N. SIG.............: 128497
Data da Alteração..: 26/08/2022
Responsável........: Everson Cunha
Descrição..........: Variavel fResiduo deve ser decrementada com os registros
                     apenas para a parcela que está sendo paga.
--------------------------------------------------------------------------------
N. SIG........: 96275
Dt Alteração..: 10/11/2021
Responsável...: Everson Cunha
Descrição.....: Criação do campo Mês/Ano Referência
--------------------------------------------------------------------------------
Rotina.............: btnRateioFDOClick, ApresentaRateio
N. SIG.............: 117244
Data da Alteração..: 29/06/2021
Responsável........: Edilaine
Descrição..........: Ajuste integração com FDO Digital para rateio na medição
--------------------------------------------------------------------------------
Rotina.............: (dfm gbFDO) btnRateioDifClick, btnRateioFDOClick,
                     dsDetDataChange, sbtnAltDetClick, sbtnInsDetClick,
                     edNumFDOKeyPress
N. SIG.............: 115595
Data da Alteração..: 20/05/2021
Responsável........: Edilaine
Descrição..........: Integração com FDO Digital para rateio de lançamentos
--------------------------------------------------------------------------------
Rotina.............: VerificaProcessoSuspensao, FormCreate,
                     CmeDetalheBeforeConfirma, CmeDetalheEdit, dblcObjetoExit,
                     VerificaServicoMaoDeObra
N. SIG.............: 115585
Data da Alteração..: 18/05/2021
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Retirada dos campos tipos de serviços e processo juudicial
                     do lançamento da medição.
--------------------------------------------------------------------------------
Rotina.............: btnRateioDifClick
N. SIG.............: 111898
Data da Alteração..: 08/01/2021
Responsável........: Edilaine
Descrição..........: Divergencia entre o rateio da mediçao x documento gerado
--------------------------------------------------------------------------------
Rotina.............: dblcContratoChange
N. SIG.............: 111914
Data da Alteração..: 17/12/2020
Alteração Form.....: cdsRateioAux
Responsável........: Edilaine
Descrição..........: nao estava preenchendo array de multiplas contas passado
                     para CtrlDocumento
--------------------------------------------------------------------------------
Rotina.............:
N. SIG.............: 103678
Data da Alteração..: 18/11/2020
Alteração Form.....: dblcContratoChange, BtnRateioDifClick
Responsável........: Taffarel Sevaybriker
Descrição..........: Ajuste ao efetuar lançamento com mais de item para listar
                     corretamente o rateio.
--------------------------------------------------------------------------------
N. SIG.............: 50898
Data da Alteração..: 10/12/2019
Responsável........: Everson Cunha
Descrição..........: Ordenar data de medição DESC
--------------------------------------------------------------------------------
Rotina.............:
N. SIG.............: 80542
Data da Alteração..: 16/01/2019
Alteração Form.....: BuscaObsrSemQuebras, CmeCadastroBeforeConfirma
Responsável........: Darivaldo Alencar
Descrição..........: campo memo inserindo quebras de linhas automaticamente
                     sempre que efetuava qualquer alteração na tela.
--------------------------------------------------------------------------------
Rotina.............: DBedtCodBarraExit, DBEdtLinhaDigExit
N. SIG.............: 79613
Data da Alteração..: 12/12/2018
Alteração Form.....: FMedicaoContratosMT
Responsável........: Everson Luiz Pereira da Cunha
Descrição..........: Retirado os enventos DBedtCodBarraExit, DBEdtLinhaDigExit
                     pois estes eventos não existiam mais no fonte, estava
                     apenas declarado, gerando erros ao abrir a funcionalidade.
--------------------------------------------------------------------------------
Rotina.............: BuscaDadosMedicaoAnterior, DBedtCodBarraExit
N. SIG.............: 74988
Data da Alteração..: 01/10/2018
Alteração Form.....: FMedicaoContratosMT
Responsável........: Cássio Florencio Rovaroto
Descrição..........: Retirando a recuperação de código de barras e linha
                     digitável de medições anteriores.
--------------------------------------------------------------------------------
SIG.............: 61347
Data............: 29/01/2018
Responsável.....: Peterson Victor
Descrição.......: Erro na gravação dos valores da medição
--------------------------------------------------------------------------------
Rotina             : FormCreate, GetTotalMedicao, VerificaServicoMaoDeObra,
										 CmeCadastroBeforeConfirma, tbcDetalheChange,
										 dblcObjetoExit, VerificaProcessoSuspensao, EmiteDadosCPRB
N. SIG..........   : 23656.58469
Data da Alteração: : 17/11/2017
Alteração Form:    : FMedicaoContratosMT
Responsável:       : Cássio Rovaroto
Descrição.......   : Inclusão dos campos que possibilitam a determinação de
										 caracterização de itens de serviço com cessão de mão de
										 obra.
--------------------------------------------------------------------------------
N. Sol..........: 40276
Data............: 24/02/2017
Responsável.....: William Moreira da Silva
Descrição.......: Alterações para a permissão da tela
--------------------------------------------------------------------------------
N. SIG..........: 27691
Data............: 09/09/2016
Responsável.....: Peterson Victor
Descrição.......: Erro no Rateio Diferenciado
--------------------------------------------------------------------------------
N. Sol..........: 257896
PPM.............: 1014759
Data............: 27/08/2015
Responsável.....: Petri Nocentini
Descrição.......: Informação duplicada em rateio diferenciado na medição de
                  contrato
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
PPM.............: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos 
Descrição.......: inclusão da aba ANS.
--------------------------------------------------------------------------------
N. Sol..........: 257100, 257101
PPM.............: 852753, 852764
Data............: 03/07/2015
Responsável.....: Felipe A. Santos e Fernando Xavier
Descrição.......: erro de chave na estrutura CTRLPARCELAMEDICAO, erro no
                  incremento da parcela, erro de zera a parcela.
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724 
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação do alerta de contratos.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 188854
Nº KINTANA..: 1784331
Data........: -
Responsável.: Higor Nayde
Descrição...: -
--------------------------------------------------------------------------------
N. Sol..........: 238060
PPM.............: 496839
Data............: 27/08/2014
Responsável.....: Thiago Melo
Descrição.......: Problemas ao realizar a medição do contrato no rateio
--------------------------------------------------------------------------------
N. Sol..........: 237146
PPM.............: 482149
Data............: 19/08/2014
Responsável.....: Thiago Melo
Descrição.......: A funcionalidade de medição não está realizando a verificação
                  da sub despesa por item
--------------------------------------------------------------------------------
N. Sol..........: 227975.16197
PPM.............: 430656
Data............: 26/06/2014
Responsável.....: Thiago Melo
Descrição.......: Manter estados das contas ao realizar alteração no rateio
--------------------------------------------------------------------------------
N. Sol..........: 227975
N. Kintana......: 2061959
Data............: 06/06/2014
Responsável.....: Thiago Melo
Descrição.......: Ajustar a montagem da conta orçamentária para verificar saldo
--------------------------------------------------------------------------------
Rotina..........: twDtEstornoVisibleChanged, CmeCadastroInsert
N. Sol..........: 191844
N. Kintana......: 1822119
Data............: 15/07/2013
Responsável.....: Edilaine Ferraresi
Descrição.......: centralizar janela de estorno
--------------------------------------------------------------------------------
Data        : 25/10/2012
Autor       : José Roberto Marque- JRM6
SOL/KINTANA : 189816/1793898
Descrição   : Gravação do documento no Contas a Pagar, alterada para criação dos
              alteradores automáticos de impostos (quando parametrizado no tipo
              de desembolso).
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 189037
Nº KINTANA..: 1784016
Data........: 05/09/2012
Responsável.: Higor Nayde Ferreira
Descrição...: Validação entre datas de medição e lançamento  no botão "OK".
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136120
Nº KINTANA..: 812527
Data........: 28/11/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de rotina renatapara obrigar a fazer a avaliação
              do Fornecedor
--------------------------------------------------------------------------------
Sol_Kintana : 137468_830100
Responsável : Marcos Luiz de Jesus
Data        : 10/06/2010
Descrição   : Correção na gravação de qtde para N registros na Grid.
--------------------------------------------------------------------------------
Sol_Kintana : 122362_614437
Responsável : Bruno Bastos
Data        : 19/08/2009
Descrição   : Filtrar por item e objeto para buscar a conta correta.
--------------------------------------------------------------------------------
Pendência   : 17044
Responsável : Daniel Simões
Data        : 27/04/2006
Descrição   : Habilita ou desabilita os edits de Quantidade ou Valor dos Itens
              de um contrato...
--------------------------------------------------------------------------------
Pendência   : 21248
Responsável : Daniel Simões
Data        : 25/04/2006
Descrição   : Alteração de duas casas decimais para quatro casas decimais...
--------------------------------------------------------------------------------
Pendência   : 18749
Responsável : Andre Tavares
Data        : 02/03/2005
Descrição   : Erro ao inserir um rateio diferenciado
--------------------------------------------------------------------------------
Pendência   : 17406
Responsável : Rodolpho da Silva
Data        : 21/01/2005
Descrição   : Não permitir que seja inserido um rateio do mesmo item e mesmo
              objeto
--------------------------------------------------------------------------------
Pendência   : 17868
Responsável : André Tavares
Data        : 11/11/2004
Descrição   : Carrega a conta bancaria do contrato ao se inserir uma nova
              medição.
--------------------------------------------------------------------------------
Pendência   : 17867
Responsável : André Tavares
Data        : 10/11/2004
Descrição   : Criado um dialog do tipo toolwindow que contem a data do estorno
              do documento do contrato.
--------------------------------------------------------------------------------
Pendência   : 16455
Rotina      : CmeCadastroInsert
Responsável : Marchetti
Data        : 10/09/2004
Descrição   : Não permitir medição quando contrato possuir aditamento com RAD
              pendente
--------------------------------------------------------------------------------
Pendência   : 16347
Responsável : Marchetti
Data        : 16/08/2004
Descrição   : Criadas rotinas para tratamento de RAD e integração
              financeira/contábil
--------------------------------------------------------------------------------
Pendências  : 16832 e 17232
Rotinas     : Várias
Responsável : David Ayrolla
Data        : 04/08/2004
Descrição   : Limitar a retenção de INSS de autônomos ao teto.
-------------------------------------------------------------------------------}

unit FMedicaoContratosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, TREdit, Mask, wwdbedit, DBCtrls,
  uCtrlMedicao, uCtrlUsuXContrato, uCtrlServProdxItemContr,
  uCtrlListTercContratos, uCtrlItemContratual, uDiasUteis, uCmSqlParams,
  mOrcamento, uCtrlOrcamento, uCtrlParamContrato, TB97Tlwn, DBTables,
  {SOL:189816 KTN:1793898 JRM6}
  uCtrlAlteradorImpostos, //  in '\Projetocm5\cmcapcarutilobj50\ctrlObjects\uCtrlAlteradorImpostos.pax',
  {SOL:189816 KTN:1793898 JRM6}
  FJustificativa, FCadForne, uCtrlAvaliacaoFornec, uCtrlPadroes,
  uCtrlDocumento,  // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
  uCtrlCtrlParcelaMedicao,
  uCtrlIntegraOrcFDO, Math,                //edilaine SIG115595
  uCtrlContratoANS, Wwdotdot, Wwdbcomb, // Felipe A. Santos SOL 242313/17289 PPM 828977
  uCMTypes, Wwdbspin, CMProcura,
  uCtrlListaServicos, FSelAltTributacao, uCtrlTipoalterador,
  uCtrlLancDocCapCar,
  uCMMath, UFuncaoGeral, Wwquery, // Paulo Nobre - WO15134
  uCtrlContratos;    // Paulo Nobre -  WO15653;

type
  tpTipoRateio = (trPadrao, trFDO);   //edilaine SIG115595

  TfrmMedicaoContratosMT = class(TFrmCadastroMestreDetMT)
    lblContrato: TLabel;
    dblcContrato: TwwDBLookupCombo;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    edDataMEdicao: TCMDateTimePicker;
    edDataVenc: TCMDateTimePicker;
    lblFormaPG: TLabel;
    dblcFormaPG: TwwDBLookupCombo;
    GpConta: TGroupBox;
    lblBanco: TLabel;
    lblNo: TLabel;
    lblAgencia: TLabel;
    BtnBuscaContaCor: TSpeedButton;
    Label11: TLabel;
    Label6: TLabel;
    tbsObsContrato: TTabSheet;
    DBObservacao: TDBMemo;
    dsContratos: TDataSource;
    cdsContratos: TCMClientDataSet;
    cdsFormasPagamento: TCMClientDataSet;
    cdsItem: TCMClientDataSet;
    cdsObjeto: TCMClientDataSet;
    MsContaCor: TMontaSelect;
    MSMedicao: TMontaSelect;
    cdsDet: TCMClientDataSet;
    dbeComplDoc: TwwDBEdit;
    dbeNumDocumento: TDBRealEdit;
    dbmemoObs: TDBMemo;
    dbeBanco: TwwDBEdit;
    dbeAgencia: TwwDBEdit;
    dbeConta: TwwDBEdit;
    spTeste: TCMSqlParams;
    cdsDadosConta: TCMClientDataSet;
    cdsRateioxCC: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    Label5: TLabel;
    dbedtHistComp: TwwDBEdit;
    Label13: TLabel;
    lblDataLanc: TLabel;
    edDataLancto: TCMDateTimePicker;
    tbsFicha: TTabSheet;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    DBedtCodBarra: TwwDBEdit;
    DBEdtLinhaDig: TwwDBEdit;
    sbtnEstornar: TToolbarButton97;
    dbStatus: TDBText;
    lblRAD: TLabel;
    lblStatus: TLabel;
    btnAplicaIntegracao: TBitBtn;
    cdsParcelaMedicao: TCMClientDataSet;
    twDtEstorno: TToolWindow97;
    Panel61: TPanel;
    BitBtn1: TBitBtn;
    dtpkDataEstorno: TCMDateTimePicker;
    Label17: TLabel;
    BitBtn2: TBitBtn;
    cdsCtrlParcelaMedicao: TCMClientDataSet;

    // Felipe A. Santos SOL 242313/17289 PPM 828977 {Fim lblTotalANS}
    tbsANS: TTabSheet;
    dbgrdANS: TwwDBGrid;
    Panel4: TPanel;
    lblRef: TLabel;
    lblNumCI: TLabel;
    lblVlrMensal: TLabel;
    lblVlrANS: TLabel;
    lblObs: TLabel;
    dbedtNumCI: TwwDBEdit;
    dbmmoObs: TDBMemo;
    cdsANS: TCMClientDataSet;
    dsANS: TwwDataSource;
    lblVlrTotalANS: TLabel;
    lblTotalANS: TLabel;
    dbedtVlrMensal: TDBRealEdit;
    dbedtVlrANS: TDBRealEdit;
    medtRef: TMaskEdit;
    tbsNFS: TTabSheet;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dbEdtNumNFS: TwwDBEdit;
    dbEdtNumSerieNFS: TwwDBEdit;
    dbDtpDataEmissaoNFS: TCMDateTimePicker;
    edtVlrBruto: TRealEdit;
    cdsTipoServico: TCMClientDataSet;
    cdsProcessos: TCMClientDataSet;
    dsTipoServico: TDataSource;
    dsProcessos: TDataSource;
    dbMmObsNFS: TDBMemo;
    cdsRateioAux: TCMClientDataSet;
    cdsPadraoRateio: TCMClientDataSet;
    grpMesRef: TGroupBox;
    cbbMesRef: TwwDBComboBox;
    spinedtAnoRef: TwwDBSpinEdit;
    lblMesRef: TLabel;
    lblAnoRef: TLabel;
    cmProcListaServicos: TCMProcura;
    Label22: TLabel;
    msListaServico: TMontaSelect;
    tbsTributacao: TTabSheet;
    dbgrdTributacao: TwwDBGrid;
    pnlTributacao: TPanel;
    lblDataLanctoTrib: TLabel;
    dtpDataLancTrib: TCMDateTimePicker;
    lblValorTrib: TLabel;
    lkpAlteradorTrib: TwwDBLookupCombo;
    edtHistoricoTrib: TwwDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    cdsTributacao: TCMClientDataSet;
    dsTributacao: TDataSource;
    cdsAlterador: TCMClientDataSet;
    btnAddAlteradores: TBitBtn;
    edtValorTrib: TDBRealEdit;
    edtValorBaseTrib: TDBRealEdit;
    chkOptanteSimples: TCheckBox;
    pnlItemDados: TPanel;
    Label7: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    lblParcela: TLabel;
    lblDe: TLabel;
    dblcItem: TwwDBLookupCombo;
    dbeObservacao: TwwDBEdit;
    dblcObjeto: TwwDBLookupCombo;
    reValor: TRealEdit;
    dbeQuantidade: TDBRealEdit;
    dbeValorUnitario: TDBRealEdit;
    dbeValorTotal: TDBRealEdit;
    btnRateioDif: TButton;
    dbedtPARCELANUM: TwwDBEdit;
    dbedtNUMPARCELAS: TwwDBEdit;
    pnlListaFDO: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    btnRateioOk: TSpeedButton;
    Label26: TLabel;
    btnIncluirFDO: TSpeedButton;
    lvListadeFDOS: TListView;
    btnExcFDO: TSpeedButton;
    Label27: TLabel;
    ImageList1: TImageList;
    rbPadrao: TRadioButton;
    btnRateioFDO: TSpeedButton;
    edNumFDO: TMaskEdit;
    molOrcamento1: TmolOrcamento;
    rbRateioFDO: TRadioButton;
    meTotalFDOS: TDBRealEdit;
    dsPagtosSintetico: TwwDataSource;
    qryPagtosSintetico: TwwQuery;
    chkNaoContabiliza: TCheckBox;
    qryLocalizaFDO: TwwQuery;
    dsLocalizaFDO: TwwDataSource;
    qryLocalizaFDOCOD_FDO: TStringField;
    qryLocalizaFDOVLRTOTAL_FDO: TFloatField;
    Panel1: TPanel;
    Panel6: TPanel;
    spbLimparLista: TSpeedButton;
    qryVerificaDocum: TQuery;
    qryVerificaDocumCODCENTRORESPON: TStringField;
    cdsAux1: TCMClientDataSet;

    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure dblcContratoChange(Sender: TObject);
    procedure BtnBuscaContaCorClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblcObjetoChange(Sender: TObject);
    procedure dblcItemChange(Sender: TObject);
    procedure cdsDetAfterScroll(DataSet: TDataSet);
    procedure dbeQuantidadeChange(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dblcContratoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnRateioDifClick(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure btnAplicaIntegracaoClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure twDtEstornoClose(Sender: TObject);
    procedure twDtEstornoVisibleChanged(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cdsDetPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure edDataVencExit(Sender: TObject);
    procedure dbeValorUnitarioChange(Sender: TObject);
    procedure AbrirAvaliacao;
    procedure FormDestroy(Sender: TObject);

     // Felipe A. Santos SOL 218909/16724 PPM 588170 {Fim bbtnSairClick}
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);

 //Higor Nayde SOL 188854 Kintana 1784331 - Início
    procedure dblcFormaPGExit(Sender: TObject);
    procedure dblcFormaPGChange(Sender: TObject);
    procedure dblcContratoEnter(Sender: TObject);
    procedure dblcContratoExit(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
 //Higor Nayde SOL 188854 Kintana 1784331 - Fim

    // Felipe A. Santos SOL 242313/17289 PPM 828977 {Fim sbtnAltDetClick}
    procedure dbgrdDetRowChanged(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure medtRefKeyPress(Sender: TObject; var Key: Char);
    procedure edNumFDOKeyPress(Sender: TObject; var Key: Char);
    procedure rbRateioFDOClick(Sender: TObject);
    procedure rbPadraoClick(Sender: TObject);
    procedure btnRateioOkClick(Sender: TObject);
    procedure cmProcListaServicosValidaDados(Sender: TObject);
    procedure btnAddAlteradoresClick(Sender: TObject);
    procedure dbgrdTributacaoDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure chkOptanteSimplesClick(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure edDataLanctoExit(Sender: TObject);
    procedure dbeNumDocumentoExit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure cmProcListaServicosApertouBotao(Sender: TObject);
    procedure btnIncluirFDOClick(Sender: TObject);
    procedure btnRateioFDOClick(Sender: TObject);
    procedure btnExcFDOClick(Sender: TObject);
    procedure lvListadeFDOSCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvListadeFDOSEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure spbLimparListaClick(Sender: TObject);


  private
    { Private declarations }

    FiIdContrato : integer; // andré tavares - pendencia 18749 - 02/03/2005
    bProcessaEstorno : Boolean; // Marchetti - 12/07/2005

    sStatusMedicao               : String;

    CtrlMedicao                  : TCtrlMedicao;
    CtrlOrcamento                : TOrcamentoBackMT;
    CtrlContratos                : TCtrlUsuXContrato;
    CtrlItemContratual           : TCtrlItemContratual;
    CtrlServProdxItemContr       : TCtrlServProdxItemContr;
    CtrlListTerc                 : TCtrlListTercContratos;
    CtrlUsuXContrato             : TCtrlUsuXContrato;
    CtrlDiasUteis                : TDiasUteis;
    CtrlParamContrato            : TCtrlParamContrato; // Daniel Simões - 02/05/2006
    bCarregandoMedAnterior       : Boolean;
    CtrlAvaliacaoFornec          : TCtrlAvaliacaoFornec;
    CtrlCtrlParcelaMedicao       : TCtrlCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170
    CtrlContratoANS              : TCtrlContratoANS; // Felipe A. Santos SOL 242313/17289 PPM 828977

    CtrlIntegraOrcFDO            : TCtrlIntegraOrcFDO;                //edilaine SIG115595
    CtrlListaServicos            : TCtrlListaServicos;
    CtrlTipoAlterador            : TCtrlTipoalterador;


    // WO11853 - Contas a Pagar - Nota Fiscal Contrato x Contas a Pagar
    // Alterado Por Arnaldo Vicente Scarin em 28/06/2024
    CtrlLancDocCapCar            : TCtrlLancDocCapCar;

    CtrlContratosMed             : TCtrlContratos;  // Paulo Nobre -  WO15653

    cdsTemp                      : TCMClientDataSet; // Daniel Simões - 02/05/2006
    IdForCli                     : Integer;
    _oDocumento                  : TCtrlDocumento; // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    FlgExit : Boolean;// flg para evitar passar duas vezes o exit //Higor SOL 188854 - PPM 1784331

    // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
    FVeioDoAlerta: Boolean;
    FIdObjeto: Integer;
    FIdItem: Integer;
    FParcelaNum: integer;
    FIdParcMedicao: integer;
    FIdAditamento: Integer;
    FVencimento: TDateTime;
    FIdContratoAlerta : Integer;
    // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

    dValorANSOld, dValorANSAtual, dValorANSCancel : Double; // Felipe A. Santos SOL 242313/17289 PPM 828977

    bOk : Boolean; // Felipe A. Santos SOL 242313/17289 PPM 828977

    bFlgExecutouRateio : boolean;             //edilaine WO15134

    _IdServico: Integer;
    _CodNaturezaREINF: Integer;
    iCalcTributos: Integer;
    iCalcChangeTrib: Integer;

    procedure BuscaDadosMedicaoAnterior(rCodDocumento: Double);

    function DefineStatusRAD : String;
    function RecuperaContaBancaria: Boolean; // Andre Tavares - pendência 17868 - 11/11/2004
    procedure JustificarFornec;
    procedure FazerAvaliacao;
    // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
    function IFF(Condicao:boolean;Primeiro,Segundo:string):string;
    procedure AtualizaPlanoPatro;
    procedure atualizaPlano (nPlano : String);
    // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656


    procedure atualizaDespesaOrc (_IdDespesaOrc : String); // Thiago Melo SOL 238060 PPM 496839
    procedure CarregaInformacoesAlerta;   // Felipe A. Santos SOL 218909/16724 PPM 588170

    procedure CarregarCamposDummyANS; // Felipe A. Santos SOL 242313/17289 PPM 828977

    //Cássio Rovaroto - SIG nº 23656.58469 - Início
	   function GetTotalMedicao: Double;
    function VerificaServicoMaoDeObra: Boolean;
    //function VerificaProcessoSuspensao: Boolean; //Cássio Rovaroto - SIG nº 115585
    procedure EmiteDadosCPRB;
    //Cássio Rovaroto - SIG nº 23656.58469 - Fim

    function BuscaObsrSemQuebras(sObsr: String): String; //SIG80542

    procedure ApresentaRateio(tipoRateio : tpTipoRateio);    //edilaine SIG115595
    procedure DesabilitaInsertTributos;

    Function LocalizaItemListaArquivos(Const ListView: TListView; pNumFDO: String): Boolean;

    procedure ValidaDadosFDO;                //edilaine WO15431


  public

     // Felipe A. Santos SOL 218909/16724 PPM 588170 - RNG05/RE013 ER227 carregando as informações que vem do alerta - início
     property IdContratoAlerta : Integer read FIdContratoAlerta write FIdContratoAlerta;
     property VeioDoAlerta : Boolean read FVeioDoAlerta write FVeioDoAlerta;
     property IdObjeto : Integer read FIdObjeto write FIdObjeto;
     property IdItem : Integer read FIdItem write FIdItem;
     property IdParcMedicao : Integer read FIdParcMedicao write FIdParcMedicao;
     property ParcelaNum : integer read FParcelaNum write FParcelaNum;
     property Vencimento : TDateTime read FVencimento write FVencimento;
     property IdAditamento : Integer read FIdAditamento write FIdAditamento;
     // Felipe A. Santos SOL 218909/16724 PPM 588170 - RNG05/RE013 ER227 carregando as informações que vem do alerta - fim
    { Public declarations }
  end;

var
  frmMedicaoContratosMT: TfrmMedicaoContratosMT;
  {SOL:189816 KTN:1793898 JRM6}
  V_Primeira :  Boolean = true;
  v_CodDocumento,
  v_codtiporecdes:  String;
  v_Coddocumento_Alt,
  v_codtipdoc:      Integer;
  {SOL:189816 KTN:1793898 JRM6}
  dDtLanc , dDtVenc : TDateTime; //WO8227 - Helen V Bianchi

  dUltimoSaldo, dValorSaldo : Double;  // Paulo Nobre - WO15653

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FRateioMT,
     //DAVID - Retenção de Imposto
     fRetencaoINSS, FTelaAut;


//edilaine - WO15134 : incio
{elimina todos os espaços em branco}
function AllTrim(sTexto : string) : string;
begin
  result := StringReplace(sTexto, ' ', '', [rfReplaceAll]);
end;

{arredonda valor}
function Arredonda(const fValor: extended; const iDecimais: word): extended;
begin
   Result := (Round(fValor * Power(10, iDecimais))) / Power(10, iDecimais);
end;
//edilaine - WO15134 : fim


procedure TfrmMedicaoContratosMT.FormCreate(Sender: TObject);
begin
   inherited;
   FiIdContrato := 0; // andré tavares - pendencia 18749 - 02/03/2005
   dValorANSCancel := 0;  // Felipe A. Santos SOL 242313/17289 PPM 828977
   FVeioDoAlerta := False;

   //Inicializa Controls
   CtrlMedicao:=TCtrlMedicao.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                    Sistema.IdUsuario, Sistema.IdEspAcesso,
                                    Sistema.UsaPlanoPatro);
   CtrlMedicao.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlMedicao.CdsMedicao:=cdsDet;
   CtrlMedicao.CdsRateioxCC:=cdsRateioxCC;
   //DAVID - Retenção de Imposto
   CtrlMedicao.OnRetencaoINSS := RetencaoOutrasEmpresas;
   CtrlMedicao.CdsCtrlParcelaMedicao := cdsCtrlParcelaMedicao;  // Felipe A. Santos SOL 218909/16724 PPM 588170
   CtrlMedicao.CdsANS := cdsANS; // Felipe A. Santos SOL 242313/17289 PPM 828977
   CtrlMedicao.CdsTributacao := cdsTributacao;

   // Marcio Motta - 21/05/2004 - 16788
   CtrlOrcamento := TOrcamentoBackMT.Create;
   CtrlOrcamento.InitializeAS(CtrlMedicao);
   CtrlOrcamento.IdEmpresa := Sistema.IdEmpresa;
   CtrlOrcamento.IdUsuario := Sistema.IdUsuario;

   CtrlUsuXContrato:=TCtrlUsuXContrato.Create;
   CtrlUsuXContrato.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlListTerc:=TCtrlListTercContratos.Create;
   CtrlListTerc.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlItemContratual:=TCtrlItemContratual.Create;
   CtrlItemContratual.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlServProdxItemContr:=TCtrlServProdxItemContr.Create;
   CtrlServProdxItemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlDiasUteis:=TDiasUteis.Create;
   CtrlDiasUteis.Initialize(dtmBaseDados.dbBaseDados,True);

// Daniel Simões - P: 16973 - 02/05/2006 - -------------------------------------
   CtrlParamContrato := TCtrlParamContrato.Create;
   CtrlParamContrato.Initialize(dtmBaseDados.dbBaseDados,True);
// Daniel Simões - P: 16973 - 02/05/2006 - -------------------------------------

   // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
   CtrlCtrlParcelaMedicao := TCtrlCtrlParcelaMedicao.Create;
   CtrlCtrlParcelaMedicao.Initialize(dtmBaseDados.dbBaseDados,True);
   // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

   // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
   CtrlContratoANS := TCtrlContratoANS.Create;
   CtrlContratoANS.Initialize(dtmBaseDados.dbBaseDados,True);
   // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

   // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
   _oDocumento := TCtrlDocumento.Create;
   _oDocumento.InitializeAs(Padroes);
   // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

   CtrlIntegraOrcFDO := TCtrlIntegraOrcFDO.Create;                   //edilaine SIG115595
   CtrlIntegraOrcFDO.Initialize(dtmBaseDados.dbBaseDados,True);      //edilaine SIG115595

   CtrlListaServicos := TCtrlListaServicos.Create;              //Cássio Rovaroto - SIG nº 133236
   CtrlListaServicos.Initialize(dtmBaseDados.dbBaseDados,True); //Cássio Rovaroto - SIG nº 133236

   //Carrega Cds
   Cds.Data:=CtrlMedicao.ListMedicao(-1,-1); //vazio
   cdsRateioxCC.Data:=CtrlServProdxItemContr.ListRateio(-1,0,0,-1,True);//vazio

   cdsDet.Data:=CtrlMedicao.ListMedicao(-1,-1); //vazio
   TFloatField(cdsDet.FieldByName('VALORUNITARIOOBJETO')).DisplayFormat:='#,##0.00';
   TFloatField(cdsDet.FieldByName('VALORMEDICAO')).DisplayFormat:='#,##0.00';

   cdsContratos.Data:=CtrlUsuXContrato.ListContratosxUsuario(Sistema.IdEmpresa,0,
                                                          Sistema.IdUsuario,'A',False);

   cdsFormasPagamento.Data:=CtrlListTerc.ListFormaRecPag(-1,''); //vazio
   cdsANS.Data := CtrlContratoANS.ListaContratoANS(-1, True); // vazio // Felipe A. Santos SOL 242313/17289 PPM 828977
   cdsTributacao.Data := CtrlMedicao.GetDadosAlterador(-1);
   TFloatField(cdsTributacao.FieldByName('VALOR')).DisplayFormat:='#,##0.00';
   TFloatField(cdsTributacao.FieldByName('VALORBASERETENCAO')).DisplayFormat:='#,##0.00';

   CtrlTipoAlterador:= TCtrlTipoalterador.Create;
   CtrlTipoAlterador.Initialize(dtmBaseDados.dbBaseDados,True);
   cdsAlterador.Data := CtrlTipoAlterador.ListTipoalterador(Sistema.IdEmpresa, 'P', 0, '');


// Daniel Simões - P: 16973 - 02/05/2006 - Início ------------------------------
   //Carrega Parâmetros do sistema de contratos
     cdsTemp := TCMClientDataSet.Create( nil );
     cdsTemp.Data := CtrlParamContrato.ListParamContrato( Sistema.IdEmpresa );
     if (cdsTemp.FieldByName('FLGINTEGRAORCA').AsString = 'S') then
       molOrcamento1.Visible := True
     else
       molOrcamento1.Visible := False;
// Daniel Simões - P: 16973 - 02/05/2006 - Fim ---------------------------------

   // Marcos Topini - Pendência 19333 - 28/07/2006 - Início -------------------
   if (cdsTemp.FieldByName('FLGDTLANCTO').AsString = 'S') then begin
      lblDataLanc.Enabled  := False;
      edDataLancto.Enabled := False
      end
     else begin
       lblDataLanc.Enabled  := True;
       edDataLancto.Enabled := True
     end;
   // Fim Pendência 19333 -----------------------------------------------------


   //Monta Select
   MsContaCor.Larguras.Add('15');
   MsContaCor.Mascaras.Add(' ');
   MsContaCor.SensivelACaixa.Add('N');
   MsContaCor.TipodeDado.Add('C');
   MsContaCor.Descricao.Add('Tipo de Conta');

   // Daniel - 23412
   MsContaCor.OperComparador.Add('-1');

   MsContaCor.Colunas.Add('DECODE(CONTABANCARIA.TIPOCONTA,''1'',''Conta Corrente'','+
                          'DECODE(CONTABANCARIA.TIPOCONTA,''2'',''Cartão Salário'','+
                          'DECODE(CONTABANCARIA.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA');
   MsContaCor.CamposChave.Add('DECODE(CONTABANCARIA.TIPOCONTA,''1'',''Conta Corrente'','+
                          'DECODE(CONTABANCARIA.TIPOCONTA,''2'',''Cartão Salário'','+
                          'DECODE(CONTABANCARIA.TIPOCONTA,''3'',''Conta Poupança'',''''))) AS DESCTIPOCONTA');
   MontaSelect.Filtro.Add('CONTRATOCONTR.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +
                          'AND CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
   MSMedicao.Filtro.Add('CONTRATOCONTR.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +
                        'AND CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                        'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');

   //Inicializa variáveis
   bCarregandoMedAnterior:=False;

   lblStatus.Visible := False;
   lblRAD.Visible    := False;

  CtrlAvaliacaoFornec := TCtrlAvaliacaoFornec.Create;
  CtrlAvaliacaoFornec.InitializeAs(Padroes);

  HelpContext := 120002; // Felipe A. Santos SOL 218909/16724 PPM 588170

  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  bOk := False;

  TFloatField(CdsANS.FieldByName('VLRMENSAL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsANS.FieldByName('VLRANS')).DisplayFormat := '###,###,##0.00';
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  _IdServico := -1;
  _CodNaturezaREINF := -1;
  iCalcTributos := 0;
  iCalcChangeTrib := 0;

  // WO11853 - Contas a Pagar - Nota Fiscal Contrato x Contas a Pagar
  // Alterado Por Arnaldo Vicente Scarin em 28/06/2024
  CtrlLancDocCapCar := TCtrlLancDocCapCar.Create;
  CtrlLancDocCapCar.InitializeAs(Padroes);
  // FIM - WO11853

  // Paulo Nobre -  WO15653 - Inicio
  CtrlContratosMed := TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
  CtrlContratosMed.Initialize(dtmBaseDados.dbBaseDados, True);
  // Paulo Nobre -  WO15653 - Fim

end;

procedure TfrmMedicaoContratosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   FreeAndNil( cdsTemp ); // Daniel Simões - 02/05/2006

   CtrlMedicao.Free;
   CtrlUsuXContrato.Free;
   CtrlListTerc.Free;
   CtrlItemContratual.Free;
   CtrlServProdxItemContr.Free;
   CtrlDiasUteis.Free;

   CtrlParamContrato.Free; // Daniel Simões - 02/05/2006

   // Marcio Motta - 21/05/2004 - 16788
   CtrlOrcamento.Free;

   FreeAndNil(CtrlIntegraOrcFDO);        //edilaine SIG115595

   CtrlCtrlParcelaMedicao.Free; // Felipe A. Santos SOL 218909/16724 PPM 588170
   CtrlContratoANS.Free; // Felipe A. Santos SOL 242313/17289 PPM 828977

   // WO11853 - Contas a Pagar - Nota Fiscal Contrato x Contas a Pagar
   // Alterado Por Arnaldo Vicente Scarin em 28/06/2024
   CtrlLancDocCapCar.Free;
   // FIM - WO11853

  // Paulo Nobre -  WO15653 - Inicio
  CtrlContratosMed.Free;
  // Paulo Nobre -  WO15653 - Fim

end;

procedure TfrmMedicaoContratosMT.CmeCadastroInsert(Sender: TObject);
var
  iCodDocumento, iQtdeFields : Integer;  // Felipe A. Santos SOL 218909/16724 PPM 588170
  sNomeCampo : string;
begin
  Cds.Data          := CtrlMedicao.ListMedicao(-1,-1); //vazio
  cdsRateioxCC.Data := CtrlServProdxItemContr.ListRateio(-1,0,0,-1,True);//vazio
  cdsDet.Data       := CtrlMedicao.ListMedicao(-1,-1); //vazio
  edtVlrBruto.Text  := '';//Cássio Rovaroto - SIG nº 23656.58469
  cdsTributacao.Data := CtrlMedicao.GetDadosAlterador(-1);
  CtrlMedicao.CdsAlteradores.Data := CtrlMedicao.GetDadosAlterador(-1);

  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
{  cdsANS.Data       := CtrlContratoANS.ListaContratoANS(-1, True); // vazio
  dValorANSCancel   := 0;
  lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dValorANSCancel);

  TFloatField(CdsANS.FieldByName('VLRMENSAL')).DisplayFormat := '###,###,##0.00';
  TFloatField(CdsANS.FieldByName('VLRANS')).DisplayFormat := '###,###,##0.00';
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
}  
  chkOptanteSimples.Checked := False;

  //pgctrlDetalhe.ActivePageIndex := 0;

  inherited;

  {SOL:189816 KTN:1793898 JRM6}
  if V_Primeira then
    V_Primeira := False
  Else
  begin
    DefineStatusRAD;
  end;
  {SOL:189816 KTN:1793898 JRM6}

  if not(VeioDoAlerta) then
  begin
    MSMedicao.AscOrderBy := false; //Everson Cunha - SIG50898
    MSMedicao.Executar;
    if (MSMedicao.RetornouValor) then begin
       BuscaDadosMedicaoAnterior(StrToIntDef(MSMedicao.ValoresChave[1],-1));

      FiIdContrato := strToIntDef(MSMedicao.ValoresChave[2], -1);    // Edilaine - SOL 191844 / KTN 1822119

      // Marchetti - Pendencia 16455
      if ( CtrlUsuXContrato.ContratoPossuiAditamentoComRADPendente(StrToFloat(MSMedicao.ValoresChave[2])) ) then begin
        MsgDlg('Esse contrato possui aditamento com RAD Pendente de aprovação','Aviso',mtWarning,[mbOk],0);
        Abort;                  
        Exit;
      end;
      // Fim Marchetti - Pendencia 16455
      //Cássio Rovaroto - SIG nº 134176 - Início
      if cdsRateioxCC.isEmpty then
      begin
        cdsRateioxCC.Close;
        cdsRateioxCC.Data:=CtrlServProdxItemContr.ListRateio(
                                        StrToIntDef(dblcContrato.LookupValue,-1),0,0,
                                        Sistema.IdEmpresa,True);
      end
      else
      begin
        cdsRateioAux.data := CtrlServProdxItemContr.ListRateio(
                                        StrToIntDef(dblcContrato.LookupValue,-1),0,0,
                                        Sistema.IdEmpresa,True);

        cdsRateioxCC.Append;
        for iQtdeFields := 0 to cdsRateioAux.FieldCount - 1 do
        begin
          sNomeCampo := cdsRateioAux.Fields[iQtdeFields].FieldName;
          cdsRateioxCC.FieldByName(sNomeCampo).Value := cdsRateioAux.FieldByName(sNomeCampo).Value;
        end;
        cdsRateioxCC.Post;

        cdsRateioAux.Next;
      end;
      //Cássio Rovaroto - SIG nº 134176 - Fim

    end
    else
    begin
      BuscaDadosMedicaoAnterior(-1);
      Cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
    end;
  end
  else
  begin
    // Felipe A. Santos SOL 218909/16724 PPM 588170
    iCodDocumento := CtrlCtrlParcelaMedicao.GetCodDocumento(IdContratoAlerta);

    if (iCodDocumento <> 0) then
    begin
      cdsDet.EmptyDataSet;
      BuscaDadosMedicaoAnterior(iCodDocumento); // Felipe A. Santos SOL 218909/16724 PPM 588170

      if ( CtrlUsuXContrato.ContratoPossuiAditamentoComRADPendente(IdContratoAlerta)) then begin
          MsgDlg('Esse contrato possui aditamento com RAD Pendente de aprovação','Aviso',mtWarning,[mbOk],0);
          Abort;
          Exit;
      end;
    end;

    CarregaInformacoesAlerta;

    VeioDoAlerta := False;
    // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim
  end;

  Cds.FieldByName('FLGESTORNADO').Clear;
  Cds.FieldByName('STATUS').Clear;
end;

procedure TfrmMedicaoContratosMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var vdocumento, vidforcli,vnodocumento : integer; //Higor Nayde SOL 188854 Kintana 1784331
var sNF : String;
begin
  vidforcli    := Cds.FieldByName('IDFORCLI').AsInteger; //Higor Nayde SOL 188854 Kintana 1784331
  vnodocumento := Cds.FieldByName('NODOCUMENTO').AsInteger;//Higor Nayde SOL 188854 Kintana 1784331
  if (Trim(edDataMEdicao.Text) <> '') then
    if CtrlAvaliacaoFornec.FornecPassivo(Cds.FieldByName('IDFORCLI').AsInteger) then
      FazerAvaliacao;

  inherited;

  Accept := CtrlMedicao.AplicaAtualMedicao(1,(not chkNaoContabiliza.Checked), _IdServico, _CodNaturezaREINF); //Inclusão

  if not(Accept) then
    //DAVID - Retenção de Imposto
    if ( Trim(CtrlMedicao.MessageInfo)<>'' ) then
      MsgDlg(CtrlMedicao.MessageInfo,'Aviso',mtWarning,[mbOk],0)
  else
    molOrcamento1.Clear; // Marcio Motta  31/05 - 16788
    
//Higor Nayde SOL 188854 Kintana 1784331 - Início
  vdocumento := CtrlAvaliacaoFornec.BuscaDocumento(vnodocumento,vidforcli);
  if(vdocumento <> 0) then
  begin
    // WO11853 - Contas a Pagar - Nota Fiscal Contrato x Contas a Pagar
    // Alterado Por Arnaldo Vicente Scarin em 28/06/2024
    // Apesar da criação da Medição gerar o documento no Contas a Pagar
    // por algum motivo, os dados da nota não estão sendo atualizados
    // A rotina abaixo é utilizada No Contas a Pagar para atualizar
    // a Nota Fiscal no Documento, e com isso, forçará a atualização
    // sem a necessidade de rodar essa rotina no Contas a Pagar
    sNF := dbEdtNumNFS.Text;
    if sNF = '' then
      sNF := Cds.FieldByName('NFSNUMERO').AsString;
    if sNF = '' then
      sNF := Cds.FieldByName('CODDOCUMENTO').AsString;

    CtrlLancDocCapCar.SetDadosNFS(vDocumento,
                                  sNF,
                                  Cds.FieldByName('NFSSERIE').AsString,
                                  Cds.FieldbyName('NFSOBS').AsString,
                                  Cds.FieldByName('NFSDATAEMISSAO').AsString,
                                  Cds.FieldByName('NFSSERVICO').AsInteger,
                                  Cds.FieldByName('FLGSIMPLES').AsString = 'S');
    // FIM - WO11853
    CtrlAvaliacaoFornec.AtualizaAvaliacao(vnodocumento,
                                          vdocumento,
                                          strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(vidforcli)),
                                          vidforcli);
  end;
//Higor Nayde SOL 188854 Kintana 1784331 - Fim

  EmiteDadosCPRB; //Cássio Rovaroto - SIG nº 23656.58469
end;

procedure TfrmMedicaoContratosMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
var vdocumento, vidforcli,vnodocumento : integer;//Higor Nayde SOL 188854 Kintana 1784331
begin
   vidforcli := Cds.FieldByName('IDFORCLI').AsInteger; //Higor Nayde SOL 188854 Kintana 1784331
   vnodocumento:= Cds.FieldByName('NODOCUMENTO').AsInteger; //Higor Nayde SOL 188854 Kintana 1784331 
   if CtrlAvaliacaoFornec.FornecPassivo(Cds.FieldByName('IDFORCLI').AsInteger) then
     FazerAvaliacao;

   inherited;
   Accept:=CtrlMedicao.AplicaAtualMedicao(2, (not chkNaoContabiliza.Checked), _IdServico, _CodNaturezaREINF); //Alteração
   if not(Accept) then
     //DAVID - Retenção de Imposto
     if trim( CtrlMedicao.MessageInfo ) <> '' then
       MsgDlg(CtrlMedicao.MessageInfo,'Aviso',mtWarning,[mbOk],0)
   else
     molOrcamento1.Clear; // Marcio Motta  31/05 - 16788
//Higor Nayde SOL 188854 Kintana 1784331 - Início
     //ja esta lançado!
  vdocumento := CtrlAvaliacaoFornec.BuscaDocumento(vnodocumento,vidforcli);
  if(vdocumento <> 0) then begin
    CtrlAvaliacaoFornec.AtualizaAvaliacao(vnodocumento,vdocumento,
    strTOint(CtrlAvaliacaoFornec.BuscaAvaliacao(vidforcli)),vidforcli);
  end;
//Higor Nayde SOL 188854 Kintana 1784331 - Fim

	EmiteDadosCPRB; //Cássio Rovaroto - SIG nº 23656.58469
end;

procedure TfrmMedicaoContratosMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlMedicao.AplicaAtualMedicao(3); //Exclusão
   if not(Accept) then
     MsgDlg(CtrlMedicao.MessageInfo,'Aviso',mtWarning,[mbOk],0)
   else
     molOrcamento1.Clear; // Marcio Motta  31/05 - 16788
end;

procedure TfrmMedicaoContratosMT.CmeCadastroFind(Sender: TObject);
var
   rIDMedicaoAux : Double;
   rCodDocumento : Double;
begin
  lblRAD.Visible    := False;
  lblStatus.Visible := False;

  IdForCli:=  Cds.FieldByName('IDFORCLI').AsInteger;
  inherited;
  if MontaSelect.RetornouValor then
  begin
    FiIdContrato := strToIntDef(MontaSelect.ValoresChave[2], -1); // andré tavares - pendencia 18749 - 02/03/2005

    if MontaSelect.ValoresChave[1] <> '' then
    begin
      with TCMClientDataSet.Create(nil) do
      try
        Data:=CtrlMedicao.ListParcelaXDoc(StrToFloat(MontaSelect.ValoresChave[1]));
        First;
        rCodDocumento := FieldbyName('CODDOCUMENTO').asFloat;
        rIDMedicaoAux:=FieldByName('IDMEDICAO').AsFloat ;
      finally
        Free;
      end;
    end
    else
    begin
      with TCMClientDataSet.Create(nil) do
      try
        Data:=CtrlMedicao.ListParcelaMedicao(StrToFloat(MontaSelect.ValoresChave[3]));
        First;
        rIDMedicaoAux:=FieldByName('IDMEDICAO').AsFloat ;
      finally
        Free;
      end;
    end;

    cds.Close;
    cds.Data:=CtrlMedicao.ListMedicao(rIDMedicaoAux,Sistema.IdEmpresa);

    // Marchetti - 12/07/2005
    sbtnEstornar.Enabled := (cds.FieldByName('FLGESTORNADO').AsInteger = 0);

    chkOptanteSimples.Checked := (Cds.FieldByName('FLGSIMPLES').asString = 'S'); //Cássio Rovaroto - SIG nº 136888

    //William Moreira da Silva
    cdsDet.Close;
    cdsDet.Data := CtrlMedicao.ListMedicao(rIDMedicaoAux,Sistema.IdEmpresa);
    //William Moreira da Silva

       // Marcio Motta - 27/05/2004 - Pendência: 16788
       if not cdsDet.FieldByName('IDRESERVAORCAMEN').IsNull then begin
         molOrcamento1.iIdCompromisso   := cdsDet.FieldByName('IDRESERVAORCAMEN').AsInteger;
         molOrcamento1.edtCompOrc.Value := CtrlOrcamento.BuscaIdNumReserva(molOrcamento1.iIdCompromisso, 0,True);
       end else begin
         molOrcamento1.Clear;
       end;

       cdsItem.Close;
       cdsItem.Data := CtrlItemContratual.ListItemXContrato(Sistema.IdEmpresa,
                                                          cds.FieldByName('IDCONTRATO').AsFloat);
       cdsObjeto.Close;
//       cdsObjeto.Data:=CtrlServProdxItemContr.ListProdServXItem(cds.FieldByName('IDCONTRATO').AsFloat,
//                                                                0,0,True,rCodDocumento);
       cdsObjeto.Data:=CtrlServProdxItemContr.ListProdServXItem(cds.FieldByName('IDCONTRATO').AsFloat,
                                                                0,0,True);

       cdsObjeto.Filtered:=False;
       cdsObjeto.Filter:='';

       cdsRateioxCC.Close;
       cdsRateioxCC.Data:=CtrlMedicao.ListMedicaoxRateio(rIdMedicaoAux, True);

       TFloatField(cdsDet.FieldByName('VALORUNITARIOOBJETO')).DisplayFormat:='#,##0.00';
       TFloatField(cdsDet.FieldByName('VALORMEDICAO')).DisplayFormat:='#,##0.00';

       cdsFormasPagamento.Close;
       if (cdsContratos.FieldByName('TIPOCONTRATO').AsString='A') then
           cdsFormasPagamento.Data:=CtrlListTerc.ListFormaRecPag(Sistema.IdEmpresa,'R')
       else
           cdsFormasPagamento.Data:=CtrlListTerc.ListFormaRecPag(Sistema.IdEmpresa,'P');

       // Marchetti - Pendencia 16347
       cdsParcelaMedicao.Data := CtrlMedicao.ListParcelaMedicao(rIDMedicaoAux);

       if (Sistema.UsaRad) and (not cdsParcelaMedicao.FieldByName('NUMRAD').IsNull) then
       begin
          btnAplicaIntegracao.Enabled := (DefineStatusRAD = 'A') and (cdsParcelaMedicao.FieldByName('CODDOCUMENTO').IsNull);
          btnAplicaIntegracao.Visible := btnAplicaIntegracao.Enabled;
          sbtnAlterar.Enabled         := not btnAplicaIntegracao.Enabled;
          sbtnApagar.Enabled          := not btnAplicaIntegracao.Enabled;
       end;

    cdsTributacao.Data := CtrlMedicao.GetDadosAlterador(StrToInt(MontaSelect.ValoresChave[1]));
    
    tbsObsContrato.Enabled := False;
    tbsFicha.Enabled := False;
    tbsNFS.Enabled := False;
    tbsTributacao.Enabled := False;
  end;
    RecuperaContaBancaria; // André Tavares - pendência 17868 - 11/11/2004

   cdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(cds.FieldByName('IDCONTRATO').AsFloat
                                                                              {, // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier  - início
                                                                               cds.FieldByName('IDOBJETO').AsFloat,
                                                                               cds.FieldByName('IDITEM').AsFloat,
                                                                               Cds.FieldByName('PARCELANUM').AsFloat
                                                                               // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - fim}
                                                                               );

   // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
   cdsANS.Data := CtrlContratoANS.ListaContratoANS(cds.FieldByName('IDCONTRATO').AsFloat, True);
   CarregarCamposDummyANS;
   dbgrdDetRowChanged(Self);

   TFloatField(CdsANS.FieldByName('VLRMENSAL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsANS.FieldByName('VLRANS')).DisplayFormat := '###,###,##0.00';
   // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
   _IdServico := Cds.FieldByName('NFSSERVICO').AsInteger;
   _CodNaturezaREINF := Cds.FieldByName('CODNATUREZAREINF').AsInteger;
end;

procedure TfrmMedicaoContratosMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Var
 rQtdeMedicao : Integer;
begin
   Accept := True;
   if (Trim(dbeNumDocumento.Text) = '') then
   begin
      MsgDlg('Obrigatório preencher o Número do Documento','Atenção',mtWarning,[mbOk],0);
      dbeNumDocumento.SetFocus;
      Accept := False;
   end else if (Trim(dblcContrato.Text) = '') then
   begin
      MsgDlg('Obrigatório preencher o Contrato ','Atenção',mtWarning,[mbOk],0);
      dblcContrato.SetFocus;
      Accept := False;
   end else if (Trim(cbbMesRef.Text) = '') then
   begin
      MsgDlg('Obrigatório preencher o Mês de referência','Atenção',mtWarning,[mbOk],0);
      cbbMesRef.SetFocus;
      Accept := False;
   end else if (Trim(spinedtAnoRef.Text) = '') or (Trim(spinedtAnoRef.Text) = '0') then
   begin
      MsgDlg('Obrigatório preencher o Ano de referência','Atenção',mtWarning,[mbOk],0);
      spinedtAnoRef.SetFocus;
      Accept := False;
   end else if (Trim(edDataMEdicao.Text) = '') then
   begin
      MsgDlg('Obrigatório preencher a data medição ','Atenção',mtWarning,[mbOk],0);
      edDataMEdicao.SetFocus;
      Accept := False;
   end else if (Trim(edDataLancto.Text) = '') and (cdsTemp.FieldByName('FLGDTLANCTO').AsString = 'S') then
   begin
      MsgDlg('Obrigatório preencher a data de Lançamento','Atenção',mtWarning,[mbOk],0);
      edDataLancto.SetFocus;
      Accept := False;
   end else if (Trim(edDataVenc.Text) = '') then
   begin
      MsgDlg('Obrigatório preencher a data vencimento','Atenção',mtWarning,[mbOk],0);
      edDataVenc.SetFocus;
      Accept := False;
   end else if (edDataLancto.Date > edDataVenc.Date) then
   begin
      MsgDlg('Data de Lançamento não pode ser superior ao vencimento','Atenção',mtWarning,[mbOk],0);
      edDataVenc.SetFocus;
      Accept := False;
   end else if (cdsDet.IsEmpty) then
   begin
      MsgDlg('Obrigatório preencher algum item de Medição','Atenção',mtWarning,[mbOk],0);
      Accept := False;
   end else if not(CtrlDiasUteis.DiaUtil(Sistema.IdEmpresa,edDataVenc.Date,True,True,False)) then
   begin
      if MsgDlg('A Data de Vencimento não é Dia Útil, confirma mesmo assim?',
                'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
         edDataVenc.SetFocus;
         Accept := False;
      end;
   end;


   //Cássio Rovaroto - SIG nº 115585 - Início
   {
   //Cássio Rovaroto -  SIG nº 23656.58469 - Início
   if Cds.State in [dsInsert, dsEdit] then
   begin
   	if VerificaServicoMaoDeObra then
    begin
    	if dbEdtNumNFS.Text = '' then
      begin
    		MsgDlg('É obrigatória as definições da nota fiscal de serviço.', 'Atenção', mtWarning, [mbOK], 0);
      	tbcDetalhe.TabIndex := 3;
        tbcDetalheChange(tbcDetalhe);
      	dbEdtNumNFS.SetFocus;
      	Accept := False;
        Exit;
      end;

      if dbEdtNumSerieNFS.Text = '' then
      begin
        if MsgDlg('A nota fiscal de serviço possui número de série?', 'Atenção', mtWarning, [mbYes, MbNo], 0) = mrYes then
        begin
      	  MsgDlg('É obrigatório a definição do número de série da nota fiscal de serviço.', 'Atenção', mtWarning, [mbOK], 0);
      	  dbEdtNumSerieNFS.SetFocus;
      	  Accept := False;
          Exit;
        end
        else
          Cds.FieldByName('NFSSERIE').AsString := '00000';
      end;

      if dbDtpDataEmissaoNFS.Text = '' then
      begin
      	MsgDlg('É obrigatório a definição da data de emissão da nota fiscal de serviço.', 'Atenção', mtWarning, [mbOK], 0);
      	dbEdtNumSerieNFS.SetFocus;
      	Accept := False;
        Exit;
      end;
    end;
   end;     }
   //Cássio Rovaroto -  SIG nº 23656.58469 - Fim
   //Cássio Rovaroto - SIG nº 115585 - Fim


   if Accept then begin
      cdsDet.First;
      while not(cdsDet.Eof) do begin
         //Marcos Luiz de Jesus - Sol 137468 - Kintana 830100 - 10/06/2010 - Início
         rQtdeMedicao := cdsDet.FieldbyName('QTDEMEDICAO').AsInteger;
         cdsDet.Edit;
         cdsDet.FieldbyName('QTDEMEDICAO').AsInteger       := rQtdeMedicao;
         //Marcos Luiz de Jesus - Sol 137468 - Kintana 830100 - 10/06/2010 - Fim
         cdsDet.FieldByName('IDPESSOA').AsFloat            :=Sistema.IdEmpresa;
         cdsDet.FieldByName('IDCONTRATO').AsFloat          :=cds.FieldByName('IDCONTRATO').AsFloat;

         //cdsDet.FieldByName('OBS').AsString              :=cds.FieldByName('OBS').AsString;                       //SIG80542
         cdsDet.FieldByName('OBS').AsString                :=BuscaObsrSemQuebras(cds.FieldByName('OBS').AsString);  //SIG80542

         cdsDet.FieldByName('HISTORICOCOMPL').AsString     :=cds.FieldByName('HISTORICOCOMPL').AsString;
         cdsDet.FieldByName('NUMLEITCODBARRAS').AsString   :=cds.FieldByName('NUMLEITCODBARRAS').AsString;
         cdsDet.FieldByName('NUMDIGCODBARRAS').AsString    :=cds.FieldByName('NUMDIGCODBARRAS').AsString;
         cdsDet.FieldByName('DATAPREVISTAVENC').AsDateTime :=cds.FieldByName('DATAPREVISTAVENC').AsDateTime;
         cdsDet.FieldByName('CODFORMA').AsFloat            :=cds.FieldByName('CODFORMA').AsFloat;
         cdsDet.FieldByName('NODOCUMENTO').AsFloat         :=cds.FieldByName('NODOCUMENTO').AsFloat;
         cdsDet.FieldByName('COMPLDOCUMENTO').AsString     :=cds.FieldByName('COMPLDOCUMENTO').AsString;
         cdsDet.FieldByName('TIPOCONTRATO').AsString       :=cds.FieldByName('TIPOCONTRATO').AsString;
         cdsDet.FieldByName('DATAMEDICAO').AsDateTime      :=cds.FieldByName('DATAMEDICAO').AsDateTime;
         cdsDet.FieldByName('DATALANCAMENTO').AsDateTime   :=cds.FieldByName('DATALANCAMENTO').AsDateTime;
         cdsDet.FieldByName('CODPORTFORMA').AsFloat        :=cds.FieldByName('CODPORTFORMA').AsFloat;
         cdsDet.FieldByName('MOECODIGO').AsFloat           :=cds.FieldByName('MOECODIGO').AsFloat;
         cdsDet.FieldByName('IDCBANCARIA').AsFloat         :=cds.FieldByName('IDCBANCARIA').AsFloat;
         cdsDet.FieldByName('CODCONTRATOEMPR').AsString    :=cds.FieldByName('CODCONTRATOEMPR').AsString;
         //Cássio Rovaroto - SIG nº 23656.58469 - Início
         cdsDet.FieldByName('NFSNUMERO').AsString 	   := Cds.FieldByName('NFSNUMERO').AsString;
         cdsDet.FieldByName('NFSSERIE').AsString           := Cds.FieldByName('NFSSERIE').AsString;
         cdsDet.FieldByName('NFSDATAEMISSAO').AsDateTime   := Cds.FieldByName('NFSDATAEMISSAO').AsDateTime;
         cdsDet.FieldByName('NFSOBS').AsString		   := Cds.FieldbyName('NFSOBS').AsString;
         //Cássio Rovaroto - SIG nº 23656.58469 - Início
         cdsDet.FieldByName('NFSSERVICO').asInteger	   := Cds.FieldbyName('NFSSERVICO').AsInteger; //Cássio rovaroto - SIG nº 123523
         cdsDet.FieldByName('FLGSIMPLES').AsString         := Cds.FieldByName('FLGSIMPLES').AsString;
         cdsDet.FieldByName('MES_REFERENCIA').AsString	   := Cds.FieldbyName('MES_REFERENCIA').AsString;
         cdsDet.FieldByName('ANO_REFERENCIA').AsString	   := Cds.FieldbyName('ANO_REFERENCIA').AsString;

         cdsDet.Post;
         cdsDet.Next;
      end;

     // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
     if sbtnInserir.Down then begin
       cdsRateioxCC.First;
       while (not cdsRateioxCC.Eof) do begin
         if (cdsRateioxCC.FieldByName('PLANOORIGEM').AsInteger = 0) then begin
           AtualizaPlanoPatro;
         end;
         cdsRateioxCC.Next;
       end;
       cdsRateioxCC.First;
     end;    
     // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
   end;
   inherited;
end;


procedure TfrmMedicaoContratosMT.CmeCadastroConfirma(Sender: TObject);
begin
   if (Cds.State in [dsInsert]) then
    begin
       cdsDet.EmptyDataSet;
       TFloatField(cdsDet.FieldByName('VALORUNITARIOOBJETO')).DisplayFormat:='#,##0.00';
       TFloatField(cdsDet.FieldByName('VALORMEDICAO')).DisplayFormat:='#,##0.00';

       // Marcio Motta - 26/05/2004 - Pendência: 16788
       molOrcamento1.Clear;

       cdsANS.EmptyDataSet; // Felipe A. Santos SOL 242313/17289 PPM 828977
    end;
   inherited;
end;

procedure TfrmMedicaoContratosMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
  sVlrAnsAux : string;
  dValorDifANS : Double;
begin
   Accept:=True;

  if (pgctrlDetalhe.ActivePage = tbsDet) then // Felipe A. Santos SOL 242313/17289 PPM 828977
  begin
   if (Trim(dblcItem.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Item ','Atenção',mtWarning,[mbOk],0);
       dblcItem.SetFocus;
       Accept:=False;
    end
   else
    if (Trim(dblcObjeto.Text)='') then
     begin
        MsgDlg('Obrigatório preencher o Objeto ','Atenção',mtWarning,[mbOk],0);
        dblcObjeto.SetFocus;
        Accept:=False;
     end
    else
     if (dbeValorTotal.Value<=0) then
      begin
         MsgDlg('A Medição obrigatoriamente tem que ter um valor','Atenção',mtWarning,[mbOk],0);
         dblcObjeto.SetFocus;
         Accept:=False;
      end
    else
// Daniel Simões - 02/05/2006 - ------------------------------------------------
     if ( cdsTemp.FieldByName('FLGINTEGRAORCA').AsString = 'S' ) then begin
       if ( molOrcamento1.edtCompOrc.Value = 0 ) then begin
         MsgDlg('Informe o número do compromisso orçamentário.','Atenção',mtWarning,[MbOk],0);
         molOrcamento1.edtCompOrc.SetFocus;
         Accept := False;
       end;
     end
// Daniel Simões - 02/05/2006 - ------------------------------------------------
    // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
    else
     if (cdsDet.FieldByName('PARCELANUM').AsInteger > cdsDet.FieldByName('NUMPARC2').AsInteger) then
      begin // RNG02 ER228
        MsgDlg('Todas as parcelas do item foram medidas. Não é possível realizar novas medições.', 'Atenção', mtWarning, [mbOk], 0);
        Accept := False;
      end;
    // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim


  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  end
  else if (pgctrlDetalhe.ActivePage = tbsANS) then
  begin
    if (CdsANS.State in [dsInsert, dsEdit]) then
    begin
      if (Trim(dbedtVlrMensal.Text) = '') or (dbedtVlrMensal.Text = '0,00') then
      begin
         MsgDlg('É obrigatório o preenchimento campo do VALOR MENSAL do ANS', 'Aviso', mtWarning, [mbOk], 0);
         dbedtVlrMensal.SetFocus;
         Accept := False;
      end
      else if (Trim(dbedtVlrANS.Text) = '') or (dbedtVlrANS.Text = '0,00')  then
      begin
        MsgDlg('É obrigatório o preenchimento do campo VALOR ANS', 'Aviso', mtWarning, [mbOk], 0);
        dbedtVlrANS.SetFocus;
        Accept := False;
      end
      else if (Trim(dbedtNumCI.Text) = '') then
      begin
        MsgDlg('É obrigatório o preenchimento do campo SOLICITAÇÃO.', 'Aviso', mtWarning, [mbOk], 0);
        dbedtVlrANS.SetFocus;
        Accept := False;
      end
      else if (Trim(StringReplace(medtRef.Text, '/', '', [rfReplaceAll])) = '') then
      begin
        MsgDlg('É obrigatório o preenchimento do campo REFERÊNCIA do ANS', 'Aviso', mtWarning, [mbOk], 0);
        medtRef.SetFocus;
        Accept := False;
      end
      else if (Trim(dbmmoObs.Text) = '') then
      begin
        MsgDlg('É obrigatório o preenchimento do campo OBSERVAÇÃO do ANS', 'Aviso', mtWarning, [mbOk], 0);
        dbmmoObs.SetFocus;
        Accept := False;
      end;
    end;

    if Accept then
    begin
      sVlrANSAux := StringReplace(lblVlrTotalANS.Caption,'.','',[rfReplaceAll]);
      sVlrANSAux := StringReplace(sVlrANSAux,'R$','',[rfReplaceAll]);

      dValorDifANS := (cdsANS.FieldByName('VLRANS').AsFloat - dValorANSOld);
      dValorANSAtual := StrToFloat(sVlrANSAux);

      lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dValorANSAtual + dValorDifANS);

      medtRef.Clear;
    end;
  end;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  if pgctrlDetalhe.ActivePage = tbsNFS  then
  begin

    if (CtrlMedicao.existeAtivProdServ) then //Cássio Rovaroto - SIG nº 135203
    begin
      if not(dbEdtNumNFS.Text = EmptyStr) and (cmProcListaServicos.Text = EmptyStr) then
      begin
        MsgDlg('É necessário o tipo de serviço, atividade e/ou produto relacionado', 'Aviso', mtWarning, [mbOk], 0);
        Accept := False;
      end;
    end;
  end;

  inherited;
end;

procedure TfrmMedicaoContratosMT.CmeDetalheConfirma(Sender: TObject);
begin
  // Marcio Motta - 21/05/2004 - 16788
  if cdsDet.State in dsEditModes then begin
    // Limpa o mol de orçamento caso o valor seja excluído manualmente do campo
    if (molOrcamento1.edtCompOrc.Value <= 0) then begin
      molOrcamento1.Clear;

    end else begin
      // Busca ID da reserva de orçamento caso tenha sido digitado, ao invés de buscar no MontaSelect
      if (molOrcamento1.edtCompOrc.Value > 0) then begin
        molOrcamento1.iIdCompromisso := CtrlOrcamento.BuscaIdNumReserva(0, StrToInt(FloatToStr(molOrcamento1.edtCompOrc.Value)), True);
        if molOrcamento1.iIdCompromisso = 0 then begin
          MsgDlg(CtrlOrcamento.MessageInfo,'Aviso',mtWarning,[mbOk],0);
          molOrcamento1.Clear;
          EXIT;
        end;
      end;
    end;

    // Marcio Motta - 21/05/2004 - 16788
    // Guarda o Número da Reserva orçamentária
    if molOrcamento1.iIdCompromisso > 0 then
      cdsDet.FieldByName('IDRESERVAORCAMEN').AsFloat := molOrcamento1.iIdCompromisso
    else
      cdsDet.FieldByName('IDRESERVAORCAMEN').AsFloat := 0;

  end;

  DesabilitaInsertTributos;

  inherited;

end;

procedure TfrmMedicaoContratosMT.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
   inherited;
   if cdsDet.Active then
    begin
       dblcContrato.Enabled:=(cdsDet.RecordCount=0);
       lblContrato.Enabled:=(cdsDet.RecordCount=0);
       pgctrlDetalhe.Enabled:=(Trim(dblcContrato.Text)<>'');
    end;
    
end;

procedure TfrmMedicaoContratosMT.dblcContratoChange(Sender: TObject);
var
  sNomeCampo : string;   //SIG111914
  iQtdeFields : integer; //SIG111914
begin
   if (cds.State in [dsInsert,dsEdit]) then
    begin
       if (Trim(dblcContrato.Text)<>'') then
        begin
           cdsFormasPagamento.Close;
           if (cdsContratos.FieldByName('TIPOCONTRATO').AsString='A') then
               cdsFormasPagamento.Data:=CtrlListTerc.ListFormaRecPag(Sistema.IdEmpresa,'R')
           else
               cdsFormasPagamento.Data:=CtrlListTerc.ListFormaRecPag(Sistema.IdEmpresa,'P');

           cdsItem.Close;
           cdsItem.Data:=CtrlItemContratual.ListItemXContrato(Sistema.IdEmpresa,
                                                              StrToIntDef(dblcContrato.LookupValue,0));
                                                              //Todos os Itens
           cdsObjeto.Close;
           cdsObjeto.Data:=CtrlServProdxItemContr.ListProdServXItem(StrToIntDef(dblcContrato.LookupValue,0),
                                                                    0,0,True); // Todos os Objetos
           cdsObjeto.Filtered:=False;
           cdsObjeto.Filter:='';
           //Cássio Rovaroto - SIG nº 134176 - Início
           {
           //TAES - SIG103678 - início
           if cdsRateioxCC.isEmpty then      //SIG111914
           begin
             cdsRateioxCC.Close;
             cdsRateioxCC.Data:=CtrlServProdxItemContr.ListRateio(
                                        StrToIntDef(dblcContrato.LookupValue,-1),0,0,    //SIG111914
                                        Sistema.IdEmpresa,True);
           end
           else
           //SIG111914 : inicio
           begin
             cdsRateioAux.data := CtrlServProdxItemContr.ListRateio(
                                        StrToIntDef(dblcContrato.LookupValue,-1),0,0,
                                        Sistema.IdEmpresa,True);

            cdsRateioxCC.Append;
            for iQtdeFields := 0 to cdsRateioAux.FieldCount - 1 do
            begin
               sNomeCampo := cdsRateioAux.Fields[iQtdeFields].FieldName;
               cdsRateioxCC.FieldByName(sNomeCampo).Value := cdsRateioAux.FieldByName(sNomeCampo).Value;
            end;
            cdsRateioxCC.Post;

            cdsRateioAux.Next;
           end;
           //SIG111914 : fim
           //TAES - SIG103678 - fim
           }
           //Cássio Rovaroto - SIG nº 134176 - Fim
           cds.FieldByName('IDFORCLI').AsFloat:=cdsContratos.FieldByName('IDFORCLI').AsFloat;
           cds.FieldByName('CODPORTFORMA').AsFloat:=cdsContratos.FieldByName('CODPORTFORMA').AsFloat;
           cds.FieldByName('TIPOCONTRATO').AsString:=cdsContratos.FieldByName('TIPOCONTRATO').AsString;


           // Felipe A. Santos SOL 242313/17289 PPM 828977
           if cdsContratos.FieldByName('FLGANS').AsString = 'S' then
           begin
             if tbcDetalhe.Tabs.IndexOf('ANS') = -1 then
             //Cássio Rovaroto -  SIG nº 32656.58469 - Início
	             tbcDetalhe.Tabs.Add('ANS') // Incluindo ANS
             //Cássio Rovaroto -  SIG nº 32656.58469 - Fim
           end
           else
           begin
              if tbcDetalhe.Tabs.IndexOf('ANS') <> -1 then
              begin
                if pgctrlDetalhe.ActivePage = tbsANS then
                begin
                  tbcDetalhe.TabIndex := 0;
                  tbcDetalheChange(tbcDetalhe);
                end;
                
                tbcDetalhe.Tabs.Delete(tbcDetalhe.Tabs.IndexOf('ANS')); // Excluindo ANS
              end;
           end;
           // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

        end
       else
        begin
        end;
    end;

   lblFormaPG.Enabled:=(Trim(dblcContrato.Text)<>'');
   dblcFormaPG.Enabled:=(Trim(dblcContrato.Text)<>'');

   lblBanco.Enabled:=(Trim(dblcContrato.Text)<>'');
   dbeBanco.Enabled:=(Trim(dblcContrato.Text)<>'');

   lblAgencia.Enabled:=(Trim(dblcContrato.Text)<>'');
   dbeAgencia.Enabled:=(Trim(dblcContrato.Text)<>'');

   lblNo.Enabled:=(Trim(dblcContrato.Text)<>'');
   dbeConta.Enabled:=(Trim(dblcContrato.Text)<>'');

   pgctrlDetalhe.Enabled:=(Trim(dblcContrato.Text)<>'');

   if (Trim(dblcContrato.Text)='') then begin
      dbeBanco.Clear;
      dbeAgencia.Clear;
      dbeConta.Clear;
   end;

   BtnBuscaContaCor.Enabled:=(Trim(dblcContrato.Text)<>'');
end;

procedure TfrmMedicaoContratosMT.dblcContratoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   FiIdContrato := strToIntDef(dblcContrato.LookupValue, -1);

   if not(cds.State in [dsInsert,dsEdit]) or (Trim(dblcContrato.Text)='') then Exit;

   // Marchetti - Pendencia 16455
   if CtrlUsuXContrato.ContratoPossuiAditamentoComRADPendente(StrToFloat(dblcContrato.LookupValue)) then
   begin
      MsgDlg('Esse contrato possui aditamento com RAD Pendente de aprovação','Aviso',mtWarning,[mbOk],0);
      Abort;
      Exit;
   end;
   // Fim Marchetti - Pendencia 16455

   //início André Tavares - pendência 17868 - 11/11/2004
   RecuperaContaBancaria;
   //fim André Tavares - pendência 17868 - 11/11/2004

   Cds.FieldByName('CODCONTRATOEMPR').AsString:=cdsContratos.FieldByName('CODCONTRATOEMPR').AsString;
  //Higor Nayde SOL 188854 Kintana 1784331 - Início
if FlgExit then begin
    if (CtrlAvaliacaoFornec.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
       MsgDlg('Este contrato de fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
    end;
  end;
//Higor Nayde SOL 188854 Kintana 1784331 - Fim
end;

procedure TfrmMedicaoContratosMT.BtnBuscaContaCorClick(Sender: TObject);
begin

   MsContaCor.Filtro.Clear;
   MsContaCor.Filtro.Add('PESSOA.IDPESSOA = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDPESSOA = ' +FloatToStr(cdsContratos.FieldByName('IDFORCLI').AsFloat));
   MsContaCor.Executar;

   if (MsContaCor.RetornouValor) then begin
     dbeConta.Text                             := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
     dbeBanco.Text                             := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
     dbeAgencia.Text                           := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
     cds.FieldByName('IDCBANCARIA').AsFloat    := StrToIntDef(MsContaCor.ValoresChave[0],0);
     cds.FieldByName('DESCTIPOCONTA').AsString := MsContaCor.ValoresChave[4]; //Descricao do CONTABANCARIA.TIPOCONTA
   end;
end;

procedure TfrmMedicaoContratosMT.dblcItemChange(Sender: TObject);
begin
   if not(cdsDet.State in [dsInsert,dsEdit]) then Exit;

   cdsObjeto.Filtered:=False;
   if Trim(dblcItem.LookupValue) <> '' then
     cdsObjeto.Filter := 'IDITEM = ' + dblcItem.LookupValue
   else
     cdsObjeto.Filter := 'IDITEM = -1';

   cdsObjeto.Filtered := True;

   dblcObjeto.DropDown;     // Paulo Nobre -  WO15653

// Daniel Simões - P: 17044 - 27/04/2006 - Início ------------------------------
     if ( cdsItem.FieldByName('TIPOCOBRANCA').AsString = 'PQ' ) then begin
       dbeQuantidade.Enabled    := True;
       dbeValorUnitario.Enabled := False;
       dbeQuantidade.Color      := clWindow;
       dbeValorUnitario.Color   := clMenu;
     end else begin
       dbeQuantidade.Enabled    := False;
       dbeValorUnitario.Enabled := True;
       dbeQuantidade.Color      := clMenu;
       dbeValorUnitario.Color   := clWindow;
     end;
// Daniel Simões - P: 17044 - 27/04/2006 - Fim ---------------------------------

   cdsDet.FieldByName('NOME_ITEM').AsString := dblcItem.Text;

   if not(bCarregandoMedAnterior) then dblcObjeto.Clear;
end;

procedure TfrmMedicaoContratosMT.dblcObjetoChange(Sender: TObject);
begin
   if not(cdsDet.State in [dsInsert,dsEdit]) or (bCarregandoMedAnterior) then Exit;

   if (Trim(dblcObjeto.Text)<>'') then
    begin

       //SIG61347 - Peterson Victor INICIO
       //cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat := cdsObjeto.FieldByName('VALORUNITARIOOBJETO').AsFloat;
       if (cdsDet.State = dsInsert) and
          (cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat = 0) then
       cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat := cdsObjeto.FieldByName('VALORUNITARIOOBJETO').AsFloat;
       //SIG61347 - Peterson Victor FIM

       // Início Pendência 23072 - 16/08/2006 - Daniel
       cdsDet.FieldByName('QTDEMEDICAO').AsInteger       := cdsObjeto.FieldByName('QTDEITEM').AsInteger;
       // Fim Pendência 23072
       dbeValorTotal.Value                               := dbeQuantidade.Value*dbeValorUnitario.Value;
       Cds.FieldByName('MOECODIGO').AsFloat              := cdsObjeto.FieldByName('MOECODIGO').AsFloat;

      // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
      if not(VeioDoAlerta) and
        (CtrlCtrlParcelaMedicao.ExisteNoControleDeAlertas(cdsObjeto.FieldByName('IDCONTRATO').AsInteger,
                                                          cdsObjeto.FieldByName('IDOBJETO').AsInteger,
                                                          cdsObjeto.FieldByName('IDITEM').AsInteger)) then
      begin
        if cdsDet.State = dsInsert then // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier
           cdsDet.FieldByName('PARCELANUM').AsInteger := (cdsObjeto.FieldByName('ULTPARCELA').AsInteger + 1);
      end
      else
      begin
        if cdsDet.State = dsInsert then // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier
           cdsDet.FieldByName('PARCELANUM').AsInteger := 0;
      end;

      cdsDet.FieldByName('NUMPARC2').AsInteger := cdsObjeto.FieldByName('NUMPARCELAS').AsInteger;
      // Felipe A. Santos SOL 218909/16724 PPM 588170  - fim
    end
   else
    begin
       cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat:=0;
       dbeValorTotal.Value:=dbeQuantidade.Value*dbeValorUnitario.Value;
    end;

   cdsDet.FieldByName('NOMEOBJETO').AsString:=dblcObjeto.Text;
end;

//edilaine SIG115595 : inicio
procedure TfrmMedicaoContratosMT.btnRateioDifClick(Sender: TObject);
begin
  ApresentaRateio( trPadrao );
end;


procedure TfrmMedicaoContratosMT.ApresentaRateio(tipoRateio : tpTipoRateio);
var
  frmRateio: TfrmRateioMT;
  nPlano : String; // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
  nIdDespesaOrc,sNomeCampo : String;// Thiago Melo SOL 238060 PPM 496839
  iQtdeFields : Integer;
begin
   // Exibe Form de Rateios Diferenciados
   frmRateio := TfrmRateioMT.Create(nil);
   try
     //edilaine 115595 : inicio
     if tipoRateio = trFDO then
     begin
       frmRateio.Caption := 'Rateio FDO Digital';
       frmRateio.rgpTipoRateio.enabled := false;        //edilaine WO15134
     end;
     //edilaine 115595 : fim

     frmRateio.edItem.Text        := Trim(dblcItem.Text);
     frmRateio.edObjeto.Text      := Trim(dblcObjeto.Text);
     frmRateio.edQtdeTotal.Value  := dbeQuantidade.Value;
     frmRateio.edValorTotal.Value := dbeValorTotal.Value;
     //Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
     frmRateio.CodPortForma       := cds.FieldByName('CODPORTFORMA').AsInteger;
     frmRateio.IDForCli           := Cds.FieldByName('IDFORCLI').AsInteger;
     //Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

     frmRateio.iIdContrato := FiIdContrato; // andré tavares - pendencia 18749 - 02/03/2005
     cdsDet.FieldByName('IDCONTRATO').AsInteger := frmRateio.iidContrato;
     frmRateio.iIdObjeto         := cdsDet.FieldByName('IDOBJETO').AsInteger;
     frmRateio.iIdItem           := cdsDet.FieldByName('IDITEM').AsInteger;
     frmRateio.iParcNum           := cdsDet.FieldByName('PARCELANUM').AsInteger;//Petri SOL 257896 PPM 1014759


     // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
     if (Trim(frmRateio.CodTipRecDes) = '') or ((Trim(frmRateio.CodTipRecDes)) <> (Trim(cdsRateioxCC.FieldByName('CODTIPRECDES').AsString))) then begin
       frmRateio.CodTipRecDes       := cdsRateioxCC.FieldByName('CODTIPRECDES').AsString;
     end;
     // Thiago Meoo xxx
     //frmRateio.cdsRateioxCCDif.Data     := cdsRateioxCC.Data; //TAES - SIG103678

     //edilaine SIG111898 : fim
     if (cmeCadastro.Operacao = opAlterar) or
        ((cmeCadastro.Operacao = opInserir) and (tipoRateio = trFDO))  or   //edilaine SIG115595
        ((cmeCadastro.Operacao = opInserir) and (cmeDetalhe.Operacao = opAlterar)) then     //edilaine - SIG117244
     begin
       frmRateio.cdsRateioxCCDif.Data := CtrlMedicao.ListMedicaoxRateio(-1, True); //vazio

       cdsRateioxCC.Filter :=
          'IDITEM='+FloatToStr(cdsDet.FieldByName('IDITEM').AsFloat) +
          ' AND '+
          'IDOBJETO='+FloatToStr(cdsDet.FieldByName('IDOBJETO').AsFloat) +
          ' AND ' +
          'PARCELANUM = ' +FloatToStr(cdsDet.FieldByName('PARCELANUM').AsFloat) ; //Petri SOL 257896 PPM 1014759
       cdsRateioxCC.Filtered := True;
       cdsRateioxCC.First;

       while not cdsRateioxCC.Eof do
       begin

         frmRateio.cdsRateioxCCDif.Append;
         for iQtdeFields := 0 to cdsRateioxCC.FieldCount - 1 do
         begin
            sNomeCampo := cdsRateioxCC.Fields[iQtdeFields].FieldName;
            if frmRateio.cdsRateioxCCDif.FindField(sNomeCampo) <> nil then    //edilaine SIG115595
               frmRateio.cdsRateioxCCDif.FieldByName(sNomeCampo).Value := cdsRateioxCC.FieldByName(sNomeCampo).Value;
         end;
         frmRateio.cdsRateioxCCDif.Post;

         cdsRateioxCC.Next;
       end;
     end
     else
     begin
       frmRateio.cdsRateioxCCDif.Data := CtrlServProdxItemContr.ListRateio(
                                        StrToIntDef(dblcContrato.LookupValue,0),0,0,
                                        Sistema.IdEmpresa,True); //TAES - SIG103678
     end;
     //edilaine SIG111898 : fim

     frmRateio.cdsRateioxCCDif.Filtered := False;
     frmRateio.cdsRateioxCCDif.Filter   :=
       'IDITEM='+FloatToStr(cdsDet.FieldByName('IDITEM').AsFloat) +
       ' AND '+
       'IDOBJETO='+FloatToStr(cdsDet.FieldByName('IDOBJETO').AsFloat) +
       ' AND ' +
       'PARCELANUM = ' +FloatToStr(cdsDet.FieldByName('PARCELANUM').AsFloat) ; //Petri SOL 257896 PPM 1014759
     frmRateio.cdsRateioxCCDif.Filtered := True;
     frmRateio.cdsRateioxCCDif.First;

     //TAES - SIG103678 - início
     //Bruno Bastos - Sol 122362 - Kintana 614437 - 19/08/2009 - Início
     {cdsRateioxCC.Filtered := False;
     cdsRateioxCC.Filter   :=
       'IDITEM='+FloatToStr(cdsDet.FieldByName('IDITEM').AsFloat) +
       ' AND '+
       'IDOBJETO='+FloatToStr(cdsDet.FieldByName('IDOBJETO').AsFloat) +
       ' AND ' +
       'PARCELANUM = ' +FloatToStr(cdsDet.FieldByName('PARCELANUM').AsFloat) ; //Petri SOL 257896 PPM 1014759
     cdsRateioxCC.Filtered := True;
     cdsRateioxCC.First;}
     //Bruno Bastos - Sol 122362 - Kintana 614437 - 19/08/2009 - Fim
     //TAES - SIG103678 - fim

     // Ricardo A. SOL 104897
     // armazena os dados do objeto/item que serão compartilhados por todos
     // os itens do rateio

     //TAES - SIG103678 - início
     frmRateio.cdsRateioxCCDif.First();
     frmRateio.IdPessoa := frmRateio.cdsRateioxCCDif.FieldByName( 'IDPESSOA' ).AsInteger;
     frmRateio.Conta := frmRateio.cdsRateioxCCDif.FieldByName( 'CONTA' ).AsString;
     frmRateio.PlaConta := frmRateio.cdsRateioxCCDif.FieldByName( 'PLACONTA' ).AsString;
     //TAES - SIG103678 - fim


     nIdDespesaOrc := frmRateio.cdsRateioxCCDif.FieldByName('IDDESPESAORC').AsString; // Thiago Melo SOL 238060 PPM 496839 //TAES - SIG103678

     if ( frmRateio.ShowModal = mrOk ) then
     begin
       nPlano := frmRateio.cdsRateioxCCDif.FieldByName('PLANO').AsString; // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

       //TAES - SIG103678 - início
       {cdsRateioxCC.Close;
       cdsRateioxCC.Data := frmRateio.cdsRateioxCCDif.Data;
       cdsRateioxCC.EmptyDataSet;}
       //TAES - SIG103678 - fim

        frmRateio.cdsRateioxCCDif.First;

        //edilaine SIG111898 : inicio
        if not frmRateio.cdsRateioxCCDif.Eof then
        begin

          cdsRateioxCC.Filter   :=
             'IDITEM='+FloatToStr(cdsDet.FieldByName('IDITEM').AsFloat) +
             ' AND '+
             'IDOBJETO='+FloatToStr(cdsDet.FieldByName('IDOBJETO').AsFloat) +
             ' AND ' +
             'PARCELANUM = ' +FloatToStr(cdsDet.FieldByName('PARCELANUM').AsFloat) ; //Petri SOL 257896 PPM 1014759
          cdsRateioxCC.Filtered := True;
          cdsRateioxCC.First;
          while not cdsRateioxCC.eof do
             cdsRateioxCC.delete;


          while not frmRateio.cdsRateioxCCDif.Eof do
          begin

            cdsRateioxCC.Append;
            for iQtdeFields := 0 to frmRateio.cdsRateioxCCDif.FieldCount - 1 do
            begin
               sNomeCampo := frmRateio.cdsRateioxCCDif.Fields[iQtdeFields].FieldName;
               if cdsRateioxCC.FindField(sNomeCampo) <> nil then    //edilaine SIG115595
                  cdsRateioxCC.FieldByName(sNomeCampo).Value := frmRateio.cdsRateioxCCDif.FieldByName(sNomeCampo).Value;
            end;
            cdsRateioxCC.Post;

            frmRateio.cdsRateioxCCDif.Next;
          end;
        end;
        //edilaine SIG111898 : fim

     end;
     frmRateio.cdsRateioxCCDif.Filtered := False;

      {
      ShowMessage('cdsRateioxCC   ' + IntToStr(cdsRateioxCC.RecordCount) + chr(13)+
                  'cdsRateioxCCDif  ' + IntToStr(frmRateio.cdsRateioxCCDif.RecordCount));

      frmRateio.cdsRateioxCCDif.First;
      cdsRateioxCC.First;

      while not frmRateio.cdsRateioxCCDif.Eof do
      begin
         ShowMessage(frmRateio.cdsRateioxCCDif.FieldByName('PLANO').AsString);
         frmRateio.cdsRateioxCCDif.Next;
      end;

      while not cdsRateioxCC.Eof do
      begin
         ShowMessage(cdsRateioxCC.FieldByName('PLANO').AsString);
         cdsRateioxCC.Next;
      end;


      for wcont = 0 to  cdsRateioxCC.RecordCount do
      begin

         show cdsRateioxCC.FieldByName('PLANO').AsString
      end;
      }



     // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
     if Trim(cdsRateioxCC.FieldByName('PLANO').AsString) = '' then begin
       atualizaPlano(nPlano);
     end;
     // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

     // Thiago Melo SOL 238060 PPM 496839
     atualizaDespesaOrc(nIdDespesaOrc);
     // Thiago Melo SOL 238060 PPM 496839

   finally
     FreeAndNil( frmRateio );
   end;
end;

procedure TfrmMedicaoContratosMT.dbeQuantidadeChange(Sender: TObject);
begin
  if not(cdsDet.State in [dsInsert,dsEdit]) then Exit;

  dbeValorTotal.Value := dbeQuantidade.Value*dbeValorUnitario.Value;
end;

// Daniel Simões - 23072 - Início ----------------------------------------------
procedure TfrmMedicaoContratosMT.dbeValorUnitarioChange(Sender: TObject);
begin
  inherited;

  if not(cdsDet.State in [dsInsert,dsEdit]) then Exit;

  dbeValorTotal.Value := dbeQuantidade.Value*dbeValorUnitario.Value;
end;
// Daniel Simões - 23072 - Fim -------------------------------------------------

procedure TfrmMedicaoContratosMT.dsDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if cdsDet.Active then
    begin
       dblcContrato.Enabled:=(cdsDet.RecordCount=0);
       lblContrato.Enabled:=(cdsDet.RecordCount=0);
    end;

   // Marchetti - Pendencia 16957
   if cds.Active then begin
      if cds.FieldByName('FLGESTORNADO').AsInteger = 0 then
         dbStatus.Font.Color := clBlack
      else
         dbStatus.Font.Color := clRed;
      // Fim - Marchetti - Pendencia 16957
   end;
end;

procedure TfrmMedicaoContratosMT.cdsDetAfterScroll(DataSet: TDataSet);
begin
   cdsObjeto.Filtered:=False;
   cdsObjeto.Filter:='IDITEM = '+FloatToStr(cdsDet.FieldByName('IDITEM').AsFloat);
   cdsObjeto.Filtered:=True;
end;

procedure TfrmMedicaoContratosMT.BuscaDadosMedicaoAnterior(rCodDocumento: Double);
var
   cdsAux     :  TCMClientDataSet;
   rIdMedicao : Double;
begin
   rIdMedicao:=0;
   bCarregandoMedAnterior:=True;
   cdsAux:=TCMClientDataSet.Create(Self);
   try
      cdsAux.Data:=CtrlMedicao.ListParcelaXDoc(rCodDocumento);
      rIdMedicao:=cdsAux.FieldByName('IDMedicao').AsFloat;

      cdsAux.Close;
      cdsAux.Data := CtrlMedicao.ListMedicao(rIDMedicao,Sistema.IdEmpresa);
      cdsAux.First;

      if not cdsAux.IsEmpty then
      begin
      //Inclusão do Mestre
      cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
      cds.FieldByName('NUMAGENCIA').AsString:=cdsAux.FieldByName('NUMAGENCIA').AsString;
      cds.FieldByName('IDCONTRATO').AsFloat:=cdsAux.FieldByName('IDCONTRATO').AsFloat;
      cds.FieldByName('CONTACORRENTE').AsString:=cdsAux.FieldByName('CONTACORRENTE').AsString;
      cds.FieldByName('NUMBANCO').AsString:=cdsAux.FieldByName('NUMBANCO').AsString;
      cds.FieldByName('NUMAGENCIA').AsString:=cdsAux.FieldByName('NUMAGENCIA').AsString;
      cds.FieldByName('TIPOCONTA').AsString:=cdsAux.FieldByName('TIPOCONTA').AsString;
      cds.FieldByName('NOMEBANCO').AsString:=cdsAux.FieldByName('NOMEBANCO').AsString;
      cds.FieldByName('NOMEAGENCIA').AsString:=cdsAux.FieldByName('NOMEAGENCIA').AsString;
      cds.FieldByName('DESCTIPOCONTA').AsString:=cdsAux.FieldByName('DESCTIPOCONTA').AsString;
      cds.FieldByName('CODFORMA').AsFloat:=cdsAux.FieldByName('CODFORMA').AsFloat;
      cds.FieldByName('IDCBANCARIA').AsFloat:=cdsAux.FieldByName('IDCBANCARIA').AsFloat;
      cds.FieldByName('OBS').AsString:=cdsAux.FieldByName('OBS').AsString;
      cds.FieldByName('HISTORICOCOMPL').AsString:=cdsAux.FieldByName('HISTORICOCOMPL').AsString;
      //Cássio Rovaroto - SIG nº 74988 - Início
      //Impedir que se carregue os dados de codigo de barras de medições anteriores.
      //cds.FieldByName('NUMLEITCODBARRAS').AsString:=cdsAux.FieldByName('NUMLEITCODBARRAS').AsString;
      cds.FieldByName('NUMLEITCODBARRAS').AsString := EmptyStr;
      //cds.FieldByName('NUMDIGCODBARRAS').AsString:=cdsAux.FieldByName('NUMDIGCODBARRAS').AsString;
      cds.FieldByName('NUMDIGCODBARRAS').AsString := EmptyStr;
      //Cássio Rovaroto - SIG nº 74988 - Fim

      RecuperaContaBancaria; // André Tavares - pendência 17868 - 11/11/2004
      end
      else
      begin
        //Inclusão do Mestre
        cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
        cds.FieldByName('NUMAGENCIA').AsString:=EmptyStr;
        cds.FieldByName('IDCONTRATO').AsFloat:= 0;
        cds.FieldByName('CONTACORRENTE').AsString:=EmptyStr;
        cds.FieldByName('NUMBANCO').AsString:=EmptyStr;
        cds.FieldByName('NUMAGENCIA').AsString:=EmptyStr;
        cds.FieldByName('TIPOCONTA').AsString:=EmptyStr;
        cds.FieldByName('NOMEBANCO').AsString:=EmptyStr;
        cds.FieldByName('NOMEAGENCIA').AsString:=EmptyStr;
        cds.FieldByName('DESCTIPOCONTA').AsString:=EmptyStr;
        cds.FieldByName('CODFORMA').AsFloat:=0;
        cds.FieldByName('IDCBANCARIA').AsFloat:=0;
        cds.FieldByName('OBS').AsString:=EmptyStr;
        cds.FieldByName('HISTORICOCOMPL').AsString := EmptyStr;
        cds.FieldByName('NUMLEITCODBARRAS').AsString := EmptyStr;
        cds.FieldByName('NUMDIGCODBARRAS').AsString := EmptyStr;
      end;
      //Inclusão dos detalhes

      {// Felipe A. Santos SOL 218909/16724 PPM 588170 - início
      cdsDet.EmptyDataSet;
      TFloatField(cdsDet.FieldByName('VALORUNITARIOOBJETO')).DisplayFormat:='#,##0.00';
      TFloatField(cdsDet.FieldByName('VALORMEDICAO')).DisplayFormat:='#,##0.00';

      while not(cdsAux.Eof) do
      begin
         cdsDet.Append;
         cdsDet.FieldByName('IDPESSOA').AsFloat            := Sistema.IdEmpresa;
         cdsDet.FieldByName('IDCONTRATO').AsFloat          := cdsAux.FieldByName('IDCONTRATO').AsFloat;
         cdsDet.FieldByName('CODCONTRATOEMPR').AsString    := cdsAux.FieldByName('CODCONTRATOEMPR').AsString;
         cdsDet.FieldByName('IDITEM').AsFloat              := cdsAux.FieldByName('IDITEM').AsFloat;
         cdsDet.FieldByName('IDOBJETO').AsFloat            := cdsAux.FieldByName('IDOBJETO').AsFloat;
         cdsDet.FieldByName('OBSERVACAO').AsString         := cdsAux.FieldByName('OBSERVACAO').AsString;
         cdsDet.FieldByName('NOME_ITEM').AsString          := cdsAux.FieldByName('NOME_ITEM').AsString;
         cdsDet.FieldByName('NOMEOBJETO').AsString         := cdsAux.FieldByName('NOMEOBJETO').AsString;
         cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat := cdsAux.FieldByName('VALORUNITARIOOBJETO').AsFloat;
         cdsDet.FieldByName('QTDEMEDICAO').AsInteger       := cdsAux.FieldByName('QTDEMEDICAO').AsInteger;

         // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
         cdsDet.FieldByName('PARCELANUM').AsInteger        := cdsAux.FieldByName('PARCELANUM').AsInteger;
         cdsDet.FieldByName('NUMPARC2').AsInteger          := cdsAux.FieldByName('NUMPARC2').AsInteger;
         cdsDet.FieldByName('IDPARCMEDICAO').AsInteger     := cdsAux.FieldByName('IDPARCMEDICAO').AsInteger;
         cdsDet.FieldByName('VENCIMENTO').AsDateTime       := cdsAux.FieldByName('VENCIMENTO').AsDateTime;
         cdsDet.FieldByName('IDADITAMENTO').AsInteger     := cdsAux.FieldByName('IDADITAMENTO').AsInteger;
         // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

//         cdsDet.FieldByName('IDDESPESAORC').AsInteger       := cdsAux.FieldByName('IDDESPESAORC').AsInteger; // Thiago Melo SOL 237146 PPM 482149
         cdsDet.Post;
         cdsAux.Next;
      end; // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim }
      cdsAux.First;
   finally
      cdsAux.Free;
      bCarregandoMedAnterior:=False;
   end;
end;

procedure TfrmMedicaoContratosMT.dsDetDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   btnRateioDif.Enabled:=(Trim(dblcItem.Text)<>'') and (Trim(dblcObjeto.Text)<>'') and
                         (cdsDet.FieldByName('QTDEMEDICAO').AsFloat<>0) and
                         (cdsDet.FieldByName('VALORMEDICAO').AsFloat<>0) and
                         (rbPadrao.checked);         //edilaine SIG115595

end;

procedure TfrmMedicaoContratosMT.CmeDetalheEdit(Sender: TObject);
begin

  // Marcio Motta - 27/05/2004 - Pendência: 16788
  if (not cdsDet.FieldByName('IDRESERVAORCAMEN').IsNull) and ((cdsDet.FieldByName('IDRESERVAORCAMEN').AsFloat)>0) then
  begin
    molOrcamento1.iIdCompromisso   := cdsDet.FieldByName('IDRESERVAORCAMEN').AsInteger;
    molOrcamento1.edtCompOrc.Value := CtrlOrcamento.BuscaIdNumReserva(molOrcamento1.iIdCompromisso, 0,True);
  end else begin
    molOrcamento1.Clear;
  end;

  inherited;
end;

procedure TfrmMedicaoContratosMT.sbtnEstornarClick(Sender: TObject);
var
   rIDMedicaoAux : Double;
begin
   inherited;
   bProcessaEstorno := True;

   //início - André Tavares - pendência 17867 - 10/11/2004
   dtpkDataEstorno.Date := date;
   twDtEstorno.Visible  := true;
   repeat application.ProcessMessages; until twDtEstorno.Visible = false;
   //fim - André Tavares - pendência 17867 - 10/11/2004
   if bProcessaEstorno then
   begin
      if not CtrlMedicao.AplicaAtualMedicao(4) then //Estorno
      begin
        MsgDlg(CtrlMedicao.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        rIDMedicaoAux := cds.FieldByName('IDMEDICAO').AsFloat;
        cds.Close;
        cds.Data:=CtrlMedicao.ListMedicao(rIDMedicaoAux,Sistema.IdEmpresa);
      end
      else
      begin
        molOrcamento1.Clear; // Marcio Motta  31/05 - 16788
        MsgDlg('Medição estornada com sucesso','Aviso',mtWarning,[mbOk],0);
        sbtnEstornar.Down := False;
        Cds.Data    := CtrlMedicao.ListMedicao(-1,-1); //vazio
        CdsDet.Data := CtrlMedicao.ListMedicao(-1,-1); //vazio
      end;
   end;
end;

procedure TfrmMedicaoContratosMT.sbtnAlterarClick(Sender: TObject);
begin
  // Marchetti - Pendencia 16957
  if (cds.FieldByName('FLGESTORNADO').AsInteger=1) then begin
    MsgDlg('Não é possível alterar Medição estornada','Atenção',mtInformation,[mbOK],0);
    Exit;
  end;
  // Fim - Marchetti - Pendencia 16957

  inherited;

  sbtnEstornar.Enabled := cds.State <> dsEdit;

// Daniel Simões - 23072 - Início ----------------------------------------------
  if ( cdsItem.FieldByName('TIPOCOBRANCA').AsString = 'PQ' ) then begin
    dbeQuantidade.Enabled    := True;
    dbeValorUnitario.Enabled := False;
    dbeQuantidade.Color      := clWindow;
    dbeValorUnitario.Color   := clMenu;
  end else begin
    dbeQuantidade.Enabled    := False;
    dbeValorUnitario.Enabled := True;
    dbeQuantidade.Color      := clMenu;
    dbeValorUnitario.Color   := clWindow;
  end;
// Daniel Simões - 23072 - Fim -------------------------------------------------

  //WO8227 - Helen - Inicio
  dDtLanc := Cds.FieldByName('DATALANCAMENTO').AsDateTime;
  dDtVenc := Cds.FieldByName('DATAPREVISTAVENC').AsDateTime;
  //WO8227 - Helen - Fim
end;

procedure TfrmMedicaoContratosMT.FormShow(Sender: TObject);
begin
   inherited;
   sbtnEstornar.Enabled := False;
   FlgExit:=true; //Higor Nayde SOL 188854 Kintana 1784331 
   // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
   // se a funcionalidade foi aberta pela funcionalidade alerta de medição então carrega
   // os dados com base no contrato que está selecionado na funcionalidade de alerta.

   if (VeioDoAlerta) then
      sbtnInserirClick(Self);

   // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

   // Paulo Nobre - WO15653 - Inicio
   dUltimoSaldo := 0.00;
   dValorSaldo := 0.00;
   // Paulo Nobre - WO15653 - Fim   

end;



procedure TfrmMedicaoContratosMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;

   Cds.Data          := CtrlMedicao.ListMedicao(-1,-1); //vazio
   cdsRateioxCC.Data := CtrlServProdxItemContr.ListRateio(-1,0,0,-1,True);//vazio
   cdsDet.Data       := CtrlMedicao.ListMedicao(-1,-1); //vazio
   cdsANS.Data       := CtrlContratoANS.ListaContratoANS(-1, true); // Felipe A. Santos SOL 242313/17289 PPM 828977
   cdsTributacao.Data := CtrlMedicao.GetDadosAlterador(-1);

   btnAplicaIntegracao.Visible := False;
   lblStatus.Visible := False;
   lblRAD.Visible    := False;

   _IdServico := -1;
   _CodNaturezaREINF := -1;
   iCalcTributos := 0;
   iCalcChangeTrib := 0;
   chkOptanteSimples.Checked := False;
end;



function TfrmMedicaoContratosMT.DefineStatusRAD: String;
var iNumRad : Double;
begin
   sStatusMedicao := CtrlMedicao.StatusMedicaoRAD(cds.FieldByName('IDCONTRATO').AsFloat,cds.FieldByName('IDMEDICAO').AsFloat,iNumRad);
   if cds.FieldByName('NUMRAD').IsNull then begin
      lblRAD.Visible    := False;
      lblStatus.Visible := False;
   end else begin
      case sStatusMedicao[1] of
        'R' : lblStatus.Caption := 'Recusado';
        'A' : lblStatus.Caption := 'Aprovado';
        'P' : lblStatus.Caption := 'Pendente';
        'E' : lblStatus.Caption := 'Excluído';
      end;
      if iNumRad > 0 then
         lblRAD.Caption    := 'RAD ' + FloatToStr(iNumRad)
      else
         lblRAD.Caption    := 'RAD ' + FloatToStr(cds.FieldByName('NUMRAD').AsFloat);
      lblRAD.Visible    := True;
      lblStatus.Visible := True;
   end;

   Result := sStatusMedicao;
end;



procedure TfrmMedicaoContratosMT.btnAplicaIntegracaoClick(Sender: TObject);
var sIDMedicao : String;
begin
   inherited;
   cds.First;
   sIDMedicao := '';
   while not cds.Eof do
   begin
      if sIDMedicao <> '' then sIDMedicao := sIDMedicao + ',';
      sIDMedicao := sIDMedicao + cds.FieldByName('IDMEDICAO').AsString;
      cds.Next;
   end;

   if not CtrlMedicao.AplicaDadosIntegrados(sIDMedicao, 0, (not chkNaoContabiliza.Checked)) then
   begin
     if trim( CtrlMedicao.MessageInfo ) <> '' then
       MsgDlg(CtrlMedicao.MessageInfo,'Aviso',mtWarning,[mbOk],0);
     Exit;
   end;

   DefineStatusRAD;
   btnAplicaIntegracao.Enabled := False;
   btnAplicaIntegracao.Visible := btnAplicaIntegracao.Enabled;
   sbtnAlterar.Enabled         := not btnAplicaIntegracao.Enabled;
   sbtnApagar.Enabled          := not btnAplicaIntegracao.Enabled;
end;

procedure TfrmMedicaoContratosMT.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   lblRAD.Visible    := False;
   lblStatus.Visible := False;
end;

procedure TfrmMedicaoContratosMT.bbtnConfirmarClick(Sender: TObject);
begin
  // Paulo Nobre - WO30552 - Inicio

 //WO8227 - Helen - Inicio
  if (cds.State in [dsEdit]) then
  begin
      cdsTributacao.First;
      while not cdsTributacao.eof do
      begin
          if (Cds.FieldByName('DATAPREVISTAVENC').AsDateTime <> dDtVenc ) and
             (cdsTributacao.FieldByName('CODNATUREZA').AsString = '5952') then  // Retenção PIS/COFINS/CSLL
          begin
             cdsTributacao.edit;
             cdsTributacao.FieldByName('DATALANCTO').AsDateTime := Cds.FieldByName('DATAPREVISTAVENC').AsDateTime;
             cdsTributacao.post;
          end
          else
          begin
             if (Cds.FieldByName('DATALANCAMENTO').AsDateTime <> dDtLanc ) and
                (cdsTributacao.FieldByName('CODNATUREZA').AsString = '1708') then  // IRRF S/ SERVICOS TERCEIROS - PJ
             begin
                cdsTributacao.edit;
                cdsTributacao.FieldByName('DATALANCTO').AsDateTime := Cds.FieldByName('DATALANCAMENTO').AsDateTime;
                cdsTributacao.post;
             end;
          end;

          cdsTributacao.next;
      end;
  end;
  //WO8227 - Helen - Fim

  // Paulo Nobre - WO30552 - Fim


//     inherited;
//   DefineStatusRAD;
  bOk := True;  // Felipe A. Santos SOL 242313/17289 PPM 828977
  //Higor Nayde Ferreira SOL 189037 KTN  1784016 INICIO
  FlgExit := true; //Higor Nayde SOL 188854 Kintana 1784331
  if (edDataMEdicao.Date <> edDataLancto.Date)then
  begin
    if MsgDlg('As datas de Medição e Lançamento são diferentes, deseja continuar ?', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
       exit
    else
    begin
      inherited;
      DefineStatusRAD;
    end;
  end
  else
  begin
    inherited;
    DefineStatusRAD;
  end;
  //Higor Nayde Ferreira SOL 189037 KTN  1784016 FIM

  bOk := False;  // Felipe A. Santos SOL 242313/17289 PPM 828977
end;

procedure TfrmMedicaoContratosMT.sbtnApagarClick(Sender: TObject);
begin
   inherited;
   lblRAD.Visible    := False;
   lblStatus.Visible := False;
end;

//início André Tavares - pendência 17867 - 10/11/2004
procedure TfrmMedicaoContratosMT.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if trim(dtpkDataEstorno.Text) = '' then
  begin
    MsgDlg('A data para estorno deve ser preenchida','Erro',mtError,[mbOk],0);
    twDtEstorno.Visible := true;
    dtpkDataEstorno.SetFocus;
    abort;
  end;
  CtrlMedicao.DataEstornoDoc := dtpkDataEstorno.Date;
  twDtEstorno.Visible := false;
end;

procedure TfrmMedicaoContratosMT.twDtEstornoClose(Sender: TObject);
begin
  BitBtn1Click(sender);
end;
//início André Tavares - pendência 17868 - 11/11/2004
function TfrmMedicaoContratosMT.RecuperaContaBancaria: Boolean;
begin
   result := false;
   cdsDadosConta.Close;
   cdsDadosConta.Data:=CtrlListTerc.ListDadosContaBanc(cdsContratos.FieldByName('IDFORCLI').AsFloat);
   if cds.State = dsBrowse then cds.Edit;
   Cds.FieldByName('IDCBANCARIA').AsFloat:=cdsDadosConta.FieldByName('IDCBANCARIA').AsFloat;
   Cds.FieldByName('NUMBANCO').AsString:=cdsDadosConta.FieldByName('NUMBANCO').AsString;
   Cds.FieldByName('NUMAGENCIA').AsString:=cdsDadosConta.FieldByName('NUMAGENCIA').AsString;
   Cds.FieldByName('CONTACORRENTE').AsString:=cdsDadosConta.FieldByName('CONTACORRENTE').AsString;
   Cds.FieldByName('DESCTIPOCONTA').AsString:=cdsDadosConta.FieldByName('DESCTIPOCONTA').AsString;
   result := not cdsDadosConta.IsEmpty;
end;

procedure TfrmMedicaoContratosMT.twDtEstornoVisibleChanged(Sender: TObject);
begin
  inherited;
  twDtEstorno.left := ({frmMedicaoContratosMT}screen.width - twDtEstorno.width) div 2;    // Edilaine - SOL 191844 / KTN 1822119
  twDtEstorno.top  := ({frmMedicaoContratosMT}screen.height - twDtEstorno.height) div 2;  // Edilaine - SOL 191844 / KTN 1822119
end;
//fim André Tavares - pendência 17868 - 11/11/2004


procedure TfrmMedicaoContratosMT.bbtnCancelarClick(Sender: TObject);
begin
  sbtnEstornar.Enabled := true;
  //William Moreira da Silva - SIG 40276
  inherited;
  //William Moreira da Silva - SIG 40276

  FlgExit := true; //Higor Nayde SOL 188854 Kintana 1784331
  if bbtnCancelar.ModalResult = mrNone then // Felipe A. Santos - SOL218909/16724 PPM PPM 588170
     bbtnCancelar.ModalResult := mrCancel;

  lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dValorANSCancel); // Felipe A. Santos SOL 242313/17289 PPM 828977

end;

procedure TfrmMedicaoContratosMT.cdsDetPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;

  //  Início - Rodolpho - P: 17406 - 21/01/2005
 {==============================================================================
       Eu usei este evento para tratar um erro de violação de chave (Key Violation)
pois eu criei um índice no cdsDet para restringir duplicações de items e objetos para
o mesmo rateio. NÃO foi utilizado um try-except-end no inherited porque o padrão trata
o erro (except end) e não retorna a exceção.
  ==============================================================================
  }

  MsgDlg('Não é possível incluir um rateio já inserido','Erro',mtError,[mbOk],0);
  Action := daAbort;
  //  Fim    - Rodolpho - P: 17406 - 21/01/2005

end;

procedure TfrmMedicaoContratosMT.BitBtn2Click(Sender: TObject);
begin
   inherited;
   bProcessaEstorno    := False;
   sbtnEstornar.Down   := False;
   twDtEstorno.Visible := false;
end;

procedure TfrmMedicaoContratosMT.edDataVencExit(Sender: TObject);
var
  Ano,Mes,Dia:Word;
begin
  inherited;
  // Início - Marcos Topini - Pendência 19333 - 28/07/2006
   if (cdsTemp.FieldByName('FLGDTLANCTO').AsString = 'S') and (trim(edDataVenc.text)<>'') then
    begin
      // Calcula a data efetiva
      DecodeDate(edDataVenc.Date,Ano,Mes,Dia);
      cds.FieldByName('DATALANCAMENTO').AsDateTime := EncodeDate(Ano,Mes,1);
    end
   else
    if trim(edDataVenc.text) = '' then
      edDataLancto.ClearDateTime
  // Fim pendência 19333

end;

procedure TfrmMedicaoContratosMT.FazerAvaliacao;
var lCentRespons: String;
begin

  //Thaise - a query busca o centro de responsabilidade daquele contrato.
  //Se não for passível de avaliação, não trará nada para a tela.
  qryVerificaDocum.Close;
  qryVerificaDocum.ParamByName('NODOCUMENTO').AsInteger:= Cds.FieldByName('IDCONTRATO').AsInteger;
  qryVerificaDocum.Open;

  if not qryVerificaDocum.IsEmpty then
  begin
    qryVerificaDocum.First;
    while not qryVerificaDocum.Eof do
    begin
      lCentRespons:= lCentRespons + ', ' + QuotedStr(qryVerificaDocum.FieldByName('CODCENTRORESPON').AsString);
      qryVerificaDocum.Next;
    end;
    Delete(lCentRespons, 1, 1);

    if CtrlAvaliacaoFornec.AvaliaFornec(lCentRespons) then
       JustificarFornec;
  end;
end;

procedure TfrmMedicaoContratosMT.JustificarFornec;
begin
   if not CtrlAvaliacaoFornec.TrazMesAtual(Cds.FieldByName('IDFORCLI').AsInteger, Cds.FieldByName('DATAMEDICAO').AsDateTime) then
   begin
     Application.MessageBox('Para a criação da AP é necessário realizar a avaliação do fornecedor', Pchar(ExtractFileName(Application.Title)), MB_ICONINFORMATION);
     AbrirAvaliacao;
   end else
   begin
     if MessageDlg('Deseja avaliar o Fornecedor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       AbrirAvaliacao
     else
     begin
      Application.CreateForm(TfrmJustificativa, frmJustificativa);
      frmJustificativa.pIdPessoa:= Cds.FieldByName('IDFORCLI').AsInteger;
      frmJustificativa.ShowModal;
     end;
   end;
end;

procedure TfrmMedicaoContratosMT.AbrirAvaliacao;
var
  frmCadForneAvalia: TfrmCadForne;
begin
  Application.CreateForm(TFrmCadForne, frmCadForneAvalia);
  if frmCadForneAvalia.FormStyle <> fsNormal then
  begin
    frmCadForneAvalia.FormStyle := fsNormal;
    frmCadForneAvalia.Visible := False;
  end;

  frmCadForneAvalia.nConsModulo:= 4;
  frmCadForneAvalia.nIdPessoa:= Cds.FieldByName('IDFORCLI').AsInteger;
  frmCadForneAvalia.DtEmissao:= Cds.FieldByName('DATAMEDICAO').AsDateTime;
  frmCadForneAvalia.WindowState:= wsMaximized;


  frmCadForneAvalia.ShowModal;
  frmCadForneAvalia.Release;
end;

procedure TfrmMedicaoContratosMT.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( _oDocumento); // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
  FreeAndNil(CtrlListaServicos);
end;

// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
function TfrmMedicaoContratosMT.IFF(Condicao: boolean; Primeiro,
  Segundo: string): string;
begin
  if Condicao then begin
    IFF := Primeiro;
  end else  begin
    IFF := Segundo;
  end;
end;



procedure TfrmMedicaoContratosMT.AtualizaPlanoPatro;
var
  recPlanoPatro: TDadosFinanceiro;
begin
  recPlanoPatro := _oDocumento.LocalizaPlanoPatroFinanceiro(
                    cdsRateioxCC.fieldByName('IDPESSOA').asInteger,
                    cds.FieldByName('CODPORTFORMA').AsInteger,
                    Cds.FieldByName('IDFORCLI').AsInteger ,
                    cdsRateioxCC.FieldByName( 'IDPATRO' ).AsInteger,
                    cdsRateioxCC.FieldByName( 'IDPLANOPREV' ).AsInteger,
                    cdsRateioxCC.FieldByName( 'IDPROGRAMA' ).AsInteger,
                    'P',
                    cdsRateioxCC.FieldByName( 'CODCENTROCUSTO' ).AsString,
                    cdsRateioxCC.FieldByName( 'CODTIPRECDES' ).AsString
                    );

  cdsRateioxCC.Edit;
  if (cdsRateioxCC.FieldByName( 'IDPLANOPREV' ).AsInteger <> recPlanoPatro.IdPlanoFinanceiro) then begin
    cdsRateioxCC.FieldByName( 'PLANOORIGEM' ).AsInteger := cdsRateioxCC.FieldByName( 'IDPLANOPREV' ).AsInteger;
    cdsRateioxCC.FieldByName( 'PATROORIGEM' ).AsInteger := cdsRateioxCC.FieldByName( 'IDPATRO' ).AsInteger;
  end;

  cdsRateioxCC.FieldByName( 'IDPATRO' ).AsInteger := recPlanoPatro.IdPatroFinanceiro;
  cdsRateioxCC.FieldByName( 'IDPLANOPREV' ).AsInteger := recPlanoPatro.IdPlanoFinanceiro;

  with cdsRateioxCC.FieldByName( 'TipoDespesa' ) do begin
    if recPlanoPatro.ReceitaDespesaAdministrativa then begin
      AsInteger := 1
    end else begin
      AsInteger := 2;
    end;
  end;
  cdsRateioxCC.Post;
end;

procedure TfrmMedicaoContratosMT.atualizaPlano(nPlano : String);
begin
  cdsRateioxCC.First;
  while (not cdsRateioxCC.Eof) do begin
    cdsRateioxCC.Edit;
    cdsRateioxCC.FieldByName('PLANO').AsString := nPlano;
    cdsRateioxCC.Post;

    cdsRateioxCC.Next;
  end;
  cdsRateioxCC.First;
end;
// Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

// Thiago Melo SOL 238060 PPM 496839
procedure TfrmMedicaoContratosMT.atualizaDespesaOrc(_IdDespesaOrc : String);
begin
  cdsRateioxCC.First;
  while (not cdsRateioxCC.Eof) do begin
    cdsRateioxCC.Edit;
    cdsRateioxCC.FieldByName('IDDESPESAORC').AsString := _IdDespesaOrc;
    cdsRateioxCC.Post;

    cdsRateioxCC.Next;
  end;
  cdsRateioxCC.First;
end;
// Thiago Melo SOL 238060 PPM 496839

//Higor Nayde SOL 188854 Kintana 1784331 - Início
procedure TfrmMedicaoContratosMT.dblcFormaPGExit(Sender: TObject);
begin
  inherited;
  {if FlgExit then begin
    if (CtrlAvaliacaoFornec.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
       MsgDlg('Este contrato de fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
    end;
  end;   }
end;

procedure TfrmMedicaoContratosMT.dblcFormaPGChange(Sender: TObject);
begin
    If FlgExit Then
      Begin
         FlgExit := false;
         if (CtrlAvaliacaoFornec.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
           MsgDlg('Este fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
         end;
         //dbenNumDoc.setfocus;  // Macete usado para forçar a saída do campo a assim atualizar os ponteiros de dados (Cds e o registro da classe)
      End;
end;

procedure TfrmMedicaoContratosMT.dblcContratoEnter(Sender: TObject);
begin
  inherited;
FlgExit:= true;
end;

procedure TfrmMedicaoContratosMT.dblcContratoExit(Sender: TObject);
var iQtdeFields: Integer;
    sNomeCampo: string;
begin
  inherited;
  {if FlgExit then begin
     FlgExit := false;
    if (CtrlAvaliacaoFornec.VerificaQualificacao(Cds.FieldByName('IDFORCLI').AsInteger))then begin
       MsgDlg('Este contrato de fornecedor possui 04 ou mais qualificações técnicas negativas!', 'Atenção', mtInformation, [mbOk],0);
    end;
  end; }
  //Cássio Rovaroto - SIG nº 134176 - Início
  if cdsRateioxCC.isEmpty then
  begin
    cdsRateioxCC.Close;
    cdsRateioxCC.Data:=CtrlServProdxItemContr.ListRateio(
                                        StrToIntDef(dblcContrato.LookupValue,-1),0,0,
                                        Sistema.IdEmpresa,True);
  end
  else
  begin
  cdsRateioAux.data := CtrlServProdxItemContr.ListRateio(
                                        StrToIntDef(dblcContrato.LookupValue,-1),0,0,
                                        Sistema.IdEmpresa,True);

  cdsRateioxCC.Append;
  for iQtdeFields := 0 to cdsRateioAux.FieldCount - 1 do
  begin
    sNomeCampo := cdsRateioAux.Fields[iQtdeFields].FieldName;
    cdsRateioxCC.FieldByName(sNomeCampo).Value := cdsRateioAux.FieldByName(sNomeCampo).Value;
  end;
  cdsRateioxCC.Post;

  cdsRateioAux.Next;
  end;
  //Cássio Rovaroto - SIG nº 134176 - Fim

end;
//Higor Nayde SOL 188854 Kintana 1784331 - Fim

procedure TfrmMedicaoContratosMT.CarregaInformacoesAlerta;
begin
   // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
   Cds.FieldByName('IDCONTRATO').AsInteger := IdContratoAlerta;

   cdsItem.Close;
   cdsItem.Data := CtrlItemContratual.ListItemXContrato(Sistema.IdEmpresa,
                                                        IdContratoAlerta);
   cdsObjeto.Close;
   cdsObjeto.Data:=CtrlServProdxItemContr.ListProdServXItem(IdContratoAlerta,
                                                              0,0,True);

   cdsDet.Insert;
   cdsDet.FieldByName('IDCONTRATO').AsInteger := IdContratoAlerta;
   cdsDet.FieldByName('IDPARCMEDICAO').AsInteger := IdParcMedicao;
   cdsDet.FieldByName('IDITEM').AsInteger := FIdItem;
   cdsDet.FieldByName('IDOBJETO').AsInteger := FIdObjeto;
   cdsDet.FieldByName('PARCELANUM').AsInteger := ParcelaNum;
   cdsDet.FieldByName('NUMPARC2').AsInteger := cdsObjeto.FieldByName('NUMPARCELAS').AsInteger;
   cdsDet.FieldByName('VENCIMENTO').AsDateTime := Vencimento;
   cdsDet.FieldByName('IDADITAMENTO').AsInteger := IdAditamento;
   cdsDet.FieldByName('OBSERVACAO').AsString := cdsObjeto.FieldByName('OBSERVACAO').AsString;
   cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat := cdsObjeto.FieldByName('VALORUNITARIOOBJETO').AsFloat;
   cdsDet.FieldByName('QTDEMEDICAO').AsInteger := cdsObjeto.FieldByName('QTDEITEM').AsInteger;
   CdsDet.FieldByName('VALORMEDICAO').AsFloat := (cdsObjeto.FieldByName('QTDEITEM').AsInteger *
                                                  cdsObjeto.FieldByName('VALORUNITARIOOBJETO').AsFloat);
   cdsDet.Post;

   cdsObjeto.Edit;
   cdsObjeto.FieldByName('ULTPARCELA').AsInteger  := ParcelaNum;
   cdsObjeto.Post;

   RecuperaContaBancaria;
   // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim
end;

procedure TfrmMedicaoContratosMT.bbtnOkDetClick(Sender: TObject);
var cdsSaldoContrato : TCMClientDataSet;
    iIdAditamentoServico : Integer;   // Paulo Nobre - WO39052
begin
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    //edilaine WO15431 : inicio
    if (cdsDet.State in [dsInsert, dsEdit]) and (rbRateioFDO.checked) then
    begin
      ValidaDadosFDO;

      if (not bFlgExecutouRateio) then
      begin
        MsgDlg('O Rateio do valor entre o(s) FDO(s) selecionado(s) não foi executado.','Atenção',mtWarning,[mbOk],0);
        abort;
      end;
    end;
    //edilaine WO15431 : fim

    // atribui a última parcela que está em memória para aquele determinado objeto.
    if (cdsDet.State = dsInsert) then
    begin
      cdsObjeto.Edit;
      cdsObjeto.FieldByName('ULTPARCELA').AsInteger := cdsDet.FieldByName('PARCELANUM').AsInteger;
      cdsObjeto.Post;
    //end; // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - início

      // pega o IDPARCMEDICAO pelos campos IDCONTRATO, IDITEM, IDOBJETO e PARCELANUM
      CdsDet.FieldByName('IDPARCMEDICAO').AsInteger := CtrlCtrlParcelaMedicao.GetDadosCtrlParcMedicao(Cds.FieldByName('IDCONTRATO').AsInteger,
                                                                 CdsDet.FieldByName('IDOBJETO').AsInteger,
                                                                 CdsDet.FieldByName('IDITEM').AsInteger,
                                                                 CdsDet.FieldByName('PARCELANUM').AsInteger);

      CdsDet.FieldByName('IDCONTRATO').AsInteger := Cds.FieldByName('IDCONTRATO').AsInteger;

      // pega o VENCIMENTO do contrato pelos campos IDCONTRATO, IDITEM, IDOBJETO e PARCELANUM
      CdsDet.FieldByName('VENCIMENTO').AsDateTime := CtrlCtrlParcelaMedicao.GetDataVencimento(Cds.FieldByName('IDCONTRATO').AsInteger,
                                                                 CdsDet.FieldByName('IDOBJETO').AsInteger,
                                                                 CdsDet.FieldByName('IDITEM').AsInteger,
                                                                 CdsDet.FieldByName('PARCELANUM').AsInteger);

      // Paulo Nobre - WO39052 - Inicio

      // pega o IDADITAMNETO pelo campos IDCONTRATO, IDITEM, IDOBJETO
  {    iIdAditamentoServico := CtrlCtrlParcelaMedicao.GetDadosCtrlParcMedicao(Cds.FieldByName('IDCONTRATO').AsInteger,
                                                                 CdsDet.FieldByName('IDOBJETO').AsInteger,
                                                                 CdsDet.FieldByName('IDITEM').AsInteger,
                                                                 -1, 1);       }

       CdsDet.FieldByName('IDADITAMENTO').AsString := '';// Caso de só ter somente o contrato, sem aditamentos lançados
       cdsAux1.data := CtrlCtrlParcelaMedicao.ListUltimoAditamentoDisponivel(Cds.FieldByName('IDCONTRATO').AsInteger);
       if not cdsAux1.isempty Then
          CdsDet.FieldByName('IDADITAMENTO').AsInteger := cdsAux1.FieldByName('IDADITAMENTO').AsInteger;

      // Paulo Nobre - WO39052 - Fim

      // Paulo Nobre - WO15653 - Inicio
      // Contratos com marcação diferente do "Não se Aplica"
      try
        // Paulo Nobre - WO39052 - Inicio

        if cdsContratos.FieldByName('FLG_TP_VLR_ORCADO_APROVADO').AsString <> 'N' then
        begin
          cdsSaldoContrato := TCMClientDataSet.Create(nil);
          // Trazendo o valor do saldo do Contrato
          cdsSaldoContrato.Data := CtrlContratosMed._BuscaUltimoSaldoContratoOuAditamento(Cds.FieldByName('IDCONTRATO').AsInteger);
          dUltimoSaldo := cdsSaldoContrato.fieldbyname('SALDO_A_PAGAR').AsFloat;

          // Paulo Nobre - WO39052 - Inicio

          If dUltimoSaldo < 0.00 then
          begin
            Application.MessageBox(pchar(' Saldo disponível encontra-se NEGATIVO para esta Medição : ' +
                                   floattostrf(dUltimoSaldo, ffcurrency, 12,2) + #13 + #13 +'Favor Consultar a COSAD.'), 'Atenção', MB_ICONINFORMATION);
            exit;
          end;

          // Retirando do saldo do contrato o valor do item
     //     dValorSaldo := dUltimoSaldo - cdsDet.FieldByName('VALORMEDICAO').AsFloat;

          If dUltimoSaldo < cdsDet.FieldByName('VALORMEDICAO').AsFloat then
          begin
            Application.MessageBox(pchar(' Saldo insuficiente para esta Medição : ' +
                                   floattostrf(dUltimoSaldo, ffcurrency, 12,2) + #13 + #13 + 'Favor Consultar a COSAD.'), 'Atenção', MB_ICONINFORMATION);
            exit;
          end;

          // Paulo Nobre - WO39052 - Inicio

          // Paulo Nobre - WO39052 - Fim
        end;
      finally
        FreeAndNil(cdsSaldoContrato);
      end;
      // Paulo Nobre - WO15653 - Inicio

    end; // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier
  end
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  else if (pgctrlDetalhe.ActivePage = tbsANS) then
  begin
    CdsANS.FieldByName('IDOBJETO').AsInteger := CdsDet.FieldByName('IDOBJETO').AsInteger;
    CdsANS.FieldByName('IDITEM').AsInteger := CdsDet.FieldByName('IDITEM').AsInteger;
    CdsANS.FieldByName('PARCELANUM').AsInteger := CdsDet.FieldByName('PARCELANUM').AsInteger;
    CdsANS.FieldByName('REFERENCIA').AsString := medtRef.Text;
  end;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  if (pgctrlDetalhe.ActivePage = tbsTributacao) and (cdsTributacao.State = dsEdit) then
  begin
    CdsTributacao.FieldByName('VLRLIQUIDO').asFloat := CdsTributacao.FieldByName('VALOR').asFloat;
  end;

  inherited;

  //edilaine SIG115595 : inicio
  if (pgctrlDetalhe.ActivePage = tbsDet) and (cdsDet.State = dsInsert) then
  begin
    edNumFDO.text := '';
    rbPadrao.Checked := true;

    // Paulo Nobre - WO15134 - Inicio
    lvListadeFDOS.Items.Clear;
    edNumFDO.Clear;
    meTotalFDOS.Value := 0.00;
    pnlListaFDO.enabled := false;
    btnRateioOk.enabled := false;
    dblcItem.SetFocus;
  end;
  //edilaine SIG115595 : fim

  // Paulo Nobre - WO15134
//  lvListadeFDOS.Items.Clear;
//  edNumFDO.Clear;
//  meTotalFDOS.Value := 0.00;

   // Paulo Nobre - WO15134 - Fim
end;

procedure TfrmMedicaoContratosMT.bbtnSairClick(Sender: TObject);
begin
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
  if bbtnCancelar.ModalResult = mrNone then
     bbtnCancelar.ModalResult := mrCancel;
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim  

  inherited;

end;

procedure TfrmMedicaoContratosMT.sbtnExcluiDetClick(Sender: TObject);
var
  dValorANSex : double; // Felipe A. Santos SOL 242313/17289 PPM 828977
  sVlrANSAux : string; // Felipe A. Santos SOL 242313/17289 PPM 828977
begin
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if cdsDet.FieldByName('PARCELANUM').AsInteger <> cdsObjeto.FieldByName('ULTPARCELA').AsInteger then
    begin
       MsgDlg('Somente é permitido excluir a última parcela', 'Aviso', mtWarning, [mbOk], 0);
       Exit;
    end;

    cdsObjeto.Edit;
    cdsObjeto.FieldByName('ULTPARCELA').AsInteger := (cdsObjeto.FieldByName('ULTPARCELA').AsInteger - 1);
    cdsObjeto.Post;

    // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - início
    if CdsDet.FieldByName('IDMEDICAO').AsString <> '' then
    begin
      CdsCtrlParcelaMedicao.Filtered := False;
      CdsCtrlParcelaMedicao.Filter := ' IDMEDICAO = ' + cdsDet.FieldByName('IDMEDICAO').AsString;
      CdsCtrlParcelaMedicao.Filtered := True;

      if not(CdsCtrlParcelaMedicao.IsEmpty) then
      begin
        CdsCtrlParcelaMedicao.Edit;
        CdsCtrlParcelaMedicao.FieldByName('IDMEDICAO').AsFloat := 0;
        CdsCtrlParcelaMedicao.FieldByName('FLGPARCELAMEDIDA').AsFloat := 0;
        CdsCtrlParcelaMedicao.Post;
      end;

      CdsCtrlParcelaMedicao.Filtered := False;
    end;

    // SOL 257100 PPM 852753 e SOL 257101 PPM 852764 - Felipe A. Santos e Fernando Xavier - fim

    // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
    cdsANS.First;
    while not(cdsANS.IsEmpty) do cdsANS.Delete;
    // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  //end;  // Felipe A. Santos SOL 242313/17289 PPM 828977
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  end
  else if pgctrlDetalhe.ActivePage = tbsANS then
  begin
    sVlrANSAux := StringReplace(lblVlrTotalANS.Caption,'.','',[rfReplaceAll]);
    sVlrANSAux := StringReplace(sVlrANSAux,'R$','',[rfReplaceAll]);

    dValorANSAtual := StrToFloat(sVlrANSAux);
    dValorANSex := cdsANS.FieldByName('VLRANS').AsFloat;
    lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dValorANSAtual - dValorANSex);
  end;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  inherited;
end;

procedure TfrmMedicaoContratosMT.dbgrdDetRowChanged(Sender: TObject);
var
 dVlrANS : double;
begin
  inherited;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  if not(bOk) then
  begin
    if (CdsDet.FieldByName('IDOBJETO').AsString <> '') and
       (CdsDet.FieldByName('IDITEM').AsString <> '') and
       (CdsDet.FieldByName('PARCELANUM').AsString <> '') then
    begin
      cdsANS.Filtered := False;
      cdsANS.Filter := 'IDOBJETO = ' + CdsDet.FieldByName('IDOBJETO').AsString + ' AND ' +
                       'IDITEM = ' + CdsDet.FieldByName('IDITEM').AsString + ' AND ' +
                       'PARCELANUM = ' + CdsDet.FieldByName('PARCELANUM').AsString;
      cdsANS.Filtered := True;

      cdsANS.First;
      while not(cdsANS.Eof) do
      begin
        dVlrANS := dVlrANS + CdsANS.FieldByName('VLRANS').AsFloat;
        cdsANS.Next;
      end;
    end;

    lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dVlrANS);
  end;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
end;

procedure TfrmMedicaoContratosMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;

  if (CmeCadastro.Operacao <> opVazio) then
  begin  
    lblVlrTotalANS.Visible := (pgctrlDetalhe.ActivePage = tbsANS);
    lblTotalANS.Visible := (pgctrlDetalhe.ActivePage = tbsANS);

    //Cássio Rovaroto - SIG nº 23656.58469 - Início
    if pgctrlDetalhe.ActivePage = tbsNFS  then
    begin
      if Cds.State in [dsInsert, dsEdit] then
      edtVlrBruto.Value := GetTotalMedicao;
      dbDtpDataEmissaoNFS.Date := edDataMEdicao.Date;
      btnAddAlteradores.Visible := CtrlListaServicos.ExisteTributacaoServico(_IdServico);
    end;
    //Cássio Rovaroto - SIG nº 23656.58469 - Fim

    if (pgctrlDetalhe.ActivePage = tbsTributacao) then
    begin
      if (CmeCadastro.Operacao = opAlterar) then
      begin
        sbtnInsDet.Enabled := False;
        sbtnAltDet.Enabled := False;
        sbtnExcluiDet.Enabled := False;
        MsgDlg('Não é possível alterar tributos lançados anteriormente.', 'Atenção', mtInformation, [mbOK], 0);
      end
      else
        DesabilitaInsertTributos;
    end
    else
    begin
      sbtnInsDet.Enabled := True;
      sbtnAltDet.Enabled := True;
      sbtnExcluiDet.Enabled := True;
    end;
  end;
end;

procedure TfrmMedicaoContratosMT.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  if pgctrlDetalhe.ActivePage = tbsANS then
  begin
     dValorANSOld := cdsANS.FieldByName('VLRANS').AsFloat;
     medtRef.Text := cdsANS.FieldByName('REFERENCIA').AsString;
  end;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  //edilaine SIG115595 : inicio
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    // Paulo Nobre - WO15134 - Inicio
    //edNumFDO.text       := StringReplace(cdsRateioxCC.FieldByName('COD_FDO').AsString, 'FDO-', '', []);
    //edNumFDO.enabled    := cdsRateioxCC.FieldByName('COD_FDO').AsString <> '';
    // Paulo Nobre - WO15134 - Fim

    rbRateioFDO.checked := cdsRateioxCC.FieldByName('COD_FDO').AsString <> '';
    btnRateioOk.enabled := cdsRateioxCC.FieldByName('COD_FDO').AsString <> '';
    bFlgExecutouRateio  := rbRateioFDO.checked;          //edilaine WO15134
  end;
  //edilaine SIG115595 : fim

  pnlItemDados.enabled := True;

end;

procedure TfrmMedicaoContratosMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  if pgctrlDetalhe.ActivePage = tbsANS then
  begin
     dValorANSOld := 0;
     medtRef.Clear;
  end;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  bFlgExecutouRateio := false;          //edilaine WO15134

  //edilaine SIG115595 : inicio
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    edNumFDO.text       := '';
    btnRateioOk.enabled := false;
    rbPadrao.Checked := true;

    rbPadraoClick(rbPadrao);
  end;
  //edilaine SIG115595 : fim

end;

procedure TfrmMedicaoContratosMT.medtRefKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
   if not(Key in ['0' .. '9', #8, '/']) then
     Key := #0;
   // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
end;

// Felipe A. Santos SOL 242313/17289 PPM 828977 - início
procedure TfrmMedicaoContratosMT.CarregarCamposDummyANS;
begin
   CdsDet.DisableControls;
   CdsDet.First;
   while not(CdsDet.Eof) do
   begin
     CdsANS.Filtered := False;
     CdsANS.Filter := 'IDMEDICAO = ' + CdsDet.FieldByName('IDMEDICAO').AsString;
     CdsANS.Filtered := True;

     while not(CdsANS.Eof) do
     begin
       CdsANS.Edit;
       CdsANS.FieldByName('IDITEM').AsInteger := CdsDet.FieldByName('IDITEM').AsInteger;
       CdsANS.FieldByName('IDOBJETO').AsInteger := CdsDet.FieldByName('IDOBJETO').AsInteger;
       CdsANS.FieldByName('PARCELANUM').AsInteger := CdsDet.FieldByName('PARCELANUM').AsInteger;
       CdsANS.Post;
       CdsANS.Next;
     end;

     CdsDet.Next;
   end;

   CdsDet.First;
   CdsDet.EnableControls;

   //dbgrdDetRowChanged(Self);
end;
// Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

function TfrmMedicaoContratosMT.GetTotalMedicao: Double;
var
	dValorMedicao : Double;
begin
  dValorMedicao := 0;
  cdsDet.First;

  while not cdsDet.Eof do
  begin
    dValorMedicao := dValorMedicao + cdsDet.FieldByName('VALORMEDICAO').AsFloat;
    cdsDet.Next;
  end;

  Result := dValorMedicao;
  cdsDet.First;
end;

function TfrmMedicaoContratosMT.VerificaServicoMaoDeObra: Boolean;
begin
  Result := False;
  cdsDet.First;

  while not cdsDet.Eof do
  begin
    //Cássio Rovaroto - SIG nº 115585 - Início
  	//if not(cdsDet.FieldByName('IDTIPOSERVICO').IsNull) then
    if CtrlMedicao.VerificaServicoMaoDeObra(cdsDet.FieldByName('IDCONTRATO').AsInteger,
                                                cdsDet.FieldByName('IDOBJETO').AsInteger) then
    //Cássio Rovaroto - SIG nº 115585 - Fim                                                
    begin
      Result := True;
      Break;
    end
    else
      cdsDet.Next;
  end;
  cdsDet.First;
end;

procedure TfrmMedicaoContratosMT.EmiteDadosCPRB;
var cdsAux: TClientDataSet;
begin
	cdsAux := TClientDataSet.Create(nil);
  try
  	cdsAux.Data := CtrlMedicao.ListaDadosCPRBFornecedor(cds.FieldByName('IDFORCLI').asInteger);

		if not(cdsAux.IsEmpty) then  //Cássio Rovaroto - SIG nº 115585
    	MsgDlg('Realizar o lançamento da retenção de ' + cdsAux.FieldByName('ALIQCPRB').AsString + '% de CPRB da nota fiscal de serviço, ' +
        				 'através de alterador, caso necessário.', 'Atenção', mtInformation, [mbOk],0);
  finally
  	FreeAndNil(cdsAux);
  end;
	//Cássio Rovaroto - SIG 23656.58469 - Fim
end;

// Cássio Rovaroto - SIG nº 115585 - Início
(*function TfrmMedicaoContratosMT.VerificaProcessoSuspensao: Boolean;
begin
  Result := False;
  cdsDet.First;

  while not cdsDet.Eof do
  begin
  	if not(cdsDet.FieldByName('IDPROCESSOSUSP').IsNull) then
    begin
      Result := True;
      Break;
    end
    else
      cdsDet.Next;
  end;
  cdsDet.First;
end;*)
// Cássio Rovaroto - SIG nº 115585 - Fim

//SIG80542 -inicio
function TfrmMedicaoContratosMT.BuscaObsrSemQuebras(sObsr: String): String;
var
  i: Integer;
begin
  i:= 0;
   while(i <= dbmemoObs.Lines.Count-1) do
   begin
     if (dbmemoObs.Lines[i] = EmptyStr) then
       begin
         if (i <> dbmemoObs.Lines.Count-1) then
           begin
             if (dbmemoObs.Lines[i +1] = EmptyStr) then
               begin
                 dbmemoObs.Lines.Delete(i);
                 continue;
               end;
           end
         else dbmemoObs.Lines.Delete(i);
       end;
     inc(i);
   end;
   result:= dbmemoObs.Lines.text;
end;
//SIG80542 -fim


procedure TfrmMedicaoContratosMT.edNumFDOKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', '-', '/', #8, #9, '+']) then
     key := #0;
  if key = '+' then
     btnIncluirFDOClick(sender);
end;


procedure TfrmMedicaoContratosMT.rbRateioFDOClick(Sender: TObject);
begin
  inherited;
  btnRateioDif.enabled := false;

  // Paulo Nobre - WO15134 - Inicio
  //edNumFDO.enabled     := true;
  //btnRateioFDO.enabled := true;
  pnlListaFDO.enabled := true;
  lvListadeFDOS.Items.Clear;
  edNumFDO.Clear;
  edNumFDO.SelectAll;
  edNumFDO.setfocus;
  meTotalFDOS.Value := 0.00;
  // Paulo Nobre - WO15134 - Fim  
end;


procedure TfrmMedicaoContratosMT.rbPadraoClick(Sender: TObject);
begin
  inherited;
  btnRateioDif.enabled := (cmeDetalhe.Operacao = OpAlterar);

  // Paulo Nobre - WO15134 - Inicio
  //edNumFDO.enabled     := false;
  //btnRateioFDO.enabled := false;
  lvListadeFDOS.Items.Clear;
  edNumFDO.Clear;
  meTotalFDOS.Value := 0.00;
  pnlListaFDO.enabled := false;
  btnRateioOk.enabled := false;
  // Paulo Nobre - WO15134 - Fim
end;


procedure TfrmMedicaoContratosMT.btnRateioOkClick(Sender: TObject);
begin
  inherited;
  ApresentaRateio( trFDO );
end;
//edilaine SIG115595 : fim


procedure TfrmMedicaoContratosMT.cmProcListaServicosValidaDados(
  Sender: TObject);
begin
  inherited;
  
  if msListaServico.RetornouValor then
  begin
    _IdServico:= StrToInt(msListaServico.ValoresChave[0]);
    _CodNaturezaREINF := StrToInt(msListaServico.ValoresChave[1]);
    cds.FieldByName('NFSSERVICO').AsInteger := StrToInt(msListaServico.ValoresChave[0]);
    btnAddAlteradores.Visible := CtrlListaServicos.ExisteTributacaoServico(_IdServico);
    iCalcTributos := 0;

    if chkOptanteSimples.Checked then
    begin
      btnAddAlteradores.Visible := False;
      MsgDlg('Empresas optantes pelo Simples Nacional não possuem tributação aplicável.', 'Aviso', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmMedicaoContratosMT.btnAddAlteradoresClick(Sender: TObject);
var
  bOk: Boolean;
  fValorMedicao: Double;
begin
  inherited;
  fValorMedicao := GetTotalMedicao;
  Inc(iCalcTributos);

  bOK := CtrlMedicao.LancamentoAlteradoresTributacao(1, _IdServico, fValorMedicao,
                                                     edDataLancto.Date,
                                                     edDataVenc.Date);
  if bOk then
  begin
    pgctrlDetalhe.ActivePage := tbsTributacao;
    tbcDetalhe.TabIndex := 4;
    tbcDetalheChange(tbcDetalhe);
  end;
end;

procedure TfrmMedicaoContratosMT.dbgrdTributacaoDrawDataCell(
  Sender: TObject; const Rect: TRect; Field: TField;
  State: TGridDrawState);
begin
  inherited;
  if Field.Name = 'VALOR' then
    TFloatField(Field).DisplayFormat := '#,##0.00';

  if Field.Name = 'VALORBASERETENCAO' then
    TFloatField(Field).DisplayFormat := '#,##0.00';
end;

procedure TfrmMedicaoContratosMT.chkOptanteSimplesClick(Sender: TObject);
begin
  inherited;
  btnAddAlteradores.Visible := not(chkOptanteSimples.Checked) and (Cds.FieldByName('NFSSERVICO').AsInteger > 0) ;

  if CmeCadastro.Operacao in [opInserir, opAlterar] then
    if chkOptanteSimples.Checked then
      Cds.FieldByName('FLGSIMPLES').AsString := 'S'
    else
      Cds.FieldByName('FLGSIMPLES').AsString := 'N';
end;

procedure TfrmMedicaoContratosMT.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  DesabilitaInsertTributos
end;

procedure TfrmMedicaoContratosMT.DesabilitaInsertTributos;
begin
  if (pgctrlDetalhe.ActivePage = tbsTributacao) then
  begin
    sbtnInsDet.Enabled := False;
    if iCalcChangeTrib = 0 then
    begin
      MsgDlg('A aba de tributação somente aceita alteração de tributação lançada automaticamente.', 'Atenção', mtInformation, [mbOK], 0);
      Inc(iCalcChangeTrib);
    end;
  end;
end;

procedure TfrmMedicaoContratosMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  DesabilitaInsertTributos;
end;

procedure TfrmMedicaoContratosMT.edDataLanctoExit(Sender: TObject);
begin
  inherited;
  dbDtpDataEmissaoNFS.Date := edDataLancto.Date;
end;

procedure TfrmMedicaoContratosMT.dbeNumDocumentoExit(Sender: TObject);
begin
  inherited;
  dbEdtNumNFS.Text := dbeNumDocumento.Text;
end;

procedure TfrmMedicaoContratosMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  
  tbsObsContrato.Enabled := True;
  tbsFicha.Enabled := True;
  tbsNFS.Enabled := True;
  tbsTributacao.Enabled := True;
end;

procedure TfrmMedicaoContratosMT.cmProcListaServicosApertouBotao(
  Sender: TObject);
begin
  cmProcListaServicos.Text := EmptyStr;
  inherited;                           
end;

// Paulo Nobre - WO15134 - Inicio
procedure TfrmMedicaoContratosMT.ValidaDadosFDO;
begin
  if (Trim(dblcItem.Text) = '') or (Trim(dblcObjeto.Text) = '') then
  begin
    MsgDlg('É necessário indicar Item e/ou Serviço/Produto !','Atenção',mtWarning,[mbOk],0);
    edNumFDO.setfocus;
    abort;
  end;

  if lvListadeFDOS.Items.Count = 0 then
  begin
    MsgDlg('Não foi selecionado nenhum FDO para rateio.','Atenção',mtWarning,[mbOk],0);
    Abort;
  end;

  if Arredonda(cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat, 2) <> Arredonda(meTotalFDOS.Value,2) Then
  begin
    MsgDlg('Valor Unitário do Item diverge do Total do Rateio: ('+FormatFloat('#,##0.00',meTotalFDOS.Value)+').','Atenção',mtWarning,[mbOk],0);
    abort;
  end;

end;
// Paulo Nobre - WO15134 - Fim


//edilaine SIG115595 : inicio
procedure TfrmMedicaoContratosMT.btnRateioFDOClick(Sender: TObject);
var
   sNumFDO, sMsg : string;           
   fTotalFDO     : Extended;
   iQtdeFields   : integer;
   sNomeCampo    : string;
   fResiduo      : double;     //edilaine SIG117244

   // Paulo Nobre - WO15134 - Inicio
   i: integer;
   sFDOsClausulaIN : string;
   bmudoupadrao : boolean;
   // Paulo Nobre - WO15134 - Fim
begin
  inherited;

  ValidaDadosFDO;                 //edilaine WO15431

  if Arredonda(cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat, 2) = Arredonda(meTotalFDOS.Value,2) Then
  Begin
    // Paulo Nobre - WO15134 - Inicio
    {if (Trim(edNumFDO.text) = '') or
      ((Trim(edNumFDO.text) <> '') and (not rbRateioFDO.checked)) then
    begin
      MsgDlg('É necessário indicar o Padrão de Rateio FDO!','Atenção',mtWarning,[mbOk],0);
     edNumFDO.setfocus;
      Abort;
    end;

    sMsg := '';
    sNumFDO := Trim(edNumFDO.text);
    if Pos('FDO', sNumFDO) = 0 then
       sNumFDO := 'FDO-'+sNumFDO;
    }// Paulo Nobre - WO15134 - Fim

    btnRateioOk.enabled := false;

    // Montando os elementos da clausula IN com os códigos dos FDO´s - "1 ou n"
    sFDOsClausulaIN := '(';
    For i := 0 To lvListadeFDOS.Items.Count - 1 Do
      sFDOsClausulaIN := sFDOsClausulaIN + quotedstr(lvListadeFDOS.Items[i].Caption) + ',';    // Coluna 1 da listview
    sFDOsClausulaIN := Copy(sFDOsClausulaIN, 1, Length(sFDOsClausulaIN) - 1);
    sFDOsClausulaIN := sFDOsClausulaIN + ')';

    // Buscando os dados do FDO Digital
    cdsPadraoRateio.Data := CtrlIntegraOrcFDO.GetNovoRateioFDOContrato(sFDOsClausulaIN,
                                                                       IntToStr(FiIdContrato),
                                                                       cdsDet.FieldByName('IDOBJETO').AsString,
                                                                       cdsDet.FieldByName('IDITEM').AsString,
                                                                       sMsg);

    if sMsg <> '' then
    begin
      MsgDlg(sMSG,'Atenção',mtWarning,[mbOk],0);
      abort;
    end;

    //verifica valor do documento
    // Paulo Nobre - WO15134 - Inicio
    {fTotalFDO := Arredonda(cdsPadraoRateio.FieldByName('TOTAL').AsCurrency, 2);
    if Floattostr(dbeValorTotal.value) <>  Floattostr(fTotalFDO) then
    begin
         MsgDlg('Valor do documento diverge do total de rateio ('+FormatFloat('#,##0.00',fTotalFDO)+').','Erro',mtWarning,[mbOk],0);
         abort;
    end;
    }// Paulo Nobre - WO15134 - Inicio

    fTotalFDO := Arredonda(cdsPadraoRateio.FieldByName('TOTAL').AsCurrency, 2);

    // Paulo Nobre - WO15134 - Inicio
    //if (Trim(edNumFDO.text) <> '') and (cmeCadastro.Operacao = OpAlterar) then
    if (Trim(sFDOsClausulaIN) <> '') and (cmeCadastro.Operacao = OpAlterar) then
    begin
      cdsRateioxCC.Filter :=
         'IDITEM='+FloatToStr(cdsDet.FieldByName('IDITEM').AsFloat) +
         ' AND '+
         'IDOBJETO='+FloatToStr(cdsDet.FieldByName('IDOBJETO').AsFloat) +
         ' AND ' +
         'PARCELANUM = ' +FloatToStr(cdsDet.FieldByName('PARCELANUM').AsFloat);
      cdsRateioxCC.Filtered := True;

      // Verificando se os FDO´s do Padrão de Rateio
      // atual estão diferentes dos propostos.
      bmudoupadrao := false;
      cdsRateioxCC.First;
      while not cdsRateioxCC.Eof do
      begin
         if (cdsRateioxCC.FieldByName('COD_FDO').AsString <> '') and
         //   (cdsRateioxCC.FieldByName('COD_FDO').AsString <> Trim(edNumFDO.text)) then
            (Pos(cdsRateioxCC.FieldByName('COD_FDO').AsString, sFDOsClausulaIN) < 0) then
         begin
           bmudoupadrao := True;
           break;
         end;

         cdsRateioxCC.next;
      end;

      if bmudoupadrao Then
      begin
        if MsgDlg('Confirma a mudança do padrão de Rateio FDO anterior ('+
                  cdsRateioxCC.FieldByName('COD_FDO').AsString+')?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        begin
          edNumFDO.setfocus;
          bFlgExecutouRateio := false;          //edilaine WO15134
          Abort;
        end;
      end;
    end;
    // Paulo Nobre - WO15134 - Fim

    if not cdsPadraoRateio.isEmpty then
    begin
      try
        // apaga rateio atual
        cdsRateioxCC.Filter   :=
           'IDITEM='+FloatToStr(cdsDet.FieldByName('IDITEM').AsFloat) +
           ' AND '+
           'IDOBJETO='+FloatToStr(cdsDet.FieldByName('IDOBJETO').AsFloat) +
           ' AND ' +
           'PARCELANUM = ' +FloatToStr(cdsDet.FieldByName('PARCELANUM').AsFloat) ;

        cdsRateioxCC.Filtered := True;
        cdsRateioxCC.First;
        while not cdsRateioxCC.eof do
           cdsRateioxCC.delete;

        fResiduo := fTotalFDO * 100;    //edilaine SIG117244

        // preenche rateio
        cdsPadraoRateio.First;
        while not cdsPadraoRateio.Eof do
        begin
          cdsRateioxCC.Append;
          for iQtdeFields := 0 to cdsPadraoRateio.FieldCount - 1 do
          begin
             sNomeCampo := cdsPadraoRateio.Fields[iQtdeFields].FieldName;
             if cdsRateioxCC.FindField(sNomeCampo) <> nil then
             begin
                if sNomeCampo = 'PERCRATEIOCONTR' then
                begin
                  if cdsDet.FieldByName('PARCELANUM').AsFloat = cdsPadraoRateio.FieldByName('PARCELANUM').AsFloat then //Everson Cunha - SIG128497
                    fResiduo := fResiduo - (Arredonda(cdsPadraoRateio.FieldByName(sNomeCampo).Value, 2) * 100);     //edilaine SIG117244
                  cdsRateioxCC.FieldByName(sNomeCampo).Value := Arredonda(cdsPadraoRateio.FieldByName(sNomeCampo).Value, 2);
                end
                else
                   cdsRateioxCC.FieldByName(sNomeCampo).Value := cdsPadraoRateio.FieldByName(sNomeCampo).Value;
             end;
          end;

          cdsRateioxCC.Post;

          cdsPadraoRateio.Next;

          //edilaine SIG11244 : inicio
          if cdsPadraoRateio.eof then
          begin
            cdsRateioxCC.Edit;
            cdsRateioxCC.FieldByName('PERCRATEIOCONTR').Value := cdsRateioxCC.FieldByName('PERCRATEIOCONTR').Value + (fResiduo/100);
            cdsRateioxCC.Post;
          end;
          //edilaine SIG11244 : fim
        end;

        btnRateioOk.enabled := true;
        bFlgExecutouRateio  := true;        //edilaine WO15134

        Application.MessageBox('Operação de Rateio executada com sucesso', 'Aviso', MB_ICONINFORMATION); // Paulo Nobre - WO15134

      except
        On E:Exception Do
         Begin
           raise Exception.Create( E.Message );
         End;
      end;
    end;
  end;
end;
//edilaine SIG115595 : fim
// Paulo Nobre - WO15134 - Fim

// Paulo Nobre - WO15134 - Inicio
procedure TfrmMedicaoContratosMT.btnIncluirFDOClick(Sender: TObject);
Var ListItem: TListItem;
sNumFDO : string;
Begin
  sNumFDO := AllTrim(edNumFDO.text);
  if (sNumFDO <> 'FDO--/') Then
  Begin
    if RoundCM(cdsDet.FieldByName('VALORUNITARIOOBJETO').AsFloat, 2) <> RoundCM(meTotalFDOS.Value,2) Then
    Begin
      // Função para evitar duplicidade de arquivos na lista
      If Not LocalizaItemListaArquivos(lvListadeFDOS, sNumFDO) Then
      Begin
        qryLocalizaFDO.Close;
        qryLocalizaFDO.ParamByName('pCOD_FDO').asString := sNumFDO;
        qryLocalizaFDO.Open;
        if not qryLocalizaFDO.isEmpty then
        Begin
          ListItem := lvListadeFDOS.Items.Add;
          // Adicionando Nº FDO na coluna
          ListItem.Caption := sNumFDO;
          // Adicionando Valor do FDO na coluna
          ListItem.SubItems.Add(FloatToStrF(qryLocalizaFDO.FieldByName('VLRTOTAL_FDO').AsFloat, ffnumber, 15,2));

          meTotalFDOS.Value := meTotalFDOS.Value + qryLocalizaFDO.FieldByName('VLRTOTAL_FDO').AsFloat;

          edNumFDO.Clear;
          edNumFDO.SelectAll;
          edNumFDO.setfocus;

        end;
      end;
    End;
  End
    Else
       Application.MessageBox('Valor Total dos FDO´s já está igual ao Valor Unitário do ítem.', 'Atenção', mb_OK + mb_IconError);
end;
// Paulo Nobre - WO15134 - Fim

procedure TfrmMedicaoContratosMT.btnExcFDOClick(Sender: TObject);
Var posAtual: Integer;
    sTemp : string;
begin
  If lvListadeFDOS.Selected <> Nil Then
  Begin
    posAtual := 0;
    If lvListadeFDOS.Selected.Index - 1 <> -1 Then
       posAtual := lvListadeFDOS.Selected.Index - 1;

    sTemp := lvListadeFDOS.Items[lvListadeFDOS.Selected.Index].SubItems[0];
    sTemp := StringReplace(sTemp, '.', '', [rfReplaceAll]);

    meTotalFDOS.Value := meTotalFDOS.Value - StrToFloat(sTemp);

    lvListadeFDOS.Items.Item[lvListadeFDOS.Selected.Index].Delete;

    If lvListadeFDOS.items.count <> 0 Then
      lvListadeFDOS.Items.Item[posAtual].Selected := true;
  end;
end;

Function TfrmMedicaoContratosMT.LocalizaItemListaArquivos(Const ListView: TListView; pNumFDO: String): Boolean;
Var i: integer;
Begin
   result := false;
   For I := 0 To lvListadeFDOS.Items.Count - 1 Do
   Begin
      If (Pos(lvListadeFDOS.Items[I].Caption, pNumFDO) > 0) Then
      Begin
         result := true;
         Break;
      End;
   End;
End;

procedure TfrmMedicaoContratosMT.lvListadeFDOSCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  inherited;
  With lvListadeFDOS.Canvas.Brush Do
    Begin
      If (Item.Index Mod 2) = 0 Then
         Color := clWhite
      Else
         Color := $00E1E1E1;
   End;
end;

procedure TfrmMedicaoContratosMT.lvListadeFDOSEditing(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := false;  
end;

procedure TfrmMedicaoContratosMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  // Paulo Nobre - WO15134
  lvListadeFDOS.Items.Clear;
  meTotalFDOS.Value := 0.00; 
  edNumFDO.Clear;
end;

// Paulo Nobre - WO15134 - Inicio
procedure TfrmMedicaoContratosMT.spbLimparListaClick(Sender: TObject);
begin
  inherited;
  lvListadeFDOS.Items.Clear;
  meTotalFDOS.Value := 0.00;
  edNumFDO.Clear;
  edNumFDO.SelectAll;
  edNumFDO.setfocus;
end;
// Paulo Nobre - WO15134 - Fim

end.


