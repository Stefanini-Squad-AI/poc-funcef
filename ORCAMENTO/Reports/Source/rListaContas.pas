unit rListaContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, uCmRptManager, TXComp, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet,
  CmParamReport, TXRB;

type
  TrptListaContas = class(TFrmCmReport)
    sqlListaContas: TCMSqlParams;
    cdsListaContas: TCMClientDataSet;
    cdsListaContasCALCREAL: TStringField;
    cdsListaContasCALCORCADO: TStringField;
    dsListaContas: TwwDataSource;
    pplListaContas: TppBDEPipeline;
    rpListaContas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    rptListaContasLabel1: TppLabel;
    rptListaContasLabel2: TppLabel;
    rptListaContasLabel3: TppLabel;
    rptListaContasLabel4: TppLabel;
    rptListaContasLabel5: TppLabel;
    rptListaContasLabel6: TppLabel;
    rptListaContasLine1: TppLine;
    rptListaContasLabel7: TppLabel;
    rptListaContasLabel8: TppLabel;
    rptListaContasLabel10: TppLabel;
    rptListaContasLabel11: TppLabel;
    rptListaContasLabel13: TppLabel;
    rptListaContasLabel14: TppLabel;
    ppDetailBand1: TppDetailBand;
    rptListaContasDBText1: TppDBText;
    rptListaContasDBText2: TppDBText;
    rptListaContasDBText3: TppDBText;
    rptListaContasDBText4: TppDBText;
    rptListaContasDBText5: TppDBText;
    rptListaContasDBText6: TppDBText;
    rptListaContasDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    cdsListaContasIDPLANOORCAMEN: TFloatField;
    cdsListaContasIDGRUPOORCAMEN: TFloatField;
    cdsListaContasNOMECONTAORCAMEN: TStringField;
    cdsListaContasTIPOCALCREALIZADO: TStringField;
    cdsListaContasTIPOCALCORCADO: TStringField;
    cdsListaContasCODCENTRORESPON: TStringField;
    cdsListaContasNOMEGRUPOORCAMEN: TStringField;
    cdsListaContasCODGRUPOORC: TStringField;
    cdsListaContasIDCONTAORCAMEN: TStringField;
    procedure sqlListaContasFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure cdsListaContasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptListaContas: TrptListaContas;

implementation

uses uSistema;

{$R *.DFM}

procedure TrptListaContas.sqlListaContasFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName = 'GRUPO') or (sParamName = 'ORDENACAO') then
    sNewValue := sOldValue;
end;

procedure TrptListaContas.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  cdsListaContas.Close;
  with sqlListaContas do begin
    Prepare;
    //Filtra o Grupo caso ele esteja preenchido
    sqlGrupo.Prepare;
    sqlGrupo.ParamByName('IDGRUPOORCAMEN').AsInteger :=
                                              CmpRptCM.ParamValues[0].AsInteger;
    sqlGrupo.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[2].AsInteger;
    sqlGrupo.Open;
    if Trim(CmpRptCM.ParamValues[0].AsString) <> '' then begin
      ParamByName('GRUPO').AsString := ' AND (G.CODGRUPOORC LIKE ''' +
           Trim(CmpRptCM.ParamValues[0].AsString) + '%'')';
    end else begin
      ParamByName('GRUPO').AsString := ' AND (1 = 1)';
    end;
    cdsGrupo.Close;
    case CmpRptCM.ParamValues[1].AsInteger of
      0 : ParamByName('ORDENACAO').AsString := 'ORDER BY IDCONTAORCAMEN';
      1 : ParamByName('ORDENACAO').AsString := 'ORDER BY NOMECONTAORCAMEN';
      2 : ParamByName('ORDENACAO').AsString := 'ORDER BY CODGRUPOORC';
      3 : ParamByName('ORDENACAO').AsString := 'ORDER BY CODCENTRORESPON';
      4 : ParamByName('ORDENACAO').AsString := 'ORDER BY TIPOCALCORCADO';
      5 : ParamByName('ORDENACAO').AsString := 'ORDER BY TIPOCALCREALIZADO';
    end;
    ParamByName('IDPESSOA').AsInteger := sistema.idEmpresa;
    ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[2].AsInteger;
    Open;
  end;
end;

procedure TrptListaContas.cdsListaContasCalcFields(DataSet: TDataSet);
begin
  inherited;
  with cdsListaContas do begin
    //Tipos de Cálculo do Realizado
    if FieldByName('TIPOCALCREALIZADO').asString = 'V' then begin
      FieldByName('CALCREAL').asString := 'Valor Informado Manualmente';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'P' then begin
      FieldByName('CALCREAL').asString := 'Contabilidade';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'M' then begin
      FieldByName('CALCREAL').asString := 'Fórmula';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'F' then begin
      FieldByName('CALCREAL').asString := 'Composição de Outras Contas';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'X' then begin
      FieldByName('CALCREAL').asString := 'Fluxo de Caixa';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'I' then begin
      FieldByName('CALCREAL').asString := 'Valor Fixo Informado';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'G' then begin
      FieldByName('CALCREAL').asString := 'Arquivos Genéricos';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'A' then begin
      FieldByName('CALCREAL').asString := 'Valor Acumulado';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'T' then begin
      FieldByName('CALCREAL').asString := 'Título';
    end;
    if FieldByName('TIPOCALCREALIZADO').asString = 'C' then begin
      FieldByName('CALCREAL').asString := 'Condicional';
    end;
    //Tipos de Cálculo do Orçado
    if FieldByName('TIPOCALCORCADO').asString = 'V' then begin
      FieldByName('CALCORCADO').asString := 'Valor Informado Manualmente';
    end;
    if FieldByName('TIPOCALCORCADO').asString = 'M' then begin
      FieldByName('CALCORCADO').asString := 'Fórmula';
    end;
    if FieldByName('TIPOCALCORCADO').asString = 'F' then begin
      FieldByName('CALCORCADO').asString := 'Composição de Outras Contas';
    end;
    if FieldByName('TIPOCALCORCADO').asString = 'I' then begin
      FieldByName('CALCORCADO').asString := 'Valor Fixo Informado';
    end;
    if FieldByName('TIPOCALCORCADO').asString = 'A' then begin
      FieldByName('CALCORCADO').asString := 'Valor Acumulado';
    end;
    if FieldByName('TIPOCALCORCADO').asString = 'T' then begin
      FieldByName('CALCORCADO').asString := 'Título';
    end;
    if FieldByName('TIPOCALCORCADO').asString = 'C' then begin
      FieldByName('CALCORCADO').asString := 'Condicional';
    end;
  end;
end;

end.
