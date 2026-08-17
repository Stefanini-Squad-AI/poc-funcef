{---------------------------------------------------------------------------------------------------
Nº SIG......: 113136 
Data........: 04/07/2022  
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
Rotina...........: EfetuaRemembramento
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
---------------------------------------------------------------------------------------------------
Rotina......: RemembramentoAtivoFixo
Nº SOL......: 153539
Nº KINTANA..: 1159566
Data........: 23/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para não verificar a quantidade mínima de bens por imóvel.
---------------------------------------------------------------------------------------------------}

unit uCtrlRemembramento;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, dbClient, provider, stdctrls,
  uCMClientDataSet, uCMTypes, Windows, JCLSysUtils, JCLStrings, uCMMath, uDiasUteis, uFuncoesImob,
  uComunsImobiliario, uCAF, uCtrlMovRemembramento, uCtrlEventoImovel, uCtrlConjunto, uModuloImobiliario,
  uCtrlImobObra, // Vando - SOL 154328-5901 / KTN 1373449
  uCtrlProvisaoImovel, uCtrlHistMovBem, uCtrlImobCAFxContab, DCAF;



  type

     TCtrlRemembramento = class(TCmControlObject)

     protected
       procedure onCreateAppServer; override;
       procedure AfterInitialize; override;

     private
       iConjunto          : Integer;
       _cds               : TCMClientDataSet;
       DiasUteis          : TDiasUteis;
       ParamSistema       : TParamSistema;

       CtrlMovRemembramento : TCtrlMovRemembramento;
       CtrlConjunto         : TCtrlConjunto;
       CtrlEventoImovel     : TCtrlEventoImovel;
       CtrlCafObra          : TCtrlImobObra;      // Vando - SOL 154328-5901 / KTN 1373449
       CtrlProvisaoImovel   : TCtrlProvisaoImovel; //Cássio Rovaroto - SIG nº 113136
       aHistMovBem         : array of Extended;
       iaHistMovBem         : Integer;
       HistMovBem           : TCtrlHistMovBem;
       CtrlCAFxContab   : TCtrlImobCAFxContab;

       function  CriaImoveisEConjuntos(cdsImovelResult,
                                       cdsBens : TCMClientDataSet;
                                       dDataOper : TDateTime;
                                       IDEmpresa : Integer;
                                       sMestre : String;
                                       sListaImovel : string = ''): ShortInt;      // Vando - SOL 154328-5901 / KTN 1373449

       function  PreenchePlacaCAF(IDEmpresa, IDImovel : Integer; cdsBens : TCMClientDataSet) : shortint;
       function  RemembramentoAtivoFixo(IDModulo, IDEmpresa, IDUsuario : Integer; dDataMov : TDateTime; cdsBens : TCMClientDataSet): ShortInt;
       function  ConsolidaImoveis(IDEmpresa,
                                  IDImovel,
                                  IDUsuario,
                                  iEvento : Integer;
                                  fAreaTotal : Extended;
                                  dDataMov : TDateTime;
                                  sEvento : String;
                                  cdsImoveis,
                                  cdsImovelResult,
                                  cdsBens : TCMClientDataSet): shortint;


       // Utilizado no Estorno de Remembramento
       function ExcluiImovelXBem(const IDEmpresa, IDImovel : Integer) : boolean;
       function ExcluiImoveis(const IDEmpresa, IDConjunto, IDImovelIni, IDImovelFim, IDEventoIni, IDEventoFim : Integer) : Boolean;

     public
       constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
       destructor Destroy; override;

       // Utilizado no Remembramento
       function ListaImovelMestre : OleVariant;
       function ListaImovelAtivo(const iIDImovelMestre : Integer)  : OleVariant;
       function ListaTipoImovel : OleVariant;
       function ListaBemImovel(const sListaImovel : String): OleVariant;

       function ListaImovelVazio : OleVariant;
       function ListaBemResult(IDEmpresa : Integer) : OleVariant;

       function RetornaSaldoContabil(const iIDImovel : Integer; dDataFim : TDateTime) : Extended;
       function ImovelAlugado(const iIDImovel : Int64) : Boolean;

       function EfetuaRemembramento(IDModulo        : Integer;
                                    IDEmpresa       : Integer;
                                    IDUsuario       : Integer;
                                    dDataMov        : TDateTime;
                                    sEvento         : String;
                                    sMestre         : String;
                                    fAreaTotal      : Extended;
                                    cdsImovelResult :TCMClientDataSet;
                                    cdsImoveis      : TCMClientDataSet;
                                    cdsBensOrigem   : TCMClientDataSet;
                                    cdsBens         : TCMClientDataSet
                                   ) : Boolean;

       // Utilizado no Estorno de Remembramento
       function ListaImoveisRemembrados(const IDImovel : Integer) : OleVariant;
       function ListaEventoImovel(const IDEvento : Integer) : OleVariant;
       function ListaImovelXBem(const IDImovel : Integer) : OleVariant;

       function EstornaRemembramento(const IDEmpresa, IDModulo, IDUsuario : Integer; cdsImoveisOriginais, cdsImovelXBem, cdsEventoImovel: TCMClientDataSet) : boolean;

       //Função que retorna query com os valores dos percentuais de Segregação dos Novo Imóveis gerado pelo Remembramento
       function ListaPercentuaisSegergacao(sIdImovel : string) : OleVariant;
       function RemembraProvisaoCusto(iIdModulo, iIdEmpresa, iIdUsuario : Integer;
                                      dDataMov: TDateTime; iImovelResult: Integer;
                                      sSegmentoResult: string;
                                      cdsBensOrigem, cdsBens: TCMClientDataSet;
                                      bIntegraContab: Boolean = True): Shortint;
      function EstornaRemembraProvisaoCusto(iIdUsuario, iIdModulo, iIdEmpresa: Integer; dDataMov: TDateTime; cdsImoveisOrigem: TCMClientDataSet): Boolean;
  end;


implementation



{ TCtrlRemembramento }



procedure TCtrlRemembramento.AfterInitialize;
begin
   inherited;
   DiasUteis.InitializeAs( Self );
   CtrlMovRemembramento.InitializeAs(Self);
   CtrlConjunto.InitializeAs(Self);
   CtrlEventoImovel.InitializeAs(Self);
   CtrlCafObra.InitializeAs(self);      // Vando - SOL 154328-5901 / KTN 1373449
   CtrlProvisaoImovel.InitializeAs(Self);  
end;



constructor TCtrlRemembramento.Create(const iIdEmpresa, iIdModulo,iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
   inherited Create;
   DiasUteis          := TDiasUteis.Create;
   // Carrega Variáveis Globais

   ParamSistema.idEmpresa     := iIdEmpresa;
   ParamSistema.idModulo      := iIdModulo;
   ParamSistema.idUsuario     := iIdUsuario;
   ParamSistema.idEspAcesso   := iIdEspAcesso;
   ParamSistema.UsaPlanoPatro := bUsaPlanoPatro;
   _cds                       := TCMClientDataSet.Create(nil);

   CtrlMovRemembramento       := TCtrlMovRemembramento.Create;
   CtrlConjunto               := TCtrlConjunto.Create;
   CtrlEventoImovel           := TCtrlEventoImovel.Create;
   CtrlCafObra                := TCtrlImobObra.create;      // Vando - SOL 154328-5901 / KTN 1373449
   //Cássio Rovaroto - SIG nº 113136 - Início
   CtrlProvisaoImovel         := TCtrlProvisaoImovel.Create;
   HistMovBem                 := TCtrlHistMovBem.Create;
   CtrlCAFxContab             := TCtrlImobCAFxContab.Create;
   //Cássio Rovaroto - SIG nº 113136 - Fim
end;



destructor TCtrlRemembramento.Destroy;
begin
   FreeAndNil(DiasUteis);
   FreeAndNil(CtrlMovRemembramento);
   FreeAndNil(CtrlConjunto);
   FreeAndNil(CtrlEventoImovel);
   FreeAndNIl(CtrlCafObra);      // Vando - SOL 154328-5901 / KTN 1373449
   FreeAndNil(CtrlProvisaoImovel); //Cássio Rovaroto - SIG nº 113136
   FreeAndNil(HistMovBem); //Cássio Rovaroto - SG nº 113136
   _cds.Free;
   inherited;
end;



procedure TCtrlRemembramento.onCreateAppServer;
begin
   inherited;
end;



function TCtrlRemembramento.ListaImovelMestre: OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT '                                 + #13 +
   '   IM.IMONOME, '                         + #13 +
   '   IM.IMONOMEENDERECO, '                 + #13 +
   '   IM.IMOLOGRADOURO, '                   + #13 +
   '   IM.IMOBAIRRO, '                       + #13 +
   '   C.NOME, '                             + #13 +
   '   C.UF, '                               + #13 +
   '   IM.IDIMOVEL '                         + #13 +
   'FROM '                                   + #13 +
   '   IMOVEL IM, '                          + #13 +
   '   CIDADES C '                           + #13 +
   'WHERE '                                  + #13 +
   '    ( IM.FLGTIPOIMOVEL = 0 ) '           + #13 +
   'AND ( IM.FLGATIVO = ''1'' ) '            + #13 +
   'AND ( IM.IDCIDADES = C.IDCIDADES(+) ) '  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRemembramento.ListaImovelAtivo(const iIDImovelMestre : Integer): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT '                                               + #13 +
   '   0 AS FLGSELECAO, '                                  + #13 +
   '   I.IMONOME, '                                        + #13 +
   '   I.IMOCODIGO, '                                      + #13 +
   '   I.IMONOMEENDERECO, '                                + #13 +
   '   I.IMOLOGRADOURO, '                                  + #13 +
   '   I.IMOBAIRRO, '                                      + #13 +
   '   I.IDIMOVEL, '                                       + #13 +
   '   I.IMONOME, '                                        + #13 +
   '   I.CODTIPIMOVEL, '                                   + #13 +
   '   I.IDCARTEIRAINVEST, '                               + #13 +
   '   I.IMOCODIGO, '                                      + #13 +
   '   I.IMOAREA, '                                        + #13 +
   '   I.FLGTIPOIMOVEL, '                                  + #13 +
   '   I.CODSUBCONTA, '                                    + #13 +
   '   I.FLGSTATUS, '                                      + #13 +
   '   I.FLGATIVO, '                                       + #13 +
   '   0 AS SUMVALCTB'                                     + #13 +
   'FROM '                                                 + #13 +
   '   IMOVEL I '                                          + #13 +
   'WHERE '                                                + #13 +
   '     I.IDIMOVELMESTRE = ' + IntToStr(iIDImovelMestre)  + #13 +
   'AND  I.FLGATIVO = 1 '                                  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRemembramento.ListaTipoImovel: OleVariant;
var sSQl : String;
begin
   sSQL :=
   'SELECT '                                                                       + #13 +
   '   TI.CODTIPIMOVEL,'                                                           + #13 +
   '   TI.DESCTIPOIMOVEL,'                                                         + #13 +
   '   TI.IDGRUPOTERRENO,'                                                         + #13 +
   '   TI.IDGRUPOEDIFICACAO,'                                                      + #13 +
   '   TI.IDGRUPOINST,'                                                            + #13 +
   '   TI.IDGRUPOELET,'                                                            + #13 +
   '   TI.IDGRUPOAR,'                                                              + #13 +
   '   TI.IDGRUPOVEICULO,'                                                         + #13 +
   '   TI.IDGRUPOUTILITARIO,'                                                      + #13 +
   '   TI.IDGRUPOMAQUINA,'                                                         + #13 +
   '   TI.IDGRUPOMOVEL,'                                                           + #13 +
   '   TI.CODALTMULTA,'                                                            + #13 +
   '   TI.CODALTJUROS,'                                                            + #13 +
   '   TI.CODALTCORRMON,'                                                          + #13 +
   '   TAM.DESCRICAO AS ALTERADOR_MULTA,'                                          + #13 +
   '   TAJ.DESCRICAO AS ALTERADOR_JUROS,'                                          + #13 +
   '   TAR.DESCRICAO AS ALTERADOR_CORRECAO'                                        + #13 +
   'FROM'                                                                          + #13 +
   '   TIPOIMOVEL TI, TIPOALTERADOR TAM, TIPOALTERADOR TAJ, TIPOALTERADOR TAR'     + #13 +
   'WHERE'                                                                         + #13 +
   '       ( TI.CODALTMULTA = TAM.CODALTERADOR(+) )'                               + #13 +
   '   AND ( TI.CODALTJUROS = TAJ.CODALTERADOR(+) )'                               + #13 +
   '   AND ( TI.CODALTCORRMON = TAR.CODALTERADOR(+) )'                             + #13 +
   'ORDER BY'                                                                      + #13 +
   '   DESCTIPOIMOVEL'                                                             + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRemembramento.ListaBemImovel(const sListaImovel : String): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                        + #13 +
   '   VW.IDIMOVEL, VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.IMOVEL_EXTENSO,'            + #13 +
   '   VW.IDBEM, VW.PLACA, VW.DESBEM, VW.IXBGRUPO,'                                + #13 +
   '   VW.IMOCODIGO, VW.IMOMATRICULA,'                                             + #13 +
   '   VW.CODTIPIMOVEL, VW.DESCTIPOIMOVEL,'                                        + #13 +
   '   VW.FLGATIVO, VW.STATUS_IMOVEL, VW.FLGSTATUSOCUPACAO, VW.FLGSEMPLACA,'       + #13 +
   '   VW.IDLOCALIZACAO, VW.IDRESPONSAVEL,'                                        + #13 +
   '   VW.IMOAREA, VW.IMOAREAGERENCIAL, VW.IMOFRACAOIDEAL, VW.IMOPERCENTRATEIO,'   + #13 +
   '   VW.IMOMOEDACOMPRA, VW.IMOVLRCOMPRA, VW.IMODATACOMPRA, VW.MOEDA_COMPRA,'     + #13 +
   '   VW.IMOMOEDAREAVAL, VW.IMOVLRREAVAL, VW.IMODATAREAVAL, VW.MOEDA_REAVAL,'     + #13 +
   '   VW.IMOMOEDAMERCADO, VW.IMOVLRMERCADO, VW.IMODATAMERCADO, VW.MOEDA_MERCADO,' + #13 +
   '   VW.CONTROLE, VW.BAIXATOTAL, VW.DTAINCLUSAO,'                                + #13 +
   '   VW.FLGDEPREC, VW.DATAULTDEP, VW.DATAINICIODEP, VW.TAXADEP, VW.IDGRUPO,'     + #13 +
   '   VW.IDCLASSEBEM, VW.VALHISTORICO, VW.NOMEFORN,'                              + #13 +
   '   VW.CODGRUPO, VW.DESCGRUPO, VW.TIPOGRUPO,'                                   + #13 +
   '   VW.CODCENTROCUSTO, VW.DESCCCUSTO, VW.TIPOCCUSTO,'                           + #13 +
   '   VW.CODCLASSEBEM, VW.DESCCLASSEBEM, VW.TIPOCLASSEBEM,'                       + #13 +
   '   VW.DESCCONJUNTO, VW.IDCONJUNTO, VW.DESCLOCAL, VW.NOMERESP,'                 + #13 +
   '   0 AS SUMVALCTB'                                                             + #13 +
   'FROM'                                                                          + #13 +
   '   VWBEMXIMOVEL VW'                                                            + #13 +
   'WHERE'                                                                         + #13 +
   '       VW.IDIMOVEL IN ( ' + sListaImovel + ')'                                 + #13 +
   'AND    VW.BAIXATOTAL = ''N'' '                                                 + #13 +
   'ORDER BY'                                                                      + #13 +
   '   VW.NOME_MESTRE, VW.NOME_IMOVEL, VW.DESBEM'                                  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRemembramento.ListaImovelVazio: OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                               + #13 +
   '   0 AS IDIMOVELMESTRE, '                                                              + #13 +
   '   0 AS IDIMOVEL_RESULT, '                                                             + #13 +
   '   0 AS NO_IMOVEL_RESULT, '                                                            + #13 +
   '   ''                                                            '' AS NOME_IMOVEL, '  + #13 +
   '   0 AS PERCENT_DESMEMBRA, '                                                           + #13 +
   '   0 AS CC_DESMEMBRA, '                                                                + #13 +
   '   ''                         '' AS CODTIPIMOVEL, '                                    + #13 +
   '   0 AS IDEVENTO_RESULT '                                                              + #13 +
   'FROM '                                                                                 + #13 +
   '   IMOVEL '                                                                            + #13 +
   'WHERE '                                                                                + #13 +
   '   IDIMOVEL = 0 '                                                                      + #13;

   Result := GetDataPacket(sSQL);
end;




function TCtrlRemembramento.RetornaSaldoContabil(const iIDImovel : Integer; dDataFim : TDateTime): Extended;
begin
   Result := CAF.SaldoContabilImovel(iIDImovel, -1, dDataFim);
end;



function TCtrlRemembramento.ImovelAlugado(const iIDImovel: Int64): Boolean;
var sSQL : String;
begin
   sSQL   :=
   'SELECT'                                        + #13 +
   '   I.IMONOME,'                                 + #13 +
   '   I.IMOCODIGO,'                               + #13 +
   '   CX.IDCONTRATOIMOVEL,'                       + #13 +
   '   I.IDIMOVEL,'                                + #13 +
   '   I.IMONOME,'                                 + #13 +
   '   I.FLGATIVO,'                                + #13 +
   '   I.CODTIPIMOVEL'                             + #13 +
   'FROM'                                          + #13 +
   '   IMOVEL I,'                                  + #13 +
   '   CONTRATOXIMOVEL CX,'                        + #13 +
   '   CONTRATOIMOVEL C'                           + #13 +
   'WHERE'                                         + #13 +
   '    I.IDIMOVEL = ' + IntToStr(iIDImovel)       + #13 +
   'AND I.IDIMOVEL = CX.IDIMOVEL'                  + #13 +
   'AND CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'  + #13 +
   'AND C.FLGSTATUS = ''V'''                       + #13 +
   'AND I.FLGATIVO = 1'                            + #13 +
   'AND C.FLGTIPOCONTRATO = ''L'''                 + #13;

   _cds.Data := GetDataPacket(sSQL);

   Result := (not _cds.IsEmpty);
end;



function TCtrlRemembramento.ListaBemResult(IDEmpresa: Integer): OleVariant;
var sSQL : String;
begin
   sSQL :=
   'SELECT B.IDBEM,'                               + #13 +
   '       B.PLACA,'                               + #13 +
   '       B.DESBEM,'                              + #13 +
   '       B.IDCLASSEBEM,'                         + #13 +
   '       B.IDSITUACAO,'                          + #13 +
   '       B.IDCONJUNTO,'                          + #13 +
   '       C.DESCCONJUNTO,'                        + #13 +
   '       C.IDLOCALIZACAO,'                       + #13 +
   '       C.IDRESPONSAVEL, '                      + #13 +
   '       L.NOME AS DESCLOCAL,'                   + #13 +
   '       B.IDGRUPO,'                             + #13 +
   '       G.NOME AS DESCGRUPO,'                   + #13 +
   '       '' '' AS IXBGRUPO, '                    + #13 +
   '       B.PROPBAIXA, '                          + #13 +
   // Marchetti - Pendencia 27080
   '       G.FLGSEMPLACA '                         + #13 +
   // Fim Marchetti - Pendencia 27080
   'FROM BEM B,'                                   + #13 +
   '     CONJUNTO C,'                              + #13 +
   '     LOCALIZACAO L,'                           + #13 +
   '     PLANOGRUPO PG,'                           + #13 +
   '     GRUPO G'                                  + #13 +
   'WHERE B.IDBEM = -1'                            + #13 +
   '  AND B.IDPESSOA = '  + IntToStr(IDEmpresa)    + #13 +
   '  AND C.IDPESSOA = '  + IntToStr(IDEmpresa)    + #13 +
   '  AND L.IDPESSOA = '  + IntToStr(IDEmpresa)    + #13 +
   '  AND PG.IDPESSOA = ' + IntToStr(IDEmpresa)    + #13 +
   '  AND B.IDCONJUNTO = C.IDCONJUNTO'             + #13 +
   '  AND B.IDPESSOA = C.IDPESSOA'                 + #13 +
   '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'       + #13 +
   '  AND C.IDPESSOA = L.IDPESSOA'                 + #13 +
   '  AND B.IDGRUPO = PG.IDGRUPO'                  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRemembramento.EfetuaRemembramento(IDModulo        : Integer;
                                                IDEmpresa       : Integer;
                                                IDUsuario       : Integer;
                                                dDataMov        : TDateTime;
                                                sEvento         : String;
                                                sMestre         : String;
                                                fAreaTotal      : Extended;
                                                cdsImovelResult :TCMClientDataSet;
                                                cdsImoveis      : TCMClientDataSet;
                                                cdsBensOrigem   : TCMClientDataSet;
                                                cdsBens         : TCMClientDataSet
                                               ) : Boolean;
var
    iResult       : Integer;
    iEventoOrigem : Integer;
    sSQL          : String;
    sListaImovel  : string;   // Vando - SOL 154328-5901 / KTN 1373449
begin

   StartTransaction;

   try

      CtrlMovRemembramento.cdsSelBens      := cdsBensOrigem;
      CtrlMovRemembramento.OpenTransaction := False;

      // Cria uma lista dos imoveis
      // Vando - SOL 154328-5901 / KTN 1373449
      sListaImovel := '';
      cdsImoveis.DisableControls;
      cdsImoveis.Filtered := False;
      cdsImoveis.First;
      while not cdsImoveis.eof do
      begin
         if sListaImovel <> '' then sListaImovel := sListaImovel  + ',';
         sListaImovel := sListaImovel + cdsImoveis.FieldByName('IDIMOVEL').AsString;
         cdsImoveis.Next;
      end;
      cdsImoveis.First;
      cdsImoveis.EnableControls;
      // Vando - SOL 154328-5901 / KTN 1373449 - fim

      // Cria o Imóvel remembrado no banco
      iResult := CriaImoveisEConjuntos(cdsImovelResult, cdsBens, dDataMov, IDEmpresa, sMestre, sListaImovel);

      // Cria Placa para os bens resultantes
      if iResult = 0 then iResult := PreenchePlacaCAF(IDEmpresa,
                                                      cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsInteger,
                                                      cdsBens);

      // Atualiza o IMOCODIGO
      if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) and (iResult = 0) then
      begin
         cdsBens.First;
         sSQL :=
         'UPDATE '                                                                       + #13 +
         '   IMOVEL '                                                                    + #13 +
         'SET '                                                                          + #13 +
         '   IMOCODIGO = ' + Copy(cdsBens.FieldByName('PLACA').AsString,2,6)             + #13 +
         'WHERE '                                                                        + #13 +
         '   IDIMOVEL = ' + cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsString      + #13;
         ExecSql(sSQL);
      end;

      // Executa o Remembramento no CAF
      if iResult = 0 then iResult := RemembramentoAtivoFixo(IDModulo,IDEmpresa,IDUsuario,dDataMov,cdsBens);

      if iResult = 0 then begin
         if not CtrlEventoImovel.RegistraEvento(cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsInteger,
                                                                 -1, -1, -1,
                                                                idUsuario,
                                                                'RM', 'Entrada por Remembramento',
                                                                sEvento, dDataMov,
                                                                -1,  -1,  100, 0, 0, False) then
            raise exception.Create( CtrlEventoImovel.MessageInfo );
      end;

      // Grava ImoveisXBens
      if iResult = 0 then iResult := ConsolidaImoveis(IDEmpresa,
                                                       cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsInteger,
                                                       IDUsuario,
                                                       CtrlEventoImovel.iIdEventoImovel,
                                                       fAreaTotal,
                                                       dDataMov,
                                                       sEvento,
                                                       cdsImoveis,
                                                       cdsImovelResult,
                                                       cdsBens);


      //Faz o proviosnamento para perdas dos custos

      //Cássio Rovaroto - SIG nº 113136 - Início
      //Aplicação do provisionamento de custo do saldo do imóvel remembrado
      if iResult = 0 then
        iResult := RemembraProvisaoCusto(IDModulo,
                                         IDEmpresa,
                                         IDUsuario,
                                         dDataMov,
                                         cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsInteger,
                                         cdsImovelResult.FieldByName('CODTIPIMOVEL').AsString,
                                         cdsBensOrigem,
                                         cdsBens);
      //Cássio Rovaroto - SIG nº 113136 - Fim

      // se alguma parte apresentou problemas...
      if iResult = -1 then begin
         Rollback;
         Result := False;
      end else begin
         Commit;
         Result := True;
      end;
   except
      RollBack;
      Result := False;
      Raise;
   end;

end;



function TCtrlRemembramento.CriaImoveisEConjuntos(cdsImovelResult, cdsBens : TCMClientDataSet; dDataOper : TDateTime; IDEmpresa : Integer; sMestre : String;
                                                  sListaImovel : string): ShortInt;      // Vando - SOL 154328-5901 / KTN 1373449
var iIDConjunto,iIDImovel : Integer;
    FCds, FCdsRateioCustos, FCdsRateioDepreciacao : TClientDataSet;
    sSQL : string;    // Vando - SOL 154328-5901 / KTN 1373449
begin
   Result := 0;
   try
      FCds                  := TClientDataSet.Create(Nil);
      FCdsRateioCustos      := TClientDataSet.Create(Nil);
      FCdsRateioDepreciacao := TClientDataSet.Create(Nil);
      iIDImovel := CAF.CriaImovel(cdsImovelResult.FieldByName('NOME_IMOVEL').AsString,
                                  cdsImovelResult.FieldByName('CODTIPIMOVEL').AsString,
                                  cdsImovelResult.FieldByName('IDIMOVELMESTRE').asInteger,
                                  -1,
                                  -1,
                                  dDataOper,
                                  cdsImovelResult.FieldByName('CC_DESMEMBRA').AsFloat,
                                  cdsImovelResult.FieldByName('NO_IMOVEL_RESULT').AsInteger);

      // Coloca o imóvel ativo e Em Carteira
      if iIDImovel > 0 then begin
         ExecSQL('UPDATE IMOVEL SET FLGSTATUS = ''N'', FLGATIVO = 1 WHERE IDIMOVEL = ' + IntToStr(iIDImovel));

         // grava o ID do imovel gerado na tabela virtual
         cdsImovelResult.Edit;
         cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsFloat := iIDImovel;
         cdsImovelResult.Post;

         // cria segregação para novo imovel através da média de percentuais dos imoveis remembrados
         // Vando - SOL 154328-5901 / KTN 1373449
         sSQL := 'INSERT INTO PLANOPATROXIMOVEL (IDIMOVEL, IDPATRO, IDPLANOPREV, PPIPERCENTRATEIO, FLGTIPO )' +#13+
                 'SELECT '+IntToStr(iIDImovel)+', '+#13+
                 '       PPI.IDPATRO,      '+#13+
                 '       PPI.IDPLANOPREV,  '+#13+
                 '       (SUM(PPI.PPIPERCENTRATEIO) / SUM(IM1.QTD)) AS PPIPERCENTRATEIO, ''P'' '+#13+
                 '  FROM PLANOPATROXIMOVEL PPI, '+#13+
                 '       (SELECT IDIMOVEL, COUNT(IDIMOVEL) AS QTD '+#13+
                 '          FROM IMOVEL   '+#13+
                 '         GROUP BY IDIMOVEL) IM1     '+#13+
                 ' WHERE PPI.IDIMOVEL = IM1.IDIMOVEL  '+#13+
                 '   AND IM1.IDIMOVEL IN ('+sListaImovel+')  '+#13+
                 ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO ';

         ExecSQL(sSQL);
         // Vando - SOL 154328-5901 / KTN 1373449 - fim


         FCds.Data := GetDataPacket('SELECT IDCONJUNTO, ' +
                                    '       IDPESSOA, ' +
                                    '       IDLOCALIZACAO, ' +
                                    '       IDRESPONSAVEL, ' +
                                    '       DESCCONJUNTO ' +
                                    'FROM CONJUNTO WHERE IDCONJUNTO = -999'
                                    );

         // Cria o Conjunto equivalente no banco para o imóvel
         FCds.Insert;
         FCds.FieldByName('IDPESSOA').AsInteger      := IdEmpresa;
         FCds.FieldByName('IDLOCALIZACAO').AsInteger := cdsBens.FieldByName('IDLOCALIZACAO').AsInteger;
         FCds.FieldByName('IDRESPONSAVEL').AsInteger := cdsBens.FieldByName('IDRESPONSAVEL').AsInteger;
         FCds.FieldByName('DESCCONJUNTO').AsString   := sMestre + ' - ' + cdsImovelResult.FieldByName('NOME_IMOVEL').AsString;
         FCds.Post;

         // Abre RATEIODEPRECIACAO do grupo original para copiar os Centros de Custos
         FCdsRateioDepreciacao.Data := GetDataPacket('SELECT IDCONJUNTO, '+
                                                     '        CODCENTROCUSTO, '+
                                                     '        PARTICIPACAO, '+
                                                     '        DTAFIM '+
                                                     'FROM   RATEIODEPRECIACAO '+
                                                     'WHERE  IDCONJUNTO = ' + cdsBens.FieldByName('IDCONJUNTO').AsString
                                                     );


         FCdsRateioCustos.Data := GetDataPacket('SELECT IDCONJUNTO, IDEMPRESA, CODCENTROCUSTO, PARTICIPACAO, DTAINICIO FROM RATEIODEPRECIACAO WHERE IDCONJUNTO = -999');

         // Cria RATEIODEPRECIACAO para todos os centro de custos existentes anteriormente
         while not FCdsRateioDepreciacao.eof do begin
            FCdsRateioCustos.Insert;
            FCdsRateioCustos.FieldByName('IDEMPRESA').AsInteger     := IdEmpresa;
            FCdsRateioCustos.FieldByName('CODCENTROCUSTO').AsString := FCdsRateioDepreciacao.FieldByName('CODCENTROCUSTO').AsString;
            FCdsRateioCustos.FieldByName('PARTICIPACAO').AsInteger  := FCdsRateioDepreciacao.FieldByName('PARTICIPACAO').AsInteger;
            FCdsRateioCustos.FieldByName('DTAINICIO').AsDateTime    := dDataOper;
            FCdsRateioCustos.Post;
            FCdsRateioDepreciacao.Next;
         end;

         CtrlConjunto.OpenTransaction := False;
         CtrlConjunto.cds             := FCds;
         CtrlConjunto.cdsRateioCustos := FCdsRateioCustos;
         if CtrlConjunto.AplicaOperacao('E') then begin
            iConjunto := StrToInt(CtrlConjunto.MessageInfo);
         end else begin
            raise exception.Create( CtrlConjunto.MessageInfo );
         end;

         FCds.Free;
         FCdsRateioCustos.Free;
         FCdsRateioDepreciacao.Free;
      end else begin
         Result := -1;
         Abort;
      end;
   except
      on E : Exception do begin
         Result := -1;
         Messageinfo := e.Message;
      end;
   end;
end;



function TCtrlRemembramento.PreenchePlacaCAF(IDEmpresa, IDImovel : Integer; cdsBens : TCMClientDataSet) : shortint ;
var sPlaca: string;
    iSeqPlaca : Integer;
    iPlaca    : Integer;
    iPrefixo  : Integer;
    iImovel   : Integer;
    sSQL      : String;
begin
   // procedimento que preenche o número das placas dos bens, se precisar
   Result := 0;
   iSeqPlaca := 0;
   iPrefixo  := 0;

   cdsBens.First;
   
   if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 0) and
      (cdsBens.FieldByName('FLGSEMPLACA').AsInteger = 1) then
      Exit;

   if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) then Inc(iSeqPlaca);

   try
      while not cdsBens.Eof do begin
         iPlaca := CAF.PlacaCaf(cdsBens.FieldByName('IDGRUPO').AsInteger,
                                                                IDImovel,
                                                                IdEmpresa,
                                                                // Marchetti - pendencia 27080
                                                                cdsBens.FieldByName('FLGSEMPLACA').AsInteger,
                                                                // Fim Marchetti - pendencia 27080
                                                                iSeqPlaca);

         if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) and (iPlaca <> -1) then
         begin

            sSQL :=
            'SELECT T.IDGRUPOTERRENO, T.IDGRUPOEDIFICACAO, T.IDGRUPOINST '      + #13 +
            'FROM TIPOIMOVEL T, IMOVEL I '                                      + #13 +
            'WHERE T.CODTIPIMOVEL = I.CODTIPIMOVEL '                            + #13 +
            'AND IDIMOVEL = ' + IntToStr(IDImovel)                              + #13;

            _cds.Data := GetDataPacket(sSQL);

            if (not _cds.FieldByName('IDGRUPOTERRENO').IsNull) and
               (_cds.FieldByName('IDGRUPOTERRENO').AsInteger = cdsBens.FieldByName('IDGRUPO').AsInteger) then begin
               iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumTer);
            end;

            if (not _cds.FieldByName('IDGRUPOEDIFICACAO').IsNull) and
               (_cds.FieldByName('IDGRUPOEDIFICACAO').AsInteger = cdsBens.FieldByName('IDGRUPO').AsInteger) then begin
               iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumEdi);
            end;

            if (not _cds.FieldByName('IDGRUPOINST').IsNull) and
               (_cds.FieldByName('IDGRUPOINST').AsInteger = cdsBens.FieldByName('IDGRUPO').AsInteger) then begin
               iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumIns);
            end;

            iPlaca := StrToInt(IntToStr(iPrefixo) + CompletaInicio(IntToStr(iPlaca), '0',6));
         end;

         if iPlaca > 0 then
         begin
            cdsBens.Edit;
            cdsBens.FieldByName('PLACA').AsInteger := iPlaca;
            cdsBens.Post;
         end;
         cdsBens.Next;
         
         if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao <> 1) then Inc(iSeqPlaca);

      end;
   except
      Result := -1;
   end;
end;



function TCtrlRemembramento.RemembramentoAtivoFixo(IDModulo, IDEmpresa, IDUsuario : Integer; dDataMov : TDateTime; cdsBens : TCMClientDataSet): ShortInt;
begin
   Result := 0;
   try
      cdsBens.First;
      while not cdsBens.eof do
      begin
         CtrlMovRemembramento.cdsSelBens.Filter   := 'IXBGRUPO = ' + QuotedStr(cdsBens.FieldByName('IXBGRUPO').AsString);
         CtrlMovRemembramento.cdsSelBens.Filtered := True;
         if not CtrlMovRemembramento.ExecutaRemembramento(IDModulo,
                                                          IDEmpresa,
                                                          IDUsuario,
                                                          cdsBens.FieldByName('PLACA').AsInteger,
                                                          iConjunto,
                                                          cdsBens.FieldByName('IDSITUACAO').AsInteger,
                                                          cdsBens.FieldByName('IDCLASSEBEM').AsInteger,
                                                          cdsBens.FieldByName('IDGRUPO').AsInteger,
                                                          cdsBens.FieldByName('DESBEM').AsString,
                                                          dDataMov,
                                                          False // Alterado por FHBS - SOL: 153539 KTN: 1159566
                                                          ) then
            raise exception.create(CtrlMovRemembramento.MessageInfo);

         cdsBens.Edit;
         cdsBens.FieldByName('IDBEM').AsInteger := CtrlMovRemembramento.IDBem;
         cdsBens.Post;
         cdsBens.Next;
      end;
      CtrlMovRemembramento.cdsSelBens.Filter   := '';
      CtrlMovRemembramento.cdsSelBens.Filtered := False;
   except
      on E : Exception do begin
         Result := -1;
         Messageinfo := e.Message;
      end;
   end;
end;



function TCtrlRemembramento.ConsolidaImoveis(IDEmpresa, IDImovel, IDUsuario, iEvento : Integer; fAreaTotal : Extended; dDataMov : TDateTime; sEvento : String; cdsImoveis, cdsImovelResult, cdsBens : TCMClientDataSet): shortint;
var
   iEventoOrigem, iEventoResult : int64;
   fCC_Acumulado, fSaldoTot : extended;
   fPercentRemembra,fAreaNova : double;
   sSql              : String;
begin
   Result    := 0;
   try
      cdsImovelResult.First;
      while (not cdsImovelResult.EOF) and (Result = 0) do begin

         fCC_Acumulado := 0;
         fSaldoTot     := 0;
         cdsBens.First;
         // percorre agora a tabela de bens resultantes
         while not cdsBens.EOF do begin

            // acumula o saldo contabil total de todos bens de todos os imoveis para
            // calcular o percentual de desmembramento do imovel
            fSaldoTot := fSaldoTot + cdsImovelResult.FieldByName('CC_DESMEMBRA').AsFloat;

            // se o bem pertencer ao imóvel, acumula o CC e gera ImovelxBem
            fCC_Acumulado := fCC_Acumulado + cdsImovelResult.FieldByName('CC_DESMEMBRA').AsFloat;

            // grava o ImovelxBem
            if cdsBens.FieldByName('IDBEM').AsInteger > 0 then begin
               sSQL := 'INSERT INTO IMOVELXBEM (IDIMOVEL, IDBEM, IDPESSOA, IXBGRUPO, IXBPERCENT) ' + #13 +
                       'VALUES (' + cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsString + ',' +
                                    cdsBens.FieldByname('IDBEM').AsString                    + ',' +
                                    IntToStr(IDEmpresa)                                      + ',' +
                                    QuotedStr(cdsBens.FieldByname('IXBGRUPO').AsString)      + ',' +
                                    '100'                                                    + ') ';

               ExecSql(sSQL);
            end;

            // Vando - SOL 154328-5901 / KTN 1373449
            CtrlCafObra.AtualizaSegregacaoLancamentos(cdsBens.FieldByname('IDBEM').AsInteger, dDataMov);

            cdsbens.Next;
         end;

         // calcula o percentual de desmembramento
         fPercentRemembra := ( fCC_Acumulado / fSaldoTot) * 100;

         while not cdsImoveis.Eof do
         begin
            if not CtrlEventoImovel.RegistraEvento(cdsImoveis.FieldByName('IDIMOVEL').AsInteger,
                                                   -1, -1, -1,
                                                  idUsuario,
                                                  'BR', 'Baixa por Remembramento',
                                                  sEvento, dDataMov,
                                                  -1,  -1,  100, 0, 0, False) then
               raise exception.Create( CtrlEventoImovel.MessageInfo );

            // Altera a situação e registra evento no imovel original
            iEventoOrigem := CtrlEventoImovel.iIdEventoImovel;

            // Grava DESMEMBRAIMOVEL
            sSQL :=
            'INSERT INTO DESMEMBRAIMOVEL(IDIMOVELINI, IDIMOVELFIM, IDEVENTOIMOVELINI, IDEVENTOIMOVELFIM, FLGTIPODESMEMBRA, DMRDATA, DMRPERCENT ) ' +
            'VALUES ( ' +
                      cdsImoveis.FieldByName('IDIMOVEL').AsString                       + ',' +
                      cdsImovelResult.FieldByName('IDIMOVEL_RESULT').AsString           + ',' +
                      IntToStr(iEventoOrigem)                                           + ',' +
                      IntToStr(iEvento)                                                 + ',' +
                      QuotedStr('R')                                                    + ',' +
                      'TO_DATE(' + QuotedStr(DateToStr(dDataMov)) + ',''DD/MM/YYYY'') ' + ',' +
                      '100'                                                             + ')';
            ExecSQL(sSQL);

            sSQL :=
            'UPDATE IMOVEL SET FLGSTATUS = ''R'', FLGATIVO = 0 WHERE IDIMOVEL = ' + cdsImoveis.FieldByName('IDIMOVEL').AsString;
            ExecSQL(sSQL);

            cdsImoveis.Next;
         end;

         // Rateia a Area Total do Imovel original pelos Novos Imoveis e
         // atualiza o valor de aquisição, calculado após a depreciação do imóvel pai
         fAreaNova := ( fAreaTotal * fPercentRemembra ) / 100;

         sSql := 'UPDATE IMOVEL ' +
                 '   SET IMOAREA      = ' + ComunsImobiliario.StrTran(FloatToStr(fAreaNova),',','.')     + ', ' +
                 '       IMOVLRCOMPRA = ' + ComunsImobiliario.StrTran(FloatToStr(fCC_Acumulado),',','.') +
                 ' WHERE IDIMOVEL     = ' + IntToStr(IDImovel);
         if not ExecSql(sSQL) then
         begin
            Result := -1;
            Exit;
         end;

         cdsImovelResult.Next;
      end;
   except
      Result := -1;
      Raise;
   end;
end;


// Rotinas utilizadas no Desfazer Remembramento
function TCtrlRemembramento.ListaImoveisRemembrados(const IDImovel: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT DISTINCT'                                               + #13 +
   '       D.IDIMOVELINI,'                                         + #13 +
   '       D.IDIMOVELFIM,'                                         + #13 +
   '       D.DMRDATA,'                                             + #13 +
   '       D.IDEVENTOIMOVELINI,'                                   + #13 +
   '       D.IDEVENTOIMOVELFIM,'                                   + #13 +
   '       IM.IMONOME || '' - '' || I.IMONOME AS NOMEIMOVEL,'      + #13 +
   '       B.IDCONJUNTO AS IDCONJUNTOFIM'                          + #13 +
   'FROM   DESMEMBRAIMOVEL D,'                                     + #13 +
   '       IMOVEL I,'                                              + #13 +
   '       IMOVEL IM,'                                             + #13 +
   '       IMOVELXBEM IXB,'                                        + #13 +
   '       BEM B'                                                  + #13 +
   'WHERE  (D.IDIMOVELFIM = ' + IntToStr(IDImovel) + ')'           + #13 +
   '   AND (D.IDIMOVELINI = I.IDIMOVEL)'                           + #13 +
   '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'                       + #13 +
   '   AND (D.IDIMOVELFIM = IXB.IDIMOVEL)'                         + #13 +
   '   AND (IXB.IDBEM = B.IDBEM)'                                  + #13 +
   '   AND (D.FLGTIPODESMEMBRA = ''R'')'                           + #13;

   Result := GetDataPacket(sSQL);
end;




function TCtrlRemembramento.ListaEventoImovel(const IDEvento: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                + #13 +
   '   E.IDEVENTOIMOVEL,'                                                  + #13 +
   '   E.EVIDATA,'                                                         + #13 +
   '   E.EVICABECALHO,'                                                    + #13 +
   '   E.EVIDESCRICAO,'                                                    + #13 +
   '   E.IDUSUARIO,'                                                       + #13 +
   '   (RTRIM(U.NOMEUSUARIO) || '' - '' || PU.NOME) AS USUARIO_EXTENSO'    + #13 +
   'FROM'                                                                  + #13 +
   '   PESSOA PU, EVENTOIMOVEL E,'                                         + #13 +
   '   USUARIOSISTEMA U'                                                   + #13 +
   'WHERE'                                                                 + #13 +
   '       ( E.IDEVENTOIMOVEL = ' + IntToStr(IDEvento) + ')'               + #13 +
   '   AND ( E.IDUSUARIO = U.IDUSUARIO )'                                  + #13 +
   '   AND ( U.IDUSUARIO = PU.IDPESSOA )'                                  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRemembramento.ListaImovelXBem(const IDImovel: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                                + #13 +
   '   IM.IMONOME || '' - '' || I.IMONOME AS IMOVEL_EXTENSO, I.IMOCODIGO,'                 + #13 +
   '   IB.IDIMOVEL, IB.IDBEM, IB.IXBPERCENT, IB.IXBGRUPO, B.IDGRUPO, I.CODTIPIMOVEL,'      + #13 +
   '   B.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPONSAVEL, B.DESBEM, 0 AS VLR_BEM'             + #13 +
   'FROM'                                                                                  + #13 +
   '   IMOVEL I, IMOVEL IM, IMOVELXBEM IB, BEM B, CONJUNTO C'                              + #13 +
   'WHERE'                                                                                 + #13 +
   '       IB.IDBEM = B.IDBEM'                                                             + #13 +
   '   AND (I.IDIMOVEL = IB.IDIMOVEL)'                                                     + #13 +
   '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)'                                               + #13 +
   '   AND ( B.IDCONJUNTO = C.IDCONJUNTO(+) )'                                             + #13 +
   '   AND ( IB.IDIMOVEL = ' + IntToStr(IDImovel) + ')'                                    + #13 +
   'ORDER BY IMOVEL_EXTENSO, IDIMOVEL, DESBEM'                                             + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlRemembramento.EstornaRemembramento(const IDEmpresa, IDModulo, IDUsuario: Integer; cdsImoveisOriginais, cdsImovelXBem, cdsEventoImovel: TCMClientDataSet): boolean;
begin
   Result := True;
   MessageInfo := '';

   try
      if cdsImovelxBem.isEmpty then begin
         MessageInfo := 'Não foi possível encontrar os bens relacionados ao imovel original em IMOVELXBEM';
         Result      := False;
         Exit;
      end;

      //Estorna possível provisão de perdas.
      if not EstornaRemembraProvisaoCusto(IdUsuario,
                                          IdModulo,
                                          IdEmpresa,
                                          cdsEventoImovel.FieldByName('EVIDATA').asDateTime,
                                          cdsImoveisOriginais) then
        raise Exception.Create(MessageInfo);

      // Exclui ImovelxBem para cada imovel resultante
      try
         cdsImoveisOriginais.First;
         while not cdsImoveisOriginais.EOF do begin
            // Deleta ImovelXBem
            if not ExcluiImovelXBem(IdEmpresa, cdsImoveisOriginais.FieldByName('IDIMOVELFIM').AsInteger) then
            begin
               MessageInfo := 'Não foi possível excluir os bens do Imóvel';
               Result := False;
               Exit;
            end;
            cdsImoveisOriginais.Next;
         end;
      except
         MessageInfo := 'Erro ao excluir em IMOVELXBEM';
      end;


      // Desfaz o desmembramento a partir dos bens do Imóvel original
      cdsImovelXBem.First;
      while not cdsImovelXBem.EOF do begin
         CtrlMovRemembramento.OpenTransaction := False;
         if not CtrlMovRemembramento.EstornaRemembramento(IdModulo,
                                                          IdEmpresa,
                                                          IdUsuario,
                                                          cdsImovelXBem.FieldByName('IDBEM').AsInteger,
                                                          cdsEventoImovel.FieldByName('EVIDATA').asDateTime,
                                                          Date() ) then begin
            MessageInfo := CtrlMovRemembramento.MessageInfo;
         end;

         cdsImovelXBem.Next;
      end;

      cdsImoveisOriginais.First;
      while not cdsImoveisOriginais.EOF do begin

         if not ExcluiImoveis(IdEmpresa,
                              cdsImoveisOriginais.fieldByName('IDCONJUNTOFIM').AsInteger,
                              cdsImoveisOriginais.fieldByName('IDIMOVELINI').AsInteger,
                              cdsImoveisOriginais.fieldByName('IDIMOVELFIM').AsInteger,
                              cdsImoveisOriginais.fieldByName('IDEVENTOIMOVELINI').asInteger,
                              cdsImoveisOriginais.fieldByName('IDEVENTOIMOVELFIM').asInteger) then
         begin
            MessageInfo := 'Não foi possível excluir o Imóvel';
            Result := False;
            Exit;
         end;
         // Altera a situação do Imóvel original p/ "Em Carteira" = "N"
         ExecSQL('UPDATE IMOVEL SET FLGSTATUS = ''N'', FLGATIVO = 1 WHERE IDIMOVEL = ' + cdsImoveisOriginais.fieldByName('IDIMOVELINI').AsString);

         cdsImoveisOriginais.Next;
      end;
   except
      on E : Exception do begin
         Result := False;
         MessageInfo := E.message;
      end;
   end;
end;



function TCtrlRemembramento.ExcluiImovelXBem(const IDEmpresa, IDImovel : Integer): boolean;
var
   sSQL : String;
begin
   sSQL :=
   'DELETE FROM IMOVELXBEM'                         + #13 +
   'WHERE (IDPESSOA = ' + IntToStr(IDEmpresa) + ')' + #13 +
   '  AND (IDIMOVEL = ' + IntToStr(IDImovel) + ')'  + #13;

   Result := ExecSql(sSQL);
end;



function TCtrlRemembramento.ExcluiImoveis(const IDEmpresa, IDConjunto, IDImovelIni, IDImovelFim, IDEventoIni, IDEventoFim: Integer): Boolean;
var
   sSQL : String;
begin
    // Exclui em RateioDepreciação
    Result := ExecSql('DELETE FROM RATEIODEPRECIACAO ' + #13 +
                      'WHERE IDEMPRESA  = ' + IntToStr(IDEmpresa) + #13 +
                      'AND IDCONJUNTO   = ' + IntToStr(IDConjunto));

    // Exclui em Conjunto
    if Result then Result := ExecSql('DELETE FROM CONJUNTO ' + #13 +
                                     'WHERE IDPESSOA  = ' + IntToStr(IDEmpresa) + #13 +
                                     'AND IDCONJUNTO   = ' + IntToStr(IDConjunto));


    // exclui os imóveis em DESMEMBRAIMOVEL
    if Result then Result := ExecSql('DELETE FROM DESMEMBRAIMOVEL' + #13 +
                                     'WHERE IDIMOVELFIM = ' + IntToStr(IDImovelFim));

    // exclui os imóveis em ATIVOCOTA
    if Result then Result := ExecSql('DELETE FROM ATIVOCOTA' + #13 +
                                     'WHERE IDIMOVEL = ' + IntToStr(IDImovelFim));

    if Result then Result := CtrlEventoImovel.ExcluiEvento(IDEventoIni, -1,-1,-1,-1,'',-1,False);
    if Result then Result := CtrlEventoImovel.ExcluiEvento(IDEventoFim, -1,-1,-1,-1,'',-1,False);

    // exclui o imóvel resultante em IMOVEL
    if Result then Result := ExecSql('DELETE FROM IMOVEL' + #13 +
                                     'WHERE IDPESSOA = ' + IntToStr(IDEmpresa) + #13 +
                                     'AND IDIMOVEL   = ' + IntToStr(IDImovelFim));

    // Retorna os status do imovel que havia sido remembrado
    if Result then Result := ExecSQL('UPDATE IMOVEL SET FLGSTATUS = ''A'', FLGATIVO = 1 WHERE IDIMOVEL = ' + IntToStr(IDImovelIni));
end;



function TCtrlRemembramento.ListaPercentuaisSegergacao(
  sIdImovel: string): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT SUM(VLR.VLR_PLANO) AS VALOR, ' + #10#13 +
          '       VLR.IDPLANOPREV,  ' + #10#13 +
          '       VLR.IDPATRO, ' + #10#13 +
          '       ROUND((SUM((VLR.VLR_PLANO) * 100) / VLI.VALOR_IMOVEL), 2) AS PERCENTUAL ' + #10#13 +
          '  FROM ' + #10#13 +
          '       (SELECT IMO.IDIMOVEL, ' + #10#13 +
          '               NVL(IMO.IMOVLRREAVAL, IMO.IMOVLRCOMPRA) AS VLR_IMOVEL, ' + #10#13 +
          '               PPI.IDPATRO, ' + #10#13 +
          '               PPI.IDPLANOPREV, ' + #10#13 +
          '               PPI.PPIPERCENTRATEIO, ' + #10#13 +
          '               ROUND((NVL(IMO.IMOVLRREAVAL, IMO.IMOVLRCOMPRA) * PPI.PPIPERCENTRATEIO / 100), 2) AS VLR_PLANO ' + #10#13 +
          '          FROM PLANOPATROXIMOVEL PPI, ' + #10#13 +
          '               IMOVEL IMO ' + #10#13 +
          '         WHERE IMO.IDIMOVEL IN(' + sIdImovel + ') ' + #10#13 +
          '           AND PPI.IDIMOVEL = IMO.IDIMOVEL ' + #10#13 +
          '         ORDER BY PPI.IDPLANOPREV) VLR, ' + #10#13 +
          '       (SELECT ROUND(SUM((NVL(IMOVLRREAVAL, IMOVLRCOMPRA))),2) AS VALOR_IMOVEL ' + #10#13 +
          '          FROM IMOVEL ' + #10#13 +
          '         WHERE IDIMOVEL IN( ' + sIdImovel + ')) VLI ' + #10#13 +
          ' GROUP BY VLR.IDPLANOPREV, VLR.IDPATRO, VLI.VALOR_IMOVEL'; 

   Result := GetDataPacket(sSQL);
end;

function TCtrlRemembramento.RemembraProvisaoCusto(iIdModulo, iIdEmpresa,
  iIdUsuario: Integer; dDataMov: TDateTime; iImovelResult: Integer;
  sSegmentoResult: string;  cdsBensOrigem, cdsBens: TCMClientDataSet;
  bIntegraContab: Boolean): Shortint;
var
  cdsProvisaoImovel : TCMClientDataSet;
  dSaldoProvisaoBemOriginal, nSeqHist, nPlanilha, dSaldoContabBem : Extended;
  wDia, wMes, wAno: word;
  sMsgErro: string;
  iHistMovBem: Integer;
  iIdBemResutAnt: Extended;
  iIdProvisaoImovelNovo: Integer;
  iIdImovelAnt: Integer;
begin
  Result := 0;
  iHistMovBem := 0;
  iIdBemResutAnt := -1;
  cdsProvisaoImovel := TCMClientDataSet.Create(nil);
  DecodeDate(dDataMov, wAno, wMes, wDia);
  try
    //Baixa o saldo de provisão dos imóveis remembrados
    cdsBensOrigem.First;
    CtrlProvisaoImovel.InicializaContabProvisao;
    while not cdsBensOrigem.Eof do
    begin
      cdsProvisaoImovel.Data := CtrlProvisaoImovel.GetProvisaoBemImovel(cdsBensOrigem.FieldByName('IDBEM').asInteger, dDataMov);
      if not cdsProvisaoImovel.IsEmpty then
      begin
        dSaldoProvisaoBemOriginal := CtrlProvisaoImovel.SaldoContabilBem(iIdEmpresa, cdsBensOrigem.FieldByName('IDBEM').asInteger, ModuloImobiliario.InvestImob.iIdMoedaCAF, 1, dDataMov);
        
        if not CtrlProvisaoImovel.ExecutaProvisaoCusto(cdsBensOrigem.FieldByName('IDBEM').AsInteger,
                                                       Sistema.IdEmpresa,
                                                       Sistema.IdModulo,
                                                       ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                       cdsProvisaoImovel.FieldByName('IDPROVISAOIMOVEL').AsInteger,
                                                       cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger,
                                                       cdsBensOrigem.FieldByName('IDGRUPO').AsInteger,
                                                       cdsBensOrigem.FieldByName('IDCONJUNTO').AsInteger,
                                                       ModuloImobiliario.InvestImob.iUnidNegoc,
                                                       0,
                                                       cdsProvisaoImovel.FieldByName('CODTIPIMOVEL').asString,
                                                       cdsBensOrigem.FieldByName('PLACA').AsString,
                                                       cdsBensOrigem.FieldByName('DESBEM').AsString,
                                                       '',
                                                       dDataMov,
                                                       0,
                                                       cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat,
                                                       True,
                                                       True) then
          raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
      end;
      cdsBensOrigem.Next;
    end;

    //Gera a provisão do novos bens do imóvel resultante do remembramento
    cdsBens.First;
    while not cdsBens.Eof do
    begin
       cdsProvisaoImovel.Data := CtrlProvisaoImovel.GetProvisaoBemImovel(cdsBensOrigem.FieldByName('IDBEM').asInteger, dDataMov);
      if not cdsProvisaoImovel.IsEmpty then
      begin
        dSaldoContabBem := CtrlProvisaoImovel.SaldoContabilBem(iIdEmpresa, cdsBens.FieldByName('IDBEM').asInteger, ModuloImobiliario.InvestImob.iIdMoedaCAF, 1, dDataMov);

        iIdProvisaoImovelNovo := CtrlProvisaoImovel.InsereProvisaoImovelDesmembrado(cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger,
                                                                                    iImovelResult,
                                                                                    dDataMov);
        if iIdProvisaoImovelNovo = -1 then
          raise Exception.Create(CtrlProvisaoImovel.MessageInfo);

        if not CtrlProvisaoImovel.ExecutaProvisaoCusto(cdsBens.FieldByName('IDBEM').asInteger,
                                                       Sistema.IdEmpresa,
                                                       Sistema.IdModulo,
                                                       ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                       iIdProvisaoImovelNovo,
                                                       iImovelResult,
                                                       cdsBens.FieldByName('IDGRUPO').asInteger,
                                                       cdsBens.FieldByName('IDCONJUNTO').AsInteger,
                                                       ModuloImobiliario.InvestImob.iUnidNegoc,
                                                       0,
                                                       sSegmentoResult,
                                                       cdsBens.FieldByName('PLACA').asString,
                                                       cdsBens.FieldByName('DESBEM').AsString,
                                                       '',
                                                       dDataMov,
                                                       dSaldoContabBem,
                                                       cdsProvisaoImovel.FieldByName('PERCENTUAL').AsFloat,
                                                       True,
                                                       True) then
          raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
      end;
      cdsBens.Next;
    end;

    cdsBensOrigem.First;
    while not cdsBensOrigem.Eof do
    begin
      if iIdImovelAnt <> cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger then
      begin
        iIdImovelAnt := cdsProvisaoImovel.FieldByName('IDIMOVEL').AsInteger;
        LimpaParametros(dtmCAF.qryUpdProvisaoImovel);
        dtmCAF.qryUpdProvisaoImovel.Prepare;
        dtmCAF.QryUpdProvisaoImovel.ParamByName('PDATAFIM').asDateTime := dDataMov;
        dtmCAF.QryUpdProvisaoImovel.ParamByName('PFLGATIVO').asString := 'N';
        dtmCAF.qryUpdProvisaoImovel.ParamByName('PIDIMOVEL').asInteger := iIdImovelAnt;
        dtmCAF.qryUpdProvisaoImovel.ExecSQL;
      end;
      cdsBensOrigem.Next;
    end;

    if CtrlProvisaoImovel.bContabProvisao then
    begin
      if not CtrlProvisaoImovel.ContabilizaProvisao(Sistema.IdModulo,
                                                    Sistema.IdEmpresa,
                                                    Sistema.IdUsuario,
                                                    dDataMov) then
        raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
    end;

  finally
    FreeAndNil(cdsProvisaoImovel);
  end; 
end;

function TCtrlRemembramento.EstornaRemembraProvisaoCusto(iIdUsuario, iIdModulo, iIdEmpresa: Integer;
                                                         dDataMov: TDateTime;
                                                         cdsImoveisOrigem: TCMClientDataSet): Boolean;
var
  cdsBemAux: TCMClientDataSet;
  iIdImovelAnt: Integer;
begin
  Result := True;
  iIdImovelAnt := -1;
  cdsBemAux := TCMClientDataSet.Create(nil);
  try
    try
      cdsImoveisOrigem.First;
      while not cdsImoveisOrigem.Eof do
      begin
        if cdsImoveisOrigem.FieldByName('IDIMOVELFIM').AsInteger <> iIdImovelAnt then
        begin
          iIdImovelAnt := cdsImoveisOrigem.FieldByName('IDIMOVELFIM').AsInteger;

          //Estorna a provisão do imóvel gerado.
          cdsBemAux.Data := CtrlProvisaoImovel.RetornaBem(iIdImovelAnt);

          while not cdsBemAux.Eof do
          begin
            //Exclui Provisão de Custo.
            if not CtrlProvisaoImovel.EstornaProvisaoCustoImovel(iIdUsuario,
                                                                 iIdModulo,
                                                                 iIdEmpresa,
                                                                 202,
                                                                 dDataMov,
                                                                 True,
                                                                 True,
                                                                 cdsBemAux.FieldByName('IDBEM').AsInteger)  then
             raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
            cdsBemAux.Next;
          end;

          LimpaParametros(dtmCAF.qryDelProvisaoImovel);
          dtmCAF.qryDelProvisaoImovel.Prepare;
          dtmCAF.qryDelProvisaoImovel.ParamByName('IDIMOVEL').AsInteger := iIdImovelAnt;
          dtmCAF.qryDelProvisaoImovel.ParamByName('VIGENCIA_INICIO').AsDate := dDataMov;
          dtmCAF.qryDelProvisaoImovel.ExecSQL;
        end;
        cdsImoveisOrigem.Next;
      end;

      cdsImoveisOrigem.First;
      while not cdsImoveisOrigem.Eof do
      begin
        //Estorna a movimentação de reversão da provisão do imóveis originais.
        cdsBemAux.Data := CtrlProvisaoImovel.RetornaBem(cdsImoveisOrigem.FieldByName('IDIMOVELINI').AsInteger);
        while not cdsBemAux.Eof do
        begin
          //Exclui Provisão de Custo.
          if not CtrlProvisaoImovel.EstornaProvisaoCustoImovel(iIdUsuario,
                                                               iIdModulo,
                                                               iIdEmpresa,
                                                               203,
                                                               dDataMov,
                                                               True,
                                                               True,
                                                               cdsBemAux.FieldByName('IDBEM').AsInteger)  then
            raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
          cdsBemAux.Next;
        end;

        LimpaParametros(dtmCAF.qryUpdEstornoProvisaoImovel);
        dtmCAF.qryUpdEstornoProvisaoImovel.Prepare;
        dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PFLGATIVO').asString := 'S';
        dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PIDIMOVEL').asInteger := cdsImoveisOrigem.FieldByName('IDIMOVELINI').AsInteger;
        dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PVIGENCIAFIM').AsDate := dDataMov;
        dtmCAF.qryUpdEstornoProvisaoImovel.ExecSQL;

        cdsImoveisOrigem.Next;
      end;

    except
      on e: Exception do
        Result := False;
    end;
  finally
    FreeAndNil(cdsBemAux);
  end;
end;

end.






