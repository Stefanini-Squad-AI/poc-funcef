unit rCAFBalPatGrpBx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db, DBClient,
  uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, IvDictio, IvMulti,
  uCMfileUtils, uCtrlPadroes;

type
  TrptCAFBalPatGrpBx = class(TFrmCmReport)
    rpBalPatGrpBx: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel37: TppLabel;
    ppLine6: TppLine;
    LBLEMPRESA: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel77: TppLabel;
    ppLine8: TppLine;
    ppDetailBand3: TppDetailBand;
    rpBalPatGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    rpBalPatGrpDBText6: TppDBText;
    rpBalPatGrpDBText7: TppDBText;
    rpBalPatGrpDBText8: TppDBText;
    rpBalPatGrpDBText3: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    LBLSISTEMA: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    dsBalPatGrpBx: TwwDataSource;
    ppBalPatGrpBx: TppBDEPipeline;
    cdsBalPatGrpBx: TCMClientDataSet;
    sqlBalPatGrpBx: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    cdsBalPatAux: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    sqlBalPatAux: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpBalPatGrpDBText1Print(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
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
  rptCAFBalPatGrpBx: TrptCAFBalPatGrpBx;

implementation

{$R *.DFM}

procedure TrptCAFBalPatGrpBx.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TrptCAFBalPatGrpBx.CrmRptCMBeforePrint(Sender: TObject);
var
   fValOrg, fCmBem,
   fDepLanc, fCmDep, fValCtb   : Extended;
   iQuant, iTam                : Integer;
   iAno, iMes, iDia            : Word;
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      //----------------------------------------------------------------------------------
      rpBalPatGrpDBText1.DisplayFormat := sMascaraGrupo;
      ppLabel74.Text := 'Movimentação de ' + datetostr(EncodeDate(iAno, iMes, 01)) + ' a ' + datetostr(CmpRptCM.ParamValues[0].AsDateTime);
      //----------------------------------------------------------------------------------
      // Calcula os Grupos Analiticos
      //----------------------------------------------------------------------------------
      cdsBalPatAux.Close;
      sqlBalPatAux.Prepare;
      sqlBalPatAux.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlBalPatAux.Open;
      cdsBalPatGrpBx.Close;
      sqlBalPatGrpBx.Prepare;
      sqlBalPatGrpBx.Open;
      //----------------------------------------------------------------------------------
      cdsGrpAnaliticos.Close;
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlGrpAnaliticos.SQL.Strings[56] := ' AND (LTRIM(RTRIM(G.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlGrpAnaliticos.SQL.Strings[56] := ' AND SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         end;
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[56] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlGrpAnaliticos.SQL.Strings[57] := ' AND G.FLGIMOVEL = 0 ';
         ppLabel77.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlGrpAnaliticos.SQL.Strings[57] := ' AND G.FLGIMOVEL = 1 ';
         ppLabel77.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[57] := ' ';
         ppLabel77.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlGrpAnaliticos.SQL.Strings[58] := ' ';
      end else
      begin
         sqlGrpAnaliticos.SQL.Strings[58] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlGrpAnaliticos.Prepare;
      sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlGrpAnaliticos.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno, iMes,01);
      sqlGrpAnaliticos.ParamByName('DATASLD').AsDateTime  := CmpRptCM.ParamValues[0].AsDateTime;
      sqlGrpAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlGrpAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpAnaliticos.EOF do
      begin
         if (cdsBalPatAux.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[])) then
         begin
            while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPatAux.FieldByName('IDGRUPO').AsInteger) do
            begin
               cdsBalPatAux.Edit;
               cdsBalPatAux.FieldByName('QUANT').AsInteger    := cdsGrpAnaliticos.FieldByName('QUANT').AsInteger;
               cdsBalPatAux.FieldByName('VALORG').AsCurrency  := cdsGrpAnaliticos.FieldByName('VALORG0').AsFloat;
               cdsBalPatAux.FieldByName('CMBEM').AsCurrency   := cdsGrpAnaliticos.FieldByName('CMBEM0').AsFloat;
               cdsBalPatAux.FieldByName('DEPLANC').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsFloat;
               cdsBalPatAux.FieldByName('CMDEP').AsCurrency   := cdsGrpAnaliticos.FieldByName('CMDEP0').AsFloat;
               cdsBalPatAux.FieldByName('VALCTB').AsCurrency  := cdsGrpAnaliticos.FieldByName('VALCTB0').AsFloat;
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
      end;
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsGrpSinteticos.EOF do
      begin
         iTam     := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
         iQuant   := 0;
         fValOrg  := 0;
         fCmBem   := 0;
         fDepLanc := 0;
         fCmDep   := 0;
         fValCtb  := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while (not cdsBalPatAux.EOF) and
               (copy(cdsBalPatAux.FieldByName('CLASSE').AsString,1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
         begin
            iQuant   := iQuant + cdsBalPatAux.FieldByName('QUANT').AsInteger;
            fValOrg  := ConvNum(fValOrg + cdsBalPatAux.FieldByName('VALORG').AsFloat);
            fCmBem   := ConvNum(fCmBem + cdsBalPatAux.FieldByName('CMBEM').AsFloat);
            fDepLanc := ConvNum(fDepLanc + cdsBalPatAux.FieldByName('DEPLANC').AsFloat);
            fCmDep   := ConvNum(fCmDep + cdsBalPatAux.FieldByName('CMDEP').AsFloat);
            fValCtb  := ConvNum(fValCtb + cdsBalPatAux.FieldByName('VALCTB').AsFloat);
            //----------------------------------------------------------------------------
            cdsBalPatAux.Next;
         end;
         //-------------------------------------------------------------------------------
         if cdsBalPatAux.Locate('IDGRUPO',cdsGrpSinteticos.FieldByName('IDGRUPO').AsInteger,[]) then
         begin
            cdsBalPatAux.Edit;
            cdsBalPatAux.FieldByName('QUANT').AsInteger    := iQuant;
            cdsBalPatAux.FieldByName('VALORG').AsCurrency  := fValOrg;
            cdsBalPatAux.FieldByName('CMBEM').AsCurrency   := fCmBem;
            cdsBalPatAux.FieldByName('DEPLANC').AsCurrency := fDepLanc;
            cdsBalPatAux.FieldByName('CMDEP').AsCurrency   := fCmDep;
            cdsBalPatAux.FieldByName('VALCTB').AsCurrency  := fValCtb;
            cdsBalPatAux.Post;
         end;
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
         if CmpRptCM.ParamValues[4].AsBoolean or (cdsBalPatAux.FieldByName('QUANT').AsInteger <> 0) then
         begin
            if (not CmpRptCM.ParamValues[4].AsBoolean) or
               ((CmpRptCM.ParamValues[4].AsBoolean) and (cdsBalPatAux.FieldByName('S_A').AsString = 'S')) then
            begin
               cdsBalPatGrpBx.Append;
               cdsBalPatGrpBx.FieldByName('IDGRUPO').AsInteger  := cdsBalPatAux.FieldByName('IDGRUPO').AsInteger;
               cdsBalPatGrpBx.FieldByName('CLASSE').AsString    := cdsBalPatAux.FieldByName('CLASSE').AsString;
               cdsBalPatGrpBx.FieldByName('DESCGRUPO').AsString := cdsBalPatAux.FieldByName('DESCGRUPO').AsString;
               cdsBalPatGrpBx.FieldByName('S_A').AsString       := cdsBalPatAux.FieldByName('S_A').AsString;
               cdsBalPatGrpBx.FieldByName('VALORG').AsCurrency  := cdsBalPatAux.FieldByName('VALORG').AsFloat;
               cdsBalPatGrpBx.FieldByName('CMBEM').AsCurrency   := cdsBalPatAux.FieldByName('CMBEM').AsFloat;
               cdsBalPatGrpBx.FieldByName('DEPLANC').AsCurrency := cdsBalPatAux.FieldByName('DEPLANC').AsFloat;
               cdsBalPatGrpBx.FieldByName('CMDEP').AsCurrency   := cdsBalPatAux.FieldByName('CMDEP').AsFloat;
               cdsBalPatGrpBx.FieldByName('VALCTB').AsCurrency  := cdsBalPatAux.FieldByName('VALCTB').AsFloat;
               cdsBalPatGrpBx.FieldByName('QUANT').AsInteger    := cdsBalPatAux.FieldByName('QUANT').AsInteger;
               cdsBalPatGrpBx.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatAux.Next;
      end;
      cdsBalPatAux.Close;
      //----------------------------------------------------------------------------------
      if cdsBalPatGrpBx.IsEmpty then
         Raise Exception.Create('Não houve movimentação com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   except
      on E : Exception Do
      begin
         CMDebugToFile('BALANCETE PATRIMONIAL POR GRUPO - BENS BAIXADOS : ' + #13 + E.Message);
         Screen.Cursor := crDefault;
         Application.ProcessMessages;
      end;
   end;
end;

procedure TrptCAFBalPatGrpBx.rpBalPatGrpDBText1Print(Sender: TObject);
begin
  inherited;
   if cdsBalPatGrpBx.FieldByName('S_A').AsString = 'S' then
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

function TRptCAFBalPatGrpBx.DataUltFechamento : String;
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

function TRptCAFBalPatGrpBx.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TrptCAFBalPatGrpBx.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
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
