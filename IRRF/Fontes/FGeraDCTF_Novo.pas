//******************************************************************************
// N. Chamado....: WO34233
// Dt Alteração..: 18/03/2026
// Responsável...: Paulo Nobre
// Descrição.....: PROJETO CNPJ ALFANUMÉRICO
//                 .(.DFM) - Ajustando o padrão da mascara atual do CNPJ para
//                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'. 
//******************************************************************************
//Rotina             : CarregaMovimentoDCTF        
//N. WO...........   : 2061
//Data da Alteração: : 18/08/2023
//Responsável:       : Paulo Nobre
//Descrição.......   : .Corrigindo o refresh após a geração da DCTF
//                     .Desabilitando o recurso implementado no SIG 136949 por não haver mais necessidade
//*****************************************************************************************************
//Rotina             : CarregaMovimentoDCTF
//N. SIG..........   : 136949
//Data da Alteração: : 26/06/2023
//Responsável:       : Marcos Lima
//Descrição.......   : Removendo os codigos 0588 e 0561 para vigencia superior a maio de 2023
//*****************************************************************************************************
//Rotina             : PRepresentanteValidaDados
//N. SIG..........   : 129054
//Data da Alteração: : 19/09/2022
//Responsável:       : Luis Ferrari
//Descrição.......   : Ajuste no pTipo para atualizar Representante e não alterar Responsavel.
//*****************************************************************************************************
//Rotina             : CarregaMovimentoDCTF / ExisteDCTFOriginalLancada / PermiteGerarDCTFRetificadora
//N. SIG..........   : SIG TIBERO
//Data da Alteração: : 06/05/2018
//Alteração Form:    : qryDCTFGeradas (.DFM)
//Responsável:       : Everson Luiz Pereira da Cunha
//Descrição.......   : Retirada do 'NLS_DATE_LANGUAGE = portuguese'
//*****************************************************************************************************
//Rotina             : spbGeraArquivoDCTFClick
//N. SIG..........   : 56456
//Data da Alteração: : 12/12/2017
//Alteração Form:    :
//Responsável:       : Andre Imakawa
//Descrição.......   : Verificar se o FLGMARCADO = 'S' para entrar na geração do DCTF.
//                     Remover o Filtro após a exportação.
//*****************************************************************************************************
//Rotina             : FormShow, qryDCTFGeradasAfterScroll, spbAtualizaOutDadosClick, chkPJInativaClick,
//                     chkSimplesNacClick, chkSuspClick, chkDebSCPClick, chkCPRBClick, CarregaMovimentoDCTF,
//
//N. SIG..........   : 48772
//Data da Alteração: : 28/07/2017
//Alteração Form:    : frmGeraDCTF_Novo
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Adequações na geração da DCTF que atendam a nova versão 3.4
//*****************************************************************************************************
//Rotina             : dbgDetDBDblClick, spbAtualizaValorClick, dbgDARFDblClick, spbAtualizaDadosInstClick
//N. SIG..........   : 49047
//Data da Alteração: : 23/06/2017
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição.......   : Acerto na rotinas atualização para inclusão de transação
//*****************************************************************************************************
//Rotina             : InserirDCTF_CR_DARF_O, InserirDetalheDARF_O, InserirDetalheDJE_O
//N. SIG..........   : 41744_43545
//Data da Alteração: : 05/04/2017
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição.......   : Rerirada de um parametro desnecessário das funções
//*****************************************************************************************************
//Rotina             : Gera DCTF
//N. SIG..........   : 30071
//Data da Alteração: : 14/10/2016
//Responsável:       : William Moreira da Silva
//Descrição          : Erro na importação do DCTF
//***************************************************************************************
//Rotina             : dbgDetDB
//N. SIG..........   : 26256
//Data da Alteração: : 08/08/2016
//Alteração Form:    : frmGeraDCTF_Novo novo campo: qryDCTFDetDebitosDATAAPURACAO
//Responsável:       : Darivaldo Alencar/Paulo Nobre
//Descrição          : Inclusão de campo DATAAPURACAO na grid
//*****************************************************************************************************
//Rotina                : qryDCTFDetCreditos
//N. Sol..........      : 262362
//N. PPM..........      : 1084801
//Data da Alteração:    : 18/09/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Os campos IDFORMAPEDIDO e NUMPERDCOMP foram inclusos na
//                        qryDCTFDetCreditos
//***************************************************************************************
//Rotina                : Exporta
//N. Sol..........      : 258183/17609
//N. PPM..........      : 1000747
//Data da Alteração:    : 20/08/2015
//Alteração Form:       :
//Responsável:          : Higor Nayde Ferreira
//Descrição.......      : Criação do campo OBS com maxima de 1000 caracteres

//***************************************************************************************
//Rotina                : Exporta
//N. Sol..........      : 252107
//N. PPM..........      : 780490
//Data da Alteração:    : 14/04/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Permitir que somente seja igualado o valor do DB = CR quando for
//                        a Natureza '7893' - IOF - SOBRE EMPRÉSTIMOS A PARTICIPANTES
//***************************************************************************************
//Rotina                : AjustaCamposGerarDCTF
//N. Sol..........      : 250991
//N. PPM..........      : 725121
//Data da Alteração:    : 17/03/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Na virada do exercicio, ajustando corretamente o mês e ano baseado
//                        na última DCTF gerada
//***************************************************************************************
//Rotina                : spbImportarDBsClick
//N. Sol..........      : 249454
//N. PPM..........      : 703267
//Data da Alteração:    : 26/02/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Retirando o nome do arquivo de forma fixa
//***************************************************************************************
//Rotina                : spbGeraArquivoDCTFClick
//N. Sol..........      : 246475
//N. PPM..........      : 636290
//Data da Alteração:    : 14/01/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertando os anos de referência e competência na geração do Arquivo
//***************************************************************************************
//Rotina            : Diversas funções
//N. SOL.........   : 235337_16319
//N. PPM.........   : 457199
//Data da Alteração : 15/07/2014
//Alteração Form    :
//Responsável       : Paulo Nobre
//Descrição         : 1.Adaptações na funcionalidade para atender legislação da RF sobre mudanças no layout
//                    da DCTF da versão 2.5 p/ a versão 3.1.
//                    2.Inclusão de novas combos na aba "Dados Iniciais"
//*******************************************************************************************************
//Rotina            : MontaSelect MSDARF, qryTotConcIndiv
//N. SOL.........   : 239704
//N. PPM.........   : 523138
//Data da Alteração : 19/09/2014
//Alteração Form    : FGeraDCTF_Novo
//Responsável       : Paulo Nobre
//Descrição         : MontaSelect MSDARF - Trocar o default da combo "Operador de Comparação" da data inicial
//                    e final de apuração de: "é igual a" para: "é maior ou igual que" e "é menor ou igual que"
//                    respectivamente as duas datas.
//*******************************************************************************************************
//Rotina            : spbLocalizarDetCRClick
//N. SOL.........   : 238778
//N. PPM.........   : 512818
//Data da Alteração : 04/09/2014
//Alteração Form    : FGeraDCTF_Novo
//Responsável       : Paulo Nobre
//Descrição         : No evento "spbLocalizarDetCRClick", a função "InserirDCTF_CR_DARF_Avulsa" passa a ser
//                    usada no lugar da "InserirDCTF_CR_DARF_O".
//*******************************************************************************************************
//Rotina             : spbAcertaProcessosClick
//N. Sol..........   : 232145
//N. Kintana......   : 385264
//Data da Alteração: : 13/05/2014
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : 1) Refeita toda a lógica da rotina para garantir a atualização dos Processos.
//                   : 2) Inclusão da função tiramascara para limpar os campos lidos.
//                     3) Inclusão do formprogresso e de um contador visual de processos atualizados.
//****************************************************************************************************
//Rotina             : qryTotConcIndiv
//N. Sol..........   : 230353
//N. Kintana......   : 352271
//Data da Alteração: : 14/04/2014
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acerto no SQL que apresenta os totais da Conciliação Individual para
//                     atender aos 3 de vez num SQL só. Com isso não há mais necessidades
//                     das outras duas querys individuais dos totais.
//******************************************************************************************
//N. Sol..........: 126088_1342
//N. Kintana......: 784469
//Data............: 25/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Novo gerador da DCTF
//******************************************************************************************
//
// Não existe um documento fisico chamado DJE, este será materializado dentro da tabela DARF
// com informações e identificador específicos.
//
// Modelo implementado com a condição de ON DELETE CASCADE na FK, ou seja, ao matar o registro
// PAI (Tabela DCTF), todas as tabelas (dependentes) serão apagadas pelo banco.
//
Unit FGeraDCTF_Novo;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, TREdit,
  uCmControlObject, uCmDbObject, uDataBase, uSistema, DbClient, uCMTypes,
  uCmClientDataSet, uCmSqlParams, wwdbedit, DBCtrls, uFuncoesUteisIR,
  CMProcuraSubTipo, MontaSelect, filectrl, wwdbdatetimepicker, ShellAPI,
  CMDateTimePicker, wwdblook, uCtrlGeraDCTF_Novo, QExport3Dialog,
  CMProcura, Wwdotdot, Wwdbcomb, Menus, TB97Ctls, jpeg, Wwintl, wwDialog,
  Wwlocate, ImgList, wwSpeedButton, wwDBNavigator, wwclearpanel;

Const CorDaColuna = $00FDD2D0;                    // Azul personalizado
Const CorDaZebra = clBtnFace;                     //$00C0FFFF;

Const MSG001 = 'Confirma exclusão completa desta DCTF ?'; //  <SIM> <NÃO>
Const MSG002 = 'DCTF não pode ser Excluída pois já foi enviada à RFB. Verifique !'; // <OK>
Const MSG003 = 'Confirma geração da DCTF ?';      //  <SIM> <NÃO>
Const MSG004 = 'Já existe uma DCTF gerada. Verifique !'; // <OK>
Const MSG005 = 'Inexiste DCTF Original enviada. Verifique !';
Const MSG006 = 'Número do Recibo está em branco !'; // <OK>
Const MSG007 = 'Número de Recibo já informado. Verifique !'; // <OK>
Const MSG008 = 'Confirma atualização da DCTF com os Dados do Envio ?'; // <SIM> <NÃO>
Const MSG009 = 'Não pode ser gerada DCTF para o Mês selecionado. Verifique !'; // <OK>
Const MSG010 = 'Confirma geração do arquivo de envio à RFB ?'; //  <SIM> <NÃO>
Const MSG011 = 'Arquivo de envio à RFB gerado com sucesso !'; //  <OK>
Const MSG012 = 'É obrigatório o nome do Representante da Fundação'; // <OK>
Const MSG013 = 'É obrigatório o nome do Responsável pelo preenchimento'; // <OK>
Const MSG014 = 'Existe DCTF Retificadora que não foi enviada. Verifique !'; // <OK>
Const MSG015 = 'Arquivo de envio à RFB não foi gerado. Verifique !'; // <OK>
Const MSG016 = 'Mês de Competência em Branco !';  // <OK>
  //Const MSG017 = 'Representante em Branco !'; // <OK>
  //Const MSG018 = 'Responsável em Branco !'; // <OK>
Const MSG019 = 'Problemas na geração do arquivo.'; // <OK>
Const MSG020 = 'Número do Recibo Inválido. Verifique !'; // <OK>
Const MSG021 = 'Problemas na geração da DCTF. Verifique !'; // <OK>
Const MSG022 = 'Novo Valor do Tributo não informado !'; // <OK>
Const MSG023 = 'É obrigatório preencher a Qualificação P. Jurídica'; // <OK>
Const MSG024 = 'É obrigatório preencher a Forma de Trib. do Lucro'; // <OK>
Const MSG025 = 'Não foi possível inserir a DARF localizada.'; // <OK>
Const MSG026 = 'Não foi possível inserir os Detalhamentos da DARF Localizada.'; // <OK>
Const MSG027 = 'Não foi possível inserir os Detalhamentos da DJE Localizada.'; // <OK>
Const MSG028 = 'Declaração já existente no Movimento. Verifique !'; // <OK>
Const MSG029 = 'É obrigatório preencher o CRC do Contador'; // <OK>
Const MSG030 = 'É obrigatório preencher a UF do CRC do Contador'; // <OK>
Const MSG031 = 'É obrigatório preencher o Critério de Reconhecimento das Variações...'; // <OK>
Const MSG032 = 'DCTF já enviada !';               // <OK>
Const MSG033 = 'Lançamento(s) importado(s) com Sucesso. Verifique !'; // <OK>
Const MSG034 = 'Lançamento gerado não pode ser Excluído. Verifique !'; // <OK>
Const MSG035 = 'Nome do arquivo deve ser DCTF_AJUSTA_DEBITOS.CSV e deve estar em C:\PLANUS\TEMP\DCTF\. Verifique !'; // <OK>
Const MSG036 = 'É obrigatório a definição do número de versão do leiaute DCTF.'; //<OK>

Type
  TfrmGeraDCTF_Novo = Class(TForm)
    qryDCTFDetCreditos: TwwQuery;
    dsDCTFDetCreditos: TwwDataSource;
    qryLkpUF: TwwQuery;
    qryLkpUFCODESTADO: TStringField;
    dsLkpUF: TwwDataSource;
    MSDCTF: TMontaSelect;
    dlgSalvarArquivoEnvio: TSaveDialog;
    dsDCTFGeradas: TwwDataSource;
    dsDCTFMovSintetico: TwwDataSource;
    qryDCTFDetDebitos: TwwQuery;
    dsDCTFDetDebitos: TwwDataSource;
    qryLkpGrupoTrib: TwwQuery;
    dsLkpGrupoTrib: TwwDataSource;
    qryLkpGrupoTribGRUPOTRIBUTO: TStringField;
    qryLkpGrupoTribDESCGRUPOTRIBUTO: TStringField;
    qryDCTFDetDebitosNOME: TStringField;
    qryDCTFDetDebitosVLRIRRF: TFloatField;
    qryDCTFDetDebitosMATRICULA: TStringField;
    qryDCTFDetDebitosIDDCTF: TFloatField;
    qryDCTFDetDebitosCODNATUREZA: TStringField;
    qryDCTFDetDebitosNUMDOCUMENTO: TStringField;
    qryAux: TwwQuery;
    qryDCTFDetDebitosIDPESSOA: TFloatField;
    MSDARF_TabNova: TMontaSelect;
    qryExercicios: TwwQuery;
    dsExercicios: TwwDataSource;
    qryExerciciosEXERCICIO: TStringField;
    qryDCTFDetDebitosFLGMARCADO: TStringField;
    Panel4: TPanel;
    spbLocalizaDCTF: TSpeedButton;
    spbExcDCTF: TSpeedButton;
    spbGeraArquivoDCTF: TSpeedButton;
    stArquivo: TStaticText;
    qryDCTFGeradas: TwwQuery;
    qryDCTFGeradasIDDCTF: TFloatField;
    qryDCTFGeradasEXERCICIODCTF: TStringField;
    qryDCTFGeradasMESDCTF: TStringField;
    qryDCTFGeradasDATAINICIOAPURACAO: TDateTimeField;
    qryDCTFGeradasDATAFIMAPURACAO: TDateTimeField;
    qryDCTFGeradasDSCMESDCTF: TStringField;
    qryDCTFGeradasTIPODCTF: TStringField;
    qryDCTFGeradasDSCTIPODCTF: TStringField;
    qryDCTFGeradasDATAENVIORFB: TDateTimeField;
    qryDCTFGeradasFLGARQUIVOGERADO: TStringField;
    qryDCTFGeradasFLGREGEXCLUIDO: TStringField;
    qryDCTFGeradasTRGDTINCLUSAO: TDateTimeField;
    qryDCTFMovSintetico: TwwQuery;
    qryDCTFMovSinteticoCODNATUREZA: TStringField;
    qryDCTFMovSinteticoDESCGRUPOTRIB: TStringField;
    qryDCTFMovSinteticoDSCPERIODICIDADE: TStringField;
    qryDCTFMovSinteticoVLRDEBITO: TFloatField;
    qryDCTFMovSinteticoVLRCREDITO: TFloatField;
    qryDCTFMovSinteticoVLRSALDO: TFloatField;
    qryDCTFMovSinteticoSITSALDO: TStringField;
    qryDCTFMovSinteticoIDDCTF: TFloatField;
    qryDCTFMovSinteticoGRUPOTRIBUTO: TStringField;
    qryDCTFMovSinteticoPERIODICIDADE: TStringField;
    qryDCTFMovSinteticoVARIACAO: TStringField;
    qryTotalDCTFDetCreditos: TwwQuery;
    qryTotalDCTFDetCreditosIDDCTF: TFloatField;
    qryTotalDCTFDetCreditosCODNATUREZA: TStringField;
    qeDCTFDetCR: TQExport3Dialog;
    qryFLGMarcadoDetDB: TQuery;
    qryDadosAdicionais: TwwQuery;
    dsDadosAdicionais: TwwDataSource;
    qryDadosAdicionaisIDDCTF: TFloatField;
    qryDadosAdicionaisIDREPRES: TFloatField;
    qryDadosAdicionaisCPFREPRES: TStringField;
    qryDadosAdicionaisNOMEREPRES: TStringField;
    qryDadosAdicionaisDDDREPRES: TStringField;
    qryDadosAdicionaisFONEREPRES: TStringField;
    qryDadosAdicionaisEMAILREPRES: TStringField;
    qryDadosAdicionaisIDRESP: TFloatField;
    qryDadosAdicionaisCPFRESP: TStringField;
    qryDadosAdicionaisNOMERESP: TStringField;
    qryDadosAdicionaisCRCRESP: TStringField;
    qryDadosAdicionaisUFCRCRESP: TStringField;
    qryDadosAdicionaisDDDRESP: TStringField;
    qryDadosAdicionaisFONERESP: TStringField;
    qryDadosAdicionaisEMAILRESP: TStringField;
    MSRepres: TMontaSelect;
    MSResp: TMontaSelect;
    qeDCTFDetDebitos: TQExport3Dialog;
    qryDadosAdicionaisIDFORMTRIBLUCRO: TFloatField;
    qryDadosAdicionaisIDQUALIFPJ: TFloatField;
    qryLkpTributos: TwwQuery;
    dsLkpTributos: TwwDataSource;
    qryLkpTributosCODNATUREZA: TStringField;
    qryDCTFDetDebitosIDDCTFDBDETALHE: TFloatField;
    qryDCTFDetDebitosTIPOMOV: TFloatField;
    qryDCTFDetDebitosDSCTIPOMOV: TStringField;
    dsTotalDCTFDetCreditos: TwwDataSource;
    qryDCTFDetCreditosFLGMARCADO: TStringField;
    qryDCTFDetCreditosIDDCTF: TFloatField;
    qryDCTFDetCreditosCODNATUREZA: TStringField;
    qryDCTFDetCreditosIDDARF: TFloatField;
    qryDCTFDetCreditosNUMDOCUMENTO: TStringField;
    qryDCTFDetCreditosREFERENCIA: TStringField;
    qryDCTFDetCreditosDATAINICIOAPURACAO: TDateTimeField;
    qryDCTFDetCreditosDATAFIMAPURACAO: TDateTimeField;
    qryDCTFDetCreditosDATAVENCDARF: TDateTimeField;
    qryDCTFDetCreditosVLRIRRF: TFloatField;
    qryDCTFDetCreditosIDDCTFCRDETALHE: TFloatField;
    qryDCTFDetCreditosVLRMULTA: TFloatField;
    qryDCTFDetCreditosVLRJUROS: TFloatField;
    qryDCTFDetCreditosVLRTOTAL: TFloatField;
    qryLkpTributosDESCRICAO: TStringField;
    qryTotalDCTFDetCreditosVLRTOTAL: TFloatField;
    qryTotalDCTFDetCRDARF: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    dsTotalDCTFDetCRDARF: TwwDataSource;
    qryTotalDCTFDetCRDJE: TwwQuery;
    FloatField3: TFloatField;
    StringField2: TStringField;
    FloatField4: TFloatField;
    dsTotalDCTFDetCRDJE: TwwDataSource;
    qryTotalDCTFDetCRDCOMP: TwwQuery;
    FloatField5: TFloatField;
    StringField3: TStringField;
    FloatField6: TFloatField;
    dsTotalDCTFDetCRDCOMP: TwwDataSource;
    qryDadosAdicionaisCNPJFUNDACAO: TStringField;
    qryDadosAdicionaisNOMEFUNDACAO: TStringField;
    qryDadosAdicionaisEMAILFUND: TStringField;
    qryDadosAdicionaisCODFUNDSPC: TStringField;
    qryDadosAdicionaisLOGRADFUND: TStringField;
    qryDadosAdicionaisNUMFUND: TStringField;
    qryDadosAdicionaisCOMPLFUND: TStringField;
    qryDadosAdicionaisBAIRROFUND: TStringField;
    qryDadosAdicionaisCEPFUND: TStringField;
    qryDadosAdicionaisMUNFUND: TStringField;
    qryDadosAdicionaisUFFUND: TStringField;
    qryDadosAdicionaisDDDFUND: TStringField;
    qryDadosAdicionaisTELFUND: TStringField;
    qryDadosAdicionaisDDDFAXFUND: TStringField;
    qryDadosAdicionaisFAXFUND: TStringField;
    qryDCTFDetCreditosCODNATURASSOCIADA: TStringField;
    qryDCTFGeradasNUMRECIBO: TStringField;
    qryDCTFGeradasNUMRECIBOANT: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Label5: TLabel;
    Image3: TImage;
    dbAnoExercicioFiltro: TwwDBLookupCombo;
    dbgDCTFGeradas: TwwDBGrid;
    dbgbtnDesfazrFiltroExerc: TwwIButton;
    Panel15: TPanel;
    Label4: TLabel;
    Image1: TImage;
    Label9: TLabel;
    Image4: TImage;
    Panel19: TPanel;
    dbLkpGrupoTrib: TwwDBLookupCombo;
    dbGridSintetico: TwwDBGrid;
    dbLkpTributos: TwwDBLookupCombo;
    pnlNova: TPanel;
    pcOutros: TPageControl;
    tbsGerarDCTF: TTabSheet;
    pnlIncDCTF: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    spbGerarDCTF: TSpeedButton;
    Label6: TLabel;
    Label10: TLabel;
    edAnoCalendario: TEdit;
    UpDown1: TUpDown;
    cbMesCompetencia: TComboBox;
    rgTipoDCTF: TRadioGroup;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    tbsDadosEnvio: TTabSheet;
    pnlAltDCTF: TPanel;
    Label24: TLabel;
    spbAtualizar: TSpeedButton;
    Label3: TLabel;
    meNumRec: TMaskEdit;
    dtDataEnvio: TCMDateTimePicker;
    dpHoraEnvio: TCMDateTimePicker;
    Panel6: TPanel;
    Panel8: TPanel;
    pcDemoAnalitico: TPageControl;
    tbsDetalhe: TTabSheet;
    dbgDetDB: TwwDBGrid;
    pnlOperDB: TPanel;
    spbMarcarDesmarcarDetDB: TSpeedButton;
    Label23: TLabel;
    spbAtualizaValor: TSpeedButton;
    spbExportaDetDB: TSpeedButton;
    edNovoValorTributo: TRealEdit;
    StaticText2: TStaticText;
    dbTotalDetDB: TDBRealEdit;
    meQtdDB: TStaticText;
    tbsTiposDocs: TTabSheet;
    dbgDARF: TwwDBGrid;
    pnlOperCR: TPanel;
    spbMarcarDesmarcarDetCR: TSpeedButton;
    spbExportaDetDARF: TSpeedButton;
    spbManutencaoDcomp: TSpeedButton;
    StaticText1: TStaticText;
    DBRealEdit1: TDBRealEdit;
    meQtdCR: TStaticText;
    tbsDadosInst: TTabSheet;
    pnlDadosInst: TPanel;
    spbAtualizaDadosInst: TSpeedButton;
    gbPessoaJuridica: TGroupBox;
    Label12: TLabel;
    Label17: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel20: TPanel;
    Label13: TLabel;
    Label11: TLabel;
    DBText3: TDBText;
    Label2: TLabel;
    Label16: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText8: TDBText;
    PRepresentante: TCMProcura;
    Panel21: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label32: TLabel;
    Label1: TLabel;
    Label36: TLabel;
    Label14: TLabel;
    DBText6: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    PResponsavel: TCMProcura;
    dbeCRC: TwwDBEdit;
    dbeUFCRC: TwwDBLookupCombo;
    tbsOutDados: TTabSheet;
    pnlOutDados: TPanel;
    spbAtualizaOutDados: TSpeedButton;
    Panel9: TPanel;
    GroupBox1: TGroupBox;
    Panel10: TPanel;
    Label27: TLabel;
    Panel11: TPanel;
    Label29: TLabel;
    Panel12: TPanel;
    Label31: TLabel;
    Panel13: TPanel;
    Label33: TLabel;
    Panel14: TPanel;
    Label34: TLabel;
    DBRealEdit6: TDBRealEdit;
    Panel16: TPanel;
    lblSit: TLabel;
    Image2: TImage;
    DBEdit1: TDBEdit;
    DBRealEdit8: TDBRealEdit;
    Panel17: TPanel;
    Label28: TLabel;
    DBRealEdit9: TDBRealEdit;
    DBRealEdit10: TDBRealEdit;
    DBRealEdit11: TDBRealEdit;
    DBRealEdit13: TDBRealEdit;
    Panel18: TPanel;
    Panel7: TPanel;
    qryDCTFDetCreditosTIPODOCTO: TStringField;
    tbsConcilia: TTabSheet;
    dbgConcil: TwwDBGrid;
    qryDCTFConciliaIndivCPF: TwwQuery;
    dsDCTFConciliaIndivCPF: TwwDataSource;
    qryDCTFConciliaIndivCPFIDDCTF: TFloatField;
    qryDCTFConciliaIndivCPFCODNATUREZA: TStringField;
    qryDCTFConciliaIndivCPFNUMDOCUMENTO: TStringField;
    qryDCTFConciliaIndivCPFNOME: TStringField;
    qryDCTFConciliaIndivCPFVALORDB: TFloatField;
    qryDCTFConciliaIndivCPFVALORCR: TFloatField;
    qryDCTFConciliaIndivCPFVLRDIF: TFloatField;
    Panel22: TPanel;
    SpeedButton4: TSpeedButton;
    qeDCTFConciliaIndivCPF: TQExport3Dialog;
    meQtdConc: TStaticText;
    StaticText3: TStaticText;
    DBRealEdit2: TDBRealEdit;
    DBRealEdit3: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    qryTotConcIndiv: TwwQuery;
    dsTotConcIndiv: TwwDataSource;
    qryTotConcIndivIDDCTF: TFloatField;
    qryTotConcIndivCODNATUREZA: TStringField;
    qryDCTFDetDebitosCODNATURASSOCIADA: TStringField;
    MSPERDCOMP: TMontaSelect;
    spbManutencaoDJE: TSpeedButton;
    qryDCTFDetCreditosTRGDTINCLUSAO: TDateTimeField;
    qryDCTFGeradasNUMVERSAOSOFT: TStringField;
    qryDCTFGeradasNUMVERSAOLAYOUT: TStringField;
    spbLocalizarDetCR: TSpeedButton;
    qryDCTFDetCreditosNUMPERDCOMP: TStringField;
    qryDCTFDetCreditosIDFORMAPEDIDO: TStringField;
    qryDadosAdicionaisIDCRITRECON: TFloatField;
    DBNavigator3: TDBNavigator;
    qryDCTFDetDebitosCODPROVDESC: TStringField;
    qryDCTFDetDebitosIDRUBRICA: TFloatField;
    qryDCTFDetDebitosIDCONTRATOEMPTMO: TFloatField;
    qryDCTFDetDebitosCODALTERADOR: TFloatField;
    qryDCTFDetDebitosIDHSTFOLHABENEF: TFloatField;
    spbAcertaProcessos: TSpeedButton;
    qryAux2: TwwQuery;
    qryDCTFMovSinteticoFLGDEPOSITOJUDIC: TStringField;
    SpeedButton2: TSpeedButton;
    qeDCTFMovSint: TQExport3Dialog;
    SpeedButton3: TSpeedButton;
    spbImportarDBs: TSpeedButton;
    dlgAbreArquivo: TOpenDialog;
    spbExcluirDBsImportados: TSpeedButton;
    DBNavigator4: TDBNavigator;
    Panel23: TPanel;
    qryTotConcIndivVALORDB: TFloatField;
    qryTotConcIndivVALORCR: TFloatField;
    qryTotConcIndivVLRDIF: TFloatField;
    Label18: TLabel;
    QExport3Dialog1: TQExport3Dialog;
    rgQualJuridica: TLabel;
    rgFormaLucro: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cbQualificacao: TComboBox;
    cbLucro: TComboBox;
    cbCritRecon: TComboBox;
    cbRegimeApur: TComboBox;
    cbSituacaoPJ: TComboBox;
    cbOpcoesLEI: TComboBox;
    qryDadosAdicionaisIDREGIMEAPUR: TFloatField;
    qryDadosAdicionaisIDSITUACAOPJ: TFloatField;
    qryDadosAdicionaisIDOPCAOLEI: TFloatField;
    spbManutencaoDARF: TSpeedButton;
    Panel29: TPanel;
    Image5: TImage;
    stAviso: TStaticText;
    meAvisoDARFAusente: TMemo;
    TabSheet1: TTabSheet;
    spbAtuObsDCTF: TSpeedButton;
    meObsDCTF: TMemo;
    Panel24: TPanel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    wwDBNavigator4: TwwDBNavigator;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    wwNavButton10: TwwNavButton;
    imgTitulosGrids: TImageList;
    LocalizaLancDB: TwwLocateDialog;
    wwIntl_Port: TwwIntl;
    wwDBNavigator1: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    wwNavButton5: TwwNavButton;
    LocalizaLancCR: TwwLocateDialog;
    btnLimpar: TSpeedButton;
    qryDCTFGeradasOBS: TMemoField;
    qryDCTFDetCreditosPROCESSO: TStringField;
    qryDCTFDetDebitosDATAAPURACAO: TDateTimeField;
    MSDARF: TMontaSelect;
    Label22: TLabel;
    chkSusp: TCheckBox;
    chkDebSCP: TCheckBox;
    chkSimplesNac: TCheckBox;
    chkCPRB: TCheckBox;
    chkPJInativa: TCheckBox;
    qryDadosAdicionaisVERSAO: TFloatField;
    qryDadosAdicionaisFLGBALANSUSP: TStringField;
    qryDadosAdicionaisFLGDEBSCP: TStringField;
    qryDadosAdicionaisOPTSIMPLES: TStringField;
    qryDadosAdicionaisOPTCPRB: TStringField;
    qryDadosAdicionaisFLGINATIVA: TStringField;
    edtVersaoLeiaute: TRealEdit;
    Procedure bbtnSairClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure spbLocalizaDCTFClick(Sender: TObject);
    Procedure qryDCTFGeradasAfterScroll(DataSet: TDataSet);
    Procedure spbMarcarDesmarcarDetCRClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure spbGeraArquivoDCTFClick(Sender: TObject);
    Procedure spbExcDCTFClick(Sender: TObject);
    Procedure spbGerarDCTFClick(Sender: TObject);
    Procedure dbGridSinteticoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbDetalharDJEClick(Sender: TObject);
    Procedure dbgbtnDesfazrFiltroExercClick(Sender: TObject);
    Procedure pcOutrosChange(Sender: TObject);
    Procedure spbAtualizarClick(Sender: TObject);
    Procedure cbMesCompetenciaChange(Sender: TObject);
    Procedure spbMarcarDesmarcarDetDBClick(Sender: TObject);
    Procedure dbLkpGrupoTribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure dbgDARFDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure pcDemoAnaliticoChange(Sender: TObject);
    Procedure dbgDetDBDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure qryDCTFDetDebitosAfterScroll(DataSet: TDataSet);
    Procedure spbManutencaoDARFClick(Sender: TObject);
    Procedure spbLocalizarDetCRClick(Sender: TObject);
    Procedure spbExportaDetDARFClick(Sender: TObject);
    Procedure dbgDARFDblClick(Sender: TObject);
    Procedure dbgDetDBDblClick(Sender: TObject);
    Procedure UpDown1ChangingEx(Sender: TObject; Var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
    Procedure PRepresentanteValidaDados(Sender: TObject);
    Procedure PResponsavelValidaDados(Sender: TObject);
    Procedure spbAtualizaDadosInstClick(Sender: TObject);
    Procedure spbAtualizaValorClick(Sender: TObject);
    Procedure dbAnoExercicioFiltroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure spbExportaDetDBClick(Sender: TObject);
    Procedure dbLkpTributosCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure spbAtualizaOutDadosClick(Sender: TObject);
    Procedure spbManutencaoDcompClick(Sender: TObject);
    Procedure qryDCTFDetCreditosAfterScroll(DataSet: TDataSet);
    Procedure dbgConcilDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure SpeedButton4Click(Sender: TObject);
    Procedure qryDCTFConciliaIndivCPFAfterScroll(DataSet: TDataSet);
    Procedure spbManutencaoDJEClick(Sender: TObject);
    Procedure bbtnAjudaClick(Sender: TObject);
    Procedure FiltraFolhaEmpregados1Click(Sender: TObject);
    Procedure DesfazFiltragens1Click(Sender: TObject);
    Procedure FiltraFolhaBeneficirios1Click(Sender: TObject);
    Procedure spbAcertaProcessosClick(Sender: TObject);
    Procedure SpeedButton2Click(Sender: TObject);
    Procedure SpeedButton3Click(Sender: TObject);
    Procedure spbImportarDBsClick(Sender: TObject);
    Procedure spbExcluirDBsImportadosClick(Sender: TObject);
    Procedure qryDCTFMovSinteticoAfterScroll(DataSet: TDataSet);
    Procedure cbSituacaoPJChange(Sender: TObject);
    Procedure dbgConcilRowChanged(Sender: TObject);
    Procedure spbAtuObsDCTFClick(Sender: TObject);
    Procedure btnLimparClick(Sender: TObject);
    Procedure FormKeyDown(Sender: TObject; Var Key: Word;
      Shift: TShiftState);
    Procedure chkPJInativaClick(Sender: TObject);
    Procedure chkSimplesNacClick(Sender: TObject);
    Procedure chkSuspClick(Sender: TObject);
    Procedure chkDebSCPClick(Sender: TObject);
    Procedure chkCPRBClick(Sender: TObject);      //Higor Nayde SOL 258183/17609 pmm 1000747
  Private
    { Private declarations }
    iFlgSusp: integer;
    iFlgDebSCP: integer;
    iFlgInativa: integer;
    iOptSimples: integer;
    iOptCPRB: integer;
    iVersao: integer;

    Procedure CarregaMovimentoDCTF(pIdDCTF: Double; pAno: String);
    Procedure AjustaCamposGerarDCTF(pTipo: String);
    Procedure AjustaDatasApuracao(pAnoCalendario: String; pMesCompetencia: Integer);
    Procedure GerarDCTFMensal(pTipo: String);
    Procedure AtualizaDadosRespRepres(pTipo, pIdPessoa: String);
    Procedure AjustaLANCIRRF_Sem_DARF;

    Function ExisteDCTFOriginalLancada(sTipo: String; Var sAno, sDescMes, sDescTipo, sNumRec: String): Boolean;
    Function PermiteGerarDCTFRetificadora(Var sAno, sDescMes, sDescTipo, sNumRec: String): Boolean;
    Function ValidaVigenciaMaio2023(pMes: Integer; pAno: String): Boolean;
  Protected
  Public
    { Public declarations }
    oDCTF: TCtrlGeraDCTF_Novo;
  End;

Var
  frmGeraDCTF_Novo: TfrmGeraDCTF_Novo;
  iAno, iMes, iDia: Word;
  sAno, sDescMes, sDescTipo, sNumRec: String;
  Messageinfo: String;
  sPathArquivosLog: String;

Implementation

Uses DBaseDados, uCtrlFuncoesRH, UMensErro, fAguarde, FCadDCTF_DARF, FCadDCTF_DJE, FCadDCTF_DCOMP, FProgresso;

{$R *.DFM}

Procedure TfrmGeraDCTF_Novo.FormCreate(Sender: TObject);
Begin
  oDCTF := TCtrlGeraDCTF_Novo.Create;
  oDCTF.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

  // Paulo Nobre - SIG 41744_43545 - Inicio
  sPathArquivosLog := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\DCTF';
  If Not DirectoryExists(sPathArquivosLog) Then
    ForceDirectories(sPathArquivosLog);
  // Paulo Nobre - SIG 41744_43545 - Fim
End;

Procedure TfrmGeraDCTF_Novo.qryDCTFGeradasAfterScroll(DataSet: TDataSet);
Begin
  spbGeraArquivoDCTF.enabled := (Not qryDCTFGeradas.isEmpty);
  spbExcDCTF.enabled := ((Not qryDCTFGeradas.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  spbGeraArquivoDCTF.enabled := ((Not qryDCTFGeradas.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  pnlDadosInst.enabled := ((Not qryDCTFGeradas.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  pnlOutDados.enabled := ((Not qryDCTFGeradas.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));

  spbMarcarDesmarcarDetDB.enabled := ((Not qryDCTFDetDebitos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  edNovoValorTributo.enabled := ((Not qryDCTFDetDebitos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  spbAtualizaValor.enabled := ((Not qryDCTFDetDebitos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));

  spbMarcarDesmarcarDetCR.enabled := ((Not qryDCTFDetCreditos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  cbQualificacao.itemindex := qryDadosAdicionais.fieldbyname('IDQUALIFPJ').asInteger;
  cbLucro.itemindex := qryDadosAdicionais.fieldbyname('IDFORMTRIBLUCRO').asInteger;
  cbCritRecon.itemindex := qryDadosAdicionais.fieldbyname('IDCRITRECON').asInteger;

  // SOL 235337/16319 PPM 457199 - Paulo Nobre
  cbRegimeApur.itemindex := qryDadosAdicionais.fieldbyname('IDREGIMEAPUR').asInteger;
  cbSituacaoPJ.itemindex := qryDadosAdicionais.fieldbyname('IDSITUACAOPJ').asInteger;
  cbOpcoesLEI.itemindex := qryDadosAdicionais.fieldbyname('IDOPCAOLEI').asInteger;

  //SIG 48772 - Início
  //Tratamento feito para os novos campos em Dados Adicionais, qunaod não houver número de versão definida.
  If qryDadosAdicionais.FieldByName('VERSAO').AsInteger = 0 Then
  Begin
    chkCPRB.Checked := false;
    chkDebSCP.Checked := false;
    chkPJInativa.Checked := false;
    chkSimplesNac.Checked := false;
    chkSusp.Checked := false;
  End
  Else
  Begin
    chkCPRB.Checked := (qryDadosAdicionais.FieldByName('OPTCPRB').AsInteger = 1);
    chkDebSCP.Checked := (qryDadosAdicionais.FieldByName('FLGDEBSCP').AsInteger = 1);
    chkPJInativa.Checked := (qryDadosAdicionais.FieldByName('FLGINATIVA').AsInteger = 1);
    chkSimplesNac.Checked := (qryDadosAdicionais.FieldByName('OPTSIMPLES').AsInteger = 1);
    chkSusp.Checked := (qryDadosAdicionais.FieldByName('FLGBALANSUSP').AsInteger = 1);
  End;

  edtVersaoLeiaute.Text := FormatFloat('0.00', qryDadosAdicionais.FieldByName('VERSAO').AsInteger / 100);
  //SIG 48772 - Fim

  meObsDCTF.text := qryDCTFGeradas.fieldByname('OBS').asString;
End;

Procedure TfrmGeraDCTF_Novo.FormShow(Sender: TObject);
Begin
  stArquivo.visible := False;
  pcDemoAnalitico.ActivePageIndex := 0;
  pcOutros.ActivePageIndex := 0;

  Cursor := crSQLWait;
  qryLkpUF.Close;
  qryLkpUF.Open;
  qryLkpGrupoTrib.Close;
  qryLkpGrupoTrib.Open;
  qryLkpTributos.Close;
  qryLkpTributos.Open;
  Cursor := crDefault;

  CarregaMovimentoDCTF(-1, dbAnoExercicioFiltro.Text);
  //SIG 48772 - Início
  //Tratamento para definição da versão atual da DCTF no título da funcionalidade
  If oDCTF.sNumVersaoSoft = '' Then
    caption := caption + ' - ' + StringReplace(FloatToStr(StrToFloat(oDCTF.GetVersaoLayoutDCTF) / 100), ',', '.', [rfReplaceAll])
  Else
    caption := caption + ' - ' + oDCTF.sNumVersaoSoft;
  //SIG 48772 - Fim

  dbAnoExercicioFiltro.setfocus;
End;

Procedure TfrmGeraDCTF_Novo.bbtnSairClick(Sender: TObject);
Begin
  FreeAndNil(oDCTF);
  Close;
End;

Procedure TfrmGeraDCTF_Novo.spbLocalizaDCTFClick(Sender: TObject);
Begin
  MSDCTF.Executar;
  MSDCTF.Caption := 'Selecione DCTF´s geradas';
  If (MSDCTF.RetornouValor) Then
    CarregaMovimentoDCTF(strtofloat(MSDCTF.ValoresChave[0]), '');
End;

Procedure TfrmGeraDCTF_Novo.spbMarcarDesmarcarDetCRClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  If (Not qryDCTFDetCreditos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull) Then
  Begin
    Cursor := crSQLWait;
    Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

      If trim(qryDCTFDetCreditos.fieldbyname('TIPODOCTO').AsString) <> 'DCOMP' Then
      Begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE DCTF_CREDITODETALHE_DARF ');
        qryAux.SQL.Add('SET FLGMARCADO =:pFLGMARCADO    ');
        qryAux.SQL.Add('WHERE IDDCTF =:pIDDCTF          ');
        qryAux.SQL.Add('      AND IDDCTFCRDETALHE_DARF =:pIDDCTFCRDETALHE ');
      End;

      If trim(qryDCTFDetCreditos.fieldbyname('TIPODOCTO').AsString) = 'DCOMP' Then
      Begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE DCTF_CREDITODETALHE_DCOMP ');
        qryAux.SQL.Add('SET FLGMARCADO =:pFLGMARCADO     ');
        qryAux.SQL.Add('WHERE IDDCTF =:pIDDCTF           ');
        qryAux.SQL.Add('      AND IDDCTFCRDETALHE_DCOMP =:pIDDCTFCRDETALHE ');
      End;

      qryDCTFDetCreditos.DisableControls;
      qryDCTFDetCreditos.First;
      While Not qryDCTFDetCreditos.Eof Do
      Begin
        If qryDCTFDetCreditos.FieldByName('FLGMARCADO').AsString = 'S' Then
          qryAux.parambyname('pFLGMARCADO').AsString := 'N'
        Else
          qryAux.parambyname('pFLGMARCADO').AsString := 'S';
        qryAux.parambyname('pIDDCTF').AsInteger := qryDCTFDetCreditos.FieldByName('IDDCTF').AsInteger;
        qryAux.parambyname('pIDDCTFCRDETALHE').AsInteger := qryDCTFDetCreditos.FieldByName('IDDCTFCRDETALHE').AsInteger;
        qryAux.ExecSQL;

        qryDCTFDetCreditos.Next;
      End;
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;
    Except
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;

    RegAtual := qryDCTFMovSintetico.GetBookmark;  // Salvando o ponteiro do Registro

    qryDCTFDetCreditos.Close;
    qryDCTFDetCreditos.Open;
    qryTotalDCTFDetCreditos.Close;
    qryTotalDCTFDetCreditos.Open;
    qryDCTFMovSintetico.Close;
    qryDCTFMovSintetico.Open;

    If RegAtual <> Nil Then
      qryDCTFMovSintetico.GotoBookmark(RegAtual); // Voltando ao Reg. atual

    Cursor := crDefault;
    qryDCTFDetCreditos.EnableControls;
  End;
End;

Procedure TfrmGeraDCTF_Novo.spbExcDCTFClick(Sender: TObject);
Begin
  If Application.MessageBox(MSG001, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
  Begin
    // Só exclui se tiver sem Recibo
    If (qryDCTFGeradas.fieldByname('NUMRECIBO').isnull) Then
    Begin
      Screen.Cursor := crSQLWait;
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

      qryDCTFGeradas.DisableControls;
      qryDCTFMovSintetico.DisableControls;
      qryDCTFDetDebitos.DisableControls;
      qryDCTFDetCreditos.DisableControls;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.add('DELETE FROM DCTF   ');
      qryAux.SQL.add('WHERE IDDCTF = ' + qryDCTFGeradas.fieldByname('IDDCTF').asString);
      qryAux.ExecSQL;

      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;

      CarregaMovimentoDCTF(-1, dbAnoExercicioFiltro.Text);

      Screen.Cursor := crDefault;
      qryDCTFGeradas.EnableControls;
      qryDCTFMovSintetico.EnableControls;
      qryDCTFDetDebitos.EnableControls;
      qryDCTFDetCreditos.EnableControls;
    End
    Else
      Application.MessageBox(MSG002, 'Atenção !', Mb_IconExclamation);
  End;
End;

Procedure TfrmGeraDCTF_Novo.spbGerarDCTFClick(Sender: TObject);
Begin
  If cbMesCompetencia.Text = EmptyStr Then
  Begin
    Application.MessageBox(MSG016, 'Atenção', Mb_IconExclamation);
    cbMesCompetencia.ItemIndex := 0;              // default janeiro
    cbMesCompetencia.Setfocus;
    Exit;
  End;

  If Not qryDCTFGeradas.isEmpty Then
  Begin
    If strtoint(edAnoCalendario.Text) > qryDCTFGeradas.fieldByname('EXERCICIODCTF').asInteger Then
      If cbMesCompetencia.itemindex > qryDCTFGeradas.fieldByname('MESDCTF').asInteger Then
      Begin
        Application.MessageBox(MSG009, 'Atenção !', Mb_IconExclamation);
        AjustaCamposGerarDCTF(qryDCTFGeradas.fieldbyname('TIPODCTF').AsString);
      End;
  End;

  If Application.MessageBox(MSG003, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
  Begin
    If rgTipoDCTF.itemindex = 0 Then              // Original
    Begin
      If Not ExisteDCTFOriginalLancada('O', sAno, sDescMes, sDescTipo, sNumRec) Then // Original
      Begin

        frmAguarde.pbAguarde.Visible := false;
        frmAguarde.Mostra('Ajustando Lanctos. s/ DARF...');
        AjustaLANCIRRF_Sem_DARF;

        frmAguarde.Mostra('Gerando Movimento da DCTF...');
        GerarDCTFMensal('O');                     // Original

        frmAguarde.pbAguarde.Visible := True;
        frmAguarde.Apaga;

        AjustaCamposGerarDCTF(qryDCTFGeradas.fieldbyname('TIPODCTF').AsString);
      End
      Else
      Begin
        Application.MessageBox(pchar(MSG004 + #13 + #13 +
          'Ano     : ' + sAno + #13 +
          'Mês     : ' + sDescMes + #13 +
          'Tipo    : ' + sDescTipo + #13 +
          'Recibo  : ' + sNumRec), 'Atenção !', Mb_IconExclamation);
      End;
    End
    Else                                          // Retificadora
    Begin
      If ExisteDCTFOriginalLancada('R', sAno, sDescMes, sDescTipo, sNumRec) Then
      Begin
        If PermiteGerarDCTFRetificadora(sAno, sDescMes, sDescTipo, sNumRec) Then
        Begin
          frmAguarde.pbAguarde.Visible := false;
          frmAguarde.Mostra('Gerando Movimento da DCTF...');

          GerarDCTFMensal('R');                   // Retificadora

          frmAguarde.pbAguarde.Visible := True;
          frmAguarde.Apaga;

          AjustaCamposGerarDCTF(qryDCTFGeradas.fieldbyname('TIPODCTF').AsString);
        End
        Else
        Begin
          Application.MessageBox(pchar(MSG014 + #13 + #13 +
            'Ano     : ' + sAno + #13 +
            'Mês     : ' + sDescMes + #13 +
            'Tipo    : ' + sDescTipo + #13 +
            'Recibo  : ' + sNumRec), 'Atenção !', Mb_IconExclamation);
        End;
      End
      Else
      Begin
        Application.MessageBox(pchar(MSG005 + #13 + #13 +
          'Ano     : ' + edAnoCalendario.text + #13 +
          'Mês     : ' + cbMesCompetencia.text), 'Atenção !', Mb_IconExclamation);
      End;
    End;

    dbGridSintetico.SetFocus;
  End;
End;

Procedure TfrmGeraDCTF_Novo.dbGridSinteticoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDCTFMovSintetico.isEmpty Then
  Begin
    If (Field.Name = 'qryDCTFMovSinteticoCODNATUREZA') Or
      (Field.Name = 'qryDCTFMovSinteticoVLRDEBITO') Or
      (Field.Name = 'qryDCTFMovSinteticoVLRCREDITO') Or
      (Field.Name = 'qryDCTFMovSinteticoVLRSALDO') Then
      dbGridSintetico.Canvas.Font.Style := [fsbold];

    If (Field.Name = 'qryDCTFMovSinteticoSITSALDO') Then
    Begin
      If qryDCTFMovSintetico.FieldByName('SITSALDO').asString = 'A Pagar' Then
        dbGridSintetico.Canvas.Font.Color := clRed;
    End;

    If (qryDCTFMovSintetico.fieldByname('CODNATUREZA').asString = qryDCTFDetDebitos.fieldByname('CODNATUREZA').asString) Or
      (qryDCTFMovSintetico.fieldByname('CODNATUREZA').asString = qryDCTFDetCreditos.fieldByname('CODNATUREZA').asString) Then
    Begin
      If pcDemoAnalitico.ActivePageIndex = 0 Then // Débitos
      Begin
        If (Field.Name = 'qryDCTFMovSinteticoVLRDEBITO') Then
        Begin
          dbGridSintetico.Canvas.Font.Color := clNavy;
          dbGridSintetico.Canvas.Brush.Color := CorDaColuna;
        End;
      End;

      If pcDemoAnalitico.ActivePageIndex = 1 Then // Créditos
      Begin
        If (Field.Name = 'qryDCTFMovSinteticoVLRCREDITO') Then
        Begin
          dbGridSintetico.Canvas.Font.Color := clNavy;
          dbGridSintetico.Canvas.Brush.Color := CorDaColuna;
        End;
      End;
    End;

    dbGridSintetico.DefaultDrawDataCell(Rect, Field, State);
  End;
End;

Procedure TfrmGeraDCTF_Novo.spbGeraArquivoDCTFClick(Sender: TObject);
Var sNomeArquivo, sNomeArquivoCompleto, sCompetencia, sPathArquivo, sNumVersao: String;
Begin
  If PRepresentante.Text = EmptyStr Then
  Begin
    MsgDlg(MSG012, 'Atenção', mtInformation, [mbOk], 0);
    pcDemoAnalitico.ActivePage := tbsDadosInst;
    PRepresentante.SetFocus;
    Exit;
  End;

  If PResponsavel.Text = EmptyStr Then
  Begin
    MsgDlg(MSG013, 'Atenção', mtInformation, [mbOk], 0);
    pcDemoAnalitico.ActivePage := tbsDadosInst;
    PResponsavel.SetFocus;
    Exit;
  End;

  If (cbQualificacao.Text = EmptyStr) Then
  Begin
    MsgDlg(MSG023, 'Atenção', mtInformation, [mbOk], 0);
    pcDemoAnalitico.ActivePage := tbsOutDados;
    cbQualificacao.SetFocus;
    Exit;
  End;

  If (cbLucro.Text = EmptyStr) Then
  Begin
    MsgDlg(MSG024, 'Atenção', mtInformation, [mbOk], 0);
    pcDemoAnalitico.ActivePage := tbsOutDados;
    cbLucro.SetFocus;
    Exit;
  End;

  If (cbCritRecon.Text = EmptyStr) Then
  Begin
    MsgDlg(MSG031, 'Atenção', mtInformation, [mbOk], 0);
    pcDemoAnalitico.ActivePage := tbsOutDados;
    cbCritRecon.SetFocus;
    Exit;
  End;

  If Application.MessageBox(MSG010, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
  Begin
    //SIG 48772 - Início
    If qryDCTFGeradas.FieldByName('NUMVERSAOSOFT').asString = EmptyStr Then
      sNumVersao := qryDadosAdicionais.FieldByName('VERSAO').asString
    Else
      sNumVersao := qryDCTFGeradas.FieldByName('NUMVERSAOSOFT').asString;
    //SIG 48772 - Fim

    // SOL 246475  PPM 636290 - Paulo Nobre
    sCompetencia := qryDCTFGeradas.fieldByname('EXERCICIODCTF').asString + qryDCTFGeradas.fieldByname('MESDCTF').asString;
    sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\DCTF\';
    sNomeArquivo := trim(qryDadosAdicionais.FieldbyName('CNPJFUNDACAO').asString) + '-DCTFM' + oDCTF.tiramascara(sNumVersao) + '-' + sCompetencia +
      FU.IFF(qryDCTFGeradas.fieldByname('TIPODCTF').asString = 'O', '-ORIG', '-RETIF') + '.DEC';
    sNomeArquivoCompleto := sPathArquivo + sNomeArquivo;

    If Not DirectoryExists(sPathArquivo) Then
      ForceDirectories(sPathArquivo);

    dlgSalvarArquivoEnvio.InitialDir := sPathArquivo;
    dlgSalvarArquivoEnvio.FileName := sNomeArquivo;
    If dlgSalvarArquivoEnvio.Execute Then
    Begin
      stArquivo.visible := True;
      stArquivo.caption := sNomeArquivoCompleto;
      Screen.Cursor := crSQLWait;

      // SOL 252107 PPM 780490 - Paulo Nobre
      Try
        If Not oDCTF.Exporta(
          sNomeArquivoCompleto,
          qryDCTFGeradas,
          qryDCTFMovSintetico,
          qryDCTFDetDebitos,
          qryDCTFDetCreditos,
          qryDadosAdicionais) Then
        Begin
          Application.MessageBox(MSG019, 'Atenção !', MB_ICONINFORMATION + MB_OK);
          Exit;
        End
        Else
        Begin
          Application.MessageBox(MSG011, 'Atenção !', MB_ICONINFORMATION + MB_OK);

          qryDCTFGeradas.DisableControls;

          If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.add('UPDATE DCTF SET          ');
          qryAux.SQL.add('FLGARQUIVOGERADO = ''S'' ');
          qryAux.SQL.add('WHERE IDDCTF = ' + qryDCTFGeradas.fieldByname('IDDCTF').asString);
          qryAux.ExecSQL;

          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;

          qryDCTFGeradas.Close;
          qryDCTFGeradas.Open;

          Screen.Cursor := crDefault;
          qryDCTFGeradas.EnableControls;

          // Andre Imakawa - SIG 56456 - Inicio
          qryDCTFDetDebitos.Filtered := False;
          qryDCTFDetDebitos.Filter := '';

          qryDCTFDetCreditos.Filtered := False;
          qryDCTFDetCreditos.Filter := '';
          // Andre Imakawa - SIG 56456 - Fim

        End;
      Except
        Raise;
      End;
    End;
  End;
End;

Procedure TfrmGeraDCTF_Novo.CarregaMovimentoDCTF(pIdDCTF: Double; pAno: String);
Begin
  If pAno = 'Todos' Then
    pAno := '';

  qryDCTFGeradas.DisableControls;
  qryDCTFMovSintetico.DisableControls;
  qryDCTFDetDebitos.DisableControls;
  qryDCTFDetCreditos.DisableControls;
  Cursor := crSQLWait;
  // ******  Tabela PAI - DCTF *******
  qryDCTFGeradas.Close;
  qryDCTFGeradas.SQL.Clear;
  qryDCTFGeradas.SQL.Add('SELECT IDDCTF,           ');
  qryDCTFGeradas.SQL.Add('EXERCICIODCTF,    ');
  qryDCTFGeradas.SQL.Add('MESDCTF,          ');
  qryDCTFGeradas.SQL.Add('DATAINICIOAPURACAO,       ');
  qryDCTFGeradas.SQL.Add('DATAFIMAPURACAO,          ');
  //  qryDCTFGeradas.SQL.Add('INITCAP(TO_CHAR(TO_DATE(''01/'' || MESDCTF || ''/'' || EXERCICIODCTF, ''DD/MM/YYYY''), ''FMMONTH'' ,''NLS_DATE_LANGUAGE = portuguese'')) as DSCMESDCTF, '); //Everson TIBERO
  qryDCTFGeradas.SQL.Add('INITCAP(TO_CHAR(TO_DATE(''01/'' || MESDCTF || ''/'' || EXERCICIODCTF, ''DD/MM/YYYY''), ''FMMONTH'')) as DSCMESDCTF, '); //Everson TIBERO
  qryDCTFGeradas.SQL.Add('TIPODCTF,         ');
  qryDCTFGeradas.SQL.Add('DECODE(TIPODCTF, ''O'', ''Original'', ''Retificadora'') as DSCTIPODCTF,  ');
  qryDCTFGeradas.SQL.Add('NUMRECIBO,        ');
  qryDCTFGeradas.SQL.Add('NUMRECIBOANT,     ');
  qryDCTFGeradas.SQL.Add('DATAENVIORFB,     ');
  qryDCTFGeradas.SQL.Add('NUMVERSAOSOFT,    ');
  qryDCTFGeradas.SQL.Add('NUMVERSAOLAYOUT,  ');
  qryDCTFGeradas.SQL.Add('FLGARQUIVOGERADO, ');
  qryDCTFGeradas.SQL.Add('TRGDTINCLUSAO,    ');

  //Higor Nayde SOL 258183/17609 pmm 1000747
  qryDCTFGeradas.SQL.Add('FLGREGEXCLUIDO,    ');
  qryDCTFGeradas.SQL.Add('OBS    ');
  //Higor Nayde SOL 258183/17609 pmm 1000747

  qryDCTFGeradas.SQL.Add('FROM DCTF         ');
  If (pIdDCTF <> -1) And (pAno <> '') Then
  Begin
    qryDCTFGeradas.SQL.Add('WHERE IDDCTF = ' + floattostr(pIdDCTF));
    qryDCTFGeradas.SQL.Add('      AND EXERCICIODCTF = ' + quotedstr(pAno));
  End
  Else If (pIdDCTF <> -1) Then
    qryDCTFGeradas.SQL.Add('WHERE IDDCTF = ' + floattostr(pIdDCTF))
  Else If (pAno <> '') Then
    qryDCTFGeradas.SQL.Add('WHERE EXERCICIODCTF = ' + quotedstr(pAno));
  qryDCTFGeradas.SQL.Add('ORDER BY EXERCICIODCTF DESC, MESDCTF DESC, TIPODCTF DESC');
  qryDCTFGeradas.Open;
  If Not qryDCTFGeradas.isEmpty Then
  Begin
    //
    // ******  Tabelas Filho ******
    //
    // Movimento Sintetico
    qryDCTFMovSintetico.Close;
    qryDCTFMovSintetico.SQL.Clear;
    // Paulo Nobre WO2061 - Inicio
    // Marcos Lima SIG136949 - Inicio
 //   If ValidaVigenciaMaio2023(cbMesCompetencia.ItemIndex, edAnoCalendario.Text) Then
//      qryDCTFMovSintetico.SQL.Text := StringReplace(oDCTF.LocalizaDCTF_MovSintetico, '/*FILTRO_0588_0561*/', ' AND NAT.CODNATUREZA NOT IN (''0588'',''0561'') ', [rfReplaceAll])
//    Else
    qryDCTFMovSintetico.SQL.Text := oDCTF.LocalizaDCTF_MovSintetico;
    // Marcos Lima SIG136949 - Fim
    // Paulo Nobre WO2061 - Fim
    qryDCTFMovSintetico.Open;
    //
    // Detalhamento dos Débitos
    qryDCTFDetDebitos.Close;
    qryDCTFDetDebitos.SQL.Clear;
    qryDCTFDetDebitos.SQL.Text := oDCTF.LocalizaDCTF_DetalhamentoDebitos;
    qryDCTFDetDebitos.Open;
    //
    // Detalhamento dos Créditos
    qryDCTFDetCreditos.Close;
    qryDCTFDetCreditos.SQL.Clear;
    qryDCTFDetCreditos.SQL.Text := oDCTF.LocalizaDCTF_DetalhamentoCreditos;
    qryDCTFDetCreditos.Open;
    //
    qryTotalDCTFDetCreditos.Close;
    qryTotalDCTFDetCreditos.SQL.Clear;
    qryTotalDCTFDetCreditos.SQL.Text := oDCTF.LocalizaDCTF_TotalDetalhamentoCreditos;
    qryTotalDCTFDetCreditos.Open;
    //
    // Conciliação Individual CPF´s
    qryDCTFConciliaIndivCPF.Close;
    qryDCTFConciliaIndivCPF.SQL.Clear;
    qryDCTFConciliaIndivCPF.SQL.Text := oDCTF.LocalizaDCTF_ConciliacaoIndividualCPF;
    qryDCTFConciliaIndivCPF.Open;
    //
    // Dados Adicionais
    qryDadosAdicionais.Close;
    qryDadosAdicionais.SQL.Clear;
    qryDadosAdicionais.SQL.Text := oDCTF.LocalizaDCTF_DadosAdicionais;
    qryDadosAdicionais.Open;

    // Totalizadores
    qryTotalDCTFDetCRDARF.Close;
    qryTotalDCTFDetCRDARF.Open;
    qryTotalDCTFDetCRDJE.Close;
    qryTotalDCTFDetCRDJE.Open;
    qryTotalDCTFDetCRDCOMP.Close;
    qryTotalDCTFDetCRDCOMP.Open;
    qryTotConcIndiv.Close;
    qryTotConcIndiv.Open;

    qryDCTFMovSinteticoAfterScroll(qryDCTFMovSintetico);
    qryDCTFDetDebitosAfterScroll(qryDCTFDetDebitos);

    cbQualificacao.itemindex := qryDadosAdicionais.fieldbyname('IDQUALIFPJ').asInteger;
    cbLucro.itemindex := qryDadosAdicionais.fieldbyname('IDFORMTRIBLUCRO').asInteger;
    cbCritRecon.itemindex := qryDadosAdicionais.fieldbyname('IDCRITRECON').asInteger;
    //
    // SOL 235337/16319 PPM 457199 - Paulo Nobre
    cbRegimeApur.itemindex := qryDadosAdicionais.fieldbyname('IDREGIMEAPUR').asInteger;
    cbSituacaoPJ.itemindex := qryDadosAdicionais.fieldbyname('IDSITUACAOPJ').asInteger;
    cbOpcoesLEI.itemindex := qryDadosAdicionais.fieldbyname('IDOPCAOLEI').asInteger;
    //
    //SIG 48772 - Início
    If qryDadosAdicionais.FieldByName('VERSAO').AsInteger = 0 Then
    Begin
      chkCPRB.Checked := false;
      chkDebSCP.Checked := false;
      chkPJInativa.Checked := false;
      chkSimplesNac.Checked := false;
      chkSusp.Checked := false;
    End
    Else
    Begin
      chkCPRB.Checked := (qryDadosAdicionais.FieldByName('OPTCPRB').AsInteger = 1);
      chkDebSCP.Checked := (qryDadosAdicionais.FieldByName('FLGDEBSCP').AsInteger = 1);
      chkPJInativa.Checked := (qryDadosAdicionais.FieldByName('FLGINATIVA').AsInteger = 1);
      chkSimplesNac.Checked := (qryDadosAdicionais.FieldByName('OPTSIMPLES').AsInteger = 1);
      chkSusp.Checked := (qryDadosAdicionais.FieldByName('FLGBALANSUSP').AsInteger = 1);
    End;

    edtVersaoLeiaute.Text := FormatFloat('0.00', qryDadosAdicionais.FieldByName('VERSAO').AsInteger / 100);
    //SIG 48772 - Fim
  End;

  dbTotalDetDB.Lines.Clear;

  AjustaCamposGerarDCTF(qryDCTFGeradas.fieldbyname('TIPODCTF').AsString);

  qryExercicios.Close;
  qryExercicios.Open;

  //    qryDCTFGeradasAfterScroll(qryDCTFGeradas); // Paulo Nobre - SIG 49047

  qryDCTFGeradas.EnableControls;
  qryDCTFMovSintetico.EnableControls;
  qryDCTFDetDebitos.EnableControls;
  qryDCTFDetCreditos.EnableControls;
  dbgDCTFGeradas.RefreshDisplay;
  dbGridSintetico.RefreshDisplay;
  dbgDetDB.RefreshDisplay;
  dbgDARF.RefreshDisplay;
  dbgConcil.RefreshDisplay;

  // Paulo Nobre WO2061 - Inicio
  qryDCTFGeradasAfterScroll(qryDCTFGeradas);
  // Paulo Nobre WO2061 - Fim

  Cursor := crDefault;

  dbAnoExercicioFiltro.LookupValue := 'Todos';
  dbLkpGrupoTrib.LookupValue := '00';             // Todos
  dbLkpTributos.LookupValue := 'Todos';
End;

Procedure TfrmGeraDCTF_Novo.spbDetalharDJEClick(Sender: TObject);
Begin
  Screen.Cursor := crAppStart;
  frmCadDCTF_DJE := TfrmCadDCTF_DJE.Create(Self);
  frmCadDCTF_DJE.ShowModal;
  FreeAndNil(frmCadDCTF_DJE);
  Screen.cursor := crDefault;
End;

Procedure TfrmGeraDCTF_Novo.dbgbtnDesfazrFiltroExercClick(Sender: TObject);
Begin
  CarregaMovimentoDCTF(-1, dbAnoExercicioFiltro.Text);
End;

Procedure TfrmGeraDCTF_Novo.pcOutrosChange(Sender: TObject);
Begin
  If pcOutros.ActivePageIndex = 1 Then            // Aba Dados do envio a RFB
  Begin
    meNumRec.SelectAll;
    meNumRec.Setfocus;
  End;
End;

Function TfrmGeraDCTF_Novo.ExisteDCTFOriginalLancada(sTipo: String; Var sAno, sDescMes, sDescTipo, sNumRec: String): Boolean;
Begin
  Result := False;
  Screen.Cursor := crSQLWait;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT EXERCICIODCTF,   ');
  //  qryAux.SQL.add('INITCAP(TO_CHAR(TO_DATE(''01/'' || MESDCTF || ''/'' || EXERCICIODCTF), ''FMMONTH'' ,''NLS_DATE_LANGUAGE = portuguese'')) as DSCMESDCTF, '); //Everson TIBERO
  qryAux.SQL.add('INITCAP(TO_CHAR(TO_DATE(''01/'' || MESDCTF || ''/'' || EXERCICIODCTF), ''FMMONTH'')) as DSCMESDCTF, '); //Everson TIBERO
  qryAux.SQL.add('DECODE(TIPODCTF, ''O'', ''Original'', ''Retificadora'') as DSCTIPODCTF, NUMRECIBO  ');
  qryAux.SQL.add('FROM DCTF         ');
  qryAux.SQL.add('WHERE EXERCICIODCTF = ' + quotedstr(edAnoCalendario.text));
  qryAux.SQL.add('      AND MESDCTF = ' + quotedstr(Format('%.2d', [cbMesCompetencia.ItemIndex + 1])));
  qryAux.SQL.add('      AND TIPODCTF = ''O'' ');
  qryAux.Open;
  If Not qryAux.EOF Then                          // Já Existe
  Begin
    Result := True;
    If qryAux.fieldbyname('NUMRECIBO').isNull Then
      If sTipo = 'R' Then
        Result := False;

    sAno := qryAux.fieldbyname('EXERCICIODCTF').asString;
    sDescMes := qryAux.fieldbyname('DSCMESDCTF').asString;
    sDescTipo := qryAux.fieldbyname('DSCTIPODCTF').asString;
    sNumRec := qryAux.fieldbyname('NUMRECIBO').asString;
  End;
  Screen.Cursor := crDefault;
End;

Function TfrmGeraDCTF_Novo.PermiteGerarDCTFRetificadora(Var sAno, sDescMes, sDescTipo, sNumRec: String): Boolean;
Begin
  Result := True;
  Screen.Cursor := crSQLWait;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT EXERCICIODCTF,   ');
  //  qryAux.SQL.add('INITCAP(TO_CHAR(TO_DATE(''01/'' || MESDCTF || ''/'' || EXERCICIODCTF), ''FMMONTH'' ,''NLS_DATE_LANGUAGE = portuguese'')) as DSCMESDCTF, '); //Everson TIBERO
  qryAux.SQL.add('INITCAP(TO_CHAR(TO_DATE(''01/'' || MESDCTF || ''/'' || EXERCICIODCTF), ''FMMONTH'')) as DSCMESDCTF, '); //Everson TIBERO
  qryAux.SQL.add('DECODE(TIPODCTF, ''O'', ''Original'', ''Retificadora'') as DSCTIPODCTF, ');
  qryAux.SQL.add(' NUMRECIBO  ');
  qryAux.SQL.add('FROM DCTF         ');
  qryAux.SQL.add('WHERE EXERCICIODCTF = ' + quotedstr(edAnoCalendario.text));
  qryAux.SQL.add('AND MESDCTF = ' + quotedstr(Format('%.2d', [cbMesCompetencia.ItemIndex + 1])));
  qryAux.SQL.add('AND TIPODCTF = ''R'' ');
  qryAux.Open;
  If Not qryAux.EOF Then                          // Existe
  Begin
    Result := (Not qryAux.fieldbyname('NUMRECIBO').isnull);
    If Result = False Then
    Begin
      sAno := qryAux.fieldbyname('EXERCICIODCTF').asString;
      sDescMes := qryAux.fieldbyname('DSCMESDCTF').asString;
      sDescTipo := qryAux.fieldbyname('DSCTIPODCTF').asString;
      sNumRec := qryAux.fieldbyname('NUMRECIBO').asString;
    End;
  End;

  Screen.Cursor := crDefault;
End;

Procedure TfrmGeraDCTF_Novo.spbAtualizarClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  {  If meNumRec.Text = EmptyStr Then
       Begin
          Application.MessageBox(MSG006, 'Atenção', Mb_IconExclamation);
          meNumRec.SelectAll;
          meNumRec.Setfocus;
          Exit;
       End;    }

    // SOL 235337/16319 PPM 457199 - Paulo Nobre
  //   If oDCTF.ValidaNumeroRecibo(meNumRec.Text) Then
  //      Begin
  Screen.Cursor := crSQLWait;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT NUMRECIBO  ');
  qryAux.SQL.add('FROM DCTF         ');
  qryAux.SQL.add('WHERE NUMRECIBO = ' + quotedstr(meNumRec.Text));
  qryAux.Open;
  Screen.Cursor := crDefault;
  If Not qryAux.EOF Then
  Begin
    Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
    meNumRec.SelectAll;
    meNumRec.Setfocus;
    Exit;
  End;

  If qryDCTFGeradas.fieldByname('FLGARQUIVOGERADO').asString = 'S' Then // Arquivo Gerado
  Begin
    If Application.MessageBox(MSG008, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
    Begin
      Screen.Cursor := crSQLWait;
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

      Screen.Cursor := crSQLWait;
      qryDCTFGeradas.DisableControls;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.add('UPDATE DCTF SET   ');
      If oDCTF.TiraMascara(meNumRec.Text) <> '' Then
      Begin
        qryAux.SQL.add('NUMRECIBO = ' + quotedstr(meNumRec.Text));
        qryAux.SQL.add(',DATAENVIORFB = TO_DATE(' + quotedstr(dtDataEnvio.Text + ' ' + dpHoraEnvio.text + ':00') + ' , ''DD/MM/YYYY HH24:MI:SS'' ) ');
      End
      Else
      Begin
        qryAux.SQL.add('NUMRECIBO = NULL ');
        qryAux.SQL.add(',DATAENVIORFB = NULL ');
      End;

      qryAux.SQL.add('WHERE IDDCTF = ' + qryDCTFGeradas.fieldByname('IDDCTF').asString);
      qryAux.ExecSQL;
      Screen.Cursor := crDefault;

      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;

      RegAtual := qryDCTFGeradas.GetBookmark;     // Salvando o ponteiro do Registro

      qryDCTFGeradas.Close;
      qryDCTFGeradas.Open;
      meNumRec.Clear;

      If RegAtual <> Nil Then
        qryDCTFGeradas.GotoBookmark(RegAtual);    // Voltando ao Reg. atual

      Screen.Cursor := crDefault;
      qryDCTFGeradas.enableControls;
    End;
  End
  Else
    Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
  //    End
  //  Else
  //    Application.MessageBox(MSG020, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDCTF_Novo.cbMesCompetenciaChange(Sender: TObject);
Begin
  AjustaDatasApuracao(edAnoCalendario.Text, cbMesCompetencia.ItemIndex);
End;

Procedure TfrmGeraDCTF_Novo.GerarDCTFMensal(pTipo: String);
Begin
  Try
    Screen.Cursor := crSQLWait;

    qryDCTFGeradas.DisableControls;
    qryDCTFMovSintetico.DisableControls;
    qryDCTFDetDebitos.DisableControls;
    qryDCTFDetCreditos.DisableControls;

    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    // Gerando a DCTF
    If oDCTF.GerarDCTF(edAnoCalendario.text, Format('%.2d', [cbMesCompetencia.ItemIndex + 1]), pTipo, dtInicio.date, dtFim.date, Trunc(strtofloat(edtVersaoLeiaute.Text) * 100),
      cbLucro.ItemIndex, cbQualificacao.ItemIndex, cbCritRecon.ItemIndex, cbRegimeApur.ItemIndex, cbSituacaoPJ.ItemIndex, cbOpcoesLEI.ItemIndex,
      iFlgSusp, iFlgDebSCP, iOptSimples, iOptCPRB, iFlgInativa) Then
    Begin
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;

      CarregaMovimentoDCTF(-1, dbAnoExercicioFiltro.Text);

      oDCTF.LocalizaDCTF_DetalhamentoCreditos;
      qryDCTFGeradas.EnableControls;
      qryDCTFMovSintetico.EnableControls;
      qryDCTFDetDebitos.EnableControls;
      qryDCTFDetCreditos.EnableControls;
    End
    Else
    Begin
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.RollBack;

      Application.MessageBox(PChar(MSG021 + #13 + #13 + oDCTF.MessageInfo), 'Atenção !', Mb_IconExclamation);
      Screen.Cursor := crDefault;
      qryDCTFGeradas.EnableControls;
      qryDCTFMovSintetico.EnableControls;
      qryDCTFDetDebitos.EnableControls;
      qryDCTFDetCreditos.EnableControls;
    End
  Except
    On E: Exception Do
    Begin
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;

      Application.MessageBox(PChar(MSG021 + #13 + #13 + oDCTF.MessageInfo + #13 + e.Message), 'Atenção !', Mb_IconExclamation);
      Screen.Cursor := crDefault;
      qryDCTFGeradas.EnableControls;
      qryDCTFMovSintetico.EnableControls;
      qryDCTFDetDebitos.EnableControls;
      qryDCTFDetCreditos.EnableControls;
    End;
  End;
End;

Procedure TfrmGeraDCTF_Novo.AjustaCamposGerarDCTF(pTipo: String);
Var sAnoAtual: String;
Begin
  // SOL 250991  PPM 725121 - Paulo Nobre - 17/03/2015
  sAnoAtual := inttostr(DiasUteis.ExtraiAno(date));
  edAnoCalendario.Text := sAnoAtual;
  cbMesCompetencia.ItemIndex := 0;                // Janeiro
  rgTipoDCTF.ItemIndex := 0;                      // Original

  dtDataEnvio.date := date;

  If Not qryDCTFGeradas.isEmpty Then
  Begin
    qryDCTFGeradas.First;
    If pTipo = 'O' Then                           // Original
    Begin
      edAnoCalendario.Text := qryDCTFGeradas.fieldbyname('EXERCICIODCTF').AsString;
      cbMesCompetencia.ItemIndex := qryDCTFGeradas.fieldbyname('MESDCTF').AsInteger;

      If qryDCTFGeradas.fieldbyname('EXERCICIODCTF').AsString < sAnoAtual Then
        If qryDCTFGeradas.fieldbyname('MESDCTF').AsInteger = 12 Then // Dezembro
        Begin
          // Inicia um novo exercício
          edAnoCalendario.Text := sAnoAtual;
          cbMesCompetencia.ItemIndex := 0;        // Janeiro
        End;

      rgTipoDCTF.ItemIndex := 0;                  // original
    End
    Else                                          // Retificadora
    Begin
      cbMesCompetencia.ItemIndex := qryDCTFGeradas.fieldbyname('MESDCTF').AsInteger - 1;
      rgTipoDCTF.ItemIndex := 1;                  // retificadora
    End;
  End;
  AjustaDatasApuracao(edAnoCalendario.Text, cbMesCompetencia.ItemIndex);
End;

Procedure TfrmGeraDCTF_Novo.AjustaDatasApuracao(pAnoCalendario: String; pMesCompetencia: Integer);
Var iUltDia: Integer;
Begin
  dtInicio.Text := '01/' + StrZero(2, IntToStr(pMesCompetencia + 1)) + '/' + pAnoCalendario;
  iUltDia := TrazUltDiaMes((pMesCompetencia + 1), StrToInt(pAnoCalendario));
  dtFim.Text := StrZero(2, IntToStr(iUltDia)) + '/' + StrZero(2, IntToStr(pMesCompetencia + 1)) + '/' + pAnoCalendario;
End;

Procedure TfrmGeraDCTF_Novo.spbMarcarDesmarcarDetDBClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  If (Not qryDCTFDetDebitos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull) Then
  Begin
    Cursor := crSQLWait;
    Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

      qryDCTFDetDebitos.DisableControls;
      qryDCTFDetDebitos.First;
      While Not qryDCTFDetDebitos.Eof Do
      Begin
        If qryDCTFDetDebitos.FieldByName('FLGMARCADO').AsString = 'S' Then
          qryFLGMarcadoDetDB.parambyname('pFLGMARCADO').AsString := 'N'
        Else
          qryFLGMarcadoDetDB.parambyname('pFLGMARCADO').AsString := 'S';
        qryFLGMarcadoDetDB.parambyname('pIDDCTF').AsInteger := qryDCTFDetDebitos.FieldByName('IDDCTF').AsInteger;
        qryFLGMarcadoDetDB.parambyname('pIDDCTFDBDETALHE').AsInteger := qryDCTFDetDebitos.FieldByName('IDDCTFDBDETALHE').AsInteger;
        qryFLGMarcadoDetDB.ExecSQL;

        qryDCTFDetDebitos.Next;
      End;

      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;
    Except
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;

    RegAtual := qryDCTFMovSintetico.GetBookmark;  // Salvando o ponteiro do Registro

    qryDCTFDetDebitos.Close;
    qryDCTFDetDebitos.Open;
    qryDCTFMovSintetico.Close;
    qryDCTFMovSintetico.Open;

    If RegAtual <> Nil Then
      qryDCTFMovSintetico.GotoBookmark(RegAtual); // Voltando ao Reg. atual

    Cursor := crDefault;
    qryDCTFDetDebitos.EnableControls;
  End;
End;

Procedure TfrmGeraDCTF_Novo.dbLkpGrupoTribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  qryDCTFMovSintetico.Filtered := False;
  If qryLkpGrupoTrib.fieldbyname('GRUPOTRIBUTO').asString <> '00' Then // Todos
  Begin
    qryDCTFMovSintetico.Filter := 'GRUPOTRIBUTO = ' + qryLkpGrupoTrib.fieldbyname('GRUPOTRIBUTO').asString;
    qryDCTFMovSintetico.Filtered := True;
  End;
End;

Procedure TfrmGeraDCTF_Novo.dbgDARFDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDCTFDetCreditos.isEmpty Then
  Begin
    If (Field.Name = 'qryDCTFDetCreditosCODNATUREZA') Or
      (Field.Name = 'qryDCTFDetCreditosCODNATURASSOCIADA') Or
      (Field.Name = 'qryDCTFDetCreditosTIPODOCTO') Or
      (Field.Name = 'qryDCTFDetCreditosVLRTOTALDET') Or
      (Field.Name = 'qryDCTFDetCreditosDATAFIMAPURACAO') Or
      (Field.Name = 'qryDCTFDetCreditosVLRIRRF') Then
      dbgDARF.Canvas.Font.Style := [fsbold];

    If (Field.Name = 'qryDCTFDetCreditosVLRDIFERENCA') Then
    Begin
      dbgDARF.Canvas.Font.Style := [fsbold];
      If qryDCTFDetCreditos.FieldByName('VLRDIFERENCA').asFloat < 0.00 Then
        dbgDARF.Canvas.Font.Color := clRed;
    End;

    If qryDCTFDetCreditos.fieldByname('FLGMARCADO').asString = 'N' Then
    Begin
      dbgDARF.Canvas.Font.Style := [fsStrikeout];
      dbgDARF.Canvas.Font.Color := clRed;
    End;

    dbgDARF.DefaultDrawDataCell(Rect, Field, State);
  End;
End;

Procedure TfrmGeraDCTF_Novo.pcDemoAnaliticoChange(Sender: TObject);
Begin
  dbGridSintetico.RefreshDisplay;
End;

Procedure TfrmGeraDCTF_Novo.dbgDetDBDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDCTFDetDebitos.isEmpty Then
  Begin
    If (Field.Name = 'qryDCTFDetDebitosCODNATUREZA') Or
      (Field.Name = 'qryDCTFDetDebitosCODNATURASSOCIADA') Or
      (Field.Name = 'qryDCTFDetDebitosDSCTIPOMOV') Or
      (Field.Name = 'qryDCTFDetDebitosVLRIRRF') Then
      dbgDetDB.Canvas.Font.Style := [fsbold];

    If qryDCTFDetDebitos.fieldByname('FLGMARCADO').asString = 'N' Then
    Begin
      dbgDetDB.Canvas.Font.Style := [fsStrikeout];
      dbgDetDB.Canvas.Font.Color := clRed;
    End;

    If qryDCTFDetDebitos.fieldByname('TIPOMOV').asString = '9' Then // Ajustes de Mov.
      dbgDetDB.Canvas.Font.Color := clMaroon;

    dbgDetDB.DefaultDrawDataCell(Rect, Field, State);
  End;
End;

Procedure TfrmGeraDCTF_Novo.qryDCTFDetDebitosAfterScroll(DataSet: TDataSet);
Begin
  meQtdDB.Caption := Format('Registro %.2d de %.2d', [qryDCTFDetDebitos.RecNo, qryDCTFDetDebitos.RecordCount]);

  If Length(Trim(qryDCTFDetDebitosNUMDOCUMENTO.asString)) = 11 Then
    qryDCTFDetDebitosNUMDOCUMENTO.EditMask := '999.999.999\-99;0; '
  Else
    qryDCTFDetDebitosNUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0; ';    // Paulo Nobre - WO34233

  // Paulo Nobre - SIG 49047 - Inicio
  edNovoValorTributo.Enabled := ((qryDCTFDetDebitos.FieldByName('FLGMARCADO').AsString = 'S') And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  spbAtualizaValor.Enabled := ((qryDCTFDetDebitos.FieldByName('FLGMARCADO').AsString = 'S') And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull));
  // Paulo Nobre - SIG 49047 - Fim
End;

Procedure TfrmGeraDCTF_Novo.spbManutencaoDARFClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  RegAtual1 := Nil;
  RegAtual2 := Nil;
  Screen.Cursor := crAppStart;
  frmCadDCTF_DARF := TfrmCadDCTF_DARF.Create(Self);

  frmCadDCTF_DARF.CarregaMovDARF(
    qryDCTFGeradas.fieldbyname('IDDCTF').AsInteger,
    qryDCTFDetCreditos.fieldbyname('IDDCTFCRDETALHE').AsInteger,
    qryDCTFMovSintetico.fieldbyname('CODNATUREZA').AsString,
    qryDadosAdicionais.fieldbyname('CNPJFUNDACAO').AsString,
    qryDCTFGeradas.fieldbyname('DATAINICIOAPURACAO').AsDateTime,
    qryDCTFGeradas.fieldbyname('DATAFIMAPURACAO').AsDateTime,
    qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull);

  frmCadDCTF_DARF.ShowModal;
  Screen.cursor := crDefault;

  If frmCadDCTF_DARF.bModificou Then
  Begin
    Cursor := crSQLWait;
    qryDCTFDetCreditos.DisableControls;
    RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro
    qryDCTFDetCreditos.Close;
    qryDCTFDetCreditos.Open;
    If Not qryDCTFDetCreditos.isEmpty Then
      RegAtual2 := qryDCTFDetCreditos.GetBookmark; // Salvando o ponteiro do Registro

    qryDCTFMovSintetico.Close;
    qryDCTFMovSintetico.Open;
    qryTotalDCTFDetCRDARF.Close;
    qryTotalDCTFDetCRDARF.Open;
    qryTotalDCTFDetCRDJE.Close;
    qryTotalDCTFDetCRDJE.Open;
    qryTotalDCTFDetCRDCOMP.Close;
    qryTotalDCTFDetCRDCOMP.Open;
    qryTotConcIndiv.Close;
    qryTotConcIndiv.Open;

    If RegAtual1 <> Nil Then
      qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
    If RegAtual2 <> Nil Then
      qryDCTFDetCreditos.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

    qryDCTFDetCreditos.EnableControls;
    Cursor := crDefault;
  End;

  FreeAndNil(frmCadDCTF_DARF);
End;

Procedure TfrmGeraDCTF_Novo.spbLocalizarDetCRClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  If (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull) Then
  Begin
    MSDARF.ItemsBusca.Clear;
    MSDARF.Caption := 'Selecione o DARF Gerado';
    // campo 0
    If qryDCTFDetCreditos.fieldByname('CODNATURASSOCIADA').isnull Then
      MSDARF.ItemsBusca.Add(qryDCTFMovSintetico.fieldByname('CODNATUREZA').asString)
    Else
      MSDARF.ItemsBusca.Add(qryDCTFDetCreditos.fieldByname('CODNATURASSOCIADA').asString);

    MSDARF.ItemsBusca.Add('');                    // campo 1 - CPF/CNPJ
    MSDARF.ItemsBusca.Add('');                    // campo 2 - Valor
    MSDARF.ItemsBusca.Add(qryDCTFGeradas.fieldByname('DATAINICIOAPURACAO').asString);
    MSDARF.ItemsBusca.Add(qryDCTFGeradas.fieldByname('DATAFIMAPURACAO').asString);

    MSDARF.Executar;
    If (MSDARF.RetornouValor) Then
    Begin
      // Verificando se o DARF localizado existe na tabela DCTF_CREDITODETALHE_DARF
      Screen.Cursor := crSQLWait;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.add('SELECT IDDARF                         ');
      qryAux.SQL.add('FROM DCTF_CREDITODETALHE_DARF D       ');
      qryAux.SQL.add('WHERE D.IDDARF = ' + MSDARF.ValoresChave[2]); // IDDARF
      qryAux.Open;
      If qryAux.EOF Then                          // Se não existe
      Begin
        // *************** Inserir DARF´s
        // SOL 238778 PPM 512818 - Paulo Nobre
        If Not oDCTF.InserirDCTF_CR_DARF_O(qryDCTFGeradas.fieldByname('IDDCTF').asInteger,
          strtoint(MSDARF.ValoresChave[2]),       // IDDARF
          // Paulo Nobre - SIG 41744_43545 - Inicio
          //                1,
          // Paulo Nobre - SIG 41744_43545 - Fim
          qryDCTFGeradas.fieldByname('DATAINICIOAPURACAO').asDateTime,
          qryDCTFGeradas.fieldByname('DATAFIMAPURACAO').asDateTime) Then
        Begin
          MsgDlg(MSG025, 'Atenção', mtInformation, [mbOk], 0);
          Exit;
        End;

        // *************** Inserir Detalhamento das DARF´s
        If (MSDARF.ValoresChave[1] <> '7416') And (MSDARF.ValoresChave[1] <> '7431') Then // DARF
        Begin
          If Not oDCTF.InserirDetalheDARF_O(qryDCTFGeradas.fieldByname('IDDCTF').asInteger,
            strtoint(MSDARF.ValoresChave[2]),     // IDDARF
            // Paulo Nobre - SIG 41744_43545 - Inicio
            //                1,
            // Paulo Nobre - SIG 41744_43545 - Fim
            qryDCTFGeradas.fieldByname('DATAINICIOAPURACAO').asDateTime,
            qryDCTFGeradas.fieldByname('DATAFIMAPURACAO').asDateTime) Then
          Begin
            MsgDlg(MSG026, 'Atenção', mtInformation, [mbOk], 0);
            Exit;
          End;
        End
        Else                                      // DJE
        Begin
          // *************** Inserir Detalhamento das DJE´s
          If Not oDCTF.InserirDetalheDJE_O(qryDCTFGeradas.fieldByname('IDDCTF').asInteger,
            strtoint(MSDARF.ValoresChave[2]),     // IDDARF
            // Paulo Nobre - SIG 41744_43545 - Inicio
            //                1,
            // Paulo Nobre - SIG 41744_43545 - Fim
            qryDCTFGeradas.fieldByname('DATAINICIOAPURACAO').asDateTime,
            qryDCTFGeradas.fieldByname('DATAFIMAPURACAO').asDateTime) Then
          Begin
            MsgDlg(MSG027, 'Atenção', mtInformation, [mbOk], 0);
            Exit;
          End;
        End;

        RegAtual := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual

        qryDCTFDetCreditos.Close;
        qryDCTFDetCreditos.Open;
        qryTotalDCTFDetCreditos.Close;
        qryTotalDCTFDetCreditos.Open;
        qryDCTFMovSintetico.Close;
        qryDCTFMovSintetico.Open;

        If RegAtual <> Nil Then
          qryDCTFMovSintetico.GotoBookmark(RegAtual); // Voltando ao Reg. atual
      End
      Else
        MsgDlg(MSG028, 'Atenção', mtInformation, [mbOk], 0);

      Screen.Cursor := crDefault;
    End;
  End
  Else
    Application.MessageBox(MSG032, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDCTF_Novo.spbExportaDetDARFClick(Sender: TObject);
Begin
  If Not qryDCTFDetCreditos.isEmpty Then
  Begin
    qeDCTFDetCR.Execute;
    qryDCTFDetCreditos.first;
  End;
End;

Procedure TfrmGeraDCTF_Novo.dbgDARFDblClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  If (Not qryDCTFDetCreditos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull) Then
  Begin
    // Paulo Nobre - SIG 49047 - Inicio
    Try
      Screen.Cursor := crSQLWait;
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

      If trim(qryDCTFDetCreditos.fieldbyname('TIPODOCTO').AsString) <> 'DCOMP' Then
      Begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE DCTF_CREDITODETALHE_DARF ');
        qryAux.SQL.Add('SET FLGMARCADO =:pFLGMARCADO    ');
        qryAux.SQL.Add('WHERE IDDCTF =:pIDDCTF          ');
        qryAux.SQL.Add('      AND IDDCTFCRDETALHE_DARF =:pIDDCTFCRDETALHE ');
      End;

      If trim(qryDCTFDetCreditos.fieldbyname('TIPODOCTO').AsString) = 'DCOMP' Then
      Begin
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add('UPDATE DCTF_CREDITODETALHE_DCOMP ');
        qryAux.SQL.Add('SET FLGMARCADO =:pFLGMARCADO     ');
        qryAux.SQL.Add('WHERE IDDCTF =:pIDDCTF           ');
        qryAux.SQL.Add('      AND IDDCTFCRDETALHE_DCOMP =:pIDDCTFCRDETALHE ');
      End;

      qryDCTFDetCreditos.DisableControls;
      If qryDCTFDetCreditos.FieldByName('FLGMARCADO').AsString = 'S' Then
        qryAux.parambyname('pFLGMARCADO').AsString := 'N'
      Else
        qryAux.parambyname('pFLGMARCADO').AsString := 'S';
      qryAux.parambyname('pIDDCTF').AsInteger := qryDCTFDetCreditos.FieldByName('IDDCTF').AsInteger;
      qryAux.parambyname('pIDDCTFCRDETALHE').AsInteger := qryDCTFDetCreditos.FieldByName('IDDCTFCRDETALHE').AsInteger;
      qryAux.ExecSQL;

      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;

      RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual
      RegAtual2 := qryDCTFDetCreditos.GetBookmark; // Salvando o ponteiro do Registro atual

      qryDCTFDetCreditos.Close;
      qryDCTFDetCreditos.Open;
      qryTotalDCTFDetCreditos.Close;
      qryTotalDCTFDetCreditos.Open;
      qryDCTFMovSintetico.Close;
      qryDCTFMovSintetico.Open;

      If RegAtual1 <> Nil Then
        qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
      If RegAtual2 <> Nil Then
        qryDCTFDetCreditos.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

    Except
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;

    Screen.Cursor := crDefault;
    qryDCTFDetCreditos.EnableControls;
    // Paulo Nobre - SIG 49047 - Fim
  End
  Else
    Application.MessageBox(MSG032, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDCTF_Novo.dbgDetDBDblClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  If (Not qryDCTFDetDebitos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull) Then
  Begin
    // Paulo Nobre - SIG 49047 - Inicio
    Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

      Screen.Cursor := crSQLWait;
      qryDCTFDetDebitos.DisableControls;
      qryFLGMarcadoDetDB.Close;
      If qryDCTFDetDebitos.FieldByName('FLGMARCADO').AsString = 'S' Then
        qryFLGMarcadoDetDB.parambyname('pFLGMARCADO').AsString := 'N'
      Else
        qryFLGMarcadoDetDB.parambyname('pFLGMARCADO').AsString := 'S';
      qryFLGMarcadoDetDB.parambyname('pIDDCTF').AsInteger := qryDCTFDetDebitos.FieldByName('IDDCTF').AsInteger;
      qryFLGMarcadoDetDB.parambyname('pIDDCTFDBDETALHE').AsInteger := qryDCTFDetDebitos.FieldByName('IDDCTFDBDETALHE').AsInteger;
      qryFLGMarcadoDetDB.ExecSQL;

      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;

      RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual
      RegAtual2 := qryDCTFDetDebitos.GetBookmark; // Salvando o ponteiro do Registro atual

      qryDCTFDetDebitos.Close;
      qryDCTFDetDebitos.Open;
      qryDCTFMovSintetico.Close;
      qryDCTFMovSintetico.Open;

      If RegAtual1 <> Nil Then
        qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
      If RegAtual2 <> Nil Then
        qryDCTFDetDebitos.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

    Except
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;
    Screen.Cursor := crDefault;
    qryDCTFDetDebitos.EnableControls;
    // Paulo Nobre - SIG 49047 - Fim
  End
  Else
    Application.MessageBox(MSG032, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDCTF_Novo.UpDown1ChangingEx(Sender: TObject;
  Var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
Begin
  AjustaDatasApuracao(inttostr(NewValue), cbMesCompetencia.ItemIndex);
End;

Procedure TfrmGeraDCTF_Novo.PResponsavelValidaDados(Sender: TObject);
Begin
  If (MSResp.RetornouValor) Then
    AtualizaDadosRespRepres('1', MSResp.ValoresChave[0]);
End;

Procedure TfrmGeraDCTF_Novo.PRepresentanteValidaDados(Sender: TObject);
Begin
  If (MSRepres.RetornouValor) Then
    AtualizaDadosRespRepres('2', MSRepres.ValoresChave[0]);
End;

Procedure TfrmGeraDCTF_Novo.AtualizaDadosRespRepres(pTipo, pIdPessoa: String);
Begin
  Screen.Cursor := crSQLWait;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.add('SELECT P.IDPESSOA,                                       ');
  qryAux.SQL.add('   P.NUMDOCUMENTO CPF,                                   ');
  qryAux.SQL.add('   P.NOME,                                               ');
  qryAux.SQL.add('   T.DDD,                                                ');
  qryAux.SQL.add('   T.NUMERO,                                             ');
  qryAux.SQL.add('   P.EMAIL                                               ');
  qryAux.SQL.add('   FROM PESSOA P, ENDPESS E, TELENDPESS T                ');
  qryAux.SQL.add('   WHERE P.IDPESSOA = ' + quotedstr(pIdPessoa));
  qryAux.SQL.add('   And P.IDPESSOA = E.IDPESSOA                           ');
  qryAux.SQL.add('   And E.IDENDERECO = T.IDENDERECO                       ');
  qryAux.SQL.add('   And T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE)FROM TELENDPESS T1 WHERE T.IDENDERECO = T1.IDENDERECO)');
  qryAux.Open;
  If Not qryAux.EOF Then
  Begin
    qryDadosAdicionais.Edit;
    //Inicio SIG 129054 Ferrari
    //      If pTipo = '1' Then // Representante
    If pTipo = '2' Then                           // Representante
      // Fim
    Begin
      qryDadosAdicionais.FieldByName('IDREPRES').asInteger := qryAux.fieldbyname('IDPESSOA').asInteger;
      qryDadosAdicionais.FieldByName('CPFREPRES').AsString := qryAux.fieldbyname('CPF').asString;
      qryDadosAdicionais.FieldByName('NOMEREPRES').AsString := qryAux.fieldbyname('NOME').asString;
      qryDadosAdicionais.FieldByName('DDDREPRES').AsString := qryAux.fieldbyname('DDD').asString;
      qryDadosAdicionais.FieldByName('FONEREPRES').AsString := qryAux.fieldbyname('NUMERO').asString;
      qryDadosAdicionais.FieldByName('EMAILREPRES').AsString := qryAux.fieldbyname('EMAIL').asString;
    End
    Else                                          // Responsavel
    Begin
      qryDadosAdicionais.FieldByName('IDRESP').asInteger := qryAux.fieldbyname('IDPESSOA').asInteger;
      qryDadosAdicionais.FieldByName('CPFRESP').AsString := qryAux.fieldbyname('CPF').asString;
      qryDadosAdicionais.FieldByName('NOMERESP').AsString := qryAux.fieldbyname('NOME').asString;
      qryDadosAdicionais.FieldByName('DDDRESP').AsString := qryAux.fieldbyname('DDD').asString;
      qryDadosAdicionais.FieldByName('FONERESP').AsString := qryAux.fieldbyname('NUMERO').asString;
      qryDadosAdicionais.FieldByName('EMAILRESP').AsString := qryAux.fieldbyname('EMAIL').asString;
    End;
    qryDadosAdicionais.Post;
  End;
  Screen.Cursor := crDefault;
End;

Procedure TfrmGeraDCTF_Novo.spbAtualizaDadosInstClick(Sender: TObject);
Begin
  If (dbeCRC.text = '') Then
  Begin
    MsgDlg(MSG029, 'Atenção', mtInformation, [mbOk], 0);
    dbeCRC.SetFocus;
    Exit;
  End;

  If (dbeUFCRC.text = '') Then
  Begin
    MsgDlg(MSG030, 'Atenção', mtInformation, [mbOk], 0);
    dbeUFCRC.SetFocus;
    Exit;
  End;

  If qryDadosAdicionais.State <> dsEdit Then
  Begin
    Try
      // Paulo Nobre - SIG 49047 - Inicio
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;
      qryDadosAdicionais.Edit;
      qryDadosAdicionais.FieldByName('CRCRESP').AsString := dbeCRC.text;
      qryDadosAdicionais.FieldByName('UFCRCRESP').AsString := dbeUFCRC.text;
      qryDadosAdicionais.Post;
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;
    Except
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;
    // Paulo Nobre - SIG 49047 - Fim
  End;
End;

Procedure TfrmGeraDCTF_Novo.spbAtualizaValorClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  If qryDCTFDetDebitos.FieldByName('FLGMARCADO').AsString = 'S' Then
  Begin
    If edNovoValorTributo.Value = 0 Then
    Begin
      Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
      edNovoValorTributo.setfocus;
      Exit;
    End;

    // Paulo Nobre - SIG 49047 - Inicio
    Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then // pnobre
        dtmBaseDados.dbBaseDados.StartTransaction;

      Screen.Cursor := crSQLWait;
      qryDCTFDetDebitos.DisableControls;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.add('UPDATE DCTF_DEBITODETALHE   ');
      qryAux.SQL.add('SET VLRIRRF =:p1            ');
      qryAux.SQL.add('WHERE IDDCTFDBDETALHE = ' + qryDCTFDetDebitos.fieldByname('IDDCTFDBDETALHE').asString);
      qryAux.Parambyname('p1').asFloat := edNovoValorTributo.value;
      qryAux.ExecSQL;

      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;

      RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual
      RegAtual2 := qryDCTFDetDebitos.GetBookmark; // Salvando o ponteiro do Registro atual

      // Detalhamento dos Débitos
      qryDCTFDetDebitos.Close;
      qryDCTFDetDebitos.Open;
      // Movimento Sintetico
      qryDCTFMovSintetico.Close;
      qryDCTFMovSintetico.Open;
      //
      qryTotalDCTFDetCRDARF.Close;
      qryTotalDCTFDetCRDARF.Open;
      qryTotalDCTFDetCRDJE.Close;
      qryTotalDCTFDetCRDJE.Open;
      qryTotalDCTFDetCRDCOMP.Close;
      qryTotalDCTFDetCRDCOMP.Open;
      qryTotConcIndiv.Close;
      qryTotConcIndiv.Open;

      If RegAtual1 <> Nil Then
        qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
      If RegAtual2 <> Nil Then
        qryDCTFDetDebitos.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

    Except
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;
    edNovoValorTributo.Clear;
    Screen.Cursor := crDefault;
    qryDCTFDetDebitos.EnableControls;

    // Paulo Nobre - SIG 49047 - Fim
  End;
End;

Procedure TfrmGeraDCTF_Novo.dbAnoExercicioFiltroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  qryDCTFGeradas.Filtered := False;
  If dbAnoExercicioFiltro.Text <> 'Todos' Then
  Begin
    qryDCTFGeradas.Filter := 'EXERCICIODCTF = ' + dbAnoExercicioFiltro.Text;
    qryDCTFGeradas.Filtered := True;
  End
  Else
    dbgbtnDesfazrFiltroExercclick(self);

  AjustaCamposGerarDCTF(qryDCTFGeradas.fieldbyname('TIPODCTF').AsString);
End;

Procedure TfrmGeraDCTF_Novo.spbExportaDetDBClick(Sender: TObject);
Begin
  If Not qryDCTFDetDebitos.isEmpty Then
  Begin
    qeDCTFDetDebitos.Execute;
    qryDCTFDetDebitos.First;
  End;
End;

Procedure TfrmGeraDCTF_Novo.dbLkpTributosCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  qryDCTFMovSintetico.Filtered := False;
  If qryLkpTributos.fieldbyname('CODNATUREZA').asString <> 'Todos' Then
  Begin
    qryDCTFMovSintetico.Filter := 'CODNATUREZA = ' + qryLkpTributos.fieldbyname('CODNATUREZA').asString;
    qryDCTFMovSintetico.Filtered := True;
  End;
End;

Procedure TfrmGeraDCTF_Novo.spbAtualizaOutDadosClick(Sender: TObject);
Begin
  If (cbQualificacao.Text = '') Then
  Begin
    MsgDlg(MSG023, 'Atenção', mtInformation, [mbOk], 0);
    cbQualificacao.SetFocus;
    Exit;
  End;

  If (cbLucro.Text = '') Then
  Begin
    MsgDlg(MSG024, 'Atenção', mtInformation, [mbOk], 0);
    cbLucro.SetFocus;
    Exit;
  End;

  If (cbCritRecon.Text = EmptyStr) Then
  Begin
    MsgDlg(MSG031, 'Atenção', mtInformation, [mbOk], 0);
    pcDemoAnalitico.ActivePage := tbsOutDados;
    cbCritRecon.SetFocus;
    Exit;
  End;

  //SIG 48772 - Início
  If (edtVersaoLeiaute.Text = EmptyStr) Then
  Begin
    MsgDlg(MSG036, 'Atenção', mtInformation, [mbOk], 0);
    edtVersaoLeiaute.SetFocus;
    Exit;
  End;
  //SIG 48772 - Fim

  If qryDadosAdicionais.State <> dsEdit Then
  Begin
    Try
      // SOL 235337/16319 PPM 457199 - Paulo Nobre
      If cbSituacaoPJ.itemindex = 4 Then          // PJ Não se enquadra
        If cbMesCompetencia.Itemindex = 0 Then    // Janeiro
          cbCritRecon.itemindex := 4              // Não se aplica
        Else
          cbCritRecon.itemindex := 5;             // Sem alteração do regime

      If Not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;
      qryDadosAdicionais.Edit;
      qryDadosAdicionais.fieldbyname('IDQUALIFPJ').asInteger := cbQualificacao.itemindex;
      qryDadosAdicionais.fieldbyname('IDFORMTRIBLUCRO').asInteger := cbLucro.itemindex;
      qryDadosAdicionais.fieldbyname('IDCRITRECON').asInteger := cbCritRecon.itemindex;
      // SOL 235337/16319 PPM 457199 - Paulo Nobre
      qryDadosAdicionais.fieldbyname('IDREGIMEAPUR').asInteger := cbRegimeApur.itemindex;
      qryDadosAdicionais.fieldbyname('IDSITUACAOPJ').asInteger := cbSituacaoPJ.itemindex;
      qryDadosAdicionais.fieldbyname('IDOPCAOLEI').asInteger := cbOpcoesLEI.itemindex;

      // SIG 48772 - Início
      //Definição dos valores para os campos novos, a prtir da versão 3.4
      qryDadosAdicionais.FieldByName('VERSAO').AsInteger := Trunc(StrToFloat(edtVersaoLeiaute.Text) * 100); //Transforma o valor em inteiro.

      If chkCPRB.Checked Then
        qryDadosAdicionais.FieldByName('OPTCPRB').asInteger := 1
      Else
        qryDadosAdicionais.FieldByName('OPTCPRB').asInteger := 0;

      If chkDebSCP.Checked Then
        qryDadosAdicionais.FieldByName('FLGDEBSCP').asInteger := 1
      Else
        qryDadosAdicionais.FieldByName('FLGDEBSCP').asInteger := 0;

      If chkPJInativa.Checked Then
        qryDadosAdicionais.FieldByName('FLGINATIVA').asInteger := 1
      Else
        qryDadosAdicionais.FieldByName('FLGINATIVA').asInteger := 0;

      If chkSimplesNac.Checked Then
        qryDadosAdicionais.FieldByName('OPTSIMPLES').asInteger := 1
      Else
        qryDadosAdicionais.FieldByName('OPTSIMPLES').asInteger := 0;

      If chkSusp.Checked Then
        qryDadosAdicionais.FieldByName('FLGBALANSUSP').asInteger := 1
      Else
        qryDadosAdicionais.FieldByName('FLGBALANSUSP').asInteger := 0;
      // SIG 48772 - Fim

      qryDadosAdicionais.Post;
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Commit;
    Except
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;
  End;
End;

Procedure TfrmGeraDCTF_Novo.spbManutencaoDcompClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  RegAtual1 := Nil;
  RegAtual2 := Nil;
  Screen.Cursor := crAppStart;
  frmCadDCTF_DCOMP := TfrmCadDCTF_DCOMP.Create(Self);

  frmCadDCTF_DCOMP.CarregaMovDCOMP(
    qryDCTFGeradas.fieldbyname('IDDCTF').AsInteger,
    qryDCTFDetCreditos.fieldbyname('IDDCTFCRDETALHE').AsInteger,
    qryDCTFMovSintetico.fieldbyname('CODNATUREZA').AsString,
    qryDadosAdicionais.fieldbyname('CNPJFUNDACAO').AsString,
    qryDCTFGeradas.fieldbyname('DATAINICIOAPURACAO').AsDateTime,
    qryDCTFGeradas.fieldbyname('DATAFIMAPURACAO').AsDateTime,
    qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull);

  frmCadDCTF_DCOMP.ShowModal;
  Screen.cursor := crDefault;

  If frmCadDCTF_DCOMP.bModificou Then
  Begin
    Cursor := crSQLWait;
    qryDCTFDetCreditos.DisableControls;
    RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual

    qryDCTFDetCreditos.Close;
    qryDCTFDetCreditos.Open;
    If Not qryDCTFDetCreditos.isEmpty Then
      RegAtual2 := qryDCTFDetCreditos.GetBookmark; // Salvando o ponteiro do Registro atual

    qryDCTFMovSintetico.Close;
    qryDCTFMovSintetico.Open;
    qryTotalDCTFDetCRDARF.Close;
    qryTotalDCTFDetCRDARF.Open;
    qryTotalDCTFDetCRDJE.Close;
    qryTotalDCTFDetCRDJE.Open;
    qryTotalDCTFDetCRDCOMP.Close;
    qryTotalDCTFDetCRDCOMP.Open;
    qryTotConcIndiv.Close;
    qryTotConcIndiv.Open;

    RegAtual2 := qryDCTFDetCreditos.GetBookmark;  // Salvando o ponteiro do Registro atual

    If RegAtual1 <> Nil Then
      qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
    If RegAtual2 <> Nil Then
      qryDCTFDetCreditos.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

    qryDCTFDetCreditos.EnableControls;
    Cursor := crDefault;
  End;

  FreeAndNil(frmCadDCTF_DCOMP);
End;

Procedure TfrmGeraDCTF_Novo.qryDCTFDetCreditosAfterScroll(DataSet: TDataSet);
Begin
  meQtdCR.Caption := Format('Registro %.2d de %.2d', [qryDCTFDetCreditos.RecNo, qryDCTFDetCreditos.RecordCount]);
  If Length(Trim(qryDCTFDetCreditosNUMDOCUMENTO.asString)) = 11 Then
    qryDCTFDetCreditosNUMDOCUMENTO.EditMask := '999.999.999\-99;0; '
  Else
    qryDCTFDetCreditosNUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0; ';   // Paulo Nobre - WO34233
End;

Procedure TfrmGeraDCTF_Novo.dbgConcilDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDCTFConciliaIndivCPF.isEmpty Then
  Begin
    If (Field.Name = 'qryDCTFConciliaIndivCPFDSCTIPOMOV') Or
      (Field.Name = 'qryDCTFConciliaIndivCPFVLRDIF') Then
      dbgConcil.Canvas.Font.Style := [fsbold];

    If (Field.Name = 'qryDCTFConciliaIndivCPFVLRDIF') Then
    Begin
      dbgConcil.Canvas.Font.Style := [];
      If qryDCTFConciliaIndivCPF.FieldByName('VLRDIF').asFloat < 0.00 Then
        dbgConcil.Canvas.Font.Color := clRed;
    End;

    dbgConcil.DefaultDrawDataCell(Rect, Field, State);
  End;
End;

Procedure TfrmGeraDCTF_Novo.SpeedButton4Click(Sender: TObject);
Begin
  If Not qryDCTFConciliaIndivCPF.isEmpty Then
  Begin
    qeDCTFConciliaIndivCPF.Execute;
    qryDCTFConciliaIndivCPF.first;
  End;
End;

Procedure TfrmGeraDCTF_Novo.qryDCTFConciliaIndivCPFAfterScroll(DataSet: TDataSet);
Begin
  meQtdConc.Caption := Format('Registro %.2d de %.2d', [qryDCTFConciliaIndivCPF.RecNo, qryDCTFConciliaIndivCPF.RecordCount]);

  If Length(Trim(qryDCTFConciliaIndivCPFNUMDOCUMENTO.asString)) = 11 Then
    qryDCTFConciliaIndivCPFNUMDOCUMENTO.EditMask := '999.999.999\-99;0; '
  Else
    qryDCTFConciliaIndivCPFNUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0; ';   // Paulo Nobre - WO34233
End;

Procedure TfrmGeraDCTF_Novo.spbManutencaoDJEClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  RegAtual1 := Nil;
  RegAtual2 := Nil;
  Screen.Cursor := crAppStart;
  frmCadDCTF_DJE := TfrmCadDCTF_DJE.Create(Self);

  frmCadDCTF_DJE.CarregaMovDJE(
    qryDCTFGeradas.fieldbyname('IDDCTF').AsInteger,
    qryDCTFDetCreditos.fieldbyname('IDDCTFCRDETALHE').AsInteger,
    qryDCTFMovSintetico.fieldbyname('CODNATUREZA').AsString,
    qryDadosAdicionais.fieldbyname('CNPJFUNDACAO').AsString,
    qryDCTFGeradas.fieldbyname('DATAINICIOAPURACAO').AsDateTime,
    qryDCTFGeradas.fieldbyname('DATAFIMAPURACAO').AsDateTime,
    qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull);

  frmCadDCTF_DJE.ShowModal;
  Screen.cursor := crDefault;

  If frmCadDCTF_DJE.bModificou Then
  Begin
    Cursor := crSQLWait;
    qryDCTFDetCreditos.DisableControls;
    RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual
    qryDCTFDetCreditos.Close;
    qryDCTFDetCreditos.Open;
    If Not qryDCTFDetCreditos.isEmpty Then
      RegAtual2 := qryDCTFDetCreditos.GetBookmark; // Salvando o ponteiro do Registro atual

    qryTotalDCTFDetCRDARF.Close;
    qryTotalDCTFDetCRDARF.Open;
    qryTotalDCTFDetCRDJE.Close;
    qryTotalDCTFDetCRDJE.Open;
    qryTotalDCTFDetCRDCOMP.Close;
    qryTotalDCTFDetCRDCOMP.Open;
    qryTotConcIndiv.Close;
    qryTotConcIndiv.Open;
    qryDCTFMovSintetico.Close;
    qryDCTFMovSintetico.Open;

    If RegAtual1 <> Nil Then
      qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
    If RegAtual2 <> Nil Then
      qryDCTFDetCreditos.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

    qryDCTFDetCreditos.EnableControls;
    Cursor := crDefault;
  End;

  FreeAndNil(frmCadDCTF_DJE);
End;

Procedure TfrmGeraDCTF_Novo.bbtnAjudaClick(Sender: TObject);
Begin
  If FileExists('C:\PLANUS\TEMP\DCTF\DCTFMensal31.CHM') Then
    ShellExecute(0, Nil, 'C:\PLANUS\TEMP\DCTF\DCTFMensal31.CHM', Nil, Nil, SW_SHOWMAXIMIZED);
End;

Procedure TfrmGeraDCTF_Novo.DesfazFiltragens1Click(Sender: TObject);
Begin
  Cursor := crSQLWait;
  qryDCTFDetDebitos.Filtered := False;
  qryDCTFDetDebitos.Filter := 'TIPOMOV <> ''-1'' '; // Macete só para desfazer
  qryDCTFDetDebitos.Filtered := True;
  Cursor := crDefault;
End;

Procedure TfrmGeraDCTF_Novo.FiltraFolhaEmpregados1Click(Sender: TObject);
Begin
  If qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '0561' Then
  Begin
    Cursor := crSQLWait;
    qryDCTFDetDebitos.Filtered := False;
    qryDCTFDetDebitos.Filter := 'TIPOMOV = ''0'''; // Folha Empregados
    qryDCTFDetDebitos.Filtered := True;
    Cursor := crDefault;
  End;
End;

Procedure TfrmGeraDCTF_Novo.FiltraFolhaBeneficirios1Click(Sender: TObject);
Begin
  If qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '0561' Then
  Begin
    Cursor := crSQLWait;
    qryDCTFDetDebitos.Filtered := False;
    qryDCTFDetDebitos.Filter := 'TIPOMOV = ''1'''; // Folha Benefícios
    qryDCTFDetDebitos.Filtered := True;
    Cursor := crDefault;
  End;
End;

Procedure TfrmGeraDCTF_Novo.spbAcertaProcessosClick(Sender: TObject);
Var tArquivo: TextFile;
  sValorCampo: TStringlist;
  sLinha, sCPF, sProcJud: String;
  iContador, iQtd, iQtdOk: Integer;
Begin
  If qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull Then
  Begin
    If Application.MessageBox('Confirma atualização dos Processos Judiciais ? ', 'Atenção !', MB_ICONQUESTION + MB_YESNO + +MB_DEFBUTTON2) = IDYES Then
    Begin
      // SOL 232145 Kintana 385264 - Paulo Nobre
      // SOL 230353 - Kintana 352271 - Paulo Nobre
      // Rotina para ajustar os números de Processos a serem usados pela RF
      // com os números de Processo corretos passados no arquivo ArqAcertoProcs.csv.
      If FileExists('c:\planus\temp\DCTF\ArqAcertoProcs.csv') Then
      Begin
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        Cursor := crSQLWait;
        sValorCampo := TStringList.Create;

        // Lendo o arquivo
        AssignFile(tArquivo, 'c:\planus\temp\DCTF\ArqAcertoProcs.csv');

        // Contando a quantidade de registros
        Reset(tArquivo);
        iQtd := 0;
        While Not EOF(tArquivo) Do
        Begin
          Readln(tArquivo, sLinha);               // Lendo uma linha
          inc(iQtd);
        End;

        Reset(tArquivo);
        iContador := 0;
        iQtdOk := 0;
        Label18.caption := inttostr(iQtdOk);
        frmProgresso.MostraFormProgresso('Atualizando os Processos Judiciais...', True, True, True, 0, iQtd);
        // Começando a leitura das linhas
        While Not EOF(tArquivo) Do
        Begin
          sValorCampo.clear;
          Readln(tArquivo, sLinha);               // Lendo uma linha
          ExtractStrings([';'], [], pchar(sLinha), sValorCampo); // Extraindo o valor de cada campo e guardando numa stringlist

          Try
            If (sValorCampo[0] <> '') And (sValorCampo[1] <> '') Then
              If oDCTF.ChecaSeNumero(oDCTF.Tiramascara(sValorCampo[0])) Then
              Begin
                inc(iContador);
                frmProgresso.AndaFormProgresso(iContador);
                Application.ProcessMessages;
                frmProgresso.Repaint;

                If frmProgresso.Cancelou Then
                  Break;

                // Assegurando que o CPF tenha os ZEROS a esquerda
                sCPF := quotedstr(strzero(11, TRIM(sValorCampo[0]))); //quotedstr(copy(floattostr(100000000000 + strtofloat(oDCTF.Tiramascara(sValorCampo[0]))), 2, 11));
                sProcJUD := quotedstr(oDCTF.Tiramascara(sValorCampo[1]));

                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('UPDATE DCTF_DARFDETALHE T SET T.NUMEROPROCJUDICIAL = ' + sProcJUD);
                qryAux.SQL.add('WHERE T.IDDCTF = ' + qryDCTFGeradas.fieldbyname('IDDCTF').asString);
                qryAux.SQL.add('      AND TRIM(T.NUMDOCUMENTO) = ' + sCPF);
                qryAux.ExecSql;
                If qryAux.RowsAffected > 0 Then
                Begin
                  inc(iQtdOk);
                  Label18.caption := inttostr(iQtdOk);
                End;
              End;
          Except
          End;
        End;

        CloseFile(tArquivo);

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        Cursor := crDefault;
        frmProgresso.EscondeFormProgresso;
        freeandnil(sValorCampo);
      End
      Else
        Application.MessageBox('Arquivo "ArqAcertoProcs.csv" não localizado em -> "c:\planus\temp\DCTF\". Verifique !', 'Atenção !', Mb_IconExclamation);
    End;
  End
  Else
    Application.MessageBox(MSG032, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDCTF_Novo.AjustaLANCIRRF_Sem_DARF;
Var iUltDia: Integer;
  sDecendio1i, sDecendio1f, sDecendio2i, sDecendio2f, sDecendio3i, sDecendio3f: String;
Begin
  // Rotina (macete) para corrigir lançamentos de IOF encontrados na LANCIRRF que estão sem um (DARF - IDDARF) associado
  // Esta distorção é causada por um processo que é rodado via script (autorizado pelos Gestores) e feito pela COSIS.
  // Este procedimento está totalmente fora das normas e não era para acontecer !!!
  // Esta rotina será executada antes de se gerar a DCTF.
  Cursor := crSQLWait;
  qryAux2.Close;
  qryAux2.SQL.Clear;
  qryAux2.SQL.add('SELECT L.IDDARF             ');
  qryAux2.SQL.add('FROM LANCIRRF L             ');
  qryAux2.SQL.add('WHERE L.IDDARF IS NULL      ');
  qryAux2.SQL.add('     AND L.DATALANCAMENTO BETWEEN ' + quotedstr(dtInicio.Text) + ' AND ' + quotedstr(dtFim.Text));
  qryAux2.SQL.add('     AND L.CODNATUREZA = ''7893''  '); // Folhas e IOF
  qryAux2.SQL.add('     AND L.VLRIOF <> 0             ');
  qryAux2.Open;
  If Not qryAux2.EOF Then
  Begin
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    sDecendio1i := quotedstr('01/' + StrZero(2, IntToStr(cbMesCompetencia.ItemIndex + 1)) + '/' + edAnoCalendario.Text);
    sDecendio1f := quotedstr('10/' + StrZero(2, IntToStr(cbMesCompetencia.ItemIndex + 1)) + '/' + edAnoCalendario.Text);
    sDecendio2i := quotedstr('11/' + StrZero(2, IntToStr(cbMesCompetencia.ItemIndex + 1)) + '/' + edAnoCalendario.Text);
    sDecendio2f := quotedstr('20/' + StrZero(2, IntToStr(cbMesCompetencia.ItemIndex + 1)) + '/' + edAnoCalendario.Text);
    sDecendio3i := quotedstr('21/' + StrZero(2, IntToStr(cbMesCompetencia.ItemIndex + 1)) + '/' + edAnoCalendario.Text);
    iUltDia := TrazUltDiaMes((cbMesCompetencia.ItemIndex + 1), StrToInt(edAnoCalendario.Text));
    sDecendio3f := quotedstr(StrZero(2, IntToStr(iUltDia)) + '/' + StrZero(2, IntToStr(cbMesCompetencia.ItemIndex + 1)) + '/' + edAnoCalendario.Text);

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.add('UPDATE LANCIRRF L SET L.IDDARF = (SELECT D.IDDARF FROM DARF D  ');
    qryAux.SQL.add('                                  WHERE D.DATAINIAPURACAO >= ' + sDecendio1i + ' AND D.DATAFINALAPURACAO <= ' + sDecendio1f);
    qryAux.SQL.add('                                        AND  D.CODNATUREZA = ''7893''  ) ');
    qryAux.SQL.add('WHERE L.IDDARF IS NULL   ');
    qryAux.SQL.add('      AND L.DATALANCAMENTO BETWEEN ' + quotedstr(dtInicio.Text) + ' AND ' + quotedstr(dtFim.Text));
    qryAux.SQL.add('      AND L.CODNATUREZA = ''7893''  '); // IOF
    qryAux.SQL.add('      AND L.VLRIOF <> 0             ');
    qryAux.ExecSql;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.add('UPDATE LANCIRRF L SET L.IDDARF = (SELECT D.IDDARF FROM DARF D  ');
    qryAux.SQL.add('                                  WHERE D.DATAINIAPURACAO >= ' + sDecendio2i + ' AND D.DATAFINALAPURACAO <= ' + sDecendio2f);
    qryAux.SQL.add('                                        AND  D.CODNATUREZA = ''7893'' ) ');
    qryAux.SQL.add('WHERE L.IDDARF IS NULL   ');
    qryAux.SQL.add('      AND L.DATALANCAMENTO BETWEEN ' + quotedstr(dtInicio.Text) + ' AND ' + quotedstr(dtFim.Text));
    qryAux.SQL.add('      AND L.CODNATUREZA = ''7893''  '); // IOF
    qryAux.SQL.add('      AND L.VLRIOF <> 0             ');
    qryAux.ExecSql;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.add('UPDATE LANCIRRF L SET L.IDDARF = (SELECT D.IDDARF FROM DARF D  ');
    qryAux.SQL.add('                                  WHERE D.DATAINIAPURACAO >= ' + sDecendio3i + ' AND D.DATAFINALAPURACAO <= ' + sDecendio3f);
    qryAux.SQL.add('                                        AND  D.CODNATUREZA = ''7893'' ) ');
    qryAux.SQL.add('WHERE L.IDDARF IS NULL   ');
    qryAux.SQL.add('      AND L.DATALANCAMENTO BETWEEN ' + quotedstr(dtInicio.Text) + ' AND ' + quotedstr(dtFim.Text));
    qryAux.SQL.add('      AND L.CODNATUREZA = ''7893''  '); // IOF
    qryAux.SQL.add('      AND L.VLRIOF <> 0             ');
    qryAux.ExecSql;

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
  End;
  Cursor := crDefault;
  qryAux2.Close;
End;

Procedure TfrmGeraDCTF_Novo.SpeedButton2Click(Sender: TObject);
Begin
  If Not qryDCTFMovSintetico.isEmpty Then
  Begin
    qeDCTFMovSint.Execute;
    qryDCTFMovSintetico.First;
  End;
End;

Procedure TfrmGeraDCTF_Novo.SpeedButton3Click(Sender: TObject);
Begin
  WinExec('Calc.Exe', SW_Show);
End;

Procedure TfrmGeraDCTF_Novo.spbImportarDBsClick(Sender: TObject);
Var tArquivo: TextFile;
  sSql, sPathArquivo, sLinha, sCodNat, sCodNatAssoc, sDocumento, sNome, sValor: String;
  sValorCampo: TStringlist;
  RegAtual1: TBookMark;
Begin
  If (Not qryDCTFDetDebitos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull) Then
  Begin
    // Paulo Nobre - SOL 249454 PPM 703267 26/01/2015
    If Application.MessageBox(pchar('O Arquivo texto deve ter conter as colunas abaixo, separadas por ";": ' + #13 +
      '[COD.NATUREZA] (Como texto)' + #13 +
      '[COD.NATUREZA ASSOCIADA] (Como texto, e c/ valor ZERO se inexistente)' + #13 +
      '[CPF/CNPJ] (Como texto e sem máscara)' + #13 +
      '[NOME] (Sem caracteres especias, acentos e etc)' + #13 +
      '[VALOR DO TRIBUTO] (Ex.: 100,48)' + #13 + #13 +
      'Exemplo do conteúdo: 0561;0;12345678901234;PAPELARIA ABC;30,2' + #13 + #13 +

      'Confirma Importação ? '), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
    Begin
      sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\DCTF';
      dlgAbreArquivo.InitialDir := sPathArquivo;
      If dlgAbreArquivo.Execute Then
        If uppercase(dlgAbreArquivo.FileName) <> '' Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Cursor := crSQLWait;
            qryDCTFMovSintetico.DisableControls;
            qryDCTFDetDebitos.DisableControls;

            sValorCampo := TStringList.Create;
            // Lendo o arquivo
            AssignFile(tArquivo, dlgAbreArquivo.FileName);
            Reset(tArquivo);
            While Not EOF(tArquivo) Do
            Begin
              sValorCampo.clear;
              Readln(tArquivo, sLinha);           // Lendo linha dos dados
              ExtractStrings([';'], [], pchar(sLinha), sValorCampo); // Extraindo o valor de cada campo e guardando numa stringlist

              If Not oDCTF.ChecaSeNumero(sValorCampo[0]) Then
              Begin
                Application.MessageBox('Arquivo com dados inválidos no cabeçalho. Verifique !', 'Atenção !', Mb_IconExclamation);
                Exit;
              End;

              sCodNat := quotedstr(strzero(4, TRIM(sValorCampo[0]))); //copy(inttostr(10000 + strtoint(TRIM(sValorCampo[0]))), 2, 4);
              sCodNatAssoc := strzero(4, TRIM(sValorCampo[1])); //copy(inttostr(10000 + strtoint(TRIM(sValorCampo[1]))), 2, 4);
              If length(sValorCampo[2]) = 11 Then // CPF
                sDocumento := quotedstr(strzero(11, TRIM(sValorCampo[2])))
              Else                                // CNPJ
                sDocumento := quotedstr(strzero(14, TRIM(sValorCampo[2])));
              sNome := quotedstr(UPPERCASE(TRIM(sValorCampo[3])));
              sValor := Float2String(StringToFloat(sValorCampo[4]));

              If (sCodNat <> '') And (sDocumento <> '') And (sNome <> '') And (sValor <> '') Then
              Begin
                sSql := 'INSERT INTO DCTF_DEBITODETALHE               ';
                sSql := sSql + 'SELECT ' + qryDCTFMovSintetico.FieldByName('IDDCTF').AsString + ',';
                sSql := sSql + '      SEQDCTF_DEBITODETALHE.NEXTVAL, '; // IDDCTFDBDETALHE
                sSql := sSql + '      9,              '; // TIPOMOV - Acerto Mov.
                sSql := sSql + '      ' + sCodNat + ','; // CODNATUREZA
                If sCodNatAssoc = '0000' Then
                  sSql := sSql + '   NULL,         ' // CODNATUASSOCIADA
                Else
                  sSql := sSql + '   ' + quotedstr(sCodNatAssoc) + ','; // CODNATUASSOCIADA
                sSql := sSql + '      NULL,  ';
                sSql := sSql + '      NULL,  ';
                sSql := sSql + '      NULL,  ';
                sSql := sSql + '      NULL,  ';
                sSql := sSql + '      NULL,  ';
                sSql := sSql + '      NULL,  ';
                sSql := sSql + '      NULL,  ';
                sSql := sSql + '      ' + sDocumento + ','; // CPF/CNPJ
                sSql := sSql + '      ' + sNome + ','; // NOME
                sSql := sSql + '      ' + sValor + ',';
                sSql := sSql + '      ''S''  ';   // FLGMARCADO
                //William Moreira da Silva - SIG 30071
                sSql := sSql + '      ,NULL   ';  // DATAAPURACAO
                //William Moreira da Silva - SIG 30071
                sSql := sSql + 'FROM DUAL  ';

                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.text := sSql;
                qryAux.ExecSQL;
              End;
            End;

            CloseFile(tArquivo);

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual

            qryDCTFDetDebitos.Close;
            qryDCTFDetDebitos.Open;
            qryDCTFMovSintetico.Close;
            qryDCTFMovSintetico.Open;

            If RegAtual1 <> Nil Then
              qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual

            Screen.Cursor := crDefault;
            qryDCTFMovSintetico.EnableControls;
            qryDCTFDetDebitos.EnableControls;
            freeandnil(sValorCampo);
            Application.MessageBox(MSG033, 'Atenção !', Mb_IconExclamation);
          Except
            // Paulo Nobre - SIG 49047
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;
            Raise Exception.create('Problemas na leitura do Arquivo');
          End
        End
        Else
          Application.MessageBox(MSG035, 'Atenção !', Mb_IconExclamation);
    End;
  End
  Else
    Application.MessageBox(MSG032, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDCTF_Novo.spbExcluirDBsImportadosClick(Sender: TObject);
Var RegAtual1: TBookMark;
Begin
  If (Not qryDCTFDetDebitos.isEmpty) And (qryDCTFGeradas.fieldbyname('NUMRECIBO').isNull) Then
  Begin
    If qryDCTFDetDebitos.fieldByname('TIPOMOV').asString = '9' Then // Só apaga os Importados
    Begin
      // Paulo Nobre - SIG 49047 - Inicio
      Try
        Screen.Cursor := crSQLWait;
        qryDCTFMovSintetico.DisableControls;
        qryDCTFDetDebitos.DisableControls;

        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.add('DELETE FROM DCTF_DEBITODETALHE   ');
        qryAux.SQL.add('WHERE IDDCTFDBDETALHE = ' + qryDCTFDetDebitos.fieldByname('IDDCTFDBDETALHE').asString);
        qryAux.SQL.add('      AND TIPOMOV = ''9''        '); // Ajustes Mov.
        qryAux.ExecSQL;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        RegAtual1 := qryDCTFMovSintetico.GetBookmark; // Salvando o ponteiro do Registro atual

        qryDCTFDetDebitos.Close;
        qryDCTFDetDebitos.Open;
        qryDCTFMovSintetico.Close;
        qryDCTFMovSintetico.Open;

        If RegAtual1 <> Nil Then
          qryDCTFMovSintetico.GotoBookmark(RegAtual1); // Voltando ao Reg. atual

      Except
        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Rollback;
      End;

      Screen.Cursor := crDefault;
      qryDCTFMovSintetico.EnableControls;
      qryDCTFDetDebitos.EnableControls;
      // Paulo Nobre - SIG 49047 - Fim
    End
    Else
      Application.MessageBox(MSG034, 'Atenção !', Mb_IconExclamation);
  End
  Else
    Application.MessageBox(MSG032, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDCTF_Novo.qryDCTFMovSinteticoAfterScroll(DataSet: TDataSet);
Begin
  qryDCTFGeradasAfterScroll(qryDCTFGeradas);
  meAvisoDARFAusente.visible := ((qryDCTFConciliaIndivCPF.fieldbyname('VALORCR').asFloat = 0.00) And (Not qryDCTFConciliaIndivCPF.isEmpty));
  {   spbManutencaoDJE.Enabled := ((qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '3540') Or
        (qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '4574') Or
        (qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString = '7987'));

     spbManutencaoDARF.Enabled := ((qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString <> '3540') And
        (qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString <> '4574') And
        (qryDCTFMovSintetico.fieldbyname('CODNATUREZA').asString <> '7987'));}
End;

Procedure TfrmGeraDCTF_Novo.cbSituacaoPJChange(Sender: TObject);
Begin
  // SOL 235337/16319 PPM 457199 - Paulo Nobre
  If cbSituacaoPJ.itemindex = 4 Then              // PJ Não se enquadra
    If cbMesCompetencia.Itemindex = 0 Then        // Janeiro
      cbCritRecon.itemindex := 4                  // Não se aplica
    Else
      cbCritRecon.itemindex := 5;                 // Sem alteração do regime
End;

Procedure TfrmGeraDCTF_Novo.dbgConcilRowChanged(Sender: TObject);
Begin
  meAvisoDARFAusente.visible := ((qryDCTFConciliaIndivCPF.fieldbyname('VALORCR').asFloat = 0.00) And (Not qryDCTFConciliaIndivCPF.isEmpty));
End;

Procedure TfrmGeraDCTF_Novo.spbAtuObsDCTFClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  Try
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    Screen.Cursor := crSQLWait;
    qryDCTFGeradas.DisableControls;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.add('UPDATE DCTF SET          ');
    qryAux.SQL.add(' OBS =:p1 ');
    //Higor Nayde SOL 258183/17609 pmm 1000747
    //    qryAux.SQL.add('OBS_DCTF =:p1            ');
    qryAux.SQL.add('WHERE IDDCTF = ' + qryDCTFGeradas.fieldByname('IDDCTF').asString);
    qryAux.ParamByName('p1').asstring := meObsDCTF.text;
    //Higor Nayde SOL 258183/17609 pmm 1000747
    qryAux.ExecSQL;

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;

  Except
    On E: Exception Do
    Begin
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;

      Application.MessageBox(PChar(E.Message), 'Atenção !', Mb_IconExclamation);
    End;
  End;

  RegAtual := qryDCTFGeradas.GetBookmark;         // Salvando o ponteiro do Registro

  qryDCTFGeradas.Close;
  qryDCTFGeradas.Open;

  If RegAtual <> Nil Then
    qryDCTFGeradas.GotoBookmark(RegAtual);        // Voltando ao Reg. atual

  Screen.Cursor := crDefault;
  qryDCTFGeradas.EnableControls;
End;

Procedure TfrmGeraDCTF_Novo.btnLimparClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  Try
    //Higor Nayde SOL 258183/17609 pmm 1000747
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    Screen.Cursor := crSQLWait;
    qryDCTFGeradas.DisableControls;
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.add('UPDATE DCTF SET          ');
    qryAux.SQL.add(' OBS =:p1 ');
    //    qryAux.SQL.add('OBS_DCTF =:p1            ');
    qryAux.SQL.add('WHERE IDDCTF = ' + qryDCTFGeradas.fieldByname('IDDCTF').asString);
    qryAux.ParamByName('p1').asstring := '';
    qryAux.ExecSQL;

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;

  Except
    On E: Exception Do
    Begin
      If dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.Rollback;

      Application.MessageBox(PChar(E.Message), 'Atenção !', Mb_IconExclamation);
    End;
  End;

  RegAtual := qryDCTFGeradas.GetBookmark;         // Salvando o ponteiro do Registro

  qryDCTFGeradas.Close;
  qryDCTFGeradas.Open;

  If RegAtual <> Nil Then
    qryDCTFGeradas.GotoBookmark(RegAtual);        // Voltando ao Reg. atual

  Screen.Cursor := crDefault;
  qryDCTFGeradas.EnableControls;
  //Higor Nayde SOL 258183/17609 pmm 1000747
End;

Procedure TfrmGeraDCTF_Novo.FormKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
  // Paulo Nobre - SIG 49047 - Inicio
  If key = VK_F5 Then
  Begin
    frmAguarde.Mostra('Atualizando as DCTF Geradas...');

    CarregaMovimentoDCTF(-1, dbAnoExercicioFiltro.Text);

    frmAguarde.Apaga;
  End;
  // Paulo Nobre - SIG 49047 - Fim
End;

Procedure TfrmGeraDCTF_Novo.chkPJInativaClick(Sender: TObject);
Begin
  //SIG 48772 - Início
  //Caso o campo chkPJInativa seja "marcado", desabilitar os campos; caso contrário habilitá-los.
  If chkPJInativa.Checked = true Then
  Begin
    iFlgInativa := 1;
    cbLucro.ItemIndex := -1;
    cbLucro.Enabled := False;
    cbCritRecon.ItemIndex := -1;
    cbCritRecon.Enabled := False;
    cbQualificacao.ItemIndex := 7;
    cbSituacaoPJ.ItemIndex := -1;
    cbRegimeApur.ItemIndex := -1;
    cbRegimeApur.Enabled := False;
    cbOpcoesLEI.ItemIndex := -1;
    cbOpcoesLEI.Enabled := False;
    chkCPRB.Checked := False;
    chkCPRB.Enabled := False;
    chkDebSCP.Checked := False;
    chkDebSCP.Enabled := False;
    chkSimplesNac.Checked := False;
    chkSimplesNac.Enabled := False;
    chkSusp.Checked := False;
    chkSusp.Enabled := False;
  End
  Else
  Begin
    iFlgInativa := 0;
    cbLucro.Enabled := True;
    cbCritRecon.Enabled := True;
    cbRegimeApur.Enabled := True;
    cbOpcoesLEI.Enabled := True;
    chkCPRB.Enabled := True;
    chkDebSCP.Enabled := True;
    chkSimplesNac.Enabled := True;
    chkSusp.Enabled := True;
  End;
  //SIG 48772 - Fim
End;

Procedure TfrmGeraDCTF_Novo.chkSimplesNacClick(Sender: TObject);
Begin
  //SIG 48772 - Início
  //Caso o campo chkPJInativa seja "marcado", desabilitar os campos; caso contrário habilitá-los.
  If chkSimplesNac.Checked = true Then
  Begin
    iOptSimples := 1;
    cbLucro.ItemIndex := -1;
    cbLucro.Enabled := False;
    cbCritRecon.ItemIndex := -1;
    cbCritRecon.Enabled := False;
    cbQualificacao.ItemIndex := 7;
    cbQualificacao.Enabled := False;
    cbSituacaoPJ.ItemIndex := -1;
    cbRegimeApur.ItemIndex := -1;
    cbRegimeApur.Enabled := False;
    cbOpcoesLEI.ItemIndex := -1;
    cbOpcoesLEI.Enabled := False;
    chkCPRB.Checked := True;
    chkCPRB.Enabled := False;
    chkDebSCP.Checked := False;
    chkDebSCP.Enabled := False;
    chkSusp.Checked := False;
    chkSusp.Enabled := False;
    chkPJInativa.Checked := False;
    chkPJInativa.Enabled := False;
  End
  Else
  Begin
    iOptSimples := 0;
    cbLucro.Enabled := True;
    cbCritRecon.Enabled := True;
    cbRegimeApur.Enabled := True;
    cbOpcoesLEI.Enabled := True;
    cbQualificacao.Enabled := True;
    chkCPRB.Enabled := True;
    chkCPRB.Checked := False;
    chkDebSCP.Enabled := True;
    chkSusp.Enabled := True;
    chkPJInativa.Enabled := True;
  End;
  //SIG 48772 - Fim
End;

Procedure TfrmGeraDCTF_Novo.chkSuspClick(Sender: TObject);
Begin
  //SIG 48772 - Início
  If chkSusp.Checked = True Then
    iFlgSusp := 1
  Else
    iFlgSusp := 0;
  //SIG 48772 - Fim
End;

Procedure TfrmGeraDCTF_Novo.chkDebSCPClick(Sender: TObject);
Begin
  //SIG 48772 - Início
  If chkDebSCP.Checked = True Then
    iFlgDebSCP := 1
  Else
    iFlgDebSCP := 0;
  //SIG 48772 - Fim
End;

Procedure TfrmGeraDCTF_Novo.chkCPRBClick(Sender: TObject);
Begin
  //SIG 48772 - Início
  If chkCPRB.Checked = True Then
    iOptCPRB := 1
  Else
    iOptCPRB := 0;
  //SIG 48772 - Fim
End;

// Marcos Lima SIG136949 - Inicio
Function TfrmGeraDCTF_Novo.ValidaVigenciaMaio2023(pMes: Integer; pAno: String): Boolean;
Begin
  pAno := Trim(pAno);
  If (pAno = 'Todos') Or (pAno = EmpTyStr) Then
    Result := False
  Else
  Begin
    Result := (pMes >= 4) And (StrToInt(pAno) >= 2023); // pMes >= 4 corresponde ao index do campo cbMesCompetencia = 'Maio'
  End;
End;
// Marcos Lima SIG136949 - Fim

End.

