{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbFormarecpag;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbFormarecpag = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FCodforma: TCmDbField;
    FRecpag: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FFlgdadosbancarios: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetCodforma(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgdadosbancarios(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Flgdadosbancarios: TCmDbField read FFlgdadosbancarios write SetFlgdadosbancarios;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codforma: TCmDbField read FCodforma write SetCodforma;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbFormarecpag }

constructor TDbFormarecpag.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMARECPAG';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fFlgdadosbancarios := CreateCmDbField('FLGDADOSBANCARIOS',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodforma := CreateCmDbField('CODFORMA',ftfloat,True,True,False,True,'');
end;

function TDbFormarecpag.Insert: Boolean;
begin

   fCodforma.AsFloat := GetSequence('FORMARECPAG');
   Result := Inherited Insert;

end;

function TDbFormarecpag.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbFormarecpag.SetCodforma(const Value: TCmDbField);
begin
  FCodforma := Value;
end;

procedure TDbFormarecpag.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbFormarecpag.SetFlgdadosbancarios(const Value: TCmDbField);
begin
  FFlgdadosbancarios := Value;
end;

procedure TDbFormarecpag.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbFormarecpag.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbFormarecpag.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



