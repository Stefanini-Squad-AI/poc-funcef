unit fControlePonto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, Mask,
  StdCtrls, DBCtrls, Buttons, Db, DBTables, Wwdatsrc, MAHlpBtn, TB97, Grids, Math, TB97Tlbr,
  IvDictio, IvMulti, MontaSelect, uGImp, ExtCtrls, DBClient, wwdbdatetimepicker, TB97Tlwn,
  TREdit, CMDateTimePicker, uCMClientDataSet,  uCtrlGlobalRH, uCtrlFerias, 
  uCtrlHoraTrab, uCtrlPessoaFuncionario, uCtrlListTerceirosRH, uCtrlAssociaHorario,
  uCtrlPessoaFilialPessoa, uCtrlRegAcessoFunc, uCtrlBancoHoras, uCtrlHorarioVariavel,
  Spin, IniFiles, IvEMulti;

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
    btnFechar: TBitBtn;
    gbxPeriodo: TGroupBox;
    Label4: TLabel;
    Data1: TCMDateTimePicker;
    Data2: TCMDateTimePicker;
    rgLimiteDiurnas: TRadioGroup;
    gbxBancoHoras: TGroupBox;
    cbxFaltas: TCheckBox;
    cbxAtrasos: TCheckBox;
    gbxOpcEscala: TGroupBox;
    cbxSabado: TCheckBox;
    cbxDomingo: TCheckBox;
    cbxFeriadoOrd: TCheckBox;
    cbxFeriadoExtra: TCheckBox;
    stgrHoras: TStringGrid;
    CdsHorarioVariavel: TCMClientDataSet;
    cbxEditBatida: TCheckBox;
    bbtnGravar: TBitBtn;
    gbxTolerancia: TGroupBox;
    Label3: TLabel;
    Label15: TLabel;
    ednTolEntra: TSpinEdit;
    ednTolSaida: TSpinEdit;
    Label35: TLabel;
    CdsParamRH: TCMClientDataSet;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnLancarClick(Sender: TObject);
    procedure Data1Change(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure stgrHorasSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
    procedure stgrHorasGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: String);
    procedure bbtnLimparClick(Sender: TObject);
    procedure bbtnCalcularClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure stgrHorasEnter(Sender: TObject);
    procedure stgrHorasKeyPress(Sender: TObject; var Key: Char);
    procedure cbxEditBatidaClick(Sender: TObject);
    procedure bbtnGravarClick(Sender: TObject);
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
    ArqConfig: TIniFile;

    bDiaNormalTrb, bHorarioVariavel: boolean;
    sAdNotIni, sAdNotFim, sAdNotF24: string;
    ArrayHorario, ArrayFeriado, ArrayAlmoco, ArrayIniAlmoco, ArrayFimAlmoco: variant;
    iUltEstab, iLimAntec, iLimAposE, iTotAtraso, iTotAdicNot,
    iTotFalta, iTotFaltaAbon,
    iTotExtra, iTotDiurno, iTotNoturno, iTotFolga, iQtdRepouso,
    iIdAcessoFunc, iSaldoAnterior, iCredito, iDebito, iTransfer, iSaldoAtual: integer;
    ListaCodAcesso: TStringList;
    DataRefBancoHoras, DataLimBancoHoras: TDateTime;
    TituloGrid: array[1..7] of string;

    procedure ZerarValores;
    procedure RefazGrid;
    procedure LimpaGrid;
    procedure LimpaAbono;
    procedure Sel(IdPessoa: double);
    procedure MontaArrayHorario;
    procedure RefazHorario(i: integer);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmControlePonto: TfrmControlePonto;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH,
  fLancaHoras, dCds;

const
  COL_VAZIA = '  :  ';
  COL_ZERADA = '00:00';
  INTERV_VAZIO = COL_VAZIA +' -  '+ COL_VAZIA;
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

  TituloGrid[1] := fu.CMTranslate('Entrada Real');
  TituloGrid[2] := fu.CMTranslate('Entrada Normal');
  TituloGrid[3] := fu.CMTranslate('Saída Normal');
  TituloGrid[4] := fu.CMTranslate('Saída Real');
  TituloGrid[5] := fu.CMTranslate('Abona (S)');
  TituloGrid[6] := fu.CMTranslate('Intervalo Normal');
  TituloGrid[7] := fu.CMTranslate('Intervalo Real');

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
    'DSRBANCOHORAS, NORBANCOHORAS, INDPERBCHORAS, DATBANCOHORAS');
  Data1.Date := CdsParamRH.FieldByName('PONTOINI').asDateTime;
  Data2.Date := CdsParamRH.FieldByName('PONTOFIM').asDateTime;
  Data1.OnChange := Data1Change;
  Data2.OnChange := Data1Change;
  gbxBancoHoras.Visible := (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1);
  gbxBancoHoras2.Visible := (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1);
  if (gbxBancoHoras2.Visible) then
  begin
    townApuracao.Width := 409;
    townApuracao.Left := Self.Left + 176;
  end
  else
  begin
    townApuracao.Width := 277;
    townApuracao.Left := Self.Left + 256;
  end;
  townApuracao.Top := Self.Top + 86;

  if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
     (CdsParamRH.FieldByName('INDPERBCHORAS').asInteger = 1) then
  begin
    DataRefBancoHoras := CdsParamRH.FieldByName('DATBANCOHORAS').asDateTime;
    DataLimBancoHoras := FU.IncData2(DataRefBancoHoras, 0,
      CdsParamRH.FieldByName('PERBANCOHORAS').asInteger, 0);
  end;

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

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
  GravaAlteracoes;
  inherited;
end;

procedure TfrmControlePonto.FormShow(Sender: TObject);
begin
  inherited;
  RefazGrid;
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

    bbtnLancar.Enabled := true;
    bbtnImprimir.Enabled := true;

    gbxOpcEscala.Visible := (CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 1);
    LimpaGrid;
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

procedure TfrmControlePonto.stgrHorasSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
begin
  CanSelect := ((Col = 5) and (Row > 0) and (not cbxEditBatida.Checked)) or
               (((Col = 1) or (Col = 4) or (Col = 5) or
                ((Col = 7) and (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1))) and
               (Row > 0) and (cbxEditBatida.Checked)) ;
end;

procedure TfrmControlePonto.stgrHorasGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
  if (ACol < 5) then
    Value := '00:00;1'
  else if ((ACol = 7) and (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1)) then
    Value := '00:00 - 00:00;1'
  else
    Value := '>l;0';
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

procedure TfrmControlePonto.stgrHorasEnter(Sender: TObject);
begin
  stgrHoras.Col := 5;
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

    GImp.ImprimirTexto(fu.CMTranslate('      Matrícula: ') + edMatricula.Text);
    GImp.ImprimirTexto(fu.CMTranslate('      Nome.....: ') + edNome.Text);
    GImp.ImprimirTexto(fu.CMTranslateMsg(MSG_PERIODO, [Data1.Text, Data2.Text]));
    GImp.ImprimirTexto(' ');
    GImp.ImprimirTexto(fu.CMTranslate(
      '          Data      Entrada Real  Entrada Normal Saída Normal  Saída Real'));
    for iLin:=1 to stgrHoras.RowCount-1 do
      GImp.ImprimirTexto('      ' +
        Copy(stgrHoras.Cells[0,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[1,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[2,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[3,iLin] + FU.Replicate(' ',15),1,15) +
        Copy(stgrHoras.Cells[4,iLin] + FU.Replicate(' ',15),1,15));
    GImp.Finalizar;
  end
  else
    MsgDlg(fu.CMTranslate('Verifique a Impressora.'),
      fu.CMTranslate('Aviso'), mtWarning, [mbOk,mbHelp], 0);
end;

procedure TfrmControlePonto.bbtnCalcularClick(Sender: TObject);
var
  sDifer, sDifer2, sNormal, sNormal2, sHoraEnt, sHoraSai: string;
  iCol, iLin, QtMin, QtMin1, QtMin2, QtMinInter, iLimAnt, iLimApo, iLimite: integer;
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
    for iCol:=2 to 3 do
    begin
      if (stgrHoras.Cells[iCol,iLin] = '') and
         (((stgrHoras.Cells[1,iLin]  = COL_VAZIA) and (stgrHoras.Cells[4,iLin] <> COL_VAZIA)) or
          ((stgrHoras.Cells[1,iLin] <> COL_VAZIA) and (stgrHoras.Cells[4,iLin]  = COL_VAZIA))) then
      begin
        MsgDlg(fu.CMTranslateMsg(MSG_INF_DIA, [stgrHoras.Cells[0, iLin]]),
          fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
        townApuracao.Visible := false;
        exit;
      end;

      if (iCol = 2) then
      begin
        // Faltas
        if ((stgrHoras.Cells[1,iLin] = COL_VAZIA) and (stgrHoras.Cells[2,iLin] <> '') and
            (stgrHoras.Cells[4,iLin] = COL_VAZIA) and (stgrHoras.Cells[3,iLin] <> '')) or
            ((stgrHoras.Cells[1,iLin] = '00:00') and (stgrHoras.Cells[2,iLin] <> '') and
             (stgrHoras.Cells[4,iLin] = '00:00') and (stgrHoras.Cells[3,iLin] <> '')) then
          if (stgrHoras.Cells[5,iLin] <> 'S') then
          begin
            if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
               (cbxFaltas.Checked) and
               (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
              iDebito := iDebito + 8 * 60 // Tem que alterar para a quant. de minutos diários ??
            else
              inc(iTotFalta);
          end
          else
            inc(iTotFaltaAbon);

        // Falta Abonada
        if (stgrHoras.Cells[5,iLin] = 'S') and
           (stgrHoras.Cells[1,iLin] = COL_VAZIA) and
           (stgrHoras.Cells[4,iLin] = COL_VAZIA) and
           (stgrHoras.Cells[2,iLin] <> '') and
           (stgrHoras.Cells[3,iLin] <> '') then
        begin
          stgrHoras.Cells[1,iLin] := '00:00';
          stgrHoras.Cells[4,iLin] := '00:00';
          CtrlRegAcessoFunc.InserirAbonoFalta(iIdAcessoFunc,
            CdsFunc.FieldByName('IDPESSOA').asFloat,
            Copy(stgrHoras.Cells[0,iLin],1,10));
          ListaCodAcesso[iLin] := IntToStr(iIdAcessoFunc);
        end;

        //Atualiza FlgAbonado
        if (ListaCodAcesso[iLin] <> '') then
          if (stgrHoras.Cells[5,iLin] = 'S') then
            CtrlRegAcessoFunc.GravarFlgAbonado(ListaCodAcesso[iLin],'1')
          else
            if (stgrHoras.Cells[1,iLin] = '00:00') and (stgrHoras.Cells[4,iLin] = '00:00') then
            begin
              stgrHoras.Cells[1,iLin] := COL_VAZIA;
              stgrHoras.Cells[4,iLin] := COL_VAZIA;
              CtrlRegAcessoFunc.ExcluirAbonoFalta(StrToInt(ListaCodAcesso[iLin]));
              ListaCodAcesso[iLin] := '';
            end
            else
              CtrlRegAcessoFunc.GravarFlgAbonado(ListaCodAcesso[iLin],'0');

        case (rgLimiteDiurnas.ItemIndex) of
          0 : iLimite := iLimAntec;
          1 : iLimite := iLimAposE;
        end;

        sHoraEnt := Trim(stgrHoras.Cells[2, iLin]);
        if (stgrHoras.Cells[1, iLin] <> COL_VAZIA) then
          sHoraEnt := Trim(stgrHoras.Cells[1, iLin]);
        if (sHoraEnt = COL_VAZIA) then
          sHoraEnt := '00:00';

        sHoraSai := Trim(stgrHoras.Cells[3, iLin]);
        if (stgrHoras.Cells[4, iLin] <> COL_VAZIA) then
          sHoraSai := Trim(stgrHoras.Cells[4, iLin]);
        if (sHoraSai = COL_VAZIA) then
          sHoraSai := '00:00';

        if (sHoraEnt = '00:00') and (sHoraSai = '00:00') then
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

      if (stgrHoras.Cells[5,iLin] = 'S') or // abonado
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
          if (MsgDlg(fu.CMTranslateMsg(MSG_CONF_SAIDA, [stgrHoras.Cells[0, iLin]]),
                     fu.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) <> mrNo) then
            QtMin := 24*60 + QtMin;
        end;

        if (Abs(QtMin) <= ednTolEntra.Value) then
            QtMin := 0;

         QtMin1 := FU.IFF(QtMin < 0, 0, QtMin);
        
        // Retorno Intervalo
        QtMinInter := 0;
        if (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
        begin
          sDifer2 := copy(Trim(stgrHoras.Cells[7, iLin]), 9, 5);
          sNormal2 := copy(Trim(stgrHoras.Cells[6, iLin]), 9, 5);
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
              (MsgDlg(fu.CMTranslate('Confirma que a Saída no Dia ') + stgrHoras.Cells[0, iLin] +
                     fu.CMTranslate(' é Hora Extra?'), fu.CMTranslate('Confirmação'), mtConfirmation,
                     [mbYes,mbNo],0) <> mrNo)) then
            QtMin := 24*60 + QtMin;

        if abs(QtMin) <= ednTolSaida.Value then
          QtMin := 0;

        QtMin2 := FU.IFF(QtMin < 0, 0, QtMin);
        // Saída Intervalo
        if (CdsFunc.FieldByName('FLGMARCAINTERVALO').asInteger = 1) then
        begin
          sDifer2 := copy(Trim(stgrHoras.Cells[7, iLin]), 1, 5);
          sNormal2 := copy(Trim(stgrHoras.Cells[6, iLin]), 1, 5);
          QtMinInter := (- FU.StrInt(Copy(sNormal2,1,2)) + FU.StrInt(Copy(sDifer2,1,2))) * 60 +
                        (- FU.StrInt(Copy(sNormal2,4,2)) + FU.StrInt(Copy(sDifer2,4,2)));

          if abs(QtMinInter) <= ednTolSaida.Value then
            QtMinInter := 0;

         QtMin2 := QtMin2 + FU.IFF(QtMinInter < 0, 0, QtMinInter);
        end;
      end;

      if (stgrHoras.Cells[iCol, iLin] = '') and (QtMin <= 0) then
      begin
        MsgDlg(fu.CMTranslateMsg(MSG_HOR_INCOMP, [stgrHoras.Cells[0, iLin]]),
          fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
        townApuracao.Visible := false;
        exit;
      end;

      iLimAnt := iLimAntec;
      iLimApo := iLimAposE;

      bDiaNormalTrb := ((CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 0) and
                       (ArrayFeriado[iLin - 1] = 'E')) or
                      ((CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 1) and
                       (((not cbxSabado.Checked)       and (ArrayFeriado[iLin - 1] = 'S')) or
                        ((not cbxDomingo.Checked)      and (ArrayFeriado[iLin - 1] = 'D')) or
                        ((not cbxFeriadoOrd.Checked)   and (ArrayFeriado[iLin - 1] = 'O')) or
                        ((not cbxFeriadoExtra.Checked) and (ArrayFeriado[iLin - 1] = 'E')) or
                        (ArrayFeriado[iLin - 1] = ' ')));

      if (CdsHorario.FieldByName('FLGTIPOHORARIO').asInteger = 1) and (not bDiaNormalTrb) then
      begin
        iLimAnt := 0;
        iLimApo := 0;
        iLimite := 0;
      end;

      if (QtMin < 0) then
      begin
        if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and (cbxAtrasos.Checked) and
           (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
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
        if (iCol = 2) and (stgrHoras.Cells[2, iLin] = '') and (not bDiaNormalTrb) and (QtMin > 0) then
          if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
             (CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat > 0) and
             (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
          begin
            iCredito := iCredito + round(QtMin * CdsParamRH.FieldByName('DSRBANCOHORAS').AsFloat);
            QtMin := 0;
          end
          else
            iTotFolga := iTotFolga + QtMin;

        if (iCol = 2) and ((stgrHoras.Cells[2, iLin] <> '') or (bDiaNormalTrb)) then
        begin
          // Considera o limite diário de horas extras para o Banco de Horas (LIMBANCOHORAS)
          if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and
             (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
          begin
            iCredito := iCredito +
              Round(fu.IFF(QtMin1+QtMin2 <= CdsParamRH.FieldByName('LIMBANCOHORAS').asInteger*60,
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
      //
      if (QtMinInter < 0) then
      begin
        if (CdsParamRH.FieldByName('FLGBANCOHORAS').asInteger = 1) and (cbxAtrasos.Checked) and
           (StrToDate(copy(stgrHoras.Cells[0, iLin],1,10)) < DataLimBancoHoras) then
          iDebito := iDebito - QtMinInter
        else
          iTotAtraso := iTotAtraso - QtMinInter;
      end;
      //
    end;
  end;

  iTransfer := 0;
  if (gbxBancoHoras.Visible) then // Banco de Horas
  begin
    if (Data2.Date >= DatalimBancoHoras) then
      if (iSaldoAnterior < 0) then
      begin
        iTransfer := -iSaldoAnterior;
        iTotAtraso := iTotAtraso - iSaldoAnterior;
      end
      else
      begin
        iTransfer := -iSaldoAnterior;
        iTotExtra := iTotExtra + iSaldoAnterior;
        iTotDiurno := iTotDiurno + iSaldoAnterior;
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
  townApuracao.Visible := true;
  Self.Enabled := false;
  bbtnLancar.Enabled := true;
end;

procedure TfrmControlePonto.bbtnLimparClick(Sender: TObject);
begin
  ZerarValores;
  edAtraso.Text := fu.CMTranslate('0 min');
  edAdicNot.Text := fu.CMTranslate('0 min');
  edHoraExtra.Text := fu.CMTranslate('0 min');
  edDiurna.Text := fu.CMTranslate('0 min');
  edNoturna.Text := fu.CMTranslate('0 min');
  edFolga.Text :=fu.CMTranslate('0 min');
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

procedure TfrmControlePonto.LimpaGrid;
var
  iLin: integer;
begin
  for iLin:=1 to (stgrHoras.RowCount - 1) do
  begin
    stgrHoras.Cells[1,iLin] := COL_VAZIA;
    stgrHoras.Cells[4,iLin] := COL_VAZIA;
    stgrHoras.Cells[5,iLin] := '';
    stgrHoras.Cells[7,iLin] := '  :   -   :  ';
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
  ListaCodAcesso.Clear;
  if (CdsFunc.FieldByName('IDPESSOA').asFloat > 0) then
  begin
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

    CdsHorarioVariavel.Data := CtrlHorarioVariavel.ListHorarioVariavel(
      CdsFunc.FieldByName('IDPESSOA').asFloat, Data1.Text, Data2.Text);
    bHorarioVariavel := not CdsHorarioVariavel.Eof;
    if bHorarioVariavel then
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

    for iLin:=iOldRowCount to stgrHoras.RowCount do
    begin
      stgrHoras.Cells[1,iLin] := COL_VAZIA;
      stgrHoras.Cells[4,iLin] := COL_VAZIA;
      stgrHoras.Cells[5,iLin] := '';
    end;

    // Coloca o Título nas Colunas
    for iCol:=1 to 7 do
      stgrHoras.Cells[iCol, 0] := TituloGrid[iCol];

    // Coloca as Datas + a 1ª Letra do Dia da Semana nas Linhas
    for iLin:=1 to (stgrHoras.RowCount - 1) do
      stgrHoras.Cells[0, iLin] := DateToStr(Data1.Date + iLin - 1) +' '+
        CodDiaSem[DayOfWeek(Data1.Date + iLin - 1)];

    iQtdRepouso:=0; iLin:=1;
    while (iLin <= (stgrHoras.RowCount - 1)) do
    begin
      SvLin := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin

      if bHorarioVariavel then
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
            stgrHoras.Cells[iCol, SvLin] :=  fu.CMTranslate('Indefinido');
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
              MsgDlg(fu.CMTranslate('Falta a Data Ref. do Horário da Pessoa.'),
                fu.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
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
      inc(iLin);
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
          //  stgrHoras.Cells[1,iLin] := '00:00';
          stgrHoras.Cells[1,iLin] := FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('ENTRADA').asDateTime);
          if (stgrHoras.Cells[1,iLin] = COL_ZERADA) then
            stgrHoras.Cells[1,iLin] := COL_VAZIA;

          //stgrHoras.Cells[4,iLin] := Copy(CdsAcessoFunc.FieldByName('SAIDA').asString,12,5);
          //if (stgrHoras.Cells[4,iLin] = '') then
          //  stgrHoras.Cells[4,iLin] := '00:00';
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
            //  stgrHoras.Cells[7,iLin] := '00:00 - 00:00';
            stgrHoras.Cells[7,iLin] :=
              FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asDateTime)+
              ' - ' +
              FormatDateTime('HH:NN',CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asDateTime);
            if (stgrHoras.Cells[7,iLin] = COL_ZERADA +' - '+ COL_ZERADA) then
              stgrHoras.Cells[7,iLin] := COL_VAZIA +' - '+ COL_VAZIA;
          end;

          ListaCodAcesso[iLin] := CdsAcessoFunc.FieldByName('IDACESSOFUNC').asString;
          if (CdsAcessoFunc.FieldByName('FLGABONADO').asInteger = 1) then
            stgrHoras.Cells[5,iLin] := 'S';

          //break;
        end;
      end;
      CdsAcessoFunc.Next;
    end;
  end;
end;

procedure TfrmControlePonto.Sel(IdPessoa: double);
var
  sCampos: string;
begin
  sCampos :=
    '  PF.NOME, F.IDPESSOA, F.MATRICULA, F.IDEMPRESA, F.IDESTAB,'+CR_LF+
    '  F.IDHORARIO, F.DATAREFHORARIO, ST.TIPOSIT, F.FLGMARCAINTERVALO,'+CR_LF+
    '  ('+CR_LF+
    '    TO_CHAR(DECODE(ST.TIPOSIT,'+CR_LF+
    '      ''A'',' +QuotedStr(fu.CMTranslate('(Ativo(a))'))+ ','+CR_LF+
    '      ''F'',' +QuotedStr(fu.CMTranslate('(Afastado(a))'))+ ','+CR_LF+
    '      ''D'',' +QuotedStr(fu.CMTranslate('(Demitido(a))'))+ '))'+CR_LF+
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

    DataLimBancoHoras := FU.IncData2(DataRefBancoHoras, 0,
      CdsParamRH.FieldByName('PERBANCOHORAS').asInteger, 0);
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

procedure TfrmControlePonto.cbxEditBatidaClick(Sender: TObject);
begin
  inherited;
  bbtnGravar.Enabled := cbxEditBatida.Checked;
end;

procedure TfrmControlePonto.bbtnGravarClick(Sender: TObject);
var
  bOk: boolean;
  iLin, Abonado: integer;
begin
  inherited;
  if (MsgDlg(fu.CMTranslate('Confirma a Gravação das Entradas/Saídas Editadas?'),
             fu.CMTranslate('Confirmação'), mtConfirmation, [mbYes,mbNo],0) <> mrNo) then
  begin
    // Gravar as Entradas/Saídas Editadas
    for iLin:=1 to (stgrHoras.RowCount - 1) do
    begin
      if (stgrHoras.Cells[5,iLin] = 'S') then
        Abonado := 1
      else
        Abonado := 0;

      if (ListaCodAcesso[iLin] <> '') and
         (CdsAcessoFunc.Locate('IDACESSOFUNC', FU.StrInt(ListaCodAcesso[iLin]), [])) and
         ((stgrHoras.Cells[1,iLin] <> Copy(CdsAcessoFunc.FieldByName('ENTRADA').asString,12,5)) or
          (stgrHoras.Cells[4,iLin] <> Copy(CdsAcessoFunc.FieldByName('SAIDA').asString,12,5)) or
          (Copy(stgrHoras.Cells[7,iLin],1,5) <> Copy(CdsAcessoFunc.FieldByName('SAIDAINTERVALO').asString,12,5)) or
          (Copy(stgrHoras.Cells[7,iLin],9,5) <> Copy(CdsAcessoFunc.FieldByName('RETORNOINTERVALO').asString,12,5))) then
      begin
        if (stgrHoras.Cells[1,iLin] = COL_VAZIA) and (stgrHoras.Cells[4,iLin] = COL_VAZIA) then
        begin
          bOk := CtrlRegAcessoFunc.ExcluirPontoForcado(FU.StrInt(ListaCodAcesso[iLin]),
            StrToDate(Copy(stgrHoras.Cells[0,iLin],1,10)));
          ListaCodAcesso[iLin] := '';
        end
        else
        begin
          bOk := CtrlRegAcessoFunc.GravarPontoForcado(
            ListaCodAcesso[iLin], IntToStr(Abonado),
            Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[1,iLin],1,5),
            Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[4,iLin],1,5),
            FU.IFF(
              (stgrHoras.Cells[7,iLin] = INTERV_VAZIO) or
              (stgrHoras.Cells[7,iLin] = INTERV_ZERADO), '',
              Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[7,iLin],1,5)),
            FU.IFF(
              (stgrHoras.Cells[7,iLin] = INTERV_VAZIO) or
              (stgrHoras.Cells[7,iLin] = INTERV_ZERADO), '',
              Copy(stgrHoras.Cells[0,iLin],1,10) +' '+ Copy(stgrHoras.Cells[7,iLin],9,5)));
        end;

        if not(bOk) then
        begin
          dmCds.CmErroDlg.ErrorMesage.Text := CtrlRegAcessoFunc.MessageInfo;
          dmCds.CmErroDlg.Execute;
          exit;
        end;
      end;
      
      if (ListaCodAcesso[iLin] = '') and
         ((stgrHoras.Cells[1,iLin] <> COL_VAZIA) or
          (stgrHoras.Cells[4,iLin] <> COL_VAZIA)) then
      begin
        CtrlRegAcessoFunc.InserirPontoForcado(iIdAcessoFunc, Abonado,
          CdsFunc.FieldByName('IDPESSOA').asFloat,
          Copy(stgrHoras.Cells[0,iLin],1,10)+' '+Copy(stgrHoras.Cells[1,iLin],1,5),
          Copy(stgrHoras.Cells[0,iLin],1,10)+' '+Copy(stgrHoras.Cells[4,iLin],1,5),
          FU.IFF((stgrHoras.Cells[7,iLin] = INTERV_VAZIO) or
            (stgrHoras.Cells[7,iLin] = INTERV_ZERADO), '',
             Copy(stgrHoras.Cells[0,iLin],1,10)+' '+Copy(stgrHoras.Cells[7,iLin],1,5)),
          FU.IFF((stgrHoras.Cells[4,iLin] = INTERV_VAZIO) or
            (stgrHoras.Cells[7,iLin] = INTERV_ZERADO), '',
             Copy(stgrHoras.Cells[0,iLin],1,10)+' '+Copy(stgrHoras.Cells[7,iLin],9,5)));
        ListaCodAcesso[iLin] := IntToStr(iIdAcessoFunc);
      end;
    end;
  end;
end;

procedure TfrmControlePonto.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  ArqConfig := TIniFile.Create(fu.ArqConfig);
  ednTolEntra.Value := StrToInt(ArqConfig.ReadString('CONTRPONTO', 'TolerEntra', '0'));
  ednTolSaida.Value := StrToInt(ArqConfig.ReadString('CONTRPONTO', 'TolerSaida', '0'));
  rgLimiteDiurnas.ItemIndex := StrToInt(ArqConfig.ReadString('CONTRPONTO', 'LimiteDiurnas', '2'));
  cbxFaltas.Checked := fu.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'AbateFaltas', 'True'));
  cbxAtrasos.Checked := fu.StrToBool(ArqConfig.ReadString('CONTRPONTO', 'AbateAtrasos', 'True'));
end;

procedure TfrmControlePonto.GravaAlteracoes;
begin
  // Grava as últimas alterações das Opções
  ArqConfig.WriteString('CONTRPONTO', 'TolerEntra', IntToStr(ednTolEntra.Value));
  ArqConfig.WriteString('CONTRPONTO', 'TolerSaida', IntToStr(ednTolSaida.Value));
  ArqConfig.WriteString('CONTRPONTO', 'LimiteDiurnas', IntToStr(rgLimiteDiurnas.ItemIndex));
  ArqConfig.WriteString('CONTRPONTO', 'AbateFaltas', fu.BoolToStr(cbxFaltas.Checked,True));
  ArqConfig.WriteString('CONTRPONTO', 'AbateAtrasos', fu.BoolToStr(cbxAtrasos.Checked,True));
end;

end.
