unit rCAFBalPatCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti;

type
  TRptCAFBalPatCC = class(TFrmCmReport)
    sqlAnaliticos: TCMSqlParams;
    cdsAnaliticos: TCMClientDataSet;
    sqlSinteticos: TCMSqlParams;
    cdsSinteticos: TCMClientDataSet;
    cdsBalPatAux: TCMClientDataSet;
    cdsDepPerTransf: TCMClientDataSet;
    sqlDepPerTransf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    sqlBalPatAux: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    dsBalPatCC: TwwDataSource;
    ppBalPatCC: TppBDEPipeline;
    rpBalPatCC: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel17: TppLabel;
    ppLine9: TppLine;
    ppLabel18: TppLabel;
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
    ppLabel31: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    sqlBalPatCC: TCMSqlParams;
    cdsBalPatCC: TCMClientDataSet;
    rpBalPatCCLabel12: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure ppDBText10Print(Sender: TObject);
  private
    { Private declarations }
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraCC : String;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  RptCAFBalPatCC: TRptCAFBalPatCC;

implementation

{$R *.DFM}

procedure TRptCAFBalPatCC.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   with sqlParamCaf do
   begin
      Prepare;
      ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      sMascaraCC := trim(cdsParamCaf.FieldByName('MASCARACC').AsString) + ';0; ';
   end;
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT IDEMPRESA, CODCENTROCUSTO, NOME '+
                                                      ' FROM CENTCUST ' +
                                                      ' WHERE IDEMPRESA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND STATUSGRUPOCDC = ''A'' ' +
                                                      ' ORDER BY NOME, CODCENTROCUSTO ';
end;

function TRptCAFBalPatCC.DataUltFechamento : String;
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

function TRptCAFBalPatCC.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TRptCAFBalPatCC.CrmRptCMBeforePrint(Sender: TObject);
var
   nValOrg, nCmBem,
   nDepLanc, nDepMes, nCmDep,
   nValCtb                     : Extended;
   iTam, iQuant                : Integer;
   iDia, iMes, iAno            : Word;

begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      //----------------------------------------------------------------------------------
      // Inicializa os datasets intermediário e final
      //----------------------------------------------------------------------------------
      cdsBalPatAux.Close;
      sqlBalPatAux.Prepare;
      sqlBalPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlBalPatAux.Open;
      cdsBalPatCC.Close;
      sqlBalPatCC.Open;
      //----------------------------------------------------------------------------------
      // Calcula os Analiticos
      //----------------------------------------------------------------------------------
      cdsAnaliticos.Close;
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlAnaliticos.SQL.Strings[28] := ' AND LTRIM(RTRIM(CC1.CODCENTROCUSTO)) = ' + #39 + trim(CmpRptCM.ParamValues[1].AsString) + #39;
         sqlAnaliticos.SQL.Strings[73] := ' AND LTRIM(RTRIM(CC2.CODCENTROCUSTO)) = ' + #39 + trim(CmpRptCM.ParamValues[1].AsString) + #39;
      end else
      begin
         sqlAnaliticos.SQL.Strings[28] := ' ';
         sqlAnaliticos.SQL.Strings[73] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlAnaliticos.SQL.Strings[29] := ' AND G1.FLGIMOVEL = 0 ';
         sqlAnaliticos.SQL.Strings[74] := ' AND G2.FLGIMOVEL = 0 ';
         rpBalPatCCLabel12.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlAnaliticos.SQL.Strings[29] := ' AND G1.FLGIMOVEL = 1 ';
         sqlAnaliticos.SQL.Strings[74] := ' AND G2.FLGIMOVEL = 1 ';
         rpBalPatCCLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlAnaliticos.SQL.Strings[29] := ' ';
         sqlAnaliticos.SQL.Strings[74] := ' ';
         rpBalPatCCLabel12.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlAnaliticos.SQL.Strings[30] := ' ';
         sqlAnaliticos.SQL.Strings[75] := ' ';
      end else
      begin
         sqlAnaliticos.SQL.Strings[30] := ' AND B1.CONTROLE = ''T'' ';
         sqlAnaliticos.SQL.Strings[75] := ' AND B2.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlAnaliticos.SQL.Strings[31] := ' ';
         sqlAnaliticos.SQL.Strings[76] := ' ';
      end else
      begin
         sqlAnaliticos.SQL.Strings[31] := ' AND B1.BAIXATOTAL <> ''S'' ';
         sqlAnaliticos.SQL.Strings[76] := ' AND B2.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlAnaliticos.Prepare;
      sqlAnaliticos.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlAnaliticos.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno,iMes,01);
      sqlAnaliticos.ParamByName('DATASLD').AsDateTime  := CmpRptCM.ParamValues[0].AsDateTime;
      sqlAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlAnaliticos.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsAnaliticos.EOF do
      begin
         if cdsBalPatAux.Locate('CODCENTROCUSTO', cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString, []) then
         begin
            while (not cdsAnaliticos.EOF) and (cdsAnaliticos.FieldByName('CODCENTROCUSTO').AsString = cdsBalPatAux.FieldByName('CODCENTROCUSTO').AsString) do
            begin
               cdsBalPatAux.Edit;
               cdsBalPatAux.FieldByName('VALORG').AsFloat  := cdsAnaliticos.FieldByName('VALORG0').AsFloat;
               cdsBalPatAux.FieldByName('CMBEM').AsFloat   := cdsAnaliticos.FieldByName('CMBEM0').AsFloat;
               cdsBalPatAux.FieldByName('DEPLANC').AsFloat := cdsAnaliticos.FieldByName('DEPLANC0').AsFloat;
               cdsBalPatAux.FieldByName('DEPMES').AsFloat  := cdsAnaliticos.FieldByName('DEPLANCATU0').AsFloat;
               cdsBalPatAux.FieldByName('CMDEP').AsFloat   := cdsAnaliticos.FieldByName('CMDEP0').AsFloat;
               cdsBalPatAux.FieldByName('VALCTB').AsFloat  := cdsAnaliticos.FieldByName('VALCTB0').AsFloat;
               cdsBalPatAux.FieldByName('QUANT').AsInteger := cdsAnaliticos.FieldByName('QUANT').AsInteger;
               cdsBalPatAux.Post;
               //-------------------------------------------------------------------------
               cdsAnaliticos.Next;
            end;
         end else
         begin
            cdsAnaliticos.Next;
         end;
      end;
      cdsAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Calcula os Sintéticos
      //----------------------------------------------------------------------------------
      cdsSinteticos.Close;
      sqlSinteticos.Prepare;
      sqlSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsSinteticos.EOF do
      begin
         iTam     := length(trim(cdsSinteticos.FieldByName('CODCENTROCUSTO').AsString));
         nValOrg  := 0;
         nCmBem   := 0;
         nDepLanc := 0;
         nDepMes  := 0;
         nCmDep   := 0;
         nValCtb  := 0;
         iQuant   := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CODCENTROCUSTO',trim(cdsSinteticos.FieldByName('CODCENTROCUSTO').AsString),[loPartialKey]);
         while not cdsBalPatAux.EOF and
               (copy(trim(cdsBalPatAux.FieldByName('CODCENTROCUSTO').AsString),1,iTam) = trim(cdsSinteticos.FieldByName('CODCENTROCUSTO').AsString)) do
         begin
            nValOrg  := ConvNum(nValOrg  + cdsBalPatAux.FieldByName('VALORG').AsFloat) ;
            nCmBem   := ConvNum(nCmBem   + cdsBalPatAux.FieldByName('CMBEM').AsFloat)  ;
            nDepLanc := ConvNum(nDepLanc + cdsBalPatAux.FieldByName('DEPLANC').AsFloat);
            nDepMes  := ConvNum(nDepMes  + cdsBalPatAux.FieldByName('DEPMES').AsFloat) ;
            nCmDep   := ConvNum(nCmDep   + cdsBalPatAux.FieldByName('CMDEP').AsFloat)  ;
            nValCtb  := ConvNum(nValCtb  + cdsBalPatAux.FieldByName('VALCTB').AsFloat) ;
            iQuant   := iQuant + cdsBalPatAux.FieldByName('QUANT').AsInteger;
            cdsBalPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         if cdsBalPatAux.Locate('CODCENTROCUSTO',cdsSinteticos.FieldByName('CODCENTROCUSTO').AsString,[]) then
         begin
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('VALORG').AsFloat  := nValOrg;
            cdsBalPatAux.FieldByName('CMBEM').AsFloat   := nCmBem;
            cdsBalPatAux.FieldByName('DEPLANC').AsFloat := nDepLanc;
            cdsBalPatAux.FieldByName('DEPMES').AsFloat  := nDepMes;
            cdsBalPatAux.FieldByName('CMDEP').AsFloat   := nCmDep;
            cdsBalPatAux.FieldByName('VALCTB').AsFloat  := nValCtb;
            cdsBalPatAux.FieldByName('QUANT').AsInteger := iQuant;
            cdsBalPatAux.Post;
         end else
            Raise Exception.Create('Erro no processamento dos centros de custo sintéticos');
         //-------------------------------------------------------------------------------
         cdsSinteticos.Next;
      end;
      cdsSinteticos.Close;
      //----------------------------------------------------------------------------------
      // Preenche o DataSet do Relatório
      //----------------------------------------------------------------------------------
      cdsBalPatAux.First;
      while not cdsBalPatAux.EOF do
      begin
         if (CmpRptCM.ParamValues[5].AsBoolean) or (cdsBalPatAux.FieldByName('QUANT').AsInteger <> 0) then
         begin
            if (not CmpRptCM.ParamValues[6].AsBoolean) or
               ((CmpRptCM.ParamValues[6].AsBoolean) and (cdsBalPatAux.FieldByName('S_A').AsString = 'S')) then
            begin
               cdsBalPatCC.Append;
               cdsBalPatCC.FieldByName('CODCENTROCUSTO').AsString := cdsBalPatAux.FieldByName('CODCENTROCUSTO').AsString;
               cdsBalPatCC.FieldByName('DESCCCUSTO').AsString     := cdsBalPatAux.FieldByName('DESCCCUSTO').AsString;
               cdsBalPatCC.FieldByName('S_A').AsString            := cdsBalPatAux.FieldByName('S_A').AsString;
               cdsBalPatCC.FieldByName('VALORG').AsFloat          := cdsBalPatAux.FieldByName('VALORG').AsFloat;
               cdsBalPatCC.FieldByName('CMBEM').AsFloat           := cdsBalPatAux.FieldByName('CMBEM').AsFloat;
               cdsBalPatCC.FieldByName('DEPLANC').AsFloat         := cdsBalPatAux.FieldByName('DEPLANC').AsFloat;
               cdsBalPatCC.FieldByName('DEPMES').AsFloat          := cdsBalPatAux.FieldByName('DEPMES').AsFloat;
               cdsBalPatCC.FieldByName('CMDEP').AsFloat           := cdsBalPatAux.FieldByName('CMDEP').AsFloat;
               cdsBalPatCC.FieldByName('VALCTB').AsFloat          := cdsBalPatAux.FieldByName('VALCTB').AsFloat;
               cdsBalPatCC.FieldByName('QUANT').AsInteger         := cdsBalPatAux.FieldByName('QUANT').AsInteger;
               cdsBalPatCC.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Next;
      end;
      cdsBalPatAux.Close;
      //----------------------------------------------------------------------------------
      if cdsBalPatCC.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      ppDBTEXT10.DisplayFormat := sMascaraCC;
      ppLabel30.Text           := datetostr(CmpRptCM.ParamValues[0].AsDateTime);
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         Screen.Cursor := crDefault;
         CMDebugToFile('BALANCETE PATRIMONIAL POR CENTRO DE CUSTO : ' + E.Message );
      end;
   end;
end;

procedure TRptCAFBalPatCC.ppDBText10Print(Sender: TObject);
begin
   inherited;
   if cdsBalPatCC.FieldByName('S_A').AsString = 'S' then
   begin
      ppDBText10.Font.Style := [fsBold];
      ppDBText11.Font.Style := [fsBold];
      ppDBText12.Font.Style := [fsBold];
      ppDBText13.Font.Style := [fsBold];
      ppDBText14.Font.Style := [fsBold];
      ppDBText15.Font.Style := [fsBold];
      ppDBText16.Font.Style := [fsBold];
      ppDBText17.Font.Style := [fsBold];
   end else
   begin
      ppDBText10.Font.Style := [];
      ppDBText11.Font.Style := [];
      ppDBText12.Font.Style := [];
      ppDBText13.Font.Style := [];
      ppDBText14.Font.Style := [];
      ppDBText15.Font.Style := [];
      ppDBText16.Font.Style := [];
      ppDBText17.Font.Style := [];
   end;
end;

end.
