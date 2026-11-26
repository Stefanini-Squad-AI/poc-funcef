unit FfiltroGraficoSuplDescFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, ppBands, ppCache, TeEngine, Series, TeeProcs, Chart, ppChrtDP,
  ppPrnabl, ppCtrls, ppChrt, ppVar, dRelFolha, uAdmPrevFB, FPreview, Faguarde;

type
  TFrmFiltroGraficoSuplDescFolha = class(TFrmReports_Folha)
    spnedAnoIni: TSpinEdit;
    CbMesIni: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    qrySuplDesc: TwwQuery;
    dsSuplDesc: TwwDataSource;
    ppSuplDesc: TppBDEPipeline;
    RpSuplDesc: TppReport;
    ppDPTeeChart1: TppDPTeeChart;
    ppDBImage14: TppDBImage;
    ppDBText149: TppDBText;
    ppDBText148: TppDBText;
    ppDBText147: TppDBText;
    ppDBText146: TppDBText;
    ppDBText145: TppDBText;
    ppLine1: TppLine;
    ppLabel181: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLine3: TppLine;
    ppLabel100: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sMesRefIni, sMesRefFin, sFiltro : string;
  public
    { Public declarations }
  end;

var
  FrmFiltroGraficoSuplDescFolha: TFrmFiltroGraficoSuplDescFolha;

implementation

{$R *.DFM}

procedure TFrmFiltroGraficoSuplDescFolha.FormCreate(Sender: TObject);
begin
  inherited;
  CbMesIni.Items := CmbMes.Items;
  sMesRefIni := '';
  sMesRefFin := '';
  sFiltro := '';
end;

procedure TFrmFiltroGraficoSuplDescFolha.FormShow(Sender: TObject);
begin
  inherited;
  CbMesIni.ItemIndex := 0;
  spnedAnoIni.Text := spnedAno.Text;
end;

procedure TFrmFiltroGraficoSuplDescFolha.bbtnConfirmarClick(
  Sender: TObject);
begin
  inherited;

  frmAguarde.Mostra(' Processando as Informações do Gráfico... ');
  frmAguarde.Repaint;

  sMesRefIni := '';
  sMesRefFin := '';
  sFiltro := '';

  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;

  if (CbMesIni.Text <> '') then
  begin
    If (CbMesIni.ItemIndex+1) > 9 Then
      sMesRefIni := FloatToStr(spnedAnoIni.Value) +'/'+ intToStr(CbMesIni.ItemIndex+1)
    Else sMesRefIni := FloatToStr(spnedAnoIni.Value)+'/0'+IntToStr(CbMesIni.ItemIndex+1);
  end;

  if (CmbMes.Text <> '') then
  begin
    If (CmbMes.ItemIndex+1) > 9 Then
      sMesRefFin := FloatToStr(SpnedAno.Value) +'/'+ intToStr(cmbMes.ItemIndex+1)
    Else sMesRefFin := FloatToStr(SpnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);
  end;

  sFiltro := ' HST.MESCOBRANCA BETWEEN '+ '''' + sMesRefIni + ''''+ ' AND '''+ sMesRefFin + '''';
  qrySuplDesc.Close;
  qrySuplDesc.Sql.Text :=       ' SELECT '+#13#10+
                                '    HST.MESCOBRANCA, '+#13#10+
                                '    SUM(DECODE(PVD.FLGDESCONTO, 0, HST.VALORPROVENTO, 0, 0)) AS SUPLEMENTACAO, '+#13#10+
                                '    SUM(DECODE(PVD.FLGDESCONTO, 1, HST.VALORPROVENTO, 0, 0)) AS DESCONTO, '+#13#10+
                                '    SUM(DECODE(PVD.FLGDESCONTO, 0, HST.VALORPROVENTO, 0, 0)) - '+#13#10+
                                '    SUM(DECODE(PVD.FLGDESCONTO, 1, HST.VALORPROVENTO, 0, 0)) AS LIQUIDO '+#13#10+
                                ' FROM HISTRUBSAL HST, PROVDESC PVD '+#13#10+
                                ' WHERE HST.VALORPROVENTO > 0                AND '+#13#10+
                                '       PVD.IDPROVENTO   = HST.IDRUBRICA     AND '+#13#10+
                                '       HST.IDMODULO IN (16, 18)             AND '+#13#10+ sFiltro +#13#10+
                                ' GROUP BY HST.MESCOBRANCA '+#13#10+
                                ' ORDER BY HST.MESCOBRANCA ';

  qrySuplDesc.Open;
  frmAguarde.Apaga;
  TFrmPreview.CreateModalPreview(Application, RpSuplDesc, 'Gráfico');

end;

end.
