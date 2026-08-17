{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 21/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbScPrePronta;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbScPrePronta = class(TCmDbObject)

  private
    FCodAlmoxarifado: TCmDbField;
    FDescSCPrePronta: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdSCPrePronta: TCmDbField;
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetDescSCPrePronta(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdSCPrePronta(const Value: TCmDbField);

  public

     Property IdSCPrePronta   : TCmDbField read FIdSCPrePronta write SetIdSCPrePronta;
     Property IdPessoa        : TCmDbField read FIdPessoa write SetIdPessoa;
     Property DescSCPrePronta : TCmDbField read FDescSCPrePronta write SetDescSCPrePronta;
     Property CodAlmoxarifado : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbScPrePronta }

constructor TDbScPrePronta.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SCPREPRONTA';

   fIdscprepronta   := CreateCmDbField('IDSCPREPRONTA'    ,ftfloat  ,False,True,False,True,'Chave sequencia');
   fIdpessoa        := CreateCmDbField('IDPESSOA'         ,ftfloat  ,True,False,False,True,'Empresa');
   fDescscprepronta := CreateCmDbField('DESCSCPREPRONTA'  ,ftString ,True,False,False,True,'Descrição');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO'  ,ftfloat  ,True,False,False,True,'Almoxarifado');
   
end;

function TDbScPrePronta.Insert: Boolean;
begin

   fIdscprepronta.AsFloat := GetSequence('SCPREPRONTA');
   Result := Inherited Insert;

end;

function TDbScPrePronta.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbScPrePronta.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbScPrePronta.SetDescSCPrePronta(const Value: TCmDbField);
begin
  FDescSCPrePronta := Value;
end;

procedure TDbScPrePronta.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbScPrePronta.SetIdSCPrePronta(const Value: TCmDbField);
begin
  FIdSCPrePronta := Value;
end;

end.



