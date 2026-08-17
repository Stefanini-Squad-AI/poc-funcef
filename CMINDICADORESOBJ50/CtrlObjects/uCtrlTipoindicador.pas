unit uCtrlTipoIndicador;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE TIPO DE INDICADORES  ( MT )
//
//      Módulo          :  Indicadores
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  13/05/2002
//      Data de Término :  15/05/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaTipoIndicador     -  Ins,Alt,Del cadastro de Tipo de Indicador     ( TLB )
//      GravaSubTipoIndicador  -  Ins,Alt cadastro de Tipo de Indicador         ( TLB )
//      ExcluiSubTipoIndicador -  Del cadastro de Tipo de Indicador             ( TLB )
//      LookupTipoIndicador    -  Abre um ou vários grupo de relatorio
//      LookupSubTipoIndicador -  Abre um ou vários SubGrupo de relatorio
//      LookupGrpIndicador     -  Abre um ou vários IndicadorXSubGrupo de relatorio
// -----------------------------------------------------------------------------

interface


Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbTipoIndicador, uDbSubTipoIndicador, uDbGrpIndicador;

Type TCtrlTipoIndicador = class(TCmControlObject)

     private
       FCdsTipoIndicador   : TCMClientDataSet;
       FCdsSubTipoIndicador: TCMClientDataSet;
       FCdsGrpIndicador    : TCMClientDataSet;
       FDbTipoIndicador    : TDbTipoIndicador;
       FDbSubTipoIndicador : TDbSubTipoIndicador;
       FDbGrpIndicador     : TDbGrpIndicador;

       procedure SetCdsTipoIndicador   (const Value: TCMClientDataSet);
       procedure SetCdsSubTipoIndicador(const Value: TCMClientDataSet);
       procedure SetCdsGrpIndicador    (const Value: TCMClientDataSet);
       procedure SetDbTipoIndicador    (const Value: TDbTipoIndicador);
       procedure SetDbSubTipoIndicador (const Value: TDbSubTipoIndicador);
       procedure SetDbGrpIndicador     (const Value: TDbGrpIndicador);

     protected
       procedure AfterInitialize; Override;
       procedure OnCreateAppServer; Override;

     public
       constructor Create; override;
       destructor Destroy; override;

       property DbTipoIndicador     : TDbTipoIndicador    read FDbTipoIndicador     write SetDbTipoIndicador;
       property DbSubTipoIndicador  : TDbSubTipoIndicador read FDbSubTipoIndicador  write SetDbSubTipoIndicador;
       property DbGrpIndicador      : TDbGrpIndicador     read FDbGrpIndicador      write SetDbGrpIndicador;
       property CdsTipoIndicador    : TCMClientDataSet    read FCdsTipoIndicador    write SetCdsTipoIndicador;
       property CdsSubTipoIndicador : TCMClientDataSet    read FCdsSubTipoIndicador write SetCdsSubTipoIndicador;
       property CdsGrpIndicador     : TCMClientDataSet    read FCdsGrpIndicador     write SetCdsGrpIndicador;

       function GravaTipoIndicador     : Boolean;
       function GravaSubTipoIndicador  : Boolean;
       function ExcluiSubTipoIndicador : Boolean;
       function LookupTipoIndicador    (const iIdTipoIndicador:Integer = -1) : OLEVariant;
       function LookupSubTipoIndicador (const iIdSubTipo:Integer = -1; const iIdTipo:Integer = -1) : OLEVariant;
       function LookupGrpIndicador     (const iIdSubTipo:Integer = -1; const iIdTipo:Integer = -1) : OLEVariant;

    published

end;

implementation

{ TCtrlTipoIndicador }

constructor TCtrlTipoIndicador.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbTipoIndicador    := TDBTipoIndicador.Create( Self );
  FDbSubTipoIndicador := TDBSubTipoIndicador.Create( Self );
  FDbGrpIndicador     := TDBGrpIndicador.Create( Self );
end;

destructor TCtrlTipoIndicador.Destroy;
begin
  // Destrói os DbObjects criados
  FDbTipoIndicador.Free;
  FDbSubTipoIndicador.Free;
  FDbGrpIndicador.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if IsAppServer then begin
    FCdsTipoIndicador.Free;
    FCdsSubTipoIndicador.Free;
    FCdsGrpIndicador.Free;
  end;
  inherited;
end;

procedure TCtrlTipoIndicador.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsTipoIndicador    := TCMClientDataSet.Create( nil );
  FCdsSubTipoIndicador := TCMClientDataSet.Create( nil );
  FCdsGrpIndicador     := TCMClientDataSet.Create( nil );
end;

procedure TCtrlTipoIndicador.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDBTipoIndicador.DataBaseName    := DataBaseName;
  FDBSubTipoIndicador.DataBaseName := DataBaseName;
  FDBGrpIndicador.DataBaseName     := DataBaseName;
end;

function TCtrlTipoIndicador.GravaTipoIndicador: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaTipoIndicador( CdsTipoIndicador.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsTipoIndicador, DbTipoIndicador, [], [] );
      if not Result then raise Exception.Create( DbTipoIndicador.MessageInfo );
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


function TCtrlTipoIndicador.GravaSubTipoIndicador: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaSubTipoIndicador( CdsSubTipoIndicador.Data, CdsGrpIndicador.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Grava SubTipoIndicador  ( Pai )
      Result := ApplyCds( CdsSubTipoIndicador, DbSubTipoIndicador, [], [] );
      if not Result then raise Exception.Create( DbSubTipoIndicador.MessageInfo );

      // Grava Grupo de Indicadores ( Filho )
      Result := ApplyCds( CdsGrpIndicador, DbGrpIndicador, [DbSubTipoIndicador.IdSubTipo], [DbGrpIndicador.IdSubTipo] );
      if not Result then raise Exception.Create( DbSubTipoIndicador.MessageInfo );

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


function TCtrlTipoIndicador.ExcluiSubTipoIndicador: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiSubTipoIndicador( CdsSubTipoIndicador.Data, CdsGrpIndicador.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos os filhos para exclusão
      CdsGrpIndicador.First;
      while not CdsGrpIndicador.Eof do CdsGrpIndicador.Delete;

      // Exclui Grupo de Indicadores ( Filho )
      Result := ApplyCds( CdsGrpIndicador, DbGrpIndicador, [], [] );
      if not Result then raise Exception.Create( DbSubTipoIndicador.MessageInfo );

      // Exclui SubTipoIndicador  ( Pai )
      Result := ApplyCds( CdsSubTipoIndicador, DbSubTipoIndicador, [], [] );
      if not Result then raise Exception.Create( DbSubTipoIndicador.MessageInfo );

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


function TCtrlTipoIndicador.LookupTipoIndicador(const iIdTipoIndicador: Integer): OLEVariant;
var sSql,sParam : String;
begin
  // Monta cláusula de parâmetros
  sParam := '';
  if iIdTipoIndicador > 0 then sParam := sParam + ' AND IDTIPO = ' + IntToStr(iIdTipoIndicador);

  sSql := 'SELECT  IDTIPO, DESCRICAO ' +
          '  FROM  INDTIPOINDICADOR ' +
          ' WHERE  1=1 ' +
          sParam +
          ' ORDER BY DESCRICAO ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


function TCtrlTipoIndicador.LookupSubTipoIndicador(const iIdSubTipo,iIdTipo: Integer): OLEVariant;
var sSql,sParam : String;
begin
  // Monta cláusula de parâmetros
  sParam := '';
  if iIdTipo <> -1    then sParam := sParam + ' AND ST.IDTIPO = ' + IntToStr(iIdTipo);
  if iIdSubTipo <> -1 then sParam := sParam + ' AND ST.IDSUBTIPO = ' + IntToStr(iIdSubTipo);

  sSql := 'SELECT  ST.IDSUBTIPO, ST.IDTIPO,   ST.DESCRICAO, ' +#13+
          '        ST.IDREPORTS, ST.ORIGEMCM, TI.DESCRICAO AS DSC_TIPO ' +#13+
          '  FROM  INDSUBTIPOINDICADOR ST, ' +#13+
          '        INDTIPOINDICADOR TI ' +#13+
          ' WHERE  TI.IDTIPO = ST.IDTIPO ' +#13+ sParam +#13+
          ' ORDER BY DSC_TIPO, ST.DESCRICAO ';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


function TCtrlTipoIndicador.LookupGrpIndicador(const iIdSubTipo,iIdTipo: Integer): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam := '';
  if iIdTipo <> -1    then sParam := sParam + ' AND ST.IDTIPO = ' + IntToStr(iIdTipo);
  if iIdSubTipo <> -1 then sParam := sParam + ' AND ST.IDSUBTIPO = ' + IntToStr(iIdSubTipo);

  // Define SQL
  sSql := 'SELECT GI.IDGRPINDICADOR, GI.IDSUBTIPO, GI.IDINDICADOR, ' +#13+
          '       GI.TIPOLANCA,      GI.ORDEM,     ST.IDTIPO, ' +#13+
          '       DECODE(GI.TIPOLANCA,' +QuotedStr('P')+','+QuotedStr('PREVISTO')+','+QuotedStr('REALIZADO')+ ') AS DSC_TIPOLANCA, ' +#13+
          '       I.FLGCONTRATO,     I.PERIODICIDADE, I.NIVELVERIFICA, ' +#13+
          '       I.FLGGRPAPURACAO,  I.FLGSUBGRPAPURACAO, ' +#13+ 
          '       I.DESCRICAO  AS DSC_INDICADOR, ' +#13+
          '       ST.DESCRICAO AS DSC_SUBTIPO,   ' +#13+
          '       TI.DESCRICAO AS DSC_TIPO       ' +#13+
          '  FROM INDGRPINDICADOR GI,     ' +#13+
          '       INDINDICADOR I,         ' +#13+
          '       INDSUBTIPOINDICADOR ST, ' +#13+
          '       INDTIPOINDICADOR TI     ' +#13+
          ' WHERE GI.IDINDICADOR = I.IDINDICADOR ' +#13+
          '   AND GI.IDSUBTIPO   = ST.IDSUBTIPO  ' +#13+
          '   AND ST.IDTIPO      = TI.IDTIPO     ' +#13+ sParam +#13+
          'ORDER BY DSC_TIPO, DSC_SUBTIPO, DSC_INDICADOR, DSC_TIPOLANCA';

  // Executa o sql e retorna o pacote de dados
  Result := GetDataPacket( sSql );
end;


procedure TCtrlTipoIndicador.SetCdsTipoIndicador(const Value: TCMClientDataSet);
begin
  FCdsTipoIndicador := Value;
end;

procedure TCtrlTipoIndicador.SetDbTipoIndicador(const Value: TDbTipoIndicador);
begin
  FDbTipoIndicador := Value;
end;

procedure TCtrlTipoIndicador.SetCdsGrpIndicador(const Value: TCMClientDataSet);
begin
  FCdsGrpIndicador := Value;
end;

procedure TCtrlTipoIndicador.SetCdsSubTipoIndicador(const Value: TCMClientDataSet);
begin
  FCdsSubTipoIndicador := Value;
end;

procedure TCtrlTipoIndicador.SetDbGrpIndicador(const Value: TDbGrpIndicador);
begin
  FDbGrpIndicador := Value;
end;

procedure TCtrlTipoIndicador.SetDbSubTipoIndicador(const Value: TDbSubTipoIndicador);
begin
  FDbSubTipoIndicador := Value;
end;


end.
