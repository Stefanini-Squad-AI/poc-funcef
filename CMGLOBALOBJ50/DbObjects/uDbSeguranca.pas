{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 25/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbSeguranca;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSeguranca = class(TCmDbObject)
  private
    FIdEmpresa: TCmDbField;
    FFlgrepetesenha: TCmDbField;
    FFlgsenhaletras: TCmDbField;
    FTempotrava: TCmDbField;
    FSenhasuper: TCmDbField;
    FFlgaltsenhasuper: TCmDbField;
    FFlgsenhanumeros: TCmDbField;
    FTamhistoricosenha: TCmDbField;
    FTamminsenha: TCmDbField;
    FFlgvalsenhanome: TCmDbField;
    FDiasTrocaSenha: TCmDbField;
    procedure SetIdEmpresa(const Value: TCmDbField);
    procedure SetFlgaltsenhasuper(const Value: TCmDbField);
    procedure SetFlgrepetesenha(const Value: TCmDbField);
    procedure SetFlgsenhaletras(const Value: TCmDbField);
    procedure SetFlgsenhanumeros(const Value: TCmDbField);
    procedure SetFlgvalsenhanome(const Value: TCmDbField);
    procedure SetSenhasuper(const Value: TCmDbField);
    procedure SetTamhistoricosenha(const Value: TCmDbField);
    procedure SetTamminsenha(const Value: TCmDbField);
    procedure SetTempotrava(const Value: TCmDbField);
    procedure SetDiasTrocaSenha(const Value: TCmDbField);

  public
    Property IdEmpresa: TCmDbField read FIdEmpresa write SetIdEmpresa;
    Property Tempotrava: TCmDbField read FTempotrava write SetTempotrava;
    Property Tamminsenha: TCmDbField read FTamminsenha write SetTamminsenha;
    Property Tamhistoricosenha: TCmDbField read FTamhistoricosenha write SetTamhistoricosenha;
    Property Senhasuper: TCmDbField read FSenhasuper write SetSenhasuper;
    Property Flgvalsenhanome: TCmDbField read FFlgvalsenhanome write SetFlgvalsenhanome;
    Property Flgsenhanumeros: TCmDbField read FFlgsenhanumeros write SetFlgsenhanumeros;
    Property Flgsenhaletras: TCmDbField read FFlgsenhaletras write SetFlgsenhaletras;
    Property Flgrepetesenha: TCmDbField read FFlgrepetesenha write SetFlgrepetesenha;
    Property Flgaltsenhasuper: TCmDbField read FFlgaltsenhasuper write SetFlgaltsenhasuper;
    Property DiasTrocaSenha: TCmDbField read FDiasTrocaSenha write SetDiasTrocaSenha;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSeguranca }

constructor TDbSeguranca.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGURANCA';

  fIdEmpresa         := CreateCmDbField('IDEMPRESA',ftFloat,True,True,False,True,'Identificador');
  fFlgsenhaletras    := CreateCmDbField('FLGSENHALETRAS',ftString,False,False,False,True,'Senha Deve possuir Letras');
  fFlgsenhanumeros   := CreateCmDbField('FLGSENHANUMEROS',ftString,False,False,False,True,'Senha Deve possuir Numeros');
  fTempotrava        := CreateCmDbField('TEMPOTRAVA',ftfloat,False,False,False,False,'Tempo para Travamento');
  fTamminsenha       := CreateCmDbField('TAMMINSENHA',ftfloat,False,False,False,True,'Tamanho Minimo da Senha');
  fTamhistoricosenha := CreateCmDbField('TAMHISTORICOSENHA',ftfloat,False,False,False,True,'Tamanho do Historico de Senha');
  fSenhasuper        := CreateCmDbField('SENHASUPER',ftString,False,False,False,True,'Senha do Usuário Super');
  fFlgvalsenhanome   := CreateCmDbField('FLGVALSENHANOME',ftString,False,False,False,True,'valida Senha contra o Nome');
  fFlgrepetesenha    := CreateCmDbField('FLGREPETESENHA',ftString,False,False,False,True,'Pode Repetir Senha');
  fFlgaltsenhasuper  := CreateCmDbField('FLGALTSENHASUPER',ftString,False,False,False,True,'Pode Alterar Senha Super');
  fDiasTrocaSenha    := CreateCmDbField('DIASTROCASENHA',ftFloat,False,False,False,False,'Prazo para alteração de senha');
end;

function TDbSeguranca.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbSeguranca.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbSeguranca.SetDiasTrocaSenha(const Value: TCmDbField);
begin
  FDiasTrocaSenha := Value;
end;

procedure TDbSeguranca.SetFlgaltsenhasuper(const Value: TCmDbField);
begin
  FFlgaltsenhasuper := Value;
end;

procedure TDbSeguranca.SetFlgrepetesenha(const Value: TCmDbField);
begin
  FFlgrepetesenha := Value;
end;

procedure TDbSeguranca.SetFlgsenhaletras(const Value: TCmDbField);
begin
  FFlgsenhaletras := Value;
end;

procedure TDbSeguranca.SetFlgsenhanumeros(const Value: TCmDbField);
begin
  FFlgsenhanumeros := Value;
end;

procedure TDbSeguranca.SetFlgvalsenhanome(const Value: TCmDbField);
begin
  FFlgvalsenhanome := Value;
end;

procedure TDbSeguranca.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

procedure TDbSeguranca.SetSenhasuper(const Value: TCmDbField);
begin
  FSenhasuper := Value;
end;

procedure TDbSeguranca.SetTamhistoricosenha(const Value: TCmDbField);
begin
  FTamhistoricosenha := Value;
end;

procedure TDbSeguranca.SetTamminsenha(const Value: TCmDbField);
begin
  FTamminsenha := Value;
end;

procedure TDbSeguranca.SetTempotrava(const Value: TCmDbField);
begin
  FTempotrava := Value;
end;

end.

