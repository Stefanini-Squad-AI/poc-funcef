//------------------------------------------------------------------
// Sistema   .: Sistema de Investimentos
// Objetivo  .: Biblioteca de Funcoes
//              Unit - UBibliotecaInvest
// Data      .: 09/12/1998
//------------------------------------------------------------------
unit FpRelEnquadramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97, StdCtrls, Buttons, ComCtrls, ExtCtrls, Spin, wwdblook, Db,
  DBTables, Wwquery, FOkCancelar, checklst;

type
  TFrmpRelEnquadramento = class(TfrmOkCancelar)
    QryTabClassif: TwwQuery;
    QryAux: TwwQuery;
    Label14: TLabel;
    DbLkcTabClassif: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    CbMes: TComboBox;
    SpinMes: TSpinEdit;
    ChBxTipoInvest: TCheckListBox;
    Label1: TLabel;
    PnlAguarde: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmpRelEnquadramento: TFrmpRelEnquadramento;

implementation

Uses  UDiasUteisInv, UBibliotecaInvest, UMensErro, FDmRelatorios;

{$R *.DFM}

procedure TFrmpRelEnquadramento.FormShow(Sender: TObject);
begin
  inherited;
  QryTabClassif.Open;
end;

procedure TFrmpRelEnquadramento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryTabClassif.Close;
end;


procedure TFrmpRelEnquadramento.bbtnConfirmarClick(Sender: TObject);
Var
  wTabela, wStrData, wStrTipoInvest:String;
  wData:TDateTime;

begin
  If (DbLkcTabClassif.Text = '') Or (CbMes.Text = '') Or
     (SpinMes.Text = '') Then Begin
    MsgDlg('Faltam preencher parâmetros ','Erro',mtError,[mbOK],0);
    DbLkcTabClassif.SetFocus;
    Exit;
  End;

  inherited;
// Monta Filtro
  If ChBxTipoInvest.Checked[0] Then
    wStrTipoInvest := '2,';
  If ChBxTipoInvest.Checked[1] Then
    wStrTipoInvest := wStrTipoInvest+ '1,';
  If ChBxTipoInvest.Checked[2] Then
    wStrTipoInvest := wStrTipoInvest+ '3,';
  If ChBxTipoInvest.Checked[3] Then
    wStrTipoInvest := wStrTipoInvest+ '4,';
  wStrTipoInvest := Copy(wStrTipoInvest,1,Length(wStrTipoInvest)-1);

// Guarda a Tabela de Classificacao
  wTabela:=QryTabClassif.FieldByName('CODTABCLASSINV').AsString;

// Gera Data a Processar e Mostra
  wData:=DiasUteisInv.UltDiaMes(StrToint(SpinMes.Text),(CbMes.ItemIndex+1));
  PnlAguarde.Visible :=True;
  PnlAguarde.Caption := 'Aguarde, Processando mês de '+CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];
  PnlAguarde.Update;

// Apaga e Gera Arquivo Temporario de enquadramentos na Data Escolhida
  EnquadraInvestimento(wData, wTabela, wStrTipoInvest, True, True);
  DmRelatorios.LbTitMes3.Caption := CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];
  DmRelatorios.LbTitMes23.Caption:= CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];

// Atualiza Arquivo Temporario de enquadramentos na Data UM mes atraz da Escolhida
  wData:=MudaMes(wData,-1);
  PnlAguarde.Caption := 'Aguarde, Processando mês de '+CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];
  PnlAguarde.Update;
  EnquadraInvestimento(wData, wTabela, wStrTipoInvest, False, True);
  DmRelatorios.LbTitMes2.Caption:= CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];
  DmRelatorios.LbTitMes22.Caption:= CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];

// Atualiza Arquivo Temporario de enquadramentos na Data DOIS mes atraz da Escolhida
  wData:=MudaMes(wData,-1);
  PnlAguarde.Caption := 'Aguarde, Processando mês de '+CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];
  PnlAguarde.Update;
  EnquadraInvestimento(wData, wTabela, wStrTipoInvest, False, True);
  DmRelatorios.LbTitMes1.Caption:= CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];
  DmRelatorios.LbTitMes21.Caption:= CbMes.Items[DiasUteisInv.ExtraiMes(wData)-1];

// Gera a primeira Data
  wStrData:=DateToStr(DiasUteisInv.UltDiaMes(StrToint(SpinMes.Text),(CbMes.ItemIndex+1)));

  PnlAguarde.Caption := 'Aguarde, Gerando Resultado';
  PnlAguarde.Update;
// Busca o Total dos  Recursos Garantidoes no 3 Mes Para fazer o Calculo dos Percetuais
  wData:=DiasUteisInv.UltDiaMes(StrToint(SpinMes.Text),(CbMes.ItemIndex+1));
  DmRelatorios.wTotSalEnquadramento:= 0;
  DmRelatorios.wTotQtdEnquadramento:= 0;
  DmRelatorios.LbDescRecursos.Text := 'Recursos Garantidores em '+CbMes.Text;
  DmRelatorios.LbVlrRecGarantidores.Text := '0.00';
  If FazQuery(QryAux,
    'SELECT  DAD.EMPRESAPROP, DAD.MES, DAD.VLRRECURGARAN     '+
    'FROM DADOSMESPROP DAD                                '+
    'WHERE DAD.MES = TO_CHAR(TO_DATE('+QuotedStr(DateToStr(wData))+
                     ',''DD/MM/YYYY''),''MMYYYY'') ') Then Begin

// Guarda Somatorio dos Saldos
    DmRelatorios.wTotSalEnquadramento:= QryAux.FieldByName('VLRRECURGARAN').AsFloat;
    DmRelatorios.LbVlrRecGarantidores.Text := FloatToStrF(QryAux.FieldByName('VLRRECURGARAN').AsFloat,
                                                          FFNumber, 18,2);
  End;
  FazQuery(DmRelatorios.QryEnquadramento,
    'SELECT  HCC.IDINVESTIMENTO, HCC.CODTABCLASSINV,   HCC.CODCLASSINVEST, HCC.DATAREFERENCIA,   '+
    '        HCC.IDCARTEIRAINVEST, HCC.SALDOCLASSCART, HCC.SALDOQTDCLASSCART,                    '+
    '      	DECODE(TCI.DESCTABCLASSINV, NULL, ''INVESTIMENTOS NÃO CLASSIFICADOS '', TCI.DESCTABCLASSINV) AS DESCTABCLASSINV, '+
    '        DECODE(CLI.DESCCLASSINVEST, NULL, ''INVESTIMENTOS NÃO CLASSIFICADOS '', CLI.DESCCLASSINVEST) AS DESCCLASSINVEST, '+
    '        INV.DESCINVESTIMENTO '+
    'FROM HISTCLASSCART HCC, TABCLASSIFINVEST TCI , CLASSIFINVEST CLI, INVESTIMENTO INV '+
    'WHERE HCC.CODTABCLASSINV = TCI.CODTABCLASSINV(+)  AND '+
    '      HCC.CODTABCLASSINV = CLI.CODTABCLASSINV(+)  AND '+
    '      HCC.CODCLASSINVEST = CLI.CODCLASSINVEST(+)  AND '+
    '      HCC.IDINVESTIMENTO = INV.IDINVESTIMENTO(+)      '+
    'ORDER BY HCC.CODTABCLASSINV,   HCC.CODCLASSINVEST,    '+
    '         INV.DESCINVESTIMENTO, HCC.IDCARTEIRAINVEST, '+
    '         HCC.DATAREFERENCIA DESC');

  PnlAguarde.Visible :=False;
end;

end.

