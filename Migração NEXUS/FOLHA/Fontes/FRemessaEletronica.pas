//------------------------------- ALTERAÇÕES -----------------------------------------
// Rotina........: (dfm dsRelatorio, qryRelAdo, ppImpMovArqGerado)
// N. Chamado....: 38027
// Dt Alterações.: 08/05/2026
// Responsável...: Edilaine
// Descrição.....: Alterar a impressão para usar o componente ADO
//---------------------------------------------------------------------------------
// N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007069)
// Dt Alterações.: 13/11/2025
// Responsável...: Paulo Nobre
// Descrição.....: Ajuste no evento: rgTipoPagtoFolhaClick para permitir que os
//                 objetos sqlMovs (TCMSqlParam) estejam abertos na entrada e na
//                 seleção do Tipo de Pagamento = "Entidades" estava dando erro.
//---------------------------------------------------------------------------------
// N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007014)
// Dt.Alteração..: 30/10/2025
// Responsável...: Paulo Nobre
// Descrição.....: Ajustes da concatenação das colunas NSA nos objetos abaixo:
//                 .SqlMovArqPendente
//                 .SqlMovArqGerado
//                 .SqlMovArqCancelado
//                 .SqlMovArqFinalizado
//                 .qryMovRetorno
//                 .SqlMovArqPendDet
//                 .SqlMovArqGeradoDet
//                 .SqlMovArqFinalDet
//--------------------------------------------------------------------------------
// N. Chamado....: WO15743
// Dt Alterações.: 17/10/2024
// Responsável...: Paulo Nobre
// Descrição.....: .Diversos ajustes:
//                  . Mudando eventos de lugar
//                  . Após consulta dos convênios apresentar a combo em dropdown
//                  . Limpado a versão quando selecionado origem = entidades
//------------------------------------------------------------------------------------
// N. Chamado....: WO6194
// Dt Alterações.: 09/07/2024
// Responsável...: Paulo Nobre
// Descrição.....: .Nesta funcionalidade de remessa da folha de beneficios, a
//                  alimentação da tabela ARQUIVOPAGTO é feita na efetivação da folha.
//                 .Ajustes em várias rotinas para melhorar a performance geral
//                  . Troca de componentes query por cds;
//                  . Desabilitação do recurso de Monitoramento;
//                  . Ajuste na função que seleciona as folhas para trazer somente as
//                    que tem convênios;
//------------------------------------------------------------------------------------
// N. SIG.............: 132207
// Data da Alteração..: 19/06/2023
// Responsável........: Marcos Lima
// Descrição..........: Forçar a criação de pasta para o evento spbRegerarArqClick()
//------------------------------------------------------------------------------
// N. SIG.............: 117008
// Data da Alteração..: 01/07/2021
// Responsável........: Everson Cunha
// Descrição..........: Melhoria na rotina "ExlcuiFavorecidosNaoGerados"
//------------------------------------------------------------------------------
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//*********************************************************************************
//Rotina.............: spbGerarArqClick, spbRegerarArqClick, spbSelRemessaClick
//N. SIG.............: 114764
//Data da Alteração..: 06/04/2021
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da montagem de arquivos de remessa para o BANCO DO BRASIL.
//******************************************************************************
//Alteração  : Monitoramento e spbGerarArqClick
//Nº SIG.....: 102321
//Data.......: 15/09/2020
//Responsável: Andre Imakawa
//Descrição..: Criação da propriedade MAQUINA
//*********************************************************************************
//Rotina             : FormCreate, FormShow, spbSelRemessaClick, cdsMovRemessaAfterScroll,
//                     spbInverterSelClick, spbImportarMovListaClick, spbPrepararEnvioClick,
//                     spbCancelarMovArqGeradoClick
//N. SIG..........   : 60540
//Data da Alteração: :
//Alteração Form:    : FRemessaEletronica
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adequação da funcionalidade para utilização, também, no
//                     módulo Folha de Benefício.

//*********************************************************************************
//Rotina             : spbLocalizaArqRetClick, spbLocalizaArqRetClick, _AnaliseDoMovimento
//N. SIG..........   : 64071
//Data da Alteração: :
//Alteração Form:    : uCtrlRemessaEletronica
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adequação da funcionalidade para utilização, também, no
//                     módulo Empréstimo.
//*********************************************************************************
//Rotina             : spbGerarArqClick, spbCancelarMovArqGeradoClick, spbLocalizaArqRetClick,
//                     spbRegerarArqClick
//N. SOL..........   : 73883
//Data da Alteração  : 20/08/2018
//Alteração Form     : FrmRemessaEletronica
//Responsável        : Cássio Florencio Rovaroto
//Descrição          : Alteração atribuição do nome do arquivo de remessa, colocando
//                     o NSA no lugar do identificador do envio. Inclusão de rrotina
//                     gravação de arquivo no servidor.
//*********************************************************************************
//Rotina             : Diversas
//N. SOL..........   : 212845
//N. PPM..........   : 1129416
//Data da Alteração  : 01/03/2016
//Alteração Form     : FrmRemessaEletronica
//Responsável        : Paulo Nobre
//Descrição          : Desenvolvimento de nova funcionalidade - Remessa Eletrônica
//*********************************************************************************
Unit FRemessaEletronica;

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
   uCtrlParamIntegra, uCtrlRemessaEletronica, uFuncoesUteisIR, uCtrlPadroes,
   ppStrtch, ppMemo, ppModule, raCodMod, Spin,
   uCtrlDocumento, uCtrlFinanc,
   uCtrlFuncoesRH, wwriched, DBGrids, ppRichTx, Wwdotdot,
   Wwdbcomb, ADODB, uAutorizacao;

Const CorDaZebra = clBtnFace;                               // $00FDD2D0
Const iClientHeight = 728;                                  // Altura padrão do Form
Const iClientWidth = 1166;                                  // Largura padrão do Form

   // Mensagens Gerais
Const MSG001 = 'Obrigatório preencher o Convênio. Verifique !';
Const MSG002 = 'Obrigatório preencher a Data Inicial. Verifique !';
Const MSG003 = 'Obrigatório preencher a Data Final. Verifique !';
Const MSG004 = 'Data Inicial não pode ser superior a Data Final. Verifique !';
Const MSG005 = 'Confirma Exclusão dos Lançamentos Importados ?';
Const MSG006 = 'Favorecido não Informado. Verifique !';
Const MSG007 = 'Dados Bancários não Informados. Verifique !';
Const MSG008 = 'Valor do Pagamento não Informado. Verifique !';
Const MSG010 = 'Valor do Lançamento MAIOR que o Saldo do Documento. Verifique !';
Const MSG011 = 'Valor Total da Lista MAIOR que o Saldo do Documento. Verifique !';
Const MSG012 = 'Não há Lançamento(s) Marcado(s). Verifique !';
Const MSG013 = 'Tipo "Ficha de Compensação" com tamanho inválido. Verifique !';
Const MSG014 = 'Tipo "Arrecadação" com tamanho inválido. Verifique !';
Const MSG015 = 'Código de Barras ou Linha Digitável Inválido. Verifique !';
Const MSG016 = 'Data de Pagamento não Informada. Verifique !';
Const MSG017 = 'Não há Saldo Disponível para esta Operação. Verifique !';
Const MSG018 = 'Código de Barras/Linha Digitável não Informado. Verifique !';
Const MSG019 = 'Não há Movimento Disponível. Verifique !';
Const MSG020 = 'Não localizado Movimento para os critérios Selecionados. Verifique !';
Const MSG021 = 'Sem Lançamento para esta Operação. Verifique !';
Const MSG022 = 'O Convênio selecionado não possui diretório de destino Informado. Verifique !';
Const MSG023 = 'Problemas no Processamento do Arquivo !';
Const MSG024 = 'Não existe Movimento Importado para ser Excluído. Verifique !';
Const MSG025 = 'Movimento Importado Excluído com Sucesso !';
Const MSG026 = 'Não há Lançamento(s) ''Baixado(s)'' para Desfazer Baixa. Verifique !';
Const MSG027 = 'Esta Forma de Pagamento não permite a inclusão de Favorecidos. Verifique !';
Const MSG028 = 'Esta Forma de Pagamento não permite a inclusão de Títulos. Verifique !';
Const MSG029 = 'CPF/CNPJ Inválido. Verifique !';
Const MSG030 = 'Este Boleto não pode ser pago pela CAIXA. Verifique !';
Const MSG031 = 'Problemas no Processamento do Arquivo de Retorno. Verifique !';
Const MSG032 = 'Obrigatório preencher a Forma de Pagamento. Verifique !';
Const MSG033 = 'CPF/CNPJ do Favorecido não Informado. Verifique !';
Const MSG034 = 'Tipo da Conta não definida no Cadastro deste Favorecido. Verifique !';
   //Cássio Rovaroto - SIG nº 64071 - Início
Const MSG035 = 'Não há arquivos enviados para este convênio.';
Const MSG036 = 'Não foram encontados arquivos de retorno para este convênio.';
   //Cássio Rovaroto - SIG nº 64071 - Fim

// Mensagens de inconsistências da Análise do Movimento
Const AnMSG01 = 'Forma Pagto exige Lista de Favorecidos / ';
Const AnMSG02 = 'Valor Total da Lista de Favorecido tem que ser Igual ao da AP / ';
Const AnMSG03 = 'Forma Pagto exige Banco igual a CAIXA na Lista de Favorecidos / ';
Const AnMSG04 = 'Forma Pagto exige CPF/CNPJ na Lista de Favorecidos / ';
Const AnMSG05 = 'Forma Pagto exige Banco igual a CAIXA na aba Geral / ';
Const AnMSG06 = 'Forma Pagto exige CPF/CNPJ na AP / ';
Const AnMSG07 = 'Forma Pagto exige Banco diferente de CAIXA na aba Geral / ';
Const AnMSG08 = 'Forma Pagto exige Banco diferente de CAIXA na Lista de Favorecidos / ';
Const AnMSG09 = 'Forma Pagto exige Código de Barras na aba Geral / ';
Const AnMSG10 = 'Valor Total da Lista de Títulos tem que ser Igual ao da AP / ';
Const AnMSG11 = 'Tipo da Conta do Favorecido não definida no Cadastro / ';
Const AnMSG12 = 'Código de Barras, informado na aba Geral, não pode ser pago pela CAIXA / ';
Const AnMSG13 = 'Dados Bancários não Informados na aba Geral / ';
Const AnMSG14 = 'Código de Barras Inválido na aba Geral / ';
Const AnMSG15 = 'Código de Barras Inválido na Lista de Títulos / ';
Const AnMSG16 = 'Forma de Pagamento não Informada na aba Geral / ';
Const AnMSG17 = 'Número da AP não Informado no Documento / ';
Const AnMSG18 = 'Tipo da Conta do Favorecido não pode ser uma conta salário / ';

   //Cássio Rovaroto - SIG nº 64071 - Início
Type rgRetorno = Record
      IdArquivoPagto: Integer;
      NomeArq: String;
      NSA: integer;
   End;
   //Cássio Rovaroto - SIG nº 64071 - Fim

Type

   TFrmRemessaEletronica = Class(TfrmSairAjuda)
      pcGeralRemessa: TPageControl;
      tbsAnalise: TTabSheet;
      tbsGeraArquivo: TTabSheet;
      ListaDeImagens: TImageList;
      DevRptCM: TExtraOptions;
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
      qryAux2: TwwQuery;
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
      cdsMovArqPendente: TCMClientDataSet;
      SqlMovArqPendente: TCMSqlParams;
      cdsMovArqPendenteIDARQUIVOPAGTO: TFloatField;
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
      spbBaixarMovArqGerado: TSpeedButton;
      spbDesfazerBaixa2: TSpeedButton;
      spbDesfazerPrep: TSpeedButton;
      spbBaixarMovArqGeradoPend: TSpeedButton;
      spbDesfazerBaixa: TSpeedButton;
      spbImpMovArqGerado: TSpeedButton;
      spbAnalisar: TSpeedButton;
      spbPrepararEnvio: TSpeedButton;
      Label6: TLabel;
      Label19: TLabel;
      edDtVenctoGeral: TEdit;
      edValorGeral: TRealEdit;
      qryBancoFUNCEF: TwwQuery;
      dsBancoFUNCEF: TwwDataSource;
      qryBancoFUNCEFNUMBANCO: TStringField;
      qryBancoFUNCEFNUMAGENCIA: TStringField;
      qryBancoFUNCEFCONTACORRENTE: TStringField;
      qryBancoFUNCEFNOME_BANCO: TStringField;
      qryBancoFUNCEFNOME_AGENCIA: TStringField;
      ppBancoFUNCEF: TppBDEPipeline;
      spbGerarArq: TSpeedButton;
      Panel3: TPanel;
      Panel12: TPanel;
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
      cdsMovRemessaMSGERRO: TStringField;
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
      qryMovRetorno: TwwQuery;
      dsMovRetorno: TwwDataSource;
      spbLocalizaArqRet: TSpeedButton;
      Panel20: TPanel;
      spbBaixarMovRetorno: TSpeedButton;
      spbDesfazerBaixa3: TSpeedButton;
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
      stCaminhoRet: TStaticText;
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
      cdsMovArqPendenteDTFINALIZAARQTXT: TDateTimeField;
      cdsMovArqPendenteUSUFINALIZAARQTXT: TStringField;
      cdsMovArqPendentePATHARQUIVORET: TStringField;
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
      DBEdit6: TDBEdit;
      DBEdit7: TDBEdit;
      DBEdit8: TDBEdit;
      FMovArqRet: TwwFilterDialog;
      LMovArqRet: TwwLocateDialog;
      rptMovArqRetorno: TppReport;
      ppParameterList2: TppParameterList;
      ppMovArqRetorno: TppBDEPipeline;
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
      cdsMovRemessaIDHSTFOLHABENEF: TFloatField;
      Label25: TLabel;
      dbLkpConvenioRet: TwwDBLookupCombo;
      Label26: TLabel;
      Label27: TLabel;
      cmbArqRetorno: TComboBox;
      txtNSA: TStaticText;
      qryAux3: TwwQuery;
      cbbMesPagto: TComboBox;
      seAnoPagto: TSpinEdit;
      lblMesAnoPagto: TLabel;
      dblkpVersaoFolha: TwwDBLookupCombo;
      lblVersaoFolha: TLabel;
      cdsVersaoFolha: TCMClientDataSet;
      dsVersaoFolha: TDataSource;
      cdsConvenioFB: TCMClientDataSet;
      dsConvenioFB: TDataSource;
      rgTipoPagtoFolha: TRadioGroup;
      cdsMovArqPendDet: TCMClientDataSet;
      cdsMovArqPendDetNUM_AP: TFloatField;
      cdsMovArqPendDetNODOCUMENTO: TFloatField;
      cdsMovArqPendDetDATAPROGRAMADA: TDateTimeField;
      cdsMovArqPendDetDATAVENCTO: TDateTimeField;
      cdsMovArqPendDetVALOR: TFloatField;
      cdsMovArqPendDetCPF_CNPJ_MASC: TStringField;
      cdsMovArqPendDetRAZAOSOCIAL: TStringField;
      cdsMovArqPendDetNUM_BANCO: TStringField;
      cdsMovArqPendDetNUM_AGENCIA: TStringField;
      cdsMovArqPendDetNUM_CONTA: TStringField;
      cdsMovArqPendDetCOD_BARRAS_MASC: TStringField;
      cdsMovArqPendDetSTATUS: TStringField;
      cdsMovArqPendDetFLGPAGTOPIX: TStringField;
      cdsMovArqPendDetCODFORMA: TFloatField;
      cdsMovArqPendDetNSA: TStringField;
      cdsMovArqPendDetIDARQUIVOPAGTO: TFloatField;
      cdsMovArqPendDetHIST: TStringField;
      cdsMovArqPendDetUSUGERACAOARQTXT: TStringField;
      cdsMovArqPendDetCENT_RESPON: TStringField;
      dsMovArqPendDet: TwwDataSource;
      SqlMovArqPendDet: TCMSqlParams;
      cdsMovArqGeradoDet: TCMClientDataSet;
      FloatField4: TFloatField;
      FloatField14: TFloatField;
      DateTimeField2: TDateTimeField;
      cdsMovArqGeradoDetDATAVENCTO: TDateTimeField;
      FloatField15: TFloatField;
      StringField5: TStringField;
      StringField24: TStringField;
      StringField25: TStringField;
      StringField26: TStringField;
      StringField27: TStringField;
      StringField28: TStringField;
      StringField31: TStringField;
      StringField30: TStringField;
      FloatField16: TFloatField;
      StringField32: TStringField;
      FloatField17: TFloatField;
      StringField33: TStringField;
      StringField35: TStringField;
      StringField36: TStringField;
      dsMovArqGeradoDet: TwwDataSource;
      SqlMovArqGeradoDet: TCMSqlParams;
      cdsMovArqFinalDet: TCMClientDataSet;
      FloatField23: TFloatField;
      FloatField24: TFloatField;
      DateTimeField4: TDateTimeField;
      cdsMovArqFinalDetDATAVENCTO: TDateTimeField;
      FloatField25: TFloatField;
      StringField51: TStringField;
      StringField52: TStringField;
      StringField53: TStringField;
      StringField54: TStringField;
      StringField55: TStringField;
      StringField56: TStringField;
      StringField57: TStringField;
      StringField58: TStringField;
      StringField59: TStringField;
      FloatField26: TFloatField;
      StringField60: TStringField;
      FloatField27: TFloatField;
      StringField61: TStringField;
      StringField62: TStringField;
      StringField63: TStringField;
      StringField64: TStringField;
      dsMovArqFinalDet: TwwDataSource;
      SqlMovArqFinalDet: TCMSqlParams;
      cdsMovArqCancelDet: TCMClientDataSet;
      FloatField18: TFloatField;
      FloatField19: TFloatField;
      DateTimeField3: TDateTimeField;
      cdsMovArqCancelDetDATAVENCTO: TDateTimeField;
      FloatField20: TFloatField;
      StringField37: TStringField;
      StringField38: TStringField;
      StringField39: TStringField;
      StringField40: TStringField;
      StringField41: TStringField;
      StringField42: TStringField;
      StringField43: TStringField;
      StringField44: TStringField;
      StringField45: TStringField;
      FloatField21: TFloatField;
      StringField46: TStringField;
      FloatField22: TFloatField;
      StringField47: TStringField;
      StringField48: TStringField;
      StringField49: TStringField;
      StringField50: TStringField;
      dsMovArqCancelDet: TwwDataSource;
      SqlMovArqCancelDet: TCMSqlParams;
      spbSelMovArquivos: TSpeedButton;
      cdsMovArqGeradoIDHSTFOLHABENEF: TFloatField;
      cdsMovArqPendenteIDHSTFOLHABENEF: TFloatField;
      cdsMovArqPendenteCODPORTFORMA: TFloatField;
      cdsMovArqPendenteCONVENIO: TStringField;
      cdsMovArqGeradoCONVENIO: TStringField;
      cdsMovArqPendDetCODPORTFORMA: TFloatField;
      cdsMovArqPendDetFLGENVIADO: TStringField;
      cdsMovArqPendDetTRGDTINCLUSAO: TDateTimeField;
      cdsMovArqPendDetIDHSTFOLHABENEF: TFloatField;
      cdsMovArqGeradoDetCODPORTFORMA: TFloatField;
      cdsMovArqGeradoDetFLGENVIADO: TStringField;
      cdsMovArqGeradoDetTRGDTINCLUSAO: TDateTimeField;
      cdsMovArqGeradoDetIDHSTFOLHABENEF: TFloatField;
      DBNavigator4: TDBNavigator;
      DBNavigator1: TDBNavigator;
      cdsMovArqGeradoDetCONVENIO: TStringField;
      ppMovArqRetornoppField19: TppField;
      rptMovArqGerado: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppShape4: TppShape;
      ppDBImage1: TppDBImage;
      ppLabel7: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel13: TppLabel;
      ppLabel1: TppLabel;
      ppLabel5: TppLabel;
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
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppLabel26: TppLabel;
      ppDBText15: TppDBText;
      ppLabel27: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppShape7: TppShape;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppSummaryBand1: TppSummaryBand;
      ppDBCalc1: TppDBCalc;
      ppLabel2: TppLabel;
      ppShape1: TppShape;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppShape3: TppShape;
      ppLabel20: TppLabel;
      ppShape5: TppShape;
      ppLabel21: TppLabel;
      ppPageStyle1: TppPageStyle;
      raCodeModule1: TraCodeModule;
      ppParameterList1: TppParameterList;
      ppLabel17: TppLabel;
      ppDBText9: TppDBText;
    btnLimparFC: TSpeedButton;
    cdsMovArqPendenteNSA: TStringField;
    dsRelatorio: TDataSource;
    qryRelADO: TADOQuery;
      Procedure FormShow(Sender: TObject);
      Procedure spbAnalisarClick(Sender: TObject);
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
      Procedure pcGeraArquivoOperChange(Sender: TObject);
      Procedure dblkpConvenioEnter(Sender: TObject);
      Procedure rdgTipoTituloClick(Sender: TObject);
      Procedure dblkpConvenio2Click(Sender: TObject);
      Procedure dblkpConvenioClick(Sender: TObject);
      Procedure dblkpFormaPagtoClick(Sender: TObject);
      Procedure spbBaixarMovArqGeradoPendClick(Sender: TObject);
      Procedure dbgMovArqGeradoPendDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure spbBaixarMovArqGeradoClick(Sender: TObject);
      Procedure dbgMovArqGeradoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure dbgMovTitulosRowChanged(Sender: TObject);
      Procedure spbDesfazerBaixaClick(Sender: TObject);
      Procedure spbDesfazerBaixa2Click(Sender: TObject);
      Procedure DbeCodigoBarrasGeralExit(Sender: TObject);
      Procedure dbeValorPagtoExit(Sender: TObject);
      Procedure dbgMovRemessaTitleButtonClick(Sender: TObject; AFieldName: String);
      Procedure dbgMovRemessaCalcTitleImage(Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure spbLocalizaArqRetClick(Sender: TObject);
      Procedure dbgMovRetornoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure spbBaixarMovRetornoClick(Sender: TObject);
      Procedure spbDesfazerBaixa3Click(Sender: TObject);
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
      Procedure bbtnSairClick(Sender: TObject);
      Procedure dbLkpConvenioRetClick(Sender: TObject);
      Procedure dbLkpConvenioRetCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure cmbArqRetornoChange(Sender: TObject);
      Procedure seAnoPagtoExit(Sender: TObject);
      Procedure cbbMesPagtoChange(Sender: TObject);
      Procedure dblkpVersaoFolhaClick(Sender: TObject);
      Procedure dblkpVersaoFolhaNotInList(Sender: TObject;
         LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
      Procedure dblkpVersaoFolhaCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure rgTipoPagtoFolhaClick(Sender: TObject);
      Procedure Monitoramento(pRotina: String; ptipo: Integer; pErro: String = '');
      Procedure spbSelMovArquivosClick(Sender: TObject);
      procedure btnLimparFCClick(Sender: TObject);                               // Andre Imakawa - SIG 102321

   Private
      { Private declarations }
      //oCtrlBaixaDocumentos: TCtrlBaixaDocumentos;
      oCtrlFinanc: TCtrlFinanc;
      oCtrlFuncoesRH: TCtrlFuncoesRH;
      oRemessaEletronica: TCtrlRemessaEletronica;
      tsListaDeDocumentos: TStringList;

      //Cássio Rovaroto - SIG nº 60540 - Início
      iIdModuloAcesso: integer;
      iIdPlanoPrevAnt: Integer;
      sCaminhoRetorno: String;
      ret: Array Of rgRetorno;
      iInd: integer;                                        //Índice do vetor rgRetorno
      //Cássio Rovaroto - SIG nº 60540 - Fim

      Function _TotalizaColunaGridMovRemessa(pCampo: String): Double;
      Function _TotalizaColunaGridMovListaFavorecidos(pCampo: String; pDecimal: Integer): String;
      Function _TotalizaColunaGridMovTitulos(pCampo: String; pDecimal: Integer): String;
      Function _TemSaldoDisponivel(pSaldo: double): Boolean;
      Function _ProcessarBaixa(pTipoBaixa, pNomeConvenio, pIdArquivoPagto: String; pCodPortForma: Integer; pValor: Double): Boolean;
      Function _AnaliseDoMovimento(pCodForma: Integer): String;
      Function _ChamaFormDesfazerBaixa(pTipo: String): String;
      Function _AnaliseVerificaValorCampo(pQuery: TwwQuery; pCampo, pValorCampo, pTpSinal: String): Boolean;
      //Cássio Rovaroto - SIG nº 61677 - Início
      Procedure _GetFavorecidosAutomatico(pIdModuloAcesso: Integer; pConvenio, pFormaPagto: String; pDataIni, pDataFim: TDateTime; pCodDocumento: Integer = -1; pIdhstFolhaBenef: Integer = -1);
      Procedure _InsereDocumentoXPessoa(pNome, pDocumento, pBanco, pAgencia, pConta, pTipoConta, pOperacao: String; pValor: double;
         pCodDocumento: Integer = -1; pIdForCli: Integer = -1);
      Function _GetMovListaFavoritoFP: String;
      Function _GetMovListaFavoritoCP: String;
      Procedure ExibeCampos(iIdModulo: integer);
      //procedure ExlcuiFavorecidosNaoGerados;                        //Everson Cunha - SIG117008
      Procedure ExcluiFavorecidosNaoGerados(pCodDocumentos: String); //Everson Cunha - SIG117008
      Function _GetValorPlano(pIdPlanoPrev: Integer): Double;
      Procedure _RecuperaArquivosRetorno(pCaminhoRet, pNomeArquivo: String; pNSA, pIdArquivoPagto: Integer);
      Procedure _RegistraTarifaBancaria(pIdArquivoPagto, pIdModuloAcesso: Integer);
      Procedure _SetTarifaBancariaEmp(pIdArquivoPagto, pCodDocumento: Integer);
      Procedure _SetTarifaBancariaFB(pIdArquivoPagto, pCodDocumento: Integer);
      Procedure _SetTarifaBancariaCaP(pIdArquivoPagto, pCodDocumento: Integer);
      Procedure SelecionaVersaoFolha;
      Procedure SelecionaConvenio(pTipoFolhaPagto: integer; pPeriodo: String);

      //Cássio Rovaroto - SIG nº 61677 - Fim
   Public
      { Public declarations }
   End;

Var
   FrmRemessaEletronica: TFrmRemessaEletronica;
   sPathArquivosLog, sMSGErroAnalise, sDescRetMomento, sFormaPagtoAnt: String;
   iAno, iMes, iDia: Word;     // Paulo Nobre - WO6194
   sAnoMesPagto : string;      // Paulo Nobre - WO6194
   iContador: Integer;
   bAnaliseFeita, bAltFormPagto: Boolean;
   dValorTotalMovLista, dValorAntCampo, dValorTotalTitulos, dVlrObrigaNumDocTit: Double;

Implementation

Uses DBaseDados, USistema, UDatabase, uFormManager, FAguarde, FProgresso, FPreview,
   UMensErro, DDadosBancarios, uModulo;                     //, FExcluiEstornaBaixaLoteMT;

{$R *.DFM}

Procedure TFrmRemessaEletronica.FormCreate(Sender: TObject);
Begin
   Inherited;
   tsListaDeDocumentos := tStringList.create;

   //oCtrlBaixaDocumentos := TCtrlBaixaDocumentos.Create;
   //oCtrlBaixaDocumentos.InitiAlizeAs(Padroes);

   oCtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, True);
   oCtrlFInanc.InitiAlizeAs(Padroes);

   oRemessaEletronica := TCtrlRemessaEletronica.Create;
   oRemessaEletronica.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
      Sistema.AppRemoteServer, True, Nil, Nil, False);

   sPathArquivosLog := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogRemessaEletro';

   If Not DirectoryExists(sPathArquivosLog) Then
      ForceDirectories(sPathArquivosLog);

   // Ajustando a tela para o tamanho padrão definido nas constantes
   ClientHeight := iClientHeight;
   ClientWidth := iClientWidth;

   //Cássio Rovaroto - SIG nº 60540 - Início
   iIdModuloAcesso := Sistema.IdModulo;
   iInd := 0;
   //Cássio Rovaroto - SIG nº 60540 - Fim

End;

Procedure TFrmRemessaEletronica.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Inherited;
   FreeAndNil(tsListaDeDocumentos);
   //FreeAndNil(oCtrlBaixaDocumentos);
   FreeAndNil(oCtrlFinanc);
   FreeAndNil(oRemessaEletronica);
End;

Procedure TFrmRemessaEletronica.FormShow(Sender: TObject);
Begin
   Inherited;

   // Paulo Nobre - WO6194 - Inicio
   DecodeDate(date, iAno, iMes, iDia);

   // Inicializando a Data Inicial e Final da aba "Análise" sempre com o a data inicial e final de cada mês
   dbDataProgIni.Date := strtodate('01/' + strzero(2, inttostr(iMes)) + '/' + IntToStr(iAno));
   dbDataProgFim.Date := strtodate(IntToStr(TrazUltDiaMes(iMes, iAno)) + '/' + inttostr(iMes) + '/' + inttostr(iAno));

   cbbMesPagto.ItemIndex := iMes;

   seAnoPagto.MaxValue := StrToInt(FormatDateTime('yyyy', Now)) + 5;
   seAnoPagto.Value := StrToInt(FormatDateTime('yyyy', Now));
   seAnoPagto.MinValue := 1994;

   sAnoMesPagto := IntToStr(seAnoPagto.Value) + FormatFloat('00', cbbMesPagto.ItemIndex);

   pcGeraArquivoOper.ActivePage := tbsGAPendentes;

   pcGeralRemessa.Pages[0].TabVisible := False;             // Aba Analise
   pcGeralRemessa.Pages[2].TabVisible := False;             // Aba Retorno
   pcGeralRemessa.ActivePageIndex := 1;                     // Aba Arquivos
   pcGeraArquivoOper.Pages[2].TabVisible := False;          // Aba Finalizados
   pcGeraArquivoOper.Pages[3].TabVisible := False;          // Aba Cancelados

   // Abrindo os datasets

   frmAguarde.pbAguarde.Visible := false;
   frmAguarde.Mostra('Preparando Estruturas para a Remessa...');

   Screen.Cursor := crSQLWait;
   cdsConvenio.data := oRemessaEletronica._ListaConvenios;
   //   cdsTipoPagto.data := oRemessaEletronica._ListaFormaPagamentos;
   //   cdsTipoPagtoGeral.data := oRemessaEletronica._ListaFormaPagamentosGeral;
   //   dblkpFormaPagto.LookupValue := '-1';                     // Todas as formas de pagamento como default

   cdsMovArqPendente.Active := False;
   SqlMovArqPendente.Open;
   cdsMovArqPendDet.Active := False;
   SqlMovArqPendDet.Open;

   cdsMovArqGerado.Active := False;
   SqlMovArqGerado.Open;

   //edilaine WO38027 : inicio
   //cdsMovArqGeradoDet.Active := False;
   //SqlMovArqGeradoDet.Open;

   SqlMovArqGeradoDet.Sql.text := oRemessaEletronica._SqlSelecionaMovArqDetalheFB(-1, '', '', '-1', 'S');
   SqlMovArqGeradoDet.Open;
   //edilaine WO38027 : fim

   {   cdsMovArqFinalizado.Active := False;
      SqlMovArqFinalizado.Open;
      cdsMovArqFinalDet.Active := False;
      SqlMovArqFinalDet.Open;

      cdsMovArqCancelado.Active := False;
      SqlMovArqCancelado.Open;
      cdsMovArqCancelDet.Active := False;
      SqlMovArqCancelDet.Open;

      qryMovRetorno.Close;
      qryMovRetorno.Open;       }

   Screen.Cursor := crDefault;

   frmAguarde.pbAguarde.Visible := True;
   frmAguarde.Apaga;

   cbbMesPagto.SetFocus;
   ExibeCampos(iIdModuloAcesso);                            //Cássio Rovaroto - SIG nº 61677
   rgTipoPagtoFolhaClick(Sender);

   {   pcGeralRemessa.ActivePage := tbsAnalise;
      pcAnaliseRemessa.ActivePage := tbsAnaliseMovimento;
      pcDetalManut.ActivePage := tbsAnManGeral;

       cdsMovRemessa.Active := False;
       SQLMovRemessa.Open;
       qryDocumento.Close;
       qryDocumento.Open;
       qryMovListaFavorecidos.Close;
       qryMovListaFavorecidos.Open;
       qryContaBancaria.Close;
       qryContaBancaria.Open;
       qryMovTitulos.Close;
       qryMovTitulos.Open;
       qryCtaBancariaGeral.Close;
       qryCtaBancariaGeral.Open;

    //
  //  spbAnalisar.Enabled := ((Not cdsMovRemessa.isempty) And (pcGeralRemessa.activepage = tbsAnaliseMovimento));
  //  spbPrepararEnvio.Enabled := ((Not cdsMovRemessa.isempty) And (pcGeralRemessa.activepage = tbsAnaliseMovimento));

//   dbgMovRemessa.ColumnByName('VALOR').FooterValue := '0,00';
//   dbgMovListaFav.ColumnByName('VALOR').FooterValue := '0,00';
//   dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := '0,00';

   //   cdsMovRemessaAfterScroll(cdsMovRemessa);

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

      If tbsAnalise.Enabled Then
         dblkpConvenio.Setfocus;    }

      //Cássio Rovaroto - SIG nº 60540 - Início
   //   If iIdModuloAcesso = 18 Then
   //   Begin
{   dbgMovRemessa.Selected.Clear;
   dbgMovRemessa.Selected.add('MARCADO'#9'3'#9'S/N'#9'F');
   dbgMovRemessa.Selected.add('NUM_AP'#9'8'#9'Nº AP'#9'F');
   dbgMovRemessa.Selected.add('CODDOCUMENTO'#9'14'#9'Nº Documento'#9'F');
   dbgMovRemessa.Selected.add('VERSAO_FOLHA'#9'26'#9'Versão da Folha'#9'F');
   dbgMovRemessa.Selected.add('RAZAOSOCIAL'#9'36'#9'Nome do Favorecido'#9'F');
   dbgMovRemessa.Selected.add('FORMA_PAGTO'#9'20'#9'Forma de Pagamento'#9'F');
   dbgMovRemessa.Selected.add('DATAPROGRAMADA'#9'12'#9'Dt. Programada'#9'F');
   dbgMovRemessa.Selected.add('VALOR'#9'16'#9'Valor Documento'#9'F');
   dbgMovRemessa.Selected.add('MSGERRO'#9'250'#9'Resultado da Análise'#9'F');
   dbgMovRemessa.RedrawGrid;

   lblMesAnoPagto.Visible := True;
   lblMesAnoPagto.Left := Label17.Left;
   lblMesAnoPagto.Top := Label17.Top;
   cbbMesPagto.Left := dblkpConvenio.Left;
   cbbMesPagto.Top := dblkpConvenio.Top;
   seAnoPagto.Left := 137;
   seAnoPagto.Top := cbbMesPagto.Top;
   lblVersaoFolha.Top := lblMesAnoPagto.Top;
   lblVersaoFolha.Left := 210;
   dblkpVersaoFolha.Left := 210;
   dblkpVersaoFolha.Top := cbbMesPagto.Top;

   Label17.Left := 343;
   dblkpConvenio2.Left := Label17.Left;
   cdsConvenioFB.Data := oRemessaEletronica._GetConvenioFolha(-1);
   dblkpConvenio2.LookupTable := cdsConvenioFB;

   dbNomeConvenioSel.Left := 689;}

//   cbbMesPagto.Visible := True;
//   seAnoPagto.Visible := True;
//   lblVersaoFolha.Visible := True;
//   dblkpVersaoFolha.Visible := True;

   //   dbNomeConvenioSel.Visible := False;
    //   End;

 //  spbLocalizaArqRet.Caption := '&Recuperar';
   //Cássio Rovaroto - SIG nº 60540 - Fim

   // Paulo Nobre - WO6194 - Fim
End;

Function TFrmRemessaEletronica._TemSaldoDisponivel(pSaldo: double): Boolean;
Begin
   Result := True;
   If pSaldo = 0 Then
   Begin
      Application.MessageBox(MSG017, 'Atenção !', Mb_IconExclamation);
      Result := False;
   End;
End;

Function TFrmRemessaEletronica._TotalizaColunaGridMovRemessa(pCampo: String): Double;
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

Function TFrmRemessaEletronica._TotalizaColunaGridMovListaFavorecidos(pCampo: String; pDecimal: Integer): String;
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

Function TFrmRemessaEletronica._TotalizaColunaGridMovTitulos(pCampo: String; pDecimal: Integer): String;
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

Function TFrmRemessaEletronica._AnaliseVerificaValorCampo(pQuery: TwwQuery; pCampo, pValorCampo, pTpSinal: String): Boolean;
Begin
   Result := False;
   Screen.Cursor := crSQLWait;
   pQuery.First;
   While Not pQuery.EOF Do
   Begin
      If pTpSinal = '<>' Then                               // Diferente
         Result := (pQuery.Fieldbyname(pCampo).asString <> pValorCampo)
      Else                                                  // Igual
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

Function TFrmRemessaEletronica._AnaliseDoMovimento(pCodForma: Integer): String;
Begin
   Inherited;
   Result := EmptyStr;

   // Num da AP não informada no Documento
   If (CdsMovRemessa.fieldbyname('NUM_AP').isNull) Then
      Result := Result + AnMSG17;

   If pCodForma = 42 Then                                   // Credito Diversas C/C na CAIXA
   Begin
      // Obriga Lista de Favorecido
      If qryMovListaFavorecidos.isEmpty Then
         Result := Result + AnMSG01;

      // Obriga Lista de Favorecido ter o valor igual ao do Documento
      If (Not qryMovListaFavorecidos.isEmpty) And (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
         Result := Result + AnMSG02;

      // Obriga Lista de Favorecido ter todos os Bancos iguais a CAIXA (104)
      If (Not qryMovListaFavorecidos.isEmpty) And (Not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '=')) Then
         Result := Result + AnMSG03;

      // Obriga Lista de Favorecido ter o CPF/CNPJ Preenchido
      If (Not qryMovListaFavorecidos.isEmpty) And (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) Then
         Result := Result + AnMSG04;
   End
   Else If pCodForma = 10 Then                              // Crédito em C/C na CAIXA
   Begin
      If qryMovListaFavorecidos.isEmpty Then
      Begin
         // Obriga Cadastro Geral ter Dados Bancários preenchidos
         If (qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMAGENCIA').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMCONTA').isNull) Then
            Result := Result + AnMSG13;

         // Obriga Cadastro Geral ter o Banco igual a CAIXA (104)
         If (Not qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) And (qryCtaBancariaGeral.fieldbyname('NUMBANCO').asString <> '104') Then
            Result := Result + AnMSG05;

         // Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
         If CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull Then
            Result := Result + AnMSG06;

         // Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
         If (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '0') Then
            Result := Result + AnMSG11;

         If (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '2') Then
            Result := Result + AnMSG18;
      End
      Else
      Begin
         // Obriga Lista de Favorecido ter o valor igual ao do Documento
         If (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
            Result := Result + AnMSG02;

         // Obriga Lista de Favorecido ter todos os Bancos iguais a CAIXA (104)
         If (Not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '=')) Then
            Result := Result + AnMSG03;

         // Obriga Lista de Favorecido ter todos os CPF/CNPJ´s
         If (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) Then
            Result := Result + AnMSG04;
      End;
   End
   Else If pCodForma = 113 Then                             // Créditos Caixa e Docs Diversos
   Begin
      // Obriga Lista de Favorecido
      If qryMovListaFavorecidos.isEmpty Then
         Result := Result + AnMSG01;

      // Obriga Lista de Favorecido ter o valor igual ao do Documento
      If (Not qryMovListaFavorecidos.isEmpty) And (RoundCM(edSaldoListaFav.Value, 2) <> 0.00) Then
         Result := Result + AnMSG02;

      // Obriga Lista de Favorecido ter CPF/CNPJ Preenchido
      If (Not qryMovListaFavorecidos.isEmpty) And (_AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=')) Then
         Result := Result + AnMSG04;
   End
   Else If pCodForma In [20, 81] Then                       // DOC outros Bancos ou TED-Transf. Elet. Disponivel
   Begin
      If qryMovListaFavorecidos.isEmpty Then
      Begin
         // Obriga Cadastro Geral ter Dados Bancários preenchidos
         If (qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMAGENCIA').isNull) Or
            (qryCtaBancariaGeral.fieldbyname('NUMCONTA').isNull) Then
            Result := Result + AnMSG13;

         // Obriga Cadastro Geral ter o Banco diferente de CAIXA (104)
         If (Not qryCtaBancariaGeral.fieldbyname('NUMBANCO').isNull) And (qryCtaBancariaGeral.fieldbyname('NUMBANCO').asString = '104') Then
            Result := Result + AnMSG07;

         // Obriga Cadastro Geral ter o CPF/CNPJ Preenchido
         If CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull Then
            Result := Result + AnMSG06;

         // Obriga favorecido ter um tipo de conta = 1 ou 3 (Corrente ou Poupança)
         If (qryCtaBancariaGeral.fieldbyname('TIPOCONTA').asString = '0') Then
            Result := Result + AnMSG11;
      End
      Else
      Begin
         // Obriga Lista de Favorecido ter o valor igual ao do Documento
         If RoundCM(edSaldoListaFav.Value, 2) <> 0.00 Then
            Result := Result + AnMSG02;

         // Obriga Lista de Favorecido ter todos os Bancos diferente de CAIXA (104)
         If Not _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMBANCO', '104', '<>') Then
            Result := Result + AnMSG08;

         // Obriga Lista de Favorecido ter todos os CPF/CNPJ´s
         If _AnaliseVerificaValorCampo(qryMovListaFavorecidos, 'NUMDOCUMENTO', '', '=') Then
            Result := Result + AnMSG04;
      End;
   End
      // Ficha de Compensacao ou D.A.R ou G.E.F.I.P ou G.R.C.S ou Guia de Depósito Jud. ou Guia de Rec.do FGTS - GRFC
   Else If pCodForma In [11, 27, 32, 36, 47, 66] Then
   Begin
      If qryMovTitulos.isEmpty Then
      Begin
         // Obriga CPF/CNPJ quando o valor do documento for MAIOR que o valor
         // parametrizado no campo PORTFORMAXPARAMARQREM.VLR_OBRIGA_CPF_CNPJ
         If (RoundCM(dbrValorDocGeral.value, 2) >= dVlrObrigaNumDocTit) And // >= 250000
         (CdsMovRemessa.fieldbyname('NUMDOCUMENTO').isNull) Then
            Result := Result + AnMSG06;

         // Obriga Cadastro Geral ter o Código de Barras Preenchido
         If (qryDocumento.fieldbyname('NUMLEITCODBARRAS').isNull) Then
            Result := Result + AnMSG09
         Else
         Begin
            If (Length(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString) = 48) And // Títulos Arrecadação
            ((copy(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString, 2, 1) = '9') And // Segmento - Exclusivo do Banco
               (copy(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString, 17, 4) <> '0104')) Then // <> de Banco Caixa
               Result := Result + AnMSG12;

            // Código de Barras ou Linha Digitável Inválidos
            If (Not Length(qryDocumento.fieldbyname('NUMLEITCODBARRAS').asString) In [47, 48]) Then
               Result := Result + AnMSG14;
         End;
      End
      Else
      Begin
         // Obriga Lista de Titulos ter o valor igual ao do Documento
         If RoundCM(edSaldoTitulo.Value, 2) <> 0.00 Then
            Result := Result + AnMSG10;

         // Código de Barras ou Linha Digitável Inválidos
         If (Not Length(qryMovTitulos.fieldbyname('NUMCODBARRAS').asString) In [47, 48]) Then
            Result := Result + AnMSG15;
      End
   End
   Else
      Result := Result + AnMSG16
End;

Function TFrmRemessaEletronica._ProcessarBaixa(pTipoBaixa, pNomeConvenio, pIdArquivoPagto: String; pCodPortForma: Integer; pValor: Double): Boolean;
Var dDataDisp: TDateTime;
Begin
   result := False;
   {CmpDadosParaBaixaCAP.ParamValues[0].TextDefault := DateToStr(Date);
   CmpDadosParaBaixaCAP.ParamValues[1].TextDefault := pNomeConvenio + ' - Arq. n_' + pIdArquivoPagto;
   CmpDadosParaBaixaCAP.ParamValues[2].TextDefault := floattostrf(pValor, ffnumber, 12, 2);

   If CmpDadosParaBaixaCAP.Execute Then
     Begin
       Screen.Cursor := crSQLWait;
       cdsMovBaixa.data := oRemessaEletronica._SelecionaMovBaixa(pIdArquivoPagto, pTipoBaixa);

       If Not oCtrlFinanc.TestaDispFinanc(
         Sistema.IdEmpresa,
         Sistema.IdUsuario,
         CmpDadosParaBaixaCAP.ParamValues[0].AsDateTime) Then
         Begin
           MsgDlg(oCtrlFinanc.MessageInfo, Caption, mtWarning, [mbOk], 0);
           Screen.Cursor := crDefault;
           Exit;
         End;

       If oCtrlFinanc.IntegraDispFinanc Then
         dDataDisp := CmpDadosParaBaixaCAP.ParamValues[0].AsDateTime;

       // Função de baixa global
       Result := oCtrlBaixaDocumentos.ProcessaBaixaManual(
         False, // Controla Emissao de Cheque
         pCodPortForma, // ID do Portador Forma
         strtoint(pIdArquivoPagto), // Num cheque bordero
         cdsMovBaixa.Data, // CDS com o Movimento
         dDataDisp, // Data do Lançamento
         dDataDisp, // Data da Baixa
         TSistemaLancto(Sistema.IdModulo - 3), // Módulo
         False, // Lanca Baixa Float
         Sistema.IdUsuario,
         Sistema.IdEmpresa,
         Sistema.IdEspAcesso,
         ParamIntegra.Plano, // iPLanoContabil
         Sistema.UsaPlanoPatro,
         ParamIntegra.IntegraContab,
         ParamIntegra.PartidaDobrada,
         True, // Calcula Imposto
         0, // iNumBaixaRecXPagto
         0, // iPlnCodigo
         -1, // iCodLancFinanc
         True, // bLancaFinancBaixa
         0, // Data Diferido
         0, // CODLANCFINANCnIdent
         dDataDisp, // data da Disponibilidade
         false, // Estorno
         false, // bUsaPortFormaRetorno
         false, // bLancHistContabLoteOrig
         CmpDadosParaBaixaCAP.ParamValues[1].AsString);

       Screen.Cursor := crDefault;

       If Result Then
         Application.MessageBox(pchar('Arquivo Nº ' + pIdArquivoPagto + ' Baixado com Sucesso !'), 'Atenção !', Mb_IconExclamation)
       Else
         MsgDlg(oCtrlBaixaDocumentos.MessageInfo, 'Atenção', mtError, [mbOk], 0);
     End;  }
End;

Procedure TFrmRemessaEletronica.spbSelRemessaClick(Sender: TObject);
Var
   sListaDeDocumentos: String;                              //Everson Cunha - SIG117008
   sMsgErro: String;                                        //Cássio Rovaroto - SIG nº 114764
Begin
   Inherited;
   bAltFormPagto := False;
   bAnaliseFeita := False;
   sFormaPagtoAnt := EmptyStr;
   cdsMovRemessa.IndexName := EmptyStr;

   If dblkpConvenio.LookupValue = EmptyStr Then
   Begin
      MsgDlg(MSG001, 'Atenção', mtWarning, [mbOK], 0);
      dblkpConvenio.SetFocus;
      Exit;
   End;

   If dblkpFormaPagto.LookupValue = EmptyStr Then
   Begin
      MsgDlg(MSG032, 'Atenção', mtWarning, [mbOK], 0);
      dblkpFormaPagto.LookupValue := '-1';                  // Todas as Forma de Pagamento como default
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

   // Verificando se há parametrização específica do Convênio em questão
   If oRemessaEletronica._CarregaParamConvenio(dblkpConvenio.LookupValue, sMsgErro) Then
   Begin
      dVlrObrigaNumDocTit := oRemessaEletronica.rDadosParamConv.dVlrObrigaCpfCnpj;

      cdsMovRemessa.DisableControls;

      frmAguarde.pbAguarde.Visible := false;
      frmAguarde.Mostra('Selecionando Movimento...');

      Screen.Cursor := crSQLWait;

      cdsMovRemessa.data := oRemessaEletronica._SelecionaMovimentoRemessa(
         dblkpConvenio.LookupValue,
         dblkpFormaPagto.LookupValue,
         dbDataProgIni.Date,
         dbDataProgFim.Date, iIdModuloAcesso);

      Screen.Cursor := crDefault;

      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;

      cdsMovRemessa.EnableControls;

      If cdsMovRemessa.isEmpty Then
         Application.MessageBox(MSG020, 'Atenção !', Mb_IconExclamation);

      dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);

      //Cássio Rovaroto - SIG nº 60540 - Início
      //Se o módulo não for Contas a Pagar, gerar a lista de favorecidos automaticamente
      If (iIdModuloAcesso <> 3) And Not (cdsMovRemessa.IsEmpty) Then
      Begin
         frmAguarde.pbAguarde.Visible := false;
         frmAguarde.Mostra('Selecionando favorecidos...');

         //Everson Cunha - SIG117008 - Ini
         tsListaDeDocumentos.Clear;

         cdsMovRemessa.First;

         While Not cdsMovRemessa.Eof Do
         Begin
            tsListaDeDocumentos.Add(cdsMovRemessa.FieldByName('CODDOCUMENTO').asString);
            cdsMovRemessa.Next;
         End;

         sListaDeDocumentos := oRemessaEletronica._ConverteListas(tsListaDeDocumentos);

         //Exclui os registros de favorecidos que não foram para arquivos gerados....
         //ExlcuiFavorecidosNaoGerados;
         ExcluiFavorecidosNaoGerados(sListaDeDocumentos);

         //Everson Cunha - SIG117008 - Fim

         cdsMovRemessa.First;
         While Not cdsMovRemessa.Eof Do
         Begin
            _GetFavorecidosAutomatico(iIdModuloAcesso, dblkpConvenio.LookupValue, dblkpFormaPagto.LookupValue, dbDataProgIni.Date, dbDataProgFim.Date,
               cdsMovRemessa.FieldByName('CODDOCUMENTO').asInteger, cdsMovRemessa.FieldByName('IDHSTFOLHABENEF').asInteger);
            cdsMovRemessa.Next;
         End;

         frmAguarde.pbAguarde.Visible := True;
         frmAguarde.Apaga;
      End;
      //Cássio Rovaroto - SIG nº 60540 - Fim

      spbAnalisar.Enabled := (Not cdsMovRemessa.isempty);
      spbPrepararEnvio.Enabled := (Not cdsMovRemessa.isempty);

      cdsMovRemessaAfterScroll(cdsMovRemessa);
      cdsMovRemessa.First;
   End
   Else
      Application.MessageBox(pchar('Convênio -> ' + dblkpConvenio.Text + ' não possui Parametrização definida. Verifique !'), 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.spbAnalisarClick(Sender: TObject);
Var sMSGErroAnalise: String;
Begin
   Inherited;
   If Not cdsMovRemessa.isEmpty Then
   Begin
      cdsMovRemessa.first;
      If cdsMovRemessa.Locate('MARCADO', 'S', []) Then      // Sim
      Begin
         bAnaliseFeita := True;
         iContador := 0;
         frmProgresso.MostraFormProgresso('Aguarde ! Analisando o Movimento...', True, False, True, 0, cdsMovRemessa.RecordCount);

         Screen.Cursor := crSQLWait;
         cdsMovRemessa.first;
         While Not cdsMovRemessa.Eof Do
         Begin
            If cdsMovRemessa.FieldByName('MARCADO').AsString = 'S' Then // Sim
            Begin
               sMSGErroAnalise := _AnaliseDoMovimento(cdsMovRemessa.FieldByName('CODFORMA').AsInteger);
               cdsMovRemessa.Edit;
               cdsMovRemessa.FieldByName('MSGERRO').AsString := sMSGErroAnalise;
            End;

            cdsMovRemessa.Next;
            oRemessaEletronica._AtualizaFrmProgresso(iContador);
         End;

         cdsMovRemessa.first;
         Screen.Cursor := crDefault;
         frmProgresso.EscondeFormProgresso;
      End
      Else
         Application.MessageBox(MSG012, 'Atenção !', Mb_IconExclamation);
   End
   Else
      Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.PageControl1Change(Sender: TObject);
Begin
   Inherited;
   spbAnalisar.Enabled := (pcGeralRemessa.activepage = tbsAnalise);
   spbPrepararEnvio.Enabled := (pcGeralRemessa.activepage = tbsAnalise);
End;

Procedure TFrmRemessaEletronica.spbCalcClick(Sender: TObject);
Begin
   Inherited;
   WinExec('Calc.Exe', SW_Show);
End;

Procedure TFrmRemessaEletronica.cdsMovRemessaAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   stQtd1.Caption := Format('%.2d / %.2d', [cdsMovRemessa.RecNo, cdsMovRemessa.RecordCount]);
   dValorTotalMovLista := 0.00;
   dValorTotalTitulos := 0.00;
   If Not cdsMovRemessa.isEmpty Then
   Begin
      //Cássio Rovaroto -  SIG nº 60540 - Início
      qryMovListaFavorecidos.Close;
      qryMovListaFavorecidos.ParamByName('CODDOCUMENTO').AsInteger := cdsMovRemessa.FieldByName('CODDOCUMENTO').AsInteger;
      {qryMovListaFavorecidos.ParamByName('CODFORMA').AsInteger := cdsMovRemessa.FieldByName('CODFORMA').AsInteger;
      qryMovListaFavorecidos.ParamByName('CODPORTFORMA').AsInteger := cdsMovRemessa.FieldByName('CODPORTFORMA').AsInteger;
      qryMovListaFavorecidos.ParamByName('IDMOTIVO').AsInteger := cdsMovRemessa.FieldByName('IDMOTIVO').AsInteger;
      qryMovListaFavorecidos.ParamByName('DATAPROGRAMADA').AsDateTime := cdsMovRemessa.FieldByName('DATAPROGRAMADA').AsDateTime;}
      qryMovListaFavorecidos.Open;
      //Cássio Rovaroto -  SIG nº 60540 - Fim

      dbgMovListaFav.ColumnByName('VALOR').FooterValue := _TotalizaColunaGridMovListaFavorecidos('VALOR', 2);
      dbgMovTitulos.ColumnByName('VLRPAGTO').FooterValue := _TotalizaColunaGridMovTitulos('VLRPAGTO', 2);
      //Cássio Rovaroto -  SIG nº 60540 - Início
      If iIdModuloAcesso = 3 Then
      Begin
         edSaldoListaFav.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalMovLista, 2);
         edSaldoTitulo.Value := RoundCM(cdsMovRemessa.fieldbyname('VALOR').asFloat - dValorTotalTitulos, 2);
      End;
      //Cássio Rovaroto -  SIG nº 60540 - Fim
      tbsAnaliseManutencoes.Highlighted := ((Not cdsMovRemessa.IsEmpty) And ((Not qryMovListaFavorecidos.IsEmpty) Or (Not qryMovTitulos.IsEmpty)));

   End;
End;

Procedure TFrmRemessaEletronica.dbgMovRemessaCalcCellColors(
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

Procedure TFrmRemessaEletronica.dbgMovRemessaDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
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

Procedure TFrmRemessaEletronica.spbInverterSelClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.spbMarcaTodosClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.spbExpBenefSelClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnInc1Click(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnAlt1Click(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnExc1Click(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnCon1Click(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnCan1Click(Sender: TObject);
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

Procedure TFrmRemessaEletronica.spbBuscaContaCorClick(Sender: TObject);
Begin
   Inherited;
   With DtmDadosBancarios Do
   Begin
      SetaFiltroMs(qryMovListaFavorecidos.FieldByName('IDFORCLI').AsFloat);
      If MsContaCor.Executar = MrOk Then
      Begin
         If MsContaCor.ValoresChave[0] <> EmptyStr Then
         Begin
            If MsContaCor.ValoresChave[4] <> '0' Then       // Se for Conta Corrente ou Poupança (1 ou 3)
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

Procedure TFrmRemessaEletronica.spbImportarMovListaClick(Sender: TObject);
Var tArquivo: TextFile;
   sLinha, sBanco, sAgencia, sOperacao, sConta, sTipoConta, sDocumento, sNome: String;
   sValorCampo: TStringlist;
   dValor, dTotalLista: Double;
   iIdPlanoPrev: Integer;
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
         '[Valor] - (Ex.: 100,48)' + #13 +
         //'Exemplo: 03447883189;JOSE DA SILVA;104;2458;013;6510-7;1;100,48' + #13 + #13 +
         'Exemplo: 03447883189;JOSE DA SILVA;104;2458;013;6510-7;1;100,48;2' + #13 + #13 +
         //Cássio Rovaroto - SIG nº 60540 - Fim
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

                     sDocumento := TRIM(sValorCampo[0]);    // CPF ou CNPJ
                     sNome := ConverteCar(UPPERCASE(TRIM(sValorCampo[1]))); // RAZAOSOCIAL

                     sBanco := TRIM(sValorCampo[2]);        // NUMBANCO
                     sAgencia := TRIM(sValorCampo[3]);      // NUMAGENCIA
                     sOperacao := TRIM(sValorCampo[4]);     // NUMOPERACAO
                     If sOperacao = '0' Then
                        sOperacao := EmptyStr;
                     sConta := TRIM(sValorCampo[5]);        // NUMCONTA
                     sTipoConta := TRIM(sValorCampo[6]);    // TIPOCONTA
                     dValor := StringToFloat(sValorCampo[7]); // VALOR
                     iIdPlanoPrev := StrToInt(sValorCampo[8]); //ID do Plano

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

                        //Cássio Rovaroto - SIG nº 61677 - Início
                        _InsereDocumentoXPessoa(sNome, sDocumento, sBanco, sAgencia, sConta, sTipoConta, sOperacao, dValor, cdsMovRemessa.FieldByName('CODDOCUMENTO').asInteger);
                        {qryAux.Close;
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
                        qryMovListaFavorecidos.Post;}
                        //Cássio Rovaroto - SIG nº 61677 - Fim
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

Procedure TFrmRemessaEletronica.spbLocalizaFavorecClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.spbLimparMovListaClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.dbgMovListaFavDrawDataCell(Sender: TObject;
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

Procedure TFrmRemessaEletronica.pcAnaliseRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
   Inherited;
   AllowChange := (Not cdsMovRemessa.isEmpty) And
      (qryDocumento.State = dsBrowse) And
      (qryMovListaFavorecidos.State = dsBrowse) And
      (qryMovTitulos.State = dsBrowse);
End;

Procedure TFrmRemessaEletronica.pcDetalManutChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
   Inherited;
   AllowChange := ((qryDocumento.State = dsBrowse) And
      (qryMovListaFavorecidos.State = dsBrowse) And
      (qryMovTitulos.State = dsBrowse));
End;

Procedure TFrmRemessaEletronica.pcGeralRemessaChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
   Inherited;
   AllowChange := (qryDocumento.State = dsBrowse) And
      (qryMovListaFavorecidos.State = dsBrowse) And
      (qryMovTitulos.State = dsBrowse);
End;

Procedure TFrmRemessaEletronica.spbPrepararEnvioClick(Sender: TObject);
Var sMsg, sListaDeDocumentos: String;
Begin
   Inherited;
   sMsg := EmptyStr;
   If cdsMovRemessa.Locate('MARCADO', 'S', []) Then         // Sim
   Begin
      // Filtrando a Grid para verificar a existência de lançamentos com mensagem de erro
      Screen.Cursor := crSQLWait;
      cdsMovRemessa.Filtered := False;
      cdsMovRemessa.Filter := 'MARCADO = ''S'' AND TRIM(MSGERRO) <> '''' ';
      cdsMovRemessa.Filtered := True;
      Screen.Cursor := crDefault;
      If cdsMovRemessa.isEmpty Then
      Begin
         cdsMovRemessa.Filtered := False;
         // Filtro para caso haja pelo um 'N', então filtra, caso contrário todos estão marcados
         If cdsMovRemessa.Locate('MARCADO', 'N', []) Then   // Não
         Begin
            // Filtrando a Grid somente para mostrar e processar os marcados
            Screen.Cursor := crSQLWait;
            cdsMovRemessa.Filtered := False;
            cdsMovRemessa.Filter := 'MARCADO = ''S'' ';     // Sim
            cdsMovRemessa.Filtered := True;
            _TotalizaColunaGridMovRemessa('VALOR');
            cdsMovRemessa.First;
            Screen.Cursor := crDefault;
         End;

         sMsg := 'Confirma Preparo do Envio ?';
         If bAnaliseFeita = False Then
            sMsg := 'Não foi realizado o Processo de Análise do Movimento. ' + #13 + #13 +
               'Confirma Preparo do Envio assim mesmo ?';

         If Application.MessageBox(pchar(sMsg), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
         Begin
            Try
               Screen.Cursor := crSQLWait;
               If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               cdsMovRemessa.DisableControls;
               cdsMovRemessa.First;
               frmProgresso.MostraFormProgresso('Aguarde ! Gerando Movimento de Envio.', True, False, True, 0, cdsMovRemessa.RecordCount);

               // Preparando uma lista contendo todos os CODDOCUMENTOS, que será
               // usada na cláusula IN do SELECT do INSERT principal abaixo
               iContador := 0;
               tsListaDeDocumentos.Clear;
               With cdsMovRemessa Do
               Begin
                  First;
                  While Not EOF Do
                  Begin
                     tsListaDeDocumentos.Add(FieldByName('CODDOCUMENTO').asString);
                     Next;
                     oRemessaEletronica._AtualizaFrmProgresso(iContador);
                  End;

                  First;
               End;
               cdsMovRemessa.First;
               sListaDeDocumentos := oRemessaEletronica._ConverteListas(tsListaDeDocumentos);

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.add('SELECT SEQARQUIVOPAGTO.NEXTVAL SEQ FROM DUAL                                    ');
               qryAux.Open;

               qryAux2.Close;
               qryAux2.SQL.Clear;
               qryAux2.SQL.add('INSERT INTO ARQUIVOPAGTO (IDARQUIVOPAGTO, VLRTOTAL, FLGENVIADO, CODPORTFORMA)  ');
               qryAux2.SQL.add('VALUES (:p1, :p2, :p3, :p4)                                                    ');
               qryAux2.ParamByName('p1').asInteger := qryAux.fieldByname('SEQ').asInteger;
               qryAux2.ParamByName('p2').asFloat := _TotalizaColunaGridMovRemessa('VALOR');
               qryAux2.ParamByName('p3').asString := 'N';   // FLGENVIADO = Não
               qryAux2.ParamByName('p4').asString := cdsMovRemessa.fieldByname('CODPORTFORMA').asString;
               qryAux2.ExecSQL;

               qryAux2.Close;
               qryAux2.SQL.Clear;
               qryAux2.SQL.add('INSERT INTO ARQUIVOXDOCUM (IDARQUIVOPAGTO, CODDOCARQ, ID_DOC_CODBARRAS_PESSOAS, CODFORMA, VALOR, TIPO)    ');
               qryAux2.SQL.add('SELECT :pIDARQUIVOPAGTO,                                                                                  ');
               qryAux2.SQL.add('       SEQCODDOCARQ.NEXTVAL,                                                                              ');
               qryAux2.SQL.add('       ID,                                                                                                ');
               qryAux2.SQL.add('       CODFORMA,                                                                                          ');
               qryAux2.SQL.add('       VALOR,                                                                                             ');
               qryAux2.SQL.add('       TIPO                                                                                               ');
               qryAux2.SQL.add('FROM(                                                                                                     ');
               qryAux2.SQL.add('/* SEM LISTA DE PESSOAS E SEM LISTA DE TÍTULOS */                                                         ');
               qryAux2.SQL.add('SELECT D.CODDOCUMENTO ID,                                                                                 ');
               qryAux2.SQL.add('       D.CODFORMA,                                                                                        ');
               qryAux2.SQL.add('       (SELECT SUM(DECODE(LANC.DEBCRE, ''D'',                                                             ');
               qryAux2.SQL.add('               DECODE(DOC.RECPAG, ''R'', LANC.VALOR, LANC.VALOR * -1),                                    ');
               qryAux2.SQL.add('               DECODE(DOC.RECPAG, ''R'', LANC.VALOR * -1, LANC.VALOR))) AS VALOR                          ');
               qryAux2.SQL.add('        FROM LANCTODOCUM LANC                                                                             ');
               qryAux2.SQL.add('        JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = LANC.CODDOCUMENTO                                        ');
               qryAux2.SQL.add('        WHERE D.CODDOCUMENTO = LANC.CODDOCUMENTO) VALOR,                                                  ');
               qryAux2.SQL.add('       1 TIPO,                                                                                            ');
               qryAux2.SQL.add('       D.CODDOCUMENTO                                                                                     ');
               qryAux2.SQL.add('FROM DOCUMENTO D                                                                                          ');
               qryAux2.SQL.add('WHERE NOT EXISTS(SELECT 1 FROM DOCUMENTOXCODBARRAS DX WHERE DX.CODDOCUMENTO = D.CODDOCUMENTO)             ');
               qryAux2.SQL.add('      AND NOT EXISTS(SELECT 1 FROM DOCUMENTOXPESSOAS DP WHERE DP.CODDOCUMENTO = D.CODDOCUMENTO)           ');
               qryAux2.SQL.add('UNION ALL                                                                                                 ');
               qryAux2.SQL.add('/* LISTA DE PESSOAS */                                                                                    ');
               qryAux2.SQL.add('SELECT DP.IDDOCUMENTOXPESSOAS ID,                                                                         ');
               qryAux2.SQL.add('       D.CODFORMA,                                                                                        ');
               qryAux2.SQL.add('       DP.VALOR,                                                                                          ');
               qryAux2.SQL.add('       2 TIPO,                                                                                            ');
               qryAux2.SQL.add('       D.CODDOCUMENTO                                                                                     ');
               qryAux2.SQL.add('FROM DOCUMENTOXPESSOAS DP                                                                                 ');
               qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DP.CODDOCUMENTO                                                      ');
               //Cássio Rovaroto - SIG nº 60540 - Início
               qryAux2.SQL.add('WHERE NOT EXISTS (SELECT 1                                                                                ');
               qryAux2.SQL.add('                    FROM ARQUIVOPAGTO AP                                                                  ');
               qryAux2.SQL.add('                    JOIN ARQUIVOXDOCUM AD ON AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                        ');
               qryAux2.SQL.add('                   WHERE AP.FLGENVIADO IN (''C'', ''F'', ''E'')                                           ');
               qryAux2.SQL.add('                     AND AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS)                            ');
               //Cássio Rovaroto - SIG nº 60540 - Fim
               qryAux2.SQL.add('UNION ALL                                                                                                 ');
               qryAux2.SQL.add('/* LISTA DE TÍTULOS */                                                                                    ');
               qryAux2.SQL.add('SELECT DC.IDDOCUMENTOXCODBARRAS ID,                                                                       ');
               qryAux2.SQL.add('       D.CODFORMA,                                                                                        ');
               qryAux2.SQL.add('       DC.VLRPAGTO,                                                                                       ');
               qryAux2.SQL.add('       3 TIPO,                                                                                            ');
               qryAux2.SQL.add('       D.CODDOCUMENTO                                                                                     ');
               qryAux2.SQL.add('FROM DOCUMENTOXCODBARRAS DC                                                                               ');
               qryAux2.SQL.add('JOIN DOCUMENTO D ON D.CODDOCUMENTO = DC.CODDOCUMENTO                                                      ');
               //Cássio Rovaroto - SIG nº 60540 - Início
               qryAux2.SQL.add('WHERE NOT EXISTS (SELECT 1                                                                                ');
               qryAux2.SQL.add('                    FROM ARQUIVOPAGTO AP                                                                  ');
               qryAux2.SQL.add('                    JOIN ARQUIVOXDOCUM AD ON AD.IDARQUIVOPAGTO = AP.IDARQUIVOPAGTO                        ');
               qryAux2.SQL.add('                   WHERE AP.FLGENVIADO IN (''C'', ''F'', ''E'')                                           ');
               qryAux2.SQL.add('                     AND AD.ID_DOC_CODBARRAS_PESSOAS = DC.IDDOCUMENTOXCODBARRAS)                          ');
               //Cássio Rovaroto - SIG nº 60540 - Fim
               qryAux2.SQL.add('ORDER BY TIPO, CODDOCUMENTO, VALOR)                                                                       ');
               qryAux2.SQL.add('WHERE ' + oCtrlFuncoesRH.QuebrarListaFiltro(1, '(CODDOCUMENTO  ', sListaDeDocumentos, 500));
               qryAux2.ParamByName('pIDARQUIVOPAGTO').asInteger := qryAux.fieldByname('SEQ').asInteger; // IDARQUIVOPAGTO
               qryAux2.SQL.SaveToFile(sPathArquivosLog + '\SQL_InseriNoArquivoXDocum.txt');
               qryAux2.ExecSQL;

               qryAux1.Close;
               qryAux1.SQL.Clear;
               qryAux1.SQL.add('UPDATE DOCUMENTO     ');
               qryAux1.SQL.add('SET STATUS = ''1''   ');    // Documento não pode ser alterado
               qryAux1.SQL.add('WHERE ' + oCtrlFuncoesRH.QuebrarListaFiltro(1, '(CODDOCUMENTO  ', sListaDeDocumentos, 500));
               qryAux1.ExecSQL;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

               //Cássio Rovaroto - SIG nº 64071
               //Registro da tarifas bancárias para o arquivo
               frmProgresso.EscondeFormProgresso;

               frmAguarde.pbAguarde.Visible := false;
               frmAguarde.Mostra('Gerando dados referente à tarifas bancárias...');

               _RegistraTarifaBancaria(qryAux.FieldByName('SEQ').asInteger, iIdModuloAcesso);

               frmAguarde.pbAguarde.Visible := True;
               frmAguarde.Apaga;

               Application.MessageBox(pchar('Preparo do Arquivo Nº ' + qryAux.fieldByname('SEQ').asString + ' realizado com sucesso !'), 'Atenção !', Mb_IconExclamation);
               cdsMovRemessa.Filtered := False;

               cdsMovRemessa.Data := oRemessaEletronica._SelecionaMovimentoRemessa(dblkpConvenio.LookupValue,
                  dblkpFormaPagto.LookupValue,
                  dbDataProgIni.Date,
                  dbDataProgFim.Date, iIdModuloAcesso);

               dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
               cdsMovRemessa.AfterScroll := cdsMovRemessaAfterScroll;
               cdsMovRemessaAfterScroll(cdsMovRemessa);
               qryAux.Close;
               cdsMovRemessa.EnableControls;
               Screen.Cursor := crDefault;
               tbsAnaliseManutencoes.Highlighted := ((Not cdsMovRemessa.IsEmpty) And ((Not qryMovListaFavorecidos.IsEmpty) Or (Not qryMovTitulos.IsEmpty)));

            Except
               On E: Exception Do
               Begin
                  If dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.RollBack;

                  cdsMovRemessa.Filtered := False;
                  frmProgresso.EscondeFormProgresso;
                  dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
                  Screen.Cursor := crDefault;
                  Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
               End;
            End;
         End
         Else
         Begin
            cdsMovRemessa.Filtered := False;
            dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
            cdsMovRemessa.First;
         End;
      End
      Else
      Begin
         Application.MessageBox('Existem Lançamentos Analisados que não foram Tratados. Verifique !', 'Atenção !', Mb_IconExclamation);
         cdsMovRemessa.Filtered := False;
      End;
   End
   Else
   Begin
      Application.MessageBox(MSG012, 'Atenção !', Mb_IconExclamation);
      cdsMovRemessa.first;
   End;
End;

Procedure TFrmRemessaEletronica.spbDesfazerPrepClick(Sender: TObject);
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
               // Paulo Nobre - WO6194
               cdsMovArqPendDet.DisableControls;

               frmAguarde.pbAguarde.Visible := false;
               frmAguarde.Mostra('Desfazendo o Preparo do Arquivo...');

               qryAux1.Close;
               qryAux1.SQL.Clear;
               qryAux1.SQL.add('UPDATE DOCUMENTO      ');
               qryAux1.SQL.add('SET STATUS = ''0''    ');   // Documento pode ser alterado
               qryAux1.SQL.add('WHERE STATUS <> ''2'' ');   // Documento não Baixado
               qryAux1.SQL.add('      AND CODDOCUMENTO IN (SELECT DISTINCT DECODE(AX.TIPO, 1, AX.ID_DOC_CODBARRAS_PESSOAS, 2, DP.CODDOCUMENTO, 3, DX.CODDOCUMENTO) CODDOCUMENTO  ');
               qryAux1.SQL.add('                           FROM ARQUIVOXDOCUM  AX                                                                                                ');
               qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 2                ');
               qryAux1.SQL.add('                           LEFT JOIN DOCUMENTOXCODBARRAS DX ON DX.IDDOCUMENTOXCODBARRAS = AX.ID_DOC_CODBARRAS_PESSOAS AND AX.TIPO = 3            ');
               qryAux1.SQL.add('                           WHERE AX.IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ')');
               qryAux1.ExecSQL;

               //Cássio Rovaroto - SIG nº 64071
               //Excluir registros na tabela DOCUMENTOXPESSOAS associados ao arquivo
               qryAux2.Close;
               qryAux2.SQL.Clear;
               qryAux2.SQL.Add('DELETE FROM DOCUMENTOXPESSOAS ');
               qryAux2.SQL.Add(' WHERE IDDOCUMENTOXPESSOAS IN (SELECT ID_DOC_CODBARRAS_PESSOAS');
               qryAux2.SQL.Add('                               FROM ARQUIVOXDOCUM AD');
               qryAux2.SQL.Add('                               WHERE AD.IDARQUIVOPAGTO = ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asString + ')');
               qryAux2.ExecSQL;

               //Cássio Rovaroto - SIG nº 64071
               //Exclui registros das tarifas bancárias associadas.
               qryAux3.Close;
               qryAux3.SQL.Clear;
               qryAux3.SQL.Add('DELETE FROM TARIFAARQPAGTO ');
               qryAux3.SQL.Add(' WHERE IDARQUIVOPAGTO = ' + cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').AsString);
               qryAux3.ExecSQL;

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

               // Paulo Nobre - WO6194 - Inicio

               frmAguarde.Mostra('Atualizando os Arquivos Pendentes...');

               cdsMovArqPendente.Data := oRemessaEletronica._SelecionaMovArquivoFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'N');
               cdsMovArqPendDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'N');

               cdsMovArqPendente.EnableControls;
               cdsMovArqPendDet.EnableControls;

               Cursor := crDefault;
               frmAguarde.pbAguarde.Visible := True;
               frmAguarde.Apaga;
               // Paulo Nobre - WO6194 - Fim
            Except
               frmAguarde.pbAguarde.Visible := True;
               frmAguarde.Apaga;
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

Procedure TFrmRemessaEletronica.dbgMovRemessaFieldChanged(Sender: TObject; Field: TField);
Var RegAtual1: TBookMark;
Begin
   Inherited;
   RegAtual1 := cdsMovRemessa.GetBookmark;                  // Salvando o ponteiro do Registro atual
   dbgMovRemessa.ColumnByName('VALOR').FooterValue := floattostrf(_TotalizaColunaGridMovRemessa('VALOR'), ffnumber, 12, 2);
   If RegAtual1 <> Nil Then
      cdsMovRemessa.GotoBookmark(RegAtual1);                // Voltando ao Reg. atual
End;

Procedure TFrmRemessaEletronica.qryDocumentoAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   If Not qryDocumento.isEmpty Then
   Begin
      If Length(Trim(qryDocumentoNUMLEITCODBARRAS.asString)) = 47 Then
      Begin
         qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; ';
         rdgTipoTituloGeral.ItemIndex := 0;                 // Ficha de Compensação
         edDtVenctoGeral.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString));
         edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(qryDocumentoNUMLEITCODBARRAS.asString);
      End
      Else If Length(Trim(qryDocumentoNUMLEITCODBARRAS.asString)) = 48 Then
      Begin
         qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; '; // Tamanho 48
         rdgTipoTituloGeral.ItemIndex := 1;                 // Arrecadação
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

Procedure TFrmRemessaEletronica.SpeedButton5Click(Sender: TObject);
Begin
   Inherited;
   With DtmDadosBancarios Do
   Begin
      SetaFiltroMs(qryDocumento.FieldByName('IDFORCLI').AsFloat);
      If MsContaCor.Executar = MrOk Then
      Begin
         If MsContaCor.ValoresChave[0] <> EmptyStr Then
         Begin
            If MsContaCor.ValoresChave[4] <> '0' Then       // Se for Conta Corrente, salário ou Poupança (1 ou 2 ou 3)
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

Procedure TFrmRemessaEletronica.btnAltGeralClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnConGeralClick(Sender: TObject);
Var sCodDocum: String;
Begin
   Inherited;
   If Trim(DbeCodigoBarrasGeral.Text) <> EmptyStr Then
   Begin
      If rdgTipoTituloGeral.Itemindex = 0 Then              // Ficha de Compensação
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
      Else                                                  // Arrecadação
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
                  dbDataProgFim.Date, iIdModuloAcesso);
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

Procedure TFrmRemessaEletronica.rdgTipoTituloGeralClick(Sender: TObject);
Begin
   Inherited;
   If qryDocumento.state <> dsBrowse Then
   Begin
      DbeCodigoBarrasGeral.Enabled := True;
      If rdgTipoTituloGeral.itemindex = 0 Then              // Ficha de Compensação
         qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
      Else                                                  // Arrecadação
         qryDocumento.FieldByName('NUMLEITCODBARRAS').EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

      DbeCodigoBarrasGeral.Setfocus;
      DbeCodigoBarrasGeral.SelectAll;
   End;
End;

Procedure TFrmRemessaEletronica.btnCanGeralClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnIncTitClick(Sender: TObject);
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
               rdgTipoTitulo.Itemindex := 0;                // Ficha de Compensação
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

Procedure TFrmRemessaEletronica.btnAltTitClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnExcTitClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.btnConTitClick(Sender: TObject);
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
      If rdgTipoTitulo.Itemindex = 0 Then                   // Ficha de Compensação
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
      Else                                                  // Arrecadação
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

Procedure TFrmRemessaEletronica.btnCanTitClick(Sender: TObject);
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

Procedure TFrmRemessaEletronica.dbeCodigoBarrasTitulosExit(Sender: TObject);
Begin
   Inherited;
   If (dbeCodigoBarrasTitulos.text <> EmptyStr) And (length(trim(dbeCodigoBarrasTitulos.text)) >= 47) Then
   Begin
      If rdgTipoTitulo.Itemindex = 0 Then                   // Ficha de Compensação
      Begin
         If copy(dbeCodigoBarrasTitulos.text, 34, 1) <> '0' Then
            qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(dbeCodigoBarrasTitulos.text)
         Else
            qryMovTitulos.fieldbyname('DTPAGTO').asDateTime := cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime;
      End
      Else                                                  // Arrecadação
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
            qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '99.999.999\/9999\-99;0;_';
      End;
   End;
End;

Procedure TFrmRemessaEletronica.spbLimpaCampo1Click(Sender: TObject);
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

Procedure TFrmRemessaEletronica.spbGerarArqClick(Sender: TObject);
Var sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC,
   sNomeCompletoArquivoRemessaServidor: String;
   sNSA: String;
   sMsgErro: String;                                        //Cássio Rovaroto -  SIG nº 114764
Begin
   Inherited;
   If (Not cdsMovArqPendente.isEmpty) And (Not cdsMovArqPendDet.isEmpty) Then
   Begin
      // Verificando se há parametrização específica do Convênio em questão
      If oRemessaEletronica._CarregaParamConvenio(dblkpConvenio2.LookupValue, sMsgErro) Then
      Begin
         If Not cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').isnull Then
         Begin
            If Application.MessageBox(pchar('Gerar Arquivo de Envio Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
            Begin
               //Everson Cunha - SIG84050 - Início
               If UpperCase(Copy(Sistema.AliasServidor, 1, 8)) <> 'PRODUCAO' Then
                  Application.MessageBox(pchar('Em bases de testes, os arquivos são gravados em C:\Planus\Temp\RemessaEletronica\Remessa\ '), 'Atenção !', MB_ICONEXCLAMATION + MB_OK);
               //Everson Cunha - SIG84050 - Fim

              // Monitoramento('REMESSA BANCARIA', 0);        // Andre Imakawa - SIG 102321           // Paulo Nobre - WO6194

               sNSA := cdsMovArqPendente.fieldByname('NSA').asString; // Cássio Rovaroto - SIG nº 75603
               // Montando o nome do Arquivo
               Screen.Cursor := crSQLWait;
               //Cássio Rovaroto - SIG nº 75187 - Início
               //Número NSA gerado a partir da criação do lote, e não mais na geração do arquivo.
               //Cássio Rovaroto - SIG nº 73883 - Início
               // Obtendo o NSA - Número Sequencial do Arquivo
               //qryAux.Close;
               //qryAux.SQL.Clear;
               //qryAux.SQL.add('SELECT SEQNSAARQPAG.NEXTVAL SEQ FROM DUAL    ');
               //qryAux.Open;
               //Cássio Rovaroto - SIG nº 73883 - Fim
               //Cássio Rovaroto - SIG nº 75187 - Fim

               qryAux1.Close;
               qryAux1.SQL.Clear;
               qryAux1.SQL.add('SELECT ''ACC.'' || TO_CHAR(SYSDATE, ''DDMMYYYY.'') || TRIM(CONV.NUMEMPRESABANCO) || ''.'' || LPAD(:pIDARQUIVOPAGTO, 6, ''0'') || ''.rem'' AS NOME_ARQ_REM ');
               qryAux1.SQL.add('FROM PORTADORFORMA PO   ');
               qryAux1.SQL.add('LEFT JOIN SEQREMESSA CONV ON PO.NUMEMPRESABANCO = CONV.NUMEMPRESABANCO ');
               qryAux1.SQL.add('WHERE PO.CODPORTFORMA =:pCODPORTFORMA ');
               //Cássio Rovaroto - SIG nº 75187 - Início
               //Cássio Rovaroto - SIG nº 73883 - Início
               //qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString;
               //qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := qryAux.fieldByname('SEQ').asString;
               //Cássio Rovaroto - SIG nº 73883 - Fim
               qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := sNSA; //Cássio Rovaroto - SIG nº 75603
               //Cássio Rovaroto - SIG nº 75187 - Fim
               qryAux1.ParamByName('pCODPORTFORMA').AsString := cdsMovArqPendente.fieldByname('CODPORTFORMA').asString;
               qryAux1.Open;
               Screen.Cursor := crDefault;

               sNomeArquivoGerado := qryAux1.fieldByname('NOME_ARQ_REM').asString;

               //Caminho de gravação dos arquivos

               //Everson Cunha - SIG84050 - Início
               //sNomeCompletoArquivoRemessa := cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;
               //sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
               If UpperCase(Copy(Sistema.AliasServidor, 1, 8)) = 'PRODUCAO' Then
               Begin
                  sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;
                  sNomeCompletoArquivoRemessaServidor := cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;
                  sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
               End
               Else
               Begin
                  sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;
                  sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivoGerado;
               End;
               //Everson Cunha = SIG84050 - Fim

               If Not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessa)) Then
                  ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessa));

               // Paulo Nobre - WO6194 - Inicio
               //Cássio Rovaroto - SIG nº 73883 - Início
               Try
                  If oRemessaEletronica.Impersonate Then
                  Begin
                     If FileExists(sNomeCompletoArquivoRemessa) Then
                        DeleteFile(sNomeCompletoArquivoRemessa);
                     RevertToSelf;
                  End
               Except
                  On E: Exception Do
                  Begin
                     Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                     Exit;
                  End;
               End;
               //Cássio Rovaroto - SIG nº 73883 - Fim
               // Paulo Nobre - WO6194 - Fim

               // ROTINAS PARA GERAR O ARQUIVO (_GerarArquivo)
               If oRemessaEletronica._CriaArquivo(sNomeCompletoArquivoRemessa) Then
               Begin
                  Try
                     If Not dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.StartTransaction;

                     Screen.Cursor := crSQLWait;
                     cdsMovArqPendente.DisableControls;
                     cdsMovArqPendDet.DisableControls;

                     //Cássio Rovaroto - SIG nº 73883 - Início
                     {// Obtendo o NSA - Número Sequencial do Arquivo
                     qryAux.Close;
                     qryAux.SQL.Clear;
                     qryAux.SQL.add('SELECT SEQNSAARQPAG.NEXTVAL SEQ FROM DUAL    ');
                     qryAux.Open;}
                     //Cássio Rovaroto - SIG nº 73883 - Fim

                     //
                     // Gerando e Gravando os dados no Arquivo de Remessa
                     //
                     oRemessaEletronica._GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                        cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString,
                        cdsMovArqPendente.fieldByname('CODPORTFORMA').asString,
                        sNSA);                              // Número Sequencial do Arquivo

                     // Atualizando o Movimento
                     qryAux2.Close;
                     qryAux2.SQL.Clear;
                     qryAux2.SQL.add('UPDATE ARQUIVOPAGTO     ');
                     qryAux2.SQL.add('SET NSA = ' + sNSA);  //Cássio Rovaroto - SIG nº 75603
                     qryAux2.SQL.add(', DTGERACAOARQTXT = SYSDATE ');
                     qryAux2.SQL.add(', USUGERACAOARQTXT = ' + quotedstr(Sistema.NomeUsuario));
                     qryAux2.SQL.add(', NOMEARQTXT = ' + quotedstr(sNomeArquivoGerado));
                     qryAux2.SQL.add(', FLGENVIADO = ''S''  ');
                     qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString);
                     qryAux2.ExecSQL;

                     //Gerando registros de tarifa bancária
                     //_RegistraTarifaBancaria(cdsMovArqPendente.FieldByName('IDARQUIVOPAGTO').asInteger);

                     If dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.Commit;

                     // Paulo Nobre - WO6194 - Inicio
                     //Cássio Rovaroto - SIG nº 73883 - Início
                     Try
                        If oRemessaEletronica.Impersonate Then
                        Begin
                           //Everson Cunha - SIG84050 - Início
                           If Not DirectoryExists(ExtractFileDir(sNomeCompletoBackup)) Then
                              ForceDirectories(ExtractFileDir(sNomeCompletoBackup));
                           //Everson Cunha - SIG84050 - Fim
                           // Copiando o arquivo do diretório de remessa para o de backup
                           CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoBackup), False);

                           If UpperCase(Copy(Sistema.AliasServidor, 1, 8)) = 'PRODUCAO' Then
                           Begin
                              If Not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) Then
                                 ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));

                              // Copiando o arquivo do diretório de remessa para PRODUCAO
                              CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);
                           End;
                           RevertToSelf;
                        End
                     Except
                        On E: Exception Do
                        Begin
                           Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                           Exit;
                        End;
                     End;
                     //Cássio Rovaroto - SIG nº 73883 - Fim
                     // Paulo Nobre - WO6194 - Fim

                  //   Monitoramento('REMESSA BANCARIA', 1);  // Andre Imakawa - SIG 102321

                     Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + sNomeArquivoGerado + ' <- Gerado com Sucesso !'), 'Atenção !', Mb_IconExclamation);

                     // Paulo Nobre - WO6194 - Inicio
                     frmAguarde.pbAguarde.Visible := false;
                     frmAguarde.Mostra('Atualizando os Arquivos Pendentes...');

                     cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivoFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'N');
                     cdsMovArqPendDet.data := oRemessaEletronica._SelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'N');

                     qryAux.Close;
                     qryAux1.Close;
                     qryAux2.Close;

                     Screen.Cursor := crDefault;
                     cdsMovArqPendDet.EnableControls;
                     cdsMovArqPendente.EnableControls;

                     frmAguarde.pbAguarde.Visible := True;
                     frmAguarde.Apaga;
                     // Paulo Nobre - WO6194 - Fim
                  Except
                     On E: Exception Do
                     Begin
                        If dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.RollBack;

                        Screen.Cursor := crDefault;
                        cdsMovArqPendente.EnableControls;
                        frmAguarde.pbAguarde.Visible := True;
                        frmAguarde.Apaga;
                        Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                     End;
                  End
               End
               Else
                  Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' Não Gerado. Verifique !'), 'Atenção !', Mb_IconExclamation);
            End
         End
         Else
            Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
      End
      Else
         Application.MessageBox(pchar('Convênio -> ' + dblkpConvenio2.Text + ' não possui Parametrização definida. Verifique !'), 'Atenção !', Mb_IconExclamation)

         {               Else
                        Begin
                           Monitoramento('REMESSA BANCARIA', 3, 'FALHA AO GERAR REMESSA'); // Andre Imakawa - SIG 102321
                           Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' Não Gerado. Verifique !'), 'Atenção !', Mb_IconExclamation);
                        End;
                     End
                  End
                  Else
                  Begin
                     Monitoramento('REMESSA BANCARIA', 3, 'CONVENIO NAO POSSUI DIRETORIO DE DESTINO'); // Andre Imakawa - SIG 102321
                     Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
                  End;
               End
               Else
               Begin
                  Monitoramento('REMESSA BANCARIA', 3, 'CONVENIO NAO POSSUI PARAMETRIZACAO'); // Andre Imakawa - SIG 102321
                  Application.MessageBox(pchar('Convênio -> ' + dblkpConvenio2.Text + ' não possui Parametrização definida. Verifique !'), 'Atenção !', Mb_IconExclamation);
               End;   }
   End
   Else
      Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
   // Paulo Nobre - WO6194 - Fim
End;

Procedure TFrmRemessaEletronica.spbCancelarMovArqGeradoClick(Sender: TObject);
Var sNomeCompletoArquivoRemessa, sNomeCompletoArquivoSeguranca: String;
   bAtualiza, bRemove: Boolean;
Begin
   Inherited;
   If Not cdsMovArqGerado.isEmpty Then
   Begin
      If cdsMovArqGerado.fieldbyname('STATUS').asString <> 'Baixado' Then
      Begin
         If Application.MessageBox(pchar('Cancelar Geração do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
         Begin
            bAtualiza := False;
            bRemove := False;
            //
            // Excluindo o arquivo do diretório do Servidor
            //
            sNomeCompletoArquivoRemessa := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;
            sNomeCompletoArquivoSeguranca := cdsMovArqGerado.fieldbyname('PATHARQUIVOSEGURANCA').asString + '\' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString;

            // Paulo Nobre - WO6194 - Inicio
            //Cássio Rovaroto - SIG nº 73883 - Início
            Try
               If oRemessaEletronica.Impersonate Then
               Begin
                  If FileExists(sNomeCompletoArquivoRemessa) Then
                  Begin
                     If DeleteFile(sNomeCompletoArquivoRemessa) Then
                     Begin
                        bAtualiza := True;
                        bRemove := True;
                     End
                     Else
                        Application.MessageBox(pchar('Problemas ao Remover o Arquivo -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Tente Novamente'), 'Atenção !', Mb_IconExclamation);
                  End
                  Else
                  Begin
                     // Se existir no diretório de segurança, é porque já foi enviado à CEF
                     If FileExists(sNomeCompletoArquivoSeguranca) Then
                     Begin
                        If Application.MessageBox(pchar('Arquivo -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Não Removido do Servidor, pois já foi encaminhado para a CAIXA.' + #13 + #13 +
                           'Cancela a Geração do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' assim mesmo ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
                           bAtualiza := True;
                     End
                     Else                                   // Se não existir, é porque não foi gerado e enviado
                     Begin
                        If Application.MessageBox(pchar('Arquivo -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Não Encontrado no Servidor para ser Cancelado !' + #13 + #13 +
                           'Cancela a Geração do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' assim mesmo ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
                           bAtualiza := True;
                     End;
                  End;
                  RevertToSelf;
               End
            Except
               On E: Exception Do
               Begin
                  Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                  Exit;
               End;
            End;
            //Cássio Rovaroto - SIG nº 73883 - Fim
            // Paulo Nobre - WO6194 - Fim

            If bAtualiza Then
            Begin
               Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  // Paulo Nobre - WO6194 - Inicio
                  frmAguarde.pbAguarde.Visible := false;
                  frmAguarde.Mostra('Cancelando a Arquivo Gerado...');
                  Screen.Cursor := crSQLWait;
                  cdsMovArqGerado.DisableControls;
                  cdsMovArqGeradoDet.EnableControls;

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
                  //Cássio Rovaroto - SIG nº 60540 - Início

         //         If iIdModuloAcesso = 18 Then
                  qryAux2.SQL.add('SET FLGENVIADO = ''N''          '); // Não enviado
                  //        Else
                   //       Begin
                   //          qryAux2.SQL.add('SET DTCANCELAARQTXT = SYSDATE ');
                   //          qryAux2.SQL.add(', USUCANCELAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
                    //         qryAux2.SQL.add(', FLGENVIADO = ''C''          '); // Cancelado
                    //      End;
                          //Cássio Rovaroto - SIG nº 60540 - Fim
                  qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString);
                  qryAux2.ExecSQL;

                  //Cássio Rovaroto -  SIG nº 64071
                  //Exclui registros das tarifas bancárias associadas.
                  qryAux3.Close;
                  qryAux3.SQL.Clear;
                  qryAux3.SQL.Add('DELETE FROM TARIFAARQPAGTO ');
                  qryAux3.SQL.Add(' WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').AsString);
                  qryAux3.ExecSQL;

                  If dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.Commit;

                  If bRemove Then
                     Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + cdsMovArqGerado.fieldbyname('NOMEARQTXT').asString + ' <- Cancelado com Sucesso !'), 'Atenção !', Mb_IconExclamation)
                  Else
                     Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Cancelado com Sucesso !'), 'Atenção !', Mb_IconExclamation);

                  // Paulo Nobre - WO6194 - Inicio
                  frmAguarde.pbAguarde.Visible := false;
                  frmAguarde.Mostra('Atualizando os Arquivos Gerados...');

                  cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivoFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
                  //edilaine WO38027 : inicio
                  //cdsMovArqGeradoDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
                  SqlMovArqGeradoDet.Sql.text := oRemessaEletronica._SqlSelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
                  SqlMovArqGeradoDet.Open;
                  //edilaine WO38027 : fim

                  SqlMovArqCancelado.Open;
                  cdsMovArqCancelDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'C');

                  cdsMovArqGeradoDet.EnableControls;
                  cdsMovArqGerado.EnableControls;

                  Screen.Cursor := crDefault;
                  frmAguarde.pbAguarde.Visible := True;
                  frmAguarde.Apaga;
                  // Paulo Nobre - WO6194 - Fim
               Except
                  On E: Exception Do
                  Begin
                     If dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.RollBack;

                     cdsMovArqGeradoDet.EnableControls;
                     cdsMovArqGerado.EnableControls;
                     Screen.Cursor := crDefault;

                     frmAguarde.pbAguarde.Visible := True;
                     frmAguarde.Apaga;
                     Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                  End;
               End;
            End;
         End
      End
      Else
         Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
   End
   Else
      Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.spbImpMovArqGeradoClick(Sender: TObject);
Begin
   Inherited;
   If (Not cdsMovArqGerado.isEmpty) And (Not cdsMovArqGeradoDet.isEmpty) Then
   Begin
      cdsMovArqGerado.DisableControls;
      cdsMovArqGeradoDet.DisableControls;
      Screen.Cursor := crSQLWait;

      //edilaine WO38027 : inicio
      with qryRelADO do
      begin
        Close;
        ConnectionString := Autorizacao.getStringConexaoADO;
        SQL.clear;
        SQL.add(SqlMovArqGeradoDet.Sql.text);
        Open;
        Filter := 'IDARQUIVOPAGTO = '+cdsMovArqGerado.FieldByName('IDARQUIVOPAGTO').AsString;
        Filtered := true;
      end;
      DsRelatorio.DataSet:= qryRelADO;
      //edilaine WO38027 : fim

      qryEmpresa.Close;
      qryEmpresa.Open;
      qryBancoFUNCEF.Close;
      qryBancoFUNCEF.Open;
      TfrmPreview.CreateModalPreview(Application, rptMovArqGerado, rptMovArqGerado.PrinterSetup.DocumentName);
      qryEmpresa.Close;
      qryBancoFUNCEF.Close;
      cdsMovArqGerado.EnableControls;
      cdsMovArqGeradoDet.EnableControls;
      Screen.Cursor := crDefault;
   End
   Else
      Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.SpeedButton3Click(Sender: TObject);
Begin
   Inherited;
   qryDocumento.fieldbyname('IDCBANCARIA').Clear;
   qryCtaBancariaGeral.Close;
   qryCtaBancariaGeral.Open;
End;

Procedure TFrmRemessaEletronica.SpeedButton12Click(Sender: TObject);
Begin
   Inherited;
   If Not cdsMovArqGerado.isEmpty Then
   Begin
      qeMovArqGerado.FileName := sPathArquivosLog + '\ARQGERADOS_MOVIMENTO.XLS';
      qeMovArqGerado.Execute;
      cdsMovArqGerado.First;
   End;
End;

Procedure TFrmRemessaEletronica.SpeedButton13Click(Sender: TObject);
Begin
   Inherited;
   If Not cdsMovArqCancelado.isEmpty Then
   Begin
      qeMovCancelado.FileName := sPathArquivosLog + '\ARQCANCELADOS_MOVIMENTO.XLS';
      qeMovCancelado.Execute;
      cdsMovArqCancelado.First;
   End;
End;

Procedure TFrmRemessaEletronica.pcGeraArquivoOperChange(Sender: TObject);
Begin
   Inherited;
   // Paulo Nobre - WO6194

{   dblkpConvenio2.Clear;
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
}

End;

Procedure TFrmRemessaEletronica.dblkpConvenioEnter(Sender: TObject);
Begin
   Inherited;
   dblkpConvenio.Selected;
End;

Procedure TFrmRemessaEletronica.rdgTipoTituloClick(Sender: TObject);
Begin
   Inherited;
   If rdgTipoTitulo.itemindex = 0 Then                      // Ficha de Compensação
      qryMovTitulosNUMCODBARRAS.EditMask := '99999.99999 99999.999999 99999.999999 9 99999999999999;0; '
   Else                                                     // Arrecadação
      qryMovTitulosNUMCODBARRAS.EditMask := '99999999999-9 99999999999-9 99999999999-9 99999999999-9;0; ';

   If qryMovTitulos.state <> dsBrowse Then
   Begin
      dbeCodigoBarrasTitulos.Setfocus;
      dbeCodigoBarrasTitulos.SelectAll;
   End;
End;

Procedure TFrmRemessaEletronica.dblkpConvenio2Click(Sender: TObject);
Begin
   Inherited;
   dblkpConvenio2.DropDown;
End;

Procedure TFrmRemessaEletronica.dblkpConvenioClick(Sender: TObject);
Begin
   Inherited;
   dblkpConvenio.DropDown;
End;

Procedure TFrmRemessaEletronica.dblkpFormaPagtoClick(Sender: TObject);
Begin
   Inherited;
   dblkpFormaPagto.DropDown;
End;

Procedure TFrmRemessaEletronica.spbBaixarMovArqGeradoPendClick(Sender: TObject);
Begin
   Inherited;
   {If (Not cdsMovArqPendente.isEmpty) And (Not cdsMovArqPendDet.isEmpty) Then
     Begin
       If cdsMovArqPendente.fieldbyname('STATUS').asString <> 'Baixado' Then
         Begin
           If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
             Begin
               // Processar a Baixa dos Documentos Pendentes
               If _ProcessarBaixa('0',
                 cdsMovArqPendente.fieldbyname('NOME_CONVENIO').asString,
                 cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString,
                 cdsMovArqPendente.fieldbyname('CODPORTFORMA').asInteger,
                 cdsMovArqPendente.fieldbyname('VLRTOTAL').asFloat) Then
                 Begin
                   cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivoFB(cdsMovArqPendente.fieldbyname('CODPORTFORMA').asString, 'N');
                   cdsMovArqPendDet.Close;
                   cdsMovArqPendDet.Open;
                 End;
             End
         End
       Else
         Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqPendente.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
     End
   Else
     Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);  }
End;

Procedure TFrmRemessaEletronica.dbgMovArqGeradoPendDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
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

Procedure TFrmRemessaEletronica.spbBaixarMovArqGeradoClick(Sender: TObject);
Begin
   Inherited;
   {If (Not cdsMovArqGerado.isEmpty) And (Not cdsMovArqGeradoDet.isEmpty) Then
     Begin
       If cdsMovArqGerado.fieldbyname('STATUS').asString <> 'Baixado' Then
         Begin
           If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
             Begin
               // Processar a Baixa dos Documentos Gerados
               If _ProcessarBaixa('0',
                 cdsMovArqGerado.fieldbyname('NOME_CONVENIO').asString,
                 cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString,
                 cdsMovArqGerado.fieldbyname('CODPORTFORMA').asInteger,
                 cdsMovArqGerado.fieldbyname('VLRTOTAL').asFloat) Then
                 Begin
                   cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivoFB(cdsMovArqGerado.fieldbyname('CODPORTFORMA').asString, 'S');
                   cdsMovArqGeradoDet.Close;
                   cdsMovArqGeradoDet.Open;
                 End;
             End
         End
       Else
         Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);
     End
   Else
     Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation); }
End;

Procedure TFrmRemessaEletronica.dbgMovArqGeradoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
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

Procedure TFrmRemessaEletronica.dbgMovTitulosRowChanged(Sender: TObject);
Begin
   Inherited;
   If qryMovTitulos.State = dsBrowse Then
   Begin
      If qryMovTitulosFLGTIPOCODBARRAS.asString = 'F' Then  // Ficha de Compensação
         rdgTipoTitulo.itemindex := 0
      Else If qryMovTitulosFLGTIPOCODBARRAS.asString = 'A' Then // Arrecadação
         rdgTipoTitulo.itemindex := 1;
   End;
End;

Procedure TFrmRemessaEletronica.spbDesfazerBaixaClick(Sender: TObject);
Begin
   Inherited;
   {If Not cdsMovArqPendente.isEmpty Then
     Begin
       If cdsMovArqPendente.Locate('STATUS', 'Baixado', []) Then
         _ChamaFormDesfazerBaixa('P') // Pendente
       Else
         Application.MessageBox(MSG026, 'Atenção !', Mb_IconExclamation);
     End
   Else
     Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);}
End;

Procedure TFrmRemessaEletronica.spbDesfazerBaixa2Click(Sender: TObject);
Begin
   Inherited;
   {If Not cdsMovArqGerado.isEmpty Then
     Begin
       If cdsMovArqGerado.Locate('STATUS', 'Baixado', []) Then
         _ChamaFormDesfazerBaixa('G') // Gerado
       Else
         Application.MessageBox(MSG026, 'Atenção !', Mb_IconExclamation);
     End
   Else
     Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);}
End;

Function TFrmRemessaEletronica._ChamaFormDesfazerBaixa(pTipo: String): String;
Begin
   {AbrirFormModal(FrmAlteraExcluiPagto, TFrmAlteraExcluiPagto);

   Screen.Cursor := crSQLWait;
   If pTipo = 'P' Then // Pendente
     Begin
       cdsMovArqPendente.data := oRemessaEletronica._SelecionaMovArquivoFB(cdsMovArqPendente.fieldbyname('CODPORTFORMA').asString, 'N'); // Não
       cdsMovArqPendDet.Close;
       cdsMovArqPendDet.Open;
     End
   Else If pTipo = 'G' Then // Gerado
     Begin
       cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivoFB(cdsMovArqGerado.fieldbyname('CODPORTFORMA').asString, 'S'); // Sim
       cdsMovArqGeradoDet.Close;
       cdsMovArqGeradoDet.Open;
     End
   Else If pTipo = 'R' Then // Retorno
     Begin
       qryMovRetorno.Close;
       qryMovRetorno.Open;
     End;
   Screen.Cursor := crDefault;}
End;

Procedure TFrmRemessaEletronica.DbeCodigoBarrasGeralExit(Sender: TObject);
Begin
   Inherited;
   If (DbeCodigoBarrasGeral.text <> EmptyStr) And (length(trim(DbeCodigoBarrasGeral.text)) >= 47) Then
   Begin
      If rdgTipoTituloGeral.Itemindex = 0 Then              // Ficha de Compensação
      Begin
         If copy(DbeCodigoBarrasGeral.text, 34, 1) <> '0' Then
            edDtVenctoGeral.Text := datetostr(oRemessaEletronica._ExtrairDataVencimentoCodigoDeBarra(DbeCodigoBarrasGeral.text))
         Else
            edDtVenctoGeral.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);
      End
      Else                                                  // Arrecadação
         edDtVenctoGeral.Text := datetostr(cdsMovRemessa.fieldbyname('DATAPROGRAMADA').asDateTime);

      edValorGeral.value := oRemessaEletronica._ExtrairValorCodigoDeBarra(DbeCodigoBarrasGeral.text);
   End;
End;

Procedure TFrmRemessaEletronica.dbeValorPagtoExit(Sender: TObject);
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
         qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := '99.999.999\/9999\-99;0;_'
      Else
         qryMovTitulos.fieldbyname('NUMDOCUMENTO').EditMask := EmptyStr;
   End;
End;

Procedure TFrmRemessaEletronica.dbgMovRemessaTitleButtonClick(Sender: TObject; AFieldName: String);
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

Procedure TFrmRemessaEletronica.dbgMovRemessaCalcTitleImage(Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
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

Procedure TFrmRemessaEletronica.SpeedButton1Click(Sender: TObject);
Begin
   Inherited;
   If Not cdsMovArqFinalizado.isEmpty Then
   Begin
      qeMovFinalizado.FileName := sPathArquivosLog + '\ARQFINALIZADO_MOVIMENTO.XLS';
      qeMovFinalizado.Execute;
      cdsMovArqFinalizado.First;
   End;
End;

Procedure TFrmRemessaEletronica.spbLocalizaArqRetClick(Sender: TObject);
Var tArquivo: TextFile;
   iIniCampo, iTamCampo: Array[0..6] Of Integer;
   sLinha, sNSA, sDescMomento, sSegmento, sCodReg, sNumAutenticacao, sCodDocArq, sDataEfet, sValorEfet, sOcorrencias: String;
   dValor, dTotalLista: Double;
   iCodArqPagto: Integer;
Begin
   Inherited;

   //Cássio Rovaroto - SIG nº 64071 - Início
   //If dlgLocArqRetorno.Execute Then
     //If uppercase(dlgLocArqRetorno.FileName) <> EmptyStr Then
   If UpperCase(ret[cmbArqRetorno.ItemIndex].NomeArq) <> EmptyStr Then
   Begin
      //stCaminhoRet.Caption := dlgLocArqRetorno.FileName;
      Try
         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         iIniCampo[0] := 8; iTamCampo[0] := 1;              // Código do Registro
         iIniCampo[1] := 14; iTamCampo[1] := 1;             // Código do Segmento
         iIniCampo[5] := 231; iTamCampo[5] := 10;           // Ocorrências do Retorno

         dTotalLista := 0.00;
         iCodArqPagto := 0;
         sNSA := EmptyStr;
         sCodDocArq := EmptyStr;

         Cursor := crSQLWait;

         // Paulo Nobre - WO6194 - Inicio
         Try
            //Utilizando Inpersonate para acessar o arquivo de retorno...
            If oRemessaEletronica.Impersonate Then
            Begin
               // Processando o arquivo
               //AssignFile(tArquivo, dlgLocArqRetorno.FileName);
               AssignFile(tArquivo, ret[cmbArqRetorno.ItemIndex].NomeArq);
               Reset(tArquivo);
               While Not EOF(tArquivo) Do
               Begin
                  sDataEfet := EmptyStr;
                  sValorEfet := '0.00';
                  sOcorrencias := EmptyStr;
                  sNumAutenticacao := EmptyStr;

                  // Lendo linha dos dados
                  Readln(tArquivo, sLinha);

                  // Código do Registro
                  sCodReg := Copy(sLinha, iIniCampo[0], iTamCampo[0]);
                  // Código do Segmento (tipos de layouts)
                  sSegmento := Copy(sLinha, iIniCampo[1], iTamCampo[1]);

                  //Cássio Rovaroto - SIG nº 64071 - Início
                  // Se for o Cabeçalho do Arquivo, então pega o NSA
                  If sCodReg = '0' Then
                  Begin
                     //O NSA recuperado será inserido na tabela ARQUIVOPAGTO, para identicar o NSA do retorno.
                     sNSA := inttostr(strtoint(Copy(sLinha, 158, 6))); // NSA

                     // Pegando o IDARQUIVOPAGTO para atualizar a Grid dos Retornos
                  //   qryAux.Close;
                  //   qryAux.SQL.Clear;
                  //   qryAux.SQL.add('SELECT IDARQUIVOPAGTO           ');
                  //   qryAux.SQL.add('FROM ARQUIVOPAGTO               ');
                  //   qryAux.SQL.add('WHERE NSA = ' + sNSA);    // Número Sequencial do Arquivo
                  //   qryAux.Open;
                  //   iCodArqPagto := qryAux.fieldByname('IDARQUIVOPAGTO').asInteger;
                     iCodArqPagto := ret[cmbArqRetorno.ItemIndex].IdArquivoPagto;
                  End;

                  // Só processa se forem linhas de Movimento, tipo = '3' and <> de 'J52'
                  If (sCodReg = '3') And ((sSegmento + Copy(sLinha, 18, 2)) <> 'J52') Then
                  Begin
                     If (sSegmento = 'A') Or (sSegmento = 'J') Or (sSegmento = 'K') Or (sSegmento = 'Z') Then
                     Begin
                        If sSegmento = 'J' Then
                        Begin
                           iIniCampo[2] := 183; iTamCampo[2] := 6; // Número do Documento da Empresa
                           iIniCampo[3] := 145; iTamCampo[3] := 8; // Data da Efetivação
                           iIniCampo[4] := 153; iTamCampo[4] := 15; // Valor Real Efetivado
                        End
                        Else If (sSegmento = 'A') Or (sSegmento = 'K') Then
                        Begin
                           iIniCampo[2] := 74; iTamCampo[2] := 6; // Número do Documento da Empresa
                           iIniCampo[3] := 155; iTamCampo[3] := 8; // Data da Efetivação
                           iIniCampo[4] := 163; iTamCampo[4] := 15; // Valor Real Efetivado
                        End
                        Else                                // Segmento = 'Z'
                           iIniCampo[6] := 79; iTamCampo[6] := 25; // Número da Autenticação

                        // Segmento que contem o Número da Autenticação
                        If (sSegmento = 'Z') Then
                        Begin
                           sNumAutenticacao := quotedstr(trim(Copy(sLinha, iIniCampo[6], iTamCampo[6])));

                           qryAux2.Close;
                           qryAux2.SQL.Clear;
                           qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM               ');
                           qryAux2.SQL.add('SET AUTENTICACAO = ' + sNumAutenticacao);
                           qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
                           qryAux2.ExecSQL;

                           sCodDocArq := EmptyStr;
                        End
                        Else
                        Begin
                           // Número do Documento da Empresa (CODDOCARQ)
                           sCodDocArq := trim(inttostr(strtoint(Copy(sLinha, iIniCampo[2], iTamCampo[2]))));
                           // Data da Efetivação
                           If strtoint(Copy(sLinha, iIniCampo[3], iTamCampo[3])) <> 0 Then
                              sDataEfet := quotedstr(ColocaBarra(Copy(sLinha, iIniCampo[3], iTamCampo[3])));
                           // Valor Real Efetivado
                           If strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4])) <> 0 Then
                              sValorEfet := TrocaCaracter(floattostr((strtoint(Copy(sLinha, iIniCampo[4], iTamCampo[4]))) / 100), ',', '.');
                           // Ocorrências do Retorno
                           sOcorrencias := quotedstr(trim(Copy(sLinha, iIniCampo[5], iTamCampo[5])));

                           If (sCodDocArq <> EmptyStr) Then // Número do Documento da Empresa
                           Begin
                              // Atualizar a tabela com os dados do retorno
                              qryAux2.Close;
                              qryAux2.SQL.Clear;
                              qryAux2.SQL.add('UPDATE ARQUIVOXDOCUM            ');
                              qryAux2.SQL.add('SET                             ');
                              If (sDataEfet <> EmptyStr) Then // Data da Efetivação
                                 qryAux2.SQL.add('DATA_EFETIVACAO = ' + sDataEfet)
                              Else
                                 qryAux2.SQL.add('DATA_EFETIVACAO = NULL        ');

                              If (sValorEfet <> EmptyStr) Then // Valor Real Efetivado
                                 qryAux2.SQL.add(', VALOR_EFETIVADO = ' + sValorEfet)
                              Else
                                 qryAux2.SQL.add(', VALOR_EFETIVADO = 0.00      ');

                              qryAux2.SQL.add(', OCORRENCIA_RET = ' + sOcorrencias);
                              qryAux2.SQL.add('WHERE CODDOCARQ = ' + sCodDocArq);
                              qryAux2.ExecSQL;
                              //
                           End;
                        End;
                     End;
                  End;
               End;
               RevertToSelf;
            End
         Except
            On E: Exception Do
            Begin
               Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
               Exit;
            End;
         End;
         // Paulo Nobre - WO6194 - Fim

         // Finalizando o Lançamento
         qryAux2.Close;
         qryAux2.SQL.Clear;
         qryAux2.SQL.add('UPDATE ARQUIVOPAGTO            ');
         qryAux2.SQL.add('SET DTFINALIZAARQTXT = SYSDATE ');
         qryAux2.SQL.add(', USUFINALIZAARQTXT = ' + quotedstr(Sistema.NomeUsuario));
         qryAux2.SQL.add(', FLGENVIADO = ''F''           '); // Finalizado
         //Cássio - SIG nº 64071 - Início
         //Gravando o NSA do retorno....
         qryAux2.SQL.Add(', NSARET = ' + sNSA);
         //Cássio - SIG nº 64071 - Fim

         qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + inttostr(iCodArqPagto));
         qryAux2.ExecSQL;

         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;

         qryMovRetorno.DisableControls;
         qryMovRetorno.Close;
         qryMovRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
         qryMovRetorno.SQL.SaveToFile(sPathArquivosLog + '\SQL_SelMovRetorno.txt');
         qryMovRetorno.Open;
         If Not qryMovRetorno.IsEmpty Then
         Begin
            qryTotaisRetorno.Close;
            qryTotaisRetorno.ParamByName('IDARQUIVOPAGTO').asInteger := iCodArqPagto;
            qryTotaisRetorno.Open;
         End
         Else
            Application.MessageBox(MSG031, 'Atenção !', Mb_IconExclamation);

         qryMovRetorno.EnableControls;
         qryAux1.Close;
         qryAux2.Close;
         Cursor := crDefault;
         CloseFile(tArquivo);
      Except
         Begin
            CloseFile(tArquivo);
            Cursor := crDefault;
            Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
            Raise;
         End;
      End;
   End;
   //Cássio Rovaroto - SIG nº 64071 - Fim
End;

Procedure TFrmRemessaEletronica.dbgMovRetornoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
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

Procedure TFrmRemessaEletronica.spbBaixarMovRetornoClick(Sender: TObject);
Begin
   Inherited;
   If Not qryMovRetorno.isEmpty Then
   Begin
      qryMovRetorno.DisableControls;
      If Not qryMovRetorno.Locate('STATUS', 'Baixado', []) Then
      Begin
         If Application.MessageBox(pchar('Confirma Baixa do Arquivo Nº ' + qryMovRetorno.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
         Begin
            // Processar a Baixa dos Documentos de Retorno
            If _ProcessarBaixa('1',
               qryMovRetorno.fieldbyname('NOME_CONVENIO').asString,
               qryMovRetorno.fieldByname('IDARQUIVOPAGTO').asString,
               qryMovRetorno.fieldbyname('CODPORTFORMA').asInteger,
               qryTotaisRetorno.fieldbyname('VLR_EFETIVADO').asFloat
               ) Then
            Begin
               qryMovRetorno.Close;
               qryMovRetorno.Open;
            End;
         End
      End
      Else
         Application.MessageBox(pchar('Arquivo Nº ' + qryMovRetorno.fieldByname('IDARQUIVOPAGTO').asString + ' Já Baixado ! Para realizar esta Operação, é necessário desfazer a Baixa.'), 'Atenção !', Mb_IconExclamation);

      qryMovRetorno.First;
      qryMovRetorno.EnableControls;
   End
   Else
      Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.spbDesfazerBaixa3Click(Sender: TObject);
Begin
   Inherited;
   If Not qryMovRetorno.isEmpty Then
   Begin
      If qryMovRetorno.Locate('STATUS', 'Baixado', []) Then
         _ChamaFormDesfazerBaixa('R')                       // Retorno
      Else
         Application.MessageBox(MSG026, 'Atenção !', Mb_IconExclamation);
   End
   Else
      Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.SpeedButton2Click(Sender: TObject);
Begin
   Inherited;
   If Not cdsMovArqPendente.isEmpty Then
   Begin
      qeMovArqPend.FileName := sPathArquivosLog + '\ARQPENDENTE_MOVIMENTO.XLS';
      qeMovArqPend.Execute;
      cdsMovArqPendente.First;
   End;
End;

Procedure TFrmRemessaEletronica.SpeedButton9Click(Sender: TObject);
Begin
   Inherited;
   If Not qryMovRetorno.isEmpty Then
   Begin
      qeMovArqRet.FileName := sPathArquivosLog + '\ARQRETORNO_MOVIMENTO.XLS';
      qeMovArqRet.Execute;
      qryMovRetorno.First;
   End;
End;

Procedure TFrmRemessaEletronica.dbgMovArqFinalizadoDrawDataCell(Sender: TObject;
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

Procedure TFrmRemessaEletronica.dbgMovArqCanceladoDrawDataCell(
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

Procedure TFrmRemessaEletronica.spbImpMovArqRetornoClick(Sender: TObject);
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
            Else                                            // Sem Ocorrências
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

Procedure TFrmRemessaEletronica.ppGroupHeaderBand2BeforePrint(Sender: TObject);
Begin
   Inherited;
   If trim(qryMovRetorno.fieldbyname('TEVE_OCORRENCIA').asString) = 'SIM' Then
      pplblSit.Caption := 'Lançamentos COM Ocorrência(s):'
   Else
      pplblSit.Caption := 'Lançamentos SEM Ocorrência(s):';
End;

Procedure TFrmRemessaEletronica.spbExportaListaClick(Sender: TObject);
Begin
   Inherited;
   If Not qryMovListaFavorecidos.isEmpty Then
   Begin
      qeListaFavorecidos.FileName := sPathArquivosLog + '\REMESSA_LISTAFAVOREC.CSV';
      qeListaFavorecidos.Execute;
      qryMovListaFavorecidos.First;
   End;
End;

Procedure TFrmRemessaEletronica.spbRegerarArqClick(Sender: TObject);
Var sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC,
   sNomeCompletoArquivoRemessaServidor: String;
   sNSA: String;                                            //Cássio Rovaroto - SIG nº 75603
   sMsgErro: String;                                        //Cássio Rovaroto - SIG nº 114764
Begin
   Inherited;
   If (Not cdsMovArqGerado.isEmpty) And (Not cdsMovArqGeradoDet.isEmpty) Then
   Begin
      // Verificando se há parametrização específica do Convênio em questão
      If oRemessaEletronica._CarregaParamConvenio(dblkpConvenio2.LookupValue, sMsgErro) Then
      Begin
         If Not cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').isnull Then
         Begin
            If Application.MessageBox(pchar('Regerar Arquivo de Envio Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
            Begin
               //Everson Cunha - SIG84050 - Início
               If Copy(UpperCase(Sistema.AliasServidor), 1, 8) <> 'PRODUCAO' Then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
                  Application.MessageBox(pchar('Em bases de testes, os arquivos são gravados em C:\Planus\Temp\RemessaEletronica\Remessa\ '), 'Atenção !', MB_ICONEXCLAMATION + MB_OK);
               //Everson Cunha - SIG84050 - Fim

               sNSA := cdsMovArqGerado.fieldByname('NSA').asString; //Cássio Rovaroto - SIG nº 75603
               // Montando o nome do Arquivo
               Screen.Cursor := crSQLWait;
               qryAux1.Close;
               qryAux1.SQL.Clear;
               qryAux1.SQL.add('SELECT ''ACC.'' || TO_CHAR(SYSDATE, ''DDMMYYYY.'') || TRIM(CONV.NUMEMPRESABANCO) || ''.'' || LPAD(:pIDARQUIVOPAGTO, 6, ''0'') || ''.rem'' AS NOME_ARQ_REM ');
               qryAux1.SQL.add('FROM PORTADORFORMA PO   ');
               qryAux1.SQL.add('LEFT JOIN SEQREMESSA CONV ON PO.NUMEMPRESABANCO = CONV.NUMEMPRESABANCO ');
               qryAux1.SQL.add('WHERE PO.CODPORTFORMA =:pCODPORTFORMA ');
               //Cássio Rovaroto - SIG nº 73883 - Início
               //qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString;
               qryAux1.ParamByName('pIDARQUIVOPAGTO').AsString := sNSA; //Cássio Rovaroto - SIG nº 75603
               //Cássio Rovaroto - SIG nº 73883 - Fim
               qryAux1.ParamByName('pCODPORTFORMA').AsString := cdsMovArqGerado.fieldByname('CODPORTFORMA').asString;
               qryAux1.Open;
               Screen.Cursor := crDefault;

               sNomeArquivoGerado := qryAux1.fieldByname('NOME_ARQ_REM').asString;

               //Caminho de gravação dos arquivos

               //Everson Cunha - SIG84050 - Início
               //sNomeCompletoArquivoRemessa := cdsMovArqPendente.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;
               //sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
               If UpperCase(Copy(Sistema.AliasServidor, 1, 8)) = 'PRODUCAO' Then
               Begin
                  //Marcos Lima - 132207 - Inicio
                  sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\';
                  If Not DirectoryExists(sNomeCompletoArquivoRemessa) Then
                     ForceDirectories(sNomeCompletoArquivoRemessa);
                  sNomeCompletoArquivoRemessa := sNomeCompletoArquivoRemessa + sNomeArquivoGerado;
                  //sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;
                  //Marcos Lima - 132207 - Fim
                  sNomeCompletoArquivoRemessaServidor := cdsMovArqGerado.fieldbyname('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;
                  sNomeCompletoBackup := cdsMovArqPendente.fieldbyname('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
               End
               Else
               Begin
                  //Marcos Lima - 132207 - Inicio
                  sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\';
                  If Not DirectoryExists(sNomeCompletoArquivoRemessa) Then
                     ForceDirectories(sNomeCompletoArquivoRemessa);
                  sNomeCompletoArquivoRemessa := sNomeCompletoArquivoRemessa + sNomeArquivoGerado;
                  //sNomeCompletoArquivoRemessa := 'C:\Planus\Temp\RemessaEletronica\Remessa\' + sNomeArquivoGerado;
                  sNomeCompletoBackup := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivoGerado;
                  //Marcos Lima - 132207 - Fim
               End;
               //Everson Cunha = SIG84050 - Fim

               // Paulo Nobre - WO6194 - Inicio
               //Cássio Rovaroto - SIG nº 73883 - Início
               Try
                  If oRemessaEletronica.Impersonate Then
                  Begin
                     If FileExists(sNomeCompletoArquivoRemessa) Then
                        DeleteFile(sNomeCompletoArquivoRemessa);
                     RevertToSelf;
                  End
               Except
                  On E: Exception Do
                  Begin
                     Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                     Exit;
                  End;
               End;
               //Cássio Rovaroto - SIG nº 73883 - Fim
               // Paulo Nobre - WO6194 - Fim

               // ROTINAS PARA GERAR O ARQUIVO (_GerarArquivo)
               If oRemessaEletronica._CriaArquivo(sNomeCompletoArquivoRemessa) Then
               Begin
                  // Paulo Nobre - WO6194 - Inicio
                  Try
                     If Not dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.StartTransaction;

                     Screen.Cursor := crSQLWait;
                     cdsMovArqGerado.DisableControls;
                     cdsMovArqGeradoDet.EnableControls;

                     oRemessaEletronica._GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                        cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString,
                        cdsMovArqGerado.fieldByname('CODPORTFORMA').asString,
                        cdsMovArqGerado.fieldByname('NSA').asString); // Número Sequencial do Arquivo

                     // Atualizando o Movimento
                     qryAux2.Close;
                     qryAux2.SQL.Clear;
                     qryAux2.SQL.add('UPDATE ARQUIVOPAGTO                                         ');
                     qryAux2.SQL.add('SET DTGERACAOARQTXT = SYSDATE                               ');
                     qryAux2.SQL.add(', USUGERACAOARQTXT = ' + quotedstr(Sistema.NomeUsuario));
                     qryAux2.SQL.add(', NOMEARQTXT = ' + quotedstr(sNomeArquivoGerado));
                     qryAux2.SQL.add('WHERE IDARQUIVOPAGTO = ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString);
                     qryAux2.ExecSQL;

                     If dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.Commit;

                     //Cássio Rovaroto - SIG nº 73883 - Início
                     If oRemessaEletronica.Impersonate Then
                     Begin
                        //Everson Cunha - SIG84050 - Início
                        If Not DirectoryExists(ExtractFileDir(sNomeCompletoBackup)) Then
                           ForceDirectories(ExtractFileDir(sNomeCompletoBackup));
                        //Everson Cunha - SIG84050 - Fim
                        // Copiando o arquivo do diretório de remessa para o de backup
                        CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoBackup), False);

                        //Copia arquivo para o servidor, caso PRODUCAO
                        If UpperCase(Copy(Sistema.AliasServidor, 1, 8)) = 'PRODUCAO' Then
                        Begin
                           If Not DirectoryExists(ExtractFileDir(sNomeCompletoArquivoRemessaServidor)) Then
                              ForceDirectories(ExtractFileDir(sNomeCompletoArquivoRemessaServidor));
                           CopyFile(pchar(sNomeCompletoArquivoRemessa), pchar(sNomeCompletoArquivoRemessaServidor), False);
                        End;

                        RevertToSelf;
                     End;
                     //Cássio Rovaroto - SIG nº 73883 - Fim

                     Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' -> ' + sNomeArquivoGerado + ' <- Gerado com Sucesso !'), 'Atenção !', Mb_IconExclamation);

                     frmAguarde.pbAguarde.Visible := false;
                     frmAguarde.Mostra('Atualizando os Arquivos Gerados...');

                     cdsMovArqGerado.data := oRemessaEletronica._SelecionaMovArquivoFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
                     //edilaine WO38027 : inicio
                     //cdsMovArqGeradoDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
                     SqlMovArqGeradoDet.Sql.text := oRemessaEletronica._SqlSelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
                     SqlMovArqGeradoDet.Open;
                     //edilaine WO38027 : fim

                     qryAux.Close;
                     qryAux1.Close;
                     qryAux2.Close;

                     Screen.Cursor := crDefault;
                     cdsMovArqGeradoDet.EnableControls;
                     cdsMovArqGerado.EnableControls;

                     frmAguarde.pbAguarde.Visible := True;
                     frmAguarde.Apaga;
                  Except
                     On E: Exception Do
                     Begin
                        If dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.RollBack;

                        Screen.Cursor := crDefault;
                        cdsMovArqGerado.EnableControls;
                        cdsMovArqGeradoDet.EnableControls;

                        frmAguarde.pbAguarde.Visible := True;
                        frmAguarde.Apaga;
                        Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                     End;
                  End
                  // Paulo Nobre - WO6194 - Fim
               End
               Else
                  Application.MessageBox(pchar('Arquivo Nº ' + cdsMovArqGerado.fieldByname('IDARQUIVOPAGTO').asString + ' Não Gerado. Verifique !'), 'Atenção !', Mb_IconExclamation);
            End
         End
         Else
            Application.MessageBox(MSG022, 'Atenção !', Mb_IconExclamation);
      End
      Else
         Application.MessageBox(pchar('Convênio -> ' + dblkpConvenio2.Text + ' não possui Parametrização definida. Verifique !'), 'Atenção !', Mb_IconExclamation)
   End
   Else
      Application.MessageBox(MSG019, 'Atenção !', Mb_IconExclamation);
End;

Procedure TFrmRemessaEletronica.DblCodFormaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   If sFormaPagtoAnt <> DblCodForma.LookupValue Then
      bAltFormPagto := True;
End;

Procedure TFrmRemessaEletronica.DblCodFormaEnter(Sender: TObject);
Begin
   Inherited;
   sFormaPagtoAnt := DblCodForma.LookupValue;
End;

Procedure TFrmRemessaEletronica._InsereDocumentoXPessoa(pNome, pDocumento, pBanco, pAgencia, pConta, pTipoConta, pOperacao: String;
   pValor: double; pCodDocumento: Integer; pIdForCli: Integer);
Begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT SEQDOCXPESSOAS.NEXTVAL SEQ FROM DUAL    ');
   qryAux.Open;

   qryMovListaFavorecidos.Insert;
   //if cdsMovRemessa.fieldByname('CODDOCUMENTO').asInteger <> -1 then
   If pCodDocumento <> -1 Then
      qryMovListaFavorecidos.FieldByName('CODDOCUMENTO').AsInteger := pCodDocumento;
   qryMovListaFavorecidos.FieldByName('IDDOCUMENTOXPESSOAS').asInteger := qryAux.fieldByname('SEQ').asInteger;

   If pIdForCli <> -1 Then
      qryMovListaFavorecidos.FieldByName('IDFORCLI').AsInteger := pIdForCli
   Else
      qryMovListaFavorecidos.FieldByName('IDFORCLI').AsString := EmptyStr;

   qryMovListaFavorecidos.FieldByName('RAZAOSOCIAL').AsString := pNome;
   qryMovListaFavorecidos.FieldByName('NUMDOCUMENTO').AsString := pDocumento;
   qryMovListaFavorecidos.FieldByName('IDCBANCARIA').AsString := EmptyStr;
   qryMovListaFavorecidos.FieldByName('NUMBANCO').AsString := pBanco;
   qryMovListaFavorecidos.FieldByName('NUMAGENCIA').AsString := pAgencia;
   qryMovListaFavorecidos.FieldByName('NUMOPERACAO').AsString := pOperacao;
   qryMovListaFavorecidos.FieldByName('NUMCONTA').AsString := pConta;
   qryMovListaFavorecidos.FieldByName('TIPOCONTA').AsString := pTipoConta;
   qryMovListaFavorecidos.FieldByName('VALOR').AsFloat := pValor;
   qryMovListaFavorecidos.FieldByName('FLGIMPORTADO').AsString := 'S'; // Sim

   //if pCodForma <> -1 then
   //  qryMovListaFavorecidos.FieldByName('CODFORMA').AsInteger := pCodForma;

   //if pCodPortForma <> -1 then
   //  qryMovListaFavorecidos.FieldByName('CODPORTFORMA').AsInteger := pCodPortForma;

   //if pIdMotivo <> -1 then
   //  qryMovListaFavorecidos.FieldByName('IDMOTIVO').AsInteger := pIdMotivo;

   //if pDataProgramada <> -1 then
   //  qryMovListaFavorecidos.FieldByName('DATAPROGRAMADA').AsDateTime := pDataProgramada;

   qryMovListaFavorecidos.Post;
End;

Procedure TFrmRemessaEletronica._GetFavorecidosAutomatico(pIdModuloAcesso: Integer; pConvenio, pFormaPagto: String;
   pDataIni, pDataFim: TDateTime; pCodDocumento, pIdhstFolhaBenef: Integer);
Var
   cdsAux: TCMClientDataSet;
Begin
   cdsAux := TCMClientDataSet.Create(Nil);
   Try
      Case pIdModuloAcesso Of
         15: cdsAux.Data := oRemessaEletronica._GetFavorecidosEmp(pConvenio, pDataIni, pDataFim, pCodDocumento);
         18: cdsAux.Data := oRemessaEletronica._GetFavorecidosFB(pConvenio, pDataIni, pDataFim, pCodDocumento);
         21: cdsAux.Data := oRemessaEletronica._GetFavorecidosFP(pConvenio, pFormaPagto, pDataIni, pDataFim);
      End;

      If Not cdsAux.IsEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            cdsAux.First;
            While Not cdsAux.Eof Do
            Begin
               _InsereDocumentoXPessoa(cdsAux.FieldByName('NOME').asString,
                  cdsAux.FieldByname('CPF').asString,
                  cdsAux.FieldByName('NUMBANCO').AsString,
                  cdsAux.FieldByName('CODAGENCIA').AsString,
                  cdsAux.FieldByName('CONTA').AsString,
                  cdsAux.FieldByName('TIPOCONTA').asString,
                  cdsAux.FieldByName('NUMOPERACAO').asString,
                  cdsAux.FieldByName('LIQUIDO').asFloat,
                  cdsAux.FieldByName('CODDOCUMENTO').asInteger,
                  cdsAux.FieldByName('IDPESSOA').AsInteger);

               cdsAux.Next;
            End;
            qryMovListaFavorecidos.ApplyUpdates;

            If dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.Commit;

            qryMovListaFavorecidos.Close;
            qryMovListaFavorecidos.Open;
            qryMovListaFavorecidos.EnableControls;
            cdsMovRemessaAfterScroll(cdsMovRemessa);
         Except
            Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
         End;
      End;
   Finally
      FreeAndNil(cdsAux);
   End;
End;

Function TFrmRemessaEletronica._GetMovListaFavoritoFP: String;
Begin
   Result := 'SELECT DX.CODDOCUMENTO,  ' + #13#10 +
      '       DX.IDDOCUMENTOXPESSOAS,  ' + #13#10 +
      '       DX.IDFORCLI,  ' + #13#10 +
      '       DX.RAZAOSOCIAL,  ' + #13#10 +
      '       DX.NUMDOCUMENTO,  ' + #13#10 +
      '       CAST(CASE  ' + #13#10 +
      '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 11 THEN  ' + #13#10 +
      '         regexp_replace(LPAD(TRIM(DX.NUMDOCUMENTO), 11, ''0''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')  ' + #13#10 +
      '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 14 THEN  ' + #13#10 +
      '         regexp_replace(LPAD(TRIM(DX.NUMDOCUMENTO), 14, ''0''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')  ' + #13#10 +
      '       WHEN DX.NUMDOCUMENTO IS NULL THEN  ' + #13#10 +
      '         NULL  ' + #13#10 +
      '       END AS VARCHAR2(18)) CPF_CNPJ_MASC,  ' + #13#10 +
      '       DX.IDCBANCARIA,  ' + #13#10 +
      '       DX.NUMBANCO,  ' + #13#10 +
      '       DX.NUMAGENCIA,  ' + #13#10 +
      '       NVL(DX.NUMOPERACAO, 0) NUMOPERACAO,  ' + #13#10 +
      '       DX.NUMCONTA,  ' + #13#10 +
      '       DX.TIPOCONTA,  ' + #13#10 +
      '       DX.VALOR,  ' + #13#10 +
      '       DX.FLGIMPORTADO,  ' + #13#10 +
      '       DX.CODFORMA,  ' + #13#10 +
      '       DX.CODPORTFORMA,  ' + #13#10 +
      '       DX.IDMOTIVO,  ' + #13#10 +
      '       DX.DATAPROGRAMADA  ' + #13#10 +
      '  FROM DOCUMENTOXPESSOAS DX  ' + #13#10 +
      ' WHERE DX.CODFORMA = :CODPORTFORMA' + #13#10 +
      '   AND DX.CODPORTFORMA = :CODPORTFORMA' + #13#10 +
      '   AND DX.IDMOTIVO = :IDMOTIVO' + #13#10 +
      '   AND DX.DATAPROGRAMADA = :DATAPROGRAMADA' + #13#10 +
      ' ORDER BY DX.FLGIMPORTADO, DX.RAZAOSOCIAL, DX.VALOR';
End;

Function TFrmRemessaEletronica._GetMovListaFavoritoCP: String;
Begin
   Result := 'SELECT DX.CODDOCUMENTO,  ' + #13#10 +
      '       DX.IDDOCUMENTOXPESSOAS,  ' + #13#10 +
      '       DX.IDFORCLI,  ' + #13#10 +
      '       DX.RAZAOSOCIAL,  ' + #13#10 +
      '       DX.NUMDOCUMENTO,  ' + #13#10 +
      '       CAST(CASE  ' + #13#10 +
      '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 11 THEN  ' + #13#10 +
      '         regexp_replace(LPAD(TRIM(DX.NUMDOCUMENTO), 11, ''0''), ''([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'',''\1.\2.\3-\4'')  ' + #13#10 +
      '       WHEN LENGTH (TRIM(DX.NUMDOCUMENTO)) = 14 THEN  ' + #13#10 +
      '         regexp_replace(LPAD(TRIM(DX.NUMDOCUMENTO), 14, ''0''), ''([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'',''\1.\2.\3/\4-\5'')  ' + #13#10 +
      '       WHEN DX.NUMDOCUMENTO IS NULL THEN  ' + #13#10 +
      '         NULL  ' + #13#10 +
      '       END AS VARCHAR2(18)) CPF_CNPJ_MASC,  ' + #13#10 +
      '       DX.IDCBANCARIA,  ' + #13#10 +
      '       DX.NUMBANCO,  ' + #13#10 +
      '       DX.NUMAGENCIA,  ' + #13#10 +
      '       NVL(DX.NUMOPERACAO, 0) NUMOPERACAO,  ' + #13#10 +
      '       DX.NUMCONTA,  ' + #13#10 +
      '       DX.TIPOCONTA,  ' + #13#10 +
      '       DX.VALOR,  ' + #13#10 +
      '       DX.FLGIMPORTADO,  ' + #13#10 +
      '       DX.CODFORMA,  ' + #13#10 +
      '       DX.CODPORTFORMA,  ' + #13#10 +
      '       DX.IDMOTIVO,  ' + #13#10 +
      '       DX.DATAPROGRAMADA  ' + #13#10 +
      '  FROM DOCUMENTOXPESSOAS DX  ' + #13#10 +
      ' WHERE DX.CODDOCUMENTO = :CODDOCUMENTO' + #13#10 +
      ' ORDER BY DX.FLGIMPORTADO, DX.RAZAOSOCIAL, DX.VALOR';
End;

Procedure TFrmRemessaEletronica.ExibeCampos(iIdModulo: integer);
Begin
   // Paulo Nobre - WO6194 - Inicio
    //  If iIdModulo <> 3 Then
   //   Begin
   tbsAnManGeral.Enabled := False;
   btnAltGeral.Enabled := False;
   Dock977.Enabled := False;
   DblCodForma.Enabled := False;
   SpeedButton5.Enabled := False;
   SpeedButton3.Enabled := False;
   rdgTipoTituloGeral.Enabled := False;
   DbeCodigoBarrasGeral.Enabled := False;
   btnInc1.Enabled := False;
   btnAlt1.Enabled := False;
   btnExc1.Enabled := False;
   spbImportarMovLista.Enabled := False;
   spbLimparMovLista.Enabled := False;
   Label5.Visible := False;
   Image1.Visible := False;
   edSaldoListaFav.Visible := False;
   Dock973.Enabled := False;
   spbLocalizaFavorec.Enabled := False;
   spbBuscaContaCor.Enabled := False;
   dbeValorPagtoLista.Enabled := False;
   tbsAnManTitulos.Enabled := False;
   btnIncTit.Enabled := False;
   btnAltTit.Enabled := False;
   btnExcTit.Enabled := False;
   Label10.Visible := False;
   Image2.Visible := False;
   edSaldoTitulo.Visible := False;
   rdgTipoTitulo.Enabled := False;
   dbeCodigoBarrasTitulos.Enabled := False;
   dbDataVenctoBoleto.Enabled := False;
   dbeValorPagto.Enabled := False;
   dbCPFCNPJ.Enabled := False;
   Dock975.Enabled := False;
   spbBaixarMovArqGeradoPend.Visible := False;
   spbGerarArq.Left := spbBaixarMovArqGeradoPend.Left;
   spbDesfazerBaixa.Visible := False;
   spbBaixarMovArqGerado.Visible := False;
   spbImpMovArqGerado.Left := (spbRegerarArq.Left + 75);
   spbRegerarArq.Left := spbBaixarMovArqGerado.Left;
   spbDesfazerBaixa2.Visible := False;
   spbBaixarMovRetorno.Visible := False;
   spbImpMovArqRetorno.Left := spbBaixarMovRetorno.Left;
   spbDesfazerBaixa3.Visible := False;
   //  spbImpMovArqGerado.Visible := False;
     {   End
        Else
        Begin
           tbsAnManGeral.Visible := True;
           btnAltGeral.Visible := True;
           Dock977.Visible := True;
           DblCodForma.Enabled := True;
           SpeedButton5.Enabled := True;
           SpeedButton3.Enabled := True;
           rdgTipoTituloGeral.Enabled := True;
           DbeCodigoBarrasGeral.Enabled := True;
           btnInc1.Enabled := True;
           btnAlt1.Enabled := True;
           btnExc1.Enabled := True;
           spbImportarMovLista.Enabled := True;
           spbLimparMovLista.Enabled := True;
           Label5.Visible := True;
           Image1.Visible := True;
           edSaldoListaFav.Visible := True;
           tbsAnManTitulos.Enabled := True;
           btnIncTit.Enabled := True;
           btnAltTit.Enabled := True;
           btnExcTit.Enabled := True;
           Label10.Visible := True;
           Image2.Visible := True;
           edSaldoTitulo.Visible := True;
           rdgTipoTitulo.Enabled := True;
           dbeCodigoBarrasTitulos.Enabled := True;
           dbDataVenctoBoleto.Enabled := True;
           dbeValorPagto.Enabled := True;
           dbCPFCNPJ.Enabled := True;
           Dock975.Enabled := True;
           spbBaixarMovArqGeradoPend.Enabled := True;
           spbDesfazerBaixa.Enabled := True;
           spbBaixarMovArqGerado.Enabled := True;
           spbDesfazerBaixa2.Enabled := True;
           spbBaixarMovRetorno.Enabled := True;
           spbDesfazerBaixa3.Enabled := True;
        End;}
     // Paulo Nobre - WO6194 - Fim
End;

//procedure TFrmRemessaEletronica.ExlcuiFavorecidosNaoGerados;                        //Everson Cunha - SIG117008

Procedure TFrmRemessaEletronica.ExcluiFavorecidosNaoGerados(pCodDocumentos: String); //Everson Cunha - SIG117008
Var
   sSQL: String;
Begin
   sSQL := 'DELETE FROM DOCUMENTOXPESSOAS DX WHERE NOT EXISTS(SELECT 1 FROM ARQUIVOXDOCUM AD WHERE AD.ID_DOC_CODBARRAS_PESSOAS = DX.IDDOCUMENTOXPESSOAS)' +
      ' AND DX.CODDOCUMENTO IN (' + pCodDocumentos + ') AND DX.FLGIMPORTADO = ''S'' '; //Everson Cunha - SIG117008
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      qryAux.Close;
      qryAux.SQL.Text := sSQL;
      qryAux.ExecSQL;

      If dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Commit;
   Except
      Begin
         Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
         Raise;
      End;
   End;
End;

Procedure TFrmRemessaEletronica.bbtnSairClick(Sender: TObject);
Begin
   //ExlcuiFavorecidosNaoGerados; //Everson Cunha - SIG117008

   Inherited;
End;

Function TFrmRemessaEletronica._GetValorPlano(
   pIdPlanoPrev: Integer): Double;
Var
   dValorPlano: Double;
Begin
   dValorPlano := 0.00;

   qryMovListaFavorecidos.Filtered := False;
   qryMovListaFavorecidos.Filter := 'IDPLANOPREV = ' + IntToStr(pIdPlanoPrev);
   qryMovListaFavorecidos.Filtered := True;

   qryMovListaFavorecidos.First;
   While Not qryMovListaFavorecidos.Eof Do
   Begin
      If Not qryMovListaFavorecidos.FieldByName('VALOR').IsNull Then
         dValorPlano := dValorPlano + qryMovListaFavorecidos.FieldByName('VALOR').AsFloat;
      qryMovListaFavorecidos.Next;
   End;
   qryMovListaFavorecidos.Filtered := False;
   qryMovListaFavorecidos.First;

   Result := dValorPlano;
End;

Procedure TFrmRemessaEletronica.dbLkpConvenioRetClick(Sender: TObject);
Begin
   Inherited;
   dbLkpConvenioRet.DropDown;
End;

Procedure TFrmRemessaEletronica.dbLkpConvenioRetCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Var
   cdsAux: TCMClientDataSet;
Begin
   Inherited;

   If dbLkpConvenioRet.LookupValue <> '' Then
   Begin
      cdsAux := TCMClientDataSet.Create(Nil);
      Try
         cmbArqRetorno.Clear;
         txtNSA.Caption := EmptyStr;
         //cmbArqRetorno.ItemIndex := -1;

         cdsAux.Data := oRemessaEletronica._GetArquivoRetorno(dbLkpConvenioRet.LookupValue);

         If Not cdsAux.IsEmpty Then
         Begin
            cdsAux.First;
            While Not cdsAux.Eof Do
            Begin
               _RecuperaArquivosRetorno(cdsAux.FieldByName('CAMINHOARQ').AsString,
                  cdsAux.FieldByName('ARQUIVO').AsString,
                  cdsAux.FieldByName('NSA').AsInteger,
                  cdsAux.FieldByName('IDARQUIVOPAGTO').AsInteger);
               cdsAux.Next;
            End;
         End
         Else
         Begin
            Application.MessageBox(MSG035, 'Atenção !', Mb_IconExclamation);
            dbLkpConvenioRet.SetFocus;
            Exit;
         End;

         If cmbArqRetorno.Items.Count <= 0 Then
         Begin
            Application.MessageBox(MSG036, 'Atenção !', MB_ICONEXCLAMATION);
            dbLkpConvenioRet.SetFocus;
            Exit;
         End;
      Finally
         FreeAndNil(cdsAux);
      End;
   End;
End;

Procedure TFrmRemessaEletronica._RecuperaArquivosRetorno(pCaminhoRet,
   pNomeArquivo: String; pNSA, pIdArquivoPagto: Integer);
Var
   searchResultRet: TSearchRec;
   sCaminhoRet: String;
Begin
   sCaminhoRet := pCaminhoRet + '\' + pNomeArquivo;

   // Paulo Nobre - WO6194 - Inicio
   Try
      If oRemessaEletronica.Impersonate Then
      Begin
         If FindFirst(sCaminhoRet, faArchive, searchResultRet) = 0 Then
         Begin
            cmbArqRetorno.Items.Add(searchResultRet.Name);
            iInd := iInd + 1;
            SetLength(ret, iInd);
            ret[iInd - 1].IdArquivoPagto := pIdArquivoPagto;
            ret[iInd - 1].NomeArq := sCaminhoRet;
            ret[iInd - 1].NSA := pNSA;
            FindClose(searchResultRet);
         End;
         RevertToSelf;
      End
   Except
      On E: Exception Do
      Begin
         Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
         Exit;
      End;
   End;
   // Paulo Nobre - WO6194 - Fim
End;

Procedure TFrmRemessaEletronica.cmbArqRetornoChange(Sender: TObject);
Begin
   Inherited;
   //sCaminhoRetorno := ret[cmbArqRetorno.ItemIndex].NomeArq;
   txtNSA.Caption := oRemessaEletronica._CompletaZeroEsq(IntToStr(ret[cmbArqRetorno.ItemIndex].NSA), 6);
End;

Procedure TFrmRemessaEletronica._RegistraTarifaBancaria(pIdArquivoPagto,
   pIdModuloAcesso: Integer);
Var
   sSQL: String;
Begin
   sSQL := ' SELECT AD.IDARQUIVOPAGTO, NVL(DP.CODDOCUMENTO, AD.ID_DOC_CODBARRAS_PESSOAS) AS CODLINHA   ' + #13#10 +
      '   FROM ARQUIVOXDOCUM AD                                                                   ' + #13#10 +
      '   LEFT JOIN DOCUMENTOXPESSOAS DP ON DP.IDDOCUMENTOXPESSOAS = AD.ID_DOC_CODBARRAS_PESSOAS  ' + #13#10 +
      '  WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto) + #13#10 +
      '  GROUP BY AD.IDARQUIVOPAGTO, NVL(DP.CODDOCUMENTO, AD.ID_DOC_CODBARRAS_PESSOAS)            ';

   qryAux1.Close;
   qryAux1.SQL.Clear;
   qryAux1.SQL.Add(sSQL);
   qryAux1.Open;

   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      qryAux.First;
      While Not qryAux.Eof Do
      Begin
         Case pIdModuloAcesso Of
            3: _SetTarifaBancariaCaP(pIdArquivoPagto, qryAux1.FieldByName('CODLINHA').asInteger);
            15: _SetTarifaBancariaEmp(pIdArquivoPagto, qryAux1.FieldByName('CODLINHA').asInteger);
            18: _SetTarifaBancariaFB(pIdArquivoPagto, qryAux1.FieldByName('CODLINHA').asInteger);
         End;
         qryAux.Next;
      End;

      If dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.Commit;
   Except
      On e: Exception Do
      Begin
         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Rollback;

         Application.MessageBox(pChar(e.Message), 'Atenção!', MB_ICONEXCLAMATION);
      End;
   End;
End;

Procedure TFrmRemessaEletronica._SetTarifaBancariaCaP(
   pIdArquivoPagto, pCodDocumento: Integer);
Var
   sSQL: String;
Begin
   sSQL := 'INSERT INTO TARIFAARQPAGTO(IDTARIFAARQPAGTO, IDARQUIVOPAGTO, CODDOCARQ, IDPLANOPREV, PERCENTUAL) ' + #13#10 +
      '       SELECT SEQTARIFAARQPAGTO.NEXTVAL,                                                         ' + #13#10 +
      '              AD.IDARQUIVOPAGTO,                                                                 ' + #13#10 +
      '              AD.CODDOCARQ,                                                                      ' + #13#10 +
      '              AR.IDPLANOPREV,                                                                    ' + #13#10 +
      '              AR.VALOR                                                                           ' + #13#10 +
      '         FROM ARQUIVOXDOCUM AD                                                                   ' + #13#10 +
      '         JOIN (SELECT R.CODDOCUMENTO, (SUM(R.VALOR) / RT.VALOR) AS VALOR, R.IDPLANOPREV          ' + #13#10 +
      '                 FROM RATEIODOCUM R                                                              ' + #13#10 +
      '                 JOIN (SELECT CODDOCUMENTO, SUM(VALOR) AS VALOR                                  ' + #13#10 +
      '                         FROM RATEIODOCUM                                                        ' + #13#10 +
      '                        GROUP BY CODDOCUMENTO) RT                                                ' + #13#10 +
      '                   ON RT.CODDOCUMENTO = R.CODDOCUMENTO                                           ' + #13#10 +
      '                 WHERE R.CODDOCUMENTO = ' + IntToStr(pCodDocumento) + #13#10 +
      '                 GROUP BY R.CODDOCUMENTO, R.IDPLANOPREV, RT.VALOR) AR                            ' + #13#10 +
      '           ON AR.CODDOCUMENTO = AD.ID_DOC_CODBARRAS_PESSOAS                                      ' + #13#10 +
      '        WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto);

   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(sSQL);
   qryAux2.SQL.SaveToFile(sPathArquivosLog + '\SQL_InsereTarifaBancoCap.txt');
   qryAux2.ExecSQL;

End;

Procedure TFrmRemessaEletronica._SetTarifaBancariaEmp(
   pIdArquivoPagto, pCodDocumento: Integer);
Var
   sSQL: String;
Begin
   sSQL := 'INSERT INTO TARIFAARQPAGTO(IDTARIFAARQPAGTO, IDARQUIVOPAGTO, CODDOCARQ, IDPLANOPREV, PERCENTUAL) ' + #13#10 +
      '     SELECT SEQTARIFAARQPAGTO.NEXTVAL,                                                           ' + #13#10 +
      '            IDARQUIVOPAGTO,                                                                      ' + #13#10 +
      '            CODDOCARQ,                                                                           ' + #13#10 +
      '            IDPLANOPREV,                                                                         ' + #13#10 +
      '            1                                                                                    ' + #13#10 +
      '       FROM (SELECT AD.IDARQUIVOPAGTO,                                                           ' + #13#10 +
      '                    AD.CODDOCARQ,                                                                ' + #13#10 +
      '                    CE.IDPLANOORIGEM  AS IDPLANOPREV                                             ' + #13#10 +
      '               FROM ARQUIVOXDOCUM AD                                                             ' + #13#10 +
      '               JOIN DOCUMENTOXPESSOAS DP                                                         ' + #13#10 +
      '                 ON DP.IDDOCUMENTOXPESSOAS = AD.ID_DOC_CODBARRAS_PESSOAS                         ' + #13#10 +
      '               JOIN CONTRATOEMPTMO CE                                                            ' + #13#10 +
      '                 ON CE.IDBENEF = DP.IDFORCLI                                                     ' + #13#10 +
      '               JOIN HMECONCESSAO HC                                                              ' + #13#10 +
      '                 ON HC.IDCONTRATOEMPTMO = CE.IDCONTRATOEMPTMO                                    ' + #13#10 +
      '               JOIN HMEENVIO HE                                                                  ' + #13#10 +
      '                 ON HE.IDHISTMOVEMPTMO = HC.IDHISTMOVEMPTMO                                      ' + #13#10 +
      '                AND HE.CODDOCUMENTO = DP.CODDOCUMENTO                                            ' + #13#10 +
      '              WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto) + #13#10 +
      '              GROUP BY AD.IDARQUIVOPAGTO,                                                        ' + #13#10 +
      '                       AD.CODDOCARQ,                                                             ' + #13#10 +
      '                       CE.IDPLANOORIGEM)                                                         ';

   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(sSQL);
   qryAux2.SQL.SaveToFile(sPathArquivosLog + '\SQL_InsereTarifaBancoEmp.txt');
   qryAux2.ExecSQL;
End;

Procedure TFrmRemessaEletronica._SetTarifaBancariaFB(
   pIdArquivoPagto, pCodDocumento: Integer);
Var
   sSQL: String;
Begin
   sSQL := 'INSERT INTO TARIFAARQPAGTO(IDTARIFAARQPAGTO, IDARQUIVOPAGTO, CODDOCARQ, IDPLANOPREV, PERCENTUAL)              ' + #13#10 +
      '       SELECT SEQTARIFAARQPAGTO.NEXTVAL,                                                                      ' + #13#10 +
      '              AD.IDARQUIVOPAGTO,                                                                              ' + #13#10 +
      '              AD.CODDOCARQ,                                                                                   ' + #13#10 +
      '              PR.IDPLANOPREV,                                                                                 ' + #13#10 +
      '              PR.PROVENTO                                                                                     ' + #13#10 +
      '         FROM ARQUIVOXDOCUM AD                                                                                ' + #13#10 +
      '         JOIN DOCUMENTOXPESSOAS DP                                                                            ' + #13#10 +
      '           ON DP.IDDOCUMENTOXPESSOAS = AD.ID_DOC_CODBARRAS_PESSOAS                                            ' + #13#10 +
      '         JOIN (SELECT HS.IDRESPONSAVEL,                                                                       ' + #13#10 +
      '                      HS.CODDOCUMENTO,                                                                        ' + #13#10 +
      '                      (HS.PROVENTO/ HT.PROVENTO) AS PROVENTO,                                                 ' + #13#10 +
      '                      HS.IDPLANOPREV                                                                          ' + #13#10 +
      '                 FROM (SELECT HS.IDRESPONSAVEL,                                                               ' + #13#10 +
      '                              HS.CODDOCUMENTO,                                                                ' + #13#10 +
      '                              HS.IDPLANOPREV,                                                                 ' + #13#10 +
      '                               SUM(DECODE(PR.FLGDESCONTO,0,                                                   ' + #13#10 +
      '                                          DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0),                        ' + #13#10 +
      '                                                 DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0))) AS PROVENTO ' + #13#10 +
      '                         FROM HISTRUBSAL HS                                                                   ' + #13#10 +
      '                         JOIN PROVDESC PR ON PR.IDPROVENTO = HS.IDRUBRICA                                     ' + #13#10 +
      '                        WHERE HS.CODDOCUMENTO = ' + IntToStr(pCodDocumento) + #13#10 +
      '                        GROUP BY HS.IDRESPONSAVEL, HS.CODDOCUMENTO, HS.IDPLANOPREV) HS                        ' + #13#10 +
      '                 JOIN (SELECT IDRESPONSAVEL, CODDOCUMENTO, SUM(PROVENTO) AS PROVENTO                          ' + #13#10 +
      '                         FROM (SELECT H.IDRESPONSAVEL, H.CODDOCUMENTO, H.IDPLANOPREV,                         ' + #13#10 +
      '                                      SUM(DECODE(P.FLGDESCONTO,0,                                             ' + #13#10 +
      '                                      DECODE(P.FLGESPECIAL,0,H.VALORPROVENTO,0),                              ' + #13#10 +
      '                                             DECODE(P.FLGESPECIAL,0,H.VALORPROVENTO*-1,0))) AS PROVENTO       ' + #13#10 +
      '                                 FROM HISTRUBSAL H                                                            ' + #13#10 +
      '                                 JOIN PROVDESC P ON P.IDPROVENTO = H.IDRUBRICA                                ' + #13#10 +
      '                                WHERE H.CODDOCUMENTO = ' + IntToStr(pCodDocumento) + #13#10 +
      '                                GROUP BY H.IDRESPONSAVEL, H.CODDOCUMENTO, H.IDPLANOPREV)                      ' + #13#10 +
      '                        WHERE PROVENTO >= 0.01                                                                ' + #13#10 +
      '                        GROUP BY IDRESPONSAVEL, CODDOCUMENTO) HT                                              ' + #13#10 +
      '                   ON HT.CODDOCUMENTO = HS.CODDOCUMENTO                                                       ' + #13#10 +
      '                  AND HT.IDRESPONSAVEL = HS.IDRESPONSAVEL                                                     ' + #13#10 +
      '                WHERE HS.PROVENTO >= 0.01) PR                                                                 ' + #13#10 +
      '           ON PR.IDRESPONSAVEL = DP.IDFORCLI                                                                  ' + #13#10 +
      '          AND PR.CODDOCUMENTO = DP.CODDOCUMENTO                                                               ' + #13#10 +
      '        WHERE AD.IDARQUIVOPAGTO = ' + IntToStr(pIdArquivoPagto);

   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.Add(sSQL);
   qryAux2.SQL.SaveToFile(sPathArquivosLog + '\SQL_InsereTarifaBancoFb.txt');
   qryAux2.ExecSQL;
End;

// Paulo Nobre - WO15743 - Inicio
Procedure TFrmRemessaEletronica.cbbMesPagtoChange(Sender: TObject);
Begin
   Inherited;
   If rgTipoPagtoFolha.ItemIndex = 0 Then
      SelecionaVersaoFolha
   Else
   begin
      SelecionaConvenio(rgTipoPagtoFolha.ItemIndex, FormatFloat('00', cbbMesPagto.ItemIndex) + '/' + IntToStr(seAnoPagto.Value));
      dblkpConvenio2.DropDown;
      dblkpConvenio2.AutoDropDown := True;
   end;
End;

Procedure TFrmRemessaEletronica.seAnoPagtoExit(Sender: TObject);
Begin
   Inherited;
   If rgTipoPagtoFolha.ItemIndex = 0 Then
      SelecionaVersaoFolha
   Else
   begin
      SelecionaConvenio(rgTipoPagtoFolha.ItemIndex, FormatFloat('00', cbbMesPagto.ItemIndex) + '/' + IntToStr(seAnoPagto.Value));
      dblkpConvenio2.DropDown;
      dblkpConvenio2.AutoDropDown := True;
   end;
End;

Procedure TFrmRemessaEletronica.SelecionaVersaoFolha;
Var
   sAnoMes, sSQL: String;
Begin
   If (cbbMesPagto.ItemIndex < 10) Then
      sAnoMes := IntToStr(seAnoPagto.Value) + '/0' + IntToStr(cbbMesPagto.ItemIndex)
   Else
      sAnoMes := IntToStr(seAnoPagto.Value) + '/' + IntToStr(cbbMesPagto.ItemIndex);

   cdsVersaoFolha.Data := oRemessaEletronica._GetVersaoFolha(sAnoMes);
End;

Procedure TFrmRemessaEletronica.SelecionaConvenio(pTipoFolhaPagto: integer; pPeriodo: String);
Begin
   dblkpConvenio2.Text := '';

   If pTipoFolhaPagto = 0 Then
      cdsConvenio.Data := oRemessaEletronica._GetConvenioFolha(StrToInt(dblkpVersaoFolha.LookupValue))
   Else
     cdsConvenio.Data := oRemessaEletronica._ListaConveniosFolha(pPeriodo);
End;
// Paulo Nobre - WO15743 - Fim

Procedure TFrmRemessaEletronica.dblkpVersaoFolhaClick(Sender: TObject);
Begin
   Inherited;
   If trim(cbbMesPagto.Text) = '' Then
   Begin
      cbbMesPagto.SetFocus;
      Exit;
   End;
End;

Procedure TFrmRemessaEletronica.dblkpVersaoFolhaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Inherited;
   Accept := False;
End;

Procedure TFrmRemessaEletronica.dblkpVersaoFolhaCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   If dblkpVersaoFolha.LookupValue <> EmptyStr Then
   begin
      SelecionaConvenio(rgTipoPagtoFolha.ItemIndex, FormatFloat('00', cbbMesPagto.ItemIndex) + '/' + IntToStr(seAnoPagto.Value));
      dblkpConvenio2.DropDown;                  // Paulo Nobre - WO15743
      dblkpConvenio2.AutoDropDown := True;      // Paulo Nobre - WO15743
   end;                                                                 
End;

// Paulo Nobre - WO15743 - Inicio
Procedure TFrmRemessaEletronica.rgTipoPagtoFolhaClick(Sender: TObject);
Begin
   Inherited;

   // Paulo Nobre - MIGRACAO-ORACLE-2025 (TAS000000007069) - Inicio
   cdsMovArqPendente.Active := False;
   SqlMovArqPendente.Open;
   cdsMovArqPendDet.Active := False;
   SqlMovArqPendDet.Open;

   cdsMovArqGerado.Active := False;
   SqlMovArqGerado.Open;
   cdsMovArqGeradoDet.Active := False;
   SqlMovArqGeradoDet.Open;
   // Paulo Nobre - MIGRACAO-ORACLE-2025 (TAS000000007069) - Fim

   If rgTipoPagtoFolha.ItemIndex = 0 Then
   Begin
      //   lblVersaoFolha.Left := 412;
      lblVersaoFolha.Visible := True;
      //  dblkpVersaoFolha.Left := 412;
      dblkpVersaoFolha.Visible := True;

      //    Label17.Left := 550;
      //    dblkpConvenio2.Left := 550;
      If cbbMesPagto.itemindex <> 0 Then
         SelecionaVersaoFolha;
   End
   Else
   Begin
      lblVersaoFolha.Visible := False;
      dblkpVersaoFolha.Visible := False;
      btnLimparFCClick(Self);

      SelecionaConvenio(rgTipoPagtoFolha.ItemIndex, FormatFloat('00', cbbMesPagto.ItemIndex) + '/' + IntToStr(seAnoPagto.Value));
      dblkpConvenio2.DropDown;
      dblkpConvenio2.AutoDropDown := True;

      //    Label17.Left := 412;
       //   dblkpConvenio2.Left := 412;
   End;
End;
// Paulo Nobre - WO15743 - Fim

// Andre Imakawa - SIG 102321 - Inicio
Procedure TFrmRemessaEletronica.Monitoramento(pRotina: String; ptipo: Integer; pErro: String = '');
Var lParams: TStringList;
   lResponse: TStringStream;
   sHeader, sUsuario, sHorario, sErro, sMensagem, sIdExec: String;
   dia: TDateTime;
   sGrupo, sQuebra: String;                                 // Andre Imakawa - SIG 96394
   sMaquina, sRetorno: String;
Begin
   Inherited;

   sQuebra := ' \ue008\ue007\ue000';

   If Copy(UpperCase(Sistema.AliasServidor), 1, 8) <> 'PRODUCAO' Then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
      sGrupo := 'Checklist Sistemas'
   Else
      sGrupo := 'Monitoramento';

   Try
      Try

         Case ptipo Of
            0: sHeader := ' - INICIO';
            1: sHeader := ' - FIM';
         End;
         sHeader := sHeader + '';

         sUsuario := 'USUARIO: ' + Sistema.NomeUsuario;
         sHorario := 'HORARIO: ' + formatdatetime('dd/mm/yyyy hh:nn:ss', now);
         sMaquina := 'MAQUINA: ' + UpperCase(trim(FuncaoGeral.GetNomeComputador));

         Case ptipo Of
            2: sErro := 'MSG: ' + pErro;
            3: sErro := pErro;
         End;

         lParams := TStringList.Create;
         lResponse := TStringStream.Create('');

         Case ptipo Of
            0, 1: sMensagem := '{"numero":"' + sGrupo + '","mensagem":"' + pRotina + sHeader + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina + '"}';
            2: sMensagem := '{"numero":"' + sGrupo + '","mensagem":"' + pRotina + sHeader + sQuebra + sErro + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina + '"}';
            3: sMensagem := '{"numero":"' + sGrupo + '","mensagem":"' + pRotina + sQuebra + sUsuario + sQuebra + sMaquina + sQuebra + sErro + '"}';
         End;

         //FuncaoGeral.EnviaMonitoramento('http://mw.funcef.com.br:5000/api/envia', 'application/json', sMensagem); // Andre Imakawa - SIG 82710
         FuncaoGeral.RequestAPI('http://mw.funcef.com.br:5000/api/envia', sMensagem, sRetorno, 'application/json', ''); // Andre Imakawa - SIG 102321
      Except
         On E: Exception Do
         Begin
            Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
         End;
      End;
   Finally
      FreeAndNil(lParams);
      FreeAndNil(lResponse);
   End;
End;
// Andre Imakawa - SIG 102321 - Fim

// Paulo Nobre - WO6194 - Inicio

Procedure TFrmRemessaEletronica.spbSelMovArquivosClick(Sender: TObject);
Var bSemMov: Boolean;
Begin
   Inherited;

   if (dblkpVersaoFolha.Text <> '') and (dblkpConvenio2.Text = EmptyStr) then
   begin
     Application.MessageBox(pchar('Informando a Folha, é obrigatório, também, informar o Convênio.'), 'Atenção !', Mb_IconExclamation);
     dblkpConvenio2.SetFocus;
     Exit;
   end;

   sAnoMesPagto := IntToStr(seAnoPagto.Value) + FormatFloat('00', cbbMesPagto.ItemIndex);

   bSemMov := False;

   Application.ProcessMessages;
   frmAguarde.pbAguarde.Visible := false;
   frmAguarde.Mostra('Selecionando os Arquivos ' + pcGeraArquivoOper.ActivePage.Caption + '...');

   Try
      If pcGeraArquivoOper.ActivePage = tbsGAPendentes Then
      Begin
         cdsMovArqPendente.DisableControls;
         cdsMovArqPendDet.DisableControls;
         cdsMovArqPendente.Data := oRemessaEletronica._SelecionaMovArquivoFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'N');
         If Not cdsMovArqPendente.isEmpty Then
         Begin
            cdsMovArqPendDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'N');

            cdsMovArqPendente.EnableControls;
            cdsMovArqPendDet.EnableControls;
         End
         Else
            bSemMov := True;
      End;

      If pcGeraArquivoOper.ActivePage = tbsGAGerados Then
      Begin
         cdsMovArqGerado.DisableControls;
         cdsMovArqGeradoDet.DisableControls;
         cdsMovArqGerado.Data := oRemessaEletronica._SelecionaMovArquivoFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
         If Not cdsMovArqGerado.isEmpty Then
         Begin
            //edilaine WO38027 : inicio
            //cdsMovArqGeradoDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
            SqlMovArqGeradoDet.Sql.text := oRemessaEletronica._SqlSelecionaMovArqDetalheFB(rgTipoPagtoFolha.ItemIndex, sAnoMesPagto, dblkpVersaoFolha.LookupValue, dblkpConvenio2.LookupValue, 'S');
            SqlMovArqGeradoDet.Open;
            //edilaine WO38027 : fim

            cdsMovArqGerado.EnableControls;
            cdsMovArqGeradoDet.EnableControls;
         End
         Else
            bSemMov := True;
      End;

      {      If pcGeraArquivoOper.ActivePage = tbsGAFinalizados Then
            Begin
               cdsMovArqFinalizado.DisableControls;
               cdsMovArqFinalDet.DisableControls;
               cdsMovArqFinalizado.Data := oRemessaEletronica._SelecionaMovArquivoFB(dblkpConvenio2.LookupValue, 'F', dblkpVersaoFolha.LookupValue, dtProgInicialMA.date);
               cdsMovArqFinalDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(dblkpConvenio2.LookupValue, 'F', dtProgInicialMA.date);
               cdsMovArqFinalizado.EnableControls;
               cdsMovArqFinalDet.EnableControls;
            End;

            If pcGeraArquivoOper.ActivePage = tbsGACancelados Then
            Begin
               cdsMovArqCancelado.DisableControls;
               cdsMovArqCancelDet.DisableControls;
               cdsMovArqCancelado.Data := oRemessaEletronica._SelecionaMovArquivoFB(dblkpConvenio2.LookupValue, 'C', dblkpVersaoFolha.LookupValue, dtProgInicialMA.date);
               cdsMovArqCancelDet.Data := oRemessaEletronica._SelecionaMovArqDetalheFB(dblkpConvenio2.LookupValue, 'C', dtProgInicialMA.date);
               cdsMovArqCancelado.EnableControls;
               cdsMovArqCancelDet.EnableControls;
            End;          }

      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;

      If bSemMov Then
         Application.MessageBox(pchar('Sem Movimeto de Arquivos ' + pcGeraArquivoOper.ActivePage.Caption + '...'), 'Atenção !', Mb_IconExclamation);
   Except
      On E: Exception Do
      Begin
         frmAguarde.pbAguarde.Visible := True;
         frmAguarde.Apaga;
         Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
      End;
   End;
End;

procedure TFrmRemessaEletronica.btnLimparFCClick(Sender: TObject);
begin
  inherited;
  dblkpVersaoFolha.Clear;
  dblkpVersaoFolha.LookupValue := EmptyStr;
  dblkpConvenio2.Clear;
  dblkpConvenio2.LookupValue := EmptyStr;
  cbbMesPagto.SetFocus;
  cbbMesPagto.SelectAll;
end;
// Paulo Nobre - WO6194 - Fim


End.

