//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_1
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação da OperRenfix, HistRenfix
//             OperRenfixCurvas e HistRenfixXitens para a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************

unit uDbOperrenfixxcurvas;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbOperrenfixxcurvas = class(TCmDbObject)

  private
    FVlrcurva: TCmDbField;
    FIditemrenfix: TCmDbField;
    FTxjuros: TCmDbField;
    FIdoperrenfix: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdcurvarenfix: TCmDbField;
    FPerccurva: TCmDbField;
    FMoecodigo: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetIdcurvarenfix(const Value: TCmDbField);
    procedure SetIditemrenfix(const Value: TCmDbField);
    procedure SetIdoperrenfix(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetPerccurva(const Value: TCmDbField);
    procedure SetTxjuros(const Value: TCmDbField);
    procedure SetVlrcurva(const Value: TCmDbField);

  public

     Property Vlrcurva: TCmDbField read FVlrcurva write SetVlrcurva;
     Property Txjuros: TCmDbField read FTxjuros write SetTxjuros;
     Property Perccurva: TCmDbField read FPerccurva write SetPerccurva;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idoperrenfix: TCmDbField read FIdoperrenfix write SetIdoperrenfix;
     Property Iditemrenfix: TCmDbField read FIditemrenfix write SetIditemrenfix;
     Property Idcurvarenfix: TCmDbField read FIdcurvarenfix write SetIdcurvarenfix;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbOperrenfixxcurvas }

constructor TDbOperrenfixxcurvas.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OPERRENFIXXCURVAS';

   fVlrcurva := CreateCmDbField('VLRCURVA',ftfloat,False,False,False,True,'');
   fTxjuros := CreateCmDbField('TXJUROS',ftfloat,False,False,False,True,'');
   fPerccurva := CreateCmDbField('PERCCURVA',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdoperrenfix := CreateCmDbField('IDOPERRENFIX',ftfloat,True,True,False,True,'');
   fIditemrenfix := CreateCmDbField('IDITEMRENFIX',ftfloat,True,True,False,True,'');
   fIdcurvarenfix := CreateCmDbField('IDCURVARENFIX',ftfloat,True,True,False,True,'');
end;

function TDbOperrenfixxcurvas.Insert: Boolean;
begin

   Result := Inherited Insert;
end;

procedure TDbOperrenfixxcurvas.SetIdcurvarenfix(const Value: TCmDbField);
begin
  FIdcurvarenfix := Value;
end;

procedure TDbOperrenfixxcurvas.SetIditemrenfix(const Value: TCmDbField);
begin
  FIditemrenfix := Value;
end;

procedure TDbOperrenfixxcurvas.SetIdoperrenfix(const Value: TCmDbField);
begin
  FIdoperrenfix := Value;
end;

procedure TDbOperrenfixxcurvas.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbOperrenfixxcurvas.SetPerccurva(const Value: TCmDbField);
begin
  FPerccurva := Value;
end;

procedure TDbOperrenfixxcurvas.SetTxjuros(const Value: TCmDbField);
begin
  FTxjuros := Value;
end;

procedure TDbOperrenfixxcurvas.SetVlrcurva(const Value: TCmDbField);
begin
  FVlrcurva := Value;
end;

end.



