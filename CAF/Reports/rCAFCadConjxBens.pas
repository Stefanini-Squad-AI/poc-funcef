{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendências  : 23856
Responsável : Gustavo Mendes
Data        : 29/10/2007
Descrição   : Inserir um check para Exibir apenas bens ativos.
--------------------------------------------------------------------------------}

unit rCAFCadConjxBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppBands, ppClass,uCMfileUtils,
  ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, DBClient,
  uCMClientDataSet, uCmSqlParams, ppStrtch, ppMemo, IvDictio, IvMulti, TXRB;

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
    ppDBMemo1: TppDBMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
begin
   inherited;
   try
      if CmpRptCM.ParamByName('LOCALIZACAO').AsInteger <> 0 then
      begin
         sqlConjxBens.SQL.Strings[7] := ' AND C.IDLOCALIZACAO = '+IntToStr(CmpRptCM.ParamByName('LOCALIZACAO').AsInteger);
      end else
      begin
         sqlConjxBens.SQL.Strings[7] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamByName('RESPONSAVEL').AsInteger <> 0 then
      begin
         sqlConjxBens.SQL.Strings[8] := ' AND C.IDRESPONSAVEL = '+IntToStr(CmpRptCM.ParamByName('RESPONSAVEL').AsInteger);
      end else
      begin
         sqlConjxBens.SQL.Strings[8] := ' ';
      end;
      //----------------------------------------------------------------------------------
// Gustavo Mendes - 23856 - Inicio
      if CmpRptCM.ParamByName('BENSATIVOS').AsBoolean then
      begin
         sqlConjxBens.SQL.Strings[9] := ' AND B.BAIXATOTAL = ''N''';
      end else
      begin
         sqlConjxBens.SQL.Strings[9] := ' ';
      end;

      sqlConjxBens.Prepare;
      sqlConjxBens.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
// Gustavo Mendes - 23856 - Fim
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlConjxBens.Open;
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         CMDebugToFile('CADASTRO DE CONJUNTOS x BENS : ' + E.Message);
      end;
  end;
end;

procedure TRptCAFCadConjxBens.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY NOME ';
end;

end.
