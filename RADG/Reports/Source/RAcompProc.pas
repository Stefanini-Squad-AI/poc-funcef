
{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Relatórios do Sistema de Contabilidade              }
{                                                       }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 22/03/2002                             }
{                                                       }
{*******************************************************}

unit RAcompProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCmSqlParams, uCMClientDataSet, Wwquery;

type
  TrptAcompProc = class(TFrmCmReport)
    sqlAcompProc: TCMSqlParams;
    RptAcompProc: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    LblEmpresa: TppLabel;
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
    lblSistema: TppLabel;
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
    dsAcompProc: TwwDataSource;
    bdeAcompProc: TppBDEPipeline;
    cdsAcompProc: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    cdsProcesso: TCMClientDataSet;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

Uses dBaseDados;

procedure TrptAcompProc.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;

   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:= 'SELECT                                           '+
              '       IDTIPOPROCESSO,                           '+
              '       NOME                                      '+
              'FROM                                             '+
              '      RADTIPOPROCESSO                            '+
              'WHERE                                            '+
              '     ( IDGRPGESTOR  IN ( SELECT IDGRPRESPON      '+
              '                          FROM RADRESPONXGRP     '+
              '                          WHERE (IDUSUARIO = '+FloatToStr(CrmRptCM.IdUsuario)+') ) ) '+
              'UNION                                                        '+
              'SELECT                                                       '+
              '       IDTIPOPROCESSO,                                       '+
              '       NOME                                                  '+
              'FROM                                                         '+
              '      RADTIPOPROCESSO                                        '+
              'WHERE                                                        '+
              '     ( IDGRPCONSULTA  IN ( SELECT                            '+
              '                                AXP.IDGRUPOAUTORIZA          '+
              '                           FROM                              '+
              '                                RADRESPONXGRP GR,            '+
              '                                RADGRAUTXGRRESPON  AXP       '+
              '                           WHERE                             '+
              '                                (GR.IDUSUARIO = '+FloatToStr(CrmRptCM.IdUsuario)+')  '+
              '                            AND (GR.IDGRPRESPON = AXP.IDGRPRESPON)  '+
              '                           GROUP BY AXP.IDGRUPOAUTORIZA) )          '+
              'ORDER BY NOME ';
end;

procedure TrptAcompProc.CrmRptCMBeforePrint(Sender: TObject);
var sNomeProc : String;
begin
    inherited;
    sNomeProc := '';
   If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
      Begin
         sqlProcesso.Prepare;
         sqlProcesso.ParamByName('IDTIPOPROCESSO').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
         sqlProcesso.Open;
         sNomeProc := cdsProcesso.FieldByName('NOME').AsString;
      end;
   With sqlAcompProc Do
     Begin
        Sql.Clear;
        Sql.Add(' SELECT                                           ');
        Sql.Add('      IP.IDPROCESSO,                              ');
        Sql.Add('      TP.NOME AS NOMEPROC,                        ');
        Sql.Add('      IP.DATAINIPROCESSO,                         ');
        Sql.Add('      IP.DATAFIMPREV AS DATAFIMPREVPROC,          ');
        Sql.Add('      IP.DATAFIMPROCESSO,                         ');
        Sql.Add('      IP.OBS AS OBSPROC,                          ');
        Sql.Add('      IE.IDETAPA,                                 ');
        Sql.Add('      IE.DATAFIMETAPA,                            ');
        Sql.Add('      IE.DATAINIETAPA,                            ');
        Sql.Add('      IE.DATAFIMPREV AS DATAFIMPREVETAPA,         ');
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
        If CmpRptCM.ParamValues[1].AsInteger <> 0 then begin
             Sql.Add(' AND (IP.IDPROCESSO = '+FloatToStr(CmpRptCM.ParamValues[1].AsInteger)+')');
             LbProc.Caption := ' Processo Nº '+FloatToStr(CmpRptCM.ParamValues[1].AsInteger);
        end else begin
           LbProc.Caption := '';
           If Trim(sNomeProc) <> '' Then Begin
              Sql.Add(' AND (TP.IDTIPOPROCESSO = '+FloatToStr(CmpRptCM.ParamValues[0].AsInteger)+')');
              LbProc.Caption := ' Processos do Tipo   '+sNomeProc;
           End;
           If (CmpRptCM.ParamValues[2].AsInteger = 1)  Then begin
              Sql.Add(' AND (IP.FLGOK <> ''S'')');
              LbProc.Caption := LbProc.Caption+' Somente os pendentes';
           End Else begin
              If (CmpRptCM.ParamValues[2].AsInteger = 2)  Then Begin
                 Sql.Add(' AND (IP.FLGOK <> ''S'') AND (IP.DATAFIMPREV < TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY'') )');
                 LbProc.Caption := LbProc.Caption+' Somente os em atraso ';
              End;
           End;
           if LbProc.Caption = '' then
              LbProc.Caption := ' TODOS ';
        end;
        Sql.Add('    AND (IP.IDPESSRESP     = P.IDPESSOA(+))        ');
        Sql.Add('    AND (IE.IDTIPOETAPA    = TE.IDTIPOETAPA)       ');
        Sql.Add('    AND (TP.IDTIPOPROCESSO = IP.IDTIPOPROCESSO)    ');
        Sql.Add('    AND (AUT.IDPROCESSO    = IP.IDPROCESSO)        ');
        Sql.Add('    AND (AUT.IDUSUARIO     = USU.IDUSUARIO)        ');
        Sql.Add('    AND (AUT.IDETAPA       = IE.IDETAPA)           ');
        Sql.Add(' ORDER BY  NOMEPROC,IDETAPA, DATAFIMPREVETAPA ');
        Open;
     End;
end;

end.
