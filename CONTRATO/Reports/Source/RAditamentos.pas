unit RAditamentos;

{-------------------------------------------------------------------------------
Rotina......: rpAditamentos, CrmRptCMBeforePrint, ppGroupFooterBand1BeforePrint,
              CmpRptCMBeforeExecute
N. Sol......: 222290-16959
N. PPM .....: 670297
Data........: 15/02/2012
Responsável.: Edilaine Ferraresi
Melhoria....: contador para total de registros por tipo de aditamento
--------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, ppBands,
  ppClass, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, TXRB, uFuncoesUteis, ppModule, raCodMod,
  DBTables, Wwquery, uSistema;

type
  TRptAditamentos = class(TFrmCmReport)
    rpAditamentos: TppReport;
    ppDetailBand1: TppDetailBand;
    dsAditamentos: TwwDataSource;
    pplAditamentos: TppBDEPipeline;
    cdsAditamentos: TCMClientDataSet;
    spAditamentos: TCMSqlParams;
    ppReport1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppLine5: TppLine;
    ppDBText2: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel9: TppLabel;
    ppDBText3: TppDBText;
    ppLine7: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLabel14: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLabel15: TppLabel;
    ppShape2: TppShape;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    pplblNome: TppLabel;
    ppLabel2: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel17: TppLabel;
    ppDBText5: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppLine2: TppLine;
    ppDBText6: TppDBText;
    ppCalcAdit: TppDBCalc;
    ppLabel18: TppLabel;
    ppCalcOut: TppDBCalc;
    ppLabel19: TppLabel;
    ppCalcTot: TppDBCalc;
    ppLabel20: TppLabel;
    ppShape1: TppShape;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel21: TppLabel;
    ppBndResumo: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppDBCalc4: TppDBCalc;
    ppLabel29: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppLabel30: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppLabel31: TppLabel;
    ppShape3: TppShape;
    ppLine12: TppLine;
    ppLabel32: TppLabel;
    ppLine14: TppLine;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppLine13: TppLine;
    ppLabel33: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    qryEmpresa: TwwQuery;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppBndResumoBeforeGenerate(Sender: TObject);
  private
    { Private declarations }
    iNumContratos : integer;         // edilaine - SOL 222290-16959 / PPM 670297

  public
    { Public declarations }
  end;

var
  RptAditamentos: TRptAditamentos;

implementation

{$R *.DFM}

procedure TRptAditamentos.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   // edilaine - SOL 222290-16959 / PPM 670297 - inicio comentado
   {CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT '+
                                                    '   IDCONTRATO, '+
                                                    '   NOMECONTRATO '+
                                                    'FROM CONTRATOCONTR '+
                                                    'WHERE (IDPESSOA = '+
                                                     FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOMECONTRATO ';
   }// edilaine - SOL 222290-16959 / PPM 670297 - fim comentado
end;

procedure TRptAditamentos.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;

    // edilaine - SOL 222290-16959 / PPM 670297 - inico
    iNumContratos := 0;

    qryEmpresa.close;
    qryEmpresa.Params[0].AsInteger := Sistema.IdEmpresa;
    qryEmpresa.open;
    pplblNome.Caption := qryEmpresa.FieldByName('RAZAOSOCIAL').AsString;
    // edilaine - SOL 222290-16959 / PPM 670297 - fim


   with spAditamentos do
   begin
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('   C.NOMECONTRATO, ');
      SQL.Add('   A.DATAASSADITAMENTO, ');
      SQL.Add('   A.CODADITAMENTO, ');
      SQL.Add('   DECODE(A.FLGTIPO, ''C'', 0, 1) AS NUMADITAMENTO,  ');    // edilaine - SOL 222290-16959 / PPM 670297
      SQL.Add('   DECODE(A.FLGTIPO, ''C'', 1, 0) AS NUMOUTROS,  ');        // edilaine - SOL 222290-16959 / PPM 670297
      SQL.Add('   DECODE(A.FLGTIPO, ''C'', 1, 1) AS NUMTOTAL,   ');        // edilaine - SOL 222290-16959 / PPM 670297
      SQL.Add('   A.DESCADITAMENTO ');
      SQL.Add('FROM ');
      SQL.Add('   CONTRATOCONTR C, ');
      SQL.Add('   ADITAMENTO A, ');
      SQL.Add('   CONTRATOUSUARIO CXU ');                                  // edilaine - SOL 222290-16959 / PPM 670297
      SQL.Add('WHERE ');
      SQL.Add('  (A.IDCONTRATO = C.IDCONTRATO) ');
      SQL.Add('  AND (C.IDCONTRATO = CXU.IDCONTRATO) ');                   // edilaine - SOL 222290-16959 / PPM 670297
      SQL.Add('  AND CXU.IDUSUARIO = '+IntToStr(Sistema.IdUsuario) );      // edilaine - SOL 222290-16959 / PPM 670297

      // edilaine - SOL 222290-16959 / PPM 670297 - incio
      if (not(CmpRptCM.ParamValues[0].IsNull)) and (CmpRptCM.ParamValues[0].AsString <> '') then
        //SQL.Add('  AND (C.IDCONTRATO IN ( '+FloatToStr(CmpRptCM.ParamValues[0].AsFloat)+') )');
        Sql.Add( QuebrarListaFiltro(3, 'AND (C.IDCONTRATO ', CmpRptCM.ParamValues[0].AsString , 500) );    {* quebra lista de id's de 500 em 500 *}
      // edilaine - SOL 222290-16959 / PPM 670297 - fim

      // edilaine - SOL 222290-16959 / PPM 670297 - comentado  filtro por datas
      {if not(CmpRptCM.ParamValues[1].IsNull) then
         SQL.Add('  AND (A.DATAASSADITAMENTO >= TO_DATE('''+
         FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)+''',''dd/mm/yyyy'')) ');

      if not(CmpRptCM.ParamValues[2].IsNull) and
            ((CmpRptCM.ParamValues[1].AsDateTime<=CmpRptCM.ParamValues[2].AsDateTime) or
             (CmpRptCM.ParamValues[1].IsNull)) then
         SQL.Add('  AND (A.DATAASSADITAMENTO <= TO_DATE('''+
         FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[2].AsDateTime)+''',''dd/mm/yyyy'')) ');
      } // edilaine - SOL 222290-16959 / PPM 670297 - fim comentario


      // edilaine - SOL 222290-16959 / PPM 670297 - inicio
      if (CmpRptCM.ParamValues[1].AsString <> '') and (CmpRptCM.ParamValues[2].AsString <> '') then  {* tem data inicial e final *}
         SQL.Add('  AND (A.DATAASSADITAMENTO between TO_DATE('''+FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)+''',''dd/mm/yyyy'') AND '+
                                                    'TO_DATE('''+FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[2].AsDateTime)+''',''dd/mm/yyyy'')) ')

      else if (CmpRptCM.ParamValues[1].AsString <> '') then   {* tem so data inicial *}
         SQL.Add('  AND (A.DATAASSADITAMENTO >= TO_DATE('''+FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)+''',''dd/mm/yyyy'')) ')

      else if (CmpRptCM.ParamValues[2].AsString <> '') then   {* tem so data final *}
         SQL.Add('  AND (A.DATAASSADITAMENTO <= TO_DATE('''+FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[2].AsDateTime)+''',''dd/mm/yyyy'')) ');

      case CmpRptCM.ParamValues[4].AsInteger of
        0 : SQL.Add('  AND C.FLGFIMCONTRATO <> ''E'' ');  {*Vigentes*}
        1 : SQL.Add('  AND C.FLGFIMCONTRATO = ''E'' ');   {*Encerrados*}
      end;
      // edilaine - SOL 222290-16959 / PPM 670297 - fim


      if CmpRptCM.ParamValues[3].AsString = 'A' then
         SQL.Add('  AND (A.FLGTIPO IS NULL OR A.FLGTIPO = ''A'') ');

      if CmpRptCM.ParamValues[3].AsString = 'C' then
         SQL.Add('  AND (A.FLGTIPO = ''C'') ');

      SQL.Add('ORDER BY ');
      SQL.Add('   C.NOMECONTRATO, ');
      SQL.Add('   A.DATAASSADITAMENTO, ');
      SQL.Add('   A.CODADITAMENTO, ');
      SQL.Add('   A.IDADITAMENTO ');
      Open;
   end;
end;

// edilaine - SOL 222290-16959 / PPM 670297
procedure TRptAditamentos.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inc(iNumContratos);
end;

procedure TRptAditamentos.ppBndResumoBeforeGenerate(Sender: TObject);
begin
  inherited;
  ppBndResumo.Visible := (iNumContratos > 1);
end;

end.
