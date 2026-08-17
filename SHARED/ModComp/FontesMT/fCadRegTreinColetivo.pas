unit fCadRegTreinColetivo;

{***************************************************************************************************
Nº SOL......: 245965
Nº PPM......: 635849
Data........: 25/02/2015
Responsável.: Wylliam Leite da Silva         
Descrição...: Ajustes na funcionalidade Registro de Treinamento
Rotinas.....: .pas (Correção no erro da passagem da grido de não inscritos para
              inscritos: método:  FuncionarioJaInscrito)
***************************************************************************************************
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: .dfm (exclusão abas avaliação, mudança na aba cursos)
****************************************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, StdCtrls, Mask, DBCtrls, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCtrlRegTrein,
  uCtrlCurso, uCtrlTurma, TREdit, uCtrlFuncoesRH, DBGrids, Wwdbgrd2,
  DBTables;

type
  TFrmCadRegTreinColetivo = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    Label2: TLabel;
    dbedSigla: TDBEdit;
    Label3: TLabel;
    dbedEntidade: TDBEdit;
    cdsDet: TCMClientDataSet;
    grbHora: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    lblCarga: TDBText;
    lblHoraIni: TDBText;
    lblHoraFim: TDBText;
    Label34: TLabel;
    lblTurma: TDBText;
    Label4: TLabel;
    lblCidade: TDBText;
    Label5: TLabel;
    lblUF: TDBText;
    Label21: TLabel;
    lblDtIni: TDBText;
    Label22: TLabel;
    lblDtFim: TDBText;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    dbedValCurso: TDBEdit;
    lblVlrEmpresa: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel1: TPanel;
    grpStatusFuncional: TGroupBox;
    chkAtivos: TCheckBox;
    chkAfastados: TCheckBox;
    chkDemitidos: TCheckBox;
    grp7: TGroupBox;
    Label9: TLabel;
    Label14: TLabel;
    btnBuscaFunc: TBitBtn;
    Panel2: TPanel;
    btnAdiciona: TSpeedButton;
    btnRemove: TSpeedButton;
    Panel3: TPanel;
    lblCCustoDisp: TLabel;
    Label15: TLabel;
    edtPassagem: TDBRealEdit;
    edtHospedagem: TDBRealEdit;
    edtOutros: TDBRealEdit;
    cdsInscritos: TCMClientDataSet;
    dsInscritos: TwwDataSource;
    dsFunc: TwwDataSource;
    cdsFunc: TCMClientDataSet;
    cdsHistorico: TCMClientDataSet;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    btnBuscaInscr: TBitBtn;
    dbedMatrFunc: TEdit;
    dbeEmpregado: TEdit;
    dbedMatrInscr: TEdit;
    dbeNomeInscr: TEdit;
    cdsSeq: TCMClientDataSet;
    grdDisponivel: TDBGrid;
    grdInscritos: TDBGrid;
    bbtnLista: TBitBtn;
    bbtnCertificado: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure chkAtivosClick(Sender: TObject);
    procedure chkAfastadosClick(Sender: TObject);
    procedure chkDemitidosClick(Sender: TObject);
    procedure btnBuscaFuncClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure bbtnListaClick(Sender: TObject);
    procedure btnBuscaInscrClick(Sender: TObject);
    procedure grdDisponivel2DblClick(Sender: TObject);
    procedure cdsDetAfterOpen(DataSet: TDataSet);
    procedure btnAdicionaClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure bbtnCertificadoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure cdsInscritosAfterOpen(DataSet: TDataSet);
    procedure cdsFuncAfterOpen(DataSet: TDataSet);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure grdDisponivelCellClick(Column: TColumn);
    procedure grdDisponivelDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdInscritosTitleClick(Column: TColumn);
    procedure grdInscritosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grdInscritosCellClick(Column: TColumn);
    procedure grdDisponivelTitleClick(Column: TColumn);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbedMatrFuncKeyPress(Sender: TObject; var Key: Char);
    procedure dbeEmpregadoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CtrlRegTrein    : TCtrlRegTrein;
    CtrlTurma       : TCtrlTurma;
    CtrlCurso       : TCtrlCurso;

    iIdCurso        : double;
    bAplicaFiltro   : boolean;
    bSelTodosInscr  : boolean;

    procedure MoveInstutores(cdsOrigem, cdsDestino : TCMClientDataSet; const iIdTurma : integer = -1);
    procedure Seleciona( iIdCurso : double );
    procedure FiltraFuncionarios;
    procedure CarregaFuncionarios;
    procedure Marca(cdsDados: TCMClientDataSet);
    procedure AplicaFiltro(cdsFiltro : TCMClientDataSet; sFiltro : string);
    procedure CancelaEfetivaInscritosNovos(bCancela : boolean);
    procedure FuncionarioJaInscrito(cdsFiltro : TCMClientDataSet; piCurso : double);
    procedure VerificaDuplicidadeInscrito(cdsFiltro : TCMClientDataSet);
    procedure LimparFiltrosCds(pCdsFunc, pCdsInscritos : TCMClientDataSet);

  public
    { Public declarations }
  end;

var
  FrmCadRegTreinColetivo: TFrmCadRegTreinColetivo;

implementation

uses uCMTypes, uSistema, uMensErro, uModulo,  fPreview, uCtrlPadroes, uCtrlUsoGeralRH, uCMMath,
     RListaInscritosTurma, RCertificado, fSelAssinatura, dBaseDados;

{$R *.DFM}
                     

procedure TFrmCadRegTreinColetivo.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlRegTrein := TCtrlRegTrein.Create(true, Sistema.UsaRAD, true, false, Sistema.IdEmpresa,
  Sistema.IdUsuario, Sistema.NomeUsuario, CtrlUsoGeralRH.UsuXFilial,
  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  CtrlTurma := TCtrlTurma.Create;
  CtrlTurma.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlRegTrein.CdsInscritos := cdsInscritos;
  CtrlRegTrein.CdsTurma     := cdsDet;
  CtrlRegTrein.CdsHistTrein := cdsHistorico;

  bAplicaFiltro := false;

  Seleciona( -1 );
end;

procedure TFrmCadRegTreinColetivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlTurma);
  FreeAndNil(CtrlCurso);

  inherited;
end;

procedure TFrmCadRegTreinColetivo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    iIdCurso := StrToFloat(MontaSelect.ValoresChave[0]);

    Seleciona( iIdCurso );
  end;
end;

procedure TFrmCadRegTreinColetivo.Seleciona(iIdCurso: double);
begin
  //Trecho comentado - SOL: 245965 PPM: 635849 - Wylliam Leite da Silva - 26/02/2015
  //cdsInscritos.DisableControls;

  cds.Data     := CtrlTurma.ListaCurso( iIdCurso );
  cdsDet.Data  := CtrlTurma.ListaTurma( iIdCurso );

  if cdsInscritos.Active then
     cdsInscritos.EmptyDataSet;

  cdsInscritos.data := CtrlTurma.ListaInscritosCurso( iIdCurso );

  cdsHistorico.data := CtrlRegTrein.ListaHistoricoPorCurso( iIdCurso );
  cdsInscritos.EnableControls;
end;

procedure TFrmCadRegTreinColetivo.AplicaFiltro(cdsFiltro : TCMClientDataSet; sFiltro : string);
begin
  cdsFiltro.Filtered := false;
  cdsFiltro.Filter   := sFiltro;
  cdsFiltro.Filtered := true;
end;


procedure TFrmCadRegTreinColetivo.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  CarregaFuncionarios();

  // marque que registro foi alterado
  cdsDet.FieldByName('FLGATUINSCRITOS').AsString := 'S';

  // carrega dados
  AplicaFiltro(cdsInscritos, '(IDTURMA = '+cdsDet.FieldByName('IDTURMA').AsString+')' );
  AplicaFiltro(cdsHistorico, '(IDTURMA = '+cdsDet.FieldByName('IDTURMA').AsString+')' );

end;

procedure TFrmCadRegTreinColetivo.FiltraFuncionarios;
var
  sSitFunc : string;
begin
  //Trecho comentado - SOL: 245965 PPM: 635849 - Wylliam Leite da Silva - 26/02/2015
  //cdsFunc.DisableControls;
  if bAplicaFiltro then
  begin
    sSitFunc := FU.GerarListaSitFuncSel(chkAtivos.Checked, chkAfastados.Checked, chkDemitidos.Checked, true);

    cdsFunc.Data := CtrlTurma.ListaFuncionarios(sSitFunc, 'FU.MATRICULA');
  end;

  FuncionarioJaInscrito(cdsFunc, iIdCurso);
  cdsFunc.EnableControls
end;


procedure TFrmCadRegTreinColetivo.bbtnOkDetClick(Sender: TObject);
begin
  if cdsInscritos.IsEmpty then
  begin
    MsgDlg('Adicione ao menos um empregado na relação de Empregados Inscritos.',
           'Informação', mtInformation, [mbOk{,mbHelp}], 0);
    abort;
  end;

  CancelaEfetivaInscritosNovos(false);

  // total de inscritos na turma
  cdsDet.FieldByName('QTDINSCR').AsInteger :=  cdsInscritos.RecordCount;

  inherited;
end;


procedure TFrmCadRegTreinColetivo.MoveInstutores(cdsOrigem, cdsDestino: TCMClientDataSet; const iIdTurma: integer);
var
  bJaExiste : boolean;
  sFiltro   : string;
  sFiltroDestino : string;
begin
  sFiltro := cdsOrigem.Filter;

  //Trecho comentado - SOL: 245965 PPM: 635849 - Wylliam Leite da Silva - 26/02/2015
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
      cdsDestino.FieldByName('SEL').AsString       := 'N';
      cdsDestino.FieldByName('NOME').AsString      := cdsOrigem.FieldByName('NOME').AsString;
      cdsDestino.FieldByName('MATRICULA').AsString := cdsOrigem.FieldByName('MATRICULA').AsString;
      cdsDestino.FieldByName('IDPESSOA').AsInteger := cdsOrigem.FieldByName('IDPESSOA').AsInteger;
      cdsDestino.FieldByName('TIPOSIT').AsString   := cdsOrigem.FieldByName('TIPOSIT').AsString;
      cdsDestino.FieldByName('IDTURMA').AsInteger  := iIdTurma;
      if iIdTurma > 0 then
         cdsDestino.FieldByName('FLGNOVO').AsString   := 'S'; // marca os novos para excluir, caso cancele

      cdsDestino.Post;
    end;

    // se houver IDTURMA preenchido e está retirando, exclui do historico de treinamento tb
    if cdsOrigem.FieldByName('IDTURMA').AsInteger > 0 then
    begin
      // excluir do registro de historio de treinamento
      if cdsHistorico.Locate('IDPESSOA;IDTURMA',  VarArrayOf([cdsOrigem.FieldByName('IDPESSOA').AsInteger, cdsOrigem.FieldByName('IDTURMA').AsInteger]), [loPartialKey]) then
         cdsHIstorico.Delete;
    end;
    cdsOrigem.Delete;
  end;
  cdsOrigem.Filtered := false;
  cdsOrigem.Filter   := sFiltro;
  cdsOrigem.Filtered := true;

  cdsDestino.Filtered := False;
//  cdsDestino.Filter :=

 // cdsDestino.DisableControls;
//  cdsDestino.First;
//
//
//  while not cdsDestino.Eof do
//  begin
//    cdsOrigem.Filtered := false;
//    cdsOrigem.Filter   := 'IDPESSOA = ' + cdsDestino.FieldByName('IDPESSOA').AsString;
//    cdsOrigem.Filtered := true;
//
//    if (cdsOrigem.RecordCount > 0) then
//      cdsOrigem.Delete;
//
//    cdsDestino.Next;
//  end;
//
  cdsOrigem.EnableControls;

//  cdsOrigem.Filtered := false;
//  cdsOrigem.Filter   := sFiltro;
//  cdsOrigem.Filtered := true;
//  cdsDestino.Filtered := False;
//  cdsDestino.EnableControls;

  // Se o registro for vazio, deleta - SOL:245965 PPM: 635849 - Wylliam Leite - 25/02/2015
  
  //Trecho comentado - SOL: 245965 PPM: 635849 - Wylliam Leite da Silva - 26/02/2015
  cdsDestino.DisableControls;

  cdsDestino.First;
  while not cdsDestino.Eof do
  begin
     if cdsDestino.FieldByName('MATRICULA').AsString = '' then
        cdsDestino.Delete
     else
        cdsDestino.Next;
  end;
  cdsDestino.First;

  cdsDestino.Filtered:= False;
  cdsDestino.Filter:= ' IDTURMA = ' + IntToStr(iIdTurma);
  cdsDestino.Filtered:= True;

  cdsDestino.EnableControls;

  grdDisponivel.Refresh;
  grdInscritos.Refresh;
end;



procedure TFrmCadRegTreinColetivo.Marca(cdsDados: TCMClientDataSet);
var
  sValor : string;
begin
  sValor := cdsDados.FieldByName('SEL').AsString;

  cdsDados.Edit;
  cdsDados.FieldByName('SEL').AsString := FU.IFF(sValor = 'N', 'S', 'N');
  cdsDados.Post;
end;

procedure TFrmCadRegTreinColetivo.CarregaFuncionarios;
begin
  // desativa filtragem pela situação funcional
  bAplicaFiltro := false;
  chkAtivos.checked    := true;
  chkAfastados.Checked := false;
  chkDemitidos.checked := false;
  bAplicaFiltro := true;

  // carrega instrutores
  chkAtivosClick(chkAtivos);
end;


procedure TFrmCadRegTreinColetivo.chkAtivosClick(Sender: TObject);
begin
  FiltraFuncionarios();
end;

procedure TFrmCadRegTreinColetivo.chkAfastadosClick(Sender: TObject);
begin
  FiltraFuncionarios();
end;

procedure TFrmCadRegTreinColetivo.chkDemitidosClick(Sender: TObject);
begin
  FiltraFuncionarios();
end;

procedure TFrmCadRegTreinColetivo.btnBuscaFuncClick(Sender: TObject);
var
  vArray  : Variant;
  sFiltro : string;
begin
  // Surgir msg de incompatibilidade na busca - Wylliam Leite - 24/02/2015
  if (Trim(dbedMatrFunc.Text) = '') and (Trim(dbeEmpregado.Text) = '') then
  begin
       MessageDlg('Preencha o campo matrícula e/ou nome para pesquisar!', mtInformation, [mbOK], 0);
       Exit;
  end;
  if  dbedMatrFunc.text <> '' then
     sFiltro := 'MATRICULA';

  if  dbeEmpregado.text <> '' then
      sFiltro := sFiltro + FU.IFF(sFiltro = '', 'NOME', ';NOME');

   vArray := VarArrayCreate([0, 0], varVariant);
   if Pos(';',sFiltro) > 0 then
      vArray[0] := VarArrayOf([dbedMatrFunc.text, UpperCase(dbeEmpregado.text)])
   else if Pos('NOME',sFiltro) > 0 then
      vArray[0] := VarArrayOf([UpperCase(dbeEmpregado.text)])
   else
      vArray[0] := VarArrayOf([dbedMatrFunc.text]);

  if (not cdsFunc.Locate(sFiltro, vArray[0], [loPartialKey])) then
     MsgDlg('Não foi encontrado o empregado informado na relação de Empregados Não Inscritos.',
            'Informação', mtInformation, [mbOk{,mbHelp}], 0)
  else
    grdDisponivel.SetFocus;

  VarClear(vArray);
end;

procedure TFrmCadRegTreinColetivo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var
  rRatCurso, rRatViagem, rRatHosp, rRatOutras : currency;
  iTotInscritos, iProxNumSeq : integer;
begin
  inherited;

  // busca NUMSEQ do historico por pessoa
  cdsSeq.data := CtrlRegTrein.GetUltNumSeq(cds.FieldByName('IDCURSO').AsFloat);

  //Trecho comentado - SOL: 245965 PPM: 635849 - Wylliam Leite da Silva - 26/02/2015
  // desabilita controles
  //cdsInscritos.DisableControls;
  //cdsDet.DisableControls;

  cdsHistorico.Filtered := false;

  // filtra apenas turmas que foram alteradas
  cdsDet.Filter   := 'FLGATUINSCRITOS = ''S'' ';
  cdsDet.Filtered := true;
  while not cdsDet.Eof do
  begin
    AplicaFiltro(cdsInscritos, '(IDTURMA = '+cdsDet.FieldByName('IDTURMA').AsString+')' );

    iTotinscritos := cdsInscritos.RecordCount;

    rRatCurso  := RoundCM(cdsDet.FieldByName('VALORCURSO').AsCurrency / iTotInscritos, 2);
    rRatViagem := RoundCM(cdsDet.FieldByName('VALORPASS').AsCurrency / iTotInscritos, 2);
    rRatHosp   := RoundCM(cdsDet.FieldByName('VALORHOSP').AsCurrency / iTotInscritos, 2);
    rRatOutras := RoundCM(cdsDet.FieldByName('VALOROUTROS').AsCurrency / iTotInscritos, 2);

    while not cdsInscritos.eof do
    begin
      // atualiza o numseq das pessoas
      if cdsSeq.Locate('IDPESSOA', cdsInscritos.FieldByName('IDPESSOA').AsInteger, []) then
      begin
        iProxNumSeq := cdsSeq.FieldByName('ULT_NUM_SEQ').asInteger + 1;
      end
      else
      begin
        iProxNumSeq := 1;
        cdsSeq.Insert;
        cdsSeq.FieldByName('IDPESSOA').AsInteger    := cdsInscritos.FieldByName('IDPESSOA').AsInteger;
        cdsSeq.FieldByName('ULT_NUM_SEQ').asInteger := 0;;
        cdsSeq.Post;
      end;


      if not cdsHistorico.Locate('IDPESSOA;IDTURMA', VarArrayOf([cdsInscritos.FieldByName('IDPESSOA').AsInteger, cdsInscritos.FieldByName('IDTURMA').AsInteger]), [loPartialKey]) then
      begin
        cdsHistorico.Insert;
        cdsHistorico.FieldByName('IDPESSOA').AsInteger     := cdsInscritos.FieldByName('IDPESSOA').AsInteger;
        cdsHistorico.FieldByName('IDCURSO').AsInteger      := cds.FieldByName('IDCURSO').AsInteger;
        cdsHistorico.FieldByName('NUMSEQ').AsInteger       := iProxNumSeq;
        cdsHistorico.FieldByName('IDTURMA').AsInteger      := cdsInscritos.FieldByName('IDTURMA').AsInteger;
        cdsHistorico.FieldByName('IDMODULO').AsInteger     := 72;
        cdsHistorico.FieldByName('REGISTRO').AsString      := 'T';
        cdsHistorico.FieldByName('ENTREGUE').asInteger     := 0;

        cdsSeq.Edit;
        cdsSeq.FieldByName('ULT_NUM_SEQ').AsInteger := iProxNumSeq;
        cdsSeq.Post;

      end
      else
        cdsHistorico.Edit;

      cdsHistorico.FieldByName('IDENTIDINSTR').AsInteger := cds.FieldByName('IDENTIDINSTR').AsInteger;
      cdsHistorico.FieldByName('DUR_TOT').AsInteger      := cdsDet.FieldByName('CARGAHORA').AsInteger;
      cdsHistorico.FieldByName('DATPLINI').AsDateTime    := cdsDet.FieldByName('DTINI').AsDateTime;
      cdsHistorico.FieldByName('DATPLFIM').AsDateTime    := cdsDet.FieldByName('DTFIM').AsDateTime;
      cdsHistorico.FieldByName('DATREINI').AsDateTime    := cdsDet.FieldByName('DTINI').AsDateTime;
      cdsHistorico.FieldByName('DATREFIM').AsDateTime    := cdsDet.FieldByName('DTFIM').AsDateTime;
      cdsHistorico.FieldByName('VALOR').AsCurrency       := rRatCurso;
      cdsHistorico.FieldByName('DESP_VIAG').AsCurrency   := rRatViagem;
      cdsHistorico.FieldByName('DESP_ESTAD').AsCurrency  := rRatHosp;
      cdsHistorico.FieldByName('DESP_OUTR').AsCurrency   := rRatOutras;

      cdsInscritos.next;
    end;

    cdsDet.next;
  end;

  Accept := CtrlRegTrein.GravarTreinamentoColetivo();

  if not(Accept)then
    raise Exception.Create(CtrlRegTrein.MessageInfo)
  else if (CtrlRegTrein.MessageInfo <> '') then
    MsgDlg(CtrlRegTrein.MessageInfo, 'Aviso', mtInformation, [mbOk{,mbHelp}], 0);

  // remove filtro
  cdsDet.Filter   := '';
  cdsDet.Filtered := false;
  cdsDet.EnableControls;
  cdsInscritos.EnableControls;
end;

procedure TFrmCadRegTreinColetivo.bbtnListaClick(Sender: TObject);
var
  Rpt: TRptListaInscritos;
  ListaCodPessoasInscritas : string;
  sFiltro : string;
begin

   // verifica se existem pendentes
   cdsInscritos.DisableControls;
   sFiltro := cdsInscritos.Filter;
   AplicaFiltro(cdsInscritos, 'FLGNOVO = ''S'' ');
   if not cdsInscritos.IsEmpty then
      MsgDlg('Só serão apresentados na impressão os Empregados que estão com a inscrição confirmada',
             'Informação', mtInformation, [mbOk{,mbHelp}], 0);
   AplicaFiltro(cdsInscritos, sFiltro);
   cdsInscritos.EnableControls;


  try

    Rpt := TRptListaInscritos.Create(Application);

    Rpt.sPessoasInscritas    := '';
    ListaCodPessoasInscritas := '';

    cdsInscritos.DisableControls;
    cdsInscritos.first;
    while not cdsInscritos.eof do
    begin
      ListaCodPessoasInscritas := ListaCodPessoasInscritas + cdsInscritos.FieldByName('IDPESSOA').AsString;
      cdsInscritos.next;
      if not cdsInscritos.eof then
         ListaCodPessoasInscritas := ListaCodPessoasInscritas + ', ';
    end;
    cdsInscritos.first;
    cdsInscritos.EnableControls;

    Rpt.sPessoasInscritas  := ListaCodPessoasInscritas;

    Rpt.sIdTurma        := CdsDet.FieldByName('IDTURMA').asString;
    Rpt.sCurso          := cds.FieldByName('DESCRICAO').AsString;
    Rpt.sTurma          := cdsDet.FieldByName('DESCRICAO').AsString;
    Rpt.sEmpresa        := cds.FieldByName('RAZAOSOCIAL').AsString;
    Rpt.sCargaHoraria   := cdsDet.FieldByName('CARGAHORA').AsString;
    Rpt.sDataIni        := cdsDet.FieldByName('DTINI').asString;
    Rpt.sDataFim        := cdsDet.FieldByName('DTFIM').asString;
    Rpt.sHoraIni        := cdsDet.FieldByName('HRINI').asString;
    Rpt.sHoraFim        := cdsDet.FieldByName('HRFIM').asString;

    Rpt.CrmRptCM.IdReports := 20532;
    Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    Rpt.CrmRptCM.OrigemCM  := 1;
    Rpt.CrmRptCM.IdModulo  := Sistema.IdModulo;
    Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
    Rpt.CrmRptCM.Print;

  finally
    FreeAndNil(Rpt);
  end;

end;


procedure TFrmCadRegTreinColetivo.btnBuscaInscrClick(Sender: TObject);
var
  vArray  : Variant;
  sFiltro : string;
begin
  // Surgir msg de incompatibilidade na busca - Wylliam Leite - 24/02/2015
  if (Trim(dbedMatrInscr.Text) = '') and (Trim(dbeNomeInscr.Text) = '') then
  begin
       MessageDlg('Preencha o campo matrícula e/ou nome para pesquisar!', mtInformation, [mbOK], 0);
       Exit;
  end;

  if  dbedMatrInscr.text <> '' then
     sFiltro := 'MATRICULA';

  if  dbeNomeInscr.text <> '' then
      sFiltro := sFiltro + FU.IFF(sFiltro = '', 'NOME', ';NOME');

   vArray := VarArrayCreate([0, 0], varVariant);
   if Pos(';',sFiltro) > 0 then
      vArray[0] := VarArrayOf([dbedMatrInscr.text, UpperCase(dbeNomeInscr.text)])
   else if Pos('NOME',sFiltro) > 0 then
      vArray[0] := VarArrayOf([UpperCase(dbeNomeInscr.text)])
   else
      vArray[0] := VarArrayOf([dbedMatrInscr.text]);

  if (not cdsInscritos.Locate(sFiltro, vArray[0], [loPartialKey])) then
     MsgDlg('Não foi encontrado o empregado informado na relação de Empregados Inscritos.',
            'Informação', mtInformation, [mbOk{,mbHelp}], 0)
  else
    grdInscritos.SetFocus;

  VarClear(vArray);
end;

procedure TFrmCadRegTreinColetivo.grdDisponivel2DblClick(Sender: TObject);
begin
//  Marca(cdsFunc);
end;

procedure TFrmCadRegTreinColetivo.cdsDetAfterOpen(DataSet: TDataSet);
begin
  TNumericField(cdsDet.FieldByName('VALORCURSO')).DisplayFormat := ',0.00;-,0.00';
end;

procedure TFrmCadRegTreinColetivo.btnAdicionaClick(Sender: TObject);
begin
  // Verifica se o registro esta preenchido para passar para a lista
  //de inscritos - SOL: 245965 PPM: 635849- Wylliam Leite da Silva - 25/02/2015
  //if (Trim(cdsFunc.FieldByName('SEL').AsString) <> '') then
     MoveInstutores( cdsFunc, cdsInscritos, cdsDet.FieldByName('IDTURMA').AsInteger);
     Application.ProcessMessages;
end;

procedure TFrmCadRegTreinColetivo.btnRemoveClick(Sender: TObject);
begin
  // Verifica se o registro esta preenchido para passar para a lista
  //de não inscritos - SOL: 245965 PPM: 635849- Wylliam Leite da Silva - 25/02/2015
  //if (Trim(cdsInscritos.FieldByName('MATRICULA').AsString) <> '') then
     MoveInstutores( cdsInscritos, cdsFunc, -1);
     Application.ProcessMessages;
end;

procedure TFrmCadRegTreinColetivo.bbtnCertificadoClick(Sender: TObject);
var
  c: integer;
  sListaInscritos, sFiltro, sInstrutores, sInstrutoresID : string;
  Rpt: TRptCertificado;
begin

   // verifica se existem pendentes
   cdsInscritos.DisableControls;
   sFiltro := cdsInscritos.Filter;
   AplicaFiltro(cdsInscritos, 'FLGNOVO = ''S'' ');
   if not cdsInscritos.IsEmpty then
      MsgDlg('Só serão apresentados na impressão os Empregados que estão com a inscrição confirmada',
             'Informação', mtInformation, [mbOk{,mbHelp}], 0);
   AplicaFiltro(cdsInscritos, sFiltro);
   cdsInscritos.EnableControls;


  try
    sListaInscritos := '';

    Rpt := TRptCertificado.Create(Application);

    if (Rpt.CmpRptCM.Execute) then
    begin
      cdsInscritos.DisableControls;
      sFiltro := cdsInscritos.filter;
      cdsInscritos.first;

      if (Rpt.CmpRptCM.ParamByName('Todos').asInteger) = 1 then   // so selecionados aplica o filtro
         AplicaFiltro(cdsInscritos, 'SEL = ''S'' ');

      if not cdsInscritos.eof then
      begin
        while not cdsInscritos.eof do
        begin
          sListaInscritos := sListaInscritos + cdsInscritos.FieldByName('IDPESSOA').AsString;
          cdsInscritos.next;
          if not cdsInscritos.eof then
             sListaInscritos := sListaInscritos + ', ';
        end;

        frmSelecaoAssinatura := TfrmSelecaoAssinatura.Create(nil);

        frmSelecaoAssinatura.Visible := False;

        frmSelecaoAssinatura.sPessoasInscritas := sListaInscritos;

        frmSelecaoAssinatura.sCurso       := cds.FieldByName('DESCRICAO').AsString;
        frmSelecaoAssinatura.sEntid       := cds.FieldByName('RAZAOSOCIAL').AsString;
        frmSelecaoAssinatura.sIdCurso     := Cds.FieldByName('IDCURSO').asString;
        frmSelecaoAssinatura.sIdEntid     := Cds.FieldByName('IDENTIDINSTR').asString;
        frmSelecaoAssinatura.sIdTurma     := cdsDet.FieldByName('IDTURMA').asString;
        frmSelecaoAssinatura.sIniPlan     := cdsDet.FieldByName('DTINI').asString;
        frmSelecaoAssinatura.sFimPlan     := cdsDet.FieldByName('DTFIM').asString;
        frmSelecaoAssinatura.sIniReal     := cdsDet.FieldByName('DTINI').asString;
        frmSelecaoAssinatura.sFimReal     := cdsDet.FieldByName('DTFIM').asString;
        frmSelecaoAssinatura.sDataIni     := cdsDet.FieldByName('DTINI').asString;
        frmSelecaoAssinatura.sDataFim     := cdsDet.FieldByName('DTFIM').asString;

        Rpt.sPessoasInscritas := frmSelecaoAssinatura.sPessoasInscritas;
        frmSelecaoAssinatura.IdEmpresa := Sistema.IdEmpresa;
        frmSelecaoAssinatura.IdModulo := Sistema.IdModulo;
        frmSelecaoAssinatura.IdUsuario := Sistema.IdUsuario;

        frmSelecaoAssinatura.Visible := True;
        frmSelecaoAssinatura.Show;

      end;
    end;
  finally
    FreeAndNil(Rpt);
  end;

  AplicaFiltro(cdsInscritos, sFiltro);
  cdsInscritos.EnableControls;

end;

procedure TFrmCadRegTreinColetivo.bbtnConfirmarClick(Sender: TObject);
begin
  if (CdsDet.State <> dsBrowse) then
    exit;
  VerificaDuplicidadeInscrito(cdsInscritos);

  inherited;
  if (dtmBaseDados.dbBaseDados.InTransaction) then
     dtmBaseDados.dbBaseDados.Commit;
  LimparFiltrosCds(cdsFunc, cdsInscritos);
end;

procedure TFrmCadRegTreinColetivo.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if CdsDet.State = dsEdit then
  begin
    bbtnLista.Visible       := true;
    bbtnCertificado.Visible := true;
  end
  else
  begin
    bbtnLista.Visible       := false;
    bbtnCertificado.Visible := false;
  end;
end;

procedure TFrmCadRegTreinColetivo.cdsInscritosAfterOpen(DataSet: TDataSet);
var
  c : byte;
begin
  inherited;
  cdsInscritos.IndexFieldNames := 'IDTURMA;MATRICULA';
  
{
                Selected.Strings = (
                  'SEL'#9'3'#9' '
                  'MATRICULA'#9'10'#9'Matrícula'
                  'NOME'#9'40'#9'Nome'
                  'TIPOSIT'#9'10'#9'Situação')


  CdsInscritos.Fields[0].DisplayLabel := ' ';
  CdsInscritos.Fields[1].DisplayLabel := 'Matrícula';
  CdsInscritos.Fields[2].DisplayLabel := 'Nome';
  CdsInscritos.Fields[3].DisplayLabel := 'Situação';
  grdInscritos.col
  // desativa os demais
  for c := CdsInscritos.Fields.Count-1 downto 4 do
    grdInscritos.Fields[c].Visible := False;

  grdInscritos.Columns[0].DisplayWidth := 3;
  grdInscritos.Columns[1].DisplayWidth := 10;
  grdInscritos.Columns[2].DisplayWidth := 40;
  grdInscritos.Columns[3].DisplayWidth := 10;
}
end;

procedure TFrmCadRegTreinColetivo.cdsFuncAfterOpen(DataSet: TDataSet);
var
   c : byte;
begin
  inherited;
  cdsFunc.IndexFieldNames := 'MATRICULA';

{
                Selected.Strings = (
                  'SEL'#9'3'#9' '
                  'MATRICULA'#9'10'#9'Matrícula'
                  'NOME'#9'40'#9'Nome'
                  'TIPOSIT'#9'10'#9'Situação')


  cdsFunc.Fields[0].DisplayLabel := ' ';
  cdsFunc.Fields[1].DisplayLabel := 'Matrícula';
  cdsFunc.Fields[2].DisplayLabel := 'Nome';
  cdsFunc.Fields[3].DisplayLabel := 'Situação';

  // desativa os demais
  for c := cdsFunc.Fields.Count-1 downto 4 do
    grdDisponivel.Fields[c].Visible := False;

  grdDisponivel.Columns[0].DisplayWidth := 3;
  grdDisponivel.Columns[1].DisplayWidth := 10;
  grdDisponivel.Columns[2].DisplayWidth := 40;
  grdDisponivel.Columns[3].DisplayWidth := 10;
 }   
end;

procedure TFrmCadRegTreinColetivo.sbtnAltDetClick(Sender: TObject);
var
   iQtdInscritos : integer;
begin
  cdsInscritos.DisableControls;
  cdsFunc.DisableControls;
  iQtdInscritos := CtrlTurma.GetQtdInscritos(cdsDet.FieldByName('IDTURMA').AsInteger, 'I');
  if iQtdInscritos > 0 then
  begin
    MsgDlg('Essa turma pertence ao Registro de Incentivo.',
           'Informação', mtInformation, [mbOk{,mbHelp}], 0);
    CmeDetalhe.Operacao := opIdle;
    CmeDetalhe.Atualizabotoes(Self);
    exit;
  end;

  inherited;
  cdsInscritos.EnableControls;
  cdsFunc.EnableControls;
end;

procedure TFrmCadRegTreinColetivo.CancelaEfetivaInscritosNovos(bCancela : boolean);
var
  sFiltro : string;
begin
  // limpando os que acabaram de ser inseridos
  cdsInscritos.DisableControls;
  cdsInscritos.First;
  sFiltro := cdsInscritos.Filter;
  AplicaFiltro(cdsInscritos, 'FLGNOVO = ''S'' ');
  while not cdsInscritos.eof do
  begin
    if bCancela then
      cdsInscritos.delete
    else
    begin
      cdsInscritos.Edit;
      cdsInscritos.FieldByName('FLGNOVO').AsString := 'N';
      cdsInscritos.Post;

      cdsInscritos.next;
    end;
  end;

  cdsInscritos.Filter := sFiltro;
  cdsInscritos.First;
  cdsInscritos.EnableControls;
end;

procedure TFrmCadRegTreinColetivo.bbtnCancelarDetClick(Sender: TObject);
begin
  // limpando os que acabaram de ser inseridos
  CancelaEfetivaInscritosNovos(true);

  inherited;
end;

procedure TFrmCadRegTreinColetivo.bbtnVoltarDetClick(Sender: TObject);
begin
  // limpando os que acabaram de ser inseridos
  CancelaEfetivaInscritosNovos(true);

  inherited;
end;


procedure TFrmCadRegTreinColetivo.grdDisponivelCellClick(Column: TColumn);
begin
    cdsFunc.Edit;
    cdsFunc.FieldByName('SEL').AsString := FU.IFF(cdsFunc.FieldByName('SEL').AsString='N', 'S', 'N');
    cdsFunc.Post;
end;

procedure TFrmCadRegTreinColetivo.grdDisponivelDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if Column.FieldName = 'SEL' then
  begin
    grdDisponivel.Canvas.FillRect(Rect);
    iCheck := 0;
    if cdsFunc.FieldByName('SEL').AsString = 'S' then
       iCheck := DFCS_CHECKED
    else
       iCheck := 0;
    rRect := Rect;
    InflateRect(rRect,-2,-2);
    DrawFrameControl(grdDisponivel.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;
end;

procedure TFrmCadRegTreinColetivo.grdInscritosTitleClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
  begin
    bSelTodosInscr := (not bSelTodosInscr);

    cdsInscritos.DisableControls;
    cdsInscritos.First;
    while not cdsInscritos.eof do
    begin
      cdsInscritos.Edit;
      cdsInscritos.FieldByName('SEL').AsString := FU.IFF(bSelTodosInscr, 'S', 'N');
      cdsInscritos.Post;

      cdsInscritos.Next;
    end;
    cdsInscritos.First;
    cdsInscritos.EnableControls;

    // usando fonte WINDGINS no titulo do grid para mostrar o check
    grdInscritos.Columns[0].Title.Caption := FU.IFF(bSelTodosInscr, 'þ','¨');
  end;
end;

procedure TFrmCadRegTreinColetivo.grdInscritosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin
  if Column.FieldName = 'SEL' then
  begin
    grdInscritos.Canvas.FillRect(Rect);
    iCheck := 0;
    if cdsInscritos.FieldByName('SEL').AsString = 'S' then
       iCheck := DFCS_CHECKED
    else
       iCheck := 0;
    rRect := Rect;
    InflateRect(rRect,-2,-2);
    DrawFrameControl(grdInscritos.Canvas.Handle,rRect,DFC_BUTTON, DFCS_BUTTONCHECK or iCheck);
  end;
end;

procedure TFrmCadRegTreinColetivo.grdInscritosCellClick(Column: TColumn);
begin
    cdsInscritos.Edit;
    cdsInscritos.FieldByName('SEL').AsString := FU.IFF(cdsInscritos.FieldByName('SEL').AsString='N', 'S', 'N');
    cdsInscritos.Post;
end;

procedure TFrmCadRegTreinColetivo.grdDisponivelTitleClick(Column: TColumn);
begin

  if Column.FieldName = 'SEL' then
  begin
    bSelTodosInscr := (not bSelTodosInscr);

    cdsFunc.DisableControls;
    cdsFunc.First;
    while not cdsFunc.eof do
    begin
      cdsFunc.Edit;
      cdsFunc.FieldByName('SEL').AsString := FU.IFF(bSelTodosInscr, 'S', 'N');
      cdsFunc.Post;

      cdsFunc.Next;
    end;
    cdsFunc.First;
    cdsFunc.EnableControls;

    // usando fonte WINDGINS no titulo do grid para mostrar o check
    grdDisponivel.Columns[0].Title.Caption := FU.IFF(bSelTodosInscr, 'þ','¨');
  end;
end;

procedure TFrmCadRegTreinColetivo.FuncionarioJaInscrito(
  cdsFiltro: TCMClientDataSet; piCurso : double);
begin
  if (piCurso > 0) then
  begin
    cdsFiltro.DisableControls;

    // Aqui alteramos a estrutura do laço para que se um registro do cds Filtro
    //for deletado o sistema não dar um next para a proxima linha SOL: 245965 PPM: 635849 - Wylliam Leite - 05/02/2015
    cdsInscritos.First;
    cdsFiltro.First;
    while not cdsInscritos.Eof do
    begin
      if  cdsFiltro.Eof then
          Break;
      //Retirado campo IDPESSOA para colocar MATRICULA SOL: 245965 PPM: 635849 - Wylliam Leite - 05/02/2015
      if cdsInscritos.Locate('MATRICULA', cdsFiltro.FieldByName('MATRICULA').AsString,[]) then
         cdsFiltro.Delete
      else
          cdsFiltro.Next;
      cdsInscritos.Next;
    end;
    cdsFiltro.EnableControls;
  end;
end;

procedure TFrmCadRegTreinColetivo.VerificaDuplicidadeInscrito(
  cdsFiltro: TCMClientDataSet);
begin
    cdsFiltro.DisableControls;

    cdsFiltro.First;
    cdsInscritos.First;
    while not cdsInscritos.Eof do
    begin
      cdsFiltro.Filtered := False;
      cdsFiltro.Filter   := 'IDPESSOA = ' + cdsInscritos.FieldByName('IDPESSOA').AsString;
      cdsFiltro.Filtered := True;

      if cdsFiltro.RecordCount > 1 then
         cdsFiltro.Delete;

      cdsInscritos.Next;
    end;

    cdsFiltro.Filtered := False;
    cdsFiltro.EnableControls;
end;

procedure TFrmCadRegTreinColetivo.LimparFiltrosCds(pCdsFunc,
  pCdsInscritos: TCMClientDataSet);
begin
   pCdsFunc.Filtered      := False;
   pCdsInscritos.Filtered := False;
   pCdsFunc.Filter        := EmptyStr;
   pCdsInscritos.Filter   := EmptyStr;
end;

procedure TFrmCadRegTreinColetivo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparFiltrosCds(cdsFunc, cdsInscritos);
end;

procedure TFrmCadRegTreinColetivo.dbedMatrFuncKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //O campo matrícula pode aceitar letras e números - Wylliam Leite - 24/02/2015
  //if not (key in ['0'..'9',#8, #13]) then key := #0;
  if not (key in ['a'..'z','A'..'Z', '0'..'9', #8, #13]) then key := #0;
end;

procedure TFrmCadRegTreinColetivo.dbeEmpregadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if not (key in ['a'..'z','A'..'Z', #8, #13, ' ']) then key := #0;
end;

end.
