{-------------------------------------------------------------------------------
 N. Chamado......: 2950
 Data............: 14/09/2023
 Responsável.....: Everson Cunha
 Descrição.......: Ajuste tipagem campo FLGPERMANENTE de String para Integer
--------------------------------------------------------------------------------
 N. Sol..........: 137269_7601
 N. Kintana......: 829602
 Data............: 11/01/2012
 Responsável.....: Paulo Nobre
 Descrição.......: Inclusão de Novos Campos
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/12/2001                                 }
{                                                       }
{*******************************************************}


Unit uDbRubricaIndiv;

Interface

Uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

Type
   TDbRubricaIndiv = Class(TCmDbObject)
   Private
      FIdPessoa: TCmDbField;
      FIdEmpresa: TCmDbField;
      FIdRubrica: TCmDbField;
      FNumOcorrencias: TCmDbField;
      FSeqRubricaIndiv: TCmDbField;
      FIdFavorecido: TCmDbField;
      FIdRegraCalculo: TCmDbField;
      FValorRubrica: TCmDbField;
      FAnoMesInicio: TCmDbField;
      FFlgPermanente: TCmDbField;
      FParcelas: TCmDbField;
      FFlgTpRubManut: TCmDbField;
      FIdMotivo : TCmDbField;
      FAnoMesRef : TCmDbField;
   Public
      Constructor Create(AOwner: TCmCustomCdbObject); Override;

      Property IdEmpresa: TCmDbField Read FIdEmpresa Write FIdEmpresa;
      Property IdPessoa: TCmDbField Read FIdPessoa Write FIdPessoa;
      Property IdRubrica: TCmDbField Read FIdRubrica Write FIdRubrica;
      Property NumOcorrencias: TCmDbField Read FNumOcorrencias Write FNumOcorrencias;
      Property SeqRubricaIndiv: TCmDbField Read FSeqRubricaIndiv Write FSeqRubricaIndiv;
      Property IdFavorecido: TCmDbField Read FIdFavorecido Write FIdFavorecido;
      Property IdRegraCalculo: TCmDbField Read FIdRegraCalculo Write FIdRegraCalculo;
      Property ValorRubrica: TCmDbField Read FValorRubrica Write FValorRubrica;
      Property AnoMesInicio: TCmDbField Read FAnoMesInicio Write FAnoMesInicio;
      Property FlgPermanente: TCmDbField Read FFlgPermanente Write FFlgPermanente;
      Property Parcelas: TCmDbField Read FParcelas Write FParcelas;
      Property FlgTpRubManut: TCmDbField Read FFlgTpRubManut Write FFlgTpRubManut;

      Property IdMotivo: TCmDbField Read FIdMotivo Write FIdMotivo;
      Property AnoMesRef: TCmDbField Read FAnoMesRef Write FAnoMesRef;
   End;

Implementation

{ TDbRubricaIndiv }

Constructor TDbRubricaIndiv.Create(AOwner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := false;

   TableName := 'RUBRICAINDIV';

   FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, true, true, false, false, '');
   FIdEmpresa := CreateCmDbField('IDEMPRESA', ftFloat, true, true, false, false, '');
   FIdRubrica := CreateCmDbField('IDRUBRICA', ftFloat, true, true, false, false, '');
   FNumOcorrencias := CreateCmDbField('NUMOCORRENCIAS', ftString, true, false, false, false, '');
   FSeqRubricaIndiv := CreateCmDbField('SEQRUBRICAINDIV', ftFloat, true, true, false, false, '');
   FIdFavorecido := CreateCmDbField('IDFAVORECIDO', ftFloat, false, false, false, true, '');
   FIdRegraCalculo := CreateCmDbField('IDREGRACALCULO', ftFloat, false, false, false, true, '');
   FValorRubrica := CreateCmDbField('VALORRUBRICA', ftFloat, false, false, false, false, '');
   FAnoMesInicio := CreateCmDbField('ANOMESINICIO', ftString, false, false, false, true, '');
   FFlgPermanente := CreateCmDbField('FLGPERMANENTE', ftInteger, true, false, false, false, '');
   FParcelas := CreateCmDbField('PARCELAS', ftFloat, false, false, false, false, '');
   FFlgTpRubManut := CreateCmDbField('FLGTPRUBMANUT', ftString, false, false, false, true, '');

   FIdMotivo := CreateCmDbField('IDMOTIVO', ftFloat, false, false, false, true, '');
   FAnoMesRef := CreateCmDbField('ANOMESREF', ftString, false, false, false, true, '');
End;

End.

