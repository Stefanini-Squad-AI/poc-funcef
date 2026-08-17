{ --------------------------------------------------------------------------------------------------
Rotina......: Create
Nº SOL......: 136972
Nº KINTANA..: 823252
Data........: 31/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do Valor Residual
---------------------------------------------------------------------------------------------------}
{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 10/12/2007                             }
{                                                       }
{*******************************************************}

unit uDBSaldoContabBem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBSaldoContabBem = class(TCmDbObject)

  private
    FMoecodigo: TCmDbField;
    FReavcmbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FUltreavcmbem: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdbem: TCmDbField;
    FCmbem: TCmDbField;
    FValorg: TCmDbField;
    FReavvalorg: TCmDbField;
    FUltreavvalorg: TCmDbField;
    FIdlocalizacao: TCmDbField;
    FIdresponsavel: TCmDbField;
    FDatasldbem: TCmDbField;
    FIdConjunto: TCmDbField;
    FUnidNegoc: TCmDbField;
    FValorRes: TCmDbField;
    procedure SetCmbem(const Value: TCmDbField);
    procedure SetDatasldbem(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdlocalizacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetReavcmbem(const Value: TCmDbField);
    procedure SetReavvalorg(const Value: TCmDbField);
    procedure SetUltreavcmbem(const Value: TCmDbField);
    procedure SetUltreavvalorg(const Value: TCmDbField);
    procedure SetValorg(const Value: TCmDbField);
    procedure SetIdConjunto(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);
    procedure SetValorRes(const Value: TCmDbField);

  public

     Property Valorg: TCmDbField read FValorg write SetValorg;
     Property ValorRes: TCmDbField read FValorRes write SetValorRes; // Alterado por FHBS - SOL: 136972 KTN: 823252
     Property Ultreavvalorg: TCmDbField read FUltreavvalorg write SetUltreavvalorg;
     Property Ultreavcmbem: TCmDbField read FUltreavcmbem write SetUltreavcmbem;
     Property Reavvalorg: TCmDbField read FReavvalorg write SetReavvalorg;
     Property Reavcmbem: TCmDbField read FReavcmbem write SetReavcmbem;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocalizacao: TCmDbField read FIdlocalizacao write SetIdlocalizacao;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Datasldbem: TCmDbField read FDatasldbem write SetDatasldbem;
     Property Cmbem: TCmDbField read FCmbem write SetCmbem;
     Property UnidNegoc: TCmDbField read FUnidNegoc write SetUnidNegoc;
     Property IdConjunto: TCmDbField read FIdConjunto write SetIdConjunto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBSaldoContabBem }

constructor TDBSaldoContabBem.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SALDOCONTABBEM';

   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fDatasldbem := CreateCmDbField('DATASLDBEM',ftDateTime,True,True,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fValorg := CreateCmDbField('VALORG',ftfloat,False,False,False,False,'');
   fValorRes := CreateCmDbField('VALORRES',ftfloat,False,False,False,False,''); // Alterado por FHBS - SOL: 136972 KTN: 823252
   fCmbem := CreateCmDbField('CMBEM',ftfloat,False,False,False,False,'');
   fReavvalorg := CreateCmDbField('REAVVALORG',ftfloat,False,False,False,False,'');
   fReavcmbem := CreateCmDbField('REAVCMBEM',ftfloat,False,False,False,False,'');
   fUltreavvalorg := CreateCmDbField('ULTREAVVALORG',ftfloat,False,False,False,False,'');
   fUltreavcmbem := CreateCmDbField('ULTREAVCMBEM',ftfloat,False,False,False,False,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,False,False,True,'');
   fIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,True,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,False,False,True,'');
   fUnidNegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fIdConjunto := CreateCmDbField('IDCONJUNTO',ftfloat,False,False,False,True,'');
end;

function TDBSaldoContabBem.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDBSaldoContabBem.SetCmbem(const Value: TCmDbField);
begin
  FCmbem := Value;
end;

procedure TDBSaldoContabBem.SetDatasldbem(const Value: TCmDbField);
begin
  FDatasldbem := Value;
end;

procedure TDBSaldoContabBem.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBSaldoContabBem.SetIdConjunto(const Value: TCmDbField);
begin
  FIdConjunto := Value;
end;

procedure TDBSaldoContabBem.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBSaldoContabBem.SetIdlocalizacao(const Value: TCmDbField);
begin
  FIdlocalizacao := Value;
end;

procedure TDBSaldoContabBem.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBSaldoContabBem.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDBSaldoContabBem.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBSaldoContabBem.SetReavcmbem(const Value: TCmDbField);
begin
  FReavcmbem := Value;
end;

procedure TDBSaldoContabBem.SetReavvalorg(const Value: TCmDbField);
begin
  FReavvalorg := Value;
end;

procedure TDBSaldoContabBem.SetUltreavcmbem(const Value: TCmDbField);
begin
  FUltreavcmbem := Value;
end;

procedure TDBSaldoContabBem.SetUltreavvalorg(const Value: TCmDbField);
begin
  FUltreavvalorg := Value;
end;

procedure TDBSaldoContabBem.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

procedure TDBSaldoContabBem.SetValorg(const Value: TCmDbField);
begin
  FValorg := Value;
end;

procedure TDBSaldoContabBem.SetValorRes(const Value: TCmDbField);
begin
  FValorRes := Value;
end;

end.



