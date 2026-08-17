{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: sqlBensNaLocalizacao
Nº SIG......: 48344
Data........: 13/12/2018
Responsável.: Everson Cunha
Descrição...: Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------
Rotina......: ...
Nº SOL......: 153958
Nº KINTANA..: 1167601
Data........: 21/06/2011
Responsável.: Helen V. Bianchi
sqlMovReavalBem : Inclusão do IdTipoMovimentacao    (101)
sqlMovBaixaAcresc: Inclusão do IdTipoMovimentacao   (101,102,103,104)
sqlRCMovContabBem: Inclusão do IdTipoMovimentacao   (101,102,103,104) - 99 (ABS)
sqlSaldoContabBemA : Inclusão do IdTipoMovimentacao (101,102,103,104)
sqlMovContabBem : Inclusão do IdTipoMovimentacao (95,102,103)
sqlMovContabBem
--------------------------------------------------------------------------------
Rotina......: sqlSaldoContabBemA.SQL
Nº SOL......: 150553 e 150548
Nº KINTANA..: 1094215 e 1094210
Data........: 17/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Inclusão do IdTipoMovimentacao 95 quando negativo para VALACRESACUM e
              96 quando negativo para BXVALACRESACUM
--------------------------------------------------------------------------------
Rotina......: sqlMovContabBem,sqlRCMovContabBem,sqlRCMovAcrescxDep,
sqlSaldoContabilBem,sqlSaldoContabilGrupo,sqlBaixaAtuAcresc,sqlRemHistMovBem,
sqlRemVlrHistMovBem,sqlRCMovAcresxDep2,sqlSaldoContabBemA,sqlRemHistMovBemFec,
sqlRemVlrHistMovBemFec,sqlRetReavalBem,sqlHistMovBem
(+ decode(HM.IDTIPOMOVIMENTACAO, 14, VM.VALOR, abs(VM.VALOR)) as VALOR,)
Nº SOL......: 150414
Nº KINTANA..: 1092527
Data........: 10/01/2011
Responsável.: Helen V. Bianchi
Descrição...: Adicionado a movimentação 99
--------------------------------------------------------------------------------
Rotina...........: sqlListaSelDepreBens
Nº SOL...........: 142551
Nº KINTANA.......: 911676
Data da Alteração: 06/12/2010
Responsável......: Helen V. Bianchi
Descrição........: Add sqlListaSelDepreBens
--------------------------------------------------------------------------------
Rotina......: sqlParamCAFxContab, sqlParamCAFxContab2,sqlHistMovBem,
              sqlRCMovContabBem
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: sqlParamCAFxContab Adicionado o campo IDTIPODESPESA
              e AND TMG.IDTIPODESPESA = CTMG.IDTIPODESPESA
              sqlParamCAFxContab2 Adicionado o campo IDTIPODESPESA
              sqlHistMovBem  Adicionado o campo TD.DESTIPODESPESA
              e AND HM.IDMOVIMENTACAO = AC.IDMOVIMENTACAO (+)
              AND AC.IDTIPODESPESA = TD.IDTIPODESPESA (+)
              sqlRCMovContabBem Add : 95,NVL(VM.VALOR,0) , e 96,NVL(VM.VALOR,0),
--------------------------------------------------------------------------------
Rotina......: sqlSaldoContabilBem.SQL, sqlSaldoContabBem.SQL,
              sqlRCMovContabBem.SQL
Nº SOL......: 136972
Nº KINTANA..: 823252
Data........: 17/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Inclusão do Valor Residual 
--------------------------------------------------------------------------------
Pendência    : 128740
Responsável  : Bruno Bastos
Data         : 22/06/2010
Descrição    : Inclusão de filtro pelo tipo de movimentação 96.
--------------------------------------------------------------------------------
Padrão       : 5.10.18
Pendência    : 28252
Responsável  : Daniel Simões
Data         : 25/06/2008
Descrição    : Acrescentado o parâmetro 'BAIXATOTAL <> 'S'' na query
               'sqlBensEscravos' ...
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Pendência    : 27279
Responsável  : Daniel Simões
Data         : 24/01/2008
Descrição    : Sobreposição do form em função da pendência...
-------------------------------------------------------------------------------}


unit dMTBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DCtrlObject_Padrao, uCmSqlParams;

type
  TdtmMTBem = class(TDtmCtrlObject_Padrao)
    sqlMovContabBem: TCMSqlParams;
    sqlSaldoContabBem: TCMSqlParams;
    sqlSldCtbBemxDep: TCMSqlParams;
    sqlMovTransf: TCMSqlParams;
    sqlRateioPatroxBem: TCMSqlParams;
    sqlBemxDep: TCMSqlParams;
    sqlFechamentoReavalxDep: TCMSqlParams;
    sqlFechamentoReavalxMoeda: TCMSqlParams;
    sqlFechamentoAcrescValorxDep: TCMSqlParams;     
    sqlFechamentoAcrescValorxMoeda: TCMSqlParams;
    sqlRemSaldoContabBem: TCMSqlParams;
    sqlRemSldCtbBemxDep: TCMSqlParams;
    sqlRemSaldoContabGrupo: TCMSqlParams;
    sqlRemSldCtbGrupoxDep: TCMSqlParams;
    sqlRemSaldoContabConj: TCMSqlParams;
    sqlRemSldCtbConjxDep: TCMSqlParams;
    sqlUpdSCBTransf: TCMSqlParams;
    sqlRCMovTransf: TCMSqlParams;
    sqlSCBTransf: TCMSqlParams;
    sqlRCInsSldCtbBemxDep: TCMSqlParams;
    sqlRCInsSaldoContabBem: TCMSqlParams;
    sqlRCMovContabBem: TCMSqlParams;
    sqlRCBemxDep: TCMSqlParams;
    sqlRCBemxMoeda: TCMSqlParams;
    sqlRCBem: TCMSqlParams;
    sqlRCMovAcrescxDep: TCMSqlParams;
    sqlRCMovAcrescimo: TCMSqlParams;
    sqlRCMovReavalxDep: TCMSqlParams;
    sqlRCMovReavaliacao: TCMSqlParams;
    sqlRCMovBemxDep: TCMSqlParams;
    sqlRCMovBem: TCMSqlParams;
    sqlAtuAcrescxDep: TCMSqlParams;
    sqlAtuAcrescimo: TCMSqlParams;
    sqlAtuReavalxDep: TCMSqlParams;
    sqlAtuReavaliacao: TCMSqlParams;
    sqlAtuBemxDep: TCMSqlParams;
    sqlAtuBem: TCMSqlParams;
    sqlSaldoContabilBem: TCMSqlParams;
    sqlAtualizaPlnCodigo: TCMSqlParams;
    sqlHistMovBem: TCMSqlParams;
    sqlBensPendentesxRateio: TCMSqlParams;
    sqlBensPendentesxDep: TCMSqlParams;
    sqlBensPendentes: TCMSqlParams;
    sqlTransfHistMovBem: TCMSqlParams;
    sqlRegDataRetSaidaTemp: TCMSqlParams;
    sqlSetaFlgSaidaTempBem: TCMSqlParams;
    sqlExecutaTermoSaidaTemp: TCMSqlParams;
    sqlRemItensInvBens: TCMSqlParams;
    sqlBensEscravos: TCMSqlParams;
    sqlInvInsPlaca: TCMSqlParams;
    sqlImportacaoResultado: TCMSqlParams;
    sqlBensNaLocalizacao: TCMSqlParams;
    sqlItensInvBens: TCMSqlParams;
    sqlSaldoContabilGrupo: TCMSqlParams;
    sqlCafObraRateio: TCMSqlParams;
    sqlBaixaAtuAcresc: TCMSqlParams;
    sqlBaixaAtuReaval: TCMSqlParams;
    sqlBaixaAtuBem: TCMSqlParams;
    sqlMovBaixaAcresc: TCMSqlParams;
    sqlMovBaixaReaval: TCMSqlParams;
    sqlMovBaixaBem: TCMSqlParams;
    sqlRegistraBemTotal: TCMSqlParams;
    sqlMovReavalBem: TCMSqlParams;
    sqlListaSelBaixaBens: TCMSqlParams;
    sqlProRataReavalxMoeda: TCMSqlParams;
    sqlProRataReavalxDep: TCMSqlParams;
    sqlProRataAcrescValorxMoeda: TCMSqlParams;
    sqlProRataAcrescValorxDep: TCMSqlParams;
    sqlExisteMovimentacao: TCMSqlParams;
    sqlVerificaContaxCC: TCMSqlParams;
    sqlNewDataUltFec: TCMSqlParams;
    sqlIniciaMTDep: TCMSqlParams;
    sqlIniciaMTMoeda: TCMSqlParams;
    sqlHMBReaval: TCMSqlParams;
    sqlRemHistMovBem: TCMSqlParams;
    sqlRemVlrHistMovBem: TCMSqlParams;
    sqlRemSldCtbxDep: TCMSqlParams;
    sqlRemSaldoContab: TCMSqlParams;
    sqlRCMovBemxMoeda2: TCMSqlParams;
    sqlRCMovBemxDep2: TCMSqlParams;
    sqlRCMovReavalxDep2: TCMSqlParams;
    sqlRCMovReavalxMoeda2: TCMSqlParams;
    sqlRCMovAcresxDep2: TCMSqlParams;
    sqlRCMovAcresxMoeda2: TCMSqlParams;
    sqlSaldoContabReavalA: TCMSqlParams;
    sqlSaldoContabBemA: TCMSqlParams;
    sqlRemHistMovBemFec: TCMSqlParams;
    sqlRemVlrHistMovBemFec: TCMSqlParams;
    sqlAux: TCMSqlParams;
    sqlParamCAFxContab: TCMSqlParams;
    sqlParamCAFxContab2: TCMSqlParams;
    sqlMontaContab: TCMSqlParams;
    sqlCorrGrupoBem: TCMSqlParams;
    sqlBensNoConjunto: TCMSqlParams;
    sqlListaSelReavalBens: TCMSqlParams;
    sqlRetReavalBem: TCMSqlParams;
    sqlImportacaoResultado2: TCMSqlParams;
    sqlListaSelDepreBens: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMTBem: TdtmMTBem;

implementation

{$R *.DFM}

end.



