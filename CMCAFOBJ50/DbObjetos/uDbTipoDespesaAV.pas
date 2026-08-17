{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/02/2002                             }
{                                                       }
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 24/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado o campo IdTipoMovimentacao
---------------------------------------------------------------------------------}
//-------------------------------------------------------------------------------

unit uDBTipoDespesaAV;

interface

Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBTipoDespesaAV = class(TCmDbObject)

  private
    FDestipodespesa: TCmDbField;
    FIdtipodespesa: TCmDbField;
    FIdTipoMovimentacao: TCmDbField;
    procedure SetDestipodespesa(const Value: TCmDbField);
    procedure SetIdtipodespesa(const Value: TCmDbField);
    procedure SetIdTipoMovimentacao(const Value: TCmDbField);

  public

     Property Idtipodespesa: TCmDbField read FIdtipodespesa write SetIdtipodespesa;
     Property Destipodespesa: TCmDbField read FDestipodespesa write SetDestipodespesa;
     Property IdTipoMovimentacao: TCmDbField read FIdTipoMovimentacao write SetIdTipoMovimentacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBTipoDespesaAV }

constructor TDBTipoDespesaAV.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPODESPESAAV';

   fIdtipodespesa := CreateCmDbField('IDTIPODESPESA',ftfloat,True,True,False,True,'');
   fDestipodespesa := CreateCmDbField('DESTIPODESPESA',ftString,False,False,False,True,'');
   //Helen - SOL Nº142550 KINTANA Nº 911790
   fIdTipoMovimentacao := CreateCmDbField('IDTIPOMOVIMENTACAO',ftfloat,False,False,False,True,'');

end;

function TDBTipoDespesaAV.Insert: Boolean;
begin
   fIdtipodespesa.AsFloat := GetSequence('TIPODESPESAAV');
   Result := Inherited Insert;
end;

function TDBTipoDespesaAV.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTipoDespesaAV.SetDestipodespesa(const Value: TCmDbField);
begin
  FDestipodespesa := Value;
end;

procedure TDBTipoDespesaAV.SetIdtipodespesa(const Value: TCmDbField);
begin
  FIdtipodespesa := Value;
end;
//Helen - SOL Nº142550 KINTANA Nº 911790
procedure TDBTipoDespesaAV.SetIdTipoMovimentacao(const Value: TCmDbField);
begin
  FIdTipoMovimentacao := Value;
end;

end.



