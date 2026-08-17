{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 29/04/2002                             }
{                                                       }
{*******************************************************}
unit uDbCompContasOrcamen;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCompContasOrcamen = class(TCmDbObject)

  private

    fVlrcondres       : TCmDbField;
    fVlrcondini       : TCmDbField;
    fUnidnegoc        : TCmDbField;
    fTipocondres      : TCmDbField;
    fTipocondini      : TCmDbField;
    fRecpag           : TCmDbField;
    fPlano            : TCmDbField;
    fPlaconta         : TCmDbField;
    fPerccontarefrea  : TCmDbField;
    fPerccontareforc  : TCmDbField;
    fIdplanoprev      : TCmDbField;
    fIdplanoorcamen   : TCmDbField;
    fIdpessoa         : TCmDbField;
    fIdpatro          : TCmDbField;
    fIdempresa        : TCmDbField;
    fIdcontarefreal   : TCmDbField;
    fIdcontareforcado : TCmDbField;
    fIdcontaorcamen   : TCmDbField;
    fIdcontacondres   : TCmDbField;
    fIdcontacondini   : TCmDbField;
    fIdcontacondfim   : TCmDbField;
    fIdcompcontasorc  : TCmDbField;
    fCondicao         : TCmDbField;
    fCodtiprecdes     : TCmDbField;
    fCodtipdoc        : TCmDbField;
    fCodcentrorespon  : TCmDbField;
    fCodcentrocusto   : TCmDbField;
    fIdGrupoCondFim   : TCmDbField;
    fIdGrupoCondIni   : TCmDbField;
    fIdGrupoCondRes   : TCmDbField;

    Procedure SetVlrcondres( const Value : TCmDbField );
    Procedure SetVlrcondini( const Value : TCmDbField );
    Procedure SetUnidnegoc( const Value : TCmDbField );
    Procedure SetTipocondres( const Value : TCmDbField );
    Procedure SetTipocondini( const Value : TCmDbField );
    Procedure SetRecpag( const Value : TCmDbField );
    Procedure SetPlano( const Value : TCmDbField );
    Procedure SetPlaconta( const Value : TCmDbField );
    Procedure SetPerccontarefrea( const Value : TCmDbField );
    Procedure SetPerccontareforc( const Value : TCmDbField );
    Procedure SetIdplanoprev( const Value : TCmDbField );
    Procedure SetIdplanoorcamen( const Value : TCmDbField );
    Procedure SetIdpessoa( const Value : TCmDbField );
    Procedure SetIdpatro( const Value : TCmDbField );
    Procedure SetIdempresa( const Value : TCmDbField );
    Procedure SetIdcontarefreal( const Value : TCmDbField );
    Procedure SetIdcontareforcado( const Value : TCmDbField );
    Procedure SetIdcontaorcamen( const Value : TCmDbField );
    Procedure SetIdcontacondres( const Value : TCmDbField );
    Procedure SetIdcontacondini( const Value : TCmDbField );
    Procedure SetIdcontacondfim( const Value : TCmDbField );
    Procedure SetIdcompcontasorc( const Value : TCmDbField );
    Procedure SetCondicao( const Value : TCmDbField );
    Procedure SetCodtiprecdes( const Value : TCmDbField );
    Procedure SetCodtipdoc( const Value : TCmDbField );
    Procedure SetCodcentrorespon( const Value : TCmDbField );
    Procedure SetCodcentrocusto( const Value : TCmDbField );
    procedure SetIdGrupoCondFim(const Value: TCmDbField);
    procedure SetIdGrupoCondIni(const Value: TCmDbField);
    procedure SetIdGrupoCondRes(const Value: TCmDbField);

  Public

    Constructor Create( Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;

    Property Vlrcondres       : TCmDbField Read fVlrcondres       Write SetVlrcondres;
    Property Vlrcondini       : TCmDbField Read fVlrcondini       Write SetVlrcondini;
    Property Unidnegoc        : TCmDbField Read fUnidnegoc        Write SetUnidnegoc;
    Property Tipocondres      : TCmDbField Read fTipocondres      Write SetTipocondres;
    Property Tipocondini      : TCmDbField Read fTipocondini      Write SetTipocondini;
    Property Recpag           : TCmDbField Read fRecpag           Write SetRecpag;
    Property Plano            : TCmDbField Read fPlano            Write SetPlano;
    Property Placonta         : TCmDbField Read fPlaconta         Write SetPlaconta;
    Property Perccontarefrea  : TCmDbField Read fPerccontarefrea  Write SetPerccontarefrea;
    Property Perccontareforc  : TCmDbField Read fPerccontareforc  Write SetPerccontareforc;
    Property Idplanoprev      : TCmDbField Read fIdplanoprev      Write SetIdplanoprev;
    Property Idplanoorcamen   : TCmDbField Read fIdplanoorcamen   Write SetIdplanoorcamen;
    Property Idpessoa         : TCmDbField Read fIdpessoa         Write SetIdpessoa;
    Property Idpatro          : TCmDbField Read fIdpatro          Write SetIdpatro;
    Property Idempresa        : TCmDbField Read fIdempresa        Write SetIdempresa;
    Property Idcontarefreal   : TCmDbField Read fIdcontarefreal   Write SetIdcontarefreal;
    Property Idcontareforcado : TCmDbField Read fIdcontareforcado Write SetIdcontareforcado;
    Property Idcontaorcamen   : TCmDbField Read fIdcontaorcamen   Write SetIdcontaorcamen;
    Property Idcontacondres   : TCmDbField Read fIdcontacondres   Write SetIdcontacondres;
    Property Idcontacondini   : TCmDbField Read fIdcontacondini   Write SetIdcontacondini;
    Property Idcontacondfim   : TCmDbField Read fIdcontacondfim   Write SetIdcontacondfim;
    Property Idcompcontasorc  : TCmDbField Read fIdcompcontasorc  Write SetIdcompcontasorc;
    Property Condicao         : TCmDbField Read fCondicao         Write SetCondicao;
    Property Codtiprecdes     : TCmDbField Read fCodtiprecdes     Write SetCodtiprecdes;
    Property Codtipdoc        : TCmDbField Read fCodtipdoc        Write SetCodtipdoc;
    Property Codcentrorespon  : TCmDbField Read fCodcentrorespon  Write SetCodcentrorespon;
    Property Codcentrocusto   : TCmDbField Read fCodcentrocusto   Write SetCodcentrocusto;

    Property IdGrupoCondIni   : TCmDbField Read fIdGrupoCondIni   Write SetIdGrupoCondIni;
    Property IdGrupoCondFim   : TCmDbField Read fIdGrupoCondFim   Write SetIdGrupoCondFim;
    Property IdGrupoCondRes   : TCmDbField Read fIdGrupoCondRes   Write SetIdGrupoCondRes;


  End;

implementation

{ TDbCompContasOrcamen }
//************************************************
constructor TDbCompContasOrcamen.Create( Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COMPCONTASORCAMEN';

  fVlrcondres       := CreateCmDbField( 'VLRCONDRES',       ftfloat,  False, False, False, False, '' );
  fVlrcondini       := CreateCmDbField( 'VLRCONDINI',       ftfloat,  False, False, False, False, '' );
  fUnidnegoc        := CreateCmDbField( 'UNIDNEGOC',        ftfloat,  False, False, False, True,  '' );
  fTipocondres      := CreateCmDbField( 'TIPOCONDRES',      ftString, False, False, False, True,  '' );
  fTipocondini      := CreateCmDbField( 'TIPOCONDINI',      ftString, False, False, False, True,  '' );
  fRecpag           := CreateCmDbField( 'RECPAG',           ftString, False, False, False, True,  '' );
  fPlano            := CreateCmDbField( 'PLANO',            ftfloat,  False, False, False, True,  '' );
  fPlaconta         := CreateCmDbField( 'PLACONTA',         ftString, False, False, False, True,  '' );
  fPerccontarefrea  := CreateCmDbField( 'PERCCONTAREFREA',  ftfloat,  False, False, False, True,  '' );
  fPerccontareforc  := CreateCmDbField( 'PERCCONTAREFORC',  ftfloat,  False, False, False, True,  '' );
  fIdplanoprev      := CreateCmDbField( 'IDPLANOPREV',      ftfloat,  False, False, False, True,  '' );
  fIdplanoorcamen   := CreateCmDbField( 'IDPLANOORCAMEN',   ftfloat,  False, False, False, True,  '' );
  fIdpessoa         := CreateCmDbField( 'IDPESSOA',         ftfloat,  False, False, False, True,  '' );
  fIdpatro          := CreateCmDbField( 'IDPATRO',          ftfloat,  False, False, False, True,  '' );
  fIdempresa        := CreateCmDbField( 'IDEMPRESA',        ftfloat,  False, False, False, True,  '' );
  fIdcontarefreal   := CreateCmDbField( 'IDCONTAREFREAL',   ftString, False, False, False, True,  '' );
  fIdcontareforcado := CreateCmDbField( 'IDCONTAREFORCADO', ftString, False, False, False, True,  '' );
  fIdcontaorcamen   := CreateCmDbField( 'IDCONTAORCAMEN',   ftString, False, False, False, True,  '' );
  fIdcontacondres   := CreateCmDbField( 'IDCONTACONDRES',   ftString, False, False, False, True,  '' );
  fIdcontacondini   := CreateCmDbField( 'IDCONTACONDINI',   ftString, False, False, False, True,  '' );
  fIdcontacondfim   := CreateCmDbField( 'IDCONTACONDFIM',   ftString, False, False, False, True,  '' );
  fIdcompcontasorc  := CreateCmDbField( 'IDCOMPCONTASORC',  ftfloat,  True,  True,  False, True,  '' );
  fCondicao         := CreateCmDbField( 'CONDICAO',         ftString, False, False, False, False, '' );
  fCodtiprecdes     := CreateCmDbField( 'CODTIPRECDES',     ftString, False, False, False, True,  '' );
  fCodtipdoc        := CreateCmDbField( 'CODTIPDOC',        ftfloat,  False, False, False, True,  '' );
  fCodcentrorespon  := CreateCmDbField( 'CODCENTRORESPON',  ftString, False, False, False, True,  '' );
  fCodcentrocusto   := CreateCmDbField( 'CODCENTROCUSTO',   ftString, False, False, False, True,  '' );

  fIdGrupoCondIni   := CreateCmDbField( 'IDGRUPOCONDINI',   ftfloat, False, False, False, True,  '' );
  fIdGrupoCondFim   := CreateCmDbField( 'IDGRUPOCONDFIM',   ftfloat, False, False, False, True,  '' );
  fIdGrupoCondRes   := CreateCmDbField( 'IDGRUPOCONDRES',   ftfloat, False, False, False, True,  '' );
end;
//************************************************
Function TDbCompContasOrcamen.Insert: Boolean;
Begin

  If ( fIdcompcontasorc.AsFloat < 1 ) Then Begin

    fIdcompcontasorc.AsFloat := GetSequence('COMPCONTASORCAMEN');
  End;

  Result := Inherited Insert;
End;
//************************************************
function TDbCompContasOrcamen.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;
//************************************************
Procedure TDbCompContasOrcamen.SetCodcentrocusto(const Value: TCmDbField);
Begin

  FCodcentrocusto := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetCodcentrorespon(const Value: TCmDbField);
Begin

  FCodcentrorespon := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetCodtipdoc(const Value: TCmDbField);
Begin

  FCodtipdoc := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetCodtiprecdes(const Value: TCmDbField);
Begin

  FCodtiprecdes := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetCondicao(const Value: TCmDbField);
Begin

  FCondicao := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdcompcontasorc(const Value: TCmDbField);
Begin

  FIdcompcontasorc := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdcontacondfim(const Value: TCmDbField);
Begin

  FIdcontacondfim := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdcontacondini(const Value: TCmDbField);
Begin

  FIdcontacondini := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdcontacondres(const Value: TCmDbField);
Begin

  FIdcontacondres := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdcontaorcamen(const Value: TCmDbField);
Begin

  FIdcontaorcamen := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdcontareforcado(const Value: TCmDbField);
Begin

  FIdcontareforcado := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdcontarefreal(const Value: TCmDbField);
Begin

  FIdcontarefreal := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdempresa(const Value: TCmDbField);
Begin

  FIdempresa := Value;
End;
//************************************************
procedure TDbCompContasOrcamen.SetIdGrupoCondFim(const Value: TCmDbField);
begin
  fIdGrupoCondFim := Value;
end;

procedure TDbCompContasOrcamen.SetIdGrupoCondIni(const Value: TCmDbField);
begin
  fIdGrupoCondIni := Value;
end;

procedure TDbCompContasOrcamen.SetIdGrupoCondRes(const Value: TCmDbField);
begin
  fIdGrupoCondRes := Value;
end;

Procedure TDbCompContasOrcamen.SetIdpatro(const Value: TCmDbField);
Begin

  FIdpatro := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdpessoa(const Value: TCmDbField);
Begin

  FIdpessoa := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdplanoorcamen(const Value: TCmDbField);
Begin

  FIdplanoorcamen := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetIdplanoprev(const Value: TCmDbField);
Begin

  FIdplanoprev := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetPerccontareforc(const Value: TCmDbField);
Begin

  FPerccontareforc := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetPerccontarefrea(const Value: TCmDbField);
Begin

  FPerccontarefrea := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetPlaconta(const Value: TCmDbField);
Begin

  FPlaconta := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetPlano(const Value: TCmDbField);
Begin

  FPlano := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetRecpag(const Value: TCmDbField);
Begin

  FRecpag := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetTipocondini(const Value: TCmDbField);
Begin

  FTipocondini := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetTipocondres(const Value: TCmDbField);
Begin

  FTipocondres := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetUnidnegoc(const Value: TCmDbField);
Begin

  FUnidnegoc := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetVlrcondini(const Value: TCmDbField);
Begin

  FVlrcondini := Value;
End;
//************************************************
Procedure TDbCompContasOrcamen.SetVlrcondres(const Value: TCmDbField);
Begin

  FVlrcondres := Value;
End;
//************************************************
End.
