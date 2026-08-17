//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_2
// Motivo    :  Implementação do plano/patrocinador
// ******************************************************************************
// Data      : 06/06/2005
// Código    : Al_1
// Motivo    : Implementação da query QryComposcaoPatrimonial
// ******************************************************************************
// Data      : 06/06/2005
// Motivo    : Ajuste na QryTotalPagarReceber, essa a despesas estava trazendo o total de todas as
//             carteiras gerenciais operadas.
// Código    : QryTotalLiquidoRVariavel
// ******************************************************************************
// Data      : 20/05/2005
// Motivo    : Simplificação da busca dos anuncios em aberto
// Código    : QryTotalPagarReceber
// ******************************************************************************
// Data      : 09/05/2005
// Motivo    : Alterado as data tipo datetime por string na QryDeleteHistCota
// Código    : QryTotalLiquidoRVariavel
// ******************************************************************************
// Data      : 28/04/2005
// Motivo    : Ajuste da PARA TOTALIZAR OS ANUNCIOS EM ABERTO
// Código    : QryTotalLiquidoRVariavel
// ******************************************************************************
// Data      : 03/03/2005
// Motivo    : Retirada a proporção da despesas devido a uma boleta operando com duas carteiras gerenciais
// Código    : QryTotalLiquidoRVariavel
// ******************************************************************************
// Data     : 21/02/2005
// Motivo   : Retirada a implementação do tratamento da provisao da subscrição por
//            anuncio de proventos, no momento da baixa de compensação
// Código   : QryTotalPagarReceber
// ******************************************************************************
// Data     : 17/02/2005
// Motivo   : Implementação do tratamento da provisao da subscrição por anuncio de proventos,
//            no momento da baixa de compensação
// Código   : QryTotalPagarReceber
// ******************************************************************************
// Data     : 06/01/2005
// Motivo   : Implementação da busca dos Anúncios vencidos e não recebidos
// Código:  : QryTotalPagarReceber
//******************************************************************************
// Data     : 05/01/2005
// Motivo   : QryDeleteHistProvCPMFDia(exclusão de CPMF no dia)
//******************************************************************************
// Data     : 11/11/2004
// Motivo   : Ajuste nas queries: QryTotalLiquidoRVariavel (Rateio de despesa pelo valor)
//                                QryTotalPagarReceber (Identação e IF de linha)
//******************************************************************************
// Data	   : 05/04/2004
// Função   : QryTotalPagarReceber
// Motivo(S): Erro, antecipação de recebimento de Direitos não era
//            tratado e o mesmo continuava agregando em duplicidade
//            no patrimônio final.
//******************************************************************************
unit DCotaComum;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TDtmCotaComum = class(TDataModule)
    QryBuscaValorCartRenVar: TwwQuery;
    QryTotalLiquidoBMF: TwwQuery;
    QryTotalLiquidoRVariavel: TwwQuery;
    QryAplicacao: TwwQuery;
    QryResgate: TwwQuery;
    QryCarteiraGerenc: TwwQuery;
    QryEventosCalcCota: TwwQuery;
    QryBuscaEventosCotas: TwwQuery;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    QryBuscaCarteiraXevento: TwwQuery;
    QryDeleteHistCota: TwwQuery;
    QryInsereHistCota: TwwQuery;
    QryBuscaEventoPorTpOper: TwwQuery;
    QryTotalPagarReceber: TwwQuery;
    QryCPMFDia: TwwQuery;
    QryCPMFDiaProvisao: TwwQuery;
    QryDeleteHistProvCPMFDia: TwwQuery;
    //Al_1
    QryComposcaoPatrimonial: TwwQuery;
    //AL_2
    QryVerPosRendaVar: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmCotaComum: TDtmCotaComum;

implementation

{$R *.DFM}

end.
