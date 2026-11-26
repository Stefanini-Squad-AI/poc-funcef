{ ----------------------------------------------------------------------------------------------------
Pendência   : SOL 149616 Kintana 1081728
Responsável : Fanuel Junior
Data        : 09/05/2011
Descrição   : Incluido a impressão da lista de recebedores, para impressão da segunda via dos contracheques
----------------------------------------------------------------------------------------------------
====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
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
  dBaseDados, uSistema, fParamReports_Padrao, CmParamReport, uCtrlPadroes,
  fFrameLista;

type
  TfrmPRel2ViaCChequeMT = class(TfrmParamReports_Padrao)
    Panel1          : TPanel;
    CDSRecebedor: TCMClientDataSet;
    CDShistorico: TCMClientDataSet;
    MontaSelectBenef: TMontaSelect;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    lblhistorico: TLabel;
    cmbRecebedor: TwwDBLookupCombo;
    cklstboxHist: TCheckListBox;
    btnMarcaTodas: TBitBtn;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edMatricula: TEdit;
    edNumInscr: TEdit;
    bbtnProcurar: TBitBtn;
    edTitular: TEdit;
    frameBenef: TfrmFrameListaBenef;
    ckbIndividual: TCheckBox;
    btnCarregarHistorico: TBitBtn;
    dtMesReferenciaini: TDateTimePicker;
    dtMesReferenciafim: TDateTimePicker;
    lblDtInicial: TLabel;
    lblDtFinal: TLabel;
    procedure bbtnFecharClick(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure cmbRecebedorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(sender : TObject);
    procedure cklstboxHistClickCheck(Sender: TObject);
    procedure btnMarcaTodasClick(Sender: TObject);
    procedure ckbIndividualClick(Sender: TObject);
    procedure btnCarregarHistoricoClick(Sender: TObject);
  private
    { Private declarations }
    sIdTitular  : String;
    sIdRecebedor: string;
    Ctrl2ViaContraCheque2 : TCtrl2ViaContraCheque;
    aHstFolha : array of longint;
    function GetHstFolha : string;
    procedure MsgErro(sMsg: String);
    procedure AbreHistorico; 
  public
    { Public declarations }
    sStrPatro,
    sStrPlano,
    sMesReferencia,
    sAnoReferencia,
    sMesPagamento : string;
    bFaz, bMarcou: boolean;
    bFlgAgrupaRubrica: boolean; 
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

  if not(ckbIndividual.Checked) then begin
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
  end;



  cmp_padrao.ParamByName('pIdTitular').asstring:=sIdTitular;
  cmp_padrao.ParamByName('pRecebedor').asstring:=sIdRecebedor;
  cmp_padrao.ParamByName('pIdHastFolhaBenef').asString := GetHstFolha;

  //Fanuel Junior SOL149616 Kintana1081728
  if ckbIndividual.Checked then begin
    cmp_padrao.ParamByName('pIdListaFOlha').asInteger := frameBenef.ListaUsuario;
    cmp_padrao.ParamByName('pMesReferenciaIni').AsString :=  (FormatDateTime('yyyy/mm', dtMesReferenciaini.Date));
    cmp_padrao.ParamByName('pMesReferenciaFim').AsString :=  (FormatDateTime('yyyy/mm', dtMesReferenciaFim.Date));

  end else begin
    cmp_padrao.ParamByName('pIdListaFOlha').asInteger := -1;
    cmp_padrao.ParamByName('pMesReferenciaIni').AsString := '';
    cmp_padrao.ParamByName('pMesReferenciaFim').AsString := '';
  end;
  //Fanuel Junior SOL149616 Kintana1081728

  If bFaz Then
    EmiteContraCheque
  Else 
    ModalResult := mrNone;
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
  dtMesReferenciafim.Date := Now();
end;

procedure TfrmPRel2ViaCChequeMT.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectBenef.Executar;
  if (MontaSelectBenef.ValoresChave.Count > 0) and
     (MontaSelectBenef.ValoresChave[0] <> '') then
  begin
    //SUBSTITUI O MONTA SELECT ORIGINAL PELO MONTA SELECT EXISTENTE EM DFOLHA QUE CONTEMPLAVA MATRICULA DE DEPENDENTE
    edNumInscr.Text:=MontaSelectBenef.ValoresChave[10];
    edMatricula.Text:=MontaSelectBenef.ValoresChave[1];
    edTitular.Text:=MontaSelectBenef.ValoresChave[19];
    sIdTitular:=MontaSelectBenef.ValoresChave[5];
    sIdRecebedor:=MontaSelectBenef.ValoresChave[0];

    // ABRE COMBO RECEBEDOR.
    CdsRecebedor.Data := Ctrl2ViaContraCheque2.ListaRecebedor(StrToIntDef(sIdTitular, -1));
    cmbRecebedor.Enabled := not CdsRecebedor.IsEmpty;
    if cmbRecebedor.Enabled then
    begin
      if CdsRecebedor.Locate('IDRECEBEDOR',sidrecebedor,[]) then
      begin
        cmbRecebedor.text:=CdsRecebedor.fieldbyname('NOME').asstring;
        AbreHistorico;
      end;
    end;
  end;
end;

Procedure TfrmPRel2ViaCChequeMT.EmiteContraCheque;
Var
  sSql : String;
begin
end;

procedure TfrmPRel2ViaCChequeMT.AbreHistorico;
var
  i: Integer;
  iIdLista : integer;

begin
  iIdLista := -1;
  if ckbIndividual.Checked then
     iIdLista := frameBenef.ListaUsuario;

  //FormatDateTime('yyyy/mm', dtMesReferenciaini);
  //FormatDateTime('yyyy/mm', dtMesReferenciafim);

  cdsHistorico.Data:=
    Ctrl2ViaContraCheque2.ListaHistorico(StrToIntDef(sIdTitular, -1),
      strToIntDef(sIdRecebedor, -1), FormatDateTime('yyyy/mm', dtMesReferenciaini.Date)
      , FormatDateTime('yyyy/mm', dtMesReferenciafim.Date), iIdLista);  //Fanuel Junior SOL149616 Kintana1081728

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
end;

procedure TfrmPRel2ViaCChequeMT.cmbRecebedorCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  sIdRecebedor:=cmbRecebedor.LookupValue;
  AbreHistorico;
end;

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
  bbtnConfirmar.Enabled := false;
  frameBenef.DefineLista(0);
  TabSheet2.TabVisible := false;
  edTitular.Text       := '';
  edMatricula.Text     := '';
  edNumInscr.Text      := '';
end;

procedure TfrmPRel2ViaCChequeMT.bbtnCancelarClick(sender : TObject);
begin
  inherited;
//
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

procedure TfrmPRel2ViaCChequeMT.ckbIndividualClick(Sender: TObject);
begin
//Fanuel Junior SOL149616 Kintana1081728
  inherited;
  TabSheet2.TabVisible         :=  ckbIndividual.Checked;
  bbtnProcurar.Enabled         :=  not(ckbIndividual.Checked);
  btnCarregarHistorico.Visible :=  (ckbIndividual.Checked);
  dtMesReferenciaini.Visible   :=  (ckbIndividual.Checked);
  dtMesReferenciafim.Visible   :=  (ckbIndividual.Checked);
  lblDtInicial.Visible         :=  (ckbIndividual.Checked);
  lblDtFinal.Visible           :=  (ckbIndividual.Checked);
//Fanuel Junior SOL149616 Kintana1081728
end;

procedure TfrmPRel2ViaCChequeMT.btnCarregarHistoricoClick(Sender: TObject);
begin
  inherited;

  AbreHistorico();
  btnMarcaTodas.Click;

end;

end.

//André Tavares - 29/12/2003 - pendência 15660: criação de um checklistBox para
//                             que seja possível imprimir mais de um histórico de contra-cheque

