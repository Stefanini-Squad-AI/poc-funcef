unit FEntDadosDiariaMT;
//==============================================================================
// Data      : 09/08/2007
// Autor     : Rodolpho da Silva
// Pendência : 22604
// Descrição : Inserir validação para entrada de dados
//==============================================================================
// Data      : 10/10/2005
// Autor     : Rodolpho da Silva
// Pendência : 18321
// Descrição : Filtrar no MontaSelect apenas as contas orçamentárias ativas
//==============================================================================
// Atualizado em: 30/10/2003 - André Tavares - pendência 15026



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, Mask, wwdbedit,
  TREdit, Spin, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlSaldoorcado, uCMTypes,
  uCtrlBlqEntDados;

type
  TfrmEntradaDadosDiariaMT = class(TfrmOkCancelar)
    lblExercicio: TLabel;
    spnedExercicio: TSpinEdit;
    redValorOrcado: TRealEdit;
    Label1: TLabel;
    redValorRealizado: TRealEdit;
    Label3: TLabel;
    Label2: TLabel;
    dteDataEntrada: TCMDateTimePicker;
    ds: TwwDataSource;
    MontaSelect: TMontaSelect;
    Bevel1: TBevel;
    lblCodigoConta: TLabel;
    bbtnBuscaConta: TBitBtn;
    edtNomeConta: TEdit;
    lblNome: TLabel;
    edtCodigoConta: TEdit;
    sql: TCMSqlParams;
    sqlSaldos: TCMSqlParams;
    cds: TCMClientDataSet;
    cdsSaldos: TCMClientDataSet;
    sqlPeriodo: TCMSqlParams;
    cdsPeriodo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoContaExit(Sender: TObject);
    procedure bbtnBuscaContaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    function  VerificaSaldo(sConta: string; dDataEntrada: TDateTime):string;
    function  VerificaDataInicio(iExercicio: integer; dDataEntrada: TDateTime):integer;
    procedure LimpaCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlSaldoorcado: TCtrlSaldoorcado;
    CtrlBlqEntDados : TCtrlBlqEntDados;
  public
    { Public declarations }
  end;

var
  frmEntradaDadosDiariaMT: TfrmEntradaDadosDiariaMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo, 
  UCtrlOrcamento;

{$R *.DFM}

procedure TfrmEntradaDadosDiariaMT.FormCreate(Sender: TObject);
var sDataIni:String;
    iExercicio:Integer;
begin
  inherited;
  Height := 250;
  sDataini    := FormatDateTime ('dd/mm/yyyy',date);
  iExercicio  := StrToInt(copy(sDataini,7,4));
  spnedExercicio.value := iExercicio;
  MontaSelect.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' +
                         IntToStr(modulo.iPlanoOrc));
  MontaSelect.Filtro.Add('CONTASORCAMEN.CODCENTRORESPON IN (SELECT ' +
                         'CODCENTRORESPON FROM PESSOAXCRESP WHERE ' +
                         'IDPESSOAACESSO = ' + IntToStr(Sistema.idUsuario)+')');
  CtrlSaldoorcado := TCtrlSaldoorcado.Create;

  CtrlSaldoorcado.Initialize( DtmBaseDados.dbBaseDados, True,
                              Sistema.ConnectionType,   Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,  True, nil, nil, False );
  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(CtrlSaldoorcado);
end;




procedure TfrmEntradaDadosDiariaMT.edtCodigoContaExit(Sender: TObject);
var sMensagem, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  if Trim(edtCodigoConta.text) <> '' then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc, edtCodigoConta.text,
       true, false, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
       sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro) = 0 then begin
      edtNomeConta.text  := sNomeConta;
      cds.Close;
      sql.Prepare;
      sql.ParamByName('IDCONTAORCAMEN').asString  := edtCodigoConta.text;
      sql.ParamByName('IDPLANOORCAMEN').asInteger := modulo.iPlanoOrc;
      sql.Open;
    end else begin
      edtCodigoConta.SetFocus;
      Exit;
    end;
  end else begin
    Exit;
  end;
  //Verifica se já existe o registro de saldo.
  //Se existe, exibe os valores antigos
  if VerificaSaldo(edtCodigoConta.text, dteDataEntrada.date) = 'A' then begin
    with cdsSaldos do begin
      redValorRealizado.value := FieldByName('VLRREALIZADO').asFloat;
      redValorOrcado.value    := FieldByName('VLRORCADO').asFloat;
    end;
  end;
  //Verifica o Tipo da Conta e informa.
  sMensagem := 'Esta Conta não é do Tipo "Valor Informado Manualmente". ' +
               'Deseja prosseguir?';
  if cds.FieldByName('TIPOCALCORCADO').asString <> 'V' then begin
    if MsgDlg(sMensagem, 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       begin
      cds.Close;
    end;
    Exit;
  end;
  if cds.FieldByName('TIPOCALCREALIZADO').asString <> 'V' then begin
    if MsgDlg(sMensagem, 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       begin
      cds.Close;
    end;
    Exit;
  end;
end;




procedure TfrmEntradaDadosDiariaMT.bbtnBuscaContaClick(Sender: TObject);
var sMensagem, sNomeConta, sCodCentroRespon, sNomeCentroRespon, sCodGrupo,
    sNomeGrupo, sUnid, sPPrev, sCCusto, sPatro: string;
begin
  inherited;
  //Busca a Conta Orçamentária
  MontaSelect.Executar;
  if MontaSelect.RetornouValor then begin
    if OrcamentoBackMT.BuscaContaOrcamen(modulo.iPlanoOrc,
       MontaSelect.ValoresChave[1], true, false, sNomeConta, sCodCentroRespon,
       sNomeCentroRespon, sCodGrupo, sNomeGrupo, sUnid, sPPrev, sCCusto,
       sPatro) = 0 then begin
      edtCodigoConta.text := MontaSelect.ValoresChave[1];
      edtNomeConta.text   := sNomeConta;
      cds.Close;
      sql.Prepare;
      sql.ParamByName('IDCONTAORCAMEN').asString  := edtCodigoConta.text;
      sql.ParamByName('IDPLANOORCAMEN').asInteger := modulo.iPlanoOrc;
      sql.Open;
    end else begin
      edtCodigoConta.SetFocus;
      Exit;
    end;
  end else begin
    Exit;
  end;
  //Verifica se já existe o registro de saldo.
  //Se existe, exibe os valores antigos
  if VerificaSaldo(edtCodigoConta.text, dteDataEntrada.date) = 'A' then begin
    with cdsSaldos do begin
      redValorRealizado.value := FieldByName('VLRREALIZADO').asFloat;
      redValorOrcado.value    := FieldByName('VLRORCADO').asFloat;
    end;
  end;
  //Verifica o Tipo da Conta e informa.
  sMensagem := 'Esta Conta não é do Tipo "Valor Informado Manualmente". ' +
               'Deseja prosseguir?';
  if cds.FieldByName('TIPOCALCORCADO').asString <> 'V' then begin
    if MsgDlg(sMensagem, 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       begin
      cds.Close;
    end;
    Exit;
  end;
  if cds.FieldByName('TIPOCALCREALIZADO').asString <> 'V' then begin
    if MsgDlg(sMensagem, 'Aviso', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       begin
      cds.Close;
    end;
    Exit;
  end;
end;




procedure TfrmEntradaDadosDiariaMT.bbtnConfirmarClick(Sender: TObject);
var iPeriodo:integer;
begin
  //Faz a verificação do preenchimento dos campos
  if (spnedExercicio.value = 0) then begin
    MsgDlg('Exercício não informado.','Erro',mtError,[mbOk],0);
    spnedExercicio.SetFocus;
    exit;
  end;
  if (dteDataEntrada.text = '') then begin
    MsgDlg('Data de Entrada não informada.','Erro',mtError,[mbOk],0);
    dteDataEntrada.SetFocus;
    exit;
  end;
  if (edtCodigoConta.text = '') then begin
    MsgDlg('Código da Conta não informado.','Erro',mtError,[mbOk],0);
    edtCodigoConta.SetFocus;
    exit;
  end;
  //Pega o Periodo do Exercicio e da Data de Entrada
  iPeriodo := VerificaDataInicio(spnedExercicio.value, dteDataEntrada.date);
  if iPeriodo = 0 then begin
    MsgDlg('Não existe um Período para este Exercício contendo esta Data ' +
           'de Entrada.','Erro',mtError,[mbOk],0);
    spnedExercicio.SetFocus;
    exit;
  end;
  if iPeriodo = -1 then begin
    MsgDlg('Período Bloqueado.','Erro',mtError,[mbOk],0);
    dteDataEntrada.SetFocus;
    exit;
  end;

  if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,iPeriodo,spnedExercicio.value) then
  begin
     MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
     Exit;
  end;


  //Busca na tabela de Saldos para a conta e a data selecionadas
  if VerificaSaldo(edtCodigoConta.text, dteDataEntrada.date) = 'I' then begin
    //O Registro não existe, deve ser incluído um novo Saldo
    CtrlSaldoorcado.InsereSaldo(spnedExercicio.value,iPeriodo,Modulo.iPlanoOrc,
                    Sistema.IdEmpresa,Trim(edtCodigoConta.text),
                    FormatDateTime('dd/mm/yyyy',dteDataEntrada.date),
                    redValorOrcado.value,redValorRealizado.value,0,0,0,0);
  end else begin
    //O Registro já existe, deve ser alterado
    CtrlSaldoorcado.AltSaldos2(redValorRealizado.value,redValorOrcado.value,
                    Sistema.IdEmpresa,
                    cds.FieldByName('IDPLANOORCAMEN').asInteger,
                    FormatDateTime('dd/mm/yyyy',dteDataEntrada.date),
                    Trim(edtCodigoConta.text));
  end;
  LimpaCampos;
  inherited;
  try
    Sistema.GravaLogOperacoes('Entrada de Dados Diária.');
  except
    Raise Exception.Create('Não foi possível Gravar o Log');
  end;
end;




function TfrmEntradaDadosDiariaMT.VerificaSaldo(sConta: string;
  dDataEntrada: TDateTime): string;
begin
  //Verifica a existencia do registro de saldo para a conta e a data escolhida
  with sqlSaldos do begin
    cdsSaldos.Close;
    Prepare;
    ParamByName('IDPLANOORCAMEN').asInteger := Modulo.iPlanoOrc;
    ParamByName('IDCONTAORCAMEN').asString  := sConta;
    ParamByName('IDPESSOA').asInteger       := Sistema.IdEmpresa;
    ParamByName('DATA').asDateTime          := dDataEntrada;
    Open;
  end;
  if cdsSaldos.IsEmpty then begin
    result := 'I';  //Inclusao
  end else begin
    result := 'A';  //Alteracao
  end;
end;




function TfrmEntradaDadosDiariaMT.VerificaDataInicio(iExercicio: integer;
  dDataEntrada: TDateTime): integer;
begin
  //Verifica a existencia de um período dentro do exercício selecionado
  //e a data escolhida
  with sqlPeriodo do begin
    cdsPeriodo.close;
    Prepare;
    ParamByName('EXERCICIO').asInteger := iExercicio;
    ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
    ParamByName('DATA').asDateTime     := dDataEntrada;
    Open;
  end;
  if cdsPeriodo.IsEmpty then begin
    result := 0;
  end else begin
    if cdsPeriodo.FieldByName('FLGBLOQUEADO').asString = 'S' then begin
      result := -1;
    end else begin
      result := cdsPeriodo.FieldByName('PERIODO').asInteger;
    end;
  end;
end;




procedure TfrmEntradaDadosDiariaMT.LimpaCampos;
begin
  cds.Close;
  redValorOrcado.value    := 0;
  redValorRealizado.value := 0;
  edtCodigoConta.text     := '';
  edtNomeConta.text       := '';
  dteDataEntrada.SetFocus;
end;




procedure TfrmEntradaDadosDiariaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlSaldoorcado);
  FreeAndNil(CtrlBlqEntDados);
  inherited;
end;

end.
