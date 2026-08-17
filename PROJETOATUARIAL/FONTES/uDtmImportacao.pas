{===============================================================================
Unit    :  uDtmImportacao
Form    :  DtmImportacao

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 12/09/2000

Objetivo: Queries referentes à importação das Tabelas Auxiliares -
          "padrão CM" para as tabelas do Projeto Atuarial.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uDtmImportacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Db, DBTables, Wwquery, Dialogs;

type
  TDtmImportacao = class(TDataModule)
    qryInsPessoa: TwwQuery;
    qryInsPatroc: TwwQuery;
    qryInsSitFundacao: TwwQuery;
    qryInsPlano: TwwQuery;
    qryInsSitPatroc: TwwQuery;
    qryInsTipoTempo: TwwQuery;
    qryUpdTipoTempo: TwwQuery;
    qryUpdTipoValor: TwwQuery;
    qryInsTipoValor: TwwQuery;
    qryInsEstadoCivil: TwwQuery;
    qryUpdEstadoCivil: TwwQuery;
    qryInsDependencia: TwwQuery;
    qryInsTipoBeneficio: TwwQuery;
    qryInsPlanoBeneficio: TwwQuery;
    qryParticipante: TwwQuery;
    qryInsDuracao: TwwQuery;
    qryInsParticipante: TwwQuery;
    qryInsBeneficio: TwwQuery;
    qryInsTempo: TwwQuery;
    qryInsDependente: TwwQuery;
    qryInsValor: TwwQuery;
    qryDependente: TwwQuery;
    qryUpdParticipante: TwwQuery;
    qryUpdBeneficio: TwwQuery;
    qryUpdTempo: TwwQuery;
    qryUpdValor: TwwQuery;
    qryUpdDependente: TwwQuery;
    qryPatroc: TwwQuery;
    qryPlano: TwwQuery;
    wwQryRegional: TwwQuery;
    wwQryVerifBenef: TwwQuery;
    qryDependenteAtivo: TwwQuery;
    wwQuery1: TwwQuery;
    wwQuery2: TwwQuery;
    qryTaxaContribPartic: TwwQuery;
    qryCotasBeneficio: TwwQuery;
    QryResgateAposentadoria: TwwQuery;
    QryContribAssistido: TwwQuery;
    QryBeneficiario: TwwQuery;
    QryValorBeneficio: TwwQuery;
    QryUltimoSalario: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmImportacao: TDtmImportacao;

implementation

{$R *.DFM}

end.
