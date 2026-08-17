unit fMTUtilAjustaLancImplantacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TB97Ctls, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, wwriched,
  MontaSelect, DB, DBClient, uCMClientDataSet, Wwdatsrc, uCmSqlParams, IvEMulti,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlBem, uCtrlUtilImplantacao;

type
  TfrmMTUtilAjustaLancImplantacao = class(TfrmOkCancelar)
    Label26: TLabel;
    dbeDesBem: TwwDBRichEdit;
    bbtnSelBem: TBitBtn;
    lblPlaca: TLabel;
    dbePlaca: TwwDBEdit;
    edDataBase: TCMDateTimePicker;
    Label2: TLabel;
    pgctlValores: TPageControl;
    TabBem: TTabSheet;
    gbxBem: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    edValOrg: TRealEdit;
    edCmDep: TRealEdit;
    edCmBem: TRealEdit;
    edDepLanc: TRealEdit;
    TabReavaliacao: TTabSheet;
    pnlDetReaval: TPanel;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edReavValOrg: TRealEdit;
    edReavCmBem: TRealEdit;
    edReavDepLanc: TRealEdit;
    edReavCmDep: TRealEdit;
    bbtnOkReavaliacao: TBitBtn;
    bbtnCancReavaliacao: TBitBtn;
    pnlGrdReaval: TPanel;
    dbgReavaliacao: TwwDBGrid;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    bbtnAltReaval: TToolbarButton97;
    TabAcrescimo: TTabSheet;
    pnlDetAcresc: TPanel;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edAcresValOrg: TRealEdit;
    edAcresCmBem: TRealEdit;
    edAcresDepLanc: TRealEdit;
    edAcresCmDep: TRealEdit;
    bbtnOkAcrescimo: TBitBtn;
    bbtnCancAcrescimo: TBitBtn;
    pnlGrdAcresc: TPanel;
    dbgAcrescimo: TwwDBGrid;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    bbtnAltAcresc: TToolbarButton97;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    dsReavaliacao: TwwDataSource;
    dsAcrescimo: TwwDataSource;
    cdsReavaliacao: TCMClientDataSet;
    cdsAcrescimo: TCMClientDataSet;
    sqlAcrescimo: TCMSqlParams;
    sqlReavaliacao: TCMSqlParams;
    sqlSelBem: TCMSqlParams;
    cdsUltMovBem: TCMClientDataSet;
    sqlUltMovBem: TCMSqlParams;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label3: TLabel;
    DBRealEdit2: TDBRealEdit;
    Label4: TLabel;
    DBRealEdit3: TDBRealEdit;
    Label5: TLabel;
    DBRealEdit4: TDBRealEdit;
    cdsAjustes: TCMClientDataSet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBRealEdit5: TDBRealEdit;
    Label11: TLabel;
    DBRealEdit6: TDBRealEdit;
    Label12: TLabel;
    DBRealEdit7: TDBRealEdit;
    Label13: TLabel;
    DBRealEdit8: TDBRealEdit;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    DBRealEdit9: TDBRealEdit;
    Label19: TLabel;
    DBRealEdit10: TDBRealEdit;
    Label20: TLabel;
    DBRealEdit11: TDBRealEdit;
    Label21: TLabel;
    DBRealEdit12: TDBRealEdit;
    Label271: TLabel;
    edValResidual: TRealEdit;
    cdsSaldoContabil: TCMClientDataSet;
    sqlSaldoContabil: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edDataBaseChange(Sender: TObject);
    procedure bbtnAltReavalClick(Sender: TObject);
    procedure bbtnAltAcrescClick(Sender: TObject);
    procedure bbtnOkReavaliacaoClick(Sender: TObject);
    procedure bbtnCancReavaliacaoClick(Sender: TObject);
    procedure bbtnOkAcrescimoClick(Sender: TObject);
    procedure bbtnCancAcrescimoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    Bem : TCtrlBem;
    Implantacao : TCtrlUtilImplantacao;
    Procedure SelBem(fPessoa, fBem : Extended);
    Procedure CalculaSaldoContabil;
  public
    { Public declarations }
  end;

var
  frmMTUtilAjustaLancImplantacao: TfrmMTUtilAjustaLancImplantacao;

implementation

{$R *.dfm}

Uses uMensErro, uSistema;

procedure TfrmMTUtilAjustaLancImplantacao.FormCreate(Sender: TObject);
begin
   inherited;
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Implantacao := TCtrlUtilImplantacao.Create;
   Implantacao.InitializeAs(Padroes);
   Implantacao.cdsAjustes := cdsAjustes;
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
end;

Procedure TfrmMTUtilAjustaLancImplantacao.SelBem(fPessoa, fBem : Extended);
begin
   cdsSelBem.Close;
   sqlSelBem.Prepare;
   sqlSelBem.ParamByName('IDBEM').AsFloat     := fBem;
   sqlSelBem.ParamByName('IDPESSOA').AsFloat  := fPessoa;
   sqlSelBem.ParamByName('MOECODIGO').AsFloat := ParamCAF.MOEDAOFICIAL;
   sqlSelBem.ParamByName('IDTAXADEP').AsFloat := 1;
   sqlSelBem.Open;
   TabBem.Enabled := not cdsSelBem.IsEmpty;
   //-------------------------------------------------------------------------------------
   cdsReavaliacao.Close;
   sqlReavaliacao.Prepare;
   sqlReavaliacao.ParamByName('IDBEM').AsFloat     := fBem;
   sqlReavaliacao.ParamByName('IDPESSOA').AsFloat  := fPessoa;
   sqlReavaliacao.ParamByName('MOECODIGO').AsFloat := ParamCAF.MOEDAOFICIAL;
   sqlReavaliacao.ParamByName('IDTAXADEP').AsFloat := 1;
   sqlReavaliacao.Open;
   TabReavaliacao.Enabled := not cdsReavaliacao.IsEmpty;
   //-------------------------------------------------------------------------------------
   cdsAcrescimo.Close;
   sqlAcrescimo.Prepare;
   sqlAcrescimo.ParamByName('IDBEM').AsFloat     := fBem;
   sqlAcrescimo.ParamByName('IDPESSOA').AsFloat  := fPessoa;
   sqlAcrescimo.ParamByName('MOECODIGO').AsFloat := ParamCAF.MOEDAOFICIAL;
   sqlAcrescimo.ParamByName('IDTAXADEP').AsFloat := 1;
   sqlAcrescimo.Open;
   TabAcrescimo.Enabled := not cdsAcrescimo.IsEmpty;
   //-------------------------------------------------------------------------------------
   cdsUltMovBem.Close;
   sqlUltMovBem.Prepare;
   sqlUltMovBem.ParamByName('IDBEM').AsFloat    := fBem;
   sqlUltMovBem.ParamByName('IDPESSOA').AsFloat := fPessoa;
   sqlUltMovBem.Open;
   if not cdsUltMovBem.IsEmpty then
      edDataBase.Date := cdsUltMovBem.FieldByName('DATAULTMOV').AsDateTime
   else
      edDataBase.Date := cdsSelBem.FieldByName('DTAINCLUSAO').AsDateTime;
   //-------------------------------------------------------------------------------------
   CalculaSaldoContabil;
   //-------------------------------------------------------------------------------------
   edValOrg.Value  := cdsSelBem.FieldByName('VALORG').AsFloat;
   edCmBem.Value   := cdsSelBem.FieldByName('CMBEM').AsFloat;
   edDepLanc.Value := cdsSelBem.FieldByName('DEPLANC').AsFloat;
   edCmDep.Value   := cdsSelBem.FieldByName('CMDEP').AsFloat;
   //-------------------------------------------------------------------------------------
   cdsAjustes.Data := Implantacao.ListaAjustes;
   //-------------------------------------------------------------------------------------
   pgctlValores.ActivePage := TabBem;
   pnlDetReaval.SendToBack;
   pnlDetAcresc.SendToBack;
end;

procedure TfrmMTUtilAjustaLancImplantacao.CalculaSaldoContabil;
begin
   sqlSaldoContabil.Prepare;
   sqlSaldoContabil.ParamByName('IDBEM').AsInteger     := cdsSelBem.FieldByName('IDBEM').AsInteger;
   sqlSaldoContabil.ParamByName('IDPESSOA').AsInteger  := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
   sqlSaldoContabil.ParamByName('DATASLD').AsDateTime  := edDataBase.Date;
   sqlSaldoContabil.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
   sqlSaldoContabil.ParamByName('IDTAXADEP').AsInteger := 1;
   sqlSaldoContabil.Open;
   if not cdsSaldoContabil.IsEmpty then
   begin
      edValResidual.Value := cdsSaldoContabil.FieldByName('VALORG').AsCurrency + cdsSaldoContabil.FieldByName('CMBEM').AsCurrency -
                             cdsSaldoContabil.FieldByName('DEPLANC').AsCurrency - cdsSaldoContabil.FieldByName('CMDEP').AsCurrency +
                             cdsSaldoContabil.FieldByName('REAVVALORG').AsCurrency + cdsSaldoContabil.FieldByName('REAVCMBEM').AsCurrency -
                             cdsSaldoContabil.FieldByName('REAVDEPLANC').AsCurrency - cdsSaldoContabil.FieldByName('REAVCMDEP').AsCurrency +
                             cdsSaldoContabil.FieldByName('ULTREAVVALORG').AsCurrency + cdsSaldoContabil.FieldByName('ULTREAVCMBEM').AsCurrency -
                             cdsSaldoContabil.FieldByName('ULTREAVDEPLANC').AsCurrency - cdsSaldoContabil.FieldByName('ULTREAVCMDEP').AsCurrency;
   end else
   begin
      edValResidual.Value := 0;
   end;
   Application.ProcessMessages;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   //-------------------------------------------------------------------------------------
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      Screen.Cursor := crSQLWait;
      if not Implantacao.ReconstroiSaldoBem(strtoint(MSBem.ValoresChave[0]),
                                            strtoint(MSBem.ValoresChave[1]),
                                            strtoint(MSBem.ValoresChave[2])) then
      begin
         Screen.Cursor := crDefault;
         MsgDlg(Implantacao.MessageInfo, 'Erro', mtError, [mbOk], 0);
         bbtnSelBem.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      SelBem(strtofloat(MSBem.ValoresChave[0]), strtofloat(MSBem.ValoresChave[1]));
      Screen.Cursor := crDefault;
      //----------------------------------------------------------------------------------
      if (cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S') and (edValResidual.Value = 0) then
      begin
         MsgDlg('Bem Baixado e zerado não pode ser ajustado!', 'Erro', mtError, [mbOk], 0);
         bbtnSelBem.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      bbtnConfirmar.Enabled := True;
      edValOrg.SetFocus;
   end else
      bbtnSelBem.SetFocus;
end;

procedure TfrmMTUtilAjustaLancImplantacao.edDataBaseChange(Sender: TObject);
begin
   inherited;
   if edDataBase.Date <> cdsUltMovBem.FieldByName('DATAULTMOV').AsDateTime then
   begin
      if edDataBase.Date < cdsUltMovBem.FieldByName('DATAULTMOV').AsDateTime then
      begin
         if not cdsUltMovBem.IsEmpty then
         begin
            if MsgDlg('A data do lançamento de ajuste está anterior a '+#13+
                      'data da última movimentação do bem. Será necessário '+#13+
                      'Reconstruir o Fechamento de Periodo deste Bem!' +#13+#13+
                      'Confirma a Operação ?',
                      'Atenção', mtWarning, [mbYes,MbNo], 0) = mrNo then
               edDataBase.Date := cdsUltMovBem.FieldByName('DATAULTMOV').AsDateTime;
         end else
         begin
            edDataBase.Date := cdsSelBem.FieldByName('DTAINCLUSAO').AsDateTime;
         end;
      end;
      //----------------------------------------------------------------------------------
      CalculaSaldoContabil;
      Application.ProcessMessages;
   end;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnAltReavalClick(Sender: TObject);
begin
   inherited;
   if cdsAjustes.Locate('IDREAVALIACAO',cdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,[]) then
   begin
      edReavValorg.Value  := cdsAjustes.FieldByName('VALORGB').AsFloat;
      edReavCmBem.Value   := cdsAjustes.FieldByName('CMBEMB').AsFloat;
      edReavDepLanc.Value := cdsAjustes.FieldByName('DEPLANCB').AsFloat;
      edReavCmDep.Value   := cdsAjustes.FieldByName('CMDEPB').AsFloat;
   end else
   begin
      edReavValorg.Value  := cdsReavaliacao.FieldByName('VALORG').AsFloat;
      edReavCmBem.Value   := cdsReavaliacao.FieldByName('CMBEM').AsFloat;
      edReavDepLanc.Value := cdsReavaliacao.FieldByName('DEPLANC').AsFloat;
      edReavCmDep.Value   := cdsReavaliacao.FieldByName('CMDEP').AsFloat;
   end;
   pnlDetReaval.BringToFront;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnOkReavaliacaoClick(Sender: TObject);
begin
   inherited;
   if cdsAjustes.Locate('IDREAVALIACAO',cdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,[]) then
   begin
      cdsAjustes.Edit;
   end else
   begin
      cdsAjustes.Append;
      cdsAjustes.FieldByName('IDREAVALIACAO').AsFloat := cdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat;
      cdsAjustes.FieldByName('IDACRESCIMO').AsFloat := 0;
      cdsAjustes.FieldByName('VALORGA').AsFloat := cdsReavaliacao.FieldByName('VALORG').AsFloat;
      cdsAjustes.FieldByName('CMBEMA').AsFloat := cdsReavaliacao.FieldByName('CMBEM').AsFloat;
      cdsAjustes.FieldByName('DEPLANCA').AsFloat := cdsReavaliacao.FieldByName('DEPLANC').AsFloat;
      cdsAjustes.FieldByName('CMDEPA').AsFloat := cdsReavaliacao.FieldByName('CMDEP').AsFloat;
   end;
   //-------------------------------------------------------------------------------------
   cdsAjustes.FieldByName('VALORGB').AsFloat := edReavValorg.Value;
   cdsAjustes.FieldByName('CMBEMB').AsFloat := edReavCmBem.Value;
   cdsAjustes.FieldByName('DEPLANCB').AsFloat := edReavDepLanc.Value;
   cdsAjustes.FieldByName('CMDEPB').AsFloat := edReavCmDep.Value;
   cdsAjustes.Post;
   //-------------------------------------------------------------------------------------
   bbtnAltReaval.Down := False;
   pnlDetReaval.SendToBack;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnCancReavaliacaoClick(Sender: TObject);
begin
   inherited;
   if cdsAjustes.Locate('IDREAVALIACAO',cdsReavaliacao.FieldByName('IDREAVALIACAO').AsFloat,[]) then
      cdsAjustes.Delete;
   //-------------------------------------------------------------------------------------
   bbtnAltReaval.Down := False;
   pnlDetReaval.SendToBack;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnAltAcrescClick(Sender: TObject);
begin
   inherited;
   if cdsAjustes.Locate('IDACRESCIMO',cdsAcrescimo.FieldByName('IDACRESCIMO').AsFloat,[]) then
   begin
      edAcresValorg.Value  := cdsAjustes.FieldByName('VALORGB').AsFloat;
      edAcresCmBem.Value   := cdsAjustes.FieldByName('CMBEMB').AsFloat;
      edAcresDepLanc.Value := cdsAjustes.FieldByName('DEPLANCB').AsFloat;
      edAcresCmDep.Value   := cdsAjustes.FieldByName('CMDEPB').AsFloat;
   end else
   begin
      edAcresValorg.Value  := cdsAcrescimo.FieldByName('VALORG').AsFloat;
      edAcresCmBem.Value   := cdsAcrescimo.FieldByName('CMBEM').AsFloat;
      edAcresDepLanc.Value := cdsAcrescimo.FieldByName('DEPLANC').AsFloat;
      edAcresCmDep.Value   := cdsAcrescimo.FieldByName('CMDEP').AsFloat;
   end;
   pnlDetAcresc.BringToFront;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnOkAcrescimoClick(Sender: TObject);
begin
   inherited;
   if cdsAjustes.Locate('IDACRESCIMO',cdsAcrescimo.FieldByName('IDACRESCIMO').AsFloat,[]) then
   begin
      cdsAjustes.Edit;
   end else
   begin
      cdsAjustes.Append;
      cdsAjustes.FieldByName('IDACRESCIMO').AsFloat := cdsAcrescimo.FieldByName('IDACRESCIMO').AsFloat;
      cdsAjustes.FieldByName('IDREAVALIACAO').AsFloat := 0;
      cdsAjustes.FieldByName('VALORGA').AsFloat := cdsAcrescimo.FieldByName('VALORG').AsFloat;
      cdsAjustes.FieldByName('CMBEMA').AsFloat := cdsAcrescimo.FieldByName('CMBEM').AsFloat;
      cdsAjustes.FieldByName('DEPLANCA').AsFloat := cdsAcrescimo.FieldByName('DEPLANC').AsFloat;
      cdsAjustes.FieldByName('CMDEPA').AsFloat := cdsAcrescimo.FieldByName('CMDEP').AsFloat;
   end;
   //-------------------------------------------------------------------------------------
   cdsAjustes.FieldByName('VALORGB').AsFloat := edAcresValorg.Value;
   cdsAjustes.FieldByName('CMBEMB').AsFloat := edAcresCmBem.Value;
   cdsAjustes.FieldByName('DEPLANCB').AsFloat := edAcresDepLanc.Value;
   cdsAjustes.FieldByName('CMDEPB').AsFloat := edAcresCmDep.Value;
   cdsAjustes.Post;
   //-------------------------------------------------------------------------------------
   bbtnAltAcresc.Down := False;
   pnlDetAcresc.SendToBack;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnCancAcrescimoClick(Sender: TObject);
begin
   inherited;
   if cdsAjustes.Locate('IDACRESCIMO',cdsAcrescimo.FieldByName('IDACRESCIMO').AsFloat,[]) then
      cdsAjustes.Delete;
   //-------------------------------------------------------------------------------------
   bbtnAltAcresc.Down := False;
   pnlDetAcresc.SendToBack;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   cdsAjustes.Append;
   cdsAjustes.FieldByName('IDACRESCIMO').AsFloat := 0;
   cdsAjustes.FieldByName('IDREAVALIACAO').AsFloat := 0;
   cdsAjustes.FieldByName('VALORGA').AsFloat := cdsSelBem.FieldByName('VALORG').AsFloat;
   cdsAjustes.FieldByName('CMBEMA').AsFloat := cdsSelBem.FieldByName('CMBEM').AsFloat;
   cdsAjustes.FieldByName('DEPLANCA').AsFloat := cdsSelBem.FieldByName('DEPLANC').AsFloat;
   cdsAjustes.FieldByName('CMDEPA').AsFloat := cdsSelBem.FieldByName('CMDEP').AsFloat;
   cdsAjustes.FieldByName('VALORGB').AsFloat := edValorg.Value;
   cdsAjustes.FieldByName('CMBEMB').AsFloat := edCmBem.Value;
   cdsAjustes.FieldByName('DEPLANCB').AsFloat := edDepLanc.Value;
   cdsAjustes.FieldByName('CMDEPB').AsFloat := edCmDep.Value;
   cdsAjustes.Post;
   //-------------------------------------------------------------------------------------
   if not Implantacao.ExecutaAjustesImplantacao(cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                                cdsSelBem.FieldByName('IDBEM').Asfloat,
                                                ParamCAF.MOEDAOFICIAL, 1,
                                                edDataBase.Date) then
   begin
      MsgDlg('Execução do Ajuste de Implantação não Realizado!' + #13 +
             'Causa : ' + Implantacao.MessageInfo, 'Erro', mtError, [mbOk], 0)
   end else
   begin
      SelBem(cdsSelBem.FieldByName('IDPESSOA').Asfloat, cdsSelBem.FieldByName('IDBEM').Asfloat);
      MsgDlg('Execução do Ajuste de Implantação Realizado.', 'Informação', mtInformation, [mbOk], 0)
   end;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

procedure TfrmMTUtilAjustaLancImplantacao.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   if not Implantacao.EstornaAjustesImplantacao(cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                                cdsSelBem.FieldByName('IDBEM').AsFloat,
                                                ParamCAF.MOEDAOFICIAL, 1,
                                                edDataBase.Date) then
   begin
      MsgDlg('Estorno do Ajuste de Implantação não Realizado!' + #13 +
             'Causa : ' + Implantacao.MessageInfo, 'Erro', mtError, [mbOk], 0)
   end else
   begin
      SelBem(cdsSelBem.FieldByName('IDPESSOA').Asfloat, cdsSelBem.FieldByName('IDBEM').Asfloat);
      MsgDlg('Estorno do Ajuste de Implantação Realizado.', 'Erro', mtError, [mbOk], 0)
   end;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;

procedure TfrmMTUtilAjustaLancImplantacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsSelBem.Close;
   cdsReavaliacao.Close;
   cdsAcrescimo.Close;
   cdsUltMovBem.Close;
   cdsAjustes.Close;
   Bem.Free;
   Implantacao.Free;
   ParamCAF.Free;
end;

end.
