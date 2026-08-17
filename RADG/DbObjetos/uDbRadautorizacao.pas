{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadautorizacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadautorizacao = class(TCmDbObject)

  private

  public

     Property Obsautoriza: TCmDbField;
     Property Idusuario: TCmDbField;
     Property Idprocesso: TCmDbField;
     Property Idetapa: TCmDbField;
     Property Idautorizacao: TCmDbField;
     Property Flgstatus: TCmDbField;
     Property Dataautorizacao: TCmDbField;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadautorizacao }

constructor TDbRadautorizacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADAUTORIZACAO';

   fObsautoriza := CreateCmDbField('OBSAUTORIZA',ftString,False,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,False,False,False,True,'');
   fIdetapa := CreateCmDbField('IDETAPA',ftfloat,False,False,False,True,'');
   fIdautorizacao := CreateCmDbField('IDAUTORIZACAO',ftfloat,True,True,False,True,'');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fDataautorizacao := CreateCmDbField('DATAAUTORIZACAO',ftDateTime,False,False,False,True,'');
end;

function TDbRadautorizacao.Insert: Boolean;
begin

   fIdautorizacao.AsFloat := GetSequence('RADAUTORIZACAO');
   Result := Inherited Insert;

end;


end.



