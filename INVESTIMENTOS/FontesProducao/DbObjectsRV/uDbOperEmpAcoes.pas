{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 07/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbOperEmpAcoes;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperEmpAcoes = class(TCmDbObject)

  private
    FPlncodigo: TCmDbField;
    FVlroperacao: TCmDbField;
    FVlrjuros: TCmDbField;
    FFlgpreco: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FFlgreversao: TCmDbField;
    FIdcustodiante: TCmDbField;
    FPuoperacao: TCmDbField;
    FDatavencoper: TCmDbField;
    FQtdoperacao: TCmDbField;
    FIdinvestimento: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FTipoconfirmado: TCmDbField;
    FVlrir: TCmDbField;
    FCoddocumento: TCmDbField;
    FDataoperacao: TCmDbField;
    FIdoperempacoesap: TCmDbField;
    FIdoperempacoes: TCmDbField;
    FPlano: TCmDbField;
    FVlrresgate: TCmDbField;
    FTaxaoperacao: TCmDbField;
    FIdboleta: TCmDbField;
    FFlgtipoconta: TCmDbField;
    FVlrjurosest: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDataoperacao(const Value: TCmDbField);
    procedure SetDatavencoper(const Value: TCmDbField);
    procedure SetFlgpreco(const Value: TCmDbField);
    procedure SetFlgreversao(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdoperempacoes(const Value: TCmDbField);
    procedure SetIdoperempacoesap(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetPuoperacao(const Value: TCmDbField);
    procedure SetQtdoperacao(const Value: TCmDbField);
    procedure SetTaxaoperacao(const Value: TCmDbField);
    procedure SetTipoconfirmado(const Value: TCmDbField);
    procedure SetVlrir(const Value: TCmDbField);
    procedure SetVlrjuros(const Value: TCmDbField);
    procedure SetVlroperacao(const Value: TCmDbField);
    procedure SetVlrresgate(const Value: TCmDbField);
    procedure SetIdboleta(const Value: TCmDbField);
    procedure SetFlgtipoconta(const Value: TCmDbField);
    procedure SetVlrjurosest(const Value: TCmDbField);

  public

     Property Vlrresgate: TCmDbField read FVlrresgate write SetVlrresgate;
     Property Vlroperacao: TCmDbField read FVlroperacao write SetVlroperacao;
     Property Vlrjuros: TCmDbField read FVlrjuros write SetVlrjuros;
     Property Vlrir: TCmDbField read FVlrir write SetVlrir;
     Property Tipoconfirmado: TCmDbField read FTipoconfirmado write SetTipoconfirmado;
     Property Taxaoperacao: TCmDbField read FTaxaoperacao write SetTaxaoperacao;
     Property Qtdoperacao: TCmDbField read FQtdoperacao write SetQtdoperacao;
     Property Puoperacao: TCmDbField read FPuoperacao write SetPuoperacao;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idoperempacoesap: TCmDbField read FIdoperempacoesap write SetIdoperempacoesap;
     Property Idoperempacoes: TCmDbField read FIdoperempacoes write SetIdoperempacoes;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idcustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Flgreversao: TCmDbField read FFlgreversao write SetFlgreversao;
     Property Flgpreco: TCmDbField read FFlgpreco write SetFlgpreco;
     Property Datavencoper: TCmDbField read FDatavencoper write SetDatavencoper;
     Property Dataoperacao: TCmDbField read FDataoperacao write SetDataoperacao;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     property Idboleta: TCmDbField read FIdboleta write SetIdboleta;
     property Flgtipoconta: TCmDbField read FFlgtipoconta write SetFlgtipoconta;
     property Vlrjurosest: TCmDbField read FVlrjurosest write SetVlrjurosest;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperEmpAcoes }

constructor TDbOperEmpAcoes.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPEREMPACOES';

   fVlrresgate := CreateCmDbField('VLRRESGATE',ftfloat,False,False,False,False,'Valor do Resgate Final');
   fVlroperacao := CreateCmDbField('VLROPERACAO',ftfloat,False,False,False,False,'Valor da Operação');
   fVlrjuros := CreateCmDbField('VLRJUROS',ftfloat,False,False,False,False,'Valor do Juros');
   fVlrir := CreateCmDbField('VLRIR',ftfloat,False,False,False,False,'Valor do IR');
   fTipoconfirmado := CreateCmDbField('TIPOCONFIRMADO',ftString,False,False,False,False,'Tipo Confirmado');
   fTaxaoperacao := CreateCmDbField('TAXAOPERACAO',ftfloat,False,False,False,False,'Taxa da Operação');
   fQtdoperacao := CreateCmDbField('QTDOPERACAO',ftfloat,False,False,False,False,'Quantidade da Operação');
   fPuoperacao := CreateCmDbField('PUOPERACAO',ftfloat,False,False,False,False,'PU da Operação');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'Planilha Contábil');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'ID do Plano');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'ID do Tipo de Operação');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'ID do Tipo de Investimento');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'ID do Plano / Patrocinadora');
   fIdoperempacoesap := CreateCmDbField('IDOPEREMPACOESAP',ftfloat,False,False,False,True,'ID da Operação de Empréstimo');
   fIdoperempacoes := CreateCmDbField('IDOPEREMPACOES',ftfloat,True,True,False,True,'ID da Operação');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'ID do Investimento');
   fIdcustodiante := CreateCmDbField('IDCUSTODIANTE',ftfloat,False,False,False,True,'ID do Custodiante');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'ID da Carteira');
   fFlgreversao := CreateCmDbField('FLGREVERSAO',ftString,False,False,False,True,'Permite Reversão Antecipada');
   fFlgpreco := CreateCmDbField('FLGPRECO',ftString,False,False,False,False,'Preço Utilizado');
   fDatavencoper := CreateCmDbField('DATAVENCOPER',ftDateTime,False,False,False,True,'Data do Vencimento');
   fDataoperacao := CreateCmDbField('DATAOPERACAO',ftDateTime,False,False,False,True,'Data da Operação');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'Codigo do Documento');
   FIdboleta := CreateCmDbField('IDBOLETA',ftString,False,False,False,True,'Boleta da Operação');
   FFlgtipoconta := CreateCmDbField('FLGTIPOCONTA',ftfloat,False,False,False,False,'Tipo de Conta CC ou CCI');
   fVlrjurosest := CreateCmDbField('VLRJUROSEST',ftfloat,False,False,False,False,'Valor do Juros Estornado');
end;

function TDbOperEmpAcoes.Insert: Boolean;
begin

   if fIdoperempacoes.AsFloat = 0 then
      fIdoperempacoes.AsFloat := GetSequence('OPEREMPACOES');
   Result := Inherited Insert;

end;


procedure TDbOperEmpAcoes.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbOperEmpAcoes.SetDataoperacao(const Value: TCmDbField);
begin
  FDataoperacao := Value;
end;

procedure TDbOperEmpAcoes.SetDatavencoper(const Value: TCmDbField);
begin
  FDatavencoper := Value;
end;

procedure TDbOperEmpAcoes.SetFlgpreco(const Value: TCmDbField);
begin
  FFlgpreco := Value;
end;

procedure TDbOperEmpAcoes.SetFlgreversao(const Value: TCmDbField);
begin
  FFlgreversao := Value;
end;

procedure TDbOperEmpAcoes.SetFlgtipoconta(const Value: TCmDbField);
begin
  FFlgtipoconta := Value;
end;

procedure TDbOperEmpAcoes.SetIdboleta(const Value: TCmDbField);
begin
  FIdboleta := Value;
end;

procedure TDbOperEmpAcoes.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbOperEmpAcoes.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbOperEmpAcoes.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbOperEmpAcoes.SetIdoperempacoes(const Value: TCmDbField);
begin
  FIdoperempacoes := Value;
end;

procedure TDbOperEmpAcoes.SetIdoperempacoesap(const Value: TCmDbField);
begin
  FIdoperempacoesap := Value;
end;

procedure TDbOperEmpAcoes.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbOperEmpAcoes.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbOperEmpAcoes.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbOperEmpAcoes.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbOperEmpAcoes.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbOperEmpAcoes.SetPuoperacao(const Value: TCmDbField);
begin
  FPuoperacao := Value;
end;

procedure TDbOperEmpAcoes.SetQtdoperacao(const Value: TCmDbField);
begin
  FQtdoperacao := Value;
end;

procedure TDbOperEmpAcoes.SetTaxaoperacao(const Value: TCmDbField);
begin
  FTaxaoperacao := Value;
end;

procedure TDbOperEmpAcoes.SetTipoconfirmado(const Value: TCmDbField);
begin
  FTipoconfirmado := Value;
end;

procedure TDbOperEmpAcoes.SetVlrir(const Value: TCmDbField);
begin
  FVlrir := Value;
end;

procedure TDbOperEmpAcoes.SetVlrjuros(const Value: TCmDbField);
begin
  FVlrjuros := Value;
end;

procedure TDbOperEmpAcoes.SetVlrjurosest(const Value: TCmDbField);
begin
  FVlrjurosest := Value;
end;

procedure TDbOperEmpAcoes.SetVlroperacao(const Value: TCmDbField);
begin
  FVlroperacao := Value;
end;

procedure TDbOperEmpAcoes.SetVlrresgate(const Value: TCmDbField);
begin
  FVlrresgate := Value;
end;

end.



