{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 02/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbVlrRefContr;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbVlrRefContr = class(TCmDbObject)

  private
    FData: TCmDbField;
    FValor: TCmDbField;
    FIdrefcontr: TCmDbField;
  public
     Property Valor: TCmDbField read FValor write FValor;
     Property Idrefcontr: TCmDbField read FIdrefcontr write FIdrefcontr;
     Property Data: TCmDbField read FData write FData;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbVlrRefContr }

constructor TDbVlrRefContr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'VLRREFCONTR';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fIdrefcontr := CreateCmDbField('IDREFCONTR',ftfloat,True,True,False,True,'');
   fData := CreateCmDbField('DATA',ftDateTime,False,False,False,True,'');
end;

function TDbVlrRefContr.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

end.



