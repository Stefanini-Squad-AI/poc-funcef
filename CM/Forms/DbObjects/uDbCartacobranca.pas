{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbCartacobranca;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCartacobranca = class(TCmDbObject)

  private
    FIdreports: TCmDbField;
    FIdcartacobranca: TCmDbField;
    FOrigemcm: TCmDbField;
    FModelocarta: TCmDbField;
    FFlgtipocarta: TCmDbField;
    procedure SetFlgtipocarta(const Value: TCmDbField);
    procedure SetIdcartacobranca(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetModelocarta(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);

  public

     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Modelocarta: TCmDbField read FModelocarta write SetModelocarta;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idcartacobranca: TCmDbField read FIdcartacobranca write SetIdcartacobranca;
     Property Flgtipocarta: TCmDbField read FFlgtipocarta write SetFlgtipocarta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCartacobranca }

constructor TDbCartacobranca.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARTACOBRANCA';

   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,False,'Origem do Relatório');
   fModelocarta := CreateCmDbField('MODELOCARTA',ftString,False,False,False,True,'Modelo');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'Identificador do Relatório');
   fIdcartacobranca := CreateCmDbField('IDCARTACOBRANCA',ftfloat,True,True,False,True,'Identificador');
   fFlgtipocarta := CreateCmDbField('FLGTIPOCARTA',ftString,False,False,False,True,'Tipo Carta');
end;

function TDbCartacobranca.Insert: Boolean;
begin
   fIdcartacobranca.AsFloat := GetSequence('CARTACOBRANCA');
   Result := Inherited Insert;
end;


procedure TDbCartacobranca.SetFlgtipocarta(const Value: TCmDbField);
begin
  FFlgtipocarta := Value;
end;

procedure TDbCartacobranca.SetIdcartacobranca(const Value: TCmDbField);
begin
  FIdcartacobranca := Value;
end;

procedure TDbCartacobranca.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbCartacobranca.SetModelocarta(const Value: TCmDbField);
begin
  FModelocarta := Value;
end;

procedure TDbCartacobranca.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

end.



