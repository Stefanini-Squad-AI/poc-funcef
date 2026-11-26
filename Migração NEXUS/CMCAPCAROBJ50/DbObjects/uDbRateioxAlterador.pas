unit uDbRateioxAlterador;

//******************************************************************************
//N. Chamado....: SIG 130578
//Dt Alteração..: 07/05/2024
//Responsável...: Arnaldo Vicente Scarin
//Descrição.....: Foi criado no Objeto CtrlDocumento uma nova propriedade
//                que contem os planos previdenciarios que serão escolhidos
//                na tela de Lançamento de Alteradores, para que possam
//                ser utilizados no Rateio dos dados.
//                Essa propriedade conterá somente os planos escolhidos para
//                o Rateio dos Alteradores, e esses lançamentos serão
//                armazenados na tabela RateioDocum com o Campo Valor Zerado
//                Tambem será criada uma nova tabela, para que haja o
//                relacionamento entre a Linha do Alterador que está na
//                tabela LanctoDocum e as linhas que estão na Tabela RateioDocum
//                para que haja rastreabilidade e em caso de exclusão do
//                alterador, possam ser excluidos os rateios.
//******************************************************************************


interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbRateioxAlterador = class(TCmDbObject)

  private
    FIdpatro: TCmDbField;
    FIdrateiodocum: TCmDbField;
    FValor: TCmDbField;
    FCoddocumento: TCmDbField;
    FIdplanoprev: TCmDbField;
    FNumLancto: TCmDbField;
  protected
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetNumLancto(const Value: TCmDbField);
  public
     Property NumLancto: TCmDbField read FNumLancto write SetNumLancto;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Valor: TCmDbField read FValor write SetValor;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     function Insert: Boolean; Override;
  End;

implementation

{ TDbRateioxAlterador }

constructor TDbRateioxAlterador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RateioxAlterador';

  fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,False,False,True,'');
  fNumLancto    := CreateCmDbField('NUMLANCTO',ftfloat,True,False,False,True,'');
  fIdplanoprev  := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
  fIdpatro      := CreateCmDbField('IDPESSJUR',ftfloat,False,False,False,True,'');
  fValor        := CreateCmDbField('VALOR',ftfloat,False,False,False,False,'',2);
end;

function TDbRateioxAlterador.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDbRateioxAlterador.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbRateioxAlterador.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbRateioxAlterador.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbRateioxAlterador.SetNumLancto(const Value: TCmDbField);
begin
  FNumLancto := Value;
end;

procedure TDbRateioxAlterador.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.