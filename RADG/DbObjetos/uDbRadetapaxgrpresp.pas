{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadetapaxgrpresp;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadetapaxgrpresp = class(TCmDbObject)

  private
    FIdgrupoautoriza: TCmDbField;
    FIdtipoprocesso: TCmDbField;
    FIdtipoetapa: TCmDbField;
    procedure SetIdgrupoautoriza(const Value: TCmDbField);
    procedure SetIdtipoetapa(const Value: TCmDbField);
    procedure SetIdtipoprocesso(const Value: TCmDbField);

  public

     Property Idtipoprocesso: TCmDbField read FIdtipoprocesso write SetIdtipoprocesso;
     Property Idtipoetapa: TCmDbField read FIdtipoetapa write SetIdtipoetapa;
     Property Idgrupoautoriza: TCmDbField read FIdgrupoautoriza write SetIdgrupoautoriza;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadetapaxgrpresp }

constructor TDbRadetapaxgrpresp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADETAPAXGRPRESP';

   fIdtipoprocesso := CreateCmDbField('IDTIPOPROCESSO',ftfloat,True,True,False,True,'');
   fIdtipoetapa := CreateCmDbField('IDTIPOETAPA',ftfloat,True,True,False,True,'');
   fIdgrupoautoriza := CreateCmDbField('IDGRUPOAUTORIZA',ftfloat,True,True,False,True,'');
end;

function TDbRadetapaxgrpresp.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRadetapaxgrpresp.SetIdgrupoautoriza(const Value: TCmDbField);
begin
  FIdgrupoautoriza := Value;
end;

procedure TDbRadetapaxgrpresp.SetIdtipoetapa(const Value: TCmDbField);
begin
  FIdtipoetapa := Value;
end;

procedure TDbRadetapaxgrpresp.SetIdtipoprocesso(const Value: TCmDbField);
begin
  FIdtipoprocesso := Value;
end;

end.



