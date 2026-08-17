{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbRadObjeto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadObjeto = class(TCmDbObject)

  private
    FIdObjeto: TCmDbField;
    FIdmodulo: TCmDbField;
    FDescobjeto: TCmDbField;
    FNomeobjeto: TCmDbField;
    procedure SetDescobjeto(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdobjeto(const Value: TCmDbField);
    procedure SetNomeobjeto(const Value: TCmDbField);

  public
     Property IdObjeto: TCmDbField read FIdObjeto write SetIdObjeto;
     Property IdModulo: TCmDbField read FIdModulo write SetIdModulo;
     Property Nomeobjeto: TCmDbField read FNomeobjeto write SetNomeobjeto;
     Property Descobjeto: TCmDbField read FDescobjeto write SetDescobjeto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert: Boolean; Override;
  End;

implementation

{ TDbRadObjeto }

constructor TDbRadObjeto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADOBJETO';

  fIdObjeto := CreateCmDbField('IDOBJETO',ftfloat,True,True,False,True,'');
  fIdModulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
  fNomeObjeto := CreateCmDbField('NOMEOBJETO',ftString,False,False,False,True,'');
  fDescObjeto := CreateCmDbField('DESCOBJETO',ftString,False,False,False,True,'');
end;

function TDbRadObjeto.Insert: Boolean;
begin
  fIdObjeto.AsFloat := GetSequence('RADOBJETO');
  Result := Inherited Insert;
end;

procedure TDbRadObjeto.SetDescobjeto(const Value: TCmDbField);
begin
  FDescObjeto := Value;
end;

procedure TDbRadObjeto.SetIdmodulo(const Value: TCmDbField);
begin
  FIdModulo := Value;
end;

procedure TDbRadObjeto.SetIdobjeto(const Value: TCmDbField);
begin
  FIdObjeto := Value;
end;

procedure TDbRadObjeto.SetNomeobjeto(const Value: TCmDbField);
begin
  FNomeObjeto := Value;
end;

end.

