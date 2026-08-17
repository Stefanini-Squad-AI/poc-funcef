{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlTipoAltxImpostos;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipoAlterador, uDbAltximposto, uSistema, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlTipoAltxImpostos = Class(TCmControlObject)

    private
    FDbTipoAlterador: TDbTipoAlterador;
    FDbAltximposto : TDbAltximposto;

    FCdsAltxImpostos: TClientDataSet;
    FCdsTipoAlterador: TClientDataSet;



    procedure SetDbTipoAlterador(const Value: TDbTipoAlterador);
    procedure SetCdsTipoAlterador(const Value: TClientDataSet);

    procedure SetDbAltximposto(const Value: TDbAltximposto);
    procedure SetCdsAltximposto(const Value: TClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public

      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsTipoAlterador: TClientDataSet  read FCdsTipoAlterador write SetCdsTipoAlterador;
      property CdsAltxImpostos: TClientDataSet   read FCdsAltxImpostos  write SetCdsAltximposto;
      property DbTipoAlterador: TDbTipoAlterador read FDbTipoAlterador  write SetDbTipoAlterador;
      property DbAltximposto: TDbAltximposto     read FDbAltximposto    write setDbAltximposto;

      {Pega o próximo código disponível para ALTXIMPOSTO
      }
      function PegaIdAltXImposto : longint;
      {Aplica as alteraçòes pendentes no ClientDataSet
      }
      function AplicaAlteracoesAlterador : Boolean;
      {Lista a quantidade de alteradores possíveis
      }
      function ListAlteradoresPossiveis(Idpessoa : LongInt) : OleVariant;
      {Lista os alteradores selecionados
      }
      function ListAlteradoresSelecionados(Idpessoa, CodImposto : LongInt) : OleVariant;
      {Lista o código do imposto do alterador
      }
      function ListAltxImposto(CodTipoCustAgreg : LongInt) : OleVariant;


    protected

    End;

implementation

{ TCtrlTipoAltxImpostos }


function TCtrlTipoAltxImpostos.AplicaAlteracoesAlterador : Boolean;
begin
   If ConnectionSide = cnsClient Then
      Begin
        Connection.AppServer.AplicaAlteracoesAlterador(CdsAltxImpostos.data);
        MessageInfo := Connection.AppServer.MessageInfo;
      end
    else
      Begin
        try
          Result := True;
          StartTransaction;
          ApplyCds(CdsAltxImpostos, DbAltximposto, [], []);
          Commit;
        except
          On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        end;
      end;
end;

constructor TCtrlTipoAltxImpostos.Create;
begin
  inherited;
  FDbTipoAlterador := TDbTipoAlterador.Create(self);
  FDbAltximposto   := TDbAltximposto.create(self);
end;

destructor TCtrlTipoAltxImpostos.Destroy;
begin
  inherited;
  FDbTipoAlterador.Free;
  FDbAltximposto.Free;
  if isAppServer then
    Begin
      FCdsTipoAlterador.Free;
      CdsAltxImpostos.free;
    end;  
end;

procedure TCtrlTipoAltxImpostos.DoChangeDataBase;
begin
  inherited;
  DbTipoAlterador.DataBaseName := DataBaseName;
  DbAltximposto.DataBaseName   := DataBaseName;
end;



function TCtrlTipoAltxImpostos.ListAlteradoresPossiveis(Idpessoa : LongInt) : OleVariant;
Var
  Sql : string;
begin
  sql := 'SELECT CODALTERADOR, DESCRICAO '+
         '  FROM TIPOALTERADOR '+
         ' WHERE (IDPESSOA      = '+intTostr(Idpessoa)+') '+
         '   AND (RECPAG        = ''P'') '+
         '   AND (CODALTERADOR NOT IN (SELECT CODALTERADOR '+
         '                               FROM ALTXIMPOSTO '+
         '                              WHERE CODALTERADOR IS NOT NULL)) '+
         ' ORDER BY DESCRICAO';
  Result := GetDataPacket(sql);
end;

function TCtrlTipoAltxImpostos.ListAlteradoresSelecionados(Idpessoa, CodImposto : LongInt) : OleVariant;
Var
  sql : string;
begin
  sql := 'SELECT I.IDALTXIMPOSTO, I.CODALTERADOR, I.CODIMPOSTO, T.DESCRICAO '+
         '  FROM ALTXIMPOSTO I, TIPOALTERADOR T '+
         ' WHERE (I.CODIMPOSTO    = '+intTostr(CodImposto)+') '+
         '   AND (T.IDPESSOA      = '+intTostr(Idpessoa)+') '+
         '   AND (T.RECPAG        = ''P'') '+
         '   AND (T.CODALTERADOR  = I.CODALTERADOR)';
  Result := GetDataPacket(sql);
end;

function TCtrlTipoAltxImpostos.ListAltxImposto(
                               CodTipoCustAgreg: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT A.CODIMPOSTO '+
          '  FROM ALTXIMPOSTO A, TIPOAGRE T '+
          ' WHERE (A.CODTIPOCUSTAGREG='+intTostr(CodTipoCustAgreg)+') '+
          '   AND (A.CODTIPOCUSTAGREG=T.CODTIPOCUSTAGREG) ';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlTipoAltxImpostos.OnCreateAppServer;
begin
  inherited;
  FCdsTipoAlterador := TClientDataSet.Create(nil);
  CdsAltxImpostos   := TClientDataSet.Create(nil);
end;

function TCtrlTipoAltxImpostos.PegaIdAltXImposto: longint;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.PegaIdAltxImposto;
  End
  Else
    Result := GetSequence('ALTXIMPOSTO');
end;

procedure TCtrlTipoAltxImpostos.SetCdsAltximposto(
  const Value: TClientDataSet);
begin
  FCdsAltxImpostos := Value;
end;

procedure TCtrlTipoAltxImpostos.SetCdsTipoAlterador(
                                        const Value: TClientDataSet);
begin
  FCdsTipoAlterador := Value;
end;


procedure TCtrlTipoAltxImpostos.SetDbAltximposto(
        const Value: TDbAltximposto);
begin
  FDbAltximposto := Value;
end;

procedure TCtrlTipoAltxImpostos.SetDbTipoAlterador(
  const Value: TDbTipoAlterador);
begin
  FDbTipoAlterador := Value;
end;


end.
