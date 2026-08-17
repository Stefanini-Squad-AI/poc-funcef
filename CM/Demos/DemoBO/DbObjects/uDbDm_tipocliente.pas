{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbDm_tipocliente;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDm_tipocliente = class(TCmDbObject)

  private
    FIddm_tipocliente: TCmDbField;
    FDescdm_tipocliente: TCmDbField;
    procedure SetDescdm_tipocliente(const Value: TCmDbField);
    procedure SetIddm_tipocliente(const Value: TCmDbField);

  public

     Property Iddm_tipocliente: TCmDbField read FIddm_tipocliente write SetIddm_tipocliente;
     Property Descdm_tipocliente: TCmDbField read FDescdm_tipocliente write SetDescdm_tipocliente;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     
  End;

implementation

{ TDbDm_tipocliente }

constructor TDbDm_tipocliente.Create;
begin
  inherited;

  TableName := 'DM_TIPOCLIENTE';
  
  fIddm_tipocliente := CreateCmDbField('IDDM_TIPOCLIENTE',ftfloat,False,True);
  fDescdm_tipocliente := CreateCmDbField('DESCDM_TIPOCLIENTE',ftString,True,False);
  
  ErrorIfNoRowsAffected := False;
end;

function TDbDm_tipocliente.Insert: Boolean;
begin

   fIddm_tipocliente.AsFloat := GetSequence('DM_TIPOCLIENTE');
   Result := Inherited Insert;

end;

function TDbDm_tipocliente.LoadFromDb: Boolean;
begin

end;

procedure TDbDm_tipocliente.SetDescdm_tipocliente(const Value: TCmDbField);
begin
  FDescdm_tipocliente := Value;
end;

procedure TDbDm_tipocliente.SetIddm_tipocliente(const Value: TCmDbField);
begin
  FIddm_tipocliente := Value;
end;

end.



