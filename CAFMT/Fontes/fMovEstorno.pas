unit fMovEstorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Mask, wwdbedit, DBCtrls, Db, DBTables, Wwdatsrc, Wwquery, MontaSelect,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmMovEstorno = class(TfrmOkCancelar)
    pnlMestre: TPanel;
    pgctlEstorno: TPageControl;
    TabSelBem: TTabSheet;
    TabBem: TTabSheet;
    Label1: TLabel;
    edDataMov: TCMDateTimePicker;
    Label2: TLabel;
    cmbControle: TComboBox;
    pnlSelBem: TPanel;
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
    dsSelBem: TwwDataSource;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    MSTermo: TMontaSelect;
    dsBensSelec: TwwDataSource;
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
    updSelTermo: TUpdateSQL;
    dsSelTermo: TwwDataSource;
    qrySelTermo: TwwQuery;
    qrySelTermoIDSELBAIXA: TFloatField;
    qrySelTermoSBXTERMO: TFloatField;
    qrySelTermoSBXPROCESSO: TStringField;
    qrySelTermoSBXDATA: TDateTimeField;
    qrySelTermoSBXNOMERESP: TStringField;
    qrySelTermoSBXFLGEXECUTADO: TFloatField;
    qrySelTermoSBXDTAEXECUTADO: TDateTimeField;
    qrySelTermoSBTIPOMOV: TFloatField;
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
    Label9: TLabel;
    Label8: TLabel;
    dbeTermo: TwwDBEdit;
    bbtnTermo: TBitBtn;
    Processo: TLabel;
    dbeSbxProcesso: TwwDBEdit;
    Label10: TLabel;
    dbeRespConj: TwwDBEdit;
    Label11: TLabel;
    dbgBalPatBem: TwwDBGrid;
    qryParam: TwwQuery;
    qryParamALUGUELINTERNO: TFloatField;
    qryParamSEQBEMEMP: TFloatField;
    qryParamEDITACODBEM: TFloatField;
    qryParamMOEDAFISCAL: TFloatField;
    qryParamMOEDAGERENCIAL: TFloatField;
    qryParamMOEDAOFICIAL: TFloatField;
    qryParamMASCCODGRUPO: TStringField;
    qryParamSISTEMAS: TStringField;
    qryParamINTEGRACONTAB: TStringField;
    qryAux: TwwQuery;
    qryAcrescimos: TwwQuery;
    qryAcrescimosMARCADO: TFloatField;
    qryAcrescimosDATAACRESCIMO: TDateTimeField;
    qryAcrescimosVALORG: TFloatField;
    qryAcrescimosOBS: TStringField;
    qryAcrescimosIDACRESCIMO: TFloatField;
    dsAcrescimos: TwwDataSource;
    updAcrescimos: TUpdateSQL;
    dbeDescConjunto: TwwDBEdit;
    Panel1: TPanel;
    dbeDataSel: TCMDateTimePicker;
    qryAcrescimosIDMOVIMENTACAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edDataMovExit(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure bbtnTermoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgAcrescimosDblClick(Sender: TObject);
    procedure cmbControleExit(Sender: TObject);
    procedure pgctlEstornoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure cmbControleChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bIntegraContab : Boolean;
    iIdAcrescimo   : Integer;
    //------------------------------------------------------------------------------------
    procedure LimpaCampos;
    function  Testa_Periodo_Contabil(sData: string) : boolean;
    procedure Estorna_Entrada(var bErro : Boolean);
    procedure Estorna_TransfBens(var bErro : Boolean);
    procedure Estorna_Baixa(var bErro : Boolean);
    procedure Estorna_Reavaliacao(var bErro : Boolean);
    procedure Estorna_Acrescimo_Valor(var bErro : Boolean);
    procedure Estorna_Desmembramento_Valor(var bErro : Boolean);
  end;

  eExcessaoCAF = Class(Exception);

var
  frmMovEstorno: TfrmMovEstorno;

implementation

{$R *.DFM}

uses uIntegraBack, uSistema, uAtivoFixo, uMensErro, uDataBase, dBaseDados,
     fAguarde, uLancContab, dAtivoFixo;

procedure TfrmMovEstorno.FormCreate(Sender: TObject);
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
   qryParam.Prepare;
   qrySelTermo.Prepare;
   qryBensSelec.Prepare;
   qryAcrescimos.Prepare;
   //-------------------------------------------------------------------------------------
   qryParam.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryParam.Open;
   //-------------------------------------------------------------------------------------
   bIntegraContab := qryParam.FieldByName('INTEGRACONTAB').AsString = 'S';
   //-------------------------------------------------------------------------------------
   edDataMov.Text := '';
   Screen.Cursor  := crDefault;
   pgctlEstorno.ActivePage := TabBem;
   pgctlEstorno.Enabled    := False;
   pnlMestre.Enabled       := True;
end;
//========================================================================================
procedure TfrmMovEstorno.FormActivate(Sender: TObject);
begin
   inherited;
   cmbControle.Text := '';
   edDataMov.Text   := '';
   edDataMov.SetFocus;
end;
//========================================================================================
procedure TfrmMovEstorno.LimpaCampos;
begin
   edPlaca.Text := '';
   qrySelBem.Close;
   qrySelTermo.Close;
   qryBensSelec.Close;
   //-------------------------------------------------------------------------------------
   pnlAcrescimos.Visible := False;
   qryAcrescimos.Close;
end;
//========================================================================================
procedure TfrmMovEstorno.cmbControleChange(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.SetFocus;
end;
//========================================================================================
procedure TfrmMovEstorno.cmbControleExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if (cmbControle.Text = '') then
   begin
      MsgDlg('Selecione a movimentação que será estornada!','Erro',mtError,[mbOk],0);
      cmbControle.SetFocus;
   end;
   //-------------------------------------------------------------------------------------
   pgctlEstorno.Enabled := True;
   pnlMestre.Enabled    := False;
   //-------------------------------------------------------------------------------------
   if (cmbControle.Text = 'Transferência de Bens') then
   begin
      MSTermo.Filtro.Strings[0] := 'SELBAIXA.SBTIPOMOV = 1';
      TabSelBem.Enabled := True;
   end else
   if (cmbControle.Text = 'Baixa') then
   begin
      MSTermo.Filtro.Strings[0] := 'SELBAIXA.SBTIPOMOV = 0';
      TabSelBem.Enabled := True;
   end else
   begin
      pgctlEstorno.ActivePage := TabBem;
      TabSelBem.Enabled := False;
   end;
   //-------------------------------------------------------------------------------------
   if (cmbControle.Text = 'Baixa') or (cmbControle.Text = 'Desmembramento') then
   begin
      dtmAtivoFixo.MSBem.Filtro.Strings[6] := '(BEM.BAIXATOTAL = ''S'')';
   end else
   begin
      dtmAtivoFixo.MSBem.Filtro.Strings[6] := '(BEM.BAIXATOTAL <> ''S'') OR (BEM.BAIXATOTAL IS NULL)';
   end;
end;
//========================================================================================
procedure TfrmMovEstorno.edDataMovExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if (edDataMov.Text = '') then
      MsgDlg('Selecione a data da movimentação!','Erro',mtError,[mbOk],0);
end;
//========================================================================================
procedure TfrmMovEstorno.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   dtmAtivoFixo.MSBem.Executar;
   //-------------------------------------------------------------------------------------
   Repaint;
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
      if (cmbControle.Text = 'Acréscimo de Valor') then
      begin
         qryAcrescimos.Close;
         qryAcrescimos.ParambyName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qryAcrescimos.ParambyName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
         qryAcrescimos.Open;
         pnlAcrescimos.Visible := True;
      end;
   end else
   begin
      LimpaCampos;
      bbtnSelBem.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovEstorno.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovEstorno.edPlacaExit(Sender: TObject);
begin
   inherited;
   if (edPlaca.Text <> '') then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
      qryPlaca.Open;
      if (not qryPlaca.isEmpty) then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         if (qrySelBem.IsEmpty) then
         begin
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
procedure TfrmMovEstorno.bbtnTermoClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSTermo.Executar;
   //-------------------------------------------------------------------------------------
   frmMovEstorno.Invalidate;
   frmMovEstorno.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSTermo.ValoresChave.Count > 0) and (MSTermo.ValoresChave[0] <> '') then
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
         MsgDlg('Termo de Seleção Não Executado!','Erro', mtError, [mbOk], 0);
         LimpaCampos;
         bbtnTermo.SetFocus;
      end;
      if not (qrySelTermoSBXDTAEXECUTADO.IsNull) then
         if (edDataMov.Date <> qrySelTermoSBXDTAEXECUTADO.AsDateTime) then
            edDataMov.Date := qrySelTermoSBXDTAEXECUTADO.AsDateTime;
   end else
   begin
      LimpaCampos;
      bbtnTermo.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovEstorno.bbtnConfirmarClick(Sender: TObject);
var
   sTipoMov          : String;
   bTransacao, bErro : Boolean;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   // verifica se já há uma transação em andamento; não havendo, inicia uma
   //-------------------------------------------------------------------------------------
   if not(dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      bTransacao := True;
      StartTransacao;
   end else
   begin
      bTransacao := False;
   end;
   //-------------------------------------------------------------------------------------
   try
      //----------------------------------------------------------------------------------
      // Validação dos Campos
      //----------------------------------------------------------------------------------
      if (cmbControle.Text = '') then
      begin
         MsgDlg('Selecione a Movimentação que será estornada! ','Erro',mtError,[mbOk],0);
         Raise eExcessaoCAF.Create('Estorno');
      end;
      //----------------------------------------------------------------------------------
      if (edDataMov.Text = '') then
      begin
         MsgDlg('Selecione a Data da Movimentação que será estornada! ','Erro',mtError,[mbOk],0);
         Raise eExcessaoCAF.Create('Estorno');
      end;
      //----------------------------------------------------------------------------------
      if (pgctlEstorno.ActivePage = TabBem) then
      begin
         //-------------------------------------------------------------------------------
         if (qrySelBemIDBEM.IsNull) then
         begin
            MsgDlg('Selecione o Bem cuja Movimentação será Estornada','Erro',mtError,[mbOk],0);
            Raise eExcessaoCAF.Create('Estorno');
         end;
         //-------------------------------------------------------------------------------
         // Confere se existe a movimentação selecionada na data especificada para o bem
         // selecionado
         //-------------------------------------------------------------------------------
         if (cmbControle.Text = 'Entrada') then
            sTipoMov := '01,03'
         else
         if (cmbControle.Text = 'Transferência de Bens') then
            sTipoMov := '05,11,12'
         else
         if (cmbControle.Text = 'Baixa') then
            sTipoMov := '06,25,24,26,20,28,27,29,37,38,39,40'
         else
         if (cmbControle.Text = 'Reavaliação') then
            sTipoMov := '08,53,54'
         else
         if (cmbControle.Text = 'Acréscimo de Valor') then
            sTipoMov := '09'
         else
         if (cmbControle.Text = 'Desmembramento') then
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
         begin
            MsgDlg('Não existe '+cmbControle.Text+' do bem '+edPlaca.Text+' na data fornecida!',
                   'Erro',mtError,[mbOk],0);
            Raise eExcessaoCAF.Create('Estorno');
         end;
         qryAux.Close;
      end else
      begin
         if (dbeTermo.Text = '') then
         begin
            MsgDlg('Selecione um Termo de Seleção! ','Erro',mtError,[mbOk],0);
            Raise eExcessaoCAF.Create('Estorno');
         end;
         //-------------------------------------------------------------------------------
         if not (qrySelTermoSBXDTAEXECUTADO.IsNull) then
            if (edDataMov.Date <> qrySelTermoSBXDTAEXECUTADO.AsDateTime) then
               edDataMov.Date := qrySelTermoSBXDTAEXECUTADO.AsDateTime;
      end;
      //----------------------------------------------------------------------------------
      if bIntegraContab then
        if not Testa_Periodo_Contabil(edDataMov.text) then
           Raise eExcessaoCAF.Create('Estorno');
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      //----------------------------------------------------------------------------------
      bErro := False;
      if (cmbControle.Text = 'Entrada') then
         Estorna_Entrada(bErro)
      else
      if (cmbControle.Text = 'Transferência de Bens') then
         Estorna_TransfBens(bErro)
      else
      if (cmbControle.Text = 'Baixa') then
         Estorna_Baixa(bErro)
      else
      if (cmbControle.Text = 'Reavaliação') then
         Estorna_Reavaliacao(bErro)
      else
      if (cmbControle.Text = 'Acréscimo de Valor') then
         Estorna_Acrescimo_Valor(bErro)
      else
      if (cmbControle.Text = 'Desmembramento') then
         Estorna_Desmembramento_Valor(bErro);
      //----------------------------------------------------------------------------------
      if not bErro then
      begin
         if bTransacao then
            CommitTransacao;
         MsgDlg('Movimentação Estornada!','Informação',mtInformation,[mbOk],0)
      end else
      begin
         if bTransacao then
            RollBackTransacao;
         MsgDlg('Movimentação Não Estornada!','Erro',mtError,[mbOk],0);
      end;
   //-------------------------------------------------------------------------------------
   except
      if bTransacao then
         RollBackTransacao;
      MsgDlg('Movimentação Não Estornada!','Erro',mtError,[mbOk],0);
   end;
   //-------------------------------------------------------------------------------------
   pgctlEstorno.Enabled  := False;
   pnlMestre.Enabled     := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   LimpaCampos;
   Screen.Cursor := crDefault;
   edDataMov.SetFocus;
end;
//========================================================================================
// Estorna um movimento de Entrada
//========================================================================================
procedure TfrmMovEstorno.Estorna_Entrada(var bErro : Boolean);
begin
   bErro := AtivoFixo.EstornaEntrada(Sistema.IdModulo,
                                     qrySelBemIDPESSOA.AsInteger,
                                     qrySelBemIDBEM.AsInteger,
                                     edDataMov.Date,edDataMov.Date,True,True) < 0;
end;
//========================================================================================
// Estorna um movimento de Transferência de Bens
//========================================================================================
procedure TfrmMovEstorno.Estorna_TransfBens(var bErro : Boolean);
var
   bTransacao : boolean;
begin
   if (not qrySelTermo.Active) then
   begin
      bErro := AtivoFixo.EstornaTransfGrupo(Sistema.IdModulo,
                                            qrySelBemIDPESSOA.AsInteger,
                                            qrySelBemIDBEM.AsInteger,
                                            edDataMov.Date,
                                            edDataMov.Date,-1,True) < 0;
   end else
   begin
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end else
      begin
         bTransacao := False;
      end;
      //----------------------------------------------------------------------------------
      try
         qryBensSelec.First;
         while not qryBensSelec.EOF do
         begin
           bErro := AtivoFixo.EstornaTransfGrupo(Sistema.IdModulo,
                                                 qryBensSelecIDPESSOA.AsInteger,
                                                 qryBensSelecIDBEM.AsInteger,
                                                 edDataMov.Date,
                                                 edDataMov.Date,-1,True) < 0;
            //----------------------------------------------------------------------------
            if bErro then
            begin
               Raise eExcessaoCAF.Create('Estorna TRANSFERÊNCIA : Erro processando o bem ' +
                                         qryBensSelecPLACA.AsString);
            end;
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
         if bTransacao then
            CommitTransacao;
         bErro := False;
      except
         if bTransacao then
            RollBackTransacao;
         bErro := True;
      end;
   end;
end;
//========================================================================================
// Estorna um movimento de Baixa
//========================================================================================
procedure TfrmMovEstorno.Estorna_Baixa(var bErro : Boolean);
var
   bTransacao : boolean;
begin
   if (not qrySelTermo.Active) then
   begin
      bErro := AtivoFixo.EstornaBaixa(Sistema.IdModulo,
                                      qrySelBemIDPESSOA.AsInteger,
                                      qrySelBemIDBEM.AsInteger,
                                      edDataMov.Date,edDataMov.Date,True) < 0;
   end else
   begin
      //----------------------------------------------------------------------------------
      // verifica se já há uma transação em andamento; não havendo, inicia uma
      //----------------------------------------------------------------------------------
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
      begin
         bTransacao := True;
         StartTransacao;
      end else
      begin
         bTransacao := False;
      end;
      //----------------------------------------------------------------------------------
      frmAguarde.Min := 0;
      frmAguarde.Max := qryBensSelec.RecordCount;
      frmAguarde.Pos := 0;
      frmAguarde.Mostra('Estornando Baixa de Bens do Termo');
      try
         qryBensSelec.First;
         while not qryBensSelec.EOF do
         begin
            frmAguarde.Pos := frmAguarde.Pos + 1;
            frmAguarde.Caption := 'Processando Placa ' + qryBensSelecPLACA.AsString +
                                  ' (' + inttostr(frmAguarde.Pos) + '/' + inttostr(frmAguarde.Max) + ')';
            frmAguarde.Mostra('Baixando os Bens do Termo');
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            bErro := AtivoFixo.EstornaBaixa(Sistema.IdModulo,
                                            qryBensSelecIDPESSOA.AsInteger,
                                            qryBensSelecIDBEM.AsInteger,
                                            edDataMov.Date,edDataMov.Date,True) < 0;
            //----------------------------------------------------------------------------
            if bErro then
               Raise eExcessaoCAF.Create('Estorna BAIXA : Erro processando o bem ' +
                                         qryBensSelecPLACA.AsString);
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
         if bTransacao then
            CommitTransacao;
         frmAguarde.Apaga;
         bErro := False;
      except
         frmAguarde.Apaga;
         if bTransacao then
            RollBackTransacao;
         bErro := True;
         MsgDlg('Erro durante o processamento da placa ' + qryBensSelecPLACA.AsString,
                'Erro',mtError,[mbOk],0);
      end;
   end;
end;
//========================================================================================
// Estorna um movimento de Reavaliacao
//========================================================================================
procedure TfrmMovEstorno.Estorna_Reavaliacao(var bErro : Boolean);
begin
   bErro := AtivoFixo.EstornaReavaliacao(Sistema.IdModulo,
                                         qrySelBemIDPESSOA.AsInteger,
                                         qrySelBemIDBEM.AsInteger,
                                         edDataMov.Date,edDataMov.Date,True) < 0;
end;
//========================================================================================
// Estorna um movimento de Acrescimo de Valor
//========================================================================================
procedure TfrmMovEstorno.Estorna_Acrescimo_Valor(var bErro : Boolean);
begin
   bErro := AtivoFixo.EstornaAcrescimo(Sistema.IdModulo,
                                       qrySelBemIDPESSOA.AsInteger,
                                       qrySelBemIDBEM.AsInteger,
                                       edDataMov.Date,edDataMov.Date,
                                       iIdAcrescimo,True) < 0;
   qryAcrescimos.CancelUpdates;
end;
//========================================================================================
// Estorna um movimento de Desmembramento
//========================================================================================
procedure TfrmMovEstorno.Estorna_Desmembramento_Valor(var bErro : Boolean);
begin
   bErro := AtivoFixo.EstornaDesmembramento(Sistema.IdModulo,
                                            qrySelBemIDPESSOA.AsInteger,
                                            qrySelBemIDBEM.AsInteger,
                                            edDataMov.Date,edDataMov.Date,
                                            True) < 0;
end;
//========================================================================================
procedure TfrmMovEstorno.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   pgctlEstorno.Enabled := False;
   pnlMestre.Enabled    := True;
   edDataMov.SetFocus;
end;
//========================================================================================
procedure TfrmMovEstorno.dbgAcrescimosDblClick(Sender: TObject);
begin
   inherited;
   iIdAcrescimo := qryAcrescimosIDMOVIMENTACAO.AsInteger;
   qryAcrescimos.First;
   while not qryAcrescimos.EOF do
   begin
      qryAcrescimos.Edit;
      if (qryAcrescimosIDMOVIMENTACAO.AsInteger = iIdAcrescimo) then
         qryAcrescimosMARCADO.AsInteger := 1
      else
         qryAcrescimosMARCADO.AsInteger := 0;
      qryAcrescimos.Post;
      qryAcrescimos.Next;
   end;
   qryAcrescimos.Locate('IDMOVIMENTACAO',iIdAcrescimo,[]);
end;
//========================================================================================
Function TFrmMovEstorno.Testa_Periodo_Contabil(sData: string) : boolean;
var
   sMensagem                 : String;
   ResultPeriodo, Exercicio,
   Periodo, iEmpresa         : Integer;
begin
   iEmpresa := Sistema.IdEmpresa;
   //-------------------------------------------------------------------------------------
   // busca exercício e número do período referente a data informada
   //-------------------------------------------------------------------------------------
   ResultPeriodo := TestaPeriodo(True,'BaseDados',sData,'2',Exercicio,Periodo,
                                 iEmpresa, sMensagem);
   //-------------------------------------------------------------------------------------
   // Testa retornos de erro da função
   //-------------------------------------------------------------------------------------
   if ResultPeriodo = 1 then
   begin
      MsgDlg('Período Contábil inexistente ! Impossível gerar lançamento contábil da '+
             'movimentação do Bem. Altere a data da movimentação. ','Erro',
             mtError,[mbOk],0);
      result   := false;
      exit;
   end else
   begin
      if ResultPeriodo = 2 then
      begin
         MsgDlg('Período encontrado, mas não é único ! Impossível gerar lançamento '+
                'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                mtError,[mbOk],0);
         result   := false;
         exit;
      end else
         if ResultPeriodo = 3 then
         begin
            MsgDlg('Período já bloqueado pela Contabilidade ! Impossível gerar lançamento '+
                   'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                   mtError,[mbOk],0);
            result   := False;
            exit;
         end else
            if ResultPeriodo = 4 then
            begin
               MsgDlg('Período já bloqueado pela Integração ! Impossível gerar lançamento '+
                      'contábil da movimentação do Bem. Altere a data de movimentação.','Erro',
                      mtError,[mbOk],0);
               result   := False;
               exit;
            end;
   end;
   //-------------------------------------------------------------------------------------
   result := True;
end;
//========================================================================================
procedure TfrmMovEstorno.pgctlEstornoChanging(Sender: TObject; var AllowChange: Boolean);
begin
   inherited;
   AllowChange := (cmbControle.Text = 'Transferência de Bens') or
                  (cmbControle.Text = 'Baixa') or
                  (cmbControle.Text = '');
end;

end.
