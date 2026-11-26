{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBfciariotitplan;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBfciariotitplan = class(TCmDbObject)

  private

  public

     Property Seqproposta: TCmDbField;
     Property Prioridade: TCmDbField;
     Property Percentual: TCmDbField;
     Property Idtitular: TCmDbField;
     Property Idresponsavel: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idnucleofamiliar: TCmDbField;
     Property Iddepenrespon: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Datafimreceb: TCmDbField;
     Property Codtiporecebedor: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBfciariotitplan }

constructor TDbBfciariotitplan.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BFCIARIOTITPLAN';

   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,True);
   fPrioridade := CreateCmDbField('PRIORIDADE',ftfloat,True,False);
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,True,False);
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,True);
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,False);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
   fIdnucleofamiliar := CreateCmDbField('IDNUCLEOFAMILIAR',ftfloat,True,False);
   fIddepenrespon := CreateCmDbField('IDDEPENRESPON',ftString,True,False);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True);
   fDatafimreceb := CreateCmDbField('DATAFIMRECEB',ftDateTime,True,False);
   fCodtiporecebedor := CreateCmDbField('CODTIPORECEBEDOR',ftString,True,False);
end;

function TDbBfciariotitplan.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

end.



