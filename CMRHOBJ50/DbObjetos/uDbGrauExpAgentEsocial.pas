//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da db
//Responsável: Felipe A. Santos
//Descrição: criação da db.
//******************************************************************************

unit uDbGrauExpAgentEsocial;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
    TDbGrauExpAgentEsocial = class(TCmDbObject)
    private
    FIdGrauExpAgentEsocial: TCmDbField;
    FCodigoEsocial: TCmDbField;
    FIdPessoa: TCmDbField;
    FDescricao: TCmDbField;

    protected
      function Insert : boolean; override;
    public
      constructor Create(AOwner: TCmCustomCdbObject); override;

      property IdGrauExpAgentEsocial : TCmDbField read FIdGrauExpAgentEsocial write FIdGrauExpAgentEsocial;
      property CodigoEsocial : TCmDbField read FCodigoEsocial write FCodigoEsocial;
      property Descricao : TCmDbField read FDescricao write FDescricao;
      property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
    end;


implementation

{ TDbGrauExpAgentEsocial }

constructor TDbGrauExpAgentEsocial.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'GRAUEXPAGENTESOCIAL';

  FIdGrauExpAgentEsocial := CreateCmDbField('IDGRAUEXPAGENTESOCIAL', ftFloat, True, True, False, True, '');
  FCodigoEsocial := CreateCmDbField('CODIGOESOCIAL', ftFloat, False, False, False, True, '');
  FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, True, False, False, True, '');
  FDescricao := CreateCmDbField('DESCRICAO', ftString, True, True, False, True, '');
end;

function TDbGrauExpAgentEsocial.Insert: boolean;
begin
  FIdGrauExpAgentEsocial.AsFloat := GetSequence('GRAUEXPAGENTESOCIAL');
  Result := inherited Insert;
end;

end.
