{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: dadosAnaliticoSeg
Nº SIG...........: 122680
Data da Alteração: 01/04/2022
Responsável......: Luis Ferrari
Descrição........: Segregação por plano trazer todos imoveis
--------------------------------------------------------------------------------
Rotina...........: dadosAnaliticoSeg
Nº SIG...........: 122680
Data da Alteração: 08/02/2022
Responsável......: Edilaine
Descrição........: Segregação por plano trata apenas um dos imóveis
--------------------------------------------------------------------------------
Rotina...........: dadosAnaliticoSeg
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
N. Sol..........: 153958
N. Kintana......: 1167601
Data............: 20/06/2011
Responsável.....: Helen V. Bianchi
Descrição.......: qrySldCtbImoveis      - Add (99)
--------------------------------------------------------------------------------
N. Sol..........: 131663
N. Kintana......: 753769
Data............: 29/04/2010
Responsável.....: Felipe de Oliveira
Descrição.......: Alteração realizada no Relatório Patrimonial de Imóveis -
                  Analítico, para contemplar os percentuais seguindo a data de
                  vigência
--------------------------------------------------------------------------------
Sol_Kintana  : 134357_790554
Responsável  : Bruno Bastos
Data         : 20/04/2010
Descrição    : Inclusão de uma condição.
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 17/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27213
Responsável  : Daniel Simões
Data         : 28/02/2008
Descrição    : Ajuste na query 'qrySldCtbImoMestre' referente a pendência 27316.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27187
Responsável  : Daniel Simões
Data         : 10/01/2008
Descrição    : Parâmetro ':FLGOPERACAO' na query 'qrySldCtbImoveis' passa a
               chamar "G" e "X" ...
--------------------------------------------------------------------------------
Pendência   : 26711
Responsável : Daniel Simões
Data        : 26/10/2007
Descrição   : Implementação de Opção de Ordenação por Nome do Imóvel ou Código
              do Imóvel para visualização dos dados no relatório...
--------------------------------------------------------------------------------
Pendência   : 21097
Responsável : Daniel Simões
Data        : 13/06/2006
Descrição   : Implementação do filtro por Imóvel além do Imóvel Mestre...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fParamSldCtbImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, fcLabel, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, mImovelouMestre, fcCombo,
  uCtrlPlanPrevContabPatro, dBaseDados,
  fcColorCombo, mImovelMestre, mImovel;

type
  TfrmParamSldCtbImovel = class(TfrmOkCancelar)
    Label1: TLabel;
    eDataFim: TCMDateTimePicker;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molImovelMestre1: TmolImovelMestre;
    Label8: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    chkValorZero: TCheckBox;
    molImovel1: TmolImovel;
    rdgOrdenacao: TRadioGroup;
    Label2: TLabel;
    dbcboPlanoContabil: TwwDBLookupCombo;
    Label3: TLabel;
    dbcboPatro: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure eDataFimExit(Sender: TObject);
    procedure molImovelMestre1btnLimpaImovelClick(Sender: TObject);
    procedure molImovel1btnLimpaImovelClick(Sender: TObject);
    procedure molImovelMestre1btnBuscaImovelClick(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro; //Bruno Bastos - Sol: 126225 - Kintana: 657729
    function VerificaPreenchimento : Boolean;
    procedure dadosAnaliticoSeg;  // Vando - SOL 154328-5901 / KTN 1373449
    function ConvNum(nValor : Extended; trun2cd:boolean = false) : Extended;  // Vando - SOL 154328-5901 / KTN 1373449
  public
    { Public declarations }
    iIdConjunto : Integer;
  end;

var
  frmParamSldCtbImovel: TfrmParamSldCtbImovel;

implementation

uses dRelBalCaf, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento,
     uModuloImobiliario, dLookImobiliario, uFuncoesImob, uCMClientDataSet,
     uCmControlObject, uCMMath;

{$R *.DFM}

procedure TfrmParamSldCtbImovel.FormActivate(Sender: TObject);
begin
   inherited;
   eDataFim.Date := Date;
   molImovelMestre1.btnLimpaImovelClick(self);
   molImovelMestre1.btnBuscaImovel.SetFocus;

   // Daniel Simões - 21097
   molImovel1.btnLimpaImovelClick(self);
   molImovel1.btnBuscaImovel.SetFocus;

   LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
   dtmLookImobiliario.qryLookTipoImovel.Open;

   //Bruno Bastos - Sol: 126225 - Kintana: 657729 - Início
   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   CtrlPlanPrevContabPatro.Initialize(dtmBaseDados.dbBaseDados,True);

   dtmLookImobiliario.qryLookPlanoPrev.Open;
   LimpaParametros(dtmLookImobiliario.qryLookPatrocinadora);
   dtmLookImobiliario.qryLookPatrocinadora.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   dtmLookImobiliario.qryLookPatrocinadora.Open;
   //Bruno Bastos - Sol: 126225 - Kintana: 657729 - Fim
end;

//========================================================================================
procedure TfrmParamSldCtbImovel.bbtnConfirmarClick(Sender: TObject);
var iDia, iMes, iAno : Word;
    sSql : String;
    _cdsTemp, _cdsTemp2 : TCMClientDataSet;
    _Ctrl : TCmControlObject;
    fCustoCorr0, fDepBemAcum0, fDepBemAtu0, fCustoReav0,
    fDepreAvAcum0, fDepreAvAtu0, fValCtb0, fValorLanc, dPercent : Double;
    i, iIdImovelMestre, iIdImovel : integer;
begin
   _cdsTemp := TCMClientDataSet.Create(nil);
   _cdsTemp2 := TCMClientDataSet.Create(nil);
   _Ctrl := TCMControlObject.Create;
   i := 1;
   fValorLanc := 0;
   dPercent := 0;
   try
   _Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   if VerificaPreenchimento then
   begin
      inherited;
      Screen.Cursor := crSQLWait;
      //-------------------------------------------------------------------------------------
      with dtmRelBalCaf do
      begin
         LimpaParametros(dtmRelBalCaf.qrySldCtbImoveis);
         qrySldCtbImoveis.Close;

// Daniel - 26711 - Início -----------------------------------------------------
         { QUERY ESTÁ SENDO REESCRITA EM TEMPO DE EXECUÇÃO!! }
         sSql := '/* Relatório Patrimonial Analítico */ '                                                                               +#13+
                 'SELECT I.IDIMOVELMESTRE, I.IDIMOVEL,'                                                                                            +#13+
                 '       DECODE(UG.IDGRUPANT,NULL,B.IDGRUPO,UG.IDGRUPANT) AS IDGRUPO, '                                                 +#13+
                 '       DECODE(UG.IDGRUPANT,NULL,G.NOME,G2.NOME) AS DESCGRUPO, '                                                       +#13+
                 '       NVL(IMOMESTRE.NOME,''SEM CLASSIFICAÇÃO'') AS NOME, '                                                           +#13+
                 '       NVL(I.IMONOME,''Bem - '' || B.PLACA || '' - '' || B.DESBEM) AS IMONOME, '                                      +#13+
                 '       I.IMOCODIGO, I.IMODATACOMPRA, '                                                                                +#13+
                 '       SUM(SB.VALORG0) AS CUSTOCORR0, '                                                                               +#13+
                 '       SUM(SB.CMBEM0) AS CMBEM0, '                                                                                    +#13+
                 '       SUM(SB.DEPLANC0 + SB.CMDEP0) AS DEPBEMACUM0, '                                                                 +#13+
                 '       SUM(SB.DEPLANCATU0) AS DEPBEMATU0, '                                                                           +#13+
                 '       ((SUM(NVL(SB.DEPLANCATU0,0)) / '                                                                               +
                 '             DECODE(SUM(SB.VALORG0 + SB.CMBEM0), 0, '                                                                 +
                 '                    1, SUM(SB.VALORG0 + SB.CMBEM0))) * 12 * 100) AS TAXADEP, '                                        +
                 '       SUM(SB.REAVVALORG0 + SB.REAVCMBEM0) AS CUSTOREAV0, '                                                           +#13+
                 '       SUM(SB.REAVDEPLANC0 + SB.REAVCMDEP0 )  AS DEPREAVACUM0, '                                                      +#13+
                 '       SUM(SB.REAVDEPLANCATU0) AS DEPREAVATU0, '                                                                      +#13+
                 '       ((SUM(NVL(SB.REAVDEPLANCATU0,0)) / '                                                                           +
                 '         DECODE(SUM(SB.REAVVALORG0 + SB.REAVCMBEM0), 0, '                                                             +
                 '                1, SUM(SB.REAVVALORG0 + SB.REAVCMBEM0))) * 12 * 100) AS TAXADEPREAV, '                                +#13+
                 '       SUM(SB.VALORG0 + SB.CMBEM0 - '                                                                                 +#13+
                 '           SB.DEPLANC0 - SB.CMDEP0 + '                                                                                +#13+
                 '           SB.REAVVALORG0 + SB.REAVCMBEM0 - '                                                                         +#13+
                 '           SB.REAVDEPLANC0 - SB.REAVCMDEP0) AS VALCTB0, '                                                              +#13+
                 '       NVL(UG.CODTIPIMOVELANT,I.CODTIPIMOVEL) AS CODTIPIMOVEL '                                                       +#13+ // xxx   //SIG 122680 Ferrari
                 'FROM '                                                                                                                +#13+
                 '   ( SELECT /*+ RULE */ SB1.IDBEM, SB1.IDPESSOA, COUNT(*) AS QUANT, '                                                 +#13+
                 '            ROUND(SUM(NVL(SB1.VALORG,0)) ,2) AS VALORG0, '                                                            +#13+
                 '            ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) AS CMBEM0, '                                                              +#13+
                 '            ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) AS DEPLANC0, '                                                          +#13+
                 '            ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) AS CMDEP0, '                                                              +#13+
                 '            (0) AS DEPLANCATU0, '                                                                                     +#13+
                 '            ROUND(SUM(NVL(SB1.REAVVALORG,0) + '                                                                       +
                 '                      NVL(SB1.ULTREAVVALORG,0)) ,2) AS REAVVALORG0, '                                                 +#13+
                 '            ROUND(SUM(NVL(SB1.REAVCMBEM,0) + '                                                                        +
                 '                      NVL(SB1.ULTREAVCMBEM,0)) ,2) AS REAVCMBEM0, '                                                   +#13+
                 '            ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + '                                                                      +
                 '            NVL(SD1.ULTREAVDEPLANC,0)) ,2) AS REAVDEPLANC0, '                                                         +#13+
                 '            ROUND(SUM(NVL(SD1.REAVCMDEP,0) + '                                                                        +
                 '            NVL(SD1.ULTREAVCMDEP,0)) ,2) AS REAVCMDEP0, '                                                             +#13+
                 '            (0) AS REAVDEPLANCATU0 '                                                                                  +#13+
                 '     FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1, '                                                                    +#13+
                 '        ( SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA '                                                           +#13+
                 '          FROM SALDOCONTABBEM '                                                                                       +#13+
                 '          WHERE DATASLDBEM <= :DATASLD '                                                                              +#13+
                 '            AND MOECODIGO   = :MOECODIGO '                                                                            +#13+
                 '            AND IDPESSOA    = :IDPESSOA '                                                                             +#13+
                 '          GROUP BY IDBEM, IDPESSOA ) MAX1, '                                                                          +#13+
                 '          BEM B1, GRUPO G1 '                                                                                          +#13+
                 '     WHERE B1.DATAINICIODEP   <= :DATASLD '                                                                           +#13+
                 '       AND G1.FLGIMOVEL        = 1 '                                                                                  +#13+
                 '       AND SB1.MOECODIGO       = :MOECODIGO '                                                                         +#13+
                 '       AND SB1.IDPESSOA        = :IDPESSOA '                                                                          +#13+
                 '       AND SD1.IDSLDCTBBEMXDEP = 1 '                                                                                  +#13+
                 '       AND B1.IDPESSOA         = :IDPESSOA '                                                                          +#13+
                 '       AND SB1.IDBEM           = MAX1.IDBEM '                                                                         +#13+
                 '       AND SB1.IDPESSOA        = MAX1.IDPESSOA '                                                                      +#13+
                 '       AND SB1.DATASLDBEM      = MAX1.DATA '                                                                          +#13+
                 '       AND SB1.IDBEM           = SD1.IDBEM '                                                                          +#13+
                 '       AND SB1.IDPESSOA        = SD1.IDPESSOA '                                                                       +#13+
                 '       AND SB1.DATASLDBEM      = SD1.DATASLDBEM '                                                                     +#13+
                 '       AND SB1.MOECODIGO       = SD1.MOECODIGO '                                                                      +#13+
                 '       AND SB1.IDBEM           = B1.IDBEM '                                                                           +#13+
                 '       AND SB1.IDPESSOA        = B1.IDPESSOA '                                                                        +#13+
                 '       AND SB1.IDGRUPO         = G1.IDGRUPO '                                                                         +#13+
                 '     GROUP BY SB1.IDBEM, SB1.IDPESSOA '                                                                               +#13+
                 '     UNION '                                                                                                          +#13+
                 '     SELECT /*+ RULE */ SB2.IDBEM, SB2.IDPESSOA, (0) AS QUANT, '                                                      +#13+
                 '            (0) AS VALORG0, '                                                                                         +#13+
                 '            (0) AS CMBEM0, '                                                                                          +#13+
                 '            (0) AS DEPLANC0, '                                                                                        +#13+
                 '            (0) AS CMDEP0, '                                                                                          +#13+
                 '            ROUND(SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,14,NVL(VM2.VALOR,0), '                                            +#13+
                 '                                                    17,NVL(VM2.VALOR,0), '                                            +#13+
                 '                                                    43,NVL(VM2.VALOR,0), '                                            +#13+
                 '                                                    35,NVL(VM2.VALOR,0), '                                            +#13+
{Helen - SOL 153958}'                                                 99,NVL(VM2.VALOR,0), '                                            +#13+
                 '                                                    51,NVL(VM2.VALOR,0),0)),2) AS DEPLANCATU0, '                      +#13+
                 '            (0) AS REAVVALORG0, '                                                                                     +#13+
                 '            (0) AS REAVCMBEM0, '                                                                                      +#13+
                 '            (0) AS REAVDEPLANC0, '                                                                                    +#13+
                 '            (0) AS REAVCMDEP0, '                                                                                      +#13+
                 '            ROUND(SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,18,NVL(VM2.VALOR,0), '                                            +#13+
                 '                                                    33,NVL(VM2.VALOR,0), '                                            +#13+
                 '                                                    47,NVL(VM2.VALOR,0),0)),2) AS REAVDEPLANCATU0 '                   +#13+
                 '     FROM HISTORICOMOVIMENTACAO HM2, '                                                                                +#13+
                 '          VLRHISTMOVBEM VM2, '                                                                                        +#13+
                 '          SALDOCONTABBEM SB2, '                                                                                       +#13+
                 '          GRUPO G2, '                                                                                                 +#13+
                 '          BEM B2 '                                                                                                    +#13+
                 '     WHERE B2.DATAINICIODEP     <= :DATASLD '                                                                         +#13+
                 '       AND G2.FLGIMOVEL          = 1 '                                                                                +#13+
                 '       AND HM2.DATAMOVIMENTACAO >= :DATAINI AND HM2.DATAMOVIMENTACAO <= :DATASLD '                                    +#13+
                 '       AND SB2.DATASLDBEM       >= :DATAINI AND SB2.DATASLDBEM       <= :DATASLD '                                    +#13+
                 '       AND SB2.MOECODIGO         = :MOECODIGO '                                                                       +#13+
                 '       AND SB2.IDPESSOA          = :IDPESSOA '                                                                        +#13+
                 '       AND HM2.IDPESSOA          = :IDPESSOA '                                                                        +#13+
                 '       AND B2.IDPESSOA           = :IDPESSOA '                                                                        +#13+
                 '       AND VM2.MOECODIGO         = :MOECODIGO '                                                                       +#13+
                 '       AND VM2.IDTAXADEP         = :IDTAXADEP '                                                                       +#13+
                 '       AND HM2.IDBEM             = SB2.IDBEM '                                                                        +#13+
                 '       AND HM2.IDPESSOA          = SB2.IDPESSOA '                                                                     +#13+
                 '       AND HM2.DATAMOVIMENTACAO  = SB2.DATASLDBEM '                                                                   +#13+
                 '       AND SB2.IDBEM             = B2.IDBEM '                                                                         +#13+
                 '       AND SB2.IDPESSOA          = B2.IDPESSOA '                                                                      +#13+
                 '       AND G2.IDGRUPO            = SB2.IDGRUPO '                                                                      +#13+
                 '       AND HM2.IDPESSOA          = B2.IDPESSOA '                                                                      +#13+
                 '       AND HM2.IDBEM             = B2.IDBEM '                                                                         +#13+
                 '       AND HM2.IDMOVIMENTACAO    = VM2.IDMOVIMENTACAO(+) '                                                            +#13+
                 '     GROUP BY SB2.IDBEM, SB2.IDPESSOA ) SB, '                                                                         +#13+
                 '   ( SELECT IDIMOVEL, IMONOME AS NOME '                                                                               +#13+
                 '     FROM IMOVEL '                                                                                                    +#13+
                 '     WHERE IDIMOVELMESTRE IS NULL ) IMOMESTRE, '                                                                      +#13+

                 '   /* Busca o grupo contábil na data da consulta */ '                                                                 +#13+
                 '   ( SELECT T.IDIMOVELORIG, H.IDBEM, T.CODTIPIMOVELANT, H.DATAMOVIMENTACAO, H.IDGRUPANT '                             +#13+
                 '     FROM TRANSFBEMIMOVEL T, IMOVEL I, HISTORICOMOVIMENTACAO H, '                                                     +#13+
                 '        ( SELECT H1.IDBEM, MIN(H1.DATAMOVIMENTACAO) AS ULTTRANSF '                                                    +#13+
                 '          FROM TRANSFBEMIMOVEL T1, HISTORICOMOVIMENTACAO H1 '                                                         +#13+
                 '          WHERE T1.IDMOVIMENTACAO   = H1.IDMOVIMENTACAO '                                                             +#13+
                 '            AND H1.DATAMOVIMENTACAO > :DATASLD '                                                                      +#13+
                 '          GROUP BY H1.IDBEM ) UT '                                                                                    +#13+
                 '     WHERE T.FLGOPERACAO      IN (''G'',''X'') '                                                                      +#13+ // Daniel - 27187
                 '       AND T.IDIMOVELORIG     = I.IDIMOVEL '                                                                          +#13+
                 '       AND T.IDMOVIMENTACAO   = H.IDMOVIMENTACAO '                                                                    +#13+
                 '       AND H.IDBEM            = UT.IDBEM '                                                                            +#13+
                 '       AND H.DATAMOVIMENTACAO = UT.ULTTRANSF ) UG, '                                                                  +#13+
                 '    IMOVEL I, IMOVELXBEM IXB, BEM B, GRUPO G, GRUPO G2 '                                                              +#13+
                 'WHERE ( B.DATAINICIODEP <= :DATASLD ) '                                                                               +#13+
                 '  AND ( G.FLGIMOVEL      = 1 ) '                                                                                      +#13+
                 '  AND ( ( :PVLRZERO      = 0 ) OR '                                                                                   +#13+
                 '        ( ( :PVLRZERO    = 1 ) '                                                                                      +#13+
                 '  AND   ( ABS( SB.VALORG0      + SB.CMBEM0     - '                                                                    +#13+
                 '               SB.DEPLANC0     - SB.CMDEP0     + '                                                                    +#13+
                 '               SB.REAVVALORG0  + SB.REAVCMBEM0 - '                                                                    +#13+
                 '               SB.REAVDEPLANC0 - SB.REAVCMDEP0 ) >= 0.01 OR '                                                         +#13+
                 '          ABS( SB.DEPLANCATU0  + SB.REAVDEPLANCATU0 ) >= 0.01 ) ) ) '                                                 +#13+
                 '  AND ( ( :IDIMOVELMESTRE IS NULL ) OR ( I.IDIMOVELMESTRE = :IDIMOVELMESTRE ) ) '                                     +#13+
                 '  AND ( ( :PIDIMOVEL IS NULL ) OR (I.IDIMOVEL = :PIDIMOVEL ) ) '                                                      +#13+
                 '  AND ( ( :CODTIPIMOVEL IS NULL) OR ( ( UG.CODTIPIMOVELANT IS NULL AND I.CODTIPIMOVEL = :CODTIPIMOVEL ) OR '          +#13+
                 '                                      ( UG.CODTIPIMOVELANT IS NOT NULL AND UG.CODTIPIMOVELANT = :CODTIPIMOVEL ) ) ) ' +#13+
                 '  AND ( B.IDBEM          = IXB.IDBEM(+) ) '                                                                           +#13+
                 '  AND ( B.IDPESSOA       = IXB.IDPESSOA(+) ) '                                                                        +#13+
                 '  AND ( IXB.IDIMOVEL     = I.IDIMOVEL(+) ) '                                                                          +#13+
                 '  AND ( I.IDIMOVELMESTRE = IMOMESTRE.IDIMOVEL(+) ) '                                                                  +#13+
                 '  AND ( B.IDBEM          = UG.IDBEM(+) ) '                                                                            +#13+
                 '  AND ( UG.IDGRUPANT     = G2.IDGRUPO(+) ) '                                                                          +#13+
                 '  AND ( B.IDGRUPO        = G.IDGRUPO ) '                                                                              +#13+
                 '  AND ( B.IDBEM          = SB.IDBEM ) '                                                                               +#13+
                 'GROUP BY I.IDIMOVELMESTRE, I.IDIMOVEL,'                                                                                          +#13+
                 '         DECODE(UG.IDGRUPANT, NULL, B.IDGRUPO, UG.IDGRUPANT), '                                                       +#13+
                 '         DECODE(UG.IDGRUPANT, NULL, G.NOME, G2.NOME), '                                                               +#13+
                 '         NVL(IMOMESTRE.NOME,''SEM CLASSIFICAÇÃO''), '                                                                 +#13+
                 '         NVL(I.IMONOME,''Bem - '' || B.PLACA || '' - '' || B.DESBEM), '                                               +#13+
                 '         I.IMOCODIGO, I.IMODATACOMPRA, NVL(UG.CODTIPIMOVELANT,I.CODTIPIMOVEL) '                                       +#13+ // xxx  // SIG 122680 Ferrari
                 'UNION '                                                                                                               +#13+
                 'SELECT I.IDIMOVELMESTRE, I.IDIMOVEL, L.IDGRUPO, G.NOME AS DESCGRUPO, IM.IMONOME AS NOME, '                                        +#13+
                 '       I.IMONOME, I.IMOCODIGO, O.DTAINICIOOBRA AS IMODATACOMPRA, '                                                    +#13+
                 '       SUM(L.VALOFI) AS CUSTOCORR0, 0 AS CMBEM0, '                                                                    +#13+
                 '       0 AS DEPBEMACUM0, 0 AS DEPBEMATU0, '                                                                           +#13+
                 '       0 AS TAXADEP,     0 AS CUSTOREAV0,  0 AS DEPREAVACUM0, '                                                       +#13+
                 '       0 AS DEPREAVATU0, 0 AS TAXADEPREAV, SUM(L.VALOFI) AS VALCTB0, I.CODTIPIMOVEL '                                 +#13+ // xxx
                 'FROM CAFOBRALANC L, CAFOBRA O, GRUPO G, IMOVEL I, IMOVEL IM '                                                         +#13+
                 'WHERE L.IDCAFOBRA      = O.IDCAFOBRA '                                                                                +#13+
                 '  AND L.IDGRUPO        = G.IDGRUPO '                                                                                  +#13+
                 '  AND O.IDIMOVEL       = I.IDIMOVEL '                                                                                 +#13+
                 '  AND I.IDIMOVELMESTRE = IM.IDIMOVEL '                                                                                +#13+

                 //Bruno Bastos - Sol: 134357 - Kintana: 790554 - Início
                 '  AND ((:CODTIPIMOVEL IS NULL) OR (I.CODTIPIMOVEL = :CODTIPIMOVEL)) ' +#13+
                 //Bruno Bastos - Sol: 134357 - Kintana: 790554 - Fim

                 '  AND ( ( :IDIMOVELMESTRE IS NULL ) OR ( I.IDIMOVELMESTRE = :IDIMOVELMESTRE ) ) '                                     +#13+
                 '  AND ( ( :PIDIMOVEL IS NULL ) OR ( I.IDIMOVEL = :PIDIMOVEL ) ) '                                                     +#13+
                 '  AND ( O.DTAENCERRAOBRA IS NULL OR O.DTAENCERRAOBRA > :DATASLD ) ' +#13+ // Daniel - 27213
                 '  AND L.DTALANCAMENTO <= :DATASLD '                                                                                   +#13+
                 'GROUP BY I.IDIMOVELMESTRE,  I.IDIMOVEL, L.IDGRUPO, G.NOME, IM.IMONOME, '                                                           +#13+
                 '         I.IMONOME, I.IMOCODIGO, O.DTAINICIOOBRA, I.CODTIPIMOVEL '                                                                    +#13;

         case rdgOrdenacao.ItemIndex of
           0: sSql := sSql+'ORDER BY NOME, IDGRUPO, IMONOME ';
           1: sSql := sSql+'ORDER BY NOME, IDGRUPO, IMOCODIGO ';
         end;

         qrySldCtbImoveis.SQL.Text := sSql;
// Daniel - 26711 - Fim --------------------------------------------------------

         DecodeDate(eDataFim.Date, iAno, iMes, iDia);

         // carrega parâmetros
         qrySldCtbImoveis.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
         qrySldCtbImoveis.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
         qrySldCtbImoveis.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
         qrySldCtbImoveis.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
         qrySldCtbImoveis.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);
         if molImovelMestre1.iMestre > 0 then
            qrySldCtbImoveis.ParamByName('IDIMOVELMESTRE').AsInteger := molImovelMestre1.iMestre;

         // Daniel Simões - 21097
         if molImovel1.iImovel > 0 then
            qrySldCtbImoveis.ParamByName('PIDIMOVEL').AsInteger := molImovel1.iImovel;

         if DBcboTipoImovel.LookupValue <> '' then
            qrySldCtbImoveis.ParamByName('CODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;

         if chkValorZero.Checked then  // imóveis com saldo maior que zero
            qrySldCtbImoveis.ParamByName('PVLRZERO').AsInteger :=1
         else
            qrySldCtbImoveis.ParamByName('PVLRZERO').AsInteger := 0;


         qrySldCtbImoveis.SQL.Savetofile('c:\planus\temp\patrimonio.txt');
         qrySldCtbImoveis.Open;
         rpSldCtbImoveisLabel2.Caption := eDataFim.Text;
         Screen.Cursor := crDefault;
         if qrySldCtbImoveis.IsEmpty then
            MsgDlg('Não existem imóveis com saldo na data informada!','Informação',mtInformation,[mbOk],0)
          else
          begin
//alteração a partir daqui....
            qrySldCtbImoveis.First;
            sSQL := 'SELECT  0 AS IDIMOVELMESTRE, ' +
                    '        0 AS IDIMOVEL, ' +
                    '        ''                                                                                                                                                                 ''  AS NOME,' +
                    '        ''                                                                    '' AS PLANOPREV,' +
                    '        ''                                                           '' AS PATRO, ' +
                    '        0.00 AS PERCENTRATEIO, ' +
                    '        0.00 AS CUSTOCORR0, ' +
                    '        0.00 AS DEPBEMACUM0, ' +
                    '        0.00 AS DEPBEMATU0, ' +
                    '        0.00 AS CUSTOREAV0, ' +
                    '        0.00 AS DEPREAVACUM0, ' +
                    '        0.00 AS DEPREAVATU0, ' +
                    '        0.00 AS VALCTB0 ' +
                    '  FROM DUAL   ' +
                    ' WHERE 1 = 2' +
                    'ORDER BY NOME ';


            {qryImoMestreSegregacao.Close;
            qryImoMestreSegregacao.SQL.Clear;
            qryImoMestreSegregacao.SQL.Add(sSQL);
            qryImoMestreSegregacao.Open;
            qryImoMestreSegregacao.CanModify;}
            cdsImoMestreSegregacao.Data := _Ctrl.GetDataPacket(sSQL);

            // Vando - SOL 154328-5901 / KTN 1373449
            if (eDataFim.Date >= StrToDate('01/01/2014')) then
              dadosAnaliticoSeg
            else   // Vando - SOL 154328-5901 / KTN 1373449 - fim
            while not qrySldCtbImoveis.Eof do
            begin
              fCustoCorr0   := 0;
              fDepBemAcum0  := 0;
              fDepBemAtu0   := 0;
              fCustoReav0   := 0;
              fDepreAvAcum0 := 0;
              fDepreAvAtu0  := 0;
              fValCtb0      := 0;

              _cdsTemp.Data := _Ctrl.GetDataPacket('SELECT IMO.IDIMOVELMESTRE, IMO.IDIMOVEL, PLN.NOME AS PLANOPREV, PPB.IDPLANOPREV, ' +
                                                   '       PES.NOME AS PATRO, PPB.IDPATRO, PPB.PERCENTRATEIO, 0 AS CUSTOCORR0, ' +
                                                   '       0 AS DEPBEMACUM0, 0 AS DEPBEMATU0, 0 AS CUSTOREAV0, 0 AS DEPREAVACUM0, ' +
                                                   '       0 AS DEPREAVATU0, 0 AS VALCTB0 ' +
                                                   '  FROM PLANOPATROXVIGENCIAimob PPB, '+
                                                   '       IMOVEL IMO, PESSOA PES, PLANPREVCONTABIL PLN ' +
                                                   ' WHERE PPB.IDIMOVEL = ' + qrySldCtbImoveis.FieldByName('IDIMOVEL').asString +
                                                   '   AND PPB.DATAVIGENCIA =  (SELECT MAX(DATAVIGENCIA) AS DATAVIGENCIA ' +
                                                   '                              FROM PLANOPATROXVIGENCIAIMOB ' +
                                                   '                             WHERE IDIMOVEL = ' + qrySldCtbImoveis.FieldByName('IDIMOVEL').asString +
                                                   '                               AND DATAVIGENCIA <= '+ QuotedStr(DateTimeToStr(eDataFim.Date)) +')' +
                                                   '   AND PPB.IDIMOVEL = IMO.IDIMOVEL ' +
                                                   '   AND PES.IDPESSOA = PPB.IDPATRO ' +
                                                   '   AND PLN.IDPLANOPREV = PPB.IDPLANOPREV ' +
                                                   ' ORDER BY PPB.IDPLANOPREV' );

             while not _cdsTemp.Eof do
             begin
              if not cdsImoMestreSegregacao.Locate('IDIMOVELMESTRE;PATRO;PLANOPREV', VarArrayOf([
                  _cdsTemp.FieldByName('IDIMOVELMESTRE').Value,
                  _cdsTemp.FieldByName('PATRO').Value,
                  _cdsTemp.FieldByName('PLANOPREV').Value]), []) then
              begin
                cdsImoMestreSegregacao.Append;
                cdsImoMestreSegregacao.FieldByName('IDIMOVELMESTRE').Value := _cdsTemp.FieldByName('IDIMOVELMESTRE').Value;
                cdsImoMestreSegregacao.FieldByName('IDIMOVEL').Value := _cdsTemp.FieldByName('IDIMOVEL').Value;
                cdsImoMestreSegregacao.FieldByName('NOME').Value := qrySldCtbImoveis.FieldByName('NOME').Value;
                cdsImoMestreSegregacao.FieldByName('PLANOPREV').Value := _cdsTemp.FieldByName('PLANOPREV').Value;
                cdsImoMestreSegregacao.FieldByName('PATRO').Value := _cdsTemp.FieldByName('PATRO').Value;
                cdsImoMestreSegregacao.FieldByName('PERCENTRATEIO').Value := 0;

                if _cdsTemp.RecNo = _cdsTemp.RecordCount then
                begin
                  cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat := qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0;
                  cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat := qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0;
                  cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat :=  qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0;
                  cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat :=  qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat - fCustoReav0;
                  cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0;
                  cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat := qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0;
                  cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat := qrySldCtbImoveis.FieldByName('VALCTB0').asFloat - fValCtb0;
                end
                else
                begin
                  cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat := RoundCM((qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fCustoCorr0 := fCustoCorr0 + cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat;

                  cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat := RoundCM((qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepBemAcum0 := fDepBemAcum0 + cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat;

                  cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat := RoundCM((qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepBemAtu0 := fDepBemAtu0 + cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat;

                  cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat := RoundCM((qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fCustoReav0 := fCustoReav0 + cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat;

                  cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := RoundCM((qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepreAvAcum0 := fDepreAvAcum0 + cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat;

                  cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat := RoundCM((qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fDepreAvAtu0 := fDepreAvAtu0 + cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat;

                  cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat := RoundCM((qrySldCtbImoveis.FieldByName('VALCTB0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                  fValCtb0 := fValCtb0 + cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat;
                end;
              end
              else
              begin
                cdsImoMestreSegregacao.Edit;
                if _cdsTemp.RecNo = _cdsTemp.RecordCount then
                begin
                  cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat + (qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat -  fCustoCorr0);
                  cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat + (qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat -  fDepBemAcum0);
                  cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat :=  cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat + (qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat - fDepBemAtu0);
                  cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat :=  cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat  + (qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat - fCustoReav0);
                  cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat + (qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat - fDepreAvAcum0);
                  cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat + (qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat - fDepreAvAtu0);
                  cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat :=  cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat + (qrySldCtbImoveis.FieldByName('VALCTB0').asFloat - fValCtb0);
                end
                else
                begin
                  cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat + (RoundCM((qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fCustoCorr0 := fCustoCorr0 +  RoundCM((qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat + (RoundCM((qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepBemAcum0 := fDepBemAcum0 + RoundCM((qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat + (RoundCM((qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2));
                  fDepBemAtu0 := fDepBemAtu0 + RoundCM((qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, 2);

                  cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat := cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat + (RoundCM((qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fCustoReav0 := fCustoReav0 + RoundCM((qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat + (RoundCM((qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepreAvAcum0 := fDepreAvAcum0 + RoundCM((qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat + (RoundCM((qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fDepreAvAtu0 := fDepreAvAtu0 + RoundCM((qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);

                  cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat := cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat + (RoundCM((qrySldCtbImoveis.FieldByName('VALCTB0').asFloat *
                                                                                      _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2));
                  fValCtb0 := fValCtb0 + RoundCM((qrySldCtbImoveis.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, 2);
                end;
              end;
              cdsImoMestreSegregacao.Post;
              _cdsTemp.Next;
             end;
             _cdsTemp.EmptyDataSet;
             qrySldCtbImoveis.Next;
            end;

            _cdsTemp2.Data := cdsImoMestreSegregacao.Data;
            cdsImoMestreSegregacao.First;

            while not cdsImoMestreSegregacao.Eof do
            begin
              iIdImovelMestre := _cdsTemp2.FieldByName('IDIMOVELMESTRE').asInteger;
              iIdImovel := _cdsTemp2.FieldByName('IDIMOVEL').asInteger;
              while (iIdImovelMestre = _cdsTemp2.FieldByName('IDIMOVELMESTRE').asInteger) and
                    (iIdImovel = _cdsTemp2.FieldByName('IDIMOVEL').asInteger) and (not _cdsTemp2.Eof) do
              begin
                fValorLanc := fValorLanc + _cdsTemp2.FieldByName('VALCTB0').asFloat;
                _cdsTemp2.Next;
              end;

              while (iIdImovelMestre = cdsImoMestreSegregacao.FieldByName('IDIMOVELMESTRE').asInteger) and
                    (iIdImovel = cdsImoMestreSegregacao.FieldByName('IDIMOVEL').asInteger) and (not cdsImoMestreSegregacao.Eof) do
              begin
                cdsImoMestreSegregacao.Edit;
                cdsImoMestreSegregacao.FieldByName('PERCENTRATEIO').asFloat := RoundCM((cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat * 100) /
                                                                                        fValorLanc,2);
                cdsImoMestreSegregacao.Post;
                cdsImoMestreSegregacao.Next;
              end;
              fValorLanc := 0;
            end;


            //end;

            sSQL := 'SELECT  ''                                                                    '' AS PLANOPREV,' +
                    '        ''                                                           '' AS PATRO, ' +
                    '        0.00 AS PERCENTRATEIO, ' +
                    '        0.00 AS CUSTOCORR0, ' +
                    '        0.00 AS DEPBEMACUM0, ' +
                    '        0.00 AS DEPBEMATU0, ' +
                    '        0.00 AS CUSTOREAV0, ' +
                    '        0.00 AS DEPREAVACUM0, ' +
                    '        0.00 AS DEPREAVATU0, ' +
                    '        0.00 AS VALCTB0 ' +
                    '  FROM DUAL   ' +
                    ' WHERE 1 = 2' ;

            {qryTotGeral.Close;
            qryTotGeral.SQL.Clear;
            qryTotGeral.SQL.Add(sSQL);
            qryTotGeral.Open;
            qryTotGeral.CanModify;}
            cdsTotGeral.Data := _Ctrl.GetDataPacket(sSQL);

            cdsImoMestreSegregacao.First;
            while not cdsImoMestreSegregacao.Eof do
            begin
              if not cdsTotGeral.Locate('PATRO;PLANOPREV', VarArrayOf([
                                        cdsImoMestreSegregacao.FieldByName('PATRO').Value,
                                        cdsImoMestreSegregacao.FieldByName('PLANOPREV').Value]), []) then
              begin
                cdsTotGeral.Append;
                cdsTotGeral.FieldByName('PLANOPREV').Value := cdsImoMestreSegregacao.FieldByName('PLANOPREV').Value;
                cdsTotGeral.FieldByName('PATRO').Value := cdsImoMestreSegregacao.FieldByName('PATRO').Value;
                cdsTotGeral.FieldByName('PERCENTRATEIO').Value := 0;
                cdsTotGeral.FieldByName('CUSTOCORR0').Value := cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').Value;
                cdsTotGeral.FieldByName('DEPBEMACUM0').Value := cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').Value;
                cdsTotGeral.FieldByName('DEPBEMATU0').Value := cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').Value;
                cdsTotGeral.FieldByName('CUSTOREAV0').Value := cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').Value;
                cdsTotGeral.FieldByName('DEPREAVACUM0').Value := cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').Value;
                cdsTotGeral.FieldByName('DEPREAVATU0').Value := cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').Value;
                cdsTotGeral.FieldByName('VALCTB0').Value := cdsImoMestreSegregacao.FieldByName('VALCTB0').Value;
              end
              else
              begin
                cdsTotGeral.Edit;
                cdsTotGeral.FieldByName('CUSTOCORR0').Value := cdsTotGeral.FieldByName('CUSTOCORR0').Value +
                                                               cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').Value;
                cdsTotGeral.FieldByName('DEPBEMACUM0').Value := cdsTotGeral.FieldByName('DEPBEMACUM0').Value +
                                                                cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').Value;
                cdsTotGeral.FieldByName('DEPBEMATU0').Value := cdsTotGeral.FieldByName('DEPBEMATU0').Value +
                                                               cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').Value;
                cdsTotGeral.FieldByName('CUSTOREAV0').Value := cdsTotGeral.FieldByName('CUSTOREAV0').Value  +
                                                               cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').Value;
                cdsTotGeral.FieldByName('DEPREAVACUM0').Value := cdsTotGeral.FieldByName('DEPREAVACUM0').Value +
                                                                 cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').Value;
                cdsTotGeral.FieldByName('DEPREAVATU0').Value := cdsTotGeral.FieldByName('DEPREAVATU0').Value +
                                                                cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').Value;
                cdsTotGeral.FieldByName('VALCTB0').Value := cdsTotGeral.FieldByName('VALCTB0').Value +
                                                            cdsImoMestreSegregacao.FieldByName('VALCTB0').Value;
              end;
              cdsTotGeral.Post;
              cdsImoMestreSegregacao.Next;
            end;

            i := 1;
            fValorLanc := 0;
            cdsTotGeral.First;

            while not cdsTotGeral.Eof do
            begin
              fValorLanc := fValorLanc + cdsTotGeral.FieldByName('VALCTB0').AsFloat;
              cdsTotGeral.Next;
            end;

            cdsTotGeral.First;
            while not cdsTotGeral.Eof do
            begin
              cdsTotGeral.Edit;
              if cdsTotGeral.RecNo = cdsTotGeral.RecordCount then
                cdsTotGeral.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent
              else
              begin
                if fValorLanc > 0 then
                  cdsTotGeral.FieldByName('PERCENTRATEIO').AsFloat := RoundCM((cdsTotGeral.FieldByName('VALCTB0').asFloat * 100) /
                                                                              fValorLanc ,2)
                else
                  cdsTotGeral.FieldByName('PERCENTRATEIO').AsFloat := 0;

                dPercent := dPercent + cdsTotGeral.FieldByName('PERCENTRATEIO').AsFloat;
              end;
              cdsTotGeral.Post;
              cdsTotGeral.Next;
            end;
         end;

//Alteração até aqui...
         //Bruno Bastos - Sol: 126225 - Kintana: 657729 - Início
         if dbcboPlanoContabil.LookupValue = '' then
           lblPlanoContabil.Caption := 'Plano: < Todos >'
         else
           lblPlanoContabil.Caption := 'Plano: < ' + dbcboPlanoContabil.Text +' >';

         if dbcboPatro.LookupValue = '' then
           lblPatro.Caption := 'Patrocinadora: < Todos >'
         else
           lblPatro.Caption := 'Patrocinadora: < ' + dbcboPatro.Text +' >';
         //Bruno Bastos - Sol: 126225 - Kintana: 657729 - Fim
      end;

      if DBcboTipoImovel.LookupValue = '' then
           dtmRelBalCaf.rpSldCtbImoveisLblSegmento.Caption := 'Segmento: < Todos >'
      else dtmRelBalCaf.rpSldCtbImoveisLblSegmento.Caption := 'Segmento: < ' + DBcboTipoImovel.Text + ' >';

      dtmRelBalCaf.bSeparador := chkLinhas.Checked;
      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      dtmRelBalCaf.bCorlinha  := chkCorLinha.Checked;
      dtmRelBalCaf.CorLinha   := cboCorLinha.SelectedColor;

      // Carrega o Logotipo
      if ModuloImobiliario.Investimob.bFlgLogoRelat then
           dtmRelBalCaf.ppLogoBalAnalitico.Picture := ModuloImobiliario.Investimob.LogoTipo.Picture
      else dtmRelBalCaf.ppLogoBalAnalitico.Picture := nil;

      if bbtnConfirmar.ModalResult <> mrOk then begin
         bbtnConfirmar.ModalResult := mrOk;
         bbtnConfirmar.Click;
      end;
   end;
   finally
    FreeAndNil(_cdsTemp);
    FreeAndNil(_cdsTemp2);
    FreeAndNil(_Ctrl);
   end;
end;
//========================================================================================
procedure TfrmParamSldCtbImovel.eDataFimExit(Sender: TObject);
begin
   inherited;
   if bbtnSair.Focused then exit;
   if eDataFim.Text = '' then
   begin
      MsgDlg('Selecione uma Data!','Erro',mtError,[mbOk],0);
      eDataFim.SetFocus;
   end;
end;


function TfrmParamSldCtbImovel.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Início
     if (trim(dbcboPlanoContabil.Text) <> '') and (trim(dbcboPatro.Text) = '') then
     begin
       MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
              'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
              'Informação', mtInformation, [mbOK], 0);
       ModalResult := mrNone;
       dbcboPatro.SetFocus;
       Exit;
     end;

     if (dbcboPatro.Text <> '') and (dbcboPlanoContabil.Text <> '') then
     begin
       if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                       StrToInt(dbcboPlanoContabil.LookupValue)) then
       begin
         MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
         ModalResult := mrNone;
         dbcboPlanoContabil.SetFocus;
         Exit;
       end;
     end;
     //Bruno Bastos - Sol: 126224 - Kintana: 657726 - Fim

     if eDataFim.Text = '' then
        raise EValidacao.CreateVal('Selecione uma Data',eDataFim);
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;
  Result := True;
end;


procedure TfrmParamSldCtbImovel.molImovelMestre1btnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelMestre1.btnLimpaImovelClick(Sender);

end;

procedure TfrmParamSldCtbImovel.molImovel1btnLimpaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovel1.btnLimpaImovelClick(Sender);

end;

procedure TfrmParamSldCtbImovel.molImovelMestre1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovelMestre1.btnBuscaImovelClick(Sender);

  molImovel1btnLimpaImovelClick(Sender);
end;

procedure TfrmParamSldCtbImovel.molImovel1btnBuscaImovelClick(
  Sender: TObject);
begin
  inherited;
  molImovel1.btnBuscaImovelClick(Sender);

  molImovelMestre1btnLimpaImovelClick(Sender);
end;

procedure TfrmParamSldCtbImovel.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlPlanPrevContabPatro.Free;
end;

procedure TfrmParamSldCtbImovel.dadosAnaliticoSeg;
var
 fCustoCorr0, fDepBemAcum0, fDepBemAtu0, fCustoReav0,
 fDepreAvAcum0, fDepreAvAtu0, fValCtb0, fValorLanc, dPercent : Double;
 _cdsTemp, _cdsTemp2 : TCMClientDataSet;
 _Ctrl : TCmControlObject;
  iDia, iMes, iAno : Word;
  sSql : string;
begin
  try
    DecodeDate(eDataFim.Date, iAno, iMes, iDia);

    _cdsTemp := TCMClientDataSet.Create(nil);
    _cdsTemp2 := TCMClientDataSet.Create(nil);
    _Ctrl := TCMControlObject.Create;

    _Ctrl.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True);


    with dtmRelBalCaf do
    begin
      while not qrySldCtbImoveis.Eof do
      begin
        fCustoCorr0   := 0;
        fDepBemAcum0  := 0;
        fDepBemAtu0   := 0;
        fCustoReav0   := 0;
        fDepreAvAcum0 := 0;
        fDepreAvAtu0  := 0;
        fValCtb0      := 0;

        if cdsImoMestreSegregacao.Locate('IDIMOVELMESTRE', qrySldCtbImoveis.FieldByName('IDIMOVELMESTRE').asString, []) then
        begin
          qrySldCtbImoveis.next;
          continue;
        end;

        sSQL := qryPatrimonioSeg.sql.text;
        sSql := StringReplace(sSQL, '&DATASLD', Quotedstr(DateToStr(eDataFim.Date)), [rfReplaceAll]);
        sSql := StringReplace(sSQL, '&MOECODIGO', IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF), [rfReplaceAll]);
        sSql := StringReplace(sSQL, '&IDPESSOA', IntToStr(Sistema.IdEmpresa), [rfReplaceAll]);
        //edilaine SIG122680 : inicio
        if molImovel1.iImovel > 0 then
           sSql := StringReplace(sSQL, '&PIDIMOVEL', qrySldCtbImoveis.FieldByName('IDIMOVEL').asString, [rfReplaceAll])
        else
           sSql := StringReplace(sSQL, '&PIDIMOVEL', 'null', [rfReplaceAll]);
        //edilaine SIG122680 :  fim
        sSql := StringReplace(sSQL, '&DATAINI', Quotedstr(DateToStr(EncodeDate(iAno, iMes, 1))), [rfReplaceAll]);
        sSql := StringReplace(sSQL, '&IDTAXADEP', IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF), [rfReplaceAll]);
        sSql := StringReplace(sSQL, '&IDIMOVELMESTRE', qrySldCtbImoveis.FieldByName('IDIMOVELMESTRE').asString, [rfReplaceAll]);
        sSql := StringReplace(sSQL, '&CODTIPIMOVEL', Quotedstr(qrySldCtbImoveis.FieldByName('CODTIPIMOVEL').asString), [rfReplaceAll]);
        if chkValorZero.Checked then  // imóveis com saldo maior que zero
           sSql := StringReplace(sSQL, '&PVLRZERO', '1', [rfReplaceAll])
        else
           sSql := StringReplace(sSQL, '&PVLRZERO', '0', [rfReplaceAll]);
        sqlPatrimonioSeg.SQL.text := sSQl;
        qryPatrimonioSeg.SQL.Savetofile('c:\planus\temp\qryPatrimonioSeg.txt');      // sig 122680
        qrySldCtbImoveis.SQL.Savetofile('c:\planus\temp\qrySldCtbImoveis.txt');      // sig 122680
        sqlPatrimonioSeg.Open;

{
        LimpaParametros(dtmRelBalCaf.qryPatrimonioSeg);
        qryPatrimonioSeg.Close;
        qryPatrimonioSeg.ParamByName('DATASLD').AsDateTime  := eDataFim.Date;
        qryPatrimonioSeg.ParamByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
        qryPatrimonioSeg.ParamByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
        qryPatrimonioSeg.ParamByName('PIDIMOVEL').AsInteger := qrySldCtbImoveis.FieldByName('IDIMOVEL').asInteger;
        qryPatrimonioSeg.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes, 1);
        qryPatrimonioSeg.ParamByName('IDTAXADEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
        qryPatrimonioSeg.ParamByName('CODTIPIMOVEL').AsString := qrySldCtbImoveis.FieldByName('CODTIPIMOVEL').asString;
        qryPatrimonioSeg.ParamByName('IDIMOVELMESTRE').AsInteger := qrySldCtbImoveis.FieldByName('IDIMOVELMESTRE').asInteger;
        if chkValorZero.Checked then  // imóveis com saldo maior que zero
           qryPatrimonioSeg.ParamByName('PVLRZERO').AsInteger :=1
        else
           qryPatrimonioSeg.ParamByName('PVLRZERO').AsInteger := 0;
        qryPatrimonioSeg.open;
        }

       while not cdsPatrimonioSeg.Eof do
       begin
         if not cdsImoMestreSegregacao.Locate('IDIMOVELMESTRE;PATRO;PLANOPREV', VarArrayOf([
             cdsPatrimonioSeg.FieldByName('IDIMOVELMESTRE').Value,
             cdsPatrimonioSeg.FieldByName('PATRO').Value,
             cdsPatrimonioSeg.FieldByName('PLANOPREV').Value]), []) then       
         begin
           cdsImoMestreSegregacao.Append;
           cdsImoMestreSegregacao.FieldByName('IDIMOVELMESTRE').Value := cdsPatrimonioSeg.FieldByName('IDIMOVELMESTRE').Value;
           cdsImoMestreSegregacao.FieldByName('IDIMOVEL').Value := -1; // cdsPatrimonioSeg.FieldByName('IDIMOVEL').Value;  SIG 122680
           cdsImoMestreSegregacao.FieldByName('NOME').Value := qrySldCtbImoveis.FieldByName('NOME').Value;
           cdsImoMestreSegregacao.FieldByName('PLANOPREV').Value := cdsPatrimonioSeg.FieldByName('PLANOPREV').Value;
           cdsImoMestreSegregacao.FieldByName('PATRO').Value := cdsPatrimonioSeg.FieldByName('PATRO').Value;
           cdsImoMestreSegregacao.FieldByName('PERCENTRATEIO').Value := 0;

           cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat   := ConvNum(cdsPatrimonioSeg.FieldByName('CUSTOCORR0').asFloat, true) -  fCustoCorr0;
           cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat  := ConvNum(cdsPatrimonioSeg.FieldByName('DEPBEMACUM0').asFloat, true) -  fDepBemAcum0;
           cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat   := ConvNum(cdsPatrimonioSeg.FieldByName('DEPBEMATU0').asFloat, true) - fDepBemAtu0;
           cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat   := ConvNum(cdsPatrimonioSeg.FieldByName('CUSTOREAV0').asFloat, true) - fCustoReav0;
           cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := ConvNum(cdsPatrimonioSeg.FieldByName('DEPREAVACUM0').asFloat, true) - fDepreAvAcum0;
           cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat  := ConvNum(cdsPatrimonioSeg.FieldByName('DEPREAVATU0').asFloat, true) - fDepreAvAtu0;
           cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat      := ConvNum(cdsPatrimonioSeg.FieldByName('VALCTB0').asFloat, true) - fValCtb0;
           cdsImoMestreSegregacao.Post;
         end;

         cdsPatrimonioSeg.next;

       end;
      {
        if not cdsImoMestreSegregacao.Locate('IDIMOVELMESTRE;PATRO;PLANOPREV', VarArrayOf([
            _cdsTemp.FieldByName('IDIMOVELMESTRE').Value,
            _cdsTemp.FieldByName('PATRO').Value,
            _cdsTemp.FieldByName('PLANOPREV').Value]), []) then
        begin
          cdsImoMestreSegregacao.Append;
          cdsImoMestreSegregacao.FieldByName('IDIMOVELMESTRE').Value := _cdsTemp.FieldByName('IDIMOVELMESTRE').Value;
          cdsImoMestreSegregacao.FieldByName('IDIMOVEL').Value := _cdsTemp.FieldByName('IDIMOVEL').Value;
          cdsImoMestreSegregacao.FieldByName('NOME').Value := qrySldCtbImoveis.FieldByName('NOME').Value;
          cdsImoMestreSegregacao.FieldByName('PLANOPREV').Value := _cdsTemp.FieldByName('PLANOPREV').Value;
          cdsImoMestreSegregacao.FieldByName('PATRO').Value := _cdsTemp.FieldByName('PATRO').Value;
          cdsImoMestreSegregacao.FieldByName('PERCENTRATEIO').Value := 0;

          if _cdsTemp.RecNo = _cdsTemp.RecordCount then
          begin
            cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat   := ConvNum(qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat, true) -  fCustoCorr0;
            cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat  := ConvNum(qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat, true) -  fDepBemAcum0;
            cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat   := ConvNum(qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat, true) - fDepBemAtu0;
            cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat   := ConvNum(qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat, true) - fCustoReav0;
            cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := ConvNum(qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat, true) - fDepreAvAcum0;
            cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat  := ConvNum(qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat, true) - fDepreAvAtu0;
            cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat      := ConvNum(qrySldCtbImoveis.FieldByName('VALCTB0').asFloat, true) - fValCtb0;
          end
          else
          begin
            cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat := ConvNum((qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
            fCustoCorr0 := fCustoCorr0 + ConvNum(cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat,true);

            cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat := ConvNum((qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
            fDepBemAcum0 := fDepBemAcum0 + ConvNum(cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat,true);

            cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat := ConvNum((qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
            fDepBemAtu0 := fDepBemAtu0 + ConvNum(cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat,true);

            cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat := ConvNum((qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
            fCustoReav0 := fCustoReav0 + ConvNum(cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat,true);

            cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := ConvNum((qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
            fDepreAvAcum0 := fDepreAvAcum0 + ConvNum(cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat,true);

            cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat := ConvNum((qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
            fDepreAvAtu0 := fDepreAvAtu0 + ConvNum(cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat,true);

            cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat := ConvNum((qrySldCtbImoveis.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
            fValCtb0 := fValCtb0 + ConvNum(cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat,true);
          end;
        end
        else
        begin
          cdsImoMestreSegregacao.Edit;
          if _cdsTemp.RecNo = _cdsTemp.RecordCount then
          begin
            cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat   := cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat   + ( ConvNum(qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat, true) -  fCustoCorr0);
            cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat  := cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat  + ( ConvNum(qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat, true) -  fDepBemAcum0);
            cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat   := cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat   + ( ConvNum(qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat, true) - fDepBemAtu0);
            cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat   := cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat   + ( ConvNum(qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat, true) - fCustoReav0);
            cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat + ( ConvNum(qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat, true) - fDepreAvAcum0);
            cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat  := cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat  + ( ConvNum(qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat, true) - fDepreAvAtu0);
            cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat      := cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat      + ( ConvNum(qrySldCtbImoveis.FieldByName('VALCTB0').asFloat, true) - fValCtb0);
          end
          else
          begin  
            cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat := cdsImoMestreSegregacao.FieldByName('CUSTOCORR0').asFloat + (ConvNum((qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
            fCustoCorr0 := fCustoCorr0 +  ConvNum((qrySldCtbImoveis.FieldByName('CUSTOCORR0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

            cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPBEMACUM0').asFloat + (ConvNum((qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
            fDepBemAcum0 := fDepBemAcum0 + ConvNum((qrySldCtbImoveis.FieldByName('DEPBEMACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

            cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPBEMATU0').asFloat + (ConvNum((qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, true));
            fDepBemAtu0 := fDepBemAtu0 + ConvNum((qrySldCtbImoveis.FieldByName('DEPBEMATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) /100, true);

            cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat := cdsImoMestreSegregacao.FieldByName('CUSTOREAV0').asFloat + (ConvNum((qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
            fCustoReav0 := fCustoReav0 + ConvNum((qrySldCtbImoveis.FieldByName('CUSTOREAV0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

            cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPREAVACUM0').asFloat + (ConvNum((qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
            fDepreAvAcum0 := fDepreAvAcum0 + ConvNum((qrySldCtbImoveis.FieldByName('DEPREAVACUM0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

            cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat := cdsImoMestreSegregacao.FieldByName('DEPREAVATU0').asFloat + (ConvNum((qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
            fDepreAvAtu0 := fDepreAvAtu0 + ConvNum((qrySldCtbImoveis.FieldByName('DEPREAVATU0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);

            cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat := cdsImoMestreSegregacao.FieldByName('VALCTB0').asFloat + (ConvNum((qrySldCtbImoveis.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true));
            fValCtb0 := fValCtb0 + ConvNum((qrySldCtbImoveis.FieldByName('VALCTB0').asFloat * _cdsTemp.FieldByName('PERCENTRATEIO').asFloat) / 100, true);
          end;
        end;
        cdsImoMestreSegregacao.Post;
        qryPatrimonioSeg.Next;
       end;           }
//       cdsPatrimonio.EmptyDataSet;

       qrySldCtbImoveis.Next;
      end;
    end;

  finally
    FreeAndNil(_cdsTemp);
    FreeAndNil(_cdsTemp2);
    FreeAndNil(_Ctrl);
  end;
end;

function TfrmParamSldCtbImovel.ConvNum(nValor: Extended; trun2cd: boolean): Extended;
var
  vlrTexto:string;
begin
  //SOL:
  if trun2cd then
  begin
    try
      vlrTexto := FloatToStrF(nValor,ffnumber,20,6);
      vlrTexto := copy(vlrTexto,1, pos(',',vlrTexto) + 2);
      Result := strtofloat( StringReplace(vlrTexto,'.','',[rfreplaceall]) );
    except
      Result := strtofloat(Format('%20.5f',[nValor]));
    end;
  end
  else
    Result := strtofloat(Format('%20.5f',[nValor]));
end;

end.
