{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbClasfisxtipoagre;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbClasfisxtipoagre = class(TCmDbObject)

  private
    FIdclasfisclifor: TCmDbField;
    FCodtipocustagreg: TCmDbField;
    FIdclasfisxagre: TCmDbField;
    FRecpag: TCmDbField;
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetIdclasfisclifor(const Value: TCmDbField);
    procedure SetIdclasfisxagre(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idclasfisxagre: TCmDbField read FIdclasfisxagre write SetIdclasfisxagre;
     Property Idclasfisclifor: TCmDbField read FIdclasfisclifor write SetIdclasfisclifor;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbClasfisxtipoagre }

constructor TDbClasfisxtipoagre.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASFISXTIPOAGRE';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdclasfisxagre := CreateCmDbField('IDCLASFISXAGRE',ftfloat,True,True,False,True,'');
   fIdclasfisclifor := CreateCmDbField('IDCLASFISCLIFOR',ftfloat,False,False,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,False,False,False,True,'');
end;

function TDbClasfisxtipoagre.Insert: Boolean;
begin

   fIdclasfisxagre.AsFloat := GetSequence('CLASFISXTIPOAGRE');
   Result := Inherited Insert;

end;

function TDbClasfisxtipoagre.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbClasfisxtipoagre.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbClasfisxtipoagre.SetIdclasfisclifor(const Value: TCmDbField);
begin
  FIdclasfisclifor := Value;
end;

procedure TDbClasfisxtipoagre.SetIdclasfisxagre(const Value: TCmDbField);
begin
  FIdclasfisxagre := Value;
end;

procedure TDbClasfisxtipoagre.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



