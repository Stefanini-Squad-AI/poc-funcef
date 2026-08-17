unit uDbRubxEvento;

{***************************************************************************************
Nº SOL....: 191668
Nº KINTANA: 1820235
Data da Alteração: 29/11/2014
Alteração: criação da estrutura para preenchimento da tabela RubxEvento
Responsável: Edilaine
Descrição:  Trocar o tipo de cadastro de radio group para grid na aba "Incidência de
            Eventos" do cadastro de rubricas salariais
****************************************************************************************}


interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbRubxEvento = class(TCmDbObject)
  private
    FIDMOTIVO: TCmDbField;
    FIDPROVENTO: TCmDbField;
    FIDREGRACALC: TCmDbField;
    procedure SetIDMOTIVO(const Value: TCmDbField);
    procedure SetIDPROVENTO(const Value: TCmDbField);
    procedure SetIDREGRACALC(const Value: TCmDbField);

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property  IDPROVENTO  : TCmDbField read FIDPROVENTO write SetIDPROVENTO;
    property  IDMOTIVO    : TCmDbField read FIDMOTIVO write SetIDMOTIVO;
    property  IDREGRACALC : TCmDbField read FIDREGRACALC write SetIDREGRACALC;
    
end;

implementation

{ TDbProvDesc }

constructor TDbRubxEvento.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RUBXEVENTO';

  FIdProvento  := CreateCmDbField('IdProvento' ,ftFloat,true,true,false,true,'');
  FIdMotivo    := CreateCmDbField('IdMotivo'   ,ftFloat,true,true,false,true,'');
  FIdRegraCalc := CreateCmDbField('IdRegraCalc',ftFloat,false,false,false,true,'');

end;

function TDbRubxEvento.Insert: boolean;
begin
  Result := inherited Insert;
end;

procedure TDbRubxEvento.SetIDMOTIVO(const Value: TCmDbField);
begin
  FIDMOTIVO := Value;
end;

procedure TDbRubxEvento.SetIDPROVENTO(const Value: TCmDbField);
begin
  FIDPROVENTO := Value;
end;

procedure TDbRubxEvento.SetIDREGRACALC(const Value: TCmDbField);
begin
  FIDREGRACALC := Value;
end;

end.
 