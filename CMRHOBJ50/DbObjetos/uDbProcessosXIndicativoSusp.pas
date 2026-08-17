//***************************************************************************************
//Rotina             : Create
//N. SIG..........   : 62232
//Data da Alteração: : 06/02/2018
//Alteração Form:    : uDbProcessosXIndicativoSusp
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Alteração das características do campo IDPROCESSO. 
//***************************************************************************************
//Rotina             : Criação da classe
//N. SIG..........   : 38475.59780
//Data da Alteração: : 11/12/2017
//Alteração Form:    : uDbProcessosXIndicativoSusp
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Criação da classe de persistência para a tabela
//										 PROCESSOSXINDICATIVOSUSP
//***************************************************************************************
unit uDbProcessosXIndicativoSusp;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type TDbProcessosXIndicativoSusp = class(TCmDbObject)
	private
    fIdProcessosXIndicativoSusp: TCmDbField;
    fIdProcesso: TCmDbField;
    fIdIndicativoSusp: TCmDbField;
    fDataDecisao: TCmDbField;
    fIndicatDeposito: TCmDbField;

    procedure SetIdProcessosXIndicativoSusp(const Value: TCmDbField);
    procedure SetIdProcesso(const Value: TCmDbField);
    procedure SetIdIndicativoSusp(const Value: TCmDbField);
    procedure SetDataDecisao(const Value: TCmDbField);
    procedure SetIndicatDeposito(const Value: TCmDbField);
  protected
  	function Insert : Boolean; override;

  public
     property IdProcessosXIndicativoSusp: TCmDbField read FIdProcessosXIndicativoSusp write SetIdProcessosXIndicativoSusp;
     property IdProcesso: TCmDbField read fIdProcesso write SetIdProcesso;
     property IdIndicativoSusp: TCmDbField read fIdIndicativoSusp write SetIdIndicativoSusp;
     property DataDecisao: TCmDbField read fDataDecisao write SetDataDecisao;
     property IndicatDeposito: TCmDbField read fIndicatDeposito write SetIndicatDeposito;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbProcessosXIndicativoSusp }

constructor TDbProcessosXIndicativoSusp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROCESSOSXINDICATIVOSUSP';

  fIdProcessosXIndicativoSusp := CreateCmDbField('IDPROCESSOSXINDICATIVOSUSP', ftFloat, true, true, false, false, '');
  fIdProcesso := CreateCmDbField('IDPROCESSO', ftFloat, false, false, false, false, '');
  fIdIndicativoSusp := CreateCmDbField('IDINDICATIVOSUSP', ftFloat, false, false, false, false, '');
  fDataDecisao := CreateCmDbField('DATADECISAO', ftDate, false, false, false, false, '');
  fIndicatDeposito := CreateCmDbField('INDICATDEPOSITO', ftFloat, false, false, false, false, '');

end;

function TDbProcessosXIndicativoSusp.Insert: Boolean;
begin
  Result := inherited Insert;  
end;

procedure TDbProcessosXIndicativoSusp.SetDataDecisao(
  const Value: TCmDbField);
begin
  fDataDecisao := Value;
end;

procedure TDbProcessosXIndicativoSusp.SetidIndicativoSusp(
  const Value: TCmDbField);
begin
  fIdIndicativoSusp := Value;
end;

procedure TDbProcessosXIndicativoSusp.SetIdProcesso(
  const Value: TCmDbField);
begin
  fIdProcesso := Value;
end;

procedure TDbProcessosXIndicativoSusp.SetIdProcessosXIndicativoSusp(
  const Value: TCmDbField);
begin
  fIdProcessosXIndicativoSusp := Value;
end;

procedure TDbProcessosXIndicativoSusp.SetIndicatDeposito(
  const Value: TCmDbField);
begin
  fIndicatDeposito := Value;
end;

end.

