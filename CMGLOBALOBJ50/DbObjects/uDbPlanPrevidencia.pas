//=============================================================================
//Pendência: 26262
//Descrição: Removido na base: DATAAPURAEXCED, DATALIBERAEXCED, DIACOBRANCA,
//           FLGAGRUPABOLETA, CODTIPRECDESIRRF, FLGEXCEDANIVERSA, FLGMESCOBRANCA,
//           FLGUSASALARIO, IDPLANOCOM, IDREGRAATRASOCOR, IDREGRAATRASOJUR, IDREGRADEVOLJUROS,
//           IDREGRAREAJCONTR, IDTPREAJCONTRIB, MESREAJCONTRIB, TPPLANOPREV
//           Criado na base da Valia: CODALTBAIXANPAGO, FLGGERACTNAOENV, FLGNGRAVACONTZERO.
//=============================================================================
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/08/2006                             }
{                                                       }
{*******************************************************}

unit uDBPlanPrevidencia;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBPlanPrevidencia = class(TCmDbObject)

  private
     fUnidnegocioirrf   : TCmDbField;
     fTipcodigoirrf     : TCmDbField;
     fResultlimite      : TCmDbField;
     fRecpagirrf        : TCmDbField;
     fRecpag            : TCmDbField;
     fPlanoirrf         : TCmDbField;
     fPlacontadirrf     : TCmDbField;
     fPlacontacirrf     : TCmDbField;
     fPatrolimite       : TCmDbField;
     fOrigemcmbeneficio : TCmDbField;
     fNuminscinicial    : TCmDbField;
     fNome              : TCmDbField;
     fMespgabono        : TCmDbField;
     fMenscobr2         : TCmDbField;
     fMenscobr          : TCmDbField;
     fIdtetosalpart     : TCmDbField;
     fIdrgtotcarencia   : TCmDbField;
     fIdrgsrb           : TCmDbField;
     fIdrgsalmedioatu   : TCmDbField;
     fIdrgelegbenef     : TCmDbField;
     fIdrgcarenciapatro : TCmDbField;
     fIdrgcarenciapart  : TCmDbField;
     fIdrescontroleatu  : TCmDbField;
     fIdrelatbeneficio  : TCmDbField;
     fIdregravlrdivida  : TCmDbField;
     fIdregratransfpla  : TCmDbField;
     fIdregrasimulaenq  : TCmDbField;
     fIdregrasdodevedor : TCmDbField;
     fIdregrasalparcela : TCmDbField;
     fIdregraopparcelas : TCmDbField;
     fIdregraelegreins  : TCmDbField;
     fIdregradesistenc  : TCmDbField;
     fIdregracobatraso  : TCmDbField;
     fIdregracarencia   : TCmDbField;
     fIdregracancelame  : TCmDbField;
     fIdregracancdesc   : TCmDbField;
     fIdregraamortiza   : TCmDbField;
     fIdregraadmissao   : TCmDbField;
     fIdplanoprev       : TCmDbField;
     fIdplanoatu        : TCmDbField;
     fIdfundacao        : TCmDbField;
     fIdfavorecidoirrf  : TCmDbField;
     fIdempresapropirrf : TCmDbField;
     fIdempresaprop     : TCmDbField;
     fIdempresairrf     : TCmDbField;
     fFlgusaevolfunc    : TCmDbField;
     fFlgtipogravainss  : TCmDbField;
     fFlgtipobuscacota  : TCmDbField;
     fFlgreservaultcot  : TCmDbField;
     fFlgrecalccontrib  : TCmDbField;
     fFlgreajinssnreq   : TCmDbField;
     fFlgngravacontzero : TCmDbField;
     fFlgndevcnafolha   : TCmDbField;
     fFlgincorporapens  : TCmDbField;
     fFlggeractnaoenv   : TCmDbField;
     fFlgdtalimreserva  : TCmDbField;
     fFlgcontabmantido  : TCmDbField;
     fFlgcalculalimite  : TCmDbField;
     fFlgautonuminsc    : TCmDbField;
     fCodtiprecdes      : TCmDbField;
     fCodtipdocirrf     : TCmDbField;
     fCodtipdoc         : TCmDbField;
     fCodsubcontairrf   : TCmDbField;
     fCodportformairrf  : TCmDbField;
     fCodigospc         : TCmDbField;
     fCoddesembirrf     : TCmDbField;
     fCodcentrespirrf   : TCmDbField;
     fCodcentcustdirrf  : TCmDbField;
     fCodcentcustcirrf  : TCmDbField;
     fCodaltbaixanpago  : TCmDbField;
     fTituloContab      : TCmDbField; //adilson

     procedure SetUnidnegocioirrf   (const Value: TCmDbField);
     procedure SetTipcodigoirrf     (const Value: TCmDbField);
     procedure SetResultlimite      (const Value: TCmDbField);
     procedure SetRecpagirrf        (const Value: TCmDbField);
     procedure SetRecpag            (const Value: TCmDbField);
     procedure SetPlanoirrf         (const Value: TCmDbField);
     procedure SetPlacontadirrf     (const Value: TCmDbField);
     procedure SetPlacontacirrf     (const Value: TCmDbField);
     procedure SetPatrolimite       (const Value: TCmDbField);
     procedure SetOrigemcmbeneficio (const Value: TCmDbField);
     procedure SetNuminscinicial    (const Value: TCmDbField);
     procedure SetNome              (const Value: TCmDbField);
     procedure SetMespgabono        (const Value: TCmDbField);
     procedure SetMenscobr2         (const Value: TCmDbField);
     procedure SetMenscobr          (const Value: TCmDbField);
     procedure SetIdtetosalpart     (const Value: TCmDbField);
     procedure SetIdrgtotcarencia   (const Value: TCmDbField);
     procedure SetIdrgsrb           (const Value: TCmDbField);
     procedure SetIdrgsalmedioatu   (const Value: TCmDbField);
     procedure SetIdrgelegbenef     (const Value: TCmDbField);
     procedure SetIdrgcarenciapatro (const Value: TCmDbField);
     procedure SetIdrgcarenciapart  (const Value: TCmDbField);
     procedure SetIdrescontroleatu  (const Value: TCmDbField);
     procedure SetIdrelatbeneficio  (const Value: TCmDbField);
     procedure SetIdregravlrdivida  (const Value: TCmDbField);
     procedure SetIdregratransfpla  (const Value: TCmDbField);
     procedure SetIdregrasimulaenq  (const Value: TCmDbField);
     procedure SetIdregrasdodevedor (const Value: TCmDbField);
     procedure SetIdregrasalparcela (const Value: TCmDbField);
     procedure SetIdregraopparcelas (const Value: TCmDbField);
     procedure SetIdregraelegreins  (const Value: TCmDbField);
     procedure SetIdregradesistenc  (const Value: TCmDbField);
     procedure SetIdregracobatraso  (const Value: TCmDbField);
     procedure SetIdregracarencia   (const Value: TCmDbField);
     procedure SetIdregracancelame  (const Value: TCmDbField);
     procedure SetIdregracancdesc   (const Value: TCmDbField);
     procedure SetIdregraamortiza   (const Value: TCmDbField);
     procedure SetIdregraadmissao   (const Value: TCmDbField);
     procedure SetIdplanoprev       (const Value: TCmDbField);
     procedure SetIdplanoatu        (const Value: TCmDbField);
     procedure SetIdfundacao        (const Value: TCmDbField);
     procedure SetIdfavorecidoirrf  (const Value: TCmDbField);
     procedure SetIdempresapropirrf (const Value: TCmDbField);
     procedure SetIdempresaprop     (const Value: TCmDbField);
     procedure SetIdempresairrf     (const Value: TCmDbField);
     procedure SetFlgusaevolfunc    (const Value: TCmDbField);
     procedure SetFlgtipogravainss  (const Value: TCmDbField);
     procedure SetFlgtipobuscacota  (const Value: TCmDbField);
     procedure SetFlgreservaultcot  (const Value: TCmDbField);
     procedure SetFlgrecalccontrib  (const Value: TCmDbField);
     procedure SetFlgreajinssnreq   (const Value: TCmDbField);
     procedure SetFlgngravacontzero (const Value: TCmDbField);
     procedure SetFlgndevcnafolha   (const Value: TCmDbField);
     procedure SetFlgincorporapens  (const Value: TCmDbField);
     procedure SetFlggeractnaoenv   (const Value: TCmDbField);
     procedure SetFlgdtalimreserva  (const Value: TCmDbField);
     procedure SetFlgcontabmantido  (const Value: TCmDbField);
     procedure SetFlgcalculalimite  (const Value: TCmDbField);
     procedure SetFlgautonuminsc    (const Value: TCmDbField);
     procedure SetCodtiprecdes      (const Value: TCmDbField);
     procedure SetCodtipdocirrf     (const Value: TCmDbField);
     procedure SetCodtipdoc         (const Value: TCmDbField);
     procedure SetCodsubcontairrf   (const Value: TCmDbField);
     procedure SetCodportformairrf  (const Value: TCmDbField);
     procedure SetCodigospc         (const Value: TCmDbField);
     procedure SetCoddesembirrf     (const Value: TCmDbField);
     procedure SetCodcentrespirrf   (const Value: TCmDbField);
     procedure SetCodcentcustdirrf  (const Value: TCmDbField);
     procedure SetCodcentcustcirrf  (const Value: TCmDbField);
     procedure SetCodaltbaixanpago  (const Value: TCmDbField);
     procedure SetTituloContab       (const Value: TCmDbField);//adilson

  public

     Property Unidnegocioirrf:   TCmDbField read FUnidnegocioirrf write SetUnidnegocioirrf;
     Property Tipcodigoirrf:     TCmDbField read FTipcodigoirrf write SetTipcodigoirrf;
     Property Resultlimite:      TCmDbField read FResultlimite write SetResultlimite;
     Property Recpagirrf:        TCmDbField read FRecpagirrf write SetRecpagirrf;
     Property Recpag:            TCmDbField read FRecpag write SetRecpag;
     Property Planoirrf:         TCmDbField read FPlanoirrf write SetPlanoirrf;
     Property Placontadirrf:     TCmDbField read FPlacontadirrf write SetPlacontadirrf;
     Property Placontacirrf:     TCmDbField read FPlacontacirrf write SetPlacontacirrf;
     Property Patrolimite:       TCmDbField read FPatrolimite write SetPatrolimite;
     Property Origemcmbeneficio: TCmDbField read FOrigemcmbeneficio write SetOrigemcmbeneficio;
     Property Numinscinicial:    TCmDbField read FNuminscinicial write SetNuminscinicial;
     Property Nome:              TCmDbField read FNome write SetNome;
     Property Mespgabono:        TCmDbField read FMespgabono write SetMespgabono;
     Property Menscobr2:         TCmDbField read FMenscobr2 write SetMenscobr2;
     Property Menscobr:          TCmDbField read FMenscobr write SetMenscobr;
     Property Idtetosalpart:     TCmDbField read FIdtetosalpart write SetIdtetosalpart;
     Property Idrgtotcarencia:   TCmDbField read FIdrgtotcarencia write SetIdrgtotcarencia;
     Property Idrgsrb:           TCmDbField read FIdrgsrb write SetIdrgsrb;
     Property Idrgsalmedioatu:   TCmDbField read FIdrgsalmedioatu write SetIdrgsalmedioatu;
     Property Idrgelegbenef:     TCmDbField read FIdrgelegbenef write SetIdrgelegbenef;
     Property Idrgcarenciapatro: TCmDbField read FIdrgcarenciapatro write SetIdrgcarenciapatro;
     Property Idrgcarenciapart:  TCmDbField read FIdrgcarenciapart write SetIdrgcarenciapart;
     Property Idrescontroleatu:  TCmDbField read FIdrescontroleatu write SetIdrescontroleatu;
     Property Idrelatbeneficio:  TCmDbField read FIdrelatbeneficio write SetIdrelatbeneficio;
     Property Idregravlrdivida:  TCmDbField read FIdregravlrdivida write SetIdregravlrdivida;
     Property Idregratransfpla:  TCmDbField read FIdregratransfpla write SetIdregratransfpla;
     Property Idregrasimulaenq:  TCmDbField read FIdregrasimulaenq write SetIdregrasimulaenq;
     Property Idregrasdodevedor: TCmDbField read FIdregrasdodevedor write SetIdregrasdodevedor;
     Property Idregrasalparcela: TCmDbField read FIdregrasalparcela write SetIdregrasalparcela;
     Property Idregraopparcelas: TCmDbField read FIdregraopparcelas write SetIdregraopparcelas;
     Property Idregraelegreins:  TCmDbField read FIdregraelegreins write SetIdregraelegreins;
     Property Idregradesistenc:  TCmDbField read FIdregradesistenc write SetIdregradesistenc;
     Property Idregracobatraso:  TCmDbField read FIdregracobatraso write SetIdregracobatraso;
     Property Idregracarencia:   TCmDbField read FIdregracarencia write SetIdregracarencia;
     Property Idregracancelame:  TCmDbField read FIdregracancelame write SetIdregracancelame;
     Property Idregracancdesc:   TCmDbField read FIdregracancdesc write SetIdregracancdesc;
     Property Idregraamortiza:   TCmDbField read FIdregraamortiza write SetIdregraamortiza;
     Property Idregraadmissao:   TCmDbField read FIdregraadmissao write SetIdregraadmissao;
     Property Idplanoprev:       TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanoatu:        TCmDbField read FIdplanoatu write SetIdplanoatu;
     Property Idfundacao:        TCmDbField read FIdfundacao write SetIdfundacao;
     Property Idfavorecidoirrf:  TCmDbField read FIdfavorecidoirrf write SetIdfavorecidoirrf;
     Property Idempresapropirrf: TCmDbField read FIdempresapropirrf write SetIdempresapropirrf;
     Property Idempresaprop:     TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Idempresairrf:     TCmDbField read FIdempresairrf write SetIdempresairrf;
     Property Flgusaevolfunc:    TCmDbField read FFlgusaevolfunc write SetFlgusaevolfunc;
     Property Flgtipogravainss:  TCmDbField read FFlgtipogravainss write SetFlgtipogravainss;
     Property Flgtipobuscacota:  TCmDbField read FFlgtipobuscacota write SetFlgtipobuscacota;
     Property Flgreservaultcot:  TCmDbField read FFlgreservaultcot write SetFlgreservaultcot;
     Property Flgrecalccontrib:  TCmDbField read FFlgrecalccontrib write SetFlgrecalccontrib;
     Property Flgreajinssnreq:   TCmDbField read FFlgreajinssnreq write SetFlgreajinssnreq;
     Property Flgngravacontzero: TCmDbField read FFlgngravacontzero write SetFlgngravacontzero;
     Property Flgndevcnafolha:   TCmDbField read FFlgndevcnafolha write SetFlgndevcnafolha;
     Property Flgincorporapens:  TCmDbField read FFlgincorporapens write SetFlgincorporapens;
     Property Flggeractnaoenv:   TCmDbField read FFlggeractnaoenv write SetFlggeractnaoenv;
     Property Flgdtalimreserva:  TCmDbField read FFlgdtalimreserva write SetFlgdtalimreserva;
     Property Flgcontabmantido:  TCmDbField read FFlgcontabmantido write SetFlgcontabmantido;
     Property Flgcalculalimite:  TCmDbField read FFlgcalculalimite write SetFlgcalculalimite;
     Property Flgautonuminsc:    TCmDbField read FFlgautonuminsc write SetFlgautonuminsc;
     Property Codtiprecdes:      TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codtipdocirrf:     TCmDbField read FCodtipdocirrf write SetCodtipdocirrf;
     Property Codtipdoc:         TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codsubcontairrf:   TCmDbField read FCodsubcontairrf write SetCodsubcontairrf;
     Property Codportformairrf:  TCmDbField read FCodportformairrf write SetCodportformairrf;
     Property Codigospc:         TCmDbField read FCodigospc write SetCodigospc;
     Property Coddesembirrf:     TCmDbField read FCoddesembirrf write SetCoddesembirrf;
     Property Codcentrespirrf:   TCmDbField read FCodcentrespirrf write SetCodcentrespirrf;
     Property Codcentcustdirrf:  TCmDbField read FCodcentcustdirrf write SetCodcentcustdirrf;
     Property Codcentcustcirrf:  TCmDbField read FCodcentcustcirrf write SetCodcentcustcirrf;
     Property Codaltbaixanpago:  TCmDbField read FCodaltbaixanpago write SetCodaltbaixanpago;
     Property TituloContab:      TCmDbField read FTituloContab write SetTituloContab;  //adilson

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanprev }

constructor TDBPlanPrevidencia.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANPREV';

   fUnidnegocioirrf   := CreateCmDbField('UNIDNEGOCIOIRRF',ftfloat,False,False,False,True,'');
   fTipcodigoirrf     := CreateCmDbField('TIPCODIGOIRRF',ftString,False,False,False,True,'');
   fResultlimite      := CreateCmDbField('RESULTLIMITE',ftfloat,False,False,False,True,'');
   fRecpagirrf        := CreateCmDbField('RECPAGIRRF',ftString,False,False,False,True,'');
   fRecpag            := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlanoirrf         := CreateCmDbField('PLANOIRRF',ftfloat,False,False,False,True,'');
   fPlacontadirrf     := CreateCmDbField('PLACONTADIRRF',ftString,False,False,False,True,'');
   fPlacontacirrf     := CreateCmDbField('PLACONTACIRRF',ftString,False,False,False,True,'');
   fPatrolimite       := CreateCmDbField('PATROLIMITE',ftfloat,False,False,False,True,'');
   fOrigemcmbeneficio := CreateCmDbField('ORIGEMCMBENEFICIO',ftfloat,False,False,False,True,'');
   fNuminscinicial    := CreateCmDbField('NUMINSCINICIAL',ftfloat,False,False,False,True,'');
   fNome              := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fMespgabono        := CreateCmDbField('MESPGABONO',ftString,False,False,False,True,'');
   fMenscobr2         := CreateCmDbField('MENSCOBR2',ftString,False,False,False,True,'');
   fMenscobr          := CreateCmDbField('MENSCOBR',ftString,False,False,False,True,'');
   fIdtetosalpart     := CreateCmDbField('IDTETOSALPART',ftfloat,False,False,False,True,'');
   fIdrgtotcarencia   := CreateCmDbField('IDRGTOTCARENCIA',ftfloat,False,False,False,True,'');
   fIdrgsrb           := CreateCmDbField('IDRGSRB',ftfloat,False,False,False,True,'');
   fIdrgsalmedioatu   := CreateCmDbField('IDRGSALMEDIOATU',ftfloat,False,False,False,True,'');
   fIdrgelegbenef     := CreateCmDbField('IDRGELEGBENEF',ftfloat,False,False,False,True,'');
   fIdrgcarenciapatro := CreateCmDbField('IDRGCARENCIAPATRO',ftfloat,False,False,False,True,'');
   fIdrgcarenciapart  := CreateCmDbField('IDRGCARENCIAPART',ftfloat,False,False,False,True,'');
   fIdrescontroleatu  := CreateCmDbField('IDRESCONTROLEATU',ftfloat,False,False,False,True,'');
   fIdrelatbeneficio  := CreateCmDbField('IDRELATBENEFICIO',ftfloat,False,False,False,True,'');
   fIdregravlrdivida  := CreateCmDbField('IDREGRAVLRDIVIDA',ftfloat,False,False,False,True,'');
   fIdregratransfpla  := CreateCmDbField('IDREGRATRANSFPLA',ftfloat,False,False,False,True,'');
   fIdregrasimulaenq  := CreateCmDbField('IDREGRASIMULAENQ',ftfloat,False,False,False,True,'');
   fIdregrasdodevedor := CreateCmDbField('IDREGRASDODEVEDOR',ftfloat,False,False,False,True,'');
   fIdregrasalparcela := CreateCmDbField('IDREGRASALPARCELA',ftfloat,False,False,False,True,'');
   fIdregraopparcelas := CreateCmDbField('IDREGRAOPPARCELAS',ftfloat,False,False,False,True,'');
   fIdregraelegreins  := CreateCmDbField('IDREGRAELEGREINS',ftfloat,False,False,False,True,'');
   fIdregradesistenc  := CreateCmDbField('IDREGRADESISTENC',ftfloat,False,False,False,True,'');
   fIdregracobatraso  := CreateCmDbField('IDREGRACOBATRASO',ftfloat,False,False,False,True,'');
   fIdregracarencia   := CreateCmDbField('IDREGRACARENCIA',ftfloat,False,False,False,True,'');
   fIdregracancelame  := CreateCmDbField('IDREGRACANCELAME',ftfloat,False,False,False,True,'');
   fIdregracancdesc   := CreateCmDbField('IDREGRACANCDESC',ftfloat,False,False,False,True,'');
   fIdregraamortiza   := CreateCmDbField('IDREGRAAMORTIZA',ftfloat,False,False,False,True,'');
   fIdregraadmissao   := CreateCmDbField('IDREGRAADMISSAO',ftfloat,False,False,False,True,'');
   fIdplanoprev       := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanoatu        := CreateCmDbField('IDPLANOATU',ftfloat,False,False,False,True,'');
   fIdfundacao        := CreateCmDbField('IDFUNDACAO',ftfloat,False,False,False,True,'');
   fIdfavorecidoirrf  := CreateCmDbField('IDFAVORECIDOIRRF',ftfloat,False,False,False,True,'');
   fIdempresapropirrf := CreateCmDbField('IDEMPRESAPROPIRRF',ftfloat,False,False,False,True,'');
   fIdempresaprop     := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresairrf     := CreateCmDbField('IDEMPRESAIRRF',ftfloat,False,False,False,True,'');
   fFlgusaevolfunc    := CreateCmDbField('FLGUSAEVOLFUNC',ftfloat,False,False,False,True,'');
   fFlgtipogravainss  := CreateCmDbField('FLGTIPOGRAVAINSS',ftfloat,False,False,False,True,'');
   fFlgtipobuscacota  := CreateCmDbField('FLGTIPOBUSCACOTA',ftfloat,False,False,False,True,'');
   fFlgreservaultcot  := CreateCmDbField('FLGRESERVAULTCOT',ftfloat,False,False,False,True,'');
   fFlgrecalccontrib  := CreateCmDbField('FLGRECALCCONTRIB',ftfloat,False,False,False,True,'');
   fFlgreajinssnreq   := CreateCmDbField('FLGREAJINSSNREQ',ftfloat,False,False,False,True,'');
   fFlgngravacontzero := CreateCmDbField('FLGNGRAVACONTZERO',ftfloat,False,False,False,True,'');
   fFlgndevcnafolha   := CreateCmDbField('FLGNDEVCNAFOLHA',ftfloat,False,False,False,True,'');
   fFlgincorporapens  := CreateCmDbField('FLGINCORPORAPENS',ftString,False,False,False,True,'');
   fFlggeractnaoenv   := CreateCmDbField('FLGGERACTNAOENV',ftfloat,False,False,False,True,'');
   fFlgdtalimreserva  := CreateCmDbField('FLGDTALIMRESERVA',ftfloat,False,False,False,True,'');
   fFlgcontabmantido  := CreateCmDbField('FLGCONTABMANTIDO',ftfloat,False,False,False,True,'');
   fFlgcalculalimite  := CreateCmDbField('FLGCALCULALIMITE',ftfloat,False,False,False,True,'');
   fFlgautonuminsc    := CreateCmDbField('FLGAUTONUMINSC',ftfloat,False,False,False,True,'');
   fCodtiprecdes      := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodtipdocirrf     := CreateCmDbField('CODTIPDOCIRRF',ftfloat,False,False,False,True,'');
   fCodtipdoc         := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodsubcontairrf   := CreateCmDbField('CODSUBCONTAIRRF',ftfloat,False,False,False,True,'');
   fCodportformairrf  := CreateCmDbField('CODPORTFORMAIRRF',ftfloat,False,False,False,True,'');
   fCodigospc         := CreateCmDbField('CODIGOSPC',ftString,False,False,False,True,'');
   fCoddesembirrf     := CreateCmDbField('CODDESEMBIRRF',ftString,False,False,False,True,'');
   fCodcentrespirrf   := CreateCmDbField('CODCENTRESPIRRF',ftString,False,False,False,True,'');
   fCodcentcustdirrf  := CreateCmDbField('CODCENTCUSTDIRRF',ftString,False,False,False,True,'');
   fCodcentcustcirrf  := CreateCmDbField('CODCENTCUSTCIRRF',ftString,False,False,False,True,'');
   fCodaltbaixanpago  := CreateCmDbField('CODALTBAIXANPAGO',ftfloat,False,False,False,True,'');

   fTituloContab     := CreateCmDbField('TITULOCONTAB',ftString,False,False,False,True,'');   //adilson
end;

function TDBPlanPrevidencia.Insert: Boolean;
begin

   fIdplanoprev.AsFloat := GetSequence('PLANPREV');
   Result := Inherited Insert;

end;

procedure TDBPlanPrevidencia.SetTituloContab(const Value: TCmDbField);
begin
   fTituloContab := Value;
end; //adilson


procedure TDBPlanPrevidencia.SetCodaltbaixanpago(const Value: TCmDbField);
begin
   fCodaltbaixanpago := Value;
end;

procedure TDBPlanPrevidencia.SetCodcentcustcirrf(const Value: TCmDbField);
begin
   fCodcentcustcirrf := Value;
end;

procedure TDBPlanPrevidencia.SetCodcentcustdirrf(const Value: TCmDbField);
begin
   fCodcentcustdirrf := Value;
end;

procedure TDBPlanPrevidencia.SetCodcentrespirrf(const Value: TCmDbField);
begin
   fCodcentrespirrf := Value;
end;

procedure TDBPlanPrevidencia.SetCoddesembirrf(const Value: TCmDbField);
begin
   fCoddesembirrf := Value;
end;

procedure TDBPlanPrevidencia.SetCodigospc(const Value: TCmDbField);
begin
   fCodigospc := Value;
end;

procedure TDBPlanPrevidencia.SetCodportformairrf(const Value: TCmDbField);
begin
   fCodportformairrf := Value;
end;

procedure TDBPlanPrevidencia.SetCodsubcontairrf(const Value: TCmDbField);
begin
   fCodsubcontairrf := Value;
end;

procedure TDBPlanPrevidencia.SetCodtipdoc(const Value: TCmDbField);
begin
   fCodtipdoc := Value;
end;

procedure TDBPlanPrevidencia.SetCodtipdocirrf(const Value: TCmDbField);
begin
   fCodtipdocirrf := Value;
end;

procedure TDBPlanPrevidencia.SetCodtiprecdes(const Value: TCmDbField);
begin
   fCodtiprecdes := Value;
end;

procedure TDBPlanPrevidencia.SetFlgautonuminsc(const Value: TCmDbField);
begin
   fFlgautonuminsc := Value;
end;

procedure TDBPlanPrevidencia.SetFlgcalculalimite(const Value: TCmDbField);
begin
   fFlgcalculalimite := Value;
end;

procedure TDBPlanPrevidencia.SetFlgcontabmantido(const Value: TCmDbField);
begin
   fFlgcontabmantido := Value;
end;

procedure TDBPlanPrevidencia.SetFlgdtalimreserva(const Value: TCmDbField);
begin
   fFlgdtalimreserva := Value;
end;

procedure TDBPlanPrevidencia.SetFlggeractnaoenv(const Value: TCmDbField);
begin
   fFlggeractnaoenv := Value;
end;

procedure TDBPlanPrevidencia.SetFlgincorporapens(const Value: TCmDbField);
begin
   fFlgincorporapens := Value;
end;


procedure TDBPlanPrevidencia.SetFlgndevcnafolha(const Value: TCmDbField);
begin
   fFlgndevcnafolha := Value;
end;

procedure TDBPlanPrevidencia.SetFlgngravacontzero(const Value: TCmDbField);
begin
   fFlgngravacontzero := Value;
end;

procedure TDBPlanPrevidencia.SetFlgreajinssnreq(const Value: TCmDbField);
begin
   fFlgreajinssnreq := Value;
end;

procedure TDBPlanPrevidencia.SetFlgrecalccontrib(const Value: TCmDbField);
begin
   fFlgrecalccontrib := Value;
end;

procedure TDBPlanPrevidencia.SetFlgreservaultcot(const Value: TCmDbField);
begin
   fFlgreservaultcot := Value;
end;

procedure TDBPlanPrevidencia.SetFlgtipobuscacota(const Value: TCmDbField);
begin
   fFlgtipobuscacota := Value;
end;

procedure TDBPlanPrevidencia.SetFlgtipogravainss(const Value: TCmDbField);
begin
   fFlgtipogravainss := Value;
end;

procedure TDBPlanPrevidencia.SetFlgusaevolfunc(const Value: TCmDbField);
begin
   fFlgusaevolfunc := Value;
end;

procedure TDBPlanPrevidencia.SetIdempresairrf(const Value: TCmDbField);
begin
   fIdempresairrf := Value;
end;

procedure TDBPlanPrevidencia.SetIdempresaprop(const Value: TCmDbField);
begin
   fIdempresaprop := Value;
end;

procedure TDBPlanPrevidencia.SetIdempresapropirrf(const Value: TCmDbField);
begin
   fIdempresapropirrf := Value;
end;

procedure TDBPlanPrevidencia.SetIdfavorecidoirrf(const Value: TCmDbField);
begin
   fIdfavorecidoirrf := Value;
end;

procedure TDBPlanPrevidencia.SetIdfundacao(const Value: TCmDbField);
begin
   fIdfundacao := Value;
end;

procedure TDBPlanPrevidencia.SetIdplanoatu(const Value: TCmDbField);
begin
   fIdplanoatu := Value;
end;


procedure TDBPlanPrevidencia.SetIdplanoprev(const Value: TCmDbField);
begin
   fIdplanoprev := Value;
end;

procedure TDBPlanPrevidencia.SetIdregraadmissao(const Value: TCmDbField);
begin
   fIdregraadmissao := Value;
end;

procedure TDBPlanPrevidencia.SetIdregraamortiza(const Value: TCmDbField);
begin

end;

procedure TDBPlanPrevidencia.SetIdregracancdesc(const Value: TCmDbField);
begin
   fIdregracancdesc := Value;
end;

procedure TDBPlanPrevidencia.SetIdregracancelame(const Value: TCmDbField);
begin
   fIdregracancelame := Value;
end;

procedure TDBPlanPrevidencia.SetIdregracarencia(const Value: TCmDbField);
begin
   fIdregracarencia := Value;
end;

procedure TDBPlanPrevidencia.SetIdregracobatraso(const Value: TCmDbField);
begin
   fIdregracobatraso := Value;
end;

procedure TDBPlanPrevidencia.SetIdregradesistenc(const Value: TCmDbField);
begin
   fIdregradesistenc := Value;
end;


procedure TDBPlanPrevidencia.SetIdregraelegreins(const Value: TCmDbField);
begin
   fIdregraelegreins := Value;
end;

procedure TDBPlanPrevidencia.SetIdregraopparcelas(const Value: TCmDbField);
begin
   fIdregraopparcelas := Value;
end;

procedure TDBPlanPrevidencia.SetIdregrasalparcela(const Value: TCmDbField);
begin
   fIdregrasalparcela := Value;
end;

procedure TDBPlanPrevidencia.SetIdregrasdodevedor(const Value: TCmDbField);
begin
   fIdregrasdodevedor := Value;
end;

procedure TDBPlanPrevidencia.SetIdregrasimulaenq(const Value: TCmDbField);
begin
   fIdregrasimulaenq := Value;
end;

procedure TDBPlanPrevidencia.SetIdregratransfpla(const Value: TCmDbField);
begin
   fIdregratransfpla := Value;
end;

procedure TDBPlanPrevidencia.SetIdregravlrdivida(const Value: TCmDbField);
begin
   fIdregravlrdivida := Value;
end;

procedure TDBPlanPrevidencia.SetIdrelatbeneficio(const Value: TCmDbField);
begin
   fIdrelatbeneficio := Value;
end;

procedure TDBPlanPrevidencia.SetIdrescontroleatu(const Value: TCmDbField);
begin
   fIdrescontroleatu := Value;
end;

procedure TDBPlanPrevidencia.SetIdrgcarenciapart(const Value: TCmDbField);
begin
   fIdrgcarenciapart := Value;
end;

procedure TDBPlanPrevidencia.SetIdrgcarenciapatro(const Value: TCmDbField);
begin
   fIdrgcarenciapatro := Value;
end;

procedure TDBPlanPrevidencia.SetIdrgelegbenef(const Value: TCmDbField);
begin
   fIdrgelegbenef := Value;
end;

procedure TDBPlanPrevidencia.SetIdrgsalmedioatu(const Value: TCmDbField);
begin
   fIdrgsalmedioatu := Value;
end;

procedure TDBPlanPrevidencia.SetIdrgsrb(const Value: TCmDbField);
begin
   fIdrgsrb := Value;
end;

procedure TDBPlanPrevidencia.SetIdrgtotcarencia(const Value: TCmDbField);
begin
   fIdrgtotcarencia := Value;
end;

procedure TDBPlanPrevidencia.SetIdtetosalpart(const Value: TCmDbField);
begin
   fIdtetosalpart := Value;
end;

procedure TDBPlanPrevidencia.SetMenscobr(const Value: TCmDbField);
begin
   fMenscobr := Value;
end;

procedure TDBPlanPrevidencia.SetMenscobr2(const Value: TCmDbField);
begin
   fMenscobr2 := Value;
end;

procedure TDBPlanPrevidencia.SetMespgabono(const Value: TCmDbField);
begin
   fMespgabono := Value;
end;

procedure TDBPlanPrevidencia.SetNome(const Value: TCmDbField);
begin
   fNome := Value;
end;

procedure TDBPlanPrevidencia.SetNuminscinicial(const Value: TCmDbField);
begin
   fNuminscinicial := Value;
end;

procedure TDBPlanPrevidencia.SetOrigemcmbeneficio(const Value: TCmDbField);
begin
   fOrigemcmbeneficio := Value;
end;

procedure TDBPlanPrevidencia.SetPatrolimite(const Value: TCmDbField);
begin
   fPatrolimite := Value;
end;

procedure TDBPlanPrevidencia.SetPlacontacirrf(const Value: TCmDbField);
begin
   fPlacontacirrf := Value;
end;

procedure TDBPlanPrevidencia.SetPlacontadirrf(const Value: TCmDbField);
begin
   fPlacontadirrf := Value;
end;

procedure TDBPlanPrevidencia.SetPlanoirrf(const Value: TCmDbField);
begin
   fPlanoirrf := Value;
end;

procedure TDBPlanPrevidencia.SetRecpag(const Value: TCmDbField);
begin
   fRecpag := Value;
end;

procedure TDBPlanPrevidencia.SetRecpagirrf(const Value: TCmDbField);
begin
   fRecpagirrf := Value;
end;

procedure TDBPlanPrevidencia.SetResultlimite(const Value: TCmDbField);
begin
   fResultlimite := Value;
end;

procedure TDBPlanPrevidencia.SetTipcodigoirrf(const Value: TCmDbField);
begin
   fTipcodigoirrf := Value;
end;

procedure TDBPlanPrevidencia.SetUnidnegocioirrf(const Value: TCmDbField);
begin
   fUnidnegocioirrf := Value;
end;

end.



