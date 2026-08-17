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
