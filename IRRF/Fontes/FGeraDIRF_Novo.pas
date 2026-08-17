//******************************************************************************
// N. Chamado....: WO34233
// Dt Alteração..: 18/03/2026
// Responsável...: Paulo Nobre
// Descrição.....: PROJETO CNPJ ALFANUMÉRICO
//                 .Ajustando o padrão da mascara atual do CNPJ para
//                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.  (form e .dfm)
//******************************************************************************
//Rotina.............: spbGeraArquivoDIRFClick
//N. SIG.............: 124014
//Data da Alteração..: 16/03/2022
//Responsável........: Edilaine
//Descrição..........: Preenchimento incorreto para gerar DIRF anos anteriores CP
//***************************************************************************************
//N. SIG.............: 122787
//Data da Alteração..: 14/03/2022
//Responsável........: Ewerton Beltramini
//Descrição..........: Implementação do novo modelo do Comprovante Anual de Rendimentos.
//***************************************************************************************
//Rotina.............: FormShow
//N. SIG.............: 119889
//Data da Alteração..: 12/11/2021
//Responsável........: Edilaine
//Descrição..........: melhora na performance de abertura da tela
//***************************************************************************************
//Rotina.............: FormShow, AjustaAnoExercicio, spbGerarDIRFClick
//N. SIG.............: 113911
//Data da Alteração..: 04/10/2021
//Alteração Form.....: FGeraDIRF_Novo
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão do código de versão do arquivo DIRF na interface.
//***************************************************************************************
//N. SIG.............: 81493
//Data da Alteração..: 13/02/2019
//Alteração Form.....: FGeraDIRF_Novo
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Retirada dos arquivos de configuração na geração das exportações.
//***************************************************************************************
//Rotina                :
//N. SIG..........      : SIG TIBERO
//Data da Alteração:    : 05/06/2018
//Alteração Form:       : qryDIRFMovSintCNPJMensal (.DFM)   
//Responsável:          : Everson Luiz Pereira da Cunha
//Descrição.......      : Retirada do 'NLS_DATE_LANGUAGE = portuguese' da query
//***************************************************************************************
//Rotina                : ListaTotalDependentesPlanos, InserirDIRF_DadosAdicionais_O,
//                        InserirDIRF_DadosAdicionais_R, ListaDIRF_MovSintFF, Exporta
//N. SIG..........      : 64340
//Data da Alteração:    : 02/03/2018
//Alteração Form:       : uCtrlGeraDIRF_Novo
//Responsável:          : Cássio Florêncio Rovaroto
//Descrição.......      : Alteração para a DIRF 2017, fazendo a quebra dos lançamentos de
//                        saúde para dois planos diferentes.
//***************************************************************************************
//Rotina                : FormClose, SelReport, SelDados, ImprimeInformeRendimentosPJ
//N. SIG..........      : 41768
//Data da Alteração:    : 22/08/2017
//Alteração Form:       : Novo relatorio
//Responsável:          : Andre Imakawa
//Descrição.......      : Impressão relatorio para natureza 0588.
//****************************************************************************************
//Rotina                : CarregaMovimentoDIRF, dbgGridMovTribFFRowChanged,
//                        dbgGridMovTribFFRowChanged,_TotalizaColunaBenefPA
//N. SIG..........      : 34459
//Data da Alteração:    : 25/01/2017
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão de uma nova aba "Beneficiários de Pensão Alimenticia" para
//                        abrigar os dados destes Beneficiários.
//****************************************************************************************
//Rotina                : qryDIRFMovDetCNPJ inclusão de join com tabela DOCUMENTO
//N. SIG..........      : 23598
//Data da Alteração:    : 27/07/2016
//Alteração Form:       : frmGeraDIRF_Novo
//Responsável:          : Darivaldo Alencar
//Descrição.......      : Inclusão do Campo OBS da tabela DOCUMENTO na tbsContasaPagar
//***************************************************************************************
//Rotina                : Exporta
//N. Sol..........      : 252107
//N. PPM..........      : 780490
//Data da Alteração:    : 09/04/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Colocando proteção para quando for gerar o arquivo
//                        do CP não gerar automaticamante os lançamentos dos Planos de
//                        assistência e sim ficar condicionado a decisão do Gestor da
//                        Contabilidade na msg: "Gera o arquivo do Contas a Pagar sem
//                        estes movimentos ?"
//                        Corrigindo a importação do arquivo texto.
//***************************************************************************************
//Rotina                : qryDIRFMovDetFFAfterScroll
//N. Sol..........      : 247807
//N. PPM..........      : 703438
//Data da Alteração:    : 26/02/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Liberando os valores para a edição de acordo com os CODDIRF corretos
//***************************************************************************************
//Rotina                : spbGeraArquivoDIRFClick
//N. Sol..........      : 246475
//N. PPM..........      : 636290
//Data da Alteração:    : 14/01/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertando os anos de referência e competência na geração do Arquivo
//***************************************************************************************
//Rotina                : VerificaSeUsuarioEstaNoGrupo, AjustaAbasComGrupoUsuario
//N. Sol..........      : 244016
//N. PPM..........      : 595531
//Data da Alteração:    : 28/11/2014
//Alteração Form:       : FGeraDIRF_Novo
//Responsável:          : Paulo Nobre
//Descrição.......      : Separando a função "AjustaAbasComGrupoUsuario" em duas para
//                        corrigir o erro reportado.
//***************************************************************************************
//Rotina                : AjustaAbasComGrupoUsuario
//N. Sol..........      : 240461
//N. PPM..........      : 550386
//Data da Alteração:    : 01/10/2014
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Acertos para nova proposição dos nomes dos grupos (Infra-GETIF)
//******************************************************************************************
//Rotina                : oDIRF.ValidaNumeroRecibo
//N. Sol..........      : 228028
//N. Kintana......      : 2062085
//Data da Alteração:    : 11/03/2014
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Comentado a chamada da função de validação do numero do recibo
//******************************************************************************************
//Rotina                : uCtrlGeraDIRF_Novo
//N. Sol..........      : 226868
//N. Kintana......      : 2060896
//Data da Alteração:    : 18/02/2014
//Alteração Form:       : InserirDIRF_MovAnalitico_O
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão de acertos nas funções de geração do Mov. das
//                        Pessoas Juridicas - Contas a Pagar
//******************************************************************************************
//Rotina                : FGeraDIRF_Novo
//N. Sol..........      : 220883_15847
//N. Kintana......      : 2061307
//Data da Alteração:    : 21/11/2013
//Alteração Form:       : Nova Rotina
//Responsável:          : Paulo Nobre
//Descrição:            : Implementação da geração da DIRF para a Folha de Empregados
//**************************************************************************************
//N. Sol..........: 126092/1347
//N. Kintana......: 814886
//Data............: 23/09/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Novo gerador da DIRF para o Contas a Pagar (Contabilidade)
//***************************************************************************************
Unit FGeraDIRF_Novo;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, TREdit,
  uCmControlObject, uCmDbObject, uDataBase, uSistema, DbClient, uCMTypes,
  uCmClientDataSet, uCmSqlParams, wwdbedit, DBCtrls,
  CMProcuraSubTipo, MontaSelect, filectrl, wwdbdatetimepicker, ShellAPI,
  CMDateTimePicker, wwdblook, QExport3Dialog,
  CMProcura, Wwdotdot, Wwdbcomb, Menus, TB97Ctls, wwSpeedButton,
  wwDBNavigator, wwclearpanel, Wwintl, jpeg, ppCtrls, ppBands, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, uCmRptManager, TXComp, TXRB, CmParamReport, ppVar, ppParameter,
  ImgList, uCtrlGeraDIRF_Novo, uFuncoesUteisIR, wwDialog,
  wwidlg, Wwlocate, Wwkeycb, DBGrids, ucmFileUtils, dxfColorButton,
  ppModule, raCodMod, ppStrtch, ppMemo; // Andre Imakawa - SIG 41768

Const CorDaColuna = $00FDD2D0; // Azul personalizado
Const CorDaZebra = clBtnFace; // $00C0FFFF;

Const MSG001 = 'Confirma Exclusão desta DIRF ?'; //  <SIM> <NÃO>
Const MSG002 = 'Confirma Exclusão deste Movimento ?'; //  <SIM> <NÃO>
Const MSG003 = 'DIRF já foi enviada à RFB. Verifique !'; // <OK>
Const MSG004 = 'Confirma Geração da DIRF ?'; //  <SIM> <NÃO>
Const MSG005 = 'Número do Recibo está em Branco !'; // <OK>
Const MSG006 = 'Número de Recibo já informado. Verifique !'; // <OK>
Const MSG007 = 'Confirma Atualização da DIRF com os Dados do Envio ?'; // <SIM> <NÃO>
Const MSG008 = 'Não pode ser Gerada DIRF para o Ano selecionado. Verifique !'; // <OK>
Const MSG009 = 'Confirma Geração do Arquivo de Envio à RFB ?'; //  <SIM> <NÃO>
Const MSG010 = 'Número do Recibo Inválido. Verifique !'; // <OK>
Const MSG011 = 'DIRF Original não Enviada. Verifique !'; // <OK>
Const MSG012 = 'Para gerar nova Retificadora é necessário o envio da Retificadora atual. Verifique !'; // <OK>
Const MSG013 = 'Arquivo de Envio à RFB não foi Gerado. Verifique !'; // <OK>
Const MSG014 = 'Problemas na Geração da DIRF. Verifique !'; // <OK>
Const MSG015 = 'Arquivo de Envio a RFB gerado com Sucesso !'; //  <OK>
Const MSG016 = 'Problemas na Geração do Arquivo.'; // <OK>
Const MSG018 = 'Existe algum Movimento de DIRF Gerado. Verifique !'; // <OK>
Const MSG019 = 'Não foi possível inserir o Lançamento Localizado.'; // <OK>
Const MSG020 = 'Lançamento já existente no Movimento deste CNPJ. Verifique !'; // <OK>
Const MSG021 = 'É obrigatório o nome do Representante da Fundação'; // <OK>
Const MSG022 = 'É obrigatório o nome do Responsável pelo preenchimento'; // <OK>
Const MSG023 = 'É Obrigatório preencher o CRC do Contador'; // <OK>
Const MSG024 = 'É Obrigatório preencher a UF do CRC do Contador'; // <OK>
Const MSG025 = 'É Obrigatório preencher a Qualificação P. Jurídica'; // <OK>
Const MSG026 = 'Confirma Exclusão deste Lançamento ?'; //  <SIM> <NÃO>
  //Const MSG027 = 'Não há Grupos x Usuários definidos. Verifique !'; //  <SIM> <NÃO>
Const MSG028 = 'Lançamento Gerado não pode ser Excluído. Verifique !'; // <OK>
Const MSG029 = 'Confirma Atualização do Movimento ?'; //  <SIM> <NÃO>
Const MSG030 = 'Não há Lançamentos Selecionados. Verifique !'; //  <SIM> <NÃO>
Const MSG031 = 'Foram encontrados dados incosistentes no(s) Lançamento(s).'; //  <OK>
Const MSG032 = 'Existem Lançamentos não atualizados !'; //  <SIM> <NÃO>
Const MSG033 = 'É obrigatório o nome da Administradora do Plano de Saúde'; // <OK>
Const MSG034 = 'É obrigatório o nome da Administradora do Plano Odontológico'; // <OK>
Const MSG035 = 'Análise da DIRF da Folha de Empregados não foi finalizada pelo Gestor. Verifique !'; // <OK>
Const MSG036 = 'Empregado(s) atualizado(s) com Sucesso. Verifique !'; // <OK>
Const MSG037 = 'É obrigatória a definição da versão do leiaute.'; // <OK>


Type
  TfrmGeraDIRF_Novo = Class(TForm)
    Dock971: TDock97;
    qryLkpUF: TwwQuery;
    qryLkpUFCODESTADO: TStringField;
    dsLkpUF: TwwDataSource;
    dlgSalvarArquivoEnvio: TSaveDialog;
    dsDIRFGeradas: TwwDataSource;
    dsDIRFMovSintCNPJ: TwwDataSource;
    qryDIRFMovDetCNPJ: TwwQuery;
    dsDIRFMovDetCNPJ: TwwDataSource;
    qryAux1: TwwQuery;
    qryDIRFGeradas: TwwQuery;
    qryDadosAdicionais: TwwQuery;
    dsDadosAdicionais: TwwDataSource;
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
    qryDadosAdicionaisIDQUALIFPJ: TFloatField;
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
    qryAux2: TwwQuery;
    pcGerenciadorDIRF: TPageControl;
    tbsContasaPagar: TTabSheet;
    pnlSintetico: TPanel;
    tbsFolhaFunc: TTabSheet;
    pcMovimento: TPageControl;
    tbsMovSint: TTabSheet;
    dsDIRFMovSintCNPJMensal: TwwDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    pnlNova: TPanel;
    pcOutros: TPageControl;
    tbsGerarDIRF: TTabSheet;
    pnlIncDIRF: TPanel;
    Label7: TLabel;
    spbGerarDIRF: TSpeedButton;
    edAnoCalendario1: TEdit;
    UpDown1: TUpDown;
    tbsDadosEnvio: TTabSheet;
    pnlAltDIRF: TPanel;
    Label24: TLabel;
    spbAtualizar: TSpeedButton;
    Label3: TLabel;
    meNumRec: TMaskEdit;
    dtDataEnvio: TCMDateTimePicker;
    dpHoraEnvio: TCMDateTimePicker;
    spbExcDIRF: TSpeedButton;
    SpeedButton3: TSpeedButton;
    stArquivo: TStaticText;
    Panel3: TPanel;
    pnlTitGerDIRF: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    SpeedButton6: TSpeedButton;
    Panel8: TPanel;
    spbGeraDIRFFF: TSpeedButton;
    Panel18: TPanel;
    wwDBGrid1: TwwDBGrid;
    dbgDIRFGeradas: TwwDBGrid;
    wwIntl_Port: TwwIntl;
    Label2: TLabel;
    edAnoCalendario2: TEdit;
    UpDown2: TUpDown;
    MSMovCP: TMontaSelect;
    qryDIRFGeradasIDDIRF: TFloatField;
    qryDIRFGeradasEXERCICIODIRF: TStringField;
    qryDIRFGeradasTIPODIRF: TStringField;
    qryDIRFGeradasNUMRECIBO: TStringField;
    qryDIRFGeradasNUMRECIBOANT: TStringField;
    qryDIRFGeradasDATAENVIORFB: TDateTimeField;
    qryDIRFGeradasGRUPOGERADOR: TStringField;
    qryDIRFGeradasNUMVERSAOSOFT: TStringField;
    qryDIRFGeradasNUMVERSAOLAYOUT: TStringField;
    qryDIRFGeradasFLGARQUIVOGERADO: TStringField;
    qryDIRFMovDetCNPJCODNATUREZA: TStringField;
    qryDIRFMovDetCNPJRAZAOSOCIAL: TStringField;
    qryDIRFMovDetCNPJNUMDOCUMENTO: TStringField;
    qryDIRFMovDetCNPJVLRRENDIMENTO: TFloatField;
    qryDIRFMovDetCNPJVLRIMPOSTO: TFloatField;
    qryDIRFGeradasDSCTIPODIRF: TStringField;
    tbsMovAnal: TTabSheet;
    Panel19: TPanel;
    dbgMovAnalitico: TwwDBGrid;
    Panel25: TPanel;
    spbExportaMovAnal: TSpeedButton;
    spbLocalizarMovAnal: TSpeedButton;
    Panel9: TPanel;
    dbgGridAnaliticoDet: TwwDBGrid;
    tbsInformacoes: TTabSheet;
    pnlDadosAdicionais: TPanel;
    rgQualJuridica: TLabel;
    spbAtualizaDadosInst: TSpeedButton;
    cbQualificacao: TComboBox;
    gbPessoaJuridica: TGroupBox;
    Label12: TLabel;
    Label17: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel20: TPanel;
    Label13: TLabel;
    Label11: TLabel;
    DBText3: TDBText;
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
    Panel12: TPanel;
    dbgGridAnalitico: TwwDBGrid;
    Panel26: TPanel;
    spbExportaSintetico: TSpeedButton;
    Panel14: TPanel;
    spbManMovAnal: TSpeedButton;
    grbNovosValores: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    spbAtualizaValor: TSpeedButton;
    edRendTrib: TRealEdit;
    edImpRetido: TRealEdit;
    qeDIRFMovSint: TQExport3Dialog;
    qeDIRFMovDetCNPJ: TQExport3Dialog;
    qryDIRFMovDetCNPJNODOCUMENTO: TFloatField;
    DBRealEdit3: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    qryDIRFMovDetCNPJIDDIRF: TFloatField;
    qryDIRFMovDetCNPJDATALANCAMENTO: TDateTimeField;
    dbgGridMovTrib: TwwDBGrid;
    qryDIRFMovSintTributos: TwwQuery;
    dsDIRFMovSintTributos: TwwDataSource;
    qryDIRFMovSintTributosIDDIRF: TFloatField;
    qryDIRFMovSintTributosCODNATUREZA: TStringField;
    qryDIRFMovSintTributosDESCRICAO: TStringField;
    qryDIRFMovSintTributosVLRRENDIMENTO: TFloatField;
    qryDIRFMovSintTributosVLRIMPOSTO: TFloatField;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel11: TPanel;
    Image2: TImage;
    stAviso: TStaticText;
    qryDIRFMovDetCNPJIDPESSOA: TFloatField;
    qryDIRFMovDetCNPJFLGMARCADO: TStringField;
    qryFLGMarcadoDIRFMovDetCNPJ: TQuery;
    spbMarcarDesmarcarDetCNPJ: TSpeedButton;
    spbExcluiMovCP: TSpeedButton;
    DevRptCM: TExtraOptions;
    ppComRenJuridica: TppBDEPipeline;
    dsComRenJuridica: TwwDataSource;
    rptComRenJuridica: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppTit1: TppLabel;
    ppTit2: TppLabel;
    ppTit3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    rpComRenJuridicaImage1: TppImage;
    rpComRenJuridicaLabel22: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape7: TppShape;
    ppDBText2: TppDBText;
    ppLabel9: TppLabel;
    ppShape9: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppTit4: TppLabel;
    ppLine9: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLine21: TppLine;
    ppLabel40: TppLabel;
    ppLine22: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText6: TppDBText;
    rpComRenJuridicaLine1: TppLine;
    rpComRenJuridicaLabel1: TppLabel;
    rpComRenJuridicaLine2: TppLine;
    rpComRenJuridicaLabel2: TppLabel;
    rpComRenJuridicaDBText1: TppDBText;
    rpComRenJuridicaShape1: TppShape;
    rpComRenJuridicaLine4: TppLine;
    rpComRenJuridicaLine5: TppLine;
    rpComRenJuridicaLine6: TppLine;
    rpComRenJuridicaLine8: TppLine;
    rpComRenJuridicaLine10: TppLine;
    rpComRenJuridicaLine12: TppLine;
    rpComRenJuridicaLine14: TppLine;
    rpComRenJuridicaLine3: TppLine;
    rpComRenJuridicaLine9: TppLine;
    rpComRenJuridicaLine13: TppLine;
    rpComRenJuridicaLine16: TppLine;
    rpComRenJuridicaLine18: TppLine;
    rpComRenJuridicaLine20: TppLine;
    rpComRenJuridicaLabel3: TppLabel;
    rpComRenJuridicaLabel4: TppLabel;
    rpComRenJuridicaLabel5: TppLabel;
    rpComRenJuridicaLabel6: TppLabel;
    rpComRenJuridicaLabel7: TppLabel;
    rpComRenJuridicaLabel8: TppLabel;
    rpComRenJuridicaLabel9: TppLabel;
    rpComRenJuridicaLabel10: TppLabel;
    rpComRenJuridicaLabel11: TppLabel;
    rpComRenJuridicaLabel12: TppLabel;
    rpComRenJuridicaLabel13: TppLabel;
    rpComRenJuridicaLabel14: TppLabel;
    rpComRenJuridicaLabel15: TppLabel;
    rpComRenJuridicaLabel16: TppLabel;
    rpComRenJuridicaLabel17: TppLabel;
    rpComRenJuridicaLabel18: TppLabel;
    rpComRenJuridicaLabel19: TppLabel;
    rpComRenJuridicaLine7: TppLine;
    rpComRenJuridicaLine15: TppLine;
    rpComRenJuridicaLine19: TppLine;
    rpComRenJuridicaLine22: TppLine;
    rpComRenJuridicaDBText2: TppDBText;
    rpComRenJuridicaDBText3: TppDBText;
    rpComRenJuridicaDBText4: TppDBText;
    rpComRenJuridicaDBText5: TppDBText;
    rpComRenJuridicaDBText6: TppDBText;
    rpComRenJuridicaDBText7: TppDBText;
    rpComRenJuridicaDBText8: TppDBText;
    rpComRenJuridicaDBText9: TppDBText;
    rpComRenJuridicaDBText10: TppDBText;
    rpComRenJuridicaDBText11: TppDBText;
    rpComRenJuridicaDBText12: TppDBText;
    rpComRenJuridicaDBText13: TppDBText;
    rpComRenJuridicaDBText14: TppDBText;
    rpComRenJuridicaDBText15: TppDBText;
    rpComRenJuridicaDBText16: TppDBText;
    rpComRenJuridicaDBText17: TppDBText;
    rpComRenJuridicaDBText18: TppDBText;
    rpComRenJuridicaDBText19: TppDBText;
    rpComRenJuridicaDBText20: TppDBText;
    rpComRenJuridicaDBText21: TppDBText;
    rpComRenJuridicaDBText22: TppDBText;
    rpComRenJuridicaDBText23: TppDBText;
    rpComRenJuridicaDBText24: TppDBText;
    rpComRenJuridicaDBText25: TppDBText;
    rpComRenJuridicaDBText26: TppDBText;
    rpComRenJuridicaDBText27: TppDBText;
    rpComRenJuridicaDBText28: TppDBText;
    rpComRenJuridicaDBText29: TppDBText;
    rpComRenJuridicaDBText30: TppDBText;
    rpComRenJuridicaDBText31: TppDBText;
    rpComRenJuridicaDBText32: TppDBText;
    rpComRenJuridicaDBText33: TppDBText;
    rpComRenJuridicaDBText34: TppDBText;
    rpComRenJuridicaDBText35: TppDBText;
    rpComRenJuridicaDBText36: TppDBText;
    rpComRenJuridicaDBText37: TppDBText;
    rpComRenJuridicaDBText38: TppDBText;
    rpComRenJuridicaDBText39: TppDBText;
    rpComRenJuridicaDBText40: TppDBText;
    rpComRenJuridicaDBText41: TppDBText;
    rpComRenJuridicaDBText42: TppDBText;
    rpComRenJuridicaDBText43: TppDBText;
    rpComRenJuridicaDBText44: TppDBText;
    rpComRenJuridicaDBText45: TppDBText;
    rpComRenJuridicaDBText46: TppDBText;
    rpComRenJuridicaDBText47: TppDBText;
    rpComRenJuridicaDBText48: TppDBText;
    rpComRenJuridicaDBText49: TppDBText;
    sqlComRenJuridica: TCMSqlParams;
    cdsComRenJuridica: TCMClientDataSet;
    qryDIRFMovDetCNPJEXERCICIODIRF: TStringField;
    spbImpInformeIndiv: TSpeedButton;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBCNPJ_CPF: TppDBText;
    ppLabel16: TppLabel;
    ppDadosAdicionais: TppBDEPipeline;
    qryDadosAdicionaisIDDIRF: TFloatField;
    ppDBText1: TppDBText;
    Panel30: TPanel;
    Panel23: TPanel;
    ppSystemVariable1: TppSystemVariable;
    spbFecharMan: TSpeedButton;
    spbExcluiLancto: TSpeedButton;
    qryDIRFMovDetCNPJDATAPAGAMENTO: TDateTimeField;
    qryDIRFGeradasIDDIRFANT: TFloatField;
    CmpRptCM: TCmParamReport;
    CrmRptCM: TCmRptManager;
    ppParameterList1: TppParameterList;
    spbGeraArquivoDIRF: TSpeedButton;
    txt1: TStaticText;
    spbImprimeInformes: TSpeedButton;
    qryDIRFMovDetCNPJFLGTIPOCRIACAO: TStringField;
    qryDIRFMovDetCNPJNUMAPGR: TFloatField;
    cdsComRenJuridicaEXERCICIODIRF: TStringField;
    cdsComRenJuridicaNOMEBENEF: TStringField;
    cdsComRenJuridicaCGCBENEF: TStringField;
    cdsComRenJuridicaCODNATUREZA: TStringField;
    cdsComRenJuridicaDESCRICAO: TStringField;
    cdsComRenJuridicaJANTOTALREND: TFloatField;
    cdsComRenJuridicaFEVTOTALREND: TFloatField;
    cdsComRenJuridicaMARTOTALREND: TFloatField;
    cdsComRenJuridicaABRTOTALREND: TFloatField;
    cdsComRenJuridicaMAITOTALREND: TFloatField;
    cdsComRenJuridicaJUNTOTALREND: TFloatField;
    cdsComRenJuridicaJULTOTALREND: TFloatField;
    cdsComRenJuridicaAGOTOTALREND: TFloatField;
    cdsComRenJuridicaSETTOTALREND: TFloatField;
    cdsComRenJuridicaOUTTOTALREND: TFloatField;
    cdsComRenJuridicaNOVTOTALREND: TFloatField;
    cdsComRenJuridicaDEZTOTALREND: TFloatField;
    cdsComRenJuridicaJANRETIDOFON: TFloatField;
    cdsComRenJuridicaFEVRETIDOFON: TFloatField;
    cdsComRenJuridicaMARRETIDOFON: TFloatField;
    cdsComRenJuridicaABRRETIDOFON: TFloatField;
    cdsComRenJuridicaMAIRETIDOFON: TFloatField;
    cdsComRenJuridicaJUNRETIDOFON: TFloatField;
    cdsComRenJuridicaJULRETIDOFON: TFloatField;
    cdsComRenJuridicaAGORETIDOFON: TFloatField;
    cdsComRenJuridicaSETRETIDOFON: TFloatField;
    cdsComRenJuridicaOUTRETIDOFON: TFloatField;
    cdsComRenJuridicaNOVRETIDOFON: TFloatField;
    cdsComRenJuridicaDEZRETIDOFON: TFloatField;
    tbsLancMan: TTabSheet;
    dbgLancngerados: TwwDBGrid;
    pnl1: TPanel;
    spbMarcarDesmarcarLNG: TSpeedButton;
    spbAtualizaMov: TSpeedButton;
    spbVerificarMov: TSpeedButton;
    dsLancNaoGerados: TwwDataSource;
    cdsLancNaoGerados: TCMClientDataSet;
    sqlLancNaoGerados: TCMSqlParams;
    cdsLancNaoGeradosIDLANCIRRF: TFloatField;
    cdsLancNaoGeradosCODNATUREZA: TStringField;
    cdsLancNaoGeradosNUMDOCUMENTO: TStringField;
    cdsLancNaoGeradosRAZAOSOCIAL: TStringField;
    cdsLancNaoGeradosDATAPAGAMENTO: TDateTimeField;
    cdsLancNaoGeradosVLRBASE: TFloatField;
    cdsLancNaoGeradosVLRIRRF: TFloatField;
    cdsLancNaoGeradosMARCA: TStringField;
    Toolbar971: TToolbar97;
    btnSair: TBitBtn;
    qeDIRFMovLancMan: TQExport3Dialog;
    spbExpMovLanMan: TSpeedButton;
    qryDIRFMovSintCNPJMensal: TwwQuery;
    qryDIRFMovSintCNPJMensalIDDIRF: TFloatField;
    qryDIRFMovSintCNPJMensalCODNATUREZA: TStringField;
    qryDIRFMovSintCNPJMensalNUMDOCUMENTO: TStringField;
    qryDIRFMovSintCNPJMensalMES: TStringField;
    qryDIRFMovSintCNPJMensalDESCMES: TStringField;
    qryDIRFMovSintCNPJMensalVLRRENDIMENTO: TFloatField;
    qryDIRFMovSintCNPJMensalVLRIMPOSTO: TFloatField;
    chkPagSaude: TCheckBox;
    lbl1: TLabel;
    chkPagExterior: TCheckBox;
    qryDadosAdicionaisFLGPAGASSSAUDE: TStringField;
    qryDadosAdicionaisFLGPAGEXTERIOR: TStringField;
    cdsDIRFMovSintCNPJ: TCMClientDataSet;
    sqlDIRFMovSintCNPJ: TCMSqlParams;
    cdsDIRFMovSintCNPJIDDIRF: TFloatField;
    cdsDIRFMovSintCNPJCODNATUREZA: TStringField;
    cdsDIRFMovSintCNPJRAZAOSOCIAL: TStringField;
    cdsDIRFMovSintCNPJNUMDOCUMENTO: TStringField;
    cdsDIRFMovSintCNPJVLRRENDIMENTO: TFloatField;
    cdsDIRFMovSintCNPJVLRIMPOSTO: TFloatField;
    imgTitulosGrids: TImageList;
    pcMovimentoFF: TPageControl;
    tbsMovSintFF: TTabSheet;
    pnl2: TPanel;
    dbgMovResumoFF: TwwDBGrid;
    pnl3: TPanel;
    img1: TImage;
    txt2: TStaticText;
    txt3: TStaticText;
    pnl5: TPanel;
    pnl6: TPanel;
    spbExportaSinteticoFF: TSpeedButton;
    wwDBNavigator3: TwwDBNavigator;
    dbgGridMovTribFF: TwwDBGrid;
    pnl7: TPanel;
    pnl8: TPanel;
    tbsMovDetalhadoFF: TTabSheet;
    pnl9: TPanel;
    dbgMovAnaliticoFF: TwwDBGrid;
    pnl10: TPanel;
    spbExportaMovAnalFF: TSpeedButton;
    pnlNovoValorDet: TPanel;
    qryDIRFMovSintTributosFF: TwwQuery;
    dsDIRFMovSintTributosFF: TwwDataSource;
    qryDIRFMovSintTributosFFCODNATUREZA: TStringField;
    qryDIRFMovSintTributosFFDESCRICAO: TStringField;
    qryDIRFMovSintTributosFFIDDIRF: TFloatField;
    qryDIRFMovSintTributosFFVLRRENDIMENTO: TFloatField;
    qryDIRFMovSintTributosFFVLRIMPOSTO: TFloatField;
    tbsInforAdicionaisFF: TTabSheet;
    pnl12: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    grp2: TGroupBox;
    lbl7: TLabel;
    dbtxtCNPJFUNDACAO: TDBText;
    dbtxtNOMEFUNDACAO: TDBText;
    pnl13: TPanel;
    lbl8: TLabel;
    lbl9: TLabel;
    dbtxtCPFREPRES: TDBText;
    CMProcura1: TCMProcura;
    pnl14: TPanel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    dbtxtCPFRESP: TDBText;
    dbtxtEMAILRESP: TDBText;
    dbtxtDDDRESP: TDBText;
    dbtxtFONERESP: TDBText;
    CMProcura2: TCMProcura;
    wwDBEdit1: TwwDBEdit;
    wwDBLookupCombo1: TwwDBLookupCombo;
    pnl15: TPanel;
    spbExcluirMovFF: TSpeedButton;
    dbchkFLGPAGASSSAUDE: TDBCheckBox;
    dbchkFLGPAGEXTERIOR: TDBCheckBox;
    cdsDIRFMovSintFF: TCMClientDataSet;
    dsDIRFMovSintFF: TwwDataSource;
    sqlDIRFMovSintFF: TCMSqlParams;
    qryDIRFMovDetFF: TwwQuery;
    dsDIRFMovDetFF: TwwDataSource;
    qryDIRFMovDetFFIDDIRF: TFloatField;
    qryDIRFMovDetFFIDDIRFMOVANALITICO: TFloatField;
    qryDIRFMovDetFFEXERCICIODIRF: TStringField;
    qryDIRFMovDetFFCODNATUREZA: TStringField;
    qryDIRFMovDetFFDATALANCAMENTO: TDateTimeField;
    qryDIRFMovDetFFDATAPAGAMENTO: TDateTimeField;
    qryDIRFMovDetFFIDPESSOA: TFloatField;
    qryDIRFMovDetFFNOME: TStringField;
    qryDIRFMovDetFFNUMDOCUMENTO: TStringField;
    qryDIRFMovDetFFIDINFORME: TFloatField;
    qryDIRFMovDetFFIDLANCIRRF: TFloatField;
    qryDIRFMovDetFFCODDIRF: TFloatField;
    qryDIRFMovDetFFVLRRENDIMENTO: TFloatField;
    qryDIRFMovDetFFVLRIMPOSTO: TFloatField;
    qryDIRFMovDetFFFLGTIPOCRIACAO: TStringField;
    qryDIRFMovDetFFFLGMARCADO: TStringField;
    qryDIRFMovDetFFNOMEINFORME: TStringField;
    qeDIRFMovSintFF: TQExport3Dialog;
    qeDIRFMovDetFF: TQExport3Dialog;
    cbbQualificacaoFF: TComboBox;
    qryDadosAdicionaisIDADMPLANOSAUDE: TFloatField;
    qryDadosAdicionaisIDADMPLANOODONTO: TFloatField;
    Panel16: TPanel;
    MSAdm: TMontaSelect;
    PPlanoSaude: TCMProcura;
    Label8: TLabel;
    PPlanoOdonto: TCMProcura;
    Label9: TLabel;
    cdsDepPlanoSaude: TCMClientDataSet;
    dsDepPlanoSaude: TwwDataSource;
    sqlDepPlanoSaude: TCMSqlParams;
    cdsDepPlanoOdonto: TCMClientDataSet;
    dsDepPlanoOdonto: TwwDataSource;
    sqlDepPlanoOdonto: TCMSqlParams;
    Label10: TLabel;
    CMProcura3: TCMProcura;
    Label15: TLabel;
    CMProcura4: TCMProcura;
    qryDadosAdicionaisCNPJPLANOSAUDE: TStringField;
    qryDadosAdicionaisNOMEPLANOSAUDE: TStringField;
    qryDadosAdicionaisCNPJPLANOODONTO: TStringField;
    qryDadosAdicionaisNOMEPLANOODONTO: TStringField;
    qryDIRFGeradasFLGDIRFFINALIZADAFF: TStringField;
    imgFFSim: TImage;
    imgFFNao: TImage;
    qryDIRFMovDetFFVLROUTROS: TFloatField;
    Panel31: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    tbsDetPlanoSaude: TTabSheet;
    Panel32: TPanel;
    cdsDepPlanoSaudeIDTITULAR: TFloatField;
    cdsDepPlanoSaudeIDDEPEN: TFloatField;
    cdsDepPlanoSaudeCPFTITULAR: TStringField;
    cdsDepPlanoSaudeCPFDEPEN: TStringField;
    cdsDepPlanoSaudeNOME: TStringField;
    cdsDepPlanoSaudeDATANASC: TDateTimeField;
    cdsDepPlanoSaudeORDEMDEPEN: TFloatField;
    cdsDepPlanoSaudeIDDEPENDENCIA: TStringField;
    cdsDepPlanoSaudeVALOR: TFloatField;
    cdsDepPlanoSaudeTot: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    dsDepPlanoSaudeTot: TwwDataSource;
    sqlDepPlanoSaudeTot: TCMSqlParams;
    cdsDepPlanoOdontoTot: TCMClientDataSet;
    dsDepPlanoOdontoTot: TwwDataSource;
    sqlDepPlanoOdontoTot: TCMSqlParams;
    cdsDepPlanoOdontoTotCPFTITULAR: TStringField;
    cdsDepPlanoOdontoTotCPFDEPEN: TStringField;
    cdsDepPlanoOdontoTotNOME: TStringField;
    cdsDepPlanoOdontoTotDATANASC: TDateTimeField;
    cdsDepPlanoOdontoTotORDEMDEPEN: TFloatField;
    cdsDepPlanoOdontoTotIDDEPENDENCIA: TStringField;
    cdsDepPlanoOdontoTotVALOR: TFloatField;
    cdsDepPlanoOdontoIDDIRF: TFloatField;
    cdsDepPlanoOdontoIDDIRFMOVANALFFDEPEN: TFloatField;
    cdsDepPlanoOdontoIDTITULAR: TFloatField;
    cdsDepPlanoOdontoIDDEPEN: TFloatField;
    cdsDepPlanoOdontoCPFTITULAR: TStringField;
    cdsDepPlanoOdontoCPFDEPEN: TStringField;
    cdsDepPlanoOdontoNOME: TStringField;
    cdsDepPlanoOdontoDATANASC: TDateTimeField;
    cdsDepPlanoOdontoORDEMDEPEN: TFloatField;
    cdsDepPlanoOdontoIDDEPENDENCIA: TStringField;
    cdsDepPlanoOdontoVALOR: TFloatField;
    cdsDepPlanoSaudeIDDIRF: TFloatField;
    cdsDepPlanoSaudeIDDIRFMOVANALFFDEPEN: TFloatField;
    cdsDepPlanoOdontoTotIDDIRF: TFloatField;
    cdsDepPlanoSaudeTotIDDIRF: TFloatField;
    Panel36: TPanel;
    cdsDepPlanoSaudeMES: TStringField;
    cdsDepPlanoOdontoMES: TStringField;
    lbl2: TLabel;
    spbAtualizaValorFF: TSpeedButton;
    Label19: TLabel;
    edNovoValorFF: TRealEdit;
    spbMarcaDesmarcaMovDetFF: TSpeedButton;
    qryFLGMarcaDIRFMovDetFF: TQuery;
    spbAtualizaFuncExc: TSpeedButton;
    dlgAbreArquivo: TOpenDialog;
    qryCrossTabMovFunc: TwwQuery;
    dsCrossTabMovFunc: TwwDataSource;
    qryCrossTabMovFuncNUMDOCUMENTO: TStringField;
    qryCrossTabMovFuncNOME: TStringField;
    qryCrossTabMovFuncCODNATUREZA: TStringField;
    localizaFF: TwwLocateDialog;
    nbLocalizarFF: TwwNavButton;
    wwDBNavigator3Button: TwwNavButton;
    wwDBNavigator3Button1: TwwNavButton;
    wwDBNavigator3Button2: TwwNavButton;
    wwDBNavigator3Button3: TwwNavButton;
    cdsDepPlanoSaudeIDPROVENTO: TFloatField;
    cdsDepPlanoOdontoIDPROVENTO: TFloatField;
    cdsDepPlanoSaudeTotDEPENDENCIA: TStringField;
    cdsDepPlanoOdontoTotDEPENDENCIA: TStringField;
    qryDIRFMovDetFFMES: TStringField;
    spbGeraArquivoDIRFFF: TSpeedButton;
    qryCrossTabMovFuncTOT_RENDIMENTO: TFloatField;
    qryCrossTabMovFuncTOT_REND_13: TFloatField;
    qryCrossTabMovFuncTOT_IMPOSTO: TFloatField;
    qryCrossTabMovFuncTOT_IMP_13: TFloatField;
    qryCrossTabMovFuncTOT_CONTRIBOFICIAL: TFloatField;
    qryCrossTabMovFuncTOT_DEDDEPEN: TFloatField;
    qryCrossTabMovFuncTOT_PENSAOALIM: TFloatField;
    qryCrossTabMovFuncTOT_CONTRIBPREVPRIV: TFloatField;
    qryCrossTabMovFuncTOT_13CONTRIBOFICIAL: TFloatField;
    qryCrossTabMovFuncTOT_13DEDDEPEN: TFloatField;
    qryCrossTabMovFuncTOT_13PENSAOALIM: TFloatField;
    qryCrossTabMovFuncTOT_13CONTRIBPREVPRIV: TFloatField;
    qryCrossTabMovFuncTOT_AJUDACUSTO: TFloatField;
    qryCrossTabMovFuncTOT_IDENRECACITRABALHO: TFloatField;
    qryCrossTabMovFuncTOT_ABONOPECUNIARIO: TFloatField;
    Panel38: TPanel;
    dbgTotDepPlanoSaude2: TwwDBGrid;
    dbgDepPlanoSaude: TwwDBGrid;
    Panel39: TPanel;
    pnlNovoVlPlSaude: TPanel;
    Label20: TLabel;
    SpbAtuValorPlSaude: TSpeedButton;
    SpeedButton8: TSpeedButton;
    edNovoValorPlSaude: TRealEdit;
    Panel37: TPanel;
    dbgTotDepPlanoOdonto2: TwwDBGrid;
    dbgDepPlanoOdonto: TwwDBGrid;
    pnlNovoVlPlOdonto: TPanel;
    Label18: TLabel;
    SpbAtuValorPlOdonto: TSpeedButton;
    SpeedButton9: TSpeedButton;
    edNovoValorPlOdonto: TRealEdit;
    Panel33: TPanel;
    dbgDIRFMovSintFF: TwwDBGrid;
    meQtdDB: TStaticText;
    qryDIRFMovResumoFF: TwwQuery;
    dsDIRFMovResumoFF: TwwDataSource;
    qryDIRFMovResumoFFIDDIRF: TFloatField;
    qryDIRFMovResumoFFCODDIRF: TFloatField;
    qryDIRFMovResumoFFNOMEINFORME: TStringField;
    qryDIRFMovResumoFFVLRTOTAL: TFloatField;
    qryDIRFMovResumoFFCODNATUREZA: TStringField;
    qryDIRFMovResumoFFNUMDOCUMENTO: TStringField;
    qryDIRFMovResumoFFCODINFORME: TFloatField;
    qryDIRFMovResumoFFFLGMARCADO: TStringField;
    cdsDIRFMovSintFFIDDIRF: TFloatField;
    cdsDIRFMovSintFFCODNATUREZA: TStringField;
    cdsDIRFMovSintFFIDPESSOA: TFloatField;
    cdsDIRFMovSintFFNOME: TStringField;
    cdsDIRFMovSintFFNUMDOCUMENTO: TStringField;
    cdsDIRFMovSintFFFLGMARCADO: TStringField;
    imgDepen: TImage;
    Label16: TLabel;
    DBText4: TDBText;
    Label21: TLabel;
    lbl6: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    DBText5: TDBText;
    DBText7: TDBText;
    qryDIRFMovResumoFFORD: TFloatField;
    cdsDepPlanoSaudeDESCRICAO: TStringField;
    cdsDepPlanoOdontoDESCRICAO: TStringField;
    qryDadosAdicionaisANSPLANOSAUDE: TStringField;
    qryDadosAdicionaisANSPLANOODONTO: TStringField;
    wwDBNavigator4: TwwDBNavigator;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    wwNavButton10: TwwNavButton;
    LocalizaCPDet: TwwLocateDialog;
    wwDBNavigator2: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    wwNavButton5: TwwNavButton;
    LocalizaCP: TwwLocateDialog;
    wwDBNavigator5: TwwDBNavigator;
    wwNavButton21: TwwNavButton;
    wwNavButton22: TwwNavButton;
    wwNavButton23: TwwNavButton;
    wwNavButton24: TwwNavButton;
    wwNavButton25: TwwNavButton;
    LocalizaNaoGerados: TwwLocateDialog;
    qryDIRFMovDetCNPJIDDIRFMOVANALITICO: TFloatField;
    qryCrossTabMovFuncTOT_PLANO_SAUDE: TFloatField;
    qryCrossTabMovFuncTOT_PLANO_ODONTO: TFloatField;
    meQtdDBCP: TStaticText;
    cdsDIRFMovSintCNPJQTD_LANC: TFloatField;
    spbProcuraIgual: TSpeedButton;
    btnAnalisaFF: TdxfColorButton;
    wwDBNavigator7: TwwDBNavigator;
    wwNavButton20: TwwNavButton;
    wwNavButton26: TwwNavButton;
    wwNavButton27: TwwNavButton;
    wwNavButton28: TwwNavButton;
    DBEdit5: TDBEdit;
    Image4: TImage;
    dbmObsr: TDBMemo;
    qryDIRFMovDetCNPJOBS: TMemoField;
    tbsBenefPA: TTabSheet;
    Panel10: TPanel;
    dbgBenefPA: TwwDBGrid;
    cdsBenefPA: TCMClientDataSet;
    dsBenefPA: TwwDataSource;
    SqlBenefPA: TCMSqlParams;
    cdsBenefPAIDDIRF: TFloatField;
    cdsBenefPACPFTITULAR: TStringField;
    cdsBenefPANOME: TStringField;
    cdsBenefPADATANASC: TDateTimeField;
    cdsBenefPADEPENDENCIA: TStringField;
    cdsBenefPADSCDEPENDENCIA: TStringField;
    cdsBenefPAVALOR: TFloatField;
    cdsBenefPACPFDEPEN: TStringField;
    cdsBenefPANOMEINFORME: TStringField;
    Panel13: TPanel;
    // Andre Imakawa - SIG 41768 - Inicio
    CdsDados: TCMClientDataSet;
    SqlDados: TCMSqlParams;
    dsDsDados: TwwDataSource;
    PpDados: TppBDEPipeline;
    RptModelo: TppReport;
    SqlReports: TCMSqlParams;
    CdsReports: TCMClientDataSet;
    ppDetailBand2: TppDetailBand;
    ppLine811: TppLine;
    RptCGC: TppDBText;
    ContPag1: TppSystemVariable;
    ppLPagina: TppLabel;
    LinhaRodape: TppLine;
    ppFooterBand1: TppFooterBand;
    ppShape20: TppShape;
    ppLine4: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppImage1: TppImage;
    ppLabel13: TppLabel;
    ppDBText5: TppDBText;
    ppLAnoExercicio: TppLabel;
    ppShapeppLabVerifiqueCond: TppShape;
    ppLabVerifiqueCond1: TppLabel;
    ppLabVerifiqueCond2: TppLabel;
    ppLabel15: TppLabel;
    ppDBText7: TppDBText;
    ppHeaderBand2: TppHeaderBand;
    ppShape3Linha3: TppShape;
    ppShape3Linha2: TppShape;
    ppShape3Linha1: TppShape;
    ppLabelContribPrevidencOfi: TppLabel;
    ppDBTVlr303: TppDBText;
    ppLabelTotaRendi: TppLabel;
    ppDBTVlr301: TppDBText;
    ppLabel3011: TppLabel;
    ShapeNatRendiDesc: TppShape;
    ShapPesFisBenfRend: TppShape;
    ppShapeFontePagadora: TppShape;
    RptModFontePagadora: TppLabel;
    RptNmEmpresarial: TppLabel;
    RptFontePagadoraCNPJ: TppLabel;
    Rpt2Pesfisbrend: TppLabel;
    RptModeloLine311: TppLine;
    RptLabelCPFname: TppLabel;
    LabelNomeCompleto: TppLabel;
    LabelNatuRendi: TppLabel;
    RptFonte: TppDBText;
    DBTNomeBenef: TppDBText;
    DBTCPF: TppDBText;
    ppLineDivisoriaFP: TppLine;
    DBTDescricaoRendi: TppDBText;
    ppLabelRendTribDedImp: TppLabel;
    ppLabelContPrevPrivFundAposProIndiv: TppLabel;
    ppShape4Linha4: TppShape;
    ppShape4Linha5: TppShape;
    ppShape4Linha6: TppShape;
    ppShape4Linha7: TppShape;
    ppLabitem4e05: TppLabel;
    ppDBTValor405: TppDBText;
    ppLabitem4e06: TppLabel;
    ppLabitem4e07: TppLabel;
    ppDBTValor406: TppDBText;
    ppDBTValor407: TppDBText;
    ppShape4Linha1: TppShape;
    ppShape4Linha2: TppShape;
    ppShape4Linha3: TppShape;
    ppShape3Linha5: TppShape;
    ppShape3Linha4: TppShape;
    ppLabelPenAlim: TppLabel;
    ppLabelImpSoRendRetFon: TppLabel;
    ppDBTVlr304: TppDBText;
    ppDBTVlr305: TppDBText;
    ppLabitem401: TppLabel;
    ppLabitem4e02: TppLabel;
    ppLabitem4e03: TppLabel;
    ppDBTValor402: TppDBText;
    ppDBTValor401: TppDBText;
    ppDBTValor403: TppDBText;
    ppLabel1211: TppLabel;
    ppLabel4RendIsenNoTribut: TppLabel;
    ppLine911: TppLine;
    ppDBTValor404: TppDBText;
    ppShape5Linha3: TppShape;
    ppShape5Linha2: TppShape;
    ppShape5Linha1: TppShape;
    ppLine1011: TppLine;
    ppLabitem5e02: TppLabel;
    ppLabitem5e01: TppLabel;
    ppDBTValor503: TppDBText;
    ppDBTValor501: TppDBText;
    ppLabel411: TppLabel;
    ppLabelItem5: TppLabel;
    ppLabitem5e03: TppLabel;
    ppDBTValor502: TppDBText;
    ppLabelItem6: TppLabel;
    ppShape6Linha1: TppShape;
    ppLabelNumeroProcessotext: TppLabel;
    ppLabelNumeroProcessoNum: TppLabel;
    ppLine111: TppLine;
    ppLabelQuantMeses: TppLabel;
    ppLine5: TppLine;
    ppShape6Linha6: TppShape;
    ppShape6Linha5: TppShape;
    ppShape6Linha4: TppShape;
    ppShape6Linha3: TppShape;
    ppShape6Linha2: TppShape;
    ppShapeItem7: TppShape;
    ppLabelNatRendi: TppLabel;
    ppLabitem6e01: TppLabel;
    ppLabitem6e02: TppLabel;
    ppLabitem6e03: TppLabel;
    ppLabitem6e04: TppLabel;
    ppLabel2111: TppLabel;
    ppLabelItem7: TppLabel;
    ppLabel1011: TppLabel;
    ppLabelValorIt1: TppLabel;
    ppLabelValorIt2: TppLabel;
    ppLabelValorIt3: TppLabel;
    ppLabelValorIt6: TppLabel;
    ppLine1711: TppLine;
    ppDBMemoitem7: TppDBMemo;
    ppLabelAprovacaoRFB8: TppLabel;
    ppLabel8text: TppLabel;
    ppLabelDt8: TppLabel;
    ppDBTNomeResp8: TppDBText;
    ppDBDataInf8: TppDBText;
    ppLine3: TppLine;
    LabelAssin8: TppLabel;
    ppShapeItem8: TppShape;
    ppLine1111: TppLine;
    ppLabelItem8: TppLabel;
    ppLabel3: TppLabel;
    ppLabel2511: TppLabel;
    ppDBTVlr302: TppDBText;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabelValorIt4: TppLabel;
    ppLabelValorIt5: TppLabel;
    ppLabel19: TppLabel;
    //Cássio Rovaroto - SIG n 64340 - Início
    qryDadosAdicionaisCNPJPLANOSAUDE2: TStringField;
    qryDadosAdicionaisNOMEPLANOSAUDE2: TStringField;
    qryDadosAdicionaisANSPLANOSAUDE2: TStringField;
    qryDadosAdicionaisIDADMPLANOSAUDE2: TFloatField;
    Label4: TLabel;
    edtVersaoLeiaute: TEdit;
    edtVersaoLeiauteF: TEdit;
    Label28: TLabel;
    RptModelo2: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppShape4: TppShape;
    ppLine6: TppLine;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppImage2: TppImage;
    ppLabel24: TppLabel;
    ppDBText3: TppDBText;
    ppLabel25: TppLabel;
    ppShape8: TppShape;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDBText4: TppDBText;
    ppLabel28: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppLine7: TppLine;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape21: TppShape;
    ppLabel29: TppLabel;
    ppDBText8: TppDBText;
    ppLabel30: TppLabel;
    ppDBText9: TppDBText;
    ppLabel31: TppLabel;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine8: TppLine;
    ppLabel36: TppLabel;
    ppLabel39: TppLabel;
    ppLabel41: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine10: TppLine;
    ppDBText13: TppDBText;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel46: TppLabel;
    ppDBText14: TppDBText;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppDBText15: TppDBText;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppDBText16: TppDBText;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBText20: TppDBText;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppLine11: TppLine;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppDBText23: TppDBText;
    ppLabel61: TppLabel;
    ppShape35: TppShape;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLine12: TppLine;
    ppLabel64: TppLabel;
    ppLine13: TppLine;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppShape39: TppShape;
    ppShape40: TppShape;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLine14: TppLine;
    ppDBMemo1: TppDBMemo;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLine15: TppLine;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppDBText26: TppDBText;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppDBText27: TppDBText;
    ppLabel83: TppLabel;
    ppLine16: TppLine;
    ppDBText28: TppDBText;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLine17: TppLine;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppDBText29: TppDBText;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel93: TppLabel;
    ppLine18: TppLine;
    ppParameterList2: TppParameterList;
    //Cássio Rovaroto - SIG n 64340 - Fim
    // Andre Imakawa - SIG 41768 - Fim
    Procedure FormCreate(Sender: TObject);
    Procedure SpeedButton3Click(Sender: TObject);
    Procedure btnSairClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure spbExcDIRFClick(Sender: TObject);
    Procedure spbAtualizaValorClick(Sender: TObject);
    Procedure spbLocalizarMovAnalClick(Sender: TObject);
    Procedure pcGerenciadorDIRFChange(Sender: TObject);
    Procedure qryDIRFGeradasAfterScroll(DataSet: TDataSet);
    Procedure spbAtualizarClick(Sender: TObject);
    Procedure spbExcluiMovCPClick(Sender: TObject);
    Procedure spbExportaSinteticoClick(Sender: TObject);
    Procedure spbExportaMovAnalClick(Sender: TObject);
    Procedure dbgGridMovTribDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure dbgGridAnaliticoDetCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    Procedure dbgMovAnaliticoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure dbgMovAnaliticoDblClick(Sender: TObject);
    Procedure spbMarcarDesmarcarDetCNPJClick(Sender: TObject);
    Procedure dbgMovAnaliticoDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure spbManMovAnalClick(Sender: TObject);
    Procedure spbImprimeInformesClick(Sender: TObject);
    Procedure spbImpInformeIndivClick(Sender: TObject);
    Procedure spbAtualizaDadosInstClick(Sender: TObject);
    Procedure PResponsavelValidaDados(Sender: TObject);
    Procedure PRepresentanteValidaDados(Sender: TObject);
    Procedure spbGeraArquivoDIRFClick(Sender: TObject);
    Procedure spbFecharManClick(Sender: TObject);
    Procedure spbExcluiLanctoClick(Sender: TObject);
    Procedure spbVerificarMovClick(Sender: TObject);
    Procedure spbMarcarDesmarcarLNGClick(Sender: TObject);
    Procedure spbAtualizaMovClick(Sender: TObject);
    Procedure dbgLancngeradosDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbExpMovLanManClick(Sender: TObject);
    Procedure spbGerarDIRFClick(Sender: TObject);
    Procedure dbgGridAnaliticoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    Procedure dbgGridAnaliticoCalcTitleImage(Sender: TObject;
      Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
    Procedure dbgGridMovTribFFRowChanged(Sender: TObject);
    Procedure dbgGridMovTribFFDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure spbExportaSinteticoFFClick(Sender: TObject);
    Procedure spbExportaMovAnalFFClick(Sender: TObject);
    Procedure spbAtualizaValorFFClick(Sender: TObject);
    Procedure dbgMovAnaliticoFFCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure PPlanoSaudeValidaDados(Sender: TObject);
    Procedure PPlanoOdontoValidaDados(Sender: TObject);
    Procedure dbgDIRFMovSintFFCalcTitleImage(Sender: TObject;
      Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
    Procedure dbgDIRFMovSintFFTitleButtonClick(Sender: TObject;
      AFieldName: String);
    Procedure cdsDepPlanoSaudeTotAfterScroll(DataSet: TDataSet);
    Procedure cdsDepPlanoOdontoTotAfterScroll(DataSet: TDataSet);
    Procedure cdsDepPlanoSaudeAfterScroll(DataSet: TDataSet);
    Procedure cdsDepPlanoOdontoAfterScroll(DataSet: TDataSet);
    Procedure qryDIRFMovDetFFAfterScroll(DataSet: TDataSet);
    Procedure dbgMovAnaliticoFFDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgDIRFMovSintFFDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbMarcaDesmarcaMovDetFFClick(Sender: TObject);
    Procedure spbAtualizaFuncExcClick(Sender: TObject);
    Procedure dbgDIRFMovSintFFRowChanged(Sender: TObject);
    Procedure SpbAtuValorPlSaudeClick(Sender: TObject);
    Procedure spbGeraArquivoDIRFFFClick(Sender: TObject);
    Procedure dbgTotDepPlanoSaude2DrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure dbgDepPlanoSaudeDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure SpeedButton8Click(Sender: TObject);
    Procedure SpbAtuValorPlOdontoClick(Sender: TObject);
    Procedure SpeedButton9Click(Sender: TObject);
    Procedure dbgTotDepPlanoOdonto3DrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure dbgDepPlanoOdontoDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgTotDepPlanoOdonto2DrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgMovResumoFFDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure edAnoCalendario1Change(Sender: TObject);
    Procedure cdsDIRFMovSintCNPJAfterScroll(DataSet: TDataSet);
    Procedure qryDIRFMovDetCNPJAfterScroll(DataSet: TDataSet);
    Procedure dbgGridAnaliticoDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure qryDIRFMovSintTributosAfterScroll(DataSet: TDataSet);
    Procedure dbgGridAnaliticoRowChanged(Sender: TObject);
    Procedure qryDIRFMovSintTributosFFAfterScroll(DataSet: TDataSet);

    Procedure AjustaAbasComGrupoUsuario(pTipoMov: String);
    Procedure spbProcuraIgualClick(Sender: TObject);
    Procedure ppHeaderBand1BeforePrint(Sender: TObject);
    Procedure btnAnalisaFFClick(Sender: TObject);
    Procedure dbgMovAnaliticoTitleButtonClick(Sender: TObject; AFieldName: String);
    Procedure dbgMovAnaliticoCalcTitleImage(Sender: TObject; Field: TField;
      Var TitleImageAttributes: TwwTitleImageAttributes);
    procedure edtVersaoLeiauteChange(Sender: TObject);
  Private
    { Private declarations }
    sTpOrder, sNmColuna: String; //Darivaldo Alencar SIG 23598
    bCarregaDadosInicias : boolean;   //edilaine SIG119889

    Function SeUltimaDIRFGeradaFor: String;
    Function ExisteMovimentoDIRFGerado(pIdDIRF: Integer; pTipoMov: String): Boolean;
    Function ExisteDadosAdicionaisGerado(pIdDIRF: Integer): Boolean;
    // Paulo Nobre SIG 34459 - Inicio
    Function _TotalizaColunaBenefPA(pCampo: String; pDecimal: Integer): String;
    // Paulo Nobre SIG 34459 - Fim

    Procedure ExcluiMovimento(pTipoMov, sCPF: String);
    Procedure CarregaMovimentoDIRF(pIdDIRF: Double; pTipoMov: String);
    Procedure AjustaAnoExercicio;
    Procedure AtualizaDadosRespRepres(pTipo, pIdPessoa: String);
    Procedure AtualizaDadosPlanosSaudeOdonto(pTipo, pIdPessoa: String);
    Procedure ImprimeInformeRendimentosPJ(pCNPJ: String);
    Procedure AnalisaSIMNAO(pSit: String);
    Procedure AtualizaValorDepenSaude(pSit: Integer);
    Procedure AtualizaValorDepenOdonto(pSit: Integer);

    procedure SelDados(pNumDocumento, pAnoRef, pCodNatureza: String; pIdDirf: Integer); // Andre Imakawa - SIG 41768

  Protected
    oDIRF: TCtrlGeraDIRF_Novo;
  Public
    { Public declarations }
    sTipoMov: String;
    Procedure ShowForm(pTipoMov: String);
    Function VerificaSeUsuarioEstaNoGrupo(idUsuario: Integer): Boolean;
  End;

Var
  frmGeraDIRF_Novo: TfrmGeraDIRF_Novo;
  iAno, iMes, iDia: Word;
  sAnoExercicioDIRF, sExercicioDIRF, sNumRec, Messageinfo: String;
  iIdDIRF, iIdDIRFAnt: Integer;
  bExisteLancNaoGerado: Boolean;
  sVersaoLeiaute: string; //Cássio ROvaroto - SIG nº 113911

Implementation

Uses DBaseDados, uCtrlFuncoesRH, UMensErro, fAguarde, FPreview;

{$R *.DFM}

Procedure TfrmGeraDIRF_Novo.ShowForm(pTipoMov: String);
Begin
  sTipoMov := pTipoMov;
  ShowModal;
End;

Procedure TfrmGeraDIRF_Novo.FormCreate(Sender: TObject);
Begin
  oDIRF := TCtrlGeraDIRF_Novo.Create;
  oDIRF.Initialize(DtmBaseDados.dbBaseDados,
    True,
    Sistema.ConnectionType,
    Sistema.ConnectionSide,
    Sistema.AppRemoteServer,
    True,
    Nil,
    Nil,
    False);

End;

Procedure TfrmGeraDIRF_Novo.FormShow(Sender: TObject);
Begin
  stArquivo.caption := '';
  bExisteLancNaoGerado := False;
  tbsContasaPagar.Enabled := False;
  tbsFolhaFunc.Enabled := False;

  AjustaAbasComGrupoUsuario(sTipoMov); // CP / FF

  Cursor := crSQLWait;
  qryLkpUF.Close;
  qryLkpUF.Open;
  Cursor := crDefault;

  bCarregaDadosInicias := true;   //edilaine SIG119889

  CarregaMovimentoDIRF(-1, ''); // Carrega tudo

  bCarregaDadosInicias := false;   //edilaine SIG119889

  cdsDIRFMovSintCNPJ.IndexName := 'AscNUMDOCUMENTO';
  cdsDIRFMovSintFF.IndexName := 'AscNUMDOCUMENTO';
  dbgBenefPA.ColumnByName('VALOR').FooterValue := '0,00';

  grbNovosValores.Visible := False;
  If qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S' Then
    Begin
      btnAnalisaFF.Color := clGreen;
      btnAnalisaFF.Caption.Text := 'OK';
    End
  Else
    Begin
      btnAnalisaFF.Color := clRed;
      btnAnalisaFF.Caption.Text := 'Ñ OK';
    End;

  imgFFNao.Visible := (qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'N');
  imgFFSim.Visible := ((qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S') And (ExisteMovimentoDIRFGerado(qryDIRFGeradas.fieldByname('IDDIRF').asInteger, sTipoMov)));
  sVersaoLeiaute := EmptyStr; //Cássio Rovaroto - SIG nº 113911
End;

Procedure TfrmGeraDIRF_Novo.AjustaAnoExercicio;
Begin
  If qryDIRFGeradas.isEmpty Then
    Begin
      edAnoCalendario1.Text := inttostr(DiasUteis.ExtraiAno(date));
      edAnoCalendario2.Text := inttostr(DiasUteis.ExtraiAno(date));
      sAnoExercicioDIRF := inttostr(DiasUteis.ExtraiAno(date));
    End
  Else
    Begin
      edAnoCalendario1.Text := qryDIRFGeradas.fieldbyname('EXERCICIODIRF').asString;
      edAnoCalendario2.Text := edAnoCalendario1.Text;
      sAnoExercicioDIRF := edAnoCalendario1.Text;
      //Cássio Rovaroto SIG nº 113911 - Início
      edtVersaoLeiaute.Text := qryDIRFGeradas.FieldByName('NUMVERSAOLAYOUT').AsString;
      edtVersaoLeiauteF.Text := edtVersaoLeiaute.Text;
      //Cássio Rovaroto SIG nº 113911 - Fim
    End;
End;

// SOL 244016  PPM 595531 - Paulo Nobre
// SOL 240461  PPM 550386 - Paulo Nobre

Function TfrmGeraDIRF_Novo.VerificaSeUsuarioEstaNoGrupo(idUsuario: Integer): Boolean;
Begin
  result := True;
  sTipoMov := oDIRF.VerificaGrupoAcesso(idUsuario);
  If sTipoMov = '' Then
    Begin
      Application.MessageBox(PChar('Usuário não pertence a um dos Grupos da DIRF (idgrupo): ' + #13 + #13 +
        '(979) - Contas a Pagar OU ' + #13 +
        '(977) - Folha de Empregados OU ' + #13 +
        '(976) - Folha de Benefícios. ' + #13 + #13 +
        'Veja qual seu Grupo de atuação e solicite sua inclusão junto a GETIF\COTEC !'), 'Atenção !', Mb_IconExclamation);

      result := False;
    End;
End;

// SOL 244016  PPM 595531 - Paulo Nobre

Procedure TfrmGeraDIRF_Novo.AjustaAbasComGrupoUsuario(pTipoMov: String);
Var sNomeTipo: String;
Begin
  pcMovimento.ActivePage := tbsMovSint;
  pcMovimentoFF.ActivePage := tbsMovSintFF;
  sNomeTipo := '';
  If pTipoMov <> '' Then
    Begin
      If pTipoMov = 'CP' Then // Grupo Contas a Pagar - CONTAB
        Begin
          sNomeTipo := 'Contas a Pagar';
          pcGerenciadorDIRF.ActivePage := tbsContasaPagar;
          pcOutros.ActivePage := tbsGerarDIRF;
          tbsContasaPagar.Enabled := True;
          tbsInformacoes.Enabled := True;

          //Darivaldo Alencar SIG 23598 -inicio
          tbsFolhaFunc.Enabled := True;
          tbsInforAdicionaisFF.Enabled := False;
          //Darivaldo Alencar SIG 23598 -fim
        End
      Else If pTipoMov = 'FF' Then // Grupo Folha Empregados - COPES
        Begin
          sNomeTipo := 'Folha de Empregados';
          pcGerenciadorDIRF.ActivePage := tbsFolhaFunc;
          tbsFolhaFunc.Enabled := True;
          tbsInforAdicionaisFF.Enabled := False;
        End;

      pnlTitGerDIRF.caption := 'Gerenciador DIRF - ' + sNomeTipo;
    End;
End;

Procedure TfrmGeraDIRF_Novo.CarregaMovimentoDIRF(pIdDIRF: Double; pTipoMov: String);
Begin
  Try
    qryDIRFGeradas.DisableControls;
    Cursor := crSQLWait;
    // ******  Tabela PAI - DIRF *******
    qryDIRFGeradas.Close;
    qryDIRFGeradas.SQL.Clear;
    qryDIRFGeradas.SQL.Add('SELECT IDDIRF,    ');
    qryDIRFGeradas.SQL.Add('EXERCICIODIRF,    ');
    qryDIRFGeradas.SQL.Add('TIPODIRF,         ');
    qryDIRFGeradas.SQL.Add('DECODE(TIPODIRF, ''O'', ''Original'', ''Retificadora'') as DSCTIPODIRF,  ');
    qryDIRFGeradas.SQL.Add('NUMRECIBO,        ');
    qryDIRFGeradas.SQL.Add('NUMRECIBOANT,     ');
    qryDIRFGeradas.SQL.Add('DATAENVIORFB,     ');
    qryDIRFGeradas.SQL.Add('GRUPOGERADOR,     ');
    qryDIRFGeradas.SQL.Add('IDDIRFANT,        ');
    qryDIRFGeradas.SQL.Add('NUMVERSAOSOFT,    ');
    qryDIRFGeradas.SQL.Add('NUMVERSAOLAYOUT,  ');
    qryDIRFGeradas.SQL.Add('FLGARQUIVOGERADO, ');
    qryDIRFGeradas.SQL.Add('FLGDIRFFINALIZADAFF ');
    qryDIRFGeradas.SQL.Add('FROM DIRF         ');
    If (pIdDIRF <> -1) Then
      qryDIRFGeradas.SQL.Add('WHERE IDDIRF = ' + floattostr(pIdDIRF));
    qryDIRFGeradas.SQL.Add('ORDER BY EXERCICIODIRF DESC, IDDIRF DESC, TIPODIRF DESC');
    qryDIRFGeradas.Open;
    If Not qryDIRFGeradas.isEmpty Then
      Begin
        If (pTipoMov = 'CP') Or (pTipoMov = '') Then
          Begin
            //
            // ************ LENDO MOVIMENTO PARA A DIRF - CONTAS A PAGAR *************************
            //
            // Movimento Tributos
            qryDIRFMovSintTributos.Close;
            qryDIRFMovSintTributos.SQL.Clear;
            qryDIRFMovSintTributos.SQL.Text := oDIRF.LocalizaDIRF_MovSintTributos;
            qryDIRFMovSintTributos.Open;
            //
            // Movimento Sintetico
            cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
              qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
              qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);
            //
            // Detalhamento do Movimento Sintetico
            qryDIRFMovSintCNPJMensal.Close;
            qryDIRFMovSintCNPJMensal.SQL.Clear;
            qryDIRFMovSintCNPJMensal.SQL.Text := oDIRF.LocalizaDIRF_MovSintCNPJMensal;
            qryDIRFMovSintCNPJMensal.Open;
            //
            // Movimento Analítico
            qryDIRFMovDetCNPJ.Close;
            qryDIRFMovDetCNPJ.SQL.Clear;
            qryDIRFMovDetCNPJ.SQL.Text := oDIRF.LocalizaDIRF_MovDetCNPJ;
            qryDIRFMovDetCNPJ.Open;
            //
            cbQualificacao.itemindex := qryDadosAdicionais.fieldbyname('IDQUALIFPJ').asInteger;
            chkPagSaude.Checked := (qryDadosAdicionais.fieldbyname('FLGPAGASSSAUDE').AsString = 'S');
            chkPagExterior.Checked := (qryDadosAdicionais.fieldbyname('FLGPAGEXTERIOR').AsString = 'S');

            spbMarcarDesmarcarLNG.Enabled := (Not cdsLancNaoGerados.IsEmpty);
            spbVerificarMov.Enabled := (Not cdsDIRFMovSintCNPJ.IsEmpty);
            spbAtualizaMov.Enabled := (Not cdsLancNaoGerados.IsEmpty);
            spbExpMovLanMan.Enabled := (Not cdsLancNaoGerados.IsEmpty);
          End;

        If (pTipoMov = 'FF') Or (pTipoMov = '') Then
          Begin
            //
            // ************ LENDO MOVIMENTO PARA A DIRF - FOLHA FUNC. *************************

            // Movimento Tributos
            qryDIRFMovSintTributosFF.Close;
            qryDIRFMovSintTributosFF.SQL.Clear;
            qryDIRFMovSintTributosFF.SQL.Text := oDIRF.ListaDIRF_MovSintTributosFF;
            qryDIRFMovSintTributosFF.Open;
            //
            // Movimento Sintetico
            cdsDIRFMovSintFF.data := oDIRF.ListaDIRF_MovSintFF(
              qryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
              qryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
            //
            // Plano de Saude totalizado
            cdsDepPlanoSaudeTot.data := oDIRF.ListaTotalDependentesPlanos(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              1, // Tipo do Plano de assistencia (saude ou odonto)
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);

            // Plano Odonto totalizado
            cdsDepPlanoOdontoTot.data := oDIRF.ListaTotalDependentesPlanos(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              2, // Tipo do Plano de assistencia (saude ou odonto)
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);

            //edilaine SIG119889 : inicio
            //
            // Plano de Saude todos os lançamentos
            {cdsDepPlanoSaude.data := oDIRF.ListaDadosDependentesPlanos(
              qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
              1,
              cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString,
              cdsDepPlanoSaudeTot.fieldByname('CPFDEPEN').asString,
              cdsDepPlanoSaudeTot.fieldByname('NOME').asString);

            // Plano Odonto todos os lançamentos
            cdsDepPlanoOdonto.data := oDIRF.ListaDadosDependentesPlanos(
              qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
              2,
              cdsDepPlanoOdontoTot.fieldByname('CPFTITULAR').asString,
              cdsDepPlanoOdontoTot.fieldByname('CPFDEPEN').asString,
              cdsDepPlanoOdontoTot.fieldByname('NOME').asString);
            }
            //edilaine SIG119889 : fim

            //
            // Paulo Nobre SIG 34459 - Inicio
            // Beneficiário PA todos os lançamentos
            cdsBenefPA.data := oDIRF.ListaDadosBeneficiarioPA(
              qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
              cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
              cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString);
            dbgBenefPA.ColumnByName('VALOR').FooterValue := _TotalizaColunaBenefPA('VALOR', 2);
            // Paulo Nobre SIG 34459 - Fim
            //
            // Lendo o Movimento analítico detalhado (aba Detalhamento dos Rendimentos && Impostos)
            qryDIRFMovDetFF.Close;
            qryDIRFMovDetFF.SQL.Clear;
            qryDIRFMovDetFF.SQL.Text := oDIRF.ListaDIRF_MovDetFF(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
            qryDIRFMovDetFF.Open;
            //
            // Lendo o Movimento analítico Resumo
            qryDIRFMovResumoFF.Close;
            qryDIRFMovResumoFF.SQL.Clear;
            qryDIRFMovResumoFF.SQL.Text := oDIRF.ListaDIRF_MovResumo(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
            qryDIRFMovResumoFF.Open;
            //
          End;

        // Dados Adicionais
        qryDadosAdicionais.Close;
        qryDadosAdicionais.SQL.Clear;
        qryDadosAdicionais.SQL.Text := oDIRF.LocalizaDIRF_DadosAdicionais;
        qryDadosAdicionais.Open;
        //
        // ********************************************************************************
        //
      End;

    Cursor := crDefault;

    AjustaAnoExercicio;

    qryDIRFGeradas.EnableControls;

    {qryDIRFGeradasAfterScroll(qryDIRFGeradas);

    qryDIRFMovSintTributosAfterScroll(qryDIRFMovSintTributos);
    cdsDIRFMovSintCNPJAfterScroll(cdsDIRFMovSintCNPJ);
    qryDIRFMovDetCNPJAfterScroll(qryDIRFMovDetCNPJ);

    qryDIRFMovSintTributosFFAfterScroll(qryDIRFMovSintTributosFF);
    qryDIRFMovDetFFAfterScroll(qryDIRFMovDetFF);
    cdsDepPlanoSaudeTotAfterScroll(cdsDepPlanoSaude);
    cdsDepPlanoOdontoTotAfterScroll(cdsDepPlanoOdonto);
    cdsDepPlanoSaudeAfterScroll(cdsDepPlanoSaude);  }
  Except
    On E: Exception Do
      Begin
        CMDebugToFile(E.Message);
        MessageInfo := E.Message;
        Showmessage(MessageInfo);
      End;
  End;
End;

Procedure TfrmGeraDIRF_Novo.spbGerarDIRFClick(Sender: TObject);
Begin
    If Application.MessageBox(MSG004, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
    Begin
      Try
        stArquivo.caption := '';
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        qryDIRFGeradas.DisableControls;
        qryDIRFMovSintTributos.DisableControls;
        cdsDIRFMovSintCNPJ.DisableControls;
        qryDIRFMovDetCNPJ.DisableControls;
        qryDIRFMovSintCNPJMensal.DisableControls;

        //Cássio Rovaroto - SIG nº 113911 - Início
        if (sVersaoLeiaute = EmptyStr) then
        begin
          Application.MessageBox(PChar(MSG037), 'Atenção !', Mb_IconExclamation);
          Exit;
        end;
        //Cássio Rovaroto - SIG nº 113911 - Fim


        If (SeUltimaDIRFGeradaFor = 'O') Then // Original
          Begin
            If ExisteMovimentoDIRFGerado(iIdDIRF, sTipoMov) Then // Movimento da Original
              Begin
                If sNumRec <> '' Then // Original foi enviada, então gera uma 1ª Retificadora
                  Begin
                    frmAguarde.pbAguarde.Visible := false;
                    frmAguarde.Mostra('Gerando DIRF e/ou Movimento...');

                    // Gerando a DIRF
                    If Not oDIRF.GerarDIRFAnual(sAnoExercicioDIRF, 'R', sVersaoLeiaute) Then //Cássio Rovaroto - SIG nº 113911
                      Raise Exception.Create(oDIRF.MessageInfo);

                    // **** Inserir Movimento Analítico
                    If Not oDIRF.InserirDIRF_MovAnalitico_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then // Contas a Pagar
                      Raise Exception.Create(oDIRF.MessageInfo);

                    If Not oDIRF.InserirDIRF_MovAnaliticoFF_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then // Folha de Empregados
                      Raise Exception.Create(oDIRF.MessageInfo);

                    If Not oDIRF.InserirDIRF_MovAnalFF_Depen_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then
                      Raise Exception.Create(oDIRF.MessageInfo);

                    // **** Inserir Dados Adicionais
                    If Not oDIRF.InserirDIRF_DadosAdicionais_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then
                      Raise Exception.Create(oDIRF.MessageInfo);
                  End
                Else
                  Application.MessageBox(PChar(MSG011 + #13 + #13 + 'Ano : ' + sExercicioDIRF), 'Atenção !', Mb_IconExclamation);
              End
            Else // Criando somente o Movimento da Original
              Begin
                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Gerando DIRF e/ou Movimento...');

                If sTipoMov = 'CP' Then
                  Begin
                    // 2 - Inserir Movimento Analítico
                    If Not oDIRF.InserirDIRF_MovAnalitico_O(iIdDIRF, sExercicioDIRF, 'A') Then // Contas a Pagar
                      Raise Exception.Create(oDIRF.MessageInfo);
                  End;

                If sTipoMov = 'FF' Then
                  Begin
                    // 2 - Inserir Movimento Analítico
                    If Not oDIRF.InserirDIRF_MovAnalitico_O_FF(iIdDIRF, sExercicioDIRF, 'A', '') Then
                      Raise Exception.Create(oDIRF.MessageInfo);

                    If Not oDIRF.InserirDIRF_MovAnalFF_Depen(iIdDIRF, sExercicioDIRF, '') Then
                      Raise Exception.Create(oDIRF.MessageInfo);
                  End;

                // 3 - Inserir Dados Adicionais
                If Not ExisteDadosAdicionaisGerado(iIdDIRF) Then
                  If Not oDIRF.InserirDIRF_DadosAdicionais_O(iIdDIRF) Then
                    Raise Exception.Create(oDIRF.MessageInfo);
              End;
          End
        Else
          Begin
            If SeUltimaDIRFGeradaFor = 'R' Then // Retificadora
              Begin
                If ExisteMovimentoDIRFGerado(iIdDIRF, sTipoMov) Then
                  Begin
                    If sNumRec <> '' Then // Foi enviada
                      Begin
                        frmAguarde.pbAguarde.Visible := false;
                        frmAguarde.Mostra('Gerando DIRF e/ou Movimento...');

                        // Gerando a DIRF
                        If Not oDIRF.GerarDIRFAnual(sAnoExercicioDIRF, 'R', sVersaoLeiaute) Then //Cássio Rovaroto - SIG nº 113911
                          Raise Exception.Create(oDIRF.MessageInfo);

                        // **** Inserir Movimento Analítico
                        If Not oDIRF.InserirDIRF_MovAnalitico_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then
                          Raise Exception.Create(oDIRF.MessageInfo);

                        If Not oDIRF.InserirDIRF_MovAnaliticoFF_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then
                          Raise Exception.Create(oDIRF.MessageInfo);

                        If Not oDIRF.InserirDIRF_MovAnalFF_Depen_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then
                          Raise Exception.Create(oDIRF.MessageInfo);

                        // **** Inserir Dados Adicionais
                        If Not oDIRF.InserirDIRF_DadosAdicionais_R(oDIRF.iIdDIRF, oDIRF.iIdDIRFAnt) Then
                          Raise Exception.Create(oDIRF.MessageInfo);

                      End
                    Else
                      Application.MessageBox(PChar(MSG012 + #13 + #13 + oDIRF.MessageInfo), 'Atenção !', Mb_IconExclamation);
                  End
                Else // Existindo a Retificadora, então cria somente o Movimento
                  Begin
                    frmAguarde.pbAguarde.Visible := false;
                    frmAguarde.Mostra('Gerando DIRF e/ou Movimento...');

                    If sTipoMov = 'CP' Then
                      Begin
                        // **** Inserir Movimento Analítico
                        If Not oDIRF.InserirDIRF_MovAnalitico_R(iIdDIRF, iIdDIRFAnt) Then
                          Raise Exception.Create(oDIRF.MessageInfo);
                      End;

                    If sTipoMov = 'FF' Then
                      Begin
                        If Not oDIRF.InserirDIRF_MovAnaliticoFF_R(iIdDIRF, iIdDIRFAnt) Then
                          Raise Exception.Create(oDIRF.MessageInfo);

                        If Not oDIRF.InserirDIRF_MovAnalFF_Depen_R(iIdDIRF, iIdDIRFAnt) Then
                          Raise Exception.Create(oDIRF.MessageInfo);
                      End;

                    // **** Inserir Dados Adicionais
                    If Not ExisteDadosAdicionaisGerado(iIdDIRF) Then
                      If Not oDIRF.InserirDIRF_DadosAdicionais_R(iIdDIRF, iIdDIRFAnt) Then
                        Raise Exception.Create(oDIRF.MessageInfo);
                  End;
              End
            Else // Entra aqui quando não existir uma Original gerada no ano selecionado, 1ª vez
              Begin
                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Gerando DIRF e/ou Movimento...');

                // 1 - Gerando a DIRF
                If Not oDIRF.GerarDIRFAnual(sAnoExercicioDIRF, 'O', sVersaoLeiaute) Then   //Cássio Rovaroto - SIG nº 113911
                  Raise Exception.Create(oDIRF.MessageInfo);

                If sTipoMov = 'CP' Then
                  Begin
                    // 2 - Inserir Movimento Analítico
                    If Not oDIRF.InserirDIRF_MovAnalitico_O(oDIRF.iIdDIRF, oDIRF.sExercicioDIRF, 'A') Then // Contas a Pagar
                      Raise Exception.Create(oDIRF.MessageInfo);
                  End;

                If sTipoMov = 'FF' Then
                  Begin
                    // 2 - Inserir Movimento Analítico
                    If Not oDIRF.InserirDIRF_MovAnalitico_O_FF(oDIRF.iIdDIRF, oDIRF.sExercicioDIRF, 'A', '') Then
                      Raise Exception.Create(oDIRF.MessageInfo);

                    If Not oDIRF.InserirDIRF_MovAnalFF_Depen(oDIRF.iIdDIRF, oDIRF.sExercicioDIRF, '') Then
                      Raise Exception.Create(oDIRF.MessageInfo);
                  End;

                // 3 - Inserir Dados Adicionais
                If Not ExisteDadosAdicionaisGerado(oDIRF.iIdDIRF) Then
                  If Not oDIRF.InserirDIRF_DadosAdicionais_O(oDIRF.iIdDIRF) Then
                    Raise Exception.Create(oDIRF.MessageInfo);
              End;
          End;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        CarregaMovimentoDIRF(-1, sTipoMov);

        frmAguarde.pbAguarde.Visible := True;
        frmAguarde.Apaga;

        qryDIRFGeradas.EnableControls;
        qryDIRFMovSintTributos.EnableControls;
        cdsDIRFMovSintCNPJ.EnableControls;
        qryDIRFMovDetCNPJ.EnableControls;
        qryDIRFMovSintCNPJMensal.EnableControls;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;

            frmAguarde.pbAguarde.Visible := True;
            frmAguarde.Apaga;

            qryDIRFGeradas.EnableControls;
            qryDIRFMovSintTributos.EnableControls;
            cdsDIRFMovSintCNPJ.EnableControls;
            qryDIRFMovDetCNPJ.EnableControls;
            qryDIRFMovSintCNPJMensal.EnableControls;

            Application.MessageBox(PChar(MSG014 + #13 + #13 + oDIRF.MessageInfo), 'Atenção !', Mb_IconExclamation);
          End;
      End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.ExcluiMovimento(pTipoMov, sCPF: String);
Begin
  qryAux1.Close;
  qryAux1.SQL.Clear;
  If pTipoMov = 'CP' Then
    qryAux1.SQL.add('DELETE FROM DIRF_MOVANALITICO   ');

  If pTipoMov = 'FF' Then
    qryAux1.SQL.add('DELETE FROM DIRF_MOVANALITICO_FF   ');

  qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
  If sCPF <> '' Then
    qryAux1.SQL.add('AND TRIM(NUMDOCUMENTO) = ' + sCPF);
  If Not qryAux1.prepared Then
    qryAux1.prepare;
  qryAux1.ExecSQL;

  If pTipoMov = 'FF' Then
    Begin
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.add('DELETE FROM DIRF_MOVANALFF_DEPEN   ');
      qryAux2.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
      If sCPF <> '' Then
        qryAux2.SQL.add('AND TRIM(CPFTITULAR) = ' + sCPF);
      If Not qryAux2.prepared Then
        qryAux2.prepare;
      qryAux2.ExecSQL;
    End;
End;

Function TfrmGeraDIRF_Novo.SeUltimaDIRFGeradaFor: String;
Begin
  Result := '';
  Screen.Cursor := crSQLWait;
  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.add('SELECT IDDIRF, EXERCICIODIRF, TIPODIRF, NUMRECIBO, NUMRECIBOANT, IDDIRFANT ');
  qryAux1.SQL.add('FROM DIRF D                                       ');
  qryAux1.SQL.add('WHERE D.IDDIRF = (SELECT MAX(D1.IDDIRF)           ');
  qryAux1.SQL.add('                  FROM DIRF D1                    ');
  qryAux1.SQL.add('                  WHERE D1.EXERCICIODIRF = D.EXERCICIODIRF  )  ');
  qryAux1.SQL.add('      AND D.EXERCICIODIRF = ' + quotedstr(sAnoExercicioDIRF));
  qryAux1.Open;
  If Not qryAux1.EOF Then
    Begin
      iIdDIRFAnt := qryAux1.fieldbyname('IDDIRFANT').asInteger;
      iIdDIRF := qryAux1.fieldbyname('IDDIRF').asInteger;
      sExercicioDIRF := qryAux1.fieldbyname('EXERCICIODIRF').asString;
      sNumRec := qryAux1.fieldbyname('NUMRECIBO').asString;
      Result := qryAux1.fieldbyname('TIPODIRF').asString;
    End;
  Screen.Cursor := crDefault;
End;

Function TfrmGeraDIRF_Novo.ExisteMovimentoDIRFGerado(pIdDIRF: Integer; pTipoMov: String): Boolean;
Begin
  Result := False;
  Screen.Cursor := crSQLWait;
  If pTipoMov = '' Then
    Begin
      result := True;
      qryAux1.Close;
      qryAux1.SQL.Clear;
      qryAux1.SQL.add('SELECT IDDIRF    ');
      qryAux1.SQL.add('FROM DIRF_MOVANALITICO     ');
      qryAux1.SQL.add('WHERE IDDIRF = ' + inttostr(pIdDIRF));
      qryAux1.Open;
      If qryAux1.EOF Then
        Begin
          qryAux1.Close;
          qryAux1.SQL.Clear;
          qryAux1.SQL.add('SELECT IDDIRF    ');
          qryAux1.SQL.add('FROM DIRF_MOVANALITICO_FF     ');
          qryAux1.SQL.add('WHERE IDDIRF = ' + inttostr(pIdDIRF));
          qryAux1.Open;
          Result := (Not qryAux1.EOF);
        End;
    End
  Else If pTipoMov = 'CP' Then
    Begin
      qryAux1.Close;
      qryAux1.SQL.Clear;
      qryAux1.SQL.add('SELECT IDDIRF    ');
      qryAux1.SQL.add('FROM DIRF_MOVANALITICO     ');
      qryAux1.SQL.add('WHERE IDDIRF = ' + inttostr(pIdDIRF));
      qryAux1.Open;
      Result := (Not qryAux1.EOF);
    End
  Else If pTipoMov = 'FF' Then
    Begin
      qryAux1.Close;
      qryAux1.SQL.Clear;
      qryAux1.SQL.add('SELECT IDDIRF    ');
      qryAux1.SQL.add('FROM DIRF_MOVANALITICO_FF     ');
      qryAux1.SQL.add('WHERE IDDIRF = ' + inttostr(pIdDIRF));
      qryAux1.Open;
      Result := (Not qryAux1.EOF);
    End;
  Screen.Cursor := crDefault;
End;

Function TfrmGeraDIRF_Novo.ExisteDadosAdicionaisGerado(pIdDIRF: Integer): Boolean;
Begin
  Screen.Cursor := crSQLWait;
  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.add('SELECT IDDIRF    ');
  qryAux1.SQL.add('FROM DIRF_DADOSADICIONAIS      ');
  qryAux1.SQL.add('WHERE IDDIRF = ' + inttostr(pIdDIRF));
  qryAux1.Open;
  Result := (Not qryAux1.EOF);
  Screen.Cursor := crDefault;
End;

Procedure TfrmGeraDIRF_Novo.qryDIRFGeradasAfterScroll(DataSet: TDataSet);
Begin
  //edilaine SIG119889 : inicio
  if qryDIRFGeradas.ControlsDisabled then
     exit;
  //edilaine SIG119889 : fim

  If sTipoMov = 'CP' Then
    Begin
      spbExcDIRF.Enabled := (Not qryDIRFGeradas.isEmpty);
      spbGeraArquivoDIRF.Enabled := (Not qryDIRFGeradas.isEmpty);
      spbImprimeInformes.Enabled := (Not qryDIRFGeradas.isEmpty);
      pnlDadosAdicionais.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull);
      spbExcluiMovCP.Enabled := (Not cdsDIRFMovSintCNPJ.isEmpty);
      spbExportaSintetico.Enabled := (Not cdsDIRFMovSintCNPJ.isEmpty);
      spbImpInformeIndiv.Enabled := (Not cdsDIRFMovSintCNPJ.isEmpty);
      spbMarcarDesmarcarDetCNPJ.Enabled := (Not qryDIRFMovDetCNPJ.isEmpty);
      spbExportaMovAnal.Enabled := (Not qryDIRFMovDetCNPJ.isEmpty);
      spbLocalizarMovAnal.Enabled := (Not qryDIRFMovDetCNPJ.isEmpty);
      spbManMovAnal.Enabled := (Not qryDIRFMovDetCNPJ.isEmpty);
      spbExcluiLancto.Enabled := (Not qryDIRFMovDetCNPJ.isEmpty);

      qryDIRFMovSintTributosAfterScroll(qryDIRFMovSintTributos);
      cdsDIRFMovSintCNPJAfterScroll(cdsDIRFMovSintCNPJ);
      qryDIRFMovDetCNPJAfterScroll(qryDIRFMovDetCNPJ);
      imgFFNao.Visible := (qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'N');
      imgFFSim.Visible := ((qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S'));
    End;

  If sTipoMov = 'FF' Then
    Begin
      spbExcluirMovFF.Enabled := (Not cdsDIRFMovSintFF.isEmpty);
      spbGeraArquivoDIRFFF.Enabled := (Not qryDIRFGeradas.isEmpty);
      pnlNovoValorDet.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDIRFMovSintFF.isEmpty);
      pnlNovoVlPlSaude.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoSaude.isEmpty);
      pnlNovoVlPlOdonto.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoOdonto.isEmpty);
      spbExportaSinteticoFF.Enabled := (Not cdsDIRFMovSintFF.isEmpty);
      spbAtualizaFuncExc.Enabled := (Not cdsDIRFMovSintFF.isEmpty);
      spbMarcaDesmarcaMovDetFF.Enabled := (Not qryDIRFMovDetFF.isEmpty);
      spbExportaMovAnalFF.Enabled := (Not qryDIRFMovDetFF.isEmpty);
      qryDIRFMovSintTributosFFAfterScroll(qryDIRFMovSintTributosFF);
      If qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S' Then
        Begin
          btnAnalisaFF.Color := clGreen;
          btnAnalisaFF.Caption.Text := 'OK';
        End
      Else
        Begin
          btnAnalisaFF.Color := clRed;
          btnAnalisaFF.Caption.Text := 'Ñ OK';
        End;
    End;

  cbQualificacao.itemindex := qryDadosAdicionais.fieldbyname('IDQUALIFPJ').asInteger;
  chkPagSaude.Checked := (qryDadosAdicionais.fieldbyname('FLGPAGASSSAUDE').AsString = 'S');
  chkPagExterior.Checked := (qryDadosAdicionais.fieldbyname('FLGPAGEXTERIOR').AsString = 'S');
  cbbQualificacaoFF.itemindex := qryDadosAdicionais.fieldbyname('IDQUALIFPJ').asInteger;

End;

Procedure TfrmGeraDIRF_Novo.SpeedButton3Click(Sender: TObject);
Begin
  WinExec('Calc.Exe', SW_Show);
End;

Procedure TfrmGeraDIRF_Novo.btnSairClick(Sender: TObject);
Begin
  qryLkpUF.Close;
  cdsLancNaoGerados.Close;
  FreeAndNil(oDIRF);
  Close;
End;

Procedure TfrmGeraDIRF_Novo.spbExcDIRFClick(Sender: TObject);
Begin
  // Só exclui se tiver sem Recibo
  If (qryDIRFGeradas.fieldByname('NUMRECIBO').isnull) Then
    Begin
      If Application.MessageBox(MSG001, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          If Not ExisteMovimentoDIRFGerado(qryDIRFGeradas.fieldByname('IDDIRF').asInteger, '') Then
            Begin
              Try
                Screen.Cursor := crSQLWait;
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                qryDIRFGeradas.DisableControls;
                cdsDIRFMovSintCNPJ.DisableControls;
                qryDIRFMovDetCNPJ.DisableControls;
                qryDIRFMovSintCNPJMensal.DisableControls;

                qryAux2.Close;
                qryAux2.SQL.Clear;
                qryAux2.SQL.add('DELETE FROM DIRF_DADOSADICIONAIS   ');
                qryAux2.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
                If Not qryAux2.prepared Then
                  qryAux2.prepare;
                qryAux2.ExecSQL;

                qryAux1.Close;
                qryAux1.SQL.Clear;
                qryAux1.SQL.add('DELETE FROM DIRF   ');
                qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
                If Not qryAux1.prepared Then
                  qryAux1.prepare;
                qryAux1.ExecSQL;

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                CarregaMovimentoDIRF(-1, '');

                qryDIRFGeradas.EnableControls;
                cdsDIRFMovSintCNPJ.EnableControls;
                qryDIRFMovDetCNPJ.EnableControls;
                qryDIRFMovSintCNPJMensal.EnableControls;
                Screen.Cursor := crDefault;
              Except
                On E: Exception Do
                  Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
              End
            End
          Else
            Application.MessageBox(MSG018, 'Atenção !', Mb_IconExclamation);
        End
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbAtualizaValorClick(Sender: TObject);
Var RegAtual1, RegAtual2, RegAtual3: TBookMark;
Begin
  If qryDIRFMovDetCNPJ.fieldByname('FLGMARCADO').asstring = 'S' Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        RegAtual1 := qryDIRFMovDetCNPJ.GetBookmark; // Salvando o ponteiro do Registro
        RegAtual2 := cdsDIRFMovSintCNPJ.GetBookmark; // Salvando o ponteiro do Registro
        RegAtual3 := qryDIRFMovSintTributos.GetBookmark; // Salvando o ponteiro do Registro

        Screen.Cursor := crSQLWait;
        qryDIRFMovDetCNPJ.DisableControls;
        qryAux1.Close;
        qryAux1.SQL.Clear;
        qryAux1.SQL.add('UPDATE DIRF_MOVANALITICO   ');
        qryAux1.SQL.add('SET VLRRENDIMENTO =:p1, VLRIMPOSTO =:p2            ');
        qryAux1.SQL.add('WHERE IDDIRFMOVANALITICO = ' + qryDIRFMovDetCNPJ.fieldByname('IDDIRFMOVANALITICO').asString);
        qryAux1.Parambyname('p1').asFloat := edRendTrib.value;
        qryAux1.Parambyname('p2').asFloat := edImpRetido.value;
        qryAux1.ExecSQL;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        qryDIRFMovSintTributos.Close;
        qryDIRFMovSintTributos.Open;
        cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
          qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
          qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);
        qryDIRFMovSintCNPJMensal.Close;
        qryDIRFMovSintCNPJMensal.Open;
        qryDIRFMovDetCNPJ.Close;
        qryDIRFMovDetCNPJ.Open;

        qryDIRFMovSintTributos.GotoBookmark(RegAtual3); // Voltando ao Reg. atual
        cdsDIRFMovSintCNPJ.GotoBookmark(RegAtual2); // Voltando ao Reg. atual
        qryDIRFMovDetCNPJ.GotoBookmark(RegAtual1); // Voltando ao Reg. atual

        Screen.Cursor := crDefault;
        qryDIRFMovDetCNPJ.EnableControls;
        grbNovosValores.Visible := False;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;

            Screen.Cursor := crDefault;
            qryDIRFMovDetCNPJ.EnableControls;

            Application.MessageBox(PChar(oDIRF.MessageInfo), 'Atenção !', Mb_IconExclamation);
          End;
      End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbLocalizarMovAnalClick(Sender: TObject);
Begin
  If (Not qryDIRFMovDetCNPJ.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      MSMovCP.ItemsBusca.Clear;
      MSMovCP.Caption := 'Selecione o Lançamento';
      If MSMovCP.Colunas[0] = 'TO_CHAR(LANCIRRF.DATALANCAMENTO, ''YYYY'') AS EXERCICIODIRF' Then
        MSMovCP.ItemsBusca.Add(qryDIRFMovDetCNPJ.fieldByname('EXERCICIODIRF').asString);
      If MSMovCP.Colunas[1] = 'LANCIRRF.CODNATUREZA' Then
        MSMovCP.ItemsBusca.Add(qryDIRFMovDetCNPJ.fieldByname('CODNATUREZA').asString);
      If MSMovCP.Colunas[2] = 'LANCIRRF.NUMDOCUMENTO' Then
        MSMovCP.ItemsBusca.Add(qryDIRFMovDetCNPJ.fieldByname('NUMDOCUMENTO').asString);
      MSMovCP.Executar;
      If (MSMovCP.RetornouValor) Then
        Begin
          // Verificando se o lançamento localizado existe no Movimento gerado
          Screen.Cursor := crSQLWait;
          qryAux1.Close;
          qryAux1.SQL.Clear;
          qryAux1.SQL.add('SELECT IDDIRF          ');
          qryAux1.SQL.add('FROM DIRF_MOVANALITICO       ');
          qryAux1.SQL.add('WHERE IDLANCIRRF = ' + MSMovCP.ValoresChave[0]);
          qryAux1.Open;
          If qryAux1.EOF Then // Se não existe
            Begin
              Try
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                qryDIRFMovSintTributos.DisableControls;
                cdsDIRFMovSintCNPJ.DisableControls;
                qryDIRFMovDetCNPJ.DisableControls;
                qryDIRFMovSintCNPJMensal.DisableControls;

                // 2 - Inserir lançamento Analítico Manual
                If Not oDIRF.InserirDIRF_MovAnalitico_O_Manual(qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                  strtoint(MSMovCP.ValoresChave[0]),
                  qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString) Then
                  Raise Exception.Create(oDIRF.MessageInfo);

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                qryDIRFMovDetCNPJ.Close;
                qryDIRFMovDetCNPJ.Open;
                qryDIRFMovSintTributos.Close;
                qryDIRFMovSintTributos.Open;
                cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
                  qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
                  qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);
                qryDIRFMovSintCNPJMensal.Close;
                qryDIRFMovSintCNPJMensal.Open;

                qryDIRFMovSintTributos.EnableControls;
                cdsDIRFMovSintCNPJ.EnableControls;
                qryDIRFMovDetCNPJ.EnableControls;
                qryDIRFMovSintCNPJMensal.EnableControls;
              Except
                On E: Exception Do
                  Begin
                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.Rollback;

                    qryDIRFMovSintTributos.EnableControls;
                    cdsDIRFMovSintCNPJ.EnableControls;
                    qryDIRFMovDetCNPJ.EnableControls;
                    qryDIRFMovSintCNPJMensal.EnableControls;

                    Application.MessageBox(PChar(MSG019 + #13 + #13 + oDIRF.MessageInfo), 'Atenção !', Mb_IconExclamation);
                  End;
              End
            End
          Else
            MsgDlg(MSG020, 'Atenção', mtInformation, [mbOk], 0);

          Screen.Cursor := crDefault;
        End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.pcGerenciadorDIRFChange(Sender: TObject);
Begin
  AjustaAnoExercicio;
End;

Procedure TfrmGeraDIRF_Novo.spbAtualizarClick(Sender: TObject);
Var RegAtual: TBookMark;
Begin
  // SOL 228028  KTN 2062085 - Paulo Nobre
//   If oDIRF.ValidaNumeroRecibo(meNumRec.Text) Then
//      Begin
  Screen.Cursor := crSQLWait;
  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.add('SELECT NUMRECIBO  ');
  qryAux1.SQL.add('FROM DIRF         ');
  qryAux1.SQL.add('WHERE NUMRECIBO = ' + quotedstr(meNumRec.Text));
  qryAux1.Open;
  Screen.Cursor := crDefault;
  If Not qryAux1.EOF Then
    Begin
      Application.MessageBox(MSG006, 'Atenção !', Mb_IconExclamation);
      meNumRec.SelectAll;
      meNumRec.Setfocus;
      Exit;
    End;

  If qryDIRFGeradas.fieldByname('FLGARQUIVOGERADO').asString = 'S' Then // Arquivo Gerado
    Begin
      If Application.MessageBox(MSG007, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Screen.Cursor := crSQLWait;
          If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

          Screen.Cursor := crSQLWait;
          qryDIRFGeradas.DisableControls;
          qryAux1.Close;
          qryAux1.SQL.Clear;
          qryAux1.SQL.add('UPDATE DIRF SET   ');
          If oDIRF.TiraMascara(meNumRec.Text) <> '' Then
            Begin
              qryAux1.SQL.add('NUMRECIBO = ' + quotedstr(meNumRec.Text));
              qryAux1.SQL.add(',DATAENVIORFB = TO_DATE(' + quotedstr(dtDataEnvio.Text + ' ' + dpHoraEnvio.text + ':00') + ' , ''DD/MM/YYYY HH24:MI:SS'' ) ');
            End
          Else
            Begin
              qryAux1.SQL.add('NUMRECIBO = NULL ');
              qryAux1.SQL.add(',DATAENVIORFB = NULL ');
            End;

          qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
          qryAux1.ExecSQL;
          Screen.Cursor := crDefault;

          If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;

          RegAtual := qryDIRFGeradas.GetBookmark; // Salvando o ponteiro do Registro

          qryDIRFGeradas.Close;
          qryDIRFGeradas.Open;
          meNumRec.Clear;

          qryDIRFGeradas.GotoBookmark(RegAtual); // Voltando ao Reg. atual

          Screen.Cursor := crDefault;
          qryDIRFGeradas.enableControls;
          pcOutros.ActivePage := tbsGerarDIRF;
        End;
      //            End
      //         Else
      //            Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG013, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbExcluiMovCPClick(Sender: TObject);
Var RegAtual1: TBookMark;
Begin
  // Só exclui se tiver sem Recibo
  If (qryDIRFGeradas.fieldByname('NUMRECIBO').isnull) Then
    Begin
      If Application.MessageBox(MSG002, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryDIRFGeradas.DisableControls;

            RegAtual1 := qryDIRFGeradas.GetBookmark; // Salvando o ponteiro do Registro

            ExcluiMovimento(sTipoMov, '');

            If qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S' Then
              AnalisaSIMNAO('N');

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            CarregaMovimentoDIRF(-1, sTipoMov);

            qryDIRFGeradas.GotoBookmark(RegAtual1); // Voltando ao Reg. atual

            qryDIRFGeradas.EnableControls;
            Screen.Cursor := crDefault;
          Except
            On E: Exception Do
              Begin
                qryDIRFGeradas.EnableControls;
                Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
              End;
          End;
        End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbExportaSinteticoClick(Sender: TObject);
Begin
  If Not cdsDIRFMovSintCNPJ.isEmpty Then
    Begin
      qeDIRFMovSint.Execute;
      cdsDIRFMovSintCNPJ.first;
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbExportaMovAnalClick(Sender: TObject);
Begin
  If Not qryDIRFMovDetCNPJ.isEmpty Then
    Begin
      qeDIRFMovDetCNPJ.Execute;
      qryDIRFMovDetCNPJ.first;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgGridMovTribDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  //edilaine SIG119889 : inicio
  if (qryDIRFGeradas.ControlsDisabled)  or (bCarregaDadosInicias) then
     exit;
  //edilaine SIG119889 : fim

  If Not qryDIRFMovSintTributos.isEmpty Then
    Begin
      If (Field.Name = 'qryDIRFMovSintTributosCODNATUREZA') Or
        (Field.Name = 'qryDIRFMovSintTributosVLRRENDIMENTO') Or
        (Field.Name = 'qryDIRFMovSintTributosVLRIMPOSTO') Then
        dbgGridMovTrib.Canvas.Font.Style := [fsbold];

      dbgGridMovTrib.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgGridAnaliticoDetCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  // faz com que as linhas do grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        Begin
          // linhas ímpares = amarelo, linhas pares = branco
          If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            ABrush.Color := CorDaZebra
          Else
            ABrush.Color := clWhite;
        End;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgMovAnaliticoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  // faz com que as linhas do grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        Begin
          // linhas ímpares = amarelo, linhas pares = branco
          If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            ABrush.Color := CorDaZebra
          Else
            ABrush.Color := clWhite;
        End;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgMovAnaliticoDblClick(Sender: TObject);
Var RegAtual1, RegAtual2, RegAtual3: TBookMark;
Begin
  If (Not qryDIRFMovDetCNPJ.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) And
    (qryDIRFMovDetCNPJ.fieldbyname('FLGTIPOCRIACAO').asString = 'A') Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        Screen.Cursor := crSQLWait;
        qryDIRFMovDetCNPJ.DisableControls;
        qryFLGMarcadoDIRFMovDetCNPJ.Close;
        If qryDIRFMovDetCNPJ.FieldByName('FLGMARCADO').AsString = 'S' Then
          qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pFLGMARCADO').AsString := 'N'
        Else
          qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pFLGMARCADO').AsString := 'S';
        qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pIDDIRF').AsInteger := qryDIRFMovDetCNPJ.FieldByName('IDDIRF').AsInteger;
        qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pIDDIRFMOVANALITICO').AsInteger := qryDIRFMovDetCNPJ.FieldByName('IDDIRFMOVANALITICO').AsInteger;
        qryFLGMarcadoDIRFMovDetCNPJ.ExecSQL;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        RegAtual1 := qryDIRFMovSintTributos.GetBookmark; // Salvando o ponteiro do Registro
        RegAtual2 := cdsDIRFMovSintCNPJ.GetBookmark; // Salvando o ponteiro do Registro
        RegAtual3 := qryDIRFMovDetCNPJ.GetBookmark; // Salvando o ponteiro do Registro

        qryDIRFMovDetCNPJ.Close;
        qryDIRFMovDetCNPJ.Open;
        qryDIRFMovSintTributos.Close;
        qryDIRFMovSintTributos.Open;

        cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
          qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
          qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);

        qryDIRFMovSintCNPJMensal.Close;
        qryDIRFMovSintCNPJMensal.Open;

        qryDIRFMovSintTributos.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
        cdsDIRFMovSintCNPJ.GotoBookmark(RegAtual2); // Voltando ao Reg. atual
        qryDIRFMovDetCNPJ.GotoBookmark(RegAtual3); // Voltando ao Reg. atual

        Screen.Cursor := crDefault;
        qryDIRFMovDetCNPJ.EnableControls;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;
          End;
      End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbMarcarDesmarcarDetCNPJClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  If (Not qryDIRFMovDetCNPJ.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) And
    (qryDIRFMovDetCNPJ.fieldbyname('FLGTIPOCRIACAO').asString = 'A') Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        Cursor := crSQLWait;
        qryDIRFMovDetCNPJ.DisableControls;
        qryDIRFMovDetCNPJ.First;
        While Not qryDIRFMovDetCNPJ.Eof Do
          Begin
            If qryDIRFMovDetCNPJ.FieldByName('FLGMARCADO').AsString = 'S' Then
              qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pFLGMARCADO').AsString := 'N'
            Else
              qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pFLGMARCADO').AsString := 'S';
            qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pIDDIRF').AsInteger := qryDIRFMovDetCNPJ.FieldByName('IDDIRF').AsInteger;
            qryFLGMarcadoDIRFMovDetCNPJ.parambyname('pIDDIRFMOVANALITICO').AsInteger := qryDIRFMovDetCNPJ.FieldByName('IDDIRFMOVANALITICO').AsInteger;
            qryFLGMarcadoDIRFMovDetCNPJ.ExecSQL;

            qryDIRFMovDetCNPJ.Next;
          End;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        RegAtual1 := qryDIRFMovSintTributos.GetBookmark; // Salvando o ponteiro do Registro
        RegAtual2 := cdsDIRFMovSintCNPJ.GetBookmark; // Salvando o ponteiro do Registro

        qryDIRFMovDetCNPJ.Close;
        qryDIRFMovDetCNPJ.Open;
        qryDIRFMovSintTributos.Close;
        qryDIRFMovSintTributos.Open;
        cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
          qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
          qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);
        qryDIRFMovSintCNPJMensal.Close;
        qryDIRFMovSintCNPJMensal.Open;

        qryDIRFMovSintTributos.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
        cdsDIRFMovSintCNPJ.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

        Cursor := crDefault;
        qryDIRFMovDetCNPJ.EnableControls;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;
          End;
      End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.dbgMovAnaliticoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDIRFMovDetCNPJ.isEmpty Then
    Begin
      If qryDIRFMovDetCNPJ.fieldByname('FLGMARCADO').asString = 'N' Then
        Begin
          dbgMovAnalitico.Canvas.Font.Style := [fsStrikeout];
          dbgMovAnalitico.Canvas.Font.Color := clRed;
        End;

      If qryDIRFMovDetCNPJ.fieldByname('FLGTIPOCRIACAO').asString = 'M' Then
        dbgMovAnalitico.Canvas.Font.Color := clBlue;

      dbgMovAnalitico.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbManMovAnalClick(Sender: TObject);
Begin
  If (Not qryDIRFMovDetCNPJ.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) And
    (qryDIRFMovDetCNPJ.Fieldbyname('FLGMARCADO').asString = 'S') Then
    Begin
      grbNovosValores.Visible := True;
      edRendTrib.Value := qryDIRFMovDetCNPJ.Fieldbyname('VLRRENDIMENTO').asFloat;
      edImpRetido.Value := qryDIRFMovDetCNPJ.Fieldbyname('VLRIMPOSTO').asFloat;
      edRendTrib.setfocus;
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbImprimeInformesClick(Sender: TObject);
Begin
  ImprimeInformeRendimentosPJ(''); // Todos
End;

Procedure TfrmGeraDIRF_Novo.spbImpInformeIndivClick(Sender: TObject);
Begin
  ImprimeInformeRendimentosPJ(qryDIRFMovDetCNPJ.fieldByname('NUMDOCUMENTO').asString);
End;

Procedure TfrmGeraDIRF_Novo.ImprimeInformeRendimentosPJ(pCNPJ: String);
Begin
  If (Not qryDIRFMovDetCNPJ.isEmpty) Then
    Begin
      If qryDIRFMovDetCNPJ.fieldByname('CODNATUREZA').asString <> '0588' Then
        Begin
          cursor := crSQLWait;
          cdsComRenJuridica.data := oDIRF.ListaMovInformesRendimento(
            qryDIRFGeradas.fieldByname('IDDIRF').asString,
            qryDIRFMovDetCNPJ.fieldByname('EXERCICIODIRF').asString,
            pCNPJ);
          cursor := crDefault;

          If (qryDIRFMovDetCNPJ.fieldByname('CODNATUREZA').asString = '1708') Or
            (qryDIRFMovDetCNPJ.fieldByname('CODNATUREZA').asString = '8045') Then
            Begin
              ppTit1.Caption := 'COMPROVANTE ANUAL DE RENDIMENTOS PAGOS OU';
              ppTit2.Caption := 'CREDITADOS E DE RETENÇÃO DE';
              ppTit3.Caption := 'IMPOSTO DE RENDA NA FONTE - PESSOA JURÍDICA';
            End
          Else If qryDIRFMovDetCNPJ.fieldByname('CODNATUREZA').asString = '5952' Then
            Begin
              ppTit1.Caption := 'COMPROVANTE ANUAL DE RETENÇÃO DE CSLL';
              ppTit2.Caption := 'Cofins e PIS/Pasep (Lei nº 10.833, de 2003, art. 30)';
              ppTit3.Caption := '';
            End;

          rpComRenJuridicaLabel22.Caption := 'Ano-calendário de ' + qryDIRFMovDetCNPJ.fieldByname('EXERCICIODIRF').asString;
          TfrmPreview.CreateModalPreview(Application, rptComRenJuridica, rptComRenJuridica.PrinterSetup.DocumentName);
        End
      Else
        // Andre Imakawa - SIG41768 - Inicio
        //Application.MessageBox('Layout p/ esta Natureza, ainda não disponível. Verifique !', 'Atenção !', Mb_IconExclamation);
        begin

          SelDados(pCNPJ, qryDIRFMovDetCNPJ.fieldByname('EXERCICIODIRF').asString,
                   qryDIRFMovDetCNPJ.fieldByname('CODNATUREZA').asString, qryDIRFGeradas.fieldByname('IDDIRF').asInteger);

          //SelReport(4119,0);

          //Ewerton Beltramini - 14/03/2022 - SIG 122787  
          if  qryDIRFMovDetCNPJ.fieldByname('EXERCICIODIRF').asString >= '2021' then
              TfrmPreview.CreateModalPreview(Application, RptModelo2, RptModelo2.PrinterSetup.DocumentName)
          else
              TfrmPreview.CreateModalPreview(Application, RptModelo, RptModelo.PrinterSetup.DocumentName);

        end;
        // Andre Imakawa - SIG41768 - Fim
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbAtualizaDadosInstClick(Sender: TObject);
Begin
  If (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      If (dbeCRC.text = '') Then
        Begin
          MsgDlg(MSG023, 'Atenção', mtInformation, [mbOk], 0);
          dbeCRC.SetFocus;
          Exit;
        End;

      If (dbeUFCRC.text = '') Then
        Begin
          MsgDlg(MSG024, 'Atenção', mtInformation, [mbOk], 0);
          dbeUFCRC.SetFocus;
          Exit;
        End;

      If (cbQualificacao.Text = '') Then
        Begin
          MsgDlg(MSG025, 'Atenção', mtInformation, [mbOk], 0);
          cbQualificacao.SetFocus;
          Exit;
        End;

      Screen.Cursor := crSQLWait;
      qryDIRFGeradas.DisableControls;
      qryAux1.Close;
      qryAux1.SQL.Clear;
      qryAux1.SQL.add('UPDATE DIRF_DADOSADICIONAIS                           ');
      qryAux1.SQL.add('SET IDQUALIFPJ =:p1, FLGPAGASSSAUDE =:p2, FLGPAGEXTERIOR =:p3, CRCRESP =:p4, UFCRCRESP =:p5  ');
      qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
      qryAux1.Parambyname('p1').asInteger := cbQualificacao.itemindex;
      qryAux1.Parambyname('p2').asString := FU.IFF(chkPagSaude.checked, 'S', 'N');
      qryAux1.Parambyname('p3').asString := FU.IFF(chkPagExterior.checked, 'S', 'N');
      qryAux1.Parambyname('p4').asString := dbeCRC.text;
      qryAux1.Parambyname('p5').asString := dbeUFCRC.text;
      qryAux1.ExecSQL;

      qryDadosAdicionais.Close;
      qryDadosAdicionais.Open;

      Screen.Cursor := crDefault;
      qryDIRFGeradas.EnableControls;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.PResponsavelValidaDados(Sender: TObject);
Begin
  If (MSResp.RetornouValor) Then
    AtualizaDadosRespRepres('1', MSResp.ValoresChave[0]);
End;

Procedure TfrmGeraDIRF_Novo.PRepresentanteValidaDados(Sender: TObject);
Begin
  If (MSRepres.RetornouValor) Then
    AtualizaDadosRespRepres('2', MSRepres.ValoresChave[0]);
End;

Procedure TfrmGeraDIRF_Novo.AtualizaDadosRespRepres(pTipo, pIdPessoa: String);
Begin
  Screen.Cursor := crSQLWait;
  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.add('SELECT P.IDPESSOA,                                      ');
  qryAux1.SQL.add('   P.NUMDOCUMENTO CPF,                                  ');
  qryAux1.SQL.add('   P.NOME,                                              ');
  qryAux1.SQL.add('   T.DDD,                                               ');
  qryAux1.SQL.add('   T.NUMERO,                                            ');
  qryAux1.SQL.add('   P.EMAIL                                              ');
  qryAux1.SQL.add('   FROM PESSOA P, ENDPESS E, TELENDPESS T               ');
  qryAux1.SQL.add('   WHERE P.IDPESSOA = ' + quotedstr(pIdPessoa));
  qryAux1.SQL.add('   And P.IDPESSOA = E.IDPESSOA (+)                      ');
  qryAux1.SQL.add('   And E.IDENDERECO = T.IDENDERECO (+)                  ');
  qryAux1.SQL.add('   And T.IDTELEFONE = (SELECT MAX(T1.IDTELEFONE)FROM TELENDPESS T1 WHERE T.IDENDERECO = T1.IDENDERECO)');
  qryAux1.Open;
  If Not qryAux1.EOF Then
    Begin
      qryDadosAdicionais.Edit;
      If pTipo = '1' Then // Representante
        Begin
          qryDadosAdicionais.FieldByName('IDREPRES').asInteger := qryAux1.fieldbyname('IDPESSOA').asInteger;
          qryDadosAdicionais.FieldByName('CPFREPRES').AsString := qryAux1.fieldbyname('CPF').asString;
          qryDadosAdicionais.FieldByName('NOMEREPRES').AsString := qryAux1.fieldbyname('NOME').asString;
          qryDadosAdicionais.FieldByName('DDDREPRES').AsString := qryAux1.fieldbyname('DDD').asString;
          qryDadosAdicionais.FieldByName('FONEREPRES').AsString := qryAux1.fieldbyname('NUMERO').asString;
          qryDadosAdicionais.FieldByName('EMAILREPRES').AsString := qryAux1.fieldbyname('EMAIL').asString;
        End;
      If pTipo = '2' Then // Responsável
        Begin
          qryDadosAdicionais.FieldByName('IDRESP').asInteger := qryAux1.fieldbyname('IDPESSOA').asInteger;
          qryDadosAdicionais.FieldByName('CPFRESP').AsString := qryAux1.fieldbyname('CPF').asString;
          qryDadosAdicionais.FieldByName('NOMERESP').AsString := qryAux1.fieldbyname('NOME').asString;
          qryDadosAdicionais.FieldByName('DDDRESP').AsString := qryAux1.fieldbyname('DDD').asString;
          qryDadosAdicionais.FieldByName('FONERESP').AsString := qryAux1.fieldbyname('NUMERO').asString;
          qryDadosAdicionais.FieldByName('EMAILRESP').AsString := qryAux1.fieldbyname('EMAIL').asString;
        End;

      qryDadosAdicionais.Post;
    End;
  Screen.Cursor := crDefault;
End;

Procedure TfrmGeraDIRF_Novo.AtualizaDadosPlanosSaudeOdonto(pTipo, pIdPessoa: String);
Begin
  Screen.Cursor := crSQLWait;
  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.add('SELECT P.IDPESSOA, P.NUMDOCUMENTO, P.RAZAOSOCIAL, DP.NUMDOCUMENTO ANS     ');
  qryAux1.SQL.add('FROM PESSOA P                                                             ');
  qryAux1.SQL.add('     JOIN DOCPESSOA DP ON (P.IDPESSOA = DP.IDPESSOA)                      ');
  qryAux1.SQL.add('WHERE P.IDPESSOA = ' + quotedstr(pIdPessoa));
  qryAux1.SQL.add('      AND DP.IDDOCUMENTO = 42                                             ');
  qryAux1.Open;
  If Not qryAux1.EOF Then
    Begin
      qryDadosAdicionais.Edit;
      If pTipo = '1' Then // Plano de Saude
        Begin
          qryDadosAdicionais.FieldByName('IDADMPLANOSAUDE').asInteger := qryAux1.fieldbyname('IDPESSOA').asInteger;
          qryDadosAdicionais.FieldByName('CNPJPLANOSAUDE').AsString := qryAux1.fieldbyname('NUMDOCUMENTO').asString;
          qryDadosAdicionais.FieldByName('NOMEPLANOSAUDE').AsString := qryAux1.fieldbyname('RAZAOSOCIAL').asString;
          qryDadosAdicionais.FieldByName('ANSPLANOSAUDE').AsString := qryAux1.fieldbyname('ANS').asString;
        End;
      If pTipo = '2' Then // Plano Odontologico
        Begin
          qryDadosAdicionais.FieldByName('IDADMPLANOODONTO').asInteger := qryAux1.fieldbyname('IDPESSOA').asInteger;
          qryDadosAdicionais.FieldByName('CNPJPLANOODONTO').AsString := qryAux1.fieldbyname('NUMDOCUMENTO').asString;
          qryDadosAdicionais.FieldByName('NOMEPLANOODONTO').AsString := qryAux1.fieldbyname('RAZAOSOCIAL').asString;
          qryDadosAdicionais.FieldByName('ANSPLANOODONTO').AsString := qryAux1.fieldbyname('ANS').asString;
        End;

      qryDadosAdicionais.Post;
    End;
  Screen.Cursor := crDefault;
End;

Procedure TfrmGeraDIRF_Novo.spbGeraArquivoDIRFClick(Sender: TObject);
Var sNomeArquivo, sNomeArquivoCompleto, sCompetencia, sCompetenciaAnt, sPathArquivo: String;
  iSel1, iSel2: Word;
  bGeraArqComMovFFeFB: Boolean;
Begin
  If (qryDIRFGeradas.fieldByname('NUMRECIBO').isnull) Then
    Begin
      If Application.MessageBox(MSG009, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          bGeraArqComMovFFeFB := True;
          // Só gera o arquivo se a DIRF da Folha dos Empregados foi finalizada pela Gestor
          If qryDIRFGeradas.fieldByname('FLGDIRFFINALIZADAFF').asString = 'N' Then
            Begin
              iSel2 := Application.MessageBox(PChar('As análises dos movimentos das Folhas de Pagamento ou Benefícios, ainda, não foram finalizadas pelos Gestores. ' + #13 + #13 +
                'Gera o arquivo do Contas a Pagar sem estes movimentos ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO);
              bGeraArqComMovFFeFB := (iSel2 = IDYES);
            End;

          If bGeraArqComMovFFeFB Then
            Begin
              If cdsLancNaoGerados.IsEmpty Then
                Begin
                  frmAguarde.pbAguarde.Visible := false;
                  frmAguarde.Mostra('Verificando Lanctos. não Gerados...');

                  Screen.Cursor := crSQLWait;
                  cdsLancNaoGerados.data := oDIRF.VerificaSeHaLancamentosNaoGerados(
                    qryDIRFGeradas.fieldByname('IDDIRF').AsInteger,
                    qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString);
                  Screen.Cursor := crDefault;

                  spbMarcarDesmarcarLNG.Enabled := (Not cdsLancNaoGerados.IsEmpty);
                  spbVerificarMov.Enabled := (Not cdsDIRFMovSintCNPJ.IsEmpty);
                  spbAtualizaMov.Enabled := (Not cdsLancNaoGerados.IsEmpty);
                  spbExpMovLanMan.Enabled := (Not cdsLancNaoGerados.IsEmpty);

                  frmAguarde.pbAguarde.Visible := True;
                  frmAguarde.Apaga;
                End;

              iSel1 := IDYES;
              If Not cdsLancNaoGerados.IsEmpty Then
                Begin
                  pcMovimento.ActivePage := tbsLancMan;
                  iSel1 := Application.MessageBox(PChar(MSG032 + #13 + #13 +
                    'Gera o Arquivo da DIRF sem estes Lançamentos ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO);
                  If iSel1 = IDNO Then
                    Begin
                      spbMarcarDesmarcarLNG.Enabled := (Not cdsLancNaoGerados.IsEmpty);
                      spbVerificarMov.Enabled := (Not cdsDIRFMovSintCNPJ.IsEmpty);
                      spbAtualizaMov.Enabled := (Not cdsLancNaoGerados.IsEmpty);
                      spbExpMovLanMan.Enabled := (Not cdsLancNaoGerados.IsEmpty);
                    End;
                End;

              If iSel1 = IDYES Then
                Begin
                  pcMovimento.ActivePageIndex := 0; // Voltando a aba sintético

                  If PRepresentante.Text = EmptyStr Then
                    Begin
                      MsgDlg(MSG021, 'Atenção', mtInformation, [mbOk], 0);
                      pcMovimento.ActivePage := tbsInformacoes;
                      PRepresentante.SetFocus;
                      Exit;
                    End;

                  If PResponsavel.Text = EmptyStr Then
                    Begin
                      MsgDlg(MSG022, 'Atenção', mtInformation, [mbOk], 0);
                      pcMovimento.ActivePage := tbsInformacoes;
                      PResponsavel.SetFocus;
                      Exit;
                    End;

                  If (cbQualificacao.Text = EmptyStr) Then
                    Begin
                      MsgDlg(MSG025, 'Atenção', mtInformation, [mbOk], 0);
                      pcMovimento.ActivePage := tbsInformacoes;
                      cbQualificacao.SetFocus;
                      Exit;
                    End;

                  If PPlanoSaude.Text = EmptyStr Then
                    Begin
                      MsgDlg(MSG033, 'Atenção', mtInformation, [mbOk], 0);
                      pcMovimento.ActivePage := tbsInformacoes;
                      PPlanoSaude.SetFocus;
                      Exit;
                    End;

                  If PPlanoOdonto.Text = EmptyStr Then
                    Begin
                      MsgDlg(MSG034, 'Atenção', mtInformation, [mbOk], 0);
                      pcMovimento.ActivePage := tbsInformacoes;
                      PPlanoOdonto.SetFocus;
                      Exit;
                    End;

                  // SOL 246475  PPM 636290 - Paulo Nobre
                  //sCompetencia := inttostr(DiasUteis.ExtraiAno(date));     //edilaine SIG124014
                  //edilaine SIG124014 : inicio
                  if qryDIRFGeradas.isEmpty then
                     sCompetencia := inttostr(DiasUteis.ExtraiAno(date))
                  else
                     sCompetencia := inttostr(qryDIRFGeradas.fieldByname('EXERCICIODIRF').asInteger + 1);
                  //edilaine SIG124014 : fim
                  sCompetenciaAnt := qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString;
                  sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\DIRF\';
                  sNomeArquivo := trim(qryDadosAdicionais.FieldbyName('CNPJFUNDACAO').asString) + '-DIRF-' + sCompetencia + '-' + sCompetenciaAnt +
                    FU.IFF(qryDIRFGeradas.fieldByname('TIPODIRF').asString = 'O', '-ORIGI', '-RETIF') + qryDIRFGeradas.fieldByname('IDDIRF').asString + '-NORMAL.DEC';
                  sNomeArquivoCompleto := sPathArquivo + sNomeArquivo;

                  If Not DirectoryExists(sPathArquivo) Then
                    ForceDirectories(sPathArquivo);

                  dlgSalvarArquivoEnvio.InitialDir := sPathArquivo;
                  dlgSalvarArquivoEnvio.FileName := sNomeArquivo;
                  If dlgSalvarArquivoEnvio.Execute Then
                    Begin
                      stArquivo.caption := sNomeArquivoCompleto;
                      Screen.Cursor := crSQLWait;
                      Try
                        If Not dtmBaseDados.dbBaseDados.InTransaction Then
                          dtmBaseDados.dbBaseDados.StartTransaction;

                        //
                        // Função de geração do arquivo de envio a RFB
                        //
                        // SOL 252107  PPM 780490 - Paulo Nobre - 09/04/2015
                        If Not oDIRF.Exporta(
                          sTipoMov,
                          sNomeArquivoCompleto,
                          qryDIRFGeradas.fieldByname('FLGDIRFFINALIZADAFF').asString,
                          '',
                          qryDIRFGeradas,
                          qryDIRFMovSintTributos,
                          qryDadosAdicionais,
                          qryDIRFMovSintTributosFF,
                          // Paulo Nobre SIG 34459 - Inicio
                  //    qryDIRFMovDetFF,
                  //    cdsDIRFMovSintCNPJ,
                  //    cdsDIRFMovSintFF,
                         // Paulo Nobre SIG 34459 - Fim
                          cdsDepPlanoSaudeTot,
                          cdsDepPlanoOdontoTot) Then
                          Begin
                            Application.MessageBox(MSG016, 'Atenção !', MB_ICONINFORMATION + MB_OK);
                            If dtmBaseDados.dbBaseDados.InTransaction Then
                              dtmBaseDados.dbBaseDados.RollBack;
                            Exit;
                          End
                        Else
                          Begin
                            Application.MessageBox(MSG015, 'Atenção !', MB_ICONINFORMATION + MB_OK);

                            qryDIRFGeradas.DisableControls;

                            qryAux1.Close;
                            qryAux1.SQL.Clear;
                            qryAux1.SQL.add('UPDATE DIRF SET          ');
                            qryAux1.SQL.add('FLGARQUIVOGERADO = ''S'' ');
                            qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
                            qryAux1.ExecSQL;

                            If dtmBaseDados.dbBaseDados.InTransaction Then
                              dtmBaseDados.dbBaseDados.Commit;

                            qryDIRFGeradas.Close;
                            qryDIRFGeradas.Open;

                            qryDIRFGeradas.EnableControls;
                          End;
                      Except
                        If dtmBaseDados.dbBaseDados.InTransaction Then
                          dtmBaseDados.dbBaseDados.RollBack;
                        Raise;
                      End;
                      Screen.Cursor := crDefault;
                    End;
                End;
            End;
        End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbFecharManClick(Sender: TObject);
Begin
  grbNovosValores.Visible := False;
End;

Procedure TfrmGeraDIRF_Novo.spbExcluiLanctoClick(Sender: TObject);
Begin
  If (Not qryDIRFMovDetCNPJ.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      If qryDIRFMovDetCNPJ.fieldByname('FLGTIPOCRIACAO').asString = 'M' Then // Só apaga os Importados Manuais
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryDIRFMovSintTributos.DisableControls;
            cdsDIRFMovSintCNPJ.DisableControls;
            qryDIRFMovDetCNPJ.DisableControls;
            qryDIRFMovSintCNPJMensal.DisableControls;

            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.add('DELETE FROM DIRF_MOVANALITICO   ');
            qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFMovDetCNPJ.fieldByname('IDDIRF').asString);
            qryAux1.SQL.add('      AND IDDIRFMOVANALITICO = ' + qryDIRFMovDetCNPJ.fieldByname('IDDIRFMOVANALITICO').asString);
            qryAux1.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            qryDIRFMovDetCNPJ.Close;
            qryDIRFMovDetCNPJ.Open;
            qryDIRFMovSintTributos.Close;
            qryDIRFMovSintTributos.Open;
            cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
              qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
              qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);
            qryDIRFMovSintCNPJMensal.Close;
            qryDIRFMovSintCNPJMensal.Open;

            qryDIRFMovSintTributos.EnableControls;
            cdsDIRFMovSintCNPJ.EnableControls;
            qryDIRFMovDetCNPJ.EnableControls;
            qryDIRFMovSintCNPJMensal.EnableControls;
            Screen.Cursor := crDefault;
          Except
            On E: Exception Do
              Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
          End;
        End
      Else
        Application.MessageBox(MSG028, 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbVerificarMovClick(Sender: TObject);
Begin
  If (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      Screen.Cursor := crSQLWait;
      cdsLancNaoGerados.data := oDIRF.VerificaSeHaLancamentosNaoGerados(
        qryDIRFGeradas.fieldByname('IDDIRF').AsInteger,
        qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString);
      Screen.Cursor := crDefault;

      bExisteLancNaoGerado := (Not cdsLancNaoGerados.IsEmpty);

      spbMarcarDesmarcarLNG.Enabled := (Not cdsLancNaoGerados.IsEmpty);
      spbVerificarMov.Enabled := (Not cdsDIRFMovSintCNPJ.IsEmpty);
      spbAtualizaMov.Enabled := (Not cdsLancNaoGerados.IsEmpty);
      spbExpMovLanMan.Enabled := (Not cdsLancNaoGerados.IsEmpty);
      dbgLancngerados.SetFocus;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbMarcarDesmarcarLNGClick(Sender: TObject);
Begin
  If (Not cdsLancNaoGerados.isEmpty) And (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        Cursor := crSQLWait;
        cdsLancNaoGerados.DisableControls;
        cdsLancNaoGerados.First;
        While Not cdsLancNaoGerados.Eof Do
          Begin
            cdsLancNaoGerados.Edit;
            If cdsLancNaoGerados.FieldByName('Marca').AsString = 'S' Then
              cdsLancNaoGerados.FieldByName('Marca').AsString := 'N'
            Else
              cdsLancNaoGerados.FieldByName('Marca').AsString := 'S';

            cdsLancNaoGerados.Next;
          End;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        cdsLancNaoGerados.First;
        cdsLancNaoGerados.EnableControls;

        Screen.Cursor := crDefault;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;

            cdsLancNaoGerados.EnableControls;
          End;
      End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbAtualizaMovClick(Sender: TObject);
Var bAtualizouPeloMenosUM: Boolean;
Begin
  If (Not cdsLancNaoGerados.isEmpty) And (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      If cdsLancNaoGerados.Locate('Marca', 'S', []) Then
        Begin
          If Application.MessageBox(MSG029, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
            Begin

              bAtualizouPeloMenosUM := False;

              Try
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                Cursor := crSQLWait;
                cdsLancNaoGerados.DisableControls;

                cdsLancNaoGerados.First;
                While Not cdsLancNaoGerados.Eof Do
                  Begin
                    If cdsLancNaoGerados.FieldByName('Marca').AsString = 'S' Then
                      Begin
                        // 2 - Inserir lançamento Analítico Manual
                        If Not oDIRF.InserirDIRF_MovAnalitico_O_Manual(
                          qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                          cdsLancNaoGerados.fieldbyname('IDLANCIRRF').asInteger,
                          qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString) Then
                          Raise Exception.Create(oDIRF.MessageInfo)
                        Else
                          bAtualizouPeloMenosUM := True;
                      End;

                    cdsLancNaoGerados.Next;
                  End;

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                If bAtualizouPeloMenosUM Then
                  Begin
                    cdsLancNaoGerados.data := oDIRF.VerificaSeHaLancamentosNaoGerados(
                      qryDIRFGeradas.fieldByname('IDDIRF').AsInteger,
                      qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString);

                    qryDIRFMovDetCNPJ.Close;
                    qryDIRFMovDetCNPJ.Open;
                    qryDIRFMovSintTributos.Close;
                    qryDIRFMovSintTributos.Open;
                    cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
                      qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
                      qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);
                    qryDIRFMovSintCNPJMensal.Close;
                    qryDIRFMovSintCNPJMensal.Open;
                  End;

                Screen.Cursor := crDefault;

                cdsLancNaoGerados.First;
                cdsLancNaoGerados.EnableControls;

                spbMarcarDesmarcarLNG.Enabled := (Not cdsLancNaoGerados.IsEmpty);
                spbVerificarMov.Enabled := (Not cdsDIRFMovSintCNPJ.IsEmpty);
                spbAtualizaMov.Enabled := (Not cdsLancNaoGerados.IsEmpty);
                spbExpMovLanMan.Enabled := (Not cdsLancNaoGerados.IsEmpty);
              Except
                On E: Exception Do
                  Begin
                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.Rollback;

                    cdsLancNaoGerados.EnableControls;

                    Application.MessageBox(PChar(MSG031 + #13 +
                      'Como por exemplo: Valores = 0.00. Verifique !'), 'Atenção !', Mb_IconExclamation);
                  End;
              End;
            End;
        End
      Else
        Application.MessageBox(PChar(MSG030), 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.dbgLancngeradosDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not cdsLancNaoGerados.isEmpty Then
    Begin
      dbgLancngerados.Canvas.Font.Color := clBlue;

      dbgLancngerados.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbExpMovLanManClick(Sender: TObject);
Begin
  If Not cdsLancNaoGerados.isEmpty Then
    Begin
      qeDIRFMovLancMan.Execute;
      cdsLancNaoGerados.first;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgGridAnaliticoTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
  Try
    If (Not cdsDIRFMovSintCNPJ.Active) Or
      (cdsDIRFMovSintCNPJ.IsEmpty) Or
      ((AFieldName <> 'RAZAOSOCIAL') And
      (AFieldName <> 'NUMDOCUMENTO')) Then
      Exit;

    If (Trim(cdsDIRFMovSintCNPJ.IndexName) = Trim('Asc' + AFieldName)) Then
      cdsDIRFMovSintCNPJ.IndexName := 'Desc' + AFieldName
    Else
      cdsDIRFMovSintCNPJ.IndexName := 'Asc' + AFieldName;

  Finally
    cdsDIRFMovSintCNPJ.First;
  End;
End;

Procedure TfrmGeraDIRF_Novo.dbgGridAnaliticoCalcTitleImage(Sender: TObject;
  Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
  If (Field.FieldName = 'RAZAOSOCIAL') Or
    (Field.FieldName = 'NUMDOCUMENTO') Then
    Begin
      TitleImageAttributes.ImageIndex := 0;
      If cdsDIRFMovSintCNPJ.IndexName = Trim('Desc' + Field.FieldName) Then
        TitleImageAttributes.ImageIndex := 1;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgGridMovTribFFRowChanged(Sender: TObject);
Begin
  //edilaine SIG119889 : inicio
  if (qryDIRFGeradas.ControlsDisabled) or (bCarregaDadosInicias) then
     exit;
  //edilaine SIG119889 : fim

  cdsDIRFMovSintFF.data := oDIRF.ListaDIRF_MovSintFF(
    qryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
    qryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);

  // Plano de Saude totalizado
  cdsDepPlanoSaudeTot.data := oDIRF.ListaTotalDependentesPlanos(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    1, // Tipo do Plano de assistencia (saude ou odonto)
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);

  //edilaine SIG119889 : inicio
  {cdsDepPlanoSaude.data := oDIRF.ListaDadosDependentesPlanos(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    1,
    cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString,
    cdsDepPlanoSaudeTot.fieldByname('CPFDEPEN').asString,
    cdsDepPlanoSaudeTot.fieldByname('NOME').asString);
   }
   //edilaine SIG119889 : fim

  // Plano Odonto totalizado
  cdsDepPlanoOdontoTot.data := oDIRF.ListaTotalDependentesPlanos(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    2, // Tipo do Plano de assistencia (saude ou odonto)
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);

  //edilaine SIG119889 : inicio
  {cdsDepPlanoOdonto.data := oDIRF.ListaDadosDependentesPlanos(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    2,
    cdsDepPlanoOdontoTot.fieldByname('CPFTITULAR').asString,
    cdsDepPlanoOdontoTot.fieldByname('CPFDEPEN').asString,
    cdsDepPlanoOdontoTot.fieldByname('NOME').asString);
   }
   //edilaine SIG119889 : fim

  // Paulo Nobre SIG 34459 - Inicio
  // Beneficiário PA todos os lançamentos
  cdsBenefPA.data := oDIRF.ListaDadosBeneficiarioPA(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
    cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString);

  dbgBenefPA.ColumnByName('VALOR').FooterValue := _TotalizaColunaBenefPA('VALOR', 2);
  // Paulo Nobre SIG 34459 - Fim

  // Lendo o Movimento analítico (aba Detalhamento dos Rendimentos && Impostos)
  qryDIRFMovDetFF.Close;
  qryDIRFMovDetFF.SQL.Clear;
  qryDIRFMovDetFF.SQL.Text := oDIRF.ListaDIRF_MovDetFF(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
  qryDIRFMovDetFF.Open;

  // Lendo o Movimento analítico Resumo
  qryDIRFMovResumoFF.Close;
  qryDIRFMovResumoFF.SQL.Clear;
  qryDIRFMovResumoFF.SQL.Text := oDIRF.ListaDIRF_MovResumo(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
  qryDIRFMovResumoFF.Open;

  pnlNovoVlPlSaude.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoSaude.isEmpty);
  pnlNovoVlPlOdonto.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoOdonto.isEmpty);
End;

Procedure TfrmGeraDIRF_Novo.dbgGridMovTribFFDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  //edilaine SIG119889 : inicio
  if (qryDIRFGeradas.ControlsDisabled)  or (bCarregaDadosInicias) then
     exit;
  //edilaine SIG119889 : fim

  If Not qryDIRFMovSintTributosFF.isEmpty Then
    Begin
      If (Field.Name = 'qryDIRFMovSintTributosFFCODNATUREZA') Or
        (Field.Name = 'qryDIRFMovSintTributosFFVLRRENDIMENTO') Or
        (Field.Name = 'qryDIRFMovSintTributosFFVLRIMPOSTO') Then
        dbgGridMovTribFF.Canvas.Font.Style := [fsbold];

      dbgGridMovTribFF.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbExportaSinteticoFFClick(Sender: TObject);
Begin
  If Not cdsDIRFMovSintFF.isEmpty Then
    Begin
      qryCrossTabMovFunc.Close;
      qryCrossTabMovFunc.Open;
      qeDIRFMovSintFF.Execute;
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbExportaMovAnalFFClick(Sender: TObject);
Begin
  If Not qryDIRFMovDetFF.isEmpty Then
    Begin
      qeDIRFMovDetFF.Execute;
      qryDIRFMovDetFF.first;
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbAtualizaValorFFClick(Sender: TObject);
Var RegAtual1, RegAtual2, RegAtual3: TBookMark;
Begin
  If (Not qryDIRFMovDetFF.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      If Application.MessageBox(PChar('Este procedimento atualizará  este lançamento, inclusive na' + #13 +
        'base de Impostos (LANCXINFORME) com o novo Valor informado ! Continua ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Screen.Cursor := crSQLWait;
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.add('UPDATE DIRF_MOVANALITICO_FF SET        ');

            // Paulo Nobre - SOL 247807 PPM 703438 26/02/2015
            If qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger = 2 Then
              qryAux1.SQL.add('  VLRRENDIMENTO =:p1   ')
            Else If qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger In [3, 7] Then
              qryAux1.SQL.add('  VLRIMPOSTO =:p1   ')
            Else If (qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger <> 2) And
              (qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger <> 3) And
              (qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger <> 7) Then
              qryAux1.SQL.add('  VLROUTROS =:p1   ');

            qryAux1.SQL.add('WHERE IDDIRFMOVANALITICO = ' + qryDIRFMovDetFF.fieldByname('IDDIRFMOVANALITICO').asString);
            qryAux1.Parambyname('p1').asFloat := edNovoValorFF.value;
            qryAux1.ExecSQL;

            // Atualizar a LANCXINFORME
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.add('UPDATE LANCXINFORME   ');
            qryAux2.SQL.add('SET VLRLANC =:p1      ');
            qryAux2.SQL.add('WHERE IDINFORME = ' + qryDIRFMovDetFF.fieldByname('IDINFORME').asString);
            qryAux2.SQL.add('      AND IDLANCIRRF = ' + qryDIRFMovDetFF.fieldByname('IDLANCIRRF').asString);
            qryAux2.Parambyname('p1').asFloat := edNovoValorFF.value;
            qryAux2.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            RegAtual1 := qryDIRFMovSintTributosFF.GetBookmark; // Salvando o ponteiro do Registro
            RegAtual2 := cdsDIRFMovSintFF.GetBookmark; // Salvando o ponteiro do Registro
            RegAtual3 := qryDIRFMovDetFF.GetBookmark; // Salvando o ponteiro do Registro

            qryDIRFMovSintTributosFF.Close;
            qryDIRFMovSintTributosFF.Open;

            cdsDIRFMovSintFF.data := oDIRF.ListaDIRF_MovSintFF(
              qryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
              qryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);

            // Lendo o Movimento analítico (aba Detalhamento dos Rendimentos && Impostos)
            qryDIRFMovDetFF.Close;
            qryDIRFMovDetFF.SQL.Clear;
            qryDIRFMovDetFF.SQL.Text := oDIRF.ListaDIRF_MovDetFF(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
            qryDIRFMovDetFF.Open;

            // Lendo o Movimento analítico Resumo
            qryDIRFMovResumoFF.Close;
            qryDIRFMovResumoFF.SQL.Clear;
            qryDIRFMovResumoFF.SQL.Text := oDIRF.ListaDIRF_MovResumo(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
            qryDIRFMovResumoFF.Open;

            qryDIRFMovSintTributosFF.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
            cdsDIRFMovSintFF.GotoBookmark(RegAtual2); // Voltando ao Reg. atual
            qryDIRFMovDetFF.GotoBookmark(RegAtual3); // Voltando ao Reg. atual

            Screen.Cursor := crDefault;
          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;

                Application.MessageBox(PChar(oDIRF.MessageInfo), 'Atenção !', Mb_IconExclamation);
              End;
          End;
        End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.dbgMovAnaliticoFFCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  // faz com que as linhas do grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        Begin
          // linhas ímpares = amarelo, linhas pares = branco
          If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            ABrush.Color := CorDaZebra
          Else
            ABrush.Color := clWhite;
        End;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmGeraDIRF_Novo.PPlanoSaudeValidaDados(Sender: TObject);
Begin
  If (MSAdm.RetornouValor) Then
    AtualizaDadosPlanosSaudeOdonto('1', MSAdm.ValoresChave[0]);
End;

Procedure TfrmGeraDIRF_Novo.PPlanoOdontoValidaDados(Sender: TObject);
Begin
  If (MSAdm.RetornouValor) Then
    AtualizaDadosPlanosSaudeOdonto('2', MSAdm.ValoresChave[0]);
End;

Procedure TfrmGeraDIRF_Novo.dbgDIRFMovSintFFCalcTitleImage(Sender: TObject;
  Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
  If (Field.FieldName = 'NOME') Or
    (Field.FieldName = 'NUMDOCUMENTO') Or
    (Field.FieldName = 'VLRRENDIMENTO') Then
    Begin
      TitleImageAttributes.ImageIndex := 0;
      If cdsDIRFMovSintFF.IndexName = Trim('Desc' + Field.FieldName) Then
        TitleImageAttributes.ImageIndex := 1;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgDIRFMovSintFFTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
  Try
    If (Not cdsDIRFMovSintFF.Active) Or
      (cdsDIRFMovSintFF.IsEmpty) Or
      ((AFieldName <> 'NOME') And
      (AFieldName <> 'NUMDOCUMENTO') And
      (AFieldName <> 'VLRRENDIMENTO')) Then
      Exit;

    If (Trim(cdsDIRFMovSintFF.IndexName) = Trim('Asc' + AFieldName)) Then
      cdsDIRFMovSintFF.IndexName := 'Desc' + AFieldName
    Else
      cdsDIRFMovSintFF.IndexName := 'Asc' + AFieldName;

  Finally
    cdsDIRFMovSintFF.First;
  End;
End;

Procedure TfrmGeraDIRF_Novo.AnalisaSIMNAO(pSit: String);
Var RegAtual: TBookMark;
Begin
  Screen.Cursor := crSQLWait;
  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  Screen.Cursor := crSQLWait;
  qryDIRFGeradas.DisableControls;
  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.add('UPDATE DIRF SET   ');
  qryAux1.SQL.add('FLGDIRFFINALIZADAFF = ' + quotedstr(pSit));
  qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
  qryAux1.ExecSQL;
  Screen.Cursor := crDefault;

  If dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.Commit;

  RegAtual := qryDIRFGeradas.GetBookmark; // Salvando o ponteiro do Registro

  qryDIRFGeradas.Close;
  qryDIRFGeradas.Open;
  qryDIRFGeradas.GotoBookmark(RegAtual); // Voltando ao Reg. atual

  If qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S' Then
    Begin
      btnAnalisaFF.Color := clGreen;
      btnAnalisaFF.Caption.Text := 'OK';
    End
  Else
    Begin
      btnAnalisaFF.Color := clRed;
      btnAnalisaFF.Caption.Text := 'Ñ OK';
    End;

  imgFFNao.Visible := (qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'N');
  imgFFSim.Visible := (qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S');

  Screen.Cursor := crDefault;
  qryDIRFGeradas.enableControls;
End;

Procedure TfrmGeraDIRF_Novo.cdsDepPlanoSaudeTotAfterScroll(DataSet: TDataSet);
Begin
  //edilaine SIG119889 : inicio
  if qryDIRFGeradas.ControlsDisabled then
     exit;
  //edilaine SIG119889 : fim

  // Plano de Saude
  cdsDepPlanoSaude.data := oDIRF.ListaDadosDependentesPlanos(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    1,
    cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString,
    cdsDepPlanoSaudeTot.fieldByname('CPFDEPEN').asString,
    cdsDepPlanoSaudeTot.fieldByname('NOME').asString,
    qryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString);

  pnlNovoVlPlSaude.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoSaude.isEmpty);
  pnlNovoVlPlOdonto.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoOdonto.isEmpty);
End;

Procedure TfrmGeraDIRF_Novo.cdsDepPlanoOdontoTotAfterScroll(DataSet: TDataSet);
Begin
  //edilaine SIG119889 : inicio
  if qryDIRFGeradas.ControlsDisabled then
     exit;
  //edilaine SIG119889 : fim

  // Plano Odonto
  cdsDepPlanoOdonto.data := oDIRF.ListaDadosDependentesPlanos(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    2,
    cdsDepPlanoOdontoTot.fieldByname('CPFTITULAR').asString,
    cdsDepPlanoOdontoTot.fieldByname('CPFDEPEN').asString,
    cdsDepPlanoOdontoTot.fieldByname('NOME').asString,
    qryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString);

  pnlNovoVlPlSaude.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoSaude.isEmpty);
  pnlNovoVlPlOdonto.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoOdonto.isEmpty);
End;

Procedure TfrmGeraDIRF_Novo.cdsDepPlanoSaudeAfterScroll(DataSet: TDataSet);
Begin
  edNovoValorPlSaude.Value := cdsDepPlanoSaude.fieldByname('VALOR').asFloat;
End;

Procedure TfrmGeraDIRF_Novo.cdsDepPlanoOdontoAfterScroll(DataSet: TDataSet);
Begin
  edNovoValorPlOdonto.Value := cdsDepPlanoOdonto.fieldByname('VALOR').asFloat;
End;

Procedure TfrmGeraDIRF_Novo.qryDIRFMovDetFFAfterScroll(DataSet: TDataSet);
Begin
  //edilaine SIG119889 : inicio
  if qryDIRFGeradas.ControlsDisabled then
     exit;
  //edilaine SIG119889 : fim

  If Not qryDIRFMovDetFF.isEmpty Then
    Begin
      // Paulo Nobre - SOL 247807 PPM 703438 26/02/2015
      If qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger = 2 Then
        edNovoValorFF.Value := qryDIRFMovDetFF.Fieldbyname('VLRRENDIMENTO').asFloat
      Else If qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger In [3, 7] Then
        edNovoValorFF.Value := qryDIRFMovDetFF.Fieldbyname('VLRIMPOSTO').asFloat
      Else If (qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger <> 2) And
        (qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger <> 3) And
        (qryDIRFMovDetFF.Fieldbyname('CODDIRF').asInteger <> 7) Then
        edNovoValorFF.Value := qryDIRFMovDetFF.Fieldbyname('VLROUTROS').asFloat;

      pnlNovoValorDet.enabled := (qryDIRFMovDetFF.Fieldbyname('FLGMARCADO').asString = 'S');
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgMovAnaliticoFFDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDIRFMovDetFF.isEmpty Then
    Begin
      If qryDIRFMovDetFF.fieldByname('FLGMARCADO').asString = 'N' Then
        Begin
          dbgMovAnaliticoFF.Canvas.Font.Style := [fsStrikeout];
          dbgMovAnaliticoFF.Canvas.Font.Color := clRed;
        End;

      dbgMovAnaliticoFF.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgDIRFMovSintFFDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not cdsDIRFMovSintFF.isEmpty Then
    Begin
      If cdsDIRFMovSintFF.FieldByName('FLGMARCADO').AsString = 'N' Then
        Begin
          dbgDIRFMovSintFF.Canvas.Font.Style := [fsStrikeout];
          dbgDIRFMovSintFF.Canvas.Font.Color := clRed;
        End;

      dbgDIRFMovSintFF.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.spbMarcaDesmarcaMovDetFFClick(Sender: TObject);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  If (Not qryDIRFMovDetFF.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        Cursor := crSQLWait;
        qryDIRFMovDetFF.DisableControls;
        qryDIRFMovDetFF.First;
        While Not qryDIRFMovDetFF.Eof Do
          Begin
            If qryDIRFMovDetFF.FieldByName('FLGMARCADO').AsString = 'S' Then
              qryFLGMarcaDIRFMovDetFF.parambyname('pFLGMARCADO').AsString := 'N'
            Else
              qryFLGMarcaDIRFMovDetFF.parambyname('pFLGMARCADO').AsString := 'S';
            qryFLGMarcaDIRFMovDetFF.parambyname('pIDDIRF').AsInteger := qryDIRFMovDetFF.FieldByName('IDDIRF').AsInteger;
            qryFLGMarcaDIRFMovDetFF.parambyname('pIDDIRFMOVANALITICO').AsInteger := qryDIRFMovDetFF.FieldByName('IDDIRFMOVANALITICO').AsInteger;
            qryFLGMarcaDIRFMovDetFF.ExecSQL;

            qryDIRFMovDetFF.Next;
          End;

        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.Commit;

        RegAtual1 := qryDIRFMovSintTributosFF.GetBookmark; // Salvando o ponteiro do Registro
        RegAtual2 := cdsDIRFMovSintFF.GetBookmark; // Salvando o ponteiro do Registro

        // Lendo o Movimento analítico (aba Detalhamento dos Rendimentos && Impostos)
        qryDIRFMovDetFF.Close;
        qryDIRFMovDetFF.SQL.Clear;
        qryDIRFMovDetFF.SQL.Text := oDIRF.ListaDIRF_MovDetFF(
          cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
          cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
          cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
        qryDIRFMovDetFF.Open;

        // Lendo o Movimento analítico Resumo
        qryDIRFMovResumoFF.Close;
        qryDIRFMovResumoFF.SQL.Clear;
        qryDIRFMovResumoFF.SQL.Text := oDIRF.ListaDIRF_MovResumo(
          cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
          cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
          cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
        qryDIRFMovResumoFF.Open;

        cdsDIRFMovSintFF.data := oDIRF.ListaDIRF_MovSintFF(
          qryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
          qryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);

        qryDIRFMovSintTributosFF.Close;
        qryDIRFMovSintTributosFF.Open;

        qryDIRFMovSintTributosFF.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
        cdsDIRFMovSintFF.GotoBookmark(RegAtual2); // Voltando ao Reg. atual

        Cursor := crDefault;
        qryDIRFMovDetFF.EnableControls;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Rollback;

            qryDIRFMovDetFF.EnableControls;
          End;
      End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbAtualizaFuncExcClick(Sender: TObject);
Var tArquivo: TextFile;
  sPathArquivo, sLinha, sCPF: String;
  sValorCampo: TStringlist;
Begin
  // SOL 252107  PPM 780490 - Paulo Nobre - 09/04/2015
  If (Not cdsDIRFMovSintFF.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      If Application.MessageBox(pchar('O Arquivo texto deve ter conter as colunas abaixo, separadas por " ; ": ' + #13 + #13 +
        'OPERAÇÕES: [ I - Incluir / E - Excluir / H - Habilitar / D - Desabilitar ]' + #13 +
        'CPF Empregado: [ Informar sem máscara ]' + #13 + #13 +
        'Exemplo do conteúdo: '' I;00009498176 ou/e E;00009498176 ''' + #13 + #13 +
        'Confirma Atualizações ? '), 'Arquivo contendo Lista de CPF´s dos Empregados', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
          dlgAbreArquivo.InitialDir := sPathArquivo;
          If dlgAbreArquivo.Execute Then
            Begin
              If uppercase(dlgAbreArquivo.FileName) <> '' Then
                Begin
                  Try
                    If Not dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.StartTransaction;

                    Cursor := crSQLWait;
                    sValorCampo := TStringList.Create;
                    // Lendo o arquivo
                    AssignFile(tArquivo, dlgAbreArquivo.FileName);
                    Reset(tArquivo);
                    While Not EOF(tArquivo) Do
                      Begin
                        sValorCampo.clear;
                        Readln(tArquivo, sLinha); // Lendo linha dos dados
                        ExtractStrings([';'], [], pchar(sLinha), sValorCampo); // Extraindo o valor de cada campo e guardando numa stringlist

                        // Desabilita ou Habilita um CPF
                        If (sValorCampo[0] = 'D') Or (sValorCampo[0] = 'H') Then
                          Begin
                            If oDIRF.ChecaSeNumero(sValorCampo[1]) Then
                              Begin
                                sCPF := quotedstr(strzero(11, TRIM(sValorCampo[1])));
                                If (sCPF <> '') Then
                                  Begin
                                    qryAux1.Close;
                                    qryAux1.SQL.Clear;
                                    qryAux1.SQL.add('UPDATE DIRF_MOVANALITICO_FF   ');
                                    qryAux1.SQL.add('SET FLGMARCADO =:p1           ');
                                    qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFMovSintTributosFF.fieldByname('IDDIRF').asString);
                                    qryAux1.SQL.add('      AND CODNATUREZA = ' + quotedstr(qryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString));
                                    qryAux1.SQL.add('      AND TRIM(NUMDOCUMENTO) = ' + sCPF);
                                    qryAux1.ParamByName('p1').asString := FU.IFF(sValorCampo[0] = 'D', 'N', 'S'); // (D)esabilita ou (H)abilita um CPF

                                    qryAux1.ExecSQL;
                                  End;
                              End;
                          End
                        Else // Incluir ou Excluir fisicamente um CPF
                          If (sValorCampo[0] = 'I') Or (sValorCampo[0] = 'E') Then
                            Begin
                              If oDIRF.ChecaSeNumero(sValorCampo[1]) Then
                                Begin
                                  sCPF := quotedstr(strzero(11, TRIM(sValorCampo[1])));
                                  If (sCPF <> '') Then
                                    Begin
                                      // 1 - Excluindo tudo do CPF lido
                                      ExcluiMovimento(sTipoMov, sCPF);

                                      If (sValorCampo[0] = 'I') Then // Inserir
                                        Begin
                                          // 2 - Inserir Movimento Analítico do CPF
                                          If Not oDIRF.InserirDIRF_MovAnalitico_O_FF(qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                                            qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString, 'A', sCPF) Then
                                            Raise Exception.Create(oDIRF.MessageInfo);

                                          // 3 - Inserir Movimento dos Dependentes do CPF
                                          If Not oDIRF.InserirDIRF_MovAnalFF_Depen(qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
                                            qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString, sCPF) Then
                                            Raise Exception.Create(oDIRF.MessageInfo);
                                        End;
                                    End;
                                End;
                            End;

                        // Lendo próxima linha
                      End;

                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.Commit;

                    CloseFile(tArquivo);

                    // Lendo o Movimento analítico (aba Detalhamento dos Rendimentos && Impostos)
                    qryDIRFMovDetFF.Close;
                    qryDIRFMovDetFF.SQL.Clear;
                    qryDIRFMovDetFF.SQL.Text := oDIRF.ListaDIRF_MovDetFF(
                      cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
                      cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
                      cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
                    qryDIRFMovDetFF.Open;

                    // Lendo o Movimento analítico Resumo
                    qryDIRFMovResumoFF.Close;
                    qryDIRFMovResumoFF.SQL.Clear;
                    qryDIRFMovResumoFF.SQL.Text := oDIRF.ListaDIRF_MovResumo(
                      cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
                      cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
                      cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
                    qryDIRFMovResumoFF.Open;

                    cdsDIRFMovSintFF.data := oDIRF.ListaDIRF_MovSintFF(
                      qryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
                      qryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
                    qryDIRFMovSintTributosFF.Close;
                    qryDIRFMovSintTributosFF.Open;

                    Screen.Cursor := crDefault;
                    Application.MessageBox(MSG036, 'Atenção !', Mb_IconExclamation);
                    freeandnil(sValorCampo);
                  Except
                    Raise Exception.create('Problemas na leitura do Arquivo');
                  End
                End;
            End;
        End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.dbgDIRFMovSintFFRowChanged(Sender: TObject);
Begin
  if (qryDIRFGeradas.ControlsDisabled) or (bCarregaDadosInicias) then
     exit;

  // Plano de Saude totalizado
  cdsDepPlanoSaudeTot.data := oDIRF.ListaTotalDependentesPlanos(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    1, // Tipo do Plano de assistencia (saude ou odonto)
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString,
    0, 0, qryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString); //Cássio Rovaroto - SIG nº 81294

  //edilaine SIG119889 : inicio
  {cdsDepPlanoSaude.data := oDIRF.ListaDadosDependentesPlanos(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    1,
    cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString,
    cdsDepPlanoSaudeTot.fieldByname('CPFDEPEN').asString,
    cdsDepPlanoSaudeTot.fieldByname('NOME').asString,
    qryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString); //Cássio Rovaroto - SIG nº 81294
   }
  //edilaine SIG119889 : fim

  // Plano Odonto totalizado
  cdsDepPlanoOdontoTot.data := oDIRF.ListaTotalDependentesPlanos(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    2, // Tipo do Plano de assistencia (saude ou odonto)
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString,
    0, 0, qryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString); //Cássio Rovaroto - SIG nº 81294

  //edilaine SIG119889 : inicio
  {cdsDepPlanoOdonto.data := oDIRF.ListaDadosDependentesPlanos(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    2,
    cdsDepPlanoOdontoTot.fieldByname('CPFTITULAR').asString,
    cdsDepPlanoOdontoTot.fieldByname('CPFDEPEN').asString,
    cdsDepPlanoOdontoTot.fieldByname('NOME').asString,
    qryDIRFMovSintTributosFF.FieldByName('CODNATUREZA').asString); //Cássio Rovaroto - SIG nº 81294
   }
   //edilaine SIG119889 : fim

  // Paulo Nobre SIG 34459 - Inicio
  // Beneficiário PA todos os lançamentos
  cdsBenefPA.data := oDIRF.ListaDadosBeneficiarioPA(
    qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
    cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
    cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString);
  dbgBenefPA.ColumnByName('VALOR').FooterValue := _TotalizaColunaBenefPA('VALOR', 2);
  // Paulo Nobre SIG 34459 - Fim

  // Lendo o Movimento analítico (aba Detalhamento dos Rendimentos && Impostos)
  qryDIRFMovDetFF.Close;
  qryDIRFMovDetFF.SQL.Clear;
  qryDIRFMovDetFF.SQL.Text := oDIRF.ListaDIRF_MovDetFF(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
  qryDIRFMovDetFF.Open;

  // Lendo o Movimento analítico Resumo
  qryDIRFMovResumoFF.Close;
  qryDIRFMovResumoFF.SQL.Clear;
  qryDIRFMovResumoFF.SQL.Text := oDIRF.ListaDIRF_MovResumo(
    cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
    cdsDIRFMovSintFF.fieldByname('CODNATUREZA').asString,
    cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);
  qryDIRFMovResumoFF.Open;

  pnlNovoVlPlSaude.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoSaude.isEmpty);
  pnlNovoVlPlOdonto.Enabled := (qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull And Not cdsDepPlanoOdonto.isEmpty);
  meQtdDB.Caption := Format('%.2d / %.2d', [cdsDIRFMovSintFF.RecNo, cdsDIRFMovSintFF.RecordCount]);
  imgDepen.Visible := (Not cdsDepPlanoSaudeTot.isEmpty);
End;

Procedure TfrmGeraDIRF_Novo.AtualizaValorDepenSaude(pSit: Integer);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  If (Not cdsDepPlanoSaudeTot.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      If Application.MessageBox(PChar('Este procedimento atualizará todos os lançamentos  deste' + #13 +
        'Dependente, inclusive na base original (RETASSIST) com o' + #13 +
        'novo Valor informado ! Continua ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Screen.Cursor := crSQLWait;
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.add('UPDATE DIRF_MOVANALFF_DEPEN   ');
            qryAux1.SQL.add('SET VALOR =:p1, TrgDtAlteracao =:p2, TrgUserAlteracao =:p3     ');
            qryAux1.SQL.add('WHERE IDDIRF = ' + cdsDepPlanoSaude.fieldByname('IDDIRF').asString);
            If pSit = 0 Then // Todos os lançamentos
              Begin
                qryAux1.SQL.add(' AND CPFTITULAR = ' + cdsDepPlanoSaude.fieldByname('CPFTITULAR').asString);
                qryAux1.SQL.add(' AND IDDEPEN = ' + cdsDepPlanoSaude.fieldByname('IDDEPEN').asString);
                qryAux1.SQL.add(' AND IDPROVENTO = ' + cdsDepPlanoSaude.fieldByname('IDPROVENTO').asString);
              End
            Else // Apenas o lançamento selecionado
              qryAux1.SQL.add(' AND IDDIRFMOVANALFFDEPEN = ' + cdsDepPlanoSaude.fieldByname('IDDIRFMOVANALFFDEPEN').asString);
            qryAux1.Parambyname('p1').asFloat := edNovoValorPlSaude.value;
            qryAux1.Parambyname('p2').asDateTime := Now;
            qryAux1.Parambyname('p3').asInteger := Sistema.IdUsuario;
            qryAux1.ExecSQL;

            // Atualizar a RetAssist
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.add('UPDATE RETASSIST SET VALOR =:p1     ');
            qryAux2.SQL.add('WHERE IDTITULAR = ' + cdsDepPlanoSaude.fieldByname('IDTITULAR').asString);
            qryAux2.SQL.add('      AND IDPESSOA = ' + cdsDepPlanoSaude.fieldByname('IDDEPEN').asString);
            qryAux2.SQL.add('      AND IDPROVENTO = ' + cdsDepPlanoSaude.fieldByname('IDPROVENTO').asString);
            If pSit = 1 Then
              Begin
                qryAux2.SQL.add(' AND ANO = ' + quotedstr(qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString));
                qryAux2.SQL.add(' AND MES = ' + quotedstr(cdsDepPlanoSaude.fieldByname('MES').asString));
              End;
            qryAux2.Parambyname('p1').asFloat := edNovoValorPlSaude.value;
            qryAux2.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            RegAtual1 := cdsDepPlanoSaude.GetBookmark; // Salvando o ponteiro do Registro
            RegAtual2 := cdsDepPlanoSaudeTot.GetBookmark; // Salvando o ponteiro do Registro

            // Plano de Saude Dependentes
            cdsDepPlanoSaude.data := oDIRF.ListaDadosDependentesPlanos(
              qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
              1,
              cdsDepPlanoSaudeTot.fieldByname('CPFTITULAR').asString,
              cdsDepPlanoSaudeTot.fieldByname('CPFDEPEN').asString,
              cdsDepPlanoSaudeTot.fieldByname('NOME').asString);

            // Plano de Saude totalizado
            cdsDepPlanoSaudeTot.data := oDIRF.ListaTotalDependentesPlanos(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              1, // Tipo do Plano de assistencia (saude ou odonto)
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);

            cdsDepPlanoSaudeTot.GotoBookmark(RegAtual2); // Voltando ao Reg. atual
            cdsDepPlanoSaude.GotoBookmark(RegAtual1); // Voltando ao Reg. atual

            Screen.Cursor := crDefault;
          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;

                Application.MessageBox(PChar(oDIRF.MessageInfo), 'Atenção !', Mb_IconExclamation);
              End;
          End;
        End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.AtualizaValorDepenOdonto(pSit: Integer);
Var RegAtual1, RegAtual2: TBookMark;
Begin
  If (Not cdsDepPlanoOdontoTot.isEmpty) And
    (qryDIRFGeradas.fieldbyname('NUMRECIBO').isNull) Then
    Begin
      If Application.MessageBox(PChar('Este procedimento atualizará todos os lançamentos  deste' + #13 +
        'Dependente, inclusive na base original (RETASSIST) com o' + #13 +
        'novo Valor informado ! Continua ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Screen.Cursor := crSQLWait;
            qryAux1.Close;
            qryAux1.SQL.Clear;
            qryAux1.SQL.add('UPDATE DIRF_MOVANALFF_DEPEN   ');
            qryAux1.SQL.add('SET VALOR =:p1, TrgDtAlteracao =:p2, TrgUserAlteracao =:p3     ');
            qryAux1.SQL.add('WHERE IDDIRF = ' + cdsDepPlanoOdonto.fieldByname('IDDIRF').asString);
            If pSit = 0 Then
              Begin
                qryAux1.SQL.add(' AND CPFTITULAR = ' + cdsDepPlanoOdonto.fieldByname('CPFTITULAR').asString);
                qryAux1.SQL.add(' AND IDDEPEN = ' + cdsDepPlanoOdonto.fieldByname('IDDEPEN').asString);
                qryAux1.SQL.add(' AND IDPROVENTO = ' + cdsDepPlanoOdonto.fieldByname('IDPROVENTO').asString);
              End
            Else
              qryAux1.SQL.add(' AND IDDIRFMOVANALFFDEPEN = ' + cdsDepPlanoOdonto.fieldByname('IDDIRFMOVANALFFDEPEN').asString);
            qryAux1.Parambyname('p1').asFloat := edNovoValorPlOdonto.value;
            qryAux1.Parambyname('p2').asDateTime := Now;
            qryAux1.Parambyname('p3').asInteger := Sistema.IdUsuario;
            qryAux1.ExecSQL;

            // Atualizar a RetAssist
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.add('UPDATE RETASSIST   ');
            qryAux2.SQL.add('SET VALOR =:p1     ');
            qryAux2.SQL.add('WHERE IDTITULAR = ' + cdsDepPlanoOdonto.fieldByname('IDTITULAR').asString);
            qryAux2.SQL.add('      AND IDPESSOA = ' + cdsDepPlanoOdonto.fieldByname('IDDEPEN').asString);
            qryAux2.SQL.add('      AND IDPROVENTO = ' + cdsDepPlanoOdonto.fieldByname('IDPROVENTO').asString);
            If pSit = 1 Then
              Begin
                qryAux2.SQL.add(' AND ANO = ' + quotedstr(qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString));
                qryAux2.SQL.add(' AND MES = ' + quotedstr(cdsDepPlanoOdonto.fieldByname('MES').asString));
              End;
            qryAux2.Parambyname('p1').asFloat := edNovoValorPlOdonto.value;
            qryAux2.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            RegAtual1 := cdsDepPlanoOdonto.GetBookmark; // Salvando o ponteiro do Registro
            RegAtual2 := cdsDepPlanoOdontoTot.GetBookmark; // Salvando o ponteiro do Registro

            // Plano Odonto Dependentes
            cdsDepPlanoOdonto.data := oDIRF.ListaDadosDependentesPlanos(
              qryDIRFGeradas.fieldByname('IDDIRF').asInteger,
              2,
              cdsDepPlanoOdontoTot.fieldByname('CPFTITULAR').asString,
              cdsDepPlanoOdontoTot.fieldByname('CPFDEPEN').asString,
              cdsDepPlanoOdontoTot.fieldByname('NOME').asString);

            // Plano Odonto Total
            cdsDepPlanoOdontoTot.data := oDIRF.ListaTotalDependentesPlanos(
              cdsDIRFMovSintFF.fieldByname('IDDIRF').asInteger,
              2, // Tipo do Plano de assistencia (saude ou odonto)
              cdsDIRFMovSintFF.fieldByname('NUMDOCUMENTO').asString);

            cdsDepPlanoOdontoTot.GotoBookmark(RegAtual2); // Voltando ao Reg. atual
            cdsDepPlanoOdonto.GotoBookmark(RegAtual1); // Voltando ao Reg. atual

            Screen.Cursor := crDefault;
          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;

                Application.MessageBox(PChar(oDIRF.MessageInfo), 'Atenção !', Mb_IconExclamation);
              End;
          End;
        End;
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmGeraDIRF_Novo.spbGeraArquivoDIRFFFClick(Sender: TObject);
Var sNomeArquivo, sNomeArquivoCompleto, sCompetencia, sCompetenciaAnt, sPathArquivo: String;
Begin
//  If (Not cdsDIRFMovSintFF.isEmpty) And
 //   (qryDIRFGeradas.fieldByname('NUMRECIBO').isnull) Then
  //  Begin
      If Application.MessageBox(MSG009, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          // SOL 246475  PPM 636290 - Paulo Nobre
          sCompetencia := inttostr(DiasUteis.ExtraiAno(date));
          sCompetenciaAnt := qryDIRFGeradas.fieldByname('EXERCICIODIRF').asString;
          sPathArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\DIRF\';
          sNomeArquivo := trim(qryDadosAdicionais.FieldbyName('CNPJFUNDACAO').asString) + '-DIRF-' + sCompetencia + '-' + sCompetenciaAnt +
            FU.IFF(qryDIRFGeradas.fieldByname('TIPODIRF').asString = 'O', '-ORIGI_', '-RETIF-') + sTipoMov + '-NORMAL.DEC';
          sNomeArquivoCompleto := sPathArquivo + sNomeArquivo;

          If Not DirectoryExists(sPathArquivo) Then
            ForceDirectories(sPathArquivo);

          dlgSalvarArquivoEnvio.InitialDir := sPathArquivo;
          dlgSalvarArquivoEnvio.FileName := sNomeArquivo;
          If dlgSalvarArquivoEnvio.Execute Then
            Begin
              sNomeArquivoCompleto := dlgSalvarArquivoEnvio.FileName;
              stArquivo.caption := sNomeArquivoCompleto;
              Screen.Cursor := crSQLWait;
              Try
                If Not oDIRF.Exporta(
                  'FF',                           // sTipoMov tirar isso
                  sNomeArquivoCompleto,
                  '',
                  '',
                  qryDIRFGeradas,
                  qryDIRFMovSintTributos,
                  qryDadosAdicionais,
                  qryDIRFMovSintTributosFF,
                  // Paulo Nobre SIG 34459 - Inicio
          //    qryDIRFMovDetFF,
          //    cdsDIRFMovSintCNPJ,
          //    cdsDIRFMovSintFF,
                 // Paulo Nobre SIG 34459 - Fim
                  cdsDepPlanoSaudeTot,
                  cdsDepPlanoOdontoTot) Then
                  Begin
                    Application.MessageBox(MSG016, 'Atenção !', MB_ICONINFORMATION + MB_OK);
                    Exit;
                  End
                Else
                  Begin
                    Application.MessageBox(MSG015, 'Atenção !', MB_ICONINFORMATION + MB_OK);

                    qryDIRFGeradas.DisableControls;

                    If Not dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.StartTransaction;

                    qryAux1.Close;
                    qryAux1.SQL.Clear;
                    qryAux1.SQL.add('UPDATE DIRF SET FLGARQUIVOGERADO = ''S'' ');
                    qryAux1.SQL.add('WHERE IDDIRF = ' + qryDIRFGeradas.fieldByname('IDDIRF').asString);
                    qryAux1.ExecSQL;

                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.Commit;

                    qryDIRFGeradas.Close;
                    qryDIRFGeradas.Open;

                    Screen.Cursor := crDefault;
                    qryDIRFGeradas.EnableControls;
                  End;
              Except
                Raise;
              End;
            End;
        End;
  //  End;
End;

Procedure TfrmGeraDIRF_Novo.dbgTotDepPlanoSaude2DrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not cdsDepPlanoSaudeTot.isEmpty Then
    Begin
      If cdsDepPlanoSaudeTot.fieldByname('VALOR').asFloat <= 0 Then
        Begin
          dbgTotDepPlanoSaude2.Canvas.Font.Style := [fsStrikeout];
          dbgTotDepPlanoSaude2.Canvas.Font.Color := clRed;

          dbgTotDepPlanoSaude2.DefaultDrawDataCell(Rect, Field, State);
        End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgDepPlanoSaudeDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not cdsDepPlanoSaude.isEmpty Then
    Begin
      If cdsDepPlanoSaude.fieldByname('VALOR').asFloat <= 0 Then
        Begin
          dbgDepPlanoSaude.Canvas.Font.Style := [fsStrikeout];
          dbgDepPlanoSaude.Canvas.Font.Color := clRed;

          dbgDepPlanoSaude.DefaultDrawDataCell(Rect, Field, State);
        End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.SpbAtuValorPlSaudeClick(Sender: TObject);
Begin
  AtualizaValorDepenSaude(1);
End;

Procedure TfrmGeraDIRF_Novo.SpeedButton8Click(Sender: TObject);
Begin
  AtualizaValorDepenSaude(0);
End;

Procedure TfrmGeraDIRF_Novo.SpbAtuValorPlOdontoClick(Sender: TObject);
Begin
  AtualizaValorDepenOdonto(1);
End;

Procedure TfrmGeraDIRF_Novo.SpeedButton9Click(Sender: TObject);
Begin
  AtualizaValorDepenOdonto(0);
End;

Procedure TfrmGeraDIRF_Novo.dbgTotDepPlanoOdonto3DrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not cdsDepPlanoOdontoTot.isEmpty Then
    Begin
      If cdsDepPlanoOdontoTot.fieldByname('VALOR').asFloat = 0 Then
        Begin
          dbgTotDepPlanoOdonto2.Canvas.Font.Style := [fsStrikeout];
          dbgTotDepPlanoOdonto2.Canvas.Font.Color := clRed;

          dbgTotDepPlanoOdonto2.DefaultDrawDataCell(Rect, Field, State);
        End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgDepPlanoOdontoDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not cdsDepPlanoOdonto.isEmpty Then
    Begin
      If cdsDepPlanoOdonto.fieldByname('VALOR').asFloat <= 0 Then
        Begin
          dbgDepPlanoOdonto.Canvas.Font.Style := [fsStrikeout];
          dbgDepPlanoOdonto.Canvas.Font.Color := clRed;

          dbgDepPlanoOdonto.DefaultDrawDataCell(Rect, Field, State);
        End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgTotDepPlanoOdonto2DrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  If Not cdsDepPlanoOdontoTot.isEmpty Then
    Begin
      If cdsDepPlanoOdontoTot.fieldByname('VALOR').asFloat <= 0 Then
        Begin
          dbgTotDepPlanoOdonto2.Canvas.Font.Style := [fsStrikeout];
          dbgTotDepPlanoOdonto2.Canvas.Font.Color := clRed;

          dbgTotDepPlanoOdonto2.DefaultDrawDataCell(Rect, Field, State);
        End;
    End;
End;

Procedure TfrmGeraDIRF_Novo.dbgMovResumoFFDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If Not qryDIRFMovResumoFF.isEmpty Then
    Begin
      If qryDIRFMovResumoFF.FieldByName('FLGMARCADO').AsString = 'N' Then
        Begin
          dbgMovResumoFF.Canvas.Font.Style := [fsStrikeout];
          dbgMovResumoFF.Canvas.Font.Color := clRed;
        End;

      If (Field.Name = 'qryDIRFMovResumoFFVLRTOTAL') Then
        dbgMovResumoFF.Canvas.Font.Style := [fsbold];

      If qryDIRFMovResumoFF.FieldByName('ORD').AsInteger = 1 Then
        dbgMovResumoFF.Canvas.Font.Style := [fsbold];

      dbgMovResumoFF.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.edAnoCalendario1Change(Sender: TObject);
Begin
  If sTipoMov = 'CP' Then
    sAnoExercicioDIRF := edAnoCalendario1.text;
  If sTipoMov = 'FF' Then
    sAnoExercicioDIRF := edAnoCalendario2.text;
End;

Procedure TfrmGeraDIRF_Novo.cdsDIRFMovSintCNPJAfterScroll(DataSet: TDataSet);
Begin
  If Length(Trim(cdsDIRFMovSintCNPJNUMDOCUMENTO.asString)) = 11 Then
    cdsDIRFMovSintCNPJNUMDOCUMENTO.EditMask := '999.999.999\-99;0; '
  Else
    cdsDIRFMovSintCNPJNUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0; ';      // Paulo Nobre - WO34233
End;

Procedure TfrmGeraDIRF_Novo.qryDIRFMovDetCNPJAfterScroll(DataSet: TDataSet);
Begin
  If Length(Trim(qryDIRFMovDetCNPJNUMDOCUMENTO.asString)) = 11 Then
    qryDIRFMovDetCNPJNUMDOCUMENTO.EditMask := '999.999.999\-99;0; '
  Else
    qryDIRFMovDetCNPJNUMDOCUMENTO.EditMask := 'AA.AAA.AAA\/AAAA\-99;0; ';      // Paulo Nobre - WO34233
End;

Procedure TfrmGeraDIRF_Novo.dbgGridAnaliticoDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  //edilaine SIG119889 : inicio
  if (qryDIRFGeradas.ControlsDisabled)  or (bCarregaDadosInicias) then
     exit;
  //edilaine SIG119889 : fim

  // Paulo Nobre - SOL 226868 KTN 2060896 19/02/2014
  If Not cdsDIRFMovSintCNPJ.isEmpty Then
    Begin
      If (cdsDIRFMovSintCNPJ.FieldByName('VLRRENDIMENTO').AsFloat = 0.00) And (cdsDIRFMovSintCNPJ.FieldByName('VLRIMPOSTO').AsFloat = 0.00) Then
        Begin
          dbgGridAnalitico.Canvas.Font.Style := [fsStrikeout];
          dbgGridAnalitico.Canvas.Font.Color := clRed;
        End;

      dbgGridAnalitico.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmGeraDIRF_Novo.qryDIRFMovSintTributosAfterScroll(DataSet: TDataSet);
Begin
  //edilaine SIG119889 : inicio
  if qryDIRFGeradas.ControlsDisabled then
     exit;
  //edilaine SIG119889 : fim

  cdsDIRFMovSintCNPJ.data := oDIRF.LocalizaDIRF_MovSintCNPJ(
    qryDIRFMovSintTributos.fieldByname('IDDIRF').asInteger,
    qryDIRFMovSintTributos.fieldByname('CODNATUREZA').asString);
End;

Procedure TfrmGeraDIRF_Novo.dbgGridAnaliticoRowChanged(Sender: TObject);
Begin
  meQtdDBCP.Caption := Format('%.2d / %.2d', [cdsDIRFMovSintCNPJ.RecNo, cdsDIRFMovSintCNPJ.RecordCount]);
End;

Procedure TfrmGeraDIRF_Novo.qryDIRFMovSintTributosFFAfterScroll(DataSet: TDataSet);
Begin
  //edilaine SIG119889 : inicio
  if qryDIRFGeradas.ControlsDisabled then
     exit;
  //edilaine SIG119889 : fim

  // Movimento Sintetico
  cdsDIRFMovSintFF.data := oDIRF.ListaDIRF_MovSintFF(
    qryDIRFMovSintTributosFF.fieldByname('IDDIRF').asInteger,
    qryDIRFMovSintTributosFF.fieldByname('CODNATUREZA').asString);
End;

Procedure TfrmGeraDIRF_Novo.spbProcuraIgualClick(Sender: TObject);
Var sCNPJ: String;
Begin
  If Not cdsDIRFMovSintCNPJ.isEmpty Then
    Begin
      sCNPJ := cdsDIRFMovSintCNPJ.fieldbyname('NUMDOCUMENTO').asString;

      If cdsDIRFMovSintCNPJ.fieldbyname('CODNATUREZA').asString = '1708' Then
        qryDIRFMovSintTributos.Locate('CODNATUREZA', '5952', [])
      Else If cdsDIRFMovSintCNPJ.fieldbyname('CODNATUREZA').asString = '5952' Then
        qryDIRFMovSintTributos.Locate('CODNATUREZA', '1708', []);

      cdsDIRFMovSintCNPJ.Locate('NUMDOCUMENTO', sCNPJ, []);
    End;
End;

Procedure TfrmGeraDIRF_Novo.ppHeaderBand1BeforePrint(Sender: TObject);
Begin
  If (cdsComRenJuridica.fieldByname('CODNATUREZA').asString = '1708') Or
    (cdsComRenJuridica.fieldByname('CODNATUREZA').asString = '8045') Then
    Begin
      ppTit1.Caption := 'COMPROVANTE ANUAL DE RENDIMENTOS PAGOS OU';
      ppTit2.Caption := 'CREDITADOS E DE RETENÇÃO DE';
      ppTit3.Caption := 'IMPOSTO DE RENDA NA FONTE - PESSOA JURÍDICA';
    End
  Else If cdsComRenJuridica.fieldByname('CODNATUREZA').asString = '5952' Then
    Begin
      ppTit1.Caption := 'COMPROVANTE ANUAL DE RETENÇÃO DE CSLL';
      ppTit2.Caption := 'Cofins e PIS/Pasep (Lei nº 10.833, de 2003, art. 30)';
      ppTit3.Caption := '';
    End;
End;

Procedure TfrmGeraDIRF_Novo.btnAnalisaFFClick(Sender: TObject);
Begin
  If qryDIRFGeradas.fieldbyname('NUMRECIBO').isnull Then
    Begin
      If qryDIRFGeradas.fieldbyname('FLGDIRFFINALIZADAFF').asString = 'S' Then
        AnalisaSIMNAO('N')
      Else
        AnalisaSIMNAO('S');
    End
  Else
    Application.MessageBox(MSG003, 'Atenção !', Mb_IconExclamation);
End;

//Darivaldo Alencar SIG 23598 -inicio

Procedure TfrmGeraDIRF_Novo.dbgMovAnaliticoTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
  If (qryDIRFMovDetCNPJ.IsEmpty) Or
    ((AFieldName <> 'DATAPAGAMENTO')
    And (AFieldName <> 'NODOCUMENTO')
    And (AFieldName <> 'NUMAPGR')
    And (AFieldName <> 'VLRRENDIMENTO')
    And (AFieldName <> 'VLRIMPOSTO')) Then
    Exit;

  sNmColuna := AFieldName;

  If (sTpOrder <> 'ASC') Then
    sTpOrder := 'ASC'
  Else
    sTpOrder := 'DESC';

  Try
    qryDIRFMovDetCNPJ.Close;
    qryDIRFMovDetCNPJ.SQL.Clear;
    qryDIRFMovDetCNPJ.SQL.Text := oDIRF.LocalizaDIRF_MovDetCNPJ(' ORDER BY ' + AFieldName + ' ' + sTpOrder);
    qryDIRFMovDetCNPJ.Open;
  Finally
    qryDIRFMovDetCNPJ.First;
  End;
End;
//Darivaldo Alencar SIG 23598 -fim

//Darivaldo Alencar SIG 23598 -inicio

Procedure TfrmGeraDIRF_Novo.dbgMovAnaliticoCalcTitleImage(Sender: TObject;
  Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
  If (Field.FieldName = 'DATAPAGAMENTO') Or
    (Field.FieldName = 'NODOCUMENTO') Or
    (Field.FieldName = 'NUMAPGR') Or
    (Field.FieldName = 'VLRRENDIMENTO') Or
    (Field.FieldName = 'VLRIMPOSTO')
    Then
    TitleImageAttributes.ImageIndex := 0;

  If (Field.FieldName = sNmColuna) Then
    Begin
      If (sTpOrder = 'DESC') Then
        TitleImageAttributes.ImageIndex := 1
      Else
        TitleImageAttributes.ImageIndex := 0;
    End;
End;
//Darivaldo Alencar SIG 23598 -fim

// Paulo Nobre SIG 34459 - Inicio

Function TfrmGeraDIRF_Novo._TotalizaColunaBenefPA(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  cdsBenefPA.DisableControls;
  cdsBenefPA.First;
  While Not cdsBenefPA.EOF Do
    Begin
      dTotalFiltro := dTotalFiltro + cdsBenefPA.Fieldbyname(pCampo).asFloat;

      cdsBenefPA.Next;
    End;
  cdsBenefPA.First;
  cdsBenefPA.enableControls;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, pDecimal);
End;
// Paulo Nobre SIG 34459 - Inicio

// Andre Imakawa - SIG 41768 - Inicio
procedure TfrmGeraDIRF_Novo.SelDados(pNumDocumento, pAnoRef, pCodNatureza: String; pIdDirf: Integer);
begin
  SqlDados.Prepare;
  SqlDados.ParamByName('NUMDOCUMENTO').AsString := pNumDocumento;
  SqlDados.ParamByName('ANOREF').AsString := pAnoRef;
  SqlDados.ParamByName('IDDIRF').AsInteger := pIdDirf;
  SqlDados.ParamByName('NATUREZA').AsString := pCodNatureza;
  SqlDados.Open;

end;
// Andre Imakawa - SIG 41768 - Fim

procedure TfrmGeraDIRF_Novo.edtVersaoLeiauteChange(Sender: TObject);
begin
  if sTipoMov = 'CP' then
    sVersaoLeiaute := edtVersaoLeiaute.Text;

  if sTipoMov = 'FF' then
    sVersaoLeiaute := edtVersaoLeiauteF.Text;
end;

End.

