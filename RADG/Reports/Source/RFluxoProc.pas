
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

unit RFluxoProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCmSqlParams, uCMClientDataSet, Wwquery;

type
  TrptFluxoProc = class(TFrmCmReport)
    sqlFluxoProc: TCMSqlParams;
    cdsFluxoProc: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    cdsProcesso: TCMClientDataSet;
    RptFluxoProc: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    LblEmpresa: TppLabel;
    ppLabel6: TppLabel;
    LbProc2: TppLabel;
    RptFluxoProcLine1: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    RptFluxoProcDBText4: TppDBText;
    RptFluxoProcDBText5: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine6: TppLine;
    lblsistema: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel18: TppLabel;
    ppDBText8: TppDBText;
    ppDBMemo2: TppDBMemo;
    RptFluxoProcLabel1: TppLabel;
    RptFluxoProcDBText1: TppDBText;
    RptFluxoProcDBText2: TppDBText;
    RptFluxoProcDBText3: TppDBText;
    RptFluxoProcLabel2: TppLabel;
    RptFluxoProcLabel3: TppLabel;
    RptFluxoProcLabel4: TppLabel;
    RptFluxoProcLabel5: TppLabel;
    RptFluxoProcLine2: TppLine;
    RptFluxoProcLine3: TppLine;
    RptFluxoProcLabel6: TppLabel;
    RptFluxoProcLabel7: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    RptFluxoProcGroup1: TppGroup;
    RptFluxoProcGroupHeaderBand1: TppGroupHeaderBand;
    RptFluxoProcGroupFooterBand1: TppGroupFooterBand;
    dsFluxoProc: TwwDataSource;
    bdeFluxoProc: TppBDEPipeline;
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

procedure TrptFluxoProc.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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

procedure TrptFluxoProc.CrmRptCMBeforePrint(Sender: TObject);
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
    LbProc2.Caption := ' TODOS ';
    With sqlFluxoProc Do
      Begin
         Sql.Clear;
         Sql.Add(' SELECT                                         ');
         Sql.Add('       TP.IDTIPOPROCESSO,                       ');
         Sql.Add('       TP.NOME AS NOMEPROC,                     ');
         Sql.Add('       GG.NOME AS GRPGESTOR,                    ');
         Sql.Add('       GC.NOME AS GRPCON,                       ');
         Sql.Add('       TP.DESCRICAO,                            ');
         Sql.Add('       TP.NUMDIASPREVISTO,                      ');
         Sql.Add('       TE.NOME AS NOMEETAPA,                    ');
         Sql.Add('       EF.IDTIPOETAPA, EXP.FLGINICIAL,          ');
         Sql.Add('       EA.NOME AS ETAPAPRED,                    ');
         Sql.Add('       AN.NOME AS ANDAMENTO                     ');
         Sql.Add(' FROM                                           ');
         Sql.Add('       RADTIPOPROCESSO TP,                      ');
         Sql.Add('       RADFLUXO FL,                             ');
         Sql.Add('       RADTIPOETAPAXPROC EXP,                   ');
         Sql.Add('       RADGRPRESPON GG,                         ');
         Sql.Add('       RADGRPRESPON GC,                         ');
         Sql.Add('       RADTIPOETAPA EF,                         ');
         Sql.Add('       RADTIPOETAPA TE,                         ');
         Sql.Add('       RADTIPOETAPA EA,                         ');
         Sql.Add('       RADANDAMENTO AN                          ');
         Sql.Add(' WHERE                                          ');
      If Trim(sNomeProc) <> '' Then
         Begin
            LbProc2.Caption := sNomeProc;
            Sql.Add('       (TP.IDTIPOPROCESSO = '+FloatToStr(CmpRptCM.ParamValues[0].AsInteger)+')');
            Sql.Add('   AND (TP.IDGRPGESTOR     = GG.IDGRPRESPON(+)) ');
         End
      Else
         Sql.Add('       (TP.IDGRPGESTOR     = GG.IDGRPRESPON(+)) ');

         Sql.Add('   AND (TP.IDGRPCONSULTA   = GC.IDGRPRESPON(+)) ');
         Sql.Add('   AND (TP.IDTIPOPROCESSO  = FL.IDTIPOPROCESSO) ');
         Sql.Add('   AND (EXP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO) ');
         Sql.Add('   AND (EXP.IDTIPOETAPA    = TE.IDTIPOETAPA)    ');
         Sql.Add('   AND (EXP.IDTIPOETAPA    = EF.IDTIPOETAPA)    ');
         Sql.Add('   AND (FL.IDTIPOETAPA     = EF.IDTIPOETAPA)    ');
         Sql.Add('   AND (FL.IDETAPAANT      = EA.IDTIPOETAPA)    ');
         Sql.Add('   AND (FL.IDANDAMENTO     = AN.IDANDAMENTO)    ');
         Sql.Add(' ORDER BY NOMEPROC, FLGINICIAL DESC             ');
         Open;
      End;
end;

end.
