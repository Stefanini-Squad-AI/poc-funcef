unit fAnalSolic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, fSelPessoalMT,
  DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, DBCtrls, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, uCMClientDataSet, CmParamReport,
  uCtrlRegSolic;

type
  TfrmAnalSolic = class(TfrmSelPessoalMT)
    dsSolicitacao: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    Panel3: TPanel;
    lblQtdSolic: TLabel;
    lblValSolic: TLabel;
    dbnavSolicitacao: TDBNavigator;
    PanelBase: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    lblQtdBase: TLabel;
    lblValBase: TLabel;
    PanelPerc: TPanel;
    Label11: TLabel;
    lblPerc: TLabel;
    tb97ImpCarta: TToolbar97;
    sbtnImprimirCarta: TSpeedButton;
    tb97Botoes: TToolbar97;
    ToolbarSep975: TToolbarSep97;
    sbtnEfetivar: TBitBtn;
    sbtnComparar: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    CdsSolicitacao: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnCompararClick(Sender: TObject);
    procedure sbtnEfetivarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnImprimirCartaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    CtrlRegSolic: TCtrlRegSolic;

    bSelPessoaIndicada: boolean;
    sListaIdPessoa, sListaNumCarta, sListaIdSolSemCarta: string;
    iTotPessoas: integer;
    dTotSalario: double;

    procedure ImprimirCarta(TipoExec: byte);
    function  CriarListaIndicados(Dados: OleVariant; Campo: string): string;
    procedure Progresso(Arg: array of variant);
  public
    DataIni, DataFim: TDate;
    ListaIdFuncSel, ListaIdMotivoSel, sListaIdIndicado: string;
    SelIndicados, SelSolicPropostas, SelSolicEfetivadas: boolean;
  end;

var
  frmAnalSolic: TfrmAnalSolic;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, fBaseComp,
  fParamCartaComunicado, RCartaComunicado;

{$R *.DFM}

procedure TfrmAnalSolic.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegSolic := TCtrlRegSolic.Create(Sistema.IdEmpresa, Sistema.TipoEmpresa,
    Sistema.UsaRAD, Sistema.IdUsuario);
  CtrlRegSolic.InitializeAs(Padroes);
  CtrlRegSolic.CdsSolAltFunc := CdsSolicitacao;
  CtrlRegSolic.Progresso := Progresso;
  
  tb97Botoes.Visible := false;
  tb97ImpCarta.Visible := false;
end;

procedure TfrmAnalSolic.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRegSolic);
  inherited;
end;

procedure TfrmAnalSolic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caHide;
end;

procedure TfrmAnalSolic.FormShow(Sender: TObject);
begin
  inherited;
  iTotPessoas := 0;
  dTotSalario := 0;
  if (SelIndicados) then
    bbtnOutraVezClick(Sender)
  else
    bbtnConfirmarClick(frmAnalSolic);
end;

procedure TfrmAnalSolic.FormResize(Sender: TObject);
begin
  inherited;
  if Assigned(tb97Botoes) then
    tb97Botoes.DockPos := tb97ImpCarta.Width + 1;
end;

procedure TfrmAnalSolic.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  tb97Botoes.Visible := false;
  tb97ImpCarta.Visible := false;
  rgSequencia.Visible := false;
  ModalResult := mrNone;
end;

procedure TfrmAnalSolic.bbtnConfirmarClick(Sender: TObject);
var
  dValSolic: double;
begin
  inherited;
  ModalResult := mrNone;

  // Pessoas selecionadas indicadas
  sListaIdIndicado := '';
  if (SelIndicados) then
    sListaIdIndicado := CriarListaIndicados(CdsPrincipal.Data, 'IDPESSOA');

  CdsSolicitacao.Data := CtrlRegSolic.ListSolicitacoes(
    sListaIdIndicado, ListaIdFuncSel, ListaIdMotivoSel, SelSolicPropostas,
    SelSolicEfetivadas, DataIni, DataFim);

  lblQtdSolic.Caption := IntToStr(CdsSolicitacao.RecordCount);
  dValSolic := CtrlRegSolic.GerarValSolic(CdsPrincipal.Data);
  lblValSolic.Caption := FloatToStrF(dValSolic, ffFixed, 12, 2);

  if (dTotSalario > 0) then
    lblPerc.Caption := FloatToStrF(dValSolic * 100 / dTotSalario, ffFixed, 6, 2);

  bbtnOutraVez.Visible := SelIndicados;
  tb97Botoes.Visible := (SelSolicPropostas) and not(CdsSolicitacao.IsEmpty);
  tb97ImpCarta.Visible := not(CdsSolicitacao.IsEmpty);
end;

procedure TfrmAnalSolic.sbtnImprimirCartaClick(Sender: TObject);
begin
  ImprimirCarta(CARTA_SOLIC);
end;

procedure TfrmAnalSolic.sbtnEfetivarClick(Sender: TObject);
var
  Marca: TBookMark;
  bOk: boolean;
  sListaIdIndicado: string;
begin
  ImprimirCarta(CARTA_EFETIV_SOLIC);

  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Efetivando Solicitações...');

  CdsSolicitacao.DisableControls;
  Marca := CdsSolicitacao.GetBookmark;

  sListaIdIndicado := '';
  if (bSelPessoaIndicada) then
  begin
    frmAguarde.Max := 1;
    if (CdsSolicitacao.FieldByName('SITUACAO_SOLIC').asInteger = 0) then
      sListaIdIndicado := CdsSolicitacao.FieldByName('IDINDICADO').asString;
  end
  else
  begin
    frmAguarde.Max := CdsSolicitacao.RecordCount;
    sListaIdIndicado := CriarListaIndicados(CdsSolicitacao.Data, 'IDINDICADO');
    CdsSolicitacao.GotoBookmark(Marca);
  end;

  if (sListaIdIndicado <> '') then
  begin
    CtrlRegSolic.CreateThreadProgresso;
    bOk := CtrlRegSolic.GravarSolicitacoes(bSelPessoaIndicada, sListaIdIndicado);
    CtrlRegSolic.FreeThreadProgresso;
  end
  else
  begin
    CdsSolicitacao.GotoBookmark(Marca);
    CdsSolicitacao.FreeBookmark(Marca);
    CdsSolicitacao.EnableControls;
    frmAguarde.Apaga;
    MsgDlg('Não há Solicitações a serem Efetivadas.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;

  CdsSolicitacao.GotoBookmark(Marca);
  CdsSolicitacao.FreeBookmark(Marca);
  CdsSolicitacao.EnableControls;
  frmAguarde.Apaga;
  if (bOk) then
    MsgDlg(CtrlRegSolic.MessageInfo, 'Aviso', mtInformation, [mbOk, mbHelp], 0)
  else
    raise Exception.Create(CtrlRegSolic.MessageInfo);
end;

procedure TfrmAnalSolic.sbtnCompararClick(Sender: TObject);
begin
  if (MsgDlg('Deseja Definir (Nova) Base Comparativa?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    frmBaseComp := TfrmBaseComp.Create(Self);
    if (frmBaseComp.ShowModal = mrOk) and (frmBaseComp.TotSalario > 0) then
    begin
      iTotPessoas := frmBaseComp.TotPessoas;
      dTotSalario := frmBaseComp.TotSalario;
      lblQtdBase.Caption := IntToStr(iTotPessoas);
      lblValBase.Caption := FloatToStrF(dTotSalario, ffFixed, 12, 2);
      lblPerc.Caption := FloatToStrF(StrToFloat(lblValSolic.Caption) * 100 /
        dTotSalario, ffFixed, 6, 2);
    end
    else
    begin
      iTotPessoas := 0;
      dTotSalario := 0;
    end;
    FreeAndNil(frmBaseComp);
  end;
  PanelBase.Visible := (dTotSalario > 0);
  PanelPerc.Visible := (dTotSalario > 0);
end;

procedure TfrmAnalSolic.ImprimirCarta(TipoExec: byte);
var
  Marca: TBookMark;
  sListaId_Solic_Alter_Func: string;
begin
  sListaNumCarta := '';
  sListaIdSolSemCarta := '';
  sListaIdPessoa := '';

  with TfrmParamCartaComunicado.Create(Self) do
  try
    Visible := false;
    TipoParam := TipoExec;

    if (ShowModal = mrOk) then
    begin
      if not(CtrlRegSolic.GerarDadosCarta(rgSelecao.ItemIndex=0, TipoExec=CARTA_EFETIV_SOLIC,
        sListaNumCarta, sListaIdSolSemCarta, sListaIdPessoa)) then
        raise Exception.Create(CtrlRegSolic.MessageInfo);

      if (sListaIdSolSemCarta <> '') then
        MsgDlg('Não Há Carta para a' +FU.IFF(Pos(',',sListaIdSolSemCarta) > 0,'s','')+
          ' Solicitaç' +FU.IFF(Pos(',',sListaIdSolSemCarta) > 0,'ões','ão')+ ': ' +
          sListaIdSolSemCarta, 'Aviso', mtInformation, [mbOk, mbHelp], 0);

      if (sListaIdPessoa <> '') then
      begin
        NumCarta := sListaNumCarta;
        RptCartaComunicado.ListaIdPessoaSel := sListaIdPessoa;

        sListaId_Solic_Alter_Func := '';
        Marca := CdsSolicitacao.GetBookmark;
        CdsSolicitacao.DisableControls;
        CdsSolicitacao.First;
        while not(CdsSolicitacao.EOF) do
        begin
          if (FU.VerificaCodigoEm(sListaIdSolSemCarta,
              CdsSolicitacao.FieldByName('ID_SOLIC_ALTER_FUNC').asString, ',') <> 1) then
          begin
            if (sListaId_Solic_Alter_Func = '') then
              sListaId_Solic_Alter_Func := CdsSolicitacao.FieldByName('ID_SOLIC_ALTER_FUNC').asString
            else
              sListaId_Solic_Alter_Func := sListaId_Solic_Alter_Func +','+
                CdsSolicitacao.FieldByName('ID_SOLIC_ALTER_FUNC').asString;
          end;
          CdsSolicitacao.Next;
        end;
        CdsSolicitacao.First;
        CdsSolicitacao.EnableControls;
        CdsSolicitacao.GotoBookmark(Marca);
        CdsSolicitacao.FreeBookmark(Marca);

        RptCartaComunicado.ListaIdSolicitacao := sListaId_Solic_Alter_Func;
        ImprimirCarta;
      end;
    end;
    bSelPessoaIndicada := (rgSelecao.ItemIndex = 0);
  finally
    Free;
  end;
end;

function TfrmAnalSolic.CriarListaIndicados(Dados: OleVariant; Campo: string): string;
var
  bOk: boolean;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := Dados;

  _CdsAux.DisableControls;
  _CdsAux.First;
  Result := '';
  while not(_CdsAux.EOF) do
  begin
    if (Campo = 'IDPESSOA') then
      bOk := true
    else
      bOk := (_CdsAux.FieldByName('SITUACAO_SOLIC').asInteger = 0);

    if (bOk) then
      if (Result = '') then
        Result := _CdsAux.FieldByName(Campo).asString
      else
        Result := Result +','+ _CdsAux.FieldByName(Campo).asString;

    _CdsAux.Next;
  end;
  _CdsAux.First;
  _CdsAux.EnableControls;

  _CdsAux.Free;
end;

procedure TfrmAnalSolic.Progresso(Arg: array of variant);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  Self.Repaint;
  frmAguarde.Update;
end;

end.
