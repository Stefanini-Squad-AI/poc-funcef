{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbPessoa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbPessoa = class(TCmDbObject)

  private
    FTipo: TCmDbField;
    FEmail: TCmDbField;
    FIdendcobranca: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdendentrega: TCmDbField;
    FIdendcorresp: TCmDbField;
    FNome: TCmDbField;
    FNumdocumento: TCmDbField;
    FIdmodulorespon: TCmDbField;
    FHomepage: TCmDbField;
    FIdendcomercial: TCmDbField;
    FRazaosocial: TCmDbField;
    FIdimagem: TCmDbField;
    FIddocumento: TCmDbField;
    FIdendresidencial: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgAvaliaFornec: TCmDbField;
    procedure SetEmail(const Value: TCmDbField);
    procedure SetHomepage(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetIdendcobranca(const Value: TCmDbField);
    procedure SetIdendcomercial(const Value: TCmDbField);
    procedure SetIdendcorresp(const Value: TCmDbField);
    procedure SetIdendentrega(const Value: TCmDbField);
    procedure SetIdendresidencial(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetIdmodulorespon(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNumdocumento(const Value: TCmDbField);
    procedure SetRazaosocial(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);
    procedure SetFlgAvaliaFornec(const Value: TCmDbField);

  public

     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Razaosocial: TCmDbField read FRazaosocial write SetRazaosocial;
     Property Numdocumento: TCmDbField read FNumdocumento write SetNumdocumento;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulorespon: TCmDbField read FIdmodulorespon write SetIdmodulorespon;
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idendresidencial: TCmDbField read FIdendresidencial write SetIdendresidencial;
     Property Idendentrega: TCmDbField read FIdendentrega write SetIdendentrega;
     Property Idendcorresp: TCmDbField read FIdendcorresp write SetIdendcorresp;
     Property Idendcomercial: TCmDbField read FIdendcomercial write SetIdendcomercial;
     Property Idendcobranca: TCmDbField read FIdendcobranca write SetIdendcobranca;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
     Property Homepage: TCmDbField read FHomepage write SetHomepage;
     Property Email: TCmDbField read FEmail write SetEmail;
     Property FlgAvaliaFornec: TCmDbField read FFlgAvaliaFornec write SetFlgAvaliaFornec; //Thaise - SOL136120

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     function Update: Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPessoa }

constructor TDbPessoa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PESSOA';

   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'Tipo Pessoa');
   fRazaosocial := CreateCmDbField('RAZAOSOCIAL',ftString,False,False,False,True,'Razão Social');
   fNumdocumento := CreateCmDbField('NUMDOCUMENTO',ftString,False,False,False,True,'Número do Documento');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'Nome');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Identificador do Pessoa');
   fIdmodulorespon := CreateCmDbField('IDMODULORESPON',ftfloat,False,False,False,True,'Identificador do Mód. Respon.');
   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,False,False,False,True,'Identificador da Imagem');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'Grupo');
   fIdendresidencial := CreateCmDbField('IDENDRESIDENCIAL',ftfloat,False,False,False,True,'Endereço Residencial');
   fIdendentrega := CreateCmDbField('IDENDENTREGA',ftfloat,False,False,False,True,'Endereço de Entrega');
   fIdendcorresp := CreateCmDbField('IDENDCORRESP',ftfloat,False,False,False,True,'Endereço de Correspondência');
   fIdendcomercial := CreateCmDbField('IDENDCOMERCIAL',ftfloat,False,False,False,True,'Endereço Comercial');
   fIdendcobranca := CreateCmDbField('IDENDCOBRANCA',ftfloat,False,False,False,True,'Endereço de Cobrança');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,False,False,False,True,'Identificador do Documento');
   fHomepage := CreateCmDbField('HOMEPAGE',ftString,False,False,False,True,'Home Page');
   fEmail := CreateCmDbField('EMAIL',ftString,False,False,False,True,'e-mail');
   fFlgAvaliaFornec := CreateCmDbField('FLGAVALIAFORNEC',ftString,False,False,False,True,'Avaliar Fornecedor'); // 136120 - Edilaine
end;

function TDbPessoa.Update: Boolean;
begin
  If fRazaosocial.IsNull or
     (fTipo.AsString = 'F') Then fRazaosocial.AsString := fNome.AsString;

  Result := inherited Update;
end;

function TDbPessoa.Insert: Boolean;
begin
   fIdpessoa.AsFloat := GetSequence('PESSOA');

   If fRazaosocial.IsNull Then fRazaosocial.AsString := fNome.AsString;

   Result := Inherited Insert;
end;

function TDbPessoa.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPessoa.SetEmail(const Value: TCmDbField);
begin
  FEmail := Value;
end;

procedure TDbPessoa.SetHomepage(const Value: TCmDbField);
begin
  FHomepage := Value;
end;

procedure TDbPessoa.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbPessoa.SetIdendcobranca(const Value: TCmDbField);
begin
  FIdendcobranca := Value;
end;

procedure TDbPessoa.SetIdendcomercial(const Value: TCmDbField);
begin
  FIdendcomercial := Value;
end;

procedure TDbPessoa.SetIdendcorresp(const Value: TCmDbField);
begin
  FIdendcorresp := Value;
end;

procedure TDbPessoa.SetIdendentrega(const Value: TCmDbField);
begin
  FIdendentrega := Value;
end;

procedure TDbPessoa.SetIdendresidencial(const Value: TCmDbField);
begin
  FIdendresidencial := Value;
end;

procedure TDbPessoa.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbPessoa.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDbPessoa.SetIdmodulorespon(const Value: TCmDbField);
begin
  FIdmodulorespon := Value;
end;

procedure TDbPessoa.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPessoa.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbPessoa.SetNumdocumento(const Value: TCmDbField);
begin
  FNumdocumento := Value;
end;

procedure TDbPessoa.SetRazaosocial(const Value: TCmDbField);
begin
  FRazaosocial := Value;
end;

procedure TDbPessoa.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

procedure TDbPessoa.SetFlgAvaliaFornec(const Value: TCmDbField);
begin
  FFlgAvaliaFornec := Value;
end;

end.



