unit FConsDisponibilidadeMT_Novo;
// Alterações:
{
//******************************************************************************
N.WO............: WO28010
Data............: 23/11/2025
Responsável.....: Edilaine
Descrição.......: Remover espaços em branco das condiçoes de STATUS e OPERACAO
                   .qryanalitica
                   .qryAnaliticaRel
//******************************************************************************
N.WO............: B_MIGRACAO_ORACLE_2025 - TAS000000006797
Data............: 22/10/2025
Responsável.....: Paulo Nobre
Descrição.......: Inclusão da função CAST, em campos, nas querys:
                   .qryanalitica
                   .qryAnaliticaRel
//******************************************************************************
//Nº SIG: 136559
//Data da Alteração: 03/06/2023
//Responsável: André Imakawa
//Descrição: Ajuste no Relatorio Analitico por grupo.
//******************************************************************************
//Nº SIG: 132998
//Data da Alteração: 25/05/2023
//Responsável: André Imakawa
//Descrição: Criação do Relatorio Analitico por grupo.
//******************************************************************************
//Nº SOL: 224894.16670
//Nº KINTANA 570504
//Data da Alteração: 19/11/2014
//Alteração Form: adição de código
//Responsável: William Santana
//Descrição: StringReplace no parametro, pois existe um parametro em um dos campos no Select
//******************************************************************************
//N. Sol..........: 227356
//N. PPM..........: 340636
//Data............: 07/07/2014
//Responsável.....: Thiago Melo
//Descrição.......: Ajuste na qryAnalitica e qrySintetica para não agrupar
//                  rateios duplicados.
// 1 idpessoa.
//******************************************************************************
//N. Sol..........: 218051
//N. Kintana......: 2048724
//Data............: 10/10/2013
//Responsável.....: Marcio Sanches Spinosa
//Descrição.......: Ajuste na qryAnalitica tirando o null idpessoa e colocando
// 1 idpessoa.
//******************************************************************************
//N. Sol..........: 124845/15228
//N. Kintana......: 2048038
//Data............: 01/10/2013
//Responsável.....: Marcio Sanches Spinosa
//Descrição.......: Ajuste na qryAnalitica.
//******************************************************************************
//N. Sol..........: 124845/15187
//N. Kintana......: 2046540
//Data............: 30/09/2013
//Responsável.....: Marcio Sanches Spinosa
//Descrição.......: Ajuste na diferença de centavos das qryAnalitica e qrySintetica.
//******************************************************************************
//N. Sol..........: 207968
//N. Kintana......: 2040576
//Data............: 16/08/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Incluir nas rotinas de Bloqueios e Desbloqueios or rateios
//                  de plano/patro
//******************************************************************************
Rotina......: *.dfm (alteração direta no componente qryAnalitica e qrySintetica)
Nº SOL......: 31714/12842
Nº KINTANA..: 1873038
Data........: 29/11/2012
Responsável.: Edilaine Ferraresi
Descrição...: Alterada qryAnalitica e qrySintetica no union referente ao Saldo Anterior
              REMOVIDA A ALTERAÇÃO DO SOL 31714/12802
--------------------------------------------------------------------------------------------------
Rotina......: *.dfm (alteração direta no componente qryAnalitica e qrySintetica)
Nº SOL......: 31714/12802
Nº KINTANA..: 1871803
Data........: 28/11/2012
Responsável.: Edilaine Ferraresi
Descrição...: Alterada qryAnalitica e qrySintetica no union referente ao Saldo Anterior
              acrescentando um UNION na consulta
--------------------------------------------------------------------------------------------------
Rotina......: *.dfm (alteração direta no componente qryAnalitica e qrySintetica)
Nº SOL......: 31714-12665
Nº KINTANA..: 1866221
Data........: 22/11/2012
Responsável.: Edilaine Ferraresi
Descrição...: Alterada qryAnalitica e qrySintetica no union referente ao Bloqueio Judicial, mudando
              a linha CAST(NULL AS NUMBER) AS TIPOREG para  3 AS TIPOREG
--------------------------------------------------------------------------------------------------
Nº SOL......: 179184
Nº KINTANA..: 1648413
Data........: 08/05/2012
Responsável.: Vander Campos
Descrição...: Inclusão do código 740 nos SQLs que provem a Disponibilidade Financeira
---------------------------------------------------------------------------------------------------
Data        : 08/04/2009
Autor       : Bruno Bastos
SOL_Kintana : 108052_497961
Descrição   : Implementação de filtro por plano contábil.
----------------------------------------------------------------------------------------------------
Data      : 07/01/2009
Autor     : Bruno Bastos
Pendência : Kintana: 472013
SOL       : 105489
Descrição : Verificar se o mês a ser subtraído é janeiro. Se for, o novo mês será 12, senão será o
            mês anterior. 
----------------------------------------------------------------------------------------------------
Data      : 27/11/2008
Autor     : Bruno Bastos
Pendência : Kintana: 451499
SOL       : 101670
Descrição : Alterar o vencimento do DARF de Imposto de Renda para o último dia
            útil do segundo decêndio. Alterei também a pedido do Gustavo
            a busca do dia útil que agora é feita para os dias anteriores
            e não mais para dias posteriores.
----------------------------------------------------------------------------------------------------
Data      : 06/09/2007
Autor     : Fabio Fagundes
Código    : AL_16
Pendência : 26308
SOL       : 68503
Descrição : Retirada do itens 1.9.2 e 4.2 de registros de INSS (GPS) que deverão vir do item 2.4 quando é
            gerado o documento de GPS pois estava duplicando lançamentos
----------------------------------------------------------------------------------------------------
Data      : 11/07/2007
Autor     : Fabio Fagundes
Código    : AL_15
Pendência : 25839
SOL       : 64125
Descrição : Alteração dos Itens 1.9.1 e 4.1 com inclusão de critica VLRINSS <> 0
            para não trazer se estiver baixado
----------------------------------------------------------------------------------------------------
Data      : 29/06/2007
Autor     : Fabio Fagundes
Código    : AL_15
Pendência : 25733
SOL       :
Descrição : Alteração do Item 1.9.1, 1.9.2, 4.1 e 4.2 para adaptar os registros de INSS com legislação
            vigente a partir Jan/2007 e a partir de 01/02/2007 o INSS passa a ser recolhido no dia 10
            ou próximo dia útil subsequente
----------------------------------------------------------------------------------------------------
Data      : 28/03/2007
Autor     : Fabio Fagundes
Código    : AL_14
Pendência : 24923
SOL       : 56740
Descrição : Retirada do DISTINCT do item 2.1 na qrySintetica e qryAnalitica e qryDebug pois não
            estava trazendo corretamente os registros
----------------------------------------------------------------------------------------------------
Data      : 08/03/2007
Autor     : Fabio Fagundes
Código    : AL_13
Pendência : 24131
SOL       : 52190
Descrição : Implementação do Intervalo de Disponibilidade Financeira
----------------------------------------------------------------------------------------------------
Data      : 05/02/2007
Autor     : Fabio Fagundes
Código    : AL_11
Pendência : 24415
SOL       :
Descrição : Troca dos Union do Saldo Anterio para Union ALL pois estava gerando divergência no total
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_11
Pendência : 24344
SOL       :
Descrição : Tratamento para não permitir a geração em data anterior a data inicial de Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_10
Pendência : 24296
SOL       : 49782
Descrição : Acerto na montagem do periodo inicial do item 1.3 que estava trazendo registro na data
            inicial de Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 30/01/2007
Autor     : Fabio Fagundes
Código    : AL_9
Pendência :
SOL       :
Descrição : Liberação da Tab Depuração para todos os usuários
----------------------------------------------------------------------------------------------------
Data      : 07/12/2006
Autor     : Fabio Fagundes
Código    : AL_8
Pendência : 24228
SOL       :
Descrição : Em complemento à retirada dos registros estornados, deve ser retirado a crítica que não
            trazia os lancamentos Não Identificados (RELACIONANI WHERE FLGNI = 'I') dos itens 2.1 e 2.3
----------------------------------------------------------------------------------------------------
Data      : 07/12/2006
Autor     : Fabio Fagundes
Código    : AL_7
Pendência : 23953
SOL       :
Descrição : Passa a trazer os registros estornados
----------------------------------------------------------------------------------------------------
Data      : 16/12/2005
Autor     : Fabio Fagundes
Pendência : 20755
SOL       : 38445
Descrição : Alterado o campo P.NOME para P.RAZAOSOCIAL no item 2.0 das qrys Sintética e Analítica e Debug
----------------------------------------------------------------------------------------------------
Data      : 28/07/2005
Autor     : Fabio Fagundes
Descrição : Acerto nos itens 1.10 que não testava o STATUS <> 2 para não trazer documentos baixados
----------------------------------------------------------------------------------------------------
Data      : 24/02/2005
Autor     : Fabio Fagundes
Descrição : Acerto nos itens 1.x para trazer o IDPESSOA
            Alteração do item 2.5 para não ler a RATEIODOCUM e ficar igual ao item 1.6
            Alteração do item 2.6 para fabioficar igual ao item 1.7
            Alteração do item 1.7 pare ficar igual ao 1.6 só que para Pagamentos
----------------------------------------------------------------------------------------------------
Data      : 04/02/2005
Autor     : Fabio Fagundes
Descrição : Acerto no item 2.6 que estava apresentando cartesiano após alteração de 03/02/2005
----------------------------------------------------------------------------------------------------
Data      : 03/02/2005
Autor     : Fabio Fagundes
Descrição : Implementado Alteradores em documento de Recebimentos de Investimentos
            IteNS 1.10 e 2.6
----------------------------------------------------------------------------------------------------
Data      : 17/01/2005
Autor     : Fabio Fagundes
Descrição : Implementado Alteradores em documento Englobado itens 1.10 e 2.7
----------------------------------------------------------------------------------------------------
Data      : 13/01/2005
Autor     : Fabio Fagundes
Descrição : Acerto nos parâmetros IDPESSOA
----------------------------------------------------------------------------------------------------
Data      : 05/01/2005
Autor     : Fabio Fagundes
Descrição : Retirado os Trunc do somatória da qrySintética em função de diferença de 0,01
----------------------------------------------------------------------------------------------------
Data      : 04/01/2005
Autor     : Fabio Fagundes
Descrição : Acerto no item 1.10 das qry's para não trazer documentos englobados baixados
----------------------------------------------------------------------------------------------------
Data      : 03/01/2005
Autor     : Fabio Fagundes
Descrição : Retirado o Round do item 2.4 da qryAnalitica e qrySintetica
----------------------------------------------------------------------------------------------------
Data      : 30/12/2004
Autor     : Fabio Fagundes
Descrição : Melhoria no tratamento de PortadorForma que não gera financeiro e não afeta a Disponibilidade
            Implementação de tratamento para não trazer registros Não Identificado depois da Regularização
----------------------------------------------------------------------------------------------------
Data      : 16/12/2004
Autor     : Fabio Fagundes
Alteração : AL_1
Descrição : Acerto na geração da qryDebug
----------------------------------------------------------------------------------------------------
Data      : 09/12/2004
Autor     : Fabio Fagundes
Descrição : Implementação do tratamento de PortadoForma que não afeta o Financeiro
            para não trazer os Documentos para a Disponibilidade
----------------------------------------------------------------------------------------------------
Data      : 28/10/2004
Autor     : Fabio Fagundes
Descrição : Acerto na qryAnalitica item (1.6) que estava fazendo carteziano com
            a RateioDocum
----------------------------------------------------------------------------------------------------
Data      : 18/10/2004
Autor     : Fabio Fagundes
Descrição : Implementacao de CPMF sobre Transferencia entre Contas
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 14/10/2004
Autor     : Fabio Fagundes
Descrição : Melhoria de Lay-out e qryDebug
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 20/09/2004
Autor     : Fabio Fagundes
Descrição : Melhoria de Lay-out e qryDebug
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 17/08/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento e melhorias
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 30/07/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento e melhorias
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 22/07/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 04/06/2004
Autor     : Fabio Fagundes
Descrição : qryAnalítica e qrySintetica : Acertos no processamento
----------------------------------------------------------------------------------------------------
// André Tavares - 29/03/2004 - pendência 15765
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 29/03/2004
Autor     : André Tavares
Descrição : resolução da pendência 15765 - tirar o paâmetro cravado da query
qryAnalítica e utilizar o parâmetro do IRRF que identifica o tipo de imposto para INSS de autônomos
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 23/01/2004
Autor     : Fabio Fagundes
Descrição : - Acerto nas qrys Analítica e Sintética
            - Criação do campo DATAINIDISPFINANC
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/12/2003
Autor     : Fabio Fagundes
Descrição : - Acerto na busca dos registros de CPMF da qryAnalitica
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 30/10/2003
Autor     : Fabio Fagundes
Descrição : - Alteração do Caption do Relatório de Disp. Analítica para imprimir o Plano e Patro
            - Inclusão dos campos NODOCUMENTO,PLANO E PATRO na qryAnalitica
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/08/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica e QrySintética para não buscar os documento baixados
            do CAR nas tabelas do CFinan e sim da DOCUMENTO.
----------------------------------------------------------------------------------------------------
Rotina    : Reformulação do Form
Data      : 04/08/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica e QrySintética para Otimização
            do Processamento e inclusâo de cláusulas para busca de lançamentos
            de INSS
----------------------------------------------------------------------------------------------------
Rotina    : ValidaOperacao
Data      : 17/06/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica para alteração do Beneficiário
            dos lançamentos do CFinan para apresentarem o histórico padrão
            do contas caixa X tipoOperação
----------------------------------------------------------------------------------------------------
Rotina    : ValidaOperacao
Data      : 02/06/2003
Autor     : Fabio Fagundes
Descrição : Alteração no SQL da QryAnalitica para inclusão de CPMF e IRRF
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, DBTables, Db, Wwdatsrc, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker, Mask, DBCtrls, StdCtrls, TREdit, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBGrids, fcLabel, mxtables, mxstore, mxDB,
  TeeProcs, TeEngine, Chart, mxgraph, Series, DBChart, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, FPreview,uCtrlParamFinanc,uDbParamfinanc,
  dBaseDados,uCMTypes, DBClient, uCMClientDataSet,uSistema,uMensErro,
  uCtrlDisponibxusu, Provider,uCtrlDispFinanc, uCmSqlParams, ppChrtDP,
  ppChrt, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt,
  wwdbedit, Wwdotdot, Wwdbcomb, TB97Ctls,

  uCmControlObject, uCmDbObject, uDataBase,
     uCtrlFinanc, uCtrlListTercFinanc, uCtrlParamIntegra,
     uGeralFinanc, uCtrlPadroes, uDiasUteis,
     uCtrlImpostoRetido, uCtrlSegregacao, Math, ppParameter, ppModule,
  raCodMod;


type
  TfrmConsDisponibilidadeMT_novo = class(TfrmSairAjuda)
    Panel1: TPanel;
    PgcSaldos: TPageControl;
    tbsSintetica: TTabSheet;
    tbsAnalitica: TTabSheet;
    Panel10: TPanel;
    dbgAnalitico: TwwDBGrid;
    pnlTitulo: TPanel;
    lblTitulo: TfcLabel;
    dbgSintetico: TwwDBGrid;
    pnlDados: TPanel;
    bvlSepTit: TBevel;
    Label1: TLabel;
    Timer: TTimer;
    ToolbarSep971: TToolbarSep97;
    dsSintetica: TwwDataSource;
    dsAnalitica: TwwDataSource;
    qryAnalitica: TwwQuery;
    bbtnIniciar: TBitBtn;
    CdsParamFinanc: TCMClientDataSet;
    CdsDispFinanc: TCMClientDataSet;
    dspParamFinanc: TDataSetProvider;
    qryParamFinanc: TwwQuery;
    Label2: TLabel;
    edtIntervalo: TdxTimeEdit;
    CMSqlParams1: TCMSqlParams;
    CdsDispSintetica: TCMClientDataSet;
    CdsDispAnalitica: TCMClientDataSet;
    dspDispAnalitica: TDataSetProvider;
    dspDispSintetica: TDataSetProvider;
    qrySintetica: TwwQuery;
    tbsGrafico: TTabSheet;
    grfSintetica: TDBChart;
    Series1: TBarSeries;
    bbtnImprimir: TBitBtn;
    pplSintetica: TppBDEPipeline;
    pplAnalitica: TppBDEPipeline;
    rptDispAnalitica: TppReport;
    ppHeaderBand2: TppHeaderBand;
    pplCaptionDispAnalitica: TppLabel;
    lblEmpresaAnalitica: TppLabel;
    shpDispAnaCabecalho: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLine4: TppLine;
    lblDispAnaSistema: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    rptDispSintetica: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    lblEmpresaSintetica: TppLabel;
    shpDispConCabecalho: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    rptDispGrafico: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine5: TppLine;
    lblGrafico: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppLine6: TppLine;
    ppLabel9: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppDBText8: TppDBText;
    ppLabel2: TppLabel;
    lblDataSintetica: TppLabel;
    lblDataAnalitica: TppLabel;
    lblDataGrafico: TppLabel;
    Animate: TAnimate;
    ppLabel8: TppLabel;
    ppLabel15: TppLabel;
    ppDBText10: TppDBText;
    dbtSaldoDoDia: TppDBText;
    dsEmpresa: TwwDataSource;
    qryEmpresa: TwwQuery;
    qryEmpresaIDPESSOA: TFloatField;
    qryEmpresaNOMEEMPRESA: TStringField;
    qryEmpresaRAZAOSOCIAL: TStringField;
    qryEmpresaIDENDERECO: TFloatField;
    qryEmpresaCEP: TStringField;
    qryEmpresaIMAGEM: TBlobField;
    pplEmpresa: TppBDEPipeline;
    pplEmpresappField1: TppField;
    pplEmpresappField2: TppField;
    pplEmpresappField3: TppField;
    pplEmpresappField5: TppField;
    pplEmpresappField6: TppField;
    pplEmpresappField7: TppField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel4: TppLabel;
    ppDBText12: TppDBText;
    edtDataRef: TCMDateTimePicker;
    btnAtualiza: TBitBtn;
    tbsDepuracao: TTabSheet;
    dsDebug: TwwDataSource;
    qryDebug: TwwQuery;
    CdsDispAnaliticaNODOCUMENTO: TStringField;
    CdsDispAnaliticaNOMEFORCLI: TStringField;
    CdsDispAnaliticaCODCENTRORESPON: TStringField;
    CdsDispAnaliticaNOMEPLANOPATRO: TStringField;
    CdsDispAnaliticaNOME: TStringField;
    CdsDispAnaliticaIDPLANO: TFloatField;
    CdsDispAnaliticaIDPATRO: TFloatField;
    CdsDispAnaliticaTIPOREG: TFloatField;
    CdsDispAnaliticaSALDOANT: TFloatField;
    CdsDispAnaliticaRECEBIMENTOS: TFloatField;
    CdsDispAnaliticaDESEMBOLSOS: TFloatField;
    CdsDispAnaliticaIDPESSOA: TFloatField;
    CdsDispAnaliticaPLANO: TStringField;
    CdsDispAnaliticaPATRO: TStringField;
    qryAnaliticaNODOCUMENTO: TStringField;
    qryAnaliticaNOMEFORCLI: TStringField;
    qryAnaliticaSALDO: TFloatField;
    qryAnaliticaCODCENTRORESPON: TStringField;
    qryAnaliticaNOMEPLANOPATRO: TStringField;
    qryAnaliticaNOME: TStringField;
    qryAnaliticaIDPLANO: TFloatField;
    qryAnaliticaIDPATRO: TFloatField;
    qryAnaliticaTIPOREG: TFloatField;
    qryAnaliticaSALDOANT: TFloatField;
    qryAnaliticaRECEBIMENTOS: TFloatField;
    qryAnaliticaDESEMBOLSOS: TFloatField;
    qryAnaliticaSALDODIA: TFloatField;
    qryAnaliticaIDPESSOA: TFloatField;
    qryAnaliticaPLANO: TStringField;
    qryAnaliticaPATRO: TStringField;
    qrySinteticaIDPATRO: TFloatField;
    qrySinteticaIDPLANO: TFloatField;
    qrySinteticaNOMEPLANOPATRO: TStringField;
    qrySinteticaSALDOANT: TFloatField;
    qrySinteticaRECEBIMENTOS: TFloatField;
    qrySinteticaDESEMBOLSOS: TFloatField;
    qrySinteticaSALDODIA: TFloatField;
    CdsDispSinteticaNOMEPLANOPATRO: TStringField;
    CdsDispSinteticaSALDOANT: TFloatField;
    CdsDispSinteticaRECEBIMENTOS: TFloatField;
    CdsDispSinteticaDESEMBOLSOS: TFloatField;
    CdsDispSinteticaSALDODIA: TFloatField;
    CdsDispSinteticaIDPATRO: TFloatField;
    CdsDispSinteticaIDPLANO: TFloatField;
    CdsDispAnaliticaSALDO: TFloatField;
    pnlDepuracao: TPanel;
    cmbTipos: TwwDBComboBox;
    btnDebug: TToolbarButton97;
    OpenDialog1: TOpenDialog;
    pgcDebug: TPageControl;
    tbsResulDebug: TTabSheet;
    tbsQryDebug: TTabSheet;
    qryAnaliticaNUMDOC: TStringField;
    qryAnaliticaNUMAPGR: TFloatField;
    CdsDispAnaliticaNUMDOC: TStringField;
    CdsDispAnaliticaNUMAPGR: TFloatField;
    DBGrid1: TDBGrid;
    memoDebug: TMemo;
    Label3: TLabel;
    cmbSitPlano: TComboBox;
    dspDispAnaliticaRel: TDataSetProvider;
    CdsDispAnaliticaRel: TCMClientDataSet;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    dsAnaliticaRel: TwwDataSource;
    pplAnaliticaRel: TppBDEPipeline;
    pplAnaliticaRelppField1: TppField;
    pplAnaliticaRelppField2: TppField;
    pplAnaliticaRelppField3: TppField;
    pplAnaliticaRelppField4: TppField;
    pplAnaliticaRelppField5: TppField;
    pplAnaliticaRelppField6: TppField;
    pplAnaliticaRelppField7: TppField;
    pplAnaliticaRelppField8: TppField;
    pplAnaliticaRelppField9: TppField;
    pplAnaliticaRelppField10: TppField;
    pplAnaliticaRelppField11: TppField;
    pplAnaliticaRelppField12: TppField;
    pplAnaliticaRelppField13: TppField;
    pplAnaliticaRelppField14: TppField;
    pplAnaliticaRelppField15: TppField;
    pplAnaliticaRelppField16: TppField;
    pplAnaliticaRelppField17: TppField;
    GRUPO1: TppField;
    SALDO_INICIAL_GRUPO: TppField;
    RECEBIMENTO_TOTAL_GRUPO: TppField;
    DESEMBOLSO_TOTAL_GRUPO: TppField;
    pplAnaliticaRelppField18: TppField;
    rptDispAnaliticaRel: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel17: TppLabel;
    LblEmpresaAnaliticaRel: TppLabel;
    lblDataAnaliticaRel: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape2: TppShape;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel27: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText19: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    btnRelatorio: TBitBtn;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    pplAnaliticaRelppField19: TppField;
    ppDBText20: TppDBText;
    qryAnaliticaRel: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField10: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    qryAnaliticaRelTEXTO_SALDO_FINAL: TStringField;
    ppDBText23: TppDBText;

    procedure FormActivate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnIniciarClick(Sender: TObject);
    procedure PgcSaldosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure eOnMessage(sMsg : string);
    procedure edtDataRefExit(Sender: TObject);
    procedure dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgAnaliticoTopRowChanged(Sender: TObject);
    procedure dbgDispAnaliticaTopRowChanged(Sender: TObject);
    procedure dbgDispSinteticaTopRowChanged(Sender: TObject);
    procedure dbgSinteticoTopRowChanged(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure rptDispAnaliticaStartPage(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure edtIntervaloExit(Sender: TObject);
    procedure ppShape3Print(Sender: TObject);
    procedure ppShape4Print(Sender: TObject);
    procedure btnDebugClick(Sender: TObject);
    procedure cmbTiposChange(Sender: TObject);
    procedure dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgDebugTopRowChanged(Sender: TObject);
    procedure ppLabel3Print(Sender: TObject);
    procedure lblDispAnaSistemaPrint(Sender: TObject);
    procedure ppLabel9Print(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure ppShape2Print(Sender: TObject);


  private { Private declarations }

    cCorZebra : TColor;
    bFaz: Boolean;
    fMaxValor, fMinValor: Double;
    iIntervalo: Integer;
    CtrlParamFinanc   : TCtrlParamFinanc;
    CtrlDisponibxusu  : TCtrlDisponibxusu;
    CtrlDisponFinanc  : TCtrlDisponFinanc;
    procedure Atualiza;
    procedure AtualizaGrids;
    procedure MontaParametros(sQry:String);
    function BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
    function BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
    function TrocaString (sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;

  public  { Public declarations }

    bmPosicao: TBookmark;


  end;



var
  frmConsDisponibilidadeMT_novo : TfrmConsDisponibilidadeMT_novo;
  bFirst,bConciliada,bFirstAtualiza : boolean;
  fSaldoAnterior, fRecebimentos, fDesembolsos, fSaldoDoDia : Double;
  dDataIniMes,dDataIniMesAnt,dDataFimMesAnt,dDataINSS,dDataIniIRRF,dDataFimIRRF,dDataCPMF : TDateTime;
  dDataDARF, dDataAnt, dDataRef : TDateTime;
  bGeraAnalitica : Boolean;
  sPatro, sPlano : String;
  iSaldoAntINSS, iSaldoAntIRRF, iQuarta, iPatro, iPlanoPrev : Integer;



implementation
{$R *.DFM}
uses
  FPrincipal;



procedure TfrmConsDisponibilidadeMT_novo.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  WindowState      := wsMaximized;
end;



procedure TfrmConsDisponibilidadeMT_novo.TimerTimer(Sender: TObject);
begin
  inherited;
   iIntervalo := 0;
   iIntervalo := iIntervalo +  StrToInt( FormatDateTime('ss',edtIntervalo.Time));
   iIntervalo := iIntervalo + (StrToInt( FormatDateTime('nn',edtIntervalo.Time))* 60 );
   iIntervalo := iIntervalo + (StrToInt( FormatDateTime('hh',edtIntervalo.Time))* 3600 );
   iIntervalo := iIntervalo * 1000;
   Timer.Interval := iIntervalo;
   if bFirstAtualiza = True then
   begin
      bFirstAtualiza := False;
      bFaz := False;
   end
   else
      bFaz := True;
   Atualiza;
end;

procedure TfrmConsDisponibilidadeMT_novo.FormShow(Sender: TObject);
begin
  inherited;
  //AL_13

  fMaxValor := 0;
  fMinValor := 0;
  PgcSaldos.ActivePage := tbsSintetica;
  bFaz := False;
  bFirstAtualiza := True;
  edtDataRef.Text := DateToStr(Now);

  cmbSitPlano.ItemIndex := 0; //Bruno Bastos - SOL: 108052 - Kintana: 497961
end;

procedure TfrmConsDisponibilidadeMT_novo.bbtnIniciarClick(Sender: TObject);
begin
  inherited;

  //AL_11
  if Trim(edtDataRef.Text) <> '' then
  begin
     if StrToDate(edtDataRef.Text) <= CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime then
     begin
        MsgDlg('A data da Consulta não pode ser menor ou igual à data de ' + #13 +
               'Início de Disponibilidade : ' + CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsString + '','Atenção',mtWarning,[mbOk],0);
        if edtDataRef.CanFocus then
           edtDataRef.SetFocus;
     end
     else
     begin
        PgcSaldos.ActivePage := tbsSintetica;
        bFaz := True;
        TimerTimer(Sender);
        Atualiza;
     end;
  end;
end;

procedure TfrmConsDisponibilidadeMT_novo.MontaParametros(sQry:String);
var
   iAno, iMes, iDia : word;
   sAtivPlano       : String; //Bruno Bastos - SOL: 108052 - Kintana: 497961

begin
   dDataRef := StrToDate(edtDataRef.Text);

   DecodeDate(StrToDate(edtDataRef.Text), iAno, iMes, iDia);

   //AL_15
   if dDataRef < StrToDate('01/02/2007') then
   // INSS - Todo dia 2 (útil) ou 1º útil subsequente
      dDataINSS := EncodeDate(iAno, iMes, 2)
   else
      // INSS - Todo dia 10 (útil) ou 1º útil subsequente
      //dDataINSS := EncodeDate(iAno, iMes, 10); //Bruno Bastos - SOL: 101670 Kintana: 451499
      dDataINSS := EncodeDate(iAno, iMes, 20); //Bruno Bastos - SOL: 101670 Kintana: 451499

   if not DiasUteis.DiaUtil(dDataINSS,-1,1,'',True,True,False) then
      //dDataINSS := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dDataINSS,True,True,False); //Bruno Bastos - SOL: 101670 Kintana: 451499
      dDataINSS := DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,dDataINSS,True,True,False); //Bruno Bastos - SOL: 101670 Kintana: 451499
   if StrToDate(edtDataRef.Text) = dDataINSS then
      dDataINSS := StrToDate(edtDataRef.Text);
   iSaldoAntINSS := 0;

   // Somente registros de INSS para o mês subsequente ao de início de Disponibilidade (PARAMFINANC.DATAINIDISPFINANC)
   if ((StrToDate(edtDataRef.Text) > dDataINSS) and
       (StrToDate(edtDataRef.Text) > StrToDate('02/08/2004'))) then
      iSaldoAntINSS := 1;

   // Primeiro dia do mes da DATAREF
   dDataIniMes := EncodeDate(iAno, iMes, 1);

   // Primeiro dia do mes Anterior da DATAREF
   dDataIniMesAnt := DiasUteis.SomaMeses(dDataIniMes, -1);
   DecodeDate(dDataIniMesAnt, iAno, iMes, iDia);

   // Último dia do mes Anterior da DATAREF
   dDataFimMesAnt := DiasUteis.UltDiaMes(iAno, iMes);

   // Data Anterior
   dDataAnt := edtDataRef.Date - 1;

   // IRRF
   dDataIniIRRF := BuscaPrimeiroDiaIRRF(StrToDate(edtDataRef.Text));

   if dDataIniIRRF = 1 then
      dDataFImIRRF := 1
   else
      //dDataFImIRRF := edtDataRef.Date; //Bruno Bastos - Sol: 101670 Kintana: 451499
      dDataFimIRRF := DiasUteis.UltDiaMes(DiasUteis.ExtraiAno(dDataIniIRRF), DiasUteis.ExtraiMes(dDataIniIRRF));//Bruno Bastos - Sol: 101670 Kintana: 451499

   // DARF 3º dia útil da semana subsequente ao fato gerador
   dDataDARF    := DiasUteis.SomaDiasUteis(dDataFImIRRF, 3, -1, 1, '', True, True, False);
   iSaldoAntIRRF := 0;
   if ((DayOfWeek(StrToDate(edtDataRef.Text)) = 5) or
       (DayOfWeek(StrToDate(edtDataRef.Text)) = 6)) then
      iSaldoAntIRRF := 1;
   iQuarta := 0;
   if DayOfWeek(StrToDate(edtDataRef.Text)) = 4 then
      iQuarta := 4;

   iPatro     := CdsDispSinteticaIDPATRO.AsInteger;
   iPlanoPrev := CdsDispSinteticaIDPLANO.AsInteger;

   //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
   case cmbSitPlano.ItemIndex of
      0: sAtivPlano := 'S';
      1: sAtivPlano := 'N';
   End;
   //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim

   if sQry = 'qrySintetica' then
   begin
      qrySintetica.Close;
      qrySintetica.DisableControls;
      //Início - William Santana - SOL 224894.16670 PPM 570504
      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qrySintetica.SQL.text := StringReplace(qrySintetica.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);
      //Término  William Santana - SOL 224894.16670 PPM 570504
      qrySintetica.Prepare;
      qrySintetica.ParamByName('IDPATRO').Clear;
      qrySintetica.ParamByName('IDPLANOPREV').Clear;
      qrySintetica.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qrySintetica.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
     // qrySintetica.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;   //William Santana - SOL 224894.16670 PPM 570504
      qrySintetica.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);

      //AL_15

      qrySintetica.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qrySintetica.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qrySintetica.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qrySintetica.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qrySintetica.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qrySintetica.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      qrySintetica.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;

      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
      if cmbSitPlano.ItemIndex = 2 then
        qrySintetica.ParamByName('PSATIVO').Clear
      else
        qrySintetica.ParamByName('PSATIVO').AsString      := sAtivPlano;
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end
   else if sQry = 'qryAnalitica' then
   begin
      qryAnalitica.Close;
      qryAnalitica.DisableControls;
      //Início - William Santana - SOL 224894.16670 PPM 570504
      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qryAnalitica.SQL.text := StringReplace(qryAnalitica.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);
      //Término  William Santana - SOL 224894.16670 PPM 570504
      qryAnalitica.Prepare;
      qryAnalitica.ParamByName('IDPATRO').AsInteger       := CdsDispSinteticaIDPATRO.AsInteger;
      qryAnalitica.ParamByName('IDPLANOPREV').AsInteger   := CdsDispSinteticaIDPLANO.AsInteger;
      qryAnalitica.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qryAnalitica.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
     // qryAnalitica.ParamByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;   //William Santana - SOL 224894.16670 PPM 570504
      qryAnalitica.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);//'11/01/2004';

      //AL_15

      qryAnalitica.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qryAnalitica.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qryAnalitica.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qryAnalitica.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qryAnalitica.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qryAnalitica.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      qryAnalitica.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;

      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
      if cmbSitPlano.ItemIndex = 2 then
        qryAnalitica.ParamByName('PSATIVO').Clear
      else
        qryAnalitica.ParamByName('PSATIVO').AsString      := sAtivPlano;
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end
   else if sQry = 'qryDebug' then
   begin
      qryDebug.DatabaseName := qryAnalitica.DatabaseName;
      qryDebug.Close;
      //Início - William Santana - SOL 224894.16670 PPM 570504
      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qryDebug.SQL.text := StringReplace(qryDebug.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);
      //Término  William Santana - SOL 224894.16670 PPM 570504
      qryDebug.Prepare;
      if qryDebug.Params.FindParam('DATASALDOANT') <> nil then
         qryDebug.Params.FindParam('DATASALDOANT').AsString  := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);//'11/01/2004';
      if qryDebug.Params.FindParam('DATAREF') <> nil then
         qryDebug.Params.FindParam('DATAREF').AsString       := DateToStr(dDataRef);
      if qryDebug.Params.FindParam('DATAANT') <> nil then
         qryDebug.Params.FindParam('DATAANT').AsString       := DateToStr(edtDataRef.Date - 1);

      //AL_15

      if qryDebug.Params.FindParam('DATAINIMESANT') <> nil then
         qryDebug.Params.FindParam('DATAINIMESANT').AsString := DateToStr(dDataIniMesAnt);
      if qryDebug.Params.FindParam('DATAFIMMESANT') <> nil then
         qryDebug.Params.FindParam('DATAFIMMESANT').AsString := DateToStr(dDataFimMesAnt);
      if qryDebug.Params.FindParam('DATAINSS') <> nil then
         qryDebug.Params.FindParam('DATAINSS').AsString      := DateToStr(dDataINSS);
      if qryDebug.Params.FindParam('DATAINIIRRF') <> nil then
         qryDebug.Params.FindParam('DATAINIIRRF').AsString   := DateToStr(dDataIniIRRF);
      if qryDebug.Params.FindParam('DATAFIMIRRF') <> nil then
         qryDebug.Params.FindParam('DATAFIMIRRF').AsString   := DateToStr(dDataFimIRRF);
      if qryDebug.Params.FindParam('BQUARTA') <> nil then
         qryDebug.Params.FindParam('BQUARTA').AsInteger := iQuarta;
      if qryDebug.Params.FindParam('BSALDOANTINSS') <> nil then
         qryDebug.Params.FindParam('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      if qryDebug.Params.FindParam('BSALDOANTIRRF') <> nil then
         qryDebug.Params.FindParam('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;
      if qryDebug.Params.FindParam('IDPATRO') <> nil then
         qryDebug.Params.FindParam('IDPATRO').Clear;
      if qryDebug.Params.FindParam('IDPLANOPREV')<> nil then
         qryDebug.Params.FindParam('IDPLANOPREV').Clear;
      if (CdsDispSinteticaIDPATRO.AsInteger <> -1) and
         (CdsDispSinteticaIDPLANO.AsInteger <> -1) then
      begin
         if qryDebug.Params.FindParam('IDPATRO') <> nil then
            qryDebug.Params.FindParam('IDPATRO').AsInteger     := iPatro;
         if qryDebug.Params.FindParam('IDPLANOPREV')<> nil then
            qryDebug.Params.FindParam('IDPLANOPREV').AsInteger := iPlanoPrev;
      end;
      //Início - William Santana - SOL 224894.16670 PPM 570504
     // if qryDebug.Params.FindParam('IDPESSOA') <> nil then
     //    qryDebug.Params.FindParam('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
      //Tpermino - William Santana - SOL 224894.16670 PPM 570504
      //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
      if qryDebug.Params.FindParam('PSATIVO') <> nil then
      begin
         if cmbSitPlano.ItemIndex = 2 then
            qryDebug.Params.FindParam('PSATIVO').Clear
         else
            qryDebug.Params.FindParam('PSATIVO').AsString := sAtivPlano;
      end;
     //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim
   end // Andre Imakawa - SIG 132998 - Inicio   
   else if sQry = 'qryAnaliticaRel' then
   begin


      qryAnaliticaRel.Close;
      qryAnaliticaRel.DisableControls;
      //Início - William Santana - SOL 224894.16669 PPM 570501
      // Replace no parametro, pois existe um parametro em um dos campos no Select
      qryAnaliticaRel.SQL.text := StringReplace(qryAnaliticaRel.sql.text,':IDPESSOA', intTostr(Sistema.IdEmpresa),[rfReplaceAll,rfIgnoreCase]);
      //Término  William Santana - SOL 224894.16669 PPM 570501

      qryAnaliticaRel.Prepare;
      qryAnaliticaRel.ParamByName('IDPATRO').Clear;
      qryAnaliticaRel.ParamByName('IDPLANOPREV').Clear;
      qryAnaliticaRel.ParamByName('DATAREF').AsString        := DateToStr(dDataRef);
      qryAnaliticaRel.ParamByName('DATAANT').AsString        := DateToStr(dDataAnt);
      qryAnaliticaRel.ParamByName('DATASALDOANT').AsString   := DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime);

      //AL_15

      qryAnaliticaRel.ParamByName('DATAINIMESANT').AsString  := DateToStr(dDataIniMesAnt);
      qryAnaliticaRel.ParamByName('DATAFIMMESANT').AsString  := DateToStr(dDataFimMesAnt);
      qryAnaliticaRel.ParamByName('DATAINSS').AsString       := DateToStr(dDataINSS);
      qryAnaliticaRel.ParamByName('BSALDOANTINSS').AsInteger := iSaldoAntINSS;
      qryAnaliticaRel.ParamByName('DATAINIIRRF').AsString    := DateToStr(dDataIniIRRF);
      qryAnaliticaRel.ParamByName('DATAFIMIRRF').AsString    := DateToStr(dDataFimIRRF);
      qryAnaliticaRel.ParamByName('BSALDOANTIRRF').AsInteger := iSaldoAntIRRF;

      if cmbSitPlano.ItemIndex = 2 then
        qryAnaliticaRel.ParamByName('PSATIVO').Clear
      else
        qryAnaliticaRel.ParamByName('PSATIVO').AsString      := sAtivPlano;
      // Andre Imakawa - SIG 132998 - Fim
   end;

end;



procedure TfrmConsDisponibilidadeMT_novo.Atualiza;
begin
   // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
   if (bFaz) then
   begin
      // Desabilita o Timer para não contar o tempo de abertura das queries no intervalo
       Timer.Enabled := False;
       // Aciona a animação
       Animate.Visible := True;
       Animate.Active := True;
       Application.ProcessMessages;

       // Busca das tabelas Documento / Movimfinanc
       // Atualiza a disponibilidade Sintética
       dbgSintetico.Visible := True;
       dbgAnalitico.Visible := True;

       MontaParametros('qrySintetica');

//       qrySintetica.Sql.SaveToFile('c:\planus\temp\DispFinancSintetica.txt');

       CdsDispSintetica.Close;
       CdsDispSintetica.Open;
       CdsDispSintetica.DisableControls;
       fSaldoAnterior := 0;
       fRecebimentos  := 0;
       fDesembolsos   := 0;
       fSaldoDoDia    := 0;
       while not CdsDispSintetica.Eof do
       begin
          fSaldoAnterior := fSaldoAnterior + CdsDispSinteticaSALDOANT.AsFloat;
          fRecebimentos  := fRecebimentos  + CdsDispSinteticaRECEBIMENTOS.AsFloat;
          fDesembolsos   := fDesembolsos   + CdsDispSinteticaDESEMBOLSOS.AsFloat;
          fSaldoDoDia    := fSaldoDoDia    + CdsDispSinteticaSALDODIA.AsFloat;
          CdsDispSintetica.Next;
       end;

       if not CdsDispSintetica.IsEmpty then
          CdsDispSintetica.Append
       else
          CdsDispSintetica.Insert;

       CdsDispSinteticaNOMEPLANOPATRO.AsString := 'TOTAL GERAL';
       CdsDispSinteticaSALDOANT.AsFloat        := fSaldoAnterior;
       CdsDispSinteticaRECEBIMENTOS.AsFloat    := fRecebimentos;
       CdsDispSinteticaDESEMBOLSOS.AsFloat     := fDesembolsos;
       CdsDispSinteticaSALDODIA.AsFloat        := fSaldoDoDia;
       CdsDispSintetica.Post;

       // Esconde a animação
       Animate.Active := False;
       Animate.Visible := False;

       CdsDispSintetica.EnableControls;

       // Habilita o Timer
       Timer.Enabled := True;
       if bFirstAtualiza then
          bFirstAtualiza := False;
       bFaz := False;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.PgcSaldosChange(Sender: TObject);
begin
   inherited;
   bmPosicao := CdsDispSintetica.GetBookmark;
   cmbTipos.Text := '';
   if PgcSaldos.ActivePage = tbsAnalitica then
   begin
      qryDebug.Close;
      qryDebug.SQL.Clear;
      dbgAnalitico.RefreshDisplay;

      MontaParametros('qryAnalitica');

//      qryAnalitica.Sql.SaveToFile('c:\planus\temp\DispFinancAnalitica.txt');

      CdsDispAnalitica.Close;
      CdsDispAnalitica.Open;

      sPatro := CdsDispAnaliticaPATRO.AsString;
      sPlano := CdsDispAnaliticaPLANO.AsString;

      // Inclui Saldo Final
      if not CdsDispAnalitica.IsEmpty then
         CdsDispAnalitica.Append
      else
         CdsDispAnalitica.Insert;
      CdsDispAnaliticaNODOCUMENTO.AsString := '';
      CdsDispAnaliticaNOMEFORCLI.AsString  := 'SALDO FINAL   - ' + CdsDispSinteticaNOMEPLANOPATRO.AsString;
      CdsDispAnaliticaSALDO.AsFloat        := 0;
      CdsDispAnaliticaTIPOREG.AsString     := '4';
      CdsDispAnaliticaIDPLANO.AsInteger    := CdsDispSinteticaIDPLANO.AsInteger;
      CdsDispAnaliticaIDPATRO.AsInteger    := CdsDispSinteticaIDPATRO.AsInteger;
      CdsDispAnaliticaSALDOANT.AsFloat     := CdsDispSinteticaSALDODIA.AsFloat;
      CdsDispAnaliticaRECEBIMENTOS.AsFloat := CdsDispSinteticaRECEBIMENTOS.AsFloat;
      CdsDispAnaliticaDESEMBOLSOS.AsFloat  := CdsDispSinteticaDESEMBOLSOS.AsFloat;
      CdsDispAnaliticaCODCENTRORESPON.AsString := '';
      CdsDispAnaliticaNOME.AsString := '';
      CdsDispAnalitica.Post;

      qryAnalitica.EnableControls;
   end
   else if PgcSaldos.ActivePage = tbsSintetica then
      CdsDispSintetica.Filter := ''
   else if PgcSaldos.ActivePage = tbsDepuracao then
   begin
      qryDebug.Close;
      qryDebug.SQL.Clear;
      memoDebug.Clear;
   end;

   CdsDispSintetica.GotoBookmark(bmPosicao);
   CdsDispSintetica.FreeBookmark(bmPosicao);
end;



procedure TfrmConsDisponibilidadeMT_novo.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlDisponibxusu := TCtrlDisponibxusu.Create;
   CtrlDisponibxusu.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlDisponFinanc:=TCtrlDisponFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);
   CdsParamFinanc.Data  := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);

   edtDataRef.Date      := CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime;

   //AL_13
   CtrlParamFinanc.CdsParamFinanc := CdsParamFinanc;
   edtIntervalo.Text := CdsParamFinanc.FieldByName('PERIODDISPONIB').AsString;

   AtualizaGrids;
end;

procedure TfrmConsDisponibilidadeMT_novo.FormDestroy(Sender: TObject);
begin
  inherited;

  //AL_13

  CtrlParamFinanc.Free;
  CtrlDisponibxusu.Free;
  CtrlDisponFinanc.Free;
end;



procedure TfrmConsDisponibilidadeMT_novo.eOnMessage(sMsg : string);
begin
  MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;



procedure TfrmConsDisponibilidadeMT_novo.edtDataRefExit(Sender: TObject);
begin
  inherited;
   begin
      CdsDispFinanc.Data   := CtrlDisponFinanc.SelecionaDispFinanc(edtDataRef.Date );
      AtualizaGrids;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.AtualizaGrids;
begin
   bConciliada := False;
   dbgSintetico.Visible := True;
   dbgAnalitico.Visible := True;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgAnaliticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not Highlight then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgSinteticoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgAnaliticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgDispAnaliticaTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgDispSinteticaTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_novo.dbgSinteticoTopRowChanged(Sender: TObject);
begin
  inherited;
  (* acerta as cores quando muda a linha da grid *)
  (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmConsDisponibilidadeMT_novo.bbtnImprimirClick(Sender: TObject);
begin
  inherited;

   lblEmpresaSintetica.Caption := Sistema.NomeEmpresa;
   lblEmpresaAnalitica.Caption := Sistema.NomeEmpresa;
   lblGrafico.Caption          := Sistema.NomeEmpresa;
   lblDataGrafico.Caption   := edtDataRef.Text;
   lblDataSintetica.Caption := edtDataRef.Text;
   lblDataAnalitica.Caption := edtDataRef.Text;

   pplSintetica.DataSource := dsSintetica;
   pplAnalitica.DataSource := dsAnalitica;
   pplSintetica.AutoCreateFields := False;
   pplSintetica.AutoCreateFields := True;
   pplAnalitica.AutoCreateFields := False;
   pplAnalitica.AutoCreateFields := True;

   if PgcSaldos.ActivePage = tbsSintetica then
   begin
      CdsDispSintetica.DisableControls;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispSintetica,
                                     rptDispSintetica.PrinterSetup.DocumentName);
      CdsDispSintetica.EnableControls;
   end else
   if PgcSaldos.ActivePage = tbsAnalitica then
   begin
      qryAnalitica.DisableControls;
      CdsDispAnalitica.DisableControls;

      pplCaptionDispAnalitica.Caption := 'Disponibilidade Analítica' +' : ' + sPlano +' / ' + sPatro;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispAnalitica,
                                     rptDispAnalitica.PrinterSetup.DocumentName);
      qryAnalitica.EnableControls;
      CdsDispAnalitica.EnableControls;
   end
   else if PgcSaldos.ActivePage = tbsGrafico then
   begin
      qrySintetica.DisableControls;
      TfrmPreview.CreateModalPreview(Application,
                                     rptDispGrafico,
                                     rptDispGrafico.PrinterSetup.DocumentName);
      qrySintetica.EnableControls;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.rptDispAnaliticaStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   ppShape4.Brush.Color := clWhite;
   bFirst := True;
end;


procedure TfrmConsDisponibilidadeMT_novo.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   if ((Trim(qryAnaliticaNOMEPLANOPATRO.AsString) = '') or
      (COPY(qryAnaliticaNOMEFORCLI.AsString,1,13) = 'SALDO INICIAL')) and
      (not bFirst) then
   else if (bFirst) and
      (Trim(qryAnaliticaNOMEPLANOPATRO.AsString) <> 'TOTAL GERAL') then
   else if bFirst then
      bFirst := False;
  inherited;
end;



//AL_13
procedure TfrmConsDisponibilidadeMT_novo.edtIntervaloExit(Sender: TObject);
var
   iIntervalo : string;
begin
  inherited;

   iIntervalo := DateTimeToStr(edtIntervalo.time);
   iIntervalo := FormatDateTime('hh:nn:ss',StrToDateTime(iIntervalo));
   try
      if Trim(iIntervalo) > '' then
      begin
         CdsParamFinanc.Edit;
         CdsParamFinanc.FieldByName('PERIODDISPONIB').AsString := edtIntervalo.Text;
         CdsParamFinanc.Post;
         if not(CtrlParamFinanc.AplicaAtualParamFinanc) then
            MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOK],0)
      end;
   except
      MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOK],0);
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.ppShape3Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   if COPY(CdsDispSinteticaNOMEPLANOPATRO.AsString,1,11) = 'TOTAL GERAL' then
   begin
      TppShape(Sender).Brush.Color := clSilver;
      TppShape(Sender).Pen.Style := psSolid;
   end
   else
   begin
      TppShape(Sender).Brush.Color := cCorZebra;
      TppShape(Sender).Pen.Style := psClear;
   end;
end;



procedure TfrmConsDisponibilidadeMT_novo.ppShape4Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = clWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := clWhite;

   if (qryAnaliticaIDPATRO.AsInteger = -1) or (qryAnaliticaIDPATRO.AsInteger = 9999999) then
      TppShape(Sender).Brush.Color := clSilver
   else
      TppShape(Sender).Brush.Color := cCorZebra;

   if CdsDispAnaliticaTIPOREG.AsInteger = 1 then // Saldo Incial
      dbtSaldoDoDia.BlankWhenZero := False
   else
      dbtSaldoDoDia.BlankWhenZero := True;
end;



function TfrmConsDisponibilidadeMT_novo.BuscaDiaRecolhCPMF(dDataRef:TDateTime):TDateTime;
var dData : TDateTime;
begin
   // Buscar a Quarta-feira da semana da DataRef.
   dData := dDataRef;
   if (DayOfWeek(dData) = 5) then // Quinta
      dData := dData + 6;
   if (DayOfWeek(dData) = 6) then // Sexta
      dData := dData + 5;
   if (DayOfWeek(dData) = 7) then // Sábado
      dData := dData + 4;
   if (DayOfWeek(dData) = 1) then // Domingo
      dData := dData + 3;
   if (DayOfWeek(dData) = 2) then // Segunda
      dData := dData + 2;
   if (DayOfWeek(dData) = 3) then // Terça
      dData := dData + 1;
   if (DayOfWeek(dData) = 4) then // Quarta
      dData := dData;
   dData := dData - 7; // Quanta anterior

   // Verificar se é útil. Se não, buscar o próximo dia útil. Achei o Dia Inicial da CPMF
   if not DiasUteis.DiaUtil(dData,-1,1,'',True,True,False) then
      dData := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);

   // Somar 02 dias úteis para achar o Dia de Recolhimento da CPMF
   Result := DiasUteis.SomaDiasUteis(dData, 2, -1, 1, '', True, True, False);
end;


function TfrmConsDisponibilidadeMT_novo.BuscaPrimeiroDiaIRRF(dDataRef:TDateTime):TDateTime;
var
   iAno, iMes, iDia : word;
begin
   DecodeDate(dDataRef, iAno, iMes, iDia);

   //if ((DiasUteis.ExtraiDia(dDataRef) = 10) or //Bruno Bastos - Sol: 101670 Kintana: 451499
   //    (DiasUteis.ExtraiDia(DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,EncodeDate(iAno,iMes,10),true,true,false)) = DiasUteis.ExtraiDia(dDataRef))) then //Bruno Bastos - Sol: 101670 Kintana: 451499
   //Bruno Bastos - Sol: 101670 Kintana: 451499 - Início
   if ((DiasUteis.ExtraiDia(dDataRef) = 20) or
       (DiasUteis.ExtraiDia(DiasUteis.UltDiaUtilAnterior(Sistema.IdEmpresa,EncodeDate(iAno,iMes,20),true,true,false)) = DiasUteis.ExtraiDia(dDataRef))) then
   //Bruno Bastos - Sol: 101670 Kintana: 451499 - Fim
   begin
      if DiasUteis.DiaUtil(Sistema.IdEmpresa,dDataRef,true,true,false) then
      begin
         //while not (DiasUteis.ExtraiDia(dDataRef) = 11) do //Bruno Bastos - Sol: 101670 Kintana: 451499
         //while not (DiasUteis.ExtraiDia(dDataRef) = DiasUteis.ExtraiDia(DiasUteis.UltDiaMes(iAno, (iMes - 1)))) do //Bruno Bastos - Sol: 101670 Kintana: 451499
         //   dDataRef := dDataRef - 1; //Bruno Bastos - Sol: 101670 Kintana: 451499

         //Bruno Bastos - Sol: 105489 Kintana: 472013 - Início
         if iMes > 1 then
           iMes := iMes - 1
         else
           iMes := 12;
         //Bruno Bastos - Sol: 105489 Kintana: 472013 - Fim

         result := EncodeDate(iAno,iMes,1); //Bruno Bastos - Sol: 105489 Kintana: 472013
         //Bruno Bastos - Sol: 105489 Kintana: 472013 - result := EncodeDate(iAno,iMes - 1,1); //Bruno Bastos - Sol: 101670 Kintana: 451499
         //Result := dDataRef; //Bruno Bastos - Sol: 101670 Kintana: 451499
      end
      else
         Result := 1;
   end
   else
      Result := 1;
end;

function TfrmConsDisponibilidadeMT_novo.BuscaPrimeiDiaAposCPMF(dDataRef:TDateTime):TDateTime;
var
  dData : TDateTime;
begin
  dData := BuscaDiaRecolhCPMF(StrToDate(edtDataRef.Text));
  Result := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa,dData,True,True,False);
end;

procedure TfrmConsDisponibilidadeMT_novo.btnDebugClick(Sender: TObject);
var
  I, iPos: Integer;
  bCopia: Boolean;
  sAtivPlano : string; //Bruno Bastos - SOL: 108052 - Kintana: 497961
begin
   inherited;
   if Trim(cmbTipos.Text) = '' then
   begin
      MsgDlg('Não foi selecionado o tipo de query para "Debugar".','Atenção',mtWarning,[mbOk],0);
      if cmbTipos.CanFocus then
         cmbTipos.SetFocus;
      Exit;
   end
   else
   begin
      qryDebug.Close;
      qryDebug.SQL.Clear;
      memoDebug.Clear;
      Application.ProcessMessages;
      bCopia := False;

      // Somente executa se houver tiver rodado a qrySintetica
      if not CdsDispSintetica.IsEmpty then
      begin
         for I := 0 to (qrySintetica.SQL.Count -1) do
         begin
            // Verifica se a TAG existe na linha atual do SQL
            iPos := Pos(cmbTipos.Value + '_', qrySintetica.SQL.Strings[I]);
            if iPos > 0 then
            begin
               // Verifica se é a TAG inicial ou a final
               if Copy(qrySintetica.SQL.Strings[I], iPos + Length(cmbTipos.Value), 2) = '_I' then
                  // Copia a PRÓXIMA linha e as seguintes
                  bCopia := True
               else
                  // Para de copiar as linhas seguintes
                  bCopia := False;
            end

            //AL_1 Ini
            else
               if bCopia = False then
                  qryDebug.SQL.Add('');

            // Copia a linha de SQL para a query de debug
            if bCopia then
            begin
               qryDebug.SQL.Add(qrySintetica.SQL.Strings[I]);

               // TROCA PARAMETROS
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAREF'      , QuotedStr(DateToStr(dDataRef)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAANT'      , QuotedStr(DateToStr(dDataAnt)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATASALDOANT' , QuotedStr(DateToStr(CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINIMESANT', QuotedStr(DateToStr(dDataIniMesAnt)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAFIMMESANT', QuotedStr(DateToStr(dDataFimMesAnt)));

               //AL_15
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINSS'     , QuotedStr(DateToStr(dDataINSS)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAINIIRRF'  , QuotedStr(DateToStr(dDataIniIRRF)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':DATAFIMIRRF'  , QuotedStr(DateToStr(dDataFimIRRF)));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPATRO'      , IntToStr(CdsDispSinteticaIDPATRO.AsInteger));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPLANOPREV'  , IntToStr(CdsDispSinteticaIDPLANO.AsInteger));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':IDPESSOA'     , IntToStr(Sistema.IdEmpresa));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BSALDOANTINSS', IntToStr(iSaldoAntINSS));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BSALDOANTIRRF', IntToStr(iSaldoAntIRRF));
               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':BQUARTA'      , IntToStr(iQuarta));

               //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Início
               case cmbSitPlano.ItemIndex of
                  0: sAtivPlano := QuotedStr('S');
                  1: sAtivPlano := QuotedStr('N');
                  2: sAtivPlano := 'NULL';
               end;

               qryDebug.SQL.Strings[I] := TrocaString(qryDebug.SQL.Strings[I], ':PSATIVO'      , sAtivPlano);
               //Bruno Bastos - SOL: 108052 - Kintana: 497961 - Fim

               memoDebug.Lines.Add(qryDebug.SQL.Strings[I]);
               memoDebug.refresh;
               Repaint;
            end;
         end;

         // Retira a Primeira linha ( linha com o comentário da TAG )
         if Trim(qryDebug.SQL.Text) <> '' then
         begin
            qryDebug.SQL.Strings[0] := '';

            MontaParametros('qryDebug');

            qryDebug.Open;
            pgcDebug.ActivePage := tbsResulDebug;

         //AL_1 Fim
         end
         else
            MsgDlg('A TAG ' + cmbTipos.Value + ' não foi encontrada no SQL','Atenção',mtWarning,[mbOk],0);
      end
         else
            MsgDlg('A Disponibilidade Consolidada não foi executada.','Atenção',mtWarning,[mbOk],0);
   end;
end;

procedure TfrmConsDisponibilidadeMT_novo.cmbTiposChange(Sender: TObject);
begin
   inherited;
   with qryDebug do
   begin
      Close;
      SQL.Clear;
   end;
end;

function TfrmConsDisponibilidadeMT_novo.TrocaString(sValor, sBusca: String; sTroca: String = ''; bPrimeira: Boolean = False): String;
var
   iPos: Integer;
begin
   Result := sValor;
   if sBusca = sTroca then Exit;
   iPos := Pos(sBusca, sValor);
   while iPos <> 0 do
   begin
      Delete(sValor,iPos, Length(sBusca));
      if sTroca <> '' then
         Insert(sTroca,sValor,iPos);
      if bPrimeira then Exit;
      iPos := Pos(sBusca, sValor);
   end;
   Result := sValor;
end;

procedure TfrmConsDisponibilidadeMT_novo.dbgDebugCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmConsDisponibilidadeMT_novo.dbgDebugTopRowChanged(Sender: TObject);
begin
  inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmConsDisponibilidadeMT_novo.ppLabel3Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TfrmConsDisponibilidadeMT_novo.lblDispAnaSistemaPrint(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TfrmConsDisponibilidadeMT_novo.ppLabel9Print(Sender: TObject);
begin
  inherited;
  TppLabel(Sender).Caption:=Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;
// Andre Imakawa - SIG 132998 - Inicio
procedure TfrmConsDisponibilidadeMT_novo.btnRelatorioClick(
  Sender: TObject);
begin
  inherited;
  if Trim(edtDataRef.Text) <> '' then
  begin
    if StrToDate(edtDataRef.Text) <= CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsDateTime then
    begin
      MsgDlg('A data da Consulta não pode ser menor ou igual à data de ' + #13 +
             'Início de Disponibilidade : ' + CdsParamFinanc.FieldByName('DATAINIDISPFINANC').AsString + '','Atenção',mtWarning,[mbOk],0);
      if edtDataRef.CanFocus then
        edtDataRef.SetFocus;
    end
    else
    begin
      // Andre Imakawa - SIG 136559 - Inicio
      if not CdsDispSintetica.IsEmpty then
      begin
        if qrySintetica.ParamByName('DATAREF').AsString <> edtDataRef.Text then
        begin
         MsgDlg('Data utilizada na diponibilidade consolidada diferente da data de referência. '
               ,'Atenção',mtWarning,[mbOk],0);
         Exit;
        end;
        MontaParametros('qryAnaliticaRel');

        CdsDispAnaliticaRel.Close;
        CdsDispAnaliticaRel.Open;

        if not(CdsDispAnaliticaRel.IsEmpty) then
        begin
          while not CdsDispAnaliticaRel.Eof do
          begin
            if CdsDispSintetica.Locate('IDPATRO;IDPLANO',varArrayof([CdsDispAnaliticaRel.FieldByName('IDPATRO').AsString, CdsDispAnaliticaRel.FieldByName('IDPLANO').AsString]), []) then
            begin
              CdsDispAnaliticaRel.Edit;
              CdsDispAnaliticaRel.FieldByName('RECEBIMENTO_TOTAL_GRUPO').AsFloat := CdsDispSinteticaRECEBIMENTOS.AsFloat;
              CdsDispAnaliticaRel.FieldByName('DESEMBOLSO_TOTAL_GRUPO').AsFloat :=  CdsDispSinteticaDESEMBOLSOS.AsFloat;
              CdsDispAnaliticaRel.FieldByName('SALDO_FINAL_GRUPO').AsFloat := CdsDispSinteticaSALDODIA.AsFloat;
              CdsDispAnaliticaRel.Post;
              CdsDispAnaliticaRel.Next;
            end;

          end;
        end;

        pplAnaliticaRel.DataSource := dsAnaliticaRel;


        LblEmpresaAnaliticaRel.Caption := Sistema.NomeEmpresa;
        lblDataAnaliticaRel.Caption := edtDataRef.Text;

        pplAnaliticaRel.AutoCreateFields := False;
        pplAnaliticaRel.AutoCreateFields := True;

        qryAnaliticaRel.DisableControls;
        CdsDispAnaliticaRel.DisableControls;

        CdsDispAnaliticaRel.Filter := '(RECEBIMENTO_TOTAL_GRUPO <> 0) OR (DESEMBOLSO_TOTAL_GRUPO <> 0) OR (SALDO_INICIAL_GRUPO <> 0) OR (SALDO_FINAL_GRUPO <> 0 )';

        TfrmPreview.CreateModalPreview(Application,
                                       rptDispAnaliticaRel,
                                       rptDispAnaliticaRel.PrinterSetup.DocumentName);
        qryAnaliticaRel.EnableControls;
        CdsDispAnaliticaRel.EnableControls;
      end
      else
      begin
        MsgDlg('Necessário carregar a diponibilidade consolidada antes de emitir o relatório. '
             ,'Atenção',mtWarning,[mbOk],0);
        if edtDataRef.CanFocus then
          edtDataRef.SetFocus;
      end;
      // Andre Imakawa - SIG 136559 - Fim
     end;
  end;
end;

procedure TfrmConsDisponibilidadeMT_novo.ppShape2Print(Sender: TObject);
begin
  inherited;
  if cCorZebra = clWhite then
    cCorZebra := $00E3E3E3
  else
    cCorZebra := clWhite;

  if (FloatField3.AsInteger = -1) or (FloatField3.AsInteger = 9999999) then
    TppShape(Sender).Brush.Color := clSilver
  else
    TppShape(Sender).Brush.Color := cCorZebra;

  if FloatField16.AsInteger = 1 then
    ppDBText17.BlankWhenZero := False
  else
    ppDBText17.BlankWhenZero := True;
end;
// Andre Imakawa - SIG 132998 - Fim
end.
