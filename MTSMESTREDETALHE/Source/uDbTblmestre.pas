{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/11/2002                             }
{                                                       }
{*******************************************************}

unit uDbTblmestre;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTblmestre = class(TCmDbObject)

  private
    FDesctblmestre: TCmDbField;
    FVlrlimite: TCmDbField;
    FIdtblmestre: TCmDbField;
    procedure SetDesctblmestre(const Value: TCmDbField);
    procedure SetIdtblmestre(const Value: TCmDbField);
    procedure SetVlrlimite(const Value: TCmDbField);

  public

     Property Vlrlimite: TCmDbField read FVlrlimite write SetVlrlimite;
     Property Idtblmestre: TCmDbField read FIdtblmestre write SetIdtblmestre;
     Property Desctblmestre: TCmDbField read FDesctblmestre write SetDesctblmestre;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTblmestre }

constructor TDbTblmestre.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TBLMESTRE';

   fVlrlimite := CreateCmDbField('VLRLIMITE',ftfloat,False,False,False,True,'');
   fIdtblmestre := CreateCmDbField('IDTBLMESTRE',ftfloat,True,True,True,True,'');
   fDesctblmestre := CreateCmDbField('DESCTBLMESTRE',ftString,False,False,False,True,'');
end;

function TDbTblmestre.Insert: Boolean;
begin
   fIdtblmestre.AsFloat := GetSequence(TableName);
   Result := Inherited Insert;
end;


procedure TDbTblmestre.SetDesctblmestre(const Value: TCmDbField);
begin
  FDesctblmestre := Value;
end;

procedure TDbTblmestre.SetIdtblmestre(const Value: TCmDbField);
begin
  FIdtblmestre := Value;
end;

procedure TDbTblmestre.SetVlrlimite(const Value: TCmDbField);
begin
  FVlrlimite := Value;
end;

end.



