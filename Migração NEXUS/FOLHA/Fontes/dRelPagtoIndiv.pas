{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit dRelPagtoIndiv;

interface

uses
  Windows , Messages, SysUtils, Classes , Graphics, Controls, Forms   , Dialogs,
  dReports, ppCtrls , ppBands , ppPrnabl, ppClass , ppProd  , ppReport, Db     ,
  DBTables, Wwquery , Wwdatsrc, ppComm  , ppCache , ppDB    , ppDBBDE,
  ppSubRpt, ppStrtch, ppRegion, uSistema, UAdmPrevFB, ppVar, ppRelatv,
  ppDBPipe;

type
  TdtmRelPagtoIndiv = class(TdtmReports)
    qryFundacao                              : TwwQuery;
    dsFundacao                               : TwwDataSource;
    ppFundacao                               : TppBDEPipeline;
    qryPagtoIndiv: TwwQuery;
    dsPagtoIndiv: TwwDataSource;
    ppPagtoIndiv: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    plPagtoIndiv: TppBDEPipeline;
    ppPagtoIndivDBText1: TppDBText;
    ppPagtoIndivLabel1: TppLabel;
    ppPagtoIndivDBText2: TppDBText;
    ppPagtoIndivDBText3: TppDBText;
    ppPagtoIndivLine1: TppLine;
    ppPagtoIndivDBText4: TppDBText;
    ppPagtoIndivDBText5: TppDBText;
    ppPagtoIndivLabel2: TppLabel;
    ppPagtoIndivDBCalc1: TppDBCalc;
    ppPagtoIndivLabel3: TppLabel;
    ppPagtoIndivDBCalc2: TppDBCalc;
    ppPagtoIndivLine2: TppLine;
    ppPagtoIndivLine3: TppLine;
    ppPagtoIndivLabel4: TppLabel;
    ppPagtoIndivLabel5: TppLabel;
    ppPagtoIndivLine4: TppLine;
    ppPagtoIndivLine5: TppLine;
    ppPagtoIndivLabel6: TppLabel;
    ppPagtoIndivLabel7: TppLabel;
    ppPagtoIndivDBText6: TppDBText;
    ppPagtoIndivDBText7: TppDBText;
    ppPagtoIndivDBText8: TppDBText;
    ppPagtoIndivLabel8: TppLabel;
    rpCredBenefAgenLabel10: TppLabel;
    rpCredBenefAgenLine3: TppLine;
    lblAssina1: TppLabel;
    rpCredBenefAgenLine4: TppLine;
    lblAssina2: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
  function MostraParam(Form: string): boolean; override;
    procedure qryPagtoIndivAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure pAbreFundacao;
    procedure pFechaFundacao;
  public
    { Public declarations }
  end;

var dtmRelPagtoIndiv: TdtmRelPagtoIndiv;

implementation

uses fAguarde, fPRelPagtoIndiv;

{$R *.DFM}

function TdtmRelPagtoIndiv.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if UPPERCASE(Form) = 'FRMPRELPAGTOINDIV' then
    frm:=TfrmPRelPagtoIndiv.Create(Application)
  Else frm := nil;
  If frm = nil Then Result := true
  Else
   Begin
     Result:=(frm.ShowModal = mrOk);
     pFechaFundacao;
     frmAguarde.Apaga;
     frm.free;
   End;
end;

procedure TdtmRelPagtoIndiv.pAbreFundacao;
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmRelPagtoIndiv.pFechaFundacao;
begin
  inherited;
  QryFundacao.Close;
end;

procedure TdtmRelPagtoIndiv.qryPagtoIndivAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

end.

{==============================================================================|
| UNIT: DRELPAGTOINDIV                                                         |
| DESCRIÇÃO FUNCIONAL:                                                         |
| Data modulo para o relatório de Pagamentos Individuais.                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/10/2004 A 26/10/2004                         |
| PENDÊNCIA: 17997                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13p                                              |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Ajuste na consulta pois alguns pagamentos estão saindo com valores maiores.  |
| Isto ocorreu para pagamentos com documentos individuais por falta de join    |
| entre a histrubsal e hstfolhabenefcap pelo campo coddocumento.               |
|                                                                              |
|------------------------------------------------------------------------------}

