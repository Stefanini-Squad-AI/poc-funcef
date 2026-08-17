unit uCtrlWebPagAcessadas;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     uDbWebPagAcessadas;

Type
  TCtrlWebPagAcessadas = class(TCmControlObject)
  private
    FCdsWebPagAcessadas: TCMClientDataSet;
    FDbWebPagAcessadas: TDbWebPagAcessadas;
    procedure SetCdsWebPagAcessadas(const Value: TCMClientDataSet);
    procedure SetDbWebPagAcessadas(const Value: TDbWebPagAcessadas);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebPagAcessadas : TDbWebPagAcessadas read FDbWebPagAcessadas write SetDbWebPagAcessadas;
    property CdsWebPagAcessadas : TCMClientDataSet read FCdsWebPagAcessadas write SetCdsWebPagAcessadas;

    procedure InsereWebPagAcessadas( iIdPessoa, iSeqAcesso, iIdPagina : integer );

    function DadosGraficoPorPaginas( dPeriodoDe, dPeriodoAte : TDateTime;
                                     iIdWebInterface ,
                                     iIdPessoa       : integer;
                                     bMesmaSessao    : boolean ) : OleVariant;

  published

end;

implementation

{ TCtrlWebPagAcessadas }

procedure TCtrlWebPagAcessadas.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebPagAcessadas.DataBaseName    := DataBaseName
  else
    FDbWebPagAcessadas.DbAdoConnection := DbAdoConnection;
end;

constructor TCtrlWebPagAcessadas.Create;
begin
  inherited;
  FDbWebPagAcessadas  := TDbWebPagAcessadas.Create( self );
end;

function TCtrlWebPagAcessadas.DadosGraficoPorPaginas(dPeriodoDe,
  dPeriodoAte: TDateTime; iIdWebInterface, iIdPessoa : integer; bMesmaSessao: boolean): OleVariant;
var
  sSQL : string;
begin
  sSQL := ' SELECT   W.DESCPAGINA,           ' +
          '          COUNT(*) AS QTDEACESSOS ' +
          ' FROM     WEBPAGINA       W,      ' +
          '          ( SELECT ' ;

  if bMesmaSessao then
    sSQL := sSQL + ' DISTINCT ';

  sSQL := sSQL + ' P.IDPESSOA,                       ' +
                 ' P.SEQACESSO,                      ' +
                 ' P.IDPAGINA                        ' +
                 ' FROM   WEBPAGACESSADAS P,         ' +
                 '        WEBHSTACESSO    H          ' +
                 ' WHERE  H.IDPESSOA   = P.IDPESSOA  ' +
                 '   AND  H.SEQACESSO  = P.SEQACESSO ' ;

  if dPeriodoDe > 0 then
    sSQL := sSQL +
     '   AND TO_CHAR( P.DATAHORA, ''YYYYMMDD'' ) >= ' + QuotedStr( FormatDateTime( 'yyyymmdd', dPeriodoDe  ) ) +
     '   AND TO_CHAR( P.DATAHORA, ''YYYYMMDD'' ) <= ' + QuotedStr( FormatDateTime( 'yyyymmdd', dPeriodoAte ) ) ;

  if iIdWebInterface > 0 then
    sSQL := sSQL +
     '   AND H.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface );

  if iIdPessoa > 0 then
    sSQL := sSQL +  
     '   AND H.IDPESSOA = ' + IntToStr( iIdPessoa );

  sSQL := sSQL + ' ) A ' +
          ' WHERE    W.IDPAGINA       = A.IDPAGINA                  ' ;

  sSQL := sSQL +
          ' GROUP BY W.DESCPAGINA                                   ' +
          ' ORDER BY 2 DESC                                         ' ;

  Result := GetDataPacket( sSQL );
end;

destructor TCtrlWebPagAcessadas.Destroy;
begin
  FDbWebPagAcessadas.Free;
  if IsAppServer then FCdsWebPagAcessadas.Free;
  inherited;
end;

procedure TCtrlWebPagAcessadas.InsereWebPagAcessadas( iIdPessoa, iSeqAcesso, iIdPagina : integer );
var
  cdsLocal : TCmClientDataSet;
  i : integer;
begin
  cdsLocal := TCmClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' select max( SEQPAGACESS ) as MAXIMO ' +
                                    ' from   WEBPAGACESSADAS              ' +
                                    ' where  IDPESSOA  =                  ' + IntToStr( iIdPessoa  ) +
                                    '   and  SEQACESSO =                  ' + IntToStr( iSeqAcesso ) +
                                    '   and  IDPAGINA  =                  ' + IntToStr( iIdPagina  ) );

    i := cdsLocal.FieldByName('MAXIMO').AsInteger + 1;

    ExecSQL( ' insert into WEBPAGACESSADAS ' +
             '             ( IDPESSOA,     ' +
             '               SEQACESSO,    ' +
             '               IDPAGINA,     ' +
             '               SEQPAGACESS,  ' +
             '               DATAHORA )    ' +
             ' values                      ' +
             '             ( ' + IntToStr( iIdPessoa  ) + ', ' +
             '               ' + IntToStr( iSeqAcesso ) + ', ' +
             '               ' + IntToStr( iIdPagina  ) + ', ' +
             '               ' + IntToStr( i          ) + ', ' +
             '               sysdate  ) ' );
  finally
    cdsLocal.Free;
  end;
end;

procedure TCtrlWebPagAcessadas.OnCreateAppServer;
begin
  inherited;
  FCdsWebPagAcessadas := TCMClientDataSet.Create( nil );
end;

procedure TCtrlWebPagAcessadas.SetCdsWebPagAcessadas( const Value: TCMClientDataSet);
begin
  FCdsWebPagAcessadas := Value;
end;

procedure TCtrlWebPagAcessadas.SetDbWebPagAcessadas( const Value: TDbWebPagAcessadas);
begin
  FDbWebPagAcessadas := Value;
end;

end.
