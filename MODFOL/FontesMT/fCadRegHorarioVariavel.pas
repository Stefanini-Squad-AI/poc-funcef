unit fCadRegHorarioVariavel;

interface                                                         
                                                                    
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, TB97,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  CMProcura, wwdbedit, TREdit, wwdbdatetimepicker, CMDateTimePicker, wwdblook, ImgList,
  DBClient, CmEventosCadastro, uCMClientDataSet, fCadastroMestreDetMT, TB97Tlwn,
  uCtrlPessoaFuncionario, uCtrlHorarioVariavel, uCtrlCargo, uCtrlListTerceirosRH,
  uCtrlHoraTrab, uCtrlSitFunc, IvEMulti, fTelaAut;

type
  TfrmCadRegHorarioVariavel = class(TFrmCadastroMestreDetMT)
    CdsDet: TCMClientDataSet;
    Label1: TLabel;
    Label10: TLabel;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    edSitFunc: TEdit;
    edCargo: TEdit;
    Label7: TLabel;
    dblcHorario: TwwDBLookupCombo;
    edCentroCusto: TEdit;
    gbxDataServico: TGroupBox;
    dbedDatIni: TCMDateTimePicker;
    CdsHorario: TCMClientDataSet;
    dbedDatFim: TCMDateTimePicker;
    Label2: TLabel;
    CdsLotacao: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    sbtnCriaColetivo: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcHorarioChange(Sender: TObject);
    procedure sbtnCriaColetivoClick(Sender: TObject);
  private
    CtrlHorarioVariavel: TCtrlHorarioVariavel;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlSitFunc: TCtrlSitFunc;

    procedure Sel(IdPessoa: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRegHorarioVariavel: TfrmCadRegHorarioVariavel;

implementation

uses Math, uCMTypes, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH,
  uCtrlUsoGeralRH, dCds, fCadRegHorarioColet;

{$R *.DFM}

procedure TfrmCadRegHorarioVariavel.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);
  CtrlHorarioVariavel.CdsHorarioVariavel := CdsDet;

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

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  CdsCargo.Data := CtrlCargo.ListCargo;

  // Listar somente horários fixos na semana TIPO = 0
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab(0, 0);

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXFilial) = 0) then
        Add('FUNCIONARIO.IDESTAB = ' +CtrlUsoGeralRH.UsuXFilial)
      else
        Add('FUNCIONARIO.IDESTAB IN (' +CtrlUsoGeralRH.UsuXFilial +')');

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) = 0) then
        Add('FUNCIONARIO.CODCENTROCUSTO = ' +CtrlUsoGeralRH.UsuXCCusto)
      else
        Add('FUNCIONARIO.CODCENTROCUSTO IN (' +CtrlUsoGeralRH.UsuXCCusto +')');

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Apresentar o MontaSelect antes de visualizar o Form
  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);
end;

procedure TfrmCadRegHorarioVariavel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlHorarioVariavel);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlSitFunc);
  inherited;
end;

procedure TfrmCadRegHorarioVariavel.CmeCadastroFind(Sender: TObject);
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

procedure TfrmCadRegHorarioVariavel.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
end;

procedure TfrmCadRegHorarioVariavel.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegHorarioVariavel.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegHorarioVariavel.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbedDatIni.CanFocus) then
    dbedDatIni.SetFocus;
end;

procedure TfrmCadRegHorarioVariavel.dblcHorarioChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    CdsDet.FieldByName('HORARIO').asString := CdsHorario.FieldByName('NOMEHORARIO').asString;
end;

procedure TfrmCadRegHorarioVariavel.bbtnOkDetClick(Sender: TObject);
begin
  if (CdsDet.FieldByName('DATAINI').IsNull) then
  begin
    MsgDlg(fu.CMTranslate('Informe a Data de Início do Período.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    dbedDatIni.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATAFIM').IsNull) then
  begin
    MsgDlg(fu.CMTranslate('Informe a Data Final do Período.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    dbedDatFim.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATAFIM').asDateTime < CdsDet.FieldByName('DATAINI').asDateTime) then
  begin
    MsgDlg(fu.CMTranslate('Data Final do Período não pode ser anterior à de Início.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    dbedDatIni.SetFocus;
    exit;
  end;

  if (CdsDet.FieldByName('DATAFIM').asDateTime < CdsDet.FieldByName('DATAINI').asDateTime+6) then
    if (MsgDlg(fu.CMTranslate('Período Inferior a Uma Semana.') +CR_LF+ fu.CMTranslate('Confirma?'),
               fu.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
    begin
      dbedDatFim.SetFocus;
      exit;
    end;

  if (Trim(dblcHorario.Text) = '') then
  begin
    MsgDlg(fu.CMTranslate('Informe o Horário'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    dblcHorario.SetFocus;
    exit;
  end;

  if (CtrlHorarioVariavel.ExistePeriodoSobreposto) then
  begin
    MsgDlg(fu.CMTranslate('O Período informado sobrepõe outro(s).'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    dbedDatIni.SetFocus;
    exit;
  end;

  inherited;
end;

procedure TfrmCadRegHorarioVariavel.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmCadRegHorarioVariavel.Sel(IDPessoa: double);
begin
  Cds.Data := CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa,
    'P.NOME, F.IDPESSOA, F.IDSITFUNC, F.CODCENTROCUSTO, F.IDCARGO, F.MATRICULA');
  CdsDet.Data := CtrlHorarioVariavel.ListHorarioVariavel(IdPessoa);
end;

function TfrmCadRegHorarioVariavel.GravarRegistro: boolean;
begin
  Result := CtrlHorarioVariavel.GravarHorarioVariavel;
  if not(Result) then
  begin
    dmCds.CmErroDlg.ErrorMesage.Text := CtrlHorarioVariavel.MessageInfo;
    dmCds.CmErroDlg.Execute;
  end;
end;

procedure TfrmCadRegHorarioVariavel.sbtnCriaColetivoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmCadRegHorarioColet, TfrmCadRegHorarioColet, false);
end;

end.
