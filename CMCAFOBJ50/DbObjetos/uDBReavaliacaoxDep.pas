{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 19/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBReavaliacaoxDep;

interface
Uses uCmDbObject, uSistema, DB , uCmCustomCdbObject;

Type
  TDBReavaliacaoxDep = class(TCmDbObject)

  private
    FDeplanc: TCmDbField;
    FValorg: TCmDbField;
    FCmbem: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdreavaliacaoxdep: TCmDbField;
    FCmdep: TCmDbField;
    FTaxadep: TCmDbField;
    FIdreavaliacao: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetIdreavaliacao(const Value: TCmDbField);
    procedure SetIdreavaliacaoxdep(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idreavaliacaoxdep: TCmDbField read FIdreavaliacaoxdep write SetIdreavaliacaoxdep;
     Property Idreavaliacao: TCmDbField read FIdreavaliacao write SetIdreavaliacao;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBReavaliacaoxDep }

constructor TDBReavaliacaoxDep.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'REAVALIACAOXDEP';

   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdreavaliacaoxdep := CreateCmDbField('IDREAVALIACAOXDEP',ftfloat,True,True,False,False,'');
   fIdreavaliacao := CreateCmDbField('IDREAVALIACAO',ftfloat,True,True,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
end;

function TDBReavaliacaoxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBReavaliacaoxDep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBReavaliacaoxDep.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBReavaliacaoxDep.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBReavaliacaoxDep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBReavaliacaoxDep.SetIdreavaliacao(const Value: TCmDbField);
begin
  FIdreavaliacao := Value;
end;

procedure TDBReavaliacaoxDep.SetIdreavaliacaoxdep(const Value: TCmDbField);
begin
  FIdreavaliacaoxdep := Value;
end;

procedure TDBReavaliacaoxDep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBReavaliacaoxDep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

procedure TDBReavaliacaoxDep.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

end.



