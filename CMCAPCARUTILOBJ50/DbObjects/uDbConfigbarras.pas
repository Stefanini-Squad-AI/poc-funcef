{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbConfigbarras;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbConfigbarras = class(TCmDbObject)

  private
    FNonebanco: TCmDbField;
    FCodmoeda: TCmDbField;
    FTamnossonumero: TCmDbField;
    FIdconfigbarras: TCmDbField;
    FNumerobanco: TCmDbField;
    FAceite: TCmDbField;
    FOrigemcm: TCmDbField;
    FDescconfigbarras: TCmDbField;
    FIdreports: TCmDbField;
    FEspeciedoc: TCmDbField;
    FCarteiracobr: TCmDbField;
    procedure SetAceite(const Value: TCmDbField);
    procedure SetCarteiracobr(const Value: TCmDbField);
    procedure SetCodmoeda(const Value: TCmDbField);
    procedure SetDescconfigbarras(const Value: TCmDbField);
    procedure SetEspeciedoc(const Value: TCmDbField);
    procedure SetIdconfigbarras(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetNonebanco(const Value: TCmDbField);
    procedure SetNumerobanco(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);
    procedure SetTamnossonumero(const Value: TCmDbField);

  public

     Property Tamnossonumero: TCmDbField read FTamnossonumero write SetTamnossonumero;
     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Numerobanco: TCmDbField read FNumerobanco write SetNumerobanco;
     Property Nonebanco: TCmDbField read FNonebanco write SetNonebanco;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idconfigbarras: TCmDbField read FIdconfigbarras write SetIdconfigbarras;
     Property Especiedoc: TCmDbField read FEspeciedoc write SetEspeciedoc;
     Property Descconfigbarras: TCmDbField read FDescconfigbarras write SetDescconfigbarras;
     Property Codmoeda: TCmDbField read FCodmoeda write SetCodmoeda;
     Property Carteiracobr: TCmDbField read FCarteiracobr write SetCarteiracobr;
     Property Aceite: TCmDbField read FAceite write SetAceite;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbConfigbarras }

constructor TDbConfigbarras.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFIGBARRAS';

   fTamnossonumero := CreateCmDbField('TAMNOSSONUMERO',ftfloat,False,False,False,True,'');
   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'');
   fNumerobanco := CreateCmDbField('NUMEROBANCO',ftString,False,False,False,True,'');
   fNonebanco := CreateCmDbField('NONEBANCO',ftString,False,False,False,True,'');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
   fIdconfigbarras := CreateCmDbField('IDCONFIGBARRAS',ftfloat,True,True,False,True,'');
   fEspeciedoc := CreateCmDbField('ESPECIEDOC',ftString,False,False,False,True,'');
   fDescconfigbarras := CreateCmDbField('DESCCONFIGBARRAS',ftString,False,False,False,True,'');
   fCodmoeda := CreateCmDbField('CODMOEDA',ftfloat,False,False,False,True,'');
   fCarteiracobr := CreateCmDbField('CARTEIRACOBR',ftString,False,False,False,True,'');
   fAceite := CreateCmDbField('ACEITE',ftString,False,False,False,True,'');
end;

function TDbConfigbarras.Insert: Boolean;
begin

   fIdconfigbarras.AsFloat := GetSequence('CONFIGBARRAS');
   Result := Inherited Insert;

end;

function TDbConfigbarras.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbConfigbarras.SetAceite(const Value: TCmDbField);
begin
  FAceite := Value;
end;

procedure TDbConfigbarras.SetCarteiracobr(const Value: TCmDbField);
begin
  FCarteiracobr := Value;
end;

procedure TDbConfigbarras.SetCodmoeda(const Value: TCmDbField);
begin
  FCodmoeda := Value;
end;

procedure TDbConfigbarras.SetDescconfigbarras(const Value: TCmDbField);
begin
  FDescconfigbarras := Value;
end;

procedure TDbConfigbarras.SetEspeciedoc(const Value: TCmDbField);
begin
  FEspeciedoc := Value;
end;

procedure TDbConfigbarras.SetIdconfigbarras(const Value: TCmDbField);
begin
  FIdconfigbarras := Value;
end;

procedure TDbConfigbarras.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbConfigbarras.SetNonebanco(const Value: TCmDbField);
begin
  FNonebanco := Value;
end;

procedure TDbConfigbarras.SetNumerobanco(const Value: TCmDbField);
begin
  FNumerobanco := Value;
end;

procedure TDbConfigbarras.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

procedure TDbConfigbarras.SetTamnossonumero(const Value: TCmDbField);
begin
  FTamnossonumero := Value;
end;

end.



