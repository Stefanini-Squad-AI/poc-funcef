{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlClasfisc;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbClasfisc, DB, uDataBase, DbClient,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlClasfisc = Class(TCmControlObject)

    private
    FDbClasfisc: TDbClasfisc;
    FCdsClasfisc: TClientDataSet;
    procedure SetDbClasfisc(const Value: TDbClasfisc);
    procedure SetCdsClasfisc(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsClasfisc: TClientDataSet read FCdsClasfisc write SetCdsClasfisc;
      property DbClasfisc: TDbClasfisc read FDbClasfisc write SetDbClasfisc;

      function InserirClasfisc: Boolean;
      function AlterarClasfisc: Boolean;
      function ExcluirClasfisc: Boolean;

      {Lista todos os códigos fiscais}
      function ListCodigosFiscais : OleVariant;
      {Pega a classe fiscal especificada}
      function ProcurarClasFisc(CodFiscal : string) : OleVariant;
      {Lista os codigos fiscais agrupados}
      function ListClasFiscAgrupado : OleVariant;

    End;

implementation

{ TCtrlClasfisc }

function TCtrlClasfisc.AlterarClasfisc: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlterarClasfisc(CdsClasfisc.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsClasfisc,DbClasfisc);
        StartTransaction;
        Result := ApplyCds(FCdsClasfisc,FDbClasfisc,[],[], true);

        If Not Result Then
        Begin
          MessageInfo := DbClasfisc.MessageInfo;
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

constructor TCtrlClasfisc.Create;
begin
  inherited;
  FDbClasfisc := TDbClasfisc.Create(Self);
end;

destructor TCtrlClasfisc.Destroy;
begin
  inherited;
  FDbClasfisc.Free;
  if isAppServer then FCdsClasfisc.Free;
end;

procedure TCtrlClasfisc.DoChangeDataBase;
begin
  inherited;
  DbClasfisc.DataBaseName := DataBaseName;
end;

function TCtrlClasfisc.ExcluirClasfisc: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ExcluirClasfisc(CdsClasfisc.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsClasfisc,DbClasfisc);
        StartTransaction;
        Result := ApplyCds(FCdsClasfisc,FDbClasfisc,[],[], true);

        If Not Result Then
        Begin
          MessageInfo := DbClasfisc.MessageInfo;
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

function TCtrlClasfisc.InserirClasfisc: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.InserirClasfisc(CdsClasfisc.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsClasfisc,DbClasfisc);
        StartTransaction;

        Result := ApplyCds(FCdsClasfisc,FDbClasfisc,[],[], true );
        If Not Result Then
        Begin
          MessageInfo := DbClasfisc.MessageInfo;
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

function TCtrlClasfisc.ListClasFiscAgrupado: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODFISCAL, DESCCLASSIFISCAL, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM CLASFISC '+
          ' GROUP BY CODFISCAL, DESCCLASSIFISCAL, ROWNUM ';
  Result := GetDataPacket(Ssql);        
end;

function TCtrlClasfisc.ListCodigosFiscais: OleVariant;
Var
  Ssql : String;
begin
  Ssql := 'SELECT CODFISCAL, DESCCLASSIFISCAL '+
          '  FROM CLASFISC '+
          ' ORDER BY CODFISCAL';
  Result := GetDataPacket(Ssql);

end;

procedure TCtrlClasfisc.OnCreateAppServer;
begin
  inherited;
  FCdsClasfisc := TClientDataSet.Create(nil);
end;

function TCtrlClasfisc.ProcurarClasFisc(CodFiscal: string): OleVariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT * ' +
          '  FROM CLASFISC ' +
          ' WHERE CODFISCAL = '+quotedStr(CodFiscal);
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlClasfisc.SetCdsClasfisc(const Value: TClientDataSet);
begin
  FCdsClasfisc := Value;
end;

procedure TCtrlClasfisc.SetDbClasfisc(const Value: TDbClasfisc);
begin
  FDbClasfisc := Value;
end;

end.
