{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 15/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbContasxcc;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContasxcc = class(TCmDbObject)
  private
    FCodcentrocusto: TCmDbField;
    FIdempresa: TCmDbField;
    FPlano: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FPlaconta: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);

  public
    Property Plano: TCmDbField read FPlano write SetPlano;
    Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
    Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
    Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
    Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

    Constructor Create; Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContasxcc }

constructor TDbContasxcc.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTASXCC';

  fPlano             := CreateCmDbField('PLANO',ftfloat,True,True,False,True,'Plano');
  fPlaconta          := CreateCmDbField('PLACONTA',ftString,True,True,False,True,'PlaConta');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,True,False,False,True,'Usuário Inclusão');
  fIdempresa         := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'Empresa');
  fCodcentrocusto    := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'Cetro de Custo');
end;

function TDbContasxcc.Insert: Boolean;
begin
  fPlano.AsFloat := GetSequence('CONTASXCC');
  fIdempresa.AsFloat := GetSequence('CONTASXCC');
  Result := Inherited Insert;
end;

function TDbContasxcc.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbContasxcc.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbContasxcc.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbContasxcc.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbContasxcc.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbContasxcc.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

end.

