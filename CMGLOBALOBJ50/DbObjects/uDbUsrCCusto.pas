{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbUsrCCusto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbUsrCCusto = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdempresa: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public
    Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
    Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
    Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
    Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbUsrCCusto }

constructor TDbUsrCCusto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USCCUSTO';

  fIdusuario      := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'Usuário');
  fIdpessoa       := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Pessoa');
  fIdempresa      := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'Empresa');
  fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'Centro de Custo');
end;

function TDbUsrCCusto.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbUsrCCusto.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbUsrCCusto.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbUsrCCusto.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbUsrCCusto.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbUsrCCusto.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



