unit uCtrlAgendamento;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbAgendamento;

Type
  TCtrlAgendamento = class(TCmControlObject)
  private
    FCdsAgendamento: TCMClientDataSet;
    FDbAgendamento: TDbAgendamento;
    procedure SetCdsAgendamento(const Value: TCMClientDataSet);
    procedure SetDbAgendamento(const Value: TDbAgendamento);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbAgendamento : TDbAgendamento read FDbAgendamento write SetDbAgendamento;
    property CdsAgendamento : TCMClientDataSet read FCdsAgendamento write SetCdsAgendamento;

    function SelecionaAgendamento( iIdAgendamento : integer ) : OleVariant;
    function GravaAgendamento( var iIdAgendamento : integer ) : Boolean;

    function DadosSolicitanteEleg( iIdPessoa : integer ) : OLEVariant;

    function HorariosNaData( dData : TDateTime ) : OLEVariant;

    function AtendentesNoHorario( dData : TDateTime; sHora : string ) : OLEVariant;
    function HorariosDoAtendenteNaData( iIdAtendeAgenda : integer; dData : TDateTime ) : OLEVariant;

    function AgendamentoPorAtendimento( iIdAtend : integer ) : integer;

    function DadosFundacao : OLEVariant;
    function RelatorioAtendimentos( iIdAtendeAgenda : integer; dDataInicial, dDataFinal : TDateTime; iIdAssuntoAgenda,
     iFlgSituacao : integer; sNomeSolic : string; dDataAlteracao : TDateTime; bOrdenaPorAtendente : boolean ) : OLEVariant;
    function FiltroRelatorio( iIdAtendeAgenda : integer; dDataInicial, dDataFinal : TDateTime; iIdAssuntoAgenda, iFlgSituacao : integer; sNomeSolic : string; dDataAlteracao : TDateTime ) : string;
    function DadosExtrasRelatorio( iIdPessoa : integer ) : OLEVariant;

    function ListaAgendamentosNoPeriodo( iIdAtendeAgenda : integer; dDataIni, dDataFim : TDateTime ) : OLEVariant;

  published

end;

implementation

{ TCtrlAgendamento }

procedure TCtrlAgendamento.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbAgendamento.DataBaseName    := DataBaseName
  else
    FDbAgendamento.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlAgendamento.Create;
begin
  inherited;
  FDbAgendamento  := TDbAgendamento.Create( self );
end;

function TCtrlAgendamento.DadosSolicitanteEleg( iIdPessoa : integer ) : OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT V.IDPESSOA,                                                ' +
   '        V.NOME,                                                    ' +
   '        V.MATRICULA,                                               ' +
   '        V.INSCRICAONUMERO,                                         ' +
   '        V.PATRO,                                                   ' +
   '        V.PLANO,                                                   ' +
   '        TRIM( L.DDD ) || '' '' || TRIM( L.NUMERO ) AS TELEFONE     ' +
   ' FROM   VWPARTICIPDEPEN  V,                                        ' +
   '        ENDPESS          D,                                        ' +
   '        TELENDPESS       L                                         ' +
   ' WHERE  ( ( V.FLGDESATIVADO = 0 ) OR ( V.FLGDESATIVADO IS NULL ) ) ' +
   '   AND  V.IDPESSOA    = D.IDPESSOA   (+)                           ' +
   '   AND  D.IDENDERECO  = L.IDENDERECO (+)                           ' +
   '   AND  V.IDPESSOA    = ' + IntToStr( iIdPessoa )                    );
end;

destructor TCtrlAgendamento.Destroy;
begin
  inherited;
  FDbAgendamento.Free;
  if IsAppServer then FCdsAgendamento.Free;
end;

function TCtrlAgendamento.GravaAgendamento( var iIdAgendamento : integer ): Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaAgendamento( CdsAgendamento.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      iIdAgendamento := 0;

      Result := ApplyCds( FCdsAgendamento, FDbAgendamento, [], [] );
      Msg := FDbAgendamento.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      iIdAgendamento := DbAgendamento.Idagendamento.AsInteger;
   except
      On E : Exception Do
      begin
        Result := False;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrlAgendamento.HorariosNaData(dData: TDateTime): OLEVariant;
begin
  Result := GetDataPacket(
   ' select   distinct h.HORARIO                                                                                                                     ' +
   ' from     HORARIOAGENDA h                                                                                                                        ' +
   ' where    h.IDPERIODOAGENDA in ( select x.IDPERIODOAGENDA                                                                                        ' +
   '                                 from   PERIODOAGENDA x                                                                                          ' +
   '                                 where  x.DATAINICIO  <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )   ' +
   '                                   and  x.DATAFIM     >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' ) ) ' +
   ' union                                                                                                                                           ' +
   ' select distinct HORA                                                                                                                            ' +
   ' from   AGENDAMENTO                                                                                                                              ' +
   ' where  DATA = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )                                             ' +
   '   and  FLGSITUACAO <> 3                                                                                                                         ' +
   ' order by 1                                                                                                                                      ' );
end;

procedure TCtrlAgendamento.OnCreateAppServer;
begin
  inherited;
  FCdsAgendamento := TCMClientDataSet.Create( nil );
end;

function TCtrlAgendamento.SelecionaAgendamento( iIdAgendamento: integer ): OleVariant;
begin
  FDbAgendamento.Idagendamento.AsInteger := iIdAgendamento;
  Result := GetDataPacket( FDbAgendamento.SSqlSelect );
end;

procedure TCtrlAgendamento.SetCdsAgendamento( const Value: TCMClientDataSet );
begin
  FCdsAgendamento := Value;
end;

procedure TCtrlAgendamento.SetDbAgendamento( const Value: TDbAgendamento );
begin
  FDbAgendamento := Value;
end;

function TCtrlAgendamento.AtendentesNoHorario( dData : TDateTime; sHora : string ) : OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select 0 as IDAGENDAMENTO,                                                                                                                    ' +
   '        a.IDATENDEAGENDA,                                                                                                                      ' +
   '        s.NOME,                                                                                                                                ' +
   '        ''                                                            '' as SOLICITANTE,                                                       ' +
   '        ''                                   '' as ASSUNTO,                                                                                    ' +
   '        0 as FLGSITUACAO                                                                                                                       ' +
   ' from   HORARIOAGENDA  h,                                                                                                                      ' +
   '        PERIODOAGENDA  p,                                                                                                                      ' +
   '        ATENDEAGENDA   a,                                                                                                                      ' +
   '        USUARIOSISTEMA u,                                                                                                                      ' +
   '        PESSOA         s                                                                                                                       ' +
   ' where  p.DATAINICIO      <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )                             ' +
   '   and  p.DATAFIM         >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )                             ' +
   '   and  h.HORARIO         = ' + QuotedStr( sHora )                                                                                               +
   '   and  h.IDPERIODOAGENDA = p.IDPERIODOAGENDA                                                                                                  ' +
   '   and  p.IDGRUPOATENDE   = a.IDGRUPOATENDE                                                                                                    ' +
   '   and  a.IDUSUARIO       = u.IDUSUARIO                                                                                                        ' +
   '   and  a.IDUSUARIO       = s.IDPESSOA                                                                                                         ' +
   '   and  a.IDATENDEAGENDA not in ( select x.IDATENDEAGENDA                                                                                      ' +
   '                                  from   AGENDAMENTO x                                                                                         ' +
   '                                  where  x.DATA = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )        ' +
   '                                   and   x.HORA = ' + QuotedStr( sHora ) + '                                                                   ' +
   '                                   and   x.FLGSITUACAO <> 3 )                                                                                  ' +
   ' union                                                                                                                                         ' +
   ' select a.IDAGENDAMENTO,                                                                                                                       ' +
   '        t.IDATENDEAGENDA,                                                                                                                      ' +
   '        p.NOME as ATENDENTE,                                                                                                                   ' +
   '        decode( a.IDPESSOA, '''', a.NOMESOLIC, s.NOME ),                                                                                       ' +
   '        g.DESCRICAO,                                                                                                                           ' +
   '        a.FLGSITUACAO                                                                                                                          ' +
   ' from   AGENDAMENTO    a,                                                                                                                      ' +
   '        ATENDEAGENDA   t,                                                                                                                      ' +
   '        USUARIOSISTEMA u,                                                                                                                      ' +
   '        PESSOA         p,                                                                                                                      ' +
   '        PESSOA         s,                                                                                                                      ' +
   '        ASSUNTOAGENDA  g                                                                                                                       ' +
   ' where  a.DATA = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )                                         ' +
   '   and  a.HORA = ' + QuotedStr( sHora )                                                                                                          +
   '   and  a.IDATENDEAGENDA  = t.IDATENDEAGENDA                                                                                                   ' +
   '   and  t.IDUSUARIO       = u.IDUSUARIO                                                                                                        ' +
   '   and  t.IDUSUARIO       = p.IDPESSOA                                                                                                         ' +
   '   and  a.IDPESSOA        = s.IDPESSOA (+)                                                                                                     ' +
   '   and  a.IDASSUNTOAGENDA = g.IDASSUNTOAGENDA                                                                                                  ' +
   '   and a.FLGSITUACAO     <> 3                                                                                                                  ' +
   ' order by 2                                                                                                                                    ' ;

  Result := GetDataPacket( sSQL );
end;


function TCtrlAgendamento.HorariosDoAtendenteNaData( iIdAtendeAgenda: integer; dData: TDateTime): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select 0 as IDAGENDAMENTO,                                                                                                              ' +
   '        h.HORARIO,                                                                                                                       ' +
   '        ''                                                            '' as SOLICITANTE,                                                 ' +
   '        ''                                   '' as ASSUNTO,                                                                              ' +
   '        0 as FLGSITUACAO                                                                                                                 ' +
   ' from   HORARIOAGENDA  h,                                                                                                                ' +
   '        PERIODOAGENDA  p,                                                                                                                ' +
   '        ATENDEAGENDA   a                                                                                                                 ' +
   ' where  p.DATAINICIO      <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )                       ' +
   '   and  p.DATAFIM         >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )                       ' +
   '   and  a.IDATENDEAGENDA  = ' + IntToStr( iIdAtendeAgenda )                                                                                +
   '   and  h.IDPERIODOAGENDA = p.IDPERIODOAGENDA                                                                                            ' +
   '   and  p.IDGRUPOATENDE   = a.IDGRUPOATENDE                                                                                              ' +
   '   and  h.HORARIO         not in ( select x.HORA                                                                                         ' +
   '                                   from   AGENDAMENTO x                                                                                  ' +
   '                                   where  x.DATA = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' ) ' +
   '                                    and   x.IDATENDEAGENDA = ' + IntToStr( iIdAtendeAgenda )                                               +
   '                                    and   x.FLGSITUACAO <> 3 )                                                                           ' +   
   ' union                                                                                                                                   ' +
   ' select a.IDAGENDAMENTO,                                                                                                                 ' +
   '        a.HORA,                                                                                                                          ' +
   '        decode( a.IDPESSOA, '''', a.NOMESOLIC, s.NOME ),                                                                                 ' +
   '        g.DESCRICAO,                                                                                                                     ' +
   '        a.FLGSITUACAO                                                                                                                    ' +
   ' from   AGENDAMENTO    a,                                                                                                                ' +
   '        PESSOA         s,                                                                                                                ' +
   '        ASSUNTOAGENDA  g                                                                                                                 ' +
   ' where  a.DATA = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dData ) ) + ', ''DD/MM/YYYY'' )                                   ' +
   '   and  a.IDATENDEAGENDA  = ' + IntToStr( iIdAtendeAgenda )                                                                                +
   '   and  a.IDPESSOA        = s.IDPESSOA (+)                                                                                               ' +
   '   and  a.IDASSUNTOAGENDA = g.IDASSUNTOAGENDA                                                                                            ' +
   '   and a.FLGSITUACAO     <> 3                                                                                                            ' +   
   ' order by 2                                                                                                                              ' ;

  Result := GetDataPacket( sSQL );
end;

function TCtrlAgendamento.AgendamentoPorAtendimento(iIdAtend: integer): integer;
var
  cdsAux : TCmClientDataset;
begin
  cdsAux := TCmClientDataset.Create( nil );
  try
    Result := 0;
    cdsAux.Data := GetDataPacket(
     ' select IDAGENDAMENTO                    ' +
     ' from   AGENDAMENTO                      ' +
     ' where  IDATEND = ' + IntToStr( iIdAtend ) +
     '   and  FLGSITUACAO <> 3                 ' ) ;
    if not cdsAux.IsEmpty then
      Result := cdsAux.FieldByName('IDAGENDAMENTO').AsInteger;
  finally
    cdsAux.Free;
  end;
end;

function TCtrlAgendamento.DadosFundacao: OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,  ' +
   '        E.NUMERO, E.COMPLEMENTO, E.BAIRRO,  ' +
   '        C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM  ' +
   ' FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C  ' +
   ' WHERE  ' +
   '      ( P.IDPESSOA =  F.IDPESSOA) AND  ' +
   '      ( P.IDPESSOA =  E.IDPESSOA) AND  ' +
   '      (E.IDCIDADES   = C.IDCIDADES)  AND ' +
   '      ( P.IDIMAGEM = I.IDIMAGEM) ' );
end;

function TCtrlAgendamento.RelatorioAtendimentos( iIdAtendeAgenda : integer; dDataInicial, dDataFinal : TDateTime;
  iIdAssuntoAgenda, iFlgSituacao: integer; sNomeSolic: string; dDataAlteracao: TDateTime;
  bOrdenaPorAtendente : boolean): OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select   a.IDAGENDAMENTO,                                                                        ' +
   '          p.NOME as ATENDENTE,                                                                    ' +
   '          NVL( s.NOME, a.NOMESOLIC ) as SOLICITANTE,                                              ' +
   '          s.IDPESSOA,                                                                             ' +
   '          a.DATA,                                                                                 ' +
   '          a.HORA,                                                                                 ' +
   '          o.DESCRICAO as ASSUNTO,                                                                 ' +
   '          a.TELEFONE,                                                                             ' +
   '          decode( FLGSITUACAO, 1, ''Agendado'', 2, ''Efetivado'', 3, ''Cancelado'' ) as SITUACAO, ' +
   '          a.DATAALTERACAO,                                                                        ' +
   '          ''' + StringOfChar( ' ', 15 ) + ''' as MATRICULA,                                       ' +
   '          0 as INSCRICAONUMERO,                                                                   ' +
   '          ''' + StringOfChar( ' ', 60 ) + ''' as PLANO,                                           ' +
   '          ''' + StringOfChar( ' ', 60 ) + ''' as PATRO,                                           ' +
   '          a.OBSERVACAO                                                                            ' +
   ' from     AGENDAMENTO     a,                                                                      ' +
   '          ATENDEAGENDA    t,                                                                      ' +
   '          PESSOA          p,                                                                      ' +
   '          PESSOA          s,                                                                      ' +
   '          ASSUNTOAGENDA   o                                                                       ' +
   ' where    a.IDATENDEAGENDA  = t.IDATENDEAGENDA                                                    ' +
   '   and    t.IDUSUARIO       = p.IDPESSOA                                                          ' +
   '   and    a.IDPESSOA        = s.IDPESSOA (+)                                                      ' +
   '   and    a.IDASSUNTOAGENDA = o.IDASSUNTOAGENDA                                                   ' +
   FiltroRelatorio( iIdAtendeAgenda, dDataInicial, dDataFinal, iIdAssuntoAgenda,
    iFlgSituacao, sNomeSolic, dDataAlteracao );

  if bOrdenaPorAtendente then
    sSQL := sSQL + ' order by 2, 5, 6 '
  else
    sSQL := sSQL + ' order by 5, 6, 2 ';

   Result := GetDataPacket( sSQL );
end;

function TCtrlAgendamento.FiltroRelatorio(iIdAtendeAgenda : integer; dDataInicial, dDataFinal : TDateTime;
  iIdAssuntoAgenda, iFlgSituacao: integer; sNomeSolic: string; dDataAlteracao: TDateTime): string;
begin
  Result := '';

  if iIdAtendeAgenda > 0 then
    Result := Result + ' and a.IDATENDEAGENDA = ' + IntToStr( iIdAtendeAgenda );

  if dDataInicial > 0 then
    Result := Result + ' and a.DATA >= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataInicial ) ) + ', ''DD/MM/YYYY'' ) ';

  if dDataFinal > 0 then
    Result := Result + ' and a.DATA <= to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataFinal ) ) + ', ''DD/MM/YYYY'' ) ';

  if iIdAssuntoAgenda > 0 then
    Result := Result + ' and a.IDASSUNTOAGENDA = ' + IntToStr( iIdAssuntoAgenda );

  if iFlgSituacao > 0 then
    Result := Result + ' and a.FLGSITUACAO = ' + IntToStr( iFlgSituacao );

  if sNomeSolic <> '' then
    Result := Result + ' and upper( nvl( s.NOME, a.NOMESOLIC ) ) like ''' + UpperCase( sNomeSolic ) + '%''';

  if dDataAlteracao > 0 then
    Result := Result + ' and trunc( a.DATAALTERACAO ) = to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataAlteracao ) ) + ', ''DD/MM/YYYY'' ) ';

end;

function TCtrlAgendamento.DadosExtrasRelatorio( iIdPessoa: integer): OLEVariant;
begin
  Result := GetDataPacket(
   ' select MATRICULA,       ' +
   '        INSCRICAONUMERO, ' +
   '        PLANO,           ' +
   '        PATRO            ' +
   ' from   VWPARTICIPDEPEN  ' +
   ' where  IDPESSOA = ' + IntToStr( iIdPessoa ) );
end;

function TCtrlAgendamento.ListaAgendamentosNoPeriodo( iIdAtendeAgenda : integer; dDataIni, dDataFim : TDateTime ) : OLEVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' SELECT NVL( P.NOME, A.NOMESOLIC ) as SOLICITANTE,                                                                       ' +
   '        A.DATA,                                                                                                          ' +
   '        A.HORA,                                                                                                          ' +
   '        S.DESCRICAO as ASSUNTO                                                                                           ' +
   ' FROM   AGENDAMENTO   A,                                                                                                 ' +
   '        PESSOA        P,                                                                                                 ' +
   '        ASSUNTOAGENDA S                                                                                                  ' +
   ' WHERE  A.IDPESSOA         = P.IDPESSOA(+)                                                                               ' +
   '   AND  A.IDASSUNTOAGENDA  = S.IDASSUNTOAGENDA                                                                           ' +
   '   AND  A.IDATENDEAGENDA   = ' + IntToStr( iIdAtendeAgenda )                                                               +
   '   AND  ( TO_CHAR( A.DATA, ''YYYYMMDD'' ) || A.HORA ) >= ' + QuotedStr( FormatDateTime( 'yyyymmddhhnn', dDataIni ) )       +
   '   AND  ( TO_CHAR( A.DATA, ''YYYYMMDD'' ) || A.HORA ) <= ' + QuotedStr( FormatDateTime( 'yyyymmddhhnn', dDataFim ) )       +
   '   AND  A.FLGSITUACAO <> 3                                                                                               ' ;

  Result := GetDataPacket( sSQL );   
end;

end.

