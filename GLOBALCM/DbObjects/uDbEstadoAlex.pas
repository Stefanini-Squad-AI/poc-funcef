{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbEstadoAlex;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEstadoAlex = class(TCmDbObject)

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

{ TDbEstadoAlex }

constructor TDbEstadoAlex.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ESTADO';

   fNomeestado := CreateCmDbField('NOMEESTADO',ftString,False,False,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,True,false,False,True,'País');
   fIdestado := CreateCmDbField('IDESTADO',ftfloat,True,true,False,True,'');
   fCodjurisdicao := CreateCmDbField('CODJURISDICAO',ftString,False,False,False,True,'');
   fCodfiscal := CreateCmDbField('CODFISCAL',ftString,False,False,False,True,'');
   fCodestado := CreateCmDbField('CODESTADO',ftString,True,false,False,True,'');
end;

function TDbEstadoAlex.Insert: Boolean;
begin

   fIdestado.AsFloat := GetSequence('ESTADO');
   Result := Inherited Insert;

end;


procedure TDbEstadoAlex.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbEstadoAlex.SetCodfiscal(const Value: TCmDbField);
begin
  FCodfiscal := Value;
end;

procedure TDbEstadoAlex.SetCodjurisdicao(const Value: TCmDbField);
begin
  FCodjurisdicao := Value;
end;

procedure TDbEstadoAlex.SetIdestado(const Value: TCmDbField);
begin
  FIdestado := Value;
end;

procedure TDbEstadoAlex.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbEstadoAlex.SetNomeestado(const Value: TCmDbField);
begin
  FNomeestado := Value;
end;

end.



