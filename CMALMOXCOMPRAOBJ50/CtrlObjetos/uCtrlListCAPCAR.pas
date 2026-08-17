{--------------------------------------------------------------------------------------
autor    : Antonio Marcos (amf)
data     : 14.08.2007
pendência: 26047
descrição: Overload da função ListaTipoDoc.
----------------------------------------------------------------------------------------
//Atualizado: André Tavares - 18/11/2003 - pendência 15623 - coloquei o campo IDCBANCARIA
//          : Andre Tavares - 26/02/2004 - pendência 15703 - inclusão do filtro ATIVO }

unit uCtrlListCAPCAR;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils;

Type
  { tasSoSintetica => Somente Sinteticos
    tasSoAnalitica    => Somente Analiticos
    tascAmbos => Todos   }
  TTipoAnaSint = (tasSoSintetica,tasSoAnalitica,tasAmbos);
  { tdcSoDebito => Somente Sinteticos
    tdcSoCredito    => Somente Analiticos
    tdcAmbos => Todos    }
  TTipoDebCre = (tdcSoDebito,tdcSoCredito,tdcAmbos);
  { toCodigo  => Ordernar  por codigo
    toNome    => Ordernar  por nome  }
  TTipoOrdemCP  = (tocpCodigo, tocpNome);

  TCtrlListCAPCAR = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      Function ListaTipoDoc(sRecPag : String; bSoRecPag : Boolean): OleVariant; overload;

      function ListaTipoDoc: OleVariant; overload;

      Function ListaTipoRecebDesemb(sRecPag : String; idEmpresa : Double; TipoAnaSint : TTipoAnaSint; TipoOrdemCP : TTipoOrdemCP ) : OleVariant;
      Function ListaPortadorForma(sRecPag : String; idEmpresa : Double) : OleVariant;
      Function ListaFormaRecPag(sRecPag : String; idEmpresa : Double) : OleVariant;
      Function ListaTipoAlterador(sRecPag : String; idEmpresa : Double; TipoDebCre : TTipoDebCre) : OleVariant;
      Function ListaDadosCliente(idEmpresa, idCliente : Double; sCodCliente : String;bUsaCorporativo : Boolean) : OleVariant;
      Function ListaDadosForn(idEmpresa, idForn : Double) : OleVariant;
  end;

implementation


procedure TCtrlListCAPCAR.DoChangeDataBase;
begin
  inherited;
  //
end;

constructor TCtrlListCAPCAR.Create;
begin
  inherited;
  //
end;

destructor TCtrlListCAPCAR.Destroy;
begin
  inherited;
  //
end;


function TCtrlListCAPCAR.ListaPortadorForma(sRecPag: String;
  idEmpresa: Double): OleVariant;
var sSql : String;
begin
  sSql := 'SELECT CODPORTFORMA, DESCRICAO '+
          'FROM PORTADORFORMA '+
          'WHERE (RECPAG = '''+sRecPag+''')'+
          '  AND (IDPESSOA = '+FloatToStr(idEmpresa)+') '+
          'ORDER BY DESCRICAO ';
  Result := GetDataPacket(sSql);
end;

function TCtrlListCAPCAR.ListaTipoDoc(sRecPag: String; bSoRecPag : Boolean): OleVariant;
var sSql : String;
begin
  sSql := 'SELECT DEBCRE, CODTIPDOC, DESCRICAO '+
          'FROM TIPODOCRECPAG '+
          'WHERE (RECPAG = '''+sRecPag+''')';
  if bSoRecPag then begin
     if sRecPag = 'R' then
        sSql := sSql + '  AND (DEBCRE = ''D'') '
     else
        sSql := sSql + '  AND (DEBCRE = ''C'') ';
  end;
  if sRecPag = 'R' then
     sSql := sSql + 'ORDER BY DEBCRE DESC, DESCRICAO '
  else
     sSql := sSql + 'ORDER BY DEBCRE, DESCRICAO ';

  Result := GetDataPacket(sSql);
end;

function TCtrlListCAPCAR.ListaTipoRecebDesemb(sRecPag: String;
  idEmpresa: Double; TipoAnaSint: TTipoAnaSint;
  TipoOrdemCP: TTipoOrdemCP): OleVariant;
var sSql : String;
begin
  sSql := 'SELECT CODTIPRECDES, DESCRICAO, ANASINT, RECPAG, FLGOBRIGARESERVA '+
          'FROM TIPORECEBDESEMB '+
          'WHERE (RECPAG = '''+sRecPag+''') '+
          '  AND (IDPESSOA = '+FloatToStr(idEmpresa)+') '+
          '  AND (ATIVO = ''S'') '
          ;
  case TipoAnaSint of
     tasSoSintetica : sSql := sSql +'  AND (ANASINT = ''S'') ';
     tasSoAnalitica : sSql := sSql +'  AND (ANASINT = ''A'') ';
  end;
  case TipoOrdemCP of
     tocpCodigo : sSql := sSql +'ORDER BY CODTIPRECDES ';
     tocpNome   : sSql := sSql +'ORDER BY DESCRICAO ';
  end;
  Result := GetDataPacket(sSql);

end;

function TCtrlListCAPCAR.ListaTipoAlterador(sRecPag: String;
  idEmpresa: Double; TipoDebCre: TTipoDebCre): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT CODALTERADOR, IDPESSOA, IDEMPRESA, PLANO, CODCENTROCUSTO, '+
           '       PLACONTA, RECPAG, DESCRICAO, ACRESDECRES, CONVERTE,       '+
           '       IDUSUARIOINCLUSAO, CODSUBCONTA, FLGCALCULAIMPOSTO,        '+
           '       FLGAGREGABAIXA, FLGAGREGASALDO, CODCORRESP,               '+
           '       CODNATUREZA '+
           'FROM TIPOALTERADOR  '+
           'WHERE (RECPAG = '''+sRecPag+''') '+
           '  AND (IDPESSOA = '+FloatToStr(idEmpresa)+') ';
   case TipoDebCre of
      tdcSoDebito  : sSql := sSql +'  AND (ACRESDECRES = ''D'') ';
      tdcSoCredito : sSql := sSql +'  AND (ACRESDECRES = ''C'') ';
   end;
   sSql := sSql +'ORDER BY DESCRICAO ';
   Result := GetDataPacket(sSql);
end;

function TCtrlListCAPCAR.ListaDadosCliente(idEmpresa,
  idCliente: Double; sCodCliente : String;bUsaCorporativo : Boolean): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT E.PLANO, E.CODSUBCONTA,E.CONTACCLIENTE, E.UNIDNEGOC, '+
           '       E.CONTACRECEITA,E.CODCENTROCUSTO,P.RAZAOSOCIAL, '+
           '       P.NUMDOCUMENTO,P.IDDOCUMENTO,D.NOMEDOCUMENTO,   '+
           '       E.PERCCOMISCARTAO, E.PRAZOCARTAO, E.IDFORCLI,E.FLGSITCREDITO, '+
           '       C.CODCLIENTE, E.CODCORRESPEMPRESA '+
           'FROM PESSOA P, TIPODOCPESSOA D,CLIENTEPESS C, EMPRESACLIENTE E '+
           'WHERE (P.IDDOCUMENTO = D.IDDOCUMENTO(+))    '+
           '  AND (P.IDPESSOA = E.IDFORCLI)             '+
           '  AND (P.IDPESSOA = C.IDPESSOA)             '+
           '  AND (E.IDPESSOA = '+FloatToStr(idEmpresa)+')';
   if idCliente <> 0 then
      sSql := sSql +'  AND (P.IDPESSOA = '+FloatToStr(idCliente)+') ';
   if (sCodCliente <> '') and (bUsaCorporativo) then
      sSql := sSql +'  AND (C.CODCLIENTE = '''+sCodCliente+''') ';
   if (sCodCliente <> '') and (not bUsaCorporativo) then
      sSql := sSql +'  AND (E.CODCORRESPEMPRESA = '''+sCodCliente+''') ';
   Result := GetDataPacket(sSql);
end;

function TCtrlListCAPCAR.ListaFormaRecPag(sRecPag: String;
  idEmpresa: Double): OleVariant;
var sSql : String;
begin
  sSql := 'SELECT CODFORMA, DESCRICAO, RECPAG '+
          'FROM FORMARECPAG '+
          'WHERE (RECPAG = '''+sRecPag+''')'+
          '  AND (IDPESSOA = '+FloatToStr(idEmpresa)+') '+
          'ORDER BY DESCRICAO ';
  Result := GetDataPacket(sSql);
end;

function TCtrlListCAPCAR.ListaDadosForn(idEmpresa,
  idForn: Double): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT E.PLANO, E.CODSUBCONTA,E.CONTACDESPESA, E.UNIDNEGOC, '+
           '       E.CONTACFORN,E.CODCENTROCUSTO,P.RAZAOSOCIAL,P.NOME, '+
           '       P.NUMDOCUMENTO,P.IDDOCUMENTO,D.NOMEDOCUMENTO,   '+
           '       E.IDFORCLI, NVL(CB.IDCBANCARIA, 0) AS IDCBANCARIA '+
           'FROM PESSOA P, TIPODOCPESSOA D,FORNSERV F, EMPRESAFORN E, CONTABANCARIA CB '+
           'WHERE (P.IDDOCUMENTO = D.IDDOCUMENTO(+))    '+
           '  AND (P.IDPESSOA = E.IDFORCLI)             '+
           '  AND (P.IDPESSOA = F.IDPESSOA)             '+
           '  AND (E.IDPESSOA = '+FloatToStr(idEmpresa)+')'+
           '  AND (CB.IDPESSOA(+) = P.IDPESSOA) '+
           '  AND (CB.FLGCONTAPREF(+) = 1) ';
   if idForn <> 0 then
      sSql := sSql +'  AND (P.IDPESSOA = '+FloatToStr(idForn)+') ';
   Result := GetDataPacket(sSql);
end;

function TCtrlListCAPCAR.ListaTipoDoc: OleVariant;
var sSql : String;
begin
  sSql := 'SELECT DEBCRE, CODTIPDOC, DESCRICAO '+
          'FROM TIPODOCRECPAG ' +
          'ORDER BY DEBCRE, DESCRICAO ';

  Result := GetDataPacket(sSql);
end;

end.


