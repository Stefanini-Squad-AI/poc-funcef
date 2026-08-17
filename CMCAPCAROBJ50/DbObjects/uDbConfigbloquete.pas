{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 12/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbConfigbloquete;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbConfigbloquete = class(TCmDbObject)

  private
    FColunabloqueto: TCmDbField;
    FLinhabloqueto: TCmDbField;
    FIdconfigbloqueto: TCmDbField;
    FCodbloqche: TCmDbField;
    FCampobloqueto: TCmDbField;
    procedure SetCampobloqueto(const Value: TCmDbField);
    procedure SetCodbloqche(const Value: TCmDbField);
    procedure SetColunabloqueto(const Value: TCmDbField);
    procedure SetIdconfigbloqueto(const Value: TCmDbField);
    procedure SetLinhabloqueto(const Value: TCmDbField);

  public

     Property Linhabloqueto: TCmDbField read FLinhabloqueto write SetLinhabloqueto;
     Property Idconfigbloqueto: TCmDbField read FIdconfigbloqueto write SetIdconfigbloqueto;
     Property Colunabloqueto: TCmDbField read FColunabloqueto write SetColunabloqueto;
     Property Codbloqche: TCmDbField read FCodbloqche write SetCodbloqche;
     Property Campobloqueto: TCmDbField read FCampobloqueto write SetCampobloqueto;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbConfigbloquete }

constructor TDbConfigbloquete.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFIGBLOQUETE';

   fLinhabloqueto := CreateCmDbField('LINHABLOQUETO',ftfloat,False,False,False,True,'');
   fIdconfigbloqueto := CreateCmDbField('IDCONFIGBLOQUETO',ftfloat,True,True,False,True,'');
   fColunabloqueto := CreateCmDbField('COLUNABLOQUETO',ftfloat,False,False,False,True,'');
   fCodbloqche := CreateCmDbField('CODBLOQCHE',ftfloat,False,False,False,True,'');
   fCampobloqueto := CreateCmDbField('CAMPOBLOQUETO',ftfloat,False,False,False,True,'');
end;

function TDbConfigbloquete.Insert: Boolean;
begin

   fIdconfigbloqueto.AsFloat := GetSequence('CONFIGBLOQUETE');
   Result := Inherited Insert;

end;

function TDbConfigbloquete.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbConfigbloquete.SetCampobloqueto(const Value: TCmDbField);
begin
  FCampobloqueto := Value;
end;

procedure TDbConfigbloquete.SetCodbloqche(const Value: TCmDbField);
begin
  FCodbloqche := Value;
end;

procedure TDbConfigbloquete.SetColunabloqueto(const Value: TCmDbField);
begin
  FColunabloqueto := Value;
end;

procedure TDbConfigbloquete.SetIdconfigbloqueto(const Value: TCmDbField);
begin
  FIdconfigbloqueto := Value;
end;

procedure TDbConfigbloquete.SetLinhabloqueto(const Value: TCmDbField);
begin
  FLinhabloqueto := Value;
end;

end.



