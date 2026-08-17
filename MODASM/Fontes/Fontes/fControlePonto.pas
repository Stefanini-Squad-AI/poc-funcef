unit fControlePonto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, Mask,
  StdCtrls, DBCtrls, Buttons, Db, DBTables, Wwdatsrc, MAHlpBtn, TB97, Grids, Math, TB97Tlbr,
  IvDictio, IvMulti, MontaSelect, uGImp, ExtCtrls, DBClient, wwdbdatetimepicker, TB97Tlwn,
  TREdit, CMDateTimePicker, uCMClientDataSet, Spin, IniFiles, wwdblook,
  uCtrlGlobalRH, uCtrlFerias, uCtrlHoraTrab, uCtrlPessoaFuncionario, uCtrlListTerceirosRH,
  uCtrlAssociaHorario, uCtrlPessoaFilialPessoa, uCtrlRegAcessoFunc, uCtrlBancoHoras,
  uCtrlHorarioVariavel, uCtrlTipOcMed, IvEMulti, Wwdbigrd, Wwdbgrid;

type
  TfrmControlePonto = class(TfrmSairAjuda)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblSituacao: TLabel;
    sbtnProcurar: TSpeedButton;
    SaveDlg: TSaveDialog;
    OpenDlg: TOpenDialog;
    GImp: TGImp;
    MontaSelect: TMontaSelect;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnCalcular: TBitBtn;
    bbtnLimpar: TBitBtn;
    CdsFerias: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    CdsHorario: TCMClientDataSet;
    CdsTurno: TCMClientDataSet;
    CdsFeriados: TCMClientDataSet;
    edMatricula: TEdit;
    edNome: TEdit;
    CdsEstab: TCMClientDataSet;
    CdsAcessoFunc: TCMClientDataSet;
    townApuracao: TToolWindow97;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    bbtnLancar: TBitBtn;
    bbtnImprimir: TBitBtn;
    gbxApuracao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edAtraso: TRealEdit;
    edFaltas: TRealEdit;
    edFaltasAbon: TRealEdit;
    edAdicNot: TRealEdit;
    edHoraExtra: TRealEdit;
    edDiurna: TRealEdit;
    edNoturna: TRealEdit;
    edFolga: TRealEdit;
    btnFechar: TBitBtn;
    CdsHorarioVariavel: TCMClientDataSet;
    cbxEditBatida: TCheckBox;
    bbtnGravar: TBitBtn;
    CdsParamRH: TCMClientDataSet;
    pnlControles: TPanel;
    pnlLinhas: TPanel;
    gbxPeriodo: TGroupBox;
    Label4: TLabel;
    Label35: TLabel;
    Data1: TCMDateTimePicker;
    Data2: TCMDateTimePicker;
    rgLimiteDiurnas: TRadioGroup;
    gbxTolerancia: TGroupBox;
    Label3: TLabel;
    Label15: TLabel;
    ednTolEntra: TSpinEdit;
    ednTolSaida: TSpinEdit;
    gbxBancoHoras: TGroupBox;
    cbxFaltas: TCheckBox;
    cbxAtrasos: TCheckBox;
    gbxOpcEscala: TGroupBox;
    cbxSabado: TCheckBox;
    cbxDomingo: TCheckBox;
    cbxFeriadoOrd: TCheckBox;
    cbxFeriadoExtra: TCheckBox;
    stgrHoras: TStringGrid;
    CdsMotivo: TCMClientDataSet;
    dblckMotivo: TwwDBLookupCombo;
    Label36: TLabel;
    townMultiplasBatidas: TToolWindow97;
    bbtnFecharMB: TBitBtn;
    edMatriculaMB: TEdit;
    edNomeMB: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    dbgrdMultBat: TwwDBGrid;
    dsAcessoFunc: TwwDataSource;
    Label39: TLabel;
    Label40: TLabel;
    gbxBancoHoras2: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edSaldoAnterior: TRealEdit;
    edCredito: TRealEdit;
    edDebito: TRealEdit;
    edTransferencia: TRealEdit;
    edSaldoAtual: TRealEdit;
    pnl1: TPanel;
    edSaldoAnteriorH: TLabel;
    pnl2: TPanel;
    edCreditoH: TLabel;
    pnl3: TPanel;
    edDebitoH: TLabel;
    pnl4: TPanel;
    edTransferenciaH: TLabel;
    pnl5: TPanel;
    edSaldoAtualH: TLabel;
    lblButaoAbona: TLabel;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnLancarClick(Sender: TObject);
    procedure Data1Change(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure stgrHorasSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
    procedure stgrHorasGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: String);
    procedure bbtnLimparClick(Sender: TObject);
    procedure bbtnCalcularClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure stgrHorasKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnGravarClick(Sender: TObject);
    procedure stgrHorasDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure stgrHorasMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure dblckMotivoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblckMotivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure stgrHorasDblClick(Sender: TObject);
    procedure bbtnFecharMBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlFerias: TCtrlFerias;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlAssociaHorario: TCtrlAssociaHorario;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlRegAcessoFunc: TCtrlRegAcessoFunc;
    CtrlBancoHoras: TCtrlBancoHoras;
    CtrlHorarioVariavel: TCtrlHorarioVariavel;
    CtrlTipOcMed: TCtrlTipOcMed;

    ListaIdMotivo, ListaIdMotivo2, ListaIdMotivo3, ListaIdMotivo4: TStringList;
    ArqConfig: TIniFile;

    iCol, iRow: integer;
    bDiaNormalTrb, bHorarioVariavel: boolean;
    sAdNotIni, sAdNotFim, sAdNotF24, sMultHoraEnt, sMultHoraSai,
    sPrimEnt, sUltSai: string;
    ArrayHorario, ArrayFeriado, ArrayAlmoco, ArrayIniAlmoco, ArrayFimAlmoco,
    ArrayEntradas: variant;
    iUltEstab, iLimAntec, iLimAposE, iTotAtraso, iTotAdicNot,
    iTotFalta, iTotFaltaAbon,
    iTotExtra, iTotDiurno, iTotNoturno, iTotFolga, iQtdRepouso,
    iIdAcessoFunc, iSaldoAnterior, iCredito, iDebito, iTransfer, iSaldoAtual: integer;
    ListaCodAcesso: TStringList;
    DataRefBancoHoras, DataLimBancoHoras: TDateTime;

    // Prazo Fechamento Ponto
    DataFinalPonto, DataLimFechamento: TDateTime;
    // 22/06/07

    TituloGrid: array[0..10] of string;
    bPodeLancar: boolean;

    procedure ZerarValores;
    procedure LimparLinha(const Linha: integer);
    procedure LimpaGrid;
    procedure LimpaAbono;
    procedure RefazGrid;
    procedure Sel(const IdPessoa: double);
    procedure MontaArrayHorario;
    procedure RefazHorario(i: integer);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure DrawCheckBox(const ACol, ARow: Integer; ARect: TRect);
    procedure ExchangeCheckBoxValue(const ACol, ARow: integer);
    function  ConverteMinutos(Minutos: integer): string;
  end;

var
  frmControlePonto: TfrmControlePonto;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH, 
  fLancaHoras, dCds;

const
  COL_VAZIA = '  :  ';
  COL_ZERADA = '00:00';
  INTERV_VAZIO = COL_VAZIA +' - '+ COL_VAZIA;
  INTERV_ZERADO = COL_ZERADA+' - '+ COL_ZERADA;

  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_PERIODO = '      Período..: :1 a :2';
  MSG_INF_DIA = 'Complete ou Limpe o Horário no Dia :1';
  MSG_CONF_SAIDA = 'Confirma que a Saída no Dia :1 é Hora Extra?';
  MSG_HOR_INCOMP = 'Horário Incompatível no Dia :1';

var
  CodDiaSem: array[1..7] of string  = ('D','S','T','Q','Q','S','S');

{$R *.DFM}

procedure TfrmControlePonto.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCodAcesso := TStringList.Create;
  ListaIdMotivo := TStringList.Create;
  ListaIdMotivo2 := TStringList.Create;
  ListaIdMotivo3 := TStringList.Create;
  ListaIdMotivo4 := TStringList.Create;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlFerias := TCtrlFerias.Create;
  CtrlFerias.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlAssociaHorario := TCtrlAssociaHorario.Create;
  CtrlAssociaHorario.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlRegAcessoFunc := TCtrlRegAcessoFunc.Create;
  CtrlRegAcessoFunc.InitializeAs(Padroes);

  CtrlBancoHoras := TCtrlBancoHoras.Create;
  CtrlBancoHoras.InitializeAs(Padroes);

  CtrlHorarioVariavel := TCtrlHorarioVariavel.Create;
  CtrlHorarioVariavel.InitializeAs(Padroes);

  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  CdsMotivo.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;

  TituloGrid[0] := FU.CMTranslate('Datas');
  TituloGrid[1] := FU.CMTranslate('Entrada Real');
  TituloGrid[2] := FU.CMTranslate('Entrada Normal');
  TituloGrid[3] := FU.CMTranslate('Saída Normal');
  TituloGrid[4] := FU.CMTranslate('Saída Real');
  TituloGrid[5] := FU.CMTranslate('Abona');
  TituloGrid[6] := FU.CMTranslate('Intervalo Normal');
  TituloGrid[7] := FU.CMTranslate('Intervalo Real');
  TituloGrid[8] := FU.CMTranslate('Motivo');
  TituloGrid[9] := FU.CMTranslate('Observação');
  TituloGrid[10] := FU.CMTranslate('(*)');

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
    Add('FUNCIONARIO.FLGMARCAPONTO = 1');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH(
    'PONTOINI, PONTOFIM, FLGBANCOHORAS, PERBANCOHORAS, LIMBANCOHORAS, '+
    'DSRBANCOHORAS, NORBANCOHORAS, INDPERBCHORAS, DATBANCOHORAS, PRAZOPONTO');

  // Prazo Fechamento Ponto
  DataFinalPonto  := CdsParamRH.FieldByName('PONTOFIM').asDateTime;
  DataLimFechamento  := CdsParamRH.FieldByName('PONTOFIM').asDateTime +
    CdsParamRH.FieldByName('PRAZOPONTO').asInteger;
  // 22/06/07

  Data1.Date := CdsParamRH.FieldByName('PONTOINI').asDateTime;
  Data2.Date := CdsParamRH.FieldByName('PONTOFIM').asDateTime;
  if (Data2.Date > Date) and (Data1.Date <= Date) then
    Data2.Date := Date;
  Data1.OnChange := Data1Change;
  Data2.OnChange := Data1Change;
  gbxBancoHoras.Visible := (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1);
  gbxBancoHoras2.Visible := (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1);
  if (gbxBancoHoras2.Visible) then
  begin
    townApuracao.Width := 477;
    townApuracao.Left := Self.Left + 176;
  end
  else
  begin
    townApuracao.Width := 277;
    townApuracao.Left := Self.Left + 256;
  end;
  townApuracao.Top := Self.Top + 86;

  stgrHoras.RowHeights[0] := stgrHoras.Canvas.TextHeight('W') * 2 + 4;

  if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
     (CdsParamRH.FieldByName('INDPERBCHORAS').asInteger = 1) then
  begin
    DataRefBancoHoras := CdsParamRH.FieldByName('DATBANCOHORAS').asDateTime;
    DataLimBancoHoras := StrToDate(FU.IncData(DateToStr(DataRefBancoHoras), 0,
      CdsParamRH.FieldByName('PERBANCOHORAS').asInteger, 0));
  end;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

end;

procedure TfrmControlePonto.FormShow(Sender: TObject);
begin
  inherited;
  bPodeLancar := bbtnLancar.Enabled;
  bbtnLancar.Enabled := false;
  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  iUltEstab := -1;
end;

procedure TfrmControlePonto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlAssociaHorario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlRegAcessoFunc);
  FreeAndNil(CtrlHorarioVariavel);

  FreeAndNil(ListaCodAcesso);
  FreeAndNil(ListaIdMotivo);
  FreeAndNil(ListaIdMotivo2);
  FreeAndNil(ListaIdMotivo3);
  FreeAndNil(ListaIdMotivo4);

  GravaAlteracoes;
  inherited;
end;

procedure TfrmControlePonto.sbtnProcurarClick(Sender: TObject);
begin
  stgrHoras.Visible := false;
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    if (CdsFunc.FieldByName('TIPOSIT').asString = 'D') then
      lblSituacao.Font.Color := clRed
    else
    if (CdsFunc.FieldByName('TIPOSIT').asString = 'F') then
      lblSituacao.Font.Color := clGreen
    else
    if (CdsFunc.FieldByName('TIPOSIT').asString = 'A') then
      lblSituacao.Font.Color := clBlue;

    edMatricula.Text := '  '+Trim(CdsFunc.FieldByName('MATRICULA').asString);
    edNome.Text := '  '+Trim(CdsFunc.FieldByName('NOME').asString);
    lblSituacao.Caption := CdsFunc.FieldByName('SITUACAO').asString;

    bbtnLancar.Enabled := bPodeLancar; // Respeita a autorização do usuário
    bbtnImprimir.Enabled := true;

    gbxOpcEscala.Visible := (CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger > -1);
    RefazGrid;
  end
  else
  begin
    edMatricula.Text := '';
    edNome.Text := '';
    lblSituacao.Caption := '';

    bbtnLancar.Enabled := false;
    bbtnImprimir.Enabled := false;
  end;

  sbtnProcurar.Down := false;
  stgrHoras.Visible := true;
end;

procedure TfrmControlePonto.stgrHorasSelectCell(Sender: TObject; Col, Row: Integer;
  var CanSelect: Boolean);
begin
  //CanSelect := (Row > 0) and (Col <> 5);
  //
  // Prazo Fechamento Ponto
  CanSelect := (Row > 0) and (Col <> 5) and
               not ((Date > DataLimFechamento) and
                    (Data1.Date + Row - 1 <= DataFinalPonto));
  // 22/06/07


  if (Col = 8) then
  begin
    iCol := Col;
    iRow := Row;
    //DrawCombo_e_Checkbox;
  end;

  if ((Col in [1,4]) and (cbxEditBatida.Checked)) or
     ((Col in [1,4,7]) and (cbxEditBatida.Checked) and
      (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1)) or
     ((Col = 9) and
      ((((stgrHoras.Cells[1,Row] <> COL_VAZIA) or
         (stgrHoras.Cells[4,Row] <> COL_VAZIA)) and
        (cbxEditBatida.Checked)) or
       (Trim(stgrHoras.Cells[5,Row]) <> ''))) then
  begin                                                                     
    if not(goEditing in stgrHoras.Options) then
      stgrHoras.Options := stgrHoras.Options + [goEditing];
  end
  else
    stgrHoras.Options := stgrHoras.Options - [goEditing];
end;

procedure TfrmControlePonto.stgrHorasGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
  if (ACol in [1,4]) then
    Value := COL_ZERADA + ';1'
  else
  if (ACol = 5) then
    Value := '>l;0'
  else
  if (ACol = 7) then
    Value := INTERV_ZERADO + ';1';
end;

procedure TfrmControlePonto.stgrHorasKeyPress(Sender: TObject; var Key: Char);
begin
  if (not(UpCase(Key) in ['S','N']) and (stgrHoras.Col = 5)) or
     (not(UpCase(Key) in ['1','2','3','4','5','6','7','8','9','0']) and
      (stgrHoras.Col in [1,4,7]) and
      (cbxEditBatida.Checked)) then
    Key := #0;
end;

procedure TfrmControlePonto.Data1Change(Sender: TObject);
begin
  try
    Data1.Date;
    StrToDate(Data2.Text);
    RefazGrid;
  except
  end;
end;

procedure TfrmControlePonto.btnFecharClick(Sender: TObject);
begin
  Self.Enabled := true;
  townApuracao.Visible := false;
end;

procedure TfrmControlePonto.bbtnLancarClick(Sender: TObject);
begin
  with TfrmLancaHoras.Create(Application) do
  begin
    edNome.Text := frmControlePonto.edNome.Text;
    redRub1.Value := iTotAtraso;
    redRub2.Value := iTotDiurno;
    redRub3.Value := iTotNoturno;
    redRub4.Value := iTotFolga;
    redRub5.Value := iTotAdicNot;
    redRub7.Value := iTotFalta;
    redRub8.Value := iTotFaltaAbon;
    redCredito.Value := iCredito;
    redDebito.Value := iDebito;
    redTransf.Value := iTransfer;

    gbxBancoHoras3.Visible := (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1);

    if (gbxBancoHoras3.Visible) then
    begin
      sDataInicial := '';
      sDataFinal := '';
      if (Data2.Date >= DatalimBancoHoras) then
      begin
        sDataInicial := DateToStr(DataRefBancoHoras);
        sDataFinal := Data1.Text;
      end;

      if (Data1.Date >= DatalimBancoHoras) then
        sDataFinal := DateToStr(FU.IFF(DatalimBancoHoras > Date, DatalimBancoHoras, Date));
    end;

    if ((iTotDiurno + iTotNoturno + iTotFolga) > 0) then
      redRub6.Value := (30 - iQtdRepouso) + iQtdRepouso / 100
    else
      redRub6.Value := 0;

    IdPessoa := CdsFunc.FieldByName('IDPESSOA').asFloat;

    ShowModal;
    Free;
  end;
end;

procedure TfrmControlePonto.bbtnImprimirClick(Sender: TObject);
var
  iLin: integer;
begin
  GImp.ConfigurarImpressora;
  if (GImp.Inicializar) then
  begin
    GImp.EjetarPagina := true;
    GImp.SaltodeLinhaCondensado := false;
    GImp.TipoFonte := TfNormal;
    GImp.Condensado := false;
    GImp.Sublinhado := false;

    GImp.ImprimirTexto(FU.CMTranslate('      Matrícula: ') + edMatricula.Text);
    GImp.ImprimirTexto(FU.CMTranslate('      Nome.....: ') + edNome.Text);
    GImp.ImprimirTexto(FU.CMTranslateMsg(MSG_PERIODO, [Data1.Text, Data2.Text]));
    GImp.ImprimirTexto(' ');
    GImp.ImprimirTexto(FU.CMTranslate(
      '          Data      Entrada Real  Entrada Normal Saída Normal  Saída Real'));
    for iLin:=1 to stgrHoras.RowCount-1 do
      GImp.ImprimirTexto('      ' +
        FU.Alinha(stgrHoras.Cells[0,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[1,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[2,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[3,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[4,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[5,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[6,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[7,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[8,iLin],15,'E', ' ') +
        FU.Alinha(stgrHoras.Cells[9,iLin],15,'E', ' '));
{        Copy(stgrHoras.Cells[0,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[1,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[2,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[3,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[4,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[5,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[6,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[7,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[8,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[9,iLin] + FU.Replicate(' ',15),1,15));}
    GImp.Finalizar;
  end
  else
    MsgDlg(FU.CMTranslate('Verifique a Impressora.'),
      FU.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
end;

procedure TfrmControlePonto.bbtnCalcularClick(Sender: TObject);
var
  sDifer, sDifer2, sNormal, sNormal2, sHoraEnt, sHoraSai, sData: string;
  iCol, iLin, QtMin, QtMin1, QtMin2, QtMinInter, iLimAnt, iLimApo, iLimite,
  iMultExtra, iMultAtraso, iMultHoras, iMultNormal, iTotBatidas, iNumBatida,
  iMultExtraAntes, iMultExtraApos: integer;
  dHoraEnt, dHoraSai: TDateTime;
begin
  ZerarValores;
  iLimite := 0;
  QtMinInter := 0;

  if (CdsFunc.FieldByName('IDESTAB').asInteger <> iUltEstab) then
  begin
    CdsEstab.Data := CtrlPessoaFilialPessoa.ListSubTipo(CdsFunc.FieldByName('IDESTAB').asFloat);

    iUltEstab := CdsFunc.FieldByName('IDESTAB').asInteger;
    iLimAntec := StrToIntDef(CdsEstab.FieldByName('EXTRADIURNOINI').asString,0);
    iLimAposE := StrToIntDef(CdsEstab.FieldByName('EXTRADIURNOFIM').asString,0);
    sAdNotIni := CdsEstab.FieldByName('ADICNOTURINI').asString;
    sAdNotFim := CdsEstab.FieldByName('ADICNOTURFIM').asString;
    sAdNotF24 := IntToStr(FU.StrInt(Copy(sAdNotFim,1,2)) + 24) + Copy(sAdNotFim,3,3);
  end;

  for iLin:=1 to (stgrHoras.RowCount - 1) do
  begin
    QtMin1 := 0;
    QtMin2 := 0;

    bDiaNormalTrb :=
      //((CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 0) and
      // (ArrayFeriado[iLin - 1] = 'E')) or
      //((CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 1) and
        ((not(cbxSabado.Checked)       and (ArrayFeriado[iLin-1] = 'S')) or
         (not(cbxDomingo.Checked)      and (ArrayFeriado[iLin-1] = 'D')) or
         (not(cbxFeriadoOrd.Checked)   and (ArrayFeriado[iLin-1] = 'O')) or
         (not(cbxFeriadoExtra.Checked) and (ArrayFeriado[iLin-1] = 'E')) or
        (ArrayFeriado[iLin - 1] = ' ')); //);

    if ArrayEntradas[iLin] > 1 then // Tratar multiplas batidas
    begin
      sData := copy(stgrHoras.Cells[0, iLin],1,10);
      // ShowMessage('Tratar mult. batidas do dia ' + sData);
      iMultAtraso := 0; iMultExtra := 0; iMultHoras := 0;
      iMultExtraAntes := 0; iMultExtraApos := 0;
      CdsAcessoFunc.Filter := 'Date(ENTRADA) = ' + QuotedStr(sData);
      CdsAcessoFunc.Filtered := true;
      CdsAcessoFunc.First;
      iTotBatidas := CdsAcessoFunc.RecordCount;
      iNumBatida := 0;
      while not CdsAcessoFunc.Eof do
      begin
        inc(iNumBatida);
        if (CdsAcessoFunc.FieldByName('FLGABONADO').asInteger <> 1) then
        begin
          sHoraEnt := Trim(stgrHoras.Cells[2, iLin]);
          sHoraSai := Trim(stgrHoras.Cells[3, iLin]);
          dHoraEnt := StrToDateTime(copy(stgrHoras.Cells[0, iLin],1,10)+' '+sHoraEnt);
          dHoraSai := StrToDateTime(copy(stgrHoras.Cells[0, iLin],1,10)+' '+sHoraSai);
          if dHoraSai < dHoraEnt then
            dHoraSai := dHoraSai + 1;

          // VERIF. ADIC. NOTURNO
          sMultHoraEnt := FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('ENTRADA').asDateTime);

          sMultHoraSai := FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('SAIDA').asDateTime);

          if (sMultHoraEnt < sAdNotFim) then
            if (sMultHoraSai > sAdNotFim) then
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sAdNotFim,1,2)) - FU.StrInt(Copy(sMultHoraEnt,1,2))) * 60 +
                (FU.StrInt(Copy(sAdNotFim,4,2)) - FU.StrInt(Copy(sMultHoraEnt,4,2)))
            else
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
                (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)));

          if (sMultHoraSai < sMultHoraEnt) then
            sMultHoraSai := IntToStr(FU.StrInt(Copy(sMultHoraSai,1,2)) + 24) + Copy(sMultHoraSai,3,3);

          if (sMultHoraEnt > sAdNotIni) then
            sAdNotIni := sMultHoraEnt;

          if (sMultHoraSai > sAdNotIni) then
            if (sMultHoraSai < sAdNotF24) then
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sMultHoraSai,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                (FU.StrInt(Copy(sMultHoraSai,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)))
            else
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));

          // FIM ADIC. NOTURNO

          // Se for a primeira batida, verificar a tolerancia de entrada e extra antecip.
          if (iNumBatida = 1) then
          begin
            sPrimEnt := sMultHoraEnt;
            if (Abs(round(24*60*(dHoraEnt -
              CdsAcessoFunc.FieldByName('ENTRADA').asDateTime))) > ednTolEntra.Value) then
            begin
              if (dHoraEnt > CdsAcessoFunc.FieldByName('ENTRADA').asDateTime) then
              begin
                iMultExtra := iMultExtra + round(24*60*(dHoraEnt -
                  CdsAcessoFunc.FieldByName('ENTRADA').asDateTime));
                iMultExtraAntes := iMultExtraAntes + round(24*60*(dHoraEnt -
                  CdsAcessoFunc.FieldByName('ENTRADA').asDateTime));
              end;
              dHoraEnt := CdsAcessoFunc.FieldByName('ENTRADA').asDateTime;
            end;
          end
          else
            dHoraEnt := CdsAcessoFunc.FieldByName('ENTRADA').asDateTime;

          //  Se for a última batida, verificar a tolerancia de saida e extra após exped.
          if (iNumBatida = iTotBatidas) then
          begin
            sUltSai := sMultHoraSai;
            if (Abs(round(24*60*(dHoraSai -
              CdsAcessoFunc.FieldByName('SAIDA').asDateTime))) > ednTolSaida.Value) then
            begin
              if (dHoraSai < CdsAcessoFunc.FieldByName('SAIDA').asDateTime) then
              begin
                iMultExtra := iMultExtra + round(24*60*(- dHoraSai +
                  CdsAcessoFunc.FieldByName('SAIDA').asDateTime));
                iMultExtraApos := iMultExtraApos + round(24*60*(- dHoraSai +
                  CdsAcessoFunc.FieldByName('SAIDA').asDateTime));
              end;
              dHoraSai := CdsAcessoFunc.FieldByName('SAIDA').asDateTime;
            end;
          end
          else
            dHoraSai := CdsAcessoFunc.FieldByName('SAIDA').asDateTime;

          iMultHoras := iMultHoras + round(24*60*(dHoraSai - dHoraEnt));
        end;
        CdsAcessoFunc.Next;
      end;
      CdsAcessoFunc.Filtered := false;
      CdsAcessoFunc.First;
      if (stgrHoras.Cells[2, iLin] = '') then
        iMultExtra := iMultHoras
      else
      begin
        // Abater o horário de intervalo
        if (copy(trim(stgrHoras.Cells[6, iLin]),1,5) <> '') and
           (sUltSai >= copy(trim(stgrHoras.Cells[6, iLin]),9,5)) and
           (sPrimEnt<= copy(trim(stgrHoras.Cells[6, iLin]),1,5)) then
          iMultHoras := iMultHoras -
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),9,2)) * 60 -
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),12,2)) +
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),1,2)) * 60 +
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),4,2));
        //

        iMultNormal :=
          StrToInt(copy(stgrHoras.Cells[3, iLin],1,2)) * 60 +
          StrToInt(copy(stgrHoras.Cells[3, iLin],4,2)) -
          StrToInt(copy(stgrHoras.Cells[2, iLin],1,2)) * 60 -
          StrToInt(copy(stgrHoras.Cells[2, iLin],4,2)) -
          FU.IFF(stgrHoras.Cells[2, iLin] = '', 0,
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),9,2)) * 60 +
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),12,2)) -
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),1,2)) * 60 -
            StrToInt(copy(trim(stgrHoras.Cells[6, iLin]),4,2)));

        iMultAtraso := iMultAtraso + iMultNormal - iMultHoras + iMultExtra;

        if (cbxAtrasos.Checked) then
          iDebito := iDebito + iMultAtraso
        else
          iTotAtraso := iTotAtraso + iMultAtraso;
      end;

      if (iMultExtra > 0) then
      begin
        if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
           (CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
           (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
        begin
          // Considerar o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
          iCredito := iCredito +
            Round(FU.IFF(iMultExtra <= CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
              iMultExtra, CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) *
              FU.IFF(bDiaNormalTrb, CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat,
              CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat));

          if (iMultExtra > CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
          begin
            iMultExtra := iMultExtra - CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60;
            iMultExtraApos := iMultExtraApos - CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60;
            if iMultExtraApos < 0 then
            begin
              iMultExtraAntes := iMultExtraAntes + iMultExtraApos;
              iMultExtraApos := 0;
              if iMultExtraAntes < 0 then
                iMultExtraAntes := 0;
            end;
          end
          else
          begin
            iMultExtra := 0;
            iMultExtraAntes := 0;
            iMultExtraApos := 0;
          end;
        end
        else if (stgrHoras.Cells[2, iLin] = '') then
          iTotFolga := iTotFolga + iMultExtra;

        iLimite := 0;
        case (rgLimiteDiurnas.ItemIndex) of
          0 : iLimite := iLimAntec;
          1 : iLimite := iLimAposE;
        end;

        if (rgLimiteDiurnas.ItemIndex = 2) then
        begin
          if (iMultExtraAntes <= iLimAntec) then
            iTotDiurno := iTotDiurno + iMultExtraAntes
          else
          begin
            iTotDiurno  := iTotDiurno + iLimAntec;
            iTotNoturno := iTotNoturno + iMultExtraAntes - iLimAntec;
          end;
        end
        else
        begin
          if (iMultExtraAntes <= iLimite) then
          begin
            iTotDiurno := iTotDiurno + iMultExtraAntes;
            iLimite := iLimite - iMultExtraAntes;
          end
          else
          begin
            iTotDiurno := iTotDiurno + iLimite;
            iTotNoturno := iTotNoturno + iMultExtraAntes - iLimite;
            iLimite := 0;
          end;
        end;

        if (rgLimiteDiurnas.ItemIndex = 2) then
        begin
          if (iMultExtraApos <= iLimAposE) then
            iTotDiurno := iTotDiurno + iMultExtraApos
          else
          begin
            iTotDiurno  := iTotDiurno + iLimAposE;
            iTotNoturno := iTotNoturno + iMultExtraApos - iLimAposE;
          end;
        end
        else
        begin
          if (iMultExtraApos <= iLimite) then
          begin
            iTotDiurno := iTotDiurno + iMultExtraApos;
            iLimite := iLimite - iMultExtraApos;
          end
          else
          begin
            iTotDiurno := iTotDiurno + iLimite;
            iTotNoturno := iTotNoturno + iMultExtraApos - iLimite;
            iLimite := 0;
          end;
        end;
      end;
    end // // Final do Tratamento de multiplas batidas
    else
    for iCol:=2 to 3 do
    begin
      if (stgrHoras.Cells[iCol,iLin] = '') and
         (((stgrHoras.Cells[1,iLin]  = COL_VAZIA) and (stgrHoras.Cells[4,iLin] <> COL_VAZIA)) or
          ((stgrHoras.Cells[1,iLin] <> COL_VAZIA) and (stgrHoras.Cells[4,iLin]  = COL_VAZIA))) then
      begin
        MsgDlg(FU.CMTranslateMsg(MSG_INF_DIA, [stgrHoras.Cells[0, iLin]]),
          FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
        townApuracao.Visible := false;
        exit;
      end;

      if (iCol = 2) then
      begin
        // Faltas
        if ((stgrHoras.Cells[1,iLin] = COL_VAZIA) and (stgrHoras.Cells[2,iLin] <> '') and
            (stgrHoras.Cells[4,iLin] = COL_VAZIA) and (stgrHoras.Cells[3,iLin] <> '')) or
            ((stgrHoras.Cells[1,iLin] = COL_ZERADA) and (stgrHoras.Cells[2,iLin] <> '') and
             (stgrHoras.Cells[4,iLin] = COL_ZERADA) and (stgrHoras.Cells[3,iLin] <> '')) then
          if (stgrHoras.Cells[5,iLin] <> 'S') then
          begin
            if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
               (cbxFaltas.Checked) and
               (StrToDate(Copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
              iDebito := iDebito + 8 * 60 // Tem que alterar para a quant. de minutos diários ??
            else
              Inc(iTotFalta);
          end
          else
            Inc(iTotFaltaAbon);

        case (rgLimiteDiurnas.ItemIndex) of
          0 : iLimite := iLimAntec;
          1 : iLimite := iLimAposE;
        end;

        sHoraEnt := Trim(stgrHoras.Cells[2, iLin]);
        if (stgrHoras.Cells[1, iLin] <> COL_VAZIA) then
          sHoraEnt := Trim(stgrHoras.Cells[1, iLin]);
        if (sHoraEnt = COL_VAZIA) then
          sHoraEnt := COL_ZERADA;

        sHoraSai := Trim(stgrHoras.Cells[3, iLin]);
        if (stgrHoras.Cells[4, iLin] <> COL_VAZIA) then
          sHoraSai := Trim(stgrHoras.Cells[4, iLin]);
        if (sHoraSai = COL_VAZIA) then
          sHoraSai := COL_ZERADA;

        if (sHoraEnt = COL_ZERADA) and (sHoraSai = COL_ZERADA) then
          Continue;

        if (sHoraEnt < sAdNotFim) then
          if (sHoraSai > sAdNotFim) then
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sAdNotFim,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
              (FU.StrInt(Copy(sAdNotFim,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)))
          else
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sHoraSai,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
              (FU.StrInt(Copy(sHoraSai,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)));

        if (sHoraSai < sHoraEnt) then
          sHoraSai := IntToStr(FU.StrInt(Copy(sHoraSai,1,2)) + 24) + Copy(sHoraSai,3,3);

        if (sHoraEnt > sAdNotIni) then
          sAdNotIni := sHoraEnt;

        if (sHoraSai > sAdNotIni) then
          if (sHoraSai < sAdNotF24) then
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sHoraSai,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
              (FU.StrInt(Copy(sHoraSai,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)))
          else
            iTotAdicNot := iTotAdicNot +
              (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
              (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
      end;

      if (stgrHoras.Cells[5,iLin] = 'S') or // Abonado
         ((stgrHoras.Cells[1,iLin] = COL_VAZIA) and (stgrHoras.Cells[4,iLin] = COL_VAZIA)) then
        Continue;

      if ((iCol = 2) and (stgrHoras.Cells[1, iLin] = COL_VAZIA)) or
         ((iCol = 3) and (stgrHoras.Cells[4, iLin] = COL_VAZIA)) then
        Continue;

      if ((iCol = 3) and (stgrHoras.Cells[3, iLin] = '')) then
        Continue;

      QtMin := 0;
      sNormal := Trim(stgrHoras.Cells[iCol, iLin]);

      if (iCol = 2) and (stgrHoras.Cells[2, iLin] = '') then
        sNormal := Trim(stgrHoras.Cells[4, iLin]);

      if (iCol = 3) and (stgrHoras.Cells[3, iLin] <> '') and
        (stgrHoras.Cells[3, iLin] < stgrHoras.Cells[4, iLin]) and
        (stgrHoras.Cells[3, iLin] < stgrHoras.Cells[2, iLin]) then
        sNormal := IntToStr(FU.StrInt(Copy(sNormal,1,2)) + 24) + Copy(sNormal,3,3);

      if (iCol = 2) and (stgrHoras.Cells[1, iLin] <> COL_VAZIA) then
      begin
        sDifer := Trim(stgrHoras.Cells[1, iLin]);
        QtMin  := (FU.StrInt(Copy(sNormal,1,2)) - FU.StrInt(Copy(sDifer,1,2))) * 60 +
                  (FU.StrInt(Copy(sNormal,4,2)) - FU.StrInt(Copy(sDifer,4,2)));

        if (stgrHoras.Cells[3, iLin] = '') and (QtMin < 0) and
           (Trim(stgrHoras.Cells[4, iLin]) <  Trim(stgrHoras.Cells[1, iLin]))  and
           (Trim(stgrHoras.Cells[4, iLin]) >  Trim(stgrHoras.Cells[3, iLin])) then
        begin
          if (MsgDlg(FU.CMTranslateMsg(MSG_CONF_SAIDA, [stgrHoras.Cells[0, iLin]]),
                     FU.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) <> mrNo) then
            QtMin := 24*60 + QtMin;
        end;

        if (Abs(QtMin) <= ednTolEntra.Value) then
          QtMin := 0;

        QtMin1 := FU.IFF(QtMin < 0, 0, QtMin);

        // Retorno Intervalo
        QtMinInter := 0;
        if (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
        begin
          sDifer2 := Copy(Trim(stgrHoras.Cells[7,iLin]), 9, 5);
          sNormal2 := Copy(Trim(stgrHoras.Cells[6,iLin]), 9, 5);
          QtMinInter := (FU.StrInt(Copy(sNormal2,1,2)) - FU.StrInt(Copy(sDifer2,1,2))) * 60 +
                        (FU.StrInt(Copy(sNormal2,4,2)) - FU.StrInt(Copy(sDifer2,4,2)));

          if (Abs(QtMinInter) <= ednTolEntra.Value) then
            QtMinInter := 0;

          QtMin1 := QtMin1 + FU.IFF(QtMinInter < 0, 0, QtMinInter);
        end;
      end;

      if (iCol = 3) and (stgrHoras.Cells[4, iLin] <> '') then
      begin
        sDifer := Trim(stgrHoras.Cells[4, iLin]);
        QtMin  := (- FU.StrInt(Copy(sNormal,1,2)) + FU.StrInt(Copy(sDifer,1,2))) * 60 +
                  (- FU.StrInt(Copy(sNormal,4,2)) + FU.StrInt(Copy(sDifer,4,2)));

        if (stgrHoras.Cells[3, iLin] <> '') and (QtMin < 0) and
           (Trim(stgrHoras.Cells[4, iLin]) < Trim(stgrHoras.Cells[2, iLin])) then
          if (Trim(stgrHoras.Cells[4, iLin]) > Trim(stgrHoras.Cells[3, iLin])) or
             ((Trim(stgrHoras.Cells[3, iLin]) > Trim(stgrHoras.Cells[2, iLin])) and
              (MsgDlg(FU.CMTranslate('Confirma que a Saída no Dia ') + stgrHoras.Cells[0, iLin] +
                     FU.CMTranslate(' é Hora Extra?'), FU.CMTranslate('Confirmação'), mtConfirmation,
                     [mbYes,mbNo],0) <> mrNo)) then
            QtMin := 24*60 + QtMin;

        if (Abs(QtMin) <= ednTolSaida.Value) then
          QtMin := 0;

        QtMin2 := FU.IFF(QtMin < 0, 0, QtMin);
        // Saída Intervalo
        if (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
        begin
          sDifer2 := Copy(Trim(stgrHoras.Cells[7,iLin]), 1, 5);
          sNormal2 := Copy(Trim(stgrHoras.Cells[6,iLin]), 1, 5);
          QtMinInter := (- FU.StrInt(Copy(sNormal2,1,2)) + FU.StrInt(Copy(sDifer2,1,2))) * 60 +
                        (- FU.StrInt(Copy(sNormal2,4,2)) + FU.StrInt(Copy(sDifer2,4,2)));

          if (Abs(QtMinInter) <= ednTolSaida.Value) then
            QtMinInter := 0;

          QtMin2 := QtMin2 + FU.IFF(QtMinInter < 0, 0, QtMinInter);
        end;
      end;

      if (stgrHoras.Cells[iCol, iLin] = '') and (QtMin <= 0) then
      begin
        MsgDlg(FU.CMTranslateMsg(MSG_HOR_INCOMP, [stgrHoras.Cells[0, iLin]]),
          FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
        townApuracao.Visible := false;
        exit;
      end;

      iLimAnt := iLimAntec;
      iLimApo := iLimAposE;

      if (CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 1) and not(bDiaNormalTrb) then
      begin
        iLimAnt := 0;
        iLimApo := 0;
        iLimite := 0;
      end;

      if (QtMin < 0) then
      begin
        if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and (cbxAtrasos.Checked) and
           (StrToDate(Copy(stgrHoras.Cells[0,iLin],1,10)) < DataLimBancoHoras) then
        begin
          iDebito := iDebito - QtMin;

          if ((iCol = 2) and (ArrayAlmoco[iLin-1] > 0) and (sDifer > ArrayFimAlmoco[iLin-1]) and
              (stgrHoras.Cells[2, iLin] < ArrayIniAlmoco[iLin-1])) or
             ((iCol = 3) and (ArrayAlmoco[iLin-1] > 0) and (sDifer < ArrayIniAlmoco[iLin-1]) and
              (stgrHoras.Cells[3, iLin] > ArrayFimAlmoco[iLin-1])) then
            iDebito := iDebito - ArrayAlmoco[iLin-1];
        end
        else
        begin
          iTotAtraso := iTotAtraso - QtMin;

          if ((iCol = 2) and (ArrayAlmoco[iLin-1] > 0) and (sDifer > ArrayFimAlmoco[iLin-1]) and
              (stgrHoras.Cells[2, iLin] < ArrayIniAlmoco[iLin-1])) or
             ((iCol = 3) and (ArrayAlmoco[iLin-1] > 0) and (sDifer < ArrayIniAlmoco[iLin-1]) and
              (stgrHoras.Cells[3, iLin] > ArrayFimAlmoco[iLin-1])) then
            iTotAtraso := iTotAtraso - ArrayAlmoco[iLin-1];
        end;
      end;

      if (QtMin >= 0) or (QtMinInter > 0) then
      begin
        QtMin := FU.IFF(QtMin > 0, QtMin, 0) + FU.IFF(QtMinInter > 0, QtMinInter, 0);
        if (iCol = 2) and (stgrHoras.Cells[2, iLin] = '') and
           not(bDiaNormalTrb) and (QtMin > 0) then
          if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
             (CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
             (CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat > 0) and
             (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
          begin
            // Considerar o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
            iCredito := iCredito +
              Round(FU.IFF(QtMin <= CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
                QtMin, CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) *
              CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat);

            if (QtMin > CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
              QtMin := QtMin - CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60
            else
              QtMin := 0;
          end
          else
            iTotFolga := iTotFolga + QtMin;

        if (iCol = 2) and ((stgrHoras.Cells[2, iLin] <> '') or (bDiaNormalTrb)) then
        begin
          // Considerar o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
          if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
             (CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
             (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
          begin
            iCredito := iCredito +
              Round(FU.IFF(QtMin1+QtMin2 <= CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
                QtMin1+QtMin2, CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) *
              CdsParamRH.FieldByName('NORBANCOHORAS').AsFloat);

            if (QtMin > CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
              QtMin := QtMin - CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60
            else
              QtMin := 0;
          end;

          if (rgLimiteDiurnas.ItemIndex = 2) then
          begin
            if (QtMin <= iLimAnt) then
              iTotDiurno := iTotDiurno + QtMin
            else
            begin
              iTotDiurno  := iTotDiurno + iLimAnt;
              iTotNoturno := iTotNoturno + QtMin - iLimAnt;
            end;
          end
          else
          begin
            if (QtMin <= iLimite) then
            begin
              iTotDiurno := iTotDiurno + QtMin;
              iLimite := iLimite - QtMin;
            end
            else
            begin
              iTotDiurno := iTotDiurno + iLimite;
              iTotNoturno := iTotNoturno + QtMin - iLimite;
              iLimite := 0;
            end;
          end;
        end;

        if (iCol = 3) and (stgrHoras.Cells[3, iLin] <> '') then
        begin
          // Considera o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
          if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
             (CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger > 0) and
             (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
          begin
//            iCredito := iCredito +
//              round(FU.IFF(QtMin1+QtMin2 <= CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
//                QtMin1+QtMin2, CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) *
//              CdsParamRH.FieldByName('NORBANCOHORAS').AsFloat);

            iCredito := iCredito +
              round(FU.IFF(QtMin1+QtMin2 <= CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
                QtMin2, CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60 - QtMin1) * CdsParamRH.FieldByName('NORBANCOHORAS').AsFloat);

            if (QtMin1+QtMin2 > CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60) then
              QtMin := QtMin1+QtMin2 - CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60
            else
              QtMin := 0;
          end;

          if (rgLimiteDiurnas.ItemIndex = 2) then
          begin
            if (QtMin <= iLimApo) then
              iTotDiurno := iTotDiurno + QtMin
            else
            begin
              iTotDiurno  := iTotDiurno + iLimApo;
              iTotNoturno := iTotNoturno + QtMin - iLimApo;
            end;
          end
          else
          begin
            if (QtMin <= iLimite) then
              iTotDiurno := iTotDiurno + QtMin
            else
            begin
              iTotDiurno  := iTotDiurno + iLimite;
              iTotNoturno := iTotNoturno + QtMin - iLimite;
            end;
          end;
        end;
        iTotExtra := iTotExtra + QtMin;
      end;

      if (QtMinInter < 0) then
      begin
        if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and (cbxAtrasos.Checked) and
           (StrToDate(Copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
          iDebito := iDebito - QtMinInter
        else
          iTotAtraso := iTotAtraso - QtMinInter;
      end;
    end;
  end;

  iTransfer := 0;
  if (gbxBancoHoras.Visible) then // Banco de Horas
  begin
    if (Data2.Date >= DatalimBancoHoras) then
    begin
      iTransfer := - iSaldoAnterior - iCredito + iDebito;
      if (iTransfer > 0) then
      begin
        iTotAtraso := iTotAtraso + iTransfer;
      end
      else
      begin
        iTotExtra := iTotExtra - iTransfer;
        iTotDiurno := iTotDiurno - iTransfer;
      end;
    end;
 
    iSaldoAtual := iSaldoAnterior + iCredito - iDebito + iTransfer;
    // Parei aqui ! Passar e Gravar iTransfer
  end;

  edAtraso.Text := IntToStr(iTotAtraso);
  edAdicNot.Text := IntToStr(iTotAdicNot);
  edHoraExtra.Text := IntToStr(iTotExtra);
  edDiurna.Text := IntToStr(iTotDiurno);
  edNoturna.Text := IntToStr(iTotNoturno);
  edFolga.Text := IntToStr(iTotFolga);
  edFaltas.Text    := IntToStr(iTotFalta);
  edFaltasAbon.Text := IntToStr(iTotFaltaAbon);
  edSaldoAnterior.Text := IntToStr(iSaldoAnterior);
  edCredito.Text := IntToStr(iCredito);
  edDebito.Text := IntToStr(iDebito);
  edTransferencia.Text := IntToStr(iTransfer);
  edSaldoAtual.Text := IntToStr(iSaldoAtual);
  edSaldoAtual.Text := IntToStr(iSaldoAtual);
  edSaldoAnteriorH.Caption := ConverteMinutos(iSaldoAnterior);
  edCreditoH.Caption := ConverteMinutos(iCredito);
  edDebitoH.Caption := ConverteMinutos(iDebito);
  edTransferenciaH.Caption := ConverteMinutos(iTransfer);
  edSaldoAtualH.Caption := ConverteMinutos(iSaldoAtual);
  townApuracao.Visible := true;
  Self.Enabled := false;
  bbtnLancar.Enabled := bPodeLancar; // Respeita a autorização do usuário
end;

procedure TfrmControlePonto.bbtnLimparClick(Sender: TObject);
begin
  ZerarValores;
  edAtraso.Text := FU.CMTranslate('0 min');
  edAdicNot.Text := FU.CMTranslate('0 min');
  edHoraExtra.Text := FU.CMTranslate('0 min');
  edDiurna.Text := FU.CMTranslate('0 min');
  edNoturna.Text := FU.CMTranslate('0 min');
  edFolga.Text := FU.CMTranslate('0 min');
  townApuracao.Visible := false;
  LimpaAbono;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmControlePonto.ZerarValores;
begin
  iTotAtraso := 0;
  iTotAdicNot := 0;
  iTotExtra := 0;
  iTotDiurno := 0;
  iTotNoturno := 0;
  iTotFolga := 0;
  iTotFalta := 0;
  iTotFaltaAbon := 0;
  iCredito := 0;
  iDebito := 0;
  iSaldoAtual := 0;
end;

procedure TfrmControlePonto.LimparLinha(const Linha: integer);
begin
  stgrHoras.Cells[1,Linha] := COL_VAZIA;
  stgrHoras.Cells[4,Linha] := COL_VAZIA;
  stgrHoras.Cells[5,Linha] := '';
  stgrHoras.Cells[7,Linha] := INTERV_VAZIO;
  stgrHoras.Cells[8,Linha] := '';
  stgrHoras.Cells[9,Linha] := '';
  stgrHoras.Cells[10,Linha] := '';
end;

procedure TfrmControlePonto.LimpaGrid;
var
  iLin: integer;
begin
  for iLin:=1 to (stgrHoras.RowCount - 1) do
  begin
    LimparLinha(iLin);
    bbtnLancar.Enabled := false;
  end;
end;

procedure TfrmControlePonto.LimpaAbono;
var
  iLin: integer;
begin
  for iLin:=1 to (stgrHoras.RowCount - 1) do
  begin
    stgrHoras.Cells[5,iLin] := '';
    bbtnLancar.Enabled := false;
  end;
end;

procedure TfrmControlePonto.RefazGrid;
var
  iCol, iLin, TotHoras, SvLin, iOldRowCount: integer;
  Hora1, Hora2: double;
  DataPesq: TDateTime;
begin
  stgrHoras.Options := stgrHoras.Options - [goEditing];
  ListaCodAcesso.Clear;
  if (CdsFunc.FieldByName('IDPESSOA').asFloat > 0) then
  begin
    LimpaGrid;
    CdsFerias.Data := CtrlFerias.ListFeriasNoPeriodo(CdsFunc.FieldByName('IDPESSOA').asString,
      Data1.Date, Data2.Date);

    CdsFeriados.Data := CtrlListTerceirosRH.ListFeriados(
      CdsFunc.FieldByName('IDCIDADES').asInteger,
      CdsFunc.FieldByName('IDPAIS').asInteger,
      CdsFunc.FieldByName('UF').asString,
      Data1.Date, Data2.Date);

    ArrayFeriado := VarArrayCreate([0, Round(Data2.Date - Data1.Date)], varVariant);
    ArrayAlmoco := VarArrayCreate([0, Round(Data2.Date - Data1.Date)], varVariant);
    ArrayIniAlmoco := VarArrayCreate([0, Round(Data2.Date - Data1.Date)], varVariant);
    ArrayFimAlmoco := VarArrayCreate([0, Round(Data2.Date - Data1.Date)], varVariant);
    ArrayEntradas := VarArrayCreate([1, Round(Data2.Date - Data1.Date)+1], varInteger);

    CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
      CdsFunc.FieldByName('IDPESSOA').asFloat, Data1.Text, Data2.Text);
    bHorarioVariavel := not(CdsHorarioVariavel.IsEmpty);
    if (bHorarioVariavel) then
      MontaArrayHorario;

    TotHoras := 0;
    iLin := 0;
    while (iLin <= Round(Data2.Date - Data1.Date)) do
    begin
      ListaCodAcesso.Add(''); // alimenta a lista dos IdAcessoFunc com nada
      SvLin := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin
      ArrayAlmoco[SvLin] := 0;
      ArrayIniAlmoco[SvLin] := ' ';
      ArrayFimAlmoco[SvLin] := ' ';
      ArrayFeriado[SvLin] := ' ';

      case (DayOfWeek(Data1.Date + SvLin)) of
        1 : ArrayFeriado[SvLin] := 'D';
        7 : ArrayFeriado[SvLin] := 'S';
      end;

      if (CdsFeriados.Locate('DATAFERIADO', StrToDate(DateToStr(Data1.Date + SvLin)), [])) then
        ArrayFeriado[SvLin] := CdsFeriados.FieldByName('FLGTIPO').asString;

      iLin := SvLin;
      Inc(iLin);
    end;
    ListaCodAcesso.Add(''); // alimenta + 1 linha na lista dos IdAcessoFunc com nada

    iOldRowCount := stgrHoras.RowCount;
    stgrHoras.RowCount := Round(Data2.Date - Data1.Date + 2);

    ListaIdMotivo.Clear;
    for iLin:=1 to (stgrHoras.RowCount - 1) do
      ListaIdMotivo.Add('');

    ListaIdMotivo2.Clear;
    for iLin:=1 to (stgrHoras.RowCount - 1) do
      ListaIdMotivo2.Add('');

    ListaIdMotivo3.Clear;
    for iLin:=1 to (stgrHoras.RowCount - 1) do
      ListaIdMotivo3.Add('');

    ListaIdMotivo4.Clear;
    for iLin:=1 to (stgrHoras.RowCount - 1) do
      ListaIdMotivo4.Add('');

    for iLin:=iOldRowCount to stgrHoras.RowCount do
      LimparLinha(iLin);

    // Coloca o Título nas Colunas
    for iCol:=0 to 10 do
      stgrHoras.Cells[iCol, 0] := TituloGrid[iCol];

    // Coloca as Datas + a 1ª Letra do Dia da Semana nas Linhas
    for iLin:=1 to (stgrHoras.RowCount - 1) do
      stgrHoras.Cells[0, iLin] := DateToStr(Data1.Date + iLin - 1) +' '+
        CodDiaSem[DayOfWeek(Data1.Date + iLin - 1)];

    iQtdRepouso := 0;
    iLin := 1;
    while (iLin <= (stgrHoras.RowCount - 1)) do
    begin
      SvLin := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin

      if (bHorarioVariavel) then
        RefazHorario(iLin-1);

      for iCol:=2 to 3 do
      begin
        DataPesq := Data1.Date + SvLin - 1;
        if (CdsHorario.EOF) then
        begin
          if ((DayOfWeek(Data1.Date + SvLin - 1) = 1) or
              (DayOfWeek(Data1.Date + SvLin - 1) = 7)) or
              (CdsFeriados.Locate('DATAFERIADO', Data1.Date+SvLin-1, [])) then
          begin
            stgrHoras.Cells[iCol, SvLin] := '';
            if iCol = 3 then
              stgrHoras.Cells[6, SvLin] := '';
            if (iCol = 2) and (DayOfWeek(Data1.Date + SvLin - 1) <> 7) then
            begin
              Inc(iQtdRepouso);
              if (ArrayFeriado[SvLin - 1] = 'E') then
                Dec(iQtdRepouso);
            end;
          end
          else
            stgrHoras.Cells[iCol, SvLin] :=  FU.CMTranslate('Indefinido');
        end
        else
        begin
          if (CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 0) then
          begin
            if not(CdsFeriados.Locate('DATAFERIADO', DateToStr(DataPesq), [])) and
               (CdsTurno.Locate('IDDIASEMANA', DayOfWeek(DataPesq), [])) then
            begin
              if (iCol = 2) then
              begin
                stgrHoras.Cells[iCol, SvLin] := CdsTurno.FieldByName('INICIOEXPEDIENTE').asString;
                if (CdsTurno.FieldByName('INICIOALMOCO').asString <> '') then
                begin
                  ArrayAlmoco[SvLin - 1] :=
                    (FU.StrInt(Copy(CdsTurno.FieldByName('FINALALMOCO').asString,1,2)) -
                     FU.StrInt(Copy(CdsTurno.FieldByName('INICIOALMOCO').asString,1,2))) * 60 +
                     (FU.StrInt(Copy(CdsTurno.FieldByName('FINALALMOCO').asString,4,2)) -
                      FU.StrInt(Copy(CdsTurno.FieldByName('INICIOALMOCO').asString,4,2)));
                  ArrayIniAlmoco[SvLin - 1] :=
                    Trim(CdsTurno.FieldByName('INICIOALMOCO').asString);
                  ArrayFimAlmoco[SvLin - 1] :=
                    Trim(CdsTurno.FieldByName('FINALALMOCO').asString);
                  stgrHoras.Cells[6, SvLin] :=
                    Trim(CdsTurno.FieldByName('INICIOALMOCO').asString) + ' - ' +
                    Trim(CdsTurno.FieldByName('FINALALMOCO').asString);
                end;
              end
              else
                stgrHoras.Cells[iCol, SvLin] := CdsTurno.FieldByName('FINALEXPEDIENTE').asString;
            end
            else
            begin
              stgrHoras.Cells[iCol, SvLin] := '';
              if iCol = 3 then
                stgrHoras.Cells[6, SvLin] := '';
              if (iCol = 2) and (DayOfWeek(Data1.Date + SvLin - 1) <> 7) then
              begin
                Inc(iQtdRepouso);
                if (ArrayFeriado[SvLin - 1] = 'E') then
                  Dec(iQtdRepouso);
              end;
            end;
          end
          else
          begin  // Escala Rotativa
            if (iCol = 2) and
               ((DayOfWeek(Data1.Date + SvLin - 1) = 1) or
                (CdsFeriados.Locate('DATAFERIADO', DateToStr(Data1.Date+SvLin-1), [])) and
                (CdsFeriados.FieldByName('FLGTIPO').asString <> 'E')) then
              Inc(iQtdRepouso);

            if (iCol = 2) then
              Continue;

            if (CdsFunc.FieldByName('DATAREFHORARIO').IsNull) then
            begin
              stgrHoras.Visible := false;
              MsgDlg(FU.CMTranslate('Falta a Data Ref. do Horário da Pessoa.'),
                FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
              Exit;
            end
            else
            begin
              if (SvLin = 1) then
              begin
                TotHoras := CdsHorario.FieldByName('HORASFOLGA1').asInteger +
                  CdsHorario.FieldByName('HORASSERVICO').asInteger +
                  CdsHorario.FieldByName('HORASFOLGA2').asInteger;
              end;

              if (TotHoras = 0) then
                TotHoras := 1;

              Hora1 := FU.RestoDivisao((Data1.Date + SvLin - 1 -
                CdsFunc.FieldByName('DATAREFHORARIO').asDateTime) * 24, TotHoras) +
                CdsHorario.FieldByName('HORASFOLGA1').asInteger;

              if (Hora1  < 24) then
              begin
                Hora2 := Hora1 + CdsHorario.FieldByName('HORASSERVICO').asFloat;

                if (Hora2 > 24) then
                  Hora2 := Hora2 - 24;

                stgrHoras.Cells[2, SvLin] :=
                  FU.PoeZero(Round(Hora1)) + ':' +
                  FU.PoeZero(Round(Frac(Hora1) * 60));
                stgrHoras.Cells[3, SvLin] :=
                  FU.PoeZero(Round(Hora2)) + ':' +
                  FU.PoeZero(Round(frac(Hora2) * 60));
              end
              else
              begin
                stgrHoras.Cells[2, SvLin] := '';
                stgrHoras.Cells[3, SvLin] := '';
              end;
            end;
          end;
        end;

        if (iCol = 3) and (not CdsFerias.IsEmpty) and
           (Data1.Date + SvLin - 1 >= CdsFerias.FieldByName('INIGOZOFERIAS').asDateTime) and
           (Data1.Date + SvLin - 1 <= CdsFerias.FieldByName('FIMGOZOFERIAS').asDateTime) then
        begin
          stgrHoras.Cells[2, SvLin] :=  '';
          stgrHoras.Cells[3, SvLin] :=  '';
          stgrHoras.Cells[6, SvLin] :=  '';
        end;
      end;
      iLin := SvLin;
      Inc(iLin);
    end;

    // Traz os registros do Ponto
    CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessosPeriodo(
      CdsFunc.FieldByName('IDPESSOA').asFloat, 'P', StrToDate(Data1.Text), StrToDate(Data2.Text));

    while not(CdsAcessoFunc.EOF) do
    begin
      for iLin:=1 to (stgrHoras.RowCount-1) do
      begin
        if (Copy(stgrHoras.Cells[0, iLin],1,10) =
            FormatDateTime('DD/MM/YYYY',CdsAcessoFunc.FieldByName('ENTRADA').asDateTime)) then
        begin
          //stgrHoras.Cells[1,iLin] := Copy(CdsAcessoFunc.FieldByName('ENTRADA').asString,12,5);
          //if (stgrHoras.Cells[1,iLin] = '') then
          //  stgrHoras.Cells[1,iLin] := COL_ZERADA;
          stgrHoras.Cells[1,iLin] := FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('ENTRADA').asDateTime);
          ArrayEntradas[iLin] := ArrayEntradas[iLin] + 1; // Soma batidas feitas no mesmo dia
          if (stgrHoras.Cells[1,iLin] = COL_ZERADA) then
            stgrHoras.Cells[1,iLin] := COL_VAZIA;

          //stgrHoras.Cells[4,iLin] := Copy(CdsAcessoFunc.FieldByName('SAIDA').asString,12,5);
          //if (stgrHoras.Cells[4,iLin] = '') then
          //  stgrHoras.Cells[4,iLin] := COL_ZERADA;
          stgrHoras.Cells[4,iLin] := FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('SAIDA').asDateTime);
          if (stgrHoras.Cells[4,iLin] = COL_ZERADA) then
            stgrHoras.Cells[4,iLin] := COL_VAZIA;

          if (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
          begin
            //stgrHoras.Cells[7,iLin] :=
            //  Copy(CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asString,12,5) +
            //  ' - ' +
            //  Copy(CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asString,12,5);
            //if (stgrHoras.Cells[7,iLin] = ' - ') then
            //  stgrHoras.Cells[7,iLin] := INTERV_ZERADO;
            stgrHoras.Cells[7,iLin] :=
              FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asDateTime)+
              ' - ' +
              FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asDateTime);
            if (stgrHoras.Cells[7,iLin] = COL_ZERADA +' - '+ COL_ZERADA) then
              stgrHoras.Cells[7,iLin] := COL_VAZIA +' - '+ COL_VAZIA;
          end;

          // Indicar se o acesso foi Abonado
          ListaCodAcesso[iLin] := CdsAcessoFunc.FieldByName('IDACESSOFUNC').asString;
          if (CdsAcessoFunc.FieldByName('FLGABONADO').asInteger = 1) then
            stgrHoras.Cells[5,iLin] := 'S';

          // Indicar o Motivo do Abono/Alteração e a Observação do mesmo
          ListaIdMotivo[iLin-1] := CdsAcessoFunc.FieldByName('CODTIPOOCMED').asString;
          ListaIdMotivo2[iLin-1] := CdsAcessoFunc.FieldByName('CODTIPOOCMED2').asString;
          ListaIdMotivo3[iLin-1] := CdsAcessoFunc.FieldByName('CODTIPOOCMED3').asString;
          ListaIdMotivo4[iLin-1] := CdsAcessoFunc.FieldByName('CODTIPOOCMED4').asString;

          dblckMotivo.Hide;
          if (Trim(ListaIdMotivo[iLin-1]) <> '') then
          begin
            dblckMotivo.LookupValue := ListaIdMotivo[iLin-1];
            dblckMotivo.Update;
            stgrHoras.Cells[8,iLin] := dblckMotivo.Text;
          end;

          stgrHoras.Cells[9,iLin] := CdsAcessoFunc.FieldByName('OBSERVACAO').asString;
        end;
      end;
      CdsAcessoFunc.Next;
    end;

    for iLin:=1 to (stgrHoras.RowCount-1) do // Isto não funcionou !!??
      if ArrayEntradas[iLin] > 1 then
        stgrHoras.Cells[10,iLin] := '***';

    // Prazo Fechamento Ponto
    if (Date > DataLimFechamento) and
       ((Data1.Date <= DataFinalPonto) or (Data2.Date <= DataFinalPonto)) then
      MsgDlg(FU.CMTranslate('Alterações Bloquadas até ') +
        FU.IFF(Data2.Date <= DataFinalPonto, Data2.Text, DateToStr(DataFinalPonto)),
        FU.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
    // 22/06/07



    stgrHoras.Col := 1;
    stgrHoras.Row := 1;
    stgrHoras.Repaint;
  end;
end;

procedure TfrmControlePonto.Sel(const IdPessoa: double);
var
  sCampos: string;
begin
  sCampos :=
    '  PF.NOME, F.IDPESSOA, F.MATRICULA, F.IDEMPRESA, F.IDESTAB,'+CR_LF+
    '  F.IDHORARIO, F.DATAREFHORARIO, ST.TIPOSIT, F.FLGMARCAINTERVALO,'+CR_LF+
    '  ('+CR_LF+
    '    TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
    '      ''A'',' +QuotedStr(FU.CMTranslate('(Ativo(a))'))+ ','+CR_LF+
    '      ''F'',' +QuotedStr(FU.CMTranslate('(Afastado(a))'))+ ','+CR_LF+
    '      ''D'',' +QuotedStr(FU.CMTranslate('(Demitido(a))'))+ '))'+CR_LF+
    '  ) AS SITUACAO, F.DATAADMISSAO,'+CR_LF+
    '  ES.IDPAIS, E.IDCIDADES, RTRIM(ES.CODESTADO) AS UF, F.DATBANCOHORAS';

  CdsFunc.Data := CtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(IdPessoa, sCampos);
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab(CdsFunc.FieldByName('IDHORARIO').asInteger);
  CdsTurno.Data := CtrlAssociaHorario.ListTurnoDiaSel(CdsFunc.FieldByName('IDHORARIO').asInteger);

  if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
     (CdsParamRH.FieldByName('INDPERBCHORAS').asInteger = 2) then
  begin
    if CdsFunc.FieldByName('DATBANCOHORAS').asDateTime = 0 then
      DataRefBancoHoras := CdsFunc.FieldByName('DATAADMISSAO').asDateTime
    else
      DataRefBancoHoras := CdsFunc.FieldByName('DATBANCOHORAS').asDateTime;

    DataLimBancoHoras := StrToDate(FU.IncData(DateToStr(DataRefBancoHoras), 0,
      CdsParamRH.FieldByName('PERBANCOHORAS').asInteger, 0));
  end;

  iSaldoAnterior := CtrlBancoHoras.VerificaSaldoBancoHoras(IdPessoa,
    DateToStr(DataRefBancoHoras), DateToStr(DatalimBancoHoras));
end;

procedure TfrmControlePonto.MontaArrayHorario;
var
  i: integer;
begin
  ArrayHorario := VarArrayCreate([0, Round(Data2.Date - Data1.Date)], varInteger);
  for i := 0 to Round(Data2.Date - Data1.Date) do
  begin
    ArrayHorario [i] := CdsFunc.FieldByName('IDHORARIO').asInteger;
    CdsHorarioVariavel.First;
    while not CdsHorarioVariavel.Eof do
    begin
      if (CdsHorarioVariavel.FieldByName('DATAINI').asDateTime <= Data1.Date+i) and
         (CdsHorarioVariavel.FieldByName('DATAFIM').asDateTime >= Data1.Date+i) then
      begin
        ArrayHorario [i] := CdsHorarioVariavel.FieldByName('IDHORARIO').asInteger;
        break;
      end;
      CdsHorarioVariavel.Next;
    end;
  end;
end;

procedure TfrmControlePonto.RefazHorario(i: integer);
begin
  if CdsHorario.FieldByName('IDHORARIO').asInteger <> ArrayHorario [i] then
  begin
    CdsHorario.Data := CtrlHoraTrab.ListHoraTrab(ArrayHorario [i]);
    CdsTurno.Data := CtrlAssociaHorario.ListTurnoDiaSel(ArrayHorario [i]);
  end;
end;

procedure TfrmControlePonto.bbtnGravarClick(Sender: TObject);
var
  bOk: boolean;
  iLin, Abonado, Abonado2, Abonado3, Abonado4: integer;
  sDataHora_Entrada, sDataHora_Saida,
  sDataHora_Entrada_Intervalo, sDataHora_Saida_Intervalo: string;

{->}procedure SetDataHora_Entrada;
    begin
      if (stgrHoras.Cells[1,iLin] = COL_VAZIA) or (stgrHoras.Cells[1,iLin] = COL_ZERADA) then
        sDataHora_Entrada := ''
      else
        sDataHora_Entrada :=
          Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[1,iLin],1,5);
{->}end;

{->}procedure SetDataHora_Saida;
    begin
      if (stgrHoras.Cells[4,iLin] = COL_VAZIA) or (stgrHoras.Cells[4,iLin] = COL_ZERADA) then
        sDataHora_Saida := ''
      else
        sDataHora_Saida :=
          Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[4,iLin],1,5);
{->}end;

{->}procedure SetDataHora_Entrada_Intervalo;
    begin
      if (stgrHoras.Cells[7,iLin] = INTERV_VAZIO) or (stgrHoras.Cells[7,iLin] = INTERV_ZERADO) then
        sDataHora_Entrada_Intervalo := ''
      else
        sDataHora_Entrada_Intervalo :=
          Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[7,iLin],1,5);
{->}end;

{->}procedure SetDataHora_Saida_Intervalo;
    begin
      if (stgrHoras.Cells[7,iLin] = INTERV_VAZIO) or (stgrHoras.Cells[7,iLin] = INTERV_ZERADO) then
        sDataHora_Saida_Intervalo := ''
      else
        sDataHora_Saida_Intervalo :=
          Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[7,iLin],9,5);
{->}end;

{->}function ExisteAcessoLinhaAtual: boolean;
    begin
      if (ListaCodAcesso[iLin] = '') then
        Result := false
      else
        Result := CdsAcessoFunc.Locate('IDACESSOFUNC', FU.StrInt(ListaCodAcesso[iLin]), []);
{->}end;

begin
  inherited;
  if (MsgDlg(FU.CMTranslate('Confirma a Gravação das Entradas/Saídas Editadas?'),
             FU.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) <> mrNo) then
  begin
    // Gravar as Entradas/Saídas Editadas
    for iLin:=1 to (stgrHoras.RowCount - 1) do
    begin
      SetDataHora_Entrada;
      SetDataHora_Saida;
      SetDataHora_Entrada_Intervalo;
      SetDataHora_Saida_Intervalo;

      if (stgrHoras.Cells[5,iLin] = 'S') then
        Abonado := 1
      else
        Abonado := 0;

      bOk := true;
      if not(ExisteAcessoLinhaAtual) then
      begin
        // Marcar Falta Abonada
        if (Abonado = 1) and
           (sDataHora_Entrada = '') and (sDataHora_Saida = '') and
           (stgrHoras.Cells[2,iLin] <> '') and (stgrHoras.Cells[3,iLin] <> '') then
        begin
          bOk := CtrlRegAcessoFunc.InserirAbonoFalta(
            iIdAcessoFunc, CdsFunc.FieldByName('IDPESSOA').asFloat,
            Copy(stgrHoras.Cells[0,iLin],1,10), ListaIdMotivo[iLin-1],
            stgrHoras.Cells[9,iLin]);
          stgrHoras.Cells[1,iLin] := COL_ZERADA;
          stgrHoras.Cells[4,iLin] := COL_ZERADA;
          ListaCodAcesso[iLin] := IntToStr(iIdAcessoFunc);
        end
        else
        // Incluir a linha que tiver a entrada ou saída preenchidos
        if (sDataHora_Entrada <> '') or (sDataHora_Saida <> '') then
        begin
          bOk := CtrlRegAcessoFunc.InserirPontoForcado(iIdAcessoFunc, Abonado,
            CdsFunc.FieldByName('IDPESSOA').asFloat, sDataHora_Entrada,
            sDataHora_Saida, sDataHora_Entrada_Intervalo, sDataHora_Saida_Intervalo,
            ListaIdMotivo[iLin-1], stgrHoras.Cells[9,iLin]);

          ListaCodAcesso[iLin] := IntToStr(iIdAcessoFunc);
        end;
      end
      else
      begin
        // Excluir a linha que NÃO tiver nada preenchido
        if (sDataHora_Entrada = '') and (sDataHora_Saida = '') and
           (sDataHora_Entrada_Intervalo = '') and (sDataHora_Saida_Intervalo = '') and
           (Abonado = 0) then
        begin
          bOk := CtrlRegAcessoFunc.ExcluirAbonoFalta(FU.StrInt(ListaCodAcesso[iLin]));
          LimparLinha(iLin);
          ListaCodAcesso[iLin] := '';
        end
        else
        // Alterar a linha que tiver algo preenchido
        if (Copy(sDataHora_Entrada,12,5) <> Copy(CdsAcessoFunc.FieldByName('ENTRADA').asString,12,5)) or
           (Copy(sDataHora_Saida,12,5) <> Copy(CdsAcessoFunc.FieldByName('SAIDA').asString,12,5)) or
           (Copy(sDataHora_Entrada_Intervalo,12,5) <> Copy(CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asString,12,5)) or
           (Copy(sDataHora_Saida_Intervalo,12,5) <> Copy(CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asString,12,5)) or
           (Abonado <> CdsAcessoFunc.FieldByName('FLGABONADO').asInteger) or
           (ListaIdMotivo[iLin-1] <> CdsAcessoFunc.FieldByName('CODTIPOOCMED').asString) or
           (stgrHoras.Cells[9,iLin] <> CdsAcessoFunc.FieldByName('OBSERVACAO').asString) then
        begin
{          if (sDataHora_Entrada = '') then
            sDataHora_Entrada := CdsAcessoFunc.FieldByName('ENTRADA').asString;

          if (sDataHora_Saida = '') then
            sDataHora_Saida := CdsAcessoFunc.FieldByName('SAIDA').asString;
} // TRECHO EXCLUÍDO EM 11/07/07 PARA PERMITIR LIMPAR UMA BATIDA

          bOk := CtrlRegAcessoFunc.GravarPontoForcado(
            ListaCodAcesso[iLin], IntToStr(Abonado),
            IntToStr(Abonado2), IntToStr(Abonado3), IntToStr(Abonado4),
            sDataHora_Entrada, sDataHora_Saida,
            sDataHora_Entrada_Intervalo, sDataHora_Saida_Intervalo,
            ListaIdMotivo[iLin-1], ListaIdMotivo2[iLin-1],
            ListaIdMotivo3[iLin-1], ListaIdMotivo4[iLin-1], stgrHoras.Cells[9,iLin]);
        end;
      end;

      if not(bOk) then
      begin
        dmCds.CmErroDlg.ErrorMesage.Text := CtrlRegAcessoFunc.MessageInfo;
        dmCds.CmErroDlg.Execute;
        exit;
      end;
    end;
    CdsAcessoFunc.Data := CtrlRegAcessoFunc.ListAcessosPeriodo(
      CdsFunc.FieldByName('IDPESSOA').asFloat, 'P', StrToDate(Data1.Text), StrToDate(Data2.Text));
  end;
end;

procedure TfrmControlePonto.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(FU.ArqConfig);
  ednTolEntra.Value := StrToInt(ArqConfig.ReadString('CONTRPONTO', 'TolerEntra', '0'));
  ednTolSaida.Value := StrToInt(ArqConfig.ReadString('CONTRPONTO', 'TolerSaida', '0'));
  rgLimiteDiurnas.ItemIndex := StrToInt(ArqConfig.ReadString('CONTRPONTO', 'LimiteDiurnas', '2'));
  cbxFaltas.Checked := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'AbateFaltas', 'True'));
  cbxAtrasos.Checked := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'AbateAtrasos', 'True'));
  cbxSabado.Checked := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'Sabado', 'True'));
  cbxDomingo.Checked := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'Domingo', 'True'));
  cbxFeriadoOrd.Checked := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'FeriadoOrd', 'True'));
  cbxFeriadoExtra.Checked := FU.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'FeriadoExtra', 'True'));
end;

procedure TfrmControlePonto.GravaAlteracoes;
begin
  // Grava as últimas alterações das Opções
  ArqConfig.WriteString('CONTRPONTO', 'TolerEntra', IntToStr(ednTolEntra.Value));
  ArqConfig.WriteString('CONTRPONTO', 'TolerSaida', IntToStr(ednTolSaida.Value));
  ArqConfig.WriteString('CONTRPONTO', 'LimiteDiurnas', IntToStr(rgLimiteDiurnas.ItemIndex));
  ArqConfig.WriteString('CONTRPONTO', 'AbateFaltas', FU.BoolToStr(cbxFaltas.Checked,True));
  ArqConfig.WriteString('CONTRPONTO', 'AbateAtrasos', FU.BoolToStr(cbxAtrasos.Checked,True));
  ArqConfig.WriteString('CONTRPONTO', 'Sabado', FU.BoolToStr(cbxSabado.Checked,False));
  ArqConfig.WriteString('CONTRPONTO', 'Domingo', FU.BoolToStr(cbxDomingo.Checked,True));
  ArqConfig.WriteString('CONTRPONTO', 'FeriadoOrd', FU.BoolToStr(cbxFeriadoOrd.Checked,True));
  ArqConfig.WriteString('CONTRPONTO', 'FeriadoExtra', FU.BoolToStr(cbxFeriadoExtra.Checked,False));
end;

procedure TfrmControlePonto.stgrHorasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  sTexto: string;
begin
  inherited;
  if (ACol = 0) or (ARow = 0) then
  begin
    if (ARow = 0) and (ACol = iCol) then // Cabeçalho da coluna ativa
    begin
      stgrHoras.Canvas.Brush.Color := clGray;
      stgrHoras.Canvas.Font.Color := clWhite;
    end
    else
    begin
      stgrHoras.Canvas.Brush.Color := clBtnFace;
      stgrHoras.Canvas.Font.Color := clWindowText;
    end;

    stgrHoras.Canvas.FillRect(Rect);
    Rect.Left := Rect.Left + 4;
    Rect.Top := Rect.Top + 2;
    Rect.Right := Rect.Right - 4;
    if (ARow = 0) then
    begin
      sTexto := stgrHoras.Cells[ACol,ARow];
      Rect.Bottom := Rect.Bottom - 2 + stgrHoras.Canvas.TextHeight(sTexto);
      DrawText(stgrHoras.Canvas.Handle, PAnsiChar(sTexto), Length(sTexto), Rect,
        DT_BOTTOM	or DT_LEFT or DT_NOPREFIX or DT_WORDBREAK);
    end
    else
    if (ACol = 0) then
    begin
      sTexto := Copy(stgrHoras.Cells[ACol,ARow],1,10);
      DrawText(stgrHoras.Canvas.Handle, PAnsiChar(sTexto), Length(sTexto), Rect,
        DT_LEFT or DT_NOPREFIX);

      if (DayOfWeek(StrToDate(Data1.Text)+ARow-1) in [1,7]) then
        stgrHoras.Canvas.Font.Color := clRed
      else
        stgrHoras.Canvas.Font.Color := clBlue;

      sTexto := Copy(stgrHoras.Cells[ACol,ARow],12,1);
      DrawText(stgrHoras.Canvas.Handle, PAnsiChar(sTexto), Length(sTexto), Rect,
        DT_RIGHT or DT_NOPREFIX);
      stgrHoras.Canvas.Font.Color := clBlack;
    end;
  end
  else
  if (ARow = stgrHoras.Row) and (ACol = stgrHoras.Col) then // Célula ativa
  begin
    stgrHoras.Canvas.Brush.Color := clTeal;
    stgrHoras.Canvas.Font.Color := clWhite;
    stgrHoras.Canvas.FillRect(Rect);

    Rect.Left := Rect.Left+2;
    Rect.Top := Rect.Top+2;

    sTexto := stgrHoras.Cells[ACol,ARow];
    DrawText(stgrHoras.Canvas.Handle, PAnsiChar(sTexto), Length(sTexto), Rect,
      DT_LEFT	or DT_BOTTOM or DT_NOPREFIX);
  end
  else
  if (ACol = 5) then // Checkbox de Abono
  begin
    stgrHoras.Canvas.FillRect(Rect);
    DrawCheckBox(ACol, ARow, Rect);
  end;
end;

procedure TfrmControlePonto.stgrHorasMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
  P: TPoint;
begin
  inherited;
  stgrHoras.MouseToCell(X, Y, iCol, iRow);

  if (iRow > 0) then
  begin
    R := stgrHoras.CellRect(iCol, iRow);
    if (iCol = 5) then
      ExchangeCheckBoxValue(iCol, iRow)
    else
    if (iCol = 8) and
       ((((stgrHoras.Cells[1,iRow] <> COL_VAZIA) or (stgrHoras.Cells[4,iRow] <> COL_VAZIA)) and
         (cbxEditBatida.Checked)) or
        (Trim(stgrHoras.Cells[5,iRow]) <> '')) then
    begin
      //P := stgrHoras.ClientToParent(Point(R.Left, R.Top), Self);
      P := pnlLinhas.ScreenToClient(stgrHoras.ClientToScreen(Point(R.Left, R.Top)));
      //P := stgrHoras.ClientToScreen(Point(R.Left, R.Top));
      dblckMotivo.Left := P.X + 1;
      //dblckMotivo.Top := P.Y + 1;
      dblckMotivo.Top := P.Y + pnlLinhas.Top + 2*dblckMotivo.Height;
      dblckMotivo.Width := R.Right - R.Left + 2;
      dblckMotivo.Show;

      if (Trim(ListaIdMotivo[iRow-1]) <> '') then
      begin
        dblckMotivo.LookupValue := ListaIdMotivo[iRow-1];
        dblckMotivo.Update;
      end;

      //dblckMotivo.SetFocus;
      //dblckMotivo.DropDown;

      // Prazo Fechamento Ponto
      if ((Date > DataLimFechamento) and (Data1.Date + iRow - 1 <= DataFinalPonto)) then
        dblckMotivo.Enabled := false
      else
      begin
        dblckMotivo.Enabled := true;
        dblckMotivo.SetFocus;
        dblckMotivo.DropDown;
      end;
      // 22/06/07

    end
    else
    if (dblckMotivo.Visible) then
      dblckMotivo.Hide;
  end;
  stgrHoras.Invalidate;
end;

procedure TfrmControlePonto.dblckMotivoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if (Trim(dblckMotivo.LookupValue) <> '') then
  begin
    ListaIdMotivo[iRow-1] := dblckMotivo.LookupValue;
    stgrHoras.Cells[iCol, iRow] := dblckMotivo.Text;
  end;
end;

procedure TfrmControlePonto.DrawCheckBox(const ACol, ARow: Longint; ARect: TRect);
var
  DrawState: Integer;
  DrawRect: TRect;                            // PAREI AQUI - VER CHECK BOX COM PRAZOPONTO
  StateCheckBox: boolean;
begin
  StateCheckBox := (stgrHoras.Cells[ACol, ARow] = 'S');

  DrawRect := ARect;
  Inc(DrawRect.Top,2);
  Dec(DrawRect.Bottom,2);
  if (StateCheckBox) then
    DrawState := DFCS_BUTTONCHECK or DFCS_CHECKED
  else
    DrawState := DFCS_BUTTONCHECK;

  DrawFrameControl(stgrHoras.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState or DFCS_FLAT);
end;

procedure TfrmControlePonto.ExchangeCheckBoxValue(const ACol, ARow: integer);
begin
  if (stgrHoras.Cells[ACol,ARow] <> 'S') then
    stgrHoras.Cells[ACol,ARow] := 'S'
  else
  begin
    stgrHoras.Cells[ACol,ARow] := '';
    //ListaIdMotivo[iRow-1] := '';
    //stgrHoras.Cells[8,ARow] := '';
    //dblckMotivo.LookupValue := '';
    //dblckMotivo.Update;
    //stgrHoras.Cells[9,ARow] := '';
  end;
end;

procedure TfrmControlePonto.dblckMotivoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    ListaIdMotivo[iRow-1] := '';
    stgrHoras.Cells[iCol, iRow] := '';
    dblckMotivo.LookupValue := '';
    dblckMotivo.Update;
  end;
end;

procedure TfrmControlePonto.stgrHorasDblClick(Sender: TObject);
var
  sData: string;
begin
  inherited;
  sData := copy(stgrHoras.Cells[0, stgrHoras.Row],1,10);
  if trim(stgrHoras.Cells[10, stgrHoras.Row]) = '***' then
  begin
    CdsAcessoFunc.Filter := 'Date(ENTRADA) = ' + QuotedStr(sData);
    CdsAcessoFunc.Filtered := true;
    CdsAcessoFunc.Locate('IDACESSOFUNC', FU.StrInt(ListaCodAcesso[stgrHoras.Row]), []);
    CdsAcessoFunc.ReadOnly := true;
    Self.Enabled := false;
    townMultiplasBatidas.Visible := true;
    edMatriculaMB.Text := edMatricula.Text;
    edNomeMB.Text := edNome.Text;
  end;
end;

procedure TfrmControlePonto.bbtnFecharMBClick(Sender: TObject);
begin
  inherited;
  stgrHoras.Cells[1,stgrHoras.Row] := FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('ENTRADA').asDateTime);
  stgrHoras.Cells[4,stgrHoras.Row] := FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('SAIDA').asDateTime);
  if (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
  begin
    stgrHoras.Cells[7,stgrHoras.Row] :=
      FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asDateTime)+
      ' - ' +
      FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asDateTime);
    if (stgrHoras.Cells[7,stgrHoras.Row] = COL_ZERADA +' - '+ COL_ZERADA) then
      stgrHoras.Cells[7,stgrHoras.Row] := COL_VAZIA +' - '+ COL_VAZIA;
  end;
  // Indicar se o acesso foi Abonado
  ListaCodAcesso[stgrHoras.Row] := CdsAcessoFunc.FieldByName('IDACESSOFUNC').asString;
  if (CdsAcessoFunc.FieldByName('FLGABONADO').asInteger = 1) then
    stgrHoras.Cells[5,stgrHoras.Row] := 'S'
  else
    stgrHoras.Cells[5,stgrHoras.Row] := ' ';

  // Indicar o Motivo do Abono/Alteração e a Observação do mesmo
  ListaIdMotivo[stgrHoras.Row-1] := CdsAcessoFunc.FieldByName('CODTIPOOCMED').asString;

  dblckMotivo.Hide;
  if (Trim(ListaIdMotivo[stgrHoras.Row-1]) <> '') then
  begin
    dblckMotivo.LookupValue := ListaIdMotivo[stgrHoras.Row-1];
    dblckMotivo.Update;
    stgrHoras.Cells[8,stgrHoras.Row] := dblckMotivo.Text;
  end
  else
    stgrHoras.Cells[8,stgrHoras.Row] := '';

  stgrHoras.Cells[9,stgrHoras.Row] := CdsAcessoFunc.FieldByName('OBSERVACAO').asString;
  Self.Enabled := true;
  townMultiplasBatidas.Visible := false;
  CdsAcessoFunc.Filtered := false;
  CdsAcessoFunc.ReadOnly := false;
end;

function TfrmControlePonto.ConverteMinutos(Minutos: integer): string;
begin
  Result := '';
  if Minutos = 0 then
    exit;

  if Minutos < 0 then
    Result := '-';

  Minutos := abs(Minutos);

  Result := Result + FloatToStr(int(Minutos / 60)) + 'h' +
                     FU.PoeZero(Round(Minutos - int(Minutos / 60)*60)) + 'm';

end;

end.
