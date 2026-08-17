{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 19/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBSldCtbBemxDep;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBSldCtbBemxDep = class(TCmDbObject)

  private
    FIdbem: TCmDbField;
    FUltreavdeplanc: TCmDbField;
    FDatasldbem: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdsldctbbemxdep: TCmDbField;
    FReavdeplanc: TCmDbField;
    FDeplanc: TCmDbField;
    FIdpessoa: TCmDbField;
    FCmdep: TCmDbField;
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDatasldbem(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsldctbbemxdep(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetReavdeplanc(const Value: TCmDbField);
    procedure SetUltreavdeplanc(const Value: TCmDbField);

  public

     Property Ultreavdeplanc: TCmDbField read FUltreavdeplanc write SetUltreavdeplanc;
     Property Reavdeplanc: TCmDbField read FReavdeplanc write SetReavdeplanc;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idsldctbbemxdep: TCmDbField read FIdsldctbbemxdep write SetIdsldctbbemxdep;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Datasldbem: TCmDbField read FDatasldbem write SetDatasldbem;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBSldCtbBemxDep }

constructor TDBSldCtbBemxDep.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SLDCTBBEMXDEP';

   fUltreavdeplanc := CreateCmDbField('ULTREAVDEPLANC',ftfloat,False,False,False,False,'');
   fReavdeplanc := CreateCmDbField('REAVDEPLANC',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdsldctbbemxdep := CreateCmDbField('IDSLDCTBBEMXDEP',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fDatasldbem := CreateCmDbField('DATASLDBEM',ftDateTime,True,True,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
end;

function TDBSldCtbBemxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBSldCtbBemxDep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBSldCtbBemxDep.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBSldCtbBemxDep.SetDatasldbem(const Value: TCmDbField);
begin
  FDatasldbem := Value;
end;

procedure TDBSldCtbBemxDep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBSldCtbBemxDep.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBSldCtbBemxDep.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBSldCtbBemxDep.SetIdsldctbbemxdep(const Value: TCmDbField);
begin
  FIdsldctbbemxdep := Value;
end;

procedure TDBSldCtbBemxDep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBSldCtbBemxDep.SetReavdeplanc(const Value: TCmDbField);
begin
  FReavdeplanc := Value;
end;

procedure TDBSldCtbBemxDep.SetUltreavdeplanc(const Value: TCmDbField);
begin
  FUltreavdeplanc := Value;
end;

end.



