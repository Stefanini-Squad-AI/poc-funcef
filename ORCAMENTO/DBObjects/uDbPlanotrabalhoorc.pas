{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbPlanotrabalhoorc;

interface
Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPlanotrabalhoorc = class(TCmDbObject)

  private
    FIdplanotrabalho: TCmDbField;
    FPeriodoini: TCmDbField;
    FPeriodofim: TCmDbField;
    FVlrcustototal: TCmDbField;
    FConseqnaoatend: TCmDbField;
    FUnidnegoc: TCmDbField;
    FObjetivo: TCmDbField;
    FIdpessoa: TCmDbField;
    FBenefesperado: TCmDbField;
    FVlrreceitatotal: TCmDbField;
    FNecessidade: TCmDbField;
    FExerciciofim: TCmDbField;
    FPrioridade: TCmDbField;
    FExercicioini: TCmDbField;
    FDescricao: TCmDbField;
    FCodCentroRespon: TCmDbField;
    procedure SetBenefesperado(const Value: TCmDbField);
    procedure SetConseqnaoatend(const Value: TCmDbField);
    procedure SetExerciciofim(const Value: TCmDbField);
    procedure SetExercicioini(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanotrabalho(const Value: TCmDbField);
    procedure SetNecessidade(const Value: TCmDbField);
    procedure SetObjetivo(const Value: TCmDbField);
    procedure SetPeriodofim(const Value: TCmDbField);
    procedure SetPeriodoini(const Value: TCmDbField);
    procedure SetPrioridade(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrcustototal(const Value: TCmDbField);
    procedure SetVlrreceitatotal(const Value: TCmDbField);
    procedure SetCodCentroRespon(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);

  public

     Property Vlrreceitatotal: TCmDbField read FVlrreceitatotal write SetVlrreceitatotal;
     Property Vlrcustototal: TCmDbField read FVlrcustototal write SetVlrcustototal;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Prioridade: TCmDbField read FPrioridade write SetPrioridade;
     Property Periodoini: TCmDbField read FPeriodoini write SetPeriodoini;
     Property Periodofim: TCmDbField read FPeriodofim write SetPeriodofim;
     Property Objetivo: TCmDbField read FObjetivo write SetObjetivo;
     Property Necessidade: TCmDbField read FNecessidade write SetNecessidade;
     Property Idplanotrabalho: TCmDbField read FIdplanotrabalho write SetIdplanotrabalho;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Exercicioini: TCmDbField read FExercicioini write SetExercicioini;
     Property Exerciciofim: TCmDbField read FExerciciofim write SetExerciciofim;
     Property Conseqnaoatend: TCmDbField read FConseqnaoatend write SetConseqnaoatend;
     Property Benefesperado: TCmDbField read FBenefesperado write SetBenefesperado;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property CodCentroRespon: TCmDbField read FCodCentroRespon write SetCodCentroRespon;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPlanotrabalhoorc }

constructor TDbPlanotrabalhoorc.Create( Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PLANOTRABALHOORC';

  fVlrreceitatotal := CreateCmDbField( 'VLRRECEITATOTAL', ftfloat,  False, False, False, True, 'Valor da Receita Total');
  fVlrcustototal   := CreateCmDbField( 'VLRCUSTOTOTAL',   ftfloat,  False, False, False, True, 'Valor do Custo Total');
  fUnidnegoc       := CreateCmDbField( 'UNIDNEGOC',       ftfloat,  True,  False, False, True, 'Atividade/Projeto');
  fPrioridade      := CreateCmDbField( 'PRIORIDADE',      ftString, False, False, False, True, 'Prioridade');
  fPeriodoini      := CreateCmDbField( 'PERIODOINI',      ftfloat,  True,  False, False, True, 'Período Inicial');
  fPeriodofim      := CreateCmDbField( 'PERIODOFIM',      ftfloat,  True,  False, False, True, 'Período Final');
  fObjetivo        := CreateCmDbField( 'OBJETIVO',        ftString, False, False, False, True, 'Objetivo');
  fNecessidade     := CreateCmDbField( 'NECESSIDADE',     ftString, False, False, False, True, 'Necessidade');
  fIdplanotrabalho := CreateCmDbField( 'IDPLANOTRABALHO', ftfloat,  True,  True,  False, True, 'Id do Plano de Trabalho');
  fIdpessoa        := CreateCmDbField( 'IDPESSOA',        ftfloat,  True,  False, False, True, 'Id da Empresa Proprietária');
  fExercicioini    := CreateCmDbField( 'EXERCICIOINI',    ftfloat,  True,  False, False, True, 'Exercício Inicial');
  fExerciciofim    := CreateCmDbField( 'EXERCICIOFIM',    ftfloat,  True,  False, False, True, 'Exercício Final');
  fConseqnaoatend  := CreateCmDbField( 'CONSEQNAOATEND',  ftString, False, False, False, True, 'Consequencia do não atendimento');
  fBenefesperado   := CreateCmDbField( 'BENEFESPERADO',   ftString, False, False, False, True, 'Benefício Esperado');
  fCodCentroRespon := CreateCmDbField( 'CODCENTRORESPON', ftString, False, False, False, True, 'Centro de Responsabilidade');
  fDescricao       := CreateCmDbField( 'DESCRICAO',       ftString, False, False, False, True, 'Descrição');
end;

function TDbPlanotrabalhoorc.Insert: Boolean;
begin

   fIdplanotrabalho.AsFloat := GetSequence('PLANOTRABALHOORC');
   Result := Inherited Insert;
end;

function TDbPlanotrabalhoorc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPlanotrabalhoorc.SetBenefesperado(const Value: TCmDbField);
begin
  FBenefesperado := Value;
end;

procedure TDbPlanotrabalhoorc.SetCodCentroRespon(const Value: TCmDbField);
begin
  FCodCentroRespon := Value;
end;

procedure TDbPlanotrabalhoorc.SetConseqnaoatend(const Value: TCmDbField);
begin
  FConseqnaoatend := Value;
end;

procedure TDbPlanotrabalhoorc.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbPlanotrabalhoorc.SetExerciciofim(const Value: TCmDbField);
begin
  FExerciciofim := Value;
end;

procedure TDbPlanotrabalhoorc.SetExercicioini(const Value: TCmDbField);
begin
  FExercicioini := Value;
end;

procedure TDbPlanotrabalhoorc.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPlanotrabalhoorc.SetIdplanotrabalho(const Value: TCmDbField);
begin
  FIdplanotrabalho := Value;
end;

procedure TDbPlanotrabalhoorc.SetNecessidade(const Value: TCmDbField);
begin
  FNecessidade := Value;
end;

procedure TDbPlanotrabalhoorc.SetObjetivo(const Value: TCmDbField);
begin
  FObjetivo := Value;
end;

procedure TDbPlanotrabalhoorc.SetPeriodofim(const Value: TCmDbField);
begin
  FPeriodofim := Value;
end;

procedure TDbPlanotrabalhoorc.SetPeriodoini(const Value: TCmDbField);
begin
  FPeriodoini := Value;
end;

procedure TDbPlanotrabalhoorc.SetPrioridade(const Value: TCmDbField);
begin
  FPrioridade := Value;
end;

procedure TDbPlanotrabalhoorc.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbPlanotrabalhoorc.SetVlrcustototal(const Value: TCmDbField);
begin
  FVlrcustototal := Value;
end;

procedure TDbPlanotrabalhoorc.SetVlrreceitatotal(const Value: TCmDbField);
begin
  FVlrreceitatotal := Value;
end;

end.



