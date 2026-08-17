{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbRatadmplanpatro;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbRatadmplanpatro = class(TCmDbObject)

  private
    FIdratadmplanpatro: TCmDbField;
    FIdpatro: TCmDbField;
    FDescricao: TCmDbField;
    FIdplanoprev: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdratadmplanpatro(const Value: TCmDbField);

  public

     Property Idratadmplanpatro: TCmDbField read FIdratadmplanpatro write SetIdratadmplanpatro;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRatadmplanpatro }

constructor TDbRatadmplanpatro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RATADMPLANPATRO';

   fIdratadmplanpatro := CreateCmDbField('IDRATADMPLANPATRO',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbRatadmplanpatro.Insert: Boolean;
begin

   fIdratadmplanpatro.AsFloat := GetSequence('RATADMPLANPATRO');
   Result := Inherited Insert;

end;


procedure TDbRatadmplanpatro.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbRatadmplanpatro.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbRatadmplanpatro.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRatadmplanpatro.SetIdratadmplanpatro(const Value: TCmDbField);
begin
  FIdratadmplanpatro := Value;
end;

end.



