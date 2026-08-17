unit uDbPerfilcota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPerfilcota = class(TCmDbObject)

  private
    FIdperfilcota: TCmDbField;
    FTipoperfil: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdperfilcota(const Value: TCmDbField);
    procedure SetTipoperfil(const Value: TCmDbField);

  public

     Property Tipoperfil: TCmDbField read FTipoperfil write SetTipoperfil;
     Property Idperfilcota: TCmDbField read FIdperfilcota write SetIdperfilcota;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPerfilcota }

constructor TDbPerfilcota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PERFILCOTA';

   fTipoperfil := CreateCmDbField('TIPOPERFIL',ftString,False,False,False,True,'');
   fIdperfilcota := CreateCmDbField('IDPERFILCOTA',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbPerfilcota.Insert: Boolean;
begin

   fIdperfilcota.AsFloat := GetSequence('PERFILCOTA');
   Result := Inherited Insert;

end;


procedure TDbPerfilcota.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbPerfilcota.SetIdperfilcota(const Value: TCmDbField);
begin
  FIdperfilcota := Value;
end;

procedure TDbPerfilcota.SetTipoperfil(const Value: TCmDbField);
begin
  FTipoperfil := Value;
end;

end.



