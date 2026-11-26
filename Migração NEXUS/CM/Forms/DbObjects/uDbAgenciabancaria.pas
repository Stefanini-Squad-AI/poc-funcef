{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbAgenciabancaria;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbAgenciabancaria = class(TCmDbObject)

  private
    FIdbanco: TCmDbField;
    FFlgativo: TCmDbField;
    FIdpessoa: TCmDbField;
    FNumagencia: TCmDbField;
    FFlgtipo: TCmDbField;
    FIdPracaComp: TCmDbField;
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetIdbanco(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumagencia(const Value: TCmDbField);
    procedure SetIdPracaComp(const Value: TCmDbField);

  public

     Property Numagencia: TCmDbField read FNumagencia write SetNumagencia;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbanco: TCmDbField read FIdbanco write SetIdbanco;
     Property Flgtipo: TCmDbField read FFlgtipo write SetFlgtipo;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property IdPracaComp: TCmDbField read FIdPracaComp write SetIdPracaComp;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAgenciabancaria }

constructor TDbAgenciabancaria.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AGENCIABANCARIA';

   fNumagencia := CreateCmDbField('NUMAGENCIA',ftString,False,False,False,True,'Número da Agência');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Identificador');
   fIdbanco := CreateCmDbField('IDBANCO',ftfloat,False,False,False,True,'Banco');
   fFlgtipo := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'Tipo');
   fFlgativo := CreateCmDbField('FLGATIVO',ftString,False,False,False,True,'Ativo');
   fIdPracaComp := CreateCmDbField('IDPRACACOMP',ftfloat,False,False,False,True,'Praça de Compensação');

end;

function TDbAgenciabancaria.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbAgenciabancaria.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbAgenciabancaria.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbAgenciabancaria.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbAgenciabancaria.SetIdbanco(const Value: TCmDbField);
begin
  FIdbanco := Value;
end;

procedure TDbAgenciabancaria.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbAgenciabancaria.SetIdPracaComp(const Value: TCmDbField);
begin
  FIdPracaComp := Value;
end;

procedure TDbAgenciabancaria.SetNumagencia(const Value: TCmDbField);
begin
  FNumagencia := Value;
end;

end.



