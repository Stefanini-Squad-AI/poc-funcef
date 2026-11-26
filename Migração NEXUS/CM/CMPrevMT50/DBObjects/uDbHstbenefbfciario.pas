{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2007                             }
{                                                       }
{*******************************************************}

unit uDbHstbenefbfciario;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHstbenefbfciario = class(TCmDbObject)

  private
    FVlbenefpgto: TCmDbField;
    FIdregrabenefmin: TCmDbField;
    FIdagenciaresgate: TCmDbField;
    FFontepagadora: TCmDbField;
    FCoddocumento: TCmDbField;
    FValorbase4: TCmDbField;
    FFlgacertodesfeito: TCmDbField;
    FIdmotivo: TCmDbField;
    FFlgdescirmes: TCmDbField;
    FNumeroprocesso: TCmDbField;
    FMes: TCmDbField;
    FIdplanoprev: TCmDbField;
    FValorcalculado: TCmDbField;
    FValorprevmin: TCmDbField;
    FValorop3: TCmDbField;
    FValorprev: TCmDbField;
    FValorsrb: TCmDbField;
    FFlgalimreserva: TCmDbField;
    FFlgenviado: TCmDbField;
    FIdpessjur: TCmDbField;
    FIdmovbenef: TCmDbField;
    FValorbase5: TCmDbField;
    FIdregracalculo: TCmDbField;
    FValorintegral: TCmDbField;
    FValoracerto: TCmDbField;
    FIdlote: TCmDbField;
    FFlgprovisorio: TCmDbField;
    FMesreferencia: TCmDbField;
    FValorop2: TCmDbField;
    FVlrtotretroativo: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdregraabaterese: TCmDbField;
    FDtefetpgto: TCmDbField;
    FFlgmanual: TCmDbField;
    FPercentual: TCmDbField;
    FFlgconcessao: TCmDbField;
    FSeqproposta: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdplanoorigem: TCmDbField;
    FValorbase2: TCmDbField;
    FCodportforma: TCmDbField;
    FCodreferencia: TCmDbField;
    FIdtitbenef: TCmDbField;
    FValortotal: TCmDbField;
    FFlgtiporegistro: TCmDbField;
    FValorbase1: TCmDbField;
    FValorop1: TCmDbField;
    FIdtitular: TCmDbField;
    FIdseqinternofb: TCmDbField;
    FFlgformapagto: TCmDbField;
    FFlgdevolucao: TCmDbField;
    FVlrdifretroativo: TCmDbField;
    FSeqbeneficio: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdretroativo: TCmDbField;
    FPercprovisorio: TCmDbField;
    FIdhstfolhabenef: TCmDbField;
    FIdbeneficio: TCmDbField;
    FValorbase3: TCmDbField;
    FDataPagamento: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodreferencia(const Value: TCmDbField);
    procedure SetDtefetpgto(const Value: TCmDbField);
    procedure SetFlgacertodesfeito(const Value: TCmDbField);
    procedure SetFlgalimreserva(const Value: TCmDbField);
    procedure SetFlgconcessao(const Value: TCmDbField);
    procedure SetFlgdescirmes(const Value: TCmDbField);
    procedure SetFlgdevolucao(const Value: TCmDbField);
    procedure SetFlgenviado(const Value: TCmDbField);
    procedure SetFlgformapagto(const Value: TCmDbField);
    procedure SetFlgmanual(const Value: TCmDbField);
    procedure SetFlgprovisorio(const Value: TCmDbField);
    procedure SetFlgtiporegistro(const Value: TCmDbField);
    procedure SetFontepagadora(const Value: TCmDbField);
    procedure SetIdagenciaresgate(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdhstfolhabenef(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdmotivo(const Value: TCmDbField);
    procedure SetIdmovbenef(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoorigem(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregraabaterese(const Value: TCmDbField);
    procedure SetIdregrabenefmin(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetIdretroativo(const Value: TCmDbField);
    procedure SetIdseqinternofb(const Value: TCmDbField);
    procedure SetIdtitbenef(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetMes(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetNumeroprocesso(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPercprovisorio(const Value: TCmDbField);
    procedure SetSeqbeneficio(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetValoracerto(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);
    procedure SetValorbase4(const Value: TCmDbField);
    procedure SetValorbase5(const Value: TCmDbField);
    procedure SetValorcalculado(const Value: TCmDbField);
    procedure SetValorintegral(const Value: TCmDbField);
    procedure SetValorop1(const Value: TCmDbField);
    procedure SetValorop2(const Value: TCmDbField);
    procedure SetValorop3(const Value: TCmDbField);
    procedure SetValorprev(const Value: TCmDbField);
    procedure SetValorprevmin(const Value: TCmDbField);
    procedure SetValorsrb(const Value: TCmDbField);
    procedure SetValortotal(const Value: TCmDbField);
    procedure SetVlbenefpgto(const Value: TCmDbField);
    procedure SetVlrdifretroativo(const Value: TCmDbField);
    procedure SetVlrtotretroativo(const Value: TCmDbField);
    procedure SetDataPagamento(const Value: TCmDbField);

  public

     Property Vlrtotretroativo: TCmDbField read FVlrtotretroativo write SetVlrtotretroativo;
     Property Vlrdifretroativo: TCmDbField read FVlrdifretroativo write SetVlrdifretroativo;
     Property Vlbenefpgto: TCmDbField read FVlbenefpgto write SetVlbenefpgto;
     Property Valortotal: TCmDbField read FValortotal write SetValortotal;
     Property Valorsrb: TCmDbField read FValorsrb write SetValorsrb;
     Property Valorprevmin: TCmDbField read FValorprevmin write SetValorprevmin;
     Property Valorprev: TCmDbField read FValorprev write SetValorprev;
     Property Valorop3: TCmDbField read FValorop3 write SetValorop3;
     Property Valorop2: TCmDbField read FValorop2 write SetValorop2;
     Property Valorop1: TCmDbField read FValorop1 write SetValorop1;
     Property Valorintegral: TCmDbField read FValorintegral write SetValorintegral;
     Property Valorcalculado: TCmDbField read FValorcalculado write SetValorcalculado;
     Property Valorbase5: TCmDbField read FValorbase5 write SetValorbase5;
     Property Valorbase4: TCmDbField read FValorbase4 write SetValorbase4;
     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Valoracerto: TCmDbField read FValoracerto write SetValoracerto;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Seqbeneficio: TCmDbField read FSeqbeneficio write SetSeqbeneficio;
     Property Percprovisorio: TCmDbField read FPercprovisorio write SetPercprovisorio;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Numeroprocesso: TCmDbField read FNumeroprocesso write SetNumeroprocesso;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Mes: TCmDbField read FMes write SetMes;
     Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
     Property Idtitbenef: TCmDbField read FIdtitbenef write SetIdtitbenef;
     Property Idseqinternofb: TCmDbField read FIdseqinternofb write SetIdseqinternofb;
     Property Idretroativo: TCmDbField read FIdretroativo write SetIdretroativo;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Idregrabenefmin: TCmDbField read FIdregrabenefmin write SetIdregrabenefmin;
     Property Idregraabaterese: TCmDbField read FIdregraabaterese write SetIdregraabaterese;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanoorigem: TCmDbField read FIdplanoorigem write SetIdplanoorigem;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idmovbenef: TCmDbField read FIdmovbenef write SetIdmovbenef;
     Property Idmotivo: TCmDbField read FIdmotivo write SetIdmotivo;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Idhstfolhabenef: TCmDbField read FIdhstfolhabenef write SetIdhstfolhabenef;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Idagenciaresgate: TCmDbField read FIdagenciaresgate write SetIdagenciaresgate;
     Property Fontepagadora: TCmDbField read FFontepagadora write SetFontepagadora;
     Property Flgtiporegistro: TCmDbField read FFlgtiporegistro write SetFlgtiporegistro;
     Property Flgprovisorio: TCmDbField read FFlgprovisorio write SetFlgprovisorio;
     Property Flgmanual: TCmDbField read FFlgmanual write SetFlgmanual;
     Property Flgformapagto: TCmDbField read FFlgformapagto write SetFlgformapagto;
     Property Flgenviado: TCmDbField read FFlgenviado write SetFlgenviado;
     Property Flgdevolucao: TCmDbField read FFlgdevolucao write SetFlgdevolucao;
     Property Flgdescirmes: TCmDbField read FFlgdescirmes write SetFlgdescirmes;
     Property Flgconcessao: TCmDbField read FFlgconcessao write SetFlgconcessao;
     Property Flgalimreserva: TCmDbField read FFlgalimreserva write SetFlgalimreserva;
     Property Flgacertodesfeito: TCmDbField read FFlgacertodesfeito write SetFlgacertodesfeito;
     Property Dtefetpgto: TCmDbField read FDtefetpgto write SetDtefetpgto;
     Property Codreferencia: TCmDbField read FCodreferencia write SetCodreferencia;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property DataPagamento: TCmDbField read FDataPagamento write SetDataPagamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHstbenefbfciario }

constructor TDbHstbenefbfciario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTBENEFBFCIARIO';

   fVlrtotretroativo := CreateCmDbField('VLRTOTRETROATIVO',ftfloat,False,False,False,True,'');
   fVlrdifretroativo := CreateCmDbField('VLRDIFRETROATIVO',ftfloat,False,False,False,True,'');
   fVlbenefpgto := CreateCmDbField('VLBENEFPGTO',ftfloat,False,False,False,True,'');
   fValortotal := CreateCmDbField('VALORTOTAL',ftfloat,False,False,False,True,'');
   fValorsrb := CreateCmDbField('VALORSRB',ftfloat,False,False,False,True,'');
   fValorprevmin := CreateCmDbField('VALORPREVMIN',ftfloat,False,False,False,True,'');
   fValorprev := CreateCmDbField('VALORPREV',ftfloat,False,False,False,True,'');
   fValorop3 := CreateCmDbField('VALOROP3',ftfloat,False,False,False,True,'');
   fValorop2 := CreateCmDbField('VALOROP2',ftfloat,False,False,False,True,'');
   fValorop1 := CreateCmDbField('VALOROP1',ftfloat,False,False,False,True,'');
   fValorintegral := CreateCmDbField('VALORINTEGRAL',ftfloat,False,False,False,True,'');
   fValorcalculado := CreateCmDbField('VALORCALCULADO',ftfloat,False,False,False,True,'');
   fValorbase5 := CreateCmDbField('VALORBASE5',ftfloat,False,False,False,True,'');
   fValorbase4 := CreateCmDbField('VALORBASE4',ftfloat,False,False,False,True,'');
   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fValoracerto := CreateCmDbField('VALORACERTO',ftfloat,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
   fSeqbeneficio := CreateCmDbField('SEQBENEFICIO',ftfloat,True,True,False,True,'');
   fPercprovisorio := CreateCmDbField('PERCPROVISORIO',ftfloat,False,False,False,True,'');
   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
   fNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,True,True,False,True,'');
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,True,True,False,True,'');
   fMes := CreateCmDbField('MES',ftString,True,True,False,True,'');
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,True,False,True,'');
   fIdtitbenef := CreateCmDbField('IDTITBENEF',ftfloat,False,False,False,True,'');
   fIdseqinternofb := CreateCmDbField('IDSEQINTERNOFB',ftfloat,False,False,False,True,'');
   fIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,False,False,False,True,'');
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,False,False,False,True,'');
   fIdregrabenefmin := CreateCmDbField('IDREGRABENEFMIN',ftfloat,False,False,False,True,'');
   fIdregraabaterese := CreateCmDbField('IDREGRAABATERESE',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanoorigem := CreateCmDbField('IDPLANOORIGEM',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fIdmovbenef := CreateCmDbField('IDMOVBENEF',ftfloat,False,False,False,True,'');
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,True,True,False,True,'');
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,False,False,False,True,'');
   fIdhstfolhabenef := CreateCmDbField('IDHSTFOLHABENEF',ftfloat,False,False,False,True,'');
   fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,True,True,False,True,'');
   fIdagenciaresgate := CreateCmDbField('IDAGENCIARESGATE',ftfloat,False,False,False,True,'');
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,False,False,False,True,'');
   fFlgtiporegistro := CreateCmDbField('FLGTIPOREGISTRO',ftfloat,False,False,False,True,'');
   fFlgprovisorio := CreateCmDbField('FLGPROVISORIO',ftfloat,False,False,False,True,'');
   fFlgmanual := CreateCmDbField('FLGMANUAL',ftfloat,False,False,False,True,'');
   fFlgformapagto := CreateCmDbField('FLGFORMAPAGTO',ftString,False,False,False,True,'');
   fFlgenviado := CreateCmDbField('FLGENVIADO',ftfloat,False,False,False,True,'');
   fFlgdevolucao := CreateCmDbField('FLGDEVOLUCAO',ftfloat,False,False,False,True,'');
   fFlgdescirmes := CreateCmDbField('FLGDESCIRMES',ftfloat,False,False,False,True,'');
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,False,False,False,True,'');
   fFlgalimreserva := CreateCmDbField('FLGALIMRESERVA',ftfloat,False,False,False,True,'');
   fFlgacertodesfeito := CreateCmDbField('FLGACERTODESFEITO',ftfloat,False,False,False,True,'');
   fDtefetpgto := CreateCmDbField('DTEFETPGTO',ftDateTime,False,False,False,True,'');
   fCodreferencia := CreateCmDbField('CODREFERENCIA',ftString,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fDataPagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,False,False,False,True,'');
end;

function TDbHstbenefbfciario.Insert: Boolean;
begin

   fSeqproposta.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fSeqbeneficio.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fNumeroprocesso.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fIdtitular.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fIdplanoprev.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fIdplanoorigem.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fIdpessoa.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fIdpessjur.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fIdmotivo.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   fIdbeneficio.AsFloat := GetSequence('HSTBENEFBFCIARIO');
   Result := Inherited Insert;

end;


procedure TDbHstbenefbfciario.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbHstbenefbfciario.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbHstbenefbfciario.SetCodreferencia(const Value: TCmDbField);
begin
  FCodreferencia := Value;
end;

procedure TDbHstbenefbfciario.SetDataPagamento(const Value: TCmDbField);
begin
  FDataPagamento := Value;
end;

procedure TDbHstbenefbfciario.SetDtefetpgto(const Value: TCmDbField);
begin
  FDtefetpgto := Value;
end;

procedure TDbHstbenefbfciario.SetFlgacertodesfeito(
  const Value: TCmDbField);
begin
  FFlgacertodesfeito := Value;
end;

procedure TDbHstbenefbfciario.SetFlgalimreserva(const Value: TCmDbField);
begin
  FFlgalimreserva := Value;
end;

procedure TDbHstbenefbfciario.SetFlgconcessao(const Value: TCmDbField);
begin
  FFlgconcessao := Value;
end;

procedure TDbHstbenefbfciario.SetFlgdescirmes(const Value: TCmDbField);
begin
  FFlgdescirmes := Value;
end;

procedure TDbHstbenefbfciario.SetFlgdevolucao(const Value: TCmDbField);
begin
  FFlgdevolucao := Value;
end;

procedure TDbHstbenefbfciario.SetFlgenviado(const Value: TCmDbField);
begin
  FFlgenviado := Value;
end;

procedure TDbHstbenefbfciario.SetFlgformapagto(const Value: TCmDbField);
begin
  FFlgformapagto := Value;
end;

procedure TDbHstbenefbfciario.SetFlgmanual(const Value: TCmDbField);
begin
  FFlgmanual := Value;
end;

procedure TDbHstbenefbfciario.SetFlgprovisorio(const Value: TCmDbField);
begin
  FFlgprovisorio := Value;
end;

procedure TDbHstbenefbfciario.SetFlgtiporegistro(const Value: TCmDbField);
begin
  FFlgtiporegistro := Value;
end;

procedure TDbHstbenefbfciario.SetFontepagadora(const Value: TCmDbField);
begin
  FFontepagadora := Value;
end;

procedure TDbHstbenefbfciario.SetIdagenciaresgate(const Value: TCmDbField);
begin
  FIdagenciaresgate := Value;
end;

procedure TDbHstbenefbfciario.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDbHstbenefbfciario.SetIdhstfolhabenef(const Value: TCmDbField);
begin
  FIdhstfolhabenef := Value;
end;

procedure TDbHstbenefbfciario.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbHstbenefbfciario.SetIdmotivo(const Value: TCmDbField);
begin
  FIdmotivo := Value;
end;

procedure TDbHstbenefbfciario.SetIdmovbenef(const Value: TCmDbField);
begin
  FIdmovbenef := Value;
end;

procedure TDbHstbenefbfciario.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbHstbenefbfciario.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbHstbenefbfciario.SetIdplanoorigem(const Value: TCmDbField);
begin
  FIdplanoorigem := Value;
end;

procedure TDbHstbenefbfciario.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbHstbenefbfciario.SetIdregraabaterese(const Value: TCmDbField);
begin
  FIdregraabaterese := Value;
end;

procedure TDbHstbenefbfciario.SetIdregrabenefmin(const Value: TCmDbField);
begin
  FIdregrabenefmin := Value;
end;

procedure TDbHstbenefbfciario.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDbHstbenefbfciario.SetIdretroativo(const Value: TCmDbField);
begin
  FIdretroativo := Value;
end;

procedure TDbHstbenefbfciario.SetIdseqinternofb(const Value: TCmDbField);
begin
  FIdseqinternofb := Value;
end;

procedure TDbHstbenefbfciario.SetIdtitbenef(const Value: TCmDbField);
begin
  FIdtitbenef := Value;
end;

procedure TDbHstbenefbfciario.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDbHstbenefbfciario.SetMes(const Value: TCmDbField);
begin
  FMes := Value;
end;

procedure TDbHstbenefbfciario.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDbHstbenefbfciario.SetNumeroprocesso(const Value: TCmDbField);
begin
  FNumeroprocesso := Value;
end;

procedure TDbHstbenefbfciario.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbHstbenefbfciario.SetPercprovisorio(const Value: TCmDbField);
begin
  FPercprovisorio := Value;
end;

procedure TDbHstbenefbfciario.SetSeqbeneficio(const Value: TCmDbField);
begin
  FSeqbeneficio := Value;
end;

procedure TDbHstbenefbfciario.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDbHstbenefbfciario.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbHstbenefbfciario.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbHstbenefbfciario.SetValoracerto(const Value: TCmDbField);
begin
  FValoracerto := Value;
end;

procedure TDbHstbenefbfciario.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDbHstbenefbfciario.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDbHstbenefbfciario.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

procedure TDbHstbenefbfciario.SetValorbase4(const Value: TCmDbField);
begin
  FValorbase4 := Value;
end;

procedure TDbHstbenefbfciario.SetValorbase5(const Value: TCmDbField);
begin
  FValorbase5 := Value;
end;

procedure TDbHstbenefbfciario.SetValorcalculado(const Value: TCmDbField);
begin
  FValorcalculado := Value;
end;

procedure TDbHstbenefbfciario.SetValorintegral(const Value: TCmDbField);
begin
  FValorintegral := Value;
end;

procedure TDbHstbenefbfciario.SetValorop1(const Value: TCmDbField);
begin
  FValorop1 := Value;
end;

procedure TDbHstbenefbfciario.SetValorop2(const Value: TCmDbField);
begin
  FValorop2 := Value;
end;

procedure TDbHstbenefbfciario.SetValorop3(const Value: TCmDbField);
begin
  FValorop3 := Value;
end;

procedure TDbHstbenefbfciario.SetValorprev(const Value: TCmDbField);
begin
  FValorprev := Value;
end;

procedure TDbHstbenefbfciario.SetValorprevmin(const Value: TCmDbField);
begin
  FValorprevmin := Value;
end;

procedure TDbHstbenefbfciario.SetValorsrb(const Value: TCmDbField);
begin
  FValorsrb := Value;
end;

procedure TDbHstbenefbfciario.SetValortotal(const Value: TCmDbField);
begin
  FValortotal := Value;
end;

procedure TDbHstbenefbfciario.SetVlbenefpgto(const Value: TCmDbField);
begin
  FVlbenefpgto := Value;
end;

procedure TDbHstbenefbfciario.SetVlrdifretroativo(const Value: TCmDbField);
begin
  FVlrdifretroativo := Value;
end;

procedure TDbHstbenefbfciario.SetVlrtotretroativo(const Value: TCmDbField);
begin
  FVlrtotretroativo := Value;
end;

end.



