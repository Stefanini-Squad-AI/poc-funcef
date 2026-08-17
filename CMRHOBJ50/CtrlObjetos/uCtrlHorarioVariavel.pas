{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio Frioli                  }
{ Criado Em: 26/07/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlHorarioVariavel;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMClientDataSet,
  uCtrlCustomRH, uDbHorarioVariavel;

type
  TCtrlHorarioVariavel = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;    
  private
    FDbHorarioVariavel: TDbHorarioVariavel;
    FCdsHorarioVariavel: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListHorarioVariavel(IdPessoa: double = 0; DataInicial: string = '';
      DataFinal: string = ''): OleVariant;
      
    function ExistePeriodoSobreposto: boolean;

    function GravarHorarioVariavel: boolean;

    property CdsHorarioVariavel: TCMClientDataSet read FCdsHorarioVariavel write FCdsHorarioVariavel;
  end;

implementation

uses Db, Controls, uCMTypes, uCtrlFuncoesRH;

{ TCtrlHorarioVariavel }

constructor TCtrlHorarioVariavel.Create;
begin
  inherited;
  FDbHorarioVariavel := TDbHorarioVariavel.Create(Self);
end;

destructor TCtrlHorarioVariavel.Destroy;
begin
  FDbHorarioVariavel.Free;
  if (IsAppServer) then
    FCdsHorarioVariavel.Free;
  inherited;
end;

procedure TCtrlHorarioVariavel.OnCreateAppServer;
begin
  inherited;
  FCdsHorarioVariavel := TCMClientDataSet.Create(nil);
end;

procedure TCtrlHorarioVariavel.DoChangeDataBase;
begin
  inherited;
  FDbHorarioVariavel.DatabaseName := DataBaseName;
end;

function TCtrlHorarioVariavel.ListHorarioVariavel(IdPessoa: double;
  DataInicial, DataFinal: string): OleVariant;
var
  sSQL: string;
begin
  sSQL := '';
  if (IdPessoa > 0) then
    sSQL := 'WHERE' +CR_LF+ '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

  if (DataInicial <> '') then
  begin
    if (IdPessoa > 0) then
      sSQL := sSQL +' AND'
    else
      sSQL := sSQL +'WHERE';

    sSQL := sSQL +CR_LF+ '  (DATAINI <= TO_DATE(' +QuotedStr(DataFinal)+ ',''DD/MM/YYYY''))';
  end;

  if (DataFinal <> '') then
  begin
    if (IdPessoa > 0) or (DataInicial <> '') then
      sSQL := sSQL +' AND'
    else
      sSQL := sSQL +'WHERE';

    sSQL := sSQL +CR_LF+ '  (DATAFIM >= TO_DATE(' +QuotedStr(DataInicial)+ ',''DD/MM/YYYY''))';
  end;

  if (IdPessoa > 0) or (DataInicial <> '')  or (DataFinal <> '')  then
    sSQL := sSQL +CR_LF+ 'AND (H.IDHORARIO = HT.IDHORARIO)' +CR_LF;

  if (IdPessoa <= 0) and (DataInicial = '')  and (DataFinal = '')  then
    sSQL := 'WHERE (H.IDHORARIO = HT.IDHORARIO)' +CR_LF;

  sSQL := sSQL + 'ORDER BY' +CR_LF+ '  H.IDPESSOA, H.DATAINI';

  Result := GetDataPacket(
    'SELECT' + IFF(IdPessoa=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  H.*, HT.NOMEHORARIO AS HORARIO'+CR_LF+
    'FROM'+CR_LF+
    '  HORARIOVARIAVEL H, HORATRAB HT'+CR_LF+
    sSQL);
end;

function TCtrlHorarioVariavel.ExistePeriodoSobreposto: boolean;
var
  c: integer;
  dIdHorarioVariavel: double;
  Operacao: TDataSetState;
  dtDataInicial, dtDataFinal: TDate;
  ArrCampos: array of variant;
begin
  Result := false;
  if not(FCdsHorarioVariavel.IsEmpty) then
  begin
    FCdsHorarioVariavel.DisableControls;

    // Guardar o valor de cada campo
    Operacao := FCdsHorarioVariavel.State;
    dIdHorarioVariavel := FCdsHorarioVariavel.FieldByName('IDHORARIOVARIAVEL').asFloat;
    dtDataInicial := FCdsHorarioVariavel.FieldByName('DATAINI').asDateTime;
    dtDataFinal := FCdsHorarioVariavel.FieldByName('DATAFIM').asDateTime;

    SetLength(ArrCampos, FCdsHorarioVariavel.FieldCount);
    for c:=0 to FCdsHorarioVariavel.FieldCount-1 do
      ArrCampos[c] := FCdsHorarioVariavel.Fields[c].Value;
    FCdsHorarioVariavel.Cancel;

    // Para o caso do registro ter sido inserido e logo em seguida alterado. Neste momento
    // ele não possui ID. Neste caso, informo que este registro tem ID = -1
    if (Operacao = dsEdit) and
       (FCdsHorarioVariavel.FieldByName('IDHORARIOVARIAVEL').IsNull) then
    begin
      FCdsHorarioVariavel.Edit;
      FCdsHorarioVariavel.FieldByName('IDHORARIOVARIAVEL').asFloat := -1;
      FCdsHorarioVariavel.Post;
      dIdHorarioVariavel := -1;
    end;

    // Verificar se existe algum horário variável sobreposto
    FCdsHorarioVariavel.First;
    while not(FCdsHorarioVariavel.EOF) do
    begin
      if (((dtDataInicial    >= FCdsHorarioVariavel.FieldByName('DATAINI').asDateTime) and
           (dtDataInicial    <= FCdsHorarioVariavel.FieldByName('DATAFIM').asDateTime)) or
          ((dtDataFinal      >= FCdsHorarioVariavel.FieldByName('DATAINI').asDateTime) and
           (dtDataFinal      <= FCdsHorarioVariavel.FieldByName('DATAFIM').asDateTime)) or
          ((dtDataInicial    <= FCdsHorarioVariavel.FieldByName('DATAINI').asDateTime) and
           (dtDataFinal      >= FCdsHorarioVariavel.FieldByName('DATAFIM').asDateTime))) and
         (dIdHorarioVariavel <> FCdsHorarioVariavel.FieldByName('IDHORARIOVARIAVEL').asFloat) then
      begin
        Result := true;
        break;
      end;
      FCdsHorarioVariavel.Next;
    end;

    // Retornar o estado anterior do registro
    if (Operacao = dsInsert) then
      FCdsHorarioVariavel.Append
    else
    begin
      FCdsHorarioVariavel.Locate('IDHORARIOVARIAVEL', dIdHorarioVariavel, []);
      FCdsHorarioVariavel.Edit;

      if (dIdHorarioVariavel = -1) then
        FCdsHorarioVariavel.FieldByName('IDHORARIOVARIAVEL').Clear;
    end;

    // Retornar o valor dos campos anteriormente editados
    for c:=0 to FCdsHorarioVariavel.FieldCount-1 do
      FCdsHorarioVariavel.Fields[c].Value := ArrCampos[c];

    FCdsHorarioVariavel.EnableControls;
  end;
end;

function TCtrlHorarioVariavel.GravarHorarioVariavel: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarHorarioVariavel(FCdsHorarioVariavel.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
              
      Result := ApplyCds(FCdsHorarioVariavel, FDbHorarioVariavel, [], []);
      if not(Result) then
        raise Exception.Create(FDbHorarioVariavel.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
