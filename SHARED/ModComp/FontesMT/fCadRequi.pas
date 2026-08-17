// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : SOL 137265 KINTANA 829773
//Responsável : RODRIGO DE BRITO FIGUEREDO
//Data        : 18/09/2012
//Descrição   : Reestruturação do preenchimento de Competências e de
//              Características do Perfil na Solicitação de Pessoal
//------------------------------------------------------------------------------


unit fCadRequi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, CmEventosCadastro,
  ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, MAHlpBtn, Buttons,
  TB97Tlbr, StdCtrls, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  ExtCtrls, CMProcuraSubTipo, wwdbedit, wwdblook, DBCtrls, wwdbdatetimepicker, Mask, DBClient,
  CMDateTimePicker, uCMClientDataSet, fcLabel, fCadastroMestreDetMT, uCtrlFuncoesRH,
  uCtrlPessoaFuncionario, uCtrlPessoaFilialPessoa, uCtrlListTerceirosRH, uCtrlCargo,
  uCtrlGrInstr, uCtrlReqPessoal, uCtrlMotivo, uCmSqlParams, TREdit,
  CheckLst, Wwdotdot, Wwdbcomb, uCtrlHoraTrab;

type
  TfrmCadRequi = class(TFrmCadastroMestreDetMT)
    tbsDadosGerais: TTabSheet;
    tbsObserv: TTabSheet;
    Label9: TLabel;
    dbmObser: TDBMemo;
    Label4: TLabel;
    MontaSelectCand: TMontaSelect;
    sbtnProcCand: TToolbarButton97;
    dbedNomeCand: TwwDBEdit;
    dbedCargoCand: TwwDBEdit;
    dbrgAprovado: TDBRadioGroup;
    sbtnProcFunc: TToolbarButton97;
    MontaSelectFunc: TMontaSelect;
    CdsEstab: TCMClientDataSet;
    CdsLotacao: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsGrauInstr: TCMClientDataSet;
    sbtnCand: TToolbarButton97;
    CdsDet: TCMClientDataSet;
    fcLabel1: TfcLabel;
    Label1: TLabel;
    dbedNumero: TDBEdit;
    Label2: TLabel;
    dbedData: TCMDateTimePicker;
    Label3: TLabel;
    dbedDataPlan: TCMDateTimePicker;
    dbrgTipo: TDBRadioGroup;
    dbrgTipAmpl: TDBRadioGroup;
    dbrgSituacao: TDBRadioGroup;
    imgAber: TImage;
    imgEncer: TImage;
    imgCancel: TImage;
    Toolbar972: TToolbar97;
    sbtnImprimirReq: TSpeedButton;
    Bevel1: TBevel;
    Label10: TLabel;
    dblckCargo: TwwDBLookupCombo;
    dbrgSexo: TDBRadioGroup;
    Label12: TLabel;
    dblckGrauInstr: TwwDBLookupCombo;
    dbrgTipContra: TDBRadioGroup;
    Label13: TLabel;
    dblckEstab: TwwDBLookupCombo;
    CMProcuraSubst: TCMProcuraSubTipo;
    Label16: TLabel;
    edCodCCusto: TEdit;
    dblckLotacao: TwwDBLookupCombo;
    CMProcuraNovo: TCMProcuraSubTipo;
    Label6: TLabel;
    CdsMotivo: TCMClientDataSet;
    dblcMotivo: TwwDBLookupCombo;
    tbshGestores: TTabSheet;
    CdsAnalista: TCMClientDataSet;
    sqlAnalista: TCMSqlParams;
    Label7: TLabel;
    dblcAnalista: TwwDBLookupCombo;
    Label8: TLabel;
    edSupervisor: TDBEdit;
    sqlSupervisor: TCMSqlParams;
    CdsSupervisor: TCMClientDataSet;
    Label11: TLabel;
    edGestores: TwwDBEdit;
    sqlGestores: TCMSqlParams;
    CdsGestores: TCMClientDataSet;
    Label14: TLabel;
    dbedSalario: TDBRealEdit;
    sbtnCopiarReq: TSpeedButton;
    tbsObserv2: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    dbmObserv2: TwwDBEdit;
    dbmObserv3: TDBMemo;
    dbmObser4: TDBMemo;
    Label15: TLabel;
    dbmObserv5: TDBMemo;
    ClbCaracPessoais: TCheckListBox;
    Label5: TLabel;
    CdsCarac: TCMClientDataSet;
    Label19: TLabel;
    dbmCursos: TDBMemo;
    Label21: TLabel;
    Label22: TLabel;
    dblckHoraTrab: TwwDBLookupCombo;
    Label23: TLabel;
    dbrgFormaSelecao: TDBRadioGroup;
    dbedDataAdmissao: TCMDateTimePicker;
    Label24: TLabel;
    dbeVagas: TDBEdit;
    dbcbTempoExp: TwwDBComboBox;
    CdsHrTrab: TCMClientDataSet;
    dbmMotAmpli: TDBMemo;
    Label20: TLabel;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbrgTipoChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure dbrgSituacaoChange(Sender: TObject);
    procedure sbtnProcCandClick(Sender: TObject);
    procedure dblckLotacaoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnImprimirReqClick(Sender: TObject);
    procedure sbtnCandClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure sbtnProcFuncClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CdsBeforePost(DataSet: TDataSet);
    procedure edCodCCustoChange(Sender: TObject);
    procedure sbtnCopiarReqClick(Sender: TObject);
    procedure CMProcuraNovoExit(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
 procedure dbeVagasKeyPress(Sender: TObject; var Key: Char);
  private
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlCargo: TCtrlCargo;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlReqPessoal: TCtrlReqPessoal;
    CtrlMotivo: TCtrlMotivo;
    CtrlHoraTrab:TCtrlHoraTrab; // Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547

    dNumReq: double;
    IdTipoProcesso: Longint;
    sUsuXCCustoLocal, sUsuXFilialLocal: string;

    CaracCount : Integer; //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773
    FslCaracPessoais: TStringList;

    procedure HabilitarBtCandidato;
    procedure HabilitarImprimirReq;
    procedure Sel(SelPrincipal: boolean; NumReq: double);
    function  GravarRegistro(Op: TOperacaoDataSet): boolean;
    //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
    function  CountCaracPessoais: Integer;
    Procedure SetTempCDS_Requipesxcaracpessoais(ANumReq : Double);
    //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim
  end;

var
  frmCadRequi: TfrmCadRequi;

implementation

uses uCMTypes, uMensErro, uSistema, uModulo, uRAD, uCtrlPadroes, RReqPessoal, fCadCand,
  fCadFunc, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmCadRequi.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlReqPessoal := TCtrlReqPessoal.Create(Sistema.UsaRAD, Sistema.IdEmpresa);
  CtrlReqPessoal.InitializeAs(Padroes);
  CtrlReqPessoal.CdsReqPessoal := Cds;
  CtrlReqPessoal.CdsReqCandidato := CdsDet;
  CtrlReqPessoal.CdsRequipesxcaracpessoais := CdsCarac;//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);
  //Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547 - Fim
  CtrlHoraTrab :=TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);
  CtrlHoraTrab.CdsHoraTrab := CdsHrTrab;
  //Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547 - Fim

  if (Sistema.IdModulo = 417) then
    HelpContext := 4170010;

  sUsuXCCustoLocal := CtrlUsoGeralRH.UsuXCCusto;
  sUsuXFilialLocal := CtrlUsoGeralRH.UsuXFilial;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    dmCds.Cds.Data :=
      CtrlPessoaFuncionario.ListFuncionario(CtrlUsoGeralRH.IdUsuarioGeral);

    if not(dmCds.Cds.IsEmpty) then
    begin
      sUsuXCCustoLocal := '(' +
        QuotedStr(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString) +')';
      sUsuXFilialLocal := '(' +dmCds.Cds.FieldByName('IDESTAB').asString +')';
    end;
  end;

  if (sUsuXCCustoLocal <> '') then
    MontaSelect.Filtro.Add('R.CODCENTROCUSTO IN ' + sUsuXCCustoLocal);

  if (sUsuXFilialLocal <> '') then
    MontaSelect.Filtro.Add('R.IDESTAB IN ' + sUsuXFilialLocal);

  with (MontaSelectFunc.Filtro) do
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

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  if (Sistema.UsaRAD) then
    IdTipoProcesso := CtrlListTerceirosRH.GetIdTipoProcesso(Sistema.IdUsuario, 14)
  else
    IdTipoProcesso := -1;

  FslCaracPessoais := TStringList.Create; //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773

  CdsEstab.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(Sistema.IdEmpresa);
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  CdsCargo.Data := CtrlCargo.ListCargo;
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D,A');
  Sel(true, -1);

  if (Modulo.IdContraCheque = FUNCEF) then
    dbrgTipContra.Caption := 'Objetivo da Contratação';

    with (sqlAnalista.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT P.IDPESSOA, P.NOME');
      Add('FROM   PESSOA P, USUARIOSISTEMA U, FUNCIONARIO FU, AUTORIZA A, OPERFUNC O, FUNCAO F');
      Add('WHERE  (F.IDMODULO    = 73) AND');
      Add('       (A.IDOPERFUNC  = O.IDOPERFUNC) AND');
      Add('       (O.IDFUNCAO    = F.IDFUNCAO) AND');
      Add('       (F.NOMEFUNCAO  LIKE ''Usu%rio RH'') AND');
      Add('       (A.IDESPACESSO = U.IDESPACESSO) AND');
      Add('       (U.IDUSUARIO   = P.IDPESSOA) AND');
      Add('       (U.IDUSUARIO   = FU.IDPESSOA)');
      Add('ORDER BY UPPER(P.NOME)');
    end;

    sqlAnalista.Open;

end;

procedure TfrmCadRequi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlGrInstr);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlReqPessoal);
  FreeAndNil(CtrlHoraTrab);//Rodrigo de Brito figueredo SOL 183027 Kintana 1720547

  inherited;
end;

procedure TfrmCadRequi.CdsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (Cds.FieldByName('CODCENTROCUSTO').asString = '') then
    Cds.FieldByName('IDEMPRESA').Clear
  else
    Cds.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;

  Cds.FieldByName('MOTIVOAMPLIACAO').asString := Cds.FieldByName('MOTIVOAMPLIACAO').asString;
end;

procedure TfrmCadRequi.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    dNumReq := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true, dNumReq);
  end;
end;

procedure TfrmCadRequi.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('DATAREQ').asDateTime := Date;
  Cds.FieldByName('SITUACAO').asString := 'A';
  Cds.FieldByName('TIPOREQ').asInteger := 1;
  Cds.FieldByName('TIPOAMPL').asInteger := 1;
  Cds.FieldByName('IDGRINSTR').asInteger := 0; //Rodrigo de Brito figueredo SOL 183027 Kintana 1720547
  dbrgTipAmpl.Enabled := true;
  CMProcuraSubst.Enabled := false;
  dblcMotivo.Enabled := false;
  Sel(false, -1);
end;

procedure TfrmCadRequi.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbrgAprovado.ItemIndex := 1;
end;

procedure TfrmCadRequi.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRequi.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(toInserir);
end;

procedure TfrmCadRequi.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(toAlterar);
end;

procedure TfrmCadRequi.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(toExcluir);
end;

procedure TfrmCadRequi.dsDetStateChange(Sender: TObject);
begin
  inherited;
  HabilitarBtCandidato;
end;

procedure TfrmCadRequi.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  HabilitarBtCandidato;
end;

procedure TfrmCadRequi.dbrgTipoChange(Sender: TObject);
begin
  CMProcuraSubst.Enabled := (dbrgTipo.ItemIndex = 1);
  dblcMotivo.Enabled := (dbrgTipo.ItemIndex = 1);
  dbrgTipAmpl.Enabled := (dbrgTipo.ItemIndex = 0);
  dbmMotAmpli.Enabled := (dbrgTipo.ItemIndex = 0);// Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547
end;

procedure TfrmCadRequi.dbrgSituacaoChange(Sender: TObject);
begin
  imgAber.Visible := (dbrgSituacao.ItemIndex = 0);
  imgEncer.Visible := (dbrgSituacao.ItemIndex = 1);
  imgCancel.Visible := (dbrgSituacao.ItemIndex = 2);

  if (Cds.State in [dsInsert,dsEdit]) then
  begin
    CMProcuraNovo.PermiteChaveEmBranco := false;
    if (dbrgSituacao.ItemIndex = 1) and (CMProcuraNovo.Valida <> vcOK) then
    begin
      MsgDlg('Para Encerrar, Informe Novo Ocupante.', 'Confirmação',
        mtInformation, [mbOk, mbHelp], 0);
      dbrgSituacao.ItemIndex := 0;
    end;
    CMProcuraNovo.PermiteChaveEmBranco := true;
  end;
end;

procedure TfrmCadRequi.dblckLotacaoChange(Sender: TObject);
begin
  if (dblckLotacao.Text <> '') then
  begin
    //CdsLotacao.Locate('CODCENTROCUSTO', dblckLotacao.Text, []); PARECE ERRADO 03/07/03
    // ALTEREI PARA ESTA (EUGENIO)
    CdsLotacao.Locate('NOME', dblckLotacao.Text, []);
    edCodCCusto.Text := CdsLotacao.FieldByName('CODCENTROCUSTO').asString;
  end
  else
    edCodCCusto.Text := '';
end;

procedure TfrmCadRequi.sbtnProcCandClick(Sender: TObject);
begin
  MontaSelectCand.Executar;
  if (MontaSelectCand.RetornouValor) then
  begin
    CdsDet.FieldByName('IDPESSOA').asString := MontaSelectCand.ValoresChave[0];
    CdsDet.FieldByName('NOME').asString := MontaSelectCand.ValoresChave[1];
    CdsDet.FieldByName('TITULO').asString := MontaSelectCand.ValoresChave[2];
    CdsDet.FieldByName('TIPOCAND').asString := 'Externo';
  end;
  sbtnProcCand.Down := false;
end;

procedure TfrmCadRequi.sbtnProcFuncClick(Sender: TObject);
begin
  MontaSelectFunc.Executar;
  if (MontaSelectFunc.RetornouValor) then
  begin
    CdsDet.FieldByName('IDPESSOA').asString := MontaSelectFunc.ValoresChave[0];
    CdsDet.FieldByName('NOME').asString := MontaSelectFunc.ValoresChave[1];
    CdsDet.FieldByName('TITULO').asString := MontaSelectFunc.ValoresChave[2];
    CdsDet.FieldByName('TIPOCAND').asString := 'Interno';
  end;
  sbtnProcFunc.Down := false;
end;

procedure TfrmCadRequi.sbtnAlterarClick(Sender: TObject);
var
  bReabre: boolean;
begin
  if (Cds.FieldByName('SITUACAO').asString = 'E') then
  begin
    sbtnAlterar.Down := false;
    MsgDlg('Requisição Já Encerrada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    exit;
  end;

  bReabre := false;
  if (Cds.FieldByName('SITUACAO').asString = 'C') then
  begin
    if MsgDlg('Requisição Cancelada.'+CR_LF+'Deseja Reabrir?', 'Confirmação',
              mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo then
    begin
      sbtnAlterar.Down := false;
      exit;
    end
    else
      bReabre := true;
  end;
  inherited;
  if (bReabre) then
    dbrgSituacao.ItemIndex := 0;
end;

procedure TfrmCadRequi.sbtnImprimirReqClick(Sender: TObject);
begin
  with TRptReqPessoal.Create(Application) do
  begin
    NumRequisicao := dbedNumero.Text;
    NomeCurso := dblckLotacao.Text;
    NomeCargo := dblckCargo.Text;

    if (dbrgSexo.ItemIndex = -1) then
      Sexo := ' '
    else
      Sexo := dbrgSexo.Items[dbrgSexo.ItemIndex];

    NomeNovoOcupante := CMProcuraNovo.Text;
    NomeSubstituido  := CMProcuraSubst.Text;
//Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Inicio
    if (dbrgTipo.ItemIndex=0) then
      begin
       Justificativa:= ' MOTIVOAMPLIACAO AS JUSTIFICATIVA,';
      end
    else
      begin
       Justificativa:= QuotedStr(Trim(dblcMotivo.text + ' '))+' AS JUSTIFICATIVA,';
      end;
    //Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Fim

    NomeResponsavel  := dblcAnalista.Text;
    NomeSupervisor   := edSupervisor.Text;
//Rodrigo de Brito Figuered o SOL 183027 KINTANA 1720547 - Inicio
    TempoExperiencia :=dbcbTempoExp.Text + ' ';
    HorarioTrab      :=dblckHoraTrab.Text + ' ';
    //Rodrigo de Brito Figueredo SOL 183027 KINTANA 1720547 - Fim


    CrmRptCMBeforePrint(Sender);
    CrmRptCM.IdReports := 3830;
    CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    CrmRptCM.OrigemCM := 1;
    CrmRptCM.IdModulo := Sistema.IdModulo;
    CrmRptCM.IdUsuario := Sistema.IdUsuario;
    CrmRptCM.Print;
    Free;
  end;
end;

procedure TfrmCadRequi.sbtnCandClick(Sender: TObject);
begin
  if (CdsDet.FieldByName('TIPOCAND').asString = 'Externo') then
  begin
    frmCadCand := TfrmCadCand.Create(Self);

//  frmCadCand.PessoaChangeSubtipo(CdsDet.FieldByName('IDPESSOA').asInteger);
    frmCadCand.SelCandidato(CdsDet.FieldByName('IDPESSOA').asFloat);
    frmCadCand.sbtnAlterar.Enabled := true;
    frmCadCand.sbtnApagar.Enabled := true;
  end
  else
  begin
    frmCadFunc := TfrmCadFunc.Create(Self);
    frmCadFunc.SelFuncionario(CdsDet.FieldByName('IDPESSOA').asInteger);
    frmCadFunc.Dock972.Visible := false;
  end;
end;

procedure TfrmCadRequi.bbtnConfirmarClick(Sender: TObject);
var
  sFlgOk: string;
  bInserindo: boolean;
begin
//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio

  // Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547 - Inicio

  //Se o "Tipo"(radiogroup) marcado for "Ampliação" necessariamente o campo
  //"Motivo Ampliação" deve estar preenchido
  if ( ( dbrgTipo.ItemIndex = 0 ) and ( Trim ( dbmMotAmpli.Text ) = '') ) then
  begin
      MsgDlg('Favor preencher o campo motivo da ampliação.','Informação', mtInformation,[mbOk],0);
      dbrgTipoChange(nil);
      dbmMotAmpli.SetFocus;
      exit;
  end;

  //Se o "Grau de Instrução" for Superior Incompleto, Superior Completo, Mestrado,
  //Doutorado ou Especialização Necessariamente o campo "Curso(s)" deve ser preenchido
  if ( Cds.FieldByName('idgrinstr').AsInteger in [8, 9, 10, 11, 12] ) and
     ( Trim(dbmCursos.Text) = '') then
  begin
      MsgDlg('Favor preencher o campo Curso(s).','Informação', mtInformation,[mbOk, mbHelp],0);
      pgctrlDetalhe.ActivePage:=tbsDadosGerais;
      dbmCursos.SetFocus;
      exit;
  end;
  // Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547 - Fim

  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
    CaracCount:=CountCaracPessoais;//variavel que recebe da função "CountCaracPessoais"
                                //numero de carcateristicas que foram marcadas.

  //Verifica se foram marcadas entre 3 e 7 inclusive caracteristicas pessoais conforme RN006
  if not((CaracCount >=3) and (CaracCount <=7)) then
  begin
     MsgDlg('Deverão ser escolhidas de 03 a 07 características, foram escolhidas '+intToStr(CaracCount)+' opções. Por favor verificar!','Informação', mtInformation,[mbOk, mbHelp],0);
     pgctrlDetalhe.ActivePage:= tbsObserv;
     exit;
  end;
  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim

  if (Cds.FieldByName('IDPROCESSO').asInteger > 0) and (CMProcuraNovo.Text <> '') and
     (Cds.FieldByName('IDNOVOOCUP').OldValue = Null) then
  begin
    sFlgOk := CtrlListTerceirosRH.GetFlgOk_RAD(Cds.FieldByName('IDPROCESSO').asFloat);
    if (Trim(sFlgOk) = '') then
      sFlgOk := 'S';

    if (sFlgOk <> 'S') then
    begin
      MsgDlg('Processo não está concluído.'+CR_LF+
             'Não pode ser encerrada a Requisição com novo ocupante.',
             'Informação', mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
  end;

  // Não pode ter mais de um aprovado
  if (CtrlReqPessoal.GetNumAprovados > 1) then
  begin
    MsgDlg('Não pode haver mais de uma pessoa aprovada.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    CtrlReqPessoal.ReprovarTodos;
    exit;
  end;

  //bInserindo := (Cds.State = dsInsert);
  //inherited;

  bInserindo := (Cds.State = dsInsert);

  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
  SetTempCDS_Requipesxcaracpessoais(dNumReq);
  inherited;
  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim

  if not(bInserindo) then
    CmeCadastroFind(Sender);
    //Sel(false, dNumReq);
end;

procedure TfrmCadRequi.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  HabilitarImprimirReq;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRequi.HabilitarBtCandidato;
begin
  sbtnCand.Enabled := (tbcDetalhe.TabIndex = 2) and not(CdsDet.IsEmpty);
end;

procedure TfrmCadRequi.HabilitarImprimirReq;
begin
  sbtnImprimirReq.Enabled := (Trim(dbedNumero.Text) <> '');
  sbtnCopiarReq.Enabled := (Trim(dbedNumero.Text) <> '');
end;

function TfrmCadRequi.GravarRegistro(Op: TOperacaoDataSet): boolean;
begin
  Result := false;
  case (Op) of
    toInserir, toAlterar :
      Result := (CtrlReqPessoal.GravarRequisicao(IdTipoProcesso, dblckLotacao.LookupValue,
        dblckCargo.Text, CMProcuraSubst.Text, dblckLotacao.Text));
    toExcluir : Result := (CtrlReqPessoal.ExcluirRequisicao);
  end;

  if not(Result) then
    raise Exception.Create(CtrlReqPessoal.MessageInfo)
  else
  if (CtrlReqPessoal.MessageInfo <> '') then
    MsgDlg(CtrlReqPessoal.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0);
end;

procedure TfrmCadRequi.Sel(SelPrincipal: boolean; NumReq: double);
var
  CdsAux: TCMClientDataSet;
begin
  dNumReq := NumReq;
  if (SelPrincipal) then
    Cds.Data := CtrlReqPessoal.ListRequisicao(NumReq);
  CdsDet.Data := CtrlReqPessoal.ListCandidatosRequisicao(NumReq);
  HabilitarBtCandidato;
  HabilitarImprimirReq;

  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
  CdsCarac.Data:= CtrlReqPessoal.ListCaracteristicasPessoais(NumReq, False);
  ClbCaracPessoais.Clear;
  FslCaracPessoais.Clear;
  CdsAux := TCMClientDataSet.Create(nil);
  try
    CdsAux.Data:= CtrlReqPessoal.ListCaracteristicasPessoais(dNumReq, True);
    CdsAux.First;
    while not CdsAux.Eof do
    begin
      FslCaracPessoais.Add(CdsAux.FieldbyName('IDCARACPESSOAIS').AsString);
      ClbCaracPessoais.Items.Add(CdsAux.FieldbyName('DESCRICAO').AsString);
      ClbCaracPessoais.Checked[ClbCaracPessoais.Items.Count-1] := (CdsAux.FieldByName('NUMREQ').AsString <> '');
      CdsAux.Next;
    end;
    CdsAux.Close;
  finally
    FreeAndNil(CdsAux);
  end;

  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim
  CdsHrTrab.Data := CtrlHoraTrab.ListHoraTrab; //Rodrigo de Brito Figueredo Sol 183027 Kintana 1720547

end;

procedure TfrmCadRequi.edCodCCustoChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with (sqlSupervisor.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('     P.NOME');
    Add('FROM');
    Add('     PESSOA P, USCCUSTORH U');
    Add('WHERE');
    Add('    (U.FLGSUPERVISOR  = 1) AND');
    Add('    (U.IDUSUARIO      = P.IDPESSOA) AND');
    Add('    (U.CODCENTROCUSTO = ' + QuotedStr(edCodCCusto.Text) + ')');
    Add('ORDER BY UPPER(P.NOME)');
  end;
  sqlSupervisor.Open;
  edSupervisor.Text := CdsSupervisor.FieldByName('NOME').AsString;

  with (sqlGestores.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('     P.NOME');
    Add('FROM');
    Add('     PESSOA P, USCCUSTORH U');
    Add('WHERE');
    Add('    (U.FLGSUPERVISOR  = 0) AND');
    Add('    (U.IDUSUARIO      = P.IDPESSOA) AND');
    Add('    (U.CODCENTROCUSTO = ' + QuotedStr(edCodCCusto.Text) + ')');
    Add('ORDER BY UPPER(P.NOME)');
  end;
  sqlGestores.Open;
  edGestores.Text := '';
  i := 0;
  while not(CdsGestores.EOF) do
  begin
    inc(i);
    if i > 1 then
       edGestores.Text := edGestores.Text + ', ' + CR_LF;
    edGestores.Text := edGestores.Text + CdsGestores.FieldByName('NOME').asString;
    CdsGestores.Next;
  end;
end;

procedure TfrmCadRequi.sbtnCopiarReqClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Deseja Fazer Uma Cópia Desta Requisição?', 'Confirmação',
            mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo then
    exit;

  if (CtrlReqPessoal.CopiarRequisicao(IdTipoProcesso, dblckLotacao.LookupValue,
        dblckCargo.Text, CMProcuraSubst.Text, dblckLotacao.Text)) then
    MsgDlg(CtrlReqPessoal.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0)
  else
    raise Exception.Create(CtrlReqPessoal.MessageInfo);
  CtrlReqPessoal.MessageInfo := '';
end;

procedure TfrmCadRequi.CMProcuraNovoExit(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert,dsEdit]) and
     (CMProcuraNovo.Valida = vcOK) and
     (dbrgSituacao.ItemIndex = 0) then
      dbrgSituacao.ItemIndex := 1;
end;

procedure TfrmCadRequi.dsStateChange(Sender: TObject);
begin
  inherited;
  sbtnImprimirReq.Enabled := (Trim(dbedNumero.Text) <> '') and (ds.State = dsBrowse);
  sbtnCopiarReq.Enabled := (Trim(dbedNumero.Text) <> '') and (ds.State = dsBrowse);
  ClbCaracPessoais.Enabled := (ds.State in [dsInsert,dsEdit]); //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773
end;

procedure TfrmCadRequi.sbtnApagarClick(Sender: TObject);
var
    I : Integer; //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773
begin
  inherited;
  sbtnImprimirReq.Enabled := (Trim(dbedNumero.Text) <> '') and (ds.State = dsBrowse);
  sbtnCopiarReq.Enabled := (Trim(dbedNumero.Text) <> '') and (ds.State = dsBrowse);
  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
  for I:=0 to ClbCaracPessoais.Items.Count-1 do
      ClbCaracPessoais.Checked[I] :=false;
  //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim

end;

//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
procedure TfrmCadRequi.SetTempCDS_Requipesxcaracpessoais(ANumReq: Double);
Var
  I          : integer;
  cdsCaracAux: TCMClientDataSet;
begin
    cdsCarac.Filter := 'IDCARACPESSOAIS=-1';
    cdsCarac.Filtered := True;
    For I := 0 to ClbCaracPessoais.Items.Count - 1 do
    begin
      cdsCarac.Filter := 'IDCARACPESSOAIS=' + FslCaracPessoais.Strings[i];
      cdsCarac.First;
      if (ClbCaracPessoais.Checked[I]) and (cdsCarac.RecordCount = 0) then
      begin
        CdsCarac.Insert;
        CdsCarac.FieldByName('IDCARACPESSOAIS').AsFloat := StrToFloat(FslCaracPessoais.Strings[i]);
        CdsCarac.Post;
      end else
      if (not ClbCaracPessoais.Checked[I]) and (cdsCarac.RecordCount <> 0) then
      begin
        CdsCarac.Delete;
      end;
    end;
    cdsCarac.Filtered := False;
end;
//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim
procedure TfrmCadRequi.dbeVagasKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547 - Inicio
  //Fazendo com que o campo"Numero de vagas" aceite somente numeros
  if not (key in ['0'..'9',#8]) then
   key:=#0;
  // Rodrigo de Brito Figueredo SOL 183027 Kintana 1720547 - Fim
end;
//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Inicio
//Função para contar quantas caracteristicas pessoais foram marcadas
function TfrmCadRequi.CountCaracPessoais: Integer;
 var
  I,Caraccount :Integer;
begin
   Caraccount:=0;
   For I := 0 to ClbCaracPessoais.Items.Count - 1 do
   begin
       if( ClbCaracPessoais.Checked[I]) then
       begin
          Caraccount:=Caraccount+1;
       end;
   end;
   result:=Caraccount;
end;
//Rodrigo de Brito Figueredo Sol 137265 Kintana 829773 - Fim
procedure TfrmCadRequi.FormDestroy(Sender: TObject);
begin
  inherited;
  FslCaracPessoais.Free; //Rodrigo de Brito Figueredo Sol 137265 Kintana 829773
end;

end.
