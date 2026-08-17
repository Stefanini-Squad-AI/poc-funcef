unit rCAFBalPatGrpA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, uCMfileUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, uAtivoFixo,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, StdCtrls;

type
  TRptCAFBalPatGrpA = class(TFrmCmReport)
    rpBalPatGrpA: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    ppLine17: TppLine;
    LBLEMPRESA: TppLabel;
    rpBalPatGrpLabel1: TppLabel;
    rpBalPatGrpLabel2: TppLabel;
    rpBalPatGrpLabel3: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel5: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel7: TppLabel;
    rpBalPatGrpLabel8: TppLabel;
    rpBalPatGrpLabel9: TppLabel;
    rpBalPatGrpLabel10: TppLabel;
    rpBalPatGrpLabel11: TppLabel;
    rpBalPatGrpLabel12: TppLabel;
    ppLabel111: TppLabel;
    ppDetailBand9: TppDetailBand;
    rpBalPatGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    rpBalPatGrpDBText6: TppDBText;
    rpBalPatGrpDBText7: TppDBText;
    rpBalPatGrpDBText8: TppDBText;
    rpBalPatGrpDBText3: TppDBText;
    rpBalPatGrpDBText9: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppBalPatGrpA: TppBDEPipeline;
    dsBalPatGrpA: TwwDataSource;
    cdsBalPatGrpA: TCMClientDataSet;
    sqlBalPatGrpA: TCMSqlParams;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    cdsBalPatAux: TCMClientDataSet;
    sqlDepPerTransf: TCMSqlParams;
    cdsDepPerTransf: TCMClientDataSet;
    sqlDepPerTransfR: TCMSqlParams;
    sqlBalPatAux: TCMSqlParams;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    LBLSISTEMA: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
  private
    function DataUltFechamento : String;

  public
    sTipoGrupo,
    sClasseGrupo,
    sMascaraGrupo : String;
    bInvestImob   : Boolean;
  end;

var
  RptCAFBalPatGrpA: TRptCAFBalPatGrpA;

implementation

{$R *.DFM}

procedure TRptCAFBalPatGrpA.CrmRptCMBeforePrint(Sender: TObject);
var
   fValOrg, fCmBem,
   fDepLanc, fDepMes, fCmDep,
   fReavValOrg, fReavCmBem,
   fReavDepLanc, fReavDepMes, fReavCmDep,
   fValCtb                     : Currency;
   iTam, iQuant,iAux           : Integer;
   iDia, iMes, iAno            : Word;

begin
   Application.ProcessMessages;
   try
      inherited;
      sqlParamCaf.Prepare;
      sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlParamCaf.Open;
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      sMascaraGrupo := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraGrupo := sMascaraGrupo + ';0; ';
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlGrpAnaliticos.SQL.Strings[30] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlGrpAnaliticos.SQL.Strings[69] := ' AND (LTRIM(RTRIM(G2.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlGrpAnaliticos.SQL.Strings[108] := ' AND (LTRIM(RTRIM(G3.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlGrpAnaliticos.SQL.Strings[30] := ' AND (SB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger) + ') ';
            sqlGrpAnaliticos.SQL.Strings[69] := ' AND (SB2.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger) + ') ';
            sqlGrpAnaliticos.SQL.Strings[108] := ' AND (SB3.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger) + ') ';
         end;
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' ';
         sqlGrpAnaliticos.SQL.Strings[69] := ' ';
         sqlGrpAnaliticos.SQL.Strings[108] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[ 31] := ' AND (G1.FLGIMOVEL = 0) ';
         sqlGrpAnaliticos.SQL.Strings[ 70] := ' AND (G2.FLGIMOVEL = 0) ';
         sqlGrpAnaliticos.SQL.Strings[109] := ' AND (G3.FLGIMOVEL = 0) ';
         rpBalPatGrpLabel12.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[ 31] := ' AND (G1.FLGIMOVEL = 1) ';
         sqlGrpAnaliticos.SQL.Strings[ 70] := ' AND (G2.FLGIMOVEL = 1) ';
         sqlGrpAnaliticos.SQL.Strings[109] := ' AND (G3.FLGIMOVEL = 1) ';
         rpBalPatGrpLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[ 31] := ' ';
         sqlGrpAnaliticos.SQL.Strings[ 70] := ' ';
         sqlGrpAnaliticos.SQL.Strings[109] := ' ';
         rpBalPatGrpLabel12.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[ 32] := ' ';
         sqlGrpAnaliticos.SQL.Strings[ 71] := ' ';
         sqlGrpAnaliticos.SQL.Strings[110] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[ 32] := ' AND (B1.CONTROLE = ''T'') ';
         sqlGrpAnaliticos.SQL.Strings[ 71] := ' AND (B2.CONTROLE = ''T'') ';
         sqlGrpAnaliticos.SQL.Strings[110] := ' AND (B3.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[ 33] := ' ';
         sqlGrpAnaliticos.SQL.Strings[ 72] := ' ';
         sqlGrpAnaliticos.SQL.Strings[111] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[ 33] := ' AND (B1.BAIXATOTAL <> ''S'') ';
         sqlGrpAnaliticos.SQL.Strings[ 72] := ' AND (B2.BAIXATOTAL <> ''S'') ';
         sqlGrpAnaliticos.SQL.Strings[111] := ' AND (B3.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[7].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[ 35] := ' AND (B1.TAXADEP = 0)';
         sqlGrpAnaliticos.SQL.Strings[ 74] := ' AND (B2.TAXADEP = 0)';
         sqlGrpAnaliticos.SQL.Strings[113] := ' AND (B3.TAXADEP = 0)';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[ 35] := ' ';
         sqlGrpAnaliticos.SQL.Strings[ 74] := ' ';
         sqlGrpAnaliticos.SQL.Strings[113] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlBalPatAux.Prepare;
      sqlBalPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlBalPatAux.Open;
      sqlBalPatGrpA.Open;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      sqlGrpAnaliticos.Prepare;
      //----------------------------------------------------------------------------------
      // Filtragem pela qualificação da depreciação
      // 0 - Todos
      // 1 - Não Depreciáveis
      // 2 - Parcialmente Depreciados
      // 3 - Totalmente Depreciados
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[7].AsInteger of
         0: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
         3: begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 1;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      else  begin
               sqlGrpAnaliticos.ParamByName('PDEPREC').AsInteger    := 0;
               sqlGrpAnaliticos.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATAINI').AsDate   := EncodeDate(iAno,iMes,01);
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDate   := CmpRptCM.ParamValues[0].AsDateTime;
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsBalPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsBalPatAux.Edit;
               cdsBalPatAux.FieldByName('QUANT').AsInteger        := cdsGrpAnaliticos.FieldByName('QUANT').AsInteger;
               cdsBalPatAux.FieldByName('VALORG').AsCurrency      := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsBalPatAux.FieldByName('CMBEM').AsCurrency       := cdsGrpAnaliticos.FieldByName('CMBEM0').AsCurrency;
               cdsBalPatAux.FieldByName('DEPLANC').AsCurrency     := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsBalPatAux.FieldByName('DEPMES').AsCurrency      := cdsGrpAnaliticos.FieldByName('DEPMES').AsCurrency;
               cdsBalPatAux.FieldByName('CMDEP').AsCurrency       := cdsGrpAnaliticos.FieldByName('CMDEP0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVVALORG').AsCurrency  := cdsGrpAnaliticos.FieldByName('REAVVALORG0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVCMBEM').AsCurrency   := cdsGrpAnaliticos.FieldByName('REAVCMBEM0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVDEPLANC').AsCurrency := cdsGrpAnaliticos.FieldByName('REAVDEPLANC0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency  := cdsGrpAnaliticos.FieldByName('REAVDEPMES').AsCurrency;
               cdsBalPatAux.FieldByName('REAVCMDEP').AsCurrency   := cdsGrpAnaliticos.FieldByName('REAVCMDEP0').AsCurrency;
               cdsBalPatAux.FieldByName('VALCTB').AsCurrency      := cdsGrpAnaliticos.FieldByName('VALCTB0').AsCurrency;
               //-------------------------------------------------------------------------
               cdsGrpAnaliticos.Next;
            end;
         end else
         begin
            cdsGrpAnaliticos.Next;
         end;
      end;
      cdsGrpAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Calcula os Ajustes das Transferencias
      //----------------------------------------------------------------------------------
     {if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlDepPerTransf.SQL.Strings[30] := ' AND (SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+') ';
         sqlDepPerTransfR.SQL.Strings[30] := ' AND (SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+') ';
      end else
      begin
         sqlDepPerTransf.SQL.Strings[30] := ' ';
         sqlDepPerTransfR.SQL.Strings[30] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlDepPerTransf.SQL.Strings[31] := ' AND (G.FLGIMOVEL = 0) ';
         sqlDepPerTransfR.SQL.Strings[31] := ' AND (G.FLGIMOVEL = 0) ';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlDepPerTransf.SQL.Strings[31] := ' AND (G.FLGIMOVEL = 1) ';
         sqlDepPerTransfR.SQL.Strings[31] := ' AND (G.FLGIMOVEL = 1) ';
      end else
      begin
         sqlDepPerTransf.SQL.Strings[31] := ' ';
         sqlDepPerTransfR.SQL.Strings[31] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlDepPerTransf.SQL.Strings[32] := ' ';
         sqlDepPerTransfR.SQL.Strings[32] := ' ';
      end else
      begin
         sqlDepPerTransf.SQL.Strings[32] := ' AND (B.CONTROLE = ''T'') ';
         sqlDepPerTransfR.SQL.Strings[32] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlDepPerTransf.SQL.Strings[33] := ' ';
         sqlDepPerTransfR.SQL.Strings[33] := ' ';
      end else
      begin
         sqlDepPerTransf.SQL.Strings[33] := ' AND (B.BAIXATOTAL <> ''S'') ';
         sqlDepPerTransfR.SQL.Strings[33] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      // Processa as Depreciações dos Custos
      //----------------------------------------------------------------------------------
      sqlDepPerTransf.Prepare;
      sqlDepPerTransf.ParamByName('PIDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;
      sqlDepPerTransf.ParamByName('PDATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
      sqlDepPerTransf.ParamByName('PDATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlDepPerTransf.Open;
      //----------------------------------------------------------------------------------
      while not cdsDepPerTransf.EOF do
      begin
         if cdsBalPatAux.Locate('CLASSE',trim(cdsDepPerTransf.FieldByName('CODGRUPO').AsString),[]) then
         begin
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('DEPMES').AsCurrency := cdsBalPatAux.FieldByName('DEPMES').AsCurrency - cdsDepPerTransf.FieldByName('VALOR').AsCurrency;
            cdsBalPatAux.Post;
         end;
         if cdsBalPatAux.Locate('CLASSE',trim(cdsDepPerTransf.FieldByName('CODGRUPOANT').AsString),[]) then
         begin
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('DEPMES').AsCurrency := cdsBalPatAux.FieldByName('DEPMES').AsCurrency + cdsDepPerTransf.FieldByName('VALOR').AsCurrency;
            cdsBalPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsDepPerTransf.Next;
      end;
      cdsDepPerTransf.Close;
      //----------------------------------------------------------------------------------
      // Processa as Depreciações dos Custos
      //----------------------------------------------------------------------------------
      sqlDepPerTransfR.Prepare;
      sqlDepPerTransfR.ParamByName('PIDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;
      sqlDepPerTransfR.ParamByName('PDATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
      sqlDepPerTransfR.ParamByName('PDATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlDepPerTransfR.Open;
      //----------------------------------------------------------------------------------
      while not cdsDepPerTransf.EOF do
      begin
         if cdsBalPatAux.Locate('CLASSE',trim(cdsDepPerTransf.FieldByName('CODGRUPO').AsString),[]) then
         begin
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency := cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency - cdsDepPerTransf.FieldByName('VALOR').AsCurrency;
            cdsBalPatAux.Post;
         end;
         if cdsBalPatAux.Locate('CLASSE',trim(cdsDepPerTransf.FieldByName('CODGRUPOANT').AsString),[]) then
         begin
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency := cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency + cdsDepPerTransf.FieldByName('VALOR').AsCurrency;
            cdsBalPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsDepPerTransf.Next;
      end;
      cdsDepPerTransf.Close;}
      //----------------------------------------------------------------------------------
      // Calcula os Grupos Sintéticos
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND (G.FLGIMOVEL = 0) ';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND (G.FLGIMOVEL = 1) ';
      end;
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpSinteticos.EOF do
      begin
         iTam         := length(cdsGrpSinteticos.FieldByName('CLASSE').AsString);
         fValOrg      := 0;
         fCmBem       := 0;
         fDepLanc     := 0;
         fDepMes      := 0;
         fCmDep       := 0;
         fReavValOrg  := 0;
         fReavCmBem   := 0;
         fReavDepLanc := 0;
         fReavDepMes  := 0;
         fReavCmDep   := 0;
         fValCtb      := 0;
         iQuant       := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while (not cdsBalPatAux.EOF) and
               (copy(cdsBalPatAux.FieldByName('CLASSE').AsString,1,iTam) = cdsGrpSinteticos.FieldByName('CLASSE').AsString) do
         begin
            iQuant       := iQuant + cdsBalPatAux.FieldByName('QUANT').AsInteger;
            fValOrg      := AtivoFixo.ConvNum(fValOrg      + cdsBalPatAux.FieldByName('VALORG').AsCurrency) ;
            fCmBem       := AtivoFixo.ConvNum(fCmBem       + cdsBalPatAux.FieldByName('CMBEM').AsCurrency)  ;
            fDepLanc     := AtivoFixo.ConvNum(fDepLanc     + cdsBalPatAux.FieldByName('DEPLANC').AsCurrency);
            fDepMes      := AtivoFixo.ConvNum(fDepMes      + cdsBalPatAux.FieldByName('DEPMES').AsCurrency) ;
            fCmDep       := AtivoFixo.ConvNum(fCmDep       + cdsBalPatAux.FieldByName('CMDEP').AsCurrency)  ;
            fReavValOrg  := AtivoFixo.ConvNum(fReavValOrg  + cdsBalPatAux.FieldByName('REAVVALORG').AsCurrency) ;
            fReavCmBem   := AtivoFixo.ConvNum(fReavCmBem   + cdsBalPatAux.FieldByName('REAVCMBEM').AsCurrency)  ;
            fReavDepLanc := AtivoFixo.ConvNum(fReavDepLanc + cdsBalPatAux.FieldByName('REAVDEPLANC').AsCurrency);
            fReavDepMes  := AtivoFixo.ConvNum(fReavDepMes  + cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency) ;
            fReavCmDep   := AtivoFixo.ConvNum(fReavCmDep   + cdsBalPatAux.FieldByName('REAVCMDEP').AsCurrency)  ;
            fValCtb      := AtivoFixo.ConvNum(fValCtb      + cdsBalPatAux.FieldByName('VALCTB').AsCurrency) ;
            cdsBalPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CLASSE',cdsGrpSinteticos.FieldByName('CLASSE').AsString,[]);
         cdsBalPatAux.Edit;
         cdsBalPatAux.FieldByName('QUANT').AsInteger        := iQuant;
         cdsBalPatAux.FieldByName('VALORG').AsCurrency      := fValOrg;
         cdsBalPatAux.FieldByName('CMBEM').AsCurrency       := fCmBem;
         cdsBalPatAux.FieldByName('DEPLANC').AsCurrency     := fDepLanc;
         cdsBalPatAux.FieldByName('DEPMES').AsCurrency      := fDepMes;
         cdsBalPatAux.FieldByName('CMDEP').AsCurrency       := fCmDep;
         cdsBalPatAux.FieldByName('REAVVALORG').AsCurrency  := fReavValOrg;
         cdsBalPatAux.FieldByName('REAVCMBEM').AsCurrency   := fReavCmBem;
         cdsBalPatAux.FieldByName('REAVDEPLANC').AsCurrency := fReavDepLanc;
         cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency  := fReavDepMes;
         cdsBalPatAux.FieldByName('REAVCMDEP').AsCurrency   := fReavCmDep;
         cdsBalPatAux.FieldByName('VALCTB').AsCurrency      := fValCtb;
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
      //----------------------------------------------------------------------------------
      if cdsBalPatAux.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsBalPatAux.First;
      while not cdsBalPatAux.EOF do
      begin
         if CmpRptCM.ParamValues[5].AsBoolean or
            ((cdsBalPatAux.FieldByName('VALORG').AsFloat + cdsBalPatAux.FieldByName('CMBEM').AsFloat -
              cdsBalPatAux.FieldByName('DEPLANC').AsFloat - cdsBalPatAux.FieldByName('CMDEP').AsFloat +
              cdsBalPatAux.FieldByName('REAVVALORG').AsFloat + cdsBalPatAux.FieldByName('REAVCMBEM').AsFloat -
              cdsBalPatAux.FieldByName('REAVDEPLANC').AsFloat - cdsBalPatAux.FieldByName('REAVCMDEP').AsFloat) <> 0) then
         begin
            if (not CmpRptCM.ParamValues[6].AsBoolean) or
               ((CmpRptCM.ParamValues[6].AsBoolean) and (cdsBalPatAux.FieldByName('S_A').AsString = 'S')) then
            begin
               cdsBalPatGrpA.Append;
               cdsBalPatGrpA.FieldByName('IDGRUPO').AsInteger      := cdsBalPatAux.FieldByName('IDGRUPO').AsInteger;
               cdsBalPatGrpA.FieldByName('CLASSE').AsString        := cdsBalPatAux.FieldByName('CLASSE').AsString;
               cdsBalPatGrpA.FieldByName('DESCGRUPO').AsString     := cdsBalPatAux.FieldByName('DESCGRUPO').AsString;
               cdsBalPatGrpA.FieldByName('S_A').AsString           := cdsBalPatAux.FieldByName('S_A').AsString;
               cdsBalPatGrpA.FieldByName('QUANT').AsInteger        := cdsBalPatAux.FieldByName('QUANT').AsInteger;
               cdsBalPatGrpA.FieldByName('VALORG').AsCurrency      := cdsBalPatAux.FieldByName('VALORG').AsFloat;
               cdsBalPatGrpA.FieldByName('CMBEM').AsCurrency       := cdsBalPatAux.FieldByName('CMBEM').AsFloat;
               cdsBalPatGrpA.FieldByName('DEPLANC').AsCurrency     := cdsBalPatAux.FieldByName('DEPLANC').AsFloat;
               cdsBalPatGrpA.FieldByName('DEPMES').AsCurrency      := cdsBalPatAux.FieldByName('DEPMES').AsFloat;
               cdsBalPatGrpA.FieldByName('CMDEP').AsCurrency       := cdsBalPatAux.FieldByName('CMDEP').AsFloat;
               cdsBalPatGrpA.FieldByName('REAVVALORG').AsCurrency  := cdsBalPatAux.FieldByName('REAVVALORG').AsFloat;
               cdsBalPatGrpA.FieldByName('REAVCMBEM').AsCurrency   := cdsBalPatAux.FieldByName('REAVCMBEM').AsFloat;
               cdsBalPatGrpA.FieldByName('REAVDEPLANC').AsCurrency := cdsBalPatAux.FieldByName('REAVDEPLANC').AsFloat;
               cdsBalPatGrpA.FieldByName('REAVDEPMES').AsCurrency  := cdsBalPatAux.FieldByName('REAVDEPMES').AsFloat;
               cdsBalPatGrpA.FieldByName('REAVCMDEP').AsCurrency   := cdsBalPatAux.FieldByName('REAVCMDEP').AsFloat;
               cdsBalPatGrpA.FieldByName('VALCTB').AsCurrency      := cdsBalPatAux.FieldByName('VALCTB').AsFloat;
               cdsBalPatGrpA.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Next;
      end;
      cdsBalPatAux.Close;
      //----------------------------------------------------------------------------------
      rpBalPatGrpDBTEXT1.DisplayFormat := sMascaraGrupo;
      rpBalPatGrpLabel10.Text :=  CmpRptCM.ParamValues[0].AsString;
   except
      on E : Exception do
      begin
         CMDebugToFile('Erro no Relatório BALANCETE PATRIMONIAL POR GRUPO!' + #13 + #10 +
                       'Causa : ' + E.Message);
      end;
   end;

end;

procedure TRptCAFBalPatGrpA.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

Function TRptCAFBalPatGrpA.DataUltFechamento : String;
var
   iGrupoDeprec,
   iGrupoDepIni,
   iGrupoDepFim : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Calculo da data baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if CrmRptCM.IdModulo = 7 then
   begin
      if not bInvestImob then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   sqlVerUltFec.Prepare;
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat       := CrmRptCM.IdEmpresa;
   sqlVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   sqlVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   sqlVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   if not cdsVerUltFec.IsEmpty then
      Result := DateToStr(cdsVerUltFec.FieldByName('DATAULT').AsDateTime)
   else
      Result := '';
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

procedure TRptCAFBalPatGrpA.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
begin
   inherited;
   if Index = 1 then
   begin
      sTipoGrupo := Sender.CdsDisplay.FieldByName('TIPO').AsString;
      sClasseGrupo := trim(Sender.CdsDisplay.FieldByName('CLASSE').AsString);
   end;   
   // Sender.CtrlLookup.Text;
end;

end.
