{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Vinicius Eduardo N. Maciel      }
{ Atualizado Em: 08/08/2011                             }
{                                                       }
{*******************************************************}

unit uDbAlcadas;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase, SysUtils;

Type
  TDbAlcadas = class(TCmDbObject)

  private
    FValor : TCmDbField;
    FIdusuario : TCmDbField;
    FIdcargo : TCmDbField;
    FIdalcadas : TCmDbField;
    FDtiniciovigencia : TCmDbField;
    FDtatualizacaovalores : TCmDbField;
    FFlgLimite : TCmDbField;
    FFlgDE     : TCmDbField;
  public

     Property Valor: TCmDbField read FValor write FValor;
     Property Idusuario: TCmDbField read FIdusuario write FIdusuario;
     Property Idcargo: TCmDbField read FIdcargo write FIdcargo;
     Property Idalcadas: TCmDbField read FIdalcadas write FIdalcadas;
     Property Dtiniciovigencia: TCmDbField read FDtiniciovigencia write FDtiniciovigencia;
     Property Dtatualizacaovalores: TCmDbField read FDtatualizacaovalores write FDtatualizacaovalores;
     Property FlgLimite: TCmDbField read FFlgLimite write FFlgLimite;
     Property FlgDE: TCmDbField read FFlgDE write FFlgDE;
     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAlcadas }

constructor TDbAlcadas.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALCADAS';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   flgLimite := CreateCmDbField('FLGLIMITE',ftString,False,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdcargo := CreateCmDbField('IDCARGO',ftfloat,False,False,False,True,'');
   fIdalcadas := CreateCmDbField('IDALCADAS',ftfloat,True,True,False,True,'');
   fDtiniciovigencia := CreateCmDbField('DTINICIOVIGENCIA',ftDateTime,False,False,False,True,'');
   fDtatualizacaovalores := CreateCmDbField('DTATUALIZACAOVALORES',ftDateTime,False,False,False,True,'');
   fFlgDE := CreateCmDbField('FLGDE',ftString,false,false,false,true,'');
end;

function TDbAlcadas.Insert: Boolean;
begin
   fIdalcadas.AsFloat := GetSequence('ALCADAS');
   Result := Inherited Insert;
end;

end.



