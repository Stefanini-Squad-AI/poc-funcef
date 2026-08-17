unit uDbMerito;

{--------------------------------------------------------------------------------------------------
Roina............: cricação da funcionalidade
Nº SIG...........: 39701
Data da Alteração: 01/06/2014
Responsável......: Edilaine
Descrição........: Inclusão funcionalidade Transações > Registro de Mérito
--------------------------------------------------------------------------------------------------}

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
   TDbMerito = class(TCmDbObject)

   private
    FIdMeritoFunc: TCmDbField;
    FIdPessoa: TCmDbField;
    FDataOcorre: TCmDbField;
    FPontuacao: TCmDbField;
    FMotivo: TCmDbField;
    FObservacao: TCmDbField;

   protected
     function Insert : boolean; override;

   public
     constructor Create(AOwner: TCmCustomCdbObject) ; override;

     property IdMeritoFunc : TCmDbField read FIdMeritoFunc write FIdMeritoFunc;
     property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
     property DataOcorre : TCmDbField read FDataOcorre write FDataOcorre;
     property Pontuacao : TCmDbField read FPontuacao write FPontuacao;
     property Motivo : TCmDbField read FMotivo write FMotivo;
     property Observacao : TCmDbField read FObservacao write FObservacao;
   end;

implementation

{ TDbMerito }

constructor TDbMerito.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'MERITOFUNC';

  FIdMeritoFunc := CreateCmDbField('IDMERITOFUNC', ftFloat, True, True, False, True,'');
  FIdPessoa     := CreateCmDbField('IDPESSOA', ftFloat, True, False, False, True,'');
  FDataOcorre   := CreateCmDbField('DATAOCORRENCIA', ftDateTime, False, False, False, True,'');
  FPontuacao    := CreateCmDbField('PONTUACAO', ftFloat, False, False, False, True,'');
  FMotivo       := CreateCmDbField('MOTIVO', ftString, False, False, False, True,'');
  FObservacao   := CreateCmDbField('OBS', ftString, False, False, False, True,'');
end;

function TDbMerito.Insert: boolean;
begin
  FIdMeritoFunc.AsFloat := GetSequence('MERITOFUNC');
  Result := inherited Insert;
end;

end.
