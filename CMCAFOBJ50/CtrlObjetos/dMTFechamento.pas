{
Nº SOL......: 270853
Nº PPM......: 1340151
Data........: 23/03/2016
Responsável.: Peterson Victor
Descrição...: Alterações do SOL260961 executar apenas para o modulo InvestImob
--------------------------------------------------------------------------------
Nº SOL......: 260961/18046
Nº PPM......: 1236800
Data........: 04/02/2016
Responsável.: Peterson Victor
Descrição...: Alteração das querys que carrega os dados para realizar a depreciação,
              devera carregar somente os imoveis com taxa de depreciação cadastrada / alteração no .dfm
              sqlFechamentoBem/sqlFechamentoReavaliacao/sqlFechamentoAcrescimoValor
--------------------------------------------------------------------------------------------------
//Higor Nayde SOL 247348/17114*RE01 KTN 809300
Nº SOL......: 247348/17114*RE01
Nº KINTANA..: 809300
Data........: 14/07/2013
Responsável.: Higor Nayde
Descrição...: Desativação da funcionalidade de depreciação/ alteração no .dfm

--------------------------------------------------------------------------------------------------
Nº SOL......: 208674
Nº KINTANA..: 2028170
Data........: 03/07/2013
Responsável.: Fernando Xavier
Descrição...: Varios bens cadastrados no CAF estão com taxa de depreciação negativa.
--------------------------------------------------------------------------------
Rotina......: sqlRemHistPlnCodigo,sqlEstFechamentoAcrescimo,sqlFecRemHistMovBem,sqlFecRemVlrHistMovBem,
              sqlFecRemSaldoContabBem,sqlFecRemSldCtbBemxDep ,sqlMovContabBem,sqlHistFecDEPAcres,
              sqlEstFechamentoBens,sqlRemHistPlnCodigo( Add IDMovimentacao = 97) ,
              sqlHistFecDEP (Alterado para - SUM(VM.VALOR))
Nº SOL......: 150414
Nº KINTANA..: 1092527
Data........: 10/01/2011
Responsável.: Helen V. Bianchi
Descrição...: Adicionado a movimentação 99
--------------------------------------------------------------------------------------------------
Rotina......: sqlFechamentoBem.SQL
Nº SOL......: 136972
Nº KINTANA..: 823252
Data........: 31/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação dos campos "VALORRES" e "VALORCALC" que será o (VALORG - VALORRES)
--------------------------------------------------------------------------------------------------}
unit dMTFechamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DCtrlObject_Padrao, uCmSqlParams;

type
  TdtmMTFechamento = class(TDtmCtrlObject_Padrao)
    sqlFechamentoBem: TCMSqlParams;
    sqlFechamentoReavaliacao: TCMSqlParams;
    sqlFechamentoAcrescimoValor: TCMSqlParams;
    sqlAtuBemxMoeda: TCMSqlParams;
    sqlAtuBemxDep1: TCMSqlParams;
    sqlAtuBemxDep2: TCMSqlParams;
    sqlAtuReavxDep2: TCMSqlParams;
    sqlAtuReavxDep1: TCMSqlParams;
    sqlAtuReavxMoeda: TCMSqlParams;
    sqlAtuAcresxDep2: TCMSqlParams;
    sqlAtuAcresxDep1: TCMSqlParams;
    sqlAtuAcresxMoeda: TCMSqlParams;
    sqlFecRemHistMovBem: TCMSqlParams;
    sqlFecRemVlrHistMovBem: TCMSqlParams;
    sqlFecRemSaldoContabBem: TCMSqlParams;
    sqlFecRemSldCtbBemxDep: TCMSqlParams;
    sqlSaldoContabBem: TCMSqlParams;
    sqlMovContabBem: TCMSqlParams;
    sqlBemxMoedaxDep: TCMSqlParams;
    sqlRemSldCtbBemxDep: TCMSqlParams;
    sqlRemSaldoContabBem: TCMSqlParams;
    sqlInsSldCtbBemxDep: TCMSqlParams;
    sqlInsSaldoContabBem: TCMSqlParams;
    sqlMovTransf: TCMSqlParams;
    sqlHistFecCMBEM: TCMSqlParams;
    sqlEstFechamentoAcrescimo: TCMSqlParams;
    sqlEstFechamentoReavaliacao: TCMSqlParams;
    sqlEstFechamentoBem: TCMSqlParams;
    sqlHistFecCMBEMReav: TCMSqlParams;
    sqlHistFecCMBEMAcres: TCMSqlParams;
    sqlHistFecDEP: TCMSqlParams;
    sqlHistFecDEPReav: TCMSqlParams;
    sqlHistFecDEPAcres: TCMSqlParams;
    sqlEstFechamentoBens: TCMSqlParams;
    sqlRemHistPlnCodigo: TCMSqlParams;
    sqlFechamentoAcrescimoValorSemCM: TCMSqlParams;
    sqlFechamentoReavaliacaoSemCM: TCMSqlParams;
    sqlFechamentoBemSemCM: TCMSqlParams;
    sqlProjSaldoAcresc: TCMSqlParams;
    sqlProjSaldoReaval: TCMSqlParams;
    sqlProjSaldoBem: TCMSqlParams;
    sqlProjSaldo: TCMSqlParams;
	SqlSLDCTBBEM: TCMSqlParams;
    SqlGrupoEstorno: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMTFechamento: TdtmMTFechamento;

implementation

{$R *.DFM}

end.
