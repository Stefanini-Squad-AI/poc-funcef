// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
// Data      : 02/01/2008
// Código    : AL_2
// Pendencia : 26690
// SOL       : 71636
// Descrição : Melhora na seleção dos tipos de operação
//****************************************************************************//
// Data      : 03/02/2007
// Código    : AL_1
// Pendencia : 22502
// SOL       : 43746
// Descrição : Ajuste no SQL de seleção dos tipos de operação
//****************************************************************************//

unit uCtrlParametros;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMFileUtils, uCMTypes, DB, dbclient, uSistema;

type
  TCtrlParametros = class(TCMControlObject)

  private
    FCdsItemxTipoContr   : TCMClientDataSet;
    FCdsTipoCustoRecImov : TCmClientDataSet;
    FCdsTipoOperacao     : TCmClientDataSet;



    procedure SetCdsItemxTipoContr   (const Value: TCMClientDataSet);
    procedure SetCdsTipoCustoRecImov (const Value: TCMClientDataSet);
    procedure SetCdsTipoOperacao     (const Value: TCMClientDataSet);



  protected
    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create;  override;
    destructor  Destroy; override;


    // Empréstimo
    property  CdsItemxTipoContr     : TCMClientDataSet    read  FCdsItemxTipoContr    write  SetCdsItemxTipoContr;
    function  ListaTipoContrEmptmo  : OleVariant;
    function  ListaItemEmptmo       : OleVariant;
    function  GravaMovCotaEmprestimo(const FlgMovCota         : string;
                                     const FlgCotaRecDes      : string;
                                     const iIdTipoContrEmptmo : integer;
                                     const iIdItemEmptmo      : integer)  : Boolean;
    function  ListaItemXTipoContr   (const iFlgDestacado      : Integer =  0;
                                     const iFlgCentraliza     : Integer =  0;
                                     const iIdItemEmptmo      : Integer = -1;
                                     const iIdTipoContrEmptmo : Integer = -1;
                                     const iItcEvento         : Integer = -1;
                                     const sParamRelatorio    : string  = '-1') : OleVariant;

    // Imobiliário
    property  CdsTipoCustoRecImov   : TCMClientDataSet       read  FCdsTipoCustoRecImov  write  SetCdsTipoCustoRecImov;
    function  ListaModulos          : OleVariant;
    //AL_2
    function  ListaTipoOper(iTipoInvest: Integer = -1) : OleVariant;
    function  GravaMovCotaImobiliario (const FlgMovCota    : string;
                                       const FlgCotaRecDes : string;
                                       const iIdTipoCustoRecImo : integer) : Boolean;
    function  ListaTipoOperFiltrado (const iIdTipoOper        : integer;
                                     const iIdTipoInvest      : integer;
                                     const sParamRelatorio    : string = '-1') : OleVariant;
    //AL_1
    function  ListaDespXTipoOper    (const iTipoOper          : Integer) : OleVariant;

    function  ListaTipoCustorecImov (const iTipoOper          : integer;
                                     const iIdModulo          : integer;
                                     const iIdDescCusto       : integer;
                                     const sParamRelatorio    : string = '-1') : OleVariant;


    //  Investimento
    property  CdsTipoOperacao     : TCMClientDataSet    read  FCdsTipoOperacao      write  SetCdsTipoOperacao;
    function  ListaTipoInvest       : OleVariant;
    function  ListaDescCustoRecImo  (const iIdModulo : integer): OleVariant;
    function  GravaMovCotaInvestimento (const FlgMovCota      : string;
                                        const iIdTipoInvest   : integer;
                                        const iIdTipoOperacao : integer) : Boolean;





 published


end;


implementation



procedure TCtrlParametros.AfterInitialize;
begin
  inherited;
end;


constructor TCtrlParametros.Create;
begin
  inherited;
 end;


destructor TCtrlParametros.Destroy;
begin
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsItemxTipoContr);
    FreeAndNil (FCdsTipoCustoRecImov);
    end;
  inherited;
end;





function TCtrlParametros.GravaMovCotaEmprestimo(const FlgMovCota: string;
  const FlgCotaRecDes : string; const iIdTipoContrEmptmo, iIdItemEmptmo: integer): Boolean;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaCota( CdsTipoCustoRecImov.Data );

    //exibe uma mensagem de erro vinda da aplicacao servidora, caso exista erro
    if not Result then
    MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      //inicia a transacao
      StartTransaction;

      // Aplica as alterações do Cds
      ExecSQL('UPDATE ITEMXTIPOCONTR '                                   + #13 +
              'SET FLGMOVCOTA    = ' + QuotedStr(FlgMovCota)             + #13 +

              'WHERE '                                                   + #13 +
              '  IDTIPOCONTREMPTMO = ' + IntToStr(iIdTipoContrEmptmo)    + #13 +
              'AND '                                                     + #13 +
              '  IDITEMEMPTMO      = ' + IntToStr(iIdItemEmptmo));
      Result := True;
      Commit;

    //em caso de erro, anula transacao
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;

end;






function TCtrlParametros.GravaMovCotaImobiliario(const FlgMovCota : string;
                    const FlgCotaRecDes : string; const iIdTipoCustoRecImo: Integer): Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaCota( CdsTipoCustoRecImov.Data );

    //exibe uma mensagem de erro vinda da aplicacao servidora, caso exista erro
    if not Result then
    MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      //inicia a transacao
      StartTransaction;

      // Aplica as alterações do Cds
      ExecSQL('UPDATE TIPOCUSTORECIMOV '                                 + #13 +
              'SET FLGMOVCOTA    = ' + QuotedStr(FlgMovCota) + ','       + #13 +
              '    FLGCOTARECDES = ' + QuotedStr(FlgCotaRecDes)          + #13 +
              'WHERE IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo));
      Result := True;
      Commit;

    //em caso de erro, anula transacao
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;

end;




function TCtrlParametros.GravaMovCotaInvestimento(const FlgMovCota : string;
              const iIdTipoInvest: integer; const iIdTipoOperacao: integer): Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaCota( CdsTipoOperacao.Data );

    //exibe uma mensagem de erro vinda da aplicacao servidora, caso exista erro
    if not Result then
    MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      //inicia a transacao
      StartTransaction;

      ExecSQL('UPDATE TIPOOPERACAO '                                     + #13 +
              'SET FLGMOVCOTA     = ' + QuotedStr(FlgMovCota)            + #13 +
              'WHERE IDTIPOINVEST = ' + IntToStr(iIdTipoInvest)          + #13 +
              'AND IDTIPOOPERACAO = ' + IntToStr(iIdTipoOperacao));
      Result := True;
     Commit;

    //em caso de erro, anula transacao
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;

end;



function TCtrlParametros.ListaDescCustoRecImo(const iIdModulo : integer): OleVariant;
var
sSQL : string;

begin
  sSQL   := 'SELECT IDTIPOCUSTORECIMO, DESCCUSTORECIMO '                 + #13 +
            'FROM TIPOCUSTORECIMOV ';
            if iIdModulo <> - 1 then
              sSQL := sSQL + 'WHERE IDMODULO = ' + intToStr(iIdModulo);
            sSQL := sSQL + ' ORDER BY DESCCUSTORECIMO';
  Result := GetDataPacket(sSQL);
end;


function TCtrlParametros.ListaItemEmptmo: OleVariant;
var
sSQL : string;

begin
  sSQL   := 'SELECT IDITEMEMPTMO, ITEDESCRICAO FROM ITEMEMPTMO '         + #13 +
            'ORDER BY ITEDESCRICAO';
  Result := GetDataPacket(sSQL);

end;



function TCtrlParametros.ListaItemXTipoContr(const iFlgDestacado: Integer;
                                             const iFlgCentraliza: Integer;
                                             const iIdItemEmptmo, iIdTipoContrEmptmo: Integer;
                                             const iItcEvento : Integer;
                                             const sParamRelatorio : string): OleVariant;
var
sSQL : string;

begin
  sSQL := 'SELECT  IX.IDTIPOCONTREMPTMO, IX.FLGCOTARECDES, IX.IDITEMEMPTMO, T.TCEDESCRICAO,IX.ITCEVENTO, ITE.ITEDESCRICAO, '      + #13 +
          'IX.FLGMOVCOTA, '                                                  + #13 +
          'DECODE(IX.ITCEVENTO,  0, ''Concessão / Renovação'',             ' + #13 +
          '                      1, ''Prestação'',                         ' + #13 +
          '                      2, ''Amortização / Refinanciamento'',     ' + #13 +
          '                      3, ''Quitação'',                          ' + #13 +
          '                      4, ''Atualização de Débito'',             ' + #13 +
          '                      5, ''Atualização de Saldo'',              ' + #13 +
          '                      6, ''Importação / Migração'',             ' + #13 +
          '                      7, ''Ajustes (Cobrança / Devolução)'',    ' + #13 +
          '                      8, ''Ajustes (Saldo Devedor)'' ) AS DESCEVENTO, ' + #13 +
          'DECODE (IX.ITCEVENTO,0,''(+)'', '                             + #13 +
          '                     1,''(-)'', '                             + #13 +
          '                     2,''(-)'', '                             + #13 +
          '                     3,''(-)'', '                             + #13 +
          '                     4,''(+)'', '                             + #13 +
          '                     5,''(+)'', '                             + #13 +
          '                     6,'''',   '                              + #13 +
          '                     7,''(-)'', '                             + #13 +
          '                     8,''(+)'','''') AS DECITEMEVTO '         + #13 +
         'FROM  ITEMXTIPOCONTR IX, TIPOCONTREMPTMO T, ITEMEMPTMO ITE '  + #13 +
          'WHERE '                                                       + #13 +
          '    FLGDESTACADO       = ' + IntToStr(iFlgDestacado)          + #13 +
          'AND FLGCENTRALIZA      = ' + IntToStr(iFlgCentraliza)         + #13 +
          'AND IX.IDTIPOCONTREMPTMO = T.IDTIPOCONTREMPTMO '              + #13 +
          'AND IX.IDITEMEMPTMO    = ITE.IDITEMEMPTMO ';

          if iIdTipoContrEmptmo <> -1 then
            sSQL := sSQL +  'AND IX.IDTIPOCONTREMPTMO = ' + IntToStr(iIdTipoContrEmptmo);
          if iItcEvento <> -1 then
            sSQL := sSQL +  'AND IX.ITCEVENTO         = ' + IntToStr(iItcEvento);
          if iIdItemEmptmo <> -1 then
            sSQL := sSQL +  'AND IX.IDITEMEMPTMO      = ' + IntToStr(iIdItemEmptmo);
          //====================================================================
          //    Este parâmetro é somente usado nas filtragems feita nos
          // relatórios, onde é passado para o parâmetro, as cláusulas
          // 'IN (*.*)' e 'IS NULL'. O valor 'default' é -1.

          if sParamRelatorio <> '-1' then
            sSQL := sSQL + 'AND IX.FLGMOVCOTA ' + sParamRelatorio;

          sSQL := sSQL + ' ORDER BY TCEDESCRICAO, ITEDESCRICAO ';



          //====================================================================




  Result := GetDataPacket(sSQL);
end;




function TCtrlParametros.ListaModulos: OleVariant;
var
sSQL : string;

begin
  sSQL := 'SELECT IDMODULO, NOMEMODULO, DESCRICAOMODULO FROM MODULO '    + #13 +
          'WHERE (IDMODULO = 64 OR IDMODULO = 54 OR IDMODULO = 135) '    + #13 +
          'ORDER BY NOMEMODULO, DESCRICAOMODULO';
  Result := GetDataPacket(sSQL);
end;



function TCtrlParametros.ListaTipoContrEmptmo: OleVariant;
var
sSQL : string;

begin
  sSQL   := 'SELECT IDTIPOCONTREMPTMO, TCEDESCRICAO '                    + #13 +
            'FROM TIPOCONTREMPTMO '                                      + #13 +
            'ORDER BY TCEDESCRICAO';
  Result := GetDataPacket(sSQL);
end;

function TCtrlParametros.ListaTipoCustorecImov(const iTipoOper : integer;
                                               const iIdModulo : integer;
                                               const iIdDescCusto : integer;
                                               const sParamRelatorio : string = '-1'): OleVariant;
var
sSQL : string;
begin
  sSQL := 'SELECT '                                                      + #13 +
          '  IM.IDTIPOCUSTORECIMO, DECODE(IM.RECCUSTO,''C'',''(-)'',''(+)'') '+ #13 +
          '                        AS RECCUSTO, IM.IDMODULO, '           + #13 +
          '  DECODE(IM.IDMODULO,NULL,'''',M.NOMEMODULO) AS DESCMODULO, ' + #13 +
          '  IM.DESCCUSTORECIMO, IM.FLGMOVCOTA  '                        + #13 +
          'FROM '                                                        + #13 +
          '  TIPOCUSTORECIMOV IM, MODULO M '                             + #13 +
          'WHERE '                                                       + #13 +
          '  IM.IDMODULO = M.IDMODULO '                                  + #13 +
          'AND '                                                         + #13 +
          '  IM.RECCUSTO <> ''O'' ';
           case iTipoOper of
            0 : sSQL := sSQL + 'AND RECCUSTO = ''R'' ';
            1 : sSQL := sSQL + 'AND RECCUSTO = ''C'' ';
            2 : sSQL := sSQL + 'AND (RECCUSTO = ''R'' OR RECCUSTO = ''C'') ';
           end;

           if iIdModulo <> -1 then
           sSQL := sSQL + 'AND IM.IDMODULO = ' + IntToStr(iIdModulo);

           if iIdDescCusto <> -1 then
              sSQL := sSQL + 'AND IM.IDTIPOCUSTORECIMO = ' + IntToStr(iIdDescCusto);
           //===================================================================
           //    Este parâmetro é somente usado nas filtragems feita nos
           // relatórios, onde é passado para o parâmetro, as cláusulas
           // 'IN (*.*)' e 'IS NULL'. O valor 'default' é -1.

           if sParamRelatorio <> '-1' then
              sSQL := sSQL + 'AND IM.FLGMOVCOTA ' + sParamRelatorio;
           //===================================================================


  sSQL := sSQL + 'ORDER BY DESCMODULO, DESCCUSTORECIMO ';

  Result := GetDataPacket(sSQL);

end;



function TCtrlParametros.ListaTipoInvest: OleVariant;
var
sSQL : string;

begin
 sSQL := 'SELECT IDTIPOINVEST, DESCTIPOINVEST '                          + #13 +
         'FROM TIPOINVEST '                                              + #13 +
         'ORDER BY DESCTIPOINVEST';
 Result := GetDataPacket(sSQL);
end;


function TCtrlParametros.ListaTipoOper(iTipoInvest: Integer = -1): OleVariant;
var sSQL : string;
begin
   //AL_2
   sSQL := 'SELECT TP.IDTIPOOPERACAO, TP.IDTIPOINVEST, TP.DESCTIPOOPERACAO, TI.DESCTIPOINVEST ' + #13 +
           'FROM TIPOOPERACAO TP, TIPOINVEST TI '                                               + #13 +
           'WHERE TP.IDTIPOINVEST = TI.IDTIPOINVEST '                                           + #13;
   if iTipoInvest <> -1 then
      sSQL := sSQL +
           '  AND TP.IDTIPOINVEST = ' + IntToStr(iTipoInvest)                                   + #13;
   sSQL := sSQL +
           'ORDER BY TI.DESCTIPOINVEST, TP.DESCTIPOOPERACAO';

   Result := GetDataPAcket(sSQL);

end;


function TCtrlParametros.ListaDespXTipoOper(const iTipoOper: Integer): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT TD.DESCTIPODESPINV, ' + #13 +
           '       CASE WHEN (DT.RECPAG = ''P'') THEN ''(+)'' ' + #13 +
           '            WHEN (DT.RECPAG = ''R'') THEN ''(-)'' ' + #13 +
           '            ELSE (DT.RECPAG) ' + #13 +
           '       END AS FLGCOTA, TP.FLGMOVCOTA ' + #13 +
           ' ' + #13 +
           'FROM DESPESASXTIPOOPER DT, TIPODESPINVEST TD, TIPOOPERACAO TP ' + #13 +
           'WHERE DT.IDTIPODESPINVEST = TD.IDTIPODESPINVEST ' + #13 +
           '  AND DT.IDTIPOOPERACAO = TP.IDTIPOOPERACAO ' + #13 +
           '  AND TD.IDTIPODESPINVEST NOT IN (-4, -5) ';
   if iTipoOper <> 0 then
      sSql := sSql + #13 +
           '  AND DT.IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ' ';
   sSql := sSql +
           ' ' + #13 +
           'UNION ' + #13 +
           ' ' + #13 +
           'SELECT ''Lucro / Prejuízo'' AS DESCTIPODESPINV, ' + #13 +
           '       ''(+/-)'' AS FLGCOTA, ''R'' AS FLGMOVCOTA ' + #13 +
           'FROM DUAL ' + #13 +
           'WHERE EXISTS (SELECT IDTIPODESPINVEST ' + #13 +
           '              FROM DESPESASXTIPOOPER ' + #13 +
           '              WHERE IDTIPODESPINVEST IN (-4, -5) ';
   if iTipoOper <> 0 then
      sSql := sSql + #13 +
           '                AND IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ') '
   else
      sSql := sSql + ') ';

        //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
        //CMDebugToFile(sSql, 'C:\Temp\DespesasXTipoOper_' + IntToStr(iTipoOper) + '.txt');
        CMDebugToFile(sSql, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\DespesasXTipoOper_' + IntToStr(iTipoOper) + '.txt');

   Result := GetDataPacket(sSQL);

end;


function TCtrlParametros.ListaTipoOperFiltrado(const iIdTipoOper,
                                               iIdTipoInvest: integer;
                                               const sParamRelatorio : string): OleVariant;
var
sSQL : string;
begin
   //AL_1 - Ini
   sSQL := 'SELECT DISTINCT '                                             + #13 +
           '       T.IDTIPOINVEST, '                                      + #13 +
           '       T.IDTIPOOPERACAO, '                                    + #13 +
           '       T.DESCTIPOOPERACAO, '                                  + #13 +
           '       I.DESCTIPOINVEST, '                                    + #13 +
           '       T.FLGTRANSF, '                                         + #13 +
           '       T.FLGMOVCOTA, '                                        + #13 +
           '       CASE WHEN (T.NATUREZAOPERACAO = ''A'') THEN ''(+)'''   + #13 +
           '            WHEN (T.NATUREZAOPERACAO = ''D'') THEN ''(-)'''   + #13 +
           '            WHEN (T.NATUREZAOPERACAO = ''N'') THEN ''(+/-)''' + #13 +
           '            ELSE  T.NATUREZAOPERACAO '                        + #13 +
           '       END AS FLGCOTA '                                       + #13 +
           'FROM '                                                        + #13 +
           '     TIPOOPERACAO T, '                                        + #13 +
           '     TIPOINVEST I, '                                          + #13 +
           '     TIPOFUNDOINVEST F '                                      + #13 +
           'WHERE '                                                       + #13 +
           '      I.IDTIPOINVEST = T.IDTIPOINVEST '                       + #13 +
           '  AND I.IDTIPOINVEST = F.IDTIPOINVEST ';
   if iIdTipoInvest <> -1 then
      sSQL := sSQL + '  AND T.IDTIPOINVEST = ' + IntToStr(iIdTipoInvest);
   if iIdTipoOper <> - 1 then
      sSQL := sSQL + '  AND T.IDTIPOOPERACAO = ' + IntToStr(iIdTipoOper);

   //=====================================================================
   //    Este parâmetro é somente usado nas filtragems feita nos
   // relatórios, onde é passado para o parâmetro, as cláusulas
   // 'IN (*.*)' e 'IS NULL'. O valor 'default' é -1.
   //   Como aqui esta qry está usando usando UNION, é necessário repetir
   // em todas as qry's do UNION

   if sParamRelatorio <> '-1' then
      sSQL := sSQL + '  AND T.FLGMOVCOTA ' + sParamRelatorio;
   //=====================================================================

   sSQL := sSQL + #13 + #13 +
           'UNION ALL '                                                   + #13 + #13 +
           'SELECT '                                                      + #13 +
           '       T.IDTIPOINVEST, '                                      + #13 +
           '       T.IDTIPOOPERACAO, '                                    + #13 +
           '       T.DESCTIPOOPERACAO, '                                  + #13 +
           '       I.DESCTIPOINVEST, '                                    + #13 +
           '       T.FLGTRANSF, '                                         + #13 +
           '       T.FLGMOVCOTA, '                                        + #13 +
           '       CASE WHEN (T.NATUREZAOPERACAO = ''A'') THEN ''(+)'''   + #13 +
           '            WHEN (T.NATUREZAOPERACAO = ''D'') THEN ''(-)'''   + #13 +
           '            WHEN (T.NATUREZAOPERACAO = ''N'') THEN ''(+/-)''' + #13 +
           '            ELSE  T.NATUREZAOPERACAO '                        + #13 +
           '       END AS FLGCOTARECDES '                                 + #13 +
           'FROM '                                                        + #13 +
           '     TIPOOPERACAO T, '                                        + #13 +
           '     TIPOINVEST I '                                           + #13 +
           'WHERE '                                                       + #13 +
           '      I.IDTIPOINVEST = 1 '                                    + #13 +
           '  AND I.IDTIPOINVEST = T.IDTIPOINVEST ';
   if iIdTipoInvest <> -1 then
      sSQL := sSQL + '  AND T.IDTIPOINVEST = ' + IntToStr(iIdTipoInvest);
   if iIdTipoOper <> - 1 then
      sSQL := sSQL + '  AND T.IDTIPOOPERACAO = ' + IntToStr(iIdTipoOper);

   //=====================================================================
   //    Este parâmetro é somente usado nas filtragems feita nos
   // relatórios, onde é passado para o parâmetro, as cláusulas
   // 'IN (*.*)' e 'IS NULL'. O valor 'default' é -1.
   //   Como aqui esta qry está usando usando UNION, é necessário repetir
   // em todas as qry's do UNION

   if sParamRelatorio <> '-1' then
      sSQL := sSQL + '  AND T.FLGMOVCOTA ' + sParamRelatorio;
   //=====================================================================

   sSQL := sSQL + #13 + #13 +
           'UNION ALL '                                                   + #13 + #13 +
           'SELECT '                                                      + #13 +
           '       T.IDTIPOINVEST, '                                      + #13 +
           '       T.IDTIPOOPERACAO, '                                    + #13 +
           '       T.DESCTIPOOPERACAO, '                                  + #13 +
           '       I.DESCTIPOINVEST, '                                    + #13 +
           '       T.FLGTRANSF, '                                         + #13 +
           '       T.FLGMOVCOTA, '                                        + #13 +
           '       CASE WHEN (T.NATUREZAOPERACAO = ''A'') THEN ''(+)'''   + #13 +
           '            WHEN (T.NATUREZAOPERACAO = ''R'') THEN ''(+)'''   + #13 +
           '            WHEN (T.NATUREZAOPERACAO = ''D'') THEN ''(-)'''   + #13 +
           '            WHEN (T.NATUREZAOPERACAO = ''N'') THEN ''(+/-)''' + #13 +
           '       ELSE  T.NATUREZAOPERACAO '                             + #13 +
           '       END AS FLGCOTARECDES '                                 + #13 +
           'FROM '                                                        + #13 +
           '     TIPOOPERACAO T, '                                        + #13 +
           '     TIPOINVEST I '                                           + #13 +
           'WHERE '                                                       + #13 +
           '      I.IDTIPOINVEST IN (2,8) '                               + #13 +
           '  AND I.IDTIPOINVEST = T.IDTIPOINVEST '                       + #13 +
           '  AND ((T.FLGOPGERENC <> ''S'') OR (T.FLGOPGERENC IS NULL)) ' + #13 +
           '  AND T.NATUREZAOPERACAO IN (''A'',''D'',''N'',''R'') ';

   if iIdTipoInvest <> -1 then
      sSQL := sSQL + '  AND T.IDTIPOINVEST = ' + IntToStr(iIdTipoInvest);
   if iIdTipoOper <> - 1 then
      sSQL := sSQL + '  AND T.IDTIPOOPERACAO = ' + IntToStr(iIdTipoOper);

   //=====================================================================
   //    Este parâmetro é somente usado nas filtragems feita nos
   // relatórios, onde é passado para o parâmetro, as cláusulas
   // 'IN (*.*)' e 'IS NULL'. O valor 'default' é -1.
   //   Como aqui esta qry está usando usando UNION, é necessário repetir
   // em todas as qry's do UNION

   if sParamRelatorio <> '-1' then
      sSQL := sSQL + '  AND T.FLGMOVCOTA ' + sParamRelatorio;
   //=====================================================================

    sSQL := sSQL + #13 + #13 +
            'ORDER BY DESCTIPOINVEST, DESCTIPOOPERACAO ';

  Result := GetDataPAcket(sSQL);
  //AL_1 - Fim

end;



procedure TCtrlParametros.OnCreateAppServer;
begin
  inherited;
  FCdsItemxTipoContr   := TCMClientDataSet.Create(nil);
  FCdsTipoCustoRecImov := TCMClientDataSet.Create(nil);
  FCdsTipoOperacao     := TCMClientDataSet.Create(nil);
end;


procedure TCtrlParametros.SetCdsItemxTipoContr(const Value: TCMClientDataSet);
begin
  FCdsItemxTipoContr := Value;
end;

procedure TCtrlParametros.SetCdsTipoCustoRecImov(
  const Value: TCMClientDataSet);
begin
  FCdsTipoCustoRecImov := Value;
end;

procedure TCtrlParametros.SetCdsTipoOperacao(
  const Value: TCMClientDataSet);
begin
  FCdsTipoOperacao := Value;
end;


end.
