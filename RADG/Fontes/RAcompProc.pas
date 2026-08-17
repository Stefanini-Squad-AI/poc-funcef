unit RAcompProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, ppVar,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  TRptAcompProc = class(TFrmCmReport)
    bdeAcompProc: TppBDEPipeline;
    dsAcompProc: TwwDataSource;
    qryAcompProc: TwwQuery;
    RptAcompProc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    RptAcompProcLine1: TppLine;
    RptAcompProcLabel1: TppLabel;
    LbProc: TppLabel;
    RptAcompProcLabel2: TppLabel;
    RptAcompProcLine2: TppLine;
    RptAcompProcLabel5: TppLabel;
    RptAcompProcLabel6: TppLabel;
    RptAcompProcLabel7: TppLabel;
    RptAcompProcLabel8: TppLabel;
    RptAcompProcLabel11: TppLabel;
    RptAcompProcLabel13: TppLabel;
    RptAcompProcLabel14: TppLabel;
    ppDetailBand1: TppDetailBand;
    RptAcompProcDBText3: TppDBText;
    RptAcompProcDBText4: TppDBText;
    RptAcompProcDBText5: TppDBText;
    RptAcompProcDBText6: TppDBText;
    RptAcompProcDBText10: TppDBText;
    RptAcompProcDBText11: TppDBText;
    RptAcompProcDBMemo2: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    RptAcompProcGroup1: TppGroup;
    RptAcompProcGroupHeaderBand1: TppGroupHeaderBand;
    RptAcompProcLabel3: TppLabel;
    RptAcompProcLabel4: TppLabel;
    RptAcompProcDBText1: TppDBText;
    RptAcompProcDBText2: TppDBText;
    RptAcompProcDBMemo1: TppDBMemo;
    RptAcompProcLabel9: TppLabel;
    RptAcompProcLabel10: TppLabel;
    RptAcompProcLabel12: TppLabel;
    RptAcompProcDBText7: TppDBText;
    RptAcompProcDBText8: TppDBText;
    RptAcompProcDBText9: TppDBText;
    RptAcompProcLabel16: TppLabel;
    RptAcompProcDBText12: TppDBText;
    RptAcompProcLabel15: TppLabel;
    RptAcompProcLine3: TppLine;
    RptAcompProcGroupFooterBand1: TppGroupFooterBand;
    RptAcompProcGroup2: TppGroup;
    RptAcompProcGroupHeaderBand2: TppGroupHeaderBand;
    RptAcompProcGroupFooterBand2: TppGroupFooterBand;
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
    sTipoProc : String;
  public
    { Public declarations }
  end;

var
  RptAcompProc: TRptAcompProc;

implementation

{$R *.DFM}

procedure TRptAcompProc.CrmRptCMChangeDataBaseName(Sender: TObject;
  sDataBaseName: String);
begin
  inherited;
  If qryAcompProc.Active Then
     qryAcompProc.Close;
  qryAcompProc.DataBaseName := sDataBaseName;

end;

procedure TRptAcompProc.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  With qryAcompProc Do
     Begin
        Close;
        Sql.Clear;
        Sql.Add(' SELECT                                           ');
        Sql.Add('      IP.IDPROCESSO,                              ');
        Sql.Add('      TP.NOME AS NOMEPROC,                        ');
        Sql.Add('      IP.DATAINIPROCESSO,                         ');
        Sql.Add('      IP.DATAFIMPREV,                             ');
        Sql.Add('      IP.DATAFIMPROCESSO,                         ');
        Sql.Add('      IP.OBS AS OBSPROC,                          ');
        Sql.Add('      IE.IDETAPA,                                 ');
        Sql.Add('      IE.DATAFIMETAPA,                            ');
        Sql.Add('      IE.DATAINIETAPA,                            ');
        Sql.Add('      IE.DATAFIMPREV,                             ');
        Sql.Add('      TE.NOME AS NOMETAPA,                        ');
        Sql.Add('      AUT.DATAAUTORIZACAO,                        ');
        Sql.Add('      AUT.OBSAUTORIZA,                            ');
        Sql.Add('      USU.NOMEUSUARIO,                            ');
        Sql.Add('      DECODE(AUT.FLGSTATUS,''R'',''RECUSADO'', DECODE(AUT.FLGSTATUS,''S'',''AUTORIZADO'',''EXECUTADO'')) AS STATUS, ');
        Sql.Add('      P.RAZAOSOCIAL                                ');
        Sql.Add(' FROM                                              ');
        Sql.Add('       PESSOA          P,                          ');
        Sql.Add('       RADINSTETAPA    IE,                         ');
        Sql.Add('       RADINSTPROCESSO IP,                         ');
        Sql.Add('       RADAUTORIZACAO  AUT,                        ');
        Sql.Add('       RADTIPOETAPA    TE,                         ');
        Sql.Add('       RADTIPOPROCESSO TP,                         ');
        Sql.Add('       USUARIOSISTEMA  USU                         ');
        Sql.Add(' WHERE                                             ');
        Sql.Add('      (IE.IDPROCESSO     = IP.IDPROCESSO)          ');
         LbProc.Caption := ' TODOS ';
        If Not CmpRptCM.ParamValues[1].IsNull Then
          Begin
             Sql.Add(' AND (IP.IDPROCESSO = '+CmpRptCM.ParamValues[1].AsString+')');
              LbProc.Caption := ' Processo Nº '+CmpRptCM.ParamValues[1].AsString;
          End
        Else
          Begin
            If Not CmpRptCM.ParamValues[0].IsNull Then
               Begin
                  Sql.Add(' AND (TP.IDTIPOPROCESSO = '+CmpRptCM.ParamValues[0].AsString+')');
                   LbProc.Caption := ' Processos do Tipo   '+ sTipoProc;
               End;
            If (CmpRptCM.ParamValues[2].AsInteger = 1) And ( CmpRptCM.ParamValues[0].IsNull ) Then
               Begin
                  Sql.Add(' AND (IP.FLGOK <> ''S'')');
                   LbProc.Caption := ' Processos só pendentes ';
               End
            Else
            If (CmpRptCM.ParamValues[2].AsInteger = 1) And ( Not CmpRptCM.ParamValues[0].IsNull) Then
               Begin
                   Sql.Add(' AND (IP.FLGOK <> ''S'')');
                    LbProc.Caption := ' Processos do Tipo   '+sTipoProc+ ' e só pendentes ';
               End;
            If (CmpRptCM.ParamValues[2].AsInteger = 2) And ( CmpRptCM.ParamValues[0].IsNull ) Then
               Begin
                  Sql.Add(' AND (IP.FLGOK <> ''S'') AND (IP.DATAFIMPREV < TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY'') )');
                   LbProc.Caption := ' Processos em atraso ';
               End
            Else
            If (CmpRptCM.ParamValues[2].AsInteger = 2 ) And ( Not CmpRptCM.ParamValues[0].IsNull ) Then
               Begin
                   Sql.Add(' AND (IP.FLGOK <> ''S'') AND (IP.DATAFIMPREV < TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY'') )');
                    LbProc.Caption := ' Processos do Tipo   '+sTipoProc + ' em atraso  ';
               End;
          End;
        Sql.Add('    AND (IP.IDPESSRESP     = P.IDPESSOA(+))        ');
        Sql.Add('    AND (IE.IDTIPOETAPA    = TE.IDTIPOETAPA)       ');
        Sql.Add('    AND (TP.IDTIPOPROCESSO = IP.IDTIPOPROCESSO)    ');
        Sql.Add('    AND (AUT.IDPROCESSO    = IP.IDPROCESSO)        ');
        Sql.Add('    AND (AUT.IDUSUARIO     = USU.IDUSUARIO)        ');
        Sql.Add('    AND (AUT.IDETAPA       = IE.IDETAPA)           ');
        Sql.Add(' ORDER BY  TP.NOME,IE.IDETAPA, IE.DATAFIMPREV ');
        Open;
     End;
end;

procedure TRptAcompProc.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  Case Index Of
    0: Begin
          If Trim(TPainelControles(Sender).CtrlLookup.Text) <> '' Then
             CmpRptCM.ParamValues[1].Required := False;
          sTipoProc := TPainelControles(Sender).CtrlLookup.Text;
       End;
    1: Begin
          If Trim(TPainelControles(Sender).CtrlRealEdit.Text) <> '' Then
             CmpRptCM.ParamValues[0].Required := False;
       End;
  End;
end;

procedure TRptAcompProc.CmpRptCMBeforeExecute(var CanExecute: Boolean);
Var
  SQL : String;
begin
  inherited;
  SQL := '  SELECT '+
         '        IDTIPOPROCESSO, '+
         '        NOME '+
         '  FROM '+
         '        RADTIPOPROCESSO '+
         '  WHERE '+
         '       ( IDGRPGESTOR  IN ( SELECT IDGRPRESPON '+
         '                            FROM RADRESPONXGRP '+
         '                            WHERE (IDUSUARIO = '+IntToStr(CrmRptCM.IdUsuario)+') ) ) '+
         '  UNION '+
         '  SELECT '+
         '         IDTIPOPROCESSO, '+
         '         NOME '+
         '  FROM '+
         '        RADTIPOPROCESSO '+
         '  WHERE '+
         '       ( IDGRPCONSULTA  IN ( SELECT '+
         '                                  AXP.IDGRUPOAUTORIZA '+
         '                             FROM '+
         '                                  RADRESPONXGRP GR, '+
         '                                  RADGRAUTXGRRESPON  AXP '+
         '                             WHERE '+
         '                                  (GR.IDUSUARIO = '+IntToStr(CrmRptCM.IdUsuario)+') '+
         '                              AND (GR.IDGRPRESPON = AXP.IDGRPRESPON) '+
         '                             GROUP BY AXP.IDGRUPOAUTORIZA) ) '+
         '  ORDER BY NOME ';
  CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := SQL;
end;

end.
