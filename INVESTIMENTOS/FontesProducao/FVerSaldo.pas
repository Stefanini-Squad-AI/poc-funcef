//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_1
// Pendencia : 22779
// SOL       :
// Desc      : Implementação de mais de um TRC entre Planos
//******************************************************************************
unit FVerSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd,
  Wwdbgrid,URegra, wwdblook;

type
  TfrmVerSaldo = class(TfrmOkCancelarInv)
    dsHistorico: TwwDataSource;
    dsOperacoes: TwwDataSource;
    dsItensOperacao: TwwDataSource;
    dsItensCurva: TwwDataSource;
    dsItemsHistorico: TwwDataSource;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoIDMOEDACONTAB: TFloatField;
    qryInvestimentoIDEMISSOR: TFloatField;
    qryInvestimentoIDTIPOINVEST: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoFLGATIVO: TStringField;
    qryInvestimentoOBSINVESTIMENTO: TStringField;
    qryInvestimentoDESCCLASSINVEST: TStringField;
    qryInvestimentoCODISIN: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    Splitter1: TSplitter;
    Splitter3: TSplitter;
    pnlTopo: TPanel;
    pnlHistorico: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    pnlOperacoes: TPanel;
    wwDBGrid2: TwwDBGrid;
    Panel3: TPanel;
    Splitter5: TSplitter;
    pnlRodape: TPanel;
    pnlItensCurvas: TPanel;
    wwDBGrid4: TwwDBGrid;
    Panel5: TPanel;
    Splitter6: TSplitter;
    Panel6: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    dtFinal: TCMDateTimePicker;
    dblInvestimento: TwwDBLookupCombo;
    pnlMeio: TPanel;
    pnlHistItems: TPanel;
    wwDBGrid5: TwwDBGrid;
    Panel1: TPanel;
    pnlOperItens: TPanel;
    wwDBGrid3: TwwDBGrid;
    Panel4: TPanel;
    Splitter4: TSplitter;
    updHistorico: TUpdateSQL;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerSaldo: TfrmVerSaldo;
  dDataProc : TDateTime;
  iIdHistRenFix : Integer;
  fPUAcuItem,fPUItem : Double;

implementation

uses UBibliotecaInvest, dBaseDados, UMensErro, USistema, UDataBase, UDiasUteisInv, URendaFixa,
     dRendaFixa, ULancContab;


{$R *.DFM}

procedure TfrmVerSaldo.FormShow(Sender: TObject);
var
   dDataIni : TDateTime;
begin
   inherited;
   qryInvestimento.Open;
   dtFinal.Date  := pRPI.DATAULTFECHRF;

end;

procedure TfrmVerSaldo.bbtnConfirmarClick(Sender: TObject);
begin

  if Trim(dtFinal.Text) = '' then
  begin
     ShowMessage('Selecione uma Data');
     Exit;
  end;
  if Trim(dblInvestimento.Text) = '' then
     //AL_1
     RendaFixa.BuscaSaldos(dtFinal.Date, -1)
  else
     //AL_1
     RendaFixa.BuscaSaldos(dtFinal.Date, -1, StrToInt(dblInvestimento.LookupValue));

end;

procedure TfrmVerSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryInvestimento.Close;
end;

procedure TfrmVerSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmVerSaldo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  RendaFixa.BuscaSaldos(0, -1, -1)
end;

end.
