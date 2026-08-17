{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlRubricaxInforme;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbRubricaxInforme, DB, uDataBase, uSistema, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlRubricaxInforme = Class(TCmControlObject)

    private
    FDbRubricaxInforme: TDbRubricaxInforme;

    FCdsRubricaxInforme: TClientDataSet;

    procedure SetDbRubricaxInforme(const Value: TDbRubricaxInforme);
    procedure SetCdsRubricaxInforme(const Value: TClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsRubricaxInforme: TClientDataSet   read FCdsRubricaxInforme  write SetCdsRubricaxInforme;
      property DbRubricaxInforme: TDbRubricaxInforme read FDbRubricaxInforme   write setDbRubricaxInforme;

      {Grava Alterações das Naturezas de rendimento no Banco de Dados}
      Function GravarRubricaxInforme : Boolean;
      {Procura rubrica do informe}
      function ProcurarRubricaxInforme(IDRUBRICAPRIN, IDRUBRICA : integer) : OleVariant;
      {lista rubrica principal}
      function ListRubricaPrincipal : OleVariant;
      {lista as linhas para o informe}
      function ListLinhasParaInforme : OleVariant;

    protected

    End;

implementation

{ TCtrlRubricaxInforme }




constructor TCtrlRubricaxInforme.Create;
begin
  inherited;
  FDbRubricaxInforme   := TDbRubricaxInforme.create(self);
end;

destructor TCtrlRubricaxInforme.Destroy;
begin
  FDbRubricaxInforme.Free;
  if isAppServer then
    Begin
      FCdsRubricaxInforme.free;
    end;
  inherited;
end;

procedure TCtrlRubricaxInforme.DoChangeDataBase;
begin
  inherited;
  DbRubricaxInforme.DataBaseName   := DataBaseName;
end;




procedure TCtrlRubricaxInforme.SetCdsRubricaxInforme(
  const Value: TClientDataSet);
begin
  FCdsRubricaxInforme := Value;
end;

procedure TCtrlRubricaxInforme.SetDbRubricaxInforme(
        const Value: TDbRubricaxInforme);
begin
  FDbRubricaxInforme := Value;
end;

function TCtrlRubricaxInforme.GravarRubricaxInforme: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravaRubricaxInforme(FCdsRubricaxInforme.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Pai
           Result := ApplyCds(FCdsRubricaxInforme,FDbRubricaxInforme,[],[] );
           Msg    := FDbRubricaxInforme.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;


function TCtrlRubricaxInforme.ProcurarRubricaxInforme(IDRUBRICAPRIN, IDRUBRICA : integer) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM RUBRICAXINFORME '+
          ' WHERE IDRUBRICAPRIN = '+ IntToStr(IDRUBRICAPRIN) + ' '+
          '   AND IDRUBRICA = '+ intTostr(IDRUBRICA);
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlRubricaxInforme.OnCreateAppServer;
begin
  inherited;
  FcdsRubricaxInforme := TClientDataSet.Create(nil);
end;

function TCtrlRubricaxInforme.ListRubricaPrincipal: OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT IDPROVENTO, DESCRICAO '+
          '  FROM PROVDESC '+
          ' ORDER BY DESCRICAO ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlRubricaxInforme.ListLinhasParaInforme: OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT IDINFORME, NOMEINFORME, CODINFORME '+
          '  FROM INFORME '+
          ' ORDER BY NOMEINFORME';
  Result := GetDataPacket(Ssql);        
end;

end.

