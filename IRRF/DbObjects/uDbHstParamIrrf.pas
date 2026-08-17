{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 29/07/2003                             }
{                                                       }
{*******************************************************}
//***************************************************************************************
//N. Sol..........      : 136956
//Data da Alteração:    : 06/07/2023
//Responsável:          : André Imakawa
//Descrição.......      : Inclusão de novos campos ContribuiçãoExtra
//******************************************************************************************
//Rotina                : Diversas
//N. Sol..........      : 227955/17939
//N. PPM.............   : 1176698 (2063433)
//Data da Alteração:    : 01/03/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão de novos campos necessários à nova BUSCA
//******************************************************************************************
Unit uDbHstParamIrrf;

Interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHstParamIrrf = Class(TCmDbObject)

  Private
    FVlridoso: TCmDbField;
    FVlrdependente: TCmDbField;
    FPercirrfexterior: TCmDbField;
    FIdhstparamirrf: TCmDbField;
    FDataIniVigencia: TCmDbField;
    FIdadeidoso: TCmDbField;

    // SOL 227955/17939 - PPM 1176698 - Paulo Nobre
    FIDINFORME65ANOS: TCmDbField;
    FIDINFORME65ANOS13: TCmDbField;
    FIDINFORMEMOLESTIA: TCmDbField;
    FIDINFORMEACJUD: TCmDbField;
    FIDINFORMEACJUD13: TCmDbField;
    FIDExigibilidadeSuspensa: TCmDbField;
    FIDINFRENDCOMPNEG: TCmDbField;
    FIDINFRENDCOMPNEGISENTO: TCmDbField;
    FIDINFRENDCOMPNEG13S: TCmDbField;
    FIDINFORME65INSS: TCmDbField;
    FIDINFORME65INSS13: TCmDbField;
    FIDINFORMEMOLINSS: TCmDbField;
    FIdAcaoJudicialInss: TCmDbField;
    FIdAcaoJudicialInss13: TCmDbField;
    FIdRegraInss: TCmDbField;
    FIDINFORMECONTRIBEXTRA: TCmDbField;
    FIDINFORMECONTRIBEXTRA13: TCmDbField;

    Procedure SetVlridoso(Const Value: TCmDbField);
    Procedure SetVlrdependente(Const Value: TCmDbField);
    Procedure SetPercirrfexterior(Const Value: TCmDbField);
    Procedure SetIdhstparamirrf(Const Value: TCmDbField);
    Procedure SetDataIniVigencia(Const Value: TCmDbField);
    Procedure SetIdadeidoso(Const Value: TCmDbField);

    // SOL 227955/17939 - PPM 1176698 - Paulo Nobre
    Procedure SetIDINFORME65ANOS(Const Value: TCmDbField);
    Procedure SetIDINFORME65ANOS13(Const Value: TCmDbField);
    Procedure SetIDINFORMEMOLESTIA(Const Value: TCmDbField);
    Procedure SetIDINFORMEACJUD(Const Value: TCmDbField);
    Procedure SetIDINFORMEACJUD13(Const Value: TCmDbField);
    Procedure SetIDExigibilidadeSuspensa(Const Value: TCmDbField);
    Procedure SetIDINFRENDCOMPNEG(Const Value: TCmDbField);
    Procedure SetIDINFRENDCOMPNEGISENTO(Const Value: TCmDbField);
    Procedure SetIDINFRENDCOMPNEG13S(Const Value: TCmDbField);
    Procedure SetIDINFORME65INSS(Const Value: TCmDbField);
    Procedure SetIDINFORME65INSS13(Const Value: TCmDbField);
    Procedure SetIDINFORMEMOLINSS(Const Value: TCmDbField);
    Procedure SetIdAcaoJudicialInss(Const Value: TCmDbField);
    Procedure SetIdAcaoJudicialInss13(Const Value: TCmDbField);
    Procedure SetIdRegraInss(Const Value: TCmDbField);
    Procedure SetIDINFORMECONTRIBEXTRA(Const Value: TCmDbField);    //Andre Imakawa - SIG 136956
    Procedure SetIDINFORMECONTRIBEXTRA13(Const Value: TCmDbField);  //Andre Imakawa - SIG 136956

  Public
    Property Vlridoso: TCmDbField Read FVlridoso Write SetVlridoso;
    Property Vlrdependente: TCmDbField Read FVlrdependente Write SetVlrdependente;
    Property Percirrfexterior: TCmDbField Read FPercirrfexterior Write SetPercirrfexterior;
    Property Idhstparamirrf: TCmDbField Read FIdhstparamirrf Write SetIdhstparamirrf;
    Property Idadeidoso: TCmDbField Read FIdadeidoso Write SetIdadeidoso;
    Property Datainivigencia: TCmDbField Read FDatainivigencia Write SetDatainivigencia;

    // SOL 227955/17939 - PPM 1176698 - Paulo Nobre
    Property IDINFORME65ANOS: TCmDbField Read FIDINFORME65ANOS Write SetIDINFORME65ANOS;
    Property IDINFORME65ANOS13: TCmDbField Read FIDINFORME65ANOS13 Write SetIDINFORME65ANOS13;
    Property IDINFORMEMOLESTIA: TCmDbField Read FIDINFORMEMOLESTIA Write SetIDINFORMEMOLESTIA;
    Property IDINFORMEACJUD: TCmDbField Read FIDINFORMEACJUD Write SetIDINFORMEACJUD;
    Property IDINFORMEACJUD13: TCmDbField Read FIDINFORMEACJUD13 Write SetIDINFORMEACJUD13;
    Property IDExigibilidadeSuspensa: TCmDbField Read FIDExigibilidadeSuspensa Write SetIDExigibilidadeSuspensa;
    Property IDINFRENDCOMPNEG: TCmDbField Read FIDINFRENDCOMPNEG Write SetIDINFRENDCOMPNEG;
    Property IDINFRENDCOMPNEGISENTO: TCmDbField Read FIDINFRENDCOMPNEGISENTO Write SetIDINFRENDCOMPNEGISENTO;
    Property IDINFRENDCOMPNEG13S: TCmDbField Read FIDINFRENDCOMPNEG13S Write SetIDINFRENDCOMPNEG13S;
    Property IDINFORME65INSS: TCmDbField Read FIDINFORME65INSS Write SetIDINFORME65INSS;
    Property IDINFORME65INSS13: TCmDbField Read FIDINFORME65INSS13 Write SetIDINFORME65INSS13;
    Property IDINFORMEMOLINSS: TCmDbField Read FIDINFORMEMOLINSS Write SetIDINFORMEMOLINSS;
    Property IdAcaoJudicialInss: TCmDbField Read FIdAcaoJudicialInss Write SetIdAcaoJudicialInss;
    Property IdAcaoJudicialInss13: TCmDbField Read FIdAcaoJudicialInss13 Write SetIdAcaoJudicialInss13;
    Property IdRegraInss: TCmDbField Read FIdRegraInss Write SetIdRegraInss;
    Property IDINFORMECONTRIBEXTRA: TCmDbField Read FIDINFORMECONTRIBEXTRA Write SetIDINFORMECONTRIBEXTRA;       //Andre Imakawa - SIG 136956
    Property IDINFORMECONTRIBEXTRA13: TCmDbField Read FIDINFORMECONTRIBEXTRA13 Write SetIDINFORMECONTRIBEXTRA13; //Andre Imakawa - SIG 136956

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

Implementation

{ TDbHstParamIrrf }

Constructor TDbHstParamIrrf.Create(Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTPARAMIRRF';

  fVlridoso := CreateCmDbField('VLRIDOSO', ftfloat, False, False, False, False, '');
  fVlrdependente := CreateCmDbField('VLRDEPENDENTE', ftfloat, False, False, False, False, '');
  fPercirrfexterior := CreateCmDbField('PERCIRRFEXTERIOR', ftfloat, False, False, False, False, '');
  fIdhstparamirrf := CreateCmDbField('IDHSTPARAMIRRF', ftfloat, True, True, False, True, '');
  fIdadeidoso := CreateCmDbField('IDADEIDOSO', ftfloat, False, False, False, False, '');
  fDatainivigencia := CreateCmDbField('DATAINIVIGENCIA', ftDateTime, False, False, False, False, '');

  // SOL 227955/17939 - PPM 1176698 - Paulo Nobre
  FIDINFORME65ANOS := CreateCmDbField('IDINFORME65ANOS', ftfloat, False, False, False, False, ''); ;
  FIDINFORME65ANOS13 := CreateCmDbField('IDINFORME65ANOS13', ftfloat, False, False, False, False, ''); ;
  FIDINFORMEMOLESTIA := CreateCmDbField('IDINFORMEMOLESTIA', ftfloat, False, False, False, False, ''); ;
  FIDINFORMEACJUD := CreateCmDbField('IDINFORMEACJUD', ftfloat, False, False, False, False, ''); ;
  FIDINFORMEACJUD13 := CreateCmDbField('IDINFORMEACJUD13', ftfloat, False, False, False, False, ''); ;
  FIDExigibilidadeSuspensa := CreateCmDbField('IDExigibilidadeSuspensa', ftfloat, False, False, False, False, ''); ;
  FIDINFRENDCOMPNEG := CreateCmDbField('IDINFRENDCOMPNEG', ftfloat, False, False, False, False, ''); ;
  FIDINFRENDCOMPNEGISENTO := CreateCmDbField('IDINFRENDCOMPNEGISENTO', ftfloat, False, False, False, False, ''); ;
  FIDINFRENDCOMPNEG13S := CreateCmDbField('IDINFRENDCOMPNEG13S', ftfloat, False, False, False, False, ''); ;
  FIDINFORME65INSS := CreateCmDbField('IDINFORME65INSS', ftfloat, False, False, False, False, ''); ;
  FIDINFORME65INSS13 := CreateCmDbField('IDINFORME65INSS13', ftfloat, False, False, False, False, ''); ;
  FIDINFORMEMOLINSS := CreateCmDbField('IDINFORMEMOLINSS', ftfloat, False, False, False, False, ''); ;
  FIdAcaoJudicialInss := CreateCmDbField('IdAcaoJudicialInss', ftfloat, False, False, False, False, ''); ;
  FIdAcaoJudicialInss13 := CreateCmDbField('IdAcaoJudicialInss13', ftfloat, False, False, False, False, ''); ;
  FIdRegraInss := CreateCmDbField('IdRegraInss', ftfloat, False, False, False, False, ''); ;
  FIDINFORMECONTRIBEXTRA := CreateCmDbField('IDINFORMECONTRIBEXTRA', ftfloat, False, False, False, False, ''); ;     //Andre Imakawa - SIG 136956
  FIDINFORMECONTRIBEXTRA13 := CreateCmDbField('IDINFORMECONTRIBEXTRA13', ftfloat, False, False, False, False, ''); ; //Andre Imakawa - SIG 136956

End;

Function TDbHstParamIrrf.Insert: Boolean;
Begin
  fIdhstparamirrf.AsFloat := GetSequence('HSTPARAMIRRF');
  Result := Inherited Insert;
End;

Function TDbHstParamIrrf.LoadFromDb: Boolean;
Begin
  Result := Inherited LoadFromDB;
End;

Procedure TDbHstParamIrrf.SetDataIniVigencia(Const Value: TCmDbField);
Begin
  FDataIniVigencia := Value;
End;

Procedure TDbHstParamIrrf.SetIdadeidoso(Const Value: TCmDbField);
Begin
  FIdadeidoso := Value;
End;

Procedure TDbHstParamIrrf.SetIdhstparamirrf(Const Value: TCmDbField);
Begin
  FIdhstparamirrf := Value;
End;

Procedure TDbHstParamIrrf.SetPercirrfexterior(Const Value: TCmDbField);
Begin
  FPercirrfexterior := Value;
End;

Procedure TDbHstParamIrrf.SetVlrdependente(Const Value: TCmDbField);
Begin
  FVlrdependente := Value;
End;

Procedure TDbHstParamIrrf.SetVlridoso(Const Value: TCmDbField);
Begin
  FVlridoso := Value;
End;

// SOL 227955/17939 - PPM 1176698 - Paulo Nobre

Procedure TDbHstParamIrrf.SetIDINFORME65ANOS(Const Value: TCmDbField);
Begin
  FIDINFORME65ANOS := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORME65ANOS13(Const Value: TCmDbField);
Begin
  FIDINFORME65ANOS13 := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORMEMOLESTIA(Const Value: TCmDbField);
Begin
  FIDINFORMEMOLESTIA := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORMEACJUD(Const Value: TCmDbField);
Begin
  FIDINFORMEACJUD := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORMEACJUD13(Const Value: TCmDbField);
Begin
  FIDINFORMEACJUD13 := Value;
End;

Procedure TDbHstParamIrrf.SetIDExigibilidadeSuspensa(Const Value: TCmDbField);
Begin
  FIDExigibilidadeSuspensa := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFRENDCOMPNEG(Const Value: TCmDbField);
Begin
  FIDINFRENDCOMPNEG := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFRENDCOMPNEGISENTO(Const Value: TCmDbField);
Begin
  FIDINFRENDCOMPNEGISENTO := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFRENDCOMPNEG13S(Const Value: TCmDbField);
Begin
  FIDINFRENDCOMPNEG13S := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORME65INSS(Const Value: TCmDbField);
Begin
  FIDINFORME65INSS := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORME65INSS13(Const Value: TCmDbField);
Begin
  FIDINFORME65INSS13 := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORMEMOLINSS(Const Value: TCmDbField);
Begin
  FIDINFORMEMOLINSS := Value;
End;

Procedure TDbHstParamIrrf.SetIDAcaoJudicialInss(Const Value: TCmDbField);
Begin
  FIdAcaoJudicialInss := Value;
End;

Procedure TDbHstParamIrrf.SetIDAcaoJudicialInss13(Const Value: TCmDbField);
Begin
  FIdAcaoJudicialInss13 := Value;
End;

Procedure TDbHstParamIrrf.SetIDRegraInss(Const Value: TCmDbField);
Begin
  FIdRegraInss := Value;
End;

//Andre Imakawa - SIG 136956 - Inicio
Procedure TDbHstParamIrrf.SetIDINFORMECONTRIBEXTRA(Const Value: TCmDbField);
Begin
  FIDINFORMECONTRIBEXTRA := Value;
End;

Procedure TDbHstParamIrrf.SetIDINFORMECONTRIBEXTRA13(Const Value: TCmDbField);
Begin
  FIDINFORMECONTRIBEXTRA13 := Value;
End;
//Andre Imakawa - SIG 136956 - Fim

End.

