//******************************************************************************
// Data      : 18/05/2007
// Código    : AL_5
// Pendencia : 25410
// SOL       : 60583
// Desc      : Aumento da quantidade de decimais para 15 no campo PERCENTUAL
//******************************************************************************
// Data      : 30/11/2006
// Código    : AL_4 
// Pendencia : 23782
// Desc      : Inclusão do Campo Percentual no Grid de Operações
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_3
// Pendencia : 22965
// Desc      : Ajustes no momento da inclusão de novos dados
//******************************************************************************
// Data      : 26/09/2006
// Código    : AL_2
// Pendencia : 22965
// Desc      : Ajustes para fazer TRC de CC e CCI
//             Ajustes gerais no processo
//******************************************************************************
// Data      : 14/08/2006
// Código    : AL_1
// Pendencia : 22957
// Desc      : Implementação da funcionalidade
//******************************************************************************

unit FCadTransfRenVarLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, ExtCtrls, fcLabel, Db, DBTables, Wwquery, CmEventosCadastro,
  ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, faMensagem,
  Menus, uCMMath, uCtrlRendaVariavel, uCtrlPadroes, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TfrmCadTransfRenVarLote = class(TFrmCadastroGridCS)
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Bevel2: TBevel;
    pnlSaldos: TPanel;
    pnlDados: TPanel;
    dbgSaldos: TwwDBGrid;
    lblPlanoPatroOrigem: TLabel;
    dblkPlanPatroO: TwwDBLookupCombo;
    lblPlanoPatroDestino: TLabel;
    dblkPlanPatroD: TwwDBLookupCombo;
    lblCarteira: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    lblDtOperacao: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    lblPercentual: TLabel;
    redtPercentual: TRealEdit;
    pnlAltSaldos: TPanel;
    qryPlanoPatroOrig: TwwQuery;
    qryPlanoPatroDestino: TwwQuery;
    qryCarteira: TwwQuery;
    qryPlanoPatroOrigIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroOrigIDPLANOPREV: TFloatField;
    qryPlanoPatroOrigIDPATRO: TFloatField;
    qryPlanoPatroOrigPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroDestinoIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroDestinoIDPLANOPREV: TFloatField;
    qryPlanoPatroDestinoIDPATRO: TFloatField;
    qryPlanoPatroDestinoPLANPRVCONTABPATRO: TStringField;
    qryInvestimento: TwwQuery;
    dsSaldosATransf: TwwDataSource;
    fraMens: TfraMensagem;
    sbtnFiltrar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    pmnuFixaColunas: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    N1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    lblPercentualTransf: TLabel;
    lblQtdTransf: TLabel;
    lblVlrTransf: TLabel;
    redtPercentualTransf: TDBRealEdit;
    redQtdTransf: TDBRealEdit;
    redVlrTransf: TDBRealEdit;
    ppmSaldos: TPopupMenu;
    FixarColuna2: TMenuItem;
    LiberarColuna2: TMenuItem;
    MenuItem3: TMenuItem;
    LiberaTodasasColunas2: TMenuItem;
    mnuAlterar: TMenuItem;
    mnuExcluir: TMenuItem;
    N2: TMenuItem;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    memObs: TMemo;
    lblObservacao: TLabel;
    CdsSldTRCPlanoSintetico: TCMClientDataSet;
    sqlSldTRCPlanoSintetico: TCMSqlParams;
    CdsBoletasTRP: TCMClientDataSet;
    CdsSldTRCPlanoSinteticoDATAOPERACAO: TStringField;
    CdsSldTRCPlanoSinteticoDESCCARTINVEST: TStringField;
    CdsSldTRCPlanoSinteticoDESCINVESTIMENTO: TStringField;
    CdsSldTRCPlanoSinteticoIDEMISSOR: TFloatField;
    CdsSldTRCPlanoSinteticoIDPLANPREVCTBORIG: TFloatField;
    CdsSldTRCPlanoSinteticoSALDOQTDEINVCART: TFloatField;
    CdsSldTRCPlanoSinteticoSALDOVLRINVCART: TFloatField;
    CdsSldTRCPlanoSinteticoPERCTRANSFERIDO: TFloatField;
    CdsSldTRCPlanoSinteticoQTDTRANSFERIDO: TFloatField;
    CdsSldTRCPlanoSinteticoVLRTRANSFERIDO: TFloatField;
    CdsSldTRCPlanoSinteticoIDPLANPREVCTBDEST: TFloatField;
    CdsSldTRCPlanoSinteticoIDCARTEIRAINVEST: TFloatField;
    CdsSldTRCPlanoSinteticoIDINVESTIMENTO: TFloatField;
    qryIDOPERACAOINVEST: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryNUMDOCUMENTO: TStringField;
    qryQTDEOPERACAO: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryIDOPERCUSTODIA: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryPLANOPATROORIG2: TStringField;
    qryPLANOPATRODEST: TStringField;
    qryIDPLANOPATROORIG: TFloatField;
    qryIDPLANOPATRODEST: TFloatField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDGESTORCARTEIRA: TFloatField;
    qryCarteiraFLGCARTPROP: TFloatField;
    qryCarteiraFLGCALCDIARIO: TStringField;
    qryCarteiraDATAINICIO: TDateTimeField;
    qryCarteiraFLGTRATALOTE: TStringField;
    qryCarteiraTRGDTINCLUSAO: TDateTimeField;
    qryCarteiraTRGUSERINCLUSAO: TStringField;
    qryCarteiraIDPLANOPREV: TFloatField;
    qryCarteiraIDPATROCINADORA: TFloatField;
    qryCarteiraIDTIPOINVEST: TFloatField;
    qryCarteiraIDMERCADO: TFloatField;
    qryCarteiraFLGORDMOVINV: TStringField;
    qryCarteiraDATAULTFECH: TDateTimeField;
    qryCarteiraIDDAIEACART: TFloatField;
    qryCarteiraFLGCARTLASTRO: TStringField;
    qryCarteiraFLGCARTTERC: TStringField;
    qrySGLCUSTODIANTE: TStringField;
    qryCustodiante: TwwQuery;
    Label1: TLabel;
    dblCustodia: TwwDBLookupCombo;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    Label2: TLabel;
    qryPERCENTUAL: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnuFixaColunasPopup(Sender: TObject);
    procedure FixarColuna1Click(Sender: TObject);
    procedure LiberarColuna1Click(Sender: TObject);
    procedure LiberaTodasasColunas1Click(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure PintaGridZebrado(Sender: TObject; Field: TField; State:
                               TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure GridRefresh(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnFiltrarClick(Sender: TObject);
    procedure dsSaldosATransfStateChange(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure redtPercentualTransfEnter(Sender: TObject);
    procedure redtPercentualTransfExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgSaldosDblClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    CtrlRendaVariavel     : TCtrlRendaVariavel;
    procedure SelBoleta(sBoleta: String);
    function ValidaFiltros: Boolean;
    function AlteraSaldo: Boolean;
    function ExcluiSaldo: Boolean;
  public
    { Public declarations }
  end;

  procedure AtualizaProgTRCPlanoRV(sMsg: String = ''; iMax: Integer = -1);

var
  frmCadTransfRenVarLote: TfrmCadTransfRenVarLote;
  fPercAnt: Double;

implementation

uses uMensErro, DBaseDados, UDataBase, URendaVariavel, UOperComum, UBibliotecaInvest,
  UDiasUteisInv, FPrincipal, uCtrlInvContab, dOperComum;

{$R *.DFM}

procedure TfrmCadTransfRenVarLote.sbtnInserirClick(Sender: TObject);
begin
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   //AL_3
   CdsSldTRCPlanoSintetico.Close;

   dblkPlanPatroO.Text:= '';
   dblkPlanPatroD.Text:= '';
   dblkCarteira.Text:= '';
   dblkInvestimento.Text:= '';
   dbDtaOperacao.Text:= '';
   redtPercentual.Text:= '';
   dblCustodia.Text:= '';
   memObs.Text:= '';
   pnlSaldos.BringToFront;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   dsSaldosATransfStateChange(Self);
   sbtnFiltrar.Visible := True;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := False;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := True;
   if dblkPlanPatroO.CanFocus then
      dblkPlanPatroO.SetFocus;
end;

procedure TfrmCadTransfRenVarLote.sbtnAlterarClick(Sender: TObject);
begin
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;
   inherited;
end;


procedure TfrmCadTransfRenVarLote.FormShow(Sender: TObject);
begin
   inherited;
   fraMens.Apaga;
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);
   if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
      TForm(Sender).Caption := 'Cadastro';
   SelBoleta('');
   Application.ProcessMessages;
end;

procedure TfrmCadTransfRenVarLote.FormCreate(Sender: TObject);
begin
   // Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
   inherited;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlRendaVariavel.InitializeAs(Padroes);
end;

procedure TfrmCadTransfRenVarLote.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfRenVarLote.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Word;
begin
   // Fecha todas as queries que ficarem abertas
   for i := 0 to TForm(Sender).ComponentCount -1 do
   begin
      if TForm(Sender).Components[i] is TwwQuery then
      begin
         if TwwQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TwwQuery(TForm(Sender).Components[i]).Close;
      end;
      if TForm(Sender).Components[i] is TQuery then
      begin
         if TQuery(TForm(Sender).Components[i]).State <> dsInactive then
            TQuery(TForm(Sender).Components[i]).Close;
      end;
   end;
   inherited;
end;

procedure TfrmCadTransfRenVarLote.pmnuFixaColunasPopup(Sender: TObject);
begin
  inherited;
  if TPopupMenu(Sender).PopupComponent.ClassNameIs('TwwDBGrid') then
  begin
     if TwwDBGrid(TPopupMenu(Sender).PopupComponent).DataSource.DataSet.Active then
     begin
        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).FixedCols = 0 then
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
           begin
              LiberarColuna2.Enabled := False;
              LiberaTodasasColunas2.Enabled := False;
           end
           else
           begin
              LiberarColuna1.Enabled := False;
              LiberaTodasasColunas1.Enabled := False;
           end
        end
        else
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
           begin
              LiberarColuna2.Enabled := True;
              LiberaTodasasColunas2.Enabled := True;
           end
           else
           begin
              LiberarColuna1.Enabled := True;
              LiberaTodasasColunas1.Enabled := True;
           end
        end;

        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).FixedCols = TwwDBGrid(TPopupMenu(Sender).PopupComponent).GetColCount then
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
              FixarColuna2.Enabled := False
           else
              FixarColuna1.Enabled := False;
        end
        else
        begin
           if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
              FixarColuna2.Enabled := True
           else
              FixarColuna1.Enabled := True;
        end;
     end
     else
     begin
        if TwwDBGrid(TPopupMenu(Sender).PopupComponent).Name = 'dbgSaldos' then
        begin
           LiberarColuna2.Enabled := False;
           LiberaTodasasColunas2.Enabled := False;
           FixarColuna2.Enabled := False
        end
        else
        begin
           LiberarColuna1.Enabled := False;
           LiberaTodasasColunas1.Enabled := False;
           FixarColuna1.Enabled := False
        end;
     end;
   end;
end;

procedure TfrmCadTransfRenVarLote.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols + 1;
end;

procedure TfrmCadTransfRenVarLote.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols - 1;
end;

procedure TfrmCadTransfRenVarLote.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := 0;
end;

procedure TfrmCadTransfRenVarLote.PintaGridZebrado(Sender: TObject; Field: TField; State:
                                                   TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  // faz com que as linhas do grid tenham cores alternadas, exceto a linha selecionada

  // Se a Celula atual pertence a linha selecionada
  if (Sender as TwwDBGrid).CalcCellRow = (Sender as TwwDBGrid).GetActiveRow then
  begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end
  else
  begin
     // Se a celula atual não está selecionada nem fixada
     if (not (gdSelected in State)) and (not (gdFixed in State)) then
     begin
        if not Highlight then
        begin
           // linhas ímpares = amarelo, linhas pares = branco
           if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
              ABrush.Color := $00C0FFFF // amarelo bebê
           else
              ABrush.Color := clWhite;
        end;
     end
     else
     // Se a celula atual é a selecionada
     if State = [gdSelected] then
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
  end;
end;

procedure TfrmCadTransfRenVarLote.GridRefresh(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmCadTransfRenVarLote.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down then
  begin
     if CdsSldTRCPlanoSintetico.RecordCount > 0 then
     begin
        sbtnAlterar.Enabled := True;
        sbtnApagar.Enabled := True;
        bbtnConfirmar.Enabled := True;
     end
     else
     begin
        sbtnAlterar.Enabled := False;
        sbtnApagar.Enabled := False;
        bbtnConfirmar.Enabled := False;
     end;
  end
  else
  begin
     sbtnInserir.Enabled := True;
     sbtnAlterar.Enabled := False;
     if qry.RecordCount > 0 then
        sbtnApagar.Enabled := True
     else
        sbtnApagar.Enabled := False;
  end;

end;

procedure TfrmCadTransfRenVarLote.bbtnCancelarClick(Sender: TObject);
begin
   if sbtnInserir.Down then
   begin
      pnlSaldos.SendToBack;
      sbtnFiltrar.Visible := False;
      FormResize(Self);

      CmeCadastro.AtualizaBotoes(Self);
   end
   else
     inherited;

end;

function TfrmCadTransfRenVarLote.ValidaFiltros: Boolean;
begin
   Result := False;
   //AL_2 - Ini
   if Trim(dblkPlanPatroO.Text) = '' then
   begin
      MsgDlg('Informe o Plano Origem.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblkPlanPatroO.CanFocus then
         dblkPlanPatroO.SetFocus;
      Exit;
   end;
   if Trim(dblkPlanPatroD.Text) = '' then
   begin
      MsgDlg('Informe o Plano Destino.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblkPlanPatroD.CanFocus then
         dblkPlanPatroD.SetFocus;
      Exit;
   end;
   if Trim(dblkCarteira.Text) = '' then
   begin
      MsgDlg('Informe a Carteira.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblkCarteira.CanFocus then
         dblkCarteira.SetFocus;
      Exit;
   end;
   if Trim(dbDtaOperacao.Text) = '' then
   begin
      MsgDlg('Informe a Data da Transferência.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbDtaOperacao.CanFocus then
         dbDtaOperacao.SetFocus;
      Exit;
   end;
   if redtPercentual.Value = 0 then
   begin
      MsgDlg('Informe o Percentual a Transferir.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redtPercentual.CanFocus then
         redtPercentual.SetFocus;
      Exit;
   end;
   if redtPercentual.Value > 100 then
   begin
      MsgDlg('O Percentual não pode ser maio que 100%.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      redtPercentual.Value := 100;
      if redtPercentual.CanFocus then
         redtPercentual.SetFocus;
      Exit;
   end;
   //AL_2 - Fim
   Result := True;
end;

procedure TfrmCadTransfRenVarLote.dsSaldosATransfStateChange(Sender: TObject);
begin
   inherited;
   if CdsSldTRCPlanoSintetico.Active then
   begin
      if CdsSldTRCPlanoSintetico.RecordCount > 0 then
      begin
         mnuAlterar.Enabled := True;
         mnuExcluir.Enabled := True;
      end
      else
      begin
         mnuAlterar.Enabled := False;
         mnuExcluir.Enabled := False;
      end;
   end
   else
   begin
      mnuAlterar.Enabled := False;
      mnuExcluir.Enabled := False;
   end;
end;

function TfrmCadTransfRenVarLote.AlteraSaldo: Boolean;
begin
   try
      CdsSldTRCPlanoSintetico.Edit;
      pnlAltSaldos.BringToFront;
      pnlAltSaldos.Enabled := True;
      bbtnConfirmar.Enabled := False;
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
   except
      CdsSldTRCPlanoSintetico.Cancel;
      pnlAltSaldos.SendToBack;
      pnlAltSaldos.Enabled := False;
      bbtnConfirmar.Enabled := True;
   end;
end;

function TfrmCadTransfRenVarLote.ExcluiSaldo: Boolean;
begin
   if MsgDlg('Retira esta aplicação deste Lote de Transferência?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CdsSldTRCPlanoSintetico.Delete;
end;

procedure TfrmCadTransfRenVarLote.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  AlteraSaldo;
end;

procedure TfrmCadTransfRenVarLote.mnuExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluiSaldo;
end;

procedure TfrmCadTransfRenVarLote.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   if CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat > 100 then
   begin
      MsgDlg('Não é possível transferir mais de cem por cento do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
      Exit;
   end;
   if CdsSldTRCPlanoSintetico.FieldByName('QTDTRANSFERIDO').AsFloat > CdsSldTRCPlanoSintetico.FieldByName('SALDOQTDEINVCART').AsFloat then
   begin
      MsgDlg('Não é possível transferir mais que o saldo do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redQtdTransf.CanFocus then
         redQtdTransf.SetFocus;
      Exit;
   end;
   if CdsSldTRCPlanoSintetico.FieldByName('VLRTRANSFERIDO').AsFloat > CdsSldTRCPlanoSintetico.FieldByName('SALDOVLRINVCART').AsFloat then
   begin
      MsgDlg('Não é possível transferir mais que o saldo do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redVlrTransf.CanFocus then
         redVlrTransf.SetFocus;
      Exit;
   end;

   CdsSldTRCPlanoSintetico.Post;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfRenVarLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CdsSldTRCPlanoSintetico.Cancel;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfRenVarLote.redtPercentualTransfEnter(Sender: TObject);
begin
   inherited;
   fPercAnt := CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat;
end;

procedure TfrmCadTransfRenVarLote.redtPercentualTransfExit(Sender: TObject);
begin
   inherited;
   if fPercAnt <> CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat then
   begin
      // Recalcula os valores
      CdsSldTRCPlanoSintetico.FieldByName('QTDTRANSFERIDO').AsFloat := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('SALDOQTDEINVCART').AsFloat * (redtPercentualTransf.Value / 100), 2);
      CdsSldTRCPlanoSintetico.FieldByName('VLRTRANSFERIDO').AsFloat := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('SALDOVLRINVCART').AsFloat * (redtPercentualTransf.Value / 100), 2);
   end;
end;

procedure TfrmCadTransfRenVarLote.bbtnConfirmarClick(Sender: TObject);
var fMax, fPos, iResp: Integer;
   sBoleta, sInvestimento: String;
   iTipoConta, iCustEx : Integer;
begin
    if RendaVariavel.VerEmAbertura then
       Exit;

    if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 2) then
    begin
       MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
       Exit;
    end;

   if MsgDlg('Confirma a transferência dos títulos selecionados?.', 'Mensagem do Sistema', mtConfirmation,[mbYes, mbNo],0) = mrNo then
      Exit;
   try
      try
         // Prepara o ambiente para transferir
         fraMens.Mostra;
         fraMens.Max := CdsSldTRCPlanoSintetico.RecordCount;
         fMax := fraMens.Max;
         fraMens.Pos := 0;

         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Gera Boleta única para todo o Lote
         sBoleta := 'RV-'+Copy(dbDtaOperacao.Text,9,2)+'/'+FormatFloat('0000',
                     LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbDtaOperacao.Text,9,2)));

         // Seta o Frame para ser atualizado na rotina de transferência
         fPos := fraMens.Pos;
         uRendaVariavel.AtualizaProcFech := AtualizaProgTRCPlanoRV;

         //AL_2 - Custódia de Exceção
         if Trim(dblCustodia.Text) = '' then
            iCustEx := -1
         else
            iCustEx := qryCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;

         //AL_2 - Transfere o título
         if not RendaVariavel.TransfEntrePlanos(CdsSldTRCPlanoSintetico,
                                                sBoleta, memObs.Text, iCustEx) then
             Raise Exception.Create('');

         // Volta o controle do frame para a tela
         uRendaVariavel.AtualizaProcFech := nil;


         MsgDlg('Operação concluída com sucesso.', 'Mensagem do Sistema', mtInformation,[mbOk],0);
         DtmBaseDados.dbBaseDados.Commit;

         // Prepara o ambiente para consulta de transferências
         pnlSaldos.SendToBack;
         dsSaldosATransfStateChange(Self);
         sbtnFiltrar.Visible := False;
         CmeCadastro.AtualizaBotoes(Self);
         SelBoleta('');
      except
         on E:Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Não foi Possível Efetuar esta Transferência' + #13 +
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         end;
      end;
   finally
      fraMens.Apaga;
      CmeCadastro.AtualizaBotoes(Self);
      FormResize(Self);
   end;

end;

procedure AtualizaProgTRCPlanoRV(sMsg: String = ''; iMax: Integer = -1);
begin
   if iMax = -2 then
      frmCadTransfRenVarLote.fraMens.Apaga
   else if iMax = -1 then
      frmCadTransfRenVarLote.fraMens.Incrementa
   else if iMax > 0 then
   begin
      frmCadTransfRenVarLote.fraMens.Mostra;
      frmCadTransfRenVarLote.fraMens.Max := iMax;
      frmCadTransfRenVarLote.fraMens.Min := 0;
      frmCadTransfRenVarLote.fraMens.Pos := 0;
   end;

   if sMsg <> '' then
      frmCadTransfRenVarLote.fraMens.Mes := sMsg;

   Application.ProcessMessages;
end;


procedure TfrmCadTransfRenVarLote.FormResize(Sender: TObject);
begin
   inherited;
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);
   Application.ProcessMessages;
end;

procedure TfrmCadTransfRenVarLote.sbtnApagarClick(Sender: TObject);
var sBoleta: String;
begin
   FormResize(Self);
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   if not CtrlInvContab.TestaPeriodo(qry.FieldByName('DATAOPERACAO').AsString, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   Try
      if (MsgDlg('Serão excluídas todas as Operações desta Boleta !', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
         CdsBoletasTRP.Data := CtrlRendaVariavel.BuscaOperBoletaTRCPlano(qry.FieldByName('NUMDOCUMENTO').AsString);
      if not CdsBoletasTRP.IsEmpty then
      begin
         try
            while not CdsBoletasTRP.EOF do
            begin
               if not dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               if not RendaVariavel.ExcluiBoleta(qry.FieldByName('NUMDOCUMENTO').AsString, true, false) then
                  Raise Exception.Create('Não foi possível excluir a Operção.');

               // Marca carteira Origem
               if not RendaVariavel.MarcarFlagReproc(qry.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     qry.FieldByName('IDPLANOPATROORIG').AsInteger,
                                                     qry.FieldByName('DATAOPERACAO').AsDateTime) then
                  Raise Exception.Create('Não foi possível marcar para Reprocessamento, a Carteira de Origem .');

               // Marca carteira Destino
               if not RendaVariavel.MarcarFlagReproc(qry.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     qry.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     qry.FieldByName('IDPLANOPATRODEST').AsInteger,
                                                     qry.FieldByName('DATAOPERACAO').AsDateTime) then
                  Raise Exception.Create('Não foi possível marcar para Reprocessamento, a Carteira de Destino .');

               CdsBoletasTRP.Next;
            end;

            CdsBoletasTRP.Data := CtrlRendaVariavel.BuscaOperBoletaTRCPlano(qry.FieldByName('NUMDOCUMENTO').AsString);
            if CdsBoletasTRP.IsEmpty then
            begin
               // Exclui a Boleta
               with dtmOperComum.qryAuxiliar do
               begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'DELETE FROM BOLETA WHERE IDBOLETA = ' + QuotedStr(qry.FieldByName('NUMDOCUMENTO').AsString);
                  ExecSQL;
                  Close;
               end;
            end;

            if DtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

         Except on E: Exception do
            begin
               if DtmBaseDados.dbBaseDados.InTransaction then
                  DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg(E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
            end;
         end;
      end;
   finally
      qry.Close;
      qry.Open;
      qry.EnableControls;
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TfrmCadTransfRenVarLote.SelBoleta(sBoleta: String);
begin
   OperComum.LimpaParametros(qry);
   if sBoleta <> '' then
      qry.ParamByName('NUMDOCUMENTO').AsString := sBoleta;
   qry.Open;
   pnlFundo.BringToFront;
   sbtnFiltrar.Visible := False;
end;

procedure TfrmCadTransfRenVarLote.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      qry.Locate('NUMDOCUMENTO', MontaSelect.ValoresChave[1], [])
   else
      SelBoleta('');
end;

procedure TfrmCadTransfRenVarLote.sbtnFiltrarClick(Sender: TObject);
var iInvestimento, iResp : Integer;
    dDataSaldo : TDateTime;
    fPU: Double;
begin
   inherited;
   CdsSldTRCPlanoSintetico.Close;
   if Not ValidaFiltros then
      Exit;

   try //Finally
      try //Except
         fraMens.Mostra;
         fraMens.Mes := 'Buscando Investimentos a transferir...';

         iInvestimento := -1;
         if Trim(dblkInvestimento.Text) <> '' then
            iInvestimento := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

         dDataSaldo := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dbDtaOperacao.Text),-1,1,'',True,False,False);

         CdsSldTRCPlanoSintetico.Data := CtrlRendaVariavel.BuscaSldTRCPlanoSintetico(dDataSaldo,
                                                                                     iInvestimento,
                                                                                     qryPlanoPatroOrig.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                                     qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger);

         fraMens.Max := CdsSldTRCPlanoSintetico.RecordCount;  
         fraMens.Pos := 0;
         while not CdsSldTRCPlanoSintetico.Eof do
         begin
            fraMens.Mes := 'Preparando percentuais de ' + #13 + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString;

            if RendaVariavel.VerificaMarcado(qryPlanoPatroOrigIDPLANPREVCTBPATR.AsInteger,
                                             qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger) then
            begin
               iResp := OperComum.InvMsgBox('O Investimento ' + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString+ #13 +
                                            'está marcado para reprocessamento.',
                                             mtConfirmation, 'Mensagem do Sistema', [mbYes,mbNo],
                                            '&Despreza;&Cancela');
               if iResp = mrNo then
                  Raise Exception.Create('Transferência Cancelada pelo Usuário')
               else if iResp = mrYes then
               begin
                  fraMens.Incrementa;
                  CdsSldTRCPlanoSintetico.Delete;
                  Application.ProcessMessages;
                  Continue;
               end;
            end;

            CdsSldTRCPlanoSintetico.Edit;
            CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime     := dbDtaOperacao.Date;
            CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat     := redtPercentual.Value;
            CdsSldTRCPlanoSintetico.FieldByName('QTDTRANSFERIDO').AsFloat      := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('SALDOQTDEINVCART').AsFloat * (redtPercentual.Value / 100), 0);
            fPU := OperComum.DivValorZero(CdsSldTRCPlanoSintetico.FieldByName('SALDOVLRINVCART').AsFloat,
                                          CdsSldTRCPlanoSintetico.FieldByName('SALDOQTDEINVCART').AsFloat);
            CdsSldTRCPlanoSintetico.FieldByName('VLRTRANSFERIDO').AsFloat      := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('QTDTRANSFERIDO').AsFloat * fPU, 2);
            CdsSldTRCPlanoSintetico.FieldByName('IDPLANPREVCTBDEST').AsInteger := qryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger;
            CdsSldTRCPlanoSintetico.Post;
            CdsSldTRCPlanoSintetico.Next;
            fraMens.Incrementa;
         end;
         CdsSldTRCPlanoSintetico.First;
         if CdsSldTRCPlanoSintetico.RecordCount > 0 then
            bbtnConfirmar.Enabled := True
         else
            bbtnConfirmar.Enabled := False;
      except
         On E: Exception do
         begin
            MsgDlg('Não foi Possível Efetuar esta Transferência' + #13 +
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            CdsSldTRCPlanoSintetico.Close;
         end;
      end;
   finally
      fraMens.Apaga;
   end
end;

procedure TfrmCadTransfRenVarLote.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   FreeAndNil(CtrlRendaVariavel);
end;

procedure TfrmCadTransfRenVarLote.dbgSaldosDblClick(Sender: TObject);
begin
  inherited;
  AlteraSaldo;
end;

procedure TfrmCadTransfRenVarLote.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CmeCadastro.AtualizaBotoes(Self);
end;

end.
