{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbClientepess;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbClientepess = class(TCmDbObject)

  private
    FIdtipocliente: TCmDbField;
    FNumerocartao: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdclasfisclifor: TCmDbField;
    FBloqueio: TCmDbField;
    FCodnatureza: TCmDbField;
    FCodcliente: TCmDbField;
    procedure SetBloqueio(const Value: TCmDbField);
    procedure SetCodcliente(const Value: TCmDbField);
    procedure SetCodnatureza(const Value: TCmDbField);
    procedure SetIdclasfisclifor(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipocliente(const Value: TCmDbField);
    procedure SetNumerocartao(const Value: TCmDbField);

  public

     Property Numerocartao: TCmDbField read FNumerocartao write SetNumerocartao;
     Property Idtipocliente: TCmDbField read FIdtipocliente write SetIdtipocliente;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idclasfisclifor: TCmDbField read FIdclasfisclifor write SetIdclasfisclifor;
     Property Codnatureza: TCmDbField read FCodnatureza write SetCodnatureza;
     Property Codcliente: TCmDbField read FCodcliente write SetCodcliente;
     Property Bloqueio: TCmDbField read FBloqueio write SetBloqueio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbClientepess }

constructor TDbClientepess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLIENTEPESS';

   fNumerocartao := CreateCmDbField('NUMEROCARTAO',ftString,False,False,False,True,'Número do Cartão');
   fIdtipocliente := CreateCmDbField('IDTIPOCLIENTE',ftfloat,False,False,False,True,'Tipo de Cliente');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Identificador');
   fIdclasfisclifor := CreateCmDbField('IDCLASFISCLIFOR',ftfloat,False,False,False,True,'Classificação Fiscal');
   fCodnatureza := CreateCmDbField('CODNATUREZA',ftString,False,False,False,True,'Código da Natureza');
   fCodcliente := CreateCmDbField('CODCLIENTE',ftString,False,False,False,True,'Código Correspondente');
   fBloqueio := CreateCmDbField('BLOQUEIO',ftString,False,False,False,True,'Motivo do Bloqueio');
end;

function TDbClientepess.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbClientepess.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbClientepess.SetBloqueio(const Value: TCmDbField);
begin
  FBloqueio := Value;
end;

procedure TDbClientepess.SetCodcliente(const Value: TCmDbField);
begin
  FCodcliente := Value;
end;

procedure TDbClientepess.SetCodnatureza(const Value: TCmDbField);
begin
  FCodnatureza := Value;
end;

procedure TDbClientepess.SetIdclasfisclifor(const Value: TCmDbField);
begin
  FIdclasfisclifor := Value;
end;

procedure TDbClientepess.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbClientepess.SetIdtipocliente(const Value: TCmDbField);
begin
  FIdtipocliente := Value;
end;

procedure TDbClientepess.SetNumerocartao(const Value: TCmDbField);
begin
  FNumerocartao := Value;
end;

end.



