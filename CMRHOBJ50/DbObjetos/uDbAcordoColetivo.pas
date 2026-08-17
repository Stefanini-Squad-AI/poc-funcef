{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Nº SOL:            256944/17800
 Nº PPM             1082911
 Data da Alteração: 27/10/2015
 Alteração Form:    Criação da Db.
 Responsável:       Marcelo Cardoso
 Descrição:         Criação da aba ACT
--------------------------------------------------------------------------------}

unit uDbAcordoColetivo;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
    TDbAcordoColetivo = class(TCmDbObject)

    private
      FIdAcordoColetivo: TCmDbField;
      FIdFilialPessoa: TCmDbField;
      //FDtCompetencia : TCmDbField; //Everson Cunha - SIG38475
      FDtAssinatura : TCmDbField;
      FTipoAcordo : TCmDbField;

    protected
      function Insert : boolean; override;

    public
      constructor Create(AOwner: TCmCustomCdbObject); override;

      property IdAcordoColetivo: TCmDbField  read FIdAcordoColetivo write FIdAcordoColetivo;
      property IdFilialPessoa : TCmDbField  read FIdFilialPessoa write FIdFilialPessoa;
      //property DtCompetencia : TCmDbField  read FDtCompetencia write FDtCompetencia; //Everson Cunha - SIG38475
      property DtAssinatura : TCmDbField  read FDtassinatura write FDtassinatura;
      property TipoAcordo : TCmDbField  read FTipoAcordo write FTipoAcordo;

end;


implementation

{ TDbAcordoColetivo }

constructor TDbAcordoColetivo.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'ACORDOCOLETIVO';

  FIdAcordoColetivo := CreateCmDbField('IDACORDOCOLETIVO', ftFloat, True, True, False, False, '');
  FIdFilialPessoa := CreateCmDbField('IDFILIALPESSOA', ftFloat, True, False, False, True, '');
  //FDtCompetencia := CreateCmDbField('DTCOMPETENCIA', ftDateTime, False, False, False, True, ''); //Everson Cunha - SIG38475
  FDtAssinatura:= CreateCmDbField('DTASSINATURA', ftDateTime, False, False, False, True, '');
  FTipoAcordo := CreateCmDbField('TIPOACORDO', ftString, False, False, False, True, '');

end;


function TDbAcordoColetivo.Insert: boolean;
begin
 FIdAcordoColetivo.AsFloat := GetSequence('ACORDOCOLETIVO');
 Result := inherited Insert;
end;

end.
