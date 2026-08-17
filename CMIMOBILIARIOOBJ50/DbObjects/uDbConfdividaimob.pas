{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbConfdividaimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConfdividaimob = class(TCmDbObject)

  private
    FPlncodigo: TCmDbField;
    FIdconfdividaimob: TCmDbField;
    FCdidata: TCmDbField;
    FIdusuario: TCmDbField;
    FCdivalor: TCmDbField;
    FIdcontratoresult: TCmDbField;
    procedure SetCdidata(const Value: TCmDbField);
    procedure SetCdivalor(const Value: TCmDbField);
    procedure SetIdconfdividaimob(const Value: TCmDbField);
    procedure SetIdcontratoresult(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Idcontratoresult: TCmDbField read FIdcontratoresult write SetIdcontratoresult;
     Property Idconfdividaimob: TCmDbField read FIdconfdividaimob write SetIdconfdividaimob;
     Property Cdivalor: TCmDbField read FCdivalor write SetCdivalor;
     Property Cdidata: TCmDbField read FCdidata write SetCdidata;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConfdividaimob }

constructor TDbConfdividaimob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFDIVIDAIMOB';

   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
   fIdcontratoresult := CreateCmDbField('IDCONTRATORESULT',ftfloat,False,False,False,True,'');
   fIdconfdividaimob := CreateCmDbField('IDCONFDIVIDAIMOB',ftfloat,True,True,False,True,'');
   fCdivalor := CreateCmDbField('CDIVALOR',ftfloat,False,False,False,True,'');
   fCdidata := CreateCmDbField('CDIDATA',ftDateTime,False,False,False,True,'');
end;

function TDbConfdividaimob.Insert: Boolean;
begin

   fIdconfdividaimob.AsFloat := GetSequence('CONFDIVIDAIMOB');
   Result := Inherited Insert;

end;


procedure TDbConfdividaimob.SetCdidata(const Value: TCmDbField);
begin
  FCdidata := Value;
end;

procedure TDbConfdividaimob.SetCdivalor(const Value: TCmDbField);
begin
  FCdivalor := Value;
end;

procedure TDbConfdividaimob.SetIdconfdividaimob(const Value: TCmDbField);
begin
  FIdconfdividaimob := Value;
end;

procedure TDbConfdividaimob.SetIdcontratoresult(const Value: TCmDbField);
begin
  FIdcontratoresult := Value;
end;

procedure TDbConfdividaimob.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbConfdividaimob.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



