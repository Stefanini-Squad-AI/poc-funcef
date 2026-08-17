{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbDm_cliente;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDm_cliente = class(TCmDbObject)

  private
    FNomedm_cliente: TCmDbField;
    FIddm_cliente: TCmDbField;
    procedure SetIddm_cliente(const Value: TCmDbField);
    procedure SetNomedm_cliente(const Value: TCmDbField);

  public

     Property Nomedm_cliente: TCmDbField read FNomedm_cliente write SetNomedm_cliente;
     Property Iddm_cliente: TCmDbField read FIddm_cliente write SetIddm_cliente;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TDbDm_cliente }

constructor TDbDm_cliente.Create;
begin
  inherited;

  TableName := 'DM_CLIENTE';

  fNomedm_cliente := CreateCmDbField('NOMEDM_CLIENTE',ftString,True,False);
  fIddm_cliente := CreateCmDbField('IDDM_CLIENTE',ftfloat,False,True);
  
  ErrorIfNoRowsAffected := False;
end;

function TDbDm_cliente.Insert: Boolean;
begin

   fIddm_cliente.AsFloat := GetSequence('DM_CLIENTE');
   Result := Inherited Insert;

end;

function TDbDm_cliente.LoadFromDb: Boolean;
begin

end;

procedure TDbDm_cliente.SetIddm_cliente(const Value: TCmDbField);
begin
  FIddm_cliente := Value;
end;

procedure TDbDm_cliente.SetNomedm_cliente(const Value: TCmDbField);
begin
  FNomedm_cliente := Value;
end;

end.



