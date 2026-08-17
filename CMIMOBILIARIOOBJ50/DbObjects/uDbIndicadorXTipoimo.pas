{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbIndicadorXTipoimo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbIndicadorXTipoimo = class(TCmDbObject)

  private
    FIdindicadorimovel: TCmDbField;
    FCodtipimovel: TCmDbField;
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetIdindicadorimovel(const Value: TCmDbField);

  public

     Property Idindicadorimovel: TCmDbField read FIdindicadorimovel write SetIdindicadorimovel;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbIndicadorXTipoimo }

constructor TDbIndicadorXTipoimo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDICADORXTIPOIMO';

   fIdindicadorimovel := CreateCmDbField('IDINDICADORIMOVEL',ftfloat,True,True,False,True,'Indicador');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,True,True,False,True,'Tipo Imóvel');
end;

function TDbIndicadorXTipoimo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbIndicadorXTipoimo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbIndicadorXTipoimo.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbIndicadorXTipoimo.SetIdindicadorimovel(
  const Value: TCmDbField);
begin
  FIdindicadorimovel := Value;
end;

end.



