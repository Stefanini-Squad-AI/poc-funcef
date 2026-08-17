unit FCadTipoDesembMT;
{
   Autor     : Rodolpho da Silva
   Pendência : 19624
   Data      : 18/07/2005
   Descrição : Incluído mais um parâmetro no método CtrlTiporecebdesemb.ListparamCap,
               param: sRecPag


   André Tavares 01/09/2003 - resoluçaõ da pendência 14842
   Andre Tavares - pendência 16974 - 28/06/2004 - Torna invisível o box
   de obrigatoriedade do compromisso orçamentário se o módulo for CAR

}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, DBTables, Wwquery, uCMTypes,
  Mask, wwdblook, wwdbedit, TB97, Tb97Tlbr, TB97Ctls, FTelaAut, MontaSelect,
  IvDictio, IvMulti, IvEMulti, CMProcuraMask, CMTree, CMDBLookupCombo,
  CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet,
  uCtrlTiporecebdesemb, Grids, Wwdbigrd, Wwdbgrid, uCtrlTipordcorresp,
  uCtrlHistoContab, uCtrlTerceirosCapCar, uCtrlSubConta, uCMTreeViewMT,
  CMProcura;

type
  TfrmCadTipoDesembMT = class(TFrmCadastroMT)
    Panel1: TPanel;
    LbLTipoDesemb: TLabel;
    pnlEdicao: TPanel;
    SpbImportar: TToolbarButton97;
    PageControl1: TPageControl;
    TbsGeral: TTabSheet;
    TbContabilizacao: TTabSheet;
    qrpContaContabil: TGroupBox;
    Label1: TLabel;
    CContabil1: TCMProcuraMaskContabil;
    CContabil2: TCMProcuraMaskContabil;
    CMDBLookupCombo1: TCMDBLookupCombo;
    ChkObrigaOrc: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    CkbEfet: TDBCheckBox;
    LblTipoAvalia: TLabel;
    CmbTipoAvalia: TCMDBLookupCombo;
    Label2: TLabel;
    dbedCod: TwwDBEdit;
    Label3: TLabel;
    dbedDescricao: TDBEdit;
    pnAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    CdsSubContaCre: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    CdsHistorico: TCMClientDataSet;
    CdsTipoAvalia: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    Bevel2: TBevel;
    Bevel3: TBevel;
    wwDBGrid1: TwwDBGrid;
    DsTipoRdCorresp: TwwDataSource;
    CdsTipoRdCorresp: TCMClientDataSet;
    treeDesemb: TCMTreeViewMT;
    CdsTodos: TCMClientDataSet;
    DsCdsTodos: TwwDataSource;
    MontaSubConta: TMontaSelect;
    GroupBox1: TGroupBox;
    CMProcura1: TCMProcura;
    GroupBox2: TGroupBox;
    CMProcura2: TCMProcura;
    MontaSubContaCredito: TMontaSelect;
    dbchkAtivo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure dbedCodExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure SpbImportarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CdsTipoRdCorrespAfterInsert(DataSet: TDataSet);
    procedure CdsTipoRdCorrespBeforeDelete(DataSet: TDataSet);
    procedure treeDesembClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CdsTodosAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    sMascPict: string;
    iSoma, ind: Integer;
    lNivel: array[0..20] of Integer;
    bMontandoArvore: Boolean;
    CtrlTiporecebdesemb: TCtrlTiporecebdesemb;
    CtrlTipordcorresp: TCtrlTipordcorresp;
    CtrlHistoContab: TCtrlHistoContab;
    CtrlTerceirosCapCar: TCtrlTerceirosCapCar;
    CtrlSubConta: TCtrlSubConta;
    pRecPag: string;

// inicio - Andre Tavares - pendência 14828 - 01/09/2003
    bObrigaTrdxCcxConta, bObrigaTrdxImposto: Boolean;
// fim - Andre Tavares - pendência 14828 - 01/09/2003
  public
    { Public declarations }
    ObrigaTrdxCCxConta, ObrigaTrdxImposto: Boolean;
    CodTipRecDes: string;
    constructor Create(AOwner: TComponent; lRecPag: string = ''); reintroduce;
    function VerificaMascara(sMascara: string; var sMascPict: string;
      var lNivel: array of Integer;
      var iSoma: Integer; var ind: Integer): Boolean;
    function CalcGrau(sNoAnterior: string; lNivel: array of Integer;
      ind: Integer; var sPai: string): Integer;
  end;

var
  frmCadTipoDesembMT: TfrmCadTipoDesembMT;

implementation

uses USistema, UMensErro, UAutorizacao, DBaseDados, uCtrlParamIntegra, uString,
  FImpTipoDesembMT, uDataBase, FTrdxCCxContaMT, fCadRecDesXAgregMT;

{$R *.DFM}

procedure TfrmCadTipoDesembMT.FormCreate(Sender: TObject);
var
  smascara: string;
begin
  inherited;
  CtrlHistoContab := TCtrlHistoContab.create;
  CtrlHistoContab.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CdsHistorico.data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa, tohDescricao, '');

  CtrlTiporecebdesemb := TCtrlTiporecebdesemb.create;
  CtrlTiporecebdesemb.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlTiporecebdesemb.cds := cds;

  CtrlTipordcorresp := TCtrlTipordcorresp.create;
  CtrlTipordcorresp.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlTipordcorresp.cds := cdsTipordcorresp;
  CtrlTerceirosCapCar := TCtrlTerceirosCapCar.create;
  CtrlTerceirosCapCar.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);

  CtrlSubConta := TCtrlSubConta.create;
  CtrlSubConta.Initialize(DtmBaseDados.dbBaseDados, false, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  if pRecPag = 'R' then
  begin
    Caption := 'Cadastro de Tipo de Recebimento';
    LblTipoDesemb.Caption := 'Tipo de Recebimento';
    CContabil2.Caption := ' Conta Contábil ';
    CContabil1.Caption := ' Conta Débito ';
    GroupBox2.Caption := ' Sub-Conta Débito ';
    CmbTipoAvalia.Visible := False;
    LblTipoAvalia.Visible := False;
    CkbEfet.Caption := 'Corresponde a Um Tipo de Recebimento Operacional';
  end
  else
  begin
    Caption := 'Cadastro de Tipo de Desembolso';
    LblTipoDesemb.Caption := 'Tipo de Desembolso';
    CContabil2.Caption := ' Conta Contábil ';
    CContabil1.Caption := ' Conta a Crédito ';
    CdsTipoAvalia.data := CtrlTerceirosCapCar.ListTipoAvaliacao;
  end;

  try
    ObrigaTrdxCCxConta := False;
    ObrigaTrdxImposto := False;
    CodTipRecDes := '';
//  início - Andre Tavares - pendência 16974 - 28/06/2004
    ChkObrigaOrc.visible := sistema.IdModulo <> 4;
//  fim - Andre Tavares - pendência 16974 - 28/06/2004
    ChkObrigaOrc.Enabled := ParamIntegra.IntegraOrcamento;
    CContabil1.Plano := ParamIntegra.Plano;
    CContabil1.Mascara := ParamIntegra.MascaraPlano;
    CContabil1.Mensagens.Analitica := CContabil1.Caption + CContabil1.Mensagens.Analitica;
    CContabil1.Mensagens.Sintetica := CContabil1.Caption + CContabil1.Mensagens.Sintetica;
    CContabil1.Mensagens.NaoExiste := CContabil1.Caption + CContabil1.Mensagens.NaoExiste;
    CContabil1.Mensagens.EmBranco := CContabil1.Caption + CContabil1.Mensagens.EmBranco;

    CContabil2.Plano := ParamIntegra.Plano;
    CContabil2.Mascara := ParamIntegra.MascaraPlano;
    CContabil2.Mensagens.Analitica := CContabil2.Caption + CContabil2.Mensagens.Analitica;
    CContabil2.Mensagens.Sintetica := CContabil2.Caption + CContabil2.Mensagens.Sintetica;
    CContabil2.Mensagens.NaoExiste := CContabil2.Caption + CContabil2.Mensagens.NaoExiste;
    CContabil2.Mensagens.EmBranco := CContabil2.Caption + CContabil2.Mensagens.EmBranco;

    qrpContaContabil.Enabled := ParamIntegra.IntegraContab;

    sMascPict := '';

    if pRecPag = 'R' then
      smascara := ParamIntegra.MascaraReceb
    else
      smascara := ParamIntegra.MascaraDesemb;
    if not VerificaMascara(smascara, sMascPict, lNivel, iSoma, ind) then
    begin
      MessageBeep(0);
      ShowMessage('Máscara Inválida');
      Close;
      Exit;
    end;

    CdsTodos.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa);

    if pRecPag = 'R' then
      treeDesemb.mascara := ParamIntegra.MascaraReceb
    else
      treeDesemb.mascara := ParamIntegra.MascaraDesemb;
    bMontandoArvore := True;

    treeDesemb.MontaArvore;
    bMontandoArvore := False;

    if pRecPag = 'R' then
    begin
      Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; ';
      MontaSelect.Mascaras.Add(ParamIntegra.MascaraReceb + ';0; ');
    end
    else
    begin
      Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
      MontaSelect.Mascaras.Add(ParamIntegra.MascaraDesemb + ';0; ');
    end;
    MontaSelect.Filtro.Add('TIPORECEBDESEMB.RECPAG = ''' + pRecPag + '''');
    MontaSelect.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));
    MontaSubConta.Filtro.Add('SUBCONTA.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));
    MontaSubContaCredito.Filtro.Add('SUBCONTA.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));


    //  Rodolpho da Silva - P: 19624 - 18/07/2005
    //CdsAux.data := CtrlTiporecebdesemb.ListparamCap(Sistema.IdEmpresa);
    CdsAux.data := CtrlTiporecebdesemb.ListparamCap(Sistema.IdEmpresa,ParamIntegra.RecPag);
    
    ObrigaTrdxCCxConta := (CdsAux.FieldByName('FLGTRDXCCXCONTA').AsString = 'S');
    ObrigaTrdxImposto := (CdsAux.FieldByName('FLGTRDXIMPOSTOS').AsString = 'S');
  except
    raise;
  end;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30052;
    bbtnAjuda.HelpContext := 30052;
  end
  else
  begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
//    HelpContext           := 40034;
//    bbtnAjuda.HelpContext := 40034;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TfrmCadTipoDesembMT.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := not Cds.IsEmpty;
  if ParamIntegra.IntegraContab then
  begin
    CdsSubConta.data := CtrlSubConta.ListSubconta(Sistema.Idempresa, 0);
    CdsSubContaCre.data := CtrlSubConta.ListSubconta(Sistema.Idempresa, 0);
  end;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCod.Enabled := True;
  if dbedCod.CanFocus then
    dbedCod.SetFocus;
  pnAnaSint.Enabled := True;
  cds.fieldbyname('RecPag').AsString := pRecPag;
  cds.fieldbyname('idPessoa').AsInteger := Sistema.idEmpresa;
  cds.fieldbyname('FLGINDICARECDES').Asstring := 'S';
  cds.fieldbyname('ATIVO').Asstring := 'S';
end;

function TfrmCadTipoDesembMT.VerificaMascara(sMascara: string; var sMascPict: string;
  var lNivel: array of Integer;
  var iSoma: Integer; var ind: Integer): Boolean;
var
  i: Integer;
begin
  Result := true;
  lNivel[0] := 1;
  iSoma := 0;
  sMascPict := copy(sMascara, 1, 1);
  for i := 1 to Length(sMascara) do
  begin
    if i > 1 then
      sMascPict := sMascPict + copy(sMascara, i, 1);
    if copy(sMascara, i, 1) = '.' then
    begin
      ind := ind + 1;
      lnivel[ind] := i - ind - iSoma;
      iSoma := iSoma + lNivel[ind];
    end;
  end;
  if (ind = 0) and (length(sMascara) > 0) then
  begin
    lnivel[1] := length(sMascara);
    ind := 1;
  end;
  if ind = 0 then
    Result := false;
  lNivel[ind + 1] := Length(sMascara) - ind - iSoma;
end;

function TfrmCadTipoDesembMT.CalcGrau(sNoAnterior: string; lNivel: array of Integer;
  ind: Integer; var sPai: string): Integer;
var
  i: Integer;
  iAux: Integer;
  sAux: string;
  lAux: Boolean;
begin
  iAux := 0;
  Result := 0;
  sAux := '';
  lAux := false;
  for i := 1 to ind + 1 do
  begin
    inc(Result);
    iAux := iAux + lNivel[i];
    if length(sNoAnterior) = iAux then
    begin
      lAux := True;
      sPai := Copy(sNoAnterior, 1, iAux - lNivel[i]);
      break;
    end;
  end;
  if not lAux then
    Result := 0;
end;

procedure TfrmCadTipoDesembMT.dbedCodExit(Sender: TObject);
var
  iGrau: Integer;
  lSair: Boolean;
  lEnabled: Boolean;
  sPai: string;
begin
  if ActiveControl.tag <> 999999 then
    if CmeCadastro.Operacao in [OpInserir, OpAlterar] then
    try
      inherited;
      sPai := '';
      lEnabled := True;
      lSair := False;
      iGrau := 0;
      if Trim((dbedCod.Text)) <> '' then
      begin
        iGrau := CalcGrau(Trim(dbedCod.Text), lNivel, ind, sPai);
        if iGrau = 0 then
        begin
          MessageBeep(0);
          ShowMessage('Máscara Inválida');
          lSair := true;
        end;
      end;
      if not lSair then
      begin
        // Verifica se o tipo de Desemb já está cadastrado
        CdsAux.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa, '', '', TRIM(dbEdCod.Text));
        if not CdsAux.IsEmpty then
        begin
          MsgDlg('Tipo Desembolso já Cadastrado', 'Aviso', mtError, [mbOk], 0);
          lSair := true;
        end;
      end;
      if (not lSair) and (iGrau > 1) then
      begin
        // Verifica se conta pai é sintética
        CdsAux.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa, '', '', trim(sPai));
        if CdsAux.IsEmpty then
        begin // não tem pai
          MsgDlg('Não tem Pai', 'Aviso', mtError, [mbOk], 0);
          lSair := true;
        end
        else
        begin
          if CdsAux.FieldByName('ANASINT').AsString = 'A' then
          begin // pai é analítico
            MsgDlg('Pai é analítico', 'Aviso', mtError, [mbOk], 0);
            lSair := true;
          end;
        end;
      end;
      if lSair then
      begin
        dbEdCod.Text := '';
        dbEdCod.EditText := '';
        cds.FieldValues['CODTIPRECDES'] := '';
        if dbedCod.CanFocus then
          dbedCod.SetFocus;
        exit;
      end;
      if ((iGrau = 1) and (ind + 1 > 1)) then
      begin
        sbtnSintetico.Down := True;
        cds.FieldByName('ANASINT').AsString := 'S';
        lEnabled := false;
      end;
      if iGrau = ind + 1 then
      begin
        sbtnAnalitico.Down := True;
        cds.FieldByName('ANASINT').AsString := 'A';
        lEnabled := false;
      end;
      pnAnaSint.Enabled := lEnabled;
    except
      raise;
    end;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  treeDesemb.Enabled := False;
  dbedCod.Enabled := False;
  pnAnaSint.Enabled := False;
  if dbedDescricao.CanFocus then
    dbedDescricao.SetFocus;
end;

procedure TfrmCadTipoDesembMT.sbtnAnaliticoClick(Sender: TObject);
begin
  inherited;
  qrpContaContabil.Enabled := ParamIntegra.IntegraContab;
end;

procedure TfrmCadTipoDesembMT.sbtnSinteticoClick(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('PLACONTA').Clear;
  Cds.FieldByName('PLACONTACREDITO').Clear;
  qrpContaContabil.Enabled := False;
end;

procedure TfrmCadTipoDesembMT.sbtnApagarClick(Sender: TObject);
begin
  if treeDesemb.Selected.HasChildren then { Força a deleção das pastas analíticas uma a uma }
  begin
    MsgDlg('Pasta(s) Analítica(s) terão que ser apagada(s) primeiro!', 'Erro', mtError, [mbOK], 0);
    Exit;
  end;
  inherited;
  Cds.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa);
  if pRecPag = 'R' then
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  else
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
  PnlFundo.Enabled := not Cds.IsEmpty;
end;

procedure TfrmCadTipoDesembMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if not sbtnInserir.Down then
  begin
    treeDesemb.Enabled := True;
    PnlFundo.Enabled := not Cds.IsEmpty;
  end;
end;

procedure TfrmCadTipoDesembMT.sbtnInserirClick(Sender: TObject);
begin
  PnlFundo.Enabled := False;
  treeDesemb.Enabled := False;
  inherited;
end;

procedure TfrmCadTipoDesembMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := False;
end;

procedure TfrmCadTipoDesembMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  treeDesemb.Enabled := True;
  PnlFundo.Enabled := not Cds.IsEmpty;
  Cds.First;
end;

procedure TfrmCadTipoDesembMT.SpbImportarClick(Sender: TObject);
begin
  inherited;
  SpbImportar.Down := False;
  Cds.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa);
  if Cds.IsEmpty then
  begin
    AbrirFormModal(FrmImpTipoDesembMT, TFrmImpTipoDesembMT);
    Cds.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa);
    if not Cds.IsEmpty then
    begin
      bMontandoArvore := True;
      treeDesemb.MontaArvore;
      bMontandoArvore := False;
    end;
    PnlFundo.Enabled := not Cds.IsEmpty;
  end
  else
  if pRecPag = 'P' then
    Msgdlg('Já existem Tipos de Desembolso cadastrados, impossível importar', 'Aviso', mterror, [mbOk], 0)
  else
     Msgdlg('Já existem Tipos de Recebimento cadastrados, impossível importar', 'Aviso', mterror, [mbOk], 0)
end;

procedure TfrmCadTipoDesembMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if (MontaSelect.RetornouValor) then
  begin
    Cds.Locate('CODTIPRECDES', Trim(MontaSelect.ValoresChave[0]), []);
    CdsTodos.Locate('CODTIPRECDES', Trim(MontaSelect.ValoresChave[0]), []);
  //  PnlFundo.Enabled := not Cds.IsEmpty;
    treeDesemb.Enabled := True;
    treeDesembClick(Sender);
  end;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnAnaSint.Enabled := bbtnConfirmar.Enabled;
  pnlEdicao.Enabled := True;
  qrpContaContabil.Enabled := (pnAnaSint.Enabled and ParamIntegra.IntegraContab);
end;

procedure TfrmCadTipoDesembMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
// inicio - Andre Tavares - pendência 14828 - 01/09/2003
//var
//  bObrigaTrdxCcxConta, bObrigaTrdxImposto: Boolean;
// fim - Andre Tavares - pendência 14828 - 01/09/2003
begin
  //  inherited;
  if Trim(dbedDescricao.Text) = '' then
  begin
    MsgDlg('Descrição não preenchida', 'Aviso', mtError, [mbOk], 0);
    if dbedDescricao.CanFocus then
      dbedDescricao.SetFocus;
    Accept := False
  end
  else if (ParamIntegra.IntegraContab) and
    ((CContabil1.Valida <> VcOk) or
    (CContabil2.Valida <> VcOk)) then
    Accept := False
  else
  begin
    Accept := True;
  end;

  bObrigaTrdxCcxConta := False;
  bObrigaTrdxImposto := False;
  if CmeCadastro.Operacao in [opInserir, opAlterar] then
  begin
    if sbtnAnalitico.Down then
      cds.FieldByName('ANASINT').AsString := 'A'
    else
      cds.FieldByName('ANASINT').AsString := 'S';
    if ParamIntegra.IntegraContab then
      cds.FieldByName('Plano').AsInteger := ParamIntegra.Plano;

    bObrigaTrdxCcxConta := (cds.fieldbyname('PLACONTA').IsNull) and
      (cds.fieldbyname('ANASINT').ASsTring = 'A') and
      (ObrigaTrdxCCxConta) and
      (CmeCadastro.Operacao = OpInserir);

    bObrigaTrdxImposto := (cds.fieldbyname('ANASINT').ASsTring = 'A') and
      (cds.fieldbyname('FLGCALCULAIMPOSTO').ASsTring = 'S') and
      (ObrigaTrdxImposto) and
      (CmeCadastro.Operacao = OpInserir);

    if bObrigaTrdxCcxConta or bObrigaTrdxImposto then
      CodTipRecDes := cds.fieldbyname('CODTIPRECDES').AsString
    else
      CodTipRecDes := '';
  end;

// inicio - Andre Tavares - pendência 14828 - 01/09/2003
  inherited;
{
  try
    inherited;
    if CodTipRecDes <> '' then
    begin
      if ObrigaTrdxCCxConta and bObrigaTrdxCcxConta then
        AbrirFormModal(FrmTrdxCCxContaMT, TFrmTrdxCCxContaMT);
      if ObrigaTrdxImposto and bObrigaTrdxImposto then
        AbrirFormModal(FrmCadRecDesXAgregMT, TfrmCadRecDesXAgregMT);
    end;
    CodTipRecDes := '';
  except
    CodTipRecDes := '';
    raise;
  end;
}
// fim - Andre Tavares

end;

procedure TfrmCadTipoDesembMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTiporecebdesemb.GravarTipoRecebDesemb(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
  if Accept then
    if not Cdstodos.isempty then
      Cdstodos.delete;

end;

procedure TfrmCadTipoDesembMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlTiporecebdesemb.GravarTipoRecebDesemb(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
  if Accept then
  begin
    CdsTodos.edit;
    CdsTodos.fieldbyname('DESCRICAO').asstring := Cds.fieldbyname('DESCRICAO').asstring;
    CdsTodos.fieldbyname('ANASINT').asstring := Cds.fieldbyname('ANASINT').asstring;
    CdsTodos.post;
  end;
end;

procedure TfrmCadTipoDesembMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var
  vcod, Vdsc, vana: string;
begin
  vcod := Cds.fieldbyname('CODTIPRECDES').asstring;
  Vdsc := Cds.fieldbyname('DESCRICAO').asstring;
  vana := Cds.fieldbyname('ANASINT').asstring;
  inherited;
  Accept := CtrlTiporecebdesemb.GravarTipoRecebDesemb(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
  if Accept then
  begin
    CdsTodos.Append;
    CdsTodos.fieldbyname('CODTIPRECDES').asstring := vcod;
    CdsTodos.fieldbyname('DESCRICAO').asstring := vdsc;
    CdsTodos.fieldbyname('ANASINT').asstring := vana;
    CdsTodos.post;
  end;
end;

procedure TfrmCadTipoDesembMT.CdsTipoRdCorrespAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  CdsTipoRdCorresp.fieldbyname('CODTIPRECDES').AsString := Cds.fieldbyname('CODTIPRECDES').AsString;
  CdsTipoRdCorresp.fieldbyname('RECPAG').AsString := pRecPag;
  CdsTipoRdCorresp.fieldbyname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
end;

procedure TfrmCadTipoDesembMT.CdsTipoRdCorrespBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  if (not Cds.IsEmpty) and
    (CdsTipoRdCorresp.fieldbyname('CODCORRESP').AsString = cds.fieldbyname('CODCORRESP').AsString) then
    cds.fieldbyname('CODCORRESP').Clear;
end;

procedure TfrmCadTipoDesembMT.treeDesembClick(Sender: TObject);
begin
  inherited;
  Cds.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa, '', '',
    CdsTodos.fieldbyname('CODTIPRECDES').asstring);
  if pRecPag = 'R' then
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  else
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';

  if not Cds.IsEmpty then
  begin
    if (Cds.FieldByName('ANASINT').AsString = 'A') then
      sbtnAnalitico.Down := True
    else
      sbtnSintetico.Down := True;
    CdsTipoRdCorresp.data := CtrlTipordcorresp.ListTipordcorresp(0,
      Cds.fieldbyname('CODTIPRECDES').AsString,
      Cds.fieldbyname('RECPAG').AsString,
      Cds.fieldbyname('IDPESSOA').AsFloat);
    if (CdsTipoRdCorresp.IsEmpty) and (not Cds.fieldbyname('CODCORRESP').IsNull) then
    begin
      CdsTipoRdCorresp.Append;
      CdsTipoRdCorresp.fieldbyname('CODCORRESP').AsString := Cds.fieldbyname('CODCORRESP').AsString;
      CdsTipoRdCorresp.Post;
      CtrlTipordcorresp.GravarTipordcorresp;
    end;
  end;

end;

procedure TfrmCadTipoDesembMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if CtrlTiporecebdesemb.MessageInfo <> '' then
    MsgDlg(CtrlTiporecebdesemb.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;

procedure TfrmCadTipoDesembMT.CdsTodosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  Cds.data := CtrlTiporecebdesemb.ListTiporecebdesemb(pRecPag, Sistema.idEmpresa, '', '',
    CdsTodos.fieldbyname('CODTIPRECDES').asstring);
  if pRecPag = 'R' then
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraReceb + ';0; '
  else
    Cds.FieldByName('CODTIPRECDES').EditMask := ParamIntegra.MascaraDesemb + ';0; ';
end;

constructor TfrmCadTipoDesembMT.Create(AOwner: TComponent;
  lRecPag: string);
begin
  pRecPag := ParamIntegra.RecPag;
  if trim(lRecPag) <> '' then
    pRecPag := lRecPag;
  inherited Create(AOwner);
end;

procedure TfrmCadTipoDesembMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
// inicio - Andre Tavares - pendência 14828 - 01/09/2003
  try
    if CodTipRecDes <> '' then
    begin
      if ObrigaTrdxCCxConta and bObrigaTrdxCcxConta then
        AbrirFormModal(FrmTrdxCCxContaMT, TFrmTrdxCCxContaMT);
      if ObrigaTrdxImposto and bObrigaTrdxImposto then
        AbrirFormModal(FrmCadRecDesXAgregMT, TfrmCadRecDesXAgregMT);
    end;
    CodTipRecDes := '';
  except
    CodTipRecDes := '';
    raise;
  end;
// fim - Andre Tavares

end;

end.

