{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/10/2017                             }
{                                                       }
{*******************************************************}
//***************************************************************************************
//Rotina             : Criação da classe
//N. SIG..........   : 23656.57136
//Data da Alteração: : 27/10/2017
//Alteração Form:    : uDbProcessosXIndicativoSusp
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Criação da classe de persistência paara a tabela
//										 PROCESSOSXINDICATIVOSUSP
//***************************************************************************************
unit uDbProcessosXIndicativoSuspForn;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type TDbProcessosXIndicativoSuspForn = class(TCmDbObject)
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

constructor TDbProcessosXIndicativoSuspForn.Create(Aowner: TCmCustomCdbObject);
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

function TDbProcessosXIndicativoSuspForn.Insert: Boolean;
begin
  Result := inherited Insert;
end;

procedure TDbProcessosXIndicativoSuspForn.SetDataDecisao(
  const Value: TCmDbField);
begin
  fDataDecisao := Value;
end;

procedure TDbProcessosXIndicativoSuspForn.SetidIndicativoSusp(
  const Value: TCmDbField);
begin
  fIdIndicativoSusp := Value;
end;

procedure TDbProcessosXIndicativoSuspForn.SetIdProcesso(
  const Value: TCmDbField);
begin
  fIdProcesso := Value;
end;

procedure TDbProcessosXIndicativoSuspForn.SetIdProcessosXIndicativoSusp(
  const Value: TCmDbField);
begin
  fIdProcessosXIndicativoSusp := Value;
end;

procedure TDbProcessosXIndicativoSuspForn.SetIndicatDeposito(
  const Value: TCmDbField);
begin
  fIndicatDeposito := Value;
end;

end.
