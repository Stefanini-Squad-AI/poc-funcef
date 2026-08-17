unit rCAFBalCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppDB, Db, DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc,
  ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, uCMfileUtils,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport;

type
  TRptCAFBalCC = class(TFrmCmReport)
    ppBalPatCC: TppBDEPipeline;
    rpBalPatCC: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLine9: TppLine;
    LblEmpresa: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    rpBalPatCCLabel1: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText13: TppDBText;
    rpBalPatCCDBText1: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine10: TppLine;
    LBLSISTEMA: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    dsBalPatCC: TwwDataSource;
    sqlBalPatCC: TCMSqlParams;
    cdsBalPatCC: TCMClientDataSet;
    sqlCCAnaliticos: TCMSqlParams;
    cdsCCAnaliticos: TCMClientDataSet;
    sqlCCSinteticos: TCMSqlParams;
    cdsCCSinteticos: TCMClientDataSet;
    cdsParamGlobal: TCMClientDataSet;
    sqlParamGlobal: TCMSqlParams;
    cdsBalPatAux: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    sMascaraCC :string;
    procedure ExecutaRelatorio;

  public
    { Public declarations }
  end;

var
  RptCAFBalCC: TRptCAFBalCC;

implementation

{$R *.DFM}

procedure TRptCAFBalCC.CrmRptCMBeforePrint(Sender: TObject);
Const
   iPosSQL = 90;
var
   fValOrg, fCmBem, fDepLanc, fDepMes, fCmDep, fValCtb : Extended;
   iTam,iAux                                           : Integer;
   iAno, iMes, iDia                                    : Word;
   sMensagem :string;
begin
   inherited;

    Try
       //-------------------------------------------------------------------------------------
       // Pegando mascara
       //-------------------------------------------------------------------------------------
       sqlParamGlobal.Prepare;
       sqlParamGlobal.ParamByName('PIDEMPRESA').AsFloat := CrmRptCM.IdEmpresa;
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
      // Calcula os Centros de Custo Analiticos
      //-------------------------------------------------------------------------------------
      cdsBalPatCC.Close;
      sqlBalPatCC.Open;
      //-------------------------------------------------------------------------------------
      if (CmpRptCM.ParamValues[3].AsInteger <> 0) then
      begin
         sqlCCAnaliticos.SQL.Strings[iPosSQL] := 'AND (RTRIM(CC.CODCENTROCUSTO) = '+#39+IntToStr(CmpRptCM.ParamValues[3].AsInteger)+#39+')';
      end else
      begin
         sqlCCAnaliticos.SQL.Strings[iPosSQL] := ' ';
      end;
      //-------------------------------------------------------------------------------------
      if (CmpRptCM.ParamValues[1].AsBoolean) then
      begin
         sqlCCAnaliticos.SQL.Strings[iPosSQL + 1] := ' ';
      end else
      begin
         sqlCCAnaliticos.SQL.Strings[iPosSQL + 1] := 'AND (B.CONTROLE = ''T'')';
      end;
      //-------------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      sqlCCAnaliticos.Prepare;
      sqlCCAnaliticos.ParamByName('PIDPESSOA').AsFloat  := CrmRptCM.IdEmpresa;
      sqlCCAnaliticos.ParamByName('PDATAINI').AsDate    := EncodeDate(iAno,iMes,01);
      sqlCCAnaliticos.ParamByName('PDATASLD').AsDate    := CmpRptCM.ParamValues[0].AsDateTime;
      sqlCCAnaliticos.Open;
      //-------------------------------------------------------------------------------------
      while not cdsCCAnaliticos.EOF do
      begin
         if (cdsBalPatCC.Locate('IDCENTROCUSTO',cdsCCAnaliticos.FieldByName('CODCENTROCUSTO').AsInteger,[])) then
         begin
            while (not cdsCCAnaliticos.EOF) and (cdsCCAnaliticos.FieldByName('CODCENTROCUSTO').AsInteger = cdsBalPatCC.FieldByName('IDCENTROCUSTO').AsInteger) do
            begin
               cdsBalPatCC.Edit;
               cdsBalPatCC.FieldByName('VALORG').AsCurrency  := cdsCCAnaliticos.FieldByName('VALORG0').AsFloat;
               cdsBalPatCC.FieldByName('CMBEM').AsCurrency   := cdsCCAnaliticos.FieldByName('CMBEM0').AsFloat;
               cdsBalPatCC.FieldByName('DEPLANC').AsCurrency := cdsCCAnaliticos.FieldByName('DEPLANC0').AsFloat;
               cdsBalPatCC.FieldByName('DEPMES').AsCurrency  := cdsCCAnaliticos.FieldByName('DEPLANCATU0').AsFloat;
               cdsBalPatCC.FieldByName('CMDEP').AsCurrency   := cdsCCAnaliticos.FieldByName('CMDEP0').AsFloat;
               cdsBalPatCC.FieldByName('VALCTB').AsCurrency  := cdsCCAnaliticos.FieldByName('VALCTB0').AsFloat;
               cdsBalPatCC.Post;
               //----------------------------------------------------------------------------
               cdsCCAnaliticos.Next;
            end;
         end else
         begin
            cdsCCAnaliticos.Next;
         end;
      end;
      cdsCCAnaliticos.Close;
      //-------------------------------------------------------------------------------------
      // Calcula os Centros de Custo Sintéticos
      //-------------------------------------------------------------------------------------
      sqlCCSinteticos.Open;
      //-------------------------------------------------------------------------------------
      while not cdsCCSinteticos.EOF do
      begin
         iTam     := length(cdsCCSinteticos.FieldByName('CODCENTROCUSTO').AsString);
         fValOrg  := 0;
         fCmBem   := 0;
         fDepLanc := 0;
         fDepMes  := 0;
         fCmDep   := 0;
         fValCtb  := 0;
         //----------------------------------------------------------------------------------
         cdsBalPatCC.Locate('CODCENTROCUSTO',trim(cdsCCSinteticos.FieldByName('CODCENTROCUSTO').AsString),[loPartialKey]);
         while (not cdsBalPatCC.EOF) and
               (copy(cdsBalPatCC.FieldByName('CODCENTROCUSTO').AsString,1,iTam) = cdsCCSinteticos.FieldByName('CODCENTROCUSTO').AsString) do
         begin
            fValOrg  := fValOrg  + cdsBalPatCC.FieldByName('VALORG').AsFloat  ;
            fCmBem   := fCmBem   + cdsBalPatCC.FieldByName('CMBEM').AsFloat   ;
            fDepLanc := fDepLanc + cdsBalPatCC.FieldByName('DEPLANC').AsFloat ;
            fDepMes  := fDepMes  + cdsBalPatCC.FieldByName('DEPMES').AsFloat ;
            fCmDep   := fCmDep   + cdsBalPatCC.FieldByName('CMDEP').AsFloat   ;
            fValCtb  := fValCtb  + cdsBalPatCC.FieldByName('VALCTB').AsFloat  ;
            cdsBalPatCC.Next;
         end;
         //----------------------------------------------------------------------------------
         cdsBalPatCC.Locate('CODCENTROCUSTO',cdsCCSinteticos.FieldByName('CODCENTROCUSTO').AsString,[]);
         cdsBalPatCC.Edit;
         cdsBalPatCC.FieldByName('VALORG').AsCurrency  := fValOrg;
         cdsBalPatCC.FieldByName('CMBEM').AsCurrency   := fCmBem;
         cdsBalPatCC.FieldByName('DEPLANC').AsCurrency := fDepLanc;
         cdsBalPatCC.FieldByName('DEPMES').AsCurrency  := fDepMes;
         cdsBalPatCC.FieldByName('CMDEP').AsCurrency   := fCmDep;
         cdsBalPatCC.FieldByName('VALCTB').AsCurrency  := fValCtb;
         cdsBalPatCC.Post;
         //----------------------------------------------------------------------------------
         cdsCCSinteticos.Next;
      end;
      cdsCCSinteticos.Close;
      //-------------------------------------------------------------------------------------
      sMensagem := '';
      if cdsBalPatCC.IsEmpty then
         sMensagem := 'Não houve movimentação com os Parâmetros Fornecidos!';
      //-------------------------------------------------------------------------------------
      ExecutaRelatorio;

   Except
     On E:Exception Do
     Begin
       CMDebugToFile('Erro no Relatório Balancete Patrimonial por Centro de Custo:' + sMensagem + (#13+#10) + E.Message );
     End;
   End;

end;

procedure TRptCAFBalCC.ExecutaRelatorio;

begin
    cdsBalPatAux.Data := cdsBalPatCC.Data;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   cdsBalPatCC.First;
   while not cdsBalPatCC.EOF do
   begin
      if (CmpRptCM.ParamValues[2].AsBoolean) or
         (((cdsBalPatCC.FieldByName('VALORG').AsFloat + cdsBalPatCC.FieldByName('CMBEM').AsFloat) -
           (cdsBalPatCC.FieldByName('DEPLANC').AsFloat + cdsBalPatCC.FieldByName('CMDEP').AsFloat) <> 0)) then
      begin
         cdsBalPatAux.Append;
         cdsBalPatAux.FieldByName('CODCENTROCUSTO').AsInteger := cdsBalPatCC.FieldByName('CODCENTROCUSTO').AsInteger;
         cdsBalPatAux.FieldByName('DESCCCUSTO').AsString      := cdsBalPatCC.FieldByName('DESCCCUSTO').AsString;
         cdsBalPatAux.FieldByName('S_A').AsString             := cdsBalPatCC.FieldByName('S_A').AsString;
         cdsBalPatAux.FieldByName('VALORG').AsCurrency        := cdsBalPatCC.FieldByName('VALORG').AsFloat;
         cdsBalPatAux.FieldByName('CMBEM').AsCurrency         := cdsBalPatCC.FieldByName('CMBEM').AsFloat;
         cdsBalPatAux.FieldByName('DEPLANC').AsCurrency       := cdsBalPatCC.FieldByName('DEPLANC').AsFloat;
         cdsBalPatAux.FieldByName('DEPMES').AsCurrency        := cdsBalPatCC.FieldByName('DEPMES').AsFloat;
         cdsBalPatAux.FieldByName('CMDEP').AsCurrency         := cdsBalPatCC.FieldByName('CMDEP').AsFloat;
         cdsBalPatAux.FieldByName('VALCTB').AsCurrency        := cdsBalPatCC.FieldByName('VALCTB').AsFloat;
         cdsBalPatAux.Post;
      end;
      //----------------------------------------------------------------------------------
      cdsBalPatCC.Next;
   end;
   cdsBalPatCC.Close;
   //-------------------------------------------------------------------------------------
   ppDBTEXT10.DisplayFormat := sMascaraCC;
   ppLabel30.Text := DateToStr(CmpRptCM.ParamValues[0].AsDateTime);

end;

end.
