{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 13/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbItemOC;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbItemOC = class(TCmDbObject)

  private
    FValorUN: TCmDbField;
    FIdReservaOrcamen: TCmDbField;
    FCodArtigo: TCmDbField;
    FNumOC: TCmDbField;
    FCodMedida: TCmDbField;
    FQtdeRecebida: TCmDbField;
    FQtdePedida: TCmDbField;
    FObsItemOC: TCmDbField;
    FIdProdVari: TCmDbField;
    FIdItemOC: TCmDbField;
    FFlgItemAtendido: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetFlgItemAtendido(const Value: TCmDbField);
    procedure SetIdItemOC(const Value: TCmDbField);
    procedure SetIdProdVari(const Value: TCmDbField);
    procedure SetIdReservaOrcamen(const Value: TCmDbField);
    procedure SetNumOC(const Value: TCmDbField);
    procedure SetObsItemOC(const Value: TCmDbField);
    procedure SetQtdePedida(const Value: TCmDbField);
    procedure SetQtdeRecebida(const Value: TCmDbField);
    procedure SetValorUN(const Value: TCmDbField);

  public

     Property ValorUN          : TCmDbField read FValorUN write SetValorUN;
     Property QtdeRecebida     : TCmDbField read FQtdeRecebida write SetQtdeRecebida;
     Property QtdePedida       : TCmDbField read FQtdePedida write SetQtdePedida;
     Property ObsItemOC        : TCmDbField read FObsItemOC write SetObsItemOC;
     Property NumOC            : TCmDbField read FNumOC write SetNumOC;
     Property IdReservaOrcamen : TCmDbField read FIdReservaOrcamen write SetIdReservaOrcamen;
     Property IdProdVari       : TCmDbField read FIdProdVari write SetIdProdVari;
     Property IdItemOC         : TCmDbField read FIdItemOC write SetIdItemOC;
     Property FlgItemAtendido  : TCmDbField read FFlgItemAtendido write SetFlgItemAtendido;
     Property CodMedida        : TCmDbField read FCodMedida write SetCodMedida;
     Property CodArtigo        : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;     
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbItemOC }

constructor TDbItemOC.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMOC';

  fValorun          := CreateCmDbField('VALORUN'         ,ftfloat,False,False,False,True,'');
  fQtderecebida     := CreateCmDbField('QTDERECEBIDA'    ,ftfloat,False,False,False,True,'');
  fQtdepedida       := CreateCmDbField('QTDEPEDIDA'      ,ftfloat,False,False,False,True,'');
  fObsitemoc        := CreateCmDbField('OBSITEMOC'       ,ftString,False,False,False,True,'');
  fNumoc            := CreateCmDbField('NUMOC'           ,ftfloat,True,False,False,True,'');
  fIdreservaorcamen := CreateCmDbField('IDRESERVAORCAMEN',ftfloat,False,False,False,True,'');
  fIdprodvari       := CreateCmDbField('IDPRODVARI'      ,ftfloat,False,False,False,True,'');
  fIditemoc         := CreateCmDbField('IDITEMOC'        ,ftfloat,True,True,False,True,'');
  fFlgitematendido  := CreateCmDbField('FLGITEMATENDIDO' ,ftString,False,False,False,True,'');
  fCodmedida        := CreateCmDbField('CODMEDIDA'       ,ftString,True,False,False,True,'');
  fCodartigo        := CreateCmDbField('CODARTIGO'       ,ftString,True,False,False,True,'');
end;

function TDbItemOC.Insert: Boolean;
begin

   if fIditemoc.IsNull then fIditemoc.AsFloat   := GetSequence('ITEMOC');
   fObsItemOC.AsString := Copy(fObsItemOC.AsString,1,200);
   Result := Inherited Insert;

end;

function TDbItemOC.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbItemOC.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbItemOC.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbItemOC.SetFlgItemAtendido(const Value: TCmDbField);
begin
  FFlgItemAtendido := Value;
end;

procedure TDbItemOC.SetIdItemOC(const Value: TCmDbField);
begin
  FIdItemOC := Value;
end;

procedure TDbItemOC.SetIdProdVari(const Value: TCmDbField);
begin
  FIdProdVari := Value;
end;

procedure TDbItemOC.SetIdReservaOrcamen(const Value: TCmDbField);
begin
  FIdReservaOrcamen := Value;
end;

procedure TDbItemOC.SetNumOC(const Value: TCmDbField);
begin
  FNumOC := Value;
end;

procedure TDbItemOC.SetObsItemOC(const Value: TCmDbField);
begin
  FObsItemOC := Value;
end;

procedure TDbItemOC.SetQtdePedida(const Value: TCmDbField);
begin
  FQtdePedida := Value;
end;

procedure TDbItemOC.SetQtdeRecebida(const Value: TCmDbField);
begin
  FQtdeRecebida := Value;
end;

procedure TDbItemOC.SetValorUN(const Value: TCmDbField);
begin
  FValorUN := Value;
end;

function TDbItemOC.Update: Boolean;
begin
   fObsItemOC.AsString := Copy(fObsItemOC.AsString,1,200);

   Result := Inherited Update;
end;

end.



