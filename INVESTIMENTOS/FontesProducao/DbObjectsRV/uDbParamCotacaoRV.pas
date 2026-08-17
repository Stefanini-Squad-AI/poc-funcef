//******************************************************************************
// Rotina     : 
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************

unit uDbParamCotacaoRV;
 
interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamCotacaoRV = class(TCmDbObject)

  private
    FDatavigencia: TCmDbField;
    FIdparamcotacaorv: TCmDbField;
    FTipocotacao: TCmDbField;
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetIdparamcotacaorv(const Value: TCmDbField);
    procedure SetTipocotacao(const Value: TCmDbField);

  public

     Property Tipocotacao: TCmDbField read FTipocotacao write SetTipocotacao;
     Property Idparamcotacaorv: TCmDbField read FIdparamcotacaorv write SetIdparamcotacaorv;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamCotacaoRV }

constructor TDbParamCotacaoRV.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMCOTACAORV';

   fIdparamcotacaorv := CreateCmDbField('IDPARAMCOTACAORV',ftfloat,True,True,False,True,'Identificador');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,True,False,False,True,'Data de Vigência');
   fTipocotacao := CreateCmDbField('TIPOCOTACAO',ftString,False,False,False,True,'Tipo de Cotação');

end;

function TDbParamCotacaoRV.Insert: Boolean;
begin

   fIdparamcotacaorv.AsFloat := GetSequence('PARAMCOTACAORV');
   Result := Inherited Insert;

end;


procedure TDbParamCotacaoRV.SetDatavigencia(const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbParamCotacaoRV.SetIdparamcotacaorv(const Value: TCmDbField);
begin
  FIdparamcotacaorv := Value;
end;

procedure TDbParamCotacaoRV.SetTipocotacao(const Value: TCmDbField);
begin
  FTipocotacao := Value;
end;

end.



