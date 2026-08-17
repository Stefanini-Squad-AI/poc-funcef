unit uDbCotaCalculo;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCotaCalculo = class(TCmDbObject)

  private
    FIdcotamovim: TCmDbField;
    FIdcotacotacao: TCmDbField;
    procedure SetIdcotacotacao(const Value: TCmDbField);
    procedure SetIdcotamovim(const Value: TCmDbField);

  public

     Property Idcotamovim: TCmDbField read FIdcotamovim write SetIdcotamovim;
     Property Idcotacotacao: TCmDbField read FIdcotacotacao write SetIdcotacotacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCotaCalculo }

constructor TDbCotaCalculo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTACALCULO';

   fIdcotamovim := CreateCmDbField('IDCOTAMOVIM',ftfloat,True,True,False,True,'');
   fIdcotacotacao := CreateCmDbField('IDCOTACOTACAO',ftfloat,True,True,False,True,'');
end;

function TDbCotaCalculo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbCotaCalculo.SetIdcotacotacao(const Value: TCmDbField);
begin
  FIdcotacotacao := Value;
end;

procedure TDbCotaCalculo.SetIdcotamovim(const Value: TCmDbField);
begin
  FIdcotamovim := Value;
end;

end.



