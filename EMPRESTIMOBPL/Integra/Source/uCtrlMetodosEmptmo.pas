unit uCtrlMetodosEmptmo;
//***************************************************************************************
//Rotina.............: GetFormaPagto
//N. SIG.............: 101508
//Data da Alteração..: 03/09/2020
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Melhoria de performance na geração de arquivos.
//******************************************************************************
//Rotina.............: GetDadosMovimento
//N. SIG.............: 82314
//Data da Alteração..: 14/02/2019
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Alterada busca para utilizar a DATAPREVISTA como parâmetro.
//***************************************************************************************
//Rotina.............:
//N. SIG.............: 78915
//Data da Alteração..: 06/12/2018
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Criação de classe para nova geração do arquivo de remessa.
//***************************************************************************************

Interface

Uses Forms, Messages, Windows, Classes, SysUtils, Dialogs, Controls,
   uCMControlObject;

Type
  TCtrlMetodosEmptmo = Class(TCMControlObject)
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function GetHistMovEmptmo(pCodDocumento: Integer; pDataMov: TDate): OleVariant;
    function GetPortadorForma(pCodPortForma: Integer):OleVariant;
    function GetDadosContrato(pIdContrato: Double): OleVariant;
    function GetDadosRecebedor(pIdPessoa: Integer): OleVariant;
    function GetDadosMovimento(pCodDocumento: Integer; pDataPrevista: TDate): OleVariant;
    function GetFormaPagto: OleVariant;

  end;
implementation

{ TCtrlMetodosEmptmo }

constructor TCtrlMetodosEmptmo.Create;
begin
  inherited;

end;

destructor TCtrlMetodosEmptmo.Destroy;
begin
  inherited;

end;

function TCtrlMetodosEmptmo.GetDadosContrato(
  pIdContrato: Double): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT CON.IDCONTRATOEMPTMO, CON.IDINSCRICAOEMPTMO, CON.IDCONTRQUITACAO, CON.IDVERBA,    ' +#13#10+
          '       CON.FLGSITUACAO, CON.FLGFORMAREC, CON.PORTFORMAREC, CON.FLGFORMAPAG,              ' +#13#10+
          '       CON.CODFORMAPAG, CON.PORTFORMAPAG, CON.DATAASSINATURA, CON.DATACREDITO,           ' +#13#10+
          '       CON.DATAPRIMPARC, CON.DATACANC, CON.DATASITUACAO, CON.PRAZO,                      ' +#13#10+
          '       CON.VLRCONTRATO, CON.VLRPARCELA, CON.TXJUROS, CON.VLRPARCELAMES,                  ' +#13#10+
          '       CON.VLRPARCATRASO, CON.VLRDEBITO, CON.VLRRESERVA, CON.VLRSALDODEV,                ' +#13#10+
          '       CON.VLRPENDENCIA, CON.VLRSALBASE, CON.VLRMARGEM, CON.VLRMAXPERMIT,                ' +#13#10+
          '       CON.DATASALDODEV, CON.DATAPENDENCIA, CON.FLGSUSPENSAOAUTO, CON.IDTIPOSUSPEMPTMO,  ' +#13#10+
          '       CON.DATAINICIOSUSP, CON.DATAFIMSUSP, CON.ANOSUSPENSAO, CON.MESSUSPENSAO,          ' +#13#10+
          '       CON.USUARIOLIBSUSP, CON.DATALIBSUSP, CON.HORALIBSUSP, CON.IDEMPRESAPROP,          ' +#13#10+
          '       CON.IDPATRO, CON.IDTIPOCONTREMPTMO, CON.TCEDESCRICAO,                             ' +#13#10+
          '       CON.IDPLANOPREV, NVL(CON.IDPLANOORIGEM, CON.IDPLANOPREV) AS IDPLANOORIGEM,        ' +#13#10+
          '       CON.IDTIPOEMPTMO, CON.DESCTIPOEMPTMO, CON.IDPESSOA,                               ' +#13#10+
          '       CON.IDBENEF, CON.IDCBANCARIA, CON.IDCBANCARIADEB, CON.MOECODIGO,                  ' +#13#10+
          '       CON.MATRICULA, CON.MATRICULA_TIT, CON.INSCRICAONUMERO, CON.SALPARTICIPACAO,       ' +#13#10+
          '       CON.SALMANTIDO, CON.SALAUXDOENCA, CON.IDREGRAMARGEM, CON.IDREGRARESERVA,          ' +#13#10+
          '       CON.IDREGRAELEG, CON.IDREGRALIMITES, CON.TCEDIASVALIDINSC, CON.TCEDIASTOLERAINSC, ' +#13#10+
          '       CON.TCEMAXCONTRATO, CON.TCEMAXINSCR, CON.TCEMAXPARC, CON.TCEMINPARC,              ' +#13#10+
          '       CON.TCEMINQUIT, CON.TCEMINRENOVA, CON.FLGSEGURO, CON.IDSITPART,                   ' +#13#10+
          '       CON.FLGINTERNO, CON.SIT_TITULAR, CON.SITDESCRICAO, CON.IDUSUARIO,                 ' +#13#10+
          '       CON.NOME_TITULAR, CON.CPF_TITULAR, CON.NOME, CON.NOME_MUTUARIO,                   ' +#13#10+
          '       CON.NUMDOCUMENTO, CON.CPF_MUTUARIO,                                               ' +#13#10+
          '       CBA.CONTACORRENTE, 1 AS TIPOCONTA,                                                ' +#13#10+
          '       AGE.NUMAGENCIA, PAG.NOME AS NOMEAGENCIA,                                          ' +#13#10+
          '       BAN.NUMBANCO,                                                                     ' +#13#10+
          '       DCB.CONTACORRENTE AS CONTACORRENTEDEB,                                            ' +#13#10+
          '       1 AS TIPOCONTADEB,                                                                ' +#13#10+
          '       DAG.NUMAGENCIA AS NUMAGENCIADEB,                                                  ' +#13#10+
          '       DPA.NOME AS NOMEAGENCIADEB,                                                       ' +#13#10+
          '       DBA.NUMBANCO AS NUMBANCODEB                                                       ' +#13#10+
          '  FROM PESSOA          PAG,                                                              ' +#13#10+
          '       VWCONTRATOEP    CON,                                                              ' +#13#10+
          '       CONTABANCARIA   CBA,                                                              ' +#13#10+
          '       AGENCIABANCARIA AGE,                                                              ' +#13#10+
          '       BANCO           BAN,                                                              ' +#13#10+
          '       PESSOA          DPA,                                                              ' +#13#10+
          '       CONTABANCARIA   DCB,                                                              ' +#13#10+
          '       AGENCIABANCARIA DAG,                                                              ' +#13#10+
          '       BANCO           DBA                                                               ' +#13#10+
          ' WHERE CON.IDCONTRATOEMPTMO =  ' + FloatToStr(pIdContrato)                                   +#13#10+
          '   AND CON.IDCBANCARIA      = CBA.IDCBANCARIA                                            ' +#13#10+
          '   AND CBA.IDAGENCIA        = AGE.IDPESSOA                                               ' +#13#10+
          '   AND AGE.IDBANCO          = BAN.IDPESSOA                                               ' +#13#10+
          '   AND AGE.IDPESSOA         = PAG.IDPESSOA                                               ' +#13#10+
          '   AND CON.IDCBANCARIADEB   = DCB.IDCBANCARIA                                            ' +#13#10+
          '   AND DCB.IDAGENCIA        = DAG.IDPESSOA                                               ' +#13#10+
          '   AND DAG.IDBANCO          = DBA.IDPESSOA                                               ' +#13#10+
          '   AND DAG.IDPESSOA         = DPA.IDPESSOA                                               ' ;

  Result := GetDataPacket(sSQL);

end;

function TCtrlMetodosEmptmo.GetDadosMovimento(pCodDocumento: Integer;
  pDataPrevista: TDate): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT HC.IDHISTMOVEMPTMO AS IDHISTMOVEMPTMO,                                                                  ' +#13#10+
    		  '       HC.IDCONTRATOEMPTMO AS IDCONTRATOEMPTMO,                                                                ' +#13#10+
    		  '       0 AS HMETIPOMOV,                                                                                        ' +#13#10+
    		  '       HC.IDITEMEMPTMO AS IDITEMEMPTMO,                                                                        ' +#13#10+
    		  '	      HC.ORIGEM AS HMEORIGEM,                                                                                 ' +#13#10+
    		  '       HC.PARCELA AS HMEPARCELA,                                                                               ' +#13#10+
    		  '	      HC.FORMACOBRANCA AS HMEFORMACOBRANCA,                                                                   ' +#13#10+
    		  '	      DECODE(HC.NATUREZAITEM, 2, 1, 0) AS HMECENTRALIZA,                                                      ' +#13#10+
    		  '       DECODE(HC.NATUREZAITEM, 1, 1, 0) AS HMEDESTACADO,                                                       ' +#13#10+
    		  '       HC.DATAPREVISTA AS HMEDATA,                                                                             ' +#13#10+
    		  '       HC.DATAPREVISTA AS HMEDATPREVISTA,                                                                      ' +#13#10+
  	  	  '       HC.DATAVENCTO AS HMEDATAVENCTO,                                                                         ' +#13#10+
	    	  '       HC.DATAEFETIVA AS HMEDATEFETIVA,                                                                        ' +#13#10+
		      '       HC.DATAPREVISTA AS HMEDATAATUALIZA,                                                                     ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HC.DATAPREVISTA, ''YYYY'') ) AS HMEANOCOMPETENCIA,                                    ' +#13#10+
		      '       TO_NUMBER(TO_CHAR(HC.DATAPREVISTA, ''MM'') ) AS HMEMESCOMPETENCIA,                                      ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HC.DATAVENCTO, ''YYYY'') ) AS HMEANOCOBRANCA,                                         ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HC.DATAVENCTO, ''MM'') ) HMEMESCOBRANCA,                                              ' +#13#10+
    		  '       ABS(HC.VLRPREVISTO) AS HMEVLRPREVISTO,                                                                  ' +#13#10+
    		  '       HC.VLREFETIVO AS HMEVLREFETIVO,                                                                         ' +#13#10+
    		  '       HC.SALDODEV AS HMESALDODEV,                                                                             ' +#13#10+
    		  '       CE.TXJUROS AS HMETXJUROS,                                                                               ' +#13#10+
  	  	  '       HC.FLGESTORNADO AS FLGESTORNADO,                                                                        ' +#13#10+
    		  '       HC.FLGBAIXADO AS FLGBAIXADO,                                                                            ' +#13#10+
    		  '       CAST(NULL AS NUMBER) AS FLGABONADO,                                                                     ' +#13#10+
    		  '       HC.FLGENVIO AS FLGENVIO,                                                                                ' +#13#10+
    		  '       HC.RECPAG AS HMERECPAG,                                                                                 ' +#13#10+
    		  '       CE.IDBENEF AS IDBENEF,                                                                                  ' +#13#10+
    		  '       CBA.CONTACORRENTE,                                                                                      ' +#13#10+
    		  '       1 AS TIPOCONTA,                                                                                         ' +#13#10+
    		  '	      AGE.NUMAGENCIA,                                                                                         ' +#13#10+
    		  '	      PAG.NOME AS NOMEAGENCIA,                                                                                ' +#13#10+
    		  '	      BAN.NUMBANCO,                                                                                           ' +#13#10+
    		  '	      DCB.CONTACORRENTE AS CONTACORRENTEDEB,                                                                  ' +#13#10+
    		  '	      1 AS TIPOCONTADEB,                                                                                      ' +#13#10+
    		  '	      DAG.NUMAGENCIA AS NUMAGENCIADEB,                                                                        ' +#13#10+
    		  '	      DPA.NOME AS NOMEAGENCIADEB,                                                                             ' +#13#10+
    		  '	      DBA.NUMBANCO AS NUMBANCODEB,                                                                            ' +#13#10+
    		  '	      ENP.LOGRADOURO,                                                                                         ' +#13#10+
    		  '	      ENP.NUMERO,                                                                                             ' +#13#10+
    		  '	      ENP.COMPLEMENTO,                                                                                        ' +#13#10+
    		  '       ENP.BAIRRO,                                                                                             ' +#13#10+
    		  '       CID.NOME AS CIDADE,                                                                                     ' +#13#10+
    		  '       EST.CODESTADO,                                                                                          ' +#13#10+
		      '       ENP.CEP,                                                                                                ' +#13#10+
    		  '       NVL(PES.NUMDOCUMENTO, DOC.NUMDOCUMENTO) AS NUMDOCUMENTO,                                                ' +#13#10+
		      '       PES.NOME                                                                                                ' +#13#10+
    		  '  FROM HMECONCESSAO HC                                                                                         ' +#13#10+
    		  '  JOIN HMEENVIO HE ON HE.IDHISTMOVEMPTMO = HC.IDHISTMOVEMPTMO                                                  ' +#13#10+
    		  '   AND HE.CODDOCUMENTO = '+ IntToStr(pCodDocumento)                                                              +#13#10+
    		  '  JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = HC.IDCONTRATOEMPTMO                                          ' +#13#10+
    		  '  JOIN CONTABANCARIA CBA ON CE.IDCBANCARIA = CBA.IDCBANCARIA                                                   ' +#13#10+
    		  '  JOIN AGENCIABANCARIA AGE ON CBA.IDAGENCIA = AGE.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN CONTABANCARIA  DCB ON CE.IDCBANCARIADEB = DCB.IDCBANCARIA                                               ' +#13#10+
    		  '  JOIN AGENCIABANCARIA DAG ON DCB.IDAGENCIA = DAG.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN BANCO BAN ON AGE.IDBANCO = BAN.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA DPA ON DAG.IDPESSOA = DPA.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN PESSOA PAG ON AGE.IDPESSOA = PAG.IDPESSOA                                                               ' +#13#10+
		      '  JOIN BANCO DBA ON DAG.IDBANCO = DBA.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA PES ON PES.IDPESSOA = CE.IDBENEF		                                                              ' +#13#10+
    		  '  LEFT JOIN ENDPESS ENP ON ENP.IDPESSOA = PES.IDPESSOA AND ENP.IDENDERECO = PES.IDENDRESIDENCIAL               ' +#13#10+
    		  '  LEFT JOIN DOCPESSOA DOC ON DOC.IDPESSOA = PES.IDPESSOA AND DOC.IDDOCUMENTO IN (1,2)                          ' +#13#10+
    		  '  LEFT JOIN CIDADES CID ON CID.IDCIDADES = ENP.IDCIDADES                                                       ' +#13#10+
    		  '  LEFT JOIN ESTADO EST ON EST.IDESTADO = CID.IDESTADO                                                          ' +#13#10+
    		  ' WHERE HC.DATAPREVISTA = TO_DATE(' + QuotedStr(DateToStr(pDataPrevista)) + ', ''DD/MM/YYYY'')                  ' +#13#10+
    		  ' UNION                                                                                                         ' +#13#10+
		      'SELECT HP.IDHISTMOVEMPTMO AS IDHISTMOVEMPTMO,                                                                  ' +#13#10+
    		  '       HP.IDCONTRATOEMPTMO AS IDCONTRATOEMPTMO,                                                                ' +#13#10+
    		  '       1 AS HMETIPOMOV,                                                                                        ' +#13#10+
    		  '       HP.IDITEMEMPTMO AS IDITEMEMPTMO,                                                                        ' +#13#10+
    		  '	      HP.ORIGEM AS HMEORIGEM,                                                                                 ' +#13#10+
    		  '       HP.PARCELA AS HMEPARCELA,                                                                               ' +#13#10+
		      '	      HP.FORMACOBRANCA AS HMEFORMACOBRANCA,                                                                   ' +#13#10+
    		  '	      DECODE(HP.NATUREZAITEM, 2, 1, 0) AS HMECENTRALIZA,                                                      ' +#13#10+
    		  '       DECODE(HP.NATUREZAITEM, 1, 1, 0) AS HMEDESTACADO,                                                       ' +#13#10+
    		  '       HP.DATAPREVISTA AS HMEDATA,                                                                             ' +#13#10+
    		  '       HP.DATAPREVISTA AS HMEDATPREVISTA,                                                                      ' +#13#10+
    		  '       HP.DATAVENCTO AS HMEDATAVENCTO,                                                                         ' +#13#10+
    		  '       HP.DATAEFETIVA AS HMEDATEFETIVA,                                                                        ' +#13#10+
    		  '       HP.DATAPREVISTA AS HMEDATAATUALIZA,                                                                     ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HP.DATAPREVISTA, ''YYYY'') ) AS HMEANOCOMPETENCIA,                                    ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HP.DATAPREVISTA, ''MM'') ) AS HMEMESCOMPETENCIA,                                      ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HP.DATAVENCTO, ''YYYY'') ) AS HMEANOCOBRANCA,                                         ' +#13#10+
		      '       TO_NUMBER(TO_CHAR(HP.DATAVENCTO, ''MM'') ) HMEMESCOBRANCA,                                              ' +#13#10+
    		  '       ABS(HP.VLRPREVISTO) AS HMEVLRPREVISTO,                                                                  ' +#13#10+
    		  '       HP.VLREFETIVO AS HMEVLREFETIVO,                                                                         ' +#13#10+
    		  '       HP.SALDODEV AS HMESALDODEV,                                                                             ' +#13#10+
    		  '       CE.TXJUROS AS HMETXJUROS,                                                                               ' +#13#10+
    		  '       DECODE(HP.FLGQUITABONOESTORNO,3,1,0) AS FLGESTORNADO,                                                   ' +#13#10+
    		  '       CAST(DECODE(HP.FLGBAIXADO, 1, NULL, 0) AS NUMBER) AS FLGBAIXADO,                                        ' +#13#10+
    		  '       DECODE(HP.FLGQUITABONOESTORNO,2,1,0) AS FLGABONADO,                                                     ' +#13#10+
		      '       CAST(DECODE(HP.FLGENVIO, 1, NULL, 0) AS NUMBER) AS FLGENVIO,                                            ' +#13#10+
    		  '       ''R'' AS HMERECPAG,                                                                                     ' +#13#10+
    		  '       CE.IDBENEF AS IDBENEF,                                                                                  ' +#13#10+
    		  '       CBA.CONTACORRENTE,                                                                                      ' +#13#10+
    		  '       1 AS TIPOCONTA,                                                                                         ' +#13#10+
    		  '	      AGE.NUMAGENCIA,                                                                                         ' +#13#10+
    		  '	      PAG.NOME AS NOMEAGENCIA,                                                                                ' +#13#10+
    		  '	      BAN.NUMBANCO,                                                                                           ' +#13#10+
    		  '	      DCB.CONTACORRENTE AS CONTACORRENTEDEB,                                                                  ' +#13#10+
    		  '	      1 AS TIPOCONTADEB,                                                                                      ' +#13#10+
    		  '	      DAG.NUMAGENCIA AS NUMAGENCIADEB,                                                                        ' +#13#10+
    		  '	      DPA.NOME AS NOMEAGENCIADEB,                                                                             ' +#13#10+
    		  '	      DBA.NUMBANCO AS NUMBANCODEB,                                                                            ' +#13#10+
    		  '	      ENP.LOGRADOURO,                                                                                         ' +#13#10+
    		  '	      ENP.NUMERO,                                                                                             ' +#13#10+
    		  '	      ENP.COMPLEMENTO,                                                                                        ' +#13#10+
    		  '       ENP.BAIRRO,                                                                                             ' +#13#10+
    		  '       CID.NOME AS CIDADE,                                                                                     ' +#13#10+
    		  '       EST.CODESTADO,                                                                                          ' +#13#10+
    		  '       ENP.CEP,                                                                                                ' +#13#10+
    		  '       NVL(PES.NUMDOCUMENTO, DOC.NUMDOCUMENTO) AS NUMDOCUMENTO,                                                ' +#13#10+
    		  '       PES.NOME                                                                                                ' +#13#10+
    		  '  FROM HMEPRESTACAO  HP                                                                                        ' +#13#10+
    		  '  JOIN HMEENVIO HE ON HE.IDHISTMOVEMPTMO = HP.IDHISTMOVEMPTMO                                                  ' +#13#10+
    		  '   AND HE.CODDOCUMENTO = '+ IntToStr(pCodDocumento)                                                              +#13#10+
    		  '  JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = HP.IDCONTRATOEMPTMO                                          ' +#13#10+
    		  '  JOIN CONTABANCARIA CBA ON CE.IDCBANCARIA = CBA.IDCBANCARIA                                                   ' +#13#10+
    		  '  JOIN AGENCIABANCARIA AGE ON CBA.IDAGENCIA = AGE.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN CONTABANCARIA DCB ON CE.IDCBANCARIADEB = DCB.IDCBANCARIA                                                ' +#13#10+
    		  '  JOIN AGENCIABANCARIA DAG ON DCB.IDAGENCIA = DAG.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN BANCO BAN ON AGE.IDBANCO = BAN.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA DPA ON DAG.IDPESSOA = DPA.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN PESSOA PAG ON AGE.IDPESSOA = PAG.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN BANCO DBA ON DAG.IDBANCO = DBA.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA PES ON PES.IDPESSOA = CE.IDBENEF		                                                              ' +#13#10+
    		  '  LEFT JOIN ENDPESS ENP ON ENP.IDPESSOA = PES.IDPESSOA AND ENP.IDENDERECO = PES.IDENDRESIDENCIAL               ' +#13#10+
    		  '  LEFT JOIN DOCPESSOA DOC ON DOC.IDPESSOA = PES.IDPESSOA AND DOC.IDDOCUMENTO IN (1,2)                          ' +#13#10+
    		  '  LEFT JOIN CIDADES CID ON CID.IDCIDADES = ENP.IDCIDADES                                                       ' +#13#10+
    		  '  LEFT JOIN ESTADO EST ON EST.IDESTADO = CID.IDESTADO                                                          ' +#13#10+
    		  ' WHERE HP.DATAPREVISTA = TO_DATE(' + QuotedStr(DateToStr(pDataPrevista)) + ', ''DD/MM/YYYY'')                  ' +#13#10+
    		  ' UNION                                                                                                         ' +#13#10+
    		  'SELECT HA.IDHISTMOVEMPTMO AS IDHISTMOVEMPTMO,                                                                  ' +#13#10+
    		  '       HA.IDCONTRATOEMPTMO AS IDCONTRATOEMPTMO,                                                                ' +#13#10+
    		  '       2 AS HMETIPOMOV,                                                                                        ' +#13#10+
    		  '       HA.IDITEMEMPTMO AS IDITEMEMPTMO,                                                                        ' +#13#10+
    		  '	      HA.ORIGEM AS HMEORIGEM,                                                                                 ' +#13#10+
    		  '       HA.PARCELA AS HMEPARCELA,                                                                               ' +#13#10+
    		  '	      HA.FORMACOBRANCA AS HMEFORMACOBRANCA,                                                                   ' +#13#10+
    		  '	      DECODE(HA.NATUREZAITEM, 2, 1, 0) AS HMECENTRALIZA,                                                      ' +#13#10+
    		  '       DECODE(HA.NATUREZAITEM, 1, 1, 0) AS HMEDESTACADO,                                                       ' +#13#10+
    		  '       HA.DATAPREVISTA AS HMEDATA,                                                                             ' +#13#10+
    		  '       HA.DATAPREVISTA AS HMEDATPREVISTA,                                                                      ' +#13#10+
    		  '       HA.DATAVENCTO AS HMEDATAVENCTO,                                                                         ' +#13#10+
    		  '       HA.DATAEFETIVA AS HMEDATEFETIVA,                                                                        ' +#13#10+
    		  '       HA.DATAPREVISTA AS HMEDATAATUALIZA,                                                                     ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HA.DATAPREVISTA, ''YYYY'') ) AS HMEANOCOMPETENCIA,                                    ' +#13#10+
		      '       TO_NUMBER(TO_CHAR(HA.DATAPREVISTA, ''MM'') ) AS HMEMESCOMPETENCIA,                                      ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HA.DATAVENCTO, ''YYYY'') ) AS HMEANOCOBRANCA,                                         ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HA.DATAVENCTO, ''MM'') ) HMEMESCOBRANCA,                                              ' +#13#10+
    		  '       ABS(HA.VLRPREVISTO) AS HMEVLRPREVISTO,                                                                  ' +#13#10+
    		  '       HA.VLREFETIVO AS HMEVLREFETIVO,                                                                         ' +#13#10+
    		  '       HA.SALDODEV AS HMESALDODEV,                                                                             ' +#13#10+
    		  '       CE.TXJUROS AS HMETXJUROS,                                                                               ' +#13#10+
    		  '       DECODE(HA.FLGQUITABONOESTORNO,3,1,0) AS FLGESTORNADO,                                                   ' +#13#10+
    		  '       CAST(DECODE(HA.FLGBAIXADO, 1, NULL, 0) AS NUMBER)AS FLGBAIXADO,                                         ' +#13#10+
    		  '       DECODE(HA.FLGQUITABONOESTORNO,2,1,0) AS FLGABONADO,                                                     ' +#13#10+
    		  '       CAST(DECODE(HA.FLGENVIO, 1, NULL, 0) AS NUMBER) AS FLGENVIO,                                            ' +#13#10+
    		  '       ''R'' AS HMERECPAG,                                                                                     ' +#13#10+
    		  '       CE.IDBENEF AS IDBENEF,                                                                                  ' +#13#10+
    		  '       CBA.CONTACORRENTE,                                                                                      ' +#13#10+
    		  '       1 AS TIPOCONTA,                                                                                         ' +#13#10+
    		  '	      AGE.NUMAGENCIA,                                                                                         ' +#13#10+
    		  '	      PAG.NOME AS NOMEAGENCIA,                                                                                ' +#13#10+
    		  '	      BAN.NUMBANCO,                                                                                           ' +#13#10+
    		  '	      DCB.CONTACORRENTE AS CONTACORRENTEDEB,                                                                  ' +#13#10+
    		  '	      1 AS TIPOCONTADEB,                                                                                      ' +#13#10+
    		  '	      DAG.NUMAGENCIA AS NUMAGENCIADEB,                                                                        ' +#13#10+
    		  '	      DPA.NOME AS NOMEAGENCIADEB,                                                                             ' +#13#10+
    		  '	      DBA.NUMBANCO AS NUMBANCODEB,                                                                            ' +#13#10+
    		  '	      ENP.LOGRADOURO,                                                                                         ' +#13#10+
    		  '	      ENP.NUMERO,                                                                                             ' +#13#10+
    		  '	      ENP.COMPLEMENTO,                                                                                        ' +#13#10+
    		  '       ENP.BAIRRO,                                                                                             ' +#13#10+
    		  '       CID.NOME AS CIDADE,                                                                                     ' +#13#10+
    		  '       EST.CODESTADO,                                                                                          ' +#13#10+
    		  '       ENP.CEP,                                                                                                ' +#13#10+
    		  '       NVL(PES.NUMDOCUMENTO, DOC.NUMDOCUMENTO) AS NUMDOCUMENTO,                                                ' +#13#10+
    		  '       PES.NOME                                                                                                ' +#13#10+
    		  '  FROM HMEAMORTIZACAO HA                                                                                       ' +#13#10+
    		  '  JOIN HMEENVIO HE ON HE.IDHISTMOVEMPTMO = HA.IDHISTMOVEMPTMO                                                  ' +#13#10+
    		  '   AND HE.CODDOCUMENTO = '+ IntToStr(pCodDocumento)                                                              +#13#10+
    		  '  JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = HA.IDCONTRATOEMPTMO                                          ' +#13#10+
    		  '  JOIN CONTABANCARIA CBA ON CE.IDCBANCARIA = CBA.IDCBANCARIA                                                   ' +#13#10+
    		  '  JOIN AGENCIABANCARIA AGE ON CBA.IDAGENCIA = AGE.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN CONTABANCARIA DCB ON CE.IDCBANCARIADEB = DCB.IDCBANCARIA                                                ' +#13#10+
    		  '  JOIN AGENCIABANCARIA DAG ON DCB.IDAGENCIA = DAG.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN BANCO BAN ON AGE.IDBANCO = BAN.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA DPA ON DAG.IDPESSOA = DPA.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN PESSOA PAG ON AGE.IDPESSOA = PAG.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN BANCO DBA ON DAG.IDBANCO = DBA.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA PES ON PES.IDPESSOA = CE.IDBENEF		                                                              ' +#13#10+
    		  '  LEFT JOIN ENDPESS ENP ON ENP.IDPESSOA = PES.IDPESSOA AND ENP.IDENDERECO = PES.IDENDRESIDENCIAL               ' +#13#10+
    		  '  LEFT JOIN DOCPESSOA DOC ON DOC.IDPESSOA = PES.IDPESSOA AND DOC.IDDOCUMENTO IN (1,2)                          ' +#13#10+
    		  '  LEFT JOIN CIDADES CID ON CID.IDCIDADES = ENP.IDCIDADES                                                       ' +#13#10+
    		  '  LEFT JOIN ESTADO EST ON EST.IDESTADO = CID.IDESTADO                                                          ' +#13#10+
		      ' WHERE HA.DATAPREVISTA = TO_DATE(' + QuotedStr(DateToStr(pDataPrevista)) + ', ''DD/MM/YYYY'')                  ' +#13#10+
    		  ' UNION                                                                                                         ' +#13#10+
    		  'SELECT HQ.IDHISTMOVEMPTMO AS IDHISTMOVEMPTMO,                                                                  ' +#13#10+
    		  '       HQ.IDCONTRATOEMPTMO AS IDCONTRATOEMPTMO,                                                                ' +#13#10+
    		  '       3 AS HMETIPOMOV,                                                                                        ' +#13#10+
    		  '       HQ.IDITEMEMPTMO AS IDITEMEMPTMO,                                                                        ' +#13#10+
    		  '	      HQ.ORIGEM AS HMEORIGEM,                                                                                 ' +#13#10+
		      '       0 AS HMEPARCELA,                                                                                        ' +#13#10+
    		  '	      HQ.FORMACOBRANCA AS HMEFORMACOBRANCA,                                                                   ' +#13#10+
    		  '	      DECODE(HQ.NATUREZAITEM, 2, 1, 0) AS HMECENTRALIZA,                                                      ' +#13#10+
    		  '       DECODE(HQ.NATUREZAITEM, 1, 1, 0) AS HMEDESTACADO,                                                       ' +#13#10+
    		  '       HQ.DATAPREVISTA AS HMEDATA,                                                                             ' +#13#10+
    		  '       HQ.DATAPREVISTA AS HMEDATPREVISTA,                                                                      ' +#13#10+
    		  '       HQ.DATAVENCTO AS HMEDATAVENCTO,                                                                         ' +#13#10+
    		  '       HQ.DATAEFETIVA AS HMEDATEFETIVA,                                                                        ' +#13#10+
    		  '       HQ.DATAPREVISTA AS HMEDATAATUALIZA,                                                                     ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HQ.DATAPREVISTA, ''YYYY'') ) AS HMEANOCOMPETENCIA,                                    ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HQ.DATAPREVISTA, ''MM'') ) AS HMEMESCOMPETENCIA,                                      ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HQ.DATAVENCTO, ''YYYY'') ) AS HMEANOCOBRANCA,                                         ' +#13#10+
		      '       TO_NUMBER(TO_CHAR(HQ.DATAVENCTO, ''MM'') ) HMEMESCOBRANCA,                                              ' +#13#10+
    		  '       ABS(HQ.VLRPREVISTO) AS HMEVLRPREVISTO,                                                                  ' +#13#10+
    		  '       HQ.VLREFETIVO AS HMEVLREFETIVO,                                                                         ' +#13#10+
    		  '       HQ.SALDODEV AS HMESALDODEV,                                                                             ' +#13#10+
		      '       CE.TXJUROS AS HMETXJUROS,                                                                               ' +#13#10+
    		  '       HQ.FLGESTORNADO AS FLGESTORNADO,                                                                        ' +#13#10+
  	  	  '       CAST(DECODE(HQ.FLGBAIXADO, 1, NULL, 0) AS NUMBER) AS FLGBAIXADO,                                        ' +#13#10+
  	   	  '       CAST(NULL AS NUMBER) AS FLGABONADO,                                                                     ' +#13#10+
    	 	  '       CAST(DECODE(HQ.FLGENVIO, 1, NULL, 0) AS NUMBER) AS FLGENVIO,                                            ' +#13#10+
    		  '       ''R'' AS HMERECPAG,                                                                                     ' +#13#10+
    		  '       CE.IDBENEF AS IDBENEF,                                                                                  ' +#13#10+
    		  '       CBA.CONTACORRENTE,                                                                                      ' +#13#10+
    		  '       1 AS TIPOCONTA,                                                                                         ' +#13#10+
    		  '	      AGE.NUMAGENCIA,                                                                                         ' +#13#10+
    		  '	      PAG.NOME AS NOMEAGENCIA,                                                                                ' +#13#10+
    		  '	      BAN.NUMBANCO,                                                                                           ' +#13#10+
          '	      DCB.CONTACORRENTE AS CONTACORRENTEDEB,                                                                  ' +#13#10+
    		  '	      1 AS TIPOCONTADEB,                                                                                      ' +#13#10+
    		  '	      DAG.NUMAGENCIA AS NUMAGENCIADEB,                                                                        ' +#13#10+
    		  '	      DPA.NOME AS NOMEAGENCIADEB,                                                                             ' +#13#10+
    		  '	      DBA.NUMBANCO AS NUMBANCODEB,                                                                            ' +#13#10+
    		  '	      ENP.LOGRADOURO,                                                                                         ' +#13#10+
    		  '	      ENP.NUMERO,                                                                                             ' +#13#10+
    		  '	      ENP.COMPLEMENTO,                                                                                        ' +#13#10+
    		  '       ENP.BAIRRO,                                                                                             ' +#13#10+
    		  '       CID.NOME AS CIDADE,                                                                                     ' +#13#10+
    		  '       EST.CODESTADO,                                                                                          ' +#13#10+
    		  '       ENP.CEP,                                                                                                ' +#13#10+
    		  '       NVL(PES.NUMDOCUMENTO, DOC.NUMDOCUMENTO) AS NUMDOCUMENTO,                                                ' +#13#10+
    		  '       PES.NOME                                                                                                ' +#13#10+
    		  '  FROM HMEQUITACAO HQ                                                                                          ' +#13#10+
    		  '  JOIN HMEENVIO HE ON HE.IDHISTMOVEMPTMO = HQ.IDHISTMOVEMPTMO                                                  ' +#13#10+
    		  '   AND HE.CODDOCUMENTO = '+ IntToStr(pCodDocumento)                                                              +#13#10+
		      '  JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = HQ.IDCONTRATOEMPTMO                                          ' +#13#10+
    		  '  JOIN CONTABANCARIA CBA ON CE.IDCBANCARIA = CBA.IDCBANCARIA                                                   ' +#13#10+
    		  '  JOIN AGENCIABANCARIA AGE ON CBA.IDAGENCIA = AGE.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN CONTABANCARIA DCB ON CE.IDCBANCARIADEB = DCB.IDCBANCARIA                                                ' +#13#10+
    		  '  JOIN AGENCIABANCARIA DAG ON DCB.IDAGENCIA = DAG.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN BANCO BAN ON AGE.IDBANCO = BAN.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA DPA ON DAG.IDPESSOA = DPA.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN PESSOA PAG ON AGE.IDPESSOA = PAG.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN BANCO DBA ON DAG.IDBANCO = DBA.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA PES ON PES.IDPESSOA = CE.IDBENEF		                                                              ' +#13#10+
    		  '  LEFT JOIN ENDPESS ENP ON ENP.IDPESSOA = PES.IDPESSOA AND ENP.IDENDERECO = PES.IDENDRESIDENCIAL               ' +#13#10+
    		  '  LEFT JOIN DOCPESSOA DOC ON DOC.IDPESSOA = PES.IDPESSOA AND DOC.IDDOCUMENTO IN (1,2)                          ' +#13#10+
    		  '  LEFT JOIN CIDADES CID ON CID.IDCIDADES = ENP.IDCIDADES                                                       ' +#13#10+
    		  '  LEFT JOIN ESTADO EST ON EST.IDESTADO = CID.IDESTADO                                                          ' +#13#10+
    		  ' WHERE HQ.DATAPREVISTA = TO_DATE(' + QuotedStr(DateToStr(pDataPrevista)) + ', ''DD/MM/YYYY'')                  ' +#13#10+
    		  ' UNION                                                                                                         ' +#13#10+
    		  'SELECT HE.IDHISTMOVEMPTMO AS IDHISTMOVEMPTMO,                                                                  ' +#13#10+
    		  '       HE.IDCONTRATOEMPTMO AS IDCONTRATOEMPTMO,                                                                ' +#13#10+
    		  '       4 AS HMETIPOMOV,                                                                                        ' +#13#10+
    		  '       HE.IDITEMEMPTMO AS IDITEMEMPTMO,                                                                        ' +#13#10+
    		  '	      HE.ORIGEM AS HMEORIGEM,                                                                                 ' +#13#10+
    		  '       0 AS HMEPARCELA,                                                                                        ' +#13#10+
    		  '	      HE.FORMACOBRANCA AS HMEFORMACOBRANCA,                                                                   ' +#13#10+
    		  '	      DECODE(HE.NATUREZAITEM, 2, 1, 0) AS HMECENTRALIZA,                                                      ' +#13#10+
    		  '       DECODE(HE.NATUREZAITEM, 1, 1, 0) AS HMEDESTACADO,                                                       ' +#13#10+
    		  '       HE.DATAPREVISTA AS HMEDATA,                                                                             ' +#13#10+
    		  '       HE.DATAPREVISTA AS HMEDATPREVISTA,                                                                      ' +#13#10+
    		  '       HE.DATAVENCTO AS HMEDATAVENCTO,                                                                         ' +#13#10+
		      '       HE.DATAEFETIVA AS HMEDATEFETIVA,                                                                        ' +#13#10+
    		  '       HE.DATAPREVISTA AS HMEDATAATUALIZA,                                                                     ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HE.DATAPREVISTA, ''YYYY'') ) AS HMEANOCOMPETENCIA,                                    ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HE.DATAPREVISTA, ''MM'') ) AS HMEMESCOMPETENCIA,                                      ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HE.DATAVENCTO, ''YYYY'') ) AS HMEANOCOBRANCA,                                         ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HE.DATAVENCTO, ''MM'') ) HMEMESCOBRANCA,                                              ' +#13#10+
    		  '       ABS(HE.VLRPREVISTO) AS HMEVLRPREVISTO,                                                                  ' +#13#10+
    		  '       HE.VLREFETIVO AS HMEVLREFETIVO,                                                                         ' +#13#10+
    		  '       HE.SALDODEV AS HMESALDODEV,                                                                             ' +#13#10+
    		  '       CE.TXJUROS AS HMETXJUROS,                                                                               ' +#13#10+
    		  '       DECODE(HE.FLGQUITABONOESTORNO,3,1,0) AS FLGESTORNADO,                                                   ' +#13#10+
    		  '       CAST(DECODE(HE.FLGBAIXADO, 1, NULL, 0) AS NUMBER) AS FLGBAIXADO,                                        ' +#13#10+
    		  '       CAST(NULL AS NUMBER) AS FLGABONADO,                                                                     ' +#13#10+
    		  '       CAST(DECODE(HE.FLGENVIO, 1, NULL, 0) AS NUMBER) AS FLGENVIO,                                            ' +#13#10+
    		  '       HE.RECPAG AS HMERECPAG,                                                                                 ' +#13#10+
    		  '       CE.IDBENEF AS IDBENEF,                                                                                  ' +#13#10+
    		  '       CBA.CONTACORRENTE,                                                                                      ' +#13#10+
		      '       1 AS TIPOCONTA,                                                                                         ' +#13#10+
    		  '	      AGE.NUMAGENCIA,                                                                                         ' +#13#10+
    		  '	      PAG.NOME AS NOMEAGENCIA,                                                                                ' +#13#10+
    		  '	      BAN.NUMBANCO,                                                                                           ' +#13#10+
    		  '	      DCB.CONTACORRENTE AS CONTACORRENTEDEB,                                                                  ' +#13#10+
    		  '	      1 AS TIPOCONTADEB,                                                                                      ' +#13#10+
    		  '	      DAG.NUMAGENCIA AS NUMAGENCIADEB,                                                                        ' +#13#10+
    		  '	      DPA.NOME AS NOMEAGENCIADEB,                                                                             ' +#13#10+
    		  '	      DBA.NUMBANCO AS NUMBANCODEB,                                                                            ' +#13#10+
    		  '	      ENP.LOGRADOURO,                                                                                         ' +#13#10+
    		  '	      ENP.NUMERO,                                                                                             ' +#13#10+
     		  '	      ENP.COMPLEMENTO,                                                                                        ' +#13#10+
    		  '       ENP.BAIRRO,                                                                                             ' +#13#10+
		      '       CID.NOME AS CIDADE,                                                                                     ' +#13#10+
    		  '       EST.CODESTADO,                                                                                          ' +#13#10+
    		  '       ENP.CEP,                                                                                                ' +#13#10+
    		  '       NVL(PES.NUMDOCUMENTO, DOC.NUMDOCUMENTO) AS NUMDOCUMENTO,                                                ' +#13#10+
    		  '       PES.NOME                                                                                                ' +#13#10+
          '  FROM HMEENCARGOS HE                                                                                          ' +#13#10+
    		  '  JOIN HMEENVIO HM ON HM.IDHISTMOVEMPTMO = HE.IDHISTMOVEMPTMO                                                  ' +#13#10+
    		  '   AND HM.CODDOCUMENTO = '+ IntToStr(pCodDocumento)                                                              +#13#10+
    		  '  JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = HE.IDCONTRATOEMPTMO                                          ' +#13#10+
    		  '  JOIN CONTABANCARIA CBA ON CE.IDCBANCARIA = CBA.IDCBANCARIA                                                   ' +#13#10+
    		  '  JOIN AGENCIABANCARIA AGE ON CBA.IDAGENCIA = AGE.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN CONTABANCARIA DCB ON CE.IDCBANCARIADEB = DCB.IDCBANCARIA                                                ' +#13#10+
    		  '  JOIN AGENCIABANCARIA DAG ON DCB.IDAGENCIA = DAG.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN BANCO BAN ON AGE.IDBANCO = BAN.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA DPA ON DAG.IDPESSOA = DPA.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN PESSOA PAG ON AGE.IDPESSOA = PAG.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN BANCO DBA ON DAG.IDBANCO = DBA.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA PES ON PES.IDPESSOA = CE.IDBENEF		                                                              ' +#13#10+
    		  '  LEFT JOIN ENDPESS ENP ON ENP.IDPESSOA = PES.IDPESSOA AND ENP.IDENDERECO = PES.IDENDRESIDENCIAL               ' +#13#10+
    		  '  LEFT JOIN DOCPESSOA DOC ON DOC.IDPESSOA = PES.IDPESSOA AND DOC.IDDOCUMENTO IN (1,2)                          ' +#13#10+
    		  '  LEFT JOIN CIDADES CID ON CID.IDCIDADES = ENP.IDCIDADES                                                       ' +#13#10+
    		  '  LEFT JOIN ESTADO EST ON EST.IDESTADO = CID.IDESTADO                                                          ' +#13#10+
    		  ' WHERE HE.DATAPREVISTA = TO_DATE(' + QuotedStr(DateToStr(pDataPrevista)) + ', ''DD/MM/YYYY'')                  ' +#13#10+
		      ' UNION                                                                                                         ' +#13#10+
    		  'SELECT HAC.IDHISTMOVEMPTMO AS IDHISTMOVEMPTMO,                                                                 ' +#13#10+
    		  '       HAC.IDCONTRATOEMPTMO AS IDCONTRATOEMPTMO,                                                               ' +#13#10+
    		  '       7 AS HMETIPOMOV,                                                                                        ' +#13#10+
    		  '       HAC.IDITEMEMPTMO AS IDITEMEMPTMO,                                                                       ' +#13#10+
    		  '	      HAC.ORIGEM AS HMEORIGEM,                                                                                ' +#13#10+
    		  '       0 AS HMEPARCELA,                                                                                        ' +#13#10+
    		  '	      HAC.FORMACOBRANCA AS HMEFORMACOBRANCA,                                                                  ' +#13#10+
    		  '	      DECODE(HAC.NATUREZAITEM, 2, 1, 0) AS HMECENTRALIZA,                                                     ' +#13#10+
    		  '       DECODE(HAC.NATUREZAITEM, 1, 1, 0) AS HMEDESTACADO,                                                      ' +#13#10+
    		  '       HAC.DATAPREVISTA AS HMEDATA,                                                                            ' +#13#10+
    		  '       HAC.DATAPREVISTA AS HMEDATPREVISTA,                                                                     ' +#13#10+
    		  '       HAC.DATAVENCTO AS HMEDATAVENCTO,                                                                        ' +#13#10+
    		  '       HAC.DATAEFETIVA AS HMEDATEFETIVA,                                                                       ' +#13#10+
    		  '       HAC.DATAPREVISTA AS HMEDATAATUALIZA,                                                                    ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HAC.DATAPREVISTA, ''YYYY'') ) AS HMEANOCOMPETENCIA,                                   ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HAC.DATAPREVISTA, ''MM'') ) AS HMEMESCOMPETENCIA,                                     ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HAC.DATAVENCTO, ''YYYY'') ) AS HMEANOCOBRANCA,                                        ' +#13#10+
    		  '       TO_NUMBER(TO_CHAR(HAC.DATAVENCTO, ''MM'') ) HMEMESCOBRANCA,                                             ' +#13#10+
    		  '       ABS(HAC.VLRPREVISTO) AS HMEVLRPREVISTO,                                                                 ' +#13#10+
    		  '       HAC.VLREFETIVO AS HMEVLREFETIVO,                                                                        ' +#13#10+
    		  '       HAC.SALDODEV AS HMESALDODEV,                                                                            ' +#13#10+
    		  '       CE.TXJUROS AS HMETXJUROS,                                                                               ' +#13#10+
    		  '       DECODE(HAC.FLGQUITABONOESTORNO,3,1,0) AS FLGESTORNADO,                                                  ' +#13#10+
    		  '       CAST(DECODE(HAC.FLGBAIXADO, 1, NULL, 0) AS NUMBER) AS FLGBAIXADO,                                       ' +#13#10+
    		  '       DECODE(HAC.FLGQUITABONOESTORNO,2,1,0) AS FLGABONADO,                                                    ' +#13#10+
    		  '       CAST(DECODE(HAC.FLGENVIO, 1, NULL, 0) AS NUMBER) AS FLGENVIO,                                           ' +#13#10+
    		  '       HAC.RECPAG AS HMERECPAG,                                                                                ' +#13#10+
    		  '       CE.IDBENEF AS IDBENEF,                                                                                  ' +#13#10+
    		  '       CBA.CONTACORRENTE,                                                                                      ' +#13#10+
    		  '       1 AS TIPOCONTA,                                                                                         ' +#13#10+
    		  '	      AGE.NUMAGENCIA,                                                                                         ' +#13#10+
    		  '	      PAG.NOME AS NOMEAGENCIA,                                                                                ' +#13#10+
    		  '	      BAN.NUMBANCO,                                                                                           ' +#13#10+
    		  '	      DCB.CONTACORRENTE AS CONTACORRENTEDEB,                                                                  ' +#13#10+
    		  '	      1 AS TIPOCONTADEB,                                                                                      ' +#13#10+
    		  '	      DAG.NUMAGENCIA AS NUMAGENCIADEB,                                                                        ' +#13#10+
    		  '	      DPA.NOME AS NOMEAGENCIADEB,                                                                             ' +#13#10+
    		  '	      DBA.NUMBANCO AS NUMBANCODEB,                                                                            ' +#13#10+
    		  '	      ENP.LOGRADOURO,                                                                                         ' +#13#10+
    		  '	      ENP.NUMERO,                                                                                             ' +#13#10+
    		  '	      ENP.COMPLEMENTO,                                                                                        ' +#13#10+
    		  '       ENP.BAIRRO,                                                                                             ' +#13#10+
    		  '       CID.NOME AS CIDADE,                                                                                     ' +#13#10+
    		  '       EST.CODESTADO,                                                                                          ' +#13#10+
    		  '       ENP.CEP,                                                                                                ' +#13#10+
    		  '       NVL(PES.NUMDOCUMENTO, DOC.NUMDOCUMENTO) AS NUMDOCUMENTO,                                                ' +#13#10+
		      '       PES.NOME                                                                                                ' +#13#10+
    		  '  FROM HMEAJUSTECOBRANCA HAC                                                                                   ' +#13#10+
    		  '  JOIN HMEENVIO HM ON HM.IDHISTMOVEMPTMO = HAC.IDHISTMOVEMPTMO                                                 ' +#13#10+
    		  '   AND HM.CODDOCUMENTO = '+ IntToStr(pCodDocumento)                                                              +#13#10+
    		  '  JOIN CONTRATOEMPTMO CE ON CE.IDCONTRATOEMPTMO = HAC.IDCONTRATOEMPTMO                                         ' +#13#10+
    		  '  JOIN CONTABANCARIA CBA ON CE.IDCBANCARIA = CBA.IDCBANCARIA                                                   ' +#13#10+
    		  '  JOIN AGENCIABANCARIA AGE ON CBA.IDAGENCIA = AGE.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN CONTABANCARIA DCB ON CE.IDCBANCARIADEB = DCB.IDCBANCARIA                                                ' +#13#10+
    		  '  JOIN AGENCIABANCARIA DAG ON DCB.IDAGENCIA = DAG.IDPESSOA                                                     ' +#13#10+
    		  '  JOIN BANCO BAN ON AGE.IDBANCO = BAN.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA DPA ON DAG.IDPESSOA = DPA.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN PESSOA PAG ON AGE.IDPESSOA = PAG.IDPESSOA                                                               ' +#13#10+
    		  '  JOIN BANCO DBA ON DAG.IDBANCO = DBA.IDPESSOA                                                                 ' +#13#10+
    		  '  JOIN PESSOA PES ON PES.IDPESSOA = CE.IDBENEF		                                                              ' +#13#10+
    		  '  LEFT JOIN ENDPESS ENP ON ENP.IDPESSOA = PES.IDPESSOA AND ENP.IDENDERECO = PES.IDENDRESIDENCIAL               ' +#13#10+
    		  '  LEFT JOIN DOCPESSOA DOC ON DOC.IDPESSOA = PES.IDPESSOA AND DOC.IDDOCUMENTO IN (1,2)                          ' +#13#10+
    		  '  LEFT JOIN CIDADES CID ON CID.IDCIDADES = ENP.IDCIDADES                                                       ' +#13#10+
		      '  LEFT JOIN ESTADO EST ON EST.IDESTADO = CID.IDESTADO                                                          ' +#13#10+
    		  ' WHERE HAC.DATAPREVISTA = TO_DATE(' + QuotedStr(DateToStr(pDataPrevista)) + ', ''DD/MM/YYYY'') AND HAC.DATAEFETIVA IS NULL' ; //Taffarel - SIG82314

  Result := GetDataPacket(sSQL);
end;

function TCtrlMetodosEmptmo.GetDadosRecebedor(
  pIdPessoa: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT E.LOGRADOURO,                                        ' +#13#10+
          '       E.NUMERO,                                            ' +#13#10+
          '       E.COMPLEMENTO,                                       ' +#13#10+
          '       E.BAIRRO,                                            ' +#13#10+
          '       C.NOME AS CIDADE,                                    ' +#13#10+
          '       S.CODESTADO,                                         ' +#13#10+
          '       E.CEP,                                               ' +#13#10+
          '       NVL(P.NUMDOCUMENTO, D.NUMDOCUMENTO) AS NUMDOCUMENTO, ' +#13#10+
          '       P.NOME                                               ' +#13#10+
          '  FROM PESSOA    P,                                         ' +#13#10+
          '       ENDPESS   E,                                         ' +#13#10+
          '       DOCPESSOA D,                                         ' +#13#10+
          '       CIDADES   C,                                         ' +#13#10+
          '       ESTADO    S                                          ' +#13#10+
          ' WHERE P.IDPESSOA    = ' + IntToStr(pIdPessoa)                +#13#10+
          '   AND P.IDPESSOA    = E.IDPESSOA(+)                        ' +#13#10+
          '   AND P.IDPESSOA    = D.IDPESSOA(+)                        ' +#13#10+
          '   AND E.IDCIDADES   = C.IDCIDADES(+)                       ' +#13#10+
          '   AND C.IDESTADO    = S.IDESTADO(+)                        ' ;
  Result := GetDataPacket(sSQL);
end;

function TCtrlMetodosEmptmo.GetFormaPagto: OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT NVL(P.CODFORMAPAGTO, -1) AS CODFORMA,            ' +#13#10+
      	  '       F.DESCRICAO AS DESCRICAO                         ' +#13#10+
          '  FROM PARAMEMPTMO P                                    ' +#13#10+
          '  JOIN FORMARECPAG F ON F.CODFORMA  = P.CODFORMAPAGTO   ' +#13#10;

  Result := GetDataPacket(sSQL);
end;

function TCtrlMetodosEmptmo.GetHistMovEmptmo(pCodDocumento: Integer;
  pDataMov: TDate): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT HME.IDHISTMOVEMPTMO,                                                                     ' +#13#10+
          '       HME.IDCONTRATOEMPTMO,                                                                    ' +#13#10+
          '       HME.CODDOCUMENTO,                                                                        ' +#13#10+
          '       HME.IDITEMEMPTMO,                                                                        ' +#13#10+
          '       HME.HMETIPOMOV, HME.HMEORIGEM, HME.HMEPARCELA,                                           ' +#13#10+
          '       HME.HMEFORMACOBRANCA,                                                                    ' +#13#10+
          '       HME.HMECENTRALIZA, HME.HMEDESTACADO,                                                     ' +#13#10+
          '       HME.HMEDATA, HME.HMEDATAPREVISTA, HME.HMEDATAVENCTO,                                     ' +#13#10+
          '       HME.HMEDATAEFETIVA, HME.HMEDATAATUALIZA,                                                 ' +#13#10+
          '       HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA,                                            ' +#13#10+
          '       HME.HMEANOCOBRANCA, HME.HMEMESCOBRANCA,                                                  ' +#13#10+
          '       ABS(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO,                                               ' +#13#10+
          '       HME.HMEVLREFETIVO, HME.HMESALDODEV, HME.HMETXJUROS,                                      ' +#13#10+
          '       HME.FLGESTORNADO, HME.FLGBAIXADO, HME.FLGABONADO, HME.FLGENVIO,                          ' +#13#10+
          '       HME.HMERECPAG                                                                            ' +#13#10+
          '  FROM HISTMOVEMPTMO HME,                                                                       ' +#13#10+
          '       PARAMEMPTMO   PEP                                                                        ' +#13#10+
          ' WHERE HME.CODDOCUMENTO = ' + IntToStr(pCodDocumento)                                             +#13#10+
          '   AND HME.HMEDATAPREVISTA = TO_DATE(' + QuotedStr(DateToStr(pDataMov)) + ', ''DD/MM/YYYY'')               ' +#13#10+
          '   AND HME.HMEFORMACOBRANCA      = ''C''                                                        ' +#13#10+
          '   AND HME.HMERECPAG             = ''P''                                                        ' +#13#10+
          '   AND ( HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)                                   ' +#13#10+
          '   AND NVL(HME.FLGESTORNADO, 0)  = 0                                                            ' +#13#10+
          '   AND NVL(HME.FLGABONADO, 0)    = 0                                                            ' +#13#10+
          '   AND NVL(HME.FLGQUITADO, 0)    = 0                                                            ' +#13#10+
          '   AND ((PEP.FLGEXCEPCIONAL      = 1) OR (PEP.FLGEXCEPCIONAL      <> 1 AND HME.HMETIPOMOV = 0)) ' +#13#10+
          '   AND ((PEP.FLGEXCEPCIONAL      = 1) OR (PEP.FLGEXCEPCIONAL      <> 1 AND HME.HMEPARCELA = 0)) ' ;

  Result := GetDataPacket(sSQL);

end;

function TCtrlMetodosEmptmo.GetPortadorForma(
  pCodPortForma: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT PFO.CODPORTFORMA,                             ' +#13#10+
          '       PFO.CODPORTADOR,                              ' +#13#10+
          '       PFO.CODFORMA,                                 ' +#13#10+
          '       PFO.RECPAG,                                   ' +#13#10+
          '       PFO.DMAIS,                                    ' +#13#10+
          '       PFO.NUMEMPRESABANCO,                          ' +#13#10+
          '       PFO.NOSSONUMERO,                              ' +#13#10+
          '       PFO.DESCRICAO,                                ' +#13#10+
          '       PFO.CONTROLEREMESSA,                          ' +#13#10+
          '       PFO.DATACONTRREMESSA,                         ' +#13#10+
          '       PFO.CODARQUIVOREMESSA,                        ' +#13#10+
          '       PFO.FLGEMITEAVISO,                            ' +#13#10+
          '       PFO.CODTIPOPAGTO,                             ' +#13#10+
          '       PCO.IDBANCO,                                  ' +#13#10+
          '       PCO.NOCONTACORR,                              ' +#13#10+
          '       PFO.DMAISALT,                                 ' +#13#10+
          '       PFO.CODFORMAPGTOALT,                          ' +#13#10+
          '       PFO.VALORMAXIMO                               ' +#13#10+
          '  FROM PORTADORFORMA PFO,                            ' +#13#10+
          '       PORTADORCONTA PCO                             ' +#13#10+
          ' WHERE PFO.RECPAG      = ''P''                       ' +#13#10+
          '   AND PFO.CODPORTFORMA = ' + IntToStr(pCodPortForma)  +#13#10+
          '   AND NVL(PFO.FLGATIVO,''S'') = ''S''               ' +#13#10+
          '   AND PFO.CODPORTADOR = PCO.CODPORTADOR             ';
  Result := GetDataPacket(sSQL);
end;

end.
