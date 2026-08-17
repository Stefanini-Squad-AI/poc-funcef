{*******************************************************}
{ Analista Responsável: Helen V. Bianchi                }
{ Atualizado Em: 09/10/2011                             }
{ SOL: 136341 Kintana : 815095                          }
{*******************************************************}

unit uDbBaixaContraAlterador;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbBaixaContraAlterador = class(TCmDbObject)

  private
    FIdBaixaContra: TCmDbField;
    FCodAlterador: TCmDbField;
    FCodTipImovel: TCmDbField;
    FAcresDecres : TCmDbField;
    FIdModulo : TCmDbField;
    procedure SetIdBaixaContra(const Value: TCmDbField);
    procedure SetCodAlterador(const Value: TCmDbField);
    procedure SetCodTipImovel(const Value: TCmDbField);
    procedure SetAcresDecres(const Value: TCmDbField);
    procedure SetIdModulo(const Value: TCmDbField);
  public

     Property IdBaixaContra: TCmDbField read FIdBaixaContra write SetIdBaixaContra;
     Property CodTipImovel: TCmDbField read FCodTipImovel write SetCodTipImovel;
     Property CodAlterador: TCmDbField read FCodAlterador write SetCodAlterador;
     Property Acresdecres: TCmDbField read FAcresdecres write SetAcresdecres;
     Property IdModulo: TCmDbField read FIdModulo write SetIdModulo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbBaixaContraAlterador }

constructor TDbBaixaContraAlterador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BAIXACONTRAALTERADOR';

   fIdbaixacontra := CreateCmDbField('IDBAIXACONTRA',ftfloat,True,True,False,True,'');
   fCodtipimovel  := CreateCmDbField('CODTIPIMOVEL',ftString,True,False,False,True,'');
   fCodalterador  := CreateCmDbField('CODALTERADOR',ftfloat,True,False,False,True,'');
   fAcresdecres   := CreateCmDbField('ACRESDECRES',ftString,False,False,False,True,'');
   FIdModulo      := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
end;

function TDbBaixaContraAlterador.Insert: Boolean;
begin
   fIdbaixacontra.AsFloat := GetSequence('BAIXACONTRAALTERADOR');
   Result := Inherited Insert;
end;


function TDbBaixaContraAlterador.LoadFromDb: Boolean;
begin
     Result := Inherited LoadFromDB;
end;

procedure TDbBaixaContraAlterador.SetAcresDecres(const Value: TCmDbField);
begin
    FAcresDecres := Value;
end;

procedure TDbBaixaContraAlterador.SetCodAlterador(const Value: TCmDbField);
begin
    FCodAlterador := Value;
end;

procedure TDbBaixaContraAlterador.SetCodTipImovel(const Value: TCmDbField);
begin
    FCodTipImovel := Value;
end;

procedure TDbBaixaContraAlterador.SetIdBaixaContra(const Value: TCmDbField);
begin
   FIdBaixaContra := Value;
end;

procedure TDbBaixaContraAlterador.SetIdModulo(const Value: TCmDbField);
begin
   FIdModulo := Value;
end;

end.



