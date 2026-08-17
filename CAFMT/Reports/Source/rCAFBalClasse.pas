unit rCAFBalClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, ppProd, ppClass, ppReport, ppDB, ppDBPipe, ppDBBDE, uCMfileUtils,
  Wwdatsrc, ppBands, ppVar, ppCtrls, ppPrnabl, ppComm, ppRelatv, ppCache,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet;

type
  TRptCAFBalClasse = class(TFrmCmReport)
    ppBalPatClas: TppBDEPipeline;
    ppBalPatClasppField1: TppField;
    ppBalPatClasppField2: TppField;
    ppBalPatClasppField3: TppField;
    ppBalPatClasppField4: TppField;
    ppBalPatClasppField5: TppField;
    ppBalPatClasppField6: TppField;
    ppBalPatClasppField7: TppField;
    ppBalPatClasppField8: TppField;
    ppBalPatClasppField9: TppField;
    dsBalPatClas: TwwDataSource;
    rpBalPatClas: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    lblEmpresa: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel19: TppLabel;
    ppLabel78: TppLabel;
    ppLabel80: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    rpBalPatClasLabelData: TppLabel;
    rpBalPatClasLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    rpBalPatClasDBText1: TppDBText;
    rpBalPatClasDBText2: TppDBText;
    rpBalPatClasDBText5: TppDBText;
    rpBalPatClasDBText7: TppDBText;
    rpBalPatClasDBText8: TppDBText;
    rpBalPatClasDBText9: TppDBText;
    rpBalPatClasDBText3: TppDBText;
    rpBalPatClasDBText6: TppDBText;
    rpBalPatClasDBText4: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    lblsistema: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppSoma1: TppVariable;
    ppLabel75: TppLabel;
    ppLine19: TppLine;
    ppSoma2: TppVariable;
    ppSoma3: TppVariable;
    ppSoma4: TppVariable;
    ppSoma5: TppVariable;
    ppSoma6: TppVariable;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsClasAnaliticos: TCMClientDataSet;
    sqlClasAnaliticos: TCMSqlParams;
    sqlClasSinteticos: TCMSqlParams;
    cdsClasSinteticos: TCMClientDataSet;
    cdsBalPatClas: TCMClientDataSet;
    sqlBalPatClas: TCMSqlParams;
    cdsBalPatAux: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand2AfterPrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure rpBalPatClasBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFBalClasse: TRptCAFBalClasse;

implementation

uses uAtivoFixo;
{$R *.DFM}

procedure TRptCAFBalClasse.CrmRptCMBeforePrint(Sender: TObject);
var
   fValOrg, fCmBem, fDepLanc, fCmDep, fValCtb : Double;
   iTam, iQuant,iAux                : Integer;
   sMensagem,sMascaraClasse :string;
begin
   inherited;

   Try

      cdsBalPatAux.Data := cdsBalPatClas.Data;
      //-------------------------------------------------------------------------------------
      sqlBalPatClas.Open;
      cdsClasAnaliticos.Close;
      //-------------------------------------------------------------------------------------

      sMascaraClasse := cdsParamCaf.FieldByName('MASCARACLASSE').AsString;
      iAux := 1;
      while iAux <= length(sMascaraClasse) do
      begin
         if sMascaraClasse[iAux] = '9' then
            sMascaraClasse[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraClasse := sMascaraClasse + ';0; ';
      //-------------------------------------------------------------------------------------
      // Calcula as Classes Analiticas
      //-------------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlClasAnaliticos.SQL.Strings[32] := 'AND (B.IDCLASSEBEM = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+')';
      end else
      begin
         sqlClasAnaliticos.SQL.Strings[32] := ' ';
      end;
      //-------------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsBoolean then
      begin
         sqlClasAnaliticos.SQL.Strings[33] := ' ';
      end else
      begin
         sqlClasAnaliticos.SQL.Strings[33] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //-------------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         sqlClasAnaliticos.SQL.Strings[34] := ' ';
      end else
      begin
         sqlClasAnaliticos.SQL.Strings[34] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //-------------------------------------------------------------------------------------
      sqlClasAnaliticos.Prepare;
      sqlClasAnaliticos.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlClasAnaliticos.ParamByName('PDATASLD').AsDate   := CmpRptCM.ParamValues[0].AsDateTime;
      sqlClasAnaliticos.Open;
      //-------------------------------------------------------------------------------------
      while not cdsClasAnaliticos.EOF do
      begin
         if cdsBalPatClas.Locate('CODHIERARQ',cdsClasAnaliticos.FieldByName('CODHIERARQ').AsString,[]) then
         begin
            while (not cdsClasAnaliticos.EOF) and (cdsClasAnaliticos.FieldByName('CODHIERARQ').AsString = cdsBalPatClas.FieldByName('CODHIERARQ').AsString) do
            begin
               cdsBalPatClas.Edit;
               cdsBalPatClas.FieldByName('VALORG').AsCurrency  := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('VALORG').AsFloat  + cdsClasAnaliticos.FieldByName('VALORG0').AsFloat);
               cdsBalPatClas.FieldByName('CMBEM').AsCurrency   := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('CMBEM').AsFloat   + cdsClasAnaliticos.FieldByName('CMBEM0').AsFloat);
               cdsBalPatClas.FieldByName('DEPLANC0').AsCurrency := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('DEPLANC').AsFloat + cdsClasAnaliticos.FieldByName('DEPLANC0').AsFloat);
               cdsBalPatClas.FieldByName('CMDEP').AsCurrency   := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('CMDEP').AsFloat   + cdsClasAnaliticos.FieldByName('CMDEP0').AsFloat);
               cdsBalPatClas.FieldByName('VALCTB').AsCurrency  := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('VALCTB').AsFloat  + cdsClasAnaliticos.FieldByName('VALCTB0').AsFloat);
               cdsBalPatClas.FieldByName('QUANT').AsInteger    := cdsBalPatClas.FieldByName('QUANT').AsInteger + cdsClasAnaliticos.FieldByName('QUANT').AsInteger;
               //----------------------------------------------------------------------------
               cdsClasAnaliticos.Next;
            end;
         end else
         begin
            cdsClasAnaliticos.Next;
         end;
      end;
      cdsClasAnaliticos.Close;
      //-------------------------------------------------------------------------------------
      // Calcula as Classes Sintéticas
      //-------------------------------------------------------------------------------------
      cdsClasSinteticos.Open;
      while not cdsClasSinteticos.EOF do
      begin
         //----------------------------------------------------------------------------------
         iTam     := length(cdsClasSinteticos.FieldByName('CODHIERARQ').AsString);
         fValOrg  := 0;
         fCmBem   := 0;
         fDepLanc := 0;
         fCmDep   := 0;
         fValCtb  := 0;
         iQuant   := 0;
         //----------------------------------------------------------------------------------
         cdsBalPatClas.Locate('CODHIERARQ',cdsClasSinteticos.FieldByName('CODHIERARQ').AsString,[loPartialKey]);
         while (not cdsBalPatClas.EOF) and
               (copy(cdsBalPatClas.FieldByName('CODHIERARQ').AsString,1,iTam) = cdsClasSinteticos.FieldByName('CODHIERARQ').AsString) do
         begin
            fValOrg  := AtivoFixo.ConvNum(fValOrg  + cdsBalPatClas.FieldByName('VALORG').AsFloat);
            fCmBem   := AtivoFixo.ConvNum(fCmBem   + cdsBalPatClas.FieldByName('CMBEM').AsFloat);
            fDepLanc := AtivoFixo.ConvNum(fDepLanc + cdsBalPatClas.FieldByName('DEPLANC').AsFloat);
            fCmDep   := AtivoFixo.ConvNum(fCmDep   + cdsBalPatClas.FieldByName('CMDEP').AsFloat);
            fValCtb  := AtivoFixo.ConvNum(fValCtb  + cdsBalPatClas.FieldByName('VALCTB').AsFloat);
            iQuant   := iQuant   + cdsBalPatClas.FieldByName('QUANT').AsInteger;
            cdsBalPatClas.Next;
         end;
         //----------------------------------------------------------------------------------
         cdsBalPatClas.Locate('CODHIERARQ',cdsClasSinteticos.FieldByName('CODHIERARQ').AsString,[]);
         cdsBalPatClas.Edit;
         cdsBalPatClas.FieldByName('VALORG').AsCurrency  := fValOrg;
         cdsBalPatClas.FieldByName('CMBEM').AsCurrency   := fCmBem;
         cdsBalPatClas.FieldByName('DEPLANC').AsCurrency := fDepLanc;
         cdsBalPatClas.FieldByName('CMDEP').AsCurrency   := fCmDep;
         cdsBalPatClas.FieldByName('VALCTB').AsCurrency  := fValCtb;
         cdsBalPatClas.FieldByName('QUANT').AsInteger    := iQuant;
         cdsBalPatClas.Post;

         //----------------------------------------------------------------------------------
         cdsClasSinteticos.Next;
      end;
      cdsClasSinteticos.Close;
      //-------------------------------------------------------------------------------------
      sMensagem := '';
      if cdsBalPatClas.IsEmpty then
         sMensagem := 'Não existem dados com os parâmetros fornecidos!';
      //-------------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //-------------------------------------------------------------------------------------
      cdsBalPatAux.Close;
      cdsBalPatAux.Open;
      cdsBalPatClas.First;
      while not cdsBalPatClas.EOF do
      begin
         //----------------------------------------------------------------------------------
         if (CmpRptCM.ParamValues[4].AsBoolean) or
            (((cdsBalPatClas.FieldByName('VALORG').AsFloat + cdsBalPatClas.FieldByName('CMBEM').AsFloat) -
              (cdsBalPatClas.FieldByName('DEPLANC').AsFloat + cdsBalPatClas.FieldByName('CMDEP').AsFloat) <> 0)) then
         begin
            if (not CmpRptCM.ParamValues[3].AsBoolean) or
               ((CmpRptCM.ParamValues[3].AsBoolean) and (cdsBalPatClas.FieldByName('S_A').AsString = 'S')) then
            begin
               cdsBalPatAux.Insert;
               cdsBalPatAux.FieldByName('CODHIERARQ').AsString := cdsBalPatClas.FieldByName('CODHIERARQ').AsString;
               cdsBalPatAux.FieldByName('DESCRICAO').AsString  := cdsBalPatClas.FieldByName('DESCRICAO').AsString;
               cdsBalPatAux.FieldByName('S_A').AsString        := cdsBalPatClas.FieldByName('S_A').AsString;
               cdsBalPatAux.FieldByName('VALORG').AsCurrency   := cdsBalPatClas.FieldByName('VALORG').AsFloat;
               cdsBalPatAux.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas.FieldByName('CMBEM').AsFloat;
               cdsBalPatAux.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas.FieldByName('DEPLANC').AsFloat;
               cdsBalPatAux.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas.FieldByName('CMDEP').AsFloat;
               cdsBalPatAux.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas.FieldByName('VALCTB').AsFloat;
               cdsBalPatAux.FieldByName('QUANT').AsCurrency    := cdsBalPatClas.FieldByName('QUANT').AsFloat;
               cdsBalPatAux.Post;
            end;
         end;
         //----------------------------------------------------------------------------------
         cdsBalPatClas.Next;
      end;
      //-------------------------------------------------------------------------------------
      rpBalPatClasDBTEXT1.DisplayFormat := sMascaraClasse;
      rpBalPatClasLabelData.Caption     := DateToStr(CmpRptCM.ParamValues[0].AsDateTime);

   Except
     On E:Exception Do
     Begin
       CMDebugToFile('Erro no Relatório Balancete Patrimonial por Classe:' + sMensagem + (#13+#10) + E.Message );
     End;
   End;

end;
procedure TRptCAFBalClasse.ppDetailBand2AfterPrint(Sender: TObject);
begin
  inherited;
   if cdsBalPatClas.FieldByName('S_A').AsString = 'A' then
   begin
      ppSoma1.Value := ppSoma1.Value + cdsBalPatClas.FieldByName('QUANT').AsInteger;
      ppSoma2.Value := AtivoFixo.ConvNum(ppSoma2.Value + cdsBalPatClas.FieldByName('VALORG').AsCurrency);
      ppSoma3.Value := AtivoFixo.ConvNum(ppSoma3.Value + cdsBalPatClas.FieldByName('CMBEM').AsCurrency);
      ppSoma4.Value := AtivoFixo.ConvNum(ppSoma4.Value + cdsBalPatClas.FieldByName('DEPLANC').AsCurrency);
      ppSoma5.Value := AtivoFixo.ConvNum(ppSoma5.Value + cdsBalPatClas.FieldByName('CMDEP').AsCurrency);
      ppSoma6.Value := AtivoFixo.ConvNum(ppSoma6.Value + cdsBalPatClas.FieldByName('VALCTB').AsCurrency);
   end;

end;

procedure TRptCAFBalClasse.ppDetailBand2BeforePrint(Sender: TObject);
begin
  inherited;
   if cdsBalPatClas.FieldByName('S_A').AsString = 'S' then
   begin
      rpBalPatClasDBText1.Font.Style := [fsBold];
      rpBalPatClasDBText2.Font.Style := [fsBold];
      rpBalPatClasDBText3.Font.Style := [fsBold];
      rpBalPatClasDBText4.Font.Style := [fsBold];
      rpBalPatClasDBText5.Font.Style := [fsBold];
      rpBalPatClasDBText6.Font.Style := [fsBold];
      rpBalPatClasDBText7.Font.Style := [fsBold];
      rpBalPatClasDBText8.Font.Style := [fsBold];
      rpBalPatClasDBText9.Font.Style := [fsBold];
   end else
   if cdsBalPatClas.FieldByName('S_A').AsString = 'A' then
   begin
      rpBalPatClasDBText1.Font.Style := [];
      rpBalPatClasDBText2.Font.Style := [];
      rpBalPatClasDBText3.Font.Style := [];
      rpBalPatClasDBText4.Font.Style := [];
      rpBalPatClasDBText5.Font.Style := [];
      rpBalPatClasDBText6.Font.Style := [];
      rpBalPatClasDBText7.Font.Style := [];
      rpBalPatClasDBText8.Font.Style := [];
      rpBalPatClasDBText9.Font.Style := [];
   end else
   if cdsBalPatClas.FieldByName('S_A').AsString = '' then
   begin
      rpBalPatClasDBText1.Font.Style := [fsItalic];
      rpBalPatClasDBText2.Font.Style := [fsItalic];
      rpBalPatClasDBText3.Font.Style := [fsItalic];
      rpBalPatClasDBText4.Font.Style := [fsItalic];
      rpBalPatClasDBText5.Font.Style := [fsItalic];
      rpBalPatClasDBText6.Font.Style := [fsItalic];
      rpBalPatClasDBText7.Font.Style := [fsItalic];
      rpBalPatClasDBText8.Font.Style := [fsItalic];
      rpBalPatClasDBText9.Font.Style := [fsItalic];
   end;

end;

procedure TRptCAFBalClasse.rpBalPatClasBeforePrint(Sender: TObject);
begin
  inherited;
   ppSoma1.Value := 0;
   ppSoma2.Value := 0;
   ppSoma3.Value := 0;
   ppSoma4.Value := 0;
   ppSoma5.Value := 0;
   ppSoma6.Value := 0;

end;

end.
