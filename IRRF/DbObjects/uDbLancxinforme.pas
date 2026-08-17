{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/02/2007                             }
{                                                       }
{*******************************************************}

unit uDBLancXInforme;

interface

uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDBLancXInforme = class(TCmDbObject)

  private
    FIDLancIRRF: TCmDbField;
    FIDInforme: TCmDbField;
    FFontePagadora: TCmDbField;
    FFlgTipoReg: TCmDbField;
    FPercLanc: TCmDbField;
    FVlrLanc: TCmDbField;

    procedure SetFlgTipoReg(const Value: TCmDbField);
    procedure SetFontePagadora(const Value: TCmDbField);
    procedure SetIDInforme(const Value: TCmDbField);
    procedure SetIDLancIRRF(const Value: TCmDbField);
    procedure SetPercLanc(const Value: TCmDbField);
    procedure SetVlrLanc(const Value: TCmDbField);

  public

    property IDLancIRRF: TCmDbField read FIDLancIRRF write SetIDLancIRRF;
    property IDInforme: TCmDbField read FIDInforme write SetIDInforme;

    property VlrLanc: TCmDbField read FVlrLanc write SetVlrLanc;
    property PercLanc: TCmDbField read FPercLanc write SetPercLanc;
    property FontePagadora: TCmDbField read FFontePagadora write SetFontePagadora;
    property FlgTipoReg: TCmDbField read FFlgTipoReg write SetFlgTipoReg;

    constructor Create(Aowner: TCmCustomCdbObject); override;

    function Insert: Boolean; override;

  end;



implementation
{ TDBLancXInforme }



constructor TDBLancXInforme.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'LANCXINFORME';


  //                                                             |Required |Key    |Readonly |NullIfZero
  //                                                    -------------------------------------------------
  FIDLancIRRF       := CreateCmDbField('IDLANCIRRF',    ftFloat,  True,     True,   False,    True,   '');
  FIDInforme        := CreateCmDbField('IDINFORME',     ftFloat,  True,     True,   False,    True,   '');

  FVlrLanc          := CreateCmDbField('VLRLANC',       ftFloat,  False,    False,  False,    True,   '');
  FPercLanc         := CreateCmDbField('PERCLANC',      ftFloat,  False,    False,  False,    True,   '');
  FFontePagadora    := CreateCmDbField('FONTEPAGADORA', ftFloat,  False,    False,  False,    True,   '');
  FFlgTipoReg       := CreateCmDbField('FLGTIPOREG',    ftString, False,    False,  False,    True,   '');
end;



function TDBLancXInforme.Insert: Boolean;
begin
  Result := inherited Insert;
end;

// -------------------------------------------------------------------------------------------------

procedure TDBLancXInforme.SetFlgTipoReg(const Value: TCmDbField);
begin
  FFlgTipoReg := Value;
end;

procedure TDBLancXInforme.SetFontePagadora(const Value: TCmDbField);
begin
  FFontePagadora := Value;
end;

procedure TDBLancXInforme.SetIDInforme(const Value: TCmDbField);
begin
  FIDInforme := Value;
end;

procedure TDBLancXInforme.SetIDLancIRRF(const Value: TCmDbField);
begin
  FIDLancIRRF := Value;
end;

procedure TDBLancXInforme.SetPercLanc(const Value: TCmDbField);
begin
  FPercLanc := Value;
end;

procedure TDBLancXInforme.SetVlrLanc(const Value: TCmDbField);
begin
  FVlrLanc := Value;
end;

// -------------------------------------------------------------------------------------------------

end.
