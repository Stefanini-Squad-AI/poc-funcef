{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 02/02/2007                             }
{                                                       }
{*******************************************************}

unit uDbMsgContextoUsu;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMsgContextoUsu = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdmsgcontexto: TCmDbField;
    procedure SetIdmsgcontexto(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);

  public

     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmsgcontexto: TCmDbField read FIdmsgcontexto write SetIdmsgcontexto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

  End;

implementation

{ TDbMsgContextoUsu }

constructor TDbMsgContextoUsu.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MSGCONTEXTOUSU';

   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Id. Pessoa');
   fIdmsgcontexto := CreateCmDbField('IDMSGCONTEXTO',ftfloat,True,True,False,True,'Id. Msg. Contexto');
end;


procedure TDbMsgContextoUsu.SetIdmsgcontexto(const Value: TCmDbField);
begin
  FIdmsgcontexto := Value;
end;

procedure TDbMsgContextoUsu.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

end.



