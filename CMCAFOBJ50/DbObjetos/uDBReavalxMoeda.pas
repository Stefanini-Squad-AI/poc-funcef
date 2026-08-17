{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 30/08/2002                             }
{                                                       }
{*******************************************************}

unit uDBReavalxMoeda;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

Type
  TDBReavalxMoeda = class(TCmDbObject)

  private
    FIdreavaliacao: TCmDbField;
    FCmbem: TCmDbField;
    FValorg: TCmDbField;
    FMoecodigo: TCmDbField;
    FDataUltCM: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetIdreavaliacao(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);
    procedure SetDataUltCM(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idreavaliacao: TCmDbField read FIdreavaliacao write SetIdreavaliacao;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;
     Property DataUltCM: TCmDbField read FDataUltCM write SetDataUltCM;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBReavalxMoeda }

constructor TDBReavalxMoeda.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'REAVALXMOEDA';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fIdreavaliacao := CreateCmDbField('IDREAVALIACAO',ftfloat,True,True,False,True,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
   fDataultcm := CreateCmDbField('DATAULTCM',ftDateTime,False,False,False,True,'');
end;

function TDBReavalxMoeda.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBReavalxMoeda.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBReavalxMoeda.SetDataUltCM(const Value: TCmDbField);
begin
  FDataUltCM := Value;
end;

procedure TDBReavalxMoeda.SetIdreavaliacao(const Value: TCmDbField);
begin
  FIdreavaliacao := Value;
end;

procedure TDBReavalxMoeda.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBReavalxMoeda.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



