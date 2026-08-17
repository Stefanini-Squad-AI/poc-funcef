{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbIndicador;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbIndicador = class(TCmDbObject)

  private
    FFlgcontrato: TCmDbField;
    FDescricao: TCmDbField;
    FUnidade: TCmDbField;
    FTipodado: TCmDbField;
    FFlgsubgrpapuracao: TCmDbField;
    FTipovalor: TCmDbField;
    FFlggrpapuracao: TCmDbField;
    FIdindicador: TCmDbField;
    FTipoIndicador: TCmDbField;
    FPeriodicidade: TCmDbField;
    FNivelVerifica: TCMDbField;
    FIdRegra: TCMDbField;
    FQryRegra: TCMDbField;
    FIdGrpPadrao: TCMDbField;
    FIdSubGrpPadrao: TCMDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgcontrato(const Value: TCmDbField);
    procedure SetFlggrpapuracao(const Value: TCmDbField);
    procedure SetFlgsubgrpapuracao(const Value: TCmDbField);
    procedure SetIdindicador(const Value: TCmDbField);
    procedure SetTipodado(const Value: TCmDbField);
    procedure SetTipovalor(const Value: TCmDbField);
    procedure SetUnidade(const Value: TCmDbField);
    procedure SetTipoIndicador(const Value: TCmDbField);
    procedure SetPeriodicidade(const Value: TCmDbField);
    procedure SetNivelVerifica(const Value: TCMDbField);
    procedure SetIdRegra(const Value: TCMDbField);
    procedure SetQryRegra(const Value: TCMDbField);
    procedure SetIdGrpPadrao(const Value: TCMDbField);
    procedure SetIdSubGrpPadrao(const Value: TCMDbField);

  public

     Property Unidade: TCmDbField read FUnidade write SetUnidade;
     Property Tipovalor: TCmDbField read FTipovalor write SetTipovalor;
     Property Tipodado: TCmDbField read FTipodado write SetTipodado;
     Property Idindicador: TCmDbField read FIdindicador write SetIdindicador;
     Property Flgsubgrpapuracao: TCmDbField read FFlgsubgrpapuracao write SetFlgsubgrpapuracao;
     Property Flggrpapuracao: TCmDbField read FFlggrpapuracao write SetFlggrpapuracao;
     Property Flgcontrato: TCmDbField read FFlgcontrato write SetFlgcontrato;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property TipoIndicador: TCmDbField read FTipoIndicador write SetTipoIndicador;
     Property Periodicidade: TCmDbField read FPeriodicidade write SetPeriodicidade;
     Property NivelVerifica: TCMDbField read FNivelVerifica write SetNivelVerifica;
     Property IdRegra: TCMDbField read FIdRegra write SetIdRegra;
     Property QryRegra: TCMDbField read FQryRegra write SetQryRegra;
     Property IdGrpPadrao: TCMDbField read FIdGrpPadrao write SetIdGrpPadrao; // Marcio Motta - Pendência: 16307 - 18/03/2004
     Property IdSubGrpPadrao: TCMDbField read FIdSubGrpPadrao write SetIdSubGrpPadrao; // Marcio Motta - Pendência: 16307 - 18/03/2004

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbIndicador }

constructor TDbIndicador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDINDICADOR';

  fUnidade := CreateCmDbField('UNIDADE',ftString,False,False,False,True,'Unidade de Medida');
  fTipovalor := CreateCmDbField('TIPOVALOR',ftString,True,False,False,True,'Tipo de Valor');
  fTipodado := CreateCmDbField('TIPODADO',ftString,True,False,False,True,'Tipo de Dado');
  fIdindicador := CreateCmDbField('IDINDICADOR',ftfloat,True,True,False,True,'ID do Indicador');
  fFlgsubgrpapuracao := CreateCmDbField('FLGSUBGRPAPURACAO',ftString,False,False,False,True,'Obriga SubGrupo de Apuração');
  fFlggrpapuracao := CreateCmDbField('FLGGRPAPURACAO',ftString,False,False,False,True,'Obriga Grupo de Apuração');
  fFlgcontrato := CreateCmDbField('FLGCONTRATO',ftString,True,False,False,True,'Obriga Contrato');
  fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
  fTipoIndicador  := CreateCmDbField('TIPOINDICADOR',ftfloat,False,False,False,True,'Tipo de Indicador Fixo');
  fPeriodicidade  := CreateCmDbField('PERIODICIDADE',ftString,True,False,False,True,'Periodicidade de Apuração');
  fNivelVerifica  := CreateCmDbField('NIVELVERIFICA',ftfloat,False,False,False,False,'Nível de Verificação do Indicador');
  fIdRegra        := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'ID da Regra de Cálculo');
  fQryRegra       := CreateCmDbField('QRYREGRA',ftfloat,False,False,False,True,'Dados de Entrada da Regra de Cálculo');
  fIdGrpPadrao    := CreateCmDbField('IDGRPPADRAO',ftfloat,False,False,False,True,'ID do Grupo Padrão');
  fIdSubGrpPadrao := CreateCmDbField('IDSUBGRPPADRAO',ftfloat,False,False,False,True,'ID do SubGrupo Padrão');
end;

function TDbIndicador.Insert: Boolean;
begin

   fIdindicador.AsFloat := GetSequence('INDINDICADOR');
   Result := Inherited Insert;

end;

function TDbIndicador.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbIndicador.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbIndicador.SetFlgcontrato(const Value: TCmDbField);
begin
  FFlgcontrato := Value;
end;

procedure TDbIndicador.SetFlggrpapuracao(const Value: TCmDbField);
begin
  FFlggrpapuracao := Value;
end;

procedure TDbIndicador.SetFlgsubgrpapuracao(const Value: TCmDbField);
begin
  FFlgsubgrpapuracao := Value;
end;

procedure TDbIndicador.SetIdGrpPadrao(const Value: TCMDbField);
begin
  FIdGrpPadrao := Value;
end;

procedure TDbIndicador.SetIdindicador(const Value: TCmDbField);
begin
  FIdindicador := Value;
end;

procedure TDbIndicador.SetIdRegra(const Value: TCMDbField);
begin
  FIdRegra := Value;
end;

procedure TDbIndicador.SetIdSubGrpPadrao(const Value: TCMDbField);
begin
  FIdSubGrpPadrao := Value;
end;

procedure TDbIndicador.SetNivelVerifica(const Value: TCMDbField);
begin
  FNivelVerifica := Value;
end;

procedure TDbIndicador.SetPeriodicidade(const Value: TCmDbField);
begin
  FPeriodicidade := Value;
end;

procedure TDbIndicador.SetQryRegra(const Value: TCMDbField);
begin
  FQryRegra := Value;
end;

procedure TDbIndicador.SetTipodado(const Value: TCmDbField);
begin
  FTipodado := Value;
end;

procedure TDbIndicador.SetTipoIndicador(const Value: TCmDbField);
begin
  FTipoIndicador := Value;
end;

procedure TDbIndicador.SetTipovalor(const Value: TCmDbField);
begin
  FTipovalor := Value;
end;

procedure TDbIndicador.SetUnidade(const Value: TCmDbField);
begin
  FUnidade := Value;
end;

end.



