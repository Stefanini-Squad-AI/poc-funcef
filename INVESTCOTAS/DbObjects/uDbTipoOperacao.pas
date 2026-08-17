{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 02/09/2005                             }
{                                                       }
{*******************************************************}

unit uDbTipoOperacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoOperacao = class(TCmDbObject)

  private
    FFlgcontainvest: TCmDbField;
    FDesctipooperacao: TCmDbField;
    FFlgperc: TCmDbField;
    FFlgcotarecdes: TCmDbField;
    FFlgformapagrec: TCmDbField;
    FTipomovto: TCmDbField;
    FFlgdatavencimento: TCmDbField;
    FRecpag: TCmDbField;
    FFlgdatacom: TCmDbField;
    FTipcredor: TCmDbField;
    FFlgisentoir: TCmDbField;
    FFlgdataex: TCmDbField;
    FFlginvorigem: TCmDbField;
    FFlgtratair: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FFlggeracontab: TCmDbField;
    FFlgmovcota: TCmDbField;
    FFlgdivacao: TCmDbField;
    FFlggeracaf: TCmDbField;
    FMotbloqcartdest: TCmDbField;
    FFlgrentabilidade: TCmDbField;
    FTipsaldocartdest: TCmDbField;
    FFlgopgerenc: TCmDbField;
    FFlggeracapcar: TCmDbField;
    FFlgparidade: TCmDbField;
    FStaativo: TCmDbField;
    FTipocustodia: TCmDbField;
    FVencimento: TCmDbField;
    FFlgprzbolsa: TCmDbField;
    FMotbloqcartorig: TCmDbField;
    FIdmercado: TCmDbField;
    FFlggravairlitigio: TCmDbField;
    FCodtipdoc: TCmDbField;
    FFlgatadec: TCmDbField;
    FFlgjuros: TCmDbField;
    FNaturezaoperacao: TCmDbField;
    FFlginipag: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FSiglatipooper: TCmDbField;
    FFlgopdireito: TCmDbField;
    FFlgcorret: TCmDbField;
    FFlgage: TCmDbField;
    FTipsaldocartorig: TCmDbField;
    FFlgprzemp: TCmDbField;
    FIdmotivobloqueio: TCmDbField;
    FFlgordmovinv: TCmDbField;
    FFlgtransf: TCmDbField;
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetDesctipooperacao(const Value: TCmDbField);
    procedure SetFlgage(const Value: TCmDbField);
    procedure SetFlgatadec(const Value: TCmDbField);
    procedure SetFlgcontainvest(const Value: TCmDbField);
    procedure SetFlgcorret(const Value: TCmDbField);
    procedure SetFlgcotarecdes(const Value: TCmDbField);
    procedure SetFlgdatacom(const Value: TCmDbField);
    procedure SetFlgdataex(const Value: TCmDbField);
    procedure SetFlgdatavencimento(const Value: TCmDbField);
    procedure SetFlgdivacao(const Value: TCmDbField);
    procedure SetFlgformapagrec(const Value: TCmDbField);
    procedure SetFlggeracaf(const Value: TCmDbField);
    procedure SetFlggeracapcar(const Value: TCmDbField);
    procedure SetFlggeracontab(const Value: TCmDbField);
    procedure SetFlggravairlitigio(const Value: TCmDbField);
    procedure SetFlginipag(const Value: TCmDbField);
    procedure SetFlginvorigem(const Value: TCmDbField);
    procedure SetFlgisentoir(const Value: TCmDbField);
    procedure SetFlgjuros(const Value: TCmDbField);
    procedure SetFlgmovcota(const Value: TCmDbField);
    procedure SetFlgopdireito(const Value: TCmDbField);
    procedure SetFlgopgerenc(const Value: TCmDbField);
    procedure SetFlgordmovinv(const Value: TCmDbField);
    procedure SetFlgparidade(const Value: TCmDbField);
    procedure SetFlgperc(const Value: TCmDbField);
    procedure SetFlgprzbolsa(const Value: TCmDbField);
    procedure SetFlgprzemp(const Value: TCmDbField);
    procedure SetFlgrentabilidade(const Value: TCmDbField);
    procedure SetFlgtransf(const Value: TCmDbField);
    procedure SetFlgtratair(const Value: TCmDbField);
    procedure SetIdmercado(const Value: TCmDbField);
    procedure SetIdmotivobloqueio(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetMotbloqcartdest(const Value: TCmDbField);
    procedure SetMotbloqcartorig(const Value: TCmDbField);
    procedure SetNaturezaoperacao(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetSiglatipooper(const Value: TCmDbField);
    procedure SetStaativo(const Value: TCmDbField);
    procedure SetTipcredor(const Value: TCmDbField);
    procedure SetTipocustodia(const Value: TCmDbField);
    procedure SetTipomovto(const Value: TCmDbField);
    procedure SetTipsaldocartdest(const Value: TCmDbField);
    procedure SetTipsaldocartorig(const Value: TCmDbField);
    procedure SetVencimento(const Value: TCmDbField);

  public

     Property Vencimento: TCmDbField read FVencimento write SetVencimento;
     Property Tipsaldocartorig: TCmDbField read FTipsaldocartorig write SetTipsaldocartorig;
     Property Tipsaldocartdest: TCmDbField read FTipsaldocartdest write SetTipsaldocartdest;
     Property Tipomovto: TCmDbField read FTipomovto write SetTipomovto;
     Property Tipocustodia: TCmDbField read FTipocustodia write SetTipocustodia;
     Property Tipcredor: TCmDbField read FTipcredor write SetTipcredor;
     Property Staativo: TCmDbField read FStaativo write SetStaativo;
     Property Siglatipooper: TCmDbField read FSiglatipooper write SetSiglatipooper;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Naturezaoperacao: TCmDbField read FNaturezaoperacao write SetNaturezaoperacao;
     Property Motbloqcartorig: TCmDbField read FMotbloqcartorig write SetMotbloqcartorig;
     Property Motbloqcartdest: TCmDbField read FMotbloqcartdest write SetMotbloqcartdest;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idmotivobloqueio: TCmDbField read FIdmotivobloqueio write SetIdmotivobloqueio;
     Property Idmercado: TCmDbField read FIdmercado write SetIdmercado;
     Property Flgtratair: TCmDbField read FFlgtratair write SetFlgtratair;
     Property Flgtransf: TCmDbField read FFlgtransf write SetFlgtransf;
     Property Flgrentabilidade: TCmDbField read FFlgrentabilidade write SetFlgrentabilidade;
     Property Flgprzemp: TCmDbField read FFlgprzemp write SetFlgprzemp;
     Property Flgprzbolsa: TCmDbField read FFlgprzbolsa write SetFlgprzbolsa;
     Property Flgperc: TCmDbField read FFlgperc write SetFlgperc;
     Property Flgparidade: TCmDbField read FFlgparidade write SetFlgparidade;
     Property Flgordmovinv: TCmDbField read FFlgordmovinv write SetFlgordmovinv;
     Property Flgopgerenc: TCmDbField read FFlgopgerenc write SetFlgopgerenc;
     Property Flgopdireito: TCmDbField read FFlgopdireito write SetFlgopdireito;
     Property Flgmovcota: TCmDbField read FFlgmovcota write SetFlgmovcota;
     Property Flgjuros: TCmDbField read FFlgjuros write SetFlgjuros;
     Property Flgisentoir: TCmDbField read FFlgisentoir write SetFlgisentoir;
     Property Flginvorigem: TCmDbField read FFlginvorigem write SetFlginvorigem;
     Property Flginipag: TCmDbField read FFlginipag write SetFlginipag;
     Property Flggravairlitigio: TCmDbField read FFlggravairlitigio write SetFlggravairlitigio;
     Property Flggeracontab: TCmDbField read FFlggeracontab write SetFlggeracontab;
     Property Flggeracapcar: TCmDbField read FFlggeracapcar write SetFlggeracapcar;
     Property Flggeracaf: TCmDbField read FFlggeracaf write SetFlggeracaf;
     Property Flgformapagrec: TCmDbField read FFlgformapagrec write SetFlgformapagrec;
     Property Flgdivacao: TCmDbField read FFlgdivacao write SetFlgdivacao;
     Property Flgdatavencimento: TCmDbField read FFlgdatavencimento write SetFlgdatavencimento;
     Property Flgdataex: TCmDbField read FFlgdataex write SetFlgdataex;
     Property Flgdatacom: TCmDbField read FFlgdatacom write SetFlgdatacom;
     Property Flgcotarecdes: TCmDbField read FFlgcotarecdes write SetFlgcotarecdes;
     Property Flgcorret: TCmDbField read FFlgcorret write SetFlgcorret;
     Property Flgcontainvest: TCmDbField read FFlgcontainvest write SetFlgcontainvest;
     Property Flgatadec: TCmDbField read FFlgatadec write SetFlgatadec;
     Property Flgage: TCmDbField read FFlgage write SetFlgage;
     Property Desctipooperacao: TCmDbField read FDesctipooperacao write SetDesctipooperacao;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoOperacao }

constructor TDbTipoOperacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOOPERACAO';

   fVencimento        := CreateCmDbField('VENCIMENTO',ftfloat,False,False,False,True,'');
   fTipsaldocartorig  := CreateCmDbField('TIPSALDOCARTORIG',ftString,False,False,False,True,'');
   fTipsaldocartdest  := CreateCmDbField('TIPSALDOCARTDEST',ftString,False,False,False,True,'');
   fTipomovto         := CreateCmDbField('TIPOMOVTO',ftString,False,False,False,True,'');
   fTipocustodia      := CreateCmDbField('TIPOCUSTODIA',ftString,False,False,False,True,'');
   fTipcredor         := CreateCmDbField('TIPCREDOR',ftString,False,False,False,True,'');
   fStaativo          := CreateCmDbField('STAATIVO',ftString,False,False,False,True,'');
   fSiglatipooper     := CreateCmDbField('SIGLATIPOOPER',ftString,False,False,False,True,'');
   fRecpag            := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fNaturezaoperacao  := CreateCmDbField('NATUREZAOPERACAO',ftString,False,False,False,True,'');
   fMotbloqcartorig   := CreateCmDbField('MOTBLOQCARTORIG',ftfloat,False,False,False,True,'');
   fMotbloqcartdest   := CreateCmDbField('MOTBLOQCARTDEST',ftfloat,False,False,False,True,'');
   fIdtipooperacao    := CreateCmDbField('IDTIPOOPERACAO',ftfloat,True,True,False,True,'');
   fIdtipoinvest      := CreateCmDbField('IDTIPOINVEST',ftfloat,True,True,False,True,'');
   fIdmotivobloqueio  := CreateCmDbField('IDMOTIVOBLOQUEIO',ftfloat,False,False,False,True,'');
   fIdmercado         := CreateCmDbField('IDMERCADO',ftfloat,False,False,False,True,'');
   fFlgtratair        := CreateCmDbField('FLGTRATAIR',ftString,False,False,False,True,'');
   fFlgtransf         := CreateCmDbField('FLGTRANSF',ftString,True,False,False,True,'');
   fFlgrentabilidade  := CreateCmDbField('FLGRENTABILIDADE',ftString,False,False,False,True,'');
   fFlgprzemp         := CreateCmDbField('FLGPRZEMP',ftString,False,False,False,True,'');
   fFlgprzbolsa       := CreateCmDbField('FLGPRZBOLSA',ftString,False,False,False,True,'');
   fFlgperc           := CreateCmDbField('FLGPERC',ftString,False,False,False,True,'');
   fFlgparidade       := CreateCmDbField('FLGPARIDADE',ftString,False,False,False,True,'');
   fFlgordmovinv      := CreateCmDbField('FLGORDMOVINV',ftString,False,False,False,True,'');
   fFlgopgerenc       := CreateCmDbField('FLGOPGERENC',ftString,False,False,False,True,'');
   fFlgopdireito      := CreateCmDbField('FLGOPDIREITO',ftString,False,False,False,True,'');
   fFlgmovcota        := CreateCmDbField('FLGMOVCOTA',ftString,False,False,False,True,'');
   fFlgjuros          := CreateCmDbField('FLGJUROS',ftString,False,False,False,True,'');
   fFlgisentoir       := CreateCmDbField('FLGISENTOIR',ftString,False,False,False,True,'');
   fFlginvorigem      := CreateCmDbField('FLGINVORIGEM',ftString,False,False,False,True,'');
   fFlginipag         := CreateCmDbField('FLGINIPAG',ftString,False,False,False,True,'');
   fFlggravairlitigio := CreateCmDbField('FLGGRAVAIRLITIGIO',ftString,False,False,False,True,'');
   fFlggeracontab     := CreateCmDbField('FLGGERACONTAB',ftfloat,False,False,False,True,'');
   fFlggeracapcar     := CreateCmDbField('FLGGERACAPCAR',ftfloat,False,False,False,True,'');
   fFlggeracaf        := CreateCmDbField('FLGGERACAF',ftfloat,False,False,False,True,'');
   fFlgformapagrec    := CreateCmDbField('FLGFORMAPAGREC',ftString,False,False,False,True,'');
   fFlgdivacao        := CreateCmDbField('FLGDIVACAO',ftString,False,False,False,True,'');
   fFlgdatavencimento := CreateCmDbField('FLGDATAVENCIMENTO',ftString,False,False,False,True,'');
   fFlgdataex         := CreateCmDbField('FLGDATAEX',ftString,False,False,False,True,'');
   fFlgdatacom        := CreateCmDbField('FLGDATACOM',ftString,False,False,False,True,'');
   fFlgcotarecdes     := CreateCmDbField('FLGCOTARECDES',ftString,False,False,False,True,'');
   fFlgcorret         := CreateCmDbField('FLGCORRET',ftString,False,False,False,True,'');
   fFlgcontainvest    := CreateCmDbField('FLGCONTAINVEST',ftfloat,False,False,False,True,'');
   fFlgatadec         := CreateCmDbField('FLGATADEC',ftString,False,False,False,True,'');
   fFlgage            := CreateCmDbField('FLGAGE',ftString,False,False,False,True,'');
   fDesctipooperacao  := CreateCmDbField('DESCTIPOOPERACAO',ftString,False,False,False,True,'');
   fCodtipdoc         := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
end;

function TDbTipoOperacao.Insert: Boolean;
begin

   fIdtipooperacao.AsFloat := GetSequence('TIPOOPERACAO');
   fIdtipoinvest.AsFloat := GetSequence('TIPOOPERACAO');
   Result := Inherited Insert;

end;


procedure TDbTipoOperacao.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbTipoOperacao.SetDesctipooperacao(const Value: TCmDbField);
begin
  FDesctipooperacao := Value;
end;

procedure TDbTipoOperacao.SetFlgage(const Value: TCmDbField);
begin
  FFlgage := Value;
end;

procedure TDbTipoOperacao.SetFlgatadec(const Value: TCmDbField);
begin
  FFlgatadec := Value;
end;

procedure TDbTipoOperacao.SetFlgcontainvest(const Value: TCmDbField);
begin
  FFlgcontainvest := Value;
end;

procedure TDbTipoOperacao.SetFlgcorret(const Value: TCmDbField);
begin
  FFlgcorret := Value;
end;

procedure TDbTipoOperacao.SetFlgcotarecdes(const Value: TCmDbField);
begin
  FFlgcotarecdes := Value;
end;

procedure TDbTipoOperacao.SetFlgdatacom(const Value: TCmDbField);
begin
  FFlgdatacom := Value;
end;

procedure TDbTipoOperacao.SetFlgdataex(const Value: TCmDbField);
begin
  FFlgdataex := Value;
end;

procedure TDbTipoOperacao.SetFlgdatavencimento(const Value: TCmDbField);
begin
  FFlgdatavencimento := Value;
end;

procedure TDbTipoOperacao.SetFlgdivacao(const Value: TCmDbField);
begin
  FFlgdivacao := Value;
end;

procedure TDbTipoOperacao.SetFlgformapagrec(const Value: TCmDbField);
begin
  FFlgformapagrec := Value;
end;

procedure TDbTipoOperacao.SetFlggeracaf(const Value: TCmDbField);
begin
  FFlggeracaf := Value;
end;

procedure TDbTipoOperacao.SetFlggeracapcar(const Value: TCmDbField);
begin
  FFlggeracapcar := Value;
end;

procedure TDbTipoOperacao.SetFlggeracontab(const Value: TCmDbField);
begin
  FFlggeracontab := Value;
end;

procedure TDbTipoOperacao.SetFlggravairlitigio(const Value: TCmDbField);
begin
  FFlggravairlitigio := Value;
end;

procedure TDbTipoOperacao.SetFlginipag(const Value: TCmDbField);
begin
  FFlginipag := Value;
end;

procedure TDbTipoOperacao.SetFlginvorigem(const Value: TCmDbField);
begin
  FFlginvorigem := Value;
end;

procedure TDbTipoOperacao.SetFlgisentoir(const Value: TCmDbField);
begin
  FFlgisentoir := Value;
end;

procedure TDbTipoOperacao.SetFlgjuros(const Value: TCmDbField);
begin
  FFlgjuros := Value;
end;

procedure TDbTipoOperacao.SetFlgmovcota(const Value: TCmDbField);
begin
  FFlgmovcota := Value;
end;

procedure TDbTipoOperacao.SetFlgopdireito(const Value: TCmDbField);
begin
  FFlgopdireito := Value;
end;

procedure TDbTipoOperacao.SetFlgopgerenc(const Value: TCmDbField);
begin
  FFlgopgerenc := Value;
end;

procedure TDbTipoOperacao.SetFlgordmovinv(const Value: TCmDbField);
begin
  FFlgordmovinv := Value;
end;

procedure TDbTipoOperacao.SetFlgparidade(const Value: TCmDbField);
begin
  FFlgparidade := Value;
end;

procedure TDbTipoOperacao.SetFlgperc(const Value: TCmDbField);
begin
  FFlgperc := Value;
end;

procedure TDbTipoOperacao.SetFlgprzbolsa(const Value: TCmDbField);
begin
  FFlgprzbolsa := Value;
end;

procedure TDbTipoOperacao.SetFlgprzemp(const Value: TCmDbField);
begin
  FFlgprzemp := Value;
end;

procedure TDbTipoOperacao.SetFlgrentabilidade(const Value: TCmDbField);
begin
  FFlgrentabilidade := Value;
end;

procedure TDbTipoOperacao.SetFlgtransf(const Value: TCmDbField);
begin
  FFlgtransf := Value;
end;

procedure TDbTipoOperacao.SetFlgtratair(const Value: TCmDbField);
begin
  FFlgtratair := Value;
end;

procedure TDbTipoOperacao.SetIdmercado(const Value: TCmDbField);
begin
  FIdmercado := Value;
end;

procedure TDbTipoOperacao.SetIdmotivobloqueio(const Value: TCmDbField);
begin
  FIdmotivobloqueio := Value;
end;

procedure TDbTipoOperacao.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbTipoOperacao.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbTipoOperacao.SetMotbloqcartdest(const Value: TCmDbField);
begin
  FMotbloqcartdest := Value;
end;

procedure TDbTipoOperacao.SetMotbloqcartorig(const Value: TCmDbField);
begin
  FMotbloqcartorig := Value;
end;

procedure TDbTipoOperacao.SetNaturezaoperacao(const Value: TCmDbField);
begin
  FNaturezaoperacao := Value;
end;

procedure TDbTipoOperacao.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbTipoOperacao.SetSiglatipooper(const Value: TCmDbField);
begin
  FSiglatipooper := Value;
end;

procedure TDbTipoOperacao.SetStaativo(const Value: TCmDbField);
begin
  FStaativo := Value;
end;

procedure TDbTipoOperacao.SetTipcredor(const Value: TCmDbField);
begin
  FTipcredor := Value;
end;

procedure TDbTipoOperacao.SetTipocustodia(const Value: TCmDbField);
begin
  FTipocustodia := Value;
end;

procedure TDbTipoOperacao.SetTipomovto(const Value: TCmDbField);
begin
  FTipomovto := Value;
end;

procedure TDbTipoOperacao.SetTipsaldocartdest(const Value: TCmDbField);
begin
  FTipsaldocartdest := Value;
end;

procedure TDbTipoOperacao.SetTipsaldocartorig(const Value: TCmDbField);
begin
  FTipsaldocartorig := Value;
end;

procedure TDbTipoOperacao.SetVencimento(const Value: TCmDbField);
begin
  FVencimento := Value;
end;

end.
