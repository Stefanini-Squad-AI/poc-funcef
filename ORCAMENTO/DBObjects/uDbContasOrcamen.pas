{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 30/04/2002                             }
{                                                       }
{*******************************************************}

{-------------------------------------------------------------------------------
Rotina......: campo novo FLGTRANSFORIGDIF
Nº SOL......: 190311
Nº KINTANA..: 1799290
Data........: 15/04/2013
Responsável.: Edilaine Ferraresi
Descrição...: permitir transferencia entre grupos diferentes
-------------------------------------------------------------------------------}


Unit uDbContasOrcamen;

Interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContasOrcamen = class(TCmDbObject)

  Private
    FVlrinformadoreal  : TCmDbField;
    FVlrinformadoorc   : TCmDbField;
    FUnidnegoc         : TCmDbField;
    FTipocalcrealizado : TCmDbField;
    FTipocalcorcado    : TCmDbField;
    FOrigemcmdv        : TCmDbField;
    FObservacao        : TCmDbField;
    FNomecontaorcamen  : TCmDbField;
    FIdplanoprev       : TCmDbField;
    FIdplanoorcamen    : TCmDbField;
    FIdpessoa          : TCmDbField;
    FIdpatro           : TCmDbField;
    FIdgrupoorcamen    : TCmDbField;
    FIdempresa         : TCmDbField;
    FIddataview        : TCmDbField;
    FIdcontaorcamen    : TCmDbField;
    FFormularealizado  : TCmDbField;
    FFormulaorcado     : TCmDbField;
    FFlgtransfsaldo    : TCmDbField;
    FFlgsinalconta     : TCmDbField;
    FFlginfdiames      : TCmDbField;
    FFlgcontamonetaria : TCmDbField;
    FFlgcalcreal       : TCmDbField;
    FFlgcalcorcado     : TCmDbField;
    FFlgativa          : TCmDbField;
    FFlgacumulado      : TCmDbField;
    FDatainativa       : TCmDbField;
    FDataativa         : TCmDbField;
    FCodcentrorespon   : TCmDbField;
    FCodcentrocusto    : TCmDbField;
    FIdFormOrcado      : TCmDbField;
    FFlgTransfOrigDif  : TCmDbField;

    Procedure SetVlrinformadoreal( const Value : TCmDbField );
    Procedure SetVlrinformadoorc( const Value : TCmDbField );
    Procedure SetUnidnegoc( const Value : TCmDbField );
    Procedure SetTipocalcrealizado( const Value : TCmDbField );
    Procedure SetTipocalcorcado( const Value : TCmDbField );
    Procedure SetOrigemcmdv( const Value : TCmDbField );
    Procedure SetObservacao( const Value : TCmDbField );
    Procedure SetNomecontaorcamen( const Value : TCmDbField );
    Procedure SetIdplanoprev( const Value : TCmDbField );
    Procedure SetIdplanoorcamen( const Value : TCmDbField );
    Procedure SetIdpessoa( const Value : TCmDbField );
    Procedure SetIdpatro( const Value : TCmDbField );
    Procedure SetIdgrupoorcamen( const Value : TCmDbField );
    Procedure SetIdempresa( const Value : TCmDbField );
    Procedure SetIddataview( const Value : TCmDbField );
    Procedure SetIdcontaorcamen( const Value : TCmDbField );
    Procedure SetFormularealizado( const Value : TCmDbField );
    Procedure SetFormulaorcado( const Value : TCmDbField );
    Procedure SetFlgtransfsaldo( const Value : TCmDbField );
    Procedure SetFlgsinalconta( const Value : TCmDbField );
    Procedure SetFlginfdiames( const Value : TCmDbField );
    Procedure SetFlgcontamonetaria( const Value : TCmDbField );
    Procedure SetFlgcalcreal( const Value : TCmDbField );
    Procedure SetFlgcalcorcado( const Value : TCmDbField );
    Procedure SetFlgativa( const Value : TCmDbField );
    Procedure SetFlgacumulado( const Value : TCmDbField );
    Procedure SetDatainativa( const Value : TCmDbField );
    Procedure SetDataativa( const Value : TCmDbField );
    Procedure SetCodcentrorespon( const Value : TCmDbField );
    Procedure SetCodcentrocusto( const Value : TCmDbField );

    procedure SetIdFormOrcado(const Value: TCmDbField);
    procedure SetFlgTransfOrigDif(const Value: TCmDbField);

  Public

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     Property Vlrinformadoreal  : TCmDbField Read FVlrinformadoreal  Write SetVlrinformadoreal;
     Property Vlrinformadoorc   : TCmDbField Read FVlrinformadoorc   Write SetVlrinformadoorc;
     Property Unidnegoc         : TCmDbField Read FUnidnegoc         Write SetUnidnegoc;
     Property Tipocalcrealizado : TCmDbField Read FTipocalcrealizado Write SetTipocalcrealizado;
     Property Tipocalcorcado    : TCmDbField Read FTipocalcorcado    Write SetTipocalcorcado;
     Property Origemcmdv        : TCmDbField Read FOrigemcmdv        Write SetOrigemcmdv;
     Property Observacao        : TCmDbField Read FObservacao        Write SetObservacao;
     Property Nomecontaorcamen  : TCmDbField Read FNomecontaorcamen  Write SetNomecontaorcamen;
     Property Idplanoprev       : TCmDbField Read FIdplanoprev       Write SetIdplanoprev;
     Property Idplanoorcamen    : TCmDbField Read FIdplanoorcamen    Write SetIdplanoorcamen;
     Property Idpessoa          : TCmDbField Read FIdpessoa          Write SetIdpessoa;
     Property Idpatro           : TCmDbField Read FIdpatro           Write SetIdpatro;
     Property Idgrupoorcamen    : TCmDbField Read FIdgrupoorcamen    Write SetIdgrupoorcamen;
     Property Idempresa         : TCmDbField Read FIdempresa         Write SetIdempresa;
     Property Iddataview        : TCmDbField Read FIddataview        Write SetIddataview;
     Property Idcontaorcamen    : TCmDbField Read FIdcontaorcamen    Write SetIdcontaorcamen;
     Property Formularealizado  : TCmDbField Read FFormularealizado  Write SetFormularealizado;
     Property Formulaorcado     : TCmDbField Read FFormulaorcado     Write SetFormulaorcado;
     Property Flgtransfsaldo    : TCmDbField Read FFlgtransfsaldo    Write SetFlgtransfsaldo;
     Property Flgsinalconta     : TCmDbField Read FFlgsinalconta     Write SetFlgsinalconta;
     Property Flginfdiames      : TCmDbField Read FFlginfdiames      Write SetFlginfdiames;
     Property Flgcontamonetaria : TCmDbField Read FFlgcontamonetaria Write SetFlgcontamonetaria;
     Property Flgcalcreal       : TCmDbField Read FFlgcalcreal       Write SetFlgcalcreal;
     Property Flgcalcorcado     : TCmDbField Read FFlgcalcorcado     Write SetFlgcalcorcado;
     Property Flgativa          : TCmDbField Read FFlgativa          Write SetFlgativa;
     Property Flgacumulado      : TCmDbField Read FFlgacumulado      Write SetFlgacumulado;
     Property Datainativa       : TCmDbField Read FDatainativa       Write SetDatainativa;
     Property Dataativa         : TCmDbField Read FDataativa         Write SetDataativa;
     Property Codcentrorespon   : TCmDbField Read FCodcentrorespon   Write SetCodcentrorespon;
     Property Codcentrocusto    : TCmDbField Read FCodcentrocusto    Write SetCodcentrocusto;
     Property IDFormOrcado      : TCmDbField Read FIdFormOrcado      Write SetIdFormOrcado;
     Property FlgTransfOrigDif  : TCmDbField read FFlgTransfOrigDif  write SetFlgTransfOrigDif;
  End;

Implementation

{ TDbContasOrcamen }
//************************************************
Constructor TDbContasOrcamen.Create( Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTASORCAMEN';

  FVlrinformadoreal  := CreateCmDbField( 'VLRINFORMADOREAL',  ftfloat,    False, False, False, True, '' );
  FVlrinformadoorc   := CreateCmDbField( 'VLRINFORMADOORC',   ftfloat,    False, False, False, True, '' );
  FUnidnegoc         := CreateCmDbField( 'UNIDNEGOC',         ftfloat,    False, False, False, True, '' );
  FTipocalcrealizado := CreateCmDbField( 'TIPOCALCREALIZADO', ftString,   False, False, False, True, '' );
  FTipocalcorcado    := CreateCmDbField( 'TIPOCALCORCADO',    ftString,   False, False, False, True, '' );
  FOrigemcmdv        := CreateCmDbField( 'ORIGEMCMDV',        ftfloat,    False, False, False, True, '' );
  FObservacao        := CreateCmDbField( 'OBSERVACAO',        ftString,   False, False, False, True, '' );
  FNomecontaorcamen  := CreateCmDbField( 'NOMECONTAORCAMEN',  ftString,   False, False, False, True, '' );
  FIdplanoprev       := CreateCmDbField( 'IDPLANOPREV',       ftfloat,    False, False, False, True, '' );
  FIdplanoorcamen    := CreateCmDbField( 'IDPLANOORCAMEN',    ftfloat,    True,  True,  False, True, '' );
  FIdpessoa          := CreateCmDbField( 'IDPESSOA',          ftfloat,    False, False, False, True, '' );
  FIdpatro           := CreateCmDbField( 'IDPATRO',           ftfloat,    False, False, False, True, '' );
  FIdgrupoorcamen    := CreateCmDbField( 'IDGRUPOORCAMEN',    ftfloat,    False, False, False, True, '' );
  FIdempresa         := CreateCmDbField( 'IDEMPRESA',         ftfloat,    False, False, False, True, '' );
  FIddataview        := CreateCmDbField( 'IDDATAVIEW',        ftfloat,    False, False, False, True, '' );
  FIdcontaorcamen    := CreateCmDbField( 'IDCONTAORCAMEN',    ftString,   True,  True,  False, True, '' );
  FFormularealizado  := CreateCmDbField( 'FORMULAREALIZADO',  ftString,   False, False, False, True, '' );
  FFormulaorcado     := CreateCmDbField( 'FORMULAORCADO',     ftString,   False, False, False, True, '' );
  FFlgtransfsaldo    := CreateCmDbField( 'FLGTRANSFSALDO',    ftString,   False, False, False, True, '' );
  FFlgsinalconta     := CreateCmDbField( 'FLGSINALCONTA',     ftString,   False, False, False, True, '' );
  FFlginfdiames      := CreateCmDbField( 'FLGINFDIAMES',      ftString,   False, False, False, True, '' );
  FFlgcontamonetaria := CreateCmDbField( 'FLGCONTAMONETARIA', ftString,   False, False, False, True, '' );
  FFlgcalcreal       := CreateCmDbField( 'FLGCALCREAL',       ftString,   False, False, False, True, '' );
  FFlgcalcorcado     := CreateCmDbField( 'FLGCALCORCADO',     ftString,   False, False, False, True, '' );
  FFlgativa          := CreateCmDbField( 'FLGATIVA',          ftString,   False, False, False, True, '' );
  FFlgacumulado      := CreateCmDbField( 'FLGACUMULADO',      ftString,   False, False, False, True, '' );
  FDatainativa       := CreateCmDbField( 'DATAINATIVA',       ftDateTime, False, False, False, True, '' );
  FDataativa         := CreateCmDbField( 'DATAATIVA',         ftDateTime, False, False, False, True, '' );
  FCodcentrorespon   := CreateCmDbField( 'CODCENTRORESPON',   ftString,   False, False, False, True, '' );
  FCodcentrocusto    := CreateCmDbField( 'CODCENTROCUSTO',    ftString,   False, False, False, True, '' );
  FIdFormOrcado      := CreateCmDbField( 'IDFORMORCADO',      ftfloat,    False, False, False, True, '' );
  FFlgTransfOrigDif  := CreateCmDbField( 'FLGTRANSFORIGDIF',  ftString,   False, False, False, True, '' );
End;
//************************************************
Function TDbContasOrcamen.Insert: Boolean;
Begin
  Result := Inherited Insert;
End;
//************************************************
Function TDbContasOrcamen.LoadFromDB: Boolean;
Begin
  Result := Inherited LoadFromDB;
End;
//************************************************
Procedure TDbContasOrcamen.SetCodcentrocusto(const Value: TCmDbField);
Begin

  FCodcentrocusto := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetCodcentrorespon(const Value: TCmDbField);
Begin
  FCodcentrorespon := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetDataativa(const Value: TCmDbField);
Begin
  FDataativa := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetDatainativa(const Value: TCmDbField);
Begin
  FDatainativa := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFlgacumulado(const Value: TCmDbField);
Begin
  FFlgacumulado := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFlgativa(const Value: TCmDbField);
Begin
  FFlgativa := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFlgcalcorcado(const Value: TCmDbField);
Begin
  FFlgcalcorcado := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFlgcalcreal(const Value: TCmDbField);
Begin
  FFlgcalcreal := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFlgcontamonetaria(const Value: TCmDbField);
Begin
  FFlgcontamonetaria := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFlginfdiames(const Value: TCmDbField);
Begin
  FFlginfdiames := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFlgsinalconta(const Value: TCmDbField);
Begin
  FFlgsinalconta := Value;
End;
//************************************************
procedure TDbContasOrcamen.SetFlgTransfOrigDif(const Value: TCmDbField);
begin
  FFlgTransfOrigDif := Value;
end;

Procedure TDbContasOrcamen.SetFlgtransfsaldo(const Value: TCmDbField);
Begin
  FFlgtransfsaldo := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFormulaorcado(const Value: TCmDbField);
Begin
  FFormulaorcado := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetFormularealizado(const Value: TCmDbField);
Begin
  FFormularealizado := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetIdcontaorcamen(const Value: TCmDbField);
Begin
  FIdcontaorcamen := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetIddataview(const Value: TCmDbField);
Begin
  FIddataview := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetIdempresa(const Value: TCmDbField);
Begin
  FIdempresa := Value;
End;
//************************************************
procedure TDbContasOrcamen.SetIdFormOrcado(const Value: TCmDbField);
begin
  FIdFormOrcado := Value;
end;

Procedure TDbContasOrcamen.SetIdgrupoorcamen(const Value: TCmDbField);
Begin
  FIdgrupoorcamen := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetIdpatro(const Value: TCmDbField);
Begin
  FIdpatro := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetIdpessoa(const Value: TCmDbField);
Begin
  FIdpessoa := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetIdplanoorcamen(const Value: TCmDbField);
Begin
  FIdplanoorcamen := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetIdplanoprev(const Value: TCmDbField);
Begin
  FIdplanoprev := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetNomecontaorcamen(const Value: TCmDbField);
Begin
  FNomecontaorcamen := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetObservacao(const Value: TCmDbField);
Begin
  FObservacao := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetOrigemcmdv(const Value: TCmDbField);
Begin
  FOrigemcmdv := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetTipocalcorcado(const Value: TCmDbField);
Begin
  FTipocalcorcado := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetTipocalcrealizado(const Value: TCmDbField);
Begin
  FTipocalcrealizado := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetUnidnegoc(const Value: TCmDbField);
Begin
  FUnidnegoc := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetVlrinformadoorc(const Value: TCmDbField);
Begin
  FVlrinformadoorc := Value;
End;
//************************************************
Procedure TDbContasOrcamen.SetVlrinformadoreal(const Value: TCmDbField);
Begin
  FVlrinformadoreal := Value;
End;
//************************************************




end.
