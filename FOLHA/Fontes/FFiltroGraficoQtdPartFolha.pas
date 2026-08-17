unit FFiltroGraficoQtdPartFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FFiltroRelaQtdPartFolha, Db, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, ExtCtrls,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, FPreview, ppBands, ppVar,
  ppCtrls, ppPrnabl, ppCache, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, TeEngine,
  Series, TeeProcs, Chart, ppChrtDP, ppChrt, uAdmPrevFB, fAguarde;

type
  TFrmFiltroGraficoQtdPartFolha = class(TFrmFiltroRelaQtdPartFolha)
    ppBDERelaQtdPartFolha: TppBDEPipeline;
    ppRGraficoEstatPartFolha: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLabel103: TppLabel;
    ppLine65: TppLine;
    ppDBImage10: TppDBImage;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDetailBand27: TppDetailBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppLabel102: TppLabel;
    ppDBText47: TppDBText;
    ppDBText46: TppDBText;
    ppLabel101: TppLabel;
    ppFooterBand26: TppFooterBand;
    ppLine72: TppLine;
    ppLabel104: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    qryRelaQtdPartFolha: TwwQuery;
    qryRelaQtdPartFolhaPATRO: TStringField;
    qryRelaQtdPartFolhaPLANO: TStringField;
    qryRelaQtdPartFolhaQTD: TFloatField;
    DSRelaQtdPartFolha: TwwDataSource;
    qryVerFolha: TwwQuery;
    DSVerFolha: TwwDataSource;
    ppVerFolha: TppBDEPipeline;
    ppVerFolhappField1: TppField;
    procedure FormCreate(Sender: TObject);
    procedure cmbHistoricoChange(Sender: TObject);
    procedure dblkPatroFolhaBenefChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFiltroGraficoQtdPartFolha: TFrmFiltroGraficoQtdPartFolha;

implementation

uses dRelFolha;

{$R *.DFM}

procedure TFrmFiltroGraficoQtdPartFolha.bbtnConfirmarClick(Sender: TObject);
var sFiltroPatro, sFiltroVersaoFolha, sqlAux : string;
begin
    sqlAux := '';

    frmAguarde.Mostra(' Processando as Informações do Gráfico... ');
    frmAguarde.Repaint;

    dtmRelFolha.QryFundacao.Close;
    dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
    dtmRelFolha.QryFundacao.Open;

    sFiltroVersaoFolha := '';
    sFiltroPatro := '';
    qryRelaQtdPartFolha.Close;
    if (cmbHistorico.Text = '') and (dblkPatroFolhaBenef.text = '') then
    begin
      qryRelaQtdPartFolha.sql.Text := sqlAux;
      qryRelaQtdPartFolha.Open;
    end
    else
    begin

      if (cmbHistorico.text <> '') and (cmbHistorico.lookupValue <> '') then
        sFiltroVersaoFolha := ' AND H.IDHSTFOLHABENEF = '+CmbHistorico.LookupValue+#13#10;
      if (dblkPatroFolhaBenef.text <> '') and (dblkPatroFolhaBenef.LookUpValue <> '') then
        sFiltroPatro := ' AND H.IDPATRO = ' + dblkPatroFolhaBenef.LookupValue +#13#10;

      qryRelaQtdPartFolha.sql.Text :=  ' SELECT distinct '+#13#10+
                                           ' PT.NOME PATRO, '+#13#10+
                                           ' PL.NOME PLANO, '+#13#10+
                                           ' COUNT(distinct h.idpessoa) QTD '+#13#10+
                                        ' FROM HISTRUBSAL H, '+#13#10+
                                             ' PESSOA PT, '+#13#10+
                                             ' PLANPREV PL '+#13#10+
                                        ' WHERE PL.IDPLANOPREV = H.IDPLANOPREV AND '+#13#10+
                                              ' PT.IDPESSOA = H.IDPATRO '+#13#10+
                                                sFiltroVersaoFolha +  sFiltroPatro +
                                        ' GROUP BY PT.NOME, PL.NOME '+#13#10+
                                        ' ORDER BY PT.NOME, PL.NOME ';

      if not qryRelaQtdPartFolha.Prepared then
        qryRelaQtdPartFolha.Prepare;
      qryRelaQtdPartFolha.Open;

      qryVerFolha.close;
      qryVerFolha.ParamByName('idHstFolhaBenef').asFloat := strToFloat(CmbHistorico.LookupValue);
      qryVerFolha.Open;
   end;
  frmAguarde.Apaga;
  TFrmPreview.CreateModalPreview(Application, ppRGraficoEstatPartFolha, 'Gráfico');
end;

procedure TFrmFiltroGraficoQtdPartFolha.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := false;
end;

procedure TFrmFiltroGraficoQtdPartFolha.cmbHistoricoChange(
  Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (cmbHistorico.text <> '') and (cmbHistorico.LookupValue <> '') and
                           (dblkPatroFolhaBenef.text <> '') and (dblkPatroFolhaBenef.LookupValue <> '');
end;

procedure TFrmFiltroGraficoQtdPartFolha.dblkPatroFolhaBenefChange(
  Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (cmbHistorico.text <> '') and (cmbHistorico.LookupValue <> '') and
                           (dblkPatroFolhaBenef.text <> '') and (dblkPatroFolhaBenef.LookupValue <> '');

end;

end.
