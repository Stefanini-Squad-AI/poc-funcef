//******************************************************************************
// Rotina     : bbtnConfirmarClick
// SOL        : 102784
// Kintana    : 457223  
// Data       : 02/12/2008 
// Responsável: Ricardo Cristiano
// Descrição  : Implementação na rotina "PesqAplicIntegr" dos campos quantidade 
//               e valor para serem somados ao registro de atualização quando o 
//               existir a data de aplicação.
//******************************************************************************
// Rotina     : bbtnConfirmarClick
// SOL        : 99876
// Kintana    : 441255  
// Data       : 28/11/2008  
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para unificar as subscrições quando ocorrer a operação 
//              de transferência entre planos
//******************************************************************************
// Data     : 28/05/2007
// Código   : AL_1
// Pendencia: 24176
// Motivo   : Implementações do testes de flag de integração contábil do módulo de
//            fundo. No momento de Filtrar.
//******************************************************************************
// Data     : 07/03/2007
// Pendencia: 24658
// SOL      : 55067
// Motivo   : Implementações da transferência de integralização de cotas
//******************************************************************************

unit FCadTransfPlanoCotaIntegr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, ExtCtrls, fcLabel, Db, DBTables, Wwquery, CmEventosCadastro,
  ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, faMensagem,
  Menus, uCMMath;

type
  TfrmCadTransfPlanoCotaIntegr = class(TFrmCadastroGridCS)
    pnlTitulo: TPanel;
    lbNomItem: TfcLabel;
    Bevel2: TBevel;
    pnlSaldos: TPanel;
    dbgSaldos: TwwDBGrid;
    pnlAltSaldos: TPanel;
    QryPlanoPatroOrigem: TwwQuery;
    QryPlanoPatroDestino: TwwQuery;
    QrySaldoTransf: TwwQuery;
    DsSaldoTransf: TwwDataSource;
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
    pnlDados: TPanel;
    lblDtOperacao: TLabel;
    lblPlanoPatroOrigem: TLabel;
    lblFundo: TLabel;
    lblPercentual: TLabel;
    lblClasse: TLabel;
    lblPlanoPatroDestino: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    dblkPlanPatroOrig: TwwDBLookupCombo;
    dblkFundoInvest: TwwDBLookupCombo;
    redtPercentual: TRealEdit;
    dblkTipoFundo: TwwDBLookupCombo;
    dblkPlanPatroDest: TwwDBLookupCombo;
    Label2: TLabel;
    redVarTransf: TDBRealEdit;
    QryTipoFundo: TwwQuery;
    QryFundoInvest: TwwQuery;
    UpdSaldoTransf: TUpdateSQL;
    qryIDLOTE: TStringField;
    qryPLANOPATROORIG: TStringField;
    qryPLANOPATRODEST: TStringField;
    qryDESCTIPOFUNDOINV: TStringField;
    qryDESCFUNDOINVEST: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryQTDOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryVLRIOF: TFloatField;
    qryVLRRENDIMENTO: TFloatField;
    qryIDPLANPREVCTBPATRO: TFloatField;
    qryIDPLANPREVCTBPATRD: TFloatField;
    qryIDTIPOFUNDOINVEST: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    QryTipoFundoMax: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    QryAux: TwwQuery;
    qryDTAINIPROC: TDateTimeField;
    dblkTipoCota: TwwDBLookupCombo;
    lblTipoCota: TLabel;
    QryTipoCota: TwwQuery;
    QryAux1: TwwQuery;
    qryPERCENTUAL: TFloatField;
    QrySaldoTransfDESCTIPOFUNDOINV: TStringField;
    QrySaldoTransfDESCFUNDOINVEST: TStringField;
    QrySaldoTransfPZOLIQRESG: TFloatField;
    QrySaldoTransfPZOLIQAPLIC: TFloatField;
    QrySaldoTransfDATACOTIZACAO: TDateTimeField;
    QrySaldoTransfQTDDECQTD: TFloatField;
    QrySaldoTransfQTDDECVALOR: TFloatField;
    QrySaldoTransfPZOCOTAPLIC: TFloatField;
    QrySaldoTransfPZOCOTRESG: TFloatField;
    QrySaldoTransfDATAAPLICACAO: TDateTimeField;
    QrySaldoTransfDATAHISTCOTAINTEG: TDateTimeField;
    QrySaldoTransfIDOPERACAOFUNDO: TFloatField;
    QrySaldoTransfVLRVARIACAO: TFloatField;
    QrySaldoTransfSALDOQTDTRANSF: TFloatField;
    QrySaldoTransfSALDOVLRTRANSF: TFloatField;
    QrySaldoTransfVLRVARTRANSF: TFloatField;
    QrySaldoTransfPERCENTUALTRANSF: TFloatField;
    QrySaldoTransfSALDOQTDCOTAS: TFloatField;
    QrySaldoTransfSALDOVLRFUNDO: TFloatField;
    QrySaldoTransfVLRCOTAINTEGR: TFloatField;
    qryIDTIPOCOTA: TFloatField;
    QryBuscaSaldo: TwwQuery;
    QryBuscaSaldoSALDOQTDCOTAS: TFloatField;
    QryBuscaSaldoSALDOVLRFUNDO: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
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
    procedure DsSaldoTransfStateChange(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure redtPercentualTransfEnter(Sender: TObject);
    procedure redtPercentualTransfExit(Sender: TObject);
    procedure dblkTipoFundoExit(Sender: TObject);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure dblkPlanPatroOrigExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelLote(sLote : String = '');
    function  ValidaFiltros: Boolean;
    function  AlteraSaldo: Boolean;
    function  ExcluiSaldo: Boolean;
    function  VerLoteExclusao(iFundo, iPlano : Integer;
                              dData   : TDateTime;
                              sLote   : String) : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadTransfPlanoCotaIntegr: TfrmCadTransfPlanoCotaIntegr;
  iClasseAnt, iClasseAtu: Integer;
  fPercAnt: Double;

implementation

uses uMensErro, DBaseDados, UDataBase, UFundoComum, FPrincipal, UOperComum, uBibliotecaInvest, uCtrlInvContab,
     UDiasUteisInv;

{$R *.DFM}

procedure TfrmCadTransfPlanoCotaIntegr.sbtnInserirClick(Sender: TObject);
begin
//   inherited;
   pnlSaldos.BringToFront;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;

   redtPercentual.Value := 100;
   
   OperComum.LimpaParametros(QryTipoFundo);
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;

   dbDtaOperacao.Text := DateToStr(Date);
   OperComum.LimpaParametros(QryFundoInvest);
   QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   if QryTipoFundo.RecordCount = 1 Then
   begin
      dblkTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;
      dblkTipoFundo.PerformSearch;

      dbDtaOperacao.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString       :=
                     QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   end
   else
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(Date);
   QryFundoInvest.Open;

   OperComum.LimpaParametros(QryPlanoPatroOrigem);
   QryPlanoPatroOrigem.Open;

   dblkPlanPatroOrig.LookupValue := IntToStr(iPlanPrevCtbPatro);
   dblkPlanPatroOrig.PerformSearch;

   OperComum.LimpaParametros(QryPlanoPatroDestino);
   QryPlanoPatroDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryPlanoPatroDestino.Open;

   OperComum.LimpaParametros(QryTipoCota);
   QryTipoCota.Open;

   lblTipoCota.Visible  := (iTipoInvestUsu in [9,10]);
   dblkTipoCota.Visible := (iTipoInvestUsu in [9,10]);

   OperComum.LimpaParametros(QrySaldoTransf);
   QrySaldoTransf.Open;

   DsSaldoTransfStateChange(Self);

   sbtnFiltrar.Visible   := True;
   sbtnAlterar.Enabled   := False;
   sbtnApagar.Enabled    := False;
   sbtnProcurar.Enabled  := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := True;

   dblkFundoInvest.Text  := '';
   dblkPlanPatroDest.Text:= '';
   
   if dblkTipoFundo.CanFocus then
      dblkTipoFundo.SetFocus;
end;

procedure TfrmCadTransfPlanoCotaIntegr.FormShow(Sender: TObject);
begin
  inherited;
  fraMens.Apaga;
  if UpperCase(Copy(TForm(Sender).Caption, 1, 3)) = 'FRM' then
     TForm(Sender).Caption := 'Operação';

  MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = '+IntToStr(iTipoInvestUsu));

  QryTipoCota.Open;     
     
  SelLote;

end;

procedure TfrmCadTransfPlanoCotaIntegr.FormCreate(Sender: TObject);
begin
   // Maximiza a tela caso ela não caiba na área de trabalho do form principal
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

   inherited;
   
end;

procedure TfrmCadTransfPlanoCotaIntegr.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfPlanoCotaIntegr.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmCadTransfPlanoCotaIntegr.pmnuFixaColunasPopup(Sender: TObject);
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

procedure TfrmCadTransfPlanoCotaIntegr.FixarColuna1Click(Sender: TObject);
begin
  inherited;
   TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols + 1;
end;

procedure TfrmCadTransfPlanoCotaIntegr.LiberarColuna1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols - 1;
end;

procedure TfrmCadTransfPlanoCotaIntegr.LiberaTodasasColunas1Click(Sender: TObject);
begin
  inherited;
  TwwDBGrid(TPopupMenu(TMenuItem(Sender).Parent.Owner).PopupComponent).FixedCols := 0;
end;

procedure TfrmCadTransfPlanoCotaIntegr.PintaGridZebrado(Sender: TObject; Field: TField; State:
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

procedure TfrmCadTransfPlanoCotaIntegr.GridRefresh(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadTransfPlanoCotaIntegr.SelLote(sLote : String = '');
begin
  OperComum.LimpaParametros(QryTipoFundoMax);
  QryTipoFundoMax.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoFundoMax.Open;

   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   qry.ParamByName('DATAMOVFUNDO').AsString  := QryTipoFundoMax.FieldByName('DATAULTFECH').AsString;
   if sLOTE <> '' then
      qry.ParamByName('IDLOTE').AsString     := sLote;
   qry.Open;

   OperComum.LimpaParametros(QryTipoFundoMax);

   pnlFundo.BringToFront;
   sbtnFiltrar.Visible := False;

   if not Qry.IsEmpty then
      sbtnApagar.Enabled := True;

end;

procedure TfrmCadTransfPlanoCotaIntegr.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
      qry.Locate('IDLOTE', MontaSelect.ValoresChave[0], []);

end;

procedure TfrmCadTransfPlanoCotaIntegr.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down then
  begin
     if qrySaldoTransf.RecordCount > 0 then
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

procedure TfrmCadTransfPlanoCotaIntegr.bbtnCancelarClick(Sender: TObject);
begin
   if sbtnInserir.Down then
   begin                                    
      pnlSaldos.SendToBack;
      sbtnFiltrar.Visible := False;
      OperComum.LimpaParametros(qrySaldoTransf);

      CmeCadastro.AtualizaBotoes(Self);
   end
   else
     inherited;

   SelLote;  

end;

function TfrmCadTransfPlanoCotaIntegr.ValidaFiltros: Boolean;
begin
   Result := False;
   if Trim(dblkTipoFundo.Text) = '' then
   begin
      MsgDlg('Informe o Tipo de Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkFundoInvest.Text) = '' then
   begin
      MsgDlg('Informe o Fundo de Investimento.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkPlanPatroOrig.Text) = '' then
   begin
      MsgDlg('Informe o Plano Origem.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if Trim(dblkPlanPatroDest.Text) = '' then
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
   if redtPercentual.Value > 100 then
   begin
      MsgDlg('O Percentual a Transferir é maior que 100%.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;
   if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) = '')) then
   begin
      MsgDlg('Informe o Tipo de Cota do Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadTransfPlanoCotaIntegr.sbtnFiltrarClick(Sender: TObject);
var
   Year, Month, Day : Word;
   dDtUltDiaMes     : TDateTime;
begin
   if VerEmAbertura(QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;

   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   //AL_1
   if CtrlInvContab.IntegraCtbFinModulo then
   begin
      DecodeDate(dbDtaOperacao.DateTime, Year, Month, Day);

      if Month > 1 then
         dDtUltDiaMes := DiasUteisInv.UltDiaUtilMes(Year,(Month-1),1,-1,'',True,False,False)
      else
         dDtUltDiaMes := DiasUteisInv.UltDiaUtilMes(Year-1,12,1,-1,'',True,False,False);

      if CtrlInvContab.TestaPeriodo(DateToStr(dDtUltDiaMes), iTipoInvestUsu) then
      begin
         If MsgDlg('A contabilidade para o mês anterior se encontra aberta para lançamentos!'+#13+
                   'Deseja prosseguir com a operação?','Mensagem do Sistema',mtInformation, [mbYes, mbNo],0) = mrNo Then
            Exit;
      end;
   end;

   inherited;

   if Not ValidaFiltros then
      Exit;

   try
      fraMens.Mostra;
      fraMens.Mes := 'Buscando Aplicações ... ';

      redQtdTransf.DecDigits := QryFundoInvest.FieldByName('QTDDECQTD').AsInteger;

      QrySaldoTransfSALDOQTDCOTAS.DisplayFormat  := '###,#0.'+Replicate('0',QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);
      QrySaldoTransfSALDOQTDTRANSF.DisplayFormat := '###,#0.'+Replicate('0',QryFundoInvest.FieldByName('QTDDECQTD').AsInteger);

      OperComum.LimpaParametros(QrySaldoTransf);
      QrySaldoTransf.ParamByName('DATAMOVFUNDO').AsString        := dbDtaOperacao.Text;
      QrySaldoTransf.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
      QrySaldoTransf.ParamByName('IDPLANPREVCTBPATR').AsInteger  := QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      QrySaldoTransf.ParamByName('IDFUNDOINVEST').AsInteger      := QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
      QrySaldoTransf.ParamByName('IDTIPOFUNDOINVEST').AsInteger  := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QrySaldoTransf.ParamByName('PERCENTUAL').AsFloat           := redtPercentual.Value;
      QrySaldoTransf.ParamByName('QTDDEC').AsFloat               := 12;
      if QryFundoInvest.FieldByName('QTDDECQTD').AsInteger > 0 then
         QrySaldoTransf.ParamByName('QTDDEC').AsFloat            := QryFundoInvest.FieldByName('QTDDECQTD').AsInteger;

      if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')) then
         QrySaldoTransf.ParamByName('IDTIPOCOTA').AsInteger      := StrToInt(dblkTipoCota.LookupValue);
      QrySaldoTransf.Open;

      if QrySaldoTransf.RecordCount > 0 then
         bbtnConfirmar.Enabled := True
      else
         bbtnConfirmar.Enabled := False;

   finally
      fraMens.Apaga;
   end
end;

procedure TfrmCadTransfPlanoCotaIntegr.DsSaldoTransfStateChange(Sender: TObject);
begin
   inherited;
   if QrySaldoTransf.Active then
   begin
      if QrySaldoTransf.RecordCount > 0 then
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

function TfrmCadTransfPlanoCotaIntegr.AlteraSaldo: Boolean;
begin
   try
      qrySaldoTransf.Edit;
      pnlAltSaldos.BringToFront;
      pnlAltSaldos.Enabled := True;
      bbtnConfirmar.Enabled := False;
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
   except
      qrySaldoTransf.Cancel;
      pnlAltSaldos.SendToBack;
      pnlAltSaldos.Enabled := False;
      bbtnConfirmar.Enabled := True;
   end;
end;

function TfrmCadTransfPlanoCotaIntegr.ExcluiSaldo: Boolean;
begin
   if MsgDlg('Retira esta aplicação deste Lote de Transferência?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      qrySaldoTransf.Delete;
end;

procedure TfrmCadTransfPlanoCotaIntegr.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  AlteraSaldo;
end;

procedure TfrmCadTransfPlanoCotaIntegr.mnuExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluiSaldo;
end;

procedure TfrmCadTransfPlanoCotaIntegr.bbtnOkDetClick(Sender: TObject);
begin
  if redQtdTransf.Value <= 0 then
  begin
     if redQtdTransf.CanFocus then
        redQtdTransf.SetFocus;
     Exit;
  end;

  if redVlrTransf.Value <= 0 then
  begin
     if redVlrTransf.CanFocus then
        redVlrTransf.SetFocus;
     Exit;
  end;

  inherited;

  qrySaldoTransf.Post;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfPlanoCotaIntegr.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  qrySaldoTransf.Cancel;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfPlanoCotaIntegr.bbtnConfirmarClick(Sender: TObject);
var
   sDescFundo, sLote, sNaturezaS, sDescTipoOperS, sNaturezaE, sDescTipoOperE : String;
   fValorTransf, fValorVarTransf : Currency;
   iPlano , iPlanilha , iDocumento, iIdForCli, iIdOperacaoFundoOrigem, iIdOperacaoFundoDestino : Integer;
   DadosCotaA, DadosCotaH  : TDadosCota;
   dDataAnt, dDataOper : TDateTime;
   fNull, fSaldoFundo : Double;
begin
   fValorTransf    := 0;
   fValorVarTransf := 0;

   If QrySaldoTransf.IsEmpty then
      Exit;

   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   DadosCotaH  := BuscaCotaFundo(QryAux,
                                 StrToInt(dblkFundoInvest.LookupValue),
                                 dbDtaOperacao.Date,
                                 OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                           QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1));
   If DadosCotaH.VlrCota = 0 then
   begin
      MsgDlg('Não foi cadastrado a Cota para o dia '+dbDtaOperacao.Text+'. A operação não será executada.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   dDataAnt   := dbDtaOperacao.Date - 1;
   While not DiasUteisInv.DiaUtil(dDataAnt, -1, 1,'',True,False,False) Do
      dDataAnt:= dDataAnt - 1;

   DadosCotaA  := BuscaCotaFundo(QryAux,
                                 StrToInt(dblkFundoInvest.LookupValue),
                                 dDataAnt,
                                 OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                           QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1));
   If DadosCotaA.VlrCota = 0 then
   begin
      MsgDlg('Não foi cadastrado a Cota para o dia '+DateToStr(dDataAnt)+'. A operação não será executada.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   If DadosCotaA.VlrCota <> DadosCotaH.VlrCota then
   begin
      MsgDlg('A Cota do dia '+dbDtaOperacao.Text+' está diferente do dia '+DateToStr(dDataAnt)+'.'+#13+
             'Para executar essa funcionalidade, a cota do dia, deve ser igual a cota do dia anterior.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   sLote := 'FI-' + Copy(dbDtaOperacao.Text,9,2) + '/' +
                         FormatFloat('0000', LeUltRegistro(Nil,'CONTDOCRENVAR' +
                                             Copy(dbDtaOperacao.Text,9,2)));
   //Transferência Saída
   If Not FazQuery(QryAux,'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO, FLGTRATAIR, IDMERCADO '+
                          'FROM TIPOOPERACAO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                          'IDTIPOOPERACAO = -165 ') Then
   begin
      MsgDlg('Não foi cadastrado o tipo de operação Transferência de Saída(-165), para o Tipo de Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   sNaturezaS     := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
   sDescTipoOperS := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

   //Transferência Entrada
   If Not FazQuery(QryAux,'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO, FLGTRATAIR, IDMERCADO '+
                          'FROM TIPOOPERACAO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                          'IDTIPOOPERACAO = -173 ') Then
   begin
      MsgDlg('Não foi cadastrado o tipo de operação Transferência de Entrada(-173), para o Tipo de Fundo.', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   sNaturezaE     := QryAux.FieldByName('NATUREZAOPERACAO').AsString;
   sDescTipoOperE := QryAux.FieldByName('DESCTIPOOPERACAO').AsString;

   //Verifica se exite outras operações para o dia da Transferência
   If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                      ' (IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+') AND '+
                      ' (IDPLANPREVCTBPATR = '+QuotedStr(dblkPlanPatroOrig.LookupValue)+') AND '+
                      ' (IDFUNDOINVEST     = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+')  AND '+
                      ' (DATAOPERACAO     >= TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'')) AND '+
                      OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                     ' (IDTIPOCOTA = '+dblkTipoCota.LookupValue+') AND ',' ')+
                      '((IDTIPOOPERACAO = -100) OR (IDTIPOOPERACAO = -105)) ') Then
   begin
      MsgDlg('Não é possível executar a operação, devido a ocorrência de '+#13+
             'integralização de cotas para esse Fundo!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   //Verifica Transferência entre Planos
   If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                      ' IDTIPOINVEST    = '+IntToStr(iTipoInvestUsu)+' AND '+
                      ' IDFUNDOINVEST   = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                      ' DATAOPERACAO    > TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                      OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                     ' IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                      '((IDTIPOOPERACAO = -165) OR (IDTIPOOPERACAO = -173)) ') Then
   begin
      MsgDlg('Já existe tranferência para esse Fundo com data superior a data de operação. '+#13+
             'A operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;

   If Not FazQuery(QryAux,'SELECT SUM(VLROPERACAO) AS VLROPERACAO FROM OPERACAOFUNDO WHERE '+
                          ' IDTIPOINVEST    = '+IntToStr(iTipoInvestUsu)+' AND '+
                          ' IDFUNDOINVEST   = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                          ' DATAOPERACAO    = TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                          OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                          ' IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                          '(IDTIPOOPERACAO = -165) ') Then
   begin
      qrySaldoTransf.DisableControls;
      qrySaldoTransf.First;
      while not qrySaldoTransf.Eof do
      begin
         fValorTransf := fValorTransf + QrySaldoTransfSALDOVLRTRANSF.AsFloat;
         qrySaldoTransf.Next;
      end;
      qrySaldoTransf.First;
      qrySaldoTransf.EnableControls;

      OperComum.LimpaParametros(QryBuscaSaldo);
      QryBuscaSaldo.ParamByName('DATAMOVFUNDO').AsString        := dbDtaOperacao.Text;
      QryBuscaSaldo.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
      QryBuscaSaldo.ParamByName('IDPLANPREVCTBPATR').AsInteger  := QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      QryBuscaSaldo.ParamByName('IDFUNDOINVEST').AsInteger      := QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
      QryBuscaSaldo.ParamByName('IDTIPOFUNDOINVEST').AsInteger  := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')) then
         QryBuscaSaldo.ParamByName('IDTIPOCOTA').AsInteger      := StrToInt(dblkTipoCota.LookupValue);
      QryBuscaSaldo.Open;

      if (QryBuscaSaldoSALDOVLRFUNDO.AsFloat - (fValorTransf + QryAux.FieldByName('VLROPERACAO').AsFloat)) < 0 then
      begin
         MsgDlg('Existem operações de transferência. O saldo não é suficiente para executar outra tranferência. '+#13+
                'A operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
         QryAux.Close;
         OperComum.LimpaParametros(QrySaldoTransf);
         Exit;
      end;
      OperComum.LimpaParametros(QrySaldoTransf);
   end;
   QryAux.Close;

//  inherited;

   try
      //Prepara o ambiente para transferir
      fraMens.Mostra;
      fraMens.Max := qrySaldoTransf.RecordCount + 2;
      fraMens.Pos := 0;
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         //Faz as transferências
         qrySaldoTransf.First;
         while not qrySaldoTransf.Eof do
         begin
            if QrySaldoTransfSALDOQTDTRANSF.AsFloat > 0 then
            begin
               fraMens.Mes := 'Efetuando transferências : ' + #13 +
                              'Aplicação ' + QrySaldoTransfDATAAPLICACAO.AsString;

               //Exclui Contábil atual da aplicação origem
               if FazQuery(QryAux,'SELECT PLANO, PLNCODIGO '+
                                  'FROM HISTCOTAINTEGRALIZA '+
                                  'WHERE  IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+
                                  ' AND   IDPLANPREVCTBPATR = '+QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsString+
                                  ' AND   IDFUNDOINVEST       = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+
                                  ' AND   DATAAPLICACAO       = TO_DATE('+QuotedStr(QrySaldoTransfDATAAPLICACAO.AsString)+',''DD/MM/YYYY'')'+
                                  ' AND   DATAHISTCOTAINTEG   = TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'')'+
                                  OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                     ' AND   IDTIPOCOTA          = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString, '')+
                                  ' AND   TIPMOVCOTAINTEGR    = ''ATU''') then
               begin
                  if (QryAux.FieldByName('PLNCODIGO').AsInteger > 0) then
                  begin
                     If Not ProcExcluiContabil(QryAux.FieldByName('PLANO').AsInteger,
                                               QryAux.FieldByName('PLNCODIGO').AsInteger) Then
                        Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil.');
                  end;
               end;

               //Exclui histórico atual da aplicação origem.
               if not ExecutaQuery(QryAux,'DELETE FROM HISTCOTAINTEGRALIZA '+
                                          'WHERE  IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+
                                          ' AND   IDPLANPREVCTBPATR = '+QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsString+
                                          ' AND   IDFUNDOINVEST       = '+QryFundoInvest.FieldByName('IDFUNDOINVEST').AsString+
                                          ' AND   DATAAPLICACAO       = TO_DATE('+QuotedStr(QrySaldoTransfDATAAPLICACAO.AsString)+',''DD/MM/YYYY'')'+
                                          ' AND   DATAHISTCOTAINTEG   = TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'')'+
                                          OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                            ' AND   IDTIPOCOTA          = '+QryTipoCota.FieldByName('IDTIPOCOTA').AsString, '')+
                                          ' AND   IDOPERACAOFUNDO     = '+QrySaldoTransfIDOPERACAOFUNDO.AsString+
                                          ' AND   TIPMOVCOTAINTEGR    = ''ATU''') then
                  Raise Exception.Create('Ocorreu um problema ao excluir o histórico atual da aplicação.');

               OperComum.LimpaParametros(QryBuscaSaldo);
               QryBuscaSaldo.ParamByName('DATAMOVFUNDO').AsString        := dbDtaOperacao.Text;
               QryBuscaSaldo.ParamByName('DATAAPLICACAO').AsString       := QrySaldoTransfDATAAPLICACAO.AsString;
               QryBuscaSaldo.ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
               QryBuscaSaldo.ParamByName('IDPLANPREVCTBPATR').AsInteger  := QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
               QryBuscaSaldo.ParamByName('IDFUNDOINVEST').AsInteger      := QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger;
               QryBuscaSaldo.ParamByName('IDTIPOFUNDOINVEST').AsInteger  := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
               QryBuscaSaldo.ParamByName('IDOPERACAOFUNDO').AsInteger    := QrySaldoTransfIDOPERACAOFUNDO.AsInteger;
               if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')) then
                  QryBuscaSaldo.ParamByName('IDTIPOCOTA').AsInteger      := StrToInt(dblkTipoCota.LookupValue);
               QryBuscaSaldo.Open;

               //Transferência Saída-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------
               if not GravaOperacaoFundo(QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                         iTipoInvestUsu,
                                         -1{iPedido}, -165,
                                         QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                         -1{iComposicao},
                                         QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         dbDtaOperacao.DateTime{Cotizacao},
                                         dbDtaOperacao.DateTime{Liquidacao},
                                         dbDtaOperacao.DateTime{Operacao},
                                         QrySaldoTransfSALDOVLRTRANSF.AsFloat{Valor},
                                         0{Irrf},
                                         0{Iof},
                                         QrySaldoTransfVLRVARTRANSF.AsFloat{Variacao},
                                         QrySaldoTransfSALDOQTDTRANSF.AsFloat{Quantidade},
                                         DadosCotaH.VlrCota{Cota},
                                         iIdOperacaoFundoOrigem{iOperacao},
                                         OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                         sLote) Then
                  Raise Exception.Create('Não foi Possível gravar a Operação de Origem.');

               If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                               OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                               -1,-1,-1,
                                               QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                               dbDtaOperacao.DateTime,
                                               QrySaldoTransfDATAAPLICACAO.AsDateTime,
                                               QryBuscaSaldoSALDOVLRFUNDO.AsFloat-QrySaldoTransfSALDOVLRTRANSF.AsFloat,
                                               QryBuscaSaldoSALDOQTDCOTAS.AsFloat-QrySaldoTransfSALDOQTDTRANSF.AsFloat,
                                               QrySaldoTransfSALDOQTDTRANSF.AsFloat,
                                               QrySaldoTransfVLRCOTAINTEGR.AsFloat,
                                               QrySaldoTransfVLRVARTRANSF.AsFloat, 'TRP') then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

               If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                               OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                               -1,-1,-1,
                                               QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                               dbDtaOperacao.DateTime,
                                               QrySaldoTransfDATAAPLICACAO.AsDateTime,
                                               QryBuscaSaldoSALDOVLRFUNDO.AsFloat-QrySaldoTransfSALDOVLRTRANSF.AsFloat,
                                               QryBuscaSaldoSALDOQTDCOTAS.AsFloat-QrySaldoTransfSALDOQTDTRANSF.AsFloat,
                                               0,
                                               QrySaldoTransfVLRCOTAINTEGR.AsFloat,
                                               0, 'ATU') then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

               OperComum.LimpaParametros(QryBuscaSaldo);

               //Transferência Entrada ----------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------
               if not GravaOperacaoFundo(QrySaldoTransf.FieldByName('IDOPERACAOFUNDO').AsInteger,
                                         iTipoInvestUsu,
                                         -1{iPedido}, -173,
                                         QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                         -1{iComposicao},
                                         QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         dbDtaOperacao.DateTime{Cotizacao},
                                         dbDtaOperacao.DateTime{Liquidacao},
                                         dbDtaOperacao.DateTime{Operacao},
                                         QrySaldoTransfSALDOVLRTRANSF.AsFloat{Valor},
                                         0{Irrf},
                                         0{Iof},
                                         QrySaldoTransfVLRVARTRANSF.AsFloat{Variacao},
                                         QrySaldoTransfSALDOQTDTRANSF.AsFloat{Quantidade},
                                         DadosCotaH.VlrCota{Cota},
                                         iIdOperacaoFundoDestino{iOperacao},
                                         OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                         sLote) Then
                  Raise Exception.Create('Não foi Possível gravar a Operação de Destino.');

               If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                               OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                               -1,-1,-1,
                                               QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               iIdOperacaoFundoDestino,
                                               dbDtaOperacao.DateTime,
                                               QrySaldoTransfDATAAPLICACAO.AsDateTime,
                                               QrySaldoTransfSALDOVLRTRANSF.AsFloat,
                                               QrySaldoTransfSALDOQTDTRANSF.AsFloat,
                                               QrySaldoTransfSALDOQTDTRANSF.AsFloat,
                                               QrySaldoTransfVLRCOTAINTEGR.AsFloat,
                                               QrySaldoTransfVLRVARTRANSF.AsFloat, 'TRP') then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

//Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223                  
{               If Not GravaHistCotaIntegraliza(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                               OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                                               -1,-1,-1,
                                               QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                               iIdOperacaoFundoDestino,
                                               dbDtaOperacao.DateTime,
                                               QrySaldoTransfDATAAPLICACAO.AsDateTime,
                                               QrySaldoTransfSALDOVLRTRANSF.AsFloat,
                                               QrySaldoTransfSALDOQTDTRANSF.AsFloat, 0,
                                               QrySaldoTransfVLRCOTAINTEGR.AsFloat, 0, 'ATU') then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');}

               //Ricardo Cristiano - 02/12/2008 - N. Sol 102784 -  N. Kintana 457223
               //Ricardo Cristiano - 28/11/2008 - N. Sol 99876 -  N. Kintana 441255
               If Not PesqAplicIntegr(iTipoInvestUsu,
                                      QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                      iIdOperacaoFundoDestino,
                                      QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                      QrySaldoTransfDATAAPLICACAO.AsDateTime,
                                      dbDtaOperacao.DateTime,
                                      QrySaldoTransfVLRCOTAINTEGR.AsFloat,
                                      QrySaldoTransfSALDOVLRTRANSF.AsFloat,
                                      QrySaldoTransfSALDOQTDTRANSF.AsFloat,
                                      OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')), QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) then
                  Raise Exception.Create('Não foi possível Alimentar o Histórico da Integralização.');

               fValorTransf    := fValorTransf    + QrySaldoTransfSALDOVLRTRANSF.AsFloat;
               fValorVarTransf := fValorVarTransf + QrySaldoTransfVLRVARTRANSF.AsFloat;

            end;

            fraMens.Incrementa;

            qrySaldoTransf.Next;
         end;

         if (fValorTransf + fValorVarTransf) > 0 then
         begin
            fraMens.Mes := 'Efetuando a Contabilização : '+ #13 +
                            FloatToStrF(fValorTransf, ffNumber, 16, 2);

            iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                               -165, pRPI.IDTIPOCLIENTEEMI);
            iPlano         := -1;
            iPlanilha      := -1;
            iDocumento     := -1;

            //Transferência Saída
            If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                            -165,
                                            iTipoInvestUsu,
                                            QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                            iIdForCli,
                                            QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                            StrToDate(dbDtaOperacao.Text),
                                            StrToDate(dbDtaOperacao.Text),
                                            'OPE',
                                            sNaturezaS,
                                            QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                            True,
                                            fValorTransf{Operação},
                                            0, 0, 0, 0, 0,
                                            fValorVarTransf{Variação},
                                            -1, 0, 0, 0, 0,
                                            QryPlanoPatroOrigem.FieldByName('IDPLANOPREV').AsInteger,
                                            QryPlanoPatroOrigem.FieldByName('IDPATRO').AsInteger) Then
               Raise Exception.Create('Ocorreu um problema ao Contabilizar a Operação de Origem.');

            if ((iPlano > 0) or (iPlanilha > 0) or (iDocumento > 0)) then
            begin
               if not ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET '+
                                    ' PLANO        = '+OperComum.IIF(iPlano > 0,IntToStr(iPlano),'NULL')+','+
                                    ' PLNCODIGO    = '+OperComum.IIF(iPlanilha > 0,IntToStr(iPlanilha),'NULL')+','+
                                    ' CODDOCUMENTO = '+OperComum.IIF(iDocumento > 0,IntToStr(iDocumento),'NULL')+
                                    ' WHERE IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                                    '       IDPLANPREVCTBPATR = '+QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsString+' AND '+
                                    '       IDFUNDOINVEST     = '+dblkFundoInvest.LookupValue+' AND '+
                                    '       IDTIPOOPERACAO    = -165 AND '+
                                    '       DATAOPERACAO      =  TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                                    OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                                   ' IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                                    '       IDLOTE            = '+QuotedStr(sLote)) then
                  Raise Exception.Create('Ocorreu um problema ao carimbar o Lote de origem com as integralizações.');
            end;

            fraMens.Incrementa;

            iIdForCli := OperComum.BuscaForCli(iTipoInvestUsu,
                                               QryFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                               -173, pRPI.IDTIPOCLIENTEEMI);
            iPlano         := -1;
            iPlanilha      := -1;
            iDocumento     := -1;

            //Transferência Entrada
            If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                            -173,
                                            iTipoInvestUsu,
                                            QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                            iIdForCli,
                                            QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                            StrToDate(dbDtaOperacao.Text),
                                            StrToDate(dbDtaOperacao.Text),
                                            'OPE',
                                            sNaturezaS,
                                            QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                            True,
                                            fValorTransf{Operação},
                                            0, 0, 0, 0, 0,
                                            fValorVarTransf{Variação},
                                            -1, 0, 0, 0, 0,
                                            QryPlanoPatroDestino.FieldByName('IDPLANOPREV').AsInteger,
                                            QryPlanoPatroDestino.FieldByName('IDPATRO').AsInteger) Then
               Raise Exception.Create('Ocorreu um problema ao Contabilizar a Operação de Destino.');

            if ((iPlano > 0) or (iPlanilha > 0) or (iDocumento > 0)) then
            begin
               if not ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET '+
                                    ' PLANO        = '+OperComum.IIF(iPlano > 0,IntToStr(iPlano),'NULL')+','+
                                    ' PLNCODIGO    = '+OperComum.IIF(iPlanilha > 0,IntToStr(iPlanilha),'NULL')+','+
                                    ' CODDOCUMENTO = '+OperComum.IIF(iDocumento > 0,IntToStr(iDocumento),'NULL')+
                                    ' WHERE IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                                    '       IDPLANPREVCTBPATR = '+QryPlanoPatroDestino.FieldByName('IDPLANPREVCTBPATR').AsString+' AND '+
                                    '       IDFUNDOINVEST     = '+dblkFundoInvest.LookupValue+' AND '+
                                    '       IDTIPOOPERACAO    = -173 AND '+
                                    '       DATAOPERACAO      =  TO_DATE('+QuotedStr(dbDtaOperacao.Text)+',''DD/MM/YYYY'') AND '+
                                    OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                                   ' IDTIPOCOTA = '+dblkTipoCota.LookupValue+'  AND ','')+
                                    '       IDLOTE            = '+QuotedStr(sLote)) then
                  Raise Exception.Create('Ocorreu um problema ao carimbar o Lote de destino com as integralizações.');
            end;

            if not ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET PERCENTUAL = '+FloatToStrCM(redtPercentual.Value)+
                                        ' WHERE IDLOTE = '+QuotedStr(sLote)) then
               Raise Exception.Create('Ocorreu um problema ao carimbar o Lote com o percentual.');

         end;

         fraMens.Incrementa;

         dtmBaseDados.dbBaseDados.Commit;

         OperComum.LimpaParametros(QryTipoFundoInvest);
         QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         QryTipoFundoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
         QryTipoFundoInvest.Open;

         if dbDtaOperacao.Date < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            if Not Reprocessamento(iTipoInvestUsu,
                                   QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryFundoInvest.FieldByName('IDFUNDOINVEST').AsInteger,
                                   -1,
                                   dbDtaOperacao.Date,
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   QryFundoInvest.FieldByName('DTAINIPROC').AsDateTime, True,
                                   OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                             QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0)
            else
               MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
         end
         else
            MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

         QryTipoFundoInvest.Close;

      except
          On E:Exception Do Begin
             MsgDlg('Não foi possivel confirmar a Operação :'+#13+
                    E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
             If dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.Rollback;
          End;
      end;
   finally
      //Prepara o ambiente para consulta de transferências   
      pnlSaldos.SendToBack;
      OperComum.LimpaParametros(qrySaldoTransf);
      OperComum.LimpaParametros(QryBuscaSaldo);      
      dsSaldoTransfStateChange(Self);
      CmeCadastro.AtualizaBotoes(Self);
      SelLote;
      fraMens.Apaga;
   end;
end;

procedure TfrmCadTransfPlanoCotaIntegr.redtPercentualTransfEnter(
  Sender: TObject);
begin
  inherited;
   fPercAnt := QrySaldoTransfPERCENTUALTRANSF.AsFloat;
end;

procedure TfrmCadTransfPlanoCotaIntegr.redtPercentualTransfExit(Sender: TObject);
begin
  inherited;
   if fPercAnt <> QrySaldoTransfPERCENTUALTRANSF.AsFloat then
   begin
      // Recalcula os valores
      if QryFundoInvest.FieldByName('QTDDECQTD').AsInteger > 0 then
         QrySaldoTransfSALDOQTDTRANSF.AsFloat :=
            RoundCM(QrySaldoTransfSALDOQTDCOTAS.AsFloat * (redtPercentualTransf.Value / 100), QryFundoInvest.FieldByName('QTDDECQTD').AsInteger)
      else
         QrySaldoTransfSALDOQTDTRANSF.AsFloat :=
            RoundCM(QrySaldoTransfSALDOQTDCOTAS.AsFloat * (redtPercentualTransf.Value / 100), 12);
      qrySaldoTransfSALDOVLRTRANSF.AsFloat :=
         RoundCM(QrySaldoTransfSALDOVLRFUNDO.AsFloat * (redtPercentualTransf.Value / 100), 2);
      QrySaldoTransfVLRVARTRANSF.AsFloat   :=
         RoundCM(QrySaldoTransfVLRVARIACAO.AsFloat * (redtPercentualTransf.Value / 100), 2);
   end;
end;

procedure TfrmCadTransfPlanoCotaIntegr.dblkTipoFundoExit(Sender: TObject);
begin
  inherited;
   if dblkTipoFundo.Text <> '' then
   begin
      dbDtaOperacao.Text := QryTipoFundo.FieldByName('DATAULTFECH').AsString;

      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString       :=
                     QryTipoFundo.FieldByName('DATAULTFECH').AsString;
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryFundoInvest.Open;
   end;
end;

procedure TfrmCadTransfPlanoCotaIntegr.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;

   If not DiasUteisInv.DiaUtil(dbDtaOperacao.Date, -1, 1, '', True, False, False) then
   begin
      MsgDlg('A data informada não é um dia útil.','Mensagem do Sistema',mtInformation,[mbOK],0);
      If dbDtaOperacao.CanFocus Then
         dbDtaOperacao.SetFocus;
      Exit;
   end;

   if ((dbDtaOperacao.Text <> '') And (dblkTipoFundo.Text <> '')) then
   begin
      OperComum.LimpaParametros(QryFundoInvest);
      QryFundoInvest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
      QryFundoInvest.ParamByName('DATAMOVFUNDO').AsString  := dbDtaOperacao.Text;
      QryFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryFundoInvest.Open;
   end;
end;

procedure TfrmCadTransfPlanoCotaIntegr.dblkPlanPatroOrigExit(Sender: TObject);
begin
  inherited;
   if dblkPlanPatroOrig.Text <> '' then
   begin
      OperComum.LimpaParametros(QryPlanoPatroDestino);
      QryPlanoPatroDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger :=
                           QryPlanoPatroOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      QryPlanoPatroDestino.Open;
   end;
end;

procedure TfrmCadTransfPlanoCotaIntegr.sbtnApagarClick(Sender: TObject);
var wStr : string;
    //Essa variável controla a deleção de transf. antiga, onde o idoperacaofundo não era gravado no histório
    bDeleta : Boolean;
begin
//   inherited;

   bDeleta := False;

   if not VerificaFechamentoOperacao(Qry.FieldByName('DATAOPERACAO').AsString) then
      Exit;

   if VerEmAbertura(Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   //Essa rotina verifica se a Lote a excluir é a ultima lançada   
   if VerLoteExclusao(Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                      Qry.FieldByName('IDPLANPREVCTBPATRO').AsInteger,
                      Qry.FieldByName('DATAOPERACAO').AsDateTime,
                      Qry.FieldByName('IDLOTE').AsString) then
   begin
      MsgDlg('Não é possível excluir esse Lote. '+#13+
             'Iniciar a exclusão desse Fundo pela maior Lote do dia.',
             'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   //Verifica se exite outras operações para o dia da Transferência
   If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                      ' (IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+') AND '+
                      ' (IDFUNDOINVEST     = '+Qry.FieldByName('IDFUNDOINVEST').AsString+')  AND '+
                      ' (DATAOPERACAO     >= TO_DATE('+QuotedStr(Qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')) AND '+
                      OperComum.IIF((Qry.FieldByName('IDTIPOCOTA').AsInteger > 0),
                                     ' (IDTIPOCOTA = '+Qry.FieldByName('IDTIPOCOTA').AsString+') AND ',' ')+
                      '((IDTIPOOPERACAO = -100) OR (IDTIPOOPERACAO = -105)) ') Then
   begin
      MsgDlg('Não é possível executar a operação, devido a ocorrência de '+#13+
             'integralização de cotas para esse Fundo!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
      QryAux.Close;
      Exit;
   end;        

   if not CtrlInvContab.TestaPeriodo(Qry.FieldByName('DATAOPERACAO').AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   If MsgDlg('Confirma Exclusão ?','Mensagem ', mtInformation, [mbYes, mbNo],0) = mrNo Then
      Exit;

   Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      //Exclui Contábil/Financeiro da operação do Fundo - Origem/Destino
      FazQuery(QryAux,'SELECT DISTINCT IDPLANPREVCTBPATR, PLANO, PLNCODIGO, CODDOCUMENTO, DATAOPERACAO FROM OPERACAOFUNDO WHERE '+
                      'IDLOTE = '+ QuotedStr(Qry.FieldByName('IDLOTE').AsString));

      fraMens.Mostra;
      fraMens.Max := QryAux.RecordCount + 1;
      fraMens.Pos := 0;

      fraMens.Mes := 'Excluindo Transferências '+ #13 +
                     'Lote : '+ Qry.FieldByName('IDLOTE').AsString;
      QryAux.First;
      While Not QryAux.Eof do
      begin
         if not ProcExcluiFundo(QryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                QryAux.FieldByName('PLNCODIGO').AsInteger,
                                QryAux.FieldByName('PLANO').AsInteger,
                                iTipoInvestUsu,
                                QryAux.FieldByName('DATAOPERACAO').AsDateTime, True, -1,
                                QryAux.FieldByName('IDPLANPREVCTBPATR').AsInteger) Then
            Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

         QryAux.Next;
         fraMens.Incrementa;
      end;

      //Origem/Destino - HISTÓRICO
      FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                      'IDLOTE = '+ QuotedStr(Qry.FieldByName('IDLOTE').AsString)+' '+
                      'ORDER BY IDOPERACAOFUNDO');  
      fraMens.Apaga;                      
      fraMens.Mostra;
      fraMens.Max := QryAux.RecordCount + 1;
      fraMens.Pos := 0;

      fraMens.Mes := 'Excluindo Transferências '+ #13 +
                     'Lote : '+ Qry.FieldByName('IDLOTE').AsString;
      QryAux.First;
      While Not QryAux.Eof do
      begin
         //Verifica se exite registros na histfundo
         if FazQuery(QryAux1,'SELECT PLANO, PLNCODIGO FROM HISTCOTAINTEGRALIZA WHERE '+
                             'DATAHISTCOTAINTEG >= TO_DATE('+QuotedStr(Qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')'+' AND '+
                             'IDOPERACAOFUNDO    = '+QryAux.FieldByName('IDOPERACAOFUNDO').AsString+' '+
                             'ORDER BY DATAHISTCOTAINTEG, IDHISTCOTAINTEGR') then
         begin
            QryAux1.First;
            While Not QryAux1.Eof do
            begin
              //Exclui a atualização contábil
               if (QryAux1.FieldByName('PLNCODIGO').AsInteger > 0) then
               begin
                  If Not ProcExcluiContabil(QryAux1.FieldByName('PLANO').AsInteger,
                                            QryAux1.FieldByName('PLNCODIGO').AsInteger) then
                     Raise Exception.Create('Não foi Possível efetuar a exclusão contábil da Operação.');
               end;
               QryAux1.Next;
            end;

            if not ExecutaQuery(QryAux1,'DELETE FROM HISTCOTAINTEGRALIZA WHERE '+
                                        'DATAHISTCOTAINTEG >= TO_DATE('+QuotedStr(Qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')'+' AND '+
                                        'IDOPERACAOFUNDO    = '+QryAux.FieldByName('IDOPERACAOFUNDO').AsString) then
               Raise Exception.Create('Ocorreu um problema ao excluir o histórico da operação.');
         end
         else
            bDeleta := True;
         QryAux.Next;

         fraMens.Incrementa;
      end;

      QryAux1.Close;

      if bDeleta then
      begin
         if not ExecutaQuery(QryAux,'DELETE FROM HISTCOTAINTEGRALIZA WHERE (IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+')  AND '+
                                    '((IDPLANPREVCTBPATR = '+Qry.FieldByName('IDPLANPREVCTBPATRO').AsString+')  OR  '+
                                    ' (IDPLANPREVCTBPATR = '+Qry.FieldByName('IDPLANPREVCTBPATRD').AsString+')) AND '+
                                    ' (IDFUNDOINVEST     = '+Qry.FieldByName('IDFUNDOINVEST').AsString+')       AND '+
                                    ' (DATAAPLICACAO    <= TO_DATE('+QuotedStr(Qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')'+') AND '+
                                    ' (DATAHISTCOTAINTEG = TO_DATE('+QuotedStr(Qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')'+') AND '+
                                    ' (TIPMOVCOTAINTEGR  = ''TRP'') ') then
            Raise Exception.Create('Ocorreu um problema ao excluir o histórico da operação.');
      end;

      //Origem/Destino - OPERAÇÃO
      if not ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE IDLOTE = '+
                                  QuotedStr(Qry.FieldByName('IDLOTE').AsString)) then
         Raise Exception.Create('Ocorreu um problema ao excluir o Lote da Operação.');

      fraMens.Incrementa;

      QryAux.Close;

      DtmBaseDados.dbBaseDados.Commit;

      OperComum.LimpaParametros(QryTipoFundoInvest);
      QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger := Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryTipoFundoInvest.Open;

      if Qry.FieldByName('DATAOPERACAO').AsDateTime <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         if Not Reprocessamento(iTipoInvestUsu,
                                QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1,
                                Qry.FieldByName('DATAOPERACAO').AsDateTime,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                Qry.FieldByName('DTAINIPROC').AsDateTime, True,
                                OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                          QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0)
         else
            MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
      end
      else
         MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      QryTipoFundoInvest.Close;

   Except
      On E:Exception Do Begin
         MsgDlg('Não foi possível Excluir a Operação :'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         //Cancela Transação
         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
      End;
   end;
   QryAux1.Close;   
   QryAux.Close;
   fraMens.Apaga;
   sbtnApagar.Enabled := False;
   bbtnCancelarClick(Sender);
end;

function TfrmCadTransfPlanoCotaIntegr.VerLoteExclusao(iFundo, iPlano : Integer;
                                                   dData   : TDateTime;
                                                   sLote   : String) : Boolean;
begin
   //Busca lotes com maior idlote{a order de exclusão e decrescente}
   if FazQuery(QryAux,'SELECT IDLOTE FROM OPERACAOFUNDO WHERE '+
                      '     IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+
                      ' AND IDPLANPREVCTBPATR = '+IntToStr(iPlano)+
                      ' AND IDFUNDOINVEST     = '+IntToStr(iFundo)+
                      ' AND DATAOPERACAO      = TO_DATE('+QuotedStr(DateToStr(dData))+','+QuotedStr('DD/MM/YYYY')+')'+
                      ' AND IDTIPOOPERACAO    = -107'+
                      ' AND IDLOTE            > '+QuotedStr(sLote)) Then
      Result := True
   else
      Result := False;
      
   QryAux.Close;      
end;

end.
