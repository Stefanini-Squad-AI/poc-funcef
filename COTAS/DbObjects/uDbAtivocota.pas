unit uDbAtivocota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbAtivocota = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FIdinvestimento: TCmDbField;
    FIdimovel: TCmDbField;
    FIdfundoinvest: TCmDbField;
    FIdativocota: TCmDbField;
    FIdcarteiraspc: TCmDbField;
    FIdtipocontremptmo: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdativocota(const Value: TCmDbField);
    procedure SetIdcarteiraspc(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdtipocontremptmo(const Value: TCmDbField);
    procedure SetIdfundoinvest(const Value: TCmDbField);

  public

     Property Idfundoinvest: TCmDbField read FIdfundoinvest write SetIdfundoinvest;
     Property Idtipocontremptmo: TCmDbField read FIdtipocontremptmo write SetIdtipocontremptmo;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idcarteiraspc: TCmDbField read FIdcarteiraspc write SetIdcarteiraspc;
     Property Idativocota: TCmDbField read FIdativocota write SetIdativocota;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAtivocota }

constructor TDbAtivocota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ATIVOCOTA';

   fIdfundoinvest := CreateCmDbField('IDFUNDOINVEST',ftfloat,False,False,False,True,'');
   fIdtipocontremptmo := CreateCmDbField('IDTIPOCONTREMPTMO',ftfloat,False,False,False,True,'');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fIdcarteiraspc := CreateCmDbField('IDCARTEIRASPC',ftfloat,False,False,False,True,'');
   fIdativocota := CreateCmDbField('IDATIVOCOTA',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbAtivocota.Insert: Boolean;
begin

   fIdativocota.AsFloat := GetSequence('ATIVOCOTA');
   Result := Inherited Insert;

end;


procedure TDbAtivocota.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbAtivocota.SetIdativocota(const Value: TCmDbField);
begin
  FIdativocota := Value;
end;

procedure TDbAtivocota.SetIdcarteiraspc(const Value: TCmDbField);
begin
  FIdcarteiraspc := Value;
end;

procedure TDbAtivocota.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbAtivocota.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbAtivocota.SetIdtipocontremptmo(const Value: TCmDbField);
begin
  FIdtipocontremptmo := Value;
end;

procedure TDbAtivocota.SetIdfundoinvest(const Value: TCmDbField);
begin
  FIdfundoinvest := Value;
end;

end.




