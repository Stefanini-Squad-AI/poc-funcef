{
--------------------------------------------------------------------------------
Pendência   : SIG 22246
Responsável : Darivaldo Alencar
Data        : 04/08/2016
Descrição   : Criação deste fonte: funcionalidade Coluna do Mapa de Folha
Rotina      :
--------------------------------------------------------------------------------
}
unit uDbColMapaFolha;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbColMapaFolha = class(TCmDbObject)

  private
    FIdColunaMapa    : TCmDbField;
    FDescricao      : TCmDbField;
    procedure SetIdColunaMapa(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);

  public
    Constructor Create(Aowner: TCmCustomCdbObject); Override;
    Function Insert :Boolean; Override;

  published
    Property iIdColunaMapa: TCmDbField read FIdColunaMapa write SetIdColunaMapa;
    Property sDescricao   : TCmDbField read FDescricao    write SetDescricao;
  End;

implementation


constructor TDbColMapaFolha.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  TableName      := 'COLUNAMAPA';
  FIdColunaMapa  := CreateCmDbField('IDCOLUNAMAPA',  ftfloat, True, True,  False, False, '');
  FDescricao     := CreateCmDbField('DESCRICAO'   , ftString, True, False, False, False, '');
end;

function TDbColMapaFolha.Insert: Boolean;
begin
  FIdColunaMapa.AsFloat := GetSequence('COLUNAMAPA');
  Result := Inherited Insert;
end;

procedure TDbColMapaFolha.SetDescricao(const Value: TCmDbField);
begin
  fDescricao := Value;
end;

procedure TDbColMapaFolha.SetIdColunaMapa(const Value: TCmDbField);
begin
 fIdColunaMapa:= value;
end;

end.

