//******************************************************************************
//Nº SOL: 229871/16137
//Nº PPM: 407073
//Data da Alteração: 02/10/2014
//Alteração Form: criação da db
//Responsável: Felipe A. Santos
//Descrição: criação da db para armazenar os dados das instituições de ensino.
//******************************************************************************

unit uDbInstituicaoEnsino;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
    TDbInstituicaoEnsino = class(TCmDbObject)
    private
      FIdInstituicaoEnsino: TCmDbField;
      FIdPessoa: TCmDbField;


    protected
       function Insert : boolean; override;
    public
      constructor Create(AOwner: TCmCustomCdbObject); override;

      property IdInstituicaoEnsino : TCmDbField read FIdInstituicaoEnsino write FIdInstituicaoEnsino;
      property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
    end;

implementation

{ TDbProvDesc }

constructor TDbInstituicaoEnsino.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'INSTITUICAOENSINO';
  FIdInstituicaoEnsino := CreateCmDbField('IDINSTITUICAOENSINO', ftFloat, True, True, False, True, '');
  FIdPessoa := CreateCmDbField('IDPESSOA', ftFloat, True, False, False, True, '');
end;

function TDbInstituicaoEnsino.Insert: boolean;
begin
  FIdInstituicaoEnsino.AsFloat := GetSequence('INSTITUICAOENSINO');
  Result := inherited Insert;
end;

end.
