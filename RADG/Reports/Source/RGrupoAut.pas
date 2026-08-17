
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

unit RGrupoAut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCmSqlParams, uCMClientDataSet, Wwquery;

type
  TrptGrupoAut = class(TFrmCmReport)
    sqlGrpAut: TCMSqlParams;
    cdsGrpAut: TCMClientDataSet;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    RptGrpAut: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel22: TppLabel;
    LblEmpresa: TppLabel;
    ppLabel24: TppLabel;
    LbGrpAut: TppLabel;
    ppLabel27: TppLabel;
    RptGrpAutLine1: TppLine;
    RptGrpAutLabel1: TppLabel;
    RptGrpAutLabel2: TppLabel;
    RptGrpAutLabel3: TppLabel;
    ppLine10: TppLine;
    RptGrpAutLabel4: TppLabel;
    RptGrpAutLabel5: TppLabel;
    RptGrpAutLabel6: TppLabel;
    ppDetailBand5: TppDetailBand;
    RptGrpAutDBText2: TppDBText;
    RptGrpAutDBText3: TppDBText;
    RptGrpAutDBText4: TppDBText;
    RptGrpAutDBText5: TppDBText;
    RptGrpAutDBText6: TppDBText;
    RptGrpAutDBText7: TppDBText;
    RptGrpAutDBText8: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine11: TppLine;
    lblSistema: TppLabel;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    RptGrpAutGroup1: TppGroup;
    RptGrpAutGroupHeaderBand1: TppGroupHeaderBand;
    RptGrpAutDBText1: TppDBText;
    RptGrpAutLine2: TppLine;
    ppLabel26: TppLabel;
    RptGrpAutGroupFooterBand1: TppGroupFooterBand;
    dsGrpAut: TwwDataSource;
    bdeGrpAut: TppBDEPipeline;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

Uses dBaseDados;

procedure TrptGrupoAut.CrmRptCMBeforePrint(Sender: TObject);
var sNomeGrupo : String;
begin
   inherited;
   sNomeGrupo := '';
   If CmpRptCM.ParamValues[0].AsInteger <> 0 Then Begin
      sqlGrupo.Prepare;
      sqlGrupo.ParamByName('IDGRUPOAUTORIZA').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
      sqlGrupo.Open;
      sNomeGrupo := cdsGrupo.FieldByName('NOMEGRUPOAUT').AsString;
      LbGrpAut.Caption := sNomeGrupo;
   end;
   sqlGrpAut.Prepare;
   If sNomeGrupo <> '' Then
      sqlGrpAut.ParamByName( 'IDGRUPOAUTORIZA' ).AsInteger := CmpRptCM.ParamValues[ 0 ].AsInteger
   Else
      sqlGrpAut.ParamByName( 'IDGRUPOAUTORIZA' ).ClearLine;
   sqlGrpAut.Open;
end;

end.
