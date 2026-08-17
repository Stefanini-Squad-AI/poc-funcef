{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbHistCota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistCota = class(TCmDbObject)

  private
    FIdcarteirainvest: TCmDbField;
    FIdhistcota: TCmDbField;
    FDatahistcota: TCmDbField;
    FIdcarteiragerenc: TCmDbField;
    FIdcarteiraxevento: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FVlrhistcota: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetDatahistcota(const Value: TCmDbField);
    procedure SetIdcarteiragerenc(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcarteiraxevento(const Value: TCmDbField);
    procedure SetIdhistcota(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrhistcota(const Value: TCmDbField);

  public

     Property Vlrhistcota: TCmDbField read FVlrhistcota write SetVlrhistcota;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idhistcota: TCmDbField read FIdhistcota write SetIdhistcota;
     Property Idcarteiraxevento: TCmDbField read FIdcarteiraxevento write SetIdcarteiraxevento;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Idcarteiragerenc: TCmDbField read FIdcarteiragerenc write SetIdcarteiragerenc;
     Property Datahistcota: TCmDbField read FDatahistcota write SetDatahistcota;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistCota }

constructor TDbHistCota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTCOTA';

   fVlrhistcota := CreateCmDbField('VLRHISTCOTA',ftfloat,False,False,False,True,'Valor da Cota');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'Id Plano');
   fIdhistcota := CreateCmDbField('IDHISTCOTA',ftfloat,True,True,False,True,'Id da tabela');
   fIdcarteiraxevento := CreateCmDbField('IDCARTEIRAXEVENTO',ftfloat,False,False,False,True,'Id Carteira x Evento');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'Id Carteira de Investimentos');
   fIdcarteiragerenc := CreateCmDbField('IDCARTEIRAGERENC',ftfloat,False,False,False,True,'Id Carteira Gerencial');
   fDatahistcota := CreateCmDbField('DATAHISTCOTA',ftDateTime,False,False,False,True,'Data da Cota');
end;

function TDbHistCota.Insert: Boolean;
begin

   fIdhistcota.AsFloat := GetSequence('HISTCOTA');
   Result := Inherited Insert;

end;


procedure TDbHistCota.SetDatahistcota(const Value: TCmDbField);
begin
  FDatahistcota := Value;
end;

procedure TDbHistCota.SetIdcarteiragerenc(const Value: TCmDbField);
begin
  FIdcarteiragerenc := Value;
end;

procedure TDbHistCota.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbHistCota.SetIdcarteiraxevento(const Value: TCmDbField);
begin
  FIdcarteiraxevento := Value;
end;

procedure TDbHistCota.SetIdhistcota(const Value: TCmDbField);
begin
  FIdhistcota := Value;
end;

procedure TDbHistCota.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbHistCota.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbHistCota.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbHistCota.SetVlrhistcota(const Value: TCmDbField);
begin
  FVlrhistcota := Value;
end;

end.



