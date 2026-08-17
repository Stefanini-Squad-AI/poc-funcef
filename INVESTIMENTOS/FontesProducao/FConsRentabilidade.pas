//******************************************************************************
// Data      : 30/07/2007
// Código    : AL_6
// Pendencia : 25682
// SOL       :
// Motivo    : Implementação do grafico de rentabilidade da cota
//             Implementação do gráfico paralelo do indexador
//******************************************************************************
// Data      : 02/07/2007
// Código    : AL_5
// Pendencia :
// SOL       :
// Motivo    : Implementação de ajustes de tela e código.
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_4
// Pendencia : 24610 / 24623
// SOL       : 54647 / 53827
// Desc      : Ajuste na apuração da Rentabilidade (qryNivel2).
//******************************************************************************
// Data     : 26/09/2006
// Código   : AL_3
// Pendencia: 22968
// SOL      :
// Desc     : Segregação de Planp/Patrocinadora
//******************************************************************************
// Data     : 22/02/2006
// Código   : AL_2
// Motivo   : Minimizar o form durante execução
//******************************************************************************
// Data     : 20/07/2004
// Código   : AL_1
// Motivo   : Acerto na movimedntação para não permitir clique no OK quando
//              uma das datas forem alterdas
//******************************************************************************
// Data	    : 19/04/2004
// Função   : Ajuste na seleção dos itens do TreeView
//********************************************************************************************************
//Data      : 19/04/2004
//Função    : Foi retirado o parametro de afeta rentabilidade, pois ainda nao foi criado o script
//********************************************************************************************************
//Data	 	 :      19/04/2004
//Função	 :      qryNivel2 : Passa nos parametros de busca de RV
//********************************************************************************************************
//Data	 	 :      08/04/2004
//Função	 :      qryNivel2 : Passa a filtrar o IDFUNDOINVEST pela HISTFUNDOINVEST
//*******************************************************************************
unit FConsRentabilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, CMTree, Spin, wwdblook, faMensagem;

type
  TfrmConsRentabilidade = class(TfrmCadastroCS)
    PnlSelecao: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    dtDtaInicio: TCMDateTimePicker;
    dtDtaFim: TCMDateTimePicker;
    pnlPortfolio: TPanel;
    Panel9: TPanel;
    pnlTipoInvestimento: TPanel;
    Label2: TLabel;
    spePercentual: TSpinEdit;
    qryConsMoeda: TwwQuery;
    qryConsMoedaMOEDESC: TStringField;
    qryConsMoedaCODTRATAIND: TStringField;
    qryConsMoedaMOECODIGO: TFloatField;
    qryConsMoedaMOESIGLA: TStringField;
    Panel5: TPanel;
    qryNivel2: TwwQuery;
    trvInvestimentos: TTreeView;
    qryNivel2IDTIPOINVEST: TFloatField;
    qryNivel2IDTIPOFUNDOINVEST: TFloatField;
    qryNivel2IDINVESTIMENTO: TFloatField;
    qryNivel2DESCINVESTIMENTO: TStringField;
    imgTreeView: TImageList;
    trvPortfolio: TTreeView;
    btnSeleciona: TBitBtn;
    Label5: TLabel;
    edtJuros: TRealEdit;
    pnlTratamento: TPanel;
    lblIndicador: TLabel;
    dblConsMoeda: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    qryRegraNOMEREGRA: TStringField;
    qryRegraIDREGRA: TFloatField;
    pnlBotoes: TPanel;
    pnlEspacoSuperior: TPanel;
    btnPassaUm: TToolbarButton97;
    btnVoltaUm: TToolbarButton97;
    btnPassaTodos: TToolbarButton97;
    btnVoltaTodos: TToolbarButton97;
    pnlRegra: TPanel;
    Label4: TLabel;
    dblkRegra: TwwDBLookupCombo;
    chkPassoaPasso: TCheckBox;
    qryRegraJur: TwwQuery;
    qryRegraJurIDREGRA: TFloatField;
    qryRegraJurNOMEREGRA: TStringField;
    dblRegraJur: TwwDBLookupCombo;
    Label8: TLabel;
    qryNivel2TIPOINVESTIMENTO: TStringField;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    lblPlanoPatro: TLabel;
    dblPlanoPatro: TwwDBLookupCombo;
    fraProg: TfraMensagem;
    procedure btnPassaUmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnVoltaUmClick(Sender: TObject);
    procedure btnPassaTodosClick(Sender: TObject);
    procedure btnVoltaTodosClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    //AL_5
    procedure trvInvestimentosMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure trvInvestimentosDblClick(Sender: TObject);
    procedure trvPortfolioDblClick(Sender: TObject);
    procedure trvPortfolioMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSelecionaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtDtaFimExit(Sender: TObject);
    procedure dtDtaInicioExit(Sender: TObject);
    procedure dblPlanoPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    //AL_5
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    // AL_1 - 20/07/2004
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
  end;

  pItem = ^TItem;
  TItem = record
     IDTipoInvest:      Integer;
     DescTipoInvest:    String;
     IDTipoFundoInvest: Integer;
     IDInvestimento:    Integer;
     DescInvestimento:  String;
     // Acrescentar aqui qualquer outro tipo de informação necessária
  end;

  //AL_6
  procedure AtualizaProgTela(sMsg: String = ''; iMax: Integer = 0);

var
  frmConsRentabilidade: TfrmConsRentabilidade;

implementation

//AL_5
uses FConsMovRentabilidade, FTelaAut, UmensErro, UOperComum, UBibliotecaInvest,
  FPrincipal;

{$R *.DFM}

procedure TfrmConsRentabilidade.btnPassaUmClick(Sender: TObject);
begin
   inherited;
   PassaNo;
   if trvInvestimentos.Items.Count > 0 then
   begin
      if trvInvestimentos.Selected.Level <> 0 then
         TTreeNode(AchaNo(trvInvestimentos.Selected, 'D')).Expand(False);
   end;
end;

procedure TfrmConsRentabilidade.FormShow(Sender: TObject);
begin
  inherited;
  //AL_6
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
  //AL_3
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
  trvInvestimentos.Items.Clear;
  // AL_1 - 20/07/2004
  sDataIni := '';
  sDataFim := '';
end;

procedure TfrmConsRentabilidade.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled     := True;
  //AL_5
  sbtnProcurar.Enabled := False;
  dtDtaInicio.SetFocus;
end;

procedure TfrmConsRentabilidade.btnVoltaUmClick(Sender: TObject);
begin
  inherited;
  VoltaNo;
end;

procedure TfrmConsRentabilidade.btnPassaTodosClick(Sender: TObject);
begin
  inherited;
  PassaTreeView;
end;

procedure TfrmConsRentabilidade.btnVoltaTodosClick(Sender: TObject);
begin
  inherited;
  VoltaTreeView;
end;

procedure TfrmConsRentabilidade.bbtnConfirmarClick(Sender: TObject);
begin
   //AL_5
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

//   inherited;

   // AL_6 - Assinala a rotina AtualizaProg ao evento AtualizaProcFech da unit RendaFixa
   fConsMovRentabilidade.AtualizaTela := AtualizaProgTela;

   AbrirForm(frmConsMovRentabilidade, TfrmConsMovRentabilidade, False);
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;

//AL_5
function TfrmConsRentabilidade.EncheTreeView(sDataAnt, sDataAtu: String): Boolean;
var wItem: pItem;
    iTipoInvest, iTipoFundoInvest, iItem: Integer;
    sItem : String;
    nTreeNode1, nTreeNode2: TTreeNode;

begin
   Try
      trvPortfolio.Items.Clear;
      // Preenche o TreeView
      with trvInvestimentos.Items do
      begin
         Clear;
         nTreeNode1 := nil;
         OperComum.LimpaParametros(qryNivel2);
         qryNivel2.ParamByName('DATAANT').AsString := sDataAnt;
         qryNivel2.ParamByName('DATAATU').AsString := sDataAtu;
         //AL_3
         if qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger > 0 then
            qryNivel2.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger;
         qryNivel2.Prepare;
         qryNivel2.Open;
         qryNivel2.First;

         // Se houverem Investimentos inclui os Nós (Pai e Filhos)
         if not qryNivel2.Eof then
         begin

            iTipoInvest      := 0;
            iTipoFundoInvest := 0;

            while not qryNivel2.Eof do
            begin
               If (iTipoInvest <> qryNivel2IDTIPOINVEST.AsInteger) Or
                  (iTipoFundoInvest <> qryNivel2IDTIPOFUNDOINVEST.AsInteger) Then
               begin
                  // Cria e Carrega o Ponteiro (Objeto) com os dados do Tipo de Investimento
                  New(wItem);
                  wItem.IDTipoInvest := qryNivel2IDTIPOINVEST.AsInteger;
                  wItem.DescTipoInvest := qryNivel2TIPOINVESTIMENTO.AsString;
                  wItem.IDTipoFundoInvest := qryNivel2IDTIPOFUNDOINVEST.AsInteger;
                  wItem.IDInvestimento := 0;

                  // Inclui o TreNode do Tipo do Investimento
                  sItem := qryNivel2TIPOINVESTIMENTO.AsString;
                  nTreeNode1 := AddObject(nTreeNode1,sItem,wItem);
                  nTreeNode1.ImageIndex := 0;
                  nTreeNode1.SelectedIndex := 1;
               end;
               // Cria e Carrega o Ponteiro (Objeto) com os dados do Investimento
               New(wItem);
               wItem.IDTipoInvest := qryNivel2IDTIPOINVEST.AsInteger;
               wItem.DescTipoInvest := qryNivel2TIPOINVESTIMENTO.AsString;
               wItem.IDTipoFundoInvest := qryNivel2IDTIPOFUNDOINVEST.AsInteger;
               wItem.IDInvestimento := qryNivel2IDINVESTIMENTO.AsInteger;
               wItem.DescInvestimento := qryNivel2DESCINVESTIMENTO.AsString;

               // Incluir o TreeNode do Item do Investimento
               sItem := qryNivel2DESCINVESTIMENTO.AsString;
               nTreeNode2 := AddChildObject(nTreeNode1, sItem, wItem);
               nTreeNode2.ImageIndex := 2;
               nTreeNode2.SelectedIndex := 3;

               iTipoInvest      := qryNivel2IDTIPOINVEST.AsInteger;
               iTipoFundoInvest := qryNivel2IDTIPOFUNDOINVEST.AsInteger;

               qryNivel2.Next;
            end;
         end;
      end;
      result := true;
   except
      result := false;
   end;
   // AL_1 - 20/07/2004
   sDataIni := dtDtaInicio.Text;
   sDataFim := dtDtaFim.Text;
   qryNivel2.Close;
end;

procedure TfrmConsRentabilidade.trvInvestimentosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   MostraDados(Sender,Button,Shift,X,Y);
end;

procedure TfrmConsRentabilidade.PassaNo;
var nTreeNode0, nTreeNode1, nTreeNode2, nTreeNode3, nTreeNodeAlvo: TTreeNode;
    lInc, lIncA: Boolean;
    x: Byte;
begin
   if trvInvestimentos.Selected = nil then
   begin
      if trvInvestimentos.Items.Count > 0 then
         trvInvestimentos.TopItem.Selected := True
      else
         Exit;
   end;

   Case trvInvestimentos.Selected.Level of
   0: begin
        lInc := True;
        // Procura o Tipo de Investimento no TreeView destino
        if trvPortfolio.Items.Count > 0 then
        begin
           for x := 0 to trvPortfolio.Items.Count-1 do begin
              if (trvPortfolio.Items[x].Data = trvInvestimentos.Selected.Data) and
                 (trvPortfolio.Items[x].Level = trvInvestimentos.Selected.Level)  then
              begin
                 lInc := False;
                 nTreeNodeAlvo := trvPortfolio.Items[x];
              end;
           end;
        end;
        // Se não existe Inclui
        if lInc then
           nTreeNodeAlvo := trvPortfolio.Items.AddObject(nil,trvInvestimentos.Selected.Text,trvInvestimentos.Selected.Data);

        // Marca como selecionado
        trvInvestimentos.Selected.ImageIndex := 4;
        trvInvestimentos.Selected.SelectedIndex := 5;
        nTreeNodeAlvo.ImageIndex := 4;
        nTreeNodeAlvo.SelectedIndex := 5;

        // Inclui os Investimentos deste Tipo no TreeView destino
        nTreeNode0 := trvInvestimentos.Selected;
        nTreeNode1 := nTreeNode0.getFirstChild;
        nTreeNode3 := nTreeNode0.GetLastChild;
        while not (nTreeNode1 = nil) do
        begin
           // Verificar se cada nó já existe no destino
           lInc := True;
           for x := 0 to trvPortfolio.Items.Count-1 do
           begin
              // Se já existe a Carteira, não Inclui
              if (trvPortfolio.Items[x].Data = nTreeNode1.Data) and
                 (trvPortfolio.Items[x].Level = nTreeNode1.Level)then
                 lInc := False;
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
           if nTreeNode1.Text = nTreeNode3.Text then
              Break;
           // Pega o próximo Nó Filho
           nTreeNode1 := nTreeNode0.GetNextChild(nTreeNode1);
        end;
      end;
   1: begin
        lInc := True;
        lIncA := True;
        nTreeNode1 := trvInvestimentos.Selected;
        nTreeNode0 := trvInvestimentos.Selected.Parent;
        // Verifica se o Investimento e o Tipo de Investimento já estão selecionados
        if trvPortfolio.Items.Count > 0 then
        begin
           for x := 0 to trvPortfolio.Items.Count-1 do begin
              if (trvPortfolio.Items[x].Data = trvInvestimentos.Selected.Data) and
                 (trvPortfolio.Items[x].Level = trvInvestimentos.Selected.Level) then
                 lInc := False;
              if trvPortfolio.Items[x].Text = nTreeNode0.Text then
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
              trvInvestimentos.Selected.Parent.ImageIndex := 4;
              trvInvestimentos.Selected.Parent.SelectedIndex := 5;
           end;
           // Inclui o Investimento
           nTreeNode1 := trvPortfolio.Items.AddChildObject(nTreeNodeAlvo,trvInvestimentos.Selected.Text,trvInvestimentos.Selected.Data);
           nTreeNode1.ImageIndex := 2;
           nTreeNode1.SelectedIndex := 3;
           trvInvestimentos.Selected.ImageIndex := 6;
           trvInvestimentos.Selected.SelectedIndex := 7;
        end;
        NoTodoMarcado(nTreeNode0,nTreeNodeAlvo);
      end;
   end;
end;

procedure TfrmConsRentabilidade.VoltaNo;
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
        for x := 0 to trvInvestimentos.Items.Count-1 do begin
           if (trvInvestimentos.Items[x].Data = trvPortfolio.Selected.Data) and
              (trvInvestimentos.Items[x].Level = trvPortfolio.Selected.Level) then
           begin
              trvInvestimentos.Items[x].ImageIndex := 0;
              trvInvestimentos.Items[x].SelectedIndex := 1;

              nTreeNode0 := trvInvestimentos.Items[x];
              nTreeNode1 := nTreeNode0.GetFirstChild;
              nTreeNode3 := nTreeNode0.GetLastChild;
              while not (nTreeNode1 = nil) do
              begin
                 nTreeNode1.ImageIndex := 2;
                 nTreeNode1.SelectedIndex := 3;
                 if (nTreeNode1.Data = nTreeNode3.Data) and
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
        for x := 0 to trvInvestimentos.Items.Count-1 do begin
           if (trvInvestimentos.Items[x].Data = trvPortfolio.Selected.Data) and
              (trvInvestimentos.Items[x].Level = trvPortfolio.Selected.Level)then
           begin
              trvInvestimentos.Items[x].ImageIndex := 2;
              trvInvestimentos.Items[x].SelectedIndex := 3;
              nTreeNode0 := trvInvestimentos.Items[x].Parent;
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

procedure TfrmConsRentabilidade.NoTodoMarcado(No: TTreeNode; NoPort: TTreeNode = nil);
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

procedure TfrmConsRentabilidade.trvInvestimentosDblClick(Sender: TObject);
var NoDestino: TtreeNode;
begin
   inherited;
   if trvInvestimentos.Selected.Level = 0 then
   begin
      if trvInvestimentos.Selected.Expanded then
         trvInvestimentos.Selected.Collapse(True);

      if trvInvestimentos.Selected.ImageIndex in [4,5] then
      begin
         if AchaNo(trvInvestimentos.Selected, 'D') <> nil then
            VoltaNo;
      end else
         PassaNo;
   end else begin
      if trvInvestimentos.Selected.ImageIndex in [6,7] then
      begin
         if AchaNo(trvInvestimentos.Selected, 'D') <> nil then
            VoltaNo;
      end else begin
         PassaNo;
         TTreeNode(AchaNo(trvInvestimentos.Selected, 'D')).Expand(False);
      end;

   end;
end;

procedure TfrmConsRentabilidade.trvPortfolioDblClick(Sender: TObject);
begin
   inherited;
   VoltaNo;
end;

procedure TfrmConsRentabilidade.PassaTreeView;
var
  nTreeNode: TTreeNode;
begin
  nTreeNode := trvInvestimentos.Items.GetFirstNode;
  while nTreeNode <> nil do
  begin
    nTreeNode.Selected := True;
    PassaNo;
    nTreeNode := nTreeNode.getNextSibling;
  end;
end;

procedure TfrmConsRentabilidade.VoltaTreeView;
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

procedure TfrmConsRentabilidade.MostraDados(Sender: TObject; Button: TMouseButton;
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

procedure TfrmConsRentabilidade.trvPortfolioMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   inherited;
   MostraDados(Sender,Button,Shift,X,Y);
end;

procedure TfrmConsRentabilidade.btnSelecionaClick(Sender: TObject);
begin
   inherited;
   if not ( (Vazio(dtDtaInicio.Text)) and (Vazio(dtDtaFim.Text)) ) then
      EncheTreeView(dtDtaInicio.Text,dtDtaFim.Text);
end;

function TfrmConsRentabilidade.AchaNo(No: TTreeNode; Alvo: String): TTreeNode;
var nTreeNodeP, nTreeNodeF, nTreeNodeL: TTreeNode;
begin
   Result := nil;

   if Alvo = 'O' then
      nTreeNodeP := trvInvestimentos.Items.GetFirstNode
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

procedure TfrmConsRentabilidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryConsMoeda.Close;
  qryRegra.Close;
  qryRegraJur.Close;
  //AL_3
  qryPlanoPatro.Close;
end;

procedure TfrmConsRentabilidade.dtDtaFimExit(Sender: TObject);
begin
  inherited;
  if dtDtaInicio.Date > dtDtaFim.Date Then
     dtDtaFim.Date := dtDtaInicio.Date;

  // AL_1 - 20/07/2004
  if ((sDataIni <> dtDtaInicio.Text) or
      (sDataFim <> dtDtaFim.Text)) then
     VoltaTreeView;
end;

procedure TfrmConsRentabilidade.dtDtaInicioExit(Sender: TObject);
begin
  inherited;
  // AL_1 - 20/07/2004
  if ((sDataIni <> dtDtaInicio.Text) or
      (sDataFim <> dtDtaFim.Text)) then
     VoltaTreeView;
end;

procedure TfrmConsRentabilidade.dblPlanoPatroCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not ( (Vazio(dtDtaInicio.Text)) and (Vazio(dtDtaFim.Text)) ) then
     EncheTreeView(dtDtaInicio.Text,dtDtaFim.Text);
end;

//AL_5
procedure TfrmConsRentabilidade.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

// AL_6
procedure AtualizaProgTela(sMsg: String = ''; iMax: Integer = 0);
begin
   if iMax = -1 then
      frmConsRentabilidade.fraProg.Apaga
   else
   begin
      if sMsg <> '' then
         frmConsRentabilidade.fraProg.Mes := sMsg;

      if iMax > 0 then
      begin
         frmConsRentabilidade.fraProg.Mostra;
         frmConsRentabilidade.fraProg.Max := iMax;
         frmConsRentabilidade.fraProg.Min := 0;
         frmConsRentabilidade.fraProg.Pos := 0;
      end
      else
      if iMax = 0 then
         frmConsRentabilidade.fraProg.Incrementa;
   end;

   Application.ProcessMessages;
end;

procedure TfrmConsRentabilidade.FormResize(Sender: TObject);
begin
  inherited;
  //AL_6
  fraProg.Width := (TForm(Sender).Width - 345);
  fraProg.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 345)/2);
end;

end.
