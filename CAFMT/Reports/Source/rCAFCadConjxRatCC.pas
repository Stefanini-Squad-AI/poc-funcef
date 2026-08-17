unit rCAFCadConjxRatCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, ppBands, uCMfileUtils,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport;

type
  TRptCAFCadConjxRatCC = class(TFrmCmReport)
    dsCadConj: TwwDataSource;
    ppCadConj: TppBDEPipeline;
    rpCadConj: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel26: TppLabel;
    LblEmpresa: TppLabel;
    rpCadConjLine2: TppLine;
    ppDetailBand5: TppDetailBand;
    rpCadConjDBText3: TppDBText;
    rpCadConjDBText4: TppDBText;
    rpCadConjDBText5: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine12: TppLine;
    lblsistema: TppLabel;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    rpCadConjGroup1: TppGroup;
    rpCadConjGroupHeaderBand1: TppGroupHeaderBand;
    rpCadConjLabel1: TppLabel;
    rpCadConjLabel2: TppLabel;
    rpCadConjLabel3: TppLabel;
    ppDBText17: TppDBText;
    rpCadConjDBText1: TppDBText;
    rpCadConjDBText2: TppDBText;
    rpCadConjLine1: TppLine;
    rpCadConjLabel4: TppLabel;
    rpCadConjLabel6: TppLabel;
    rpCadConjDBText6: TppDBText;
    rpCadConjGroupFooterBand1: TppGroupFooterBand;
    ppLine11: TppLine;
    cdsCadConj: TCMClientDataSet;
    sqlCadConj: TCMSqlParams;
    sqlParamGlobal: TCMSqlParams;
    cdsParamGlobal: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFCadConjxRatCC: TRptCAFCadConjxRatCC;

implementation

{$R *.DFM}

procedure TRptCAFCadConjxRatCC.CrmRptCMBeforePrint(Sender: TObject);
var
   iAux       : Integer;
   sMascaraCC,sMensagem : String;

begin
  inherited;

  Try
     //-------------------------------------------------------------------------------------
     // Pega a mascara do cnetro de custo
     //-------------------------------------------------------------------------------------
     sqlParamGlobal.Prepare;
     sqlParamGlobal.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
     sqlParamGlobal.Open;
     sMascaraCC := cdsParamGlobal.FieldByName('MASCARACC').AsString;

     iAux := 1;
     while iAux <= length(sMascaraCC) do
     begin
        if sMascaraCC[iAux] = '9' then
           sMascaraCC[iAux] := '#';
        iAux := iAux + 1;
     end;
     sMascaraCC := sMascaraCC + ';0; ';
     //-------------------------------------------------------------------------------------

     if (CmpRptCM.ParamByName('LOCALIZACAO').AsInteger <> 0) then
     begin
        sqlCadConj.SQL.Strings[8] := 'AND (C.IDLOCALIZACAO = '+IntToStr(CmpRptCM.ParamByName('LOCALIZACAO').AsInteger)+')';
     end else
     begin
        sqlCadConj.SQL.Strings[8] := ' ';
     end;
     //----------------------------------------------------------------------------------
     if (CmpRptCM.ParamByName('RESPONSAVEL').AsInteger <> 0) then
     begin
        sqlCadConj.SQL.Strings[9] := 'AND (C.IDRESPONSAVEL = '+IntToStr(CmpRptCM.ParamByName('RESPONSAVEL').AsInteger)+')';
     end else
     begin
        sqlCadConj.SQL.Strings[9] := ' ';
     end;
     //----------------------------------------------------------------------------------
     sqlCadConj.Prepare;
     sqlCadConj.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
     //----------------------------------------------------------------------------------
     sMensagem := '';
     sqlCadConj.Open;
     if cdsCadConj.IsEmpty then
        sMensagem := 'Não há dados para os parâmetros fornecidos!';

  Except
    On E:Exception Do
    Begin
       CMDebugToFile('Erro no Relatório de Cadastro de Conjuntos - Rateio de Custos:' + sMensagem + (#13+#10) + E.Message );
    End;
  End;

end;

end.
