{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlConfigRelatorio;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbCartaCobranca, DB, uDataBase, uSistema, DbClient;

  Type
    TCtrlConfigRelatorio = Class(TCmControlObject)

    private
    FDbCartaCobranca: TDCartaCobranca;

    //converter tudo para os dados do CartaCobranca

    FCdsCartaCobranca: TClientDataSet;

    procedure SetDbCartaCobranca(const Value: TDbCartaCobranca);
    procedure SetCdsCartaCobranca(const Value: TClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsCartaCobranca : TClientDataSet   read FCdsCartaCobranca  write SetCdsCartaCobranca;
      property DbCartaCobranca : TDbCartaCobranca read FDbCartaCobranca   write setDbCartaCobranca;

      {Grava Alterações das Naturezas de rendimento no Banco de Dados}
      Function GravarCartaCobranca : Boolean;

      function ProcurarCartaCobranca(CodNatureza : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlConfigRelatorio }




constructor TCtrlConfigRelatorio.Create;
begin
  inherited;
  FDbCartaCobranca   := TDbCartaCobranca.create;
end;

destructor TCtrlConfigRelatorio.Destroy;
begin
  FDbCartaCobranca.Free;
  if isAppServer then
    Begin
      FCdsCartaCobranca.free;
    end;
  inherited;
end;

procedure TCtrlConfigRelatorio.DoChangeDataBase;
begin
  inherited;
  DbCartaCobranca.DataBaseName   := DataBaseName;
end;




procedure TCtrlConfigRelatorio.SetCdsCartaCobranca(
  const Value: TClientDataSet);
begin
  FCdsCartaCobranca := Value;
end;

procedure TCtrlConfigRelatorio.SetDbCartaCobranca(
        const Value: TDbCartaCobranca);
begin
  FDbCartaCobranca := Value;
end;

function TCtrlConfigRelatorio.GravarCartaCobranca: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarCartaCobranca(FCdsCartaCobranca.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Pai
           Result := ApplyCds(FCdsCartaCobranca,FDbCartaCobranca,[],[] );
           Msg    := FDbCartaCobranca.MessageInfo;
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


function TCtrlConfigRelatorio.ProcurarCartaCobranca(CodNatureza : string) : OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM CartaCobranca '+
          ' WHERE CODNATUREZA = '+quotedStr(CodNatureza);
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlConfigRelatorio.OnCreateAppServer;
begin
  inherited;
  FcdsCartaCobranca := TClientDataSet.Create(nil);
end;

end.
























unit uCtrlConfigRelatorio;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;
  Type
    TCtrlConfigRelatorio = Class(TCmControlObject)

    private
    function ListConfigRelatorio: OleVariant;
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      {Lista a configuração do Report}
      function ListReportConfig(IdReport, OrigemCM : LongInt) : OleVariant;
      {Pega o id para o report}
      function PegaIDReport : Integer;
      {Grava Alterações da Carta Cobrança no Banco de Dados}
      Function GravarCartaCobranca : Boolean;

    protected

    End;


implementation

{ TCtrlConfigRelatorio }


constructor TCtrlConfigRelatorio.Create;
begin
  inherited;

end;

destructor TCtrlConfigRelatorio.Destroy;
begin
  inherited;

end;

procedure TCtrlConfigRelatorio.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlConfigRelatorio.GravarCartaCobranca: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarCartaCobranca(FCdsCartaCobranca.data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Pai
           Result := ApplyCds(FCdsCartaCobranca,FDbCartaCobranca,[],[] );
           Msg    := FDbCartaCobranca.MessageInfo;
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

function TCtrlConfigRelatorio.ListConfigRelatorio: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODNATUREZA, DESCNATUREZA, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM NATUREZAESTOQUE '+
          ' GROUP BY CODNATUREZA, DESCNATUREZA, ROWNUM';
  Result := GetDataPacket(Ssql);
end;

function TCtrlConfigRelatorio.ListReportConfig(IdReport, OrigemCM: Integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT REPORTS.NAME, REPORTS.IDREPORTS, REPORTS.ORIGEMCM, REPORTS.TEMPLATE '+
          '  FROM CM.REPORTS '+
          ' WHERE (REPORTS.IDREPORTS = '+intTostr(IdReport)+') '+
          '   AND (REPORTS.ORIGEMCM  = '+IntToStr(OrigemCM)+')';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlConfigRelatorio.OnCreateAppServer;
begin
  inherited;

end;

function TCtrlConfigRelatorio.PegaIDReport: Integer;
begin
  Result := GetSequence('REPORTS');
end;

end.
