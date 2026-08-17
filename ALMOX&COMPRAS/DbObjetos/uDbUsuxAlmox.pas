{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 05/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbUsuxAlmox;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject ;

Type
  TDbUsuxAlmox = class(TCmDbObject)

  private
    FCodAlmoxarifado: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdUsuario: TCmDbField;
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdUsuario(const Value: TCmDbField);

  public

     Property IdUsuario       : TCmDbField read FIdUsuario write SetIdUsuario;
     Property IdPessoa        : TCmDbField read FIdPessoa write SetIdPessoa;
     Property CodAlmoxarifado : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbUsuxAlmox }

constructor TDbUsuxAlmox.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUXALMOX';

   fIdusuario       := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fIdpessoa        := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO',ftfloat,True,True,False,True,'');
end;

function TDbUsuxAlmox.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbUsuxAlmox.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbUsuxAlmox.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbUsuxAlmox.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbUsuxAlmox.SetIdUsuario(const Value: TCmDbField);
begin
  FIdUsuario := Value;
end;

end.



