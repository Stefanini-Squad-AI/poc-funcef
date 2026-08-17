{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBBemxMoeda;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBBemxMoeda = class(TCmDbObject)

  private
    FIdbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FCmbem: TCmDbField;
    FValorg: TCmDbField;
    FMoecodigo: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBBemxMoeda }

constructor TDBBemxMoeda.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'BEMXMOEDA';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBBemxMoeda.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBBemxMoeda.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBBemxMoeda.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBBemxMoeda.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBBemxMoeda.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBBemxMoeda.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBBemxMoeda.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



