
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 138123
Nº KINTANA..: 838503
Data........: 12/07/2010
Responsável.: Thaise Amaral Martins
Descrição...: Retirada a opção que tornava setava o campo FLGUSADEPRECIACAO como uma das chaves primária
              ao criar o DBTiposMovimentoGrupos, pois esse campo não é chave e pode ser alterado.
-------------------------------------------------------------------------------------------------- }


{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 18/03/2002                             }
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


unit uDBTiposMovimentoGrupos;

interface
Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBTiposMovimentoGrupos = class(TCmDbObject)

  private
    FIdgrupo: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdtipomovimentacao: TCmDbField;
    FFlgUsaDepreciacao: TCMDbField;
    fIdTipoDespesa:      TCmDbField;
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipomovimentacao(const Value: TCmDbField);
    procedure SetFlgUsaDepreciacao(const Value: TCMDbField);
    procedure SetIdTipoDespesa(const Value: TCmDbField);
  public

     Property Idtipomovimentacao: TCmDbField read FIdtipomovimentacao write SetIdtipomovimentacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property FlgUsaDepreciacao: TCMDbField  read FFlgUsaDepreciacao write SetFlgUsaDepreciacao;
     Property IdTipoDespesa: TCmDbField read FIdTipoDespesa write SetIdTipoDespesa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBTiposMovimentoGrupos }

constructor TDBTiposMovimentoGrupos.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPOSMOVIMENTOGRUPOS';

   fIdtipomovimentacao := CreateCmDbField('IDTIPOMOVIMENTACAO',ftfloat,True,True,False,False,'');
   fIdpessoa           := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdgrupo            := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,False,'');
   FFlgUsaDepreciacao  := CreateCmDbField('FLGUSADEPRECIACAO',ftString,True,True,False,False,'');
   //Helen - SOL Nº142550 KINTANA Nº 911790
   fIdTipoDespesa      := CreateCmDbField('IDTIPODESPESA',ftfloat,True,True,False,False,'');

end;

function TDBTiposMovimentoGrupos.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBTiposMovimentoGrupos.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTiposMovimentoGrupos.SetFlgUsaDepreciacao(
  const Value: TCMDbField);
begin
  FFlgUsaDepreciacao := Value;
end;

procedure TDBTiposMovimentoGrupos.SetIdgrupo(const Value: TCmDbField);
begin
   FIdgrupo := Value;
end;

procedure TDBTiposMovimentoGrupos.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBTiposMovimentoGrupos.SetIdTipoDespesa(const Value: TCmDbField);
begin
   fIdTipoDespesa := Value;
end;

procedure TDBTiposMovimentoGrupos.SetIdtipomovimentacao(const Value: TCmDbField);
begin
   FIdtipomovimentacao := Value;
end;

end.



