//******************************************************************************
// Data      : 27/08/2007
// Código    : AL_18
// Pendencia : 26199
// Motivo    : Implementações da HistCartinv
//******************************************************************************

unit uDbHistcartinv;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistcartinv = class(TCmDbObject)

  private
    FIdcarteirainvest: TCmDbField;
    FHistmovcartinv: TCmDbField;
    FQtdemovinvcart: TCmDbField;
    FSaldoagio: TCmDbField;
    FVlriofprov: TCmDbField;
    FIdcorretvalores: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FMovimaqui: TCmDbField;
    FPlncodigo: TCmDbField;
    FVlrtotliquidar: TCmDbField;
    FIdoperacaoinvest: TCmDbField;
    FSaldopremio: TCmDbField;
    FIdmodulo: TCmDbField;
    FVlrmovcartinv: TCmDbField;
    FIdhistcartinv: TCmDbField;
    FDatamovcartinv: TCmDbField;
    FVlrirprov: TCmDbField;
    FSaldocotascartinv: TCmDbField;
    FNaturmovcartinv: TCmDbField;
    FRecpag: TCmDbField;
    FSaldovlrcartinv: TCmDbField;
    FFlgcalcsaldo: TCmDbField;
    FVlrirapu: TCmDbField;
    FTipmovcartinv: TCmDbField;
    FVlriofapu: TCmDbField;
    FSaldoiofapu: TCmDbField;
    FSaldoqtdecpmf: TCmDbField;
    FVlrcpmfapu: TCmDbField;
    FIdlancimovel: TCmDbField;
    FIdinvestimento: TCmDbField;
    FIddespcartinvest: TCmDbField;
    FIdlote: TCmDbField;
    FCotasmovcartinv: TCmDbField;
    FVlrvariacao: TCmDbField;
    FVlrcpmfprov: TCmDbField;
    FCodtiptitulo: TCmDbField;
    FSaldoirapu: TCmDbField;
    FSaldocar: TCmDbField;
    FVlrjuros: TCmDbField;
    FVlragio: TCmDbField;
    FVlrprovperda: TCmDbField;
    FIddespoperinvest: TCmDbField;
    FNaturmovoper: TCmDbField;
    FIdempresaprop: TCmDbField;
    FSaldoqtdeinvcart: TCmDbField;
    FSaldoirprov: TCmDbField;
    FIdindiceatu: TCmDbField;
    FSaldovlrinvcart: TCmDbField;
    FPlano: TCmDbField;
    FSaldoaqui: TCmDbField;
    FIdcarteiragerenc: TCmDbField;
    FMovimatu: TCmDbField;
    FNumlancto: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FMovimcar: TCmDbField;
    FSaldojuros: TCmDbField;
    FSaldoatu: TCmDbField;
    FSaldovariacao: TCmDbField;
    FFlgcustodia: TCmDbField;
    FSaldoprovperda: TCmDbField;
    FVlrpremio: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FSaldorend: TCmDbField;
    FSaldoiofprov: TCmDbField;
    FCoddocumento: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodtiptitulo(const Value: TCmDbField);
    procedure SetCotasmovcartinv(const Value: TCmDbField);
    procedure SetDatamovcartinv(const Value: TCmDbField);
    procedure SetFlgcalcsaldo(const Value: TCmDbField);
    procedure SetFlgcustodia(const Value: TCmDbField);
    procedure SetHistmovcartinv(const Value: TCmDbField);
    procedure SetIdcarteiragerenc(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcorretvalores(const Value: TCmDbField);
    procedure SetIddespcartinvest(const Value: TCmDbField);
    procedure SetIddespoperinvest(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdhistcartinv(const Value: TCmDbField);
    procedure SetIdindiceatu(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdlancimovel(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdoperacaoinvest(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetMovimaqui(const Value: TCmDbField);
    procedure SetMovimatu(const Value: TCmDbField);
    procedure SetMovimcar(const Value: TCmDbField);
    procedure SetNaturmovcartinv(const Value: TCmDbField);
    procedure SetNaturmovoper(const Value: TCmDbField);
    procedure SetNumlancto(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetQtdemovinvcart(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetSaldoagio(const Value: TCmDbField);
    procedure SetSaldoaqui(const Value: TCmDbField);
    procedure SetSaldoatu(const Value: TCmDbField);
    procedure SetSaldocar(const Value: TCmDbField);
    procedure SetSaldocotascartinv(const Value: TCmDbField);
    procedure SetSaldoiofapu(const Value: TCmDbField);
    procedure SetSaldoiofprov(const Value: TCmDbField);
    procedure SetSaldoirapu(const Value: TCmDbField);
    procedure SetSaldoirprov(const Value: TCmDbField);
    procedure SetSaldojuros(const Value: TCmDbField);
    procedure SetSaldopremio(const Value: TCmDbField);
    procedure SetSaldoprovperda(const Value: TCmDbField);
    procedure SetSaldoqtdecpmf(const Value: TCmDbField);
    procedure SetSaldoqtdeinvcart(const Value: TCmDbField);
    procedure SetSaldorend(const Value: TCmDbField);
    procedure SetSaldovariacao(const Value: TCmDbField);
    procedure SetSaldovlrcartinv(const Value: TCmDbField);
    procedure SetSaldovlrinvcart(const Value: TCmDbField);
    procedure SetTipmovcartinv(const Value: TCmDbField);
    procedure SetVlragio(const Value: TCmDbField);
    procedure SetVlrcpmfapu(const Value: TCmDbField);
    procedure SetVlrcpmfprov(const Value: TCmDbField);
    procedure SetVlriofapu(const Value: TCmDbField);
    procedure SetVlriofprov(const Value: TCmDbField);
    procedure SetVlrirapu(const Value: TCmDbField);
    procedure SetVlrirprov(const Value: TCmDbField);
    procedure SetVlrjuros(const Value: TCmDbField);
    procedure SetVlrmovcartinv(const Value: TCmDbField);
    procedure SetVlrpremio(const Value: TCmDbField);
    procedure SetVlrprovperda(const Value: TCmDbField);
    procedure SetVlrtotliquidar(const Value: TCmDbField);
    procedure SetVlrvariacao(const Value: TCmDbField);

  public

     Property Vlrvariacao: TCmDbField read FVlrvariacao write SetVlrvariacao;
     Property Vlrtotliquidar: TCmDbField read FVlrtotliquidar write SetVlrtotliquidar;
     Property Vlrprovperda: TCmDbField read FVlrprovperda write SetVlrprovperda;
     Property Vlrpremio: TCmDbField read FVlrpremio write SetVlrpremio;
     Property Vlrmovcartinv: TCmDbField read FVlrmovcartinv write SetVlrmovcartinv;
     Property Vlrjuros: TCmDbField read FVlrjuros write SetVlrjuros;
     Property Vlrirprov: TCmDbField read FVlrirprov write SetVlrirprov;
     Property Vlrirapu: TCmDbField read FVlrirapu write SetVlrirapu;
     Property Vlriofprov: TCmDbField read FVlriofprov write SetVlriofprov;
     Property Vlriofapu: TCmDbField read FVlriofapu write SetVlriofapu;
     Property Vlrcpmfprov: TCmDbField read FVlrcpmfprov write SetVlrcpmfprov;
     Property Vlrcpmfapu: TCmDbField read FVlrcpmfapu write SetVlrcpmfapu;
     Property Vlragio: TCmDbField read FVlragio write SetVlragio;
     Property Tipmovcartinv: TCmDbField read FTipmovcartinv write SetTipmovcartinv;
     Property Saldovlrinvcart: TCmDbField read FSaldovlrinvcart write SetSaldovlrinvcart;
     Property Saldovlrcartinv: TCmDbField read FSaldovlrcartinv write SetSaldovlrcartinv;
     Property Saldovariacao: TCmDbField read FSaldovariacao write SetSaldovariacao;
     Property Saldorend: TCmDbField read FSaldorend write SetSaldorend;
     Property Saldoqtdeinvcart: TCmDbField read FSaldoqtdeinvcart write SetSaldoqtdeinvcart;
     Property Saldoqtdecpmf: TCmDbField read FSaldoqtdecpmf write SetSaldoqtdecpmf;
     Property Saldoprovperda: TCmDbField read FSaldoprovperda write SetSaldoprovperda;
     Property Saldopremio: TCmDbField read FSaldopremio write SetSaldopremio;
     Property Saldojuros: TCmDbField read FSaldojuros write SetSaldojuros;
     Property Saldoirprov: TCmDbField read FSaldoirprov write SetSaldoirprov;
     Property Saldoirapu: TCmDbField read FSaldoirapu write SetSaldoirapu;
     Property Saldoiofprov: TCmDbField read FSaldoiofprov write SetSaldoiofprov;
     Property Saldoiofapu: TCmDbField read FSaldoiofapu write SetSaldoiofapu;
     Property Saldocotascartinv: TCmDbField read FSaldocotascartinv write SetSaldocotascartinv;
     Property Saldocar: TCmDbField read FSaldocar write SetSaldocar;
     Property Saldoatu: TCmDbField read FSaldoatu write SetSaldoatu;
     Property Saldoaqui: TCmDbField read FSaldoaqui write SetSaldoaqui;
     Property Saldoagio: TCmDbField read FSaldoagio write SetSaldoagio;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Qtdemovinvcart: TCmDbField read FQtdemovinvcart write SetQtdemovinvcart;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Numlancto: TCmDbField read FNumlancto write SetNumlancto;
     Property Naturmovoper: TCmDbField read FNaturmovoper write SetNaturmovoper;
     Property Naturmovcartinv: TCmDbField read FNaturmovcartinv write SetNaturmovcartinv;
     Property Movimcar: TCmDbField read FMovimcar write SetMovimcar;
     Property Movimatu: TCmDbField read FMovimatu write SetMovimatu;
     Property Movimaqui: TCmDbField read FMovimaqui write SetMovimaqui;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idoperacaoinvest: TCmDbField read FIdoperacaoinvest write SetIdoperacaoinvest;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Idlancimovel: TCmDbField read FIdlancimovel write SetIdlancimovel;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idindiceatu: TCmDbField read FIdindiceatu write SetIdindiceatu;
     Property Idhistcartinv: TCmDbField read FIdhistcartinv write SetIdhistcartinv;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Iddespoperinvest: TCmDbField read FIddespoperinvest write SetIddespoperinvest;
     Property Iddespcartinvest: TCmDbField read FIddespcartinvest write SetIddespcartinvest;
     Property Idcorretvalores: TCmDbField read FIdcorretvalores write SetIdcorretvalores;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Idcarteiragerenc: TCmDbField read FIdcarteiragerenc write SetIdcarteiragerenc;
     Property Histmovcartinv: TCmDbField read FHistmovcartinv write SetHistmovcartinv;
     Property Flgcustodia: TCmDbField read FFlgcustodia write SetFlgcustodia;
     Property Flgcalcsaldo: TCmDbField read FFlgcalcsaldo write SetFlgcalcsaldo;
     Property Datamovcartinv: TCmDbField read FDatamovcartinv write SetDatamovcartinv;
     Property Cotasmovcartinv: TCmDbField read FCotasmovcartinv write SetCotasmovcartinv;
     Property Codtiptitulo: TCmDbField read FCodtiptitulo write SetCodtiptitulo;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistcartinv }

constructor TDbHistcartinv.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTCARTINV';

   fVlrvariacao := CreateCmDbField('VLRVARIACAO',ftfloat,False,False,False,True,'');
   fVlrtotliquidar := CreateCmDbField('VLRTOTLIQUIDAR',ftfloat,False,False,False,True,'');
   fVlrprovperda := CreateCmDbField('VLRPROVPERDA',ftfloat,False,False,False,True,'');
   fVlrpremio := CreateCmDbField('VLRPREMIO',ftfloat,False,False,False,True,'');
   fVlrmovcartinv := CreateCmDbField('VLRMOVCARTINV',ftfloat,False,False,False,True,'');
   fVlrjuros := CreateCmDbField('VLRJUROS',ftfloat,False,False,False,True,'');
   fVlrirprov := CreateCmDbField('VLRIRPROV',ftfloat,False,False,False,True,'');
   fVlrirapu := CreateCmDbField('VLRIRAPU',ftfloat,False,False,False,True,'');
   fVlriofprov := CreateCmDbField('VLRIOFPROV',ftfloat,False,False,False,True,'');
   fVlriofapu := CreateCmDbField('VLRIOFAPU',ftfloat,False,False,False,True,'');
   fVlrcpmfprov := CreateCmDbField('VLRCPMFPROV',ftfloat,False,False,False,True,'');
   fVlrcpmfapu := CreateCmDbField('VLRCPMFAPU',ftfloat,False,False,False,True,'');
   fVlragio := CreateCmDbField('VLRAGIO',ftfloat,False,False,False,True,'');
   fTipmovcartinv := CreateCmDbField('TIPMOVCARTINV',ftString,False,False,False,True,'');
   fSaldovlrinvcart := CreateCmDbField('SALDOVLRINVCART',ftfloat,False,False,False,True,'');
   fSaldovlrcartinv := CreateCmDbField('SALDOVLRCARTINV',ftfloat,False,False,False,True,'');
   fSaldovariacao := CreateCmDbField('SALDOVARIACAO',ftfloat,False,False,False,True,'');
   fSaldorend := CreateCmDbField('SALDOREND',ftfloat,False,False,False,True,'');
   fSaldoqtdeinvcart := CreateCmDbField('SALDOQTDEINVCART',ftfloat,False,False,False,True,'');
   fSaldoqtdecpmf := CreateCmDbField('SALDOQTDECPMF',ftfloat,False,False,False,True,'');
   fSaldoprovperda := CreateCmDbField('SALDOPROVPERDA',ftfloat,False,False,False,True,'');
   fSaldopremio := CreateCmDbField('SALDOPREMIO',ftfloat,False,False,False,True,'');
   fSaldojuros := CreateCmDbField('SALDOJUROS',ftfloat,False,False,False,True,'');
   fSaldoirprov := CreateCmDbField('SALDOIRPROV',ftfloat,False,False,False,True,'');
   fSaldoirapu := CreateCmDbField('SALDOIRAPU',ftfloat,False,False,False,True,'');
   fSaldoiofprov := CreateCmDbField('SALDOIOFPROV',ftfloat,False,False,False,True,'');
   fSaldoiofapu := CreateCmDbField('SALDOIOFAPU',ftfloat,False,False,False,True,'');
   fSaldocotascartinv := CreateCmDbField('SALDOCOTASCARTINV',ftfloat,False,False,False,True,'');
   fSaldocar := CreateCmDbField('SALDOCAR',ftfloat,False,False,False,True,'');
   fSaldoatu := CreateCmDbField('SALDOATU',ftfloat,False,False,False,True,'');
   fSaldoaqui := CreateCmDbField('SALDOAQUI',ftfloat,False,False,False,True,'');
   fSaldoagio := CreateCmDbField('SALDOAGIO',ftfloat,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fQtdemovinvcart := CreateCmDbField('QTDEMOVINVCART',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fNumlancto := CreateCmDbField('NUMLANCTO',ftfloat,False,False,False,True,'');
   fNaturmovoper := CreateCmDbField('NATURMOVOPER',ftString,False,False,False,True,'');
   fNaturmovcartinv := CreateCmDbField('NATURMOVCARTINV',ftString,False,False,False,True,'');
   fMovimcar := CreateCmDbField('MOVIMCAR',ftfloat,False,False,False,True,'');
   fMovimatu := CreateCmDbField('MOVIMATU',ftfloat,False,False,False,True,'');
   fMovimaqui := CreateCmDbField('MOVIMAQUI',ftfloat,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'');
   fIdoperacaoinvest := CreateCmDbField('IDOPERACAOINVEST',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdlote := CreateCmDbField('IDLOTE',ftString,False,False,False,True,'');
   fIdlancimovel := CreateCmDbField('IDLANCIMOVEL',ftfloat,False,False,False,True,'');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'');
   fIdindiceatu := CreateCmDbField('IDINDICEATU',ftfloat,False,False,False,True,'');
   fIdhistcartinv := CreateCmDbField('IDHISTCARTINV',ftfloat,True,True,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIddespoperinvest := CreateCmDbField('IDDESPOPERINVEST',ftfloat,False,False,False,True,'');
   fIddespcartinvest := CreateCmDbField('IDDESPCARTINVEST',ftfloat,False,False,False,True,'');
   fIdcorretvalores := CreateCmDbField('IDCORRETVALORES',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,True,False,False,True,'');
   fIdcarteiragerenc := CreateCmDbField('IDCARTEIRAGERENC',ftfloat,False,False,False,True,'');
   fHistmovcartinv := CreateCmDbField('HISTMOVCARTINV',ftString,False,False,False,True,'');
   fFlgcustodia := CreateCmDbField('FLGCUSTODIA',ftString,False,False,False,True,'');
   fFlgcalcsaldo := CreateCmDbField('FLGCALCSALDO',ftString,False,False,False,True,'');
   fDatamovcartinv := CreateCmDbField('DATAMOVCARTINV',ftDateTime,False,False,False,True,'');
   fCotasmovcartinv := CreateCmDbField('COTASMOVCARTINV',ftfloat,False,False,False,True,'');
   fCodtiptitulo := CreateCmDbField('CODTIPTITULO',ftString,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
end;

function TDbHistcartinv.Insert: Boolean;
begin

   fIdhistcartinv.AsFloat := GetSequence('HISTCARTINV');
   Result := Inherited Insert;

end;


procedure TDbHistcartinv.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbHistcartinv.SetCodtiptitulo(const Value: TCmDbField);
begin
  FCodtiptitulo := Value;
end;

procedure TDbHistcartinv.SetCotasmovcartinv(const Value: TCmDbField);
begin
  FCotasmovcartinv := Value;
end;

procedure TDbHistcartinv.SetDatamovcartinv(const Value: TCmDbField);
begin
  FDatamovcartinv := Value;
end;

procedure TDbHistcartinv.SetFlgcalcsaldo(const Value: TCmDbField);
begin
  FFlgcalcsaldo := Value;
end;

procedure TDbHistcartinv.SetFlgcustodia(const Value: TCmDbField);
begin
  FFlgcustodia := Value;
end;

procedure TDbHistcartinv.SetHistmovcartinv(const Value: TCmDbField);
begin
  FHistmovcartinv := Value;
end;

procedure TDbHistcartinv.SetIdcarteiragerenc(const Value: TCmDbField);
begin
  FIdcarteiragerenc := Value;
end;

procedure TDbHistcartinv.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbHistcartinv.SetIdcorretvalores(const Value: TCmDbField);
begin
  FIdcorretvalores := Value;
end;

procedure TDbHistcartinv.SetIddespcartinvest(const Value: TCmDbField);
begin
  FIddespcartinvest := Value;
end;

procedure TDbHistcartinv.SetIddespoperinvest(const Value: TCmDbField);
begin
  FIddespoperinvest := Value;
end;

procedure TDbHistcartinv.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbHistcartinv.SetIdhistcartinv(const Value: TCmDbField);
begin
  FIdhistcartinv := Value;
end;

procedure TDbHistcartinv.SetIdindiceatu(const Value: TCmDbField);
begin
  FIdindiceatu := Value;
end;

procedure TDbHistcartinv.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbHistcartinv.SetIdlancimovel(const Value: TCmDbField);
begin
  FIdlancimovel := Value;
end;

procedure TDbHistcartinv.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbHistcartinv.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbHistcartinv.SetIdoperacaoinvest(const Value: TCmDbField);
begin
  FIdoperacaoinvest := Value;
end;

procedure TDbHistcartinv.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbHistcartinv.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbHistcartinv.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbHistcartinv.SetMovimaqui(const Value: TCmDbField);
begin
  FMovimaqui := Value;
end;

procedure TDbHistcartinv.SetMovimatu(const Value: TCmDbField);
begin
  FMovimatu := Value;
end;

procedure TDbHistcartinv.SetMovimcar(const Value: TCmDbField);
begin
  FMovimcar := Value;
end;

procedure TDbHistcartinv.SetNaturmovcartinv(const Value: TCmDbField);
begin
  FNaturmovcartinv := Value;
end;

procedure TDbHistcartinv.SetNaturmovoper(const Value: TCmDbField);
begin
  FNaturmovoper := Value;
end;

procedure TDbHistcartinv.SetNumlancto(const Value: TCmDbField);
begin
  FNumlancto := Value;
end;

procedure TDbHistcartinv.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbHistcartinv.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbHistcartinv.SetQtdemovinvcart(const Value: TCmDbField);
begin
  FQtdemovinvcart := Value;
end;

procedure TDbHistcartinv.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbHistcartinv.SetSaldoagio(const Value: TCmDbField);
begin
  FSaldoagio := Value;
end;

procedure TDbHistcartinv.SetSaldoaqui(const Value: TCmDbField);
begin
  FSaldoaqui := Value;
end;

procedure TDbHistcartinv.SetSaldoatu(const Value: TCmDbField);
begin
  FSaldoatu := Value;
end;

procedure TDbHistcartinv.SetSaldocar(const Value: TCmDbField);
begin
  FSaldocar := Value;
end;

procedure TDbHistcartinv.SetSaldocotascartinv(const Value: TCmDbField);
begin
  FSaldocotascartinv := Value;
end;

procedure TDbHistcartinv.SetSaldoiofapu(const Value: TCmDbField);
begin
  FSaldoiofapu := Value;
end;

procedure TDbHistcartinv.SetSaldoiofprov(const Value: TCmDbField);
begin
  FSaldoiofprov := Value;
end;

procedure TDbHistcartinv.SetSaldoirapu(const Value: TCmDbField);
begin
  FSaldoirapu := Value;
end;

procedure TDbHistcartinv.SetSaldoirprov(const Value: TCmDbField);
begin
  FSaldoirprov := Value;
end;

procedure TDbHistcartinv.SetSaldojuros(const Value: TCmDbField);
begin
  FSaldojuros := Value;
end;

procedure TDbHistcartinv.SetSaldopremio(const Value: TCmDbField);
begin
  FSaldopremio := Value;
end;

procedure TDbHistcartinv.SetSaldoprovperda(const Value: TCmDbField);
begin
  FSaldoprovperda := Value;
end;

procedure TDbHistcartinv.SetSaldoqtdecpmf(const Value: TCmDbField);
begin
  FSaldoqtdecpmf := Value;
end;

procedure TDbHistcartinv.SetSaldoqtdeinvcart(const Value: TCmDbField);
begin
  FSaldoqtdeinvcart := Value;
end;

procedure TDbHistcartinv.SetSaldorend(const Value: TCmDbField);
begin
  FSaldorend := Value;
end;

procedure TDbHistcartinv.SetSaldovariacao(const Value: TCmDbField);
begin
  FSaldovariacao := Value;
end;

procedure TDbHistcartinv.SetSaldovlrcartinv(const Value: TCmDbField);
begin
  FSaldovlrcartinv := Value;
end;

procedure TDbHistcartinv.SetSaldovlrinvcart(const Value: TCmDbField);
begin
  FSaldovlrinvcart := Value;
end;

procedure TDbHistcartinv.SetTipmovcartinv(const Value: TCmDbField);
begin
  FTipmovcartinv := Value;
end;

procedure TDbHistcartinv.SetVlragio(const Value: TCmDbField);
begin
  FVlragio := Value;
end;

procedure TDbHistcartinv.SetVlrcpmfapu(const Value: TCmDbField);
begin
  FVlrcpmfapu := Value;
end;

procedure TDbHistcartinv.SetVlrcpmfprov(const Value: TCmDbField);
begin
  FVlrcpmfprov := Value;
end;

procedure TDbHistcartinv.SetVlriofapu(const Value: TCmDbField);
begin
  FVlriofapu := Value;
end;

procedure TDbHistcartinv.SetVlriofprov(const Value: TCmDbField);
begin
  FVlriofprov := Value;
end;

procedure TDbHistcartinv.SetVlrirapu(const Value: TCmDbField);
begin
  FVlrirapu := Value;
end;

procedure TDbHistcartinv.SetVlrirprov(const Value: TCmDbField);
begin
  FVlrirprov := Value;
end;

procedure TDbHistcartinv.SetVlrjuros(const Value: TCmDbField);
begin
  FVlrjuros := Value;
end;

procedure TDbHistcartinv.SetVlrmovcartinv(const Value: TCmDbField);
begin
  FVlrmovcartinv := Value;
end;

procedure TDbHistcartinv.SetVlrpremio(const Value: TCmDbField);
begin
  FVlrpremio := Value;
end;

procedure TDbHistcartinv.SetVlrprovperda(const Value: TCmDbField);
begin
  FVlrprovperda := Value;
end;

procedure TDbHistcartinv.SetVlrtotliquidar(const Value: TCmDbField);
begin
  FVlrtotliquidar := Value;
end;

procedure TDbHistcartinv.SetVlrvariacao(const Value: TCmDbField);
begin
  FVlrvariacao := Value;
end;

end.



