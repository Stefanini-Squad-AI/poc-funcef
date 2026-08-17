{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 22/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBLocalizacao;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBLocalizacao = class(TCmDbObject)

  private
    FIdresponsavel: TCmDbField;
    FFlglocsaitemp: TCmDbField;
    FIdempresa: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FNome: TCmDbField;
    FIdtipoarea: TCmDbField;
    FIdpessoa: TCmDbField;
    FEndereco: TCmDbField;
    FIdlocalizacao: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetEndereco(const Value: TCmDbField);
    procedure SetFlglocsaitemp(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdlocalizacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetIdtipoarea(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idtipoarea: TCmDbField read FIdtipoarea write SetIdtipoarea;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocalizacao: TCmDbField read FIdlocalizacao write SetIdlocalizacao;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Flglocsaitemp: TCmDbField read FFlglocsaitemp write SetFlglocsaitemp;
     Property Endereco: TCmDbField read FEndereco write SetEndereco;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBLocalizacao }

constructor TDBLocalizacao.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'LOCALIZACAO';

   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'');
   fIdtipoarea := CreateCmDbField('IDTIPOAREA',ftfloat,True,False,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,''); // Atenção
   fIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlglocsaitemp := CreateCmDbField('FLGLOCSAITEMP',ftfloat,False,False,False,False,''); // Atenção
   fEndereco := CreateCmDbField('ENDERECO',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
end;

function TDBLocalizacao.Insert: Boolean;
begin
   fIdlocalizacao.AsFloat := GetSequence('LOCALIZACAO');
   Result := Inherited Insert;
end;

function TDBLocalizacao.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBLocalizacao.SetCodcentrocusto(const Value: TCmDbField);
begin
   FCodcentrocusto := Value;
end;

procedure TDBLocalizacao.SetEndereco(const Value: TCmDbField);
begin
   FEndereco := Value;
end;

procedure TDBLocalizacao.SetFlglocsaitemp(const Value: TCmDbField);
begin
   FFlglocsaitemp := Value;
end;

procedure TDBLocalizacao.SetIdempresa(const Value: TCmDbField);
begin
   FIdempresa := Value;
end;

procedure TDBLocalizacao.SetIdlocalizacao(const Value: TCmDbField);
begin
   FIdlocalizacao := Value;
end;

procedure TDBLocalizacao.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBLocalizacao.SetIdresponsavel(const Value: TCmDbField);
begin
   FIdresponsavel := Value;
end;

procedure TDBLocalizacao.SetIdtipoarea(const Value: TCmDbField);
begin
   FIdtipoarea := Value;
end;

procedure TDBLocalizacao.SetNome(const Value: TCmDbField);
begin
   FNome := Value;
end;

end.



