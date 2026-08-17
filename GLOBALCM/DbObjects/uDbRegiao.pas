{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/12/2005                             }
{                                                       }
{*******************************************************}

unit uDbRegiao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRegiao = class(TCmDbObject)

  private
    FDescregiao: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdregiao: TCmDbField;
    procedure SetDescregiao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdregiao(const Value: TCmDbField);

  public
     Property Idregiao: TCmDbField read FIdregiao write SetIdregiao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Descregiao: TCmDbField read FDescregiao write SetDescregiao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRegiao }

constructor TDbRegiao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REGIAO';

   fIdregiao := CreateCmDbField('IDREGIAO',ftString,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fDescregiao := CreateCmDbField('DESCREGIAO',ftString,False,False,False,True,'');
end;

function TDbRegiao.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRegiao.SetDescregiao(const Value: TCmDbField);
begin
  FDescregiao := Value;
end;

procedure TDbRegiao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRegiao.SetIdregiao(const Value: TCmDbField);
begin
  FIdregiao := Value;
end;

end.



