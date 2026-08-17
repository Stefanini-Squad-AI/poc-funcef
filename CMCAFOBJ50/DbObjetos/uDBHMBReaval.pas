{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/09/2003                             }
{                                                       }
{*******************************************************}

unit uDBHMBReaval;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBHMBReaval = class(TCmDbObject)

  private
    FIdtaxadep: TCmDbField;
    FMoecodigo: TCmDbField;
    FValorlaudo: TCmDbField;
    FTaxadepant: TCmDbField;
    FIdmovimentacao: TCmDbField;
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetIdtaxadep(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetTaxadepant(const Value: TCmDbField);
    procedure SetValorlaudo(const Value: TCmDbField);

  public

     Property Valorlaudo: TCmDbField read FValorlaudo write SetValorlaudo;
     Property Taxadepant: TCmDbField read FTaxadepant write SetTaxadepant;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idtaxadep: TCmDbField read FIdtaxadep write SetIdtaxadep;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBHMBReaval }

constructor TDBHMBReaval.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'HMBREAVAL';

   fValorlaudo := CreateCmDbField('VALORLAUDO',ftfloat,False,False,False,False,'');
   fTaxadepant := CreateCmDbField('TAXADEPANT',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fIdtaxadep := CreateCmDbField('IDTAXADEP',ftfloat,True,True,False,True,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,True,True,False,True,'');
end;

function TDBHMBReaval.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBHMBReaval.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBHMBReaval.SetIdtaxadep(const Value: TCmDbField);
begin
  FIdtaxadep := Value;
end;

procedure TDBHMBReaval.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBHMBReaval.SetTaxadepant(const Value: TCmDbField);
begin
  FTaxadepant := Value;
end;

procedure TDBHMBReaval.SetValorlaudo(const Value: TCmDbField);
begin
  FValorlaudo := Value;
end;

end.



