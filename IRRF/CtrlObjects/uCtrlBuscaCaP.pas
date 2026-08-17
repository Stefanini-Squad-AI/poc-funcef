unit uCtrlBuscaCaP;

// Alterações:
{
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto, GeraImpostos
//N. SIG.............: 127010
//Data da Alteração..: 08/07/2022
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração da atribuição da data de lançamento para tributações
//                     na natureza 8045 - Comissões  e  Corretagens  Pagas  à Pessoa
//                     Jurídica
//***************************************************************************************
//Rotina.............: GeraImpostos
//N. SIG.............: 100067
//Data da Alteração..: 25/05/2020
//Responsável........: Edilaine
//Descrição..........: Para imposto ISS preencher DataLancamento da LancIRRF com sysdate
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 97241
//Data da Alteração..: 05/02/2020
//Responsável........: Tiago Von
//Descrição..........: Correção da condição de pesquisa na busca dos documentos do Contas
//                     a Pagar quando for IRRF para o 0588.
//***************************************************************************************
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 94703
//Data da Alteração..: 27/11/2019
//Responsável........: Ewerton Beltramini
//Descrição..........: Corrigir alteração de datas para os casos do INSS.
//***************************************************************************************

//N. SIG.............: 92479
//Data da Alteração..: 02/10/2019
//Responsável........: Rafael Vasconcelos
//Descrição..........: Desfazer as alterações do SIG 91190. Alterar o codigo 1708 para 0588
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 91756
//Data da Alteração..: 16/09/2019
//Responsável........: Fabio Sampaio
//Descrição..........: Correção do Invalid Data Packet.
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 91336
//Data da Alteração..: 05/09/2019
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Correção na consulta de busca de Impostos.
//                     Buscar pela DATAVECNTO para natureza <> 1708.
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 91190
//Data da Alteração..: 03/09/2019
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Correção na consulta de busca de Impostos apresentando erro.
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 90055
//Data da Alteração..: 08/08/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração na determinação da data de lançamento de impostos para o
//                     rendimento 1708, em AP's que possuam nota fiscal
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 88829
//Data da Alteração..: 07/08/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção no processo de recuperação de impostos oriundos do
//                     rendimento 1708.
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 88333
//Data da Alteração..: 01/07/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na consulta de busca de impostos, que apresentou erro de execução.
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 88220
//Data da Alteração..: 28/06/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Atualização na rotina de busca de impostos para considerar AP's com
//                     emissão de nota  ou vencimento no mês selecionado.
//***************************************************************************************
//Rotina.............: MontaSQLBuscaImposto
//N. SIG.............: 75760
//Data da Alteração..: 06/06/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração no proecedimento de busca para os casos de IRRF para o rendimento 1708.
//***************************************************************************************
--------------------------------------------------------------------------------------------------
Rotina    : GeraImpostos
Data      : 02/05/2016
Autor     : Edilaine
SIG       : 20090 
Descrição : Erro no cálculo do VLRIRRF após acumulo de valores do modulo 64
{ --------------------------------------------------------------------------------------------------
Rotina    : CtrlBuscaCaP
Data      : 01/04/2016
Autor     : Darivaldo Alencar
SOL       : 270178 ppm:  1352233
Descrição : Erro na Soma de VLRIRRF do modulo 64
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto
Data      : 10/05/2012
Autor     : Fernando Xavier
Pendencia : 179844
Descrição : 1660740
----------------------------------------------------------------------------------------------------
Rotina    : GeraImpostos
Data      : 07/02/2007
Autor     : Bruno Bastos
Pendencia : 27050
Descrição : Passar a data de lançamento para a propriedade data de pagamento.
----------------------------------------------------------------------------------------------------
Rotina    : GeraImpostos
Data      : 02/08/2007 a 03/08/2007
Autor     : André Pontes
Pendencia : 26019
Descrição : Não estava gravando LancIRRF quando alterador manual lançado no documento englobador, pq
            o documento englobador não possui RateioDocum.
            1) Criada mensagem para indicar se não foi encontrado rateio
            2) Busca do rateio dos documentos originais
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto
Data      : 28/06/2007
Autor     : Bruno Bastos
Pendencia : 25720 e 25723
Descrição : 25720 - Não buscar impostos já buscados no padrão anterior.
            25723 - Acerto para fltrar pela natureza de rendimento.
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto(...)
Data      : 27/06/2007
Autor     : Bruno Bastos
Pendencia : 25712
Descrição : Coloquei mais uma condição nos if que testavam a variável bDataLanc, fazendo tratamento
            diferenciado para INSS e ISS.
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto(...)
Data      : 30/05/2007
Autor     : André Pontes
Pendencia : 25478
Descrição : Busca do código do alterador mesmo para impostos buscados da ImpostoRetido para informação
            Busca do Tipo de Desembolso ligado ao imposto com tabela de retenção
            Filtro por flgEstornado na ImpostoRetido
----------------------------------------------------------------------------------------------------
Rotina    : ValidaCdsDocumento
Data      : 30/05/2007
Autor     : André Pontes
Pendencia : 25478
Descrição : Restrição à gravação de impostos sem Tipo de Desembolso preenchido
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto(...)
Data      : 16/05/2007
Autor     : André Pontes
Pendencia : 24989
Descrição : Previsão para alteradores em documentos resultantes de englobamento
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto(...)
Data      : 07/05/2007
Autor     : André Pontes
Pendencia :
Descrição : Correção da busca das contas contábeis dos impostos com tabela de retenção
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto(...)
Data      : 03/05/2007
Autor     : André Pontes
Pendencia : 24989
Descrição : Criado mais um union para pegar apenas documentos englobados
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto(...)
Data      : 25/04/2007
Autor     : André Pontes
Pendencia :
Descrição : Criada subquery para trazer os dados contábeis do imposto retido, para evitar erro em
            caso de não preenchimento da tipocustoagregconta
----------------------------------------------------------------------------------------------------
Rotina    : GeraImpostos
Data      : 23/04/2007
Autor     : André Pontes
Pendencia : 22346
Descrição : Substituição do CodTipRecDes (Tipo de Desembolso) pelo valor indicado na query principal
            (cdsDocumento) em substituição ao que vinha do rateio
            cdsDocumento.FieldByName('CODTIPRECDES').AsString vs.
            cdsrateio.FieldByName('CODTIPRECDES').AsString 
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBusca... e MontaSQLDesfaz...
Data      : 23/04/2007
Autor     : André Pontes
Pendencia : 22346
Descrição : Alteração na busca do tipo de desembolso, para todos os impostos, da forma como era
            feito na versão antiga, para o IR. Buscar, nessa ordem:
            - tipo de alterador;
            - natureza do rendimento;
            - parâmetro do sistema.

            NVL(T.CODTIPRECDES, NVL(N.CODTIPRECDES, P.CODTIPRECDES)) AS CODTIPRECDES
----------------------------------------------------------------------------------------------------
Rotina    : MontaSQLBuscaImposto
Data      : 19/04/2007
Autor     : André Pontes
Pendencia : -
Descrição : Filtro da TipoCustAgregConta pela DebCre = 'C', e busca preferencial pela conta contábil
            ligada ao alterador
----------------------------------------------------------------------------------------------------
Rotina    : GeraImpostos
Data      : 21/03/2007
Autor     : André Pontes
Pendencia : 24513
Descrição : Se houver Centro de Custo indicado nos parâmetros do sistema, usar esse em vez do do
            rateio do documento
----------------------------------------------------------------------------------------------------
Rotina    : ValidaCdsDocumento
Data      : 26/02/2007
Autor     : André Pontes
Pendencia : 24451
Descrição : Nova função para varrer o cds de documentos antes do início dos lançamentos, para
            verificar prenchimento dos dados contábeis
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 09/02/2007 a 23/02/2007
Autor     : André Pontes
Pendencia : 24451
Descrição : Nova CTRL para buscar todos os impostos do Contas a Pagar
---------------------------------------------------------------------------------------------------}



// Impostos:

//    01 - IRRF
//    02 - INSS
//    15 - ISS
//    16 - PIS
//    17 - COFINS
//    18 - CSLL
//    19 - PIS/COFINS/CSLL
//    20 - CPMF




// Premissas (definição):
{ --------------------------------------------------------------------------------------------------
- O parâmetro do sistema (data de lançamento x data de baixa) só vale para alteradores manuais:
  quando há imposto calculado pelo CaP, vale a data da ImpostoRetido

- A natureza da operação é buscada da TipoAgre, para impostos lançados na ImpostoRetido, ou na
  TipoAlterador, para alteradores manuais

- O campo Natureza no cadastro de fornecedores é usado apenas para busca de rendimentos para informe,
  quando não há imposto retido nem alterador manual lançado
---------------------------------------------------------------------------------------------------}

interface

uses
  SysUtils, uCmControlObject, uSistema, DB, uDataBase, DbClient, ComCtrls,
  uCtrlObjIRRF, uCtrlLancIRRFCaP, uCtrlancIRRF, uCtrlParamIRRF, uCtrlParamIntegra, uCMClientDataSet,
  uCMMath, wwQuery, uCMFileUtils, ShellAPI, Windows, Classes, Forms, UFuncoesUteisIR,
  {$IFNDEF VERSAO0505}uCMTypes {$ENDIF} ;

  type
    TCtrlBuscaCaP = Class(TCmControlObject)

    private

      cdsLancxInforme : TCMClientDataSet;
      cdsParamIRRF    : TCMClientDataSet;
      cdsRateio       : TCMClientDataSet;
      cdsAux          : TCMClientDataSet;

      CtrlLancIRRFCaP : TCtrlLancIRRFCaP;
      CtrlLancIRRF    : TCtrLancIRRF;
      CtrlObjIRRF     : TCtrlObjIRRF;
      CtrlParamIRRF   : TCtrlParamIRRF;

      FDataIni        : TDateTime;
      FDataFim        : TDateTime;

      FFavorecido     : Integer;
      FDocumento      : Integer;
      FEmpresaProp    : Integer;
      FUsaPlanPatro   : Boolean;

      FProcIR         : Boolean;
      FProcINSS       : Boolean;
      FProcPIS        : Boolean;
      FProcISS        : Boolean;
      FProcRend       : Boolean;

      FNatuIR         : string;
      FNatuINSS       : string;
      FNatuPIS        : string;
      FNatuISS        : string;

      FPagLanc        : string;

      FcdsDocumento   : TCMClientDataSet;


      procedure SetDataFim(const Value: TDateTime);
      procedure SetDataIni(const Value: TDateTime);

      procedure SetDocumento(const Value: Integer);
      procedure SetFavorecido(const Value: Integer);
      procedure SetEmpresaProp(const Value: Integer);
      procedure SetUsaPlanPatro(const Value: Boolean);

      procedure SetProcIR(const Value: Boolean);
      procedure SetProcINSS(const Value: Boolean);
      procedure SetProcPIS(const Value: Boolean);
      procedure SetProcISS(const Value: Boolean);
      procedure SetProcRend(const Value: Boolean);

      procedure SetNatuIR(const Value: string);
      procedure SetNatuINSS(const Value: string);
      procedure SetNatuPIS(const Value: string);
      procedure SetNatuISS(const Value: string);

      procedure SetPagLanc(const Value: string);

      procedure SetCdsDocumento(const Value: TCMClientDataSet);

      procedure BuscaParamIRRF;


    protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;


    private

      function MontaSQLBuscaImposto(const piCodImposto  : Integer;
                                    const psNomeImposto : string;
                                    const psCampoValor  : string;
                                    const psNatureza    : string
                                   ): string;

      function MontaSQLBuscaIR      : string;
      function MontaSQLBuscaINSS    : string;
      function MontaSQLBuscaPIS     : string;
      function MontaSQLBuscaISS     : string;
      function MontaSQLBuscaRend    : string;

      function MontaSQLDesfazImposto(const psNomeImposto : string;
                                     const psCampoValor  : string;
                                     const psNatureza    : string
                                    ): string;

      function MontaSQLDesfazIR     : string;
      function MontaSQLDesfazINSS   : string;
      function MontaSQLDesfazPIS    : string;
      function MontaSQLDesfazISS    : string;
      function MontaSQLDesfazRend   : string;

      function BuscaValorDependentesIRRF(const pdDataDepend : TDateTime;
                                         const piForCli     : Integer
                                        ): Currency;


    public

      constructor Create; override;
      destructor Destroy; override;

      // -------------------------------------------------------------------------------------------

      property ProcIR       : Boolean         read FProcIR        write SetProcIR;
      property ProcINSS     : Boolean         read FProcINSS      write SetProcINSS;
      property ProcPIS      : Boolean         read FProcPIS       write SetProcPIS;
      property ProcISS      : Boolean         read FProcISS       write SetProcISS;
      property ProcRend     : Boolean         read FProcRend      write SetProcRend;

      property NatuIR       : string          read FNatuIR        write SetNatuIR;
      property NatuINSS     : string          read FNatuINSS      write SetNatuINSS;
      property NatuPIS      : string          read FNatuPIS       write SetNatuPIS;
      property NatuISS      : string          read FNatuISS       write SetNatuISS;

      property DataIni      : TDateTime       read FDataIni       write SetDataIni;
      property DataFim      : TDateTime       read FDataFim       write SetDataFim;

      property Documento    : Integer         read FDocumento     write SetDocumento;
      property Favorecido   : Integer         read FFavorecido    write SetFavorecido;
      property EmpresaProp  : Integer         read FEmpresaProp   write SetEmpresaProp;
      property UsaPlanPatro : Boolean         read FUsaPlanPatro  write SetUsaPlanPatro;

      property PagLanc      : string          read FPagLanc       write SetPagLanc;

      property cdsDocumento : TCMClientDataSet  read FcdsDocumento  write SetCdsDocumento;

      // -------------------------------------------------------------------------------------------

      function ListaImpostosBusca     : OleVariant;
      function ListaImpostosDesfazer  : OleVariant;

      procedure GeraImpostos;
      procedure DesfazImpostos;

      function  ValidaCdsDocumento    : Boolean;

      // -------------------------------------------------------------------------------------------

    end;



implementation
{ TCtrlBuscaCaP }



// -------------------------------------------------------------------------------------------------
// Propriedades
// -------------------------------------------------------------------------------------------------

procedure TCtrlBuscaCaP.SetDataFim(const Value: TDateTime);
begin
  FDataFim := Value;
end;

procedure TCtrlBuscaCaP.SetDataIni(const Value: TDateTime);
begin
  FDataIni := Value;
end;

procedure TCtrlBuscaCaP.SetDocumento(const Value: Integer);
begin
  FDocumento := Value;
end;

procedure TCtrlBuscaCaP.SetFavorecido(const Value: Integer);
begin
  FFavorecido := Value;
end;

procedure TCtrlBuscaCaP.SetNatuINSS(const Value: string);
begin
  FNatuINSS := Value;
end;

procedure TCtrlBuscaCaP.SetNatuIR(const Value: string);
begin
  FNatuIR := Value;
end;

procedure TCtrlBuscaCaP.SetNatuISS(const Value: string);
begin
  FNatuISS := Value;
end;

procedure TCtrlBuscaCaP.SetNatuPIS(const Value: string);
begin
  FNatuPIS := Value;
end;

procedure TCtrlBuscaCaP.SetProcINSS(const Value: Boolean);
begin
  FProcINSS := Value;
end;

procedure TCtrlBuscaCaP.SetProcIR(const Value: Boolean);
begin
  FProcIR := Value;
end;

procedure TCtrlBuscaCaP.SetProcISS(const Value: Boolean);
begin
  FProcISS := Value;
end;

procedure TCtrlBuscaCaP.SetProcPIS(const Value: Boolean);
begin
  FProcPIS := Value;
end;

procedure TCtrlBuscaCaP.SetCdsDocumento(const Value: TCMClientDataSet);
begin
  FcdsDocumento := Value;
end;

procedure TCtrlBuscaCaP.SetEmpresaProp(const Value: Integer);
begin
  FEmpresaProp := Value;
end;

procedure TCtrlBuscaCaP.SetUsaPlanPatro(const Value: Boolean);
begin
  FUsaPlanPatro := Value;
end;

procedure TCtrlBuscaCaP.SetProcRend(const Value: Boolean);
begin
  FProcRend := Value;
end;

procedure TCtrlBuscaCaP.SetPagLanc(const Value: string);
begin
  FPagLanc := Value;
end;

// -------------------------------------------------------------------------------------------------
// FIM Propriedades
// -------------------------------------------------------------------------------------------------



procedure TCtrlBuscaCaP.AfterInitialize;
begin
  inherited;

  CtrlParamIRRF.InitializeAs(self);
  CtrlLancIRRF.InitializeAs(self);
  CtrlLancIRRFCaP.InitializeAs(self);

  CtrlParamIRRF.OpenTransaction   := False;
  CtrlLancIRRF.OpenTransaction    := False;
  CtrlLancIRRFCaP.OpenTransaction := False;
end;



constructor TCtrlBuscaCaP.Create;
begin
  inherited;

  cdsRateio       := TCMClientDataSet.Create(nil);
  cdsAux          := TCMClientDataSet.Create(nil);
  cdsParamIRRF    := TCMClientDataSet.Create(nil);
  cdsLancxInforme := TCMClientDataSet.Create(nil);

  CtrlLancIRRF    := TCtrLancIRRF.Create;
  CtrlLancIRRFCaP := TCtrlLancIRRFCaP.Create;
  CtrlParamIRRF   := TCtrlParamIRRF.Create;
end;



procedure TCtrlBuscaCaP.BuscaParamIRRF;
var
  sSQL : string;
begin
  // Verifica o parâmetro do sistema que define se os impostos (hoje não discrimina) devem ser
  // buscados por data de lançamento (competência) ou data de pagamento (baixa - caixa)

  sSQL :=
  'SELECT '                               + #13 +
  '  PIR.FLGPAGLANC '                     + #13 +
  'FROM '                                 + #13 +
  '  PARAMIRRF PIR '                      + #13 +
  'WHERE '                                + #13 +
  '  PIR.IDPESSOA = ' + FormatFloat('#0', EmpresaProp);

  cdsParamIRRF.Data := GetDataPacket(sSQL);

  PagLanc   := cdsParamIRRF.FieldByName('FLGPAGLANC').AsString;
end;



destructor TCtrlBuscaCaP.Destroy;
begin
  inherited;

  cdsRateio.Free;
  cdsAux.Free;
  cdsParamIRRF.Free;
  cdsLancxInforme.Free;

  CtrlParamIRRF.Free;
  CtrlLancIRRF.Free;
  CtrlLancIRRFCaP.Free;
end;



procedure TCtrlBuscaCaP.DoChangeDataBase;
begin
  inherited;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------

function TCtrlBuscaCaP.ListaImpostosBusca: OleVariant;
var
  sSQL : string;
  qry  : TwwQuery;
begin
  // -----------------------------------------------------------------------------------------------
  BuscaParamIRRF;

  // -----------------------------------------------------------------------------------------------

  // Concatena o SQL da query que busca os impostos a processar

  sSQL := '';

  if ProcIR                                                     then  sSQL := sSQL + MontaSQLBuscaIR;
  if (ProcIR) and (ProcINSS)                                    then  sSQL := sSQL + 'UNION ' + #13;
  if ProcINSS                                                   then  sSQL := sSQL + MontaSQLBuscaINSS;
  if (ProcIR or ProcINSS) and (ProcPIS)                         then  sSQL := sSQL + 'UNION ' + #13;
  if ProcPIS                                                    then  sSQL := sSQL + MontaSQLBuscaPIS;
  if (ProcIR or ProcINSS or ProcPIS) and (ProcISS)              then  sSQL := sSQL + 'UNION ' + #13;
  if ProcISS                                                    then  sSQL := sSQL + MontaSQLBuscaISS;
  if (ProcIR or ProcINSS or ProcPIS or ProcISS) and ProcRend    then  sSQL := sSQL + 'UNION ' + #13;
  if ProcRend                                                   then  sSQL := sSQL + MontaSQLBuscaRend;

  sSQL := sSQL +
  'ORDER BY ' + #13 +
  '  RAZAOSOCIAL, DATALANCTO, IDFORCLI, NODOCUMENTO ';      // edilaine - SIG 20090

  //Darivaldo Alencar  -- 270178 ppm:1352233 - inicio
  ///////////// pegar NUMDOCUMENTO do proximo registro
  sSQL := ' SELECT ' +
          ' T.*, LEAD(NUMDOCUMENTO) OVER (ORDER BY RAZAOSOCIAL, DATALANCTO, IDFORCLI, NODOCUMENTO) AS PROXNUMDOC ' +         // edilaine - SIG 20090
          '    , LEAD(NODOCUMENTO)  OVER (ORDER BY RAZAOSOCIAL, DATALANCTO, IDFORCLI, NODOCUMENTO) AS PROXNODOC ' +          // edilaine - SIG 20090
          ' FROM (' +
          sSQL + ') T ';
  //Darivaldo Alencar  -- 270178 ppm:1352233 - fim

  {$IFDEF DEBUG}
  CMDebugToFile(sSQL, 'C:\Planus\Temp\ListaImpostosBusca.sql');
  {$ENDIF}
  // -----------------------------------------------------------------------------------------------
  Result := GetDataPacket(sSQL);

  // -----------------------------------------------------------------------------------------------
end;



function TCtrlBuscaCaP.ListaImpostosDesfazer: OleVariant;
var
  sSQL : string;
  qry  : TwwQuery;
begin
  // -----------------------------------------------------------------------------------------------

  BuscaParamIRRF;

  // -----------------------------------------------------------------------------------------------

  // Concatena o SQL da query que busca os impostos a processar

  sSQL := '';

  if ProcIR                                                     then  sSQL := sSQL + MontaSQLDesfazIR;
  if (ProcIR) and (ProcINSS)                                    then  sSQL := sSQL + 'UNION ' + #13;
  if ProcINSS                                                   then  sSQL := sSQL + MontaSQLDesfazINSS;
  if (ProcIR or ProcINSS) and (ProcPIS)                         then  sSQL := sSQL + 'UNION ' + #13;
  if ProcPIS                                                    then  sSQL := sSQL + MontaSQLDesfazPIS;
  if (ProcIR or ProcINSS or ProcPIS) and (ProcISS)              then  sSQL := sSQL + 'UNION ' + #13;
  if ProcISS                                                    then  sSQL := sSQL + MontaSQLDesfazISS;
  if (ProcIR or ProcINSS or ProcPIS or ProcISS) and ProcRend    then  sSQL := sSQL + 'UNION ' + #13;
  if ProcRend                                                   then  sSQL := sSQL + MontaSQLDesfazRend;

  sSQL := sSQL +
  'ORDER BY ' + #13 +
  '  RAZAOSOCIAL, DATALANCTO, IDFORCLI ';

  // -----------------------------------------------------------------------------------------------
  Result := GetDataPacket(sSQL);

  // -----------------------------------------------------------------------------------------------
end;



function TCtrlBuscaCaP.BuscaValorDependentesIRRF(const pdDataDepend : TDateTime;
                                                 const piForCli     : Integer
                                                ): Currency;
var
  iNumDepIRRF : Integer;
  fVlrDepend  : Currency;
  dDataDepend : TDateTime;

  sSQL        : string;
  sDataDepend : string;
begin
  sDataDepend := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataDepend)) + ', ''DD/MM/YYYY'')';

  // -----------------------------------------------------------------------------------------------
  // 1) Busca a última data de alteração dos parâmetros do sistema imediatamente anterior à data de
  //    processamento
  // -----------------------------------------------------------------------------------------------

  sSQL :=
  'SELECT '                                   + #13 +
  '  MAX(HPI.DATAINIVIGENCIA) AS DATA '       + #13 +
  'FROM '                                     + #13 +
  '  HSTPARAMIRRF HPI '                       + #13 +
  'WHERE '                                    + #13 +
  '  HPI.DATAINIVIGENCIA <= ' + sDataDepend;

  cdsAux.Data := GetDataPacket(sSQL);
  dDataDepend := cdsAux.FieldByName('DATA').AsDateTime;
  sDataDepend := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDepend)) + ', ''DD/MM/YYYY'')';

  // -----------------------------------------------------------------------------------------------
  // 2) Determina o valor por dependente baseado na data retornada
  // -----------------------------------------------------------------------------------------------

  sSQL :=
  'SELECT '                   + #13 +
  '  HPI.VLRDEPENDENTE '      + #13 +
  'FROM '                     + #13 +
  '  HSTPARAMIRRF HPI '       + #13 +
  'WHERE '                    + #13 +
  '  HPI.DATAINIVIGENCIA = '  + sDataDepend;

  cdsAux.Data := GetDataPacket(sSQL);
  fVlrDepend  := cdsAux.FieldByName('VLRDEPENDENTE').AsCurrency;

  // -----------------------------------------------------------------------------------------------
  // 3) Busca a última data de alteração da quantidade de dependentes do favorecido imediatamente
  //    anterior à data de processamento
  // -----------------------------------------------------------------------------------------------

  // como a variável havia sido reciclada, reninicializa com o parâmetro passado à função
  sDataDepend := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataDepend)) + ', ''DD/MM/YYYY'')';

  sSQL :=
  'SELECT '                                               + #13 +
  '  MAX(DPP.DATA) AS DATA '                              + #13 +
  'FROM '                                                 + #13 +
  '  DEPENDPESSOA DPP '                                   + #13 +
  'WHERE '                                                + #13 +
  '      DPP.IDPESSOA   = ' + FormatFloat('#0', piForCli) + #13 +
  '  AND DPP.DATA      <= ' + sDataDepend;

  cdsAux.Data := GetDataPacket(sSQL);
  dDataDepend := cdsAux.FieldByName('DATA').AsDateTime;
  sDataDepend := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataDepend)) + ', ''DD/MM/YYYY'')';

  // -----------------------------------------------------------------------------------------------
  // 4) Determina a quantidade de dependentes baseado na data retornada
  // -----------------------------------------------------------------------------------------------

  sSQL :=
  'SELECT '                                             + #13 +
  '  DPP.NUMDEP '                                       + #13 +
  'FROM '                                               + #13 +
  '  DEPENDPESSOA DPP '                                 + #13 +
  'WHERE '                                              + #13 +
  '      DPP.IDPESSOA = ' + FormatFloat('#0', piForCli) + #13 +
  '  AND DPP.DATA     = ' + sDataDepend;

  cdsAux.Data := GetDataPacket(sSQL);
  iNumDepIRRF := cdsAux.FieldByName('NUMDEP').AsInteger;

  // -----------------------------------------------------------------------------------------------
  // 5) Com todas as variáveis determinadas, agora é apenas aritmética...
  // -----------------------------------------------------------------------------------------------

  Result := iNumDepIRRF * fVlrDepend;

  // -----------------------------------------------------------------------------------------------
end;



procedure TCtrlBuscaCaP.GeraImpostos;
var
  iCodLanc          : Double;

  fValorImposto     : Currency;
  fValorBase        : Currency;

  fVlrTotBase       : Currency;
  fVlrTotImposto    : Currency;
  fVlrRatBase       : Currency;
  fVlrRatImposto    : Currency;

  fPercentIRRF      : Currency;
  fVlrDepIRRF       : Currency;

  fVlrIRRF          : Currency;
  fVlrINSS          : Currency;
  fVlrISS           : Currency;
  fVlrPIS           : Currency;
  fVlrCOFINS        : Currency;
  fVlrCSLL          : Currency;
  fVlrCSLLPISCOFINS : Currency;

  bPrim             : Boolean;
  bErro             : Boolean;

  i                 : Integer;
  iTotRecRateio     : Integer;

  sCodCentroRespon  : String;
  sSQL              : String;
  //Darivaldo Alencar  -- 270178 ppm:1352233 - inicio
  numdoc            : string;
  fValorImpostoInc  : Currency;
  //Darivaldo Alencar  -- 270178 ppm:1352233 - fim

begin
  // Mostra form de progresso
  DoProgresso([ProgressFileName, 0, 0, cdsDocumento.RecordCount, 0, 'Processando busca de impostos...']);

  // -----------------------------------------------------------------------------------------------
  //
  fValorImpostoInc := 0; //Darivaldo Alencar  -- 270178 ppm:1352233 - inicio
  
  try
    cdsDocumento.First;
    while not(cdsDocumento.EOF) do
    begin
      // -------------------------------------------------------------------------------------------

      sSQL :=
      'SELECT (0) AS VLRLANCSINAL, FLGTIPOREG, IDINFORME, IDLANCIRRF, PERCLANC, VLRLANC, 1 AS FONTEPAGADORA ' + #13 +
      'FROM   LANCXINFORME '                                                                                  + #13 +
      'WHERE  1 = 2 ';

      cdsLancxInforme.Data := GetDataPacket(sSQL);

      // -------------------------------------------------------------------------------------------

      if cdsDocumento.FieldByName('OPERACAO').AsString = '3' then
      begin
        sSQL :=
        'SELECT '                                                                                           + #13 +
        '  R.IDPATRO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPROGRAMA, '                                        + #13 +
        '  R.CODCENTROCUSTO, R.CODCENTRORESPON, R.UNIDNEGOC, '                                              + #13 +
        '  DECODE(T.TOTAL, 0, 0, (SUM(R.VALOR) / T.TOTAL)) AS PERC '                                        + #13 +

        'FROM '                                                                                             + #13 +
        '  RATEIODOCUM R, '                                                                                 + #13 +

        '  ( '                                                                                              + #13 +
        '  SELECT SUM(VALOR) AS TOTAL '                                                                     + #13 +
        '  FROM   RATEIODOCUM '                                                                             + #13 +
        '  WHERE  CODDOCUMENTO IN ( '                                                                       + #13 +
        '                         SELECT CODDOCUMENTO '                                                     + #13 +
        '                         FROM   DOCUMENTO '                                                        + #13 +
        '                         WHERE  NUMFATURA = ' + FormatFloat('#0', cdsDocumento.FieldByName('NUMFATURA').AsFloat) + #13 +
        '                         ) '                                                                       + #13 +
        '  ) T '                                                                                            + #13 +

        'WHERE '                                                                                            + #13 +
        '  R.CODDOCUMENTO IN ( '                                                                            + #13 +
        '                    SELECT CODDOCUMENTO '                                                          + #13 +
        '                    FROM   DOCUMENTO '                                                             + #13 +
        '                    WHERE  NUMFATURA = ' + FormatFloat('#0', cdsDocumento.FieldByName('NUMFATURA').AsFloat) + #13 +
        '                    ) '                                                                            + #13 +

        'GROUP BY '                                                                                         + #13 +
        '  R.IDPATRO, R.IDPLANOPREV, R.IDPROGRAMA, R.CODCENTROCUSTO, '                                      + #13 +
        '  R.CODCENTRORESPON, R.UNIDNEGOC, T.TOTAL, R.CODTIPRECDES ';
      end
      else
      begin
        sSQL :=
        'SELECT '                                                                                           + #13 +
        '  R.IDPATRO, R.CODTIPRECDES, R.IDPLANOPREV, R.IDPROGRAMA, '                                        + #13 +
        '  R.CODCENTROCUSTO, R.CODCENTRORESPON, R.UNIDNEGOC, '                                              + #13 +
        '  DECODE(T.TOTAL, 0, 0, (SUM(R.VALOR) / T.TOTAL)) AS PERC '                                        + #13 +

        'FROM '                                                                                             + #13 +
        '  RATEIODOCUM R, '                                                                                 + #13 +

        '  ( '                                                                                              + #13 +
        '  SELECT SUM(VALOR) AS TOTAL '                                                                     + #13 +
        '  FROM   RATEIODOCUM '                                                                             + #13 +
        '  WHERE  CODDOCUMENTO = ' + FormatFloat('#0', cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat)    + #13 +
        '  ) T '                                                                                            + #13 +

        'WHERE '                                                                                            + #13 +
        '  R.CODDOCUMENTO = ' + FormatFloat('#0', cdsDocumento.FieldByName('CODDOCUMENTO').AsFloat)         + #13 +

        'GROUP BY '                                                                                         + #13 +
        '  R.IDPATRO, R.IDPLANOPREV, R.IDPROGRAMA, R.CODCENTROCUSTO, '                                      + #13 +
        '  R.CODCENTRORESPON, R.UNIDNEGOC, T.TOTAL, R.CODTIPRECDES ';
      end;
      cdsRateio.Data := GetDataPacket(sSQL);
      // -------------------------------------------------------------------------------------------

      if cdsRateio.IsEmpty then
      begin
        bErro := True;

        MessageInfo :=
        CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
        FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
        CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
        CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
        CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' +
        'Não foi encontrado rateio para o documento';

        DoProgresso([ProgressFileName, 1, 0, 0, cdsDocumento.RecNo, '', ord(bErro)]);

        cdsDocumento.Next;
        Continue;
      end;

      // -------------------------------------------------------------------------------------------

      fValorImposto   := cdsDocumento.FieldByName('VALOR').AsCurrency;

      //Darivaldo Alencar  -- 270178 ppm:1352233 - inicio
      if (cdsDocumento.FieldByName('IDMODULO').AsInteger = 64)
          and (trim(cdsDocumento.FieldByName('PROXNUMDOC').AsString) = trim(cdsDocumento.FieldByName('NUMDOCUMENTO').AsString) )
          and (trim(cdsDocumento.FieldByName('PROXNODOC').AsString)  = trim(cdsDocumento.FieldByName('NODOCUMENTO').AsString) )    // edilaine - SIG 20090
          then
      begin
        fValorImpostoInc := fValorImpostoInc + fValorImposto;

        cdsDocumento.next;

        DoProgresso([ProgressFileName, 1, 0, 0, cdsDocumento.RecNo, '', ord(bErro)]);

        continue;
      end;

      //fValorImposto   := cdsDocumento.FieldByName('VALOR').AsCurrency;
      fValorImposto   := cdsDocumento.FieldByName('VALOR').AsCurrency + fValorImpostoInc; // darivaldo & santana
     //Darivaldo Alencar  -- 270178 ppm:1352233 - inicio

      fValorBase      := cdsDocumento.FieldByName('VALBASE').AsCurrency;

      // -------------------------------------------------------------------------------------------
      // Parte específica do IRRF (valor de desconto pelos dos dependentes)
      // -------------------------------------------------------------------------------------------

      fPercentIRRF    := 0;
      fVlrDepIRRF     := 0;
      if cdsDocumento.FieldByName('CODIMPOSTO').AsInteger = 1 then
      begin
        fVlrDepIRRF   := BuscaValorDependentesIRRF(cdsDocumento.FieldByName('DATALANCTO').AsDateTime,
                                                   cdsDocumento.FieldByName('IDFORCLI').AsInteger
                                                  );
        fPercentIRRF  := fValorImposto / fValorBase * 100;
      end;

      // -------------------------------------------------------------------------------------------

      StartTransaction;

      try
        bErro           := False;
        bPrim           := True;
        fVlrTotBase     := 0;
        fVlrTotImposto  := 0;
        iTotRecRateio   := 1;

        cdsRateio.First;
        while not(cdsRateio.EOF) do
        begin
          iCodLanc          := 0;

          fVlrRatBase       := RoundCM(fValorBase * cdsRateio.FieldByName('PERC').AsFloat, 2);
          fVlrRatImposto    := RoundCM(fValorImposto * cdsRateio.FieldByName('PERC').AsFloat, 2);

          fVlrTotBase       := fVlrTotBase + fVlrRatBase;
          fVlrTotImposto    := fVlrTotImposto + fVlrRatImposto;

          sCodCentroRespon  := cdsRateio.FieldByName('CODCENTRORESPON').AsString;

          if iTotRecRateio = cdsRateio.RecordCount then
          begin
             //Darivaldo Alencar  -- 270178 ppm:1352233 - inicio
            //if (Format('%17.2f', [fVlrTotImposto]) <> Format('%17.2f', [cdsDocumento.FieldByName('VALOR').AsFloat])) then
            if (Format('%17.2f', [fVlrTotImposto]) <> Format('%17.2f', [fValorImposto])) then
            begin
              //fVlrRatImposto := fVlrRatImposto + (cdsDocumento.FieldByName('VALOR').AsFloat - fVlrTotImposto);
              fVlrRatImposto := fVlrRatImposto + (fValorImposto - fVlrTotImposto);
            //Darivaldo Alencar  -- 270178 ppm:1352233 - fim
            end;
          end;

          // ---------------------------------------------------------------------------------------

          fVlrIRRF          := 0;
          fVlrINSS          := 0;
          fVlrISS           := 0;
          fVlrPIS           := 0;
          fVlrCOFINS        := 0;
          fVlrCSLL          := 0;
          fVlrCSLLPISCOFINS := 0;

          case cdsDocumento.FieldByName('CODIMPOSTO').AsInteger of

            01: fVlrIRRF          := fVlrRatImposto;
            02: fVlrINSS          := fVlrRatImposto;
            15: fVlrISS           := fVlrRatImposto;
            16: fVlrPIS           := fVlrRatImposto;
            17: fVlrCOFINS        := fVlrRatImposto;
            18: fVlrCSLL          := fVlrRatImposto;
            19: fVlrCSLLPISCOFINS := fVlrRatImposto;

          end;

          // ---------------------------------------------------------------------------------------
          // Atribuicao das variáveis
          CtrlLancIRRFCaP.LimpaCampos;

          CtrlLancIRRFCaP.Natureza      := cdsDocumento.FieldByName('CODNATUREZA').AsString;

          //edilaine - SIG91336
          //CtrlLancIRRFCaP.DataLancto    := cdsDocumento.FieldByName('DATALANCTO').AsDateTime;
          //CtrlLancIRRFCaP.DataPagto     := cdsDocumento.FieldByName('DATALANCTO').AsDateTime; //CPREV - Pend. 27050
          //Cássio Rovaroto - SIG nº 127010 - Início
          if (cdsDocumento.FieldByName('CODNATUREZA').AsString = '1708') or
             (cdsDocumento.FieldByName('CODNATUREZA').AsString = '8045') or
             (cdsDocumento.FieldByName('CODIMPOSTO').AsInteger = 2) then   //Rafael -SIG92479  //Ewerton Beltramini - SIG94703
           CtrlLancIRRFCaP.DataLancto    := cdsDocumento.FieldByName('DATAEMISSAO').AsDateTime         //Rafael -SIG92479
          else if (cdsDocumento.FieldByName('CODIMPOSTO').AsInteger = 15) then                                                            //edilaine SIG100067
           CtrlLancIRRFCaP.DataLancto    := cdsDocumento.FieldByName('DATALANCTO').AsDateTime                                             //edilaine SIG100067
          else
          CtrlLancIRRFCaP.DataLancto    := cdsDocumento.FieldByName('DATAVENCTO').AsDateTime;   //Rafael -SIG92479

          CtrlLancIRRFCaP.DataPagto     := cdsDocumento.FieldByName('DATAVENCTO').AsDateTime;
          //edilaine

          CtrlLancIRRFCaP.Documento     := cdsDocumento.FieldByName('CODDOCUMENTO').AsInteger;
          CtrlLancIRRFCaP.NumLancto     := cdsDocumento.FieldByName('NUMLANCTO').AsInteger;

          CtrlLancIRRFCaP.Favorecido    := cdsDocumento.FieldByName('IDFORCLI').AsInteger;
          CtrlLancIRRFCaP.EmpresaProp   := EmpresaProp;
          CtrlLancIRRFCaP.UsaPlanPatro  := UsaPlanPatro;

          CtrlLancIRRFCaP.VlrBase       := fVlrRatBase;
          CtrlLancIRRFCaP.VlrIR         := fVlrIRRF;
          CtrlLancIRRFCaP.VlrINSS       := fVlrINSS;
          CtrlLancIRRFCaP.VlrPIS        := fVlrPIS;
          CtrlLancIRRFCaP.VlrCOFINS     := fVlrCOFINS;
          CtrlLancIRRFCaP.VlrCSLL       := fVlrCSLL;
          CtrlLancIRRFCaP.VlrCSCOFPIS   := fVlrCSLLPISCOFINS;
          CtrlLancIRRFCaP.VlrISS        := fVlrISS;

          CtrlLancIRRFCaP.PercentIR     := fPercentIRRF;
          CtrlLancIRRFCaP.VlrDepIR      := fVlrDepIRRF;

          CtrlLancIRRFCaP.ContaContab   := trim(cdsDocumento.FieldByName('PLACONTA').AsString);
          CtrlLancIRRFCaP.PlanoContab   := cdsDocumento.FieldByName('PLANO').AsInteger;
          CtrlLancIRRFCaP.PlanoPrev     := cdsRateio.FieldByName('IDPLANOPREV').AsInteger;
          CtrlLancIRRFCaP.Patro         := cdsRateio.FieldByName('IDPATRO').AsInteger;
          CtrlLancIRRFCaP.Programa      := cdsRateio.FieldByName('IDPROGRAMA').AsInteger;
          CtrlLancIRRFCaP.Modulo        := 3;

          // ---------------------------------------------------------------------------------------
          // Se houver Centro de Custo indicado nos parâmetros do sistema, usar esse em vez do do
          // rateio do documento
          if trim(cdsDocumento.FieldByName('CCUSTOCAP').AsString) <> '' then
          begin
            CtrlLancIRRFCaP.CentroCusto := cdsDocumento.FieldByName('CCUSTOCAP').AsString;
          end
          else
          begin
            CtrlLancIRRFCaP.CentroCusto := cdsRateio.FieldByName('CODCENTROCUSTO').AsString;
          end;
          // ---------------------------------------------------------------------------------------

          CtrlLancIRRFCaP.TipoRecDes    := cdsDocumento.FieldByName('CODTIPRECDES').AsString;
          CtrlLancIRRFCaP.CentroRespon  := cdsRateio.FieldByName('CODCENTRORESPON').AsString;
          CtrlLancIRRFCaP.AtivProjeto   := cdsRateio.FieldByName('UNIDNEGOC').AsInteger;

          if cdsDocumento.FieldByName('CODIMPOSTO').AsInteger in [02, 15] then
            CtrlLancIRRFCaP.CodGPS      := cdsDocumento.FieldByName('CODIGOGPS').AsInteger;

          CtrlLancIRRFCaP.CPFCGC        := cdsDocumento.FieldByName('NUMDOCUMENTO').AsString;

          // ---------------------------------------------------------------------------------------

          if not(CtrlLancIRRFCaP.InsertLancIRRF) then
          begin
            Rollback;

            bErro := True;

            MessageInfo :=
            CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
            FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
            CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
            CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
            //CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' + //Darivaldo Alencar  -- 270178 ppm:1352233
            CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', fValorImposto), ' ', 14)   + ' ' +
            'Erro ao gravar lançamento rateado: ' + CtrlLancIRRFCaP.MessageInfo;

            Break;  // Sai do loop de rateio, dando rollback no imposto inteiro (não apenas no
          end;

          // ---------------------------------------------------------------------------------------

          cdsRateio.Next;
          inc(iTotRecRateio);
        end;

        // -----------------------------------------------------------------------------------------

        if not(bErro) then
        begin
          Commit;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          //CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' + //Darivaldo Alencar  -- 270178 ppm:1352233
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', fValorImposto), ' ', 14)   + ' ' +
          cdsDocumento.FieldByName('RAZAOSOCIAL').AsString;
        end;

        // -----------------------------------------------------------------------------------------

      except
        on E:Exception do
        begin
          Rollback;

          bErro := True;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          //CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' + //Darivaldo Alencar  -- 270178 ppm:1352233
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', fValorImposto), ' ', 14)   + ' ' +
          'Erro ao gravar lançamento rateado: ' + CtrlLancIRRFCaP.MessageInfo;
        end;
      end;


      DoProgresso([ProgressFileName, 1, 0, 0, cdsDocumento.RecNo, '', ord(bErro)]);

      fValorImpostoInc := 0;        // edilaine - SIG 20090

      cdsDocumento.Next;
    end;

  finally
    // Esconde form de progresso
    DoProgresso([ProgressFileName, 2]);
  end;
end;



procedure TCtrlBuscaCaP.DesfazImpostos;
var
  sSQL  : string;
  bErro : Boolean;
begin
  // Mostra form de progresso
  DoProgresso([ProgressFileName, 0, 0, cdsDocumento.RecordCount, 0, 'DESFAZENDO busca de impostos...']);

  // -----------------------------------------------------------------------------------------------

  try
    cdsDocumento.First;
    while not(cdsDocumento.EOF) do
    begin
      // -------------------------------------------------------------------------------------------

      StartTransaction;
      bErro := False;

      try
        // -----------------------------------------------------------------------------------------
        // 1) Exclui os registros da LancXInforme
        // -----------------------------------------------------------------------------------------

        sSQL :=
        'DELETE '                   + #13 +
        'FROM   LANCXINFORME LXI '  + #13 +
        'WHERE  LXI.IDLANCIRRF = '  + FormatFloat('#0', cdsDocumento.FieldByName('IDLANCIRRF').AsInteger);

        if not(ExecSQL(sSQL)) then
        begin
          Rollback;

          bErro := True;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' +
          'Erro ao excluir LancXInforme';

          DoProgresso([ProgressFileName, 1, 0, 0, cdsDocumento.RecNo, '', ord(bErro)]);
          cdsDocumento.Next;
          Continue;
        end;

        // -----------------------------------------------------------------------------------------
        // 2) Exclui os registros da LancIRRF
        // -----------------------------------------------------------------------------------------

        sSQL :=
        'DELETE '                   + #13 +
        'FROM   LANCIRRF LIR '      + #13 +
        'WHERE  LIR.IDLANCIRRF = '  + FormatFloat('#0', cdsDocumento.FieldByName('IDLANCIRRF').AsInteger);

        if not(ExecSQL(sSQL)) then
        begin
          Rollback;

          bErro := True;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' +
          'Erro ao excluir LancIRRF';
        end;


        if not(bErro) then
        begin
          Commit;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' +
          cdsDocumento.FieldByName('RAZAOSOCIAL').AsString;
        end;

        // -----------------------------------------------------------------------------------------

      except
        on E:Exception do
        begin
          Rollback;

          bErro := True;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' +
          'ERRO';
        end;
      end;

      DoProgresso([ProgressFileName, 1, 0, 0, cdsDocumento.RecNo, '', ord(bErro)]);
      cdsDocumento.Next;
    end;

  finally
    // Esconde form de progresso
    DoProgresso([ProgressFileName, 2]);
  end;
end;



function TCtrlBuscaCaP.ValidaCdsDocumento: Boolean;
var
  bErro : Boolean;
begin
  // Mostra form de progresso
  DoProgresso([ProgressFileName, 0, 0, cdsDocumento.RecordCount, 0, 'Validando dados contábeis...']);

  // -----------------------------------------------------------------------------------------------

  Result := True;

  try
    cdsDocumento.First;
    while not(cdsDocumento.EOF) do
    begin
      // -------------------------------------------------------------------------------------------

      MessageInfo := '';

      if cdsDocumento.FieldByName('CODIMPOSTO').AsInteger <> 0 then
      begin
        bErro := False;

        if ( trim(cdsDocumento.FieldByName('PLACONTA').AsString) = '' ) or
           ( cdsDocumento.FieldByName('PLANO').AsInteger <= 0 ) then
        begin
          bErro   := True;
          Result  := False;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' +
          'Plano de Contas ou Conta Contábil não indicados';
        end;

        if trim(cdsDocumento.FieldByName('CODTIPRECDES').AsString) = '' then
        begin
          bErro   := True;
          Result  := False;

          MessageInfo :=
          CtrlObjIrrf.CompletaInicio(FormatFloat('#0', cdsDocumento.FieldByName('NODOCUMENTO').AsFloat), ' ', 10)    + ' ' +
          FormatDateTime('DD/MM/YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime)                             + '  ' +
          CtrlObjIrrf.CompletaFim(cdsDocumento.FieldByName('NOMEIMPOSTO').AsString, ' ', 16)                          + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALBASE').AsCurrency), ' ', 14) + ' ' +
          CtrlObjIrrf.CompletaInicio(FormatFloat('#,#0.00', cdsDocumento.FieldByName('VALOR').AsCurrency), ' ', 14)   + ' ' +
          'Tipo de Desembolso não preenchido';
        end;

      end;  // if cdsDocumento.FieldByName('CODIMPOSTO').AsInteger <> 0

      DoProgresso([ProgressFileName, 1, 0, 0, cdsDocumento.RecNo, '', ord(bErro) + 2]);
      cdsDocumento.Next;
    end;

  finally
    // Esconde form de progresso
    DoProgresso([ProgressFileName, 2]);
  end;
end;










//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//  Funções para montar os SQLs de busca
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

function TCtrlBuscaCaP.MontaSQLBuscaImposto(const piCodImposto  : Integer;
                                            const psNomeImposto : string;
                                            const psCampoValor  : string;
                                            const psNatureza    : string
                                           ): string;
var
  sSQL      : string;
  sDataIni  : string;
  sDataFim  : string;
  bDataLanc : Boolean;
begin
  sDataIni  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataIni)) + ', ''DD/MM/YYYY'')';
  sDataFim  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataFim)) + ', ''DD/MM/YYYY'')';

  bDataLanc := PagLanc = 'L';
  sSQL      := '';

  // -----------------------------------------------------------------------------------------------
  // 1ª parte - alteradores lançados manualmente em documentos englobados: não possuem ImpostoRetido
  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  '-- ' + QuotedStr(psNomeImposto) + ': Alteradores Manuais (documentos englobados) ------------------------------------------' + #13 +
  'SELECT '                                                                                         + #13 +
  '  DOC.IDMODULO, '+ #13+ //Darivaldo Alencar  -- 270178 ppm:1352233
  '  DOC.DATAVENCTO, '+ #13+  //edilaine - SIG91336
  '  DOC.DATAEMISSAO, '+ #13+  //RAfael -SIG92479
  '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DOC.IDPESSOA, '                    + #13 +
  '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO, '                                                   + #13 +
  '  LDC.CODDOCUMENTO, LDC.NUMLANCTO, DECODE(DEBCRE,''D'',LDC.VALOR,-LDC.VALOR) AS VALOR, LDC.CODALTERADOR, '    + #13 + //SOL 179844 KTN 1660740
  '  TAL.PLACONTA, TAL.PLANO AS PLANO, '                                                            + #13 +
  '  BAS.VALOR AS VALBASE, '                                                                        + #13 +


  '  NVL(TAL.CODTIPRECDES, NVL(NTR.CODTIPRECDES, PIR.CODTIPRECDES)) AS CODTIPRECDES, '              + #13;

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (bDataLanc) or (piCodImposto in [2, 15])  then
  //if (bDataLanc) or (piCodImposto in [1, 2, 15])  then
  //Cássio Rovaroto - SIG nº 75760 - Fim
    //Cássio Rovaroto - SIG nº 88333 - Fim
  if (bDataLanc) or (piCodImposto in [1, 2, 15])  then
    //Cássio Rovaroto - SIG nº 88829 - Fim
    sSQL := sSQL +
  '  BAS.DATALANCTO, '                                                                              + #13
  else sSQL := sSQL +
  '  PAG.DATALANCTO, '                                                                              + #13;

  sSQL := sSQL +
  '  0 AS IDLANCIRRF, '                                                                             + #13 +
  '  TAL.CODNATUREZA, '                                                                             + #13 +
  '  ' + FormatFloat('#0', piCodImposto) + ' AS CODIMPOSTO, '                                       + #13 +
  '  ' + QuotedStr(psNomeImposto) + ' AS NOMEIMPOSTO, '                                             + #13 +
  '  PIR.CCUSTOBUSCACAP AS CCUSTOCAP, '                                                             + #13 +
  '  NVL(PIR.CODIGOGPS, 0) AS CODIGOGPS '                                                           + #13 +

  'FROM '                                                                                           + #13 +
  '  PARAMIRRF      PIR, '                                                                          + #13 +
  '  LANCTODOCUM    LDC, '                                                                          + #13 +
  '  DOCUMENTO      DOC, '                                                                          + #13 +
  '  PESSOA         PES, '                                                                          + #13 +
  '  NATURENDIMENTO NTR, '                                                                          + #13 +
  '  TIPOALTERADOR  TAL, '                                                                          + #13;

  // -----------------------------------------------------------------------------------------------
  // Se não for por data de lançamento, busca pela data do lançamento de baixa

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (not(bDataLanc)) and (not (piCodImposto in [2, 15])) then
  //if (not(bDataLanc)) and (not (piCodImposto in [1, 2, 15])) then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
  if (not(bDataLanc)) and (not (piCodImposto in [1, 2, 15])) then
  //Cássio Rovaroto - SIG nº 88829 - Fim
  begin
    sSQL := sSQL +
    '  ( '                                                                                            + #13 +
    '  SELECT '                                                                                       + #13 +
    '     MIN(L.NUMLANCTO), MIN(L.DATALANCTO) AS DATALANCTO, D.NUMFATURA '                            + #13 +
    '  FROM '                                                                                         + #13 +
    '     LANCTODOCUM L, '                                                                            + #13 +
    '     DOCUMENTO   D  '                                                                            + #13 +
    ' WHERE L.CODDOCUMENTO = D.CODDOCUMENTO AND '                                                     + #13 + //Cássio Rovaroto - SIG nº 88333
    '         LTRIM(RTRIM(L.OPERACAO)) = ''5'' '                                                      + #13 +
    '    AND LTRIM(RTRIM(D.OPERACAO)) = ''3'' '                                                       + #13 +
    '    AND L.DATALANCTO             BETWEEN ' + sDataIni + ' AND ' + sDataFim                       + #13;

    if Documento > 0 then sSQL := sSQL +
    '    AND D.NUMFATURA              = ( '                                                           + #13 +
    '                                   SELECT '                                                      + #13 +
    '                                     NUMFATURA '                                                 + #13 +
    '                                   FROM '                                                        + #13 +
    '                                     DOCUMENTO '                                                 + #13 +
    '                                   WHERE '                                                       + #13 +
    '                                     CODDOCUMENTO = ' + FormatFloat('#0', Documento)             + #13 +
    '                                   ) '                                                           + #13 +
    '    AND L.ESTORNO                IS NULL '                                                       + #13 +
    '    AND L.CODDOCUMENTO           = D.CODDOCUMENTO '                                              + #13 ;

    sSQL := sSQL +
    '  GROUP BY '                                                                                     + #13 +
    '    D.NUMFATURA '                                                                                + #13 +
    '  ) PAG, '                                                                                       + #13;
  end;
  // -----------------------------------------------------------------------------------------------
  // Busca o valor-base do imposto, ie, o lançamento original do documento

  sSQL := sSQL +
  '  ( '                                                                                            + #13 +
  '  SELECT '                                                                                       + #13 +
  '     L.CODDOCUMENTO, L.VALOR, L.DATALANCTO '                                                           + #13 +
  '  FROM '                                                                                         + #13 +
  '     LANCTODOCUM L JOIN DOCUMENTO D ON L.CODDOCUMENTO = D.CODDOCUMENTO  '                                                                               + #13 +
  '  WHERE '                                                                                        + #13 +
  '        LTRIM(RTRIM(L.OPERACAO)) = ''1'' '                                                         + #13;

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (bDataLanc) or (piCodImposto in [1, 2, 15]) then
  //if (bDataLanc) or (piCodImposto in [2, 15]) then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
  //Ewerton Beltramini SIG94703 Inicio...
  if (bDataLanc) or (piCodImposto in [1, 15]) then
  begin
  //Cássio Rovaroto - SIG nº 88829 - Fim
  //Cássio rovaroto - SIG nº 127010 - Início
  if (psNatureza = '0588') or (psNatureza = '8045') then
    sSQL := sSQL +
    '    AND L.DATALANCTO BETWEEN ' + sDataIni + ' AND ' + sDataFim   + #13
  else
    sSQL := sSQL +
    '    AND D.DATAVENCTO BETWEEN ' + sDataIni + ' AND ' + sDataFim   + #13; //TAES - SIG91336     //Rafael - SIG92479
  //  sSQL := sSQL +
  //'    AND ' + IFF(psNatureza = '0588', 'L.DATALANCTO', 'D.DATAVENCTO') + ' BETWEEN ' + sDataIni + ' AND ' + sDataFim   + #13; //TAES - SIG91336     //Rafael - SIG92479
  //Cássio rovaroto - SIG nº 127010 - Fim
  end
  else  if (piCodImposto in [2]) then
  begin
    sSQL := sSQL +
  '    AND ' + IFF(psNatureza = '0588', 'L.DATALANCTO', 'D.DATAEMISSAO') + ' BETWEEN ' + sDataIni + ' AND ' + sDataFim   + #13; //TAES - SIG91336     //Rafael - SIG92479
  end;
  //Ewerton Beltramini SIG94703 Fim ...

  if Documento > 0 then sSQL := sSQL +
  '    AND L.CODDOCUMENTO           = ' + FormatFloat('#0', Documento)                                + #13;

  sSQL := sSQL +
  '    AND L.ESTORNO                IS NULL '                                                         + #13 +
  '  ) BAS '                                                                                        + #13 +

  // -----------------------------------------------------------------------------------------------

  'WHERE '                                                                                          + #13 +
  '      LTRIM(RTRIM(DOC.OPERACAO)) = ''1'' '                                                       + #13 +
  '  AND LDC.CODALTERADOR   = TAL.CODALTERADOR '                                                    + #13 +
  '  AND PIR.IDPESSOA       = ' + IntToStr(EmpresaProp)                                             + #13 +
  '  AND LDC.CODDOCUMENTO   = BAS.CODDOCUMENTO '                                                    + #13 +
  '  AND LDC.CODDOCUMENTO   = DOC.CODDOCUMENTO '                                                    + #13 +
  '  AND DOC.IDFORCLI       = PES.IDPESSOA '                                                        + #13 +
  '  AND LDC.ESTORNO        IS NULL '                                                               + #13 +
  '  AND TAL.CODNATUREZA    = NTR.CODNATUREZA(+) '                                                  + #13 +

  '  AND TAL.CODALTERADOR IN ( '                                                                    + #13 +
  '                          SELECT  AXI.CODALTERADOR  '                                            + #13 +
  '                          FROM    ALTXIMPOSTO  AXI '                                             + #13 +
  '                          WHERE   AXI.CODIMPOSTO = ' + IntToStr(piCodImposto)                    + #13 +
  '                          ) '                                                                    + #13;

  // -----------------------------------------------------------------------------------------------

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (bDataLanc) or (piCodImposto in [2, 15]) then
  //if (bDataLanc) or (piCodImposto in [1, 2, 15]) then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
  //Ewerton Beltramini - SIG94703 - Inicio...
  if (bDataLanc) or (piCodImposto in [1, 15]) then
  begin
  //Cássio Rovaroto - SIG nº 88829 - Fim
  //Cássio rovaroto - SIG nº 127010 - Início
  if (psNatureza = '0588') or (psNatureza = '8045') then
    sSQL := sSQL +
    '  AND LDC.DATALANCTO BETWEEN ' + sDataIni + ' AND ' + sDataFim  + #13
  else //TAES - SIG91336      //Rafael - SIG 92479
    sSQL := sSQL +
    '  AND DOC.DATAVENCTO BETWEEN ' + sDataIni + ' AND ' + sDataFim  + #13; //TAES - SIG91336      //Rafael - SIG 92479
  //  sSQL := sSQL +
  //'  AND ' + IFF(psNatureza = '0588', 'LDC.DATALANCTO', 'DOC.DATAVENCTO') + ' BETWEEN ' + sDataIni + ' AND ' + sDataFim  + #13; //TAES - SIG91336      //Rafael - SIG 92479
  end
  else  if (piCodImposto in [2]) then
  begin
    sSQL := sSQL +
  '    AND ' + IFF(psNatureza = '0588', 'L.DATALANCTO', 'DOC.DATAEMISSAO') + ' BETWEEN ' + sDataIni + ' AND ' + sDataFim   + #13; //TAES - SIG91336     //Rafael - SIG92479
  end
  //Ewerton Beltramini - SIG94703 - Fim
  else sSQL := sSQL +
  '  AND DOC.NUMFATURA      = PAG.NUMFATURA '                                                       + #13;
  // -----------------------------------------------------------------------------------------------

  if Favorecido > 0 then sSQL := sSQL +
  '  AND DOC.IDFORCLI       = ' + FormatFloat('#0', Favorecido)                                     + #13;

  if Documento > 0 then sSQL := sSQL +
  '  AND DOC.CODDOCUMENTO   = ' + FormatFloat('#0', Documento)                                      + #13;

  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 88220 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
//  if piCodImposto =  1 then
//    sSQL := sSQL + ' AND DOC.NFSDATAEMISSAO >= ' + sDataIni                                         + #13 +
//                   ' AND DOC.NFSDATAEMISSAO <= ' + sDataFim                                         + #13;
//	sSQL := sSQL + ' AND ((DOC.NFSDATAEMISSAO >= ' + sDataIni + ' AND DOC.NFSDATAEMISSAO <= ' + sDataFim + ') OR ' + #13 +
//                 '      (DOC.DATAVENCTO >= ' + sDataIni + ' AND DOC.DATAVENCTO <= ' + sDataFim + '))' ;
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88220 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim

  // -----------------------------------------------------------------------------------------------

  // só busca alteradores que não estejam relacionados na LancIRRF
  sSQL := sSQL +
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDLANCIRRF '                                                            + #13 +
  '                 FROM    LANCIRRF '                                                              + #13 +
  '                 WHERE   CODDOCUMENTO = LDC.CODDOCUMENTO '                                       + #13 +
  '                    AND  NVL(' + psCampoValor + ', 0)  <> 0 '                                    + #13 +
  '                 ) '                                                                             + #13;

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if piCodImposto in [2, 15] then
  //if piCodImposto in [1, 2, 15] then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
  if piCodImposto in [1, 2, 15] then
  //Cássio Rovaroto - SIG nº 88829 - Fim
    sSQL := sSQL +
    '  AND LDC.CODDOCINSS IS NULL '                                                                 + #13;

  // nem na ImpostoRetido - caracterizando lançamentos manuais
  sSQL := sSQL +
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDIMPOSTORETIDO '                                                       + #13 +
  '                 FROM    IMPOSTORETIDO '                                                         + #13 +
  '                 WHERE   CODDOCUMENTO = LDC.CODDOCUMENTO '                                       + #13 +
  '                    AND  NUMLANCTO    = LDC.NUMLANCTO '                                          + #13 +
  '                 ) '                                                                             + #13;

  if trim(psNatureza) <> '' then
    sSQL := sSQL + '  AND TAL.CODNATUREZA    = ' + QuotedStr(psNatureza)                            + #13;

  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  '-----------------------------------------------------------------------------------------------' + #13 +
  'UNION '                                                                                          + #13;


  // -----------------------------------------------------------------------------------------------
  // 2ª parte - alteradores lançados manualmente em documentos normais: não possuem ImpostoRetido
  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  '-- ' + QuotedStr(psNomeImposto) + ': Alteradores Manuais (documentos efetivos) --------------------------------------------' + #13 +
  'SELECT '                                                                                         + #13 +

  '  DOC.IDMODULO, '+#13+//Darivaldo Alencar  -- 270178 ppm:1352233
  '  DOC.DATAVENCTO, '+ #13+  //edilaine - SIG91336
  '  DOC.DATAEMISSAO, '+ #13+  //RAfael -SIG92479
  '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DOC.IDPESSOA, '                    + #13 +
  '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO, '                                                   + #13 +
  '  LDC.CODDOCUMENTO, LDC.NUMLANCTO, DECODE(DEBCRE,''D'',LDC.VALOR,-LDC.VALOR) AS VALOR, LDC.CODALTERADOR, '                                + #13 + // SOL 179844 KTN 1660740
  '  TAL.PLACONTA, TAL.PLANO AS PLANO, '                                                            + #13 +
  '  BAS.VALOR AS VALBASE, '                                                                        + #13 +

  '  NVL(TAL.CODTIPRECDES, NVL(NTR.CODTIPRECDES, PIR.CODTIPRECDES)) AS CODTIPRECDES, '              + #13;

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (bDataLanc) or (piCodImposto in [2, 15]) then
  //if (bDataLanc) or (piCodImposto in [1, 2, 15]) then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
  if (bDataLanc) or (piCodImposto in [1, 2, 15]) then
  //Cássio Rovaroto - SIG nº 88829 - Fim
    //Cássio Rovaroto - SIG nº 90055 - Início
    if (piCodImposto = 1) and (psNatureza = '1708') then
        sSQL := sSQL +  ' DECODE(TAL.CODNATUREZA, ''1708'', DOC.NFSDATAEMISSAO, BAS.DATALANCTO) AS DATALANCTO, '
    else
        sSQL := sSQL + '  BAS.DATALANCTO, '                                                                              + #13
  //Cássio Rovaroto - SIG nº 90055 - Início
  else sSQL := sSQL +
  '  PAG.DATALANCTO, '                                                                              + #13;

  sSQL := sSQL +
  '  0 AS IDLANCIRRF, '                                                                             + #13 +
  '  TAL.CODNATUREZA, '                                                                             + #13 +
  '  ' + FormatFloat('#0', piCodImposto) + ' AS CODIMPOSTO, '                                       + #13 +
  '  ' + QuotedStr(psNomeImposto) + ' AS NOMEIMPOSTO, '                                             + #13 +
  '  PIR.CCUSTOBUSCACAP AS CCUSTOCAP, '                                                             + #13 +
  '  NVL(PIR.CODIGOGPS, 0) AS CODIGOGPS '                                                           + #13 +

  'FROM '                                                                                           + #13 +
  '  PARAMIRRF      PIR, '                                                                          + #13 +
  '  LANCTODOCUM    LDC, '                                                                          + #13 +
  '  DOCUMENTO      DOC, '                                                                          + #13 +
  '  PESSOA         PES, '                                                                          + #13 +
  '  NATURENDIMENTO NTR, '                                                                          + #13 +
  '  TIPOALTERADOR  TAL, '                                                                          + #13;

  // -----------------------------------------------------------------------------------------------
  // Se não for por data de lançamento, busca pela data do lançamento de baixa

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (not(bDataLanc)) and (not (piCodImposto in [2, 15])) then
  //if (not(bDataLanc)) and (not (piCodImposto in [1, 2, 15])) then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
  if (not(bDataLanc)) and (not (piCodImposto in [1, 2, 15])) then
  //Cássio Rovaroto - SIG nº 88829 - Fim
  begin
    sSQL := sSQL +
    '  ( '                                                                                            + #13 +
    '  SELECT '                                                                                       + #13 +
    '     MIN(NUMLANCTO), MIN(DATALANCTO) AS DATALANCTO, CODDOCUMENTO '                               + #13 +
    '  FROM '                                                                                         + #13 +
    '     LANCTODOCUM '                                                                               + #13 +
    ' WHERE '                                                                                         + #13 + //Cássio Rovaroto - SIG nº 88333
    '        LTRIM(RTRIM(OPERACAO)) = ''5'' '                                                         + #13 +
    '   AND DATALANCTO             BETWEEN ' + sDataIni + ' AND ' + sDataFim                          + #13;

    if Documento > 0 then sSQL := sSQL +
    '    AND CODDOCUMENTO           = ' + FormatFloat('#0', Documento)                                + #13;

    sSQL := sSQL +
    '    AND ESTORNO                IS NULL '                                                         + #13 +
    '  GROUP BY '                                                                                     + #13 +
    '    CODDOCUMENTO '                                                                               + #13 +
    '  ) PAG, '                                                                                       + #13;
  end;

  // -----------------------------------------------------------------------------------------------
  // Busca o valor-base do imposto, ie, o lançamento original do documento
    sSQL := sSQL +
    '  ( '                                                                                            + #13 +
    '  SELECT '                                                                                       + #13 +
    '     L.CODDOCUMENTO, L.VALOR, L.DATALANCTO '                                                           + #13 +
    '  FROM '                                                                                         + #13 +
    '     LANCTODOCUM L JOIN DOCUMENTO D ON L.CODDOCUMENTO = D.CODDOCUMENTO '                          + #13 +
    '  WHERE '                                                                                        + #13 +
    '        LTRIM(RTRIM(L.OPERACAO)) IN (''2'', ''3'') '                                               + #13 ;
   //Cássio Rovaroto - SIG nº 88829 - Início
   //Ewerton Beltramini - SIG94703 - Inicio...
    if (bDataLanc) or (piCodImposto in [15]) or ((piCodImposto = 1) and (psNatureza <> '1708')) then
    begin
        // sSQL := sSQL +
     //    '    AND ' + IFF(psNatureza = '0588', 'L.DATALANCTO', 'D.DATAVENCTO') + ' BETWEEN ' + sDataIni + ' AND ' + sDataFim; //TAES - SIG91336   //Rafael -SIG 92479
     //Cássio Rovaroto - SIG nº 127010 - Início
     if (psNatureza = '0588') then
      sSQL := sSQL +   '    AND D.DATAVENCTO  BETWEEN ' + sDataIni + ' AND ' + sDataFim
     else
      if (psNatureza = '1708') or (psNatureza = '8045') then
        sSQL := sSQL +   '    AND D.DATAEMISSAO  BETWEEN ' + sDataIni + ' AND ' + sDataFim
      else
        sSQL := sSQL +   '    AND L.DATALANCTO  BETWEEN ' + sDataIni + ' AND ' + sDataFim;
        //   '    AND ' + IFF(psNatureza = '0588', 'D.DATAVENCTO', IFF(psNatureza = '1708','D.DATAEMISSAO', 'L.DATALANCTO')) + ' BETWEEN ' + sDataIni + ' AND ' + sDataFim; //SIG97241 Tiago Von
    end
    else  if (piCodImposto in [2]) then
    begin
         sSQL := sSQL +
        '    AND ' + IFF(psNatureza = '0588', 'L.DATALANCTO', 'D.DATAEMISSAO') + ' BETWEEN ' + sDataIni + ' AND ' + sDataFim   + #13; //TAES - SIG91336     //Rafael - SIG92479
    end;
  //Ewerton Beltramini - SIG94703 - Fim.

    if (piCodImposto = 1) and (psNatureza = '1708') then
      sSQL := sSQL +
      // Alterado por FHBS - 16/09/2019 - SIG91756
      '    AND D.CODDOCUMENTO IN (SELECT CODDOCUMENTO FROM DOCUMENTO WHERE NFSDATAEMISSAO BETWEEN ' + sDataIni +  ' AND ' + sDataFim + ' )';
      //'    AND CODDOCUMENTO IN (SELECT CODDOCUMENTO FROM DOCUMENTO WHERE NFSDATAEMISSAO BETWEEN ' + sDataIni +  ' AND ' + sDataFim + ' )';
      // Fim - Alterado por FHBS - 16/09/2019 - SIG91756

  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (bDataLanc) or (piCodImposto in [2, 15]) then
  //if (bDataLanc) or (piCodImposto in [2, 15]) or ((piCodImposto = 1) and (psNatureza = '1708')) then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
//  if (bDataLanc) or (piCodImposto in [2, 15]) or ((piCodImposto = 1) and (psNatureza = '1708')) then
  //Cássio Rovaroto - SIG nº 88829 - Fim

  if Documento > 0 then sSQL := sSQL +
  // Alterado por FHBS - 16/09/2019 - SIG91756
  '    AND D.CODDOCUMENTO           = ' + FormatFloat('#0', Documento)                                + #13;
  //'    AND CODDOCUMENTO           = ' + FormatFloat('#0', Documento)                                + #13;
  // Fim - Alterado por FHBS - 16/09/2019 - SIG91756

  sSQL := sSQL +
  // Alterado por FHBS - 16/09/2019 - SIG91756
  '    AND L.ESTORNO                IS NULL '                                                         + #13 +
  //'    AND ESTORNO                IS NULL '                                                         + #13 +
  // Fim - Alterado por FHBS - 16/09/2019 - SIG91756
  '  ) BAS '                                                                                        + #13 +

  // -----------------------------------------------------------------------------------------------

  'WHERE '                                                                                          + #13 +
  '      LTRIM(RTRIM(DOC.OPERACAO)) IN (''2'', ''3'') '                                             + #13 +
  '  AND LDC.CODALTERADOR   = TAL.CODALTERADOR '                                                    + #13 +
  '  AND PIR.IDPESSOA       = ' + IntToStr(EmpresaProp)                                             + #13 +
  '  AND LDC.CODDOCUMENTO   = BAS.CODDOCUMENTO '                                                    + #13 +
  '  AND LDC.CODDOCUMENTO   = DOC.CODDOCUMENTO '                                                    + #13 +
  '  AND DOC.IDFORCLI       = PES.IDPESSOA '                                                        + #13 +
  '  AND LDC.ESTORNO        IS NULL '                                                               + #13 +
  '  AND TAL.CODNATUREZA    = NTR.CODNATUREZA(+) '                                                  + #13 +

  '  AND TAL.CODALTERADOR IN ( '                                                                    + #13 +
  '                          SELECT  AXI.CODALTERADOR  '                                            + #13 +
  '                          FROM    ALTXIMPOSTO  AXI '                                             + #13 +
  '                          WHERE   AXI.CODIMPOSTO = ' + IntToStr(piCodImposto)                    + #13 +
  '                          ) '                                                                    + #13;

  // -----------------------------------------------------------------------------------------------

  //Cássio Rovaroto - SIG nº 88829 - Início
  //Cássio Rovaroto - SIG nº 88333 - Início
  //if (bDataLanc) or (piCodImposto in [2, 15]) then
  //Cássio Rovaroto - SIG nº 75760 - Início
  //if (bDataLanc) or (piCodImposto in [1, 2, 15]) then
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim
  if (bDataLanc) or (piCodImposto in [2, 15]) then
  //Cássio Rovaroto - SIG nº 88829 - Fim
    sSQL := sSQL +
  '  AND LDC.DATALANCTO     BETWEEN ' + sDataIni + ' AND ' + sDataFim                               + #13
  else
    if ((piCodImposto = 1)  and ((psNatureza = '1708') or (psNatureza = '8045'))) then
      sSQL := sSQL +
      '  AND (LDC.DATALANCTO BETWEEN ' + sDataIni + ' AND ' + sDataFim + ')' +#13 // OR DOC.DATAVENCTO  BETWEEN ' + sDataIni + ' AND ' + sDataFim +  ')' + #13          //Rafael SIG92479
    else
      if (not(bDataLanc)) and (not (piCodImposto in [1, 2, 15])) then    //Rafael -SIG 92479
        sSQL := sSQL +
        '  AND DOC.CODDOCUMENTO   = PAG.CODDOCUMENTO '                                                    + #13; //TAES - SIG91190         //Rafael -SIG 92479

  // -----------------------------------------------------------------------------------------------

  if Favorecido > 0 then sSQL := sSQL +
  '  AND DOC.IDFORCLI       = ' + FormatFloat('#0', Favorecido)                                     + #13;

  if Documento > 0 then sSQL := sSQL +
  '  AND DOC.CODDOCUMENTO   = ' + FormatFloat('#0', Documento)                                      + #13;

  //Cássio Rovaroto - SIG nº 88333 - Início
  //Cássio Rovaroto - SIG nº 88220 - Início  
  //Cássio Rovaroto - SIG nº 75760 - Início
//  if piCodImposto =  1 then
//    sSQL := sSQL + ' AND DOC.NFSDATAEMISSAO >= ' + sDataIni                                         + #13 +
//                   ' AND DOC.NFSDATAEMISSAO <= ' + sDataFim                                         + #13;
//	sSQL := sSQL + ' AND ((DOC.NFSDATAEMISSAO >= ' + sDataIni + ' AND DOC.NFSDATAEMISSAO <= ' + sDataFim + ') OR ' + #13 +
//                 '      (DOC.DATAVENCTO >= ' + sDataIni + ' AND DOC.DATAVENCTO <= ' + sDataFim + '))' ;
  //Cássio Rovaroto - SIG nº 75760 - Fim
  //Cássio Rovaroto - SIG nº 88220 - Fim
  //Cássio Rovaroto - SIG nº 88333 - Fim

  // -----------------------------------------------------------------------------------------------

  // só busca alteradores que não estejam relacionados na LancIRRF
  sSQL := sSQL +
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDLANCIRRF '                                                            + #13 +
  '                 FROM    LANCIRRF '                                                              + #13 +
  '                 WHERE   CODDOCUMENTO = LDC.CODDOCUMENTO '                                       + #13 +
  '                    AND  NVL(' + psCampoValor + ', 0)  <> 0 '                                    + #13 +
  '                 ) '                                                                             + #13;

  if piCodImposto in [1, 2, 15] then
    sSQL := sSQL +
    '  AND LDC.CODDOCINSS IS NULL '                                                                 + #13;

  
  // nem na ImpostoRetido - caracterizando lançamentos manuais
  sSQL := sSQL +
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDIMPOSTORETIDO '                                                       + #13 +
  '                 FROM    IMPOSTORETIDO '                                                         + #13 +
  '                 WHERE   CODDOCUMENTO = LDC.CODDOCUMENTO '                                       + #13 +
  '                    AND  NUMLANCTO    = LDC.NUMLANCTO '                                          + #13 +
  '                 ) '                                                                             + #13;

  if trim(psNatureza) <> '' then
    sSQL := sSQL + '  AND TAL.CODNATUREZA    = ' + QuotedStr(psNatureza)                            + #13;

  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  '-----------------------------------------------------------------------------------------------' + #13 +
  'UNION '                                                                                          + #13 +

  // -----------------------------------------------------------------------------------------------
  // 3ª parte - Alteradores + impostos (apenas calcular) que estão (ambos) na ImpostoRetido
  // -----------------------------------------------------------------------------------------------

  '-- ' + QuotedStr(psNomeImposto) + ': Imposto Retido -----------------------------------------------------------------------' + #13 +
  'SELECT '                                                                                         + #13 +

  '  DOC.IDMODULO, '+ #13+   //Darivaldo Alencar  -- 270178 ppm:1352233
  '  DOC.DATAVENCTO, '+ #13+  //edilaine - SIG91336
  '  DOC.DATAEMISSAO, '+ #13+  //Rafael -SIG92479
  '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DOC.IDPESSOA, '                    + #13 +
  '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO, '                                                   + #13 +
  '  DOC.CODDOCUMENTO, 0 AS NUMLANCTO, IRT.VLRRETIDO AS VALOR, '                                    + #13 +
  '  NVL(TAL.CODALTERADOR, -1) AS CODALTERADOR, '                                                   + #13 +
  '  NVL(TAL.PLACONTA, TCA.PLACONTA) AS PLACONTA, '                                                 + #13 +
  '  NVL(TAL.PLANO, TCA.PLANO) AS PLANO, '                                                          + #13 +
  '  IRT.VLRBASE AS VALBASE, '                                                                      + #13 +

  // Embora não necessário, mas para dar maior flexibilidade, em função do pedido da CBS e do que
  // foi conversado, inclusive com o Alex
  '  NVL(TAG.CODTIPRECDES, NVL(TAL.CODTIPRECDES, NVL(NTR.CODTIPRECDES, PIR.CODTIPRECDES))) AS CODTIPRECDES, '   + #13 +

  '  IRT.DATARETENCAO AS DATALANCTO, '                                                              + #13 +
  '  0 AS IDLANCIRRF, '                                                                             + #13 +
  '  TAG.CODNATUREZA, '                                                                             + #13 +
  '  TAG.CODIMPOSTO, '                                                                              + #13 +
  '  ' + QuotedStr(psNomeImposto) + ' AS NOMEIMPOSTO, '                                             + #13 +
  '  PIR.CCUSTOBUSCACAP AS CCUSTOCAP, '                                                             + #13 +
  '  NVL(TAG.CODIGOGPS, NVL(PIR.CODIGOGPS, 0)) AS CODIGOGPS '                                       + #13 +

  'FROM '                                                                                           + #13 +
  '  PARAMIRRF          PIR, '                                                                      + #13 +
  '  TIPOAGRE           TAG, '                                                                      + #13 +

  '  ( '                                                                                            + #13 +
  '  SELECT '                                                                                       + #13 +
  '    CODTIPOCUSTAGREG, MIN(PLANO) AS PLANO, MIN(PLACONTA) AS PLACONTA '                           + #13 +
  '  FROM '                                                                                         + #13 +
  '    ( '                                                                                          + #13 +
  '    SELECT '                                                                                     + #13 +
  '      TAC.CODTIPOCUSTAGREG, TAC.PLANO, TAC.PLACONTA '                                            + #13 +
  '    FROM '                                                                                       + #13 +
  '      TIPCUSTAGREGCONTA  TAC, '                                                                  + #13 +
  '      TIPOAGRE           TGE  '                                                                  + #13 +
  '    WHERE '                                                                                      + #13 +
  '          TAC.DEBCRE           = ''C'' '                                                         + #13 +
  '      AND TGE.CODIMPOSTO       = ' + IntToStr(piCodImposto)                                      + #13 +
  '      AND TAC.CODTIPOCUSTAGREG = TGE.CODTIPOCUSTAGREG '                                          + #13 +
  '    ) '                                                                                          + #13 +
  '  GROUP BY '                                                                                     + #13 +
  '    CODTIPOCUSTAGREG '                                                                           + #13 +
  '  ) TCA, '                                                                                       + #13 +

  '  IMPOSTORETIDO      IRT, '                                                                      + #13 +
  '  TIPOALTERADOR      TAL, '                                                                      + #13 +
  '  NATURENDIMENTO     NTR, '                                                                      + #13 +
  '  PESSOA             PES, '                                                                      + #13 +
  '  DOCUMENTO          DOC  '                                                                      + #13 +

  'WHERE '                                                                                          + #13 +
  '      TAG.CODIMPOSTO         = ' + IntToStr(piCodImposto)                                        + #13 +
  '  AND NVL(IRT.VLRRETIDO, 0) <> 0 '                                                               + #13 +
  '  AND NVL(IRT.FLGESTORNADO, ''N'') <> ''S'' '                                                    + #13 +
  '  AND PIR.IDPESSOA           = ' + IntToStr(EmpresaProp)                                         + #13 +
  '  AND IRT.IDPESSOA           = ' + IntToStr(EmpresaProp)                                         + #13 +
  '  AND IRT.DATARETENCAO       BETWEEN ' + sDataIni + ' AND ' + sDataFim                           + #13 +
  '  AND TAG.CODTIPOCUSTAGREG   = TCA.CODTIPOCUSTAGREG(+) '                                         + #13 +
  '  AND TAG.CODTIPOCUSTAGREG   = IRT.CODTIPOCUSTAGREG '                                            + #13 +
  '  AND TAG.CODALTERADOR       = TAL.CODALTERADOR(+) '                                             + #13 +
  '  AND TAG.CODNATUREZA        = NTR.CODNATUREZA(+) '                                              + #13 +
  '  AND IRT.IDFORCLI           = PES.IDPESSOA '                                                    + #13 +
  '  AND IRT.CODDOCUMENTO       = DOC.CODDOCUMENTO '                                                + #13;

  if trim(psNatureza) <> '' then
    sSQL := sSQL + '  AND TAG.CODNATUREZA        = ' + QuotedStr(psNatureza)                        + #13;

  // -----------------------------------------------------------------------------------------------

  if Favorecido > 0 then sSQL := sSQL +
  '  AND DOC.IDFORCLI       = ' + FormatFloat('#0', Favorecido)                                     + #13;

  if Documento > 0 then sSQL := sSQL +
  '  AND DOC.CODDOCUMENTO   = ' + FormatFloat('#0', Documento)                                      + #13;

  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDLANCIRRF '                                                            + #13 +
  '                 FROM    LANCIRRF '                                                              + #13 +
  '                 WHERE   IDIMPOSTORETIDO = IRT.IDIMPOSTORETIDO '                                 + #13 +
  '                 ) '                                                                             + #13;

  sSQL := sSQL +
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDLANCIRRF '                                                            + #13 +
  '                 FROM    LANCIRRF '                                                              + #13 +
  '                 WHERE   CODDOCUMENTO = IRT.CODDOCUMENTO '                                       + #13 +
  '                    AND  NVL(' + psCampoValor + ', 0)  <> 0 '                                    + #13 +
  '                 ) '                                                                             + #13 +

  '-----------------------------------------------------------------------------------------------' + #13;

  // -----------------------------------------------------------------------------------------------

  Result := sSQL;
end;



function TCtrlBuscaCaP.MontaSQLBuscaIR: string;
begin
  Result := MontaSQLBuscaImposto(1, 'IRRF', 'VLRIRRF', NatuIR);
end;



function TCtrlBuscaCaP.MontaSQLBuscaINSS: string;
begin
  Result := MontaSQLBuscaImposto(2, 'INSS', 'VLRINSS', NatuINSS);
end;



function TCtrlBuscaCaP.MontaSQLBuscaPIS: string;
begin
  Result :=
  MontaSQLBuscaImposto(16, 'PIS',             'VLRPIS',       NatuPIS)  + 'UNION' + #13 +
  MontaSQLBuscaImposto(17, 'COFINS',          'VLRCOFINS',    NatuPIS)  + 'UNION' + #13 +
  MontaSQLBuscaImposto(18, 'CSLL',            'VLRCSLL',      NatuPIS)  + 'UNION' + #13 +
  MontaSQLBuscaImposto(19, 'CSLL/PIS/COFINS', 'VLRCSCOFPIS',  NatuPIS);
end;



function TCtrlBuscaCaP.MontaSQLBuscaISS: string;
begin
  Result := MontaSQLBuscaImposto(15, 'ISS', 'VLRISS', NatuISS);
end;



function TCtrlBuscaCaP.MontaSQLBuscaRend: string;
var
  sSQL      : string;
  sDataIni  : string;
  sDataFim  : string;
  bDataLanc : Boolean;
begin
  sDataIni  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataIni)) + ', ''DD/MM/YYYY'')';
  sDataFim  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataFim)) + ', ''DD/MM/YYYY'')';

  bDataLanc := PagLanc = 'L';

  // -----------------------------------------------------------------------------------------------
  // 3ª parte - Rendimentos sem imposto: apenas para efeito de informe
  // -----------------------------------------------------------------------------------------------

  // Aqui precisa entrar a busca de IR de documentos sem imposto recolhido (calculado ou manual):
  // são os autônomos que tiveram rendimento mas não precisaram recolher imposto

  // Encontrar uma maneira de restringir a busca "duplicada": o campo de relacionamento para os
  // casos anteriores (outros unions) está na imposto retido ou na LanctoDocum. Nesse caso, não dá
  // para empregar essa restrição

  sSQL :=
  '-- Rendimentos sem impostos calculados/retidos/lancados manualmente ---------------------------' + #13 +
  'SELECT '                                                                                         + #13 +
  '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DOC.IDPESSOA, '                    + #13 +
  '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO, '                                                   + #13 +
  '  DOC.CODDOCUMENTO, 0 AS NUMLANCTO, 0 AS VALOR, -1 AS CODALTERADOR, '                            + #13 +
  '  '' '' AS PLACONTA, 0 AS PLANO, '                                                               + #13 +
  '  BAS.VALOR AS VALBASE, '                                                                        + #13 +

  '  '' '' AS CODTIPRECDES, '                                                                       + #13;

  if bDataLanc then sSQL := sSQL +
  '  BAS.DATALANCTO, '                                                                              + #13
  else sSQL := sSQL +
  '  PAG.DATALANCTO, '                                                                              + #13;

  sSQL := sSQL +
  '  0 AS IDLANCIRRF, '                                                                             + #13 +
  '  FSV.CODNATUREZA, '                                                                             + #13 +
  '  0 AS CODIMPOSTO, '                                                                             + #13 +
  '  ''(Rendimentos)'' AS NOMEIMPOSTO, '                                                            + #13 +
  '  '''' AS CCUSTOCAP, '                                                                           + #13 +
  '  0 AS CODIGOGPS '                                                                               + #13 +

  'FROM '                                                                                           + #13 +
  '  DOCUMENTO     DOC, '                                                                           + #13 +
  '  PESSOA        PES, '                                                                           + #13 +
  '  FORNSERV      FSV, '                                                                           + #13;

  // -----------------------------------------------------------------------------------------------
  // Se não for por data de lançamento, busca pela data do lançamento de baixa

  if not(bDataLanc) then
  begin
    sSQL := sSQL +
  '  ( '                                                                                            + #13 +
  '  SELECT '                                                                                       + #13 +
  '     MIN(NUMLANCTO), MIN(DATALANCTO) AS DATALANCTO, CODDOCUMENTO '                               + #13 +
  '  FROM '                                                                                         + #13 +
  '     LANCTODOCUM '                                                                               + #13 +
  '  WHERE '                                                                                        + #13 +
  '        LTRIM(RTRIM(OPERACAO)) = ''5'' '                                                         + #13;

    if Documento > 0 then sSQL := sSQL +
  '    AND CODDOCUMENTO           = ' + FormatFloat('#0', Documento)                                + #13;

    sSQL := sSQL +
  '    AND DATALANCTO             BETWEEN ' + sDataIni + ' AND ' + sDataFim                         + #13 +
  '    AND ESTORNO                IS NULL '                                                         + #13 +
  '  GROUP BY '                                                                                     + #13 +
  '    CODDOCUMENTO '                                                                               + #13 +
  '  ) PAG, '                                                                                       + #13;
  end;

  // -----------------------------------------------------------------------------------------------
  // Busca o valor-base do imposto, ie, o lançamento original do documento

  sSQL := sSQL +
  '  ( '                                                                                            + #13 +
  '  SELECT '                                                                                       + #13 +
  '     CODDOCUMENTO, VALOR, DATALANCTO '                                                           + #13 +
  '  FROM '                                                                                         + #13 +
  '     LANCTODOCUM '                                                                               + #13 +
  '  WHERE '                                                                                        + #13 +
  '        LTRIM(RTRIM(OPERACAO)) = ''2'' '                                                         + #13;

  if bDataLanc then sSQL := sSQL +
  '    AND DATALANCTO             BETWEEN ' + sDataIni + ' AND ' + sDataFim                         + #13;

  if Documento > 0 then sSQL := sSQL +
  '    AND CODDOCUMENTO           = ' + FormatFloat('#0', Documento)                                + #13;

  sSQL := sSQL +
  '    AND ESTORNO                IS NULL '                                                         + #13 +
  '  ) BAS '                                                                                        + #13 +

  // -----------------------------------------------------------------------------------------------

  'WHERE '                                                                                          + #13 +
  '      DOC.CODDOCUMENTO   = BAS.CODDOCUMENTO '                                                    + #13 +
  '  AND DOC.IDFORCLI       = PES.IDPESSOA '                                                        + #13 +
  '  AND DOC.IDFORCLI       = FSV.IDPESSOA '                                                        + #13;

  // -----------------------------------------------------------------------------------------------

  if Favorecido > 0 then sSQL := sSQL +
  '  AND DOC.IDFORCLI       = ' + FormatFloat('#0', Favorecido)                                     + #13;

  if Documento > 0 then sSQL := sSQL +
  '  AND DOC.CODDOCUMENTO   = ' + FormatFloat('#0', Documento)                                      + #13;

  // -----------------------------------------------------------------------------------------------

  if not(bDataLanc)  then sSQL := sSQL +
  '  AND DOC.CODDOCUMENTO   = PAG.CODDOCUMENTO '                                                    + #13;

  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  // só busca documentos que não ainda não estejam relacionados na LancIRRF
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDLANCIRRF '                                                            + #13 +
  '                 FROM    LANCIRRF '                                                              + #13 +
  '                 WHERE   CODDOCUMENTO    = DOC.CODDOCUMENTO '                                    + #13 +
  '                 ) '                                                                             + #13;

  // nem na ImpostoRetido (pois o valor-base já seria computado dessa forma)
  sSQL := sSQL +
  '  AND NOT EXISTS ( '                                                                             + #13 +
  '                 SELECT  IDIMPOSTORETIDO '                                                       + #13 +
  '                 FROM    IMPOSTORETIDO '                                                         + #13 +
  '                 WHERE   CODDOCUMENTO = DOC.CODDOCUMENTO '                                       + #13 +
  '                 ) '                                                                             + #13;

  // essa condição aqui não é opcional
  sSQL := sSQL +
  '  AND FSV.CODNATUREZA    IS NOT NULL '                                                           + #13 +
  '-----------------------------------------------------------------------------------------------' + #13;

  // -----------------------------------------------------------------------------------------------

  Result := sSQL;
end;

//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//  FIM Funções para montar os SQLs de busca
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------



//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//  Funções para montar os SQLs de desfazer
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

function TCtrlBuscaCaP.MontaSQLDesfazImposto(const psNomeImposto : string;
                                             const psCampoValor  : string;
                                             const psNatureza    : string
                                            ): string;
var
  sSQL      : string;
  sDataIni  : string;
  sDataFim  : string;
begin
  sDataIni  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataIni)) + ', ''DD/MM/YYYY'')';
  sDataFim  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataFim)) + ', ''DD/MM/YYYY'')';

  // -----------------------------------------------------------------------------------------------

  sSQL :=
  '-- ' + QuotedStr(psNomeImposto) + ':  ---------------------------------------------------------' + #13 +
  'SELECT '                                                                                         + #13 +
  '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DOC.IDPESSOA, '                    + #13 +
  '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO, '                                                   + #13 +
  '  DOC.CODDOCUMENTO, -1 AS NUMLANCTO, LIR.' + psCampoValor + ' AS VALOR, -1 AS CODALTERADOR, '    + #13 +
  '  '' '' AS PLACONTA, 0 AS PLANO, '                                                               + #13 +
  '  LIR.VLRBASE AS VALBASE, '                                                                      + #13 +
  '  '' '' AS CODTIPRECDES, '                                                                       + #13 +
  '  LIR.DATALANCAMENTO AS DATALANCTO, '                                                            + #13 +
  '  LIR.IDLANCIRRF, '                                                                              + #13 +
  '  LIR.CODNATUREZA, '                                                                             + #13 +
  '  0 AS CODIMPOSTO, '                                                                             + #13 +
  '  ' + QuotedStr(psNomeImposto) + ' AS NOMEIMPOSTO, '                                             + #13 +
  '  LIR.CODCENTROCUSTO AS CCUSTOCAP, '                                                             + #13 +
  '  LIR.CODIGOGPS '                                                                                + #13 +

  'FROM '                                                                                           + #13 +
  '  DOCUMENTO     DOC, '                                                                           + #13 +
  '  PESSOA        PES, '                                                                           + #13 +
  '  LANCIRRF      LIR  '                                                                           + #13 +

  'WHERE '                                                                                          + #13 +
  '      LIR.DATALANCAMENTO   BETWEEN ' + sDataIni + ' AND ' + sDataFim                             + #13;

  if length(trim(psNatureza)) > 0 then sSQL := sSQL +
  '  AND LIR.CODNATUREZA      = ' + QuotedStr(psNatureza)                                           + #13;

  // -----------------------------------------------------------------------------------------------

  if Favorecido > 0 then sSQL := sSQL +
  '  AND DOC.IDFORCLI       = ' + FormatFloat('#0', Favorecido)                                     + #13;

  if Documento > 0 then sSQL := sSQL +
  '  AND DOC.CODDOCUMENTO   = ' + FormatFloat('#0', Documento)                                      + #13;

  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  '  AND LIR.FLGFOLHA             = ''N'' '                                                         + #13 +
  '  AND LIR.IDMODULO             = 3 '                                                             + #13 +
  '  AND NVL(LIR.' + psCampoValor + ', 0)     <> 0 '                                                + #13 +
  '  AND NVL(LIR.FLGDARF, ''N'') <> ''S'' '                                                         + #13 +
  '  AND NVL(LIR.FLGDARM, ''N'') <> ''S'' '                                                         + #13 +
  '  AND LIR.IDDARF               IS NULL '                                                         + #13 +
  '  AND LIR.IDDOCINSS            IS NULL '                                                         + #13 +
  '  AND LIR.IDDOCISS             IS NULL '                                                         + #13 +
  '  AND LIR.CODDOCUMENTO         = DOC.CODDOCUMENTO '                                              + #13 +
  '  AND DOC.IDFORCLI             = PES.IDPESSOA '                                                  + #13 +
  '-----------------------------------------------------------------------------------------------' + #13;

  // -----------------------------------------------------------------------------------------------

  Result := sSQL;
end;



function TCtrlBuscaCaP.MontaSQLDesfazIR: string;
begin
  Result := MontaSQLDesfazImposto('IRRF', 'VLRIRRF', NatuIR);
end;



function TCtrlBuscaCaP.MontaSQLDesfazINSS: string;
begin
  Result := MontaSQLDesfazImposto('INSS', 'VLRINSS', NatuINSS);
end;



function TCtrlBuscaCaP.MontaSQLDesfazPIS: string;
begin
  Result :=
  MontaSQLDesfazImposto('PIS',              'VLRPIS',       NatuPIS)  + 'UNION '  + #13 +
  MontaSQLDesfazImposto('COFINS',           'VLRCOFINS',    NatuPIS)  + 'UNION '  + #13 +
  MontaSQLDesfazImposto('CSLL',             'VLRCSLL',      NatuPIS)  + 'UNION '  + #13 +
  MontaSQLDesfazImposto('CSLL/PIS/COFINS',  'VLRCSCOFPIS',  NatuPIS);
end;



function TCtrlBuscaCaP.MontaSQLDesfazISS: string;
begin
  Result := MontaSQLDesfazImposto('ISS', 'VLRISS', NatuISS);
end;



function TCtrlBuscaCaP.MontaSQLDesfazRend: string;
var
  sSQL      : string;
  sDataIni  : string;
  sDataFim  : string;
begin
  sDataIni  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataIni)) + ', ''DD/MM/YYYY'')';
  sDataFim  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DataFim)) + ', ''DD/MM/YYYY'')';

  // -----------------------------------------------------------------------------------------------

  sSQL :=
  '-- Rendimentos sem impostos -------------------------------------------------------------------' + #13 +
  'SELECT '                                                                                         + #13 +
  '  DOC.IDFORCLI, DOC.OPERACAO, DOC.NUMFATURA, DOC.NODOCUMENTO, DOC.IDPESSOA, '                    + #13 +
  '  PES.NOME AS RAZAOSOCIAL, PES.NUMDOCUMENTO, '                                                   + #13 +
  '  DOC.CODDOCUMENTO, -1 AS NUMLANCTO, 0 AS VALOR, -1 AS CODALTERADOR, '                           + #13 +
  '  '' '' AS PLACONTA, 0 AS PLANO, '                                                               + #13 +
  '  LIR.VLRBASE AS VALBASE, '                                                                      + #13 +
  '  '' '' AS CODTIPRECDES, '                                                                       + #13 +
  '  LIR.DATALANCAMENTO AS DATALANCTO, '                                                            + #13 +
  '  LIR.IDLANCIRRF, '                                                                              + #13 +
  '  LIR.CODNATUREZA, '                                                                             + #13 +
  '  0 AS CODIMPOSTO, '                                                                             + #13 +
  '  ''(Rendimentos)'' AS NOMEIMPOSTO, '                                                            + #13 +
  '  '''' AS CCUSTOCAP, '                                                                           + #13 +
  '  0 AS CODIGOGPS '                                                                               + #13 +

  'FROM '                                                                                           + #13 +
  '  DOCUMENTO     DOC, '                                                                           + #13 +
  '  PESSOA        PES, '                                                                           + #13 +
  '  LANCIRRF      LIR  '                                                                           + #13 +

  'WHERE '                                                                                          + #13 +
  '      LIR.DATALANCAMENTO   BETWEEN ' + sDataIni + ' AND ' + sDataFim                             + #13;

  // -----------------------------------------------------------------------------------------------

  if Favorecido > 0 then sSQL := sSQL +
  '  AND DOC.IDFORCLI       = ' + FormatFloat('#0', Favorecido)                                     + #13;

  if Documento > 0 then sSQL := sSQL +
  '  AND DOC.CODDOCUMENTO   = ' + FormatFloat('#0', Documento)                                      + #13;

  // -----------------------------------------------------------------------------------------------

  sSQL := sSQL +
  '  AND LIR.FLGFOLHA             = ''N'' '                                                         + #13 +
  '  AND LIR.IDMODULO             = 3 '                                                             + #13 +

  // Essas são as condições fundamentais --> não pode haver imposto
  '  AND NVL(LIR.VLRIRRF, 0)      = 0 '                                                             + #13 +
  '  AND NVL(LIR.VLRINSS, 0)      = 0 '                                                             + #13 +
  '  AND NVL(LIR.VLRPIS, 0)       = 0 '                                                             + #13 +
  '  AND NVL(LIR.VLRCOFINS, 0)    = 0 '                                                             + #13 +
  '  AND NVL(LIR.VLRCSLL, 0)      = 0 '                                                             + #13 +
  '  AND NVL(LIR.VLRCSCOFPIS, 0)  = 0 '                                                             + #13 +
  '  AND NVL(LIR.VLRISS, 0)       = 0 '                                                             + #13 +

  '  AND NVL(LIR.FLGDARF, ''N'') <> ''S'' '                                                         + #13 +
  '  AND NVL(LIR.FLGDARM, ''N'') <> ''S'' '                                                         + #13 +
  '  AND LIR.IDDARF               IS NULL '                                                         + #13 +
  '  AND LIR.IDDOCINSS            IS NULL '                                                         + #13 +
  '  AND LIR.IDDOCISS             IS NULL '                                                         + #13 +
  '  AND LIR.CODDOCUMENTO         = DOC.CODDOCUMENTO '                                              + #13 +
  '  AND DOC.IDFORCLI             = PES.IDPESSOA '                                                  + #13 +
  '-----------------------------------------------------------------------------------------------' + #13;

  // -----------------------------------------------------------------------------------------------

  Result := sSQL;
end;

//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//  FIM Funções para montar os SQLs de desfazer
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

end.


{(VLRIRRF      <> 0 AND (VLRINSS <> 0 OR VLRPIS  <> 0 OR VLRIOF   <> 0 OR VLRCOFINS  <> 0 OR VLRCSLL <> 0 OR VLRCSCOFPIS <> 0 OR VLRISS   <> 0)) OR
(VLRINSS      <> 0 AND (VLRIRRF <> 0 OR VLRPIS  <> 0 OR VLRIOF   <> 0 OR VLRCOFINS  <> 0 OR VLRCSLL <> 0 OR VLRCSCOFPIS <> 0 OR VLRISS   <> 0)) OR
(VLRPIS       <> 0 AND (VLRINSS <> 0 OR VLRIRRF <> 0 OR VLRIOF   <> 0 OR VLRCOFINS  <> 0 OR VLRCSLL <> 0 OR VLRCSCOFPIS <> 0 OR VLRISS   <> 0)) OR
(VLRIOF       <> 0 AND (VLRINSS <> 0 OR VLRPIS  <> 0 OR VLRIRRF  <> 0 OR VLRCOFINS  <> 0 OR VLRCSLL <> 0 OR VLRCSCOFPIS <> 0 OR VLRISS   <> 0)) OR
(VLRCOFINS    <> 0 AND (VLRINSS <> 0 OR VLRPIS  <> 0 OR VLRIOF   <> 0 OR VLRIRRF    <> 0 OR VLRCSLL <> 0 OR VLRCSCOFPIS <> 0 OR VLRISS   <> 0)) OR
(VLRCSLL      <> 0 AND (VLRINSS <> 0 OR VLRPIS  <> 0 OR VLRIOF   <> 0 OR VLRCOFINS  <> 0 OR VLRIRRF <> 0 OR VLRCSCOFPIS <> 0 OR VLRISS   <> 0)) OR
(VLRCSCOFPIS  <> 0 AND (VLRINSS <> 0 OR VLRPIS  <> 0 OR VLRIOF   <> 0 OR VLRCOFINS  <> 0 OR VLRCSLL <> 0 OR VLRIRRF     <> 0 OR VLRISS   <> 0)) OR
(VLRISS       <> 0 AND (VLRINSS <> 0 OR VLRPIS  <> 0 OR VLRIOF   <> 0 OR VLRCOFINS  <> 0 OR VLRCSLL <> 0 OR VLRCSCOFPIS <> 0 OR VLRIRRF  <> 0))
}
