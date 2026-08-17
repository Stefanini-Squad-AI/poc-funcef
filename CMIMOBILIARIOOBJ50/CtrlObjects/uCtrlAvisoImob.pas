unit uCtrlAvisoImob;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE QUADRO DE AVISOS  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//	Autor           :  Vinícius Meyer Lana
//	Data de Início  :  29/11/2004
//	Data de Término :
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaAvisoImob      -  Insere, Altera um cadastro de Avisos        ( TLB )
//      ExcluiAvisoImob     -  Exclui um cadastro de Avisos                ( TLB )
//      LookupAvisoImob     -  Abre a configuração de aviso de um usuario
//      LookupAvisoImobxUsu -  Abre a relação de outros usuários relacionados
//      LookupQuadroAvisos  -  Abre a consulta para o Quadro de Avisos
// -----------------------------------------------------------------------------
{-------------------------------------------------------------------------------
Rotina ......: LookupQuadroAvisos
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Alterado LookupQuadroAvisos
-------------------------------------------------------------------------------}

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uDbAvisoImob,
     uDbAvisoImobxUsu, uCMTypes,uCMFileUtils;

type TCtrlAvisoImob = class(TCmControlObject)
     private
       FCdsAvisoImob: TCMClientDataSet;
       FDbAvisoImob : TDbAvisoImob;
       FCdsAvisoImobxUsu: TCMClientDataSet;
       FDbAvisoImobxUsu: TDbAvisoImobxUsu;
       procedure SetCdsAvisoImob(const Value: TCMClientDataSet);
       procedure SetDbAvisoImob (const Value: TDbAvisoImob);
       procedure SetCdsAvisoImobxUsu(const Value: TCMClientDataSet);
       procedure SetDbAvisoImobxUsu (const Value: TDbAvisoImobxUsu);

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;
     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbAvisoImob      : TDbAvisoImob     read FDbAvisoImob      write SetDbAvisoImob;
       property DbAvisoImobxUsu  : TDbAvisoImobxUsu read FDbAvisoImobxUsu  write SetDbAvisoImobxUsu;
       property CdsAvisoImob     : TCMClientDataSet read FCdsAvisoImob     write SetCdsAvisoImob;
       property CdsAvisoImobxUsu : TCMClientDataSet read FCdsAvisoImobxUsu write SetCdsAvisoImobxUsu;

       function GravaAvisoImob  : Boolean;
       function ExcluiAvisoImob : Boolean;
       function LookupAvisoImob     (const iIdUsuario:Integer = -1) : OLEVariant;
       function LookupAvisoImobxUsu (const iIdUsuario:Integer = -1) : OLEVariant;
       function LookupQuadroAvisos  (const iIdEmpresa, iIdUsuario: Integer) : OLEVariant;

     published

end;


implementation

{ TCtrlAvisoImob }

constructor TCtrlAvisoImob.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbAvisoImob     := TDBAvisoImob.Create( Self );
  FDbAvisoImobxUsu := TDBAvisoImobxUsu.Create( Self );
end;

destructor TCtrlAvisoImob.Destroy;
begin
  // Destrói os DbObjects criados
  FDbAvisoImob.Free;
  FDbAvisoImobxUsu.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
     FCdsAvisoImob.Free;
     FCdsAvisoImobxUsu.Free;
  end;
  inherited;
end;

procedure TCtrlAvisoImob.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsAvisoImob     := TCMClientDataSet.Create( nil );
  FCdsAvisoImobxUsu := TCMClientDataSet.Create( nil );
end;

procedure TCtrlAvisoImob.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbAvisoImob.DataBaseName     := DataBaseName;
  FDbAvisoImobxUsu.DataBaseName := DataBaseName;
end;

function TCtrlAvisoImob.GravaAvisoImob: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaAvisoImob( CdsAvisoImob.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Grava AvisoImob ( Pai )
      Result := ApplyCds( CdsAvisoImob, DbAvisoImob, [], [] );
      if not Result then raise Exception.Create( DbAvisoImob.MessageInfo );

      // Grava AvisoImobxUsu ( Filho )
      Result := ApplyCds( CdsAvisoImobxUsu, DbAvisoImobxUsu, [dbAvisoImob.IdUsuario], [dbAvisoImobxUsu.IdUsuario] );
      if not Result then raise Exception.Create( DbAvisoImobxUsu.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlAvisoImob.ExcluiAvisoImob: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiAvisoImob( CdsAvisoImob.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos os filhos para exclusão
      CdsAvisoImobxUsu.First;
      while not CdsAvisoImobxUsu.Eof do CdsAvisoImobxUsu.Delete;

      // Exclui Usuários Adicionais ( Filho )
      Result := ApplyCds( CdsAvisoImobxUsu, DbAvisoImobxUsu, [], [] );
      if not Result then raise Exception.Create( DbAvisoImobxUsu.MessageInfo );

      // Exclui Aviso do Usuario ( Pai )
      Result := ApplyCds( CdsAvisoImob, DbAvisoImob, [], [] );
      if not Result then raise Exception.Create( DbAvisoImob.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlAvisoImob.LookupAvisoImob(const iIdUsuario : Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdUsuario <> -1 then sParam := ' AND A.IDUSUARIO = ' + IntToStr(iIdUsuario);
  sSql := 'SELECT A.*, U.NOMEUSUARIO,                                          ' +#13+
          '       RTRIM(U.NOMEUSUARIO) || '' - '' || P.NOME AS USUARIO_EXTENSO ' +#13+
          '  FROM AVISOIMOB A, USUARIOSISTEMA U, PESSOA P                      ' +#13+
          ' WHERE A.IDUSUARIO = U.IDUSUARIO                                    ' +#13+
          '   AND U.IDUSUARIO = P.IDPESSOA                                     ' +#13+ sParam +
          ' ORDER BY U.NOMEUSUARIO ';
  Result := GetDataPacket( sSql );
end;


function TCtrlAvisoImob.LookupAvisoImobxUsu(const iIdUsuario: Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdUsuario <> -1 then sParam := ' AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)+#13;

  sSql := 'SELECT A.IDUSUARIO, A.IDOUTROUSUARIO, '+#13+
          '       U.NOMEUSUARIO, P.NOME          '+#13+
          '  FROM USUARIOSISTEMA U, PESSOA P,    '+#13+
          '       AVISOIMOBXUSU A                '+#13+
          ' WHERE U.IDUSUARIO = P.IDPESSOA       '+#13+
          '   AND A.IDOUTROUSUARIO = U.IDUSUARIO '+#13+ sParam +
          ' ORDER BY U.NOMEUSUARIO ';

  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Selecionar os Avisos a serem efetuados baseados nos parâmetros do sistema
// Data : 20/12/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdEmpresa - id da Empresa
//       iIdUsuario - id do Usuário
//
// Retorno : OLEVariant  - Conjunto de dados
//----------------------------------------------------------------------------------------
function TCtrlAvisoImob.LookupQuadroAvisos(const iIdEmpresa,iIdUsuario: Integer): OLEVariant;
var sSql : String;
begin
  sSql := '/* Encerramento de contrato de Locação */                  '+#13+
          'SELECT C.IDCONTRATOIMOVEL              AS IDCONTRATO,      '+#13+
          '       0                               AS IDEVENTOIMOVEL,  '+#13+
          '       C.CONNUMERO                     AS NUMEROCONTRATO,  '+#13+
          '       C.CONNOME                       AS NOMECONTRATO,    '+#13+
          '       R.NOME                          AS NOMERESPONSAVEL, '+#13+
          '       1                               AS TIPO,            '+#13+
          '       ''Encerramento Locação''        AS DSC_TIPO,        '+#13+
          '       C.CONDATAFIM                    AS DATALIMITE,      '+#13+
          '       (C.CONDATAFIM - A.DIAENCERALUG) AS DATAAVISO        '+#13+
          '  FROM CONTRATOIMOVEL C,                                   '+#13+
          '       PESSOA R,                                           '+#13+
          '       AVISOIMOB A                                         '+#13+
          ' WHERE C.FLGTIPOCONTRATO = ''L''                           '+#13+
          '   AND C.IDPESSOA  = ' + IntToStr(iIdEmpresa)               +#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)               +#13+
          '   AND C.IDRESPONSAVEL = R.IDPESSOA(+)                     '+#13+
          '   AND ( (A.FLGENCERALUG = ''S'') AND (C.FLGSTATUS = ''V'') AND                                                           '+#13+
          '         ((C.CONDATAFIM - A.DIAENCERALUG) <= SYSDATE) )                                                                   '+#13+
          '   AND ( ((A.FLGRESPONSAVEL = ''S'') AND (C.IDRESPONSAVEL IS NULL)) OR                                                    '+#13+
          '         ((A.FLGRESPONSAVEL IS NOT NULL) AND ((C.IDRESPONSAVEL = ' + IntToStr(iIdUsuario) + ') OR                         '+#13+
          '                                              (C.IDRESPONSAVEL IN (SELECT IDOUTROUSUARIO                                  '+#13+
          '                                                                     FROM AVISOIMOBXUSU                                   '+#13+
          '                                                                    WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) ) )) '+#13+
          'UNION '+#13+
          '/* Aviso de Revisão do contrato de Locação */                  '+#13+
          'SELECT C.IDCONTRATOIMOVEL                  AS IDCONTRATO,      '+#13+
          '       0                                   AS IDEVENTOIMOVEL,  '+#13+
          '       C.CONNUMERO                         AS NUMEROCONTRATO,  '+#13+
          '       C.CONNOME                           AS NOMECONTRATO,    '+#13+
          '       R.NOME                              AS NOMERESPONSAVEL, '+#13+
          '       2                                   AS TIPO,            '+#13+
          '       ''Revisão de Contrato''             AS DSC_TIPO,        '+#13+
          '       C.CONDATARENEGOC                    AS DATALIMITE,      '+#13+
          '       (C.CONDATARENEGOC - A.DIAREVISALUG) AS DATAAVISO        '+#13+
          '  FROM CONTRATOIMOVEL C,                                       '+#13+
          '       PESSOA R,                                               '+#13+
          '       AVISOIMOB A                                             '+#13+
          ' WHERE C.FLGTIPOCONTRATO = ''L''                               '+#13+
          '   AND C.IDPESSOA  = ' + IntToStr(iIdEmpresa)                   +#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)                   +#13+
          '   AND C.IDRESPONSAVEL = R.IDPESSOA(+)                         '+#13+
          '   AND ( (A.FLGREVISALUG = ''S'') AND (C.FLGSTATUS = ''V'') AND                                                           '+#13+
          '         ( (C.CONDATAAVRENEGOC <= SYSDATE) OR ((C.CONDATARENEGOC - A.DIAREVISALUG) <= SYSDATE) ) )                        '+#13+
          '   AND ( ((A.FLGRESPONSAVEL = ''S'') AND (C.IDRESPONSAVEL IS NULL)) OR                                                    '+#13+
          '         ((A.FLGRESPONSAVEL IS NOT NULL) AND ((C.IDRESPONSAVEL = ' + IntToStr(iIdUsuario) + ') OR                         '+#13+
          '                                              (C.IDRESPONSAVEL IN (SELECT IDOUTROUSUARIO                                  '+#13+
          '                                                                     FROM AVISOIMOBXUSU                                   '+#13+
          '                                                                    WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) ) )) '+#13+
          'UNION '+#13+
          '/* Aviso de Renovatória do contrato de Locação */               '+#13+
          'SELECT C.IDCONTRATOIMOVEL                  AS IDCONTRATO,       '+#13+
          '       0                                   AS IDEVENTOIMOVEL,   '+#13+
          '       C.CONNUMERO                         AS NUMEROCONTRATO,   '+#13+
          '       C.CONNOME                           AS NOMECONTRATO,     '+#13+
          '       R.NOME                              AS NOMERESPONSAVEL,  '+#13+
          '       8                                   AS TIPO,             '+#13+
          '       ''Renovatória de Contrato''         AS DSC_TIPO,         '+#13+
          '       C.CONDATARENEGOC                    AS DATALIMITE,       '+#13+
          '       (C.CONDATARENEGOC - A.DIARENOVALUG) AS DATAAVISO         '+#13+
          '  FROM CONTRATOIMOVEL C,                                        '+#13+
          '       PESSOA R,                                                '+#13+
          '       AVISOIMOB A                                              '+#13+
          ' WHERE C.FLGTIPOCONTRATO = ''L''                                '+#13+
          '   AND C.IDPESSOA  = ' + IntToStr(iIdEmpresa)                    +#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)                    +#13+
          '   AND C.IDRESPONSAVEL = R.IDPESSOA(+)                          '+#13+
          '   AND ( (A.FLGRENOVALUG = ''S'') AND (C.FLGSTATUS = ''V'') AND '+#13+
          '         ( (C.CONDATAAVDENUNCIA <= SYSDATE) OR ((C.CONDATADENUNCIA - A.DIARENOVALUG) <= SYSDATE) ) )                      '+#13+
          '   AND ( ((A.FLGRESPONSAVEL = ''S'') AND (C.IDRESPONSAVEL IS NULL)) OR                                                    '+#13+
          '         ((A.FLGRESPONSAVEL IS NOT NULL) AND ((C.IDRESPONSAVEL = ' + IntToStr(iIdUsuario) + ') OR                         '+#13+
          '                                              (C.IDRESPONSAVEL IN (SELECT IDOUTROUSUARIO                                  '+#13+
          '                                                                     FROM AVISOIMOBXUSU                                   '+#13+
          '                                                                    WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) ) )) '+#13+
          'UNION '+#13+
          '/* Aviso de Reajuste contrato de Locação */                     '+#13+
          'SELECT C.IDCONTRATOIMOVEL                   AS IDCONTRATO,      '+#13+
          '       0                                    AS IDEVENTOIMOVEL,  '+#13+
          '       C.CONNUMERO                          AS NUMEROCONTRATO,  '+#13+
          '       C.CONNOME                            AS NOMECONTRATO,    '+#13+
          '       R.NOME                               AS NOMERESPONSAVEL, '+#13+
          '       3                                    AS TIPO,            '+#13+
          '       ''Reajuste de Contrato''             AS DSC_TIPO,        '+#13+
          '       C.CONPROXREAJUSTE                    AS DATALIMITE,      '+#13+
          '       (C.CONPROXREAJUSTE - A.DIAREAJUALUG) AS DATAAVISO        '+#13+
          '  FROM CONTRATOIMOVEL C,                                        '+#13+
          '       PESSOA R,                                                '+#13+
          '       AVISOIMOB A                                              '+#13+
          ' WHERE C.FLGTIPOCONTRATO = ''L''                                '+#13+
          '   AND C.IDPESSOA  = ' + IntToStr(iIdEmpresa)                    +#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)                    +#13+
          '   AND C.IDRESPONSAVEL = R.IDPESSOA(+)                          '+#13+
          '   AND ( (A.FLGREAJUALUG = ''S'') AND (C.FLGSTATUS = ''V'') AND '+#13+
          '         ((C.CONPROXREAJUSTE - A.DIAREAJUALUG) <= SYSDATE) )    '+#13+
          '   AND ( ((A.FLGRESPONSAVEL = ''S'') AND (C.IDRESPONSAVEL IS NULL)) OR                                                    '+#13+
          '         ((A.FLGRESPONSAVEL IS NOT NULL) AND ((C.IDRESPONSAVEL = ' + IntToStr(iIdUsuario) + ') OR                         '+#13+
          '                                              (C.IDRESPONSAVEL IN (SELECT IDOUTROUSUARIO                                  '+#13+
          '                                                                     FROM AVISOIMOBXUSU                                   '+#13+
          '                                                                    WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) ) )) '+#13+
          'UNION '+#13+
          '/* Aviso de Vencimento de Fiança do contrato de Locação */      '+#13+
          'SELECT C.IDCONTRATOIMOVEL                    AS IDCONTRATO,     '+#13+
          '       0                                     AS IDEVENTOIMOVEL, '+#13+
          '       C.CONNUMERO                           AS NUMEROCONTRATO, '+#13+
          '       C.CONNOME                             AS NOMECONTRATO,   '+#13+
          '       R.NOME                                AS NOMERESPONSAVEL,'+#13+
          '       4                                     AS TIPO,           '+#13+
          '       ''Vencimento de Fiança''              AS DSC_TIPO,       '+#13+
          '       C.CONDATAFIANCAFIM                    AS DATALIMITE,     '+#13+
          '       (C.CONDATAFIANCAFIM - A.DIAVENCIFIAN) AS DATAAVISO       '+#13+
          '  FROM CONTRATOIMOVEL C,                                        '+#13+
          '       PESSOA R,                                                '+#13+
          '       AVISOIMOB A                                              '+#13+
          ' WHERE C.FLGTIPOCONTRATO = ''L''                                '+#13+
          '   AND C.IDPESSOA  = ' + IntToStr(iIdEmpresa)                    +#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)                    +#13+
          '   AND C.IDRESPONSAVEL = R.IDPESSOA(+)                          '+#13+
          '   AND ( (A.FLGVENCIFIAN = ''S'') AND (C.FLGSTATUS = ''V'') AND '+#13+
          '         ( (C.CONDATAFIANCAAV <= SYSDATE) OR ((C.CONDATAFIANCAFIM - A.DIAVENCIFIAN) <= SYSDATE) ) )                       '+#13+
          '   AND ( ((A.FLGRESPONSAVEL = ''S'') AND (C.IDRESPONSAVEL IS NULL)) OR                                                    '+#13+
          '         ((A.FLGRESPONSAVEL IS NOT NULL) AND ((C.IDRESPONSAVEL = ' + IntToStr(iIdUsuario) + ') OR                         '+#13+
          '                                              (C.IDRESPONSAVEL IN (SELECT IDOUTROUSUARIO                                  '+#13+
          '                                                                     FROM AVISOIMOBXUSU                                   '+#13+
          '                                                                    WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) ) )) '+#13+
          'UNION '+#13+
          '/* Aviso de Vencimento de Seguros */                                 '+#13+
          'SELECT S.IDSEGUROIMOVEL                     AS IDCONTRATO,           '+#13+
          '       0                                    AS IDEVENTOIMOVEL,       '+#13+
          '       S.SGIAPOLICE                         AS NUMEROCONTRATO,       '+#13+
          '       DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME,                     '+#13+
          '             (IM.IMONOME || '' - '' || I.IMONOME) ) AS NOMECONTRATO, '+#13+
          '       R.NOME                               AS NOMERESPONSAVEL,      '+#13+
          '       6                                    AS TIPO,                 '+#13+
          '       ''Vencimento de Seguro''             AS DSC_TIPO,             '+#13+
          '       S.SGIDATAFIM                         AS DATALIMITE,           '+#13+
          '       (S.SGIDATAFIM - A.DIAENCERSEGU)      AS DATAAVISO             '+#13+
          '  FROM SEGUROIMOVEL S,                                               '+#13+
          '       PESSOA R,                                                     '+#13+
          '       IMOVEL I,                                                     '+#13+
          '       IMOVEL IM,                                                    '+#13+
          '       AVISOIMOB A                                                   '+#13+
          ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL(+)                             '+#13+
          '   AND S.IDIMOVEL = I.IDIMOVEL                                       '+#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)                         +#13+
          '   AND S.IDRESPONSAVEL = R.IDPESSOA(+)                               '+#13+
          '   AND S.FLGSTATUS = ''V''                                           '+#13+
          '   AND ( (A.FLGENCERSEGU = ''S'') AND                                '+#13+
          '         ((S.SGIDATAFIM - A.DIAENCERSEGU) <= SYSDATE) )              '+#13+
          '   AND ( ((A.FLGRESPONSAVEL = ''S'') AND (S.IDRESPONSAVEL IS NULL)) OR                                                    '+#13+
          '         ((A.FLGRESPONSAVEL IS NOT NULL) AND ((S.IDRESPONSAVEL = ' + IntToStr(iIdUsuario) + ') OR                         '+#13+
          '                                              (S.IDRESPONSAVEL IN (SELECT IDOUTROUSUARIO                                  '+#13+
          '                                                                     FROM AVISOIMOBXUSU                                   '+#13+
          '                                                                    WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) ) )) '+#13+
          'UNION '+#13+
          '/* Aviso de Eventos */                                          '+#13+
          'SELECT DECODE(E.IDCONTRATOIMOVEL,    NULL,                      '+#13+
          '              DECODE(E.IDIMOVEL,     NULL,                      '+#13+
          '              DECODE(E.CODDOCUMENTO, NULL,                      '+#13+
          '              0, E.CODDOCUMENTO ),                              '+#13+
          '              E.IDIMOVEL ), E.IDCONTRATOIMOVEL ) AS IDCONTRATO, '+#13+
          '       E.IDEVENTOIMOVEL   AS IDEVENTOIMOVEL,                    '+#13+
          '       DECODE(E.IDCONTRATOIMOVEL,    NULL,                      '+#13+
          '              DECODE(E.IDIMOVEL,     NULL,                      '+#13+
          '              DECODE(E.CODDOCUMENTO, NULL,                      '+#13+
          '              NULL, L.CONNUMERO ),                              '+#13+
          '              I.IMOCODIGO ), C.CONNUMERO ) AS NUMEROCONTRATO,   '+#13+
          '       DECODE(E.IDCONTRATOIMOVEL,    NULL,                      '+#13+
          '              DECODE(E.IDIMOVEL,     NULL,                      '+#13+
          '              DECODE(E.CODDOCUMENTO, NULL,                      '+#13+
          '              NULL, L.CONNOME ),                                '+#13+
          '              IM.IMONOME || '' - '' || I.IMONOME ), C.CONNOME ) AS NOMECONTRATO, '+#13+
          '       R.NOME AS NOMERESPONSAVEL,                               '+#13+
          '       DECODE(E.IDCONTRATOIMOVEL,    NULL,                      '+#13+
          '              DECODE(E.IDIMOVEL,     NULL,                      '+#13+
          '              DECODE(E.CODDOCUMENTO, NULL,                      '+#13+
          '              9, DECODE(L.FLGTIPOCONTRATO,''L'',10,13) ), 11 ), 12 ) AS TIPO, '+#13+
          '       DECODE(E.IDCONTRATOIMOVEL,    NULL,                      '+#13+
          '              DECODE(E.IDIMOVEL,     NULL,                      '+#13+
          '              DECODE(E.CODDOCUMENTO, NULL,                      '+#13+
          '              ''Evento'', ''Evento Doc. Nº '' || L.NODOCUMENTO ),           '+#13+
          '              ''Evento de Imóvel'' ), ''Evento de Contrato'' ) AS DSC_TIPO, '+#13+
          '       E.EVIDATA AS DATALIMITE,                                 '+#13+
          '       (E.EVIDATA - E.DIASAVISO) AS DATAAVISO                   '+#13+
          '  FROM EVENTOIMOVEL E,   '+#13+
          '       CONTRATOIMOVEL C, '+#13+
          '       PESSOA R,         '+#13+
          '       AVISOIMOB A,      '+#13+
          '       IMOVEL I,         '+#13+
          '       IMOVEL IM,        '+#13+
          '       ( SELECT DISTINCT L.CODDOCUMENTO, L.NODOCUMENTO, C.FLGTIPOCONTRATO, C.CONNUMERO, C.CONNOME '+#13+
          '           FROM LANCAMENTOSIMOVEL L, CONTRATOIMOVEL C                          '+#13+
          '          WHERE L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL                        '+#13+
          '          UNION '+#13+
          '         SELECT DISTINCT P.CODDOCUMENTO, P.CODDOCUMENTO AS NODOCUMENTO, C.FLGTIPOCONTRATO, C.CONNUMERO, C.CONNOME '+#13+
          '           FROM PARCFINANCIMOV P, CONDPAGIMOVEL CP, CONTRATOIMOVEL C  '+#13+
          '          WHERE P.IDCONDPAGIMOVEL = CP.IDCONDINICIAL                  '+#13+
          '            AND CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL  ) L         '+#13+
          ' WHERE E.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)                     '+#13+
          '   AND E.CODDOCUMENTO = L.CODDOCUMENTO(+)                             '+#13+
          '   AND E.IDIMOVEL = I.IDIMOVEL(+)                                     '+#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL(+)                              '+#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)                          +#13+
          '   AND E.IDUSUARIO = R.IDPESSOA(+)                                    '+#13+
          '   AND E.FLGAVISO = ''S''                                             '+#13+
          '   AND A.FLGAVISOEVENTO = ''S''                                       '+#13+
          '   AND (E.EVIDATA - E.DIASAVISO) <= SYSDATE                           '+#13+
          '   AND (E.EVIDATA >= SYSDATE)                                         '+#13+
          '   AND ( (E.IDUSUARIO = ' + IntToStr(iIdUsuario) + ' ) OR             '+#13+
          '         (E.IDUSUARIO IN (SELECT IDOUTROUSUARIO                       '+#13+
          '                               FROM AVISOIMOBXUSU                     '+#13+
          '                              WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) + ')) ) '+#13+
          '/* Aviso de Falta de Pagamento de Cobrança Enviada */                 '+#13+
          'UNION '+#13+
          'SELECT E.CODDOCUMENTO AS IDCONTRATO,                                  '+#13+
          '       E.IDEVENTOIMOVEL,                                              '+#13+
          '       L.CONNUMERO AS NUMEROCONTRATO,                                 '+#13+
          '       L.CONNOME   AS NOMECONTRATO,                                   '+#13+
          '       P.NOME AS NOMERESPONSAVEL,                                     '+#13+
          '       DECODE(L.FLGTIPOCONTRATO,''L'',10, 13) AS TIPO,                '+#13+
          '       ''Cobrança em Atraso Doc. Nº '' || L.NODOCUMENTO AS DSC_TIPO,  '+#13+
          '       E.EVIDATA AS DATALIMITE,                                       '+#13+
          '       SYSDATE AS DATAAVISO                                           '+#13+
          '  FROM EVENTOIMOVEL E,                                                '+#13+
          '       DOCUMENTO D,                                                   '+#13+
          '       AVISOIMOB A,                                                   '+#13+
          '       PESSOA P,                                                      '+#13+
          '       ( SELECT DISTINCT L.CODDOCUMENTO, L.NODOCUMENTO, C.FLGTIPOCONTRATO, C.CONNUMERO, C.CONNOME   '+#13+
          '           FROM LANCAMENTOSIMOVEL L, CONTRATOIMOVEL C     '+#13+
          '          WHERE L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL   '+#13+
          '          UNION  '+#13+
          '         SELECT DISTINCT P.CODDOCUMENTO, P.CODDOCUMENTO AS NODOCUMENTO, C.FLGTIPOCONTRATO, C.CONNUMERO, C.CONNOME  '+#13+
          '           FROM PARCFINANCIMOV P, CONDPAGIMOVEL CP, CONTRATOIMOVEL C   '+#13+
          '          WHERE P.IDCONDPAGIMOVEL = CP.IDCONDINICIAL                   '+#13+
          '            AND CP.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL  ) L,         '+#13+
          '       ( SELECT CODDOCUMENTO,              '+#13+
          '                MAX(EVIDATA) AS ULTDATA    '+#13+
          '           FROM EVENTOIMOVEL               '+#13+
          '          WHERE CODDOCUMENTO IS NOT NULL   '+#13+
          '            AND FLGTIPOEVENTO = ''RD''     '+#13+
          '          GROUP BY CODDOCUMENTO            '+#13+
          '        ) UE                               '+#13+
          ' WHERE E.CODDOCUMENTO = D.CODDOCUMENTO     '+#13+
          '   AND RTRIM(D.STATUS) <> ''2''            '+#13+
          '   AND E.CODDOCUMENTO = UE.CODDOCUMENTO    '+#13+
          '   AND E.CODDOCUMENTO = L.CODDOCUMENTO     '+#13+
          '   AND E.EVIDATA = UE.ULTDATA              '+#13+
          '   AND E.EVIDATA < SYSDATE                 '+#13+
          '   AND E.IDUSUARIO = P.IDPESSOA            '+#13+
          '   AND A.IDUSUARIO = ' + IntToStr(iIdUsuario) +#13+
          '   AND A.FLGAVISOEVENTO = ''S''            '+#13+
          '   AND ( (E.IDUSUARIO = ' + IntToStr(iIdUsuario) + ' ) OR '+#13+
          '         (E.IDUSUARIO IN (SELECT IDOUTROUSUARIO           '+#13+
          '                            FROM AVISOIMOBXUSU            '+#13+
          '                           WHERE IDUSUARIO = '+ IntToStr(iIdUsuario) + ') ) ) '+#13+
          // Helen - SOL: 127213 KTN: 672023
          ' /* Aviso de Aquisição Parcelada              */                 '+#13+
          '   UNION    '+#13+
          '   SELECT 0 AS IDCONTRATO,                   '+#13+
          '   0 AS IDEVENTOIMOVEL,                      '+#13+
          '   NULL AS NUMEROCONTRATO,                   '+#13+
          '   (LA.CODDOCUMENTO || '' - '' || IM.IMONOME) NOMECONTRATO  , ' +#13+
          '   R.NOME AS NOMERESPONSAVEL,                '+#13+
          '	0 AS TIPO,                              '+#13+
          '   ''Aquisição Parcelada ''  AS DSC_TIPO,    '+#13+
          '    LA.DATAVENCIMENTO AS DATALIMITE,         '+#13+
          '   (LA.DATAVENCIMENTO - A.DIAPGTOPARC) AS DATAAVISO '+#13+
          '    FROM LANCAMENTOSIMOVEL LA, IMOVEL IM, PESSOA R, AVISOIMOB A  '+#13+
          '    WHERE  LA.IDCONDPAGAQUISPARC > 0                           '+#13+
          '       AND LA.IDIMOVEL = IM.IDIMOVEL                           '+#13+
          '       AND A.IDUSUARIO = ' + IntToStr(iIdUsuario)               +#13+
          '       AND LA.IDUSUARIOSISTEMA = R.IDPESSOA(+)                 '+#13+
          '       AND A.FLGPGTOPARC = ''S''                               '+#13+
          '       AND((LA.DATAVENCIMENTO - A.DIAPGTOPARC) <= SYSDATE)     '+#13+
          '       AND (((A.FLGPGTOPARC = ''S'') AND (LA.IDUSUARIOSISTEMA IS NULL)) '+#13+
          '       OR ((A.FLGRESPONSAVEL IS NOT NULL) AND                  '+#13+
          '          ((LA.IDUSUARIOSISTEMA = ' + IntToStr(iIdUsuario) + ')'+#13+
          '       OR  (LA.IDUSUARIOSISTEMA IN (SELECT IDOUTROUSUARIO      '+#13+
          '                                    FROM AVISOIMOBXUSU         '+#13+
          '               WHERE IDUSUARIO = ' + IntToStr(iIdUsuario) +  ')))))' +#13+
          // Helen - SOL: 127213 KTN: 672023 - FIM
          'ORDER BY DATAAVISO, NOMECONTRATO ';

  Result := GetDataPacket( sSql );
end;



procedure TCtrlAvisoImob.SetCdsAvisoImob(const Value: TCMClientDataSet);
begin
  FCdsAvisoImob := Value;
end;

procedure TCtrlAvisoImob.SetDbAvisoImob(const Value: TDbAvisoImob);
begin
  FDbAvisoImob := Value;
end;

procedure TCtrlAvisoImob.SetCdsAvisoImobxUsu(const Value: TCMClientDataSet);
begin
  FCdsAvisoImobxUsu := Value;
end;

procedure TCtrlAvisoImob.SetDbAvisoImobxUsu(const Value: TDbAvisoImobxUsu);
begin
  FDbAvisoImobxUsu := Value;
end;


end.
