{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/03/2010                             }
{                                                       }
{*******************************************************}

unit uDbPlanoPatroxVigenciaBem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanoPatroxVigenciaBem = class(TCmDbObject)

  private
    FIdplanoprev: TCmDbField;
    FIdpatro: TCmDbField;
    FIdbem: TCmDbField;
    FDatavigencia: TCmDbField;
    FPercentrateio: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdplanopatroxvigenciabem: TCmDbField;
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPercentrateio(const Value: TCmDbField);
    procedure SetIdplanopatroxvigenciabem(const Value: TCmDbField);

  public

     Property Percentrateio: TCmDbField read FPercentrateio write SetPercentrateio;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;
     property Idplanopatroxvigenciabem: TCmDbField read FIdplanopatroxvigenciabem write SetIdplanopatroxvigenciabem;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanoPatroxVigenciaBem }

constructor TDbPlanoPatroxVigenciaBem.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOPATROXVIGENCIABEM';

   fPercentrateio := CreateCmDbField('PERCENTRATEIO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,False,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,False,False,True,'');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,False,False,False,True,'');
   FIdplanopatroxvigenciabem := CreateCmDbField('IDPLANOPATROXVIGENCIABEM',ftFloat,True,True,False,True,'');
end;

function TDbPlanoPatroxVigenciaBem.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbPlanoPatroxVigenciaBem.SetDatavigencia(
  const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbPlanoPatroxVigenciaBem.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDbPlanoPatroxVigenciaBem.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbPlanoPatroxVigenciaBem.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPlanoPatroxVigenciaBem.SetIdplanopatroxvigenciabem(
  const Value: TCmDbField);
begin
  FIdplanopatroxvigenciabem := Value;
end;

procedure TDbPlanoPatroxVigenciaBem.SetIdplanoprev(
  const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPlanoPatroxVigenciaBem.SetPercentrateio(
  const Value: TCmDbField);
begin
  FPercentrateio := Value;
end;

end.



