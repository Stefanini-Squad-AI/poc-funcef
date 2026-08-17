{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Fábio Barros da Silva           }
{ Atualizado Em: 11/07/2002                             }
{                25/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbConfigFatNotaRecibo;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbConfigFatNotaRecibo = class(TCmDbObject)

  private
    FCodAlterador: TCmDbField;
    FFlgTipoFatura: TCmDbField;
    FOrigemcm: TCmDbField;
    FCodReduzido: TCmDbField;
    FIdTipoFatura: TCmDbField;
    FIdreports: TCmDbField;
    FDescTipoFatura: TCmDbField;
    procedure SetCodAlterador(const Value: TCmDbField);
    procedure SetCodReduzido(const Value: TCmDbField);
    procedure SetDescTipoFatura(const Value: TCmDbField);
    procedure SetFlgTipoFatura(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetIdTipoFatura(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);
  public

     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property IdTipoFatura: TCmDbField read FIdTipoFatura write SetIdTipoFatura;
     Property DescTipoFatura: TCmDbField read FDescTipoFatura write SetDescTipoFatura;
     Property FlgTipoFatura: TCmDbField read FFlgTipoFatura write SetFlgTipoFatura;
     Property CodAlterador: TCmDbField read FCodAlterador write SetCodAlterador;
     Property CodReduzido: TCmDbField read FCodReduzido write SetCodReduzido;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbModelopersonalisado }

constructor TDbConfigFatNotaRecibo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOFATURA';
  fOrigemcm       := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'');
  fIdreports      := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
  fIdTipoFatura   := CreateCmDbField('IDTIPOFATURA',ftfloat,True,True,False,True,'');
  fDesctipofatura := CreateCmDbField('DESCTIPOFATURA',ftString,False,False,False,True,'');
  fFlgtipofatura  := CreateCmDbField('FLGTIPOFATURA',ftString,False,False,False,True,'');
  fCodReduzido    := CreateCmDbField('CODREDUZIDO',ftString,False,False,False,True,'');
  fCodAlterador   := CreateCmDbField('CODALTERADOR',ftfloat,False,False,False,True,'');
end;

function TDbConfigFatNotaRecibo.Insert: Boolean;
begin

   fIdTipoFatura.AsFloat := GetSequence('TIPOFATURA');
   Result := Inherited Insert;

end;


procedure TDbConfigFatNotaRecibo.SetCodAlterador(const Value: TCmDbField);
begin
  FCodAlterador := Value;
end;

procedure TDbConfigFatNotaRecibo.SetCodReduzido(const Value: TCmDbField);
begin
  FCodReduzido := Value;
end;

procedure TDbConfigFatNotaRecibo.SetDescTipoFatura(
  const Value: TCmDbField);
begin
  FDescTipoFatura := Value;
end;

procedure TDbConfigFatNotaRecibo.SetFlgTipoFatura(const Value: TCmDbField);
begin
  FFlgTipoFatura := Value;
end;

procedure TDbConfigFatNotaRecibo.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbConfigFatNotaRecibo.SetIdTipoFatura(const Value: TCmDbField);
begin
  FIdTipoFatura := Value;
end;

procedure TDbConfigFatNotaRecibo.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

end.



