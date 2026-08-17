{===============================================================================
Unit    :  uDtmImportacaoBase
Form    :  DtmImportacaoBase

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 11/09/2000

Objetivo: Queries referentes à importação da Base de Trabalho
          para a Base de Histórico e vice-versa.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uDtmImportacaoBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TDtmImportacaoBase = class(TDataModule)
    qryInsHistParticipante: TwwQuery;
    qryInsHistDependente: TwwQuery;
    qryInsHistBeneficio: TwwQuery;
    qryInsHistValor: TwwQuery;
    qryInsHistTempo: TwwQuery;
    qryDelParticipante: TwwQuery;
    qryDelDependente: TwwQuery;
    qryDelBeneficio: TwwQuery;
    qryDelValor: TwwQuery;
    qryDelTempo: TwwQuery;
    qryInsHistOcorCalculo: TwwQuery;
    qryInsHistReferCalculo: TwwQuery;
    qryInsHistOpcaoCalculo: TwwQuery;
    qryDelReferCalculo: TwwQuery;
    qryDelOcorCalculo: TwwQuery;
    qryDelOpcaoCalculo: TwwQuery;
    qryUpdVersaoH: TwwQuery;
    qryInsParticipante: TwwQuery;
    qryInsDependente: TwwQuery;
    qryInsBeneficio: TwwQuery;
    qryInsValor: TwwQuery;
    qryInsTempo: TwwQuery;
    qryHistParticipante: TwwQuery;
    qryHistDependente: TwwQuery;
    qryHistBeneficio: TwwQuery;
    qryHistValor: TwwQuery;
    qryHistTempo: TwwQuery;
    qryInsPlano: TwwQuery;
    qryInsPessoa: TwwQuery;
    qryInsPatroc: TwwQuery;
    qryInsSitFundacao: TwwQuery;
    qryInsSitPatroc: TwwQuery;
    qryDelGrupoExportPartic: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmImportacaoBase: TDtmImportacaoBase;

implementation

{$R *.DFM}

end.
