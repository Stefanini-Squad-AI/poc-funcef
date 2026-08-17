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

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio,  uCMClientDataSet,
  uCtrlCustomRH, uDbTurnoSem;

type
  TCtrlAssociaHorario = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbTurnoSem;
    FCds: TCMClientDataSet;

    function GravarTurnoSemanal: boolean;
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

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEL_DIA = 'O Dia da Semana ":1" já está selecionado para este horário.';

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
    '  TO_CHAR(DECODE(TS.IDDIASEMANA, 1,' +QuotedStr(('  Domingo')) +CR_LF+
    '                               , 2,' +QuotedStr(('  Segunda')) +CR_LF+
    '                               , 3,' +QuotedStr(('  Terça')) +CR_LF+
    '                               , 4,' +QuotedStr(('  Quarta')) +CR_LF+
    '                               , 5,' +QuotedStr(('  Quinta')) +CR_LF+
    '                               , 6,' +QuotedStr(('  Sexta')) +CR_LF+
    '                               , 7,' +QuotedStr(('  Sábado'))+ ')) AS DIASEMANA,'+CR_LF+
    '  TD.INICIOEXPEDIENTE, TD.INICIOALMOCO, TD.FINALALMOCO, TD.FINALEXPEDIENTE'+CR_LF+
    'FROM'+CR_LF+
    '  TURNODIA TD, TURNOSEM TS'+CR_LF+
    'WHERE'+CR_LF+
    '  (TS.IDHORARIO     = '+IntToStr(IdHorario)+') AND'+CR_LF+
    '  (TS.IDTURNODIARIO = TD.IDTURNODIARIO)'+CR_LF+
    'ORDER BY IDDIASEMANA');
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
          1 : sDiaSemana := ('Domingo');
          2 : sDiaSemana := ('Segunda');
          3 : sDiaSemana := ('Terça');
          4 : sDiaSemana := ('Quarta');
          5 : sDiaSemana := ('Quinta');
          6 : sDiaSemana := ('Sexta');
          7 : sDiaSemana := ('Sábado');
        end;

        if (FCds.Locate('IDDIASEMANA', c, [])) then
        begin
          FCds.CancelUpdates;
          MessageInfo := CMTranslateMsg(MSG_SEL_DIA, [sDiaSemana]);
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

      Result := GravarTurnoSemanal;
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
    try
      Result := GravarTurnoSemanal;
    except
      on E: Exception do
      begin
        MessageInfo := E.Message;
        Result := false;
      end;
    end;
  end;
end;

function TCtrlAssociaHorario.GravarTurnoSemanal: boolean;
begin
  try
    StartTransaction;

    Result := ApplyCds(FCds, FDb, [], []);
    if not(Result) then
      raise Exception.Create(FDb.MessageInfo);  

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

end.
