{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/03/2009                             }
{                                                       }
{*******************************************************}

unit uDbHstpercsegregaimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHstpercsegregaimob = class(TCmDbObject)

  private
    FDatavigencia: TCmDbField;
    FIdpatro: TCmDbField;
    FIdhstpercsegregaimob: TCmDbField;
    FIdplanoprev: TCmDbField;
    FPercsegregaimov: TCmDbField;
    FIdimovel: TCmDbField;
    FStatus: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetIdhstpercsegregaimob(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPercsegregaimov(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);

  public
     Property Percsegregaimov: TCmDbField read FPercsegregaimov write SetPercsegregaimov;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idhstpercsegregaimob: TCmDbField read FIdhstpercsegregaimob write SetIdhstpercsegregaimob;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;
     //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Início
     Property Status : TCmDbField read FStatus write SetStatus;
     Property Trgdtinclusao : TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHstpercsegregaimob }

constructor TDbHstpercsegregaimob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTPERCSEGREGAIMOB';

   fPercsegregaimov := CreateCmDbField('PERCSEGREGAIMOV',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,False,False,True,'');
   fIdhstpercsegregaimob := CreateCmDbField('IDHSTPERCSEGREGAIMOB',ftfloat,True,True,False,True,'');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,True,False,False,True,'');
   //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Início
   fStatus := CreateCmDbField('STATUS', ftString, False, False, False, False, '');
   FTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO', ftDateTime, True, False, False, True, '' , -1, True);
   //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Fim
end;

function TDbHstpercsegregaimob.Insert: Boolean;
begin

   fIdhstpercsegregaimob.AsFloat := GetSequence('HSTPERCSEGREGAIMOB');
   Result := Inherited Insert;

end;


procedure TDbHstpercsegregaimob.SetDatavigencia(const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbHstpercsegregaimob.SetIdhstpercsegregaimob(
  const Value: TCmDbField);
begin
  FIdhstpercsegregaimob := Value;
end;

procedure TDbHstpercsegregaimob.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbHstpercsegregaimob.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbHstpercsegregaimob.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbHstpercsegregaimob.SetPercsegregaimov(
  const Value: TCmDbField);
begin
  FPercsegregaimov := Value;
end;

procedure TDbHstpercsegregaimob.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

procedure TDbHstpercsegregaimob.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

end.



