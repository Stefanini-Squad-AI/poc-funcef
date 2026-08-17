{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbParamRH;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbParamRH = class(TCmDbObject)
  protected
    function GetSqlSelect: string; override;
  private
    FIdParamRH: TCmDbField;
    FNormalIni: TCmDbField;
    FNormalFim: TCmDbField;
    FFeriasIni: TCmDbField;
    FFeriasFim: TCmDbField;
    FPgto13Ini: TCmDbField;
    FPgto13Fim: TCmDbField;
    FNumSteps: TCmDbField;
    FTitStep1: TCmDbField;
    FTitStep2: TCmDbField;
    FTitStep3: TCmDbField;
    FTitStep4: TCmDbField;
    FTitStep5: TCmDbField;
    FTitStep6: TCmDbField;
    FTitStep7: TCmDbField;
    FTitStep8: TCmDbField;
    FTitStep9: TCmDbField;
    FFlgCriaSubConta: TCmDbField;
    FFlgDoisCargos: TCmDbField;
    FIdRub13: TCmDbField;
    FIdRubAntec13: TCmDbField;
    FIdRubFalta: TCmDbField;
    FIdRubFGTS: TCmDbField;
    FIdRubINSS: TCmDbField;
    FIdRubIRRF: TCmDbField;
    FFlgIntegraCAP: TCmDbField;
    FFlgIntegraCont: TCmDbField;
    FFlgNivelIndiv: TCmDbField;
    FFlgSenhaUsoPes: TCmDbField;
    FIdMotivo: TCmDbField;
    FIndDuracaoContr: TCmDbField;
    FLimAdm: TCmDbField;
    FMatrDis: TCmDbField;
    FMoedaProcTrab: TCmDbField;
    FFlgTelefIns: TCmDbField;
    FFlgTelefAlt: TCmDbField;
    FFlgTelefExc: TCmDbField;
    FFlgLinhaIns: TCmDbField;
    FFlgLinhaAlt: TCmDbField;
    FFlgLinhaExc: TCmDbField;
    FFlgFeriaIns: TCmDbField;
    FFlgFeriaAlt: TCmDbField;
    FFlgFeriaExc: TCmDbField;
    FFlgEnderIns: TCmDbField;
    FFlgEnderAlt: TCmDbField;
    FFlgEnderExc: TCmDbField;
    FFlgEmprgIns: TCmDbField;
    FFlgEmprgAlt: TCmDbField;
    FFlgEmprgExc: TCmDbField;
    FFlgCursoIns: TCmDbField;
    FFlgCursoAlt: TCmDbField;
    FFlgCursoExc: TCmDbField;
    FFlgContTIns: TCmDbField;
    FFlgContTAlt: TCmDbField;
    FFlgContTExc: TCmDbField;
    FFlgCtSalAlt: TCmDbField;
    FFlgNumeroMatric: TCmDbField;
    FTamanhoMatric: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdParamRH: TCmDbField read FIdParamRH write FIdParamRH;
    property NormalIni: TCmDbField read FNormalIni write FNormalIni;
    property NormalFim: TCmDbField read FNormalFim write FNormalFim;
    property FeriasIni: TCmDbField read FFeriasIni write FFeriasIni;
    property FeriasFim: TCmDbField read FFeriasFim write FFeriasFim;
    property Pgto13Ini: TCmDbField read FPgto13Ini write FPgto13Ini;
    property Pgto13Fim: TCmDbField read FPgto13Fim write FPgto13Fim;
    property NumSteps: TCmDbField read FNumSteps write FNumSteps;
    property TitStep1: TCmDbField read FTitStep1 write FTitStep1;
    property TitStep2: TCmDbField read FTitStep2 write FTitStep2;
    property TitStep3: TCmDbField read FTitStep3 write FTitStep3;
    property TitStep4: TCmDbField read FTitStep4 write FTitStep4;
    property TitStep5: TCmDbField read FTitStep5 write FTitStep5;
    property TitStep6: TCmDbField read FTitStep6 write FTitStep6;
    property TitStep7: TCmDbField read FTitStep7 write FTitStep7;
    property TitStep8: TCmDbField read FTitStep8 write FTitStep8;
    property TitStep9: TCmDbField read FTitStep9 write FTitStep9;
    property FlgCriaSubConta: TCmDbField read FFlgCriaSubConta write FFlgCriaSubConta;
    property FlgDoisCargos: TCmDbField read FFlgDoisCargos write FFlgDoisCargos;
    property IdRub13: TCmDbField read FIdRub13 write FIdRub13;
    property IdRubAntec13: TCmDbField read FIdRubAntec13 write FIdRubAntec13;
    property IdRubFalta: TCmDbField read FIdRubFalta write FIdRubFalta;
    property IdRubFGTS: TCmDbField read FIdRubFGTS write FIdRubFGTS;
    property IdRubINSS: TCmDbField read FIdRubINSS write FIdRubINSS;
    property IdRubIRRF: TCmDbField read FIdRubIRRF write FIdRubIRRF;
    property FlgIntegraCAP: TCmDbField read FFlgIntegraCAP write FFlgIntegraCAP;
    property FlgIntegraCont: TCmDbField read FFlgIntegraCont write FFlgIntegraCont;
    property FlgNivelIndiv: TCmDbField read FFlgNivelIndiv write FFlgNivelIndiv;
    property FlgSenhaUsoPes: TCmDbField read FFlgSenhaUsoPes write FFlgSenhaUsoPes;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property IndDuracaoContr: TCmDbField read FIndDuracaoContr write FIndDuracaoContr;
    property LimAdm: TCmDbField read FLimAdm write FLimAdm;
    property MatrDis: TCmDbField read FMatrDis write FMatrDis;
    property MoedaProcTrab: TCmDbField read FMoedaProcTrab write FMoedaProcTrab;
    property FlgTelefIns: TCmDbField read FFlgTelefIns write FFlgTelefIns;
    property FlgTelefAlt: TCmDbField read FFlgTelefAlt write FFlgTelefAlt;
    property FlgTelefExc: TCmDbField read FFlgTelefExc write FFlgTelefExc;
    property FlgLinhaIns: TCmDbField read FFlgLinhaIns write FFlgLinhaIns;
    property FlgLinhaAlt: TCmDbField read FFlgLinhaAlt write FFlgLinhaAlt;
    property FlgLinhaExc: TCmDbField read FFlgLinhaExc write FFlgLinhaExc;
    property FlgFeriaIns: TCmDbField read FFlgFeriaIns write FFlgFeriaIns;
    property FlgFeriaAlt: TCmDbField read FFlgFeriaAlt write FFlgFeriaAlt;
    property FlgFeriaExc: TCmDbField read FFlgFeriaExc write FFlgFeriaExc;
    property FlgEnderIns: TCmDbField read FFlgEnderIns write FFlgEnderIns;
    property FlgEnderAlt: TCmDbField read FFlgEnderAlt write FFlgEnderAlt;
    property FlgEnderExc: TCmDbField read FFlgEnderExc write FFlgEnderExc;
    property FlgEmprgIns: TCmDbField read FFlgEmprgIns write FFlgEmprgIns;
    property FlgEmprgAlt: TCmDbField read FFlgEmprgAlt write FFlgEmprgAlt;
    property FlgEmprgExc: TCmDbField read FFlgEmprgExc write FFlgEmprgExc;
    property FlgCursoIns: TCmDbField read FFlgCursoIns write FFlgCursoIns;
    property FlgCursoAlt: TCmDbField read FFlgCursoAlt write FFlgCursoAlt;
    property FlgCursoExc: TCmDbField read FFlgCursoExc write FFlgCursoExc;
    property FlgContTIns: TCmDbField read FFlgContTIns write FFlgContTIns;
    property FlgContTAlt: TCmDbField read FFlgContTAlt write FFlgContTAlt;
    property FlgContTExc: TCmDbField read FFlgContTExc write FFlgContTExc;
    property FlgCtSalAlt: TCmDbField read FFlgCtSalAlt write FFlgCtSalAlt;
    property FlgNumeroMatric: TCmDbField read FFlgNumeroMatric write FFlgNumeroMatric;
    property TamanhoMatric: TCmDbField read FTamanhoMatric write FTamanhoMatric;
  end;

implementation

uses uFuncoesUteis;

{ TDbParamRH }

constructor TDbParamRH.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ParamRH';

  FIdParamRH := CreateCmDbField('IdParamRH',ftFloat,true,true,false,false,'');
  FNormalIni := CreateCmDbField('NormalIni',ftDateTime,false,false,false,false,'');
  FNormalFim := CreateCmDbField('NormalFim',ftDateTime,false,false,false,false,'');
  FFeriasIni := CreateCmDbField('FeriasIni',ftDateTime,false,false,false,false,'');
  FFeriasFim := CreateCmDbField('FeriasFim',ftDateTime,false,false,false,false,'');
  FPgto13Ini := CreateCmDbField('Pgto13Ini',ftDateTime,false,false,false,false,'');
  FPgto13Fim := CreateCmDbField('Pgto13Fim',ftDateTime,false,false,false,false,'');
  FIdRub13 := CreateCmDbField('IdRub13',ftFloat,false,false,false,true,'');
  FIdRubAntec13 := CreateCmDbField('IdRubAntec13',ftFloat,false,false,false,true,'');
  FIdRubFalta := CreateCmDbField('IdRubFalta',ftFloat,false,false,false,true,'');
  FIdRubFGTS := CreateCmDbField('IdRubFGTS',ftFloat,false,false,false,true,'');
  FIdRubINSS := CreateCmDbField('IdRubINSS',ftFloat,false,false,false,true,'');
  FIdRubIRRF := CreateCmDbField('IdRubIRRF',ftFloat,false,false,false,true,'');
  FIdMotivo := CreateCmDbField('IdMotivo',ftFloat,false,false,false,true,'');      
  FNumSteps := CreateCmDbField('NumSteps',ftFloat,false,false,false,false,'');
  FTitStep1 := CreateCmDbField('TitStep1',ftString,false,false,false,false,'');
  FTitStep2 := CreateCmDbField('TitStep2',ftString,false,false,false,false,'');
  FTitStep3 := CreateCmDbField('TitStep3',ftString,false,false,false,false,'');
  FTitStep4 := CreateCmDbField('TitStep4',ftString,false,false,false,false,'');
  FTitStep5 := CreateCmDbField('TitStep5',ftString,false,false,false,false,'');
  FTitStep6 := CreateCmDbField('TitStep6',ftString,false,false,false,false,'');
  FTitStep7 := CreateCmDbField('TitStep7',ftString,false,false,false,false,'');
  FTitStep8 := CreateCmDbField('TitStep8',ftString,false,false,false,false,'');
  FTitStep9 := CreateCmDbField('TitStep9',ftString,false,false,false,false,'');
  FMoedaProcTrab := CreateCmDbField('MoedaProcTrab',ftFloat,false,false,false,true,'');
  FFlgCriaSubConta := CreateCmDbField('FlgCriaSubConta',ftFloat,false,false,false,false,'');
  FFlgDoisCargos := CreateCmDbField('FlgDoisCargos',ftFloat,false,false,false,false,'');
  fFlgIntegraCAP := CreateCmDbField('FlgIntegraCAP',ftFloat,false,false,false,false,'');
  FFlgIntegraCont := CreateCmDbField('FlgIntegraCont',ftFloat,false,false,false,false,'');
  FFlgNivelIndiv := CreateCmDbField('FlgNivelIndiv',ftFloat,false,false,false,false,'');
  FFlgSenhaUsoPes := CreateCmDbField('FlgSenhaUsoPes',ftFloat,false,false,false,false,'');
  FIndDuracaoContr := CreateCmDbField('IndDuracaoContr',ftFloat,false,false,false,false,'');
  FLimAdm := CreateCmDbField('LIMADM',ftFloat,false,false,false,false,'');
  FMatrDis := CreateCmDbField('MatrDis',ftString,false,false,false,false,'');
  FFlgTelefIns := CreateCmDbField('FlgTelefIns',ftFloat,false,false,false,false,'');
  FFlgTelefAlt := CreateCmDbField('FlgTelefAlt',ftFloat,false,false,false,false,'');
  FFlgTelefExc := CreateCmDbField('FlgTelefExc',ftFloat,false,false,false,false,'');
  FFlgLinhaIns := CreateCmDbField('FlgLinhaIns',ftFloat,false,false,false,false,'');
  FFlgLinhaAlt := CreateCmDbField('FlgLinhaAlt',ftFloat,false,false,false,false,'');
  FFlgLinhaExc := CreateCmDbField('FlgLinhaExc',ftFloat,false,false,false,false,'');
  FFlgFeriaIns := CreateCmDbField('FlgFeriaIns',ftFloat,false,false,false,false,'');
  FFlgFeriaAlt := CreateCmDbField('FlgFeriaAlt',ftFloat,false,false,false,false,'');
  FFlgFeriaExc := CreateCmDbField('FlgFeriaExc',ftFloat,false,false,false,false,'');
  FFlgEnderIns := CreateCmDbField('FlgEnderIns',ftFloat,false,false,false,false,'');
  FFlgEnderAlt := CreateCmDbField('FlgEnderAlt',ftFloat,false,false,false,false,'');
  FFlgEnderExc := CreateCmDbField('FlgEnderExc',ftFloat,false,false,false,false,'');
  FFlgEmprgIns := CreateCmDbField('FlgEmprgIns',ftFloat,false,false,false,false,'');
  FFlgEmprgAlt := CreateCmDbField('FlgEmprgAlt',ftFloat,false,false,false,false,'');
  FFlgEmprgExc := CreateCmDbField('FlgEmprgExc',ftFloat,false,false,false,false,'');
  FFlgCursoIns := CreateCmDbField('FlgCursoIns',ftFloat,false,false,false,false,'');
  FFlgCursoAlt := CreateCmDbField('FlgCursoAlt',ftFloat,false,false,false,false,'');
  FFlgCursoExc := CreateCmDbField('FlgCursoExc',ftFloat,false,false,false,false,'');
  FFlgContTIns := CreateCmDbField('FlgContTIns',ftFloat,false,false,false,false,'');
  FFlgContTAlt := CreateCmDbField('FlgContTAlt',ftFloat,false,false,false,false,'');
  FFlgContTExc := CreateCmDbField('FlgContTExc',ftFloat,false,false,false,false,'');
  FFlgCtSalAlt := CreateCmDbField('FlgCtSalAlt',ftFloat,false,false,false,false,'');
  FFlgNumeroMatric := CreateCmDbField('FLGNUMERAMATRIC',ftFloat,false,false,false,false,'');
  FTamanhoMatric := CreateCmDbField('TAMANHOMATRIC',ftFloat,false,false,false,false,'');
end;

function TDbParamRH.GetSqlSelect: string;
begin
  Result :=
    'SELECT'+CR_LF+
    '  NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, PGTO13INI, PGTO13FIM,'+CR_LF+
    '  IDRUBFALTA, IDRUBFGTS, IDRUBINSS, IDRUB13, IDRUBANTEC13, IDRUBIRRF,'+CR_LF+
    '  IDMOTIVO, FLGDOISCARGOS, FLGNIVELINDIV, FLGINTEGRACONT, FLGINTEGRACAP,'+CR_LF+
    '  FLGCRIASUBCONTA, FLGSENHAUSOPES, FLGNUMERAMATRIC, INDDURACAOCONTR,'+CR_LF+
    '  TAMANHOMATRIC, MOEDAPROCTRAB, MATRDIS, LIMADM, LIMDEM, LIMAFAST,'+CR_LF+
    '  LIMRETOR, NUMSTEPS, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, TITSTEP5,'+CR_LF+
    '  TITSTEP6, TITSTEP7, TITSTEP8, TITSTEP9, FLGENDERINS, FLGENDERALT,'+CR_LF+
    '  FLGENDEREXC, FLGTELEFINS, FLGTELEFALT, FLGTELEFEXC, FLGCONTTINS,'+CR_LF+
    '  FLGCONTTALT, FLGCONTTEXC, FLGCURSOINS, FLGCURSOALT, FLGCURSOEXC,'+CR_LF+
    '  FLGFERIAINS, FLGFERIAALT, FLGFERIAEXC, FLGEMPRGINS, FLGEMPRGALT,'+CR_LF+
    '  FLGEMPRGEXC, FLGLINHAINS, FLGLINHAALT, FLGLINHAEXC, FLGCTSALALT'+CR_LF+
    'FROM'+CR_LF+
    '  PARAMRH';
end;

end.
