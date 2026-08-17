{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbBenefretroxpess;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefretroxpess = class(TCmDbObject)

  private

  public

     Property Vlrinfinsspos: TCmDbField;
     Property Vlrinfinssant: TCmDbField;
     Property Vlrcalcinsspos: TCmDbField;
     Property Vlrcalcinssant: TCmDbField;
     Property Seqproposta: TCmDbField;
     Property Prazomaximopos: TCmDbField;
     Property Prazomaximoant: TCmDbField;
     Property Percconcessaopos: TCmDbField;
     Property Percconcessaoant: TCmDbField;
     Property Numprocinsspos: TCmDbField;
     Property Numprocinssant: TCmDbField;
     Property Idretroativo: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idbeneficio: TCmDbField;
     Property Flgprovisoriopos: TCmDbField;
     Property Flgprovisorioant: TCmDbField;
     Property Dtinicioinsspos: TCmDbField;
     Property Dtinicioinssant: TCmDbField;
     Property Dibpos: TCmDbField;
     Property Dibant: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBenefretroxpess }

constructor TDbBenefretroxpess.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFRETROXPESS';

   fVlrinfinsspos := CreateCmDbField('VLRINFINSSPOS',ftfloat,True,False,False,True);
   fVlrinfinssant := CreateCmDbField('VLRINFINSSANT',ftfloat,True,False,False,True);
   fVlrcalcinsspos := CreateCmDbField('VLRCALCINSSPOS',ftfloat,True,False,False,True);
   fVlrcalcinssant := CreateCmDbField('VLRCALCINSSANT',ftfloat,True,False,False,True);
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,True,False,True);
   fPrazomaximopos := CreateCmDbField('PRAZOMAXIMOPOS',ftfloat,True,False,False,True);
   fPrazomaximoant := CreateCmDbField('PRAZOMAXIMOANT',ftfloat,True,False,False,True);
   fPercconcessaopos := CreateCmDbField('PERCCONCESSAOPOS',ftfloat,True,False,False,True);
   fPercconcessaoant := CreateCmDbField('PERCCONCESSAOANT',ftfloat,True,False,False,True);
   fNumprocinsspos := CreateCmDbField('NUMPROCINSSPOS',ftfloat,True,False,False,True);
   fNumprocinssant := CreateCmDbField('NUMPROCINSSANT',ftfloat,True,False,False,True);
   fIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,False,True,False,True);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,True,False,True);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True,False,True);
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,False,True,False,True);
   fFlgprovisoriopos := CreateCmDbField('FLGPROVISORIOPOS',ftfloat,True,False,False,True);
   fFlgprovisorioant := CreateCmDbField('FLGPROVISORIOANT',ftfloat,True,False,False,True);
   fDtinicioinsspos := CreateCmDbField('DTINICIOINSSPOS',ftDateTime,True,False,False,True);
   fDtinicioinssant := CreateCmDbField('DTINICIOINSSANT',ftDateTime,True,False,False,True);
   fDibpos := CreateCmDbField('DIBPOS',ftDateTime,True,False,False,True);
   fDibant := CreateCmDbField('DIBANT',ftDateTime,True,False,False,True);
end;

function TDbBenefretroxpess.Insert: Boolean;
begin

  
   Result := Inherited Insert;

end;

function TDbBenefretroxpess.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

end.



