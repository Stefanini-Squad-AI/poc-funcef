{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 09/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbRegrascontab;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbRegrascontab = class(TCmDbObject)

  private
     FRegscript        : TCmDbField;
     FReglancmov       : TCmDbField;
     FRegdesc          : TCmDbField;
     FRegcredornegativo: TCmDbField;
     FRegcodigo        : TCmDbField;
     FRegativa         : TCmDbField;
     FIdpessoa         : TCmDbField;
     procedure SetIdpessoa         (const Value: TCmDbField);
     procedure SetRegativa         (const Value: TCmDbField);
     procedure SetRegcodigo        (const Value: TCmDbField);
     procedure SetRegdesc          (const Value: TCmDbField);
     procedure SetReglancmov       (const Value: TCmDbField);
     procedure SetRegscript        (const Value: TCmDbField);
     procedure SetRegcredornegativo(const Value: TCmDbField);
  public
     Property Regscript         : TCmDbField Read FRegscript         Write SetRegscript;
     Property Reglancmov        : TCmDbField Read FReglancmov        Write SetReglancmov;
     Property Regdesc           : TCmDbField Read FRegdesc           Write SetRegdesc;
     Property Regcredornegativo : TCmDbField Read FRegcredornegativo Write SetRegcredornegativo;
     Property Regcodigo         : TCmDbField Read FRegcodigo         Write SetRegcodigo;
     Property Regativa          : TCmDbField Read FRegativa          Write SetRegativa;
     Property Idpessoa          : TCmDbField Read FIdpessoa          Write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbRegrascontab }

constructor TDbRegrascontab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REGRASCONTAB';

  FRegscript         := CreateCmDbField('REGSCRIPT',ftString);
  FReglancmov        := CreateCmDbField('REGLANCMOV',ftString);
  FRegdesc           := CreateCmDbField('REGDESC',ftString,True);
  FRegcredornegativo := CreateCmDbField('REGCREDORNEGATIVO',ftString);
  FRegcodigo         := CreateCmDbField('REGCODIGO',ftfloat,True,True,False,True);
  FRegativa          := CreateCmDbField('REGATIVA',ftString);
  FIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True);
end;

function TDbRegrascontab.Insert: Boolean;
begin

   FRegcodigo.AsFloat := GetSequence('REGRASCONTAB');
   Result := Inherited Insert;

end;

function TDbRegrascontab.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbRegrascontab.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRegrascontab.SetRegativa(const Value: TCmDbField);
begin
   FRegativa := Value;
end;

procedure TDbRegrascontab.SetRegcodigo(const Value: TCmDbField);
begin
   FRegcodigo := Value;
end;

procedure TDbRegrascontab.SetRegcredornegativo(const Value: TCmDbField);
begin
   FRegcredornegativo:= Value;
end;

procedure TDbRegrascontab.SetRegdesc(const Value: TCmDbField);
begin
   FRegdesc := Value;
end;

procedure TDbRegrascontab.SetReglancmov(const Value: TCmDbField);
begin
  FReglancmov := Value;
end;

procedure TDbRegrascontab.SetRegscript(const Value: TCmDbField);
begin
  FRegscript := Value;
end;

end.



