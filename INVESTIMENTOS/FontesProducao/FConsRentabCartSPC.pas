//******************************************************************************
// Data      : 30/07/2007
// Código    : AL_9
// Pendencia : 25682
// SOL       :
// Motivo    : Implementação do grafico de rentabilidade da cota
//             Implementação do gráfico paralelo do indexador
//******************************************************************************
// Data      : 02/07/2007
// Código    : AL_8
// Pendencia :
// SOL       :
// Motivo    : Implementação de ajustes de tela e código.
//******************************************************************************
// Data      : 10/04/2007
// Código    : AL_7
// Pendencia :
// SOL       :
// Desc      : Implementação na query qryNivel2 para buscar histórico do
//             cadastro de fundo por hora.
//******************************************************************************
// Data      : 03/04/2007
// Código    : AL_5
// Pendencia : 24627
// SOL       : 54776
// Desc      : Ajuste na apuração da Rentabilidade (qryNivel2). Foi retirado a
//             critica de saldo de quantidade para RV, devido não apresentar saldo
//             em deteriminados períodos. Agora traz a query traz todos
//             os investimentos independente do período e verifica o saldo
//             por dia como já é feito.
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_3
// Pendencia : 24610 / 24623
// SOL       : 54647/53827
// Desc      : Ajuste na apuração da Rentabilidade SPC(qryNivel2).
//******************************************************************************
// Data      : 26/09/2006
// Código    : AL_2
// Pendencia : 22969
// SOL       :
// Desc      : Segregação de Planp/Patrocinadora
//******************************************************************************
// Data      : 20/07/2004
// Código    : AL_1
// Motivo    : Acerto na movimedntação para não permitir clique no OK quando
//              uma das datas forem alterdas
//******************************************************************************

unit FConsRentabCartSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, ExtCtrls, ComCtrls, StdCtrls, TREdit, Spin,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CmEventosCadastro,
  ImgList, Db, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti,
  IvEMulti, Wwquery, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  faMensagem;

type
  TfrmConsRentabCartSPC = class(TfrmCadastroCS)
    Panel1: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    pnlTratamento: TPanel;
    lblIndicador: TLabel;
    dblConsMoeda: TwwDBLookupCombo;
    pnlRegra: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    dblkRegra: TwwDBLookupCombo;
    chkPassoaPasso: TCheckBox;
    dblRegraJur: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    dtDtaInicio: TCMDateTimePicker;
    dtDtaFim: TCMDateTimePicker;
    btnSeleciona: TBitBtn;
    spePercentual: TSpinEdit;
    edtJuros: TRealEdit;
    Bevel2: TBevel;
    PnlSelecao: TPanel;
    pnlPortfolio: TPanel;
    trvPortfolio: TTreeView;
    Panel9: TPanel;
    pnlTipoInvestimento: TPanel;
    trvCartSPC: TTreeView;
    Panel5: TPanel;
    pnlBotoes: TPanel;
    btnPassaUm: TToolbarButton97;
    btnVoltaUm: TToolbarButton97;
    btnPassaTodos: TToolbarButton97;
    btnVoltaTodos: TToolbarButton97;
    pnlEspacoSuperior: TPanel;
    qryRegraJur: TwwQuery;
    qryRegraJurNOMEREGRA: TStringField;
    qryRegraJurIDREGRA: TFloatField;
    qryRegra: TwwQuery;
    qryRegraNOMEREGRA: TStringField;
    qryRegraIDREGRA: TFloatField;
    qryConsMoeda: TwwQuery;
    qryConsMoedaMOEDESC: TStringField;
    qryConsMoedaCODTRATAIND: TStringField;
    qryConsMoedaMOECODIGO: TFloatField;
    qryConsMoedaMOESIGLA: TStringField;
    imgTreeView: TImageList;
    Label6: TLabel;
    qryNivel2: TwwQuery;
    qryNivel2IDTIPOINVEST: TFloatField;
    qryNivel2IDTIPOFUNDOINVEST: TFloatField;
    qryNivel2IDINVESTIMENTO: TFloatField;
    qryNivel2DESCINVESTIMENTO: TStringField;
    qryNivel2TIPOINVESTIMENTO: TStringField;
    qryNivel2DESCARTEIRASPC: TStringField;
    qryNivel2IDCARTEIRASPC: TFloatField;
    qryPlanoPatro: TwwQuery;
    lblPlanoPatro: TLabel;
    dblPlanoPatro: TwwDBLookupCombo;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    fraProg: TfraMensagem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_8
    procedure trvCartSPCMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure trvCartSPCDblClick(Sender: TObject);
    procedure trvPortfolioDblClick(Sender: TObject);
    procedure trvPortfolioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSelecionaClick(Sender: TObject);
    procedure btnPassaUmClick(Sender: TObject);
    procedure btnVoltaUmClick(Sender: TObject);
    procedure btnPassaTodosClick(Sender: TObject);
    procedure btnVoltaTodosClick(Sender: TObject);
    procedure trvPortfolioExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure trvPortfolioClick(Sender: TObject);
    procedure dtDtaFimExit(Sender: TObject);
    procedure dtDtaInicioExit(Sender: TObject);
    procedure dblPlanoPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_8
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    // AL_1
    sDataIni, sDataFim: String;
    procedure PassaNo;
    procedure PassaTreeView;
    procedure VoltaNo;
    procedure VoltaTreeView;
    procedure NoTodoMarcado(No: TTreeNode; NoPort: TTreeNode = nil);
    procedure MostraDados(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    function  EncheTreeView(sDataAnt, sDataAtu: String): Boolean;
    function  AchaNo(No: TTreeNode; Alvo: String): TTreeNode;

  public
    { Public declarations }
     bExpand : Boolean;
     iTestaExpand : Integer;
  end;

  pItem = ^TItem;
  TItem = record
     IDTipoInvest:      Integer;
     DescTipoInvest:    String;
     IDTipoFundoInvest: Integer;
     IDInvestimento:    Integer;
     DescInvestimento:  String;
     IDCarteiraSPC:    Integer;
     DescCarteiraSPC:  String;
  end;

  //AL_9
  procedure AtualizaProgTela(sMsg: String = ''; iMax: Integer = 0);

var
  frmConsRentabCartSPC: TfrmConsRentabCartSPC;

implementation

//AL_8
uses FTelaAut, UmensErro, UOperComum, UBibliotecaInvest, FConsMovRentabSPC,
  FPrincipal;

{$R *.DFM}

procedure TfrmConsRentabCartSPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //AL_9
  fraProg.Apaga;
  qryConsMoeda.Close;
  qryRegra.Close;
  qryRegraJur.Close;
  qryPlanoPatro.Close;
end;

procedure TfrmConsRentabCartSPC.FormShow(Sender: TObject);
begin
  inherited;
  //AL_9
  fraProg.Width := (TForm(Sender).Width - 345);
  fraProg.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 345)/2);
  fraProg.Apaga;

  qryConsMoeda.Open;
  qryRegra.Close;
  qryRegra.ParamByName('IDTIPOREGRA').AsInteger    := pRPI.IDTIPOREGRARENT;
  qryRegra.Open;
  qryRegraJur.Close;
  qryRegraJur.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRARENT;
  qryRegraJur.Open;
  //AL_2
  qryPlanoPatro.Open;
  if qryPlanoPatro.Locate('IDPLANPREVCTBPATR', iPlanPrevCtbPatro, []) then
  begin
     dblPlanoPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
     dblPlanoPatro.PerformSearch;
  end;
  pnlTratamento.Visible := (pRPI.IDTIPOREGRARENT = 0);
  pnlRegra.Visible      := (pRPI.IDTIPOREGRARENT <> 0);
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
  trvPortfolio.Items.Clear;
  trvCartSPC.Items.Clear;
  iTestaExpand := 0;  
  // AL_1
  sDataIni := '';
  sDataFim := '';
end;

procedure TfrmConsRentabCartSPC.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;
  //AL_8
  sbtnProcurar.Enabled := False;
  dtDtaInicio.SetFocus;
end;

procedure TfrmConsRentabCartSPC.bbtnConfirmarClick(Sender: TObject);
begin
   //AL_1
   // Força a saída do componente atual para acionar o OnExit deste componente
   //    no caso de teclar enter e o botão for default
   SelectNext(ActiveControl,True,True);

   If dtDtaInicio.Date = 0 Then
   Begin
      MsgDlg('Informe o período!','Mensagem do Sistema',mtInformation ,[mbOk],0);
      dtDtaInicio.SetFocus;
      Exit;
   End;

   If dtDtaFim.Date = 0 Then
   Begin
      MsgDlg('Informe o período.','Mensagem do Sistema',mtInformation ,[mbOk],0);
      dtDtaFim.SetFocus;
      Exit;
   End;

   if trvPortfolio.Items.Count = 0 then
   begin
      MsgDlg('Selecione o Portfólio!','Mensagem do Sistema',mtInformation ,[mbOk],0);
      Exit;
   end;

   // AL_9
   //Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
   fConsMovRentabSPC.AtualizaTela := AtualizaProgTela;

   AbrirForm(frmConsMovRentabSPC, TfrmConsMovRentabSPC, False);
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

//AL_8

procedure TfrmConsRentabCartSPC.trvCartSPCMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   MostraDados(Sender,Button,Shift,X,Y);
end;

procedure TfrmConsRentabCartSPC.trvCartSPCDblClick(Sender: TObject);
var NoDestino: TtreeNode;
begin
   inherited;
   if trvCartSPC.Selected.Level = 0 then
   begin
      if trvCartSPC.Selected.Expanded then
         trvCartSPC.Selected.Collapse(True);

      if trvCartSPC.Selected.ImageIndex in [4,5] then
      begin
         if AchaNo(trvCartSPC.Selected, 'D') <> nil then
            VoltaNo;
      end else
         PassaNo;
   end else begin
      if trvCartSPC.Selected.ImageIndex in [6,7] then
      begin
         if AchaNo(trvCartSPC.Selected, 'D') <> nil then
            VoltaNo;
      end else begin
         PassaNo;
         TTreeNode(AchaNo(trvCartSPC.Selected, 'D')).Expand(False);
      end;
   end;
   bExpand      := False;
   iTestaExpand := 0;
end;

procedure TfrmConsRentabCartSPC.trvPortfolioDblClick(Sender: TObject);
begin
  inherited;
   VoltaNo;
end;

procedure TfrmConsRentabCartSPC.trvPortfolioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   MostraDados(Sender,Button,Shift,X,Y);
end;

procedure TfrmConsRentabCartSPC.btnSelecionaClick(Sender: TObject);
begin
  inherited;
   if not ( (Vazio(dtDtaInicio.Text)) and (Vazio(dtDtaFim.Text)) ) then
      EncheTreeView(dtDtaInicio.Text,dtDtaFim.Text);
end;

procedure TfrmConsRentabCartSPC.btnPassaUmClick(Sender: TObject);
begin
  inherited;
   PassaNo;
   if trvCartSPC.Items.Count > 0 then
   begin
      if trvCartSPC.Selected.Level <> 0 then
         TTreeNode(AchaNo(trvCartSPC.Selected, 'D')).Expand(False);
   end;
   bExpand      := False;
   iTestaExpand := 0;
end;

procedure TfrmConsRentabCartSPC.btnVoltaUmClick(Sender: TObject);
begin
  inherited;
  VoltaNo;
  bExpand      := False;
  iTestaExpand := 0;
end;

procedure TfrmConsRentabCartSPC.btnPassaTodosClick(Sender: TObject);
begin
  inherited;
  PassaTreeView;
  bExpand      := False;
  iTestaExpand := 0;
end;

procedure TfrmConsRentabCartSPC.btnVoltaTodosClick(Sender: TObject);
begin
   inherited;
   VoltaTreeView;
   bExpand      := False;
   iTestaExpand := 0;
end;

function TfrmConsRentabCartSPC.EncheTreeView(sDataAnt, sDataAtu: String): Boolean;
var wItem: pItem;
    iCarteiraSPC,iTipoInvest,iTipoFundoInvest, iItem: Integer;
    sItem : String;
    nTreeNode1, nTreeNode2: TTreeNode;
begin
   Try
      OperComum.LimpaParametros(qryNivel2);
      qryNivel2.ParamByName('DATAANT').AsString := sDataAnt;
      qryNivel2.ParamByName('DATAATU').AsString := sDataAtu;
      //AL_2
      if qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
         qryNivel2.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      qryNivel2.Open;
      qryNivel2.First;

      trvPortfolio.Items.Clear;
      // Preenche o TreeView
      with trvCartSPC.Items do
      begin
         Clear;
         nTreeNode1 := nil;
         // Se houverem Investimentos inclui os Nós (Pai e Filhos)
         if not qryNivel2.Eof then
         begin

            iTipoInvest      := 0;
            iTipoFundoInvest := 0;
            iCarteiraSPC     := 0;

            while not qryNivel2.Eof do
            begin
               If iCarteiraSPC <> qryNivel2IDCARTEIRASPC.AsInteger Then
               begin
                  // Cria e Carrega o Ponteiro (Objeto) com os dados
                  New(wItem);
                  wItem.IDTipoInvest      := qryNivel2IDTIPOINVEST.AsInteger;
                  wItem.DescTipoInvest    := qryNivel2TIPOINVESTIMENTO.AsString;
                  wItem.IDTipoFundoInvest := qryNivel2IDTIPOFUNDOINVEST.AsInteger;
                  wItem.IDInvestimento    := 0;
                  wItem.IDCarteiraSPC     := qryNivel2IDCARTEIRASPC.AsInteger;
                  wItem.DescCarteiraSPC   := qryNivel2DESCARTEIRASPC.AsString;

                  // Inclui o TreNode
                  sItem      := qryNivel2DESCARTEIRASPC.AsString;
                  nTreeNode1 := AddObject(nTreeNode1,sItem,wItem);
                  nTreeNode1.ImageIndex    := 0;
                  nTreeNode1.SelectedIndex := 1;
               end;
               // Cria e Carrega o Ponteiro (Objeto) com os dados do Investimento
               New(wItem);
               wItem.IDTipoInvest      := qryNivel2IDTIPOINVEST.AsInteger;
               wItem.DescTipoInvest    := qryNivel2TIPOINVESTIMENTO.AsString;
               wItem.IDTipoFundoInvest := qryNivel2IDTIPOFUNDOINVEST.AsInteger;
               wItem.IDInvestimento    := qryNivel2IDINVESTIMENTO.AsInteger;
               wItem.DescInvestimento  := qryNivel2DESCINVESTIMENTO.AsString;
               wItem.IDCarteiraSPC     := qryNivel2IDCARTEIRASPC.AsInteger;
               wItem.DescCarteiraSPC   := qryNivel2DESCARTEIRASPC.AsString;

               // Incluir o TreeNode do Item do Investimento
               sItem := qryNivel2DESCINVESTIMENTO.AsString;
               nTreeNode2 := AddChildObject(nTreeNode1, sItem, wItem);
               nTreeNode2.ImageIndex := 2;
               nTreeNode2.SelectedIndex := 3;

               iTipoInvest      := qryNivel2IDTIPOINVEST.AsInteger;
               iTipoFundoInvest := qryNivel2IDTIPOFUNDOINVEST.AsInteger;
               iCarteiraSPC     := qryNivel2IDCARTEIRASPC.AsInteger;

               qryNivel2.Next;
            end;
         end;
      end;
      result := true;
   except
      result := false;
   end;
   // AL_1
   sDataIni := dtDtaInicio.Text;
   sDataFim := dtDtaFim.Text;
   qryNivel2.Close;
end;

procedure TfrmConsRentabCartSPC.PassaNo;
var nTreeNode0, nTreeNode1, nTreeNode2, nTreeNode3, nTreeNodeAlvo: TTreeNode;
    lInc, lIncA: Boolean;
    x: Byte;
begin
   if trvCartSPC.Selected = nil then
   begin
      if trvCartSPC.Items.Count > 0 then
         trvCartSPC.TopItem.Selected := True
      else
         Exit;
   end;

   Case trvCartSPC.Selected.Level of
   0: begin
        lInc := True;
        // Procura o Tipo de Investimento no TreeView destino
        if trvPortfolio.Items.Count > 0 then
        begin
           for x := 0 to trvPortfolio.Items.Count-1 do
           begin
              // Se já existe a Carteira, não Inclui
              if (pItem(trvPortfolio.Items[x].Data).IDCarteiraSPC =
                  pItem(trvCartSPC.Selected.Data).IDCarteiraSPC) and
                 (trvPortfolio.Items[x].Level = trvCartSPC.Selected.Level)  then
              begin
                 lInc := False;
                 nTreeNodeAlvo := trvPortfolio.Items[x];
                 Break;
              end;
           end;
        end;
        // Se não existe Inclui
        if lInc then
           nTreeNodeAlvo := trvPortfolio.Items.AddObject(nil,trvCartSPC.Selected.Text,trvCartSPC.Selected.Data);

        // Marca como selecionado
        trvCartSPC.Selected.ImageIndex := 4;
        trvCartSPC.Selected.SelectedIndex := 5;
        nTreeNodeAlvo.ImageIndex := 4;
        nTreeNodeAlvo.SelectedIndex := 5;

        // Inclui os Investimentos deste Tipo no TreeView destino
        nTreeNode0 := trvCartSPC.Selected;
        nTreeNode1 := nTreeNode0.getFirstChild;
        nTreeNode3 := nTreeNode0.GetLastChild;
        while not (nTreeNode1 = nil) do
        begin
           // Verificar se cada nó já existe no destino
           lInc := True;
           for x := 0 to trvPortfolio.Items.Count-1 do
           begin
              // Se Já Existe o Investimento, Não Inclui
              if (pItem(trvPortfolio.Items[x].Data).IDInvestimento =
                  pItem(nTreeNode1.Data).IDInvestimento) and
                 (trvPortfolio.Items[x].Level = nTreeNode1.Level) then
              begin
                 lInc := False;
                 Break;
              end;
           end;

           // Inclui se não existir
           if lInc then
           begin
              nTreeNode2 := trvPortfolio.Items.AddChildObject(nTreeNodeAlvo,nTreeNode1.Text,nTreeNode1.Data);
              nTreeNode2.ImageIndex := 2;
              nTreeNode2.SelectedIndex := 3;
              nTreeNode1.ImageIndex := 6;
              nTreeNode1.SelectedIndex := 7;
           end;

           // Se for o último filho sai do loop
           if nTreeNode1.Data = nTreeNode3.Data then
              Break;
           // Pega o próximo Nó Filho
           nTreeNode1 := nTreeNode0.GetNextChild(nTreeNode1);
        end;
      end;
   1: begin
        lInc := True;
        lIncA := True;
        nTreeNode1 := trvCartSPC.Selected;
        nTreeNode0 := trvCartSPC.Selected.Parent;
        // Verifica se o Investimento e o Tipo de Investimento já estão selecionados
        if trvPortfolio.Items.Count > 0 then
        begin
           for x := 0 to trvPortfolio.Items.Count-1 do
           begin
              if (pItem(trvPortfolio.Items[x].Data).IDInvestimento =
                  pItem(trvCartSPC.Selected.Data).IDInvestimento) and
                 (trvPortfolio.Items[x].Level = trvCartSPC.Selected.Level) then
                 lInc := False;
              if (pItem(trvPortfolio.Items[x].Data).IDCarteiraSPC =
                 pItem(nTreeNode0.Data).IDCarteiraSPC) and
                 (trvPortfolio.Items[x].Level = nTreeNode0.Level) then
              begin
                 lIncA := False;
                 nTreeNodeAlvo := trvPortfolio.Items[x];
              end;
           end;
        end;
        if lInc then
        begin
           if lIncA then begin
              // Inclui o Tipo de Investimento
              nTreeNodeAlvo := trvPortfolio.Items.AddObject(nil, nTreeNode0.Text,nTreeNode0.Data);
              nTreeNodeAlvo.ImageIndex := 0;
              nTreeNodeAlvo.SelectedIndex := 1;
              trvCartSPC.Selected.Parent.ImageIndex := 4;
              trvCartSPC.Selected.Parent.SelectedIndex := 5;
           end;
           // Inclui o Investimento
           nTreeNode1 := trvPortfolio.Items.AddChildObject(nTreeNodeAlvo,trvCartSPC.Selected.Text,trvCartSPC.Selected.Data);
           nTreeNode1.ImageIndex := 2;
           nTreeNode1.SelectedIndex := 3;
           trvCartSPC.Selected.ImageIndex := 6;
           trvCartSPC.Selected.SelectedIndex := 7;
        end;
        NoTodoMarcado(nTreeNode0,nTreeNodeAlvo);
      end;
   end;
end;

procedure TfrmConsRentabCartSPC.VoltaNo;
var nTreeNode0, nTreeNode1, nTreeNode2, nTreeNode3: TTreeNode;
    lInc, lIncA: Boolean;
    x: Byte;
begin
   if trvPortfolio.Selected = nil then
   begin
      if trvPortfolio.Items.Count > 0 then
         trvPortfolio.TopItem.Selected := True
      else
         Exit;
   end;

   Case trvPortfolio.Selected.Level of
   0: begin
        for x := 0 to trvCartSPC.Items.Count-1 do begin
           if (pItem(trvCartSPC.Items[x].Data).IDCarteiraSPC =
               pItem(trvPortfolio.Selected.Data).IDCarteiraSPC) and
              (trvCartSPC.Items[x].Level = trvPortfolio.Selected.Level) then
           begin
              trvCartSPC.Items[x].ImageIndex := 0;
              trvCartSPC.Items[x].SelectedIndex := 1;

              nTreeNode0 := trvCartSPC.Items[x];
              nTreeNode1 := nTreeNode0.GetFirstChild;
              nTreeNode3 := nTreeNode0.GetLastChild;
              while not (nTreeNode1 = nil) do
              begin
                 nTreeNode1.ImageIndex := 2;
                 nTreeNode1.SelectedIndex := 3;
                 if (pItem(nTreeNode1.Data).IDInvestimento =
                     pItem(nTreeNode3.Data).IDInvestimento) and
                    (nTreeNode1.Level = nTreeNode3.Level) then
                    Break;
                 nTreeNode1 := nTreeNode0.GetNextChild(nTreeNode1);
              end;
           end;
        end;
        if trvPortfolio.Selected.HasChildren then
           trvPortfolio.Selected.DeleteChildren;
        trvPortfolio.Selected.Delete;
      end;
   1: begin
        for x := 0 to trvCartSPC.Items.Count-1 do
        begin
           if (pItem(trvCartSPC.Items[x].Data).IDInvestimento =
               pItem(trvPortfolio.Selected.Data).IDInvestimento) and
              (trvCartSPC.Items[x].Level = trvPortfolio.Selected.Level)  then
           begin
              trvCartSPC.Items[x].ImageIndex := 2;
              trvCartSPC.Items[x].SelectedIndex := 3;
              nTreeNode0 := trvCartSPC.Items[x].Parent;
              Break;
           end;
        end;
        NoTodoMarcado(nTreeNode0,trvPortfolio.Selected.Parent);
        nTreeNode0 := trvPortfolio.Selected.Parent;
        trvPortfolio.Selected.Delete;
        if not nTreeNode0.HasChildren then
           nTreeNode0.Delete;
      end;
   end;
end;

procedure TfrmConsRentabCartSPC.NoTodoMarcado(No: TTreeNode; NoPort: TTreeNode = nil);
var nTreeNode, nTreeNodeL: TTreeNode;
    Marcado: Boolean;
    Status: Integer;
begin
    Status := 0;
    Marcado := False;
    nTreeNode := No.getFirstChild;
    nTreeNodeL := No.GetLastChild;
    while not (nTreeNode = nil) do
    begin
       if not (nTreeNode.ImageIndex in [6,7]) then
          Status := 2
       else
          Marcado := True;

       if nTreeNode.Data = nTreeNodeL.Data then
          Break;
       nTreeNode := No.GetNextChild(nTreeNode);
    end;
    if (Status = 2) and (Marcado) then
       Status := 1;

    // Retorna já o ImageIndex para o TreeNode
    case Status of
    0: begin // Todo Marcado
         No.ImageIndex := 4;
         No.SelectedIndex := 5;
         if NoPort <> nil then
         begin
            NoPort.ImageIndex := 4;
            NoPort.SelectedIndex := 5;
         end;
       end;
    1: begin // Marcado
         No.ImageIndex := 8;
         No.SelectedIndex := 9;
         if NoPort <> nil then
         begin
            NoPort.ImageIndex := 8;
            NoPort.SelectedIndex := 9;
         end;
       end;
    2: begin // Não Marcado
         No.ImageIndex := 0;
         No.SelectedIndex := 1;
         if NoPort <> nil then
         begin
            NoPort.ImageIndex := 0;
            NoPort.SelectedIndex := 1;
         end;
       end;
    end;
end;

procedure TfrmConsRentabCartSPC.PassaTreeView;
var
  nTreeNode: TTreeNode;
begin
  nTreeNode := trvCartSPC.Items.GetFirstNode;
  while nTreeNode <> nil do
  begin
    nTreeNode.Selected := True;
    PassaNo;
    nTreeNode := nTreeNode.getNextSibling;
  end;
end;

procedure TfrmConsRentabCartSPC.VoltaTreeView;
var
  nTreeNode: TTreeNode;
begin
  nTreeNode := trvPortfolio.Items.GetFirstNode;
  while nTreeNode <> nil do
  begin
    nTreeNode.Selected := True;
    VoltaNo;
    nTreeNode := trvPortfolio.Items.GetFirstNode;
  end;
end;

procedure TfrmConsRentabCartSPC.MostraDados(Sender: TObject; Button: TMouseButton;
                                            Shift: TShiftState; X, Y: Integer);
begin
  if mbRight = Button then
  begin
     if pItem(TTreeView(Sender).Selected.Data).IDInvestimento > 0 then
        ShowMessage('Tipo de Investimento: ' + pItem(TTreeView(Sender).Selected.Data).DescTipoInvest + #13 +
                    'Investimento: ' + pItem(TTreeView(Sender).Selected.Data).DescInvestimento)
     else
        ShowMessage('Tipo de Investimento: ' + pItem(TTreeView(Sender).Selected.Data).DescTipoInvest);

  end;
end;

function TfrmConsRentabCartSPC.AchaNo(No: TTreeNode; Alvo: String): TTreeNode;
var nTreeNodeP, nTreeNodeF, nTreeNodeL: TTreeNode;
begin
   Result := nil;

   if Alvo = 'O' then
      nTreeNodeP := trvCartSPC.Items.GetFirstNode
   else
      nTreeNodeP := trvPortfolio.Items.GetFirstNode;

   while nTreeNodeP <> nil do
   begin
      if No.Data = nTreeNodeP.Data then
      begin
         nTreeNodeP.Selected := True;
         Result := nTreeNodeP;
         Break;
      end else begin
         nTreeNodeF := nTreeNodeP.getFirstChild;
         nTreeNodeL := nTreeNodeP.GetLastChild;
         while not (nTreeNodeF = nil) do
         begin
            if No.Data = nTreeNodeF.Data then
            begin
               nTreeNodeF.Selected := True;
               Result := nTreeNodeF;
               Break;
            end;
            if nTreeNodeF.Data = nTreeNodeL.Data then
               Break;
            nTreeNodeF := nTreeNodeP.GetNextChild(nTreeNodeF);
         end;
      end;
      nTreeNodeP := nTreeNodeP.getNextSibling;
   end;
end;

procedure TfrmConsRentabCartSPC.trvPortfolioExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
   bExpand      := AllowExpansion;
   iTestaExpand := 1;
end;

procedure TfrmConsRentabCartSPC.trvPortfolioClick(Sender: TObject);
begin
  inherited;
  If (iTestaExpand = 1) Then
      bExpand := True
  Else
      bExpand := False;

  iTestaExpand := 0;

end;

procedure TfrmConsRentabCartSPC.dtDtaFimExit(Sender: TObject);
begin
  inherited;
  if dtDtaInicio.Date > dtDtaFim.Date Then
     dtDtaFim.Date := dtDtaInicio.Date;

  // AL_1
  if ((sDataIni <> dtDtaInicio.Text) or
      (sDataFim <> dtDtaFim.Text)) then
  begin
     VoltaTreeView;
     bExpand      := False;
     iTestaExpand := 0;
  end;

end;

procedure TfrmConsRentabCartSPC.dtDtaInicioExit(Sender: TObject);
begin
  inherited;
  // AL_1
  if ((sDataIni <> dtDtaInicio.Text) or
      (sDataFim <> dtDtaFim.Text)) then
  begin
     VoltaTreeView;
     bExpand      := False;
     iTestaExpand := 0;
  end;
end;

procedure TfrmConsRentabCartSPC.dblPlanoPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not ( (Vazio(dtDtaInicio.Text)) and (Vazio(dtDtaFim.Text)) ) then
     EncheTreeView(dtDtaInicio.Text,dtDtaFim.Text);
end;

//AL_8
procedure TfrmConsRentabCartSPC.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

// AL_9
procedure AtualizaProgTela(sMsg: String = ''; iMax: Integer = 0);
begin
   if iMax = -1 then
      frmConsRentabCartSPC.fraProg.Apaga
   else
   begin
      if sMsg <> '' then
         frmConsRentabCartSPC.fraProg.Mes := sMsg;

      if iMax > 0 then
      begin
         frmConsRentabCartSPC.fraProg.Mostra;
         frmConsRentabCartSPC.fraProg.Max := iMax;
         frmConsRentabCartSPC.fraProg.Min := 0;
         frmConsRentabCartSPC.fraProg.Pos := 0;
      end
      else
      if iMax = 0 then
         frmConsRentabCartSPC.fraProg.Incrementa;
   end;

   Application.ProcessMessages;
end;


procedure TfrmConsRentabCartSPC.FormResize(Sender: TObject);
begin
  inherited;
  //AL_9
  fraProg.Width := (TForm(Sender).Width - 345);
  fraProg.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 345)/2);
end;

end.
