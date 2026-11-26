{
Alterações:
--------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 21/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------
}

unit FFiltroGraficoFolhaBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, FPreview, dRelFolha, ppDB, ppDBPipe, ppDBBDE, ppBands, ppCtrls,
  TeEngine, Series, TeeProcs, Chart, ppChrtDP, ppChrt, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, ppVar, UADMPREVFB, fAguarde;

type
  TFrmFiltroGraficoFolhaBenef = class(TFrmReports_Folha)
    Panel1: TPanel;
    dblkPlano: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dblkPatro: TwwDBLookupCombo;
    qryPLano: TwwQuery;
    qryPatro: TwwQuery;
    QrGraficoBenefFolha: TppReport;
    ppHeaderBand31: TppHeaderBand;
    ppLabel116: TppLabel;
    ppLine80: TppLine;
    ppDetailBand32: TppDetailBand;
    ppDPTeeChart2: TppDPTeeChart;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLine81: TppLine;
    ppFooterBand31: TppFooterBand;
    DsGraficoBenefFolha: TwwDataSource;
    qryGraficoBenefFolha: TwwQuery;
    ppGraficoBenefFolha: TppBDEPipeline;
    ppGraficoBenefFolhappField1: TppField;
    ppGraficoBenefFolhappField2: TppField;
    ppGraficoBenefFolhappField3: TppField;
    ppGraficoBenefFolhappField4: TppField;
    ppGraficoBenefFolhappField5: TppField;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel100: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBImage7: TppDBImage;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppLabel1GetText(Sender: TObject; var Text: String);
    procedure ppLabel2GetText(Sender: TObject; var Text: String);
    procedure ppLabel3GetText(Sender: TObject; var Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
    Legenda, LegendaPatro, LegendaPlano : string;
  end;

var
  FrmFiltroGraficoFolhaBenef: TFrmFiltroGraficoFolhaBenef;

implementation

{$R *.DFM}

procedure TFrmFiltroGraficoFolhaBenef.bbtnConfirmarClick(Sender: TObject);
var Filtro, sMesRef : string;
begin
  inherited;
  Legenda := '';
  sMesRef := '';
  Filtro := ' ';

  frmAguarde.Mostra(' Processando as Informações do Gráfico... ');
  frmAguarde.Repaint;

  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;

  if (DblkLoteOuVersao.Text <> '') and (DblkLoteOuVersao.LookupValue <> '') and (RdoTipoFiltro.ItemIndex = 0) then
  begin
    Filtro := Filtro + ' HST.idhstfolhabenef = '+ DblkLoteOuVersao.LookupValue + ' and ';
    Legenda := 'Versão da Folha: ' + DblkLoteOuVersao.Text;
  end;

  if (CmbMes.Text <> '') then
  begin
    If (cmbMes.ItemIndex+1) > 9 Then
      sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
    Else sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);

    Filtro := Filtro + ' HST.MESCOBRANCA = ''' + sMesRef +''' AND  HBF.MES = ''' + sMesRef +''' AND HST.MESCOBRANCA = HBF.MES AND ';
    Legenda := 'Mês Referência ' + sMesRef
  end;

  if (dblkPatro.Text <> '') and (dblkPatro.LookupValue <> '') then
  begin
    Filtro := Filtro + ' HBF.IdPessjur = '+ dblkPatro.LookupValue + ' AND PATRO.IDPESSOA = '+ dblkPatro.LookupValue + ' AND ';
    LegendaPatro := dblkPatro.Text;
  end;

  if (dblkPlano.Text <> '') and (dblkPlano.LookupValue <> '') then
  begin
    Filtro := Filtro + ' BPP.IDPLANOPREV = '+ dblkPlano.LookupValue + ' and ';
    LegendaPlano := dblkPlano.Text;
  end;


  qryGraficoBenefFolha.Close;
  // por patro
  if ((dblkPatro.Text <> '') and (dblkPatro.LookupValue <> '')) and ((dblkPlano.Text = '') or (dblkPlano.LookupValue = '')) then
  begin
    qryGraficoBenefFolha.sql.Text :=
         ' SELECT '+#13#10+
         ' PATRO.NOME           AS PATRO, '+#13#10+
         ' BN.NOME              AS BENEFICIO, '+#13#10+
         ' COUNT(HST.IDRUBRICA) AS QTDE, '+#13#10+
//         ' SUM(VLBENEFPGTO)     AS VALOR '+#13#10+   //Everson TIBERO
         ' SUM(HBF.VLBENEFPGTO)     AS VALOR '+#13#10+ //Everson TIBERO
         ' FROM HISTRUBSAL HST, BENEFPLANPREV BPP, BENEFICIO BN, PLANPREV PP, PESSOA PATRO, HSTBENEFBFCIARIO HBF '+#13#10+
         ' WHERE '+#13#10+ Filtro +#13#10+
         ' BPP.IDRUBRICA       = HST.IDRUBRICA       AND '+#13#10+
         ' BPP.IDBENEFICIO     = BN.IDBENEFICIO      AND '+#13#10+
         ' PP.IDPLANOPREV      = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.idhstfolhabenef = HST.idhstfolhabenef AND '+#13#10+
         ' HBF.IDTITULAR       = HST.IDTITULAR       AND '+#13#10+
         ' HBF.IDPESSOA        = HST.IDPESSOA        AND '+#13#10+
         ' HBF.IDPLANOPREV     = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.IDBENEFICIO     = BPP.IDBENEFICIO     AND '+#13#10+
         ' PATRO.IDPESSOA      = HBF.IDPESSJUR '+#13#10+
         ' GROUP BY BN.NOME, PATRO.NOME '+#13#10+
         ' ORDER BY BN.NOME ';
  end;
  // por plano
  if ((dblkPatro.Text = '') or (dblkPatro.LookupValue = '')) and ((dblkPlano.Text <> '') and (dblkPlano.LookupValue <> '')) then
  begin
    qryGraficoBenefFolha.sql.Text :=
         ' SELECT '+#13#10+
         ' PP.NOME              AS PLANO, '+#13#10+
         ' BN.NOME              AS BENEFICIO, '+#13#10+
         ' COUNT(HST.IDRUBRICA) AS QTDE, '+#13#10+
//         ' SUM(VLBENEFPGTO)     AS VALOR '+#13#10+  //Everson TIBERO
         ' SUM(HBF.VLBENEFPGTO)     AS VALOR '+#13#10+//Everson TIBERO
         ' FROM HISTRUBSAL HST, BENEFPLANPREV BPP, BENEFICIO BN, PLANPREV PP, PESSOA PATRO, HSTBENEFBFCIARIO HBF '+#13#10+
         ' WHERE '+#13#10+ Filtro +#13#10+
         ' hst.idmodulo        IN (16,18)             AND '+#13#10+
         ' BPP.IDRUBRICA       = HST.IDRUBRICA       AND '+#13#10+
         ' BPP.IDBENEFICIO     = BN.IDBENEFICIO      AND '+#13#10+
         ' PP.IDPLANOPREV      = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.idhstfolhabenef = HST.idhstfolhabenef AND '+#13#10+
         ' HBF.IDTITULAR       = HST.IDTITULAR       AND '+#13#10+
         ' HBF.IDPESSOA        = HST.IDPESSOA        AND '+#13#10+
         ' HBF.IDPLANOPREV     = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.IDBENEFICIO     = BPP.IDBENEFICIO     AND '+#13#10+
         ' PATRO.IDPESSOA      = HBF.IDPESSJUR '+#13#10+
         ' GROUP BY BN.NOME, PP.NOME '+#13#10+
         ' ORDER BY BN.NOME ';
  end;
// todos os planos e patros
  if ((dblkPatro.Text = '') or (dblkPatro.LookupValue = '')) and ((dblkPlano.Text = '') or (dblkPlano.LookupValue = '')) then
  begin
    qryGraficoBenefFolha.sql.Text :=
         ' SELECT '+#13#10+
         ' BN.NOME              AS BENEFICIO, '+#13#10+
         ' COUNT(HST.IDRUBRICA) AS QTDE, '+#13#10+
//         ' SUM(VLBENEFPGTO)     AS VALOR '+#13#10+   //Everson TIBERO
         ' SUM(HBF.VLBENEFPGTO)     AS VALOR '+#13#10+ //Everson TIBERO
         ' FROM HISTRUBSAL HST, BENEFPLANPREV BPP, BENEFICIO BN, PLANPREV PP, PESSOA PATRO, HSTBENEFBFCIARIO HBF '+#13#10+
         ' WHERE '+#13#10+ Filtro +#13#10+
         ' hst.idmodulo        IN (16,18)             AND '+#13#10+
         ' BPP.IDRUBRICA       = HST.IDRUBRICA       AND '+#13#10+
         ' BPP.IDBENEFICIO     = BN.IDBENEFICIO      AND '+#13#10+
         ' PP.IDPLANOPREV      = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.idhstfolhabenef = HST.idhstfolhabenef AND '+#13#10+
         ' HBF.IDTITULAR       = HST.IDTITULAR       AND '+#13#10+
         ' HBF.IDPESSOA        = HST.IDPESSOA        AND '+#13#10+
         ' HBF.IDPLANOPREV     = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.IDBENEFICIO     = BPP.IDBENEFICIO     AND '+#13#10+
         ' PATRO.IDPESSOA      = HBF.IDPESSJUR '+#13#10+
         ' GROUP BY BN.NOME '+#13#10+
         ' ORDER BY BN.NOME ';
  end;
  // por Plano e Patro
  if ((dblkPatro.Text <> '') and (dblkPatro.LookupValue <> '')) and ((dblkPlano.Text <> '') and (dblkPlano.LookupValue <> '')) then
  begin
    qryGraficoBenefFolha.sql.Text :=
         ' SELECT '+#13#10+
         ' PATRO.NOME || '' '' || PP.NOME || '' '' || BN.NOME AS TIPO, '+#13#10+
         ' PATRO.NOME           AS PATRO, '+#13#10+
         ' PP.NOME              AS PLANO, '+#13#10+
         ' BN.NOME              AS BENEFICIO, '+#13#10+
         ' COUNT(HST.IDRUBRICA) AS QTDE, '+#13#10+
//         ' SUM(VLBENEFPGTO)     AS VALOR '+#13#10+  //Everson TIBERO
         ' SUM(HBF.VLBENEFPGTO)     AS VALOR '+#13#10+//Everson TIBERO
         ' FROM HISTRUBSAL HST, BENEFPLANPREV BPP, BENEFICIO BN, PLANPREV PP, PESSOA PATRO, HSTBENEFBFCIARIO HBF '+#13#10+
         ' WHERE '+#13#10+ Filtro +#13#10+
         ' hst.idmodulo        IN (16,18)             AND '+#13#10+
         ' BPP.IDRUBRICA       = HST.IDRUBRICA       AND '+#13#10+
         ' BPP.IDBENEFICIO     = BN.IDBENEFICIO      AND '+#13#10+
         ' PP.IDPLANOPREV      = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.idhstfolhabenef = HST.idhstfolhabenef AND '+#13#10+
         ' HBF.IDTITULAR       = HST.IDTITULAR       AND '+#13#10+
         ' HBF.IDPESSOA        = HST.IDPESSOA        AND '+#13#10+
         ' HBF.IDPLANOPREV     = BPP.IDPLANOPREV     AND '+#13#10+
         ' HBF.IDBENEFICIO     = BPP.IDBENEFICIO     AND '+#13#10+
         ' PATRO.IDPESSOA      = HBF.IDPESSJUR '+#13#10+
         ' GROUP BY PATRO.NOME, PP.NOME, BN.NOME '+#13#10+
         ' ORDER BY BN.NOME ';
  end;

  if not qryGraficoBenefFolha.prepared then
    qryGraficoBenefFolha.Prepare;
  qryGraficoBenefFolha.Open;

  frmAguarde.Apaga;
  TFrmPreview.CreateModalPreview(Application, qrGraficoBenefFolha, 'Gráfico');
end;

procedure TFrmFiltroGraficoFolhaBenef.FormCreate(Sender: TObject);
begin
  inherited;
  Legenda := '';
  LegendaPatro := 'TODAS';
  LegendaPlano := 'TODOS';
  qryPatro.Close; qryPatro.Open;
  qryPlano.Close; qryPlano.Open;
end;

procedure TFrmFiltroGraficoFolhaBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Release;
end;

procedure TFrmFiltroGraficoFolhaBenef.ppLabel1GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := Legenda;
end;

procedure TFrmFiltroGraficoFolhaBenef.ppLabel2GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := LegendaPatro;
end;

procedure TFrmFiltroGraficoFolhaBenef.ppLabel3GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := LegendaPlano;
end;

end.
