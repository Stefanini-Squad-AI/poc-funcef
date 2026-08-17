{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBBemxDep;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBBemxDep = class(TCmDbObject)

  private
    FIdbem: TCmDbField;
    FTaxadep: TCmDbField;
    FCmbem: TCmDbField;
    FIdbemxdep: TCmDbField;
    FDeplanc: TCmDbField;
    FIdpessoa: TCmDbField;
    FMoecodigo: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdbemxdep(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);

  public

     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbemxdep: TCmDbField read FIdbemxdep write SetIdbemxdep;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBBemxDep }

constructor TDBBemxDep.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'BEMXDEP';

   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdbemxdep := CreateCmDbField('IDBEMXDEP',ftfloat,True,True,False,False,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBBemxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBBemxDep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBBemxDep.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBBemxDep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBBemxDep.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBBemxDep.SetIdbemxdep(const Value: TCmDbField);
begin
  FIdbemxdep := Value;
end;

procedure TDBBemxDep.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBBemxDep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBBemxDep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

end.



