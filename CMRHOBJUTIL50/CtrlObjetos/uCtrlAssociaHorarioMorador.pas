{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 28/06/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlAssociaHorarioMorador;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbTurnoSem;

type
  TCtrlAssociaHorarioMorador = class(TCtrlCustomRH)
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
      IdTurnoDiario: integer; InicioExpediente, FinalExpediente: string): boolean;

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

{ TCtrlAssociaHorarioMorador }

constructor TCtrlAssociaHorarioMorador.Create;
begin
  inherited;
  FDb := TDbTurnoSem.Create(Self);
end;

destructor TCtrlAssociaHorarioMorador.Destroy;
begin
  FDb.Free;
  if (IsAppServer) then
    FCds.Free;
  inherited;
end;

procedure TCtrlAssociaHorarioMorador.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlAssociaHorarioMorador.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlAssociaHorarioMorador.ListTurnoDiaSel(IdHorario: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  TS.IDHORARIO, TS.IDTURNODIARIO, TS.IDDIASEMANA,'+CR_LF+
    '  TO_CHAR(DECODE(TS.IDDIASEMANA, 1,' +QuotedStr(CMTranslate('  Domingo')) +CR_LF+
    '                               , 2,' +QuotedStr(CMTranslate('  Segunda')) +CR_LF+
    '                               , 3,' +QuotedStr(CMTranslate('  Terça')) +CR_LF+
    '                               , 4,' +QuotedStr(CMTranslate('  Quarta')) +CR_LF+
    '                               , 5,' +QuotedStr(CMTranslate('  Quinta')) +CR_LF+
    '                               , 6,' +QuotedStr(CMTranslate('  Sexta')) +CR_LF+
    '                               , 7,' +QuotedStr(CMTranslate('  Sábado'))+ ')) AS DIASEMANA,'+CR_LF+
    '  TD.INICIOEXPEDIENTE, TD.FINALEXPEDIENTE'+CR_LF+
    'FROM'+CR_LF+
    '  TURNODIA TD, TURNOSEM TS'+CR_LF+
    'WHERE'+CR_LF+
    '  (TS.IDHORARIO     = '+IntToStr(IdHorario)+') AND'+CR_LF+
    '  (TS.IDTURNODIARIO = TD.IDTURNODIARIO)'+CR_LF+
    'ORDER BY IDDIASEMANA');
end;

function TCtrlAssociaHorarioMorador.AssociarTurnoSemanal(DiaSemanaIni, DiaSemanaFin: byte;
  IdHorario, IdTurnoDiario: integer; InicioExpediente, FinalExpediente: string): boolean;
var
  c: byte;
  sDiaSemana: string;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.AssociarTurnoSemanal(FCds.Data, DiaSemanaIni, DiaSemanaFin,
      IdHorario, IdTurnoDiario, InicioExpediente, FinalExpediente);
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
          1 : sDiaSemana := CMTranslate('Domingo');
          2 : sDiaSemana := CMTranslate('Segunda');
          3 : sDiaSemana := CMTranslate('Terça');
          4 : sDiaSemana := CMTranslate('Quarta');
          5 : sDiaSemana := CMTranslate('Quinta');
          6 : sDiaSemana := CMTranslate('Sexta');
          7 : sDiaSemana := CMTranslate('Sábado');
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
          FCds.FieldByName('FINALEXPEDIENTE').asString := FinalExpediente;
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

function TCtrlAssociaHorarioMorador.DesassociarTurnoSemanal: boolean;
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

function TCtrlAssociaHorarioMorador.GravarTurnoSemanal: boolean;
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
