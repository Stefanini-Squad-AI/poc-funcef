{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlEquipamentoECF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbEquipamentoECF, uSistema, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlEquipamentoECF = Class(TCmControlObject)

    private
    FDbEquipamentoECF: TDbEquipamentoECF;
    FCdsEquipamentoECF: TClientDataSet;
    procedure SetDbEquipamentoECF(const Value: TDbEquipamentoECF);
    procedure SetCdsEquipamentoECF(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsEquipamentoECF: TClientDataSet read FCdsEquipamentoECF write SetCdsEquipamentoECF;
      property DbEquipamentoECF: TDbEquipamentoECF read FDbEquipamentoECF write SetDbEquipamentoECF;

      function InserirEquipamentoECF: Boolean;
      function AlterarEquipamentoECF: Boolean;
      function ExcluirEquipamentoECF: Boolean;

      {lista todos os equipamentos ECF}
      function ListEquipamentoECF : Olevariant;
      {Lista o equipamento ECF especificado}
      function ProcurarEquipamentoECF(IdMaquinaECF : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlEquipamentoECF }

function TCtrlEquipamentoECF.AlterarEquipamentoECF: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlterarEquipamentoECF(CdsEquipamentoECF.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsEquipamentoECF,DbEquipamentoECF);
        StartTransaction;

        Result := ApplyCds(FCdsEquipamentoECF,DbEquipamentoECF,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbEquipamentoECF.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

constructor TCtrlEquipamentoECF.Create;
begin
  inherited;
  FDbEquipamentoECF := TDbEquipamentoECF.Create(Self);
end;

destructor TCtrlEquipamentoECF.Destroy;
begin
  inherited;
  FDbEquipamentoECF.Free;
  if isAppServer then FCdsEquipamentoECF.Free;
end;

procedure TCtrlEquipamentoECF.DoChangeDataBase;
begin
  inherited;
  DbEquipamentoECF.DataBaseName := DataBaseName;
end;

function TCtrlEquipamentoECF.ExcluirEquipamentoECF: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ExcluirEquipamentoECF(CdsEquipamentoECF.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;

        Result := ApplyCds(FCdsEquipamentoECF,DbEquipamentoECF,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbEquipamentoECF.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

function TCtrlEquipamentoECF.InserirEquipamentoECF: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.InserirEquipamentoECF(CdsEquipamentoECF.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsEquipamentoECF,DbEquipamentoECF);
        StartTransaction;

        Result := ApplyCds(FCdsEquipamentoECF,DbEquipamentoECF,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbEquipamentoECF.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

function TCtrlEquipamentoECF.ListEquipamentoECF: Olevariant;
Var
  Ssql : string;
begin
  Ssql   := 'SELECT IDMAQUINAECF, DESCMAQUINA '+
            '  FROM MAQUINAECF '+
            ' ORDER BY DESCMAQUINA';
  Result := GetDataPacket(Ssql);
end;


procedure TCtrlEquipamentoECF.OnCreateAppServer;
begin
  inherited;
  FCdsEquipamentoECF := TClientDataSet.Create(nil);
end;

function TCtrlEquipamentoECF.ProcurarEquipamentoECF(
                              IdMaquinaECF: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM MAQUINAECF '+
          ' WHERE IDMAQUINAECF = '+ IdMaquinaECF;
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlEquipamentoECF.SetCdsEquipamentoECF(const Value: TClientDataSet);
begin
  FCdsEquipamentoECF := Value;
end;

procedure TCtrlEquipamentoECF.SetDbEquipamentoECF(const Value: TDbEquipamentoECF);
begin
  FDbEquipamentoECF := Value;
end;

end.
