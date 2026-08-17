{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Vinicius Eduardo N. Maciel      }
{ Atualizado Em: 20/10/2011                             }
{                                                       }
{*******************************************************}

unit uDbJustificacontrato;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbJustificacontrato = class(TCmDbObject)

  private

  public
     fJustificativa: TCmDbField;
     fIdresponsavelalcada: TCmDbField;
     fIdjustificacontrato: TCmDbField;
     fIdcontrato: TCmDbField;
     fDatarespalcada: TCmDbField;
     fValorescontratos: TCmDbField;
     fIdalcadas: TCmDbField;
     Property Justificativa: TCmDbField read FJustificativa        write FJustificativa;
     Property Idresponsavelalcada: TCmDbField read FIdresponsavelalcada        write FIdresponsavelalcada;
     Property Idjustificacontrato: TCmDbField read FIdjustificacontrato        write FIdjustificacontrato;
     Property Idcontrato: TCmDbField read FIdcontrato        write FIdcontrato;
     Property Datarespalcada: TCmDbField read FDatarespalcada        write FDatarespalcada;
     Property Valorescontratos: TCmDbField read FValorescontratos        write FValorescontratos;
     Property Idalcadas: TCmDbField read FIdalcadas        write FIdalcadas;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbJustificacontrato }

constructor TDbJustificacontrato.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'JUSTIFICACONTRATO';

   fJustificativa := CreateCmDbField('JUSTIFICATIVA',ftString,False,False,False,True,'');
   fIdresponsavelalcada := CreateCmDbField('IDRESPONSAVELALCADA',ftfloat,False,False,False,True,'');
   fIdjustificacontrato := CreateCmDbField('IDJUSTIFICACONTRATO',ftfloat,True,True,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,True,False,False,True,'');
   fDatarespalcada := CreateCmDbField('DATARESPALCADA',ftDateTime,False,False,False,True,'',0,true);
   fIdalcadas := CreateCmDbField('IDALCADAS',ftfloat,False,False,False,True,'');
   fValorescontratos := CreateCmDbField('VALORESCONTRATOS',ftfloat,False,False,False,True,'');
end;

function TDbJustificacontrato.Insert: Boolean;
begin

   fIdjustificacontrato.AsFloat := GetSequence('JUSTIFICACONTRATO');
   Result := Inherited Insert;

end;


end.



