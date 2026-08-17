unit rBalPatGrpAnal2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, uCmRptManager, uCMfileUtils,
  TXComp, CmParamReport,uAtivoFixo, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
  ppProd, ppReport;

type
  TRptBalPatGrpAnal2 = class(TFrmCmReport)
    cdsClasAnaliticos: TCMClientDataSet;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlClasAnaliticos: TCMSqlParams;
    sqlGrpSinteticos: TCMSqlParams;
    cdsBalPatClas1: TCMClientDataSet;
    sqlBalPatClas1: TCMSqlParams;
    sqlBalPatClas2: TCMSqlParams;
    sqlBalPatClas3: TCMSqlParams;
    sqlBalPatClas: TCMSqlParams;
    cdsBalPatClas: TCMClientDataSet;
    cdsBalPatClas3: TCMClientDataSet;
    cdsBalPatClas2: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    cdsBalPatAux: TCMClientDataSet;
    sqlContaSemCC: TCMSqlParams;
    cdsContaSemCC: TCMClientDataSet;
    sqlBalPatAux: TCMSqlParams;
    rpBalPatGrpAnal2: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel76: TppLabel;
    ppLine20: TppLine;
    LblEmpresa: TppLabel;
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
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText106: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText107: TppDBText;
    ppDBText105: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine21: TppLine;
    LBLSISTEMA: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppSoma11: TppVariable;
    ppLabel110: TppLabel;
    ppLine22: TppLine;
    ppSoma12: TppVariable;
    ppSoma13: TppVariable;
    ppBalPatGrpAnal2: TppBDEPipeline;
    ppBalPatGrpAnal2ppField1: TppField;
    ppBalPatGrpAnal2ppField2: TppField;
    ppBalPatGrpAnal2ppField3: TppField;
    ppBalPatGrpAnal2ppField4: TppField;
    ppBalPatGrpAnal2ppField5: TppField;
    ppBalPatGrpAnal2ppField6: TppField;
    ppBalPatGrpAnal2ppField7: TppField;
    ppBalPatGrpAnal2ppField8: TppField;
    ppBalPatGrpAnal2ppField9: TppField;
    ppBalPatGrpAnal2ppField10: TppField;
    dsBalPatGrpAnal2: TwwDataSource;
    sqlBalPatGrpAnal2: TCMSqlParams;
    cdsBalPatGrpAnal2: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand4AfterPrint(Sender: TObject);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure rpBalPatGrpAnal2BeforePrint(Sender: TObject);
  private
    { Private declarations }
    iPlanoVigente  :Integer;
    sMascaraClasse :string;
  public
    { Public declarations }
  end;

var
  RptBalPatGrpAnal2: TRptBalPatGrpAnal2;

implementation

uses uCtrlPadroes,UMensErro, uDatabase, DBaseDados;

{$R *.DFM}

procedure TRptBalPatGrpAnal2.CrmRptCMBeforePrint(Sender: TObject);
var iAux :Integer;
    sMensagem :string;
    fValOrg, fCmBem, fDepLanc, fCmDep, fValCtb : Double;
    iTam, iQuant, iGrupoA                      : Integer;
    sGrupoA, sNomeA                            : String;
begin
  inherited;

  Try
       //-------------------------------------------------------------------------
       // Pega a Mascara da classe
       //-------------------------------------------------------------------------
       sqlParamCaf.Prepare;
       sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
       sqlParamCaf.Open;
       sMascaraClasse := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
       iPlanoVigente  := cdsParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
       iAux := 1;
       while iAux <= length(sMascaraClasse) do
       begin
          if sMascaraClasse[iAux] = '9' then
             sMascaraClasse[iAux] := '#';
          iAux := iAux + 1;
       end;
       sMascaraClasse := sMascaraClasse + ';0; ';
       //-------------------------------------------------------------------------
       sqlBalPatAux.Open;  // recebeu qryBalPatGrpAnal2 do dtmrelBalCaf
       //-------------------------------------------------------------------------------------
       sqlBalPatClas.Open;
       sqlBalPatClas1.Open;
       sqlBalPatClas2.Open;
       sqlBalPatClas3.Open;
       //-------------------------------------------------------------------------------------
       // Calcula as Classes Analiticas
       //-------------------------------------------------------------------------------------
       if CmpRptCM.ParamValues[1].AsInteger <> 0 then
       begin
          sqlClasAnaliticos.SQL.Strings[36] := 'AND (B.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger)+')';
       end else
       begin
          sqlClasAnaliticos.SQL.Strings[36] := ' ';
       end;
       //-------------------------------------------------------------------------------------
       if CmpRptCM.ParamValues[2].AsBoolean then
       begin
          sqlClasAnaliticos.SQL.Strings[37] := ' ';
       end else
       begin
          sqlClasAnaliticos.SQL.Strings[37] := ' AND (B.CONTROLE = ''T'') ';
       end;
       //-------------------------------------------------------------------------------------
       if CmpRptCM.ParamValues[4].AsBoolean then
       begin
          sqlClasAnaliticos.SQL.Strings[38] := ' ';
       end else
       begin
          sqlClasAnaliticos.SQL.Strings[38] := ' AND (B.BAIXATOTAL <> ''S'') ';
       end;
       //-------------------------------------------------------------------------------------
       sqlClasAnaliticos.Prepare;
       sqlClasAnaliticos.ParamByName('PIDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;
       sqlClasAnaliticos.ParamByName('PDATASLD').AsDate     := CmpRptCM.ParamValues[0].AsDateTime;
       sqlClasAnaliticos.Open;
       //-------------------------------------------------------------------------------------
       while not cdsClasAnaliticos.EOF do
       begin
          if not (cdsBalPatClas1.Locate('CLASSE;CODHIERARQ',
                                        VarArrayOf([cdsClasAnaliticos.FieldbyName('CLASSE').AsString,
                                                    cdsClasAnaliticos.FieldbyName('CODHIERARQ').AsString]) ,[])) then
          begin
             cdsBalPatClas1.Append;
             cdsBalPatClas1.FieldByName('IDGRUPO').AsInteger   := cdsClasAnaliticos.FieldbyName('IDGRUPO').AsInteger;
             cdsBalPatClas1.FieldByName('CLASSE').AsString     := cdsClasAnaliticos.FieldbyName('CLASSE').AsString;
             cdsBalPatClas1.FieldByName('NOME').AsString       := cdsClasAnaliticos.FieldbyName('NOME').AsString;
             cdsBalPatClas1.FieldByName('TIPO').AsString       := cdsClasAnaliticos.FieldbyName('TIPO').AsString;
             cdsBalPatClas1.FieldByName('CODHIERARQ').AsString := cdsClasAnaliticos.FieldbyName('CODHIERARQ').AsString;
             cdsBalPatClas1.FieldByName('DESCRICAO').AsString  := cdsClasAnaliticos.FieldbyName('DESCRICAO').AsString;
             cdsBalPatClas1.FieldByName('ANASINT').AsString    := cdsClasAnaliticos.FieldbyName('ANASINT').AsString;
             cdsBalPatClas1.Post;
          end else
          begin
             cdsBalPatClas1.Edit;
          end;
          cdsBalPatClas1.FieldByName('VALORG').AsCurrency   := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('VALORG').AsFloat  + cdsClasAnaliticos.FieldByName('VALORG0').AsFloat);
          cdsBalPatClas1.FieldByName('CMBEM').AsCurrency    := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('CMBEM').AsFloat   + cdsClasAnaliticos.FieldByName('CMBEM0').AsFloat);
          cdsBalPatClas1.FieldByName('DEPLANC').AsCurrency  := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('DEPLANC').AsFloat + cdsClasAnaliticos.FieldByName('DEPLANC0').AsFloat);
          cdsBalPatClas1.FieldByName('CMDEP').AsCurrency    := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('CMDEP').AsFloat   + cdsClasAnaliticos.FieldByName('CMDEP0').AsFloat);
          cdsBalPatClas1.FieldByName('VALCTB').AsCurrency   := AtivoFixo.ConvNum(cdsBalPatClas.FieldByName('VALCTB').AsFloat  + cdsClasAnaliticos.FieldByName('VALCTB0').AsFloat);
          cdsBalPatClas1.FieldByName('QUANT').AsInteger     := cdsBalPatClas.FieldByName('QUANT').AsInteger + cdsClasAnaliticos.FieldByName('QUANT').AsInteger;
          //----------------------------------------------------------------------------------
          cdsClasAnaliticos.Next;
       end;
       cdsClasAnaliticos.Close;
       //-------------------------------------------------------------------------------------
       // Calcula os grupos contábeis analíticos
       //-------------------------------------------------------------------------------------
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
             fValOrg  := AtivoFixo.ConvNum(fValOrg  + cdsBalPatClas1.FieldByName('VALORG').AsFloat);
             fCmBem   := AtivoFixo.ConvNum(fCmBem   + cdsBalPatClas1.FieldByName('CMBEM').AsFloat);
             fDepLanc := AtivoFixo.ConvNum(fDepLanc + cdsBalPatClas1.FieldByName('DEPLANC').AsFloat);
             fCmDep   := AtivoFixo.ConvNum(fCmDep   + cdsBalPatClas1.FieldByName('CMDEP').AsFloat);
             fValCtb  := AtivoFixo.ConvNum(fValCtb  + cdsBalPatClas1.FieldByName('VALCTB').AsFloat);
             iQuant   := iQuant + cdsBalPatClas1.FieldByName('QUANT').AsInteger;
             //-------------------------------------------------------------------------------
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
       end;
       //-------------------------------------------------------------------------------------
       // Calcula os grupos contábeis sintéticos
       //-------------------------------------------------------------------------------------
       sqlGrpSinteticos.Open;
       while not cdsGrpSinteticos.EOF do
       begin
          //----------------------------------------------------------------------------------
          iTam     := length(cdsGrpSinteticos.FieldByName('CLASSE').AsString);
          fValOrg  := 0;
          fCmBem   := 0;
          fDepLanc := 0;
          fCmDep   := 0;
          fValCtb  := 0;
          iQuant   := 0;
          //----------------------------------------------------------------------------------
          cdsBalPatClas2.Locate('CLASSE',cdsGrpSinteticos.FieldByName('CLASSE').AsString,[loPartialKey]);
          while (not cdsBalPatClas2.EOF) and
                (copy(cdsBalPatClas2.FieldByName('CLASSE').AsString,1,iTam) = cdsGrpSinteticos.FieldByName('CLASSE').AsString) do
          begin
             fValOrg  := AtivoFixo.ConvNum(fValOrg  + cdsBalPatClas2.FieldByName('VALORG').AsFloat);
             fCmBem   := AtivoFixo.ConvNum(fCmBem   + cdsBalPatClas2.FieldByName('CMBEM').AsFloat);
             fDepLanc := AtivoFixo.ConvNum(fDepLanc + cdsBalPatClas2.FieldByName('DEPLANC').AsFloat);
             fCmDep   := AtivoFixo.ConvNum(fCmDep   + cdsBalPatClas2.FieldByName('CMDEP').AsFloat);
             fValCtb  := AtivoFixo.ConvNum(fValCtb  + cdsBalPatClas2.FieldByName('VALCTB').AsFloat);
             iQuant   := iQuant + cdsBalPatClas2.FieldByName('QUANT').AsInteger;
             //-------------------------------------------------------------------------------
             cdsBalPatClas2.Next;
          end;
          //----------------------------------------------------------------------------------
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
          //----------------------------------------------------------------------------------
          cdsGrpSinteticos.Next;
       end;
       cdsGrpSinteticos.Close;
       //-------------------------------------------------------------------------------------
       // Mesclar e transferir para o relatório
       //-------------------------------------------------------------------------------------
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
          //----------------------------------------------------------------------------------
          cdsBalPatClas1.Next;
       end;
       //-------------------------------------------------------------------------------------
       if not CmpRptCM.ParamValues[3].AsBoolean then
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
             //-------------------------------------------------------------------------------
             cdsBalPatClas2.Next;
          end;
       end;
       //-------------------------------------------------------------------------------------
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
          //----------------------------------------------------------------------------------
          cdsBalPatClas3.Next;
       end;
       sMensagem := '';
       if cdsBalPatClas.IsEmpty then
          sMensagem := 'Não existem dados com os parâmetros fornecidos!';
       //-------------------------------------------------------------------------------------
       // Transferindo dados para o relatório
       //-------------------------------------------------------------------------------------
       cdsBalPatClas.First;
       while not cdsBalPatClas.EOF do
       begin
          //----------------------------------------------------------------------------------
          if (cdsBalPatClas.FieldByName('VALORG').AsFloat <> 0) or
             (cdsBalPatClas.FieldByName('CMBEM').AsFloat <> 0) then
          begin
             cdsBalPatAux.Append;
             if cdsBalPatClas.FieldByName('CODHIERARQ').AsString = '' then
             begin
                cdsBalPatAux.FieldByName('CODHIERARQ').AsString := cdsBalPatClas.FieldByName('CLASSE').AsString;
                cdsBalPatAux.FieldByName('DESCRICAO').AsString  := cdsBalPatClas.FieldByName('NOME').AsString;
                cdsBalPatAux.FieldByName('S_A').AsString        := cdsBalPatClas.FieldByName('TIPO').AsString;
                //----------------------------------------------------------------------------
                if cdsBalPatAux.FieldByName('S_A').AsString = 'A' then
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
                      //----------------------------------------------------------------------
                      cdsBalPatAux.FieldByName('PLACONTA').AsString := cdsContaSemCC.FieldByName('PLACONTA').AsString;
                      //----------------------------------------------------------------------
                      Close;
                   end;
                end;
             end else
             begin
                cdsBalPatAux.FieldByName('CODHIERARQ').Clear;
                cdsBalPatAux.FieldByName('DESCRICAO').AsString  := cdsBalPatClas.FieldByName('DESCRICAO').AsString;
                cdsBalPatAux.FieldByName('S_A').Clear;
             end;
             cdsBalPatAux.FieldByName('VALORG').AsCurrency   := cdsBalPatClas.FieldByName('VALORG').AsFloat;
             cdsBalPatAux.FieldByName('CMBEM').AsCurrency    := cdsBalPatClas.FieldByName('CMBEM').AsFloat;
             cdsBalPatAux.FieldByName('DEPLANC').AsCurrency  := cdsBalPatClas.FieldByName('DEPLANC').AsFloat;
             cdsBalPatAux.FieldByName('CMDEP').AsCurrency    := cdsBalPatClas.FieldByName('CMDEP').AsFloat;
             cdsBalPatAux.FieldByName('VALCTB').AsCurrency   := cdsBalPatClas.FieldByName('VALCTB').AsFloat;
             cdsBalPatAux.FieldByName('QUANT').AsCurrency    := cdsBalPatClas.FieldByName('QUANT').AsFloat;
             //-------------------------------------------------------------------------------
             cdsBalPatAux.Post;
          end;
          //----------------------------------------------------------------------------------
          cdsBalPatClas.Next;
       end;
       //-------------------------------------------------------------------------------------
       ppDBText101.DisplayFormat := sMascaraClasse;
       ppLabel105.Caption        := DateToStr(CmpRptCM.ParamValues[0].AsDateTime);

  Except
     On E:Exception Do
     Begin
       CMDebugToFile('Erro no Relatório Balancete Patrimonial por Grupo Contábil Analítico:' + sMensagem + (#13+#10) + E.Message );
     End;
   End;


end;

procedure TRptBalPatGrpAnal2.ppDetailBand4AfterPrint(Sender: TObject);
begin
  inherited;
   if cdsBalPatGrpAnal2.FieldByName('S_A').AsString = 'A' then
   begin
      ppSoma11.Value := ppSoma11.Value + cdsBalPatGrpAnal2.FieldByName('QUANT').AsInteger;
      ppSoma12.Value := AtivoFixo.ConvNum(ppSoma12.Value + cdsBalPatGrpAnal2.FieldByName('VALORG').AsCurrency);
      ppSoma13.Value := AtivoFixo.ConvNum(ppSoma13.Value + cdsBalPatGrpAnal2.FieldByName('VALCTB').AsCurrency);
   end;

end;

procedure TRptBalPatGrpAnal2.ppDetailBand4BeforePrint(Sender: TObject);
begin
  inherited;
   if cdsBalPatGrpAnal2.FieldByName('S_A').AsString = 'S' then
   begin
      ppDBText101.Font.Style := [fsBold];
      ppDBText102.Font.Style := [fsBold];
      ppDBText103.Font.Style := [fsBold];
      ppDBText104.Font.Style := [fsBold];
      ppDBText105.Font.Style := [fsBold];
      ppDBText106.Font.Style := [fsBold];
   end else
   if cdsBalPatGrpAnal2.FieldByName('S_A').AsString = 'A' then
   begin
      ppDBText101.Font.Style := [];
      ppDBText102.Font.Style := [];
      ppDBText103.Font.Style := [];
      ppDBText104.Font.Style := [];
      ppDBText105.Font.Style := [];
      ppDBText106.Font.Style := [];
   end else
   if cdsBalPatGrpAnal2.FieldByName('S_A').AsString = '' then
   begin
      ppDBText101.Font.Style := [fsItalic];
      ppDBText102.Font.Style := [fsItalic];
      ppDBText103.Font.Style := [fsItalic];
      ppDBText104.Font.Style := [fsItalic];
      ppDBText105.Font.Style := [fsItalic];
      ppDBText106.Font.Style := [fsItalic];
   end;

end;

procedure TRptBalPatGrpAnal2.rpBalPatGrpAnal2BeforePrint(Sender: TObject);
begin
  inherited;
   ppSoma11.Value := 0;
   ppSoma12.Value := 0;
   ppSoma13.Value := 0;

end;

end.
