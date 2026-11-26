{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbHistrubsal;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbHistrubsal = class(TCmDbObject)

  private

  public

     Property Vlrantretroativo: TCmDbField;
     Property Valorrecebido: TCmDbField;
     Property Valorprovento: TCmDbField;
     Property Valornadib: TCmDbField;
     Property Valorintegral: TCmDbField;
     Property Valorinfo: TCmDbField;
     Property Valorcotas: TCmDbField;
     Property Tipoitempcs: TCmDbField;
     Property Seqrubrica: TCmDbField;
     Property Seqoriginal: TCmDbField;
     Property Seqhistfunc: TCmDbField;
     Property Referencia: TCmDbField;
     Property Percentualnadib: TCmDbField;
     Property Numbanco: TCmDbField;
     Property Numagencia: TCmDbField;
     Property Mescobranca: TCmDbField;
     Property Mes: TCmDbField;
     Property Loteoriginal: TCmDbField;
     Property Idversaopagto: TCmDbField;
     Property Idtitular: TCmDbField;
     Property Idrubrica: TCmDbField;
     Property Idretroativo: TCmDbField;
     Property Idresponsavel: TCmDbField;
     Property Idregracalculo: TCmDbField;
     Property Idplanoprev: TCmDbField;
     Property Idpessoa: TCmDbField;
     Property Idpessjur: TCmDbField;
     Property Idpatro: TCmDbField;
     Property Idmotivo: TCmDbField;
     Property Idmodulo: TCmDbField;
     Property Idlancirrfestorno: TCmDbField;
     Property Idlancirrf: TCmDbField;
     Property Idinforme: TCmDbField;
     Property Idhstfolhabenef: TCmDbField;
     Property Idfavorecido: TCmDbField;
     Property Idcbancaria: TCmDbField;
     Property Fontepagadora: TCmDbField;
     Property Flgtipodesc: TCmDbField;
     Property Flgsrb: TCmDbField;
     Property Flgsalpartretro: TCmDbField;
     Property Flgsalpartatuaria: TCmDbField;
     Property Flgsalbenefretro: TCmDbField;
     Property Flgprevia: TCmDbField;
     Property Flgpensaoalim: TCmDbField;
     Property Flgirrf: TCmDbField;
     Property Flgestorno: TCmDbField;
     Property Flgequiparacao: TCmDbField;
     Property Flgconcessao: TCmDbField;
     Property Flgcompoesalpart: TCmDbField;
     Property Flgcompoesalbenef: TCmDbField;
     Property Flgcompoeremtotal: TCmDbField;
     Property Datapagamento: TCmDbField;
     Property Contacorrente: TCmDbField;
     Property Codprovdesc: TCmDbField;
     Property Codportforma: TCmDbField;
     Property Codmoeda: TCmDbField;
     Property Codirrfdarf: TCmDbField;
     Property Coddocumento: TCmDbField;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbHistrubsal }

constructor TDbHistrubsal.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTRUBSAL';

   fVlrantretroativo := CreateCmDbField('VLRANTRETROATIVO',ftfloat,True,False);
   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,True,False);
   fValorprovento := CreateCmDbField('VALORPROVENTO',ftfloat,True,False);
   fValornadib := CreateCmDbField('VALORNADIB',ftfloat,True,False);
   fValorintegral := CreateCmDbField('VALORINTEGRAL',ftfloat,True,False);
   fValorinfo := CreateCmDbField('VALORINFO',ftfloat,True,False);
   fValorcotas := CreateCmDbField('VALORCOTAS',ftfloat,True,False);
   fTipoitempcs := CreateCmDbField('TIPOITEMPCS',ftfloat,True,False);
   fSeqrubrica := CreateCmDbField('SEQRUBRICA',ftfloat,False,True);
   fSeqoriginal := CreateCmDbField('SEQORIGINAL',ftfloat,True,False);
   fSeqhistfunc := CreateCmDbField('SEQHISTFUNC',ftfloat,True,False);
   fReferencia := CreateCmDbField('REFERENCIA',ftString,False,True);
   fPercentualnadib := CreateCmDbField('PERCENTUALNADIB',ftfloat,True,False);
   fNumbanco := CreateCmDbField('NUMBANCO',ftString,True,False);
   fNumagencia := CreateCmDbField('NUMAGENCIA',ftString,True,False);
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,False,True);
   fMes := CreateCmDbField('MES',ftString,False,True);
   fLoteoriginal := CreateCmDbField('LOTEORIGINAL',ftfloat,True,False);
   fIdversaopagto := CreateCmDbField('IDVERSAOPAGTO',ftfloat,True,False);
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,False);
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,False,True);
   fIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,True,False);
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,False);
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,True,False);
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,False);
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,True);
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,True);
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,False);
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,False,True);
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False);
   fIdlancirrfestorno := CreateCmDbField('IDLANCIRRFESTORNO',ftfloat,True,False);
   fIdlancirrf := CreateCmDbField('IDLANCIRRF',ftfloat,True,False);
   fIdinforme := CreateCmDbField('IDINFORME',ftfloat,True,False);
   fIdhstfolhabenef := CreateCmDbField('IDHSTFOLHABENEF',ftfloat,True,False);
   fIdfavorecido := CreateCmDbField('IDFAVORECIDO',ftfloat,True,False);
   fIdcbancaria := CreateCmDbField('IDCBANCARIA',ftfloat,True,False);
   fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,True,False);
   fFlgtipodesc := CreateCmDbField('FLGTIPODESC',ftString,True,False);
   fFlgsrb := CreateCmDbField('FLGSRB',ftfloat,True,False);
   fFlgsalpartretro := CreateCmDbField('FLGSALPARTRETRO',ftfloat,True,False);
   fFlgsalpartatuaria := CreateCmDbField('FLGSALPARTATUARIA',ftfloat,True,False);
   fFlgsalbenefretro := CreateCmDbField('FLGSALBENEFRETRO',ftfloat,True,False);
   fFlgprevia := CreateCmDbField('FLGPREVIA',ftfloat,True,False);
   fFlgpensaoalim := CreateCmDbField('FLGPENSAOALIM',ftfloat,True,False);
   fFlgirrf := CreateCmDbField('FLGIRRF',ftfloat,True,False);
   fFlgestorno := CreateCmDbField('FLGESTORNO',ftfloat,True,False);
   fFlgequiparacao := CreateCmDbField('FLGEQUIPARACAO',ftfloat,True,False);
   fFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,True,False);
   fFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,True,False);
   fFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,True,False);
   fFlgcompoeremtotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftfloat,True,False);
   fDatapagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,True,False);
   fContacorrente := CreateCmDbField('CONTACORRENTE',ftString,True,False);
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,False,False);
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,True,False);
   fCodmoeda := CreateCmDbField('CODMOEDA',ftfloat,True,False);
   fCodirrfdarf := CreateCmDbField('CODIRRFDARF',ftString,True,False);
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,False);
end;

function TDbHistrubsal.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

end.



