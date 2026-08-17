{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

// **************************************************************************************************
//Rotina..........: uDbTipoRecTrab
//N. Sol..........: 156018
//N. Kintana......: 1225602
//Data............: 04/07/2011
//Responsável.....: Paulo Nobre / Otacilio
//Descrição.......: Implementação de SP para Honorários Periciais.
// **************************************************************************************************

Unit uDbTipoRecTrab;

Interface

Uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

Type
   TDbTipoRecTrab = Class(TCmDbObject)
   Private
      FCodTipoRecurso: TCmDbField;
      FDescricao: TCmDbField;
      FValorHonor: TCmDbField;
      FFlgPenhora: TCmDbField;
      FFlgEncerramento: TCmDbField;
      FTaxaJuros: TCmDbField;
      FIndJuros: TCmDbField;
      FMoeCodigo: TCmDbField;
      FFlgExecucao: TCmDbField;
      //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
      FFlgIntegraFinanceiro: TCmDbField;
      FFlgIntegraContabil: TCmDbField;
      // SOL 161760 KTN 1379145 - Paulo Nobre
      FRecPag: TCmDbField;
   Public
      Constructor Create(AOwner: TCmCustomCdbObject); Override;

      Property CodTipoRecurso: TCmDbField Read FCodTipoRecurso Write FCodTipoRecurso;
      Property Descricao: TCmDbField Read FDescricao Write FDescricao;
      Property ValorHonor: TCmDbField Read FValorHonor Write FValorHonor;
      Property FlgPenhora: TCmDbField Read FFlgPenhora Write FFlgPenhora;
      Property FlgEncerramento: TCmDbField Read FFlgEncerramento Write FFlgEncerramento;
      Property TaxaJuros: TCmDbField Read FTaxaJuros Write FTaxaJuros;
      Property IndJuros: TCmDbField Read FIndJuros Write FIndJuros;
      Property MoeCodigo: TCmDbField Read FMoeCodigo Write FMoeCodigo;
      Property FlgExecucao: TCmDbField Read FFlgExecucao Write FFlgExecucao;
      Property FlgIntegraFinanceiro: TCmDbField Read FFlgIntegraFinanceiro Write FFlgIntegraFinanceiro;
      Property FlgIntegraContabil: TCmDbField Read FFlgIntegraContabil Write FFlgIntegraContabil;
      // SOL 161760 KTN 1379145 - Paulo Nobre
      Property RecPag: TCmDbField Read FRecPag Write FRecPag;
   End;

Implementation

{ TDbTipoRecTrab }

Constructor TDbTipoRecTrab.Create(AOwner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := false;

   TableName := 'TIPORECTRAB';

   FCodTipoRecurso := CreateCmDbField('CODTIPORECURSO', ftFloat, true, true, false, false, '');
   FDescricao := CreateCmDbField('DESCRICAO', ftString, true, false, false, false, '');
   FValorHonor := CreateCmDbField('VALORHONOR', ftFloat, false, false, false, true, '');
   FFlgPenhora := CreateCmDbField('FLGPENHORA', ftFloat, false, false, false, false, '');
   FFlgEncerramento := CreateCmDbField('FLGENCERRAMENTO', ftFloat, false, false, false, false, '');
   FTaxaJuros := CreateCmDbField('TAXAJUROS', ftFloat, false, false, false, false, '');
   FIndJuros := CreateCmDbField('INDJUROS', ftFloat, false, false, false, false, '');
   FMoeCodigo := CreateCmDbField('MOECODIGO', ftFloat, false, false, false, true, '');
   FFlgExecucao := CreateCmDbField('FLGEXECUCAO', ftFloat, false, false, false, false, '');
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   FFlgIntegraFinanceiro := CreateCmDbField('FLGINTEGRAFINANCEIRO', ftString, false, false, false, false, '');
   FFlgIntegraContabil := CreateCmDbField('FLGINTEGRACONTABIL', ftString, false, false, false, false, '');
   // SOL 161760 KTN 1379145 - Paulo Nobre
   FRecPag := CreateCmDbField('RECPAG', ftString, false, false, false, false, '');
End;

End.

