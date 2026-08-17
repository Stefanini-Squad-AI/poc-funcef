{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamlivroxramo;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamlivroxramo = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdramofornecedor: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdramofornecedor(const Value: TCmDbField);

  public

     Property Idramofornecedor: TCmDbField read FIdramofornecedor write SetIdramofornecedor;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamlivroxramo }

constructor TDbParamlivroxramo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMLIVROXRAMO';

   fIdramofornecedor := CreateCmDbField('IDRAMOFORNECEDOR',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
end;

function TDbParamlivroxramo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbParamlivroxramo.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamlivroxramo.SetIdramofornecedor(const Value: TCmDbField);
begin
  FIdramofornecedor := Value;
end;

end.



