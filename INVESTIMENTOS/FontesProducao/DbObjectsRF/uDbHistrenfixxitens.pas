//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_1
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação da OperRenfix, HistRenfix
//             OperRenfixCurvas e HistRenfixXitens para a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************

unit uDbHistrenfixxitens;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistrenfixxitens = class(TCmDbObject)

  private
    FIditemrenfix: TCmDbField;
    FIdcurvarenfix: TCmDbField;
    FIdhistrenfix: TCmDbField;
    FPuitem: TCmDbField;
    FVlritem: TCmDbField;
    FPuacuitem: TCmDbField;
    FVlracuitem: TCmDbField;
    FIdregracalculo: TCmDbField;
    procedure SetIdcurvarenfix(const Value: TCmDbField);
    procedure SetIdhistrenfix(const Value: TCmDbField);
    procedure SetIditemrenfix(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetPuacuitem(const Value: TCmDbField);
    procedure SetPuitem(const Value: TCmDbField);
    procedure SetVlracuitem(const Value: TCmDbField);
    procedure SetVlritem(const Value: TCmDbField);

  public

     Property Vlritem: TCmDbField read FVlritem write SetVlritem;
     Property Vlracuitem: TCmDbField read FVlracuitem write SetVlracuitem;
     Property Puitem: TCmDbField read FPuitem write SetPuitem;
     Property Puacuitem: TCmDbField read FPuacuitem write SetPuacuitem;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Iditemrenfix: TCmDbField read FIditemrenfix write SetIditemrenfix;
     Property Idhistrenfix: TCmDbField read FIdhistrenfix write SetIdhistrenfix;
     Property Idcurvarenfix: TCmDbField read FIdcurvarenfix write SetIdcurvarenfix;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistrenfixxitens }

constructor TDbHistrenfixxitens.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTRENFIXXITENS';

   fVlritem := CreateCmDbField('VLRITEM',ftfloat,False,False,False,True,'');
   fVlracuitem := CreateCmDbField('VLRACUITEM',ftfloat,False,False,False,True,'');
   fPuitem := CreateCmDbField('PUITEM',ftfloat,False,False,False,True,'');
   fPuacuitem := CreateCmDbField('PUACUITEM',ftfloat,False,False,False,True,'');
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,False,False,False,True,'');
   fIditemrenfix := CreateCmDbField('IDITEMRENFIX',ftfloat,True,True,False,True,'');
   fIdhistrenfix := CreateCmDbField('IDHISTRENFIX',ftfloat,True,True,False,True,'');
   fIdcurvarenfix := CreateCmDbField('IDCURVARENFIX',ftfloat,True,True,False,True,'');
end;

function TDbHistrenfixxitens.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbHistrenfixxitens.SetIdcurvarenfix(const Value: TCmDbField);
begin
  FIdcurvarenfix := Value;
end;

procedure TDbHistrenfixxitens.SetIdhistrenfix(const Value: TCmDbField);
begin
  FIdhistrenfix := Value;
end;

procedure TDbHistrenfixxitens.SetIditemrenfix(const Value: TCmDbField);
begin
  FIditemrenfix := Value;
end;

procedure TDbHistrenfixxitens.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDbHistrenfixxitens.SetPuacuitem(const Value: TCmDbField);
begin
  FPuacuitem := Value;
end;

procedure TDbHistrenfixxitens.SetPuitem(const Value: TCmDbField);
begin
  FPuitem := Value;
end;

procedure TDbHistrenfixxitens.SetVlracuitem(const Value: TCmDbField);
begin
  FVlracuitem := Value;
end;

procedure TDbHistrenfixxitens.SetVlritem(const Value: TCmDbField);
begin
  FVlritem := Value;
end;

end.



