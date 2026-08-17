unit rSaldos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, uCmRptManager, TXComp, CmParamReport, ppBands,
  ppCtrls, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, MontaSelect, uCtrlOrcamento, TXRB;

type
  TrptSaldos = class(TFrmCmReport)
    sqlSaldos: TCMSqlParams;
    cdsSaldos: TCMClientDataSet;
    dsSaldos: TwwDataSource;
    pplSaldos: TppBDEPipeline;
    rpSaldos: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    rpSaldosLabel13: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    rpSaldosDBText1: TppDBText;
    rpSaldosDBText2: TppDBText;
    rpSaldosDBText3: TppDBText;
    rpSaldosDBText6: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine5: TppLine;
    ppLabel14: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    rpSaldosSummaryBand1: TppSummaryBand;
    rpSaldosDBCalc1: TppDBCalc;
    rpSaldosDBCalc2: TppDBCalc;
    rpSaldosDBCalc3: TppDBCalc;
    rpSaldosDBCalc4: TppDBCalc;
    rpSaldosLine1: TppLine;
    rpSaldosLabel9: TppLabel;
    rpSaldosGroup1: TppGroup;
    rpSaldosGroupHeaderBand1: TppGroupHeaderBand;
    rpSaldosShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine4: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    rpSaldosLabel1: TppLabel;
    rpSaldosLabel2: TppLabel;
    rpSaldosLabel3: TppLabel;
    rpSaldosLabel4: TppLabel;
    rpSaldosLabel5: TppLabel;
    rpSaldosLabel6: TppLabel;
    rpSaldosLabel7: TppLabel;
    rpSaldosLabel8: TppLabel;
    rpSaldosLabel11: TppLabel;
    rpSaldosDBText4: TppDBText;
    rpSaldosDBText5: TppDBText;
    rpSaldosLabel10: TppLabel;
    rpSaldosGroupFooterBand1: TppGroupFooterBand;
    rpSaldosDBCalc5: TppDBCalc;
    rpSaldosDBCalc6: TppDBCalc;
    rpSaldosDBCalc7: TppDBCalc;
    rpSaldosDBCalc8: TppDBCalc;
    rpSaldosLine2: TppLine;
    rpSaldosLabel12: TppLabel;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    procedure sqlSaldosFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptSaldos: TrptSaldos;

implementation

uses uFuncaoGeral, uModulo, uSistema, uMensErro;

{$R *.DFM}

procedure TrptSaldos.sqlSaldosFormartParam(sParamName, sOldValue: String;
  var sNewValue: String);
begin
  inherited;
  if (sParamName = 'CONTA') or (sParamName = 'GRUPO') or
     (sParamName = 'DATAINI') or (sParamName = 'DATAFIM') or
     (sParamName = 'ORDENACAO') then
    sNewValue := sOldValue;
end;

procedure TrptSaldos.CrmRptCMBeforePrint(Sender: TObject);
var rValorDiv: Double;
    sValorDiv: String;
begin
  inherited;
  if CmpRptCM.ParamValues[6].AsFloat = 0 then
    rValorDiv := 1
  else
    rValorDiv := CmpRptCM.ParamValues[6].AsFloat;
  sValorDiv := FuncaoGeral.OraNumero(rValorDiv);
  if CmpRptCM.ParamValues[6].AsFloat <> 0 then
    rpSaldosLabel13.caption := 'Valores por ' + sValorDiv
  else
    rpSaldosLabel13.caption := '';
  //Filtra os dados da tela para passar para o relatório
  if not ((Trim(CmpRptCM.ParamValues[0].AsString) = '/  /') or
     (Trim(CmpRptCM.ParamValues[1].AsString) = '/  /')) then begin
    //Verifica se a data final é maior ou igual à inicial
    if OrcamentoBackMT.VerificaDatas(StrToDate(Trim
       (CmpRptCM.ParamValues[0].AsString)), StrToDate(Trim
       (CmpRptCM.ParamValues[1].AsString))) then begin
      cdsSaldos.Close;
      with sqlSaldos do begin
        Prepare;
        ParamByName('VALORDIV').AsFloat := rValorDiv;
        ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[7].AsInteger;
        
        //Filtra a conta caso ela esteja preenchida
        if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then begin
          ParamByName('CONTA').AsString := '(S.IDCONTAORCAMEN = ''' +
                 Trim(CmpRptCM.ParamValues[2].AsString) + ''') AND ' +
                 '(S.IDPLANOORCAMEN = ' + IntToStr(modulo.iPlanoOrc) +
                 ') AND ';
        end else begin
           ParamByName('CONTA').AsString := '(1 = 1) AND ';
        end;
        //Filtra o Grupo caso ele esteja preenchido
        sqlGrupo.Prepare;
        sqlGrupo.ParamByName('IDGRUPOORCAMEN').AsInteger :=
                                              CmpRptCM.ParamValues[4].AsInteger;
        sqlGrupo.Open;
        if not cdsGrupo.IsEmpty then begin
          ParamByName('GRUPO').AsString := '(G.CODGRUPOORC LIKE ''' +
               Trim(cdsGrupo.FieldByName('CODGRUPOORC').AsString) + '%'') AND ';
        end else begin
          ParamByName('GRUPO').AsString := '(1 = 1) AND ';
        end;
        cdsGrupo.Close;
        ParamByName('DATAINI').AsString := 'TO_DATE(''' +
              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime) +
              ''',''DD/MM/YYYY'')';
        ParamByName('DATAFIM').AsString := 'TO_DATE(''' +
              FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime) +
              ''',''DD/MM/YYYY'')';
        case CmpRptCM.ParamValues[5].AsInteger of
          0 : ParamByName('ORDENACAO').AsString :=
                     'ORDER BY S.IDCONTAORCAMEN, S.DATAREFERENCIA';
          1 : ParamByName('ORDENACAO').AsString :=
                     'ORDER BY C.NOMECONTAORCAMEN, S.DATAREFERENCIA';
        end;
        ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
        Open;
      end;
    end else begin
      modalResult := mrNone;
    end;
  end else begin
    MsgDlg('O Período de Datas de Referência deve ser preenchido.','Erro',
           mtError,[mbOk],0);
    modalResult := mrNone;
  end;
end;

end.
