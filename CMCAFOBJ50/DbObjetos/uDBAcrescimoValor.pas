{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}
{ -------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 25/10/2010
Responsável.: Helen V. Bianchi
Descrição...: Adicionado o campo IdTipoDespesa
---------------------------------------------------------------------------------}
//-------------------------------------------------------------------------------
unit uDBAcrescimoValor;

interface
Uses uCmDbObject, DB, uCmCustomCdbObject;

Type
  TDBAcrescimoValor = class(TCmDbObject)

  private
    FIdmovimentacao: TCmDbField;
    FIdbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FDataacrescimo: TCmDbField;
    FIdacrescimo: TCmDbField;
    FFLGDEPREC: TCmDbField;
    fIdTipoDespesa: TCmDbField;
    procedure SetDataacrescimo(const Value: TCmDbField);
    procedure SetIdacrescimo(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetFLGDEPREC(const Value: TCmDbField);
    procedure SetIdTipoDespesa(const Value: TCmDbField);

  public
     Property Idacrescimo: TCmDbField read FIdacrescimo write SetIdacrescimo;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;
     Property Dataacrescimo: TCmDbField read FDataacrescimo write SetDataacrescimo;
     Property FLGDEPREC: TCmDbField read FFLGDEPREC write SetFLGDEPREC;
     Property IdTipoDespesa: TCmDbField read FIdTipoDespesa write SetIdTipoDespesa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBAcrescimoValor }

constructor TDBAcrescimoValor.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ACRESCIMOVALOR';

   fIdacrescimo := CreateCmDbField('IDACRESCIMO',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,False,False,False,True,'');
   fDataacrescimo := CreateCmDbField('DATAACRESCIMO',ftDateTime,True,False,False,False,'');
   FFLGDEPREC := CreateCmDbField('FLGDEPREC',ftInteger,False,False,False,False,'');
   //Helen - SOL Nº142550 KINTANA Nº 911790
   fIdTipoDespesa := CreateCmDbField('IDTIPODESPESA',ftfloat,False,False,False,False,'');
end;

function TDBAcrescimoValor.Insert: Boolean;
begin
   fIdacrescimo.AsFloat := GetSequence('ACRESCIMOVALOR');
   FFLGDEPREC.AsInteger := 0;
   Result := Inherited Insert;
end;

function TDBAcrescimoValor.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBAcrescimoValor.SetDataacrescimo(const Value: TCmDbField);
begin
  FDataacrescimo := Value;
end;

procedure TDBAcrescimoValor.SetFLGDEPREC(const Value: TCmDbField);
begin
  FFLGDEPREC := Value;
end;

procedure TDBAcrescimoValor.SetIdacrescimo(const Value: TCmDbField);
begin
  FIdacrescimo := Value;
end;

procedure TDBAcrescimoValor.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBAcrescimoValor.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBAcrescimoValor.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBAcrescimoValor.SetIdTipoDespesa(const Value: TCmDbField);
begin
  fIdTipoDespesa := Value;
end;

end.



