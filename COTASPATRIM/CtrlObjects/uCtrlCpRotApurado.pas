unit uCtrlCpRotApurado;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient,
     uCMClientDataSet, UCMTypes, Dialogs, uCtrlPadroes, uDbCpRotApurado,
     uDbCpRotAprEnt;

type
  TCtrlCpRotApurado = Class(TCmControlObject)
  private

    DbCpRotApurado :  TDbCpRotApurado;
    DbCpRotAprEnt  : TDbCpRotAprEnt;

    function SQLDadosRotAprEnt : string;

  protected

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;

  public
    cds       : TCMClientDataSet;
    cdsEnt    : TCMClientDataSet;

    Constructor Create; override;
    Destructor Destroy; override;

    function SelecionaRotApurado( iIdcprotapurado : integer ) : OleVariant;

    function DadosRotApurado(    iIdCpRotApurado : integer    ) : OleVariant;
    function ConsultaRotApurado( iIdCpRotApurado : integer;
                                 iIdCpRoteiro    : integer;
                                 iIdCpExecRot    : integer;
                                 iIdCpAtivo      : integer;
                                 sTipoApur       : string;
                                 sSituacao       : string;
                                 dDtApuracao     : TDateTime;
                                 sNomeUsuario    : string;
                                 dDtExecucao     : TDateTime;
                                 sNoDocumento    : string;
                                 sOperacao       : string;
                                 iNumLancto      : integer;
                                 sObs            : string  ) : OleVariant;

    function DadosRotAprEnt( iIdCpRotApurado : integer ) : OleVariant; overload;
    function DadosRotAprEnt( sIdCpRotApurado : string  ) : OleVariant; overload;

    function DadosRotAprMov( iIdCpRotApurado : integer ) : OleVariant;

    function ExcluiApuracoes( sId : string ) : boolean;

    function SQLRoteiros : string;

    Function GravaDados  : Boolean;
    Function ExcluiDados : Boolean;

   end;


implementation

constructor TCtrlCpRotApurado.Create;
begin
  inherited;
  DbCpRotApurado   := TDbCpRotApurado.Create(Self);
  DbCpRotAprEnt    := TDbCpRotAprEnt.Create(Self);
end;

destructor TCtrlCpRotApurado.Destroy;
begin
  DbCpRotApurado.Free;
  DbCpRotAprEnt.Free;

  if IsAppServer then
  begin
    cds.Free;
    cdsEnt.Free;
  end;
  
  inherited;
end;

procedure TCtrlCpRotApurado.DoChangeDataBase;
begin
  inherited;
  DbCpRotApurado.DataBaseName := Databasename;
  DbCpRotAprEnt.DataBaseName  := Databasename;
end;

procedure TCtrlCpRotApurado.OnCreateAppServer;
begin
  inherited;
  cds    := TCMClientDataSet.Create(nil);
  cdsEnt := TCMClientDataSet.Create(nil);
end;

function TCtrlCpRotApurado.SelecionaRotApurado( iIdcprotapurado : integer ) : OleVariant;
begin
  DbCpRotApurado.Idcprotapurado.AsInteger := iIdcprotapurado;
  Result := GetDataPacket( DbCpRotApurado.SSqlSelect );
end;

function TCtrlCpRotApurado.GravaDados : Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaDados;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( cds, DbCpRotApurado, [],[] );
      if not Result then Raise Exception.Create( DbCpRotApurado.MessageInfo );

      Result := ApplyCds( cdsEnt, DbCpRotAprEnt, [DbCpRotApurado.Idcprotapurado], [DbCpRotAprEnt.Idcprotapurado] );
      if not Result then Raise Exception.Create( DbCpRotAprEnt.MessageInfo );

      Commit;

      Result := True;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlCpRotApurado.ExcluiDados : Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiDados;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( cdsEnt, DbCpRotAprEnt, [], [] );
      if not Result then raise Exception.Create( DbCpRotAprEnt.MessageInfo );

      Result := ApplyCds( cds, DbCpRotApurado, [], [] );
      if not Result then raise Exception.Create( DbCpRotApurado.MessageInfo );

      Commit;

    except
      on E : Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlCpRotApurado.DadosRotApurado( iIdCpRotApurado : integer ) : OleVariant;
begin
  Result := GetDataPacket( SQLRoteiros +
   ' AND      cra.FLGTIPOAPUR    = ''M'' ' +
   ' AND      cra.IDCPROTAPURADO = ' + IntToStr( iIdCpRotApurado ) +
   ' ORDER BY cra.DTAPURACAO       ' );
end;

function TCtrlCpRotApurado.DadosRotAprEnt( iIdCpRotApurado : integer ) : OleVariant;
begin
  Result := GetDataPacket( SQLDadosRotAprEnt + ' and  cra.IDCPROTAPURADO = ' + IntToStr( iIdCpRotApurado ) +
   'order by cte.NOME ' );
end;

function TCtrlCpRotApurado.DadosRotAprMov( iIdCpRotApurado : integer ) : OleVariant;
begin
  Result := GetDataPacket(
   ' SELECT cra.IDCPROTAPRMOV       ,                                                 ' +
   '        ctm.NOME                ,                                                 ' +
   '        cra.VALOR               ,                                                 ' +
   '        cra.IDCPTIPOMOVIM       ,                                                 ' +
   '        cra.IDCPROTAPURADO      ,                                                 ' +
   '        ctm.NOMEPARAREGRA       ,                                                 ' +
   '        cra.IDREGRA             ,                                                 ' +
   '        cra.IDCPROTAPRENT       ,                                                 ' +
   '        cra.IDCPCONTA           ,                                                 ' +
   '        cra.FLGTPMOVIM          ,                                                 ' +
   '        cra.QTDECOTAS           ,                                                 ' +   
   '        decode( cra.FLGORIGEM, ''E'', ''Entrada'', ''R'', ''Regra'' ) as ORIGEM , ' +
   '        r.NOMEREGRA             ,                                                 ' +
   '        ctm.NOME as NOMEMOVIM   ,                                                 ' +
   '        cte.NOME as NOMEENTRADA ,                                                 ' +
   '        C.NOME as NOMECONTA                                                       ' +
   ' FROM   CPROTAPRMOV     cra ,                                                     ' +
   '        CPTIPOMOVIM     ctm ,                                                     ' +
   '        REGRA           r   ,                                                     ' +
   '        CPROTAPRENT     cre ,                                                     ' +
   '        CPTPENTRADA     cte ,                                                     ' +
   '        CPCONTA         c                                                         ' +
   ' WHERE  cra.IDCPTIPOMOVIM   = ctm.IDCPTIPOMOVIM                                   ' +
   '   AND  cra.IDCPCONTA       = c.IDCPCONTA       (+)                               ' +
   '   AND  cra.IDREGRA         = r.IDREGRA         (+)                               ' +
   '   AND  cra.IDCPROTAPRENT   = cre.IDCPROTAPRENT (+)                               ' +
   '   AND  cre.IDCPTPENTRADA   = cte.IDCPTPENTRADA (+)                               ' +
   '   AND  cra.IDCPROTAPURADO  = ' + IntToStr( iIdCpRotApurado )                       +
   ' ORDER BY ctm.NOME ' );
end;

function TCtrlCpRotApurado.SQLRoteiros: string;
begin
  Result :=
   ' SELECT cra.IDCPROTAPURADO   ,                                                                       ' +
   '        cr.NOME              ,                                                                       ' +
   '        cra.DTAPURACAO       ,                                                                       ' +
   '        usu.NOMEUSUARIO      ,                                                                       ' +
   '        cra.IDCPROTEIRO      ,                                                                       ' +
   '        cra.IDUSUARIO        ,                                                                       ' +
   '        cra.FLGTIPOAPUR      ,                                                                       ' +
   '        decode( cra.FLGTIPOAPUR, ''M'', ''Manual'', ''D'', ''Por documento'',                        ' +
   ' ''F'', ''Por lançamento financeiro'' ) as TIPOAPUR,                                                 ' +
   '        cra.FLGSTATUS        ,                                                                       ' +
   '        decode( cra.FLGSTATUS, ''A'', ''Apurado'', ''E'', ''Executado'', ''Cotizado'' ) as SITUACAO, ' +
   '        cer.DTEXECUCAO       ,                                                                       ' +
   '        cr.IDCPATIVO         ,                                                                       ' +
   '        cra.OBSERVACAO       ,                                                                       ' +
   '        cra.CODDOCUMENTO     ,                                                                       ' +
   '        cra.NUMLANCTO        ,                                                                       ' +
   '        cra.FLGOPERACAO      ,                                                                       ' +
   '        cr.FLGORIGEM         ,                                                                       ' +
   '        cra.CODLANCFINANC    ,                                                                       ' +
   '        decode( cra.FLGOPERACAO, ''D'', ''Baixa Documento'', ''E'',                                  ' +
   '         ''Estorno Baixa'', ''P'', ''Próxima Baixa'', '''' ) as OPERACAO,                            ' +
   '        cra.IDCPEXECROT      ,                                                                       ' +
   '        d.NODOCUMENTO        ,                                                                       ' +
   '        l.DATALANCTO         ,                                                                       ' +
   '        a.IDPLANOPREV        ,                                                                       ' +
   '        a.IDPATRO            ,                                                                       ' +
   '        a.NOME as NOMEATIVO  ,                                                                       ' +
   '        v.DTCOTA                                                                                     ' +
   ' FROM   CPROTAPURADO    cra  ,                                                                       ' +
   '        CPROTEIRO       cr   ,                                                                       ' +
   '        USUARIOSISTEMA  usu  ,                                                                       ' +
   '        CPEXECROT       cer  ,                                                                       ' +
   '        DOCUMENTO       d    ,                                                                       ' +
   '        LANCTODOCUM     l    ,                                                                       ' +
   '        CPATIVO         a    ,                                                                       ' +
   '        CPVALORCOTA     v                                                                            ' +
   ' WHERE  cra.IDCPROTEIRO    = cr.IDCPROTEIRO                                                          ' +
   '   AND  cra.IDUSUARIO      = usu.IDUSUARIO                                                           ' +
   '   AND  cr.IDCPATIVO       = a.IDCPATIVO                                                             ' +
   '   AND  cra.IDCPEXECROT    = cer.IDCPEXECROT (+)                                                     ' +
   '   AND  cra.CODDOCUMENTO   = d.CODDOCUMENTO  (+)                                                     ' +
   '   AND  cra.CODDOCUMENTO   = l.CODDOCUMENTO  (+)                                                     ' +
   '   AND  cra.NUMLANCTO      = l.NUMLANCTO     (+)                                                     ' +
   '   AND  cer.IDCPVALORCOTA  = v.IDCPVALORCOTA (+)                                                     ' ;
end;

function TCtrlCpRotApurado.DadosRotAprEnt( sIdCpRotApurado : string ) : OleVariant;
begin
  Result := GetDataPacket( SQLDadosRotAprEnt + ' and  cra.IDCPROTAPURADO in ( ' + sIdCpRotApurado + ' )' +
   'order by cte.NOME ' );
end;

function TCtrlCpRotApurado.SQLDadosRotAprEnt: string;
begin
  Result :=
   ' SELECT cra.IDCPROTAPRENT                                        , ' +
   '        cte.NOME                                                 , ' +
   '        cra.VALOR                                                , ' +
   '        cra.IDCPTPENTRADA                                        , ' +
   '        cra.IDCPROTAPURADO                                       , ' +
   '        cte.NOMEPARAREGRA                                        , ' +
   '        cra.IDPESSOA                                             , ' +
   '        cra.RECPAG                                               , ' +
   '        cra.CODTIPRECDES                                         , ' +
   '        cra.CODALTERADOR                                         , ' +
   '        trc.DESCRICAO as DESCRECDES                              , ' +
   '        cra.FLGORIGEM                                            , ' +
   '        ta.DESCRICAO as DESCALTERADOR                            , ' +
   '        decode( cra.FLGORIGEM, ''R'', ''Desembolso/Recebimento'' , ' +
   '         ''V'', ''Valor Líquido da Operação'',                     ' +
   '         ''A'', ''Alterador'',                                     ' +
   '         ''Q'', ''Quantidade de Cotas'' ) as ORIGEM                ' +
   ' FROM   CPROTAPRENT     cra ,                                      ' +
   '        CPTPENTRADA     cte ,                                      ' +
   '        TIPORECEBDESEMB trc ,                                      ' +
   '        TIPOALTERADOR   ta                                         ' +
   ' WHERE  cra.IDCPTPENTRADA   = cte.IDCPTPENTRADA                    ' +
   '   and  cra.IDPESSOA        = trc.IDPESSOA      (+)                ' +
   '   and  cra.RECPAG          = trc.RECPAG        (+)                ' +
   '   and  cra.CODTIPRECDES    = trc.CODTIPRECDES  (+)                ' +
   '   and  cra.CODALTERADOR    = ta.CODALTERADOR   (+)                ' ;
end;

function TCtrlCpRotApurado.ConsultaRotApurado( iIdCpRotApurado : integer;
                                               iIdCpRoteiro    : integer;
                                               iIdCpExecRot    : integer;
                                               iIdCpAtivo      : integer;
                                               sTipoApur       : string;
                                               sSituacao       : string;
                                               dDtApuracao     : TDateTime;
                                               sNomeUsuario    : string;
                                               dDtExecucao     : TDateTime;
                                               sNoDocumento    : string;
                                               sOperacao       : string;
                                               iNumLancto      : integer;
                                               sObs            : string ) : OleVariant;
var
  sSQL : string;
begin
  sSQL := SQLRoteiros + ' AND cra.FLGSTATUS in ( ''E'', ''C'' ) ';

  if iIdCpRotApurado > 0 then
    sSQL := sSQL + ' AND cra.IDCPROTAPURADO = ' + IntToStr( iIdCpRotApurado );

  if iIdCpRoteiro > 0 then
    sSQL := sSQL + ' AND cra.IDCPROTEIRO = ' + IntToStr( iIdCpRoteiro );

  if iIdCpExecRot > 0 then
    sSQL := sSQL + ' AND cra.IDCPEXECROT = ' + IntToStr( iIdCpExecRot );

  if iIdCpAtivo > 0 then
    sSQL := sSQL + ' AND cr.IDCPATIVO = ' + IntToStr( iIdCpAtivo );

  if sTipoApur <> '' then
    sSQL := sSQL + ' AND cra.FLGTIPOAPUR = ' + QuotedStr( sTipoApur );

  if sSituacao <> '' then
    sSQL := sSQL + ' AND cra.FLGSTATUS = ' + QuotedStr( sSituacao );

  if dDtApuracao > 0 then
    sSQL := sSQL + ' AND trunc( cra.DTAPURACAO ) = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtApuracao ) ) + ', ''DD/MM/YYYY'' ) ' ;

  if sNomeUsuario <> '' then
    sSQL := sSQL + ' AND usu.NOMEUSUARIO = ' + QuotedStr( UpperCase( sNomeUsuario ) );

  if dDtExecucao > 0 then
    sSQL := sSQL + ' AND trunc( cer.DTEXECUCAO ) = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDtExecucao ) ) + ', ''DD/MM/YYYY'' ) ' ;

  if sNoDocumento <> '' then
    sSQL := sSQL + ' AND d.NODOCUMENTO = ' + QuotedStr( sNoDocumento );

  if sOperacao <> '' then
    sSQL := sSQL + ' AND cra.FLGOPERACAO = ' + QuotedStr( UpperCase( sOperacao ) );

  if iNumLancto > 0 then
    sSQL := sSQL + ' AND cra.NUMLANCTO = ' + IntToStr( iNumLancto );

  if sObs <> '' then
    sSQL := sSQL + ' AND upper( cra.OBSERVACAO ) like ''%' + UpperCase( sObs ) + '%''';

  sSQL := sSQL + ' ORDER BY cra.DTAPURACAO ';

  Result := GetDataPacket( sSQL );
end;

function TCtrlCpRotApurado.ExcluiApuracoes(sId: string): boolean;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try

    StartTransaction;
    try
      cdsLocal.Data := GetDataPacket( ' select * from CPROTAPURADO where IDCPROTAPURADO in (' + sId + ' ) ' );
      cdsLocal.First;
      while not cdsLocal.Eof do
      begin

        //Exclui movimentações
        ExecSQL( ' delete from CPROTAPRMOV ' +
                 ' where  IDCPROTAPURADO =  ' + cdsLocal.FieldByName('IDCPROTAPURADO').AsString );

        //Se for apuração manual...
        if cdsLocal.FieldByName('FLGTIPOAPUR').AsString = 'M' then
        begin
          //Altera a situação do roteiro
          ExecSQL( ' update CPROTAPURADO           ' +
                   ' set    IDCPEXECROT    = null, ' +
                   '        FLGSTATUS      = ''A'' ' +
                   ' where  IDCPROTAPURADO = ' + cdsLocal.FieldByName('IDCPROTAPURADO').AsString );
        end
        else
        begin
          //Exclui os relacionamentos com rateios
          ExecSQL( ' delete from CPROTENTRD ' +
                   ' where IDCPROTAPRENT in ( ' +
                   '  select IDCPROTAPRENT from CPROTAPRENT where  IDCPROTAPURADO = ' + cdsLocal.FieldByName('IDCPROTAPURADO').AsString + ' ) ' );

          //Exclui as entradas
          ExecSQL( ' delete from CPROTAPRENT ' +
                   ' where  IDCPROTAPURADO =  ' + cdsLocal.FieldByName('IDCPROTAPURADO').AsString );

          //Exclui o roteiro         
          ExecSQL( ' delete from CPROTAPURADO ' +
                   ' where  IDCPROTAPURADO =  ' + cdsLocal.FieldByName('IDCPROTAPURADO').AsString );
        end;
        cdsLocal.Next;
      end;

      Commit;

      Result := True;

    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;

  finally
    cdsLocal.Free;
  end;
end;

end.
