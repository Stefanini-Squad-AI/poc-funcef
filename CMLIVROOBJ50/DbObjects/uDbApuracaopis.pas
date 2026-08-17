{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 14/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbApuracaopis;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbApuracaopis = class(TCmDbObject)

  private
    FIdforcli: TCmDbField;
    FValorpis: TCmDbField;
    FAliquotacofins: TCmDbField;
    FNumnota: TCmDbField;
    FCodmodelo: TCmDbField;
    FAliquotapis: TCmDbField;
    FDatalancto: TCmDbField;
    FVlrtotal: TCmDbField;
    FComplemento: TCmDbField;
    FValorcofins: TCmDbField;
    FIdapuracaopis: TCmDbField;
    FFlgentradasaida: TCmDbField;
    FDataemissaonf: TCmDbField;
    FObservacao: TCmDbField;
    FIdpessoa: TCmDbField;
    FNUMNOTAFINAL: TCmDbField;
    procedure SetAliquotacofins(const Value: TCmDbField);
    procedure SetAliquotapis(const Value: TCmDbField);
    procedure SetCodmodelo(const Value: TCmDbField);
    procedure SetComplemento(const Value: TCmDbField);
    procedure SetDataemissaonf(const Value: TCmDbField);
    procedure SetDatalancto(const Value: TCmDbField);
    procedure SetFlgentradasaida(const Value: TCmDbField);
    procedure SetIdapuracaopis(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumnota(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetValorcofins(const Value: TCmDbField);
    procedure SetValorpis(const Value: TCmDbField);
    procedure SetVlrtotal(const Value: TCmDbField);
    procedure SetNUMNOTAFINAL(const Value: TCmDbField);

  public

     Property Vlrtotal: TCmDbField read FVlrtotal write SetVlrtotal;
     Property Valorpis: TCmDbField read FValorpis write SetValorpis;
     Property Valorcofins: TCmDbField read FValorcofins write SetValorcofins;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Numnota: TCmDbField read FNumnota write SetNumnota;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idapuracaopis: TCmDbField read FIdapuracaopis write SetIdapuracaopis;
     Property Flgentradasaida: TCmDbField read FFlgentradasaida write SetFlgentradasaida;
     Property Datalancto: TCmDbField read FDatalancto write SetDatalancto;
     Property Dataemissaonf: TCmDbField read FDataemissaonf write SetDataemissaonf;
     Property Complemento: TCmDbField read FComplemento write SetComplemento;
     Property Codmodelo: TCmDbField read FCodmodelo write SetCodmodelo;
     Property Aliquotapis: TCmDbField read FAliquotapis write SetAliquotapis;
     Property Aliquotacofins: TCmDbField read FAliquotacofins write SetAliquotacofins;
     property NUMNOTAFINAL : TCmDbField read FNUMNOTAFINAL write SetNUMNOTAFINAL;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbApuracaopis }

constructor TDbApuracaopis.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'APURACAOPIS';

   fVlrtotal := CreateCmDbField('VLRTOTAL',ftfloat,False,False,False,True,'');
   fValorpis := CreateCmDbField('VALORPIS',ftfloat,False,False,False,True,'');
   fValorcofins := CreateCmDbField('VALORCOFINS',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fNumnota := CreateCmDbField('NUMNOTA',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdapuracaopis := CreateCmDbField('IDAPURACAOPIS',ftfloat,True,True,False,True,'');
   fFlgentradasaida := CreateCmDbField('FLGENTRADASAIDA',ftString,False,False,False,True,'');
   fDatalancto := CreateCmDbField('DATALANCTO',ftDateTime,False,False,False,True,'');
   fDataemissaonf := CreateCmDbField('DATAEMISSAONF',ftDateTime,False,False,False,True,'');
   fComplemento := CreateCmDbField('COMPLEMENTO',ftString,False,False,False,True,'');
   fCodmodelo := CreateCmDbField('CODMODELO',ftString,False,False,False,True,'');
   fAliquotapis := CreateCmDbField('ALIQUOTAPIS',ftfloat,False,False,False,True,'');
   fAliquotacofins := CreateCmDbField('ALIQUOTACOFINS',ftfloat,False,False,False,True,'');
   FNUMNOTAFINAL :=  CreateCmDbField('NUMNOTAFINAL',ftfloat,False,False,False,True,'');
end;

function TDbApuracaopis.Insert: Boolean;
begin
   FIdapuracaopis.AsInteger := GetSequence('APURACAOPIS');
   Result := Inherited Insert;
end;


procedure TDbApuracaopis.SetAliquotacofins(const Value: TCmDbField);
begin
  FAliquotacofins := Value;
end;

procedure TDbApuracaopis.SetAliquotapis(const Value: TCmDbField);
begin
  FAliquotapis := Value;
end;

procedure TDbApuracaopis.SetCodmodelo(const Value: TCmDbField);
begin
  FCodmodelo := Value;
end;

procedure TDbApuracaopis.SetComplemento(const Value: TCmDbField);
begin
  FComplemento := Value;
end;

procedure TDbApuracaopis.SetDataemissaonf(const Value: TCmDbField);
begin
  FDataemissaonf := Value;
end;

procedure TDbApuracaopis.SetDatalancto(const Value: TCmDbField);
begin
  FDatalancto := Value;
end;

procedure TDbApuracaopis.SetFlgentradasaida(const Value: TCmDbField);
begin
  FFlgentradasaida := Value;
end;

procedure TDbApuracaopis.SetIdapuracaopis(const Value: TCmDbField);
begin
  FIdapuracaopis := Value;
end;

procedure TDbApuracaopis.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbApuracaopis.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbApuracaopis.SetNumnota(const Value: TCmDbField);
begin
  FNumnota := Value;
end;

procedure TDbApuracaopis.SetNUMNOTAFINAL(const Value: TCmDbField);
begin
  FNUMNOTAFINAL := Value;
end;

procedure TDbApuracaopis.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbApuracaopis.SetValorcofins(const Value: TCmDbField);
begin
  FValorcofins := Value;
end;

procedure TDbApuracaopis.SetValorpis(const Value: TCmDbField);
begin
  FValorpis := Value;
end;

procedure TDbApuracaopis.SetVlrtotal(const Value: TCmDbField);
begin
  FVlrtotal := Value;
end;

end.



