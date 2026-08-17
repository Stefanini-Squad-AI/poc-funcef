{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbCentroCusto;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCentroCusto = class(TCmDbObject)

  private
    FCodcorresp: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FAtivo: TCmDbField;
    FFlgobrigacc: TCmDbField;
    FMascaracliente: TCmDbField;
    FResponsavel: TCmDbField;
    FStatusgrupocdc: TCmDbField;
    FCodreduzido: TCmDbField;
    FIdusuario: TCmDbField;
    FNome: TCmDbField;
    FIdempresa: TCmDbField;
    FIdprograma: TCmDbField;
    FIdUsuarioInclusao: TCmDbField;
    procedure SetAtivo(const Value: TCmDbField);
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcorresp(const Value: TCmDbField);
    procedure SetCodreduzido(const Value: TCmDbField);
    procedure SetFlgobrigacc(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetMascaracliente(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetResponsavel(const Value: TCmDbField);
    procedure SetStatusgrupocdc(const Value: TCmDbField);
    procedure SetIdUsuarioInclusao(const Value: TCmDbField);

  public
    Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
    Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
    Property Nome: TCmDbField read FNome write SetNome;
    Property Responsavel: TCmDbField read FResponsavel write SetResponsavel;
    Property Mascaracliente: TCmDbField read FMascaracliente write SetMascaracliente;
    Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
    Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
    Property Flgobrigacc: TCmDbField read FFlgobrigacc write SetFlgobrigacc;
    Property Codreduzido: TCmDbField read FCodreduzido write SetCodreduzido;
    Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;
    Property Ativo: TCmDbField read FAtivo write SetAtivo;
    Property Statusgrupocdc: TCmDbField read FStatusgrupocdc write SetStatusgrupocdc;
    Property IdUsuarioInclusao: TCmDbField read FIdUsuarioInclusao write SetIdUsuarioInclusao;

    Constructor Create; Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCentroCusto }

constructor TDbCentroCusto.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CentCust';

  fIdempresa         := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'Empresa');
  fCodcentrocusto    := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'Código');
  fNome              := CreateCmDbField('NOME',ftString,False,False,False,True,'Nome');
  fResponsavel       := CreateCmDbField('RESPONSAVEL',ftString,False,False,False,True,'Responsavel');
  fMascaracliente    := CreateCmDbField('MASCARACLIENTE',ftString,False,False,False,True,'Mascara Cliente');
  fIdusuario         := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'Usuario');
  fIdprograma        := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'Programa');
  fFlgobrigacc       := CreateCmDbField('FLGOBRIGACC',ftString,False,False,False,True,'Obriga CC');
  fCodreduzido       := CreateCmDbField('CODREDUZIDO',ftString,False,False,False,True,'Código Reduzido');
  fCodcorresp        := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'Código Correspondencia');
  fAtivo             := CreateCmDbField('ATIVO',ftString,False,False,False,True,'Ativo');
  fStatusgrupocdc    := CreateCmDbField('STATUSGRUPOCDC',ftString,False,False,False,True,'Status');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'Usuário Inclusão');
end;

function TDbCentroCusto.Insert: Boolean;
begin
  fIdempresa.AsFloat := GetSequence('CentCust');
  Result := Inherited Insert;
end;

function TDbCentroCusto.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbCentroCusto.SetAtivo(const Value: TCmDbField);
begin
  FAtivo := Value;
end;

procedure TDbCentroCusto.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbCentroCusto.SetCodcorresp(const Value: TCmDbField);
begin
  FCodcorresp := Value;
end;

procedure TDbCentroCusto.SetCodreduzido(const Value: TCmDbField);
begin
  FCodreduzido := Value;
end;

procedure TDbCentroCusto.SetFlgobrigacc(const Value: TCmDbField);
begin
  FFlgobrigacc := Value;
end;

procedure TDbCentroCusto.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbCentroCusto.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbCentroCusto.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbCentroCusto.SetIdUsuarioInclusao(const Value: TCmDbField);
begin
  FIdUsuarioInclusao := Value;
end;

procedure TDbCentroCusto.SetMascaracliente(const Value: TCmDbField);
begin
  FMascaracliente := Value;
end;

procedure TDbCentroCusto.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCentroCusto.SetResponsavel(const Value: TCmDbField);
begin
  FResponsavel := Value;
end;

procedure TDbCentroCusto.SetStatusgrupocdc(const Value: TCmDbField);
begin
  FStatusgrupocdc := Value;
end;

end.

