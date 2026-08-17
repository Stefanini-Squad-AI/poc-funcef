unit FCadTransfDireitoLote;

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
  TfrmCadTransfDireitoLote = class(TFrmCadastroGridCS)
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
    lblTipoOper: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    lblDtOperacao: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    lblPercentual: TLabel;
    redtPercentual: TRealEdit;
    pnlAltSaldos: TPanel;
    qryPlanoPatroOrig: TwwQuery;
    qryPlanoPatroDestino: TwwQuery;
    qryCarteira: TwwQuery;
    qryTipoOperacao: TwwQuery;
    dsSaldosATransf: TwwDataSource;
    fraMens: TfraMensagem;
    sbtnFiltrar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    lblPercentualTransf: TLabel;
    lblQtdTransf: TLabel;
    lblVlrTransf: TLabel;
    redtPercentualTransf: TDBRealEdit;
    redQtdTransf: TDBRealEdit;
    redVlrTransf: TDBRealEdit;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    memObs: TMemo;
    lblObservacao: TLabel;
    CdsSldTRCPlanoSintetico: TCMClientDataSet;
    sqlSldTRCPlanoSintetico: TCMSqlParams;
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
    CdsSldTRCPlanoSinteticoPLANPRVCONTABPATRO: TStringField;
    CdsSldTRCPlanoSinteticoDESCTIPOOPERACAO: TStringField;
    CdsSldTRCPlanoSinteticoDESCCARTINVEST: TStringField;
    CdsSldTRCPlanoSinteticoDESCINVESTIMENTO: TStringField;
    CdsSldTRCPlanoSinteticoSGLCUSTODIANTE: TStringField;
    CdsSldTRCPlanoSinteticoSIGLAMOTBLOQ: TStringField;
    CdsSldTRCPlanoSinteticoQTD: TFloatField;
    CdsSldTRCPlanoSinteticoDATAEX: TDateTimeField;
    CdsSldTRCPlanoSinteticoDATAPREV: TDateTimeField;
    CdsSldTRCPlanoSinteticoDTBASE: TDateTimeField;
    CdsSldTRCPlanoSinteticoDATAAGE: TDateTimeField;
    CdsSldTRCPlanoSinteticoIDINVESTIMENTO: TFloatField;
    CdsSldTRCPlanoSinteticoIDOPERACAODIREITO: TFloatField;
    CdsSldTRCPlanoSinteticoIDTIPOOPERACAO: TFloatField;
    CdsSldTRCPlanoSinteticoPU: TFloatField;
    CdsSldTRCPlanoSinteticoVALOR: TFloatField;
    CdsSldTRCPlanoSinteticoPERCTRANSFERIDO: TFloatField;
    CdsSldTRCPlanoSinteticoQTDTRANSFERIDO: TFloatField;
    CdsSldTRCPlanoSinteticoVLRTRANSFERIDO: TFloatField;
    CdsSldTRCPlanoSinteticoDATAOPERACAO: TStringField;
    CdsSldTRCPlanoSinteticoIDCUSTODIANTE: TFloatField;
    CdsSldTRCPlanoSinteticoIDMOTIVOBLOQUEIO: TFloatField;
    CdsSldTRCPlanoSinteticoIDCARTEIRAINVEST: TFloatField;
    CdsSldTRCPlanoSinteticoIDCARTEIRAGERENC: TFloatField;
    CdsSldTRCPlanoSinteticoIDFORCLI: TFloatField;
    CdsSldTRCPlanoSinteticoIDOPERACAOINVEST: TFloatField;
    qryIDOPERDIRTRANSF: TFloatField;
    qryIDOPERACAODIREITO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDTIPOOPERDEST: TFloatField;
    qryIDTIPOOPERORIG: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryIDPLANPREVCTBPATRORIG: TFloatField;
    qryIDPLANPREVCTBPATRDEST: TFloatField;
    qryQTDEOPERACAO: TFloatField;
    qryPUORIGEM: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryIDBOLETA: TStringField;
    qryIDOPERINVESTORIG: TFloatField;    
    qryIDCUSTODIAORIG: TFloatField;
    qryIDFORCLIORIG: TFloatField;
    qryIDMOTIVOBLOQORIG: TFloatField;
    qryIDCARTINVESTORIG: TFloatField;
    qryIDINVESTORIG: TFloatField;
    qryDATAVENCORIG: TDateTimeField;
    qryPLORIG: TStringField;
    qryPLDEST: TStringField;
    qryDESCINVESTIMENTO: TStringField;
    qrySGLCUSTODIANTE: TStringField;
    qryDESCCARTINVEST: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    CdsSldTRCPlanoSinteticoIDOPERACAOORIGEM: TFloatField;
    qryIDOPERINVESTDEST: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure PintaGridZebrado(Sender: TObject; Field: TField; State:
                               TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure GridRefresh(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnFiltrarClick(Sender: TObject);
    procedure mnuAlterarClick(Sender: TObject);
    procedure mnuExcluirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure redtPercentualTransfEnter(Sender: TObject);
    procedure redtPercentualTransfExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
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

  procedure AtualizaProgTRPlanoDirRV(sMsg: String = ''; iMax: Integer = -1);

var
  frmCadTransfDireitoLote: TfrmCadTransfDireitoLote;
  fPercAnt: Double;

implementation

uses uMensErro, DBaseDados, UDataBase, URendaVariavel, UOperComum, UBibliotecaInvest,
     UDiasUteisInv, FPrincipal, uCtrlInvContab, dOperComum;

{$R *.DFM}

procedure TfrmCadTransfDireitoLote.sbtnInserirClick(Sender: TObject);
begin
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;
   
   CdsSldTRCPlanoSintetico.Close;

   dblkPlanPatroO.Text:= '';
   dblkPlanPatroD.Text:= '';
   dblkCarteira.Text:= '';
   dblkTipoOper.Text:= '';
   dbDtaOperacao.Text:= '';
   redtPercentual.Text:= '';
   memObs.Text:= '';
   pnlSaldos.BringToFront;
   pnlAltSaldos.SendToBack;
   pnlAltSaldos.Enabled := False;
   sbtnFiltrar.Visible := True;
   sbtnAlterar.Enabled := False;
   sbtnApagar.Enabled := False;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled := True;
   if dblkPlanPatroO.CanFocus then
      dblkPlanPatroO.SetFocus;
end;

procedure TfrmCadTransfDireitoLote.sbtnAlterarClick(Sender: TObject);
begin
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;
   inherited;
end;


procedure TfrmCadTransfDireitoLote.FormShow(Sender: TObject);
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

procedure TfrmCadTransfDireitoLote.FormCreate(Sender: TObject);
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

procedure TfrmCadTransfDireitoLote.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then     //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadTransfDireitoLote.FormClose(Sender: TObject; var Action: TCloseAction);
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
   FreeAndNil(CtrlRendaVariavel);   
end;

procedure TfrmCadTransfDireitoLote.PintaGridZebrado(Sender: TObject; Field: TField; State:
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

procedure TfrmCadTransfDireitoLote.GridRefresh(Sender: TObject);
begin
  inherited;
   // Acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmCadTransfDireitoLote.CmeCadastroAtualizaBotoes(Sender: TObject);
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

procedure TfrmCadTransfDireitoLote.bbtnCancelarClick(Sender: TObject);
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

function TfrmCadTransfDireitoLote.ValidaFiltros: Boolean;
begin
   Result := False;

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
   if Trim(dblkTipoOper.Text) = '' then
   begin
      MsgDlg('Informe o Tipo de Operação.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dblkTipoOper.CanFocus then
         dblkTipoOper.SetFocus;
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

   Result := True;
end;

function TfrmCadTransfDireitoLote.AlteraSaldo: Boolean;
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

function TfrmCadTransfDireitoLote.ExcluiSaldo: Boolean;
begin
   if MsgDlg('Retira esta aplicação deste Lote de Transferência?', 'Mensagem do Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      CdsSldTRCPlanoSintetico.Delete;
end;

procedure TfrmCadTransfDireitoLote.mnuAlterarClick(Sender: TObject);
begin
  inherited;
  AlteraSaldo;
end;

procedure TfrmCadTransfDireitoLote.mnuExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluiSaldo;
end;

procedure TfrmCadTransfDireitoLote.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   if CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat > 100 then
   begin
      MsgDlg('Não é possível transferir mais de cem por cento do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redtPercentualTransf.CanFocus then
         redtPercentualTransf.SetFocus;
      Exit;
   end;
   if CdsSldTRCPlanoSintetico.FieldByName('QTDTRANSFERIDO').AsFloat > CdsSldTRCPlanoSintetico.FieldByName('QTD').AsFloat then
   begin
      MsgDlg('Não é possível transferir mais que o saldo do título', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if redQtdTransf.CanFocus then
         redQtdTransf.SetFocus;
      Exit;
   end;
   if CdsSldTRCPlanoSintetico.FieldByName('VLRTRANSFERIDO').AsFloat > CdsSldTRCPlanoSintetico.FieldByName('VALOR').AsFloat then
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

procedure TfrmCadTransfDireitoLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CdsSldTRCPlanoSintetico.Cancel;
  pnlAltSaldos.SendToBack;
  pnlAltSaldos.Enabled := False;
  bbtnConfirmar.Enabled := True;
end;

procedure TfrmCadTransfDireitoLote.redtPercentualTransfEnter(Sender: TObject);
begin
   inherited;
   fPercAnt := CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat;
end;

procedure TfrmCadTransfDireitoLote.redtPercentualTransfExit(Sender: TObject);
begin
   inherited;
   if fPercAnt <> CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat then
   begin
      // Recalcula os valores
      CdsSldTRCPlanoSintetico.FieldByName('QTDTRANSFERIDO').AsFloat := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('QTD').AsFloat * (redtPercentualTransf.Value / 100), 2);
      CdsSldTRCPlanoSintetico.FieldByName('VLRTRANSFERIDO').AsFloat := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('VALOR').AsFloat * (redtPercentualTransf.Value / 100), 2);
   end;
end;

procedure TfrmCadTransfDireitoLote.bbtnConfirmarClick(Sender: TObject);
var fMax, fPos, iResp : Integer;
    sTipoDir, sBoleta, sInvestimento : String;
    iTipoConta, iCustEx : Integer;
    QryLocalBoleta : TwwQuery;    
begin
   if RendaVariavel.VerEmAbertura then
      Exit;

   if not CtrlInvContab.TestaPeriodo(dbDtaOperacao.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;
      
   try
      QryLocalBoleta := TwwQuery.Create(Application);
      QryLocalBoleta.DatabaseName := 'BaseDados';
      try
         // Prepara o ambiente para transferir
         fraMens.Mostra;
         fraMens.Max := CdsSldTRCPlanoSintetico.RecordCount;
         fMax := fraMens.Max;
         fraMens.Pos := 0;

         // Seta o Frame para ser atualizado na rotina de transferência
         fPos := fraMens.Pos;
         uRendaVariavel.AtualizaProcFech := AtualizaProgTRPlanoDirRV;

         if ((pRPI.IDTIPOOPERDIRDIV = StrToInt(dblkTipoOper.LookupValue)) or (pRPI.IDTIPOOPERDIRJUR = StrToInt(dblkTipoOper.LookupValue))) then
            sTipoDir := 'A'
         else
            sTipoDir := 'S';

         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         sBoleta := 'RV-'+Copy(DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime),9,2)+'/'+FormatFloat('0000',
                     LeUltRegistro(Nil,'CONTDOCRENVAR'+Copy(DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime),9,2)));

         // Não leva o IDFORCLI em função do LOTE da Boleta
         ExecutaQuery(QryLocalBoleta,'INSERT INTO BOLETA (IDBOLETA, DATABOLETA, IDFORCLI, STATUS, TIPMOVBOLETA) VALUES ('+
                                     QuotedStr(sBoleta)+', TO_DATE('+
                                     QuotedStr(DateToStr(CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime))+',''DD/MM/YYYY''), '+
                                     CdsSldTRCPlanoSintetico.FieldByName('IDFORCLI').AsString+', ''F'',''TPD'')');


         CdsSldTRCPlanoSintetico.DisableControls;

         if not RendaVariavel.TransfEntrePlanosDir(CdsSldTRCPlanoSintetico,
                                                   StrToInt(dblkPlanPatroO.LookupValue),
                                                   StrToInt(dblkPlanPatroD.LookupValue),
                                                   memObs.Text,
                                                   sBoleta,
                                                   sTipoDir) then
             Raise Exception.Create('');
             
         CdsSldTRCPlanoSintetico.EnableControls;             

         if DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Commit;

         // Volta o controle do frame para a tela
         uRendaVariavel.AtualizaProcFech := nil;

         MsgDlg('Operação concluída com sucesso.', 'Mensagem do Sistema', mtInformation,[mbOk],0);

         // Prepara o ambiente para consulta de transferências
         pnlSaldos.SendToBack;
         sbtnFiltrar.Visible := False;
         CmeCadastro.AtualizaBotoes(Self);
         SelBoleta('');
      except
         on E:Exception do
         begin
            DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Não foi Possível Efetuar esta Transferência' + #13 +
                   E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
            bbtnCancelar.Click;
         end;
      end;
   finally
      // Volta o controle do frame para a tela
      uRendaVariavel.AtualizaProcFech := nil;
      FreeAndNil(QryLocalBoleta);
      fraMens.Apaga;
      CmeCadastro.AtualizaBotoes(Self);
      FormResize(Self);
   end;

end;

procedure AtualizaProgTRPlanoDirRV(sMsg: String = ''; iMax: Integer = -1);
begin
   if iMax = -2 then
      frmCadTransfDireitoLote.fraMens.Apaga
   else if iMax = -1 then
      frmCadTransfDireitoLote.fraMens.Incrementa
   else if iMax > 0 then
   begin
      frmCadTransfDireitoLote.fraMens.Mostra;
      frmCadTransfDireitoLote.fraMens.Max := iMax;
      frmCadTransfDireitoLote.fraMens.Min := 0;
      frmCadTransfDireitoLote.fraMens.Pos := 0;
   end;

   if sMsg <> '' then
      frmCadTransfDireitoLote.fraMens.Mes := sMsg;

   Application.ProcessMessages;
end;


procedure TfrmCadTransfDireitoLote.FormResize(Sender: TObject);
begin
   inherited;
   fraMens.Width := (TForm(Sender).Width - 344);
   fraMens.pnlProgressoMensagem.Width := Trunc((TForm(Sender).Width - 344)/2);
   Application.ProcessMessages;
end;

procedure TfrmCadTransfDireitoLote.sbtnApagarClick(Sender: TObject);
var sMens, sBoleta: String;
    qryLocalBusca, qryLocalExclusao, qryLocalExclusao2 : TwwQuery;
    iOperCustodia : Integer;
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

   if (MsgDlg('Serão excluídas todas as Operações desta Boleta !', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
      exit;

   sBoleta := qry.FieldByName('IDBOLETA').AsString;

   Try
      qryLocalExclusao2 := TwwQuery.Create(Application);
      qryLocalExclusao2.DatabaseName := 'BaseDados';

      qryLocalExclusao := TwwQuery.Create(Application);
      qryLocalExclusao.DatabaseName := 'BaseDados';

      qryLocalBusca := TwwQuery.Create(Application);
      qryLocalBusca.DatabaseName := 'BaseDados';

      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         sMens := 'Exclusão da boleta ' + qry.FieldByName('IDBOLETA').AsString;

         AtualizaProgTRPlanoDirRV(sMens, 0);

         if FazQuery(qryLocalExclusao, 'SELECT OI.IDOPERCUSTODIA, OI.IDOPERACAOINVEST FROM OPERACAOINVEST OI '+#13+
                                       'WHERE OI.NUMDOCUMENTO = '+QuotedStr(qry.FieldByName('IDBOLETA').AsString)+#13+
                                       '  AND OI.DATAOPERACAO = TO_DATE('+QuotedStr(qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')') then
         begin
            while not qryLocalExclusao.Eof do
            begin
               if FazQuery(qryLocalBusca, 'SELECT HC.PLANO, HC.PLNCODIGO FROM HISTCARTINV HC '+#13+
                                          'WHERE  HC.IDOPERACAOINVEST = '+qryLocalExclusao.FieldByName('IDOPERACAOINVEST').AsString+#13+
                                          ' ORDER BY HC.DATAMOVCARTINV, HC.IDHISTCARTINV ') then
               begin
                  if not ExecutarQuery(qryLocalExclusao2, 'DELETE FROM HISTCARTINV WHERE IDOPERACAOINVEST = '+qryLocalExclusao.FieldByName('IDOPERACAOINVEST').AsString) then
                     Raise Exception.Create('Não é possível excluir o Histórico da Carteira, referente a boleta '+qry.FieldByName('IDBOLETA').AsString+'.');

                  qryLocalExclusao2.Close;

                  while not qryLocalBusca.Eof do
                  begin
                     if qryLocalBusca.FieldByName('PLNCODIGO').AsInteger > 0 then
                     begin
                        sMens := 'Exclusão contábil do histórico.';

                        AtualizaProgTRPlanoDirRV(sMens, 0);

                        if not OperComum.ProcExclui(0{iDocumento},
                                                    qryLocalBusca.FieldByName('PLNCODIGO').AsInteger,
                                                    qryLocalBusca.FieldByName('PLANO').AsInteger,
                                                    iTipoInvestUsu,
                                                    qry.FieldByName('DATAOPERACAO').AsDateTime, True, False) then
                           Raise Exception.Create('Problemas na exclusão do contábil do Histórico da Carteira, referente a boleta '+qry.FieldByName('IDBOLETA').AsString+'.');
                     end;
                     qryLocalBusca.Next;
                  end;
               end;

               qryLocalBusca.Close;

               if not qryLocalExclusao.FieldByName('IDOPERCUSTODIA').IsNull then
               begin
                  if not ExecutarQuery(qryLocalExclusao2,'DECLARE '+#13+
                                                         'BEGIN '+#13+
                                                         ' DELETE FROM HISTCUSTODIA WHERE IDOPERCUSTODIA = ' +qryLocalExclusao.FieldByName('IDOPERCUSTODIA').AsString+';'+#13+
                                                         ' UPDATE OPERACAOINVEST SET OPERACAOINVEST.IDOPERCUSTODIA = NULL WHERE OPERACAOINVEST.IDOPERCUSTODIA = ' +qryLocalExclusao.FieldByName('IDOPERCUSTODIA').AsString+';'+#13+
                                                         ' DELETE FROM OPERCUSTODIA WHERE IDOPERCUSTODIA = ' +qryLocalExclusao.FieldByName('IDOPERCUSTODIA').AsString+';'+#13+
                                                         'END; ') then
                     Raise Exception.Create('Não é possível excluir a operação na Custódia, '+#13+
                                            'verificar se há operações já lançadas para esse Investimento.');
               end;

               qryLocalExclusao.Next;
            end;
         end;
         
         qryLocalExclusao.Close;

         if not ExecutarQuery(qryLocalExclusao,'DECLARE '+#13+
                                               'BEGIN '+#13+
                                               ' UPDATE OPERDIRTRANSF SET OPERDIRTRANSF.IDOPERINVESTORIG = NULL, OPERDIRTRANSF.IDOPERINVESTDEST = NULL WHERE '+#13+
                                               ' IDBOLETA = '+QuotedStr(qry.FieldByName('IDBOLETA').AsString)+#13+
                                               '  AND DATAOPERACAO = TO_DATE('+QuotedStr(qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'');'+#13+
                                               ' DELETE FROM OPERACAOINVEST WHERE NUMDOCUMENTO = '+QuotedStr(qry.FieldByName('IDBOLETA').AsString)+#13+
                                               '  AND DATAOPERACAO = TO_DATE('+QuotedStr(qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'');'+#13+
                                               ' DELETE FROM OPERDIRTRANSF WHERE IDBOLETA = '+QuotedStr(qry.FieldByName('IDBOLETA').AsString)+#13+
                                               '  AND DATAOPERACAO = TO_DATE('+QuotedStr(qry.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY''); '+#13+
                                               'END; ') then
            Raise Exception.Create('Não é possível excluir a operação de Transferência, existem operações realizadas e baseadas nessa operação.'+#13+
                                   'Verificar demais operações desse investimento com data igual ou posterior ao dia '+qry.FieldByName('DATAOPERACAO').AsString);
         qryLocalExclusao.Close;

         if FazQuery(qryLocalExclusao, 'SELECT B.PLANO, B.PLNCODIGO FROM BOLETA B WHERE B.IDBOLETA = '+QuotedStr(qry.FieldByName('IDBOLETA').AsString)) then
         begin
            if qryLocalExclusao.FieldByName('PLNCODIGO').AsInteger > 0 then
            begin
               sMens := 'Exclusão contábil da boleta ' + qry.FieldByName('IDBOLETA').AsString;

               AtualizaProgTRPlanoDirRV(sMens, 0);

               if not OperComum.ProcExclui(0{iDocumento},
                                           qryLocalExclusao.FieldByName('PLNCODIGO').AsInteger,
                                           qryLocalExclusao.FieldByName('PLANO').AsInteger,
                                           iTipoInvestUsu,
                                           qry.FieldByName('DATAOPERACAO').AsDateTime, True, False) then
                  Raise Exception.Create('Problemas na exclusão do contábil, referente a boleta '+qry.FieldByName('IDBOLETA').AsString+'.');
            end;
         end;

         qryLocalExclusao.Close;

         sMens := 'Exclusão da boleta ' + qry.FieldByName('IDBOLETA').AsString;

         AtualizaProgTRPlanoDirRV(sMens, 0);

         if not ExecutarQuery(qryLocalExclusao,'DELETE FROM BOLETA WHERE IDBOLETA = '+QuotedStr(qry.FieldByName('IDBOLETA').AsString)) then
            Raise Exception.Create('Não é possível excluir a boleta '+qry.FieldByName('IDBOLETA').AsString+'.');

         qryLocalExclusao.Close;

         if DtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         if (qry.FieldByName('DATAOPERACAO').AsDateTime <= pRPI.DATAULTFECH) then
         begin
            qry.First;
            qry.Locate('IDBOLETA',  sBoleta,[]);
            while not qry.eof do
            begin
               if sBoleta = qry.FieldByName('IDBOLETA').AsString then
               begin
                  sMens := 'Marcando para Reprocessamento ' + qry.FieldByName('DESCINVESTIMENTO').AsString;

                  AtualizaProgTRPlanoDirRV(sMens, 0);

                  if not dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  // Marca carteira Origem
                  if not RendaVariavel.MarcarFlagReproc(qry.FieldByName('IDINVESTORIG').AsInteger,
                                                        qry.FieldByName('IDCARTINVESTORIG').AsInteger,
                                                        qry.FieldByName('IDPLANPREVCTBPATRORIG').AsInteger,
                                                        qry.FieldByName('DATAOPERACAO').AsDateTime) then
                     Raise Exception.Create('Não foi possível marcar para Reprocessar o Plano de Origem.');

                  if DtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.Commit;

                  if not dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  // Marca carteira Destino
                  if not RendaVariavel.MarcarFlagReproc(qry.FieldByName('IDINVESTORIG').AsInteger,
                                                        qry.FieldByName('IDCARTINVESTORIG').AsInteger,
                                                        qry.FieldByName('IDPLANPREVCTBPATRDEST').AsInteger,
                                                        qry.FieldByName('DATAOPERACAO').AsDateTime) then
                     Raise Exception.Create('Não foi possível marcar para Reprocessar o Plano de Destino.');

                  if DtmBaseDados.dbBaseDados.InTransaction then
                      dtmBaseDados.dbBaseDados.Commit;
               end;       
               qry.Next;
            end;
         end;
      Except on E: Exception do
         begin
            if DtmBaseDados.dbBaseDados.InTransaction then
               DtmBaseDados.dbBaseDados.Rollback;
            MsgDlg(E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      FreeAndNil(qryLocalExclusao2);
      FreeAndNil(qryLocalExclusao);
      FreeAndNil(qryLocalBusca);
      qry.Close;
      qry.Open;
      qry.EnableControls;
      CmeCadastro.AtualizaBotoes(Self);
   end;
end;

procedure TfrmCadTransfDireitoLote.SelBoleta(sBoleta: String);
begin
   OperComum.LimpaParametros(qry);
   if sBoleta <> '' then
      qry.ParamByName('NUMDOCUMENTO').AsString := sBoleta;
   qry.Open;
   pnlFundo.BringToFront;
   sbtnFiltrar.Visible := False;
end;

procedure TfrmCadTransfDireitoLote.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      qry.Locate('IDBOLETA', MontaSelect.ValoresChave[0], [])
   else
      SelBoleta('');
end;

procedure TfrmCadTransfDireitoLote.sbtnFiltrarClick(Sender: TObject);
var iResp : Integer;
    dDataSaldo : TDateTime;
    fPU : Double;
    sTipoDir : String;
begin
   inherited;
   CdsSldTRCPlanoSintetico.Close;
   if Not ValidaFiltros then
      Exit;

   try //Finally
      try //Except
         fraMens.Mostra;
         fraMens.Mes := 'Buscando Direitos a transferir...';

         dDataSaldo := DiasUteisInv.UltDiaUtilAnterior(StrToDate(dbDtaOperacao.Text),-1,1,'',True,False,False);

         if ((pRPI.IDTIPOOPERDIRDIV = StrToInt(dblkTipoOper.LookupValue)) or (pRPI.IDTIPOOPERDIRJUR = StrToInt(dblkTipoOper.LookupValue))) then
            sTipoDir := 'A'
         else
            sTipoDir := 'S';

         CdsSldTRCPlanoSintetico.DisableControls;            
         CdsSldTRCPlanoSintetico.Data := CtrlRendaVariavel.BuscaDirTRCPlanoSintetico(dDataSaldo,
                                                                                     StrToInt(dblkTipoOper.LookupValue),
                                                                                     qryPlanoPatroOrig.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                                                     qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                                                     sTipoDir);
         fraMens.Max := CdsSldTRCPlanoSintetico.RecordCount;
         fraMens.Pos := 0;
         while not CdsSldTRCPlanoSintetico.Eof do
         begin
            fraMens.Mes := 'Preparando percentuais de ' + #13 + CdsSldTRCPlanoSintetico.FieldByName('DESCINVESTIMENTO').AsString;

            //Ricardo Cristiano - 11/11/2010 - N. Sol 147412 -  N. Kintana 1019370 
            fPU := CdsSldTRCPlanoSintetico.FieldByName('PU').AsFloat; 

            if sTipoDir = 'S' then
            begin
               CtrlRendaVariavel.BuscaSaldoRV.Executa(dbDtaOperacao.Date,
                                                      qryPlanoPatroOrig.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                      CdsSldTRCPlanoSintetico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger, 0, High(Integer));

               if CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal <= 0 then
               begin
                  CdsSldTRCPlanoSintetico.Delete;
                  Continue;
               end;

               fPU := OperComum.DivValorZero(CtrlRendaVariavel.BuscaSaldoRV.SaldoVlrTotal,
                                             CtrlRendaVariavel.BuscaSaldoRV.SaldoQtdTotal);

               CdsSldTRCPlanoSintetico.Edit;
               CdsSldTRCPlanoSintetico.FieldByName('VALOR').AsFloat := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('QTD').AsFloat * fPU, 2);
               CdsSldTRCPlanoSintetico.Post;

            end;

            CdsSldTRCPlanoSintetico.Edit;
            CdsSldTRCPlanoSintetico.FieldByName('DATAOPERACAO').AsDateTime     := dbDtaOperacao.Date;
            CdsSldTRCPlanoSintetico.FieldByName('PERCTRANSFERIDO').AsFloat     := redtPercentual.Value;            
            CdsSldTRCPlanoSintetico.FieldByName('QTDTRANSFERIDO').AsFloat      := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('QTD').AsFloat * (redtPercentual.Value / 100), 0);
            //Ricardo Cristiano - 11/11/2010 - N. Sol 147412 -  N. Kintana 1019370
            CdsSldTRCPlanoSintetico.FieldByName('VLRTRANSFERIDO').AsFloat      := RoundCM(CdsSldTRCPlanoSintetico.FieldByName('VALOR').AsFloat * (redtPercentual.Value / 100), 2);
            CdsSldTRCPlanoSintetico.FieldByName('PU').AsFloat                  := fPU;
            CdsSldTRCPlanoSintetico.Post;

            CdsSldTRCPlanoSintetico.Next;
            fraMens.Incrementa;
         end;
         CdsSldTRCPlanoSintetico.First;
         
         CdsSldTRCPlanoSintetico.EnableControls;

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

procedure TfrmCadTransfDireitoLote.dbgSaldosDblClick(Sender: TObject);
begin
  inherited;
  AlteraSaldo;
end;

procedure TfrmCadTransfDireitoLote.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
   CmeCadastro.AtualizaBotoes(Self);
end;

end.
