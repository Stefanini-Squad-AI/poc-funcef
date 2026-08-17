unit rCAFBalPatGrpA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, IvDictio, IvMulti, uCMfileUtils;

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
    LBLSISTEMA: TppLabel;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    sTipoGrupo, sClasseGrupo : String;
    iMoedaOficial : Integer;
    sMascaraGrupo : String;
    bInvestImob   : Boolean;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  RptCAFBalPatGrpA: TRptCAFBalPatGrpA;

implementation

{$R *.DFM}

procedure TRptCAFBalPatGrpA.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iAux : Integer;

begin
   inherited;
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
   sqlParamCaf.Open;
   bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
   iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TRptCAFBalPatGrpA.DataUltFechamento : String;
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

function TRptCAFBalPatGrpA.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TRptCAFBalPatGrpA.CrmRptCMBeforePrint(Sender: TObject);
var
   fValOrg, fCmBem,
   fDepLanc, fDepMes, fCmDep,
   fReavValOrg, fReavCmBem,
   fReavDepLanc, fReavDepMes, fReavCmDep,
   fValCtb                     : Currency;
   iTam, iQuant                : Integer;
   iDia, iMes, iAno            : Word;

begin
   inherited;
   Application.ProcessMessages;
   try
      cdsBalPatAux.Close;
      sqlBalPatAux.Prepare;
      sqlBalPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlBalPatAux.Open;
      cdsBalPatGrpA.Close;
      sqlBalPatGrpA.Open;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlGrpAnaliticos.SQL.Strings[34] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlGrpAnaliticos.SQL.Strings[77] := ' AND (LTRIM(RTRIM(G2.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlGrpAnaliticos.SQL.Strings[34] := ' AND SB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
            sqlGrpAnaliticos.SQL.Strings[77] := ' AND SB2.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         end;
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[34] := ' ';
         sqlGrpAnaliticos.SQL.Strings[77] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[35] := ' AND G1.FLGIMOVEL = 0 ';
         sqlGrpAnaliticos.SQL.Strings[78] := ' AND G2.FLGIMOVEL = 0 ';
         rpBalPatGrpLabel12.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[35] := ' AND G1.FLGIMOVEL = 1 ';
         sqlGrpAnaliticos.SQL.Strings[78] := ' AND G2.FLGIMOVEL = 1 ';
         rpBalPatGrpLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[35] := ' ';
         sqlGrpAnaliticos.SQL.Strings[78] := ' ';
         rpBalPatGrpLabel12.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[36] := ' ';
         sqlGrpAnaliticos.SQL.Strings[79] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[36] := ' AND B1.CONTROLE = ''T'' ';
         sqlGrpAnaliticos.SQL.Strings[79] := ' AND B2.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[37] := ' ';
         sqlGrpAnaliticos.SQL.Strings[80] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[37] := ' AND B1.BAIXATOTAL <> ''S'' ';
         sqlGrpAnaliticos.SQL.Strings[80] := ' AND B2.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno,iMes,01);
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDateTime  := CmpRptCM.ParamValues[0].AsDateTime;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsBalPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsBalPatAux.Edit;
               cdsBalPatAux.FieldByName('QUANT').AsInteger := cdsGrpAnaliticos.FieldByName('QUANT').AsInteger;
               cdsBalPatAux.FieldByName('VALORG').AsCurrency := cdsGrpAnaliticos.FieldByName('VALORG0').AsCurrency;
               cdsBalPatAux.FieldByName('CMBEM').AsCurrency := cdsGrpAnaliticos.FieldByName('CMBEM0').AsCurrency;
               cdsBalPatAux.FieldByName('DEPLANC').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsCurrency;
               cdsBalPatAux.FieldByName('DEPMES').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANCATU0').AsCurrency;
               cdsBalPatAux.FieldByName('CMDEP').AsCurrency := cdsGrpAnaliticos.FieldByName('CMDEP0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVVALORG').AsCurrency := cdsGrpAnaliticos.FieldByName('REAVVALORG0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVCMBEM').AsCurrency := cdsGrpAnaliticos.FieldByName('REAVCMBEM0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVDEPLANC').AsCurrency := cdsGrpAnaliticos.FieldByName('REAVDEPLANC0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency := cdsGrpAnaliticos.FieldByName('REAVDEPLANCATU0').AsCurrency;
               cdsBalPatAux.FieldByName('REAVCMDEP').AsCurrency := cdsGrpAnaliticos.FieldByName('REAVCMDEP0').AsCurrency;
               cdsBalPatAux.FieldByName('VALCTB').AsCurrency := cdsGrpAnaliticos.FieldByName('VALCTB0').AsCurrency;
               cdsBalPatAux.Post;
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
      // Calcula os Grupos Sintéticos
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND G.FLGIMOVEL = 0 ';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND G.FLGIMOVEL = 1 ';
      end;
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpSinteticos.EOF do
      begin
         iTam := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
         fValOrg := 0;
         fCmBem := 0;
         fDepLanc := 0;
         fDepMes := 0;
         fCmDep := 0;
         fReavValOrg := 0;
         fReavCmBem := 0;
         fReavDepLanc := 0;
         fReavDepMes := 0;
         fReavCmDep := 0;
         fValCtb := 0;
         iQuant := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while (not cdsBalPatAux.EOF) and
               (copy(cdsBalPatAux.FieldByName('CLASSE').AsString,1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
         begin
            iQuant := iQuant + cdsBalPatAux.FieldByName('QUANT').AsInteger;
            fValOrg := ConvNum(fValOrg + cdsBalPatAux.FieldByName('VALORG').AsCurrency) ;
            fCmBem := ConvNum(fCmBem + cdsBalPatAux.FieldByName('CMBEM').AsCurrency)  ;
            fDepLanc := ConvNum(fDepLanc + cdsBalPatAux.FieldByName('DEPLANC').AsCurrency);
            fDepMes := ConvNum(fDepMes + cdsBalPatAux.FieldByName('DEPMES').AsCurrency) ;
            fCmDep := ConvNum(fCmDep + cdsBalPatAux.FieldByName('CMDEP').AsCurrency)  ;
            fReavValOrg := ConvNum(fReavValOrg  + cdsBalPatAux.FieldByName('REAVVALORG').AsCurrency) ;
            fReavCmBem := ConvNum(fReavCmBem + cdsBalPatAux.FieldByName('REAVCMBEM').AsCurrency)  ;
            fReavDepLanc := ConvNum(fReavDepLanc + cdsBalPatAux.FieldByName('REAVDEPLANC').AsCurrency);
            fReavDepMes := ConvNum(fReavDepMes  + cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency) ;
            fReavCmDep := ConvNum(fReavCmDep + cdsBalPatAux.FieldByName('REAVCMDEP').AsCurrency)  ;
            fValCtb := ConvNum(fValCtb + cdsBalPatAux.FieldByName('VALCTB').AsCurrency) ;
            cdsBalPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('IDGRUPO',cdsGrpSinteticos.FieldByName('IDGRUPO').AsInteger,[]);
         cdsBalPatAux.Edit;
         cdsBalPatAux.FieldByName('QUANT').AsInteger := iQuant;
         cdsBalPatAux.FieldByName('VALORG').AsCurrency := fValOrg;
         cdsBalPatAux.FieldByName('CMBEM').AsCurrency := fCmBem;
         cdsBalPatAux.FieldByName('DEPLANC').AsCurrency := fDepLanc;
         cdsBalPatAux.FieldByName('DEPMES').AsCurrency := fDepMes;
         cdsBalPatAux.FieldByName('CMDEP').AsCurrency := fCmDep;
         cdsBalPatAux.FieldByName('REAVVALORG').AsCurrency := fReavValOrg;
         cdsBalPatAux.FieldByName('REAVCMBEM').AsCurrency := fReavCmBem;
         cdsBalPatAux.FieldByName('REAVDEPLANC').AsCurrency := fReavDepLanc;
         cdsBalPatAux.FieldByName('REAVDEPMES').AsCurrency := fReavDepMes;
         cdsBalPatAux.FieldByName('REAVCMDEP').AsCurrency := fReavCmDep;
         cdsBalPatAux.FieldByName('VALCTB').AsCurrency := fValCtb;
         cdsBalPatAux.Post;
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsBalPatAux.First;
      while not cdsBalPatAux.EOF do
      begin
         if (CmpRptCM.ParamValues[5].AsBoolean) or (cdsBalPatAux.FieldByName('QUANT').AsInteger <> 0) then
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
      if cdsBalPatGrpA.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      rpBalPatGrpDBTEXT1.DisplayFormat := sMascaraGrupo;
      rpBalPatGrpLabel10.Text :=  CmpRptCM.ParamValues[0].AsString;
   except
      on E : Exception do
      begin
         CMDebugToFile('BALANCETE PATRIMONIAL POR GRUPO - ANALÍTICO!' + #13 + E.Message);
      end;
   end;
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
