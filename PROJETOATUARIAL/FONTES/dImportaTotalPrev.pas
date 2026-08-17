// *************************************************************************************************
//                                   REGISTRO DE ALTERAÇÕES
// *************************************************************************************************
// Data        : 11/09/2006
// Responsável : Claudio Faria
// Alteração   : Criado a qryTipoBeneficio
// -------------------------------------------------------------------------------------------------
// Data        : 17.11.2003
// Responsável : Camille
// Alteração   : Alteração da QryUltimoSalario [ AND    SUBSTR(MES,6,2) <> '13' ]
// -------------------------------------------------------------------------------------------------
// Data        : 12.11.2003
// Responsável : Camille
// Alteração   : Alteração da qryDependente [ DECODE(PF.INICIOINVALIDEZ) AS INVALIDO_DEP ]
// -------------------------------------------------------------------------------------------------
// Data        : 10.11.2003
// Responsável : Camille
// Alteração   : Inclusao da qryAux
// -------------------------------------------------------------------------------------------------
// Data        : 07.10.2003
// Responsável : Camille
// Alteração   : qryInsParticipante - Campo TP_PARTICIPANTE não estava como parametro. Faltava o :
unit dImportaTotalPrev;

interface
                                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, URegra, Wwquery;

type
  TDtmImportaTotalPrev = class(TDataModule)
    QrySitParticipante: TQuery;
    QryCancelamento: TQuery;
    QryDemissao: TQuery;
    QryDependente: TQuery;
    QryDevolucaoFuncional: TQuery;
    QryBeneficios: TQuery;
    QryRegional: TQuery;
    QryInsTipoTempo: TQuery;
    QryInsTipoValor: TQuery;
    QryInsEstadoCivil: TQuery;
    QryUpdTipoTempo: TQuery;
    QryUpdTipoValor: TQuery;
    QryUpdEstadoCivil: TQuery;
    QryInsTempoParticipante: TQuery;
    QryInsValorParticipante: TQuery;
    QryUpdTempoParticipante: TQuery;
    QryUpdValorParticipante: TQuery;
    QryInsParticipante: TQuery;
    QryInsPessoa: TQuery;
    QryInsPatroc: TQuery;
    QryPatroc: TQuery;
    QryInsDependencia: TQuery;
    QryInsSitFundacao: TQuery;
    QryInsPlano: TQuery;
    QryInsPlanoBeneficio: TQuery;
    QryInsSitPatroc: TQuery;
    QryInsDuracao: TQuery;
    QryPlano: TQuery;
    QryUpdParticipante: TQuery;
    QryInsTipoBeneficio: TQuery;
    QryInsDependente: TQuery;
    QryUpdDependente: TQuery;
    Regra: TRegra;
    qryRegra: TwwQuery;
    QryVerifTempoRegra: TQuery;
    QryVerifValorRegra: TQuery;
    QryValorBeneficio_Antiga: TQuery;
    QryValorContribuicao: TQuery;
    QryUltimoSalario: TQuery;
    QryVerifTipoTempo: TQuery;
    QryVerifTipoValor: TQuery;
    QryInsTempoRegra: TQuery;
    QryUpdTempoRegra: TQuery;
    QryInsValorRegra: TQuery;
    QryUpdValorRegra: TQuery;
    QryValorSalario: TQuery;
    QryValorSalarioManut: TQuery;
    QryValorSalarioManutParc: TQuery;
    QryValorBeneficio: TQuery;
    QryParticipante: TQuery;
    QryPlanoAnterior: TQuery;
    QryDibINSS: TQuery;
    QryDibMigracao: TQuery;
    QryPercFatorBeneficio1: TQuery;
    QryReservaMigracao: TQuery;
    QryPercFatorBeneficio2: TQuery;
    QryPercFatorBeneficio3: TQuery;
    QryDescrCargo: TQuery;
    QryInsCargo: TQuery;
    QryUpdCargo: TQuery;
    QryExDiretor: TQuery;
    qryAux: TwwQuery;
    QryInsSituacaoPlano: TQuery;
    QryInsVinculoParticipante: TQuery;
    QryInsOutrasFundacoes: TQuery;
    QryPessoaParam: TQuery;
    QryInsGrupoBeneficio: TQuery;
    QryInsBeneficiario: TQuery;
    QryUpdBeneficiario: TQuery;
    QryInsValorBeneficiario: TQuery;
    QryUpdValorBeneficiario: TQuery;
    QryInsGrauInstrucao: TQuery;
    qryTipoBeneficio: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmImportaTotalPrev: TDtmImportaTotalPrev;

implementation

{$R *.DFM}

end.
