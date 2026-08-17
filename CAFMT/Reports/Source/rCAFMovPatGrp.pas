unit rCAFMovPatGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery;

type
  TrptCAFMovPatGrp = class(TFrmCmReport)
    updMovPatGrp: TUpdateSQL;
    qryMovPatGrp: TwwQuery;
    qryMovPatGrpCLASSE: TStringField;
    qryMovPatGrpDESCGRUPO: TStringField;
    qryMovPatGrpS_A: TStringField;
    qryMovPatGrpSLDANT: TFloatField;
    qryMovPatGrpDEBITOS: TFloatField;
    qryMovPatGrpCREDITOS: TFloatField;
    qryMovPatGrpSLDATU: TFloatField;
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
    rbdbeClasse: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppFooterBand10: TppFooterBand;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    qryGrpAnaliticos: TwwQuery;
    qryGrpSinteticos: TwwQuery;
    qryGrpSinteticosCLASSE: TStringField;
    qryGrpSinteticosNOME: TStringField;
    qryParamCaf: TwwQuery;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    qryMovPatGrp1: TwwQuery;
    updMovPatGrp1: TUpdateSQL;
    qryMovPatGrp1CLASSE: TStringField;
    qryMovPatGrp1DESCGRUPO: TStringField;
    qryMovPatGrp1S_A: TStringField;
    qryMovPatGrp1SLDANT: TFloatField;
    qryMovPatGrp1DEBITOS: TFloatField;
    qryMovPatGrp1CREDITOS: TFloatField;
    qryMovPatGrp1SLDATU: TFloatField;
    qryGrpAnaliticosCLASSE: TStringField;
    qryGrpAnaliticosDESCGRUPO: TStringField;
    qryGrpAnaliticosTIPO: TStringField;
    qryGrpAnaliticosSLDANT: TFloatField;
    qryGrpAnaliticosDEBITOS: TFloatField;
    qryGrpAnaliticosCREDITOS: TFloatField;
    qryGrpAnaliticosPLACA: TFloatField;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptCAFMovPatGrp: TrptCAFMovPatGrp;

implementation

{$R *.DFM}

procedure TrptCAFMovPatGrp.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qryMovPatGrp.Active then
      qryMovPatGrp.Close;
   qryMovPatGrp.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qryParamCAF.Active then
      qryParamCAF.Close;
   qryParamCAF.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qryGrpAnaliticos.Active then
      qryGrpAnaliticos.Close;
   qryGrpAnaliticos.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qryGrpSinteticos.Active then
      qryGrpSinteticos.Close;
   qryGrpSinteticos.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qryMovPatGrp1.Active then
      qryMovPatGrp1.Close;
   qryMovPatGrp1.DataBaseName := sDataBaseName;
end;

procedure TrptCAFMovPatGrp.CrmRptCMBeforePrint(Sender: TObject);
var
   fSldAtu, fSldAnt, fDebitos, fCreditos : Extended;
   iTam, iAux                            : Integer;
   sMascaraGrupo                         : String;

begin
   inherited;
   qryMovPatGrp1.Close;
   //-------------------------------------------------------------------------------------
   // Inicializa os parâmetros
   //-------------------------------------------------------------------------------------
   qryParamCaf.ParamByName('PIDPESSOA').AsFloat := crmRptCM.IdEmpresa;
   qryParamCaf.Open;
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   qryParamCAF.Close;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   qryGrpAnaliticos.Close;
   qryGrpAnaliticos.ParamByName('PDATAMOVINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
   qryGrpAnaliticos.ParamByName('PDATAMOVFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
   //-------------------------------------------------------------------------------------
   if (CmpRptCM.ParamValues[2].IsNull) and (CmpRptCM.ParamValues[3].IsNull) then
      qryGrpAnaliticos.SQL.Strings[479] := ' '
   else
   if (not CmpRptCM.ParamValues[2].IsNull) and (CmpRptCM.ParamValues[3].IsNull) then
      qryGrpAnaliticos.SQL.Strings[479] := ' AND (G.IDGRUPO = ' + CmpRptCM.ParamValues[2].AsString + ')'
   else
   if (CmpRptCM.ParamValues[2].IsNull) and (not CmpRptCM.ParamValues[3].IsNull) then
      qryGrpAnaliticos.SQL.Strings[479] := ' AND (G.IDGRUPO = ' + CmpRptCM.ParamValues[3].AsString + ')'
   else
      qryGrpAnaliticos.SQL.Strings[479] := ' AND (G.IDGRUPO >= ' + CmpRptCM.ParamValues[2].AsString + ') ' +
                                           ' AND (G.IDGRUPO <= ' + CmpRptCM.ParamValues[3].AsString + ')';
   //-------------------------------------------------------------------------------------
   qryGrpAnaliticos.Open;
   qryMovPatGrp1.Open;
   while not qryGrpAnaliticos.EOF do
   begin
      if (qryMovPatGrp1.Locate('CLASSE',qryGrpAnaliticosCLASSE.AsString,[])) then
      begin
         while (not qryGrpAnaliticos.EOF) and (qryGrpAnaliticosCLASSE.AsString = qryMovPatGrp1.FieldByName('CLASSE').AsString) do
         begin
            fSldAtu := qryGrpAnaliticosSLDANT.AsFloat + qryGrpAnaliticosDEBITOS.AsFloat - qryGrpAnaliticosCREDITOS.AsFloat;
            qryMovPatGrp1.Edit;
            qryMovPatGrp1.FieldByName('SLDANT').AsCurrency   := qryMovPatGrp1.FieldByName('SLDANT').AsFloat   + qryGrpAnaliticosSLDANT.AsFloat;
            qryMovPatGrp1.FieldByName('DEBITOS').AsCurrency  := qryMovPatGrp1.FieldByName('DEBITOS').AsFloat  + qryGrpAnaliticosDEBITOS.AsFloat;
            qryMovPatGrp1.FieldByName('CREDITOS').AsCurrency := qryMovPatGrp1.FieldByName('CREDITOS').AsFloat + qryGrpAnaliticosCREDITOS.AsFloat;
            qryMovPatGrp1.FieldByName('SLDATU').AsCurrency   := qryMovPatGrp1.FieldByName('SLDATU').AsFloat   + fSldAtu;
            //----------------------------------------------------------------------------
            qryGrpAnaliticos.Next;
         end;
      end else
      begin
         qryGrpAnaliticos.Next;
      end;
   end;
   qryGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Sintéticos
   //-------------------------------------------------------------------------------------
   qryGrpSinteticos.Open;
   while not qryGrpSinteticos.EOF do
   begin
      iTam      := length(qryGrpSinteticosCLASSE.AsString);
      fSldAnt   := 0;
      fDebitos  := 0;
      fCreditos := 0;
      fSldAtu   := 0;
      //----------------------------------------------------------------------------------
      qryMovPatGrp1.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[loPartialKey]);
      while (not qryMovPatGrp1.EOF) and
            (copy(qryMovPatGrp1.FieldByName('CLASSE').AsString,1,iTam) = qryGrpSinteticosCLASSE.AsString) do
      begin
         fSldAnt   := fSldAnt   + qryMovPatGrp1.FieldByName('SLDANT').AsFloat  ;
         fDebitos  := fDebitos  + qryMovPatGrp1.FieldByName('DEBITOS').AsFloat ;
         fCreditos := fCreditos + qryMovPatGrp1.FieldByName('CREDITOS').AsFloat ;
         fSldAtu   := fSldAtu   + qryMovPatGrp1.FieldByName('SLDATU').AsFloat   ;
         qryMovPatGrp1.Next;
      end;
      //----------------------------------------------------------------------------------
      qryMovPatGrp1.Locate('CLASSE',qryGrpSinteticosCLASSE.AsString,[]);
      qryMovPatGrp1.Edit;
      qryMovPatGrp1.FieldByName('SLDANT').AsCurrency   := fSldAnt;
      qryMovPatGrp1.FieldByName('DEBITOS').AsCurrency  := fDebitos;
      qryMovPatGrp1.FieldByName('CREDITOS').AsCurrency := fCreditos;
      qryMovPatGrp1.FieldByName('SLDATU').AsCurrency   := fSldAtu;
      qryGrpSinteticos.Next;
   end;
   qryGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   qryMovPatGrp.Close;
   qryMovPatGrp.Open;
   qryMovPatGrp1.First;
   while not qryMovPatGrp1.EOF do
   begin
      if not ((qryMovPatGrp1SLDANT.AsFloat = 0) and (qryMovPatGrp1DEBITOS.AsFloat = 0) and
              (qryMovPatGrp1CREDITOS.AsFloat = 0) and (qryMovPatGrp1SLDATU.AsFloat = 0)) then
      begin
         qryMovPatGrp.Insert;
         qryMovPatGrp.FieldByName('CLASSE').AsString     := qryMovPatGrp1CLASSE.AsString;
         qryMovPatGrp.FieldByName('DESCGRUPO').AsString  := qryMovPatGrp1DESCGRUPO.AsString;
         qryMovPatGrp.FieldByName('S_A').AsString        := qryMovPatGrp1S_A.AsString;
         qryMovPatGrp.FieldByName('SLDANT').AsCurrency   := qryMovPatGrp1SLDANT.AsFloat;
         qryMovPatGrp.FieldByName('DEBITOS').AsCurrency  := qryMovPatGrp1DEBITOS.AsFloat;
         qryMovPatGrp.FieldByName('CREDITOS').AsCurrency := qryMovPatGrp1CREDITOS.AsFloat;
         qryMovPatGrp.FieldByName('SLDATU').AsCurrency   := qryMovPatGrp1SLDATU.AsFloat;
      end;
      //----------------------------------------------------------------------------------
      qryMovPatGrp1.Next;
   end;
   qryMovPatGrp1.CancelUpdates;
   qryMovPatGrp1.Close;
   //-------------------------------------------------------------------------------------
   rbdbeClasse.DisplayFormat := sMascaraGrupo;
   rbLabel80.Text := CmpRptCM.ParamValues[0].AsString;
   rbLabel82.Text := CmpRptCM.ParamValues[1].AsString;
end;

end.
