{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbModelopersonalisado;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbModelopersonalisado = class(TCmDbObject)

  private
    FIdreports: TCmDbField;
    FOrigemcm: TCmDbField;
    FIdmodelopersonalisado: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdmodelopersonalisado(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);

  public

     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idmodelopersonalisado: TCmDbField read FIdmodelopersonalisado write SetIdmodelopersonalisado;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbModelopersonalisado }

constructor TDbModelopersonalisado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MODELOPERSONALISADO';

   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
   fIdmodelopersonalisado := CreateCmDbField('IDMODELOPERSONALISADO',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbModelopersonalisado.Insert: Boolean;
begin

   fIdmodelopersonalisado.AsFloat := GetSequence('MODELOPERSONALISADO');
   Result := Inherited Insert;

end;


procedure TDbModelopersonalisado.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbModelopersonalisado.SetIdmodelopersonalisado(
  const Value: TCmDbField);
begin
  FIdmodelopersonalisado := Value;
end;

procedure TDbModelopersonalisado.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbModelopersonalisado.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

end.



