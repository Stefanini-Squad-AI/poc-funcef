{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/04/2006                             }
{                                                       }
{*******************************************************}

unit uDbHistcustodia;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistcustodia = class(TCmDbObject)

  private
    FSaldobloqueado: TCmDbField;
    FIdinvestimento: TCmDbField;
    FDatamovcustod: TCmDbField;
    FSaldoqtdecpmf: TCmDbField;
    FIdcustodia: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FIdopercustodia: TCmDbField;
    FTipocustodia: TCmDbField;
    FFlgcontainvest: TCmDbField;
    FIdcustodiante: TCmDbField;
    FIdoperacaoinvest: TCmDbField;
    FFlgcalcsaldo: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FIdmotivobloqueio: TCmDbField;
    FSaldoliberado: TCmDbField;
    FQtdemovcustod: TCmDbField;
    FIdlote: TCmDbField;
    procedure SetDatamovcustod(const Value: TCmDbField);
    procedure SetFlgcalcsaldo(const Value: TCmDbField);
    procedure SetFlgcontainvest(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcustodia(const Value: TCmDbField);
    procedure SetIdcustodiante(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdmotivobloqueio(const Value: TCmDbField);
    procedure SetIdoperacaoinvest(const Value: TCmDbField);
    procedure SetIdopercustodia(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetQtdemovcustod(const Value: TCmDbField);
    procedure SetSaldobloqueado(const Value: TCmDbField);
    procedure SetSaldoliberado(const Value: TCmDbField);
    procedure SetSaldoqtdecpmf(const Value: TCmDbField);
    procedure SetTipocustodia(const Value: TCmDbField);

  public

     Property Tipocustodia: TCmDbField read FTipocustodia write SetTipocustodia;
     Property Saldoqtdecpmf: TCmDbField read FSaldoqtdecpmf write SetSaldoqtdecpmf;
     Property Saldoliberado: TCmDbField read FSaldoliberado write SetSaldoliberado;
     Property Saldobloqueado: TCmDbField read FSaldobloqueado write SetSaldobloqueado;
     Property Qtdemovcustod: TCmDbField read FQtdemovcustod write SetQtdemovcustod;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idopercustodia: TCmDbField read FIdopercustodia write SetIdopercustodia;
     Property Idoperacaoinvest: TCmDbField read FIdoperacaoinvest write SetIdoperacaoinvest;
     Property Idmotivobloqueio: TCmDbField read FIdmotivobloqueio write SetIdmotivobloqueio;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idcustodiante: TCmDbField read FIdcustodiante write SetIdcustodiante;
     Property Idcustodia: TCmDbField read FIdcustodia write SetIdcustodia;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Flgcontainvest: TCmDbField read FFlgcontainvest write SetFlgcontainvest;
     Property Flgcalcsaldo: TCmDbField read FFlgcalcsaldo write SetFlgcalcsaldo;
     Property Datamovcustod: TCmDbField read FDatamovcustod write SetDatamovcustod;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistcustodia }

constructor TDbHistcustodia.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTCUSTODIA';

   fTipocustodia := CreateCmDbField('TIPOCUSTODIA',ftString,False,False,False,True,'');
   fSaldoqtdecpmf := CreateCmDbField('SALDOQTDECPMF',ftfloat,False,False,False,True,'');
   fSaldoliberado := CreateCmDbField('SALDOLIBERADO',ftfloat,False,False,False,True,'');
   fSaldobloqueado := CreateCmDbField('SALDOBLOQUEADO',ftfloat,False,False,False,True,'');
   fQtdemovcustod := CreateCmDbField('QTDEMOVCUSTOD',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'');
   fIdopercustodia := CreateCmDbField('IDOPERCUSTODIA',ftfloat,False,False,False,True,'');
   fIdoperacaoinvest := CreateCmDbField('IDOPERACAOINVEST',ftfloat,False,False,False,True,'');
   fIdmotivobloqueio := CreateCmDbField('IDMOTIVOBLOQUEIO',ftfloat,False,False,False,True,'');
   fIdlote := CreateCmDbField('IDLOTE',ftString,False,False,False,True,'');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'');
   fIdcustodiante := CreateCmDbField('IDCUSTODIANTE',ftfloat,False,False,False,True,'');
   fIdcustodia := CreateCmDbField('IDCUSTODIA',ftfloat,True,True,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
   fFlgcontainvest := CreateCmDbField('FLGCONTAINVEST',ftfloat,False,False,False,True,'');
   fFlgcalcsaldo := CreateCmDbField('FLGCALCSALDO',ftString,False,False,False,True,'');
   fDatamovcustod := CreateCmDbField('DATAMOVCUSTOD',ftDateTime,False,False,False,True,'');
end;

function TDbHistcustodia.Insert: Boolean;
begin

   fIdcustodia.AsFloat := GetSequence('HISTCUSTODIA');
   Result := Inherited Insert;

end;


procedure TDbHistcustodia.SetDatamovcustod(const Value: TCmDbField);
begin
  FDatamovcustod := Value;
end;

procedure TDbHistcustodia.SetFlgcalcsaldo(const Value: TCmDbField);
begin
  FFlgcalcsaldo := Value;
end;

procedure TDbHistcustodia.SetFlgcontainvest(const Value: TCmDbField);
begin
  FFlgcontainvest := Value;
end;

procedure TDbHistcustodia.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbHistcustodia.SetIdcustodia(const Value: TCmDbField);
begin
  FIdcustodia := Value;
end;

procedure TDbHistcustodia.SetIdcustodiante(const Value: TCmDbField);
begin
  FIdcustodiante := Value;
end;

procedure TDbHistcustodia.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbHistcustodia.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbHistcustodia.SetIdmotivobloqueio(const Value: TCmDbField);
begin
  FIdmotivobloqueio := Value;
end;

procedure TDbHistcustodia.SetIdoperacaoinvest(const Value: TCmDbField);
begin
  FIdoperacaoinvest := Value;
end;

procedure TDbHistcustodia.SetIdopercustodia(const Value: TCmDbField);
begin
  FIdopercustodia := Value;
end;

procedure TDbHistcustodia.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbHistcustodia.SetQtdemovcustod(const Value: TCmDbField);
begin
  FQtdemovcustod := Value;
end;

procedure TDbHistcustodia.SetSaldobloqueado(const Value: TCmDbField);
begin
  FSaldobloqueado := Value;
end;

procedure TDbHistcustodia.SetSaldoliberado(const Value: TCmDbField);
begin
  FSaldoliberado := Value;
end;

procedure TDbHistcustodia.SetSaldoqtdecpmf(const Value: TCmDbField);
begin
  FSaldoqtdecpmf := Value;
end;

procedure TDbHistcustodia.SetTipocustodia(const Value: TCmDbField);
begin
  FTipocustodia := Value;
end;

end.



