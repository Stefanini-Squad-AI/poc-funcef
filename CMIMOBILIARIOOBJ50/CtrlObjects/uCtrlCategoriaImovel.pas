unit uCtrlCategoriaImovel;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, dbClient, provider,
  wwQuery, uCMClientDataSet,
  {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
  uDbCategoriaImovel;

type
  TCtrlCategoriaImovel = class(TCmControlObject)
  private
    FCdsCategoriaImovel: TCMClientDataSet;
    FdbCategoriaImovel: TDbCategoriaImovel;
    procedure SetCdsCategoriaImovel(const Value: TCMClientDataSet);
    procedure SetdbCategoriaImovel(const Value: TDbCategoriaImovel);

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    // tabela OutroDado
    property dbCategoriaImovel: TDbCategoriaImovel read FdbCategoriaImovel write SetdbCategoriaImovel;
    property CdsCategoriaImovel: TCMClientDataSet read FCdsCategoriaImovel write SetCdsCategoriaImovel;

    function GravaCategoriaImovel: boolean;

    function LookupCategoriaImovel(const iIdCategoriaImovel: integer = -1): OleVariant;

  published
end;

implementation

{ TCtrlCategoriaImovel }

constructor TCtrlCategoriaImovel.Create;
begin
  inherited;
  FdbCategoriaImovel := TDbCategoriaImovel.Create( Self );
end;


procedure TCtrlCategoriaImovel.onCreateAppServer;
begin
  inherited;
  FCdsCategoriaImovel := TCMClientDataSet.Create (nil);
end;

destructor TCtrlCategoriaImovel.Destroy;
begin
  FreeAndNil(FdbCategoriaImovel);

  if isAppServer then begin
    FreeAndNil(FCdsCategoriaImovel);
  end;

  inherited;
end;

procedure TCtrlCategoriaImovel.AfterInitialize;
begin
  inherited;
  FdbCategoriaImovel.DataBaseName := DataBaseName;
end;



function TCtrlCategoriaImovel.GravaCategoriaImovel: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaCategoriaImovel (CdsCategoriaImovel.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsCategoriaImovel, dbCategoriaImovel, [], []);
      sMsg := dbCategoriaImovel.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

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

function TCtrlCategoriaImovel.LookupCategoriaImovel(const iIdCategoriaImovel: integer): OleVariant;
begin
  if iIdCategoriaImovel = -1 then begin
    result := GetDataPacket ('SELECT IDCATEGORIAIMOVEL, CTIDESCRICAO '+
                             'FROM CATEGORIAIMOVEL '+
                             'ORDER BY CTIDESCRICAO ');
  end else begin  // NECESSÁRIO DEVIDO A BUG NO PADRÃO - TELA fCadOutroDadoMT
    result := GetDataPacket ('SELECT IDCATEGORIAIMOVEL, CTIDESCRICAO '+
                             'FROM CATEGORIAIMOVEL '+
                             'WHERE IDCATEGORIAIMOVEL = '+IntToStr(iIdCategoriaImovel));
  end;
end;

procedure TCtrlCategoriaImovel.SetCdsCategoriaImovel(
  const Value: TCMClientDataSet);
begin
  FCdsCategoriaImovel := Value;
end;

procedure TCtrlCategoriaImovel.SetdbCategoriaImovel(
  const Value: TDbCategoriaImovel);
begin
  FdbCategoriaImovel := Value;
end;

end.
