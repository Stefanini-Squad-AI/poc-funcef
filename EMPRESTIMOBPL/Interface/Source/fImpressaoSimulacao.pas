unit fImpressaoSimulacao;
{
--------------------------------------------------------------------------------
Pendência   : SOL 213592 Kintana 2040335
Responsável : Sadi Freire
Data        : 16/12/2013
Descrição   : Alterações Voto Empréstimo
------------------------------------------------------------------------------------
// Alteração:
// Autor(a)    :  Jéssica Lana
// Data        :  26/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: 
//------------------------------------------------------------------------------
}
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
   {$ENDIF}, FConfigRelatorio, FPreview, CRel, ppVar;

type
   TfrmImpressaoSimulacao = class(TcfgRel)
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
      ppTitleBand1: TppTitleBand;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel1: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLine1: TppLine;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppLine2: TppLine;
      QryDadosPrazo: TFloatField;
      QryDadosValorSolicitado: TFloatField;
      QryDadosJurosDias: TFloatField;
      QryDadosPrestao: TFloatField;
      QryDadosQQM: TFloatField;
      QryDadosIOF: TFloatField;
      QryDadosQuitEPAnterior: TFloatField;
      QryDadosTxdeAdm: TFloatField;
      QryDadosCPMF: TFloatField;
      QryDadosCrditoEmprstimo: TFloatField;
      ppLabel11: TppLabel;
      ppFooterBand1: TppFooterBand;
      ppSystemVariable1: TppSystemVariable;
      ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;

      procedure bbtnSairClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
    procedure ppDBText7Print(Sender: TObject);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

   public   // Public declarations

      idReports      : int64;
      idOrigem       : integer;
      sNomeRelat     : String;

   end;

var
  frmImpressaoSimulacao: TfrmImpressaoSimulacao;

implementation

{$R *.DFM}
uses
   uSistema;



procedure TfrmImpressaoSimulacao.bbtnSairClick(Sender: TObject);
begin
   Close;
   inherited;
end;



procedure TfrmImpressaoSimulacao.bbtnConfirmarClick(Sender: TObject);
var
   sNomeRelatorio,
   sNomeModelo    : string;
begin

   sNomeRelatorio := Sistema.TempDir + 'Relatorio.Tcm';
   sNomeModelo    := Sistema.TempDir + 'Modelo.Tcm';

   QryDados.Open;
   dsDados.DataSet         := qryDados;
   ppDados.DataSource      := dsDados;
   RptModelo.DataPipeLine  := ppDados;
   DsgnCM.Report           := RptModelo;

   TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, sNomeRelat);
   inherited;
end;



procedure TfrmImpressaoSimulacao.ppDBText7Print(Sender: TObject);
begin
   inherited;

   ppDBText5.DataField  := 'FQM';
   ppDBText6.DataField  := 'Encargos Tributários';
   ppDBText7.DataField  := 'Quit EP Anterior';
   ppDBText8.DataField  := 'Encargos Administrativos';
end;

procedure TfrmImpressaoSimulacao.FormCreate(Sender: TObject);
begin
  inherited;
        //Jéssica Lana SOL 109421 KINTANA 496332
        RptModelo.Template.FileName:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+' \Teste.Txt';
end;

end.






