{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}
{ --------------------------------------------------------------------------------------------------
Autor.........: Ricardo de Freitas Araújo Silva
Data..........: 18/08/2011
Nº SOL........: 159240
Nº KINTANA....: 1337878
Rotina........: PesquisaCriterio
Descrição.....: Implementação do Atividade de Projeto, Programa e  Tipo de Despesa no Critério de Rateio
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150140
Nº KINTANA..: 1087554
Data........: 12/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do Plano e Patro no Critério de Rateio
---------------------------------------------------------------------------------------------------}
{-----------------------------------------------------------------------------------------
Data      : 26.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Descrição : Adicionei o CmDbField 'EXERCICIOFIM'.
-----------------------------------------------------------------------------------------
Data      : 19.01.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Descrição : Adicionei o CmDbField 'PERIODOFIM'.
-----------------------------------------------------------------------------------------}



unit uDbValorCriRatOrc;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbValorcriratorc = class(TCmDbObject)

  private

    FVlrcriratorc     : TCmDbField;
    FPeriodo          : TCmDbField;
    FIdvalorcriratorc : TCmDbField;
    FIdpessoa         : TCmDbField;
    FIdempresa        : TCmDbField;
    FIdcriterioratorc : TCmDbField;
    FExercicio        : TCmDbField;
    FCodcentrocusto   : TCmDbField;
    FPeriodoFim       : TCmDbField;
    FExercicioFim     : TCmDbField;
    FIDPlanoPrev      : TCmDbField; // Alterado por FHBS - SOL: 150140 KTN: 1087554
    FIDPatro          : TCmDbField;
    FIDTIPO_DEPESAORCAMEN: TCmDbField;
    FIDPROGRAMAORCAMEN: TCmDbField;
    FUNIDNEGOC: TCmDbField; // Alterado por FHBS - SOL: 150140 KTN: 1087554

    Procedure SetVlrcriratorc( Const Value : TCmDbField );
    Procedure SetPeriodo( Const Value : TCmDbField );
    Procedure SetIdvalorcriratorc( Const Value : TCmDbField );
    Procedure SetIdpessoa( Const Value : TCmDbField );
    Procedure SetIdempresa( Const Value : TCmDbField );
    Procedure SetIdcriterioratorc( Const Value : TCmDbField );
    Procedure SetExercicio( Const Value : TCmDbField );
    Procedure SetCodcentrocusto( Const Value : TCmDbField );
    procedure SetPeriodoFim(const Value: TCmDbField);
    procedure SetExercicioFim(const Value: TCmDbField);
    procedure SetIDPlanoPrev(const Value: TCmDbField); // Alterado por FHBS - SOL: 150140 KTN: 1087554
    procedure SetIDPatro(const Value: TCmDbField);
    procedure SetIDPROGRAMAORCAMEN(const Value: TCmDbField);
    procedure SetIDTIPO_DEPESAORCAMEN(const Value: TCmDbField);
    procedure SetUNIDNEGOC(const Value: TCmDbField); // Alterado por FHBS - SOL: 150140 KTN: 1087554

  public

    Property Vlrcriratorc     : TCmDbField Read FVlrcriratorc     Write SetVlrcriratorc;
    Property Periodo          : TCmDbField Read FPeriodo          Write SetPeriodo;
    Property Idvalorcriratorc : TCmDbField Read FIdvalorcriratorc Write SetIdvalorcriratorc;
    Property Idpessoa         : TCmDbField Read FIdpessoa         Write SetIdpessoa;
    Property Idempresa        : TCmDbField Read FIdempresa        Write SetIdempresa;
    Property Idcriterioratorc : TCmDbField Read FIdcriterioratorc Write SetIdcriterioratorc;
    Property Exercicio        : TCmDbField Read FExercicio        Write SetExercicio;
    Property Codcentrocusto   : TCmDbField Read FCodcentrocusto   Write SetCodcentrocusto;
    property PeriodoFim       : TCmDbField read FPeriodoFim       write SetPeriodoFim;
    property ExercicioFim     : TCmDbField read FExercicioFim     write SetExercicioFim;
    property IDPlanoPrev      : TCmDbField read FIDPlanoPrev      write SetIDPlanoPrev; // Alterado por FHBS - SOL: 150140 KTN: 1087554
    property IDPatro          : TCmDbField read FIDPatro          write SetIDPatro; // Alterado por FHBS - SOL: 150140 KTN: 1087554

    property IDPROGRAMAORCAMEN     : TCmDbField read FIDPROGRAMAORCAMEN write SetIDPROGRAMAORCAMEN; //Alterado por Ricardo - SOL 159240 KTN 1337878
    property IDTIPO_DEPESAORCAMEN  : TCmDbField read FIDTIPO_DEPESAORCAMEN write SetIDTIPO_DEPESAORCAMEN; //Alterado por Ricardo - SOL 159240 KTN 1337878
    property UNIDNEGOC             : TCmDbField read FUNIDNEGOC write SetUNIDNEGOC; //Alterado por Ricardo - SOL 159240 KTN 1337878


    Constructor Create( Aowner: TCmCustomCdbObject) ; Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbValorcriratorc }
//************************************************
constructor TDbValorcriratorc.Create( Aowner: TCmCustomCdbObject) ;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'VALORCRIRATORC';

  fVlrcriratorc     := CreateCmDbField( 'VLRCRIRATORC',     ftfloat,  False, False, False, True, ''  );
  fPeriodo          := CreateCmDbField( 'PERIODO',          ftfloat,  False, False, False, True, ''  );
  fIdvalorcriratorc := CreateCmDbField( 'IDVALORCRIRATORC', ftfloat,  True,  True,  False, True, ''  );
  fIdpessoa         := CreateCmDbField( 'IDPESSOA',         ftfloat,  False, False, False, True, ''  );
  fIdempresa        := CreateCmDbField( 'IDEMPRESA',        ftfloat,  False, False, False, True, ''  );
  fIdcriterioratorc := CreateCmDbField( 'IDCRITERIORATORC', ftfloat,  False, False, False, True, ''  );
  fExercicio        := CreateCmDbField( 'EXERCICIO',        ftfloat,  False, False, False, True, ''  );
  fCodcentrocusto   := CreateCmDbField( 'CODCENTROCUSTO',   ftString, False, False, False, True, ''  );

  FPeriodoFim       := CreateCmDbField( 'PERIODOFIM',       ftInteger, False, False, False, True, '' );
  FExercicioFim     := CreateCmDbField( 'EXERCICIOFIM',     ftInteger, False, False, False, True, '' );

  FIDPlanoPrev      := CreateCmDbField( 'IDPlanoPrev',      ftFloat,   False, False, False, True, '' ); // Alterado por FHBS - SOL: 150140 KTN: 1087554
  FIDPatro          := CreateCmDbField( 'IDPatro',          ftFloat,   False, False, False, True, '' ); // Alterado por FHBS - SOL: 150140 KTN: 1087554

  FIDPROGRAMAORCAMEN      := CreateCmDbField( 'IDPROGRAMAORCAMEN',      ftFloat,   False, False, False, True, '' ); //Alterado por Ricardo - SOL 159240 KTN 1337878
  FIDTIPO_DEPESAORCAMEN   := CreateCmDbField( 'IDTIPO_DEPESAORCAMEN',   ftFloat,   False, False, False, True, '' ); //Alterado por Ricardo - SOL 159240 KTN 1337878
  FUNIDNEGOC              := CreateCmDbField( 'UNIDNEGOC',   ftFloat,   False, False, False, True, '' ); //Alterado por Ricardo - SOL 159240 KTN 1337878
end;
//************************************************
function TDbValorcriratorc.Insert: Boolean;
begin
   fIdvalorcriratorc.AsFloat := GetSequence( 'VALORCRIRATORC' );
   Result := Inherited Insert;
end;
//************************************************
function TDbValorcriratorc.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;
//************************************************
procedure TDbValorcriratorc.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetExercicio(const Value: TCmDbField);
begin
  FExercicio := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetExercicioFim(const Value: TCmDbField);
begin
  FExercicioFim := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdcriterioratorc(const Value: TCmDbField);
begin
  FIdcriterioratorc := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIdvalorcriratorc(const Value: TCmDbField);
begin
  FIdvalorcriratorc := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetPeriodo(const Value: TCmDbField);
begin
  FPeriodo := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetPeriodoFim(const Value: TCmDbField);
begin
  FPeriodoFim := Value;
end;

procedure TDbValorcriratorc.SetVlrcriratorc(const Value: TCmDbField);
begin
  FVlrcriratorc := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIDPlanoPrev(const Value: TCmDbField);
begin
  FIDPlanoPrev := Value;
end;
//************************************************
procedure TDbValorcriratorc.SetIDPatro(const Value: TCmDbField);
begin
  FIDPatro := Value;
end;
//************************************************

procedure TDbValorcriratorc.SetIDPROGRAMAORCAMEN(const Value: TCmDbField);
begin
  FIDPROGRAMAORCAMEN := Value;
end;

procedure TDbValorcriratorc.SetIDTIPO_DEPESAORCAMEN(
  const Value: TCmDbField);
begin
  FIDTIPO_DEPESAORCAMEN := Value;
end;

procedure TDbValorcriratorc.SetUNIDNEGOC(const Value: TCmDbField);
begin
  FUNIDNEGOC := Value;
end;

end.
