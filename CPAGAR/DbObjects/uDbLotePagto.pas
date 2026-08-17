{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - uDbLotePagto                                                      }
{------------------------------------------------------------------------------}
// Data      : 19/08/2004 (término)
// Autor     : David Ayrolla
// Pendência : 17221
// Descrição : Incluído campo FLGRADLOTEDOC.
//------------------------------------------------------------------------------

Unit
  uDbLotePagto;

Interface

Uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLotePagto = class(TCmDbObject)

  Private
    FDatadiferido: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FDataemissao: TCmDbField;
    FNumslip: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdprocesso: TCmDbField;
    FLotetransmissao: TCmDbField;
    FCodlancfinanc: TCmDbField;
    FFlagemissao: TCmDbField;
    FNumlote: TCmDbField;
    FFavorecido: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlagcancel: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FNumchqbordero: TCmDbField;
    FCodportforma: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FObservacao: TCmDbField;
    FFlgradlotedoc: TCmDbField;
    Procedure SetCodlancfinanc( Const Value: TCmDbField );
    Procedure SetCodportforma( Const Value: TCmDbField );
    Procedure SetDatadiferido( Const Value: TCmDbField );
    Procedure SetDataemissao( Const Value: TCmDbField );
    Procedure SetFavorecido( Const Value: TCmDbField );
    Procedure SetFlagcancel( Const Value: TCmDbField );
    Procedure SetFlagemissao( Const Value: TCmDbField );
    Procedure SetIdpessoa( Const Value: TCmDbField );
    Procedure SetIdprocesso( Const Value: TCmDbField );
    Procedure SetIdusuarioinclusao( Const Value: TCmDbField );
    Procedure SetLotetransmissao( Const Value: TCmDbField );
    Procedure SetNumchqbordero( Const Value: TCmDbField );
    Procedure SetNumlote( Const Value: TCmDbField );
    Procedure SetNumslip( Const Value: TCmDbField );
    Procedure SetObservacao( Const Value: TCmDbField );
    Procedure SetPlncodigo( Const Value: TCmDbField );
    Procedure SetTrgdtinclusao( Const Value: TCmDbField );
    Procedure SetTrguserinclusao( Const Value: TCmDbField );
    procedure SetFlgradlotedoc(const Value: TCmDbField);

  Public

    Property Trguserinclusao   : TCmDbField Read FTrguserinclusao   Write SetTrguserinclusao;
    Property Trgdtinclusao     : TCmDbField Read FTrgdtinclusao     Write SetTrgdtinclusao;
    Property Plncodigo         : TCmDbField Read FPlncodigo         Write SetPlncodigo;
    Property Observacao        : TCmDbField Read FObservacao        Write SetObservacao;
    Property Numslip           : TCmDbField Read FNumslip           Write SetNumslip;
    Property Numlote           : TCmDbField Read FNumlote           Write SetNumlote;
    Property Numchqbordero     : TCmDbField Read FNumchqbordero     Write SetNumchqbordero;
    Property Lotetransmissao   : TCmDbField Read FLotetransmissao   Write SetLotetransmissao;
    Property Idusuarioinclusao : TCmDbField Read FIdusuarioinclusao Write SetIdusuarioinclusao;
    Property Idprocesso        : TCmDbField Read FIdprocesso        Write SetIdprocesso;
    Property Idpessoa          : TCmDbField Read FIdpessoa          Write SetIdpessoa;
    Property Flagemissao       : TCmDbField Read FFlagemissao       Write SetFlagemissao;
    Property Flagcancel        : TCmDbField Read FFlagcancel        Write SetFlagcancel;
    Property Favorecido        : TCmDbField Read FFavorecido        Write SetFavorecido;
    Property Dataemissao       : TCmDbField Read FDataemissao       Write SetDataemissao;
    Property Datadiferido      : TCmDbField Read FDatadiferido      Write SetDatadiferido;
    Property Codportforma      : TCmDbField Read FCodportforma      Write SetCodportforma;
    Property Codlancfinanc     : TCmDbField Read FCodlancfinanc     Write SetCodlancfinanc;

    //DAVID - Pendência 17221
    Property Flgradlotedoc     : TCmDbField read FFlgradlotedoc     write SetFlgradlotedoc;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

Implementation

{ TDbLotePagto }

Constructor TDbLotePagto.Create(Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOTEPAGTO';

   fTrguserinclusao   := CreateCmDbField( 'TRGUSERINCLUSAO',   ftString,   False, False, False, True, '' );
   fTrgdtinclusao     := CreateCmDbField( 'TRGDTINCLUSAO',     ftDateTime, False, False, False, True, '' );
   fPlncodigo         := CreateCmDbField( 'PLNCODIGO',         ftfloat,    False, False, False, True, '' );
   fObservacao        := CreateCmDbField( 'OBSERVACAO',        ftString,   False, False, False, True, '' );
   fNumslip           := CreateCmDbField( 'NUMSLIP',           ftString,   False, False, False, True, '' );
   fNumlote           := CreateCmDbField( 'NUMLOTE',           ftfloat,    True,  True,  False, True, '' );
   fNumchqbordero     := CreateCmDbField( 'NUMCHQBORDERO',     ftString,   False, False, False, True, '' );
   fLotetransmissao   := CreateCmDbField( 'LOTETRANSMISSAO',   ftfloat,    False, False, False, True, '' );
   fIdusuarioinclusao := CreateCmDbField( 'IDUSUARIOINCLUSAO', ftfloat,    False, False, False, True, '' );
   fIdprocesso        := CreateCmDbField( 'IDPROCESSO',        ftfloat,    False, False, False, True, '' );
   fIdpessoa          := CreateCmDbField( 'IDPESSOA',          ftfloat,    False, False, False, True, '' );
   fFlagemissao       := CreateCmDbField( 'FLAGEMISSAO',       ftString,   False, False, False, True, '' );
   fFlagcancel        := CreateCmDbField( 'FLAGCANCEL',        ftString,   False, False, False, True, '' );
   fFavorecido        := CreateCmDbField( 'FAVORECIDO',        ftString,   False, False, False, True, '' );
   fDataemissao       := CreateCmDbField( 'DATAEMISSAO',       ftDateTime, False, False, False, True, '' );
   fDatadiferido      := CreateCmDbField( 'DATADIFERIDO',      ftDateTime, False, False, False, True, '' );
   fCodportforma      := CreateCmDbField( 'CODPORTFORMA',      ftfloat,    False, False, False, True, '' );
   fCodlancfinanc     := CreateCmDbField( 'CODLANCFINANC',     ftfloat,    False, False, False, True, '' );

   //DAVID - Pendências 17221
   fFlgradlotedoc := CreateCmDbField('FLGRADLOTEDOC',ftstring,False,False,False,True,'');
End;

Function TDbLotePagto.Insert: Boolean;
Begin
   Result := Inherited Insert;
End;

Procedure TDbLotePagto.SetCodlancfinanc( Const Value: TCmDbField );
Begin
  FCodlancfinanc := Value;
End;

Procedure TDbLotePagto.SetCodportforma( Const Value: TCmDbField );
Begin
  FCodportforma := Value;
End;

Procedure TDbLotePagto.SetDatadiferido( Const Value: TCmDbField );
Begin
  FDatadiferido := Value;
End;

Procedure TDbLotePagto.SetDataemissao( Const Value: TCmDbField );
Begin
  FDataemissao := Value;
End;

Procedure TDbLotePagto.SetFavorecido( Const Value: TCmDbField );
Begin
  FFavorecido := Value;
End;

Procedure TDbLotePagto.SetFlagcancel( Const Value: TCmDbField );
Begin
  FFlagcancel := Value;
End;

Procedure TDbLotePagto.SetFlagemissao( Const Value: TCmDbField );
Begin
  FFlagemissao := Value;
End;

procedure TDbLotePagto.SetFlgradlotedoc(const Value: TCmDbField);
begin
  FFlgradlotedoc := Value;
end;

Procedure TDbLotePagto.SetIdpessoa( Const Value: TCmDbField );
Begin
  FIdpessoa := Value;
End;

Procedure TDbLotePagto.SetIdprocesso( Const Value: TCmDbField );
Begin
  FIdprocesso := Value;
End;

Procedure TDbLotePagto.SetIdusuarioinclusao( Const Value: TCmDbField );
Begin
  FIdusuarioinclusao := Value;
End;

Procedure TDbLotePagto.SetLotetransmissao( Const Value: TCmDbField );
Begin
  FLotetransmissao := Value;
End;

Procedure TDbLotePagto.SetNumchqbordero( Const Value: TCmDbField );
Begin
  FNumchqbordero := Value;
End;

Procedure TDbLotePagto.SetNumlote( Const Value: TCmDbField );
Begin
  FNumlote := Value;
End;

Procedure TDbLotePagto.SetNumslip( Const Value: TCmDbField );
Begin
  FNumslip := Value;
End;

Procedure TDbLotePagto.SetObservacao( Const Value: TCmDbField );
Begin
  FObservacao := Value;
End;

Procedure TDbLotePagto.SetPlncodigo( Const Value: TCmDbField );
Begin
  FPlncodigo := Value;
End;

Procedure TDbLotePagto.SetTrgdtinclusao( Const Value: TCmDbField );
Begin
  FTrgdtinclusao := Value;
End;

Procedure TDbLotePagto.SetTrguserinclusao( Const Value: TCmDbField );
Begin
  FTrguserinclusao := Value;
End;

End.
