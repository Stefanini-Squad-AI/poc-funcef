{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbProcessoTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbProcessoTrab = class(TCmDbObject)
  private
    FMoedaProcTrab: TCmDbField;
    FCustoProc: TCmDbField;
    FIdTipoProc: TCmDbField;
    FIdAdvogCasa: TCmDbField;
    FIndTaxaConv: TCmDbField;
    FIdProcVinculado: TCmDbField;
    FIdAdvogRecTe: TCmDbField;
    FProcTRTNum: TCmDbField;
    FNumvaraJustica: TCmDbField;
    FIdCidades: TCmDbField;
    FIdTipoAcao: TCmDbField;
    FIdEntPasta: TCmDbField;
    FJCJ: TCmDbField;
    FIdLitisconsorte: TCmDbField;
    FDataJuizo: TCmDbField;
    FUnidNegoc: TCmDbField;
    FIdVaraJustica: TCmDbField;
    FIndMateria: TCmDbField;
    FDataEfetEnc: TCmDbField;
    FIdPatro: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdEmpresaProp: TCmDbField;
    FFlgSitProc: TCmDbField;
    FTipoEncer: TCmDbField;
    FQtdeParcAcor: TCmDbField;
    FIdAssistTecn: TCmDbField;
    FIdReclamante: TCmDbField;
    FCodigoTRT: TCmDbField;
    FDataNotif: TCmDbField;
    FIdPlanoPrev: TCmDbField;
    FIdRegra: TCmDbField;
    FCodSubConta: TCmDbField;
    FProcJCJNum: TCmDbField;
    FIdMotivo: TCmDbField;
    FCodTipoSent: TCmDbField;
    FDataPost: TCmDbField;
    FIdAdvogRecDa: TCmDbField;
    FFlgParteAtiva: TCmDbField;
    FQtdeRecTes: TCmDbField;
    FDataPreVencer: TCmDbField;
    FDespesaProc: TCmDbField;
    FFlgVinculado: TCmDbField;
    FProcTSTNum: TCmDbField;
    FNumProcTrab: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property UnidNegoc: TCmDbField read FUnidNegoc write FUnidNegoc;
    property TipoEncer: TCmDbField read FTipoEncer write FTipoEncer;
    property QtdeRecTes: TCmDbField read FQtdeRecTes write FQtdeRecTes;
    property QtdeParcAcor: TCmDbField read FQtdeParcAcor write FQtdeParcAcor;
    property ProcTSTNum: TCmDbField read FProcTSTNum write FProcTSTNum;
    property ProcTRTNum: TCmDbField read FProcTRTNum write FProcTRTNum;
    property ProcJCJNum: TCmDbField read FProcJCJNum write FProcJCJNum;
    property NumvaraJustica: TCmDbField read FNumvaraJustica write FNumvaraJustica;
    property NumProcTrab: TCmDbField read FNumProcTrab write FNumProcTrab;
    property MoedaProcTrab: TCmDbField read FMoedaProcTrab write FMoedaProcTrab;
    property JCJ: TCmDbField read FJCJ write FJCJ;
    property IndTaxaConv: TCmDbField read FIndTaxaConv write FIndTaxaConv;
    property IndMateria: TCmDbField read FIndMateria write FIndMateria;
    property IdVaraJustica: TCmDbField read FIdVaraJustica write FIdVaraJustica;
    property IdTipoProc: TCmDbField read FIdTipoProc write FIdTipoProc;
    property IdTipoAcao: TCmDbField read FIdTipoAcao write FIdTipoAcao;
    property IdRegra: TCmDbField read FIdRegra write FIdRegra;
    property IdReclamante: TCmDbField read FIdReclamante write FIdReclamante;
    property IdProcVinculado: TCmDbField read FIdProcVinculado write FIdProcVinculado;
    property IdPlanoPrev: TCmDbField read FIdPlanoPrev write FIdPlanoPrev;
    property IdPatro: TCmDbField read FIdPatro write FIdPatro;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property IdLitisconsorte: TCmDbField read FIdLitisconsorte write FIdLitisconsorte;
    property IdEntPasta: TCmDbField read FIdEntPasta write FIdEntPasta;
    property IdEmpresaProp: TCmDbField read FIdEmpresaProp write FIdEmpresaProp;
    property IdCidades: TCmDbField read FIdCidades write FIdCidades;
    property IdAssistTecn: TCmDbField read FIdAssistTecn write FIdAssistTecn;
    property IdAdvogRecTe: TCmDbField read FIdAdvogRecTe write FIdAdvogRecTe;
    property IdAdvogRecDa: TCmDbField read FIdAdvogRecDa write FIdAdvogRecDa;
    property IdAdvogCasa: TCmDbField read FIdAdvogCasa write FIdAdvogCasa;
    property FlgVinculado: TCmDbField read FFlgVinculado write FFlgVinculado;
    property FlgSitProc: TCmDbField read FFlgSitProc write FFlgSitProc;
    property FlgParteAtiva: TCmDbField read FFlgParteAtiva write FFlgParteAtiva;
    property DespesaProc: TCmDbField read FDespesaProc write FDespesaProc;
    property DataPreVencer: TCmDbField read FDataPreVencer write FDataPreVencer;
    property DataPost: TCmDbField read FDataPost write FDataPost;
    property DataNotif: TCmDbField read FDataNotif write FDataNotif;
    property DataJuizo: TCmDbField read FDataJuizo write FDataJuizo;
    property DataEfetEnc: TCmDbField read FDataEfetEnc write FDataEfetEnc;
    property CustoProc: TCmDbField read FCustoProc write FCustoProc;
    property CodTipoSent: TCmDbField read FCodTipoSent write FCodTipoSent;
    property CodSubConta: TCmDbField read FCodSubConta write FCodSubConta;
    property CodigoTRT: TCmDbField read FCodigoTRT write FCodigoTRT;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
  end;

implementation

{ TDbProcessoTrab }

constructor TDbProcessoTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PROCESSOTRAB';

  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,false,'');
  FUnidNegoc := CreateCmDbField('UNIDNEGOC',ftFloat,false,false,false,true,'');
  FTipoEncer := CreateCmDbField('TIPOENCER',ftString,false,false,false,true,'');
  FQtdeRecTes := CreateCmDbField('QTDERECTES',ftFloat,false,false,false,true,'');
  FQtdeParcAcor := CreateCmDbField('QTDEPARCACOR',ftFloat,false,false,false,true,'');
  FProcTSTNum := CreateCmDbField('PROCTSTNUM',ftString,false,false,false,true,'');
  FProcTRTNum := CreateCmDbField('PROCTRTNUM',ftString,false,false,false,true,'');
  FProcJCJNum := CreateCmDbField('PROCJCJNUM',ftString,false,false,false,true,'');
  FNumVaraJustica := CreateCmDbField('NUMVARAJUSTICA',ftFloat,false,false,false,true,'');
  FMoedaProcTrab := CreateCmDbField('MOEDAPROCTRAB',ftFloat,false,false,false,true,'');
  FJCJ := CreateCmDbField('JCJ',ftString,false,false,false,true,'');
  FIndTaxaConv := CreateCmDbField('INDTAXACONV',ftFloat,false,false,false,true,'');
  FIndMateria := CreateCmDbField('INDMATERIA',ftFloat,false,false,false,true,'');
  FIdVaraJustica := CreateCmDbField('IDVARAJUSTICA',ftFloat,false,false,false,true,'');
  FIdTipoProc := CreateCmDbField('IDTIPOPROC',ftFloat,false,false,false,true,'');
  FIdTipoAcao := CreateCmDbField('IDTIPOACAO',ftFloat,false,false,false,true,'');
  FIdRegra := CreateCmDbField('IDREGRA',ftFloat,false,false,false,true,'');
  FIdReclamante := CreateCmDbField('IDRECLAMANTE',ftFloat,false,false,false,true,'');
  FIdProcVinculado := CreateCmDbField('IDPROCVINCULADO',ftFloat,false,false,false,true,'');
  FIdPlanoPrev := CreateCmDbField('IDPLANOPREV',ftFloat,false,false,false,true,'');
  FIdPatro := CreateCmDbField('IDPATRO',ftFloat,false,false,false,true,'');
  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,false,false,false,true,'');
  FIdLitisconsorte := CreateCmDbField('IDLITISCONSORTE',ftFloat,false,false,false,true,'');
  FIdEntPasta := CreateCmDbField('IDENTPASTA',ftString,false,false,false,true,'');
  FIdEmpresaProp := CreateCmDbField('IDEMPRESAPROP',ftFloat,false,false,false,true,'');
  FIdCidades := CreateCmDbField('IDCIDADES',ftFloat,false,false,false,true,'');
  FIdAssistTecn := CreateCmDbField('IDASSISTTECN',ftFloat,false,false,false,true,'');
  FIdAdvogRecTe := CreateCmDbField('IDADVOGRECTE',ftFloat,false,false,false,true,'');
  FIdAdvogRecDa := CreateCmDbField('IDADVOGRECDA',ftFloat,false,false,false,true,'');
  FIdAdvogCasa := CreateCmDbField('IDADVOGCASA',ftFloat,false,false,false,true,'');
  FFlgVinculado := CreateCmDbField('FLGVINCULADO',ftFloat,false,false,false,false,'');
  FFlgSitProc := CreateCmDbField('FLGSITPROC',ftFloat,true,false,false,false,'');
  FFlgParteAtiva := CreateCmDbField('FLGPARTEATIVA',ftFloat,false,false,false,false,'');
  FDesPesaProc := CreateCmDbField('DESPESAPROC',ftFloat,false,false,false,false,'');
  FDataPreVencer := CreateCmDbField('DATAPREVENCER',ftDateTime,false,false,false,true,'');
  FDataPost := CreateCmDbField('DATAPOST',ftDateTime,false,false,false,true,'');
  FDataNotif := CreateCmDbField('DATANOTIF',ftDateTime,false,false,false,true,'');
  FDataJuizo := CreateCmDbField('DATAJUIZO',ftDateTime,false,false,false,true,'');
  FDataEfetEnc := CreateCmDbField('DATAEFETENC',ftDateTime,false,false,false,true,'');
  FCustoProc := CreateCmDbField('CUSTOPROC',ftFloat,false,false,false,false,'');
  FCodTipoSent := CreateCmDbField('CODTIPOSENT',ftFloat,false,false,false,true,'');
  FCodSubConta := CreateCmDbField('CODSUBCONTA',ftFloat,false,false,false,true,'');
  FCodigoTRT := CreateCmDbField('CODIGOTRT',ftFloat,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
end;

function TDbProcessoTrab.Insert: boolean;
begin
  FNumproctrab.asFloat := GetSequence('PROCESSOTRAB');
  Result := inherited Insert;
end;

end.
