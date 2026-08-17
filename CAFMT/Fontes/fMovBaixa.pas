unit fMovBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, TREdit, wwdblook, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, DBCtrls, Mask,
  wwdbedit, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker, CMProcuraMask;

type
  TfrmMovBaixa = class(TfrmOkCancelar)
    PnlDetalhe: TPanel;
    qryMotivoBaixa: TwwQuery;
    qryMotivoBaixaDESCMOTIVOBAIXA: TStringField;
    qryMotivoBaixaIDMOTIVOBAIXA: TFloatField;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qrySelBem: TwwQuery;
    pgctlBaixaBem: TPageControl;
    TabBaixaBem: TTabSheet;
    Data: TLabel;
    Label26: TLabel;
    Label22: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    edData: TCMDateTimePicker;
    edPlaca: TEdit;
    spdPesquisa: TBitBtn;
    edMemDescBem: TMemo;
    edConjunto: TEdit;
    edLocAtual: TEdit;
    edRespAtual: TEdit;
    TabSelBaixaBem: TTabSheet;
    dbeResponsavel: TwwDBEdit;
    dbeSbxProcesso: TwwDBEdit;
    Label2: TLabel;
    Processo: TLabel;
    Label8: TLabel;
    bbtnTermoBaixa: TBitBtn;
    Label9: TLabel;
    edDataSel: TCMDateTimePicker;
    Label10: TLabel;
    dbeSbxData: TCMDateTimePicker;
    dbgSelBaixaBens: TwwDBGrid;
    Label11: TLabel;
    qryBensSelec: TwwQuery;
    dsBensSelec: TwwDataSource;
    qrySelTermo: TwwQuery;
    dsSelTermo: TwwDataSource;
    qrySelTermoIDSELBAIXA: TFloatField;
    qrySelTermoSBXTERMO: TFloatField;
    qrySelTermoSBXPROCESSO: TStringField;
    qrySelTermoSBXDATA: TDateTimeField;
    qrySelTermoSBXNOMERESP: TStringField;
    qrySelTermoSBXFLGEXECUTADO: TFloatField;
    qrySelTermoSBXDTAEXECUTADO: TDateTimeField;
    qryBensSelecIDSELBAIXA: TFloatField;
    qryBensSelecIDBEM: TFloatField;
    qryBensSelecIDPESSOA: TFloatField;
    qryBensSelecPLACA: TFloatField;
    qryBensSelecDESBEM: TStringField;
    MSTermo: TMontaSelect;
    edTermo: TMaskEdit;
    qryBensSelecSBBVALVENDA: TFloatField;
    updSelTermo: TUpdateSQL;
    qryBensSelecBAIXATOTAL: TStringField;
    updBensSelec: TUpdateSQL;
    qryBensSelecVALCTB: TFloatField;
    GroupBox1: TGroupBox;
    edPropBaixar: TRealEdit;
    Label4: TLabel;
    rdgTipoCalcProp: TRadioGroup;
    GroupBox2: TGroupBox;
    cmbMotivoBaixa: TwwDBLookupCombo;
    dbeGrupoContabil: TwwDBEdit;
    Label3: TLabel;
    dsSelBem: TwwDataSource;
    qryContaDestino: TwwQuery;
    dsContaDestino: TwwDataSource;
    GroupBox3: TGroupBox;
    edValVenda: TRealEdit;
    Label5: TLabel;
    edContaDestino: TCMProcuraMaskContabil;
    updContaDestino: TUpdateSQL;
    rdgDepProRata: TRadioGroup;
    GroupBox4: TGroupBox;
    edObsBaixa: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edValVendaExit(Sender: TObject);
    procedure bbtnTermoBaixaClick(Sender: TObject);
    procedure edTermoExit(Sender: TObject);
    procedure edDataSelExit(Sender: TObject);
    procedure rdgTipoCalcPropExit(Sender: TObject);
    procedure rdgTipoCalcPropClick(Sender: TObject);
    procedure pgctlBaixaBemChange(Sender: TObject);
    procedure edContaDestinoApertouBotao(Sender: TObject);
    procedure edContaDestinoExit(Sender: TObject);
  private
    { Private declarations }
    sContaDestino : String;
  public
    { Public declarations }
    procedure LimpaCampos;
    function ConvNum(fNum : Extended) : Extended;
  end;

  eExcessaoCAF = Class(Exception);

var
  frmMovBaixa: TfrmMovBaixa;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, uDataBase, dBaseDados,
     fAguarde, dAtivoFixo, uIntegraBack;

{$R *.DFM}

//========================================================================================
// Função que corrige o bug da variável Double e Extended qdo em loop de acumulação
//----------------------------------------------------------------------------------------
function TfrmMovBaixa.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;
//========================================================================================
procedure TfrmMovBaixa.FormCreate(Sender: TObject);
begin
   inherited;
   qrySelBem.Prepare;
   qryPlaca.Prepare;
   qryMotivoBaixa.Prepare;
   qrySelTermo.Prepare;
   qryBensSelec.Prepare;
   qryMotivoBaixa.Open;
   qryContaDestino.Prepare;
   //-------------------------------------------------------------------------------------
   rdgTipoCalcProp.Hint := 'Se a  baixa  for parcial, selecione  se a  proporção de'+#13+
                           'baixa  do  Saldo  Contábil será  informada (Percentual)'+#13+
                           'ou será calculada usando-se um valor contábil informado.|';
   rdgTipoCalcProp.ShowHint := True;
   //-------------------------------------------------------------------------------------
   edData.Date              := date();
   edPropBaixar.Value       := 100;
   pgctlBaixaBem.ActivePage := TabSelBaixaBem;
   edTermo.Text             := '';
   edContaDestino.Mascara   := IntegraBack.MascaraPlano;
   edContaDestino.Plano     := IntegraBack.Plano;
   edContaDestino.Enabled   := False;
end;
//========================================================================================
procedure TfrmMovBaixa.pgctlBaixaBemChange(Sender: TObject);
begin
   inherited;
   edContaDestino.Enabled := (pgctlBaixaBem.ActivePage = TabBaixaBem);
end;
//========================================================================================
procedure TfrmMovBaixa.LimpaCampos;
begin
   edPlaca.Text        := '';
   edMemDescBem.Text   := '';
   edConjunto.Text     := '';
   edLocAtual.Text     := '';
   edRespAtual.Text    := '';
   //-------------------------------------------------------------------------------------
   edTermo.Text        := '';
   qrySelTermo.Close;
   qrySelBem.Close;
   qryBensSelec.Close;
   qryContaDestino.Close;
   edContaDestino.Clear;
   sContaDestino       := '';
   //-------------------------------------------------------------------------------------
   cmbMotivoBaixa.Text := '';
   edPropBaixar.Value  := 100;
   edValVenda.Value    := 0;
   edObsBaixa.Text     := '';
end;
//========================================================================================
procedure TfrmMovBaixa.edDataExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.bbtnTermoBaixaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTermo.RetornouValor then
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[1]);
      qrySelTermo.Open;
      //----------------------------------------------------------------------------------
      edTermo.Text := qrySelTermoSBXTERMO.AsString;
      //----------------------------------------------------------------------------------
      qryBensSelec.Close;
      qryBensSelec.ParamByName('PIDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[1]);
      qryBensSelec.Open;
      //----------------------------------------------------------------------------------
      if qrySelTermoSBXFLGEXECUTADO.AsInteger = 1 then
      begin
         MsgDlg('Termo de Baixa executado em ' + qrySelTermoSBXDTAEXECUTADO.AsString,
                'Erro', mtError, [mbOk], 0);
         LimpaCampos;
         bbtnTermoBaixa.SetFocus;
      end else
      begin
         edDataSel.Date := qrySelTermoSBXDATA.AsDateTime;
         edDataSel.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      bbtnTermoBaixa.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.edTermoExit(Sender: TObject);
begin
   inherited;
   if edTermo.Text <> '' then
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PSBXTERMO').AsString := edTermo.Text;
      qrySelTermo.Open;
      if not qrySelTermo.IsEmpty then
      begin
         if qrySelTermoSBXFLGEXECUTADO.AsInteger = 1 then
         begin
            MsgDlg('Termo de Baixa executado em ' + qrySelTermoSBXDTAEXECUTADO.AsString,
                   'Erro', mtError, [mbOk], 0);
            LimpaCampos;
            edDataSel.SetFocus;
         end else
         begin
            qryBensSelec.Close;
            qryBensSelec.ParamByName('PIDSELBAIXA').AsInteger := qrySelTermoIDSELBAIXA.AsInteger;
            qryBensSelec.Open;
            //----------------------------------------------------------------------------
            pgctlBaixaBem.Enabled := False;
            pnlDetalhe.SetFocus;
         end;
      end else
      begin
         MsgDlg('Termo de Baixa inexistente','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edDataSel.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      edDataSel.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
      if qrySelBem.IsEmpty then
      begin
         MsgDlg('Bem já baixado ou com controle físico.','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         edPlaca.Text       := qrySelBem.FieldByName('PLACA').AsString;
         edMemDescBem.Text  := qrySelBem.FieldByName('DESBEM').AsString;
         edConjunto.Text    := qrySelBem.FieldByName('DESCCONJUNTO').AsString;
         edLocAtual.Text    := qrySelBem.FieldByName('DESCLOCALIZACAO').AsString;
         edRespAtual.Text   := qrySelBem.FieldByName('NOMERESPONSAVEL').AsString;
         //-------------------------------------------------------------------------------
         qryContaDestino.Close;
         qryContaDestino.ParamByName('IDGRUPO').AsInteger            := qrySelBem.FieldByName('IDGRUPO').AsInteger;
         qryContaDestino.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 06; // Baixa Custo
         qryContaDestino.ParamByName('TIPOLANCAMENTO').AsString      := 'D'; // Conta Saída Padrão
         qryContaDestino.ParamByName('PLANO').AsInteger              := IntegraBack.Plano;
         qryContaDestino.Open;
         sContaDestino := qryContaDestino.FieldByName('PLACONTA').AsString;
         //-------------------------------------------------------------------------------
         pgctlBaixaBem.Enabled := False;
         pnlDetalhe.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovBaixa.edPlacaExit(Sender: TObject);
begin
   inherited;
   if edPlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         if not qrySelBem.IsEmpty then
         begin
            edPlaca.Text       := qrySelBem.FieldByName('PLACA').AsString;
            edMemDescBem.Text  := qrySelBem.FieldByName('DESBEM').AsString;
            edConjunto.Text    := qrySelBem.FieldByName('DESCCONJUNTO').AsString;
            edLocAtual.Text    := qrySelBem.FieldByName('DESCLOCALIZACAO').AsString;
            edRespAtual.Text   := qrySelBem.FieldByName('NOMERESPONSAVEL').AsString;
            //----------------------------------------------------------------------------
            qryContaDestino.Close;
            qryContaDestino.ParamByName('IDGRUPO').AsInteger            := qrySelBem.FieldByName('IDGRUPO').AsInteger;
            qryContaDestino.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 06; // Baixa Custo
            qryContaDestino.ParamByName('TIPOLANCAMENTO').AsString      := 'D'; // Conta Saída Padrão
            qryContaDestino.ParamByName('PLANO').AsInteger              := IntegraBack.Plano;
            qryContaDestino.Open;
            sContaDestino := qryContaDestino.FieldByName('PLACONTA').AsString;
            //----------------------------------------------------------------------------
            pgctlBaixaBem.Enabled := False;
            pnlDetalhe.SetFocus;
         end else
         begin
            MsgDlg('Bem já baixado ou Placa inexistente!','Erro',mtError,[mbOk],0);
            LimpaCampos;
            edData.SetFocus;
         end;
      end else
      begin
         LimpaCampos;
         edData.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.edContaDestinoApertouBotao(Sender: TObject);
begin
   inherited;
   qryContaDestino.Edit;
end;
//========================================================================================
procedure TfrmMovBaixa.edContaDestinoExit(Sender: TObject);
begin
   inherited;
   with dtmAtivoFixo do
   begin
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT PLANO, PLANOME, PLACONTA, PLATIPO ' +
                         ' FROM PLANOCONTA ' +
                         ' WHERE (PLANO    = ' + IntToStr(edContaDestino.Plano) + ') ' +
                         '   AND (PLACONTA = ' + #39 + edContaDestino.Conta.Numero + #39 + ') ' +
                         '   AND (PLAINATIVA = ' + #39 + 'A' + #39 +') ';
      qryAux.Open;
      if qryAux.FieldByName('PLATIPO').AsString = 'S' then
      begin
         MsgDlg('A Conta Contábil '+qryAux.FieldByName('PLACONTA').AsString+' - '+
                qryAux.FieldByName('PLANOME').AsString + ' do Plano '+
                qryAux.FieldByName('PLANO').AsString + ' é Sintética!',
                'Erro',mtError,[mbOk],0);
         qryContaDestino.Close;
         qryContaDestino.ParamByName('IDGRUPO').AsInteger            := qrySelBem.FieldByName('IDGRUPO').AsInteger;
         qryContaDestino.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := 06;  // Baixa Custo
         qryContaDestino.ParamByName('TIPOLANCAMENTO').AsString      := 'D'; // Conta Saída Padrão
         qryContaDestino.ParamByName('PLANO').AsInteger              := IntegraBack.Plano;
         qryContaDestino.Open;
         edContaDestino.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.bbtnConfirmarClick(Sender: TObject);
var
   fValResult, fValResImob,
   fSomaValCtb, fProp        : Currency;
   iPlanilha                 : Integer;
   fPropBaixar, fValVenda    : Extended;
   aValPropBaixa             : Array of Currency;
   iaValPropBaixa            : Integer;
   sContaContabil            : String;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   sContaContabil := '';
   //-------------------------------------------------------------------------------------
   if pgctlBaixaBem.ActivePage = TabBaixaBem then
   begin
      if edData.Text = '' then
      begin
         MsgDlg('Data da Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if edPlaca.Text = '' then
      begin
         MsgDlg('Selecione um bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if cmbMotivoBaixa.Text = '' then
      begin
         MsgDlg('Selecione o Motivo da Baixa do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if rdgTipoCalcProp.ItemIndex = 0 then
      begin
         if (edPropBaixar.Value <= 0) or (edPropBaixar.Value > 100) then
         begin
            MsgDlg('Selecione a Proporção da Baixa do bem! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end else
      begin
         if edPropBaixar.Value < 0 then
         begin
            MsgDlg('Valor da Baixa parcial está inválido! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if edObsBaixa.Text = '' then
      begin
         MsgDlg('Informe os detalhes relevantes da Baixa do Bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if trim(edContaDestino.Conta.Numero) <> sContaDestino then
         sContaContabil := trim(edContaDestino.Conta.Numero);
      //----------------------------------------------------------------------------------
      fPropBaixar := edPropBaixar.Value;
      fValVenda   := edValVenda.Value;
      if AtivoFixo.ExecutaBaixa(Sistema.IdModulo, Sistema.IdEmpresa,
                                qrySelBem.FieldByName('IDBEM').AsInteger,
                                qryMotivoBaixa.FieldByName('IDMOTIVOBAIXA').AsInteger,
                                edData.Date, rdgTipoCalcProp.ItemIndex,
                                fPropBaixar, fValVenda, edObsBaixa.Text,
                                sContaContabil, rdgDepProRata.ItemIndex, True,
                                fValResult, fValResImob, iPlanilha) then
      begin
         MsgDlg('Movimentação Realizada!', 'Atenção', mtInformation, [mbOk], 0);
      end else
      begin
         MsgDlg('Movimentação não Realizada!' + #13 + #13 +
                'Causa : ' + AtivoFixo.MensagemErro, 'Erro', mtError, [mbOk], 0);
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
      pgctlBaixaBem.Enabled    := True;
      pgctlBaixaBem.ActivePage := TabBaixaBem;
      bbtnConfirmar.Enabled    := True;
      bbtnCancelar.Enabled     := True;
      edData.SetFocus;
   end else
   //-------------------------------------------------------------------------------------
   // Processa um termo de seleção de baixa
   //-------------------------------------------------------------------------------------
   begin
      if edDataSel.Text = '' then
      begin
         MsgDlg('Data da Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edDataSel.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if edTermo.Text = '' then
      begin
         MsgDlg('Selecione um Termo de Seleção de Baixa! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlBaixaBem.Enabled := True;
         edTermo.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if cmbMotivoBaixa.Text = '' then
      begin
         MsgDlg('Selecione o Motivo da Baixa do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if rdgTipoCalcProp.ItemIndex = 0 then
      begin
         if (edPropBaixar.Value <= 0) or (edPropBaixar.Value > 100) then
         begin
            MsgDlg('Selecione a Proporção da Baixa do bem! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end else
      begin
         if edPropBaixar.Value < 0 then
         begin
            MsgDlg('Valor da Baixa parcial está inválido! ','Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            cmbMotivoBaixa.SetFocus;
            exit;
         end;
      end;
      //----------------------------------------------------------------------------------
      if edObsBaixa.Text = '' then
      begin
         MsgDlg('Informe os detalhes relevantes da Baixa do Bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         cmbMotivoBaixa.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      StartTransacao;
      try
         //-------------------------------------------------------------------------------
         // Verifica se existem bens já baixados na seleção
         //-------------------------------------------------------------------------------
         frmAguarde.Pos := 0;
         frmAguarde.Min := 0;
         frmAguarde.Max := qryBensSelec.RecordCount;
         frmAguarde.Mostra('Verificando Termo de Baixa');
         //-------------------------------------------------------------------------------
         qryBensSelec.DisableControls;
         qryBensSelec.First;
         fSomaValCtb := 0;
         while not qryBensSelec.EOF do
         begin
            fSomaValCtb := fSomaValCtb + qryBensSelecVALCTB.AsCurrency;
            //----------------------------------------------------------------------------
            if qryBensSelec.FieldByName('BAIXATOTAL').AsString = 'S' then
               Raise eExcessaoCAF.Create('O bem ' + qryBensSelec.FieldByName('PLACA').AsString + ' já está baixado.' + #13 + #13 +
                                         'Retire-o do Termo de Baixa.');
            //----------------------------------------------------------------------------
            frmAguarde.Pos := frmAguarde.Pos + 1;
            qryBensSelec.Next;
         end;
         frmAguarde.Apaga;
         //-------------------------------------------------------------------------------
         // Alimenta SBBVALVENDA com os valores proporcionados
         //-------------------------------------------------------------------------------
         if edValVenda.Value <> 0 then
         begin
            frmAguarde.Pos := 0;
            frmAguarde.Min := 0;
            frmAguarde.Max := qryBensSelec.RecordCount;
            frmAguarde.Mostra('Calculando os Valores de Venda');
            //----------------------------------------------------------------------------
            qryBensSelec.First;
            while not qryBensSelec.EOF do
            begin
               fProp := qryBensSelecVALCTB.AsCurrency / fSomaValCtb;
               qryBensSelec.Edit;
               qryBensSelec.FieldByName('SBBVALVENDA').AsCurrency := edValVenda.Value * fProp;
               qryBensSelec.Post;
               //-------------------------------------------------------------------------
               frmAguarde.Pos := frmAguarde.Pos + 1;
               qryBensSelec.Next;
            end;
            qryBensSelec.ApplyUpdates;
            frmAguarde.Apaga;
         end;
         //-------------------------------------------------------------------------------
         // Alimenta aValProp com o valor da baixa parcial ratiada entre os
         // bens da seleção, de acordo com o saldo contábil atual
         //-------------------------------------------------------------------------------
         frmAguarde.Pos := 0;
         frmAguarde.Min := 0;
         frmAguarde.Max := qryBensSelec.RecordCount;
         frmAguarde.Mostra('Calculando o Rateio do Valor da Baixa');
         //-------------------------------------------------------------------------------
         if rdgTipoCalcProp.ItemIndex = 1 then
         begin
            qryBensSelec.First;
            iaValPropBaixa := 0;
            while not qryBensSelec.EOF do
            begin
               SetLength(aValPropBaixa,iaValPropBaixa + 1);
               //-------------------------------------------------------------------------
               fProp := ConvNum(qryBensSelec.FieldByName('VALCTB').AsCurrency / fSomaValCtb);
               aValPropBaixa[iaValPropBaixa] := edPropBaixar.Value * fProp;
               //-------------------------------------------------------------------------
               iaValPropBaixa := iaValPropBaixa + 1;
               frmAguarde.Pos := frmAguarde.Pos + 1;
               qryBensSelec.Next;
            end;
            qryBensSelec.ApplyUpdates;
         end else
         begin
            qryBensSelec.First;
            iaValPropBaixa := 0;
            while not qryBensSelec.EOF do
            begin
               SetLength(aValPropBaixa,iaValPropBaixa + 1);
               //-------------------------------------------------------------------------
               aValPropBaixa[iaValPropBaixa] := edPropBaixar.Value;
               //-------------------------------------------------------------------------
               iaValPropBaixa := iaValPropBaixa + 1;
               frmAguarde.Pos := frmAguarde.Pos + 1;
               qryBensSelec.Next;
            end;
            qryBensSelec.ApplyUpdates;
         end;
         frmAguarde.Apaga;
         //-------------------------------------------------------------------------------
         frmAguarde.Min := 0;
         frmAguarde.Max := qryBensSelec.RecordCount;
         frmAguarde.Pos := 0;
         frmAguarde.Mostra('Baixando os Bens do Termo');
         //-------------------------------------------------------------------------------
         qryBensSelec.First;
         iaValPropBaixa := 0;
         while not qryBensSelec.EOF do
         begin
            fPropBaixar := aValPropBaixa[iaValPropBaixa];
            fValVenda   := qryBensSelec.FieldbyName('SBBVALVENDA').AsCurrency;
            //----------------------------------------------------------------------------
            frmAguarde.Pos := frmAguarde.Pos + 1;
            frmAguarde.Caption := 'Processando ' + inttostr(frmAguarde.Pos) + ' / ' + inttostr(frmAguarde.Max);
            frmAguarde.Mostra('Baixando os Bens do Termo');
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if not AtivoFixo.ExecutaBaixa(Sistema.IdModulo,
                                          qryBensSelec.FieldByName('IDPESSOA').AsInteger,
                                          qryBensSelec.FieldByName('IDBEM').AsInteger,
                                          qryMotivoBaixa.FieldByName('IDMOTIVOBAIXA').AsInteger,
                                          edDataSel.Date, rdgTipoCalcProp.ItemIndex, fPropBaixar,
                                          fValVenda, edObsBaixa.Text,
                                          sContaContabil, rdgDepProRata.ItemIndex, True,
                                          fValResult, fValResImob, iPlanilha) then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            iaValPropBaixa := iaValPropBaixa + 1;
            qryBensSelec.Next;
         end;
         frmAguarde.Caption := 'Aguarde ...';
         //-------------------------------------------------------------------------------
         // Seta o Termo como Executado
         //-------------------------------------------------------------------------------
         qrySelTermo.Edit;
         qrySelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger  := 1;
         qrySelTermo.FieldByName('SBXDTAEXECUTADO').AsDateTime := edDataSel.Date;
         qrySelTermo.Post;
         qrySelTermo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         qryBensSelec.EnableControls;
         frmAguarde.Apaga;
         CommitTransacao;
         //-------------------------------------------------------------------------------
         MsgDlg('Movimentação Realizada!',
                'Atenção', mtInformation, [mbOk], 0);
         LimpaCampos;
         pgctlBaixaBem.Enabled    := True;
         pgctlBaixaBem.ActivePage := TabSelBaixaBem;
         bbtnConfirmar.Enabled    := True;
         bbtnCancelar.Enabled     := True;
         bbtnTermoBaixa.SetFocus;
      except
         on E : Exception do
         begin
            qryBensSelec.EnableControls;
            frmAguarde.Apaga;
            RollBackTransacao;
            //----------------------------------------------------------------------------
            MsgDlg('Movimentação não Realizada!' + #13 + #13 + 'Causa : ' + E.Message,
                   'Erro', mtError, [mbOk], 0);
            LimpaCampos;
            pgctlBaixaBem.Enabled    := True;
            pgctlBaixaBem.ActivePage := TabSelBaixaBem;
            bbtnConfirmar.Enabled    := True;
            bbtnCancelar.Enabled     := True;
            bbtnTermoBaixa.SetFocus;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryPlaca.Close;
   qryMotivoBaixa.Close;
   qrySelTermo.Close;
   qryBensSelec.Close;
   qryContaDestino.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qryPlaca.UnPrepare;
   qryMotivoBaixa.UnPrepare;
   qrySelTermo.UnPrepare;
   qryBensSelec.UnPrepare;
   qryContaDestino.UnPrepare;
end;
//========================================================================================
procedure TfrmMovBaixa.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   pgctlBaixaBem.Enabled    := True;
   pgctlBaixaBem.ActivePage := TabSelBaixaBem;
   bbtnConfirmar.Enabled    := True;
   bbtnTermoBaixa.SetFocus;
end;
//========================================================================================
procedure TfrmMovBaixa.edValVendaExit(Sender: TObject);
{var
   fSomaValVenda : Double;}
begin
   inherited;
   if (pgctlBaixaBem.ActivePage = TabSelBaixaBem) then
   begin
     {fSomaValVenda := 0;
      qryBensSelec.First;
      while not qryBensSelec.EOF do
      begin
         fSomaValVenda := fSomaValVenda + qryBensSelecSBBVALVENDA.AsFloat;
         qryBensSelec.Next;
      end;
      //----------------------------------------------------------------------------------
      if (edValVenda.Value <> fSomaValVenda) then
      begin
         MsgDlg('O Valor da Venda informado (' + FormatFloat('#,0.00;(#,0.00)',edValVenda.Value) +
                ') está diferente do valor calculado (' + FormatFloat('#,0.00;(#,0.00)',fSomaValVenda) +
                '). Confira os valores de venda dos bens! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := False;
      end;}
   end else
      if (edValVenda.Value <= 0) then
      begin
         MsgDlg('O Valor da Venda está Zerado. Se o motivo da baixa for Venda/Alienação, '+
                'é obrigatório informar o valor da venda, para a apuração de resultado! ',
                'Atenção',mtWarning,[mbOk],0);
      end;
end;
//========================================================================================
procedure TfrmMovBaixa.edDataSelExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if (edDataSel.Text = '') then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edDataSel.SetFocus;
   end else
   begin
      pgctlBaixaBem.Enabled := False;
      pnlDetalhe.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovBaixa.rdgTipoCalcPropExit(Sender: TObject);
begin
   inherited;
   if rdgTipoCalcProp.ItemIndex = 0 then
      Label4.Caption := '%'
   else
      Label4.Caption := 'R$';
end;
//========================================================================================
procedure TfrmMovBaixa.rdgTipoCalcPropClick(Sender: TObject);
begin
   inherited;
   if rdgTipoCalcProp.ItemIndex = 0 then
      Label4.Caption := '%'
   else
      Label4.Caption := 'R$';
end;

end.
