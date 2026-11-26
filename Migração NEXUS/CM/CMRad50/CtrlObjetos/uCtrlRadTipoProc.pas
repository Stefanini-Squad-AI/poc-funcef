{--------------------------------------------------------------------------------------------------
Autor    : Antonio Marcos (amf)
Pendência: 25420
Descrição: Implementada a referência-RAD para o sistema de Cotas Patrimoniais.
--------------------------------------------------------------------------------------------------}


unit uCtrlRadTipoProc;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, DB,
     uCmTypes, uDbRadTipoProc, uDbRadEtapaNovo, uDbRadEtapaDest,
     uDbRadEtapaCond;

Type

  TRADRef = ( rrDoc, rrSolicCompra, rrOrdemCompra, rrPagtoLote,
              rrCotacao, rrReqMaterial, rrDestacaViagem, rrCotasPatrim);

  TCtrlRadTipoProc = class(TCmControlObject)
  private
    FDbRadTipoProc: TDbRadTipoProc;
    FDbRadEtapa: TDbRadEtapa;
    FDbRadEtapaDest: TDbRadEtapaDest;
    FDbRadEtapaCond: TDbRadEtapaCond;
    procedure SetDbRadTipoProc(const Value: TDbRadTipoProc);
    procedure SetDbRadEtapa(const Value: TDbRadEtapa);
    procedure SetDbRadEtapaDest(const Value: TDbRadEtapaDest);
    procedure SetDbRadEtapaCond(const Value: TDbRadEtapaCond);

  protected

    procedure AfterInitialize; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRadTipoProc : TDbRadTipoProc read FDbRadTipoProc write SetDbRadTipoProc;
    property DbRadEtapa : TDbRadEtapa read FDbRadEtapa write SetDbRadEtapa;
    property DbRadEtapaDest : TDbRadEtapaDest read FDbRadEtapaDest write SetDbRadEtapaDest;
    property DbRadEtapaCond : TDbRadEtapaCond read FDbRadEtapaCond write SetDbRadEtapaCond;

    function SelecionaRadTipoProc( iIdRadTipoProc : integer ) : OleVariant;

    function GravaRadTipoProc( oRadTipoProc, oRadEtapa, oRadEtapaDest, oRadEtapaCond : OLEVariant ) : Boolean;
    function ExcluiRadTipoProc( iIdRadTipoProc : integer ) : Boolean;

    function ReferenciaUsada( iIdRadTipoProc, iIdReferencia : integer ) : string;

    //Marcus Oliveira 29/11/06 - 23870 Relatório de processos atrasados - Inicio
    function ProcessosEmAtraso( iIDGrupoProcesso, iProcessos  : integer;
                                sDtInicial, sDtFinal, sSituacao : String  ) : OleVariant;

    Function ListaImagem (IDEmpresa: integer): OleVariant;
    //Marcus Oliveira 04/12/06 - 23870 Relatório de processos atrasados - Fim

    function ListaProcessos : OleVariant;

    //Sempre que um novo envento for adicionado, deve
    //ser incluído na lista abaixo.
    function ListaEventoGerador : OLEVariant;

  published

end;

function RADReferencia( iIdReferencia : integer; rRadRef : TRADRef ) : boolean;


implementation

{ TCtrlRadTipoProc }

procedure TCtrlRadTipoProc.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
  begin
    FDbRadTipoProc.DataBaseName  := DataBaseName;
    FDbRadEtapa.DataBaseName     := DataBaseName;
    FDbRadEtapaDest.DataBaseName := DataBaseName;
    FDbRadEtapaCond.Databasename := DataBaseName;
  end
  else
  begin
    FDbRadTipoProc.DbAdoConnection  := DbAdoConnection;
    FDbRadEtapa.DbAdoConnection     := DbAdoConnection;
    FDbRadEtapaDest.DbAdoConnection := DbAdoConnection;
    FDbRadEtapaCond.DbAdoConnection := DbAdoConnection;
  end;
end;

constructor TCtrlRadTipoProc.Create;
begin
  inherited;
  FDbRadTipoProc  := TDbRadTipoProc.Create( Self );
  FDbRadEtapa     := TDbRadEtapa.Create( Self );
  FDbRadEtapaDest := TDbRadEtapaDest.Create( Self );
  FDbRadEtapaCond := TDbRadEtapaCond.Create( Self );
end;

destructor TCtrlRadTipoProc.Destroy;
begin
  FDbRadTipoProc.Free;
  FDbRadEtapa.Free;
  FDbRadEtapaDest.Free;
  FDbRadEtapaCond.Free;
  inherited;
end;

function TCtrlRadTipoProc.ExcluiRadTipoProc( iIdRadTipoProc : integer ) : Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiRadTipoProc( iIdRadTipoProc );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := False;

      if ExecSQL( 'delete from RADETAPACOND where IDRADETAPA in ( select IDRADETAPA from RADETAPA where IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) + ' ) ' ) then
        if ExecSQL( 'delete from RADETAPADEST where IDRADETAPA in ( select IDRADETAPA from RADETAPA where IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) + ' ) ' ) then
          if ExecSQL( 'delete from RADETAPA where IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) ) then
            Result := ExecSQL( 'delete from RADTIPOPROC where IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) );

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrlRadTipoProc.GravaRadTipoProc( oRadTipoProc, oRadEtapa, oRadEtapaDest, oRadEtapaCond: OLEVariant ) : Boolean;
var
  cdsRadTipoProc,
  cdsRadEtapa,
  cdsRadEtapaDest,
  cdsRadEtapaCond : TCmClientDataset;
  iIdAnt : integer;
begin
  cdsRadTipoProc  := TCmClientDataset.Create( nil );
  cdsRadEtapa     := TCmClientDataset.Create( nil );
  cdsRadEtapaDest := TCmClientDataset.Create( nil );
  cdsRadEtapaCond := TCmClientDataset.Create( nil );
  try
    if ConnectionSide = cnsClient then
    begin
      Result := Connection.AppServer.GravarRadTipoProc( CdsRadTipoProc.Data );
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
    else
    begin
      try
        Result := False;

        cdsRadTipoProc.Data  := oRadTipoProc;
        cdsRadEtapa.Data     := oRadEtapa;
        cdsRadEtapaDest.Data := oRadEtapaDest;
        cdsRadEtapaCond.Data := oRadEtapaCond;

        StartTransaction;

        //Desliga filtros que porventura existam
        CdsRadTipoProc.Filtered  := False;
        CdsRadEtapa.Filtered     := False;
        cdsRadEtapaDest.Filtered := False;
        cdsRadEtapaCond.Filtered := False;

        //Altera os IDs dos registros dos novos processo e das etapas que apontam para eles
        CdsRadTipoProc.First;
        while not CdsRadTipoProc.Eof do
        begin

          //Processo
          iIdAnt := -1;
          if CdsRadEtapa.UpdateStatus = usInserted then
          begin
            iIdAnt := CdsRadTipoProc.FieldByName('IDRADTIPOPROC').AsInteger;
            CdsRadTipoProc.Edit;
            CdsRadTipoProc.FieldByName('IDRADTIPOPROC').AsInteger := GetSequence( 'RADTIPOPROC' );
            CdsRadTipoProc.Post;
          end;

          //Etapas
          CdsRadEtapa.First;
          while not CdsRadEtapa.Eof do
          begin
            if CdsRadEtapa.FieldByName('IDRADTIPOPROC').AsInteger = iIdAnt then
            begin
              CdsRadEtapa.Edit;
              CdsRadEtapa.FieldByName('IDRADTIPOPROC').AsInteger := CdsRadTipoProc.FieldByName('IDRADTIPOPROC').AsInteger;
              CdsRadEtapa.Post;
            end;
            CdsRadEtapa.Next;
          end;

          CdsRadTipoProc.Next;
        end;


        //Altera os IDs dos registros das novas etapas e dos seus destinatários e condições
        CdsRadEtapa.First;
        while not CdsRadEtapa.Eof do
        begin

          //Etapa
          iIdAnt := -1;
          if CdsRadEtapa.UpdateStatus = usInserted then
          begin
            iIdAnt := CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger;
            CdsRadEtapa.Edit;
            CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger := GetSequence( 'RADETAPA' );
            CdsRadEtapa.Post;
          end;

          //Destinatários
          cdsRadEtapaDest.First;
          while not cdsRadEtapaDest.Eof do
          begin
            if cdsRadEtapaDest.FieldByName('IDRADETAPA').AsInteger <> CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger then
            begin
              if cdsRadEtapaDest.FieldByName('IDRADETAPA').AsInteger = iIdAnt then
              begin
                cdsRadEtapaDest.Edit;
                cdsRadEtapaDest.FieldByName('IDRADETAPA').AsInteger := CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger;
                cdsRadEtapaDest.Post;
                cdsRadEtapaDest.First;
                Continue;
              end;
            end;
            cdsRadEtapaDest.Next;
          end;

          //Condicoes
          cdsRadEtapaCond.First;
          while not cdsRadEtapaCond.Eof do
          begin
            if cdsRadEtapaCond.FieldByName('IDRADETAPA').AsInteger <> CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger then
            begin
              if cdsRadEtapaCond.FieldByName('IDRADETAPA').AsInteger = iIdAnt then
              begin
                cdsRadEtapaCond.Edit;
                cdsRadEtapaCond.FieldByName('IDRADETAPA').AsInteger := CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger;
                cdsRadEtapaCond.Post;
                cdsRadEtapaCond.First;
                Continue;
              end;
            end;
            cdsRadEtapaCond.Next;
          end;

          CdsRadEtapa.Next;
        end;


        //Exclui todos os registros filhos das etapas
        cdsRadEtapa.StatusFilter := [usDeleted];
        try
          cdsRadEtapa.First;
          while not cdsRadEtapa.Eof do
          begin

            cdsRadEtapaDest.Filtered := False;
            cdsRadEtapaDest.Filter := 'IDRADETAPA = ' + cdsRadEtapa.FieldByName('IDRADETAPA').AsString;
            cdsRadEtapaDest.Filtered := True;
            cdsRadEtapaDest.First;
            while not cdsRadEtapaDest.Eof do
            begin
              ExecSql( 'delete from RADETAPADEST where IDRADETAPA = ' +
               cdsRadEtapaDest.FieldByName('IDRADETAPA').AsString + ' and IDPESSOA = ' +
               cdsRadEtapaDest.FieldByName('IDPESSOA').AsString );
              cdsRadEtapaDest.Next;
            end;

            cdsRadEtapaCond.Filtered := False;
            cdsRadEtapaCond.Filter := 'IDRADETAPA = ' + cdsRadEtapa.FieldByName('IDRADETAPA').AsString;
            cdsRadEtapaCond.Filtered := True;
            cdsRadEtapaCond.First;
            while not cdsRadEtapaCond.Eof do
            begin
              ExecSql( 'delete from RADETAPACOND where IDRADETAPACOND = ' +
               cdsRadEtapaCond.FieldByName('IDRADETAPACOND').AsString );
              cdsRadEtapaCond.Next;
            end;

            cdsRadEtapa.Next;

          end;
        finally
          cdsRadEtapa.StatusFilter := [];
          cdsRadEtapaDest.Filtered := False;
          cdsRadEtapaCond.Filtered := False;
        end;

        cdsRadTipoProc.First;
        cdsRadEtapa.First;
        cdsRadEtapaDest.First;
        cdsRadEtapaCond.First;

        if ApplyCds( cdsRadTipoProc, FDbRadTipoProc, [], [] ) then
          if ApplyCds( cdsRadEtapa, DbRadEtapa, [], [] ) then
            if ApplyCds( cdsRadEtapaDest, DbRadEtapaDest, [], [] ) then
              if ApplyCds( cdsRadEtapaCond, FDbRadEtapaCond, [], [] ) then
                Result := True;

        if not Result then raise Exception.Create( FDbRadTipoProc.MessageInfo + #13#10 +
         FDbRadEtapa.MessageInfo + #13#10 + FDbRadEtapaDest.MessageInfo + #13#10 +
         FDbRadEtapaCond.MessageInfo );

        Commit;
     except
        On E : Exception Do
        begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       end;
     end;
    end;

  finally
    cdsRadTipoProc.Free;
    cdsRadEtapa.Free;
    cdsRadEtapaDest.Free;
    cdsRadEtapaCond.Free;
  end;
end;


function TCtrlRadTipoProc.ListaEventoGerador: OLEVariant;
begin
  Result := GetDataPacket(
   ' select   *                                                           ' +
   ' from     RADREFERENCIA                                               ' +
   ' where    IDREFERENCIA IN ( 3, 4, 5, 6, 11, 27, 30, 32, 33, 34, 35 )  ' +
   ' order by DESCREFERENCIA                                              ' );
end;


function TCtrlRadTipoProc.ListaImagem(IDEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket('SELECT                     ' +
                          '  I.IMAGEM, P.RAZAOSOCIAL, ' +
                          '  P.NOME                   ' +
                          'FROM                       ' +
                          '  PESSOA P,                ' +
                          '  IMAGENS I                ' +
                          'WHERE                      ' +
                          '  P.IDIMAGEM = I.IDIMAGEM  ' +
                          ' AND P.IDPESSOA = '+ IntToStr(IDEmpresa));
end;


function TCtrlRadTipoProc.ListaProcessos: OleVariant;
begin
  Result := GetDataPacket('SELECT              ' +
                          '  IDGRUPOPROCESSO,  ' +
                          '  DESCGRUPOPROCESSO ' +
                          'FROM                ' +
                          '  RADGRUPOPROCESSO  ' );
end;
//Marcus Oliveira 30/11/06 - 23870 Relatório de processos atrasados
function TCtrlRadTipoProc.ProcessosEmAtraso( iIDGrupoProcesso, iProcessos  : integer;
                                             sDtInicial, sDtFinal, sSituacao : String  ): OleVariant;
var
Sql : String;
begin
  Sql :=
      'SELECT                                                                   '+
      '   RGR.IDGRPRESPON,                                                      '+
      '   RGR.NOME,                                                             '+
      '   COUNT(*) AS QTDEETAPAS,                                               '+
      '   NVL( ATR.QTDEATRASOS, 0 ) AS QTDEATRASOS,                             '+
      '   ( NVL( ATR.QTDEATRASOS, 0 ) / COUNT(*) ) * 100 as PERCENTUAL          '+
      'FROM                                                                     '+
      '  RADGRPRESPON     RGR,                                                  '+
      '   RADINSTPROCESSO  RIP,                                                 '+
      '   RADGRUPOPROCESSO RGP,                                                 '+
      '   RADTIPOPROC      RTP,                                                 '+
      '   RADETAPA         RE,                                                  '+
      '   RADETAPAPROC     REP,                                                 '+
      '   ( SELECT                                                              '+
      '        RGR.IDGRPRESPON,                                                 '+
      '        COUNT(*) AS QTDEATRASOS                                          '+
      '     FROM                                                                '+
      '        RADGRPRESPON     RGR,                                            '+
      '        RADINSTPROCESSO  RIP,                                            '+
      '        RADGRUPOPROCESSO RGP,                                            '+
      '        RADTIPOPROC      RTP,                                            '+
      '        RADETAPA         RE,                                             '+
      '        RADETAPAPROC     REP                                             '+
      '     WHERE                                                               '+
      '        REP.IDRADETAPA             = RE.IDRADETAPA                       '+
      '        AND    RE.IDGRPRESPON      = RGR.IDGRPRESPON                     '+
      '        AND    RIP.FLGVERSAORAD    = ''+''                               '+
      '        AND    RIP.FLGOK           <> ''E''                              '+
      '        AND    REP.FLGOK           <> ''N''                              '+
      '        AND    REP.DATAFIMPREV     IS NOT NULL                           '+
      '        AND    REP.DATAFIMPREV     < REP.DATAFIMETAPA                    '+
      '        AND    RIP.IDPROCESSO      = REP.IDPROCESSO                      '+
      '        AND    RIP.IDRADTIPOPROC   = RTP.IDRADTIPOPROC                   '+
      '        AND    RTP.IDGRUPOPROCESSO = RGP.IDGRUPOPROCESSO                 ';

// Se período for informado
    if sDtInicial <> '30/12/1899' then
       Sql := Sql + ' AND    ( RIP.DATAINIPROCESSO >= ' + QuotedStr ( sDtInicial ) + ') ';

    if sDtFinal   <> '30/12/1899' then
       Sql := Sql + ' AND ( RIP.DATAFIMPROCESSO <= '  + QuotedStr ( sDtFinal ) + ') ';

// Se o grupo de processo for informado.

    if iIDGrupoProcesso <> 0 then
       Sql := Sql + ' AND  RTP.IDGRUPOPROCESSO =  ' + IntToStr(iIDGrupoProcesso);

// Se a situação for informada

    if sSituacao <> '' then
       Sql := Sql + ' AND  RIP.FLGOK  = ' + QuotedStr(sSituacao);

//Se a classificação for informada
// Em atraso
    if iProcessos = 1 then
    begin
       Sql := Sql +       ' AND  RIP.DATAFIMPREV IS NOT NULL                                          ' +
       ' AND  ( ( ( RIP.DATAFIMPREV >  RIP.DATAFIMPROCESSO ) AND ( RIP.FLGOK <> ''N'' ) ) '+
       '  OR    ( ( RIP.DATAFIMPREV >= sysdate ) AND ( RIP.FLGOK = ''N'' ) ) )';

    end;
// Em dia
    if iProcessos = 2 then
    begin
       Sql := Sql +

       ' AND  ( ( RIP.DATAFIMPREV IS NULL )                                        ' +
       '  OR    ( ( RIP.DATAFIMPREV <=  RIP.DATAFIMPROCESSO ) AND ( RIP.FLGOK <> ''N'' ) ) '+
       '  OR    ( ( RIP.DATAFIMPREV <   sysdate ) AND ( RIP.FLGOK = ''N'' ) ) ) ';

    end;

    Sql := Sql +

    '     GROUP BY RGR.IDGRPRESPON,                         '+
    '     RGR.NOME          ) ATR                           '+
    'WHERE                                                  '+
    '  REP.IDRADETAPA          = RE.IDRADETAPA              '+
    '  AND RE.IDGRPRESPON      = RGR.IDGRPRESPON            '+
    '  AND RIP.FLGVERSAORAD    = ''+''                      '+
    '  AND RIP.FLGOK           <> ''E''                     '+
    '  AND REP.FLGOK           <> ''N''                     '+
    '  AND RGR.IDGRPRESPON     = ATR.IDGRPRESPON (+)        '+
    '  AND RIP.IDPROCESSO      = REP.IDPROCESSO             '+
    '  AND RIP.IDRADTIPOPROC   = RTP.IDRADTIPOPROC          '+
    '  AND RTP.IDGRUPOPROCESSO = RGP.IDGRUPOPROCESSO        ';

//Se período for informado
    if sDtInicial <> '30/12/1899' then
       Sql := Sql + ' AND    ( RIP.DATAINIPROCESSO >= ' + QuotedStr ( sDtInicial ) + ') ';

    if sDtFinal   <> '30/12/1899' then
       Sql := Sql + ' AND ( RIP.DATAINIPROCESSO <= '  + QuotedStr ( sDtFinal ) + ') ';

//Se o grupo de processos for informado
    if iIDGrupoProcesso <> 0 then
       Sql := Sql + ' AND  RTP.IDGRUPOPROCESSO =  ' + IntToStr(iIDGrupoProcesso);

//Se a situação for informada

    if sSituacao <> '' then
       Sql := Sql + ' AND  RIP.FLGOK  = ' + QuotedStr(sSituacao);

//Se a classificação for informada

// Em atraso
    if iProcessos = 1 then
    begin

    Sql := Sql +
    ' AND  RIP.DATAFIMPREV IS NOT NULL                                          ' +
    ' AND  ( ( ( RIP.DATAFIMPREV >  RIP.DATAFIMPROCESSO ) AND ( RIP.FLGOK <> ''N'' ) ) '+
    '  OR    ( ( RIP.DATAFIMPREV >= sysdate ) AND ( RIP.FLGOK = ''N'' ) ) )';

    end;
// Em dia
    if iProcessos = 2 then
    begin

    Sql := Sql +

    ' AND  ( ( RIP.DATAFIMPREV IS NULL )                                        ' +
    '  OR    ( ( RIP.DATAFIMPREV <=  RIP.DATAFIMPROCESSO ) AND ( RIP.FLGOK <> ''N'' ) ) '+
    '  OR    ( ( RIP.DATAFIMPREV <   sysdate ) AND ( RIP.FLGOK = ''N'' ) ) ) ';

    end;

    Sql := Sql +

    ' GROUP BY RGR.IDGRPRESPON,   ' +
    '   RGR.NOME,                 ' +
    '   ATR.QTDEATRASOS           ' +
    '   ORDER BY RGR.NOME         ' ;

  Result := GetDataPacket(Sql);

end;

function TCtrlRadTipoProc.ReferenciaUsada(iIdRadTipoProc, iIdReferencia: integer): string;
var
  cdsLocal : TCMClientDataset;
begin
  cdsLocal := TCMClientDataset.Create( nil );
  try
    Result := '';
    cdsLocal.Data := GetDataPacket(
     ' select NOME              ' +
     ' from   RADTIPOPROC       ' +
     ' where  IDRADTIPOPROC <>  ' + IntToStr( iIdRadTipoProc ) +
     '   and  IDREFERENCIA  =   ' + IntToStr( iIdReferencia  ) +
     '   and  FLGATIVO      = 1 ' );
    if not cdsLocal.IsEmpty then
      Result := cdsLocal.FieldByName('NOME').AsString;
  finally
    cdsLocal.Free;
  end;
end;

function TCtrlRadTipoProc.SelecionaRadTipoProc( iIdRadTipoProc : integer ) : OleVariant;
begin
  FDbRadTipoProc.IdRadTipoProc.AsInteger := iIdRadTipoProc;
  Result := GetDataPacket( FDbRadTipoProc.SSqlSelect );
end;

procedure TCtrlRadTipoProc.SetDbRadEtapa(const Value: TDbRadEtapa);
begin
  FDbRadEtapa := Value;
end;

procedure TCtrlRadTipoProc.SetDbRadEtapaCond(const Value: TDbRadEtapaCond);
begin
  FDbRadEtapaCond := Value;
end;

procedure TCtrlRadTipoProc.SetDbRadEtapaDest(const Value: TDbRadEtapaDest);
begin
  FDbRadEtapaDest := Value;
end;

procedure TCtrlRadTipoProc.SetDbRadTipoProc(const Value: TDbRadTipoProc);
begin
  FDbRadTipoProc := Value;
end;


function RADReferencia( iIdReferencia : integer;  rRadRef : TRADRef ) : boolean;
begin
  Result := False;
  case rRadRef of
    rrDoc           : Result := ( iIdReferencia in [ 27 , 30 ] );
    rrSolicCompra   : Result := ( iIdReferencia in [       3 ] );
    rrOrdemCompra   : Result := ( iIdReferencia in [       5 ] );
    rrPagtoLote     : Result := ( iIdReferencia in [       6 ] );
    rrCotacao       : Result := ( iIdReferencia in [       4 ] );
    rrReqMaterial   : Result := ( iIdReferencia in [      11 ] );
    rrDestacaViagem : Result := ( iIdReferencia in [ 32 , 33 ] );
    rrCotasPatrim   : Result := ( iIdReferencia in [ 34,  35 ] ); //amf 22.05.2007 25420.
  end;
end;

end.

