{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbConfdividaimobxoper;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConfdividaimobxoper = class(TCmDbObject)

  private
    FIdconfdividaimob: TCmDbField;
    FFlgtipo: TCmDbField;
    FObservacao: TCmDbField;
    FFlgdesccondic: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FVlroperacao: TCmDbField;
    FIdConfDividaXOper: TCmDbField;
    FIdCondPagImovel: TCmDbField;
    procedure SetFlgdesccondic(const Value: TCmDbField);
    procedure SetFlgtipo(const Value: TCmDbField);
    procedure SetIdconfdividaimob(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetVlroperacao(const Value: TCmDbField);
    procedure SetIdConfDividaXOper(const Value: TCmDbField);
    procedure SetIdCondPagImovel(const Value: TCmDbField);

  public

     Property Vlroperacao: TCmDbField read FVlroperacao write SetVlroperacao;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idconfdividaimob: TCmDbField read FIdconfdividaimob write SetIdconfdividaimob;
     Property Flgtipo: TCmDbField read FFlgtipo write SetFlgtipo;
     Property Flgdesccondic: TCmDbField read FFlgdesccondic write SetFlgdesccondic;
     property IdConfDividaXOper: TCmDbField read FIdConfDividaXOper write SetIdConfDividaXOper;
     property IdCondPagImovel: TCmDbField read FIdCondPagImovel write SetIdCondPagImovel;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConfdividaimobxoper }

constructor TDbConfdividaimobxoper.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONFDIVIDAIMOBXOPER';

   fVlroperacao := CreateCmDbField('VLROPERACAO',ftfloat,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdconfdividaimob := CreateCmDbField('IDCONFDIVIDAIMOB',ftfloat,False,False,False,True,'');
   fFlgtipo := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'');
   fFlgdesccondic := CreateCmDbField('FLGDESCCONDIC',ftfloat,False,False,False,True,'');
   fIdConfDividaXOper := CreateCmDbField('IDCONFDIVIDAXOPER',ftfloat,True,True,False,True,'');
   fIdcondpagimovel := CreateCmDbField('IDCONDPAGIMOVEL',ftfloat,False,False,False,True,'');
end;



function TDbConfdividaimobxoper.Insert: Boolean;
begin
   fIdConfDividaXOper.AsFloat := GetSequence('CONFDIVIDAIMOBXOPER');
   Result := Inherited Insert;
end;


procedure TDbConfdividaimobxoper.SetFlgdesccondic(const Value: TCmDbField);
begin
  FFlgdesccondic := Value;
end;

procedure TDbConfdividaimobxoper.SetFlgtipo(const Value: TCmDbField);
begin
  FFlgtipo := Value;
end;

procedure TDbConfdividaimobxoper.SetIdCondPagImovel(const Value: TCmDbField);
begin
   FIdCondPagImovel := Value;
end;

procedure TDbConfdividaimobxoper.SetIdconfdividaimob(
  const Value: TCmDbField);
begin
  FIdconfdividaimob := Value;
end;

procedure TDbConfdividaimobxoper.SetIdConfDividaXOper(
  const Value: TCmDbField);
begin
  FIdConfDividaXOper := Value;
end;

procedure TDbConfdividaimobxoper.SetIdtipocustorecimo(
  const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbConfdividaimobxoper.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbConfdividaimobxoper.SetVlroperacao(const Value: TCmDbField);
begin
  FVlroperacao := Value;
end;

end.



