unit uDBDocINSS;

interface

uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDBDocINSS = class(TCmDbObject)

  private
    FVlrDesconto: TCmDbField;
    FVlrJuros: TCmDbField;
    FCodigoPgto: TCmDbField;
    FVlrINSS: TCmDbField;
    FCodDocINSS: TCmDbField;
    FVlrMulta: TCmDbField;
    FIDDocINSS: TCmDbField;
    FCodDocumento: TCmDbField;
    FCompetencia: TCmDbField;
    FDataVencto: TCmDbField;
    FNumLancMulta: TCmDbField;
    FNumLancDesconto: TCmDbField;
    FFlgImpresso: TCmDbField;
    FNumLancJuros: TCmDbField;
    FVlrTotal: TCmDbField;
    FIDBenefINSS: TCmDbField;

    procedure SetCodDocINSS(const Value: TCmDbField);
    procedure SetCodDocumento(const Value: TCmDbField);
    procedure SetCodigoPgto(const Value: TCmDbField);
    procedure SetCompetencia(const Value: TCmDbField);
    procedure SetDataVencto(const Value: TCmDbField);
    procedure SetFlgImpresso(const Value: TCmDbField);
    procedure SetIDDocINSS(const Value: TCmDbField);
    procedure SetNumLancDesconto(const Value: TCmDbField);
    procedure SetNumLancJuros(const Value: TCmDbField);
    procedure SetNumLancMulta(const Value: TCmDbField);
    procedure SetVlrDesconto(const Value: TCmDbField);
    procedure SetVlrINSS(const Value: TCmDbField);
    procedure SetVlrJuros(const Value: TCmDbField);
    procedure SetVlrMulta(const Value: TCmDbField);
    procedure SetVlrTotal(const Value: TCmDbField);
    procedure SetIDBenefINSS(const Value: TCmDbField);


  public

     property IDDocINSS       : TCmDbField read FIDDocINSS        write SetIDDocINSS;
     property CodDocINSS      : TCmDbField read FCodDocINSS       write SetCodDocINSS;

     property VlrTotal        : TCmDbField read FVlrTotal         write SetVlrTotal;
     property VlrMulta        : TCmDbField read FVlrMulta         write SetVlrMulta;
     property VlrJuros        : TCmDbField read FVlrJuros         write SetVlrJuros;
     property VlrINSS         : TCmDbField read FVlrINSS          write SetVlrINSS;
     property VlrDesconto     : TCmDbField read FVlrDesconto      write SetVlrDesconto;
     property NumLancMulta    : TCmDbField read FNumLancMulta     write SetNumLancMulta;
     property NumLancJuros    : TCmDbField read FNumLancJuros     write SetNumLancJuros;
     property NumLancDesconto : TCmDbField read FNumLancDesconto  write SetNumLancDesconto;
     property FlgImpresso     : TCmDbField read FFlgImpresso      write SetFlgImpresso;
     property DataVencto      : TCmDbField read FDataVencto       write SetDataVencto;
     property Competencia     : TCmDbField read FCompetencia      write SetCompetencia;
     property CodigoPgto      : TCmDbField read FCodigoPgto       write SetCodigoPgto;
     property CodDocumento    : TCmDbField read FCodDocumento     write SetCodDocumento;
     property IDBenefINSS     : TCmDbField read FIDBenefINSS      write SetIDBenefINSS;

     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert: Boolean; override;

  end;



implementation
{ TDBDocINSS }



constructor TDBDocINSS.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'DOCINSS';

  //                                                                 |Required |Key    |Readonly |NullIfZero
  //                                                      -------------------------------------------------------
  FIDDocINSS        := CreateCmDbField('IDDOCINSS',       ftFloat,    True,     True,   False,    True,   '');
  FCodDocINSS       := CreateCmDbField('CODDOCINSS',      ftFloat,    False,    False,  False,    True,   '');
  FVlrTotal         := CreateCmDbField('VLRTOTAL',        ftFloat,    False,    False,  False,    False,  '');
  FVlrMulta         := CreateCmDbField('VLRMULTA',        ftFloat,    False,    False,  False,    False,  '');
  FVlrJuros         := CreateCmDbField('VLRJUROS',        ftFloat,    False,    False,  False,    False,  '');
  FVlrINSS          := CreateCmDbField('VLRINSS',         ftFloat,    False,    False,  False,    False,  '');
  FVlrDesconto      := CreateCmDbField('VLRDESCONTO',     ftFloat,    False,    False,  False,    False,  '');
  FNumLancMulta     := CreateCmDbField('NUMLANCMULTA',    ftFloat,    False,    False,  False,    True,   '');
  FNumLancJuros     := CreateCmDbField('NUMLANCJUROS',    ftFloat,    False,    False,  False,    True,   '');
  FNumLancDesconto  := CreateCmDbField('NUMLANCDESCONTO', ftFloat,    False,    False,  False,    True,   '');
  FFlgImpresso      := CreateCmDbField('FLGIMPRESSO',     ftString,   False,    False,  False,    True,   '');
  FDataVencto       := CreateCmDbField('DATAVENCTO',      ftDateTime, False,    False,  False,    True,   '');
  FCompetencia      := CreateCmDbField('COMPETENCIA',     ftString,   False,    False,  False,    True,   '');
  FCodigoPgto       := CreateCmDbField('CODIGOPGTO',      ftString,   False,    False,  False,    True,   '');
  FCodDocumento     := CreateCmDbField('CODDOCUMENTO',    ftFloat,    False,    False,  False,    True,   '');
  FIDBenefINSS      := CreateCmDbField('IDBENEFINSS',     ftFloat,    False,    False,  False,    True,   '');
end;



function TDBDocINSS.Insert: Boolean;
begin
  FIDDocINSS.AsFloat  := GetSequence('DOCINSS');
  Result              := inherited Insert;
end;

// -------------------------------------------------------------------------------------------------

procedure TDBDocINSS.SetCodDocINSS(const Value: TCmDbField);
begin
  FCodDocINSS := Value;
end;

procedure TDBDocINSS.SetCodDocumento(const Value: TCmDbField);
begin
  FCodDocumento := Value;
end;

procedure TDBDocINSS.SetCodigoPgto(const Value: TCmDbField);
begin
  FCodigoPgto := Value;
end;

procedure TDBDocINSS.SetCompetencia(const Value: TCmDbField);
begin
  FCompetencia := Value;
end;

procedure TDBDocINSS.SetDataVencto(const Value: TCmDbField);
begin
  FDataVencto := Value;
end;

procedure TDBDocINSS.SetFlgImpresso(const Value: TCmDbField);
begin
  FFlgImpresso := Value;
end;

procedure TDBDocINSS.SetIDBenefINSS(const Value: TCmDbField);
begin
  FIDBenefINSS := Value;
end;

procedure TDBDocINSS.SetIDDocINSS(const Value: TCmDbField);
begin
  FIDDocINSS := Value;
end;

procedure TDBDocINSS.SetNumLancDesconto(const Value: TCmDbField);
begin
  FNumLancDesconto := Value;
end;

procedure TDBDocINSS.SetNumLancJuros(const Value: TCmDbField);
begin
  FNumLancJuros := Value;
end;

procedure TDBDocINSS.SetNumLancMulta(const Value: TCmDbField);
begin
  FNumLancMulta := Value;
end;

procedure TDBDocINSS.SetVlrDesconto(const Value: TCmDbField);
begin
  FVlrDesconto := Value;
end;

procedure TDBDocINSS.SetVlrINSS(const Value: TCmDbField);
begin
  FVlrINSS := Value;
end;

procedure TDBDocINSS.SetVlrJuros(const Value: TCmDbField);
begin
  FVlrJuros := Value;
end;

procedure TDBDocINSS.SetVlrMulta(const Value: TCmDbField);
begin
  FVlrMulta := Value;
end;

procedure TDBDocINSS.SetVlrTotal(const Value: TCmDbField);
begin
  FVlrTotal := Value;
end;

// -------------------------------------------------------------------------------------------------

end.
