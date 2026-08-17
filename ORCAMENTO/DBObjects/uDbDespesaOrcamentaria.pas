{-------------------------------------------------------------------------------------------------
 Alterações:
--------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 09/10/2012
// Nº SOL........: 191939
// Nº KINTANA....: 1820654
// Rotina........: .dfm
// Descrição.....: centralização do titulo
--------------------------------------------------------------------------------------------------}


unit uDbDespesaOrcamentaria;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbDespesaOrcamentaria = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FNatureza: TCmDbField;
    FIdFornecedor: TCmDbField;
    FIdDespesaOrc: TCmDbField;
    FFlgStatus: TCmDbField;
    FDescricao: TCmDbField;
    FSubDespesa: TCmDbField;
    FAcao: TCmDbField;
    FIdGrupoOrcamen: TCmDbField;
    procedure SetAcao(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgStatus(const Value: TCmDbField);
    procedure SetIdDespesaOrc(const Value: TCmDbField);
    procedure SetIdFornecedor(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNatureza(const Value: TCmDbField);
    procedure SetSubDespesa(const Value: TCmDbField);
    procedure SetIdGrupoOrcamen(const Value: TCmDbField);

  protected

  public
     Property IdDespesaOrc : TCmDbField read FIdDespesaOrc write SetIdDespesaOrc;
     Property IdGrupoOrcamen : TCmDbField read FIdGrupoOrcamen write SetIdGrupoOrcamen;
     Property IdFornecedor : TCmDbField read FIdFornecedor write SetIdFornecedor;
     Property SubDespesa : TCmDbField read FSubDespesa write SetSubDespesa;
     Property Acao : TCmDbField read FAcao write SetAcao;
     Property Descricao : TCmDbField read FDescricao write SetDescricao;
     Property FlgStatus : TCmDbField read FFlgStatus write SetFlgStatus;
     Property Natureza : TCmDbField read FNatureza write SetNatureza;
     Property Idpessoa : TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

end;

implementation

{ TDbFornecedorSubDespesa }

constructor TDbDespesaOrcamentaria.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'DESPESAORCAMENTARIA';

  fIdDespesaOrc   := CreateCmDbField( 'IDDESPESAORC',     ftfloat,  True,  True,  False, True, 'Id da Despesa Orçamentária');
  //fIdDespesaOrc   := CreateCmDbField( 'IDGRUPOORCAMEN',   ftfloat,  True,  True,  False, True, 'Id do Grupo Orçamentário'); // Edilaine - SOL 191939 / KTN 1820654 - comentado
  fIdGrupoOrcamen := CreateCmDbField( 'IDGRUPOORCAMEN',   ftfloat,  True,  False, False, True, 'Id do Grupo Orçamentário');   // Edilaine - SOL 191939 / KTN 1820654
  fIdFornecedor   := CreateCmDbField( 'IDFORNECEDOR',     ftfloat,  True,  False, False, True, 'Id do Fornecedor');
  fSubDespesa     := CreateCmDbField( 'SUBDESPESA',       ftString, False, False, False, True, 'Sub Despesa');
  fAcao           := CreateCmDbField( 'ACAO',             ftString, False, False, False, True, 'Ação a ser tomada');
  fDescricao      := CreateCmDbField( 'DESCRICAO',        ftString, False, False, False, True, 'Descrição/Justificativa');
  fFlgStatus      := CreateCmDbField( 'FLGSTATUSDESPESA', ftString, False, False, False, True, 'Status da Despesa - A: Ativa / I: Inativa');
  fNatureza       := CreateCmDbField( 'NATUREZA',         ftString, False, False, False, True, 'Natureza da Despesa - ND: Nova Demanda / OP: Operacional');
  fIdpessoa       := CreateCmDbField( 'IDPESSOA',         ftfloat,  True,  False, False, True, 'Id da Empresa Proprietária');
end;

function TDbDespesaOrcamentaria.Insert: Boolean;
begin
  if fIdDespesaOrc.AsFloat = 0 then
     fIdDespesaOrc.AsFloat := GetSequence('SEQDESPESAORC');
   Result := Inherited Insert;
end;

function TDbDespesaOrcamentaria.LoadFromDb: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbDespesaOrcamentaria.SetAcao(const Value: TCmDbField);
begin
  FAcao := Value;
end;

procedure TDbDespesaOrcamentaria.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbDespesaOrcamentaria.SetFlgStatus(const Value: TCmDbField);
begin
  FFlgStatus := Value;
end;

procedure TDbDespesaOrcamentaria.SetIdDespesaOrc(const Value: TCmDbField);
begin
  FIdDespesaOrc := Value;
end;

procedure TDbDespesaOrcamentaria.SetIdFornecedor(const Value: TCmDbField);
begin
  FIdFornecedor := Value;
end;

procedure TDbDespesaOrcamentaria.SetIdGrupoOrcamen(
  const Value: TCmDbField);
begin
  FIdGrupoOrcamen := Value;
end;

procedure TDbDespesaOrcamentaria.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbDespesaOrcamentaria.SetNatureza(const Value: TCmDbField);
begin
  FNatureza := Value;
end;

procedure TDbDespesaOrcamentaria.SetSubDespesa(const Value: TCmDbField);
begin
  FSubDespesa := Value;
end;

end.
 