unit rCAFCadConjxBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppBands, ppClass,uCMfileUtils,
  ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TRptCAFCadConjxBens = class(TFrmCmReport)
    dsConjxBens: TwwDataSource;
    ppConjxBens: TppBDEPipeline;
    rpConjxBens: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLabel28: TppLabel;
    LblEmpresa: TppLabel;
    ppLine10: TppLine;
    ppDetailBand18: TppDetailBand;
    ppDBText2: TppDBText;
    rpConjxBensDBText1: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine37: TppLine;
    LBLSISTEMA: TppLabel;
    ppCalc35: TppSystemVariable;
    ppCalc36: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppDBText18: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLine38: TppLine;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    rpConjxBensDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine39: TppLine;
    sqlConjxBens: TCMSqlParams;
    cdsConjxBens: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadConjxBens: TRptCAFCadConjxBens;

implementation

{$R *.DFM}

procedure TRptCAFCadConjxBens.CrmRptCMBeforePrint(Sender: TObject);
var
  sMensagem :string;
begin
  inherited;

  Try
       if (CmpRptCM.ParamByName('LOCALIZACAO').AsInteger <> 0) then
       begin
          sqlConjxBens.SQL.Strings[7] := 'AND (C.IDLOCALIZACAO = '+IntToStr(CmpRptCM.ParamByName('LOCALIZACAO').AsInteger)+')';
       end else
       begin
          sqlConjxBens.SQL.Strings[7] := ' ';
       end;
       //----------------------------------------------------------------------------------
       if (CmpRptCM.ParamByName('RESPONSAVEL').AsInteger <> 0) then
       begin
          sqlConjxBens.SQL.Strings[8] := 'AND (C.IDRESPONSAVEL = '+IntToStr(CmpRptCM.ParamByName('RESPONSAVEL').AsInteger)+')';
       end else
       begin
          sqlConjxBens.SQL.Strings[8] := ' ';
       end;
       //----------------------------------------------------------------------------------
       sqlConjxBens.Prepare;
       sqlConjxBens.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
       //----------------------------------------------------------------------------------
       sMensagem := '';
       sqlConjxBens.Open;
       if cdsConjxBens.IsEmpty then
          sMensagem := 'Não há dados para os parâmetros fornecidos!';

   Except
    On E:Exception Do
    Begin
       CMDebugToFile('Erro no Relatório de Cadastro de Bens Patrimoniais:' + sMensagem + (#13+#10) + E.Message );
    End;

  End;

end;

end.
