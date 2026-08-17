unit fEstornaMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, fcLabel,
  TB97Tlwn, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, DBCtrls, ComCtrls,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery;

type
  TfrmEstornaMovimentacao = class(TfrmOkCancelar)
    Dock973: TDock97;
    ToolWindow972: TToolWindow97;
    fcLabel3: TfcLabel;
    edDataMov: TCMDateTimePicker;
    cmbControle: TComboBox;
    fcLabel1: TfcLabel;
    pgctlEstorno: TPageControl;
    TabBem: TTabSheet;
    pnlBem: TPanel;
    Label22: TLabel;
    Label26: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    Label4: TLabel;
    dbeDesBem: TDBMemo;
    bbtnSelBem: TBitBtn;
    edPlaca: TEdit;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResp: TwwDBEdit;
    dbeDescGrupo: TwwDBEdit;
    pnlAcrescimos: TPanel;
    Label5: TLabel;
    dbgAcrescimos: TwwDBGrid;
    dbeDescConjunto: TwwDBEdit;
    TabSelBem: TTabSheet;
    pnlSelBem: TPanel;
    Label9: TLabel;
    Label8: TLabel;
    Processo: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeTermo: TwwDBEdit;
    bbtnTermo: TBitBtn;
    dbeSbxProcesso: TwwDBEdit;
    dbeRespConj: TwwDBEdit;
    dbgBalPatBem: TwwDBGrid;
    dbeDataSel: TCMDateTimePicker;
    qrySelTermo: TwwQuery;
    qrySelTermoIDSELBAIXA: TFloatField;
    qrySelTermoSBXTERMO: TFloatField;
    qrySelTermoSBXPROCESSO: TStringField;
    qrySelTermoSBXDATA: TDateTimeField;
    qrySelTermoSBXNOMERESP: TStringField;
    qrySelTermoSBXFLGEXECUTADO: TFloatField;
    qrySelTermoSBXDTAEXECUTADO: TDateTimeField;
    qrySelTermoSBTIPOMOV: TFloatField;
    dsSelTermo: TwwDataSource;
    updSelTermo: TUpdateSQL;
    qryBensSelec: TwwQuery;
    qryBensSelecPLACA: TFloatField;
    qryBensSelecDESBEM: TStringField;
    qryBensSelecDESCCONJATUAL: TStringField;
    qryBensSelecNOMELOCAATUAL: TStringField;
    qryBensSelecNOMERESPATUAL: TStringField;
    qryBensSelecDESCGRUPATUAL: TStringField;
    qryBensSelecDESCCONJNOVO: TStringField;
    qryBensSelecNOMELOCANOVO: TStringField;
    qryBensSelecNOMERESPNOVO: TStringField;
    qryBensSelecDESCGRUPNOVO: TStringField;
    qryBensSelecIDSELBAIXA: TFloatField;
    qryBensSelecIDBEM: TFloatField;
    qryBensSelecIDPESSOA: TFloatField;
    qryBensSelecIDCONJUNTO: TFloatField;
    qryBensSelecIDGRUPO: TFloatField;
    dsBensSelec: TwwDataSource;
    MSTermo: TMontaSelect;
    dsSelBem: TwwDataSource;
    qrySelBem: TwwQuery;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    qrySelBemIDCLASSEBEM: TFloatField;
    qrySelBemIDGRUPO: TFloatField;
    qrySelBemDESCGRUPO: TStringField;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    updAcrescimos: TUpdateSQL;
    dsAcrescimos: TwwDataSource;
    qryAcrescimos: TwwQuery;
    qryAcrescimosMARCADO: TFloatField;
    qryAcrescimosDATAACRESCIMO: TDateTimeField;
    qryAcrescimosVALORG: TFloatField;
    qryAcrescimosOBS: TStringField;
    qryAcrescimosIDACRESCIMO: TFloatField;
    qryAcrescimosIDMOVIMENTACAO: TFloatField;
    qryParamCAF: TwwQuery;
    qryParamCAFALUGUELINTERNO: TFloatField;
    qryParamCAFSEQBEMEMP: TFloatField;
    qryParamCAFEDITACODBEM: TFloatField;
    qryParamCAFMOEDAFISCAL: TFloatField;
    qryParamCAFMOEDAGERENCIAL: TFloatField;
    qryParamCAFMOEDAOFICIAL: TFloatField;
    qryParamCAFMASCCODGRUPO: TStringField;
    qryParamCAFSISTEMAS: TStringField;
    qryParamCAFINTEGRACONTAB: TStringField;
    qryAux: TwwQuery;
    TabReavCBS: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    qryBensReaval: TwwQuery;
    dsBensReaval: TwwDataSource;
    qryBensReavalIDBEM: TFloatField;
    qryBensReavalIDPESSOA: TFloatField;
    qryBensReavalPLACA: TFloatField;
    qryBensReavalDESBEM: TStringField;
    qryBensReavalNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbControleEnter(Sender: TObject);
    procedure cmbControleExit(Sender: TObject);
    procedure edDataMovExit(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnTermoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgAcrescimosDblClick(Sender: TObject);
    procedure pgctlEstornoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    MensagemErro : String;
  public
    { Public declarations }
    iIdAcrescimo   : Integer;
    bIntegraContab : Boolean;
    function Estorna_TransfBens : Boolean;
    function Estorna_Baixa : Boolean;
  end;

var
  frmEstornaMovimentacao: TfrmEstornaMovimentacao;

implementation

{$R *.DFM}

uses uIntegraBack, uSistema, uAtivoFixo, uMensErro, uDataBase,
     dBaseDados, dAtivoFixo, fAguarde;

procedure TfrmEstornaMovimentacao.FormCreate(Sender: TObject);
begin
   inherited;
   cmbControle.Items.Clear;
   cmbControle.Items.Add('Entrada');
   cmbControle.Items.Add('Baixa');
   cmbControle.Items.Add('Transferência de Bens');
   cmbControle.Items.Add('Acréscimo de Valor');
   cmbControle.Items.Add('Reavaliação');
   cmbControle.Items.Add('Desmembramento');
   //-------------------------------------------------------------------------------------
   qrySelBem.Prepare;
   qryPlaca.Prepare;
   qryParamCAF.Prepare;
   qrySelTermo.Prepare;
   qryBensSelec.Prepare;
   qryAcrescimos.Prepare;
   //-------------------------------------------------------------------------------------
   qryParamCAF.Close;
   qryParamCAF.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryParamCAF.Open;
   //-------------------------------------------------------------------------------------
   bIntegraContab := qryParamCAF.FieldByName('INTEGRACONTAB').AsString = 'S';
   //-------------------------------------------------------------------------------------
   edDataMov.Text := '';
   Screen.Cursor  := crDefault;
   pgctlEstorno.ActivePage := TabBem;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.FormActivate(Sender: TObject);
begin
   inherited;
   cmbControle.SetFocus;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.cmbControleEnter(Sender: TObject);
begin
   inherited;
   edPlaca.Text := '';
   qrySelBem.Close;
   qrySelTermo.Close;
   qryBensSelec.Close;
   qryAcrescimos.Close;
   //-------------------------------------------------------------------------------------
   pnlAcrescimos.Visible := False;
   pgctlEstorno.ActivePage := TabBem;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.cmbControleExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = '' then
   begin
      MsgDlg('Selecione a movimentação que será estornada!','Erro',mtError,[mbOk],0);
      cmbControle.SetFocus;
   end;
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = 'Transferência de Bens' then
   begin
      MSTermo.Filtro.Strings[0] := 'SELBAIXA.SBTIPOMOV = 1';
      TabSelBem.Enabled := True;
   end else
   if cmbControle.Text = 'Baixa' then
   begin
      MSTermo.Filtro.Strings[0] := 'SELBAIXA.SBTIPOMOV = 0';
      TabSelBem.Enabled := True;
   end else
   begin
      pgctlEstorno.ActivePage := TabBem;
      TabSelBem.Enabled := False;
   end;
   //-------------------------------------------------------------------------------------
   {if (cmbControle.Text = 'Reavaliação') then
   begin
      TabReavCBS.Enabled := True;
      pgctlestorno.ActivePage := TabReavCBS;
   end else
   begin
      TabReavCBS.Enabled := False;
   end;}
   //-------------------------------------------------------------------------------------
   if (cmbControle.Text = 'Baixa') or (cmbControle.Text = 'Desmembramento') then
   begin
      dtmAtivoFixo.MSBem.Filtro.Strings[6] := '(BEM.BAIXATOTAL = ''S'')';
   end else
   begin
      dtmAtivoFixo.MSBem.Filtro.Strings[6] := '(BEM.BAIXATOTAL <> ''S'')';
   end;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.edDataMovExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edDataMov.Text = '' then
      MsgDlg('Selecione a data da movimentação!','Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
      //----------------------------------------------------------------------------------
      edPlaca.Text := qrySelBemPLACA.AsString;
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Acréscimo de Valor' then
      begin
         qryAcrescimos.Close;
         qryAcrescimos.ParambyName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qryAcrescimos.ParambyName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
         qryAcrescimos.Open;
         pnlAcrescimos.Visible := True;
      end;
   end else
   begin
      bbtnSelBem.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.edPlacaExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.IsEmpty then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         if qrySelBem.IsEmpty then
         begin
            MsgDlg('Placa Inexistente!','Erro',mtError,[mbOk],0);
            edPlaca.SetFocus;
         end else
         begin
            if (cmbControle.Text = 'Acréscimo de Valor') then
            begin
               qryAcrescimos.Close;
               qryAcrescimos.ParambyName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
               qryAcrescimos.ParambyName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
               qryAcrescimos.Open;
               pnlAcrescimos.Visible := True;
            end;
         end;
      end else
      begin
         edPlaca.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.bbtnTermoClick(Sender: TObject);
begin
   inherited;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTermo.RetornouValor then
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[1]);
      qrySelTermo.Open;
      //----------------------------------------------------------------------------------
      qryBensSelec.Close;
      qryBensSelec.ParamByName('PIDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[1]);
      qryBensSelec.Open;
      //----------------------------------------------------------------------------------
      if (qrySelTermoSBXFLGEXECUTADO.AsInteger = 0) then
      begin
         MsgDlg('Termo de Seleção não executado!','Erro', mtError, [mbOk], 0);
         bbtnTermo.SetFocus;
      end;
      if not (qrySelTermoSBXDTAEXECUTADO.IsNull) then
         if (edDataMov.Date <> qrySelTermoSBXDTAEXECUTADO.AsDateTime) then
            edDataMov.Date := qrySelTermoSBXDTAEXECUTADO.AsDateTime;
   end else
   begin
      bbtnTermo.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.bbtnConfirmarClick(Sender: TObject);
var
   sMensagem, sTipoMov   : String;
   iExercicio, iPeriodo  : Integer;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      // Validação dos Campos
      //----------------------------------------------------------------------------------
      if cmbControle.Text = '' then
         Raise Exception.Create('Selecione a Movimentação que será estornada!');
      //----------------------------------------------------------------------------------
      if (edDataMov.Text = '') then
         Raise Exception.Create('Selecione a Data da Movimentação que será estornada! ');
      //----------------------------------------------------------------------------------
      if pgctlEstorno.ActivePage = TabBem then
      begin
         if qrySelBemIDBEM.IsNull then
            Raise Exception.Create('Selecione o Bem cuja Movimentação será Estornada!');
         //-------------------------------------------------------------------------------
         // Confere se existe a movimentação selecionada na data especificada para o bem
         // selecionado
         //-------------------------------------------------------------------------------
         if cmbControle.Text = 'Entrada' then
            sTipoMov := '01,03'
         else
         if cmbControle.Text = 'Transferência de Bens' then
            sTipoMov := '05,11,12'
         else
         if cmbControle.Text = 'Baixa' then
            sTipoMov := '06,25,24,26,20,28,27,29,37,38,39,40'
         else
         if cmbControle.Text = 'Reavaliação' then
            sTipoMov := '08,53,54'
         else
         if cmbControle.Text = 'Acréscimo de Valor' then
            sTipoMov := '09'
         else
         if cmbControle.Text = 'Desmembramento' then
            sTipoMov := '13,25,24,26,20,28,27,29,37,38,39,40';
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO'+
                            ' FROM HISTORICOMOVIMENTACAO'+
                            ' WHERE (IDBEM    = ' + qrySelBemIDBEM.AsString    + ')' +
                            '   AND (IDPESSOA = ' + qrySelBemIDPESSOA.AsString + ')' +
                            '   AND (DATAMOVIMENTACAO = TO_DATE(' + #39 + edDataMov.Text + #39 + ',' + #39 + 'dd/mm/yyyy' + #39 + '))' +
                            '   AND (IDTIPOMOVIMENTACAO IN ('+ sTipoMov + '))';
         qryAux.Open;
         if qryAux.IsEmpty then
            Raise Exception.Create('Não existe '+cmbControle.Text+' do bem '+edPlaca.Text+' na data fornecida!');
         qryAux.Close;
      end else
      //----------------------------------------------------------------------------------
      // Estorno de Seleção de Bens
      //----------------------------------------------------------------------------------
      if pgctlEstorno.ActivePage = TabSelBem then
      begin
         if dbeTermo.Text = '' then
            Raise Exception.Create('Selecione um Termo de Seleção!');
         //-------------------------------------------------------------------------------
         if not qrySelTermo.FieldByName('SBXDTAEXECUTADO').IsNull then
            if edDataMov.Date <> qrySelTermo.FieldByName('SBXDTAEXECUTADO').AsDateTime then
               edDataMov.Date := qrySelTermo.FieldByName('SBXDTAEXECUTADO').AsDateTime;
      end;
      //----------------------------------------------------------------------------------
      if bIntegraContab then
         if not AtivoFixo.VerificaPeriodoContabil(Sistema.IdEmpresa, edDataMov.Date,
                                                  iExercicio, iPeriodo, sMensagem, True) then
            Raise Exception.Create(AtivoFixo.MensagemErro);
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Entrada' then
      begin
         if AtivoFixo.EstornaEntrada(Sistema.IdModulo,
                                     qrySelBemIDPESSOA.AsInteger,
                                     qrySelBemIDBEM.AsInteger,
                                     edDataMov.Date,edDataMov.Date,True,True) < 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Transferência de Bens' then
      begin
         if not Estorna_TransfBens then
            Raise Exception.Create(MensagemErro);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Baixa' then
      begin
         if not Estorna_Baixa then
            Raise Exception.Create(MensagemErro);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Reavaliação' then
      begin
         if AtivoFixo.EstornaReavaliacao(Sistema.IdModulo,
                                         qrySelBemIDPESSOA.AsInteger,
                                         qrySelBemIDBEM.AsInteger,
                                         edDataMov.Date,edDataMov.Date,True) < 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Acréscimo de Valor' then
      begin
         qryAcrescimos.CancelUpdates;
         if AtivoFixo.EstornaAcrescimo(Sistema.IdModulo,
                                       qrySelBemIDPESSOA.AsInteger,
                                       qrySelBemIDBEM.AsInteger,
                                       edDataMov.Date,edDataMov.Date,
                                       iIdAcrescimo,True) < 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
      end else
      //----------------------------------------------------------------------------------
      if cmbControle.Text = 'Desmembramento' then
      begin
         if AtivoFixo.EstornaDesmembramento(Sistema.IdModulo,
                                            qrySelBemIDPESSOA.AsInteger,
                                            qrySelBemIDBEM.AsInteger,
                                            edDataMov.Date,edDataMov.Date,
                                            True) < 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
      end;
      //----------------------------------------------------------------------------------
      CommitTransacao;
      MsgDlg('Movimentação Estornada!','Informação',mtInformation,[mbOk],0)
   except
      On E : Exception do
      begin
         RollBackTransacao;
         MsgDlg('Movimentação Não Estornada!' + #13 + #13 + 'Causa : ' + E.Message,
                'Erro',mtError,[mbOk],0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   cmbControle.SetFocus;
end;
//========================================================================================
// Estorna um movimento de Transferência de Bens
//========================================================================================
function TfrmEstornaMovimentacao.Estorna_TransfBens : Boolean;
begin
   try
      if not qrySelTermo.Active then
      begin
         if AtivoFixo.EstornaTransferencia(Sistema.IdModulo,
                                           qrySelBemIDPESSOA.AsInteger,
                                           qrySelBemIDBEM.AsInteger,
                                           edDataMov.Date,
                                           edDataMov.Date,-1,True) < 0 then
            Raise Exception.Create('Estorna TRANSFERÊNCIA : Erro processando o bem ' + qrySelBemPLACA.AsString + #13 + #13 +
                                   AtivoFixo.MensagemErro);
         Result := True;
      end else
      begin
         frmAguarde.Min := 0;
         frmAguarde.Max := qryBensSelec.RecordCount;
         frmAguarde.Pos := 0;
         frmAguarde.Mostra('Estornando Transferência de Bens do Termo');
         qryBensSelec.First;
         while not qryBensSelec.EOF do
         begin
            frmAguarde.Pos := frmAguarde.Pos + 1;
            frmAguarde.Caption := 'Processando Placa ' + qryBensSelecPLACA.AsString +
                                  ' (' + inttostr(frmAguarde.Pos) + '/' + inttostr(frmAguarde.Max) + ')';
            frmAguarde.Mostra('Estornando Transferência de Bens do Termo');
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if AtivoFixo.EstornaTransferencia(Sistema.IdModulo,
                                              qryBensSelecIDPESSOA.AsInteger,
                                              qryBensSelecIDBEM.AsInteger,
                                              edDataMov.Date,
                                              edDataMov.Date,-1,True) < 0 then
               Raise Exception.Create('Estorna TRANSFERÊNCIA : Erro processando o bem ' + qryBensSelecPLACA.AsString + #13 + #13 +
                                      AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            qryBensSelec.Next;
         end;
         //-------------------------------------------------------------------------------
         // Seta o Termo como não Executado
         //-------------------------------------------------------------------------------
         qrySelTermo.Edit;
         qrySelTermoSBXFLGEXECUTADO.AsInteger := 0;
         qrySelTermoSBXDTAEXECUTADO.Clear;
         qrySelTermo.Post;
         qrySelTermo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         Result := True;
         frmAguarde.Apaga;
      end;
   except
      On E : Exception do
      begin
         frmAguarde.Apaga;
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
// Estorna um movimento de Baixa
//========================================================================================
function TfrmEstornaMovimentacao.Estorna_Baixa : Boolean;
begin
   try
      if not qrySelTermo.Active then
      begin
         if AtivoFixo.EstornaBaixa(Sistema.IdModulo,
                                   qrySelBemIDPESSOA.AsInteger,
                                   qrySelBemIDBEM.AsInteger,
                                   edDataMov.Date,edDataMov.Date,True) < 0 then
            Raise Exception.Create('Estorna BAIXA : Erro processando o bem ' + qrySelBemPLACA.AsString + #13 + #13 +
                                   AtivoFixo.MensagemErro);
         Result := True;
      end else
      begin
         frmAguarde.Min := 0;
         frmAguarde.Max := qryBensSelec.RecordCount;
         frmAguarde.Pos := 0;
         frmAguarde.Mostra('Estornando Baixa de Bens do Termo');
         //-------------------------------------------------------------------------------
         qryBensSelec.First;
         while not qryBensSelec.EOF do
         begin
            frmAguarde.Pos := frmAguarde.Pos + 1;
            frmAguarde.Caption := 'Processando Placa ' + qryBensSelecPLACA.AsString +
                                  ' (' + inttostr(frmAguarde.Pos) + '/' + inttostr(frmAguarde.Max) + ')';
            frmAguarde.Mostra('Baixando os Bens do Termo');
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            if AtivoFixo.EstornaBaixa(Sistema.IdModulo,
                                      qryBensSelecIDPESSOA.AsInteger,
                                      qryBensSelecIDBEM.AsInteger,
                                      edDataMov.Date,edDataMov.Date,True) < 0 then
               Raise Exception.Create('Estorna BAIXA : Erro processando o bem ' + qryBensSelecPLACA.AsString + #13 + #13 +
                                      AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            qryBensSelec.Next;
         end;
         //-------------------------------------------------------------------------------
         // Seta o Termo como não Executado
         //-------------------------------------------------------------------------------
         qrySelTermo.Edit;
         qrySelTermoSBXFLGEXECUTADO.AsInteger := 0;
         qrySelTermoSBXDTAEXECUTADO.Clear;
         qrySelTermo.Post;
         qrySelTermo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         frmAguarde.Apaga;
         Result := True;
      end;
   except
      On E : Exception do
      begin
         frmAguarde.Apaga;
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   cmbControle.SetFocus;
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.dbgAcrescimosDblClick(Sender: TObject);
begin
   inherited;
   iIdAcrescimo := qryAcrescimosIDACRESCIMO.AsInteger;
   qryAcrescimos.First;
   while not qryAcrescimos.EOF do
   begin
      qryAcrescimos.Edit;
      if (qryAcrescimosIDACRESCIMO.AsInteger = iIdAcrescimo) then
         qryAcrescimosMARCADO.AsInteger := 1
      else
         qryAcrescimosMARCADO.AsInteger := 0;
      qryAcrescimos.Post;
      qryAcrescimos.Next;
   end;
   if not qryAcrescimos.Locate('IDACRESCIMO',iIdAcrescimo,[]) then
      MsgDlg('Erro durante a seleção do acréscimo de valor!','Erro',mtError,[mbOk],0);
end;

procedure TfrmEstornaMovimentacao.pgctlEstornoChanging(Sender: TObject; var AllowChange: Boolean);
begin
   inherited;
   AllowChange := (cmbControle.Text = 'Transferência de Bens') or
                  (cmbControle.Text = 'Baixa') or
                  (cmbControle.Text = '');
end;
//========================================================================================
procedure TfrmEstornaMovimentacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   dtmAtivoFixo.MSBem.Filtro.Strings[6] := '1=1';
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qrySelBem.Close;
   qryPlaca.Close;
   qryParamCAF.Close;
   qrySelTermo.Close;
   qryBensSelec.Close;
   qryAcrescimos.Close;
   //-------------------------------------------------------------------------------------
   qryAux.UnPrepare;
   qrySelBem.UnPrepare;
   qryPlaca.UnPrepare;
   qryParamCAF.UnPrepare;
   qrySelTermo.UnPrepare;
   qryBensSelec.UnPrepare;
   qryAcrescimos.UnPrepare;
end;

end.
