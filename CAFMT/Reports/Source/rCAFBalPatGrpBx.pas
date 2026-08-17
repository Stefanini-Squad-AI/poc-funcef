unit rCAFBalPatGrpBx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db, uCMfileUtils,
  DBClient, uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport;

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
    ppDBText45: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine7: TppLine;
    LBLSISTEMA: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    dsBalPatGrpBx: TwwDataSource;
    ppBalPatGrpBx: TppBDEPipeline;
    cdsBalPatGrpBx: TCMClientDataSet;
    sqlBalPatGrpBx: TCMSqlParams;
    cdsBalPatAux: TCMClientDataSet;
    cdsParamCaf: TCMClientDataSet;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    sMascaraGrupo        : String;
    procedure ExecutaRelatorio;
  public
    { Public declarations }
  end;

var
  rptCAFBalPatGrpBx: TrptCAFBalPatGrpBx;

implementation

uses uCtrlPadroes,UMensErro, uDatabase, DBaseDados;

{$R *.DFM}

procedure TrptCAFBalPatGrpBx.CrmRptCMBeforePrint(Sender: TObject);
var
   fValOrg, fCmBem,
   fDepLanc, fCmDep, fValCtb   : Extended;
   iTam                        : Integer;
   sMensagem :string;

   iAno, iMes, iDia : Word;
   iAux :Integer;
begin
   inherited;

   Try
        //-------------------------------------------------------------------------------------
        // Pegando mascara
        //-------------------------------------------------------------------------------------
        sqlParamCaf.Prepare;
        sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
        sqlParamCaf.Open;
        sMascaraGrupo := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
        iAux := 1;
        while iAux <= length(sMascaraGrupo) do
        begin
           if sMascaraGrupo[iAux] = '9' then
              sMascaraGrupo[iAux] := '#';
           iAux := iAux + 1;
        end;
        sMascaraGrupo := sMascaraGrupo + ';0; ';
       //-------------------------------------------------------------------------------------
       // Calcula os Grupos Analiticos
       //-------------------------------------------------------------------------------------
       cdsGrpAnaliticos.Close;
       //-------------------------------------------------------------------------------------
       if (CmpRptCM.ParamValues[1].AsInteger <> 0) then
       begin
          sqlGrpAnaliticos.SQL.Strings[40] := ' AND (SB.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger)+') ';
       end else
       begin
          sqlGrpAnaliticos.SQL.Strings[40] := ' ';
       end;
       //-------------------------------------------------------------------------------------
       if (CmpRptCM.ParamValues[2].AsInteger = 0) then
       begin
          sqlGrpAnaliticos.SQL.Strings[41] := ' AND (G.FLGIMOVEL = 0) ';
          ppLabel77.Caption := 'IMOBILIZADO';
       end else
       if (CmpRptCM.ParamValues[2].AsInteger = 1) then
       begin
          sqlGrpAnaliticos.SQL.Strings[41] := ' AND (G.FLGIMOVEL = 1) ';
          ppLabel77.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
       end else
       begin
          sqlGrpAnaliticos.SQL.Strings[41] := ' ';
          ppLabel77.Caption := ' ';
       end;
       //-------------------------------------------------------------------------------------
       if (CmpRptCM.ParamValues[3].AsBoolean) then
       begin
          sqlGrpAnaliticos.SQL.Strings[42] := ' ';
       end else
       begin
          sqlGrpAnaliticos.SQL.Strings[42] := ' AND (B.CONTROLE = ''T'') ';
       end;
       //-------------------------------------------------------------------------------------
       DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
       sqlGrpAnaliticos.Prepare;
       sqlGrpAnaliticos.ParamByName('PIDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;
       sqlGrpAnaliticos.ParamByName('PDATAINI').AsDate     := EncodeDate(iAno,iMes,01);
       sqlGrpAnaliticos.ParamByName('PDATASLD').AsDate     := CmpRptCM.ParamValues[0].AsDateTime;
       sqlGrpAnaliticos.Open;
       sqlBalPatGrpBx.Open;
       //-------------------------------------------------------------------------------------
       while not cdsGrpAnaliticos.EOF do
       begin
          if (cdsBalPatGrpBx.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[])) then
          begin
             while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPatGrpBx.FieldByName('IDGRUPO').AsInteger) do
             begin
                cdsBalPatGrpBx.Edit;
                cdsBalPatGrpBx.FieldByName('VALORG').AsCurrency  := cdsGrpAnaliticos.FieldByName('VALORG0').AsFloat;
                cdsBalPatGrpBx.FieldByName('CMBEM').AsCurrency   := cdsGrpAnaliticos.FieldByName('CMBEM0').AsFloat;
                cdsBalPatGrpBx.FieldByName('DEPLANC').AsCurrency := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsFloat;
                cdsBalPatGrpBx.FieldByName('CMDEP').AsCurrency   := cdsGrpAnaliticos.FieldByName('CMDEP0').AsFloat;
                cdsBalPatGrpBx.FieldByName('VALCTB').AsCurrency  := cdsGrpAnaliticos.FieldByName('VALCTB0').AsFloat;
                cdsBalPatGrpBx.Post;
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
       //-------------------------------------------------------------------------------------
       while not cdsGrpSinteticos.EOF do
       begin
          iTam     := length(cdsGrpSinteticos.FieldByName('CLASSE').AsString);
          fValOrg  := 0;
          fCmBem   := 0;
          fDepLanc := 0;
          fCmDep   := 0;
          fValCtb  := 0;
          //----------------------------------------------------------------------------------
          cdsBalPatGrpBx.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]);
          while (not cdsBalPatGrpBx.EOF) and
                (copy(cdsBalPatGrpBx.FieldByName('CLASSE').AsString,1,iTam) = cdsGrpSinteticos.FieldByName('CLASSE').AsString) do
          begin
             fValOrg  := fValOrg  + cdsBalPatGrpBx.FieldByName('VALORG').AsFloat  ;
             fCmBem   := fCmBem   + cdsBalPatGrpBx.FieldByName('CMBEM').AsFloat   ;
             fDepLanc := fDepLanc + cdsBalPatGrpBx.FieldByName('DEPLANC').AsFloat ;
             fCmDep   := fCmDep   + cdsBalPatGrpBx.FieldByName('CMDEP').AsFloat   ;
             fValCtb  := fValCtb  + cdsBalPatGrpBx.FieldByName('VALCTB').AsFloat  ;
             cdsBalPatGrpBx.Next;
          end;
          //----------------------------------------------------------------------------------
          cdsBalPatGrpBx.Locate('CLASSE',cdsGrpSinteticos.FieldByName('CLASSE').AsString,[]);
          cdsBalPatGrpBx.Edit;
          cdsBalPatGrpBx.FieldByName('VALORG').AsCurrency  := fValOrg;
          cdsBalPatGrpBx.FieldByName('CMBEM').AsCurrency   := fCmBem;
          cdsBalPatGrpBx.FieldByName('DEPLANC').AsCurrency := fDepLanc;
          cdsBalPatGrpBx.FieldByName('CMDEP').AsCurrency   := fCmDep;
          cdsBalPatGrpBx.FieldByName('VALCTB').AsCurrency  := fValCtb;
          cdsBalPatGrpBx.Post;
          cdsGrpSinteticos.Next;
       end;
       cdsGrpSinteticos.Close;
       //-------------------------------------------------------------------------------------
       if cdsBalPatGrpBx.IsEmpty then
          sMensagem := 'Não houve movimentação com os parâmetros fornecidos!'
       else
          sMensagem := '';
       //-------------------------------------------------------------------------------------
       ExecutaRelatorio;
   Except
      On E:Exception Do
      Begin
        CMDebugToFile('Erro no Relatório Balancete Patrimonial por Grupo - Bens Baixados:' + sMensagem + (#13+#10) + E.Message );
      End;
   End;

end;

procedure TrptCAFBalPatGrpBx.ExecutaRelatorio;
var
   iAno, iMes, iDia : Word;

begin
   cdsBalPatAux.Data := cdsBalPatGrpBx.Data;
   //-------------------------------------------------------------------------------------
   // Transferindo dados para o relatório
   //-------------------------------------------------------------------------------------
   cdsBalPatAux.Close;
   cdsBalPatAux.Open;

   cdsBalPatGrpBx.First;
   while not cdsBalPatGrpBx.EOF do
   begin
      if (CmpRptCM.ParamValues[4].AsBoolean) or
         (((cdsBalPatGrpBx.FieldByName('VALORG').AsFloat + cdsBalPatGrpBx.FieldByName('CMBEM').AsFloat) -
           (cdsBalPatGrpBx.FieldByName('DEPLANC').AsFloat + cdsBalPatGrpBx.FieldByName('CMDEP').AsFloat) <> 0)) then
      begin
         if (not CmpRptCM.ParamValues[5].AsBoolean) or
            ((CmpRptCM.ParamValues[5].AsBoolean) and (cdsBalPatGrpBx.FieldByName('S_A').AsString = 'S')) then
         begin
            cdsBalPatAux.Append;
            cdsBalPatAux.FieldByName('IDGRUPO').AsInteger    := cdsBalPatGrpBx.FieldByName('IDGRUPO').AsInteger;
            cdsBalPatAux.FieldByName('CLASSE').AsString      := cdsBalPatGrpBx.FieldByName('CLASSE').AsString;
            cdsBalPatAux.FieldByName('DESCGRUPO').AsString   := cdsBalPatGrpBx.FieldByName('DESCGRUPO').AsString;
            cdsBalPatAux.FieldByName('S_A').AsString         := cdsBalPatGrpBx.FieldByName('S_A').AsString;
            cdsBalPatAux.FieldByName('VALORG').AsCurrency    := cdsBalPatGrpBx.FieldByName('VALORG').AsFloat;
            cdsBalPatAux.FieldByName('CMBEM').AsCurrency     := cdsBalPatGrpBx.FieldByName('CMBEM').AsFloat;
            cdsBalPatAux.FieldByName('DEPLANC').AsCurrency   := cdsBalPatGrpBx.FieldByName('DEPLANC').AsFloat;
            cdsBalPatAux.FieldByName('CMDEP').AsCurrency     := cdsBalPatGrpBx.FieldByName('CMDEP').AsFloat;
            cdsBalPatAux.FieldByName('VALCTB').AsCurrency    := cdsBalPatGrpBx.FieldByName('VALCTB').AsFloat;
            cdsBalPatAux.Post;
         end;
      end;
      //----------------------------------------------------------------------------------
      cdsBalPatGrpBx.Next;
   end;
   cdsBalPatGrpBx.Close;
   //-------------------------------------------------------------------------------------
   ppDBText45.DisplayFormat := sMascaraGrupo;
   //-------------------------------------------------------------------------------------
   DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
   ppLabel74.Text := 'Movimentação de '+datetostr(EncodeDate(iAno,iMes,01))+ ' a '+CmpRptCM.ParamValues[3].AsString;
   //-------------------------------------------------------------------------------------

end;

end.
