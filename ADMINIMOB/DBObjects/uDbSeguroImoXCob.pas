{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 14/07/2004                             }
{                                                       }
{*******************************************************}

unit uDbSeguroImoXCob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSeguroImoXCob = class(TCmDbObject)

  private
    FDesccobertura: TCmDbField;
    FVlrcobertura: TCmDbField;
    FIdseguroimovel: TCmDbField;
    FNomecobertura: TCmDbField;
    FIdseguroimoxcob: TCmDbField;
    FVlrFundacao: TCmDbField;
    procedure SetDesccobertura(const Value: TCmDbField);
    procedure SetIdseguroimovel(const Value: TCmDbField);
    procedure SetIdseguroimoxcob(const Value: TCmDbField);
    procedure SetNomecobertura(const Value: TCmDbField);
    procedure SetVlrcobertura(const Value: TCmDbField);
    procedure SetVlrFundacao(const Value: TCmDbField);

  public
    Property Vlrcobertura: TCmDbField read FVlrcobertura write SetVlrcobertura;
    Property VlrFundacao: TCmDbField read FVlrFundacao write SetVlrFundacao;
    Property Nomecobertura: TCmDbField read FNomecobertura write SetNomecobertura;
    Property Idseguroimoxcob: TCmDbField read FIdseguroimoxcob write SetIdseguroimoxcob;
    Property Idseguroimovel: TCmDbField read FIdseguroimovel write SetIdseguroimovel;
    Property Desccobertura: TCmDbField read FDesccobertura write SetDesccobertura;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbSeguroImoXCob }

constructor TDbSeguroImoXCob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGUROIMOXCOB';

  fNomecobertura   := CreateCmDbField('NOMECOBERTURA',ftString,False,False,False,True,'Nome da Cobertura');
  fIdseguroimoxcob := CreateCmDbField('IDSEGUROIMOXCOB',ftfloat,True,True,False,True,'ID SeguroImoXCob');
  fIdseguroimovel  := CreateCmDbField('IDSEGUROIMOVEL',ftfloat,False,False,False,True,'ID Seguro Imóvel');
  fDesccobertura   := CreateCmDbField('DESCCOBERTURA',ftString,False,False,False,True,'Descrição da Cobertura');
  fVlrcobertura    := CreateCmDbField('VLRCOBERTURA',ftfloat,False,False,False,True,'Valor da Cobertura');
  fVlrFundacao     := CreateCmDbField('VLRFUNDACAO',ftfloat,False,False,False,True,'Valor da Cobertura de direito da fundação');
end;

function TDbSeguroImoXCob.Insert: Boolean;
begin
  fIdSeguroImoXCob.AsFloat := GetSequence('SEGUROIMOXCOB');
  Result := Inherited Insert;
end;


procedure TDbSeguroImoXCob.SetDesccobertura(const Value: TCmDbField);
begin
  FDesccobertura := Value;
end;

procedure TDbSeguroImoXCob.SetIdseguroimovel(const Value: TCmDbField);
begin
  FIdseguroimovel := Value;
end;

procedure TDbSeguroImoXCob.SetIdseguroimoxcob(const Value: TCmDbField);
begin
  FIdseguroimoxcob := Value;
end;

procedure TDbSeguroImoXCob.SetNomecobertura(const Value: TCmDbField);
begin
  FNomecobertura := Value;
end;

procedure TDbSeguroImoXCob.SetVlrcobertura(const Value: TCmDbField);
begin
  FVlrcobertura := Value;
end;

procedure TDbSeguroImoXCob.SetVlrFundacao(const Value: TCmDbField);
begin
  FVlrFundacao := Value;
end;

end.



