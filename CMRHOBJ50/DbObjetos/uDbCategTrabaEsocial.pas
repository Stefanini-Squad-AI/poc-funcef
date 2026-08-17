//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da Db
//Responsável: Felipe A. Santos
//Descrição: criação da Db para armazenar a categoria dos trabalhadores
//******************************************************************************

unit uDbCategTrabaEsocial;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
    TDbCategTrabaEsocial = class(TCmDbObject)
    private
      FIdPessoa: TCmDbField;
      FCodigoEsocial: TCmDbField;
      FIdCategTrabaEsocial: TCmDbField;
      FGrupo: TCmDbField;
      FDescricao: TCmDbField;

    protected
      function Insert : boolean; override;
    public
      constructor Create(AOwner: TCmCustomCdbObject); override;

      property IdCategTrabaEsocial : TCmDbField read FIdCategTrabaEsocial write FIdCategTrabaEsocial;
      property CodigoEsocial : TCmDbField read FCodigoEsocial write FCodigoEsocial;
      property Grupo : TCmDbField read FGrupo write FGrupo;
      property Descricao : TCmDbField read FDescricao write FDescricao;
      property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
    end;

implementation

{ TDbCategTrabaEsocial }

constructor TDbCategTrabaEsocial.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'CATEGTRABAESOCIAL';

  FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, False, False, False, True, '');
  FCodigoEsocial := CreateCmDbField('CODIGOESOCIAL', ftFloat, False, False, False, True, '');
  FIdCategTrabaEsocial := CreateCmDbField('IDCATEGTRABAESOCIAL', ftFloat, True, True, False, True, '');
  FGrupo := CreateCmDbField('GRUPO', ftFloat, False, False, False, True, '');
  FDescricao := CreateCmDbField('DESCRICAO', ftFloat, False, False, False, True, '');
end;


function TDbCategTrabaEsocial.Insert: boolean;
begin
  FIdCategTrabaEsocial.AsFloat := GetSequence('CATEGTRABAESOCIAL');
  Result := inherited Insert;
end;

end.
