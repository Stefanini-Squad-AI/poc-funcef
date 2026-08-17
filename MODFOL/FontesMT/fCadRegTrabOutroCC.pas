unit fCadRegTrabOutroCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, TB97,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  CMProcura, wwdbedit, TREdit, wwdbdatetimepicker, CMDateTimePicker, wwdblook, ImgList,
  DBClient, CmEventosCadastro, uCMClientDataSet, fCadastroMestreDetMT, TB97Tlwn, uCtrlSitFunc,
  uCtrlPessoaFuncionario, uCtrlCargo, uCtrlListTerceirosRH, uCtrlHoraTrabOutroCC,
  uCtrlPpraCipa, uCtrlHoraTrab;

type
  TfrmCadRegTrabOutroCC = class(TFrmCadastroMestreDetMT)
    CdsDet: TCMClientDataSet;
    CdsCargo2: TCMClientDataSet;
    CdsLotacao: TCMClientDataSet;
    Label1: TLabel;
    Label10: TLabel;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    edSitFunc: TEdit;
    edCargo: TEdit;
    dbedNomeCC: TwwDBEdit;
    Label7: TLabel;
    dblcLotac: TwwDBLookupCombo;
    dbrgRateio: TDBRadioGroup;
    CdsCargo: TCMClientDataSet;
    edCentroCusto: TEdit;
    bbtnEmpresas: TBitBtn;
    CdsEmpresa: TCMClientDataSet;
    townEmpresas: TToolWindow97;
    btnOkMudar: TBitBtn;
    btnCancelarMudar: TBitBtn;
    gbxEmpresas: TGroupBox;
    dblcEmpresas: TwwDBLookupCombo;
    gbxDataServico: TGroupBox;
    dbedDatTrab: TCMDateTimePicker;
    gbxQtdeHoras: TGroupBox;
    dbedHoras: TDBRealEdit;
    dbrgPermanente: TDBRadioGroup;
    dbrgCargaTotal: TDBRadioGroup;
    CdsHorario: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dblcLotacChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnEmpresasClick(Sender: TObject);
    procedure btnOkMudarClick(Sender: TObject);
    procedure btnCancelarMudarClick(Sender: TObject);
    procedure dbrgPermanenteChange(Sender: TObject);
    procedure dbrgCargaTotalChange(Sender: TObject);
  private
    CtrlHoraTrabOutroCC: TCtrlHoraTrabOutroCC;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlPpraCipa: TCtrlPpraCipa;
    CtrlHoraTrab: TCtrlHoraTrab;

    wDia, wMes, wAno: word;

    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRegTrabOutroCC: TfrmCadRegTrabOutroCC;

implementation

uses Math, uCMTypes, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, 
  uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmCadRegTrabOutroCC.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHoraTrabOutroCC := TCtrlHoraTrabOutroCC.Create;
  CtrlHoraTrabOutroCC.InitializeAs(Padroes);
  CtrlHoraTrabOutroCC.CdsHoraTrabOutroCC := CdsDet;

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlPpraCipa := TCtrlPpraCipa.Create;
  CtrlPpraCipa.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  CdsCargo.Data := CtrlCargo.ListCargo;

  CdsEmpresa.Data := CtrlPpraCipa.ListEmpresaProp;
  bbtnEmpresas.Visible := (CdsEmpresa.RecordCount > 1);

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
    Add('FUNCIONARIO.CODCENTROCUSTO = CC.CODCENTROCUSTO');
    Add('FUNCIONARIO.IDEMPRESA = CC.IDEMPRESA');
  end;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  DecodeDate(Date, wAno, wMes, wDia);

  // Apresentar o MontaSelect antes de visualizar o Form
  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);
end;

procedure TfrmCadRegTrabOutroCC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlHoraTrabOutroCC);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlHoraTrab);
  inherited;
end;

procedure TfrmCadRegTrabOutroCC.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    dmCds.Cds.Data := CtrlSitFunc.ListGeral(Cds.FieldByName('IDSITFUNC').asInteger);
    if not(dmCds.Cds.IsEmpty) then
      edSitFunc.Text := dmCds.Cds.FieldByName('DESCRICAO').asString
    else
      edSitFunc.Text := '';

    if (CdsLotacao.Locate('CODCENTROCUSTO', Cds.FieldByName('CODCENTROCUSTO').asString, [])) then
      edCentroCusto.Text := CdsLotacao.FieldByName('NOME').asString
    else
      edCentroCusto.Text := '';

    if (CdsCargo.Locate('IDCARGO', Cds.FieldByName('IDCARGO').asFloat, [])) then
      edCargo.Text := CdsCargo.FieldByName('TITULO').asString
    else
      edCargo.Text := '';
  end;
end;

procedure TfrmCadRegTrabOutroCC.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IdPessoa').asFloat := Cds.FieldByName('IdPessoa').asFloat;
  CdsDet.FieldByName('IdEmpresa').asInteger := Cds.FieldByName('IdEmpresa').asInteger;
  CdsDet.FieldByName('FLGRATEIO').asInteger := 1;
  CdsDet.FieldByName('FLGPERMANENTE').asInteger := 0;
  CdsDet.FieldByName('FLGCARGATOTAL').asInteger := 0;
end;

procedure TfrmCadRegTrabOutroCC.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegTrabOutroCC.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegTrabOutroCC.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbedDatTrab.CanFocus) then
    dbedDatTrab.SetFocus;
end;

procedure TfrmCadRegTrabOutroCC.dblcLotacChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('CENTROCUSTO').asString := CdsLotacao.FieldByName('NOME').asString;
end;

procedure TfrmCadRegTrabOutroCC.bbtnOkDetClick(Sender: TObject);
begin
  if (dbrgPermanente.ItemIndex = 1) and (CdsDet.FieldByName('DATATRAB').IsNull) then
  begin
    MsgDlg('Informe a Data do Serviço.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDatTrab.SetFocus;
    exit;
  end;

  if (dbrgPermanente.ItemIndex = 0) and (CdsDet.FieldByName('DATATRAB').IsNull) then
  begin
    MsgDlg('Informe a Data de Início do Serviço Permanente.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDatTrab.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATATRAB').asDateTime > Date) then
    if (MsgDlg('Evento para Data Futura.' +CR_LF+ 'Confirma?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      dbedDatTrab.SetFocus;
      exit;
    end;

  if (dbrgCargaTotal.ItemIndex = 1) and (dbedHoras.Value = 0) then
  begin
    MsgDlg('Informe o Número de Horas Trabalhadas.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedHoras.SetFocus;
    exit;
  end;

  if (Trim(dblcLotac.Text) = '') then
  begin
    MsgDlg('Informe o Centro de Custo.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dblcLotac.SetFocus;
    exit;
  end;

  inherited;
end;

procedure TfrmCadRegTrabOutroCC.bbtnConfirmarClick(Sender: TObject);
var
  dHoras: array[1..36] of double;
  i, j: integer;
begin
  for i:=1 to 36 do
    dHoras[i] := 0;
  CdsDet.First;
  while not(CdsDet.EOF) do
  begin
    if (CdsDet.FieldByName('FLGPERMANENTE').asInteger = 1) then
    begin
      if (FU.ExtraiAno(CdsDet.FieldByName('DATATRAB').asDateTime) - wAno <  2) then
      begin
        i := FU.ExtraiMes(CdsDet.FieldByName('DATATRAB').asDateTime) +
               (FU.ExtraiAno(CdsDet.FieldByName('DATATRAB').asDateTime) - wAno + 1) * 12;
        j := max(i,1);
        if (CdsDet.FieldByName('FLGCARGATOTAL').asInteger = 1) then
          for i:=j to 36 do
            dHoras[i] := dHoras[i] + CdsHorario.FieldByName('JORNADAMENSAL').asFloat
        else
          for i:=j to 36 do
            dHoras[i] := dHoras[i] + CdsDet.FieldByName('HORASTRAB').asFloat;
      end;
    end
    else 
    if (FU.ExtraiAno(CdsDet.FieldByName('DATATRAB').asDateTime) - wAno > -2) and
       (FU.ExtraiAno(CdsDet.FieldByName('DATATRAB').asDateTime) - wAno <  2) then
    begin
      i := FU.ExtraiMes(CdsDet.FieldByName('DATATRAB').asDateTime) +
             (FU.ExtraiAno(CdsDet.FieldByName('DATATRAB').asDateTime) - wAno + 1) * 12;
      if (CdsDet.FieldByName('FLGCARGATOTAL').asInteger = 1) then
        dHoras[i] := dHoras[i] + CdsHorario.FieldByName('JORNADAMENSAL').asFloat
      else
        dHoras[i] := dHoras[i] + CdsDet.FieldByName('HORASTRAB').asFloat;
    end;

    CdsDet.Next;
  end;
  CdsDet.First;

  for i:=1 to 36 do
  begin
    if (dHoras[i] > CdsHorario.FieldByName('JORNADAMENSAL').asFloat) then
    begin
      MsgDlg('Inconsistência em Lançamentos no mês '+
             FU.PoeZero(FU.IFF(i mod 12=0,12,i mod 12))+
             '/'+ IntToStr(Trunc(i/12)+wAno-1-FU.IFF(i mod 12=0,1,0)),
             'Aviso', mtWarning, [mbOk, mbHelp], 0);
      exit;
    end;
  end;
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRegTrabOutroCC.bbtnEmpresasClick(Sender: TObject);
begin
  townEmpresas.Top := 140;
  townEmpresas.Visible := True;
end;

procedure TfrmCadRegTrabOutroCC.btnOkMudarClick(Sender: TObject);
begin
  if (dblcEmpresas.Text = '') then
  begin
    MsgDlg('Escolha a Empresa.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcEmpresas.SetFocus;
    exit;
  end;

  Self.Enabled := true;
  townEmpresas.Visible := false;
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(CdsEmpresa.FieldByName('IDPESSOA').asString);
  CdsDet.FieldByName('IdEmpresa').asInteger := CdsEmpresa.FieldByName('IDPESSOA').asInteger;
end;

procedure TfrmCadRegTrabOutroCC.btnCancelarMudarClick(Sender: TObject);
begin
  Self.Enabled := true;
  townEmpresas.Visible := false;
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  CdsDet.FieldByName('IdEmpresa').asInteger := Cds.FieldByName('IdEmpresa').asInteger;
end;

procedure TfrmCadRegTrabOutroCC.dbrgPermanenteChange(Sender: TObject);
begin
  if (dbrgPermanente.ItemIndex = 1) then
    gbxDataServico.Caption := 'Data do Serviço'
  else
    gbxDataServico.Caption := 'A Partir De'
end;

procedure TfrmCadRegTrabOutroCC.dbrgCargaTotalChange(Sender: TObject);
begin
  gbxQtdeHoras.Visible := (dbrgCargaTotal.ItemIndex = 1);
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRegTrabOutroCC.Sel(IDPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa, 'P.NOME, F.*');
  CdsDet.Data := CtrlHoraTrabOutroCC.ListHoraTrabOutroCC(IdPessoa);

  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab(Cds.FieldByName('IDHORARIO').AsInteger, 0);

  TFloatField(CdsDet.FieldByName('HORASTRAB')).DisplayFormat := '##0.00';
end;

function TfrmCadRegTrabOutroCC.GravarRegistro: boolean;
begin
  Result := CtrlHoraTrabOutroCC.GravarHoraTrabOutroCC;
  if not(Result) then
    raise exception.Create(CtrlHoraTrabOutroCC.MessageInfo);
end;

end.