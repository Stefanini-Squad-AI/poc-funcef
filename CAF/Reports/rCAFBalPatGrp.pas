unit rCAFBalPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti;

type
  TRptCAFBalPatGrp = class(TFrmCmReport)
    rpBalPatGrp: TppReport;
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
    LBLSISTEMA: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppBalPatGrp: TppBDEPipeline;
    dsBalPatGrp: TwwDataSource;
    cdsBalPatGrp: TCMClientDataSet;
    sqlBalPatGrp: TCMSqlParams;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    cdsBalPatAux: TCMClientDataSet;
    cdsDepPerTransf: TCMClientDataSet;
    sqlDepPerTransf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    sqlBalPatAux: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpBalPatGrpDBText1Print(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
  private
    { Private declarations }
    sTipoGrupo, sClasseGrupo : String;
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraGrupo : String;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  RptCAFBalPatGrp: TRptCAFBalPatGrp;

implementation

{$R *.DFM}

procedure TRptCAFBalPatGrp.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Captura as Mascaras
   //-------------------------------------------------------------------------------------
   with sqlParamCaf do
   begin
      Prepare;
      ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString) +';0; ';
   end;
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

function TRptCAFBalPatGrp.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TRptCAFBalPatGrp.CrmRptCMBeforePrint(Sender: TObject);
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
      cdsBalPatGrp.Close;
      sqlBalPatGrp.Open;
      //----------------------------------------------------------------------------------
      // Calcula os Grupos Analiticos
      //----------------------------------------------------------------------------------
      cdsGrpAnaliticos.Close;
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlGrpAnaliticos.SQL.Strings[28] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlGrpAnaliticos.SQL.Strings[67] := ' AND (LTRIM(RTRIM(G2.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlGrpAnaliticos.SQL.Strings[28] := ' AND SB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
            sqlGrpAnaliticos.SQL.Strings[67] := ' AND SB2.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         end;
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[28] := ' ';
         sqlGrpAnaliticos.SQL.Strings[67] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[29] := ' AND G1.FLGIMOVEL = 0 ';
         sqlGrpAnaliticos.SQL.Strings[68] := ' AND G2.FLGIMOVEL = 0 ';
         rpBalPatGrpLabel12.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[29] := ' AND G1.FLGIMOVEL = 1 ';
         sqlGrpAnaliticos.SQL.Strings[68] := ' AND G2.FLGIMOVEL = 1 ';
         rpBalPatGrpLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[29] := ' ';
         sqlGrpAnaliticos.SQL.Strings[68] := ' ';
         rpBalPatGrpLabel12.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' ';
         sqlGrpAnaliticos.SQL.Strings[69] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[30] := ' AND B1.CONTROLE = ''T'' ';
         sqlGrpAnaliticos.SQL.Strings[69] := ' AND B2.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[31] := ' ';
         sqlGrpAnaliticos.SQL.Strings[70] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[31] := ' AND B1.BAIXATOTAL <> ''S'' ';
         sqlGrpAnaliticos.SQL.Strings[70] := ' AND B2.BAIXATOTAL <> ''S'' ';
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
               cdsBalPatAux.FieldByName('VALORG').AsFloat  := cdsGrpAnaliticos.FieldByName('VALORG0').AsFloat;
               cdsBalPatAux.FieldByName('CMBEM').AsFloat   := cdsGrpAnaliticos.FieldByName('CMBEM0').AsFloat;
               cdsBalPatAux.FieldByName('DEPLANC').AsFloat := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsFloat;
               cdsBalPatAux.FieldByName('DEPMES').AsFloat  := cdsGrpAnaliticos.FieldByName('DEPLANCATU0').AsFloat;
               cdsBalPatAux.FieldByName('CMDEP').AsFloat   := cdsGrpAnaliticos.FieldByName('CMDEP0').AsFloat;
               cdsBalPatAux.FieldByName('VALCTB').AsFloat  := cdsGrpAnaliticos.FieldByName('VALCTB0').AsFloat;
               cdsBalPatAux.FieldByName('QUANT').AsInteger := cdsGrpAnaliticos.FieldByName('QUANT').AsInteger;
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
      cdsGrpSinteticos.Close;
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND G.FLGIMOVEL = 0 ';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' AND G.FLGIMOVEL = 1 ';
      end else
      begin
         sqlGrpSinteticos.SQL.Strings[4] := ' ';
      end;
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpSinteticos.EOF do
      begin
         iTam     := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
         nValOrg  := 0;
         nCmBem   := 0;
         nDepLanc := 0;
         nDepMes  := 0;
         nCmDep   := 0;
         nValCtb  := 0;
         iQuant   := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while not cdsBalPatAux.EOF and
               (copy(trim(cdsBalPatAux.FieldByName('CLASSE').AsString),1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
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
         if cdsBalPatAux.Locate('CLASSE',cdsGrpSinteticos.FieldByName('CLASSE').AsString,[]) then
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
            Raise Exception.Create('Erro no processamento dos grupos sintéticos');   
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
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
               cdsBalPatGrp.Append;
               cdsBalPatGrp.FieldByName('IDGRUPO').AsInteger  := cdsBalPatAux.FieldByName('IDGRUPO').AsInteger;
               cdsBalPatGrp.FieldByName('CLASSE').AsString    := cdsBalPatAux.FieldByName('CLASSE').AsString;
               cdsBalPatGrp.FieldByName('DESCGRUPO').AsString := cdsBalPatAux.FieldByName('DESCGRUPO').AsString;
               cdsBalPatGrp.FieldByName('S_A').AsString       := cdsBalPatAux.FieldByName('S_A').AsString;
               cdsBalPatGrp.FieldByName('VALORG').AsFloat     := cdsBalPatAux.FieldByName('VALORG').AsFloat;
               cdsBalPatGrp.FieldByName('CMBEM').AsFloat      := cdsBalPatAux.FieldByName('CMBEM').AsFloat;
               cdsBalPatGrp.FieldByName('DEPLANC').AsFloat    := cdsBalPatAux.FieldByName('DEPLANC').AsFloat;
               cdsBalPatGrp.FieldByName('DEPMES').AsFloat     := cdsBalPatAux.FieldByName('DEPMES').AsFloat;
               cdsBalPatGrp.FieldByName('CMDEP').AsFloat      := cdsBalPatAux.FieldByName('CMDEP').AsFloat;
               cdsBalPatGrp.FieldByName('VALCTB').AsFloat     := cdsBalPatAux.FieldByName('VALCTB').AsFloat;
               cdsBalPatGrp.FieldByName('QUANT').AsInteger    := cdsBalPatAux.FieldByName('QUANT').AsInteger;
               cdsBalPatGrp.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Next;
      end;
      cdsBalPatAux.Close;
      //----------------------------------------------------------------------------------
      if cdsBalPatGrp.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      rpBalPatGrpDBTEXT1.DisplayFormat := sMascaraGrupo;
      rpBalPatGrpLabel10.Text          := datetostr(CmpRptCM.ParamValues[0].AsDateTime);
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         Screen.Cursor := crDefault;
         CMDebugToFile('BALANCETE PATRIMONIAL POR GRUPO CONTÁBIL : ' + E.Message );
      end;
   end;
end;

procedure TRptCAFBalPatGrp.rpBalPatGrpDBText1Print(Sender: TObject);
begin
   inherited;
   if cdsBalPatGrp.FieldByName('S_A').AsString = 'S' then
   begin
      rpBalPatGrpDBText1.Font.Style := [fsBold];
      rpBalPatGrpDBText2.Font.Style := [fsBold];
      rpBalPatGrpDBText3.Font.Style := [fsBold];
      rpBalPatGrpDBText4.Font.Style := [fsBold];
      rpBalPatGrpDBText5.Font.Style := [fsBold];
      rpBalPatGrpDBText6.Font.Style := [fsBold];
      rpBalPatGrpDBText7.Font.Style := [fsBold];
      rpBalPatGrpDBText8.Font.Style := [fsBold];
   end else
   begin
      rpBalPatGrpDBText1.Font.Style := [];
      rpBalPatGrpDBText2.Font.Style := [];
      rpBalPatGrpDBText3.Font.Style := [];
      rpBalPatGrpDBText4.Font.Style := [];
      rpBalPatGrpDBText5.Font.Style := [];
      rpBalPatGrpDBText6.Font.Style := [];
      rpBalPatGrpDBText7.Font.Style := [];
      rpBalPatGrpDBText8.Font.Style := [];
   end;
end;

function TRptCAFBalPatGrp.DataUltFechamento : String;
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

procedure TRptCAFBalPatGrp.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
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
