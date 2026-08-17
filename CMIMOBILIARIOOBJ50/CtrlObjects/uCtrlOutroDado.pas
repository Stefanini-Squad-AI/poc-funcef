{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18
Pendência   :
Responsável : Daniel Simões
Data        : 07/01/2008
Descrição   : Correção na tela de Cadastro de Dados Complementares do módulo
              Indicadores - Criação da função 'GravaOutroDadoIndicadores' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlOutroDado;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, dbClient, provider,
  wwQuery, uCMClientDataSet, uCMTypes,
  uDbOutroDado, uDbOutroDadoXTipoImo, uDbOutroDadoXImovel, uDbOutroDadoXUnidaut, uDbOutroDadoXProp;

type
  TCtrlOutroDado = class(TCmControlObject)
  private
    FCdsOutroDado: TCMClientDataSet;
    FdbOutroDado: TDbOutroDado;
    FCdsOutroDadoXTipoImo: TCMClientDataSet;
    FdbOutroDadoXTipoImo: TdbOutroDadoXTipoImo;
    FCdsOutroDadoXImovel: TCMClientDataSet;
    FdbOutroDadoXImovel: TDbOutrodadoximovel;
    FCdsOutroDadoXUnidaut: TCMClientDataSet;
    FdbOutroDadoXUnidaut: TDbOutrodadoXUnidaut;
    FdbOutroDadoXProp: TDbOutrodadoXProp;
    FCdsOutroDadoXProp: TCMClientDataSet;
    procedure SetCdsOutroDado(const Value: TCMClientDataSet);
    procedure SetdbOutroDado(const Value: TDbOutroDado);
    procedure SetCdsOutroDadoXTipoImo(const Value: TCMClientDataSet);
    procedure SetdbOutroDadoXTipoImo(const Value: TdbOutroDadoXTipoImo);
    procedure SetCdsOutroDadoXImovel(const Value: TCMClientDataSet);
    procedure SetdbOutroDadoXImovel(const Value: TDbOutrodadoximovel);
    procedure SetCdsOutroDadoXUnidaut(const Value: TCMClientDataSet);
    procedure SetdbOutroDadoXUnidaut(const Value: TDbOutrodadoXUnidaut);
    procedure SetdbOutroDadoXProp(const Value: TDbOutrodadoXProp);
    procedure SetCdsOutroDadoXProp(const Value: TCMClientDataSet);

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    // tabela OutroDado
    property dbOutroDado: TDbOutroDado read FdbOutroDado write SetdbOutroDado;
    property CdsOutroDado: TCMClientDataSet read FCdsOutroDado write SetCdsOutroDado;

    // tabela OutroDadoXTipoImo
    property dbOutroDadoXTipoImo: TdbOutroDadoXTipoImo read FdbOutroDadoXTipoImo write SetdbOutroDadoXTipoImo;
    property CdsOutroDadoXTipoImo: TCMClientDataSet read FCdsOutroDadoXTipoImo write SetCdsOutroDadoXTipoImo;

    // tabela OutroDadoXImovel
    property dbOutroDadoXImovel: TDbOutrodadoximovel read FdbOutroDadoXImovel write SetdbOutroDadoXImovel;
    property CdsOutroDadoXImovel: TCMClientDataSet read FCdsOutroDadoXImovel write SetCdsOutroDadoXImovel;

    // tabela OutroDadoXUnidaut
    property dbOutroDadoXUnidaut: TDbOutrodadoXUnidaut read FdbOutroDadoXUnidaut write SetdbOutroDadoXUnidaut;
    property CdsOutroDadoXUnidaut: TCMClientDataSet read FCdsOutroDadoXUnidaut write SetCdsOutroDadoXUnidaut;

    // tabela OutroDadoXProp
    property dbOutroDadoXProp: TDbOutrodadoXProp read FdbOutroDadoXProp write SetdbOutroDadoXProp;
    property CdsOutroDadoXProp: TCMClientDataSet read FCdsOutroDadoXProp write SetCdsOutroDadoXProp;

    function GravaOutroDado: boolean;
    function GravaOutroDadoIndicadores: Boolean;
    function GravaOutroDadoXTipoImo: boolean;
    function GravaOutroDadoXImovel: boolean;
    function GravaOutroDadoXUnidaut: boolean;
    function GravaOutroDadoXProp: boolean;

    function SelecionaOutroDadoXTipoImo(const iIdOutroDado: integer; const sCodTipoImovel: string): OleVariant;
    function LookupOutroDado(const sCodTipImovel: string = ''; const iIdOutroDado: integer = -1; const sOrigem: string = ''): OleVariant;

// Daniel - 23516 - Início -----------------------------------------------------
    function ExcluiOutroDado: Boolean;
    function LookupOutroDadoXTipoImo(const iIdOutroDado:Integer=-1; const sCodTipImovel:string=''): OleVariant;

    procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;
// Daniel - 23516 - Fim --------------------------------------------------------

    // Daniel - 23517
    function LookupDadosComplementares(const iIdImovel:Integer=-1; const iIdContrato:Integer=-1; FlgOrigem:String=''): OleVariant;

    function LookupOutroDadoXImovel(const iIdImovel: integer = -1; const iIdOutroDado: integer =-1): OleVariant;
    function LookupOutroDadoXUnidaut(const iIdUnidaut: integer = -1; const iIdOutroDado: integer =-1): OleVariant;
    function LookupOutroDadoXProp(const iIdProposta: integer = -1; const iIdOutroDado: integer =-1): OleVariant;

  published
end;                        

implementation

{ TCtrlOutroDado }

constructor TCtrlOutroDado.Create;
begin
  inherited;
  FdbOutroDado := TDbOutrodado.Create( Self );
  FdbOutroDadoXTipoImo := TDbOutrodadoxTipoimo.Create( Self );
  FdbOutroDadoXImovel := TDbOutrodadoximovel.Create( Self );
  FdbOutroDadoXUnidaut := TDbOutrodadoXUnidaut.Create( Self );
  FdbOutroDadoXProp := TDbOutrodadoXProp.Create( Self );
end;


procedure TCtrlOutroDado.onCreateAppServer;
begin
  inherited;
  FCdsOutroDado := TCMClientDataSet.Create (nil);
  FCdsOutroDadoXTipoImo := TCMClientDataSet.Create (nil);
  FCdsOutroDadoXImovel := TCMClientDataSet.Create (nil);
  FCdsOutroDadoXUnidaut := TCMClientDataSet.Create (nil);
  FCdsOutroDadoXProp := TCMClientDataSet.Create (nil);
end;

destructor TCtrlOutroDado.Destroy;
begin
  FreeAndNil(FdbOutroDado);
  FreeAndNil(FdbOutroDadoXTipoImo);
  FreeAndNil(FdbOutroDadoXImovel);
  FreeAndNil(FdbOutroDadoXUnidaut);
  FreeAndNil (FdbOutroDadoXProp);

  if isAppServer then begin
    FreeAndNil(FCdsOutroDado);
    FreeAndNil(FCdsOutroDadoXTipoImo);
    FreeAndNil(FCdsOutroDadoXImovel);
    FreeAndNil(FCdsOutroDadoXUnidaut);
    FreeAndNil (FCdsOutroDadoXProp);
  end;

  inherited;
end;

procedure TCtrlOutroDado.AfterInitialize;
begin
  inherited;
  FdbOutroDado.DataBaseName         := DataBaseName;
  FdbOutroDadoXTipoImo.DataBaseName := DataBaseName;
  FdbOutroDadoXImovel.DataBaseName  := DataBaseName;
  FdbOutroDadoXUnidaut.DataBaseName := DataBaseName;
  FdbOutroDadoXProp.DataBaseName    := DataBaseName;
end;


function TCtrlOutroDado.GravaOutroDado: boolean;
var sMsg : string;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaOutroDado (CdsOutroDado.Data);

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Grava tabela OUTRODADO ( pai )
      Result := ApplyCds(CdsOutroDado,dbOutroDado,[],[]);
      sMsg   := dbOutroDado.MessageInfo;
      if not Result then raise Exception.Create(sMsg);

// Daniel - 23516 --------------------------------------------------------------
      // Grava tabela OUTRODADOXTIPOIMO ( filho )
      Result := ApplyCds(CdsOutroDadoXTipoImo,dbOutroDadoXTipoImo, [], []);
      sMsg   := dbOutroDadoXTipoImo.MessageInfo;
      if not Result then raise Exception.Create(sMsg);
// Daniel - 23516 --------------------------------------------------------------

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

procedure TCtrlOutroDado.AfterApplyCdsRecord(aCds: TClientDataSet; const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
begin
   inherited;
   // Atualiza O ID virtual da tabela de Receitas nas tabelas Filho
   if AnsiUpperCase(sTableName) = 'OUTRODADO' then begin
      if CdsState = usInserted then begin
         // Atualiza o ID da tabela AdsContrxRecxCor
         cdsOutroDadoxTipoImo.First;
         while not cdsOutroDadoxTipoImo.eof do begin
            if (cdsOutroDadoxTipoImo.FieldByName('IDOUTRODADO').AsFloat < 0) and
               (aCds.FieldByName('IDOUTRODADO').AsFloat = cdsOutroDadoxTipoImo.FieldByName('IDOUTRODADO').AsFloat) then begin
               cdsOutroDadoxTipoImo.Edit;
               cdsOutroDadoxTipoImo.FieldByName('IDOUTRODADO').AsFloat := DbOutroDado.IdOutroDado.AsFloat;
               cdsOutroDadoxTipoImo.Post;
            end;
            cdsOutroDadoxTipoImo.Next;
         end;
      end;
   end;
end;

// Daniel - 23516 --------------------------------------------------------------
function TCtrlOutroDado.ExcluiOutroDado: Boolean;
var sSqlLocal : string;
begin
  if (ConnectionSide=cnsClient) then begin
    Result := Connection.AppServer.ExcluiOutroDado;
    if (not Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      CdsOutroDadoXTipoImo.First;
      while not CdsOutroDadoXTipoImo.Eof do CdsOutroDadoXTipoImo.Delete;

      // Exclui tabela OUTRODADOXTIPOIMO ( filho )
      Result := ApplyCds(CdsOutroDadoXTipoImo,dbOutroDadoXTipoImo, [], []);
      if not Result then raise Exception.Create(dbOutroDadoXTipoImo.MessageInfo);

      // Exclui tabela OUTRODADO ( pai )
      Result := ApplyCds(CdsOutroDado,dbOutroDado,[],[]);
      if not Result then raise Exception.Create(dbOutroDado.MessageInfo);

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
// Daniel - 23516 --------------------------------------------------------------



function TCtrlOutroDado.GravaOutroDadoXTipoImo: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaOutroDadoXTipoImo (CdsOutroDadoXTipoImo.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsOutroDadoXTipoImo, dbOutroDadoXTipoImo, [], []);
      sMsg := dbOutroDadoXTipoImo.MessageInfo;

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


function TCtrlOutroDado.GravaOutroDadoXImovel: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaOutroDadoXImovel (CdsOutroDadoXImovel.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsOutroDadoXImovel, dbOutroDadoXImovel, [], []);
      sMsg := dbOutroDadoXImovel.MessageInfo;

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


function TCtrlOutroDado.GravaOutroDadoXUnidaut: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaOutroDadoXUnidaut (CdsOutroDadoXUnidaut.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsOutroDadoXUnidaut, dbOutroDadoXUnidaut, [], []);
      sMsg := dbOutroDadoXUnidaut.MessageInfo;

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


function TCtrlOutroDado.GravaOutroDadoXProp: boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaOutroDadoXProp (CdsOutroDadoXProp.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsOutroDadoXProp, dbOutroDadoXProp, [], []);
      sMsg := dbOutroDadoXProp.MessageInfo;

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


function TCtrlOutroDado.SelecionaOutroDadoXTipoImo(const iIdOutroDado: integer; const sCodTipoImovel: string): OleVariant;
begin
  FdbOutroDadoXTipoImo.Idoutrodado.AsInteger := iIdOutroDado;
  FdbOutroDadoXTipoImo.Codtipimovel.AsString := sCodTipoImovel;

  result := GetDataPacket (FdbOutroDadoXTipoImo.SSqlSelect);
end;

function TCtrlOutroDado.LookupOutroDado(const sCodTipImovel: string; const iIdOutroDado: integer; const sOrigem: string): OleVariant;
var sParam1, sParam2: String;
begin
  sParam1 := '';
  sParam2 := '';

  if (sOrigem<>'') then sParam1 := sParam1 + ' AND O.FLGORIGEM = ' + QuotedStr(sOrigem);
  if (sOrigem<>'') then sParam2 := sParam2 + ' AND FLGORIGEM = '   + QuotedStr(sOrigem);

  if (sCodTipImovel<>'') then begin
{Daniel - 23516 - Início - Adicionado os novos campos da tabela: ANASINT,
                           CODCOMPL, TIPODADO, OPCOES, FLGORIGEM}
    result := GetDataPacket ('SELECT O.IDOUTRODADO, O.ODODESCRICAO, O.ANASINT, '+
                             '       O.CODCOMPL,    O.TIPODADO,     O.OPCOES, O.FLGORIGEM '+
                             'FROM OUTRODADO O, OUTRODADOXTIPOIMO OT '+
                             'WHERE O.IDOUTRODADO = OT.IDOUTRODADO '+
                             'AND OT.CODTIPIMOVEL = '+QuotedStr(sCodTipImovel)+ sParam1 +
                             'ORDER BY O.CODCOMPL ');
  end else begin
    if iIdOutroDado = -1 then begin
      result := GetDataPacket ('SELECT IDOUTRODADO, ODODESCRICAO, ANASINT, '+
                               '       CODCOMPL,    TIPODADO,     OPCOES, FLGORIGEM '+
                               '  FROM OUTRODADO '+
                               ' WHERE 1 = 1 ' + sParam2 +
                               'ORDER BY CODCOMPL ');
    end else begin  // NECESSÁRIO DEVIDO A BUG NO PADRÃO - TELA fCadOutroDadoMT
      result := GetDataPacket ('SELECT IDOUTRODADO, ODODESCRICAO, ANASINT, '+
                               '       CODCOMPL,    TIPODADO,     OPCOES, FLGORIGEM '+
                               'FROM OUTRODADO '+
                               'WHERE IDOUTRODADO = '+QuotedStr(IntToStr(iIdOutroDado))+ sParam2 +
                               'ORDER BY CODCOMPL');
// Daniel - 23516 - Fim
    end;
  end;
end;


function TCtrlOutroDado.LookupOutroDadoXImovel(const iIdImovel, iIdOutroDado: integer): OleVariant;
var
  sSql,sParam : String;
begin
  sParam := '';
  if iIdImovel <> -1    then sParam := sParam + ' AND OI.IDIMOVEL = '    + IntToStr(iIdImovel);
  if iIdOutroDado <> -1 then sParam := sParam + ' AND OI.IDOUTRODADO = ' + IntToStr(iIdOutroDado);

  sSql := 'SELECT '+
          '   OI.IDOUTRODADOXIMOVEL, OI.IDOUTRODADO, OI.IDIMOVEL, OI.ODIVALOR, O.ODODESCRICAO '+
          'FROM '+
          '   OUTRODADOXIMOVEL OI, OUTRODADO O '+
          'WHERE '+
          '   (OI.IDOUTRODADO = O.IDOUTRODADO) '+
          sParam +
          ' ORDER BY O.ODODESCRICAO ';


  Result := GetDataPacket( sSql );
end;


function TCtrlOutroDado.LookupOutroDadoXUnidaut(const iIdUnidaut, iIdOutroDado: integer): OleVariant;
var
  sSql,sParam : String;
begin
  sParam := '';
  if iIdUnidaut   <> -1 then sParam := sParam + ' AND OU.IDUNIDAUT = '    + IntToStr(iIdUnidaut);
  if iIdOutroDado <> -1 then sParam := sParam + ' AND OU.IDOUTRODADO = ' + IntToStr(iIdOutroDado);

  sSql := 'SELECT '+
          '   OU.IDOUTRODADO, OU.IDUNIDAUT, OU.ODUVALOR, O.ODODESCRICAO '+
          'FROM '+
          '   OUTRODADOXUNIDAUT OU, OUTRODADO O '+
          'WHERE '+
          '   (OU.IDOUTRODADO = O.IDOUTRODADO) '+
          sParam +
          ' ORDER BY O.ODODESCRICAO ';


  Result := GetDataPacket( sSql );
end;


function TCtrlOutroDado.LookupOutroDadoXProp(const iIdProposta, iIdOutroDado: integer): OleVariant;
var
  sSql,sParam : String;
begin
  sParam := '';
  if iIdProposta  <> -1 then sParam := sParam + ' AND OP.IDPROPOSTA = '  + IntToStr(iIdProposta);
  if iIdOutroDado <> -1 then sParam := sParam + ' AND OP.IDOUTRODADO = ' + IntToStr(iIdOutroDado);

  sSql := 'SELECT '+
          '   OP.IDOUTRODADO, OP.IDPROPOSTA, OP.ODPVALOR, O.ODODESCRICAO '+
          'FROM '+
          '   OUTRODADOXPROP OP, OUTRODADO O '+
          'WHERE '+
          '   (OP.IDOUTRODADO = O.IDOUTRODADO) '+
          sParam +
          ' ORDER BY O.ODODESCRICAO ';


  Result := GetDataPacket( sSql );
end;


procedure TCtrlOutroDado.SetCdsOutroDadoXUnidaut(
  const Value: TCMClientDataSet);
begin
  FCdsOutroDadoXUnidaut := Value;
end;

procedure TCtrlOutroDado.SetdbOutroDadoXUnidaut(
  const Value: TDbOutrodadoXUnidaut);
begin
  FdbOutroDadoXUnidaut := Value;
end;

procedure TCtrlOutroDado.SetdbOutroDadoXProp(
  const Value: TDbOutrodadoXProp);
begin
  FdbOutroDadoXProp := Value;
end;

procedure TCtrlOutroDado.SetCdsOutroDadoXProp(
  const Value: TCMClientDataSet);
begin
  FCdsOutroDadoXProp := Value;
end;

// Daniel - 23516 - Início -----------------------------------------------------
function TCtrlOutroDado.LookupOutroDadoXTipoImo(const iIdOutroDado:Integer; const sCodTipImovel:string): OleVariant;
begin
  Result := GetDataPacket('SELECT O.IDOUTRODADO, T.CODTIPIMOVEL, T.DESCTIPOIMOVEL '    +
                          '  FROM OUTRODADOXTIPOIMO O, TIPOIMOVEL T ' +
                          ' WHERE O.CODTIPIMOVEL = T.CODTIPIMOVEL ' +
                          '   AND O.IDOUTRODADO = '    + QuotedStr(IntToStr(iIdOutroDado)) +
                          'ORDER BY T.DESCTIPOIMOVEL ');
end;
// Daniel - 23516 - Fim --------------------------------------------------------


procedure TCtrlOutroDado.SetCdsOutroDado(const Value: TCMClientDataSet);
begin
  FCdsOutroDado := Value;
end;

procedure TCtrlOutroDado.SetdbOutroDado(const Value: TDbOutroDado);
begin
  FdbOutroDado := Value;
end;

procedure TCtrlOutroDado.SetCdsOutroDadoXTipoImo(
  const Value: TCMClientDataSet);
begin
  FCdsOutroDadoXTipoImo := Value;
end;

procedure TCtrlOutroDado.SetdbOutroDadoXTipoImo(
  const Value: TdbOutroDadoXTipoImo);
begin
  FdbOutroDadoXTipoImo := Value;
end;

procedure TCtrlOutroDado.SetCdsOutroDadoXImovel(
  const Value: TCMClientDataSet);
begin
  FCdsOutroDadoXImovel := Value;
end;

procedure TCtrlOutroDado.SetdbOutroDadoXImovel(
  const Value: TDbOutrodadoximovel);
begin
  FdbOutroDadoXImovel := Value;
end;

function TCtrlOutroDado.LookupDadosComplementares(const iIdImovel:Integer; const iIdContrato:Integer; FlgOrigem:String): OleVariant;
var
  sSql, sParam, sParam2 : String;
begin
  sSql    := '';
  sParam  := '';
  sParam2 := '';

  if (iIdImovel<>-1) then begin
    sParam  := sParam  + '  AND OI.IDIMOVEL = ' +QuotedStr(IntToStr(iIdImovel));
    sParam2 := sParam2 + '  AND IDIMOVEL = '    +QuotedStr(IntToStr(iIdImovel));
  end;

  if (iIdContrato<>-1) then begin
    sParam  := sParam  + '  AND OI.IDCONTRATOIMOVEL = ' +QuotedStr(IntToStr(iIdContrato));
    sParam2 := sParam2 + '  AND IDCONTRATOIMOVEL = '    +QuotedStr(IntToStr(iIdContrato));
  end;

  sSql := 'SELECT OD.CODCOMPL, OD.ODODESCRICAO, OI.ODIVALOR, OI.IDIMOVEL, OD.IDOUTRODADO, OD.ANASINT, '           +#13+
          '       OD.TIPODADO, OD.OPCOES, OI.IDOUTRODADOXIMOVEL, OI.IDCONTRATOIMOVEL '                            +#13+
          'FROM OUTRODADO OD, OUTRODADOXIMOVEL OI '                                                               +#13+
          'WHERE OD.IDOUTRODADO = OI.IDOUTRODADO '                                                                +#13+
          '  AND OD.FLGORIGEM   = '+QuotedStr(FlgOrigem)                                                          +#13+
          sParam                                                                                                  +#13+

          'UNION '                                                                                                +#13+

          'SELECT OD.CODCOMPL, OD.ODODESCRICAO, ''            '' AS ODIVALOR, -1 AS IDIMOVEL, OD.IDOUTRODADO,   ' +#13+
          '       OD.ANASINT, OD.TIPODADO, OD.OPCOES, -1 AS IDOUTRODADOXIMOVEL, -1 AS IDCONTRATOIMOVEL '          +#13+
          'FROM OUTRODADO OD '                                                                                    +#13+
          'WHERE OD.FLGORIGEM = '+QuotedStr(FlgOrigem)+' '                                                        +#13+
          '  AND OD.IDOUTRODADO NOT IN ( SELECT OI.IDOUTRODADO '                                                  +#13+
          '                              FROM OUTRODADOXIMOVEL OI '                                               +#13+
          '                              WHERE OI.IDOUTRODADO = OD.IDOUTRODADO '                                  +#13+
          sParam+') ';

  Result := GetDataPacket(sSql);

end;

function TCtrlOutroDado.GravaOutroDadoIndicadores: Boolean;
var sMsg : string;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaOutroDado (CdsOutroDado.Data);

    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Grava tabela OUTRODADO...
      Result := ApplyCds(CdsOutroDado,dbOutroDado,[],[]);
      sMsg   := dbOutroDado.MessageInfo;
      if not Result then raise Exception.Create(sMsg);

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

end.
