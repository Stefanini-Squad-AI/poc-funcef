{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbPlanodata;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbPlanodata = class(TCmDbObject)

  private
    FPlanoanterior: TCmDbField;
    FDatafim: TCmDbField;
    FDatainicio: TCmDbField;
    FIdplanodata: TCmDbField;
    FIdpessoa: TCmDbField;
    FPlano: TCmDbField;
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanodata(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlanoanterior(const Value: TCmDbField);

  public

     Property Planoanterior: TCmDbField read FPlanoanterior write SetPlanoanterior;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Idplanodata: TCmDbField read FIdplanodata write SetIdplanodata;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanodata }

constructor TDbPlanodata.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANODATA';

   fPlanoanterior := CreateCmDbField('PLANOANTERIOR',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True,'');
   fIdplanodata := CreateCmDbField('IDPLANODATA',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,True,False,False,True,'');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
end;

function TDbPlanodata.Insert: Boolean;
begin

   fIdplanodata.AsFloat := GetSequence('PLANODATA');
   Result := Inherited Insert;

end;


procedure TDbPlanodata.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbPlanodata.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbPlanodata.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPlanodata.SetIdplanodata(const Value: TCmDbField);
begin
  FIdplanodata := Value;
end;

procedure TDbPlanodata.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPlanodata.SetPlanoanterior(const Value: TCmDbField);
begin
  FPlanoanterior := Value;
end;

end.



