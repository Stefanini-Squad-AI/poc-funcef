{
********************************************************************************
RESPONSÁVEL.: William Santana
Nº SOL......: 199707
Nº KINTANA..: 1922320
Data........: 09/08/2013
Descrição...: Alteração na forma de Correção das Faixas Salariais.
********************************************************************************
}

unit uDBFaixaNivel;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbFaixaNivel = class(TCmDbObject)
  private

    FIdPessJur: TCmDbField;
    FIdNivel: TCmDbField;
    FIdNivelTESTE: TCmDbField;
    FIdFaixaSalExt: TCmDbField;
    FDataEfetivacao: TCmDbField;
    FValor: TCmDbField;                  

  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessJur: TCmDbField read FIdPessJur write FIdPessJur;
    property IdNivel: TCmDbField read FIdNivel write FIdNivel;
    property IdNivelTESTE: TCmDbField read FIdNivelTESTE write FIdNivelTESTE;
    property IdFaixaSalExt: TCmDbField read FIdFaixaSalExt write FIdFaixaSalExt;
    property DataEfetivacao: TCmDbField read FDataEfetivacao write FDataEfetivacao;
    property Valor: TCmDbField read FValor write FValor;

  end;

implementation

{ TDbFaixaNivel }

constructor TDbFaixaNivel.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FAIXANIVEL';

  FIdPessJur := CreateCmDbField('IdPessJur',ftInteger,true,false,false,false,'');
  FIdNivel := CreateCmDbField('IdNivel',ftFloat,FALSE,FALSE,false,false);
  FIdNivelTESTE := CreateCmDbField('round(idnivel/100)',ftFloat,true,true,false,false);
  FIdFaixaSalExt := CreateCmDbField('IdFaixaSalExt',ftInteger,true,false,false,false,'');
  FDataEfetivacao := CreateCmDbField('DataEfetivacao',ftDateTime,true,true,false,true,'');
  FValor := CreateCmDbField('Valor',ftFloat,false,false,false,false,'');

end;

end.
