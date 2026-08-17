{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbDm_clientextipo;

interface
Uses Sysutils, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDm_clientextipo = class(TCmDbObject)

  private
    FIddm_tipocliente: TCmDbField;
    FIddm_cliente: TCmDbField;
    procedure SetIddm_cliente(const Value: TCmDbField);
    procedure SetIddm_tipocliente(const Value: TCmDbField);

  public

     Property Iddm_tipocliente: TCmDbField read FIddm_tipocliente write SetIddm_tipocliente;
     Property Iddm_cliente: TCmDbField read FIddm_cliente write SetIddm_cliente;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     {**
       Vou alterar a queyrie do objeto para trazer a descrição do tipo de cliente
       e filtra-la somente pelo id do ciente e não pelos dois campos da chave 
     **}
     function GetSqlSelect: String; Override;
     
  End;

implementation

{ TDbDm_clientextipo }

constructor TDbDm_clientextipo.Create;
begin
  inherited;

  TableName := 'DM_CLIENTEXTIPO';

  fIddm_tipocliente := CreateCmDbField('IDDM_TIPOCLIENTE',ftfloat,False,True);
  fIddm_cliente := CreateCmDbField('IDDM_CLIENTE',ftfloat,False,True);

  ErrorIfNoRowsAffected := False;
end;

function TDbDm_clientextipo.GetSqlSelect: String;
begin
   Result := 'SELECT ' +
             '   T.DESCDM_TIPOCLIENTE, CXT.IDDM_TIPOCLIENTE , CXT.IDDM_CLIENTE ' +
             'FROM ' +
             '   DM_TIPOCLIENTE T, DM_CLIENTEXTIPO CXT ' +
             'WHERE ' +
             '   CXT.IDDM_CLIENTE = ' + FloatToStr(fIddm_cliente.AsFloat) + ' AND ' + 
             '   T.IDDM_TIPOCLIENTE = CXT.IDDM_TIPOCLIENTE ' +
             'ORDER ' +
             '   BY T.DESCDM_TIPOCLIENTE';
end;

function TDbDm_clientextipo.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbDm_clientextipo.LoadFromDb: Boolean;
begin

end;

procedure TDbDm_clientextipo.SetIddm_cliente(const Value: TCmDbField);
begin
  FIddm_cliente := Value;
end;

procedure TDbDm_clientextipo.SetIddm_tipocliente(const Value: TCmDbField);
begin
  FIddm_tipocliente := Value;
end;

end.



