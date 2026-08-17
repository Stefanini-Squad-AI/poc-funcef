unit uCtrlUtil;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 
Autor     :
Pendencia :
Descrição :
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 18883
Data.....: 27/03/2006
Rotina...: GravaLogTOTALPREV
Descrição: Gravar até 200 posições no campo DESCOPERACAO da tabela LOGTOTALPREV.
---------------------------------------------------------------------------------------------------}

interface

uses
  SysUtils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DBClient;


  Type
    TCtrlUtil = class(TCmControlObject)

    private

    protected

      procedure DoChangeDataBase; override;


    public

      constructor Create; override;
      destructor Destroy; override;

      function ListTipoDesemb : OleVariant;
      function ListFormaPagto : OleVariant;
      function ListTipoDoc    : OleVariant;


      function DadosDocumento(const piCodDocumento: Integer)      : OleVariant;
      function DadosLanctoDocum(const piCodDocumento: Integer)    : OleVariant;
      function DadosRateioDocum(const piCodDocumento: Integer)    : OleVariant;
      function DadosCCBaixaXDocum(const piCodDocumento: Integer)  : OleVariant;

      function GravaLogTOTALPREV (psDescOperacao : string ) : boolean; 


    end;




implementation
{ TCtrlUtil }
uses
  dBaseDados;




constructor TCtrlUtil.Create;
begin
  inherited;
end;

destructor TCtrlUtil.Destroy;
begin
  inherited;
end;

procedure TCtrlUtil.DoChangeDataBase;
begin
  inherited;
end;



function TCtrlUtil.GravaLogTOTALPREV (psDescOperacao : string ) : boolean;
var
  iIdLogTotalPREV : longint;
begin
  Result := False;

  iIdLogTotalPREV := LeUltRegistro(nil, 'LOGTOTALPREV');

  if Trim(psDescOperacao) = '' then psDescOperacao := 'Não Identificada';
  with dtmBaseDados.qry do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO LOGTOTALPREV (IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA) '+
            ' VALUES ('+IntToStr(iIdLogTotalPREV)+','+
                        IntToStr(Sistema.IdModulo)+','+
                        ''''+Copy(psDescOperacao,1,200)+''','+
                        IntToStr(Sistema.IdUsuario)+', '+
                        ' SYSDATE )');
    try
      ExecSQL;
    except
      Exit;
    end;
  end;
  Result := True;
end;



function TCtrlUtil.ListFormaPagto: OleVariant;
var
 sSQL : string;
begin
  sSQL :=
  'SELECT '                                                   + #13 +
  '  CODFORMA, DESCRICAO '                                    + #13 +
  'FROM '                                                     + #13 +
  '  FORMARECPAG '                                            + #13 +
  'WHERE '                                                    + #13 +
  '      IDPESSOA = ' + FormatFloat('#0', Sistema.IDEmpresa)  + #13 +
  '  AND RECPAG   = ''P'' '                                   + #13 +
  'ORDER BY '                                                 + #13 +
  '  DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;



function TCtrlUtil.ListTipoDesemb: OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                                                   + #13 +
  '  CODTIPRECDES, DESCRICAO '                                + #13 +
  'FROM '                                                     + #13 +
  '  TIPORECEBDESEMB '                                        + #13 +
  'WHERE '                                                    + #13 +
  '      IDPESSOA = ' + FormatFloat('#0', Sistema.IDEmpresa)  + #13 +
  '  AND RECPAG   = ''P'' '                                   + #13 +
  '  AND ANASINT  = ''A'' '                                   + #13 +
  '  AND ATIVO    = ''S'' '                                   + #13 +
  'ORDER BY '                                                 + #13 +
  '  DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;



function TCtrlUtil.ListTipoDoc: OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                   + #13 +
  '  CODTIPDOC, DESCRICAO '   + #13 +
  'FROM '                     + #13 +
  '  TIPODOCRECPAG '          + #13 +
  'WHERE '                    + #13 +
  '      DEBCRE = ''C'' '     + #13 +
  '  AND RECPAG = ''P'' '     + #13 +
  'ORDER BY '                 + #13 +
  '  DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;



function TCtrlUtil.DadosDocumento(const piCodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                                                                                         + #13 +
  '  DOC.CODDOCUMENTO,      DOC.IDPESSOA,           DOC.IDCBANCARIA,        DOC.UNIDNEGOC, '        + #13 +
  '  DOC.CODFORMA,          DOC.CODPORTFORMA,       DOC.INDICECORRECAO,     DOC.CODSUBCONTA, '      + #13 +
  '  DOC.PLANO,             DOC.PLACONTA,           DOC.MOECODIGO,          DOC.IDEMPRESA, '        + #13 +
  '  DOC.CODCENTROCUSTO,    DOC.IDFORCLI,           DOC.IDMODULO,           DOC.CODTIPDOC, '        + #13 +
  '  DOC.RECPAG,            DOC.NODOCUMENTO,        DOC.COMPLDOCUMENTO,     DOC.DATAEMISSAO, '      + #13 +
  '  DOC.DATAVENCTO,        DOC.DATAPROGRAMADA,     DOC.STATUS,             DOC.NUMFATURA, '        + #13 +
  '  DOC.OPERACAO,          DOC.IDUSUARIOINCLUSAO,  DOC.NUMSLIP,            DOC.EMISBLOQ, '         + #13 +
  '  DOC.DATALIMITE,        DOC.VALORDESCONTO,      DOC.NOSSONUMERO,        DOC.VALORJUROS, '       + #13 +
  '  DOC.LOTETRANSMISSAO,   DOC.CONTROLEREMESSA,    DOC.DATAREMESSA,        DOC.VLRMULTA, '         + #13 +
  '  DOC.CODGRUPOCNAB,      DOC.NUMAPGR,            DOC.NUMLEITCODBARRAS,   DOC.NUMDIGCODBARRAS, '  + #13 +
  '  DOC.FLGEMITELANCBAIX,  DOC.DATACORRECAO,       DOC.PERCJUROSATUARIAL,  DOC.PERCJUROSSIMPLES, ' + #13 +
  '  DOC.REFERENCIA,        DOC.OBS,                DOC.FLGCONFIRMARECPAG,  DOC.NUMCPBAIXA, '       + #13 +
  '  DOC.GRUPODOC,          DOC.FLGNAOCONCILIADO,   DOC.CODGERADORINSS, '                           + #13 +
  '  DOC.FLGTIPODOCUMENTO,  DOC.DATADISPONIB,       DOC.IDSEGREGACRITER, '                          + #13 +
  '  DOC.IDPROCESSO,        DOC.FLGCONTAINVEST,     DOC.FLGIMPORTADO,       DOC.PLACONTAANT '       + #13 +
  'FROM '                                                                                           + #13 +
  '  DOCUMENTO DOC '                                                                                + #13 +
  'WHERE '                                                                                          + #13 +
  '  DOC.CODDOCUMENTO = ' + FormatFloat('#0', piCodDocumento);

  Result := GetDataPacket(sSQL);
end;



function TCtrlUtil.DadosLanctoDocum(const piCodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                                                                                         + #13 +
  '  LDC.CODDOCUMENTO,     LDC.NUMLANCTO,        LDC.CODALTERADOR,     LDC.CODDOCINSS, '            + #13 +
  '  LDC.UNIDNEGOC,        LDC.IDPESSOA,         LDC.IDNFLIVRO,        LDC.CODTIPDOC, '             + #13 +
  '  LDC.PLNCODIGO,        LDC.DATALANCTO,       LDC.VALOR,            LDC.VALOROUTRAMOEDA, '       + #13 +
  '  LDC.DEBCRE,           LDC.OPERACAO,         LDC.HISTORICOCOMPL,   LDC.IDUSUARIOINCLUSAO, '     + #13 +
  '  LDC.ESTORNO,          LDC.LOTETRANSMISSAO,  LDC.NUMFATURA,        LDC.FLGTIPOFATURA, '         + #13 +
  '  LDC.FLGFATEMITIDA,    LDC.VLRLIQUIDO,       LDC.NUMRECIBO,        LDC.NUMLOTEMANUAL, '         + #13 +
  '  LDC.NUMNF,            LDC.FLGRECEBEUNF, '                                                      + #13 +
  '  LDC.IDAPURACAOPIS,    LDC.IDMOTIVOCANCFAT,  LDC.FLGLANCBAIXAADTO, LDC.FLGLANCBAIXA, '          + #13 +
  '  LDC.FLGCONTABILIZA,   LDC.IDLOTEEXPORTACTB, LDC.PLNANTECIPA '                                  + #13 +
  'FROM '                                                                                           + #13 +
  '  LANCTODOCUM LDC '                                                                              + #13 +
  'WHERE '                                                                                          + #13 +
  '  LDC.CODDOCUMENTO = ' + FormatFloat('#0', piCodDocumento);

  Result := GetDataPacket(sSQL);
end;



function TCtrlUtil.DadosRateioDocum(const piCodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                                                                                         + #13 +
  '  RDC.CODDOCUMENTO,     RDC.IDRATEIODOCUM,    RDC.IDPROCESSO,        RDC.IDPLANOPREV, '          + #13 +
  '  RDC.CODTIPRECDES,     RDC.IDPATRO,          RDC.PLANO,             RDC.IDEMPRESA, '            + #13 +
  '  RDC.IDPROGRAMA,       RDC.CODCENTROCUSTO,   RDC.RECPAG,            RDC.IDPESSOA, '             + #13 +
  '  RDC.CODCENTRORESPON,  RDC.UNIDNEGOC,        RDC.MOECODIGO,         RDC.IDRESERVAORCAMEN, '     + #13 +
  '  RDC.VALOR,            RDC.VALOROUTRAMOEDA,  RDC.IDUSUARIOINCLUSAO, RDC.LOTETRANSMISSAO, '      + #13 +
  '  RDC.NUMIMOVEL,        RDC.VLRRESORCAMEN, '                                                     + #13 +
  '  RDC.IDSEGREGACONTR,   RDC.IDPLANOVIRTUAL '                                                     + #13 +
  'FROM '                                                                                           + #13 +
  '  RATEIODOCUM RDC '                                                                              + #13 +
  'WHERE '                                                                                          + #13 +
  '  RDC.CODDOCUMENTO = ' + FormatFloat('#0', piCodDocumento);

  Result := GetDataPacket(sSQL);
end;



function TCtrlUtil.DadosCCBaixaXDocum(const piCodDocumento: Integer): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
  'SELECT '                                                                                 + #13 +
  '  CCB.IDCCBAIXASXDOCUM, CCB.IDPATRO,          CCB.UNIDNEGOC,        CCB.IDPLANOPREV, '   + #13 +
  '  CCB.IDPESSOA,         CCB.CODDOCUMENTO,     CCB.IDSEGREGACRITER,  CCB.PLANO, '         + #13 +
  '  CCB.PLACONTA,         CCB.VALOR '                                                      + #13 +
  'FROM '                                                                                   + #13 +
  '  CCBAIXASXDOCUM CCB '                                                                   + #13 +
  'WHERE '                                                                                  + #13 +
  '  CCB.CODDOCUMENTO = ' + FormatFloat('#0', piCodDocumento);

  Result := GetDataPacket(sSQL);
end;



end.
