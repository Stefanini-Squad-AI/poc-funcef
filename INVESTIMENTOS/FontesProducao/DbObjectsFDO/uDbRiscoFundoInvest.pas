{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/05/2006                             }
{                                                       }
{*******************************************************}

unit uDbRiscoFundoInvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRiscoFundoInvest = class(TCmDbObject)

  private
    FNomeriscofundo: TCmDbField;
    FSiglariscofundo: TCmDbField;
    FIdriscofundoinvest: TCmDbField;
    procedure SetIdriscofundoinvest(const Value: TCmDbField);
    procedure SetNomeriscofundo(const Value: TCmDbField);
    procedure SetSiglariscofundo(const Value: TCmDbField);

  public

     Property Siglariscofundo: TCmDbField read FSiglariscofundo write SetSiglariscofundo;
     Property Nomeriscofundo: TCmDbField read FNomeriscofundo write SetNomeriscofundo;
     Property Idriscofundoinvest: TCmDbField read FIdriscofundoinvest write SetIdriscofundoinvest;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRiscoFundoInvest }

constructor TDbRiscoFundoInvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RISCOFUNDOINVEST';

   fSiglariscofundo := CreateCmDbField('SIGLARISCOFUNDO',ftString,False,False,False,True,'Descrição');
   fNomeriscofundo := CreateCmDbField('NOMERISCOFUNDO',ftString,False,False,False,True,'Sigla');
   fIdriscofundoinvest := CreateCmDbField('IDRISCOFUNDOINVES',ftfloat,True,True,False,True,'');
end;

function TDbRiscoFundoInvest.Insert: Boolean;
begin

   fIdriscofundoinvest.AsFloat := GetSequence('RISCOFUNDOINVEST');
   Result := Inherited Insert;

end;


procedure TDbRiscoFundoInvest.SetIdriscofundoinvest(
  const Value: TCmDbField);
begin
  FIdriscofundoinvest := Value;
end;

procedure TDbRiscoFundoInvest.SetNomeriscofundo(const Value: TCmDbField);
begin
  FNomeriscofundo := Value;
end;

procedure TDbRiscoFundoInvest.SetSiglariscofundo(const Value: TCmDbField);
begin
  FSiglariscofundo := Value;
end;

end.



