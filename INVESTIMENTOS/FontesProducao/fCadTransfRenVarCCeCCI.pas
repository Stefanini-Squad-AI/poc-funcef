//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_1
// Pendencia : 23346
// Desc      : Implementação da funcionalidade
//******************************************************************************
unit fCadTransfRenVarCCeCCI;

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
  TfrmCadTransfRenVarCCeCCI = class(TFrmCadastroGridCS)
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Bevel2: TBevel;
    pnlSaldos: TPanel;
    pnlDados: TPanel;
    dbgSaldos: TwwDBGrid;
    lblPlanoPatro: TLabel;
    dblkPlanPatro: TwwDBLookupCombo;
    lblOperTRCCCi: TLabel;
    dblkOperTRCCCI: TwwDBLookupCombo;
    lblCarteira: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    lblDtOperacao: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    lblPercentual: TLabel;
    redtPercentual: TRealEdit;
    pnlAltSaldos: TPanel;
    qryOperTRCCCI: TwwQuery;
    qryPlanoPatro: TwwQuery;
    qryCarteira: TwwQuery;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryInvestimento: TwwQuery;
    DsSldTRCCeCCCI: TwwDataSource;
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
    redtPercentualTransf: TDBRealEdit;
    redQtdCCTransf: TDBRealEdit;
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
    CdsSldTRCCCeCCI: TCMClientDataSet;
    sqlSldTRCCeCCCI: TCMSqlParams;
    CdsBoletasTRCCCeCCI: TCMClientDataSet;
    qryOperTRCCCIIDTIPOINVEST: TFloatField;
    qryOperTRCCCIIDTIPOOPERACAO: TFloatField;
    qryOperTRCCCIIDMERCADO: TFloatField;
    qryOperTRCCCICODTIPDOC: TFloatField;
    qryOperTRCCCIDESCTIPOOPERACAO: TStringField;
    qryOperTRCCCINATUREZAOPERACAO: TStringField;
    qryOperTRCCCITIPOCUSTODIA: TStringField;
    qryOperTRCCCIVENCIMENTO: TFloatField;
    qryOperTRCCCIFLGGERACONTAB: TFloatField;
    qryOperTRCCCIFLGGERACAPCAR: TFloatField;
    qryOperTRCCCIRECPAG: TStringField;
    qryOperTRCCCITIPCREDOR: TStringField;
    qryOperTRCCCIFLGGERACAF: TFloatField;
    qryOperTRCCCIFLGTRANSF: TStringField;
    qryOperTRCCCITRGDTINCLUSAO: TDateTimeField;
    qryOperTRCCCITRGUSERINCLUSAO: TStringField;
    qryOperTRCCCIFLGCORRET: TStringField;
    qryOperTRCCCIFLGORDMOVINV: TStringField;
    qryOperTRCCCIIDMOTIVOBLOQUEIO: TFloatField;
    qryOperTRCCCIFLGOPDIREITO: TStringField;
    qryOperTRCCCIFLGAGE: TStringField;
    qryOperTRCCCIFLGDATAEX: TStringField;
    qryOperTRCCCIFLGDATACOM: TStringField;
    qryOperTRCCCIFLGINVORIGEM: TStringField;
    qryOperTRCCCIFLGPERC: TStringField;
    qryOperTRCCCIFLGPARIDADE: TStringField;
    qryOperTRCCCIFLGPRZBOLSA: TStringField;
    qryOperTRCCCIFLGPRZEMP: TStringField;
    qryOperTRCCCIFLGATADEC: TStringField;
    qryOperTRCCCIFLGFORMAPAGREC: TStringField;
    qryOperTRCCCIFLGDIVACAO: TStringField;
    qryOperTRCCCIFLGINIPAG: TStringField;
    qryOperTRCCCIFLGJUROS: TStringField;
    qryOperTRCCCIMOTBLOQCARTORIG: TFloatField;
    qryOperTRCCCIMOTBLOQCARTDEST: TFloatField;
    qryOperTRCCCITIPSALDOCARTORIG: TStringField;
    qryOperTRCCCITIPSALDOCARTDEST: TStringField;
    qryOperTRCCCIFLGTRATAIR: TStringField;
    qryOperTRCCCISIGLATIPOOPER: TStringField;
    qryOperTRCCCIFLGISENTOIR: TStringField;
    qryOperTRCCCIFLGGRAVAIRLITIGIO: TStringField;
    qryOperTRCCCIFLGOPGERENC: TStringField;
    qryOperTRCCCITIPOMOVTO: TStringField;
    qryOperTRCCCISTAATIVO: TStringField;
    qryOperTRCCCIFLGRENTABILIDADE: TStringField;
    qryOperTRCCCIFLGCONTAINVEST: TFloatField;
    qryOperTRCCCIFLGMOVCOTA: TStringField;
    qryOperTRCCCIFLGCOTARECDES: TStringField;
    qryOperTRCCCIFLGDATAVENCIMENTO: TStringField;
    qryOperTRCCCIFLGOBRIGAOBS: TStringField;
    qryIDOPERACAOINVEST: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryNUMDOCUMENTO: TStringField;
    qryQTDEOPERACAO: TFloatField;
    qryDESCINVESTIMENTO: TStringField;
    qryIDOPERCUSTODIA: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryPLANOPATROORIG: TStringField;
    qryIDPLANOPATROORIG: TFloatField;
    Label1: TLabel;
    redQtdCCITransf: TDBRealEdit;
    CdsSldTRCCCeCCIDATAOPERACAO: TStringField;
    CdsSldTRCCCeCCIDESCCARTINVEST: TStringField;
    CdsSldTRCCCeCCIDESCINVESTIMENTO: TStringField;
    CdsSldTRCCCeCCIIDCARTEIRAINVEST: TFloatField;
    CdsSldTRCCCeCCIIDINVESTIMENTO: TFloatField;
    CdsSldTRCCCeCCIIDEMISSOR: TFloatField;
    CdsSldTRCCCeCCIIDPLANPREVCTBORIG: TFloatField;
    CdsSldTRCCCeCCISALDOQTDEINVCART: TFloatField;
    CdsSldTRCCCeCCISALDOQTDECCI: TFloatField;
    CdsSldTRCCCeCCISALDOQTDECC: TFloatField;
    CdsSldTRCCCeCCISALDOVLRINVCART: TFloatField;
    CdsSldTRCCCeCCIPERCTRANSFERIDO: TFloatField;
    CdsSldTRCCCeCCIQTDTRANSFERIDOCC: TFloatField;
    CdsSldTRCCCeCCIQTDTRANSFERIDOCCI: TFloatField;
    CdsSldTRCCCeCCISALDOQTDECCIATU: TFloatField;
    CdsSldTRCCCeCCISALDOQTDECCATU: TFloatField;
    qryDESCTIPOOPERACAO: TStringField;
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
    procedure DsSldTRCCeCCCIStateChange(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure redtPercentualTransfEnter(Sender: TObject);
    procedure redtPercentualTransfExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure redQtdCCTransfExit(Sender: TObject);
    procedure redQtdCCITransfExit(Sender: TObject);
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

  procedure AtualizaProgTRCCCeCCI(sMsg: String = ''; iMax: Integer = -1);

var
  frmCadTransfRenVarCCeCCI: TfrmCadTransfRenVarCCeCCI;
  fPercAnt: Double;

implementation

uses uMensErro, DBaseDados, UDataBase, URendaVariavel, UOperComum, UBibliotecaInvest,
  UDiasUteisInv, FPrincipal, uCtrlInvContab, dOperComum;

{$R *.DFM}

procedure TfrmCadTransfRenVarCCeCCI.sbtnInserirClick(Sender: TObject);
begin
//   inherited;
   pnlSaldos.BringToFront;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   DsSldTRCCeCCCIStateChange(Self);
   sbtnFiltrar.Visible := True;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := False;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := True;
   if dblkPlanPatro.CanFocus then
      dblkPlanPatro.SetFocus;
end;

procedure TfrmCadTransfRenVarCCeCCI.sbtnAlterarClick(Sender: TObject);
begin
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;
   inherited;
end;


procedure TfrmCadTransfRenVarCCeCCI.FormShow(Sender: TObject);
begin
  inherited;
  fraMens.Apaga;
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Cadastro';
  SelBoleta('');
end;

procedure TfrmCadTransfRenVarCCeCCI.FormCreate(Sender: TObject);
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

procedure TfrmCadTransfRenVarCCeCCI.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfRenVarCCeCCI.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmCadTransfRenVarCCeCCI.pmnuFixaColunasPopup(Sender: TObject);
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

procedure TfrmCadTransfRenVarCCeCCI.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols + 1;
end;

procedure TfrmCadTransfRenVarCCeCCI.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols - 1;
end;

procedure TfrmCadTransfRenVarCCeCCI.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := 0;
end;

procedure TfrmCadTransfRenVarCCeCCI.PintaGridZebrado(Sender: TObject; Field: TField; State:
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

procedure TfrmCadTransfRenVarCCeCCI.GridRefresh(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmCadTransfRenVarCCeCCI.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down then
  begin
     if CdsSldTRCCCeCCI.RecordCount > 0 then
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

procedure TfrmCadTransfRenVarCCeCCI.bbtnCancelarClick(Sender: TObject);
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

function TfrmCadTransfRenVarCCeCCI.ValidaFiltros: Boolean;
begin
   Result := False;
   if Trim(dblkPlanPatro.Text) = '' then
   begin
      MsgDlg('Informe o Plano / Patro.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkOperTRCCCI.Text) = '' then
   begin
      MsgDlg('Informe o Tipo de Operação.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkCarteira.Text) = '' then
   begin
      MsgDlg('Informe a Carteira.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;
   if Trim(dbDtaOperacao.Text) = '' then
   begin
      MsgDlg('Informe a Data da Transferência.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;
   if redtPercentual.Value = 0 then
   begin
      MsgDlg('Informe o Percentual a Transferir.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;
   if redtPercentual.Value > 100 then
   begin
      MsgDlg('O Percentual não pode ser maio que 100%.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      redtPercentual.Value := 100;
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadTransfRenVarCCeCCI.DsSldTRCCeCCCIStateChange(Sender: TObject);
begin
   inherited;
   if CdsSldTRCCCeCCI.Active then
   begin
      if CdsSldTRCCCeCCI.RecordCount > 0 then
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

function TfrmCadTransfRenVarCCeCCI.AlteraSaldo: Boolean;
begin
   try
      CdsSldTRCCCeCCI.Edit;
      pnlAltSaldos.BringToFront;
      pnlAltSaldos.Enabled := True;
      bbtnConfirmar.Enabled := False;
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
   except
      CdsSldTRCCCeCCI.Cancel;
      pnlAltSaldos.SendToBack;
      pnlAltSaldos.Enabled := False;
      bbtnConfirmar.Enabled := True;
   end;
end;

function TfrmCadTransfRenVarCCeCCI.ExcluiSaldo: Boolean;
begin
   if MsgDlg('Retira esta aplicação deste Lote de Transferência?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CdsSldTRCCCeCCI.Delete;
end;

procedure TfrmCadTransfRenVarCCeCCI.mnuAlterarClick(Sender: TObject);
begin
  inherited;
   AlteraSaldo;
   fPercAnt := 0;
   if qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger = -162 then // TRC CC para CCI
   begin
      redQtdCCTransf.Enabled := True;
      redQtdCCITransf.Enabled := False;
   end
   else if qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger = -163 then // TRC CCI para CC
   begin
      redQtdCCTransf.Enabled := False;
      redQtdCCITransf.Enabled := True;
   end;
end;

procedure TfrmCadTransfRenVarCCeCCI.mnuExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluiSaldo;
end;

procedure TfrmCadTransfRenVarCCeCCI.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   if CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat > 100 then
   begin
      MsgDlg('Não é possível transferir mais de cem por cento do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
      Exit;
   end;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfRenVarCCeCCI.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CdsSldTRCCCeCCI.Cancel;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfRenVarCCeCCI.redtPercentualTransfEnter(Sender: TObject);
begin
   inherited;
   fPercAnt := CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat;
end;

procedure TfrmCadTransfRenVarCCeCCI.redtPercentualTransfExit(Sender: TObject);
begin
   inherited;
   if (fPercAnt > 100) or (CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat > 100) then
   begin
      MsgDlg('O percentual não pode ser maior que 100 %.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat := 100;
      Exit;
   end
   else if (fPercAnt = 0) or (CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat = 0) then
   begin
      MsgDlg('O percentual não pode ser igual a 0 %.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat := 100;
      Exit;
   end
   else if fPercAnt <> CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat then
   begin
      // Recalcula os valores
      if qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger = -162 then // TRC CC para CCI
      begin
         CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCC').AsFloat  := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat * (redtPercentualTransf.Value / 100), 0);
         CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCATU').AsFloat    := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat - CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCC').AsFloat ,0);
         CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCIATU').AsFloat   := CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat + CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCATU').AsFloat;
      end
      else if qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger = -163 then // TRC CCI para CC
      begin
         CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCCI').AsFloat := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat * (redtPercentualTransf.Value / 100), 0);
         CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCIATU').AsFloat   := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat - CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCCI').AsFloat,0);
         CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCATU').AsFloat    := CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat + CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCIATU').AsFloat;
      end;
   end;
end;

procedure TfrmCadTransfRenVarCCeCCI.bbtnConfirmarClick(Sender: TObject);
var fMax, fPos, iResp: Integer;
   sBoleta, sInvestimento: String;
   iTipoConta : Integer;
begin
//  inherited;

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
         fraMens.Max := CdsSldTRCCCeCCI.RecordCount;
         fMax := fraMens.Max;
         fraMens.Pos := 0;

         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Gera Boleta única para todo o Lote
         sBoleta := 'RV-'+Copy(dbDtaOperacao.Text,9,2)+'/'+FormatFloat('0000',
                     LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(dbDtaOperacao.Text,9,2)));

         fraMens.Mes := 'Transferindo ' + CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsString + '% de ' + CdsSldTRCCCeCCI.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                        'Buscando Saldos para Transferir.';

         // Seta o Frame para ser atualizado na rotina de transferência
            fPos := fraMens.Pos;
            uRendaVariavel.AtualizaProcFech := AtualizaProgTRCCCeCCI;

         // Transfere o título
         if not RendaVariavel.TransfEntreCCeCCI(CdsSldTRCCCeCCI,
                                                qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                sBoleta, memObs.Text) then
             Raise Exception.Create('');

         // Volta o controle do frame para a tela
            uRendaVariavel.AtualizaProcFech := nil;
            fraMens.Mostra;
            fraMens.Max := fMax;
            fraMens.Pos := fPos;

         fraMens.Incrementa;

         MsgDlg('Operação concluída com sucesso.', 'Mensagem do Sistema', mtInformation,[mbOk],0);
         DtmBaseDados.dbBaseDados.Commit;

         // Prepara o ambiente para consulta de transferências
         pnlSaldos.SendToBack;
         DsSldTRCCeCCCIStateChange(Self);
         sbtnFiltrar.Visible := False;
         CmeCadastro.AtualizaBotoes(Self);
         // Reseleciona as operações do grid de consulta
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
      FormResize(Self);
   end;

end;

procedure AtualizaProgTRCCCeCCI(sMsg: String = ''; iMax: Integer = -1);
begin
   if iMax = -2 then
      frmCadTransfRenVarCCeCCI.fraMens.Apaga
   else if iMax > 0 then
      frmCadTransfRenVarCCeCCI.fraMens.Mostra;

   if sMsg <> '' then
      frmCadTransfRenVarCCeCCI.fraMens.Mes := sMsg;

   if iMax > 0 then
   begin
      frmCadTransfRenVarCCeCCI.fraMens.Max := iMax;
      frmCadTransfRenVarCCeCCI.fraMens.Min := 0;
      frmCadTransfRenVarCCeCCI.fraMens.Pos := 0;
   end
   else
   if iMax = -1 then
      frmCadTransfRenVarCCeCCI.fraMens.Incrementa;

   Application.ProcessMessages;
end;


procedure TfrmCadTransfRenVarCCeCCI.FormResize(Sender: TObject);
begin
   inherited;
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);
   Application.ProcessMessages;
end;

procedure TfrmCadTransfRenVarCCeCCI.sbtnApagarClick(Sender: TObject);
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
      if (MsgDlg('Exclui todas as Operações desta Boleta?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
         CdsBoletasTRCCCeCCI.Data := CtrlRendaVariavel.BuscaOperBoletaTRCCCeCCI(qry.FieldByName('NUMDOCUMENTO').AsString);

         if not CdsBoletasTRCCCeCCI.IsEmpty then
         begin
            try
               while not CdsBoletasTRCCCeCCI.EOF do
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

                  CdsBoletasTRCCCeCCI.Next;
               end;
               if CdsBoletasTRCCCeCCI.IsEmpty then
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
      end;
   finally
      qry.Close;
      qry.Open;
      qry.EnableControls;
      CmeCadastro.AtualizaBotoes(Self);
   end;
//   inherited;
end;

procedure TfrmCadTransfRenVarCCeCCI.SelBoleta(sBoleta: String);
begin
   OperComum.LimpaParametros(qry);
   if sBoleta <> '' then
      qry.ParamByName('NUMDOCUMENTO').AsString := sBoleta;
   qry.Open;
   pnlFundo.BringToFront;
   sbtnFiltrar.Visible := False;
end;

procedure TfrmCadTransfRenVarCCeCCI.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      qry.Locate('NUMDOCUMENTO', MontaSelect.ValoresChave[1], [])
   else
      SelBoleta('');
end;

procedure TfrmCadTransfRenVarCCeCCI.sbtnFiltrarClick(Sender: TObject);
var
   iInvestimento : Integer;
begin
   inherited;
   CdsSldTRCCCeCCI.Close;
   if Not ValidaFiltros then
      Exit;

   try
      fraMens.Mostra;
      fraMens.Mes := 'Buscando Investimentos a transferir...';

      iInvestimento := -1;
      if Trim(dblkInvestimento.Text) <> '' then
         iInvestimento := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

      CdsSldTRCCCeCCI.Data := CtrlRendaVariavel.BuscaSldTRCCCeCCISintetico(StrToDate(dbDtaOperacao.Text),
                                                                           qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                           qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                           qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger,
                                                                           iInvestimento);
      fraMens.Max := CdsSldTRCCCeCCI.RecordCount;
      fraMens.Pos := 0;
      while not CdsSldTRCCCeCCI.Eof do
      begin
         fraMens.Mes := 'Preparando percentuais de ' + #13 + CdsSldTRCCCeCCI.FieldByName('DESCINVESTIMENTO').AsString;
         CdsSldTRCCCeCCI.Edit;
         CdsSldTRCCCeCCI.FieldByName('DATAOPERACAO').AsString     := dbDtaOperacao.text;
         CdsSldTRCCCeCCI.FieldByName('PERCTRANSFERIDO').AsFloat     := redtPercentual.Value;
         if qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger = -162 then // TRC CC para CCI
         begin
            CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCC').AsFloat  := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat * (redtPercentual.Value / 100), 0);
            CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCCI').AsFloat := 0;
            CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCATU').AsFloat    := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat - CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCC').AsFloat ,0);
            CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCIATU').AsFloat   := CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat + CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCC').AsFloat;
         end
         else if qryOperTRCCCI.FieldByName('IDTIPOOPERACAO').AsInteger = -163 then // TRC CCI para CC
         begin
            CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCCI').AsFloat := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat * (redtPercentual.Value / 100), 0);
            CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCC').AsFloat  := 0;
            CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCIATU').AsFloat   := RoundCM(CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat - CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCCI').AsFloat,0);
            CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCATU').AsFloat    := CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat + CdsSldTRCCCeCCI.FieldByName('QTDTRANSFERIDOCCI').AsFloat;
         end;

         CdsSldTRCCCeCCI.Post;
         CdsSldTRCCCeCCI.Next;
         fraMens.Incrementa;
      end;
      CdsSldTRCCCeCCI.First;
      if CdsSldTRCCCeCCI.RecordCount > 0 then
         bbtnConfirmar.Enabled := True
      else
         bbtnConfirmar.Enabled := False;
   finally
      fraMens.Apaga;
   end;
end;

procedure TfrmCadTransfRenVarCCeCCI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   FreeAndNil(CtrlRendaVariavel);
end;

procedure TfrmCadTransfRenVarCCeCCI.redQtdCCTransfExit(Sender: TObject);
begin
  inherited;
   if redQtdCCTransf.Value > CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat then
      redQtdCCTransf.Value := CdsSldTRCCCeCCI.FieldByName('SALDOQTDECC').AsFloat;
end;

procedure TfrmCadTransfRenVarCCeCCI.redQtdCCITransfExit(Sender: TObject);
begin
  inherited;
   if redQtdCCITransf.Value > CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat then
      redQtdCCITransf.Value := CdsSldTRCCCeCCI.FieldByName('SALDOQTDECCI').AsFloat;
end;

end.
