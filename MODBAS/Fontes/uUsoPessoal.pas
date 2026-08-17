unit uUsoPessoal;

interface

uses Classes, uFormManager, wwQuery, Forms, SysUtils, Dialogs;

type
  str2 = string[2];

  TUsoPessoal = class
  private
    FChavePessoa: LongInt;
    procedure SetChavePessoa(const Value: LongInt);

  public
    constructor Create;

    class function ExisteRh :Boolean;

    procedure Execute;

    function IFF_Int(Condicao:boolean; Primeiro,Segundo:integer): integer;
    function IFF_Float(Condicao:boolean; Primeiro,Segundo:double): double;
    function PoeZero (Num: byte): str2;

    property ChavePessoa: LongInt read FChavePessoa write SetChavePessoa;
  end;

var
  UsoPessoal :TUsoPessoal;

implementation

uses fIdentPessoal, fUsoPessoal, uMensErro, uSistema;

{ TUsoPessoal }

constructor TUsoPessoal.Create;
begin
  FChavePessoa := 0;
end;

class function TUsoPessoal.ExisteRh: Boolean;
begin
  Result := false;
  with (TwwQuery.Create(Application)) do
  try
    DataBaseName := 'BaseDados';
    Sql.Text := 'SELECT FLGCTSALALT FROM PARAMRH';
    Open;
    Result := not(IsEmpty);
  finally
    Free;
  end;
end;

procedure TUsoPessoal.Execute;
var
  qryUsuPessoal: TwwQuery;
  GuardaFlgSenha: integer;
begin
  inherited;
  FChavePessoa := 0;

  qryUsuPessoal := TwwQuery.Create(Application);
  qryUsuPessoal.DataBaseName := 'Basedados';

  qryUsuPessoal.Close;
  qryUsuPessoal.SQL.Clear;
  qryUsuPessoal.SQL.Add('SELECT FLGSENHAUSOPES FROM PARAMRH');
  qryUsuPessoal.Open;
  GuardaFlgSenha := qryUsuPessoal.FieldByName('FLGSENHAUSOPES').asInteger;

  // Chamada da Identificação do Empregado
  if (qryUsuPessoal.IsEmpty) or (GuardaFlgSenha > 0) then
  begin
    qryUsuPessoal.Close;
    qryUsuPessoal.SQL.Clear;
    qryUsuPessoal.SQL.Add('SELECT IDPESSOA FROM FUNCIONARIO WHERE (IDPESSOA = ' +
      IntToStr(Sistema.idUsuario)+ ')');
    qryUsuPessoal.Open;

    FChavePessoa := qryUsuPessoal.FieldByName('IDPESSOA').asInteger;

    if (FChavePessoa = 0) then
      if (GuardaFlgSenha = 2) then
        AbrirFormModal(frmIdentPessoal, TfrmIdentPessoal)
      else
        MsgDlg('Usuário não é empregado. Acesso negado', 'Informação',mtInformation,[mbOk,mbHelp],0);
  end
  else
    AbrirFormModal(frmIdentPessoal, TfrmIdentPessoal);

  qryUsuPessoal.Close;
  qryUsuPessoal.Free;

  if (FChavePessoa > 0) then
    AbrirForm(frmUsoPessoal, TfrmUsoPessoal, false);
end;

function TUsoPessoal.IFF_Float(Condicao: boolean; Primeiro, Segundo: double): double;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TUsoPessoal.IFF_Int(Condicao: boolean; Primeiro, Segundo: integer): integer;
begin
  if (Condicao) then
    Result := Primeiro
  else
    Result := Segundo;
end;

function TUsoPessoal.PoeZero(Num: byte): str2;
var
  sAux: str2;
begin
  if (Num < 10) then
    sAux := '0' + IntToStr(Num)
  else
    sAux := IntToStr(Num);

  Result := sAux;
end;

procedure TUsoPessoal.SetChavePessoa(const Value: LongInt);
begin
  FChavePessoa := Value;
end;

end.
