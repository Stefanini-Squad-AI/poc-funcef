// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fRegHoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda, Mask,
  StdCtrls, DBCtrls, Buttons, Db, DBTables, Wwdatsrc, MAHlpBtn, TB97, Grids, Math, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, MontaSelect, uGImp, IniFiles, ExtCtrls, DBClient, wwdbdatetimepicker,
  CMDateTimePicker, uCMClientDataSet, uCtrlGlobalRH, uCtrlFerias, uCtrlPessoaFuncionario,
  uCtrlListTerceirosRH, uCtrlHoraTrab, uCtrlAssociaHorario, uCtrlPessoaFilialPessoa;

type
  TfrmRegHoras = class(TfrmSairAjuda)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblSituacao: TLabel;
    sbtnProcurar: TSpeedButton;
    stgrHoras: TStringGrid;
    Data1: TCMDateTimePicker;
    Data2: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    gbxApuracao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edAtraso: TEdit;
    edHoraExtra: TEdit;
    Bevel1: TBevel;
    edDiurna: TEdit;
    edNoturna: TEdit;
    edFolga: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    bbtnLancar: TBitBtn;
    Label11: TLabel;
    edAdicNot: TEdit;
    Bevel2: TBevel;
    gbxOpcEscala: TGroupBox;
    cbxSabado: TCheckBox;
    cbxDomingo: TCheckBox;
    cbxFeriadoOrd: TCheckBox;
    cbxFeriadoExtra: TCheckBox;
    bbtnSalvar: TBitBtn;
    bbtnCarregar: TBitBtn;
    SaveDlg: TSaveDialog;
    OpenDlg: TOpenDialog;
    rgLimiteDiurnas: TRadioGroup;
    bbtnImprimir: TBitBtn;
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
    cbxAdNotDSR: TCheckBox;
    gbxAdNotDSR: TGroupBox;
    edAdicNotDSR: TEdit;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnLancarClick(Sender: TObject);
    procedure Data1Change(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnCarregarClick(Sender: TObject);
    procedure bbtnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure stgrHorasSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
    procedure stgrHorasGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: String);
    procedure bbtnLimparClick(Sender: TObject);
    procedure bbtnCalcularClick(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlFerias: TCtrlFerias;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlAssociaHorario: TCtrlAssociaHorario;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    ArqConfig: TIniFile;
    bDiaNormalTrb: boolean;
    sAdNotIni, sAdNotFim, sAdNotF24: string;
    ArrayFeriado, ArrayAlmoco, ArrayIniAlmoco, ArrayFimAlmoco: variant;
    iUltEstab, iLimAntec, iLimAposE, iTotAtraso, iTotAdicNot, iTotAdicNotDSR,
    iTotExtra, iTotDiurno, iTotNoturno, iTotFolga, iQtdRepouso: integer;

    procedure ZerarValores;
    procedure RefazGrid;
    procedure LimpaGrid;
    procedure Sel(IdPessoa: double);
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
  end;

var
  frmRegHoras: TfrmRegHoras;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, fLancaHoras, uCtrlUsoGeralRH;

const
  COL_VAZIA = '  :  ';
var
  CodDiaSem: array[1..7] of string  = ('D','S','T','Q','Q','S','S');
  TituloGrid: array[1..4] of string = ('Entrada Real', 'Entrada Normal',
                                       'Saída Normal', 'Saída Real');

{$R *.DFM}

procedure TfrmRegHoras.FormCreate(Sender: TObject);
begin
  inherited;
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

  with (MontaSelect.Filtro) do
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

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  sbtnProcurarClick(Self);
  if not(MontaSelect.RetornouValor) then
    Sel(-1);

  CtrlGlobalRH.DbParamRH.LoadFromDb;
  Data1.Date := CtrlGlobalRH.DbParamRH.NormalIni.asDateTime;
  Data2.Date := CtrlGlobalRH.DbParamRH.NormalFim.asDateTime;
  Data1.OnChange := Data1Change;
  Data2.OnChange := Data1Change;

  iUltEstab := -1;
  LeAlteracoes;

  OpenDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmRegHoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaAlteracoes;

  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlFerias);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlAssociaHorario);
  FreeAndNil(CtrlPessoaFilialPessoa);
  inherited;
end;

procedure TfrmRegHoras.FormShow(Sender: TObject);
begin
  inherited;
  RefazGrid;
end;

procedure TfrmRegHoras.sbtnProcurarClick(Sender: TObject);
begin
  stgrHoras.Visible := false;
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));

    if (CdsFunc.FieldByName('TipoSit').asString = 'D') then
      lblSituacao.Font.Color := clRed
    else
    if (CdsFunc.FieldByName('TipoSit').asString = 'F') then
      lblSituacao.Font.Color := clGreen
    else
    if (CdsFunc.FieldByName('TipoSit').asString = 'A') then
      lblSituacao.Font.Color := clBlue;

    edMatricula.Text := '  '+Trim(CdsFunc.FieldByName('Matricula').asString);
    edNome.Text := '  '+Trim(CdsFunc.FieldByName('Nome').asString);
    lblSituacao.Caption := CdsFunc.FieldByName('Situacao').asString;

    bbtnLancar.Enabled := true;
    bbtnSalvar.Enabled := true;
    bbtnCarregar.Enabled := true;
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
    bbtnSalvar.Enabled := false;
    bbtnCarregar.Enabled := false;
    bbtnImprimir.Enabled := false;
  end;

  sbtnProcurar.Down := false;
  stgrHoras.Visible := true;
end;

procedure TfrmRegHoras.stgrHorasSelectCell(Sender: TObject; Col, Row: Integer; var CanSelect: Boolean);
begin
  inherited;
  CanSelect := ((Col = 1) or (Col = 4)) and (Row > 0);
end;

procedure TfrmRegHoras.stgrHorasGetEditMask(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
  Value := '00:00;1';
end;

procedure TfrmRegHoras.Data1Change(Sender: TObject);
begin
  try
    Data1.Date;
    StrToDate(Data2.Text);
    RefazGrid;
  except
  end;
end;

procedure TfrmRegHoras.bbtnLancarClick(Sender: TObject);
begin
  with TfrmLancaHoras.Create(Application) do
  begin
    edNome.Text := frmRegHoras.edNome.Text;
    redRub1.Value := iTotAtraso;
    redRub2.Value := iTotDiurno;
    redRub3.Value := iTotNoturno;
    redRub4.Value := iTotFolga;
    redRub5.Value := iTotAdicNot;
    redRub7.Value := iTotAdicNotDSR;

    lblAdNotDSR1.Visible := frmRegHoras.cbxAdNotDSR.Checked;
    lblAdNotDSR2.Visible := frmRegHoras.cbxAdNotDSR.Checked;
    dblckRub7.Visible := frmRegHoras.cbxAdNotDSR.Checked;
    redRub7.Visible := frmRegHoras.cbxAdNotDSR.Checked;

    if not (frmRegHoras.cbxAdNotDSR.Checked) then
    begin
      pgbrRub.Top := Label11.Top;
      Label11.Top := lblAdNotDSR1.Top;
      Label12.Top := lblAdNotDSR1.Top;
      dblckRub6.Top := dblckRub7.Top;
      redRub6.Top := redRub7.Top;
      Height := 335;
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

procedure TfrmRegHoras.bbtnSalvarClick(Sender: TObject);
var
  iLin: integer;
  ListaHoras: TStringList;
begin
  if (SaveDlg.Execute) then
  begin
    ListaHoras := TStringList.Create;

    for iLin:=0 to (stgrHoras.RowCount - 1) do
      ListaHoras.Add(stgrHoras.Rows[iLin].Text);

    ListaHoras.SaveToFile(SaveDlg.FileName);
    ListaHoras.Free;
  end;
end;

procedure TfrmRegHoras.bbtnCarregarClick(Sender: TObject);
var
  iCol, iLin: integer;
  ListaHoras: TStringList;
begin
  if (OpenDlg.Execute) then
  begin
    ListaHoras := TStringList.Create;
    ListaHoras.LoadFromFile(OpenDlg.FileName);

    for iLin:=0 to (stgrHoras.RowCount - 1) do
      for iCol:=0 to 5 do
        if (iCol < 5) then
          stgrHoras.Cells[iCol,iLin] := ListaHoras.Strings[iLin*6 + iCol];

    ListaHoras.Free;
  end;
end;

procedure TfrmRegHoras.bbtnImprimirClick(Sender: TObject);
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

    GImp.ImprimirTexto('      Matrícula: ' + edMatricula.Text);
    GImp.ImprimirTexto('      Nome.....: ' + edNome.Text);
    GImp.ImprimirTexto('      Período..: ' + Data1.Text + ' a ' + Data2.Text);
    GImp.ImprimirTexto(' ');
    GImp.ImprimirTexto('          Data      Entrada Real  Entrada Normal' +
                       ' Saída Normal  Saída Real' );
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
    MessageDlg('Verifique a Impressora.', mtWarning, [mbOk], 0);
end;

procedure TfrmRegHoras.bbtnCalcularClick(Sender: TObject);
var
  sDifer, sNormal, sHoraEnt, sHoraSai: string;
  iCol, iLin, QtMin, iLimAnt, iLimApo, iLimite: integer;
begin
  ZerarValores;
  iLimite := 0;

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
    for iCol:=2 to 3 do
    begin
      if (stgrHoras.Cells[iCol,iLin] = '') and
         (((stgrHoras.Cells[1,iLin]  = COL_VAZIA) and (stgrHoras.Cells[4,iLin] <> COL_VAZIA)) or
          ((stgrHoras.Cells[1,iLin] <> COL_VAZIA) and (stgrHoras.Cells[4,iLin]  = COL_VAZIA))) then
      begin
        MsgDlg('Complete ou Limpe o Horário no Dia ' + stgrHoras.Cells[0, iLin], 'Aviso',
          mtWarning, [mbOk,mbHelp], 0);
        gbxApuracao.Visible := false;
        gbxAdNotDSR.Visible := false;
        exit;
      end;

      if (iCol = 2) then
      begin
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
          begin
            if (cbxAdNotDSR.Checked) and (stgrHoras.Cells[2, iLin] = '') then
              iTotAdicNotDSR := iTotAdicNotDSR +
                (FU.StrInt(Copy(sAdNotFim,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
                (FU.StrInt(Copy(sAdNotFim,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)))
            else
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sAdNotFim,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
                (FU.StrInt(Copy(sAdNotFim,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)));
          end
          else
          begin
            if (cbxAdNotDSR.Checked) and (stgrHoras.Cells[2, iLin] = '') then
              iTotAdicNotDSR := iTotAdicNotDSR +
                (FU.StrInt(Copy(sHoraSai,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
                (FU.StrInt(Copy(sHoraSai,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)))
            else
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sHoraSai,1,2)) - FU.StrInt(Copy(sHoraEnt,1,2))) * 60 +
                (FU.StrInt(Copy(sHoraSai,4,2)) - FU.StrInt(Copy(sHoraEnt,4,2)));
          end;

        if (sHoraSai < sHoraEnt) then
          sHoraSai := IntToStr(FU.StrInt(Copy(sHoraSai,1,2)) + 24) + Copy(sHoraSai,3,3);

        if (sHoraEnt > sAdNotIni) then
          sAdNotIni := sHoraEnt;

        if (sHoraSai > sAdNotIni) then
          if (sHoraSai < sAdNotF24) then
          begin
            if (cbxAdNotDSR.Checked) and (stgrHoras.Cells[2, iLin] = '') then
            begin
              if (sHoraSai > '24:00') and (stgrHoras.Cells[2, iLin+1] <> '') then
              begin
                iTotAdicNotDSR := iTotAdicNotDSR +
                  (FU.StrInt(Copy('24:00',1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                  (FU.StrInt(Copy('24:00',4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
                iTotAdicNot := iTotAdicNot +
                  (FU.StrInt(Copy(sHoraSai,1,2)) - FU.StrInt(Copy('24:00',1,2))) * 60 +
                  (FU.StrInt(Copy(sHoraSai,4,2)) - FU.StrInt(Copy('24:00',4,2)));
              end
              else
                iTotAdicNotDSR := iTotAdicNotDSR +
                  (FU.StrInt(Copy(sHoraSai,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                  (FU.StrInt(Copy(sHoraSai,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
            end
            else
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sHoraSai,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                (FU.StrInt(Copy(sHoraSai,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
          end
          else
          begin
            if (cbxAdNotDSR.Checked) and (stgrHoras.Cells[2, iLin] = '') then
            begin
              if (sHoraSai > '24:00') and (stgrHoras.Cells[2, iLin+1] <> '') then
              begin
                iTotAdicNotDSR := iTotAdicNotDSR +
                  (FU.StrInt(Copy('24:00',1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                  (FU.StrInt(Copy('24:00',4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
                iTotAdicNot := iTotAdicNot +
                  (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy('24:00',1,2))) * 60 +
                  (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy('24:00',4,2)));
              end
              else
                iTotAdicNotDSR := iTotAdicNotDSR +
                  (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                  (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
            end
            else
              iTotAdicNot := iTotAdicNot +
                (FU.StrInt(Copy(sAdNotF24,1,2)) - FU.StrInt(Copy(sAdNotIni,1,2))) * 60 +
                (FU.StrInt(Copy(sAdNotF24,4,2)) - FU.StrInt(Copy(sAdNotIni,4,2)));
          end;
      end;

      if (stgrHoras.Cells[1,iLin] = COL_VAZIA) and (stgrHoras.Cells[4,iLin] = COL_VAZIA) then
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
           (Trim(stgrHoras.Cells[4, iLin]) <  Trim(stgrHoras.Cells[1, iLin])) then
          if (MsgDlg('Confirma que a Saída no Dia ' + stgrHoras.Cells[0,iLin] +
                     ' é Hora Extra?', 'Confirmação', mtConfirmation,
                     [mbYes,mbNo,mbHelp],0) <> mrNo) then
            QtMin := 24*60 + QtMin;
      end;

      if (iCol = 3) and (stgrHoras.Cells[4, iLin] <> '') then
      begin
        sDifer := Trim(stgrHoras.Cells[4, iLin]);
        QtMin  := (- FU.StrInt(Copy(sNormal,1,2)) + FU.StrInt(Copy(sDifer,1,2))) * 60 +
                  (- FU.StrInt(Copy(sNormal,4,2)) + FU.StrInt(Copy(sDifer,4,2)));

        if (stgrHoras.Cells[3, iLin] <> '') and (QtMin < 0) and
           (Trim(stgrHoras.Cells[4, iLin]) < Trim(stgrHoras.Cells[2, iLin])) then
          if (Trim(stgrHoras.Cells[4, iLin]) > Trim(stgrHoras.Cells[3, iLin])) or
             (MsgDlg('Confirma que a Saída no Dia ' + stgrHoras.Cells[0, iLin] +
                     ' é Hora Extra?', 'Confirmação', mtConfirmation,
                     [mbYes,mbNo,mbHelp],0) <> mrNo) then
            QtMin := 24*60 + QtMin;
      end;

      if (stgrHoras.Cells[iCol, iLin] = '') and (QtMin <= 0) then
      begin
        MsgDlg('Horário Incompatível no Dia ' + stgrHoras.Cells[0, iLin],'Aviso',
               mtInformation, [mbOk,mbHelp], 0);
        gbxApuracao.Visible := false;
        gbxAdNotDSR.Visible := false;
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
        iTotAtraso := iTotAtraso - QtMin;

        if ((iCol = 2) and (ArrayAlmoco[iLin-1] > 0) and (sDifer > ArrayFimAlmoco[iLin-1])) or
           ((iCol = 3) and (ArrayAlmoco[iLin-1] > 0) and (sDifer < ArrayIniAlmoco[iLin-1])) then
          iTotAtraso := iTotAtraso - ArrayAlmoco[iLin-1];
      end
      else
      begin
        iTotExtra := iTotExtra + QtMin;

        if (iCol = 2) and (stgrHoras.Cells[2, iLin] = '') and (not bDiaNormalTrb) then
          iTotFolga := iTotFolga + QtMin;

        if (iCol = 2) and ((stgrHoras.Cells[2, iLin] <> '') or (bDiaNormalTrb)) then
        begin
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
      end;
  end;

  edAtraso.Text := IntToStr(iTotAtraso)   + ' min';
  edAdicNot.Text := IntToStr(iTotAdicNot) + ' min';
  edAdicNotDSR.Text := IntToStr(iTotAdicNotDSR) + ' min';
  edHoraExtra.Text := IntToStr(iTotExtra) + ' min';
  edDiurna.Text := IntToStr(iTotDiurno)   + ' min';
  edNoturna.Text := IntToStr(iTotNoturno) + ' min';
  edFolga.Text := IntToStr(iTotFolga)     + ' min';
  gbxApuracao.Visible := true;
  gbxAdNotDSR.Visible := cbxAdNotDSR.Checked;
  bbtnLancar.Enabled := true;
end;

procedure TfrmRegHoras.bbtnLimparClick(Sender: TObject);
begin
  ZerarValores;
  edAtraso.Text := '0 min';
  edAdicNot.Text := '0 min';
  edAdicNotDSR.Text := '0 min';
  edHoraExtra.Text := '0 min';
  edDiurna.Text := '0 min';
  edNoturna.Text := '0 min';
  edFolga.Text := '0 min';
  gbxApuracao.Visible := false;
  gbxAdNotDSR.Visible := false;
  LimpaGrid;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmRegHoras.ZerarValores;
begin
  iTotAtraso := 0;
  iTotAdicNot := 0;
  iTotAdicNotDSR := 0;
  iTotExtra := 0;
  iTotDiurno := 0;
  iTotNoturno := 0;
  iTotFolga := 0;
end;

procedure TfrmRegHoras.LimpaGrid;
var
  iLin: integer;
begin
  for iLin:=1 to (stgrHoras.RowCount - 1) do
  begin
    stgrHoras.Cells[1,iLin] := COL_VAZIA;
    stgrHoras.Cells[4,iLin] := COL_VAZIA;
    bbtnLancar.Enabled := false;
  end;
end;

procedure TfrmRegHoras.RefazGrid;
var
  iCol, iLin, TotHoras, SvLin, iOldRowCount: integer;
  Hora1, Hora2: double;
  DataPesq: TDateTime;
begin
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

    TotHoras := 0;
    iLin := 0;
    while (iLin <= Round(Data2.Date - Data1.Date)) do
    begin
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

    iOldRowCount := stgrHoras.RowCount;  
    stgrHoras.RowCount := Round(Data2.Date - Data1.Date + 2);

    for iLin:=iOldRowCount to stgrHoras.RowCount do
    begin
      stgrHoras.Cells[1,iLin] := COL_VAZIA;
      stgrHoras.Cells[4,iLin] := COL_VAZIA;
    end;

    // Coloca o Título nas Colunas
    for iCol:=1 to 4 do
      stgrHoras.Cells[iCol, 0] := TituloGrid[iCol];

    // Coloca as Datas + a 1ª Letra do Dia da Semana nas Linhas
    for iLin:=1 to (stgrHoras.RowCount - 1) do
      stgrHoras.Cells[0, iLin] := DateToStr(Data1.Date + iLin - 1) +' '+
        CodDiaSem[DayOfWeek(Data1.Date + iLin - 1)];

    iQtdRepouso:=0; iLin:=1;
    while (iLin <= (stgrHoras.RowCount - 1)) do
    begin                 
      SvLin := iLin; // isto foi criado porque qryFeriado.Locate ferrava o iLin

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
            if (iCol = 2) and (DayOfWeek(Data1.Date + SvLin - 1) <> 7) then
            begin
              Inc(iQtdRepouso);
              if (ArrayFeriado[SvLin - 1] = 'E') then
                Dec(iQtdRepouso);
            end;
          end
          else
            stgrHoras.Cells[iCol, SvLin] :=  'Indefinido';
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
                end;
              end
              else
                stgrHoras.Cells[iCol, SvLin] := CdsTurno.FieldByName('FINALEXPEDIENTE').asString;
            end
            else
            begin
              stgrHoras.Cells[iCol, SvLin] := '';
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
              MsgDlg('Falta a Data Ref. do Horário da Pessoa.', 'Aviso',
                mtWarning, [mbOk,mbHelp], 0);
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

              Hora1 := ((Data1.Date + SvLin - 1 -
                CdsFunc.FieldByName('DATAREFHORARIO').Value) * 24 mod TotHoras) +
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

                // if  Hora2 = 24  then  Hora2 := 0;
                //Hora1 := 0;
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
        end;
      end;
      iLin := SvLin;
      inc(iLin);
    end;
  end;
end;

procedure TfrmRegHoras.Sel(IdPessoa: double);
begin
  CdsFunc.Data := CtrlPessoaFuncionario.ListEnderecoEmpresaFuncionario(IdPessoa);
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab(CdsFunc.FieldByName('IDHORARIO').asInteger);
  CdsTurno.Data := CtrlAssociaHorario.ListTurnoDiaSel(CdsFunc.FieldByName('IDHORARIO').asInteger);
end;

procedure TfrmRegHoras.LeAlteracoes;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  cbxAdNotDSR.Checked := (ArqConfig.ReadString('REG_HORAS', 'Destaca', 'F') = 'V');
  rgLimiteDiurnas.ItemIndex :=  StrToInt(ArqConfig.ReadString('REG_HORAS', 'Limite', '0'));
end;

procedure TfrmRegHoras.GravaAlteracoes;
begin
  // Gravar as últimas alterações da Seleção de Rubricas
  ArqConfig.WriteString('REG_HORAS', 'Destaca', FU.IFF(cbxAdNotDSR.Checked,'V','F'));
  ArqConfig.WriteString('REG_HORAS', 'Limite', IntToStr(rgLimiteDiurnas.ItemIndex));
end;

end.
