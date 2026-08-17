//******************************************************************************
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : QryCarteira
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit FConsHistCart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, Db, DBTables, Wwquery, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls;

type
  TFrmConsHistCart = class(TfrmSairAjuda)
    DsCarteira: TwwDataSource;
    QryCarteira: TwwQuery;
    QryHistorico: TwwQuery;
    DsHistorico: TwwDataSource;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryCarteiraDESCCARTINVEST: TStringField;
    RadioGroup1: TRadioGroup;
    QryPesquisaBasica: TwwQuery;
    GroupBox1: TGroupBox;
    LkcCarteira: TwwDBLookupCombo;
    QryHistoricoIDCARTEIRAINVEST: TFloatField;
    QryHistoricoDATAMOVCARTINV: TDateTimeField;
    QryHistoricoVLRMOVCARTINV: TFloatField;
    QryHistoricoCOTASMOVCARTINV: TFloatField;
    QryHistoricoSALDOVLRCARTINV: TFloatField;
    QryHistoricoSALDOCOTASCARTINV: TFloatField;
    QryHistoricoIDINVESTIMENTO: TFloatField;
    QryHistoricoIDTIPOOPERACAO: TFloatField;
    QryHistoricoHISTMOVCARTINV: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid: TwwDBGrid;
    Splitter1: TSplitter;
    QryHistoricoTIPMOVCARTINV: TStringField;
    DBGridIButton: TwwIButton;
    QryHistoricoVALORCOTACARTINV: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LkcCarteiraEnter(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsHistCart: TFrmConsHistCart;

implementation

Uses UBibliotecaInvest;

{$R *.DFM}                   

//---------------------------------------------------
// Mostra Formulario
procedure TFrmConsHistCart.FormShow(Sender: TObject);
begin
  inherited;
// Abre Tabelas
  QryCarteira.Open;
  FazQuery(QryHistorico,QryPesquisaBasica.Sql.GetText+
           'ORDER BY HC.DATAMOVCARTINV DESC, HC.IDHISTCARTINV DESC ');
//  QryHistorico.Open;
end;

//---------------------------------------------------
// Fecha Formulario
procedure TFrmConsHistCart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Abre Tabelas
  QryCarteira.Close;
  QryHistorico.Close;
end;

procedure TFrmConsHistCart.LkcCarteiraEnter(Sender: TObject);
begin
  inherited;
  LkcCarteira.Text:=QryCarteira['DESCCARTINVEST'];
end;

procedure TFrmConsHistCart.RadioGroup1Click(Sender: TObject);
Var
  wSQL:String;
begin
  inherited;
  If RadioGroup1.ItemIndex = 0 Then Begin
    wSQL:='ORDER BY HC.DATAMOVCARTINV DESC, HC.IDHISTCARTINV DESC ';
    FazQuery(QryHistorico,QryPesquisaBasica.Sql.GetText+wSQL);
  End Else Begin
    wSQL:='ORDER BY HC.DATAMOVCARTINV, HC.IDHISTCARTINV ';
    FazQuery(QryHistorico,QryPesquisaBasica.Sql.GetText+wSQL);
  End;
end;

end.
