{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 04/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbTransfAlmox;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTransfAlmox = class(TCmDbObject)

  private
    FCodAlmoxPermite: TCmDbField;
    FCodAlmoxarifado: TCmDbField;
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetCodAlmoxPermite(const Value: TCmDbField);

  public

     Property CodAlmoxPermite : TCmDbField read FCodAlmoxPermite write SetCodAlmoxPermite;
     Property CodAlmoxarifado : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTransfAlmox }

constructor TDbTransfAlmox.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TRANSFALMOX';

   fCodalmoxpermite := CreateCmDbField('CODALMOXPERMITE',ftfloat,True,True,False,True,'');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO',ftfloat,True,True,False,True,'');
end;

function TDbTransfAlmox.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbTransfAlmox.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTransfAlmox.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbTransfAlmox.SetCodAlmoxPermite(const Value: TCmDbField);
begin
  FCodAlmoxPermite := Value;
end;

end.



