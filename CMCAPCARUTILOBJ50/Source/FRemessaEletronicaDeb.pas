{-------------------------------------------------------------------------------
-------------------------- HISTÓRICO DE ALTERAÇÃO ------------------------------
--------------------------------------------------------------------------------
 N. Chamado....: WO33342
 Dt Alteração..: 25/02/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .Ajustando o padrão da mascara atual do CNPJ para 
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
--------------------------------------------------------------------------------
 N. WO..............: 27905
 Data da Alteração..: 17/11/2025
 Responsável........: Edilaine
 Descrição..........: Otimizar atualizacao de documentos baseado em tabela temp
--------------------------------------------------------------------------------
 N. Chamado....: MIGRACAO-ORACLE
 Dt Alteração..: 21/10/2025
 Responsável...: Edilaine
 Descrição.....: colocado CAST nas consultas para defdinir o tamanho do campo NSA
--------------------------------------------------------------------------------
 Pendência....: 119696
 Responsável..: Everson Cunha
 Data.........: 22/02/2022
 Descrição....: "Dividir" as funcionalidades do botão "Cancelamento de Débito"
                em dois botões, um para cancelar o arquivo internamente e outro
                para cancelamento de débito junto ao Banco.
                Implementar o botão analisar conforme os outros Forms da Remessa
                Eletrônica.
--------------------------------------------------------------------------------
 Pendência....: SIG 114623
 Responsável..: Ewerton Beltramini
 Data.........: 29/01/2021
 Descrição....: Implementação do comando Copy, para igualar as bases de produção
--------------------------------------------------------------------------------
 N. SIG.............: 111426
 Data da Alteração..: 01/12/2020
 Responsável........: Everson Cunha
 Descrição..........: Melhoria no formato do Cancelamento
--------------------------------------------------------------------------------
 N. SIG.............: 104134
 Data da Alteração..: 17/11/2020
 Responsável........: Everson Cunha
 Descrição..........: Melhoria performance SIACC
--------------------------------------------------------------------------------
 N. SIG.............: 103935
 Data da Alteração..: 09/11/2020
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/Ajustes SIACC
--------------------------------------------------------------------------------
 N. SIG.............: 103725
 Data da Alteração..: 30/10/2020
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/Ajustes SIACC
--------------------------------------------------------------------------------
 Rotina.............: spbPrepararEnvioClick, spbGerarArqClick,
                      spbRegerarArqClick
 N. SIG.............: 102320
 Data da Alteração..: 30/09/2020
 Responsável........: Cássio Florencio Rovaroto
 Descrição..........: Atualização de execução da rotina de arquivo de débito.
--------------------------------------------------------------------------------
 N. SIG.............: 63651
 Data da Alteração..: 12/11/2019
 Alteração Form.....: FRemessaEletronicaDeb
 Responsável........: Cássio Florencio Rovaroto
 Descrição..........: Criação da funcionalidade de Remessa Eletrônica a débito.
--------------------------------------------------------------------------------}

Unit FRemessaEletronicaDeb;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, ExtCtrls, wwdbdatetimepicker, uCmMath,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBClient, uCMClientDataSet, FileCtrl, TEdNum,
  ComCtrls, MontaSelect, DBTables, DBCtrls, uCmSqlParams,
  QExport3Dialog, Grids, Wwdbigrd, Wwdbgrid, Wwintl, ImgList, wwDialog,
  Wwlocate, wwSpeedButton, wwDBNavigator, Mask, uDiasUteis,
  wwdbedit, ppBands, ppPrnabl, ppClass, ppCtrls, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  CMProcura, TREdit, jpeg, ppVar, Wwquery, QExport3,
  TXComp, TXRB, Wwfltdlg, wwidlg, Menus, wwclearpanel, Wwdatsrc, Wwdbdlg,
  Gauges, TB97Ctls, CMProcuraSubTipo, CmParamReport,
  uCtrlParamIntegra, uCtrlRemessaEletronicaDeb, uFuncoesUteisIR, uCtrlPadroes,
  ppModule, raCodMod, uCtrlDocumento, 
  uCtrlFuncoesCapCar, wwriched, DBGrids, ppStrtch, ppRichTx, ppMemo;

Const CorDaZebra = clBtnFace; // $00FDD2D0
Const iClientHeight = 728; // Altura padrão do Form
Const iClientWidth = 1166; // Largura padrão do Form

  // Mensagens Gerais
Const MSG001 = 'Obrigatório preencher o Convênio.';
Const MSG002 = 'Obrigatório preencher a Data Inicial.';
Const MSG003 = 'Obrigatório preencher a Data Final.';
Const MSG004 = 'Data Inicial não pode ser superior a Data Final.';
Const MSG005 = 'Confirma Exclusão dos Lançamentos Importados ?';
Const MSG006 = 'Favorecido não Informado.';
Const MSG007 = 'Dados Bancários não Informados.';
Const MSG008 = 'Valor do Pagamento não Informado.';
Const MSG010 = 'Valor do Lançamento MAIOR que o Saldo do Documento.';
Const MSG011 = 'Valor Total da Lista MAIOR que o Saldo do Documento.';
Const MSG012 = 'Não há Lançamento(s) Marcado(s).';
Const MSG013 = 'Tipo "Ficha de Compensação" com tamanho inválido.';
Const MSG014 = 'Tipo "Arrecadação" com tamanho inválido.';
Const MSG015 = 'Código de Barras ou Linha Digitável Inválido.';
Const MSG016 = 'Data de Pagamento não Informada.';
Const MSG017 = 'Não há Saldo Disponível para esta Operação.';
Const MSG018 = 'Código de Barras/Linha Digitável não Informado.';
Const MSG019 = 'Não há Movimento Disponível.';
Const MSG020 = 'Não localizado Movimento para os critérios Selecionados.';
Const MSG021 = 'Sem Lançamento para esta Operação.';
Const MSG022 = 'O Convênio selecionado não possui diretório de destino Informado.';
Const MSG023 = 'Problemas no Processamento do Arquivo !';
Const MSG024 = 'Não existe Movimento Importado para ser Excluído.';
Const MSG025 = 'Movimento Importado Excluído com Sucesso !';
Const MSG026 = 'Não há Lançamento(s) ''Baixado(s)'' para Desfazer Baixa.';
Const MSG027 = 'Esta Forma de Pagamento não permite a inclusão de Favorecidos.';
Const MSG028 = 'Esta Forma de Pagamento não permite a inclusão de Títulos.';
Const MSG029 = 'CPF/CNPJ Inválido.';
Const MSG030 = 'Este Boleto não pode ser pago pela CAIXA.';
Const MSG031 = 'Problemas no Processamento do Arquivo de Retorno.';
Const MSG032 = 'Obrigatório preencher a Forma de Pagamento.';
Const MSG033 = 'CPF/CNPJ do Favorecido não Informado.';
Const MSG034 = 'Tipo da Conta não definida no Cadastro deste Favorecido.';
Const MSG035 = 'Não há arquivos enviados para este convênio.';
Const MSG036 = 'Não foram encontados arquivos de retorno para este convênio.';

// Mensagens de inconsistências da Análise do Movimento
Const AnMSG01 = 'Banco do Cliente / ';
Const AnMSG02 = 'Agência do Cliente / ';
Const AnMSG03 = 'Conta do Cliente / ';
Const AnMSG04 = 'Tipo da Conta do Cliente / ';
Const AnMSG05 = 'CPF/CNPJ do Cliente / ';


type rgRetorno = record
    IdArquivoPagto: Integer;                                       
    NomeArq: string;
    NSA: integer;
end;

Type

  TFrmRemessaEletronicaDeb = Class(TfrmSairAjuda)
    pcGeralRemessa: TPageControl;
    tbsAnalise: TTabSheet;
    tbsGeraArquivo: TTabSheet;
    ListaDeImagens: TImageList;
    DevRptCM: TExtraOptions;
    rptMovArqGerado: TppReport;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList1: TppParameterList;
    ppEmpresa: TppBDEPipeline;
    FMovRemessa: TwwFilterDialog;
    LMovRemessa: TwwLocateDialog;
    cdsConvenio: TCMClientDataSet;
    dsConvenio: TDataSource;
    SQLConvenio: TCMSqlParams;
    qeMovRemessa: TQExport3Dialog;
    SQLMovRemessa: TCMSqlParams;
    cdsMovRemessa: TCMClientDataSet;
    dsMovRemessa: TwwDataSource;
    dsTipoPagto: TwwDataSource;
    qryAux: TwwQuery;
    cdsTipoPagto: TCMClientDataSet;
    SQLTipoPagto: TCMSqlParams;
    imgBotoesManut: TImageList;
    Panel1: TPanel;
    pcAnaliseRemessa: TPageControl;
    tbsAnaliseMovimento: TTabSheet;
    Panel5: TPanel;
    spbExpBenefSel: TSpeedButton;
    spbMarcaTodos: TSpeedButton;
    spbInverterSel: TSpeedButton;
    stQtd1: TStaticText;
    wwDBNavigator4: TwwDBNavigator;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    btnavLocalizarBenef: TwwNavButton;
    btnavFiltrarSelecao: TwwNavButton;
    tbsAnaliseManutencoes: TTabSheet;
    pcDetalManut: TPageControl;
    tbsAnManTitulos: TTabSheet;
    Panel7: TPanel;
    pnlGridMovTitulo: TPanel;
    dbgMovTitulos: TwwDBGrid;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    btnIncTit: TToolbarButton97;
    btnAltTit: TToolbarButton97;
    btnExcTit: TToolbarButton97;
    tbsAnManGeral: TTabSheet;
    tbsAnManListaFavorec: TTabSheet;
    pnlInfMan: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel8: TPanel;
    cdsConvenioCODPORTFORMA: TFloatField;
    cdsConvenioDESCRICAO: TStringField;
    cdsTipoPagtoCODFORMA: TFloatField;
    cdsTipoPagtoDESCRICAO: TStringField;
    cdsMovRemessaNUM_AP: TFloatField;
    cdsMovRemessaNUM_DOC: TFloatField;
    cdsMovRemessaRAZAOSOCIAL: TStringField;
    cdsMovRemessaVALOR: TFloatField;
    cdsMovRemessaDATAPROGRAMADA: TDateTimeField;
    cdsMovRemessaFORMA_PAGTO: TStringField;
    cdsMovRemessaMARCADO: TStringField;
    cdsMovRemessaCODDOCUMENTO: TFloatField;
    cdsMovRemessaNUMDOCUMENTO: TStringField;
    dsMovListaFavorecidos: TwwDataSource;
    MSFavorec: TMontaSelect;
    LMovLista: TwwLocateDialog;
    dlgAbreArquivo: TOpenDialog;
    wwDBNavigator3: TwwDBNavigator;
    wwNavButton14: TwwNavButton;
    wwNavButton15: TwwNavButton;
    wwNavButton16: TwwNavButton;
    wwNavButton17: TwwNavButton;
    qryMovListaFavorecidos: TwwQuery;
    qryMovListaFavorecidosCODDOCUMENTO: TFloatField;
    qryMovListaFavorecidosIDDOCUMENTOXPESSOAS: TFloatField;
    qryMovListaFavorecidosIDFORCLI: TFloatField;
    qryMovListaFavorecidosRAZAOSOCIAL: TStringField;
    qryMovListaFavorecidosNUMDOCUMENTO: TStringField;
    qryMovListaFavorecidosIDCBANCARIA: TFloatField;
    qryMovListaFavorecidosNUMBANCO: TStringField;
    qryMovListaFavorecidosNUMAGENCIA: TStringField;
    qryMovListaFavorecidosNUMOPERACAO: TStringField;
    qryMovListaFavorecidosNUMCONTA: TStringField;
    qryMovListaFavorecidosVALOR: TFloatField;
    qryMovListaFavorecidosFLGIMPORTADO: TStringField;
    updMovListaFavorecidos: TUpdateSQL;
    Panel9: TPanel;
    qryContaBancaria: TwwQuery;
    qryContaBancariaNUMBANCO: TStringField;
    qryContaBancariaNUMAGENCIA: TStringField;
    qryContaBancariaNUMCONTA: TStringField;
    qryContaBancariaIDPESSOA: TFloatField;
    qryContaBancariaIDCBANCARIA: TFloatField;
    pcGeraArquivoOper: TPageControl;
    tbsGAGerados: TTabSheet;
    Panel14: TPanel;
    Panel16: TPanel;
    dbgMovRemessa: TwwDBGrid;
    Panel18: TPanel;
    Panel19: TPanel;
    pnlGridMovLista: TPanel;
    dbgMovListaFav: TwwDBGrid;
    Dock974: TDock97;
    spbImportarMovLista: TSpeedButton;
    spbLimparMovLista: TSpeedButton;
    Toolbar974: TToolbar97;
    btnInc1: TToolbarButton97;
    btnAlt1: TToolbarButton97;
    btnExc1: TToolbarButton97;
    dbNavListFavorec: TwwDBNavigator;
    wwNavButton5: TwwNavButton;
    wwNavButton10: TwwNavButton;
    wwNavButton11: TwwNavButton;
    wwNavButton12: TwwNavButton;
    wwNavButton13: TwwNavButton;
    pnlDadosMovLista: TPanel;
    Label7: TLabel;
    GpConta: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    spbBuscaContaCor: TSpeedButton;
    DbeConta: TwwDBEdit;
    dbeBanco: TwwDBEdit;
    DbeAgencia: TwwDBEdit;
    dbeValorPagtoLista: TDBRealEdit;
    GroupBox1: TGroupBox;
    spbLocalizaFavorec: TSpeedButton;
    dbeNomeFavorec: TwwDBEdit;
    tbsGAPendentes: TTabSheet;
    Panel40: TPanel;
    Dock976: TDock97;
    Toolbar973: TToolbar97;
    btnAltGeral: TToolbarButton97;
    pnlDadosMovGeral: TPanel;
    dsMovArqPendente: TwwDataSource;
    dsMovArqPendDet: TwwDataSource;
    qryAux2: TwwQuery;
    qryMovArqPendDet: TwwQuery;
    cdsMovRemessaCODFORMA: TFloatField;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SpeedButton5: TSpeedButton;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    cdsTipoPagtoGeral: TCMClientDataSet;
    StringField1: TStringField;
    FloatField1: TFloatField;
    dsTipoPagtoGeral: TwwDataSource;
    GroupBox2: TGroupBox;
    DblCodForma: TwwDBLookupCombo;
    SqlTipoPagtoGeral: TCMSqlParams;
    qryDocumento: TwwQuery;
    dsDocumento: TwwDataSource;
    updDocumento: TUpdateSQL;
    qryDocumentoCODDOCUMENTO: TFloatField;
    qryDocumentoCODFORMA: TFloatField;
    qryDocumentoCODPORTFORMA: TFloatField;
    qryDocumentoIDCBANCARIA: TFloatField;
    qryDocumentoIDFORCLI: TFloatField;
    qryDocumentoNUMLEITCODBARRAS: TStringField;
    dsContaBancaria: TwwDataSource;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    DbeCodigoBarrasGeral: TwwDBEdit;
    rdgTipoTituloGeral: TRadioGroup;
    DBEdit4: TDBEdit;
    dbrValorDocGeral: TDBRealEdit;
    qryMovTitulos: TwwQuery;
    dsMovTitulos: TwwDataSource;
    updMovTitulos: TUpdateSQL;
    qryMovTitulosCODDOCUMENTO: TFloatField;
    qryMovTitulosIDDOCUMENTOXCODBARRAS: TFloatField;
    qryMovTitulosNUMCODBARRAS: TStringField;
    qryMovTitulosVLRPAGTO: TFloatField;
    qryMovTitulosDTPAGTO: TDateTimeField;
    qryMovTitulosFLGTIPOCODBARRAS: TStringField;
    qryMovTitulosTIPOCODBARRA: TStringField;
    qryCtaBancariaGeral: TwwQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    dsCtaBancariaGeral: TwwDataSource;
    spbLimpaCampo1: TSpeedButton;
    DBEdit5: TDBEdit;
    Panel6: TPanel;
    edSaldoListaFav: TRealEdit;
    Image1: TImage;
    Label5: TLabel;
    Panel10: TPanel;
    Image2: TImage;
    Label10: TLabel;
    edSaldoTitulo: TRealEdit;
    Panel11: TPanel;
    Panel21: TPanel;
    Panel27: TPanel;
    Panel31: TPanel;
    dbgMovArqGerado: TwwDBGrid;
    Panel35: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    dsMovArqGerado: TwwDataSource;
    qryMovArqGeradoDet: TwwQuery;
    dsMovArqGeradoDet: TwwDataSource;
    cdsMovArqPendente: TCMClientDataSet;
    SqlMovArqPendente: TCMSqlParams;
    cdsMovArqPendenteIDARQUIVOPAGTO: TFloatField;
    cdsMovArqPendenteCODPORTFORMA: TFloatField;
    cdsMovArqPendenteUSU_PREPARO: TStringField;
    cdsMovArqPendenteDT_PREPARO: TDateTimeField;
    cdsMovArqPendenteVLRTOTAL: TFloatField;
    cdsMovArqPendenteDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqPendenteUSUGERACAOARQTXT: TStringField;
    cdsMovArqPendenteNOMEARQTXT: TStringField;
    cdsMovArqPendenteDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqPendenteUSUCANCELAARQTXT: TStringField;
    cdsMovArqPendenteFLGENVIADO: TStringField;
    cdsMovArqGerado: TCMClientDataSet;
    SqlMovArqGerado: TCMSqlParams;
    tbsGACancelados: TTabSheet;
    cdsMovArqCancelado: TCMClientDataSet;
    dsMovArqCancelado: TwwDataSource;
    SqlMovArqCancelado: TCMSqlParams;
    cdsConvenioPATHARQUIVOREM: TStringField;
    wwIntl_Port: TwwIntl;
    qryEmpresa: TwwQuery;
    qryEmpresaIDPESSOA: TFloatField;
    qryEmpresaNOMEEMPRESA: TStringField;
    qryEmpresaRAZAOSOCIAL: TStringField;
    qryEmpresaIDENDERECO: TFloatField;
    qryEmpresaCEP: TStringField;
    qryEmpresaIMAGEM: TBlobField;
    dsEmpresa: TwwDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText7: TppDBText;
    ppShape4: TppShape;
    ppDBImage1: TppDBImage;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel2: TppLabel;
    Dock973: TDock97;
    tb97Detalhe: TToolbar97;
    btnCon1: TBitBtn;
    btnCan1: TBitBtn;
    Dock977: TDock97;
    Toolbar975: TToolbar97;
    btnConGeral: TBitBtn;
    btnCanGeral: TBitBtn;
    cdsMovArqPendentePATHARQUIVOREM: TStringField;
    SpeedButton3: TSpeedButton;
    cdsMovRemessaCPF_CNPJ_MASC: TStringField;
    qryMovListaFavorecidosCPF_CNPJ_MASC: TStringField;
    Panel15: TPanel;
    wwDBNavigator1: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    wwNavButton18: TwwNavButton;
    wwNavButton19: TwwNavButton;
    SpeedButton12: TSpeedButton;
    wwDBNavigator2: TwwDBNavigator;
    wwNavButton20: TwwNavButton;
    wwNavButton21: TwwNavButton;
    wwNavButton22: TwwNavButton;
    wwNavButton23: TwwNavButton;
    wwNavButton24: TwwNavButton;
    wwNavButton25: TwwNavButton;
    SpeedButton13: TSpeedButton;
    FMovArqGerado: TwwFilterDialog;
    LMovArqGerado: TwwLocateDialog;
    LMovCancelado: TwwLocateDialog;
    qeMovArqGerado: TQExport3Dialog;
    FMovCancelado: TwwFilterDialog;
    qeMovCancelado: TQExport3Dialog;
    Panel33: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    dsMovArqCancelDet: TwwDataSource;
    cdsMovArqPendentePATHARQUIVOSEGURANCA: TStringField;
    Panel46: TPanel;
    pnlCritSel: TPanel;
    grpDataProc: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    lblDataInicial: TLabel;
    Label8: TLabel;
    spbSelRemessa: TSpeedButton;
    dblkpConvenio: TwwDBLookupCombo;
    dblkpFormaPagto: TwwDBLookupCombo;
    dbDataProgIni: TCMDateTimePicker;
    dbDataProgFim: TCMDateTimePicker;
    Panel45: TPanel;
    LMovArqGeradoPend: TwwLocateDialog;
    FMovArqGeradoPend: TwwFilterDialog;
    MSMovArqGeradoPend: TMontaSelect;
    cdsMovRemessaNOME_CONVENIO: TStringField;
    cdsMovArqPendenteNOME_CONVENIO: TStringField;
    Panel50: TPanel;
    GroupBox6: TGroupBox;
    Label17: TLabel;
    dblkpConvenio2: TwwDBLookupCombo;
    dbNomeConvenioSel: TDBEdit;
    dbeCaminhoArq: TDBEdit;
    qryAux1: TwwQuery;
    qryMovTitulosCOD_BARRAS_MASC: TStringField;
    qryDocumentoCOD_BARRAS_MASC: TStringField;
    CmpDadosParaBaixaCAP: TCmParamReport;
    cdsMovBaixa: TCMClientDataSet;
    SqlMovBaixa: TCMSqlParams;
    cdsMovBaixaIDARQUIVOPAGTO: TFloatField;
    cdsMovBaixaDSC_CONVENIO: TStringField;
    cdsMovBaixaVALOR: TFloatField;
    cdsMovBaixaCODDOCUMENTO: TFloatField;
    cdsMovBaixaCODTIPDOC: TFloatField;
    cdsMovBaixaDATAPROGRAMADA: TDateTimeField;
    cdsMovBaixaIDMODULO: TFloatField;
    cdsMovBaixaOPERACAO: TStringField;
    cdsMovBaixaIDFORCLI: TFloatField;
    cdsMovBaixaNUMLANCTO: TFloatField;
    cdsMovBaixaDEBCRE: TStringField;
    cdsMovArqPendenteSTATUS: TStringField;
    cdsMovArqPendentePATHARQUIVOBACKUP: TStringField;
    SpeedButton4: TSpeedButton;
    cdsMovBaixaNUMARQUIVO: TFloatField;
    cdsMovBaixaNODOCUMENTO: TFloatField;
    cdsMovBaixaCOMPLDOCUMENTO: TStringField;
    cdsMovBaixaNOME: TStringField;
    cdsMovRemessaCODPORTFORMA: TFloatField;
    spbCancelarMovArqGerado: TSpeedButton;
    spbDesfazerPrep: TSpeedButton;
    spbImpMovArqGerado: TSpeedButton;
    spbPrepararEnvio: TSpeedButton;
    Label6: TLabel;
    Label19: TLabel;
    edDtVenctoGeral: TEdit;
    edValorGeral: TRealEdit;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppShape2: TppShape;
    ppShape6: TppShape;
    ppLabel4: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppShape1: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppShape3: TppShape;
    ppLabel20: TppLabel;
    ppShape5: TppShape;
    qryBancoFUNCEF: TwwQuery;
    dsBancoFUNCEF: TwwDataSource;
    qryBancoFUNCEFNUMBANCO: TStringField;
    qryBancoFUNCEFNUMAGENCIA: TStringField;
    qryBancoFUNCEFCONTACORRENTE: TStringField;
    qryBancoFUNCEFNOME_BANCO: TStringField;
    qryBancoFUNCEFNOME_AGENCIA: TStringField;
    ppBancoFUNCEF: TppBDEPipeline;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape7: TppShape;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel26: TppLabel;
    ppDBText15: TppDBText;
    ppLabel27: TppLabel;
    spbGerarArq: TSpeedButton;
    Panel3: TPanel;
    Panel12: TPanel;
    ppPageStyle1: TppPageStyle;
    qryMovArqCancelDet: TwwQuery;
    tbsGAFinalizados: TTabSheet;
    Panel23: TPanel;
    wwDBNavigator6: TwwDBNavigator;
    wwNavButton26: TwwNavButton;
    wwNavButton27: TwwNavButton;
    wwNavButton28: TwwNavButton;
    wwNavButton29: TwwNavButton;
    wwNavButton32: TwwNavButton;
    wwNavButton33: TwwNavButton;
    dbgMovArqFinalizado: TwwDBGrid;
    Panel26: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    cdsMovArqFinalizado: TCMClientDataSet;
    dsMovArqFinalizado: TwwDataSource;
    SqlMovArqFinalizado: TCMSqlParams;
    qryMovArqFinalDet: TwwQuery;
    dsMovArqFinalDet: TwwDataSource;
    cdsMovRemessaFLGPERMITELISTAFAVORECIDO: TStringField;
    cdsMovRemessaFLGPERMITETITULOSPAGTO: TStringField;
    qryMovTitulosNUMDOCUMENTO: TStringField;
    qryMovTitulosCPF_CNPJ_MASC: TStringField;
    Panel55: TPanel;
    pnlDadosMovTitulo: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    dbeCodigoBarrasTitulos: TwwDBEdit;
    dbDataVenctoBoleto: TCMDateTimePicker;
    rdgTipoTitulo: TRadioGroup;
    dbCPFCNPJ: TwwDBEdit;
    dbeValorPagto: TDBRealEdit;
    Dock975: TDock97;
    Toolbar972: TToolbar97;
    btnConTit: TBitBtn;
    btnCanTit: TBitBtn;
    SpeedButton1: TSpeedButton;
    qeMovFinalizado: TQExport3Dialog;
    cdsTipoPagtoORDEM: TFloatField;
    qryContaBancariaTIPOCONTA: TStringField;
    qryCtaBancariaGeralTIPOCONTA: TStringField;
    qryMovListaFavorecidosTIPOCONTA: TStringField;
    FMovFinalizado: TwwFilterDialog;
    LMovFinalizado: TwwLocateDialog;
    spbCalc: TSpeedButton;
    tbsArqRetorno: TTabSheet;
    Panel54: TPanel;
    GroupBox7: TGroupBox;
    Panel94: TPanel;
    Panel95: TPanel;
    dlgLocArqRetorno: TOpenDialog;
    raCodeModule1: TraCodeModule;
    qryMovRetorno: TwwQuery;
    dsMovRetorno: TwwDataSource;
    spbLocalizaArqRet: TSpeedButton;
    Panel20: TPanel;
    spbImpMovArqRetorno: TSpeedButton;
    pnlCabRetMom: TPanel;
    SpeedButton9: TSpeedButton;
    wwDBNavigator8: TwwDBNavigator;
    wwNavButton36: TwwNavButton;
    wwNavButton37: TwwNavButton;
    wwNavButton38: TwwNavButton;
    wwNavButton39: TwwNavButton;
    wwNavButton40: TwwNavButton;
    wwNavButton41: TwwNavButton;
    dbgMovRetorno: TwwDBGrid;
    Panel13: TPanel;
    Panel17: TPanel;
    Panel22: TPanel;
    Panel24: TPanel;
    SpeedButton2: TSpeedButton;
    wwDBNavigator5: TwwDBNavigator;
    wwNavButton30: TwwNavButton;
    wwNavButton31: TwwNavButton;
    wwNavButton34: TwwNavButton;
    wwNavButton35: TwwNavButton;
    wwNavButton42: TwwNavButton;
    wwNavButton43: TwwNavButton;
    dbgMovArqGeradoPend: TwwDBGrid;
    Panel25: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    wwDBGrid6: TwwDBGrid;
    Panel30: TPanel;
    qeMovArqPend: TQExport3Dialog;
    qeMovArqRet: TQExport3Dialog;
    cdsMovArqPendenteNSA: TStringField;
    cdsMovArqPendenteDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqPendenteUSUFINALIZAARQTXT: TStringField;
    cdsMovArqPendentePATHARQUIVORET: TStringField;
    qryMovArqPendDetNUM_AP: TFloatField;
    qryMovArqPendDetNODOCUMENTO: TFloatField;
    qryMovArqPendDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqPendDetVALOR: TFloatField;
    qryMovArqPendDetCPF_CNPJ_MASC: TStringField;
    qryMovArqPendDetRAZAOSOCIAL: TStringField;
    qryMovArqPendDetNUM_BANCO: TStringField;
    qryMovArqPendDetNUM_AGENCIA: TStringField;
    qryMovArqPendDetNUM_CONTA: TStringField;
    qryMovArqPendDetFORMA_PAGTO: TStringField;
    qryMovArqPendDetSTATUS: TStringField;
    qryMovArqPendDetCODFORMA: TFloatField;
    cdsMovArqGeradoIDARQUIVOPAGTO: TFloatField;
    cdsMovArqGeradoCODPORTFORMA: TFloatField;
    cdsMovArqGeradoNSA: TStringField;
    cdsMovArqGeradoVLRTOTAL: TFloatField;
    cdsMovArqGeradoDT_PREPARO: TDateTimeField;
    cdsMovArqGeradoUSU_PREPARO: TStringField;
    cdsMovArqGeradoDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqGeradoUSUGERACAOARQTXT: TStringField;
    cdsMovArqGeradoNOMEARQTXT: TStringField;
    cdsMovArqGeradoDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqGeradoUSUFINALIZAARQTXT: TStringField;
    cdsMovArqGeradoDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqGeradoUSUCANCELAARQTXT: TStringField;
    cdsMovArqGeradoNOME_CONVENIO: TStringField;
    cdsMovArqGeradoFLGENVIADO: TStringField;
    cdsMovArqGeradoPATHARQUIVOREM: TStringField;
    cdsMovArqGeradoPATHARQUIVORET: TStringField;
    cdsMovArqGeradoPATHARQUIVOSEGURANCA: TStringField;
    cdsMovArqGeradoPATHARQUIVOBACKUP: TStringField;
    cdsMovArqGeradoSTATUS: TStringField;
    cdsMovArqCanceladoIDARQUIVOPAGTO: TFloatField;
    cdsMovArqCanceladoCODPORTFORMA: TFloatField;
    cdsMovArqCanceladoNSA: TStringField;
    cdsMovArqCanceladoVLRTOTAL: TFloatField;
    cdsMovArqCanceladoDT_PREPARO: TDateTimeField;
    cdsMovArqCanceladoUSU_PREPARO: TStringField;
    cdsMovArqCanceladoDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqCanceladoUSUGERACAOARQTXT: TStringField;
    cdsMovArqCanceladoNOMEARQTXT: TStringField;
    cdsMovArqCanceladoDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqCanceladoUSUFINALIZAARQTXT: TStringField;
    cdsMovArqCanceladoDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqCanceladoUSUCANCELAARQTXT: TStringField;
    cdsMovArqCanceladoNOME_CONVENIO: TStringField;
    cdsMovArqCanceladoFLGENVIADO: TStringField;
    cdsMovArqCanceladoPATHARQUIVOREM: TStringField;
    cdsMovArqCanceladoPATHARQUIVORET: TStringField;
    cdsMovArqCanceladoPATHARQUIVOSEGURANCA: TStringField;
    cdsMovArqCanceladoPATHARQUIVOBACKUP: TStringField;
    cdsMovArqCanceladoSTATUS: TStringField;
    cdsMovArqFinalizadoIDARQUIVOPAGTO: TFloatField;
    cdsMovArqFinalizadoCODPORTFORMA: TFloatField;
    cdsMovArqFinalizadoNSA: TStringField;
    cdsMovArqFinalizadoVLRTOTAL: TFloatField;
    cdsMovArqFinalizadoDT_PREPARO: TDateTimeField;
    cdsMovArqFinalizadoUSU_PREPARO: TStringField;
    cdsMovArqFinalizadoDTGERACAOARQTXT: TDateTimeField;
    cdsMovArqFinalizadoUSUGERACAOARQTXT: TStringField;
    cdsMovArqFinalizadoNOMEARQTXT: TStringField;
    cdsMovArqFinalizadoDTFINALIZAARQTXT: TDateTimeField;
    cdsMovArqFinalizadoUSUFINALIZAARQTXT: TStringField;
    cdsMovArqFinalizadoDTCANCELAARQTXT: TDateTimeField;
    cdsMovArqFinalizadoUSUCANCELAARQTXT: TStringField;
    cdsMovArqFinalizadoNOME_CONVENIO: TStringField;
    cdsMovArqFinalizadoFLGENVIADO: TStringField;
    cdsMovArqFinalizadoPATHARQUIVOREM: TStringField;
    cdsMovArqFinalizadoPATHARQUIVORET: TStringField;
    cdsMovArqFinalizadoPATHARQUIVOSEGURANCA: TStringField;
    cdsMovArqFinalizadoPATHARQUIVOBACKUP: TStringField;
    cdsMovArqFinalizadoSTATUS: TStringField;
    qryMovArqGeradoDetNUM_AP: TFloatField;
    qryMovArqGeradoDetNODOCUMENTO: TFloatField;
    qryMovArqGeradoDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqGeradoDetVALOR: TFloatField;
    qryMovArqGeradoDetRAZAOSOCIAL: TStringField;
    qryMovArqGeradoDetNUM_BANCO: TStringField;
    qryMovArqGeradoDetNUM_AGENCIA: TStringField;
    qryMovArqGeradoDetNUM_CONTA: TStringField;
    qryMovArqGeradoDetFORMA_PAGTO: TStringField;
    qryMovArqGeradoDetSTATUS: TStringField;
    qryMovArqCancelDetNUM_AP: TFloatField;
    qryMovArqCancelDetNODOCUMENTO: TFloatField;
    qryMovArqCancelDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqCancelDetVALOR: TFloatField;
    qryMovArqCancelDetRAZAOSOCIAL: TStringField;
    qryMovArqCancelDetNUM_BANCO: TStringField;
    qryMovArqCancelDetNUM_AGENCIA: TStringField;
    qryMovArqCancelDetNUM_CONTA: TStringField;
    qryMovArqCancelDetFORMA_PAGTO: TStringField;
    qryMovArqCancelDetSTATUS: TStringField;
    qryMovArqFinalDetNUM_AP: TFloatField;
    qryMovArqFinalDetNODOCUMENTO: TFloatField;
    qryMovArqFinalDetDATAPROGRAMADA: TDateTimeField;
    qryMovArqFinalDetVALOR: TFloatField;
    qryMovArqFinalDetRAZAOSOCIAL: TStringField;
    qryMovArqFinalDetNUM_BANCO: TStringField;
    qryMovArqFinalDetNUM_AGENCIA: TStringField;
    qryMovArqFinalDetNUM_CONTA: TStringField;
    qryMovArqFinalDetFORMA_PAGTO: TStringField;
    qryMovArqFinalDetSTATUS: TStringField;
    wwDBGrid2: TwwDBGrid;
    wwDBGrid5: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    dbgMovArqCancelado: TwwDBGrid;
    qryMovRetornoIDARQUIVOPAGTO: TFloatField;
    qryMovRetornoCODPORTFORMA: TFloatField;
    qryMovRetornoNSA: TStringField;
    qryMovRetornoNUM_AP: TFloatField;
    qryMovRetornoNODOCUMENTO: TFloatField;
    qryMovRetornoDATAPROGRAMADA: TDateTimeField;
    qryMovRetornoVALOR: TFloatField;
    qryMovRetornoRAZAOSOCIAL: TStringField;
    qryMovRetornoFORMA_PAGTO: TStringField;
    qryMovRetornoDATA_EFETIVACAO: TDateTimeField;
    qryMovRetornoVALOR_EFETIVADO: TFloatField;
    qryMovRetornoOCORRENCIA_RET: TStringField;
    qryMovRetornoAUTENTICACAO: TStringField;
    qryMovRetornoSTATUS: TStringField;
    qryMovRetornoNOME_CONVENIO: TStringField;
    qryMovRetornoCPF_CNPJ_MASC: TStringField;
    FMovArqRet: TwwFilterDialog;
    LMovArqRet: TwwLocateDialog;
    rptMovArqRetorno: TppReport;
    ppParameterList2: TppParameterList;
    ppMovArqRetorno: TppBDEPipeline;
    qryMovArqGeradoDetCPF_CNPJ_MASC: TStringField;
    qryMovArqGeradoDetCODFORMA: TFloatField;
    qryMovArqFinalDetCPF_CNPJ_MASC: TStringField;
    qryMovArqFinalDetCODFORMA: TFloatField;
    qryMovArqCancelDetCPF_CNPJ_MASC: TStringField;
    qryMovArqCancelDetCODFORMA: TFloatField;
    Panel32: TPanel;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    Label21: TLabel;
    DBRealEdit3: TDBRealEdit;
    qryTotaisRetorno: TwwQuery;
    dsTotaisRetorno: TwwDataSource;
    qryTotaisRetornoVLR_PREVISTO: TFloatField;
    qryTotaisRetornoVLR_EFETIVADO: TFloatField;
    qryTotaisRetornoVLR_NAO_EFETIVADO: TFloatField;
    Label22: TLabel;
    Label23: TLabel;
    qryMovArqGeradoDetNSA: TStringField;
    qryMovArqGeradoDetIDARQUIVOPAGTO: TFloatField;
    Image3: TImage;
    Label24: TLabel;
    qryMovRetornoDESC_OCORRENCIA: TStringField;
    qryMovRetornoTEVE_OCORRENCIA: TStringField;
    ppHeaderBand2: TppHeaderBand;
    ppShape8: TppShape;
    ppDBImage2: TppDBImage;
    ppLabel28: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel43: TppLabel;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLabel44: TppLabel;
    ppDBText22: TppDBText;
    ppLabel45: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand2: TppFooterBand;
    ppShape11: TppShape;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc3: TppDBCalc;
    ppLabel50: TppLabel;
    ppLabel52: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    pplblSit: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppLabel51: TppLabel;
    raCodeModule2: TraCodeModule;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppShape12: TppShape;
    spbExportaLista: TSpeedButton;
    wwDBNavigator7: TwwDBNavigator;
    wwNavButton44: TwwNavButton;
    wwNavButton45: TwwNavButton;
    wwNavButton46: TwwNavButton;
    wwNavButton47: TwwNavButton;
    wwNavButton48: TwwNavButton;
    qeListaFavorecidos: TQExport3Dialog;
    LListaTitulos: TwwLocateDialog;
    spbRegerarArq: TSpeedButton;
    CmpDadosParaImpRetorno: TCmParamReport;
    lblConvenioRet: TLabel;
    dbLkpConvenioRet: TwwDBLookupCombo;
    lblDataRetorno: TLabel;
    dtpDataRetorno: TCMDateTimePicker;
    qryAux3: TwwQuery;
    strConvenioNUMEMPRESABANCO: TStringField;
    qryMovArqPendDetDESC_OCORRENCIA_RET: TStringField;
    qryMovArqGeradoDetDESC_OCORRENCIA_RET: TStringField;
    qryMovArqFinalDetDESC_OCORRENCIA_RET: TStringField;
    qryMovArqCancelDetDESC_OCORRENCIA_RET: TStringField;
    stQtdPendDet: TStaticText;
    stQtdGeradosDet: TStaticText;
    stQtdFinalizadosDet: TStaticText;
    stQtdCanceladosDet: TStaticText;
    ppLabel21: TppLabel;
    plblOcorrenciaRet: TppLabel;
    pdbtxtDESC_OCORR_RET: TppDBText;
    ppDESC_OCORR_RET: TppField;
    plbl1: TppLabel;
    pdbclcVL_TARIFA_CONVENIO: TppDBCalc;
    qryMovArqGeradoDetVL_TARIFA_CONVENIO: TCurrencyField;
    ppImpMovArqGeradoppField16: TppField;
    btnCancelamentoBanco: TSpeedButton;
    btnAnalisar: TSpeedButton;
    cdsMovRemessaMSGERRO: TStringField;
    qryDocumentoIDPESSOA: TFloatField;
    Procedure FormShow(Sender: TObject);
    Procedure PageControl1Change(Sender: TObject);
    Procedure spbSelRemessaClick(Sender: TObject);
    Procedure spbCalcClick(Sender: TObject);
    Procedure cdsMovRemessaAfterScroll(DataSet: TDataSet);
    Procedure dbgMovRemessaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    Procedure dbgMovRemessaDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbInverterSelClick(Sender: TObject);
    Procedure spbMarcaTodosClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure spbExpBenefSelClick(Sender: TObject);
    Procedure spbBuscaContaCorClick(Sender: TObject);
    Procedure btnInc1Click(Sender: TObject);
    Procedure btnAlt1Click(Sender: TObject);
    Procedure btnExc1Click(Sender: TObject);
    Procedure btnCon1Click(Sender: TObject);
    Procedure btnCan1Click(Sender: TObject);
    Procedure spbImportarMovListaClick(Sender: TObject);
    Procedure spbLocalizaFavorecClick(Sender: TObject);
    Procedure pcAnaliseRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure pcDetalManutChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure pcGeralRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure spbLimparMovListaClick(Sender: TObject);
    Procedure dbgMovListaFavDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbPrepararEnvioClick(Sender: TObject);
    Procedure spbDesfazerPrepClick(Sender: TObject);
    Procedure dbgMovRemessaFieldChanged(Sender: TObject; Field: TField);
    Procedure SpeedButton5Click(Sender: TObject);
    Procedure btnAltGeralClick(Sender: TObject);
    Procedure btnConGeralClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure rdgTipoTituloGeralClick(Sender: TObject);
    Procedure qryDocumentoAfterScroll(DataSet: TDataSet);
    Procedure btnCanGeralClick(Sender: TObject);
    Procedure btnIncTitClick(Sender: TObject);
    Procedure btnAltTitClick(Sender: TObject);
    Procedure btnExcTitClick(Sender: TObject);
    Procedure btnConTitClick(Sender: TObject);
    Procedure btnCanTitClick(Sender: TObject);
    Procedure dbeCodigoBarrasTitulosExit(Sender: TObject);
    Procedure spbLimpaCampo1Click(Sender: TObject);
    Procedure spbGerarArqClick(Sender: TObject);
    Procedure spbCancelarMovArqGeradoClick(Sender: TObject);
    Procedure spbImpMovArqGeradoClick(Sender: TObject);
    Procedure SpeedButton3Click(Sender: TObject);
    Procedure SpeedButton12Click(Sender: TObject);
    Procedure SpeedButton13Click(Sender: TObject);
    Procedure dblkpConvenio2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure pcGeraArquivoOperChange(Sender: TObject);
    Procedure dblkpConvenioEnter(Sender: TObject);
    Procedure rdgTipoTituloClick(Sender: TObject);
    Procedure dblkpConvenio2Click(Sender: TObject);
    Procedure dblkpConvenioClick(Sender: TObject);
    Procedure dblkpFormaPagtoClick(Sender: TObject);
    Procedure dbgMovArqGeradoPendDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);

    Procedure dbgMovArqGeradoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgMovTitulosRowChanged(Sender: TObject);

    Procedure DbeCodigoBarrasGeralExit(Sender: TObject);
    Procedure dbeValorPagtoExit(Sender: TObject);
    Procedure dbgMovRemessaTitleButtonClick(Sender: TObject; AFieldName: String);
    Procedure dbgMovRemessaCalcTitleImage(Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
    Procedure SpeedButton1Click(Sender: TObject);
    Procedure spbLocalizaArqRetClick(Sender: TObject);
    Procedure dbgMovRetornoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure SpeedButton2Click(Sender: TObject);
    Procedure SpeedButton9Click(Sender: TObject);
    Procedure dbgMovArqFinalizadoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgMovArqCanceladoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbImpMovArqRetornoClick(Sender: TObject);
    Procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
    Procedure spbExportaListaClick(Sender: TObject);
    Procedure spbRegerarArqClick(Sender: TObject);
    Procedure DblCodFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure DblCodFormaEnter(Sender: TObject);
    procedure dbLkpConvenioRetClick(Sender: TObject);
    procedure qryMovArqPendDetAfterScroll(DataSet: TDataSet);
    procedure qryMovArqGeradoDetAfterScroll(DataSet: TDataSet);
    procedure qryMovArqFinalDetAfterScroll(DataSet: TDataSet);
    procedure qryMovArqCancelDetAfterScroll(DataSet: TDataSet);
    procedure btnCancelamentoBancoClick(Sender: TObject);
    procedure btnAnalisarClick(Sender: TObject);
  Private
    { Private declarations }
    oCtrlFuncoesCapCar: TCtrlFuncoesCapCar;
    oRemessaEletronica: TCtrlRemessaEletronicaDeb;
    tsListaDeDocumentos: TStringList;
    ret: array of rgRetorno;
    iInd: integer; //Índice do vetor rgRetorno

    Function _TotalizaColunaGridMovRemessa(pCampo: String): Double;
    Function _TotalizaColunaGridMovListaFavorecidos(pCampo: String; pDecimal: Integer): String;
    Function _TotalizaColunaGridMovTitulos(pCampo: String; pDecimal: Integer): String;
    Function _TemSaldoDisponivel(pSaldo: double): Boolean;
    Function _AnaliseDoMovimento(pCodForma: Integer): String;
    Function _AnaliseVerificaValorCampo(pQuery: TwwQuery; pCampo, pValorCampo, pTpSinal: String): Boolean;

    procedure _RegistraTarifaBancaria(pIdArquivoPagto: Integer);
    procedure _SetTarifaBancaria(pIdArquivoPagto, pCodDocumento: Integer);
  Public
    { Public declarations }
  End;

Var
  FrmRemessaEletronicaDeb: TFrmRemessaEletronicaDeb;
  sPathArquivosLog, sMSGErroAnalise, sDescRetMomento, sFormaPagtoAnt: String;
  iContador: Integer;
  bAnaliseFeita, bAltFormPagto: Boolean;
  dValorTotalMovLista, dValorAntCampo, dValorTotalTitulos, dVlrObrigaNumDocTit: Double;

Implementation

Uses DBaseDados, USistema, UDatabase, uFormManager, FAguarde, FProgresso, FPreview,
  UMensErro, DDadosBancarios, uModulo, FExcluiEstornaBaixaLoteMT;

{$R *.DFM}

Procedure TFrmRemessaEletronicaDeb.FormCreate(Sender: TObject);
Begin
  Inherited;
  tsListaDeDocumentos := tStringList.create;
  oRemessaEletronica := TCtrlRemessaEletronicaDeb.Create;
  oRemessaEletronica.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  sPathArquivosLog := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogRemessaEletro';

  If Not DirectoryExists(sPathArquivosLog) Then
    ForceDirectories(sPathArquivosLog);

  // Ajustando a tela para o tamanho padrão definido nas constantes
  ClientHeight := iClientHeight;
  ClientWidth := iClientWidth;
End;

Procedure TFrmRemessaEletronicaDeb.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  FreeAndNil(tsListaDeDocumentos);
  FreeAndNil(oRemessaEletronica);
End;

Procedure TFrmRemessaEletronicaDeb.FormShow(Sender: TObject);
Begin
  Inherited;

  // Inicializando defaults dos componentes
  dbDataProgIni.Date := date;
  dbDataProgFim.Date := date;
  pcGeralRemessa.ActivePage := tbsAnalise;
  pcGeraArquivoOper.ActivePage := tbsGAPendentes;
  pcAnaliseRemessa.ActivePage := tbsAnaliseMovimento;
  pcAnaliseRemessa.Pages[1].TabVisible := False; //Everson Cunha - SIG103725 - SIACC
  pcDetalManut.ActivePage := tbsAnManGeral;

  // Abrindo os datasets
  Screen.Cursor := crSQLWait;
  cdsConvenio.data := oRemessaEletronica._ListaConvenios;
  cdsTipoPagto.data := oRemessaEletronica._ListaFormaRecebimentos;
  cdsTipoPagtoGeral.data := oRemessaEletronica._ListaFormarecebimentosGeral;
  dblkpFormaPagto.LookupValue := '-1'; // Todas as formas de pagamento como default

  SQLMovRemessa.Open;
  qryDocumento.Close;                                                   
  qryDocumento.Open;
  qryMovListaFavorecidos.Close;
  qryMovListaFavorecidos.Open;
  qryContaBancaria.Close;
  qryContaBancaria.Open;
  qryMovTitulos.Close;
  qryMovTitulos.Open;
  qryContaBancaria.Close;
  qryContaBancaria.Open;
  qryCtaBancariaGeral.Close;
  qryCtaBancariaGeral.Open;

  SqlMovArqPendente.Open;
  qryMovArqPendDet.Close;
  //qryMovArqPendDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;    //Everson Cunha - SIG104134
  qryMovArqPendDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(-1);  //Everson Cunha - SIG104134
  qryMovArqPendDet.SQL.SaveToFile(sPathArquivosLog + '\SQL_MovArqDetalhado.txt');
  qryMovArqPendDet.Open;

  SqlMovArqGerado.Open;
  qryMovArqGeradoDet.Close;
  //qryMovArqGeradoDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;  //Everson Cunha - SIG104134
  qryMovArqGeradoDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(-1);//Everson Cunha - SIG104134
  qryMovArqGeradoDet.Open;

  SqlMovArqCancelado.Open;
  qryMovArqCancelDet.Close;
  //qryMovArqCancelDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;  //Everson Cunha - SIG104134
  qryMovArqCancelDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(-1);//Everson Cunha - SIG104134
  qryMovArqCancelDet.Open;

  SqlMovArqFinalizado.Open;
  qryMovArqFinalDet.Close;
  //qryMovArqFinalDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe;   //Everson Cunha - SIG104134
  qryMovArqFinalDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(-1); //Everson Cunha - SIG104134
  qryMovArqFinalDet.Open;

  qryMovRetorno.Close;
  qryMovRetorno.Open;
  //
  spbPrepararEnvio.Enabled := ((Not cdsMovRemessa.isempty) And (pcGeralRemessa.activepage = tbsAnaliseMovimento));

  dbgMovRemessa.ColumnByName('VALOR').FooterValue := '0,00';
  dbgMovListaFav.ColumnByName('VALOR').FooterValue := '0,00';
  dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := '0,00';
  cdsMovRemessaAfterScroll(cdsMovRemessa);

  // Aba Geral
  pnlDadosMovGeral.enabled := False;
  btnAltGeral.enabled := True;
  btnConGeral.Enabled := False;
  btnCanGeral.Enabled := False;
  DbeCodigoBarrasGeral.Enabled := False;

  // Aba Listas de Favorecidos
  pnlGridMovLista.enabled := True;
  pnlDadosMovLista.enabled := False;
  btnInc1.enabled := True;
  btnAlt1.enabled := True;
  btnExc1.enabled := True;
  spbImportarMovLista.enabled := True;
  spbLimparMovLista.enabled := True;
  dbNavListFavorec.enabled := True;
  btnCon1.Enabled := False;
  btnCan1.Enabled := False;

  // Aba Listas de Titulos
  pnlGridMovTitulo.enabled := True;
  pnlDadosMovTitulo.enabled := False;
  btnIncTit.enabled := True;
  btnAltTit.enabled := True;
  btnExcTit.enabled := True;
  btnConTit.Enabled := False;
  btnCanTit.Enabled := False;

  Screen.Cursor := crDefault;

  If tbsAnalise.Enabled Then
    dblkpConvenio.Setfocus;

End;

Function TFrmRemessaEletronicaDeb._TemSaldoDisponivel(pSaldo: double): Boolean;
Begin
  Result := True;
  If pSaldo = 0 Then
    Begin
      Application.MessageBox(MSG017, 'Atenção !', Mb_IconExclamation);
      Result := False;
    End;
End;

Function TFrmRemessaEletronicaDeb._TotalizaColunaGridMovRemessa(pCampo: String): Double;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  cdsMovRemessa.AfterScroll := Nil;
  cdsMovRemessa.DisableControls;
  cdsMovRemessa.First;
  While Not cdsMovRemessa.EOF Do
    Begin
      If cdsMovRemessa.fieldByname('MARCADO').asString = 'S' Then // Sim
        If Not cdsMovRemessa.Fieldbyname(pCampo).isNull Then
          dTotalFiltro := dTotalFiltro + cdsMovRemessa.Fieldbyname(pCampo).asFloat;

      cdsMovRemessa.Next;
    End;
  cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
  cdsMovRemessa.enableControls;
  Screen.Cursor := crDefault;
  Result := dTotalFiltro;
End;

Function TFrmRemessaEletronicaDeb._TotalizaColunaGridMovListaFavorecidos(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  qryMovListaFavorecidos.DisableControls;
  qryMovListaFavorecidos.First;
  While Not qryMovListaFavorecidos.EOF Do
    Begin
      If Not qryMovListaFavorecidos.Fieldbyname(pCampo).isNull Then
        dTotalFiltro := dTotalFiltro + qryMovListaFavorecidos.Fieldbyname(pCampo).asFloat;

      qryMovListaFavorecidos.Next;
    End;
  qryMovListaFavorecidos.First;
  qryMovListaFavorecidos.EnableControls;
  dValorTotalMovLista := dTotalFiltro;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, 2);
End;

Function TFrmRemessaEletronicaDeb._TotalizaColunaGridMovTitulos(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  qryMovTitulos.DisableControls;
  qryMovTitulos.First;
  While Not qryMovTitulos.EOF Do
    Begin
      If Not qryMovTitulos.Fieldbyname(pCampo).isNull Then
        dTotalFiltro := dTotalFiltro + qryMovTitulos.Fieldbyname(pCampo).asFloat;

      qryMovTitulos.Next;
    End;
  qryMovTitulos.First;
  qryMovTitulos.EnableControls;
  dValorTotalTitulos := dTotalFiltro;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, 2);
End;

Function TFrmRemessaEletronicaDeb._AnaliseVerificaValorCampo(pQuery: TwwQuery; pCampo, pValorCampo, pTpSinal: String): Boolean;
Begin
  Result := False;
  Screen.Cursor := crSQLWait;
  pQuery.First;
  While Not pQuery.EOF Do
    Begin
      If pTpSinal = '<>' Then // Diferente
        Result := (pQuery.Fieldbyname(pCampo).asString <> pValorCampo)
      Else // Igual
        Result := (pQuery.Fieldbyname(pCampo).asString = pValorCampo);

      If Result = False Then
        Break;

      pQuery.Next;
    End;
  pQuery.First;
  Screen.Cursor := crDefault;
End;

// Rotina para realizar uma análise do movimento antes da geração do arquivo
// Ela não será obrigatória.
Function TFrmRemessaEletronicaDeb._AnaliseDoMovimento(pCodForma: Integer): String;
Begin
  Inherited;
  Result := EmptyStr;
  Result := 'Verifique: ';

{
Const AnMSG01 = 'Banco do Cliente / ';
Const AnMSG02 = 'Agência do Cliente / ';
Const AnMSG03 = 'Conta do Cliente / ';
Const AnMSG04 = 'Tipo da Conta do Cliente / ';
Const AnMSG05 = 'CPF/CNPJ do Cliente / ';
}

  //Convênios de Contribuição validam pelo IDPESSOA / FLGCONTAPREF
  if (CdsMovRemessa.fieldbyname('codportforma').AsString = '261') or (CdsMovRemessa.fieldbyname('codportforma').AsString = '295') then
  begin
    if (qryContaBancaria.fieldbyname('NUMBANCO').asString <> '104') then
      Result := Result + AnMSG01;

    if length(trim(qryContaBancaria.fieldbyname('NUMAGENCIA').asString)) < 4 then
      Result := Result + AnMSG02;

    if length(trim(qryContaBancaria.fieldbyname('NUMCONTA').asString)) < 12 then
      Result := Result + AnMSG03;

    //Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
    if (qryContaBancaria.fieldbyname('TIPOCONTA').asString = '0') then
      Result := Result + AnMSG04;

    if (qryContaBancaria.fieldbyname('TIPOCONTA').asString = '2') then //Salário
      Result := Result + AnMSG04;
  end
  else //Os demais convênios validam pelo IDCBANCARIA
  begin
    if (qryCtaBancariaGeral.fieldbyname('NUMBANCO').asString <> '104') then
      Result := Result + AnMSG01;

    if length(trim(qryCtaBancariaGeral.fieldbyname('NUMAGENCIA').asString)) < 4 then
      Result := Result + AnMSG02;

    if length(trim(qryCtaBancariaGeral.fieldbyname('NUMCONTA').asString)) < 12 then
      Result := Result + AnMSG03;

    //Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
    if (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '0') then
      Result := Result + AnMSG04;

    if (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '2') then //Salário
      Result := Result + AnMSG04;
  end;

  if CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull then
    Result := Result + AnMSG05;

    
  if Result = 'Verifique: ' then
    Result := EmptyStr;
End;

Procedure TFrmRemessaEletronicaDeb.spbSelRemessaClick(Sender: TObject);
Begin
  Inherited;
  bAltFormPagto := False;
  sFormaPagtoAnt := EmptyStr;
  cdsMovRemessa.IndexName := EmptyStr;
  bAnaliseFeita := False; //Everson Cunha - SIG119696

  If dblkpConvenio.LookupValue = EmptyStr Then
    Begin
      MsgDlg(MSG001, 'Atenção', mtWarning, [mbOK], 0);
      dblkpConvenio.SetFocus;
      Exit;
    End;

  If dblkpFormaPagto.LookupValue = EmptyStr Then
    Begin
      MsgDlg(MSG032, 'Atenção', mtWarning, [mbOK], 0);
      dblkpFormaPagto.LookupValue := '-1'; // Todas as Forma de Pagamento como default
      dblkpFormaPagto.SetFocus;
      Exit;
    End;

  If dbDataProgIni.Text = EmptyStr Then
    Begin
      MsgDlg(MSG002, 'Atenção', mtWarning, [mbOK], 0);
      dbDataProgIni.Date := date;
      dbDataProgIni.SetFocus;
      Exit;
    End;

  If dbDataProgFim.Text = EmptyStr Then
    Begin
      MsgDlg(MSG003, 'Atenção', mtWarning, [mbOK], 0);
      dbDataProgFim.Date := date;
      dbDataProgFim.SetFocus;
      Exit;
    End;

  If dbDataProgIni.Date > dbDataProgFim.Date Then
    Begin
      MsgDlg(MSG004, 'Atenção', mtWarning, [mbOK], 0);
      dbDataProgIni.Date := date;
      dbDataProgFim.Date := date;
      dbDataProgIni.SetFocus;
      Exit;
    End;

  cdsMovRemessa.DisableControls;

  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Selecionando Movimento...');

  Screen.Cursor := crSQLWait;

  cdsMovRemessa.Data := oRemessaEletronica._SelecionaMovimentoRemessaDebito(dblkpConvenio.LookupValue,
                                                                                     dblkpFormaPagto.LookupValue,
                                                                                     dbDataProgIni.Date,
                                                                                     dbDataProgFim.Date);
  //pcAnaliseRemessa.Pages[1].TabVisible := False; //Everson Cunha - SIG103725 - SIACC

  //Everson Cunha - SIG104134 - Ini
  {case StrToInt(dblkpConvenio.LookupValue) of
    104, 259: dbgMovRemessa.Columns[8].DisplayLabel := 'Contrato';
    105, 261: dbgMovRemessa.Columns[8].DisplayLabel := 'Matrícula';
    else
    dbgMovRemessa.Columns[8].DisplayLabel := ' '; //Everson Cunha - SIG103725 - SIACC
  end;}
  //Everson Cunha - SIG104134 - Fim

  Screen.Cursor := crDefault;

  frmAguarde.pbAguarde.Visible := True;
  frmAguarde.Apaga;

  cdsMovRemessa.EnableControls;

  If cdsMovRemessa.isEmpty Then
  begin
    Application.MessageBox(MSG020, 'Atenção !', Mb_IconExclamation);
    //pcAnaliseRemessa.Pages[1].TabVisible := True; //Everson Cunha - SIG103725 - SIACC
    pcAnaliseRemessa.ActivePageIndex := 0;
  end;

  dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);

  spbPrepararEnvio.Enabled := (Not cdsMovRemessa.isempty);

  cdsMovRemessaAfterScroll(cdsMovRemessa);
  cdsMovRemessa.First;
End;


Procedure TFrmRemessaEletronicaDeb.PageControl1Change(Sender: TObject);
Begin
  Inherited;
  spbPrepararEnvio.Enabled := (pcGeralRemessa.activepage = tbsAnalise);
End;

Procedure TFrmRemessaEletronicaDeb.spbCalcClick(Sender: TObject);
Begin
  Inherited;
  WinExec('Calc.Exe', SW_Show);
End;

Procedure TFrmRemessaEletronicaDeb.cdsMovRemessaAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  stQtd1.Caption := Format('%.2d / %.2d', [cdsMovRemessa.RecNo, cdsMovRemessa.RecordCount]);
  dValorTotalMovLista := 0.00;
  dValorTotalTitulos := 0.00;
  If Not cdsMovRemessa.isEmpty Then
    Begin
      dbgMovListaFav.ColumnByName('VALOR').FooterValue := _TotalizaColunaGridMovListaFavorecidos('VALOR', 2);
      dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := _TotalizaColunaGridMovTitulos('VLRPAGTO', 2);
      edSaldoListaFav.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalMovLista, 2);
      edSaldoTitulo.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalTitulos, 2);
      tbsAnaliseManutencoes.Highlighted := ((Not cdsMovRemessa.IsEmpty) And ((Not qryMovListaFavorecidos.IsEmpty) Or (Not qryMovTitulos.IsEmpty)));
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovRemessaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        // linhas ímpares = Cinza, linhas pares = branco
        If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
          ABrush.Color := CorDaZebra
        Else
          ABrush.Color := clWhite;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovRemessaDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovRemessa.isEmpty) Then
    Begin
      If field.FieldName = 'MSGERRO' Then
        If trim(cdsMovRemessa.fieldbyname('MSGERRO').asString) <> EmptyStr Then
          dbgMovRemessa.Canvas.Font.Color := clRed;

      dbgMovRemessa.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbInverterSelClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsMovRemessa.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Lançamentos...', True, False, True, 0, cdsMovRemessa.RecordCount);
      cdsMovRemessa.DisableControls;
      cdsMovRemessa.AfterScroll := Nil;
      cdsMovRemessa.First;
      While Not cdsMovRemessa.Eof Do
        Begin
          cdsMovRemessa.Edit;
          If cdsMovRemessa.FieldByName('MARCADO').AsString = 'S' Then // Sim
            cdsMovRemessa.FieldByName('MARCADO').AsString := 'N' // Não
          Else
            cdsMovRemessa.FieldByName('MARCADO').AsString := 'S'; // Sim

          cdsMovRemessa.Next;
          oRemessaEletronica._AtualizaFrmProgresso(iContador);
        End;
      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
      cdsMovRemessa.First;
      cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
      cdsMovRemessa.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbMarcaTodosClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If (Not cdsMovRemessa.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Lançamentos...', True, False, True, 0, cdsMovRemessa.RecordCount);
      cdsMovRemessa.DisableControls;
      cdsMovRemessa.AfterScroll := Nil;
      cdsMovRemessa.First;
      While Not cdsMovRemessa.Eof Do
        Begin
          cdsMovRemessa.Edit;
          cdsMovRemessa.FieldByName('MARCADO').AsString := 'S'; // Sim

          cdsMovRemessa.Next;
          oRemessaEletronica._AtualizaFrmProgresso(iContador);
        End;
      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
      cdsMovRemessa.First;
      cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
      cdsMovRemessa.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbExpBenefSelClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovRemessa.isEmpty Then
    Begin
      qeMovRemessa.FileName := sPathArquivosLog + '\REMESSA_MOVIMENTO.XLS';
      qeMovRemessa.Execute;
      cdsMovRemessa.First;
    End;
End;

// **************** INICIO ROTINAS DO MOVIMENTO DAS LISTAS DE FAVORECIDOS
Procedure TFrmRemessaEletronicaDeb.btnInc1Click(Sender: TObject);
Begin
  Inherited;
  btnInc1.down := True;
  If qryMovListaFavorecidos.State <> dsInsert Then
    Begin
      Try
        If cdsMovRemessa.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString = 'S' Then
          Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovLista.enabled := False;
            pnlDadosMovLista.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            spbImportarMovLista.enabled := False;
            spbLimparMovLista.enabled := False;
            dbNavListFavorec.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            dValorAntCampo := 0.00;
            If _TemSaldoDisponivel(edSaldoListaFav.Value) Then
              Begin
                qryMovListaFavorecidos.Insert;
                qryMovListaFavorecidos.FieldByName('FLGIMPORTADO').AsString := 'N'; // Não
                qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := RoundCM(edSaldoListaFav.Value, 2);

                dbeValorPagtoLista.Setfocus;
              End
            Else
              btnCan1Click(Self);
          End
        Else
          Begin
            Application.MessageBox(MSG027, 'Atenção !', Mb_IconExclamation);
            btnInc1.down := False;
          End;
      Except
        btnCan1Click(Self);
        Raise;
      End;
    End
  Else
    btnInc1.Down := False;
End;

Procedure TFrmRemessaEletronicaDeb.btnAlt1Click(Sender: TObject);
Begin
  Inherited;

  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      dValorAntCampo := 0.00;
      btnAlt1.down := True;
      If qryMovListaFavorecidos.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovLista.enabled := False;
            pnlDadosMovLista.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            spbImportarMovLista.enabled := False;
            spbLimparMovLista.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            dValorAntCampo := qryMovListaFavorecidos.FieldByName('VALOR').AsFloat;

            qryMovListaFavorecidos.Edit;
            dbeValorPagtoLista.setfocus;
          Except
            btnCan1Click(Self);
            Raise;
          End;
        End
      Else
        btnAlt1.Down := False;
    End
  Else
    Begin
      btnAlt1.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.btnExc1Click(Sender: TObject);
Begin
  Inherited;
  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      If MsgDlg('Confirma Exclusão deste Favorecido ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryMovListaFavorecidos.Delete;
            qryMovListaFavorecidos.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            qryMovListaFavorecidos.Close;
            qryMovListaFavorecidos.Open;

            cdsMovRemessaAfterScroll(cdsMovRemessa);

            Screen.Cursor := crDefault;
          Except
            Raise;
          End;
          btnExc1.Down := False;
        End
      Else
        btnExc1.Down := False;
    End
  Else
    Begin
      btnExc1.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.btnCon1Click(Sender: TObject);
Begin
  Inherited;

  If dbeNomeFavorec.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG006, 'Atenção !', Mb_IconExclamation);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  // CPF/CNPJ
  If MSFavorec.ValoresChave[1] = EmptyStr Then
    Begin
      Application.MessageBox(MSG033, 'Atenção !', Mb_IconExclamation);
      Exit;
    End;

  If dbeBanco.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  If dbeAgencia.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
      dbeAgencia.setfocus;
      Exit;
    End;

  If dbeConta.Text = EmptyStr Then
    Begin
      Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
      dbeConta.setfocus;
      Exit;
    End;

  If dbeValorPagtoLista.Value = 0 Then
    Begin
      Application.MessageBox(MSG008, 'Atenção !', Mb_IconExclamation);
      qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := RoundCM(edSaldoListaFav.Value + dValorAntCampo, 2);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  If ROUNDCM(dbeValorPagtoLista.Value, 2) > ROUNDCM((dValorAntCampo + edSaldoListaFav.Value), 2) Then
    Begin
      Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
      qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := RoundCM(edSaldoListaFav.Value + dValorAntCampo, 2);
      dbeValorPagtoLista.setfocus;
      Exit;
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryMovListaFavorecidos.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            If qryMovListaFavorecidos.State = dsInsert Then
              Begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDOCXPESSOAS.NEXTVAL SEQ FROM DUAL    ');
                qryAux.Open;

                qryMovListaFavorecidos.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                qryMovListaFavorecidos.fieldByname('IDDOCUMENTOXPESSOAS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                qryAux.Close;
              End;

            qryMovListaFavorecidos.Post;
            qryMovListaFavorecidos.ApplyUpdates;

            dtmBaseDados.dbBaseDados.Commit;

            qryMovListaFavorecidos.Close;
            qryMovListaFavorecidos.Open;

            dbgMovListaFav.ColumnByName('VALOR').FooterValue := _TotalizaColunaGridMovListaFavorecidos('VALOR', 2);
            edSaldoListaFav.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalMovLista, 2);

            Screen.Cursor := crDefault;

            If (btnInc1.down) And (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
              btnInc1Click(Self)
            Else
              btnCan1Click(Self);
          End;
      End;
  Except
    btnCan1Click(Self);
    Raise;
  End;
End;

Procedure TFrmRemessaEletronicaDeb.btnCan1Click(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryMovListaFavorecidos.state In [dsEdit, dsInsert] Then
        qryMovListaFavorecidos.CancelUpdates;

      dtmBaseDados.dbBaseDados.RollBack;
    End;

  pnlGridMovLista.enabled := True;
  pnlDadosMovLista.enabled := False;
  pnlCritSel.Enabled := True;
  pnlInfMan.Enabled := True;

  btnInc1.enabled := True;
  btnAlt1.enabled := True;
  btnExc1.enabled := True;
  spbImportarMovLista.enabled := True;
  spbLimparMovLista.enabled := True;
  dbNavListFavorec.enabled := True;
  btnCon1.Enabled := False;
  btnCan1.Enabled := False;

  btnInc1.Down := False;
  btnAlt1.Down := False;
End;

Procedure TFrmRemessaEletronicaDeb.spbBuscaContaCorClick(Sender: TObject);
Begin
  Inherited;
  With DtmDadosBancarios Do
    Begin
      SetaFiltroMs(qryMovListaFavorecidos.FieldByName('IDFORCLI').AsFloat);
      If MsContaCor.Executar = MrOk Then
        Begin
          If MsContaCor.ValoresChave[0] <> EmptyStr Then
            Begin
              If MsContaCor.ValoresChave[4] <> '0' Then // Se for Conta Corrente ou Poupança (1 ou 3)
                Begin
                  qryMovListaFavorecidos.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]);
                  qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := MsContaCor.ValoresChave[2];
                  qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := MsContaCor.ValoresChave[3];
                  qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := MsContaCor.ValoresChave[1];
                  qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := MsContaCor.ValoresChave[4];
                End
              Else
                Application.MessageBox(MSG034, 'Atenção !', Mb_IconExclamation);
            End;

          dbeValorPagtoLista.setfocus;
        End;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbImportarMovListaClick(Sender: TObject);
Var tArquivo: TextFile;
  sLinha, sBanco, sAgencia, sOperacao, sConta, sTipoConta, sDocumento, sNome: String;
  sValorCampo: TStringlist;
  dValor, dTotalLista: Double;
Begin
  Inherited;
  If cdsMovRemessa.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString = 'S' Then
    Begin
      If Application.MessageBox(pchar('O Arquivo (.csv ou .txt) deve conter colunas separadas por " ; " : ' + #13 + #13 +
        '[CPF/CNPJ] - (Como texto e sem máscara)' + #13 +
        '[Razão Social] - (Como texto)' + #13 +
        '[Nº Banco] ' + #13 +
        '[Nº Agência] - (Caso haja digito, separá-lo com um hífen)' + #13 +
        '[Operação] - (Caso não tenha, colocar um ZERO)' + #13 +
        '[Nº Conta] - (Caso haja digito, separá-lo com um hífen)' + #13 +
        '[Tipo Conta] - (1 - Corrente / 3 - Poupança)' + #13 +
        '[Valor] - (Ex.: 100,48)' + #13 + #13 +
        'Exemplo: 03447883189;JOSE DA SILVA;104;2458;013;6510-7;1;100,48' + #13 + #13 +
        'Confirma Importação ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          If dlgAbreArquivo.Execute Then
            If uppercase(dlgAbreArquivo.FileName) <> EmptyStr Then
              Begin
                Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                    dtmBaseDados.dbBaseDados.StartTransaction;

                  Cursor := crSQLWait;
                  qryMovListaFavorecidos.DisableControls;

                  dTotalLista := 0.00;
                  sValorCampo := TStringList.Create;
                  // Lendo o arquivo
                  AssignFile(tArquivo, dlgAbreArquivo.FileName);
                  Reset(tArquivo);
                  While Not EOF(tArquivo) Do
                    Begin
                      sValorCampo.clear;
                      // Lendo linha dos dados
                      Readln(tArquivo, sLinha);
                      // Extraindo o valor de cada campo e guardando numa stringlist
                      ExtractStrings([';'], [' '], pchar(oRemessaEletronica._tiramascara(sLinha)), sValorCampo);

                      sDocumento := TRIM(sValorCampo[0]); // CPF ou CNPJ
                      sNome := ConverteCar(UPPERCASE(TRIM(sValorCampo[1]))); // RAZAOSOCIAL

                      sBanco := TRIM(sValorCampo[2]); // NUMBANCO
                      sAgencia := TRIM(sValorCampo[3]); // NUMAGENCIA
                      sOperacao := TRIM(sValorCampo[4]); // NUMOPERACAO
                      If sOperacao = '0' Then
                        sOperacao := EmptyStr;
                      sConta := TRIM(sValorCampo[5]); // NUMCONTA
                      sTipoConta := TRIM(sValorCampo[6]); // TIPOCONTA
                      dValor := StringToFloat(sValorCampo[7]); // VALOR

                      If Not length(sDocumento) In [11, 14] Then
                        Begin
                          Application.MessageBox(pchar('CPF/CNPJ do ' + sNome + ' com tamanho inválido. Verifique !'), 'Atenção !', Mb_IconExclamation);
                          qryMovListaFavorecidos.EnableControls;
                          break;
                        End;

                      If (sTipoConta <> '1') And (sTipoConta <> '3') Then // (1 - Corrente / 3 - Poupança)
                        Begin
                          Application.MessageBox(pchar('Tipo da Conta do ' + sNome + ' deve ser 1 ou 3. Verifique !'), 'Atenção !', Mb_IconExclamation);
                          qryMovListaFavorecidos.EnableControls;
                          break;
                        End;

                      If (sNome <> EmptyStr) And
                        (sDocumento <> EmptyStr) And
                        (sBanco <> EmptyStr) And
                        (sAgencia <> EmptyStr) And
                        (sConta <> EmptyStr) And
                        (sTipoConta <> EmptyStr) And
                        (dValor <> 0.00) Then
                        Begin
                          qryAux.Close;
                          qryAux.SQL.Clear;
                          qryAux.SQL.add('SELECT SEQDOCXPESSOAS.NEXTVAL SEQ FROM DUAL    ');
                          qryAux.Open;

                          qryMovListaFavorecidos.Insert;
                          qryMovListaFavorecidos.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                          qryMovListaFavorecidos.fieldByname('IDDOCUMENTOXPESSOAS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                          qryMovListaFavorecidos.FieldByName('IDFORCLI').AsString := EmptyStr;
                          qryMovListaFavorecidos.FieldByName('RAZAOSOCIAL').AsString := sNome;
                          qryMovListaFavorecidos.FieldByName('NUMDOCUMENTO').AsString := sDocumento;
                          qryMovListaFavorecidos.FieldByName('IDCBANCARIA').AsString := EmptyStr;
                          qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := sBanco;
                          qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := sAgencia;
                          qryMovListaFavorecidos.FieldByName('NUMOPERACAO').AsString := sOperacao;
                          qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := sConta;
                          qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := sTipoConta;
                          qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := dValor;
                          qryMovListaFavorecidos.FieldByName('FLGIMPORTADO').AsString := 'S'; // Sim
                          qryMovListaFavorecidos.Post;

                          dTotalLista := dTotalLista + dValor;
                        End;
                    End;

                  If RoundCM(dTotalLista, 2) <> 0.00 Then
                    Begin
                      If RoundCM(dTotalLista, 2) <= RoundCM(edSaldoListaFav.Value, 2) Then
                        Begin
                          qryMovListaFavorecidos.ApplyUpdates;

                          If dtmBaseDados.dbBaseDados.InTransaction Then
                            dtmBaseDados.dbBaseDados.Commit;
                        End
                      Else
                        Application.MessageBox(MSG011, 'Atenção !', Mb_IconExclamation);
                    End;
                Except
                  Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
                End;
              End;

          CloseFile(tArquivo);
          qryAux.Close;

          qryMovListaFavorecidos.Close;
          qryMovListaFavorecidos.Open;
          qryMovListaFavorecidos.EnableControls;

          cdsMovRemessaAfterScroll(cdsMovRemessa);

          Screen.Cursor := crDefault;

          freeandnil(sValorCampo);
        End
    End
  Else
    Application.MessageBox(MSG027, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronicaDeb.spbLocalizaFavorecClick(Sender: TObject);
Begin
  Inherited;
  If MSFavorec.Executar = MrOk Then
    If MSFavorec.ValoresChave[0] <> EmptyStr Then
      Begin
        qryMovListaFavorecidos.fieldByname('IDFORCLI').asString := MSFavorec.ValoresChave[0]; // IDPESSOA
        qryMovListaFavorecidos.fieldByname('NUMDOCUMENTO').asString := MSFavorec.ValoresChave[1]; // NUMDOCUMENTO
        qryMovListaFavorecidos.fieldByname('RAZAOSOCIAL').asString := MSFavorec.ValoresChave[2]; // RAZAOSOCIAL

        Cursor := crSQLWait;
        // Localizando os Dados Bancários
        qryContaBancaria.Close;
        qryContaBancaria.Prepare;
        qryContaBancaria.ParamByName('IDPESSOA').asString := MSFavorec.ValoresChave[0]; // IDPESSOA
        qryContaBancaria.Open;
        If Not qryContaBancaria.isEmpty Then
          Begin
            qryMovListaFavorecidos.FieldByName('IDCBANCARIA').asInteger := qryContaBancaria.fieldByname('IDCBANCARIA').asInteger;
            qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := qryContaBancaria.fieldByname('NUMBANCO').AsString;
            qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := qryContaBancaria.fieldByname('NUMAGENCIA').AsString;
            qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := qryContaBancaria.fieldByname('NUMCONTA').AsString;
            qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := qryContaBancaria.fieldByname('TIPOCONTA').AsString;
          End
        Else
          Begin
            qryMovListaFavorecidos.FieldByName('IDCBANCARIA').Clear;
            qryMovListaFavorecidos.FieldByName('NUMBANCO').Clear;
            qryMovListaFavorecidos.FieldByName('NUMAGENCIA').Clear;
            qryMovListaFavorecidos.FieldByName('NUMCONTA').Clear;
            qryMovListaFavorecidos.FieldByName('TIPOCONTA').Clear;
          End;
        qryContaBancaria.Close;
        Screen.Cursor := crDefault;

        dbeValorPagtoLista.setfocus;
      End;
End;

Procedure TFrmRemessaEletronicaDeb.spbLimparMovListaClick(Sender: TObject);
Begin
  Inherited;
  If qryMovListaFavorecidos.Locate('FLGIMPORTADO', 'S', []) Then
    Begin
      If Application.MessageBox(MSG005, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Cursor := crSQLWait;
            qryMovListaFavorecidos.DisableControls;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.add('DELETE FROM DOCUMENTOXPESSOAS    ');
            qryAux.SQL.add('WHERE CODDOCUMENTO = ' + cdsMovRemessa.fieldByname('CODDOCUMENTO').asString);
            qryAux.SQL.add('      AND FLGIMPORTADO = ''S''   ');
            qryAux.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            qryMovListaFavorecidos.Close;
            qryMovListaFavorecidos.Open;
            qryMovListaFavorecidos.EnableControls;
            cdsMovRemessaAfterScroll(cdsMovRemessa);
            Cursor := crDefault;

            Application.MessageBox(MSG025, 'Atenção !', Mb_IconExclamation);
          Except
            Raise
          End;
        End;
    End
  Else
    Application.MessageBox(MSG024, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovListaFavDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      If qryMovListaFavorecidos.fieldbyname('FLGIMPORTADO').asString = 'S' Then
        dbgMovListaFav.Canvas.Font.Color := clBlue;

      dbgMovListaFav.DefaultDrawDataCell(Rect, Field, State);
    End;
End;
// **************** FIM ROTINAS DO MOVIMENTO DAS LISTAS DE FAVORECIDOS

Procedure TFrmRemessaEletronicaDeb.pcAnaliseRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
  Inherited;
  AllowChange := (Not cdsMovRemessa.isEmpty) And
    (qryDocumento.State = dsBrowse) And
    (qryMovListaFavorecidos.State = dsBrowse) And
    (qryMovTitulos.State = dsBrowse);
End;

Procedure TFrmRemessaEletronicaDeb.pcDetalManutChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
  Inherited;
  AllowChange := ((qryDocumento.State = dsBrowse) And
    (qryMovListaFavorecidos.State = dsBrowse) And
    (qryMovTitulos.State = dsBrowse));
End;

Procedure TFrmRemessaEletronicaDeb.pcGeralRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
  Inherited;
  AllowChange := (qryDocumento.State = dsBrowse) And
    (qryMovListaFavorecidos.State = dsBrowse) And
    (qryMovTitulos.State = dsBrowse);
End;

Procedure TFrmRemessaEletronicaDeb.spbPrepararEnvioClick(Sender: TObject);
Var sMsg, sListaDeDocumentos: String;
    iNSA: Integer;
    bUsaTabTemp : boolean;   //edilaine WO27905
Begin
  Inherited;

  sMsg := 'Confirma Preparo do Envio ?';

  //Everson Cunha - SIG119696 - Ini
  if bAnaliseFeita = false then
    sMsg := 'Não foi realizado o Processo de Análise do Movimento. ' + #13 + #13 +
            'Confirma Preparo do Envio assim mesmo ?';
  //Everson Cunha - SIG119696 - Fim
  
  iNSA := -1;

  if cdsMovRemessa.Locate('MARCADO', 'S', []) then // Sim
  begin
    //Everson Cunha - SIG119696 - Ini
    // Filtrando a Grid para verificar a existência de lançamentos com mensagem de erro
    Screen.Cursor := crSQLWait;
    cdsMovRemessa.Filtered := False;
    cdsMovRemessa.Filter := 'MARCADO = ''S'' AND TRIM(MSGERRO) <> '''' ';
    cdsMovRemessa.Filtered := True;
    Screen.Cursor := crDefault;

    if not cdsMovRemessa.isEmpty then
    begin
      Application.MessageBox('Existem Lançamentos Analisados que não foram Tratados. Verifique !', 'Atenção !', Mb_IconExclamation);
      cdsMovRemessa.Filtered := False;

      exit;
    end;

    cdsMovRemessa.Filtered := False;
    //Everson Cunha - SIG119696 - Fim

    // Filtro para caso haja pelo um 'N', então filtra, caso contrário todos estão marcados
    if cdsMovRemessa.Locate('MARCADO', 'N', []) then // Não
    begin
      // Filtrando a Grid somente para mostrar e processar os marcados
      Screen.Cursor := crSQLWait;
      cdsMovRemessa.Filtered := False;
      cdsMovRemessa.Filter := 'MARCADO = ''S'' '; // Sim
      cdsMovRemessa.Filtered := True;
      _TotalizaColunaGridMovRemessa('VALOR');
      cdsMovRemessa.First;
      Screen.Cursor := crDefault;
    end;

    if Application.MessageBox(pchar(sMsg), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      try
        Screen.Cursor := crSQLWait;

        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        cdsMovRemessa.DisableControls;
        cdsMovRemessa.First;
        frmProgresso.MostraFormProgresso('Aguarde, gerando movimento de envio...', True, False, True, 0, cdsMovRemessa.RecordCount);

        // Preparando uma lista contendo todos os CODDOCUMENTOS, que será
        // usada na cláusula IN do SELECT do INSERT principal abaixo
        iContador := 0;
        tsListaDeDocumentos.Clear;

        cdsMovRemessa.First;
        while not cdsMovRemessa.Eof do
        begin
          tsListaDeDocumentos.Add(cdsMovRemessa.FieldByName('CODDOCUMENTO').asString);
          cdsMovRemessa.Next;
          oRemessaEletronica._AtualizaFrmProgresso(iContador);
        end;
        
        cdsMovRemessa.First;
        sListaDeDocumentos := oRemessaEletronica._ConverteListas(tsListaDeDocumentos);

        //Gerando número NSA a partir do preparo e não mais na geração do arquivo remessa.
        qryAux.Close;
        qryAux.SQL.Clear;
        //Cássio Rovaroto - SIG nº 102320 - Início
        //qryAux.SQL.add('SELECT SEQNSAARQPAG.NEXTVAL NSA FROM DUAL    ');
        qryAux.SQL.add('SELECT SEQ_NSA_SIACC_' + cdsConvenio.FieldByName('NUMEMPRESABANCO').asString + '.NEXTVAL SEQ FROM DUAL    ');
        //Cássio Rovaroto - SIG nº 102320 - Fim
        qryAux.Open;
        iNSA := qryAux.FieldByName('SEQ').AsInteger;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.add('SELECT SEQARQUIVOPAGTO.NEXTVAL SEQ FROM DUAL                                    ');
        qryAux.Open;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('INSERT INTO ARQUIVOPAGTO (IDARQUIVOPAGTO, VLRTOTAL, FLGENVIADO, CODPORTFORMA, NSA) ');
        qryAux2.SQL.add('VALUES (:p1, :p2, :p3, :p4, :p5)                                               ');//Cássio Rovaroto - SIG nº 75187
        qryAux2.ParamByName('p1').asInteger := qryAux.FieldByName('SEQ').asInteger;
        qryAux2.ParamByName('p2').asFloat := _TotalizaColunaGridMovRemessa('VALOR');
        qryAux2.ParamByName('p3').asString := 'N'; // FLGENVIADO = Não
        qryAux2.ParamByName('p4').asString := cdsMovRemessa.FieldByName('CODPORTFORMA').asString;
        qryAux2.ParamByName('p5').AsInteger := iNSA; //Cássio Rovaroto - SIG nº 75187
        qryAux2.ExecSQL;

        frmProgresso.EscondeFormProgresso;
        iContador := 0;
        frmProgresso.MostraFormProgresso('Aguarde, atualizando dados dos documentos...', True, False, True, 0, cdsMovRemessa.RecordCount);

        cdsMovRemessa.First;
        while not cdsMovRemessa.Eof do
        begin
        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('INSERT INTO ARQUIVOXDOCUM (IDARQUIVOPAGTO, CODDOCARQ, ID_DOC_CODBARRAS_PESSOAS, CODFORMA, VALOR, TIPO, DATAVENCTO) ');
        qryAux2.SQL.add('SELECT :pIDARQUIVOPAGTO,                                                                                           ');
        qryAux2.SQL.add(        IntToStr(iContador + 1) + ',                                                                                ');
        qryAux2.SQL.add('       ID,                                                                                                         ');
        qryAux2.SQL.add('       NVL(CODFORMA, -1) AS CODFORMA,                                                                              ');
        qryAux2.SQL.add('       VALOR,                                                                                                      ');
        qryAux2.SQL.add('       TIPO,                                                                                                       ');
        qryAux2.SQL.add('       DATAVENCTO                                                                                                  ');
        qryAux2.SQL.add('FROM(                                                                                                              ');
        qryAux2.SQL.add('/* SEM LISTA DE PESSOAS E SEM LISTA DE TÍTULOS */                                                                  ');
        qryAux2.SQL.add('SELECT D.CODDOCUMENTO ID,                                                                                          ');
        qryAux2.SQL.add('       D.CODFORMA,                                                                                                 ');
        qryAux2.SQL.add('       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                                      ');
        qryAux2.SQL.add('               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                                             ');
        qryAux2.SQL.add('               DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR                                   ');
        qryAux2.SQL.add('        FROM LANCTODOCUM LANC                                                                                      ');
        qryAux2.SQL.add('        JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                                                 ');
        qryAux2.SQL.add('        WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR,                                                           ');
        qryAux2.SQL.add('       1 TIPO,                                                                                                     ');
        qryAux2.SQL.add('       D.CODDOCUMENTO,                                                                                             ');
        qryAux2.SQL.add('       D.DATAVENCTO                                                                                                ');
        qryAux2.SQL.add('FROM DOCUMENTO D                                                                                                   ');
        qryAux2.SQL.add('WHERE NOT EXISTS(SELECT 1 FROM DOCUMENTOXCODBARRAS DX WHERE DX.CODDOCUMENTO = D.CODDOCUMENTO)                      ');
        qryAux2.SQL.add('      AND NOT EXISTS(SELECT 1 FROM DOCUMENTOXPESSOAS DP WHERE DP.CODDOCUMENTO = D.CODDOCUMENTO)                    ');
        qryAux2.SQL.add('      AND D.CODDOCUMENTO = ' + cdsMovRemessa.FieldByName('CODDOCUMENTO').AsString                                   );

        //Everson Cunha - SIG104134 - Ini
        qryAux2.SQL.add(' )');
        
        {qryAux2.SQL.add('UNION ALL                                                                                                          ');
        qryAux2.SQL.add('/* LISTA DE PESSOAS */                                                                                             ');
        qryAux2.SQL.add('SELECT DP.IDDOCUMENTOXPESSOAS ID,                                                                                  ');
        qryAux2.SQL.add('       D.CODFORMA,                                                                                                 ');
        qryAux2.SQL.add('       DP.VALOR,                                                                                                   ');
        qryAux2.SQL.add('       2 TIPO,                                                                                                     ');
        qryAux2.SQL.add('       D.CODDOCUMENTO,                                                                                             ');
        qryAux2.SQL.add('       D.DATAVENCTO                                                                                                ');
        qryAux2.SQL.add('FROM DOCUMENTOXPESSOAS DP                                                                                          ');
        //qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DP.CODDOCUMENTO                                                               ');
        qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DP.CODDOCUMENTO AND D.CODDOCUMENTO = ' + cdsMovRemessa.FieldByName('CODDOCUMENTO').AsString );
        qryAux2.SQL.add('UNION ALL                                                                                                          ');
        qryAux2.SQL.add('/* LISTA DE TÍTULOS */                                                                                             ');
        qryAux2.SQL.add('SELECT DC.IDDOCUMENTOXCODBARRAS ID,                                                                                ');
        qryAux2.SQL.add('       D.CODFORMA,                                                                                                 ');
        qryAux2.SQL.add('       DC.VLRPAGTO,                                                                                                ');
        qryAux2.SQL.add('       3 TIPO,                                                                                                     ');
        qryAux2.SQL.add('       D.CODDOCUMENTO,                                                                                             ');
        qryAux2.SQL.add('       D.DATAVENCTO                                                                                                ');
        qryAux2.SQL.add('FROM DOCUMENTOXCODBARRAS DC                                                                                        ');
//        qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DC.CODDOCUMENTO                                                               ');
        qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DC.CODDOCUMENTO AND D.CODDOCUMENTO = ' + cdsMovRemessa.FieldByName('CODDOCUMENTO').AsString );
        //qryAux2.SQL.Add('WHERE ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(D.CODDOCUMENTO  ', sListaDeDocumentos, 500));
        qryAux2.SQL.add('ORDER BY TIPO, CODDOCUMENTO, VALOR)                                                                                ');}
        //Everson Cunha - SIG104134 - Fim

        qryAux2.ParamByName('pIDARQUIVOPAGTO').asInteger := qryAux.FieldByName('SEQ').asInteger; // IDARQUIVOPAGTO
        qryAux2.SQL.SaveToFile(sPathArquivosLog + '\SQL_InseriNoArquivoXDocum.txt');
        qryAux2.ExecSQL;
        cdsMovRemessa.Next;
        oRemessaEletronica._AtualizaFrmProgresso(iContador);
        end;

        //edilaine WO27905 : inicio
        bUsaTabTemp := false;

        qryAux1.Close;
        qryAux1.SQL.Clear;
        qryAux1.SQl.Add('SELECT * FROM ALL_TABLES WHERE TABLE_NAME = ''TMP_DOCUMENTO_IDS'' ');
        qryAux1.Open;
        if not qryAux1.isEmpty then
        begin
          qryAux1.Close;
          qryAux1.SQL.Clear;
          qryAux1.SQl.Add('SELECT COUNT(CODDOCUMENTO) FROM CM.TMP_DOCUMENTO_IDS ');
          qryAux1.SQl.Add(' WHERE CODPORTFORMA = ' + cdsMovRemessa.FieldByName('CODPORTFORMA').asString );
          qryAux1.SQl.Add('   AND DATAVENCTO   = ' + QuotedStr(dbDataProgIni.text) );
          qryAux1.Open;
          if (not qryAux1.isEmpty) and (qryAux1.Fields[0].AsInteger > 0) then
             bUsaTabTemp := true;
        end;

        if bUsaTabTemp then
        begin
          //update via tab temporaria
          qryAux1.Close;
          qryAux1.SQL.Clear;
          qryAux1.SQL.add('UPDATE DOCUMENTO D     ');
          qryAux1.SQL.add('   SET STATUS = ''1''  '); // Documento não pode ser alterado
          qryAux1.SQL.Add(' WHERE EXISTS (SELECT 1 FROM CM.TMP_DOCUMENTO_IDS T WHERE T.CODDOCUMENTO = D.CODDOCUMENTO) ');
          qryAux1.ExecSQL;

          //limpa daddos
          qryAux1.Close;
          qryAux1.SQL.Clear;
          qryAux1.SQl.Add('DELETE FROM CM.TMP_DOCUMENTO_IDS ');
          qryAux1.SQl.Add(' WHERE CODPORTFORMA = ' + cdsMovRemessa.FieldByName('CODPORTFORMA').asString );
          qryAux1.SQl.Add('   AND DATAVENCTO   = ' + QuotedStr(dbDataProgIni.text) );
          qryAux1.ExecSQL;
        end
        else
        begin
          qryAux1.Close;
          qryAux1.SQL.Clear;
          qryAux1.SQL.add('UPDATE DOCUMENTO     ');
          qryAux1.SQL.add('SET STATUS = ''1''   '); // Documento não pode ser alterado
          qryAux1.SQL.Add('WHERE ' + oCtrlFuncoesCapCar.QuebrarListaFiltro(1, '(CODDOCUMENTO  ', sListaDeDocumentos, 500));
          qryAux1.ExecSQL;
        end;
        //edilaine WO27905 : fim

        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

        frmProgresso.EscondeFormProgresso;
        Application.MessageBox(PChar('Preparo do Arquivo Nº ' + qryAux.FieldByName('SEQ').asString + ' realizado com sucesso !'), 'Atenção !', Mb_IconExclamation);

        cdsMovRemessa.Filtered := False;

        cdsMovRemessa.Data := oRemessaEletronica._SelecionaMovimentoRemessaDebito(dblkpConvenio.LookupValue,
                                                                                          dblkpFormaPagto.LookupValue,
                                                                                          dbDataProgIni.Date,
                                                                                          dbDataProgFim.Date);

        //pcAnaliseRemessa.Pages[1].TabVisible := cdsMovRemessa.IsEmpty; //Everson Cunha - SIG103725 - SIACC

          //cdsMovRemessa.data := oRemessaEletronica._SelecionaMovimentoRemessa(dblkpConvenio.LookupValue,
          //                                                                  dblkpFormaPagto.LookupValue,
          //                                                                  dbDataProgIni.Date,
          //                                                                  dbDataProgFim.Date);


        dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
        cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
        cdsMovRemessaAfterScroll(cdsMovRemessa);
        qryAux.Close;
        cdsMovRemessa.EnableControls;
        Screen.Cursor := crDefault;
        tbsAnaliseManutencoes.Highlighted := ((Not cdsMovRemessa.IsEmpty) And ((Not qryMovListaFavorecidos.IsEmpty) Or (Not qryMovTitulos.IsEmpty)));

      except
        on E: Exception do
        begin
          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack;

          cdsMovRemessa.Filtered := False;
          frmProgresso.EscondeFormProgresso;
          dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
          Screen.Cursor := crDefault;
          Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
        end;
      end;
    end
    else
    begin
      cdsMovRemessa.Filtered := False;
      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
      cdsMovRemessa.First;
    end;
  end
  else
  begin
    Application.MessageBox(MSG012, 'Atenção !', Mb_IconExclamation);
    cdsMovRemessa.first;
  end;
End;

Procedure TFrmRemessaEletronicaDeb.spbDesfazerPrepClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqPendente.isEmpty Then
    Begin
      If cdsMovArqPendente.fieldbyname('STATUS').asString <> 'Baixado' Then
        Begin
          If Application.MessageBox(pchar('Desfazer Preparo do Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
            Begin
              Try
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                Cursor := crSQLWait;
                
                cdsMovArqPendente.DisableControls;

                qryAux1.Close;
                qryAux1.SQL.Clear;
                qryAux1.SQL.add('UPDATE DOCUMENTO      ');
                qryAux1.SQL.add('SET STATUS = ''0''    '); // Documento pode ser alterado
                qryAux1.SQL.add('WHERE STATUS <> ''2'' '); // Documento não Baixado
                qryAux1.SQL.add('      AND CODDOCUMENTO IN (SELECT DISTINCT DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO) CODDOCUMENTO  ');
                qryAux1.SQL.add('                           FROM ARQUIVOXDOCUM  AX                                                                                                ');
                qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                ');
                qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXCODBARRAS DX ON DX.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3            ');
                qryAux1.SQL.add('                           WHERE AX.IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ')');
                qryAux1.ExecSQL;

                // Neste ponto haverá a exclusão dos registros filhos da ARQUIVOXDOCUM,
                // através da cláusula ON DELETE CASCADE da tabela Pai (ARQUIVOPAGTO).
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('DELETE FROM ARQUIVOPAGTO    ');
                qryAux.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString);
                qryAux.SQL.add('      AND FLGENVIADO = ''N'' ');
                qryAux.ExecSQL;

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                Application.MessageBox(pchar('Preparo do Arquivo Nº ' + cdsMovArqPendente.fieldbyname('IDARQUIVOPAGTO').asString + ' desfeito com Sucesso !'), 'Atenção !', Mb_IconExclamation);

                cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'N');

                qryMovArqPendDet.Close;
                qryMovArqPendDet.Open;
                cdsMovArqPendente.EnableControls;

				        //Everson Cunha - SIG103935 - SIACC - Ini
                qryMovArqPendDet.AfterScroll := qryMovArqPendDetAfterScroll;
                qryMovArqPendDetAfterScroll(qryMovArqPendDet);
				        //Everson Cunha - SIG103935 - SIACC - Fim

                Cursor := crDefault;
              Except
                Raise
              End;
            End
        End
      Else
        Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovRemessaFieldChanged(Sender: TObject; Field: TField);
Var RegAtual1: TBookMark;
Begin
  Inherited;
  RegAtual1 := cdsMovRemessa.GetBookmark; // Salvando o ponteiro do Registro atual
  dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
  If RegAtual1 <> Nil Then
    cdsMovRemessa.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
End;

Procedure TFrmRemessaEletronicaDeb.qryDocumentoAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  If Not qryDocumento.isEmpty Then
    Begin
      If Length(Trim(qryDocumentoNUMLEITCODBARRAS.asString)) = 47 Then
        Begin
          qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; ';
          rdgTipoTituloGeral.ItemIndex := 0; // Ficha de Compensação
          edDtVenctoGeral.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString));
          edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString);
        End
      Else If Length(Trim(qryDocumentoNUMLEITCODBARRAS.asString)) = 48 Then
        Begin
          qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; '; // Tamanho 48
          rdgTipoTituloGeral.ItemIndex := 1; // Arrecadação
          edDtVenctoGeral.Text := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asString;
          edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString);
        End
      Else
        Begin
          qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := EmptyStr;
          rdgTipoTituloGeral.ItemIndex := -1;
          edDtVenctoGeral.Text := EmptyStr;
          edValorGeral.value := 0.00;
        End;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.SpeedButton5Click(Sender: TObject);
Begin
  Inherited;
  With DtmDadosBancarios Do
    Begin
      SetaFiltroMs(qryDocumento.FieldByName('IDFORCLI').AsFloat);
      If MsContaCor.Executar = MrOk Then
        Begin
          If MsContaCor.ValoresChave[0] <> EmptyStr Then
            Begin
              If MsContaCor.ValoresChave[4] <> '0' Then // Se for Conta Corrente, salário ou Poupança (1 ou 2 ou 3)
                Begin
                  qryDocumento.FieldByName('IDCBANCARIA').AsFloat := StrToFloat(MsContaCor.ValoresChave[0]);
                  qryCtaBancariaGeral.Close;
                  qryCtaBancariaGeral.Open
                End
              Else
                Application.MessageBox(pchar('Tipo da Conta não definida no Cadastro deste Favorecido. Verifique !'), 'Atenção !', Mb_IconExclamation);
            End;
        End;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.btnAltGeralClick(Sender: TObject);
Begin
  Inherited;
  If Not qryDocumento.isEmpty Then
    Begin
      btnAltGeral.down := True;
      pnlInfMan.Enabled := False;
      pnlCritSel.Enabled := False;
      If qryDocumento.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosMovGeral.enabled := True;
            btnConGeral.Enabled := True;
            btnCanGeral.Enabled := True;

            DbeCodigoBarrasGeral.enabled := (rdgTipoTituloGeral.itemindex > -1);

            qryDocumento.Edit;
            DblCodForma.setfocus;
          Except
            btnCanGeralClick(Self);
            Raise;
          End;
        End
      Else
        Begin
          btnAltGeral.Down := False;
          pnlInfMan.Enabled := True;
          pnlCritSel.Enabled := True;
        End;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.btnConGeralClick(Sender: TObject);
Var sCodDocum: String;
Begin
  Inherited;
  If Trim(DbeCodigoBarrasGeral.Text) <> EmptyStr Then
    Begin
      If rdgTipoTituloGeral.Itemindex = 0 Then // Ficha de Compensação
        Begin
          If Length(DbeCodigoBarrasGeral.Text) <> 47 Then
            Begin
              Application.MessageBox(MSG013, 'Atenção !', Mb_IconExclamation);
              DbeCodigoBarrasGeral.setfocus;
              DbeCodigoBarrasGeral.SelectAll;
              Exit;
            End;

          If Not oRemessaEletronica._ValidaCodBarrasFichaComp(DbeCodigoBarrasGeral.Text, 10) Then
            Begin
              Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
              DbeCodigoBarrasGeral.setfocus;
              DbeCodigoBarrasGeral.SelectAll;
              Exit;
            End;
        End
      Else // Arrecadação
        Begin
          If (copy(DbeCodigoBarrasGeral.Text, 2, 1) = '9') And // Segmento - Exclusivo do Banco
          (copy(DbeCodigoBarrasGeral.Text, 17, 4) <> '0104') Then // <> do Banco Caixa
            Begin
              Application.MessageBox(MSG030, 'Atenção !', Mb_IconExclamation);
              DbeCodigoBarrasGeral.setfocus;
              DbeCodigoBarrasGeral.SelectAll;
              Exit;
            End;

          If Length(DbeCodigoBarrasGeral.Text) <> 48 Then
            Begin
              Application.MessageBox(MSG014, 'Atenção !', Mb_IconExclamation);
              DbeCodigoBarrasGeral.setfocus;
              DbeCodigoBarrasGeral.SelectAll;
              Exit;
            End;

          If Not oRemessaEletronica._ValidaCodBarrasArrecadacao(DbeCodigoBarrasGeral.Text) Then
            Begin
              Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
              DbeCodigoBarrasGeral.setfocus;
              DbeCodigoBarrasGeral.SelectAll;
              Exit;
            End;
        End;

      If edDtVenctoGeral.Text <> cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asString Then
        Application.MessageBox('Data do Código de Barras Diferente da Data Programada do Documento.', 'Atenção !', Mb_IconExclamation);

      If edValorGeral.Value <> cdsMovRemessa.fieldbyname('VALOR').asFloat Then
        Application.MessageBox('Valor do Código de Barras Diferente do Valor do Documento.', 'Atenção !', Mb_IconExclamation);
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryDocumento.State = dsEdit Then
          Begin
            Screen.Cursor := crSQLWait;

            sCodDocum := qryDocumento.fieldbyname('CODDOCUMENTO').asString;

            qryDocumento.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;
            qryDocumento.Close;
            qryDocumento.Open;

            If bAltFormPagto Then
              Begin
                cdsMovRemessa.DisableControls;
                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Selecionando Movimento...');
                cdsMovRemessa.data := oRemessaEletronica._SelecionaMovimentoRemessa(
                  dblkpConvenio.LookupValue,
                  dblkpFormaPagto.LookupValue,
                  dbDataProgIni.Date,
                  dbDataProgFim.Date);
                frmAguarde.pbAguarde.Visible := True;
                frmAguarde.Apaga;
                cdsMovRemessa.EnableControls;

                cdsMovRemessa.Locate('CODDOCUMENTO', sCodDocum, []);

                bAltFormPagto := False;
                sFormaPagtoAnt := EmptyStr;
              End;

            Screen.Cursor := crDefault;

            btnCanGeralClick(Self);
          End;
      End;
  Except
    btnCanGeralClick(Self);
    Raise;
  End;
End;

Procedure TFrmRemessaEletronicaDeb.rdgTipoTituloGeralClick(Sender: TObject);
Begin
  Inherited;
  If qryDocumento.state <> dsBrowse Then
    Begin
      DbeCodigoBarrasGeral.Enabled := True;
      If rdgTipoTituloGeral.itemindex = 0 Then // Ficha de Compensação
        qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
      Else // Arrecadação
        qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

      DbeCodigoBarrasGeral.Setfocus;
      DbeCodigoBarrasGeral.SelectAll;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.btnCanGeralClick(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryDocumento.state = dsEdit Then
        qryDocumento.CancelUpdates;

      dtmBaseDados.dbBaseDados.RollBack;
    End;

  qryDocumentoAfterScroll(qryDocumento);

  pnlDadosMovGeral.enabled := False;
  pnlInfMan.Enabled := True;
  pnlCritSel.Enabled := True;
  btnConGeral.Enabled := False;
  btnCanGeral.Enabled := False;
  btnAltGeral.Down := False;
End;

// **************** INICIO ROTINAS DO MOVIMENTO DOS TITULOS **************************
Procedure TFrmRemessaEletronicaDeb.btnIncTitClick(Sender: TObject);
Begin
  Inherited;
  btnIncTit.down := True;
  If qryMovTitulos.State <> dsInsert Then
    Begin
      Try
        If cdsMovRemessa.FieldByName('FLGPERMITETITULOSPAGTO').AsString = 'S' Then
          Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovTitulo.enabled := False;
            pnlDadosMovTitulo.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnAltTit.enabled := False;
            btnExcTit.enabled := False;
            btnConTit.Enabled := True;
            btnCanTit.Enabled := True;

            dValorAntCampo := 0.00;
            If _TemSaldoDisponivel(edSaldoTitulo.Value) Then
              Begin
                qryMovTitulos.Insert;
                rdgTipoTitulo.Itemindex := 0; // Ficha de Compensação
                dbeCodigoBarrasTitulos.setfocus;
                dbeCodigoBarrasTitulos.SelectAll;
              End
            Else
              btnCanTitClick(Self);
          End
        Else
          Begin
            Application.MessageBox(MSG028, 'Atenção !', Mb_IconExclamation);
            btnIncTit.down := False;
          End;
      Except
        btnCanTitClick(Self);
        Raise;
      End;
    End
  Else
    btnIncTit.Down := False;
End;

Procedure TFrmRemessaEletronicaDeb.btnAltTitClick(Sender: TObject);
Begin
  Inherited;
  If Not qryMovTitulos.isEmpty Then
    Begin
      dValorAntCampo := 0.00;
      btnAltTit.down := True;
      If qryMovTitulos.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            pnlGridMovTitulo.enabled := False;
            pnlDadosMovTitulo.enabled := True;
            pnlCritSel.Enabled := False;
            pnlInfMan.Enabled := False;

            btnIncTit.enabled := False;
            btnExcTit.enabled := False;
            btnConTit.Enabled := True;
            btnCanTit.Enabled := True;

            dValorAntCampo := qryMovTitulos.FieldByName('VLRPAGTO').AsFloat;

            qryMovTitulos.Edit;
            dbeCodigoBarrasTitulos.setfocus;
          Except
            btnCanTitClick(Self);
            Raise;
          End;
        End
      Else
        btnAltTit.Down := False;
    End
  Else
    Begin
      btnAltTit.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.btnExcTitClick(Sender: TObject);
Begin
  Inherited;
  If Not qryMovTitulos.isEmpty Then
    Begin
      If MsgDlg('Confirma Exclusão deste Título ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryMovTitulos.Delete;
            qryMovTitulos.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            qryMovTitulos.Close;
            qryMovTitulos.Open;

            cdsMovRemessaAfterScroll(cdsMovRemessa);

            Screen.Cursor := crDefault;
          Except
            Raise;
          End;
          btnExcTit.Down := False;
        End
      Else
        btnExcTit.Down := False;
    End
  Else
    Begin
      btnExcTit.Down := False;
      Application.MessageBox(MSG021, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.btnConTitClick(Sender: TObject);
Var bMsgCPFCNPJ: Boolean;
Begin
  Inherited;
  If (dbeCodigoBarrasTitulos.Text = EmptyStr) Then
    Begin
      Application.MessageBox(MSG018, 'Atenção !', Mb_IconExclamation);
      dbeCodigoBarrasTitulos.setfocus;
      Exit;
    End;

  If (dbDataVenctoBoleto.Text = EmptyStr) Then
    Begin
      Application.MessageBox(MSG016, 'Atenção !', Mb_IconExclamation);
      dbDataVenctoBoleto.setfocus;
      Exit;
    End;

  If dbeValorPagto.Value = 0 Then
    Begin
      Application.MessageBox(MSG008, 'Atenção !', Mb_IconExclamation);
      qryMovTitulos.FieldByName('VLRPAGTO').AsFloat := RoundCM(edSaldoTitulo.Value + dValorAntCampo, 2);
      dbeValorPagto.setfocus;
      Exit;
    End;

  If Trim(dbeCodigoBarrasTitulos.Text) <> EmptyStr Then
    Begin
      If rdgTipoTitulo.Itemindex = 0 Then // Ficha de Compensação
        Begin
          If Length(dbeCodigoBarrasTitulos.Text) <> 47 Then
            Begin
              Application.MessageBox(MSG013, 'Atenção !', Mb_IconExclamation);
              dbeCodigoBarrasTitulos.setfocus;
              dbeCodigoBarrasTitulos.SelectAll;
              Exit;
            End;

          If Not oRemessaEletronica._ValidaCodBarrasFichaComp(dbeCodigoBarrasTitulos.Text, 10) Then // Cálculo do digito na base 11
            Begin
              Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
              dbeCodigoBarrasTitulos.setfocus;
              dbeCodigoBarrasTitulos.SelectAll;
              Exit;
            End;
        End
      Else // Arrecadação
        Begin
          If (copy(dbeCodigoBarrasTitulos.Text, 2, 1) = '9') And // Segmento - Exclusivo do Banco
          (copy(dbeCodigoBarrasTitulos.Text, 17, 4) <> '0104') Then // <> do Banco CAIXA
            Begin
              Application.MessageBox(MSG030, 'Atenção !', Mb_IconExclamation);
              dbeCodigoBarrasTitulos.setfocus;
              dbeCodigoBarrasTitulos.SelectAll;
              Exit;
            End;

          If Length(dbeCodigoBarrasTitulos.Text) <> 48 Then
            Begin
              Application.MessageBox(MSG014, 'Atenção !', Mb_IconExclamation);
              dbeCodigoBarrasTitulos.setfocus;
              dbeCodigoBarrasTitulos.SelectAll;
              Exit;
            End;

          If Not oRemessaEletronica._ValidaCodBarrasArrecadacao(dbeCodigoBarrasTitulos.Text) Then
            Begin
              Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
              dbeCodigoBarrasTitulos.setfocus;
              dbeCodigoBarrasTitulos.SelectAll;
              Exit;
            End;
        End;
    End;

  If RoundCM(dbeValorPagto.Value, 2) > RoundCM((dValorAntCampo + edSaldoTitulo.Value), 2) Then
    Begin
      Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
      qryMovTitulos.FieldByName('VLRPAGTO').AsFloat := RoundCM(edSaldoTitulo.Value + dValorAntCampo, 2);
      dbeValorPagto.setfocus;
      Exit;
    End;

  If (qryMovTitulos.FieldByName('VLRPAGTO').AsFloat >= dVlrObrigaNumDocTit) And
    (trim(qryMovTitulos.FieldByName('NUMDOCUMENTO').AsString) = EmptyStr) And
    (trim(dbCPFCNPJ.text) = EmptyStr) Then
    Begin
      Application.MessageBox(pchar('Campo CPF/CNPJ obrigatório para Valor Maior ou Igual a ' + #13 + #13 +
        floattostrf(dVlrObrigaNumDocTit, ffCurrency, 14, 2) + '. Verifique !'), 'Atenção !', Mb_IconExclamation);
      dbCPFCNPJ.setfocus;
      dbCPFCNPJ.SelectAll;
      Exit;
    End;

  If trim(dbCPFCNPJ.text) <> EmptyStr Then
    Begin
      bMsgCPFCNPJ := False;
      If length(trim(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)) = 11 Then
        bMsgCPFCNPJ := oRemessaEletronica._ValidaCPF(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)
      Else If length(trim(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)) = 14 Then
        bMsgCPFCNPJ := oRemessaEletronica._ValidaCNPJ(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString)
      Else
        bMsgCPFCNPJ := False;

      If Not bMsgCPFCNPJ Then
        Begin
          Application.MessageBox(MSG029, 'Atenção !', Mb_IconExclamation);
          dbCPFCNPJ.Setfocus;
          dbCPFCNPJ.SelectAll;
          Exit;
        End;
    End;

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryMovTitulos.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            If qryMovTitulos.State = dsInsert Then
              Begin
                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.add('SELECT SEQDOCXCODBARRAS.NEXTVAL SEQ FROM DUAL ');
                qryAux.Open;
                qryMovTitulos.fieldByname('CODDOCUMENTO').asInteger := cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger;
                qryMovTitulos.fieldByname('IDDOCUMENTOXCODBARRAS').asInteger := qryAux.fieldByname('SEQ').asInteger;

                If rdgTipoTitulo.itemindex = 0 Then
                  qryMovTitulos.fieldByname('FLGTIPOCODBARRAS').asString := 'F' // Ficha de Compensão
                Else
                  qryMovTitulos.fieldByname('FLGTIPOCODBARRAS').asString := 'A'; // Arrecadação

                qryAux.Close;
              End;

            qryMovTitulos.Post;
            qryMovTitulos.ApplyUpdates;

            If RoundCM(edSaldoTitulo.Value, 2) < 0.00 Then
              Begin
                Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
                dbeValorPagto.Setfocus;
                Exit;
              End;

            dtmBaseDados.dbBaseDados.Commit;

            qryMovTitulos.Close;
            qryMovTitulos.Open;

            dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := _TotalizaColunaGridMovTitulos('VLRPAGTO', 2);
            edSaldoTitulo.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalTitulos, 2);

            Screen.Cursor := crDefault;

            If (btnIncTit.down) And (RoundCM(edSaldoTitulo.Value, 2) <> 0.00) Then
              btnIncTitClick(Self)
            Else
              btnCanTitClick(Self);
          End;
      End;
  Except
    btnCanTitClick(Self);
    Raise;
  End;
End;

Procedure TFrmRemessaEletronicaDeb.btnCanTitClick(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryMovTitulos.state In [dsEdit, dsInsert] Then
        qryMovTitulos.CancelUpdates;

      dtmBaseDados.dbBaseDados.RollBack;

      dbgMovTitulosRowChanged(self);
    End;

  pnlGridMovTitulo.enabled := True;
  pnlDadosMovTitulo.enabled := False;
  pnlCritSel.Enabled := True;
  pnlInfMan.Enabled := True;

  btnIncTit.enabled := True;
  btnAltTit.enabled := True;
  btnExcTit.enabled := True;
  btnConTit.Enabled := False;
  btnCanTit.Enabled := False;

  btnIncTit.Down := False;
  btnAltTit.Down := False;
End;

Procedure TFrmRemessaEletronicaDeb.dbeCodigoBarrasTitulosExit(Sender: TObject);
Begin
  Inherited;
  If (dbeCodigoBarrasTitulos.text <> EmptyStr) And (length(trim(dbeCodigoBarrasTitulos.text)) >= 47) Then
    Begin
      If rdgTipoTitulo.Itemindex = 0 Then // Ficha de Compensação
        Begin
          If copy(dbeCodigoBarrasTitulos.text, 34, 1) <> '0' Then
            qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(dbeCodigoBarrasTitulos.text)
          Else
            qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime;
        End
      Else // Arrecadação
        qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime;

      qryMovTitulos.fieldbyname('VLRPAGTO').asFloat := oRemessaEletronica._ExtrairValorCodigoDeBarra(dbeCodigoBarrasTitulos.text);
      qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := EmptyStr;
      qryMovTitulos.fieldbyname('NUMDOCUMENTO').Clear;
      If qryMovTitulos.FieldByName('VLRPAGTO').AsFloat >= dVlrObrigaNumDocTit Then
        Begin
          qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString := cdsMovRemessa.fieldbyname('NUMDOCUMENTO').asString;
          If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 11 Then
            qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '999.999.999\-99;0;_'
          Else If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 14 Then
//            qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '99.999.999\/9999\-99;0;_';
            qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := 'AA.AAA.AAA\/AAAA\-99;0;_';    // Paulo Nobre - WO33342
        End;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbLimpaCampo1Click(Sender: TObject);
Begin
  Inherited;
  qryDocumento.fieldbyname('NUMLEITCODBARRAS').Clear;
  DbeCodigoBarrasGeral.Text := EmptyStr;
  edDtVenctoGeral.Text := EmptyStr;
  edValorGeral.value := 0.00;
  DbeCodigoBarrasGeral.Setfocus;
  DbeCodigoBarrasGeral.SelectAll;
End;
// **************** FIM DAS ROTINAS DO MOVIMENTO DOS TITULOS **************************

Procedure TFrmRemessaEletronicaDeb.spbGerarArqClick(Sender: TObject);
var
  sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC, sNSA: String;
  sNomeCompletoArquivoRemessaServidor: string; //Cássio Rovaroto - SIG nº 102320
Begin
  inherited;
  if (not cdsMovArqPendente.isEmpty) and (not qryMovArqPendDet.isEmpty) then
  begin
    // Verificando se há parametrização específica do Convênio em questão
    if not cdsMovArqPendente.FieldByName('PATHARQUIVOREM').IsNull Then
    begin
      if Application.MessageBox(pchar('Gerar Arquivo de Envio Nº ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
      begin
        //Cássio Rovaroto - SIG nº 102320 - Início
        if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
              Application.MessageBox(pchar('Em bases de testes, os arquivos são gravados em C:\Planus\Temp\RemessaEletronica\Remessa\ '), 'Atenção !', MB_ICONEXCLAMATION + MB_OK);
		    //Cássio Rovaroto - SIG nº 102320 - Fim

        Screen.Cursor := crSQLWait;
        
        // Montando o nome do Arquivo
        sNSA := cdsMovArqPendente.FieldByName('NSA').asString;
        qryAux1.Close;
        qryAux1.SQL.Clear;
        qryAux1.SQL.add('SELECT ''DEB.'' || TO_CHAR(SYSDATE, ''YYYYMMDD.'') || TRIM(PO.NUMEMPRESABANCO) || ''.'' || LPAD(:pIDARQUIVOPAGTO, 6, ''0'') || ''.rem'' AS NOME_ARQ_REM ');
        qryAux1.SQL.add('FROM PORTADORFORMA PO   ');
        qryAux1.SQL.add('WHERE PO.CODPORTFORMA =:pCODPORTFORMA ');
        qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := sNSA;
        qryAux1.ParamByName('pCODPORTFORMA').AsString := cdsMovArqPendente.FieldByName('CODPORTFORMA').asString;
        qryAux1.Open;
        sNomeArquivoGerado := qryAux1.FieldByName('NOME_ARQ_REM').asString;

        //Cássio Rovaroto - SIG nº 102320 - Início
        sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;
        if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
        begin
          sNomeCompletoArquivoRemessaServidor := cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;  //Cássio Rovaroto - SIG nº 101591
          sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
        end
        else
          sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivoGerado;

        if oRemessaEletronica.Impersonate then
        begin
          if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessa)) then
            ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessa));

          if FileExists(sNomeCompletoArquivoRemessa) then
            DeleteFile(sNomeCompletoArquivoRemessa);

          RevertToSelf;
        end;
        //Cássio Rovaroto - SIG nº 102320 - Fim

        // ROTINAS PARA GERAR O ARQUIVO (_GerarArquivo)
        if oRemessaEletronica._CriaArquivo(sNomeCompletoArquivoRemessa) Then
        begin
          try
            if Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            cdsMovArqPendente.DisableControls;

            //
            // Gerando e Gravando os dados no Arquivo de Remessa
            //
            oRemessaEletronica._GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                                                     cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asString,
                                                     cdsMovArqPendente.FieldByName('CODPORTFORMA').asString,
                                                     sNSA, // Número Sequencial do Arquivo
                                                     '0'); // 0 - Débito / 1 - Cancelamento de débito

            // Atualizando o Movimento
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.add('UPDATE ARQUIVOPAGTO     ');
            qryAux2.SQL.add('SET NSA = ' + sNSA);
            qryAux2.SQL.add(', DTGERACAOARQTXT = SYSDATE ');
            qryAux2.SQL.add(', USUGERACAOARQTXT = ' + QuotedStr(Sistema.NomeUsuario));
            qryAux2.SQL.add(', NOMEARQTXT = ' + QuotedStr(sNomeArquivoGerado));
            qryAux2.SQL.add(', FLGENVIADO = ''S''  ');
            qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asString);
            qryAux2.ExecSQL;

            //Cássio Rovaroto - SIG nº 102320 - Início
            //Gerando registros de tarifa bancária
            //_RegistraTarifaBancaria(cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asInteger);
            //Cássio Rovaroto - SIG nº 102320 - Fim

            if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Commit;
              
			      //Cássio Rovaroto - SIG nº 102320 - Início
            if oRemessaEletronica.Impersonate then
            begin
              if not DirectoryExists(ExtractFileDir(sNomeCompletoBackup)) then
                ForceDirectories(ExtractFileDir(sNomeCompletoBackup));

              //Copiando o arquivo do diretório de remessa para o de backup
              CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoBackup), False);

              if (Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO') then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
              begin
                if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) then
                  ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));

                 // Copiando o arquivo do diretório de remessa para PRODUCAO
                 CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);

                 if FileExists(sNomeCompletoArquivoRemessa) Then
                  DeleteFile(pChar(sNomeCompletoArquivoRemessa));
              end;
              RevertToSelf;
            end;
            //Cássio Rovaroto - SIG nº 102320 - Fim

            Application.MessageBox(PChar('Arquivo Nº ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asString + ' -> ' + sNomeArquivoGerado + ' <- Gerado com Sucesso !'), 'Atenção !', Mb_IconExclamation);

            cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'N');
            cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

            qryMovArqPendDet.Close;
            qryMovArqPendDet.Open;

			      //Everson Cunha - SIG103935 - SIACC - Ini
            qryMovArqPendDet.AfterScroll := qryMovArqPendDetAfterScroll;
            qryMovArqPendDetAfterScroll(qryMovArqPendDet);
			      //Everson Cunha - SIG103935 - SIACC - Fim

            qryMovArqGeradoDet.Close;
            qryMovArqGeradoDet.Open;
            qryAux.Close;
            qryAux1.Close;
            qryAux2.Close;
            Screen.Cursor := crDefault;
            cdsMovArqPendente.EnableControls;
          except
            on E: Exception do
            begin
              if dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.RollBack;

              Screen.Cursor := crDefault;
              cdsMovArqPendente.EnableControls;
              Application.MessageBox(PChar(E.Message), 'Atenção !', Mb_IconExclamation);
            end;
          end
        end
        else
          Application.MessageBox(PChar('Arquivo Nº ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asString + ' Não Gerado.'), 'Atenção !', Mb_IconExclamation);

        Screen.Cursor := crDefault;
      end
    end
    else
      Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
  end
  else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronicaDeb.spbCancelarMovArqGeradoClick(Sender: TObject);
var sNomeCompletoArquivoRemessa, sNomeCompletoArquivoSeguranca: string;
begin
  inherited;

  if not cdsMovArqGerado.isEmpty then
  begin
    if Application.MessageBox(pchar('Cancelar o Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      //
      // Excluindo o arquivo do diretório do Servidor
      //
      //Everson Cunha - SIG103935 - SIACC - Ini
      if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
      begin
        sNomeCompletoArquivoRemessa := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
        sNomeCompletoArquivoSeguranca := cdsMovArqGerado.fieldbyname('PATHARQUIVOSEGURANCA').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
      end
      else
      begin
        sNomeCompletoArquivoRemessa   := 'C:\Planus\Temp\RemessaEletronica\Remessa\'   + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
        sNomeCompletoArquivoSeguranca := 'C:\Planus\Temp\RemessaEletronica\Seguranca\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
      end;

      //sNomeCompletoArquivoRemessa := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
      //sNomeCompletoArquivoSeguranca := cdsMovArqGerado.fieldbyname('PATHARQUIVOSEGURANCA').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
      //Everson Cunha - SIG103935 - SIACC - Fim

      //Everson Cunha - SIG119696 - Ini
      if FileExists(sNomeCompletoArquivoSeguranca) then
      begin
        Application.MessageBox(pchar('Este arquivo consta como encaminhado à CAIXA (CEF), favor verificar com a GETIF'), 'Atenção !', Mb_IconExclamation);

        exit;
      end;
      //Everson Cunha - SIG119696 - Fim

      //Cássio Rovaroto - SIG nº 73883 - Início
      if oRemessaEletronica.Impersonate then
      begin
        if FileExists(sNomeCompletoArquivoRemessa) then
          if not(DeleteFile(sNomeCompletoArquivoRemessa)) then
            Application.MessageBox(pchar('Problemas ao Remover o Arquivo -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Tente Novamente'), 'Atenção !', Mb_IconExclamation);

        RevertToSelf;
      end;
      //Cássio Rovaroto - SIG nº 73883 - Fim

      try
        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        Screen.Cursor := crSQLWait;
        cdsMovArqGerado.DisableControls;

        qryAux1.Close;
        qryAux1.SQL.Clear;
        qryAux1.SQL.add('UPDATE DOCUMENTO      ');
        qryAux1.SQL.add('SET STATUS = ''0''    '); // Documento pode ser alterado
        qryAux1.SQL.add('WHERE STATUS <> ''2'' '); // Documento não Baixado
        qryAux1.SQL.add('      AND CODDOCUMENTO IN (SELECT DISTINCT DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO) CODDOCUMENTO  ');
        qryAux1.SQL.add('                           FROM ARQUIVOXDOCUM  AX                                                                                                ');
        qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                ');
        qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXCODBARRAS DX ON DX.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3            ');
        qryAux1.SQL.add('                           WHERE AX.IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ')');
        qryAux1.ExecSQL;

        qryAux2.Close;
        qryAux2.SQL.Clear;
        qryAux2.SQL.add('UPDATE ARQUIVOPAGTO           ');
        qryAux2.SQL.add('SET DTCANCELAARQTXT = SYSDATE ');
        qryAux2.SQL.add(', USUCANCELAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
        qryAux2.SQL.add(', FLGENVIADO = ''C''          '); // Cancelado
        qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString);
        qryAux2.ExecSQL;

        if dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.Commit;

        Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Cancelado com Sucesso !'), 'Atenção !', MB_ICONINFORMATION);

        cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

        qryMovArqGeradoDet.Close;
        qryMovArqGeradoDet.Open;

        //Everson Cunha - SIG103935 - SIACC - Ini
        qryMovArqGeradoDet.AfterScroll := qryMovArqGeradoDetAfterScroll;
        qryMovArqGeradoDetAfterScroll(qryMovArqGeradoDet);
        //Everson Cunha - SIG103935 - SIACC - Fim

        SqlMovArqCancelado.Open;
        qryMovArqCancelDet.Close;
        qryMovArqCancelDet.Open;

        cdsMovArqGerado.EnableControls;
                    
        Screen.Cursor := crDefault;
      Except
        on E: Exception do
        begin
          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack;

          Screen.Cursor := crDefault;
          Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
        end;
      end;
    end;
  end
  else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
end;

//Everson Cunha - SIG119696 - Ini
procedure TFrmRemessaEletronicaDeb.btnCancelamentoBancoClick(
  Sender: TObject);
var sNomeCompletoArquivoRemessa, sNomeCompletoArquivoSeguranca, sNSA: string;
sNomeArquivoGerado, sNomeCompletoArquivoRemessaServidor, sNomeCompletoBackup: string;
begin
  inherited;

  if not cdsMovArqGerado.isEmpty then
  begin
    if Application.MessageBox(pchar('Cancelar o Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- junto à CAIXA (CEF)?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      //Arquivo encaminhado ao Banco
      if Copy(UpperCase(Sistema.AliasServidor), 1, 8) = 'PRODUCAO' then
        sNomeCompletoArquivoSeguranca := cdsMovArqGerado.fieldbyname('PATHARQUIVOSEGURANCA').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString
      else
        sNomeCompletoArquivoSeguranca := 'C:\Planus\Temp\RemessaEletronica\Seguranca\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
      //

      //Verificar se o arquivo foi encaminhado para a Caixa
      //Arquivos que vão ao Banco ficam disponíveis na pasta Seguranca
      if not FileExists(sNomeCompletoArquivoSeguranca) then
        if Application.MessageBox(pchar('Este arquivo NÃO consta como encaminhado à CAIXA (CEF), deseja prosseguir mesmo assim com o cancelamento de débito?'), 'Atenção !', Mb_IconExclamation + MB_YESNO) = IDNO then
          exit;
      //

      //
      //Criação do arquivo para cancelamento de débito
      //
      Screen.Cursor := crSQLWait;

      //Gerando novo NSA
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.add('SELECT SEQ_NSA_SIACC_' + cdsConvenio.FieldByName('NUMEMPRESABANCO').asString + '.NEXTVAL SEQ FROM DUAL ');
      qryAux.Open;
      sNSA := qryAux.FieldByName('SEQ').AsString;
      //

      //Montando o nome do Arquivo de CANCELAMENTO DE DÉBITO
      qryAux1.Close;
      qryAux1.SQL.Clear;
      qryAux1.SQL.add('SELECT ''CAN.'' || TO_CHAR(SYSDATE, ''YYYYMMDD.'') || TRIM(PO.NUMEMPRESABANCO) || ''.'' || LPAD(:pNSA, 6, ''0'') || ''.rem'' AS NOME_ARQ_REM ');
      qryAux1.SQL.add('FROM PORTADORFORMA PO   ');
      qryAux1.SQL.add('WHERE PO.CODPORTFORMA = :pCODPORTFORMA ');

      qryAux1.ParamByName('pNSA').AsString := sNSA;
      qryAux1.ParamByName('pCODPORTFORMA').AsString := cdsMovArqGerado.FieldByName('CODPORTFORMA').asString;
      qryAux1.Open;

      sNomeArquivoGerado := qryAux1.FieldByName('NOME_ARQ_REM').asString;
      //

      //Gera o arquivo local para depois mover
      sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;

      //Definindo destino dos arquivos
      if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
      begin
        sNomeCompletoArquivoRemessaServidor := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;  //Cássio Rovaroto - SIG nº 101591
        sNomeCompletoBackup := cdsMovArqGerado.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
      end
      else
        sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivoGerado;

      if oRemessaEletronica.Impersonate then
      begin
        if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessa)) then
          ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessa));

        if FileExists(sNomeCompletoArquivoRemessa) then
          DeleteFile(sNomeCompletoArquivoRemessa);

        RevertToSelf;
      end;

      // ROTINAS PARA GERAR O ARQUIVO (_GerarArquivo)
      if oRemessaEletronica._CriaArquivo(sNomeCompletoArquivoRemessa) then
      begin
        try
          if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

          cdsMovArqGerado.DisableControls;

          oRemessaEletronica._GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                                                   cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString,
                                                   cdsMovArqGerado.FieldByName('CODPORTFORMA').asString,
                                                   sNSA, // Número Sequencial do Arquivo
                                                   '1'); // 0 - Débito / 1 - Cancelamento de débito

          // Atualizando o Movimento
          qryAux2.Close;
          qryAux2.SQL.Clear;
          qryAux2.SQL.add('UPDATE ARQUIVOPAGTO '                                    );
          qryAux2.SQL.add('SET DTGERACAOARQTXT = SYSDATE '                          );
          qryAux2.SQL.add(', USUGERACAOARQTXT = ' + quotedstr(Sistema.NomeUsuario)  );
          qryAux2.SQL.add(', NOMEARQTXT = ' + quotedstr(sNomeArquivoGerado)         );
          qryAux2.SQL.add(', NSA = ' + sNSA                                         );
          qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString);
          qryAux2.ExecSQL;

          if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

          if oRemessaEletronica.Impersonate then
          begin
            if not DirectoryExists(ExtractFileDir(sNomeCompletoBackup)) then
              ForceDirectories(ExtractFileDir(sNomeCompletoBackup));

            //Copiando o arquivo do diretório de remessa para o de backup
            CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoBackup), False);

            if (Copy(UpperCase(Sistema.AliasServidor), 1, 8) = 'PRODUCAO') then
            begin
              if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) then
                ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));

               //Copiando o arquivo do diretório de remessa local para servidor
               CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);

               if FileExists(sNomeCompletoArquivoRemessa) Then
                DeleteFile(pChar(sNomeCompletoArquivoRemessa));
            end;

            RevertToSelf;
          end;

          qryAux.Close;
          qryAux1.Close;
          qryAux2.Close;

          Screen.Cursor := crDefault;

          Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString + ' -> ' + sNomeArquivoGerado + ' <- Gerado para cancelamento do Arquivo ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' junto ao Banco'), 'Atenção !', MB_ICONINFORMATION);

          cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

          qryMovArqGeradoDet.Close;
          qryMovArqGeradoDet.Open;

          qryMovArqGeradoDet.AfterScroll := qryMovArqGeradoDetAfterScroll;
          qryMovArqGeradoDetAfterScroll(qryMovArqGeradoDet);

          SqlMovArqCancelado.Open;
          qryMovArqCancelDet.Close;
          qryMovArqCancelDet.Open;

          cdsMovArqGerado.EnableControls;
        except
          on E: Exception do
          begin
            if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.RollBack;

            Screen.Cursor := crDefault;
            cdsMovArqGerado.EnableControls;
            Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
          end;
        end;
      end
      else
        Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString + ' Não Gerado. Verifique !'), 'Atenção !', Mb_IconExclamation);

      Screen.Cursor := crDefault;
    end;
  end
  else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
end;
//Everson Cunha - SIG119696 - Fim

Procedure TFrmRemessaEletronicaDeb.spbImpMovArqGeradoClick(Sender: TObject);
Begin
  Inherited;
  If (Not cdsMovArqGerado.isEmpty) And (Not qryMovArqGeradoDet.isEmpty) Then
    Begin
      Screen.Cursor := crSQLWait;
      qryEmpresa.Close;
      qryEmpresa.Open;
      qryBancoFUNCEF.Close;
      qryBancoFUNCEF.Open;
      TfrmPreview.CreateModalPreview(Application, rptMovArqGerado, rptMovArqGerado.PrinterSetup.DocumentName);
      qryEmpresa.Close;
      qryBancoFUNCEF.Close;
      Screen.Cursor := crDefault;
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronicaDeb.SpeedButton3Click(Sender: TObject);
Begin
  Inherited;
  qryDocumento.fieldbyname('IDCBANCARIA').Clear;
  qryCtaBancariaGeral.Close;
  qryCtaBancariaGeral.Open;
End;

Procedure TFrmRemessaEletronicaDeb.SpeedButton12Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqGerado.isEmpty Then
    Begin
      qeMovArqGerado.FileName := sPathArquivosLog + '\ARQGERADOS_MOVIMENTO.XLS';
      qeMovArqGerado.Execute;
      cdsMovArqGerado.First;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.SpeedButton13Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqCancelado.isEmpty Then
    Begin
      qeMovCancelado.FileName := sPathArquivosLog + '\ARQCANCELADOS_MOVIMENTO.XLS';
      qeMovCancelado.Execute;
      cdsMovArqCancelado.First;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dblkpConvenio2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If pcGeraArquivoOper.ActivePage = tbsGAPendentes Then
    Begin
      //Everson Cunha - SIG104134 - Ini
      qryMovArqPendDet.Close;
      qryMovArqPendDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(StrToInt(dblkpConvenio2.LookupValue));
      qryMovArqPendDet.SQL.SaveToFile(sPathArquivosLog + '\SQL_MovArqDetalhado.txt');
      qryMovArqPendDet.Open;
      //Everson Cunha - SIG104134 - Fim

      dbNomeConvenioSel.DataSource := dsMovArqPendente;
      dbeCaminhoArq.DataSource := dsMovArqPendente;
      cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'N');

	    //Everson Cunha - SIG103935 - SIACC - Ini
      qryMovArqPendDet.AfterScroll := qryMovArqPendDetAfterScroll;
      qryMovArqPendDetAfterScroll(qryMovArqPendDet);
	    //Everson Cunha - SIG103935 - SIACC - Fim
    End;

  If pcGeraArquivoOper.ActivePage = tbsGAGerados Then
    Begin
      //Everson Cunha - SIG104134 - Ini
      qryMovArqGeradoDet.Close;
      qryMovArqGeradoDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(StrToInt(dblkpConvenio2.LookupValue));
      qryMovArqGeradoDet.SQL.SaveToFile(sPathArquivosLog + '\SQL_MovArqDetalhado.txt');
      qryMovArqGeradoDet.Open;
      //Everson Cunha - SIG104134 - Fim

      dbNomeConvenioSel.DataSource := dsMovArqGerado;
      dbeCaminhoArq.DataSource := dsMovArqGerado;
      cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

	    //Everson Cunha - SIG103935 - SIACC - Ini
      qryMovArqGeradoDet.AfterScroll := qryMovArqGeradoDetAfterScroll;
      qryMovArqGeradoDetAfterScroll(qryMovArqGeradoDet);
	    //Everson Cunha - SIG103935 - SIACC - Fim
    End;

  If pcGeraArquivoOper.ActivePage = tbsGACancelados Then
    Begin
      //Everson Cunha - SIG104134 - Ini
      qryMovArqCancelDet.Close;
      qryMovArqCancelDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(StrToInt(dblkpConvenio2.LookupValue));
      qryMovArqCancelDet.SQL.SaveToFile(sPathArquivosLog + '\SQL_MovArqDetalhado.txt');
      qryMovArqCancelDet.Open;
      //Everson Cunha - SIG104134 - Fim

      dbNomeConvenioSel.DataSource := dsMovArqCancelado;
      cdsMovArqCancelado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'C');

	    //Everson Cunha - SIG103935 - SIACC - Ini
      qryMovArqCancelDet.AfterScroll := qryMovArqCancelDetAfterScroll;
      qryMovArqCancelDetAfterScroll(qryMovArqCancelDet);
	    //Everson Cunha - SIG103935 - SIACC - Fim
    End;

  If pcGeraArquivoOper.ActivePage = tbsGAFinalizados Then
    Begin
      //Everson Cunha - SIG104134 - Ini
      qryMovArqFinalDet.Close;
      qryMovArqFinalDet.Sql.text := oRemessaEletronica._SelecionaMovArqDetalhe(StrToInt(dblkpConvenio2.LookupValue));
      qryMovArqFinalDet.SQL.SaveToFile(sPathArquivosLog + '\SQL_MovArqDetalhado.txt');
      qryMovArqFinalDet.Open;
      //Everson Cunha - SIG104134 - Fim

      dbNomeConvenioSel.DataSource := dsMovArqFinalizado;
      cdsMovArqFinalizado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'F');

	    //Everson Cunha - SIG103935 - SIACC - Ini
      qryMovArqFinalDet.AfterScroll := qryMovArqFinalDetAfterScroll;
      qryMovArqFinalDetAfterScroll(qryMovArqFinalDet);
	    //Everson Cunha - SIG103935 - SIACC - Fim
    End;
End;

Procedure TFrmRemessaEletronicaDeb.pcGeraArquivoOperChange(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio2.Clear;
  dblkpConvenio2.Text := EmptyStr;

  dbeCaminhoArq.DataSource := Nil;

  If pcGeraArquivoOper.ActivePage = tbsGAPendentes Then
    Begin
      dbNomeConvenioSel.DataSource := dsMovArqPendente;
      dbeCaminhoArq.DataSource := dsMovArqPendente;
    End;

  If pcGeraArquivoOper.ActivePage = tbsGAGerados Then
    Begin
      dbNomeConvenioSel.DataSource := dsMovArqGerado;
      dbeCaminhoArq.DataSource := dsMovArqGerado;
    End;

  If pcGeraArquivoOper.ActivePage = tbsGACancelados Then
    dbNomeConvenioSel.DataSource := dsMovArqCancelado;
End;

Procedure TFrmRemessaEletronicaDeb.dblkpConvenioEnter(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio.Selected;
End;

Procedure TFrmRemessaEletronicaDeb.rdgTipoTituloClick(Sender: TObject);
Begin
  Inherited;
  If rdgTipoTitulo.itemindex = 0 Then // Ficha de Compensação
    qryMovTitulosNUMCODBARRAS.EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
  Else // Arrecadação
    qryMovTitulosNUMCODBARRAS.EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

  If qryMovTitulos.state <> dsBrowse Then
    Begin
      dbeCodigoBarrasTitulos.Setfocus;
      dbeCodigoBarrasTitulos.SelectAll;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dblkpConvenio2Click(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio2.DropDown;
End;

Procedure TFrmRemessaEletronicaDeb.dblkpConvenioClick(Sender: TObject);
Begin
  Inherited;
  dblkpConvenio.DropDown;
End;

Procedure TFrmRemessaEletronicaDeb.dblkpFormaPagtoClick(Sender: TObject);
Begin
  Inherited;
  dblkpFormaPagto.DropDown;
End;



Procedure TFrmRemessaEletronicaDeb.dbgMovArqGeradoPendDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqPendente.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqPendente.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqGeradoPend.Canvas.Font.Color := clRed;

      dbgMovArqGeradoPend.DefaultDrawDataCell(Rect, Field, State);
    End;
End;


Procedure TFrmRemessaEletronicaDeb.dbgMovArqGeradoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqGerado.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqGerado.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqGerado.Canvas.Font.Color := clRed;

      dbgMovArqGerado.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovTitulosRowChanged(Sender: TObject);
Begin
  Inherited;
  If qryMovTitulos.State = dsBrowse Then
    Begin
      If qryMovTitulosFLGTIPOCODBARRAS.asString = 'F' Then // Ficha de Compensação
        rdgTipoTitulo.itemindex := 0
      Else If qryMovTitulosFLGTIPOCODBARRAS.asString = 'A' Then // Arrecadação
        rdgTipoTitulo.itemindex := 1;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.DbeCodigoBarrasGeralExit(Sender: TObject);
Begin
  Inherited;
  If (DbeCodigoBarrasGeral.text <> EmptyStr) And (length(trim(DbeCodigoBarrasGeral.text)) >= 47) Then
    Begin
      If rdgTipoTituloGeral.Itemindex = 0 Then // Ficha de Compensação
        Begin
          If copy(DbeCodigoBarrasGeral.text, 34, 1) <> '0' Then
            edDtVenctoGeral.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(DbeCodigoBarrasGeral.text))
          Else
            edDtVenctoGeral.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);
        End
      Else // Arrecadação
        edDtVenctoGeral.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);

      edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(DbeCodigoBarrasGeral.text);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dbeValorPagtoExit(Sender: TObject);
Begin
  Inherited;
  qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := EmptyStr;
  qryMovTitulos.fieldbyname('NUMDOCUMENTO').Clear;
  If qryMovTitulos.FieldByName('VLRPAGTO').AsFloat >= dVlrObrigaNumDocTit Then
    Begin
      qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString := cdsMovRemessa.fieldbyname('NUMDOCUMENTO').asString;
      If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 11 Then
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '999.999.999\-99;0;_'
      Else If length(qryMovTitulos.fieldbyname('NUMDOCUMENTO').asString) = 14 Then
//        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '99.999.999\/9999\-99;0;_'
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := 'AA.AAA.AAA\/AAAA\-99;0;_'    // Paulo Nobre - WO33342
      Else
        qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := EmptyStr;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovRemessaTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
  Inherited;
  Try
    If (Not cdsMovRemessa.Active) Or (cdsMovRemessa.IsEmpty) Or
      ((AFieldName <> 'NUM_AP') And
      (AFieldName <> 'NUMDOCUMENTO') And
      (AFieldName <> 'RAZAOSOCIAL') And
      (AFieldName <> 'FORMA_PAGTO')) Then
      Exit;

    If (Trim(cdsMovRemessa.IndexName) = Trim('asc' + AFieldName)) Then
      cdsMovRemessa.IndexName := 'desc' + AFieldName
    Else
      cdsMovRemessa.IndexName := 'asc' + AFieldName;
  Finally
    cdsMovRemessa.First;
  End;
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovRemessaCalcTitleImage(Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
  Inherited;
  If (Field.FieldName = 'NUM_AP') Or
    (Field.FieldName = 'NUMDOCUMENTO') Or
    (Field.FieldName = 'RAZAOSOCIAL') Or
    (Field.FieldName = 'FORMA_PAGTO') Then
    Begin
      TitleImageAttributes.Alignment := taLeftJustify;
      TitleImageAttributes.ImageIndex := 19;
      If cdsMovRemessa.IndexName = Trim('asc' + Field.FieldName) Then
        TitleImageAttributes.ImageIndex := 20;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.SpeedButton1Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqFinalizado.isEmpty Then
    Begin
      qeMovFinalizado.FileName := sPathArquivosLog + '\ARQFINALIZADO_MOVIMENTO.XLS';
      qeMovFinalizado.Execute;
      cdsMovArqFinalizado.First;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbLocalizaArqRetClick(Sender: TObject);
Var tArquivo: TextFile;
  iIniCampo, iTamCampo: Array[0..6] Of Integer;
  sLinha, sNSA, sDescMomento, sSegmento, sCodReg, sNumAutenticacao, sCodDocArq, sDataEfet, sValorEfet, sOcorrencias: String;
  dValor, dTotalLista: Double;
  iCodArqPagto: Integer;
Begin
  Inherited;

  {if UpperCase(ret[cmbArqRetorno.ItemIndex].NomeArq) <> EmptyStr then
  begin
    iCodArqPagto := ret[cmbArqRetorno.ItemIndex].IdArquivoPagto;

    try
      if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

      iIniCampo[0] := 1; iTamCampo[0] := 1; // Código do Registro
      iIniCampo[5] := 68; iTamCampo[5] := 2; // Ocorrências do Retorno

      dTotalLista := 0.00;
      sNSA := EmptyStr;
      sCodDocArq := EmptyStr;
      Cursor := crSQLWait;

      if oRemessaEletronica.Impersonate then
      begin
        // Processando o arquivo
        AssignFile(tArquivo, ret[cmbArqRetorno.ItemIndex].NomeArq);
        Reset(tArquivo);

        while not EOF(tArquivo) do
        begin
          sDataEfet := EmptyStr;
          sValorEfet := '0.00';
          sOcorrencias := EmptyStr;
          sNumAutenticacao := EmptyStr;

          // Lendo linha dos dados
          Readln(tArquivo, sLinha);

          // Código do Registro
          sCodReg := Copy(sLinha, iIniCampo[0], iTamCampo[0]);

          // Se for o Cabeçalho do Arquivo, então pega o NSA
          if sCodReg = 'A' then
          begin
            //O NSA recuperado será inserido na tabela ARQUIVOPAGTO, para identicar o NSA do retorno.
            sNSA := inttostr(strtoint(Copy(sLinha, 74, 6))); // NSA

            // Pegando o IDARQUIVOPAGTO para atualizar a Grid dos Retornos
          end;

          // Só processa se forem linhas de Movimento tipo = '3'
          if (sCodReg = 'F') Then
          begin
            iIniCampo[2] := 2; iTamCampo[2] := 25; // Número do Documento da Empresa
            iIniCampo[3] := 45; iTamCampo[3] := 8; // Data da Efetivação
            iIniCampo[4] := 53; iTamCampo[4] := 15; // Valor Real Efetivado

            // Número do Documento da Empresa (CODDOCARQ)
            sCodDocArq := trim(inttostr(strtoint(trim(Copy(sLinha, iIniCampo[2], iTamCampo[2])))));

            // Data da Efetivação
            if strtoint(Copy(sLinha, iIniCampo[3], iTamCampo[3])) <> 0 then
              sDataEfet := quotedstr(ColocaBarra(Copy(sLinha, iIniCampo[3], iTamCampo[3])));

            // Valor Real Efetivado
            if strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4])) <> 0 then
              sValorEfet := TrocaCaracter(floattostr((strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4]))) / 100), ',', '.');

            // Ocorrências do Retorno
            sOcorrencias := quotedstr(trim(Copy(sLinha, iIniCampo[5], iTamCampo[5])));

            if (sCodDocArq <> EmptyStr) then // Número do Documento da Empresa
            begin
              // Atualizar a tabela com os dados do retorno
              qryAux2.Close;
              qryAux2.SQL.Clear;
              qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM            ');
              qryAux2.SQL.add('SET                             ');

              if (sDataEfet <> EmptyStr) then // Data da Efetivação
                qryAux2.SQL.add('DATA_EFETIVACAO = ' + sDataEfet)
              else
                qryAux2.SQL.add('DATA_EFETIVACAO = NULL        ');

              if (sValorEfet <> EmptyStr) then // Valor Real Efetivado
                qryAux2.SQL.add(', VALOR_EFETIVADO = ' + sValorEfet)
              else
                qryAux2.SQL.add(', VALOR_EFETIVADO = 0.00      ');

              qryAux2.SQL.add(', OCORRENCIA_RET = ' + sOcorrencias);
              qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
              qryAux2.ExecSQL;
              //
            end;
          end;

        end;
      end;
      RevertToSelf;

      // Finalizando o Lançamento
      qryAux2.Close;
      qryAux2.SQL.Clear;
      qryAux2.SQL.add('UPDATE ARQUIVOPAGTO            ');
      qryAux2.SQL.add('SET DTFINALIZAARQTXT = SYSDATE ');
      qryAux2.SQL.add(', USUFINALIZAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
      qryAux2.SQL.add(', FLGENVIADO = ''F''           '); // Finalizado
      //Gravando o NSA do retorno....
      qryAux2.SQL.Add(', NSARET = ' + sNSA);
      qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + inttostr(iCodArqPagto));
      qryAux2.ExecSQL;

      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

      qryAux1.Close;
      qryAux2.Close;
      Cursor := crDefault;
      CloseFile(tArquivo);
    except
      begin
        CloseFile(tArquivo);
        Cursor := crDefault;
        Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
        Raise;
      end;
    end;

    qryMovRetorno.DisableControls;
    qryMovRetorno.Close;
    qryMovRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
    qryMovRetorno.SQL.SaveToFile(sPathArquivosLog + '\SQL_SelMovRetorno.txt');
    qryMovRetorno.Open;

    if not qryMovRetorno.IsEmpty then
    begin
      qryTotaisRetorno.Close;
      qryTotaisRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
      qryTotaisRetorno.Open;
    end
    else
      Application.MessageBox(MSG031, 'Atenção !', Mb_IconExclamation);

    qryMovRetorno.EnableControls;
  end;  }
    qryMovRetorno.DisableControls;
    qryMovRetorno.Close;
    qryMovRetorno.ParamByName('DATAEFETIVACAO').AsDate := dtpDataRetorno.Date;
    qryMovRetorno.ParamByName('CODPORTFORMA').AsInteger := cdsConvenio.FieldByName('CODPORTFORMA').asInteger;
    qryMovRetorno.SQL.SaveToFile(sPathArquivosLog + '\SQL_SelMovRetorno.txt');
    qryMovRetorno.Open;

    if not qryMovRetorno.IsEmpty then
    begin
      qryTotaisRetorno.Close;
      qryTotaisRetorno.ParamByName('DATAEFETIVACAO').AsDate := dtpDataRetorno.Date;
      qryTotaisRetorno.ParamByName('CODPORTFORMA').AsInteger := cdsConvenio.FieldByName('CODPORTFORMA').asInteger;
      qryTotaisRetorno.Open;
    end
    else
      Application.MessageBox(MSG031, 'Atenção !', Mb_IconExclamation);

    qryMovRetorno.EnableControls;

end;

Procedure TFrmRemessaEletronicaDeb.dbgMovRetornoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  If (Not qryMovRetorno.isEmpty) Then
    Begin
      If (field.FieldName = 'DESC_OCORRENCIA') Then
        If trim(qryMovRetorno.fieldbyname('TEVE_OCORRENCIA').asString) = 'SIM' Then
          dbgMovRetorno.Canvas.Font.Color := clRed;

      If field.FieldName = 'STATUS' Then
        If qryMovRetorno.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovRetorno.Canvas.Font.Color := clRed;

      dbgMovRetorno.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.SpeedButton2Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovArqPendente.isEmpty Then
    Begin
      qeMovArqPend.FileName := sPathArquivosLog + '\ARQPENDENTE_MOVIMENTO.XLS';
      qeMovArqPend.Execute;
      cdsMovArqPendente.First;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.SpeedButton9Click(Sender: TObject);
Begin
  Inherited;
  If Not qryMovRetorno.isEmpty Then
    Begin
      qeMovArqRet.FileName := sPathArquivosLog + '\ARQRETORNO_MOVIMENTO.XLS';
      qeMovArqRet.Execute;
      qryMovRetorno.First;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovArqFinalizadoDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqFinalizado.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqFinalizado.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqFinalizado.Canvas.Font.Color := clRed;

      dbgMovArqFinalizado.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.dbgMovArqCanceladoDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  Inherited;
  If (Not cdsMovArqCancelado.isEmpty) Then
    Begin
      If field.FieldName = 'STATUS' Then
        If cdsMovArqCancelado.fieldbyname('STATUS').asString = 'Baixado' Then
          dbgMovArqCancelado.Canvas.Font.Color := clRed;

      dbgMovArqCancelado.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbImpMovArqRetornoClick(Sender: TObject);
Begin
  Inherited;
  If (Not qryMovRetorno.isEmpty) Then
    Begin
      If CmpDadosParaImpRetorno.Execute Then
        Begin
          Screen.Cursor := crSQLWait;
          qryEmpresa.Close;
          qryEmpresa.Open;
          qryBancoFUNCEF.Close;
          qryBancoFUNCEF.Open;

          If CmpDadosParaImpRetorno.ParamValues[0].AsInteger <> 0 Then // Com ou Sem Ocorrências
            Begin
              qryMovRetorno.Filtered := False;
              If CmpDadosParaImpRetorno.ParamValues[0].AsInteger = 1 Then // Com Ocorrências
                qryMovRetorno.Filter := 'TEVE_OCORRENCIA = ''SIM'' '
              Else // Sem Ocorrências
                qryMovRetorno.Filter := 'TEVE_OCORRENCIA = ''NÃO'' ';
              qryMovRetorno.Filtered := True;
            End;

          TfrmPreview.CreateModalPreview(Application, rptMovArqRetorno, rptMovArqRetorno.PrinterSetup.DocumentName);
          qryMovRetorno.Filtered := False;
          qryMovRetorno.First;
          qryEmpresa.Close;
          qryBancoFUNCEF.Close;
          Screen.Cursor := crDefault;
        End;
    End
  Else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronicaDeb.ppGroupHeaderBand2BeforePrint(Sender: TObject);
Begin
  Inherited;
  If trim(qryMovRetorno.fieldbyname('TEVE_OCORRENCIA').asString) = 'SIM' Then
    pplblSit.Caption := 'Lançamentos COM Ocorrência(s):'
  Else
    pplblSit.Caption := 'Lançamentos SEM Ocorrência(s):';
End;

Procedure TFrmRemessaEletronicaDeb.spbExportaListaClick(Sender: TObject);
Begin
  Inherited;
  If Not qryMovListaFavorecidos.isEmpty Then
    Begin
      qeListaFavorecidos.FileName := sPathArquivosLog + '\REMESSA_LISTAFAVOREC.CSV';
      qeListaFavorecidos.Execute;
      qryMovListaFavorecidos.First;
    End;
End;

Procedure TFrmRemessaEletronicaDeb.spbRegerarArqClick(Sender: TObject);
var
  sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC: String;
  sNomeCompletoArquivoRemessaServidor: string; //Cássio Rovaroto - SIG nº 102320
  sNomeCompletoArquivoSeguranca: string; //Everson Cunha - SIG111426
begin
  inherited;
  if (Not cdsMovArqGerado.isEmpty) And (Not qryMovArqGeradoDet.isEmpty) Then
  begin
    if not cdsMovArqGerado.FieldByName('PATHARQUIVOREM').IsNull then
    begin
      if Application.MessageBox(pchar('Regerar Arquivo de Envio Nº ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
      begin
        sNomeArquivoGerado := cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;

        //Cássio Rovaroto - SIG nº 102320 - Início
        sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;

        if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessa)) then
            ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessa));

        if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then   //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
        begin
          sNomeCompletoArquivoRemessaServidor := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;  //Cássio Rovaroto - SIG nº 101591
          sNomeCompletoArquivoSeguranca := cdsMovArqGerado.fieldbyname('PATHARQUIVOSEGURANCA').asString + '\' + sNomeArquivoGerado;
          sNomeCompletoBackup := cdsMovArqGerado.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
        end
        else
        begin
          sNomeCompletoArquivoRemessaServidor := sNomeCompletoArquivoRemessa;
          sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivoGerado;
        end;

        if FileExists(sNomeCompletoArquivoRemessaServidor) or FileExists(sNomeCompletoArquivoSeguranca) then
        begin
          Application.MessageBox(pchar('O Arquivo Nº ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString + ' já foi transmitido ao Banco !' + #13 + #13 +
          'Não será possível gerá-lo novamente pois ocasionará duplicidade nos débitos !' ), 'Atenção !', MB_ICONEXCLAMATION);
          exit;
        end;

        if FileExists(sNomeCompletoArquivoRemessa) then
            DeleteFile(sNomeCompletoArquivoRemessa);
        //Cássio Rovaroto - SIG nº 102320 - Fim

        //Cássio Rovaroto - SIG nº 102320 - Início
        if Copy(UpperCase(Sistema.AliasServidor),1,8) <> 'PRODUCAO' then    //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
              Application.MessageBox(pchar('Em bases de testes, os arquivos são gravados em ' + ExtractFileDir(sNomeCompletoArquivoRemessa)), 'Atenção !', MB_ICONEXCLAMATION + MB_OK);
		    //Cássio Rovaroto - SIG nº 102320 - Fim

        Screen.Cursor := crSQLWait;

        // Montando o nome do Arquivo
        qryAux1.Close;
        qryAux1.SQL.Clear;
        qryAux1.SQL.add('SELECT ''DEB.'' || TO_CHAR(SYSDATE, ''YYYYMMDD.'') || TRIM(PO.NUMEMPRESABANCO) || ''.'' || LPAD(:pIDARQUIVOPAGTO, 6, ''0'') || ''.rem'' AS NOME_ARQ_REM ');
        qryAux1.SQL.add('FROM PORTADORFORMA PO   ');
        qryAux1.SQL.add('WHERE PO.CODPORTFORMA =:pCODPORTFORMA ');
        qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := cdsMovArqGerado.FieldByName('NSA').asString;
        qryAux1.ParamByName('pCODPORTFORMA').AsString := cdsMovArqGerado.FieldByName('CODPORTFORMA').asString;
        qryAux1.Open;
        sNomeArquivoGerado := qryAux1.FieldByName('NOME_ARQ_REM').asString;

        sNomeCompletoArquivoRemessa := ExtractFileDir(sNomeCompletoArquivoRemessa) + '\' + sNomeArquivoGerado;
        sNomeCompletoArquivoRemessaServidor := ExtractFileDir(sNomeCompletoArquivoRemessaServidor) + '\' + sNomeArquivoGerado;
        sNomeCompletoBackup := ExtractFileDir(sNomeCompletoBackup) + '\' + sNomeArquivoGerado;

        // ROTINAS PARA GERAR O ARQUIVO (_GerarArquivo)
        if oRemessaEletronica._CriaArquivo(sNomeCompletoArquivoRemessa) then
        begin
          try
            if not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;

            cdsMovArqGerado.DisableControls;

            oRemessaEletronica._GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                                                     cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString,
                                                     cdsMovArqGerado.FieldByName('CODPORTFORMA').asString,
                                                     cdsMovArqGerado.FieldByName('NSA').asString, // Número Sequencial do Arquivo
                                                     '0'); // 0 - Débito / 1 - Cancelamento de débito

            // Atualizando o Movimento
            qryAux2.Close;
            qryAux2.SQL.Clear;
            qryAux2.SQL.add('UPDATE ARQUIVOPAGTO                                         ');
            qryAux2.SQL.add('SET DTGERACAOARQTXT = SYSDATE                               ');
            qryAux2.SQL.add(', USUGERACAOARQTXT = ' + quotedstr(Sistema.NomeUsuario)     );
            qryAux2.SQL.add(', NOMEARQTXT = ' + quotedstr(sNomeArquivoGerado)            );
            qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString);
            qryAux2.ExecSQL;

            if dtmBaseDados.dbBaseDados.InTransaction then //Everson Cunha - SIG103725 - SIACC
              dtmBaseDados.dbBaseDados.Commit;             //Everson Cunha - SIG103725 - SIACC

            //Cássio Rovaroto - SIG nº 102320 - Início
            if oRemessaEletronica.Impersonate then
            begin
              if not DirectoryExists(ExtractFileDir(sNomeCompletoBackup)) then
                ForceDirectories(ExtractFileDir(sNomeCompletoBackup));

              //Copiando o arquivo do diretório de remessa para o de backup
              CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoBackup), False);

              if (Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO') then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
              begin
                if not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) then
                  ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));

                 // Copiando o arquivo do diretório de remessa para PRODUCAO
                 CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);

                 if FileExists(sNomeCompletoArquivoRemessa) Then
                  DeleteFile(pChar(sNomeCompletoArquivoRemessa));
              end;
              RevertToSelf;
            end;
            //Cássio Rovaroto - SIG nº 102320 - Fim

            Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString + ' -> ' + sNomeArquivoGerado + ' <- Gerado com Sucesso !'), 'Atenção !', Mb_IconExclamation);
            cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivo(dblkpConvenio2.LookupValue, 'S');

            qryMovArqGeradoDet.Close;
            qryMovArqGeradoDet.Open;

			      //Everson Cunha - SIG103935 - SIACC - Ini
            qryMovArqGeradoDet.AfterScroll := qryMovArqGeradoDetAfterScroll;
            qryMovArqGeradoDetAfterScroll(qryMovArqGeradoDet);
			      //Everson Cunha - SIG103935 - SIACC - Fim

            qryAux.Close;
            qryAux1.Close;
            qryAux2.Close;
            Screen.Cursor := crDefault;
            cdsMovArqGerado.EnableControls;
          except
            on E: Exception do
            begin
              if dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.RollBack;

              Screen.Cursor := crDefault;
              cdsMovArqGerado.EnableControls;
              Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
            end;
          end
        end
        else
          Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').asString + ' Não Gerado. Verifique !'), 'Atenção !', Mb_IconExclamation);

        Screen.Cursor := crDefault;
      end
    end
    else
      Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
  end
  else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
end;

Procedure TFrmRemessaEletronicaDeb.DblCodFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  If sFormaPagtoAnt <> DblCodForma.LookupValue Then
    bAltFormPagto := True;
End;

Procedure TFrmRemessaEletronicaDeb.DblCodFormaEnter(Sender: TObject);
Begin
  Inherited;
  sFormaPagtoAnt := DblCodForma.LookupValue;
End;

procedure TFrmRemessaEletronicaDeb.dbLkpConvenioRetClick(Sender: TObject);
begin
  inherited;
  dbLkpConvenioRet.DropDown;
end;

procedure TFrmRemessaEletronicaDeb._RegistraTarifaBancaria(
  pIdArquivoPagto: Integer);
var
  sSQL: string;
begin
  sSQL := ' SELECT AD.IDARQUIVOPAGTO, NVL(DP.CODDOCUMENTO, AD.ID_DOC_CODBARRAS_PESSOAS) AS CODLINHA   ' +#13#10+
          '   FROM ARQUIVOXDOCUM AD                                                                   ' +#13#10+
          '   LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AD.ID_DOC_CODBARRAS_PESSOAS  ' +#13#10+
          '  WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto)                                    +#13#10+
          '  GROUP BY AD.IDARQUIVOPAGTO, NVL(DP.CODDOCUMENTO, AD.ID_DOC_CODBARRAS_PESSOAS)            ';

  qryAux1.Close;
  qryAux1.SQL.Clear;
  qryAux1.SQL.Add(sSQL);
  qryAux1.Open;

  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    qryAux1.First;
    iContador := 0;
    frmProgresso.MostraFormProgresso('Aguarde, gerando os valores das tarifas bancárias...', True, False, True, 0, qryAux1.RecordCount);
    while not qryAux1.Eof do
    begin
        _SetTarifaBancaria(pIdArquivoPagto, qryAux1.FieldByName('CODLINHA').asInteger);
        qryAux1.Next;
        oRemessaEletronica._AtualizaFrmProgresso(iContador);
    end;

  except
    on e: Exception do
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

      Application.MessageBox(pChar(e.Message), 'Atenção!', MB_ICONEXCLAMATION);
    end;
  end;
  frmProgresso.EscondeFormProgresso;
end;

procedure TFrmRemessaEletronicaDeb._SetTarifaBancaria(pIdArquivoPagto,
  pCodDocumento: Integer);
var
  sSQL : string;
begin
  sSQL := 'INSERT INTO TARIFAARQPAGTO(IDTARIFAARQPAGTO, IDARQUIVOPAGTO, CODDOCARQ, IDPLANOPREV, IDPATRO, PERCENTUAL) ' +#13#10+
          '       SELECT SEQTARIFAARQPAGTO.NEXTVAL,                                                                  ' +#13#10+
          '              AD.IDARQUIVOPAGTO,                                                                          ' +#13#10+
          '              AD.CODDOCARQ,                                                                               ' +#13#10+
          '              AR.IDPLANOPREV,                                                                             ' +#13#10+
          '              AR.IDPATRO,                                                                                 ' +#13#10+
          '              AR.VALOR                                                                                    ' +#13#10+
          '         FROM ARQUIVOXDOCUM AD                                                                            ' +#13#10+
          '         LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AD.ID_DOC_CODBARRAS_PESSOAS           ' +#13#10+
          '         JOIN (SELECT R.CODDOCUMENTO, (SUM(R.VALOR) / RT.VALOR) AS VALOR, R.IDPLANOPREV, R.IDPATRO        ' +#13#10+
          '                 FROM RATEIODOCUM R                                                                       ' +#13#10+
          '                 JOIN (SELECT CODDOCUMENTO, SUM(VALOR) AS VALOR                                           ' +#13#10+
          '                         FROM RATEIODOCUM                                                                 ' +#13#10+
          '                        GROUP BY CODDOCUMENTO) RT                                                         ' +#13#10+
          '                   ON RT.CODDOCUMENTO = R.CODDOCUMENTO                                                    ' +#13#10+
          '                 WHERE R.CODDOCUMENTO = ' + IntToStr(pCodDocumento)                                         +#13#10+
          '                 GROUP BY R.CODDOCUMENTO, R.IDPLANOPREV, R.IDPATRO, RT.VALOR) AR                          ' +#13#10+
          '           ON (AR.CODDOCUMENTO = AD.ID_DOC_CODBARRAS_PESSOAS) OR (AR.CODDOCUMENTO = DP.CODDOCUMENTO)      ' +#13#10+
          '        WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto);

  qryAux3.Close;
  qryAux3.SQL.Clear;
  qryAux3.SQL.Add(sSQL);
  qryAux3.SQL.SaveToFile(sPathArquivosLog + '\SQL_InsereTarifaBancoCar.txt');
  qryAux3.ExecSQL;
end;

//Everson Cunha - SIG103935 - SIACC - Ini
procedure TFrmRemessaEletronicaDeb.qryMovArqPendDetAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  stQtdPendDet.Caption := Format('%.4d', [qryMovArqPendDet.RecordCount]);
end;
//Everson Cunha - SIG103935 - SIACC - Fim

//Everson Cunha - SIG103935 - SIACC - Ini
procedure TFrmRemessaEletronicaDeb.qryMovArqGeradoDetAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  stQtdGeradosDet.Caption := Format('%.4d', [qryMovArqGeradoDet.RecordCount]);
end;
//Everson Cunha - SIG103935 - SIACC - Fim

//Everson Cunha - SIG103935 - SIACC - Ini
procedure TFrmRemessaEletronicaDeb.qryMovArqFinalDetAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  stQtdFinalizadosDet.Caption := Format('%.4d', [qryMovArqFinalDet.RecordCount]);
end;
//Everson Cunha - SIG103935 - SIACC - Fim

//Everson Cunha - SIG103935 - SIACC - Ini
procedure TFrmRemessaEletronicaDeb.qryMovArqCancelDetAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  stQtdCanceladosDet.Caption := Format('%.4d', [qryMovArqCancelDet.RecordCount]);
end;
//Everson Cunha - SIG103935 - SIACC - Fim

procedure TFrmRemessaEletronicaDeb.btnAnalisarClick(Sender: TObject);
begin
  inherited;

  if not cdsMovRemessa.isEmpty Then
  begin
    cdsMovRemessa.first;

    if cdsMovRemessa.Locate('MARCADO', 'S', []) Then //Sim
    begin
      //Everson Cunha - SIG119696 - Ini
      Screen.Cursor := crSQLWait;
      cdsMovRemessa.Filtered := False;
      cdsMovRemessa.Filter := 'MARCADO = ''S'' '; // Sim
      cdsMovRemessa.Filtered := True;
      _TotalizaColunaGridMovRemessa('VALOR');
      cdsMovRemessa.First;

      qryContaBancaria.Close;
      qryContaBancaria.DataSource := dsDocumento;
      qryContaBancaria.Open;
      //Everson Cunha - SIG119696 - Fim

      bAnaliseFeita := True;
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde ! Analisando o Movimento...', True, False, True, 0, cdsMovRemessa.RecordCount);

      while not cdsMovRemessa.Eof do
      begin
        if cdsMovRemessa.FieldByName('MARCADO').AsString = 'S' Then //Sim
        begin
          sMSGErroAnalise := _AnaliseDoMovimento(cdsMovRemessa.FieldByName('CODFORMA').AsInteger);
          cdsMovRemessa.Edit;
          cdsMovRemessa.FieldByName('MSGERRO').AsString := copy(sMSGErroAnalise, 0, 250);
        end;

        cdsMovRemessa.Next;
        oRemessaEletronica._AtualizaFrmProgresso(iContador);
      End;

      //Everson Cunha - SIG119696 - Ini
      qryContaBancaria.Close;
      qryContaBancaria.DataSource := nil;

      cdsMovRemessa.Filtered := False;
      cdsMovRemessa.Filter := '';
      _TotalizaColunaGridMovRemessa('VALOR');
      //Everson Cunha - SIG119696 - Fim

      cdsMovRemessa.first;
      Screen.Cursor := crDefault;
      frmProgresso.EscondeFormProgresso;
    end
    else
      Application.MessageBox(MSG012, 'Atenção !', Mb_IconExclamation);
  end
  else
    Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
end;

End.

