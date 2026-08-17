unit uDtMdlSat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TDtMdlSat = class(TDataModule)
    qry: TwwQuery;
    wwQryTotReg: TwwQuery;
    wwQryTotRegTOTREG: TFloatField;
    wwQryTempo: TwwQuery;
    wwQryTempoCD_VERSAO: TFloatField;
    wwQryTempoCD_PARTIC: TFloatField;
    wwQryTempoCD_TIPO_TEMPO: TFloatField;
    wwQryTempoDT_TEMPO: TDateTimeField;
    wwQryTempoQT_DIA_TEMPO: TFloatField;
    wwQryTempoQT_MES_TEMPO: TFloatField;
    wwQryTempoQT_ANO_TEMPO: TFloatField;
    wwQryTempoDS_TIPO_TEMPO: TStringField;
    wwQryTempoIR_DOMINIO_SISTEMA: TStringField;
    wwQryDependente: TwwQuery;
    wwQryDependenteDATA_NASC: TDateTimeField;
    wwQryDependenteIDADE: TFloatField;
    wwQryOcorrTabua: TwwQuery;
    wwQryOcorrTabuaCD_TABUA: TFloatField;
    wwQryOcorrTabuaNR_IDADE: TFloatField;
    wwQryOcorrTabuaNR_L_X: TFloatField;
    wwQryOcorrTabuaNR_P_X: TFloatField;
    wwQryOcorrTabuaNR_D_X: TFloatField;
    wwQryOcorrTabuaNR_Q_X: TFloatField;
    wwQryOcorrTabuaNR_I_X: TFloatField;
    wwQryOcorrTabuaSG_TABUA: TStringField;
    wwQryOcorrTabuaDS_TABUA: TStringField;
    wwQryOcorrTabuaDT_REF_TABUA: TDateTimeField;
    wwQryOcorrTabuaCD_TIPO_TABUA: TFloatField;
    wwQryOcorrTabuaDS_TIPO_TABUA: TStringField;
    wwQryOcorrTabuaIR_DOMINIO_SISTEMA: TStringField;
    wwQryAtributoTabelas: TwwQuery;
    wwQryAtributoTabelasNO_TABELA: TStringField;
    wwQryAtributoTabelasSQ_ATUALIZACAO: TFloatField;
    wwQryAtributoTabelasNO_ATRIBUTO_TABELA: TStringField;
    wwQryAtributoTabelasDS_ATRIBUTO_TABELA: TStringField;
    wwQryAtributoTabelasTP_ATRIBUTO: TStringField;
    wwQryAtributoTabelasNR_TAM_ATRIBUTO_TABELA: TFloatField;
    wwQryAtributoTabelasIR_MANDATORIO: TStringField;
    wwQryAtributoTabelasIR_CARGA_OBRIGATORIA: TStringField;
    wwQryAtributoTabelasNR_ORDEM: TFloatField;
    wwQryAtributoTabelasNO_TABELA_LOOKUP: TStringField;
    wwQryAtributoTabelasNO_ATRIBUTO_TABELA_LOOKUP: TStringField;
    wwQryAtributoTabelasCD_GRUPO: TFloatField;
    wwQryPkTabelaSel: TwwQuery;
    wwQryPkTabelaSelNO_TABELA: TStringField;
    wwQryPkTabelaSelNO_ATRIBUTO_TABELA: TStringField;
    wwQryPkTabela: TwwQuery;
    wwQryPkTabelaNO_TABELA: TStringField;
    wwQryPkTabelaNO_ATRIBUTO_TABELA: TStringField;
    wwQryComplQuery: TwwQuery;
    wwQryComplQueryNO_TABELA: TStringField;
    wwQryComplQueryNO_ATRIBUTO_TABELA: TStringField;
    wwQryComplQueryDS_ATRIBUTO_TABELA: TStringField;
    wwQryComplQueryTP_ATRIBUTO: TStringField;
    wwQryComplQueryNR_TAM_ATRIBUTO_TABELA: TFloatField;
    wwQryComplQueryIR_MANDATORIO: TStringField;
    wwQryComplQueryIR_CARGA_OBRIGATORIA: TStringField;
    wwQryComplQueryNR_ORDEM: TFloatField;
    wwQryComplQueryNO_TABELA_LOOKUP: TStringField;
    wwQryComplQueryNO_ATRIBUTO_TABELA_LOOKUP: TStringField;
    wwQryComplQueryCD_GRUPO: TFloatField;
    wwQryPkFkTabela: TwwQuery;
    wwQryPkFkTabelaNO_TABELA: TStringField;
    wwQryPkFkTabelaNO_ATRIBUTO_TABELA: TStringField;
    wwQryPkFkTabelaNO_TABELA_FK: TStringField;
    wwQryPkFkTabelaNO_ATRIBUTO_TABELA_FK: TStringField;
    wwQryRamificacao: TwwQuery;
    wwQryRamificacaoNO_TABELA: TStringField;
    wwQryRamificacaoNO_ATRIBUTO_TABELA: TStringField;
    wwQryRamificacaoNO_TABELA_FK: TStringField;
    wwQryRamificacaoNO_ATRIBUTO_TABELA_FK: TStringField;
    BdTmp: TDatabase;
    FQuery: TQuery;
    wwQryGrupoCalculo: TwwQuery;
    wwQryGrupoExportacao: TwwQuery;
    wwQryGrupoCalculoDS_SQL_ENQUADRAMENTO: TMemoField;
    wwQryGrupoExportacaoDS_SQL_ENQUADRAMENTO: TMemoField;
    wwQryGrupoCalculoCD_GRUPO_PARTIC: TFloatField;
    wwQryGrupoExportacaoCD_GRUPO_PARTIC: TFloatField;
    wwQryGrupoCalculoNO_GRUPO_PARTIC: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtMdlSat: TDtMdlSat;

implementation          

{$R *.DFM}

end.
