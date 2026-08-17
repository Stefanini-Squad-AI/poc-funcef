{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 19/09/2002                             }
{                                                       }
{*******************************************************}

unit uDBAcrescValorxMoeda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBAcrescValorxMoeda = class(TCmDbObject)

  private
    FCmbem: TCmDbField;
    FIdacrescimo: TCmDbField;
    FValorg: TCmDbField;
    FMoecodigo: TCmDbField;
    FDataUltCM: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetIdacrescimo(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);
    procedure SetDataUltCM(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idacrescimo: TCmDbField read FIdacrescimo write SetIdacrescimo;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;
     Property DataUltCM: TCmDbField read FDataUltCM write SetDataUltCM;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBAcrescValorxMoeda }

constructor TDBAcrescValorxMoeda.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ACRESCVALORXMOEDA';

   fIdacrescimo := CreateCmDbField('IDACRESCIMO',ftfloat,True,True,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
   fDataultcm := CreateCmDbField('DATAULTCM',ftDateTime,False,False,False,True,'');
end;

function TDBAcrescValorxMoeda.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBAcrescValorxMoeda.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBAcrescValorxMoeda.SetDataUltCM(const Value: TCmDbField);
begin
  FDataUltCM := Value;
end;

procedure TDBAcrescValorxMoeda.SetIdacrescimo(const Value: TCmDbField);
begin
  FIdacrescimo := Value;
end;

procedure TDBAcrescValorxMoeda.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBAcrescValorxMoeda.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



