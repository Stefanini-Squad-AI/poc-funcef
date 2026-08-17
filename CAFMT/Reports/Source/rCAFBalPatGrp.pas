unit rCAFBalPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, ADODB, DBClient,
  Provider,uSistema;

type
  TRptCAFBalPatGrp = class(TFrmCmReport)
    qryBalPatGrp: TwwQuery;
    dsBalPatGrp: TwwDataSource;
    ppBalPatGrp: TppBDEPipeline;
    rpBalPatGrp: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    ppLine17: TppLine;
    ppLabel67: TppLabel;
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
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    ppLabel68: TppLabel;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    qryParamCaf: TwwQuery;
    qryBalPatGrp1: TwwQuery;
    qryGrpAnaliticos: TwwQuery;
    qryGrpSinteticos: TwwQuery;
    dspBalPatGrp: TDataSetProvider;
    adoqryBalPatGrp: TADOQuery;
    adoqryParamCAF: TADOQuery;
    adoqryGrpAnaliticos: TADOQuery;
    adoqryGrpSinteticos: TADOQuery;
    adoqryBalPatGrp1: TADOQuery;
    cdsBalPatGrp: TClientDataSet;
    cdsBalPatGrp1: TClientDataSet;
    dspBalPatGrp1: TDataSetProvider;
    dspGrpAnaliticos: TDataSetProvider;
    cdsGrpAnaliticos: TClientDataSet;
    dspParamCAF: TDataSetProvider;
    cdsParamCAF: TClientDataSet;
    dspGrpSinteticos: TDataSetProvider;
    cdsGrpSinteticos: TClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
    procedure CrmRptCMChangeConnection(Sender: TObject; Connection: TADOConnection);
    procedure CrmRptCMChangeConnectionType(Sender: TObject; ConnectionType: TDbConnectionType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFBalPatGrp: TRptCAFBalPatGrp;

implementation

{$R *.DFM}

procedure TRptCAFBalPatGrp.CrmRptCMBeforePrint(Sender: TObject);
var
   fValOrg, fCmBem, fDepLanc,
   fDepMes, fCmDep, fValCtb    : Extended;
   iTam, iAux                  : Integer;
   sMascaraGrupo               : String;
   iAno, iMes, iDia            : Word;

begin
   inherited;
   cdsParamCAF.FetchParams;
   cdsGrpAnaliticos.FetchParams;
   cdsBalPatGrp1.FetchParams;
   cdsBalPatGrp.FetchParams;
   //-------------------------------------------------------------------------------------
   // Inicializa os parâmetros
   //-------------------------------------------------------------------------------------
   cdsParamCAF.Close;
   cdsParamCAF.Params[0].AsFloat := crmRptCM.IdEmpresa;
   cdsParamCAF.Open;
   sMascaraGrupo := cdsParamCAF.FieldByName('MASCCODGRUPO').AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   cdsParamCAF.Close;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   cdsGrpAnaliticos.Close;
   if not CmpRptCM.ParamValues[1].IsNull then
   begin
      qryGrpAnaliticos.SQL.Strings[90] := 'AND (B.IDGRUPO = '+CmpRptCM.ParamValues[1].AsString+')';
      ADOqryGrpAnaliticos.SQL.Strings[90] := 'AND (B.IDGRUPO = '+CmpRptCM.ParamValues[1].AsString+')';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[90] := ' ';
      ADOqryGrpAnaliticos.SQL.Strings[90] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if CmpRptCM.ParamValues[2].AsInteger = 0 then
   begin
      qryGrpAnaliticos.SQL.Strings[91] := ' AND (G.FLGIMOVEL = 0) ';
      ADOqryGrpAnaliticos.SQL.Strings[91] := ' AND (G.FLGIMOVEL = 0) ';
      rpBalPatGrpLabel12.Caption := 'IMOBILIZADO';
   end else
   if (CmpRptCM.ParamValues[2].AsInteger = 1) then
   begin
      qryGrpAnaliticos.SQL.Strings[91] := ' AND (G.FLGIMOVEL = 1) ';
      ADOqryGrpAnaliticos.SQL.Strings[91] := ' AND (G.FLGIMOVEL = 1) ';
      rpBalPatGrpLabel12.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[91] := ' ';
      ADOqryGrpAnaliticos.SQL.Strings[91] := ' ';
      rpBalPatGrpLabel12.Caption := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (CmpRptCM.ParamValues[3].AsBoolean) then
   begin
      qryGrpAnaliticos.SQL.Strings[92] := ' ';
      ADOqryGrpAnaliticos.SQL.Strings[92] := ' ';
   end else
   begin
      qryGrpAnaliticos.SQL.Strings[92] := ' AND (B.CONTROLE = ''T'') ';
      ADOqryGrpAnaliticos.SQL.Strings[92] := ' AND (B.CONTROLE = ''T'') ';
   end;
   //-------------------------------------------------------------------------------------
   DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
   cdsGrpAnaliticos.Params[0].AsDateTime := CmpRptCM.ParamValues[0].AsDateTime; // PDATASLD
   cdsGrpAnaliticos.Params[1].AsDateTime := EncodeDate(iAno,iMes,01);           // PDATAINI
   cdsGrpAnaliticos.Params[2].AsDateTime := CmpRptCM.ParamValues[0].AsDateTime; // PDATASLD
   cdsGrpAnaliticos.Params[3].AsDateTime := EncodeDate(iAno,iMes,01);           // PDATAINI
   cdsGrpAnaliticos.Params[4].AsDateTime := CmpRptCM.ParamValues[0].AsDateTime; // PDATASLD
   cdsGrpAnaliticos.Params[5].AsDateTime := EncodeDate(iAno,iMes,01);           // PDATAINI
   cdsGrpAnaliticos.Params[6].AsDateTime := CmpRptCM.ParamValues[0].AsDateTime; // PDATASLD
   cdsGrpAnaliticos.Params[7].AsDateTime := CmpRptCM.ParamValues[0].AsDateTime; // PDATASLD
   cdsGrpAnaliticos.Open;
   //-------------------------------------------------------------------------------------
   cdsBalPatGrp1.Open;
   while not cdsGrpAnaliticos.EOF do
   begin
      if (cdsBalPatGrp1.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[])) then
      begin
         while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPatGrp1.FieldByName('IDGRUPO').AsInteger) do
         begin
            cdsBalPatGrp1.Edit;
            cdsBalPatGrp1.FieldByName('VALORG').AsCurrency  := cdsBalPatGrp1.FieldByName('VALORG').AsFloat  + cdsGrpAnaliticos.FieldByName('VALORG0').AsFloat;
            cdsBalPatGrp1.FieldByName('CMBEM').AsCurrency   := cdsBalPatGrp1.FieldByName('CMBEM').AsFloat   + cdsGrpAnaliticos.FieldByName('CMBEM0').AsFloat;
            cdsBalPatGrp1.FieldByName('DEPLANC').AsCurrency := cdsBalPatGrp1.FieldByName('DEPLANC').AsFloat + cdsGrpAnaliticos.FieldByName('DEPLANC0').AsFloat;
            cdsBalPatGrp1.FieldByName('DEPMES').AsCurrency  := cdsBalPatGrp1.FieldByName('DEPMES').AsFloat  + cdsGrpAnaliticos.FieldByName('DEPLANCATU0').AsFloat;
            cdsBalPatGrp1.FieldByName('CMDEP').AsCurrency   := cdsBalPatGrp1.FieldByName('CMDEP').AsFloat   + cdsGrpAnaliticos.FieldByName('CMDEP0').AsFloat;
            cdsBalPatGrp1.FieldByName('VALCTB').AsCurrency  := cdsBalPatGrp1.FieldByName('VALCTB').AsFloat  + cdsGrpAnaliticos.FieldByName('VALCTB0').AsFloat;
            //----------------------------------------------------------------------------
            cdsGrpAnaliticos.Next;
         end;
      end else
      begin
         cdsGrpAnaliticos.Next;
      end;
   end;
   cdsGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Sintéticos
   //-------------------------------------------------------------------------------------
   cdsGrpSinteticos.Open;
   while not cdsGrpSinteticos.EOF do
   begin
      iTam     := length(cdsGrpSinteticos.FieldbyName('CLASSE').AsString);
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fDepMes  := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      //----------------------------------------------------------------------------------
      cdsBalPatGrp1.Locate('CLASSE',trim(cdsGrpSinteticos.FieldbyName('CLASSE').AsString),[loPartialKey]);
      while (not cdsBalPatGrp1.EOF) and
            (copy(cdsBalPatGrp1.FieldByName('CLASSE').AsString,1,iTam) = cdsGrpSinteticos.FieldbyName('CLASSE').AsString) do
      begin
         fValOrg  := fValOrg  + cdsBalPatGrp1.FieldByName('VALORG').AsFloat  ;
         fCmBem   := fCmBem   + cdsBalPatGrp1.FieldByName('CMBEM').AsFloat   ;
         fDepLanc := fDepLanc + cdsBalPatGrp1.FieldByName('DEPLANC').AsFloat ;
         fDepMes  := fDepMes  + cdsBalPatGrp1.FieldByName('DEPMES').AsFloat  ;
         fCmDep   := fCmDep   + cdsBalPatGrp1.FieldByName('CMDEP').AsFloat   ;
         fValCtb  := fValCtb  + cdsBalPatGrp1.FieldByName('VALCTB').AsFloat  ;
         cdsBalPatGrp1.Next;
      end;
      //----------------------------------------------------------------------------------
      cdsBalPatGrp1.Locate('CLASSE',cdsGrpSinteticos.FieldbyName('CLASSE').AsString,[]);
      cdsBalPatGrp1.Edit;
      cdsBalPatGrp1.FieldByName('VALORG').AsCurrency  := fValOrg;
      cdsBalPatGrp1.FieldByName('CMBEM').AsCurrency   := fCmBem;
      cdsBalPatGrp1.FieldByName('DEPLANC').AsCurrency := fDepLanc;
      cdsBalPatGrp1.FieldByName('DEPMES').AsCurrency  := fDepMes;
      cdsBalPatGrp1.FieldByName('CMDEP').AsCurrency   := fCmDep;
      cdsBalPatGrp1.FieldByName('VALCTB').AsCurrency  := fValCtb;
      //----------------------------------------------------------------------------------
      cdsGrpSinteticos.Next;
   end;
   cdsGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   cdsBalPatGrp.Close;
   cdsBalPatGrp.Open;
   cdsBalPatGrp1.First;
   while not cdsBalPatGrp1.EOF do
   begin
      if (CmpRptCM.ParamValues[4].AsBoolean) or
         (((cdsBalPatGrp1.FieldByName('VALORG').AsFloat + cdsBalPatGrp1.FieldByName('CMBEM').AsFloat) -
           (cdsBalPatGrp1.FieldByName('DEPLANC').AsFloat + cdsBalPatGrp1.FieldByName('CMDEP').AsFloat) <> 0)) then
      begin
         cdsBalPatGrp.Append;
         cdsBalPatGrp.FieldByName('IDGRUPO').AsInteger    := cdsBalPatGrp1.FieldByName('IDGRUPO').AsInteger;
         cdsBalPatGrp.FieldByName('CLASSE').AsString      := cdsBalPatGrp1.FieldByName('CLASSE').AsString;
         cdsBalPatGrp.FieldByName('DESCGRUPO').AsString   := cdsBalPatGrp1.FieldByName('DESCGRUPO').AsString;
         cdsBalPatGrp.FieldByName('S_A').AsString         := cdsBalPatGrp1.FieldByName('S_A').AsString;
         cdsBalPatGrp.FieldByName('VALORG').AsCurrency    := cdsBalPatGrp1.FieldByName('VALORG').AsFloat;
         cdsBalPatGrp.FieldByName('CMBEM').AsCurrency     := cdsBalPatGrp1.FieldByName('CMBEM').AsFloat;
         cdsBalPatGrp.FieldByName('DEPLANC').AsCurrency   := cdsBalPatGrp1.FieldByName('DEPLANC').AsFloat;
         cdsBalPatGrp.FieldByName('DEPMES').AsCurrency    := cdsBalPatGrp1.FieldByName('DEPMES').AsFloat;
         cdsBalPatGrp.FieldByName('CMDEP').AsCurrency     := cdsBalPatGrp1.FieldByName('CMDEP').AsFloat;
         cdsBalPatGrp.FieldByName('VALCTB').AsCurrency    := cdsBalPatGrp1.FieldByName('VALCTB').AsFloat;
      end;
      //----------------------------------------------------------------------------------
      cdsBalPatGrp1.Next;
   end;
   cdsBalPatGrp1.CancelUpdates;
   cdsBalPatGrp1.Close;
   //-------------------------------------------------------------------------------------
   rpBalPatGrpDBTEXT1.DisplayFormat := sMascaraGrupo;
   rpBalPatGrpLabel10.Text := CmpRptCM.ParamValues[0].AsString;
end;

procedure TRptCAFBalPatGrp.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryParamCAF.Active      then qryParamCAF.Close;
   if qryGrpAnaliticos.Active then qryGrpAnaliticos.Close;
   if qryGrpSinteticos.Active then qryGrpSinteticos.Close;
   if qryBalPatGrp1.Active    then qryBalPatGrp1.Close;
   if qryBalPatGrp.Active     then qryBalPatGrp.Close;
   qryParamCAF.DataBaseName      := sDataBaseName;
   qryGrpAnaliticos.DataBaseName := sDataBaseName;
   qryGrpSinteticos.DataBaseName := sDataBaseName;
   qryBalPatGrp1.DataBaseName    := sDataBaseName;
   qryBalPatGrp.DataBaseName     := sDataBaseName;
end;

procedure TRptCAFBalPatGrp.CrmRptCMChangeConnection(Sender: TObject; Connection: TADOConnection);
begin
   inherited;
   if ADOqryParamCAF.Active   then ADOqryParamCAF.Close;
   if ADOqryGrpAnaliticos.Active then ADOqryGrpAnaliticos.Close;
   if ADOqryGrpSinteticos.Active then ADOqryGrpSinteticos.Close;
   if ADOqryBalPatGrp1.Active then ADOqryBalPatGrp1.Close;
   if ADOqryBalPatGrp.Active  then ADOqryBalPatGrp.Close;
   ADOqryParamCAF.Connection   := Connection;
   ADOqryGrpAnaliticos.Connection := Connection;
   ADOqryGrpSinteticos.Connection := Connection;
   ADOqryBalPatGrp1.Connection := Connection;
   ADOqryBalPatGrp.Connection  := Connection;
end;

procedure TRptCAFBalPatGrp.CrmRptCMChangeConnectionType(Sender: TObject; ConnectionType: TDbConnectionType);
begin
   inherited;
   case ConnectionType of
      cntBDE : begin
                  dspParamCAF.DataSet      := qryParamCAF;
                  dspGrpAnaliticos.DataSet := qryGrpAnaliticos;
                  dspGrpSinteticos.DataSet := qryGrpSinteticos;
                  dspBalPatGrp1.DataSet    := qryBalPatGrp1;
                  dspBalPatGrp.DataSet     := qryBalPatGrp;
               end;
      cntADO : begin
                  dspParamCAF.DataSet      := ADOqryParamCAF;
                  dspGrpAnaliticos.DataSet := ADOqryGrpAnaliticos;
                  dspGrpSinteticos.DataSet := ADOqryGrpSinteticos;
                  dspBalPatGrp1.DataSet    := ADOqryBalPatGrp1;
                  dspBalPatGrp.DataSet     := ADOqryBalPatGrp;
               end;
   end;
end;

end.
