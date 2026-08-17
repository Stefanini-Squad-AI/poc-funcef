{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbHistCaixa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistCaixa = class(TCmDbObject)

  private
    FIdhistcaixa: TCmDbField;
    FIdoperacaoinvest: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FDescinvestimento: TCmDbField;
    FIdoperacaodireito: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FSldhistcaixa: TCmDbField;
    FIdcarteiragerenc: TCmDbField;
    FIdcarteiraxevento: TCmDbField;
    FTipmovcaixa: TCmDbField;
    FVlrhistcaixa: TCmDbField;
    FDatahistcaixa: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetDatahistcaixa(const Value: TCmDbField);
    procedure SetDescinvestimento(const Value: TCmDbField);
    procedure SetIdcarteiragerenc(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcarteiraxevento(const Value: TCmDbField);
    procedure SetIdhistcaixa(const Value: TCmDbField);
    procedure SetIdoperacaodireito(const Value: TCmDbField);
    procedure SetIdoperacaoinvest(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetSldhistcaixa(const Value: TCmDbField);
    procedure SetTipmovcaixa(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrhistcaixa(const Value: TCmDbField);

  public

     Property Vlrhistcaixa: TCmDbField read FVlrhistcaixa write SetVlrhistcaixa;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipmovcaixa: TCmDbField read FTipmovcaixa write SetTipmovcaixa;
     Property Sldhistcaixa: TCmDbField read FSldhistcaixa write SetSldhistcaixa;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idoperacaoinvest: TCmDbField read FIdoperacaoinvest write SetIdoperacaoinvest;
     Property Idoperacaodireito: TCmDbField read FIdoperacaodireito write SetIdoperacaodireito;
     Property Idhistcaixa: TCmDbField read FIdhistcaixa write SetIdhistcaixa;
     Property Idcarteiraxevento: TCmDbField read FIdcarteiraxevento write SetIdcarteiraxevento;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Idcarteiragerenc: TCmDbField read FIdcarteiragerenc write SetIdcarteiragerenc;
     Property Descinvestimento: TCmDbField read FDescinvestimento write SetDescinvestimento;
     Property Datahistcaixa: TCmDbField read FDatahistcaixa write SetDatahistcaixa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistCaixa }

constructor TDbHistCaixa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTCAIXA';

   fVlrhistcaixa := CreateCmDbField('VLRHISTCAIXA',ftfloat,False,False,False,True,'Valor do Evento Caixa');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fTipmovcaixa := CreateCmDbField('TIPMOVCAIXA',ftString,False,False,False,True,'Tipo de Mov. de Caixa');
   fSldhistcaixa := CreateCmDbField('SLDHISTCAIXA',ftfloat,False,False,False,True,'Saldo do Caixa');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'Identifcador do Plano');
   fIdoperacaoinvest := CreateCmDbField('IDOPERACAOINVEST',ftfloat,False,False,False,True,'Identificador da Oper. Invest.');
   fIdoperacaodireito := CreateCmDbField('IDOPERACAODIREITO',ftfloat,False,False,False,True,'Identificador da Oper. Direito');
   fIdhistcaixa := CreateCmDbField('IDHISTCAIXA',ftfloat,True,True,False,True,'Identificador da tabela');
   fIdcarteiraxevento := CreateCmDbField('IDCARTEIRAXEVENTO',ftfloat,False,False,False,True,'Identificador Cart. X Evento');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'Identificador Cart. Invest.');
   fIdcarteiragerenc := CreateCmDbField('IDCARTEIRAGERENC',ftfloat,False,False,False,True,'Identificador Cart. Gerencial');
   fDescinvestimento := CreateCmDbField('DESCINVESTIMENTO',ftString,False,False,False,True,'Descrição do Investimento');
   fDatahistcaixa := CreateCmDbField('DATAHISTCAIXA',ftDateTime,False,False,False,True,'Data do Caixa');
end;

function TDbHistCaixa.Insert: Boolean;
begin

   fIdhistcaixa.AsFloat := GetSequence('HISTCAIXA');
   Result := Inherited Insert;

end;


procedure TDbHistCaixa.SetDatahistcaixa(const Value: TCmDbField);
begin
  FDatahistcaixa := Value;
end;

procedure TDbHistCaixa.SetDescinvestimento(const Value: TCmDbField);
begin
  FDescinvestimento := Value;
end;

procedure TDbHistCaixa.SetIdcarteiragerenc(const Value: TCmDbField);
begin
  FIdcarteiragerenc := Value;
end;

procedure TDbHistCaixa.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbHistCaixa.SetIdcarteiraxevento(const Value: TCmDbField);
begin
  FIdcarteiraxevento := Value;
end;

procedure TDbHistCaixa.SetIdhistcaixa(const Value: TCmDbField);
begin
  FIdhistcaixa := Value;
end;

procedure TDbHistCaixa.SetIdoperacaodireito(const Value: TCmDbField);
begin
  FIdoperacaodireito := Value;
end;

procedure TDbHistCaixa.SetIdoperacaoinvest(const Value: TCmDbField);
begin
  FIdoperacaoinvest := Value;
end;

procedure TDbHistCaixa.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbHistCaixa.SetSldhistcaixa(const Value: TCmDbField);
begin
  FSldhistcaixa := Value;
end;

procedure TDbHistCaixa.SetTipmovcaixa(const Value: TCmDbField);
begin
  FTipmovcaixa := Value;
end;

procedure TDbHistCaixa.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbHistCaixa.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbHistCaixa.SetVlrhistcaixa(const Value: TCmDbField);
begin
  FVlrhistcaixa := Value;
end;

end.



