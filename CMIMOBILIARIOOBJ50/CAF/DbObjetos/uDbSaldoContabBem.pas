{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 19/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBSaldoContabBem;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBSaldoContabBem = class(TCmDbObject)

  private
    FReavcmbem: TCmDbField;
    FUltreavcmbem: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdbem: TCmDbField;
    FValorg: TCmDbField;
    FCmbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FUltreavvalorg: TCmDbField;
    FReavvalorg: TCmDbField;
    FDatasldbem: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetDatasldbem(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetReavcmbem(const Value: TCmDbField);
    procedure SetReavvalorg(const Value: TCmDbField);
    procedure SetUltreavcmbem(const Value: TCmDbField);
    procedure SetUltreavvalorg(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Ultreavvalorg: TCmDbField read FUltreavvalorg write SetUltreavvalorg;
     Property Ultreavcmbem: TCmDbField read FUltreavcmbem write SetUltreavcmbem;
     Property Reavvalorg: TCmDbField read FReavvalorg write SetReavvalorg;
     Property Reavcmbem: TCmDbField read FReavcmbem write SetReavcmbem;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Datasldbem: TCmDbField read FDatasldbem write SetDatasldbem;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBSaldoContabBem }

constructor TDBSaldoContabBem.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SALDOCONTABBEM';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fUltreavvalorg := CreateCmDbField('ULTREAVVALORG',ftfloat,False,False,False,False,'');
   fUltreavcmbem := CreateCmDbField('ULTREAVCMBEM',ftfloat,False,False,False,False,'');
   fReavvalorg := CreateCmDbField('REAVVALORG',ftfloat,False,False,False,False,'');
   fReavcmbem := CreateCmDbField('REAVCMBEM',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,False,'');
   fDatasldbem := CreateCmDbField('DATASLDBEM',ftDateTime,True,True,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBSaldoContabBem.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBSaldoContabBem.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBSaldoContabBem.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBSaldoContabBem.SetDatasldbem(const Value: TCmDbField);
begin
  FDatasldbem := Value;
end;

procedure TDBSaldoContabBem.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBSaldoContabBem.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBSaldoContabBem.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBSaldoContabBem.SetReavcmbem(const Value: TCmDbField);
begin
  FReavcmbem := Value;
end;

procedure TDBSaldoContabBem.SetReavvalorg(const Value: TCmDbField);
begin
  FReavvalorg := Value;
end;

procedure TDBSaldoContabBem.SetUltreavcmbem(const Value: TCmDbField);
begin
  FUltreavcmbem := Value;
end;

procedure TDBSaldoContabBem.SetUltreavvalorg(const Value: TCmDbField);
begin
  FUltreavvalorg := Value;
end;

procedure TDBSaldoContabBem.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



