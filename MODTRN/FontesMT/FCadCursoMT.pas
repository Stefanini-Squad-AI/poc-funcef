unit fCadCursoMT;

{-------------------------------------------------------------------------------------------------
Nº SIG......: 78744
Data........: 23/11/2018
Responsável.: Everson Cunha
Descrição...: Alterar a forma de gravação, para primeiro gravar o registro pai (curso) e depois
              o registro filho (turma). Tibero
---------------------------------------------------------------------------------------------------
Nº SOL......: 44964
Data........: 24/05/2017
Responsável.: Peterson Victor
Descrição...: Atualizar a HSTTRN quando alterar a TURMA
---------------------------------------------------------------------------------------------------
Nº SOL......: 223297/17219
Nº PPM......: 800924
Data........: 25/05/2015
Responsável.: Petri Nocentini
Descrição...: Permitir cadastrar um curso com valor custo igual a zero
---------------------------------------------------------------------------------------------------
Nº SOL......: 245968
Nº PPM......: 635851
Data........: 09/03/2015
Responsavel.: Wylliam Leite da Silva
Descrição...: Coreções no cadastro de cursos
Rotinas.....: .pas
--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: .dfm
--------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect, Db,
  DBClient, uCMClientDataSet, FCadastroMestreDetMT, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, TREdit, wwdblook, Mask, DBCtrls,
  uCtrlCurso, uCtrlRegTrein, uCtrlCursoxAvalDes, uCmSqlParams, uCtrlCursoxFatorAval,
  wwdbdatetimepicker, CMDateTimePicker, CMProcura, uCtrlTurma, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, dxDBELib, uCtrlFuncoesRH, Provider, DBGrids;

type
  TfrmCadCursoMT = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    dblcUnidNegocio: TwwDBLookupCombo;
    dblcEntid: TwwDBLookupCombo;
    CdsEntid: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    dsDet2: TwwDataSource;
    cdsUnidNegocio: TCMClientDataSet;
    dblcSigla: TwwDBLookupCombo;
    Label16: TLabel;
    CdsSiglas: TCMClientDataSet;
    DsSiglas: TwwDataSource;
    tbInscritos: TTabSheet;
    dbgrdInscr: TwwDBGrid;
    cdsInscritos: TCMClientDataSet;
    dsInscr: TwwDataSource;
    pnlTurma: TPanel;
    cdsIntDisp: TCMClientDataSet;
    cdsExtDisp: TCMClientDataSet;
    cdsIntSel: TCMClientDataSet;
    cdsExtSel: TCMClientDataSet;
    dsIntDisp: TDataSource;
    dsIntSel: TDataSource;
    dsExtdDisp: TDataSource;
    dsExtSel: TDataSource;
    dsConteudo: TDataSource;
    cdsConteudo: TCMClientDataSet;
    MsCidades: TMontaSelect;
    CdsCidade: TCMClientDataSet;
    pgcDados: TPageControl;
    tsDados: TTabSheet;
    tsConteudo: TTabSheet;
    tsInstrutores: TTabSheet;
    Label4: TLabel;
    dbeTurma: TDBEdit;
    grpCidade: TGroupBox;
    CmpCidades: TCMProcura;
    dbeUF: TDBEdit;
    grpDatas: TGroupBox;
    Label5: TLabel;
    Label15: TLabel;
    dtedtIni: TCMDateTimePicker;
    dtedtFim: TCMDateTimePicker;
    grpHora: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    dtehrFim: TCMDateTimePicker;
    dtehrIni: TCMDateTimePicker;
    grpCargaHora: TGroupBox;
    dbeCarga: TDBRealEdit;
    grpValor: TGroupBox;
    dbeValor: TDBRealEdit;
    Label12: TLabel;
    dbeConteudo: TDBMemo;
    Label3: TLabel;
    dbeObserva: TDBMemo;
    grpStatusFuncional: TGroupBox;
    chkAtivos: TCheckBox;
    chkAfastados: TCheckBox;
    chkDemitidos: TCheckBox;
    grp7: TGroupBox;
    lblCCustoDisp: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnAdicionaInt: TSpeedButton;
    btnRemoveInt: TSpeedButton;
    btnAdicionaExt: TSpeedButton;
    btnRemoveExt: TSpeedButton;
    cdsCursoAvalDes: TCMClientDataSet;
    cdsFatorAval: TCMClientDataSet;
    dbeCidNome: TDBEdit;
    grdIntDisp: TDBGrid;
    grdIntSel: TDBGrid;
    grdExtDisp: TDBGrid;
    grdExtSel: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcEntidEnter(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmpCidadesValidaDados(Sender: TObject);
    procedure dbedDescrKeyPress(Sender: TObject; var Key: Char);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CdsDetAfterOpen(DataSet: TDataSet);
    procedure chkAtivosClick(Sender: TObject);
    procedure btnAdicionaIntClick(Sender: TObject);
    procedure btnRemoveIntClick(Sender: TObject);
    procedure btnAdicionaExtClick(Sender: TObject);
    procedure btnRemoveExtClick(Sender: TObject);
    procedure chkAfastadosClick(Sender: TObject);
    procedure chkDemitidosClick(Sender: TObject);
    procedure grdIntDisp1DblClick(Sender: TObject);
    procedure grdIntSel1DblClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CdsDetAfterScroll(DataSet: TDataSet);
    procedure cdsInscritosAfterOpen(DataSet: TDataSet);
    procedure grdIntDispCellClick(Column: TColumn);
    procedure grdIntDispDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdIntSelCellClick(Column: TColumn);
    procedure grdExtDispCellClick(Column: TColumn);
    procedure grdExtSelCellClick(Column: TColumn);
    procedure dbeTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnApagarClick(Sender: TObject);
  private
    sListaInstExtSel: TStringList; // Wylliam Leite - SOL:245968 PPM:635851
    sListaInstIntSel: TStringList; // Wylliam Leite - SOL:245968 PPM:635851

    CtrlRegTrein: TCtrlRegTrein;

    CtrlCursoxAvalDes  : TCtrlCursoxAvalDes;
    CtrlCursoxFatorAval: TCtrlCursoxFatorAval;

    CtrlCurso   : TCtrlCurso;
    CtrlTurma   : TCtrlTurma;

    rVlrCurso     : currency;
    bAplicaFiltro : boolean;

    function  GravarRegistro(Exclusao: boolean): boolean;
    procedure Sel(IdCurso: double);
    procedure MoveInstutores( TipoInstrutor : tpInstrutores; cdsOrigem, cdsDestino : TCMClientDataSet; const iIdTurma : integer = -1);

    procedure CarregaInstrutores;
    procedure FiltraInstrutoresInternos;
    procedure FiltraInstrutoresTurma(cdsInstrutor : TCMClientDataSet; iIdTurma : string );
    procedure AtualizaRateioInscritos(rValor : currency);
    function  ValidaDadosTuma : boolean;

    procedure Marca(cdsDados :  TCMClientDataSet);

    // Wylliam Leite - SOL:245968 PPM:635851
    function PegaInstExtSel(prCds: TCMClientDataSet): TStringList;
    // Wylliam Leite - SOL:245968 PPM:635851
    function PegaInstIntSel(prCds: TCMClientDataSet): TStringList;
  end;

var
  frmCadCursoMT: TfrmCadCursoMT;
  msgresult: Integer; //Petri SOL 223297/17219 PPM 800924

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, dCds;

{$R *.DFM}


procedure TfrmCadCursoMT.FormCreate(Sender: TObject);
begin
  inherited;

  CmeDetalhe.RepetirInsert := false;

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlTurma := TCtrlTurma.Create;
  CtrlTurma.InitializeAs(Padroes);

  CtrlCursoxAvalDes  := TCtrlCursoxAvalDes.Create;
  CtrlCursoxAvalDes.InitializeAs(Padroes);

  CtrlCursoxFatorAval := TCtrlCursoxFatorAval.Create;
  CtrlCursoxFatorAval.InitializeAs(Padroes);

  CtrlRegTrein := TCtrlRegTrein.Create(true, Sistema.UsaRAD, false, false, Sistema.IdEmpresa,
    Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  // mantem esses dois vinculos de cds apenas para apagar dados antigos
  CtrlCurso.CdsDet  := cdsCursoAvalDes;
  CtrlCurso.CdsDet2 := cdsFatorAval;
  // ------------------------------

  CtrlCurso.Cds          := Cds;
  CtrlTurma.Cds          := CdsDet;
  CtrlTurma.CdsInstInt   := CdsIntSel;
  CtrlTurma.CdsInstExt   := CdsExtSel;
  CtrlTurma.CdsInscritos := CdsInscritos;

  cdsInscritos.data := CtrlTurma.ListaInscritosTurma( -1 );

  cdsUnidNegocio.Data := CtrlCurso.ListUnidNegoc;
  CdsSiglas.Data      := CtrlCurso.ListSiglas;
  CdsEntid.Data       := CtrlRegTrein.ListEntid;

  CmeCadastro.RepetirInsert := false;

  bAplicaFiltro       := false;

  Sel(-1);

  // Wylliam Leite - SOL:245968 PPM:635851
  sListaInstExtSel:= TStringList.Create;

  // Wylliam Leite - SOL:245968 PPM:635851
  sListaInstIntSel:= TStringList.Create;
end;

procedure TfrmCadCursoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCurso);
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlTurma);
  FreeAndNil(CtrlCursoxAvalDes);
  FreeAndNil(CtrlCursoxFatorAval);
  FreeAndNil(sListaInstExtSel); // Wylliam Leite - SOL:245968 PPM:635851
  FreeAndNil(sListaInstIntSel); // Wylliam Leite - SOL:245968 PPM:635851
  inherited;
end;

procedure TfrmCadCursoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCursoMT.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;

  cds.FieldByName('IDCURSO').AsInteger := CtrlCurso.GetCodigo();

  // cria estrutura para preenchimento dos instrutores
  cdsIntSel.data  := CtrlTurma.ListaInstrutorInternoTurma(-1);
  cdsExtSel.data  := CtrlTurma.ListaInstrutorExternoTurma(-1);

end;

procedure TfrmCadCursoMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadCursoMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadCursoMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadCursoMT.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedDescr.CanFocus) then
    dbedDescr.SetFocus;
end;

procedure TfrmCadCursoMT.dblcEntidEnter(Sender: TObject);
begin
  inherited;
  if (dbedCodigo.Text <> '') then
    CdsEntid.Data := CtrlRegTrein.ListEntid(Cds.FieldByName('IDCURSO').asFloat);
end;

procedure TfrmCadCursoMT.bbtnOkDetClick(Sender: TObject);
begin
  if not ValidaDadosTuma() then
     Abort;

  CtrlTurma.AtualizaDataHistorico(cdsDet.FieldByName('IDTURMA').AsInteger,cdsDet.FieldByName('IDCURSO').AsInteger,dtedtIni.Text,dtedtFim.Text); //Peterson Victor SIG44864

  cdsDet.FieldByName('HRINI').AsString := dtehrIni.text;
  cdsDet.FieldByName('HRFIM').AsString := dtehrFim.text;

  inherited;
end;

procedure TfrmCadCursoMT.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedDescr.Text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha o Título.', 'Aviso', mtWarning, [mbOk], 0);
    dbedDescr.SetFocus;
    Abort;
  end;

  if (Trim(dblcSigla.Text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Sigla.', 'Aviso', mtWarning, [mbOk], 0);
    dblcSigla.SetFocus;
    Abort;
  end;


  if (Trim(dblcUnidNegocio.Text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Atividade/Projeto', 'Aviso', mtWarning, [mbOk], 0);
    dblcUnidNegocio.SetFocus;
    Abort;
  end;

  if (Trim(dblcEntid.Text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Empresa/Entidade.', 'Aviso', mtWarning, [mbOk], 0);
    dblcEntid.SetFocus;
    Abort;
  end;

  if (Cds.FieldByName('DUR_TEOR').IsNull) then
     Cds.FieldByName('DUR_TEOR').asInteger := 0;
  if (Cds.FieldByName('DUR_PRAT').IsNull) then
     Cds.FieldByName('DUR_PRAT').asInteger := 0;

  if (cdsDet.State in [dsInsert, dsEdit]) and (not ValidaDadosTuma) then
     Abort;

  bInserindo := (Cds.State = dsInsert);

  inherited;
  if not(bInserindo) then
     CmeCadastroFind(Sender);

  // Wylliam Leite - SOL:245968 PPM:635851
  //Inicio
  cds.Close;
  cdsDet.Close;
  FormCreate(Self);
  CmeCadastro.RepetirInsert:= False;
  CmeCadastroAtualizaBotoes(Sender);
  //Fim
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadCursoMT.Sel(IdCurso: double);
begin
  Cds.Data          := CtrlCurso.ListGeral(IdCurso);
  CdsDet.Data       := CtrlTurma.ListaTurma(IdCurso);

  // deixa client filtrado para mostrar apenas ativos
  cdsDet.Filtered := false;
  cdsDet.Filter   := 'FLGDEL = ''N'' ';
  cdsDet.Filtered := true;

  // cria estrutura para preenchimento dos instrutores
  cdsIntSel.data  := CtrlTurma.ListaInstrutorInternoCurso(IdCurso);
  cdsExtSel.data  := CtrlTurma.ListaInstrutorExternoCurso(IdCurso);

  // Wylliam Leite - SOL:245968 PPM:635851
  sListaInstExtSel := PegaInstExtSel(cdsExtSel);
  sListaInstIntSel := PegaInstIntSel(cdsIntSel);

  // mantem esses clients preenchidos para para apagar dados antigos via ctrl
  cdsCursoAvalDes.Data := CtrlCursoxAvalDes.ListCursoxAvalDes(IdCurso);
  cdsFatorAval.Data    := CtrlCursoxFatorAval.ListCursoxFatorAval(IdCurso);
  //-----------------------------------------------------------------------
end;

function TfrmCadCursoMT.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
  begin
    CdsDet.DisableControls;
    Result := CtrlTurma.Gravar(false);
    if Result then
       Result := CtrlCurso.Excluir;
    CdsDet.EnableControls;
  end
  else
  begin
    CdsDet.DisableControls;
//    Result := CtrlTurma.Gravar(false); //Everson Cunha - SIG78744
      Result := CtrlCurso.Gravar(false); //Everson Cunha - SIG78744
    if Result then
//       Result := CtrlCurso.Gravar;     //Everson Cunha - SIG78744
      Result := CtrlTurma.Gravar(True);  //Everson Cunha - SIG78744
    CdsDet.EnableControls;
  end;

  if not(Result) then
    raise Exception.Create(CtrlCurso.MessageInfo);
end;

procedure TfrmCadCursoMT.CmpCidadesValidaDados(Sender: TObject);
begin
  inherited;
   if MsCidades.RetornouValor then
   begin
     //cdsDet.FieldByName('IDCIDADES').AsString := MsCidades.ValoresChave[0];

     dbeUF.Text      := MsCidades.ValoresChave[1];
     dbeCidNome.Text := CmpCidades.text;
   end;
end;

procedure TfrmCadCursoMT.dbedDescrKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['A'..'Z', 'a'..'z', '0'..'9', ' ', #08]) then
    key := #0;
end;

procedure TfrmCadCursoMT.CmeCadastroDelete(Sender: TObject);
begin
  // chega se esta vinculado
  if not CdsDet.isEmpty then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Não é possível excluir o registro. O curso está sendo utilizado.', 'Aviso', mtWarning, [mbOk], 0);
    Abort;
  end;

  inherited;
end;

procedure TfrmCadCursoMT.CdsDetAfterOpen(DataSet: TDataSet);
begin
  TFloatField(CdsDet.FieldByName('VALORCURSO')).DisplayFormat := '#,##0.00';
end;

procedure TfrmCadCursoMT.chkAtivosClick(Sender: TObject);
begin
  FiltraInstrutoresInternos();
end;

procedure TfrmCadCursoMT.btnAdicionaIntClick(Sender: TObject);
begin
  MoveInstutores(tpInternos, cdsIntDisp, cdsIntSel, cdsDet.FieldByName('IDTURMA').AsInteger);
end;

procedure TfrmCadCursoMT.btnRemoveIntClick(Sender: TObject);
begin
  MoveInstutores(tpInternos, cdsIntSel, cdsIntDisp);
end;

procedure TfrmCadCursoMT.btnAdicionaExtClick(Sender: TObject);
begin
  MoveInstutores(tpExternos, cdsExtDisp, cdsExtSel, cdsDet.FieldByName('IDTURMA').AsInteger);
end;

procedure TfrmCadCursoMT.btnRemoveExtClick(Sender: TObject);
begin
  MoveInstutores(tpExternos, cdsExtSel, cdsExtDisp);
end;

procedure TfrmCadCursoMT.MoveInstutores(TipoInstrutor: tpInstrutores;
  cdsOrigem, cdsDestino: TCMClientDataSet; const iIdTurma : integer);
var
  bJaExiste : boolean;
  sFiltro   : string;
begin
  sFiltro := cdsOrigem.Filter;

  cdsOrigem.DisableControls;
  cdsOrigem.Filtered := false;
  cdsOrigem.Filter   := 'SEL = ''S'' ';
  cdsOrigem.Filtered := true;
  while not cdsOrigem.eof do
  begin
    // verifica se já existe
    bJaExiste := cdsDestino.Locate('IDPESSOA;IDTURMA',  VarArrayOf([cdsOrigem.FieldByName('IDPESSOA').AsInteger, iIdTurma]), [loPartialKey]);

    if not bJaExiste then
    begin
      cdsDestino.Insert;
      cdsDestino.FieldByName('SEL').AsString  := 'N';
      cdsDestino.FieldByName('NOME').AsString := cdsOrigem.FieldByName('NOME').AsString;
      cdsDestino.FieldByName('IDPESSOA').AsInteger := cdsOrigem.FieldByName('IDPESSOA').AsInteger;
      if TipoInstrutor = tpInternos then
        cdsDestino.FieldByName('MATRICULA').AsString := cdsOrigem.FieldByName('MATRICULA').AsString
      else
        cdsDestino.FieldByName('IDINSTEXT').AsInteger := cdsOrigem.FieldByName('IDINSTEXT').AsInteger;

      if iIdTurma > 0 then
         cdsDestino.FieldByName('IDTURMA').AsInteger := iIdTurma;

      cdsDestino.Post;
    end;

    cdsOrigem.Delete;
  end;
  cdsOrigem.Filtered := false;
  cdsOrigem.Filter   := sFiltro;
  cdsOrigem.Filtered := true;
  cdsOrigem.EnableControls;
end;


procedure TfrmCadCursoMT.FiltraInstrutoresInternos;
var
  sSitFunc : string;
begin
  if bAplicaFiltro then
  begin                                
    sSitFunc := FU.GerarListaSitFuncSel(chkAtivos.Checked, chkAfastados.Checked, chkDemitidos.Checked, true);
    cdsIntDisp.Data := CtrlTurma.ListaFuncionarios(sSitFunc, '', sListaInstIntSel);
  end;
end;

procedure TfrmCadCursoMT.chkAfastadosClick(Sender: TObject);
begin
  FiltraInstrutoresInternos();
end;

procedure TfrmCadCursoMT.chkDemitidosClick(Sender: TObject);
begin
  FiltraInstrutoresInternos();
end;

procedure TfrmCadCursoMT.grdIntDisp1DblClick(Sender: TObject);
begin
//  Marca(cdsIntDisp);
end;

procedure TfrmCadCursoMT.grdIntSel1DblClick(Sender: TObject);
begin
  Marca(cdsIntSel);
end;

procedure TfrmCadCursoMT.Marca(cdsDados: TCMClientDataSet);
var
  sValor : string;
begin
  sValor := cdsDados.FieldByName('SEL').AsString;

  cdsDados.Edit;
  cdsDados.FieldByName('SEL').AsString :=  FU.IFF(sValor = 'N', 'S', 'N');
  cdsDados.Post;
end;


procedure TfrmCadCursoMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dtehrini.ClearDateTime;
  dtehrfim.ClearDateTime;

  pgcDados.activePage := tsDados;

  CarregaInstrutores();

  // atribui o código do curso para turma
  cdsDet.FieldByName('IDCURSO').AsString  := dbedCodigo.Text;
  cdsDet.FieldByName('IDTURMA').AsInteger := CtrlTurma.GetCodigo();
  cdsDet.FieldByName('FLGDEL').AsString   := 'N';


  // deixa instrutores já filtrados pelo id da turma
  FiltraInstrutoresTurma(cdsIntSel, cdsDet.FieldByName('IDTURMA').AsString);
  FiltraInstrutoresTurma(cdsExtSel, cdsDet.FieldByName('IDTURMA').AsString);

end;

procedure TfrmCadCursoMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dtehrini.ClearDateTime;
  dtehrfim.ClearDateTime;

  dteHrIni.Time := EncodeTime( StrToIntDef(Copy(cdsDet.FieldByName('HRINI').AsString,1,2),0),
                               StrToIntDef(Copy(cdsDet.FieldByName('HRINI').AsString,4,2),0), 0, 0 );

  dteHrFim.Time := EncodeTime( StrToIntDef(Copy(cdsDet.FieldByName('HRFIM').AsString,1,2),0),
                               StrToIntDef(Copy(cdsDet.FieldByName('HRFIM').AsString,4,2),0), 0, 0 );

  CarregaInstrutores();

  // deixa instrutores já filtrados pelo id da turma
  FiltraInstrutoresTurma(cdsIntSel, cdsDet.FieldByName('IDTURMA').AsString);
  FiltraInstrutoresTurma(cdsExtSel, cdsDet.FieldByName('IDTURMA').AsString);

  pgcDados.activePage := tsDados;

  rVlrCurso := dbeValor.Value;
end;

procedure TfrmCadCursoMT.CmeDetalheApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  if (rVlrCurso <> dbeValor.Value) and (not cdsInscritos.IsEmpty) and (cdsDet.State in [dsEdit])then
  begin
    cdsDet.FieldByName('FLGATUINSCRITOS').AsString := 'S';

    AtualizaRateioInscritos( cdsDet.FieldByName('VALORCURSO').AsCurrency );
    rVlrCurso := dbeValor.Value;
  end;

//  Accept := CtrlTurma.Gravar(false, (rVlrCurso <> dbeValor.Value) and (not cdsInscritos.IsEmpty), dbeValor.Value );
end;

procedure TfrmCadCursoMT.CmeDetalheDelete(Sender: TObject);
begin
  cdsDet.Edit;
  cdsDet.FieldByName('FLGDEL').AsString := 'S';
  cdsDet.Post;
end;

procedure TfrmCadCursoMT.CarregaInstrutores;
begin
  // desativa filtragem pela situação funcional
  bAplicaFiltro := false;
  chkAtivos.checked    := true;
  chkAfastados.Checked := false;
  chkDemitidos.checked := false;
  bAplicaFiltro := true;

  // carrega instrutores
  chkAtivosClick(chkAtivos);
  // Wylliam Leite - SOL:245968 PPM:635851
  // Adicionado o parametro na função
  cdsExtDisp.data := CtrlTurma.ListaInstrutorExterno(sListaInstExtSel);
end;

procedure TfrmCadCursoMT.CdsDetAfterScroll(DataSet: TDataSet);
begin
  // carrega inscritos
  if not cdsDet.ControlsDisabled then
  begin
    cdsInscritos.data := CtrlTurma.ListaInscritosTurma( cdsDet.FieldByName('IDTURMA').AsInteger );

    if cdsDet.FieldByName('FLGATUINSCRITOS').AsString = 'S' then
       AtualizaRateioInscritos( cdsDet.FieldByName('VALORCURSO').AsCurrency );
  end;
end;

procedure TfrmCadCursoMT.FiltraInstrutoresTurma(
  cdsInstrutor: TCMClientDataSet; iIdTurma: string);
begin
  cdsInstrutor.Filtered := false;
  cdsInstrutor.Filter   := 'IDTURMA = '+iIdTurma;
  cdsInstrutor.Filtered := true;
end;

procedure TfrmCadCursoMT.AtualizaRateioInscritos(rValor : currency);
var
  rRateio : currency;
begin
  rRateio := (rValor / CdsInscritos.recordCount);

  // atualizando apenas na tela
  CdsInscritos.DisableControls;
  CdsInscritos.first;
  while not CdsInscritos.eof do
  begin
    CdsInscritos.edit;
    CdsInscritos.FieldByName('VALOR').AsCurrency := rRateio;
    CdsInscritos.Post;

    CdsInscritos.next;
  end;
  CdsInscritos.first;
  CdsInscritos.EnableControls;
end;

procedure TfrmCadCursoMT.cdsInscritosAfterOpen(DataSet: TDataSet);
begin
  TFloatField(CdsInscritos.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
end;

function TfrmCadCursoMT.ValidaDadosTuma: boolean;
begin
  Result := true;

  if pgcDados.ActivePageIndex <> 0 then
     pgcDados.ActivePage := tsDados;

  if (Trim(dbeTurma.Text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Turma.', 'Aviso', mtWarning, [mbOk], 0);
    if (pgctrlDetalhe.ActivePage = tbsDet) then
       dbeTurma.SetFocus;
    Result := false;
  end;

  if (Result) and (Trim(CmpCidades.text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Cidade.', 'Aviso', mtWarning, [mbOk], 0);
    Result := false;
  end;

  if (Result) and (Trim(dteDtIni.Text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Data Inicio.', 'Aviso', mtWarning, [mbOk], 0);
    Result := false;
  end;

  if (Result) and (Trim(dteDtFim.Text) = '') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Data Fim.', 'Aviso', mtWarning, [mbOk], 0);
    Result := false;
  end;

  if (Result) and (dteDtIni.date > dteDtFim.date) then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Data Final não pode ser menor que Data Inicial.', 'Aviso', mtWarning, [mbOk], 0);
    if (pgctrlDetalhe.ActivePage = tbsDet) then
       dteDtIni.SetFocus;
    Result := false;
  end;

  if (Result) and (Trim(dteHrIni.Text) = '00:00') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Hora Inicio.', 'Aviso', mtWarning, [mbOk], 0);
    if (pgctrlDetalhe.ActivePage = tbsDet) then
       dteHrIni.SetFocus;
    Result := false;
  end;

  if (Result) and (Trim(dteHrFim.Text) = '00:00') then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Hora Fim.', 'Aviso', mtWarning, [mbOk], 0);
    if (pgctrlDetalhe.ActivePage = tbsDet) then
       dteHrFim.SetFocus;
    Result := false;
  end;

  if (Result) and (dteHrIni.Time >= dteHrFim.Time) then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Hora de Fim não pode ser menor que Hora de Início.', 'Aviso', mtWarning, [mbOk], 0);
    if (pgctrlDetalhe.ActivePage = tbsDet) then
       dteHrIni.SetFocus;
    Result := false;
  end;

  if (Result) and (dbeCarga.Value = 0) then
  begin
    // Wylliam Leite - SOL:245968 PPM:635851
    MsgDlg('Preencha a Carga Horária.', 'Aviso', mtWarning, [mbOk], 0);
    if (pgctrlDetalhe.ActivePage = tbsDet) then
       dbeCarga.SetFocus;
    Result := false;
  end;

  //if (Result) and (dbeValor.value = 0) then
  //begin
  //  MsgDlg('Preencha o Valor do Curso.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
  //  if (pgctrlDetalhe.ActivePage = tbsDet) then
  //     dbeValor.SetFocus;
  // Result := false;
  //end;
  //Petri SOL 223297/17219 PPM 800924
  if (Result) and (dbeValor.value = 0) then
  begin
       msgresult := MsgDlg('Valor do curso igual a zero.'+#13+#10+'Deseja continuar?', 'Aviso',mtWarning, [mbYes, mbNo],0);
       if msgresult = mrNo then
          begin
          dbeValor.SetFocus;
          Result := false;
          end;
  end;

end;

procedure TfrmCadCursoMT.grdIntDispCellClick(Column: TColumn);
begin
  // Wylliam Leite - SOL:245968 PPM:635851
  if (cdsIntDisp.FieldByName('NOME').AsString = '') then
     Exit;

  cdsIntDisp.Edit;
  cdsIntDisp.FieldByName('SEL').AsString :=  FU.IFF(cdsIntDisp.FieldByName('SEL').AsString = 'N', 'S', 'N');
  cdsIntDisp.Post;
end;

procedure TfrmCadCursoMT.grdIntDispDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if Column.FieldName = 'SEL' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
//    grdIntDisp.Canvas.FillRect(Rect);
    iCheck := 0;
    if TDBGrid(Sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    //if cdsIntDisp.FieldByName('SEL').AsString = 'S' then
       iCheck := DFCS_CHECKED
    else
       iCheck := 0;
    rRect := Rect;
    InflateRect(rRect,-2,-2);
    //DrawFrameControl(grdIntDisp.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;
end;

procedure TfrmCadCursoMT.grdIntSelCellClick(Column: TColumn);
begin
  // Wylliam Leite - SOL:245968 PPM:635851
  if (cdsIntSel.FieldByName('NOME').AsString = '') then
     Exit;
     
  cdsIntSel.Edit;
  cdsIntSel.FieldByName('SEL').AsString :=  FU.IFF(cdsIntSel.FieldByName('SEL').AsString = 'N', 'S', 'N');
  cdsIntSel.Post;
end;

procedure TfrmCadCursoMT.grdExtDispCellClick(Column: TColumn);
begin
  // Wylliam Leite - SOL:245968 PPM:635851
  if (cdsExtDisp.FieldByName('NOME').AsString = '') then
     Exit;

  cdsExtDisp.Edit;
  cdsExtDisp.FieldByName('SEL').AsString :=  FU.IFF(cdsExtDisp.FieldByName('SEL').AsString = 'N', 'S', 'N');
  cdsExtDisp.Post;
end;

procedure TfrmCadCursoMT.grdExtSelCellClick(Column: TColumn);
begin
  // Wylliam Leite - SOL:245968 PPM:635851
  if (cdsExtSel.FieldByName('NOME').AsString = '') then
     Exit;

  cdsExtSel.Edit;
  cdsExtSel.FieldByName('SEL').AsString :=  FU.IFF(cdsExtSel.FieldByName('SEL').AsString = 'N', 'S', 'N');
  cdsExtSel.Post;
end;

procedure TfrmCadCursoMT.dbeTurmaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['A'..'Z', 'a'..'z', '0'..'9', ' ', #08]) then
    key := #0;
end;

procedure TfrmCadCursoMT.sbtnApagarClick(Sender: TObject);
var
   QtdRegs: integer;
begin
   QtdRegs:= cds.RecordCount;
  inherited;

  // Wylliam Leite - SOL:245968 PPM:635851
  //Inicio
  if QtdRegs > cds.RecordCount then
  begin
    cds.Close;
    cdsDet.Close;
    FormCreate(Self);
    CmeCadastro.RepetirInsert:= False;
    CmeCadastroAtualizaBotoes(Sender);
  end;
  //Fim
end;

function TfrmCadCursoMT.PegaInstExtSel(
  prCds: TCMClientDataSet): TStringList;
begin
    with (prCds) do
    begin
         First;
         while not (Eof) do
         begin
              sListaInstExtSel.Add(FieldByName('IDPESSOA').AsString);
              Next;
         end;
    end;
    result:= sListaInstExtSel;
end;

function TfrmCadCursoMT.PegaInstIntSel(
  prCds: TCMClientDataSet): TStringList;
begin
    with (prCds) do
    begin
         First;
         while not (Eof) do
         begin
              sListaInstIntSel.Add(FieldByName('IDPESSOA').AsString);
              Next;
         end;
    end;
    result:= sListaInstIntSel;
end;

end.
