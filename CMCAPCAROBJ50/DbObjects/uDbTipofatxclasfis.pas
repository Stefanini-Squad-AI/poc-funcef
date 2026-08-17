{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipofatxclasfis;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipofatxclasfis = class(TCmDbObject)

  private
    FIdclasfisclifor: TCmDbField;
    FIdtipofatura: TCmDbField;
    procedure SetIdclasfisclifor(const Value: TCmDbField);
    procedure SetIdtipofatura(const Value: TCmDbField);

  public

     Property Idtipofatura: TCmDbField read FIdtipofatura write SetIdtipofatura;
     Property Idclasfisclifor: TCmDbField read FIdclasfisclifor write SetIdclasfisclifor;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipofatxclasfis }

constructor TDbTipofatxclasfis.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOFATXCLASFIS';

  fIdtipofatura := CreateCmDbField('IDTIPOFATURA',ftfloat,False,True,False,True,'');
  fIdclasfisclifor := CreateCmDbField('IDCLASFISCLIFOR',ftfloat,False,True,False,True,'');
end;

function TDbTipofatxclasfis.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbTipofatxclasfis.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipofatxclasfis.SetIdclasfisclifor(const Value: TCmDbField);
begin
  FIdclasfisclifor := Value;
end;

procedure TDbTipofatxclasfis.SetIdtipofatura(const Value: TCmDbField);
begin
  FIdtipofatura := Value;
end;

end.



