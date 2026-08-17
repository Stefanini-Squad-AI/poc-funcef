unit fLancaHoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Mask, wwdbedit, Db, DBTables, TREdit,
  wwdblook, Spin, TB97Tlbr, IvDictio, IvMulti, DBClient, DBCtrls, ComCtrls, uCMClientDataSet,
   uCtrlLancaHoras, uCtrlParamRH, uCtrlBancoHoras, IniFiles, uCtrlGlobalRH,
  IvEMulti;

type
  TfrmLancaHoras = class(TfrmSairAjuda)
    CdsRub1: TCMClientDataSet;
    CdsRub2: TCMClientDataSet;
    CdsRub4: TCMClientDataSet;
    CdsRub5: TCMClientDataSet;
    CdsRub3: TCMClientDataSet;
    CdsRub6: TCMClientDataSet;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsRub7: TCMClientDataSet;
    CdsRub8: TCMClientDataSet;
    bbtnRubrica: TBitBtn;
    CdsBancoHoras: TCMClientDataSet;
    edNome: TEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    Label5: TLabel;
    dblckRub1: TwwDBLookupCombo;
    redRub1: TRealEdit;
    Label4: TLabel;
    Label1: TLabel;
    dblckRub2: TwwDBLookupCombo;
    redRub2: TRealEdit;
    Label6: TLabel;
    Label2: TLabel;
    dblckRub3: TwwDBLookupCombo;
    redRub3: TRealEdit;
    Label7: TLabel;
    Label3: TLabel;
    dblckRub4: TwwDBLookupCombo;
    redRub4: TRealEdit;
    Label8: TLabel;
    Label9: TLabel;
    dblckRub5: TwwDBLookupCombo;
    redRub5: TRealEdit;
    Label10: TLabel;
    Label11: TLabel;
    dblckRub6: TwwDBLookupCombo;
    redRub6: TRealEdit;
    Label12: TLabel;
    Label13: TLabel;
    dblckRub7: TwwDBLookupCombo;
    redRub7: TRealEdit;
    Label15: TLabel;
    Label14: TLabel;
    dblckRub8: TwwDBLookupCombo;
    redRub8: TRealEdit;
    Label16: TLabel;
    gbxBancoHoras3: TGroupBox;
    pgbrRub: TProgressBar;
    Label21: TLabel;
    redCredito: TRealEdit;
    Label22: TLabel;
    redDebito: TRealEdit;
    Label19: TLabel;
    redTransf: TRealEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnRubricaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlLancaHoras: TCtrlLancaHoras;
    CtrlParamRH: TCtrlParamRH;
    CtrlBancoHoras: TCtrlBancoHoras;
    CtrlGlobalRH: TCtrlGlobalRH;
    ArqConfig: TIniFile;

    procedure AlimentaCombos(TipoRubrica: integer = 0);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  public
    IdPessoa: double;
    sDataInicial, sDataFinal: string;
  end;

var
  frmLancaHoras: TfrmLancaHoras;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fCriaRubrica, dCds;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_ERRO_ATUALIZA_LANC = 'Não pude atualizar Lançamento para a(s) Rubrica(s) de: :1';

{$R *.DFM}

procedure TfrmLancaHoras.FormCreate(Sender: TObject);
begin
  inherited;
  //CtrlParamRH := TCtrlParamRH.Create(Sistema.IdModulo);
  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);

  CtrlLancaHoras := TCtrlLancaHoras.Create;
  CtrlLancaHoras.InitializeAs(Padroes);

  CtrlBancoHoras := TCtrlBancoHoras.Create;
  CtrlBancoHoras.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  frmCriaRubrica := TfrmCriaRubrica.Create(Application, true);

  CtrlBancoHoras.CdsBancoHoras := CdsBancoHoras;

  AlimentaCombos;
  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('NORMALINI');
  cmbMes.ItemIndex := FU.ExtraiMes(dmCds.Cds.FieldByName('NORMALINI').asDateTime)-1;
  spnedAno.Value := FU.ExtraiAno(dmCds.Cds.FieldByName('NORMALINI').asDateTime);
end;

procedure TfrmLancaHoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlLancaHoras);
  FreeAndNil(CtrlParamRH);
  FreeAndNil(CtrlBancoHoras);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(frmCriaRubrica);
  GravaAlteracoes;
  inherited;
end;

procedure TfrmLancaHoras.FormShow(Sender: TObject);
begin
  inherited;
  cmbMes.SetFocus;
end;

procedure TfrmLancaHoras.bbtnRubricaClick(Sender: TObject);
begin
  if (frmCriaRubrica.ShowModal = mrOk) then
    AlimentaCombos(frmCriaRubrica.rgDestino.ItemIndex+1);
end;

procedure TfrmLancaHoras.bbtnConfirmarClick(Sender: TObject);
var
  c: byte;
  bOk: boolean;
  IntUm: integer;
  Msg: string;
  DescrPasso: array[1..8] of string;
  CdsAux: TCMClientDataSet;
begin
  DescrPasso[1] := fu.CMTranslate('Atrasos');
  DescrPasso[2] := fu.CMTranslate('Extras Diurnas');
  DescrPasso[3] := fu.CMTranslate('Extras Noturnas');
  DescrPasso[4] := fu.CMTranslate('Extraordinárias');
  DescrPasso[5] := fu.CMTranslate('Adicional Noturno');
  DescrPasso[6] := fu.CMTranslate('Extras Transferidas');
  DescrPasso[7] := fu.CMTranslate('Faltas');
  DescrPasso[8] := fu.CMTranslate('Faltas Abonadas');

  Msg := '';
  IntUm := 1;
  pgbrRub.Position := 0;
  for c:=1 to 8 do
  begin
    bOk := true;
    CdsAux := TCMClientDataSet(FindComponent('CdsRub'+IntToStr(c)));

    if (TwwDBLookupCombo(FindComponent('dblckRub'+IntToStr(c))).Text <> '') and
       (TRealEdit(FindComponent('redRub'+IntToStr(c))).Value > 0) then
      bOk := CtrlLancaHoras.Processar(
        Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1),
        Sistema.IdEmpresa,
        IdPessoa,
        cdsAux.FieldByName('IDPROVENTO').asFloat,
        cdsAux.FieldByName('IDREGRA').asFloat,
        TRealEdit(FindComponent('redRub'+IntToStr(c))).Value,
        IntUm);

    if not(bOk) then
      Msg := Msg + CR_LF + DescrPasso[c];

    pgbrRub.StepIt;
  end;

  if (bOk) and (gbxBancoHoras3.Visible) then
  begin
    if (redCredito.Value > 0) or (redDebito.Value > 0) or (redTransf.Value <> 0) then
    begin
      CdsBancoHoras.Data := CtrlBancoHoras.ListBancoHoras(-1);
      if (redCredito.Value > 0) then
      begin
        CdsBancoHoras.Insert;
        CdsBancoHoras.FieldByName('IDPESSOA').asFloat := IdPessoa;
        CdsBancoHoras.FieldByName('DATABANCOHORAS').asDateTime := StrToDate(sDataFinal);
        CdsBancoHoras.FieldByName('VALBANCOHORAS').asFloat := redCredito.Value;
        CdsBancoHoras.FieldByName('SITBANCOHORAS').asFloat := 1;
        CdsBancoHoras.Post;
      end;

      if (redDebito.Value > 0) then
      begin
        CdsBancoHoras.Insert;
        CdsBancoHoras.FieldByName('IDPESSOA').asFloat := IdPessoa;
        CdsBancoHoras.FieldByName('DATABANCOHORAS').asDateTime := StrToDate(sDataFinal);
        CdsBancoHoras.FieldByName('VALBANCOHORAS').asFloat := -redDebito.Value;
        CdsBancoHoras.FieldByName('SITBANCOHORAS').asFloat := 1;
        CdsBancoHoras.Post;
      end;

      if (redTransf.Value <> 0) then
      begin
        CdsBancoHoras.Insert;
        CdsBancoHoras.FieldByName('IDPESSOA').asFloat := IdPessoa;
        CdsBancoHoras.FieldByName('DATABANCOHORAS').asDateTime := StrToDate(sDataFinal);
        CdsBancoHoras.FieldByName('VALBANCOHORAS').asFloat := redTransf.Value;
        CdsBancoHoras.FieldByName('SITBANCOHORAS').asFloat := 1;
        CdsBancoHoras.Post;
      end;
      bOk := CtrlBancoHoras.GravarBancoHoras;
    end;

    if (sDataInicial <> '') then
    begin
      CdsBancoHoras.Data := CtrlBancoHoras.ListBancoHorasPeriodo(IdPessoa,
        sDataInicial, DateToStr(Date));
      CdsBancoHoras.First;
      while not(CdsBancoHoras.EOF) do
      begin
        if (CdsBancoHoras.FieldByName('SITBANCOHORAS').asFloat = 0) then
          CtrlBancoHoras.GravarSitBancoHoras(
            CdsBancoHoras.FieldByName('IDBANCOHORAS').asFloat, '1');
        CdsBancoHoras.Next;
      end;
    end;
  end;

  if (bOk) then
  begin
    MsgDlg(fu.CMTranslate('Todos os Lançamentos foram atualizados com sucesso.'),
      fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    inherited;
  end
  else
    MsgDlg(fu.CMTranslateMsg(MSG_ERRO_ATUALIZA_LANC, [Msg]),
      fu.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);

  pgbrRub.Position := 0;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmLancaHoras.AlimentaCombos(TipoRubrica: integer);
var
  c: byte;
  CodRubrica: array[1..8] of string;
begin
  // Armazena códigos das Rubricas selecionadas
  for c:=1 to 8 do
    CodRubrica[c] := TwwDbLookupCombo(Self.FindComponent('dblckRub'+IntToStr(c))).LookupValue;

  CdsRub1.Data := frmCriaRubrica.CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  CdsRub2.Data := CdsRub1.Data;
  CdsRub3.Data := CdsRub1.Data;
  CdsRub4.Data := CdsRub1.Data;
  CdsRub5.Data := CdsRub1.Data;
  CdsRub6.Data := CdsRub1.Data;
  CdsRub7.Data := CdsRub1.Data;
  CdsRub8.Data := CdsRub1.Data;

  // Recupera códigos das Rubricas selecionadas
  for c:=1 to 8 do
    TwwDbLookupCombo(Self.FindComponent('dblckRub'+IntToStr(c))).LookupValue := CodRubrica[c];
end;

procedure TfrmLancaHoras.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(fu.ArqConfig);
  dblckRub1.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica1', '');
  dblckRub1.UpDate;
  dblckRub2.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica2', '');
  dblckRub2.UpDate;
  dblckRub3.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica3', '');
  dblckRub3.UpDate;
  dblckRub4.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica4', '');
  dblckRub4.UpDate;
  dblckRub5.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica5', '');
  dblckRub5.UpDate;
  dblckRub6.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica8', '');
  dblckRub6.UpDate;
  dblckRub7.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica6', '');
  dblckRub7.UpDate;
  dblckRub8.LookUpValue := ArqConfig.ReadString('LANCAPONTO', 'Rubrica7', '');
  dblckRub8.UpDate;
end;

procedure TfrmLancaHoras.GravaAlteracoes;
begin
  // Grava as últimas alterações das Opções
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica1', dblckRub1.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica2', dblckRub2.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica3', dblckRub3.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica4', dblckRub4.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica5', dblckRub5.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica8', dblckRub6.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica6', dblckRub7.LookUpValue);
  ArqConfig.WriteString('LANCAPONTO', 'Rubrica7', dblckRub8.LookUpValue);
end;

end.
