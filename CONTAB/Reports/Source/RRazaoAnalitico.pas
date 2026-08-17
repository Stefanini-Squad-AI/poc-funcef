{--------------------------------------------------------------------------------
-------------------------------- ALTERAÇÕES -------------------------------------
 N. Chamado....: POS-MIGRACAO-ORACLE-2025 (WO27559)
 Dt Alterações.: 23/11/2025
 Responsável...: Leandro Pocbon
 Descrição.....: Ajuste na função em: CrmRptCMBeforePrint, no sub-sql do campo
                 HISTORICO para atender a exigências diferenciadas do ORACLE.
---------------------------------------------------------------------------------
 N. Chamado....: MIGRACAO-ORACLE-2025 (TAS000000007104)
 Dt Alterações.: 10/11/2025
 Responsável...: Paulo Nobre
 Descrição.....: Ajuste na função em: CrmRptCMBeforePrint, no sub-sql do campo
                 HISTORICO para atender a exigências diferenciadas do ORACLE.
---------------------------------------------------------------------------------
 N. Chamado....: WO11221
 Dt Alterações.: 18/07/2024
 Responsável...: Paulo Nobre
 Descrição.....: Inclusão do número do dossie concatenado à esquerda do histórico
---------------------------------------------------------------------------------
 Desenvolvedor : Helen V Bianchi
 Data          : 04.06.2024
 WO            : WO11006
 Descrição     : Add o Filtro caso o Centro de Custo esteja nulo,usar Contrapartida.
--------------------------------------------------------------------------------
 Desenvolvedor : Taffarel Sevaybriker
 Data          : 25.02.2021
 SOL_Kintana   : SIG113613
 Descrição     : Ajuste na exportação excel para não cortar os dígitos do campo
                 Conta.
--------------------------------------------------------------------------------
 SIG ..........: 102043
 Data .........: 22/12/2020
 Responsável ..: Everson Cunha
 Descrição ....: Máscara de conta por PLANO e período vigente
--------------------------------------------------------------------------------
 Desenvolvedor : Ewerton Beltramini
 Data          : 10.12.2019
 SOL_Kintana   : SIG95174
 Descrição     : Ajuste para corrigir o limite da consulta do relatório
                 analitico a data fim informada em tela.
--------------------------------------------------------------------------------
 Desenvolvedor : Fabio Sampaio
 Data          : 04.11.2019
 SOL_Kintana   : SIG90532
 Descrição     : Ajuste para corrigir na exportação para arquivo .csv
--------------------------------------------------------------------------------
 Desenvolvedor : Rafael Vasconcelos
 Data          : 12.09.2019
 SOL_Kintana   : SIG91302
 Descrição     : Inclusão da Aba "Planilha1" para geração do Excel.
--------------------------------------------------------------------------------
 Desenvolvedor : Everson Cunha
 Data          : 14.11.2018
 SOL_Kintana   : SIG78335
 Descrição     : Inclusão do hint na sqlRazaoAnal.Sql, conforme solicitado pela
                 TMax Soft
--------------------------------------------------------------------------------
 Desenvolvedor : Mosé Cornetta
 Data          : 20.07.2012
 SOL_Kintana   : SOL: 181323 KTN: 1683975
 Descrição     : Inclusão da informação no Relatorio Razão Analitica, do campo
                 "NODOCUMENTO" da tabela DOCUMENTO
--------------------------------------------------------------------------------
 Rotina......: -
 Nº SOL......: 144332
 Nº KINTANA..: 999953
 Data........: 10/08/2011
 Responsável.: Thaise Amaral Martins
 Descrição...: Adicionar quebra de linha no nome da conta
--------------------------------------------------------------------------------
 Desenvolvedor : Ricardo Alves
 Data          : 12.05.2009
 SOL_Kintana   : SOL: 70148 KTN: 523273
 Descrição     : Máscara nas contra-partidas.
--------------------------------------------------------------------------------
 Desenvolvedor : Bruno Bastos
 Data          : 19.03.2009
 SOL_Kintana   : 111778_516106
 Descrição     : Buscar sempre o saldo anterior ao primerio dia.
--------------------------------------------------------------------------------
 Desenvolvedor : Antonio Marcos (amf)
 Data          : 16.08.2007
 Pendência     : 25027 - ajuste
 Descrição     : O problema do formato de data no Excel. Para formatar não
                 basta converter para a String ou forçar uma formatação
                 String da data.
                 A solução para resolver este problema é concatenar
                 um "'" a string da data formatada.
--------------------------------------------------------------------------------
 Desenvolvedor : Antonio Marcos (amf)
 Data          : 06.08.2007
 Pendência     : 25027 - ajuste
 Descrição     : Corrigido o problema da formatação da data.
--------------------------------------------------------------------------------
 Desenvolvedor : Antonio Marcos (amf)
 Data          : 26.07.2007
 Pendência     : 25027
 Descrição     : Não está mais sendo usado o device do ppReport.
                 A conexão é realizada via OleObject com o Excel.
--------------------------------------------------------------------------------
 Data          : 24.07.2007
 Desenvolvedor : Antonio Marcos(amf)
 Pendência     : 25027
 Descrição     : Implementação da exportação do relatório direto para o Excel,
                 via propriedade DeviceType do ppReport. O usuário receberá a
                 tela para indicar o tipo de exportação que deseja.
                 Deve ser escolhida a exportação para Excel. Logo após, o
                 relatório é gerado na tela.
--------------------------------------------------------------------------------
 Data          : 18.09.2006
 Desenvolvedor : Antonio Marcos(amf)
 Pendência     : 23305
 Descrição     : Permitir impressão mesmo que o dataset esteja vazio.
                 Eventos: BeforeGenerate e AfterGenerate.
--------------------------------------------------------------------------------
 Data         : 29/12/2005
 Desenvolvedor: Alex Pereira
 Pendência    :
 Descrição    : Sugestões futuras / rever query com saldo e
                sem movimento ( IMPLEMENTADO )
                #29/12/05 Retirar contra-partida (CP1) para lançamentos de
                partida simples em planilhas com dois lançamentos
--------------------------------------------------------------------------------
 Data         : 15/08/2005
 Desenvolvedor: Rodolpho da Silva
 Pendência    : 19951
 Descrição    : Trocar a exibição do CODCENTROCUSTO para CODEXTERNO da tabela
                CENTCUST da qry do Razão Analítico
--------------------------------------------------------------------------------
 Data         : 09/08/05
 Desenvolvedor: Alex Pereira
 Pendência    : 19902
 Descrição    : Filtrar o relatório pela PLANILHA ao invés da LANCAMENTO
                - a LANCAMENTO quando alterada pelo módulo contábil fica com o
                IDMODULO = 1
--------------------------------------------------------------------------------
 Data         : 22/03/05
 Desenvolvedor: Alex Pereira
 Pendência    :
 Descrição    : Otimizar o relatório, está lento em todos os clientes
                Custo Inicial: 27914 ==> tempo 9min 01seg
                #22/03/05-1 retirar todos as funções RTRIM das queries
                #22/03/05-2 completar os joins faltantes da sub-query CP
                #22/03/05-3 Retirar o alter join de PlanPrevContabil,
                Patro e UnidNegoc
                #22/03/05-4 Colocar as tabelas pessoa como primeiras do from e
                utilizar o sub-tipo PATRO
                #22/03/05-5 Retirar a tabela subconta das sub-queries SA e SS,
                quando não filtrada a sub-conta
                Falta retirar do union, quando imprime contas com
                saldo e sem movimento
                Custo Final: 25424 ==> tempo 1min 18seg

                Sugestões futuras  /  rever query com saldo e sem movimento
                # Retirar contra-partida para lançamentos de partida simples em
                planilhas com dois lançamentos
                Custo Final: 3663 ==> tempo 04seg

                #22/03/05-5 Retirar a tabela subconta das sub-queries SA e SS,
                quando não filtrada a sub-conta
                Falta retirar do union, quando imprime contas com
                saldo e sem movimento

                #22/03/05-6 onde fizer filtro por conta incluir também o plano
--------------------------------------------------------------------------------
 Data         : 19/08/04
 Desenvolvedor: Alex Pereira
 Pendência    : 17116
 Descrição    : O relatório estava dando erro selecionando os filtros
                [19] Quebra do relatório por sub-conta
                [26] Considerar contas com saldo e sem movimento
                Foi necessário fazer um novo sub-select para este relatório.
--------------------------------------------------------------------------------
 Data         : 08/03/04
 Desenvolvedor: Alex Pereira
 Pendência    : 16179
 Descrição    : Na implenentação 14051 feita pelo Bruno, foram criadas duas
                bandas antes da banda da conta contábil, o parâmetro de quebra
                de página não foi alterado conforme opção [21] na ocasião
--------------------------------------------------------------------------------
 Data         : 13/01/04
 Desenvolvedor: Alex Pereira
 Pendência    : 15950
 Descrição    : Corrigindo query com filtro de usuário.
--------------------------------------------------------------------------------
 10.02.2004 - Flavio Dias   - Pendência 16076
              retirado o IDUSUARIOINCLUSAO do Group by, pois estava quebrando
              o relatório indevidamente; acrescentado em
              rptRazaoAnalLabel20.Caption o usuário que digitou,
              quando parâmetro "Usuário" de fParamRazaoAnal preenchido.
 19/01/2004 - André Tavares - Pendência 15950
 07/01/2004 - André Tavares - Pendência 15873
 02/01/2004 - André Tavares - Pendência 15559
 Criação do filtro usuário - IDUSUARIOINCLUSAO

 15/07/2003 - Pendencia 14549 - Alex
 O número de expressões do select, com o union, quando era ecolhida a opção
 'Considerar contas com saldo e sem movimento' estava incorreto

 24/10/2003 - Pendência 1524 - Alex
 Similar a pendência 14549 - alguém incluiu um parâmetro "1 AS NADA" no primeiro
 select - retirado

--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit RRazaoAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, uCmRptManager, TXComp, CmParamReport,uCmSqlParams,jclStrings,
  ppBands, ppClass, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache,
  ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, mask,
  DBClient, Provider, ADODB, uSistema,uCMfileUtils,uCtrlGeral,uCtrlParamIntegra,
  uCMClientDataSet, FCmReport, uCtrlRptBalancete, uCtrlPeriodo, ppModule,UAutorizacao,
  daDataModule, uGImp, raCodMod, FLancaContabMT, ppDrwCMD,fprincipal, TXRB, ComObj,
  ppTypes, ppParameter, uCtrlContab;

type
  TRptRazaoAnalitico = class(TFrmCmReport)
    pplRazaoAnal: TppBDEPipeline;
    dsRazaoAnal: TwwDataSource;
    cdsRazaoAnal: TClientDataSet;
    rptRazaoAnal: TppReport;
    sqlRazaoAnal: TCMSqlParams;
    cdsAtivProjG: TCMClientDataSet;
    sqlAtivProjG: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    giRazao: TGImp;
    SQLAux: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    cdsRazaoAux: TClientDataSet;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLblTitulo: TppLabel;
    ppLine3: TppLine;
    LblNomeEmpresa: TppLabel;
    rptRazaoAnalLabel2: TppLabel;
    rptRazaoAnalLabel4: TppLabel;
    rptRazaoAnalLabel5: TppLabel;
    rptRazaoAnalLine1: TppLine;
    rptRazaoAnalLabel7: TppLabel;
    rptRazaoAnalLabel10: TppLabel;
    rptRazaoAnalLabel13: TppLabel;
    rptRazaoAnalLabel1: TppLabel;
    rptRazaoAnalLabel3: TppLabel;
    rptRazaoAnalLabel6: TppLabel;
    ppLblTitulo2: TppLabel;
    rptRazaoAnalLabel9: TppLabel;
    rptRazaoAnalLabel12: TppLabel;
    rptRazaoAnalLabel14: TppLabel;
    rptRazaoAnalLabel15: TppLabel;
    rptRazaoAnalLabel18: TppLabel;
    rptRazaoAnalLabel20: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    bndDetRazaoAnal: TppDetailBand;
    rptRazaoAnalDBMemo2: TppDBMemo;
    rptRazaoAnalDBText1: TppDBText;
    rptRazaoAnalDBText2: TppDBText;
    dbtxtCCusto: TppDBText;
    dbtxtDebRazAnal: TppDBText;
    dbtxtCreRazAnal: TppDBText;
    rptRazaoAnalDBText10: TppDBText;
    dbtxtUnidNegoc: TppDBText;
    rptRazaoAnalDBText3: TppDBText;
    rptRazaoAnalDBText4: TppDBText;
    dbSumMov: TppDBCalc;
    dbtxtSaldoAnt: TppDBText;
    dbtxtSaldo: TppDBText;
    txtSaldoRazAnal: TppLabel;
    txtDebCreRazAnal: TppLabel;
    dbtxtMovRazAnal: TppDBText;
    dbtxtContraPartida: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    LblNomeSistema: TppLabel;
    ppCalc2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    pplblPatro: TppLabel;
    dbtxtPatro: TppDBText;
    lnCabPatro: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    lnRodPatro: TppLine;
    pplbltotPatro: TppLabel;
    dbCalcTotDebPatro: TppDBCalc;
    dbCalcTotCredPatro: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    pplblPlano: TppLabel;
    dbtxtPlano: TppDBText;
    lnCabPlano: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    pplbltotplano: TppLabel;
    dbCalcTotDebPlano: TppDBCalc;
    dbCalcTotCredPlano: TppDBCalc;
    lnRodPlano: TppLine;
    rptRazaoAnalGroup1: TppGroup;
    rptRazaoAnalGroupHeaderBand1: TppGroupHeaderBand;
    rptRazaoAnalLine2: TppLine;
    dbtxtConta: TppDBText;
    rptRazaoAnalLabel8: TppLabel;
    txtCorresp: TppLabel;
    dbtxtCorresp: TppDBText;
    txtSaldoCabRazAnal: TppLabel;
    txtDebCreCabRazAnal: TppLabel;
    rptRazaoAnalGroupFooterBand1: TppGroupFooterBand;
    rptRazaoAnalDBCalc1: TppDBCalc;
    rptRazaoAnalDBCalc2: TppDBCalc;
    rptRazaoAnalLabel11: TppLabel;
    rptRazaoAnalLine4: TppLine;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppLine69: TppLine;
    ppLabel1: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    rptRazaoAnalGroup2: TppGroup;
    rptRazaoAnalGroupHeaderBand2: TppGroupHeaderBand;
    rptRazaoAnalGroupFooterBandRef: TppGroupFooterBand;
    rptRazaoAnalLabel16: TppLabel;
    rptRazaoAnalDBCalc3: TppDBCalc;
    rptRazaoAnalDBCalc4: TppDBCalc;
    rptRazaoAnalLine3: TppLine;
    ppLabel4: TppLabel;
    ppDBMemo1: TppDBMemo;
    pplRazaoAnalppField41: TppField;
    ppDBText3: TppDBText;
    lblCalcRazAnal: TppSystemVariable;
    lblContRazAnal: TppLabel;
    rptRazaoAnalLabel17: TppLabel;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure rptRazaoAnalGroupHeaderBand1AfterGenerate(Sender: TObject);
    procedure bndDetRazaoAnalAfterGenerate(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);
    procedure rptRazaoAnalGroupHeaderBand1BeforeGenerate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbBramDrawCommandClick(Sender, aDrawCommand: TObject);

  private
    { Private declarations }
    sDataInicial     : String;
    sDataFinal       : String;
    sContaInicial    : String;
    sContaFinal      : String;
    sCCustoInicial   : String;
    sCCustoFinal     : String;
    sSubContaInicial : String;
    sSubContaFinal   : String;
    sAtividade       : String;
    sModulo          : String;
    sHistorico       : String;
    sTipoOperacao    : String;
    bCorresp         : Boolean;
    bContra          : Boolean;
    iPagIni          : Integer;
    sNomePatro       : String;
    sNomePlanoPrev   : String;
    sMascContas      : String;
    sMascCC          : String;
    sMascUnidNeg     : String;
    CtrlGeral : TCtrlGeral;
    CtrlRptBalancete : TCtrlRptBalancete;
    CtrlPeriodo      : TCtrlPeriodo;
    CtrlContab       : TCtrlContab;

    procedure ExportaParaExcel(strPath: string);

  public
    { Public declarations }

  end;

implementation

Uses uCtrlPadroes, uDatabase, DBaseDados, uFuncaoGeral, uString,uModulo, uMensErro,
  FLancSaldosMT,FTelaAut;

{$R *.DFM}

procedure TRptRazaoAnalitico.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;

   sDataInicial     :='';
   sDataFinal       :='';
   sContaInicial    :='';
   sContaFinal      :='';
   sCCustoInicial   :='';
   sCCustoFinal     :='';
   sSubContaInicial :='';
   sSubContaFinal   :='';
   sAtividade       :='';
   sModulo          :='';
   sHistorico       :='';
   sTipoOperacao    :='';
   bCorresp         :=False;
   bContra          :=False;
   iPagIni          :=1;
   sNomePatro       :='';
   sNomePlanoPrev   :='';    

   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   PLACONTA, '+
                                                    '   PLANOME '+
                                                    'FROM '+
                                                    '   PLANOCONTA '+
                                                    'WHERE '+
                                                    '   (PLANO = '+ IntToStr(ParamIntegra.Plano) +') '+
                                                    'ORDER BY PLACONTA';

   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT '+
                                                    '   NOMEMODULO, '+
                                                    '   IDMODULO '+
                                                    'FROM '+
                                                    '   MODULO '+
                                                    'ORDER BY NOMEMODULO';

   CmpRptCM.ParamValues[9].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODSUBCONTA, '+
                                                    '   NOMESUBCONTA '+
                                                    'FROM '+
                                                    '   SUBCONTA '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOMESUBCONTA';

   CmpRptCM.ParamValues[10].LookupSettings.SQL.Text:='SELECT '+
                                                     '   CODSUBCONTA, '+
                                                     '   NOMESUBCONTA '+
                                                     'FROM '+
                                                      '   SUBCONTA '+
                                                     'WHERE '+
                                                     '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                     'ORDER BY NOMESUBCONTA';

   CmpRptCM.ParamValues[11].LookupSettings.SQL.Text:='SELECT '+
                                                     '   HITCODHIST, '+
                                                     '   HITDESCR1 '+
                                                     'FROM '+
                                                     '   HISTOPADRAO '+
                                                     'WHERE '+
                                                     '   (IDPESSOA='+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                     'ORDER BY HITCODHIST';

   CmpRptCM.ParamValues[1].AsDateTime:=Now;
   CmpRptCM.ParamValues[2].AsDateTime:=Now;

end;

procedure TRptRazaoAnalitico.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
   inherited;
   case Index of
      1: sDataInicial:=TPainelControles(Sender).CtrlDateTimePicker.Text;
      2: sDataFinal:=TPainelControles(Sender).CtrlDateTimePicker.Text;
      3: sContaInicial:=TPainelControles(Sender).CtrlLookup.Text;
      4: sContaFinal:=TPainelControles(Sender).CtrlLookup.Text;
      5: sAtividade:=TPainelControles(Sender).CtrlLookup.Text;
      6: sCCustoInicial:=TPainelControles(Sender).CtrlLookup.Text;
      7: sCCustoFinal:=TPainelControles(Sender).CtrlLookup.Text;
      8: sModulo:=TPainelControles(Sender).CtrlLookup.Text;
     11: sHistorico:=TPainelControles(Sender).CtrlLookup.Text;
     12: sTipoOperacao:=TPainelControles(Sender).CtrlLookup.Text;
   end;
end;

procedure TRptRazaoAnalitico.CrmRptCMBeforePrint(Sender: TObject);
var
   sTitulo         : string;
   sIDPlanoPrev    : String;
   sIDPatro        : String;
   sAtivSel        : String;
   sPatroSel       : String;
   sPlanoSel       : String;
   iGrau,iNumDig,iContaReg,iPlano : Integer;
 //=============================================================================
   lstRelatorio : TStrings;
   iContador,iPag,iLinha : Integer;
   sArquivo,sLinha,sPerIni, sPerFim,LinhaCab1,LinhaCab2,LinhaCab3,sDataAnt,sContaAnt : String;
   dMovimento :Double;
   dSaldoConta:Double;
   GuardaReg :TBookMark;
   sPeriodoAnt :string;
   dDebTotPeriodo:Double;
   dCreTotPeriodo:Double;
   dDebTotDia :Double;
   dCreTotDia :Double;
   dCreTotConta :Double;
   dDebTotConta :Double;
   dSaldoDetalhe :Double;
   sDebCreConta,sDebCreDet :string;
   bQuebra :Boolean;

   // Alterado por Arnaldo V. Scarin em 09/03/2009 - Sol 110451 Kintana: 505143
   bQuebraSql   : Boolean;
   sDataSqlIni,
   sDataSqlFim  : tDateTime;
   nPosSql      : Integer;
   nQteDias     : Integer;
   sIndice      : String;

   // Alterado por Arnaldo V. Scarin em 09/03/2009 - Sol 110451 Kintana: 505143
   procedure CopiaClientDataSet();
   var iFields    : Integer;
       sNomeCampo : String;
   begin
     If nPosSql = 1 then
       cdsRazaoAnal.Data := cdsRazaoAux.Data
     else
     begin
       cdsRazaoAux.First;
       while not cdsRazaoAux.Eof do
       begin
         cdsRazaoAnal.Append;
         For iFields := 0 to cdsRazaoAnal.Fields.Count-1 do
           cdsRazaoAnal.Fields[iFields].Value := cdsRazaoAux.Fields[iFields].Value;
         cdsRazaoAnal.Post;
         cdsRazaoAux.Next;
       end;
     end;
   end;

   procedure FazCabecalho;
   var i:integer;
   begin
     if ( iContador > 55) or (iLinha = 0) or (bQuebra) then
     begin
        if iLinha <> 0 then
        begin
          for i := iContador to 62 do
             iLinha := lstRelatorio.Add('');
        end;
        iContador := 9;
        iLinha := lstRelatorio.Add('');
        iLinha := lstRelatorio.Add(StrCenter(Sistema.RazaoSocial,210,' '));
        iLinha := lstRelatorio.Add(StrCenter('Razão Analítico - Período de '+ CmpRptCM.ParamValues[1].AsString + ' a ' + CmpRptCM.ParamValues[2].AsString,210));
        iLinha := lstRelatorio.Add('');

        if LinhaCab1 <> '' then
        begin
           iLinha := lstRelatorio.Add(LinhaCab1);
           inc(iContador);
        end;
        if LinhaCab2 <> '' then
        begin
           inc(iContador);
           iLinha := lstRelatorio.Add(LinhaCab2);
        end;
        if LinhaCab3 <> '' then
        begin
           inc(iContador);
           iLinha := lstRelatorio.Add(LinhaCab3);
        end;
        iLinha := lstRelatorio.Add('Folha: '+IntToStr(iPag));

        iLinha := lstRelatorio.Add('');
        iLinha := lstRelatorio.Add(StrRepeat('-',210));

        sLinha := ' Data          Lanc.   Int.?  Contra-Partida   Cent.Custo   Sub.Conta             Ativ./Proj. Sist. Num.Docto.      Histórico                                        Débito          Crédito               Saldo';
        iLinha := lstRelatorio.Add(sLinha);
        iLinha := lstRelatorio.Add(StrRepeat('-',210));

        iPag := iPag + 1;
        bQuebra := False;
     end;
   end;
 //=============================================================================
begin
   inherited;
   Try
      sDataInicial     := CmpRptCM.ParamValues[1].AsString;
      sDataFinal       := CmpRptCM.ParamValues[2].AsString;
      sContaInicial    := CmpRptCM.ParamValues[3].AsString;
      sContaFinal      := CmpRptCM.ParamValues[4].AsString;
      sAtividade       := CmpRptCM.ParamValues[5].AsString;
      sModulo          := CmpRptCM.ParamValues[8].AsString;
      sSubContaInicial := CmpRptCM.ParamValues[9].AsString;
      sSubContaFinal   := CmpRptCM.ParamValues[10].AsString;
      sHistorico       := CmpRptCM.ParamValues[11].AsString;
      sTipoOperacao    := CmpRptCM.ParamValues[12].AsString;
      sIDPlanoPrev     := CmpRptCM.ParamValues[29].AsString;
      sIDPatro         := CmpRptCM.ParamValues[30].AsString;

      sCCustoInicial := CmpRptCM.ParamValues[6].AsString;
      sCCustoFinal   := CmpRptCM.ParamValues[7].AsString;
      LblNomeEmpresa.Caption := sistema.RazaoSocial;

      sAtivSel := '';
      if trim(CmpRptCM.ParamValues[5].AsString) <> '' then
      begin
         sqlTitulos.SQL.Clear;
         sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                            'FROM  UNIDNEGOCIO '+
                            'WHERE '+
                            '   (IDPESSOA    = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND ' +
                            '   (UNIDNEGOC   = '+CmpRptCM.ParamValues[5].AsString + ') ' +
                            'ORDER BY UNIDNEGOC');
         sqlTitulos.Open;
         sAtivSel := cdsTitulos.FieldByName('NOME').asString;
      end;


      // *** seleciona os nomes da ativ/proj se selecionadas ***
      If  CmpRptCM.ParamValues[31].AsString <> '' then
      Begin
          with sqlAtivProjG.SQL do
          begin
            Clear;
            Add('SELECT UNECODIGO, UNIDNEGOC, NOME                                    ');
            Add('FROM UNIDNEGOCIO                                                     ');
            Add('WHERE                                                                ');
            Add('       (IDPESSOA = '+ FloatToStr(CrmRptCM.IdEmpresa) +')             ');
            Add('   AND (UNETIPO = ''A'')                                             ');
            Add('   AND UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString)+ ') ');
            Add('ORDER BY UNECODIGO                                                   ');
          end;

          sqlAtivProjG.Open;
          sAtivSel  := '';
          iContaReg := 0;
          cdsAtivProjG.First;
          While not cdsAtivProjG.Eof do
          Begin
            Inc(iContaReg);
            If cdsAtivProjG.RecordCount = 1 Then
            Begin
               sAtivSel := Trim(cdsAtivProjG.FieldByName('NOME').AsString)
            End Else
            Begin
              If cdsAtivProjG.RecordCount = iContaReg  Then
                 sAtivSel := sAtivSel + Trim(cdsAtivProjG.FieldByName('NOME').AsString)
              Else
                 sAtivSel := sAtivSel + Trim(cdsAtivProjG.FieldByName('NOME').AsString) + '-';
            End;
            cdsAtivProjG.Next;
          End;
      End;

      //*** preenche titulo com patrocinadoras e planos ***
      If  CmpRptCM.ParamValues[29].AsString <> '' then
      Begin
          with sqlPlanoPrev.SQL do
          begin
            Clear;
            Add('SELECT IDPLANOPREV, NOME              ');
            Add('FROM PLANPREVCONTABIL                 ');
            Add('WHERE IDPLANOPREV IN (' + trim(CmpRptCM.ParamValues[29].AsString)+ ') ');
          end;

          sqlPlanoPrev.Open;
          sPlanoSel  := '';
          iContaReg := 0;
          cdsPlano.First;
          While not cdsPlano.Eof do
          Begin
            Inc(iContaReg);
            If cdsPlano.RecordCount = 1 Then
            Begin
               sPlanoSel := Trim(cdsPlano.FieldByName('NOME').AsString)
            End Else
            Begin
              If cdsPlano.RecordCount = iContaReg  Then
                 sPlanoSel := sPlanoSel + Trim(cdsPlano.FieldByName('NOME').AsString)
              Else
                 sPlanoSel := sPlanoSel +Trim(cdsPlano.FieldByName('NOME').AsString) + '-';
            End;
            cdsPlano.Next;
          End;
      End;

      //*** rotina para pegar as patrocinadoras ***
      If  CmpRptCM.ParamValues[30].AsString <> '' then
      Begin
          with sqlPatro.SQL do
          begin
            Clear;
            Add('SELECT  PA.IDPESSOA, PE.NOME      ');
            Add('FROM PESSOA PE, PATRO PA          ');
            Add('WHERE (PA.IDPESSOA = PE.IDPESSOA) ');
            Add('  AND PA.IDPESSOA IN (' + trim(CmpRptCM.ParamValues[30].AsString)+ ')');
          end;

          sqlPatro.open;
          sPatroSel  := '';
          iContaReg := 0;
          cdsPatro.First;
          While not cdsPatro.Eof do
          Begin
            Inc(iContaReg);
            If cdsPatro.RecordCount = 1 Then
            Begin
               sPatroSel := Trim(cdsPatro.FieldByName('NOME').AsString)
            End Else
            Begin
              If cdsPatro.RecordCount = iContaReg  Then
                 sPatroSel := sPatroSel + Trim(cdsPatro.FieldByName('NOME').AsString)
              Else
                 sPatroSel := sPatroSel + Trim(cdsPatro.FieldByName('NOME').AsString) + '-';
            End;
            cdsPatro.Next;
          End;

      End;

      rptRazaoAnalLabel20.Caption := '';
      rptRazaoAnalLabel18.Caption := '';

      if sAtivSel <> '' then begin
         rptRazaoAnalLabel20.Caption := rptRazaoAnalLabel20.Caption+'Atividade(s)/Projeto(s): ' + sAtivSel;
      end;
      if CmpRptCM.ParamValues[34].asString <> '' Then
         rptRazaoAnalLabel20.Caption := rptRazaoAnalLabel20.Caption+'      | Usuário : ' + CmpRptCM.ParamValues[34].asString;

      if sPatroSel <> '' then begin
         rptRazaoAnalLabel18.Caption := 'Patrocinadoras: ' + sPatroSel;
      end;

      if sPlanoSel <> '' then begin
         rptRazaoAnalLabel18.Caption := rptRazaoAnalLabel18.Caption  + '  Planos: ' + sPlanoSel;
      end;

      //Razão normal
      ppGroupHeaderBand13.Visible            := CmpRptCM.ParamValues[23].AsBoolean; // Quebra Período
      rptRazaoAnalGroupHeaderBand2.Visible   := CmpRptCM.ParamValues[22].AsBoolean; // Quebra Dia
      rptRazaoAnalGroupFooterBandRef.Visible := CmpRptCM.ParamValues[22].AsBoolean; // Quebra Dia
      ppGroupFooterBand13.Visible            := CmpRptCM.ParamValues[23].AsBoolean; // Quebra Período

      //Bruno Bastos - Pend. 14051 - 18/08/2003 - Início
      If CmpRptCM.ParamValues[33].AsBoolean = True Then
      Begin
        Try
          rptRazaoAnal.Groups[0].BreakName := 'NOMEPATRO';
          rptRazaoAnal.Groups[1].BreakName := 'NOMEPLANOPREV';
          ppGroupHeaderBand1.Visible       := True;
          ppGroupHeaderBand2.Visible       := True;
          ppGroupFooterBand2.Visible       := True;
          ppGroupFooterBand1.Visible       := True;
        Except
          MsgDlg(' Você irá visualizar este relatório sem quebra por Patro e Plano. '+#13+
                 ' Para visualizar o relatório com essa quebra, restaure sua configuração. ',
                 'Erro', mtError, [mbOk], 0);
        End;
      End
      else Begin
          rptRazaoAnal.Groups[0].BreakName := '';
          rptRazaoAnal.Groups[1].BreakName := '';
          ppGroupHeaderBand1.Visible       := False;
          ppGroupHeaderBand2.Visible       := False;
          ppGroupFooterBand2.Visible       := False;
          ppGroupFooterBand1.Visible       := False;
      end;

      sDataInicial  := CmpRptCM.ParamValues[1].AsString;
      sDataFinal    := CmpRptCM.ParamValues[2].AsString;
      sContaInicial := CmpRptCM.ParamValues[3].AsString;
      sContaFinal   := CmpRptCM.ParamValues[4].AsString;

      // Alterado por Arnaldo V. Scarin em 09/03/2009 - Sol 110451 Kintana: 505143
      nPosSql       := 1;
      bQuebraSql    := (StrToDate(sDataFinal) - StrToDate(sDataInicial) >= 27);
      If bQuebraSql then
        nQteDias    := 30; // Alterado por FHBS - 04/11/2019 - SIG90532

      CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[1].AsString);

      if CmpRptCM.ParamValues[27].AsString = '' then   //Testa Edit de Título
      begin
          //Imprime os títulos
          sTitulo := 'Razão Analítico - período de ' + sDataInicial + ' a ' + sDataFinal;
          pplblTitulo.caption := sTitulo;

          sTitulo := '';

          if trim(sContaInicial) <> '' then
             sTitulo := sTitulo +  '     Conta Inicial : ' + sContaInicial;

          if trim(sContaFinal) <> '' then
             sTitulo := sTitulo +  '     Conta Final : ' + sContaFinal;

          if trim(sCCustoInicial) <> '' then
             sTitulo := sTitulo +  '     Centro de Custo Inicial : ' + sCCustoInicial ;

          if trim(sCCustoFinal) <> '' then
             sTitulo := sTitulo +  '     Centro de Custo Final : ' + sCCustoFinal;

          if trim(sAtividade) <> '' then
             sTitulo := sTitulo +  '     Atividade/Projeto : '+ sAtividade;

          if trim(sModulo) <> '' then
             sTitulo := sTitulo +  '     Módulo : ' + sModulo;

          if trim(sTipoOperacao) <> '' then
             sTitulo := sTitulo +  '     Tipo de Operação : ' + sTipoOperacao;

          if trim(sHistorico) <> '' then
             sTitulo := sTitulo +  '     Histórico Padrão : ' + sHistorico;

          case CmpRptCM.ParamValues[14].AsInteger of
             0: sTitulo := sTitulo +  '    Lançamentos : TODOS';
             1: sTitulo := sTitulo +  '    Lançamentos : Somente Integrados';
             2: sTitulo := sTitulo +  '    Lançamentos : Somente NÃO Integrados';
          end;


          if CmpRptCM.ParamValues[19].AsBoolean then  // Quebra Sub-Conta
             sTitulo := sTitulo +  '     Quebra por Sub-Conta'
          else
             sTitulo := sTitulo +  '     Quebra por Conta Contábil';

          //WO11006 - Helen V Bianchi - Inicio
          if ( CmpRptCM.ParamValues[38].AsBoolean ) then
              sTitulo := sTitulo +  '     . Utilizar o Centro Custo da ContraPartida caso não tenho Centro de Custo.';
          //WO11006 - Helen V Bianchi - Fim
          pplblTitulo2.caption := sTitulo;

       end else
       begin
         pplblTitulo.caption  := CmpRptCM.ParamValues[27].AsString;
         pplblTitulo2.caption := CmpRptCM.ParamValues[28].AsString;
       end;

      rptRazaoAnal.Groups[2].NewPage := CmpRptCM.ParamValues[21].AsBoolean;

      //Configura a máscara das contas contábeis

      sMascContas  := '';
      sMascCC      := '';
      sMascUnidNeg := '';

      bCorresp:=CmpRptCM.ParamValues[20].AsBoolean;
      bContra :=CmpRptCM.ParamValues[18].AsBoolean;

      CtrlContab.SelecionaPlanoData(CrmRptCM.IdEmpresa,CmpRptCM.ParamValues[1].AsString); //Everson Cunha - SIG102043

      if CmpRptCM.ParamValues[17].AsBoolean then
       begin
          //sMascContas :=ParamIntegra.MascaraPlano; //Everson Cunha - SIG102043
          sMascContas :=CtrlContab.MascaraContaData; //Everson Cunha - SIG102043
          sMascCC     :=ParamIntegra.MascaraCC;
          sMascUnidNeg:=ParamIntegra.MascaraUnidNegoc;
       end;  

      iPagIni := CmpRptCM.ParamValues[16].AsInteger;
      iPlano  := Modulo.iPlano;

      If iPagIni = 0 Then iPagIni := 1;

      iNumDig := 0;
      if CmpRptCM.ParamValues[20].AsBoolean then begin
         iGrau   := CtrlGeral.CalcGrauMax(ParamIntegra.MascaraUnidNegoc);
         iNumDig := CtrlGeral.CalcNumEleGrau(ParamIntegra.MascaraUnidNegoc,(iGrau-1));
      end;

      //Faz a query
      cdsRazaoAnal.Close;
      with sqlRazaoAnal.Sql do
      begin
          Clear;
//          Add('SELECT ');                    //Everson Cunha - SIG78335 - Tibero
          Add('SELECT /*+ use_hash(SS) */ ');  //Everson Cunha - SIG78335 - Tibero
          //Mosé Cornetta SOL 181323 KTN 1683975 INICIO
          Add('L.LACNUMDOC ||')  ;
          Add('(SELECT NVL2(D.NODOCUMENTO,'' - '' || D.NODOCUMENTO,NULL) ');
          Add('FROM DOCUMENTO D,');
          Add('LANCTODOCUM LC');
          Add('WHERE LC.CODDOCUMENTO = D.CODDOCUMENTO');
          Add('AND LC.PLNCODIGO = P.PLNCODIGO');
          Add('AND LC.CODDOCUMENTO = L.CODDOCUMENTO') ;
          Add('AND LC.OPERACAO = 5) NUMBAIXA_NUMDOCUM, ') ;
          //Mosé Cornetta SOL 181323 KTN 1683975 FIM

          Add('L.PLACONTA|| '' '' AS PLACONTA');
          //WO11006 - Helen V Bianchi - Inicio
          //Add(', DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, SC.NOMESUBCONTA, CC.NOME AS NOMECC, C.PLAGRAU, ');
          if ( CmpRptCM.ParamValues[38].AsBoolean ) then
              Add(', DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, SC.NOMESUBCONTA, NVL(CC.NOME,CCP.NOME) AS NOMECC, C.PLAGRAU, ')
          else
              Add(', DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, SC.NOMESUBCONTA, CC.NOME AS NOMECC, C.PLAGRAU, ');
          //WO11006 - Helen V Bianchi - Fim
          if CmpRptCM.ParamValues[25].AsBoolean  then begin
             Add('   U1.UNECODIGO, U1.UNIDNEGOC, U1.NOME,                                ');
          end else begin
             Add('   U.UNECODIGO, U.UNIDNEGOC, U.NOME,                                   ');
          end;
          Add('(0) AS SALDOCABECALHO, ('' '') AS DEBCRECABECALHO,                        ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('   L.PLACONTA||'' - ''||SC.NOMESUBCONTA AS PLACONTAREF,                ');
             Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,         ');
          end else begin
             Add('   L.PLACONTA|| '' '' AS PLACONTAREF, ');
             Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,         ');
          end;
          Add('   L.LACHIST1,L.LACHIST2,L.LACHIST3,L.LACHIST4,L.LACHIST5,               ');
          Add('   C.PLACONCORRESP, L.IDMODULO, P.PLNEFETIVADO, TO_CHAR(P.PLNDATDIA,''YYYYMM'') AS PERIODO,  ');
          Add('   DECODE(P.PLNEFETIVADO,''S'',''*'','' '') AS EFET,                         ');
          Add('   SA.SALDOANT, SS.SALDO, P.PLNCODIGO, P.PLNPLANIL, P.PLNDATDIA,L.LACVALOR,  ');
          Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS MOVIMENT,');

          // Paulo Nobre - TAS000000007104 - Inicio

          // Paulo Nobre - WO11221 - Inicio
//          Add('((SELECT DECODE(D.CODDOSSIE,NULL,NULL,D.CODDOSSIE || '' '' )                    ');
//          Add('  FROM DOCUMENTO D                                                              ');
//          Add('  JOIN LANCTODOCUM LC ON LC.CODDOCUMENTO = D.CODDOCUMENTO                       ');
//          Add('  WHERE LC.CODDOCUMENTO = L.CODDOCUMENTO                                        ');
//          Add('        AND LC.PLNCODIGO = L.PLNCODIGO ) ||                                     ');
//          Add(' RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''|| RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5)) AS HISTORICO, ');
          // Paulo Nobre - WO11221 - Fim

          //WO27559 Leandro - inicio
          {Add('(SELECT DISTINCT                                                             ');
          Add('        DECODE(D.CODDOSSIE, NULL, NULL, D.CODDOSSIE || '' '') ||             ');
          Add('        CAST( RTRIM(L.LACHIST1) || '' '' ||                                  ');
          Add('              RTRIM(L.LACHIST2) || '' '' ||                                  ');
          Add('              RTRIM(L.LACHIST3) || '' '' ||                                  ');
          Add('              RTRIM(L.LACHIST4) || '' '' ||                                  ');
          Add('              RTRIM(L.LACHIST5) AS VARCHAR(254)                              ');
          Add('            )                                                                ');
          Add(' FROM DOCUMENTO D                                                            ');
          Add(' JOIN LANCTODOCUM LC ON LC.CODDOCUMENTO = D.CODDOCUMENTO                     ');
          Add(' WHERE LC.CODDOCUMENTO = L.CODDOCUMENTO                                      ');
          Add('       AND LC.PLNCODIGO = L.PLNCODIGO ) AS HISTORICO,                        ');
          }
          Add('CAST(((SELECT DECODE(D.CODDOSSIE,NULL,NULL,D.CODDOSSIE || '' '' )                    ');
          Add('  FROM DOCUMENTO D                                                              ');
          Add('  JOIN LANCTODOCUM LC ON LC.CODDOCUMENTO = D.CODDOCUMENTO                       ');
          Add('  WHERE LC.CODDOCUMENTO = L.CODDOCUMENTO                                        ');
          Add('        AND LC.PLNCODIGO = L.PLNCODIGO ) ||                                     ');
          Add(' RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''|| RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5))  AS VARCHAR(254)) AS HISTORICO, ');




          //WO27559 Leandro - fim

          // Paulo Nobre - TAS000000007104 - Fim

         if ( CmpRptCM.ParamValues[36].AsBoolean ) then
            Add('   (TO_CHAR(P.PLNPLANIL,''999999'')||'' # ''||LTRIM(TO_CHAR(L.LACNUMLAN,''9999''))) AS LANCAMENTO, ')
         else
            Add('   (TO_CHAR(P.PLNPLANIL,''999999'')||''/''||TO_CHAR(L.LACNUMLAN,''9999'')) AS LANCAMENTO, ');

          Add('   (DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, 0)) AS DEB,                ');
          Add('   (DECODE(L.LACDEBCRE, ''C'', L.LACVALOR, 0)) AS CRED,               ');
          Add('   PE.NOME AS NOMEPATRO, PP.NOME AS NOMEPLANOPREV,                    ');
          Add('   L.IDPATRO, L.IDPLANOPREV,                                          ');
          Add('   (0) AS SALDOCORRENTE,                                              ');
          Add('   ('' '')  AS DEBCRE,                                                ');
          if CmpRptCM.ParamValues[18].AsBoolean  then
             // Ricardo A. SOL: 70148 KTN: 523273
             Add('   CP.CONTRAPARTIDA, CP.CONTRAPARTIDA_PLAGRAU, ')
          else
             Add('   (''                  '') AS CONTRAPARTIDA, ''0'' AS CONTRAPARTIDA_PLAGRAU, ');
          //WO11006 - Helen V Bianchi - Inicio
          //Add('   CC.CODEXTERNO AS CODCENTROCUSTO, L.CODSUBCONTA, L.LACNUMLAN,');
          if ( CmpRptCM.ParamValues[38].AsBoolean ) then
              Add(' NVL(CC.CODEXTERNO,CCP.CODEXTERNO) AS CODCENTROCUSTO, L.CODSUBCONTA, L.LACNUMLAN, CP.CCUSTO_CP, ')
          else
              Add('   CC.CODEXTERNO AS CODCENTROCUSTO, L.CODSUBCONTA, L.LACNUMLAN,');
          //WO11006 - Helen V Bianchi - Fim
          Add('   L.LACDEBCRE, L.LACNUMDOC                                           ');
          Add('FROM                                                                  ');
          Add('   PESSOA PU, PESSOA PE, USUARIOSISTEMA USU, PATRO PT, ');
          //WO11006 - Helen V Bianchi - Inicio
          //Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA SC, UNIDNEGOCIO U, CENTCUST CC, PLANPREVCONTABIL PP, ');
          if ( CmpRptCM.ParamValues[38].AsBoolean ) then
             Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA SC, UNIDNEGOCIO U, CENTCUST CC,CENTCUST CCP, PLANPREVCONTABIL PP, ')
          else
             Add('   LANCAMENTO L, PLANILHA P, PLANOCONTA C, SUBCONTA SC, UNIDNEGOCIO U, CENTCUST CC, PLANPREVCONTABIL PP, ');
          //WO11006 - Helen V Bianchi - Fim
          Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');
          if CmpRptCM.ParamValues[18].AsBoolean  then
          begin
             Add('     (SELECT L.PLNCODIGO, L.LACNUMLAN, L.LACDEBCRE,                ');

             // Ricardo A. SOL: 70148 KTN: 523273
             if CmpRptCM.ParamValues[20].AsBoolean  then
                Add('             C.PLACONCORRESP AS CONTRAPARTIDA,                   ')
             else
                Add('             L.PLACONTA AS CONTRAPARTIDA,                        ');
             Add('      C.PLAGRAU AS CONTRAPARTIDA_PLAGRAU                            ');
             //WO11006 - Helen V Bianchi - Inicio
             if ( CmpRptCM.ParamValues[38].AsBoolean ) then
                 Add('          , L.CODCENTROCUSTO AS CCUSTO_CP , L.IDEMPRESA         ');
             //WO11006 - Helen V Bianchi - Fim
             Add('      FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C                  ');
             Add('      WHERE                                                        ');
             Add('            (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM)            ');
             Add('        AND (P.PEREXERCICIO >= :EXERCICIO)                         ');
             Add('        AND (P.IDPESSOA = :IDPESSOA)                        ');

             Add('        AND (P.PLNCODIGO = L.PLNCODIGO) ');
             Add('        AND (L.PLACONTA = C.PLACONTA)   ');
             Add('        AND (L.PLANO    = C.PLANO)      ');
             Add('        AND (EXISTS (SELECT X.PLNCODIGO                            ');
             Add('                     FROM PLANILHA X, LANCAMENTO Y                 ');
             Add('                     WHERE                                         ');
             Add('                           (X.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) ');
             Add('                       AND (X.PEREXERCICIO >= :EXERCICIO)                         ');
             Add('                       AND (X.IDPESSOA = :IDPESSOA)         ');
             Add('                       AND (Y.PLACONTA >=:CONTAINI)         ');
             Add('                       AND (Y.PLACONTA <=:CONTAFIM)         ');
             Add('                       AND (X.PLNCODIGO = Y.PLNCODIGO)             ');
             Add('                       AND (P.PLNCODIGO = X.PLNCODIGO)))           ');
             Add('        AND (L.PLNCODIGO=P.PLNCODIGO)                              ');
             Add('        AND (L.LACTIPO = ''2'')                                    ');
             Add('        AND (C.PLANO = L.PLANO)                                    ');
             Add('        AND (C.PLACONTA = L.PLACONTA))  CP,                        ');

          end;
          if CmpRptCM.ParamValues[25].AsBoolean  then begin
             Add('   (SELECT UNIDNEGOC, UNECODIGO, NOME FROM UNIDNEGOCIO               ');
             Add('    WHERE (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')                ');
             Add('      AND (IDPESSOA =:IDPESSOA) ) U1,                                ');
          end;

          // Início SALDO ANTERIOR
          Add('   (SELECT                                                              ');
          Add('       S.PLACONTA,                                                      ');

          if CmpRptCM.ParamValues[33].AsBoolean then begin
            Add('       S.IDPATRO, S.IDPLANOPREV,');
          end;

          if CmpRptCM.ParamValues[19].AsBoolean then begin
             Add('    S.CODSUBCONTA, S.IDPESSOA,                                        ');
          end;

          Add('       SUM(DECODE(S.PLSDEBITOCORRENTE, NULL, 0, S.PLSDEBITOCORRENTE) -   ');
          Add('           DECODE(S.PLSCREDITOCOR, NULL, 0, S.PLSCREDITOCOR)) AS SALDOANT ');
          Add('    FROM PLANOSALDO S                                        ');
          if (CmpRptCM.ParamValues[19].AsBoolean) or
             (trim(sSubContaInicial)<> '') or
             (trim(sSubContaFinal) <> '') then
          Add('    , SUBCONTA SC                                      ');

          if ((Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '')) then
          Add('   , CENTCUST CC');

          Add('    WHERE                                                                ');
          Add('	      (S.PEREXERCICIO =:EXERCICIO) AND                                  ');
          Add('       (S.PERNUMERO IS NULL) AND                                         ');
          Add('       (S.PLANO = :PLANO) AND                                            ');
          Add('       (S.PLACONTA >=:CONTAINI)  AND                                    ');
          Add('       (S.PLACONTA <=:CONTAFIM) AND                                     ');
          Add('       (S.IDPESSOA =:IDPESSOA) AND                                       ');
          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('   (S.CODSUBCONTA IS NOT NULL)  AND                                   ');
          end;
          if trim(sAtividade) <> '' then begin
             Add('   ((S.UNIDNEGOC =:UNIDNEGOC) AND                                     ');
             Add('   (S.IDPESSOA =:PESSOA)) AND                                         ');
          end;
          if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
             if trim(sSubContaInicial) <> '' then begin
                Add('   ((S.CODSUBCONTA >= :SUBCONTAINI) AND                            ');
                Add('   (S.IDPESSOA =:PESSOA)) AND                                      ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('   ((S.CODSUBCONTA <= :SUBCONTAFIM) AND                            ');
                Add('   (S.IDPESSOA =:PESSOA)) AND                                      ');
             end;
          end else begin
             if trim(sSubContaInicial) <> '' then begin
                Add('   ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                          ');
                Add('   (S.IDPESSOA =:PESSOA)) AND                                      ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('  ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                           ');
                Add('  (S.IDPESSOA =:PESSOA)) AND                                       ');
             end;
          end;

          if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
             Add('     (S.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
          end;

         if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('     (S.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND             ');
         end;
         if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('     (S.IDPATRO IN (' + trim(sIDPatro) + ')) AND                     ');
         end;

         if Trim(sCCustoInicial) <> '' then
         Add('   (CC.CODEXTERNO >= :CCUSTOINI) AND');

         if Trim(sCCustoFinal) <> '' then
         Add('   (CC.CODEXTERNO <= :CCUSTOFIM) AND');

         if (Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '') then
         begin
            Add('   (S.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
            Add('   (S.IDEMPRESA      = CC.IDEMPRESA) AND');
            Add('   (CC.IDEMPRESA     = :EMPRESA) AND');
         end;

          if (CmpRptCM.ParamValues[19].AsBoolean) or
             (trim(sSubContaInicial)<> '') or
             (trim(sSubContaFinal) <> '') then begin
             Add('      (S.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                           ');
             Add('      (S.IDPESSOA    = SC.IDPESSOA(+))                                  ');
          end else
             Add('      (1=1)                                  ');


          Add('    GROUP BY S.PLACONTA                                                 ');

          if CmpRptCM.ParamValues[33].AsBoolean  then begin
            Add('    ,S.IDPATRO, S.IDPLANOPREV');
          end;

          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('    ,S.CODSUBCONTA, S.IDPESSOA                                            ');
          end;

             Add('    ) SA,                                                             ');

          // Início SALDO ATUAL
          Add('   (SELECT                                                               ');
          Add('       L.PLACONTA,                                                       ');

          if CmpRptCM.ParamValues[33].AsBoolean then begin
            Add('       L.IDPATRO, L.IDPLANOPREV,');
          end;

          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('    L.CODSUBCONTA, L.IDPESSOA,                                                ');
          end;

          Add('       SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS SALDO');
          Add('    FROM PLANILHA P, LANCAMENTO L                                     ');

          if ((Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '')) then
          Add('   , CENTCUST CC');

          if (CmpRptCM.ParamValues[19].AsBoolean) or
             (trim(sSubContaInicial)<> '') or
             (trim(sSubContaFinal) <> '') then
             Add('    ,SUBCONTA SC                                     ');
          Add('    WHERE                                                               ');
          Add('	         (P.PEREXERCICIO =:EXERCICIO) AND                              ');
          //Bruno Bastos - Kintana: 516106 - SOL: 111778 - Add('          (P.PLNDATDIA < :DATAINI)  AND                                 ');
          Add('          (P.PLNDATDIA < :DATAINICIAL)  AND                             '); //Bruno Bastos - Kintana: 516106 - SOL: 111778

          if CmpRptCM.ParamValues[14].AsInteger = 1  then begin
             Add('       (P.PLNEFETIVADO = ''S'') AND                                  ');
          end;
          if CmpRptCM.ParamValues[14].AsInteger = 2  then begin
             Add('       ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND    ');
          end;

          Add('          (P.IDPESSOA =:IDPESSOA) AND                                   ');
          Add('          (L.PLNCODIGO = P.PLNCODIGO) AND                               ');

          // Alterado por Arnaldo V. Scarin em 11/08/2008 - Kintana 394000 - SOL 92127
          Add('          (L.PLANO = :PLANO) AND ');

          Add('          (L.PLACONTA >= :CONTAINI) AND                          ');
          Add('          (L.PLACONTA <= :CONTAFIM) AND                          ');

          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('       (L.CODSUBCONTA IS NOT NULL) AND                               ');
          end;

          if  trim(sAtividade) <> '' then begin
             Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                                ');
             Add('       (L.IDPESSOA =:PESSOA)) AND                                    ');
          end;
          if CmpRptCM.ParamValues[15].AsInteger = 0 then begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((L.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((L.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
          end else begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                 ');
             end;
          end;
          if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
             Add('      (L.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
          end;

         if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND      ');
         end;
         if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND ');
         end;

         if Trim(sCCustoInicial) <> '' then
         Add('   (CC.CODEXTERNO >= :CCUSTOINI) AND');

         if Trim(sCCustoFinal) <> '' then
         Add('   (CC.CODEXTERNO <= :CCUSTOFIM) AND');

         if (Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '') then
         begin
            Add('   (L.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
            Add('   (L.IDEMPRESA      = CC.IDEMPRESA) AND');
            Add('   (CC.IDEMPRESA     = :EMPRESA) AND');
            //WO11006 - Helen V Bianchi - Inicio
            if ( CmpRptCM.ParamValues[38].AsBoolean ) then
            begin
                 Add('   ((CP.CCUSTO_CP = CCP.CODCENTROCUSTO(+)) AND ');
                 Add('    (CP.IDEMPRESA = CCP.IDEMPRESA(+))) AND   ');
            end;
            //WO11006 - Helen V Bianchi - Fim
         end;

         if trim(sModulo) <> '' then begin
             Add('       (P.IDMODULO =:MODULO) AND                                   ');
         end;

         if trim(sTipoOperacao) <> '' then begin
             if CmpRptCM.ParamValues[13].AsBoolean then begin
                Add('       (L.TIPCODIGO <> :TIPO) AND                 ');
             end else begin
                Add('       (L.TIPCODIGO = :TIPO) AND                  ');
             end;
         end;

         if trim(sHistorico) <> '' then begin
             Add('       (L.HITCODHIST = :HIST) AND                    ');
         end;
          if (CmpRptCM.ParamValues[19].AsBoolean) or
             (trim(sSubContaInicial)<> '') or
             (trim(sSubContaFinal) <> '') then begin
             Add('       (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                        ');
             Add('       (L.IDPESSOA = SC.IDPESSOA(+))                                  ');
          end else
             Add('       (1=1)                        ');
          Add('    GROUP BY L.PLACONTA                                               ');

          if CmpRptCM.ParamValues[33].AsBoolean  then begin
            Add('    ,L.IDPATRO, L.IDPLANOPREV');
          end;

          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add('    ,L.CODSUBCONTA, L.IDPESSOA                                     ');
          end;
          Add('    ) SS                                                                ');

          // Parte Final da Query
          Add('WHERE                                                                 ');
          Add('    (P.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                   ');
          Add('    (P.PEREXERCICIO >= :EXERCICIO) AND                        ');
          if CmpRptCM.ParamValues[14].AsInteger = 1  then begin
             Add(' (P.PLNEFETIVADO = ''S'') AND                                      ');
          end;
          if CmpRptCM.ParamValues[14].AsInteger = 2  then begin
             Add(' ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND        ');
          end;

          if trim(sAtividade) <> '' then  begin
             Add(' ((L.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
             Add('  (L.IDPESSOA =:PESSOA)) AND                                       ');
          end;
          if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((L.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((L.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
          end else begin
             if trim(sSubContaInicial) <> '' then begin
                Add('       ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
             if trim(sSubContaFinal) <> '' then begin
                Add('       ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                               ');
             end;
          end;
          if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
             Add('      (L.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
          end;
          if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
             Add('      (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND      ');
          end;
          if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
             Add('      (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND              ');
          end;

          if Trim(sCCustoInicial) <> '' then
          Add('   (CC.CODEXTERNO >= :CCUSTOINI) AND');

          if Trim(sCCustoFinal) <> '' then
          Add('   (CC.CODEXTERNO <= :CCUSTOFIM) AND');

          if ((Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '')) then
          Add('   (CC.IDEMPRESA = :EMPRESA) AND');


          if trim(sModulo) <> '' then  begin
             Add(' (P.IDMODULO =:MODULO) AND                                        ');
          end;
          if trim(sTipoOperacao) <> '' then  begin
             if CmpRptCM.ParamValues[13].AsBoolean then begin
                Add('       (L.TIPCODIGO <> :TIPO) AND                ');
             end else begin
                Add('       (L.TIPCODIGO = :TIPO) AND                 ');
             end;
          end;
          if trim(sHistorico) <> '' then begin
             Add(' (L.HITCODHIST = :HIST) AND                                          ');
          end;
          Add('    (P.IDPESSOA =:IDPESSOA) AND                               ');
          Add('    (L.PLNCODIGO = P.PLNCODIGO) AND                                  ');
          Add('    (L.PLACONTA >= :CONTAINI) AND                             ');
          Add('    (L.PLACONTA <= :CONTAFIM) AND                             ');
          if CmpRptCM.ParamValues[24].AsBoolean  then begin
             Add('     (C.PLAGRUPO <> ''E'') AND                                    ');
          end;
          Add('    ((L.PLANO = C.PLANO) AND                                         ');
          Add('    (L.PLACONTA = C.PLACONTA)) AND                                   ');
          Add('    (PD.PLANO(+) = C.PLANO) AND                                      ');
          Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                ');
          Add('    ((L.UNIDNEGOC = U.UNIDNEGOC) AND                              ');
          Add('    (L.IDPESSOA = U.IDPESSOA)) AND                                ');
          if CmpRptCM.ParamValues[25].AsBoolean  then begin
             Add('    (SUBSTR(U.UNECODIGO,1,'+IntToStr(iNumDig)+') = U1.UNECODIGO(+)) AND ');
          end;
          if CmpRptCM.ParamValues[18].AsBoolean  then begin
             Add('   (L.PLNCODIGO = CP.PLNCODIGO(+)) AND                            ');
             Add('   (L.LACNUMLAN = CP.LACNUMLAN(+)) AND                            ');
             Add('   (L.LACDEBCRE <> CP.LACDEBCRE(+)) AND                           ');
          end;
          Add('    (L.IDPLANOPREV = PP.IDPLANOPREV) AND                          ');
          Add('    (PT.IDPESSOA = PE.IDPESSOA) AND                                 ');
          Add('    (PT.IDPESSOA = L.IDPATRO) AND                                 ');
          Add('    ((L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND                   ');
          Add('    (L.IDEMPRESA = CC.IDEMPRESA(+))) AND                             ');
           //WO11006 - Helen V Bianchi - Inicio
           if ( CmpRptCM.ParamValues[38].AsBoolean ) then
           begin
              Add('   ((CP.CCUSTO_CP = CCP.CODCENTROCUSTO(+)) AND ');
              Add('    (CP.IDEMPRESA = CCP.IDEMPRESA(+))) AND   ');
           end;
           //WO11006 - Helen V Bianchi - Fim
          Add('    (SA.PLACONTA(+) = L.PLACONTA) AND                                ');
          Add('    (SS.PLACONTA(+) = L.PLACONTA) AND                                ');

          if CmpRptCM.ParamValues[33].AsBoolean  then begin
              Add('    (SA.IDPLANOPREV(+) = L.IDPLANOPREV) AND');
              Add('    (SS.IDPLANOPREV(+) = L.IDPLANOPREV) AND');
              Add('    (SA.IDPATRO(+) = L.IDPATRO) AND');
              Add('    (SS.IDPATRO(+) = L.IDPATRO) AND');
            end;

          if CmpRptCM.ParamValues[19].AsBoolean  then begin
             Add(' (L.CODSUBCONTA IS NOT NULL) AND                                  ');
             Add(' (SA.CODSUBCONTA(+) = L.CODSUBCONTA) AND                          ');
             Add(' (SA.IDPESSOA(+)    = L.IDPESSOA)    AND                          ');
             Add(' (SS.CODSUBCONTA(+) = L.CODSUBCONTA) AND                          ');
             Add(' (SS.IDPESSOA(+)    = L.IDPESSOA)    AND                          ');
          end;

          Add('    (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                          ');
          Add('    (L.IDPESSOA    = SC.IDPESSOA(+))                                 ');

          if (CmpRptCM.ParamValues[34].asFloat <> 0) and (not CmpRptCM.ParamValues[34].IsNull) then
          begin
            Add(' AND (L.IDUSUARIOINCLUSAO = '+ CmpRptCM.ParamValues[34].asString  + ')');
          end;
          Add(' AND (USU.IDUSUARIO = PU.IDPESSOA) AND (USU.IDUSUARIO = L.IDUSUARIOINCLUSAO) ');


          if CmpRptCM.ParamValues[26].AsBoolean  then begin
             Add('UNION ALL                                                         ');
             Add('SELECT                                                            ');
             Add('    C.PLACONTA, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME, ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('   SC.NOMESUBCONTA, ');
             end else begin
                Add('   ''                                                           '' AS NOMESUBCONTA, ');
             end;
             Add('   ''                              '' AS NOMECC,  C.PLAGRAU,      ');
             Add('   ''          '' AS UNECODIGO, (0) AS UNIDNEGOC, ''                              '' AS NOME, ');
             Add('   (0) AS SALDOCABECALHO, ('' '') AS DEBCRECABECALHO,             ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('   C.PLACONTA||'' - ''||SC.NOMESUBCONTA AS PLACONTAREF,        ');
                Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF, ');
             end else begin
                Add('   C.PLACONTA||''                                                               '' AS PLACONTAREF, ');
                Add('   DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOMEREF,                                    ');
             end;
             Add('   ''                                        '' AS LACHIST1, ');
             Add('   ''                                        '' AS LACHIST2, ');
             Add('   ''                                        '' AS LACHIST3, ');
             Add('   ''                                        '' AS LACHIST4, ');
             Add('   ''                                        '' AS LACHIST5, ');

             Add('   C.PLACONCORRESP, 0 AS IDMODULO, ''S'' AS PLNEFETIVADO, TO_CHAR(TO_DATE('''+sDataInicial+''',''DD/MM/YYYY''),''YYYYMM'') AS PERIODO,  ');
             Add('   ''*'' AS EFET,  ');
             if CmpRptCM.ParamValues[19].AsBoolean then
                Add('   SALDO.SALDOANT, SALDO.SALDO, ')
             else
                Add('   SA.SALDOANT, SS.SALDO, ');

             Add('   0 AS PLNCODIGO, 0 AS PLNPLANIL, TO_DATE('''+sDataInicial+''',''DD/MM/YYYY'') AS PLNDATDIA,   ');
             Add('   (0) AS LACVALOR, (0) AS MOVIMENT,                                      ');
             Add('    ''SALDO ANTERIOR'' AS HISTORICO,                                      ');
             Add('   (TO_CHAR(0,''999999'')||''/''||TO_CHAR(0,''999'')) AS LANCAMENTO,      ');
             Add('   (0) AS DEB,                                                            ');
             Add('   (0) AS CRED,                                                           ');

             if CmpRptCM.ParamValues[33].AsBoolean then
               begin
                 Add('   C.NOMEPATRO, C.NOMEPLANOPREV, ');
                 Add('   C.IDPATRO, C.IDPLANOPREV,  ');
               end
             else
               begin
                 Add('   (''                                                    '') AS NOMEPATRO,     ');
                 Add('   (''                                                    '') AS NOMEPLANOPREV, ');
                 Add('   (0) AS IDPATRO, (0) AS IDPLANOPREV,  ');
               end;

             Add('   (0) AS SALDOCORRENTE,                                                  ');
             Add('   ('' '')  AS DEBCRE, (''                  '') AS CONTRAPARTIDA,         ');
             Add('   (''          '') AS CODCENTROCUSTO,                                    ');
             if CmpRptCM.ParamValues[19].AsBoolean then
                Add('   SC.CODSUBCONTA,                                                     ')
             else
                Add('   (0) AS CODSUBCONTA,                                                 ');

             Add('   (0) AS LACNUMLAN,                                                      ');
             Add('   ('' '') AS LACDEBCRE, (''               '') AS LACNUMDOC               ');
             Add('FROM                                                                      ');

             if CmpRptCM.ParamValues[33].AsBoolean then
               begin
                 Add('   (SELECT P.IDPLANOPREV, P.IDPATRO, C.PLACONTA, C.PLANO,    ');
                 Add('           C.PLATIPO, C.PLACONCORRESP, C.PLANOME, C.PLAGRAU, ');
                 aDD('           PE.NOME AS NOMEPATRO, PC.NOME AS NOMEPLANOPREV    ');
                 Add('      FROM PESSOA PE, PATRO PT, PLANPREVCONTABPATRO P, PLANOCONTA C, PLANPREVCONTABIL PC ');
                 Add('     WHERE (C.PLANO = :PLANO) AND                            ');
                 Add('     (C.PLACONTA >= :CONTAINI) AND                    ');
                 Add('     (C.PLACONTA <= :CONTAFIM) AND                    ');
                 Add('     (C.PLATIPO = ''A'') AND                                 ');
                 Add('     (PE.IDPESSOA = PT.IDPESSOA) AND                         ');
                 Add('     (PT.IDPESSOA = P.IDPATRO) AND                           ');
                 Add('     (PC.IDPLANOPREV = P.IDPLANOPREV)                        ');
                 Add('   ) C,                                                      ');
               end
             else
               begin
                 Add('   PLANOCONTA C, ');
               end;

             if CmpRptCM.ParamValues[19].AsBoolean then
                Add('   CONTASXSUBC CS, ');

             Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD, ');

             if CmpRptCM.ParamValues[19].AsBoolean  then
                Add('   SUBCONTA SC, ');

             // foi criada uma sub-query diferente para se obter o saldo por plano / sub-conta
             if CmpRptCM.ParamValues[19].AsBoolean then begin
                Add('(SELECT CS.CODSUBCONTA, CS.IDPESSOA, CS.PLACONTA, CS.PLANO, SUM(NVL(SA.SALDOANT, 0)) AS SALDOANT, SUM(NVL(SS.SALDO,0)) AS SALDO ');
                Add('FROM CONTASXSUBC CS, ');
             end;

             // Início: SALDO ANTERIOR (UNION ALL)
             Add('   (SELECT                                                                ');
             Add('       S.PLACONTA, S.PLANO,                                               ');

             if CmpRptCM.ParamValues[33].AsBoolean then begin
               Add('       S.IDPATRO, S.IDPLANOPREV,');
             end;

             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    S.CODSUBCONTA, S.IDPESSOA,                                                 ');
             end;

             Add('       SUM(NVL(S.PLSDEBITOCORRENTE, 0) -  NVL(S.PLSCREDITOCOR, 0)) AS SALDOANT ');
             Add('    FROM PLANOSALDO S  ,SUBCONTA SC                                       ');

             if ((Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '')) then
                Add('  , CENTCUST CC ');

             Add('    WHERE                                                                 ');
             Add('       (S.PEREXERCICIO =:EXERCICIO) AND                                   ');
             Add('       (S.PERNUMERO IS NULL) AND                                          ');
             Add('       (S.PLANO =:PLANO) AND                                              ');
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('       (S.CODSUBCONTA IS NOT NULL) AND                                    ');
             end;

             if trim(sAtividade) <> '' then begin
                Add('    ((S.UNIDNEGOC =:UNIDNEGOC) AND                                    ');
                Add('    (S.IDPESSOA =:PESSOA)) AND                                        ');
             end;

             if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('  ((S.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                        ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('  ((S.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                        ');
                end;
             end else begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('  ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                           ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                       ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('  ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                           ');
                   Add('  (S.IDPESSOA =:PESSOA)) AND                                       ');
                end;
             end;
             if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
                Add('      (S.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
             end;
             if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
                Add('      (S.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND ');
             end;
             if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
                Add('      (S.IDPATRO IN (' + trim(sIDPatro) + ')) AND ');
             end;

             if Trim(sCCustoInicial) <> '' then
             Add('   (CC.CODEXTERNO >= :CCUSTOINI) AND');

             if Trim(sCCustoFinal) <> '' then
             Add('   (CC.CODEXTERNO <= :CCUSTOFIM) AND');

             if (Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '') then
             begin
                Add('   (S.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
                Add('   (S.IDEMPRESA      = CC.IDEMPRESA) AND');
                Add('   (CC.IDEMPRESA     = :EMPRESA) AND');
             end;


             Add('          (S.PLACONTA >=:CONTAINI) AND                   ');
             Add('          (S.PLACONTA <=:CONTAFIM) AND                   ');
             Add('          (S.IDPESSOA =:IDPESSOA) AND                     ');
             Add('          (S.CODSUBCONTA = SC.CODSUBCONTA(+)) AND         ');
             Add('          (S.IDPESSOA    = SC.IDPESSOA(+))                ');
             Add('    GROUP BY S.PLACONTA, S.PLANO                          ');

             if CmpRptCM.ParamValues[33].AsBoolean  then begin
               Add('    ,S.IDPATRO, S.IDPLANOPREV');
             end;

             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    ,S.CODSUBCONTA, S.IDPESSOA                          ');
             end;
                Add('    ) SA,                                               ');

             Add('   (SELECT                                                 ');
             Add('       L.PLACONTA, L.PLANO,                                ');

             if CmpRptCM.ParamValues[33].AsBoolean then begin
               Add('       L.IDPATRO, L.IDPLANOPREV,');
             end;

             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('    L.CODSUBCONTA, L.IDPESSOA,                          ');
             end;

             Add('       SUM(DECODE(L.LACDEBCRE, ''D'', L.LACVALOR, (L.LACVALOR * (-1)))) AS SALDO');
             Add('    FROM PLANILHA P, LANCAMENTO L, SUBCONTA SC                                     ');

             if ((Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '')) then
                Add('  , CENTCUST CC ');


             Add('    WHERE                                                             ');
             Add('          (P.PEREXERCICIO =:EXERCICIO) AND                              ');
             Add('          (P.PLNDATDIA < :DATAINI)  AND                               ');
             if  CmpRptCM.ParamValues[14].AsInteger = 1 then begin
                Add('       (P.PLNEFETIVADO = ''S'') AND                                    ');
             end;
             if  CmpRptCM.ParamValues[14].AsInteger = 2 then begin
                Add('       ((P.PLNEFETIVADO = ''N'') OR (P.PLNEFETIVADO IS NULL)) AND      ');
             end;
             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('       (L.CODSUBCONTA IS NOT NULL) AND                             ');
             end;
             if trim(sAtividade) <> '' then begin
                Add('       ((L.UNIDNEGOC =:UNIDNEGOC) AND                              ');
                Add('       (L.IDPESSOA =:PESSOA)) AND                                  ');
             end;
             if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('     ((L.CODSUBCONTA >= :SUBCONTAINI) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('     ((L.CODSUBCONTA <= :SUBCONTAFIM) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
             end else begin
                if trim(sSubContaInicial) <> '' then begin
                   Add('     ((SC.NOMESUBCONTA >= :SUBCONTAINI) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
                if trim(sSubContaFinal) <> '' then begin
                   Add('     ((SC.NOMESUBCONTA <= :SUBCONTAFIM) AND                              ');
                   Add('     (L.IDPESSOA =:PESSOA)) AND                                    ');
                end;
             end;
             if trim(CmpRptCM.ParamValues[31].AsString) <> '' then begin
                Add('        (L.UNIDNEGOC IN (' + trim(CmpRptCM.ParamValues[31].AsString) + ')) AND ');
             end;
             if (trim(sIDPlanoPrev) <> '') and (trim(sIDPlanoPrev) <> '0') then begin
                 Add('       (L.IDPLANOPREV IN (' + trim(sIDPlanoPrev) + ')) AND          ');
             end;
             if (trim(sIDPatro) <> '') and (trim(sIDPatro) <> '0') then begin
                 Add('       (L.IDPATRO IN (' + trim(sIDPatro) + ')) AND                  ');
             end;

             if Trim(sCCustoInicial) <> '' then
             Add('   (CC.CODEXTERNO >= :CCUSTOINI) AND');

             if Trim(sCCustoFinal) <> '' then
             Add('   (CC.CODEXTERNO <= :CCUSTOFIM) AND');

             if ((Trim(sCCustoInicial) <> '') or (Trim(sCCustoFinal) <> '')) then
             begin
                Add('   (CC.IDEMPRESA     = :EMPRESA) AND');
                Add('   (L.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND');
                Add('   (L.IDEMPRESA      = CC.IDEMPRESA) AND');
                //WO11006 - Helen V Bianchi - Inicio
                if ( CmpRptCM.ParamValues[38].AsBoolean ) then
                begin
                    Add('   ((CP.CCUSTO_CP = CCP.CODCENTROCUSTO(+)) AND ');
                    Add('    (CP.IDEMPRESA = CCP.IDEMPRESA(+))) AND   ');
                end;
                //WO11006 - Helen V Bianchi - Fim
             end;

             if trim(sModulo) <> '' then begin
                Add('       (P.IDMODULO =:MODULO) AND                                       ');
             end;
             if trim(sTipoOperacao) <> '' then begin
                if CmpRptCM.ParamValues[13].AsBoolean then begin
                   Add('    (L.TIPCODIGO <> :TIPO) AND                       ');
                end else begin
                   Add('    (L.TIPCODIGO = :TIPO) AND                        ');
                end;
             end;
             if trim(sHistorico) <> '' then begin
                Add('       (L.HITCODHIST = :HIST) AND                       ');
             end;
             Add('	    (P.PEREXERCICIO =:EXERCICIO) AND                               ');
             if (CmpRptCM.ParamValues[34].asFloat <> 0) and (not CmpRptCM.ParamValues[34].IsNull) then
             begin
               Add('         (L.IDUSUARIOINCLUSAO = '+ CmpRptCM.ParamValues[34].asString  + ') AND ');
             end;
             Add('          (L.PLACONTA >= :CONTAINI) AND                           ');
             Add('          (L.PLACONTA <= :CONTAFIM) AND                           ');
             Add('          (P.IDPESSOA =:IDPESSOA) AND                             ');
             Add('          (L.PLNCODIGO = P.PLNCODIGO) AND                                ');
             Add('          (L.CODSUBCONTA = SC.CODSUBCONTA(+)) AND                        ');
             Add('          (L.IDPESSOA = SC.IDPESSOA(+))                                  ');
             Add('    GROUP BY L.PLACONTA, L.PLANO                                         ');

             if CmpRptCM.ParamValues[33].AsBoolean  then begin
               Add('    ,L.IDPATRO, L.IDPLANOPREV');
             end;

             if CmpRptCM.ParamValues[19].AsBoolean then begin
                Add('    ,L.CODSUBCONTA, L.IDPESSOA                                         ');
             end;

             Add('    ) SS                                                                 ');

             if CmpRptCM.ParamValues[19].AsBoolean then begin
                Add('    WHERE                                                           ');
                Add('       CS.CODSUBCONTA = SS.CODSUBCONTA(+) AND                       ');
                Add('       CS.IDPESSOA    = SS.IDPESSOA(+)    AND                       ');
                Add('       CS.PLACONTA    = SS.PLACONTA(+)    AND                       ');
                Add('       CS.PLANO       = SS.PLANO(+)       AND                       ');
                Add('       CS.CODSUBCONTA = SA.CODSUBCONTA(+) AND                       ');
                Add('       CS.IDPESSOA    = SA.IDPESSOA(+)    AND                       ');
                Add('       CS.PLACONTA    = SA.PLACONTA(+)    AND                       ');
                Add('       CS.PLANO       = SA.PLANO(+)                                 ');
                Add('    GROUP BY                                                        ');
                Add('       CS.CODSUBCONTA, CS.IDPESSOA, CS.PLACONTA, CS.PLANO           ');
                Add('    HAVING                                                          ');
                Add('       SUM(NVL(SA.SALDOANT, 0)) <>0 OR SUM(NVL(SS.SALDO,0)) <> 0    ');
                Add('   ) SALDO                                                          ');
             end;

             Add('WHERE                                                     ');

             if (not CmpRptCM.ParamValues[33].AsBoolean)  then
               begin
                 Add('    (C.PLACONTA >= :CONTAINI) AND                  ');
                 Add('    (C.PLACONTA <= :CONTAFIM) AND                  ');
                 Add('    (C.PLATIPO = ''A'') AND                               ');
               end;

             if CmpRptCM.ParamValues[24].AsBoolean  then begin
                Add('    (C.PLAGRUPO <> ''E'') AND                                         ');
             end;
             if CmpRptCM.ParamValues[19].AsBoolean  then begin

                Add('    (SALDO.CODSUBCONTA(+) = CS.CODSUBCONTA) AND       ');
                Add('    (SALDO.IDPESSOA(+)    = CS.IDPESSOA)    AND       ');
                Add('    (SALDO.PLANO(+) = CS.PLANO) AND                   ');
                Add('    (SALDO.PLACONTA(+) = CS.PLACONTA) AND             ');
                Add('    (CS.CODSUBCONTA = SC.CODSUBCONTA) AND             ');
                Add('    (CS.IDPESSOA = SC.IDPESSOA) AND                   ');
                Add('    (CS.PLANO = C.PLANO) AND                          ');
                Add('    (CS.PLACONTA = C.PLACONTA) AND                    ');
                Add('    (SALDO.SALDOANT + SALDO.SALDO <> 0) AND           ');
             end else begin
                Add('    (SA.PLANO(+) = C.PLANO) AND                       ');
                Add('    (SS.PLANO(+) = C.PLANO) AND                       ');
                Add('    (SA.PLACONTA(+) = C.PLACONTA) AND                 ');
                Add('    (SS.PLACONTA(+) = C.PLACONTA) AND                 ');
                Add('    ((NVL(SA.SALDOANT,0) + NVL(SS.SALDO,0)) <> 0) AND ');
             end;

             if CmpRptCM.ParamValues[33].AsBoolean  then begin
                 Add('    (SA.IDPLANOPREV(+) = C.IDPLANOPREV) AND');
                 Add('    (SS.IDPLANOPREV(+) = C.IDPLANOPREV) AND');
                 Add('    (SA.IDPATRO(+) = C.IDPATRO) AND');
                 Add('    (SS.IDPATRO(+) = C.IDPATRO) AND');
               end;

             Add('    (PD.PLANO(+) = C.PLANO) AND                                      ');
             Add('    (PD.PLACONTA(+) = C.PLACONTA) AND                                ');
             Add('    (NOT EXISTS (SELECT X.PLACONTA FROM PLANILHA Y, LANCAMENTO X          ');
             Add('                 WHERE                                                    ');
             Add('                      (Y.PLNDATDIA BETWEEN :DATAINI AND :DATAFIM) AND                     ');
             Add('                      (Y.PEREXERCICIO >= :EXERCICIO) AND                  ');

             if CmpRptCM.ParamValues[14].AsInteger = 1  then begin
                Add('                   (Y.PLNEFETIVADO = ''S'') AND                        ');
             end;

             if CmpRptCM.ParamValues[14].AsInteger = 2  then begin
                Add('                   ((Y.PLNEFETIVADO = ''N'') OR (Y.PLNEFETIVADO IS NULL)) AND  ');
             end;

             if trim(sModulo) <> '' then begin
                Add('                   (Y.IDMODULO =:MODULO) AND                          ');
             end;

             if trim(sTipoOperacao) <> '' then begin
                if CmpRptCM.ParamValues[13].AsBoolean then begin
                   Add('               (X.TIPCODIGO <> :TIPO) AND                 ');
                end else begin
                   Add('               (X.TIPCODIGO = :TIPO) AND                  ');
                end;
             end;

             if trim(sHistorico) <> '' then begin
                Add('                 (X.HITCODHIST = :HIST) AND                            ');
             end;

             Add('                    (Y.IDPESSOA =:IDPESSOA) AND                                         ');
             Add('                    (X.PLACONTA = C.PLACONTA) AND                                       ');
             Add('                    (X.PLANO = C.PLANO) AND                                             ');

             if CmpRptCM.ParamValues[33].AsBoolean  then
               begin
                 Add('                    (X.IDPATRO = C.IDPATRO) AND  ');
                 Add('                    (X.IDPLANOPREV = C.IDPLANOPREV) AND  ');
               end;

             if CmpRptCM.ParamValues[19].AsBoolean  then begin
                Add('                 (X.IDPESSOA = SC.IDPESSOA) AND                                   ');
                Add('                 (X.CODSUBCONTA = SC.CODSUBCONTA) AND                             ');
             end;

             Add('                    (X.PLACONTA >= :CONTAINI) AND                                ');
             Add('                    (X.PLACONTA <= :CONTAFIM) AND                                ');
             Add('                    (X.PLNCODIGO = Y.PLNCODIGO) ) )                                     ');

          end;

          // Alterado por Arnaldo V. Scarin em 09/03/2009 - Sol 110451 Kintana: 505143
          sIndice := '';
          If CmpRptCM.ParamValues[33].AsBoolean Then
            sIndice := 'NOMEPATRO, NOMEPLANOPREV, PLACONTAREF, PLNDATDIA, PLNPLANIL, LACNUMLAN'
          Else
            sIndice := 'PLACONTAREF, PLNDATDIA, PLNPLANIL, LACNUMLAN';
          Add('ORDER BY ' + sIndice);

//          sqlRazaoAnal.SQL.SaveToFile('C:\TEMP\SQL_PROBLEMA.txt');

          cdsRazaoAnal.IndexFieldNames := StringReplace(sIndice,',',';',[rfReplaceAll]);

          // Alterado por Arnaldo V. Scarin em 09/03/2009 - Sol 110451 Kintana: 505143
          While True do
          begin
            If bQuebraSql then
            begin
              // Alterado por FHBS - 04/11/2019 - SIG90532
              if (nPosSql = 1) then
              begin
                sDataSqlIni := CmpRptCM.ParamValues[1].AsDateTime;
                sDataSqlFim := sDataSqlIni + nQteDias;
              end
              else
              begin
                sDataSqlIni := sDataSqlFim + 1;
                sDataSqlFim := sDataSqlIni + nQteDias;

                if sDataSqlFim > CmpRptCM.ParamValues[2].AsDateTime then
                  sDataSqlFim := CmpRptCM.ParamValues[2].AsDateTime;
              end;

              //Ewerton Beltramini - SIG95174 - Inicio...  (A data fim deve respeitar o filtro informado em tela)
              if sDataSqlFim > CmpRptCM.ParamValues[2].AsDateTime then
                 sDataSqlFim := CmpRptCM.ParamValues[2].AsDateTime;
              //Ewerton Beltramini - SIG95174 - Fim.


//              Case nPosSql Of
//                1 : begin
//                      sDataSqlIni := CmpRptCM.ParamValues[1].AsDateTime;
//                      sDataSqlFim := sDataSqlIni + nQteDias;
//                    end;
//                2 : begin
//                      sDataSqlIni := sDataSqlFim + 1;
//                      sDataSqlFim := sDataSqlIni + nQteDias;
//                    end;
//                3 : begin
//                      sDataSqlIni := sDataSqlFim + 1;
//                      sDataSqlFim := CmpRptCM.ParamValues[2].AsDateTime;
//                    end;
//               end;
// Fim - Alterado por FHBS - 04/11/2019 - SIG90532
            end
            else
            begin
              sDataSqlIni := CmpRptCM.ParamValues[1].AsDateTime;
              sDataSqlFim := CmpRptCM.ParamValues[2].AsDateTime;
            end;
            // PARÂMETROS DA QUERY
            sqlRazaoAnal.Prepare;
            sqlRazaoAnal.ParamByName('IDPESSOA').asFloat    := CrmRptCM.IdEmpresa;
            sqlRazaoAnal.ParamByName('DATAINI').asDate      := sDataSqlIni;
            sqlRazaoAnal.ParamByName('DATAINICIAL').AsDate  := CmpRptCM.ParamValues[1].AsDateTime; //Bruno Bastos - Kintana: 516106 - SOL: 111778
            sqlRazaoAnal.ParamByName('DATAFIM').asDate      := sDataSqlFim;
            sqlRazaoAnal.ParamByName('EXERCICIO').asInteger := strToInt(CmpRptCM.ParamValues[0].AsString);
            sqlRazaoAnal.ParamByName('PLANO').asInteger     := CmpRptCM.ParamValues[35].AsInteger;

            if trim(sContaInicial) <> '' then begin
               sqlRazaoAnal.ParamByName('CONTAINI').asString := trim(sContaInicial);
            end else begin
               sqlRazaoAnal.ParamByName('CONTAINI').asString := '0';
            end;

            if Trim(sContaFinal) <> '' then begin
               sqlRazaoAnal.ParamByName('CONTAFIM').asString := trim(sContaFinal);
            end else begin
               sqlRazaoAnal.ParamByName('CONTAFIM').asString := '999999999999999999';
            end;

            if trim(sCCustoInicial) <> '' then begin
               sqlRazaoAnal.ParamByName('CCUSTOINI').asString   := Espaco(CmpRptCM.ParamValues[6].AsString,10);;
               sqlRazaoAnal.ParamByName('EMPRESA').asFloat    := CrmRptCM.IdEmpresa;
            end;

            if trim(sCCustoFinal) <> '' then begin
               sqlRazaoAnal.ParamByName('CCUSTOFIM').asString   := Espaco(CmpRptCM.ParamValues[7].AsString,10);
               sqlRazaoAnal.ParamByName('EMPRESA').asFloat      := CrmRptCM.IdEmpresa;
            end;

            if CmpRptCM.ParamValues[15].AsInteger = 0  then begin
               if trim(sSubContaInicial) <> '' then begin
                  sqlRazaoAnal.ParamByName('SUBCONTAINI').asInteger:= StrToInt(sSubContaInicial);
                  sqlRazaoAnal.ParamByName('PESSOA').asFloat       := CrmRptCM.IdEmpresa;
               end;
               if trim(sSubContaFinal) <> '' then begin
                  sqlRazaoAnal.ParamByName('SUBCONTAFIM').asInteger:= StrToInt(sSubContaFinal);
                  sqlRazaoAnal.ParamByName('PESSOA').asFloat       :=  CrmRptCM.IdEmpresa;
               end;
            end else begin
               if trim(sSubContaInicial) <> '' then begin
                  sqlRazaoAnal.ParamByName('SUBCONTAINI').asString := sSubContaInicial;
                  sqlRazaoAnal.ParamByName('PESSOA').asFloat       := CrmRptCM.IdEmpresa;
               end;
               if trim(sSubContaFinal) <> '' then begin
                  sqlRazaoAnal.ParamByName('SUBCONTAFIM').asString := sSubContaFinal;
                  sqlRazaoAnal.ParamByName('PESSOA').asFloat       := CrmRptCM.IdEmpresa;
               end;
            end;

            if trim(sAtividade) <> '' then begin
               sqlRazaoAnal.ParamByName('UNIDNEGOC').asFloat   := Trunc(CmpRptCM.ParamValues[5].AsFloat);
               sqlRazaoAnal.ParamByName('PESSOA').asFloat      := CrmRptCM.IdEmpresa;
            end;

            if trim(sModulo) <> '' then begin
               sqlRazaoAnal.ParamByName('MODULO').asFloat := Trunc(CmpRptCM.ParamValues[8].AsFloat);
            end;
            if trim(sTipoOperacao) <> '' then begin
               sqlRazaoAnal.ParamByName('TIPO').asString :=  Trim(CmpRptCM.ParamValues[12].AsString);
            end;
            if trim(sHistorico) <> '' then begin
               sqlRazaoAnal.ParamByName('HIST').asString := Trim(CmpRptCM.ParamValues[11].AsString);
            end;

            sqlRazaoAnal.Open;

            // Alterado por Arnaldo V. Scarin em 09/03/2009 - Sol 110451 Kintana: 505143
            // Alterado por FHBS - 04/11/2019 - SIG90532
            //CopiaClientDataSet(); 
            If nPosSql = 1 then
              cdsRazaoAnal.CloneCursor(cdsRazaoAux, true)
            else
              cdsRazaoAnal.AppendData(cdsRazaoAux.Data, true);
            cdsRazaoAux.Close;
            // Fim - Alterado por FHBS - 04/11/2019 - SIG90532

            If (Not bQuebraSql) or (sDataSqlFim = CmpRptCM.ParamValues[2].AsDateTime) then
            begin
              Break;
            end;
            Inc(nPosSql);
          end;
      end;

     //===========================================================================
     //Para Impressão na matricial
     If CmpRptCM.ParamValues[32].AsBoolean then
     Begin
        lstRelatorio := TStringList.Create;
        Try
           iLinha :=0;
           iContador:=0;
           iPag        := CmpRptCM.ParamValues[16].AsInteger;
           sDataAnt    := '@@@@@@@@@@';
           sContaAnt   := '@@@@@@@@@@@@@@@@@@';
           cdsRazaoAnal.First;
           While not cdsRazaoAnal.Eof  do
           Begin
              dCreTotConta := 0;
              dDebTotConta := 0;

              sContaAnt := cdsRazaoAnal.FieldByName('PLACONTAREF').AsString;
              FazCabecalho;
              GuardaReg := cdsRazaoAnal.GetBookmark;

              //=== acumula moviemnto ====
              dMovimento := 0;
              dSaldoConta := 0;
              sDebCreConta := '';
              While (sContaAnt = cdsRazaoAnal.FieldByName('PLACONTAREF').AsString) and (not cdsRazaoAnal.eof)  do
              begin
                 dMovimento := dMovimento +  cdsRazaoAnal.FieldByName('MOVIMENT').asFloat;
                 cdsRazaoAnal.Next;
              end;
              cdsRazaoAnal.GotoBookmark(GuardaReg);
              cdsRazaoAnal.FreeBookmark(GuardaReg);

              dSaldoConta := cdsRazaoAnal.FieldByName('SALDO').asFloat +
                             cdsRazaoAnal.FieldByName('SALDOANT').asFloat;

              dSaldoDetalhe :=  dSaldoConta;

              if dSaldoConta > 0 then
                 sDebCreConta := 'D'
              else
                 sDebCreConta := 'C';

              if not  CmpRptCM.ParamValues[19].AsBoolean then
              begin
                 sLinha := '   Conta: ' + cdsRazaoAnal.FieldByName('PLACONTAREF').AsString + '  ' +
                           AE(cdsRazaoAnal.FieldByName('PLANOMEREF').AsString,60) + '  ' +
                           'Conta Corresp.: ' + AE(cdsRazaoAnal.FieldByName('PLACONCORRESP').AsString,20)+
                           AE(' ',50) +
                           AD(FormatFloat('###,###,###,###,##0.00', ABS(dSaldoConta)),39) + sDebCreConta;
              end else
              begin
                 sLinha := '   Conta: ' + AE(cdsRazaoAnal.FieldByName('PLACONTAREF').AsString,60) + ' '+
                           AE(cdsRazaoAnal.FieldByName('PLANOMEREF').AsString,40) + '  ' +
                           AE('Conta Corresp.: ' + cdsRazaoAnal.FieldByName('PLACONCORRESP').AsString,30)+
                           AD(FormatFloat('###,###,###,###,##0.00', ABS(dSaldoConta)),64) + sDebCreConta;

              end;
              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
              iLinha := lstRelatorio.Add(StrRepeat('-',210));
              inc(iContador);
              FazCabecalho;

              While (sContaAnt = cdsRazaoAnal.FieldByName('PLACONTAREF').AsString) and (not cdsRazaoAnal.eof)  do
              Begin
                    //==== laço do periodo ====
                    dDebTotPeriodo := 0;
                    dCreTotPeriodo := 0;
                    sPeriodoAnt := cdsRazaoAnal.FieldByName('PERIODO').AsString;
                    While (sPeriodoAnt = cdsRazaoAnal.FieldByName('PERIODO').AsString) and (not cdsRazaoAnal.eof) and
                          (sContaAnt = cdsRazaoAnal.FieldByName('PLACONTAREF').AsString) do
                    Begin

                        dDebTotDia := 0;
                        dCreTotDia := 0;
                        sDataAnt := cdsRazaoAnal.FieldByName('PLNDATDIA').AsString;
                        While (sPeriodoAnt = cdsRazaoAnal.FieldByName('PERIODO').AsString) and (not cdsRazaoAnal.eof) and
                              (sContaAnt = cdsRazaoAnal.FieldByName('PLACONTAREF').AsString) and
                              (sDataAnt = cdsRazaoAnal.FieldByName('PLNDATDIA').AsString) do
                        Begin
                          //-----------------------------------------------------
                          dDebTotPeriodo := dDebTotPeriodo + cdsRazaoAnal.FieldByName('DEB').AsFloat;
                          dCreTotPeriodo := dCreTotPeriodo + cdsRazaoAnal.FieldByName('CRED').AsFloat;
                          //-----------------------------------------------------
                          dDebTotDia :=  dDebTotDia + cdsRazaoAnal.FieldByName('DEB').AsFloat;
                          dCreTotDia :=  dCreTotDia + cdsRazaoAnal.FieldByName('CRED').AsFloat;
                          //-----------------------------------------------------
                          dCreTotConta := dCreTotConta + cdsRazaoAnal.FieldByName('CRED').AsFloat;
                          dDebTotConta := dDebTotConta + cdsRazaoAnal.FieldByName('DEB').AsFloat;
                          //-----------------------------------------------------
                          FazCabecalho;

                          dSaldoDetalhe := dSaldoDetalhe + cdsRazaoAnal.FieldByName('DEB').AsFloat -
                                           cdsRazaoAnal.FieldByName('CRED').AsFloat;


                          if dSaldoDetalhe > 0 then
                             sDebCreDet := 'D'
                          else
                             sDebCreDet := 'C';

                          sLinha := ' '+cdsRazaoAnal.FieldByName('PLNDATDIA').AsString+' '+
                                    cdsRazaoAnal.FieldByName('LANCAMENTO').AsString+' '+
                                    cdsRazaoAnal.FieldByName('EFET').AsString+'   '+
                                    AE(cdsRazaoAnal.FieldByName('CONTRAPARTIDA').AsString,18)+' '+
                                    AE(cdsRazaoAnal.FieldByName('CODCENTROCUSTO').AsString,10)+' '+
                                    AE(cdsRazaoAnal.FieldByName('NOMECC').AsString,30)+' '+  //WO11006 - Helen V Bianchi
                                    AE(Copy(cdsRazaoAnal.FieldByName('NOMESUBCONTA').AsString,1,23),23)+' '+
                                    AE(cdsRazaoAnal.FieldByName('UNECODIGO').AsString,10)+' '+
                                    AE(cdsRazaoAnal.FieldByName('IDMODULO').AsString,2)+' '+
                                    cdsRazaoAnal.FieldByName('LACNUMDOC').AsString +
                                    StrRepeat(' ',18 - length(cdsRazaoAnal.FieldByName('LACNUMDOC').AsString)) +
                                    AE(cdsRazaoAnal.FieldByName('LACHIST1').AsString,40)+' '+
                                    AD(FormatFloat('###,###,##0.00',cdsRazaoAnal.FieldByName('DEB').AsFloat),14)+'   '+
                                    AD(FormatFloat('###,###,##0.00',cdsRazaoAnal.FieldByName('CRED').AsFloat),14)+'  '+
                                    AD(FormatFloat('###,###,##0.00',dSaldoDetalhe),17)+sDebCreDet;


                          iLinha := lstRelatorio.Add(sLinha);
                          inc(iContador);
                          If not cdsRazaoAnal.FieldByName('LACHIST2').IsNull then
                          Begin
                             FazCabecalho;
                             sLinha := AE(' ',116)+AE(cdsRazaoAnal.FieldByName('LACHIST2').AsString,40);
                             iLinha := lstRelatorio.Add(sLinha);
                             inc(iContador);
                          End;
                          If not cdsRazaoAnal.FieldByName('LACHIST3').IsNull then
                          Begin
                             FazCabecalho;
                             sLinha := AE(' ',116)+AE(cdsRazaoAnal.FieldByName('LACHIST3').AsString,40);
                             iLinha := lstRelatorio.Add(sLinha);
                             inc(iContador);
                          End;
                          If not cdsRazaoAnal.FieldByName('LACHIST4').IsNull then
                          Begin
                             FazCabecalho;
                             sLinha := AD(' ',116)+AE(cdsRazaoAnal.FieldByName('LACHIST4').AsString,40);
                             iLinha := lstRelatorio.Add(sLinha);
                             inc(iContador);
                          End;
                          If not cdsRazaoAnal.FieldByName('LACHIST5').IsNull Then
                          Begin
                             FazCabecalho;
                             sLinha := AE(' ',116)+AE(cdsRazaoAnal.FieldByName('LACHIST5').AsString,40);
                             iLinha := lstRelatorio.Add(sLinha);
                             inc(iContador);
                          End;
                          cdsRazaoAnal.Next;

                          if not CmpRptCM.ParamValues[23].AsBoolean then
                              sPeriodoAnt := cdsRazaoAnal.FieldByName('PERIODO').AsString;

                          if not CmpRptCM.ParamValues[22].AsBoolean  then
                            sDataAnt := cdsRazaoAnal.FieldByName('PLNDATDIA').AsString;

                       End;

                       if CmpRptCM.ParamValues[22].AsBoolean then
                       begin
                          sLinha := StrRepeat(' ',138) + 'Totais do Dia:   '+
                          AD(FormatFloat('###,###,##0.00', dDebTotDia),16) + ' '+
                          AD(FormatFloat('###,###,##0.00', dCreTotDia),16);

                          iLinha := lstRelatorio.Add(sLinha);
                          inc(iContador);
                          iLinha := lstRelatorio.Add(StrRepeat('-',210));
                          inc(iContador);
                       End;

                    End;

                    if CmpRptCM.ParamValues[23].AsBoolean then
                    begin
                    sLinha := StrRepeat(' ',134) + 'Totais do Período:   '+
                      AD(FormatFloat('###,###,##0.00', dDebTotPeriodo),16) + ' ' +
                      AD(FormatFloat('###,###,##0.00', dCreTotPeriodo),16);

                      iLinha := lstRelatorio.Add(sLinha);
                      inc(iContador);
                      iLinha := lstRelatorio.Add(StrRepeat('-',210));
                      inc(iContador);
                    End;
              End;
              sLinha := StrRepeat(' ',136) + 'Totais da Conta:     '+
              AD(FormatFloat('###,###,##0.00', dDebTotConta),14) + '   ' +
              AD(FormatFloat('###,###,##0.00', dCreTotConta),14);

              iLinha := lstRelatorio.Add(sLinha);
              inc(iContador);
              iLinha := lstRelatorio.Add(StrRepeat('-',210));
              inc(iContador);
              if CmpRptCM.ParamValues[21].AsBoolean then
                 bQuebra := True;
           End;
           sArquivo:= cmGetTempPath+'RAZAO.TMP';
           lstRelatorio.SaveToFile(sArquivo);
           giRazao.Inicializar;
           giRazao.ImprimirArquivo(sArquivo);
           giRazao.Finalizar;
        Finally
           lstRelatorio.Free;
        End;
     End;
    //===========================================================================
    //Exportação para Excel.
    if ( CmpRptCM.ParamValues[36].AsBoolean ) then
        ExportaParaExcel(CmpRptCM.ParamValues[37].AsString);

   Except
     On E:Exception Do
     Begin
        CMDebugToFile('Erro Relatório Razão:' + (#13+#10) + E.Message );
     End;
   End;
end;

procedure TRptRazaoAnalitico.rptRazaoAnalGroupHeaderBand1AfterGenerate(
  Sender: TObject);
var
   rSaldo : Real;
begin
  inherited;
   rSaldo :=0;
   if dbtxtSaldo.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldo.GetText);

   if dbtxtSaldoAnt.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAnt.GetText);

   if dbSumMov.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbSumMov.GetText);

   if (dbtxtMovRazAnal.GetText <> '')  then
      rSaldo := rSaldo - StrToFloat(dbtxtMovRazAnal.GetText);

   if rSaldo > 0 then
      txtDebCreCabRazAnal.caption := 'D'
   else
      txtDebCreCabRazAnal.caption := 'C';

   txtSaldoCabRazAnal.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));
end;

procedure TRptRazaoAnalitico.bndDetRazaoAnalAfterGenerate(Sender: TObject);
var
   rSaldo : Real;
begin
  inherited;
   rSaldo :=0;
   if dbtxtSaldo.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldo.GetText);

   if dbtxtSaldoAnt.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbtxtSaldoAnt.GetText);

   if dbSumMov.GetText <> '' then
      rSaldo := rSaldo + StrToFloat(dbSumMov.GetText);

   if rSaldo > 0 then
      txtDebCreRazAnal.caption := 'D'
   else
      txtDebCreRazAnal.caption := 'C';

   txtSaldoRazAnal.caption  :=  FormatFloat('###,###,###,###,##0.00', ABS(rSaldo));
end;


procedure TRptRazaoAnalitico.ppFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;
   lblContRazAnal.Caption := IntToStr((iPagIni + StrToInt(lblCalcRazAnal.text)) - 1);   
end;

procedure TRptRazaoAnalitico.rptRazaoAnalGroupHeaderBand1BeforeGenerate(Sender: TObject);
var
   sMascara : String;
begin
  inherited;
   //Configura a máscara das contas contábeis
   if (sMascContas <> '') then
    begin
       sMascara :=FuncaoGeral.CalcMascaraPorGrau(sMascContas,cdsRazaoAnal.FieldByName('PLAGRAU').asInteger);
       dbtxtConta.DisplayFormat := sMascara + ';0; ';

       if bContra then
          dbtxtContraPartida.DisplayFormat := sMascara + ';0; ';
    end;

   if (sMascCC <> '') then
    begin
       sMascara :=FuncaoGeral.CalcMascaraPorGrau(sMascCC,FuncaoGeral.CalcGrau(sMascCC,
                                     cdsRazaoAnal.FieldByName('CODCENTROCUSTO').asString));
       dbtxtCCusto.DisplayFormat := sMascara + ';0; ';
    end;

   if (sMascUnidNeg <> '') then
    begin
       sMascara :=FuncaoGeral.CalcMascaraPorGrau(sMascUnidNeg,FuncaoGeral.CalcGrau(sMascUnidNeg,
                                     cdsRazaoAnal.FieldByName('UNECODIGO').asString));
       dbtxtUnidNegoc.DisplayFormat := sMascara + ';0; ';
    end;
end;

procedure TRptRazaoAnalitico.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeral := TCtrlGeral.Create;
  CtrlGeral.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
// if frmprincipal.mnuLancamento.enabled = false then lbbram.Visible:=false;

  //Everson Cunha - SIG102043 - Ini
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);
  //Everson Cunha - SIG102043 - Fim
end;

procedure TRptRazaoAnalitico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlGeral.free;
  CtrlPeriodo.Free;
  CtrlRptBalancete.Free;
  CtrlContab.free; //Everson Cunha - SIG102043
end;

procedure TRptRazaoAnalitico.lbBramDrawCommandClick(Sender,
  aDrawCommand: TObject);
var
  i: integer;
begin

  inherited;
 if cdsRazaoAnal.IsEmpty then Exit;


    AbrirForm(frmLancaContabMT, TfrmLancaContabMT, false);

   // Para essa funcionalidade eu coloquei a fonte branca de um label do tamanho
   // da linha do relatório (lbbram) na linha detalhe do rptrazaoanal para
   // capturar o nro da planilha do registro
   i := StrToInt(TppDrawText(aDrawCommand).Text);


   frmLancaContabMT.FormStyle := FsNormal;
   frmLancaContabMT.Visible   := False;

   frmLancaContabMT.bVeioDaConsultaSaldo := True;

   frmLancaContabMT.dPlnDaConsultaSaldo  := i;

   frmLancaContabMT.Position := poScreenCenter;
   frmLancaContabMT.bbtnConfirmar.ModalResult := mrNone;
   frmLancaContabMT.bbtnSair.ModalResult    := mrCancel;
   frmLancaContabMT.bbtnCancelar.ModalResult := mrNone;

   frmLancaContabMT.ShowModal;
   //-------------------------------------------------------------------------------------
   frmLancaContabMT.Release;
   //-------------------------------------------------------------------------------------

end;

procedure TRptRazaoAnalitico.ExportaParaExcel(strPath: string);
var
  i, icol: integer;
  ExcelApp, Sheet : Variant;
  saldo, saldoDetalhe: extended;
  sdebCre: string;
  dMovimento :Double;
  dSaldoConta:Double;
  GuardaReg :TBookMark;
  sPeriodoAnt :string;
  dDebTotPeriodo:Double;
  dCreTotPeriodo:Double;
  dDebTotDia :Double;
  dCreTotDia :Double;
  dCreTotConta :Double;
  dDebTotConta :Double;
  dSaldoDetalhe :Double;
  sDebCreConta,sDebCreDet :string;
  bQuebra :Boolean;
  sPerIni, sPerFim, sDataAnt,sContaAnt, strMascara : String;

          procedure MontaHeader;
          begin

            iCol := 1;

            //cabeçalhos do filtro
            Sheet.Cells[i, iCol] := trim(rptRazaoAnalLabel20.Caption);
            inc(i);

            Sheet.Cells[i, iCol] := trim(ppLblTitulo2.Caption);
            inc(i);

            //cabeçalhos do detalhe
            Sheet.Cells[i, iCol] := trim('Data');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Lanc.');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Conta');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Contra-Partida');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Centro de Custo');
            inc(iCol);

            //WO11006 - Helen V Bianchi
            Sheet.Cells[i, iCol] := trim('Nome Centro de Custo');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('SubConta');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Patro');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Plano');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Sistema');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Num Doc.');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Historico');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Débito');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Crédito');
            inc(iCol);

            Sheet.Cells[i, iCol] := trim('Saldo');
            inc(iCol);

            Sheet.Cells[i, iCol] := ' ';
            inc(iCol);
          end;

begin
  try
    //Conecta com o Excel
    ExcelApp := IDispatch( ExcelApp );
    ExcelApp := CreateOleObject( 'Excel.Application' );
    ExcelApp.Visible := False;

    //Cria o arquivo
    ExcelApp.Workbooks.Add;

    Application.ProcessMessages;
    try
      Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Planilha1'];   //Rafael SIG 91302
    except
      try
   Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Plan1'];
      except
      Sheet := ExcelApp.ActiveWorkbook.WorkSheets['Sheet1'];
    end;
     end;
    Application.ProcessMessages;


    i := 1; // linha 1 - cabeçalhos
    MontaHeader;
    inc(i); // linha 4 - detalhe

    cdsRazaoAnal.First;

    sDataAnt    := '@@@@@@@@@@';
    sContaAnt   := '@@@@@@@@@@@@@@@@@@';
    cdsRazaoAnal.First;
    while not cdsRazaoAnal.Eof  do
    begin
        dCreTotConta := 0;
        dDebTotConta := 0;

        sContaAnt := cdsRazaoAnal.FieldByName('PLACONTAREF').AsString;
        GuardaReg := cdsRazaoAnal.GetBookmark;

        // acumula movimento
        dMovimento := 0;
        dSaldoConta := 0;
        sDebCreConta := '';
        while (sContaAnt = cdsRazaoAnal.FieldByName('PLACONTAREF').AsString) and (not cdsRazaoAnal.eof) do
        begin
           dMovimento := dMovimento +  cdsRazaoAnal.FieldByName('MOVIMENT').asFloat;
           cdsRazaoAnal.Next;
        end;

        cdsRazaoAnal.GotoBookmark(GuardaReg);
        cdsRazaoAnal.FreeBookmark(GuardaReg);

        dSaldoConta := cdsRazaoAnal.FieldByName('SALDO').asFloat +
                       cdsRazaoAnal.FieldByName('SALDOANT').asFloat;

        dSaldoDetalhe :=  dSaldoConta;

        if dSaldoConta > 0 then
           sDebCreConta := 'D'
        else
           sDebCreConta := 'C';

        while (sContaAnt = cdsRazaoAnal.FieldByName('PLACONTAREF').AsString) and (not cdsRazaoAnal.eof)  do
        begin

           dSaldoDetalhe := dSaldoDetalhe + cdsRazaoAnal.FieldByName('DEB').AsFloat -
                            cdsRazaoAnal.FieldByName('CRED').AsFloat;


           if dSaldoDetalhe > 0 then
              sDebCreDet := 'D'
           else
              sDebCreDet := 'C';

           iCol := 1;
           Sheet.Cells[i,iCol] := '''' + trim(FormatDateTime('dd/mm/yyyy', cdsRazaoAnal.FieldByName('PLNDATDIA').AsDateTime));

           inc(iCol);

           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('LANCAMENTO').AsString );
           inc(iCol);

           Sheet.Cells[i,iCol] := '''' + trim( cdsRazaoAnal.FieldByName('PLACONTA').AsString ); //TAES - SIG113613
           inc(iCol);

           // Ricardo A. SOL: 70148 KTN: 523273
           //Configura a máscara das contaspartidas
           if ( sMascContas <> '' ) and
             ( cdsRazaoAnal.FieldByName('CONTRAPARTIDA_PLAGRAU').asInteger <> 0 ) then
           begin
             strMascara :=
               FuncaoGeral.CalcMascaraPorGrau( sMascContas,
               cdsRazaoAnal.FieldByName('CONTRAPARTIDA_PLAGRAU').asInteger );
             cdsRazaoAnal.FieldByName( 'CONTRAPARTIDA' ).EditMask := strMascara + ';0; ';
           end
           else
             cdsRazaoAnal.FieldByName( 'CONTRAPARTIDA' ).EditMask := '';

           Sheet.Cells[ i, iCol ] := '''' + cdsRazaoAnal.FieldByName( 'CONTRAPARTIDA' ).DisplayText;
           //Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('CONTRAPARTIDA').AsString );
           inc(iCol);


           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('CODCENTROCUSTO').AsString );
           inc(iCol);

           //WO11006 - Helen V Bianchi - Inicio
           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('NOMECC').AsString );
           inc(iCol);
           //WO11006 - Helen V Bianchi - Fim

           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('NOMESUBCONTA').AsString );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('NOMEPATRO').AsString );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('NOMEPLANOPREV').AsString );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('IDMODULO').AsString );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('LACNUMDOC').AsString );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( cdsRazaoAnal.FieldByName('HISTORICO').AsString );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( FormatFloat('#,##0.00', cdsRazaoAnal.FieldByName('DEB').AsFloat) );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( FormatFloat('#,##0.00', cdsRazaoAnal.FieldByName('CRED').AsFloat) );
           inc(iCol);

           //formatei porque no Excel ocorreu problema de formatação.
           Sheet.Cells[i,iCol] := trim(FormatFloat('#,##0.00', Abs(dSaldoDetalhe)) );
           inc(iCol);

           Sheet.Cells[i,iCol] := trim( sDebCreDet );
           inc(iCol);

           inc(i);

           cdsRazaoAnal.Next;

           if not CmpRptCM.ParamValues[23].AsBoolean then
               sPeriodoAnt := cdsRazaoAnal.FieldByName('PERIODO').AsString;

           if not CmpRptCM.ParamValues[22].AsBoolean  then
             sDataAnt := cdsRazaoAnal.FieldByName('PLNDATDIA').AsString;
        end;

    end;
    strPath := StringReplace(strPath, '.xls', '.xlsx', []);
    ExcelApp.ActiveWorkbook.SaveAs(strPath); //TAES - SIG113613
    //Mensagem informando sucesso da operação.
    ShowMessage( 'Planilha Excel gerada com sucesso na pasta: ' + strPath );
  finally
    ExcelApp.ActiveWorkbook.Close( False );
    ExcelApp.Quit;
    Application.ProcessMessages;
  end;
end;

end.
