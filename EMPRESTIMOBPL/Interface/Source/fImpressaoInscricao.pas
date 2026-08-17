//------------------------------------------------------------------------------
//Pendência   : SOL 114575 KINTANA 535771
//Responsável : Jésica Lana
//Data        : 24/04/2009
//Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  26/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
//------------------------------------------------------------------------------
unit fImpressaoInscricao;

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
   {$ENDIF}, FConfigRelatorio, FPreview, CRel, UFuncoesEmptmo;

type
   TfrmImpressaoInscricao = class(TcfgRel)
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
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

   public   // Public declarations

      sNomeRelat  : String;

   end;



var
  frmImpressaoInscricao: TfrmImpressaoInscricao;



implementation
{$R *.DFM}
uses
   uSistema;



procedure TfrmImpressaoInscricao.bbtnSairClick(Sender: TObject);
begin
   Close;
   inherited;
end;



procedure TfrmImpressaoInscricao.bbtnConfirmarClick(Sender: TObject);
var
   sNomeRelatorio,
   sNomeModelo    : String;
begin
 //Jéssica Lana SOL 114575 24/04/2009
 //sNomeRelatorio := Sistema.TempDir + 'APrevRelInscricao.tmp';
   sNomeRelatorio := ftempregra + '\' + 'APrevRelInscricao.tmp';
 //sNomeModelo    := Sistema.TempDir + 'Modelo.Tcm';
   sNomeModelo    := ftempregra + '\' + 'Modelo.Tcm';

   DsgnCM.Report.Template.SaveTo   := stFile;
   DsgnCM.Report.Template.Format   := ftASCII;
   DsgnCM.Report.Template.FileName := sNomeRelatorio;
   DsgnCM.Report.Device            := dvScreen;

   DsgnCM.Report.Template.LoadFromFile;

   dsDados.DataSet         := qryDados;
   ppDados.DataSource      := dsDados;
   RptModelo.DataPipeLine  := ppDados;
   DsgnCM.Report           := RptModelo;

   TfrmPreview.CreateModalPreview(Application, DsgnCM.Report, sNomeRelat);
   inherited;
end;



procedure TfrmImpressaoInscricao.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana SOL 109421 KINTANA 496332
        RptModelo.Template.FileName:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\Teste.Txt';
end;

end.
