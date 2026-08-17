unit uCtrlWebTpReports;

//Pendência 19090

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     uCtrlReports, uDbWebTpReports, uCmFileUtils, uCtrlFuncoesAA, HTTPApp;

Type
  TCtrlWebTpReports = class(TCmControlObject)
  private
    FCdsWebTpReports: TCMClientDataSet;
    FDbWebTpReports: TDbWebTpReports;
    FReports: TCtrlReports;
    procedure SetCdsWebTpReports(const Value: TCMClientDataSet);
    procedure SetDbWebTpReports(const Value: TDbWebTpReports);
    procedure SetReports(const Value: TCtrlReports);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebTpReports : TDbWebTpReports read FDbWebTpReports write SetDbWebTpReports;
    property CdsWebTpReports : TCMClientDataSet read FCdsWebTpReports write SetCdsWebTpReports;
    property Reports : TCtrlReports read FReports write SetReports;

    function SelecionaWebTpReports( iIdWebReports : integer ) : OleVariant;
    function GravaWebTpReports : Boolean;
    function SelecionaTodos: OleVariant;

    function RelatorioDinamico( iIdDataView, iOrigemCMDV : integer;
                                Request: TWebRequest) : OleVariant;

  published

end;

implementation

{ TCtrlWebReports }

procedure TCtrlWebTpReports.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebTpReports.DataBaseName    := DataBaseName
  else
    FDbWebTpReports.DbAdoConnection := DbAdoConnection;
  FReports.InitializeAs( Self );
end;

constructor TCtrlWebTpReports.Create;
begin
  inherited;
  FDbWebTpReports  := TDbWebTpReports.Create( self );
  FReports         := TCtrlReports.Create;
end;

destructor TCtrlWebTpReports.Destroy;
begin
  FDbWebTpReports.Free;
  FReports.Free;
  if IsAppServer then FCdsWebTpReports.Free;
  inherited;
end;

function TCtrlWebTpReports.GravaWebTpReports: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebTpReports( CdsWebTpReports.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebTpReports, FDbWebTpReports, [], [] );

      Msg := FDbWebTpReports.MessageInfo;

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


procedure TCtrlWebTpReports.OnCreateAppServer;
begin
  inherited;
  FCdsWebTpReports := TCMClientDataSet.Create( nil );
end;

function TCtrlWebTpReports.SelecionaWebTpReports( iIdWebReports : integer ) : OleVariant;
begin
  FDbWebTpReports.IdWebReports.AsInteger   := iIdWebReports;
  Result := GetDataPacket( FDbWebTpReports.SSqlSelect );
end;

procedure TCtrlWebTpReports.SetCdsWebTpReports(const Value: TCMClientDataSet);
begin
  FCdsWebTpReports := Value;
end;

procedure TCtrlWebTpReports.SetDbWebTpReports(const Value: TDbWebTpReports);
begin
  FDbWebTpReports := Value;
end;

function TCtrlWebTpReports.SelecionaTodos: OleVariant;
begin
  Result := GetDataPacket( ' select   IDWEBREPORTS,  ' +
                           '          FLGTIPO,       ' +
                           '          DESCRICAO      ' +
                           '   from   WEBTPREPORTS   ' +
                           ' order by IDWEBREPORTS   ' );
end;


//Pendência 19090
procedure TCtrlWebTpReports.SetReports(const Value: TCtrlReports);
begin
  FReports := Value;
end;


function TCtrlWebTpReports.RelatorioDinamico( iIdDataView, iOrigemCMDV : integer;
                                              Request: TWebRequest) : OleVariant;
var
  cdsLocal : TCMClientDataSet;
  sSQL, sTag : string;
begin

  cdsLocal := TCMClientDataSet.Create( nil );
  try

    cdsLocal.Data := Reports.SelecionaDataView( iIdDataView, iOrigemCMDV );

    if cdsLocal.IsEmpty then
      raise Exception.Create('Não foi possível encontrar a consulta especificada.');

    sSQL := trim( cdsLocal.FieldByName('TEMPLATE').AsString );

    cdsLocal.Close;

    if sSQL = '' then
      raise Exception.Create('Erro ao montar consulta.');

    sTag := StrFindTag(sSQL);

    while sTag <> '' do begin
       sSQL   := StrSubst( sSQL, '<#' + sTag + '>', Request.ContentFields.Values[sTag] );
       sTag   := StrFindTag(sSQL);
    end;

    Result := GetDataPacket( sSQL );

  finally
    cdsLocal.Free;
  end;

end;
//Fim Pendência 19090


end.

