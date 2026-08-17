{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBancoportforma;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBancoportforma = class(TCmDbObject)

  private

  public

     Property Vlrarredsalario: TCmDbField;
     Property Tamvalor: TCmDbField;
     Property Prefixoarq: TCmDbField;
     Property Idbancoportforma: TCmDbField;
     Property Idbanco: TCmDbField;
     Property Dfloatpagto: TCmDbField;
     Property Colvalor: TCmDbField;
     Property Codportforma: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBancoportforma }

constructor TDbBancoportforma.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BANCOPORTFORMA';

   fVlrarredsalario := CreateCmDbField('VLRARREDSALARIO',ftfloat,True,False,False,True);
   fTamvalor := CreateCmDbField('TAMVALOR',ftfloat,True,False,False,True);
   fPrefixoarq := CreateCmDbField('PREFIXOARQ',ftString,True,False,False,True);
   fIdbancoportforma := CreateCmDbField('IDBANCOPORTFORMA',ftfloat,False,True,False,True);
   fIdbanco := CreateCmDbField('IDBANCO',ftfloat,True,False,False,True);
   fDfloatpagto := CreateCmDbField('DFLOATPAGTO',ftfloat,True,False,False,True);
   fColvalor := CreateCmDbField('COLVALOR',ftfloat,True,False,False,True);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True);
end;

function TDbBancoportforma.Insert: Boolean;
begin

   f'Idbancoportforma'.AsFloat := GetSequence(BANCOPORTFORMA);
   Result := Inherited Insert;

end;

function TDbBancoportforma.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



