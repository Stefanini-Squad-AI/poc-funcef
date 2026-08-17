{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Ramos                 }
{ Atualizado Em: 03/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoRegra;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipoRegra = class(TCmDbObject)

  private
    FDescregra: TCmDbField;
    FIdgruporegra: TCmDbField;
    FIdtiporegra: TCmDbField;
    FSqlregra: TCmDbField;
    procedure SetDescregra(const Value: TCmDbField);
    procedure SetIdgruporegra(const Value: TCmDbField);
    procedure SetIdtiporegra(const Value: TCmDbField);
    procedure SetSqlregra(const Value: TCmDbField);

  public

     Property Sqlregra: TCmDbField read FSqlregra write SetSqlregra;
     Property Idtiporegra: TCmDbField read FIdtiporegra write SetIdtiporegra;
     Property Idgruporegra: TCmDbField read FIdgruporegra write SetIdgruporegra;
     Property Descregra: TCmDbField read FDescregra write SetDescregra;

     Constructor Create(Aowner: TCmCustomCdbObject); Virtual;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoRegra }

constructor TDbTipoRegra.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOREGRA';

   fSqlregra     := CreateCmDbField('SQLREGRA',ftBlob,False,False,False,False,'SQL do Tipo de Regra');
   fIdtiporegra  := CreateCmDbField('IDTIPOREGRA',ftfloat,True,True,False,False,'Identificador');
   fIdgruporegra := CreateCmDbField('IDGRUPOREGRA',ftfloat,False,False,False,False,'Grupo de Regra');
   fDescregra    := CreateCmDbField('DESCREGRA',ftString,False,False,False,False,'Descrição do Tipo de Regra');
end;

function TDbTipoRegra.Insert: Boolean;
begin

   fIdtiporegra.AsFloat := GetSequence('TIPOREGRA');
   Result := Inherited Insert;

end;

function TDbTipoRegra.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipoRegra.SetDescregra(const Value: TCmDbField);
begin
  FDescregra := Value;
end;

procedure TDbTipoRegra.SetIdgruporegra(const Value: TCmDbField);
begin
  FIdgruporegra := Value;
end;

procedure TDbTipoRegra.SetIdtiporegra(const Value: TCmDbField);
begin
  FIdtiporegra := Value;
end;

procedure TDbTipoRegra.SetSqlregra(const Value: TCmDbField);
begin
  FSqlregra := Value;
end;

end.



