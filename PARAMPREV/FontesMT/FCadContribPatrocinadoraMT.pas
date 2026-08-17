unit FCadContribPatrocinadoraMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCtrlContribPrevPatro,
  DBaseDados, uSistema, uContribuicaoPrev, uMensErro, uFuncoesUteis,
  uAdmPrev,
  Wwdotdot, Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  wwdblook, Mask, wwdbedit, DBTables, Wwquery;

type
  TFrmCadContribPatrocinadoraMT = class(TFrmCadastroMestreDetMT)
    Label4: TLabel;
    dbedPatrocinadora: TwwDBEdit;
    Label3: TLabel;
    dbedPlano: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    dblkpcmbContribuicao: TwwDBLookupCombo;
    chkCobrarContrib: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    lblQtdeParcelas: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFinal: TCMDateTimePicker;
    dblkpcmbPeriodicidade: TwwDBLookupCombo;
    edQtdeParcelas: TwwDBEdit;
    grpRecebimento: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    dblkpcmbPortForma: TwwDBLookupCombo;
    cmbDiaVencimento: TwwDBComboBox;
    grpOpcao: TGroupBox;
    lblOp3: TLabel;
    lblOp2: TLabel;
    lblOp1: TLabel;
    edOp1: TwwDBEdit;
    edOp2: TwwDBEdit;
    edOp3: TwwDBEdit;
    cdsDet: TCMClientDataSet;
    cdsContribuicao: TCMClientDataSet;
    cdsPortForma: TCMClientDataSet;
    cdsPeriodicidade: TCMClientDataSet;
    qryGridContrib: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dtedInicioExit(Sender: TObject);
    procedure dblkpcmbContribuicaoExit(Sender: TObject);
    procedure cdsContribuicaoAfterScroll(DataSet: TDataSet);
    procedure cdsDetAfterScroll(DataSet: TDataSet);
    procedure edQtdeParcelasExit(Sender: TObject);
    procedure dblkpcmbPeriodicidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbContribuicaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure chkCobrarContribClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    bApagarContribuicoes : Boolean;
    UltState             : TDataSetState;

    CtrlContribPrevPatro : TCtrlContribPrevPatro;

    function ValidaOpcoes : Boolean;
    
    Procedure AbreCds(piIdPessoa, piIdPlanoPrev: Integer);
  public
    { Public declarations }
  end;

var
  FrmCadContribPatrocinadoraMT: TFrmCadContribPatrocinadoraMT;

implementation

{$R *.DFM}

function CalcDataFinal(dDataInicio : TDateTime; sQtdeParcelas,sQtdeMeses : string) : string;
var sDataInicio,
    sMesFim,
    sAnoFim,
    sDataFim : string;
    iQtdeParcelas,
    iQtdeMeses,
    iContaParcela,
    iMesInicio,
    iAnoInicio,
    iMesFim,
    iAnoFim : integer; 
begin
  Result := '';
  
  try
     sDataInicio := FormatDateTime('dd/mm/yyyy',dDataInicio);
  except
     Result := '-1';
     Exit;
  end;

  if sQtdeParcelas = ''
  then iQtdeParcelas := 0
  else iQtdeParcelas := StrToInt(sQtdeParcelas);

  if sQtdeMeses = ''
  then iQtdeMeses := 0
  else iQtdeMeses := StrToInt(sQtdeMeses);
  
  if iQtdeMeses < 0
  then begin
     Result := '-2';
     Exit;
  end;

  if iQtdeParcelas = 0
  then Exit 
  else begin
     
     if (iQtdeMeses = 0) or (iQtdeParcelas = 1)
     then sDataFim := sDataInicio
     else begin
        iMesInicio  := StrToInt(Copy(sDataInicio,4,2));
        iAnoInicio  := StrToInt(Copy(sDataInicio,7,4));
        iMesFim     := iMesInicio;
        iAnoFim     := iAnoInicio;
        iContaParcela := 1;
        while iContaParcela < iQtdeParcelas do
        begin
           iMesFim := iMesFim + iQtdeMeses;
           if iMesFim > 12
           then begin
              iMesFim := -(12 - iMesFim);
              iAnoFim := iAnoFim + 1;
           end;
           inc(iContaParcela);
        end;
        if iMesFim <= 9
        then sMesFim := '0'+IntToStr(iMesFim)
        else sMesFim := IntToStr(iMesFim);
        sAnoFim := IntToStr(iAnoFim);
        sDataFim := Copy(sDataInicio,1,2)+'/'+sMesFim+'/'+sAnoFim;
     end;
  end;
  Result := sDataFim;
end;

procedure TFrmCadContribPatrocinadoraMT.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlContribPrevPatro := TCtrlContribPrevPatro.Create;
  CtrlContribPrevPatro.Initialize(dtmBaseDados.dbBaseDados,
                                  True,
                                  Sistema.ConnectionType,
                                  Sistema.ConnectionSide,
                                  Sistema.AppRemoteServer,
                                  True,
                                  nil,
                                  nil,
                                  False
                                  );

  CtrlContribPrevPatro.CdsContribPrevPatro := cdsDet;
  cdsPeriodicidade.Data                    := CtrlContribPrevPatro.ListaPeriodicidade;
  cdsPortForma.Data                        := CtrlContribPrevPatro.ListaPortForma;
end;

procedure TFrmCadContribPatrocinadoraMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  If MontaSelect.RetornouValor then
  Begin
    AbreCds( StrToInt(MontaSelect.ValoresChave[2]),
             StrToInt(MontaSelect.ValoresChave[3]) );
  End;
end;

procedure TFrmCadContribPatrocinadoraMT.AbreCds(piIdPessoa, piIdPlanoPrev: Integer);
begin
  CtrlContribPrevPatro.IdPessoa    := piIdPessoa;
  CtrlContribPrevPatro.IdPlanoPrev := piIdPlanoPrev;

  cds.data             := CtrlContribPrevPatro.ListaMestre;
  cdsDet.data          := CtrlContribPrevPatro.ListaContribPrevPatro;
  cdsContribuicao.Data := CtrlContribPrevPatro.ListaContribuicao;
end;

procedure TFrmCadContribPatrocinadoraMT.CmeCadastroConfirma(
  Sender: TObject);
begin
  inherited;

  CtrlContribPrevPatro.GravaContribPrevPatro;
end;

procedure TFrmCadContribPatrocinadoraMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

  cdsDet.FieldByName('FLGCOBRA').AsInteger    := 0;
  cdsDet.FieldByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[2]);
  cdsDet.FieldByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[3]);
end;

procedure TFrmCadContribPatrocinadoraMT.bbtnOkDetClick(Sender: TObject);
begin
  If Trim(edOp1.Text) = '' Then edOp1.Text := '0';
  If Trim(edOp2.Text) = '' Then edOp2.Text := '0';
  If Trim(edOp3.Text) = '' Then edOp3.Text := '0';

  If Trim(dblkpcmbContribuicao.Text) = '' Then
  Begin
    MsgDlg('Nome da Contribuição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbContribuicao.SetFocus;
    Exit;
  end;

  If not ValidaOpcoes Then
  Begin
     Exit;
  End;

  UltState := cdsDet.State;

  inherited;
end;

procedure TFrmCadContribPatrocinadoraMT.dblkpcmbContribuicaoExit(
  Sender: TObject);
var iNumOpcoes : integer;
begin
  inherited;

  If (Trim(dblkpcmbContribuicao.Text) <> '') and
     (cdsContribuicao.FieldByName('flgAceitaOpcao').AsInteger = 1) Then
  Begin
    iNumOpcoes := cdsContribuicao.FieldByName('NumOpcoes').AsInteger;
  end;
end;

procedure TFrmCadContribPatrocinadoraMT.cdsContribuicaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  If (cdsDet.State = dsInsert) then
    edQtdeParcelas.Text := cdsContribuicao.FieldbyName('QtdeParcelas').AsString;
end;

procedure TFrmCadContribPatrocinadoraMT.cdsDetAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  bApagarContribuicoes := False;
end;

procedure TFrmCadContribPatrocinadoraMT.dtedInicioExit(Sender: TObject);
begin
  inherited;

  Try
    cdsDet.FieldByName('DATAFINAL').AsDateTime := StrToDate( CalcDataFinal(dtedInicio.Date,
                                                                           edQtdeParcelas.Text,
                                                                           cdsPeriodicidade.FieldByName('QtdeMeses').AsString) );
  Except End;
end;

procedure TFrmCadContribPatrocinadoraMT.edQtdeParcelasExit(
  Sender: TObject);
begin
  inherited;
  
  Try
    cdsDet.FieldByName('DATAFINAL').AsDateTime := StrToDate( CalcDataFinal(dtedInicio.Date,
                                    edQtdeParcelas.Text,
                                                             cdsPeriodicidade.FieldByName('QtdeMeses').AsString) );
  Except End;
end;

procedure TFrmCadContribPatrocinadoraMT.dblkpcmbPeriodicidadeCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  Try
    cdsDet.FieldByName('DATAFINAL').AsDateTime := StrToDate( CalcDataFinal(dtedInicio.Date,
                                    edQtdeParcelas.Text,
                                                                           cdsPeriodicidade.FieldByName('QtdeMeses').AsString) );
  Except End;
end;

procedure TFrmCadContribPatrocinadoraMT.dblkpcmbContribuicaoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var iNumOpcoes : integer;
begin
  inherited;

  If cdsContribuicao.FieldByName('flgAceitaOpcao').AsInteger = 1 Then
  Begin
    iNumOpcoes := cdsContribuicao.FieldByName('NumOpcoes').AsInteger;

    If iNumOpcoes = 0 Then
      grpOpcao.Caption := 'Opções de Contribuição [não disponíveis] '
    Else
      grpOpcao.Caption := 'Opções de Contribuição ';

    grpOpcao.Visible := True;

    lblOp1.Visible   := (iNumOpcoes >= 1);
    edOp1.Visible    := (iNumOpcoes >= 1);

    lblOp2.Visible   := (iNumOpcoes >= 2);
    edOp2.Visible    := (iNumOpcoes >= 2);
    
    lblOp3.Visible   := (iNumOpcoes >= 3);
    edOp3.Visible    := (iNumOpcoes >= 3);
  End
  Else
  Begin
    grpOpcao.Visible := False;
  End;

  // Preencher periodicidade padrao
  If cdsDet.State = dsInsert Then
  Begin
    edQtdeParcelas.Text := cdsContribuicao.FieldbyName('QtdeParcelas').AsString;

    If cdsContribuicao.FieldByName('IdTpPeriodicidade').AsString = '' Then
      Exit;

    If cdsPeriodicidade.Locate('IdTpPeriodicidade',
                               cdsContribuicao.FieldByName('IdTpPeriodicidade').AsInteger,
                               [loCaseInsensitive,loPartialKey]) Then
    Begin
      dblkpcmbPeriodicidade.Text := cdsPeriodicidade.FieldByName('Nome').AsString
    End
    Else
    Begin
      dblkpcmbPeriodicidade.Text := '';
    End;

    Try
      cdsDet.FieldByName('DATAFINAL').AsDateTime := StrToDate( CalcDataFinal(dtedInicio.Date,
                                      edQtdeParcelas.Text,
                                                               cdsPeriodicidade.FieldByName('QtdeMeses').AsString));
    Except End;
  End;
end;

procedure TFrmCadContribPatrocinadoraMT.chkCobrarContribClick(
  Sender: TObject);
begin
  inherited;

  // Se o usuario marcar para nao cobrar a contribuicao , e a mesma já tiver sido
  // preparada, apagar do histórico
  dblkpcmbContribuicao.PerformSearch;

  If (not chkCobrarContrib.Checked) and (not bApagarContribuicoes) Then
  Begin
    If not CtrlContribPrevPatro.CobraContribuicao( cdsDet.FieldbyName('IdContribuicao').AsInteger ) Then
    Begin
      If MsgDlg('Esta contribuição já foi preparada para a cobrança. Deseja não cobrá-la ? ',
                'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes Then
        bApagarContribuicoes := True
      Else
        bApagarContribuicoes := False;
    End;
  End; 
end;

procedure TFrmCadContribPatrocinadoraMT.FormShow(Sender: TObject);
begin
  inherited;

end;

procedure TFrmCadContribPatrocinadoraMT.bbtnConfirmarClick(
  Sender: TObject);
begin
  If (UltState = dsEdit) and (bApagarContribuicoes) Then
  Begin
    CtrlContribPrevPatro.Exclui_HstAtrasoContrib(cdsDet.FieldByName('IdContribuicao').AsInteger);

    CtrlContribPrevPatro.Exclui_HstContribPrev(cdsDet.FieldByName('IdContribuicao').AsInteger);
  End;

  inherited;

  cdsDet.data := CtrlContribPrevPatro.ListaContribPrevPatro;
end;

function TFrmCadContribPatrocinadoraMT.ValidaOpcoes : Boolean;
var bErroRegra : boolean;
    sOpcao,
    sSQL : string;
begin
  Result := False;

  If edOp1.Visible Then
  Begin
    sOpcao := OraNumero(edOp1.Text);
    sSQL := ' SELECT ' + sOpcao + ' AS VALORBASE1 FROM DUAL ';

    If (Trim(cdsContribuicao.FieldbyName('IDREGRAVALIDAOP1').AsString) <> '') and
       (not RegraBooleana(cdsContribuicao.FieldbyName('IDREGRAVALIDAOP1').AsString, sSQL, bErroRegra)) Then
    Begin 

      If not bErroRegra Then
        MsgDlg(' Opção 1 não satisfaz as condições necessárias.', 'Informação', mtInformation, [mbOk,mbHelp], 0)
      Else
        MsgDlg(' Erro na Execução da Regra de Validação da Opção 1.', 'Informação', mtInformation, [mbOk,mbHelp], 0);

      edOp1.SetFocus;
      Exit;
    End;
  End;

  If edOp2.Visible Then
  Begin 
    sOpcao := OraNumero(edOp2.Text);
    sSQL := ' SELECT ' + sOpcao + ' AS VALORBASE2 FROM DUAL ';

    If (Trim(cdsContribuicao.FieldbyName('IDREGRAVALIDAOP2').AsString) <> '') and
       (not RegraBooleana(cdsContribuicao.FieldbyName('IDREGRAVALIDAOP2').AsString, sSQL, bErroRegra)) Then
    Begin 

      If not bErroRegra Then
        MsgDlg(' Opção 2 não satisfaz as condições necessárias.', 'Informação', mtInformation, [mbOk,mbHelp], 0)
      Else
        MsgDlg(' Erro na Execução da Regra de Validação da Opção 2.', 'Informação', mtInformation, [mbOk,mbHelp], 0);

      edOp2.SetFocus;
      Exit;
    End;
  End;

  If edOp3.Visible Then
  Begin 
    sOpcao := OraNumero(edOp3.Text);
    sSQL := ' SELECT ' + sOpcao + ' AS VALORBASE3 FROM DUAL ';

    If (Trim(cdsContribuicao.FieldbyName('IDREGRAVALIDAOP3').AsString) <> '') and
       (not RegraBooleana(cdsContribuicao.FieldbyName('IDREGRAVALIDAOP3').AsString, sSQL, bErroRegra)) Then
    Begin 

      If not bErroRegra Then
        MsgDlg(' Opção 3 não satisfaz as condições necessárias.', 'Informação', mtInformation, [mbOk,mbHelp], 0)
      Else
        MsgDlg(' Erro na Execução da Regra de Validação da Opção 3.', 'Informação', mtInformation, [mbOk,mbHelp], 0);

      edOp3.SetFocus;
      Exit;
    End;
  End;

  Result := True;
end;

end.
