//==================================================================================================================================
//Nº SIG......: 86440
//Data........: 22/05/2019
//Autor.......: André Imakawa
//Descrição...: Erro ao montar o campo IDCLASSEBEM
//Rotina......: CrmRptCMBeforePrint
//==================================================================================================================================

unit rCAFBalPatClas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti;

type
  TRptCAFBalPatClas = class(TFrmCmReport)
    sqlAnaliticos: TCMSqlParams;
    cdsAnaliticos: TCMClientDataSet;
    sqlSinteticos: TCMSqlParams;
    cdsSinteticos: TCMClientDataSet;
    cdsBalPatAux: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    sqlBalPatAux: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    dsBalPatClas: TwwDataSource;
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
    rpBalPatClas: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
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
    ppLabel86: TppLabel;
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
    sqlBalPatClas: TCMSqlParams;
    cdsBalPatClas: TCMClientDataSet;
    ppLabel1: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpBalPatClasDBText1Print(Sender: TObject);
    procedure ppDetailBand2AfterPrint(Sender: TObject);
  private
    { Private declarations }
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraClasse : String;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  RptCAFBalPatClas: TRptCAFBalPatClas;

implementation

{$R *.DFM}

procedure TRptCAFBalPatClas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
      sMascaraClasse := trim(cdsParamCaf.FieldByName('MASCARACLASSE').AsString) + ';0; ';
   end;
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
end;

function TRptCAFBalPatClas.DataUltFechamento : String;
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

function TRptCAFBalPatClas.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TRptCAFBalPatClas.CrmRptCMBeforePrint(Sender: TObject);
var
   nValOrg, nCmBem,
   nDepLanc, nCmDep,
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
      sqlBalPatAux.Open;
      cdsBalPatClas.Close;
      sqlBalPatClas.Open;
      //----------------------------------------------------------------------------------
      // Calcula os Analiticos
      //----------------------------------------------------------------------------------
      cdsAnaliticos.Close;
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlAnaliticos.SQL.Strings[28] := ' AND CB1.IDCLASSEBEM = ' + inttostr(CmpRptCM.ParamValues[1].AsInteger) ;      // Andre Imakawa - SIG 86440
         sqlAnaliticos.SQL.Strings[69] := ' AND CB2.IDCLASSEBEM = ' + inttostr(CmpRptCM.ParamValues[1].AsInteger) ;      // Andre Imakawa - SIG 86440
      end else
      begin
         sqlAnaliticos.SQL.Strings[28] := ' ';
         sqlAnaliticos.SQL.Strings[69] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlAnaliticos.SQL.Strings[29] := ' AND G1.FLGIMOVEL = 0 ';
         sqlAnaliticos.SQL.Strings[70] := ' AND G2.FLGIMOVEL = 0 ';
         ppLabel1.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlAnaliticos.SQL.Strings[29] := ' AND G1.FLGIMOVEL = 1 ';
         sqlAnaliticos.SQL.Strings[70] := ' AND G2.FLGIMOVEL = 1 ';
         ppLabel1.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlAnaliticos.SQL.Strings[29] := ' ';
         sqlAnaliticos.SQL.Strings[70] := ' ';
         ppLabel1.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlAnaliticos.SQL.Strings[30] := ' ';
         sqlAnaliticos.SQL.Strings[71] := ' ';
      end else
      begin
         sqlAnaliticos.SQL.Strings[30] := ' AND B1.CONTROLE = ''T'' ';
         sqlAnaliticos.SQL.Strings[71] := ' AND B2.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         sqlAnaliticos.SQL.Strings[31] := ' ';
         sqlAnaliticos.SQL.Strings[72] := ' ';
      end else
      begin
         sqlAnaliticos.SQL.Strings[31] := ' AND B1.BAIXATOTAL <> ''S'' ';
         sqlAnaliticos.SQL.Strings[72] := ' AND B2.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlAnaliticos.Prepare;
      sqlAnaliticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlAnaliticos.ParamByName('DATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
      sqlAnaliticos.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlAnaliticos.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsAnaliticos.EOF do
      begin
         if cdsBalPatAux.Locate('IDCLASSEBEM', cdsAnaliticos.FieldByName('IDCLASSEBEM').AsInteger, []) then
         begin
            while (not cdsAnaliticos.EOF) and (cdsAnaliticos.FieldByName('IDCLASSEBEM').AsInteger = cdsBalPatAux.FieldByName('IDCLASSEBEM').AsInteger) do
            begin
               cdsBalPatAux.Edit;
               cdsBalPatAux.FieldByName('VALORG').AsFloat  := cdsAnaliticos.FieldByName('VALORG0').AsFloat;
               cdsBalPatAux.FieldByName('CMBEM').AsFloat   := cdsAnaliticos.FieldByName('CMBEM0').AsFloat;
               cdsBalPatAux.FieldByName('DEPLANC').AsFloat := cdsAnaliticos.FieldByName('DEPLANC0').AsFloat;
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
      sqlSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsSinteticos.EOF do
      begin
         iTam     := length(trim(cdsSinteticos.FieldByName('CODHIERARQ').AsString));
         nValOrg  := 0;
         nCmBem   := 0;
         nDepLanc := 0;
         nCmDep   := 0;
         nValCtb  := 0;
         iQuant   := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CODHIERARQ',trim(cdsSinteticos.FieldByName('CODHIERARQ').AsString),[loPartialKey]);
         while not cdsBalPatAux.EOF and
               (copy(trim(cdsBalPatAux.FieldByName('CODHIERARQ').AsString),1,iTam) = trim(cdsSinteticos.FieldByName('CODHIERARQ').AsString)) do
         begin
            nValOrg  := ConvNum(nValOrg  + cdsBalPatAux.FieldByName('VALORG').AsFloat) ;
            nCmBem   := ConvNum(nCmBem   + cdsBalPatAux.FieldByName('CMBEM').AsFloat)  ;
            nDepLanc := ConvNum(nDepLanc + cdsBalPatAux.FieldByName('DEPLANC').AsFloat);
            nCmDep   := ConvNum(nCmDep   + cdsBalPatAux.FieldByName('CMDEP').AsFloat)  ;
            nValCtb  := ConvNum(nValCtb  + cdsBalPatAux.FieldByName('VALCTB').AsFloat) ;
            iQuant   := iQuant + cdsBalPatAux.FieldByName('QUANT').AsInteger;
            cdsBalPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         if cdsBalPatAux.Locate('IDCLASSEBEM',cdsSinteticos.FieldByName('IDCLASSEBEM').AsInteger,[]) then
         begin
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('VALORG').AsFloat  := nValOrg;
            cdsBalPatAux.FieldByName('CMBEM').AsFloat   := nCmBem;
            cdsBalPatAux.FieldByName('DEPLANC').AsFloat := nDepLanc;
            cdsBalPatAux.FieldByName('CMDEP').AsFloat   := nCmDep;
            cdsBalPatAux.FieldByName('VALCTB').AsFloat  := nValCtb;
            cdsBalPatAux.FieldByName('QUANT').AsInteger := iQuant;
            cdsBalPatAux.Post;
         end else
            Raise Exception.Create('Erro no processamento das classes sintéticas');
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
               cdsBalPatClas.Append;
               cdsBalPatClas.FieldByName('CODHIERARQ').AsString := cdsBalPatAux.FieldByName('CODHIERARQ').AsString;
               cdsBalPatClas.FieldByName('DESCRICAO').AsString := cdsBalPatAux.FieldByName('DESCRICAO').AsString;
               cdsBalPatClas.FieldByName('S_A').AsString := cdsBalPatAux.FieldByName('S_A').AsString;
               cdsBalPatClas.FieldByName('VALORG').AsFloat := cdsBalPatAux.FieldByName('VALORG').AsFloat;
               cdsBalPatClas.FieldByName('CMBEM').AsFloat := cdsBalPatAux.FieldByName('CMBEM').AsFloat;
               cdsBalPatClas.FieldByName('DEPLANC').AsFloat := cdsBalPatAux.FieldByName('DEPLANC').AsFloat;
               cdsBalPatClas.FieldByName('CMDEP').AsFloat := cdsBalPatAux.FieldByName('CMDEP').AsFloat;
               cdsBalPatClas.FieldByName('VALCTB').AsFloat := cdsBalPatAux.FieldByName('VALCTB').AsFloat;
               cdsBalPatClas.FieldByName('QUANT').AsInteger := cdsBalPatAux.FieldByName('QUANT').AsInteger;
               cdsBalPatClas.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Next;
      end;
      cdsBalPatAux.Close;
      //----------------------------------------------------------------------------------
      if cdsBalPatClas.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os Parâmetros Fornecidos!');
      //----------------------------------------------------------------------------------
      rpBalPatClasDBText1.DisplayFormat := sMascaraClasse;
      rpBalPatClasLabelData.Text := datetostr(CmpRptCM.ParamValues[0].AsDateTime);
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         Screen.Cursor := crDefault;
         CMDebugToFile('BALANCETE PATRIMONIAL POR CLASSE : ' + E.Message );
      end;
   end;
end;

procedure TRptCAFBalPatClas.rpBalPatClasDBText1Print(Sender: TObject);
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
   end;
end;

procedure TRptCAFBalPatClas.ppDetailBand2AfterPrint(Sender: TObject);
begin
   inherited;
   if cdsBalPatClas.FieldByName('S_A').AsString = 'A' then
   begin
      ppSoma1.Value := ppSoma1.Value + cdsBalPatClas.FieldByName('QUANT').AsInteger;
      ppSoma2.Value := ConvNum(ppSoma2.Value + cdsBalPatClas.FieldByName('VALORG').AsCurrency);
      ppSoma3.Value := ConvNum(ppSoma3.Value + cdsBalPatClas.FieldByName('CMBEM').AsCurrency);
      ppSoma4.Value := ConvNum(ppSoma4.Value + cdsBalPatClas.FieldByName('DEPLANC').AsCurrency);
      ppSoma5.Value := ConvNum(ppSoma5.Value + cdsBalPatClas.FieldByName('CMDEP').AsCurrency);
      ppSoma6.Value := ConvNum(ppSoma6.Value + cdsBalPatClas.FieldByName('VALCTB').AsCurrency);
   end;
end;

end.
