//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da db
//Responsável: Felipe A. Santos
//Descrição: criação da db para armazenar os dados dos agentes de integração.
//******************************************************************************

unit uDbAgenteIntegracao;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type

   TDbAgenteIntegracao = class(TCmDbObject)
   private
     FIdPessoa: TCmDbField;
     FIdAgenteInt: TCmDbField;
   protected
     function Insert : boolean; override;
   public
     constructor Create(AOwner: TCmCustomCdbObject); override;

     property IdAgenteInt : TCmDbField read FIdAgenteInt write FIdAgenteInt;
     property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
   end;


implementation

{ TDbAgenteIntegracao }

constructor TDbAgenteIntegracao.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'AGENTEINT';
  
  FIdAgenteInt := CreateCmDbField('IDAGENTEINT', ftFloat, True, True, False, True, '');
  FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, True, False, False, True, '');
end;

function TDbAgenteIntegracao.Insert: boolean;
begin
  FIdAgenteInt.AsFloat := GetSequence('AGENTEINT');
  Result := inherited Insert;
end;

end.
