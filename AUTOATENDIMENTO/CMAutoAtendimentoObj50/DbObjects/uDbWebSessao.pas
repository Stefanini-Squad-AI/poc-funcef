unit uDbWebSessao;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbWebSessao = class(TCmDbObject)

  private
    FLoginpessoal: TCmDbField;
    FDtultacesso: TCmDbField;
    FIdwebsessao: TCmDbField;
    FDtinicio: TCmDbField;
    FIdwebinterface: TCmDbField;
    procedure SetDtinicio(const Value: TCmDbField);
    procedure SetDtultacesso(const Value: TCmDbField);
    procedure SetIdwebsessao(const Value: TCmDbField);
    procedure SetLoginpessoal(const Value: TCmDbField);
    procedure SetIdwebinterface(const Value: TCmDbField);

  public

     Property Loginpessoal: TCmDbField read FLoginpessoal write SetLoginpessoal;
     Property Idwebsessao: TCmDbField read FIdwebsessao write SetIdwebsessao;
     Property Dtultacesso: TCmDbField read FDtultacesso write SetDtultacesso;
     Property Dtinicio: TCmDbField read FDtinicio write SetDtinicio;
     Property Idwebinterface: TCmDbField read FIdwebinterface write SetIdwebinterface;

     Constructor Create( AOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbWebSessao }

constructor TDbWebSessao.Create( AOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'WEBSESSAO';

  fIdwebsessao    := CreateCmDbField('IDWEBSESSAO',ftString,True,True,False,False,'Código da Sessão');
  fLoginpessoal   := CreateCmDbField('LOGINPESSOAL',ftString,True,False,False,False,'Login Pessoal');
  fDtultacesso    := CreateCmDbField('DTULTACESSO',ftDateTime,True,False,False,False,'Data/Hora do Último Acesso');
  fDtinicio       := CreateCmDbField('DTINICIO',ftDateTime,True,False,False,False,'Data/Hora de Início');
  FIdwebinterface := CreateCmDbField('IDWEBINTERFACE',ftInteger,True,False,False,False,'Id. Interface');
end;

function TDbWebSessao.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbWebSessao.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbWebSessao.SetDtinicio(const Value: TCmDbField);
begin
  FDtinicio := Value;
end;

procedure TDbWebSessao.SetDtultacesso(const Value: TCmDbField);
begin
  FDtultacesso := Value;
end;

procedure TDbWebSessao.SetIdwebinterface(const Value: TCmDbField);
begin
  FIdwebinterface := Value;
end;

procedure TDbWebSessao.SetIdwebsessao(const Value: TCmDbField);
begin
  FIdwebsessao := Value;
end;

procedure TDbWebSessao.SetLoginpessoal(const Value: TCmDbField);
begin
  FLoginpessoal := Value;
end;

end.
