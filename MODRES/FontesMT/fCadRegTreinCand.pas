unit fCadRegTreinCand;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  FCadastroMestreDetMT, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn,
  TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls, Mask, DBCtrls, CMProcura, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, TREdit, DBClient, uCMClientDataSet, uCtrlCurso, uCtrlCargo,
  uCtrlListTerceirosRH, uCtrlRegTreinCand, uCtrlPessoaCandidato, uCtrlPessoaFuncionario;

type
  TfrmCadRegTreinCand = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedRegistro: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    dbedCargo: TDBEdit;
    dblckCurso: TwwDBLookupCombo;
    Label2: TLabel;
    dblckEntid: TwwDBLookupCombo;
    gbxDatas: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    cmDatReIni: TCMDateTimePicker;
    cmDatReFim: TCMDateTimePicker;
    gbxCarga: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbedDurTeor: TDBEdit;
    dbedDurPrat: TDBEdit;
    dbedDurTot: TDBEdit;
    gbxResult: TGroupBox;
    lblResultado: TLabel;
    imgAprov: TImage;
    imgReprov: TImage;
    dbrgAvalTeor: TDBRadioGroup;
    dbrgAvalPrat: TDBRadioGroup;
    dbedAvTeor: TDBEdit;
    dbedAvPrat: TDBEdit;
    Label3: TLabel;
    dblckInstrutor: TwwDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    CdsDet: TCMClientDataSet;
    CdsCurso: TCMClientDataSet;
    CdsInstrutor: TCMClientDataSet;
    CdsEntid: TCMClientDataSet;
    dsCargo: TwwDataSource;
    CdsCargo: TCMClientDataSet;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbrgAvalTeorChange(Sender: TObject);
    procedure dbrgAvalPratChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure dblckCursoChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbedAvTeorChange(Sender: TObject);
  private
    CtrlCurso: TCtrlCurso;
    CtrlRegTreinCand: TCtrlRegTreinCand;
    CtrlPessoaCandidato: TCtrlPessoaCandidato;
    CtrlCargo: TCtrlCargo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    procedure Sel(SelPrincipal: boolean; IdPessoa: double);
    procedure MudaResultado;
    function  GravarRegistro: boolean;
  end;

var
  frmCadRegTreinCand: TfrmCadRegTreinCand;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, CorreioCM;

{$R *.DFM}

procedure TfrmCadRegTreinCand.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlRegTreinCand := TCtrlRegTreinCand.Create;
  CtrlRegTreinCand.InitializeAs(Padroes);
  CtrlRegTreinCand.CdsHstTrn := CdsDet;

  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CdsCurso.Data := CtrlCurso.ListGeral;
  CdsEntid.Data := CtrlPessoaFuncionario.ListFuncionario_e_Terceiros;
  CdsInstrutor.Data := CtrlListTerceirosRH.ListPessoaTerceiro('F');

  Sel(true, -1);

  lblResultado.Caption := '';
end;

procedure TfrmCadRegTreinCand.FormShow(Sender: TObject);
begin
  inherited;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    sbtnProcurar.Visible := false;
    sbtnAlterar.Enabled := false;
  end;
end;

procedure TfrmCadRegTreinCand.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlRegTreinCand);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlPessoaCandidato);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFuncionario);
  inherited;
end;

procedure TfrmCadRegTreinCand.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor)  then
    Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRegTreinCand.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESSOA').asFloat := Cds.FieldByName('IDPESSOA').asFloat;
  CdsDet.FieldByName('FLGCONTROLE').asInteger := 0;
  CdsDet.FieldByName('FLGAVALCURS').asInteger := 0;
  CdsDet.FieldByName('FLGAVALTEOR').asInteger := 0;
  CdsDet.FieldByName('FLGAVALPRAT').asInteger := 0;
end;

procedure TfrmCadRegTreinCand.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRegTreinCand.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRegTreinCand.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    MudaResultado;
    dblckCurso.SetFocus;
  end;
end;

procedure TfrmCadRegTreinCand.dblckCursoChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert,dsEdit]) then
  begin
    CdsDet.FieldByName('IDENTIDINSTR').asFloat := CdsCurso.FieldByName('IDENTIDINSTR').asFloat;
    CdsDet.FieldByName('FLGAVALTEOR').asInteger := CdsCurso.FieldByName('TEMAVAL').asInteger;
    CdsDet.FieldByName('FLGAVALPRAT').asInteger := CdsCurso.FieldByName('TEMAVPR').asInteger;
    CdsDet.FieldByName('DUR_PRAT').asInteger := CdsCurso.FieldByName('DUR_PRAT').asInteger;
    CdsDet.FieldByName('DUR_TEOR').asInteger := CdsCurso.FieldByName('DUR_TEOR').asInteger;
    CdsDet.FieldByName('VALOR').asFloat := CdsCurso.FieldByName('VALOR').asFloat;
  end;
end;

procedure TfrmCadRegTreinCand.dbrgAvalTeorChange(Sender: TObject);
begin
  dbedAvTeor.Visible := (dbrgAvalTeor.ItemIndex = 0);
  MudaResultado;
end;

procedure TfrmCadRegTreinCand.dbrgAvalPratChange(Sender: TObject);
begin
  dbedAvPrat.Visible := (dbrgAvalPrat.ItemIndex = 0);
  MudaResultado;
end;

procedure TfrmCadRegTreinCand.dbedAvTeorChange(Sender: TObject);
begin
  MudaResultado;
end;

procedure TfrmCadRegTreinCand.bbtnOkDetClick(Sender: TObject);
var
  c: byte;
  iNumSeq: integer;
  ValorCampo: array of variant;
begin
  if (Trim(dblckCurso.Text) = '') then
  begin
    MsgDlg('Digite o Curso.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckCurso.SetFocus;
  end
  else
  begin
    if (CdsDet.State = dsInsert) then
    begin
      CdsDet.DisableControls;

      // Guardo os campos do registro
      SetLength(ValorCampo, CdsDet.FieldCount);
      for c:=0 to CdsDet.FieldCount-1 do
        ValorCampo[c] := CdsDet.Fields[c].Value;

      // Pego o próximo número de sequência
      CdsDet.Cancel;
      iNumSeq := CtrlRegTreinCand.ProximoNumSeq(CdsDet.FieldByName('IDPESSOA').asFloat,
        CdsDet.FieldByName('IDCURSO').asFloat);

      // Recupero os campos do registro
      CdsDet.Insert;
      for c:=0 to CdsDet.FieldCount-1 do
        CdsDet.Fields[c].Value := ValorCampo[c];

      CdsDet.FieldByName('NUMSEQ').asInteger := iNumSeq;        
      CdsDet.EnableControls;
    end;

    CdsDet.FieldByName('DESCRICAO').asString := Trim(dblckCurso.Text);
    
    if (CdsDet.FieldByName('DUR_TEOR').IsNull) then
      CdsDet.FieldByName('DUR_TEOR').asInteger := 0;

    if (CdsDet.FieldByName('DUR_PRAT').IsNull) then
      CdsDet.FieldByName('DUR_PRAT').asInteger := 0;

    CdsDet.FieldByName('DUR_TOT').asInteger := CdsDet.FieldByName('DUR_TEOR').asInteger +
      CdsDet.FieldByName('DUR_PRAT').asInteger;
    inherited;
  end;
end;

procedure TfrmCadRegTreinCand.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(false, StrToFloat(MontaSelect.ValoresChave[0]));
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRegTreinCand.Sel(SelPrincipal: boolean; IdPessoa: double);
begin
  if (SelPrincipal) then
  begin
    Cds.Data := CtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa);
    if (Cds.IsEmpty) then
      CdsCargo.Data := CtrlCargo.ListCargo(-1)
    else
      CdsCargo.Data := CtrlCargo.ListCargo(Cds.FieldByName('IDCARGO').asFloat);
  end;
  CdsDet.Data := CtrlRegTreinCand.ListHistorico(IdPessoa);
end;

function TfrmCadRegTreinCand.GravarRegistro: boolean;
begin
  Result := CtrlRegTreinCand.GravarRegTreinCand;
  if not(Result) then
    raise Exception.Create(CtrlRegTreinCand.MessageInfo);
end;

procedure TfrmCadRegTreinCand.MudaResultado;
begin
  lblResultado.Visible := false;
  imgAprov.Visible := false;
  imgReprov.Visible := false;

  if ((CdsCurso.FieldByName('TEMAVAL').asInteger = 1) and (dbrgAvalTeor.ItemIndex = 0) or
      (CdsCurso.FieldByName('TEMAVPR').asInteger = 1) and (dbrgAvalPrat.ItemIndex = 0)) then
  begin
    if ((CdsCurso.FieldByName('TEMAVAL').asInteger = 1) and (dbrgAvalTeor.ItemIndex = 0) and
        (CdsCurso.FieldByName('AVALIACAO').asInteger > StrToIntDef(dbedAvTeor.Text,0))) or
       ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1) and (dbrgAvalPrat.ItemIndex = 0) and
        (CdsCurso.FieldByName('AVALPRAT').asInteger > StrToIntDef(dbedAvPrat.Text,0))) then
    begin
      lblResultado.Caption := 'REPROVAD';
      lblResultado.Font.Color := clRed;
      imgReprov.Visible := true;
    end
    else
    begin
      lblResultado.Caption := 'APROVAD';
      lblResultado.Font.Color := clBlue;
      imgAprov.Visible := true;
    end;
    lblResultado.Caption := lblResultado.Caption + 'O';
    lblResultado.Visible := true;
  end;

  dbedAvTeor.Visible := (dbrgAvalTeor.ItemIndex = 0);
  dbedAvPrat.Visible := (dbrgAvalPrat.ItemIndex = 0);
end;

end.
