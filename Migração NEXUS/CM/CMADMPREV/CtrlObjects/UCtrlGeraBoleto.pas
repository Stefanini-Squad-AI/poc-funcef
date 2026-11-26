unit UCtrlGeraBoleto;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
{--------------------------------------------------------------------------------------------------
Atender   : WO16145
Data      : 19/12/2024
Autor     : Arnaldo V. Scarin
Descrição : Correção do FatorVencimento, que a partir de 22/02/2025 será reiniciado em 1000, por conta
            do Codigo exceder 9999
--------------------------------------------------------------------------------------------------}
{ ------------------------------------------------------------------------------------
Alterações  : criação do ctrl
Pendência   : SIG33744
Responsável : Edilaine
Data MERGE  : 05/07/2022
Data        : 27/07/2018
Descrição   : impressao de documentos no controle de divida de beneficio
--------------------------------------------------------------------------------------}

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, DbClient, uCMTypes, uCMClientDataSet,
     Classes, USistema, Wwquery, uString, JclDateTime, uCMFileUtils;


Type
  TCtrlGeraBoleto = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    Fcds : TClientDataSet;
    FcdsDados : TCMClientDataSet;

    iDigito11: Longint;

    _cdsPortForma    : TCMClientDataSet;
    _cdsModelo       : TCMClientDataSet;
    _cdsBloquete     : TCMClientDataSet;
    _cdsDadosCedente : TCMClientDataSet;

    Procedure Setcds(Const Value: TClientDataSet);
    procedure SetcdsDados(const Value : TCMClientDataSet);

    procedure CdsDadosCalcFields;
    procedure EditaNossoNumeroCaixa;
    procedure CarregaEstruturaDados;
    procedure GetModelo(iIdModelo : integer);

    function  ObtemMatricula(idPessoa : Integer; bTitular : boolean = false) : String;
    function  CalculaModulo11(sNossoNumero: String; RestoZero : Boolean; Base : Integer): String;
    function  CalculaDacNN(sNossoNumero: String; iModulo: Integer): String;
    function  CalculaDac(sNum: String; iModulo : integer): Integer;
    function  CalculaDigd: String;
    function  MontaCampoLivreCaixa(sCodCedente, sNossoNumero: string): string;
    function  MontaCampoLivre : String;
    function  MontaBarras(bCodBarras: Boolean): String;
    function  MontaBarrasCEFSigcb(bCodBarra: Boolean): String;
    function  RemoveAllChar(S: String): String;
    function  GetNossoNumero(const icodportforma: integer; TamNossoNumero : integer): Extended;
    function  GetDadosDocumento(sCodDocumento, sCampo : string) : string;   overload;
    function  GetDadosCedente : OleVariant;
    function  GeraNossoNumero(pCodPortForma, iTamNossoNumero : integer) : string;
    function  NossoNumeroIsEmpty(sNossoNumero: String): Boolean;

    Function GetDocsEmissao(const idpessoa: int64; const idusuario: int64; const pemisbloq: string;
                            const idmodulo: int64 = 0;
                            const pcontroleremessa: int64 = 0;
                            const pcodportforma: int64 = 0;
                            const idtipocliente: int64 = 0;
                            const bUsuarioLogado: boolean = false;
                            const codtipdoc: int64 = 0;
                            const coddocumento: integer = 0;
                            dataprogramadaini: string = '';
                            dataprogramadafim: string = ''): olevariant;

  public
    Property cds : TClientDataSet read Fcds write Setcds;
    Property cdsDados : TCMClientDataSet read FcdsDados write SetcdsDados;

    Constructor Create; override;
    Destructor  Destroy; override;

    function AtualizaEmissaoDocumento(_CODDOCUMENTO : string) : Boolean;

    //function PreparaDados(iIdModeloCobranca : integer; qryDocs: TwwQuery; var lstSqlUpdate : TStringList) : boolean;
    function PreparaDados(iIdModeloCobranca : integer;
                          pCodDivida    : string;
                          pCodDocumento : String;
                          var lstSqlUpdate : TStringList;
                          pCodPortForma : String = '-1';
                          pNossoNumero  : string = '-1';
                          pCodTipDoc    : string = '-1'
                          ) : boolean;


end;


implementation

{ TCtrlGeraBoleto }


procedure TCtrlGeraBoleto.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlGeraBoleto.Create;
begin
  inherited;

  _cdsPortForma    := TCMClientDataSet.create(nil);
  _cdsBloquete     := TCMClientDataSet.create(nil);
  _cdsDadosCedente := TCMClientDataSet.create(nil);
  _cdsModelo       := TCMClientDataSet.create(nil);
  
  FCds      := TClientDataSet.Create(nil);
  FcdsDados := TCMClientDataSet.create(nil);
end;

destructor TCtrlGeraBoleto.Destroy;
begin
  inherited;
  if isAppServer then FCds.Free;
  if isAppServer then FcdsDados.free;

  FreeAndNil(_cdsPortForma);
  FreeAndNil(_cdsBloquete);
  FreeAndNil(_cdsDadosCedente);
  FreeAndNil(_cdsModelo);
end;

procedure TCtrlGeraBoleto.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlGeraBoleto.OnCreateAppServer;
begin
  inherited;
end;


procedure TCtrlGeraBoleto.CarregaEstruturaDados;
var
  SqlDados : TStringList;
begin
  SqlDados := TStringList.create;

  try
    with SqlDados do
    begin
      Clear;
      Append('SELECT ');
      Append('  PF.CODPORTFORMA,     ');
      Append('  PF.DESCRICAO,        ');
      Append('  PF.CODBLOQCHE,       ');
      Append('  PF.CODARQUIVOREMESSA,');
      Append('  PF.NOSSONUMERO,      ');
      Append('  PF.JUROSPORDIA,      ');
      Append('  PF.PRAZOPROTESTO,    ');
      Append('  PF.NUMEMPRESABANCO,  ');
      Append('  PF.CONTROLEREMESSA,  ');
      Append('  PF.PATHARQUIVOREM,   ');
      Append('  PF.IDCONFIGBARRAS    ');
      Append('From                   ');
      Append('  PORTADORFORMA PF     ');
    end;
    _cdsPortForma.Data := GetDataPacket( SqlDados );

    with SqlDados do
    begin
      Clear;
      Append('SELECT ');
      Append('  E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO,  ');
      Append('  E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, P.NUMDOCUMENTO, ');
      Append('  P.IDPESSOA, ');
      Append('  PF.EMAILFUNCEF, ');
      Append('  ''                '' AS MATRICULA, ');
      Append('  ''                '' AS MATR_TITULAR, ');
      Append('  P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, ');
      Append('  D.CODPORTFORMA, D.DATAVENCTO, D.DATAREMESSA, D.EMISBLOQ, D.STATUS, ');
      Append('  D.DATAEMISSAO, D.DATAEMISSAO AS DATADOCUMENTO, D.NODOCUMENTO, M.MOESIGLA, D.CODDOCUMENTO, P.TIPO, D.NOSSONUMERO, ');
      Append('  D.COMPLDOCUMENTO, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA, F.JUROSPORDIA AS VALORJUROS, ');
      Append('  (''01234567890123456789012345678901234567890123'') AS CODBARRA, (0) As rSaldo, (0) As rSaldoOutraMoeda, ');
      Append('  (''00186.99595  90309.403922  00152.059168                                      000'') AS CODBARRADIG, ('' '') AS FLGGRUPO, ');
      Append('  (''01234567890123456789012345678901234567890123'') AS AGENCIACODCEDENTE, ');
      Append('  (''00000-00'') AS NUMEMPRESABANCO, AB.NUMAGENCIA as AGENCIACONVENIO, ');
      Append('  D.IDMODULO, ');
      Append('  ''                    '' AS NUMDOCUMENTO_CEDENTE,  ');
      Append('  '' FUNCEF - FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS '' AS RAZAOSOCIAL_CEDENTE, ');
      Append('  '' SCN - Q. 02 - Bl. A - 12º e 13º andares. Ed. Corporate Financial Center 70712-900 - Brasília - DF Telefone Geral: (61) 3329-1700 '' AS ENDERECO_CEDENTE, ');
      Append('  0 AS CODIGODIVIDA ');
      Append('FROM ');
      Append('  ENDPESS E, CIDADES C, ESTADO ES,  ');
      Append('  PESSOA P, ');
      Append('  PESSOAFISICA PF, ');
      Append('  DOCUMENTO D, ');
      Append('  PORTADORFORMA F , ');
      Append('  MOEDA M, ');
      Append('  AGENCIABANCARIA AB, ');
      Append('  PORTADORCONTA PC ');
      Append('WHERE 1=2  ');
    end;

    FcdsDados.Data := GetDataPacket( SqlDados );

  finally
    FreeAndNil(SqlDados);
  end;
end;

function TCtrlGeraBoleto.GetDocsEmissao(const idpessoa: int64;
                                        const idusuario: int64;
                                        const pemisbloq: string;
                                        const idmodulo: int64 = 0;
                                        const pcontroleremessa: int64 = 0;
                                        const pcodportforma: int64 = 0;
                                        const idtipocliente: int64 = 0;
                                        const bUsuarioLogado: boolean = false;
                                        const codtipdoc: int64 = 0;
                                        const coddocumento: integer = 0;
                                        dataprogramadaini: string = '';
                                        dataprogramadafim: string = '') : olevariant;

var cds, cdsaux: TClientDataset;
    sSql : string;
    dias : Real;
    Data : TDateTime;
    cont : Integer;

    function fct_sql(bPeriodo:Boolean; sData:string): string;

    begin
       if idtipocliente = 0 then
       begin
         sSql := ' SELECT /*+RULE*/  '+#13+ // Edilaine - SOL 178674 / KTN 1726751
                 '   0 AS IMPRIME, IDFORCLI, CEP, CODESTADO, CIDADE, BAIRRO, COMPLEMENTO, NUMERO, '+#13+
                 '   LOGRADOURO, NUMDOCUMENTO, NOME, VALORDESCONTO, DATALIMITE, DATAPROGRAMADA, '+#13+
                 '   IDPESSOA, '+#13+//Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '   EMAILFUNCEF, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '   CODPORTFORMA, DATAVENCTO, DATAEMISSAO, NODOCUMENTO, MOESIGLA, CODDOCUMENTO, '+#13+
                 '   (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')  ) AS DATADOCUMENTO, '+#13+
                 '   TIPO, NOSSONUMERO, COMPLDOCUMENTO, TIPOENDERECO, NUMAGENCIA, NUMCONTA, VALORJUROS, '+#13+
                 '   (''00186.99595  90309.403922  00152.059168                                      000'') AS CODBARRADIG, '+#13+
                 '   FLGGRUPO, VALOR, VALOROM, NUMRAZAOCC, IDTIPOCLIENTE, NUMEMPRESABANCO, CODTIPOPAGTO, CODFORMAPAGTO, FLGEMITEAVISO, ' +#13+
                 '   NOME AS RAZAOSOCIAL, NUMAGENCIA, CONTACORRENTE, NUMBANCO AS CODBANCOFAVORECIDO, AGENCIACONVENIO '+#13+ //andré tavares - pendência 27408 - 13/02/2008

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '   ,IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', CODTIPDOC ';

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', IDUSUARIOINCLUSAO '+#13;

                 sSql := sSql + ' FROM (SELECT /*+RULE*/ '+#13+   // Edilaine - SOL 178674 / KTN 1726751
                 '       D.IDFORCLI, '+#13+
                 '       E.CEP, '+#13+
                 '       ES.CODESTADO, '+#13+
                 '       C.NOME AS CIDADE, '+#13+
                 '       E.BAIRRO, '+#13+
                 '       E.COMPLEMENTO, '+#13+
                 '       E.NUMERO, '+#13+
                 '       E.LOGRADOURO,    '+#13+
                 '       DECODE(P.TIPO,''J'',DECODE(P.NUMDOCUMENTO,NULL,''00000000000000'',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,''00000000000'',P.NUMDOCUMENTO)) AS NUMDOCUMENTO,  '+#13+
                 '       P.IDPESSOA, '+#13+//Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '       PF.EMAILFUNCEF, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '       P.RAZAOSOCIAL AS NOME, '+#13+
                 '       D.VALORDESCONTO, '+#13+
                 '       D.DATALIMITE, '+#13+
                 '       D.DATAPROGRAMADA, '+#13+
                 '       D.CODPORTFORMA, '+#13+
                 '       D.DATAVENCTO, '+#13+
                 '       (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'') ) AS DATAEMISSAO,  '+#13+
                 '       D.NODOCUMENTO, '+#13+
                 '       M.MOESIGLA, '+#13+
                 '       D.CODDOCUMENTO, '+#13+
                 '       P.TIPO, '+#13+
                 '       D.NOSSONUMERO, '+#13+
                 '       D.COMPLDOCUMENTO, '+#13+
                 '       E.TIPOENDERECO,  '+#13+
   //              '       AB.NUMAGENCIA, '+#13+
                 '       PC.NOCONTACORR AS NUMCONTA, '+#13+
                 '       F.JUROSPORDIA AS VALORJUROS, '+#13+
                 '       (''N'') AS FLGGRUPO, '+#13+
                 '       SALDO.VALOR, '+#13+
                 '       SALDO.VALOROM, '+#13+
                 '       F.NUMRAZAOCC, '+#13+
                 '       CP.IDTIPOCLIENTE, '+#13+
                 '       F.NUMEMPRESABANCO, '+#13+
                 '       F.CODTIPOPAGTO, F.CODFORMAPAGTO, F.FLGEMITEAVISO, cb.*, AB.NUMAGENCIA AS AGENCIACONVENIO '+#13+ //andré tavares - pendência 27408 - 13/02/2008

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '       ,D.IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', D.CODTIPDOC '+#13;

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

                 sSql := sSql +
                 '   FROM '+#13+
                 '       ENDPESS E, CIDADES C, ESTADO ES, '+#13+
                 '       PESSOA P, '+#13+
                 '       PESSOAFISICA PF,'+#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '       DOCUMENTO D, '+#13+
                 '       MOEDA M, '+#13+
                 '       AGENCIABANCARIA AB, '+#13+
                 '       PORTADORCONTA PC, '+#13+
                 '       CLIENTEPESS CP, '+#13+
                 //'       PORTADORFORMA F , '+#13+  // Edilaine - SOL 178674 / KTN 1726751 - comentado

                 '       (SELECT  /*+RULE*/ '+#13+
                 // Edilaine - SOL 178674 / KTN 1726751 - alteração no alias do DOCUMENTO
                 '          DOC.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) AS VALOR, '+#13+
                 '          SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) AS VALOROM '+#13+
                 '        FROM  '+#13+
                 '            LANCTODOCUM L,DOCUMENTO DOC '+#13+

                 '       WHERE (L.CODDOCUMENTO = DOC.CODDOCUMENTO) '+#13+
                 '         AND (DOC.CODGRUPOCNAB IS NULL) '+#13+
                 '         AND (RTRIM(DOC.OPERACAO) IN (''2'',''3'',''13'',''14'')) '+#13+
                 '         AND (DOC.RECPAG = ''R'') And (DOC.IDPESSOA = '+ intToStr(idpessoa)+  ') '+#13+
                 //'         AND (NVL(DOC.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) +') '+#13+
                 '         AND ((DOC.STATUS <> ''2'') OR (DOC.STATUS IS NULL)) '+#13+
                 '         AND (DOC.CONTROLEREMESSA IS NULL                 OR '+#13+
                 '              DOC.CONTROLEREMESSA = '+ intTostr(pcontroleremessa) +' ) ';

                 if idmodulo <> 0 then
                   ssql := sSql +'         AND   (DOC.IDMODULO = ' + intToStr(idmodulo)+ ') '+#13;

                 sSql := sSql +
                 //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
                 '         AND NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD WHERE DXD.IDDOCUMENTO = DOC.CODDOCUMENTO)'+#13+
                 '       GROUP BY  DOC.CODDOCUMENTO '+#13+
                 '       HAVING '+#13+
                 '          (SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) <> 0) OR '+#13+
                 '          (SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) <> 0) '+#13+
                 '           ) SALDO, '+#13+
                 // Edilaine - SOL 178674 / KTN 1726751 - fim

                 // Edilaine - SOL 178674 / KTN 1726751
                 '       (SELECT /*+USE_NL*/ PF.CODPORTFORMA, PF.JUROSPORDIA, PF.NUMRAZAOCC, PF.NUMEMPRESABANCO,  PF.CODTIPOPAGTO, '+#13+
                 '               PF.CODFORMAPAGTO, PF.FLGEMITEAVISO, PF.CODPORTADOR '+#13+
                 '          FROM PORTADORFORMA PF '+#13+
                 '         WHERE PF.CODPORTFORMA = '+ intToStr(pcodportforma) +#13+
                 '       ) F, '+#13+
                 // Edilaine - SOL 178674 / KTN 1726751 - fim


                 ' ( SELECT /*+RULE*/ DISTINCT C.IDCBANCARIA, B.NUMBANCO, A.NUMAGENCIA, C.CONTACORRENTE '+#13+
                 '   FROM CONTABANCARIA C, AGENCIABANCARIA A, BANCO B  '+#13+    // Edilaine - SOL 178674 / KTN 1726751
                 '   WHERE C.IDAGENCIA = A.IDPESSOA AND                '+#13+
                 '         B.IDPESSOA  = A.IDBANCO  ) CB,           '+#13+

                 // Edilaine - SOL 178674 / KTN 1726751
                 ' (SELECT DISTINCT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG A_11 '+#13+
                 '   WHERE A_11.RECPAG = ''R'' '+#13+
                 '     AND NOT EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B_11 WHERE B_11.RECPAG = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_11.idusuario = '+ intToStr(idusuario);

                 sSql := sSql +
                 '  ) union '+#13+
                 '  SELECT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG a_12 '+#13+
                 '   WHERE a_12.RECPAG = ''R''  '+#13+
                 '     and exists (select 1 from UsuarioxTpdocto b_12 where a_12.codtipdoc = b_12.codtipdoc and b_12.recpag = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_12.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + ' )) TD ';
                 // Edilaine - SOL 178674 / KTN 1726751 - FIM

                 // Edilaine - SOL 178674 / KTN 1726751 - comentado
                 {
                 '   WHERE '+
                 ' (CB.IDCBANCARIA(+) = D.IDCBANCARIA) AND '+
                 ' (D.CODTIPDOC IN (SELECT CODTIPDOC FROM /*+RULE*/ TIPODOCRECPAG A WHERE A.RECPAG =  ''R'' AND NOT EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B WHERE RECPAG= ''R'' '; // Edilaine - SOL 178674 / KTN 1726751

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);

                 sSql := sSql +
                 ' ) union  SELECT CODTIPDOC  FROM /*+RULE*/ TIPODOCRECPAG a WHERE a.RECPAG = ''R'' '+#13+  // Edilaine - SOL 178674 / KTN 1726751
                 '    and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc = b.codtipdoc and recpag= ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);
                 }
                 // Edilaine - SOL 178674 / KTN 1726751 - comentado fim

                 // Edilaine - SOL 178674 / KTN 1726751 - reorganizar os filtros e depois acrescentar os joins
                 sSql := sSql +
                 '   WHERE '+
                 //'    (NVL(D.EMISBLOQ, ''N'' ) = '+ quotedStr(pemisbloq) +')             AND '+#13+
                 '    (D.RECPAG = ''R'')                         AND '+#13+
                 '    ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
                 '    (D.IDPESSOA = '+ intToStr(idpessoa)+ ')     AND '+#13+
                 '    (CP.IDPESSOA = D.IDFORCLI)                 AND '+#13+
                 '    (D.CODGRUPOCNAB IS NULL)                   AND '+#13+
                 '    (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 '    (CB.IDCBANCARIA(+) = D.IDCBANCARIA) AND '+#13+
                 '    (D.CODTIPDOC = TD.CODTIPDOC)  AND '+#13;

                 //andre tavares = pendencia 22079 - 18/07/2006
                 if coddocumento <> 0 then
                    ssql := sSql + '    D.CODDOCUMENTO = '+ intToStr(coddocumento)+ ' AND  '+#13;

                 //sSql := sSql +                                                              // Edilaine - SOL 178674 / KTN 1726751 - comentado
                 //' ))) AND and (F.CODPORTFORMA =  '+ intToStr(pcodportforma)+ ' ) AND '+#13+ // Edilaine - SOL 178674 / KTN 1726751 - comentado

                 // Edilaine - SOL 178674 / KTN 1726751 - fim reorganizar os filtros


                 // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
                 if codtipdoc <> 0 then
                   ssql := sSql + ' (D.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
                                   //Higor Nayde Ferreira	SOL 196541  KTN 1882213
                  if idusuario > 0 then
                  begin
                     if sistema.idusuario = idusuario then
                     begin
                        ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13;
                     end
                     else
                     begin
                         ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
                      end;
                  end;
                                 //Higor Nayde Ferreira	SOL 196541  KTN 1882213

                 if bPeriodo then
                 begin
                    if Trim(dataprogramadaini) <> '' then
                    begin
                      ssql := sSql + ' (D.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

                      if Trim(dataprogramadafim) = '' then
                        ssql := sSql + ' (D.DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
                      else
                        ssql := sSql + ' (D.DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
                    end;
                 end
                 else
                    ssql := sSql + ' (D.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;

                 // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **


                 if idmodulo <> 0 then
                   ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

                 sSql := sSql +
                 '    (D.CONTROLEREMESSA IS NULL                 OR  '+#13+
                 '     D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+') AND '+#13+
                 '    (D.IDFORCLI=P.IDPESSOA)                    AND '+#13+
                 '    (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND '+#13+
                 '    (D.MOECODIGO = M.MOECODIGO(+))             AND '+#13+
                 '    (D.CODPORTFORMA = F.CODPORTFORMA)          AND '+#13+
                 '    (F.CODPORTADOR = PC.CODPORTADOR(+))        AND '+#13+
                 '    (PC.IDAGENCIA = AB.IDPESSOA(+))            AND '+#13+
                 '    (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND '+#13+
                 '    (E.IDCIDADES = C.IDCIDADES(+))             AND '+#13+
                 '    (ES.IDESTADO(+) = C.IDESTADO)              AND '+#13+
                 '    P.IDPESSOA = PF.IDPESSOA(+) '+#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 ' UNION ALL '+#13+
                 '   SELECT /*+RULE*/ DISTINCT '+#13+    // Edilaine - SOL 178674 / KTN 1726751 - alteração dos alias
                 '      d2.idforcli, E2.CEP, ES2.CODESTADO, C2.NOME AS CIDADE, E2.BAIRRO, '+#13+
                 '      E2.COMPLEMENTO, E2.NUMERO, E2.LOGRADOURO, '+#13+
                 '      DECODE(P2.TIPO,''J'',DECODE(P2.NUMDOCUMENTO,NULL,''00000000000000'',P2.NUMDOCUMENTO),DECODE(P2.NUMDOCUMENTO,NULL,''00000000000'',P2.NUMDOCUMENTO)) AS NUMDOCUMENTO,  '+#13+
                 '      P2.IDPESSOA,' +#13+//Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '      PF2.EMAILFUNCEF, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '      P2.RAZAOSOCIAL AS NOME, D2.VALORDESCONTO , D2.DATALIMITE, 	D2.DATAPROGRAMADA, '+#13+
                 '      D2.CODPORTFORMA, D2.DATAVENCTO, TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')  AS DATAEMISSAO, 	D2.CODGRUPOCNAB,  '+#13+
                 '      M2.MOESIGLA, D2.CODGRUPOCNAB AS CODDOCUMENTO, P2.TIPO, D2.NOSSONUMERO, '+#13+
                 '      ('''') AS COMPLDOC,    E2.TIPOENDERECO, /*AB2.NUMAGENCIA,*/ PC2.NOCONTACORR AS NUMCONTA,  '+#13+
                 '      SUM(F2.JUROSPORDIA) AS VALORJUROS, (''S'') AS FLGGRUPO, SUM(SALDO2.VALOR), SUM(SALDO2.VALOROM),  F2.NUMRAZAOCC, CP2.IDTIPOCLIENTE, F2.NUMEMPRESABANCO, ' + #13+
                 '      F2.CODTIPOPAGTO, F2.CODFORMAPAGTO, F2.FLGEMITEAVISO, CB2.*, AB2.NUMAGENCIA AS AGENCIACONVENIO '+#13+ //andré tavares - pendência 27408 - 13/02/2008

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '       ,D2.IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', D2.CODTIPDOC '+#13;

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', D2.IDUSUARIOINCLUSAO '+#13;

                 sSql := sSql +
                 '   FROM  ENDPESS E2, CIDADES C2, ESTADO ES2,  '+#13+
                 '       PESSOA P2, '+#13+
                 '       PESSOAFISICA PF2, ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '       DOCUMENTO D2, '+#13+
                 '       MOEDA M2, '+#13+
                 '       AGENCIABANCARIA AB2, '+#13+
                 '       PORTADORCONTA PC2, '+#13+
                 '       CLIENTEPESS CP2, '+#13+
                 //'       PORTADORFORMA F, '+#13+   // Edilaine - SOL 178674 / KTN 1726751 - comentado

                 '      (SELECT  /*+RULE*/ '+#13+
                 '           DOC2.CODDOCUMENTO, SUM(DECODE(L2.DEBCRE,''C'',L2.VALOR * -1,L2.VALOR)) AS VALOR, '+#13+
                 '           SUM(DECODE(L2.DEBCRE,''C'',L2.VALOROUTRAMOEDA*-1,L2.VALOROUTRAMOEDA)) AS VALOROM '+#13+
                 '       FROM  LANCTODOCUM L2      , DOCUMENTO DOC2 '+#13+
                 '       WHERE (L2.CODDOCUMENTO = DOC2.CODDOCUMENTO) AND '+#13+
                 '             (DOC2.CODGRUPOCNAB IS NOT NULL)            AND '+#13+
                 '             (RTRIM(DOC2.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 '             (DOC2.RECPAG = ''R'') And '+#13+
                 '             (DOC2.IDPESSOA =  '+ intToStr(idpessoa) +') and '+#13+
                 //'                 (NVL(DOC2.EMISBLOQ, ''N'') = '+ quotedStr(pEmisBloq) +') AND  '+#13+
                 '       ((DOC2.STATUS <> ''2'') OR (DOC2.STATUS IS NULL))  AND '+#13+
                 '        (DOC2.CONTROLEREMESSA IS NULL OR '+#13+
                 '        DOC2.CONTROLEREMESSA = '+ intToStr(pcontroleremessa) +') AND '+#13;

                 if idmodulo <> 0 then
                   ssql := sSql + '   (DOC2.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

                 //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
                 ssql := sSql +
                 '       NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD2 WHERE DXD2.IDDOCUMENTO = DOC2.CODDOCUMENTO)'+#13+
                 '       GROUP BY DOC2.CODDOCUMENTO '+#13+
                 '       HAVING '+#13+
                 '          (SUM(DECODE(L2.DEBCRE,''C'',L2.VALOR * -1,L2.VALOR)) <> 0) OR '+#13+
                 '          (SUM(DECODE(L2.DEBCRE,''C'',L2.VALOROUTRAMOEDA*-1,L2.VALOROUTRAMOEDA)) <> 0) '+#13+
                 '           ) SALDO2, '+#13+

                 ' ( SELECT /*+RULE*/ DISTINCT CT2.IDCBANCARIA, BC2.NUMBANCO, AG2.NUMAGENCIA, CT2.CONTACORRENTE '+#13+
                 '   FROM CONTABANCARIA CT2, AGENCIABANCARIA AG2, BANCO BC2  '+#13+
                 '   WHERE CT2.IDAGENCIA = AG2.IDPESSOA AND                '+#13+
                 '         BC2.IDPESSOA  = AG2.IDBANCO  ) CB2,           '+#13+

                 // Edilaine - SOL 178674 / KTN 1726751
                 ' (SELECT /*+USE_NL*/ PF2.CODPORTFORMA, PF2.JUROSPORDIA, PF2.NUMRAZAOCC, PF2.NUMEMPRESABANCO, PF2.CODTIPOPAGTO, '+#13+
                 '         PF2.CODFORMAPAGTO, PF2.FLGEMITEAVISO, PF2.CODPORTADOR '+#13+
                 '    FROM PORTADORFORMA PF2 '+#13+
                 '   WHERE PF2.CODPORTFORMA = '+ intTostr(pcodportforma) +#13+
                 ' ) F2, '+#13+

                 ' (SELECT DISTINCT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG A_21 '+#13+
                 '   WHERE A_21.RECPAG = ''R'' '+#13+
                 '     AND NOT EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B_21 WHERE B_21.RECPAG = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_21.idusuario = '+ intToStr(idusuario);

                 sSql := sSql +
                 '  ) union '+#13+
                 '  SELECT CODTIPDOC '+#13+
                 '    FROM TIPODOCRECPAG a_22 '+#13+
                 '   WHERE a_22.RECPAG = ''R''  '+#13+
                 '     and exists (select 1 from UsuarioxTpdocto b_22 where a_22.codtipdoc = b_22.codtipdoc and b_22.recpag = ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b_22.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + ' )) TD2 '+#13+
                 // Edilaine - SOL 178674 / KTN 1726751 - fim


                 // Edilaine - SOL 178674 / KTN 1726751 - comentado
                 {
                 '   WHERE '+#13+
                 '      (D2.IDCBANCARIA = CB2.IDCBANCARIA(+))  AND '+#13+
                 '      (d2.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =  ''R'' and not exists  (select 1 from UsuarioxTpdocto b where recpag= ''R'' ';

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + ' ) union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = ''R'' '+#13+
                 '      and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc '+#13;

                 if idusuario <> 0 then
                   sSql := sSql + ' and b.idusuario = '+ intToStr(idusuario);

                 sSql := sSql + '       and recpag = ''R''))) and '+#13;

                 if pcodPortForma <> 0 then
                   sSql := sSql + ' (F.CODPORTFORMA =  '+ intTostr(pcodportforma) + ' ) AND '+#13;
                 }
                 //andre tavares = pendencia 22079 - 18/07/2006
                 '   WHERE '+#13+
                 '      (D2.CODGRUPOCNAB IS NOT NULL)               AND '+#13+
                 '      (D2.RECPAG = ''R'')                           AND '+#13+
                 '      (RTRIM(D2.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 '      (D2.STATUS <> ''2'')                        AND '+#13+
                 //'      (NVL(D2.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) + ' )           AND '+#13+
                 '      (D2.IDPESSOA = '+ intToStr(idpessoa) +' )    AND '+#13+
                 '      (D2.CONTROLEREMESSA IS NULL                 OR  '+#13+
                 '       D2.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ')            AND '+#13;

                 if coddocumento <> 0 then
                   ssql := sSql + ' D2.CODDOCUMENTO = '+ intToStr(coddocumento)+ ' AND'+#13;


                 //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
                 if idmodulo <> 0 then
                   ssql := sSql + '   (D2.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

                 // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
                 if codtipdoc <> 0 then
                   ssql := sSql + ' (D2.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
                                   //Higor Nayde Ferreira	SOL 196541  KTN 1882213
                  if idusuario > 0 then
                  begin
                     if sistema.idusuario = idusuario then
                     begin
                         ssql := sSql + ' (D2.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13;
                     end
                     else
                     begin
                         ssql := sSql + ' (D2.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
                      end;
                  end;

                 if bPeriodo then
                 begin
                                    //Higor Nayde Ferreira	SOL 196541  KTN 1882213
                    if Trim(dataprogramadaini) <> '' then
                    begin
                      ssql := sSql + ' (D2.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

                      if Trim(dataprogramadafim) = '' then
                        ssql := sSql + ' (D2.DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
                      else
                        ssql := sSql + ' (D2.DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
                    end;

                                  // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **
                 end
                 else
                    ssql := sSql + ' (D2.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;


                 sSql := sSql +
                 //'      (D.CODGRUPOCNAB IS NOT NULL)               AND '+#13+
                 //'      (D.RECPAG = ''R'')                           AND '+#13+
                 //'      (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
                 //'      (D.STATUS <> ''2'')                        AND '+#13+
                 //'      (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) + ' )           AND '+#13+
                 //'      (D.IDPESSOA = '+ intToStr(idpessoa) +' )    AND '+#13+
                 //'      (D.CONTROLEREMESSA IS NULL                 OR  '+#13+
                 //'       D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ')AND '+#13+
                 '      (D2.CODTIPDOC = TD2.CODTIPDOC)               AND '+#13+
                 '      (D2.IDCBANCARIA = CB2.IDCBANCARIA(+))         AND '+#13+
                 '      (CP2.IDPESSOA = D2.IDFORCLI)                 AND '+#13+
                 '      (D2.IDFORCLI = P2.IDPESSOA)                  AND '+#13+
                 '      (D2.CODDOCUMENTO = SALDO2.CODDOCUMENTO)      AND '+#13+
                 '      (D2.MOECODIGO = M2.MOECODIGO(+))             AND '+#13+
                 '      (D2.CODPORTFORMA = F2.CODPORTFORMA)          AND '+#13+
                 '      (F2.CODPORTADOR = PC2.CODPORTADOR(+))        AND '+#13+
                 '      (PC2.IDAGENCIA = AB2.IDPESSOA(+))            AND '+#13+
                 '      (E2.IDENDERECO(+) = P2.IDENDCOBRANCA)        AND '+#13+
                 '      (E2.IDCIDADES = C2.IDCIDADES(+))             AND '+#13+
                 '      (ES2.IDESTADO(+) = C2.IDESTADO)              AND '+#13+
                 '      P2.IDPESSOA = PF2.IDPESSOA(+) ' +#13+ //Helio - SOL Nº 253577/17906 PPM Nº 1163500
                 '   GROUP BY D2.IDFORCLI, '+#13+
                 '       D2.CODGRUPOCNAB, '+#13+
                 '       E2.CEP, ES2.CODESTADO, C2.NOME, E2.BAIRRO, '+#13+
                 '       E2.COMPLEMENTO, E2.NUMERO, E2.LOGRADOURO, NUMDOCUMENTO, '+#13+
                 '       P2.RAZAOSOCIAL, D2.VALORDESCONTO, D2.DATALIMITE, D2.DATAPROGRAMADA, '+#13+
                 '       D2.CODPORTFORMA, D2.DATAVENCTO, '+#13+
                 '       M2.MOESIGLA, P2.TIPO, D2.NOSSONUMERO, '+#13+
                 '       E2.TIPOENDERECO,  AB2.NUMAGENCIA, PC2.NOCONTACORR, F2.JUROSPORDIA, '+#13+
                 '       F2.NUMRAZAOCC, CP2.IDTIPOCLIENTE, F2.NUMEMPRESABANCO, F2.CODTIPOPAGTO, F2.CODFORMAPAGTO, F2.FLGEMITEAVISO, ' + #13+
                 '       CB2.IDCBANCARIA, CB2.NUMBANCO, CB2.NUMAGENCIA, CB2.CONTACORRENTE, ' +#13+
                 '       P2.IDPESSOA, ' +#13+ //Helio - SOL Nº 253577-17359 PPM Nº 842402
                 '       PF2.EMAILFUNCEF ' +#13+

                 // Ricardo A. SOL 124467-381 KTN 668796
                 '       ,D2.IDMODULO '+#13;
                 // fim Ricardo A. SOL 124467-381 KTN 668796

                 if codtipdoc <> 0 then
                   ssql := sSql + ', D2.CODTIPDOC '+#13;

                 if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
                   sSql := sSql + ', D2.IDUSUARIOINCLUSAO '+#13;

                 sSql := sSql + ') ' +#13+ ' ORDER BY FLGGRUPO, NODOCUMENTO ';
       end
       else begin
         sSql := ' SELECT 0 AS IMPRIME, IDFORCLI, CEP, CODESTADO, CIDADE, BAIRRO, COMPLEMENTO, NUMERO, LOGRADOURO, NUMDOCUMENTO, NOME,  '+#13+
         '  VALORDESCONTO, DATALIMITE, DATAPROGRAMADA, CODPORTFORMA, DATAVENCTO, DATAEMISSAO, NODOCUMENTO, '+#13+
         '   (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'')  ) AS DATADOCUMENTO, '+#13+
         ' (''00186.99595  90309.403922  00152.059168                                      000'') AS CODBARRADIG, '+#13+
         '  MOESIGLA, CODDOCUMENTO, TIPO, NOSSONUMERO, COMPLDOCUMENTO, TIPOENDERECO, NUMAGENCIA, NUMCONTA, '+#13+
         '  VALORJUROS, FLGGRUPO, VALOR, VALOROM, NUMRAZAOCC, IDTIPOCLIENTE, NUMEMPRESABANCO, CODTIPOPAGTO, CODFORMAPAGTO, CODPORTFORMA, ''00000'' AS AGENCIACONVENIO ' + #13 + //pendência 24491 - 10/03/2008

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', IDUSUARIOINCLUSAO '+#13;

           sSql := sSql +
         ' FROM (SELECT  '+#13+
         '         D.IDFORCLI, E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO, E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, '+#13+
         '         DECODE(P.TIPO,''J'',DECODE(P.NUMDOCUMENTO,NULL,''00000000000000'',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,''00000000000'',P.NUMDOCUMENTO)) AS NUMDOCUMENTO, '+#13+
         '         P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, D.CODPORTFORMA, D.DATAVENCTO, '+#13+
         '          (TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'') ) AS DATAEMISSAO, D.NODOCUMENTO, M.MOESIGLA, '+#13+
         '         D.CODDOCUMENTO, P.TIPO, D.NOSSONUMERO, D.COMPLDOCUMENTO, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA, '+#13+
         '         F.JUROSPORDIA AS VALORJUROS, (''N'') AS FLGGRUPO, SALDO.VALOR, SALDO.VALOROM, F.NUMRAZAOCC, CP.IDTIPOCLIENTE, F.NUMEMPRESABANCO, F.CODTIPOPAGTO, F.CODFORMAPAGTO '+#13 +

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,D.IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', D.CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

         sSql := sSql +
         ' FROM '+#13+
         ' ENDPESS E, CIDADES C, ESTADO ES, '+#13+
         ' (SELECT '+#13+
         '    D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) AS VALOR, '+#13+
         '    SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) AS VALOROM '+#13+
         ' FROM '+#13+
         '     LANCTODOCUM L,DOCUMENTO D WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+#13+
         '     (D.RECPAG = ''R'') AND (D.IDPESSOA =  '+ intToStr(idpessoa)+  ') AND '+#13+
         //'      (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) +') AND '+#13+
         '       ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
         '        (D.CONTROLEREMESSA IS NULL                 OR '+#13+
         '        D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') '+#13+
         //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
         '       AND NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD WHERE DXD.IDDOCUMENTO = D.CODDOCUMENTO)'+#13+
         ' GROUP BY D.CODDOCUMENTO  '+#13+
         ' HAVING '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) <> 0) OR '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) <> 0) '+#13+
         '     ) SALDO, '+#13+
         ' PESSOA P, '+#13+
         ' DOCUMENTO D, '+#13+
         ' PORTADORFORMA F , '+#13+
         ' MOEDA M, '+#13+
         ' AGENCIABANCARIA AB, '+#13+
         ' PORTADORCONTA PC, '+#13+
         ' CLIENTEPESS CP '+#13+

         //David - Pendência 26006 - Retirado IDMODULO para corrigir problema com documento agrupados
         //' MODULO '+#13+

         ' WHERE (D.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG =  ''R'' AND '+#13+
         ' NOT EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B WHERE '+#13;

         if idusuario <> 0 then
           sSql := sSql + '  B.IDUSUARIO = ' + intTostr(idusuario)+ ' AND '+#13;

         sSql := sSql + '  RECPAG=''R'') UNION  SELECT CODTIPDOC  FROM TIPODOCRECPAG A WHERE A.RECPAG = ''R'' '+#13+
                        '  AND EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B WHERE A.CODTIPDOC=B.CODTIPDOC '+#13;

         if idusuario <> 0 then
           sSql := sSql + ' AND B.IDUSUARIO=' + intTostr(idusuario)+#13;

         sSql := sSql + ' AND RECPAG=''R''))) AND '+#13+
         ' (F.CODPORTFORMA =   '+ intToStr(pcodportforma)+ ') AND '+#13+
        // ' (NVL(D.EMISBLOQ, ''N'' )= '+ quotedStr(pemisbloq) +')             AND '+#13+
         ' (D.RECPAG = ''R'')                         AND '+#13+
         ' ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
         ' (D.IDPESSOA =  '+ intToStr(idpessoa)+  ')    AND '+#13+
         ' (CP.IDPESSOA = D.IDFORCLI)                   AND '+#13;

         //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
         if idmodulo <> 0 then
           ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

         ssql := sSql +
         ' ((CP.IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ ' )  OR '+#13+
         ' (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE  '+#13+
         ' IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ '))) AND '+#13+
         ' (D.CODGRUPOCNAB IS NULL)                   AND '+#13+
         ' (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
         ' (D.CONTROLEREMESSA IS NULL                 OR '+#13+
         '  D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') AND '+#13+
         ' (D.IDFORCLI=P.IDPESSOA)                    AND '+#13+
         ' (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND '+#13;

         // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
         if codtipdoc <> 0 then
           ssql := sSql + ' (D.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
         //Higor Nayde Ferreira	SOL 196541  KTN 1882213
         if idusuario > 0 then
         begin
            if sistema.idusuario = idusuario then
               ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13
            else
               ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
         end;

         if bPeriodo then
         begin
                      //Higor Nayde Ferreira	SOL 196541  KTN 1882213
            if Trim(dataprogramadaini) <> '' then
            begin
              ssql := sSql + ' (D.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

              if Trim(dataprogramadafim) = '' then
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
              else
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
            end;

            // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **
         end
         else
            ssql := sSql + ' (D.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;

         //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
         if idmodulo <> 0 then
           ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

         ssql := sSql +
         ' (D.MOECODIGO = M.MOECODIGO(+))             AND '+#13+
         ' (D.CODPORTFORMA = F.CODPORTFORMA)          AND '+#13+
         ' (F.CODPORTADOR = PC.CODPORTADOR(+))        AND '+#13+
         ' (PC.IDAGENCIA = AB.IDPESSOA(+))            AND '+#13+
         ' (E.IDCIDADES = C.IDCIDADES(+))             AND '+#13+
         ' (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND '+#13+
         ' (ES.IDESTADO(+) = C.IDESTADO) '+#13+
         ' UNION ALL '+#13+
         ' SELECT DISTINCT '+#13+
         '  D.IDFORCLI, '+#13+
         '  E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO, '+#13+
         '  E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, '+#13+
         '  DECODE(P.TIPO,''J'',DECODE(P.NUMDOCUMENTO,NULL,''00000000000000'',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,''00000000000'',P.NUMDOCUMENTO)) AS NUMDOCUMENTO, '+#13+
         '  P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, '+#13+
         '  D.CODPORTFORMA, D.DATAVENCTO, TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'') AS DATAEMISSAO, D.CODGRUPOCNAB, '+#13+
         '  M.MOESIGLA, D.CODGRUPOCNAB AS CODDOCUMENTO, P.TIPO, D.NOSSONUMERO, '+#13+
         '  ('''') AS COMPLDOC, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACORR AS NUMCONTA,  '+#13+
         '  SUM(F.JUROSPORDIA) AS VALORJUROS, (''S'') AS FLGGRUPO, SUM(SALDO.VALOR),SUM(SALDO.VALOROM),  F.NUMRAZAOCC, CP.IDTIPOCLIENTE, F.NUMEMPRESABANCO, F.CODTIPOPAGTO, F.CODFORMAPAGTO  ' + #13+

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,D.IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', D.CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

         sSql := sSql +
         ' FROM ENDPESS E, CIDADES C, ESTADO ES,  '+#13+
         ' (SELECT D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) AS VALOR,  '+#13+
         '    SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) AS VALOROM '+#13+
         ' FROM LANCTODOCUM L   ,DOCUMENTO D '+#13+
         ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '+#13+
         '     (D.RECPAG = ''R'') AND '+#13+
         '     (D.IDPESSOA =  '+ intToStr(idpessoa)+  ') AND '+#13+
         //'     (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) +')            AND '+#13+
         '     ((D.STATUS <> ''2'') OR (D.STATUS IS NULL))  AND '+#13+
         '     (D.CONTROLEREMESSA IS NULL  OR '+#13+
         '      D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') '+#13+
         //  Alterado por Arnaldo V. Scarin em 31/05/2010 - SOL: 132569 KTN: 767550
         '       AND NOT EXISTS (SELECT 1 FROM DOCUMXDOCUM DXD WHERE DXD.IDDOCUMENTO = D.CODDOCUMENTO)'+#13+
         ' GROUP BY D.CODDOCUMENTO '+#13+
         ' HAVING '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOR * -1,L.VALOR)) <> 0) OR '+#13+
         '     (SUM(DECODE(L.DEBCRE,''C'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA)) <> 0) '+#13+
         '     ) SALDO,  '+#13+
         ' PESSOA P, DOCUMENTO D, PORTADORFORMA F, MOEDA M, AGENCIABANCARIA AB, PORTADORCONTA PC, CLIENTEPESS CP ' + #13+

         ' WHERE (D.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG =  ''R'' AND NOT EXISTS  (SELECT 1 FROM USUARIOXTPDOCTO B WHERE ';

         if idusuario <> 0 then
           sSql := sSql + ' B.IDUSUARIO= '+ intTostr(idusuario)+ ' AND '+#13;

         sSql := sSql + ' RECPAG=''R'') UNION  SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG = ''R'' '+#13+
         '  AND EXISTS (SELECT 1 FROM USUARIOXTPDOCTO B WHERE A.CODTIPDOC=B.CODTIPDOC '+#13;

         if idusuario <> 0 then
           sSql := sSql + ' AND B.IDUSUARIO= '+ intTostr(idusuario);

         //andre tavares = pendencia 22079 - 18/07/2006
         if coddocumento <> 0 then
           ssql := sSql + ' AND D.CODDOCUMENTO = '+ intToStr(coddocumento) +#13; // andré tavares - penência 24491 - 13/02/2007


          sSql := sSql + ' AND RECPAG=''R''))) AND   (F.CODPORTFORMA =   '+ intToStr(pcodportforma)+ ') AND '+#13+
         '   (D.CODGRUPOCNAB IS NOT NULL) AND '+#13+
         '   (D.RECPAG = ''R'') AND '+#13+
         '   (RTRIM(D.OPERACAO) IN (''2'',''3'',''13'',''14'')) AND '+#13+
         '   (D.STATUS <> ''2'') AND '+#13+
         //'   (NVL(D.EMISBLOQ, ''N'') = '+ quotedStr(pemisbloq) + ' ) AND '+#13+
         '   (D.IDPESSOA =  '+ intToStr(idpessoa)+ ') AND '+#13+
         '   (CP.IDPESSOA = D.IDFORCLI) AND '+#13;

         // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** INICIO **
         if codtipdoc <> 0 then
           ssql := sSql + ' (D.CODTIPDOC = ' + InttoStr(codtipdoc) + ' ) AND ' + #13;
                   //Higor Nayde Ferreira	SOL 196541  KTN 1882213
         if idusuario > 0 then
          begin
             if sistema.idusuario = idusuario then
             begin
                ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(sistema.idusuario) + ' ) AND ' + #13;
             end
             else
             begin
                 ssql := sSql + ' (D.IDUSUARIOINCLUSAO = ' + IntToStr(idusuario) + ' ) AND ' + #13;
             end;
          end;

         if bPeriodo then
         begin
                      //Higor Nayde Ferreira	SOL 196541  KTN 1882213
            if Trim(dataprogramadaini) <> '' then
            begin
              ssql := sSql + ' (D.DATAPROGRAMADA >= ' + quotedStr(dataprogramadaini) + ' ) AND ' + #13;

              if Trim(dataprogramadafim) = '' then
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(datetostr(date)) + ' ) AND ' + #13
              else
                ssql := sSql + ' (DATAPROGRAMADA <= ' + quotedStr(dataprogramadafim) + ' ) AND ' + #13
            end;

            // SOL178674.10282 KTN1708253 OTACILIO AQUINO ** FIM **
         end
         else
            ssql := sSql + ' (D.DATAPROGRAMADA = ' + quotedStr(sData) + ' ) AND ' + #13;

         ssql := sSql +
         '   ((CP.IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ ') OR '+#13+
         '   (D.IDFORCLI IN (SELECT IDPESSOA FROM CLIXTIPOCLI WHERE IDTIPOCLIENTE = ' + intToStr(idtipocliente)+ '))) AND '+#13+
         '   (D.CONTROLEREMESSA IS NULL OR '+#13+
         '    D.CONTROLEREMESSA = '+ intToStr(pcontroleremessa)+ ') AND '+#13+
         '   (D.IDFORCLI=P.IDPESSOA) AND '+#13+
         '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO) AND '+#13;

         //andré tavares - pendência 26552 - 10/10/2007 - adicionei o parâmetro idmodulo
         if idmodulo <> 0 then
           ssql := sSql + '   (D.IDMODULO = ' + intToStr(idmodulo)+ ') AND '+#13;

         ssql := sSql +
         '   (D.MOECODIGO = M.MOECODIGO(+))             AND '+#13+
         '   (D.CODPORTFORMA = F.CODPORTFORMA)          AND '+#13+
         '   (F.CODPORTADOR = PC.CODPORTADOR(+))        AND '+#13+
         '   (PC.IDAGENCIA = AB.IDPESSOA(+))            AND '+#13+
         '   (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND '+#13+
         '   (E.IDCIDADES = C.IDCIDADES(+))             AND '+#13+
         '   (ES.IDESTADO(+) = C.IDESTADO) '+#13+
         ' GROUP BY D.IDFORCLI, D.CODGRUPOCNAB, '+#13+
         '    E.CEP, ES.CODESTADO, C.NOME, E.BAIRRO, '+#13+
         '    E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, NUMDOCUMENTO, '+#13+
         '    P.RAZAOSOCIAL, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGRAMADA, '+#13+
         '    D.CODPORTFORMA, D.DATAVENCTO, '+#13+
         '    M.MOESIGLA, P.TIPO, D.NOSSONUMERO, '+#13+
         '    E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTACORR, F.JUROSPORDIA, '+#13+
         '    F.NUMRAZAOCC, CP.IDTIPOCLIENTE, F.NUMEMPRESABANCO, F.CODTIPOPAGTO, F.CODFORMAPAGTO  ' +

         // Ricardo A. SOL 124467-381 KTN 668796
         '   ,D.IDMODULO '+#13;
         // fim Ricardo A. SOL 124467-381 KTN 668796


         if codtipdoc <> 0 then
           ssql := sSql + ', D.CODTIPDOC '+#13;

         if bUsuarioLogado or (idusuario > 0) then  //andre tavares - pendência 23088 - 22/08/2006 - coloquei a condição or (idusuario > 0)
           sSql := sSql + ', D.IDUSUARIOINCLUSAO '+#13;

         sSql := sSql +  ') ORDER BY FLGGRUPO, NODOCUMENTO '+#13;
       end; //else

      result := sSql;

   end;
begin
  sSql := '';

  cds := TclientDataSet.Create(nil);
  cdsaux := TclientDataSet.Create(nil);

  try
     if dataprogramadafim = '' then
        dias := 1
     else
        dias := strtodate(dataprogramadafim) - strtodate(dataprogramadaini);

     if (dias > 5) or (trim(dataprogramadaini) = '') then
     begin
        sSql := fct_sql(True,'');
        cmDebugToFile(sSql, 'c:\PLANUS\temp\botelo.txt');
        cds.data := getDataPacket(sSql);
     end
     else
     begin
        if dataprogramadafim = '' then
           dataprogramadafim := dataprogramadaini;

        Data := strtodate(dataprogramadaini);

        while (Data <= strtodate(dataprogramadafim)) do
        begin
           cdsaux.close;

           if (cdsaux.active) and
              (not cdsaux.IsEmpty) then
           cdsaux.EmptyDataSet;

           sSql := fct_sql(False,datetostr(Data));
           //cmDebugToFile(sSql, 'c:\PLANUS\temp\botelo.txt');
           cdsaux.data := getDataPacket(sSql);

           if not cdsaux.IsEmpty then
           begin
              if cds.IsEmpty then
                 cds.data := cdsaux.data
              else
                 cds.data := cds.data + cdsaux.data;
           end;

           Data := Data + 1;
        end;
     end;

     result := cds.data;
  finally
     cds.Free;
     cdsaux.Free;
  end; //try

end;//function


function TCtrlGeraBoleto.GetDadosDocumento(sCodDocumento, sCampo : string) : string;
begin
  _cds.Data := GetDataPacket('SELECT '+sCampo+' FROM DOCUMENTO WHERE CODDOCUMENTO = '+sCodDocumento);
  if _cds.isEmpty then
     result := ''
  else
     result := _cds.Fields[0].AsString;
end;

function TCtrlGeraBoleto.GeraNossoNumero(pCodPortForma, iTamNossoNumero : Integer): string;
begin
  Result := floatToStr(GetNossoNumero(pCodPortForma, iTamNossoNumero));
end;

procedure TCtrlGeraBoleto.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlGeraBoleto.SetcdsDados(const Value: TCMClientDataSet);
begin
  FcdsDados := Value;
end;


function TCtrlGeraBoleto.GetDadosCedente: OleVariant;
begin
   result := getdatapacket('SELECT P.NUMDOCUMENTO AS NUMDOCUMENTO_CEDENTE, P.RAZAOSOCIAL AS RAZAOSOCIAL_CEDENTE, ' +#13+
                           '  ( E.LOGRADOURO                                                                     ' +#13+
                           '  || DECODE(E.NUMERO,NULL,NULL,'', ''||E.NUMERO)                                     ' +#13+
                           '  || DECODE(E.COMPLEMENTO,NULL,NULL,'' - ''||E.COMPLEMENTO)                          ' +#13+
                           '  || DECODE(E.BAIRRO,NULL,NULL,'' ''||E.BAIRRO)                                      ' +#13+
                           '  || DECODE(E.CEP,NULL,NULL,'' CEP: ''||E.CEP)                                       ' +#13+
                           '  || DECODE(C.NOME,NULL,NULL,'' ''||C.NOME)                                          ' +#13+
                           '  || DECODE(C.UF,NULL,NULL,''-''||C.UF)                                              ' +#13+
                           '  || DECODE(TF.DDD,NULL,NULL,''TEL: (''||TRIM(TF.DDD)||'')'')                        ' +#13+
                           '  || DECODE(TF.NUMERO,NULL,NULL,'' ''||TF.NUMERO)                                    ' +#13+
                           '  || DECODE(TD.NUMERO,NULL,NULL,'' / ''||TD.NUMERO)                                  ' +#13+
                           '  ) ENDERECO_CEDENTE                                                                 ' +#13+
                           '  FROM  PESSOA P, ENDPESS E, CIDADES C,                                              ' +#13+
                           '  (SELECT IDENDERECO, NUMERO FROM TELENDPESS WHERE TIPO Like ''%C%'') TD,            ' +#13+
                           '  (SELECT IDENDERECO, NUMERO, DDD FROM TELENDPESS WHERE TIPO Like ''%F%'') TF        ' +#13+
                           '   WHERE (P.IDPESSOA = E.IDPESSOA)                                                   ' +#13+
                           '   AND (P.IDENDCOMERCIAL = E.IDENDERECO)                                             ' +#13+
                           '   AND (E.IDCIDADES = C.IDCIDADES)                                                   ' +#13+
                           '   AND (E.IDENDERECO = TD.IDENDERECO(+))                                             ' +#13+
                           '   AND (E.IDENDERECO = TF.IDENDERECO(+))                                             ' +#13+
                           '   AND (P.IDPESSOA = 1 )                                                             ');

end;

function TCtrlGeraBoleto.NossoNumeroIsEmpty(sNossoNumero: String): Boolean;
var
  sAux: String;
begin
   if Trim(sNossoNumero) = '' then
     Result := True
   else
   begin
     sAux := Trim(sNossoNumero);
     While Pos('0', sAux) <> 0 do
       Delete(saux, Pos('0', sAux), 1);
     Result := (Trim(saux) = '');
   end
end;


function TCtrlGeraBoleto.GetNossoNumero(const icodportforma: integer; TamNossoNumero : integer): Extended;
var
  bInTransacao : boolean;
begin
    bInTransacao := InTransaction;

    if not bInTransacao  then
      StartTransaction;

    try
      try
        _cds.data := getDataPacket(' SELECT NVL(NOSSONUMERO, 0) AS NOSSONUMERO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + intToStr(icodportforma) + ' FOR UPDATE ');
        result := strToFloat(_cds.fieldByName('NOSSONUMERO').asString) + 1;
      except
        result := 0;
      end;

      if result > 0 then
        //case iIdModulo  of
        //  64,135,456:
        if (TamNossoNumero >= 15) then
          execSql( 'UPDATE PORTADORFORMA SET NOSSONUMERO = '+ QuotedStr(FloatToStrF(result, ffFixed, TamNossoNumero,0)) + ' WHERE CODPORTFORMA = ' + intToStr(icodportforma) )
        else
          execSql( 'UPDATE PORTADORFORMA SET NOSSONUMERO = '+ FloatToStr(result) + ' WHERE CODPORTFORMA = ' + intToStr(icodportforma) );
        //end;

      if not bInTransacao then
         Commit;

    except
      on E:Exception do
      begin
        result := 0;
        Rollback;
        MessageInfo := E.Message;
      end;//on
    end;//try
end;


function TCtrlGeraBoleto.ObtemMatricula(idPessoa : Integer; bTitular : boolean = false) : String;
var
   sSQL : string;
begin
  result := '';


  try
    if not bTitular then
    begin
      sSQL := 'SELECT MATRICULA FROM DEPENTIT ' +
              ' WHERE IDPESSOA = ' + IntToStr(idPessoa) ;
    end
    else
    begin
      sSQL := 'SELECT MATRICULA FROM ELEGPATRO     '+
              ' WHERE IDPESSOA = (SELECT IDTITULAR '+
              '                     FROM DEPENTIT  '+
              '                    WHERE IDPESSOA = '+IntToStr(idPessoa) +')';
    end;

    _Cds.data := GetDataPacket( sSQL );
    if Not _Cds.IsEmpty then
       Result := _Cds.FieldByName('MATRICULA').AsString;
  except
      raise;
  end;
end;


procedure TCtrlGeraBoleto.GetModelo(iIdModelo : Integer);
begin
  _cdsModelo.Data := GetDataPacket('SELECT  '+
                                   '   IDCONFIGBARRAS, DESCCONFIGBARRAS, CARTEIRACOBR, '+
                                   '   IDREPORTS, ORIGEMCM, NUMEROBANCO, CODMOEDA, TAMNOSSONUMERO '+
                                   ' FROM             '+
                                   '   CONFIGBARRAS   '+
                                   ' WHERE            '+
                                   '   IDCONFIGBARRAS = '+IntToStr(iIdModelo) );
end;


function TCtrlGeraBoleto.CalculaDigd: String;
var
  I, Multiplicador, Val, Valor: Integer;
  sNossoNumero, sNumAgencia, sNumConta: String;
begin
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString);
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);

  sNossoNumero := RemoveAllChar(CdsDados.FieldByName('NOSSONUMERO').AsString);

  Result := sNossoNumero +
    ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) +
    ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7);
  if (Length(Result) Mod 2) <> 0 then
    Multiplicador := 2
  else
    Multiplicador := 1;

  Valor := 0;

  for I := 1 To Length(Result) do
  begin
    Val := StrToInt(Copy(Result, I, 1)) * Multiplicador;
    if Val >= 10 then
      Val := StrToInt(Copy(IntToStr(Val), 1, 1)) + StrToInt(Copy(IntToStr(Val), 2, 1));
    Valor := Valor + Val;
    if Multiplicador = 1 then
      Multiplicador := 2
    else
      Multiplicador := 1;
  end;

  Result := '0';
  if (Valor Mod 10) <> 10 then
    Result := IntToStr(10 - (Valor Mod 10));
end;


procedure TCtrlGeraBoleto.EditaNossoNumeroCaixa;
var
  i, k, index: Integer;
  s, sTemp: string;
  prefixo : string;
begin
  if Length( CdsDados.FieldByName('NOSSONUMERO').Value ) > 15 then
    index := Length( CdsDados.FieldByName('NOSSONUMERO').Value ) - 14
  else
    index := 1;
  s := Copy( CdsDados.FieldByName('NOSSONUMERO').Value, index, Length( CdsDados.FieldByName('NOSSONUMERO').Value ) );

  sTemp := '';
  k := 15 - Length( s );
  for i := 1 to k do
    sTemp := sTemp + '0';

  if (_cdsModelo.FieldByName('CARTEIRACOBR').AsString = 'RG') then
     prefixo := '14'
  else
  if (_cdsModelo.FieldByName('CARTEIRACOBR').AsString = 'SR') then
     prefixo := '24'
  else
     prefixo := _cdsModelo.FieldByName('CARTEIRACOBR').AsString;

  // carteira + zeros + nossonumero
  s := prefixo + sTemp + s;

  CdsDados.FieldByName('NOSSONUMERO').AsString := s;
end;


function TCtrlGeraBoleto.montaCampoLivreCaixa(sCodCedente, sNossoNumero: string): string;
var
  sDVCedente, sDVCampoLivre, sSequencia1,
  sConstante1, sSequencia2, sConstante2,
  sSequencia3, sCampoLivre : string;

  function MontaDV(sNum: String): String;
  var
    iBase, iDividendo, X, iResto: Integer;
  begin
    iBase := 2;
    iDividendo := 0;
    for X := Length(sNum) downto 1 do
    begin
      iDividendo := iDividendo + (StrToInt(sNum[X]) * iBase);
      if iBase = 9 then
        iBase := 2
      else
        Inc(iBase);
    end;
  
    iResto := (iDividendo Mod 11);
  
    if (11 - iResto) > 9 then
      Result := '0'
    else
      Result := Trim( IntToStr( 11 - iResto ) );
  
  end;

begin
  {Montagem do Campo Livre CAIXA}
  sSequencia1 := Copy(sNossoNumero,3,3);
  sSequencia2 := Copy(sNossoNumero,6,3);
  sSequencia3 := Copy(sNossoNumero,9,9);
  sConstante1 := Copy(sNossoNumero,1,1);
  sConstante2 := Copy(sNossoNumero,2,1);

  sDVCedente := MontaDV(sCodCedente);
  sCampoLivre := sCodCedente + sDVCedente + sSequencia1 +
                 sConstante1 + sSequencia2 + sConstante2 + sSequencia3;
  sDVCampoLivre := MontaDV(sCampoLivre);

  Result := sCampoLivre + sDVCampoLivre;
end;


function TCtrlGeraBoleto.CalculaModulo11(sNossoNumero: String; RestoZero : Boolean; Base : Integer): String;
Var
   sNumero: String;
   Divisor, iResto,iBase, x, iDividendo, iDigito : Integer;
Begin
     sNumero    := sNossoNumero;
     iBase      := 2;
     iDividendo := 0;
     Divisor    := 11;
     For X := Length(sNumero) downto 1 do
     begin
       iDividendo := iDividendo + (StrToInt(sNumero[x]) * ibase);

       Inc(iBase);
       if iBase > Base Then
          iBase := 2;
     end;
     iResto := (iDividendo Mod Divisor);
     iDigito := Divisor - (iDividendo Mod Divisor);

     if not RestoZero then
     Case iResto of
       0: iDigito := 1;
       1: iDigito := 0;
     End
     else
       Case iResto of  0,1: iDigito := 0; end;
     Result := sNossoNumero + IntToStr(iDigito);
end;


function TCtrlGeraBoleto.MontaCampoLivre : String;
var
  iNumBanco, iTamNossoNumero: Longint;
  sDigito, sNumAgencia, sCarteira, sNumConta, sNossoNumero, sNumEmpresaBanco: String;
begin
  //Correção do comprimento do campo livre para 25 posições
  iNumBanco := StrToIntDef(Copy(_cdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3), -1);
  iTamNossoNumero := _cdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger;
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString);

  sCarteira := RemoveAllChar(_cdsModelo.FieldByName('CARTEIRACOBR').AsString);
  sCarteira := intToStr(strToIntDef(sCarteira, 0));
  sNumConta := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);
  sNossoNumero := RemoveAllChar(CdsDados.FieldByName('NOSSONUMERO').AsString);
  sNumEmpresaBanco := RemoveAllChar(_cdsPortForma.FieldByName('NUMEMPRESABANCO').AsString);

  if iNumBanco <> 1 then
  begin
    sDigito := Trim(calculadigd);
    if sDigito = '10' then
      sDigito := '0';
  end;

  case iNumBanco Of

    237: //Conta Com o DV - Tam 4 + 13 + 7
    // numero da conta sem dv
      Result := ZD(sNumAgencia, 4) +
        ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 13) +
        ZD(copy(sNumConta,1,length(sNumConta)-1), 7) +
        '0';

    275, 356: //Conta e Agencia Sem o DV - Tam 4 + 7 + 1 + 13
      Result := ZD(Copy(sNumAgencia, 1, Length(sNumAgencia) - 1), 4) +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 7) + sDigito +
        ZD(sNossoNumero, 13);

    341: //Agencia e Conta Com o DV - Tam 3 + 9 + 4 + 6
      begin
        Result := ZD(sCarteira, 3) +
          ZD(Copy(sNossoNumero, 1, iTamNossoNumero + 1), 9) +
          ZD(sNumAgencia, 4) + ZD(sNumConta, 6) + '000';
      end;
    1: //Montar Sem o DV do Num da Empresa no banco - Tam 11 + 4 + 8 + 2
      Result := ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 11) +
        ZD(sNumAgencia, 4) +
        ZD(Copy(sNumConta, 1, Length(sNumConta) - 1), 8) +
        ZD(sCarteira, 2);

    104: begin
      //Definição do Novo Campo Livre CAIXA
      //CCCCNNNNNNNNNNNNNNNNNE, onde C = Cod. Cedente, N = Nosso Numero, E = DV do Campo Livre
      if (_cdsModelo.FieldByName('TAMNOSSONUMERO').asInteger >= 15) then
      begin
        if Length( CdsDados.FieldByName('NOSSONUMERO').Value ) <> 17 then
          EditaNossoNumeroCaixa;
        sNossoNumero := CdsDados.FieldByName('NOSSONUMERO').Value;
        Result := montaCampoLivreCaixa( Copy( sNumEmpresaBanco, 1, 6 ), sNossoNumero );
      end
      else
        //NNNNNNNNNNAAAAYYYXXXXXXXX Onde N - Nosso Número, A - Num Agencia Cedente, Operacao Código Cedente,
        //Código da Agencia Cedenete Fornecido Pela Agência
        //Tam 10 + 4 + 11
        Result := ZD(Copy(sNossoNumero, 1, 10), 10) +
                  ZD(Copy(sNumAgencia, 1, 4), 4) +
                  ZD(Copy(sNumConta, 1, 11), 11);
    end;

    320: //Tam = 3 + 9 + 7 +
      Result := ZD(Copy(sNumAgencia, 1, 3), 3) +
        ZD(Copy(sNumConta, 1, 9), 9) +
        ZD(Copy(sNossoNumero, 1, 7), 7) +
        ZD('0', 3) +
        ZD(sCarteira, 3);
    641:
      begin
        Try
          sNumAgencia := IntToStr(StrToInt(sNumAgencia));
        Except
        end;
        Result := Copy(sNumEmpresaBanco, 1, 7) + ZD(CalculaModulo11(_cdsPortForma.FieldByName('NOSSONUMERO').AsString,
          True, 8), 8) +
          ZD(Copy(sNumAgencia, 1, 3), 3) + ZD(Copy(sNumEmpresaBanco, 1, 6), 6) +
          IntToStr(CalculaDac(Copy(sNumEmpresaBanco, 1, 7) +
          ZD(CalculaModulo11(_cdsPortForma.FieldByName('NOSSONUMERO').AsString, True, 8), 8) +
          ZD(Copy(sNumAgencia, 1, 3), 3) +
          Copy(sNumEmpresaBanco, 1, 6), 11));
      end;
    409:
      begin
        Result := '04' +
          Copy(RemoveBarras3(CdsDados.FieldByName('DATAPROGRAMADA').AsString), 3, 6) +
          zd(sNumAgencia, 5) +
          ZD(copy(sNossoNumero, 2, 12), 12);
      end;

    399: //Tam = 12 + 4 + 7 + 2
      begin
        if _cdsPortForma.FieldByName('CODARQUIVOREMESSA').AsString <> '9' then
          Result := Copy(sNossoNumero, 1, 5) + ZD(Copy(sNossoNumero, 6, 6), 6) +
            ZD(Copy(sNumAgencia, 1, 4), 4) +
            ZD(Copy(sNumConta, 1, 7), 7) + '001'
        else
          // O Nosso Numero deve ser colocado sem as 3 ultimas posicoes
          // porque estas sao os DVS.
          // 7 + 13 + 3 + 1 + 2
          Result := ZD(sNumEmpresaBanco, 7) +
            ZD(Copy(sNossoNumero, 1, length(sNossoNumero) - 3), 13) +
            ZD(IntToStr(DayOfTheYear(CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime)), 3) +
            Copy(RemoveBarras2(CdsDados.FieldByName('DATAPROGRAMADA').AsString), 8, 1) + '2';
      end;
  else
    begin
      //Tam - 11 + 4 + 8 + 2
      Result := ZD(Copy(sNossoNumero, 1, iTamNossoNumero), 11) +
        ZD(sNumAgencia, 4) +
        ZD(sNumEmpresaBanco, 8) +
        ZD(sCarteira, 2);
    end;
  end;
end;


function TCtrlGeraBoleto.MontaBarras(bCodBarras: Boolean): String;
var
  sCodBarras, sAuxCodBarras, sBanco, sMoeda, sValor, sCampoLivre: String;
  FatorVencimento: real;
  iCdigito: Array[0..3] Of Integer;
begin

  FatorVencimento := cdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('07/10/1997');
  // WO16145 - Inicio
  // Alterado por Arnaldo V. Scarin em 19/12/2024
  // Descrição : A partir de 22/02/2025 o Fator de Vencimento deverá ser reiniciado, pois
  // o Valor dele chegará a 9999 em 21/02/2025, e começará a gerar problemas nos boletos.
  // Para tanto, foi implementada a verificação abaixo, fazendo com que seja ajustado o
  // Fator de Vencimento.
  if FatorVencimento > 9999 then
    FatorVencimento := 1000 + CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('22/02/2025');
  // WO16145 - Término


  if bCodBarras then
  begin
    // -----------------------------------------------------------------------------
    // Favor comentar as mudanças neste módulo.
    // -----------------------------------------------------------------------------
    {Código do Banco}
    sBanco := Copy(RemoveAllChar(_cdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);

    {Código da Moeda}
    if _cdsModelo.FieldByName('CODMOEDA').IsNull then
      sMoeda := '9'
    else
      sMoeda := Copy(_cdsModelo.FieldByName('CODMOEDA').AsString, 1, 1);

    {Valor do Boleto}
    sValor := ZD(RemoveVirgulas(cdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

    {Campo Livre tem 25 posições}
    sCampoLivre := MontaCampoLivre;
    sAuxCodBarras := RemoveAllChar(sBanco + sMoeda + FloatToStr(fatorvencimento) + sValor + sCampoLivre);
    {Calcula o DAC do Código de Barras}
    iDigito11 := CalculaDac(sAuxCodBarras, 11);
    {Retorna o CÓDIGO DE BARRAS já com o DAC}
    Result := Trim(sBanco + sMoeda + IntToStr(iDigito11) + ZD(FloatToStr(FatorVencimento), 4) + sValor + sCampoLivre);
  end
  else { Linha digitável }
  begin
    sBanco := Copy(RemoveAllChar(_cdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);
    sMoeda := _cdsModelo.FieldByName('CODMOEDA').AsString;
    sCampoLivre := MontaCampoLivre;

    //Calculas os 3 Primeiros Dv's
    sCodBarras := RemoveAllChar(sBanco + sMoeda + sCampoLivre);

    //Cálculo do DV do Campo 1
    sAuxCodBarras := Copy(sCodBarras, 1, 9);
    iCdigito[0] := CalculaDac(sAuxCodBarras, 10);

    //Cálculo do DV do Campo 2
    sAuxCodBarras := Copy(sCodBarras, 10, 10);
    iCdigito[1] := CalculaDac(sAuxCodBarras, 10);

    //Cálculo do DV do Campo 3
    sAuxCodBarras := Copy(sCodBarras, 20, 10);
    iCdigito[2] := CalculaDac(sAuxCodBarras, 10);

    sValor := ZD(RemoveVirgulas(CdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

    //Calculas o Dv Geral
    sCodBarras := sBanco + sMoeda + sCampoLivre;

    sAuxCodBarras := Copy(sCodBarras, 1, 9) + IntToStr(iCdigito[0]) +
      Copy(sCodBarras, 10, 10) + IntToStr(iCdigito[1]) +
      Copy(sCodBarras, 20, 10) + IntToStr(iCdigito[2]) + sValor;

    sAuxCodBarras := sAuxCodBarras + IntToStr(iDigito11) + ZD(FloatToStr(fatorvencimento), 4) + sValor;

    Result := Copy(sAuxCodBarras, 1, 5) + '.' +
      Copy(sAuxCodBarras, 6, 5) + '  ' +
      Copy(sAuxCodBarras, 11, 5) + '.' +
      Copy(sAuxCodBarras, 16, 6) + '  ' +
      Copy(sAuxCodBarras, 22, 5) + '.' +
      Copy(sAuxCodBarras, 27, 6) + '  ' +
      IntToStr(iDigito11) + '  ';
    Result := Result + ZD(FloatToStr(fatorvencimento), 4) + sValor;
  end;
end;


function TCtrlGeraBoleto.MontaBarrasCEFSigcb(bCodBarra: Boolean): String;
var
  sAuxCodBarras, sCodBarraCompleto, sBanco, sMoeda, sValor, sCampoLivre: String;
  sCampo1, sCampo2, sCampo3, sCampo4, sCampo5: String;
  FatorVencimento: Real;

  // Alterado por FHBS - SOL: 124468/388 121467/381 KTN: 668793 668796
  function CalcDVGeral(sNum: String): String;
  var
    iBase, iDividendo, X, iResto: Integer;
  begin
    iBase := 2;
    iDividendo := 0;
    for X := Length(sNum) downto 1 do
    begin
      iDividendo := iDividendo + (StrToInt(sNum[X]) * iBase);
      if iBase = 9 then
        iBase := 2
      else
        Inc(iBase);
    end;

    iResto := (iDividendo Mod 11);

    if iResto in [0, 10, 1] then
      Result := '1'
    else
      Result := Trim( IntToStr( 11 - iResto ) );

  end;
  // Fim - Alterado por FHBS

  // Alterado por FHBS - SOL: 124468/388 121467/381 KTN: 668793 668796
  function CalcDVCampo123(sNum: String): String;
  var
    iBase, iDividendo, X, iResto, iSoma: Integer;
  begin
    iBase := 2;
    iDividendo := 0;

    for X := Length(sNum) downto 1 do
    begin
      iSoma := (StrToInt(sNum[X]) * iBase );

      if iSoma > 9 then
        iSoma := Trunc( iSoma / 10 ) + ( iSoma mod 10 );

      iDividendo := iDividendo + iSoma;

      if iBase = 2 then
        iBase := 1
      else
        iBase := 2;
    end;

    iResto := ( iDividendo Mod 10 );

    if iResto > 0 then
      Result := Trim( IntToStr( 10 - iResto ) )
    else
      Result := '0';
  end;
  // Fim - Alterado por FHBS

begin
  // fator de vencimento
  FatorVencimento := CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('07/10/1997');
  // WO16145 - Inicio
  // Alterado por Arnaldo V. Scarin em 19/12/2024
  // Descrição : A partir de 22/02/2025 o Fator de Vencimento deverá ser reiniciado, pois
  // o Valor dele chegará a 9999 em 21/02/2025, e começará a gerar problemas nos boletos.
  // Para tanto, foi implementada a verificação abaixo, fazendo com que seja ajustado o
  // Fator de Vencimento.
  if FatorVencimento > 9999 then
    FatorVencimento := 1000 + CdsDados.FieldByName('DATAPROGRAMADA').AsDateTime - StrToDate('22/02/2025');
  // WO16145 - Término



  {Código do Banco}
  sBanco := Copy(RemoveAllChar(_cdsModelo.FieldByName('NUMEROBANCO').AsString), 1, 3);

  {Código da Moeda}
  if _cdsModelo.FieldByName('CODMOEDA').IsNull then
    sMoeda := '9'
  else
    sMoeda := Copy(_cdsModelo.FieldByName('CODMOEDA').AsString, 1, 1);

  {Valor do Boleto}
  sValor := ZD(RemoveVirgulas(CdsDados.FieldByName('RSALDO').AsFloat, 2), 10);

  {Campo Livre tem 25 posições}
  sCampoLivre := MontaCampoLivre;

  {Calcula o DAC do Código de Barras}
  sAuxCodBarras := RemoveAllChar(sBanco + sMoeda + FloatToStr(FatorVencimento) + sValor + sCampoLivre);

  {Retorna o CÓDIGO DE BARRAS já com o DAC}
  sCodBarraCompleto := Trim(sBanco + sMoeda + CalcDVGeral( sAuxCodBarras ) + ZD(FloatToStr(FatorVencimento), 4) + sValor + sCampoLivre);

  if bCodBarra then
    Result := sCodBarraCompleto
  else { Linha digitável }
  begin

    //Cálculo do DV do Campo 1
    sCampo1 := Copy( sCodBarraCompleto, 1, 4 ) + Copy( sCodBarraCompleto, 20, 5 ) ;
    sCampo1 := sCampo1 + CalcDVCampo123( sCampo1 );

    //Cálculo do DV do Campo 2
    sCampo2 := Copy( sCodBarraCompleto, 25, 10 );
    sCampo2 := sCampo2 + CalcDVCampo123( sCampo2 );

    //Cálculo do DV do Campo 3
    sCampo3 := Copy( sCodBarraCompleto, 35, 10 );
    sCampo3 := sCampo3 + CalcDVCampo123( sCampo3 );

    // DV Geral
    sCampo4 := Copy( sCodBarraCompleto, 5, 1 );

    // fator + valor
    sCampo5 := FloatToStr( FatorVencimento ) + sValor;

    Result :=
      Copy( sCampo1, 1, 5 ) + '.' + Copy( sCampo1, 6, 5 ) + '  ' +
      Copy( sCampo2, 1, 5 ) + '.' + Copy( sCampo2, 6, 6 ) + '  ' +
      Copy( sCampo3, 1, 5 ) + '.' + Copy( sCampo3, 6, 6 ) + '  ' +
      sCampo4 + '  ' +
      sCampo5;
  end;
end;


function TCtrlGeraBoleto.CalculaDacNN(sNossoNumero: String; iModulo: Integer): String;
var
  sNumero, sAuxResult: String;
  iPosicao, iBase, X, iDividendo, iDigito, iTamNum: Integer;
begin
  sNossoNumero := RemoveAllChar(sNossoNumero);

  sNumero := ZD(sNossoNumero, _cdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger);
  iBase := 9;
  iDividendo := 0;
  iTamNum := Length(sNumero) + 1;
  for X := 1 To Length(sNumero) do
  begin
    iDividendo := iDividendo + (StrToInt(sNumero[iTamNum - X]) * iBase);
    if iBase = 2 then
      iBase := 9
    else
      Dec(iBase);
  end;
  if (iDividendo Mod 11) <> 0 then
  begin
    iDigito := (iDividendo Mod 11)
  end
  else
    iDigito := 0;
  if iDigito = 10 then
  begin
    if Copy(_cdsModelo.FieldByName('NUMEROBANCO').AsString, 1, 3) = '001' then
      Result := sNumero + 'X'
    else
      Result := sNumero + '0';
  end
  else
    Result := sNumero + IntToStr(iDigito);
end;


function TCtrlGeraBoleto.CalculaDac(sNum: String; iModulo : integer): Integer;
var
  sNumero, sAuxResult : String;
  iBase, iDividendo, iDigito, X, iPosicao: Integer;
begin
  sNumero := Trim(sNum);
  iDividendo := 0;
  iPosicao := Length(sNumero) + 1;

  case iModulo of
    10: iBase := 2;
    11: iBase := 9;
  end;

  for X := 1 To Length(sNumero) do
  begin
    if iModulo = 10 then
    begin
      sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - x]) * ibase));
      If  Length(sAuxResult) > 1 Then
         iDividendo := iDividendo + StrToInt(sAuxResult[1]) + strToInt(sAuxResult[2])
      Else
         iDividendo := iDividendo + StrToInt(sAuxResult[1]);
      Dec(iBase);
      If iBase = 0 Then iBase := 2;
    end
    else if iModulo = 11 then
    begin
      iDividendo := iDividendo + (StrToInt(sNumero[iPosicao - X]) * iBase);
      if iBase = 2 then
        iBase := 9
      else
        Dec(iBase);
    end;
  end;

  case iModulo of
    10 : begin
           If (iDividendo Mod 10) = 0 Then
              iDigito := 0
           Else
              iDigito := 10 - (iDividendo Mod 10);
         end;
    11 : begin
           iDigito := (iDividendo Mod 11);
           if (iDigito = 0) Or (iDigito > 9) then
             Result := 1
           else
             Result := iDigito;
         end;
  end;
end;


procedure TCtrlGeraBoleto.CdsDadosCalcFields;
var
  sNumBanco, sNumAgencia, sNumConta, sDigito: String;
  sNumEmpresaBanco : string;
begin
  Inherited;
  sNumBanco   := RemoveAllChar(_cdsModelo.FieldByName('NUMEROBANCO').AsString);
  sNumAgencia := RemoveAllChar(CdsDados.FieldByName('AGENCIACONVENIO').AsString);
  sNumConta   := RemoveAllChar(CdsDados.FieldByName('NUMCONTA').AsString);

  //Armazena o campo NUMEMPRESABANCO para ser usado em boletos emitido pela CAIXA
  sNumEmpresaBanco := RemoveAllChar(CdsDados.FieldByName('NUMEMPRESABANCO').asString);

  if StrToIntDef(Copy(sNumBanco, 1, 3), 0) <> 1 then
  begin
    sDigito := Trim(calculadigd);
    if sDigito = '10' then
      sDigito := '0';
  end;

  case CdsDados.FieldByName('IDMODULO').AsInteger of
    4,
    15,
    16,
    18,
    54,
    64,
    79,
    113,
    135,
    137,
    454,
    456,
    740:
    CdsDados.FieldByName('AGENCIACODCEDENTE').asString := sNumAgencia + '.' + sNumEmpresaBanco;
  else
    CdsDados.FieldByName('AGENCIACODCEDENTE').AsString := sNumAgencia + '.' + sNumConta
  end;
end;


function TCtrlGeraBoleto.RemoveAllChar(S: String): String;
begin
   S := Trim(S);
   S := StringReplace(S, '-', '', [rfReplaceAll]);
   S := StringReplace(S, '.', '', [rfReplaceAll]);
   S := StringReplace(S, '/', '', [rfReplaceAll]);
   S := StringReplace(S, '_', '', [rfReplaceAll]);
   S := StringReplace(S, '\', '', [rfReplaceAll]);
   S := StringReplace(S, ' ', '', [rfReplaceAll]);
   Result := S;
end;



function TCtrlGeraBoleto.PreparaDados(iIdModeloCobranca : integer;
                                      //qryDocs: TwwQuery;
                                      pCodDivida    : string;
                                      pCodDocumento : String;
                                      var lstSqlUpdate : TStringList;
                                      pCodPortForma : String = '-1';
                                      pNossoNumero  : string = '-1';
                                      pCodTipDoc    : string = '-1'
                                      ) : boolean;
var
  fCodPortForma  : integer;
  sNossoNumero   : string;
  sCodTipoDoc    : string;
begin

  Result := True;

  //valida se tem o campo de codigo na query
  //if qryDocs.FindField('CODDOCUMENTO') = nil then
  if (pCodDocumento = '') or (pCodDocumento = '0') then
  begin
    Result := False;
    Abort;
  end;

  CarregaEstruturaDados();

  GetModelo( iIdModeloCobranca );

  //while not qryDocs.eof do
  begin
    //valida preenchimento do coddocumento
    {if (Trim(qryDocs.FieldByName('CODDOCUMENTO').AsString) = '') or (qryDocs.FieldByName('CODDOCUMENTO').AsFloat <= 0) then
    begin
      qryDocs.next;
      continue;
    end;   }

    //busca e valida portador forma
    //if qryDocs.FindField('CODPORTFORMA') = nil then
    if pCodPortForma = '-1' then
       fCodPortForma := StrToIntDef(GetDadosDocumento(pCodDocumento {qryDocs.FindField('CODDOCUMENTO').AsString}, 'CODPORTFORMA'), 0)
    else
       fCodPortForma := StrToIntDef(pCodPortForma,0);  //qryDocs.FieldByName('CODPORTFORMA').AsInteger;

    if not _cdsPortForma.Locate('CODPORTFORMA', fCodPortForma, []) then
    begin
      Result := false;
      Abort;
      //qryDocs.next;
      //continue;
    end;

    //busca NossoNumero
    //if qryDocs.FindField('NOSSONUMERO') = nil then
    if pNossoNumero = '-1' then
       sNossoNumero := GetDadosDocumento(pCodDocumento {qryDocs.FindField('CODDOCUMENTO').AsString}, 'NOSSONUMERO')
    else
       sNossoNumero := pNossoNumero;   //qryDocs.FieldByName('NOSSONUMERO').AsString;

    if NossoNumeroIsEmpty(sNossoNumero) then
       sNossoNumero := GeraNossoNumero( fCodPortForma, _cdsModelo.FieldByName('TAMNOSSONUMERO').asInteger );

    //busca Tipo Documento
    //if qryDocs.FindField('CODTIPDOC') = nil then
    if pCodTipDoc = '-1' then
       sCodTipoDoc := GetDadosDocumento(pCodDocumento {qryDocs.FindField('CODDOCUMENTO').AsString}, 'CODTIPDOC')
    else
       sCodTipoDoc := pNossoNumero;  //qryDocs.FieldByName('CODTIPDOC').AsString;

    //insere dados para impressao
    _cdsBloquete.data := GetDocsEmissao(sistema.IdEmpresa,
                                            0, 'N',
                                            0,
                                            0,
                                            fCodPortForma,
                                            0,
                                            false,
                                            strToIntDef(sCodTipoDoc, 0),
                                            StrToIntDef(Trim(pCodDocumento {qryDocs.FindField('CODDOCUMENTO').AsString}),0) );


    if not _cdsBloquete.isEmpty then
    begin
      //Valida o endereço do cliente no boleto
      _cdsDadosCedente.data := GetDadosCedente;

      { -----------------------------------------------------------------------------
        Insere os Registros do Bloqueto para Impressão
        ----------------------------------------------------------------------------- }
      if not CdsDados.Locate('CODDOCUMENTO', _cdsBloquete.FieldByName('CODDOCUMENTO').AsString,[]) then
      begin
        CdsDados.Append;
        CdsDados.FieldByName('CEP').AsString              := _cdsBloquete.FieldByName('CEP').AsString;
        CdsDados.FieldByName('CODESTADO').AsString        := _cdsBloquete.FieldByName('CODESTADO').AsString;
        CdsDados.FieldByName('CIDADE').AsString           := _cdsBloquete.FieldByName('CIDADE').AsString;
        CdsDados.FieldByName('BAIRRO').AsString           := _cdsBloquete.FieldByName('BAIRRO').AsString;
        CdsDados.FieldByName('COMPLEMENTO').AsString      := _cdsBloquete.FieldByName('COMPLEMENTO').AsString;
        CdsDados.FieldByName('NUMERO').AsString           := _cdsBloquete.FieldByName('NUMERO').AsString;
        CdsDados.FieldByName('LOGRADOURO').AsString       := _cdsBloquete.FieldByName('LOGRADOURO').AsString;
        CdsDados.FieldByName('NUMDOCUMENTO').AsString     := _cdsBloquete.FieldByName('NUMDOCUMENTO').AsString;

        CdsDados.FieldByName('IDPESSOA').AsInteger        := _cdsBloquete.FieldByName('IDPESSOA').AsInteger;
        CdsDados.FieldByName('EMAILFUNCEF').AsString      := _cdsBloquete.FieldByName('EMAILFUNCEF').AsString;
        CdsDados.FieldByName('MATRICULA').AsString        := ObtemMatricula(_cdsBloquete.FieldByName('IDPESSOA').AsInteger);
        CdsDados.FieldByName('MATR_TITULAR').AsString     := ObtemMatricula(_cdsBloquete.FieldByName('IDPESSOA').AsInteger, TRUE);

        CdsDados.FieldByName('NOME').AsString             := _cdsBloquete.FieldByName('NOME').AsString;
        CdsDados.FieldByName('VALORDESCONTO').AsString    := _cdsBloquete.FieldByName('VALORDESCONTO').AsString;
        CdsDados.FieldByName('DATALIMITE').AsString       := _cdsBloquete.FieldByName('DATALIMITE').AsString;
        CdsDados.FieldByName('DATAPROGRAMADA').AsString   := _cdsBloquete.FieldByName('DATAPROGRAMADA').AsString;
        CdsDados.FieldByName('CODPORTFORMA').AsString     := _cdsBloquete.FieldByName('CODPORTFORMA').AsString;
        CdsDados.FieldByName('DATAVENCTO').AsString       := _cdsBloquete.FieldByName('DATAVENCTO').AsString;
        CdsDados.FieldByName('DATAEMISSAO').AsString      := _cdsBloquete.FieldByName('DATAEMISSAO').AsString;
        CdsDados.FieldByName('DATADOCUMENTO').AsString    := _cdsBloquete.FieldByName('DATADOCUMENTO').AsString;
        CdsDados.FieldByName('NODOCUMENTO').AsString      := _cdsBloquete.FieldByName('NODOCUMENTO').AsString;
        CdsDados.FieldByName('MOESIGLA').AsString         := _cdsBloquete.FieldByName('MOESIGLA').AsString;
        CdsDados.FieldByName('CODDOCUMENTO').AsString     := _cdsBloquete.FieldByName('CODDOCUMENTO').AsString;
        CdsDados.FieldByName('TIPO').AsString             := _cdsBloquete.FieldByName('TIPO').AsString;
        CdsDados.FieldByName('COMPLDOCUMENTO').AsString   := _cdsBloquete.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDados.FieldByName('TIPOENDERECO').AsString     := _cdsBloquete.FieldByName('TIPOENDERECO').AsString;
        CdsDados.FieldByName('NUMAGENCIA').AsString       := _cdsBloquete.FieldByName('NUMAGENCIA').AsString;
        CdsDados.FieldByName('NUMCONTA').AsString         := _cdsBloquete.FieldByName('NUMCONTA').AsString;
        CdsDados.FieldByName('VALORJUROS').AsString       := _cdsBloquete.FieldByName('VALORJUROS').AsString;
        cdsDados.FieldByName('FLGGRUPO').AsString         := _cdsBloquete.FieldByName('FLGGRUPO').AsString;
        cdsDados.FieldByName('CODBARRADIG').AsString      := _cdsBloquete.FieldByName('CODBARRADIG').AsString;
        CdsDados.FieldByName('RSALDO').AsString           := _cdsBloquete.FieldByName('VALOR').AsString;
        CdsDados.FieldByName('RSALDOOUTRAMOEDA').AsString := _cdsBloquete.FieldByName('VALOROM').AsString;
        CdsDados.FieldByName('STATUS').AsString           := '1';
        CdsDados.FieldByName('EMISBLOQ').AsString         := 'S';
        CdsDados.FieldByName('DATAREMESSA').AsDateTime    := Date;
        CdsDados.FieldByName('NOSSONUMERO').AsString      := sNossoNumero;
        CdsDados.FieldByName('NUMEMPRESABANCO').AsString  := _cdsBloquete.FieldByName('NUMEMPRESABANCO').AsString;
        CdsDados.FieldByName('AGENCIACONVENIO').Value     := _cdsBloquete.FieldByName('AGENCIACONVENIO').Value;

        CdsDados.FieldByName('IDMODULO').AsInteger        := _cdsBloquete.FieldByName('IDMODULO').AsInteger;

        CdsDados.FieldByName('RAZAOSOCIAL_CEDENTE').AsString  := _CdsDadosCedente.FieldByName('RAZAOSOCIAL_CEDENTE').AsString;
        CdsDados.FieldByName('NUMDOCUMENTO_CEDENTE').AsString := _CdsDadosCedente.FieldByName('NUMDOCUMENTO_CEDENTE').AsString;
        CdsDados.FieldByName('ENDERECO_CEDENTE').AsString     := _CdsDadosCedente.FieldByName('ENDERECO_CEDENTE').AsString;

        CdsDados.FieldByName('CODIGODIVIDA').AsString := pCodDivida; //qryDocs.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsInteger;

        { ---------------------------------------------------------------------------------------
         determina como será o calculo do DV do Nosso Número de acordo com cada BANCO.
         ------------------------------------------------------------------------------------- }
        if NossoNumeroIsEmpty(sNossoNumero) then
        begin
          case CdsDados.FieldByName('IDMODULO').AsInteger of
             4,
             15,
             16,
             18,
             54,
             64,
             79,
             113,
             135,
             137,
             454,
             456,
             740: begin
                   If _cdsModelo.FieldByName('TAMNOSSONUMERO').asInteger < 15 then
                      CdsDados.FieldByName('NOSSONUMERO').AsString := CalculaDacNN(sNossoNumero, 11);
                  end;
          else
             CdsDados.FieldByName('NOSSONUMERO').AsString := IntToStr(CalculaDac(sNossoNumero, 11));
          end;
        end
        else
        begin
          If Length(CdsDados.FieldByName('NossoNumero').asString) = 10 then
             CdsDados.FieldByName('NossoNumero').asString := IntToStr(CalculaDac(CdsDados.FieldByName('NossoNumero').AsString, 11));
        end;
        {  ----------------------------------------------------------------------------- }

        if (_cdsModelo.FieldByName('TAMNOSSONUMERO').AsInteger >= 15 ) then
        begin
          CdsDados.FieldByName('CODBARRA').AsString    := MontaBarrasCEFSigcb(True);    //'01234567890123456789012345678901234567890123'
          CdsDados.FieldByName('CODBARRADIG').AsString := MontaBarrasCEFSigcb(False); //00186.99595  90309.403922  00152.059168         123'
        end
        else
        begin // demais
          CdsDados.FieldByName('CODBARRA').AsString    := MontaBarras(True);    //'01234567890123456789012345678901234567890123'
          CdsDados.FieldByName('CODBARRADIG').AsString := MontaBarras(False); //00186.99595  90309.403922  00152.059168         123'
        end;

        if CdsDados.FieldByName('MOESIGLA').IsNull then
           CdsDados.FieldByName('MOESIGLA').AsString := 'R$';

        CdsDadosCalcFields;

        CdsDados.Post;
      end;

    end; // if _cdsBloquete.isEmpty

    //qryDocs.next;
  end;

end;


function TCtrlGeraBoleto.AtualizaEmissaoDocumento(_CODDOCUMENTO : string): Boolean;
var
   query:TwwQuery;
begin
  query:=TwwQuery.Create(nil);
  query.DatabaseName:='BaseDados';
  query.Active:=False;
  query.SQL.Clear;

  result := true;

  try
    query.SQL.Add('UPDATE DOCUMENTO ');
    query.SQL.Add('   SET EMISBLOQ = ''S'' ');
    query.SQL.Add('WHERE CODDOCUMENTO ='+_CODDOCUMENTO);
    try
      query.ExecSql;
    except
      result := false;
    end;  
  Finally
     query.close;
     query.Destroy;
  end;
end;

end.

