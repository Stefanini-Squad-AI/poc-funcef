{*******************************************************************************
  Alterações:
********************************************************************************
{
-----------------------------------------------------------------------------
Nº SIG......: 94320/95404
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web - envio
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
{-------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 19477
Data     : 06/07/2005
Descrição: Substuição do campo IDCONTRATO por CODCONTRATOEMPR no histórico de
           lançamentos
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Analista : Rodolpho da Silva
Pendência: 18449
Data     : 21/01/2005
Descrição: Correção na tela, pois ao fazer a geração sem contabilizar,
           estava dando erro de 'ACCESS VIOLATION'.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
 Rotina    : GeraContratoNovo
 Data      : 28/10/2004
 Autor     : Bruno Bastos
 Pendências: 15867
 Descrição : Alteração para medição de contrato suportar múltiplas contas de baixa
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
 Rotina    : GeraContratoNovo
 Data      : 28/10/2004
 Autor     : Bruno Bastos
 Pendências: 17963
 Descrição : Correção de Erro - Ordenar a busca das contas contábeis
             Fazer a contabilização primeiramente pela conta do tipo de desembolso
             senão pela conta do fornecedor.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
 Rotina    : GeraContratoNovo
 Data      : 10/09/2004
 Autor     : Marchetti
 Pendências: 16455
 Descrição : Não gerar contrato para Contratos que possuem aditamentos com RAD pendente
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 04/08/2004
 Autor     : David Ayrolla
 Pendências: 16832 e 17232
 Descrição : Limitar a retenção de INSS de autônomos ao teto.
-------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Analista : Marchetti
Pendência: 16957
Data     : 05/07/2004
Descrição: Criada a função EstornaParcela
-------------------------------------------------------------------------------}

unit uCtrlGeracaoContrato;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet, uDbMedicao, uDbParcelaRealContr, uDbParcelaMedicao,
     uCtrlImpostoRetido, uCtrlDocumento, uCtrlLancamento, uGeralContrato,
     uCtrlParamIntegra, uCtrlUsuXContrato, uCtrlServProdxItemContr, uCtrlOrcamento,
     Classes, uCtrlMultiplasContas, uCtrlSegregacao;

type TAgrupa = Record
  idContrato    : Integer;
  idMoeda       : Integer;
  iCodTipDoc    : Integer;
  idForCli      : Integer;
  iCodPortForma : Integer;
  dVencto       : TDateTime;
  sCodTipRecDes : String;
  sObsCapCar    : String;
  sCodContrato  : String;
  sCentroRespon : String;
end;

type TItem = Record
  idObjeto      : Integer;
  idItem        : Integer;
  idParcela     : Integer;
  VlrObjeto     : Currency;
end;


type

   // Início Pendência 23048 - Marcos Topini - 18/08/2006
   TRegRateioDocum = Record
      sCodTipRecDes      : String;
      sCodCentroRespon   : String;
      iUnidNeg           : Integer;
      iIdReservaOrcamen  : Integer;
      sCodCentroCusto    : String;
      iIdPatro           : Integer;
      iIdPlanoPrev       : Integer;
      dValorRateio       : Double;
      dValorOrca         : Double;
      iIdDespesaOrc      : Integer;//Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
      iIdProgramaOrcamen : Integer;//Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
   End;

   TRateioDocum = array of TRegRateioDocum;
   // Fim Pendência

   //DAVID - Retenção de Imposto
   TOnRecuperaOutros = function( NomeFornec : string; DataRetencao : TDateTime; var VlOutros : Double ) : boolean;

   TCtrlGeracaoContrato = Class(TCmControlObject)
   private
      FDbParcelaRealContr   : TDbParcelaRealContr;

      CtrlImpostoRetido      : TCtrlImpostoRetido;
      CtrlLancamento         : TCtrlLancamento;
      CtrlParamIntegra       : TCtrlParamIntegra;
      CtrlDocumento          : TCtrlDocumento;
      CtrlUsuXContrato       : TCtrlUsuXContrato;
      CtrlServProdxItemContr : TCtrlServProdxItemContr;
      GeralContrato          : TGeralContrato;

      //Bruno Bastos - Pend. 15867 - 25/10/2004
      CtrlMultiplasContas    : TCtrlMultiplasContas;
      CtrlSegregacao         : TCtrlSegregacao;

      // Marcio Motta - 21/05/2004 - Pendência: 16788
      CtrlOrcamento          : TOrcamentoBackMT;

      F_rIDPessoa     : Double;
      F_rIDModulo     : Double;
      F_rIDUsuario    : Double;
      F_rIDEspAcesso  : Double;
      F_bUsaPlanoPatro: Boolean;
      bPartidaDobrada : Boolean;
   public
      //DAVID - Retenção de INSS
      OnRecuperaOutros : TOnRecuperaOutros;

      MaxProgresso : Integer;

      property IDPessoa     : Double  read F_rIDPessoa      write F_rIDPessoa;
      property IDModulo     : Double  read F_rIDModulo      write F_rIDModulo;
      property IDUsuario    : Double  read F_rIDUsuario     write F_rIDUsuario;
      property IDEspAcesso  : Double  read F_rIDEspAcesso   write F_rIDEspAcesso;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario, IdEspAcesso: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      function GeraContratoNovo(const dDataGeracao,dDataLanc,dIniVencto,dFimVencto:TDateTime; const bContabiliza:Boolean = True;
                                const iIdContrato:Integer = -1;
                                const iIdFormaRecPag:Integer = -1; const fNumDoc:Double = 0;
                                const sCompDoc:String = '';        const sHistCompl:String = '';
                                const sCodBarra:String = '';       const sLinhaDig:String = '';
                                const sObs:String = '';            const iContaBanco:Integer = 0;
                                const iIdReservaOrcamen:Double = 0 ): Boolean;

      // Marcio Motta - 28/05/2004 - Pendência: 16788
      function IntegraOrcamento(iIdReservaOrcamen: Int64;  fValor: Double): Boolean;

      function ExcluiParcela(const vParcela:OLEVariant; const sNomeBilhete:String): Boolean;
      function GeraNumDocumento: Double;
      function ListUltimaParcela(const iIdContrato:Integer) : OLEVariant;
      function ListParcelaGerada(const iIdContrato:Integer = -1; const bSemBaixa:Boolean = True;
                                 const dIni:TDateTime = -1; const dFim:TDateTime = -1;
                                 const dGeracao:TDateTime = -1) : OLEVariant;

      procedure OnCreateAppServer; override;

      // Marchetti - Pendencia 16957
      function EstornaParcela(const vParcela:OLEVariant; const sNomeBilhete:String): Boolean;
      // Fim Pendencia 16957

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;
   end;

  //DAVID - Retenção INSS
  function OnRetencaoINSS( IdForCli : integer; DataRetencao : TDateTime;
                           VlTeto, VlAnterior : Double;
                           var VlImposto, VlOutros : Double ) : boolean;

var
  //Retenção de INSS
  Ctrl : TCtrlGeracaoContrato;
  strINSSRetidosEmOutros : TStringList;

implementation

{ TCtrlGeracaoContrato }

constructor TCtrlGeracaoContrato.Create(rIDPessoa, rIDModulo,
  rIDUsuario, IdEspAcesso: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;

   FDbParcelaRealContr:=TDbParcelaRealContr.Create(Self);
   MaxProgresso := 0;

   CtrlImpostoRetido:=TCtrlImpostoRetido.Create;
   CtrlDocumento:=TCtrlDocumento.Create;
   CtrlLancamento:=TCtrlLancamento.Create;
   CtrlUsuXContrato:=TCtrlUsuXContrato.Create;
   CtrlParamIntegra:=TCtrlParamIntegra.Create;
   CtrlServProdxItemContr:=TCtrlServProdxItemContr.Create;
   GeralContrato:=TGeralContrato.Create;

   //Bruno Bastos - Pend. 15867 - 25/10/2004
   CtrlMultiplasContas := TCtrlMultiplasContas.Create;
   CtrlSegregacao      := TCtrlSegregacao.Create;

   // Marcio Motta - 21/05/2004 - 16788
   CtrlOrcamento := TOrcamentoBackMT.Create;

   //DAVID - Retenção de INSS
   strINSSRetidosEmOutros := TStringList.Create;
end;

procedure TCtrlGeracaoContrato.OnCreateAppServer;
begin
   inherited;
end;

destructor TCtrlGeracaoContrato.Destroy;
begin
   CtrlImpostoRetido.Free;
   CtrlDocumento.Free;
   CtrlLancamento.Free;
   CtrlParamIntegra.Free;
   CtrlUsuXContrato.Free;
   CtrlServProdxItemContr.Free;
   GeralContrato.Free;
   FDbParcelaRealContr.Free;
   CtrlOrcamento.Free;

   //Bruno Bastos - Pend. 15867 - 25/10/2004
   CtrlMultiplasContas.Free;
   CtrlSegregacao.Free;

   //DAVID - Retenção de INSS
   strINSSRetidosEmOutros.Free;
   inherited;
end;

procedure TCtrlGeracaoContrato.AfterInitialize;
begin
   inherited;
   //Bruno Bastos - Pend. 15867 - 25/10/2004
   CtrlMultiplasContas.InitializeAs(Self);
   CtrlSegregacao.InitializeAs(Self);

   CtrlImpostoRetido.InitializeAs(Self);
   CtrlDocumento.InitializeAs(Self);
   CtrlLancamento.InitializeAs(Self);
   CtrlParamIntegra.InitializeAs(Self);
   CtrlServProdxItemContr.InitializeAs(Self);
   CtrlUsuXContrato.InitializeAs(Self);
   GeralContrato.InitializeAs(Self);
   CtrlOrcamento.InitializeAs(Self);

   CtrlImpostoRetido.OpenTransaction:=False;
   CtrlServProdxItemContr.OpenTransaction:=False;
   CtrlDocumento.OpenTransaction:=False;

   with TCMClientDataSet.Create(nil) do
   try
      Data:=GetDataPacket('SELECT PACDOBRADA '+
                          'FROM PARAMCONTAB '+
                          'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
      bPartidaDobrada:=(FieldByName('PACDOBRADA').AsString='S');
   finally
      Free;
   end;
end;

procedure TCtrlGeracaoContrato.DoChangeDataBase;
begin
   inherited;
   FDbParcelaRealContr.DataBaseName:=DataBaseName;
end;


function TCtrlGeracaoContrato.GeraContratoNovo(const dDataGeracao, dDataLanc,
  dIniVencto, dFimVencto: TDateTime; const bContabiliza: Boolean;
  const iIdContrato, iIdFormaRecPag: Integer; const fNumDoc: Double;
  const sCompDoc, sHistCompl, sCodBarra, sLinhaDig, sObs: String;
  const iContaBanco:Integer; const iIdReservaOrcamen:Double): Boolean;
var
   cdsDadosContrato   : TCMClientDataSet;
   cdsDadosForCli     : TCMClientDataSet;
   cdsRateioXCC       : TCMClientDataSet;

   sDebCre            : String;
   sRecPag            : String;
   sContaC            : String;
   sContaD            : String;
   sContaOriC         : String;
   sContaOriD         : String;
   sContaAranha       : String;
   rCodSubContaC      : Double;
   rCodSubContaD      : Double;
   sCCustoC           : String;
   sCCustoD           : String;
   rValor             : Double;
   fVlrOrca           : Double;
   rVlrTotalAux       : Double;
   rIDPatro           : Double;
   rIDPlanoPrev       : Double;
   rFrequencia        : Double;
   sHist1,sHist2      : String;
   sHist3,sHist4      : String;
   sHist5             : String;
   sHistorico         : String;
   sObsCapCar         : String;
   rNumParcelaAux     : Double;

   sTipoContrato      : String;
   sSql               : String;
   i                  : Integer;
   iContRateio        : Integer;
   iVlrAuxRateio      : Int64;
   iVlrTotalRateio    : Int64;
   iVlrTotDocum       : Extended;

   //Bruno Bastos - Pend. 15867 - 25/10/2004
   bMultiplasContas   : Boolean;
   vLancaMB           : TLancaMB;
   vContab            : TLancaMB;
   sContaSegregaCriter: String;
   j                  : integer;

   rCodDocumentoAux   : Double;
   rPlnCodigoAux      : Double;
   iQtdeGerado        : Integer;
   AgrupaC, AgrupaI   : TAgrupa;
   vAgpItem           : Array of TItem;

   // Pendência 19333 - Marcos Topini - 31/07/2006
   dDtLancamento : TDateTime;
   Ano,Mes,Dia   : Word;
   bGeraContrato : Boolean;

   // Início Pendência : 23048 - Marcos Topini - 18/08/2006
   vRateioDocum : TRateioDocum;
   bNovoLancto  : boolean;
   // Fim Pêndência

begin
   MessageInfo := '';
   if ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.GeraContrato(dDataGeracao,
                                                  dDataLanc,
                                                  F_rIDPessoa,
                                                  F_rIDUsuario,
                                                  F_rIDEspAcesso,
                                                  F_bUsaPlanoPatro);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      //Bruno Bastos - Pend. 15867 - Início
      If not CtrlSegregacao.Active Then
        CtrlSegregacao.GetParams(Trunc(F_rIDPessoa));
      //Bruno Bastos - Pend. 15867 - Fim

      Result := True;
      StartTransaction;
       try
          cdsDadosContrato := TCMClientDataSet.Create(nil);
          cdsDadosForCli   := TCMClientDataSet.Create(nil);
          cdsRateioXCC     := TCMClientDataSet.Create(nil);
          try
             // Busca os contratos a serem gerados
             cdsDadosContrato.Data := CtrlUsuXContrato.ListGeracaoContrato(F_rIDPessoa, F_rIDUsuario, iIdContrato,
                                                                           dIniVencto, dFimVencto);

             iQtdeGerado    := 0;

             //DAVID - Retenção de INSS
             strINSSRetidosEmOutros.Clear;

             cdsDadosContrato.First;
             j := 0; //Bruno Bastos - Pend. 15867 - 28/10/2004
             while not cdsDadosContrato.Eof do begin

                // Testa se o contrato ainda pode fazer medição
                // se for o caso, preenche o logerro.
                bGeraContrato := True;
                If not CtrlServProdxItemContr.ExisteParcPendente(F_rIDPessoa,
                                                                 cdsDadosContrato.FieldByName('IDCONTRATO').AsFloat,
                                                                 cdsDadosContrato.FieldByName('IDOBJETO').AsFloat,
                                                                 cdsDadosContrato.FieldByName('IDITEM').AsFloat) then begin
                  bGeraContrato := False;
                end;

                // Pendência 19333 - Marcos Topini - 31/07/2006
                If (dDataLanc = -1) then begin
                 DecodeDate(cdsDadosContrato.FieldByName('DATAVENC').AsDateTime,Ano,Mes,Dia);
                 dDtLancamento := EncodeDate(Ano,Mes,1)
                end
                else
                 dDtLancamento := dDataLanc;
                // Fim Pendência 19333

                // Marchetti - Pendencia 16455
                if (bGeraContrato) and (not CtrlUsuXContrato.ContratoPossuiAditamentoComRADPendente(cdsDadosContrato.FieldByName('IDCONTRATO').AsFloat)) then
                begin
                   rNumParcelaAux := 0;
                   MaxProgresso   := cdsDadosContrato.RecordCount;
                   sTipoContrato  := cdsDadosContrato.FieldByName('TIPOCONTRATO').AsString;

                   // Abre parametros para Contas a Pagar ou Receber
                   if sTipoContrato = 'A' then begin
                      sDebCre := 'D';
                      sRecPag := 'R';
                      CtrlParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAR );
                   end else begin
                      sDebCre := 'C';
                      sRecPag := 'P';
                      CtrlParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);
                   end;

                   // Abre dados do Fornecedor / Cliente
                   if sTipoContrato = 'A' then begin
                      sSql := 'SELECT NVL(E.CODSUBCONTA,0) AS CODSUBCONTA,     '+#13+
                              '       E.CONTACCLIENTE AS CONTA,                '+#13+
                              '       E.CODCENTROCUSTO, E.PLANO, P.RAZAOSOCIAL '+#13+
                              '  FROM PESSOA P, EMPRESACLIENTE E               '+#13+
                              ' WHERE P.IDPESSOA = E.IDFORCLI                  '+#13+
                              '   AND E.IDFORCLI = ' + cdsDadosContrato.FieldByName('IDFORCLI').AsString +#13+
                              '   AND E.IDPESSOA = ' + FloatToStr(F_rIDPessoa);

                      cdsDadosForCli.Data := GetDataPacket( sSql );
                      sContaOriC := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                      sContaOriD := cdsDadosForCli.FieldByName('CONTA').AsString;
                   end else begin
                      sSql := 'SELECT NVL(E.CODSUBCONTA,0) AS CODSUBCONTA, '+#13+
                              '       E.CONTACFORN AS CONTA, '+#13+
                              '       E.CODCENTROCUSTO, E.PLANO, P.RAZAOSOCIAL '+#13+
                              '  FROM PESSOA P, EMPRESAFORN E '+#13+
                              ' WHERE P.IDPESSOA = E.IDFORCLI '+#13+
                              '   AND E.IDFORCLI = ' + cdsDadosContrato.FieldByName('IDFORCLI').AsString +#13+
                              '   AND E.IDPESSOA = ' + FloatToStr(F_rIDPessoa);

                      cdsDadosForCli.Data := GetDataPacket( sSql );
                      sContaOriC := cdsDadosForCli.FieldByName('CONTA').AsString;
                      sContaOriD := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                   end;

                   // Abre tabela de Rateio dos objetos do contrato
                   cdsRateioXCC.Data := CtrlServProdxItemContr.ListRateio(
                                          cdsDadosContrato.FieldByName('IDCONTRATO').AsFloat,
                                          0,0,Sistema.IdEmpresa,False);

                   //-----------------------------------------------------
                   //Gera o número da parcela a ser gravada no histórico
                   //-----------------------------------------------------
                   if fNumDoc > 0 then
                        rNumParcelaAux := fNumDoc
                   else rNumParcelaAux := GeraNumDocumento;

                   // Define campos para agrupar itens no mesmo documento
                   AgrupaC.idContrato    := cdsDadosContrato.FieldByName('IDCONTRATO').AsInteger;
                   AgrupaC.idMoeda       := cdsDadosContrato.FieldByName('MOECODIGO').AsInteger;
                   AgrupaC.iCodTipDoc    := cdsDadosContrato.FieldByName('CODTIPDOC').AsInteger;
                   AgrupaC.sCodTipRecDes := cdsDadosContrato.FieldByName('CODTIPRECDES').AsString;
                   AgrupaC.idForCli      := cdsDadosContrato.FieldByName('IDFORCLI').AsInteger;
                   AgrupaC.iCodPortForma := cdsDadosContrato.FieldByName('CODPORTFORMA').AsInteger;
                   AgrupaC.dVencto       := cdsDadosContrato.FieldByName('DATAVENC').AsDateTime;
                   AgrupaC.sCodContrato  := cdsDadosContrato.FieldByName('CODCONTRATOEMPR').AsString;
                   AgrupaC.sCentroRespon := cdsDadosContrato.FieldByName('CODCENTRORESPON').AsString;

                   // Define Observação do documento
                   if sObs = '' then
                        AgrupaC.sObsCapCar := cdsDadosContrato.FieldByName('OBSERVACAO').AsString
                   else AgrupaC.sObsCapCar := sObs;

                   AgrupaI  := AgrupaC;
                   vAgpItem := nil;
                   iVlrTotDocum  := 0;
                   rPlnCodigoAux := 0;

                   while (AgrupaI.idContrato    = AgrupaC.idContrato    ) and
                         (AgrupaI.idMoeda       = AgrupaC.idMoeda       ) and
                         (AgrupaI.iCodTipDoc    = AgrupaC.iCodTipDoc    ) and
                         (AgrupaI.idForCli      = AgrupaC.idForCli      ) and
                         (AgrupaI.iCodPortForma = AgrupaC.iCodPortForma ) and
                         (AgrupaI.dVencto       = AgrupaC.dVencto       ) and
// Bruno Bastos e Vinicius - 26/10/2004
                         (AgrupaI.sObsCapCar    = AgrupaC.sObsCapCar    ) and
                         (AgrupaI.sCodContrato  = AgrupaC.sCodContrato  ) and
                         (AgrupaI.sCentroRespon = AgrupaC.sCentroRespon ) and
                         (not cdsDadosContrato.Eof) do begin

                      if cdsDadosContrato.FieldByName('RECDES_ATIVO').AsString = 'N' then begin
                         Result      := False;
                         MessageInfo := 'Tipo de Recebimento / Desembolso Inativo';
                         Exit;
                      end;

                      // Filtra o Rateio para o Item / Objeto a ser lançado
                      cdsRateioXCC.Filtered := False;
                      cdsRateioXCC.Filter   := 'IDITEM   = '+ cdsDadosContrato.FieldByName('IDITEM').AsString + ' AND ' +
                                               'IDOBJETO = '+ cdsDadosContrato.FieldByName('IDOBJETO').AsString;
                      cdsRateioXCC.Filtered := True;

                      //----------------------------------------------------------
                      // Contabilização
                      //----------------------------------------------------------
                      rVlrTotalAux  := 0;
                      if ( CtrlParamIntegra.IntegraContab ) and ( bContabiliza ) then begin

                          if sTipoContrato = 'A' then begin
                             sContaC := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                             sContaD := cdsDadosForCli.FieldByName('CONTA').AsString;
                             rCodSubContaC := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
                             rCodSubContaD := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
                          end else begin
                             //Bruno Bastos - Pend. 17963 - 19/10/2004
                             sContaC       := cdsrateioxcc.FieldByName('CONTA').AsString;//Bruno Bastos - Pend. 17963 - 19/10/2004
                             sContaD := cdsDadosContrato.FieldByName('PLACONTA').AsString;
                             rCodSubContaC := cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat;
                             rCodSubContaD := cdsDadosContrato.FieldByName('CODSUBCONTA').AsFloat;
                          end;

                          //Bruno Bastos - Pend. 17963 - 20/10/2004 - Início
                          If sContaC = '' Then
                            sContaC := cdsDadosForCli.FieldByName('CONTA').AsString;;
                          //Bruno Bastos - Pend. 17963 - 20/10/2004 - Fim

                          if fNumDoc > 0 then begin
                             sHistorico := 'Lançamento doc. No. '+FloatToStr(fNumDoc)+'/'+sCompDoc+' '+
                                           cdsDadosForCli.FieldByName('RAZAOSOCIAL').AsString+
                           // Marchetti - Pendencia 19477
                                           ' ref. contrato No. '+cdsDadosContrato.FieldByName('CODCONTRATOEMPR').AsString + ' ' +
                                           'Vencimento: ' + cdsDadosContrato.FieldByName('DATAVENC').AsString  + ' ' +
                                           sHistCompl;
                           // Fim Marchetti - Pendencia 19477
                          end else begin
                             sHistorico := 'Lançamento doc. No. '+FloatToStr(rNumParcelaAux)+' '+
                                           cdsDadosForCli.FieldByName('RAZAOSOCIAL').AsString+
                           // Marchetti - Pendencia 19477
                                           ' ref. contrato No. '+cdsDadosContrato.FieldByName('CODCONTRATOEMPR').AsString + ' ' +
                                           'Vencimento: ' + cdsDadosContrato.FieldByName('DATAVENC').AsString  + ' ' +
                                           sHistCompl;
                           // Fim Marchetti - Pendencia 19477
                          end;
                          GeralContrato.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);


                          // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                          //                             no último lançamento.
                          iContRateio     := 1;
                          iVlrTotalRateio := Trunc( cdsDadosContrato.FieldByName('VALORTOTALOBJETO').AsCurrency * 100 );

                          cdsRateioXCC.First;
                          while not cdsRateioXCC.Eof do begin

                             if F_bUsaPlanoPatro then begin
                                rIDPatro     := cdsRateioXCC.FieldByName('IDPATRO').AsFloat;
                                rIDPlanoPrev := cdsRateioXCC.FieldByName('IDPLANOPREV').AsFloat;
                             end else begin
                                rIDPatro     := 0;
                                rIDPlanoPrev := 0;
                             end;

                             if sTipoContrato = 'A' then begin
                                sCCustoC := cdsRateioXCC.FieldByName('CODCENTROCUSTO').AsString;
                                sCCustoD := cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString;
                             end else begin
                                sCCustoC := cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString;
                                sCCustoD := cdsRateioXCC.FieldByName('CODCENTROCUSTO').AsString;
                             end;

                             rValor := GeralContrato.Arredonda( (cdsDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat *
                                                                 cdsRateioXCC.FieldByName('PERCRATEIOCONTR').AsFloat / 100) ,2) ;

                             // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                             //                             no último lançamento.
                             // se for o ultimo registro da query colocar o valor restante nela. Usa valor inteiro para evitar sujeira Delphi
                             if iContRateio = CdsRateioxCC.RecordCount then rValor := iVlrTotalRateio / 100;

                             if cdsRateioXCC.FieldByName('IDPROGRAMA').AsFloat <> 0 then
                                 sContaAranha := CtrlLancamento.BuscaContaContabil(
                                                 Trunc(F_rIDPessoa),
                                                 Trunc(cdsRateioXCC.FieldByName('IDPROGRAMA').AsFloat),
                                                 cdsDadosContrato.FieldByName('CODTIPRECDES').AsString,
                                                 cdsRateioXCC.FieldByName('CODCENTROCUSTO').AsString,
                                                 cdsDadosContrato.FieldByName('RECPAG').AsString);

                             if sContaAranha <> '' then begin
                                if sTipoContrato = 'A' then
                                     sContaC := sContaAranha
                                else sContaD := sContaAranha;
                             end;


                             //Buscar Critério de Segregação
                             //Bruno Bastos - Pend. 15867 - 28/10/2004 - Início
                             SetLength(vContab, (Length(vContab)+1));
                             j := High(vContab);
                             if sTipoContrato = 'A' then //Cliente - {Contas a Receber}
                             begin
                                vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                         Trunc(rIdPLanoPrev),
                                                                         Trunc(rIDPatro),
                                                                         CdsRateioxCC.FieldByName('CONTA').AsString,
                                                                         sContaSegregaCriter);
                                if vContab[j].iIdSegregaCriter = -1 then
                                   vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                         Trunc(rIdPLanoPrev),
                                                                         Trunc(rIDPatro),
                                                                         sContaD,
                                                                         sContaSegregaCriter);
                             end
                             else
                             begin //Fornecedor - {Contas a Pagar}
                                vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                         Trunc(rIdPLanoPrev),
                                                                         Trunc(rIDPatro),
                                                                         sContaD,
                                                                         sContaSegregaCriter);
                                if vContab[j].iIdSegregaCriter = -1 then
                                   vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                         Trunc(rIdPLanoPrev),
                                                                         Trunc(rIDPatro),
                                                                         CdsRateioxCC.FieldByName('CONTA').AsString,
                                                                         sContaSegregaCriter);
                             end;

                             vContab[j].iIdPatro     := Trunc(rIdPatro);
                             vContab[j].iIdPlanoPrev := Trunc(rIdPlanoPrev);
                             vContab[j].iUnidNegoc   := CdsRateioxCC.FieldByName('UNIDNEGOC').AsInteger;
                             vContab[j].sConta       := CdsRateioxCC.FieldByName('CONTA').AsString;
                             vContab[j].rValor       := rValor;
                             //Bruno Bastos - Pend. 15867 - 28/10/2004 - Fim

                             if not bPartidaDobrada then begin
                                if not CtrlLancamento.InsereLancaContab(
                                                       '0',F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                       CtrlParamIntegra.Plano,
                                                       cdsRateioXCC.FieldByName('UNIDNEGOC').AsFloat,
                                                       rCodSubContaD,0,rIDPlanoPrev,
                                                       rIDPatro,rPlnCodigoAux,0,
                                                       DateToStr(dDtLancamento),
                                                       FloatToStr(rNumParcelaAux),
                                                       sHist1,sHist2,sHist3,sHist4,sHist5,'03',
                                                       sCCustoD,sContaD,'','','',rValor,
                                                       True,F_bUsaPlanoPatro,
                                                       vContab[j].iIdSegregaCriter, //Bruno Bastos - Pend. 15867 - 28/10/2004
                                                       dDtLancamento) //Bruno Bastos - Pend. 15867 - 28/10/2004
                                                       then
                                   raise exception.create( CtrlLancamento.MessageInfo );

                                rPlnCodigoAux := CtrlLancamento.RetornoPlnCodigo;

                                if not CtrlLancamento.InsereLancaContab(
                                                       '1',F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                       CtrlParamIntegra.Plano,
                                                       cdsRateioXCC.FieldByName('UNIDNEGOC').AsFloat,
                                                       0,rCodSubContaC,rIDPlanoPrev,
                                                       rIDPatro,rPlnCodigoAux,0,
                                                       DateToStr(dDtLancamento),
                                                       FloatToStr(rNumParcelaAux),
                                                       sHist1,sHist2,sHist3,sHist4,sHist5,'03',
                                                       '','',sCCustoC,
                                                       cdsRateioXCC.FieldByName('CONTA').AsString,//Bruno Bastos - Pend. 15867 - 26/10/2004
                                                       '',rValor,
                                                       True,F_bUsaPlanoPatro,
                                                       vContab[j].iIdSegregaCriter, //Bruno Bastos - Pend. 15867 - 28/10/2004
                                                       dDtLancamento) //Bruno Bastos - Pend. 15867 - 28/10/2004
                                                       then
                                   raise exception.create( CtrlLancamento.MessageInfo );
                             end else begin
                                if not CtrlLancamento.InsereLancaContab(
                                                       '2',F_rIDPessoa,F_rIDModulo,F_rIDUsuario,
                                                       CtrlParamIntegra.Plano,
                                                       cdsRateioXCC.FieldByName('UNIDNEGOC').AsFloat,
                                                       rCodSubContaD,rCodSubContaC,rIDPlanoPrev,
                                                       rIDPatro,rPlnCodigoAux,0,
                                                       DateToStr(dDtLancamento),
                                                       FloatToStr(rNumParcelaAux),
                                                       sHist1,sHist2,sHist3,sHist4,sHist5,'03',
                                                       sCCustoD,sContaD,sCCustoC,
                                                       cdsRateioXCC.FieldByName('CONTA').AsString,//Bruno Bastos - Pend. 15867 - 26/10/2004
                                                       '',rValor,
                                                       True,F_bUsaPlanoPatro,
                                                       vContab[j].iIdSegregaCriter, //Bruno Bastos - Pend. 15867 - 28/10/2004
                                                       dDtLancamento) //Bruno Bastos - Pend. 15867 - 28/10/2004
                                                       then


                                   raise exception.create( CtrlLancamento.MessageInfo );

                                rPlnCodigoAux := CtrlLancamento.RetornoPlnCodigo;
                             end;
                             cdsRateioXCC.Next;

                             // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                             //                             no último lançamento.
                             // subtrai o valor rateado do total
                             rVlrTotalAux    := ( rValor * 100 );
                             iVlrAuxRateio   := Trunc( rVlrTotalAux );
                             iVlrTotalRateio := iVlrTotalRateio - iVlrAuxRateio;
                             Inc(iContRateio);

                          end; // Fim do while do Rateio

                      end //Fim do if da contabilização
                      else

                      begin
                         // Início - Rodolpho - P: 18449 - 21/01/2005
                         SetLength(vContab, (Length(vContab)+1));
                         j := High(vContab);
                         if sTipoContrato = 'A' then //Cliente - {Contas a Receber}
                         begin
                            vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                     Trunc(rIdPLanoPrev),
                                                                     Trunc(rIDPatro),
                                                                     CdsRateioxCC.FieldByName('CONTA').AsString,
                                                                     sContaSegregaCriter);
                            if vContab[j].iIdSegregaCriter = -1 then
                               vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                     Trunc(rIdPLanoPrev),
                                                                     Trunc(rIDPatro),
                                                                     sContaD,
                                                                     sContaSegregaCriter);
                         end
                         else
                         begin //Fornecedor - {Contas a Pagar}
                            vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                     Trunc(rIdPLanoPrev),
                                                                     Trunc(rIDPatro),
                                                                     sContaD,
                                                                     sContaSegregaCriter);
                            if vContab[j].iIdSegregaCriter = -1 then
                               vContab[j].iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(CtrlParamIntegra.Plano,
                                                                     Trunc(rIdPLanoPrev),
                                                                     Trunc(rIDPatro),
                                                                     CdsRateioxCC.FieldByName('CONTA').AsString,
                                                                     sContaSegregaCriter);
                         end;

                         vContab[j].iIdPatro     := Trunc(rIdPatro);
                         vContab[j].iIdPlanoPrev := Trunc(rIdPlanoPrev);
                         vContab[j].iUnidNegoc   := CdsRateioxCC.FieldByName('UNIDNEGOC').AsInteger;
                         vContab[j].sConta       := CdsRateioxCC.FieldByName('CONTA').AsString;
                         vContab[j].rValor       := rValor;
                         // Fim    - Rodolpho - P: 18449 - 21/01/2005
                      end;


                      //--------------------------------------------------------------
                      //Grava Parcela Real Contratual por item
                      //--------------------------------------------------------------
                      if (fNumDoc <= 0) and (Length(vAgpItem) < 1) then begin
                         FDbParcelaRealContr.IDParcelaAux := rNumParcelaAux;
                      end;
                      FDbParcelaRealContr.Idcontrato.AsFloat         := cdsDadosContrato.FieldByName('IDCONTRATO').AsFloat;
                      FDbParcelaRealContr.Iditem.AsFloat             := cdsDadosContrato.FieldByName('IDITEM').AsFloat;
                      FDbParcelaRealContr.Idobjeto.AsFloat           := cdsDadosContrato.FieldByName('IDOBJETO').AsFloat;
                      FDbParcelaRealContr.Idpessoa.AsFloat           := F_rIDPessoa;
                      FDbParcelaRealContr.Plncodigo.AsFloat          := rPlnCodigoAux;

                      // Marcio Motta - 21/05/2004 - 16788
                      FDbParcelaRealContr.IdReservaOrcamen.AsFloat   := iIdReservaOrcamen;

                      FDbParcelaRealContr.Datavencparcela.AsDateTime := cdsDadosContrato.FieldByName('DATAVENC').AsDateTime;
                      FDbParcelaRealContr.Datarealparcela.AsDateTime := dDataGeracao;
                      FDbParcelaRealContr.Qtdeparcela.AsFloat        := cdsDadosContrato.FieldByName('QTDEITEM').AsFloat;
                      FDbParcelaRealContr.Vlrmoedacorrente.AsFloat   := cdsDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat;
                      FDbParcelaRealContr.Valorobjparcela.AsFloat    := cdsDadosContrato.FieldByName('VALORUNITARIOOBJETO').AsFloat;
                      FDbParcelaRealContr.Observacao.AsString        := sObs;
                      FDbParcelaRealContr.HistoricoCompl.AsString    := sHistCompl;
                      if not FDbParcelaRealContr.Insert then
                         raise exception.create( FDbParcelaRealContr.MessageInfo );

                      // Atualiza a data da ultima geração nos itens do contrato
                      sSql := 'UPDATE OBJETOSXITEMCONTR '+#13+
                              '   SET DATAULTGERACAO = TO_DATE('''+ FormatDateTime('dd/mm/yyyy',dDataGeracao)+ ''',''dd/mm/yyyy''), '+#13+
                              '       DATAULTVENC    = TO_DATE('''+ FormatDateTime('dd/mm/yyyy',cdsDadosContrato.FieldByName('DATAVENC').AsDateTime)+ ''',''dd/mm/yyyy'') '+#13+
                              ' WHERE IDCONTRATO = '+ cdsDadosContrato.FieldByName('IDCONTRATO').AsString +#13+
                              '   AND IDOBJETO   = '+ cdsDadosContrato.FieldByName('IDOBJETO').AsString   +#13+
                              '   AND IDITEM     = '+ cdsDadosContrato.FieldByName('IDITEM').AsString;
                      if not ExecSQL( sSql ) then raise exception.create( MessageInfo );


                      // Guarda os itens agrupados para gerar o rateio no documento
                      SetLength(vAgpItem,(Length(vAgpItem)+1) );
                      i := High(vAgpItem);
                      vAgpItem[i].IdObjeto  := cdsDadosContrato.FieldByName('IDOBJETO').AsInteger;
                      vAgpItem[i].IdItem    := cdsDadosContrato.FieldByName('IDITEM').AsInteger;
                      vAgpItem[i].IdParcela := FDbParcelaRealContr.Idparcela.AsInteger;
                      vAgpItem[i].VlrObjeto := cdsDadosContrato.FieldByName('VALORTOTALOBJETO').AsCurrency;

                      // acumula o valor total a ser atribuído ao documento
                      iVlrTotDocum := iVlrTotDocum + cdsDadosContrato.FieldByName('VALORTOTALOBJETO').AsFloat;

                      cdsDadosContrato.Next;

                      // Atualiza os parametros para agrupamento
                      AgrupaI.idContrato    := cdsDadosContrato.FieldByName('IDCONTRATO').AsInteger;
                      AgrupaI.idMoeda       := cdsDadosContrato.FieldByName('MOECODIGO').AsInteger;
                      AgrupaI.iCodTipDoc    := cdsDadosContrato.FieldByName('CODTIPDOC').AsInteger;
                      AgrupaI.sCodTipRecDes := cdsDadosContrato.FieldByName('CODTIPRECDES').AsString;
                      AgrupaI.idForCli      := cdsDadosContrato.FieldByName('IDFORCLI').AsInteger;
                      AgrupaI.iCodPortForma := cdsDadosContrato.FieldByName('CODPORTFORMA').AsInteger;
                      AgrupaI.dVencto       := cdsDadosContrato.FieldByName('DATAVENC').AsDateTime;
                      AgrupaI.sCodContrato  := cdsDadosContrato.FieldByName('CODCONTRATOEMPR').AsString;
                      AgrupaI.sCentroRespon := cdsDadosContrato.FieldByName('CODCENTRORESPON').AsString;

                      // Define Observação do documento
                      if sObs = '' then
                           AgrupaI.sObsCapCar := cdsDadosContrato.FieldByName('OBSERVACAO').AsString
                      else AgrupaI.sObsCapCar := sObs;

                      Inc(j);//Bruno Bastos - Pend. 15867 - 28/10/2004
                   end; // Fim do while do agrupamento

                   //------------------------------------------------------------------------
                   // Integração com Orçamento
                   //------------------------------------------------------------------------

                   // Marcio Motta - 21/05/2004 - 16788
                   if iIdReservaOrcamen > 0 then begin
                      Result := IntegraOrcamento(Trunc(iIdReservaOrcamen), iVlrTotDocum);
                      if not Result then
                        raise exception.create( CtrlOrcamento.MessageInfo );
                   end;


                   //------------------------------------------------------------------------
                   //Geração do Documento no CAP/CAR
                   //------------------------------------------------------------------------
                   rCodDocumentoAux := 0;
                   CtrlDocumento.Prepare(OpDocumento,odlEfetivo,sdocAberto);
                   CtrlDocumento.UsaPlanoPatro := F_bUsaPlanoPatro;
                   CtrlDocumento.IdEspAcesso   := F_rIDEspAcesso;
                   CtrlDocumento.IdUsuario     := Trunc(F_rIDUsuario);
                   CtrlDocumento.IdModulo      := Trunc(F_rIDModulo);

                   //Bruno Bastos - Pend. 17963 - 21/10/2004 - Início
                   vLancaMB := nil;
                   bMultiplasContas := CtrlMultiplasContas.BuscaMultiplasContas(vLancaMB, vContab);

                   // Início Pendência : 23048 - Marcos Topini
                   vRateioDocum := nil;
                   // Fim Pendência : 23048

                   If bMultiplasContas Then
                     sContaC := ''
                   Else
                     If sContaC = '' Then
                       sContaC := cdsDadosForCli.FieldByName('CONTA').AsString;

                    j := 0;
                   //Bruno Bastos - Pend. 17963 - 21/10/2004 - Fim

                   CtrlDocumento.SetValues(0,rNumParcelaAux, sCompDoc,
                                           '',sRecPag,'2','', sCodBarra,
                                           //Bruno Bastos - Pend. 17963
                                           sContaC, //Bruno Bastos - Pend. 17963
                                           cdsDadosForCli.FieldByName('CODCENTROCUSTO').AsString,
                                           '',sLinhaDig,'','','','',
                                           AgrupaC.sCodContrato, AgrupaC.sObsCapCar,
                                           AgrupaC.dVencto, dDataGeracao, AgrupaC.dVencto,
                                           0,0,0,0,0,0,0,0,
                                           AgrupaC.iCodTipDoc,
                                           Trunc(F_rIDPessoa),Trunc(F_rIDModulo),
                                           AgrupaC.idForCli,
                                           0,
                                           iContaBanco,
                                           0,
                                           Trunc(cdsDadosForCli.FieldByName('PLANO').AsFloat),0,0,
                                           AgrupaC.idMoeda,
                                           0,0,Trunc(F_rIDUsuario),Trunc(F_rIDPessoa),0,0,
                                           Trunc(cdsDadosForCli.FieldByName('CODSUBCONTA').AsFloat),
                                           AgrupaC.iCodPortForma,
                                           0,0,iIdFormaRecPag,
                                           vLancaMB[j].iIdSegregaCriter);//Bruno Bastos - Pend. 15867 - 28/10/2004

                   CtrlDocumento.Lanctodocum.SetValues(dDtLancamento,0,0,
                                           iVlrTotDocum,0, iVlrTotDocum,0,
                                           Trunc(rPlnCodigoAux),0, Trunc(F_rIDUsuario),
                                           Trunc(F_rIDPessoa),0,0,0,0,0,'2',
                                           '','','', sHistCompl,'','','',sDebCre,
                                           Trunc(F_rIDModulo),
                                           Trunc(cdsDadosForCli.FieldByName('PLANO').AsFloat),
                                           F_bUsaPlanoPatro);

                   // Gera o rateio para os itens/objetos agrupados
                   for i := 0 to Length(vAgpItem) -1 do begin

                      // Filtra o Rateio para o Item / Objeto a ser lançado
                      cdsRateioXCC.Filtered := False;
                      cdsRateioXCC.Filter   := 'IDITEM   = '+ IntToStr(vAgpItem[i].idItem) + ' AND ' +
                                               'IDOBJETO = '+ IntToStr(vAgpItem[i].idObjeto);
                      cdsRateioXCC.Filtered := True;

                      // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                      //                             no último lançamento.
                      iContRateio     := 1;
                      rVlrTotalAux    := 0;
                      iVlrTotalRateio := Trunc( vAgpItem[i].VlrObjeto * 100 );

                      cdsRateioXCC.First;
                      while not cdsRateioXCC.Eof do begin

                        if F_bUsaPlanoPatro then begin
                           rIDPatro     := cdsRateioXCC.FieldByName('IDPATRO').AsFloat;
                           rIDPlanoPrev := cdsRateioXCC.FieldByName('IDPLANOPREV').AsFloat;
                        end else begin
                           rIDPatro     := 0;
                           rIDPlanoPrev := 0;
                        end;

                        rValor := GeralContrato.Arredonda( (vAgpItem[i].VlrObjeto *
                                                            cdsRateioXCC.FieldByName('PERCRATEIOCONTR').AsFloat / 100) ,2);

                        // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                        //                             no último lançamento.
                        // se for o ultimo registro da query colocar o valor restante nela. Usa valor inteiro para evitar sujeira Delphi
                        if iContRateio = CdsRateioxCC.RecordCount then rValor := iVlrTotalRateio / 100;

                        fVlrOrca := 0;
                        if iIdReservaOrcamen > 0 then
                          fVlrOrca := rValor;

                        // Início Pendência : 23048 - Marcos Topini 18/08/2006
                        bNovoLancto := True;
                        for j := 0 to Length(vRateioDocum)-1 do begin
                          if (vRateioDocum[j].sCodTipRecDes     = cdsDadosContrato.FieldByName('CODTIPRECDES').AsString)    and
                             (vRateioDocum[j].sCodCentroRespon  = cdsDadosContrato.FieldByName('CODCENTRORESPON').AsString) and
                             (vRateioDocum[j].iUnidNeg          = cdsRateioXCC.FieldByName('UNIDNEGOC').AsFloat)           and
                             (vRateioDocum[j].iIdReservaOrcamen = Trunc(iIdReservaOrcamen))    and
                             (vRateioDocum[j].sCodCentroCusto   = cdsRateioXCC.FieldByName('CODCENTROCUSTO').AsString)     and
                             (vRateioDocum[j].iIdPatro          = Trunc(rIDPatro))                                              and
                             (vRateioDocum[j].iIdPlanoPrev      = rIDPlanoPrev) then begin

                             vRateioDocum[j].dValorRateio := vRateioDocum[j].dValorRateio + rValor;
                             vRateioDocum[j].dValorOrca   := vRateioDocum[j].dValorOrca   + fVlrOrca;
                             bNovoLancto := False;
                          end;
                        end;

                        if bNovoLancto then begin
                           SetLength(vRateioDocum,(Length(vRateioDocum)+1) );
                           j := High(vRateioDocum);
                           vRateioDocum[j].sCodTipRecDes     := cdsDadosContrato.FieldByName('CODTIPRECDES').AsString;
                           vRateioDocum[j].sCodCentroRespon  := cdsDadosContrato.FieldByName('CODCENTRORESPON').AsString;
                           vRateioDocum[j].iUnidNeg          := Trunc(cdsRateioXCC.FieldByName('UNIDNEGOC').AsFloat);
                           vRateioDocum[j].iIdReservaOrcamen := Trunc(iIdReservaOrcamen);
                           vRateioDocum[j].sCodCentroCusto   := cdsRateioXCC.FieldByName('CODCENTROCUSTO').AsString;
                           vRateioDocum[j].iIdPatro          := Trunc(rIDPatro);
                           vRateioDocum[j].iIdPlanoPrev      := Trunc(rIDPlanoPrev);
                           vRateioDocum[j].dValorRateio      := rValor;
                           vRateioDocum[j].dValorOrca        := fVlrOrca;

                           //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                           vRateioDocum[j].iIdDespesaOrc      := cdsRateioXCC.FieldByName('IdDespesaOrc').AsInteger;
                           vRateioDocum[j].iIdProgramaOrcamen := cdsRateioXCC.FieldByName('IdProgramaOrcamen').AsInteger;
                           // Fim - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

                        end;
                        // Fim Pendência : 23048

                         cdsRateioXCC.Next;

                         // 22/01/04: 15856 - Vinicius: Caso exista diferença de centavos no rateio, acertar
                         //                             no último lançamento.
                         // subtrai o valor rateado do total
                         rVlrTotalAux    := ( rValor * 100 );
                         iVlrAuxRateio   := Trunc( rVlrTotalAux );
                         iVlrTotalRateio := iVlrTotalRateio - iVlrAuxRateio;
                         Inc(iContRateio);

                      end;
                   end;

                   // Início Pendência : 23048 - Marcos Topini
                   for j := 0 to Length(vRateioDocum)-1 do begin
                      //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                      CtrlDocumento.Orcamento.FDO_SetCds(AgrupaC.idForCli,
                                                         dDtLancamento,
                                                         vRateioDocum[j].sCodTipRecDes,
                                                         vRateioDocum[j].sCodCentroCusto,
                                                         vRateioDocum[j].iUnidNeg,
                                                         vRateioDocum[j].iIdPlanoPrev,
                                                         vRateioDocum[j].iIdPatro,
                                                         Trunc(cdsRateioXCC.FieldByName('IDPROGRAMA').AsFloat),
                                                         vRateioDocum[j].dValorRateio,
                                                         vRateioDocum[j].iIdDespesaOrc,
                                                         vRateioDocum[j].iIdProgramaOrcamen//,
                                                         //vRateioDocum[j].iIdReservaOrcamen
                                                         );
                      //FIM - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

                      CtrlDocumento.Rateiodocum.SetValues(vRateioDocum[j].dValorRateio,0,
                                                          vRateioDocum[j].dValorOrca,0,Trunc(F_rIDPessoa),
                                                          0,
                                                          vRateioDocum[j].iUnidNeg,
                                                          0,Trunc(F_rIDUsuario),
                                                          vRateioDocum[j].iIdReservaOrcamen,
                                                          0,Trunc(vRateioDocum[j].iIdPlanoPrev),
                                                          vRateioDocum[j].iIdPatro,
                                                          Trunc(cdsRateioXCC.FieldByName('IDPROGRAMA').AsFloat),
                                                          0,
                                                          Trunc(F_rIDPessoa),
                                                          vRateioDocum[j].sCodTipRecDes,
                                                          sRecPag,
                                                          vRateioDocum[j].sCodCentroRespon,
                                                          vRateioDocum[j].sCodCentroCusto,'',
                                                          //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                          True,
                                                          0,
                                                          0,
                                                          //vRateioDocum[j].iIdDespesaOrc
                                                          //Usa-se o mesmo DataSet pois foi montado com todas as informações
                                                          CtrlDocumento.Orcamento.CdsFDORateio,
                                                          CtrlDocumento.Orcamento.CdsFDORateio
                                                          // Fim - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                          );
                   end;
                   // Fim Pendência : 23048 - Marcos Topini

                   //Bruno Bastos - Pend. 15867 - 28/10/2004 - Início
                   If bMultiplasContas Then
                     For j := 0 to Length(vLancaMB) - 1 do
                     Begin
                       CtrlDocumento.CcBaixasxDocum.SetValues(vLancaMB[j].rValor, 0,
                                                              Trunc(F_rIDPessoa),
                                                              0,
                                                              vLancaMB[j].iUnidNegoc,
                                                              CtrlParamIntegra.Plano,
                                                              vLancaMB[j].iIdPlanoPrev,
                                                              vLancaMB[j].iIdPatro,
                                                              vLancaMB[j].iIdSegregaCriter,
                                                              vLancaMB[j].sConta);
                     End;
                   //Bruno Bastos - Pend. 15867 - 28/10/2004 - Fim

                   if not CtrlDocumento.Insert then
                      raise exception.create( CtrlDocumento.MessageInfo );

                   //---------------------------------------------------------
                   //Imposto Automático
                   //---------------------------------------------------------
                   CtrlImpostoRetido.DataProgramada    := AgrupaC.dVencto;
                   CtrlImpostoRetido.OperacaoDocumento := '2';
                   CtrlImpostoRetido.IdForCli          := AgrupaC.idForCli;
                   CtrlImpostoRetido.CodDocumento      := Trunc(CtrlDocumento.CodDocumento);
                   CtrlImpostoRetido.NumLancto         := CtrlDocumento.Lanctodocum.NumLancto;
                   CtrlImpostoRetido.ValorLancto       := iVlrTotDocum;
                   CtrlImpostoRetido.ValorLiquido      := iVlrTotDocum;
                   CtrlImpostoRetido.DataLancto        := dDtLancamento;
                   CtrlImpostoRetido.DataEmissao       := dDataGeracao;
                   CtrlImpostoRetido.CodTipoDoc        := AgrupaC.iCodTipDoc;
                   CtrlImpostoRetido.IdModulo          := Trunc(F_rIDModulo);
                   CtrlImpostoRetido.IdEmpresa         := Trunc(F_rIDPessoa);
                   CtrlImpostoRetido.IdUsuario         := Trunc(F_rIDUsuario);
                   CtrlImpostoRetido.IdPlanoConta      := Trunc(cdsDadosForCli.FieldByName('PLANO').AsFloat);
                   CtrlImpostoRetido.UsaPlanoPatro     := F_bUsaPlanoPatro;
                   CtrlImpostoRetido.IntegraContab     := ( CtrlParamIntegra.IntegraContab and bContabiliza );
                   CtrlImpostoRetido.RecPag            := sRecPag[1];

                   //DAVID - Retenção de Imposto
                   CtrlImpostoRetido.OnRetencaoINSS     := OnRetencaoINSS;
                   Ctrl          := Self;

                   CtrlImpostoRetido.Incluir;

                   // Atualiza o Código do Documento na tabela de Parcelas
                   for i := 0 to Length(vAgpItem) -1 do begin
                      sSql := 'UPDATE PARCELAREALCONTR '+#13+
                              '   SET CODDOCUMENTO = ' + FloatToStr(CtrlDocumento.CodDocumento) +
                              ' WHERE IDPARCELA    = ' + IntToStr(vAgpItem[i].idParcela);
                      if not ExecSQL( sSql ) then raise exception.create( messageInfo );
                   end;

                   Inc(iQtdeGerado);
                end
                else
                begin
                   cdsDadosContrato.Next;
                end;
             end;

             if iQtdeGerado = 0 then
                raise exception.create('Não existem parcelas a serem geradas no período informado');

             Commit;
          except
             on E:Exception do begin
                Result := False;
                CtrlDocumento.EstornaIntegraOrc(CtrlDocumento.CodDocumento, Trunc(rPlnCodigoAux));   //edilaine SIG95404
                Rollback;
                //DAVID - Retenção de Imposto
                if ( E is EAbort ) then
                  MessageInfo := ''
                else
                  MessageInfo := E.Message;
             end;
          end;
       finally
          cdsDadosContrato.Free;
          cdsDadosForCli.Free;
          cdsRateioXCC.Free;
       end;
    end;
end;



function TCtrlGeracaoContrato.ExcluiParcela(const vParcela: OLEVariant; const sNomeBilhete:String): Boolean;
var cdsParc, cdsTemp : TCMClientDataSet;
    sSql    : String;
    iTotReg, iReg : Integer;
    iCodDocumento : Integer;
begin
   if ConnectionSide = cnsClient then begin
       Result := Connection.AppServer.ExcluiParcela( vParcela, sNomeBilhete );
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
       Result := True;
       StartTransaction;
       try
          try
            cdsTemp := TCMClientDataSet.Create( nil );
            cdsParc := TCMClientDataSet.Create( nil );
            cdsParc.Data := vParcela;

            // Verifica quandos registros serão excluídos
            iTotReg := 0;
            iReg    := 0;
            while not cdsParc.Eof do begin
              if cdsParc.FieldByName('CHKBOX').AsInteger = 1 then Inc(iTotReg);
              cdsParc.Next;
            end;

            // Executa a exclusão para cada parcela da query passada
            iCodDocumento := 0;
            cdsParc.First;
            while not cdsParc.Eof do begin
               if cdsParc.FieldByName('CHKBOX').AsInteger = 1 then begin

                  // Envia o identificador do registro processado para o Cliente
                  Inc(iReg);
                  DoProgresso([sNomeBilhete, 'Excluindo Parcelas...', iReg, iTotReg]);

                  if cdsParc.FieldByName('CODDOCUMENTO').AsInteger <> iCodDocumento then begin
                     // Exclui a Parcela gerada
                     sSql := 'DELETE FROM PARCELAREALCONTR WHERE CODDOCUMENTO = ' +
                              cdsParc.FieldByName('CODDOCUMENTO').AsString;
                     if not ExecSQL( sSql ) then
                        raise Exception.Create( 'Contratos - ' + MessageInfo );

                     // Exclui o Documento
                     // Marcio Motta - 28/05/2004 - 16788
                     CtrlDocumento.IdUsuario    := Trunc(F_rIDUsuario);
                     CtrlDocumento.CodDocumento := cdsParc.FieldByName('CODDOCUMENTO').AsInteger;
                     if not CtrlDocumento.Delete then
                        raise Exception.Create( 'CapCar - ' + CtrlDocumento.MessageInfo );

                     iCodDocumento := cdsParc.FieldByName('CODDOCUMENTO').AsInteger;
                  end;

                  // Busca o vencimento e data de geração da ultima parcela
                  sSql := 'SELECT P.DATAVENCPARCELA, P.DATAREALPARCELA '+#13+
                          '  FROM PARCELAREALCONTR P '+#13+
                          ' WHERE P.IDCONTRATO = ' + cdsParc.FieldByName('IDCONTRATO').AsString +#13+
                          '   AND P.IDOBJETO = ' + cdsParc.FieldByName('IDOBJETO').AsString +#13+
                          '   AND P.IDITEM = ' + cdsParc.FieldByName('IDITEM').AsString +#13+
                          ' ORDER BY DATAVENCPARCELA DESC ';
                  cdsTemp.Data := GetDataPacket( sSql );

                  // Atualiza as datas no objeto
                  if cdsTemp.IsEmpty then begin
                     sSql := 'UPDATE OBJETOSXITEMCONTR '+
                             '   SET DATAULTGERACAO = NULL, ' +
                             '       DATAULTVENC    = NULL  ' +
                             ' WHERE IDCONTRATO = ' + cdsParc.FieldByName('IDCONTRATO').AsString +#13+
                             '   AND IDOBJETO   = ' + cdsParc.FieldByName('IDOBJETO').AsString +#13+
                             '   AND IDITEM     = ' + cdsParc.FieldByName('IDITEM').AsString;
                  end else begin
                     sSql := 'UPDATE OBJETOSXITEMCONTR '+
                             '   SET DATAULTGERACAO = TO_DATE('''+ FormatDateTime('dd/mm/yyyy',cdsTemp.FieldByName('DATAREALPARCELA').AsDateTime)+ ''',''dd/mm/yyyy''), '+
                             '       DATAULTVENC    = TO_DATE('''+ FormatDateTime('dd/mm/yyyy',cdsTemp.FieldByName('DATAVENCPARCELA').AsDateTime)+ ''',''dd/mm/yyyy'')  '+
                             ' WHERE IDCONTRATO   = ' + cdsParc.FieldByName('IDCONTRATO').AsString +#13+
                             '   AND IDOBJETO     = ' + cdsParc.FieldByName('IDOBJETO').AsString +#13+
                             '   AND IDITEM       = ' + cdsParc.FieldByName('IDITEM').AsString;
                  end;
                  if not ExecSQL( sSql ) then raise exception.Create('Contratos - ' + MessageInfo );
               end;
               cdsParc.Next;
            end;
            Commit;
          except
            on e: exception do begin
               MessageInfo := e.Message;
               Result := False;
               Rollback;
            end;
          end;
       finally
          FreeAndNil( cdsParc );
          FreeAndNil( cdsTemp );
       end;
   end;
end;



function TCtrlGeracaoContrato.GeraNumDocumento: Double;
begin
   with TCMClientDataSet.Create(nil) do
   try
      Data := GetDataPacket('SELECT NVL(SEQPARCELAREALCONTR.NEXTVAl,0) AS NUMPARCELA '+
                            '  FROM PARCELAREALCONTR '+
                            ' WHERE (ROWNUM = 1)');
      Result := FieldByName('NUMPARCELA').AsFloat;
   finally
      Free;
   end;
end;

function TCtrlGeracaoContrato.ListUltimaParcela(const iIdContrato: Integer): OLEVariant;
var sSql : String;
begin
   sSql := 'SELECT P.CODDOCUMENTO, P.DATAVENCPARCELA, P.OBSERVACAO, '+#13+
           '       P.HISTORICOCOMPL, D.CODFORMA '+#13+
           '  FROM PARCELAREALCONTR P, '+#13+
           '       DOCUMENTO D '+#13+
           ' WHERE P.CODDOCUMENTO = D.CODDOCUMENTO '+#13+
           '   AND P.IDMEDICAO IS NULL '+#13+
           '   AND P.IDCONTRATO = ' + IntToStr(iIdContrato) +#13+
           ' ORDER BY DATAVENCPARCELA DESC, CODDOCUMENTO DESC ';

   Result := GetDataPacket( sSql );
end;

function TCtrlGeracaoContrato.ListParcelaGerada(const iIdContrato: Integer; const bSemBaixa: Boolean;
                                                const dIni, dFim, dGeracao: TDateTime): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdContrato <> -1 then sParam := sParam + ' AND P.IDCONTRATO = ' + IntToStr(iIdContrato);
  if dIni > 0     then sParam := sParam + ' AND P.DATAVENCPARCELA >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dIni)) + ',''DD/MM/YYYY'') ';
  if dFim > 0     then sParam := sParam + ' AND P.DATAVENCPARCELA <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dFim)) + ',''DD/MM/YYYY'') ';
  if dGeracao > 0 then sParam := sParam + ' AND P.DATAREALPARCELA  = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dGeracao)) + ',''DD/MM/YYYY'') ';

  if bSemBaixa then begin
    sParam := sParam + ' AND P.CODDOCUMENTO NOT IN( SELECT DISTINCT CODDOCUMENTO '+#13+
                       '                              FROM LANCTODOCUM '+#13+
                       '                             WHERE RTRIM(OPERACAO) = ''5'' ) ';
  end;

  // Define Sql
  sSql := 'SELECT 0 AS CHKBOX, ' +#13+
          '       P.IDCONTRATO, P.IDPARCELA, P.IDITEM, P.IDOBJETO, '+#13+
          '       P.PLNCODIGO, P.CODDOCUMENTO, '+#13+
          '       P.DATAVENCPARCELA, P.VLRMOEDACORRENTE, '+#13+
          '       C.NOMECONTRATO, O.NOMEOBJETO, I.NOME_ITEM, '+#13+
          '       DECODE(D.COMPLDOCUMENTO, NULL, TO_CHAR(D.NODOCUMENTO), '+#13+
          '              TO_CHAR(D.NODOCUMENTO) || ''/'' || D.COMPLDOCUMENTO) AS NODOCUMENTO '+#13+
          '  FROM PARCELAREALCONTR P, CONTRATOCONTR C, DOCUMENTO D, '+#13+
          '       OBJETOCONTRATUAL O, ITEMCONTRATUAL I '+#13+
          ' WHERE P.IDMEDICAO IS NULL '+#13+
          '   AND P.CODDOCUMENTO = D.CODDOCUMENTO '+#13+
          '   AND P.IDCONTRATO = C.IDCONTRATO '+#13+
          '   AND P.IDOBJETO   = O.IDOBJETO   '+#13+
          '   AND P.IDITEM     = I.IDITEM     '+#13+ sParam +#13+

          // Marchetti - Pendencia 16957
          '   AND (P.FLGESTORNADO IS NULL OR P.FLGESTORNADO = 0) ' + #13 +
          // Fim pendencia 16957
          
          ' ORDER BY C.NOMECONTRATO, P.DATAVENCPARCELA ';

  Result := GetDataPacket( sSql );
end;


function TCtrlGeracaoContrato.IntegraOrcamento(iIdReservaOrcamen: Int64; fValor: Double): Boolean;
var
  iNumCompromisso, iRetorno: integer;
begin
// Marcio Motta - 28/05/2004 - 16788
  iRetorno := 0;
  Result   := True;
  try
    CtrlOrcamento.IdEmpresa  := Trunc(F_rIDPessoa);
    CtrlOrcamento.IdUsuario  := Trunc(F_rIDUsuario);
    CtrlOrcamento.IdReserva  := iIdReservaOrcamen;
    CtrlOrcamento.NumReserva := CtrlOrcamento.BuscaIdNumReserva(CtrlOrcamento.IdReserva, 0, True);

    if CtrlOrcamento.NumReserva <= 0 then
      raise Exception.Create( CtrlOrcamento.MessageInfo );

    iNumCompromisso := CtrlOrcamento.NumReserva;
    iRetorno := CtrlOrcamento.EfetivaCompromisso(iNumCompromisso, fValor, True);

    if iRetorno > 0 then
      raise Exception.Create( CtrlOrcamento.MessageInfo );

   except
     on e:Exception do begin
       Result := False;
       MessageInfo := e.Message;
      end;
   end;
end;

function TCtrlGeracaoContrato.EstornaParcela(const vParcela: OLEVariant; const sNomeBilhete: String): Boolean;
var cdsParc, cdsTemp : TCMClientDataSet;
    sSql    : String;
    iTotReg, iReg : Integer;
    iCodDocumento : Integer;
    iNumLanc      : Int64;
begin
   if ConnectionSide = cnsClient then begin
       Result := Connection.AppServer.EstornaParcela( vParcela, sNomeBilhete );
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
       Result := True;
       StartTransaction;
       try
          try
            cdsTemp := TCMClientDataSet.Create( nil );
            cdsParc := TCMClientDataSet.Create( nil );
            cdsParc.Data := vParcela;

            // Verifica quandos registros serão estornados
            iTotReg := 0;
            iReg    := 0;
            while not cdsParc.Eof do begin
              if cdsParc.FieldByName('CHKBOX').AsInteger = 1 then Inc(iTotReg);
              cdsParc.Next;
            end;

            iCodDocumento := 0;
            cdsParc.First;
            while not cdsParc.Eof do begin
               if cdsParc.FieldByName('CHKBOX').AsInteger = 1 then begin

                  // Envia o identificador do registro processado para o Cliente
                  Inc(iReg);
                  DoProgresso([sNomeBilhete, 'Estornando Parcelas...', iReg, iTotReg]);

                  if cdsParc.FieldByName('CODDOCUMENTO').AsInteger <> iCodDocumento then begin
                     // Exclui a Parcela gerada
                     sSql := 'UPDATE PARCELAREALCONTR SET FLGESTORNADO = 1 WHERE CODDOCUMENTO = ' +
                              cdsParc.FieldByName('CODDOCUMENTO').AsString;
                     if not ExecSQL( sSql ) then
                        raise Exception.Create( 'Contratos - ' + MessageInfo );


                     CtrlDocumento.Prepare( OpDocumento, odlEfetivo );

                     CtrlDocumento.IdUsuario     := Trunc(F_rIDUsuario);
                     CtrlDocumento.CodDocumento  := cdsParc.FieldByName('CODDOCUMENTO').AsInteger;
                     CtrlDocumento.IdEspAcesso   := F_rIDEspAcesso;
                     CtrlDocumento.IdModulo      := Trunc(F_rIDModulo);
                     CtrlDocumento.UsaPlanoPatro := F_bUsaPlanoPatro;

                     iNumLanc                    := 0;

                     if not CtrlDocumento.Estornar(Date,
                                                   Sistema.IdModulo,
                                                   Sistema.IdEmpresa,
                                                   Sistema.IdUsuario,
                                                   cdsParc.FieldByName('CODDOCUMENTO').AsInteger,
                                                   iNumLanc,
                                                   0,
                                                   F_bUsaPlanoPatro
                                                  ) then
                        raise Exception.Create( 'CapCar - ' + CtrlDocumento.MessageInfo );

                     iCodDocumento := cdsParc.FieldByName('CODDOCUMENTO').AsInteger;
                  end;

                  // Busca o vencimento e data de geração da ultima parcela
                  sSql := 'SELECT P.DATAVENCPARCELA, P.DATAREALPARCELA '+#13+
                          '  FROM PARCELAREALCONTR P '+#13+
                          ' WHERE P.IDCONTRATO = ' + cdsParc.FieldByName('IDCONTRATO').AsString +#13+
                          '   AND P.IDOBJETO = ' + cdsParc.FieldByName('IDOBJETO').AsString +#13+
                          '   AND P.IDITEM = ' + cdsParc.FieldByName('IDITEM').AsString +#13+
                          '   AND (P.FLGESTORNADO IS NULL OR P.FLGESTORNADO = 0) '+ #13 +
                          ' ORDER BY DATAVENCPARCELA DESC ';
                  cdsTemp.Data := GetDataPacket( sSql );

                  // Atualiza as datas no objeto
                  if cdsTemp.IsEmpty then begin
                     sSql := 'UPDATE OBJETOSXITEMCONTR '+
                             '   SET DATAULTGERACAO = NULL, ' +
                             '       DATAULTVENC    = NULL  ' +
                             ' WHERE IDCONTRATO = ' + cdsParc.FieldByName('IDCONTRATO').AsString +#13+
                             '   AND IDOBJETO   = ' + cdsParc.FieldByName('IDOBJETO').AsString +#13+
                             '   AND IDITEM     = ' + cdsParc.FieldByName('IDITEM').AsString;
                  end else begin
                     sSql := 'UPDATE OBJETOSXITEMCONTR '+
                             '   SET DATAULTGERACAO = TO_DATE('''+ FormatDateTime('dd/mm/yyyy',cdsTemp.FieldByName('DATAREALPARCELA').AsDateTime)+ ''',''dd/mm/yyyy''), '+
                             '       DATAULTVENC    = TO_DATE('''+ FormatDateTime('dd/mm/yyyy',cdsTemp.FieldByName('DATAVENCPARCELA').AsDateTime)+ ''',''dd/mm/yyyy'')  '+
                             ' WHERE IDCONTRATO   = ' + cdsParc.FieldByName('IDCONTRATO').AsString +#13+
                             '   AND IDOBJETO     = ' + cdsParc.FieldByName('IDOBJETO').AsString +#13+
                             '   AND IDITEM       = ' + cdsParc.FieldByName('IDITEM').AsString;
                  end;
                  if not ExecSQL( sSql ) then raise exception.Create('Contratos - ' + MessageInfo );
               end;
               cdsParc.Next;
            end;
            Commit;
          except
            on e: exception do begin
               MessageInfo := e.Message;
               Result := False;
               Rollback;
            end;
          end;
       finally
          FreeAndNil( cdsParc );
          FreeAndNil( cdsTemp );
       end;
   end;
end;

function OnRetencaoINSS( IdForCli : integer; DataRetencao : TDateTime;
                         VlTeto, VlAnterior : Double;
                         var VlImposto, VlOutros : Double ) : boolean;
var
  cdsNomeFornec      : TCMClientDataSet;
  CdsCfgINSS         : TCMClientDataSet;
  sChave: string;
  VlTotal : Double;
begin
  cdsNomeFornec    := TCMClientDataSet.Create(nil);
  CdsCfgINSS       := TCMClientDataSet.Create(nil);
  Result := True;
  try

    sChave := IntToStr( IdForCli ) + ';' + FormatDateTime( 'yyyymm', DataRetencao );

    if strINSSRetidosEmOutros.IndexOf( sChave ) = -1 then
    begin
      cdsNomeFornec.Data := Ctrl.GetDataPacket(
       ' select NOME                                  ' +
       ' from   EMPRESAFORN E,                        ' +
       '        PESSOA P                              ' +
       ' where  E.IDFORCLI = P.IDPESSOA               ' +
       '   and  E.IDFORCLI = ' + IntToStr( IdForCli ) );

      if Assigned( Ctrl.OnRecuperaOutros ) then
      begin
        if Ctrl.OnRecuperaOutros( cdsNomeFornec.FieldByName('NOME').AsString,
                                  DataRetencao,
                                  VlOutros ) then
        begin
          strINSSRetidosEmOutros.Add( sChave );
        end
        else
        begin
          Result := False;
          Abort;
        end;
      end;
    end;

    //Cálculo efetivo do imposto (respeitando o teto)

    //Calcula o total (desconsiderando o teto)
    VlTotal := VlAnterior + VlOutros + VlImposto;

    //Se o total ultrapassar o teto, recebe o teto
    if VlTotal > VlTeto then
      VlTotal := VlTeto;

    //Indica o valor do imposto real
    VlImposto   := VlTotal - ( VlAnterior + VlOutros );

    //Se for negativo, zera
    if VlImposto < 0 then VlImposto := 0;

  finally
    cdsNomeFornec.Free;
    CdsCfgINSS.Free;
  end;
end;


end.
