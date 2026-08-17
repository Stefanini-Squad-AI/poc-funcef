
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

unit RTipoEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, uCMTypes, ppModule, daDataModule,
  FCmReport, uCmSqlParams, uCMClientDataSet, Wwquery;

type
  TrptTipoEtapa = class(TFrmCmReport)
    sqlTipoEtapa: TCMSqlParams;
    cdsTipoEtapa: TCMClientDataSet;
    sqlEtapa: TCMSqlParams;
    cdsEtapa: TCMClientDataSet;
    bdeTipoEtapa: TppBDEPipeline;
    dsTipoEtapa: TwwDataSource;
    RptTipoEtapa: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel25: TppLabel;
    ppLine12: TppLine;
    LblEmpresa: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    RptTipoEtapaLabel1: TppLabel;
    RptTipoEtapaLabel2: TppLabel;
    ppDetailBand6: TppDetailBand;
    RptTipoEtapaDBText1: TppDBText;
    RptTipoEtapaDBMemo1: TppDBMemo;
    RptTipoEtapaDBText2: TppDBText;
    RptTipoEtapaDBText3: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine13: TppLine;
    lblSistema: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

Uses dBaseDados;

procedure TrptTipoEtapa.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   sqlTipoEtapa.Prepare;
   If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
      sqlTipoEtapa.ParamByName( 'IDTIPOETAPA' ).AsInteger := CmpRptCM.ParamValues[ 0 ].AsInteger
   Else
      sqlTipoEtapa.ParamByName( 'IDTIPOETAPA' ).ClearLine;
   sqlTipoEtapa.Open;
end;

end.
