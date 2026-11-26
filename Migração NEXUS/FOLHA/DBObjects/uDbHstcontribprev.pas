{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbHstcontribprev;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbHstcontribprev = class(TCmDbObject)

  private

  public

     Property Vlrtotretroativo: TCmDbField;
     Property Vlrdifretroativo: TCmDbField;
     Property Valorrecebido: TCmDbField;
     Property Valorparareserva: TCmDbField;
     Property Valorop3: TCmDbField;
     Property Valorop2: TCmDbField;
     Property Valorop1: TCmDbField;
     Property Valoresperado: TCmDbField;
     Property Valorcalculado: TCmDbField;
     Property Valorbase2: TCmDbField;
     Property Valorbase1: TCmDbField;
     Property Tipo: TCmDbField;
     Property Sitrecebimento: TCmDbField;
     Property Seqproposta: TCmDbField;
     Property Quantcotas: TCmDbField;
     Property Plncodigoprev: TCmDbField;
     Property Plncodigoefet: TCmDbField;
     Property Percreserva: TCmDbField;
     Property Perccalculo: TCmDbField;
     Property Parcela: TCmDbField;
     Property Optratdiverg: TCmDbField;
     Property Numrecparcela2: TCmDbField;
     Property Numrecparcela1: TCmDbField;
     Property Numrecebimento: TCmDbField;
     Property Motivocancel: TCmDbField;
     Property Mesreferencia: TCmDbField;
     Property Mescobranca: TCmDbField;
     Property Idretroativo: TCmDbField;
     Property Idregracalculo: TCmDbField;
     Property Idregraalimreser: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idmotivo: TCmDbField;
     Property Idlote: TCmDbField;
     Property Idlancirrf: TCmDbField;
     Property Idhistproposta: TCmDbField;
     Property Idcontribuicao: TCmDbField;
     Property Fontepagadora: TCmDbField;
     Property Flgsitfundacao: TCmDbField;
     Property Flgintevento: TCmDbField;
     Property Flgevento: TCmDbField;
     Property Flgdivergente: TCmDbField;
     Property Flgdevolucao: TCmDbField;
     Property Flgdescfolha: TCmDbField;
     Property Flgdataindreserv: TCmDbField;
     Property Flgconcessao: TCmDbField;
     Property Flgcalcreserva: TCmDbField;
     Property Flgaporte: TCmDbField;
     Property Fator: TCmDbField;
     Property Dtcobranca: TCmDbField;
     Property Dataultalim: TCmDbField;
     Property Datarecebimento: TCmDbField;
     Property Dataprevisaorece: TCmDbField;
     Property Datainicio: TCmDbField;
     Property Datafinal: TCmDbField;
     Property Dataemisscob: TCmDbField;
     Property Datacancelamento: TCmDbField;
     Property Codreferencia: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Coddocumentoprev: TCmDbField;
     Property Coddocumentoefet: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbHstcontribprev }

constructor TDbHstcontribprev.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTCONTRIBPREV';

   fVlrtotretroativo := CreateCmDbField('VLRTOTRETROATIVO',ftfloat,True,False);
   fVlrdifretroativo := CreateCmDbField('VLRDIFRETROATIVO',ftfloat,True,False);
   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,True,False);
   fValorparareserva := CreateCmDbField('VALORPARARESERVA',ftfloat,True,False);
   fValorop3 := CreateCmDbField('VALOROP3',ftfloat,True,False);
   fValorop2 := CreateCmDbField('VALOROP2',ftfloat,True,False);
   fValorop1 := CreateCmDbField('VALOROP1',ftfloat,True,False);
   fValoresperado := CreateCmDbField('VALORESPERADO',ftfloat,True,False);
   fValorcalculado := CreateCmDbField('VALORCALCULADO',ftfloat,True,False);
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,True,False);
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,True,False);
   fTipo := CreateCmDbField('TIPO',ftString,True,False);
   fSitrecebimento := CreateCmDbField('SITRECEBIMENTO',ftString,True,False);
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,False);
   fQuantcotas := CreateCmDbField('QUANTCOTAS',ftfloat,True,False);
   fPlncodigoprev := CreateCmDbField('PLNCODIGOPREV',ftfloat,True,False);
   fPlncodigoefet := CreateCmDbField('PLNCODIGOEFET',ftfloat,True,False);
   fPercreserva := CreateCmDbField('PERCRESERVA',ftfloat,True,False);
   fPerccalculo := CreateCmDbField('PERCCALCULO',ftfloat,True,False);
   fParcela := CreateCmDbField('PARCELA',ftfloat,True,False);
   fOptratdiverg := CreateCmDbField('OPTRATDIVERG',ftfloat,True,False);
   fNumrecparcela2 := CreateCmDbField('NUMRECPARCELA2',ftfloat,True,False);
   fNumrecparcela1 := CreateCmDbField('NUMRECPARCELA1',ftfloat,True,False);
   fNumrecebimento := CreateCmDbField('NUMRECEBIMENTO',ftfloat,False,True);
   fMotivocancel := CreateCmDbField('MOTIVOCANCEL',ftString,True,False);
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,False,True);
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,False,True);
   fIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,True,False);
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,True,False);
   fIdregraalimreser := CreateCmDbField('IDREGRAALIMRESER',ftfloat,True,False);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,False);
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,False,True);
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,True,False);
   fIdlancirrf := CreateCmDbField('IDLANCIRRF',ftfloat,True,False);
   fIdhistproposta := CreateCmDbField('IDHISTPROPOSTA',ftfloat,True,False);
   fIdcontribuicao := CreateCmDbField('IDCONTRIBUICAO',ftfloat,True,False);
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,True,False);
   fFlgsitfundacao := CreateCmDbField('FLGSITFUNDACAO',ftString,True,False);
   fFlgintevento := CreateCmDbField('FLGINTEVENTO',ftString,True,False);
   fFlgevento := CreateCmDbField('FLGEVENTO',ftfloat,True,False);
   fFlgdivergente := CreateCmDbField('FLGDIVERGENTE',ftfloat,True,False);
   fFlgdevolucao := CreateCmDbField('FLGDEVOLUCAO',ftfloat,True,False);
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftfloat,True,False);
   fFlgdataindreserv := CreateCmDbField('FLGDATAINDRESERV',ftString,True,False);
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,True,False);
   fFlgcalcreserva := CreateCmDbField('FLGCALCRESERVA',ftfloat,True,False);
   fFlgaporte := CreateCmDbField('FLGAPORTE',ftfloat,True,False);
   fFator := CreateCmDbField('FATOR',ftfloat,True,False);
   fDtcobranca := CreateCmDbField('DTCOBRANCA',ftDateTime,True,False);
   fDataultalim := CreateCmDbField('DATAULTALIM',ftDateTime,True,False);
   fDatarecebimento := CreateCmDbField('DATARECEBIMENTO',ftDateTime,True,False);
   fDataprevisaorece := CreateCmDbField('DATAPREVISAORECE',ftDateTime,True,False);
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,True,False);
   fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,True,False);
   fDataemisscob := CreateCmDbField('DATAEMISSCOB',ftDateTime,True,False);
   fDatacancelamento := CreateCmDbField('DATACANCELAMENTO',ftDateTime,True,False);
   fCodreferencia := CreateCmDbField('CODREFERENCIA',ftString,True,False);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
   fCoddocumentoprev := CreateCmDbField('CODDOCUMENTOPREV',ftfloat,True,False);
   fCoddocumentoefet := CreateCmDbField('CODDOCUMENTOEFET',ftfloat,True,False);
end;

function TDbHstcontribprev.Insert: Boolean;
begin

   fNumrecebimento.AsFloat := GetSequence(HSTCONTRIBPREV);
   fIdmotivo.AsFloat := GetSequence(HSTCONTRIBPREV);
   Result := Inherited Insert;

end;

end.



