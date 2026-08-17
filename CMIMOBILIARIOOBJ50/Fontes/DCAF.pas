{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 113136 
Data........: 04/07/2022  
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
Rotina...........: .dfm (qryDelPlanoPatroxVigente)
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
Rotina ......:
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Add qryInsImovelxbemParc Campo IXBRATEIO a +
-------------------------------------------------------------------------------
SOL  : 136732
Kintana: 821049
Responsável : Felipe de Oliveira
Data        : 16/08/2010
Descrição   : Acrescentado todos os campos necessários para o
              desmembramento de imóveis ser feito corretamente
--------------------------------------------------------------------------------              
SOL  : 132206
Kintana: 766651
Responsável : Felipe de Oliveira                            
Data        : 24/05/2010
Descrição   : Retirada a condição B.BAIXATOTAL <> 'S' da query qryImovelXBem,
              para corrigir o processo de desfazer a geração de contrato
--------------------------------------------------------------------------------
SOL..........: 139388
Kintana......: 766651
Responsável..: Cássio Camargo
Data.........: 08/07/2010
Descrição....: Correção dos processos de Encerramento de Obras e Estorno de
               Encerramento de Obras, para utilização da tabela
               PLANOPATROXVIGENCIABEM e PLANOPATROXVIGENCIAIMOB
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit DCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, DBClient;

type
  TdtmCAF = class(TDataModule)
    qryInsImovelxbem: TwwQuery;
    qryPlaca: TwwQuery;
    qryInsConjunto: TwwQuery;
    qryInsRateioDepreciacao: TwwQuery;
    qryInsertLancImovelxbem: TwwQuery;
    qryPlacaCOUNT: TFloatField;
    qryImovelXBem: TwwQuery;
    updImovelxBem: TUpdateSQL;
    qryDelLancImovelxBem: TwwQuery;
    qryDelImovelxBem: TwwQuery;
    qryDelConjunto: TwwQuery;
    qryDelRateioDepreciacao: TwwQuery;
    qryUpdImovel: TwwQuery;
    qryInsDesmembraImovel: TwwQuery;
    qryRateioDepreciacao: TwwQuery;
    qryRateioDepreciacaoIDCONJUNTO: TFloatField;
    qryRateioDepreciacaoCODCENTROCUSTO: TStringField;
    qryRateioDepreciacaoPARTICIPACAO: TFloatField;
    qryRateioDepreciacaoDTAFIM: TDateTimeField;
    qryInsImovel: TwwQuery;
    qryInsInvestimento: TwwQuery;
    qryDelImovel: TwwQuery;
    qryDelInvestimento: TwwQuery;
    qryDelDesmembraImovel: TwwQuery;
    qryLookAcrescimoValor: TwwQuery;
    qryLookAcrescimoValorIDACRESCIMO: TFloatField;
    qryLookAcrescimoValorIDMOVIMENTACAO: TFloatField;
    qryUpdObraLanc: TwwQuery;
    qryUpdStatusImovel: TwwQuery;
    qryInsTransferencia: TwwQuery;
    qryDelTransferencia: TwwQuery;
    qryInsReavalia: TwwQuery;
    qryDelReavalia: TwwQuery;
    qryReavalia: TwwQuery;
    qryReavaliaIDIMOVEL: TFloatField;
    qryReavaliaIDBEM: TFloatField;
    qryReavaliaIDREAVALIACAO: TFloatField;
    qryReavaliaDATAREAVALIACAO: TDateTimeField;
    qryReavaliaIMOVEL_ESTENSO: TStringField;
    qryReavaliaIDAVALIADOR: TFloatField;
    qryTransferencia: TwwQuery;
    qryTransferenciaIDMOVIMENTACAO: TFloatField;
    qryTransferenciaIDIMOVELORIG: TFloatField;
    qryTransferenciaIDIMOVELDEST: TFloatField;
    qryTransferenciaIDBEM: TFloatField;
    qryTransferenciaDATAMOVIMENTACAO: TDateTimeField;
    qryTransferenciaIDGRUPANT: TFloatField;
    qryTransferenciaIDCONJANT: TFloatField;
    qryTransferenciaIDLOCALANT: TFloatField;
    qryTransferenciaCODTIPIMOVELANT: TStringField;
    qryLookDesmembramento: TwwQuery;
    qryLookDesmembramentoDMRDATA: TDateTimeField;
    qryLookDesmembramentoIDIMOVELINI: TFloatField;
    qryLookDesmembramentoIDIMOVELFIM: TFloatField;
    qryLookDesmembramentoDMRPERCENT: TFloatField;
    qryLookDesmembramentoNOME_IMOVEL: TStringField;
    updDesmembramentos: TUpdateSQL;
    qryDesmembramentos: TwwQuery;
    qryDesmembramentosIDIMOVELINI: TFloatField;
    qryDesmembramentosIDIMOVELFIM: TFloatField;
    qryDesmembramentosDMRPERCENT: TFloatField;
    qryDesmembramentosPERC_ACUM: TFloatField;
    qryDesmembramentosDMRDATA: TDateTimeField;
    qryDesmembramentosNOME_IMOVEL: TStringField;
    qryImovelXBemIDIMOVEL: TFloatField;
    qryImovelXBemIDBEM: TFloatField;
    qryImovelXBemIXBPERCENT: TFloatField;
    qryImovelXBemIXBGRUPO: TStringField;
    qryImovelXBemIDGRUPO: TFloatField;
    qryImovelXBemIDCONJUNTO: TFloatField;
    qryImovelXBemDESBEM: TStringField;
    qryImovelXBemVLR_BEM: TFloatField;
    qryImovelXBemIMOVEL_EXTENSO: TStringField;
    qryImovelXBemCODTIPIMOVEL: TStringField;
    qryLookBem: TwwQuery;
    qryLookBemIDBEM: TFloatField;
    qryLookBemIDGRUPO: TFloatField;
    qryLookBemIDCONJUNTO: TFloatField;
    qryLookBemDESBEM: TStringField;
    qryImovelXBemIDLOCALIZACAO: TFloatField;
    qryImovelXBemIDRESPONSAVEL: TFloatField;
    qryLookObra: TwwQuery;
    qryLookObraIDCAFOBRA: TFloatField;
    qryLookObraIDPESSOA: TFloatField;
    qryLookObraIDGRUPO: TFloatField;
    qryLookObraCODSUBCONTA: TFloatField;
    qryLookObraUNIDNEGOC: TFloatField;
    qryLookObraDESCCAFOBRA: TStringField;
    qryLookObraDTAINICIOOBRA: TDateTimeField;
    qryLookObraDTAENCERRAOBRA: TDateTimeField;
    qryLookObraFLGOBRA: TFloatField;
    qryLookObraIDMODULO: TFloatField;
    qryLookObraIDTIPOCUSTORECIMO: TFloatField;
    qryLookObraIDIMOVEL: TFloatField;
    qryImovelXBemIMOCODIGO: TStringField;
    qryReavaliaObra: TwwQuery;
    qryReavaliaObraIDOBRALANC: TFloatField;
    qryReavaliaObraIDCAFOBRA: TFloatField;
    qryLookObraLanc: TwwQuery;
    qryLookObraReav: TwwQuery;
    qryLookObraReavIDIMOVEL: TFloatField;
    qryLookObraReavIDGRUPO: TFloatField;
    qryLookObraReavSALDO: TFloatField;
    qryLookObraReavIMOCODIGO: TStringField;
    qryLookObraReavTIPO: TStringField;
    qryDelAtivoCota: TwwQuery;
    qryImovelXBemNOME_GRUPO: TStringField;
    qryImovelXBemSEL_BEM: TFloatField;
    qryPlacaComPrefixo: TwwQuery;
    qryPlacaComPrefixoPLACA: TStringField;
    qryDelPlanoPatroxVigenciaImob: TwwQuery;
    qryDelPlanoPatroxImovel: TwwQuery;
    qryObraImovelxBem: TwwQuery;
    qryGrupoxImovel: TwwQuery;
    qryObraImovelxBemIMOVEL_EXTENSO: TStringField;
    qryObraImovelxBemIMOCODIGO: TStringField;
    qryObraImovelxBemIDIMOVEL: TFloatField;
    qryObraImovelxBemIDBEM: TFloatField;
    qryObraImovelxBemIXBPERCENT: TFloatField;
    qryObraImovelxBemIXBGRUPO: TStringField;
    qryObraImovelxBemIDGRUPO: TFloatField;
    qryObraImovelxBemCODTIPIMOVEL: TStringField;
    qryObraImovelxBemIDCONJUNTO: TFloatField;
    qryObraImovelxBemIDLOCALIZACAO: TFloatField;
    qryObraImovelxBemIDRESPONSAVEL: TFloatField;
    qryObraImovelxBemDESBEM: TStringField;
    qryObraImovelxBemNOME_GRUPO: TStringField;
    qryObraImovelxBemVLR_BEM: TFloatField;
    qryObraImovelxBemSEL_BEM: TFloatField;
    qryInsImovelxbemParc: TwwQuery;
    qryDelLancImovelxBemParc: TwwQuery;
    qryDelPlanoPatroxVigente: TwwQuery;
    qryDelHistMovProvisao: TwwQuery;
    qryDelSaldoProvisaoImovel: TwwQuery;
    qryDelVlrHistMovProvisao: TwwQuery;
    qryPlnMovProvisao: TwwQuery;
    qryDelProvisaoImovel: TwwQuery;
    qryUpdProvisaoImovel: TwwQuery;
    qryInsProvisaoImovel: TwwQuery;
    qryUpdEstornoProvisaoImovel: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmCAF: TdtmCAF;

implementation

{$R *.DFM}

end.
