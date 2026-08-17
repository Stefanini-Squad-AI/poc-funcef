{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbConfigcheque;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbConfigcheque = class(TCmDbObject)

  private
    FLinhacheque: TCmDbField;
    FIdconfigcheque: TCmDbField;
    FCampocheque: TCmDbField;
    FColunacheque: TCmDbField;
    FIdtemplcheque: TCmDbField;
    FDesccampo: TCmDbField;
    procedure SetCampocheque(const Value: TCmDbField);
    procedure SetColunacheque(const Value: TCmDbField);
    procedure SetDesccampo(const Value: TCmDbField);
    procedure SetIdconfigcheque(const Value: TCmDbField);
    procedure SetIdtemplcheque(const Value: TCmDbField);
    procedure SetLinhacheque(const Value: TCmDbField);

  public

     Property Linhacheque: TCmDbField read FLinhacheque write SetLinhacheque;
     Property Idtemplcheque: TCmDbField read FIdtemplcheque write SetIdtemplcheque;
     Property Idconfigcheque: TCmDbField read FIdconfigcheque write SetIdconfigcheque;
     Property Desccampo: TCmDbField read FDesccampo write SetDesccampo;
     Property Colunacheque: TCmDbField read FColunacheque write SetColunacheque;
     Property Campocheque: TCmDbField read FCampocheque write SetCampocheque;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbConfigcheque }

constructor TDbConfigcheque.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFIGCHEQUE';

   fLinhacheque := CreateCmDbField('LINHACHEQUE',ftfloat,False,False,False,True,'');
   fIdtemplcheque := CreateCmDbField('IDTEMPLCHEQUE',ftfloat,False,False,False,True,'');
   fIdconfigcheque := CreateCmDbField('IDCONFIGCHEQUE',ftfloat,True,True,False,True,'');
   fDesccampo := CreateCmDbField('DESCCAMPO',ftString,False,False,False,True,'');
   fColunacheque := CreateCmDbField('COLUNACHEQUE',ftfloat,False,False,False,True,'');
   fCampocheque := CreateCmDbField('CAMPOCHEQUE',ftfloat,False,False,False,True,'');
end;

function TDbConfigcheque.Insert: Boolean;
begin

   fIdconfigcheque.AsFloat := GetSequence('CONFIGCHEQUE');
   Result := Inherited Insert;

end;

function TDbConfigcheque.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbConfigcheque.SetCampocheque(const Value: TCmDbField);
begin
  FCampocheque := Value;
end;

procedure TDbConfigcheque.SetColunacheque(const Value: TCmDbField);
begin
  FColunacheque := Value;
end;

procedure TDbConfigcheque.SetDesccampo(const Value: TCmDbField);
begin
  FDesccampo := Value;
end;

procedure TDbConfigcheque.SetIdconfigcheque(const Value: TCmDbField);
begin
  FIdconfigcheque := Value;
end;

procedure TDbConfigcheque.SetIdtemplcheque(const Value: TCmDbField);
begin
  FIdtemplcheque := Value;
end;

procedure TDbConfigcheque.SetLinhacheque(const Value: TCmDbField);
begin
  FLinhacheque := Value;
end;

end.



