{--------------------------------------------------------------------------------------------------
Nº SOL............: 229881.16650
Nº PPM............: 566001
Data da Alteração.: 03/03/2015
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 229881 -
                    Registro de Estabilidade Funcional.
--------------------------------------------------------------------------------------------------
}

unit uDbEstabilidade;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
   TDbEstabilidade = class(TCmDbObject)

   private
    FIdEstabilidade: TCmDbField;
    FIdPessoa: TCmDbField;
    FMotivoestab: TCmDbField;
    FDatainicio: TCmDbField;
    FDatafim: TCmDbField;
    FObservacao: TCmDbField;

   protected
       function Insert : boolean; override;
   public
     constructor Create(AOwner: TCmCustomCdbObject) ; override;

     property IdEstabilidade: TCmDbField read FIdEstabilidade write FIdEstabilidade;
     property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
     property Motivoestab : TCmDbField read FMotivoestab write FMotivoestab;
     property Datainicio : TCmDbField read FDatainicio write FDatainicio;
     property Datafim : TCmDbField read FDatafim write FDatafim;
     property Observacao : TCmDbField read FObservacao write FObservacao;
   end;

implementation

{ TDbEstagiario }

constructor TDbEstabilidade.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'Estabilidade';

  FIdEstabilidade := CreateCmDbField('IDESTABILIDADE', ftFloat, True, True, False, True,'');
  FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, True, False, False, True,'');
  FMotivoestab := CreateCmDbField('MOTIVOESTAB', ftFloat, True, False, False, True,'');
  FDatainicio := CreateCmDbField('DATAINICIO', ftString, True, False, False, True,'');
  FDatafim := CreateCmDbField('DATAFIM', ftString, False, False, False, True,'');
  FObservacao := CreateCmDbField('OBSERVACAO', ftString, False, False, False, True,'');
end;

function TDbEstabilidade.Insert: boolean;
begin
  FIdEstabilidade.AsFloat := GetSequence('ESTABILIDADE');
  Result := inherited Insert;
end;

end.
