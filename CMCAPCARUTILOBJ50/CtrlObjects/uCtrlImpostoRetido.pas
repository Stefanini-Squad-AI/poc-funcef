{*******************************************************************************
  Alterações:
   // Alex - 04/04/04 - 16454 - excluir os lançamentos na lancirrf
********************************************************************************

--------------------------------------------------------------------------------
Rotina    : GetDataLancDocImposto
Data      : 17/05/2006
Autor     : André Tavares
Descrição : o número de dias para o pagamento da CPMF agora por default é o campo PORTADORCONTA.NDIASAPURACPMF
que se sobrepõe ao campo FAIXATIPOAGREG.NUMDIASVENC
Pendência : 22316
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
Rotina    : Incluir, Excluir
Data      : 15/05/2006
Autor     : André Tavares
Descrição : Criada a possibilidade de excluir e incluir um imposto específico de um documento
Pendência : 21735
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : GetDataLancDocImposto
Data      : 17/03/2006
Autor     : André Tavares
Descrição : adaptação para ser utilizado també na reprogramação da CPMF
Pendência : 21775
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : EfetivaLancamento
Data      : 15/03/2006
Autor     : André Tavares
Descrição : Lança os documentos que já recolheram impostos acumulados na tabela DOCXIMPOSTOACUM para
            que não haja duplicidade de recolhimento de impostos acumulados.
Pendência : 21377
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : GetDataLancDocImposto
Data      : 20/02/2006
Autor     : André Tavares
Descrição : Faz lançamento da cpmf segundo os parâmetros de apuração (decêncio)
Pendência : 21219
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : EfetivaLançamento
Data      : 14/08/2003
Autor     : André Tavares
Descrição : Fazer funcionar o acumulo de impostos.
Pendência : 20539
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
 Rotinas   : GetDataLancDocImposto
 Data      : 22/03/2005
 Autor     : Rodolpho da Silva
 Pendências: 18397
 Descrição : Validar regra de feriado de acordo com o estado/cidade do portadorforma
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
 Rotinas   : LancaDocmento
 Data      : 04/11/2004
 Autor     : Bruno Bastos
 Pendências: 17669
 Descrição : Gravar corretamente o histórico da conciliação da CPMF.
--------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 04/08/2004
 Autor     : David Ayrolla
 Pendências: 16832 e 17232
 Descrição : Limitar a retenção de INSS de autônomos ao teto.
--------------------------------------------------------------------------------
 Rotinas   : TCtrlImpostoRetido.Excluir
 Data      : 04/04/2004
 Autor     : Alex Pereira
 Pendência : 16454
 Descrição : Excluir os lançamentos do IRRF, caso seja excluído o imposto retido
             tabela LANCIRRF
--------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 25/03/04
 Autor     : Alex Pereira
 Pendência : 16355
 Descrição : Diferença de centavos com impostos com tabela de retenção.
             Lanctodocum x Lancamento
             Valor documento: 3834,50
--------------------------------------------------------------------------------
 Rotinas   : GetImposto, Incluir, EfetivaLancamento, ImpostoIRRF
 Data      : 27/01/2004 (término)
 Autor     : David Ayrolla
 Pendência : 15975
 Descrição : No momento da retenção de IRRF, deduzir do valor do documento
             os impostos em que o imposto de renda incide.
--------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 16/01/2004 (término)
 Autor     : David Ayrolla
 Pendência : 14393
 Descrição : Implementação de retenção de INSS para autônomos.
--------------------------------------------------------------------------------
Rotina    : Private EfetivaLancamento ==> procedure ContabilizaSCV  - resolvido em 06/10/2004
            Private TCtrlImpostoRetido.LancaDocumento
            TCtrlImpostoRetido.AlteraNumLancOrigem ==> procedure LancaContabNovoDocumento
Data      : 12/01/2004
Autor     : Alex Pereira
Pendência : 14451 - Nova segregação de recursos
Descrição : Rotina pendente de análise futura
--------------------------------------------------------------------------------
Rotina    : GetFaixaImposto
Data      : 01/07/2003
Autor     : André Pontes
Descrição : Busca da alíquota levando em conta a data
            Tabela: FAIXATIPOAGREG
            Campos: DATAINI e DATAFIM
--------------------------------------------------------------------------------
Rotina    : Excluir
Data      : 03/07/2003
Autor     : Gleyber
Descrição : Acerto na variavel sSqlSelect para incluir o campo PLNCODIGO
            Pendência: 14414
--------------------------------------------------------------------------------
Rotina    : EfetivaNovoDocumento
Data      : 14/08/2003
Autor     : André Tavares
Descrição :
Pendência : o recebimento do convênio sicov estava dando um erro nesta linha.
--------------------------------------------------------------------------------
Rotina    : ImpostoIRRF
Data      : 27/05/2004
Pendência : 16839
Autor     : David Ayrolla
Descrição : Correção de problema encontrado na recuperação do IRRF.
--------------------------------------------------------------------------------}

unit uCtrlImpostoRetido;

interface

uses
   classes, sysUtils, dbclient, uCmDbObject, uCmControlObject, uCtrlDocumento,
   DImpostoObj, uCtrlLancamento, uDiasUteis, uCMSqlParams, uCMClientDataset;

Type
   TImpostoRetidoError  = Exception;
   TMomentoLancamento   = (mlLancamento, mlBaixa);
   TTipoExclusao        = (teAll, teSoBaixa, teSoLancamento);
   TTipoGetImposto      = (tgSoPessoa, tgClasFisRecDes, tgSoRecDes);
   TTipoInclusao        = (tiLancaImposto, tiSoCalculaValor);
   TTipoImpostoLancto   = (tilAll, tilAgregados, tilImpostos, tilNovoDoc, tilSomenteValor);

   TRecTipAgregConta = Record
      CODSUBCONTACONTAB : Double;
      UNIDNEGOCCONTAB   : Double;
      CODCENTROCUSTO    : String;
      PLANO             : Double;
      PLACONTA          : String;
   end;




   //DAVID - Retenção de Imposto
   TOnRetencaoINSS = function( IdForCli : integer; DataRetencao : TDateTime;
                               VlTeto, VlAnterior : Double;
                               var VlImposto, VlOutros : Double ) : boolean;

   TCtrlImpostoRetido = class(TCmControlObject)
   private
     sDataMesAno : string; //andre tavares pendencia 21377
     _PercCustAgreg              : Double;
     _DiasUteis                  : TDiasUteis;
     _Documento                  : TCtrlDocumento;
     _LancaContab                : TCtrlLancamento;
     _DtmImpostoObj              : TDtmImpostoObj;

     _iDiaSemanaLancto, _iDiasUteisLancto : ShortInt;

     _CodTipoCustoAgreg           : LongInt;
     _iNumDependentes            : LongInt;
     _VlrInss, _VlrPensao        : Double;
     _AcumulaMes, _DiminuiFaixa  : Boolean;
     _CalculaSobreValorBruto     : Boolean;

      { DAVID - 27/01/2003 - Pendência 15975
        Variável que conterá o somatório dos impostos em que o IRRF incide.}
     _TotalImpostosIncIRRF       : Double;

     //andre tavares - pendência 21377 - esta variável não é mais necessária
     _ValorBase{, _ValorRetido}  : Double;
     _ValorImposto               : Double;
     _ValorLancto                : Double;
     _DataRetencao               : TDateTime;
     _DataLancto                 : TDateTime;
     _DatadoLancto               : String;
     _NumLancto                  : LongInt;
     _Fator                      : Integer;
     _DebCre                     : String;
     _TipoGetImposto             : TTipoGetImposto;
     _CodTipRecDes               : String;
     _ClasFisCliFor              : LongInt;
     _CodNewDoc                  : LongInt;
     _IdForCli                   : LongInt;
     _IdForCliPortForma          : LongInt;
     _ContaCliFor, _CCustoCliFor : String;
     _UnidNegocCliFor,
     _SubContaCliFor             : Integer;
     _CodDocsAcumula             : String;
     _iCodCidade,_iCodPais       : LongInt;
     _sEstado                    : String;
     _ValorOriginal              : Double;
     fTipoExclusao               : TTipoExclusao;
     FIdForCli, FCodDocumento    : LongInt;
     FNumLancto                  : LongInt;
     FIdImpostoRetido            : LongInt;
     FValorLancto                : Double;
     FValorLiquido               : Double;
     fExcluiAlteradores          : Boolean;
     FDataLancto                 : TDateTime;
     FDataProgramada             : TDateTime;
     FDataEmissao                : TDateTime;
     FOperacaoDocumento          : String;
     FDebCre                     : String;
     FCodTipRecDes               : String;
     FCodCentroCusto             : String;
     FPrograma                   : LongInt;
     FMomentoLancamento          : TMomentoLancamento;
     FValorAlteradores           : Double;
     fNumLanctoOrigem            : LongInt;
     fCodTipoDoc                 : LongInt;
     fAlteraRetencao             : Boolean;
     fCodPortForma               : LongInt;
     fTipoInclusao               : TTipoInclusao;
     fNumLote                    : Double;
     fNumLoteManual              : Double;
     fValorBaseCalculaValor      : Double;
     fValorRetidoCalculaValor    : Double;
     fTipoImpostoLancto          : TTipoImpostoLancto;
     fCdsSimulacao               : TClientDataSet;
     FRecPag                     : Char;
     FIdEmpresa                  : LongInt;
     FIdUsuario                  : LongInt;
     FIdModulo                   : LongInt;
     FIdPlanoConta               : LongInt;
     FIntegraContab              : Boolean;
     FUsaPlanoPatro              : Boolean;
     FMascaraNoDocum             : String;
     FPartidaDobrada             :  Boolean;
    FIdEspAcesso: LongInt;
    FCodLancFinanc: LongInt;
    FCodPortConta: longInt;

     { DAVID - 27/01/2003 - Pendência 15975
       Função que indica se o tipo de imposto agregado passado como parâmetro
       é um imposto configurado nos parâmetros do IR como imposto de renda.}
     function ImpostoIRRF( iCodTipoCustAgreg : integer ) : boolean;

     function  GetImposto           : Boolean;
     function  GetFaixaImposto      : Boolean;
     function  GetNumDependentes    : LongInt;
     function  GetLancaImposto      : Boolean;
     function  GetOperacao          : String;

     function AutorizaLancamento    : Boolean;

     procedure EfetivaLancamento;
     procedure ExcluiAlteradoresLancados;
     procedure LancaDocumento;
     procedure ExcluiDocLancados;
     procedure AcumulaLancaImposto;

     //DAVID - Retenção de Imposto
     function RetemINSS( iCodTipoCustoAgreg, iIdForCli : integer; dData : TDateTime; var VlImposto : Double ) : boolean;

     procedure SetRecPag(const Value: Char);
     procedure SetIdEmpresa(const Value: LongInt);
     procedure SetIdUsuario(const Value: LongInt);
     procedure SetIdModulo(const Value: LongInt);
     procedure SetIdPlanoConta(const Value: LongInt);
     procedure SetIntegraContab(const Value: Boolean);
     procedure SetUsaPlanoPatro(const Value: Boolean);
     procedure SetMascaraNoDocum(const Value: String);
     procedure SetPartidaDobrada(const Value: Boolean);
     procedure SetIdEspAcesso(const Value: LongInt);
    procedure SetCodLancFinanc(const Value: LongInt);
    procedure SetCodPortConta(const Value: longInt);

   protected

      procedure DoChangeDataBase; override;
      procedure AfterInitialize; override;

   public

      //DAVID - Retenção de Imposto
      OnRetencaoINSS : TOnRetencaoINSS;

      constructor Create; override;
      destructor Destroy; override;


      //inicio - andre tavares - 21735 - function para inserir somente um imposto em particular do documento
      //procedure Incluir;
      procedure Incluir(const pCodTipoCustAgreg : Int64 = 0);
      //fim - andre tavares - 21735 - function para inserir somente um imposto em particular do documento
      procedure Alterar;
      procedure Excluir; overload;

      //andre tavares - 21735 - function para excluir somente um imposto em particular do documento
      function Excluir(CodDocumento, CodTipoCustAgreg : Int64): boolean; overload;

      procedure AlteraNumLancOrigem(iNumLancOld, iNumLancNew :LongInt);
      procedure EfetivaNovoDocumento;
      procedure CancelaAcumulaImposto;
      function  GetDataLancDocImposto(dData:TDateTime):TDateTime;

      function  IsCPMFTransf(iCodDocumento : Int64) : Boolean;
      function  ExcluiIntegracaoCPMFTransf(iCodDocumento : Int64) : Boolean;

      property  MomentoLancamento   : TMomentoLancamento read fMomentoLancamento       write fMomentoLancamento;
      property  TipoInclusao        : TTipoInclusao      read fTipoInclusao            write fTipoInclusao;
      property  TipoImpostoLancto   : TTipoImpostoLancto read fTipoImpostoLancto       write fTipoImpostoLancto;
      property  TipoExclusao        : TTipoExclusao      read fTipoExclusao            write fTipoExclusao;
      property  CdsSimulacao        : TClientDataSet     read fCdsSimulacao;

      property  NumLote                   : Double       read fNumLote                 write fNumLote;
      property  NumLoteManual             : Double       read fNumLoteManual           write fNumLoteManual;
      property  DebCre                    : String       read FDebCre                  write FDebCre;
      property  OperacaoDocumento         : String       read GetOperacao              write FOperacaoDocumento;
      property  CodTipRecDes              : String       read FCodTipRecDes            write FCodTipRecDes;
      property  CodCentroCusto            : String       read FCodCentroCusto          write FCodCentroCusto;
      property  Programa                  : LongInt      read FPrograma                write FPrograma;
      property  IdForCli                  : LongInt      read FIdForCli                write FIdForCli;
      property  CodDocumento              : LongInt      read FCodDocumento            write FCodDocumento;
      property  NumLancto                 : LongInt      read FNumLancto               write FNumLancto;
      property  NumLanctoOrigem           : LongInt      read fNumLanctoOrigem         write fNumLanctoOrigem;
      property  ValorLancto               : Double       read FValorLancto             write FValorLancto;
      property  ValorLiquido              : Double       read FValorLiquido            write FValorLiquido;
      property  DataProgramada            : TDateTime    read FDataProgramada          write FDataProgramada;
      property  DataLancto                : TDateTime    read FDataLancto              write FDataLancto;
      property  DataEmissao               : TDateTime    read FDataEmissao             write FDataEmissao;
      property  ExcluiAlteradores         : Boolean      read fExcluiAlteradores       write fExcluiAlteradores;
      property  IDImpostoRetido           : LongInt      read FIdImpostoRetido         write FIdImpostoRetido;
      property  CodTipoDoc                : LongInt      read fCodTipoDoc              write fCodTipoDoc;
      property  CodPortForma              : LongInt      read fCodPortForma            write fCodPortForma;
      property  ValorBaseCalculaValor     : Double       read fValorBaseCalculaValor   write fValorBaseCalculaValor;
      property  ValorRetidoCalculaValor   : Double       read fValorRetidoCalculaValor write fValorRetidoCalculaValor;
      property  NumDependentes            : LongInt      read GetNumDependentes;
      property  ValorAlteradores          : Double       read FValorAlteradores;
      property  AlteraRetencao            : Boolean      read fAlteraRetencao;
      property  RecPag                    : Char         read FRecPag                  write SetRecPag;
      property  IDEmpresa                 : LongInt      read FIdEmpresa               write SetIdEmpresa;
      property  IDUsuario                 : LongInt      read FIdUsuario               write SetIdUsuario;
      property  IDModulo                  : LongInt      read FIdModulo                write SetIdModulo;
      //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
      property  IdEspAcesso               : LongInt      read FIdEspAcesso             write SetIdEspAcesso;
      property  IDPlanoConta              : LongInt      read FIdPlanoConta            write SetIdPlanoConta;
      property  UsaPlanoPatro             : Boolean      read FUsaPlanoPatro           write SetUsaPlanoPatro;
      property  IntegraContab             : Boolean      read FIntegraContab           write SetIntegraContab;
      property  MascaraNoDocum            : String       read FMascaraNoDocum          write SetMascaraNoDocum;
      property  PartidaDobrada            : Boolean      read FPartidaDobrada          write SetPartidaDobrada;
      //andre tavares - pendencia 22316 - 11/04/2006 para posder fazer a tranferencia entre contas.
      property  CodLancFinanc             : LongInt read FCodLancFinanc write SetCodLancFinanc;
      //andre tavares - pendencia 22316 - 11/04/2006 para posder fazer a tranferencia entre contas.
      property  CodPortConta              : LongInt read FCodPortConta write SetCodPortConta;


   end;




implementation
uses
   uString, uDataBase, JclMath, uCMMath;
{ TCtrlImpostoRetido }





procedure TCtrlImpostoRetido.AfterInitialize;
begin
   inherited;

   _DiasUteis.InitializeAs(Self);
   _Documento.InitializeAs(Self);
   _LancaContab.InitializeAs(Self);
end;



constructor TCtrlImpostoRetido.Create;
var
  X: Integer;
begin
   inherited;

   fPartidaDobrada := false;
   _DiasUteis := TDiasUteis.Create;
   _LancaContab := TCtrlLancamento.Create;
   _Documento := TCtrlDocumento.Create;
   _ClasFisCliFor     := 0;
   _CodDocsAcumula    := '';

   _DtmImpostoObj := TDtmImpostoObj.Create(nil);
   For X:=0 To _DtmImpostoObj.ComponentCount - 1 do
     if _DtmImpostoObj.Components[x] is TCMSqlParams then
        TCMSqlParams(_DtmImpostoObj.Components[x]).ControlObject := Self;

   fCdsSimulacao              := TClientDataSet.Create(nil);
   fExcluiAlteradores         := True;
   fMomentoLancamento         := mlLancamento;
   FIdImpostoRetido           := 0;
   fNumLanctoOrigem           := 0;
   fTipoExclusao              := teAll;
   FCodTipRecDes              := '';
   FCodCentroCusto            := '';
   FPrograma                  := 0;
   fCodPortForma              := 0;
   fTipoInclusao              := TiLancaImposto;
   fTipoImpostoLancto         := tilAll;
   fNumLote                   := 0.00;
   fNumLoteManual             := 0.00;
   fValorBaseCalculaValor     := 0.00;
   fValorRetidoCalculaValor   := 0.00;
   fAlteraRetencao            := false;
   FIdEmpresa                 := 0;
   fRecPag                    := 'R';
   FIdUsuario                 := 0;
   //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
   FIdEspAcesso               := 0;
   FIdModulo                  := 0;
   FIdPlanoConta              := 0;

   //  Rodolpho - 31/01/2005
   //  Instanciando esta propriedade como FALSE, gerou registros
   //no PLanoSaldo com Plano e Patro null
   //FUsaPlanoPatro             := False;
   FUsaPlanoPatro             := True;


   FIntegraContab             := False;
   FMascaraNoDocum            := '';
end;




destructor TCtrlImpostoRetido.Destroy;
begin
   fCdsSimulacao.Free;

  _DiasUteis.Free;
  _Documento.Free;
  _LancaContab.Free;
  _DtmImpostoObj.Free;

  inherited;
end;




procedure TCtrlImpostoRetido.DoChangeDataBase;
begin
  inherited;
  _Documento.DataBase := DataBase;
end;




function  TCtrlImpostoRetido.GetOperacao:String;
begin
   Result := Trim(FOperacaoDocumento);
end;




function TCtrlImpostoRetido.GetLancaImposto:Boolean;
var
  rValorPorRateio :Double;
begin
  Result := ((fTipoImpostoLancto = tilAll) Or
             ((fTipoImpostoLancto = tilAgregados) And (_DtmImpostoObj.CdsImposto.FieldByName('CODTRATFISCD').AsString = 'A')) Or
             ((fTipoImpostoLancto = tilImpostos) And (_DtmImpostoObj.CdsImposto.FieldByName('CODTRATFISCD').AsString = '8')) Or
             ((fTipoImpostoLancto = tilNovoDoc) And (_DtmImpostoObj.CdsImposto.FieldByName('CODTRATFISCD').AsString = 'B')) Or
             ((fTipoImpostoLancto = tilSomenteValor) And (_DtmImpostoObj.CdsImposto.FieldByName('CODTRATFISCD').AsString = '9')));

  //Verifica o momento do lançamento
  Result := Result And
            (((fMomentoLancamento = mlLancamento) And (_DtmImpostoObj.CdsImposto.FieldByName('FLGLANCAIMPOSTO').AsString <> 'B')) Or
            ((fMomentoLancamento = mlBaixa) And (_DtmImpostoObj.CdsImposto.FieldByName('FLGLANCAIMPOSTO').AsString  = 'B')));

  if Result then
  begin
     _DatadoLancto := _DtmImpostoObj.CdsImposto.FieldByName('LANCAMENTOIMPOSTO').AsString;
     if _DatadoLancto = 'L' then
        _DataRetencao := FDataLancto
     else
        if _DatadoLancto = 'P' then
           _DataRetencao := FDataProgramada
        else
        begin
           if FDataEmissao = 0 then
              FDataEmissao := FDataLancto;
           _DataRetencao := FDataEmissao;
        end;

     _CalculaSobreValorBruto := ((_DtmImpostoObj.CdsImposto.FieldByName('FLGCALCVALBRUTO').AsString <> 'N') Or (FValorLiquido = 0));

    if _CalculaSobreValorBruto then
       _ValorOriginal := fValorLancto
    else
       _ValorOriginal := FValorLiquido;

    //if (_DtmImpostoObj.CdsImpostoFLGSEMPRECALCULA.AsString = 'S') And
    //   (_DtmImpostoObj.CdsImposto.FieldByName('VALORIMPOSTO').AsFloat <> 0.00) then
    //   rValorPorRateio := _ValorOriginal
    //else
       rValorPorRateio := _DtmImpostoObj.CdsImposto.FieldByName('VALORIMPOSTO').AsFloat;//Valor da Tabela de Impostos;

     if _CalculaSobreValorBruto then
        _ValorLancto := rValorPorRateio
     else
        _ValorLancto := FValorLiquido * rValorPorRateio/fValorLancto;

     Result := {(}(_ValorLancto > 0 ) {or _DevolucaoImposto)};
  end;
end;




function TCtrlImpostoRetido.GetNumDependentes: Integer;
begin
  _Cds.Data := GetDataPacket('SELECT NUMDEPENDENTES FROM FORNSERV WHERE IDPESSOA = ' + IntToStr(FIdForCli));

  if (not _Cds.IsEmpty) And (fRecPag = 'P') then
     Result := _Cds.FieldByName('NUMDEPENDENTES').AsInteger
  else
     Result := 0;

  _Cds.Data := GetDataPacket('SELECT VLRINSS, VLRPENSAO FROM PESSOAFISICA WHERE IDPESSOA = ' + IntToStr(FIdForCli));

  if (not _Cds.IsEmpty) then
  begin
     _VlrInss := _Cds.Fields[0].AsFloat;
     _VlrPensao := _Cds.Fields[1].AsFloat;
  end
  else
  begin
     _VlrInss := 0;
     _VlrPensao := 0;
  end;

  if _Cds.Active then _Cds.Close;
end;




function TCtrlImpostoRetido.GetImposto :Boolean;
var
  sSqlImposto, SqlCalcRateio :String;
begin
  if FCodTipRecDes <> '' then
  begin
     if _TipoGetImposto = tgSoPessoa then
        SqlCalcRateio := ' (SELECT (' + FloatToStrCM( FValorLancto ) + ') AS VALORIMPOSTO FROM DUAL) QTOTALPORDESEMB '
     else
     begin
        if Trim(FCodCentroCusto) = '' then
           SqlCalcRateio := ' (SELECT (' + IntToStr(fPrograma) + ') AS IDPROGRAMA, (''@'') AS CODCENTROCUSTO, (''' + Espaco(Trim(FCodTipRecDes),15) + ''') AS CODTIPRECDES, (' + FloatToStrCM( FValorLancto ) + ') AS VALORIMPOSTO FROM DUAL) QTOTALPORDESEMB '
        else
           SqlCalcRateio := ' (SELECT (' + IntToStr(fPrograma) + ') AS IDPROGRAMA, (''' + Espaco(Trim(FCodCentroCusto),10) + ''') AS CODCENTROCUSTO, (''' + Espaco(Trim(FCodTipRecDes),15) + ''') AS CODTIPRECDES, (' + FloatToStrCM( FValorLancto ) + ') AS VALORIMPOSTO FROM DUAL) QTOTALPORDESEMB ';
     end;
  end
  else
  begin
     if Trim(FOperacaoDocumento) = '3' then
     begin
         if _TipoGetImposto = tgSoPessoa then
            SqlCalcRateio :=
                    ' (SELECT DISTINCT ' +
                    '   SUM(((' + FloatToStrCM( FValorLancto ) + ' * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO ' +
                    ' FROM ' +
                    '   (SELECT ' +
                    '      DOC.NUMFATURA, ' +
                    '      LAN.VALOR ' +
                    '   FROM ' +
                    '      DOCUMENTO DOC, ' +
                    '      LANCTODOCUM LAN ' +
                    '   WHERE ' +
                    '     (DOC.CODDOCUMENTO = ' + FloatToStr(FCodDocumento) + ') AND ' +
                    '     ((LAN.OPERACAO = ''3'') OR (LAN.OPERACAO = ''13'')) AND ' +
                    '      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1, ' +
                    '  (SELECT ' +
                    '    D.NUMFATURA, ' +
                    '    RD.VALOR ' +
                    '   FROM ' +
                    '    RATEIODOCUM RD, DOCUMENTO D, TIPORECEBDESEMB TRD ' +
                    '   WHERE ' +
                    '    (D.NUMFATURA IS not NULL) AND ' +
                    '    (TRD.FLGCALCULAIMPOSTO = ''S'') AND ' +
                    '    (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND ' +
                    '    (RD.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                    '    (RD.RECPAG       = TRD.RECPAG) AND ' +
                    '    (RD.IDPESSOA     = TRD.IDPESSOA)) Q2, ' +
                    '   (SELECT ' +
                    '     D.NUMFATURA, SUM(L.VALOR) AS VALOR ' +
                    '    FROM ' +
                    '     LANCTODOCUM L, DOCUMENTO D ' +
                    '    WHERE ' +
                    '     ((L.OPERACAO = ''1'') OR  (L.OPERACAO = ''11'')) AND ' +
                    '     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                    '     (D.OPERACAO = L.OPERACAO) AND ' +
                    '     (D.NUMFATURA IS not NULL) ' +
                    '    GROUP BY D.NUMFATURA) Q3 ' +
                    ' WHERE ' +
                    '   (Q1.NUMFATURA = Q2.NUMFATURA) AND ' +
                    '   (Q3.NUMFATURA = Q2.NUMFATURA)) QTOTALPORDESEMB '
        else
            SqlCalcRateio :=
                    '(SELECT DISTINCT ' +
                    '  Q2.CODTIPRECDES, ' +
                    '  DECODE(Q2.CODCENTROCUSTO,NULL,''@'',Q2.CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                    '  DECODE(Q2.IDPROGRAMA,NULL,0,Q2.IDPROGRAMA) AS IDPROGRAMA, ' +
                    '  SUM(((' + FloatToStrCM( FValorLancto ) + ' * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO ' +
                    ' FROM ' +
                    '  (SELECT ' +
                    '     DOC.NUMFATURA, ' +
                    '     LAN.VALOR ' +
                    '  FROM ' +
                    '     DOCUMENTO DOC, ' +
                    '     LANCTODOCUM LAN ' +
                    '  WHERE ' +
                    '    (DOC.CODDOCUMENTO = ' + FloatToStr(FCodDocumento) + ') AND ' +
                    '    ((LAN.OPERACAO = ''3'') OR (LAN.OPERACAO = ''13'')) AND ' +
                    '     (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1, ' +
                    ' (SELECT ' +
                    '   D.NUMFATURA, ' +
                    '   RD.VALOR, ' +
                    '   TRD.CODTIPRECDES, ' +
                    '   RD.CODCENTROCUSTO, ' +
                    '   RD.IDPROGRAMA ' +
                    '  FROM ' +
                    '   RATEIODOCUM RD, DOCUMENTO D, TIPORECEBDESEMB TRD ' +
                    '  WHERE ' +
                    '   (D.NUMFATURA IS not NULL) AND ' +
                    //'   (TRD.FLGCALCULAIMPOSTO = ''S'') AND ' +
                    '   (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND ' +
                    '   (RD.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                    '   (RD.RECPAG       = TRD.RECPAG) AND ' +
                    '   (RD.IDPESSOA     = TRD.IDPESSOA)) Q2, ' +
                    '  (SELECT ' +
                    '    D.NUMFATURA, SUM(L.VALOR) AS VALOR ' +
                    '   FROM ' +
                    '    LANCTODOCUM L, DOCUMENTO D ' +
                    '   WHERE ' +
                    '    ((L.OPERACAO = ''1'') OR  (L.OPERACAO = ''11'')) AND ' +
                    '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                    '    (D.OPERACAO = L.OPERACAO) AND ' +
                    '    (D.NUMFATURA IS not NULL) ' +
                    '   GROUP BY D.NUMFATURA) Q3 ' +
                    ' WHERE ' +
                    '  (Q1.NUMFATURA = Q2.NUMFATURA) AND ' +
                    '  (Q3.NUMFATURA = Q2.NUMFATURA) ' +
                    ' GROUP ' +
                    '  BY Q2.CODCENTROCUSTO, Q2.CODTIPRECDES, Q2.IDPROGRAMA) QTOTALPORDESEMB ';
     end
     else
     begin
         if _TipoGetImposto = tgSoPessoa then
            SqlCalcRateio :=
                    ' (SELECT DISTINCT ' +
                    '   ((' + FloatToStrCM( FValorLancto ) + ' * QRATEIO.VALOR)/QDOCINI.VALOR) AS VALORIMPOSTO ' +
                    ' FROM ' +
                    '  (SELECT ' +
                    '     SUM(R.VALOR) AS VALOR, R.CODDOCUMENTO ' +
                    '   FROM ' +
                    '     RATEIODOCUM R, ' +
                    '     TIPORECEBDESEMB TRD ' +
                    '   WHERE ' +
                    '     (R.CODDOCUMENTO = ' + FloatToStr(FCodDocumento) + ') AND ' +
                    '     (R.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                    '     (R.RECPAG       = TRD.RECPAG) AND ' +
                    '     (R.IDPESSOA     = TRD.IDPESSOA) AND ' +
                    '     (TRD.FLGCALCULAIMPOSTO = ''S'') ' +
                    '   GROUP BY ' +
                    '     R.CODDOCUMENTO) QRATEIO, ' +
                    '  (SELECT ' +
                    '     L.VALOR, L.CODDOCUMENTO ' +
                    '   FROM ' +
                    '     DOCUMENTO D, LANCTODOCUM L ' +
                    '   WHERE ' +
                    '     (D.CODDOCUMENTO = ' + FloatToStr(FCodDocumento) + ') AND ' +
                    '     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                    '     (D.OPERACAO = L.OPERACAO)) QDOCINI ' +
                    ' WHERE ' +
                    '   QRATEIO.CODDOCUMENTO = QDOCINI.CODDOCUMENTO ) QTOTALPORDESEMB '
         else
               SqlCalcRateio :=
                       '(SELECT DISTINCT ' +
                       '  QRATEIO.CODTIPRECDES, ' +
                       '  DECODE(QRATEIO.CODCENTROCUSTO,NULL,''@'',QRATEIO.CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                       '  DECODE(QRATEIO.IDPROGRAMA,NULL,0,QRATEIO.IDPROGRAMA) AS IDPROGRAMA, ' +
                       '  SUM(((' + FloatToStrCM( FValorLancto ) + ' * QRATEIO.VALOR)/QDOCINI.VALOR)) AS VALORIMPOSTO  ' +
                       ' FROM ' +
                       ' (SELECT ' +
                       '    SUM(R.VALOR) AS VALOR, R.CODDOCUMENTO, TRD.CODTIPRECDES, R.CODCENTROCUSTO, R.IDPROGRAMA ' +
                       '  FROM ' +
                       '    RATEIODOCUM R, ' +
                       '    TIPORECEBDESEMB TRD ' +
                       '  WHERE ' +
                       '    (R.CODDOCUMENTO = ' + FloatToStr(FCodDocumento) + ') AND ' +
                       '    (R.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
                       '    (R.RECPAG       = TRD.RECPAG) AND ' +
                       '    (R.IDPESSOA     = TRD.IDPESSOA) ' +
                       //'    (TRD.FLGCALCULAIMPOSTO = ''S'') ' +
                       '  GROUP BY ' +
                       '    R.CODDOCUMENTO, TRD.CODTIPRECDES, R.CODCENTROCUSTO, R.IDPROGRAMA) QRATEIO, ' +
                       ' (SELECT ' +
                       '    L.VALOR, L.CODDOCUMENTO ' +
                       '  FROM ' +
                       '    DOCUMENTO D, LANCTODOCUM L ' +
                       '  WHERE ' +
                       '    (D.CODDOCUMENTO = ' + FloatToStr(FCodDocumento) + ') AND ' +
                       '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                       '    (D.OPERACAO = L.OPERACAO)) QDOCINI ' +
                       ' WHERE ' +
                       '  QRATEIO.CODDOCUMENTO = QDOCINI.CODDOCUMENTO ' +
                       ' GROUP BY QRATEIO.CODTIPRECDES, QRATEIO.CODCENTROCUSTO, QRATEIO.IDPROGRAMA) QTOTALPORDESEMB ';
     end;
  end;

  Case _TipoGetImposto of
    //Lança os impostos associados ao Cliente/Fornecedor
    tgSoPessoa:
    begin
       sSqlImposto :=
       ' SELECT DISTINCT ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, SUM(QTOTALPORDESEMB.VALORIMPOSTO) AS VALORIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, (''S'') AS FLGCALCULAIMPOSTO, T.FLGUSAVALFORCLI  ' +
       {DAVID - Pendência 15975} ' , decode( TA.FLGINCIDEIRRF, ''S'', 0, 1 ) as ORDEM ' +
       ' FROM ' +
       '  TIPOAGRE T, FORCLIXAGREG F, TIPOALTERADOR TA, ' +
       SqlCalcRateio +
       ' WHERE ' +
       '  (F.IDPESSOA = ' + FloatToStr(FIdEmpresa) + ')  AND ' +
       '  (F.IDFORCLI = ' + FloatToStr(FIdForCli) + ')  AND ' +
       '  (F.RECPAG = ' + QuotedStr(FRecPag) + ')       AND ' +
       '  (T.CODALTERADOR = TA.CODALTERADOR(+)) AND ' +
       '  (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) ' +
       ' GROUP BY ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, T.FLGUSAVALFORCLI ' +
       {DAVID - Pendência 15975} ' , TA.FLGINCIDEIRRF order by ORDEM ';
    end;
    //Lança os impostos associados a classificação fiscal e tipo de desembolso
    tgClasFisRecDes:
    begin
       sSqlImposto :=
       ' SELECT DISTINCT ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, SUM(QTOTALPORDESEMB.VALORIMPOSTO) AS VALORIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO, T.FLGUSAVALFORCLI ' +
       {DAVID - Pendência 15975} ' , decode( TA.FLGINCIDEIRRF, ''S'', 0, 1 ) as ORDEM ' +
       ' FROM ' +
       '  TIPOAGRE T, TIPOALTERADOR TA, CLASFISXTIPOAGRE CA, TIPRECDESXTIPAGRE TR, TIPORECEBDESEMB TRD, ' +
       SqlCalcRateio +
       ' WHERE ' +
       '  (T.CODALTERADOR = TA.CODALTERADOR(+)) AND ' +
       '  (TR.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
       '  (TR.IDPESSOA = TRD.IDPESSOA) AND ' +
       '  (TR.RECPAG = TRD.RECPAG) AND ' +
       '  (T.CODTIPOCUSTAGREG = TR.CODTIPOCUSTAGREG) AND ' +
       '  (T.CODTIPOCUSTAGREG = CA.CODTIPOCUSTAGREG) AND ' +
       '  (CA.IDCLASFISCLIFOR = ' + FloatToStr(_ClasFisCliFor) + ') AND ' +
       '  (CA.RECPAG = ' + QuotedStr(FRecPag) + ') AND ' +
       '  (QTOTALPORDESEMB.CODTIPRECDES = TR.CODTIPRECDES) AND ' +
       '  (QTOTALPORDESEMB.CODCENTROCUSTO = DECODE(TR.CODCENTROCUSTO,NULL,''@'',TR.CODCENTROCUSTO)) AND ' +
       (*
       '  (( (QTOTALPORDESEMB.CODCENTROCUSTO = DECODE(TR.CODCENTROCUSTO,NULL,''@'',TR.CODCENTROCUSTO)) AND ((FLGCALCALLCC IS NULL) OR (FLGCALCALLCC = ''N''))) OR' +
       '    ( (QTOTALPORDESEMB.CODCENTROCUSTO IS not NULL) AND (TR.CODCENTROCUSTO IS NULL) AND (TR.FLGCALCALLCC = ''S''))) AND ' +
       *)
       '  (QTOTALPORDESEMB.IDPROGRAMA = DECODE(TR.IDPROGRAMA,NULL,0,TR.IDPROGRAMA)) AND ' +
       '  (RTRIM(TR.CODTIPRECDES) IN (' + _CodTipRecDes + ') ) AND ' +
       '  (TR.RECPAG = ' + QuotedStr(FRecPag) + ') AND ' +
       '  (TR.IDPESSOA = ' + FloatToStr(FIdEmpresa) + ') AND ' +
       '  (T.CODTIPOCUSTAGREG not IN ' + //Busca o TipoAgre Que não está associado ao fornecedor
       '      (SELECT ' +
       '          CODTIPOCUSTAGREG ' +
       '       FROM ' +
       '          FORCLIXAGREG ' +
       '       WHERE ' +
       '         (IDPESSOA = ' + FloatToStr(FIdEmpresa) + ')  AND ' +
       '         (IDFORCLI = ' + FloatToStr(FIdForCli) + ')  AND ' +
       '         (RECPAG = ' + QuotedStr(FRecPag) + '))) ' +
       ' GROUP BY ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO, T.FLGUSAVALFORCLI ' +
       {DAVID - Pendência 15975} ' , TA.FLGINCIDEIRRF order by ORDEM ';
    end;
    //Lança os impostos associados ao tipo de desembolso/recebimento
    tgSoRecDes:
    begin
       sSqlImposto :=
       ' SELECT DISTINCT ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO,  SUM(QTOTALPORDESEMB.VALORIMPOSTO) AS VALORIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO, T.FLGUSAVALFORCLI ' +
       {DAVID - Pendência 15975} ' , decode( TA.FLGINCIDEIRRF, ''S'', 0, 1 ) as ORDEM ' +       
       ' FROM ' +
       '  TIPOAGRE T, TIPOALTERADOR TA, TIPRECDESXTIPAGRE TR, TIPORECEBDESEMB TRD, ' +
       SqlCalcRateio +
       ' WHERE ' +
       '  (T.CODALTERADOR = TA.CODALTERADOR(+)) AND ' +
       '  (T.CODTIPOCUSTAGREG = TR.CODTIPOCUSTAGREG) AND ' +
       '  (TR.CODTIPRECDES = TRD.CODTIPRECDES) AND ' +
       '  (TR.IDPESSOA = TRD.IDPESSOA) AND ' +
       '  (TR.RECPAG = TRD.RECPAG) AND ' +
       '  (QTOTALPORDESEMB.CODCENTROCUSTO(+) = DECODE(TR.CODCENTROCUSTO,NULL,''@'',TR.CODCENTROCUSTO)) AND ' +
       '  (QTOTALPORDESEMB.CODTIPRECDES(+) = TR.CODTIPRECDES) AND ' +
       '  (QTOTALPORDESEMB.IDPROGRAMA(+) = DECODE(TR.IDPROGRAMA,NULL,0,TR.IDPROGRAMA)) AND ' +
       (*
       '  (( (QTOTALPORDESEMB.CODCENTROCUSTO = DECODE(TR.CODCENTROCUSTO,NULL,''@'',TR.CODCENTROCUSTO)) AND ((FLGCALCALLCC IS NULL) OR (FLGCALCALLCC = ''N''))) OR' +
       '    ( (QTOTALPORDESEMB.CODCENTROCUSTO IS not NULL) AND (TR.CODCENTROCUSTO IS NULL) AND (TR.FLGCALCALLCC = ''S''))) AND ' +
       '  (QTOTALPORDESEMB.CODTIPRECDES = TR.CODTIPRECDES) AND ' +
       '  (QTOTALPORDESEMB.IDPROGRAMA = DECODE(TR.IDPROGRAMA,NULL,0,TR.IDPROGRAMA)) AND ' +
       *)
       '  (RTRIM(TR.CODTIPRECDES) IN (' + _CodTipRecDes + ')) AND ' +
       '  (TR.RECPAG = ' + QuotedStr(FRecPag) + ') AND ' +
       '  (TR.IDPESSOA = ' + FloatToStr(FIdEmpresa) + ') AND ' +
       '  ((T.FLGASSOCIACLASFIS = ''N'') OR (FLGASSOCIACLASFIS IS NULL)) AND ' +
       '  (T.CODTIPOCUSTAGREG not IN ' + //Busca o TipoAgre Que não está associado ao fornecedor
       '      (SELECT ' +
       '          CODTIPOCUSTAGREG ' +
       '       FROM ' +
       '          FORCLIXAGREG ' +
       '       WHERE ' +
       '         (IDPESSOA = ' + FloatToStr(FIdEmpresa) + ')  AND ' +
       '         (IDFORCLI = ' + FloatToStr(FIdForCli) + ')  AND ' +
       '         (RECPAG = ' + QuotedStr(FRecPag) + '))) ' +
       ' GROUP BY ' +
       '  T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC, T.CODALTERADOR, ' +
       '  T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOIMPOSTO, ' +
       '  T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIMPOSTO, T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, TRD.FLGCALCULAIMPOSTO, T.FLGUSAVALFORCLI ' +
       {DAVID - Pendência 15975} ' , TA.FLGINCIDEIRRF order by ORDEM ';
    end;
  end;

  { Rodolpho da Silva - 09/12/2005
  With _DtmImpostoObj.SQLImposto do
  begin
     Sql.Text := sSqlImposto;
     Prepare;
     ParamByName('IDPESSOA').AsFloat := fIdEmpresa;
     ParamByName('IDFORCLI').AsFloat := FIdForCli;
     ParamByName('RECPAG').AsString := fRecPag;
     ParamByName('VALORLANCADO').AsFloat := FValorLancto;

     if FCodTipRecDes = '' then
          ParamByName('CODDOCUMENTO').AsFloat := FCodDocumento;

     if _TipoGetImposto = tgClasFisRecDes then
        ParamByName('IDCLASFISCLIFOR').AsFloat := _ClasFisCliFor;

     Open;
     Result := not(_DtmImpostoObj.CdsImposto.IsEmpty);
  end;
  }

  _DtmImpostoObj.CdsImposto.Data := GetDataPacket(sSqlImposto);

  Result := not(_DtmImpostoObj.CdsImposto.IsEmpty);
end;




function TCtrlImpostoRetido.GetFaixaImposto: Boolean;
begin
   _DtmImpostoObj.SQLFaixaImposto.Prepare;

   if _ValorBase < 0 then
   begin
      _DtmImpostoObj.SQLFaixaImposto.ParamByName('PVLRINICIALFAIXA').AsFloat  := 0;
   end
   else
   begin
      _DtmImpostoObj.SQLFaixaImposto.ParamByName('PVLRINICIALFAIXA').AsFloat  := _ValorBase;
   end;

   _DtmImpostoObj.SQLFaixaImposto.ParamByName('PCODTIPOCUSTAGREG').AsFloat    := _CodTipoCustoAgreg;

   // André Pontes - 02/07/2003 - pendência 4938
   _DtmImpostoObj.SQLFaixaImposto.ParamByName('PDATA').AsDate                 := FDataEmissao;
   // Fim André Pontes - 02/07/2003 - pendência 4938

   _DtmImpostoObj.SQLFaixaImposto.Open; //andre tavares - pendência 21219 - 06/02/2006 - alterei esta query pois não estava buscando as faixas devidamente

   _DtmImpostoObj.CdsFaixaImposto.First;
   Result := not(_DtmImpostoObj.CdsFaixaImposto.IsEmpty);
end;





function TCtrlImpostoRetido.AutorizaLancamento:Boolean;
begin
   //Não lança imposto se o tipo do documento <> fiscal e o fmomentolancamento <> MlBaixa
   Result := (FMomentoLancamento = MlBaixa);

   if not Result then
   begin
      _Cds.Data := GetDataPacket(' SELECT ' +
                                 '  CODTIPDOC ' +
                                 ' FROM ' +
                                 '  TIPODOCRECPAG ' +
                                 ' WHERE ' +
                                 '  ((FLGDOCFISCAL = ''S'') OR (FLGDOCFISCAL IS NULL)) AND ' +
                                 '  (CODTIPDOC =  ' + intToStr(fCodTipoDoc) + ')');
      Result := (not _Cds.IsEmpty);
      if _Cds.Active then _Cds.Close;
   end;
end;



//andre tavares - 21735 - Parâmero opcional para inserir somente um imposto em particular do documento
//procedure TCtrlImpostoRetido.Incluir;
procedure TCtrlImpostoRetido.Incluir(const pCodTipoCustAgreg : Int64 = 0);
var
  sOperacao :String;
  bEDocFiscal :Boolean;
begin
   { DAVID - 27/01/2003 - Pendência 15975
     Ao iniciar a inclusão dos impostos, zera o somatório dos impostos em que
     o IR incide. }
   _TotalImpostosIncIRRF := 0;

   bEDocFiscal := AutorizaLancamento;

   if not _DtmImpostoObj.CdsAcumula.Active then _DtmImpostoObj.SQLAcumula.Open;

   //início - andre tavares - pendência - 21735 - 15/05/2006
   if pCodTipoCustAgreg > 0 then
   begin
     _DtmImpostoObj.CdsAcumula.Filtered := false;
     _DtmImpostoObj.CdsAcumula.filter := ' CODTIPOCUSTAGREG = '+ intToStr(pCodTipoCustAgreg);
     _DtmImpostoObj.CdsAcumula.Filtered := true;
   end;
   //fim - andre tavares - pendência - 21735 - 15/05/2006

   //Busca o Fornecedor associado ao portadorforma
   _IdForCli := 0;
   _IdForCliPortForma := 0;

   if fCodPortForma <> 0 then
   begin
     if _DtmImpostoObj.CdsPortForma.Active then _DtmImpostoObj.CdsPortForma.Close;

     _DtmImpostoObj.SQLPortForma.Prepare;
     _DtmImpostoObj.SQLPortForma.ParamByName('CODPORTFORMA').AsFloat := fCodPortForma;
     _DtmImpostoObj.SQLPortForma.ParamByName('IDPESSOA').AsFloat := fIdEmpresa;
     _DtmImpostoObj.SQLPortForma.open;

     _DtmImpostoObj.CdsPortForma.First;
     if not _DtmImpostoObj.CdsPortForma.IsEmpty then
     begin
        _IdForCliPortForma := _DtmImpostoObj.CdsPortForma.FieldByName('IdForCli').AsInteger;
        _IdForCli        := _DtmImpostoObj.CdsPortForma.FieldByName('IdForCli').AsInteger;
        _ContaCliFor     := _DtmImpostoObj.CdsPortForma.FieldByName('CONTACONTABIL').AsString;
        _CCustoCliFor    := _DtmImpostoObj.CdsPortForma.FieldByName('CODCENTROCUSTO').AsString;
        _UnidNegocCliFor := _DtmImpostoObj.CdsPortForma.FieldByName('UNIDNEGOC').AsInteger;
        _SubContaCliFor  := _DtmImpostoObj.CdsPortForma.FieldByName('CODSUBCONTA').AsInteger;
     end;
   end;

   //Busca A Classificação Fiscal
   _DtmImpostoObj.SQLClasFisCliFor.Prepare;
   _DtmImpostoObj.SQLClasFisCliFor.ParamByname('IDPESSOA').AsFloat := fIdEmpresa;
   _DtmImpostoObj.SQLClasFisCliFor.Open;

   _DtmImpostoObj.CdsClasFisCliFor.First;

   _ClasFisCliFor := _DtmImpostoObj.CdsClasFisCliFor.FieldByName('IDCLASFISCLIFOR').AsInteger;
   _DtmImpostoObj.CdsClasFisCliFor.Close;

   //Abrir a QryDesenbolso - Contém os rateios do documento que está sendo lançado
   _CodTipRecDes := '';
   sOperacao     := FOperacaoDocumento;

   //Se FCodTipRecDes <> '' ... O Cálculo do imposto é uma simulação não existindo a 'figura do documento'
   if FCodTipRecDes <> '' then
   begin
     if fCdsSimulacao.Active then
     begin
        if fCdsSimulacao.ChangeCount > 0 then fCdsSimulacao.CancelUpdates;
        fCdsSimulacao.Close;
     end;

     fCdsSimulacao.Data := GetDataPacket(' SELECT (0) AS IDIMPOSTO, (0) AS VALORIMPOSTO, (0) AS PERCIMPOSTO, (0) AS VALORBASE  ' +
                                         ' FROM TIPOAGRE WHERE 1=2 ');


     _CodTipRecDes := '''' + FCodTipRecDes + '''';
   end
   else
   begin
     //Loop pelos desembolsos do documento a ser incluso
     Case sOperacao[1] of
       '1','2': _DtmImpostoObj.SQLRateioImposto.SQL.Assign(_DtmImpostoObj.SQLRateioImposto2.SQL);
       '3': _DtmImpostoObj.SQLRateioImposto.SQL.Assign(_DtmImpostoObj.SQLRateioImposto3.SQL);
     end;

     _DtmImpostoObj.SQLRateioImposto.Prepare;
     _DtmImpostoObj.SQLRateioImposto.ParamByname('CODDOCUMENTO').AsFloat := FCodDocumento;
     _DtmImpostoObj.SQLRateioImposto.Open;

     _DtmImpostoObj.CdsRateioImposto.First;
     while (not _DtmImpostoObj.CdsRateioImposto.Eof) do
     begin
         _CodTipRecDes := _CodTipRecDes + '''' + Trim(_DtmImpostoObj.CdsRateioImposto.FieldByName('CODTIPRECDES').AsString) + ''',';
        _DtmImpostoObj.CdsRateioImposto.Next;
     end;

     _DtmImpostoObj.CdsRateioImposto.Close;
     _CodTipRecDes := Copy(_CodTipRecDes,1,Length(_CodTipRecDes)-1);
   end;

   fAlteraRetencao := false;

   if Trim(_CodTipRecDes) <> '' then
   begin
      //Lança os impostos associados ao Cliente/Fornecedor
      FValorAlteradores := 0;

      _TipoGetImposto := tgSoPessoa;
      if GetImposto then
      begin
         _iNumDependentes  := NumDependentes;

         //início - andre tavares - pendência - 21735 - 15/05/2006
         if pCodTipoCustAgreg > 0 then
         begin
           _DtmImpostoObj.CdsImposto.Filtered := false;
           _DtmImpostoObj.CdsImposto.filter := ' CODTIPOCUSTAGREG = '+ intToStr(pCodTipoCustAgreg);
           _DtmImpostoObj.CdsImposto.Filtered := true;
         end;
         _DtmImpostoObj.CdsImposto.First;
         //fim - andre tavares - pendência - 21735 - 15/05/2006

         while not _DtmImpostoObj.CdsImposto.Eof do
         begin
            if GetLancaImposto And
               (bEDocFiscal And (_DtmImpostoObj.CdsImposto.FieldByName('FLGCALCULAIMPOSTO').AsString = 'S')) then
            begin
                 EfetivaLancamento;
                 if not fAlteraRetencao then
                    fAlteraRetencao := (_DtmImpostoObj.CdsImposto.FieldByName('FLGALTERARETENCAO').AsString = 'S');
            end;
            _DtmImpostoObj.CdsImposto.Next;
         end;
      end;

      //Lança os impostos associados a classificação fiscal e tipo de desembolso
       _TipoGetImposto := tgClasFisRecDes;
      if GetImposto then
      begin
         _iNumDependentes  := NumDependentes;

         //início - andre tavares - pendência - 21735 - 15/05/2006
         if pCodTipoCustAgreg > 0 then
         begin
           _DtmImpostoObj.CdsImposto.Filtered := false;
           _DtmImpostoObj.CdsImposto.filter := ' CODTIPOCUSTAGREG = '+ intToStr(pCodTipoCustAgreg);
           _DtmImpostoObj.CdsImposto.Filtered := true;
         end;
         _DtmImpostoObj.CdsImposto.First;
         //fim - andre tavares - pendência - 21735 - 15/05/2006

         while not _DtmImpostoObj.CdsImposto.Eof do
         begin
            if GetLancaImposto And
               (bEDocFiscal And (_DtmImpostoObj.CdsImposto.FieldByName('FLGCALCULAIMPOSTO').AsString = 'S')) then
            begin
              EfetivaLancamento;
              if not fAlteraRetencao then
                 fAlteraRetencao := (_DtmImpostoObj.CdsImposto.FieldByName('FLGALTERARETENCAO').AsString = 'S');
            end;
            _DtmImpostoObj.CdsImposto.Next;
         end;
      end;

      //Lança os impostos associados ao tipo de desembolso/recebimento
      _TipoGetImposto := tgSoRecDes;
      if GetImposto then
      begin
         _iNumDependentes  := NumDependentes;

         //início - andre tavares - pendência - 21735 - 15/05/2006
         if pCodTipoCustAgreg > 0 then
         begin
           _DtmImpostoObj.CdsImposto.Filtered := false;
           _DtmImpostoObj.CdsImposto.filter := ' CODTIPOCUSTAGREG = '+ intToStr(pCodTipoCustAgreg);
           _DtmImpostoObj.CdsImposto.Filtered := true;
         end;
         _DtmImpostoObj.CdsImposto.First;
         //fim - andre tavares - pendência - 21735 - 15/05/2006

         while not _DtmImpostoObj.CdsImposto.Eof do
         begin
            if GetLancaImposto And
               ((bEDocFiscal And (_DtmImpostoObj.CdsImposto.FieldByName('FLGCALCULAIMPOSTO').AsString = 'S')) Or (_DtmImpostoObj.CdsImposto.FieldByName('FLGSEMPRECALCULA').AsString = 'S')) then
            begin
              EfetivaLancamento;
              if not fAlteraRetencao then
                 fAlteraRetencao := (_DtmImpostoObj.CdsImposto.FieldByName('FLGALTERARETENCAO').AsString = 'S');
            end;
            _DtmImpostoObj.CdsImposto.Next;
         end;
      end;
   end;

   FCodTipRecDes := '';
   FCodCentroCusto := '';
   FPrograma := 0;
   fCodPortForma := 0;

   {** Implementar
   FuncaoGeral.FechaQry([_DtmImpostoObj.CdsFaixaImposto,dtmCmBackimposto.QryBaseMes,_DtmImpostoObj.CdsImposto,dtmCmBackimposto.QryAtuImpostoRetido,dtmCmBackimposto.QryImpParcEngob],False,False);
   **}

   fNumLote       := 0.00;
   fNumLoteManual := 0.00;
   fTipoInclusao  := TiLancaImposto;
end;





procedure TCtrlImpostoRetido.EfetivaLancamento;
var
  wAno,wMes,wDia :Word;
  sUltDiaMes: string;
  ssql :String;
  _DevolucaoImposto:Boolean;
  iIdImpostoLancado: Integer;


  //Contabilização do Imposto do Tipo Somente Calcula Valor
  procedure ContabilizaSCV;
  var
     dPlnCodigo: Double;
     l_sHistorico, l_scodcemtcustd, l_splacontad, l_ssubcontad, l_scodcemtcustc, l_splacontac, l_ssubcontac, _sUnidNegDdLancto: String;
     bUsaContaDC: Boolean;
     TipAgregContaC,TipAgregContaD: TRecTipAgregConta;
     // 06/10/04 Alex 14451 Segregação de Recursos
     iIdSegregaCriter: Integer;
     dDataSegregaCriter: TDateTime;

     procedure GetDadosPartidaDobrada;
     begin
        if (_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('LACDEBCRE').AsString = 'D') then
        begin
          l_scodcemtcustd := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODCENTROCUSTO').AsString;
          l_splacontad := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLACONTA').AsString;
          l_ssubcontad := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODSUBCONTA').AsString;
          _sUnidNegDdLancto := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('UNIDNEGOC').AsString;
        end
        else
        begin
          l_scodcemtcustc := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODCENTROCUSTO').AsString;
          l_splacontac := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLACONTA').AsString;
          l_ssubcontac := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODSUBCONTA').AsString;
        end;
     end;
  begin
     //Busca parâmetros para  contabilização do lançamento
     _DtmImpostoObj.SQLContabSCV.Prepare;
     _DtmImpostoObj.SQLContabSCV.ParamByName('CODTIPOCUSTAGREG').AsFloat := _DtmImpostoObj.CdsImposto.FieldByName('CODTIPOCUSTAGREG').AsInteger;
     _DtmImpostoObj.SQLContabSCV.Open;

     if not _DtmImpostoObj.CdsContabSCV.IsEmpty then
     begin
        //Busca Constabilização do Documento de Origem para lançamento de imposto
        _DtmImpostoObj.SQLContabOrigemSCV.Prepare;
        _DtmImpostoObj.SQLContabOrigemSCV.ParamByName('CODDOCUMENTO').AsFloat := FCodDocumento;
        // 16355 Alex 23/03/04 Corrigir arredondamento
        _DtmImpostoObj.SQLContabOrigemSCV.ParamByName('VALOR').AsFloat := RoundCM( _ValorImposto * _Fator, 2 );
        _DtmImpostoObj.SQLContabOrigemSCV.Open;

        if not _DtmImpostoObj.CdsContabOrigemSCV.isEmpty then
        begin
          bUsaContaDC := (_DtmImpostoObj.CdsContabSCV.RecordCount = 2);

          if bUsaContaDC then
          begin
            _DtmImpostoObj.CdsContabSCV.First;
            if _DtmImpostoObj.CdsContabSCV.FieldByName('DEBCRE').AsString = 'C' then
            begin
              TipAgregContaC.CODSUBCONTACONTAB  := _DtmImpostoObj.CdsContabSCV.FieldByName('CODSUBCONTACONTAB').AsFloat;
              TipAgregContaC.UNIDNEGOCCONTAB    := _DtmImpostoObj.CdsContabSCV.FieldByName('UNIDNEGOCCONTAB').AsFloat;
              TipAgregContaC.CODCENTROCUSTO     := _DtmImpostoObj.CdsContabSCV.FieldByName('CODCENTROCUSTO').AsString;
              TipAgregContaC.PLANO              := _DtmImpostoObj.CdsContabSCV.FieldByName('PLANO').AsFloat;
              TipAgregContaC.PLACONTA           := _DtmImpostoObj.CdsContabSCV.FieldByName('PLACONTA').AsString;
            end;

            _DtmImpostoObj.CdsContabSCV.Next;
            TipAgregContaD.CODSUBCONTACONTAB := _DtmImpostoObj.CdsContabSCV.FieldByName('CODSUBCONTACONTAB').AsFloat;
            TipAgregContaD.UNIDNEGOCCONTAB := _DtmImpostoObj.CdsContabSCV.FieldByName('UNIDNEGOCCONTAB').AsFloat;
            TipAgregContaD.CODCENTROCUSTO := _DtmImpostoObj.CdsContabSCV.FieldByName('CODCENTROCUSTO').AsString;
            TipAgregContaD.PLANO := _DtmImpostoObj.CdsContabSCV.FieldByName('PLANO').AsFloat;
            TipAgregContaD.PLACONTA := _DtmImpostoObj.CdsContabSCV.FieldByName('PLACONTA').AsString;


            _DtmImpostoObj.CdsContabSCV.First;
          end;

          dPlnCodigo := 0;

          l_sHistorico := Trim('Lançamento de ' + _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').AsString + ' - '+
                             _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('RAZAOSOCIAL').AsString + ' Ref Doc Nº ' +
                             _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('NODOCUMENTO').AsString + '  ' +
                             _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('COMPLDOCUMENTO').AsString);

          while not _DtmImpostoObj.CdsContabOrigemSCV.Eof do
          begin
            if bUsaContaDC then
            begin
               if (_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('LACDEBCRE').AsString = 'C') then
               begin
                  _DtmImpostoObj.CdsContabOrigemSCV.Edit;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODSUBCONTA').AsFloat := TipAgregContaC.CODSUBCONTACONTAB;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('UNIDNEGOC').AsFloat := TipAgregContaC.UNIDNEGOCCONTAB;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODCENTROCUSTO').AsString := TipAgregContaC.CODCENTROCUSTO;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLANO').AsFloat := TipAgregContaC.PLANO;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLACONTA').AsString := TipAgregContaC.PLACONTA;
                  _DtmImpostoObj.CdsContabOrigemSCV.Post;
               end
               else
               begin
                  _DtmImpostoObj.CdsContabOrigemSCV.Edit;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODSUBCONTA').AsFloat := TipAgregContaD.CODSUBCONTACONTAB;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('UNIDNEGOC').AsFloat := TipAgregContaD.UNIDNEGOCCONTAB;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODCENTROCUSTO').AsString := TipAgregContaD.CODCENTROCUSTO;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLANO').AsFloat := TipAgregContaD.PLANO;
                  _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLACONTA').AsString := TipAgregContaD.PLACONTA;
                  _DtmImpostoObj.CdsContabOrigemSCV.Post;
               end;
            end
            else
              if (((_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('RECPAG').AsString = 'P') And
                   (_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('LACDEBCRE').AsString = 'C')) Or
                  ((_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('RECPAG').AsString = 'R') And
                   (_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('LACDEBCRE').AsString = 'D'))) then
              begin
                 _DtmImpostoObj.CdsContabOrigemSCV.Edit;
                 _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODSUBCONTA').AsFloat := _DtmImpostoObj.CdsContabSCV.FieldByName('CODSUBCONTACONTAB').AsFloat;
                 _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('UNIDNEGOC').AsFloat := _DtmImpostoObj.CdsContabSCV.FieldByName('UNIDNEGOCCONTAB').AsFloat;
                 _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODCENTROCUSTO').AsString := _DtmImpostoObj.CdsContabSCV.FieldByName('CODCENTROCUSTO').AsString;
                 _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLANO').AsFloat := _DtmImpostoObj.CdsContabSCV.FieldByName('PLANO').AsFloat;
                 _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLACONTA').AsString := _DtmImpostoObj.CdsContabSCV.FieldByName('PLACONTA').AsString;
                 _DtmImpostoObj.CdsContabOrigemSCV.Post;
              end;

            // Alex 06/10/2004 14451 Segregação de recursos
            if _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDSEGREGACRITER').IsNull then begin
              iIdSegregaCriter := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDSEGREGACRITER').AsInteger;
              dDataSegregaCriter := _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('DATASEGREGACRITER').AsDateTime;
            end else begin
              iIdSegregaCriter := -1;
              dDataSegregaCriter := -1;
            end;

            if FPartidaDobrada then
            begin
               GetDadosPartidaDobrada;
               _DtmImpostoObj.CdsContabOrigemSCV.Next;
               GetDadosPartidaDobrada;

               if not _LancaContab.InsereLancaContab('2',
                                                     FIdEmpresa,
                                                     FIdModulo,
                                                     FIdUsuario,
                                                     FIdPlanoConta,
                                                     StrToIntDef(_sUnidNegDdLancto, -1),
                                                     StrToIntDef(l_ssubcontad,0),
                                                     StrToIntDef(l_ssubcontac,0),
                                                     _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDPLANOPREV').AsFloat,
                                                     _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDPATRO').AsFloat,
                                                     dPlnCodigo,
                                                     0,
                                                     DateTOStr(_DataLancto),
                                                     _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('NODOCUMENTO').AsString,
                                                     l_sHistorico,
                                                     '',
                                                     '',
                                                     '',
                                                     '',
                                                     '03',
                                                     l_scodcemtcustd,
                                                     l_splacontad,
                                                     l_scodcemtcustc,
                                                     l_splacontac, '',
                                                     _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('VALORRATEIOIMPOSTO').AsFloat,
                                                     True,
                                                     FUsaPlanoPatro,
                                                     // 06/10/04 Alex 14451 Segregação de Recursos
                                                     iIdSegregaCriter, dDataSegregaCriter) then
                      Raise Exception.Create(_LancaContab.MessageInfo);

               dPlnCodigo := Trunc(_LancaContab.RetornoPlnCodigo);
            end
            else
            begin
               if ((_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('LACDEBCRE').AsString = 'D') And bUsaContaDC) Or
                  ((_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('LACDEBCRE').AsString = 'C') And (not bUsaContaDC)) then
               begin
                  if not _LancaContab.InsereLancaContab('0',
                                                        FIdEmpresa,
                                                        FIdModulo,
                                                        FIdUsuario,
                                                        FIdPlanoConta,
                                                        StrToIntDef(_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('UNIDNEGOC').AsString, -1),
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODSUBCONTA').AsFloat,
                                                        0,
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDPLANOPREV').AsFloat,
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDPATRO').AsFloat,
                                                        dPlnCodigo,
                                                        0,
                                                        DateToStr(_DataLancto),
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('NODOCUMENTO').AsString,
                                                        l_sHistorico,
                                                        '',
                                                        '',
                                                        '',
                                                        '',
                                                        '03',
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODCENTROCUSTO').AsString,
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLACONTA').AsString,
                                                        '',
                                                        '',
                                                        '',
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('VALORRATEIOIMPOSTO').AsFloat,
                                                        True,
                                                        FUsaPlanoPatro,
                                                        // 06/10/04 Alex 14451 Segregação de Recursos
                                                        iIdSegregaCriter, dDataSegregaCriter) then
                         Raise Exception.Create(_LancaContab.MessageInfo);

                  dPlnCodigo := Trunc(_LancaContab.RetornoPlnCodigo);
               end
               else
               begin
                  if not _LancaContab.InsereLancaContab('1',
                                                        FIdEmpresa,
                                                        FIdModulo,
                                                        FIdUsuario,
                                                        FIdPlanoConta,
                                                        StrToIntDef(_DtmImpostoObj.CdsContabOrigemSCV.FieldByName('UNIDNEGOC').AsString, -1),
                                                        0,
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODSUBCONTA').AsFloat,
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDPLANOPREV').AsFloat,
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('IDPATRO').AsFloat,
                                                        dPlnCodigo, 0,
                                                        DateTOStr(_DataLancto),
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('NODOCUMENTO').AsString,
                                                        l_sHistorico,
                                                        '',
                                                        '',
                                                        '',
                                                        '',
                                                        '03',
                                                        '',
                                                        '',
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('CODCENTROCUSTO').AsString,
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('PLACONTA').AsString,
                                                        '',
                                                        _DtmImpostoObj.CdsContabOrigemSCV.FieldByName('VALORRATEIOIMPOSTO').AsFloat,
                                                        True,
                                                        FUsaPlanoPatro,
                                                        // 06/10/04 Alex 14451 Segregação de Recursos
                                                        iIdSegregaCriter, dDataSegregaCriter) then
                         Raise Exception.Create(_LancaContab.MessageInfo);
                  dPlnCodigo := Trunc(_LancaContab.RetornoPlnCodigo);
               end;
            end;

            _DtmImpostoObj.CdsContabOrigemSCV.Next;
          end; {while not _DtmImpostoObj.CdsContabOrigemSCV.Eof do}


          if not ExecSQL('UPDATE IMPOSTORETIDO SET PLNCODIGO = ' + FloatToStr(dPlnCodigo) + '  WHERE IDIMPOSTORETIDO = ' + IntToStr(iIdImpostoLancado)) then
             Raise  Exception.Create('Não foi possível atualizar Planilha lançada para imposto do tipo Somente Calcula Valor.' + (#13+#10) + MessageInfo);
        end;

        _DtmImpostoObj.CdsContabOrigemSCV.Open;
     end;

     _DtmImpostoObj.CdsContabSCV.Close;
  end;

  //início - andre tavares - pendência 21817 - 13/04/2006
  function GetValorRetido(const codTipoCustAgreg, idForCli, idpessoa, coddocumento: double; const mesAno: String ): Double;
  var cdsAux: TclientDataSet;
  begin
    result := 0;
    cdsAux := TclientDataset.Create(nil);
    try
      cdsAux.Data := GetDataPacket(' SELECT I.VLRRETIDO FROM IMPOSTORETIDO I '+
                                   ' WHERE I.CODDOCUMENTO <> '+ floatToStr(coddocumento) +' AND '+
                                   '       I.IDFORCLI = '+ floatToStr(idForcli) +' AND '+
                                   '       I.IDPESSOA = '+ floatToStr(idpessoa) +' AND '+
                                   '       I.CODTIPOCUSTAGREG = '+ floattoStr(codTipoCustAgreg) +' AND '+
                                   '       TO_CHAR(I.DATARETENCAO,''MM/YYYY'') = '+ quotedStr(MesAno) );

    result := RoundCm(cdsAux.FieldByName('VLRRETIDO').asFloat, 2);
    finally
      cdsAux.Free;
    end;//try
  end;
  //fim - andre tavares - pendência 21817 - 13/04/2006

  //início - andre tavares - Pendência 21377 - 02/03/2006
  //inclui na tabela DocXImpostoAcum os documentos que deram origem aos impostos acumulados
  function InsereDocXImpostoAcum : Boolean;

  begin
    result := true;
    decodeDate(StrToDate('01/'+sDataMesAno), wAno, wMes, wDia );
    sUltDiaMes := formatDateTime('DD/MM/YYYY', _DiasUteis.UltDiaMes(wAno, wMes) );

    with TClientDataset.Create(nil) do
    begin
      try
        try
          data := GetDataPacket(' SELECT * FROM ( '+#13+
                                ' SELECT DISTINCT D1.CODDOCUMENTO    /* RETORNA TODOS OS DOCUMENTOS QUE RECOLHEM O IMPOSTO PELO TIPO DE DESEMBOLSO*/ '+#13+
                                ' FROM DOCUMENTO D1, TIPRECDESXTIPAGRE T, TIPOAGRE C, RATEIODOCUM RDC '+#13+
                                ' WHERE '+
//                                ' (TO_CHAR(D1.DATAPROGRAMADA,''MM/YYYY'') = '+ quotedStr(sDataMesAno) + ' ) AND '+#13+
                                ' (TRUNC(D1.DATAPROGRAMADA) >= TO_DATE('+ quotedStr('01/'+sDataMesAno) + ', ''DD/MM/YYYY'' ) AND '+#13+
                                '  TRUNC(D1.DATAPROGRAMADA) <= TO_DATE('+ quotedStr(sUltDiaMes) + ' , ''DD/MM/YYYY'') ) AND '+#13+
                                ' (D1.IDFORCLI = '+ intToStr(FIdForCli) +' ) AND '+#13+
                                ' (D1.IDPESSOA = '+ intToStr(fIdEmpresa)+ ' ) AND '+#13+
                                ' (D1.RECPAG = '+ quotedStr(fRecPag)+ ') AND '+#13+

                                ' (RDC.CODDOCUMENTO = D1.CODDOCUMENTO) AND '+#13+
                                ' (RDC.RECPAG = D1.RECPAG) AND '+#13+
                                ' (RDC.CODTIPRECDES = T.CODTIPRECDES) AND '+#13+
                                ' (RDC.IDPROGRAMA = T.IDPROGRAMA) AND '+#13+
                                ' (RDC.CODCENTROCUSTO = T.CODCENTROCUSTO) AND '+#13+

                                ' (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) AND (C.FLGACUMULA = ''M'') AND '+#13+
                                ' (C.CODTIPOCUSTAGREG = '+ intToStr(_CodTipoCustoAgreg) +') '+#13+
                                ' UNION '+#13+
                                ' SELECT D.CODDOCUMENTO /* RETORNA TODOS OS DOCUMENTOS QUE RECOLHEM O IMPOSTO ASSOCIADO AO FORNECEDOR*/ '+#13+
                                ' FROM DOCUMENTO D, FORCLIXAGREG F, TIPOAGRE TA '+#13+
                                ' WHERE (D.IDFORCLI = F.IDFORCLI) AND '+#13+
                                ' (TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) AND (TA.FLGACUMULA = ''M'') AND '+#13+
                                ' (F.CODTIPOCUSTAGREG = ' + intToStr(_CodTipoCustoAgreg) + ') AND '+#13+
                                ' (D.IDFORCLI = '+ intToStr(FIdForCli) + ') AND '+#13+
                                ' (D.IDPESSOA = ' + intToStr(fIdEmpresa) + ' ) AND '+#13+
                                ' (D.RECPAG = ' + quotedStr(fRecPag) + ' ) AND '+#13+
//                                ' (TO_CHAR(D.DATAPROGRAMADA,''MM/YYYY'') = '+ quotedStr(sDataMesAno) + ') '+#13+
                                ' (TRUNC(D.DATAPROGRAMADA) >= TO_DATE('+ quotedStr('01/'+sDataMesAno) + ' , ''DD/MM/YYYY'' ) AND '+#13+
                                '  TRUNC(D.DATAPROGRAMADA) <= TO_DATE('+ quotedStr(sUltDiaMes) + ' , ''DD/MM/YYYY'') ) '+#13+
                                ' )     /*SOMENTE OS DOCUMENTOS CUJOS IMPOSTOS NÃO FORAM RECOLHIDOS*/ '+#13+
                                ' WHERE CODDOCUMENTO NOT IN ( SELECT D.CODDOCUMENTO '+#13+
                                '                             FROM DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR TA, TIPOAGRE TAG '+#13+
                                '                             WHERE '+
//                                '                                   (TO_CHAR(D.DATAPROGRAMADA,''MM/YYYY'') = '+ quotedStr(sDataMesAno) + ' ) AND '+#13+
                                '                                   (TRUNC(D.DATAPROGRAMADA) >= TO_DATE('+ quotedStr('01/'+sDataMesAno) + ' , ''DD/MM/YYYY'' ) AND '+#13+
                                '                                    TRUNC(D.DATAPROGRAMADA) <= TO_DATE('+ quotedStr(sUltDiaMes) + ' , ''DD/MM/YYYY'') ) AND '+#13+
                                '                                   (D.IDFORCLI = ' + intToStr(FIdForCli) + ' ) AND '+#13+
                                '                                   (D.IDPESSOA = ' + intToStr(fIdEmpresa) + ' ) AND '+#13+
                                '                                   (D.RECPAG = ' + quotedStr(fRecPag) + ' ) AND '+#13+
                                '                                   (L.CODDOCUMENTO = D.CODDOCUMENTO) AND '+#13+
                                '                                   (L.CODALTERADOR = TA.CODALTERADOR) AND '+#13+
                                '                                   (TAG.CODALTERADOR = L.CODALTERADOR) AND (TAG.FLGACUMULA = ''M'') AND '+#13+
                                '                                   (TAG.CODTIPOCUSTAGREG = ' + intToStr(_CodTipoCustoAgreg) + ') AND (D.CODDOCUMENTO <> '+ intToStr(FCodDocumento) +')  '+#13+
                                '                          UNION '+#13+
                                '                             SELECT  DXI.CODDOCUMENTO '+#13+
                                '                             FROM DOCXIMPOSTOACUM DXI, '+#13+
                                '                                  TIPOAGRE C, RATEIODOCUM RDC, TIPRECDESXTIPAGRE T  '+#13+
                                '                             WHERE '+
                                '                                  (TRUNC(DXI.DATARETENCAO) >= TO_DATE('+ quotedStr('01/'+sDataMesAno) + ' , ''DD/MM/YYYY'' ) AND '+#13+
                                '                                   TRUNC(DXI.DATARETENCAO) <= TO_DATE('+ quotedStr(sUltDiaMes) + '  , ''DD/MM/YYYY'') ) AND '+#13+
//                                '                                   (TO_CHAR(DXI.DATARETENCAO,''MM/YYYY'') = '+ quotedStr(sDataMesAno) +') AND '+#13+
                                '                                   (DXI.CODTIPOCUSTAGREG =  '+ intToStr(_CodTipoCustoAgreg) + ') AND '+#13+
                                '                                   (DXI.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND  '+#13+
                                '                                   (DXI.CODDOCUMENTO = RDC.CODDOCUMENTO) AND '+#13+
                                '                                   (T.CODTIPRECDES = RDC.CODTIPRECDES) AND '+#13+
                                '                                   (T.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND '+#13+
                                '                                   (T.IDPROGRAMA = RDC.IDPROGRAMA) AND '+#13+
                                '                                   (T.CODCENTROCUSTO = RDC.CODCENTROCUSTO) '+#13+
                                ' ) ');
        except
          result := false;
        end;

        if result then
        begin
          first;
          while not eof do begin
            result := ExecSql('INSERT INTO DOCXIMPOSTOACUM (IDIMPOSTORETIDO, CODDOCUMENTO, CODTIPOCUSTAGREG, DATARETENCAO) VALUES ('+
                             floatToStr(iIdImpostoLancado)+', '+fieldByName('CODDOCUMENTO').asString+', '+intToStr(_CodTipoCustoAgreg)+', '+ quotedStr(formatdateTime('DD/MM/YYYY', _DataRetencao)) +' )');
            next;
         end;//while
       end;//if

      finally
        free;
      end;//try
    end; //with
  end;
  //fim - andre tavares - Pendência 21377 - 02/03/2006


begin
   _CodTipoCustoAgreg := _DtmImpostoObj.CdsImposto.FieldByName('CODTIPOCUSTAGREG').AsInteger;
   _AcumulaMes        := (_DtmImpostoObj.CdsImposto.FieldByName('FLGACUMULA').AsString = 'M');
   _DiminuiFaixa      := (_DtmImpostoObj.CdsImposto.FieldByName('FLGTIPOCALC').AsString = '1');
   _ValorBase         := 0;
   //andre tavares - pendência 21377 - esta variável não é mais necessária
   //_ValorRetido       := 0;
   iIdImpostoLancado  := 0;
   sSql := ''; //andre tavares 11/11/2005 - pendência 20539

   if _AcumulaMes then
   begin

     // andre tavares 10/11/2005 - pendência 20539
     //só para documentar: busca o imposto já lançado de outros documentos do mesmo cliente no mês para então deduzir neste lançamento

{     sSql := ' SELECT 0 AS VALORBASE, SUM(VALORRETIDO) AS VALORRETIDO FROM ( '+#13+
               ' /*SOMATORIO DOS VALORES DOS RETIDOS IMPOSTO*/ '+#13+
               ' SELECT SUM(VLRBASE) AS VALORBASE, SUM(VLRRETIDO) AS VALORRETIDO '+#13+
               ' FROM IMPOSTORETIDO '+#13+
               ' WHERE (CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND '+#13+
               ' (IDFORCLI = :PIDFORCLI) AND '+#13+
               ' (IDPESSOA = :PIDPESSOA) AND '+#13+
               ' (RECPAG   = :PRECPAG) AND '+#13+
               ' (TO_CHAR(DATARETENCAO,''MM/YYYY'') = :PDATARETENCAO) '+#13+
               ' UNION '+#13+
               ' /* A SOMA DOS VALORES DOS DOCUMENTOS QUE NÃO PAGARAM O IMPOSTO */ '+#13+
               ' SELECT SUM(DECODE(L.DEBCRE,''D'',DECODE(D.RECPAG,''R'',L.VALOR, L.VALOR * -1), DECODE(D.RECPAG, ''R'', L.VALOR * -1, L.VALOR))) AS VALORBASE, '+#13+
               ' 0 AS VALORRETIDO '+#13+
               ' FROM DOCUMENTO D, LANCTODOCUM L, TIPODOCRECPAG T '+#13+
               ' WHERE  (TO_CHAR(D.DATAPROGRAMADA,''MM/YYYY'') = :PDATARETENCAO) AND '+#13+
               ' (D.IDFORCLI = :PIDFORCLI) AND (D.IDPESSOA = :PIDPESSOA) AND (D.RECPAG = :PRECPAG) AND '+#13+
               ' (L.CODDOCUMENTO = D.CODDOCUMENTO) AND (L.OPERACAO = D.OPERACAO) AND '+#13+
               ' (D.CODTIPDOC = T.CODTIPDOC) AND '+#13+
               ' (T.FLGDOCFISCAL = ''S'') AND '+#13+
               ' (D.CODDOCUMENTO <> :PCODDOCUMENTO) AND '+#13+
               ' (D.CODDOCUMENTO NOT IN (SELECT CODDOCUMENTO FROM IMPOSTORETIDO '+#13+
               '                         WHERE (CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND '+#13+
               '                         (IDFORCLI = :PIDFORCLI) AND '+#13+
               '                         (IDPESSOA = :PIDPESSOA) AND '+#13+
               '                         (RECPAG   = :PRECPAG) AND '+#13+
               '                         (TO_CHAR(DATARETENCAO, ''MM/YYYY'') = :PDATARETENCAO) '+#13+
               '                  ) '+#13+
               ' ) '+#13+
             ' ) ';
}
     // inicio andre tavares - pendencia 21377 - 13/02/2006
     sSql :=  ' SELECT SUM(VALOR) AS VALORBASE FROM ('+#13+
              '    SELECT SUM(RDC.VALOR) AS VALOR /*RETORNA TODOS OS DOCUMENTOS QUE RECOLHEM O IMPOSTO PELO TIPO DE DESEMBOLSO*/'+#13+
              '    FROM DOCUMENTO D1, TIPOAGRE C, RATEIODOCUM RDC, TIPRECDESXTIPAGRE T'+#13+
              '    WHERE (TO_CHAR(D1.DATAPROGRAMADA,''MM/YYYY'') = :PDATARETENCAO) AND'+#13+
              '          (D1.IDFORCLI = :PIDFORCLI ) AND'+#13+
              '          (D1.IDPESSOA = :PIDPESSOA) AND'+#13+
              '          (D1.RECPAG = :PRECPAG) AND'+#13+
              '          (RDC.CODDOCUMENTO = D1.CODDOCUMENTO) AND'+#13+
              '          (RDC.RECPAG = D1.RECPAG) AND'+#13+
              '          (RDC.IDPROGRAMA = T.IDPROGRAMA) AND'+#13+
              '          (RDC.CODCENTROCUSTO = T.CODCENTROCUSTO) AND'+#13+
              '          (RDC.CODTIPRECDES = T.CODTIPRECDES) AND'+#13+
              '          (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) AND'+#13+
              '          (C.FLGACUMULA = ''M'') AND'+#13+
              '          (C.CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND'+#13+
              '          (D1.CODDOCUMENTO <> :PCODDOCUMENTO) AND'+#13+
              '          (D1.CODDOCUMENTO NOT IN ('+#13+
              '                                   SELECT D.CODDOCUMENTO '+#13+
              '                                   FROM DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR TA, TIPOAGRE TAG '+#13+
              '                                   WHERE (TO_CHAR(D.DATAPROGRAMADA,''MM/YYYY'') = :PDATARETENCAO) AND '+#13+
              '                                         (D.IDFORCLI = :PIDFORCLI ) AND '+#13+
              '                                         (D.IDPESSOA = :PIDPESSOA ) AND '+#13+
              '                                         (D.RECPAG = :PRECPAG ) AND '+#13+
              '                                         (L.CODDOCUMENTO = D.CODDOCUMENTO) AND '+#13+
              '                                         (L.CODALTERADOR = TA.CODALTERADOR) AND '+#13+
              '                                         (TAG.CODALTERADOR = L.CODALTERADOR) AND (TAG.FLGACUMULA = ''M'') AND '+#13+
              '                                         (TAG.CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND (D.CODDOCUMENTO <> :PCODDOCUMENTO ) '+#13+
              '                                   UNION  '+#13+
              '                                   SELECT  DXI.CODDOCUMENTO '+#13+
              '                                   FROM DOCXIMPOSTOACUM DXI, TIPOAGRE C, RATEIODOCUM RDC, TIPRECDESXTIPAGRE T '+#13+
              '                                   WHERE (TO_CHAR(DXI.DATARETENCAO,''MM/YYYY'') = :PDATARETENCAO) AND '+#13+
              '                                         (DXI.CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND '+#13+
              '                                         (DXI.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND '+#13+
              '                                         (DXI.CODDOCUMENTO = RDC.CODDOCUMENTO) AND '+#13+
              '                                         (T.CODTIPRECDES = RDC.CODTIPRECDES) AND '+#13+
              '                                         (T.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND '+#13+
              '                                         (T.IDPROGRAMA = RDC.IDPROGRAMA) AND '+#13+
              '                                         (T.CODCENTROCUSTO = RDC.CODCENTROCUSTO) '+#13+
              '                                  ))'+#13+
              '          UNION'+#13+
              '          SELECT /*RETORNA TODOS OS DOCUMENTOS QUE RECOLHEM O IMPOSTO ASSOCIADO AO FORNECEDOR*/'+#13+
              '                 SUM(DECODE(LD.DEBCRE,''D'',DECODE(D.RECPAG,''R'',LD.VALOR, LD.VALOR * -1), DECODE(D.RECPAG, ''R'', LD.VALOR * -1, LD.VALOR))) AS VALOR'+#13+
              '          FROM DOCUMENTO D, FORCLIXAGREG F, TIPOAGRE TA, LANCTODOCUM LD'+#13+
              '          WHERE (TO_CHAR(D.DATAPROGRAMADA,''MM/YYYY'') = :PDATARETENCAO) AND'+#13+
              '                (D.IDFORCLI = F.IDFORCLI) AND'+#13+
              '                (TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) AND (TA.FLGACUMULA = ''M'') AND'+#13+
              '                (F.CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND'+#13+
              '                (D.IDFORCLI = :PIDFORCLI) AND'+#13+
              '                (D.IDPESSOA = :PIDPESSOA) AND'+#13+
              '                (D.RECPAG = :PRECPAG) AND'+#13+
              '                (LD.CODDOCUMENTO = D.CODDOCUMENTO) AND'+#13+
              '                (LD.OPERACAO = D.OPERACAO) AND'+#13+
              '                (D.CODDOCUMENTO <> :PCODDOCUMENTO) AND'+#13+
              '                (D.CODDOCUMENTO NOT IN ('+#13+
              '                                   SELECT D.CODDOCUMENTO '+#13+
              '                                   FROM DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR TA, TIPOAGRE TAG '+#13+
              '                                   WHERE (TO_CHAR(D.DATAPROGRAMADA,''MM/YYYY'') = :PDATARETENCAO) AND '+#13+
              '                                         (D.IDFORCLI = :PIDFORCLI ) AND '+#13+
              '                                         (D.IDPESSOA = :PIDPESSOA ) AND '+#13+
              '                                         (D.RECPAG = :PRECPAG ) AND '+#13+
              '                                         (L.CODDOCUMENTO = D.CODDOCUMENTO) AND '+#13+
              '                                         (L.CODALTERADOR = TA.CODALTERADOR) AND '+#13+
              '                                         (TAG.CODALTERADOR = L.CODALTERADOR) AND (TAG.FLGACUMULA = ''M'') AND '+#13+
              '                                         (TAG.CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND (D.CODDOCUMENTO <> :PCODDOCUMENTO ) '+#13+
              '                                   UNION  '+#13+
              '                                   SELECT  DXI.CODDOCUMENTO '+#13+
              '                                   FROM DOCXIMPOSTOACUM DXI, TIPOAGRE C, RATEIODOCUM RDC, TIPRECDESXTIPAGRE T '+#13+
              '                                   WHERE (TO_CHAR(DXI.DATARETENCAO,''MM/YYYY'') = :PDATARETENCAO) AND '+#13+
              '                                         (DXI.CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND '+#13+
              '                                         (DXI.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND '+#13+
              '                                         (DXI.CODDOCUMENTO = RDC.CODDOCUMENTO) AND '+#13+
              '                                         (T.CODTIPRECDES = RDC.CODTIPRECDES) AND '+#13+
              '                                         (T.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND '+#13+
              '                                         (T.IDPROGRAMA = RDC.IDPROGRAMA) AND '+#13+
              '                                         (T.CODCENTROCUSTO = RDC.CODCENTROCUSTO) '+#13+
              '                                         ))'+#13+
              '          )';



     _DtmImpostoObj.SQLBaseMes.Sql.Clear;
     _DtmImpostoObj.SQLBaseMes.Sql.Text := sSql;
     // fim andre tavares - pendencia 21377 - 13/02/2006

     _DtmImpostoObj.SQLBaseMes.Prepare;
     _DtmImpostoObj.SQLBaseMes.ParamByName('PCODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
     _DtmImpostoObj.SQLBaseMes.ParamByName('PIDFORCLI').AsFloat         := FIdForCli;
     _DtmImpostoObj.SQLBaseMes.ParamByName('PIDPESSOA').AsFloat         := fIdEmpresa;
     _DtmImpostoObj.SQLBaseMes.ParamByName('PRECPAG').AsString          := fRecPag;
     _DtmImpostoObj.SQLBaseMes.ParamByName('PCODDOCUMENTO').asInteger   := FCodDocumento; //andre tavares 11/11/2005 - pendência 20539

     DecodeDate(_DataRetencao,wAno,wMes,wDia);
     if wMes < 10 then
        sDataMesAno := '0' + IntToStr(wMes) + '/' + IntToStr(wAno)
     else
        sDataMesAno := IntToStr(wMes) + '/' + IntToStr(wAno);
     _DtmImpostoObj.SQLBaseMes.ParamByName('PDATARETENCAO').AsString    := sDataMesAno;
     _DtmImpostoObj.SQLBaseMes.Open;
     _DtmImpostoObj.CdsBaseMes.First;
     if not _DtmImpostoObj.CdsBaseMes.IsEmpty then
     begin
       _ValorBase         := _DtmImpostoObj.CdsBaseMes.FieldByName('VALORBASE').AsFloat;
       //andre tavares - pendência 21377 - esta variável não é mais necessária
       //_ValorRetido       := _DtmImpostoObj.CdsBaseMes.FieldByName('VALORRETIDO').AsFloat;
     end;
   end;

   if TipoInclusao = TiSoCalculaValor then
   begin
      _ValorBase := _ValorBase + fValorBaseCalculaValor;
       //andre tavares - pendência 21377 - esta variável não é mais necessária
      //_ValorRetido := _ValorRetido + fValorRetidoCalculaValor;
   end;

   _ValorBase := _ValorBase + _ValorLancto;

   if _DtmImpostoObj.CdsImposto.FieldByName('FLGUSAVALFORCLI').AsString = 'S' then
      _ValorBase := _ValorBase -
                    _DtmImpostoObj.CdsImposto.FieldByName('VLRABATFIXO').AsFloat -
                    (_DtmImpostoObj.CdsImposto.FieldByName('VALPORDEPENDENTE').AsFloat * _iNumDependentes) -
                    _VlrInss -
                    _VlrPensao
   else
      _ValorBase := _ValorBase -
                    _DtmImpostoObj.CdsImposto.FieldByName('VLRABATFIXO').AsFloat -
                    (_DtmImpostoObj.CdsImposto.FieldByName('VALPORDEPENDENTE').AsFloat * _iNumDependentes);


   //Se existe faixa para o imposto, o inclui.
   if GetFaixaImposto then
   begin

     { DAVID - 27/01/2003 - Pendência 15975
       Se o tipo de imposto agregado é um imposto configurado como imposto de
       renda, abate o somatório dos impostos em que o IR incide do valor total
       do documento.}
     if ImpostoIRRF( _CodTipoCustoAgreg ) then
       _ValorBase := _ValorBase - _TotalImpostosIncIRRF;

     _ValorBase := _ValorBase - _DtmImpostoObj.CdsFaixaImposto.FieldByName('VLRABATVALOR').AsFloat;

     if _DiminuiFaixa then
        _ValorBase := _ValorBase - _DtmImpostoObj.CdsFaixaImposto.FieldByName('VLRINICIALFAIXA').AsFloat;

     _PercCustAgreg := _DtmImpostoObj.CdsFaixaImposto.FieldByName('PERCCUSTAGREG').AsFloat;

     _ValorImposto := _ValorBase * (_DtmImpostoObj.CdsFaixaImposto.FieldByName('PERCCUSTAGREG').AsFloat/100);

     _ValorImposto := _ValorImposto * (_DtmImpostoObj.CdsFaixaImposto.FieldByName('PERCBASE').AsFloat/100);

     _ValorImposto := _ValorImposto - _DtmImpostoObj.CdsFaixaImposto.FieldByName('VLRABATCALC').AsFloat +
                                      _DtmImpostoObj.CdsFaixaImposto.FieldByName('VLRFIXO').AsFloat;

     //início - andre tavares - pendência 21817 - 13/04/2006
     //se o imposto fot valorfixo (teto) então buscar o valor retido no mês para abatê-lo no valor a pagar
     if not IsFloatZero(_DtmImpostoObj.CdsFaixaImposto.FieldByName('VLRFIXO').AsFloat) then
       _ValorImposto := _ValorImposto - GetValorRetido(_CodTipoCustoAgreg, FIdForCli, fIdEmpresa, fCodDocumento, sDataMesAno);
     //fim - andre tavares - pendência 21817 - 13/04/2006

     //andre tavares - pendência 21377 - esta variável não é mais necessária
     // 16355 Alex 23/03/04 corrigir arredondamento
     //_ValorImposto := RoundCM( _ValorImposto - _ValorRetido, 2 );
     _ValorImposto := RoundCM( _ValorImposto, 2 );


     //DAVID - Retenção de Imposto
     { Aqui é o ponto onde o imposto é limitado ao teto estipulado para retenção
       de INSS (se for este o imposto e se houver tratamento atribuído ao
       evento OnRetencaoINSS) }
     if Assigned( OnRetencaoINSS ) then
       RetemINSS( _CodTipoCustoAgreg, IdForCli, _DataRetencao, _ValorImposto );

     //Pendência 17292 - Solução do problema de alteradores zerados
     if _ValorImposto <= 0 then
       exit;

     { DAVID - 27/01/2003 - Pendência 15975
       Se o IR incide sobre o imposto atual (condição definida pelo campo
      "ORDEM"), soma-o ao total para abatê-lo posteriormente. }
     if _DtmImpostoObj.CdsImposto.FieldByName('ORDEM').AsInteger = 0 then
       _TotalImpostosIncIRRF := _TotalImpostosIncIRRF + _ValorImposto;

      _NumLancto    := 0;

      if ((fDebCre = 'D') And (fRecPag = 'P')) Or
         ((fDebCre = 'C') And (fRecPag = 'R')) then
      begin
         _Fator := -1;

         if _DtmImpostoObj.CdsImposto.FieldByName('ACRESDECRES').AsString = '' then
         begin
            if fDebCre = 'D' then
               _DebCre := 'C'
            else
               _DebCre := 'D';
         end
         else
            if _DtmImpostoObj.CdsImposto.FieldByName('ACRESDECRES').AsString = 'D' then
               _DebCre := 'C'
            else
               _DebCre := 'D';

         _DevolucaoImposto := (_ValorImposto > 0);
      end
      else
      begin
         if _DtmImpostoObj.CdsImposto.FieldByName('ACRESDECRES').AsString = '' then
            _DebCre := fDebCre
         else
            _DebCre := _DtmImpostoObj.CdsImposto.FieldByName('ACRESDECRES').AsString;
         _Fator := 1;
         _DevolucaoImposto := False;
      end;

      if _DatadoLancto = 'E' then
         _DataLancto := FDataLancto
      else
         _DataLancto := _DataRetencao;

      //20/10/2000 FIM - INCLUSAO do _DevolucaoImposto E EXCLUSAO do VALORIMPOSTO * _FATOR

      //Lança os alteradores se existir um documento de origem (FCodTipRecDes = '')
      if (_DevolucaoImposto) Or
         ( (_ValorImposto {* _Fator}) >= _DtmImpostoObj.CdsImposto.FieldByName('VLRMINIMO').AsFloat) then
      begin
        if (FCodTipRecDes = '') then
        begin
           if (not _DtmImpostoObj.CdsImposto.FieldByName('CODALTERADOR').IsNull) then
           begin

              if ((_DebCre = 'D') And (fRecPag = 'P')) Or
                 ((_DebCre = 'C') And (fRecPag = 'R')) then
                 FValorAlteradores   := FValorAlteradores - (_ValorImposto * _Fator )
              else
                 FValorAlteradores   := FValorAlteradores + (_ValorImposto * _Fator );

              if (fTipoInclusao = TiLancaImposto) then
              begin
                 if (Trim(_DebCre) <> 'C') And (Trim(_DebCre) <> 'D') then
                    Raise Exception.Create('DebCre inválido para no lançamento dr Imposto para o CodDocumento: ' + IntToStr(FCodDocumento));

                 _Documento.Prepare(OpLanctoDocum, odlAlterador);
                 _Documento.PartidaDobrada := fPartidaDobrada;
                 _Documento.UsaPlanoPatro := fUsaPlanoPatro;
                 _Documento.IdUsuario := fIdUsuario;
                  //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
                 _Documento.IdEspAcesso := fIdEspAcesso;
                 _Documento.IdModulo := fIdModulo;

                 _Documento.Lanctodocum.SetValues(_DataLancto, FCodDocumento, 0, _ValorImposto,
                 0, _ValorImposto, 0, 0, 0, FIdUsuario, FIdEmpresa, 0, 0, 0, 0,
                 _DtmImpostoObj.CdsImposto.FieldByName('CODALTERADOR').AsInteger,
                 '4', '', '', '', _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').AsString,
                 '', '', '', _DebCre, fIdModulo, FIdPlanoConta,
                 FUsaPlanoPatro, FIntegraContab);

                 if not _Documento.Insert then  Raise Exception.Create(_Documento.MessageInfo);

                 _NumLancto := _Documento.Lanctodocum.NumLancto;

              end;
           end;
        end;
      end
      else
        _ValorImposto := 0;

      //Lança Imposto Como Novo Documentos
      if (_DtmImpostoObj.CdsImposto.FieldByName('CODTRATFISCD').AsString = 'B') And
         (( (_ValorImposto {* _Fator}) > 0) or _DevolucaoImposto) And (Trim(FCodTipRecDes) = '') then
      begin

         //Busca Dados para lançamento de documento
         _DtmImpostoObj.SQLDadosLancImp.Prepare;
         _DtmImpostoObj.SQLDadosLancImp.ParamByname('CODTIPOCUSTAGREG').AsFloat := _DtmImpostoObj.CdsImposto.FieldByName('CODTIPOCUSTAGREG').AsFloat;
         _DtmImpostoObj.SQLDadosLancImp.ParamByname('IDPESSOA').AsFloat := fIdEmpresa;
         _DtmImpostoObj.SQLDadosLancImp.Open;

         _DtmImpostoObj.CdsDadosLancImp.First;
         Try
           if (fTipoInclusao = TiLancaImposto) then
              //Caso a retenção seja proveniente de um lote acumla o valor para do lançamento do documento para ser lançado em EfetivaNovoDocumento
              //if (fNumLote = 0.00) then
              if trunc(fNumLote) = 0 then //andre tavares 06/03/2006 ***
                LancaDocumento;
              //else
              //   AcumulaLancaDocumento;
         finally
           _DtmImpostoObj.CdsDadosLancImp.Close;
         end;
      end;

      //Lança os Imposto sse existir um documento de origem (FCodTipRecDes = '')
      if ((_AcumulaMes) Or (( (_ValorImposto {* _Fator}) > 0) or _DevolucaoImposto)) And
         (FCodTipRecDes = '') And (fTipoInclusao = TiLancaImposto) then
      begin
         //Lança Impostos para tratamentos fiscais diferentes de 'B' - "Lança Imposto Como Novo Documento" ou
         //quando é caracterizado retenção na baixa de lote.
         if (fNumLote = 0.00) Or
            (_DtmImpostoObj.CdsImposto.FieldByName('CODTRATFISCD').AsString <> 'B') then
         begin
            iIdImpostoLancado := GetSequence('IMPOSTORETIDO');
            _DtmImpostoObj.SQLAtuImpostoRetido.Prepare;
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PIDIMPOSTORETIDO').AsFloat := iIdImpostoLancado;
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PDATARETENCAO').AsDateTime := _DataRetencao;
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PCODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PVLRBASE').AsFloat := _ValorLancto * _Fator;

            // 16355 Alex 23/03/04 Corrigir arredondamento
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PVLRRETIDO').AsFloat := RoundCM( _ValorImposto * _Fator, 2 );
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PIDFORCLI').AsFloat := FIdForCli;
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PIDPESSOA').AsFloat := fIdEmpresa;
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PCODDOCUMENTO').AsFloat := FCodDocumento;
            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PRECPAG').AsString := fRecPag;

            if _CodNewDoc <= 0 then
               _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('CODDOCLANCADO').Clear
            else
               _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('CODDOCLANCADO').AsFloat := _CodNewDoc;

            if _NumLancto = 0 then
               _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PNUMLANCTO').Clear
            else
               _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PNUMLANCTO').AsFloat := _NumLancto;

            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('PNUMLANCTOORIGEM').AsFloat := FNumLancto;

            if fNumLote > 0 then
               _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('NUMLOTE').AsFloat := fNumLote
            else
               _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('NUMLOTE').Clear;

            if fNumLoteManual > 0 then
              _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('NUMLOTEMANUAL').AsFloat := fNumLoteManual
            else
              _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('NUMLOTEMANUAL').Clear;

            _DtmImpostoObj.SQLAtuImpostoRetido.ParamByName('ALIQUOTA').AsFloat := _PercCustAgreg;

            if not ExecSQL(_DtmImpostoObj.SQLAtuImpostoRetido.SQLChanged) then
               Raise Exception.Create(MessageInfo);

            //início - andre tavares - 03/03/2006
            if _AcumulaMes then
              if not InsereDocXImpostoAcum then
                Raise Exception.Create(MessageInfo);
            //fim - andre tavares - 03/03/2006
            
         end
         else
            //Acumula o valor do lançamento na IMPOSTORETIDO para ser lançado em EfetivaNovoDocumento
            AcumulaLancaImposto;
      end;

      _CodNewDoc := 0;

      //Enche a query de simulação do lançamento dos impostos sse não existir um documento de origem (FCodTipRecDes <> '')
      if FCodTipRecDes <> '' then
      begin
        fCdsSimulacao.Append;
        fCdsSimulacao.FieldByName('IDIMPOSTO').AsFloat    := _DtmImpostoObj.CdsImposto.FieldByName('CODTIPOCUSTAGREG').AsFloat;
        fCdsSimulacao.FieldByName('VALORIMPOSTO').AsFloat := _ValorImposto;
        fCdsSimulacao.FieldByName('PERCIMPOSTO').AsFloat  := _DtmImpostoObj.CdsFaixaImposto.FieldByName('PERCCUSTAGREG').AsFloat;
        fCdsSimulacao.FieldByName('VALORBASE').AsFloat    := _ValorLancto*(_DtmImpostoObj.CdsFaixaImposto.FieldByName('PERCBASE').AsFloat/100);
        fCdsSimulacao.Post;
      end
      else
      begin
        (*
          For imposto do tipo 'Sommente Calcula Valor' e, caso o sistema esteja integrado
          com a contabilidade e se o imposto tiver parâmetros contábeis para o lançamento
          é efetuado a contabilização do lançamento.
        *)
        if (_DtmImpostoObj.CdsImposto.FieldByName('CODTRATFISCD').AsString = '9') And
           (IntegraContab) And
           (iIdImpostoLancado <> 0) then ContabilizaSCV;
      end;
   end;
end;





procedure TCtrlImpostoRetido.Alterar;
var
  sDecSeparator: Char;
begin
   sDecSeparator := DecimalSeparator;
   DecimalSeparator := '.';

   _DtmImpostoObj.SQLImpostoPorDoc.Prepare;
   _DtmImpostoObj.SQLImpostoPorDoc.ParamByName('CODDOCUMENTO').AsFloat := FCodDocumento;
   _DtmImpostoObj.SQLImpostoPorDoc.Open;
   _DtmImpostoObj.CdsImpostoPorDoc.First;

   //>> Implementar a Alteração da Contabilidades

   if FNumLancto = 0 then
   begin
      if FIdImpostoRetido <> 0 then
      begin
        _DtmImpostoObj.CdsImpostoPorDoc.Filter   := 'IDIMPOSTORETIDO = ' + IntToStr(FIdImpostoRetido);
        _DtmImpostoObj.CdsImpostoPorDoc.Filtered := True;
      end
      else
        _DtmImpostoObj.CdsImpostoPorDoc.Filtered := False
   end
   else
   begin
      _DtmImpostoObj.CdsImpostoPorDoc.Filter   := 'NUMLANCTO = ' + IntToStr(FNumLancto);
      _DtmImpostoObj.CdsImpostoPorDoc.Filtered := True;
   end;

   _DtmImpostoObj.CdsImpostoPorDoc.First;
   while not _DtmImpostoObj.CdsImpostoPorDoc.Eof do
   begin
      _CalculaSobreValorBruto := ((_DtmImpostoObj.CdsImpostoPorDoc.FieldByName('FLGCALCVALBRUTO').AsString <> 'N') Or (FValorLiquido = 0));

      if _CalculaSobreValorBruto then
         _ValorLancto := FValorLancto
      else
         _ValorLancto := FValorLiquido;

      {
      if ((fDebCre = 'D') And (fRecPag = 'P')) Or
         ((fDebCre = 'C') And (fRecPag = 'R')) then
         _Fator := -1
      else
      }
         _Fator := 1;
      

      if FNumLancto = 0 then
      begin
         if FIdImpostoRetido <> 0 then
         begin
            if not ExecSQl('UPDATE IMPOSTORETIDO SET VLRBASE = ' + FloatToStr(_ValorLancto * _Fator) +
                           ' WHERE (IMPOSTORETIDO = ' + IntToStr(FIdImpostoRetido) + ')') then
               Raise Exception.Create(MessageInfo);
         end
         else
         begin
            if not ExecSQL('UPDATE IMPOSTORETIDO SET VLRBASE = ' + FloatToStr(_ValorLancto * _Fator) +
                           ' WHERE (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ') AND ' +
                           '      (CODTIPOCUSTAGREG = ' + FloatToStr(_DtmImpostoObj.CdsImpostoPorDoc.FieldByName('CODTIPOCUSTAGREG').AsFloat) + ')') then
               Raise Exception.Create(MessageInfo);
         end
      end
      else
      begin
         if not ExecSQL('UPDATE IMPOSTORETIDO SET VLRRETIDO = ' + FloatToStr(_ValorLancto * _Fator) +
                        ' WHERE (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                        ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')') then
            Raise Exception.Create(MessageInfo);
      end;

      _DtmImpostoObj.CdsImpostoPorDoc.Next;
   end;

   DecimalSeparator := sDecSeparator;
   FIdImpostoRetido := 0;
end;




procedure TCtrlImpostoRetido.Excluir;
var
  sSqlSelect, sSqlDelete :String;

  procedure ExcluiContabilidadeImposto(dPlnCodigo: Double);
  begin
     if dPlnCodigo > 0 then
     begin
        if not _LancaContab.ExcluiLancaContab(FIdUsuario, dPlnCodigo, FIdModulo, 0, FUsaPlanoPatro, True) then
           Raise Exception.Create('Erro ao Excluir contabilização de Somente Calcula Valor' + (#113+#10) + _LancaContab.MessageInfo);
     end;
  end;
begin

  //início - andre tavares - pendencia 21377 - 07/03/2006
   if not execSql('DELETE FROM DOCXIMPOSTOACUM WHERE IDIMPOSTORETIDO IN (SELECT IDIMPOSTORETIDO FROM IMPOSTORETIDO WHERE CODDOCUMENTO = '+ IntToStr(FCodDocumento) + ')') then
    Raise Exception.Create('Erro ao Excluir o relacionamento Documentos X Impostos Acumulados' + (#113+#10) + self.MessageInfo);
  //fim - andre tavares - pendencia 21377 - 07/03/2006

   if IsCPMFTransf(FCodDocumento) then
      ExcluiIntegracaoCPMFTransf(FCodDocumento)
   else
   begin

      // Alex - 04/04/04 - 16454 - excluir os lançamentos na lancirrf

      _Cds.Data := GetDataPacket ('SELECT IDDARF FROM LANCIRRF WHERE (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')' +
                                  ' AND (IDDARF IS NOT NULL) ');


      //início - andre tavares - pendência 21735 - 12/04/2006 - não mexer no darf se ele já existe
      {
      if not _Cds.IsEmpty then  // o darf já foi gerado
        raise Exception.Create ('O documento não pode ser excluído / estornado. Já foi gerado um Darf para pagamento!')
      else if not ExecSQL('DELETE FROM LANCIRRF WHERE ' +
                          ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')') then
        Raise Exception.Create(MessageInfo);
      }

      if _Cds.IsEmpty then  //deletar somente se ainda não existe darf
        if not ExecSQL('DELETE FROM LANCIRRF WHERE ' +
                          ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')') then
          Raise Exception.Create(MessageInfo);

      //fim - andre tavares - pendência 21735 - 12/04/2006

      _Cds.Close;
      // FIM Alex - 04/04/04 - 16454 - excluir os lançamentos na lancirrf


      //Sincronização com a exclusão da ImpostoRetido da CMBack
      if (FNumLancto = 0) And (FNumLanctoOrigem = 0) And (fTipoExclusao = teSoBaixa) then
      begin
         if fNumLoteManual <> 0 then
         begin
            sSqlSelect := 'SELECT DISTINCT CODDOCUMENTO, CODDOCLANCADO, NUMLANCTO, PLNCODIGO FROM IMPOSTORETIDO WHERE NUMLOTEMANUAL = ' + FloatToStr(fNumLoteManual);
            sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE NUMLOTEMANUAL = ' + FloatToStr(fNumLoteManual);
         end
         else
           if fNumLote <> 0 then
           begin
              sSqlSelect := 'SELECT DISTINCT CODDOCUMENTO, CODDOCLANCADO, NUMLANCTO'+
              // Gleyber - 03/07/2003 - pendência 14414 - Início
              ', PLNCODIGO '+
              // Gleyber - 03/07/2003 - pendência 14414 - Fim
              'FROM IMPOSTORETIDO WHERE NUMLOTE = ' + FloatToStr(fNumLote);
              sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE NUMLOTE = ' + FloatToStr(fNumLote);
           end
           else
              Exit;
              //Raise Exception.Create('Erro ao excluir Imposto Proveniente de Baixa de Documento: O Número do lote está zerado');

         _DtmImpostoObj.SQLAux.Sql.Text := sSqlSelect;
         _DtmImpostoObj.SQLAux.Open;

         if not ExecSQL(sSqlDelete) then Raise Exception.Create(MessageInfo);

         while not _DtmImpostoObj.CdsAux.Eof do
         begin
           //Verifica se o imposto retido gerou um novo documento para posterior exclusão do mesmo
           if  _DtmImpostoObj.CdsAux.FieldByName('CODDOCLANCADO').AsInteger > 0 then
           begin
              _CodNewDoc :=  _DtmImpostoObj.CdsAux.FieldByName('CODDOCLANCADO').AsInteger;
              ExcluiDocLancados;
           end
           else
           begin
              //Verifica se o lançamento de origem é um alterador e procede com a exclusão do mesmo
              _CodNewDoc :=  _DtmImpostoObj.CdsAux.FieldByName('CODDOCUMENTO').AsInteger;
              fNumLancto :=  _DtmImpostoObj.CdsAux.FieldByName('NUMLANCTO').AsInteger;
              ExcluiAlteradoresLancados;
           end;

           ExcluiContabilidadeImposto(_DtmImpostoObj.CdsAux.FieldByName('PLNCODIGO').AsFloat);

           _DtmImpostoObj.CdsAux.Next;
         end;
      end
      else
      begin
         //Exclusão de todas as retenções associadas a o documento
         if FNumLancto = 0 then
         begin
            _DtmImpostoObj.CdsAux.Data := GetDataPacket('SELECT CODDOCUMENTO, NUMLANCTO, CODDOCLANCADO, PLNCODIGO FROM IMPOSTORETIDO WHERE ' +
                                       ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')');



            if not _DtmImpostoObj.CdsAux.IsEmpty then
            begin
               if not ExecSQL('DELETE FROM IMPOSTORETIDO WHERE ' +
                              ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')') then
                  Raise Exception.Create(MessageInfo);

               while not _DtmImpostoObj.CdsAux.Eof do
               begin
                 FNumLancto := _DtmImpostoObj.CdsAux.FieldByName('NUMLANCTO').AsInteger;
                 _CodNewDoc := _DtmImpostoObj.CdsAux.FieldByName('CODDOCLANCADO').AsInteger;

                 ExcluiDocLancados;

                 _CodNewDoc := _DtmImpostoObj.CdsAux.FieldByName('CODDOCUMENTO').AsInteger;
                 fNumLancto := _DtmImpostoObj.CdsAux.FieldByName('NUMLANCTO').AsInteger;
                 ExcluiAlteradoresLancados;

                 ExcluiContabilidadeImposto(_DtmImpostoObj.CdsAux.FieldByName('PLNCODIGO').AsFloat);

                 _DtmImpostoObj.CdsAux.Next;
               end;
            end;
         end
         else
         begin
            //Exclui diversos tipo de retenção para o lançamento de origem
            if fNumLanctoOrigem <> 0 then
            begin

              Case fTipoExclusao of
                teAll: //Exclui todos as retenções para o lançamento de origem
                begin
                   sSqlSelect := 'SELECT CODDOCUMENTO, NUMLANCTO, CODDOCLANCADO, PLNCODIGO FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ')';
                   sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ')';
                end;
                teSoBaixa: //Exclui somente as retenções na baixa do lançamento de origem
                begin
                   sSqlSelect := 'SELECT I.CODDOCUMENTO, I.NUMLANCTO, I.CODDOCLANCADO, PLNCODIGO FROM IMPOSTORETIDO I, TIPOAGRE T WHERE (I.NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND (T.FLGLANCAIMPOSTO = ''B'') AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)';
                   sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND (CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG FROM TIPOAGRE WHERE (FLGLANCAIMPOSTO = ''B'')))';
                end;
                teSoLancamento: //Exclui somente as retenções no lançamento do lançamento de origem
                begin
                   sSqlSelect := 'SELECT I.CODDOCUMENTO, I.NUMLANCTO, I.CODDOCLANCADO, PLNCODIGO FROM IMPOSTORETIDO I, TIPOAGRE T WHERE (I.NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND ((T.FLGLANCAIMPOSTO <> ''B'') OR (T.FLGLANCAIMPOSTO IS NULL)) AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)';
                   sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLANCTOORIGEM = ' + IntToStr(fNumLanctoOrigem) + ') AND (CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG FROM TIPOAGRE WHERE (FLGLANCAIMPOSTO <> ''B'') OR (FLGLANCAIMPOSTO IS NULL)))';
                end;
              end;

              _DtmImpostoObj.CdsAux.Data := GetDataPacket(sSqlSelect);

              if not _DtmImpostoObj.CdsAux.IsEmpty then
              begin
                 if not ExecSQL(sSqlDelete) then Raise Exception.Create(MessageInfo);

                 while not _DtmImpostoObj.CdsAux.Eof do
                 begin
                   FNumLancto := _DtmImpostoObj.CdsAux.FieldByName('NUMLANCTO').AsInteger;
                   _CodNewDoc := _DtmImpostoObj.CdsAux.FieldByName('CODDOCLANCADO').AsInteger;

                   ExcluiDocLancados;

                    //Alteração Nova - Verificar se os alteradores de origem serão excluídos
                   FNumLancto := _DtmImpostoObj.CdsAux.FieldByName('NUMLANCTO').AsInteger;
                   _CodNewDoc := _DtmImpostoObj.CdsAux.FieldByName('CODDOCUMENTO').AsInteger;
                   ExcluiAlteradoresLancados;

                   ExcluiContabilidadeImposto(_DtmImpostoObj.CdsAux.FieldByName('PLNCODIGO').AsFloat);

                   _DtmImpostoObj.CdsAux.Next;
                 end;
              end;

              //Exclui Documentos lançados provenientes de lotes
              if (fTipoExclusao = teSoBaixa) and
                //(_CodNewDoc = 0) and (fNumLote <> 0.00) then
                (trunc(_CodNewDoc) = 0) and (trunc(fNumLote) <> 0) then // andre tavares 06/03/2006 ***
              begin
                sSqlSelect := 'SELECT I.CODDOCUMENTO, I.NUMLANCTO, I.CODDOCLANCADO, I.PLNCODIGO FROM IMPOSTORETIDO I, TIPOAGRE T WHERE (I.NUMLOTE = ' + FloatToStr(fNumLote) + ') AND (T.FLGLANCAIMPOSTO = ''B'') AND (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG)';
                sSqlDelete := 'DELETE FROM IMPOSTORETIDO WHERE (NUMLOTE = ' + FloatToStr(fNumLote) + ') AND (CODTIPOCUSTAGREG IN (SELECT CODTIPOCUSTAGREG FROM TIPOAGRE WHERE (FLGLANCAIMPOSTO = ''B'')))';

                _DtmImpostoObj.CdsAux.Data := GetDataPacket(sSqlSelect);
                if not _DtmImpostoObj.CdsAux.IsEmpty then
                begin
                  if not ExecSQL(sSqlDelete) then Raise Exception.Create(MessageInfo);

                  while not _DtmImpostoObj.CdsAux.EOF do
                  begin
                    FNumLancto := _DtmImpostoObj.CdsAux.FieldByName('NUMLANCTO').AsInteger;
                    _CodNewDoc := _DtmImpostoObj.CdsAux.FieldByName('CODDOCLANCADO').AsInteger;
                    ExcluiDocLancados;

                    //Alteração Nova - Verificar se os alteradores de origem serão excluídos
                    FNumLancto := _DtmImpostoObj.CdsAux.FieldByName('NUMLANCTO').AsInteger;
                    _CodNewDoc := _DtmImpostoObj.CdsAux.FieldByName('CODDOCUMENTO').AsInteger;
                    ExcluiAlteradoresLancados;

                    ExcluiContabilidadeImposto(_DtmImpostoObj.CdsAux.FieldByName('PLNCODIGO').AsFloat);

                    _DtmImpostoObj.CdsAux.Next;
                  end;
                end;
              end;
            end
            else
            begin
              //Exclui as retenções para o lançamento específico
              _Cds.Data := GetDataPacket('SELECT CODDOCUMENTO, CODDOCLANCADO, NUMLANCTO, PLNCODIGO FROM IMPOSTORETIDO WHERE ' +
                                         ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                                         ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')');


              if not ExecSQL('DELETE FROM IMPOSTORETIDO WHERE ' +
                             ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                             ' (CODDOCUMENTO = ' + IntToStr(FCodDocumento) + ')') then
                 Raise Exception.Create(MessageInfo);

              while not _Cds.Eof do
              begin
                 _CodNewDoc := _Cds.FieldByName('CODDOCLANCADO').AsInteger;
                 ExcluiDocLancados;

                 _CodNewDoc := _Cds.FieldByName('CODDOCUMENTO').AsInteger;
                 fNumLancto := _Cds.FieldByName('NUMLANCTO').AsInteger;
                 ExcluiAlteradoresLancados;

                ExcluiContabilidadeImposto(_DtmImpostoObj.CdsAux.FieldByName('PLNCODIGO').AsFloat);
                _Cds.Next;
              end;

              if _Cds.Active then _Cds.Close;
            end;
         end;
      end;
   end;

   fNumLanctoOrigem := 0;
   _CodNewDoc       := 0;
   fTipoExclusao    := teAll;
end;





procedure TCtrlImpostoRetido.ExcluiAlteradoresLancados;
var
   sSql: String;
   dDataLancto: TDateTime;
   iPlnCodigo: LongInt;
begin
  if fExcluiAlteradores then
  begin
     _Cds.Data := GetDataPacket('SELECT PLNCODIGO,DATALANCTO FROM LANCTODOCUM WHERE ' +
                                ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                                ' (CODDOCUMENTO = ' + IntToStr(_CodNewDoc) + ') AND ESTORNO IS NULL AND OPERACAO = ''4''');

     if not _Cds.IsEmpty then
     begin
        iPlnCodigo := _Cds.FieldByName('PLNCODIGO').AsInteger;
        dDataLancto := _Cds.FieldByName('DATALANCTO').AsDateTime;

        sSql := 'DELETE FROM LANCTODOCUM ' +
                 'WHERE (CODDOCUMENTO = '+ IntToStr(_CodNewDoc) + ') AND ' +
                 ' (NUMLANCTO = ' + IntToStr(FNumLancto) + ') AND ' +
                 '( OPERACAO = ''4'')';

        if not ExecSQL(sSql) then Raise Exception.Create(MessageInfo);

        if (iPlnCodigo > 0) And
           (_Documento.EstornaExcluiContab(iPlnCodigo, IdEmpresa, IdUsuario, IdModulo,
                                           dDataLancto, UsaPlanoPatro) = tecErro) then
           Raise Exception.Create(_Documento.MessageInfo);
     end;
  end;
end;





procedure TCtrlImpostoRetido.AlteraNumLancOrigem(iNumLancOld, iNumLancNew :LongInt);
begin
  _DtmImpostoObj.SQLAltNumLanc.Prepare;
  _DtmImpostoObj.SQLAltNumLanc.ParamByName('NEWNUMLANCTOORIGEM').AsFloat := iNumLancNew;
  _DtmImpostoObj.SQLAltNumLanc.ParamByName('NUMLANCTOORIGEM').AsFloat := iNumLancOld;

  if not ExecSQL(_DtmImpostoObj.SQLAltNumLanc.SQLChanged) then Raise Exception.Create(_Documento.MessageInfo);
end;





procedure TCtrlImpostoRetido.LancaDocumento;
var
  iPlnCodigo :LongInt;
  sCompl, sfPlaConta, sfCentroCusto, sDebCre, sHistCompl :String;
  rNumDocumento, rValorTotalRateio, rSumrValorPorRateio, rValorPorRateio, rAcumulaValorRateio, rValorDiferenca: Double;
  bexiste :boolean;
  ssubcontad, sunidnegd, scodcemtcustd, splacontad, ssubcontac, sunidnegc,
  scodcemtcustc, splacontac:String;
  iContReg, iCodTipDoc :LongInt;
  sTipoFaura, sNumFatura, sHistorico, sComplHst :String;
  dDataLanctoDocImposto :TDateTime;

  function GetHistNumDocumento: String;
  begin
     With TClientDataSet.Create(nil) do
       Try
          Data := GetDataPacket(' SELECT ' +
                                '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL ' +
                                ' FROM  ' +
                                '   DOCUMENTO D, PESSOA P WHERE D.IDFORCLI = P.IDPESSOA AND D.CODDOCUMENTO = ' + FloatToStr(FCodDocumento));
          if IsEmpty then
             Result := ''
          else
             Result := ' Ref Doc Nº ' + Trim(Fields[0].AsString + ' ' + Fields[1].AsString) + ' ' + Fields[2].AsString;
       finally
          Free;
       end;
  end;

  {****************************************************************************}

  procedure LancaContabNovoDocumento(rValorLancto: Double; sUnidNegDdLancto, sUnidNegCLancto: String; iPlanoLancto, iPatrocinadoraLancto: Integer; bJundaLancto: Boolean);
  begin
     {**
        Passo 2
        Criação de função de contabilização para ser chamada de acordo como rateio do
        documento.
        Vide passo 3.
     **}

     if FIntegraContab then
     begin
        if FPartidaDobrada then
        begin
           if not _LancaContab.InsereLancaContab('2', FIdEmpresa, FIdModulo, FIdUsuario, FIdPlanoConta,
                        StrToIntDef(sUnidNegDdLancto, -1), StrToIntDef(ssubcontad,0), StrToIntDef(ssubcontac,0),
                        iPlanoLancto, iPatrocinadoraLancto, iPlnCodigo, 0, DateTOStr(_DataLancto), FloatToStr(rNumDocumento),
                        sHistCompl, '', '', '', '', '03', scodcemtcustd, splacontad, scodcemtcustc, splacontac, '',
                        rValorLancto, True, FUsaPlanoPatro,
                        // 12/01/04 Alex 14451 Pendente
                        -1, -1) then
                  Raise Exception.Create(_LancaContab.MessageInfo);

           iPlnCodigo := Trunc(_LancaContab.RetornoPlnCodigo);
        end
        else
        begin
           if not _LancaContab.InsereLancaContab('0', FIdEmpresa, FIdModulo, FIdUsuario, FIdPlanoConta,
                        StrToIntDef(sUnidNegDdLancto, -1), StrToIntDef(ssubcontad,0), 0, iPlanoLancto, iPatrocinadoraLancto, iPlnCodigo, 0,
                        DateTOStr(_DataLancto), FloatToStr(rNumDocumento), sHistCompl, '', '', '', '',
                        '03', scodcemtcustd, splacontad, '', '', '', rValorLancto, True, FUsaPlanoPatro,
                        // 12/01/04 Alex 14451 Pendente
                        -1, -1) then
                  Raise Exception.Create(_LancaContab.MessageInfo);

           iPlnCodigo := Trunc(_LancaContab.RetornoPlnCodigo);

           if not _LancaContab.InsereLancaContab('1', FIdEmpresa, FIdModulo, FIdUsuario, FIdPlanoConta,
                        StrToIntDef(sUnidNegCLancto, -1), 0, StrToIntDef(ssubcontac,0), iPlanoLancto, iPatrocinadoraLancto, iPlnCodigo, 0,
                        DateTOStr(_DataLancto), FloatToStr(rNumDocumento), sHistCompl, '', '', '', '',
                        '03', '', '', scodcemtcustc, splacontac,'', rValorLancto, True, FUsaPlanoPatro,
                        // 12/01/04 Alex 14451 Pendente
                        -1, -1) then
                  Raise Exception.Create(_LancaContab.MessageInfo);
        end;
     end;
  end;

  {****************************************************************************}
begin
  sCompl        := '';
  sfPlaConta    := '';
  sfCentroCusto := '';
  rNumDocumento := 0;
  bexiste       := True;

  _IdForCli := _IdForCliPortForma;

  if (_IdForCli = 0) then
  begin
     _IdForCli        := _DtmImpostoObj.CdsDadosLancImp.FieldByName('IDFORCLI').AsInteger;
     _ContaCliFor     := _DtmImpostoObj.CdsDadosLancImp.FieldByName('CONTACLIFOR').AsString;
     _CCustoCliFor    := _DtmImpostoObj.CdsDadosLancImp.FieldByName('CCUSTOCLIFOR').AsString;
     _UnidNegocCliFor := _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOCCLIFOR').AsInteger;
     _SubContaCliFor  := _DtmImpostoObj.CdsDadosLancImp.FieldByName('SUBCONTACLIFOR').AsInteger;
  end;

  if _IdForCli <> 0 then
  begin
     while bexiste do
     begin
        rNumDocumento :=GetSequence('NUMDOCIMPOSTO');
        bexiste := _Documento.ExisteNumDoc(FRecPag, FIdForCli, FIdEmpresa, rNumDocumento, sCompl);
     end;

     //if fNumLote = 0.00 then
     if trunc(fNumLote) = 0 then //andré tavares - pendência 21219 - 06/02/2006
        dDataLanctoDocImposto := _DataLancto
     else
        dDataLanctoDocImposto := GetDataLancDocImposto(_DataLancto);

     if _UnidNegocCliFor = 0 then _UnidNegocCliFor := -1;

     _Documento.Prepare(OpDocumento, odlEfetivo);
     _Documento.PartidaDobrada := fPartidaDobrada;
     _Documento.UsaPlanoPatro := fUsaPlanoPatro;
     _Documento.IdUsuario := fIdUsuario;
     _Documento.IdModulo := fIdModulo;
      //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
     _Documento.IdEspAcesso := fIdEspAcesso;

     _Documento.SetValues(0, rNumDocumento, sCompl, '0', FRecPag, '2', '', '',
                         _ContaCliFor, _CCustoCliFor, '', '', '', '', '', '', '', '',
                         {_DataLancto} dDataLanctoDocImposto,  //andre tavares - pendência 21219
                         dDataLanctoDocImposto, dDataLanctoDocImposto, 0, 0, 0, 0, 0,
                         0, 0, 0, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPDOC').AsInteger,
                         FIdEmpresa, FIdModulo, _IdForCli, 0, 0, _UnidNegocCliFor, FIdPlanoConta, 0,
                         0, 0, 0, 0, FIdUsuario, FIdEmpresa, 0, 0, _SubContaCliFor, 0, 0, 0, 0,
                         // 14/01/04 Alex 14451 Pendente
                         -1);

     {** IntegraContabção do Documento Gerado no imposto: D - TIPO AGRE C - FORNECEDOR **}
     iPlnCodigo:= 0;

     //Bruno Bastos - Pend. 17669 - 04/11/2004 - Início
     {if not _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').IsNull then
       sHistCompl := 'Lançamento de ' + _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').AsString + sComplHst
     else}
     //Bruno Bastos - Pend. 17669 - 04/11/2004 - Fim

     //Bruno Bastos - Pend. 17669 - 04/11/2004
     sHistCompl := 'Lançamento de ' + _DtmImpostoObj.CdsAcumula.FieldByName('DESCCUSTAGREG').AsString + sComplHst;

     if FIntegraContab then
     begin
        sDebCre := _Documento.GetDebCre(_DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPDOC').AsInteger);

        if (sDebCre = 'C') then
        begin
          ssubcontad    := _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODSUBCONTACONTAB').AsString;
          sunidnegd     := _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOCCONTAB').AsString;
          scodcemtcustd := _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTROCUSTO').AsString;
          splacontad    := _DtmImpostoObj.CdsDadosLancImp.FieldByName('PLACONTA').AsString;
          ssubcontac    := IntToStr(_SubContaCliFor);

          if _UnidNegocCliFor = 0 then
            sunidnegc     := '-1'
          else
            sunidnegc     := IntToStr(_UnidNegocCliFor);

          scodcemtcustc := _CCustoCliFor;
          splacontac    := _ContaCliFor;
        end
        else
        begin
          ssubcontac    := _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODSUBCONTACONTAB').AsString;
          sunidnegc     := _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOCCONTAB').AsString;
          scodcemtcustc := _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTROCUSTO').AsString;
          splacontac    := _DtmImpostoObj.CdsDadosLancImp.FieldByName('PLACONTA').AsString;
          ssubcontad    := IntToStr(_SubContaCliFor);

          if _UnidNegocCliFor = 0 then
             sunidnegd     := '-1'
          else
             sunidnegd     := IntToStr(_UnidNegocCliFor);

          scodcemtcustd := _CCustoCliFor;
          splacontad    := _ContaCliFor;
        end;

        sHistorico := 'Lançamento de Documento Associado a Imposto';

        if not _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').IsNull then
           sHistorico := 'Lançamento de ' + _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').AsString + ' - '+
                         _DtmImpostoObj.CdsDadosLancImp.FieldByName('RAZAOSOCIAL').AsString
        else
           if not _DtmImpostoObj.CdsAcumula.FieldByName('DESCCUSTAGREG').IsNull then
              sHistorico := 'Lançamento de ' + _DtmImpostoObj.CdsAcumula.FieldByName('DESCCUSTAGREG').AsString + ' - '+
                            _DtmImpostoObj.CdsDadosLancImp.FieldByName('RAZAOSOCIAL').AsString;


        {**
          22/03/2002
          Inclusão do hsitórico complementar baseado no nome do fornecedore e nº do documento de origem.
          Caso a retenção seja originada de um lote, é gravado apenas o número do lote.
        **}
        if fNumLote = 0.00 then
           sComplHst := GetHistNumDocumento
        else
           sComplHst := ' Ref. Lote Nº ' + FloatToStr(fNumLote);

        iPlnCodigo := 0;

        {**
           Passo 1
           A Contabilização era feita aqui, passou para dentro do rateio pois é nescessário
           que o documento da CPMF tenha os mesmos rateios dos documentos de origem.
           Vide passos 2 e 3.
        **}
     end;

     if FMascaraNoDocum <> '' then
     begin
        sTipoFaura := sCompl;
        sNumFatura := FloatToStr(rNumDocumento);
        iCodTipDoc := _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPDOC').AsInteger;
     end
     else
     begin
        sTipoFaura := '';
        sNumFatura := '';
        iCodTipDoc := 0;
     end;

     if (Trim(sDebCre) <> 'C') And (Trim(sDebCre) <> 'D') then
        Raise Exception.Create('DebCre inválido para no lançamento dr Imposto para o CodDocumento: ' + IntToStr(FCodDocumento));

     {**
        Passo 3
        A inserção do lancto docum passou para depois do rateio pois a contabilização
        agora passou a ser efetuada dentro do rateio.
        Vide passo 4
     **}

     if fNumLote = 0.00 then
     begin
       if _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').IsNull then
       begin
          LancaContabNovoDocumento(_ValorImposto,
                                   sunidnegd,
                                   sunidnegC,
                                   -1,
                                   -1,
                                   false);

          _Documento.Rateiodocum.SetValues(_ValorImposto, 0, 0, 0, FIdEmpresa, 0, -1, 0,
          FIdUsuario, 0, FIdPlanoConta, 0, 0, 0, 0, FIdEmpresa, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPRECDES').AsString,
          FRecPag, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTRORESPON').AsString, '', '')
       end
       else
       begin
          LancaContabNovoDocumento(_ValorImposto,
                                   _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsString,
                                   _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsString,
                                   -1,
                                   -1,
                                   false);

          _Documento.Rateiodocum.SetValues(_ValorImposto, 0, 0, 0, FIdEmpresa, 0,
          _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsInteger, 0,
          FIdUsuario, 0, FIdPlanoConta, 0, 0, 0, 0, FIdEmpresa, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPRECDES').AsString,
          FRecPag, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTRORESPON').AsString, '', '');
       end;
     end
     else
     begin
       {**
          Passo 4
          Contabilização e rateio proporicionais aos documentos de origem
          Vide passo 5
       **}

       //Faz rateio proporcional ao rateio dos documentos de origem do imposto com tratamento Fiscal 'B'
       //BuscaRateio dos Documentos envolvidos no lote.

       //Verifica se documento de origem é englobado ou parcelado e muda
       //a query do rateio de acordo com a operacao do documento de origem

       _DtmImpostoObj.SQLAux.SQL.Clear;
       _DtmImpostoObj.SQLAux.SQL.Text := ' SELECT ' +
                                         ' DECODE(CODCENTROCUSTO,NULL,'''',CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                                         ' DECODE(IDPLANOPREV,NULL,-1,IDPLANOPREV) AS IDPLANOPREV, ' +
                                         ' DECODE(IDPATRO,NULL,-1,IDPATRO) AS IDPATRO, ' +
                                         ' DECODE(IDPROGRAMA,NULL,-1,IDPROGRAMA) AS IDPROGRAMA, ' +
                                         ' SUM(VALOR) AS VALOR ' +
                                         ' FROM ' +
                                         '  RATEIODOCUM ' +
                                         ' WHERE ' +
                                         //'   CODDOCUMENTO IN (' + Copy(_DtmImpostoObj.CdsAcumula.FieldByName('CODDOCSACUMULA').AsString,3,Length(_DtmImpostoObj.CdsAcumula.FieldByName('CODDOCSACUMULA').AsString)) +  ')' +
                                         '   CODDOCUMENTO IN (' + Copy(_CODDOCSACUMULA,2,Length(_CODDOCSACUMULA)) +  ')' +
                                         ' GROUP BY ' +
                                         '   CODCENTROCUSTO, IDPLANOPREV, IDPATRO, IDPROGRAMA ' +
                                         'UNION ' +
                                         ' SELECT DISTINCT ' +
                                         '  DECODE(Q2.CODCENTROCUSTO,NULL,'''',Q2.CODCENTROCUSTO) AS CODCENTROCUSTO, ' +
                                         '  DECODE(Q2.IDPLANOPREV,NULL,-1,Q2.IDPLANOPREV) AS IDPLANOPREV, ' +
                                         '  DECODE(Q2.IDPATRO,NULL,-1,Q2.IDPATRO) AS IDPATRO, ' +
                                         '  DECODE(Q2.IDPROGRAMA,NULL,0,Q2.IDPROGRAMA) AS IDPROGRAMA, ' +
                                         '  SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO ' +
                                         ' FROM ' +
                                         '  (SELECT ' +
                                         '     DOC.NUMFATURA, ' +
                                         '     LAN.VALOR ' +
                                         '  FROM ' +
                                         '     DOCUMENTO DOC, ' +
                                         '     LANCTODOCUM LAN ' +
                                         '  WHERE ' +
                                         '    (DOC.CODDOCUMENTO IN (' + Copy(_CODDOCSACUMULA,2,Length(_CODDOCSACUMULA)) +  ')) AND ' +
                                         '    ((LAN.OPERACAO = ''3'') OR (LAN.OPERACAO = ''13'')) AND ' +
                                         '     (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1, ' +
                                         ' (SELECT ' +
                                         '   D.NUMFATURA, ' +
                                         '   RD.VALOR, ' +
                                         '   RD.CODCENTROCUSTO, ' +
                                         '   RD.IDPLANOPREV, ' +
                                         '   RD.IDPATRO, ' +
                                         '   RD.IDPROGRAMA ' +
                                         '  FROM ' +
                                         '   RATEIODOCUM RD, DOCUMENTO D ' +
                                         '  WHERE ' +
                                         '   (D.NUMFATURA IS not NULL) AND ' +
                                         '   (D.CODDOCUMENTO = RD.CODDOCUMENTO)) Q2, ' +
                                         '  (SELECT ' +
                                         '    D.NUMFATURA, SUM(L.VALOR) AS VALOR ' +
                                         '   FROM ' +
                                         '    LANCTODOCUM L, DOCUMENTO D ' +
                                         '   WHERE ' +
                                         '    ((L.OPERACAO = ''1'') OR  (L.OPERACAO = ''11'')) AND ' +
                                         '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                         '    (D.OPERACAO = L.OPERACAO) AND ' +
                                         '    (D.NUMFATURA IS not NULL) ' +
                                         '   GROUP BY D.NUMFATURA) Q3 ' +
                                         ' WHERE ' +
                                         '  (Q1.NUMFATURA = Q2.NUMFATURA) AND ' +
                                         '  (Q3.NUMFATURA = Q2.NUMFATURA) ' +
                                         ' GROUP ' +
                                         '  BY Q2.CODCENTROCUSTO, Q2.IDPROGRAMA, Q2.IDPATRO, Q2.IDPLANOPREV ';

       _DtmImpostoObj.SQLAux.Prepare;
       _DtmImpostoObj.SQLAux.Open;

       rValorTotalRateio := 0;
       iContReg := 0;

       _DtmImpostoObj.CdsAux.First;
       while not _DtmImpostoObj.CdsAux.Eof do
       begin
          rValorTotalRateio := rValorTotalRateio + _DtmImpostoObj.CdsAux.FieldByName('VALOR').AsFloat ;
          Inc(iContReg);
          _DtmImpostoObj.CdsAux.Next;
       end;

       _DtmImpostoObj.CdsAux.First;
       rSumrValorPorRateio := 0;
       rAcumulaValorRateio := 0;

       _DtmImpostoObj.CdsAux.First;  //andre tavares 06/03/2006 *** coloquei este códogo senão não entra no loop abaixo 
       while not _DtmImpostoObj.CdsAux.Eof do
       begin
         Dec(iContReg);

         if iContReg = 0 then
            rValorPorRateio := _DtmImpostoObj.CdsAcumula.FieldByName('VLRRETIDO').AsFloat - rSumrValorPorRateio
         else
            // 16355 Alex 23/03/04 Corrigir arredondamento
            rValorPorRateio := RoundCM( ( (_DtmImpostoObj.CdsAux.FieldByName('VALOR').AsFloat * _DtmImpostoObj.CdsAcumula.FieldByName('VLRRETIDO').AsFloat)/rValorTotalRateio), 2 );

         rAcumulaValorRateio := rAcumulaValorRateio + rValorPorRateio;
         rSumrValorPorRateio := rSumrValorPorRateio +  rValorPorRateio;

         if _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').IsNull then
         begin

           LancaContabNovoDocumento(rValorPorRateio,
                                    sunidnegd,
                                    sunidnegC,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger,
                                    False);

          _Documento.Rateiodocum.SetValues(rValorPorRateio, 0, 0, 0, FIdEmpresa, 0,
                                           -1, 0,
                                           FIdUsuario, 0, FIdPlanoConta,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPROGRAMA').AsInteger,
                                           0, FIdEmpresa,
                                           _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPRECDES').AsString,
                                           FRecPag, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTRORESPON').AsString,
                                           _DtmImpostoObj.CdsAux.FieldByName('CODCENTROCUSTO').AsString, '')
         end
         else
         begin
          LancaContabNovoDocumento(rValorPorRateio,
                                    _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsString,
                                    _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsString,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger, False);

          _Documento.Rateiodocum.SetValues(rValorPorRateio, 0, 0, 0, FIdEmpresa, 0,
                                           _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsInteger, 0,
                                           FIdUsuario, 0, FIdPlanoConta,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPROGRAMA').AsInteger,
                                           0, FIdEmpresa,
                                           _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPRECDES').AsString,
                                           FRecPag, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTRORESPON').AsString,
                                           _DtmImpostoObj.CdsAux.FieldByName('CODCENTROCUSTO').AsString, '');
          end;

         _DtmImpostoObj.CdsAux.Next;
       end;

       {**
          Verifica se o valor total do rateio bate com o valor do lançamento e caso seja diferente
          lança mais um rateio e cotabiliza com o valor da diferença.
       **}

       rValorDiferenca := _ValorImposto - rAcumulaValorRateio;

       if not IsFloatZero(rValorDiferenca) then
       begin
         if _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').IsNull then
         begin

           LancaContabNovoDocumento(rValorDiferenca,
                                    sunidnegd,
                                    sunidnegC,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger,
                                    False);

          _Documento.Rateiodocum.SetValues(rValorDiferenca, 0, 0, 0, FIdEmpresa, 0,
                                           -1, 0,
                                           FIdUsuario, 0, FIdPlanoConta,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPROGRAMA').AsInteger,
                                           0, FIdEmpresa,
                                           _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPRECDES').AsString,
                                           FRecPag, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTRORESPON').AsString,
                                           _DtmImpostoObj.CdsAux.FieldByName('CODCENTROCUSTO').AsString, '')
         end
         else
         begin
           LancaContabNovoDocumento(rValorDiferenca,
                                    _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsString,
                                    _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsString,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                    _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger, False);

          _Documento.Rateiodocum.SetValues(rValorDiferenca, 0, 0, 0, FIdEmpresa, 0,
                                           _DtmImpostoObj.CdsDadosLancImp.FieldByName('UNIDNEGOC').AsInteger, 0,
                                           FIdUsuario, 0, FIdPlanoConta,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPLANOPREV').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPATRO').AsInteger,
                                           _DtmImpostoObj.CdsAux.FieldByName('IDPROGRAMA').AsInteger,
                                           0, FIdEmpresa,
                                           _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODTIPRECDES').AsString,
                                           FRecPag, _DtmImpostoObj.CdsDadosLancImp.FieldByName('CODCENTRORESPON').AsString,
                                           _DtmImpostoObj.CdsAux.FieldByName('CODCENTROCUSTO').AsString, '');
         end;
       end;


       _DtmImpostoObj.CdsAux.Close;
     end;

     {**
        Passo 4
        Inserção do LanctoDocum após contabilização e rateio proporicionais
        Vide passo 5
     **}

     _Documento.Lanctodocum.SetValues(_DataLancto, 0, 0, _ValorImposto, 0, _ValorImposto,
     0, iPlnCodigo, 0, FIdUsuario, FIdEmpresa, 0, 0, iCodTipDoc, 0, 0, '2', '', '',
     sNumFatura, sHistCompl, sTipoFaura, '', '', sDebCre, FIdModulo, FIdPlanoConta, FUsaPlanoPatro);


     if not _Documento.Insert then Raise Exception.Create(_Documento.MessageInfo);

     _CodNewDoc := Trunc(_Documento.CodDocumento);

     if (fNumLote <> 0.00) And
        (not ExecSQL('UPDATE DOCUMENTO SET FLGCONFIRMARECPAG = ''S'' WHERE CODDOCUMENTO = ' + IntToStr(_CodNewDoc))) then
        Raise Exception.Create(MessageInfo);
  end;
end;





procedure TCtrlImpostoRetido.ExcluiDocLancados;
begin
   if _CodNewDoc > 0 then
   begin
      ExcluiAlteradoresLancados;
      
     _DtmImpostoObj.Sql.Sql.Text := ' SELECT L.CODDOCUMENTO, L.NUMLANCTO, L.DATALANCTO, P.DESCRICAO FROM LANCTODOCUM L, ' +
                                    '  RECBTOPAGTO R, PORTADORFORMA P ' +
                                    ' WHERE ' +
                                    '  (L.CODDOCUMENTO = ' + FloatToStr(_CodNewDoc) + ') AND ' +
                                    '  (RTRIM(L.OPERACAO) = ''5'') AND ' +
                                    '  (L.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
                                    '  (L.NUMLANCTO = R.NUMLANCTO) AND ' +
                                    '  (P.CODPORTFORMA(+) = R.CODPORTFORMA) ';

     _DtmImpostoObj.Sql.Open;

     if not _DtmImpostoObj.Cds.IsEmpty then
        Raise Exception.Create('Existem lançamentos de baixa de imposto no dia ' +
                               _DtmImpostoObj.Cds.FieldByName('DATALANCTO').AsString + ' na conta ' +
                               _DtmImpostoObj.Cds.FieldByName('DESCRICAO').AsString);

     _DtmImpostoObj.Sql.Sql.Text := ' SELECT ' +
                                    '  L.PLNCODIGO ' +
                                    ' FROM ' +
                                    '  LANCTODOCUM L, DOCUMENTO D ' +
                                    ' WHERE ' +
                                    '  (D.CODDOCUMENTO = ' + FloatToStr(_CodNewDoc) + ') AND ' +
                                    '  (RTRIM(D.OPERACAO) <> ''5'') AND ' +
                                    '  (L.ESTORNO IS NULL) AND ' +
                                    '  (D.CODDOCUMENTO = L.CODDOCUMENTO) ';
     _DtmImpostoObj.Sql.Open;

     if ( not ExecSql('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = ' + IntToStr(_CodNewDoc) + ' AND RTRIM(OPERACAO) <> ''5''') ) OR
        ( not ExecSql('DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO = ' + IntToStr(_CodNewDoc)) ) Or
        ( not ExecSql('DELETE FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(_CodNewDoc)) ) then
        Raise Exception.Create( MessageInfo );

     _DtmImpostoObj.Cds.First;

     while not _DtmImpostoObj.Cds.Eof do
     begin
        if _DtmImpostoObj.Cds.FieldByName('PLNCODIGO').AsInteger > 0  then
        begin
          if not _LancaContab.ExcluiLancaContab( FIdUsuario, _DtmImpostoObj.Cds.FieldByName('PLNCODIGO').AsInteger,
                                                 FIdModulo, 0, FUsaPlanoPatro, True) then
             Exception.Create('Não foi possível excluir a contabilização do lançamento.' + (#13+#10) + _LancaContab.MessageInfo);
        end;

        _DtmImpostoObj.Cds.Next;
     end;

     _DtmImpostoObj.Cds.Close;
   end;
end;





{procedure TCtrlImpostoRetido.AcumulaLancaDocumento;
begin
   if _QryAcumulaDoc.Locate('CODTIPOCUSTAGREG',_CodTipoCustoAgreg,FCodDocumento],[]) then
      _QryAcumulaDoc.Edit
   else
      _QryAcumulaDoc.Append;

   _QryAcumulaDoc.FieldByName('CODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
   _QryAcumulaDoc.FieldByName('VLRRETIDO').AsFloat := _QryAcumulaDoc.FieldByName('VLRRETIDO').AsFloat + _ValorImposto;
   _QryAcumulaDoc.FieldByName('DESCCUSTAGREG').AsString := _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').AsString;
   _QryAcumulaDoc.Post;

   _CodDocsAcumula := _CodDocsAcumula + ',' + FloatToStr(FCodDocumento);
end;}





procedure TCtrlImpostoRetido.AcumulaLancaImposto;
begin
   if _DtmImpostoObj.CdsAcumula.Locate('CODTIPOCUSTAGREG',_CodTipoCustoAgreg,[]) then
      _DtmImpostoObj.CdsAcumula.Edit
   else
      _DtmImpostoObj.CdsAcumula.Append;

   _DtmImpostoObj.CdsAcumula.FieldByName('CODTIPOCUSTAGREG').AsFloat := _CodTipoCustoAgreg;
   _DtmImpostoObj.CdsAcumula.FieldByName('DATARETENCAO').AsFloat := _DataRetencao;
   _DtmImpostoObj.CdsAcumula.FieldByName('VLRBASE').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('VLRBASE').AsFloat + (_ValorLancto * _Fator);

   // 16355 Alex 23/03/04 Corrigir arredondamento
   _DtmImpostoObj.CdsAcumula.FieldByName('VLRRETIDO').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('VLRRETIDO').AsFloat + ( RoundCM( _ValorImposto * _Fator, 2 ) );
   _DtmImpostoObj.CdsAcumula.FieldByName('IDFORCLI').AsFloat := FIdForCli;
   _DtmImpostoObj.CdsAcumula.FieldByName('IDPESSOA').AsFloat := fIdEmpresa;;
   _DtmImpostoObj.CdsAcumula.FieldByName('RECPAG').AsString := fRecPag;
   _DtmImpostoObj.CdsAcumula.FieldByName('DESCCUSTAGREG').AsString := _DtmImpostoObj.CdsImposto.FieldByName('DESCCUSTAGREG').AsString;
   _DtmImpostoObj.CdsAcumula.FieldByName('ALIQUOTA').AsFloat := _PercCustAgreg;
   _CodDocsAcumula := _CodDocsAcumula + ',' + FloatToStr(FCodDocumento);
   _DtmImpostoObj.CdsAcumula.Post;

end;





procedure TCtrlImpostoRetido.EfetivaNovoDocumento;
var
  X:Integer;
  DiaSemana: Array [1..5] of String;
begin
   DiaSemana[1] := 'Segunda';
   DiaSemana[2] := 'Terça';
   DiaSemana[3] := 'Quarta';
   DiaSemana[4] := 'Quinta';
   DiaSemana[5] := 'Sexta';

   //Se houver retenção com tratamento fiscal do tipo 'B' e for proveniente de Lote
   //o _CodDocsAcumula é <> ''. O lançamento é feito com um Loop nas queryes de _DtmImpostoObj.CdsAcumula e
   //_QryAcumulaDoc
   //if (fNumLote <> 0.00) {And (_CodDocsAcumula <> '')} then
   if trunc(fNumLote) <> 0 then //andre tavares 06/03/2006
   begin
      //_CodDocsAcumula := Copy(_CodDocsAcumula,2,Length(_CodDocsAcumula));

      //Lança o(s) documento(s) resultantes
      {_QryAcumulaDoc.First;
      while not _QryAcumulaDoc.Eof do
      begin

         _QryAcumulaDoc.Next;
      end;}


// inicio - 14/08/2003 - Andre Tavares - Para que este CDS22316 - na dúvida estou colocando a condição abaixo para evitar o erro.
      if _DtmImpostoObj.CdsAcumula.Active then
// fim - Andre Tavares
        //Lança a(s) retenções(s) e documentos resultantes
        _DtmImpostoObj.CdsAcumula.First;

      _iDiaSemanaLancto := 0;
      _iDiasUteisLancto := 0;
      _iCodCidade       := 0;
      _iCodPais         := 0;
      _sEstado          := '';

      if (fCodPortForma <> 0) then
      begin
        //Busca dados da Cidade, Pais e Estado
        _Cds.Data := GetDataPacket(' SELECT E.IDCIDADES, ' +
                                   '        ES.IDPAIS, ' +
                                   '        ES.CODESTADO ' +
                                   ' FROM ' +
                                   '   ENDPESS E, PESSOA P, CIDADES C, ESTADO ES ' +
                                   ' WHERE P.IDPESSOA = ' + IntToStr(fIdEmpresa)+ ' AND ' +
                                   '       P.IDENDCOMERCIAL = E.IDENDERECO AND ' +
                                   '       E.IDCIDADES = C.IDCIDADES AND ' +
                                   '       ES.IDESTADO = C.IDESTADO');
        if not _Cds.IsEmpty then
        begin
           _iCodCidade       := _Cds.Fields[0].AsInteger;
           _iCodPais         := _Cds.Fields[1].AsInteger;
           _sEstado          := _Cds.Fields[2].AsString;
        end;

        //Busca parâmetros do portador forma para efetuar lançamento
        _Cds.Data := GetDataPacket('SELECT DIASEMANALANCTO, DIASUTEISLANCTO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + FloatToStr(fCodPortForma));

        if not _Cds.IsEmpty then
        begin
           For X:=1 To 5 do
           begin
              if DiaSemana[x] = _Cds.Fields[0].AsString then
              begin
                 _iDiaSemanaLancto := x;
                 Break;
              end;
           end;
           _iDiasUteisLancto := _Cds.Fields[1].AsInteger;
        end;

        _Cds.Close;
      end;

      while not _DtmImpostoObj.CdsAcumula.Eof do
      begin
         //Lança o Documento
         _DtmImpostoObj.SQLDadosLancImp.Prepare;
         _DtmImpostoObj.SQLDadosLancImp.ParamByname('CODTIPOCUSTAGREG').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('CODTIPOCUSTAGREG').AsFloat;
         _DtmImpostoObj.SQLDadosLancImp.ParamByname('IDPESSOA').AsFloat         := fIdEmpresa;
         _DtmImpostoObj.SQLDadosLancImp.Open;

         _DtmImpostoObj.CdsDadosLancImp.First;
         if not _DtmImpostoObj.CdsDadosLancImp.IsEmpty then
         begin
            _ValorImposto := _DtmImpostoObj.CdsAcumula.FieldByName('VLRRETIDO').AsFloat;

            LancaDocumento;

            if _CodNewDoc > 0 then
            begin
               //Lança o Imposto Referente ao documento acima
               _DtmImpostoObj.SQLLancAcumula.Prepare;
               _DtmImpostoObj.SQLLancAcumula.ParamByName('IDIMPOSTORETIDO').AsFloat := GetSequence('IMPOSTORETIDO');
               _DtmImpostoObj.SQLLancAcumula.ParamByName('DATARETENCAO').AsDateTime := GetDataLancDocImposto(_DtmImpostoObj.CdsAcumula.FieldByName('DATARETENCAO').AsDateTime);
               _DtmImpostoObj.SQLLancAcumula.ParamByName('CODTIPOCUSTAGREG').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('CODTIPOCUSTAGREG').AsFloat;
               _DtmImpostoObj.SQLLancAcumula.ParamByName('VLRBASE').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('VLRBASE').AsFloat;
               _DtmImpostoObj.SQLLancAcumula.ParamByName('VLRRETIDO').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('VLRRETIDO').AsFloat;
               _DtmImpostoObj.SQLLancAcumula.ParamByName('IDFORCLI').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('IDFORCLI').AsFloat;
               _DtmImpostoObj.SQLLancAcumula.ParamByName('IDPESSOA').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('IDPESSOA').AsFloat;
               _DtmImpostoObj.SQLLancAcumula.ParamByName('CODDOCLANCADO').AsFloat := _CodNewDoc;

               //if fNumLote > 0.00 then
               if trunc(fNumLote) > 0 then // andre tavares 06/03/2006
                  _DtmImpostoObj.SQLLancAcumula.ParamByName('NUMLOTE').AsFloat := fNumLote
               else
                  _DtmImpostoObj.SQLLancAcumula.ParamByName('NUMLOTE').Clear;

               //if fNumLoteManual > 0.00 then
                if trunc(fNumLoteManual) > 0 then // andre tavares 06/03/2006
                  _DtmImpostoObj.SQLLancAcumula.ParamByName('NUMLOTEMANUAL').AsFloat := fNumLoteManual
               else
                  _DtmImpostoObj.SQLLancAcumula.ParamByName('NUMLOTEMANUAL').Clear;

               _DtmImpostoObj.SQLLancAcumula.ParamByName('RECPAG').AsString := fRecPag;
               _DtmImpostoObj.SQLLancAcumula.ParamByName('ALIQUOTA').AsFloat := _DtmImpostoObj.CdsAcumula.FieldByName('ALIQUOTA').AsFloat;


               if not ExecSql(_DtmImpostoObj.SQLLancAcumula.SQLChanged) then
                  Raise Exception.Create(MessageInfo);
            end;
         end;

         _DtmImpostoObj.CdsAcumula.Next;
      end;
   end;

   FechaQry([_DtmImpostoObj.CdsAcumula],False,True);
   _CodDocsAcumula := '';
end;




procedure TCtrlImpostoRetido.CancelaAcumulaImposto;
begin
   FechaQry([_DtmImpostoObj.CdsAcumula],false,True);
   _CodDocsAcumula := '';
end;




function TCtrlImpostoRetido.GetDataLancDocImposto(dData:TDateTime):TDateTime;
var
  iDiaSemanaData :Integer;
  DataFeriado :TDateTime;
  bExisteFeriado :Boolean;

  //  Rodolpho da Silva - P: 18397 - 22/03/2005
  cdsAux : TCMClientDataSet;
  sSQL   : string;
  //início - andre tavares - pendência 21219 - 06/02/2006
  cdsTipoAgre : TClientDataset;
  wdia, wmes, wano, wUltDia, wUltMes, wUltAno : word;
  iContaDiasUteis, idAgencia : integer;
  //fim - andre tavares - pendência 21219 - 06/02/2006
begin

   // Início - Rodolpho da Silva - P: 18397 - 22/03/2005
   try

      //início - andre tavares - pendência 21219 - 06/02/2006 - pega os parâmetros para lançamento do CPMF
      //inicio andre tavares - pendencia 21775 - adaptação para ser utilizado també na reprogramação da CPMF
      if (_CodTipoCustoAgreg = 0) {and (fCodDocumento <> 0)} then
      begin
        with TClientDataSet.Create(nil) do
        begin
          try
            if (fCodDocumento <> 0) then
              data := getDataPacket(' SELECT CODTIPOCUSTAGREG FROM IMPOSTORETIDO WHERE CODDOCLANCADO = '+ intToStr(fCodDocumento));

            if isEmpty then
              data := getDataPacket(' SELECT CODTIPOCUSTAGREG FROM IMPOSTORETIDO WHERE IDIMPOSTORETIDO = '+ intToStr(fidImpostoRetido));
            if isEmpty then
              data := getDataPacket(' SELECT CODTIPOCUSTAGREG FROM IMPOSTORETIDO WHERE CODLANCFINANC = '+ intToStr(fCodLancFinanc));

            _CodTipoCustoAgreg := fieldByName('CODTIPOCUSTAGREG').asInteger;
          finally
            free
          end;//try
        end;//with
      end;//if
      //fim andre tavares - pendencia 21775

      idAgencia := 0;
      with TClientDataSet.Create(nil) do
      begin
        try
          data := getDataPacket(' SELECT PC.IDAGENCIA FROM ENDPESS E, ESTADO ES, CIDADES C, '+
                                ' PORTADORCONTA PC, PORTADORFORMA PF '+
                                ' WHERE E.IDCIDADES     = C.IDCIDADES    AND '+
                                '       ES.IDESTADO     = C.IDESTADO     AND '+
                                '       E.IDPESSOA      = PC.IDAGENCIA   AND '+
                                '       PF.CODPORTADOR  = PC.CODPORTADOR AND '+
                                '       PF.CODPORTFORMA = ' + IntToStr(fCodPortForma));
          if not isEmpty then
            idAgencia := fieldByName('IDAGENCIA').asInteger
          else
            idAgencia := trunc(FIdEmpresa);
          finally
            free
          end;//try
        end;//with

     cdsTipoAgre := TClientDataset.Create(nil);

     //início - andre tavares - pendência 22316
     if fCodPortForma <> 0 then //para lançamento de documento de cpmf (depende do banco da conta de origem)
       // o campo FAIXATIPOAGREG.NUMDIASVENC é sobreposto pelo campo PORTADORCONTA.NUMDIASVENC se este for <> nulo
       cdsTipoAgre.Data := getDataPacket(' SELECT F.DATAINI, F.DATAFIM, F.NUMDIASAPURA, NVL(PC.NDIASAPURACPMF, F.NUMDIASVENC) AS NUMDIASVENC '+#13+
                                         ' FROM FAIXATIPOAGREG F, (SELECT MAX(DATAINI) AS DATAINI, MAX(DATAFIM) AS DATAFIM '+#13+
                                         '                         FROM FAIXATIPOAGREG WHERE CODTIPOCUSTAGREG =  ' + intToStr(_CodTipoCustoAgreg) + ') D, '+#13+
                                         '                        (SELECT NDIASAPURACPMF FROM PORTADORCONTA PC, PORTADORFORMA PF '+#13+
                                         '                         WHERE PC.CODPORTADOR = PF.CODPORTADOR AND '+#13+
                                         '                               PF.CODPORTFORMA = '+ IntToStr(fCodPortForma) +') PC '+#13+
                                         '                         WHERE F.CODTIPOCUSTAGREG = ' + intToStr(_CodTipoCustoAgreg)+#13+
                                         '                               AND NVL(F.DATAINI, TRUNC(SYSDATE)) = NVL(D.DATAINI, TRUNC(SYSDATE)) ')

     else if fcodPortConta <> 0 then //especificamente para CPMF de transferência de fundos entre contas  (depende do banco da conta de origem)
       cdsTipoAgre.Data := getDataPacket(' SELECT F.DATAINI, F.DATAFIM, F.NUMDIASAPURA, NVL(PC.NDIASAPURACPMF, F.NUMDIASVENC) AS NUMDIASVENC '+#13+
                                         ' FROM FAIXATIPOAGREG F, (SELECT MAX(DATAINI) AS DATAINI, MAX(DATAFIM) AS DATAFIM '+#13+
                                         '                         FROM FAIXATIPOAGREG WHERE CODTIPOCUSTAGREG =  (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC WHERE IDPESSOA = '+ FloatToStr(FIdEmpresa) + ' )  ) D, '+#13+
                                         '                        (SELECT NDIASAPURACPMF FROM PORTADORCONTA P '+#13+
                                         '                         WHERE P.CODPORTADOR = '+ IntToStr(fcodPortConta) +') PC '+#13+
                                         ' WHERE F.CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC WHERE IDPESSOA = '+ FloatToStr(FIdEmpresa) + ' ) '+ #13+
                                         '       AND NVL(F.DATAINI, TRUNC(SYSDATE)) = NVL(D.DATAINI, TRUNC(SYSDATE)) ');

     if cdsTipoAgre.IsEmpty then
       //se for outro imposto <> CPMF utiliza-se o campo FAIXATIPOAGREG.NUMDIASVENC  (não depende do banco da conta de origem)
       cdsTipoAgre.Data := getDataPacket(' SELECT F.DATAINI, F.DATAFIM, F.NUMDIASAPURA, F.NUMDIASVENC '+
                                         ' FROM FAIXATIPOAGREG F, (SELECT MAX(DATAINI) AS DATAINI, MAX(DATAFIM) AS DATAFIM '+
                                         '                         FROM FAIXATIPOAGREG WHERE CODTIPOCUSTAGREG = ' + intToStr(_CodTipoCustoAgreg) + ' ) D '+
                                         ' WHERE F.CODTIPOCUSTAGREG = ' + intToStr(_CodTipoCustoAgreg) +
                                         '       AND NVL(F.DATAINI, TRUNC(SYSDATE)) = NVL(D.DATAINI, TRUNC(SYSDATE)) ');

     //fim - andre tavares - pendência 22316

      // se parametrizado com número de dias para lançamento do documento de imposto (no caso do CPMF)
     if (cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger >= 0) and
       ( (trunc(dData )>= trunc(cdsTipoAgre.fieldByName('DATAINI').asDateTime)) or cdsTipoAgre.fieldByName('DATAINI').isNull ) and
       ( (trunc(dData )<= trunc(cdsTipoAgre.fieldByName('DATAFIM').asDateTime)) or cdsTipoAgre.fieldByName('DATAFIM').isNull )
         then
     begin
       decodeDate(dData, wano, wmes, wdia);
       decodeDate(_DiasUteis.UltDiaMes(wano, wmes), wUltAno, wUltMes, wUltDia);
       // se cai no 1º decêndio (ou número de dias especificado) ex.: dia 1º ao 10
       if ( trunc(dData) >= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) ) and
          ( trunc(dData) <= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger - 1)
       then begin
         dData := trunc(strToDate(cdsTipoAgre.fieldByName('NUMDIASAPURA').asString +'/' + intToStr(wmes)+ '/' +intToStr(wano)));
       end
       // se cai no 2º decêndio (ou número de dias especificado) ex.: dia 11 ao 20
       else if ( trunc(dData) > trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger - 1) and
               ( trunc(dData) <= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger * 2) - 1)
       then begin
         dData := trunc(strToDate(intToStr(30 - cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger) +'/' + intToStr(wmes)+ '/' +intToStr(wano)));
       end
       // se cai no 3º decêndio (ou número de dias especificado) ex.: dia 21 ao último dia do mês
       else if (cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger < wUltDia) and
               ( trunc(dData) > trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger * 2) - 1) and
               ( trunc(dData) <= trunc(_DiasUteis.UltDiaMes(wano, wmes)) )
       then begin
         dData := trunc(_DiasUteis.UltDiaMes(wano, wmes));
       end //senão se o período for > 30 dias
       else if ( trunc(dData) > (trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger * 2) -1) and
               ( trunc(dData) <= trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger * 3) - 1 )
       then begin
         dData := trunc(strToDate('1/'+ intToStr(wmes)+ '/' +intToStr(wano))) + (cdsTipoAgre.fieldByName('NUMDIASAPURA').asInteger * 3);
       end;

       //incluir os dias úteis para a dataProgramada
       iContaDiasUteis := 0;
       while iContaDiasUteis < cdsTipoAgre.fieldByName('NUMDIASVENC').asInteger do
       begin
         dData := dData + 1;
         if _DiasUteis.DiaUtil(idAgencia, dData, true, true, false) then
           inc(iContaDiasUteis);
       end;//while

       result := dData;
     end
     else begin //senão continua valendo a rotina anterior (abaixo) ***** Não será mais válido a partir de 1º março de 2006
      //fim - andre tavares - pendência 21219 - 06/02/2006

        cdsAux := TCMClientDataSet.Create(nil);
        sSQL := ' SELECT '                                   +
                '    E.IDCIDADES, '                          +
                '    ES.CODESTADO '                          +

                ' FROM '                                     +
                '    ENDPESS E, '                            +
                '    ESTADO ES, '                            +
                '    CIDADES C, '                            +
                '    PORTADORCONTA PC, '                     +
                '    PORTADORFORMA PF '                      +

                ' WHERE '                                    +
                '    E.IDCIDADES     = C.IDCIDADES    AND '  +
                '    ES.IDESTADO     = C.IDESTADO     AND '  +
                '    E.IDPESSOA      = PC.IDAGENCIA   AND '  +
                '    PF.CODPORTADOR  = PC.CODPORTADOR AND '  +
                '    PF.CODPORTFORMA = ' + IntToStr(fCodPortForma);

        cdsAux.Data := GetDataPacket(sSQL);
      // Fim    - Rodolpho da Silva - P: 18397 - 22/03/2005

        //  Se o cds trouxer registros...
        if not cdsAux.IsEmpty then
        begin
           //SE O NÚMERO DE DIAS ÚTEIS ENTRE A DATADOLANÇAMENTO E A "DATA do DIA DA SEMANA" do
           //LANCAMENTO FOR >= DIASUTEISLANCTO LANCA DOCUMENTO PARA A "DATA do DIA DA SEMANA"
           //SENAO LANÇA PARA "DATA do DIA DA SEMANA" + 7
           iDiaSemanaData := DayOfWeek(dData) - 1;

           if (_iDiaSemanaLancto - iDiaSemanaData) < _iDiasUteisLancto then
              Result := dData + (_iDiaSemanaLancto - iDiaSemanaData) + 7
           else
           begin
              Result  := dData + (_iDiaSemanaLancto - iDiaSemanaData);

              if (_DiasUteis.ContaDiasNaoUteis(dData,Result,cdsAux.FieldByName('IDCIDADES').AsInteger,
                                               _iCodPais,cdsAux.FieldByName('CODESTADO').AsString,True,True,False) > _iDiasUteisLancto) then
                 Result  := Result + 7;
           end;

           //SE A DATA RESULTANTE FOR UM FERIADO EXTRAORDINÁRIO CONSIDERA O PRIMEIRO DIA
           //ÚTIL POSTERIOR COMO DATA RESULTANTE
           //SE A DATA RESULTANTE FOR UM FERIADO NORMAL CONSIDERA O PRIMEIRO DIA
           //ÚTIL ANTERIOR COMO DATA RESULTANTE
           //O TESTE É PERSISTIDO ATÉ SE ENCONTRAR UMA DATA ÚTIL PARA O LANÇAMENTO

           DataFeriado := Result;
           bExisteFeriado := True;

           while bExisteFeriado do
           begin
             bExisteFeriado := False;

             if _DiasUteis.Feriado(DataFeriado,cdsAux.FieldByName('IDCIDADES').AsInteger,
                                   _iCodPais,cdsAux.FieldByName('CODESTADO').AsString,True,False) then
             begin

                DataFeriado := _DiasUteis.UltDiaUtilAnterior(DataFeriado,cdsAux.FieldByName('IDCIDADES').AsInteger,
                                                             _iCodPais,cdsAux.FieldByName('CODESTADO').AsString,True,False,False);
                bExisteFeriado := True;
             end
             else
             begin
                if _DiasUteis.Feriado(DataFeriado,cdsAux.FieldByName('IDCIDADES').AsInteger,
                                      _iCodPais,cdsAux.FieldByName('CODESTADO').AsString,True,True) then
                begin

                   DataFeriado := _DiasUteis.PrimeiroDiaUtilPosterior(DataFeriado,cdsAux.FieldByName('IDCIDADES').AsInteger,
                                                                      _iCodPais,cdsAux.FieldByName('CODESTADO').AsString,True,False,False);

                   bExisteFeriado := True;
                end;
             end;

             //(DataFeriado < dData)
             if ((DataFeriado - _iDiasUteisLancto) < dData) then DataFeriado := Result + 7;
           end;

           if (Result <> DataFeriado) then Result := DataFeriado;
        end

        //  Se por acaso, em alguma eventualidade o cds não trouxer registros,
        //  continua-se executando a rotina original...
        //  Fim    - Rodolpho da Silva - P: 18397 - 23/03/2005

         else
         begin
            //SE O NÚMERO DE DIAS ÚTEIS ENTRE A DATADOLANÇAMENTO E A "DATA do DIA DA SEMANA" do
            //LANCAMENTO FOR >= DIASUTEISLANCTO LANCA DOCUMENTO PARA A "DATA do DIA DA SEMANA"
            //SENAO LANÇA PARA "DATA do DIA DA SEMANA" + 7
            iDiaSemanaData := DayOfWeek(dData) - 1;

            if (_iDiaSemanaLancto - iDiaSemanaData) < _iDiasUteisLancto then
               Result := dData + (_iDiaSemanaLancto - iDiaSemanaData) + 7
            else
            begin
               Result  := dData + (_iDiaSemanaLancto - iDiaSemanaData);


               if (_DiasUteis.ContaDiasNaoUteis(dData,Result,_iCodCidade,_iCodPais,_sEstado,True,True,False) > _iDiasUteisLancto) then
                  Result  := Result + 7;
            end;



            //SE A DATA RESULTANTE FOR UM FERIADO EXTRAORDINÁRIO CONSIDERA O PRIMEIRO DIA
            //ÚTIL POSTERIOR COMO DATA RESULTANTE
            //SE A DATA RESULTANTE FOR UM FERIADO NORMAL CONSIDERA O PRIMEIRO DIA
            //ÚTIL ANTERIOR COMO DATA RESULTANTE
            //O TESTE É PERSISTIDO ATÉ SE ENCONTRAR UMA DATA ÚTIL PARA O LANÇAMENTO

            DataFeriado := Result;
            bExisteFeriado := True;

            while bExisteFeriado do
            begin
              bExisteFeriado := False;

              if _DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False) then
              begin
                 DataFeriado := _DiasUteis.UltDiaUtilAnterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
                 bExisteFeriado := True;
              end
              else
              begin
                 if _DiasUteis.Feriado(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,True) then
                 begin
                    DataFeriado := _DiasUteis.PrimeiroDiaUtilPosterior(DataFeriado,_iCodCidade,_iCodPais,_sEstado,True,False,False);
                    bExisteFeriado := True;
                 end;
              end;

              //(DataFeriado < dData)
              if ((DataFeriado - _iDiasUteisLancto) < dData) then DataFeriado := Result + 7;
            end;
            if (Result <> DataFeriado) then Result := DataFeriado;
         end;

     end;//else andre tavares - pendência 21219 - 06/02/2006

   // Início - Rodolpho da Silva - P: 18397 - 22/03/2005
   finally
      FreeAndNil(cdsAux);
      FreeAndNil(cdsTipoAgre); //andre tavares - pendência 21219 - 06/02/2006
   end;
   // Fim    - Rodolpho da Silva - P: 18397 - 22/03/2005
end;




procedure TCtrlImpostoRetido.SetRecPag(const Value: Char);
begin
  FRecPag := Value;

  if fRecPag = 'R' then
  begin
     _DtmImpostoObj.SQLDadosLancImp.Sql.Assign(_DtmImpostoObj.SQLDadosLancImpR.Sql);

     _DtmImpostoObj.SQLPortForma.Sql.Text  :=
                                          'SELECT ' +
                                          '  PF.IDFORCLI, ' +
                                          '  DC.CONTACCLIENTE AS CONTACONTABIL, ' +
                                          '  DC.CODCENTROCUSTO, ' +
                                          '  DC.CODSUBCONTA, ' +
                                          '  DC.UNIDNEGOC ' +
                                          'FROM ' +
                                          '  PORTADORFORMA PF, EMPRESACLIENTE DC ' +
                                          'WHERE ' +
                                          '  PF.CODPORTFORMA = :CODPORTFORMA AND ' +
                                          '  DC.IDPESSOA = :IDPESSOA AND ' +
                                          '  PF.IDFORCLI = DC.IDFORCLI ';

     _DtmImpostoObj.SQLClasFisCliFor.Sql.Text := 'SELECT IDCLASFISCLIFOR FROM CLIENTEPESS WHERE IDPESSOA = :IDPESSOA';

  end
  else
  begin
     _DtmImpostoObj.SQLDadosLancImp.Sql.Assign(_DtmImpostoObj.SQLDadosLancImpP.Sql);

     _DtmImpostoObj.SQLPortForma.Sql.Text  :=
                                          'SELECT ' +
                                          '  PF.IDFORCLI, ' +
                                          '  DC.CONTACFORN AS CONTACONTABIL, ' +
                                          '  DC.CODCENTROCUSTO, ' +
                                          '  DC.CODSUBCONTA, ' +
                                          '  DC.UNIDNEGOC ' +
                                          'FROM ' +
                                          '  PORTADORFORMA PF, EMPRESAFORN DC ' +
                                          'WHERE ' +
                                          '  PF.CODPORTFORMA = :CODPORTFORMA AND ' +
                                          '  DC.IDPESSOA = :IDPESSOA AND ' +
                                          '  PF.IDFORCLI = DC.IDFORCLI ';

     _DtmImpostoObj.SQLClasFisCliFor.Sql.Text := 'SELECT IDCLASFISCLIFOR FROM FORNSERV WHERE IDPESSOA =  :IDPESSOA';
  end;
end;



procedure TCtrlImpostoRetido.SetIdEmpresa(const Value: LongInt);
begin
  FIdEmpresa := Value;
end;




procedure TCtrlImpostoRetido.SetIdUsuario(const Value: LongInt);
begin
  FIdUsuario := Value;
end;




procedure TCtrlImpostoRetido.SetIdModulo(const Value: LongInt);
begin
  FIdModulo := Value;
end;




procedure TCtrlImpostoRetido.SetIdPlanoConta(const Value: LongInt);
begin
  FIdPlanoConta := Value;
end;




procedure TCtrlImpostoRetido.SetIntegraContab(const Value: Boolean);
begin
  FIntegraContab := Value;
end;




procedure TCtrlImpostoRetido.SetUsaPlanoPatro(const Value: Boolean);
begin
  FUsaPlanoPatro := Value;
end;




procedure TCtrlImpostoRetido.SetMascaraNoDocum(const Value: String);
begin
  FMascaraNoDocum := Value;
end;




procedure TCtrlImpostoRetido.SetPartidaDobrada(const Value: Boolean);
begin
  FPartidaDobrada := Value;
end;




{ DAVID - 27/01/2003 - Pendência 15975
  Função que indica se o tipo de imposto agregado passado como parâmetro
  é um imposto configurado nos parâmetros do IR como imposto de renda.}
function TCtrlImpostoRetido.ImpostoIRRF( iCodTipoCustAgreg : integer ) : boolean;
begin
  if _Cds.Active then _Cds.Close;

  _Cds.Data := GetDataPacket(
   ' select t.CODALTERADOR                                         ' +
   ' from   TIPOAGRE  t,                                           ' +
   '        PARAMIRRF p                                            ' +
   ' where  t.CODALTERADOR     = p.CODALTIRRFCAP                   ' +
   //DAVID - Pendência 16839
   '   and  t.CODTIPOCUSTAGREG = ' + IntToStr( iCodTipoCustAgreg ) );

  Result := ( not _Cds.IsEmpty );

  if _Cds.Active then _Cds.Close;
end;




//DAVID - Retenção de Imposto
function TCtrlImpostoRetido.RetemINSS( iCodTipoCustoAgreg, iIdForCli : integer; dData : TDateTime; var VlImposto : Double ) : boolean;
var
  CdsCfgINSS,
  cdsTetoINSS,
  cdsRetInssOutros,
  cdsRetAnteriores : TCMClientDataset;

  bExisteRetOutros : Boolean;

  VlTeto,
  VlAnterior,
  VlOutros,
  VlOutrosOri : Double;

  function Substitui( Str, SubStrOld, SubStrNew : String ) : String;
  var iPos : integer;
  begin
    Result := Str;
    while True do
    begin
      iPos := Pos( SubStrOld, Result );
      if iPos <= 0 then break;
      Result := Copy( Result, 1, iPos - 1 ) + SubStrNew +
                Copy( Result, iPos + length( SubStrOld ),
                length(Result) - length( SubStrOld ) - iPos + 1 );
    end;
  end;

  function ConverteVirgulaParaPonto( fNum : extended ) : String;
  begin
    Result := FloatToStr( fNum );
    Result := Substitui( Result, '.', '' );
    Result := Substitui( Result, ',', '.' );
  end;

begin
  Result := False;
  bExisteRetOutros  := False;
  CdsCfgINSS        := TCMClientDataset.Create( nil );
  cdsTetoINSS       := TCMClientDataset.Create( nil );
  cdsRetInssOutros  := TCMClientDataset.Create( nil );
  cdsRetAnteriores  := TCMClientDataset.Create( nil );
  try

    //Verifica se o imposto do INSS é agregado ao fornececedor
    CdsCfgINSS.Data := GetDataPacket(
     ' SELECT P.MOECODIGO                                           '   +
     ' FROM   PARAMIRRF    P,                                       '   +
     '        FORCLIXAGREG F                                        '   +
     ' WHERE  P.IDPESSOA         = F.IDPESSOA                       '   +
     '   AND  P.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG               '   +
     '   AND  P.IDPESSOA         = ' + IntToStr( FIdEmpresa )           +
     '   AND  F.IDFORCLI         = ' + IntToStr( iIdForCli )            +
     '   AND  P.CODTIPOCUSTAGREG = ' + IntToStr( iCodTipoCustoAgreg ) ) ;

    //Se estiver, executa o controle do INSS
    if not CdsCfgINSS.IsEmpty then
    begin

      //Recupera teto do INSS na tabela de cotação de moeda.
      cdsTetoINSS.Data := GetDataPacket(
       ' select COTVALOR                                                                        ' +
       ' from   COTACAOMOEDA                                                                    ' +
       ' where  MOECODIGO = ' + CdsCfgINSS.FieldByName('MOECODIGO').AsString                      +
       '   and  COTDATA   = ( select max( COTDATA )                                             ' +
       '                      from   COTACAOMOEDA                                               ' +
       '                      where  MOECODIGO = ' + CdsCfgINSS.FieldByName('MOECODIGO').AsString +
       '                        and  COTDATA   < to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ' ) ) ' );

      //Se não encontrar cotação para o teto, exibe mensagem de erro.
      if cdsTetoINSS.IsEmpty then
        raise Exception.Create('Não foi possível encontrar o teto do INSS.');

      //Se o teto for inválido (menor que 0), exibe mensagem de erro.
      if cdsTetoINSS.FieldByName('COTVALOR').AsInteger < 0 then
        raise Exception.Create('Teto do INSS inválido.');

      //Valor do teto
      VlTeto := cdsTetoINSS.FieldByName('COTVALOR').AsFloat;

      //Recupera o INSS retido em outras empresas no mês
      cdsRetInssOutros.Data := GetDataPacket(
       ' select VLRETIDO                                                         ' +
       ' from   RETINSSOUTROS                                                    ' +
       ' where  IDPESSOA  = ' + IntToStr( iIdForCli )                              +
       '   and  ANOMES    = ' + QuotedStr( FormatDateTime( 'yyyymm', dData ) ) );

      bExisteRetOutros := not cdsRetInssOutros.IsEmpty;

      //Recupera o valor retido em outras empresas até o momento
      if bExisteRetOutros then
        VlOutrosOri := cdsRetInssOutros.FieldByName('VLRETIDO').AsFloat
      else
        VlOutrosOri := 0;

      //Recupera o total retido neste mês até o momento
      CdsRetAnteriores.Data := GetDataPacket(
       ' select sum( VLRRETIDO ) as VLRRETIDO         ' +
       ' from   IMPOSTORETIDO                         ' +
       ' where  CODTIPOCUSTAGREG =                    ' + IntToStr( iCodTipoCustoAgreg )                  +
       '   and  IDFORCLI         =                    ' + IntToStr( iIdForCli )                           +
       '   and  to_char( DATARETENCAO, ''YYYYMM'' ) = ' + QuotedStr( FormatDateTime( 'YYYYMM', dData ) ) );

      //Valor já retido
      VlAnterior := CdsRetAnteriores.FieldByName('VLRRETIDO').AsFloat;

      VlOutros := VlOutrosOri;

      if not OnRetencaoINSS( iIdForCli,
                             dData,
                             VlTeto,
                             VlAnterior,
                             VlImposto,
                             VlOutros ) then
      begin
        Abort;
      end
      else
      begin
        //Se mudou o INSS retido em outras empresas, atualiza respectiva tabela
        if VlOutros <> VlOutrosOri then
        begin
          if bExisteRetOutros then       //Se já existe o registro...
          begin
            if VlOutros > 0 then
              ExecSQL(
               ' update RETINSSOUTROS ' +
               ' set    VLRETIDO =    ' + ConverteVirgulaParaPonto( VlOutros ) +
               ' where  IDPESSOA  =   ' + IntToStr( iIdForCli )  +
               '   and  ANOMES    =   ' + QuotedStr( FormatDateTime( 'YYYYMM', dData ) ) )
            else
              ExecSQL(
               ' delete from RETINSSOUTROS ' +
               ' where  IDPESSOA  =        ' + IntToStr( iIdForCli )  +
               '   and  ANOMES    =        ' + QuotedStr( FormatDateTime( 'YYYYMM', dData ) ) )
          end
          else
          begin                    //Se não existe...
            if VlOutros > 0 then
              ExecSQL(
               ' insert into RETINSSOUTROS ' +
               ' ( IDPESSOA,               ' +
               '   ANOMES,                 ' +
               '   VLRETIDO )              ' +
               ' values                    ' +
               '  ( ' + IntToStr( iIdForCli ) + ', ' +
               '    ' + QuotedStr( FormatDateTime( 'YYYYMM', dData ) ) + ', ' +
               '    ' + ConverteVirgulaParaPonto( VlOutros ) + ' ) ' );
          end;
        end;

        Result := True;
      end;

    end;

  finally
    CdsCfgINSS.Free;
    cdsTetoINSS.Free;
    cdsRetInssOutros.Free;
    cdsRetAnteriores.Free;
  end;

end;





function TCtrlImpostoRetido.ExcluiIntegracaoCPMFTransf(iCodDocumento: Int64): Boolean;
begin
   Result := ExecSql('UPDATE IMPOSTORETIDO '  +
                     'SET CODDOCUMENTO  = NULL, CODDOCLANCADO = NULL, FLGCONCILIADO = ''N'' '+
                     'WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento));
end;




function TCtrlImpostoRetido.IsCPMFTransf(iCodDocumento: Int64): Boolean;
begin
   if _Cds.Active then _Cds.Close;
   _Cds.Data := GetDataPacket(
     'SELECT * '  +
     'FROM IMPOSTORETIDO '+
     'WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento) + ' AND ' +
     '      CODTIPOCUSTAGREG = (SELECT CODTIPOCUSTAGREG FROM PARAMFINANC)');

    Result := ( not _Cds.IsEmpty );
end;


procedure TCtrlImpostoRetido.SetIdEspAcesso(const Value: LongInt);
begin
  FIdEspAcesso := Value;
end;



procedure TCtrlImpostoRetido.SetCodLancFinanc(const Value: LongInt);
begin
  FCodLancFinanc := Value;
end;


//andre tavares - 21735 - function para excluir somente um imposto em particular do documento
function TCtrlImpostoRetido.Excluir(CodDocumento, CodTipoCustAgreg: Int64): boolean;
var sSql : string;
    cdsAux : TclientDataset;
begin
  result := true;

  cdsAux := TclientDataset.Create(nil);
  try
    try
      sSql := ' DELETE FROM DOCXIMPOSTOACUM WHERE CODDOCUMENTO = '+ intToStr(CodDocumento) + ' AND CODTIPOCUSTAGREG = '+ intToStr(CodTipoCustAgreg);
      result := execSql(sSql);

      //sSql := ' DELETE FROM LANCIRRF WHERE (CODDOCUMENTO = ' + IntToStr(CodDocumento) + ')';
      //result := ExecSQL(sSql);

      sSql := ' DELETE FROM LANCIRRF L WHERE EXISTS (SELECT * FROM TIPRECDESXTIPAGRE T '+
              '                                       WHERE L.CODTIPRECDES = T.CODTIPRECDES AND '+
              '                                             T.CODTIPOCUSTAGREG = ' + intToStr(CodTipoCustAgreg) + ' AND '+
              '                                             L.CODDOCUMENTO = '+ intToStr(CodDocumento) +' ) ';
      result := ExecSQL(sSql);

      //limpa somente se for cpmf de transferência
      sSql := ' UPDATE IMPOSTORETIDO SET CODDOCUMENTO  = NULL, CODDOCLANCADO = NULL, FLGCONCILIADO = ''N'' '+
              ' WHERE CODDOCUMENTO = '+ intToStr(CodDocumento)+
              ' AND CODTIPOCUSTAGREG = ( SELECT CODTIPOCUSTAGREG FROM PARAMFINANC WHERE CODTIPOCUSTAGREG = ' + intToStr(CodTipoCustAgreg) + ') ';
      result := execSql(sSql);

     //busca o documento de imposto a ser excluído
     sSql := ' SELECT CODDOCUMENTO, CODDOCLANCADO, NUMLANCTO, PLNCODIGO FROM IMPOSTORETIDO WHERE CODDOCUMENTO = '+ intToStr(CodDocumento) +' AND CODTIPOCUSTAGREG = ' + intToStr(CodTipoCustAgreg);
     cdsAux.Data := GetDataPacket(sSql);

     //exclui o lançamento da impostoretido deste imposto do documento
     sSql := ' DELETE FROM IMPOSTORETIDO WHERE CODDOCUMENTO = '+ intToStr(CodDocumento) +' AND CODTIPOCUSTAGREG = ' + intToStr(CodTipoCustAgreg);
     result := ExecSQL(sSql);

     if cdsAux.FieldByName('CODDOCLANCADO').AsInteger > 0 then
     begin
       _CodNewDoc := cdsAux.FieldByName('CODDOCLANCADO').AsInteger;
       //exclui o documento de imposto, no caso só haverá um documento para este imposto.
       ExcluiDocLancados;
     end else
     begin
       //Verifica se o lançamento de origem é um alterador e procede com a exclusão do mesmo
       _CodNewDoc :=  CdsAux.FieldByName('CODDOCUMENTO').AsInteger;
       fNumLancto :=  CdsAux.FieldByName('NUMLANCTO').AsInteger;
       ExcluiAlteradoresLancados;
     end; //else

     //exclui a contabilização deste imposto
     if CdsAux.FieldByName('PLNCODIGO').AsInteger > 0 then
       _LancaContab.ExcluiLancaContab(FIdUsuario, CdsAux.FieldByName('PLNCODIGO').AsInteger, FIdModulo, 0, FUsaPlanoPatro, True);

    except
      result := false;
      Raise Exception.Create(MessageInfo);
    end;
  finally
    cdsAux.Free;
  end;
end;
//fim - andre tavares - 21735 - function para excluir somente um imposto em particular do documento

procedure TCtrlImpostoRetido.SetCodPortConta(const Value: longInt);
begin
  FCodPortConta := Value;
end;

end.

