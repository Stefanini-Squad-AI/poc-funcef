{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sidnei de Brito Marins          }
{ Atualizado Em: 28/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbParamAssist;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamAssist = class(TCmDbObject)

  private
     FPlaRecupDespeXAnt: TCmDbField;
     FPlano: TCmDbField;
     FPlaRecuPreceXAnt: TCmDbField;
     FTpDocPEnvioBanco: TCmDbField;
     FTipoPerEnvio: TCmDbField;
     FTipoPerCobranca: TCmDbField;
     FTipoPerDiverg: TCmDbField;
     FTpDocPEnvioPatro: TCmDbField;
     FTpDocRRecPatro: TCmDbField;
     FTpDocRRecBanco: TCmDbField;
     FFlgPrePag: TCmDbField;

     Procedure SetPlaRecupDespeXAnt(const Value: TCmDbField);
     Procedure SetPlano(const Value: TCmDbField);
     Procedure SetPlaRecuPreceXAnt(const Value: TCmDbField);
     Procedure SetTpDocPEnvioBanco(const Value: TCmDbField);
     Procedure SetTipoPerEnvio(const Value: TCmDbField);
     Procedure SetTipoPerCobranca(const Value: TCmDbField);
     Procedure SetTipoPerDiverg(const Value: TCmDbField);
     Procedure SetTpDocPEnvioPatro(const Value: TCmDbField);
     Procedure SetTpDocRRecPatro(const Value: TCmDbField);
     Procedure SetTpDocRRecBanco(const Value: TCmDbField);
     Procedure SetFlgPrePag(const Value: TCmDbField);

  public
     Property PlaRecupDespeXAnt: TCmDbField read FPlaRecupDespeXAnt write SetPlaRecupDespeXAnt;
     Property Plano: TCmDbField read FPlano  write SetPlano;
     Property PlaRecuPreceXAnt: TCmDbField read FPlaRecuPreceXAnt write SetPlaRecuPreceXAnt;
     Property TpDocPEnvioBanco: TCmDbField read FTpDocPEnvioBanco write SetTpDocPEnvioBanco;
     Property TipoPerEnvio: TCmDbField read FTipoPerEnvio write SetTipoPerEnvio;
     Property TipoPerCobranca: TCmDbField read FTipoPerCobranca write SetTipoPerCobranca;
     Property TipoPerDiverg: TCmDbField read FTipoPerDiverg write SetTipoPerDiverg;
     Property TpDocPEnvioPatro: TCmDbField read FTpDocPEnvioPatro write SetTpDocPEnvioPatro;
     Property TpDocRRecPatro: TCmDbField read FTpDocRRecPatro write SetTpDocRRecPatro;
     Property TpDocRRecBanco: TCmDbField read FTpDocRRecBanco write SetTpDocRRecBanco;
     Property FlgPrePag: TCmDbField read FFlgPrePag write SetFlgPrePag;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbParamAssist }

constructor TDbParamAssist.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ParamAssist';

  FNome := CreateCmDbField('PlaRecupDespeXAnt',ftString,False,False);
  FPlano:= CreateCmDbField('Plano',ftFloat,False,False);
  FPlaRecuPreceXAnt:= CreateCmDbField('PlaRecuPreceXAnt',ftString,False,False);
  FTpDocPEnvioBanco:= CreateCmDbField('TpDocPEnvioBanco',ftFloat,False,False);
  FTipoPerEnvio:= CreateCmDbField('TipoPerEnvio',ftString,False,False);
  FTipoPerCobranca:= CreateCmDbField('TipoPerCobranca',ftString,False,False);
  FTipoPerDiverg:= CreateCmDbField('TipoPerDiverg',ftString,False,False);
  FTpDocPEnvioPatro:= CreateCmDbField('TpDocPEnvioPatro',ftFloat,False,False);
  FTpDocRRecPatro:= CreateCmDbField('TpDocRRecPatro',ftFloat,False,False);
  FTpDocRRecBanco:= CreateCmDbField('TpDocRRecBanco',ftFloat,False,False);
  FFlgPrePag:= CreateCmDbField('FlgPrePag',ftString,False,False);
end;

function TDbParamAssist.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbParamAssist.LoadFromDB: Boolean;
begin
  Result := True;
end;

procedure TDbParamAssist.SetPlaRecupDespeXAnt(const Value: TCmDbField);
begin
  FPlaRecupDespeXAnt:=Value;
end;

procedure TDbParamAssist.SetPlano(const Value: TCmDbField);
begin
  FPlano:=Value;
end;

procedure TDbParamAssist.SetPlaRecuPreceXAnt(const Value: TCmDbField);
begin
  FPlaRecuPreceXAnt:=Value;
end;

procedure TDbParamAssist.SetTpDocPEnvioBanco(const Value: TCmDbField);
begin
  FTpDocPEnvioBanco:=Value;
end;

procedure TDbParamAssist.SetTipoPerEnvio(const Value: TCmDbField);
begin
  FTipoPerEnvio :=Value;
end;

procedure TDbParamAssist.SetTipoPerCobranca(const Value: TCmDbField);
begin
  FTipoPerCobranca:=Value;
end;

procedure TDbParamAssist.SetTipoPerDiverg(const Value: TCmDbField);
begin
  FTipoPerDiverg:=Value;
end;

procedure TDbParamAssist.SetTpDocPEnvioPatro(const Value: TCmDbField);
begin
  FTpDocPEnvioPatro:=Value;
end;

procedure TDbParamAssist.SetTpDocRRecPatro(const Value: TCmDbField);
begin
  FTpDocRRecPatro:=Value;
end;

procedure TDbParamAssist.SetTpDocRRecBanco(const Value: TCmDbField);
begin
  FTpDocRRecBanco:=Value;
end;

procedure TDbParamAssist.SetFlgPrePag(const Value: TCmDbField);
begin
  FFlgPrePag:=Value;
end;

end.
