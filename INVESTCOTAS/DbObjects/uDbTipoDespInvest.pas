{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Monica Silva                    }
{ Atualizado Em: 11/01/2007                             }
{                                                       }
{*******************************************************}

unit uDbTipoDespInvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoDespInvest = class(TCmDbObject)

  private
    FPercDivVlrAut: TCmDbField;
    FIdForCli: TCmDbField;
    FNaturezaOperacao: TCmDbField;
    FDescTipoDespInv: TCmDbField;
    FEmpresaProp: TCmDbField;
    FIdTipoDespInvest: TCmDbField;
    FMoeCodigo: TCmDbField;
    FTipCredor: TCmDbField;
    procedure SetDescTipoDespInv(const Value: TCmDbField);
    procedure SetEmpresaProp(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdTipoDespInvest(const Value: TCmDbField);
    procedure SetMoeCodigo(const Value: TCmDbField);
    procedure SetNaturezaOperacao(const Value: TCmDbField);
    procedure SetPercDivVlrAut(const Value: TCmDbField);
    procedure SetTipCredor(const Value: TCmDbField);

  public

     Property TipCredor: TCmDbField read FTipCredor write SetTipCredor;
     Property PercDivVlrAut: TCmDbField read FPercDivVlrAut write SetPercDivVlrAut;
     Property NaturezaOperacao: TCmDbField read FNaturezaOperacao write SetNaturezaOperacao;
     Property MoeCodigo: TCmDbField read FMoeCodigo write SetMoeCodigo;
     Property IdTipoDespInvest: TCmDbField read FIdTipoDespInvest write SetIdTipoDespInvest;
     Property IdForCli: TCmDbField read FIdForCli write SetIdForCli;
     Property EmpresaProp: TCmDbField read FEmpresaProp write SetEmpresaProp;
     Property DescTipoDespInv: TCmDbField read FDescTipoDespInv write SetDescTipoDespInv;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoDespInvest }

constructor TDbTipoDespInvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPODESPINVEST';

   fTipcredor := CreateCmDbField('TIPCREDOR',ftString,False,False,False,True,'Tipo de Credor');
   fPercdivvlraut := CreateCmDbField('PERCDIVVLRAUT',ftfloat,False,False,False,True,'');
   fNaturezaoperacao := CreateCmDbField('NATUREZAOPERACAO',ftString,False,False,False,True,'Natureza da Operação');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'Código da Moeda');
   fIdtipodespinvest := CreateCmDbField('IDTIPODESPINVEST',ftfloat,True,True,False,True,'ID');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'Fornecedor / Cliente');
   fEmpresaprop := CreateCmDbField('EMPRESAPROP',ftfloat,False,False,False,True,'');
   fDesctipodespinv := CreateCmDbField('DESCTIPODESPINV',ftString,False,False,False,True,'');
end;

function TDbTipoDespInvest.Insert: Boolean;
begin

   fIdtipodespinvest.AsFloat := GetSequence('TIPODESPINVEST');
   Result := Inherited Insert;

end;


procedure TDbTipoDespInvest.SetDescTipoDespInv(const Value: TCmDbField);
begin
  FDescTipoDespInv := Value;
end;

procedure TDbTipoDespInvest.SetEmpresaProp(const Value: TCmDbField);
begin
  FEmpresaProp := Value;
end;

procedure TDbTipoDespInvest.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbTipoDespInvest.SetIdTipoDespInvest(const Value: TCmDbField);
begin
  FIdTipoDespInvest := Value;
end;

procedure TDbTipoDespInvest.SetMoeCodigo(const Value: TCmDbField);
begin
  FMoeCodigo := Value;
end;

procedure TDbTipoDespInvest.SetNaturezaOperacao(const Value: TCmDbField);
begin
  FNaturezaOperacao := Value;
end;

procedure TDbTipoDespInvest.SetPercDivVlrAut(const Value: TCmDbField);
begin
  FPercDivVlrAut := Value;
end;

procedure TDbTipoDespInvest.SetTipCredor(const Value: TCmDbField);
begin
  FTipCredor := Value;
end;

end.



