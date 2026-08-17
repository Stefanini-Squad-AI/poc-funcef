{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 22/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBTipoSaidaTemp;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBTipoSaidaTemp = class(TCmDbObject)

  private
     FIdtiposaidatemp: TCmDbField;
     FDesctipsaitemp: TCmDbField;
     procedure SetDesctipsaitemp(const Value: TCmDbField);
     procedure SetIdtiposaidatemp(const Value: TCmDbField);

  public
     Property Idtiposaidatemp: TCmDbField read FIdtiposaidatemp write SetIdtiposaidatemp;
     Property Desctipsaitemp: TCmDbField read FDesctipsaitemp write SetDesctipsaitemp;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TDBTipoSaidaTemp }

constructor TDBTipoSaidaTemp.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPOSAIDATEMP';

   fIdtiposaidatemp := CreateCmDbField('IDTIPOSAIDATEMP',ftfloat,True,True,False,True,'');
   fDesctipsaitemp := CreateCmDbField('DESCTIPSAITEMP',ftString,False,False,False,True,'');
end;

function TDBTipoSaidaTemp.Insert: Boolean;
begin
   fIdtiposaidatemp.AsFloat := GetSequence('TIPOSAIDATEMP');
   Result := Inherited Insert;
end;

function TDBTipoSaidaTemp.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTipoSaidaTemp.SetDesctipsaitemp(const Value: TCmDbField);
begin
   FDesctipsaitemp := Value;
end;

procedure TDBTipoSaidaTemp.SetIdtiposaidatemp(const Value: TCmDbField);
begin
   FIdtiposaidatemp := Value;
end;

end.



