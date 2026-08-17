{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit fImpressaoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, wwQuery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus, ppEndUsr, ppCache, ppDB, ppDBBDE,ppForms,
  ppComm, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, Pptypes,
  ppDsgnCt, ppUtils, ppSubRpt, ppRuler, ppViewr, ppRegion, ppPrintr,
  ppTmplat, Printers, ppStrtch, wwdblook, CMDBLookupCombo, ppPrvDlg,
  ppRelatv, ppDBPipe, ImgList, CmEventosCadastro{$IFNDEF VER0505}, uCMTypes
  {$ENDIF}, FConfigRelatorio, FPreview, CRel;

type
  TfrmImpressaoContrato = class(TcfgRel)
    QryDados: TwwQuery;
    QryCadModelo: TwwQuery;
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
    DsgnCM: TppDesigner;
    RptModelo: TppReport;
    ppDetailBand2: TppDetailBand;
    PpDados: TppBDEPipeline;
    DsDados: TwwDataSource;
    ppLabel1: TppLabel;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idReports      : int64;
    idOrigem       : integer;
    sNomeRelat     : String;
  end;

var
  frmImpressaoContrato: TfrmImpressaoContrato;

implementation

{$R *.DFM}
uses
   uSistema;

procedure TfrmImpressaoContrato.bbtnSairClick(Sender: TObject);
begin
   Close;
  inherited;
end;

procedure TfrmImpressaoContrato.bbtnConfirmarClick(Sender: TObject);
var  sNomeRelatorio,
     sNomeModelo    : string;
begin
 // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
 // sNomeRelatorio := Sistema.TempDir + 'Relatorio.Tcm';
    sNomeRelatorio := ftempregra + '\' + 'Relatorio.Tcm';
 // sNomeModelo    := Sistema.TempDir + 'Modelo.Tcm';
    sNomeModelo    := ftempregra + '\' + 'Modelo.Tcm';

    QryDados.Open;
   With qryReports Do Begin
      If Active Then Close;
      If Not Prepared Then Prepare;
      Params[0].AsInteger := idReports;
      Params[1].AsInteger := idOrigem;
      Open;
      //Implemetar a gravação de relatório para registro alterados e gravados
      //sem layout de relatório definido
   End;


   qryReportsTEMPLATE.SaveToFile(sNomeRelatorio);

   DsgnCM.Report.Template.SaveTo   := stFile;
   DsgnCM.Report.Template.Format   := ftASCII;
   DsgnCM.Report.Template.FileName := sNomeRelatorio;
   DsgnCM.Report.Device            := dvScreen;
   DsgnCM.Report.Template.LoadFromFile;

   dsDados.DataSet         := qryDados;
   ppDados.DataSource      := dsDados;
   RptModelo.DataPipeLine  := ppDados;
   DsgnCM.Report           := RptModelo;
   
   TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, sNomeRelat);
  inherited;

end;

end.
