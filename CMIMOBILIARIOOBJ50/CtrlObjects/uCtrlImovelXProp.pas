unit uCtrlImovelXProp;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
     uDbImovelXProp;

type
  TCtrlImovelXProp = class(TCmControlObject)
  private
    FCdsImovelXProp: TCMClientDataSet;
    FdbImovelXProp: TDbImovelXProp;
    procedure SetCdsImovelXProp(const Value: TCMClientDataSet);
    procedure SetdbImovelXProp(const Value: TDbImovelXProp);
    function VerificaPercentual : boolean;

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    // Tabela ImovelXProp
    property dbImovelXProp: TDbImovelXProp read FdbImovelXProp write SetdbImovelXProp;
    property CdsImovelXProp: TCMClientDataSet read FCdsImovelXProp write SetCdsImovelXProp;

    function GravaImovelXProp: boolean;
    function SelecionaImovelXProp(const iIdImovel: integer; const iIdProprietario:Integer = -1): OleVariant;
    function SelecionaEmpreendedores : OleVariant; 

  published
end;

implementation

{ TCtrlOutroDado }

procedure TCtrlImovelXProp.AfterInitialize;
begin
  inherited;
  FdbImovelXProp.DataBaseName := DataBaseName;
end;

constructor TCtrlImovelXProp.Create;
begin
  inherited;
  FdbImovelXProp := TDbImovelXProp.Create( Self );
end;

destructor TCtrlImovelXProp.Destroy;
begin
  inherited;
  FreeAndNil(FdbImovelXProp);
end;

function TCtrlImovelXProp.GravaImovelXProp: boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaOutroDado (CdsImovelXProp.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      if not VerificaPercentual then
        Raise Exception.Create('A soma dos percentuais ultrapassa 100%');

      Result := ApplyCds(CdsImovelXProp, dbImovelXProp, [], []);

      if  not Result then raise Exception.Create(dbImovelXProp.MessageInfo);

      Commit;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlImovelXProp.onCreateAppServer;
begin
  inherited;
  FCdsImovelXProp := TCMClientDataSet.Create (nil);
end;

function TCtrlImovelXProp.SelecionaEmpreendedores: OleVariant;
var
  sSql : string;
begin
  sSql := 'SELECT P.IDPESSOA, P.NOME' +#13+
          'FROM PESSOA P, PROPRIETARIOUH PR' +#13+
          'WHERE P.IDPESSOA = PR.IDPROPRIETARIOUH';

  Result := GetDataPacket (sSql);
end;

function TCtrlImovelXProp.SelecionaImovelXProp(const iIdImovel: integer; const iIdProprietario:Integer): OleVariant;
var sSql : string;
begin
  sSql := 'SELECT IM.IDIMOVEL, IM.IDPROPRIETARIOUH, ' +#13+
          '       IM.PERCENTUAL, P.NOME ' +#13+
          '  FROM IMOVELXPROP IM, PESSOA P ' +#13+
          ' WHERE IM.IDPROPRIETARIOUH = P.IDPESSOA ' +#13+
          '   AND IM.IDIMOVEL = '  + IntToStr(iIdImovel);

  if iIdProprietario > 0 then
     sSql := sSql + ' AND IM.IDPROPRIETARIOUH = ' + IntToStr(iIdProprietario);

  Result := GetDataPacket (sSql);
end;

procedure TCtrlImovelXProp.SetCdsImovelXProp(const Value: TCMClientDataSet);
begin
  FCdsImovelXProp := Value;
end;

procedure TCtrlImovelXProp.SetdbImovelXProp(const Value: TDbImovelXProp);
begin
  FdbImovelXProp := Value;
end;

function TCtrlImovelXProp.VerificaPercentual: boolean;
var
  TotPercentual : Double;
begin
  TotPercentual := 0;
  Result := False;

  CdsImovelXProp.First;
  while not CdsImovelXProp.Eof do
    begin
      TotPercentual := TotPercentual + CdsImovelXProp.FieldByName('PERCENTUAL').AsFloat;
      CdsImovelXProp.Next;
    end;
  if TotPercentual <= 100 then
    Result := True;


end;

end.
