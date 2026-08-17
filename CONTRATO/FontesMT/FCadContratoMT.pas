{-------------------------------------------------------------------------------
--------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ------------------------------
-------------------------------------------------------------------------------------
N.WO............: WO38245
Data............: 15/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes para corrigir a identificação correta do chamador da
                  funcionalidade de encerramento.
-------------------------------------------------------------------------------------
N.WO............: WO37036
Data............: 06/05/2026
Responsável.....: Paulo Nobre
Descrição.......: Ajustes:
                  .Forçando que um Contrato novo tenha sempre o flag
                   FLGSALDOTRANSFERIDO = 'N';
                  .Atribuindo à variável publica "sNaoSeAplica" do FCadAditamentoMT
                   o valor do campo FLG_TP_VLR_ORCADO_APROVADO;
-------------------------------------------------------------------------------------
N.WO............: WO31928
Data............: 02/02/2026
Responsável.....: Paulo Nobre
Descrição.......: No Encerramento do Contrato (sbtnEncerrarContratoClick),
                  foi inicializada uma variável para indicar à rotina de gravação
                  que a indisponibilização vai ser de todos os instrumentos
                  contrato e aditamentos.
------------------------------------------------------------------------------------
N.Chamado.....: MIGRACAO-ORACLE-2025 (TAS000000006791)
Dt.Alteração..: 17/10/2025
Responsável...: Paulo Nobre
Descrição.....: .Inclusão da função CAST, em campos, na qrery:
                  .qryHistoricoAlteracao
                .Comentado condição duplicada
---------------------------------------------------------------------------------
N.WO............: WO24929
Data............: 29/08/2025
Responsável.....: Paulo Nobre
Descrição.......: Na inserção de um novo Contrato, corrigido falha que estava
                  obrigando informar o valor quando selecionado a opção
                  "Não se aplica".
--------------------------------------------------------------------------------
N.WO............: WO20717
Data............: 02/04/2025
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de mais 2 opções de tipos de serviço:
                  .Serviço Pontual
                  .Serviço Continuado
--------------------------------------------------------------------------------
N.WO............: WO15750
Data............: 10/12/2024
Responsável.....: Paulo Nobre
Descrição.......: Corrigindo um bug de quando se retira da marcação do "Não se
                  Aplica" trocando por outra opção, não estava limpando o campo
                  da Justificativa.
--------------------------------------------------------------------------------
N.WO............: WO13506        
Data............: 11/11/2024
Responsável.....: Paulo Nobre
Descrição.......: Inclusão de novo campo: JUSTIFOPCAONAOSEAPLICA, que será
                  obrigatório quando da escolha da no opção "Não se Aplica" no
                  box dos Valores Orçados ou Aprovados.
--------------------------------------------------------------------------------
N. SIG..........: WO11956
Data............: 28/06/2024
Responsável.....: Paulo Nobre
Descrição.......: Incluso mais um item: "Corretora" em:
                  . Tipo de Serviço - Atraves de um novo item inserido na
                    tabela CM.TIPO_SERVICO;
                  . Tipo de Contratação - Através do item "Corretora" com
                    values = Letra 'O'.  
--------------------------------------------------------------------------------
Rotina..........:
N. SIG..........: WO11419
Data............: 14/06/2024
Responsável.....: Arnaldo V. Scarin
Descrição.......: Retirar Mensagem de obrigatoriedade de Preenchimento do
                  Valor Orçado/Aprovado do Contrato quando for alteração
                  de Contrato.
--------------------------------------------------------------------------------
Rotina..........: 
Atender.........: WO10498
Data............: 10/05/2024
Responsável.....: Luis Ferrari
Descrição.......: Incluir Flag Vigencia Indeterminada para desobrigar a data prevista de encerramento do contrato
--------------------------------------------------------------------------------
Rotina..........: chkFaseEncerramento
N. SIG..........: WO10578
Data............: 09/05/2024
Responsável.....: Helen V Bianchi
Descrição.......: Inclusão do FLGFASE_ENCERRAMENTO e RESPFASE_ENCERRAMENTO
--------------------------------------------------------------------------------
Rotina..........:
N. SIG..........: WO10499
Data............: 10/05/2024
Responsável.....: Helen V Bianchi
Descrição.......: Retirar também a caixinha denominada "Alerta de Medição de Contratos".
-------------------------------------------------------------------------------- 
Rotina..........:
N. SIG..........: WO9228
Data............: 22/03/2024
Responsável.....: Leandro Pocebon
Descrição.......: Ajuste para preencher o Valor Base como o "Valor Orçado / Aprovado"
                  quando a opção Variavel for selecionada.
--------------------------------------------------------------------------------
Rotina..........:
N. SIG..........: WO7471
Data............: 31/01/2024
Responsável.....: Arnaldo V. Scarin
Descrição.......: Incluir os dados da Área Técnica do Contrato
--------------------------------------------------------------------------------
N. Solicitação..: SIG 136929
Data............: 15/12/2023
Responsável.....: Luis Ferrari
Descrição.......: Ajuste na habilitação para se alterar o campo de alçadas de todos os contratos
--------------------------------------------------------------------------------
N. Solicitação..: WO 3720
Data............: 02/10/2023
Responsável.....: Everson Cunha
Descrição.......: Ajuste na obrigatoriedade do campo Tipo de Contratação
--------------------------------------------------------------------------------
N. SIG..........: 137142
Data............: 10/08/2023
Responsável.....: Luis Ferrari
Descrição.......: Inclusão do flag de Tipo de contratação e identificador do
                  contrato e ajuste na query qryHistoricoAlteracao
--------------------------------------------------------------------------------
N. SIG..........: 121621
Data............: 25/02/2022
Responsável.....: Luis Ferrari
Descrição.......: Validação do valor do contrato"
--------------------------------------------------------------------------------
N. SIG..........: 103333
Data............: 15/02/2022
Responsável.....: Everson Cunha
Descrição.......: Implementar a aba "Negociação" no cadastro do Contrato
--------------------------------------------------------------------------------
N. SIG..........: 121740
Data............: 16/12/2021
Responsável.....: Everson Cunha
Descrição.......: Aumentar o tamanho do campo "Descrição do Contrato"
--------------------------------------------------------------------------------
N. SIG..........: 114705
Data............: 19/08/2021
Responsável.....: Everson Cunha
Descrição.......: Criação do radiogroup "Valor Orçado / Aprovado"
--------------------------------------------------------------------------------
N. SIG..........: 101877
Data............: 02/12/2020
Responsável.....: Everson Cunha
Descrição.......: Criação dos campos Tipo Serviço, Distrato e histórico alt.
--------------------------------------------------------------------------------
N. SIG..........: 50897
Data............: 05/12/2019
Responsável.....: Everson Cunha
Descrição.......: Marcação do Valor Base, se fixo, variável ou sem valor.
--------------------------------------------------------------------------------
N. SIG..........: 46231
Data............: 27/08/2019
Responsável.....: Everson Cunha
Descrição.......: Criados os campos "Última Cotação", "Valor Orçado" e
                  "Área Gestora do Contrato".
                  Excluído o campo "Código no Cliente Fornecedor".
--------------------------------------------------------------------------------
N. SIG..........: 82216
Data............: 27/02/2019
Responsável.....: Taffarel Sevaybriker
Descrição.......: Alteração no evento de Encerrar Contrato para não inserir a
                  tabela CTRLPARCELAMEDICAO.
--------------------------------------------------------------------------------
N. Sol..........: 40276
Data............: 24/02/2017
Responsável.....: William Moreira da Silva
Descrição.......: Alterações para a permissão da tela
--------------------------------------------------------------------------------
N. Sol..........: 39721
Data............: 09/02/2017
Responsável.....: William Moreira da Silva
Descrição.......: Erro ao cadastrar campo Parcela Mensal e Penalidade (ANS)
                  com (,) vigula
--------------------------------------------------------------------------------
N. Sol..........: 37493
Data............: 12/01/2017
Responsável.....: William Moreira da Silva
Descrição.......: Alteração para aceitar valor zero nos campos Parcela Mensal
                  e Penalidade (ANS)
--------------------------------------------------------------------------------
N. Sol..........: 31108
Data............: 19/10/2016
Responsável.....: Fernando Xavier
Descrição.......: Erro na justificativa
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
N. PPM..........: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação da aba ANS.
--------------------------------------------------------------------------------
N. Sol..........: 217597/17169
N. PPM..........: 772732
Data............: 12/05/2015
Responsável.....: Felipe A. Santos
Descrição.......: alteração no método que lista o histórico de renovação,
                  pegando somente o último registro com maior data de andamento,
                  e que a data de andamento seja ou igual maior que a data do
                  aditamento. controle do check de processo de renovação.
--------------------------------------------------------------------------------
N. Sol..........: 218909/16724 
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação da flag de contrato receberá alerta de medição, para
                  monitoramento do contrato.
--------------------------------------------------------------------------------
N. Sol..........: 218496
N. Kintana......: 2050537
Data............: 20/02/2013
Responsável.....: William Santana
Descrição.......: quando se faz uma alteração em um campo que esteja relacionado
                  no Parâmetro de Aditamento, o sistema faz pergunta se quer
                  aditar, mesmo optando pelo NÃO o sistema está fazendo a
                  alteração que não era pra ser feita.
--------------------------------------------------------------------------------
N. Sol..........: 200730
N. Kintana......: 1940118
Data............: 20/02/2013
Responsável.....: Thiago Melo
Descrição.......: Erro ao tentar informar o aditamento do contrato com
				  determinada Empresa;
--------------------------------------------------------------------------------
N. Sol..........: 174920
N. Kintana......: 1591690
Data............: 25/10/2012
Responsável.....: Thiago Melo
Descrição.......: Manter histórico de renovação de contratos
--------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
--------------------------------------------------------------------------------
Rotina..........: verificaAlcadas
N. Sol..........: 190509
N. Kintana......: 1802910
Data............: 25/09/2012
Responsável.....: Higor Nayde Ferreira
Descrição.......: Alterar Consulta passando Valor Total como parametro
--------------------------------------------------------------------------------
Rotina..........: CmeCadastroBeforeConfirm
N. Sol..........: 176943
N. Kintana......: 1617103
Data............: 23/03/2012
Responsável.....: Vinicius Eduardo N. Maciel
Descrição.......: Corrigido para que quando não houver alçadas cadastradas não
                  efetuar o bloqueio quando não for alterados os campos
                  bloqueados do sol 8621.
--------------------------------------------------------------------------------
Rotina..........: verificaAlteracaoContrato, CmeCadastroEdit e
                  CmeCadastroBeforeConfirma
N. Sol..........: 142171/8621
N. Kintana......: 1615034
Data............: 21/03/2012
Responsável.....: Vinicius Eduardo N. Maciel
Descrição.......: A alçadas foram corridas para na alteração ser carregadas
                  apenas quando for alterados os campos data base, valor total
                  e contraparte.
                  A aba alçada foi alterada para quando na alteração trazer a
                  última justificativa digitada.
--------------------------------------------------------------------------------
Rotina..........: CarregaContrato, CmeCadastroFind
N. Sol..........: 174919
N. Kintana......: 1591697
Data............: 02/03/2012
Responsável.....: Edilaine Ferraresi
Descrição.......: encapsulado o código para carregar dados do contrato em um
                  método público para ser usado no Aviso de Vencto Contrato
--------------------------------------------------------------------------------
N. Sol..........: 168270
N. Kintana......: 1481496
Data............: 15/02/2012
Responsável.....: Edilaine Ferraresi
Alteração Form..: incluir flag para informar que o contrato está em processo de
                  renovação
--------------------------------------------------------------------------------
Rotina..........: Aba Alçada
N. Sol..........: 142171
N. Kintana......: 913629
Data............: 20/09/2011
Responsável.....: Vinicius Eduardo Nascimento Maciel
Descrição.......: Foi criada as rotinas para controle e utilização da aba Alçada
ALteração DFM...: Foi adicionado uma aba formulário
--------------------------------------------------------------------------------
Rotina..........: FormCreate
N. Sol..........: 163982/6901
N. Kintana......: 1472467
Data............: 03/11/2011
Responsável.....: Vinicius Eduardo Nascimento Maciel
Descrição.......: Foi alterada a rotina para que retorne apenas as atividades
                  Ativas. Foi adicionado um procedimento para não retornar em
                  branco as atividades que estiverem desativadas.
--------------------------------------------------------------------------------
Rotina..........: CmeCadastroConfirma
N. Sol..........: 129129
N. Kintana......: 708057
Data............: 18/03/2010
Responsável.....: Marilza Colpani
Descrição.......: Exibir a mensagem de aditamentos do contrato, quando alguma
informação na tela for alterada.
--------------------------------------------------------------------------------
Pendência   : 26187
Responsável : Gustavo Mendes
Data        : 28/04/2008
Descrição   : Ao excluir um contrado ocorre um erro de Constraint que impede que
              o processo de concluir, Esse erro consistia na não obrigatoriedade
              de gravação de uma Contraparte.
--------------------------------------------------------------------------------
Responsável: Daniel Simões
Data:        26/01/2006
Pendência:   15266
Solução:     Adicionado o Plano vigente na query da função ListCentroRespon. Não
             foi necessário adicionar o código externo pois no formulário o
             centro de responsabilidade não é exibido pelo código.
--------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 16455
Data     : 03/09/2004 a 10/09/2004
Descrição: Criação do processo RAD para aditamento
           EfetuaAditamento e CarregaLookAditamento está armazenando o
           IDANTERIOR
           Chamada da tela que mostra oa aditamentos não aprovados
--------------------------------------------------------------------------------}
unit FCadContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBCtrls, CMProcuraSubTipo, TREdit, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, Mask, wwdbedit, uCtrlUsuXContrato,
  uCtrlContratos, uCtrlListTercContratos, uCtrlResponsavel, uCtrlAditamento,
  uCtrlServProdxItemContr, uCtrlOrcamento, uCtrlParamIntegra, uCmSqlParams,
  uCtrlParamAditamento, FEncrerraContratoMT, FCadAditamentoMT, uCMTypes,
  FExibeItensContrato, DBGrids, //Vinicius Maciel - SOL 142171 - KTN 913629
  uCtrlCtrlParcelaMedicao,  // Felipe A. Santos SOL 218909/16724 PPM 588170
  uCtrlContratoANS, CheckLst, DBTables, Wwquery, CMDBLookupCombo, Wwdotdot,
  Wwdbcomb, Wwdbdlg, CMProcura, CMProcuraMask, uProcuraFO // Felipe A. Santos SOL 242313/17289 PPM 828977
  ;

type
  TLookAditamento = Record
    iIdLookup    : Integer;
    sNomeLookup  : String;
    sVlrAnterior : String;
end;


type
  TfrmCadContratoMT = class(TFrmCadastroMT)
    PnlPrincipal: TPanel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dbeNomeContrato: TwwDBEdit;
    dbeNumeroProcesso: TwwDBEdit;
    dbmemDescricao: TDBMemo;
    pgctrlDetalhe: TPageControl;
    TabSheetDadosContratuais: TTabSheet;
    GroupBoxDatas: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label22: TLabel;
    dbdpDataAssinatura: TCMDateTimePicker;
    dbtpDataBase: TCMDateTimePicker;
    dbtpDataPrevEncerra: TCMDateTimePicker;
    dbtpDataEncerramento: TCMDateTimePicker;
    GroupBoxValores: TGroupBox;
    Label10: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    GroupBoxOutros: TGroupBox;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbePrazoDenuncia: TwwDBEdit;
    dbeAvisoVencimento: TwwDBEdit;
    TabSheetDadosContraparte: TTabSheet;
    Label15: TLabel;
    Label29: TLabel;
    CMPContraparte: TCMProcuraForCli;
    dbrgTipoContrato: TDBRadioGroup;
    dblcContato: TwwDBLookupCombo;
    dblcTelefone: TwwDBLookupCombo;
    TabSheetReservaOrcamentario: TTabSheet;
    gbReservaOrc: TGroupBox;
    btnOrcamento: TSpeedButton;
    redReservaOrc: TRealEdit;
    TabSheetObjetoxItem: TTabSheet;
    dbgServProdxItem: TwwDBGrid;
    TabSheetIntegracao: TTabSheet;
    Label28: TLabel;
    Label14: TLabel;
    Label26: TLabel;
    Label24: TLabel;
    dblcAtividadeNegocio: TwwDBLookupCombo;
    dblcResponsavel: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcTipoDocumento: TwwDBLookupCombo;
    TabSheetTermino: TTabSheet;
    lblMultaTermino: TLabel;
    lblRegra: TLabel;
    Label25: TLabel;
    Edit1: TEdit;
    TabSheetAtraso: TTabSheet;
    lblMultaAtraso: TLabel;
    lblIndiceCorrecao: TLabel;
    Label27: TLabel;
    Edit2: TEdit;
    rdgrpJuros: TRadioGroup;
    Edit3: TEdit;
    TabSheetRenovacao: TTabSheet;
    TabSheetObservacao: TTabSheet;
    dbmemObservacao: TDBMemo;
    sbtnEncerrarContrato: TToolbarButton97;
    sbtnEncerrarCadastro: TToolbarButton97;
    Label3: TLabel;
    dblcTipoProcessoRAD: TwwDBLookupCombo;
    MsResORc: TMontaSelect;
    dsServProdXItemContr: TwwDataSource;
    cdsServProdxItemContr: TCMClientDataSet;
    cdsAtividadeNeg: TCMClientDataSet;
    cdsTelefone: TCMClientDataSet;
    cdsContato: TCMClientDataSet;
    cdsTipoDocumento: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    cdsProcessoRAD: TCMClientDataSet;
    cdsAditamento: TCMClientDataSet;
    cdsLogAditamento: TCMClientDataSet;
    spTeste: TCMSqlParams;
    CMDateTimePicker1: TCMDateTimePicker;
    Label4: TLabel;
    lblStatus: TLabel;
    lblRAD: TLabel;
    CMSqlParams1: TCMSqlParams;
    //Vinicius Maciel - SOL 142171 KTN 913629
    TabSheetAlcada: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    cdsItensContrato: TCMClientDataSet;
    lbResponsavel: TLabel;
    dbJustificativa: TDBMemo;
    cdsAlcadas: TCMClientDataSet;
    CdsJustificativa: TCMClientDataSet;
    dsJutificativa: TwwDataSource;
    pnlRenovacao: TPanel;
    chkRenovacao: TCheckBox;
    pgctrlHistoricoDeRenovacao: TTabSheet;
    cdsHistoricoRenovacoes: TCMClientDataSet;
    dsHistoricoRenovacoes: TwwDataSource;
    NtbHistoricoRenovacao: TNotebook;
    grdHistoricoRenovacao: TDBGrid;
    Panel1: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    Panel2: TPanel;
    Panel3: TPanel;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    DtTimePkrDtAndamento: TCMDateTimePicker;
    lblDataDoAndamento: TLabel;
    lblDescricaodoAndamento: TLabel;
    MemDescricao: TDBMemo;
    dbmemRenovacao: TDBMemo;

    // Felipe A. Santos SOL 218909/16724 PPM 588170 {Fim dbedtAVISOMEDICAO}
    grbAlertaMedicao: TGroupBox;
    chkContrAlertMed: TCheckBox;
    lblPeriodoAlerta: TLabel;
    lblDiasAntecedencia: TLabel;
    cdsCtrlParcelaMedicao: TCMClientDataSet;
    dbedtAVISOMEDICAO: TwwDBEdit;

    // Felipe A. Santos SOL 242313/17289 PPM 828977 {Fim lblVlrTotalANS}
    tbsANS: TTabSheet;
    Panel4: TPanel;
    lblRef: TLabel;
    lblNumCI: TLabel;
    lblVlrMensal: TLabel;
    lblVlrANS: TLabel;
    lblObs: TLabel;
    dbedtNumCI: TwwDBEdit;
    dbmmoObs: TDBMemo;
    ntbANS: TNotebook;
    Dock974: TDock97;
    Toolbar972: TToolbar97;
    btnInsertANS: TToolbarButton97;
    btnAlterarANS: TToolbarButton97;
    btnExcluirANS: TToolbarButton97;
    dbgrdANS: TwwDBGrid;
    Panel5: TPanel;
    btnOkANS: TBitBtn;
    btnCancelarANS: TBitBtn;
    btnVoltarANS: TBitBtn;
    cdsANS: TCMClientDataSet;
    dsANS: TwwDataSource;
    chkContratoANS: TCheckBox;
    lblTotalANS: TLabel;
    lblVlrTotalANS: TLabel;
    dbedtVlrMensal: TDBRealEdit;
    dbedtVlrANS: TDBRealEdit;
    medtRef: TMaskEdit;
    dtUltimaCotacao: TCMDateTimePicker;
    lblDtUltimaCotacao: TLabel;
    cdsCCustoDisp: TCMClientDataSet;
    dsCCustoSelecionados: TwwDataSource;
    dsCCustoDisp: TwwDataSource;
    cdsCCustoSelecionados: TCMClientDataSet;
    Label13: TLabel;
    Label17: TLabel;
    dbeValorTotal: TDBRealEdit;       //Everson Cunha - SIG50897
    dbrgTipoValorBase: TDBRadioGroup; //Everson Cunha - SIG50897
    dblkpTipoServico: TCMDBLookupCombo;
    lblTipoServico: TLabel;
    qryTipoServico: TwwQuery;
    lblDistrato: TLabel;
    tsHistoricoAlteracao: TTabSheet;
    dbgrdHistoricoAlteracao: TwwDBGrid;
    dsHistoricoAlteracao: TwwDataSource;
    qryHistoricoAlteracao: TwwQuery;
    qryHistoricoAlteracaoNOMECONTRATO: TStringField;
    qryHistoricoAlteracaoDESCRICAOCONTRATO: TStringField;
    qryHistoricoAlteracaoCONTRAPARTE: TStringField;
    qryHistoricoAlteracaoRESPONSAVEL: TStringField;
    qryHistoricoAlteracaoDATA_ULTIMA_COTACAO: TDateTimeField;
    qryHistoricoAlteracaoDATAASSINATURA: TDateTimeField;
    qryHistoricoAlteracaoDATABASECONTRATO: TDateTimeField;
    qryHistoricoAlteracaoDATAINICIO: TDateTimeField;
    qryHistoricoAlteracaoDATAPREVENCERRA: TDateTimeField;
    qryHistoricoAlteracaoDATAEFETENCERRA: TDateTimeField;
    qryHistoricoAlteracaoMOTIVOENCERRA: TStringField;
    qryHistoricoAlteracaoVALORBASECONTRATO: TFloatField;
    qryHistoricoAlteracaoVALOR_ORCADO: TFloatField;
    qryHistoricoAlteracaoN_PROCESSO: TStringField;
    qryHistoricoAlteracaoDS_TIPO_SERVICO: TStringField;
    qryHistoricoAlteracaoDT_ALTERACAO: TDateTimeField;
    qryHistoricoAlteracaoUSU_ALTERACAO: TStringField;
    tsNegociacao: TTabSheet;
    pnlNegociacao: TPanel;
    Dock975: TDock97;
    Toolbar973: TToolbar97;
    sbtnInsNegociacao: TToolbarButton97;
    sbtnAltNegociacao: TToolbarButton97;
    sbtnExcluiNegociacao: TToolbarButton97;
    Dock976: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkNegociacao: TBitBtn;
    bbtnCancelarNegociacao: TBitBtn;
    bbtnVoltarNegociacao: TBitBtn;
    dbgNegociacao: TwwDBGrid;
    pnlControlesDet: TPanel;
    lblIniVigencia: TLabel;
    lblTipo: TLabel;
    lblValorAnteriorAno: TLabel;
    lblValorPrevistoAno: TLabel;
    lblIndicePrevisto: TLabel;
    lblNegociacao: TLabel;
    lblValorAtualAno: TLabel;
    lblEconomiaAno: TLabel;
    lblPercentualReduc: TLabel;
    dbdtIniVigencia: TCMDateTimePicker;
    edtValorAnteriorAno: TDBRealEdit;
    edtValorPrevistoAno: TDBRealEdit;
    edtIndicePrevisto: TDBRealEdit;
    edtValorAtualAno: TDBRealEdit;
    edtEconomiaAno: TDBRealEdit;
    edtPercentualReduc: TDBRealEdit;
    cbbTipo: TwwDBComboBox;
    cbbNegociacao: TwwDBComboBox;
    dsNegociacao: TwwDataSource;
    CdsNegociacao: TCMClientDataSet;
    cmpResponsavelNegociacao: TCMProcuraSubTipo;
    pnlIdentificador: TPanel;
    dbrgTipoContratacao: TDBRadioGroup;
    dbeIdentificador: TwwDBEdit;
    lblIdentificador: TLabel;
    tsDadosAdicionais: TTabSheet;
    Label11: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    btnIncluir: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluirTodos: TSpeedButton;
    btnExcluirTodos: TSpeedButton;
    dbgAGDisponiveis: TwwDBGrid;
    dbgAGSelecionados: TwwDBGrid;
    Label18: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    btnIncluirAT: TSpeedButton;
    btnExcluirAT: TSpeedButton;
    btnIncluirTodosAT: TSpeedButton;
    btnExcluirTodosAT: TSpeedButton;
    dbgATDisponiveis: TwwDBGrid;
    dbgATSelecionados: TwwDBGrid;
    Label19: TLabel;
    dsCCustoATSelecionados: TwwDataSource;
    dsCCustoATDisp: TwwDataSource;
    cdsCCustoATDisp: TCMClientDataSet;
    cdsCCustoATSelecionados: TCMClientDataSet;
    chkFaseEncerramento: TCheckBox;
    chkVigencia: TCheckBox;
    pcVlrOA: TPageControl;
    tbsOA: TTabSheet;
    dbrgrpVlrOrcadoAprovado: TDBRadioGroup;
    dbEdtValorOrcado: TDBRealEdit;
    tbsJustNSA: TTabSheet;
    dbJustNSA: TDBMemo;
    chkServPontual: TCheckBox;
    chkServContinuado: TCheckBox;
    
    //Vinicius Maciel - SOL 142171 KTN 913629  - FIM
    procedure btnOrcamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnEncerrarCadastroClick(Sender: TObject);
    procedure sbtnEncerrarContratoClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dblcContatoChange(Sender: TObject);
    procedure dbrgTipoContratoChange(Sender: TObject);
    procedure CMPContraparteChange(Sender: TObject);
    procedure CMPContraparteExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    //Vinicius Maciel - SOL 142171 KTN 913629
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ajustaAbaAlcada(iOperacao : integer);
    procedure chkRenovacaoClick(Sender: TObject);

    // Thiago Melo SOL 174920 KINTANA 1591690 
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure grdHistoricoRenovacaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsHistoricoRenovacoesAfterOpen(DataSet: TDataSet);
    function  ValidaCamposHistoricoRenovacao : Boolean;
    procedure ExcluirHistoricoRenovacao;
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkContrAlertMedClick(Sender: TObject);
    procedure dbtpDataPrevEncerraChange(Sender: TObject);
// Thiago Melo SOL 174920 KINTANA 1591690 fim

    // Felipe A. Santos SOL 242313/17289 PPM 828977  {Fim chkContratoANSClick}
    procedure btnInsertANSClick(Sender: TObject);
    procedure btnAlterarANSClick(Sender: TObject);
    procedure btnExcluirANSClick(Sender: TObject);
    procedure btnOkANSClick(Sender: TObject);
    procedure btnCancelarANSClick(Sender: TObject);
    procedure btnVoltarANSClick(Sender: TObject);
    procedure chkContratoANSClick(Sender: TObject);
    procedure medtRefKeyPress(Sender: TObject; var Key: Char);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirTodosClick(Sender: TObject);
    procedure btnExcluirTodosClick(Sender: TObject);
    procedure dbrgTipoValorBaseChange(Sender: TObject);   //Everson Cunha - SIG50897
    procedure sbtnInsNegociacaoClick(Sender: TObject);
    procedure bbtnOkNegociacaoClick(Sender: TObject);
    procedure edtEconomiaAnoEnter(Sender: TObject);
    procedure edtPercentualReducEnter(Sender: TObject);
    procedure btnExcluirATClick(Sender: TObject);
    procedure btnExcluirTodosATClick(Sender: TObject);
    procedure btnIncluirATClick(Sender: TObject);
    procedure btnIncluirTodosATClick(Sender: TObject);
    procedure chkFaseEncerramentoClick(Sender: TObject);
    procedure chkVigenciaClick(Sender: TObject);
    procedure dbrgrpVlrOrcadoAprovadoClick(Sender: TObject);
    procedure chkServPontualClick(Sender: TObject);
    procedure chkServContinuadoClick(Sender: TObject);

  private
    { Private declarations }
    CtrlContratos          : TCtrlContratos;
    CtrlListTerc           : TCtrlListTercContratos;
    CtrlResponsavel        : TCtrlResponsavel;
    CtrlAditamento         : TCtrlAditamento;
    CtrlServProdxItemContr : TCtrlServProdxItemContr;
    CtrlOrcamento          : TOrcamentoBackMT;
    CtrlUsuXContrato       : TCtrlUsuXContrato;
    CtrlParamAditamento    : TCtrlParamAditamento;
    CtrlCtrlParcelaMedicao : TCtrlCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170
    CtrlContratoANS        : TCtrlContratoANS; // Felipe A. Santos SOL 242313/17289 PPM 828977
    bEncerrarCadastro      : Boolean;
    bEncerrarContrato      : Boolean;
    sStatusContrato        : String;
    vValorAlcadas          : String;
    vCargoAlcadas          : string;
    //Vinicius Maciel - SOL 142171 KTN 913629
    bJustificativaAlcada   : Boolean;
    sResponsavel           : String;
    //Vinicius Maciel - SOL 142171 KTN 913629 - FIM
    //Vinicius Maciel - SOL 142171/8621 KTN 1615034
    dtDataBaseOrig : TDateTime;
    ccValorTotal : currency;
    iContraparte : integer;
    //Vinicius Maciel - SOL 142171/8621 KTN 1615034 - FIM

    vLookAditamento : array of TLookAditamento;

    bItemVinculadoAoContrato, bContrAlertMedOld : boolean; // Felipe A. Santos - SOL218909/16724 PPM 588170
    dVlrAnsOld, dVlrAnsAtual, dValorAnsCancel : Double; // Felipe A. Santos SOL 242313/17289 PPM 828977
    bContratoComANSOld : boolean; // Felipe A. Santos SOL 242313/17289 PPM 828977

    sOrigemChamada : string;   // Paulo Nobre - WO31928

    function  EfetuaAditamento : Boolean;
    procedure CarregaLookAditamento;
    procedure SelecionaMestreDetalhe( const iContrato: Double );
    function  VerificaEncerrarCadastro : Boolean;
    function  verificaAlteracaoContrato : boolean;//Vinicius Maciel - SOL 142171/8621 KTN 1615034
    //Vinicius Maciel - SOL 142171 KTN 913629
    procedure ExibeItensContrato();
    //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

    // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
    procedure StatusVoltarANS;
    procedure CancelaANS;
    // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

    procedure HabDesBotoes; //Everson Cunha - SIG46231
    procedure HabDesBotoesNegociacao; //Everson Cunha - SIG103333
    function VerificaCamposAbaNegociacao: boolean;
    procedure HabDesBotoesAT;

  public
    { Public declarations }
    procedure CarregaContrato(iContrato: Double);  // Edilaine - SOL 174919 / KTN 1591697

    procedure CarregaAreaGestora(IdContrato : Double); //Everson Cunha - SIG46231

    procedure CarregaAreaTecnica(IdContrato: Double); //Everson Cunha - SIG103333

  end;


var
  frmCadContratoMT: TfrmCadContratoMT;
  dSomaValor : Double;     //Vinicius Maciel - SOL 142171 KTN 913629

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro, FAditamentosNaoAprovadosMT;

procedure TfrmCadContratoMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa Controls
   CtrlContratos:=TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlContratos.CdsContratoContr := Cds;
   CtrlContratos.CdsAditamento    := cdsAditamento;
   CtrlContratos.CdsLogAditamento := cdsLogAditamento;
   CtrlContratos.CdsJustificaContrato :=  CdsJustificativa;
   // Thiago Melo SOL 174920 KINTANA 1591690
   CtrlContratos.CdsHstRenovacao   := cdsHistoricoRenovacoes;
   //
   CtrlContratos.CdsCtrlParcelaMedicao := cdsCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170
   CtrlContratos.CdsContratoANS := cdsANS; // Felipe A. Santos SOL 242313/17289 PPM 828977

   CtrlListTerc:=TCtrlListTercContratos.Create;
   CtrlListTerc.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlResponsavel:=TCtrlResponsavel.Create;
   CtrlResponsavel.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlUsuXContrato:=TCtrlUsuXContrato.Create;
   CtrlUsuXContrato.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlAditamento:=TCtrlAditamento.Create;
   CtrlAditamento.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlServProdxItemContr:=TCtrlServProdxItemContr.Create;
   CtrlServProdxItemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlOrcamento:=TOrcamentoBackMT.Create;
   CtrlOrcamento.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlOrcamento.IdEmpresa:=Sistema.IdEmpresa;
   CtrlOrcamento.IdUsuario:=Sistema.IdUsuario;

   CtrlParamAditamento := TCtrlParamAditamento.Create;
   CtrlParamAditamento.Initialize(dtmBaseDados.dbBaseDados,True);

   // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
   CtrlCtrlParcelaMedicao := TCtrlCtrlParcelaMedicao.Create;
   CtrlCtrlParcelaMedicao.Initialize(dtmBaseDados.dbBaseDados,True);
   // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

   // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
   CtrlContratoANS := TCtrlContratoANS.Create;
   CtrlContratoANS.Initialize(dtmBaseDados.dbBaseDados, True);
   // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

   //Carrega Cds
   Cds.Data:=CtrlContratos.ListContratos(-1); //Vazio
   cdsAditamento.Data:=CtrlAditamento.ListAditamento(-1,-1); //Vazio
   cdsLogAditamento.Data := CtrlAditamento.ListLogAditamento(-1); //Vazio
   cdsMoeda.Data:=CtrlListTerc.ListMoeda(0,True);
   cdsContato.Data:=CtrlListTerc.ListContatos(-1); //Vazio
   cdsTelefone.Data:=CtrlListTerc.ListTelefoneContato(-1); //Vazio
   //Vinicius Maciel - SOL 163982/6901 - KTN 1472467
   //cdsAtividadeNeg.Data:=CtrlListTerc.ListUnidNegocio(Sistema.IdEmpresa,0,'A','');
   cdsAtividadeNeg.Data:=CtrlListTerc.ListUnidNegocio(Sistema.IdEmpresa,0,'A','','S');
   //Vinicius Maciel - SOL 163982/6901 - KTN 1472467 - FIM
   cdsResponsavel.Data:=CtrlResponsavel.ListResponsavelXPessoa;
   cdsCentroRespon.Data:=CtrlListTerc.ListCentroRespon(Sistema.IdEmpresa,'A','S','',ParamIntegra.PlanoCentroRespon);
   cdsTipoDocumento.Data:=CtrlListTerc.ListTipoDoc('X','X'); //Vazio
   cdsProcessoRAD.Data:=CtrlListTerc.ListProcessoRAD;
   cdsServProdxItemContr.Data:=CtrlServProdxItemContr.ListProdServXItem(-1,-1,-1,False); //Vazio

   // Thiago Melo SOL 174920 KINTANA 1591690
   cdsHistoricoRenovacoes.Data := CtrlContratos.ListaDadosHistoricoRenovacao(-1);
   //

   cdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(-1); // Felipe A. Santos SOL 218909/16724 PPM 588170
   cdsANS.Data := CtrlContratoANS.ListaContratoANS(-1); // Felipe A. Santos SOL 242313/17289 PPM 828977

   //Inicializa variáveis e habilita/desabilita componentes
   bEncerrarCadastro := False;
   bEncerrarContrato := False;
   gbReservaOrc.Enabled := ParamIntegra.IntegraOrcamento;
   btnOrcamento.Enabled := ParamIntegra.IntegraOrcamento;
   dblcTipoProcessoRAD.Enabled := Sistema.UsaRAD;
   lblStatus.Visible := False;
   lblRAD.Visible    := False;
   sStatusContrato   := '';
   //Vinicius Maciel - SOL 142171 KTN 913629
   bJustificativaAlcada := false;
   ajustaAbaAlcada(2);
   //Vinicius Maciel - SOL 142171 KTN 913629 - FIm
   pgctrlDetalhe.ActivePageIndex:=0;

   //Filtra Monta Selects
   MontaSelect.Filtro.Add('(CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          'WHERE IDUSUARIO = '+FloatToStr(Sistema.IDUsuario)+')) OR '+
                          '(NOT EXISTS(SELECT * FROM CONTRATOUSUARIO '+
                          'WHERE IDCONTRATO = CONTRATOCONTR.IDCONTRATO) )');
   MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = '+FloatToStr(Sistema.IDEmpresa));

   //Associa máscaras
   TFloatField(cdsServProdxItemContr.FieldByName('VALORUNITARIOOBJETO')).DisplayFormat:='#,##0.00';
   TFloatField(cdsServProdxItemContr.FieldByName('VALORTOTALOBJETO')).DisplayFormat:='#,##0.00';

   //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   TabSheetReservaOrcamentario.TabVisible := False;
   //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

   // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
   bItemVinculadoAoContrato := True;
   HelpContext := 120008;
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

   // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
   chkContratoANSClick(Self);
   dValorAnsCancel := 0;

   TFloatField(CdsANS.FieldByName('VLRMENSAL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsANS.FieldByName('VLRANS')).DisplayFormat := '###,###,##0.00';
   // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

   //Everson Cunha - SIG46231 - Início
   CarregaAreaGestora(-1);
   CtrlContratos.CdsAreaGestora := cdsCCustoSelecionados;
   //Everson Cunha - SIG46231 - Fim


   CarregaAreaTecnica(-1);
   CtrlContratos.CdsAreaTecnica := cdsCCustoATSelecionados;

   //Everson Cunha - SIG101877 - Ini
   qryTipoServico.close;
   qryTipoServico.open;

    qryHistoricoAlteracao.Close;
    qryHistoricoAlteracao.Open;
   //Everson Cunha - SIG101877 - Fim

  //Everson Cunha - SIG103333 - Ini
  CtrlContratos.CdsNegociacao := CdsNegociacao;
  CdsNegociacao.Data := CtrlContratos.ListNegociacao();
 //Everson Cunha - SIG103333 - Fim

  pcVlrOA.ActivePageIndex := 0;     // Paulo Nobre - WO13506

  // Paulo Nobre - WO38245 - Inicio
//  sOrigemChamada := 'A'; // Aditamento  - // Paulo Nobre - WO31928

  sOrigemChamada := 'CO'; // Cadastro de Contrato
  // Paulo Nobre - WO38245 - Fim

end;

procedure TfrmCadContratoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlContratos.Free;
   CtrlAditamento.Free;
   CtrlListTerc.Free;
   CtrlResponsavel.Free;
   CtrlUsuXContrato.Free;
   CtrlServProdxItemContr.Free;
   CtrlParamAditamento.Free;
   CtrlCtrlParcelaMedicao.Free; // Felipe A. Santos - SOL218909/16724 PPM 588170

   //Vinicius Maciel SOL142171 KTN913629
   cdsAlcadas.Free;
   cdsJustificativa.Free;
   //Vinicius Maciel SOL142171 KTN913629 - FIM

   CtrlContratoANS.Free; // Felipe A. Santos SOL 242313/17289 PPM 828977

   inherited;
end;

procedure TfrmCadContratoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    // Edilaine - SOL 174919 / KTN 1591697
    CarregaContrato( StrToFloat(MontaSelect.ValoresChave[0]) );

     // Edilaine - SOL 174919 / KTN 1591697 - comentado (trecho inserido na CarregaContrato)
     {
      SelecionaMestreDetalhe( StrToFloat(MontaSelect.ValoresChave[0]) );

      // Marchetti - Pendencia 16455
      if Sistema.UsaRad then
      begin
         Application.CreateForm(TfrmAditamentosNaoAprovados,frmAditamentosNaoAprovados);
         frmAditamentosNaoAprovados.IdContrato := StrToFloat(MontaSelect.ValoresChave[0]);
         frmAditamentosNaoAprovados.cdsAditamento.Data := CtrlAditamento.ListaAditamentosNaoAprovados(frmAditamentosNaoAprovados.IdContrato);
         if not frmAditamentosNaoAprovados.cdsAditamento.IsEmpty then
         begin
            frmAditamentosNaoAprovados.ShowModal;
         end;

         frmAditamentosNaoAprovados.cdsAditamento.Data := CtrlAditamento.ListaAditamentosNaoAprovados(frmAditamentosNaoAprovados.IdContrato);
         sbtnAlterar.Enabled := frmAditamentosNaoAprovados.cdsAditamento.IsEmpty;

         frmAditamentosNaoAprovados.Free;
      end;
      // Fim Marchetti - Pendencia 16455
       //Vinicius Maciel - SOL 142171 KTN 913629
       bJustificativaAlcada := false;
       if MontaSelect.RetornouValor then
       ajustaAbaAlcada(3)
       else
       ajustaAbaAlcada(2);
       //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

       //Vinicius Maciel - SOL 163982/6901 - KTN 1472467
       if ((dblcAtividadeNegocio.Text = '') and (dblcAtividadeNegocio.LookupValue <> '')) then
          dblcAtividadeNegocio.Text := CtrlListTerc.recuperaAtividadePerd(dblcAtividadeNegocio.LookupValue)
      //Vinicius Maciel - SOL 163982/6901 - KTN 1472467 - FIM

      // Edilaine - SOL 168270 / KTN 1481496
      chkRenovacao.Checked := (cds.FieldByName('FLGRENOVACAO').AsString = 'S');
      // Edilaine - SOL 168270 / KTN 1481496 - fim

     }
     // Edilaine - SOL 174919 / KTN 1591697 - fim
  end;
end;

procedure TfrmCadContratoMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   redReservaOrc.Value := 0;
   dbeValorTotal.Value := 0;
   //Vinicius Maciel - SOL 142171 - KINTANA 913629
   //dbrgTipoContrato.ItemIndex := 0;
   dbrgTipoContrato.ItemIndex := 1;
   ajustaAbaAlcada(0);
   //Vinicius Maciel - SOL 142171 - KINTANA 913629 - FIM
   Cds.FieldByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   Cds.FieldByName('FLGFIMCONTRATO').AsString := 'N';
   CdsJustificativa.Data := CtrlContratos.selecionaJustificativa(-1); //Vinicius Maciel - SOL 142171 KTN 913629
   // Thiago Melo SOL 174920 KINTANA 1591690 ini
   cdsHistoricoRenovacoes.Data := CtrlContratos.ListaDadosHistoricoRenovacao(-1);
   //
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
   Cds.FieldByName('FLGAVISOMEDICAO').AsInteger := 0;
   chkContrAlertMed.Checked := False;
   chkContrAlertMed.Enabled := True;
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

   // Felipe A. Santos SOL 242313/17289 PPM 828977
   dValorAnsCancel := 0;
   lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dValorAnsCancel);
   chkContratoANS.Checked := False;
   chkContratoANSClick(Self);
   cdsANS.Data := CtrlContratoANS.ListaContratoANS(-1);

   TFloatField(CdsANS.FieldByName('VLRMENSAL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsANS.FieldByName('VLRANS')).DisplayFormat := '###,###,##0.00';
   // Felipe A. Santos SOL 242313/17289 PPM 828977

   //Everson Cunha - SIG101877 - Ini
   lblDistrato.Caption := '';
   lblDistrato.Visible := False;
   //Everson Cunha - SIG101877 - Fim

   // Contrato novo
   Cds.FieldByName('FLGSALDOTRANSFERIDO').AsString := 'N';  // Paulo Nobre - WO37036
end;

procedure TfrmCadContratoMT.CmeCadastroEdit(Sender: TObject);
begin
   //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   {if (Cds.FieldByName('IdReservaOrcamen').AsInteger<>0) then
    begin
       if (CtrlOrcamento.EstornaReserva(CtrlOrcamento.NumReserva,True)<>0) then
        begin
           MsgDlg(CtrlOrcamento.MessageInfo,'Erro',mtError,[mbOK],0);
           Abort;
        end;
       CtrlOrcamento.IdReserva:=Cds.FieldByName('IdReservaOrcamen').AsInteger;
       CtrlOrcamento.NumReserva:=Trunc(redReservaOrc.Value);
    end
   else
    begin
       CtrlOrcamento.IdReserva:=0;
       CtrlOrcamento.NumReserva:=0;
    end;}
   //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

   inherited;
   //Vinicius Maciel - SOL 142171 - KTN 913629
   //Quando se insere um contrato e tenta altera-lo a contraparte não é carregada corretamente
   if((Cds.FieldByName('IDFORCLI').asString <> '') and (CMPContraparte.text = '')) then
   begin
   with TCMClientDataSet.Create(nil) do
       begin
          Data:=CtrlListTerc.ListPessoa(Cds.FieldByName('IDFORCLI').AsFloat);
          CMPContraparte.text := FieldByName('NOME').asString;
       end;
   end;
   bJustificativaAlcada := True;   // SIG 136929 Ferrari
   ajustaAbaAlcada(1);  // SIG 136929 Ferrari
   //Vinicius Maciel - SOL 142171 - KTN 913629 - FIM

   //Vinicius Maciel - SOL 142171/8621 KTN 1615034
   dtDataBaseOrig := cds.fieldByName('DATABASECONTRATO').asDateTime;
   ccValorTotal := cds.fieldByName('VALORBASECONTRATO').asFloat;
   iContraparte := Cds.FieldByName('IDFORCLI').asInteger;
   //Vinicius Maciel - SOL 142171/8621 KTN 1615034

   // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
   chkContrAlertMed.Enabled := True;
   bContrAlertMedOld := chkContrAlertMed.Checked;
   dbedtAVISOMEDICAO.Enabled := chkContrAlertMed.Checked;
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim

   bContratoComANSOld := chkContratoANS.Checked; // Felipe A. Santos SOL 242313/17289 PPM 828977

end;

procedure TfrmCadContratoMT.CmeCadastroDelete(Sender: TObject);
begin
   //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   {if (Cds.FieldByName('IdReservaOrcamen').AsInteger<>0) then
    begin
       if (CtrlOrcamento.EstornaReserva(CtrlOrcamento.NumReserva,True)<>0) then
        begin
           MsgDlg(CtrlOrcamento.MessageInfo,'Erro',mtError,[mbOK],0);
           Abort;
        end;
    end;}
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

   inherited;

   if not(CtrlContratos.ExcluiContrato(StrToInt(MontaSelect.ValoresChave[0]))) then
      MsgDlg(CtrlContratos.MessageInfo,'Erro',mtError,[mbOK],0);
      //Vinicius Maciel - SOL 142171 KTN 913629
      CdsJustificativa.EmptyDataSet;
      lbResponsavel.Caption := '';
      lbResponsavel.Repaint;
      //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

   // Thiago Melo SOL 174920 KINTANA 1591690 ini
   cdsHistoricoRenovacoes.EmptyDataSet;
   // Thiago Melo SOL 174920 KINTANA 1591690 fim

   // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
   cdsANS.EmptyDataSet;
   chkContratoANS.Checked := False;
   lblVlrTotalANS.Caption :=  FormatFloat('R$ ###,###,##0.00', 0);
   tbsANS.TabVisible := False;
   tbsANS.Visible := False;
   pgctrlDetalhe.ActivePageIndex := 0;
   // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
end;

procedure TfrmCadContratoMT.CmeCadastroCancel(Sender: TObject);
begin
   //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   {if (Cds.FieldByName('IdReservaOrcamen').AsInteger<>0) and (Cds.State in [dsEdit]) then
    begin
       CtrlOrcamento.IdReserva:=Cds.FieldByName('IdReservaOrcamen').AsInteger;
       CtrlOrcamento.NumReserva:=CtrlOrcamento.BuscaIdNumReserva(CtrlOrcamento.IdReserva,
                                                                 0,True);
       if (CtrlOrcamento.MarcaReserva(CtrlOrcamento.NumReserva,True)<>0) then
        begin
           MsgDlg(CtrlOrcamento.MessageInfo,'Erro',mtError,[mbOK],0);
           Abort;
        end;
    end;}
   //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

   inherited;
   sbtnEncerrarCadastro.Enabled := False;
   sbtnEncerrarContrato.Enabled := False;
   //Vinicius Maciel - SOL 142171 KTN 913629
   if (Cds.FieldByName('IDCONTRATO').asInteger)>0 then
   ajustaAbaAlcada(3)
   else
   ajustaAbaAlcada(2);
   bJustificativaAlcada := false;  //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

   // Thiago Melo SOL 174920 KINTANA 1591690 ini
   cdsHistoricoRenovacoes.CancelUpdates;
   // Thiago Melo SOL 174920 KINTANA 1591690 fim

   //Everson Cunha - SIG46231 - Início
   if (Cds.FieldByName('IDCONTRATO').asInteger) > 0 then
    CarregaAreaGestora(Cds.FieldByName('IDCONTRATO').AsFloat)
   else
    CarregaAreaGestora(-1);
   //Everson Cunha - SIG46231 - Fim

  //Everson Cunha - SIG103333 - Ini
  if CdsNegociacao <> nil then
    CdsNegociacao.Cancel;

  if (CdsNegociacao.Active) and (CdsNegociacao.ChangeCount > 0) then
    CdsNegociacao.CancelUpdates;

  if (Cds.FieldByName('IDCONTRATO').asInteger) > 0 then
    CdsNegociacao.Data := CtrlContratos.ListNegociacao(Cds.FieldByName('IDCONTRATO').asFloat)
  else
    CdsNegociacao.Data := CtrlContratos.ListNegociacao();

  sbtnInsNegociacao.Down := False;
  sbtnAltNegociacao.Down := False;

  HabDesBotoesNegociacao;
  //Everson Cunha - SIG103333 - Fim

  // Paulo Nobre - WO15750 - Inicio
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.RollBack;
  // Paulo Nobre - WO15750 - Fim
end;

procedure TfrmCadContratoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
sTemp : string;
bAlterador : boolean;
i : integer;
begin
   inherited;
   Accept:=False;

   if (Trim(dbeNomeContrato.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o nome do contrato','Atenção',mtWarning,[mbOk],0);
       dbeNomeContrato.SetFocus;
       Exit;
    end;

   if (Trim(dbeNumeroProcesso.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Número do Processo','Atenção',mtWarning,[mbOk],0);
       dbeNumeroProcesso.SetFocus;
       Exit;
    end;

   if (Trim(dbdpDataAssinatura.Text)='') then
    begin
       MsgDlg('Obrigatório preencher a data da assinatura do contrato','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage:=TabSheetDadosContratuais;
       dbdpDataAssinatura.SetFocus;
       Exit;
    end;
   //Vinicius Maciel - SOL 142171 KTN 913629
   // Inicio WO10498 Ferrari
   if not chkVigencia.Checked then
     if (Trim(dbtpDataPrevEncerra.Text)='') then
       begin
         MsgDlg('Data prevista de encerramento do contrato não preenchida','Atenção',mtWarning,[mbOk],0);
         pgctrlDetalhe.ActivePage:=TabSheetDadosContratuais;
       end;
    // fim WO10498 Ferrari

    //Vinicius Maciel - SOL 176943 KTN 1617103
    if  ((cds.state = dsInsert) or ((verificaAlteracaoContrato) and (cds.state=dsEdit)) ) then
    begin
         if (CtrlContratos.alcadasDisponivel(dbtpDataBase.Text)) then
         begin
             MsgDlg('Não existe regime de alçada cadastrado','Atenção',mtWarning,[mbOk],0);
             pgctrlDetalhe.ActivePage:=TabSheetDadosContratuais;
             dbtpDataBase.SetFocus;
             Exit;
         end;
         //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio

          if (cds.state = dsEdit) then
          begin
              bAlterador := true;
              cdsItensContrato := CtrlContratos.listaTodosItensContratos(cds, bAlterador);
          end
          else
          begin
              bAlterador := false;
              cdsItensContrato := CtrlContratos.listaTodosItensContratos(cds, bAlterador);
          end;
  //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio   ,


         vValorAlcadas := '';
         vCargoAlcadas := '';
         vCargoAlcadas :=  CtrlContratos.CargoDisponivel(FloatToStr(CtrlContratos.somaValorContratos(cdsItensContrato)));
         //vValorAlcadas :=  CtrlContratos.ValorDisponivel(dbeValorTotal.Text);
         vValorAlcadas :=  CtrlContratos.ValorDisponivel(FloatToStr(CtrlContratos.somaValorContratos(cdsItensContrato)));
         if (vValorAlcadas = '') then //HIGOR
         begin
             MsgDlg('Não existe alçada cadastrada para o valor informado, Favor verificar','Atenção',mtWarning,[mbOk],0);
             pgctrlDetalhe.ActivePage:=TabSheetDadosContratuais;
             dbeValorTotal.SetFocus;
             Exit;
         end;
         vCargoAlcadas :=  CtrlContratos.CargoDisponivel(vValorAlcadas);
         //Higor Nayde Ferreira SOL 190509 - KTN 1802910
    end;
    //Vinicius Maciel - SOL 176943 KTN 1617103 - FIM

   //Vinicius Maciel - SOL 142171 KTN 913629 - FIM
   if (Trim(dblcMoeda.Text)='') then
    begin
       MsgDlg('Obrigatório preencher a moeda do contrato','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage:=TabSheetDadosContratuais;
       dblcMoeda.SetFocus;
       Exit;
    end;

//   //Leandro WO9228 - inicio
//   if (dbEdtValorOrcado.Value = 0 ) and (dbrgTipoValorBase.ItemIndex = 1) then
   // WO11419 - Contratos e Projetos - Cadastro de Contrato - Valor Orçado/Aprovado
   // Arnaldo V. Scarin em 14/06/2024
   // Conforme Solicitação do usuário, a verificação do valor preenchido deverá
   // ser feita somente no caso de Cadastro. Quando for uma alteração de contrato
   // não deverá ser feita nenhuma verificação

   // Paulo Nobre - WO13506 - Inicio
   if (cds.state = dsEdit) and                            // Em Inserção
      (dbrgTipoValorBase.ItemIndex = 1) and               // Selecionado Valor Base = "Variável"
      (dbEdtValorOrcado.Value = 0 ) and                   // Valor Orçado ou Aprovado = 0
      // Paulo Nobre - WO24929
      (dbrgrpVlrOrcadoAprovado.ItemIndex <> 2) Then       // Valores diferentes de "Não se Aplica"
   begin
       MsgDlg('Obrigatório informar o Valor Orçado/Aprovado quando o Valor Base for Variável.','Atenção',mtWarning,[mbOk],0);

       pcVlrOA.ActivePageIndex := 0;
       dbEdtValorOrcado.Enabled := True;
       dbEdtValorOrcado.Value := 0;
       dbEdtValorOrcado.Color := clWindow;
       dbJustNSA.Clear;

       if dbEdtValorOrcado.CanFocus then
          dbEdtValorOrcado.SetFocus;

       Exit;
   end;
   // Paulo Nobre - WO13506 - Fim

   //Leandro WO9228 - fim

   // SIG 137142 Inicio
   if (cds.state = dsInsert) and (dbrgTipoContratacao.ItemIndex = -1) then //WO 3720
    begin
       MsgDlg('Obrigatório indicar o tipo de contratação do Contrato','Atenção',mtWarning,[mbOk],0);
       Exit;
    end;

   if (cds.state = dsInsert) and (dbrgTipoContratacao.ItemIndex <> -1) and (Trim(dbeIdentificador.Text)='') then //WO 3720
    begin
       MsgDlg('Obrigatório o preenchimento do campo IDENTIFICADOR do contrato','Atenção',mtWarning,[mbOk],0);
       dbeIdentificador.SetFocus;
       Exit;
    end;
   // SIG 137142 Fim

   if (Trim(dblcAtividadeNegocio.Text)='') then
    begin
       MsgDlg('Obrigatório preencher Atividade / Projeto','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage:=TabSheetIntegracao;
       dblcAtividadeNegocio.SetFocus;
       Exit;
    end;

   if (Trim(dblcCentroRespon.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage:=TabSheetIntegracao;
       dblcCentroRespon.SetFocus;
       Exit;
    end;

   if (Trim(dblcTipoDocumento.Text)='') then
    begin
       MsgDlg('Obrigatório preencher o Tipo de Documento','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage:=TabSheetIntegracao;
       dblcTipoDocumento.SetFocus;
       Exit;
    end;

   //Gustavo Mendes - 26187
   if (Trim(CMPContraparte.Text)='') then
    begin
       MsgDlg('Obrigatório preencher a Contraparte','Atenção',mtWarning,[mbOk],0);
       pgctrlDetalhe.ActivePage:= TabSheetDadosContraparte;
       CMPContraparte.SetFocus;
       Exit;
    end;

    //Vinicius Maciel - SOL 142171 KTN 913629
    if(bJustificativaAlcada) then
    begin
            CdsJustificativa.FieldByName('IDRESPONSAVELALCADA').AsInteger := Sistema.IdUsuario;
            CdsJustificativa.FieldByName('DATARESPALCADA').AsDateTime := now();
       //     CdsJustificativa.FieldByName('IDALCADAS').AsInteger := cdsAlcadas.FieldByName('IDALCADAS').asInteger;   // sig 136929 Ferrari
            CdsJustificativa.FieldByName('VALORESCONTRATOS').AsFloat := dSomaValor;
            CdsJustificativa.post;
    end;

    //Vinicius Maciel - SOL 142171/8621 KTN 1615034
    // if not (bJustificativaAlcada) then
    if (not bJustificativaAlcada) and ((cds.state = dsInsert) or
    ((verificaAlteracaoContrato) and (cds.state=dsEdit))   ) then
    //Vinicius Maciel - SOL 142171/8621 KTN 1615034
    begin
    exibeItensContrato();
    ajustaAbaAlcada(1);
    pgctrlDetalhe.ActivePage:= TabSheetAlcada;
    dbJustificativa.SetFocus;
    bJustificativaAlcada := true;
    sTemp := CdsJustificativa.fieldByName('JUSTIFICATIVA').asString;
    CdsJustificativa.Insert;
    CdsJustificativa.fieldByName('JUSTIFICATIVA').asString := sTemp; //Da uma dica para o usuário, quando ele digitar ele carrega o valor dá última justificativa.

     //Fernando Xavier - SIG 31108
     for i := dbJustificativa.Lines.Count-1 downto 0 do
         if trim(dbJustificativa.Lines[i]) = '' then
            dbJustificativa.Lines.Delete(i);
     //Fernando Xavier - SIG 31108
    Exit;
    end;
   //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

   // Felipe A. Santos SOL 217597/17169 PPM 772732 - início comentário
   {
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
   if not(bItemVinculadoAoContrato) then
   begin
      pgctrlDetalhe.ActivePage := TabSheetDadosContratuais;
      MsgDlg('Para que este contrato receba o alerta de medição é necessário vincular um "Serviço/Produto X Item".', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
      chkContrAlertMed.SetFocus;
      Exit;
   end;
   // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim
   }
   // Felipe A. Santos SOL 217597/17169 PPM 772732 - fim comentário

   // Paulo Nobre - WO13506 - Inicio
   if (dbrgrpVlrOrcadoAprovado.ItemIndex = 2) and (dbJustNSA.Text = EmptyStr) then
   begin
      MsgDlg('Obrigatório preencher a Justificativa se selecionado a opção "Não se Aplica"','Atenção',mtWarning,[mbOk],0);
      pcVlrOA.ActivePageIndex := 1;
      if dbJustNSA.CanFocus then
         dbJustNSA.SetFocus;
      Exit;
   end;
   // Paulo Nobre - WO13506 - Fim

   Accept:=True;
end;

procedure TfrmCadContratoMT.CmeCadastroConfirma(Sender: TObject);
var
  bEncerrarContrato_Aux, bEncerrarCadastro_Aux : Boolean;
   frmAux : TfrmCadAditamentoMT;

  // Paulo Nobre - WO31928 - Inicio

  // Paulo Nobre - WO13506 - Inicio
  bImportaSaldo : Boolean;
//  iIdCtr, iIdAdiAnt : Integer;
//  dValorManual : Double;
  // Paulo Nobre - WO13506 - Fim

  // Paulo Nobre - WO31928 - Fim

begin
     bEncerrarContrato_Aux := (sStatusContrato = 'A');
     bEncerrarCadastro_Aux := ((not sbtnEncerrarContrato.Enabled) and
                            (sStatusContrato <> 'E') and (sStatusContrato <> '') );

     if  not (Cds.State in [dsInsert,dsEdit]) and
        (not bEncerrarCadastro) and (not bEncerrarContrato) then
        Exit;

     // Verifica e registra o aditamento
  //   if (Cds.State in [dsEdit]) and (bEncerrarCadastro_Aux) then begin // and not (bEncerrarCadastro_Aux) and not(sbtnEncerrarCadastro.Enabled) then begin
    //Marilza Colpani - SOL 129129/ KTN 708057
     if (Cds.State in [dsEdit]) and (bEncerrarCadastro_Aux) and not (sbtnEncerrarCadastro.Enabled) then begin
        if EfetuaAditamento then begin
           if MsgDlg('Registra um novo Aditamento para esta alteração ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
              try
                 frmAux := TfrmCadAditamentoMT.Create(Self);

                 cdsAditamento.EmptyDataSet;
                 cdsCtrlParcelaMedicao.EmptyDataSet; // Felipe A. Santos SOL 218909/16724 PPM 588170
                 frmAux.cdsAditamento.Data := cdsAditamento.Data;
                 frmAux.rIdContrato:=Cds.FieldByName('IDCONTRATO').AsFloat;
                 frmAux.Caption:='Aditamento do Contrato '+dbeNomeContrato.Text;

                 // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
                 frmAux.cdsCtrlParcelaMedicao.Data := cdsCtrlParcelaMedicao.Data;
                 frmAux.cdsServProdxItemContr.Data  := cdsServProdxItemContr.Data;
                 // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

          //       frmAux.sChamador := 'cadCont';  // Paulo Nobre -  WO15750

                 frmAux.sNaoSeAplica := Cds.FieldByName('FLG_TP_VLR_ORCADO_APROVADO').AsString;  // Paulo Nobre -  WO37036

                 if (frmAux.ShowModal=mrOk) then
                 begin
                    cdsAditamento.Data := frmAux.cdsAditamento.Data;

                    // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
                    cdsCtrlParcelaMedicao.Data := frmAux.cdsCtrlParcelaMedicao.Data;
                    cdsServProdxItemContr.Data := frmAux.cdsServProdxItemContr.Data;
                    // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

                    // Paulo Nobre - WO31928 - Inicio

                    // Paulo Nobre - WO13506 - Inicio
//                    bImportaSaldo := frmAux.chkbImportaSaldo.checked;
//                    iIdCtr    := cdsAditamento.FieldByName('IDCONTRATO').AsInteger;
//                    dValorManual :=  cdsAditamento.FieldByName('VL_ADITAMENTO').AsFloat;

//                     if (cdsAditamento.FieldByName('IDCONTRATO').AsInteger = cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsInteger) Then
//                       iIdAdiAnt := cdsAditamento.FieldByName('IDADITAMENTO').AsInteger    // Documento anterior foi um Contrato, então iIdAdiAnt = 0
//                     else
//                       iIdAdiAnt := cdsAditamento.FieldByName('IDDOCCEDEUSALDO').AsInteger;
                     // Paulo Nobre - WO13506 - Fim

                     // Paulo Nobre - WO31928 - Fim                     
                 end
                 else
                 begin
                    MsgDlg('Operação Cancelada.'+#10#13+'Os dados não foram Gravados.','Atenção',mtWarning,[mbOk],0);
                    Abort;
                 end;
              finally
                 frmAux.Free;
              end;
           end
           else
           begin
              cdsLogAditamento.EmptyDataSet;
              bbtnCancelarClick(Self); //William Santana SOL 218496 KIN 2050537
           end;
        end;
     end;

     //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
     {if (redReservaOrc.Value <> 0) then begin
        Cds.FieldByName('IDRESERVAORCAMEN').AsFloat:=CtrlOrcamento.IdReserva;
        if (CtrlOrcamento.MarcaReserva(CtrlOrcamento.NumReserva,True)<>0) then begin
           MsgDlg(CtrlOrcamento.MessageInfo,'Erro',mtError,[mbOK],0);
           Abort;
        end;
     end;}
     //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

     // Paulo Nobre - WO31928 - Inicio
     if not(CtrlContratos.AplicaAtualContratos(bEncerrarCadastro, sOrigemChamada)) then
     // Paulo Nobre - WO31928 - Fim

     // Paulo Nobre - WO15750 - Inicio
     // Devido terem colocado o controle da transaçao (commit/rollback) dentro desta função e ainda
     // mais dentro de uma control, tive que ajustar a funçao para colocar a atualização da
     // FLGSALDOTRANSFERIDO, tambem, dentro desta. (Está no final da função)
     {if not(CtrlContratos.AplicaAtualContratos(bEncerrarCadastro,
                                               bImportaSaldo,
                                               iIdCtr,
                                               iIdAdiAnt,
                                               dValorManual)) then  }
     begin
        MsgDlg(CtrlContratos.MessageInfo,'Erro',mtError,[mbOK],0);
        Abort;
     end;
     // Paulo Nobre - WO15750 - Fim

   // Efetua Refresh no Cadastro
   SelecionaMestreDetalhe(cds.FieldByName('IDCONTRATO').AsFloat);
   CmeCadastroAtualizaBotoes( Self );

   inherited;
   bEncerrarCadastro := False;
   bEncerrarContrato := False;

   if not(Cds.State in [dsInsert]) then
      chkContrAlertMed.Enabled := False; // Felipe A. Santos - SOL218909/16724 PPM 588170
end;

procedure TfrmCadContratoMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   //William Moreira da Silva - SIG 40276
   //inherited;
   //William Moreira da Silva - SIG 40276

   if cds.State = dsBrowse then begin
     sbtnEncerrarContrato.Enabled := (sStatusContrato = 'A');  
     sbtnEncerrarCadastro.Enabled := ((not sbtnEncerrarContrato.Enabled) and
                                        (sStatusContrato <> 'E') and (sStatusContrato <> '') );
   end else begin
     sbtnEncerrarContrato.Enabled := False;
     sbtnEncerrarCadastro.Enabled := False;
   end;

   //William Moreira da Silva - SIG 40276
   inherited;
   //William Moreira da Silva - SIG 40276

   // Paulo Nobre - TAS000000006791
 {  sbtnApagar.Enabled:=((Cds.FieldByName('FLGFIMCONTRATO').AsString<>'S') and
                        (Cds.FieldByName('FLGFIMCONTRATO').AsString<>'E')) and
                        (Trim(dbeNomeContrato.Text)<>'');          }

   sbtnAlterar.Enabled:=(Cds.FieldByName('FLGFIMCONTRATO').AsString<>'E') and
                        (Trim(dbeNomeContrato.Text)<>'');

   sbtnApagar.Enabled:=((Cds.FieldByName('FLGFIMCONTRATO').AsString<>'S') and
                        (Cds.FieldByName('FLGFIMCONTRATO').AsString<>'E')) and
                        (Trim(dbeNomeContrato.Text)<>'');

   PnlPrincipal.Enabled:=(Cds.State in [dsInsert,dsEdit]);
   pnlRenovacao.Enabled:=(Cds.State in [dsInsert,dsEdit]); // Edilaine - SOL 168270 / KTN 1481496

   pnlFundo.Enabled:=True;

   HabDesBotoes; //Everson Cunha - SIG46231
   HabDesBotoesAT;
   HabDesBotoesNegociacao; //Everson Cunha - SIG103333

end;

procedure TfrmCadContratoMT.sbtnEncerrarCadastroClick(Sender: TObject);
begin
  if MsgDlg('Confirma o encerramento do cadastramento do contrato?','Atenção',mtWarning,[mbYes,mbNo],0) = mrYes then begin
    if VerificaEncerrarCadastro then begin
       bEncerrarCadastro := True;
       //CtrlCtrlParcelaMedicao.InserirCtrlParcelaMedicao(cdsServProdxItemContr, cdsCtrlParcelaMedicao, False); // Felipe A. Santos SOL 218909/16724 PPM 588170 //Taffarel - SIG82216
       CmeCadastroConfirma( Self );
    end;
  end;
  sbtnEncerrarCadastro.Down:=False;
end;

procedure TfrmCadContratoMT.sbtnEncerrarContratoClick(Sender: TObject);
begin
   if MsgDlg('Confirma o encerramento do contrato?','Atenção',mtWarning,[mbYes,mbNo],0) = mrYes then begin
     with TfrmEncrerraContratoMT.Create(Self) do begin
       try
          Caption := 'Encerramento do Contrato '+Cds.FieldByName('NOMECONTRATO').AsString;
          ShowModal;
                                    
          if (ModalResult=mrOk) then begin
            Cds.Edit;
            Cds.FieldByName('DATAEFETENCERRA').AsDateTime := dtpDataEncerramento.Date;
            Cds.FieldByName('MOTIVOENCERRA').AsString     := memMotivoEncerramento.Text;
            Cds.FieldByName('FLGFIMCONTRATO').AsString    := 'E';

            //Everson Cunha - SIG101877 - Ini
            if chkDistrato.Checked then
              Cds.FieldByName('FLGDISTRATO').AsString := 'S'
            else
              Cds.FieldByName('FLGDISTRATO').AsString := 'N';
            //Everson Cunha - SIG101877 - Fim

            Cds.Post;
            bEncerrarContrato := True;
            // Paulo Nobre - WO38245 - Inicio
            //sOrigemChamada := 'E'; // Encerramento - Paulo Nobre - WO31928
            sOrigemChamada := 'CE';  // Chamado pelo Cadastro de Encerramento
            // Paulo Nobre - WO38245 - Fim
            
            CmeCadastroConfirma( Self );
          end;
       finally
           Free;
       end;
     end;
   end;
   sbtnEncerrarContrato.Down:=False;
end;

procedure TfrmCadContratoMT.btnOrcamentoClick(Sender: TObject);
begin
   MsResORc.Executar;
   if MsResORc.RetornouValor then
    begin
       redReservaOrc.Value:=StrToFloat(MsResORc.ValoresChave[1]);
       CtrlOrcamento.IdReserva:=StrToInt(MsResORc.ValoresChave[0]);
       CtrlOrcamento.NumReserva:=StrToInt(MsResORc.ValoresChave[1]);
    end;
end;

procedure TfrmCadContratoMT.CMPContraparteChange(Sender: TObject);
begin
   if (Cds.State in [dsInsert,dsEdit]) then
    begin
       dblcContato.Clear;
       Cds.FieldByName('IDCONTATO').Clear;
       Cds.FieldByName('IDTELEFONE').Clear;
       if (Trim(CMPContraparte.Text)<>'') then
        begin
           dblcContato.Enabled:=True;
           dblcTelefone.Enabled:=True;
        end
       else
        begin
           Cds.FieldByName('IDFORCLI').Clear;
           dblcContato.Enabled:=False;
           dblcTelefone.Enabled:=False;
        end;
    end;
end;

procedure TfrmCadContratoMT.CMPContraparteExit(Sender: TObject);
begin
   if (Cds.State in [dsInsert,dsEdit]) and (ActiveControl<>bbtnSair) then
      if (Trim(CMPContraparte.Text)<>'') then
       begin
          with TCMClientDataSet.Create(nil) do
          try
             Data:=CtrlListTerc.ListPessoa(Cds.FieldByName('IDFORCLI').AsFloat);
             Cds.FieldByName('IDENDCOBRANCA').AsFloat:=FieldByName('IDENDCOBRANCA').AsFloat;
             Cds.FieldByName('IDENDCORRESPON').AsFloat:=FieldByName('IDENDCORRESP').AsFloat;
             Cds.FieldByName('IDENDENTREGA').AsFloat:=FieldByName('IDENDENTREGA').AsFloat;
          finally
             Free;
          end;
          cdsContato.Close;
          cdsContato.Data:=CtrlListTerc.ListContatos(Cds.FieldByName('IDFORCLI').AsFloat);
       end
      else
       begin
          Cds.FieldByName('IDENDCOBRANCA').Clear;
          Cds.FieldByName('IDENDCORRESPON').Clear;
          Cds.FieldByName('IDENDENTREGA').Clear;
          cdsContato.EmptyDataSet;
       end;
end;

procedure TfrmCadContratoMT.dbrgTipoContratoChange(Sender: TObject);
begin
  if cds.State in [dsInsert,dsEdit] then begin      // 137142
    cdsTipoDocumento.Close;
    case dbrgTipoContrato.ItemIndex of
      0: begin
           cdsTipoDocumento.Data:=CtrlListTerc.ListTipoDoc('R','D');
           CMPContraparte.ForCli := fcCliente;
         end;
      1: begin
           cdsTipoDocumento.Data:=CtrlListTerc.ListTipoDoc('P','C');
           CMPContraparte.ForCli := fcFornecedor;
         end;
    end;
    dblcTipoDocumento.Clear;
  end;
end;

procedure TfrmCadContratoMT.dblcContatoChange(Sender: TObject);
begin
  if (cds.State in [dsInsert,dsEdit]) then begin
    dblcTelefone.Clear;
    if (Trim(dblcContato.Text)<>'') then begin
      cdsTelefone.Data:=CtrlListTerc.ListTelefoneContato(StrToFloat(dblcContato.LookupValue));
    end;
  end;
end;


function TfrmCadContratoMT.EfetuaAditamento: Boolean;
var cdsRegistra,cdsAntigo : TCMClientDataSet;
    sCampo, sAnterior, sAtual : String;
    iIDAnterior : Integer;
    i,y : Integer;
begin
  Result := False;
  try

    cdsLogAditamento.EmptyDataSet;
    cdsRegistra := TCmClientDataSet.Create( nil );
    cdsAntigo   := TCmClientDataSet.Create( nil );

    cdsRegistra.Data := CtrlParamAditamento.ListParamAditamento('CONTRATOCONTR', True);

    if not cdsRegistra.IsEmpty then begin
      // Abre contrato anterior
      cdsAntigo.Data := CtrlContratos.ListContratos(Cds.FieldByName('IDCONTRATO').AsInteger);

      // Verifica se houve alteração em algum campo parametrizado
      while not cdsRegistra.Eof do begin
        sCampo    := cdsRegistra.FieldByName('FIELDNAME').AsString;
        sAnterior := cdsAntigo.FieldByName(sCampo).AsString;
        sAtual := cds.FieldByName(sCampo).AsString;

        if sAnterior <> sAtual then begin

          // Busca o texto do combo quando o campo for assiciado a este componente
          for i := 0 to (ComponentCount - 1) do begin
             // verifica campos lookup
             iIDAnterior := 0;

             if ( (TObject(Components[i]).ClassType = TwwDBLookupCombo) and (TwwDBLookupCombo(Components[i]).DataField = sCampo) ) then begin

                // altera o id anterior pelo texto armazenado no lookup
                for y := 0 to Length(vLookAditamento) - 1 do begin
                  if vLookAditamento[y].sNomeLookup = TwwDBLookupCombo(Components[i]).Name then begin
                    sAnterior   := vLookAditamento[y].sVlrAnterior;
                    // Marchetti - Pendência: 16455
                    iIDAnterior := vLookAditamento[y].iIdLookup;
                    // Fim Marchetti - Pendência: 16455
                    Break;
                  end;
                end;
                // altera o id atual pelo texto do lookup
                sAtual := TwwDBLookupCombo(Components[i]).Text;
             end;

             // verifica campos radio group
             if ( (TObject(Components[i]).ClassType = TDBRadioGroup) and (TDBRadioGroup(Components[i]).DataField = sCampo) ) then begin

                // altera o id anterior pelo texto armazenado no lookup
                for y := 0 to Length(vLookAditamento) - 1 do begin
                  if vLookAditamento[y].sNomeLookup = TDBRadioGroup(Components[i]).Name then begin
                    sAnterior := vLookAditamento[y].sVlrAnterior;
                    Break;
                  end;
                end;
                // altera o id atual pelo texto do lookup
                sAtual := TDBRadioGroup(Components[i]).Items.Strings[TDBRadioGroup(Components[i]).ItemIndex];
             end;
          end;

          Result := True;
          cdsLogAditamento.Insert;
          cdsLogAditamento.FieldByName('IDCONTRATO').AsInteger := cds.FieldByName('IDCONTRATO').AsInteger;
          cdsLogAditamento.FieldByName('IDDDFIELD').AsInteger  := cdsRegistra.FieldByName('IDDDFIELD').AsInteger;
          cdsLogAditamento.FieldByName('VLRANTERIOR').AsString := sAnterior;
          cdsLogAditamento.FieldByName('VLRATUAL').AsString    := sAtual;

          // Marchetti - Pendência: 16455
          if iIDAnterior > 0 then
             cdsLogAditamento.FieldByName('IDANTERIOR').AsInteger := iIDAnterior;
          // Fim Marchetti - Pendência: 16455

          cdsLogAditamento.Post;
        end;
        cdsRegistra.Next;
      end;
    end;

    // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
    cdsRegistra.Data := CtrlParamAditamento.ListParamAditamento('CONTRATOANS', True);

    if not cdsRegistra.IsEmpty then begin
      // Abre contrato anterior
      cdsAntigo.Data := CtrlContratoANS.ListaContratoANS(Cds.FieldByName('IDCONTRATO').AsInteger);

      // Verifica se houve alteração em algum campo parametrizado
      while not cdsRegistra.Eof do begin
        cdsANS.First;
        cdsAntigo.First;

        while (not cdsANS.Eof) or (not CdsAntigo.Eof) do begin
          sCampo := cdsRegistra.FieldByName('FIELDNAME').AsString;

          if CdsAntigo.Eof then
             sAnterior := ''
          else
             sAnterior := cdsAntigo.FieldByName(sCampo).AsString;

          if cdsANS.Eof then
             sAtual := ''
          else
             sAtual := cdsANS.FieldByName(sCampo).AsString;

          if sAnterior <> sAtual then begin

            // Busca o texto do combo quando o campo for assiciado a este componente
            for i := 0 to (ComponentCount - 1) do begin
               // verifica campos lookup
               iIDAnterior := 0;

               if ( (TObject(Components[i]).ClassType = TwwDBLookupCombo) and (TwwDBLookupCombo(Components[i]).DataField = sCampo) ) then begin

                  // altera o id anterior pelo texto armazenado no lookup
                  for y := 0 to Length(vLookAditamento) - 1 do begin
                    if vLookAditamento[y].sNomeLookup = TwwDBLookupCombo(Components[i]).Name then begin
                      sAnterior   := vLookAditamento[y].sVlrAnterior;
                      // Marchetti - Pendência: 16455
                      iIDAnterior := vLookAditamento[y].iIdLookup;
                      // Fim Marchetti - Pendência: 16455
                      Break;
                    end;
                  end;
                  // altera o id atual pelo texto do lookup
                  sAtual := TwwDBLookupCombo(Components[i]).Text;
               end;

               // verifica campos radio group
               if ( (TObject(Components[i]).ClassType = TDBRadioGroup) and (TDBRadioGroup(Components[i]).DataField = sCampo) ) then begin

                  // altera o id anterior pelo texto armazenado no lookup
                  for y := 0 to Length(vLookAditamento) - 1 do begin
                    if vLookAditamento[y].sNomeLookup = TDBRadioGroup(Components[i]).Name then begin
                      sAnterior := vLookAditamento[y].sVlrAnterior;
                      Break;
                    end;
                  end;
                  // altera o id atual pelo texto do lookup
                  sAtual := TDBRadioGroup(Components[i]).Items.Strings[TDBRadioGroup(Components[i]).ItemIndex];
               end;
            end;

            Result := True;
            cdsLogAditamento.Insert;
            cdsLogAditamento.FieldByName('IDCONTRATO').AsInteger := cds.FieldByName('IDCONTRATO').AsInteger;
            cdsLogAditamento.FieldByName('IDDDFIELD').AsInteger  := cdsRegistra.FieldByName('IDDDFIELD').AsInteger;
            cdsLogAditamento.FieldByName('VLRANTERIOR').AsString := sAnterior;
            cdsLogAditamento.FieldByName('VLRATUAL').AsString    := sAtual;

            // Marchetti - Pendência: 16455
            if iIDAnterior > 0 then
               cdsLogAditamento.FieldByName('IDANTERIOR').AsInteger := iIDAnterior;
            // Fim Marchetti - Pendência: 16455

            cdsLogAditamento.Post;
          end;

         if not(cdsANS.Eof) then
            cdsANS.Next;

         if not(CdsAntigo.Eof) then
            cdsAntigo.Next;
        end;
        cdsRegistra.Next;
      end;
    end;
    // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
  finally
    FreeAndNil( cdsRegistra );
    FreeAndNil( cdsAntigo );
  end;
end;

procedure TfrmCadContratoMT.CarregaLookAditamento;
var i,y : Integer;
begin
  vLookAditamento := nil;
  y := 0;
  // Busca o texto original de todos os combos da tela
  for i := 0 to (ComponentCount - 1) do begin
    if TObject(Components[i]).ClassType = TwwDBLookupCombo then begin
      SetLength(vLookAditamento, y+1);
      // Marchetti - Pendência: 16455
      if TwwDBLookupCombo(Components[i]).LookupValue <> '' then
         vLookAditamento[y].iIdLookup    := StrToInt(TwwDBLookupCombo(Components[i]).LookupValue);
      // Fim Marchetti - Pendência: 16455
      vLookAditamento[y].sNomeLookup  := TwwDBLookupCombo(Components[i]).Name;
      vLookAditamento[y].sVlrAnterior := TwwDBLookupCombo(Components[i]).Text;
      Inc(y);
    end;
    // DBRadioGroup
    if TObject(Components[i]).ClassType = TDBRadioGroup then begin
      if TDBRadioGroup(Components[i]).ItemIndex >= 0 then begin
        SetLength(vLookAditamento, y+1);
        vLookAditamento[y].sNomeLookup  := TDBRadioGroup(Components[i]).Name;
        vLookAditamento[y].sVlrAnterior := TDBRadioGroup(Components[i]).Items.Strings[TDBRadioGroup(Components[i]).ItemIndex];
        Inc(y);
      end;
    end;
  end;
end;

procedure TfrmCadContratoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  //Vinicius Maciel - SOL 142171 KTN 913629
  // Recarrega o cds com o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
  begin
      SelecionaMestreDetalhe( Cds.FieldByName('IDCONTRATO').AsFloat );
      ajustaAbaAlcada(1);
  end
  else
      ajustaAbaAlcada(0);
  bJustificativaAlcada := false;
  //Vinicius Maciel - SOL 142171 KTN 913629 - FIM
end;

procedure TfrmCadContratoMT.SelecionaMestreDetalhe(const iContrato: Double );
begin
  Cds.Data:=CtrlContratos.ListContratos(iContrato);
  cdsAditamento.EmptyDataSet;
  cdsLogAditamento.EmptyDataSet;

  // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
  if (cds.FieldByName('FLGAVISOMEDICAO').AsInteger = 1) then
    chkContrAlertMed.Checked := True
  else
    chkContrAlertMed.Checked := False;
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim

  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  if (cds.FieldByName('FLGANS').AsString = 'S') then
     chkContratoANS.Checked := True
  else
     chkContratoANS.Checked := False;

  chkContratoANSClick(Self);

  dValorAnsCancel := CtrlContratoANS.GetVlrANSTotal(iContrato);
  lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dValorAnsCancel);
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  // início WO10498 Ferrari
  if (cds.FieldByName('FLGVIGENCIAINDETERMINADA').AsString = 'S') then
     chkVigencia.Checked := True
  else
     chkVigencia.Checked := False;

  chkVigenciaClick(Self);
 // Fim WO10498 Ferrari

  cdsContato.Close;
  cdsContato.Data:=CtrlListTerc.ListContatos(Cds.FieldByName('IDFORCLI').AsFloat);

  cdsTelefone.Close;
  cdsTelefone.Data:=CtrlListTerc.ListTelefoneContato(Cds.FieldByName('IDCONTATO').AsFloat);

  cdsTipoDocumento.Close;
  if (cds.FieldByName('TIPOCONTRATO').AsString='A') then
      cdsTipoDocumento.Data:=CtrlListTerc.ListTipoDoc('R','D')
  else
      cdsTipoDocumento.Data:=CtrlListTerc.ListTipoDoc('P','C');

  cdsServProdxItemContr.Close;
  cdsServProdxItemContr.Data:=CtrlServProdxItemContr.ListProdServXItem(iContrato,0,0,False);

  // Thiago Melo SOL 174920 KINTANA 1591690 ini
  cdsHistoricoRenovacoes.Data := CtrlContratos.ListaDadosHistoricoRenovacao(iContrato);
  // Thiago Melo SOL 174920 KINTANA 1591690 fim

  //Associa máscaras
  TFloatField(cdsServProdxItemContr.FieldByName('VALORUNITARIOOBJETO')).DisplayFormat:='#,##0.00';
  TFloatField(cdsServProdxItemContr.FieldByName('VALORTOTALOBJETO')).DisplayFormat:='#,##0.00';

  //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  {if (Cds.FieldByName('IDRESERVAORCAMEN').AsFloat<>0) then
   begin
      redReservaOrc.Value:=CtrlOrcamento.BuscaIdNumReserva(Cds.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                                          0,True);
      CtrlOrcamento.IdReserva:=Cds.FieldByName('IDRESERVAORCAMEN').AsInteger;
      CtrlOrcamento.NumReserva:=Trunc(redReservaOrc.Value);
   end
  else
   begin
      redReservaOrc.Value      := 0;
      CtrlOrcamento.IdReserva  := 0;
      CtrlOrcamento.NumReserva := 0;
   end;}
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  dblcContato.Enabled  := (Cds.FieldByName('IDFORCLI').AsFloat <> 0);
  dblcTelefone.Enabled := (Cds.FieldByName('IDFORCLI').AsFloat <> 0);

  CarregaLookAditamento;

  // Define Status
  sStatusContrato := CtrlContratos.StatusContrato(cds.FieldByName('IDCONTRATO').AsFloat);
  if cds.FieldByName('IDPROCESSORAD').IsNull then begin
     lblRAD.Visible    := False;
     lblStatus.Visible := False;
  end else begin
     case sStatusContrato[1] of
       'N' : lblStatus.Caption := 'Em Aberto';
       'E' : lblStatus.Caption := 'Encerrado';
       'A' : lblStatus.Caption := 'Aprovado';
       'R' : lblStatus.Caption := 'Recusado';
       'S' : lblStatus.Caption := 'Pendente';
       'X' : lblStatus.Caption := 'Excluído';
     end;
     lblRAD.Caption    := 'RAD ' + cds.FieldByName('IDPROCESSORAD').AsString;
     lblRAD.Visible    := True;
     lblStatus.Visible := True;
  end;

  //Define Sit: Contrato / Aditamento / Distrato
  //Everson Cunha - SIG101877 - Ini
  if cds.fieldbyname('FLGFIMCONTRATO').AsString <> 'N' then
  begin
    lblDistrato.Visible := True;
    
    if cds.fieldbyname('FLGDISTRATO').AsString = 'S' then
      lblDistrato.Caption := 'Distrato'
    else
    begin
      cdsAditamento.Data := CtrlAditamento.ListAditamento(0, iContrato, 'A');

      if not(cdsAditamento.IsEmpty) then
        lblDistrato.Caption := 'Aditamento'
      else
        lblDistrato.Caption := 'Contrato';

      cdsAditamento.EmptyDataSet;
    end;
  end
  else
  begin
    lblDistrato.Caption := '';
    lblDistrato.Visible := False;
  end;
  //Everson Cunha - SIG101877 - Fim

    //Vinicius Maciel - SOL 142171 KTN 913629
    CdsJustificativa.Data := CtrlContratos.selecionaJustificativa(strToInt(Cds.FieldByName('IDCONTRATO').asString));
    sResponsavel := '';
    if (CdsJustificativa.FieldByName('IDRESPONSAVELALCADA').AsInteger > 0 ) then
    sResponsavel := CtrlContratos.carregaUsuario(CdsJustificativa.FieldByName('IDRESPONSAVELALCADA').AsInteger) +' em '+FormatDateTime('dd/mm/yyyy ',CdsJustificativa.FieldByName('DATARESPALCADA').AsDateTime)+ ' as '+FormatDateTime('hh:mm',CdsJustificativa.FieldByName('DATARESPALCADA').AsDateTime);
    lbResponsavel.Caption := sResponsavel;
    lbResponsavel.Repaint;
    //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

    cdsCtrlParcelaMedicao.Data := CtrlCtrlParcelaMedicao.ListCtrlParcelaMedicao(iContrato, ); // Felipe A. Santos SOL 218909/16724 PPM 588170

   // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
   cdsANS.Data := CtrlContratoANS.ListaContratoANS(iContrato);

   TFloatField(CdsANS.FieldByName('VLRMENSAL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsANS.FieldByName('VLRANS')).DisplayFormat := '###,###,##0.00';
   // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

   CarregaAreaGestora(iContrato); //Everson Cunha - SIG46231
   CarregaAreaTecnica(iContrato);

   CdsNegociacao.Data := CtrlContratos.ListNegociacao(iContrato); //Everson Cunha - SIG103333
end;

function TfrmCadContratoMT.VerificaEncerrarCadastro: Boolean;
var sMens   : String;
    cdsTemp : TCMClientDataSet;
begin
  Result := True;
  sMens  := 'Obrigatório preencher os campos: ' +#13#10;
  if Trim(dbdpDataAssinatura.Text) = '' then begin
     sMens := sMens + '  Data de Assinatura'+#13#10;
     Result := False;
  end;
  if Trim(dblcMoeda.Text) = '' then begin
     sMens := sMens + '  Moeda do Contrato'+#13#10;
     Result := False;
  end;
  //Inicio - Luis Ferrari
  //if dbeValorTotal.Value <= 0 then begin
  if dbeValorTotal.Value < 0 then begin
     sMens := sMens + '  Valor do Contrato'+#13#10;
     Result := False;
  end;
  //Fim
  if Cds.FieldByName('IDFORCLI').IsNull then begin
     sMens := sMens + '  Contraparte'+#13#10;
     Result := False;
  end;
  if not Result then begin
     MsgDlg(sMens,'Atenção',mtWarning,[mbOk],0);
  end;

  if Result then begin
     // Verifica a Existência de Objetos Contratuais e Rateios para os Objetos
     if cdsServProdxItemContr.IsEmpty then begin
       if MsgDlg('Não existem Serviços relacionados a este contrato. '+#13+
                 'Efetua o encerramento sem esta informação ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
          Result := False;
     end;

     // Verifica a Existência de Outros Usuários relacionados ao contrato
     try
        cdsTemp := TCMClientDataSet.Create( nil );
        cdsTemp.Data := CtrlUsuXContrato.ListUsuarioXContrato( Sistema.IdEmpresa,
                                                               Cds.FieldByName('IDCONTRATO').AsInteger,
                                                               -1 );
        if cdsTemp.RecordCount < 2 then begin
          if MsgDlg('Não existem Usuários relacionados a este contrato. '+#13+
                    'Efetua o encerramento sem esta informação ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
             Result := False;
        end;
     finally
        FreeAndNil( cdsTemp );
     end;
  end;
end;

//Vinicius Maciel - SOL 142171 KTN 913629
procedure TfrmCadContratoMT.ExibeItensContrato();
var
  bAlterador : boolean;
begin
  if (cds.state = dsEdit) then
  begin
      bAlterador := true;
      cdsItensContrato := CtrlContratos.listaTodosItensContratos(cds, bAlterador);
  end
  else
  begin
      bAlterador := false;
      cdsItensContrato := CtrlContratos.listaTodosItensContratos(cds, bAlterador);
  end;
  //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Inicio   ,
  if ((vValorAlcadas <> '') and (vCargoAlcadas <> '')) then
    //cdsAlcadas.Data := CtrlContratos.carregaAlcadas(StrToFloat(vValorAlcadas),vCargoAlcadas)
    cdsAlcadas.Data := CtrlContratos.carregaAlcadas(CtrlContratos.somaValorContratos(cdsItensContrato))
  else
    cdsAlcadas.Data := CtrlContratos.carregaAlcadas(CtrlContratos.somaValorContratos(cdsItensContrato));

  Application.CreateForm(TfrmExibeItensContrato,frmExibeItensContrato);
  dSomaValor :=  CtrlContratos.somaValorContratos(cdsItensContrato);
  frmExibeItensContrato.setDados(vCargoAlcadas, dSomaValor, cdsItensContrato);
   //frmExibeItensContrato.setDados(cdsAlcadas.FieldByName('CARGO').asString, dSomaValor, cdsItensContrato);
  frmExibeItensContrato.showModal;
  //Higor Nayde Ferreira SOL 190509 - KTN 1802910 Fim
end;



procedure TfrmCadContratoMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  lbResponsavel.Caption := CtrlContratos.carregaUsuario(CdsJustificativa.FieldByName('IDRESPONSAVELALCADA').AsInteger) +' em '+FormatDateTime('dd/mm/yyyy ',CdsJustificativa.FieldByName('DATARESPALCADA').AsDateTime)+ ' as '+FormatDateTime('hh:mm',CdsJustificativa.FieldByName('DATARESPALCADA').AsDateTime);
  lbResponsavel.Repaint;

  sbtnInsDet.Enabled := True;
  sbtnAltDet.Enabled := True;
  sbtnExcluiDet.Enabled := True;

  StatusVoltarANS; // Felipe A. Santos SOL 242313/17289 PPM 828977
  //SIG 137142 Inicio
  pnlIdentificador.Enabled := True;
  //SIG 137142 Fim
end;

procedure TfrmCadContratoMT.bbtnCancelarClick(Sender: TObject);
begin
  CancelaANS; // Felipe A. Santos SOL 242313/17289 PPM 828977

  inherited;
  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnExcluiDet.Enabled := False;

  // Felipe A. Santos SOL 218909/16724 PPM 588170
  chkContrAlertMed.Checked := bContrAlertMedOld;
  chkContrAlertMed.Enabled := False;
  // Felipe A. Santos SOL 218909/16724 PPM 588170
  //SIG 137142 Inicio
  pnlIdentificador.Enabled := False;
  //SIG 137142 Fim
end;
//Vinicius Maciel - SOL 142171 KTN 913629 - FIM


procedure TfrmCadContratoMT.ajustaAbaAlcada(iOperacao: integer);
begin
    {*********Ajueste**************
     Operacao = 0 - Esconde a Aba Alçada e limpa os campos de Usuário/data
     Operacao = 1 - Habilita a Aba Alçada, libera os campos para edição e carrega
                    a data e o usuário atualmetne logado no sistema
     Operacao = 2 - Habilita a Aba Alçada e tras limpo os campos de Usuário/Data
     Operacao = 3 - Habilira a Aba Alçada e carrega os campos de Usuário/Data
    }
    //Controla a exibição da aba Alcadas para quando a operação for definida como 1 ou 2
    if iOperacao <> 0 then
    begin
         TabSheetAlcada.Visible := true;
         TabSheetAlcada.TabVisible := true;
    end
    else
    begin
         TabSheetAlcada.Visible := false;
         TabSheetAlcada.TabVisible := false;
    end;

    //Carrega a última justifica digitada
    {if iOperacao = 1 then
       CdsJustificativa.Data := CtrlContratos.selecionaJustificativa(strToInt(Cds.FieldByName('IDCONTRATO').asString)); }


    //Limpa os Valores de Data e Usuário Responsáveis
    if ((iOperacao = 2)or (iOperacao = 0) ) then
    begin
      lbResponsavel.Caption := '';
      lbResponsavel.Repaint;
    end;

    //Carrega os campos de Usuário/Data do Tabela JUSTIFICACONTRATO
    if iOperacao = 3 then
    begin
      CdsJustificativa.Data := CtrlContratos.selecionaJustificativa(strToInt(Cds.FieldByName('IDCONTRATO').asString));
      sResponsavel := '';
      if (CdsJustificativa.FieldByName('IDRESPONSAVELALCADA').AsInteger > 0 ) then
      sResponsavel := CtrlContratos.carregaUsuario(CdsJustificativa.FieldByName('IDRESPONSAVELALCADA').AsInteger) +' em '+FormatDateTime('dd/mm/yyyy ',CdsJustificativa.FieldByName('DATARESPALCADA').AsDateTime)+ ' as '+FormatDateTime('hh:mm',CdsJustificativa.FieldByName('DATARESPALCADA').AsDateTime);
      lbResponsavel.Caption := sResponsavel;
      lbResponsavel.Repaint;
    end;

    //Carrega a data e o usuário atualmente logados no sistema
    if iOperacao = 1 then
    begin
      dbJustificativa.Enabled := true;
      if (cds.state = dsEdit) then
        CdsJustificativa.Edit;        // SIG 136929 Ferrari
      sResponsavel := Sistema.NomeUsuario +' em '+FormatDateTime('dd/mm/yyyy ',now())+ ' as '+FormatDateTime('hh:mm',now());
      if ((lbResponsavel.Caption = '') or (cds.state = dsEdit))then
      lbResponsavel.Caption := sResponsavel;
      lbResponsavel.Repaint;
    end;
    TabSheetDadosContratuais.Visible := false;
    TabSheetDadosContratuais.TabVisible := false;
    TabSheetDadosContratuais.Visible := true;
    TabSheetDadosContratuais.TabVisible := true;
    pgctrlDetalhe.ActivePageindex := 0;
end;


procedure TfrmCadContratoMT.chkRenovacaoClick(Sender: TObject);
begin
  // Edilaine - SOL 168270 / KTN 1481496
  if (Cds.State in [dsInsert,dsEdit]) then
  begin
    if chkRenovacao.Checked then
    begin
      cds.FieldByName('FLGRENOVACAO').AsString  := 'S';
      cds.FieldByName('RESPRENOVACAO').AsString := Sistema.NomeUsuario;;
    end
    else
    begin
      cds.FieldByName('FLGRENOVACAO').AsString  := 'N';
      cds.FieldByName('RESPRENOVACAO').AsString := '';
    end;
  end;
  // Edilaine - SOL 168270 / KTN 1481496 - fim
end;


procedure TfrmCadContratoMT.CarregaContrato(iContrato: Double);
begin

  SelecionaMestreDetalhe( iContrato );

  // Marchetti - Pendencia 16455
  if Sistema.UsaRad then
  begin
     Application.CreateForm(TfrmAditamentosNaoAprovados,frmAditamentosNaoAprovados);
     frmAditamentosNaoAprovados.IdContrato := StrToFloat(MontaSelect.ValoresChave[0]);
     frmAditamentosNaoAprovados.cdsAditamento.Data := CtrlAditamento.ListaAditamentosNaoAprovados(frmAditamentosNaoAprovados.IdContrato);
     if not frmAditamentosNaoAprovados.cdsAditamento.IsEmpty then
     begin
        frmAditamentosNaoAprovados.ShowModal;
     end;

     frmAditamentosNaoAprovados.cdsAditamento.Data := CtrlAditamento.ListaAditamentosNaoAprovados(frmAditamentosNaoAprovados.IdContrato);
     sbtnAlterar.Enabled := frmAditamentosNaoAprovados.cdsAditamento.IsEmpty;

     frmAditamentosNaoAprovados.Free;
  end;
  // Fim Marchetti - Pendencia 16455

  //Vinicius Maciel - SOL 142171 KTN 913629
  bJustificativaAlcada := false;
  if MontaSelect.RetornouValor then
//     ajustaAbaAlcada(3)
     ajustaAbaAlcada(1)  // SIG 136929 Ferrari
  else
     ajustaAbaAlcada(2);
  //Vinicius Maciel - SOL 142171 KTN 913629 - FIM

  //Vinicius Maciel - SOL 163982/6901 - KTN 1472467
  if ((dblcAtividadeNegocio.Text = '') and (dblcAtividadeNegocio.LookupValue <> '')) then
     dblcAtividadeNegocio.Text := CtrlListTerc.recuperaAtividadePerd(dblcAtividadeNegocio.LookupValue);
  //Vinicius Maciel - SOL 163982/6901 - KTN 1472467 - FIM

  // Edilaine - SOL 168270 / KTN 1481496
  chkRenovacao.Checked := (cds.FieldByName('FLGRENOVACAO').AsString = 'S');
  // Edilaine - SOL 168270 / KTN 1481496 - fim

  // Helen - WO10578 - inicio
  chkFaseEncerramento.Checked := (cds.FieldByName('FLGFASE_ENCERRAMENTO').AsString = 'S');
  // Helen - WO10578 - Fim

  // Paulo Nobre - WO20717 - Inicio
  chkServPontual.Checked := (cds.FieldByName('FLGSERVICOPONTUAL').AsString = 'S');
  chkServContinuado.Checked := (cds.FieldByName('FLGSERVICOCONTINUADO').AsString = 'S');
  // Paulo Nobre - WO20717 - Fim  

  CmeCadastroAtualizaBotoes( Self );

  // Paulo Nobre - WO13506 - Inicio
  if dbrgrpVlrOrcadoAprovado.ItemIndex = 2 then
  begin
    dbEdtValorOrcado.Color := clSilver;
    dbEdtValorOrcado.Value := 0;
    dbEdtValorOrcado.Enabled := False;
  end;
  // Paulo Nobre - WO13506 - Fim
end;

function TfrmCadContratoMT.verificaAlteracaoContrato: boolean;
var
ccValor : currency;
begin
     result := false;
     if (dtDataBaseOrig <>cds.fieldByName('DATABASECONTRATO').asDateTime) then
        result := true;
        ccValor := cds.fieldByName('VALORBASECONTRATO').asFloat;
     if (ccValorTotal <>ccValor) then
        result := true;
     if (iContraparte <>Cds.FieldByName('IDFORCLI').asInteger) then
        result := true;
end;

// Thiago Melo SOL 174920 KINTANA 1591690 ini

procedure TfrmCadContratoMT.pgctrlDetalheChange(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePageIndex = 8 then begin
    NtbHistoricoRenovacao.ActivePage := 'PgApresentacao';
  end
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  else if pgctrlDetalhe.ActivePage = tbsANS then
  begin
    if cdsANS.State in [dsInsert, dsEdit] then
    begin
     cdsANS.Cancel;

     StatusVoltarANS;
    end;
    
    ntbANS.ActivePage := 'PgGridANS';
  end;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
end;

procedure TfrmCadContratoMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  sbtnAltDet.Enabled    := False;
  sbtnExcluiDet.Enabled := False;
  
  cdsHistoricoRenovacoes.Insert;
  cdsHistoricoRenovacoes.FieldByName('IDCONTRATO').AsFloat := Cds.FieldByName('IDCONTRATO').AsFloat;

  NtbHistoricoRenovacao.ActivePage := 'PgAlteracao';
end;

procedure TfrmCadContratoMT.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  if cdsHistoricoRenovacoes.IsEmpty then begin
    MsgDlg('Não existem lançamentos para correção','Atenção',mtInformation,[mbOk],0);
    sbtnAltDet.Down := False;
  end
  else begin
    sbtnInsDet.Enabled    := False;
    sbtnExcluiDet.Enabled := False;
    cdsHistoricoRenovacoes.Edit;

    NtbHistoricoRenovacao.ActivePage := 'PgAlteracao';
  end;  
end;

procedure TfrmCadContratoMT.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  if cdsHistoricoRenovacoes.IsEmpty then begin
    MsgDlg('Não existem lançamentos para exclusão','Atenção',mtInformation,[mbOk],0);
    sbtnAltDet.Down := False; 
  end
  else begin
    ExcluirHistoricoRenovacao;
  end;
end;

procedure TfrmCadContratoMT.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  if cdsHistoricoRenovacoes.State in [dsEdit, dsInsert] then begin
    if not ValidaCamposHistoricoRenovacao then begin
      Exit;
    end;

    cdsHistoricoRenovacoes.Post;

    sbtnInsDet.Down := False;
    sbtnAltDet.Down := False;

    sbtnInsDet.Enabled    := True;
    sbtnAltDet.Enabled    := True;
    sbtnExcluiDet.Enabled := True;

    NtbHistoricoRenovacao.ActivePage := 'PgApresentacao';
  end;
end;

procedure TfrmCadContratoMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;

  cdsHistoricoRenovacoes.Data := CtrlContratos.ListaDadosHistoricoRenovacao(Cds.FieldByName('IDCONTRATO').AsFloat);
  NtbHistoricoRenovacao.ActivePage := 'PgApresentacao';
end;

procedure TfrmCadContratoMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  NtbHistoricoRenovacao.ActivePage := 'PgApresentacao';
  cdsHistoricoRenovacoes.CancelUpdates;

  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;

  sbtnInsDet.Enabled    := True;
  sbtnAltDet.Enabled    := True;
  sbtnExcluiDet.Enabled := True;
end;

procedure TfrmCadContratoMT.grdHistoricoRenovacaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R : TRect;
begin
  R := Rect;
  Dec(R.Bottom,2);
  
  if Column.Field = cdsHistoricoRenovacoes.FieldByName('DESCANDAMENTO') then begin
    if not (gdSelected in State) then begin
      grdHistoricoRenovacao.Canvas.FillRect(Rect);
    end;
    grdHistoricoRenovacao.Canvas.TextRect(R,R.Left,R.Top, cdsHistoricoRenovacoes.FieldByName('DESCANDAMENTO').AsString);
  end;
end;

procedure TfrmCadContratoMT.cdsHistoricoRenovacoesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  cdsHistoricoRenovacoes.Fields[2].DisplayLabel := 'Data do Andamento';
  cdsHistoricoRenovacoes.Fields[3].DisplayLabel := 'Descrição do Andamento';

  grdHistoricoRenovacao.Fields[1].Visible := False;
  grdHistoricoRenovacao.Fields[0].Visible := False;
end;

function TfrmCadContratoMT.ValidaCamposHistoricoRenovacao: Boolean;
begin
  if (Trim(cdsHistoricoRenovacoes.FieldByName('DTANDAMENTO').AsString) = '') and (Trim(cdsHistoricoRenovacoes.FieldByName('DESCANDAMENTO').AsString) = '') then begin
    MsgDlg('Obrigatório preencher a Data do Andamento e a Descrição do Andamento','Atenção',mtWarning,[mbOk],0);
    Result := False;
    Exit;
  end;

  if Trim(cdsHistoricoRenovacoes.FieldByName('DTANDAMENTO').AsString) = '' then begin
    MsgDlg('Obrigatório preencher a Data do Andamento','Atenção',mtWarning,[mbOk],0);
    Result := False;
    Exit;
  end;

  if Trim(cdsHistoricoRenovacoes.FieldByName('DESCANDAMENTO').AsString) = '' then begin
    MsgDlg('Obrigatório preencher a Descrição do Andamento','Atenção',mtWarning,[mbOk],0);
    Result := False;
    Exit;
  end;
  Result := True;
end;

procedure TfrmCadContratoMT.ExcluirHistoricoRenovacao;
begin
  if MsgDlg('Deseja exluir esse registro ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
    cdsHistoricoRenovacoes.Delete;
  end;
end;

procedure TfrmCadContratoMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled := True;
  sbtnAltDet.Enabled := True;
  sbtnExcluiDet.Enabled := True;

  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  StatusVoltarANS;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

  CarregaAreaGestora(-1); //Everson Cunha - SIG46231
  CdsNegociacao.Data := CtrlContratos.ListNegociacao(); //Everson Cunha - SIG103333
  //SIG 137142 Inicio
  pnlIdentificador.Enabled := True;
  //SIG 137142 Fim
end;

procedure TfrmCadContratoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnExcluiDet.Enabled := False;

  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  btnInsertANS.Enabled := False;
  btnAlterarANS.Enabled := False;
  btnExcluirANS.Enabled := False;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
  //SIG 137142 Inicio
  //pnlIdentificador.Enabled := False; //WO 3720
  //SIG 137142 Fim
end;

// Thiago Melo SOL 174920 KINTANA 1591690 fim

procedure TfrmCadContratoMT.chkContrAlertMedClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos - SOL218909/16724 PPM 588170 - início
  bItemVinculadoAoContrato := True;

  if Cds.State in [dsInsert, dsEdit] then
  begin
     if chkContrAlertMed.Checked then
     begin
        Cds.FieldByName('FLGAVISOMEDICAO').AsInteger := 1;
        dbedtAVISOMEDICAO.Enabled := True;

        if not(CtrlContratos.ItemVinculadoAoContrato(Cds.FieldByName('IDCONTRATO').AsFloat)) then
        begin
           //dbedtAVISOMEDICAO.Enabled := False;
           dbedtAVISOMEDICAO.Enabled := True; // Felipe A. Santos SOL 217597/17169 PPM 772732 
           Cds.FieldByName('AVISOMEDICAO').AsString := '';

           bItemVinculadoAoContrato := False;
           pgctrlDetalhe.ActivePage := TabSheetDadosContratuais;
           MsgDlg('Para que este contrato receba o alerta de medição é necessário vincular um "Serviço/Produto X Item".', 'Aviso', mtWarning, [mbOk], 0);
           chkContrAlertMed.SetFocus;
        end
        else
        begin
           bItemVinculadoAoContrato := True;
        end;
     end
     else
     begin
        Cds.FieldByName('FLGAVISOMEDICAO').AsInteger := 0;
        Cds.FieldByName('AVISOMEDICAO').AsString := '';
        bItemVinculadoAoContrato := True;
        dbedtAVISOMEDICAO.Enabled := False;
     end;
  end;
  // Felipe A. Santos - SOL218909/16724 PPM 588170 - fim
end;


procedure TfrmCadContratoMT.dbtpDataPrevEncerraChange(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 217597/17169 PPM 772732 - início
  if (cds.State = dsEdit) then
    chkRenovacao.Checked := False;
  // Felipe A. Santos SOL 217597/17169 PPM 772732 - fim
end;

// Felipe A. Santos SOL 242313/17289 PPM 828977 - início
procedure TfrmCadContratoMT.btnInsertANSClick(Sender: TObject);
begin
  inherited;
  dVlrAnsOld := 0;
  medtRef.Clear;

  cdsANS.Insert;
  cdsANS.FieldByName('IDCONTRATO').AsFloat := Cds.FieldByName('IDCONTRATO').AsFloat;

  ntbANS.ActivePage := 'PgEdicaoANS';
end;

procedure TfrmCadContratoMT.btnAlterarANSClick(Sender: TObject);
begin
  inherited;
  cdsANS.Edit;
  dVlrAnsOld := 0;
  dVlrAnsOld := cdsANS.FieldByName('VLRANS').AsFloat;
  medtRef.Text := CdsANS.FieldByName('REFERENCIA').AsString;

  ntbANS.ActivePage := 'PgEdicaoANS';
end;

procedure TfrmCadContratoMT.btnExcluirANSClick(Sender: TObject);
var
 dVlrANSex : double;
 sVlrANSAux : string;
begin
  inherited;

  dVlrANSex := cdsANS.FieldByName('VLRANS').AsFloat;
  sVlrANSAux := StringReplace(lblVlrTotalANS.Caption,'.','',[rfReplaceAll]);
  sVlrANSAux := StringReplace(sVlrANSAux, 'R$', '', [rfReplaceAll]);
  dVlrAnsAtual := StrToFloat(sVlrANSAux);

  cdsANS.Delete;

  lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dVlrAnsAtual - dVlrANSex);

  if CdsANS.IsEmpty then
  begin
    btnExcluirANS.Enabled := False;
    btnAlterarANS.Enabled := False;
  end;
end;

procedure TfrmCadContratoMT.btnOkANSClick(Sender: TObject);
var
   dDifVlrAns : Double;
   sVlrAnsAux : string;
begin
  inherited;

  //William Moreira da Silva - SIG 37493
  //if (Trim(dbedtVlrMensal.Text) = '') or (dbedtVlrMensal.Text = '0,00') then
  if (Trim(dbedtVlrMensal.Text) = '') then
  //William Moreira da Silva - SIG 37493
  begin
     MsgDlg('É obrigatório o preenchimento campo do VALOR MENSAL do ANS', 'Aviso', mtWarning, [mbOk], 0);
     dbedtVlrMensal.SetFocus;
     Exit;
  end
  //William Moreira da Silva - SIG 37493
  //else if (Trim(dbedtVlrANS.Text) = '') or (dbedtVlrANS.Text = '0,00') then
  else if (Trim(dbedtVlrANS.Text) = '') then
  //William Moreira da Silva - SIG 37493
  begin
    MsgDlg('É obrigatório o preenchimento do campo VALOR ANS', 'Aviso', mtWarning, [mbOk], 0);
    dbedtVlrANS.SetFocus;
    Exit;
  end
  else if (Trim(dbedtNumCI.Text) = '') then
  begin
    MsgDlg('É obrigatório o preenchimento do campo SOLICITAÇÃO.', 'Aviso', mtWarning, [mbOk], 0);
    dbedtNumCI.SetFocus;
    Exit;
  end
  else if (Trim(StringReplace(medtRef.Text, '/', '', [rfReplaceAll])) = '') then
  begin
    MsgDlg('É obrigatório o preenchimento do campo REFERÊNCIA do ANS', 'Aviso', mtWarning, [mbOk], 0);
    medtRef.SetFocus;
    Exit;
  end
  else if (Trim(dbmmoObs.Text) = '') then
  begin
    MsgDlg('É obrigatório o preenchimento do campo OBSERVAÇÃO do ANS', 'Aviso', mtWarning, [mbOk], 0);
    dbmmoObs.SetFocus;
    Exit;
  end;

  if CdsANS.State = dsInsert then
  begin
    sVlrAnsAux := StringReplace(lblVlrTotalANS.Caption,'.','',[rfReplaceAll]);
    sVlrAnsAux := StringReplace(sVlrAnsAux,'R$','',[rfReplaceAll]);
    dVlrAnsAtual := StrToFloat(sVlrAnsAux);
    lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dVlrAnsAtual +
                                                            cdsANS.FieldByName('VLRANS').AsFloat);
  end
  else if CdsANS.State = dsEdit then
  begin
    dDifVlrAns := (CdsANS.FieldByName('VLRANS').AsFloat - dVlrAnsOld);
    sVlrAnsAux := StringReplace(lblVlrTotalANS.Caption,'.','',[rfReplaceAll]);
    sVlrAnsAux := StringReplace(sVlrAnsAux,'R$','',[rfReplaceAll]);
    dVlrAnsAtual := StrToFloat(sVlrAnsAux);

    lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dVlrAnsAtual +
                                                             dDifVlrAns);
  end;

  CdsANS.FieldByName('DTLANCTO').AsDateTime := Now;
  CdsANS.FieldByName('REFERENCIA').AsString := medtRef.Text;

  //William Moreira da Silva - SIG 39721
  //William Moreira da Silva - SIG 37493
  //CdsANS.FieldByName('VLRMENSAL').AsFloat := strtofloat(dbedtVlrMensal.Text);
  //CdsANS.FieldByName('VLRANS').AsFloat := strtofloat(dbedtVlrANS.Text);
  //William Moreira da Silva - SIG 37493
  //William Moreira da Silva - SIG 39721

  CdsANS.Post;

  StatusVoltarANS;

  ntbANS.ActivePage := 'PgGridANS';
end;

procedure TfrmCadContratoMT.btnCancelarANSClick(Sender: TObject);
begin
  inherited;
  CdsANS.Cancel;

  StatusVoltarANS;

  ntbANS.ActivePage := 'PgGridANS';
end;

procedure TfrmCadContratoMT.btnVoltarANSClick(Sender: TObject);
begin
  inherited;
  cdsANS.Cancel;

  StatusVoltarANS;

  ntbANS.ActivePage := 'PgGridANS';
end;

procedure TfrmCadContratoMT.StatusVoltarANS;
begin
  if Cds.State in [dsInsert, dsEdit] then
  begin
    btnInsertANS.Down := False;
    btnAlterarANS.Down := False;
    btnExcluirANS.Down := False;

    btnInsertANS.Enabled := True;

    if not(cdsANS.IsEmpty) then
    begin
       btnAlterarANS.Enabled := True;
       btnExcluirANS.Enabled := True;
    end;
  end;
end;

procedure TfrmCadContratoMT.CancelaANS;
begin
   cdsANS.CancelUpdates;
   lblVlrTotalANS.Caption := FormatFloat('R$ ###,###,##0.00', dValorAnsCancel);

   btnInsertANS.Enabled := False;
   btnAlterarANS.Enabled := False;
   btnExcluirANS.Enabled := False;
   chkContratoANS.Checked := bContratoComANSOld;
end;

procedure TfrmCadContratoMT.chkContratoANSClick(Sender: TObject);
begin
  inherited;
  if chkContratoANS.Checked then
  begin
    tbsANS.Visible := True;
    tbsANS.TabVisible := True;

    if Cds.State in [dsInsert, dsEdit] then
       Cds.FieldByName('FLGANS').AsString := 'S';
  end
  else
  begin
    tbsANS.Visible := False;
    tbsANS.TabVisible := False;
    cdsANS.CancelUpdates;

    if Cds.State in [dsInsert, dsEdit] then
       Cds.FieldByName('FLGANS').AsString := 'N';
  end;
end;

// Felipe A. Santos SOL 242313/17289 PPM 828977 - fim

procedure TfrmCadContratoMT.medtRefKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - início
  if not(Key in ['0' .. '9', #8, '/']) then
     Key := #0;
  // Felipe A. Santos SOL 242313/17289 PPM 828977 - fim
end;

procedure TfrmCadContratoMT.CarregaAreaGestora(IdContrato : Double);
begin
  if not cdsCCustoDisp.IsEmpty then
    cdsCCustoDisp.EmptyDataSet;

  if not cdsCCustoSelecionados.IsEmpty then
    cdsCCustoSelecionados.EmptyDataSet;

  cdsCCustoDisp.Data := CtrlContratos.ListAreaGestora(IdContrato, 'D');
  cdsCCustoSelecionados.Data := CtrlContratos.ListAreaGestora(IdContrato, 'S');
end;

procedure TfrmCadContratoMT.CarregaAreaTecnica(IdContrato : Double);
begin
  if not cdsCCustoATDisp.IsEmpty then
    cdsCCustoATDisp.EmptyDataSet;

  if not cdsCCustoATSelecionados.IsEmpty then
    cdsCCustoATSelecionados.EmptyDataSet;

  cdsCCustoAtDisp.Data         := CtrlContratos.ListAreaTecnica(IdContrato, 'D');
  cdsCCustoATSelecionados.Data := CtrlContratos.ListAreaTecnica(IdContrato, 'S');
end;

procedure TfrmCadContratoMT.btnIncluirClick(Sender: TObject);
begin
   cdsCCustoSelecionados.Append;
   cdsCCustoSelecionados.FieldByName('CODCENTROCUSTO').AsString := cdsCCustoDisp.FieldByName('CODCENTROCUSTO').AsString;
   cdsCCustoSelecionados.FieldByName('NOME').AsString           := cdsCCustoDisp.FieldByName('NOME').AsString;
   cdsCCustoSelecionados.FieldByName('CODEXTERNO').AsString     := cdsCCustoDisp.FieldByName('CODEXTERNO').AsString;
   cdsCCustoSelecionados.FieldByName('IDCONTRATO').AsFloat      := cdsCCustoDisp.FieldByName('IDCONTRATO').AsFloat;
   cdsCCustoSelecionados.FieldByName('IDEMPRESA').AsFloat       := cdsCCustoDisp.FieldByName('IDEMPRESA').AsFloat;
   cdsCCustoSelecionados.Post;

   cdsCCustoDisp.Delete;

   HabDesBotoes;
end;

procedure TfrmCadContratoMT.btnExcluirClick(Sender: TObject);
begin
  cdsCCustoDisp.Append;
  cdsCCustoDisp.FieldByName('CODCENTROCUSTO').AsString          := cdsCCustoSelecionados.FieldByName('CODCENTROCUSTO').AsString;
  cdsCCustoDisp.FieldByName('NOME').AsString                    := cdsCCustoSelecionados.FieldByName('NOME').AsString;
  cdsCCustoDisp.FieldByName('CODEXTERNO').AsString              := cdsCCustoSelecionados.FieldByName('CODEXTERNO').AsString;
  cdsCCustoDisp.FieldByName('IDCONTRATO').AsFloat               := cdsCCustoSelecionados.FieldByName('IDCONTRATO').AsFloat;
  cdsCCustoDisp.FieldByName('IDEMPRESA').AsFloat                := cdsCCustoSelecionados.FieldByName('IDEMPRESA').AsFloat;
  cdsCCustoDisp.Post;

  cdsCCustoSelecionados.Delete;

  HabDesBotoes;
end;

procedure TfrmCadContratoMT.HabDesBotoes;
begin
  btnIncluir.Enabled      := not(cdsCCustoDisp.IsEmpty)         and (cds.State in [dsInsert, dsEdit]);
  btnIncluirTodos.Enabled := not(cdsCCustoDisp.IsEmpty)         and (cds.State in [dsInsert, dsEdit]);
  btnExcluir.Enabled      := not(cdsCCustoSelecionados.IsEmpty) and (cds.State in [dsInsert, dsEdit]);
  btnExcluirTodos.Enabled := not(cdsCCustoSelecionados.IsEmpty) and (cds.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadContratoMT.btnIncluirTodosClick(Sender: TObject);
begin
  cdsCCustoDisp.DisableControls;
  cdsCCustoSelecionados.DisableControls;
  try
    cdsCCustoDisp.First;
    while not(cdsCCustoDisp.IsEmpty) do
    begin
      cdsCCustoSelecionados.Append;
      cdsCCustoSelecionados.FieldByName('CODCENTROCUSTO').AsString := cdsCCustoDisp.FieldByName('CODCENTROCUSTO').AsString;
      cdsCCustoSelecionados.FieldByName('NOME').AsString           := cdsCCustoDisp.FieldByName('NOME').AsString;
      cdsCCustoSelecionados.FieldByName('CODEXTERNO').AsString     := cdsCCustoDisp.FieldByName('CODEXTERNO').AsString;
      cdsCCustoSelecionados.FieldByName('IDCONTRATO').AsFloat      := cdsCCustoDisp.FieldByName('IDCONTRATO').AsFloat;
      cdsCCustoSelecionados.FieldByName('IDEMPRESA').AsFloat       := cdsCCustoDisp.FieldByName('IDEMPRESA').AsFloat;
      cdsCCustoSelecionados.Post;

      cdsCCustoDisp.Delete;
    end;
  finally
    cdsCCustoDisp.EnableControls;
    cdsCCustoSelecionados.EnableControls;
  end;

  HabDesBotoes;
end;

procedure TfrmCadContratoMT.btnExcluirTodosClick(Sender: TObject);
begin
  inherited;

  cdsCCustoSelecionados.DisableControls;
  cdsCCustoDisp.DisableControls;
  try
    cdsCCustoSelecionados.First;
    while not(cdsCCustoSelecionados.IsEmpty) do
    begin
      cdsCCustoDisp.Append;
      cdsCCustoDisp.FieldByName('CODCENTROCUSTO').AsString := cdsCCustoSelecionados.FieldByName('CODCENTROCUSTO').AsString;
      cdsCCustoDisp.FieldByName('NOME').AsString           := cdsCCustoSelecionados.FieldByName('NOME').AsString;
      cdsCCustoDisp.FieldByName('CODEXTERNO').AsString     := cdsCCustoSelecionados.FieldByName('CODEXTERNO').AsString;
      cdsCCustoDisp.FieldByName('IDCONTRATO').AsFloat      := cdsCCustoSelecionados.FieldByName('IDCONTRATO').AsFloat;
      cdsCCustoDisp.FieldByName('IDEMPRESA').AsFloat       := cdsCCustoSelecionados.FieldByName('IDEMPRESA').AsFloat;
      cdsCCustoDisp.Post;

      cdsCCustoSelecionados.Delete;
    end;
  finally
    cdsCCustoSelecionados.EnableControls;
    cdsCCustoDisp.EnableControls;
  end;

  HabDesBotoes;
end;

procedure TfrmCadContratoMT.btnIncluirATClick(Sender: TObject);
begin
   cdsCCustoATSelecionados.Append;
   cdsCCustoATSelecionados.FieldByName('CODCENTROCUSTO').AsString := cdsCCustoATDisp.FieldByName('CODCENTROCUSTO').AsString;
   cdsCCustoATSelecionados.FieldByName('NOME').AsString           := cdsCCustoATDisp.FieldByName('NOME').AsString;
   cdsCCustoATSelecionados.FieldByName('CODEXTERNO').AsString     := cdsCCustoATDisp.FieldByName('CODEXTERNO').AsString;
   cdsCCustoATSelecionados.FieldByName('IDCONTRATO').AsFloat      := cdsCCustoATDisp.FieldByName('IDCONTRATO').AsFloat;
   cdsCCustoATSelecionados.FieldByName('IDEMPRESA').AsFloat       := cdsCCustoATDisp.FieldByName('IDEMPRESA').AsFloat;
   cdsCCustoATSelecionados.Post;

   cdsCCustoATDisp.Delete;

   HabDesBotoesAT;
end;

procedure TfrmCadContratoMT.btnExcluirATClick(Sender: TObject);
begin
  cdsCCustoATDisp.Append;
  cdsCCustoATDisp.FieldByName('CODCENTROCUSTO').AsString := cdsCCustoATSelecionados.FieldByName('CODCENTROCUSTO').AsString;
  cdsCCustoATDisp.FieldByName('NOME').AsString           := cdsCCustoATSelecionados.FieldByName('NOME').AsString;
  cdsCCustoATDisp.FieldByName('CODEXTERNO').AsString     := cdsCCustoATSelecionados.FieldByName('CODEXTERNO').AsString;
  cdsCCustoATDisp.FieldByName('IDCONTRATO').AsFloat      := cdsCCustoATSelecionados.FieldByName('IDCONTRATO').AsFloat;
  cdsCCustoATDisp.FieldByName('IDEMPRESA').AsFloat       := cdsCCustoATSelecionados.FieldByName('IDEMPRESA').AsFloat;
  cdsCCustoATDisp.Post;

  cdsCCustoATSelecionados.Delete;

  HabDesBotoesAT;
end;

procedure TfrmCadContratoMT.HabDesBotoesAT;
begin
  btnIncluirAT.Enabled      := not(cdsCCustoATDisp.IsEmpty)         and (cds.State in [dsInsert, dsEdit]);
  btnIncluirTodosAT.Enabled := not(cdsCCustoATDisp.IsEmpty)         and (cds.State in [dsInsert, dsEdit]);
  btnExcluirAT.Enabled      := not(cdsCCustoATSelecionados.IsEmpty) and (cds.State in [dsInsert, dsEdit]);
  btnExcluirTodosAT.Enabled := not(cdsCCustoATSelecionados.IsEmpty) and (cds.State in [dsInsert, dsEdit]);
end;

procedure TfrmCadContratoMT.btnIncluirTodosATClick(Sender: TObject);
begin
  cdsCCustoATDisp.DisableControls;
  cdsCCustoATSelecionados.DisableControls;
  try
    cdsCCustoATDisp.First;
    while not(cdsCCustoATDisp.IsEmpty) do
    begin
      cdsCCustoATSelecionados.Append;
      cdsCCustoATSelecionados.FieldByName('CODCENTROCUSTO').AsString := cdsCCustoATDisp.FieldByName('CODCENTROCUSTO').AsString;
      cdsCCustoATSelecionados.FieldByName('NOME').AsString           := cdsCCustoATDisp.FieldByName('NOME').AsString;
      cdsCCustoATSelecionados.FieldByName('CODEXTERNO').AsString     := cdsCCustoATDisp.FieldByName('CODEXTERNO').AsString;
      cdsCCustoATSelecionados.FieldByName('IDCONTRATO').AsFloat      := cdsCCustoATDisp.FieldByName('IDCONTRATO').AsFloat;
      cdsCCustoATSelecionados.FieldByName('IDEMPRESA').AsFloat       := cdsCCustoATDisp.FieldByName('IDEMPRESA').AsFloat;
      cdsCCustoATSelecionados.Post;

      cdsCCustoATDisp.Delete;
    end;
  finally
    cdsCCustoATDisp.EnableControls;
    cdsCCustoATSelecionados.EnableControls;
  end;

  HabDesBotoesAT;
end;

procedure TfrmCadContratoMT.btnExcluirTodosATClick(Sender: TObject);
begin
  cdsCCustoATSelecionados.DisableControls;
  cdsCCustoATDisp.DisableControls;
  try
    cdsCCustoATSelecionados.First;
    while not(cdsCCustoATSelecionados.IsEmpty) do
    begin
      cdsCCustoATDisp.Append;
      cdsCCustoATDisp.FieldByName('CODCENTROCUSTO').AsString := cdsCCustoATSelecionados.FieldByName('CODCENTROCUSTO').AsString;
      cdsCCustoATDisp.FieldByName('NOME').AsString           := cdsCCustoATSelecionados.FieldByName('NOME').AsString;
      cdsCCustoATDisp.FieldByName('CODEXTERNO').AsString     := cdsCCustoATSelecionados.FieldByName('CODEXTERNO').AsString;
      cdsCCustoATDisp.FieldByName('IDCONTRATO').AsFloat      := cdsCCustoATSelecionados.FieldByName('IDCONTRATO').AsFloat;
      cdsCCustoATDisp.FieldByName('IDEMPRESA').AsFloat       := cdsCCustoATSelecionados.FieldByName('IDEMPRESA').AsFloat;
      cdsCCustoATDisp.Post;

      cdsCCustoATSelecionados.Delete;
    end;
  finally
    cdsCCustoATSelecionados.EnableControls;
    cdsCCustoATDisp.EnableControls;
  end;

  HabDesBotoesAT;
end;


procedure TfrmCadContratoMT.dbrgTipoValorBaseChange(Sender: TObject);
begin
  inherited;

  if dbrgTipoValorBase.ItemIndex = 0 then
  begin
    dbeValorTotal.Enabled := True;
    dbeValorTotal.Color := clWindow;

    if dbeValorTotal.CanFocus then
      dbeValorTotal.SetFocus;
  end
  //Leandro WO9228 - inicio
  //else if dbrgTipoValorBase.ItemIndex = 1 then
  //begin
  //  dbeValorTotal.Enabled := True;
  //  dbeValorTotal.Color := clWindow;
  //
  //  if (Cds.FieldByName('IDCONTRATO').asInteger) > 0 then
  //    dbeValorTotal.Value := CtrlContratos.ValorBaseContratoVariavel(Cds.FieldByName('IDCONTRATO').AsString); //Leandro WO9228
  //end
  //Leandro WO9228  fim
  else
  begin
    dbeValorTotal.Enabled := False;
    dbeValorTotal.Color := clSilver;
    dbeValorTotal.Value := 0;
  end;
end;

procedure TfrmCadContratoMT.HabDesBotoesNegociacao;
begin
  sbtnInsNegociacao.Enabled := CmeCadastro.Operacao in [opInserir, opAlterar];
  sbtnAltNegociacao.Enabled := (CmeCadastro.Operacao in [opInserir, opAlterar]) and not(CdsNegociacao.IsEmpty);
  sbtnExcluiNegociacao.Enabled := (CmeCadastro.Operacao in [opInserir, opAlterar]) and not(CdsNegociacao.IsEmpty);

  pnlControlesDet.SendToBack;
  Dock976.Visible := False;
end;

procedure TfrmCadContratoMT.sbtnInsNegociacaoClick(Sender: TObject);
begin
  inherited;

  if TButton(Sender).Name = 'sbtnInsNegociacao' then
  begin
    CdsNegociacao.Insert;
  end
  else
  if TButton(Sender).Name = 'sbtnAltNegociacao' then
  begin
    if not CdsNegociacao.IsEmpty then
      CdsNegociacao.Edit;
  end
  else
  if TButton(Sender).Name = 'sbtnExcluiNegociacao' then
  begin
    if not CdsNegociacao.IsEmpty then
      CdsNegociacao.Delete;

    sbtnExcluiNegociacao.Down := False;
    exit;
  end;

  dbgNegociacao.SendToBack;
  Dock976.Visible := True;
end;

procedure TfrmCadContratoMT.bbtnOkNegociacaoClick(Sender: TObject);
begin
  inherited;

  CdsNegociacao.FieldByName('NOME_RESP').AsString := cmpResponsavelNegociacao.Text;
  CdsNegociacao.FieldByName('DESC_TIPO').AsString := cbbTipo.Text;
  CdsNegociacao.FieldByName('DESC_NEGOCIACAO').AsString := cbbNegociacao.Text;

  if TButton(Sender).Name = 'bbtnOkNegociacao' then
  begin
    if not(VerificaCamposAbaNegociacao) then
      Exit;

    CdsNegociacao.Post;
  end
  else
  if TButton(Sender).Name = 'bbtnCancelarNegociacao' then
  begin
    if CdsNegociacao <> nil then
      CdsNegociacao.Cancel;
  end
  else
  if TButton(Sender).Name = 'bbtnVoltarNegociacao' then
  begin
    if (CdsNegociacao <> nil) and (CdsNegociacao.State in [dsEdit, dsInsert]) then
      CdsNegociacao.Cancel;
  end;

  pnlControlesDet.SendToBack;
  Dock976.Visible := False;

  sbtnInsNegociacao.Down := False;
  sbtnAltNegociacao.Down := False;

  HabDesBotoesNegociacao;
end;

function TfrmCadContratoMT.VerificaCamposAbaNegociacao: boolean;
begin
  Result := False;

  if (trim(cmpResponsavelNegociacao.Text) = '') then
  begin
    MsgDlg('Preencha o campo: ' + cmpResponsavelNegociacao.Caption, 'Aviso', mtWarning, [mbOk], 0);

    exit;
  end
  else
  if dbdtIniVigencia.Date = 0 then
  begin
    MsgDlg('Preencha o campo: ' + lblIniVigencia.Caption, 'Aviso', mtWarning, [mbOk], 0);

    if dbdtIniVigencia.CanFocus then
      dbdtIniVigencia.SetFocus;

    exit;
  end
  else
  if (trim(cbbTipo.Text) = '') or (cbbTipo.ItemIndex = -1) then
  begin
    MsgDlg('Preencha o campo: ' + lblTipo.Caption, 'Aviso', mtWarning, [mbOk], 0);

    if cbbTipo.CanFocus then
    begin
      cbbTipo.SetFocus;
      cbbTipo.DropDown;
    end;

    exit;
  end
  else
  if (trim(cbbNegociacao.Text) = '') or (cbbNegociacao.ItemIndex = -1) then
  begin
    MsgDlg('Preencha o campo: ' + lblNegociacao.Caption, 'Aviso', mtWarning, [mbOk], 0);

    if cbbNegociacao.CanFocus then
    begin
      cbbNegociacao.SetFocus;
      cbbNegociacao.DropDown;
    end;

    exit;
  end;

  Result := True;
end;

procedure TfrmCadContratoMT.edtEconomiaAnoEnter(Sender: TObject);
begin
  inherited;

  if ((trim(edtEconomiaAno.Text) = '') or (edtEconomiaAno.Text = '0')) and //Se o campo ainda não estiver preenchido
     ( ((trim(edtValorPrevistoAno.Text) <> '') and (edtValorPrevistoAno.Text <> '0,00')) and
       ((trim(edtValorAtualAno.Text) <> '') and (edtValorAtualAno.Text <> '0,00')) ) then
  begin
    edtEconomiaAno.Text := FloatToStr(edtValorPrevistoAno.Value - edtValorAtualAno.Value);
  end;
end;

procedure TfrmCadContratoMT.edtPercentualReducEnter(Sender: TObject);
begin
  inherited;

  if ((trim(edtPercentualReduc.Text) = '') or (edtPercentualReduc.Text = '0')) and //Se o campo ainda não estiver preenchido
     ( ((trim(edtEconomiaAno.Text) <> '') and (edtEconomiaAno.Text <> '0,00')) and
       ((trim(edtValorPrevistoAno.Text) <> '') and (edtValorPrevistoAno.Text <> '0,00')) ) then
  begin
    edtPercentualReduc.Text := FloatToStr((edtEconomiaAno.Value / edtValorPrevistoAno.Value) * 100);
  end;
end;

procedure TfrmCadContratoMT.chkFaseEncerramentoClick(Sender: TObject);
begin
  inherited;
  // WO10578 - Helen V Bianchi - Inicio
  if (Cds.State in [dsInsert,dsEdit]) then
  begin
    if chkFaseEncerramento.Checked then
    begin
      cds.FieldByName('FLGFASE_ENCERRAMENTO').AsString  := 'S';
      cds.FieldByName('RESPFASE_ENCERRAMENTO').AsString := Sistema.NomeUsuario;;
    end
    else
    begin
      cds.FieldByName('FLGFASE_ENCERRAMENTO').AsString  := 'N';
      cds.FieldByName('RESPFASE_ENCERRAMENTO').AsString := '';
    end;
  end;
  // WO10578 - Helen V Bianchi - fim
end;

procedure TfrmCadContratoMT.chkVigenciaClick(Sender: TObject);
begin
  inherited;
  // Inicio WO10498 Ferrari
  if (Cds.State in [dsInsert,dsEdit]) then
  begin
    if chkVigencia.Checked then
      cds.FieldByName('FLGVIGENCIAINDETERMINADA').AsString  := 'S'
    else
      cds.FieldByName('FLGVIGENCIAINDETERMINADA').AsString  := 'N';
  end;
  // Fim WO10498 Ferrari

end;

// Paulo Nobre - WO13506 - Inicio
procedure TfrmCadContratoMT.dbrgrpVlrOrcadoAprovadoClick(Sender: TObject);
begin
  inherited;
  pcVlrOA.ActivePageIndex := 0;

  if dbrgrpVlrOrcadoAprovado.ItemIndex < 2 then
  begin
    dbEdtValorOrcado.Enabled := True;
    dbEdtValorOrcado.Color := clWindow;
    dbJustNSA.Clear;
    Cds.FieldByName('JUSTIFOPCAONAOSEAPLICA').AsString := EmptyStr;     // Paulo Nobre - WO15750

    if dbEdtValorOrcado.CanFocus then
      dbEdtValorOrcado.SetFocus;
  end
  else
  begin
    dbEdtValorOrcado.Color := clSilver;
    dbEdtValorOrcado.Value := 0;
    dbEdtValorOrcado.Enabled := False;
    pcVlrOA.ActivePageIndex := 1;
  end;
end;
// Paulo Nobre - WO13506 - Fim

procedure TfrmCadContratoMT.chkServPontualClick(Sender: TObject);
begin
  inherited;
   // Paulo Nobre - WO20717 - Inicio
   if (Cds.State in [dsInsert,dsEdit]) then
   begin
      if chkServPontual.Checked then
         cds.FieldByName('FLGSERVICOPONTUAL').AsString  := 'S'
      else
         cds.FieldByName('FLGSERVICOPONTUAL').AsString  := 'N';
   end;
   // Paulo Nobre - WO20717 - Fim

end;

procedure TfrmCadContratoMT.chkServContinuadoClick(Sender: TObject);
begin
  inherited;
   // Paulo Nobre - WO20717 - Inicio
   if (Cds.State in [dsInsert,dsEdit]) then
   begin
      if chkServContinuado.Checked then
         cds.FieldByName('FLGSERVICOCONTINUADO').AsString  := 'S'
      else
         cds.FieldByName('FLGSERVICOCONTINUADO').AsString  := 'N';
   end;
   // Paulo Nobre - WO20717 - Fim
end;

end.

