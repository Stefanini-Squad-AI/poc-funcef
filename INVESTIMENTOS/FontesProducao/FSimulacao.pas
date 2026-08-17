unit FSimulacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbigrd, Wwdbgrid, Grids, DBGrids, Db, Wwdatsrc, DBTables, Wwquery,
  StdCtrls, TREdit, ExtCtrls, Buttons;

type
  TfrmSimulacao = class(TForm)
    pnlPrincipal: TPanel;
    pnlCotacaoBolsa: TPanel;
    Label6: TLabel;
    pnlControleEstoque: TPanel;
    Label7: TLabel;
    pnlDemonstrativo: TPanel;
    Label8: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    Label3: TLabel;
    Panel7: TPanel;
    Label4: TLabel;
    Panel8: TPanel;
    Label5: TLabel;
    dbrValPercentual: TDBRealEdit;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    QryCotacaoAcao: TwwQuery;
    dsCotacaoAcao: TwwDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    pnlControleEstoque1: TPanel;
    DBRealEdit3: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    DBRealEdit5: TDBRealEdit;
    DBRealEdit6: TDBRealEdit;
    DBRealEdit7: TDBRealEdit;
    DBRealEdit8: TDBRealEdit;
    Label9: TLabel;
    Label10: TLabel;
    pnlControleEstoque2: TPanel;
    Label11: TLabel;
    DBRealEdit9: TDBRealEdit;
    DBRealEdit10: TDBRealEdit;
    DBRealEdit11: TDBRealEdit;
    pnlDemonstrativo1: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    DBRealEdit16: TDBRealEdit;
    DBRealEdit17: TDBRealEdit;
    pnlDemonstrativo2: TPanel;
    Label14: TLabel;
    DBRealEdit12: TDBRealEdit;
    lbFantasia1: TLabel;
    DBRealEdit13: TDBRealEdit;
    Label16: TLabel;
    DBRealEdit14: TDBRealEdit;
    DBRealEdit15: TDBRealEdit;
    Label17: TLabel;
    lbFantasia3: TLabel;
    DBRealEdit18: TDBRealEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    bbtnSair: TBitBtn;
    Panel1: TPanel;
    DBGrid3: TDBGrid;
    Label19: TLabel;
    DBRealEdit19: TDBRealEdit;
    DBRealEdit20: TDBRealEdit;
    DBRealEdit21: TDBRealEdit;
    DBRealEdit24: TDBRealEdit;
    DBRealEdit23: TDBRealEdit;
    DBRealEdit22: TDBRealEdit;
    DBRealEdit25: TDBRealEdit;
    DBRealEdit26: TDBRealEdit;
    DBRealEdit27: TDBRealEdit;
    DBRealEdit30: TDBRealEdit;
    DBRealEdit29: TDBRealEdit;
    DBRealEdit28: TDBRealEdit;
    Label20: TLabel;
    Label21: TLabel;
    lbFantasia4: TLabel;
    QryCotacaoAcaoIDEMISSOR: TFloatField;
    QryCotacaoAcaoIDBOLSAVALORES: TFloatField;
    QryCotacaoAcaoDATACOTAACAO: TDateTimeField;
    QryCotacaoAcaoIDACAO: TFloatField;
    QryCotacaoAcaoVLRABERTURA: TFloatField;
    QryCotacaoAcaoVLRFECHAMENTO: TFloatField;
    QryCotacaoAcaoVLRMAXIMA: TFloatField;
    QryCotacaoAcaoVLRMINIMA: TFloatField;
    QryCotacaoAcaoVLRMEDIA: TFloatField;
    QryCotacaoAcaoVOLNEGOCIADO: TFloatField;
    QryCotacaoAcaoQTDELOTE: TFloatField;
    Panel3: TPanel;
    Label23: TLabel;
    Panel4: TPanel;
    Label25: TLabel;
    Panel5: TPanel;
    Label24: TLabel;
    bt_Imprime: TBitBtn;
    lbFantasia: TLabel;
    lbFantasia2: TLabel;
    GroupBox1: TGroupBox;
    lbDtaOperacao: TLabel;
    GroupBox2: TGroupBox;
    lbTipoOperacao: TLabel;
    GroupBox3: TGroupBox;
    lbAcao: TLabel;
    DBRealEdit31: TDBRealEdit;
    DBRealEdit32: TDBRealEdit;
    DBRealEdit33: TDBRealEdit;
    DBRealEdit34: TDBRealEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FazerProcuraSimulacao(iIDAcao : Integer; dDate : TDateTime);  
    { Public declarations }
  end;

var
  frmSimulacao: TfrmSimulacao;

implementation

uses USistema, FCadOrdemMovimentacao;

{$R *.DFM}

procedure TfrmSimulacao.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmSimulacao.FazerProcuraSimulacao(iIDAcao : Integer; dDate : TDateTime);
begin
   QryCotacaoAcao.Close;
   QryCotacaoAcao.ParamByName('IDACAO').AsInteger        := iIDAcao;
   QryCotacaoAcao.ParamByName('DATACOTAACAO').AsDateTime := dDate;
   QryCotacaoAcao.Open;
end;

procedure TfrmSimulacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSimulacao.bbtnSairClick(Sender: TObject);
begin
   Close;
end; 

procedure TfrmSimulacao.FormShow(Sender: TObject);
begin
   lbFantasia.Caption  := Sistema.NomeFantasia;
   lbFantasia1.Caption := '% '+Trim(Sistema.NomeFantasia)+' em relação ao mercado';
   lbFantasia2.Caption := Sistema.NomeFantasia;
   lbFantasia3.Caption := '% volume da '+Trim(Sistema.NomeFantasia)+' em relação ao total negociado';
   lbFantasia4.Caption := '% '+Sistema.NomeFantasia+'/Mercado';
   lbDtaOperacao.Caption  := frmOrdemMovimentacao.dbDtaOperacao.Text;
   lbTipoOperacao.Caption := Copy(frmOrdemMovimentacao.dblOperacao.Text,1,11);
   lbAcao.Caption         := frmOrdemMovimentacao.dblAcao.Text;
end;

end.
