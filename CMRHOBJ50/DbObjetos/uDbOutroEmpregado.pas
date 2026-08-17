unit uDbOutroEmpregado;
//***************************************************************************************
//Nº SIG...........: 20810
//Data da Alteração: 01/09/2016
//Responsável......: André Imakawa
//Descrição........: Alterar o campo Mês para "Vigência", com dia, mês e ano.
//                   Buscar dados do Cadastro de Favorecido para preencher "CNPJ" e ]
//                   "Nome Fantasia"
//***************************************************************************************
//Nº SOL...........: 250385/17479
//Nº PPM...........: 960979
//Data da Alteração: 22/07/2015
//Responsável......: Higor Nayde Ferreira
//Descrição........: Inclusão da Funcionalidade Transações -> Remuneração - Outro Empregador.
//***************************************************************************************
interface
uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbOutroEmpregado = class(TCmDbObject)
  private
    FIDREMUNOE: TCmDbField;
    FIDPESSOA: TCmDbField;
    FVLREMUNOE: TCmDbField;
    // Andre Imakawa - SIG 20810 - Inicio

    //FMES: TCmDbField;
    //FRAZAOSOCIAL: TCmDbField;
    //FCNPJ: TCmDbField;
    FIDEMPRESA: TCmDbField;
    FINICIOVIGENCIA: TCmDbField;
    FFIMVIGENCIA: TCmDbField;

    // Andre Imakawa - SIG 20810 - Fim

  public
    function Insert : Boolean; override;
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IDREMUNOE: TCmDbField read FIDREMUNOE write FIDREMUNOE;
    property IDPESSOA: TCmDbField read FIDPESSOA write FIDPESSOA;
    property VLREMUNOE: TCmDbField read FVLREMUNOE write FVLREMUNOE;
    // Andre Imakawa - SIG 20810 - Inicio

    //property MES: TCmDbField read FMES write FMES;
    //property RAZAOSOCIAL: TCmDbField read FRAZAOSOCIAL write FRAZAOSOCIAL;
    //property CNPJ: TCmDbField read FCNPJ write FCNPJ;
    property IDEMPRESA: TCmDbField read FIDEMPRESA write FIDEMPRESA;
    property INICIOVIGENCIA: TCmDbField read FINICIOVIGENCIA write FINICIOVIGENCIA;
    property FIMVIGENCIA: TCmDbField read FFIMVIGENCIA write FFIMVIGENCIA;

    // Andre Imakawa - SIG 20810 - Fim

  end;

implementation

{ TDbCargo }

constructor TDbOutroEmpregado.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'REMUNOE';

  FIDREMUNOE := CreateCmDbField('IDREMUNOE',ftFloat,true,true,false,true,'');
  FIDPESSOA := CreateCmDbField('IDPESSOA',ftFloat,False,false,false,true,'');
  FVLREMUNOE := CreateCmDbField('VLREMUNOE',ftFloat,false,false,false,true,'');
  // Andre Imakawa - SIG 20810 - Inicio

  //FMES := CreateCmDbField('MES',ftString,false,false,false,true,'');
  //FRAZAOSOCIAL := CreateCmDbField('RAZAOSOCIAL',ftString,false,false,false,true,'');
  //FCNPJ := CreateCmDbField('CNPJ',ftString,false,false,false,true,'');
  FIDEMPRESA := CreateCmDbField('IDEMPRESA',ftFloat,False,false,false,true,'');
  FINICIOVIGENCIA := CreateCmDbField('INICIOVIGENCIA',ftDateTime,false,false,false,true,'');
  FFIMVIGENCIA := CreateCmDbField('FIMVIGENCIA',ftDateTime,false,false,false,true,'');

  // Andre Imakawa - SIG 20810 - Fim

end;
function TDbOutroEmpregado.Insert: Boolean;
begin
  IDREMUNOE.AsFloat := GetSequence('REMUNOE');

  Result := inherited Insert;
end;

end.
