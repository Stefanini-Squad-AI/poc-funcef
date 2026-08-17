{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Remodelado por: Andre Mesquita em 04-05/2007          }
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
Unit uDbDestacamento;

Interface

Uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

Type
   TDbDestacamento = Class(TCmDbObject)
   Private
      FIdDestacamento: TCmDbField;
      FIdPessoa: TCmDbField;
      FJustificativa: TCmDbField;
      FIndObjetivo: TCmDbField;
      FFlgLancaFolha: TCmDbField;
      FFlgGeraAP: TCmDbField;
      FCodDocDestac: TCmDbField;
      FCodDocAcerto: TCmDbField;
      FCodCentroCusto: TCmDbField;
      FIdUsuarioSistema: TCmDbField;
      FCodCentroRespon: TCmDbField;
      FIdUsuarioAcerto: TCmDbField;
      FIdEmpresa: TCmDbField;
      FFlgPartDiaAnt: TCmDbField;
      FFlgRetDiaPost: TCmDbField;
      FFlgInativar: TCmDbField;
   Public
      Constructor Create(AOwner: TCmCustomCdbObject); Override;

      Function Insert: boolean; Override;

      Property IdDestacamento: TCmDbField Read FIdDestacamento Write FIdDestacamento;
      Property IdPessoa: TCmDbField Read FIdPessoa Write FIdPessoa;
      Property Justificativa: TCmDbField Read FJustificativa Write FJustificativa;
      Property IndObjetivo: TCmDbField Read FIndObjetivo Write FIndObjetivo;
      Property FlgLancaFolha: TCmDbField Read FFlgLancaFolha Write FFlgLancaFolha;
      Property FlgGeraAP: TCmDbField Read FFlgGeraAP Write FFlgGeraAP;
      Property CodDocDestac: TCmDbField Read FCodDocDestac Write FCodDocDestac;
      Property CodDocAcerto: TCmDbField Read FCodDocAcerto Write FCodDocAcerto;
      Property IdUsuarioSistema: TCmDbField Read FIdUsuarioSistema Write FIdUsuarioSistema;
      Property IdUsuarioAcerto: TCmDbField Read FIdUsuarioAcerto Write FIdUsuarioAcerto;
      Property CodCentroCusto: TCmDbField Read FCodCentroCusto Write FCodCentroCusto;
      Property CodCentroRespon: TCmDbField Read FCodCentroRespon Write FCodCentroRespon;
      Property IdEmpresa: TCmDbField Read FIdEmpresa Write FIdEmpresa;
      Property FlgPartDiaAnt: TCmDbField Read FFlgPartDiaAnt Write FFlgPartDiaAnt;
      Property FlgRetDiaPost: TCmDbField Read FFlgRetDiaPost Write FFlgRetDiaPost;
      Property FlgInativar: TCmDbField Read FFlgInativar Write FFlgInativar;
   End;

Implementation

{ TDbFerias }

Constructor TDbDestacamento.Create(AOwner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := false;

   TableName := 'DESTACAMENTO';

   FIdDestacamento := CreateCmDbField('IDDESTACAMENTO', ftFloat, true, true, false, true, '');
   FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, false, false, false, true, '');
   FJustificativa := CreateCmDbField('JUSTIFICATIVA', ftString, false, false, false, true, '');
   FIndObjetivo := CreateCmDbField('INDOBJETIVO', ftFloat, false, false, false, false, '');
   FFlgLancaFolha := CreateCmDbField('FLGLANCAFOLHA', ftFloat, false, false, false, false, '');
   FFlgGeraAP := CreateCmDbField('FLGGERAAP', ftFloat, false, false, false, false, '');
   FCodDocDestac := CreateCmDbField('CODDOCDESTAC', ftFloat, false, false, false, true, '');
   FCodDocAcerto := CreateCmDbField('CODDOCACERTO', ftFloat, false, false, false, true, '');
   FIdUsuarioSistema := CreateCmDbField('IDUSUARIOSISTEMA', ftFloat, false, false, false, true, '');
   FIdUsuarioAcerto := CreateCmDbField('IDUSUARIOACERTO', ftFloat, false, false, false, true, '');
   FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO', ftString, false, false, false, false, '');
   FCodCentroRespon := CreateCmDbField('CODCENTRORESPON', ftString, false, false, false, false, '');
   FIdEmpresa := CreateCmDbField('IDEMPRESA', ftFloat, false, false, false, true, '');
   FFlgPartDiaAnt := CreateCmDbField('FLGPARTDIAANT', ftString, false, false, false, false, '');
   FFlgRetDiaPost := CreateCmDbField('FLGRETDIAPOST', ftString, false, false, false, false, '');
End;

Function TDbDestacamento.Insert: boolean;
Begin
   FIdDestacamento.asFloat := GetSequence('DESTACAMENTO');
   Result := Inherited Insert;
End;

End.

