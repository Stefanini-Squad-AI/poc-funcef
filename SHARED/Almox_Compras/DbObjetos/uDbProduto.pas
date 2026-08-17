{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ Analista Responsável: Igor Maffei Libonati Maia       }
{ Atualizado Em: 10/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbProduto;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject, SysUtils;

Type
  TDbProduto = class(TCmDbObject)

  private
    FDescprod: TCmDbField;
    FFlgvariavel: TCmDbField;
    FLotevalidade: TCmDbField;
    FCodmenormed: TCmDbField;
    FIsentooutros: TCmDbField;
    FCodmedanalise: TCmDbField;
    FItemestocavel: TCmDbField;
    FCodproduto: TCmDbField;
    FCodmedcusto: TCmDbField;
    FCodgrupoprod: TCmDbField;
    FSituacaotrib: TCmDbField;
    FConsumorevenda: TCmDbField;
    FCodfiscalpadrao: TCmDbField;
    FDescrcompl: TCmDbField;

    procedure SetCodfiscalpadrao(const Value: TCmDbField);
    procedure SetCodgrupoprod(const Value: TCmDbField);
    procedure SetCodmedanalise(const Value: TCmDbField);
    procedure SetCodmedcusto(const Value: TCmDbField);
    procedure SetCodmenormed(const Value: TCmDbField);
    procedure SetCodproduto(const Value: TCmDbField);
    procedure SetConsumorevenda(const Value: TCmDbField);
    procedure SetDescprod(const Value: TCmDbField);
    procedure SetDescrcompl(const Value: TCmDbField);
    procedure SetFlgvariavel(const Value: TCmDbField);
    procedure SetItemestocavel(const Value: TCmDbField);
    procedure SetLotevalidade(const Value: TCmDbField);
    procedure SetSituacaotrib(const Value: TCmDbField);
    procedure SetIsentoOutros(const Value: TCmDbField);
  public
     Property CodProduto      : TCmDbField read FCodproduto write SetCodproduto;
     Property SituacaoTrib    : TCmDbField read FSituacaotrib write SetSituacaotrib;
     Property LoteValidade    : TCmDbField read FLotevalidade write SetLotevalidade;
     Property ItemEstocavel   : TCmDbField read FItemestocavel write SetItemestocavel;
     Property IsentoOutros    : TCmDbField read FIsentoOutros write SetIsentoOutros;
     Property FlgVariavel     : TCmDbField read FFlgvariavel write SetFlgvariavel;
     Property DescrCompl      : TCmDbField read FDescrcompl write SetDescrcompl;
     Property DescProd        : TCmDbField read FDescprod write SetDescprod;
     Property ConsumoRevenda  : TCmDbField read FConsumorevenda write SetConsumorevenda;
     Property CodMenorMed     : TCmDbField read FCodmenormed write SetCodmenormed;
     Property CodMedCusto     : TCmDbField read FCodmedcusto write SetCodmedcusto;
     Property CodMedAnalise   : TCmDbField read FCodmedanalise write SetCodmedanalise;
     Property CodGrupoProd    : TCmDbField read FCodgrupoprod write SetCodgrupoprod;
     Property CodFiscalPadrao : TCmDbField read FCodfiscalpadrao write SetCodfiscalpadrao;
     //
     Constructor Create(aOwner : TCmCustomCdbObject ); Override;
     //
     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     Function Delete :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbProduto }

constructor TDbProduto.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PRODUTO';

 fCodproduto      := CreateCmDbField('CODPRODUTO'    ,ftString,True,True);
 fSituacaotrib    := CreateCmDbField('SITUACAOTRIB'  ,ftfloat ,False,False);
 fLotevalidade    := CreateCmDbField('LOTEVALIDADE'  ,ftString,False,False);
 fItemestocavel   := CreateCmDbField('ITEMESTOCAVEL' ,ftString,False,False);
 fIsentooutros    := CreateCmDbField('ISENTOOUTROS'  ,ftString,False,False);
 fFlgvariavel     := CreateCmDbField('FLGVARIAVEL'   ,ftString,False,False); 
 fDescrcompl      := CreateCmDbField('DESCRCOMPL'    ,ftString,False,False);
 fDescprod        := CreateCmDbField('DESCPROD'      ,ftString,False,False); 
 fConsumorevenda  := CreateCmDbField('CONSUMOREVENDA',ftString,False,False);
 fCodmenormed     := CreateCmDbField('CODMENORMED'   ,ftString,False,False); 
 fCodmedcusto     := CreateCmDbField('CODMEDCUSTO'   ,ftString,False,False); 
 fCodmedanalise   := CreateCmDbField('CODMEDANALISE' ,ftString,False,False);
 fCodgrupoprod    := CreateCmDbField('CODGRUPOPROD'  ,ftString,False,False);
 fCodfiscalpadrao := CreateCmDbField('CODFISCALPADRAO',ftString,False,False);
end;
function TDbProduto.Delete: Boolean;
begin
   Result := Inherited Delete;
end;

function TDbProduto.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbProduto.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;

end;

procedure TDbProduto.SetCodfiscalpadrao(const Value: TCmDbField);
begin
  FCodfiscalpadrao := Value;
end;

procedure TDbProduto.SetCodgrupoprod(const Value: TCmDbField);
begin
  FCodgrupoprod := Value;
end;

procedure TDbProduto.SetCodmedanalise(const Value: TCmDbField);
begin
  FCodmedanalise := Value;
end;

procedure TDbProduto.SetCodmedcusto(const Value: TCmDbField);
begin
  FCodmedcusto := Value;
end;

procedure TDbProduto.SetCodmenormed(const Value: TCmDbField);
begin
  FCodmenormed := Value;
end;

procedure TDbProduto.SetCodproduto(const Value: TCmDbField);
begin
  FCodproduto := Value;
end;

procedure TDbProduto.SetConsumorevenda(const Value: TCmDbField);
begin
  FConsumorevenda := Value;
end;

procedure TDbProduto.SetDescprod(const Value: TCmDbField);
begin
  FDescprod := Value;
end;

procedure TDbProduto.SetDescrcompl(const Value: TCmDbField);
begin
  FDescrcompl := Value;
end;

procedure TDbProduto.SetFlgvariavel(const Value: TCmDbField);
begin
  FFlgvariavel := Value;
end;

procedure TDbProduto.SetIsentooutros(const Value: TCmDbField);
begin
  FIsentooutros := Value;
end;

procedure TDbProduto.SetItemestocavel(const Value: TCmDbField);
begin
  FItemestocavel := Value;
end;

procedure TDbProduto.SetLotevalidade(const Value: TCmDbField);
begin
  FLotevalidade := Value;
end;

procedure TDbProduto.SetSituacaotrib(const Value: TCmDbField);
begin
  FSituacaotrib := Value;
end;

function TDbProduto.Update: Boolean;
begin
   Result := Inherited UpDate;
end;

end.



