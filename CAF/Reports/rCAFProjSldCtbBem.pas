unit rCAFProjSldCtbBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, IvDictio, IvMulti, uCmRptManager, TXComp, 
  CmParamReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, uCMFileUtils,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DB,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams,
  uCtrlPadroes, uCtrlParamCAF, uCtrlFechamentoProRata;

type
  TrptCAFProjSldCtbBem = class(TFrmCmReport)
    sqlProjSldCtbBem: TCMSqlParams;
    cdsProjSldCtbBem: TCMClientDataSet;
    dsProjSldCtbBem: TwwDataSource;
    ppProjSldCtbBem: TppBDEPipeline;
    rpProjSldCtbBem: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    pplbldata1: TppLabel;
    lblDataFim: TppLabel;
    ppLine3: TppLine;
    ppLabel1: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand10: TppDetailBand;
    rbdbeClasse: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText12: TppDBText;
    ppDBText19: TppDBText;
    ppDBText26: TppDBText;
    ppLabel12: TppLabel;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    ProRata : TCtrlFechamentoProRata;
    sMascaraGrupo : String;
  public
    { Public declarations }
  end;

var
  rptCAFProjSldCtbBem: TrptCAFProjSldCtbBem;

implementation

{$R *.dfm}

procedure TrptCAFProjSldCtbBem.CrmRptCMBeforePrint(Sender: TObject);
var
   iAux : Integer;
   fValOrg, fCmBem,
   fDepLanc, fCmDep : Currency;
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ProRata := TCtrlFechamentoProRata.Create(Nil);
   ProRata.InitializeAs(Padroes);
   try
      try
         Screen.Cursor := crSQLWait;
         ParamCAF.CarregaProp(CrmRptCM.IdEmpresa);
         //-------------------------------------------------------------------------------
         sMascaraGrupo := ParamCAF.MASCCODGRUPO;
         iAux := 1;
         while iAux <= length(sMascaraGrupo) do
         begin
            if sMascaraGrupo[iAux] = '9' then
               sMascaraGrupo[iAux] := '#';
            iAux := iAux + 1;
         end;
         sMascaraGrupo := sMascaraGrupo + ';0; ';
         //-------------------------------------------------------------------------------
         sqlProjSldCtbBem.SQL.Clear;
         sqlProjSldCtbBem.SQL.Add(' SELECT G.IDGRUPO, G.CLASSE, G.NOME AS DESCGRUPO, ');
         sqlProjSldCtbBem.SQL.Add('        B.PLACA, B.DESBEM,B.IDBEM, ');
         sqlProjSldCtbBem.SQL.Add('        (0.00) AS VALCUSTO, ');
         sqlProjSldCtbBem.SQL.Add('        (0.00) AS VALCMCUSTO, ');
         sqlProjSldCtbBem.SQL.Add('        (0.00) AS VALDEPREC, ');
         sqlProjSldCtbBem.SQL.Add('        (0.00) AS VALCMDEPREC, ');
         sqlProjSldCtbBem.SQL.Add('        (0.00) AS VALSALDO ');
         sqlProjSldCtbBem.SQL.Add(' FROM BEM B, ');
         sqlProjSldCtbBem.SQL.Add('      GRUPO G ');
         sqlProjSldCtbBem.SQL.Add(' WHERE B.IDPESSOA = :IDPESSOA ');
         sqlProjSldCtbBem.SQL.Add(CmpRptCM.ParamValues[2].AsString);
         sqlProjSldCtbBem.SQL.Add('   AND B.CONTROLE = ''T'' ');
         sqlProjSldCtbBem.SQL.Add('   AND B.BAIXATOTAL <> ''S'' ');
         sqlProjSldCtbBem.SQL.Add('   AND B.IDGRUPO = G.IDGRUPO ');
         sqlProjSldCtbBem.SQL.Add(' ORDER BY G.CLASSE, B.PLACA ');
         //-------------------------------------------------------------------------------
         sqlProjSldCtbBem.Prepare;
         sqlProjSldCtbBem.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         sqlProjSldCtbBem.Open;
         //-------------------------------------------------------------------------------
         if cdsProjSldCtbBem.IsEmpty then
            Raise Exception.Create('Não existem bens com os parâmetros fornecidos!');
         //-------------------------------------------------------------------------------
         // Calcular as projeções e alimentar a query do relatório
         //-------------------------------------------------------------------------------
         while not cdsProjSldCtbBem.EOF do
         begin
            fValOrg := 0;
            fCmBem := 0;
            fDepLanc := 0;
            fCmDep := 0;
            if not ProRata.ExecutarProjecaoBem(CrmRptCM.IdModulo, CrmRptCM.IdEmpresa,
                                               cdsProjSldCtbBem.FieldByName('IDBEM').AsFloat,
                                               ParamCAF.MOEDAOFICIAL, 1,
                                               CmpRptCM.ParamValues[0].AsDateTime,
                                               fValOrg, fCmBem, fDepLanc, fCmDep) then
               Raise Exception.Create(ProRata.MessageInfo);
            //----------------------------------------------------------------------------
            cdsProjSldCtbBem.Edit;
            cdsProjSldCtbBem.FieldByName('VALCUSTO').AsCurrency := fValOrg;
            cdsProjSldCtbBem.FieldByName('VALCMCUSTO').AsCurrency := fCmBem;
            cdsProjSldCtbBem.FieldByName('VALDEPREC').AsCurrency := fDepLanc;
            cdsProjSldCtbBem.FieldByName('VALCMDEPREC').AsCurrency := fCmDep;
            cdsProjSldCtbBem.FieldByName('VALSALDO').AsCurrency := fValOrg + fCmBem - fDepLanc - fCmDep;
            cdsProjSldCtbBem.Post;
            //----------------------------------------------------------------------------
            cdsProjSldCtbBem.Next;
         end;
         cdsProjSldCtbBem.First;
         //-------------------------------------------------------------------------------
         rbdbeClasse.DisplayFormat := sMascaraGrupo;
         lblDataFim.Text := DatetoStr(CmpRptCM.ParamValues[0].AsDateTime);
      except
         on E : Exception Do
         begin
            CMDebugToFile('PROJEÇÃO DE SALDO CONTÁBIL POR BEM : ' + E.Message);
         end;
      end;
   finally
      ParamCAF.Free;
      ProRata.Free;
   end;
end;

end.
