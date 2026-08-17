
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

unit RGrupoRespon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCmSqlParams, uCMClientDataSet, Wwquery;

type
  TrptGrupoRespon = class(TFrmCmReport)
    sqlGrpRespon: TCMSqlParams;
    cdsGrpRespon: TCMClientDataSet;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    RptGrpRespon: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine8: TppLine;
    lblEmpresa: TppLabel;
    RptGrpResponLabel1: TppLabel;
    LbGrpRespon: TppLabel;
    RptGrpResponLabel2: TppLabel;
    RptGrpResponLabel3: TppLabel;
    ppDetailBand4: TppDetailBand;
    RptGrpResponDBText2: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine9: TppLine;
    lblSistema: TppLabel;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    RptGrpResponGroup1: TppGroup;
    RptGrpResponGroupHeaderBand1: TppGroupHeaderBand;
    RptGrpResponDBText1: TppDBText;
    RptGrpResponLine1: TppLine;
    RptGrpResponGroupFooterBand1: TppGroupFooterBand;
    dsGrpRespon: TwwDataSource;
    bdeGrpRespon: TppBDEPipeline;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

Uses dBaseDados;

procedure TrptGrupoRespon.CrmRptCMBeforePrint(Sender: TObject);
var sNomeGrupo : String;
begin
   inherited;
   sNomeGrupo := '';
   If CmpRptCM.ParamValues[0].AsInteger <> 0 Then Begin
      sqlGrupo.Prepare;
      sqlGrupo.ParamByName('IDGRPRESPON').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
      sqlGrupo.Open;
      sNomeGrupo := cdsGrupo.FieldByName('NOME').AsString;
      LbGrpRespon.Caption := sNomeGrupo;
   end;
   sqlGrpRespon.Prepare;
   If sNomeGrupo <> '' Then
      sqlGrpRespon.ParamByName( 'IDGRPRESPON' ).AsInteger := CmpRptCM.ParamValues[ 0 ].AsInteger
   Else
      sqlGrpRespon.ParamByName( 'IDGRPRESPON' ).ClearLine;
   sqlGrpRespon.Open;
end;

end.
