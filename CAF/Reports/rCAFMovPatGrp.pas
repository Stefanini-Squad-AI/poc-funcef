unit rCAFMovPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, DBClient,
  uCMClientDataSet, uCmSqlParams, uCMfileUtils, uCtrlPadroes, IvDictio,
  IvMulti;

type
  TrptCAFMovPatGrp = class(TFrmCmReport)
    dsMovPatGrp: TwwDataSource;
    ppMovPatGrp: TppBDEPipeline;
    rpMovPatGrp: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLabel69: TppLabel;
    ppLine19: TppLine;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    pplbldata1: TppLabel;
    rbLabel80: TppLabel;
    rpMovPatGrpLine1: TppLine;
    rbLabel82: TppLabel;
    rpMovPatGrpLabel1: TppLabel;
    ppDetailBand10: TppDetailBand;
    rpDBText1: TppDBText;
    rpDBText2: TppDBText;
    rpDBText4: TppDBText;
    rpDBText5: TppDBText;
    rpDBText6: TppDBText;
    rpDBText7: TppDBText;
    rpDBText3: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    sqlMovPatGrp: TCMSqlParams;
    cdsMovPatGrp: TCMClientDataSet;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    cdsMovPatAux: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    sqlMovPatAux: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsGrupoAnalit: TCMClientDataSet;
    sqlGrupoAnalit: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpDBText1Print(Sender: TObject);
  private
    { Private declarations }
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraGrupo : String;
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  rptCAFMovPatGrp: TrptCAFMovPatGrp;

implementation

{$R *.DFM}

procedure TrptCAFMovPatGrp.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iDia, iMes, iAno : Word;
   dDataUltFec      : TDateTime;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   //--- Captura as Mascaras
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
   dDataUltFec := StrToDate(DataUltFechamento);
   DecodeDate(dDataUltFec, iAno, iMes, iDia);
   CmpRptCM.ParamValues[0].TextDefault := DateToStr(EncodeDate(iAno, iMes, 01));
   CmpRptCM.ParamValues[1].TextDefault := DateToStr(dDataUltFec);
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO ' +
                                                      ' FROM GRUPO G, ' +
                                                      ' PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TRptCAFMovPatGrp.DataUltFechamento : String;
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

function TRptCAFMovPatGrp.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TrptCAFMovPatGrp.CrmRptCMBeforePrint(Sender: TObject);
var
   fSldAtu, fSldAnt, fDebitos, fCreditos : Extended;
   iTam                                  : Integer;
begin
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      sqlMovPatAux.Prepare;
      sqlMovPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlMovPatAux.Open;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[387] := ' AND G.IDGRUPO >= '+IntToStr(CmpRptCM.ParamValues[2].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[387] := ' ';
      end;
      if CmpRptCM.ParamValues[3].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[388] := ' AND G.IDGRUPO <= '+IntToStr(CmpRptCM.ParamValues[3].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[388] := ' ';
      end;
      //----------------------------------------------------------------------------------
      // Calcula os Grupos Analiticos
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat      := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATAMOVINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlGrpAnaliticos.ParamByName('DATAMOVFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsInteger   := iMoedaOficial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsInteger   := 1;                // Brasil
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if cdsMovPatAux.Locate('CLASSE',cdsGrpAnaliticos.FieldByName('CLASSE').AsString,[]) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('CLASSE').AsString = cdsMovPatAux.FieldByName('CLASSE').AsString) do
            begin
               fSldAtu := ConvNum(cdsGrpAnaliticos.FieldByName('SLDANT').AsFloat +
                                  cdsGrpAnaliticos.FieldByName('DEBITOS').AsFloat -
                                  cdsGrpAnaliticos.FieldByName('CREDITOS').AsFloat);
               cdsMovPatAux.Edit;
               cdsMovPatAux.FieldByName('SLDANT').AsCurrency   := ConvNum(cdsMovPatAux.FieldByName('SLDANT').AsFloat   + cdsGrpAnaliticos.FieldByName('SLDANT').AsFloat);
               cdsMovPatAux.FieldByName('DEBITOS').AsCurrency  := ConvNum(cdsMovPatAux.FieldByName('DEBITOS').AsFloat  + cdsGrpAnaliticos.FieldByName('DEBITOS').AsFloat);
               cdsMovPatAux.FieldByName('CREDITOS').AsCurrency := ConvNum(cdsMovPatAux.FieldByName('CREDITOS').AsFloat + cdsGrpAnaliticos.FieldByName('CREDITOS').AsFloat);
               cdsMovPatAux.FieldByName('SLDATU').AsCurrency   := ConvNum(cdsMovPatAux.FieldByName('SLDATU').AsFloat   + fSldAtu);
               cdsMovPatAux.Post;
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
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      while not cdsGrpSinteticos.EOF do
      begin
         iTam      := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
         fSldAnt   := 0;
         fDebitos  := 0;
         fCreditos := 0;
         fSldAtu   := 0;
         //-------------------------------------------------------------------------------
         cdsMovPatAux.Locate('CLASSE', trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString), [loPartialKey]);
         while not cdsMovPatAux.EOF and
               (copy(cdsMovPatAux.FieldByName('CLASSE').AsString, 1, iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
         begin
            fSldAnt   := ConvNum(fSldAnt   + cdsMovPatAux.FieldByName('SLDANT').AsFloat);
            fDebitos  := ConvNum(fDebitos  + cdsMovPatAux.FieldByName('DEBITOS').AsFloat);
            fCreditos := ConvNum(fCreditos + cdsMovPatAux.FieldByName('CREDITOS').AsFloat);
            fSldAtu   := ConvNum(fSldAtu   + cdsMovPatAux.FieldByName('SLDATU').AsFloat);
            cdsMovPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         cdsMovPatAux.Locate('IDGRUPO',cdsGrpSinteticos.FieldByName('IDGRUPO').AsInteger,[]);
         cdsMovPatAux.Edit;
         cdsMovPatAux.FieldByName('SLDANT').AsCurrency   := fSldAnt;
         cdsMovPatAux.FieldByName('DEBITOS').AsCurrency  := fDebitos;
         cdsMovPatAux.FieldByName('CREDITOS').AsCurrency := fCreditos;
         cdsMovPatAux.FieldByName('SLDATU').AsCurrency   := fSldAtu;
         cdsMovPatAux.Post;
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsMovPatGrp.Close;
      sqlMovPatGrp.Open;
      cdsMovPatAux.First;
      while not cdsMovPatAux.EOF do
      begin
         if not ((cdsMovPatAux.FieldByName('SLDANT').AsFloat = 0) and (cdsMovPatAux.FieldByName('DEBITOS').AsFloat = 0) and
                 (cdsMovPatAux.FieldByName('CREDITOS').AsFloat = 0) and (cdsMovPatAux.FieldByName('SLDATU').AsFloat = 0)) then
         begin
            cdsMovPatGrp.Append;
            cdsMovPatGrp.FieldByName('CLASSE').AsString     := cdsMovPatAux.FieldByName('CLASSE').AsString;
            cdsMovPatGrp.FieldByName('DESCGRUPO').AsString  := cdsMovPatAux.FieldByName('DESCGRUPO').AsString;
            cdsMovPatGrp.FieldByName('S_A').AsString        := cdsMovPatAux.FieldByName('S_A').AsString;
            cdsMovPatGrp.FieldByName('SLDANT').AsCurrency   := cdsMovPatAux.FieldByName('SLDANT').AsFloat;
            cdsMovPatGrp.FieldByName('DEBITOS').AsCurrency  := cdsMovPatAux.FieldByName('DEBITOS').AsFloat;
            cdsMovPatGrp.FieldByName('CREDITOS').AsCurrency := cdsMovPatAux.FieldByName('CREDITOS').AsFloat;
            cdsMovPatGrp.FieldByName('SLDATU').AsCurrency   := cdsMovPatAux.FieldByName('SLDATU').AsFloat;
            cdsMovPatGrp.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsMovPatAux.Next;
      end;
      cdsMovPatAux.Close;
      if cdsMovPatGrp.IsEmpty then
         Raise Exception.Create('Não existe movimentação no Periodo/Grupo selecionados!');
      //----------------------------------------------------------------------------------
      rpDbText1.DisplayFormat := sMascaraGrupo;
      rbLabel80.Text := DateToStr(CmpRptCM.ParamValues[0].AsDateTime);
      rbLabel82.Text := DateToStr(CmpRptCM.ParamValues[1].AsDateTime);
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         Screen.Cursor := crDefault;
         CMDebugToFile('MOVIMENTO PATRIMONIAL POR GRUPO CONTÁBIL : ' + #13 + E.Message);
      end;
   end;
   Application.ProcessMessages;
end;

procedure TrptCAFMovPatGrp.rpDBText1Print(Sender: TObject);
begin
   inherited;
   if cdsMovPatGrp.FieldByName('S_A').AsString = 'S' then
   begin
      rpDBText1.Font.Style := [fsBold];
      rpDBText2.Font.Style := [fsBold];
      rpDBText3.Font.Style := [fsBold];
      rpDBText4.Font.Style := [fsBold];
      rpDBText5.Font.Style := [fsBold];
      rpDBText6.Font.Style := [fsBold];
      rpDBText7.Font.Style := [fsBold];
   end else
   begin
      rpDBText1.Font.Style := [];
      rpDBText2.Font.Style := [];
      rpDBText3.Font.Style := [];
      rpDBText4.Font.Style := [];
      rpDBText5.Font.Style := [];
      rpDBText6.Font.Style := [];
      rpDBText7.Font.Style := [];
   end;
end;

end.
