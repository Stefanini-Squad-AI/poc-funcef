unit uDbCotaPerfil;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCotaPerfil = class(TCmDbObject)

  private
    FIdcotaperfil: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdcotaperfil(const Value: TCmDbField);

  public

     Property Idcotaperfil: TCmDbField read FIdcotaperfil write SetIdcotaperfil;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCotaPerfil }

constructor TDbCotaPerfil.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTAPERFIL';

   fIdcotaperfil := CreateCmDbField('IDCOTAPERFIL',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição do Perfil');
end;

function TDbCotaPerfil.Insert: Boolean;
begin

   fIdcotaperfil.AsFloat := GetSequence('COTAPERFIL');
   Result := Inherited Insert;

end;


procedure TDbCotaPerfil.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCotaPerfil.SetIdcotaperfil(const Value: TCmDbField);
begin
  FIdcotaperfil := Value;
end;

end.



