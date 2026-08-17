{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/11/2002                                 }
{                                                       }
{*******************************************************}

Unit uDbEtapaProcTrab;

Interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbEtapaProcTrab = Class(TCmDbObject)
   Private
      FObservEtapa: TCmDbField;
      FCodTipoRecurso: TCmDbField;
      FNumSeq: TCmDbField;
      FNumProcTrab: TCmDbField;
      FAssunto: TCmDbField;
      FValorRec: TCmDbField;
      FDataRealOcor: TCmDbField;
      FDataPrevOcorr: TCmDbField;
      FIdImagem: TCmDbField;
      FFlgValorAbate: TCmDbField;
      FIndPenhora: TCmDbField;
      FIdSitPenhora: TCmDbField;
      FIdBem: TCmDbField;
      FIdPessoa: TCmDbField;
      FIdImovel: TCmDbField;
      FIdConjunto: TCmDbField;
      FIdInvestimento: TCmDbField;
      FValor: TCmDbField;
      FIndValor: TCmDbField;
      FFlgImportacao: TCmDbField;
      FCodDocumento: TCmDbField;
      FIdPlanPrevCtbPatr: TCmDbField;
      FIdFundoInvest: TCmDbField;
      FIdCBancaria: TCmDbField;
      FNumSeqVinc: TCmDbField;
      FValorMulta: TCmDbField;
      FIndMulta: TCmDbField;
      FFlgInvestLido: TCmDbField;
      FValorCustas: TCmDbField;
      FValorJuiz: TCmDbField;
      FCodPortador: TCmDbField;
      FDataIniMulta: TCmDbField;
      FDataPagMulta: TCmDbField;
      FValorMultaPaga: TCmDbField;
      FIdTipoCota: TCmDbField;
      FIdTipoInvest: TCmDbField;
      FIdCustodiante: TCmDbField;
      FIdOperRenFixAplic: TCmDbField;
      FIdFielDepos: TCmDbField;
      // SOL 161760 KTN 1379145 - Paulo Nobre
      FPlano: TCmDbField;
      FPlnCodigo: TCmDbField;
      //
      FNoDocumento: TCmDbField;
      // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
      FDataPrevPagto: TCmDbField;                                                              
   Public
      Constructor Create(AOwner: TCmCustomCdbObject); Override;

      Property NumProcTrab: TCmDbField Read FNumProcTrab Write FNumProcTrab;
      Property NumSeq: TCmDbField Read FNumSeq Write FNumSeq;
      Property DataPrevOcorr: TCmDbField Read FDataPrevOcorr Write FDataPrevOcorr;
      Property DataRealOcor: TCmDbField Read FDataRealOcor Write FDataRealOcor;
      Property Assunto: TCmDbField Read FAssunto Write FAssunto;
      Property CodTipoRecurso: TCmDbField Read FCodTipoRecurso Write FCodTipoRecurso;
      Property IdImagem: TCmDbField Read FIdImagem Write FIdImagem;
      Property ValorRec: TCmDbField Read FValorRec Write FValorRec;
      Property ObservEtapa: TCmDbField Read FObservEtapa Write FObservEtapa;
      Property FlgValorAbate: TCmDbField Read FFlgValorAbate Write FFlgValorAbate;
      Property IndPenhora: TCmDbField Read FIndPenhora Write FIndPenhora;
      Property IdSitPenhora: TCmDbField Read FIdSitPenhora Write FIdSitPenhora;
      Property IdBem: TCmDbField Read FIdBem Write FIdBem;
      Property IdPessoa: TCmDbField Read FIdPessoa Write FIdPessoa;
      Property IdImovel: TCmDbField Read FIdImovel Write FIdImovel;
      Property IdConjunto: TCmDbField Read FIdConjunto Write FIdConjunto;
      Property IdInvestimento: TCmDbField Read FIdInvestimento Write FIdInvestimento;
      Property Valor: TCmDbField Read FValor Write FValor;
      Property IndValor: TCmDbField Read FIndValor Write FIndValor;
      Property FlgImportacao: TCmDbField Read FFlgImportacao Write FFlgImportacao;
      Property CodDocumento: TCmDbField Read FCodDocumento Write FCodDocumento;
      Property IdPlanPrevCtbPatr: TCmDbField Read FIdPlanPrevCtbPatr Write FIdPlanPrevCtbPatr;
      Property IdFundoInvest: TCmDbField Read FIdFundoInvest Write FIdFundoInvest;
      Property IdCBancaria: TCmDbField Read FIdCBancaria Write FIdCBancaria;
      Property NumSeqVinc: TCmDbField Read FNumSeqVinc Write FNumSeqVinc;
      Property ValorMulta: TCmDbField Read FValorMulta Write FValorMulta;
      Property IndMulta: TCmDbField Read FIndMulta Write FIndMulta;
      Property FlgInvestLido: TCmDbField Read FFlgInvestLido Write FFlgInvestLido;
      Property ValorCustas: TCmDbField Read FValorCustas Write FValorCustas;
      Property ValorJuiz: TCmDbField Read FValorJuiz Write FValorJuiz;
      Property CodPortador: TCmDbField Read FCodPortador Write FCodPortador;
      Property DataIniMulta: TCmDbField Read FDataIniMulta Write FDataIniMulta;
      Property DataPagMulta: TCmDbField Read FDataPagMulta Write FDataPagMulta;
      Property ValorMultaPaga: TCmDbField Read FValorMultaPaga Write FValorMultaPaga;
      Property IdTipoCota: TCmDbField Read FIdTipoCota Write FIdTipoCota;
      Property IdTipoInvest: TCmDbField Read FIdTipoInvest Write FIdTipoInvest;
      Property IdCustodiante: TCmDbField Read FIdCustodiante Write FIdCustodiante;
      Property IdOperRenFixAplic: TCmDbField Read FIdOperRenFixAplic Write FIdOperRenFixAplic;
      Property IdFielDepos: TCmDbField Read FIdFielDepos Write FIdFielDepos;
      // SOL 161760 KTN 1379145 - Paulo Nobre
      Property Plano: TCmDbField Read FPlano Write FPlano;
      Property PlnCodigo: TCmDbField Read FPlnCodigo Write FPlnCodigo;
      //
      Property NoDocumento: TCmDbField Read FNoDocumento Write FNoDocumento;
      // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
      Property DataPrevPagto: TCmDbField Read FDataPrevPagto Write FDataPrevPagto;

   End;

Implementation

{ TDbEtapaProcTrab }

Constructor TDbEtapaProcTrab.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := false;

   TableName := 'ETAPAPROCTRAB';

   FNumProcTrab := CreateCmDbField('NUMPROCTRAB', ftFloat, true, true, false, true, '');
   FNumSeq := CreateCmDbField('NUMSEQ', ftFloat, true, true, false, true, '');
   FDataPrevOcorr := CreateCmDbField('DATAPREVOCORR', ftDateTime, false, false, false, true, '');
   FDataRealOcor := CreateCmDbField('DATAREALOCOR', ftDateTime, false, false, false, true, '', -1, true);
   FAssunto := CreateCmDbField('ASSUNTO', ftString, false, false, false, true, '');
   FCodTipoRecurso := CreateCmDbField('CODTIPORECURSO', ftFloat, false, false, false, true, '');
   FIdImagem := CreateCmDbField('IDIMAGEM', ftFloat, false, false, false, true, '');
   FValorRec := CreateCmDbField('VALORREC', ftFloat, false, false, false, false, '');
   FObservEtapa := CreateCmDbField('OBSERVETAPA', ftBlob, false, false, false, true, '');
   FFlgValorAbate := CreateCmDbField('FLGVALORABATE', ftFloat, false, false, false, false, '');
   FIndPenhora := CreateCmDbField('INDPENHORA', ftFloat, false, false, false, false, '');
   FIdSitPenhora := CreateCmDbField('IDSITPENHORA', ftString, false, false, false, true, ''); //---Renan Cristiano KT 653226 SOL 125702 início.
   FIdBem := CreateCmDbField('IDBEM', ftFloat, false, false, false, true, '');
   FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, false, false, false, true, '');
   FIdImovel := CreateCmDbField('IDIMOVEL', ftFloat, false, false, false, true, '');
   FIdConjunto := CreateCmDbField('IDCONJUNTO', ftFloat, false, false, false, true, '');
   FIdInvestimento := CreateCmDbField('IDINVESTIMENTO', ftFloat, false, false, false, true, '');
   FValor := CreateCmDbField('VALOR', ftFloat, false, false, false, false, '');
   FIndValor := CreateCmDbField('INDVALOR', ftFloat, false, false, false, false, '');
   FFlgImportacao := CreateCmDbField('FLGIMPORTACAO', ftFloat, false, false, false, false, '');
   FCodDocumento := CreateCmDbField('CODDOCUMENTO', ftFloat, false, false, false, true, '');
   FIdPlanPrevCtbPatr := CreateCmDbField('IDPLANPREVCTBPATR', ftFloat, false, false, false, true, '');
   FIdFundoInvest := CreateCmDbField('IDFUNDOINVEST', ftFloat, false, false, false, true, '');
   FIdCBancaria := CreateCmDbField('IDCBANCARIA', ftFloat, false, false, false, true, '');
   FNumSeqVinc := CreateCmDbField('NUMSEQVINC', ftFloat, false, false, false, false, '');
   FValorMulta := CreateCmDbField('VALORMULTA', ftFloat, false, false, false, false, '');
   FIndMulta := CreateCmDbField('INDMULTA', ftFloat, false, false, false, false, '');
   FFlgInvestLido := CreateCmDbField('FLGINVESTLIDO', ftFloat, false, false, false, false, '');
   FValorCustas := CreateCmDbField('VALORCUSTAS', ftFloat, false, false, false, false, '');
   FValorJuiz := CreateCmDbField('VALORJUIZ', ftFloat, false, false, false, false, '');
   FCodPortador := CreateCmDbField('CODPORTADOR', ftFloat, false, false, false, true, '');
   FDataIniMulta := CreateCmDbField('DATAINIMULTA', ftDateTime, false, false, false, true, '');
   FDataPagMulta := CreateCmDbField('DATAPAGMULTA', ftDateTime, false, false, false, true, '', -1, true);
   FValorMultaPaga := CreateCmDbField('VALORMULTAPAGA', ftFloat, false, false, false, false, '');
   FIdTipoCota := CreateCmDbField('IDTIPOCOTA', ftFloat, false, false, false, true, '');
   FIdTipoInvest := CreateCmDbField('IDTIPOINVEST', ftFloat, false, false, false, true, '');
   FIdCustodiante := CreateCmDbField('IDCUSTODIANTE', ftFloat, false, false, false, true, '');
   FIdOperRenFixAplic := CreateCmDbField('IDOPERRENFIXAPLIC', ftFloat, false, false, false, true, '');
   FIdFielDepos := CreateCmDbField('IDFIELDEPOS', ftFloat, false, false, false, true, '');
   // SOL 161760 KTN 1379145 - Paulo Nobre
   FPlano := CreateCmDbField('PLANO', ftFloat, false, false, false, true, '');
   FPlnCodigo := CreateCmDbField('PLNCODIGO', ftFloat, false, false, false, true, '');
   //
// SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
   FNoDocumento := CreateCmDbField('NODOCUMENTO', ftFloat, false, false, false, true, '');
   FDataPrevPagto := CreateCmDbField('DATAPREVPAGTO', ftDateTime, false, false, false, true, '');
End;

End.

