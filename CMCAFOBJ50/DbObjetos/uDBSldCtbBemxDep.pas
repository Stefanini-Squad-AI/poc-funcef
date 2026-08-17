{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 09/07/2003                             }
{                                                       }
{*******************************************************}

unit uDBSldCtbBemxDep;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBSldCtbBemxDep = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdsldctbbemxdep: TCmDbField;
    FMoecodigo: TCmDbField;
    FReavdeplanc: TCmDbField;
    FUltreavcmdep: TCmDbField;
    FReavcmdep: TCmDbField;
    FDeplanc: TCmDbField;
    FIdbem: TCmDbField;
    FUltreavdeplanc: TCmDbField;
    FDatasldbem: TCmDbField;
    FCmdep: TCmDbField;
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDatasldbem(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsldctbbemxdep(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetReavcmdep(const Value: TCmDbField);
    procedure SetReavdeplanc(const Value: TCmDbField);
    procedure SetUltreavcmdep(const Value: TCmDbField);
    procedure SetUltreavdeplanc(const Value: TCmDbField);

  public

     Property Ultreavdeplanc: TCmDbField read FUltreavdeplanc write SetUltreavdeplanc;
     Property Ultreavcmdep: TCmDbField read FUltreavcmdep write SetUltreavcmdep;
     Property Reavdeplanc: TCmDbField read FReavdeplanc write SetReavdeplanc;
     Property Reavcmdep: TCmDbField read FReavcmdep write SetReavcmdep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idsldctbbemxdep: TCmDbField read FIdsldctbbemxdep write SetIdsldctbbemxdep;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Datasldbem: TCmDbField read FDatasldbem write SetDatasldbem;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBSldCtbBemxDep }

constructor TDBSldCtbBemxDep.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SLDCTBBEMXDEP';

   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fDatasldbem := CreateCmDbField('DATASLDBEM',ftDateTime,True,True,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fIdsldctbbemxdep := CreateCmDbField('IDSLDCTBBEMXDEP',ftfloat,True,True,False,True,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
   fReavdeplanc := CreateCmDbField('REAVDEPLANC',ftfloat,False,False,False,False,'');
   fReavcmdep := CreateCmDbField('REAVCMDEP',ftfloat,False,False,False,False,'');
   fUltreavdeplanc := CreateCmDbField('ULTREAVDEPLANC',ftfloat,False,False,False,False,'');
   fUltreavcmdep := CreateCmDbField('ULTREAVCMDEP',ftfloat,False,False,False,False,'');
end;

function TDBSldCtbBemxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
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

procedure TDBSldCtbBemxDep.SetReavcmdep(const Value: TCmDbField);
begin
  FReavcmdep := Value;
end;

procedure TDBSldCtbBemxDep.SetReavdeplanc(const Value: TCmDbField);
begin
  FReavdeplanc := Value;
end;

procedure TDBSldCtbBemxDep.SetUltreavcmdep(const Value: TCmDbField);
begin
  FUltreavcmdep := Value;
end;

procedure TDBSldCtbBemxDep.SetUltreavdeplanc(const Value: TCmDbField);
begin
  FUltreavdeplanc := Value;
end;

end.



