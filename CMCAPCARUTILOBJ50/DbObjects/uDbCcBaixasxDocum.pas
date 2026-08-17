{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alex Pereira                    }
{ Atualizado Em: 23/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbCcBaixasxDocum;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCcBaixasxDocum = class(TCmDbObject)

  private
    FPlaconta: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FIdpatro: TCmDbField;
    FPlano: TCmDbField;
    FIdplanoprev: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdccbaixasxdocum: TCmDbField;
    FIdpessoa: TCmDbField;
    FCoddocumento: TCmDbField;
    FValor: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetIdccbaixasxdocum(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idccbaixasxdocum: TCmDbField read FIdccbaixasxdocum write SetIdccbaixasxdocum;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCcBaixasxDocum }

constructor TDbCcBaixasxDocum.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CCBAIXASXDOCUM';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,True,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,True,False,False,True,'');
   fIdsegregacriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,False,False,True,'');
   fIdccbaixasxdocum := CreateCmDbField('IDCCBAIXASXDOCUM',ftfloat,True,True,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,False,False,True,'');

end;

function TDbCcBaixasxDocum.Insert: Boolean;
begin

   fIdccbaixasxdocum.AsFloat := GetSequence('CCBAIXASXDOCUM');
   Result := Inherited Insert;

end;


procedure TDbCcBaixasxDocum.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbCcBaixasxDocum.SetIdccbaixasxdocum(const Value: TCmDbField);
begin
  FIdccbaixasxdocum := Value;
end;

procedure TDbCcBaixasxDocum.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbCcBaixasxDocum.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCcBaixasxDocum.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbCcBaixasxDocum.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbCcBaixasxDocum.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbCcBaixasxDocum.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbCcBaixasxDocum.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbCcBaixasxDocum.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



