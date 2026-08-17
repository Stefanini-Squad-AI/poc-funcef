{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cássio Camargo                  }
{ Atualizado Em: 22/03/2010                             }
{                                                       }
{*******************************************************}

unit uDbPlanoPatroxVigenciaImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanoPatroxVigenciaImob = class(TCmDbObject)

  private
    FDatavigencia: TCmDbField;
    FIdimovel: TCmDbField;
    FIdpatro: TCmDbField;
    FIdplanoprev: TCmDbField;
    FPercentrateio: TCmDbField;
    FIdplanopatroxvigenciaimob: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPercentrateio(const Value: TCmDbField);
    procedure SetIdplanopatroxvigenciaimob(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);

  public

     Property Percentrateio: TCmDbField read FPercentrateio write SetPercentrateio;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;
     property Idplanopatroxvigenciaimob: TCmDbField read FIdplanopatroxvigenciaimob write SetIdplanopatroxvigenciaimob;
     Property Trgdtinclusao : TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanoPatroxVigenciaImob }

constructor TDbPlanoPatroxVigenciaImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOPATROXVIGENCIAIMOB';

   fPercentrateio := CreateCmDbField('PERCENTRATEIO',ftfloat,False,False,False,False,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,False,False,True,'');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,False,False,False,True,'');
   FIdplanopatroxvigenciaimob := CreateCmDbField('IDPLANOPATROXVIGENCIAIMOB',ftFloat,True,True,False,True,'');
   FTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO', ftDateTime, True, False, False, True, '' , -1, True);
end;

function TDbPlanoPatroxVigenciaImob.Insert: Boolean;
begin
   FIdplanopatroxvigenciaimob.AsFloat := GetSequence('PLANOPATROXVIGENCIAIMOB');
   Result := Inherited Insert;

end;


procedure TDbPlanoPatroxVigenciaImob.SetDatavigencia(
  const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbPlanoPatroxVigenciaImob.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbPlanoPatroxVigenciaImob.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbPlanoPatroxVigenciaImob.SetIdplanoprev(
  const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPlanoPatroxVigenciaImob.SetPercentrateio(
  const Value: TCmDbField);
begin
  FPercentrateio := Value;
end;

procedure TDbPlanoPatroxVigenciaImob.SetIdplanopatroxvigenciaimob(
  const Value: TCmDbField);
begin
  FIdplanopatroxvigenciaimob := Value;
end;

procedure TDbPlanoPatroxVigenciaImob.SetTrgdtinclusao(
  const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

end.



