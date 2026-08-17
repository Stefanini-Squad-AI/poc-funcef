{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/04/2007                             }
{                                                       }
{*******************************************************}

unit uDBHstContribprev;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBHstContribPrev = class(TCmDbObject)

  private
    FMesreferencia: TCmDbField;
    FIdregracalculo: TCmDbField;
    FDataemisscob: TCmDbField;
    FIdhistproposta: TCmDbField;
    FFlgevento: TCmDbField;
    FVlrdifretroativo: TCmDbField;
    FMescobranca: TCmDbField;
    FDataultalim: TCmDbField;
    FFontepagadora: TCmDbField;
    FFlgdescfolha: TCmDbField;
    FFlgconcessao: TCmDbField;
    FIdparcelamento: TCmDbField;
    FValoresperado: TCmDbField;
    FFlgaporte: TCmDbField;
    FParcela: TCmDbField;
    FIdlancirrf: TCmDbField;
    FValorop2: TCmDbField;
    FFlgintevento: TCmDbField;
    FFolhaorigem: TCmDbField;
    FIdmotivo: TCmDbField;
    FIdplanoprev: TCmDbField;
    FMotivocancel: TCmDbField;
    FIdmovbenef: TCmDbField;
    FTipo: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FNumrecparcela1: TCmDbField;
    FValorop1: TCmDbField;
    FFator: TCmDbField;
    FDatafinal: TCmDbField;
    FSeqproposta: TCmDbField;
    FDatacancelamento: TCmDbField;
    FFlgdevolucao: TCmDbField;
    FQuantcotas: TCmDbField;
    FValorparareserva: TCmDbField;
    FCodreferencia: TCmDbField;
    FNumrecparcela2: TCmDbField;
    FSitrecebimento: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgdataindreserv: TCmDbField;
    FIdretroativo: TCmDbField;
    FOptratdiverg: TCmDbField;
    FPerccalculo: TCmDbField;
    FDatainicio: TCmDbField;
    FDtcobranca: TCmDbField;
    FFlgsitfundacao: TCmDbField;
    FFlgdivergente: TCmDbField;
    FDatarecebimento: TCmDbField;
    FValorrecebido: TCmDbField;
    FNumrecebimento: TCmDbField;
    FValorcalculado: TCmDbField;
    FCoddocumentoprev: TCmDbField;
    FFlgmanual: TCmDbField;
    FIdlote: TCmDbField;
    FValorop3: TCmDbField;
    FFlgcalcreserva: TCmDbField;
    FIdpessjur: TCmDbField;
    FIdregraalimreser: TCmDbField;
    FCodportforma: TCmDbField;
    FDataprevisaorece: TCmDbField;
    FVlrtotretroativo: TCmDbField;
    procedure SetCoddocumentoprev(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodreferencia(const Value: TCmDbField);
    procedure SetDatacancelamento(const Value: TCmDbField);
    procedure SetDataemisscob(const Value: TCmDbField);
    procedure SetDatafinal(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetDataprevisaorece(const Value: TCmDbField);
    procedure SetDatarecebimento(const Value: TCmDbField);
    procedure SetDataultalim(const Value: TCmDbField);
    procedure SetDtcobranca(const Value: TCmDbField);
    procedure SetFator(const Value: TCmDbField);
    procedure SetFlgaporte(const Value: TCmDbField);
    procedure SetFlgcalcreserva(const Value: TCmDbField);
    procedure SetFlgconcessao(const Value: TCmDbField);
    procedure SetFlgdataindreserv(const Value: TCmDbField);
    procedure SetFlgdescfolha(const Value: TCmDbField);
    procedure SetFlgdevolucao(const Value: TCmDbField);
    procedure SetFlgdivergente(const Value: TCmDbField);
    procedure SetFlgevento(const Value: TCmDbField);
    procedure SetFlgintevento(const Value: TCmDbField);
    procedure SetFlgmanual(const Value: TCmDbField);
    procedure SetFlgsitfundacao(const Value: TCmDbField);
    procedure SetFolhaorigem(const Value: TCmDbField);
    procedure SetFontepagadora(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdhistproposta(const Value: TCmDbField);
    procedure SetIdlancirrf(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdmotivo(const Value: TCmDbField);
    procedure SetIdmovbenef(const Value: TCmDbField);
    procedure SetIdparcelamento(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregraalimreser(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetIdretroativo(const Value: TCmDbField);
    procedure SetMescobranca(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetMotivocancel(const Value: TCmDbField);
    procedure SetNumrecebimento(const Value: TCmDbField);
    procedure SetNumrecparcela1(const Value: TCmDbField);
    procedure SetNumrecparcela2(const Value: TCmDbField);
    procedure SetOptratdiverg(const Value: TCmDbField);
    procedure SetParcela(const Value: TCmDbField);
    procedure SetPerccalculo(const Value: TCmDbField);
    procedure SetQuantcotas(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetSitrecebimento(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);
    procedure SetValorcalculado(const Value: TCmDbField);
    procedure SetValoresperado(const Value: TCmDbField);
    procedure SetValorop1(const Value: TCmDbField);
    procedure SetValorop2(const Value: TCmDbField);
    procedure SetValorop3(const Value: TCmDbField);
    procedure SetValorparareserva(const Value: TCmDbField);
    procedure SetValorrecebido(const Value: TCmDbField);
    procedure SetVlrdifretroativo(const Value: TCmDbField);
    procedure SetVlrtotretroativo(const Value: TCmDbField);

  public

     Property Vlrtotretroativo: TCmDbField read FVlrtotretroativo write SetVlrtotretroativo;
     Property Vlrdifretroativo: TCmDbField read FVlrdifretroativo write SetVlrdifretroativo;
     Property Valorrecebido: TCmDbField read FValorrecebido write SetValorrecebido;
     Property Valorparareserva: TCmDbField read FValorparareserva write SetValorparareserva;
     Property Valorop3: TCmDbField read FValorop3 write SetValorop3;
     Property Valorop2: TCmDbField read FValorop2 write SetValorop2;
     Property Valorop1: TCmDbField read FValorop1 write SetValorop1;
     Property Valoresperado: TCmDbField read FValoresperado write SetValoresperado;
     Property Valorcalculado: TCmDbField read FValorcalculado write SetValorcalculado;
     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Sitrecebimento: TCmDbField read FSitrecebimento write SetSitrecebimento;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Quantcotas: TCmDbField read FQuantcotas write SetQuantcotas;
     Property Perccalculo: TCmDbField read FPerccalculo write SetPerccalculo;
     Property Parcela: TCmDbField read FParcela write SetParcela;
     Property Optratdiverg: TCmDbField read FOptratdiverg write SetOptratdiverg;
     Property Numrecparcela2: TCmDbField read FNumrecparcela2 write SetNumrecparcela2;
     Property Numrecparcela1: TCmDbField read FNumrecparcela1 write SetNumrecparcela1;
     Property Numrecebimento: TCmDbField read FNumrecebimento write SetNumrecebimento;
     Property Motivocancel: TCmDbField read FMotivocancel write SetMotivocancel;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Mescobranca: TCmDbField read FMescobranca write SetMescobranca;
     Property Idretroativo: TCmDbField read FIdretroativo write SetIdretroativo;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Idregraalimreser: TCmDbField read FIdregraalimreser write SetIdregraalimreser;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idparcelamento: TCmDbField read FIdparcelamento write SetIdparcelamento;
     Property Idmovbenef: TCmDbField read FIdmovbenef write SetIdmovbenef;
     Property Idmotivo: TCmDbField read FIdmotivo write SetIdmotivo;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Idlancirrf: TCmDbField read FIdlancirrf write SetIdlancirrf;
     Property Idhistproposta: TCmDbField read FIdhistproposta write SetIdhistproposta;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Fontepagadora: TCmDbField read FFontepagadora write SetFontepagadora;
     Property Folhaorigem: TCmDbField read FFolhaorigem write SetFolhaorigem;
     Property Flgsitfundacao: TCmDbField read FFlgsitfundacao write SetFlgsitfundacao;
     Property Flgmanual: TCmDbField read FFlgmanual write SetFlgmanual;
     Property Flgintevento: TCmDbField read FFlgintevento write SetFlgintevento;
     Property Flgevento: TCmDbField read FFlgevento write SetFlgevento;
     Property Flgdivergente: TCmDbField read FFlgdivergente write SetFlgdivergente;
     Property Flgdevolucao: TCmDbField read FFlgdevolucao write SetFlgdevolucao;
     Property Flgdescfolha: TCmDbField read FFlgdescfolha write SetFlgdescfolha;
     Property Flgdataindreserv: TCmDbField read FFlgdataindreserv write SetFlgdataindreserv;
     Property Flgconcessao: TCmDbField read FFlgconcessao write SetFlgconcessao;
     Property Flgcalcreserva: TCmDbField read FFlgcalcreserva write SetFlgcalcreserva;
     Property Flgaporte: TCmDbField read FFlgaporte write SetFlgaporte;
     Property Fator: TCmDbField read FFator write SetFator;
     Property Dtcobranca: TCmDbField read FDtcobranca write SetDtcobranca;
     Property Dataultalim: TCmDbField read FDataultalim write SetDataultalim;
     Property Datarecebimento: TCmDbField read FDatarecebimento write SetDatarecebimento;
     Property Dataprevisaorece: TCmDbField read FDataprevisaorece write SetDataprevisaorece;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafinal: TCmDbField read FDatafinal write SetDatafinal;
     Property Dataemisscob: TCmDbField read FDataemisscob write SetDataemisscob;
     Property Datacancelamento: TCmDbField read FDatacancelamento write SetDatacancelamento;
     Property Codreferencia: TCmDbField read FCodreferencia write SetCodreferencia;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Coddocumentoprev: TCmDbField read FCoddocumentoprev write SetCoddocumentoprev;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBHstContribPrev }

constructor TDBHstContribPrev.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTCONTRIBPREV';

   fVlrtotretroativo := CreateCmDbField('VLRTOTRETROATIVO',ftfloat,False,False,False,True,'');
   fVlrdifretroativo := CreateCmDbField('VLRDIFRETROATIVO',ftfloat,False,False,False,True,'');
   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,False,False,False,True,'');
   fValorparareserva := CreateCmDbField('VALORPARARESERVA',ftfloat,False,False,False,True,'');
   fValorop3 := CreateCmDbField('VALOROP3',ftfloat,False,False,False,True,'');
   fValorop2 := CreateCmDbField('VALOROP2',ftfloat,False,False,False,True,'');
   fValorop1 := CreateCmDbField('VALOROP1',ftfloat,False,False,False,True,'');
   fValoresperado := CreateCmDbField('VALORESPERADO',ftfloat,False,False,False,True,'');
   fValorcalculado := CreateCmDbField('VALORCALCULADO',ftfloat,False,False,False,True,'');
   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'');
   fSitrecebimento := CreateCmDbField('SITRECEBIMENTO',ftString,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,False,False,True,'');
   fQuantcotas := CreateCmDbField('QUANTCOTAS',ftfloat,False,False,False,True,'');
   fPerccalculo := CreateCmDbField('PERCCALCULO',ftfloat,False,False,False,True,'');
   fParcela := CreateCmDbField('PARCELA',ftfloat,False,False,False,True,'');
   fOptratdiverg := CreateCmDbField('OPTRATDIVERG',ftfloat,False,False,False,True,'');
   fNumrecparcela2 := CreateCmDbField('NUMRECPARCELA2',ftfloat,False,False,False,True,'');
   fNumrecparcela1 := CreateCmDbField('NUMRECPARCELA1',ftfloat,False,False,False,True,'');
   fNumrecebimento := CreateCmDbField('NUMRECEBIMENTO',ftfloat,True,True,False,True,'');
   fMotivocancel := CreateCmDbField('MOTIVOCANCEL',ftString,False,False,False,True,'');
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,True,True,False,True,'');
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,True,True,False,True,'');
   fIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,False,False,False,True,'');
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,False,False,False,True,'');
   fIdregraalimreser := CreateCmDbField('IDREGRAALIMRESER',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,False,False,True,'');
   fIdparcelamento := CreateCmDbField('IDPARCELAMENTO',ftfloat,False,False,False,True,'');
   fIdmovbenef := CreateCmDbField('IDMOVBENEF',ftfloat,False,False,False,True,'');
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,True,True,False,True,'');
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,False,False,False,True,'');
   fIdlancirrf := CreateCmDbField('IDLANCIRRF',ftfloat,False,False,False,True,'');
   fIdhistproposta := CreateCmDbField('IDHISTPROPOSTA',ftfloat,False,False,False,True,'');
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,False,False,False,True,'');
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,False,False,False,True,'');
   fFolhaorigem := CreateCmDbField('FOLHAORIGEM',ftString,False,False,False,True,'');
   fFlgsitfundacao := CreateCmDbField('FLGSITFUNDACAO',ftString,False,False,False,True,'');
   fFlgmanual := CreateCmDbField('FLGMANUAL',ftfloat,False,False,False,True,'');
   fFlgintevento := CreateCmDbField('FLGINTEVENTO',ftString,False,False,False,True,'');
   fFlgevento := CreateCmDbField('FLGEVENTO',ftfloat,False,False,False,True,'');
   fFlgdivergente := CreateCmDbField('FLGDIVERGENTE',ftfloat,False,False,False,True,'');
   fFlgdevolucao := CreateCmDbField('FLGDEVOLUCAO',ftfloat,False,False,False,True,'');
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftfloat,False,False,False,True,'');
   fFlgdataindreserv := CreateCmDbField('FLGDATAINDRESERV',ftString,False,False,False,True,'');
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,False,False,False,True,'');
   fFlgcalcreserva := CreateCmDbField('FLGCALCRESERVA',ftfloat,False,False,False,True,'');
   fFlgaporte := CreateCmDbField('FLGAPORTE',ftfloat,False,False,False,True,'');
   fFator := CreateCmDbField('FATOR',ftfloat,False,False,False,True,'');
   fDtcobranca := CreateCmDbField('DTCOBRANCA',ftDateTime,False,False,False,True,'');
   fDataultalim := CreateCmDbField('DATAULTALIM',ftDateTime,False,False,False,True,'');
   fDatarecebimento := CreateCmDbField('DATARECEBIMENTO',ftDateTime,False,False,False,True,'');
   fDataprevisaorece := CreateCmDbField('DATAPREVISAORECE',ftDateTime,False,False,False,True,'');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
   fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,False,False,False,True,'');
   fDataemisscob := CreateCmDbField('DATAEMISSCOB',ftDateTime,False,False,False,True,'');
   fDatacancelamento := CreateCmDbField('DATACANCELAMENTO',ftDateTime,False,False,False,True,'');
   fCodreferencia := CreateCmDbField('CODREFERENCIA',ftString,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCoddocumentoprev := CreateCmDbField('CODDOCUMENTOPREV',ftfloat,False,False,False,True,'');
end;

function TDBHstContribPrev.Insert: Boolean;
begin

   fNumrecebimento.AsFloat := GetSequence('HSTCONTRIBPREV');
   Result := Inherited Insert;

end;


procedure TDBHstContribPrev.SetCoddocumentoprev(const Value: TCmDbField);
begin
  FCoddocumentoprev := Value;
end;

procedure TDBHstContribPrev.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDBHstContribPrev.SetCodreferencia(const Value: TCmDbField);
begin
  FCodreferencia := Value;
end;

procedure TDBHstContribPrev.SetDatacancelamento(const Value: TCmDbField);
begin
  FDatacancelamento := Value;
end;

procedure TDBHstContribPrev.SetDataemisscob(const Value: TCmDbField);
begin
  FDataemisscob := Value;
end;

procedure TDBHstContribPrev.SetDatafinal(const Value: TCmDbField);
begin
  FDatafinal := Value;
end;

procedure TDBHstContribPrev.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDBHstContribPrev.SetDataprevisaorece(const Value: TCmDbField);
begin
  FDataprevisaorece := Value;
end;

procedure TDBHstContribPrev.SetDatarecebimento(const Value: TCmDbField);
begin
  FDatarecebimento := Value;
end;

procedure TDBHstContribPrev.SetDataultalim(const Value: TCmDbField);
begin
  FDataultalim := Value;
end;

procedure TDBHstContribPrev.SetDtcobranca(const Value: TCmDbField);
begin
  FDtcobranca := Value;
end;

procedure TDBHstContribPrev.SetFator(const Value: TCmDbField);
begin
  FFator := Value;
end;

procedure TDBHstContribPrev.SetFlgaporte(const Value: TCmDbField);
begin
  FFlgaporte := Value;
end;

procedure TDBHstContribPrev.SetFlgcalcreserva(const Value: TCmDbField);
begin
  FFlgcalcreserva := Value;
end;

procedure TDBHstContribPrev.SetFlgconcessao(const Value: TCmDbField);
begin
  FFlgconcessao := Value;
end;

procedure TDBHstContribPrev.SetFlgdataindreserv(const Value: TCmDbField);
begin
  FFlgdataindreserv := Value;
end;

procedure TDBHstContribPrev.SetFlgdescfolha(const Value: TCmDbField);
begin
  FFlgdescfolha := Value;
end;

procedure TDBHstContribPrev.SetFlgdevolucao(const Value: TCmDbField);
begin
  FFlgdevolucao := Value;
end;

procedure TDBHstContribPrev.SetFlgdivergente(const Value: TCmDbField);
begin
  FFlgdivergente := Value;
end;

procedure TDBHstContribPrev.SetFlgevento(const Value: TCmDbField);
begin
  FFlgevento := Value;
end;

procedure TDBHstContribPrev.SetFlgintevento(const Value: TCmDbField);
begin
  FFlgintevento := Value;
end;

procedure TDBHstContribPrev.SetFlgmanual(const Value: TCmDbField);
begin
  FFlgmanual := Value;
end;

procedure TDBHstContribPrev.SetFlgsitfundacao(const Value: TCmDbField);
begin
  FFlgsitfundacao := Value;
end;

procedure TDBHstContribPrev.SetFolhaorigem(const Value: TCmDbField);
begin
  FFolhaorigem := Value;
end;

procedure TDBHstContribPrev.SetFontepagadora(const Value: TCmDbField);
begin
  FFontepagadora := Value;
end;

procedure TDBHstContribPrev.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDBHstContribPrev.SetIdhistproposta(const Value: TCmDbField);
begin
  FIdhistproposta := Value;
end;

procedure TDBHstContribPrev.SetIdlancirrf(const Value: TCmDbField);
begin
  FIdlancirrf := Value;
end;

procedure TDBHstContribPrev.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDBHstContribPrev.SetIdmotivo(const Value: TCmDbField);
begin
  FIdmotivo := Value;
end;

procedure TDBHstContribPrev.SetIdmovbenef(const Value: TCmDbField);
begin
  FIdmovbenef := Value;
end;

procedure TDBHstContribPrev.SetIdparcelamento(const Value: TCmDbField);
begin
  FIdparcelamento := Value;
end;

procedure TDBHstContribPrev.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDBHstContribPrev.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBHstContribPrev.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBHstContribPrev.SetIdregraalimreser(const Value: TCmDbField);
begin
  FIdregraalimreser := Value;
end;

procedure TDBHstContribPrev.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDBHstContribPrev.SetIdretroativo(const Value: TCmDbField);
begin
  FIdretroativo := Value;
end;

procedure TDBHstContribPrev.SetMescobranca(const Value: TCmDbField);
begin
  FMescobranca := Value;
end;

procedure TDBHstContribPrev.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDBHstContribPrev.SetMotivocancel(const Value: TCmDbField);
begin
  FMotivocancel := Value;
end;

procedure TDBHstContribPrev.SetNumrecebimento(const Value: TCmDbField);
begin
  FNumrecebimento := Value;
end;

procedure TDBHstContribPrev.SetNumrecparcela1(const Value: TCmDbField);
begin
  FNumrecparcela1 := Value;
end;

procedure TDBHstContribPrev.SetNumrecparcela2(const Value: TCmDbField);
begin
  FNumrecparcela2 := Value;
end;

procedure TDBHstContribPrev.SetOptratdiverg(const Value: TCmDbField);
begin
  FOptratdiverg := Value;
end;

procedure TDBHstContribPrev.SetParcela(const Value: TCmDbField);
begin
  FParcela := Value;
end;

procedure TDBHstContribPrev.SetPerccalculo(const Value: TCmDbField);
begin
  FPerccalculo := Value;
end;

procedure TDBHstContribPrev.SetQuantcotas(const Value: TCmDbField);
begin
  FQuantcotas := Value;
end;

procedure TDBHstContribPrev.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDBHstContribPrev.SetSitrecebimento(const Value: TCmDbField);
begin
  FSitrecebimento := Value;
end;

procedure TDBHstContribPrev.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

procedure TDBHstContribPrev.SetValorcalculado(const Value: TCmDbField);
begin
  FValorcalculado := Value;
end;

procedure TDBHstContribPrev.SetValoresperado(const Value: TCmDbField);
begin
  FValoresperado := Value;
end;

procedure TDBHstContribPrev.SetValorop1(const Value: TCmDbField);
begin
  FValorop1 := Value;
end;

procedure TDBHstContribPrev.SetValorop2(const Value: TCmDbField);
begin
  FValorop2 := Value;
end;

procedure TDBHstContribPrev.SetValorop3(const Value: TCmDbField);
begin
  FValorop3 := Value;
end;

procedure TDBHstContribPrev.SetValorparareserva(const Value: TCmDbField);
begin
  FValorparareserva := Value;
end;

procedure TDBHstContribPrev.SetValorrecebido(const Value: TCmDbField);
begin
  FValorrecebido := Value;
end;

procedure TDBHstContribPrev.SetVlrdifretroativo(const Value: TCmDbField);
begin
  FVlrdifretroativo := Value;
end;

procedure TDBHstContribPrev.SetVlrtotretroativo(const Value: TCmDbField);
begin
  FVlrtotretroativo := Value;
end;

end.



