{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Nº SOL: 229871/16137
 Nº PPM: 407073
 Data da Alteração: 02/10/2014
 Alteração Form: criação da Db
 Responsável: Felipe A. Santos
 Descrição: criação da Db para armazenar o dados da cessão
--------------------------------------------------------------------------------}

unit uDbDadosCessao;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type

    TDbDadosCessao = class(TCmDbObject)
    private

      FDataAmissao: TCmDbField;
      FCNPJ: TCmDbField;
      FIdDadosCessao: TCmDbField;

      //Everson Cunha - SIG38475 - Ini
      //FOnusCessao: TCmDbField;
      FMatricula: TCmDbField;
      FCodigoEsocial: TCmDbField;
      //Everson Cunha - SIG38475 - Fim

    protected
       function Insert : boolean; override;
    public
       constructor Create(AOwner: TCmCustomCdbObject); override;
       property IdDadosCessao : TCmDbField read FIdDadosCessao write FIdDadosCessao;
       property CNPJ : TCmDbField read FCNPJ write FCNPJ;
       property DataAmissao : TCmDbField read FDataAmissao write FDataAmissao;

       //Everson Cunha - SIG38475 - Ini
       //property OnusCessao : TCmDbField read FOnusCessao write FOnusCessao;
       property CodigoEsocial : TCmDbField read FCodigoEsocial write FCodigoEsocial;
       property Matricula : TCmDbField read FMatricula write FMatricula;
       //Everson Cunha - SIG38475 - Fim
    end;

implementation

{ TDadosCessao }

constructor TDbDadosCessao.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'DADOSCESSAO';

  FIdDadosCessao := CreateCmDbField('IDDADOSCESSAO', ftFloat, True, True, False, True, '');
  FDataAmissao := CreateCmDbField('DATAADMISSAO', ftDateTime, False, False, False, True, '');
  FCNPJ := CreateCmDbField('CNPJ', ftFloat, False, False, False, True, '');

  //Everson Cunha - SIG38475 - Ini
  //FOnusCessao := CreateCmDbField('ONUSCESSAO', ftFloat, False, False, False, True, '');
  FCodigoEsocial := CreateCmDbField('CODIGOESOCIAL', ftFloat, False, False, False, True, '');
  FMatricula := CreateCmDbField('MATRICULA', ftString, False, False, False, True, '');
  //Everson Cunha - SIG38475 - Fim
end;

function TDbDadosCessao.Insert: boolean;
begin
  IdDadosCessao.AsFloat := GetSequence('DADOSCESSAO');
  Result := inherited Insert;
end;

end.
