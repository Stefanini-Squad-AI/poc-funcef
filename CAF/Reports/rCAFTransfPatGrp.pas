unit rCAFTransfPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB,
  Wwdatsrc, uCmRptManager, TXComp, CmParamReport, DBClient, 
  uCMClientDataSet, uCmSqlParams, uCMfileUtils, uCtrlPadroes, IvDictio,
  IvMulti;

type
  TRptCAFTransfPatGrp = class(TFrmCmReport)
    dsTransfPatGrp: TwwDataSource;
    ppTransfPatGrp: TppBDEPipeline;
    rpTransfPatGrp: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLine37: TppLine;
    LBLEMPRESA: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLine38: TppLine;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel82: TppLabel;
    ppLabel87: TppLabel;
    ppDetailBand12: TppDetailBand;
    rpDBText1: TppDBText;
    rpDBText4: TppDBText;
    rpDBText5: TppDBText;
    rpDBText6: TppDBText;
    rpDBText3: TppDBText;
    rpDBText2: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine39: TppLine;
    LBLSISTEMA: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    cdsTransfPatGrp: TCMClientDataSet;
    sqlTransfPatGrp: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    cdsTransfPatAux: TCMClientDataSet;
    sqlTransfPatAux: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
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
  RptCAFTransfPatGrp: TRptCAFTransfPatGrp;

implementation

{$R *.dfm}

procedure TRptCAFTransfPatGrp.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   dDataUltFec : TDateTime;
   iAnoFim, iMesFim, iDiaFim : Word;
begin
   inherited;
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
   sqlParamCaf.Open;
   bInvestImob   := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
   iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
   sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString) +';0; ';
   //-------------------------------------------------------------------------------------
   dDataUltFec := strtodate(DataUltFechamento);
   DecodeDate(dDataUltFec, iAnoFim, iMesFim, iDiaFim);
   CmpRptCM.ParamValues[1].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,01));
   CmpRptCM.ParamValues[2].TextDefault := DateToStr(dDataUltFec);
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TRptCAFTransfPatGrp.DataUltFechamento : String;
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

function TRptCAFTransfPatGrp.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TRptCAFTransfPatGrp.CrmRptCMBeforePrint(Sender: TObject);
var
   fEntradas, fSaidas, fSaldo  : Extended;
   iTam : Integer;

begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      cdsTransfPatGrp.Close;
      sqlTransfPatGrp.Open;
      //----------------------------------------------------------------------------------
      sqlTransfPatAux.Prepare;
      sqlTransfPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlTransfPatAux.Open;
      //----------------------------------------------------------------------------------
      // Calcula os Grupos Analiticos
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger <> 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' AND B.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[3].AsInteger);
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[26] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[0].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[27] := ' AND G.FLGIMOVEL = 0 ';
      end else
      if CmpRptCM.ParamValues[0].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[27] := ' AND G.FLGIMOVEL = 1 ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[27] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATAINI').AsDateTime  := CmpRptCM.ParamValues[1].AsDateTime;
      sqlGrpAnaliticos.ParamByName('DATAFIM').AsDateTime  := CmpRptCM.ParamValues[2].AsDateTime;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Processa o grupo atual
         //-------------------------------------------------------------------------------
         if cdsTransfPatAux.Locate('CLASSE',cdsGrpAnaliticos.FieldByName('CODGRUPO').AsString,[]) then
         begin
            cdsTransfPatAux.Edit;
            cdsTransfPatAux.FieldByName('ENTRADAS').AsCurrency := ConvNum(cdsTransfPatAux.FieldByName('ENTRADAS').AsFloat + cdsGrpAnaliticos.FieldByName('VALORG').AsFloat);
            cdsTransfPatAux.FieldByName('SALDO').AsCurrency    := ConvNum(cdsTransfPatAux.FieldByName('SALDO').AsFloat    + cdsGrpAnaliticos.FieldByName('VALORG').AsFloat);
            cdsTransfPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         // Processa o grupo anterior
         //-------------------------------------------------------------------------------
         if cdsTransfPatAux.Locate('CLASSE',cdsGrpAnaliticos.FieldByName('CODGRUPOANT').AsString,[]) then
         begin
            cdsTransfPatAux.Edit;
            cdsTransfPatAux.FieldByName('SAIDAS').AsCurrency := ConvNum(cdsTransfPatAux.FieldByName('SAIDAS').AsFloat + cdsGrpAnaliticos.FieldByName('VALORG').AsFloat);
            cdsTransfPatAux.FieldByName('SALDO').AsCurrency  := ConvNum(cdsTransfPatAux.FieldByName('SALDO').AsFloat  - cdsGrpAnaliticos.FieldByName('VALORG').AsFloat);
            cdsTransfPatAux.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsGrpAnaliticos.Next;
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
         iTam := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
         fEntradas := 0;
         fSaidas := 0;
         fSaldo := 0;
         //-------------------------------------------------------------------------------
         cdsTransfPatAux.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while not cdsTransfPatAux.EOF and
               (copy(cdsTransfPatAux.FieldByName('CLASSE').AsString,1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
         begin
            fEntradas := ConvNum(fEntradas + cdsTransfPatAux.FieldByName('ENTRADAS').AsFloat);
            fSaidas := ConvNum(fSaidas + cdsTransfPatAux.FieldByName('SAIDAS').AsFloat);
            fSaldo := ConvNum(fSaldo + cdsTransfPatAux.FieldByName('SALDO').AsFloat);
            cdsTransfPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         cdsTransfPatAux.Locate('IDGRUPO',cdsGrpSinteticos.FieldByname('IDGRUPO').AsInteger,[]);
         cdsTransfPatAux.Edit;
         cdsTransfPatAux.FieldByName('ENTRADAS').AsCurrency := fEntradas;
         cdsTransfPatAux.FieldByName('SAIDAS').AsCurrency   := fSaidas;
         cdsTransfPatAux.FieldByName('SALDO').AsCurrency    := fSaldo;
         cdsTransfPatAux.Post;
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsTransfPatAux.First;
      while not cdsTransfPatAux.EOF do
      begin
         if not ((cdsTransfPatAux.FieldByName('ENTRADAS').AsFloat = 0) and
                 (cdsTransfPatAux.FieldByName('SAIDAS').AsFloat = 0) and
                 (cdsTransfPatAux.FieldByName('SALDO').AsFloat = 0)) then
         begin
            cdsTransfPatGrp.Append;
            cdsTransfPatGrp.FieldByName('CLASSE').AsString     := cdsTransfPatAux.FieldByName('CLASSE').AsString;
            cdsTransfPatGrp.FieldByName('DESCGRUPO').AsString  := cdsTransfPatAux.FieldByName('DESCGRUPO').AsString;
            cdsTransfPatGrp.FieldByName('S_A').AsString        := cdsTransfPatAux.FieldByName('S_A').AsString;
            cdsTransfPatGrp.FieldByName('ENTRADAS').AsCurrency := cdsTransfPatAux.FieldByName('ENTRADAS').AsFloat;
            cdsTransfPatGrp.FieldByName('SAIDAS').AsCurrency   := cdsTransfPatAux.FieldByName('SAIDAS').AsFloat;
            cdsTransfPatGrp.FieldByName('SALDO').AsCurrency    := cdsTransfPatAux.FieldByName('SALDO').AsFloat;
            cdsTransfPatGrp.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsTransfPatAux.Next;
      end;
      cdsTransfPatAux.Close;
      //----------------------------------------------------------------------------------
      if cdsTransfPatGrp.IsEmpty then
         Raise Exception.Create('Não existem transferências no Periodo/Grupo selecionados!');
      //----------------------------------------------------------------------------------
      ppLabel92.Text := DateToStr(CmpRptCM.ParamValues[1].AsDateTime);
      ppLabel93.Text := DateToStr(CmpRptCM.ParamValues[2].AsDateTime);
      rpDBText1.DisplayFormat := sMascaraGrupo;
      rpDBText4.DisplayFormat := '#,0.00;(#,0.00)';
      rpDBText5.DisplayFormat := '#,0.00;(#,0.00)';
      rpDBText6.DisplayFormat := '#,0.00;(#,0.00)';
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   except
      on E : Exception Do
      begin
         CMDebugToFile('TRANSFERENCIAS PATRIMONIAIS POR GRUPO - SINTÉTICO : ' + #13 + E.Message);
         Screen.Cursor := crDefault;
         Application.ProcessMessages;
      end;
   end;
end;

procedure TRptCAFTransfPatGrp.rpDBText1Print(Sender: TObject);
begin
   inherited;
   if cdsTransfPatGrp.FieldByName('S_A').AsString = 'S' then
   begin
      rpDBText1.Font.Style := [fsBold];
      rpDBText2.Font.Style := [fsBold];
      rpDBText3.Font.Style := [fsBold];
      rpDBText4.Font.Style := [fsBold];
      rpDBText5.Font.Style := [fsBold];
      rpDBText6.Font.Style := [fsBold];
   end else
   begin
      rpDBText1.Font.Style := [];
      rpDBText2.Font.Style := [];
      rpDBText3.Font.Style := [];
      rpDBText4.Font.Style := [];
      rpDBText5.Font.Style := [];
      rpDBText6.Font.Style := [];
   end;
end;

end.
