{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbSubcontaPadrao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSubcontaPadrao = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FNomesubconta: TCmDbField;
    FCodsubconta: TCmDbField;
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNomesubconta(const Value: TCmDbField);

  public

     Property Nomesubconta: TCmDbField read FNomesubconta write SetNomesubconta;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     function InsereSubContaForCli(iIdForCli, iIdPessoa: Double): Boolean;
  End;

implementation

Uses uCmControlObject, SysUtils;

{ TDbSubcontaPadrao }

constructor TDbSubcontaPadrao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SUBCONTA';

   fNomesubconta := CreateCmDbField('NOMESUBCONTA',ftString,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,True,True,False,True,'');
end;

function TDbSubcontaPadrao.InsereSubContaForCli(
  iIdForCli, iIdPessoa: Double): Boolean;
begin
  _CdsSelect.Data := TCmControlObject(Owner).GetDataPacket('SELECT DECODE(RAZAOSOCIAL,NULL,NOME,RAZAOSOCIAL) FROM PESSOA WHERE IDPESSOA = ' + FloatToStr(iIdForCli));
  fNomesubconta.AsString := _CdsSelect.Fields[0].AsString;

  _CdsSelect.Data := TCmControlObject(Owner).GetDataPacket('SELECT CODSUBCONTA FROM SUBCONTA WHERE IDPESSOA = ' + FloatToStr(iIdPessoa) + ' AND NOMESUBCONTA = ' + QuotedStr(fNomesubconta.AsString));
  If _CdsSelect.IsEmpty then
  begin
    _CdsSelect.Data := TCmControlObject(Owner).GetDataPacket('SELECT MAX(CODSUBCONTA) FROM SUBCONTA WHERE IDPESSOA = ' + FloatToStr(iIdPessoa));
    fCodsubconta.AsFloat := _CdsSelect.Fields[0].AsFloat + 1;

    fIdpessoa.AsFloat := iIdPessoa;
    result := Insert;
  End
  Else
    fCodsubconta.AsFloat := _CdsSelect.Fields[0].AsFloat
end;

function TDbSubcontaPadrao.Insert: Boolean;
begin
  Result := Inherited Insert;
end;


procedure TDbSubcontaPadrao.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbSubcontaPadrao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbSubcontaPadrao.SetNomesubconta(const Value: TCmDbField);
begin
  FNomesubconta := Value;
end;

end.



