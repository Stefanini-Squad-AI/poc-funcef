{-------------------------------------------------------------------------------
------------------------- REGISTRO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
Nº Solicitação...: WO 16666
Data da Alteração: 08/04/2025
Responsável......: Leandro Pocebon
Descrição........: Comentada da procedure Ajuda de Custo que inclui as rubricas
                   41534/41535/41536 - ajuda custo home office
--------------------------------------------------------------------------------
Nº Solicitação...: WO 18459
Data da Alteração: 29/01/2025
Responsável......: Leandro Pocebon
Descrição........: Alterada busca funcionarios para lista quando
                   "Rescisão de Contrato" ID 14 ou "Rescisão Complementar" ID 15
--------------------------------------------------------------------------------
Nº Solicitação...: WO 4875
Data da Alteração: 24/10/2023
Responsável......: Everson Cunha
Descrição........: Inclusão do ETL para processamento da Folha Estágio
--------------------------------------------------------------------------------
Nº Solicitação...: WO 4643
Data da Alteração: 23/10/2023
Responsável......: Everson Cunha
Descrição........: Inclusão do ETL para processamento da Folha Férias
--------------------------------------------------------------------------------
Nº Solicitação...: WO 3960
Data da Alteração: 17/07/2023
Responsável......: Everson Cunha
Descrição........: Inclusão do ETL para processamento da Folha
                   Retirada das chamadas de Monitoramento
--------------------------------------------------------------------------------
Nº SIG...........: 115628/116129
Data da Alteração: 21/05/2021
Responsável......: Everson Cunha
Descrição........: Chamada da procedure Ajuda de Custo
--------------------------------------------------------------------------------
Nº SIG...........: 100668
Data da Alteração: 29/06/2020
Responsável......: Andre Imakawa
Descrição........: Monitoramento da folha de pagamento
--------------------------------------------------------------------------------
Nº SOL......: 238909/18349
Data........: 15/02/2017
Responsável.......: William Moreira da Silva
Descrição.........: As rubricas de empréstimos enviadas para a folha de
                    pagamento quando quando caem em excesso de débito devem
                    refletir na TMPDESC no campo SITENVIO como "1".
--------------------------------------------------------------------------------
Rotina......: bbtnGeracaoClick
Nº SOL......: 152930
Nº KINTANA..: 1146562
Data........: 11/06/2012
Responsável.: Edilaine Ferraresi
Descrição...: Implementação da Integração Contribuição Previdenciaria separada
--------------------------------------------------------------------------------
Rotina......: bbtnGeracaoClick
Nº SOL......: 150520
Nº KINTANA..: 1093864
Data........: 12/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para quando for selecionada alguma rubrica, não
              sendo todas, não é para fazer o processo de excesso de débito
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 146682
Nº KINTANA..: 1001923
Data........: 12/11/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do campo para selecionar dos empregados
--------------------------------------------------------------------------------
 Autor(a)    :  Arnaldo V. Scarin
 Data        :  14/01/2010
 Pendência   : SOL 127407 KINTANA 675286
 Descricao   : Inclusão de Filtro para que os funcionários que estão
               em "Licença sem Vencimentos" não seja listados
--------------------------------------------------------------------------------
 Autor(a)    :  Ádler Teodoro de Souza
 Data        :  19/02/2009
 Pendência   : SOL 109421 KINTANA 496332
 Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
--------------------------------------------------------------------------------}

unit fGeraCalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Mask, StdCtrls, wwdblook, MAHlpBtn, Buttons, ComCtrls, Machklb, checklst, cmseldlg, Spin,
  TB97, Gauges, TB97Tlbr, IvDictio, IvMulti, IvEMulti, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  TREdit, fcLabel, ExtCtrls, wwdbdatetimepicker, DBGrids, fSairAjuda, CMDateTimePicker,
  ColorListBox, IniFiles, FileCtrl, DBClient, uCMClientDataSet, BfDialogs, BrowseFolder,
  TB97Tlwn, uProcuraDir, uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlMotivo, uCtrlProvDesc,
  uCtrlPessoaSindicato, uCtrlPessoaFilialPessoa, uCtrlGeraFolPagNormal, fParamCAP_GeraCalc,
  fProgresso_GeraCalc, ColorCheckListBox, wwdbedit, wwstorep,
  fOpcRescisao; //wo18459 Leandro

type
  TfrmGeraCalc = class(TfrmSairAjuda)
    pnlInformacoes: TPanel;
    pnlOpcoes: TPanel;
    SaveDlg: TSaveDialog;
    bbtnGeracao: TBitBtn;
    GroupBox3: TGroupBox;
    dblckMotivo: TwwDBLookupCombo;
    pgctrlDoc: TPageControl;
    tbshDatas: TTabSheet;
    grpMesRef: TGroupBox;
    gbxDtPagto: TGroupBox;
    dtDataPagFolha: TCMDateTimePicker;
    tbshCAP: TTabSheet;
    gbxTipoDoc: TGroupBox;
    dblckTipoDoc: TwwDBLookupCombo;
    rgProcesso: TRadioGroup;
    pgctrlOpcoes: TPageControl;
    tbsEmpresas: TTabSheet;
    tbsRubricas: TTabSheet;
    Label6: TLabel;
    chklstRubrica: TColorCheckListBox;
    pnlTituControles: TPanel;
    bbtnVerResultado: TBitBtn;
    Label10: TLabel;
    chklstFunc: TColorCheckListBox;
    gbxTipContr: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    tbshRetroativo: TTabSheet;
    rgOpcRetro: TRadioGroup;
    gbxRetroSelec: TGroupBox;
    dbgrdRubEmpre: TwwDBGrid;
    Label12: TLabel;
    lstbxBase: TColorListBox;
    lstbxComplem: TColorListBox;
    lstbxResult: TColorListBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dsRubrica: TwwDataSource;
    gbxRetroOpc: TGroupBox;
    bbtnNenhumaRubCompl: TBitBtn;
    speQtMeses: TSpinEdit;
    bbtnNenhumaBase: TBitBtn;
    Label16: TLabel;
    rePercRetro: TRealEdit;
    Label17: TLabel;
    lstbxTipoCalc: TColorListBox;
    cbxEspeciais: TCheckBox;
    fcLabel1: TfcLabel;
    bbtnSelTudo: TBitBtn;
    bbtnInverte: TBitBtn;
    bbtnSelPessoa: TBitBtn;
    bbtnInvPessoa: TBitBtn;
    pnlResult: TPanel;
    memResult: TMemo;
    Panel1: TPanel;
    bbtnSalvar: TBitBtn;
    bbtnVoltar: TBitBtn;
    lblTipoCalc: TLabel;
    cmbTipoCalc: TComboBox;
    BitBtn1: TBitBtn;
    sbtnAssociarTodosBase: TSpeedButton;
    sbtnAssociarBase: TSpeedButton;
    sbtnDesassociarBase: TSpeedButton;
    sbtnDesassociarTodosBase: TSpeedButton;
    sbtnAssociarComplem: TSpeedButton;
    sbtnAssociarTodosComplem: TSpeedButton;
    sbtnDesassociarComplem: TSpeedButton;
    sbtnDesassociarTodosComplem: TSpeedButton;
    sbtnAssociarResult: TSpeedButton;
    sbtnAssociarTodosResult: TSpeedButton;
    sbtnDesassociarResult: TSpeedButton;
    sbtnDesassociarTodosResult: TSpeedButton;
    tbshSelecRetro: TTabSheet;
    rgSelecRetro: TRadioGroup;
    gbxFiltroCCusto: TGroupBox;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodosCCusto: TBitBtn;
    bbtnInverteSelCCusto: TBitBtn;
    gbxFunc: TGroupBox;
    pgctrlFuncRetro: TPageControl;
    tbshListaFunc: TTabSheet;
    chklstFuncRetro: TColorCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    tbshFiltroFunc: TTabSheet;
    gbxTipContr2: TGroupBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    gbxFiltroSindicato: TGroupBox;
    chklstSindicato: TColorCheckListBox;
    bbtnSelTodosSindicato: TBitBtn;
    bbtnInverteSelSindicato: TBitBtn;
    cbxEfetivos2: TCheckBox;
    cbxEspeciais2: TCheckBox;
    cbxTemporarios2: TCheckBox;
    cbxEstagiarios2: TCheckBox;
    cbxAutonomos2: TCheckBox;
    cbxPropDirSemVinc2: TCheckBox;
    cbxTerceiros2: TCheckBox;
    rgTipoFolha: TRadioGroup;
    gbxDtFerias: TGroupBox;
    dtFeriasIni: TCMDateTimePicker;
    dtFeriasFim: TCMDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    CdsMotivo: TCMClientDataSet;
    CdsRubrica: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    Label5: TLabel;
    chklstEmpresa: TColorCheckListBox;
    bbtnSelEmpr: TBitBtn;
    bbtnInvEmpr: TBitBtn;
    rgOpcaoPrevia: TRadioGroup;
    Label1: TLabel;
    chklstEstab: TColorCheckListBox;
    bbtnSelEstab: TBitBtn;
    BitBtn5: TBitBtn;
    chkLOG: TCheckBox;
    dbedMes: TwwDBEdit;
    dbedAno: TwwDBEdit;
    cbxTmpDesc: TCheckBox;
    edtSelEmpregados: TEdit;
    btnSelEmpregados: TBitBtn;
    //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
    spAtualizaValTabGener: TwwStoredProc;
    //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537    
    spAtualizaHstContribPrev: TwwStoredProc;
    spAjudadeCusto: TwwStoredProc;
    chkETL: TCheckBox;
    cdsAuxETL: TCMClientDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnGeracaoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure bbtnSelEstabClick(Sender: TObject);
    procedure bbtnInvEstabClick(Sender: TObject);
    procedure chklstEmpresaClickCheck(Sender: TObject);
    procedure dblckTipoDocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure bbtnSelPessoaClick(Sender: TObject);
    procedure bbtnInvPessoaClick(Sender: TObject);
    procedure rgOpcRetroClick(Sender: TObject);
    procedure sbtnDesassociarTodosResultClick(Sender: TObject);
    procedure sbtnDesassociarTodosComplemClick(Sender: TObject);
    procedure sbtnDesassociarTodosBaseClick(Sender: TObject);
    procedure sbtnAssociarComplemClick(Sender: TObject);
    procedure sbtnAssociarResultClick(Sender: TObject);
    procedure sbtnAssociarTodosBaseClick(Sender: TObject);
    procedure sbtnAssociarTodosComplemClick(Sender: TObject);
    procedure sbtnAssociarTodosResultClick(Sender: TObject);
    procedure bbtnNenhumaRubComplClick(Sender: TObject);
    procedure sbtnDesassociarBaseClick(Sender: TObject);
    procedure sbtnDesassociarComplemClick(Sender: TObject);
    procedure sbtnDesassociarResultClick(Sender: TObject);
    procedure dbgrdRubEmpreKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnNenhumaBaseClick(Sender: TObject);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure rgSelecRetroClick(Sender: TObject);
    procedure chklstCCustoExit(Sender: TObject);
    procedure gbxSituacaoEnter(Sender: TObject);
    procedure gbxSituacaoExit(Sender: TObject);
    procedure gbxTipContr2Enter(Sender: TObject);
    procedure gbxTipContr2Exit(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure bbtnSelTodosCCustoClick(Sender: TObject);
    procedure bbtnInverteSelCCustoClick(Sender: TObject);
    procedure rgProcessoClick(Sender: TObject);
    procedure bbtnSelTodosSindicatoClick(Sender: TObject);
    procedure bbtnInverteSelSindicatoClick(Sender: TObject);
    procedure chklstSindicatoExit(Sender: TObject);
    procedure chklstSindicatoClickCheck(Sender: TObject);
    procedure sbtnAssociarBaseClick(Sender: TObject);
    procedure rgTipoFolhaClick(Sender: TObject);
    procedure gbxTipContrEnter(Sender: TObject);
    procedure gbxTipContrExit(Sender: TObject);
    procedure bbtnSelEmprClick(Sender: TObject);
    procedure bbtnInvEmprClick(Sender: TObject);
    procedure chklstRubricaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSelEmpregadosClick(Sender: TObject);
    procedure dblckMotivoChange(Sender: TObject);
    procedure chkETLClick(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlGeraFolPagNormal: TCtrlGeraFolPagNormal;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;

    TelaOpcRescisao: TfrmOpcRescisao; // wo18459

    TelaParamCAP: TfrmParamCAP_GeraCalc;
    TelaProgresso: TfrmProgresso_GeraCalc;
    ArqConfig: TIniFile;

    lstBase, lstComplem, lstResult, ListaCodCCusto, ListaIdFuncRetro, ListaIdEmpresa,
    ListaIdEstab, ListaIdRubrica, ListaIdFunc, ListaCheckCCusto, ListaIdSindicato,
    ListaCheckSindicato: TStringList;

    ListaMatFunc: TStringList; // Alterado por FHBS - SOL: 146682 KTN: 1001923

    wMesRef: word;
    bSitAtivo, bSitAfast, bTipContrEfet, bTipContrEspec, bTipContrTemp,
    bTipContrEst, bTipContrTerc, bTipContrProp, bTipContrAut: boolean;
    iIdMotivoPadrao: integer;
    sListaIdEmpresaSel, sListaIdRubricaSel, sListaSitFunc, sListaTipoContr,
    sListaIdEstabSel, sListaCodCCusto, sListaIdSindicatoSel: string;

    procedure LerAlteracoes;
    procedure GravarAlteracoes;

    procedure CriarListaEmpregados(AgrupaCCusto: boolean);
    procedure CriarListaEmpresas;
    procedure CriarListaEstab;
    procedure CriarListaRubricas;
    procedure CriarListaCCusto;
    procedure CriarListaSindicatos;
    procedure GerarArquivosSERPROS;
    procedure Progresso(Args: array of variant);
    //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
    procedure AtualizaValTabGener(sAnoMes, sListaPessoas: String);
    //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
    procedure AtualizaHstContribPrev(sAnoMes, sListaPessoas: String);

    procedure AjudadeCusto(sAnoMes, sListaPessoas: String); //Everson Cunha - SIG115628/116129

    procedure VerificaMonitoramento(pPasso: Integer); // Andre Imakawa - SIG 100668
    Function GetTotalFuncionariosSel: String;         // Andre Imakawa - SIG 100668
    function Exec_ETL(sListaFuncSel : string): Boolean; //Everson Cunha - WO 3960
  end;

var
  frmGeraCalc: TfrmGeraCalc;

implementation

uses uMensErro, uSistema, uCtrlParamIntegra, uCtrlPadroes, uModulo, uCtrlFuncoesRH,
  dCds, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmGeraCalc.FormCreate(Sender: TObject);
var
  wDia, wAno: word;
begin
  inherited;
  CtrlGeraFolPagNormal := TCtrlGeraFolPagNormal.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlGeraFolPagNormal.InitializeAs(Padroes);
  CtrlGeraFolPagNormal.Progresso := Progresso;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  TelaOpcRescisao := TfrmOpcRescisao.Create(Self);

  TelaParamCAP := TfrmParamCAP_GeraCalc.Create(Self);
  TelaProgresso := TfrmProgresso_GeraCalc.Create(Self);
  TelaProgresso.Titulo := 'Gerando Folha de Pagamento';

  lstResult := TStringList.Create;
  lstComplem := TStringList.Create;
  lstBase := TStringList.Create;
  ListaIdEmpresa := TStringList.Create;
  ListaIdEstab := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaIdRubrica := TStringList.Create;
  ListaIdFuncRetro := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaCheckCCusto := TStringList.Create;
  ListaIdSindicato := TStringList.Create;
  ListaCheckSindicato := TStringList.Create;
  ListaMatFunc := TStringList.Create; // Alterado por FHBS - SOL: 146682 KTN: 1001923


  CdsParamRH.Data := CtrlGlobalRH.GetParamRH(
    'NORMALINI, NORMALFIM, LIMADM, FERIASINI, FERIASFIM, IDMOTIVO');
  if (CdsParamRH.FieldByName('NORMALINI').IsNull) or
     (CdsParamRH.FieldByName('NORMALFIM').IsNull) then
  begin
    MsgDlg('Não Há Período Aberto.' +CR_LF+ 'Verifique.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    Close;
    exit;
  end;

  CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');
  CdsMotivo.Data := CtrlMotivo.ListGeral(0, 0, 'F');

  // Alterado por Arnaldo V. Scarin em 12/01/2010
  // SOL 127407 KTN 675286
  // Inclusão de Filtro para que os funcionários que estão
  // em "Licença sem Vencimentos" não seja listados
  DecodeDate(CdsParamRH.FieldByName('NORMALINI').asDateTime, wAno, wMesRef, wDia);
  dbedMes.Text := MesLongo[wMesRef];
  dbedAno.Text := IntToStr(wAno);

  // Preencher Lista das Empresas
  CriarListaEmpresas;
  // Preencher Lista dos Estabelecimentos
  CriarListaEstab;
  // Preencher Lista das Rubricas
  CriarListaRubricas;
  // Preencher Lista dos Empregados
  CriarListaEmpregados(false);

  tbsRubricas.PageIndex := 0;
  cmbTipoCalc.ItemIndex := 0;

  if (CdsParamRH.FieldByName('LIMADM').asInteger < 5) then
    rgOpcaoPrevia.ItemIndex := CdsParamRH.FieldByName('LIMADM').asInteger;

  dtFeriasIni.Date := CdsParamRH.FieldByName('FERIASINI').asDateTime;
  dtFeriasFim.Date := CdsParamRH.FieldByName('FERIASFIM').asDateTime;

  CdsMotivo.Locate('IDMOTIVO', CdsParamRH.FieldByName('IDMOTIVO').asInteger, []);
  dblckMotivo.LookupValue := CdsMotivo.FieldByName('IDMOTIVO').asString;
  dblckMotivo.Update;
  iIdMotivoPadrao := CdsMotivo.FieldByName('IDMOTIVO').asInteger;


  dtDataPagFolha.Text := DateToStr(Date);

  pnlFundo.SendToBack;
  pnlOpcoes.BringToFront;
  pgctrlOpcoes.ActivePageIndex := 0;
  pgctrlDoc.ActivePageIndex := 0;
  pgctrlFuncRetro.ActivePageIndex := 0;

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

  cbxTmpDesc.Visible := Sistema.TipoEmpresa = 'P';

  LerAlteracoes;

  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332


end;

procedure TfrmGeraCalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;

  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlGeraFolPagNormal);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlMotivo);

  FreeAndNil(TelaOpcRescisao); //wo18459

  FreeAndNil(TelaParamCAP);
  FreeAndNil(TelaProgresso);

  FreeAndNil(lstResult);
  FreeAndNil(lstComplem);
  FreeAndNil(lstBase);
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaIdFuncRetro);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaCheckCCusto);
  FreeAndNil(ListaIdSindicato);
  FreeAndNil(ListaCheckSindicato);
  FreeAndNil(ListaIdEmpresa);
  FreeAndNil(ListaMatFunc); // Alterado por FHBS - SOL: 146682 KTN: 1001923
  inherited;
end;

procedure TfrmGeraCalc.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TColorCheckListBox(Control).Canvas) do
  begin
    if (TColorCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TColorCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmGeraCalc.dblckTipoDocCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Trim(dblckTipoDoc.Text) <> '') then
  begin
    if (TelaParamCAP.dtDataPag.Text = '') then
      TelaParamCAP.dtDataPag.Date := dtDataPagFolha.Date;

    if (TelaParamCAP.ShowModal <> mrOk) then
    begin
      dblckTipoDoc.Text := '';
      dblckTipoDoc.SetFocus;
    end;
  end;
end;

procedure TfrmGeraCalc.dbgrdRubEmpreKeyPress(Sender: TObject; var Key: Char);
begin
  CdsRubrica.Locate('DESCRICAO', Key, [loCaseInsensitive,loPartialKey]);
end;

procedure TfrmGeraCalc.chklstRubricaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstRubricaClickCheck(Sender);
end;

procedure TfrmGeraCalc.chklstEmpresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstEmpresaClickCheck(Sender);
end;

procedure TfrmGeraCalc.chklstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstEstabClickCheck(Sender);
end;

procedure TfrmGeraCalc.gbxSituacaoEnter(Sender: TObject);
begin
  bSitAtivo := cbxAtivos.Checked;
  bSitAfast := cbxAfastados.Checked;
end;

procedure TfrmGeraCalc.gbxSituacaoExit(Sender: TObject);
begin
  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Situação deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    gbxSituacao.SetFocus;
  end
  else
  if (bSitAtivo <> cbxAtivos.Checked) or (bSitAfast <> cbxAfastados.Checked) then
    CriarListaEmpregados(true);
end;

procedure TfrmGeraCalc.gbxTipContrEnter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos.Checked;
  bTipContrEspec := cbxEspeciais.Checked;
  bTipContrTemp := cbxTemporarios.Checked;
  bTipContrEst := cbxEstagiarios.Checked;
  bTipContrTerc := cbxTerceiros.Checked;
  bTipContrProp := cbxPropDirSemVinc.Checked;
  bTipContrAut := cbxAutonomos.Checked;
end;

procedure TfrmGeraCalc.gbxTipContrExit(Sender: TObject);
begin
  if not(cbxEfetivos.Checked) and not(cbxEspeciais.Checked) and
     not(cbxTemporarios.Checked) and not(cbxTerceiros.Checked) and
     not(cbxPropDirSemVinc.Checked) and not(cbxAutonomos.Checked) and
     not(cbxEstagiarios.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos2.Checked) or (bTipContrEspec <> cbxEspeciais2.Checked) or
     (bTipContrTemp <> cbxTemporarios2.Checked) or (bTipContrEst <> cbxEstagiarios2.Checked) or
     (bTipContrTerc <> cbxTerceiros2.Checked) or (bTipContrProp <> cbxPropDirSemVinc2.Checked) or
     (bTipContrAut <> cbxAutonomos2.Checked) then
    CriarListaEmpregados(false);
end;

procedure TfrmGeraCalc.gbxTipContr2Enter(Sender: TObject);
begin
  bTipContrEfet := cbxEfetivos2.Checked;
  bTipContrEspec := cbxEspeciais2.Checked;
  bTipContrTemp := cbxTemporarios2.Checked;
  bTipContrEst := cbxEstagiarios2.Checked;
  bTipContrTerc := cbxTerceiros2.Checked;
  bTipContrProp := cbxPropDirSemVinc2.Checked;
  bTipContrAut := cbxAutonomos2.Checked;
end;

procedure TfrmGeraCalc.gbxTipContr2Exit(Sender: TObject);
begin
  if not(cbxEfetivos2.Checked) and not(cbxEspeciais2.Checked) and
     not(cbxTemporarios2.Checked) and not(cbxTerceiros2.Checked) and
     not(cbxPropDirSemVinc2.Checked) and not(cbxAutonomos2.Checked) and
     not(cbxEstagiarios2.Checked) then
  begin
    MsgDlg('Pelo menos um Tipo de Contrato deve ser selecionado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    cbxEfetivos2.SetFocus;
  end
  else
  if (bTipContrEfet <> cbxEfetivos2.Checked) or (bTipContrEspec <> cbxEspeciais2.Checked) or
     (bTipContrTemp <> cbxTemporarios2.Checked) or (bTipContrEst <> cbxEstagiarios2.Checked) or
     (bTipContrTerc <> cbxTerceiros2.Checked) or (bTipContrProp <> cbxPropDirSemVinc2.Checked) or
     (bTipContrAut <> cbxAutonomos2.Checked) then
    CriarListaEmpregados(true);
end;

procedure TfrmGeraCalc.chklstCCustoExit(Sender: TObject);
var
  c: integer;
  MudouCCusto: boolean;
begin
  // Verifico se alguma seleção de Centros de Custo foi alterada
  MudouCCusto := false;
  for c:=0 to chklstCCusto.Items.Count-1 do
    if (Boolean(StrToInt(ListaCheckCCusto[c])) <> chklstCCusto.Checked[c]) then
    begin
      MudouCCusto := true;
      break;
    end;
  // Atualizo a nova posição da Lista de c. Custo
  for c:=0 to chklstCCusto.Items.Count-1 do
    ListaCheckCCusto[c] := IntToStr(Integer(chklstCCusto.Checked[c]));

  if (MudouCCusto) then
  begin
    CriarListaEmpregados(true);
    if (pgctrlFuncRetro.ActivePageIndex = 0) then
      chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalc.chklstSindicatoExit(Sender: TObject);
var
  c: integer;
  MudouSindicato: boolean;
begin
  // Verifico se alguma seleção de Sindicato foi alterada
  MudouSindicato := false;
  for c:=0 to chklstSindicato.Items.Count-1 do
    if (Boolean(StrToInt(ListaCheckSindicato[c])) <> chklstSindicato.Checked[c]) then
    begin
      MudouSindicato := true;
      break;
    end;
  // Atualizo a nova posição da Lista de Sindicato
  for c:=0 to chklstSindicato.Items.Count-1 do
    ListaCheckSindicato[c] := IntToStr(Integer(chklstSindicato.Checked[c]));

  if (MudouSindicato) then
  begin
    CriarListaEmpregados(true);
    if (pgctrlFuncRetro.ActivePageIndex = 0) then
      chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalc.chklstCCustoClickCheck(Sender: TObject);
begin
  FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  chklstCCustoExit(Sender);
end;

procedure TfrmGeraCalc.chklstSindicatoClickCheck(Sender: TObject);
begin
  FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  chklstSindicatoExit(Sender);
end;

procedure TfrmGeraCalc.chklstEstabClickCheck(Sender: TObject);
var
  c: integer;
  bAchouChecked: boolean;
begin
  bAchouChecked := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bAchouChecked := true;
      break;
    end;

  if not(bAchouChecked) then
  begin
    chklstEstab.Checked[chklstEstab.ItemIndex] := true;
    exit;
  end;

  FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  CriarListaEmpregados(false);
end;

procedure TfrmGeraCalc.chklstRubricaClickCheck(Sender: TObject);
begin
  FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmGeraCalc.chklstEmpresaClickCheck(Sender: TObject);
var
  c: integer;
  bAchouChecked: boolean;
begin
  bAchouChecked := false;
  for c:=0 to chklstEmpresa.Items.Count-1 do
    if (chklstEmpresa.Checked[c]) then
    begin
      bAchouChecked := true;
      break;
    end;

  if not(bAchouChecked) then
  begin
    if (chklstEmpresa.ItemIndex > -1) then
      chklstEmpresa.Checked[chklstEmpresa.ItemIndex] := true;
    exit;
  end;

  FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  FU.CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);

  // Preenche Lista dos Estabelecimentos
  CriarListaEstab;
  // Preenche Lista das Rubricas
  CriarListaRubricas;
  // Preenche Lista dos Empregados
  CriarListaEmpregados(false);

  if (pgctrlOpcoes.ActivePage = tbsEmpresas) then
    chklstFunc.Repaint;
end;

procedure TfrmGeraCalc.bbtnVoltarClick(Sender: TObject);
begin
  pnlFundo.SendToBack;
  pnlOpcoes.BringToFront;
end;

procedure TfrmGeraCalc.bbtnVerResultadoClick(Sender: TObject);
begin
  pnlFundo.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmGeraCalc.bbtnSalvarClick(Sender: TObject);
begin
  SaveDlg.Title := 'Salvar Resultado da Geração';
  if (SaveDlg.Execute) then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmGeraCalc.bbtnSelEmprClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEmpresa.Items.Count-1 do
    chklstEmpresa.Checked[c] := true;
  chklstEmpresa.Repaint;
  chklstEmpresaClickCheck(bbtnSelEmpr);
end;

procedure TfrmGeraCalc.bbtnInvEmprClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEmpresa.Items.Count-1 do
    chklstEmpresa.Checked[c] := not(chklstEmpresa.Checked[c]);
  chklstEmpresa.Repaint;
  chklstEmpresaClickCheck(bbtnInvEmpr);
end;

procedure TfrmGeraCalc.bbtnSelTudoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := true;
  chklstRubrica.Repaint;
end;

procedure TfrmGeraCalc.bbtnInverteClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubrica.Items.Count-1 do
    chklstRubrica.Checked[c] := not(chklstRubrica.Checked[c]);
  chklstRubrica.Repaint;
end;

procedure TfrmGeraCalc.bbtnSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  CriarListaEmpregados(false);
end;

procedure TfrmGeraCalc.bbtnInvEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  CriarListaEmpregados(false);
end;

procedure TfrmGeraCalc.bbtnSelPessoaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  chklstFunc.Repaint;
end;

procedure TfrmGeraCalc.bbtnInvPessoaClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  chklstFunc.Repaint;
end;

procedure TfrmGeraCalc.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFuncRetro.Items.Count-1 do
    chklstFuncRetro.checked[c] := true;
  chklstFuncRetro.Repaint;
end;

procedure TfrmGeraCalc.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFuncRetro.Items.Count-1 do
    chklstFuncRetro.Checked[c] := not(chklstFuncRetro.Checked[c]);
  chklstFuncRetro.Repaint;
end;

procedure TfrmGeraCalc.bbtnSelTodosCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalc.bbtnInverteSelCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalc.bbtnSelTodosSindicatoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindicato.Items.Count-1 do
    chklstSindicato.Checked[c] := true;
  chklstSindicato.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalc.bbtnInverteSelSindicatoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstSindicato.Items.Count-1 do
    chklstSindicato.Checked[c] := not(chklstSindicato.Checked[c]);
  chklstSindicato.Repaint;

  if (pgctrlFuncRetro.ActivePageIndex = 0) then
  begin
    CriarListaEmpregados(true);
    chklstFuncRetro.Repaint;
  end;
end;

procedure TfrmGeraCalc.rgOpcRetroClick(Sender: TObject);
begin
  gbxRetroSelec.Visible := (rgOpcRetro.ItemIndex = 0);
  gbxRetroOpc.Visible := (rgOpcRetro.ItemIndex = 0);
  rgSelecRetro.Enabled := (rgOpcRetro.ItemIndex = 0);
  if (rgOpcRetro.ItemIndex = 1) then
  begin
    rgSelecRetro.ItemIndex := 0;
    rgSelecRetroClick(Self);
  end;
end;

procedure TfrmGeraCalc.sbtnAssociarBaseClick(Sender: TObject);
begin
  lstBase.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
  lstbxBase.Items.Add(FU.Alinha(IntToStr(lstbxBase.Items.Count+1),3,'D','0') +#9+
    FU.fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40)     +#9+
    FU.fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10));
end;

procedure TfrmGeraCalc.sbtnAssociarComplemClick(Sender: TObject);
begin
  lstComplem.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
  lstbxComplem.Items.Add(FU.Alinha(IntToStr(lstbxComplem.Items.Count+1),3,'D','0') +#9+
    FU.fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40)           +#9+
    FU.fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10));
end;

procedure TfrmGeraCalc.sbtnAssociarResultClick(Sender: TObject);
begin
  lstResult.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
  lstbxResult.Items.Add(FU.Alinha(IntToStr(lstbxResult.Items.Count+1),3,'D','0') +#9+
    FU.fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40)         +#9+
    FU.fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10)        +#9+
    FU.fValidaDados('*',CdsRubrica.FieldByName('IDREGRA').asString,10));

  if not(CdsRubrica.FieldByName('IDREGRA').IsNull) then
    lstbxTipoCalc.Items.Add('3')
  else
  if (cmbTipoCalc.ItemIndex < 2) then
    if (lstbxBase.Items.Count > lstbxTipoCalc.Items.Count) and
       (Trim(lstbxBase.GetFieldItem(lstbxTipoCalc.Items.Count,2)) <> 'XXXXXXXXXX') then
      lstbxTipoCalc.Items.Add(IntToStr(cmbTipoCalc.ItemIndex + 1))
    else
      lstbxTipoCalc.Items.Add('2');
end;

procedure TfrmGeraCalc.sbtnAssociarTodosBaseClick(Sender: TObject);
begin
  lstbxBase.Items.BeginUpdate;
  sbtnDesassociarTodosBaseClick(Sender);
  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    sbtnAssociarBaseClick(Sender);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
  lstbxBase.Items.EndUpdate;
end;

procedure TfrmGeraCalc.sbtnAssociarTodosComplemClick(Sender: TObject);
begin
  lstbxComplem.Items.BeginUpdate;
  sbtnDesassociarTodosComplemClick(Sender);
  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    sbtnAssociarComplemClick(Sender);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
  lstbxComplem.Items.EndUpdate;
end;

procedure TfrmGeraCalc.sbtnAssociarTodosResultClick(Sender: TObject);
begin
  lstbxTipoCalc.Items.BeginUpdate;
  lstbxResult.Items.BeginUpdate;
  sbtnDesassociarTodosResultClick(Sender);
  CdsRubrica.First;
  while not(CdsRubrica.EOF) do
  begin
    sbtnAssociarResultClick(Sender);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
  lstbxResult.Items.EndUpdate;
  lstbxTipoCalc.Items.EndUpdate;
end;

procedure TfrmGeraCalc.bbtnNenhumaBaseClick(Sender: TObject);
begin
  lstBase.Add('XXXXXXXXXX');
  lstbxBase.Items.Add(FU.Alinha(IntToStr(lstbxBase.Items.Count+1),3,'D','0') +#9+
    'Nenhuma' +#9+ 'XXXXXXXXXX');
end;

procedure TfrmGeraCalc.bbtnNenhumaRubComplClick(Sender: TObject);
begin
  lstComplem.Add('XXXXXXXXXX');
  lstbxComplem.Items.Add(FU.Alinha(IntToStr(lstbxComplem.Items.Count+1),3,'D','0') +#9+
    'Nenhuma' +#9+ 'XXXXXXXXXX');
end;

procedure TfrmGeraCalc.sbtnDesassociarBaseClick(Sender: TObject);
begin
  if (lstbxBase.ItemIndex > -1) then
  begin
    lstBase.Delete(lstbxBase.ItemIndex);
    lstbxBase.Items.Delete(lstbxBase.ItemIndex);
  end;
end;

procedure TfrmGeraCalc.sbtnDesassociarComplemClick(Sender: TObject);
begin
  if (lstbxComplem.ItemIndex > -1) then
  begin
    lstComplem.Delete(lstbxComplem.ItemIndex);
    lstbxComplem.Items.Delete(lstbxComplem.ItemIndex);
  end;
end;

procedure TfrmGeraCalc.sbtnDesassociarResultClick(Sender: TObject);
begin
  if (lstbxResult.ItemIndex > -1) then
  begin
    lstResult.Delete(lstbxResult.ItemIndex);
    lstbxTipoCalc.Items.Delete(lstbxResult.ItemIndex);
    lstbxResult.Items.Delete(lstbxResult.ItemIndex);
  end;
end;

procedure TfrmGeraCalc.sbtnDesassociarTodosBaseClick(Sender: TObject);
begin
  lstBase.Clear;
  lstbxBase.Clear;
end;

procedure TfrmGeraCalc.sbtnDesassociarTodosComplemClick(Sender: TObject);
begin
  lstComplem.Clear;
  lstbxComplem.Clear;
end;

procedure TfrmGeraCalc.sbtnDesassociarTodosResultClick(Sender: TObject);
begin
  lstResult.Clear;
  lstbxResult.Clear;
  lstbxTipoCalc.Clear;
end;

procedure TfrmGeraCalc.rgProcessoClick(Sender: TObject);
begin
  rgOpcaoPrevia.Visible := (rgProcesso.ItemIndex = 0);
end;

procedure TfrmGeraCalc.rgTipoFolhaClick(Sender: TObject);
begin
  gbxDtFerias.Visible := (rgTipoFolha.ItemIndex = 1);
end;

procedure TfrmGeraCalc.rgSelecRetroClick(Sender: TObject);
var
  c: integer;
begin
  case (rgSelecRetro.ItemIndex) of
    0 :
    begin
      for c:=0 to chklstFuncRetro.Items.Count-1 do
        chklstFuncRetro.Checked[c] := false;
    end;
    1 :
    begin
      if (chklstFuncRetro.Items.Count = 0) then
      begin
        // Preenche Lista dos Centros de Custo
        CriarListaCCusto;
        // Preenche Lista dos Sindicatos
        CriarListaSindicatos;
        // Preenche Lista dos Empregados
        CriarListaEmpregados(true);
      end
      else
      begin
        for c:=0 to chklstFuncRetro.Items.Count-1 do
          chklstFuncRetro.Checked[c] := true;
      end;
    end;
  end;
  gbxFunc.Visible := (rgSelecRetro.ItemIndex = 1);
  gbxFiltroCCusto.Visible := (rgSelecRetro.ItemIndex = 1);
  gbxFiltroSindicato.Visible := (rgSelecRetro.ItemIndex = 1);
end;

procedure TfrmGeraCalc.bbtnGeracaoClick(Sender: TObject);
var
  wNum: word;
  bOk, bSelFunc: boolean;
  c, iIdMotivo, TempoTotal, TempoTotalPessoas, NumPessoas: integer;
  bRetroApenas, bForcarGeracao13: boolean;
  sListaEmpregadoSel, sListaEmpregadoRetroSel: string;
  _ArqLOG: TStringList;
begin
  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  if not(bSelFunc) then
  begin
    MsgDlg('Pelo menos um Empregado deve ser selecionado.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    pgctrlOpcoes.ActivePage := tbsRubricas;
    chklstFunc.SetFocus;
    exit;
  end;

  if (rgTipoFolha.ItemIndex = 1) and ((dtFeriasIni.Text = '') or (dtFeriasFim.Text = '')) then
  begin
    MsgDlg('Período de Gozo: Datas Não Podem Ficar em Branco.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dtFeriasIni.SetFocus;
    exit;
  end;

  if (rgTipoFolha.ItemIndex = 1) and (dtFeriasIni.Date > dtFeriasFim.Date) then
  begin
    MsgDlg('Período de Gozo: Data Início Não Pode Ser Posterior à Final.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    dtFeriasIni.SetFocus;
    exit;
  end;

  if (rgOpcRetro.ItemIndex = 0) then
  begin
    if (lstbxBase.Items.Count = 0) then
    begin
      MsgDlg('Informe ao Menos uma Rubrica Base para o Retroativo.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      pgctrlOpcoes.ActivePage := tbshRetroativo;
      exit;
    end;

    if (lstbxBase.Items.Count  <> lstbxResult.Items.Count) or
       ((lstbxBase.Items.Count <> lstbxComplem.Items.Count) and
        (lstbxComplem.Items.Count > 0)) then
    begin
      MsgDlg('Incompatibilidade na relação Rubricas'+CR_LF+
             'Base/Complementares/Resultantes para o Retroativo.',
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      pgctrlOpcoes.ActivePage := tbshRetroativo;
      exit;
    end;

     for c:=0 to lstbxTipoCalc.Items.Count-1 do
       if (lstbxTipoCalc.Items[c] = '2') and (rePercRetro.Value = 0) then
       begin
         MsgDlg('Informe a Base Perecentual para o Retroativo.', 'Aviso',
           mtInformation, [mbOk,mbHelp], 0);
         pgctrlOpcoes.ActivePage := tbshRetroativo;
         rePercRetro.SetFocus;
         exit;
       end;
  end;

  if (Trim(dblckMotivo.Text) = '') then
  begin
    MsgDlg('Informe um Tipo de Folha a ser processado.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    dblckMotivo.SetFocus;
    exit;
  end;

  bForcarGeracao13 := false;
  if (rgTipoFolha.ItemIndex = 2) and
     (MsgDlg('Se este processo de 13º é para todos, responda Sim.'+CR_LF+
             'Se for só para quem solicitou adiantamento, responda Não.',
             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes) then
  begin
    bForcarGeracao13 := true;
  end;

  if (Trim(dblckTipoDoc.Text) = '') and (rgProcesso.ItemIndex = 1) then
    if (MsgDlg('Integração com Contas a Pagar não será feita.' +CR_LF+ 'Confirma?',
               'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
    begin
      pgctrlDoc.ActivePage := tbshCAP;
      dblckTipoDoc.SetFocus;
      exit;
    end;

  // Testar a data da Folha
  if (Trim(dtDataPagFolha.Text) = '') then
  begin
    MsgDlg('Preencha a Data da Folha.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    //William Moreira da Silva - SIG 238909/18349 - Inicio
    //Correção, pois dava erro ao apresentar mensagem
    //pgctrlDoc.ActivePage := tbshCAP;
    pgctrlDoc.ActivePage := tbshDatas;
    //William Moreira da Silva - SIG 238909/18349 - Fim
    exit;
  end;

  //if (rgProcesso.ItemIndex = 0) then                       //Everson Cunha - WO 3960
  if (rgProcesso.ItemIndex = 0) and not(chkETL.Checked) then //Everson Cunha - WO 3960
    if ((rgOpcaoPrevia.ItemIndex = 0) and
        (MsgDlg('Qualquer Prévia Anterior Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 1) and
        (MsgDlg('Prévia Desse(s) Tipo(s) de Folha Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 2) and
        (MsgDlg('Prévia da(s) Pessoa(s) Selecionada(s) Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 3) and
        (MsgDlg('Prévia Desse(s) Tipo(s) de Folha e da(s) Pessoa(s) Selecionada(s) Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) or
       ((rgOpcaoPrevia.ItemIndex = 4) and
        (MsgDlg('Nenhuma Prévia Será Destruída.' +CR_LF+
                'Confirma a Execução?', 'Confirmação',
                mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo)) then
    begin
      rgProcesso.SetFocus;
      exit;
    end;

  iIdMotivo := StrToIntDef(dblckMotivo.LookupValue, 0);
  // Tipo de Retroativo
  if (rgOpcRetro.ItemIndex = 0) and (iIdMotivo <> iIdMotivoPadrao) and (iIdMotivo > 0) then
  begin
    bRetroApenas := true;

    for c:=0 to lstbxBase.Items.Count-1 do
      if (Trim(lstbxBase.GetFieldItem(c,2)) <> 'XXXXXXXXXX') then
      begin
        bRetroApenas := false;
        break;
      end;

      if (bRetroApenas) and
         (MsgDlg('Confirma Folha apenas para cálculo Retroativo?', 'Confirmação',
                 mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrNo) then
        begin
          pgctrlOpcoes.ActivePage := tbshRetroativo;
          exit;
        end;
  end;

  // Empregados escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaEmpregadoSel, ',', false);
  if (sListaEmpregadoSel = '') and (rgOpcaoPrevia.ItemIndex in [2,3]) then
  begin
    MsgDlg('Opção da Prévia requer a seleção de Pessoa(s)', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  pnlFundo.SendToBack;
  pnlOpcoes.BringToFront;

  memResult.Lines.Clear;
  memResult.Lines.Add('Geração da ' +Trim(dblckMotivo.Text));
  memResult.Lines.Add('Data do Processamento: ' +dtDataPagFolha.Text);
  memResult.Lines.Add('');
  memResult.Lines.Add('Mês de Referência: '+ FU.PoeZero(wMesRef) +'/'+ dbedAno.Text);
  memResult.Lines.Add('--------------------------------------------------');
  memResult.Lines.Add('');


  Self.Enabled := false;
  TelaProgresso.HoraIni := Time;
  TelaProgresso.QtdeFunc := 0;
  //TelaProgresso.TempoDecorr := '00:00:00'; //Everson Cunha - WO 3960
  TelaProgresso.TempoDecorr := '';           //Everson Cunha - WO 3960
  TelaProgresso.Progresso := 0;
  TelaProgresso.Processo := 'Preparando Dados Iniciais do Processo. Aguarde...';
  TelaProgresso.Pessoa := '';
  TelaProgresso.Mostrar;

  // Empregados escolhidos para o Retroativo
  wNum := FU.CriaListaOpcoes(chklstFuncRetro, ListaIdFunc, sListaEmpregadoRetroSel, ',', false);
  if (wNum = ListaIdFunc.Count) then
    sListaEmpregadoRetroSel := '';

  // Demais itens escolhidos nas listas
  FU.CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  wNum := FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubricaSel, ',', false);

  // Alterado por FHBS - SOL: 150520 KTN: 1093864
  // Acordado com o Pedro Jackson (Funcef) e o Wanderley (Funcef) juntamente com o Renato (Softek)
  // Quando for selecionada alguma rubrica, não sendo todas, não é para fazer o processo de excesso de débito
  if (wNum = ListaIdRubrica.Count) then
    sListaIdRubricaSel := '';
  // Fim - Alterado por FHBS - SOL: 150520 KTN: 1093864

  //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
  if (rgProcesso.ItemIndex = 0) then
     AtualizaValTabGener(Trim(dbedAno.Text) +'/'+ FU.PoeZero(wMesRef), sListaEmpregadoSel);

  //if (rgProcesso.ItemIndex = 0) then //Everson Cunha - SIG115628/116129               //Everson Cunha - WO 3960
  //WO16666 - Leandro - Inicio
  //if (rgProcesso.ItemIndex = 0) and not(chkETL.Checked) then //Everson Cunha - SIG115628/116129 //Everson Cunha - WO 3960
  //   AjudadeCusto(Trim(dbedAno.Text) +'/'+ FU.PoeZero(wMesRef), sListaEmpregadoSel); //Everson Cunha - SIG115628/116129
  //WO16666 - Leandro - Fim

  //VerificaMonitoramento(0); // Andre Imakawa - SIG 100668

  //Everson Cunha - WO 3960 - Inicio
  if (chkETL.Checked) then
  begin
    bOk := Exec_ETL(sListaEmpregadoSel);

    if (bOk) then
    begin
      memResult.Lines.Add('Início: ' + TimeToStr(TelaProgresso.HoraIni) + ' - Fim: ' + TimeToStr(Time));
      memResult.Lines.Add('');
      memResult.Lines.Add('Finalizado o processamento via ETL');
      memResult.Lines.Add('');

      MsgDlg('Geração da Folha de Pagamento efetuada com sucesso', 'Aviso', mtInformation, [mbOK], 0);
    end;
  end
  else
  begin
  //Everson Cunha - WO 3960 - Fim
    // Processo de Geração da Rescisão
    CtrlGeraFolPagNormal.CreateThreadProgresso;
    bOk := CtrlGeraFolPagNormal.Processar(wMesRef, StrToInt(dbedAno.Text),
    Modulo.IdContraCheque, Sistema.IdEmpresa, Sistema.TipoEmpresa, rgProcesso.ItemIndex,
    dtDataPagFolha.Date, rgTipoFolha.ItemIndex, iIdMotivo, iIdMotivoPadrao,
    rgOpcaoPrevia.ItemIndex, dtFeriasIni.Date, dtFeriasFim.Date, sListaIdEmpresaSel,
    sListaIdEstabSel, sListaEmpregadoSel, sListaIdRubricaSel,
    FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
      cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
      cbxAutonomos.Checked, cbxEstagiarios.Checked),
    // Retroativo
    rgOpcRetro.ItemIndex = 0, speQtMeses.Value, rePercRetro.Value, lstbxBase.Items.Text,
    lstbxComplem.Items.Text, lstbxResult.Items.Text, lstbxTipoCalc.Items.Text,
    rgSelecRetro.ItemIndex = 0, sListaEmpregadoRetroSel,
    // Contas a Pagar / Pagamento Eletrônico
    (TelaParamCAP.chkPagEletronico.Checked) and (Trim(dblckTipoDoc.Text)<>''),
    (TelaParamCAP.chkCAP.Checked) and (Trim(dblckTipoDoc.Text)<>''),
    TelaParamCAP.dtDataPag.Date, // Data do Pagamento
    Date, // Data da Emissão
    TelaParamCAP.chkRateioCC.Checked,
    TelaParamCAP.chkCriaDocIndividual.Checked,
    TelaParamCAP.chkConsTipoDesemb.Checked,
    Sistema.IdUsuario,
    FU.IFF(Trim(dblckTipoDoc.Text)<>'', CdsTipoDoc.FieldByName('CODTIPDOC').asInteger, -1),
    FU.IFF(Trim(TelaParamCAP.dblckPortadorForma.Text)<>'',
      TelaParamCAP.CdsPortadorForma.FieldByName('CODPORTFORMA').asInteger, -1),
    TelaParamCAP.iPlano, // Plano Padrão para Favorecido
    TelaParamCAP.CMProcuraMaskContabil.Conta.Numero, // Conta Padrão para Favorecido
    TelaParamCAP.edPastaArqPag.Text, Sistema.UsaPlanoPatro, ParamIntegra.ObrigaAbc,
    ParamIntegra.ObrigaCrespon, ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal,
    TelaParamCAP.sListaTipoDesembSel, Sistema.UsaRAD, bForcarGeracao13, cbxTmpDesc.Checked, chkLOG.Checked);

  // Edilaine - SOL 152930 / KTN 1146562 - comentado
  //Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
  //if (rgProcesso.ItemIndex = 1) then
  //   AtualizaHstContribPrev(Trim(dbedAno.Text) +'/'+ FU.PoeZero(wMesRef), sListaEmpregadoSel);
  // Edilaine - SOL 152930 / KTN 1146562 - fim

    CtrlGeraFolPagNormal.FreeThreadProgresso;

    bOk := True;

    if (bOk) then
    begin
      NumPessoas := CtrlGeraFolPagNormal.NumRegProcessados;
      TempoTotal := CtrlGeraFolPagNormal.TempoDecorridoTotal;
      TempoTotalPessoas := CtrlGeraFolPagNormal.TempoDecorridoPessoa;

      memResult.Lines.Add('Registros Processados: ' + IntToStr(CtrlGeraFolPagNormal.NumRegProcessados));
      memResult.Lines.Add('');
      memResult.Lines.Add('Tempo de Processamento: ' + FU.TempoDecorrido(TempoTotal));
      memResult.Lines.Add('');
      memResult.Lines.Add('Tempo de Preparação: ' + FU.TempoDecorrido(TempoTotal - TempoTotalPessoas));
      memResult.Lines.Add('');
      memResult.Lines.Add('Tempo Médio por Pessoa: ' + FU.TempoDecorrido(TempoTotalPessoas div NumPessoas));
      //VerificaMonitoramento(1); // Andre Imakawa - SIG 100668
      MsgDlg(CtrlGeraFolPagNormal.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    end
    else
    begin
      memResult.Lines.Add(CtrlGeraFolPagNormal.MessageInfo);
      //VerificaMonitoramento(2); // Andre Imakawa - SIG 100668
      MsgDlg(CtrlGeraFolPagNormal.MessageInfo, 'Erro', mtWarning, [mbOk,mbHelp], 0);
    end;

    if (chkLOG.Checked) then
    begin
      _ArqLOG := TStringList.Create;
      _ArqLOG.Text := CtrlGeraFolPagNormal.LOG;
      //_ArqLOG.SaveToFile('c:\LOG_FOL_PAG.TXT');
      _ArqLOG.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\LOG_FOL_PAG.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      _ArqLOG.Free;
    end;
  end;

  Self.Enabled := true;

  TelaProgresso.Hide;
  pnlFundo.BringToFront;
  pnlOpcoes.SendToBack;

  if (bOk) and (Modulo.IdContraCheque = SERPROS) and (iIdMotivo = iIdMotivoPadrao) and
     (rgProcesso.ItemIndex = 1) then
    GerarArquivosSERPROS;
end;

procedure TfrmGeraCalc.CriarListaEmpregados(AgrupaCCusto: boolean);
var sPeriodo : String;
    ListaTipoContratoSel: string; //wo18459
    DataInicial, DataFinal : TDateTime;

begin
  // Alterado por Arnaldo V. Scarin em 12/01/2010
  // SOL 127407 KTN 675286
  // Inclusão de Filtro para que os funcionários que estão
  // em "Licença sem Vencimentos" não seja listados
  sPeriodo := dbedAno.Text + FU.PoeZero(wMesRef);

  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCusto, ',', false);
  FU.CriaListaOpcoes(chklstSindicato, ListaIdSindicato, sListaIdSindicatoSel, ',', false);
  FU.CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);

  if (AgrupaCCusto) then
  begin
    sListaSitFunc := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked, false);
    sListaTipoContr := FU.GerarListaTipoContratoSel(cbxEfetivos2.Checked,
      cbxEspeciais2.Checked, cbxTemporarios2.Checked, cbxTerceiros2.Checked,
      cbxPropDirSemVinc2.Checked, cbxAutonomos2.Checked, cbxEstagiarios2.Checked);
  end
  else
  begin
    sListaSitFunc := '';
    sListaTipoContr := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
      cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
      cbxAutonomos.Checked, cbxEstagiarios.Checked);
  end;

  // Alterado por Arnaldo V. Scarin em 12/01/2010
  // SOL 127407 KTN 675286
  // Inclusão de Filtro para que os funcionários que estão
  // em "Licença sem Vencimentos" não seja listados

  //WO18459 - Leandro 29/01/2025 - inicio
  if  ((cdsMotivo.FieldByName('IDMOTIVO').asInteger = 14) or
       (cdsMotivo.FieldByName('IDMOTIVO').asInteger = 15) ) then
  begin
    DataInicial := StrToDate('01/' + FU.PoeZero(wMesRef) + '/' + IntToStr(StrToInt(dbedAno.Text)-1));
    DataFinal   := StrToDate(IntToStr(FU.TrazUltDiaMes(wMesRef, StrToInt(dbedAno.Text))) +'/'+ FU.PoeZero(wMesRef) +'/'+ dbedAno.Text);

    ListaTipoContratoSel := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked, cbxTemporarios.Checked, cbxTerceiros.Checked,
                                                         cbxPropDirSemVinc.Checked, cbxAutonomos.Checked, cbxEstagiarios.Checked, false);


    dmCds.Cds.Data :=  TelaOpcRescisao.montaListaEmpregadoSelData(ListaTipoContratoSel, DataInicial, DataFinal);
  end
  else
  begin
    dmCds.Cds.Data := CtrlGeraFolPagNormal.ListFuncionarios(sListaIdEmpresaSel,
                                                            AgrupaCCusto,
                                                            sListaIdEstabSel,
                                                            sListaCodCCusto,
                                                            sListaIdSindicatoSel,
                                                            sListaSitFunc,
                                                            sListaTipoContr,
                                                            True,
                                                            sPeriodo);
  end;
  //WO18459 - Leandro 29/01/2025 - fim

  if (AgrupaCCusto) then
  begin
    ListaIdFuncRetro.Clear;
    chklstFuncRetro.Items.Clear;
    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFuncRetro.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      chklstFuncRetro.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      chklstFuncRetro.Checked[chklstFuncRetro.Items.Count-1] := true;
      dmCds.Cds.Next;
    end;
  end
  else
  begin
    ListaIdFunc.Clear;
    ListaMatFunc.Clear; // Alterado por FHBS - SOL: 146682 KTN: 1001923
    chklstFunc.Items.Clear;
    while not(dmCds.Cds.EOF) do
    begin
      ListaIdFunc.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
      ListaMatFunc.Add(dmCds.Cds.FieldByName('MATRICULA').asString); // Alterado por FHBS - SOL: 146682 KTN: 1001923
      chklstFunc.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
      chklstFunc.Checked[chklstFunc.Items.Count-1] := true;
      dmCds.Cds.Next;
    end;
  end;

  //WO18459 - Leandro 29/01/2025 - inicio
  if  ((cdsMotivo.FieldByName('IDMOTIVO').asInteger = 14) or
       (cdsMotivo.FieldByName('IDMOTIVO').asInteger = 15) ) then
  begin
    bbtnInvPessoa.OnClick(Self);
  end;
  //WO18459 - Leandro 29/01/2025 - fim

end;

procedure TfrmGeraCalc.LerAlteracoes;
var
  sRubAtual, sEntradaArqConf: string;
{->}procedure SelOpcoes(Lista: TStrings; ListBox: TColorListBox);
    begin
      Lista.Clear;
      ListBox.Clear;
      while (sEntradaArqConf <> '') do
      begin
        sRubAtual := Copy(sEntradaArqConf,1,Pos(',',sEntradaArqConf)-1);

        // Quando está na última Rubrica
        if (sRubAtual = '') then
          sRubAtual := sEntradaArqConf;

        Delete(sEntradaArqConf, 1, Length(sRubAtual)+1);
        Lista.Add(sRubAtual);

        if (ListBox.Name <> 'lstbxTipoCalc') then
        begin
          if (sRubAtual = 'XXXXXXXXXX') then
            ListBox.Items.Add(FU.Alinha(IntToStr(ListBox.Items.Count+1),3,'D','0') +#9+
                              'Nenhuma' +#9+ 'XXXXXXXXXX')
          else
          if (CdsRubrica.Locate('IDPROVENTO', sRubAtual, [])) then
            ListBox.Items.Add(FU.Alinha(IntToStr(ListBox.Items.Count+1),3,'D','0') +#9+
              FU.fValidaDados('*',CdsRubrica.FieldByName('DESCRICAO').asString,40) +#9+
              FU.fValidaDados('*',CdsRubrica.FieldByName('IDPROVENTO').asString,10)+#9+
              FU.fValidaDados('*',CdsRubrica.FieldByName('IDREGRA').asString,10));
        end;
      end;
{->}end;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('c:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  sEntradaArqConf := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasBase', '');
  SelOpcoes(lstBase, lstbxBase);

  sEntradaArqConf := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasComplem', '');
  SelOpcoes(lstComplem, lstbxComplem);

  sEntradaArqConf := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasResult', '');
  SelOpcoes(lstResult, lstbxResult);

  sEntradaArqConf := ArqConfig.ReadString('GERACAO_FOLHA', 'RubricasTipoCalc', '');
  SelOpcoes(lstbxTipoCalc.Items, lstbxTipoCalc);

  cbxTmpDesc.Checked := (ArqConfig.ReadString('GERACAO_FOLHA', 'MantemTmpDesc', 'F') = 'V');
end;

procedure TfrmGeraCalc.GravarAlteracoes;
{->}function CriaLiOp(Lista: TStrings): string;
    var
      c: integer;
    begin
      Result := '';
      for c:=0 to Lista.Count-1 do
        if (Result = '') then
          Result := Lista[c]
        else
          Result := Result +','+ Lista[c];
{->}end;
begin
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasBase', CriaLiOp(lstBase));
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasComplem', CriaLiOp(lstComplem));
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasResult', CriaLiOp(lstResult));
  ArqConfig.WriteString('GERACAO_FOLHA', 'RubricasTipoCalc', CriaLiOp(lstbxTipoCalc.Items));
  ArqConfig.WriteString('GERACAO_FOLHA', 'MantemTmpDesc', FU.IFF(cbxTmpDesc.Checked, 'V', 'F'));
  FreeAndNil(ArqConfig);
end;

procedure TfrmGeraCalc.CriarListaEmpresas;
begin
  dmCds.Cds.Data := CtrlListTerceirosRH.ListEmpresaProp(Sistema.IdEmpresa);
  chklstEmpresa.Items.Clear;
  ListaIdEmpresa.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstEmpresa.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEmpresa.Checked[chklstEmpresa.Items.Count-1] := true;
    ListaIdEmpresa.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    dmCds.Cds.Next;
  end;
  FU.CriaListaOpcoes(chklstEmpresa, ListaIdEmpresa, sListaIdEmpresaSel, ',', false);
end;

procedure TfrmGeraCalc.CriarListaEstab;
begin
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(sListaIdEmpresaSel);
  chklstEstab.Items.Clear;
  ListaIdEstab.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    chklstEstab.Checked[chklstEstab.Items.Count-1] := true;
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    dmCds.Cds.Next;
  end;
end;

procedure TfrmGeraCalc.CriarListaRubricas;
begin
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(sListaIdEmpresaSel);
  chklstRubrica.Items.Clear;
  ListaIdRubrica.Clear;
  while not(CdsRubrica.EOF) do
  begin
    chklstRubrica.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    ListaIdRubrica.Add(CdsRubrica.FieldByName('IDPROVENTO').asString);
    CdsRubrica.Next;
  end;
  CdsRubrica.First;
end;

procedure TfrmGeraCalc.CriarListaCCusto;
begin
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(sListaIdEmpresaSel);
  chklstCCusto.Items.Clear;
  ListaCodCCusto.Clear;
  ListaCheckCCusto.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    ListaCheckCCusto.Add(IntToStr(Integer(false)));
    dmCds.Cds.Next;
  end;
end;

procedure TfrmGeraCalc.CriarListaSindicatos;
begin
  dmCds.Cds.Data := CtrlPessoaSindicato.ListSindicatoComFuncionarios;
  chklstSindicato.Items.Clear;
  ListaIdSindicato.Clear;
  ListaCheckSindicato.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstSindicato.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    ListaIdSindicato.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    ListaCheckSindicato.Add(IntToStr(Integer(false)));
    dmCds.Cds.Next;
  end;
end;

procedure TfrmGeraCalc.GerarArquivosSERPROS;
var
  sMesRef, svDir: string;
  LinhasArq: TStringList;
begin
  LinhasArq := TStringList.Create;

  sMesRef := dbedAno.Text +'/'+ FU.PoeZero(wMesRef);

  SaveDlg.Title := 'Local para salvar o Arquivo Texto Assistencial';
  SaveDlg.FileName := 'Assistencial' +FU.TiraBarra(sMesRef);
  if (SaveDlg.Execute) then
  begin
    LinhasArq.Text := CtrlGeraFolPagNormal.GetLinhasArquivo_SERPROS(false);
    LinhasArq.SaveToFile(SaveDlg.FileName);
    svDir := ExtractFilePath(SaveDlg.FileName);
  end
  else
    svDir := '';

  SaveDlg.Title := 'Local para salvar o Arquivo Texto Empréstimos';
  SaveDlg.FileName := 'Emprestimos' +FU.TiraBarra(sMesRef);
  if (svDir = '') then
    SaveDlg.InitialDir := ''
  else
    SaveDlg.InitialDir := svDir;

  if (SaveDlg.Execute) then
  begin
    LinhasArq.Text := CtrlGeraFolPagNormal.GetLinhasArquivo_SERPROS(true);
    LinhasArq.SaveToFile(SaveDlg.FileName);
    svDir := ExtractFilePath(SaveDlg.FileName);
  end;
  LinhasArq.Free;
end;

procedure TfrmGeraCalc.Progresso(Args: array of variant);
var
  iNumArgs: integer;
begin
  iNumArgs := High(Args);
  if (iNumArgs >= 0) then
    if (Args[0] <> '') then
      TelaProgresso.Processo := Args[0];

  if (iNumArgs >= 1) then
    if (Args[1] <> '') then
      TelaProgresso.TempoDecorr := Args[1];

  if (iNumArgs >= 2) then
    //if (Args[2] > 0) then
    if (Args[2] > -1) then
      TelaProgresso.QtdeFunc := Args[2];

  if (iNumArgs >= 3) then
    if (Args[3] <> '') then
      TelaProgresso.Pessoa := Args[3];

  if (iNumArgs >= 4) then
    if (Args[4] > 0) then
      TelaProgresso.MaxProgresso := Args[4];

  if (iNumArgs >= 5) then
    if (Args[5] > 0) then
      TelaProgresso.Progresso := Args[5];

  if (iNumArgs >= 6) then
    if (Args[6] <> '') then
      memResult.Lines.Add(Args[6]);

  Self.Update;
  TelaProgresso.Mostrar;
end;

procedure TfrmGeraCalc.btnSelEmpregadosClick(Sender: TObject);
var
  slLista: TStringList;
  x, i: Integer;
  sLin, sIni, sFim: String;
  bIni, bFim: Boolean;
  sMatErro: String;

  function StrCount(SubStr, S: String): Integer;
  begin
    Result := 0;
    while Pos(SubStr, S) > 0 do
    begin
      Delete(S, Pos(SubStr, S), 1);
      Result := Result + 1;
    end;

  end;

begin
  inherited;
  // Alterado por FHBS - SOL: 146682 KTN: 1001923
  if Trim(edtSelEmpregados.Text) <> '' then
  begin
    slLista := TStringList.Create;
    try
      slLista.Text := StringReplace(edtSelEmpregados.Text, ';', #13#10, [rfReplaceAll]);

      // Fazendo a validação dos dados
      //7.4. - Qualquer informação no novo campo texto, diferente de NNN e NNN;NNN;NNN;...
      //       e NNN-NNN e A e A;A;A;A;... e A-A o sistema vai emitir uma mensagem de erro
      //       informando que o formato do campo foi digitado errado pelo usuário
      for x := 0 to slLista.Count-1 do
      begin
        sLin := slLista[x];

        if (Trim(sLin) <> '') then
        begin

          case StrCount('-', sLin) of
            0: begin
                 sIni := sLin;
                 sFim := sLin;
               end;
            1: begin
                 sIni := Copy(sLin, 1, Pos('-', sLin)-1);
                 Delete(sLin, 1, Pos('-', sLin));
                 sFim := sLin;
               end;
          else
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados em branco
          if (Trim(sIni) = '') or (Trim(sFim) = '') then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados não numéricos com mais de um caracter: A e A;A;A;A;... e A-A
          if (( (Length(sIni) > 1) and not(sIni[1] in ['0'..'9']) ) or
              ( (Length(sFim) > 1) and not(sFim[1] in ['0'..'9']) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

          // Validando dados numéricos: NNN e NNN;NNN;NNN;... e NNN-NNN
          if (( (sIni[1] in ['0'..'9']) and (StrToIntDef(sIni, -1) = -1) ) or
              ( (sFim[1] in ['0'..'9']) and (StrToIntDef(sFim, -1) = -1) ) ) then
          begin
            MessageDlg('Formato do campo inválido.', mtError, [mbOK, mbHelp], 0);
            Exit;
          end;

        end;
      end;

      sMatErro := '';
      // Selecionando....
      for x := 0 to slLista.Count-1 do
      begin
        sLin := AnsiUpperCase(slLista[x]);

        if StrCount('-', sLin) > 0 then
        begin
          sIni := Copy(sLin, 1, Pos('-', sLin)-1);
          Delete(sLin, 1, Pos('-', sLin));
          sFim := sLin;
        end
        else
        begin
          sIni := sLin;
          sFim := sLin;
        end;

        if (sIni[1] in ['0'..'9']) then
        begin
          bIni := False;
          bFim := (StrToIntDef(sIni,0) = StrToIntDef(sFim,0));  // se for igual só vai validar se existe o sIni

          for i := 0 to chklstFunc.Items.Count-1 do
            if ( (StrToIntDef(ListaMatFunc[i],-1) >= StrToIntDef(sIni,0) ) and
                 (StrToIntDef(ListaMatFunc[i],-1) <= StrToIntDef(sFim,0) ) ) then
            begin
              if not(bIni) and (StrToIntDef(ListaMatFunc[i],-1) = StrToIntDef(sIni,0)) then bIni := True;
              if not(bFim) and (StrToIntDef(ListaMatFunc[i],-1) = StrToIntDef(sFim,0)) then bFim := True;
              chklstFunc.Checked[i] := True;
            end;

          if not(bIni) then
            sMatErro := sMatErro + ', ' + sIni;

          if not(bFim) then
            sMatErro := sMatErro + ', ' + sFim;
        end
        else
        begin

          for i := 0 to chklstFunc.Items.Count-1 do
            if ( (Copy(chklstFunc.Items[i], 1, Length(sIni)) >= sIni) and
                 (Copy(chklstFunc.Items[i], 1, Length(sFim)) <= sFim) ) then
              chklstFunc.Checked[i] := True;

        end;

      end;

      if Trim(sMatErro) <> '' then
      begin
        Delete(sMatErro, 1, 2);
        MsgDlg('Matrícula(s) '+sMatErro+' não existe(m)', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      end;

    finally
      FreeAndNil(slLista);
      chklstFunc.Repaint;
    end;
  end;
end;

 
//Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
procedure TfrmGeraCalc.AtualizaValTabGener(sAnoMes, sListaPessoas: String);
begin
   spAtualizaValTabGener.Close;
   //Ricardo Cristiano - 25/01/2011 - N. Sol 151116 -  N. Kintana 1105227
   spAtualizaValTabGener.ParamByName('PANOMES').AsString := sAnoMes;
   spAtualizaValTabGener.ParamByName('PLISTAPESSOAS').AsString := sListaPessoas;
   if not(spAtualizaValTabGener.Prepared) then spAtualizaValTabGener.Prepare;
   spAtualizaValTabGener.ExecProc;
end;

//Ricardo Cristiano - 13/09/2010 - N. Sol 142201 -  N. Kintana 905537
procedure TfrmGeraCalc.AtualizaHstContribPrev(sAnoMes, sListaPessoas : String);
begin
   spAtualizaHstContribPrev.Close;
   spAtualizaHstContribPrev.ParamByName('PANOMES').AsString := sAnoMes;
   spAtualizaHstContribPrev.ParamByName('PLISTAPESSOAS').AsString := sListaPessoas;
   if not(spAtualizaHstContribPrev.Prepared) then spAtualizaHstContribPrev.Prepare;
   spAtualizaHstContribPrev.ExecProc;
end;

// Andre Imakawa - SIG 100668 - Inicio
procedure TfrmGeraCalc.VerificaMonitoramento(pPasso: Integer);
begin
  if (rgTipoFolha.ItemIndex = 0) then
  begin
    case (pPasso) of
      0 :
      begin
        case (rgProcesso.ItemIndex) of
          0 :
          begin
            FU.Monitoramento('FOLHA DE PAGAMENTO - PREVIA - INICIO  \ue008\ue007\ue000TOTAL DE FUNCIONARIO(S): '+ GetTotalFuncionariosSel, 4)
          end;
          1 :
          begin
            FU.Monitoramento('FOLHA DE PAGAMENTO - FINAL - INICIO  \ue008\ue007\ue000TOTAL DE FUNCIONARIO(S): '+ GetTotalFuncionariosSel, 4)
          end;
        end;
      end;
      1 :
      begin
        case (rgProcesso.ItemIndex) of
          0 :
          begin
            FU.Monitoramento('FOLHA DE PAGAMENTO - PREVIA - FIM  \ue008\ue007\ue000TOTAL DE FUNCIONARIO(S): '+ GetTotalFuncionariosSel, 4)
          end;
          1 :
          begin
            FU.Monitoramento('FOLHA DE PAGAMENTO - FINAL - FIM  \ue008\ue007\ue000TOTAL DE FUNCIONARIO(S): '+ GetTotalFuncionariosSel, 4)
          end;
        end;
      end;
      2 :
      begin
        case (rgProcesso.ItemIndex) of
          0 :
          begin
            FU.Monitoramento('FOLHA DE PAGAMENTO - PREVIA \ue008\ue007\ue000TOTAL DE FUNCIONARIO(S): '+ GetTotalFuncionariosSel, 2, 'FALHA NA EXECUCAO. FAVOR VERIFICAR.')
          end;
          1 :
          begin
            FU.Monitoramento('FOLHA DE PAGAMENTO - FINAL \ue008\ue007\ue000TOTAL DE FUNCIONARIO(S): '+ GetTotalFuncionariosSel, 2, 'FALHA NA EXECUCAO. FAVOR VERIFICAR.')
          end;
        end;
      end;
    end;
  end;
end;

Function TfrmGeraCalc.GetTotalFuncionariosSel: String;
var
  i, c: integer;
begin
  i := 0;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      inc(i);
    end;
  result := IntToStr(i);
end;
// Andre Imakawa - SIG 100668 - Fim
//Everson Cunha - SIG115628/116129 - Ini
procedure TfrmGeraCalc.AjudadeCusto(sAnoMes, sListaPessoas: String);
begin
  try
    spAjudadeCusto.Close;

    spAjudadeCusto.ParamByName('PMESCOBRANCA').AsString := sAnoMes;
    spAjudadeCusto.ParamByName('PLISTAPESSOAS').AsString := sListaPessoas;

    if not(spAjudadeCusto.Prepared) then
      spAjudadeCusto.Prepare;  

    spAjudadeCusto.ExecProc;
  except
    On E : Exception do
    Begin
      MessageDlg('Erro: ' + E.Message, mtError, [mbOK], 0);
    End;
  end;
end;
//Everson Cunha - SIG115628/116129 - Fim

//Everson Cuna - WO 3960 - Início
function TfrmGeraCalc.Exec_ETL(sListaFuncSel : string): Boolean;
var
  sSql, dataParaArquivos, subPath, DBConnectionCM,
  anoMesRef, normal_Inicio, normal_Fim, dataPagamento,
  path_EventWait, path_Completo_Ew,
  path_ArquivosParam, path_Completo_Param_Preparo, path_Completo_Param_Previa,
  path_Completo_Param_Final, path_Completo_LKP_Idpessoa, sUsuarioProcessoAtivo,
  sDataInicioProcessoAtivo, sQtdEmpregadosProcessoAtivo, sNomeWF : String;
  iQtdProcessos, iTempoRepete, iTempoAborta, iContador, iContadorAborta,
  idProcesso, iQtdEmpregados, iFlgAdiantaPgtoFerias : Integer;

  function verificaStatusETL : Boolean;
  begin
    //Não atualizar progresso pois essa função é chamada várias vezes durante o processamento
    Progresso(['Verificando status do processamento - ETL']);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    sSql := 'select e.*, trim(us.nomeusuario) nomeusuario ' +
            '  from cm.etl_folha_funcef e ' +
            '  join cm.usuariosistema us on us.idusuario = regexp_replace(e.idusuario, ''\D'') ' +
            ' where e.idmotivo = ' + dblckMotivo.LookupValue +
            '   and e.processo = ' + IntToStr(rgProcesso.ItemIndex) +
            '   and e.data_inicio is not null and e.data_fim is null ';

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    sUsuarioProcessoAtivo := cdsAuxETL.fieldbyname('nomeusuario').AsString;
    sDataInicioProcessoAtivo := cdsAuxETL.fieldbyname('data_inicio').AsString;
    sQtdEmpregadosProcessoAtivo := cdsAuxETL.fieldbyname('qtd_empregados').AsString;

    Result := cdsAuxETL.IsEmpty;
  end;

  function buscaParamETL : Boolean;
  begin
    Progresso(['Selecionando os parâmetros - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    sSql := 'select * from cm.parametlplanus where idmodulo = 21 and idparametl = 6'; //GERA FOLHA PAGTO - PARAMETROS

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    if cdsAuxETL.IsEmpty then
    begin
      Result := False;
      Exit;
    end
    else
    begin
      if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
        path_ArquivosParam := cdsAuxETL.FieldByName('DIRETORIO_PROD').AsString
      else
        path_ArquivosParam := cdsAuxETL.FieldByName('DIRETORIO_DEV').AsString;

      if (path_ArquivosParam = '') then
      begin
        Result := False;
        Exit;
      end
      else
        Result := True;
    end;

    case rgProcesso.ItemIndex of
      0 : sSql := 'select * from cm.parametlplanus where idmodulo = 21 and idparametl = 7'; //GERA FOLHA PAGTO - PREVIA
      1 : sSql := 'select * from cm.parametlplanus where idmodulo = 21 and idparametl = 8'; //GERA FOLHA PAGTO - FINAL
    end;

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    if cdsAuxETL.IsEmpty then
    begin
      Result := False;
      Exit;
    end
    else
    begin
      if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
        path_EventWait := cdsAuxETL.FieldByName('DIRETORIO_PROD').AsString
      else
        path_EventWait := cdsAuxETL.FieldByName('DIRETORIO_DEV').AsString;

      iTempoRepete := cdsAuxETL.FieldByName('TEMPO_REPETE').AsInteger;
      iTempoAborta := cdsAuxETL.FieldByName('TEMPO_ABORTA').AsInteger;

      if (iTempoRepete <= 0) then
        iTempoRepete := 15000; //15 segundos por padrão

      if (iTempoAborta <= 0) then
        iTempoAborta := 0;

      if (path_EventWait = '') then
      begin
        Result := False;
        Exit;
      end
      else
        Result := True;
    end;
  end;

  function preparaDados : Boolean;
  begin
    Progresso(['Preparando dados - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    sSql := 'select cm.seq_etl_folha_funcef.nextval seq from dual';

    cdsAuxETL.Close;
    cdsAuxETL.Data := fu.GetDataPacket(sSql);

    if cdsAuxETL.IsEmpty then
    begin
      Result := False;
      Exit;
    end
    else
      idProcesso := cdsAuxETL.FieldByName('SEQ').AsInteger;

    anoMesRef := dbedAno.Text +'/'+ FU.PoeZero(wMesRef);
    normal_Inicio := CdsParamRH.FieldByName('NORMALINI').AsString;
    normal_Fim := CdsParamRH.FieldByName('NORMALFIM').AsString;
    dataPagamento := dtDataPagFolha.Text;
    dataParaArquivos := 'ID' + FormatFloat('#00000', idProcesso) + '_' + dbedAno.Text + FU.PoeZero(wMesRef) + '_' + FormatDateTime('YYYYMMDDHHMMSS', Now);

    case StrToInt(dblckMotivo.LookupValue) of
      1 : //Folha Mensal Empregados
      begin
        subPath := 'MENSAL';
        sNomeWF := '1_MENSAL';
        iFlgAdiantaPgtoFerias := 0;
      end;
      2 : //Folha de Adiantamento de Ferias
      begin
        subPath := 'FERIAS';
        sNomeWF := '2_FERIAS';
        iFlgAdiantaPgtoFerias := 1;
      end;
      8 : //Folha de 13o Salario
      begin
        subPath := 'FOLHA_13';
        sNomeWF := '8_FOLHA_13';
      end;
      9 : //Folha de Adiantamento do 13º Salario
      begin
        subPath := 'ADTO_13';
        sNomeWF := '9_ADTO_13';
      end;
      14 : //Folha de Rescisão de Contrato
      begin
        subPath := 'RESCISAO';
        sNomeWF := '14_RESCISAO';
      end;
      15 : //Folha de Rescisão Complementar
      begin
        subPath := 'RESCISAO_COMPLEMENTAR';
        sNomeWF := '15_RESCISAO_COMPLEMENTAR';
      end;
      27 : //Folha de Abono Salarial
      begin
        subPath := 'ABONO_SALARIAL';
        sNomeWF := '27_ABONO_SALARIAL';
      end;
      36 : //Despesa com pessoal em quarentena
      begin
        subPath := 'QUARENTENA';
        sNomeWF := '36_QUARENTENA';
      end;
      53 : //Folha de Estágio
      begin
        subPath := 'ESTAGIO';
        sNomeWF := '53_ESTAGIO';
        iFlgAdiantaPgtoFerias := 1;
      end;
      57 : //Folha de Término de Estágio
      begin
        subPath := 'TERMINO_ESTAGIO';
        sNomeWF := '57_TERMINO_ESTAGIO';
        iFlgAdiantaPgtoFerias := 1;
      end;
      61 : //Pagamento de Conselheiro
      begin
        subPath := 'CONSELHEIRO';
        sNomeWF := '61_CONSELHEIRO';
      end;
      68 : //Despesas com pessoal cedido
      begin
        subPath := 'CEDIDO';
        sNomeWF := '68_CEDIDO';
      end;
    end;

    if rgProcesso.ItemIndex = 0 then
    begin
      path_Completo_LKP_Idpessoa := path_ArquivosParam + subPath + '\' + dataParaArquivos + '_lkp_idpessoa_p.txt';
      path_Completo_Ew := path_EventWait + subPath + '\EventWait_PreviaFolpag.ew';
    end
    else
    begin
      path_Completo_LKP_Idpessoa := path_ArquivosParam + subPath + '\' + dataParaArquivos + '_lkp_idpessoa_f.txt';
      path_Completo_Ew := path_EventWait + subPath + '\EventWait_FinalFolpag.ew';
    end;

    path_Completo_Param_Preparo := path_ArquivosParam + subPath + '\param_preparo.par';
    path_Completo_Param_Previa  := path_ArquivosParam + subPath + '\param_previa.par';
    path_Completo_Param_Final   := path_ArquivosParam + subPath + '\param_final.par';

    if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
      DBConnectionCM := 'RPROD_ETL_FOLHA_FUNCEF'
    else
      DBConnectionCM := 'TIBERO_ETL_FOLHA_FUNCEF';

    Result := True;
  end;

  function insereControleETL : Boolean;
  begin
    Progresso(['Inserindo controles para o processamento - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    sSql := 'insert into cm.etl_folha_funcef (id, idusuario, data_inicio, ' +
    ' idmotivo, anomesref, data_pagamento, processo, idpessoa_lista)' +
    ' values ( ' + IntToStr(idProcesso) + ', ' + IntToStr(Sistema.IdUsuario) + ', ' +
    ' sysdate, ' + dblckMotivo.LookupValue + ', ' + QuotedStr(anoMesRef) + ', ' + QuotedStr(dataPagamento) +
    ', ' + IntToStr(rgProcesso.ItemIndex) + ', ' + QuotedStr(sListaFuncSel) + ' )';

    if fu.ExecSQL(sSql) then
    begin
      fu.Commit;
      Result := True;
    end
    else
    begin
      fu.Rollback;
      Result := False;
    end;
  end;

  function insereLKP_Ipessoa : Boolean;
  var F : textFile;
  c : Integer;
  begin
    Progresso(['Montando lista de pessoas a serem processadas - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    AssignFile(F, path_Completo_LKP_Idpessoa);
    ReWrite(F);

    for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      inc(iQtdEmpregados);
      Writeln(F, ListaIdFunc[c]);
    end;

    Closefile(F);

    memResult.Lines.Add('Registros Processados: ' + IntToStr(iQtdEmpregados));
    memResult.Lines.Add('');

    sSql := 'update cm.etl_folha_funcef set qtd_empregados = ' + IntToStr(iQtdEmpregados) +
            ' where id = ' + IntToStr(idProcesso) ;

    if fu.ExecSQL(sSql) then
    begin
      fu.Commit;
      Result := True;
    end
    else
    begin
      fu.Rollback;
      Result := False;
    end;
  end;

  function insereBWParamPreparo : Boolean;
  var F : textFile;
  begin
    Progresso(['Montando arquivo de parâmetros para o Preparo - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    AssignFile(F, path_Completo_Param_Preparo);
    ReWrite(F);

    Writeln(F, '[FOLHA_FUNCEF.WF:WF_' + sNomeWF + '_100_PREPARO]');
    Writeln(F, '$ParamOwnerCM  =CM');
    Writeln(F, '$DBConnectionCM=' + DBConnectionCM);
    Writeln(F);
    Writeln(F, '$$id_Processo   =' + inttoStr(idProcesso));
    Writeln(F, '$$idPessoa_lista=' + sListaFuncSel);
    Writeln(F);
    Writeln(F, '$$param_ANOMES_REF=' + anoMesRef);
    Writeln(F, '$$param_NORMAL_INI=' + normal_Inicio);
    Writeln(F, '$$param_NORMAL_FIM=' + normal_Fim);
    Writeln(F);
    Writeln(F, '$ParamOutputFilename_Preparo    =' + dataParaArquivos + '_preparo.txt');
    Writeln(F, '$ParamOutputFilename_Integracoes=' + dataParaArquivos + '_lkp_integracoes.txt');
    Writeln(F, '$ParamLKP_Idpessoa_P            =' + dataParaArquivos + '_lkp_idpessoa_p.txt');

    Closefile(F);

    Result := True;
  end;

  function insereBWParamPrevia : Boolean;
  var F : textFile;
  begin
    Progresso(['Montando arquivo de parâmetros para a Prévia - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    AssignFile(F, path_Completo_Param_Previa);
    ReWrite(F);

    Writeln(F, '[FOLHA_FUNCEF.WF:WF_' + sNomeWF + '_200_PREVIA]');
    Writeln(F, '$ParamOwnerCM  =CM');
    Writeln(F, '$DBConnectionCM=' + DBConnectionCM);
    Writeln(F);
    Writeln(F, '$$id_Processo   =' + inttoStr(idProcesso));
    Writeln(F, '$$param_IDMOTIVO=' + dblckMotivo.LookupValue);
    Writeln(F, '$$idPessoa_lista=' + sListaFuncSel);
    Writeln(F);
    Writeln(F, '$$param_ANOMES_REF=' + anoMesRef);
    Writeln(F, '$$param_NORMAL_INI=' + normal_Inicio);
    Writeln(F, '$$param_NORMAL_FIM=' + normal_Fim);
    Writeln(F, '$$param_DATAPAGTO =' + dataPagamento);
    Writeln(F);
    Writeln(F, '$ParamSourceFilename_Preparo     =' + dataParaArquivos + '_preparo.txt');
    Writeln(F, '$ParamOutputFilename_PreviaFolpag=' + dataParaArquivos + '_previafolpag.txt');
    Writeln(F, '$ParamOutputFilename_ApagaPrevia =' + dataParaArquivos + '_delete_previafolpag.log');
    Writeln(F, '$ParamLKP_Integracoes            =' + dataParaArquivos + '_lkp_integracoes.txt');
    Writeln(F, '$ParamLKP_Idpessoa_P             =' + dataParaArquivos + '_lkp_idpessoa_p.txt');
    Writeln(F, '$ParamLKP_SomaHistrubsal         =' + dbedAno.Text + FU.PoeZero(wMesRef) + '_lkp_somahistrubsal.txt');

    Closefile(F);

    Result := True;
  end;

  function insereBWParamFinal : Boolean;
  var F : textFile;
  begin
    Progresso(['Montando arquivo de parâmetros para a Final - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    AssignFile(F, path_Completo_Param_Final);
    ReWrite(F);

    Writeln(F, '[FOLHA_FUNCEF.WF:WF_' + sNomeWF + '_350_FINAL]');
    Writeln(F, '$ParamOwnerCM  =CM');
    Writeln(F, '$DBConnectionCM=' + DBConnectionCM);
    Writeln(F);
    Writeln(F, '$$id_Processo             =' + inttoStr(idProcesso));
    Writeln(F, '$$param_IDMOTIVO          =' + dblckMotivo.LookupValue);
    Writeln(F, '$$FLG_ADIANTA_PAGTO_FERIAS=' + inttoStr(iFlgAdiantaPgtoFerias));
    Writeln(F);
    Writeln(F, '$$idPessoa_lista=' + sListaFuncSel);
    Writeln(F);
    Writeln(F, '$$param_ANOMES_REF=' + anoMesRef);
    Writeln(F, '$$param_DATAPAGTO =' + dataPagamento);
    Writeln(F);
    Writeln(F, '$ParamLKP_Idpessoa_F=' + dataParaArquivos + '_lkp_idpessoa_f.txt');

    Closefile(F);

    Result := True;
  end;

  function insereArquivosParamETL : Boolean;
  begin
    if not (insereLKP_Ipessoa) then
      Exit
    else
    if rgProcesso.ItemIndex = 0 then
    begin
      if not (insereBWParamPreparo) then
        Exit
      else
      if not (insereBWParamPrevia) then
        Exit;
    end
    else
    begin
      if not (insereBWParamFinal) then
        Exit;
    end;

    Result := True;
  end;

  function insereEventWaitETL : Boolean;
  var F : textFile;
  begin
    Progresso(['Iniciando o processamento - ETL', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;

    if FileExists(path_Completo_Ew) then
    begin
      Result := False;
      Exit;
    end
    else
    begin
      Sleep(30000); //Aguardo 30 segundos antes de colocar o arquivo no path do EventWait para garantir que o WF foi totalmente finalizado da execução anterior
      
      AssignFile(F, path_Completo_Ew);
      ReWrite(F);
      Closefile(F);

      Result := True;
    end;
  end;
begin
  try
    //Quantidade de processos para atualizar no frmProgresso_GeraCalc
    iQtdProcessos := 10;

    //Inicia variáveis
    iFlgAdiantaPgtoFerias := -1;

    Progresso(['Processo iniciado ...', '', 0, '', iQtdProcessos, 1]);
    Application.ProcessMessages;
    Sleep(5000); //Só pra mensagem ficar na tela por 5 segundos antes de ir pra próxima

    if not (verificaStatusETL) then
    begin
      MsgDlg('Existe um processo em execução, aguarde!' +#10#13 + #10#13+
             'Usuário: ' + sUsuarioProcessoAtivo + #10#13+
             'Início: ' + sDataInicioProcessoAtivo + #10#13+
             'Qtd: ' + sQtdEmpregadosProcessoAtivo, 'Aviso', mtInformation, [mbOK], 0);
      Exit;
    end
    else
    if not (buscaParamETL) then
    begin
      MsgDlg('Problemas ao buscar as parametrizações para o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
      Exit;
    end
    else
    if not (preparaDados) then
    begin
      MsgDlg('Problemas ao preparar os dados para o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
      Exit;
    end
    else
    begin
      if not (insereControleETL) then
      begin
        MsgDlg('Problemas ao inserir as informações de controle para o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
        Exit;
      end
      else
      begin
        if not (insereArquivosParamETL) then
        begin
          MsgDlg('Problemas ao indicar os arquivos de parâmetros para o ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
          Exit;
        end
        else
        begin
          if not (insereEventWaitETL) then
          begin
            MsgDlg('Problemas ao iniciar o processamento em ETL - Verifique com a equipe GETEC', 'Erro', mtError, [mbOK], 0);
            Exit;
          end
          else
          begin
            iContador := 0;
            iContadorAborta := 0;

            if iTempoAborta <> 0 then
              iContadorAborta := Trunc((iTempoAborta / iTempoRepete));

            Result := True;

            Progresso(['Processo de geração da folha em execução pelo ETL', '', iQtdEmpregados, '', iQtdProcessos, 1]);
            Application.ProcessMessages;

            while not (verificaStatusETL) do
            begin
              Progresso(['Processo de geração da folha em execução pelo ETL', '', iQtdEmpregados]); //Não atualizar progresso
              Application.ProcessMessages;

              Sleep(iTempoRepete);
              inc(iContador);

              if (iContadorAborta <> 0) and (iContador = iContadorAborta) then
              begin
                Result := False;

                MsgDlg('Processo atingiu o tempo limite de espera e foi abortado no PLANUS. ' +
                       'Verifique com a equipe GETEC o status do processamento no ETL', 'Erro', mtError, [mbOK], 0);
                Break;
              end;

            end;

            Progresso(['Processo de geração da folha FINALIZADO', '', iQtdEmpregados, '', iQtdProcessos, 1]);
            Application.ProcessMessages;
          end;
        end;
      end;
    end;
  except
    On E : Exception do
    Begin
      Result := False;
      MsgDlg('Erro: ' + E.Message, 'Erro', mtError, [mbOK], 0);
    End;
  end;
end;
//Everson Cunha - WO 3960 - Fim

//Everson Cunha - WO 3960 - Início
procedure TfrmGeraCalc.dblckMotivoChange(Sender: TObject);
begin
  inherited;

  if CdsMotivo.FieldByName('flg_etl').AsString = 'N' then
  begin
    chkETL.Checked := False;
    chkETL.Enabled := False;
  end
  else
  if CdsMotivo.FieldByName('flg_etl').AsString = 'S' then
  begin
    chkETL.Checked := False;
    chkETL.Enabled := True;
  end
  else
  if CdsMotivo.FieldByName('flg_etl').AsString = 'O' then
  begin
    chkETL.Checked := True;
    chkETL.Enabled := False;
  end;

  //wo18459 - Leandro
  // Preencher Lista dos Empregados
  CriarListaEmpregados(false);

end;
//Everson Cunha - WO 3960 - Fim

//Everson Cunha - WO 3960 - Início
procedure TfrmGeraCalc.chkETLClick(Sender: TObject);
begin
  inherited;

  chklstRubrica.Enabled := not(chkETL.Checked);
end;
//Everson Cunha - WO 3960 - Fim

end.
