{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 22/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlTipoagrexImpostos;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipoagre, uDbAltximposto, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlTipoagrexImpostos = Class(TCmControlObject)

    private
    FDbTipoagre: TDbTipoagre;
    FDbAltximposto : TDbAltximposto;

    FCdsAltxImpostos: TClientDataSet;
    FCdsTipoagre: TClientDataSet;


    procedure SetDbTipoagre(const Value: TDbTipoagre);
    procedure SetCdsTipoagre(const Value: TClientDataSet);

    procedure SetDbAltximposto(const Value: TDbAltximposto);
    procedure SetCdsAltximposto(const Value: TClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
    public
      CdsAux : TClientDataSet;
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsTipoagre: TClientDataSet       read FCdsTipoagre      write SetCdsTipoagre;
      property CdsAltxImpostos: TClientDataSet   read FCdsAltxImpostos  write SetCdsAltximposto;
      property DbTipoagre: TDbTipoagre           read FDbTipoagre       write SetDbTipoagre;
      property DbAltximposto: TDbAltximposto     read FDbAltximposto    write setDbAltximposto;

      {Pega o próximo código disponível para ALTXIMPOSTO
      }
      function PegaIdAltXImposto : longint;
      {Aplica as alteraçòes pendentes no ClientDataSet
      }
      function AplicaAlteracoesTipoAgre : Boolean;
      {Lista a quantidade de alteradores possíveis
      }
      function ListAlteradoresPossiveis : OleVariant;
      {Lista os alteradores selecionados
      }
      function ListAlteradoresSelecionados(CodImposto : LongInt) : OleVariant;


    protected

    End;

implementation

{ TCtrlTipoagrexImpostos }


function TCtrlTipoagrexImpostos.AplicaAlteracoesTipoAgre : Boolean;
begin
  Result := true;
  try
    If ConnectionSide = cnsClient Then
      Begin
        Connection.AppServer.AplicaAlteracoesTipoAgre(CdsAltxImpostos.data);
        MessageInfo := Connection.AppServer.MessageInfo;
      end
    else
      Begin
        StartTransaction;
        ApplyCds(CdsAltxImpostos, DbAltximposto, [], []);
        Commit;
      end;
  except
    On E:Exception Do
      Begin
         Rollback;
         Result := False;
         MessageInfo := E.Message;
      End;
  end;


end;

constructor TCtrlTipoagrexImpostos.Create;
begin
  inherited;
  FDbTipoagre       := TDbTipoagre.Create(Self);
  FDbAltximposto    := TDbAltximposto.create(Self);
  
end;

destructor TCtrlTipoagrexImpostos.Destroy;
begin
  FDbTipoagre.Free;
  FDbAltximposto.Free;
  if isAppServer then
    Begin
      FCdsTipoagre.Free;
      CdsAux.free;
      CdsAltxImpostos.free;
    end;
  inherited;
end;

procedure TCtrlTipoagrexImpostos.DoChangeDataBase;
begin
  inherited;
  DbTipoagre.DataBaseName      := DataBaseName;
  DbAltximposto.DataBaseName   := DataBaseName;
end;



function TCtrlTipoagrexImpostos.ListAlteradoresPossiveis : OleVariant;
Var
  Sql : string;
begin
  sql := 'SELECT CODTIPOCUSTAGREG, DESCCUSTAGREG '+
         '  FROM TIPOAGRE '+
         ' WHERE (CODTIPOCUSTAGREG NOT IN (SELECT CODTIPOCUSTAGREG '+
         '                                   FROM ALTXIMPOSTO WHERE (CODTIPOCUSTAGREG IS NOT NULL))) '+
         ' ORDER BY DESCCUSTAGREG';
  Result := GetDataPacket(sql);

end;

function TCtrlTipoagrexImpostos.ListAlteradoresSelecionados(CodImposto : LongInt) : OleVariant;
Var
  sql : string;
begin
  sql := 'SELECT I.IDALTXIMPOSTO, I.CODIMPOSTO, I.CODTIPOCUSTAGREG, '+
         '       T.DESCCUSTAGREG '+
         '  FROM ALTXIMPOSTO I, TIPOAGRE T '+
         ' WHERE (I.CODIMPOSTO    = '+intTostr(CodImposto)+') '+
         '   AND (T.CODTIPOCUSTAGREG  = I.CODTIPOCUSTAGREG)';
  Result := GetDataPacket(sql);

end;

procedure TCtrlTipoagrexImpostos.OnCreateAppServer;
begin
  inherited;
  FCdsTipoagre      := TClientDataSet.Create(nil);
  CdsAux            := TClientDataSet.Create(nil);
  CdsAltxImpostos   := TClientDataSet.Create(nil);
end;

function TCtrlTipoagrexImpostos.PegaIdAltXImposto: longint;
begin
  If ConnectionSide = cnsClient Then
      Begin
        Connection.AppServer.PegaidAltxImposto;
        MessageInfo := Connection.AppServer.MessageInfo;
      end
  else
      Result := GetSequence('ALTXIMPOSTO');
end;

procedure TCtrlTipoagrexImpostos.SetCdsAltximposto(
  const Value: TClientDataSet);
begin
  FCdsAltxImpostos := Value;
end;

procedure TCtrlTipoagrexImpostos.SetCdsTipoagre(
                                        const Value: TClientDataSet);
begin
  FCdsTipoagre := Value;
end;


procedure TCtrlTipoagrexImpostos.SetDbAltximposto(
        const Value: TDbAltximposto);
begin
  FDbAltximposto := Value;
end;

procedure TCtrlTipoagrexImpostos.SetDbTipoagre(
  const Value: TDbTipoagre);
begin
  FDbTipoagre := Value;
end;

end.
