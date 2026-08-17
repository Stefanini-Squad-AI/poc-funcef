{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 15/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHistRubSal;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHistRubSal = class(TCmDbObject)
  private
    FIdversaopagto: TCmDbField;
    FFlgsalpartatuaria: TCmDbField;
    FMes: TCmDbField;
    FSeqhistfunc: TCmDbField;
    FIdretroativo: TCmDbField;
    FNumprocinss: TCmDbField;
    FIdregracalculo: TCmDbField;
    FVlrantretroativo: TCmDbField;
    FIdhstfolhabenef: TCmDbField;
    FValorprovento: TCmDbField;
    FPercentualnadib: TCmDbField;
    FFlgpensaoalim: TCmDbField;
    FReferencia: TCmDbField;
    FCodirrfdarf: TCmDbField;
    FCodprovdesc: TCmDbField;
    FFlgsalbenefretro: TCmDbField;
    FIdlancirrf: TCmDbField;
    FValorinfo: TCmDbField;
    FIdpessjur: TCmDbField;
    FFlgcompoeremtotal: TCmDbField;
    FIdfavorecido: TCmDbField;
    FIdmotivo: TCmDbField;
    FFlgsalpartretro: TCmDbField;
    FCodmoeda: TCmDbField;
    FCoddocumento: TCmDbField;
    FIdplanoprev: TCmDbField;
    FTipoitempcs: TCmDbField;
    FValornadib: TCmDbField;
    FFlgcompoesalpart: TCmDbField;
    FFontepagadora: TCmDbField;
    FFlgirrf: TCmDbField;
    FValorcotas: TCmDbField;
    FNumbanco: TCmDbField;
    FIdtitular: TCmDbField;
    FFlgcompoesalbenef: TCmDbField;
    FMescobranca: TCmDbField;
    FContacorrente: TCmDbField;
    FIdlancirrfestorno: TCmDbField;
    FValorintegral: TCmDbField;
    FIdrubrica: TCmDbField;
    FIdpatro: TCmDbField;
    FSeqrubrica: TCmDbField;
    FIdresponsavel: TCmDbField;
    FFlgprevia: TCmDbField;
    FIdinforme: TCmDbField;
    FPercentual: TCmDbField;
    FLoteoriginal: TCmDbField;
    FDatapagamento: TCmDbField;
    FFlgtipodesc: TCmDbField;
    FFlgsrb: TCmDbField;
    FFlgequiparacao: TCmDbField;
    FFlgconcessao: TCmDbField;
    FCodportforma: TCmDbField;
    FFlgestorno: TCmDbField;
    FSeqoriginal: TCmDbField;
    FNumeroprocesso: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdmodulo: TCmDbField;
    FNumagencia: TCmDbField;
    FValorrecebido: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property Vlrantretroativo: TCmDbField read FVlrantretroativo write FVlrantretroativo;
    property Valorrecebido: TCmDbField read FValorrecebido write FValorrecebido;
    property Valorprovento: TCmDbField read FValorprovento write FValorprovento;
    property Valornadib: TCmDbField read FValornadib write FValornadib;
    property Valorintegral: TCmDbField read FValorintegral write FValorintegral;
    property Valorinfo: TCmDbField read FValorinfo write FValorinfo;
    property Valorcotas: TCmDbField read FValorcotas write FValorcotas;
    property Tipoitempcs: TCmDbField read FTipoitempcs write FTipoitempcs;
    property Seqrubrica: TCmDbField read FSeqrubrica write FSeqrubrica;
    property Seqoriginal: TCmDbField read FSeqoriginal write FSeqoriginal;
    property Seqhistfunc: TCmDbField read FSeqhistfunc write FSeqhistfunc;
    property Referencia: TCmDbField read FReferencia write FReferencia;
    property Percentualnadib: TCmDbField read FPercentualnadib write FPercentualnadib;
    property Percentual: TCmDbField read FPercentual write FPercentual;
    property Numprocinss: TCmDbField read FNumprocinss write FNumprocinss;
    property Numeroprocesso: TCmDbField read FNumeroprocesso write FNumeroprocesso;
    property Numbanco: TCmDbField read FNumbanco write FNumbanco;
    property Numagencia: TCmDbField read FNumagencia write FNumagencia;
    property Mescobranca: TCmDbField read FMescobranca write FMescobranca;
    property Mes: TCmDbField read FMes write FMes;
    property Loteoriginal: TCmDbField read FLoteoriginal write FLoteoriginal;
    property Idversaopagto: TCmDbField read FIdversaopagto write FIdversaopagto;
    property Idtitular: TCmDbField read FIdtitular write FIdtitular;
    property Idrubrica: TCmDbField read FIdrubrica write FIdrubrica;
    property Idretroativo: TCmDbField read FIdretroativo write FIdretroativo;
    property Idresponsavel: TCmDbField read FIdresponsavel write FIdresponsavel;
    property Idregracalculo: TCmDbField read FIdregracalculo write FIdregracalculo;
    property Idplanoprev: TCmDbField read FIdplanoprev write FIdplanoprev;
    property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
    property Idpessjur: TCmDbField read FIdpessjur write FIdpessjur;
    property Idpatro: TCmDbField read FIdpatro write FIdpatro;
    property Idmotivo: TCmDbField read FIdmotivo write FIdmotivo;
    property Idmodulo: TCmDbField read FIdmodulo write FIdmodulo;
    property Idlancirrfestorno: TCmDbField read FIdlancirrfestorno write FIdlancirrfestorno;
    property Idlancirrf: TCmDbField read FIdlancirrf write FIdlancirrf;
    property Idinforme: TCmDbField read FIdinforme write FIdinforme;
    property Idhstfolhabenef: TCmDbField read FIdhstfolhabenef write FIdhstfolhabenef;
    property Idfavorecido: TCmDbField read FIdfavorecido write FIdfavorecido;
    property Fontepagadora: TCmDbField read FFontepagadora write FFontepagadora;
    property Flgtipodesc: TCmDbField read FFlgtipodesc write FFlgtipodesc;
    property Flgsrb: TCmDbField read FFlgsrb write FFlgsrb;
    property Flgsalpartretro: TCmDbField read FFlgsalpartretro write FFlgsalpartretro;
    property Flgsalpartatuaria: TCmDbField read FFlgsalpartatuaria write FFlgsalpartatuaria;
    property Flgsalbenefretro: TCmDbField read FFlgsalbenefretro write FFlgsalbenefretro;
    property Flgprevia: TCmDbField read FFlgprevia write FFlgprevia;
    property Flgpensaoalim: TCmDbField read FFlgpensaoalim write FFlgpensaoalim;
    property Flgirrf: TCmDbField read FFlgirrf write FFlgirrf;
    property Flgestorno: TCmDbField read FFlgestorno write FFlgestorno;
    property Flgequiparacao: TCmDbField read FFlgequiparacao write FFlgequiparacao;
    property Flgconcessao: TCmDbField read FFlgconcessao write FFlgconcessao;
    property Flgcompoesalpart: TCmDbField read FFlgcompoesalpart write FFlgcompoesalpart;
    property Flgcompoesalbenef: TCmDbField read FFlgcompoesalbenef write FFlgcompoesalbenef;
    property Flgcompoeremtotal: TCmDbField read FFlgcompoeremtotal write FFlgcompoeremtotal;
    property Datapagamento: TCmDbField read FDatapagamento write FDatapagamento;
    property Contacorrente: TCmDbField read FContacorrente write FContacorrente;
    property Codprovdesc: TCmDbField read FCodprovdesc write FCodprovdesc;
    property Codportforma: TCmDbField read FCodportforma write FCodportforma;
    property Codmoeda: TCmDbField read FCodmoeda write FCodmoeda;
    property Codirrfdarf: TCmDbField read FCodirrfdarf write FCodirrfdarf;
    property Coddocumento: TCmDbField read FCoddocumento write FCoddocumento;
  end;

implementation

{ TDbHistRubSal }

constructor TDbHistRubSal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HISTRUBSAL';

  FVlrantretroativo := CreateCmDbField('VLRANTRETROATIVO',ftfloat,false,false,false,true,'');
  FValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,false,false,false,true,'');
  FValorprovento := CreateCmDbField('VALORPROVENTO',ftfloat,false,false,false,true,'');
  FValornadib := CreateCmDbField('VALORNADIB',ftfloat,false,false,false,true,'');
  FValorintegral := CreateCmDbField('VALORINTEGRAL',ftfloat,false,false,false,true,'');
  FValorinfo := CreateCmDbField('VALORINFO',ftfloat,false,false,false,true,'');
  FValorcotas := CreateCmDbField('VALORCOTAS',ftfloat,false,false,false,true,'');
  FTipoitempcs := CreateCmDbField('TIPOITEMPCS',ftfloat,false,false,false,true,'');
  FSeqrubrica := CreateCmDbField('SEQRUBRICA',ftfloat,true,true,false,true,'');
  FSeqoriginal := CreateCmDbField('SEQORIGINAL',ftfloat,false,false,false,true,'');
  FSeqhistfunc := CreateCmDbField('SEQHISTFUNC',ftfloat,false,false,false,true,'');
  FReferencia := CreateCmDbField('REFERENCIA',ftString,true,true,false,true,'');
  FPercentualnadib := CreateCmDbField('PERCENTUALNADIB',ftfloat,false,false,false,true,'');
  FPercentual := CreateCmDbField('PERCENTUAL',ftfloat,false,false,false,true,'');
  FNumprocinss := CreateCmDbField('NUMPROCINSS',ftString,false,false,false,true,'');
  FNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,false,false,false,true,'');
  FNumbanco := CreateCmDbField('NUMBANCO',ftString,false,false,false,true,'');
  FNumagencia := CreateCmDbField('NUMAGENCIA',ftString,false,false,false,true,'');
  FMescobranca := CreateCmDbField('MESCOBRANCA',ftString,true,true,false,true,'');
  FMes := CreateCmDbField('MES',ftString,true,true,false,true,'');
  FLoteoriginal := CreateCmDbField('LOTEORIGINAL',ftfloat,false,false,false,true,'');
  FIdversaopagto := CreateCmDbField('IDVERSAOPAGTO',ftfloat,false,false,false,true,'');
  FIdtitular := CreateCmDbField('IDTITULAR',ftfloat,false,false,false,true,'');
  FIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,true,true,false,true,'');
  FIdretroativo := CreateCmDbField('IDRETROATIVO',ftfloat,false,false,false,true,'');
  FIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,false,false,false,true,'');
  FIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,false,false,false,true,'');
  FIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,false,false,false,true,'');
  FIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,true,true,false,true,'');
  FIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,true,true,false,true,'');
  FIdpatro := CreateCmDbField('IDPATRO',ftfloat,false,false,false,true,'');
  FIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,true,true,false,true,'');
  FIdmodulo := CreateCmDbField('IDMODULO',ftfloat,false,false,false,true,'');
  FIdlancirrfestorno := CreateCmDbField('IDLANCIRRFESTORNO',ftfloat,false,false,false,true,'');
  FIdlancirrf := CreateCmDbField('IDLANCIRRF',ftfloat,false,false,false,true,'');
  FIdinforme := CreateCmDbField('IDINFORME',ftfloat,false,false,false,true,'');
  FIdhstfolhabenef := CreateCmDbField('IDHSTFOLHABENEF',ftfloat,false,false,false,true,'');
  FIdfavorecido := CreateCmDbField('IDFAVORECIDO',ftfloat,false,false,false,true,'');
  FFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,false,false,false,true,'');
  FFlgtipodesc := CreateCmDbField('FLGTIPODESC',ftString,false,false,false,true,'');
  FFlgsrb := CreateCmDbField('FLGSRB',ftfloat,false,false,false,true,'');
  FFlgsalpartretro := CreateCmDbField('FLGSALPARTRETRO',ftfloat,false,false,false,true,'');
  FFlgsalpartatuaria := CreateCmDbField('FLGSALPARTATUARIA',ftfloat,false,false,false,true,'');
  FFlgsalbenefretro := CreateCmDbField('FLGSALBENEFRETRO',ftfloat,false,false,false,true,'');
  FFlgprevia := CreateCmDbField('FLGPREVIA',ftfloat,false,false,false,true,'');
  FFlgpensaoalim := CreateCmDbField('FLGPENSAOALIM',ftfloat,false,false,false,true,'');
  FFlgirrf := CreateCmDbField('FLGIRRF',ftfloat,false,false,false,true,'');
  FFlgestorno := CreateCmDbField('FLGESTORNO',ftfloat,false,false,false,true,'');
  FFlgequiparacao := CreateCmDbField('FLGEQUIPARACAO',ftfloat,false,false,false,true,'');
  FFlgconcessao := CreateCmDbField('FLGCONCESSAO',ftfloat,false,false,false,true,'');
  FFlgcompoesalpart := CreateCmDbField('FLGCOMPOESALPART',ftfloat,false,false,false,true,'');
  FFlgcompoesalbenef := CreateCmDbField('FLGCOMPOESALBENEF',ftfloat,false,false,false,true,'');
  FFlgcompoeremtotal := CreateCmDbField('FLGCOMPOEREMTOTAL',ftfloat,false,false,false,true,'');
  FDatapagamento := CreateCmDbField('DATAPAGAMENTO',ftDateTime,false,false,false,true,'');
  FContacorrente := CreateCmDbField('CONTACORRENTE',ftString,false,false,false,true,'');
  FCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,true,false,false,true,'');
  FCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,false,false,false,true,'');
  FCodmoeda := CreateCmDbField('CODMOEDA',ftfloat,false,false,false,true,'');
  FCodirrfdarf := CreateCmDbField('CODIRRFDARF',ftString,false,false,false,true,'');
  FCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,false,false,false,true,'');
end;

end.
