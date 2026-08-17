{***************************************************************************************
Nº SIG...........: 27550
Data da Alteração: 28/10/2016
Responsável......: Michelle Suellyn Mota
Descrição........: Db criada para atender a solicitação da aba Beneficios - CadFunc
                   ER180 - Limitar 4 alterações no ano para Rateio Auxílio Alimentação.
                         - Criar Histórico de Alterações com filtro Ano.
                   DFM - Alterações de leiaute e nomenclatura de campos/colunas.
***************************************************************************************}

unit uDbHistAlterBenef;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbHistAlterBenef = class(TCmDbObject)
  private
    FIdHstAltRateioAuxAliment: TCmDbField;
    FIdPessoa: TCmDbField;
    FAno: TCmDbField;
    FPerc_Alimentacao: TCmDbField;
    FPerc_Refeicao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdHstAltRateioAuxAliment: TCmDbField read FIdHstAltRateioAuxAliment write FIdHstAltRateioAuxAliment;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property Ano: TCmDbField read FAno write FAno;
    property Perc_Alimentacao: TCmDbField read FPerc_Alimentacao write FPerc_Alimentacao;
    property Perc_Refeicao: TCmDbField read FPerc_Refeicao write FPerc_Refeicao;
  end;

implementation

{ TDbHistAlterBenef }

constructor TDbHistAlterBenef.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTALTRATEIOAUXALIMENT';

  FIdHstAltRateioAuxAliment := CreateCmDbField('IdHstAltRateioAuxAliment',ftFloat,true,true,false,false,'');
  FIdPessoa := CreateCmDbField('IdPessoa',ftFloat,true,true,false,false,'');
  FAno := CreateCmDbField('Ano',ftString,false,false,false,false,'');
  FPerc_Alimentacao := CreateCmDbField('Perc_Alimentacao',ftFloat,false,false,false,false,'');
  FPerc_Refeicao := CreateCmDbField('Perc_Refeicao',ftFloat,false,false,false,false,'');
end;

end.