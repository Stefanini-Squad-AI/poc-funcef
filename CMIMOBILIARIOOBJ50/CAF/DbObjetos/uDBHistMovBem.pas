{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 19/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBHistMovBem;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBHistMovBem = class(TCmDbObject)

  private
    FTrfavdeplanc: TCmDbField;
    FTrfreavcmbem: TCmDbField;
    FTrfavcmdep: TCmDbField;
    FObsbaixa: TCmDbField;
    FDataultdep: TCmDbField;
    FIdconjant: TCmDbField;
    FIdgrupant: TCmDbField;
    FIdtipomovimentacao: TCmDbField;
    FTrfreavdeplanc: TCmDbField;
    FIdtaxadep: TCmDbField;
    FObsacrescimo: TCmDbField;
    FIdpessoa: TCmDbField;
    FTrfavvalorg: TCmDbField;
    FIdmovimentacao: TCmDbField;
    FTrfavcmbem: TCmDbField;
    FTrfdeplanc: TCmDbField;
    FTrfreavcmdep: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdbem: TCmDbField;
    FTipdepprorata: TCmDbField;
    FTrfvalorg: TCmDbField;
    FIdtipodespesa: TCmDbField;
    FIdrespant: TCmDbField;
    FTrfcmbem: TCmDbField;
    FValorglaudo: TCmDbField;
    FObsreaval: TCmDbField;
    FTrfreavvalorg: TCmDbField;
    FIdmotivobaixa: TCmDbField;
    FIdlocalant: TCmDbField;
    FFlgncaf: TCmDbField;
    FPropbaixa: TCmDbField;
    FTrfcmdep: TCmDbField;
    FPlacaant: TCmDbField;
    FIdreavalacresc: TCmDbField;
    FDatamovimentacao: TCmDbField;
    FTaxadepant: TCmDbField;
    FIdcafobra: TCmDbField;
    procedure SetDatamovimentacao(const Value: TCmDbField);
    procedure SetDataultdep(const Value: TCmDbField);
    procedure SetFlgncaf(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdcafobra(const Value: TCmDbField);
    procedure SetIdconjant(const Value: TCmDbField);
    procedure SetIdgrupant(const Value: TCmDbField);
    procedure SetIdlocalant(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdmotivobaixa(const Value: TCmDbField);
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdreavalacresc(const Value: TCmDbField);
    procedure SetIdrespant(const Value: TCmDbField);
    procedure SetIdtaxadep(const Value: TCmDbField);
    procedure SetIdtipodespesa(const Value: TCmDbField);
    procedure SetIdtipomovimentacao(const Value: TCmDbField);
    procedure SetObsacrescimo(const Value: TCmDbField);
    procedure SetObsbaixa(const Value: TCmDbField);
    procedure SetObsreaval(const Value: TCmDbField);
    procedure SetPlacaant(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetPropbaixa(const Value: TCmDbField);
    procedure SetTaxadepant(const Value: TCmDbField);
    procedure SetTipdepprorata(const Value: TCmDbField);
    procedure SetTrfavcmbem(const Value: TCmDbField);
    procedure SetTrfavcmdep(const Value: TCmDbField);
    procedure SetTrfavdeplanc(const Value: TCmDbField);
    procedure SetTrfavvalorg(const Value: TCmDbField);
    procedure SetTrfcmbem(const Value: TCmDbField);
    procedure SetTrfcmdep(const Value: TCmDbField);
    procedure SetTrfdeplanc(const Value: TCmDbField);
    procedure SetTrfreavcmbem(const Value: TCmDbField);
    procedure SetTrfreavcmdep(const Value: TCmDbField);
    procedure SetTrfreavdeplanc(const Value: TCmDbField);
    procedure SetTrfreavvalorg(const Value: TCmDbField);
    procedure SetTrfvalorg(const Value: TCmDbField);
    procedure SetValorglaudo(const Value: TCmDbField);

  public

     Property Valorglaudo: TCmDbField read FValorglaudo write SetValorglaudo;
     Property Trfvalorg: TCmDbField read FTrfvalorg write SetTrfvalorg;
     Property Trfreavvalorg: TCmDbField read FTrfreavvalorg write SetTrfreavvalorg;
     Property Trfreavdeplanc: TCmDbField read FTrfreavdeplanc write SetTrfreavdeplanc;
     Property Trfreavcmdep: TCmDbField read FTrfreavcmdep write SetTrfreavcmdep;
     Property Trfreavcmbem: TCmDbField read FTrfreavcmbem write SetTrfreavcmbem;
     Property Trfdeplanc: TCmDbField read FTrfdeplanc write SetTrfdeplanc;
     Property Trfcmdep: TCmDbField read FTrfcmdep write SetTrfcmdep;
     Property Trfcmbem: TCmDbField read FTrfcmbem write SetTrfcmbem;
     Property Trfavvalorg: TCmDbField read FTrfavvalorg write SetTrfavvalorg;
     Property Trfavdeplanc: TCmDbField read FTrfavdeplanc write SetTrfavdeplanc;
     Property Trfavcmdep: TCmDbField read FTrfavcmdep write SetTrfavcmdep;
     Property Trfavcmbem: TCmDbField read FTrfavcmbem write SetTrfavcmbem;
     Property Tipdepprorata: TCmDbField read FTipdepprorata write SetTipdepprorata;
     Property Taxadepant: TCmDbField read FTaxadepant write SetTaxadepant;
     Property Propbaixa: TCmDbField read FPropbaixa write SetPropbaixa;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Placaant: TCmDbField read FPlacaant write SetPlacaant;
     Property Obsreaval: TCmDbField read FObsreaval write SetObsreaval;
     Property Obsbaixa: TCmDbField read FObsbaixa write SetObsbaixa;
     Property Obsacrescimo: TCmDbField read FObsacrescimo write SetObsacrescimo;
     Property Idtipomovimentacao: TCmDbField read FIdtipomovimentacao write SetIdtipomovimentacao;
     Property Idtipodespesa: TCmDbField read FIdtipodespesa write SetIdtipodespesa;
     Property Idtaxadep: TCmDbField read FIdtaxadep write SetIdtaxadep;
     Property Idrespant: TCmDbField read FIdrespant write SetIdrespant;
     Property Idreavalacresc: TCmDbField read FIdreavalacresc write SetIdreavalacresc;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;
     Property Idmotivobaixa: TCmDbField read FIdmotivobaixa write SetIdmotivobaixa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlocalant: TCmDbField read FIdlocalant write SetIdlocalant;
     Property Idgrupant: TCmDbField read FIdgrupant write SetIdgrupant;
     Property Idconjant: TCmDbField read FIdconjant write SetIdconjant;
     Property Idcafobra: TCmDbField read FIdcafobra write SetIdcafobra;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Flgncaf: TCmDbField read FFlgncaf write SetFlgncaf;
     Property Dataultdep: TCmDbField read FDataultdep write SetDataultdep;
     Property Datamovimentacao: TCmDbField read FDatamovimentacao write SetDatamovimentacao;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBHistMovBem }

constructor TDBHistMovBem.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'HISTORICOMOVIMENTACAO';

   fValorglaudo := CreateCmDbField('VALORGLAUDO',ftfloat,False,False,False,True,'');
   fTrfvalorg := CreateCmDbField('TRFVALORG',ftfloat,False,False,False,True,'');
   fTrfreavvalorg := CreateCmDbField('TRFREAVVALORG',ftfloat,False,False,False,True,'');
   fTrfreavdeplanc := CreateCmDbField('TRFREAVDEPLANC',ftfloat,False,False,False,True,'');
   fTrfreavcmdep := CreateCmDbField('TRFREAVCMDEP',ftfloat,False,False,False,True,'');
   fTrfreavcmbem := CreateCmDbField('TRFREAVCMBEM',ftfloat,False,False,False,True,'');
   fTrfdeplanc := CreateCmDbField('TRFDEPLANC',ftfloat,False,False,False,True,'');
   fTrfcmdep := CreateCmDbField('TRFCMDEP',ftfloat,False,False,False,True,'');
   fTrfcmbem := CreateCmDbField('TRFCMBEM',ftfloat,False,False,False,True,'');
   fTrfavvalorg := CreateCmDbField('TRFAVVALORG',ftfloat,False,False,False,True,'');
   fTrfavdeplanc := CreateCmDbField('TRFAVDEPLANC',ftfloat,False,False,False,True,'');
   fTrfavcmdep := CreateCmDbField('TRFAVCMDEP',ftfloat,False,False,False,True,'');
   fTrfavcmbem := CreateCmDbField('TRFAVCMBEM',ftfloat,False,False,False,True,'');
   fTipdepprorata := CreateCmDbField('TIPDEPPRORATA',ftfloat,False,False,False,True,'');
   fTaxadepant := CreateCmDbField('TAXADEPANT',ftfloat,False,False,False,True,'');
   fPropbaixa := CreateCmDbField('PROPBAIXA',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fPlacaant := CreateCmDbField('PLACAANT',ftfloat,False,False,False,True,'');
   fObsreaval := CreateCmDbField('OBSREAVAL',ftString,False,False,False,True,'');
   fObsbaixa := CreateCmDbField('OBSBAIXA',ftString,False,False,False,True,'');
   fObsacrescimo := CreateCmDbField('OBSACRESCIMO',ftString,False,False,False,True,'');
   fIdtipomovimentacao := CreateCmDbField('IDTIPOMOVIMENTACAO',ftfloat,True,False,False,False,'');
   fIdtipodespesa := CreateCmDbField('IDTIPODESPESA',ftfloat,False,False,False,True,'');
   fIdtaxadep := CreateCmDbField('IDTAXADEP',ftfloat,False,False,False,False,'');
   fIdrespant := CreateCmDbField('IDRESPANT',ftfloat,False,False,False,True,'');
   fIdreavalacresc := CreateCmDbField('IDREAVALACRESC',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,False,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,True,True,False,False,'');
   fIdmotivobaixa := CreateCmDbField('IDMOTIVOBAIXA',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,False,'');
   fIdlocalant := CreateCmDbField('IDLOCALANT',ftfloat,False,False,False,True,'');
   fIdgrupant := CreateCmDbField('IDGRUPANT',ftfloat,False,False,False,True,'');
   fIdconjant := CreateCmDbField('IDCONJANT',ftfloat,False,False,False,True,'');
   fIdcafobra := CreateCmDbField('IDCAFOBRA',ftfloat,False,False,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,False,False,False,'');
   fFlgncaf := CreateCmDbField('FLGNCAF',ftfloat,True,False,False,False,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,False,'');
   fDatamovimentacao := CreateCmDbField('DATAMOVIMENTACAO',ftDateTime,True,False,False,False,'');
end;

function TDBHistMovBem.Insert: Boolean;
begin
   fIdmovimentacao.AsFloat := GetSequence('HISTORICOMOVIMENTACAO');
   Result := Inherited Insert;
end;

function TDBHistMovBem.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBHistMovBem.SetDatamovimentacao(const Value: TCmDbField);
begin
  FDatamovimentacao := Value;
end;

procedure TDBHistMovBem.SetDataultdep(const Value: TCmDbField);
begin
  FDataultdep := Value;
end;

procedure TDBHistMovBem.SetFlgncaf(const Value: TCmDbField);
begin
  FFlgncaf := Value;
end;

procedure TDBHistMovBem.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBHistMovBem.SetIdcafobra(const Value: TCmDbField);
begin
  FIdcafobra := Value;
end;

procedure TDBHistMovBem.SetIdconjant(const Value: TCmDbField);
begin
  FIdconjant := Value;
end;

procedure TDBHistMovBem.SetIdgrupant(const Value: TCmDbField);
begin
  FIdgrupant := Value;
end;

procedure TDBHistMovBem.SetIdlocalant(const Value: TCmDbField);
begin
  FIdlocalant := Value;
end;

procedure TDBHistMovBem.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDBHistMovBem.SetIdmotivobaixa(const Value: TCmDbField);
begin
  FIdmotivobaixa := Value;
end;

procedure TDBHistMovBem.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBHistMovBem.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBHistMovBem.SetIdreavalacresc(const Value: TCmDbField);
begin
  FIdreavalacresc := Value;
end;

procedure TDBHistMovBem.SetIdrespant(const Value: TCmDbField);
begin
  FIdrespant := Value;
end;

procedure TDBHistMovBem.SetIdtaxadep(const Value: TCmDbField);
begin
  FIdtaxadep := Value;
end;

procedure TDBHistMovBem.SetIdtipodespesa(const Value: TCmDbField);
begin
  FIdtipodespesa := Value;
end;

procedure TDBHistMovBem.SetIdtipomovimentacao(const Value: TCmDbField);
begin
  FIdtipomovimentacao := Value;
end;

procedure TDBHistMovBem.SetObsacrescimo(const Value: TCmDbField);
begin
  FObsacrescimo := Value;
end;

procedure TDBHistMovBem.SetObsbaixa(const Value: TCmDbField);
begin
  FObsbaixa := Value;
end;

procedure TDBHistMovBem.SetObsreaval(const Value: TCmDbField);
begin
  FObsreaval := Value;
end;

procedure TDBHistMovBem.SetPlacaant(const Value: TCmDbField);
begin
  FPlacaant := Value;
end;

procedure TDBHistMovBem.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDBHistMovBem.SetPropbaixa(const Value: TCmDbField);
begin
  FPropbaixa := Value;
end;

procedure TDBHistMovBem.SetTaxadepant(const Value: TCmDbField);
begin
  FTaxadepant := Value;
end;

procedure TDBHistMovBem.SetTipdepprorata(const Value: TCmDbField);
begin
  FTipdepprorata := Value;
end;

procedure TDBHistMovBem.SetTrfavcmbem(const Value: TCmDbField);
begin
  FTrfavcmbem := Value;
end;

procedure TDBHistMovBem.SetTrfavcmdep(const Value: TCmDbField);
begin
  FTrfavcmdep := Value;
end;

procedure TDBHistMovBem.SetTrfavdeplanc(const Value: TCmDbField);
begin
  FTrfavdeplanc := Value;
end;

procedure TDBHistMovBem.SetTrfavvalorg(const Value: TCmDbField);
begin
  FTrfavvalorg := Value;
end;

procedure TDBHistMovBem.SetTrfcmbem(const Value: TCmDbField);
begin
  FTrfcmbem := Value;
end;

procedure TDBHistMovBem.SetTrfcmdep(const Value: TCmDbField);
begin
  FTrfcmdep := Value;
end;

procedure TDBHistMovBem.SetTrfdeplanc(const Value: TCmDbField);
begin
  FTrfdeplanc := Value;
end;

procedure TDBHistMovBem.SetTrfreavcmbem(const Value: TCmDbField);
begin
  FTrfreavcmbem := Value;
end;

procedure TDBHistMovBem.SetTrfreavcmdep(const Value: TCmDbField);
begin
  FTrfreavcmdep := Value;
end;

procedure TDBHistMovBem.SetTrfreavdeplanc(const Value: TCmDbField);
begin
  FTrfreavdeplanc := Value;
end;

procedure TDBHistMovBem.SetTrfreavvalorg(const Value: TCmDbField);
begin
  FTrfreavvalorg := Value;
end;

procedure TDBHistMovBem.SetTrfvalorg(const Value: TCmDbField);
begin
  FTrfvalorg := Value;
end;

procedure TDBHistMovBem.SetValorglaudo(const Value: TCmDbField);
begin
  FValorglaudo := Value;
end;

end.



