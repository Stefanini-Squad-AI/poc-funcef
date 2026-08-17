unit uCtrlUsoGeralRH;

interface

uses SysUtils, uCmDbObject, uCmControlObject, uCMClientDataSet;

type
  TCtrlUsoGeralRH = class(TCmControlObject)
  private
    FUsuarioRH: boolean;
    FUsuXFilial: string;
    FUsuXCCusto: string;
    FIdUsuarioGeral: string;
  public
    procedure GetParametros(UsuarioRH: boolean; IdEmpresa: integer; IdUsuarioGeral: double);

    property UsuarioRH: boolean read FUsuarioRH write FUsuarioRH;
    property UsuXFilial: string read FUsuXFilial write FUsuXFilial;
    property UsuXCCusto: string read FUsuXCCusto write FUsuXCCusto;
    property IdUsuarioGeral: string read FIdUsuarioGeral write FIdUsuarioGeral;
  end;

var
  CtrlUsoGeralRH: TCtrlUsoGeralRH;

implementation

uses uCtrlFuncoesRH;

procedure TCtrlUsoGeralRH.GetParametros(UsuarioRH: boolean; IdEmpresa: integer;
  IdUsuarioGeral: double);
begin
  FUsuXFilial := '';
  FUsuXCCusto := '';
  FIdUsuarioGeral := '';
  FUsuarioRH := UsuarioRH;

  if (FUsuarioRH) then
    exit;

  // Centros de Custo habilitados para o Usuário
  try
    _Cds.Data := GetDataPacket(
      'SELECT CODCENTROCUSTO' +CR_LF+
      'FROM   USCCUSTORH' +CR_LF+
      'WHERE  (IDUSUARIO = ' +FloatToStr(IdUsuarioGeral)+ ') AND' +CR_LF+
      '       (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ')');
  except
    _Cds.Data := GetDataPacket(
      'SELECT CODCENTROCUSTO' +CR_LF+
      'FROM   USCCUSTO' +CR_LF+
      'WHERE  (IDUSUARIO = ' +FloatToStr(IdUsuarioGeral)+ ') AND' +CR_LF+
      '       (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ')');
  end;

  if (_Cds.IsEmpty) then
    FUsuXCCusto := ''
  else
  begin
    while not(_Cds.EOF) do
    begin
      if (FUsuXCCusto <> '') then
        FUsuXCCusto := FUsuXCCusto +',';

      FUsuXCCusto := FUsuXCCusto + QuotedStr(_Cds.FieldByName('CODCENTROCUSTO').asString);
      _Cds.Next;
    end;
  end;

  if (FUsuXCCusto <> '') and (Pos(',',FUsuXCCusto) > 0) then
    FUsuXCCusto := '(' +FUsuXCCusto+ ')';

  // Estabelecimentos habilitados para o Usuário
  _Cds.Data := GetDataPacket(
    'SELECT IDFILIALPESSOA' +CR_LF+
    'FROM   USUARIOXFILIAL' +CR_LF+
    'WHERE (IDUSUARIO = ' +FloatToStr(IdUsuarioGeral)+ ')');

  if (_Cds.IsEmpty) then
    FUsuXFilial := ''
  else
  begin
    while not(_Cds.EOF) do
    begin
      if (FUsuXFilial <> '') then
        FUsuXFilial := FUsuXFilial + ',';

      FUsuXFilial := FUsuXFilial + _Cds.FieldByName('IDFILIALPESSOA').asString;
      _Cds.Next;
    end;
  end;

  if (FUsuXFilial <> '') and (Pos(',',FUsuXFilial) > 0) then
    FUsuXFilial := '(' +FUsuXFilial+ ')';

  // Caso nada estaja habilidado para o Usuário, informo que este só pode ver os seus dados
  if (FUsuXFilial = '') and (FUsuXCCusto = '') then
    FIdUsuarioGeral := FloatToStr(IdUsuarioGeral);
end;

end.
