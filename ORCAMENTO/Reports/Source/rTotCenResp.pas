unit rTotCenResp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  MontaSelect, uCtrlOrcamento, TXRB;

type
  TrptTotCenResp = class(TFrmCmReport)
    sqlTotCenResp: TCMSqlParams;
    cdsTotCenResp: TCMClientDataSet;
    dsTotCenResp: TwwDataSource;
    pplTotCenResp: TppBDEPipeline;
    rpTotCenResp: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel73: TppLabel;
    ppLine22: TppLine;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine23: TppLine;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine24: TppLine;
    ppLabel105: TppLabel;
    ppCalc16: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine25: TppLine;
    ppLabel106: TppLabel;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    procedure sqlTotCenRespFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptTotCenResp: TrptTotCenResp;

implementation

uses uModulo, uSistema, uMensErro;

{$R *.DFM}

procedure TrptTotCenResp.sqlTotCenRespFormartParam(sParamName,
  sOldValue: String; var sNewValue: String);
begin
  inherited;
  if (sParamName <> 'IDPESSOA') then
    sNewValue := sOldValue;
end;

procedure TrptTotCenResp.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  //Filtra os dados da tela para passar para o relatório
   if not ((Trim(CmpRptCM.ParamValues[0].AsString) = '') or
      (Trim(CmpRptCM.ParamValues[1].AsString) = '')) then begin
     //Verifica se a data final é maior ou igual à inicial
     if OrcamentoBackMT.VerificaDatas(StrToDate(Trim
        (CmpRptCM.ParamValues[0].AsString)),StrToDate(Trim
        (CmpRptCM.ParamValues[1].AsString))) then begin
       with sqlTotCenResp do begin
         Prepare;
         //Filtra caso o Centro de responsabilidade
         //seja escolhida.
         if Trim(CmpRptCM.ParamValues[7].AsString) <> '' then
            begin
              ParamByName('RESPONSAB').AsString := ' (C.CODCENTRORESPON = '+
              CmpRptCM.ParamValues[7].AsString + ') AND '
            end
              else
                ParamByName('RESPONSAB').AsString :=' (C.CODCENTRORESPON <> 0) AND ';
            
         //Filtra a conta caso ela esteja preenchida
         if Trim(CmpRptCM.ParamValues[2].AsString) <> '' then begin
           ParamByName('CONTA').AsString := '(S.IDCONTAORCAMEN = ''' +
                Trim(CmpRptCM.ParamValues[2].AsString) + ''') AND ' +
                '(S.IDPLANOORCAMEN = ' + IntToStr(CmpRptCM.ParamValues[6].AsInteger) + ') AND ';
         end else begin
           ParamByName('CONTA').AsString := '(1 = 1) AND ' +
               '(S.IDPLANOORCAMEN = ' + IntToStr(CmpRptCM.ParamValues[6].AsInteger) + ') AND ';
         end;
         //Filtra o Grupo caso ele esteja preenchido
         sqlGrupo.Prepare;
         sqlGrupo.ParamByName('IDGRUPOORCAMEN').AsInteger :=
                                              CmpRptCM.ParamValues[4].AsInteger;
         sqlGrupo.ParamByName('IDPLANOORCAMEN').AsInteger := CmpRptCM.ParamValues[6].AsInteger;
         sqlGrupo.Open;
         if not cdsGrupo.IsEmpty then begin
           ParamByName('GRUPO').AsString := '(G.CODGRUPOORC LIKE ''' +
               Trim(cdsGrupo.FieldByName('CODGRUPOORC').AsString) + '%'') AND ';
         end else begin
           ParamByName('GRUPO').AsString := '(1 = 1) AND ';
         end;
         cdsGrupo.Close;
         case CmpRptCM.ParamValues[5].AsInteger of
           0: ParamByName('ORDENACAO').AsString := 'ORDER BY C.CODCENTRORESPON';
           1: ParamByName('ORDENACAO').AsString := 'ORDER BY R.NOME';
         end;
         ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
         ParamByName('DATAINI').asString := 'TO_DATE(''' +
                                   FormatDateTime('dd/mm/yyyy',
                                   CmpRptCM.ParamValues[0].AsDateTime) +
                                   ''',''DD/MM/YYYY'')';
         ParamByName('DATAFIM').asString := 'TO_DATE(''' +
                                   FormatDateTime('dd/mm/yyyy',
                                   CmpRptCM.ParamValues[1].AsDateTime) +
                                   ''',''DD/MM/YYYY'')';

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
