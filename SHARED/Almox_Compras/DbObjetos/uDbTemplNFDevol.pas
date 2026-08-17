{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 18/01/2003                             }
{                                                       }
{*******************************************************}

unit uDbTemplNFDevol;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTemplNFDevol = class(TCmDbObject)

  private
    FFrete: TCmDbField;
    FIPIItem: TCmDbField;
    FSeguro: TCmDbField;
    FIcmsSubstituicao: TCmDbField;
    FIcmsNota: TCmDbField;
    FFlgCondensado: TCmDbField;
    FDescTemplNFDevol: TCmDbField;
    FIcmsItem: TCmDbField;
    FIdDocumento: TCmDbField;
    FIdTemplNFDevol: TCmDbField;
    FOutrasDesp: TCmDbField;
    procedure SetDescTemplNFDevol(const Value: TCmDbField);
    procedure SetFlgCondensado(const Value: TCmDbField);
    procedure SetFrete(const Value: TCmDbField);
    procedure SetIcmsItem(const Value: TCmDbField);
    procedure SetIcmsNota(const Value: TCmDbField);
    procedure SetIcmsSubstituicao(const Value: TCmDbField);
    procedure SetIdDocumento(const Value: TCmDbField);
    procedure SetIdTemplNFDevol(const Value: TCmDbField);
    procedure SetIPIItem(const Value: TCmDbField);
    procedure SetOutrasDesp(const Value: TCmDbField);
    procedure SetSeguro(const Value: TCmDbField);

  public
     Property Seguro: TCmDbField read FSeguro write SetSeguro;
     Property OutrasDesp         : TCmDbField read FOutrasDesp write SetOutrasDesp;
     Property IPIItem            : TCmDbField read FIPIItem write SetIPIItem;
     Property IdTemplNFDevol     : TCmDbField read FIdTemplNFDevol write SetIdTemplNFDevol;
     Property IdDocumento        : TCmDbField read FIdDocumento write SetIdDocumento;
     Property IcmsSubstituicao   : TCmDbField read FIcmsSubstituicao write SetIcmsSubstituicao;
     Property IcmsNota           : TCmDbField read FIcmsNota write SetIcmsNota;
     Property IcmsItem           : TCmDbField read FIcmsItem write SetIcmsItem;
     Property Frete              : TCmDbField read FFrete write SetFrete;
     Property FlgCondensado      : TCmDbField read FFlgCondensado write SetFlgCondensado;
     Property DescTemplNFDevol   : TCmDbField read FDescTemplNFDevol write SetDescTemplNFDevol;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTemplNFDevol }

constructor TDbTemplNFDevol.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TEMPLNFDEVOL';

   fSeguro           := CreateCmDbField('SEGURO',ftfloat,False,False,False,True,'');
   fOutrasdesp       := CreateCmDbField('OUTRASDESP',ftfloat,False,False,False,True,'');
   fIpiitem          := CreateCmDbField('IPIITEM',ftfloat,False,False,False,True,'');
   fIdtemplnfdevol   := CreateCmDbField('IDTEMPLNFDEVOL',ftfloat,True,True,False,True,'');
   fIddocumento      := CreateCmDbField('IDDOCUMENTO',ftfloat,False,False,False,True,'');
   fIcmssubstituicao := CreateCmDbField('ICMSSUBSTITUICAO',ftfloat,False,False,False,True,'');
   fIcmsnota         := CreateCmDbField('ICMSNOTA',ftfloat,False,False,False,True,'');
   fIcmsitem         := CreateCmDbField('ICMSITEM',ftfloat,False,False,False,True,'');
   fFrete            := CreateCmDbField('FRETE',ftfloat,False,False,False,True,'');
   fFlgcondensado    := CreateCmDbField('FLGCONDENSADO',ftString,False,False,False,True,'');
   fDesctemplnfdevol := CreateCmDbField('DESCTEMPLNFDEVOL',ftString,True,False,False,True,'');
end;

function TDbTemplNFDevol.Insert: Boolean;
begin
   fIdtemplnfdevol.AsFloat := GetSequence('TEMPLNFDEVOL');

   Result := Inherited Insert;
end;


procedure TDbTemplNFDevol.SetDescTemplNFDevol(const Value: TCmDbField);
begin
  FDescTemplNFDevol := Value;
end;

procedure TDbTemplNFDevol.SetFlgCondensado(const Value: TCmDbField);
begin
  FFlgCondensado := Value;
end;

procedure TDbTemplNFDevol.SetFrete(const Value: TCmDbField);
begin
  FFrete := Value;
end;

procedure TDbTemplNFDevol.SetIcmsItem(const Value: TCmDbField);
begin
  FIcmsItem := Value;
end;

procedure TDbTemplNFDevol.SetIcmsNota(const Value: TCmDbField);
begin
  FIcmsNota := Value;
end;

procedure TDbTemplNFDevol.SetIcmsSubstituicao(const Value: TCmDbField);
begin
  FIcmsSubstituicao := Value;
end;

procedure TDbTemplNFDevol.SetIdDocumento(const Value: TCmDbField);
begin
  FIdDocumento := Value;
end;

procedure TDbTemplNFDevol.SetIdTemplNFDevol(const Value: TCmDbField);
begin
  FIdTemplNFDevol := Value;
end;

procedure TDbTemplNFDevol.SetIPIItem(const Value: TCmDbField);
begin
  FIPIItem := Value;
end;

procedure TDbTemplNFDevol.SetOutrasDesp(const Value: TCmDbField);
begin
  FOutrasDesp := Value;
end;

procedure TDbTemplNFDevol.SetSeguro(const Value: TCmDbField);
begin
  FSeguro := Value;
end;

end.



