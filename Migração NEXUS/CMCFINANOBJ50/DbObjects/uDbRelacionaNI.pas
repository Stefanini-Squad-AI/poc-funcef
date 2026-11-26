{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 27/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbRelacionaNI;

interface
Uses
  uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbRelacionaNI = class(TCmDbObject)

  private

    FFlgmarcado: TCmDbField;
    FFlgni: TCmDbField;
    FIdrelacionani: TCmDbField;
    FCodlancfinanc: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdModOrigemRegu: TCmDbField;


  public

     Property Idrelacionani: TCmDbField read FIdrelacionani write FIdrelacionani;
     Property Flgni: TCmDbField read FFlgni write FFlgni;
     Property Flgmarcado: TCmDbField read FFlgmarcado write FFlgmarcado;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write FCodlancfinanc;
     Property IdModOrigemRegu: TCmDbField read FIdModOrigemRegu write FIdModOrigemRegu;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;


  End;




implementation
{ TDbRelacionaNI }




constructor TDbRelacionaNI.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RELACIONANI';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdrelacionani := CreateCmDbField('IDRELACIONANI',ftfloat,True,True,False,True,'');
   fFlgni := CreateCmDbField('FLGNI',ftString,False,False,False,True,'');
   fFlgmarcado := CreateCmDbField('FLGMARCADO',ftString,False,False,False,False,'');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftfloat,True,True,False,True,'');
   FIdModOrigemRegu := CreateCmDbField('IDMODORIGEMREGU',ftfloat,False,False,False,False,'');
end;



function TDbRelacionaNI.Insert: Boolean;
begin
   Result := Inherited Insert;
end;



function TDbRelacionaNI.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;



end.
