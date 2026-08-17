unit rCAFBalPatGrpxClas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, IvDictio, IvMulti,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppProd,
  ppClass, ppReport, ppDB, ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls,
  ppPrnabl, ppComm, ppRelatv, ppCache, DB, Wwdatsrc, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, uCtrlPadroes;

type
  TRptCAFBalPatGrpxClas = class(TFrmCmReport)
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsClasAnaliticos: TCMClientDataSet;
    sqlClasAnaliticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    cdsBalPatClas1: TCMClientDataSet;
    cdsBalPatClas2: TCMClientDataSet;
    cdsBalPatClas3: TCMClientDataSet;
    cdsBalPatClas: TCMClientDataSet;
    sqlBalPatClas1: TCMSqlParams;
    sqlBalPatClas2: TCMSqlParams;
    sqlBalPatClas3: TCMSqlParams;
    sqlBalPatClas: TCMSqlParams;
    dsBalPatGrpxClas: TwwDataSource;
    ppBalPatGrpxClas: TppBDEPipeline;
    rpBalPatGrpxClas: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel76: TppLabel;
    ppLine20: TppLine;
    ppLabel81: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel101: TppLabel;
    ppLabel108: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppDetailBand4: TppDetailBand;
    rpDBText1: TppDBText;
    rpDBText2: TppDBText;
    rpDBText6: TppDBText;
    rpDBText3: TppDBText;
    rpDBText4: TppDBText;
    rpDBText7: TppDBText;
    rpDBText5: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine21: TppLine;
    ppLabel109: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    sqlBalPatGrpxClas: TCMSqlParams;
    cdsBalPatGrpxClas: TCMClientDataSet;
    cdsContaSemCC: TCMClientDataSet;
    sqlContaSemCC: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLine1: TppLine;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpDBText1Print(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    iPlanoVigente, iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    sMascaraPlano, sMascaraClasse,
    sTipoGrupo, sClasseGrupo : String;
    //------------------------------------------------------------------------------------
    function DataUltFechamento : String;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
  end;

var
  RptCAFBalPatGrpxClas: TRptCAFBalPatGrpxClas;

implementation

{$R *.dfm}

procedure TRptCAFBalPatGrpxClas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
      iPlanoVigente  := cdsParamCAF.FieldByName('PLANOVIGENTE').AsInteger;
      iMoedaOficial  := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
      bInvestImob    := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      sMascaraClasse := trim(cdsParamCaf.FieldByName('MASCARACLASSE').AsString) +';0; ';
   end;
   //-------------------------------------------------------------------------------------
   sqlPlano.Prepare;
   sqlPlano.ParamByName('PPLANO').AsInteger := iPlanoVigente;
   sqlPlano.Open;
   sMascaraPlano := trim(cdsPlano.FieldByName('MASCARA').AsString) + ';0; ';
   cdsPlano.Close;
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.INATIVO = 0' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TRptCAFBalPatGrpxClas.CrmRptCMBeforePrint(Sender: TObject);
var
   fValOrg, fCmBem, fDepLanc, fCmDep, fValCtb : Extended;
   iTam, iQuant, iGrupoA                      : Integer;
   sGrupoA, sNomeA                            : String;

begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      sqlBalPatClas.Open;
      sqlBalPatClas1.Open;
      sqlBalPatClas2.Open;
      sqlBalPatClas3.Open;
      //----------------------------------------------------------------------------------
      cdsClasAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Calcula os Grupos Analiticos
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlClasAnaliticos.SQL.Strings[46] := ' AND (LTRIM(RTRIM(G.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlClasAnaliticos.SQL.Strings[46] := ' AND G.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         end;
      end else
      begin
         sqlClasAnaliticos.SQL.Strings[46] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsBoolean then
      begin
         sqlClasAnaliticos.SQL.Strings[47] := ' ';
      end else
      begin
         sqlClasAnaliticos.SQL.Strings[47] := ' AND B.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlClasAnaliticos.SQL.Strings[48] := ' ';
      end else
      begin
         sqlClasAnaliticos.SQL.Strings[48] := ' AND B.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlClasAnaliticos.Prepare;
      sqlClasAnaliticos.ParamByName('IDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;
      sqlClasAnaliticos.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlClasAnaliticos.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlClasAnaliticos.ParamByName('IDTAXADEP').AsInteger := 1;                   // Brasil
      sqlClasAnaliticos.Open;
      //----------------------------------------------------------------------------------
      while not cdsClasAnaliticos.EOF do
      begin
         if not cdsBalPatClas1.Locate('CLASSE;CODHIERARQ',
                                      VarArrayOf([cdsClasAnaliticos.FieldbyName('CLASSE').AsString,
                                                  cdsClasAnaliticos.FieldbyName('CODHIERARQ').AsString]) ,[]) then
         begin
            cdsBalPatClas1.Append;
            cdsBalPatClas1.FieldByName('IDGRUPO').AsInteger   := cdsClasAnaliticos.FieldByName('IDGRUPO').AsInteger;
            cdsBalPatClas1.FieldByName('CLASSE').AsString     := cdsClasAnaliticos.FieldByName('CLASSE').AsString;
            cdsBalPatClas1.FieldByName('NOME').AsString       := cdsClasAnaliticos.FieldByName('NOME').AsString;
            cdsBalPatClas1.FieldByName('TIPO').AsString       := cdsClasAnaliticos.FieldByName('TIPO').AsString;
            cdsBalPatClas1.FieldByName('CODHIERARQ').AsString := cdsClasAnaliticos.FieldByName('CODHIERARQ').AsString;
            cdsBalPatClas1.FieldByName('DESCRICAO').AsString  := cdsClasAnaliticos.FieldByName('DESCRICAO').AsString;
            cdsBalPatClas1.FieldByName('ANASINT').AsString    := cdsClasAnaliticos.FieldByName('ANASINT').AsString;
         end else
         begin
            cdsBalPatClas1.Edit;
         end;
         cdsBalPatClas1.FieldByName('VALORG').AsCurrency   := ConvNum(cdsBalPatClas.FieldByName('VALORG').AsFloat  + cdsClasAnaliticos.FieldByName('VALORG0').AsFloat);
         cdsBalPatClas1.FieldByName('CMBEM').AsCurrency    := ConvNum(cdsBalPatClas.FieldByName('CMBEM').AsFloat   + cdsClasAnaliticos.FieldByName('CMBEM0').AsFloat);
         cdsBalPatClas1.FieldByName('DEPLANC').AsCurrency  := ConvNum(cdsBalPatClas.FieldByName('DEPLANC').AsFloat + cdsClasAnaliticos.FieldByName('DEPLANC0').AsFloat);
         cdsBalPatClas1.FieldByName('CMDEP').AsCurrency    := ConvNum(cdsBalPatClas.FieldByName('CMDEP').AsFloat   + cdsClasAnaliticos.FieldByName('CMDEP0').AsFloat);
         cdsBalPatClas1.FieldByName('VALCTB').AsCurrency   := ConvNum(cdsBalPatClas.FieldByName('VALCTB').AsFloat  + cdsClasAnaliticos.FieldByName('VALCTB0').AsFloat);
         cdsBalPatClas1.FieldByName('QUANT').AsInteger     := cdsBalPatClas.FieldByName('QUANT').AsInteger + cdsClasAnaliticos.FieldByName('QUANT').AsInteger;
         cdsBalPatClas1.Post;
         //-------------------------------------------------------------------------------
         cdsClasAnaliticos.Next;
      end;
      cdsClasAnaliticos.Close;
      //----------------------------------------------------------------------------------
      // Calcula os grupos contábeis analíticos
      //----------------------------------------------------------------------------------
      cdsBalPatClas1.First;
      while not cdsBalPatClas1.EOF do
      begin
         iGrupoA := cdsBalPatClas1.FieldByName('IDGRUPO').AsInteger;
         sGrupoA := cdsBalPatClas1.FieldByName('CLASSE').AsString;
         sNomeA  := cdsBalPatClas1.FieldByName('NOME').AsString;
         fValOrg  := 0;
         fCmBem   := 0;
         fDepLanc := 0;
         fCmDep   := 0;
         fValCtb  := 0;
         iQuant   := 0;
         while (not cdsBalPatClas1.EOF) and (cdsBalPatClas1.FieldByName('CLASSE').AsString = sGrupoA) do
         begin
            fValOrg  := ConvNum(fValOrg  + cdsBalPatClas1.FieldByName('VALORG').AsFloat);
            fCmBem   := ConvNum(fCmBem   + cdsBalPatClas1.FieldByName('CMBEM').AsFloat);
            fDepLanc := ConvNum(fDepLanc + cdsBalPatClas1.FieldByName('DEPLANC').AsFloat);
            fCmDep   := ConvNum(fCmDep   + cdsBalPatClas1.FieldByName('CMDEP').AsFloat);
            fValCtb  := ConvNum(fValCtb  + cdsBalPatClas1.FieldByName('VALCTB').AsFloat);
            iQuant   := iQuant + cdsBalPatClas1.FieldByName('QUANT').AsInteger;
            //----------------------------------------------------------------------------
            cdsBalPatClas1.Next;
         end;
         cdsBalPatClas2.Append;
         cdsBalPatClas2.FieldByName('IDGRUPO').AsInteger   := iGrupoA;
         cdsBalPatClas2.FieldByName('CLASSE').AsString     := sGrupoA;
         cdsBalPatClas2.FieldByName('NOME').AsString       := sNomeA;
         cdsBalPatClas2.FieldByName('TIPO').AsString       := 'A';
         cdsBalPatClas2.FieldByName('CODHIERARQ').Clear;
         cdsBalPatClas2.FieldByName('DESCRICAO').Clear;
         cdsBalPatClas2.FieldByName('ANASINT').Clear;
         cdsBalPatClas2.FieldByName('VALORG').AsCurrency   := fValOrg;
         cdsBalPatClas2.FieldByName('CMBEM').AsCurrency    := fCmBem;
         cdsBalPatClas2.FieldByName('DEPLANC').AsCurrency  := fDepLanc;
         cdsBalPatClas2.FieldByName('CMDEP').AsCurrency    := fCmDep;
         cdsBalPatClas2.FieldByName('VALCTB').AsCurrency   := fValCtb;
         cdsBalPatClas2.FieldByName('QUANT').AsInteger     := iQuant;
         cdsBalPatClas2.Post;
      end;
      //----------------------------------------------------------------------------------
      // Calcula os grupos contábeis sintéticos
      //----------------------------------------------------------------------------------
      sqlGrpSinteticos.Prepare;
      sqlGrpSinteticos.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGrpSinteticos.Open;
      while not cdsGrpSinteticos.EOF do
      begin
         iTam     := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
         fValOrg  := 0;
         fCmBem   := 0;
         fDepLanc := 0;
         fCmDep   := 0;
         fValCtb  := 0;
         iQuant   := 0;
         //-------------------------------------------------------------------------------
         cdsBalPatClas2.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
         while (not cdsBalPatClas2.EOF) and
               (copy(cdsBalPatClas2.FieldByName('CLASSE').AsString,1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
         begin
            fValOrg  := ConvNum(fValOrg  + cdsBalPatClas2.FieldByName('VALORG').AsFloat);
            fCmBem   := ConvNum(fCmBem   + cdsBalPatClas2.FieldByName('CMBEM').AsFloat);
            fDepLanc := ConvNum(fDepLanc + cdsBalPatClas2.FieldByName('DEPLANC').AsFloat);
            fCmDep   := ConvNum(fCmDep   + cdsBalPatClas2.FieldByName('CMDEP').AsFloat);
            fValCtb  := ConvNum(fValCtb  + cdsBalPatClas2.FieldByName('VALCTB').AsFloat);
            iQuant   := iQuant + cdsBalPatClas2.FieldByName('QUANT').AsInteger;
            //----------------------------------------------------------------------------
            cdsBalPatClas2.Next;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatClas3.Append;
         cdsBalPatClas3.FieldByName('IDGRUPO').AsInteger   := cdsGrpSinteticos.FieldByName('IDGRUPO').AsInteger;
         cdsBalPatClas3.FieldByName('CLASSE').AsString     := cdsGrpSinteticos.FieldByName('CLASSE').AsString;
         cdsBalPatClas3.FieldByName('NOME').AsString       := cdsGrpSinteticos.FieldByName('NOME').AsString;
         cdsBalPatClas3.FieldByName('TIPO').AsString       := 'S';
         cdsBalPatClas3.FieldByName('CODHIERARQ').Clear;
         cdsBalPatClas3.FieldByName('DESCRICAO').Clear;
         cdsBalPatClas3.FieldByName('ANASINT').Clear;
         cdsBalPatClas3.FieldByName('VALORG').AsCurrency   := fValOrg;
         cdsBalPatClas3.FieldByName('CMBEM').AsCurrency    := fCmBem;
         cdsBalPatClas3.FieldByName('DEPLANC').AsCurrency  := fDepLanc;
         cdsBalPatClas3.FieldByName('CMDEP').AsCurrency    := fCmDep;
         cdsBalPatClas3.FieldByName('VALCTB').AsCurrency   := fValCtb;
         cdsBalPatClas3.FieldByName('QUANT').AsInteger     := iQuant;
         cdsBalPatClas3.Post;
         //-------------------------------------------------------------------------------
         cdsGrpSinteticos.Next;
      end;
      cdsGrpSinteticos.Close;
      //----------------------------------------------------------------------------------
      // Mesclar e transferir para o relatório
      //----------------------------------------------------------------------------------
      cdsBalPatClas1.First;
      while not cdsBalPatClas1.EOF do
      begin
         cdsBalPatClas.Append;
         cdsBalPatClas.FieldByName('IDGRUPO').AsInteger   := cdsBalPatClas1.FieldByName('IDGRUPO').AsInteger;
         cdsBalPatClas.FieldByName('CLASSE').AsString     := cdsBalPatClas1.FieldByName('CLASSE').AsString;
         cdsBalPatClas.FieldByName('NOME').AsString       := cdsBalPatClas1.FieldByName('NOME').AsString;
         cdsBalPatClas.FieldByName('TIPO').AsString       := cdsBalPatClas1.FieldByName('TIPO').AsString;
         cdsBalPatClas.FieldByName('CODHIERARQ').AsString := cdsBalPatClas1.FieldByName('CODHIERARQ').AsString;
         cdsBalPatClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas1.FieldByName('DESCRICAO').AsString;
         cdsBalPatClas.FieldByName('ANASINT').AsString    := cdsBalPatClas1.FieldByName('ANASINT').AsString;
         cdsBalPatClas.FieldByName('VALORG').AsCurrency   := cdsBalPatClas1.FieldByName('VALORG').AsCurrency;
         cdsBalPatClas.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas1.FieldByName('CMBEM').AsCurrency;
         cdsBalPatClas.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas1.FieldByName('DEPLANC').AsCurrency;
         cdsBalPatClas.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas1.FieldByName('CMDEP').AsCurrency;
         cdsBalPatClas.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas1.FieldByName('VALCTB').AsCurrency;
         cdsBalPatClas.FieldByName('QUANT').AsInteger     := cdsBalPatClas1.FieldByName('QUANT').AsInteger;
         cdsBalPatClas.Post;
         //-------------------------------------------------------------------------------
         cdsBalPatClas1.Next;
      end;
      //----------------------------------------------------------------------------------
      if not CmpRptCM.ParamValues[4].AsBoolean then
      begin
         cdsBalPatClas2.First;
         while not cdsBalPatClas2.EOF do
         begin
            cdsBalPatClas.Append;
            cdsBalPatClas.FieldByName('IDGRUPO').AsInteger   := cdsBalPatClas2.FieldByName('IDGRUPO').AsInteger;
            cdsBalPatClas.FieldByName('CLASSE').AsString     := cdsBalPatClas2.FieldByName('CLASSE').AsString;
            cdsBalPatClas.FieldByName('NOME').AsString       := cdsBalPatClas2.FieldByName('NOME').AsString;
            cdsBalPatClas.FieldByName('TIPO').AsString       := cdsBalPatClas2.FieldByName('TIPO').AsString;
            cdsBalPatClas.FieldByName('CODHIERARQ').AsString := cdsBalPatClas2.FieldByName('CODHIERARQ').AsString;
            cdsBalPatClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas2.FieldByName('DESCRICAO').AsString;
            cdsBalPatClas.FieldByName('ANASINT').AsString    := cdsBalPatClas2.FieldByName('ANASINT').AsString;
            cdsBalPatClas.FieldByName('VALORG').AsCurrency   := cdsBalPatClas2.FieldByName('VALORG').AsCurrency;
            cdsBalPatClas.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas2.FieldByName('CMBEM').AsCurrency;
            cdsBalPatClas.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas2.FieldByName('DEPLANC').AsCurrency;
            cdsBalPatClas.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas2.FieldByName('CMDEP').AsCurrency;
            cdsBalPatClas.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas2.FieldByName('VALCTB').AsCurrency;
            cdsBalPatClas.FieldByName('QUANT').AsInteger     := cdsBalPatClas2.FieldByName('QUANT').AsInteger;
            cdsBalPatClas.Post;
            //----------------------------------------------------------------------------
            cdsBalPatClas2.Next;
         end;
      end;
      //----------------------------------------------------------------------------------
      cdsBalPatClas3.First;
      while not cdsBalPatClas3.EOF do
      begin
         cdsBalPatClas.Append;
         cdsBalPatClas.FieldByName('IDGRUPO').AsInteger   := cdsBalPatClas3.FieldByName('IDGRUPO').AsInteger;
         cdsBalPatClas.FieldByName('CLASSE').AsString     := cdsBalPatClas3.FieldByName('CLASSE').AsString;
         cdsBalPatClas.FieldByName('NOME').AsString       := cdsBalPatClas3.FieldByName('NOME').AsString;
         cdsBalPatClas.FieldByName('TIPO').AsString       := cdsBalPatClas3.FieldByName('TIPO').AsString;
         cdsBalPatClas.FieldByName('CODHIERARQ').AsString := cdsBalPatClas3.FieldByName('CODHIERARQ').AsString;
         cdsBalPatClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas3.FieldByName('DESCRICAO').AsString;
         cdsBalPatClas.FieldByName('ANASINT').AsString    := cdsBalPatClas3.FieldByName('ANASINT').AsString;
         cdsBalPatClas.FieldByName('VALORG').AsCurrency   := cdsBalPatClas3.FieldByName('VALORG').AsCurrency;
         cdsBalPatClas.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas3.FieldByName('CMBEM').AsCurrency;
         cdsBalPatClas.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas3.FieldByName('DEPLANC').AsCurrency;
         cdsBalPatClas.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas3.FieldByName('CMDEP').AsCurrency;
         cdsBalPatClas.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas3.FieldByName('VALCTB').AsCurrency;
         cdsBalPatClas.FieldByName('QUANT').AsInteger     := cdsBalPatClas3.FieldByName('QUANT').AsInteger;
         cdsBalPatClas.Post;
         //-------------------------------------------------------------------------------
         cdsBalPatClas3.Next;
      end;
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsBalPatGrpxClas.Close;
      sqlBalPatGrpxClas.Open;
      cdsBalPatClas.First;
      while not cdsBalPatClas.EOF do
      begin
         if cdsBalPatClas.FieldByName('QUANT').AsFloat <> 0 then
         begin
            cdsBalPatGrpxClas.Append;
            if cdsBalPatClas.FieldByName('CODHIERARQ').AsString = '' then
            begin
               cdsBalPatGrpxClas.FieldByName('CODHIERARQ').AsString := cdsBalPatClas.FieldByName('CLASSE').AsString;
               cdsBalPatGrpxClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas.FieldByName('NOME').AsString;
               cdsBalPatGrpxClas.FieldByName('S_A').AsString        := cdsBalPatClas.FieldByName('TIPO').AsString;
               //-------------------------------------------------------------------------
               if cdsBalPatGrpxClas.FieldByName('S_A').AsString = 'A' then
               begin
                  with sqlContaSemCC do
                  begin
                     Prepare;
                     ParamByName('IDPESSOA').AsFloat             := CrmRptCM.IdEmpresa;
                     ParamByName('IDGRUPO').AsInteger            := cdsBalPatClas.FieldByName('IDGRUPO').AsInteger;
                     ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 01;
                     ParamByName('TIPOLANCAMENTO').AsString      := 'D';
                     ParamByName('PLANO').AsInteger              := iPlanoVigente;
                     Open;
                  end;
                  //----------------------------------------------------------------------
                  if cdsContaSemCC.RecordCount <> 1 then
                     cdsBalPatGrpxClas.FieldByName('PLACONTA').AsString := ''
                  else
                     cdsBalPatGrpxClas.FieldByName('PLACONTA').AsString := cdsContaSemCC.FieldByName('PLACONTA').AsString;
                  //----------------------------------------------------------------------
                  cdsContaSemCC.Close;
               end;
            end else
            begin
               cdsBalPatGrpxClas.FieldByName('CODHIERARQ').Clear;
               cdsBalPatGrpxClas.FieldByName('DESCRICAO').AsString  := cdsBalPatClas.FieldByName('DESCRICAO').AsString;
               cdsBalPatGrpxClas.FieldByName('S_A').Clear;
            end;
            cdsBalPatGrpxClas.FieldByName('VALORG').AsCurrency   := cdsBalPatClas.FieldByName('VALORG').AsFloat;
            cdsBalPatGrpxClas.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas.FieldByName('CMBEM').AsFloat;
            cdsBalPatGrpxClas.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas.FieldByName('DEPLANC').AsFloat;
            cdsBalPatGrpxClas.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas.FieldByName('CMDEP').AsFloat;
            cdsBalPatGrpxClas.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas.FieldByName('VALCTB').AsFloat;
            cdsBalPatGrpxClas.FieldByName('QUANT').AsCurrency    := cdsBalPatClas.FieldByName('QUANT').AsFloat;
            cdsBalPatGrpxClas.Post;
         end;
         //-------------------------------------------------------------------------------
         cdsBalPatClas.Next;
      end;
      if cdsBalPatClas.IsEmpty then
         Raise Exception.Create('Não existem dados com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      rpDBText1.DisplayFormat := sMascaraClasse;
      rpDBText5.DisplayFormat := sMascaraPlano;
      ppLabel105.Caption      := DateToStr(CmpRptCM.ParamValues[0].AsDateTime);
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         Screen.Cursor := crDefault;
         CMDebugToFile('BALANCETE PATRIMONIAL POR GRUPO CONTÁBIL x CLASSES : ' + E.Message );
      end;
   end;
   Application.ProcessMessages
end;

procedure TRptCAFBalPatGrpxClas.rpDBText1Print(Sender: TObject);
begin
   inherited;
   if not cdsBalPatGrpxClas.FieldByName('CODHIERARQ').IsNull then
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

function TRptCAFBalPatGrpxClas.DataUltFechamento : String;
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

function TRptCAFBalPatGrpxClas.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TRptCAFBalPatGrpxClas.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
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
