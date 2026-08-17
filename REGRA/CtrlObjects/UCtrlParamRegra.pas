unit UCtrlParamRegra;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbParamRegra;

Type

  TCtrlParamRegra = class(TCmControlObject)
  private
    FCdsParamRegra: TCMClientDataSet;
    FDbParamRegra: TDbParamRegra;
    procedure SetCdsParamRegra(const Value: TCMClientDataSet);
    procedure SetDbParamRegra(const Value: TDbParamRegra);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbParamRegra : TDbParamRegra     read FDbParamRegra  write SetDbParamRegra;
    property CdsParamRegra : TCMClientDataSet read FCdsParamRegra write SetCdsParamRegra;

    function SelecionaParamRegra( iIdParamRegra : Integer ) : OleVariant;
    function GravaParamRegra : Boolean;
    function ListaParamRegra : OleVariant;
    function AtualizaParamRegra(FlgCampo, FlgVariavel : Integer): Boolean;

  published

end;

implementation

{ TCtrlParamRegra }

constructor TCtrlParamRegra.Create;
begin
  inherited;
  FDbParamRegra  := TDbParamRegra.Create(Self);
  FCdsParamRegra := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlParamRegra.Destroy;
begin
  FDbParamRegra.Free;
  FCdsParamRegra.Free;
  inherited;
end;

procedure TCtrlParamRegra.DoChangeDataBase;
begin
  inherited;
  FDbParamRegra.DataBaseName := Self.DataBaseName;
end;


function TCtrlParamRegra.GravaParamRegra: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarParamRegra( CdsParamRegra.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsParamRegra, DbParamRegra, [], [] );

      Msg := DbParamRegra.MessageInfo;

      if not Result then raise Exception.Create( Msg );

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


procedure TCtrlParamRegra.SetCdsParamRegra(const Value: TCMClientDataSet);
begin
  FCdsParamRegra := Value;
end;

procedure TCtrlParamRegra.SetDbParamRegra(const Value: TDbParamRegra);
begin
  FDbParamRegra := Value;
end;

function TCtrlParamRegra.SelecionaParamRegra( iIdParamRegra : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaParamRegra( iIdParamRegra );
  end else begin
    Result := GetDataPacket( FDbParamRegra.SSqlSelect );
  end;
end;

function TCtrlParamRegra.ListaParamRegra: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaGrpRegra;
  end else begin
    Result := GetDataPacket( 'SELECT FLGCAMPO, FLGVARIAVEL '+
                             'FROM PARAMREGRA              ' );
  end;
end;

function TCtrlParamRegra.AtualizaParamRegra(FlgCampo, FlgVariavel: Integer): Boolean;
begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.AtualizaParamRegra;
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else
    Result := ExecSQL( 'UPDATE PARAMREGRA     ' +
                       '   SET FLGCAMPO    =  ' + IntToStr(FlgCampo) +', '+
                       '       FLGVARIAVEL =  ' + InttoStr(FlgVariavel)  );
end;

end.

