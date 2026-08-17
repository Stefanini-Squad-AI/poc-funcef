{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 28/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAssociaHorario;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH,
  uDbTurnoSem;

type
  TCtrlAssociaHorario = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTurnoSem;
    FCds: TCMClientDataSet;

    function Gravar: boolean;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function AssociarTurnoSemanal(DiaSemanaIni, DiaSemanaFin: byte; IdHorario,
      IdTurnoDiario: integer; InicioExpediente, FinalExpediente, InicioAlmoco,
      FinalAlmoco: string): boolean;
    function DesassociarTurnoSemanal: boolean;

    function ListTurnoDiaSel(IdHorario: integer): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlAssociaHorario }

constructor TCtrlAssociaHorario.Create;
begin
  inherited;
  FDb := TDbTurnoSem.Create(Self);
end;

destructor TCtrlAssociaHorario.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlAssociaHorario.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAssociaHorario.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlAssociaHorario.ListTurnoDiaSel(IdHorario: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TS.IDHORARIO, TS.IDTURNODIARIO, TS.IDDIASEMANA,'+CR_LF+
    '  DECODE(TS.IDDIASEMANA, 1,''  Domingo'', 2,''  Segunda'', 3,''  Terça'','+CR_LF+
    '    4,''  Quarta'', 5,''  Quinta'', 6,''  Sexta'', 7,''  Sábado'') AS DIASEMANA,'+CR_LF+
    '  TD.INICIOEXPEDIENTE, TD.INICIOALMOCO, TD.FINALALMOCO, TD.FINALEXPEDIENTE'+CR_LF+
    'FROM'+CR_LF+
    '  TURNODIA TD, TURNOSEM TS'+CR_LF+
    'WHERE'+CR_LF+
    '  (TS.IDHORARIO     = '+IntToStr(IdHorario)+') AND'+CR_LF+
    '  (TS.IDTURNODIARIO = TD.IDTURNODIARIO)');
end;

function TCtrlAssociaHorario.AssociarTurnoSemanal(DiaSemanaIni, DiaSemanaFin: byte;
  IdHorario, IdTurnoDiario: integer; InicioExpediente, FinalExpediente, InicioAlmoco,
  FinalAlmoco: string): boolean;
var
  c: byte;
  sDiaSemana: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AssociarTurnoSemanal(FCds.Data, DiaSemanaIni, DiaSemanaFin,
      IdHorario, IdTurnoDiario, InicioExpediente, FinalExpediente, InicioAlmoco, FinalAlmoco);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    try
      for c:=DiaSemanaIni to DiaSemanaFin do
      begin
        case (c) of
          1 : sDiaSemana := 'Domingo';
          2 : sDiaSemana := 'Segunda';
          3 : sDiaSemana := 'Terça';
          4 : sDiaSemana := 'Quarta';
          5 : sDiaSemana := 'Quinta';
          6 : sDiaSemana := 'Sexta';
          7 : sDiaSemana := 'Sábado';
        end;

        if (FCds.Locate('IDDIASEMANA', c, [])) then
        begin
          FCds.CancelUpdates;
          MessageInfo := 'O Dia da Semana "'+sDiaSemana+'" já está selecionado para este horário.';
          exit;
        end
        else
        begin
          FCds.Insert;
          FCds.FieldByName('IDHORARIO').asInteger := IdHorario;
          FCds.FieldByName('IDDIASEMANA').asInteger := c;
          FCds.FieldByName('IDTURNODIARIO').asInteger := IdTurnoDiario;
          FCds.FieldByName('INICIOEXPEDIENTE').asString := InicioExpediente;
          FCds.FieldByName('INICIOALMOCO').asString := FinalExpediente;
          FCds.FieldByName('FINALALMOCO').asString := InicioAlmoco;
          FCds.FieldByName('FINALEXPEDIENTE').asString := FinalAlmoco;
          FCds.FieldByName('DIASEMANA').asString := '  '+sDiaSemana;
          FCds.Post;
        end;
      end;

      Result := Gravar;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  end;
end;

function TCtrlAssociaHorario.DesassociarTurnoSemanal: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.DesassociarTurnoSemanal(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    if (FCds.IsEmpty) then
    begin
      MessageInfo := 'Não há turnos associados.';
      Result := false;
    end
    else
    begin
      try
        FCds.Delete;
        Result := Gravar;
      except
        on E: Exception do
        begin
          MessageInfo := E.Message;
          Result := false;
        end;
      end;
    end;
  end;
end;

function TCtrlAssociaHorario.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDb.MessageInfo);
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
