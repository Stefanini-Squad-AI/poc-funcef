unit uDBDocISS;

interface

uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDBDocISS = class(TCmDbObject)

  private
    FVlrDesconto: TCmDbField;
    FVlrJuros: TCmDbField;
    FCodigoPgto: TCmDbField;
    FVlrISS: TCmDbField;
    FCodDocISS: TCmDbField;
    FVlrMulta: TCmDbField;
    FIDDocISS: TCmDbField;
    FCompetencia: TCmDbField;
    FDataVencto: TCmDbField;
    FNumLancMulta: TCmDbField;
    FNumLancDesconto: TCmDbField;
    FFlgImpresso: TCmDbField;
    FNumLancJuros: TCmDbField;
    FVlrTotal: TCmDbField;

    procedure SetCodDocISS(const Value: TCmDbField);
    procedure SetCodigoPgto(const Value: TCmDbField);
    procedure SetCompetencia(const Value: TCmDbField);
    procedure SetDataVencto(const Value: TCmDbField);
    procedure SetFlgImpresso(const Value: TCmDbField);
    procedure SetIDDocISS(const Value: TCmDbField);
    procedure SetNumLancDesconto(const Value: TCmDbField);
    procedure SetNumLancJuros(const Value: TCmDbField);
    procedure SetNumLancMulta(const Value: TCmDbField);
    procedure SetVlrDesconto(const Value: TCmDbField);
    procedure SetVlrISS(const Value: TCmDbField);
    procedure SetVlrJuros(const Value: TCmDbField);
    procedure SetVlrMulta(const Value: TCmDbField);
    procedure SetVlrTotal(const Value: TCmDbField);


  public

     property IDDocISS        : TCmDbField read FIDDocISS         write SetIDDocISS;
     property CodDocISS       : TCmDbField read FCodDocISS        write SetCodDocISS;

     property VlrTotal        : TCmDbField read FVlrTotal         write SetVlrTotal;
     property VlrMulta        : TCmDbField read FVlrMulta         write SetVlrMulta;
     property VlrJuros        : TCmDbField read FVlrJuros         write SetVlrJuros;
     property VlrISS          : TCmDbField read FVlrISS           write SetVlrISS;
     property VlrDesconto     : TCmDbField read FVlrDesconto      write SetVlrDesconto;
     property NumLancMulta    : TCmDbField read FNumLancMulta     write SetNumLancMulta;
     property NumLancJuros    : TCmDbField read FNumLancJuros     write SetNumLancJuros;
     property NumLancDesconto : TCmDbField read FNumLancDesconto  write SetNumLancDesconto;
     property FlgImpresso     : TCmDbField read FFlgImpresso      write SetFlgImpresso;
     property DataVencto      : TCmDbField read FDataVencto       write SetDataVencto;
     property Competencia     : TCmDbField read FCompetencia      write SetCompetencia;
     property CodigoPgto      : TCmDbField read FCodigoPgto       write SetCodigoPgto;

     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert: Boolean; override;

  end;



implementation
{ TDBDocISS }



constructor TDBDocISS.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'DOCISS';

  //                                                                 |Required |Key    |Readonly |NullIfZero
  //                                                      -------------------------------------------------------
  FIDDocISS         := CreateCmDbField('IDDOCISS',        ftFloat,    True,     True,   False,    True,   '');
  FCodDocISS        := CreateCmDbField('CODDOCISS',       ftFloat,    False,    False,  False,    True,   '');
  FVlrTotal         := CreateCmDbField('VLRTOTAL',        ftFloat,    False,    False,  False,    False,  '');
  FVlrMulta         := CreateCmDbField('VLRMULTA',        ftFloat,    False,    False,  False,    False,  '');
  FVlrJuros         := CreateCmDbField('VLRJUROS',        ftFloat,    False,    False,  False,    False,  '');
  FVlrISS           := CreateCmDbField('VLRISS',          ftFloat,    False,    False,  False,    False,  '');
  FVlrDesconto      := CreateCmDbField('VLRDESCONTO',     ftFloat,    False,    False,  False,    False,  '');
  FNumLancMulta     := CreateCmDbField('NUMLANCMULTA',    ftFloat,    False,    False,  False,    True,   '');
  FNumLancJuros     := CreateCmDbField('NUMLANCJUROS',    ftFloat,    False,    False,  False,    True,   '');
  FNumLancDesconto  := CreateCmDbField('NUMLANCDESCONTO', ftFloat,    False,    False,  False,    True,   '');
  FFlgImpresso      := CreateCmDbField('FLGIMPRESSO',     ftString,   False,    False,  False,    True,   '');
  FDataVencto       := CreateCmDbField('DATAVENCTO',      ftDateTime, False,    False,  False,    True,   '');
  FCompetencia      := CreateCmDbField('COMPETENCIA',     ftString,   False,    False,  False,    True,   '');
  FCodigoPgto       := CreateCmDbField('CODIGOPGTO',      ftString,   False,    False,  False,    True,   '');
end;



function TDBDocISS.Insert: Boolean;
begin
  FIDDocISS.AsFloat  := GetSequence('DOCISS');
  Result              := inherited Insert;
end;

// -------------------------------------------------------------------------------------------------

procedure TDBDocISS.SetCodDocISS(const Value: TCmDbField);
begin
  FCodDocISS := Value;
end;

procedure TDBDocISS.SetCodigoPgto(const Value: TCmDbField);
begin
  FCodigoPgto := Value;
end;

procedure TDBDocISS.SetCompetencia(const Value: TCmDbField);
begin
  FCompetencia := Value;
end;

procedure TDBDocISS.SetDataVencto(const Value: TCmDbField);
begin
  FDataVencto := Value;
end;

procedure TDBDocISS.SetFlgImpresso(const Value: TCmDbField);
begin
  FFlgImpresso := Value;
end;

procedure TDBDocISS.SetIDDocISS(const Value: TCmDbField);
begin
  FIDDocISS := Value;
end;

procedure TDBDocISS.SetNumLancDesconto(const Value: TCmDbField);
begin
  FNumLancDesconto := Value;
end;

procedure TDBDocISS.SetNumLancJuros(const Value: TCmDbField);
begin
  FNumLancJuros := Value;
end;

procedure TDBDocISS.SetNumLancMulta(const Value: TCmDbField);
begin
  FNumLancMulta := Value;
end;

procedure TDBDocISS.SetVlrDesconto(const Value: TCmDbField);
begin
  FVlrDesconto := Value;
end;

procedure TDBDocISS.SetVlrISS(const Value: TCmDbField);
begin
  FVlrISS := Value;
end;

procedure TDBDocISS.SetVlrJuros(const Value: TCmDbField);
begin
  FVlrJuros := Value;
end;

procedure TDBDocISS.SetVlrMulta(const Value: TCmDbField);
begin
  FVlrMulta := Value;
end;

procedure TDBDocISS.SetVlrTotal(const Value: TCmDbField);
begin
  FVlrTotal := Value;
end;

// -------------------------------------------------------------------------------------------------

end.
