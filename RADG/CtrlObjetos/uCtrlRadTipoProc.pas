unit uCtrlRadTipoProc;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, DB,
     uCmTypes, uDbRadTipoProc, uDbRadEtapaNovo, uDbRadEtapaDest;

Type
  TCtrlRadTipoProc = class(TCmControlObject)
  private
    FDbRadTipoProc: TDbRadTipoProc;
    FDbRadEtapa: TDbRadEtapa;
    FDbRadEtapaDest: TDbRadEtapaDest;
    procedure SetDbRadTipoProc(const Value: TDbRadTipoProc);
    procedure SetDbRadEtapa(const Value: TDbRadEtapa);
    procedure SetDbRadEtapaDest(const Value: TDbRadEtapaDest);

  protected

    procedure AfterInitialize; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbRadTipoProc : TDbRadTipoProc read FDbRadTipoProc write SetDbRadTipoProc;
    property DbRadEtapa : TDbRadEtapa read FDbRadEtapa write SetDbRadEtapa;
    property DbRadEtapaDest : TDbRadEtapaDest read FDbRadEtapaDest write SetDbRadEtapaDest;

    function SelecionaRadTipoProc( iIdRadTipoProc : integer ) : OleVariant;
    function ListaEventoGerador : OLEVariant;

    function GravaRadTipoProc( oRadTipoProc, oRadEtapa, oRadEtapaDest : OLEVariant ) : Boolean;
    function ExcluiRadTipoProc( iIdRadTipoProc : integer ) : Boolean;

    function NextId( TableName : string ) : integer;

  published

end;

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
  end
  else
  begin
    FDbRadTipoProc.DbAdoConnection  := DbAdoConnection;
    FDbRadEtapa.DbAdoConnection     := DbAdoConnection;
    FDbRadEtapaDest.DbAdoConnection := DbAdoConnection;
  end;
end;

constructor TCtrlRadTipoProc.Create;
begin
  inherited;
  FDbRadTipoProc  := TDbRadTipoProc.Create( Self );
  FDbRadEtapa     := TDbRadEtapa.Create( Self );
  FDbRadEtapaDest := TDbRadEtapaDest.Create( Self );
end;

destructor TCtrlRadTipoProc.Destroy;
begin
  FDbRadTipoProc.Free;
  FDbRadEtapa.Free;
  FDbRadEtapaDest.Free;
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

function TCtrlRadTipoProc.GravaRadTipoProc( oRadTipoProc, oRadEtapa, oRadEtapaDest : OLEVariant ) : Boolean;
var
  cdsRadTipoProc,
  cdsRadEtapa,
  cdsRadEtapaDest : TCmClientDataset;
  iIdAnt : integer;
begin
  cdsRadTipoProc  := TCmClientDataset.Create( nil );
  cdsRadEtapa     := TCmClientDataset.Create( nil );
  cdsRadEtapaDest := TCmClientDataset.Create( nil );
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

        StartTransaction;

        //desliga filtros que porventura existam
        CdsRadTipoProc.Filtered  := False;
        CdsRadEtapa.Filtered     := False;
        cdsRadEtapaDest.Filtered := False;

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
            CdsRadTipoProc.FieldByName('IDRADTIPOPROC').AsInteger := NextId( 'RADTIPOPROC' );
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
            CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger := NextId( 'RADETAPA' );
            CdsRadEtapa.Post;
          end;

          //Destinatários
          cdsRadEtapaDest.First;
          while not cdsRadEtapaDest.Eof do
          begin
            if cdsRadEtapaDest.FieldByName('IDRADETAPA').AsInteger = iIdAnt then
            begin
              cdsRadEtapaDest.Edit;
              cdsRadEtapaDest.FieldByName('IDRADETAPA').AsInteger := CdsRadEtapa.FieldByName('IDRADETAPA').AsInteger;
              cdsRadEtapaDest.Post;
            end;
            cdsRadEtapaDest.Next;
          end;

          CdsRadEtapa.Next;
        end;

        CdsRadTipoProc.First;
        CdsRadEtapa.First;
        cdsRadEtapaDest.First;

        if ApplyCds( CdsRadTipoProc, FDbRadTipoProc, [], [] ) then
          if ApplyCds( CdsRadEtapa, DbRadEtapa, [], [] ) then
            if ApplyCds( cdsRadEtapaDest, DbRadEtapaDest, [], [] ) then
              Result := True;

        if not Result then raise Exception.Create( FDbRadTipoProc.MessageInfo + #13#10 +
         FDbRadEtapa.MessageInfo + #13#10 + FDbRadEtapaDest.MessageInfo );

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
  end;
end;


function TCtrlRadTipoProc.ListaEventoGerador: OLEVariant;
begin
  Result := GetDataPacket( ' select * from RADREFERENCIA order by DESCREFERENCIA ' );

end;

function TCtrlRadTipoProc.NextId(TableName: string): integer;
begin
  With TCMClientDataSet.Create(nil) do
    Try
      Data := GetDataPacket( 'SELECT SEQ' + TableName + '.NEXTVAL FROM DUAL' );
      Result := Fields[0].AsInteger;
      Close;
      Free;
    except
      Free;
      raise;
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

procedure TCtrlRadTipoProc.SetDbRadEtapaDest(const Value: TDbRadEtapaDest);
begin
  FDbRadEtapaDest := Value;
end;

procedure TCtrlRadTipoProc.SetDbRadTipoProc(const Value: TDbRadTipoProc);
begin
  FDbRadTipoProc := Value;
end;

end.

