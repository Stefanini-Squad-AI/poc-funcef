unit uDbAssuntoAgenda;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAssuntoAgenda = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdassuntoagenda: TCmDbField;
    FObservacao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdassuntoagenda(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);

  public

     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idassuntoagenda: TCmDbField read FIdassuntoagenda write SetIdassuntoagenda;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAssuntoAgenda }

constructor TDbAssuntoAgenda.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ASSUNTOAGENDA';

   fIdassuntoagenda := CreateCmDbField('IDASSUNTOAGENDA',ftfloat,True,True,False,True,'Id. Assunto');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observação');
end;

function TDbAssuntoAgenda.Insert: Boolean;
begin

   fIdassuntoagenda.AsFloat := GetSequence('ASSUNTOAGENDA');
   Result := Inherited Insert;

end;


procedure TDbAssuntoAgenda.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbAssuntoAgenda.SetIdassuntoagenda(const Value: TCmDbField);
begin
  FIdassuntoagenda := Value;
end;

procedure TDbAssuntoAgenda.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

end.



