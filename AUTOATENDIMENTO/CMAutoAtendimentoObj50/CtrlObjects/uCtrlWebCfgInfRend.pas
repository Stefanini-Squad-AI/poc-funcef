unit uCtrlWebCfgInfRend;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes;

Type
  TCtrlWebCfgInfRend = class(TCmControlObject)
  private
    FCdsWebCfgInfRend: TCMClientDataSet;
    procedure SetCdsWebCfgInfRend(const Value: TCMClientDataSet);
  protected

  public
    function BuscaParametrosInfRend : Olevariant;
    destructor Destroy; override;

    property CdsWebCfgInfRend  : TCMClientDataSet read FCdsWebCfgInfRend write SetCdsWebCfgInfRend;

    function GravaParams( iFlgOrigem, iIdRubrica13 : integer; sNomeRespon : string; dDataInfo : TDateTime; FlgEdit : boolean ) : Boolean;
  published

end;

implementation

{ TCtrlWebCfgInfRend }

destructor TCtrlWebCfgInfRend.Destroy;
begin
  if IsAppServer then FCdsWebCfgInfRend.Free;
  inherited;
end;


function TCtrlWebCfgInfRend.BuscaParametrosInfRend: Olevariant;
begin
  Result := GetDataPacket('SELECT * FROM WEBCFGINFREND ');
end;

procedure TCtrlWebCfgInfRend.SetCdsWebCfgInfRend(
  const Value: TCMClientDataSet);
begin
  FCdsWebCfgInfRend := Value;
end;

function TCtrlWebCfgInfRend.GravaParams( iFlgOrigem, iIdRubrica13 : integer; sNomeRespon : string; dDataInfo : TDateTime; FlgEdit : boolean ) : Boolean;
var
  sSQL : string;
begin
  try
    if FlgEdit then
    begin
      sSQL := ' UPDATE WEBCFGINFREND SET                        ' +
              ' FLGORIGEM   = ' + intTostr( iFlgOrigem   ) + ', ' +
              ' IDRUBRICA13 = ' + IntToStr( iIdRubrica13 ) + ', ' +
              ' NOMERESPON  = ' + QuotedStr( sNomeRespon ) + ', ' +
              ' DATAINFO    = ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataInfo ) );
      ExecSql( sSQL );
    end
    else
    begin
      sSQL := ' INSERT INTO WEBCFGINFREND ( FLGORIGEM, IDRUBRICA13, NOMERESPON, DATAINFO ) ' +
              ' VALUES ( ' + IntToStr( iFlgOrigem ) + ', ' + IntToStr( iIdRubrica13 ) + ', ' +
              QuotedStr( sNomeRespon ) + ', ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy', dDataInfo ) ) +
              ' ) ';
      ExecSql( sSQL );
    end;
    Result := true;
  except
    On e : Exception do
    begin
     Result := False;
     MessageInfo := e.Message;
    end;
  end;
end;

end.
