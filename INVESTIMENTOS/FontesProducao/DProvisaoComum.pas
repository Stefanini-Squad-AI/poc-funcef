//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_3
// Pendência :
// Sol       :
// Motivo    :  Implementação do plano/patrocinador s
// *****************************************************************************
// Data      : 22/06/2006
// Código    : AL_2
// Pendencia : 22607
// SOL       :
// Motivo    : Ajuste QryProvisaoNaoVenc para buscar as provisões que vence no dia
//             BUSCANDO A TRANSFERENCIA
//******************************************************************************
// Data      : 21/06/2006
// Código    : AL_1
// Pendencia :
// SOL       :
// Motivo    : Ajuste QryProvisaoNaoVenc para buscar as provisões que vence no dia e
//             quem vem da operacaoinvest
// *****************************************************************************
// Data     : 16/09/2005
// Código   : QryProvisaoNaoVenc
// Motivo   : Ajuste para não lançar anuncios de proventos no caixa do dia.
// *****************************************************************************
// Data     : 09/12/2004
// Código   : QryProvisaoNaoVenc
// Motivo   : Ajuste na query para buscar operações lançadas antes o dia em processo.
// *****************************************************************************

unit DProvisaoComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TDtmProvisaoComum = class(TDataModule)
    qryInsereHistProvisao: TwwQuery;
    QryProvisaoNaoVenc: TwwQuery;
    qryAuxiliar: TwwQuery;
    QryBuscaOperacaoDireito: TwwQuery;
    QryProvisaoCPMFVencSint: TwwQuery;
    QryBuscaOperCPMF: TwwQuery;
    QryDeleteCPMFProv: TwwQuery;
    QryDeleteHistCaixaCPMF: TwwQuery;
    QryBuscaOperacaoInvest: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmProvisaoComum: TDtmProvisaoComum;

implementation


{$R *.DFM}

end.
