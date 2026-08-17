{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/03/2009                             }
{                                                       }
{*******************************************************}

unit uDbHstpercsegregabem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHstpercsegregabem = class(TCmDbObject)

  private
    FDatavigencia: TCmDbField;
    FIdpatro: TCmDbField;
    FIdbem: TCmDbField;
    FPercsegregabem: TCmDbField;
    FIdhstpercsegregabem: TCmDbField;
    FIdplanoprev: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FStatus: TCmDbField;
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdhstpercsegregabem(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPercsegregabem(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Percsegregabem: TCmDbField read FPercsegregabem write SetPercsegregabem;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idhstpercsegregabem: TCmDbField read FIdhstpercsegregabem write SetIdhstpercsegregabem;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;
     //Cássio - SOL Nº 112471 KINTANA Nº 520302
     Property Status: TCmDbField read FStatus write SetStatus;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHstpercsegregabem }

constructor TDbHstpercsegregabem.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTPERCSEGREGABEM';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fPercsegregabem := CreateCmDbField('PERCSEGREGABEM',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,False,False,True,'');
   fIdhstpercsegregabem := CreateCmDbField('IDHSTPERCSEGREGABEM',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,False,False,True,'');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,True,False,False,True,'');
   //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Início
   fStatus := CreateCmDbField('STATUS', ftString, False, False, False, False, '');
   //Cássio - SOL Nº 112471 KINTANA Nº 520302 - Fim
end;

function TDbHstpercsegregabem.Insert: Boolean;
begin

   fIdhstpercsegregabem.AsFloat := GetSequence('HSTPERCSEGREGABEM');
   Result := Inherited Insert;

end;


procedure TDbHstpercsegregabem.SetDatavigencia(const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbHstpercsegregabem.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDbHstpercsegregabem.SetIdhstpercsegregabem(
  const Value: TCmDbField);
begin
  FIdhstpercsegregabem := Value;
end;

procedure TDbHstpercsegregabem.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbHstpercsegregabem.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbHstpercsegregabem.SetPercsegregabem(const Value: TCmDbField);
begin
  FPercsegregabem := Value;
end;

procedure TDbHstpercsegregabem.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

procedure TDbHstpercsegregabem.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbHstpercsegregabem.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



