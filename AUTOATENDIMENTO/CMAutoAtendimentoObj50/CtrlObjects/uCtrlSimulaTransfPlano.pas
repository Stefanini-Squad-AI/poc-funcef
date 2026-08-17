unit uCtrlSimulaTransfPlano;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbSimulaTransfPlano, uCtrlFuncoesAA;

Type
  TCtrlSimulaTransfPlano = class(TCmControlObject)
  private
    FCdsSimulaTransfPlano: TCMClientDataSet;
    FDbSimulaTransfPlano: TDbSimulaTransfPlano;
    procedure SetCdsSimulaTransfPlano(const Value: TCMClientDataSet);
    procedure SetDbSimulaTransfPlano(const Value: TDbSimulaTransfPlano);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbSimulaTransfPlano : TDbSimulaTransfPlano read FDbSimulaTransfPlano write SetDbSimulaTransfPlano;
    property CdsSimulaTransfPlano : TCMClientDataSet read FCdsSimulaTransfPlano write SetCdsSimulaTransfPlano;

    function SelecionaSimulaTransfPlano( iIdSimulaTransf : integer ) : OleVariant;
    function GravaSimulaTransfPlano : Boolean;
    function DadosSimulacao( iIdPessoa : integer ) : OleVariant;

    function NextSequence: integer;

  published

end;

implementation

{ TCtrlSimulaTransfPlano }

constructor TCtrlSimulaTransfPlano.Create;
begin
  inherited;
  FDbSimulaTransfPlano  := TDbSimulaTransfPlano.Create( Self );
end;

destructor TCtrlSimulaTransfPlano.Destroy;
begin
  FDbSimulaTransfPlano.Free;
  if IsAppServer then FCdsSimulaTransfPlano.Free;
  inherited;
end;

procedure TCtrlSimulaTransfPlano.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbSimulaTransfPlano.DataBaseName    := DataBaseName
  else
    FDbSimulaTransfPlano.dbADOConnection := dbADOConnection;
end;

function TCtrlSimulaTransfPlano.GravaSimulaTransfPlano: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarSimulaTransfPlano( CdsSimulaTransfPlano.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsSimulaTransfPlano.First;
      while not FCdsSimulaTransfPlano.Eof do
      begin
        ExecSQL(
         ' insert into SIMULATRANSFPLANO                                                ' +
         ' ( IDSIMULATRANSF,                                                            ' +
         '   IDPESSOA,                                                                  ' +
         '   IDEVENTOGERADOR,                                                           ' +
         '   IDTIPOTRANSF,                                                              ' +
         '   IDCONFIG,                                                                  ' +
         '   VALOR,                                                                     ' +
         '   DTSIMULA )                                                                 ' +
         ' values                                                                       ' +
         ' ( ' + IntToStr( NextSequence )                                         + ',  ' +
         '   ' + FCdsSimulaTransfPlano.FieldByName('IDPESSOA').AsString           + ',  ' +
         '   ' + FCdsSimulaTransfPlano.FieldByName('IDEVENTOGERADOR').AsString    + ',  ' +
         '   ' + FCdsSimulaTransfPlano.FieldByName('IDTIPOTRANSF').AsString       + ',  ' +
         '   ' + FCdsSimulaTransfPlano.FieldByName('IDCONFIG').AsString           + ',  ' +
         '   ' + OraNumero( FCdsSimulaTransfPlano.FieldByName('VALOR').AsString ) + ',  ' +
         '   to_date( ''' + FormatDateTime( 'dd/mm/yyyy',
                          FCdsSimulaTransfPlano.FieldByName('DTSIMULA').AsDateTime )   +
         ''', ''dd/mm/yyyy'' ) ) ' );
         
        FCdsSimulaTransfPlano.Next;
      end;

      Commit;

      Result := True;

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

procedure TCtrlSimulaTransfPlano.OnCreateAppServer;
begin
  inherited;
  FCdsSimulaTransfPlano := TCMClientDataSet.Create( nil );
end;

function TCtrlSimulaTransfPlano.SelecionaSimulaTransfPlano( iIdSimulaTransf : integer ) : OleVariant;
begin
  if ConnectionSide = cnsClient then
    Result := Connection.AppServer.SelecionaSimulaTransfPlano( iIdSimulaTransf )
  else
  begin
    FDbSimulaTransfPlano.IdSimulaTransf.AsInteger := iIdSimulaTransf;
    Result := GetDataPacket( FDbSimulaTransfPlano.SSqlSelect );
  end;
end;

procedure TCtrlSimulaTransfPlano.SetCdsSimulaTransfPlano(
  const Value: TCMClientDataSet);
begin
  FCdsSimulaTransfPlano := Value;
end;

procedure TCtrlSimulaTransfPlano.SetDbSimulaTransfPlano(
  const Value: TDbSimulaTransfPlano);
begin
  FDbSimulaTransfPlano := Value;
end;

function TCtrlSimulaTransfPlano.DadosSimulacao( iIdPessoa : integer): OleVariant;
begin
  Result := GetDataPacket(
   ' select   s.IDSIMULATRANSF,                             ' +
   '          s.IDTIPOTRANSF,                               ' +
   '          s.IDCONFIG,                                   ' +
   '          t.NOME as NOMETIPO,                           ' +
   '          c.NOME as NOMECONFIG,                         ' +
   '          p.NOME as PLANO,                              ' +
   '          s.VALOR                                       ' +
   ' from     SIMULATRANSFPLANO   s,                        ' +
   '          TIPOSTRANSFPLANO    t,                        ' +
   '          CONFIGTRANSFPLANO   c,                        ' +
   '          PLANPREV            p                         ' +
   ' where    s.IDEVENTOGERADOR = t.IDEVENTOGERADOR         ' +
   '   and    s.IDTIPOTRANSF    = t.IDTIPOTRANSF            ' +
   '   and    s.IDEVENTOGERADOR = c.IDEVENTOGERADOR         ' +
   '   and    s.IDTIPOTRANSF    = c.IDTIPOTRANSF            ' +
   '   and    s.IDCONFIG        = c.IDCONFIG                ' +
   '   and    c.IDPLANOPREV     = p.IDPLANOPREV             ' +
   '   and    s.IDPESSOA        = ' + IntToStr( iIdPessoa )   +
   ' order by s.IDTIPOTRANSF,                               ' +
   '          s.IDCONFIG                                    ' );
end;

function TCtrlSimulaTransfPlano.NextSequence: integer;
var
  cdsLocal : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try
    cdsLocal.Data := GetDataPacket( ' select nvl( max( IDSIMULATRANSF ), 0 ) + 1 as ULT from SIMULATRANSFPLANO ' );
    Result := cdsLocal.FieldByName('ULT').AsInteger;
    cdsLocal.Close;
  finally
    cdsLocal.Free;
  end;
end;


end.

