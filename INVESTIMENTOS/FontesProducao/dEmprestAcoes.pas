//******************************************************************************
// Data      : 28/05/2008
// Código    : AL_4
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Alterações na query de saldos para prever operações CCI
//                 e os novos campos de saldo (Principal, Juros e Final)
//******************************************************************************
// Data      : 18/09/2007
// Código    : AL_3
// Pendencia : 26357
// SOL       : 69119
// Desc      : Criado o campo qryExisteOperacaoDESCTIPOOPERACAO
//             Para ajuste na segregação Plano / Patrocinadora:
//             Alteradas: qryMarcaFlgReproc,
//                        qrySumSaldoEmpAcoes,
//                        qrySumSaldoHistEmpAcoes,
//                        qrySaldoCustodia,
//                        qryExisteOperacoes
//             Criada: qryBuscaSaldosAux
//******************************************************************************
// Data      : 20/10/2006
// Código    : AL_2
// Pendencia : 22982
// SOL       :
// Desc      : Implementacao Plano e Patro (QryInsOperEmpAcoes)
//******************************************************************************
// Data     : 27/04/2006
// Código   : AL_1
// Desc     : Implementacao de Rotina de Reprocessamento
//            e melhoria na qryPadrLancEmpAcoes com o TipodeMovimento
//******************************************************************************

unit dEmprestAcoes;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, Wwquery, URegra, Wwdatsrc;

type
  TDMEmprestAcoes = class(TDataModule)
    qryBuscaSaldoHist: TwwQuery;
    qryBuscaSaldoOper: TwwQuery;
    qryInsHistEmpAcoes: TwwQuery;
    qryAux: TwwQuery;
    qryUpdHistEmpAcoes: TwwQuery;
    qryPadrLancEmpAcoes: TwwQuery;
    qrySumSaldoHistEmpAcoes: TwwQuery;
    qryAux1: TwwQuery;
    QryDocumento: TwwQuery;
    QryRecbtoPagto: TwwQuery;
    QryLanctoDocum: TwwQuery;
    QryLotexDocum: TwwQuery;
    QryRateioDocum: TwwQuery;
    QryIrLitigio: TwwQuery;
    QryLancamento: TwwQuery;
    QryPlanilha: TwwQuery;
    qrySaldoCustodia: TwwQuery;
    qrySumSaldoEmpAcoes: TwwQuery;
    qryUpdOperEmpAcoes: TwwQuery;
    qryExisteOperacoes: TwwQuery;
    qrySelOper: TwwQuery;
    qrySelHist: TwwQuery;
    qryExclOper: TwwQuery;
    qryExclHist: TwwQuery;
    qryInsOperEmpAcoes: TwwQuery;
    QryVerExisteOperEmprestimo: TwwQuery;
    qryMarcaFlgReproc: TwwQuery;
    qryDesmarcaFlgReproc: TwwQuery;
    qryBuscaSaldosAux: TwwQuery;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEmprestAcoes: TDMEmprestAcoes;

implementation

{$R *.DFM}

end.

