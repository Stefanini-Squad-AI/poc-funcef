{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlModeloNF;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbModeloNF, uSistema, DB, uDataBase,
     DbClient, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


  Type
    TCtrlModeloNF = Class(TCmControlObject)

    private
    FDbModeloNF: TDbModeloNF;
    FCdsModeloNF: TClientDataSet;

    procedure SetDbModeloNF(const Value: TDbModeloNF);
    procedure SetCdsModeloNF(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsModeloNF: TClientDataSet read FCdsModeloNF write SetCdsModeloNF;
      property DbModeloNF: TDbModeloNF read FDbModeloNF write SetDbModeloNF;

      function InserirModeloNF: Boolean;
      function AlterarModeloNF: Boolean;
      function ExcluirModeloNF: Boolean;

      {Lista todos os modelos de nota disponíveis}
      function ListModelosdeNota : OleVariant;
      {Lista os modelos de nota para o código do sistegra especificado}
      function ListModeloNF(TipoReg: string; Conteudo : string): OleVariant;
      {Procura o modelo de nota especificado}
      function ProcurarModeloNF(CodModelo : string) : Olevariant;


    protected

    End;

implementation

{ TCtrlModeloNF }

function TCtrlModeloNF.AlterarModeloNF: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlterarModeloNF(CdsModeloNF.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsModeloNF,DbModeloNF);
        StartTransaction;
        Result := ApplyCds(FCdsModeloNF,DbModeloNF,[],[] );

        If Not Result Then
        Begin
          MessageInfo := DbModeloNF.MessageInfo;
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

constructor TCtrlModeloNF.Create;
begin
  inherited;
  FDbModeloNF := TDbModeloNF.Create(Self);
end;

destructor TCtrlModeloNF.Destroy;
begin
  inherited;
  FDbModeloNF.Free;
  if isAppServer then FCdsModeloNF.Free;
end;

procedure TCtrlModeloNF.DoChangeDataBase;
begin
  inherited;
  DbModeloNF.DataBaseName := DataBaseName;
end;

function TCtrlModeloNF.ExcluirModeloNF: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ExcluirModeloNF(CdsModeloNF.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;

        Result := ApplyCds(FCdsModeloNF,DbModeloNF,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbModeloNF.MessageInfo;
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

function TCtrlModeloNF.ListModeloNF(TipoReg, Conteudo: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODMODELO, DESCMODELONF, SIGLA, NUMSINTEGRA '+
          '  FROM MODELONF '+
          ' WHERE NUMSINTEGRA = '+ quotedStr(TipoReg)+' '+
          '   AND CODMODELO = '+quotedStr(Conteudo)+ ' ';
  Result := GetDataPacket(Ssql);

end;

function TCtrlModeloNF.InserirModeloNF: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.InserirModeloNF(CdsModeloNF.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsModeloNF,DbModeloNF);
        StartTransaction;
        Result := ApplyCds(FCdsModeloNF,DbModeloNF,[],[] );

        If Not Result Then
        Begin
          MessageInfo := DbModeloNF.MessageInfo;
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

function TCtrlModeloNF.ListModelosdeNota: OleVariant;
var
  sSql : string;
begin
  sSql := 'SELECT CODMODELO, DESCMODELONF '+
          '  FROM MODELONF '+
          ' ORDER BY DESCMODELONF';
  Result := GetDataPacket(ssql);

end;

procedure TCtrlModeloNF.SetCdsModeloNF(const Value: TClientDataSet);
begin
  FCdsModeloNF := Value;
end;

procedure TCtrlModeloNF.SetDbModeloNF(const Value: TDbModeloNF);
begin
  FDbModeloNF := Value;
end;

function TCtrlModeloNF.ProcurarModeloNF(CodModelo: string): Olevariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * ' +
          '  FROM MODELONF ' +
          ' WHERE CODMODELO = '+quotedStr(CodModelo);
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlModeloNF.OnCreateAppServer;
begin
  inherited;
  FCdsModeloNF := TClientDataSet.Create(nil);
end;

end.
