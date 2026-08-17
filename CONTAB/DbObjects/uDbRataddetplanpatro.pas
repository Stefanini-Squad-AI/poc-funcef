{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbRataddetplanpatro;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbRataddetplanpatro = class(TCmDbObject)

  private
    FIdplanoprev: TCmDbField;
    FIdratadmplanprev: TCmDbField;
    FIdpatro: TCmDbField;
    FPercrateio: TCmDbField;
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdratadmplanprev(const Value: TCmDbField);
    procedure SetPercrateio(const Value: TCmDbField);

  public

     Property Percrateio: TCmDbField read FPercrateio write SetPercrateio;
     Property Idratadmplanprev: TCmDbField read FIdratadmplanprev write SetIdratadmplanprev;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRataddetplanpatro }

constructor TDbRataddetplanpatro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RATADDETPLANPATRO';

   fPercrateio := CreateCmDbField('PERCRATEIO',ftfloat,False,False,False,True,'');
   fIdratadmplanprev := CreateCmDbField('IDRATADMPLANPREV',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,True,False,True,'');
end;

function TDbRataddetplanpatro.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRataddetplanpatro.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbRataddetplanpatro.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRataddetplanpatro.SetIdratadmplanprev(
  const Value: TCmDbField);
begin
  FIdratadmplanprev := Value;
end;

procedure TDbRataddetplanpatro.SetPercrateio(const Value: TCmDbField);
begin
  FPercrateio := Value;
end;

end.



