{--------------------------------------------------------------------------------------------------
Nº SOL......: 201365
Nº KINTANA..: 1965590
Data........: 23/07/2013
Responsável.: William Gonçalves de Santana
Descrição...: Nova unit para pegar/gravar os tipos de beneficios na tabela BENEFSALFUNC

--------------------------------------------------------------------------------------------------}

unit uDbBenefSalFunc;

interface
uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbBenefSalFunc = class(TCmDbObject)

private
    FIdPessoa: TCmDbField;
    FIdBenefsalfunc: TCmDbField;
    
public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa:       TCmDbField read FIdPessoa write FIdPessoa;
    property IdBenefsalfunc: TCmDbField read FIdBenefsalfunc write FIdBenefsalfunc;
end;
implementation

constructor TDbBenefSalFunc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'BENEFSALFUNC';

  FIdPessoa       := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FIdBenefsalfunc := CreateCmDbField('IDBENEFSALFUNC',ftInteger,false,false,false,false,'');
end;
end.
 