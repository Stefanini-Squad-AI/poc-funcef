{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/02/2003                             }
{                                                       }
{*******************************************************}

unit uDbSimulaBenef;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSimulaBenef = class(TCmDbObject)

  private
    FQueryinicial: TCmDbField;
    FIdsimulabenef: TCmDbField;
    FFlgativo: TCmDbField;
    FIdbeneficio: TCmDbField;
    FFlgrollback: TCmDbField;
    FIdreports: TCmDbField;
    FFlgtipodemonstra: TCmDbField;
    FHtmldemonstra: TCmDbField;
    FOrigemcm: TCmDbField;
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdsimulabenef(const Value: TCmDbField);
    procedure SetQueryinicial(const Value: TCmDbField);
    procedure SetFlgrollback(const Value: TCmDbField);
    procedure SetFlgtipodemonstra(const Value: TCmDbField);
    procedure SetHtmldemonstra(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);

  public

     Property Queryinicial: TCmDbField read FQueryinicial write SetQueryinicial;
     Property Idsimulabenef: TCmDbField read FIdsimulabenef write SetIdsimulabenef;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Flgrollback : TCmDbField read FFlgrollback write SetFlgrollback;
     Property Flgtipodemonstra : TCmDbField read FFlgtipodemonstra write SetFlgtipodemonstra;
     Property Htmldemonstra : TCmDbField read FHtmldemonstra write SetHtmldemonstra;
     Property Idreports : TCmDbField read FIdreports write SetIdreports;
     Property Origemcm : TCmDbField read FOrigemcm write SetOrigemcm;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSimulaBenef }

constructor TDbSimulaBenef.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SIMULABENEF';

   fIdsimulabenef := CreateCmDbField('IDSIMULABENEF',ftfloat,True,True,False,False,'Id. Simulação de Benefício');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False,False,False,'Ativo?');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,True,False,False,True,'Id. Benefício');
   fQueryinicial := CreateCmDbField('QUERYINICIAL',ftBlob,True,False,False,False,'Query Inicial');
   fFlgrollback := CreateCmDbField('FLGROLLBACK',ftfloat,True,False,False,False,'Cancelar alterações no BD');
   fFlgtipodemonstra := CreateCmDbField('FLGTIPODEMONSTRA',ftString,False,False,False,False,'Tipo de Demonstrativo');
   fHtmldemonstra := CreateCmDbField('HTMLDEMONSTRA',ftString,False,False,False,False,'Arquivo HTML');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'Id. Reports');
   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'Origem CM');   
end;

function TDbSimulaBenef.Insert: Boolean;
begin

   fIdsimulabenef.AsFloat := GetSequence('SIMULABENEF');
   Result := Inherited Insert;

end;


procedure TDbSimulaBenef.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbSimulaBenef.SetFlgrollback(const Value: TCmDbField);
begin
  FFlgrollback := Value;
end;

procedure TDbSimulaBenef.SetFlgtipodemonstra(const Value: TCmDbField);
begin
  FFlgtipodemonstra := Value;
end;

procedure TDbSimulaBenef.SetHtmldemonstra(const Value: TCmDbField);
begin
  FHtmldemonstra := Value;
end;

procedure TDbSimulaBenef.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDbSimulaBenef.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbSimulaBenef.SetIdsimulabenef(const Value: TCmDbField);
begin
  FIdsimulabenef := Value;
end;

procedure TDbSimulaBenef.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

procedure TDbSimulaBenef.SetQueryinicial(const Value: TCmDbField);
begin
  FQueryinicial := Value;
end;

end.



