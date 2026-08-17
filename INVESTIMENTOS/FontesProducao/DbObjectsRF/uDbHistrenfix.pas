//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_1
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação da OperRenfix, HistRenfix
//             OperRenfixCurvas e HistRenfixXitens para a Integração de Bloqueio
//             de Penhora com o Jurídico

unit uDbHistrenfix;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistrenfix = class(TCmDbObject)

  private
    FIdoperrenfixaplic: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FHistmovrenfix: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FQtdhistrenfix: TCmDbField;
    FIdempresaprop: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FPlncodigo: TCmDbField;
    FIdinvestimento: TCmDbField;
    FSaldoqtdhistrenfi: TCmDbField;
    FCoddocumento: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdhistrenfix: TCmDbField;
    FTipmovhisrenfix: TCmDbField;
    FIdplanprevctbpatr: TCmDbField;
    FSaldovlrhistrenfi: TCmDbField;
    FIdoperrenfixorig: TCmDbField;
    FIdoperrenfix: TCmDbField;
    FDatahistrenfix: TCmDbField;
    FFlgrecalc: TCmDbField;
    FNaturmovhistrenfi: TCmDbField;
    FVlrhistrenfix: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetDatahistrenfix(const Value: TCmDbField);
    procedure SetFlgrecalc(const Value: TCmDbField);
    procedure SetHistmovrenfix(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdhistrenfix(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdoperrenfix(const Value: TCmDbField);
    procedure SetIdoperrenfixaplic(const Value: TCmDbField);
    procedure SetIdoperrenfixorig(const Value: TCmDbField);
    procedure SetIdplanprevctbpatr(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetNaturmovhistrenfi(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetQtdhistrenfix(const Value: TCmDbField);
    procedure SetSaldoqtdhistrenfi(const Value: TCmDbField);
    procedure SetSaldovlrhistrenfi(const Value: TCmDbField);
    procedure SetTipmovhisrenfix(const Value: TCmDbField);
    procedure SetVlrhistrenfix(const Value: TCmDbField);

  public

     Property Vlrhistrenfix: TCmDbField read FVlrhistrenfix write SetVlrhistrenfix;
     Property Tipmovhisrenfix: TCmDbField read FTipmovhisrenfix write SetTipmovhisrenfix;
     Property Saldovlrhistrenfi: TCmDbField read FSaldovlrhistrenfi write SetSaldovlrhistrenfi;
     Property Saldoqtdhistrenfi: TCmDbField read FSaldoqtdhistrenfi write SetSaldoqtdhistrenfi;
     Property Qtdhistrenfix: TCmDbField read FQtdhistrenfix write SetQtdhistrenfix;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Naturmovhistrenfi: TCmDbField read FNaturmovhistrenfi write SetNaturmovhistrenfi;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idplanprevctbpatr: TCmDbField read FIdplanprevctbpatr write SetIdplanprevctbpatr;
     Property Idoperrenfixorig: TCmDbField read FIdoperrenfixorig write SetIdoperrenfixorig;
     Property Idoperrenfixaplic: TCmDbField read FIdoperrenfixaplic write SetIdoperrenfixaplic;
     Property Idoperrenfix: TCmDbField read FIdoperrenfix write SetIdoperrenfix;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Idhistrenfix: TCmDbField read FIdhistrenfix write SetIdhistrenfix;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Histmovrenfix: TCmDbField read FHistmovrenfix write SetHistmovrenfix;
     Property Flgrecalc: TCmDbField read FFlgrecalc write SetFlgrecalc;
     Property Datahistrenfix: TCmDbField read FDatahistrenfix write SetDatahistrenfix;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistrenfix }

constructor TDbHistrenfix.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTRENFIX';

   fVlrhistrenfix := CreateCmDbField('VLRHISTRENFIX',ftfloat,False,False,False,True,'');
   fTipmovhisrenfix := CreateCmDbField('TIPMOVHISRENFIX',ftString,False,False,False,True,'');
   fSaldovlrhistrenfi := CreateCmDbField('SALDOVLRHISTRENFI',ftfloat,False,False,False,True,'');
   fSaldoqtdhistrenfi := CreateCmDbField('SALDOQTDHISTRENFI',ftfloat,False,False,False,True,'');
   fQtdhistrenfix := CreateCmDbField('QTDHISTRENFIX',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fNaturmovhistrenfi := CreateCmDbField('NATURMOVHISTRENFI',ftString,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdplanprevctbpatr := CreateCmDbField('IDPLANPREVCTBPATR',ftfloat,False,False,False,True,'');
   fIdoperrenfixorig := CreateCmDbField('IDOPERRENFIXORIG',ftfloat,False,False,False,True,'');
   fIdoperrenfixaplic := CreateCmDbField('IDOPERRENFIXAPLIC',ftfloat,False,False,False,True,'');
   fIdoperrenfix := CreateCmDbField('IDOPERRENFIX',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,False,False,False,True,'');
   fIdhistrenfix := CreateCmDbField('IDHISTRENFIX',ftfloat,True,True,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
   fHistmovrenfix := CreateCmDbField('HISTMOVRENFIX',ftString,False,False,False,True,'');
   fFlgrecalc := CreateCmDbField('FLGRECALC',ftString,False,False,False,True,'');
   fDatahistrenfix := CreateCmDbField('DATAHISTRENFIX',ftDateTime,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
end;

function TDbHistrenfix.Insert: Boolean;
begin

   fIdhistrenfix.AsFloat := GetSequence('HISTRENFIX');
   Result := Inherited Insert;

end;


procedure TDbHistrenfix.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbHistrenfix.SetDatahistrenfix(const Value: TCmDbField);
begin
  FDatahistrenfix := Value;
end;

procedure TDbHistrenfix.SetFlgrecalc(const Value: TCmDbField);
begin
  FFlgrecalc := Value;
end;

procedure TDbHistrenfix.SetHistmovrenfix(const Value: TCmDbField);
begin
  FHistmovrenfix := Value;
end;

procedure TDbHistrenfix.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbHistrenfix.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbHistrenfix.SetIdhistrenfix(const Value: TCmDbField);
begin
  FIdhistrenfix := Value;
end;

procedure TDbHistrenfix.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbHistrenfix.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbHistrenfix.SetIdoperrenfix(const Value: TCmDbField);
begin
  FIdoperrenfix := Value;
end;

procedure TDbHistrenfix.SetIdoperrenfixaplic(const Value: TCmDbField);
begin
  FIdoperrenfixaplic := Value;
end;

procedure TDbHistrenfix.SetIdoperrenfixorig(const Value: TCmDbField);
begin
  FIdoperrenfixorig := Value;
end;

procedure TDbHistrenfix.SetIdplanprevctbpatr(const Value: TCmDbField);
begin
  FIdplanprevctbpatr := Value;
end;

procedure TDbHistrenfix.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbHistrenfix.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbHistrenfix.SetNaturmovhistrenfi(const Value: TCmDbField);
begin
  FNaturmovhistrenfi := Value;
end;

procedure TDbHistrenfix.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbHistrenfix.SetQtdhistrenfix(const Value: TCmDbField);
begin
  FQtdhistrenfix := Value;
end;

procedure TDbHistrenfix.SetSaldoqtdhistrenfi(const Value: TCmDbField);
begin
  FSaldoqtdhistrenfi := Value;
end;

procedure TDbHistrenfix.SetSaldovlrhistrenfi(const Value: TCmDbField);
begin
  FSaldovlrhistrenfi := Value;
end;

procedure TDbHistrenfix.SetTipmovhisrenfix(const Value: TCmDbField);
begin
  FTipmovhisrenfix := Value;
end;

procedure TDbHistrenfix.SetVlrhistrenfix(const Value: TCmDbField);
begin
  FVlrhistrenfix := Value;
end;

end.



