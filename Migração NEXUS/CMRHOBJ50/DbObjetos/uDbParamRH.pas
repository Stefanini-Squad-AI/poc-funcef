{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/12/2001                                 }
{                                                       }
{*******************************************************}
//******************************************************************************************
//N. Sol..........: 228736/17139
//N. Kintana......: 761996
//Data............: 27/04/2015
//Responsável.....: Felipe A. Santos
//Descrição.......: inclusão do campo DIASBLOQDESTAC.
// *****************************************************************************************
//N. Sol..........: 185805
//N. Kintana......: 1763461
//Data............: 08/01/2013
//Responsável.....: Thiago Melo
//Descrição.......: Alteração de layout e inclusão de flags (email de cobrança)
// *****************************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************************
//N. Sol..........: 172550
//N. Kintana......: 1555163
//Data............: 27/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novos campos para uso nA integração da Etapa do Processo - SISTJURCONS
//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 26/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novos campos para uso no Destacamento - MODAUTO
//******************************************************************************************
Unit uDbParamRH;

Interface

Uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

Type
   TDbParamRH = Class(TCmDbObject)
   Protected
      Function GetSqlSelect: String; Override;
   Private
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
      FLimDem: TCmDbField;
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
      FIndPolitica: TCmDbField;
      FIdMotivoRescisao: TCmDbField;
      FFlgFiltraFator: TCmDbField;
      FFlgAvalAluno: TCmDbField;
      FFlgCursoXAval: TCmDbField;
      FValMaxAvalTrn: TCmDbField;
      FFlgPercProb: TCmDbField;
      FIndContabJur: TCmDbField;
      FDiasAcertoConta: TCmDbField;
      FFlgDSTTarifa: TCmDbField;
      FFlgCalenDst: TCmDbField;
      FIdPessoa: TCmDbField;
      FCodTipRec: TCmDbField;
      FRecPagRec: TCmDbField;
      FCodTipDocRec: TCmDbField;
      FCodTipDes: TCmDbField;
      FRecPagDes: TCmDbField;
      FCodTipDocPag: TCmDbField;
      FFlgMarcaAfast: TCmDbField;
      FFlgMarcaFerias: TCmDbField;
      FFlgAlteraPonto: TCmDbField;
      FCodPortFormaPag: TCmDbField;
      FIdPlanoPrev: TCmDbField;
      FCodPortFormaRec: TCmDbField;
      FDiasEnvioDST: TCmDbField;
      FIdPatro: TCmDbField;
      FIdDocumento: TCmDbField;
      FColDocumento: TCmDbField;
      FTamDocumento: TCmDbField;
      FFlgBancoHoras: TCmDbField;
      FPerBancoHoras: TCmDbField;
      FLimBancoHoras: TCmDbField;
      FDsrBancoHoras: TCmDbField;
      FNorBancoHoras: TCmDbField;
      FIndPerBcHoras: TCmDbField;
      FDatBancoHoras: TCmDbField;
      FPontoIni: TCmDbField;
      FPontoFim: TCmDbField;
      FPrazoPonto: TCmDbField;
      FDataVigenciaObj: TCmDbField;
      // SOL 137269 KTN 829602 - Paulo Nobre
      FVlrFixoTaxi: TCmDbField;
      FVlrPercDiaria: TCmDbField;
      FVlrPercCusteio: TCmDbField;
      // SOL 172550 KTN 1555163 - Paulo Nobre
      FDiasPagtoEtapa: TCmDbField;
      FidTipoDocEtapa: TCmDbField;
      FIdPotFormaEtapa: TCmDbField;
      // SOL 174225 KTN 1572025 - Paulo Nobre
      FCodCentCustoJur: TCmDbField;
      FCodDesembCustasJudPag: TCmDbField;
      FRecPagCustasJudPag: TCmDbField;

      FTitStep16: TCmDbField;
      FTitStep17: TCmDbField;
      FTitStep19: TCmDbField;
      FTitStep13: TCmDbField;
      FTitStep20: TCmDbField;
      FTitStep11: TCmDbField;
      FTitStep12: TCmDbField;
      FTitStep18: TCmDbField;
      FTitStep15: TCmDbField;
      FTitStep10: TCmDbField;
      FTitStep14: TCmDbField;
      // Thiago Melo SOL 185805 Kintana 1763461
      Fflgavisoativo: TCmDbField;
      Fdiaavisocobranca: TCmDbField;
      Fcorpoemail: TCmDbField;
      // Felipe A. Santos SOL 228736/17139 PPM 761996 { FDiasBloqDestac }
      FDiasBloqDestac: TCmDbField;

      procedure Setcorpoemail(const Value: TCmDbField);
      //
   Public
      Constructor Create(AOwner: TCmCustomCdbObject); Override;

      Property IdParamRH: TCmDbField Read FIdParamRH Write FIdParamRH;
      Property NormalIni: TCmDbField Read FNormalIni Write FNormalIni;
      Property NormalFim: TCmDbField Read FNormalFim Write FNormalFim;
      Property FeriasIni: TCmDbField Read FFeriasIni Write FFeriasIni;
      Property FeriasFim: TCmDbField Read FFeriasFim Write FFeriasFim;
      Property Pgto13Ini: TCmDbField Read FPgto13Ini Write FPgto13Ini;
      Property Pgto13Fim: TCmDbField Read FPgto13Fim Write FPgto13Fim;
      Property NumSteps: TCmDbField Read FNumSteps Write FNumSteps;
      Property TitStep1: TCmDbField Read FTitStep1 Write FTitStep1;
      Property TitStep2: TCmDbField Read FTitStep2 Write FTitStep2;
      Property TitStep3: TCmDbField Read FTitStep3 Write FTitStep3;
      Property TitStep4: TCmDbField Read FTitStep4 Write FTitStep4;
      Property TitStep5: TCmDbField Read FTitStep5 Write FTitStep5;
      Property TitStep6: TCmDbField Read FTitStep6 Write FTitStep6;
      Property TitStep7: TCmDbField Read FTitStep7 Write FTitStep7;
      Property TitStep8: TCmDbField Read FTitStep8 Write FTitStep8;
      Property TitStep9: TCmDbField Read FTitStep9 Write FTitStep9;
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613
      Property TitStep10: TCmDbField Read FTitStep10 Write FTitStep10;
      Property TitStep11: TCmDbField Read FTitStep11 Write FTitStep11;
      Property TitStep12: TCmDbField Read FTitStep12 Write FTitStep12;
      Property TitStep13: TCmDbField Read FTitStep13 Write FTitStep13;
      Property TitStep14: TCmDbField Read FTitStep14 Write FTitStep14;
      Property TitStep15: TCmDbField Read FTitStep15 Write FTitStep15;
      Property TitStep16: TCmDbField Read FTitStep16 Write FTitStep16;
      Property TitStep17: TCmDbField Read FTitStep17 Write FTitStep17;
      Property TitStep18: TCmDbField Read FTitStep18 Write FTitStep18;
      Property TitStep19: TCmDbField Read FTitStep19 Write FTitStep19;
      Property TitStep20: TCmDbField Read FTitStep20 Write FTitStep20;
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
      Property FlgCriaSubConta: TCmDbField Read FFlgCriaSubConta Write FFlgCriaSubConta;
      Property FlgDoisCargos: TCmDbField Read FFlgDoisCargos Write FFlgDoisCargos;
      Property IdRub13: TCmDbField Read FIdRub13 Write FIdRub13;
      Property IdRubAntec13: TCmDbField Read FIdRubAntec13 Write FIdRubAntec13;
      Property IdRubFalta: TCmDbField Read FIdRubFalta Write FIdRubFalta;
      Property IdRubFGTS: TCmDbField Read FIdRubFGTS Write FIdRubFGTS;
      Property IdRubINSS: TCmDbField Read FIdRubINSS Write FIdRubINSS;
      Property IdRubIRRF: TCmDbField Read FIdRubIRRF Write FIdRubIRRF;
      Property FlgIntegraCAP: TCmDbField Read FFlgIntegraCAP Write FFlgIntegraCAP;
      Property FlgIntegraCont: TCmDbField Read FFlgIntegraCont Write FFlgIntegraCont;
      Property FlgNivelIndiv: TCmDbField Read FFlgNivelIndiv Write FFlgNivelIndiv;
      Property FlgSenhaUsoPes: TCmDbField Read FFlgSenhaUsoPes Write FFlgSenhaUsoPes;
      Property IdMotivo: TCmDbField Read FIdMotivo Write FIdMotivo;
      Property IndDuracaoContr: TCmDbField Read FIndDuracaoContr Write FIndDuracaoContr;
      Property LimAdm: TCmDbField Read FLimAdm Write FLimAdm;
      Property LimDem: TCmDbField Read FLimDem Write FLimDem;
      Property MatrDis: TCmDbField Read FMatrDis Write FMatrDis;
      Property MoedaProcTrab: TCmDbField Read FMoedaProcTrab Write FMoedaProcTrab;
      Property FlgTelefIns: TCmDbField Read FFlgTelefIns Write FFlgTelefIns;
      Property FlgTelefAlt: TCmDbField Read FFlgTelefAlt Write FFlgTelefAlt;
      Property FlgTelefExc: TCmDbField Read FFlgTelefExc Write FFlgTelefExc;
      Property FlgLinhaIns: TCmDbField Read FFlgLinhaIns Write FFlgLinhaIns;
      Property FlgLinhaAlt: TCmDbField Read FFlgLinhaAlt Write FFlgLinhaAlt;
      Property FlgLinhaExc: TCmDbField Read FFlgLinhaExc Write FFlgLinhaExc;
      Property FlgFeriaIns: TCmDbField Read FFlgFeriaIns Write FFlgFeriaIns;
      Property FlgFeriaAlt: TCmDbField Read FFlgFeriaAlt Write FFlgFeriaAlt;
      Property FlgFeriaExc: TCmDbField Read FFlgFeriaExc Write FFlgFeriaExc;
      Property FlgEnderIns: TCmDbField Read FFlgEnderIns Write FFlgEnderIns;
      Property FlgEnderAlt: TCmDbField Read FFlgEnderAlt Write FFlgEnderAlt;
      Property FlgEnderExc: TCmDbField Read FFlgEnderExc Write FFlgEnderExc;
      Property FlgEmprgIns: TCmDbField Read FFlgEmprgIns Write FFlgEmprgIns;
      Property FlgEmprgAlt: TCmDbField Read FFlgEmprgAlt Write FFlgEmprgAlt;
      Property FlgEmprgExc: TCmDbField Read FFlgEmprgExc Write FFlgEmprgExc;
      Property FlgCursoIns: TCmDbField Read FFlgCursoIns Write FFlgCursoIns;
      Property FlgCursoAlt: TCmDbField Read FFlgCursoAlt Write FFlgCursoAlt;
      Property FlgCursoExc: TCmDbField Read FFlgCursoExc Write FFlgCursoExc;
      Property FlgContTIns: TCmDbField Read FFlgContTIns Write FFlgContTIns;
      Property FlgContTAlt: TCmDbField Read FFlgContTAlt Write FFlgContTAlt;
      Property FlgContTExc: TCmDbField Read FFlgContTExc Write FFlgContTExc;
      Property FlgCtSalAlt: TCmDbField Read FFlgCtSalAlt Write FFlgCtSalAlt;
      Property FlgNumeroMatric: TCmDbField Read FFlgNumeroMatric Write FFlgNumeroMatric;
      Property TamanhoMatric: TCmDbField Read FTamanhoMatric Write FTamanhoMatric;
      Property IndPolitica: TCmDbField Read FIndPolitica Write FIndPolitica;
      Property IdMotivoRescisao: TCmDbField Read FIdMotivoRescisao Write FIdMotivoRescisao;
      Property FlgFiltraFator: TCmDbField Read FFlgFiltraFator Write FFlgFiltraFator;
      Property FlgAvalAluno: TCmDbField Read FFlgAvalAluno Write FFlgAvalAluno;
      Property FlgCursoXAval: TCmDbField Read FFlgCursoXAval Write FFlgCursoXAval;
      Property ValMaxAvalTrn: TCmDbField Read FValMaxAvalTrn Write FValMaxAvalTrn;
      Property FlgPercProb: TCmDbField Read FFlgPercProb Write FFlgPercProb;
      Property IndContabJur: TCmDbField Read FIndContabJur Write FIndContabJur;
      Property DiasAcertoConta: TCmDbField Read FDiasAcertoConta Write FDiasAcertoConta;
      Property FlgCalenDst: TCmDbField Read FFlgCalenDst Write FFlgCalenDst;
      Property IdPessoa: TCmDbField Read FIdPessoa Write FIdPessoa;
      Property CodTipRec: TCmDbField Read FCodTipRec Write FCodTipRec;
      Property RecPagRec: TCmDbField Read FRecPagRec Write FRecPagRec;
      Property CodTipDocRec: TCmDbField Read FCodTipDocRec Write FCodTipDocRec;
      Property CodTipDes: TCmDbField Read FCodTipDes Write FCodTipDes;
      Property RecPagDes: TCmDbField Read FRecPagDes Write FRecPagDes;
      Property CodTipDocPag: TCmDbField Read FCodTipDocPag Write FCodTipDocPag;
      Property FlgMarcaAfast: TCmDbField Read FFlgMarcaAfast Write FFlgMarcaAfast;
      Property FlgMarcaFerias: TCmDbField Read FFlgMarcaFerias Write FFlgMarcaFerias;
      Property FlgAlteraPonto: TCmDbField Read FFlgAlteraPonto Write FFlgAlteraPonto;
      Property DiasEnvioDST: TCmDbField Read FDiasEnvioDST Write FDiasEnvioDST;
      Property IdPatro: TCmDbField Read FIdPatro Write FIdPatro;
      Property IdPlanoPrev: TCmDbField Read FIdPlanoPrev Write FIdPlanoPrev;
      Property CodPortFormaRec: TCmDbField Read FCodPortFormaRec Write FCodPortFormaRec;
      Property CodPortFormaPag: TCmDbField Read FCodPortFormaPag Write FCodPortFormaPag;
      Property IdDocumento: TCmDbField Read FIdDocumento Write FIdDocumento;
      Property ColDocumento: TCmDbField Read FColDocumento Write FColDocumento;
      Property TamDocumento: TCmDbField Read FTamDocumento Write FTamDocumento;
      Property FlgBancoHoras: TCmDbField Read FFlgBancoHoras Write FFlgBancoHoras;
      Property PerBancoHoras: TCmDbField Read FPerBancoHoras Write FPerBancoHoras;
      Property LimBancoHoras: TCmDbField Read FLimBancoHoras Write FLimBancoHoras;
      Property DsrBancoHoras: TCmDbField Read FDsrBancoHoras Write FDsrBancoHoras;
      Property NorBancoHoras: TCmDbField Read FNorBancoHoras Write FNorBancoHoras;
      Property IndPerBcHoras: TCmDbField Read FIndPerBcHoras Write FIndPerBcHoras;
      Property DatBancoHoras: TCmDbField Read FDatBancoHoras Write FDatBancoHoras;
      Property PontoIni: TCmDbField Read FPontoIni Write FPontoIni;
      Property PontoFim: TCmDbField Read FPontoFim Write FPontoFim;
      Property PrazoPonto: TCmDbField Read FPrazoPonto Write FPrazoPonto;
      Property DataVigenciaObj: TCmDbField Read FDataVigenciaObj Write FDataVigenciaObj;

      // SOL 137269 KTN 829602 - Paulo Nobre
      Property VlrFixoTaxi: TCmDbField Read FVlrFixoTaxi Write FVlrFixoTaxi;
      Property VlrPercDiaria: TCmDbField Read FVlrPercDiaria Write FVlrPercDiaria;
      Property VlrPercCusteio: TCmDbField Read FVlrPercCusteio Write FVlrPercCusteio;

      // SOL 172550 KTN 1555163 - Paulo Nobre
      Property DiasPagtoEtapa: TCmDbField Read FDiasPagtoEtapa Write FDiasPagtoEtapa;
      Property idTipoDocEtapa: TCmDbField Read FidTipoDocEtapa Write FidTipoDocEtapa;
      Property IdPotFormaEtapa: TCmDbField Read FIdPotFormaEtapa Write FIdPotFormaEtapa;

      // SOL 174225 KTN 1572025 - Paulo Nobre
      Property CodCentCustoJur: TCmDbField Read FCodCentCustoJur Write FCodCentCustoJur;
      Property RecPagCustasJudPag: TCmDbField Read FRecPagCustasJudPag Write FRecPagCustasJudPag;
      Property CodDesembCustasJudPag: TCmDbField Read FCodDesembCustasJudPag Write FCodDesembCustasJudPag;

      // Thiago Melo SOL 185805 Kintana 1763461
      property flgavisoativo : TCmDbField read Fflgavisoativo write Fflgavisoativo;
      property diaavisocobranca : TCmDbField read Fdiaavisocobranca write Fdiaavisocobranca;
      property corpoemail : TCmDbField read Fcorpoemail write Setcorpoemail;
      //

      // Felipe A. Santos SOL 228736/17139 PPM 761996 - início
      property DiasBloqDestac : TCmDbField read FDiasBloqDestac write FDiasBloqDestac;
      // Felipe A. Santos SOL 228736/17139 PPM 761996 - fim
   End;

Implementation

Uses uCtrlFuncoesRH;

{ TDbParamRH }

Constructor TDbParamRH.Create(AOwner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := false;

   TableName := 'PARAMRH';

   FIdParamRH := CreateCmDbField('IDPARAMRH', ftFloat, true, true, false, false, '');
   FNormalIni := CreateCmDbField('NORMALINI', ftDateTime, false, false, false, true, '');
   FNormalFim := CreateCmDbField('NORMALFIM', ftDateTime, false, false, false, true, '');
   FFeriasIni := CreateCmDbField('FERIASINI', ftDateTime, false, false, false, true, '');
   FFeriasFim := CreateCmDbField('FERIASFIM', ftDateTime, false, false, false, true, '');
   FPgto13Ini := CreateCmDbField('PGTO13INI', ftDateTime, false, false, false, true, '');
   FPgto13Fim := CreateCmDbField('PGTO13FIM', ftDateTime, false, false, false, true, '');
   FIdRub13 := CreateCmDbField('IDRUB13', ftFloat, false, false, false, true, '');
   FIdRubAntec13 := CreateCmDbField('IDRUBANTEC13', ftFloat, false, false, false, true, '');
   FIdRubFalta := CreateCmDbField('IDRUBFALTA', ftFloat, false, false, false, true, '');
   FIdRubFGTS := CreateCmDbField('IDRUBFGTS', ftFloat, false, false, false, true, '');
   FIdRubINSS := CreateCmDbField('IDRUBINSS', ftFloat, false, false, false, true, '');
   FIdRubIRRF := CreateCmDbField('IDRUBIRRF', ftFloat, false, false, false, true, '');
   FIdMotivo := CreateCmDbField('IDMOTIVO', ftFloat, false, false, false, true, '');
   FNumSteps := CreateCmDbField('NUMSTEPS', ftFloat, false, false, false, false, '');
   FTitStep1 := CreateCmDbField('TITSTEP1', ftString, false, false, false, false, '');
   FTitStep2 := CreateCmDbField('TITSTEP2', ftString, false, false, false, false, '');
   FTitStep3 := CreateCmDbField('TITSTEP3', ftString, false, false, false, false, '');
   FTitStep4 := CreateCmDbField('TITSTEP4', ftString, false, false, false, false, '');
   FTitStep5 := CreateCmDbField('TITSTEP5', ftString, false, false, false, false, '');
   FTitStep6 := CreateCmDbField('TITSTEP6', ftString, false, false, false, false, '');
   FTitStep7 := CreateCmDbField('TITSTEP7', ftString, false, false, false, false, '');
   FTitStep8 := CreateCmDbField('TITSTEP8', ftString, false, false, false, false, '');
   FTitStep9 := CreateCmDbField('TITSTEP9', ftString, false, false, false, false, '');
   // Edilaine Ferraresi - SOL 171426 / KTN 1537613
   FTitStep10 := CreateCmDbField('TITSTEP10', ftString, false, false, false, false, '');
   FTitStep11 := CreateCmDbField('TITSTEP11', ftString, false, false, false, false, '');
   FTitStep12 := CreateCmDbField('TITSTEP12', ftString, false, false, false, false, '');
   FTitStep13 := CreateCmDbField('TITSTEP13', ftString, false, false, false, false, '');
   FTitStep14 := CreateCmDbField('TITSTEP14', ftString, false, false, false, false, '');
   FTitStep15 := CreateCmDbField('TITSTEP15', ftString, false, false, false, false, '');
   FTitStep16 := CreateCmDbField('TITSTEP16', ftString, false, false, false, false, '');
   FTitStep17 := CreateCmDbField('TITSTEP17', ftString, false, false, false, false, '');
   FTitStep18 := CreateCmDbField('TITSTEP18', ftString, false, false, false, false, '');
   FTitStep19 := CreateCmDbField('TITSTEP19', ftString, false, false, false, false, '');
   FTitStep20 := CreateCmDbField('TITSTEP20', ftString, false, false, false, false, '');
   // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - FIM
   FMoedaProcTrab := CreateCmDbField('MOEDAPROCTRAB', ftFloat, false, false, false, true, '');
   FFlgCriaSubConta := CreateCmDbField('FLGCRIASUBCONTA', ftFloat, false, false, false, false, '');
   FFlgDoisCargos := CreateCmDbField('FLGDOISCARGOS', ftFloat, false, false, false, false, '');
   fFlgIntegraCAP := CreateCmDbField('FLGINTEGRACAP', ftFloat, false, false, false, false, '');
   FFlgIntegraCont := CreateCmDbField('FLGINTEGRACONT', ftFloat, false, false, false, false, '');
   FFlgNivelIndiv := CreateCmDbField('FLGNIVELINDIV', ftFloat, false, false, false, false, '');
   FFlgSenhaUsoPes := CreateCmDbField('FLGSENHAUSOPES', ftFloat, false, false, false, false, '');
   FIndDuracaoContr := CreateCmDbField('INDDURACAOCONTR', ftFloat, false, false, false, false, '');
   FLimAdm := CreateCmDbField('LIMADM', ftFloat, false, false, false, false, '');
   FLimDem := CreateCmDbField('LIMDEM', ftFloat, false, false, false, false, '');
   FMatrDis := CreateCmDbField('MATRDIS', ftString, false, false, false, false, '');
   FFlgTelefIns := CreateCmDbField('FLGTELEFINS', ftFloat, false, false, false, false, '');
   FFlgTelefAlt := CreateCmDbField('FLGTELEFALT', ftFloat, false, false, false, false, '');
   FFlgTelefExc := CreateCmDbField('FLGTELEFEXC', ftFloat, false, false, false, false, '');
   FFlgLinhaIns := CreateCmDbField('FLGLINHAINS', ftFloat, false, false, false, false, '');
   FFlgLinhaAlt := CreateCmDbField('FLGLINHAALT', ftFloat, false, false, false, false, '');
   FFlgLinhaExc := CreateCmDbField('FLGLINHAEXC', ftFloat, false, false, false, false, '');
   FFlgFeriaIns := CreateCmDbField('FLGFERIAINS', ftFloat, false, false, false, false, '');
   FFlgFeriaAlt := CreateCmDbField('FLGFERIAALT', ftFloat, false, false, false, false, '');
   FFlgFeriaExc := CreateCmDbField('FLGFERIAEXC', ftFloat, false, false, false, false, '');
   FFlgEnderIns := CreateCmDbField('FLGENDERINS', ftFloat, false, false, false, false, '');
   FFlgEnderAlt := CreateCmDbField('FLGENDERALT', ftFloat, false, false, false, false, '');
   FFlgEnderExc := CreateCmDbField('FLGENDEREXC', ftFloat, false, false, false, false, '');
   FFlgEmprgIns := CreateCmDbField('FLGEMPRGINS', ftFloat, false, false, false, false, '');
   FFlgEmprgAlt := CreateCmDbField('FLGEMPRGALT', ftFloat, false, false, false, false, '');
   FFlgEmprgExc := CreateCmDbField('FLGEMPRGEXC', ftFloat, false, false, false, false, '');
   FFlgCursoIns := CreateCmDbField('FLGCURSOINS', ftFloat, false, false, false, false, '');
   FFlgCursoAlt := CreateCmDbField('FLGCURSOALT', ftFloat, false, false, false, false, '');
   FFlgCursoExc := CreateCmDbField('FLGCURSOEXC', ftFloat, false, false, false, false, '');
   FFlgContTIns := CreateCmDbField('FLGCONTTINS', ftFloat, false, false, false, false, '');
   FFlgContTAlt := CreateCmDbField('FLGCONTTALT', ftFloat, false, false, false, false, '');
   FFlgContTExc := CreateCmDbField('FLGCONTTEXC', ftFloat, false, false, false, false, '');
   FFlgCtSalAlt := CreateCmDbField('FLGCTSALALT', ftFloat, false, false, false, false, '');
   FFlgNumeroMatric := CreateCmDbField('FLGNUMERAMATRIC', ftFloat, false, false, false, false, '');
   FTamanhoMatric := CreateCmDbField('TAMANHOMATRIC', ftFloat, false, false, false, false, '');
   FIndPolitica := CreateCmDbField('INDPOLITICA', ftFloat, false, false, false, false, '');
   FIdMotivoRescisao := CreateCmDbField('IDMOTIVORESCISAO', ftFloat, false, false, false, true, '');
   FFlgFiltraFator := CreateCmDbField('FLGFILTRAFATOR', ftFloat, false, false, false, false, '');
   FFlgAvalAluno := CreateCmDbField('FLGAVALALUNO', ftFloat, false, false, false, false, '');
   FFlgCursoXAval := CreateCmDbField('FLGCURSOXAVAL', ftFloat, false, false, false, false, '');
   FValMaxAvalTrn := CreateCmDbField('VALMAXAVALTRN', ftFloat, false, false, false, false, '');
   FFlgPercProb := CreateCmDbField('FLGPERCPROB', ftFloat, false, false, false, false, '');
   FIndContabJur := CreateCmDbField('INDCONTABJUR', ftFloat, false, false, false, false, '');
   FDiasAcertoConta := CreateCmDbField('DIASACERTOCONTA', ftFloat, false, false, false, false, '');
   FFlgCalenDst := CreateCmDbField('FLGCALENDST', ftFloat, false, false, false, false, '');
   FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, false, false, false, true, '');
   FCodTipRec := CreateCmDbField('CODTIPREC', ftString, false, false, false, false, '');
   FRecPagRec := CreateCmDbField('RECPAGREC', ftString, false, false, false, false, '');
   FCodTipDocRec := CreateCmDbField('CODTIPDOCREC', ftFloat, false, false, false, true, '');
   FCodTipDes := CreateCmDbField('CODTIPDES', ftString, false, false, false, false, '');
   FRecPagDes := CreateCmDbField('RECPAGDES', ftString, false, false, false, false, '');
   FCodTipDocPag := CreateCmDbField('CODTIPDOCPAG', ftFloat, false, false, false, true, '');
   FFlgMarcaAfast := CreateCmDbField('FLGMARCAAFAST', ftFloat, false, false, false, false, '');
   FFlgMarcaFerias := CreateCmDbField('FLGMARCAFERIAS', ftFloat, false, false, false, false, '');
   FFlgAlteraPonto := CreateCmDbField('FLGALTERAPONTO', ftFloat, false, false, false, false, '');
   FDiasEnvioDST := CreateCmDbField('DIASENVIODST', ftFloat, false, false, false, false, '');
   FIdPatro := CreateCmDbField('IDPATRO', ftFloat, false, false, false, true, '');
   FIdPlanoPrev := CreateCmDbField('IDPLANOPREV', ftFloat, false, false, false, true, '');
   FCodPortFormaRec := CreateCmDbField('CODPORTFORMAREC', ftFloat, false, false, false, true, '');
   FCodPortFormaPag := CreateCmDbField('CODPORTFORMAPAG', ftFloat, false, false, false, true, '');
   FIdDocumento := CreateCmDbField('IDDOCUMENTO', ftFloat, false, false, false, true, '');
   FColDocumento := CreateCmDbField('COLDOCUMENTO', ftFloat, false, false, false, false, '');
   FTamDocumento := CreateCmDbField('TAMDOCUMENTO', ftFloat, false, false, false, false, '');
   FFlgBancoHoras := CreateCmDbField('FLGBANCOHORAS', ftFloat, false, false, false, false, '');
   FPerBancoHoras := CreateCmDbField('PERBANCOHORAS', ftFloat, false, false, false, false, '');
   FLimBancoHoras := CreateCmDbField('LIMBANCOHORAS', ftFloat, false, false, false, false, '');
   FDsrBancoHoras := CreateCmDbField('DSRBANCOHORAS', ftFloat, false, false, false, false, '');
   FNorBancoHoras := CreateCmDbField('NORBANCOHORAS', ftFloat, false, false, false, false, '');
   FIndPerBcHoras := CreateCmDbField('INDPERBCHORAS', ftFloat, false, false, false, false, '');
   FDatBancoHoras := CreateCmDbField('DATBANCOHORAS', ftDateTime, false, false, false, true, '');
   FPontoIni := CreateCmDbField('PONTOINI', ftDateTime, false, false, false, true, '');
   FPontoFim := CreateCmDbField('PONTOFIM', ftDateTime, false, false, false, true, '');
   FPrazoPonto := CreateCmDbField('PRAZOPONTO', ftFloat, false, false, false, false, '');
   FDataVigenciaObj := CreateCmDbField('DATAVIGENCIAOBJ', ftDateTime, false, false, false, true, '');
   // SOL 137269 KTN 829602 - Paulo Nobre
   FVlrFixoTaxi := CreateCmDbField('VLRPERCENTACRESCIMODIARIA', ftFloat, false, false, false, false, '');
   FVlrPercDiaria := CreateCmDbField('VLRPERCENTREDUCAODIARIA', ftFloat, false, false, false, false, '');
   FVlrPercCusteio := CreateCmDbField('VLRFIXOTAXITRECHO', ftFloat, false, false, false, false, '');
   // SOL 172550 KTN 1555163 - Paulo Nobre
   FVlrPercCusteio := CreateCmDbField('DIASPAGTOJURETAPA', ftFloat, false, false, false, false, '');
   FVlrPercCusteio := CreateCmDbField('CODTIPDOCEJURETAPA', ftFloat, false, false, false, false, '');
   FVlrPercCusteio := CreateCmDbField('CODPORTFORMAPAGETAPAJUR', ftFloat, false, false, false, false, '');
   // SOL 174225 KTN 1572025 - Paulo Nobre
   FCodCentCustoJur := CreateCmDbField('CODCENTCUSTOJUR', ftString, false, false, false, false, '');
   FRecPagCustasJudPag := CreateCmDbField('RECPAGCUSTASJUDPAG', ftString, false, false, false, false, '');
   FCodDesembCustasJudPag := CreateCmDbField('CODDESEMBCUSTASJUDPAG', ftString, false, false, false, false, '');
   // Thiago Melo SOL 185805 Kintana 1763461
   Fflgavisoativo := CreateCmDbField('FLGAVISOATIVO', ftString, false, false, false, false, '');
   Fdiaavisocobranca := CreateCmDbField('DIAAVISOCOBRANCA', ftInteger, false, false, false, false, '');
   Fcorpoemail := CreateCmDbField('CORPOEMAIL', ftString, false, false, false, false, '');
   //

   FDiasBloqDestac := CreateCmDbField('DIASBLOQDESTAC', ftFloat, False, False, False, False, ''); // Felipe A. Santos SOL 228736/17139 PPM 761996
End;

Function TDbParamRH.GetSqlSelect: String;
Begin
   Result :=
      'SELECT' + CR_LF +
      '  NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, PGTO13INI, PGTO13FIM,' + CR_LF +
      '  IDRUBFALTA, IDRUBFGTS, IDRUBINSS, IDRUB13, IDRUBANTEC13, IDRUBIRRF,' + CR_LF +
      '  IDMOTIVO, FLGDOISCARGOS, FLGNIVELINDIV, FLGINTEGRACONT, FLGINTEGRACAP,' + CR_LF +
      '  FLGCRIASUBCONTA, FLGSENHAUSOPES, FLGNUMERAMATRIC, INDDURACAOCONTR,' + CR_LF +
      '  TAMANHOMATRIC, MOEDAPROCTRAB, MATRDIS, LIMADM, LIMDEM, LIMAFAST,' + CR_LF +
      '  LIMRETOR, NUMSTEPS, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, TITSTEP5,' + CR_LF +
      '  TITSTEP6, TITSTEP7, TITSTEP8, TITSTEP9, FLGENDERINS, FLGENDERALT,' + CR_LF +
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613
   '  TITSTEP10, TITSTEP11, TITSTEP12, TITSTEP13, TITSTEP14, TITSTEP15,' + CR_LF +
      '  TITSTEP16, TITSTEP17, TITSTEP18, TITSTEP19, TITSTEP20,' + CR_LF +
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613
   '  FLGENDEREXC, FLGTELEFINS, FLGTELEFALT, FLGTELEFEXC, FLGCONTTINS,' + CR_LF +
      '  FLGCONTTALT, FLGCONTTEXC, FLGCURSOINS, FLGCURSOALT, FLGCURSOEXC,' + CR_LF +
      '  FLGFERIAINS, FLGFERIAALT, FLGFERIAEXC, FLGEMPRGINS, FLGEMPRGALT,' + CR_LF +
      '  FLGEMPRGEXC, FLGLINHAINS, FLGLINHAALT, FLGLINHAEXC, FLGCTSALALT,' + CR_LF +
      '  INDPOLITICA, IDMOTIVORESCISAO, FLGFILTRAFATOR, FLGAVALALUNO, FLGCURSOXAVAL, ' + CR_LF +
      '  VALMAXAVALTRN, FLGPERCPROB, INDCONTABJUR, DIASACERTOCONTA, ' + CR_LF +
      '  FLGCALENDST, IDPESSOA, CODTIPREC, RECPAGREC, CODTIPDOCREC, DIASENVIODST, IDPATRO, IDPLANOPREV,' + CR_LF +
      '  CODTIPDES, RECPAGDES, CODTIPDOCPAG, FLGMARCAAFAST, FLGMARCAFERIAS, FLGALTERAPONTO, ' + CR_LF +
      '  CODPORTFORMAREC, CODPORTFORMAPAG, IDDOCUMENTO, COLDOCUMENTO, TAMDOCUMENTO, ' + CR_LF +
      '  FLGBANCOHORAS, PERBANCOHORAS, LIMBANCOHORAS, DSRBANCOHORAS, NORBANCOHORAS, ' + CR_LF +
      '  INDPERBCHORAS, DATBANCOHORAS, PONTOINI, PONTOFIM, PRAZOPONTO, DATAVIGENCIAOBJ, VLRPERCENTACRESCIMODIARIA, ' + CR_LF +
      // SOL 137269 KTN 829602 - Paulo Nobre
   '  VLRPERCENTACRESCIMODIARIA, VLRPERCENTREDUCAODIARIA, VLRFIXOTAXITRECHO, ' + CR_LF +
      // SOL 172550 KTN 1555163 - Paulo Nobre
   ' DIASPAGTOJURETAPA, CODTIPDOCEJURETAPA, CODPORTFORMAPAGETAPAJUR, ' + CR_LF +
      // SOL 174225 KTN 1572025 - Paulo Nobre
   '  CODCENTCUSTOJUR, RECPAGCUSTASJUDPAG, CODDESEMBCUSTASJUDPAG ' + CR_LF +
   // Thiago Melo SOL 185805 Kintana 1763461
   ' ,FLGAVISOATIVO, DIAAVISOCOBRANCA, CORPOEMAIL ' + CR_LF +
   //
   ' ,DIASBLOQDESTAC ' + CR_LF + // Felipe A. Santos SOL 228736/17139 PPM 761996
      'FROM' + CR_LF +
      '  PARAMRH';
End;

procedure TDbParamRH.Setcorpoemail(const Value: TCmDbField);
begin
  Fcorpoemail := Value;
end;

End.

