{-------------------------------------------------------------------------------
--------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ------------------------------
--------------------------------------------------------------------------------

N. SIG..........: 103333
Data............: 15/02/2022
Responsável.....: Everson Cunha
Descrição.......: Criação do fonte uDbNegociacao.
--------------------------------------------------------------------------------}

unit uDbNegociacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbNegociacao = class(TCmDbObject)

  private
    FIdContratoNegociacao: TCmDbField;
    FIdContrato          : TCmDbField;
    FIdResponsavel       : TCmDbField;
    FDtInicioVigencia    : TCmDbField;
    FTipo                : TCmDbField;
    FNegociacao          : TCmDbField;
    FValorAnteriorAnual  : TCmDbField;
    FValorAtualAnual     : TCmDbField;
    FValorPrevistoAnual  : TCmDbField;
    FEconomiaAnual       : TCmDbField;
    FIndicePrevisto      : TCmDbField;
    FPercentualReducao   : TCmDbField;

  public
    property IdContratoNegociacao : TCmDbField read FIdContratoNegociacao write FIdContratoNegociacao;
    property IdContrato           : TCmDbField read FIdContrato           write FIdContrato;
    property IdResponsavel        : TCmDbField read FIdResponsavel        write FIdResponsavel;
    property DtInicioVigencia     : TCmDbField read FDtInicioVigencia     write FDtInicioVigencia;
    property Tipo                 : TCmDbField read FTipo                 write FTipo;
    property Negociacao           : TCmDbField read FNegociacao           write FNegociacao;
    property ValorAnteriorAnual   : TCmDbField read FValorAnteriorAnual   write FValorAnteriorAnual;
    property ValorAtualAnual      : TCmDbField read FValorAtualAnual      write FValorAtualAnual;
    property ValorPrevistoAnual   : TCmDbField read FValorPrevistoAnual   write FValorPrevistoAnual;
    property EconomiaAnual        : TCmDbField read FEconomiaAnual        write FEconomiaAnual;
    property IndicePrevisto       : TCmDbField read FIndicePrevisto       write FIndicePrevisto;
    property PercentualReducao    : TCmDbField read FPercentualReducao    write FPercentualReducao;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert : Boolean; Override;
  End;

implementation

{ TDbNegociacao }

constructor TDbNegociacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATO_NEGOCIACAO';

  FIdContratoNegociacao := CreateCmDbField('idcontrato_negociacao', ftfloat,    true,  true,  false, true, '');
  FIdContrato           := CreateCmDbField('idcontrato',            ftfloat,    true,  false, false, true, '');
  FIdResponsavel        := CreateCmDbField('idresponsavel',         ftfloat,    false, false, false, true, '');
  FDtInicioVigencia     := CreateCmDbField('dtiniciovigencia',      ftDateTime, false, false, false, true, '');
  FTipo                 := CreateCmDbField('tipo',                  ftString,   false, false, false, true, '');
  FNegociacao           := CreateCmDbField('negociacao',            ftString,   false, false, false, true, '');
  FValorAnteriorAnual   := CreateCmDbField('valoranterioranual',    ftfloat,    false, false, false, false, '');
  FValorAtualAnual      := CreateCmDbField('valoratualanual',       ftfloat,    false, false, false, false, '');
  FValorPrevistoAnual   := CreateCmDbField('valorprevistoanual',    ftfloat,    false, false, false, false, '');
  FEconomiaAnual        := CreateCmDbField('economiaanual',         ftfloat,    false, false, false, false, '');
  FIndicePrevisto       := CreateCmDbField('indiceprevisto',        ftfloat,    false, false, false, false, '');
  FPercentualReducao    := CreateCmDbField('percentualreducao',     ftfloat,    false, false, false, false, '');
end;

function TDbNegociacao.Insert: Boolean;
begin
   FIdContratoNegociacao.AsFloat := GetSequence('CONTRATO_NEGOCIACAO');
   Result := Inherited Insert;
end;

end.
