//--------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário de Consulata de Variacoes dos Investimentos
// Form     .: FrmConsVariacaoInvest - Unit .: FConsVariacaoInvest
// Data     .: 28/06/1999
//--------------------------------------------------------------------
unit FConsVariacaoInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook;

type
  TFrmConsVariacaoInvest = class(TfrmOkCancelar)
    DsConsulta: TwwDataSource;
    QryConsulta: TwwQuery;
    QryInvestimento: TwwQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DbLkcInvestimento: TwwDBLookupCombo;
    DateEdit1: TCMDateTimePicker;
    Label2: TLabel;
    DateEdit2: TCMDateTimePicker;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    Label6: TLabel;
    Panel3: TPanel;
    QryConsultaIDINVESTIMENTO: TFloatField;
    QryConsultaDATACOTACAO: TDateTimeField;
    QryConsultaVLRCONTABIL: TFloatField;
    QryConsultaVLRGERENCIAL: TFloatField;
    QryConsultaQTDTITLOTE: TFloatField;
    Panel4: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CalculaVariacao;
    procedure DbLkcInvestimentoChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsVariacaoInvest: TFrmConsVariacaoInvest;
  PalavraResevada:String;
  PosicaoInicial:Integer;

implementation

{$R *.DFM}

Uses UMensErro;

//---------------------------------------------------------
// Abrir Formulario
procedure TFrmConsVariacaoInvest.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=TabSheet1;
  QryInvestimento.Open;
end;

//---------------------------------------------------------
// Fechar Formulario
procedure TFrmConsVariacaoInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryInvestimento.Close;
end;

//-----------------------------------------------
// Processa a Consulta
procedure TFrmConsVariacaoInvest.CalculaVariacao;
Var
  wCotaInicial:Double;
  dProcurar:TDate;
begin
  inherited;
// Testa parametros
  If (DateEdit1.Text='') Or (DateEdit2.Text='') Then Exit;

// Fecha Query de Consulta
  QryConsulta.Close;
// Preenche Parametros da Consulta
  QryConsulta.ParamByName('IDINVESTIMENTO').AsInteger:=
    QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
  QryConsulta.ParamByName('DATACOTAINI').AsString :='01/01/1900';
  QryConsulta.ParamByName('DATACOTAFIM').AsString :=DateEdit2.Text;

// Abre a Query de Consulta
  QryConsulta.Open;
  QryConsulta.DisableControls;

// Caso nao existam cotaçoes anteriores exibe erro
  If StrToDate(DateEdit1.Text) < QryConsulta.FieldByName('DATACOTACAO').AsDateTime
    Then Begin
    DateEdit1.Update;
    MsgDlg('Não existem cotações deste investimento até a Data Inicial',
           'Mensagem do Sistema',MtError,[MbOk],0);
    DateEdit1.Text:='';
    Panel1.Caption:='';
    Panel2.Caption:='';
    Panel3.Caption:='';
// Fecha a Query e Reabilita Controles
    QryConsulta.Close;
    QryConsulta.EnableControls;
    Exit;
  End;

// Busca Datas Validadas caso não exista
  If (Not QryConsulta.Locate('DATACOTACAO',DateEdit1.Text,[])) Then Begin
    dProcurar:=StrToDate(DateEdit1.Text);
// Volta na tabela até achar data valida
    While Not (QryConsulta.Locate('DATACOTACAO',dProcurar,[])) Do Begin
      dProcurar:=(dProcurar-1);
    End;
// Fecha Query de Consulta
    QryConsulta.Close;
// Preenche Parametros da Consulta
    QryConsulta.ParamByName('IDINVESTIMENTO').AsInteger:=
      QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
// Altera Query de Consulta com a Nova data
    QryConsulta.ParamByName('DATACOTAINI').AsString :=DateToStr(dProcurar);
    QryConsulta.ParamByName('DATACOTAFIM').AsString :=DateEdit2.Text;
// Reabre a Query de Consulta
    QryConsulta.Open;
  End;

  Panel1.Caption:=FormatFloat('###,###,##0.00',QryConsulta.FieldByName('VLRCONTABIL').AsFloat)+' ';
  wCotaInicial  :=QryConsulta.FieldByName('VLRCONTABIL').AsFloat;

  QryConsulta.Last;
  Panel2.Caption:=FormatFloat('###,###,##0.00',QryConsulta.FieldByName('VLRCONTABIL').AsFloat)+' ';

  If wCotaInicial <> 0 Then Begin
    Panel3.Caption:=FormatFloat('###,###,##0.00',
                    ((QryConsulta.FieldByName('VLRCONTABIL').AsFloat/wCotaInicial)-1)*100)+'%';
  End Else Begin
    Panel3.Caption:='0,00'+'%'
  End;

// Sobe na Query e Reabilita Controles
  QryConsulta.First;
  QryConsulta.EnableControls;
end;

//------------------------------------------------------------------------
// Mudanca no Combo
procedure TFrmConsVariacaoInvest.DbLkcInvestimentoChange(Sender: TObject);
begin
  inherited;
// Calcula a Variacao do Investimento
  CalculaVariacao;
end;

//-------------------------------------------------------------------
// Mudanca no TabSheet
procedure TFrmConsVariacaoInvest.PageControl1Change(Sender: TObject);
begin
  inherited;
  Panel4.Caption:=QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString;
  If (DateEdit1.Text <> '') And (DateEdit1.Text <> '') Then Begin
    Panel4.Caption:=Trim(QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString+
                    ' - DE '+DateEdit1.Text+' ATÉ '+DateEdit2.Text);
  End;
end;

end.


