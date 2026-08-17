{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbReferenciaContr;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbReferenciaContr = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FFlgferiados: TCmDbField;
    FIdrefcontr: TCmDbField;
    FFlgsabados: TCmDbField;
    FFlgdomingos: TCmDbField;
  public
     Property Nome: TCmDbField read FNome write FNome;
     Property Idrefcontr: TCmDbField read FIdrefcontr write FIdrefcontr;
     Property Flgsabados: TCmDbField read FFlgsabados write FFlgsabados;
     Property Flgferiados: TCmDbField read FFlgferiados write FFlgferiados;
     Property Flgdomingos: TCmDbField read FFlgdomingos write FFlgdomingos;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbReferenciaContr }

constructor TDbReferenciaContr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REFERENCIACONTR';

   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdrefcontr := CreateCmDbField('IDREFCONTR',ftfloat,True,True,False,True,'');
   fFlgsabados := CreateCmDbField('FLGSABADOS',ftString,False,False,False,True,'');
   fFlgferiados := CreateCmDbField('FLGFERIADOS',ftString,False,False,False,True,'');
   fFlgdomingos := CreateCmDbField('FLGDOMINGOS',ftString,False,False,False,True,'');
end;

function TDbReferenciaContr.Insert: Boolean;
begin
   fIdrefcontr.AsFloat := GetSequence('REFERENCIACONTR');
   Result := Inherited Insert;
end;

end.



