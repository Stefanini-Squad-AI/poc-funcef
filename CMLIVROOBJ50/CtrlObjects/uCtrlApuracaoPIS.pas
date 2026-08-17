{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlApuracaoPIS;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbApuracaoPIS, uSistema, DB, uDataBase, DbClient, uCmTypes;

  Type
    TCtrlApuracaoPIS = Class(TCmControlObject)

    private
    FDbApuracaoPIS: TDbApuracaopis;
    FCdsApuracaoPIS: TClientDataSet;
    procedure SetDbApuracaoPIS(const Value: TDbApuracaoPIS);
    procedure SetCdsApuracaoPIS(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsApuracaoPIS: TClientDataSet read FCdsApuracaoPIS write SetCdsApuracaoPIS;
      property DbApuracaoPIS: TDbApuracaoPIS read FDbApuracaoPIS write SetDbApuracaoPIS;

      function GravarApuracaoPIS: Boolean;
      {Lista o ApuracaoPIS especificado}
      function ProcurarApuracaoPIS(IdApuracaoPIS : integer) : OleVariant;
      {Lista as notas importadas do vhl para o livro de pis}
      function ListLivroVhlPis(flagSerie, DataRef: string): OleVariant;

    protected

    End;

implementation

{ TCtrlApuracaoPIS }

constructor TCtrlApuracaoPIS.Create;
begin
  inherited;
  FDbApuracaoPIS := TDbApuracaoPIS.Create(Self);
end;

destructor TCtrlApuracaoPIS.Destroy;
begin
  inherited;
  FDbApuracaoPIS.Free;
  if isAppServer then FCdsApuracaoPIS.Free;
end;

procedure TCtrlApuracaoPIS.DoChangeDataBase;
begin
  inherited;
  DbApuracaoPIS.DataBaseName := DataBaseName;
end;

function TCtrlApuracaoPIS.GravarApuracaoPIS: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarApuracaoPIS(CdsApuracaoPIS.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsApuracaoPIS,DbApuracaoPIS);
        StartTransaction;

        Result := ApplyCds(FCdsApuracaoPIS,FDbApuracaoPIS,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbApuracaoPIS.MessageInfo;
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


function TCtrlApuracaoPIS.ListLivroVhlPis(flagSerie,
                                          DataRef: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDAPURACAOPIS, NUMNOTA, NUMNOTAFINAL, OBSERVACAO ' +
          '  FROM APURACAOPIS ' +
          ' WHERE (DATAEMISSAONF = TO_DATE('+quotedStr(DataRef)+',''DD/MM/YYYY'')) ' +
          '   AND (FLGENTRADASAIDA = ''S'') ';

 if Trim(FLAGSERIE) = '' then
    Ssql := Ssql + ' AND (COMPLEMENTO IS NULL) '
 else
    Ssql := Ssql + ' AND (COMPLEMENTO = '''+flagSerie+''') ';
 Result := GetDataPacket(Ssql);
end;

procedure TCtrlApuracaoPIS.OnCreateAppServer;
begin
  inherited;
  FCdsApuracaoPIS := TClientDataSet.Create(nil);
end;

function TCtrlApuracaoPIS.ProcurarApuracaoPIS(IdApuracaoPIS: integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * ' +
          '  FROM APURACAOPIS ' +
          ' WHERE IDAPURACAOPIS = '+intTostr(IdApuracaoPIS);
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlApuracaoPIS.SetCdsApuracaoPIS(const Value: TClientDataSet);
begin
  FCdsApuracaoPIS := Value;
end;

procedure TCtrlApuracaoPIS.SetDbApuracaoPIS(const Value: TDbApuracaoPIS);
begin
  FDbApuracaoPIS := Value;
end;

end.
