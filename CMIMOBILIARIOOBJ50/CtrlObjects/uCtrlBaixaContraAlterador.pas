unit uCtrlBaixaContraAlterador;
{*******************************************************}
{ Analista Responsável: Helen V. Bianchi                }
{ Atualizado Em: 09/10/2011                             }
{ SOL: 136341 Kintana : 815095                          }
{*******************************************************}

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCMTypes, uDbBaixaContraAlterador;


type
  tCtrlBaixaContraAlterador = class(TCmControlObject)
  private
    FCdsBaixaContraAlterador: TCMClientDataSet;
    FdbBaixaContraAlterador: TDbBaixaContraAlterador;
    procedure SetCdsBaixaContraAlterador(const Value: TCMClientDataSet);
    procedure SetdbBaixaContraAlterador(const Value: TDbBaixaContraAlterador);

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    // tabela OutroDado
    property dbBaixaContraAlterador: TDbBaixaContraAlterador read FdbBaixaContraAlterador write SetdbBaixaContraAlterador;
    property CdsBaixaContraAlterador: TCMClientDataSet read FCdsBaixaContraAlterador write SetCdsBaixaContraAlterador;


    function LookupBaixaContraAlterador (const sCodTipoImovel: string = ''; IdModulo: Integer = 0): OLEVariant;
    function VerificaBaixaContraAlterador (sCodTipoImovel: string = '';
                                           sAcresDecres: string = '';
                                           IdModulo: Integer = 0 ): OLEVariant;
    function GravaBaixaContraAlterador(sTipoOperacao: String; IdBaixaContra: String  = '0' ): boolean;
    //sTipoOperacao I - Insert / U - Update / D - Delete 

  published

end;

implementation

{ tCtrlBaixaContraAlterador }

constructor tCtrlBaixaContraAlterador.Create;
begin
  inherited;
  FdbBaixaContraAlterador := TDbBaixaContraAlterador.Create( Self );
end;

procedure tCtrlBaixaContraAlterador.onCreateAppServer;
begin
  inherited;
  FCdsBaixaContraAlterador := TCMClientDataSet.Create (nil);
end;

destructor tCtrlBaixaContraAlterador.Destroy;
begin
  inherited;
  FreeAndNil (FdbBaixaContraAlterador);
  if isAppServer then
  begin
    FreeAndNil (FCdsBaixaContraAlterador);
  end;
end;

procedure tCtrlBaixaContraAlterador.AfterInitialize;
begin
  inherited;
  FdbBaixaContraAlterador.DataBaseName := DataBaseName;
end;

function tCtrlBaixaContraAlterador.GravaBaixaContraAlterador(sTipoOperacao: String; IdBaixaContra : String ): Boolean;
var
  sMsg , sSql: string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaBaixaContraAlterador (CdsBaixaContraAlterador.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else
  begin
    try
      StartTransaction;
      if sTipoOperacao = 'I' then
      begin
         Result := ApplyCds(CdsBaixaContraAlterador, dbBaixaContraAlterador, [], []);
      end;
      if sTipoOperacao = 'U' then
      begin
         try
             Result := True;
             sSql := ' UPDATE BAIXACONTRAALTERADOR  SET ' +
                     '    CODTIPIMOVEL     = ' + QuotedStr(CdsBaixaContraAlterador.FieldByName('CODTIPIMOVEL').asString)  +#13+
                     '  , CODALTERADOR     = ' + QuotedStr(CdsBaixaContraAlterador.FieldByName('CODALTERADOR').asString)  +#13+
                     '  , ACRESDECRES      = ' + QuotedStr(CdsBaixaContraAlterador.FieldByName('ACRESDECRES').asString)   +#13+
                     ' WHERE IDBAIXACONTRA = ' + CdsBaixaContraAlterador.FieldByName('IDBAIXACONTRA').asString;
             if not ExecSQL(sSql, True) then
                Raise Exception.Create(MessageInfo);
         except
             Result := False;
         end;
      end;
      if sTipoOperacao = 'D' then
      begin
         try
             Result := True;
             sSql   := ' DELETE FROM BAIXACONTRAALTERADOR ' +
                       ' WHERE IDBAIXACONTRA = ' + IdBaixaContra ; //+ CdsBaixaContraAlterador.FieldByName('IDBAIXACONTRA').asString;
             if not ExecSQL(sSql, True) then
                Raise Exception.Create(MessageInfo);
         except
             Result := False;
         end;
      end;

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

function tCtrlBaixaContraAlterador.LookupBaixaContraAlterador(const sCodTipoImovel: string; IdModulo: Integer ): OLEVariant;
var sSql,sParam : String;
begin
  sParam := '';
  if sCodTipoImovel <> '' then
     sParam := sParam + ' AND B.CODTIPIMOVEL = ' + QuotedStr(sCodTipoImovel);
  if IdModulo > 0  then
     sParam := sParam + ' AND B.IDMODULO = ' + IntToStr (IdModulo);

  sSql := 'SELECT B.IDBAIXACONTRA,B.ACRESDECRES, B.CODTIPIMOVEL,B.CODALTERADOR,T.DESCRICAO,'+#13+
          '       DECODE (B.ACRESDECRES , ''A'',''Acréscimo'',''Desconto'')as VACRESDECRE, '+#13+
          '       B.IDMODULO  '+#13+
          '  FROM BAIXACONTRAALTERADOR  B, TIPOALTERADOR T              '+#13+
          ' WHERE B.CODALTERADOR = T.CODALTERADOR '+#13+ sParam +
          ' ORDER BY T.DESCRICAO ';
  result := GetDataPacket (sSql);
end;

procedure tCtrlBaixaContraAlterador.SetCdsBaixaContraAlterador(const Value: TCMClientDataSet);
begin
  FCdsBaixaContraAlterador := Value;
end;

procedure tCtrlBaixaContraAlterador.SetdbBaixaContraAlterador(const Value: TDbBaixaContraAlterador);
begin
  FdbBaixaContraAlterador := Value;
end;

function tCtrlBaixaContraAlterador.VerificaBaixaContraAlterador(sCodTipoImovel, sAcresDecres: string;
                                                               IdModulo: Integer): OLEVariant;
var sSql : String;
begin
     sSql := ' SELECT B.IDBAIXACONTRA,B.ACRESDECRES, B.CODTIPIMOVEL,B.CODALTERADOR,B.IDMODULO'+#13+
          '   FROM BAIXACONTRAALTERADOR  B               '+#13+
          '   WHERE   '+#13+
          '       (B.CODTIPIMOVEL = ''' + sCodTipoImovel + ''') ' +#13+
          '   AND (B.ACRESDECRES = '''  + sAcresDecres + ''')   ' +#13+
          '   AND (B.IDMODULO = '''     + IntToStr(IdModulo) + ''')   '       ;
  result := GetDataPacket (sSql);
end;

end.
