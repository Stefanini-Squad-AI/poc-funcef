{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 30/11/2004                             }
{                                                       }
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 29/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado o campo IDTIPODESPESA
--------------------------------------------------------------------------------------}
//-------------------------------------------------------------------------------------


unit uDBContasTiposMovimentoGrupos;

interface
Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBContasTiposMovimentoGrupos = class(TCmDbObject)

  private
    FTipolancamento: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdtipomovimentacao: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdcontastiposmov: TCmDbField;
    FIdempresa: TCmDbField;
    FPlano: TCmDbField;
    FPlaconta: TCmDbField;
    FFlgSegrega: TCmDbField;
    FIdTipoDespesa : TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdcontastiposmov(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipomovimentacao(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetTipolancamento(const Value: TCmDbField);
    procedure SetFlgSegrega(const Value: TCmDbField);
    procedure SetIdTipoDespesa(const Value: TCmDbField);

  public

     Property Tipolancamento: TCmDbField read FTipolancamento write SetTipolancamento;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idtipomovimentacao: TCmDbField read FIdtipomovimentacao write SetIdtipomovimentacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcontastiposmov: TCmDbField read FIdcontastiposmov write SetIdcontastiposmov;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property FlgSegrega: TCmDbField read FFlgSegrega write SetFlgSegrega;
     Property IdTipoDespesa: TCmDbField read FIdTipoDespesa write SetIdTipoDespesa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBContasTiposMovimentoGrupos }

constructor TDBContasTiposMovimentoGrupos.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CONTASTIPOSMOVIMENTOGRUPOS';

   fIdcontastiposmov := CreateCmDbField('IDCONTASTIPOSMOV',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,False,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,False,'');
   fIdtipomovimentacao := CreateCmDbField('IDTIPOMOVIMENTACAO',ftfloat,False,False,False,False,'');
   fTipolancamento := CreateCmDbField('TIPOLANCAMENTO',ftString,False,False,False,False,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,False,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,False,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fFlgSegrega := CreateCmDbField('FLGSEGREGA',ftInteger,False,False,False,False,'');
   //Helen - SOL Nº142550 KINTANA Nº 911790
   fIdTipoDespesa      := CreateCmDbField('IDTIPODESPESA',ftfloat,False,False,False,False,'');

end;

function TDBContasTiposMovimentoGrupos.Insert: Boolean;
begin
   fIdcontastiposmov.AsFloat := GetSequence('CONTASTIPOSMOVIMENTOGRUPOS');
   Result := Inherited Insert;
end;

function TDBContasTiposMovimentoGrupos.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBContasTiposMovimentoGrupos.SetCodcentrocusto(const Value: TCmDbField);
begin
   FCodcentrocusto := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetFlgSegrega(const Value: TCmDbField);
begin
  FFlgSegrega := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdcontastiposmov(const Value: TCmDbField);
begin
   FIdcontastiposmov := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdempresa(const Value: TCmDbField);
begin
   FIdempresa := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdgrupo(const Value: TCmDbField);
begin
   FIdgrupo := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdTipoDespesa(
  const Value: TCmDbField);
begin
   FIdTipoDespesa := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdtipomovimentacao(const Value: TCmDbField);
begin
   FIdtipomovimentacao := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetPlaconta(const Value: TCmDbField);
begin
   FPlaconta := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetPlano(const Value: TCmDbField);
begin
   FPlano := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetTipolancamento(const Value: TCmDbField);
begin
   FTipolancamento := Value;
end;

end.



