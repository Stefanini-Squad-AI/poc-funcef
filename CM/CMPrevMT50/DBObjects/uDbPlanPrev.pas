unit uDbPlanPrev;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Gleyber
// Data        : 28/05/2006
// Pendência   : 22206
// Alteração   : Inclusão do campo IDREGRAVLRRESERVA
//------------------------------------------------------------------------------

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanprev = class(TCmDbObject)

  private
    FIdregradesistenc: TCmDbField;
    FFlggeractnaoenv: TCmDbField;
    FOrigemcmbeneficio: TCmDbField;
    FIdregracobatraso: TCmDbField;
    FIdfavorecidoirrf: TCmDbField;
    FIdregraatrasojur: TCmDbField;
    FRecpag: TCmDbField;
    FIdregraamortiza: TCmDbField;
    FIdrgsalmedioatu: TCmDbField;
    FResultlimite: TCmDbField;
    FFlgreservaultcot: TCmDbField;
    FMenscobr2: TCmDbField;
    FFlgtipogravainss: TCmDbField;
    FIndicereajcontrib: TCmDbField;
    FCodtipdocirrf: TCmDbField;
    FNuminscinicial: TCmDbField;
    FMenscobr: TCmDbField;
    FTpplanoprev: TCmDbField;
    FIdregratransfpla: TCmDbField;
    FCodigospc: TCmDbField;
    FFlgtipobuscacota: TCmDbField;
    FIdregradevolcorr: TCmDbField;
    FMespgabono: TCmDbField;
    FIdplanoatu: TCmDbField;
    FIdregrasimulaenq: TCmDbField;
    FIdrgtotcarencia: TCmDbField;
    FIdregracancdesc: TCmDbField;
    FFlgincorporapens: TCmDbField;
    FCodcentcustcirrf: TCmDbField;
    FIdrgelegbenef: TCmDbField;
    FIdtetosalpart: TCmDbField;
    FFlgdtalimreserva: TCmDbField;
    FPlanoirrf: TCmDbField;
    FIdrgsrb: TCmDbField;
    FCodaltbaixanpago: TCmDbField;
    FIdempresairrf: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdregraatrasocor: TCmDbField;
    FTipcodigoirrf: TCmDbField;
    FIdregrasdodevedor: TCmDbField;
    FFlgngravacontzero: TCmDbField;
    FCodtipdoc: TCmDbField;
    FFlgusasalario: TCmDbField;
    FIdregrareajcontr: TCmDbField;
    FFlgndevcnafolha: TCmDbField;
    FPatrolimite: TCmDbField;
    FCodcentcustdirrf: TCmDbField;
    FIdregraopparcelas: TCmDbField;
    FFlgautonuminsc: TCmDbField;
    FPlacontadirrf: TCmDbField;
    FCodtiprecdesirrf: TCmDbField;
    FCodsubcontairrf: TCmDbField;
    FMesreajcontrib: TCmDbField;
    FIdtpreajcontrib: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FFlgrecalccontrib: TCmDbField;
    FIdfundacao: TCmDbField;
    FIdempresapropirrf: TCmDbField;
    FIdrgcarenciapart: TCmDbField;
    FIdrescontroleatu: TCmDbField;
    FFlgmescobranca: TCmDbField;
    FRecpagirrf: TCmDbField;
    FIdregrasalparcela: TCmDbField;
    FDiacobranca: TCmDbField;
    FFlgreajinssnreq: TCmDbField;
    FNome: TCmDbField;
    FPlacontacirrf: TCmDbField;
    FCodportformairrf: TCmDbField;
    FIdregravlrdivida: TCmDbField;
    FIdplanocom: TCmDbField;
    FIdrgcarenciapatro: TCmDbField;
    FIdempresaprop: TCmDbField;
    FIdregraelegreins: TCmDbField;
    FIdregracancelame: TCmDbField;
    FFlgagrupaboleta: TCmDbField;
    FDataliberaexced: TCmDbField;
    FDataapuraexced: TCmDbField;
    FIdrelatbeneficio: TCmDbField;
    FIdregradevoljuros: TCmDbField;
    FIdregraadmissao: TCmDbField;
    FFlgusaevolfunc: TCmDbField;
    FCoddesembirrf: TCmDbField;
    FUnidnegocioirrf: TCmDbField;
    FCodcentrespirrf: TCmDbField;
    FFlgexcedaniversa: TCmDbField;
    FFlgcontabmantido: TCmDbField;
    FFlgcalculalimite: TCmDbField;
    FIdregracarencia: TCmDbField;
    FIdRegraVlrReserva: TCmDbField;
    procedure SetCodaltbaixanpago(const Value: TCmDbField);
    procedure SetCodcentcustcirrf(const Value: TCmDbField);
    procedure SetCodcentcustdirrf(const Value: TCmDbField);
    procedure SetCodcentrespirrf(const Value: TCmDbField);
    procedure SetCoddesembirrf(const Value: TCmDbField);
    procedure SetCodigospc(const Value: TCmDbField);
    procedure SetCodportformairrf(const Value: TCmDbField);
    procedure SetCodsubcontairrf(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetCodtipdocirrf(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetCodtiprecdesirrf(const Value: TCmDbField);
    procedure SetDataapuraexced(const Value: TCmDbField);
    procedure SetDataliberaexced(const Value: TCmDbField);
    procedure SetDiacobranca(const Value: TCmDbField);
    procedure SetFlgagrupaboleta(const Value: TCmDbField);
    procedure SetFlgautonuminsc(const Value: TCmDbField);
    procedure SetFlgcalculalimite(const Value: TCmDbField);
    procedure SetFlgcontabmantido(const Value: TCmDbField);
    procedure SetFlgdtalimreserva(const Value: TCmDbField);
    procedure SetFlgexcedaniversa(const Value: TCmDbField);
    procedure SetFlggeractnaoenv(const Value: TCmDbField);
    procedure SetFlgincorporapens(const Value: TCmDbField);
    procedure SetFlgmescobranca(const Value: TCmDbField);
    procedure SetFlgndevcnafolha(const Value: TCmDbField);
    procedure SetFlgngravacontzero(const Value: TCmDbField);
    procedure SetFlgreajinssnreq(const Value: TCmDbField);
    procedure SetFlgrecalccontrib(const Value: TCmDbField);
    procedure SetFlgreservaultcot(const Value: TCmDbField);
    procedure SetFlgtipobuscacota(const Value: TCmDbField);
    procedure SetFlgtipogravainss(const Value: TCmDbField);
    procedure SetFlgusaevolfunc(const Value: TCmDbField);
    procedure SetFlgusasalario(const Value: TCmDbField);
    procedure SetIdempresairrf(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdempresapropirrf(const Value: TCmDbField);
    procedure SetIdfavorecidoirrf(const Value: TCmDbField);
    procedure SetIdfundacao(const Value: TCmDbField);
    procedure SetIdplanoatu(const Value: TCmDbField);
    procedure SetIdplanocom(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregraadmissao(const Value: TCmDbField);
    procedure SetIdregraamortiza(const Value: TCmDbField);
    procedure SetIdregraatrasocor(const Value: TCmDbField);
    procedure SetIdregraatrasojur(const Value: TCmDbField);
    procedure SetIdregracancdesc(const Value: TCmDbField);
    procedure SetIdregracancelame(const Value: TCmDbField);
    procedure SetIdregracarencia(const Value: TCmDbField);
    procedure SetIdregracobatraso(const Value: TCmDbField);
    procedure SetIdregradesistenc(const Value: TCmDbField);
    procedure SetIdregradevolcorr(const Value: TCmDbField);
    procedure SetIdregradevoljuros(const Value: TCmDbField);
    procedure SetIdregraelegreins(const Value: TCmDbField);
    procedure SetIdregraopparcelas(const Value: TCmDbField);
    procedure SetIdregrareajcontr(const Value: TCmDbField);
    procedure SetIdregrasalparcela(const Value: TCmDbField);
    procedure SetIdregrasdodevedor(const Value: TCmDbField);
    procedure SetIdregrasimulaenq(const Value: TCmDbField);
    procedure SetIdregratransfpla(const Value: TCmDbField);
    procedure SetIdregravlrdivida(const Value: TCmDbField);
    procedure SetIdrelatbeneficio(const Value: TCmDbField);
    procedure SetIdrescontroleatu(const Value: TCmDbField);
    procedure SetIdrgcarenciapart(const Value: TCmDbField);
    procedure SetIdrgcarenciapatro(const Value: TCmDbField);
    procedure SetIdrgelegbenef(const Value: TCmDbField);
    procedure SetIdrgsalmedioatu(const Value: TCmDbField);
    procedure SetIdrgsrb(const Value: TCmDbField);
    procedure SetIdrgtotcarencia(const Value: TCmDbField);
    procedure SetIdtetosalpart(const Value: TCmDbField);
    procedure SetIdtpreajcontrib(const Value: TCmDbField);
    procedure SetIndicereajcontrib(const Value: TCmDbField);
    procedure SetMenscobr(const Value: TCmDbField);
    procedure SetMenscobr2(const Value: TCmDbField);
    procedure SetMespgabono(const Value: TCmDbField);
    procedure SetMesreajcontrib(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNuminscinicial(const Value: TCmDbField);
    procedure SetOrigemcmbeneficio(const Value: TCmDbField);
    procedure SetPatrolimite(const Value: TCmDbField);
    procedure SetPlacontacirrf(const Value: TCmDbField);
    procedure SetPlacontadirrf(const Value: TCmDbField);
    procedure SetPlanoirrf(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetRecpagirrf(const Value: TCmDbField);
    procedure SetResultlimite(const Value: TCmDbField);
    procedure SetTipcodigoirrf(const Value: TCmDbField);
    procedure SetTpplanoprev(const Value: TCmDbField);
    procedure SetUnidnegocioirrf(const Value: TCmDbField);
    procedure SetIdRegraVlrReserva(const Value: TCmDbField);

  public

     Property Unidnegocioirrf   : TCmDbField read FUnidnegocioirrf   write SetUnidnegocioirrf;
     Property Tpplanoprev       : TCmDbField read FTpplanoprev       write SetTpplanoprev;
     Property Tipcodigoirrf     : TCmDbField read FTipcodigoirrf     write SetTipcodigoirrf;
     Property Resultlimite      : TCmDbField read FResultlimite      write SetResultlimite;
     Property Recpagirrf        : TCmDbField read FRecpagirrf        write SetRecpagirrf;
     Property Recpag            : TCmDbField read FRecpag            write SetRecpag;
     Property Planoirrf         : TCmDbField read FPlanoirrf         write SetPlanoirrf;
     Property Placontadirrf     : TCmDbField read FPlacontadirrf     write SetPlacontadirrf;
     Property Placontacirrf     : TCmDbField read FPlacontacirrf     write SetPlacontacirrf;
     Property Patrolimite       : TCmDbField read FPatrolimite       write SetPatrolimite;
     Property Origemcmbeneficio : TCmDbField read FOrigemcmbeneficio write SetOrigemcmbeneficio;
     Property Numinscinicial    : TCmDbField read FNuminscinicial    write SetNuminscinicial;
     Property Nome              : TCmDbField read FNome              write SetNome;
     Property Mesreajcontrib    : TCmDbField read FMesreajcontrib    write SetMesreajcontrib;
     Property Mespgabono        : TCmDbField read FMespgabono        write SetMespgabono;
     Property Menscobr2         : TCmDbField read FMenscobr2         write SetMenscobr2;
     Property Menscobr          : TCmDbField read FMenscobr          write SetMenscobr;
     Property Indicereajcontrib : TCmDbField read FIndicereajcontrib write SetIndicereajcontrib;
     Property Idtpreajcontrib   : TCmDbField read FIdtpreajcontrib   write SetIdtpreajcontrib;
     Property Idtetosalpart     : TCmDbField read FIdtetosalpart     write SetIdtetosalpart;
     Property Idrgtotcarencia   : TCmDbField read FIdrgtotcarencia   write SetIdrgtotcarencia;
     Property Idrgsrb           : TCmDbField read FIdrgsrb           write SetIdrgsrb;
     Property Idrgsalmedioatu   : TCmDbField read FIdrgsalmedioatu   write SetIdrgsalmedioatu;
     Property Idrgelegbenef     : TCmDbField read FIdrgelegbenef     write SetIdrgelegbenef;
     Property Idrgcarenciapatro : TCmDbField read FIdrgcarenciapatro write SetIdrgcarenciapatro;
     Property Idrgcarenciapart  : TCmDbField read FIdrgcarenciapart  write SetIdrgcarenciapart;
     Property Idrescontroleatu  : TCmDbField read FIdrescontroleatu  write SetIdrescontroleatu;
     Property Idrelatbeneficio  : TCmDbField read FIdrelatbeneficio  write SetIdrelatbeneficio;
     Property Idregravlrdivida  : TCmDbField read FIdregravlrdivida  write SetIdregravlrdivida;
     Property Idregratransfpla  : TCmDbField read FIdregratransfpla  write SetIdregratransfpla;
     Property Idregrasimulaenq  : TCmDbField read FIdregrasimulaenq  write SetIdregrasimulaenq;
     Property Idregrasdodevedor : TCmDbField read FIdregrasdodevedor write SetIdregrasdodevedor;
     Property Idregrasalparcela : TCmDbField read FIdregrasalparcela write SetIdregrasalparcela;
     Property Idregrareajcontr  : TCmDbField read FIdregrareajcontr  write SetIdregrareajcontr;
     Property Idregraopparcelas : TCmDbField read FIdregraopparcelas write SetIdregraopparcelas;
     Property Idregraelegreins  : TCmDbField read FIdregraelegreins  write SetIdregraelegreins;
     Property Idregradevoljuros : TCmDbField read FIdregradevoljuros write SetIdregradevoljuros;
     Property Idregradevolcorr  : TCmDbField read FIdregradevolcorr  write SetIdregradevolcorr;
     Property Idregradesistenc  : TCmDbField read FIdregradesistenc  write SetIdregradesistenc;
     Property Idregracobatraso  : TCmDbField read FIdregracobatraso  write SetIdregracobatraso;
     Property Idregracarencia   : TCmDbField read FIdregracarencia   write SetIdregracarencia;
     Property Idregracancelame  : TCmDbField read FIdregracancelame  write SetIdregracancelame;
     Property Idregracancdesc   : TCmDbField read FIdregracancdesc   write SetIdregracancdesc;
     Property Idregraatrasojur  : TCmDbField read FIdregraatrasojur  write SetIdregraatrasojur;
     Property Idregraatrasocor  : TCmDbField read FIdregraatrasocor  write SetIdregraatrasocor;
     Property Idregraamortiza   : TCmDbField read FIdregraamortiza   write SetIdregraamortiza;
     Property Idregraadmissao   : TCmDbField read FIdregraadmissao   write SetIdregraadmissao;
     Property Idplanoprev       : TCmDbField read FIdplanoprev       write SetIdplanoprev;
     Property Idplanocom        : TCmDbField read FIdplanocom        write SetIdplanocom;
     Property Idplanoatu        : TCmDbField read FIdplanoatu        write SetIdplanoatu;
     Property Idfundacao        : TCmDbField read FIdfundacao        write SetIdfundacao;
     Property Idfavorecidoirrf  : TCmDbField read FIdfavorecidoirrf  write SetIdfavorecidoirrf;
     Property Idempresapropirrf : TCmDbField read FIdempresapropirrf write SetIdempresapropirrf;
     Property Idempresaprop     : TCmDbField read FIdempresaprop     write SetIdempresaprop;
     Property Idempresairrf     : TCmDbField read FIdempresairrf     write SetIdempresairrf;
     Property Flgusasalario     : TCmDbField read FFlgusasalario     write SetFlgusasalario;
     Property Flgusaevolfunc    : TCmDbField read FFlgusaevolfunc    write SetFlgusaevolfunc;
     Property Flgtipogravainss  : TCmDbField read FFlgtipogravainss  write SetFlgtipogravainss;
     Property Flgtipobuscacota  : TCmDbField read FFlgtipobuscacota  write SetFlgtipobuscacota;
     Property Flgreservaultcot  : TCmDbField read FFlgreservaultcot  write SetFlgreservaultcot;
     Property Flgrecalccontrib  : TCmDbField read FFlgrecalccontrib  write SetFlgrecalccontrib;
     Property Flgreajinssnreq   : TCmDbField read FFlgreajinssnreq   write SetFlgreajinssnreq;
     Property Flgngravacontzero : TCmDbField read FFlgngravacontzero write SetFlgngravacontzero;
     Property Flgndevcnafolha   : TCmDbField read FFlgndevcnafolha   write SetFlgndevcnafolha;
     Property Flgmescobranca    : TCmDbField read FFlgmescobranca    write SetFlgmescobranca;
     Property Flgincorporapens  : TCmDbField read FFlgincorporapens  write SetFlgincorporapens;
     Property Flggeractnaoenv   : TCmDbField read FFlggeractnaoenv   write SetFlggeractnaoenv;
     Property Flgexcedaniversa  : TCmDbField read FFlgexcedaniversa  write SetFlgexcedaniversa;
     Property Flgdtalimreserva  : TCmDbField read FFlgdtalimreserva  write SetFlgdtalimreserva;
     Property Flgcontabmantido  : TCmDbField read FFlgcontabmantido  write SetFlgcontabmantido;
     Property Flgcalculalimite  : TCmDbField read FFlgcalculalimite  write SetFlgcalculalimite;
     Property Flgautonuminsc    : TCmDbField read FFlgautonuminsc    write SetFlgautonuminsc;
     Property Flgagrupaboleta   : TCmDbField read FFlgagrupaboleta   write SetFlgagrupaboleta;
     Property Diacobranca       : TCmDbField read FDiacobranca       write SetDiacobranca;
     Property Dataliberaexced   : TCmDbField read FDataliberaexced   write SetDataliberaexced;
     Property Dataapuraexced    : TCmDbField read FDataapuraexced    write SetDataapuraexced;
     Property Codtiprecdesirrf  : TCmDbField read FCodtiprecdesirrf  write SetCodtiprecdesirrf;
     Property Codtiprecdes      : TCmDbField read FCodtiprecdes      write SetCodtiprecdes;
     Property Codtipdocirrf     : TCmDbField read FCodtipdocirrf     write SetCodtipdocirrf;
     Property Codtipdoc         : TCmDbField read FCodtipdoc         write SetCodtipdoc;
     Property Codsubcontairrf   : TCmDbField read FCodsubcontairrf   write SetCodsubcontairrf;
     Property Codportformairrf  : TCmDbField read FCodportformairrf  write SetCodportformairrf;
     Property Codigospc         : TCmDbField read FCodigospc         write SetCodigospc;
     Property Coddesembirrf     : TCmDbField read FCoddesembirrf     write SetCoddesembirrf;
     Property Codcentrespirrf   : TCmDbField read FCodcentrespirrf   write SetCodcentrespirrf;
     Property Codcentcustdirrf  : TCmDbField read FCodcentcustdirrf  write SetCodcentcustdirrf;
     Property Codcentcustcirrf  : TCmDbField read FCodcentcustcirrf  write SetCodcentcustcirrf;
     Property Codaltbaixanpago  : TCmDbField read FCodaltbaixanpago  write SetCodaltbaixanpago;
     Property IdRegraVlrReserva : TCmDbField read FIdRegraVlrReserva write SetIdRegraVlrReserva;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPlanprev }

constructor TDbPlanprev.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANPREV';

   fUnidnegocioirrf := CreateCmDbField('UNIDNEGOCIOIRRF',ftfloat,False,False,False,True,'');
   fTpplanoprev := CreateCmDbField('TPPLANOPREV',ftString,False,False,False,True,'');
   fTipcodigoirrf := CreateCmDbField('TIPCODIGOIRRF',ftString,False,False,False,True,'');
   fResultlimite := CreateCmDbField('RESULTLIMITE',ftfloat,False,False,False,True,'');
   fRecpagirrf := CreateCmDbField('RECPAGIRRF',ftString,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlanoirrf := CreateCmDbField('PLANOIRRF',ftfloat,False,False,False,True,'');
   fPlacontadirrf := CreateCmDbField('PLACONTADIRRF',ftString,False,False,False,True,'');
   fPlacontacirrf := CreateCmDbField('PLACONTACIRRF',ftString,False,False,False,True,'');
   fPatrolimite := CreateCmDbField('PATROLIMITE',ftfloat,False,False,False,True,'');
   fOrigemcmbeneficio := CreateCmDbField('ORIGEMCMBENEFICIO',ftfloat,False,False,False,True,'');
   fNuminscinicial := CreateCmDbField('NUMINSCINICIAL',ftfloat,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fMesreajcontrib := CreateCmDbField('MESREAJCONTRIB',ftfloat,False,False,False,True,'');
   fMespgabono := CreateCmDbField('MESPGABONO',ftString,False,False,False,True,'');
   fMenscobr2 := CreateCmDbField('MENSCOBR2',ftString,False,False,False,True,'');
   fMenscobr := CreateCmDbField('MENSCOBR',ftString,False,False,False,True,'');
   fIndicereajcontrib := CreateCmDbField('INDICEREAJCONTRIB',ftfloat,False,False,False,True,'');
   fIdtpreajcontrib := CreateCmDbField('IDTPREAJCONTRIB',ftfloat,False,False,False,True,'');
   fIdtetosalpart := CreateCmDbField('IDTETOSALPART',ftfloat,False,False,False,True,'');
   fIdrgtotcarencia := CreateCmDbField('IDRGTOTCARENCIA',ftfloat,False,False,False,True,'');
   fIdrgsrb := CreateCmDbField('IDRGSRB',ftfloat,False,False,False,True,'');
   fIdrgsalmedioatu := CreateCmDbField('IDRGSALMEDIOATU',ftfloat,False,False,False,True,'');
   fIdrgelegbenef := CreateCmDbField('IDRGELEGBENEF',ftfloat,False,False,False,True,'');
   fIdrgcarenciapatro := CreateCmDbField('IDRGCARENCIAPATRO',ftfloat,False,False,False,True,'');
   fIdrgcarenciapart := CreateCmDbField('IDRGCARENCIAPART',ftfloat,False,False,False,True,'');
   fIdrescontroleatu := CreateCmDbField('IDRESCONTROLEATU',ftfloat,False,False,False,True,'');
   fIdrelatbeneficio := CreateCmDbField('IDRELATBENEFICIO',ftfloat,False,False,False,True,'');
   fIdregravlrdivida := CreateCmDbField('IDREGRAVLRDIVIDA',ftfloat,False,False,False,True,'');
   fIdregratransfpla := CreateCmDbField('IDREGRATRANSFPLA',ftfloat,False,False,False,True,'');
   fIdregrasimulaenq := CreateCmDbField('IDREGRASIMULAENQ',ftfloat,False,False,False,True,'');
   fIdregrasdodevedor := CreateCmDbField('IDREGRASDODEVEDOR',ftfloat,False,False,False,True,'');
   fIdregrasalparcela := CreateCmDbField('IDREGRASALPARCELA',ftfloat,False,False,False,True,'');
   fIdregrareajcontr := CreateCmDbField('IDREGRAREAJCONTR',ftfloat,False,False,False,True,'');
   fIdregraopparcelas := CreateCmDbField('IDREGRAOPPARCELAS',ftfloat,False,False,False,True,'');
   fIdregraelegreins := CreateCmDbField('IDREGRAELEGREINS',ftfloat,False,False,False,True,'');
   fIdregradevoljuros := CreateCmDbField('IDREGRADEVOLJUROS',ftfloat,False,False,False,True,'');
   fIdregradevolcorr := CreateCmDbField('IDREGRADEVOLCORR',ftfloat,False,False,False,True,'');
   fIdregradesistenc := CreateCmDbField('IDREGRADESISTENC',ftfloat,False,False,False,True,'');
   fIdregracobatraso := CreateCmDbField('IDREGRACOBATRASO',ftfloat,False,False,False,True,'');
   fIdregracarencia := CreateCmDbField('IDREGRACARENCIA',ftfloat,False,False,False,True,'');
   fIdregracancelame := CreateCmDbField('IDREGRACANCELAME',ftfloat,False,False,False,True,'');
   fIdregracancdesc := CreateCmDbField('IDREGRACANCDESC',ftfloat,False,False,False,True,'');
   fIdregraatrasojur := CreateCmDbField('IDREGRAATRASOJUR',ftfloat,False,False,False,True,'');
   fIdregraatrasocor := CreateCmDbField('IDREGRAATRASOCOR',ftfloat,False,False,False,True,'');
   fIdregraamortiza := CreateCmDbField('IDREGRAAMORTIZA',ftfloat,False,False,False,True,'');
   fIdregraadmissao := CreateCmDbField('IDREGRAADMISSAO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdplanocom := CreateCmDbField('IDPLANOCOM',ftfloat,False,False,False,True,'');
   fIdplanoatu := CreateCmDbField('IDPLANOATU',ftfloat,False,False,False,True,'');
   fIdfundacao := CreateCmDbField('IDFUNDACAO',ftfloat,False,False,False,True,'');
   fIdfavorecidoirrf := CreateCmDbField('IDFAVORECIDOIRRF',ftfloat,False,False,False,True,'');
   fIdempresapropirrf := CreateCmDbField('IDEMPRESAPROPIRRF',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdempresairrf := CreateCmDbField('IDEMPRESAIRRF',ftfloat,False,False,False,True,'');
   fFlgusasalario := CreateCmDbField('FLGUSASALARIO',ftfloat,False,False,False,True,'');
   fFlgusaevolfunc := CreateCmDbField('FLGUSAEVOLFUNC',ftfloat,False,False,False,True,'');
   fFlgtipogravainss := CreateCmDbField('FLGTIPOGRAVAINSS',ftfloat,False,False,False,True,'');
   fFlgtipobuscacota := CreateCmDbField('FLGTIPOBUSCACOTA',ftfloat,False,False,False,True,'');
   fFlgreservaultcot := CreateCmDbField('FLGRESERVAULTCOT',ftfloat,False,False,False,True,'');
   fFlgrecalccontrib := CreateCmDbField('FLGRECALCCONTRIB',ftfloat,False,False,False,True,'');
   fFlgreajinssnreq := CreateCmDbField('FLGREAJINSSNREQ',ftfloat,False,False,False,True,'');
   fFlgngravacontzero := CreateCmDbField('FLGNGRAVACONTZERO',ftfloat,False,False,False,True,'');
   fFlgndevcnafolha := CreateCmDbField('FLGNDEVCNAFOLHA',ftfloat,False,False,False,True,'');
   fFlgmescobranca := CreateCmDbField('FLGMESCOBRANCA',ftString,False,False,False,True,'');
   fFlgincorporapens := CreateCmDbField('FLGINCORPORAPENS',ftString,False,False,False,True,'');
   fFlggeractnaoenv := CreateCmDbField('FLGGERACTNAOENV',ftfloat,False,False,False,True,'');
   fFlgexcedaniversa := CreateCmDbField('FLGEXCEDANIVERSA',ftfloat,False,False,False,True,'');
   fFlgdtalimreserva := CreateCmDbField('FLGDTALIMRESERVA',ftfloat,False,False,False,True,'');
   fFlgcontabmantido := CreateCmDbField('FLGCONTABMANTIDO',ftfloat,False,False,False,True,'');
   fFlgcalculalimite := CreateCmDbField('FLGCALCULALIMITE',ftfloat,False,False,False,True,'');
   fFlgautonuminsc := CreateCmDbField('FLGAUTONUMINSC',ftfloat,False,False,False,True,'');
   fFlgagrupaboleta := CreateCmDbField('FLGAGRUPABOLETA',ftfloat,False,False,False,True,'');
   fDiacobranca := CreateCmDbField('DIACOBRANCA',ftfloat,False,False,False,True,'');
   fDataliberaexced := CreateCmDbField('DATALIBERAEXCED',ftDateTime,False,False,False,True,'');
   fDataapuraexced := CreateCmDbField('DATAAPURAEXCED',ftDateTime,False,False,False,True,'');
   fCodtiprecdesirrf := CreateCmDbField('CODTIPRECDESIRRF',ftString,False,False,False,True,'');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodtipdocirrf := CreateCmDbField('CODTIPDOCIRRF',ftfloat,False,False,False,True,'');
   fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,False,False,False,True,'');
   fCodsubcontairrf := CreateCmDbField('CODSUBCONTAIRRF',ftfloat,False,False,False,True,'');
   fCodportformairrf := CreateCmDbField('CODPORTFORMAIRRF',ftfloat,False,False,False,True,'');
   fCodigospc := CreateCmDbField('CODIGOSPC',ftString,False,False,False,True,'');
   fCoddesembirrf := CreateCmDbField('CODDESEMBIRRF',ftString,False,False,False,True,'');
   fCodcentrespirrf := CreateCmDbField('CODCENTRESPIRRF',ftString,False,False,False,True,'');
   fCodcentcustdirrf := CreateCmDbField('CODCENTCUSTDIRRF',ftString,False,False,False,True,'');
   fCodcentcustcirrf := CreateCmDbField('CODCENTCUSTCIRRF',ftString,False,False,False,True,'');
   fCodaltbaixanpago := CreateCmDbField('CODALTBAIXANPAGO',ftfloat,False,False,False,True,'');
end;

function TDbPlanprev.Insert: Boolean;
begin

   fIdplanoprev.AsFloat := GetSequence('PLANPREV');
   Result := Inherited Insert;

end;


procedure TDbPlanprev.SetCodaltbaixanpago(const Value: TCmDbField);
begin
  FCodaltbaixanpago := Value;
end;

procedure TDbPlanprev.SetCodcentcustcirrf(const Value: TCmDbField);
begin
  FCodcentcustcirrf := Value;
end;

procedure TDbPlanprev.SetCodcentcustdirrf(const Value: TCmDbField);
begin
  FCodcentcustdirrf := Value;
end;

procedure TDbPlanprev.SetCodcentrespirrf(const Value: TCmDbField);
begin
  FCodcentrespirrf := Value;
end;

procedure TDbPlanprev.SetCoddesembirrf(const Value: TCmDbField);
begin
  FCoddesembirrf := Value;
end;

procedure TDbPlanprev.SetCodigospc(const Value: TCmDbField);
begin
  FCodigospc := Value;
end;

procedure TDbPlanprev.SetCodportformairrf(const Value: TCmDbField);
begin
  FCodportformairrf := Value;
end;

procedure TDbPlanprev.SetCodsubcontairrf(const Value: TCmDbField);
begin
  FCodsubcontairrf := Value;
end;

procedure TDbPlanprev.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbPlanprev.SetCodtipdocirrf(const Value: TCmDbField);
begin
  FCodtipdocirrf := Value;
end;

procedure TDbPlanprev.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbPlanprev.SetCodtiprecdesirrf(const Value: TCmDbField);
begin
  FCodtiprecdesirrf := Value;
end;

procedure TDbPlanprev.SetDataapuraexced(const Value: TCmDbField);
begin
  FDataapuraexced := Value;
end;

procedure TDbPlanprev.SetDataliberaexced(const Value: TCmDbField);
begin
  FDataliberaexced := Value;
end;

procedure TDbPlanprev.SetDiacobranca(const Value: TCmDbField);
begin
  FDiacobranca := Value;
end;

procedure TDbPlanprev.SetFlgagrupaboleta(const Value: TCmDbField);
begin
  FFlgagrupaboleta := Value;
end;

procedure TDbPlanprev.SetFlgautonuminsc(const Value: TCmDbField);
begin
  FFlgautonuminsc := Value;
end;

procedure TDbPlanprev.SetFlgcalculalimite(const Value: TCmDbField);
begin
  FFlgcalculalimite := Value;
end;

procedure TDbPlanprev.SetFlgcontabmantido(const Value: TCmDbField);
begin
  FFlgcontabmantido := Value;
end;

procedure TDbPlanprev.SetFlgdtalimreserva(const Value: TCmDbField);
begin
  FFlgdtalimreserva := Value;
end;

procedure TDbPlanprev.SetFlgexcedaniversa(const Value: TCmDbField);
begin
  FFlgexcedaniversa := Value;
end;

procedure TDbPlanprev.SetFlggeractnaoenv(const Value: TCmDbField);
begin
  FFlggeractnaoenv := Value;
end;

procedure TDbPlanprev.SetFlgincorporapens(const Value: TCmDbField);
begin
  FFlgincorporapens := Value;
end;

procedure TDbPlanprev.SetFlgmescobranca(const Value: TCmDbField);
begin
  FFlgmescobranca := Value;
end;

procedure TDbPlanprev.SetFlgndevcnafolha(const Value: TCmDbField);
begin
  FFlgndevcnafolha := Value;
end;

procedure TDbPlanprev.SetFlgngravacontzero(const Value: TCmDbField);
begin
  FFlgngravacontzero := Value;
end;

procedure TDbPlanprev.SetFlgreajinssnreq(const Value: TCmDbField);
begin
  FFlgreajinssnreq := Value;
end;

procedure TDbPlanprev.SetFlgrecalccontrib(const Value: TCmDbField);
begin
  FFlgrecalccontrib := Value;
end;

procedure TDbPlanprev.SetFlgreservaultcot(const Value: TCmDbField);
begin
  FFlgreservaultcot := Value;
end;

procedure TDbPlanprev.SetFlgtipobuscacota(const Value: TCmDbField);
begin
  FFlgtipobuscacota := Value;
end;

procedure TDbPlanprev.SetFlgtipogravainss(const Value: TCmDbField);
begin
  FFlgtipogravainss := Value;
end;

procedure TDbPlanprev.SetFlgusaevolfunc(const Value: TCmDbField);
begin
  FFlgusaevolfunc := Value;
end;

procedure TDbPlanprev.SetFlgusasalario(const Value: TCmDbField);
begin
  FFlgusasalario := Value;
end;

procedure TDbPlanprev.SetIdempresairrf(const Value: TCmDbField);
begin
  FIdempresairrf := Value;
end;

procedure TDbPlanprev.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbPlanprev.SetIdempresapropirrf(const Value: TCmDbField);
begin
  FIdempresapropirrf := Value;
end;

procedure TDbPlanprev.SetIdfavorecidoirrf(const Value: TCmDbField);
begin
  FIdfavorecidoirrf := Value;
end;

procedure TDbPlanprev.SetIdfundacao(const Value: TCmDbField);
begin
  FIdfundacao := Value;
end;

procedure TDbPlanprev.SetIdplanoatu(const Value: TCmDbField);
begin
  FIdplanoatu := Value;
end;

procedure TDbPlanprev.SetIdplanocom(const Value: TCmDbField);
begin
  FIdplanocom := Value;
end;

procedure TDbPlanprev.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPlanprev.SetIdregraadmissao(const Value: TCmDbField);
begin
  FIdregraadmissao := Value;
end;

procedure TDbPlanprev.SetIdregraamortiza(const Value: TCmDbField);
begin
  FIdregraamortiza := Value;
end;

procedure TDbPlanprev.SetIdregraatrasocor(const Value: TCmDbField);
begin
  FIdregraatrasocor := Value;
end;

procedure TDbPlanprev.SetIdregraatrasojur(const Value: TCmDbField);
begin
  FIdregraatrasojur := Value;
end;

procedure TDbPlanprev.SetIdregracancdesc(const Value: TCmDbField);
begin
  FIdregracancdesc := Value;
end;

procedure TDbPlanprev.SetIdregracancelame(const Value: TCmDbField);
begin
  FIdregracancelame := Value;
end;

procedure TDbPlanprev.SetIdregracarencia(const Value: TCmDbField);
begin
  FIdregracarencia := Value;
end;

procedure TDbPlanprev.SetIdregracobatraso(const Value: TCmDbField);
begin
  FIdregracobatraso := Value;
end;

procedure TDbPlanprev.SetIdregradesistenc(const Value: TCmDbField);
begin
  FIdregradesistenc := Value;
end;

procedure TDbPlanprev.SetIdregradevolcorr(const Value: TCmDbField);
begin
  FIdregradevolcorr := Value;
end;

procedure TDbPlanprev.SetIdregradevoljuros(const Value: TCmDbField);
begin
  FIdregradevoljuros := Value;
end;

procedure TDbPlanprev.SetIdregraelegreins(const Value: TCmDbField);
begin
  FIdregraelegreins := Value;
end;

procedure TDbPlanprev.SetIdregraopparcelas(const Value: TCmDbField);
begin
  FIdregraopparcelas := Value;
end;

procedure TDbPlanprev.SetIdregrareajcontr(const Value: TCmDbField);
begin
  FIdregrareajcontr := Value;
end;

procedure TDbPlanprev.SetIdregrasalparcela(const Value: TCmDbField);
begin
  FIdregrasalparcela := Value;
end;

procedure TDbPlanprev.SetIdregrasdodevedor(const Value: TCmDbField);
begin
  FIdregrasdodevedor := Value;
end;

procedure TDbPlanprev.SetIdregrasimulaenq(const Value: TCmDbField);
begin
  FIdregrasimulaenq := Value;
end;

procedure TDbPlanprev.SetIdregratransfpla(const Value: TCmDbField);
begin
  FIdregratransfpla := Value;
end;

procedure TDbPlanprev.SetIdregravlrdivida(const Value: TCmDbField);
begin
  FIdregravlrdivida := Value;
end;

procedure TDbPlanprev.SetIdRegraVlrReserva(const Value: TCmDbField);
begin
  FIdRegraVlrReserva := Value;
end;

procedure TDbPlanprev.SetIdrelatbeneficio(const Value: TCmDbField);
begin
  FIdrelatbeneficio := Value;
end;

procedure TDbPlanprev.SetIdrescontroleatu(const Value: TCmDbField);
begin
  FIdrescontroleatu := Value;
end;

procedure TDbPlanprev.SetIdrgcarenciapart(const Value: TCmDbField);
begin
  FIdrgcarenciapart := Value;
end;

procedure TDbPlanprev.SetIdrgcarenciapatro(const Value: TCmDbField);
begin
  FIdrgcarenciapatro := Value;
end;

procedure TDbPlanprev.SetIdrgelegbenef(const Value: TCmDbField);
begin
  FIdrgelegbenef := Value;
end;

procedure TDbPlanprev.SetIdrgsalmedioatu(const Value: TCmDbField);
begin
  FIdrgsalmedioatu := Value;
end;

procedure TDbPlanprev.SetIdrgsrb(const Value: TCmDbField);
begin
  FIdrgsrb := Value;
end;

procedure TDbPlanprev.SetIdrgtotcarencia(const Value: TCmDbField);
begin
  FIdrgtotcarencia := Value;
end;

procedure TDbPlanprev.SetIdtetosalpart(const Value: TCmDbField);
begin
  FIdtetosalpart := Value;
end;

procedure TDbPlanprev.SetIdtpreajcontrib(const Value: TCmDbField);
begin
  FIdtpreajcontrib := Value;
end;

procedure TDbPlanprev.SetIndicereajcontrib(const Value: TCmDbField);
begin
  FIndicereajcontrib := Value;
end;

procedure TDbPlanprev.SetMenscobr(const Value: TCmDbField);
begin
  FMenscobr := Value;
end;

procedure TDbPlanprev.SetMenscobr2(const Value: TCmDbField);
begin
  FMenscobr2 := Value;
end;

procedure TDbPlanprev.SetMespgabono(const Value: TCmDbField);
begin
  FMespgabono := Value;
end;

procedure TDbPlanprev.SetMesreajcontrib(const Value: TCmDbField);
begin
  FMesreajcontrib := Value;
end;

procedure TDbPlanprev.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbPlanprev.SetNuminscinicial(const Value: TCmDbField);
begin
  FNuminscinicial := Value;
end;

procedure TDbPlanprev.SetOrigemcmbeneficio(const Value: TCmDbField);
begin
  FOrigemcmbeneficio := Value;
end;

procedure TDbPlanprev.SetPatrolimite(const Value: TCmDbField);
begin
  FPatrolimite := Value;
end;

procedure TDbPlanprev.SetPlacontacirrf(const Value: TCmDbField);
begin
  FPlacontacirrf := Value;
end;

procedure TDbPlanprev.SetPlacontadirrf(const Value: TCmDbField);
begin
  FPlacontadirrf := Value;
end;

procedure TDbPlanprev.SetPlanoirrf(const Value: TCmDbField);
begin
  FPlanoirrf := Value;
end;

procedure TDbPlanprev.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbPlanprev.SetRecpagirrf(const Value: TCmDbField);
begin
  FRecpagirrf := Value;
end;

procedure TDbPlanprev.SetResultlimite(const Value: TCmDbField);
begin
  FResultlimite := Value;
end;

procedure TDbPlanprev.SetTipcodigoirrf(const Value: TCmDbField);
begin
  FTipcodigoirrf := Value;
end;

procedure TDbPlanprev.SetTpplanoprev(const Value: TCmDbField);
begin
  FTpplanoprev := Value;
end;

procedure TDbPlanprev.SetUnidnegocioirrf(const Value: TCmDbField);
begin
  FUnidnegocioirrf := Value;
end;

end.



