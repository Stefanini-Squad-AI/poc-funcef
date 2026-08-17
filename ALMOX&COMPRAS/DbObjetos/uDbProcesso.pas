{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbProcesso;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbProcesso = class(TCmDbObject)

  private
    FCodProcesso: TCmDbField;
    FStatus: TCmDbField;
    FIdComprador: TCmDbField;
    procedure SetCodProcesso(const Value: TCmDbField);
    procedure SetIdComprador(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);

  public

     Property Status        : TCmDbField read FStatus write SetStatus;
     Property IdComprador   : TCmDbField read FIdComprador write SetIdComprador;
     Property CodProcesso   : TCmDbField read FCodProcesso write SetCodProcesso;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbProcesso }

constructor TDbProcesso.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROCESSO';

   fStatus        := CreateCmDbField('STATUS'      ,ftString,False,False,False,True,'Status');
   fIdcomprador   := CreateCmDbField('IDCOMPRADOR' ,ftfloat,False,False,False,True ,'Comprador');
   fCodprocesso   := CreateCmDbField('CODPROCESSO' ,ftfloat,True,True,False,True   ,'Código do Processo');
end;

function TDbProcesso.Insert: Boolean;
begin

   fCodprocesso.AsFloat := GetSequence('PROCESSO');
   Result := Inherited Insert;

end;

function TDbProcesso.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbProcesso.SetCodProcesso(const Value: TCmDbField);
begin
  FCodProcesso := Value;
end;

procedure TDbProcesso.SetIdComprador(const Value: TCmDbField);
begin
  FIdComprador := Value;
end;

procedure TDbProcesso.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

end.



