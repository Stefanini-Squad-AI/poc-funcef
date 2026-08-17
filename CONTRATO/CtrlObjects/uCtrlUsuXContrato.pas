{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 17963
Responsável : Bruno Bastos
Data        : 19/10/2004
Descrição   : Foi colocado o campo PlaContaCredito na função
              ListGeracaoContrato.
--------------------------------------------------------------------------------
Pendência   : 16455
Responsável : Marchetti
Data        : 10/09/2004
Descrição   : Criaçào de função que verifica se contrato possui aditamento com
              RAD PENDENTE.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit uCtrlUsuXContrato;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet,uCMTypes, uDbContratoUsuario;

type
   TCtrlUsuXContrato = Class(TCmControlObject)

   private
      FDbUsuXContrato  : TDbContratoUsuario;
      FCdsUsuXContrato : TCMClientDataSet;
   public
      property CdsUsuXContrato: TCMClientDataSet read FCdsUsuXContrato  write FCdsUsuXContrato;

      constructor Create; override;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;
      function AplicaAtualUsuXContrato: Boolean;
      function ListContratosxUsuario(rIDPessoa, rIDContrato, rIDUsuario: Double;
                                     sStatus:String; bSoFaltantes: Boolean): OleVariant;
      function ListUsuarioXContrato(rIDPessoa, rIDContrato, rIDUsuario: Double) :OLEVariant;                                      
      function ListDadosContrxUsu(rIDPessoa, rIDUsuario, rIDContrato: Double): OleVariant;
      function ListDadosContrxUsuxObjxItem(rIDPessoa, rIDUsuario: Double): OleVariant;
      function ListGeracaoContrato(const rIDPessoa, rIDUsuario, rIDContrato: Double;
                                   const dInicio, dTermino:TDateTime): OleVariant;

      // Marchetti - Pendencia 16455
      function ContratoPossuiAditamentoComRADPendente(const rIdContrato : Double) : Boolean;

   protected
      procedure DoChangeDataBase; override;
      procedure AfterInitialize;  override;
   end;

implementation

{ TCtrlUsuXContrato }

constructor TCtrlUsuXContrato.Create;
begin
   inherited;
   FDbUsuXContrato:=TDbContratousuario.Create(Self);
end;

procedure TCtrlUsuXContrato.OnCreateAppServer;
begin
   inherited;
   FCdsUsuXContrato:=TCMClientDataSet.Create(nil);
end;

procedure TCtrlUsuXContrato.AfterInitialize;
begin
   inherited;
end;

destructor TCtrlUsuXContrato.Destroy;
begin
   inherited;
   FDbUsuXContrato.Free;
   if IsAppServer then FCdsUsuXContrato.Free;
end;

procedure TCtrlUsuXContrato.DoChangeDataBase;
begin
   inherited;
   FDbUsuXContrato.DataBaseName:=DataBaseName;
end;

function TCtrlUsuXContrato.AplicaAtualUsuXContrato: Boolean;
begin
   MessageInfo := '';
   if ConnectionSide = cnsClient then
    begin
       Result := Connection.AppServer.AplicaAtualUsuXContrato(FCdsUsuXContrato.Data);
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       StartTransaction;
       try
          Result:=ApplyCds(FCdsUsuXContrato,FDbUsuXContrato,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbUsuXContrato.MessageInfo;
              Rollback;
           end
          else
           Commit;
       except
          on E:Exception do
          begin
             Result:=False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlUsuXContrato.ListContratosxUsuario(rIDPessoa, rIDContrato,
         rIDUsuario: Double; sStatus:String; bSoFaltantes: Boolean): OleVariant;
var
   sSql   : String;
begin

{ Status:  N - Cadastro em aberto
           S - Cadastro encerrado
           A - Cadastro encerrado e contrato Aprovado pelo RAD
           E - Contrato encerrado
}

   sSql:='SELECT C.*, '+
         FloatToStr(rIDUsuario)+' AS IDUSUARIO '+
         'FROM '+
         '   CONTRATOCONTR C,'+
         '   RADINSTPROCESSO R '+
         'WHERE '+
         '      (C.IDPROCESSORAD = R.IDPROCESSO(+) ) '+
         '  AND (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') ';

   if (rIDContrato<>0) then
      sSql := sSql + '    AND (C.IDCONTRATO = '+FloatToStr(rIDContrato)+') ';

   if (sStatus = 'N') or (sStatus = 'S') or (sStatus = 'E') then begin
      sSql := sSql + '    AND (C.FLGFIMCONTRATO = ' + QuotedStr(sStatus) + ') ';
   end;
   if (sStatus = 'A') then begin
      sSql := sSql + '    AND (C.FLGFIMCONTRATO = ''S'') ' +
                     '    AND ( (C.IDPROCESSORAD IS NULL) OR (R.FLGOK = ''S'') ) ';
   end;

   if (bSoFaltantes) then
       sSql:=sSql+'   AND NOT(C.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                                              'WHERE (IDUSUARIO = '+FloatToStr(rIDUsuario)+'))) '
   else
       sSql:=sSql+'   AND (C.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                                           'WHERE (IDUSUARIO = '+FloatToStr(rIDUsuario)+'))) ';

   sSql:=sSql+'ORDER BY C.NOMECONTRATO ';

   Result:=GetDataPacket(sSql);
end;


function TCtrlUsuXContrato.ListUsuarioXContrato(rIDPessoa, rIDContrato, rIDUsuario: Double): OLEVariant;
var sSql, sParam : String;
begin
   // Define Parametros
   sParam := '';
   if rIDPessoa   <> -1 then sParam := sParam + ' AND C.IDPESSOA   = ' + FloatToStr(rIDPessoa) +#13;
   if rIDContrato <> -1 then sParam := sParam + ' AND U.IDCONTRATO = ' + FloatToStr(rIDContrato) +#13;
   if rIDUsuario  <> -1 then sParam := sParam + ' AND U.IDUSUARIO  = ' + FloatToStr(rIDUsuario) +#13;

   // Define Sql
   sSql := 'SELECT U.IDCONTRATO, U.IDUSUARIO, C.NOMECONTRATO, P.NOME AS NOME_USUARIO ' +#13+
           '  FROM CONTRATOUSUARIO U, ' +#13+
           '       CONTRATOCONTR C,   ' +#13+
           '       PESSOA P           ' +#13+
           ' WHERE U.IDUSUARIO  = P.IDPESSOA   ' +#13+
           '   AND U.IDCONTRATO = C.IDCONTRATO ' +#13+ sParam +
           ' ORDER BY NOMECONTRATO, NOME_USUARIO ';

   Result := GetDataPacket( sSql );
end;


function TCtrlUsuXContrato.ListDadosContrxUsu(rIDPessoa, rIDUsuario,
  rIDContrato: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   C.CODCONTRATOEMPR, '+
         '   C.NOMECONTRATO, '+
         '   C.IDCONTRATO, '+
         '   C.CODCENTRORESPON, '+
         '   C.UNIDNEGOC, '+
         '   C.TIPOCONTRATO, '+
         '   C.CODPORTFORMA, '+
         '   C.IDFORCLI, '+
         '   C.CODTIPDOC, '+
         '   O.MOECODIGO, '+
         '   O.IDITEM, '+
         '   O.IDOBJETO, '+
         '   O.VALORTOTALOBJETO, '+
         '   DECODE(O.DATAULTGERACAO,NULL,(O.DATABASEITEM-1),O.DATAULTGERACAO) AS DATAREFERENCIA, '+
         '   DECODE(O.DATAULTGERACAO,NULL,O.DATAINICIOCOBR, '+
         '          DECODE(O.FREQUENCIA,''D'',(O.DATAULTVENC+NVL(O.INTERVALO,0)), '+
         '          ''M'',ADD_MONTHS(O.DATAULTVENC,NVL(O.INTERVALO,0)), '+
         '          ''A'',ADD_MONTHS(O.DATAULTVENC,(12*NVL(O.INTERVALO,0))), '+
         '          (O.DATAULTVENC+NVL(O.INTERVALO,0)) )) AS DATAVENC, '+
         '   O.QTDEITEM, '+
         '   O.VALORUNITARIOOBJETO, '+
         '   O.OBSERVACAO, '+
         '   OI.CODTIPRECDES, '+
         '   OI.RECPAG, '+
         '   OI.CODSUBCONTA, '+
         '   OI.PLACONTA, '+
         '   TR.ATIVO AS RECDES_ATIVO, '+
         '   O.IDPATRO, '+
         '   O.IDPLANOPREV, '+
         '   O.IDPROGRAMA '+
         'FROM '+
         '   CONTRATOCONTR C, '+
         '   OBJETOSXITEMCONTR O, '+
         '   OBJETOXITEM OI, '+
         '   ITEMCONTRATUAL I, '+
         '   TIPORECEBDESEMB TR '+
         'WHERE '+
         '   (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (C.FLGFIMCONTRATO = ''S'') AND '+
         '   (I.TIPOCOBRANCA = ''PS'') AND '+
         '   (C.IDCONTRATO = O.IDCONTRATO) AND '+
         '   (O.IDOBJETO = OI.IDOBJETO) AND '+
         '   (O.IDITEM = OI.IDITEM) AND '+
         '   (O.IDITEM = I.IDITEM) AND '+
         '   (OI.IDPESSOA = TR.IDPESSOA(+)) AND '+
         '   (OI.RECPAG = TR.RECPAG(+)) AND '+
         '   (OI.CODTIPRECDES = TR.CODTIPRECDES(+)) AND ';

         if (rIDContrato > 0) then
             sSql:=sSql+'   (C.IDCONTRATO IN (SELECT IDCONTRATO '+
                        '                     FROM CONTRATOUSUARIO '+
                        '                     WHERE (IDUSUARIO = '+FloatToStr(rIDUsuario)+') AND '+
                        '                           (IDCONTRATO = '+FloatToStr(rIDContrato)+') )) '

         else
             sSql:=sSql+'   (C.IDCONTRATO IN (SELECT IDCONTRATO '+
                        '                     FROM CONTRATOUSUARIO '+
                        '                     WHERE IDUSUARIO = '+FloatToStr(rIDUsuario)+')) ';
         sSql:=sSql+'ORDER BY C.IDCONTRATO ';
         Result:=GetDataPacket(sSql);
end;


function TCtrlUsuXContrato.ListDadosContrxUsuxObjxItem(rIDPessoa,
  rIDUsuario: Double): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   ROWNUM AS NUMLINHA, '+
         '   C.IDCONTRATO, '+
         '   C.IDFORCLI, '+
         '   C.NOMECONTRATO, '+
         '   C.CODCONTRATOEMPR, '+
         '   C.TIPOCONTRATO, '+
         '   C.VALORBASECONTRATO, '+
         '   C.DATAPREVENCERRA, '+
         '   C.DATABASECONTRATO, '+
         '   C.DATAASSINATURA, '+
         '   C.DESCRICAOCONTRATO, '+
         '   C.OBSERVACAO , '+
         '   C.FLGFIMCONTRATO, '+
         '   C.AVISO, '+
         '   OXI.*, '+
         '   O.*, '+
         '   I.*, '+
         '   P.RAZAOSOCIAL '+
         'FROM '+
         '   CONTRATOCONTR C, '+
         '   OBJETOSXITEMCONTR OXI, '+
         '   OBJETOCONTRATUAL O, '+
         '   ITEMCONTRATUAL I, '+
         '   PESSOA P '+
         'WHERE '+
         '   (C.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (C.IDCONTRATO = OXI.IDCONTRATO(+)) AND '+
         '   (C.IDFORCLI = P.IDPESSOA) AND '+
         '   (OXI.IDOBJETO = O.IDOBJETO(+)) AND '+
         '   (OXI.IDITEM = I.IDITEM(+)) AND '+
         '   ((C.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
         '                      WHERE (IDUSUARIO = '+FloatToStr(rIDUsuario)+'))) OR '+
         '   NOT EXISTS(SELECT C1.IDCONTRATO '+
         '              FROM CONTRATOUSUARIO C1 '+
         '              WHERE (C1.IDCONTRATO = C.IDCONTRATO))) '+
         'ORDER BY C.NOMECONTRATO,I.IDITEM,O.IDOBJETO ';
   Result:=GetDataPacket(sSql);
end;


function TCtrlUsuXContrato.ListGeracaoContrato(const rIDPessoa, rIDUsuario, rIDContrato: Double;
                                               const dInicio, dTermino: TDateTime): OleVariant;
var sSql, sParam, sIni, sFim : String;
begin
   // Define Parametros
   sIni   := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dInicio)) + ',''DD/MM/YYYY'')';
   sFim   := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYY',dTermino)) + ',''DD/MM/YYYY'')';
   sParam := ' AND DECODE(O.DATAULTGERACAO,NULL,O.DATAINICIOCOBR, '+#13+
             '              DECODE(O.FREQUENCIA,''D'',( O.DATAULTVENC+NVL(O.INTERVALO,0) ),               '+#13+
             '                                  ''M'',ADD_MONTHS(O.DATAULTVENC,NVL(O.INTERVALO,0) ),      '+#13+
             '                                  ''A'',ADD_MONTHS(O.DATAULTVENC,(12*NVL(O.INTERVALO,0)) ), '+#13+
             '                                      ( O.DATAULTVENC+NVL(O.INTERVALO,0) ) ))               '+#13+
             '     BETWEEN ' + sIni + ' AND ' + sFim +#13;

   if rIDContrato > 0 then begin
      sParam := sParam +
                ' AND C.IDCONTRATO IN (SELECT IDCONTRATO      '+#13+
                '                        FROM CONTRATOUSUARIO '+#13+
                '                       WHERE IDUSUARIO  = ' + FloatToStr(rIDUsuario)  +#13+
                '                         AND IDCONTRATO = ' + FloatToStr(rIDContrato) + ' ) '+#13;
   end else begin
      sParam := sParam +
                ' AND C.IDCONTRATO IN (SELECT IDCONTRATO      '+#13+
                '                        FROM CONTRATOUSUARIO '+#13+
                '                       WHERE IDUSUARIO = ' + FloatToStr(rIDUsuario) + ' ) '+#13;
   end;

   sSql := 'SELECT C.CODCONTRATOEMPR, C.NOMECONTRATO, C.IDCONTRATO, C.CODCENTRORESPON, C.UNIDNEGOC, '+#13+
           '       C.TIPOCONTRATO,    C.CODPORTFORMA, C.IDFORCLI,   C.CODTIPDOC,           '+#13+
           '       O.MOECODIGO,       O.IDITEM,       O.IDOBJETO,   O.VALORTOTALOBJETO,    '+#13+
           '       O.QTDEITEM,        O.OBSERVACAO,   O.IDPATRO,    O.VALORUNITARIOOBJETO, '+#13+
           '       O.IDPLANOPREV,     O.IDPROGRAMA,   OI.RECPAG,    OI.CODTIPRECDES,       '+#13+
           '       OI.CODSUBCONTA,    OI.PLACONTA,    TR.ATIVO AS RECDES_ATIVO,            '+#13+
           '       TR.PLACONTACREDITO, '+#13+//Bruno Bastos - Pend. 17963 - 19/10/2004
           '       DECODE(O.DATAULTGERACAO,NULL,O.DATAINICIOCOBR,                          '+#13+
           '              DECODE(O.FREQUENCIA,''D'',( O.DATAULTVENC+NVL(O.INTERVALO,0) ),  '+#13+
           '                                  ''M'',ADD_MONTHS(O.DATAULTVENC,NVL(O.INTERVALO,0) ),      '+#13+
           '                                  ''A'',ADD_MONTHS(O.DATAULTVENC,(12*NVL(O.INTERVALO,0)) ), '+#13+
           '                                      ( O.DATAULTVENC+NVL(O.INTERVALO,0) ) )) AS DATAVENC   '+#13+
           '  FROM CONTRATOCONTR C,  OBJETOSXITEMCONTR O, OBJETOXITEM OI, '+#13+
           '       ITEMCONTRATUAL I, TIPORECEBDESEMB TR, RADINSTPROCESSO R '+#13+
           ' WHERE C.IDPESSOA = ' + FloatToStr(rIDPessoa) +#13+
           '   AND C.FLGFIMCONTRATO = ''S''     '+#13+
           '   AND I.TIPOCOBRANCA = ''PS''      '+#13+
           '   AND C.IDCONTRATO = O.IDCONTRATO  '+#13+
           '   AND C.IDPROCESSORAD = R.IDPROCESSO(+) '+ #13 +
           '   AND ( (C.IDPROCESSORAD IS NULL) OR (R.FLGOK = ''S'') ) ' + #13 +
           '   AND O.IDOBJETO = OI.IDOBJETO     '+#13+
           '   AND O.IDITEM = OI.IDITEM         '+#13+
           '   AND O.IDITEM = I.IDITEM          '+#13+
           '   AND OI.IDPESSOA = TR.IDPESSOA(+) '+#13+
           '   AND OI.RECPAG = TR.RECPAG(+)     '+#13+
           '   AND OI.CODTIPRECDES = TR.CODTIPRECDES(+) '+#13+ sParam +
           ' ORDER BY C.IDCONTRATO ';

   Result := GetDataPacket( sSql );
end;



function TCtrlUsuXContrato.ContratoPossuiAditamentoComRADPendente( const rIdContrato: Double): Boolean;
var
   sSQL : String;
   _cdsAux : TCMClientDataSet;
begin
   _cdsAux := TCMClientDataSet.Create(nil);

   sSQL :=
   'SELECT '                                       + #13 +
   '    COUNT(*) AS TOTAL '                        + #13 +
   'FROM '                                         + #13 +
   '    ADITAMENTO A, '                            + #13 +
   '    RADINSTPROCESSO R '                        + #13 +
   'WHERE '                                        + #13 +
   '    A.IDCONTRATO = ' + FloatToStr(rIdContrato) + #13 +
   'AND A.NUMRAD     = R.IDPROCESSO '              + #13 +
   'AND R.FLGOK      = ''N'' '                     + #13;

   try
      _cdsAux.Data := GetDataPacket(sSQL);
      Result := ( _cdsAux.FieldByName('TOTAL').AsInteger > 0 );
   finally
      _cdsAux.Free;
   end;
end;



end.
