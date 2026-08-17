//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_1
// Motivo    :  Implementação do plano/patrocinador
//******************************************************************************
// Data      : 20/06/2005
// Código    : QryBuscaOperDespLiquidar
// Motivo    : Ajuste nos valores com zero, para realizar a operação de divizão.
//******************************************************************************
// Data      : 10/11/2004
// Código    : QryBuscaOperDespLiquidar
// Motivo    : Alteração da query QryBuscaOperDespLiquidar -
//             Acerto no Rateio das Carteiras Gerenciais pelo Valor e não pela Qtde
//******************************************************************************
// Data      : 04/10/2004
// Código    : QryBuscaOperDespLiquidar
// Motivo    : Implementação da busca das despesas pela proprorção ,QryBuscaOperDespLiquidar
//******************************************************************************

unit DCaixaComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc;

type
  TDtmCaixaComum = class(TDataModule)
    UpdValorizacao: TUpdateSQL;
    dsValorizacao: TwwDataSource;
    qryInsereHistCaixa: TwwQuery;
    qrySaldoCaixa: TwwQuery;
    qryAuxiliar: TwwQuery;
    QryBuscaValorCaixa: TwwQuery;
    QryHistOperRendaVar: TwwQuery;
    //AL_1
    QryDeleteSaldoAtu: TwwQuery;
    QryBuscaOperacoes: TwwQuery;
    QryAtualizaSaldoOperacao: TwwQuery;
    QryBuscaEventoCaixaCota: TwwQuery;
    QryVerRegSaldo: TwwQuery;
    QryBuscaOperDespLiquidar: TwwQuery;
    QryDeleteOperDesp: TwwQuery;
    QryValorizacao: TwwQuery;
    QryValorizacaoDATA: TDateTimeField;
    QryValorizacaoQUANTIDADE: TFloatField;
    QryValorizacaoVLRCOTA: TFloatField;
    QryValorizacaoSALDO: TFloatField;
    QryValorizacaoSALDOCOT: TFloatField;
    QryValorizacaoVLRAPLICACAO: TFloatField;
    QryValorizacaoVLRRESGATE: TFloatField;
    QryValorizacaoIDRELATORIO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmCaixaComum: TDtmCaixaComum;

implementation

{$R *.DFM}

end.
