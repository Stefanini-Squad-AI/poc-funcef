{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Criado Em: 17/02/2007                                 }
{                                                       }
{*******************************************************}

//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 26/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novos campos
//******************************************************************************************
Unit uDbDstTrecho;

Interface

Uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

Type
   TDbDstTrecho = Class(TCmDbObject)
   Private
      FIdDestacamento: TCmDbField;
      FNumSeq: TCmDbField;
      FDataIni: TCmDbField;
      FIndObjetivo: TCmDbField;
      FIdCidades: TCmDbField;
      FIndTransporte: TCmDbField;
      FIdDstAeroporto: TCmDbField;
      FVlrTransporte: TCmDbField;
      FFlgTaxi: TCmDbField;
      FIndCusteioTransp: TCmDbField;
      FIndCusteioHospeda: TCmDbField;
      FObservacao: TCmDbField;
   Public
      Constructor Create(AOwner: TCmCustomCdbObject); Override;

      Property IdDestacamento: TCmDbField Read FIdDestacamento Write FIdDestacamento;
      Property NumSeq: TCmDbField Read FNumSeq Write FNumSeq;
      Property DataIni: TCmDbField Read FDataIni Write FDataIni;
      Property IndObjetivo: TCmDbField Read FIndObjetivo Write FIndObjetivo;
      Property IdCidades: TCmDbField Read FIdCidades Write FIdCidades;
      Property IndTransporte: TCmDbField Read FIndTransporte Write FIndTransporte;
      Property IdDstAeroporto: TCmDbField Read FIdDstAeroporto Write FIdDstAeroporto;
      Property VlrTransporte: TCmDbField Read FVlrTransporte Write FVlrTransporte;
      Property FlgTaxi: TCmDbField Read FFlgTaxi Write FFlgTaxi;
      Property IndCusteioTransp: TCmDbField Read FIndCusteioTransp Write FIndCusteioTransp;
      Property IndCusteioHospeda: TCmDbField Read FIndCusteioHospeda Write FIndCusteioHospeda;
      Property Observacao: TCmDbField Read FObservacao Write FObservacao;
   End;

Implementation

Constructor TDbDstTrecho.Create(AOwner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := false;

   TableName := 'DSTTRECHO';

   FIdDestacamento := CreateCmDbField('IDDESTACAMENTO', ftFloat, true, true, false, true, '');
   FNumSeq := CreateCmDbField('NUMSEQ', ftFloat, true, true, false, false, '');
   FDataIni := CreateCmDbField('DATAINI', ftDateTime, false, false, false, false, '');
   FIndObjetivo := CreateCmDbField('INDOBJETIVO', ftFloat, false, false, false, false, '');
   FIdCidades := CreateCmDbField('IDCIDADES', ftFloat, false, false, false, false, '');
   FIndTransporte := CreateCmDbField('INDTRANSPORTE', ftFloat, false, false, false, false, '');
   FIdDstAeroporto := CreateCmDbField('IDDSTAEROPORTO', ftFloat, false, false, false, false, '');
   FVlrTransporte := CreateCmDbField('VLRTRANSPORTE', ftFloat, false, false, false, false, '');
   FFlgTaxi := CreateCmDbField('FLGTAXI', ftString, false, false, false, false, '');
   FIndCusteioTransp := CreateCmDbField('INDCUSTEIOTRANSP', ftFloat, false, false, false, false, '');
   FIndCusteioHospeda := CreateCmDbField('INDCUSTEIOHOSPEDA', ftFloat, false, false, false, false, '');
   FObservacao := CreateCmDbField('OBSERVACAO', ftString, false, false, false, false, '');
End;

End.

