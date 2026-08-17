unit FFiltroGraficoDescontos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, ppBands, ppCache, ppClass, ppDB, ppDBPipe, ppDBBDE, ppComm,
  ppRelatv, ppProd, ppReport, TeEngine, Series, TeeProcs, Chart, ppChrtDP,
  ppPrnabl, ppCtrls, ppChrt, FPreview, uAdmPrevFB, ppVar, DRelFolha, fAguarde;

type
  TFrmFiltroGraficoDescontos = class(TFrmReports_Folha)
    qryDescontosFolha: TwwQuery;
    DsDescontosFolha: TwwDataSource;
    ppDescontosFolha: TppBDEPipeline;
    qryDescontosFolhaMESCOBRANCA: TStringField;
    qryDescontosFolhaDESCONTO: TStringField;
    qryDescontosFolhaQTDE: TFloatField;
    qryDescontosFolhaVALOR: TFloatField;
    qryDescontosFolhaPERCENTO: TFloatField;
    UpdDescontosFolha: TUpdateSQL;
    RpDescontosFolha: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    LbRef: TppLabel;
    ppDPTeeChart1: TppDPTeeChart;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel100: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    ppDBImage10: TppDBImage;
    ppDBText52: TppDBText;
    ppDBText51: TppDBText;
    ppDBText50: TppDBText;
    ppDBText49: TppDBText;
    ppDBText48: TppDBText;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure LbRefGetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    sFiltro, sMesRef : string;
    soma : double;
  public
    { Public declarations }
  end;

var
  FrmFiltroGraficoDescontos: TFrmFiltroGraficoDescontos;

implementation

{$R *.DFM}

procedure TFrmFiltroGraficoDescontos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  soma := 0;
  sFiltro := '';
  sMesRef := '';

  frmAguarde.Mostra(' Processando as Informações do Gráfico... ');
  frmAguarde.Repaint;

  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;

  qryDescontosFolha.close;

  if (dblkLoteOuVersao.Text <> '') and (dblkLoteOuVersao.LookupValue <> '') then
  begin
    sFiltro := sFiltro + ' AND HST.IDHSTFOLHABENEF = ' + dblkLoteOuVersao.LookupValue + #13#10;
  end;

  if (CmbMes.Text <> '') then
  begin
    If (cmbMes.ItemIndex+1) > 9 Then
      sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
    Else sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);
    sFiltro := sFiltro + ' AND HST.MESCOBRANCA = ''' + sMesRef + '''' +#13#10;
  end;

  qryDescontosFolha.sql.Text := ' SELECT '+#13#10+
                                ' HST.MESCOBRANCA, '+#13#10+
                                ' NVL(BN.NOME, PVD.DESCRICAO) AS DESCONTO, '+#13#10+
                                ' COUNT(*) AS QTDE, '+#13#10+
                                ' SUM(DECODE(PVD.FLGDESCONTO, 1, HST.VALORPROVENTO, 0, 0)) AS VALOR, '+#13#10+
                                ' 0 AS PERCENTO '+#13#10+
                                ' FROM HISTRUBSAL HST, PROVDESC PVD, BENEFPLANPREV BPP, BENEFICIO BN '+#13#10+
                                ' WHERE HST.VALORPROVENTO > 0                AND '+#13#10+
                                '       PVD.IDPROVENTO   = HST.IDRUBRICA     AND '+#13#10+
                                '       BPP.IDRUBRICA(+) = HST.IDRUBRICA     AND '+#13#10+
                                '       BPP.IDBENEFICIO  = BN.IDBENEFICIO(+) AND '+#13#10+
                                '       HST.IDMODULO IN (16, 18)             AND '+#13#10+
                                '       PVD.FLGDESCONTO  = 1 '+#13#10+ sFiltro +
                                ' GROUP BY HST.MESCOBRANCA, BN.NOME, PVD.DESCRICAO '+#13#10+
                                ' ORDER BY VALOR DESC ';
  qryDescontosFolha.Open;
  qryDescontosFolha.First;
  while not qryDescontosFolha.Eof do
  begin
    soma := soma + qryDescontosFolhaVALOR.asFloat;
    qryDescontosFolha.Next;
  end;

  qryDescontosFolha.First;
  while not qryDescontosFolha.Eof do
  begin
    qryDescontosFolha.Edit;
    qryDescontosFolhaPERCENTO.AsFloat := (qryDescontosFolhaVALOR.asFloat * 100)/soma;
    qryDescontosFolha.Post;
    qryDescontosFolha.Next;
  end;

  frmAguarde.Apaga;
  TFrmPreview.CreateModalPreview(Application, RpDescontosFolha, 'Gráfico');
end;

procedure TFrmFiltroGraficoDescontos.LbRefGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  if (CmbMes.Text <> '') then
  begin
    Text := 'Mês Referência: '+ sMesRef;
  end
  else if (dblkLoteOuVersao.Text <> '') and (dblkLoteOuVersao.LookUpValue <> '') then
  begin
    Text := 'Histórico da Folha: '+ dblkLoteOuVersao.Text
  end;
end;

end.
