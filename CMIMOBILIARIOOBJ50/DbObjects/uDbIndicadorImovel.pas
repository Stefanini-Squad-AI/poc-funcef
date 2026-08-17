{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbIndicadorImovel;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbIndicadorImovel = class(TCmDbObject)

  private
    FInmdescricao: TCmDbField;
    FRecpag: TCmDbField;
    FIdindicadorimovel: TCmDbField;
    FFlgtipovalor: TCmDbField;
    FFlgunidaut: TCmDbField;
    FCodinterno: TCmDbField;
    procedure SetFlgtipovalor(const Value: TCmDbField);
    procedure SetFlgunidaut(const Value: TCmDbField);
    procedure SetIdindicadorimovel(const Value: TCmDbField);
    procedure SetInmdescricao(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetCodinterno(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Inmdescricao: TCmDbField read FInmdescricao write SetInmdescricao;
     Property Idindicadorimovel: TCmDbField read FIdindicadorimovel write SetIdindicadorimovel;
     Property Flgunidaut: TCmDbField read FFlgunidaut write SetFlgunidaut;
     Property Flgtipovalor: TCmDbField read FFlgtipovalor write SetFlgtipovalor;
     Property Codinterno: TCmDbField read FCodinterno write SetCodinterno;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbIndicadorImovel }

constructor TDbIndicadorImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDICADORIMOVEL';

   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True,'Receber ou Pagar');
   fInmdescricao := CreateCmDbField('INMDESCRICAO',ftString,True,False,False,True,'Descrição do Indicador');
   fIdindicadorimovel := CreateCmDbField('IDINDICADORIMOVEL',ftfloat,True,True,False,True,'');
   fFlgunidaut := CreateCmDbField('FLGUNIDAUT',ftfloat,False,False,False,True,'');
   fFlgtipovalor := CreateCmDbField('FLGTIPOVALOR',ftString,True,False,False,True,'Tipo de Valor');
   fCodinterno   := CreateCmDbField('CODINTERNO',ftfloat,False,False,False,True,'Código Interno');
end;

function TDbIndicadorImovel.Insert: Boolean;
begin

   fIdindicadorimovel.AsFloat := GetSequence('INDICADORIMOVEL');
   Result := Inherited Insert;

end;

function TDbIndicadorImovel.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbIndicadorImovel.SetCodinterno(const Value: TCmDbField);
begin
  FCodinterno := Value;
end;

procedure TDbIndicadorImovel.SetFlgtipovalor(const Value: TCmDbField);
begin
  FFlgtipovalor := Value;
end;

procedure TDbIndicadorImovel.SetFlgunidaut(const Value: TCmDbField);
begin
  FFlgunidaut := Value;
end;

procedure TDbIndicadorImovel.SetIdindicadorimovel(const Value: TCmDbField);
begin
  FIdindicadorimovel := Value;
end;

procedure TDbIndicadorImovel.SetInmdescricao(const Value: TCmDbField);
begin
  FInmdescricao := Value;
end;

procedure TDbIndicadorImovel.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



