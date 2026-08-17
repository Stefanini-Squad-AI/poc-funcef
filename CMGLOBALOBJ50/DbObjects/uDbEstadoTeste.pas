{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/01/2006                             }
{                                                       }
{*******************************************************}

unit uDbEstadoTeste;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEstadoTeste = class(TCmDbObject)

  private
    FIdestado: TCmDbField;
    FIdpais: TCmDbField;
    FCodfiscal: TCmDbField;
    FCodestado: TCmDbField;
    FCodjurisdicao: TCmDbField;
    FNomeestado: TCmDbField;
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetCodfiscal(const Value: TCmDbField);
    procedure SetCodjurisdicao(const Value: TCmDbField);
    procedure SetIdestado(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetNomeestado(const Value: TCmDbField);

  public

     Property Nomeestado: TCmDbField read FNomeestado write SetNomeestado;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Idestado: TCmDbField read FIdestado write SetIdestado;
     Property Codjurisdicao: TCmDbField read FCodjurisdicao write SetCodjurisdicao;
     Property Codfiscal: TCmDbField read FCodfiscal write SetCodfiscal;
     Property Codestado: TCmDbField read FCodestado write SetCodestado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEstadoTeste }

constructor TDbEstadoTeste.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ESTADO';

   fNomeestado := CreateCmDbField('NOMEESTADO',ftString,False,False,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'');
   fIdestado := CreateCmDbField('IDESTADO',ftfloat,True,True,False,True,'');
   fCodjurisdicao := CreateCmDbField('CODJURISDICAO',ftString,False,False,False,True,'');
   fCodfiscal := CreateCmDbField('CODFISCAL',ftString,False,False,False,True,'');
   fCodestado := CreateCmDbField('CODESTADO',ftString,True,False,False,True,'');
end;

function TDbEstadoTeste.Insert: Boolean;
begin

   fIdestado.AsFloat := GetSequence('ESTADO');
   Result := Inherited Insert;

end;


procedure TDbEstadoTeste.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbEstadoTeste.SetCodfiscal(const Value: TCmDbField);
begin
  FCodfiscal := Value;
end;

procedure TDbEstadoTeste.SetCodjurisdicao(const Value: TCmDbField);
begin
  FCodjurisdicao := Value;
end;

procedure TDbEstadoTeste.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDbEstadoTeste.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbEstadoTeste.SetNomeestado(const Value: TCmDbField);
begin
  FNomeestado := Value;
end;

end.



