{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FPRel2ViaCChequeMT;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics   , Controls, Forms   ,
  MAHlpBtn  , StdCtrls, Buttons , cmRepBtn, ExtCtrls   , Db      , Dialogs ,
  DBTables   , Wwquery , checklst, Spin    , wwdblook   , TB97    , ComCtrls,
  MontaSelect, IvDictio, IvMulti , IvEMulti, FOkCancelar, Wwdatsrc, TB97Tlbr,
  dRel2ViaCChequeMT, DBClient, uCMClientDataSet, uCtrl2ViaContraCheque,
  dBaseDados, uSistema, fParamReports_Padrao, CmParamReport, uCtrlPadroes;

type
  TfrmPRel2ViaCChequeMT = class(TfrmParamReports_Padrao)
    MontaSelectBenef: TMontaSelect;
    Panel1          : TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    edMatricula: TEdit;
    Label8: TLabel;
    edNumInscr: TEdit;
    bbtnProcurar: TBitBtn;
    edTitular: TEdit;
    Label3: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    cmbRecebedor: TwwDBLookupCombo;
    lblhistorico: TLabel;
    CDSRecebedor: TCMClientDataSet;
    CDShistorico: TCMClientDataSet;
    cklstboxHist: TCheckListBox;
    btnMarcaTodas: TBitBtn;
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure cmbRecebedorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cklstboxHistClickCheck(Sender: TObject);
    procedure btnMarcaTodasClick(Sender: TObject);
  private
    { Private declarations }
    sIdTitular  : String;
    iIdRecebedor   : Integer;
    Ctrl2ViaContraCheque2 : TCtrl2ViaContraCheque;
// início - André Tavares - 29/12/2003 - pendência 15660
    aHstFolha : array of longint;
    function GetHstFolha : string;
// fim - André Tavares - 29/12/2003 - pendência 15660
    procedure MsgErro(sMsg: String);
  public
    { Public declarations }
    sStrPatro,
    sStrPlano,
    sMesReferencia,
    sAnoReferencia,
    sMesPagamento : string;
    bFaz, bMarcou: boolean;
    bFlgAgrupaRubrica: boolean; //Bruno Bastos 07/08/2002
    Procedure EmiteContraCheque;
  end;

var
  frmPRel2ViaCChequeMT: TfrmPRel2ViaCChequeMT;
implementation

uses UMensErro, fAguarde;

{$R *.DFM}

procedure TfrmPRel2ViaCChequeMT.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TfrmPRel2ViaCChequeMT.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;

  if not Padroes.GravaLogOperacoes(sistema.idEmpresa, sistema.idModulo, sistema.idUsuario,'Operação de Consulta de 2 Via de Contra-Cheque',False) then
  begin
    Raise Exception.Create( Padroes.MessageInfo);
    exit;
  end;

  bFaz := True;
  bMarcou := false;

  if cmbRecebedor.Text = '' then
  begin
    ShowMessage('Selecione um Recebedor.');
    bFaz := False;
  end;
  if edTitular.Text = '' then
  begin
    ShowMessage('Selecione um Participante.');
    bFaz := False;
   end;

   cmp_padrao.ParamByName('pIdTitular').asInteger := StrToIntDef(montaselectBenef.ValoresChave[3], -1);
   cmp_padrao.ParamByName('pRecebedor').asInteger := StrToIntDef(cmbRecebedor.LookupValue, -1);
// início - André Tavares - 29/12/2003 - pendência 15660
   cmp_padrao.ParamByName('pIdHastFolhaBenef').asString := GetHstFolha;
// fim - André Tavares - 29/12/2003 - pendência 15660
  If bFaz Then
    EmiteContraCheque
  Else ModalResult := mrNone;
end;

procedure TfrmPRel2ViaCChequeMT.FormCreate(Sender: TObject);
begin
  inherited;
  Ctrl2ViaContraCheque2 := TCtrl2ViaContraCheque.Create;
  Ctrl2ViaContraCheque2.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  edTitular.Text       := '';
  edMatricula.Text     := '';
  edNumInscr.Text      := '';
  bFlgAgrupaRubrica := Ctrl2ViaContraCheque2.AgrupaRubrica;
  bMarcou := false;
end;

procedure TfrmPRel2ViaCChequeMT.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectBenef.Executar;
  if (MontaSelectBenef.ValoresChave.Count > 0) and
     (MontaSelectBenef.ValoresChave[0] <> '') then
  begin
     edNumInscr.Text      := MontaSelectBenef.ValoresChave[0];
     edMatricula.Text     := MontaSelectBenef.ValoresChave[1];
     edTitular.Text       := MontaSelectBenef.ValoresChave[2];
     sIdTitular           := MontaSelectBenef.ValoresChave[3];

// ABRE COMBO RECEBEDOR.
     CdsRecebedor.Data := Ctrl2ViaContraCheque2.ListaRecebedor(StrToIntDef(sIdTitular, -1));
     cmbRecebedor.Enabled := not CdsRecebedor.IsEmpty;
  end;
end;

Procedure TfrmPRel2ViaCChequeMT.EmiteContraCheque;
Var
  sSql : String;
begin
end;//FIM DA FUNÇÃO

procedure TfrmPRel2ViaCChequeMT.cmbRecebedorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
  var i: Integer;
begin
  inherited;
  cdsHistorico.Data    := Ctrl2ViaContraCheque2.ListaHistorico(StrToIntDef(sIdTitular, -1), strToIntDef(cmbRecebedor.LookupValue, -1));
// início - André Tavares - 29/12/2003 - pendência 15660
  cklstboxHist.Items.Clear;
  cdsHistorico.First;
  setLength(aHstFolha, cdsHistorico.RecordCount);
  i := 0;
  while not cdsHistorico.Eof do
  begin
    aHstFolha[i] := cdsHistorico.fieldByName('IDHSTFOLHABENEF').asInteger;
    cklstboxHist.Items.Add(cdsHistorico.fieldByName('HISTORICO').asString);
    cdsHistorico.Next;
    i := i + 1;
  end;

  btnMarcaTodas.Enabled := not cdsHistorico.IsEmpty;
// fim - André Tavares - 29/12/2003 - pendência 15660
end;

// início - André Tavares - 29/12/2003 - pendência 15660
function TfrmPRel2ViaCChequeMT.GetHstFolha : string;
var i   : integer;
    shst: string;
begin
  result := '';
  shst := '';
  for i := 0 to length(aHstFolha) - 1 do
  begin
    if cklstboxHist.Checked[i] then
      shst := shst + intToStr(aHstFolha[i]) + ',';
  end;
  shst[length(shst)] := ' ';
  result := shst;
end;
// fim - André Tavares - 29/12/2003 - pendência 15660




{ tavares 13/11/2002 - migracação 3 camadas}
procedure TfrmPRel2ViaCChequeMT.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;



procedure TfrmPRel2ViaCChequeMT.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Ctrl2ViaContraCheque2.Free;
end;

procedure TfrmPRel2ViaCChequeMT.FormShow(Sender: TObject);
begin
  inherited;
// início - André Tavares - 29/12/2003 - pendência 15660
  bbtnConfirmar.Enabled := false;
// fim - André Tavares - 29/12/2003 - pendência 15660
end;

procedure TfrmPRel2ViaCChequeMT.cklstboxHistClickCheck(Sender: TObject);
var i : integer;
begin
  inherited;
  bbtnConfirmar.Enabled := false;
  for i := 0 to cklstboxHist.Items.Count - 1 do
  begin
    if cklstboxHist.Checked[i] then
      bbtnConfirmar.Enabled := true;
  end;
end;

procedure TfrmPRel2ViaCChequeMT.btnMarcaTodasClick(Sender: TObject);
var i: integer;
begin
  inherited;
  bMarcou := not bMarcou;

  for i := 0 to cklstboxHist.Items.Count - 1 do
    cklstboxHist.Checked[i] := bMarcou;
  bbtnConfirmar.Enabled := bMarcou;

end;

end.
