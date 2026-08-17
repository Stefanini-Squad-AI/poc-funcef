unit FGrafPatrimonial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, TeEngine, Series, TeeProcs, Chart, mxgraph,
  mxstore, mxDB, Db, DBTables, mxtables, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwquery, uBibliotecaInvest;

type
  TfrmGraficoPatrimonial = class(TfrmSairAjuda)
    DecisionSourcePatr: TDecisionSource;
    DecisionQueryPatr: TDecisionQuery;
    DecisionCubePatr: TDecisionCube;
    QryTotalPatr: TwwQuery;
    Panel1: TPanel;
    DecisionGraph2: TDecisionGraph;
    Series4: TBarSeries;
    Series1: TBarSeries;
    bt_Imprime: TBitBtn;
    Panel2: TPanel;
    lbTotalPatrimonial: TLabel;
    lbData: TLabel;
    lbTipoFundo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGraficoPatrimonial: TfrmGraficoPatrimonial;

implementation

uses FCadLancamentoFundo;

{$R *.DFM}

procedure TfrmGraficoPatrimonial.FormShow(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled :=True;

  QryTotalPatr.Close;

  QryTotalPatr.ParamByName('DATAMOVFUNDO').AsDateTime     :=
               frmCadLancamentoFundo.DtEdDataReferenciaGeral.DateTime;

  QryTotalPatr.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        frmCadLancamentoFundo.QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
  If frmCadLancamentoFundo.DblTipoFundo.Text = ''  Then
     QryTotalPatr.ParamByName('IDTIPOFUNDOINVEST').Clear;

  QryTotalPatr.ParamByName('IDGESTORCARTEIRA').AsInteger :=
        frmCadLancamentoFundo.qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
  If frmCadLancamentoFundo.dblGestorCarteira.Text = ''  Then
      QryTotalPatr.ParamByName('IDGESTORCARTEIRA').Clear;

  QryTotalPatr.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
  QryTotalPatr.ParamByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;

  QryTotalPatr.Open;

  DecisionQueryPatr.Close;
  DecisionQueryPatr.ParamByName('DATAMOVFUNDO').AsDateTime :=
               frmCadLancamentoFundo.DtEdDataReferenciaGeral.DateTime;

  DecisionQueryPatr.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
        frmCadLancamentoFundo.QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
  If frmCadLancamentoFundo.DblTipoFundo.Text = ''  Then
     DecisionQueryPatr.ParamByName('IDTIPOFUNDOINVEST').Clear;

  DecisionQueryPatr.ParamByName('IDGESTORCARTEIRA').AsInteger :=
        frmCadLancamentoFundo.qryGestorCart.FieldByName('IDGESTORCARTEIRA').AsInteger;
  If frmCadLancamentoFundo.dblGestorCarteira.Text = ''  Then
     DecisionQueryPatr.ParamByName('IDGESTORCARTEIRA').Clear;

  DecisionQueryPatr.ParamByName('IDPLANPREVCTBPATR').AsInteger:= iPlanPrevCtbPatro;
  DecisionQueryPatr.ParamByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;

  DecisionQueryPatr.Open;

  lbTipoFundo.Caption        := frmCadLancamentoFundo.DblTipoFundo.Text+'   '+
                          frmCadLancamentoFundo.dblGestorCarteira.Text;
  If (frmCadLancamentoFundo.DblTipoFundo.Text = '') And
     (frmCadLancamentoFundo.dblGestorCarteira.Text = '')Then
     lbTipoFundo.Visible := False
  Else
     lbTipoFundo.Visible := True;
  lbData.Caption             := frmCadLancamentoFundo.DtEdDataReferenciaGeral.Text;
  lbTotalPatrimonial.Caption := 'Patrimônio total : R$ '+
        FloatToStrF(QryTotalPatr.FieldbyName('SALDO').AsFloat,ffNumber,20,2);
end;

procedure TfrmGraficoPatrimonial.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
  DecisionGraph2.Print;
end;

procedure TfrmGraficoPatrimonial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryTotalPatr.Close;
  DecisionQueryPatr.Close;  
end;

end.

