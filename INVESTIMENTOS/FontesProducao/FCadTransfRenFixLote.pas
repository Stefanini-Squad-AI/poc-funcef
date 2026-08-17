//******************************************************************************
// Rotina     : qrySaldosATransf
// SOL        : 99827
// Kintana    : 439933
// Data       : 30/10/2008
// Responsável: Ricardo Cristiano
// Descrição  : Otimização do SQL.
//******************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_9
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory - Retirada dos TField Persistentes
//                             Substituição por FieldByName
//******************************************************************************
// Data      : 05/03/2007
// Código    : AL_8
// Pendencia : 24636
// SOL       : 54881
// Desc      : Acerto na passagem do PU de Mercado
//******************************************************************************
// Data      : 01/03/2007
// Código    : AL_7
// Desc      : Calcular Poupança pelo Valor
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_6
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//             Conforme o Alano, retirar a critica de trc lancadas no dia e utili
//             zar sempre o saldo do dia anterior
//******************************************************************************
// Data      : 30/11/2006
// Código    : AL_5
// Pendencia : 23782
// Desc      : Inclusão do Campo Percentual no Grid de Operações
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_4
// Pendencia : 23861
// SOL       : 43516
// Desc      : Ajustes no Calculo de Valores e arredondamentos para titulos que não
//             usam a quantidade
//******************************************************************************
// Data      : 14/09/2006
// Código    : AL_3
// Desc      : Ajustes no Calculo de Valores e arredondamentos
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_2
// Pendencia : 23008
// Desc      : Acerto na filtragem pela Aplicação
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_1
// Pendencia : 23008
// Desc      : Alteração para gerar a Transf com o saldo do dia anterior
//******************************************************************************

unit FCadTransfRenFixLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, ExtCtrls, fcLabel, Db, DBTables, Wwquery, CmEventosCadastro,
  ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, faMensagem,
  Menus, uCMMath;

type
  TfrmCadTransfRenFixLote = class(TFrmCadastroGridCS)
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
    lblClasse: TLabel;
    dblkClasse: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    lblDtOperacao: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    lblPercentual: TLabel;
    redtPercentual: TRealEdit;
    pnlAltSaldos: TPanel;
    qryPlanoPatroOrig: TwwQuery;
    qryPlanoPatroDestino: TwwQuery;
    qryClasseTit: TwwQuery;
    qryClasseTitIDCLASSETIT: TFloatField;
    qryClasseTitDESCCLASSETIT: TStringField;
    qryPlanoPatroOrigIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroOrigIDPLANOPREV: TFloatField;
    qryPlanoPatroOrigIDPATRO: TFloatField;
    qryPlanoPatroOrigPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroDestinoIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroDestinoIDPLANOPREV: TFloatField;
    qryPlanoPatroDestinoIDPATRO: TFloatField;
    qryPlanoPatroDestinoPLANPRVCONTABPATRO: TStringField;
    qryInvestimento: TwwQuery;
    qrySaldosATransf: TwwQuery;
    dsSaldosATransf: TwwDataSource;
    qrySaldosATransfDESCCLASSETIT: TStringField;
    qrySaldosATransfDESCINVESTIMENTO: TStringField;
    qrySaldosATransfDATAOPERACAO: TDateTimeField;
    qrySaldosATransfVENCOPERACAO: TDateTimeField;
    qrySaldosATransfSALDOQTDHISTRENFI: TFloatField;
    qrySaldosATransfSALDOVLRHISTRENFI: TFloatField;
    qrySaldosATransfPERCTRANSFERIDO: TFloatField;
    qrySaldosATransfQTDTRANSFERIDO: TFloatField;
    qrySaldosATransfVLRTRANSFERIDO: TFloatField;
    qrySaldosATransfDATAHISTRENFIX: TDateTimeField;
    qrySaldosATransfQTDEOPERACAO: TFloatField;
    qrySaldosATransfVLROPERACAO: TFloatField;
    qrySaldosATransfIDEMISSOR: TFloatField;
    qrySaldosATransfIDINVESTIMENTO: TFloatField;
    qrySaldosATransfIDCARTEIRAINVEST: TFloatField;
    qrySaldosATransfIDFORCLI: TFloatField;
    qrySaldosATransfIDCUSTODIANTE: TFloatField;
    qrySaldosATransfDATAEMISSAO: TDateTimeField;
    qrySaldosATransfPUEMISSAO: TFloatField;
    qrySaldosATransfIDOPERRENFIXAPLIC: TFloatField;
    qrySaldosATransfIDUSUARIO: TFloatField;
    qrySaldosATransfIDCLASSETIT: TFloatField;
    qrySaldosATransfCARENCIA: TFloatField;
    qrySaldosATransfNVLOPIDCLASSRISCORENFIX0: TFloatField;
    qrySaldosATransfFLGCARTHIPO: TStringField;
    qrySaldosATransfQTDCARTHIPO: TFloatField;
    qrySaldosATransfFLGNEGOCIACAO: TStringField;
    qrySaldosATransfIDPLANPREVCTBPATR: TFloatField;
    qrySaldosATransfFLGOPERIMPLANT: TStringField;
    qrySaldosATransfMOECODIGO: TFloatField;
    qrySaldosATransfDATALEILAO: TDateTimeField;
    qrySaldosATransfPUOPERACAO: TFloatField;
    qrySaldosATransfPUMERCADO: TFloatField;
    qrySaldosATransfIDHISTRENFIX: TFloatField;
    fraMens: TfraMensagem;
    sbtnFiltrar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    pmnuFixaColunas: TPopupMenu;
    FixarColuna1: TMenuItem;
    LiberarColuna1: TMenuItem;
    N1: TMenuItem;
    LiberaTodasasColunas1: TMenuItem;
    qryBOLETA: TStringField;
    qryPLANOPATROORIG2: TStringField;
    qryPLANOPATRODEST: TStringField;
    qryDESCCLASSETIT: TStringField;
    qryDESCINVESTIMENTO: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryVENCOPERACAO: TDateTimeField;
    qryQTDEOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryIDPLANPREVCTBPATR_1: TFloatField;
    qryIDCLASSETIT: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    lblPercentualTransf: TLabel;
    lblQtdTransf: TLabel;
    lblVlrTransf: TLabel;
    updSaldos: TUpdateSQL;
    redtPercentualTransf: TDBRealEdit;
    redQtdTransf: TDBRealEdit;
    redVlrTransf: TDBRealEdit;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoQTDEOPERACAO: TFloatField;
    qryInvestimentoPUOPERACAO: TFloatField;
    qryInvestimentoVLROPERACAO: TFloatField;
    qryInvestimentoVENCOPERACAO: TDateTimeField;
    qryInvestimentoIDOPERRENFIXAPLIC: TFloatField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoIDCLASSETIT: TFloatField;
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
    Label1: TLabel;
    qryInvestimentoFLGUSAQTD: TStringField;
    qryPERCTRANSF: TFloatField;
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
    procedure dblkClasseEnter(Sender: TObject);
    procedure dblkClasseExit(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure redtPercentualTransfEnter(Sender: TObject);
    procedure redtPercentualTransfExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }

    procedure SelBoleta(sBoleta: String);
    function ValidaFiltros: Boolean;
    function AlteraSaldo: Boolean;
    function ExcluiSaldo: Boolean;
  public
    { Public declarations }
  end;

  procedure AtualizaProgTRLote(sMsg: String = ''; iMax: Integer = -1);

var
  frmCadTransfRenFixLote: TfrmCadTransfRenFixLote;
  iClasseAnt, iClasseAtu: Integer;
  fPercAnt: Double;

implementation

uses uMensErro, DBaseDados, UDataBase, URendaFixa, FPrincipal, UOperComum,
  UBibliotecaInvest, dRendaFixa;

{$R *.DFM}

procedure TfrmCadTransfRenFixLote.sbtnInserirClick(Sender: TObject);
begin
   if RendaFixa.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;
//   inherited;
   pnlSaldos.BringToFront;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   OperComum.LimpaParametros(qrySaldosATransf);
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

procedure TfrmCadTransfRenFixLote.sbtnAlterarClick(Sender: TObject);
begin
   if RendaFixa.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;
   inherited;
end;

procedure TfrmCadTransfRenFixLote.sbtnApagarClick(Sender: TObject);
var sBoleta: String;
begin
   FormResize(Self);
   if RendaFixa.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   try
      qry.DisableControls;
      if qryDATAOPERACAO.AsDateTime >= pRPI.DATAULTFECHRF then
      begin
         // Verificar se realmente é preciso excluir todas as transferências do papel na data
         // O usuário pode ter transferido o título para mais de um plano destino.
         if (MsgDlg('A Exclusão desta Operação Implica na Exclusão de TODAS as Transferências deste Título nesta Data' + #13 +
                    'Confirma a Exclusão?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
            Exit;
      end
      else
      begin
         if (MsgDlg('A Exclusão desta Operação Implica na Exclusão de TODAS as Transferências ' + #13 +
                    'deste Título nesta Data e no Reprocessamento Automático destes Títulos ' + #13 +
                    'a Partir do Dia ' + qryDATAOPERACAO.AsString + #13 +
                    'Confirma a Exclusão?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
            Exit;
      end;

      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         uRendaFixa.AtualizaProcFech := AtualizaProgTRLote;

         if not RendaFixa.ExcluiTransferencia(qryBOLETA.AsString) then
            Raise Exception.Create('Não foi possível excluir esta transferência');

         uRendaFixa.AtualizaProcFech := nil;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

      except
      on E: Exception do
         begin
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
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

procedure TfrmCadTransfRenFixLote.FormShow(Sender: TObject);
begin
  inherited;
  fraMens.Apaga;
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Cadastro';
  SelBoleta('');
end;

procedure TfrmCadTransfRenFixLote.FormCreate(Sender: TObject);
begin
   // Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
   inherited;
end;

procedure TfrmCadTransfRenFixLote.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfRenFixLote.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmCadTransfRenFixLote.pmnuFixaColunasPopup(Sender: TObject);
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

procedure TfrmCadTransfRenFixLote.FixarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols + 1;
end;

procedure TfrmCadTransfRenFixLote.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols - 1;
end;

procedure TfrmCadTransfRenFixLote.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := 0;
end;

procedure TfrmCadTransfRenFixLote.PintaGridZebrado(Sender: TObject; Field: TField; State:
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

procedure TfrmCadTransfRenFixLote.GridRefresh(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadTransfRenFixLote.SelBoleta(sBoleta: String);
begin
   OperComum.LimpaParametros(qry);
   if sBoleta <> '' then
      qry.ParamByName('BOLETA').AsString := sBoleta;
   qry.Open;
   pnlFundo.BringToFront;
   sbtnFiltrar.Visible := False;
end;

procedure TfrmCadTransfRenFixLote.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      qry.Locate('BOLETA', MontaSelect.ValoresChave[4], [])
   //Ricardo Cristiano - 30/10/2008 - N. Sol 99827 -  N. Kintana 439933
   else if qry.IsEmpty then   
      SelBoleta('');
end;


procedure TfrmCadTransfRenFixLote.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down then
  begin
     if qrySaldosATransf.RecordCount > 0 then
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

procedure TfrmCadTransfRenFixLote.bbtnCancelarClick(Sender: TObject);
begin
   if sbtnInserir.Down then
   begin
      pnlSaldos.SendToBack;
      sbtnFiltrar.Visible := False;
      OperComum.LimpaParametros(qrySaldosATransf);
      FormResize(Self);

      CmeCadastro.AtualizaBotoes(Self);
   end
   else
     inherited;

end;

function TfrmCadTransfRenFixLote.ValidaFiltros: Boolean;
begin
   Result := False;
   if Trim(dblkPlanPatroO.Text) = '' then
   begin
      MsgDlg('Informe o Plano Origem.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkPlanPatroD.Text) = '' then
   begin
      MsgDlg('Informe o Plano Destino.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dbDtaOperacao.Text) = '' then
   begin
      MsgDlg('Informe a Data da Transferência.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if redtPercentual.Value = 0 then
   begin
      MsgDlg('Informe o Percentual a Transferir.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   Result := True;
end;

procedure TfrmCadTransfRenFixLote.sbtnFiltrarClick(Sender: TObject);
begin
   inherited;

   if Not ValidaFiltros then
      Exit;

   try
      fraMens.Mostra;
      fraMens.Mes := 'Buscando Investimentos a transferir...';
      //AL_6
      qrySaldosATransf.DisableControls;

      OperComum.LimpaParametros(qrySaldosATransf);
      //AL_1
      qrySaldosATransf.ParamByName('DATAHISTRENFIX').AsString := DateToStr(StrToDate(dbDtaOperacao.Text) -1);
      if Trim(dblkInvestimento.Text) <> '' then
         qrySaldosATransf.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      //AL_2
      if Trim(dblkInvestimento.Text) <> '' then
         qrySaldosATransf.ParamByName('IDOPERRENFIXAPLIC').AsInteger := qryInvestimentoIDOPERRENFIXAPLIC.AsInteger;
      qrySaldosATransf.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatroOrigIDPLANPREVCTBPATR.AsInteger;
      if Trim(dblkClasse.Text) <> '' then
         qrySaldosATransf.ParamByName('IDCLASSETIT').AsInteger := qryClasseTitIDCLASSETIT.AsInteger;
      qrySaldosATransf.Open;
      fraMens.Max := qrySaldosATransf.RecordCount;
      fraMens.Pos := 0;

      while not qrySaldosATransf.Eof do
      begin
         fraMens.Mes := 'Preparando percentuais de ' + #13 + qrySaldosATransfDESCINVESTIMENTO.AsString;
         qrySaldosATransf.Edit;
         qrySaldosATransfPERCTRANSFERIDO.AsFloat := redtPercentual.Value;

         //AL_8
         qrySaldosATransfPUMERCADO.AsFloat := (qrySaldosATransfSALDOVLRHISTRENFI.AsFloat / qrySaldosATransfSALDOQTDHISTRENFI.AsFloat);

         //AL_3 - Calcula novo valor da operação pela Qtd arredondada
         //AL_4
         //AL_7
         if (qrySaldosATransfIDCLASSETIT.AsInteger = pRPI.IDCLASSEPOUP) or
            (qrySaldosATransfIDCLASSETIT.AsInteger = pRPI.IDCLASSPOUPBLOQ) or
            (qryInvestimentoFLGUSAQTD.AsString = 'N') then
         begin
            redQtdTransf.DecDigits := 9;

            qrySaldosATransfVLRTRANSFERIDO.AsFloat := RoundCM(OperComum.DivValorZero((redtPercentual.Value * qrySaldosATransfSALDOVLRHISTRENFI.AsFloat),100),2);
            qrySaldosATransfQTDTRANSFERIDO.AsFloat := RoundCM(OperComum.DivValorZero((qrySaldosATransfVLRTRANSFERIDO.AsFloat * qrySaldosATransfSALDOQTDHISTRENFI.AsFloat),qrySaldosATransfSALDOVLRHISTRENFI.AsFloat),9);
         end
         else
         begin
            redQtdTransf.DecDigits := 0;
            qrySaldosATransfQTDTRANSFERIDO.AsFloat := RoundCM(qrySaldosATransfSALDOQTDHISTRENFI.AsFloat * (redtPercentual.Value / 100), 0);
            qrySaldosATransfVLRTRANSFERIDO.AsFloat := RoundCM(qrySaldosATransfQTDTRANSFERIDO.AsFloat * qrySaldosATransfPUMERCADO.AsFloat, 2);
         end;

         qrySaldosATransf.Post;
         qrySaldosATransf.Next;
         fraMens.Incrementa;
      end;
      qrySaldosATransf.First;

      //AL_6
      qrySaldosATransf.EnableControls;

      if qrySaldosATransf.RecordCount > 0 then
         bbtnConfirmar.Enabled := True
      else
         bbtnConfirmar.Enabled := False;
   finally
      fraMens.Apaga;
   end
end;

procedure TfrmCadTransfRenFixLote.dsSaldosATransfStateChange(Sender: TObject);
begin
   inherited;
   if qrySaldosATransf.Active then
   begin
      if qrySaldosATransf.RecordCount > 0 then
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

procedure TfrmCadTransfRenFixLote.dblkClasseEnter(Sender: TObject);
begin
  inherited;
  if Trim(dblkClasse.Text) <> '' then
     iClasseAnt := qryClasseTitIDCLASSETIT.AsInteger
  else
     iClasseAnt := 0;
end;

procedure TfrmCadTransfRenFixLote.dblkClasseExit(Sender: TObject);
begin
  inherited;
  if Trim(dblkClasse.Text) <> '' then
     iClasseAtu := qryClasseTitIDCLASSETIT.AsInteger
  else
     iClasseAtu := 0;

  if (iClasseAnt <> iClasseAtu) then
  begin
     OperComum.LimpaParametros(qryInvestimento);
     if iClasseAtu <> 0 then
        qryInvestimento.ParamByName('IDCLASSETIT').AsInteger := iClasseAtu;
     qryInvestimento.Open;
  end;

end;

function TfrmCadTransfRenFixLote.AlteraSaldo: Boolean;
begin
   try
      qrySaldosATransf.Edit;
      pnlAltSaldos.BringToFront;
      pnlAltSaldos.Enabled := True;
      bbtnConfirmar.Enabled := False;
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
   except
      qrySaldosATransf.Cancel;
      pnlAltSaldos.SendToBack;
      pnlAltSaldos.Enabled := False;
      bbtnConfirmar.Enabled := True;
   end;
end;

function TfrmCadTransfRenFixLote.ExcluiSaldo: Boolean;
begin
   if MsgDlg('Retira esta aplicação deste Lote de Transferência?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      qrySaldosATransf.Delete;
end;

procedure TfrmCadTransfRenFixLote.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  AlteraSaldo;
end;

procedure TfrmCadTransfRenFixLote.mnuExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluiSaldo;
end;

procedure TfrmCadTransfRenFixLote.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   if qrySaldosATransfPERCTRANSFERIDO.AsFloat > 100 then
   begin
      MsgDlg('Não é possível transferir mais de cem por cento do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
      Exit;
   end;
   if qrySaldosATransfQTDTRANSFERIDO.AsFloat > qrySaldosATransfSALDOQTDHISTRENFI.AsFloat then
   begin
      MsgDlg('Não é possível transferir mais que o saldo do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redQtdTransf.CanFocus then
         redQtdTransf.SetFocus;
      Exit;
   end;
   if qrySaldosATransfVLRTRANSFERIDO.AsFloat > qrySaldosATransfSALDOVLRHISTRENFI.AsFloat then
   begin
      MsgDlg('Não é possível transferir mais que o saldo do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redVlrTransf.CanFocus then
         redVlrTransf.SetFocus;
      Exit;
   end;
   //AL_8
   if qrySaldosATransfQTDTRANSFERIDO.AsFloat = 0 then
   begin
      MsgDlg('Não é possível transferir Quantidade zerada.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redQtdTransf.CanFocus then
         redQtdTransf.SetFocus;
      Exit;
   end;
   if qrySaldosATransfVLRTRANSFERIDO.AsFloat = 0 then
   begin
      MsgDlg('Não é possível transferir Valor zerado.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redVlrTransf.CanFocus then
         redVlrTransf.SetFocus;
      Exit;
   end;

   qrySaldosATransf.Post;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfRenFixLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  qrySaldosATransf.Cancel;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfRenFixLote.redtPercentualTransfEnter(Sender: TObject);
begin
   inherited;
   fPercAnt := qrySaldosATransfPERCTRANSFERIDO.AsFloat;
end;

procedure TfrmCadTransfRenFixLote.redtPercentualTransfExit(Sender: TObject);
begin
   inherited;
   if fPercAnt <> qrySaldosATransfPERCTRANSFERIDO.AsFloat then
   begin
     //AL_8
      qrySaldosATransfPUMERCADO.AsFloat := (qrySaldosATransfSALDOVLRHISTRENFI.AsFloat / qrySaldosATransfSALDOQTDHISTRENFI.AsFloat);
      //AL_7
      if (qrySaldosATransfIDCLASSETIT.AsInteger = pRPI.IDCLASSEPOUP) or
         (qrySaldosATransfIDCLASSETIT.AsInteger = pRPI.IDCLASSPOUPBLOQ) or
         (qryInvestimentoFLGUSAQTD.AsString = 'N') then
      begin
         qrySaldosATransfVLRTRANSFERIDO.AsFloat := RoundCM(OperComum.DivValorZero((qrySaldosATransfPERCTRANSFERIDO.AsFloat * qrySaldosATransfSALDOVLRHISTRENFI.AsFloat),100),2);
         qrySaldosATransfQTDTRANSFERIDO.AsFloat := RoundCM(OperComum.DivValorZero((qrySaldosATransfVLRTRANSFERIDO.AsFloat * qrySaldosATransfSALDOQTDHISTRENFI.AsFloat),qrySaldosATransfSALDOVLRHISTRENFI.AsFloat),9);
      end
      else
      begin
         qrySaldosATransfQTDTRANSFERIDO.AsFloat := RoundCM(qrySaldosATransfSALDOQTDHISTRENFI.AsFloat * (qrySaldosATransfPERCTRANSFERIDO.AsFloat / 100), 0);
         qrySaldosATransfVLRTRANSFERIDO.AsFloat := RoundCM(qrySaldosATransfQTDTRANSFERIDO.AsFloat * qrySaldosATransfPUMERCADO.AsFloat, 2);
      end;
   end;
end;

procedure TfrmCadTransfRenFixLote.bbtnConfirmarClick(Sender: TObject);
var fMax, fPos, iResp: Integer;
   sBoleta: String;
begin
//  inherited;
   if MsgDlg('Confirma a transferência dos títulos selecionados?.', 'Mensagem do Sistema', mtConfirmation,[mbYes, mbNo],0) = mrNo then
      Exit;
   try
      try
         // Prepara o ambiente para transferir
         fraMens.Mostra;
         fraMens.Max := qrySaldosATransf.RecordCount;
         fMax := fraMens.Max;
         fraMens.Pos := 0;

         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Gera Boleta única para todo o Lote
         sBoleta := RendaFixa.GeraNumBoleta(dbDtaOperacao.DateTime, -1);


         // Transfere cada posição selecionada
         while not qrySaldosATransf.Eof do
         begin
            fraMens.Mes := 'Transferindo ' + qrySaldosATransfPERCTRANSFERIDO.AsString + '% de ' + qrySaldosATransfDESCINVESTIMENTO.AsString + #13 +
                           'Verificando Operações sem Histórico na data.';

            // Não permite resgate de títulos marcados para reprocessamento
            if RendaFixa.MarcadoReproc(qrySaldosATransfIDINVESTIMENTO.AsInteger,
                                       qrySaldosATransfIDOPERRENFIXAPLIC.AsInteger) then
               Raise Exception.Create('Não é possível Transferir um Investimento ' + #13 +
                                      'marcado para Reprocessamento.'+#13+
                                      'Execute primeiramente o Reprocessamento do Investimento.');

            // Verifica se existem operações sem históricos no dia da transferência
            if not RendaFixa.BuscaHistOperNoDia(qrySaldosATransfDATAHISTRENFIX.AsDateTime,
                                                qrySaldosATransfIDINVESTIMENTO.AsInteger,
                                                qrySaldosATransfIDOPERRENFIXAPLIC.AsInteger) then
               Raise Exception.Create('Existem Operações deste Investimento sem Histórico no dia.'+#13+
                                      'Execute o Reprocessamento do Investimento!');

            fraMens.Mes := 'Transferindo ' + qrySaldosATransfPERCTRANSFERIDO.AsString + '% de ' + qrySaldosATransfDESCINVESTIMENTO.AsString + #13 +
                           'Buscando Saldos para Transferir.';

            // Traz os Saldos de: - Data, Investimento, Aplicação Selecionados
            //AL_6
            RendaFixa.BuscaSaldos(qrySaldosATransfDATAHISTRENFIX.AsDateTime,
                      -1,
                      qrySaldosATransfIDINVESTIMENTO.AsInteger,
                      qrySaldosATransfIDOPERRENFIXAPLIC.AsInteger);

            // Localiza o Item Correção (Único do tipo 'M' - Moeda)
            DMRendaFixa.qryBuscaSaldosItems.Locate('IDCURVARENFIX;TIPOITEM',
                                                   VarArrayOf([DMRendaFixa.qryBuscaSaldosItemsOper.FieldByName('IDCURVARENFIX').AsVariant,'M']),
                                                   [loPartialKey]);

            // Seta o Frame para ser atualizado na rotina de transferência
            fPos := fraMens.Pos;
            uRendaFixa.AtualizaProcFech := AtualizaProgTRLote;

            // Transfere o título
            if not RendaFixa.IncluiTransferencia(qryPlanoPatroOrigIDPLANPREVCTBPATR.AsInteger,
                                                 qryPlanoPatroDestinoIDPLANPREVCTBPATR.AsInteger,
                                                 qrySaldosATransfPERCTRANSFERIDO.AsFloat,
                                                 qrySaldosATransfQTDTRANSFERIDO.AsFloat,
                                                 qrySaldosATransfVLRTRANSFERIDO.AsFloat,
                                                 //AL_1
                                                 DMRendaFixa.qryBuscaSaldosOper.FieldByName('PUOPERACAO').AsFloat
                                                 memObs.Text,
                                                 //AL_1
                                                 dbDtaOperacao.Date,
                                                 sBoleta) then
               Raise Exception.Create('');

            // Volta o controle do frame para a tela
            uRendaFixa.AtualizaProcFech := nil;
            fraMens.Mostra;
            fraMens.Max := fMax;
            fraMens.Pos := fPos;

            fraMens.Incrementa;
            qrySaldosATransf.Next;
         end;

         MsgDlg('Operação concluída com sucesso.', 'Mensagem do Sistema', mtInformation,[mbOk],0);
         DtmBaseDados.dbBaseDados.Commit;

         // Prepara o ambiente para consulta de transferências
         pnlSaldos.SendToBack;
         OperComum.LimpaParametros(qrySaldosATransf);
         dsSaldosATransfStateChange(Self);
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

procedure AtualizaProgTRLote(sMsg: String = ''; iMax: Integer = -1);
begin
   if iMax = -2 then
      frmCadTransfRenFixLote.fraMens.Apaga
   else if iMax > 0 then
      frmCadTransfRenFixLote.fraMens.Mostra;

   if sMsg <> '' then
      frmCadTransfRenFixLote.fraMens.Mes := sMsg;

   if iMax > 0 then
   begin
      frmCadTransfRenFixLote.fraMens.Max := iMax;
      frmCadTransfRenFixLote.fraMens.Min := 0;
      frmCadTransfRenFixLote.fraMens.Pos := 0;
   end
   else
   if iMax = -1 then
      frmCadTransfRenFixLote.fraMens.Incrementa;

   Application.ProcessMessages;
end;

procedure TfrmCadTransfRenFixLote.FormResize(Sender: TObject);
begin
   inherited;
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);
   Application.ProcessMessages;
end;

end.
