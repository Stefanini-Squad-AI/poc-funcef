{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 07/01/2008                             }
{                                                       }
{*******************************************************}

unit uDbHistEmpAcoes;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistEmpAcoes = class(TCmDbObject)

  private
    FSldhistempacoes: TCmDbField;
    FVlrhistempacoes: TCmDbField;
    FIdinvestimento: TCmDbField;
    FPlncodigo: TCmDbField;
    FSldqtdhistempacoe: TCmDbField;
    FSldfinal: TCmDbField;
    FCoddocumento: TCmDbField;
    FVlrjuros: TCmDbField;
    FSldjuros: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FIdoperempacoes: TCmDbField;
    FPlano: TCmDbField;
    FIdempresaprop: TCmDbField;
    FIdhistempacoes: TCmDbField;
    FSldprincipal: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FVlrfinal: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FIdcustodiante: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FQtdhistempacoes: TCmDbField;
    FDatahistempacoes: TCmDbField;
    FIdoperempacoesap: TCmDbField;
    FVlrprincipal: TCmDbField;
    FNaturmov: TCmDbField;
    FFlgrecalc: TCmDbField;
    FVlrJurosEst: TCmDbField;
    //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
    Ftipolancamento: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDatahistempacoes(const Value: TCmDbField);
    procedure SetFlgrecalc(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdhistempacoes(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdoperempacoes(const Value: TCmDbField);
    procedure SetIdoperempacoesap(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetNaturmov(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetQtdhistempacoes(const Value: TCmDbField);
    procedure SetSldfinal(const Value: TCmDbField);
    procedure SetSldhistempacoes(const Value: TCmDbField);
    procedure SetSldjuros(const Value: TCmDbField);
    procedure SetSldprincipal(const Value: TCmDbField);
    procedure SetSldqtdhistempacoe(const Value: TCmDbField);
    procedure SetVlrfinal(const Value: TCmDbField);
    procedure SetVlrhistempacoes(const Value: TCmDbField);
    procedure SetVlrjuros(const Value: TCmDbField);
    procedure SetVlrprincipal(const Value: TCmDbField);
    procedure SetVlrJurosEst(const Value: TCmDbField);
    //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
    procedure Settipolancamento(const Value: TCmDbField);

  public

     Property IdHistEmpAcoes: TCmDbField read FIdhistempacoes write SetIdhistempacoes;
     Property IdEmpresaProp: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property IdOperEmpAcoes: TCmDbField read FIdoperempacoes write SetIdoperempacoes;
     Property IdOperEmpAcoesAP: TCmDbField read FIdoperempacoesap write SetIdoperempacoesap;
     Property IdModulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property IdPlanPrevCtbPatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property PlnCodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property CodDocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property IdCustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
     Property IdCarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property IdInvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property IdTipoInvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property IdTipoOperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property NaturMov: TCmDbField read FNaturmov write SetNaturmov;
     Property DataHistEmpAcoes: TCmDbField read FDatahistempacoes write SetDatahistempacoes;
     Property VlrHistEmpAcoes: TCmDbField read FVlrhistempacoes write SetVlrhistempacoes;
     Property SldHistEmpAcoes: TCmDbField read FSldhistempacoes write SetSldhistempacoes;
     Property QtdHistEmpAcoes: TCmDbField read FQtdhistempacoes write SetQtdhistempacoes;
     Property SldQtdHistEmpAcoe: TCmDbField read FSldqtdhistempacoe write SetSldqtdhistempacoe;
     Property VlrJuros: TCmDbField read FVlrjuros write SetVlrjuros;
     Property VlrJurosEst: TCmDbField read FVlrJurosEst write SetVlrJurosEst;
     Property SldJuros: TCmDbField read FSldjuros write SetSldjuros;
     Property VlrPrincipal: TCmDbField read FVlrprincipal write SetVlrprincipal;
     Property SldPrincipal: TCmDbField read FSldprincipal write SetSldprincipal;
     Property VlrFinal: TCmDbField read FVlrfinal write SetVlrfinal;
     Property SldFinal: TCmDbField read FSldfinal write SetSldfinal;
     Property FlgRecalc: TCmDbField read FFlgrecalc write SetFlgrecalc;
     //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
     property tipolancamento: TCmDbField read Ftipolancamento write Settipolancamento;     

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistEmpAcoes }

constructor TDbHistEmpAcoes.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'HISTEMPACOES';

   fIdHistEmpAcoes := CreateCmDbField('IDHISTEMPACOES',ftfloat,True,True,False,True,'ID do Histórico');
   fIdEmpresaProp := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'ID da Empresa Própria');
   fIdOperEmpAcoes := CreateCmDbField('IDOPEREMPACOES',ftfloat,False,False,False,True,'ID da Operação Efetuada');
   fIdOperEmpAcoesAP := CreateCmDbField('IDOPEREMPACOESAP',ftfloat,False,False,False,True,'ID da Operação de Empréstimo');
   fIdModulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'ID do Modulo');
   fIdPlanPrevCtbPatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'ID do Plano / Patro');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'ID do Plano');
   fPlnCodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'Planilha Contábil');
   fCodDocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'Código do Documento');
   fIdCustodiante := CreateCmDbField('IDCUSTODIANTE',ftfloat,False,False,False,True,'ID do Custodiante');
   fIdCarteiraInvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'ID da Carteira');
   fIdInvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'ID do Investimento');
   fIdTipoInvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'ID do Tipo de Investimento');
   fIdTipoOperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'ID do Tipo de Operação');
   fNaturMov := CreateCmDbField('NATURMOV',ftString,False,False,False,True,'Natureza da Movimentação');
   fDataHistEmpAcoes := CreateCmDbField('DATAHISTEMPACOES',ftDateTime,False,False,False,True,'Data do Histórico');
   fVlrHistEmpAcoes := CreateCmDbField('VLRHISTEMPACOES',ftfloat,False,False,False,False,'Valor Movimentado');
   fSldHistEmpAcoes := CreateCmDbField('SLDHISTEMPACOES',ftfloat,False,False,False,False,'Saldo do Empréstimo');
   fQtdHistEmpAcoes := CreateCmDbField('QTDHISTEMPACOES',ftfloat,False,False,False,False,'Quantidade Movimentada');
   fSldQtdHistEmpAcoe := CreateCmDbField('SLDQTDHISTEMPACOE',ftfloat,False,False,False,False,'Saldo de Quantidade');
   fVlrJuros := CreateCmDbField('VLRJUROS',ftfloat,False,False,False,False,'Valor de Juros Movimentado');
   fVlrJurosEst := CreateCmDbField('VLRJUROSEST',ftfloat,False,False,False,False,'Valor de Juros Estornado');
   fSldJuros := CreateCmDbField('SLDJUROS',ftfloat,False,False,False,False,'Saldo de Juros');
   fVlrPrincipal := CreateCmDbField('VLRPRINCIPAL',ftfloat,False,False,False,False,'Valor Principal Movimentado');
   fSldPrincipal := CreateCmDbField('SLDPRINCIPAL',ftfloat,False,False,False,False,'Saldo de Valor Principal');
   fVlrFinal := CreateCmDbField('VLRFINAL',ftfloat,False,False,False,False,'Valor Final Movimentado');
   fSldFinal := CreateCmDbField('SLDFINAL',ftfloat,False,False,False,False,'Saldo de Valor Final ');
   fFlgRecalc := CreateCmDbField('FLGRECALC',ftString,False,False,False,True,'Flag de Reprocessamento');
   //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
   ftipolancamento := CreateCmDbField('TIPOLANCAMENTO',ftString,False,False,False,False,'Tipo de Lançamento');   
end;

function TDbHistEmpAcoes.Insert: Boolean;
begin

   if fIdhistempacoes.AsFloat = 0 then
      fIdhistempacoes.AsFloat := GetSequence('HISTEMPACOES');
   Result := Inherited Insert;

end;


procedure TDbHistEmpAcoes.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbHistEmpAcoes.SetDatahistempacoes(const Value: TCmDbField);
begin
  FDatahistempacoes := Value;
end;

procedure TDbHistEmpAcoes.SetFlgrecalc(const Value: TCmDbField);
begin
  FFlgrecalc := Value;
end;

procedure TDbHistEmpAcoes.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbHistEmpAcoes.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbHistEmpAcoes.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbHistEmpAcoes.SetIdhistempacoes(const Value: TCmDbField);
begin
  FIdhistempacoes := Value;
end;

procedure TDbHistEmpAcoes.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbHistEmpAcoes.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbHistEmpAcoes.SetIdoperempacoes(const Value: TCmDbField);
begin
  FIdoperempacoes := Value;
end;

procedure TDbHistEmpAcoes.SetIdoperempacoesap(const Value: TCmDbField);
begin
  FIdoperempacoesap := Value;
end;

procedure TDbHistEmpAcoes.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbHistEmpAcoes.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbHistEmpAcoes.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbHistEmpAcoes.SetNaturmov(const Value: TCmDbField);
begin
  FNaturmov := Value;
end;

procedure TDbHistEmpAcoes.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbHistEmpAcoes.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbHistEmpAcoes.SetQtdhistempacoes(const Value: TCmDbField);
begin
  FQtdhistempacoes := Value;
end;

procedure TDbHistEmpAcoes.SetSldfinal(const Value: TCmDbField);
begin
  FSldfinal := Value;
end;

procedure TDbHistEmpAcoes.SetSldhistempacoes(const Value: TCmDbField);
begin
  FSldhistempacoes := Value;
end;

procedure TDbHistEmpAcoes.SetSldjuros(const Value: TCmDbField);
begin
  FSldjuros := Value;
end;

procedure TDbHistEmpAcoes.SetSldprincipal(const Value: TCmDbField);
begin
  FSldprincipal := Value;
end;

procedure TDbHistEmpAcoes.SetSldqtdhistempacoe(const Value: TCmDbField);
begin
  FSldqtdhistempacoe := Value;
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
procedure TDbHistEmpAcoes.Settipolancamento(const Value: TCmDbField);
begin
  Ftipolancamento := Value;
end;

procedure TDbHistEmpAcoes.SetVlrfinal(const Value: TCmDbField);
begin
  FVlrfinal := Value;
end;

procedure TDbHistEmpAcoes.SetVlrhistempacoes(const Value: TCmDbField);
begin
  FVlrhistempacoes := Value;
end;

procedure TDbHistEmpAcoes.SetVlrjuros(const Value: TCmDbField);
begin
  FVlrjuros := Value;
end;

procedure TDbHistEmpAcoes.SetVlrJurosEst(const Value: TCmDbField);
begin
  FVlrJurosEst := Value;
end;

procedure TDbHistEmpAcoes.SetVlrprincipal(const Value: TCmDbField);
begin
  FVlrprincipal := Value;
end;

end.



