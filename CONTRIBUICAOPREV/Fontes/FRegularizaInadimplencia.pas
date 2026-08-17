unit FRegularizaInadimplencia;

interface
                                                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, URegra, TB97Tlbr, UConsPart, IvDictio, IvMulti,
  IvEMulti, TEdNum, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmRegularizaInadimplencia = class(TfrmOkCancelar)
    Panel2: TPanel;
    Label2: TLabel;
    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    qrySitPlanoPrev: TwwQuery;
    pnlInformacao: TPanel;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qryAux: TwwQuery;
    Label10: TLabel;
    dtRegistro: TCMDateTimePicker;
    lblValores: TLabel;
    Label11: TLabel;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    qryDividas: TwwQuery;
    regCalculo: TRegra;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    qryEvento: TwwQuery;
    pnlBotao: TPanel;
    bbtnVerificaContrib: TBitBtn;
    Label4: TLabel;
    dtRegulariza: TCMDateTimePicker;
    edSitPart: TEdit;

    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure bbtnVerificaContribClick(Sender: TObject);


  private { Private declarations }

    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                  : real;

    bVerificou    : boolean;
    bPossuiDivida : boolean;
    sMsg          : string;
    dTotalDivida  : double;

    procedure LimpaCampos;


  public  { Public declarations }

  end;




var
  frmRegularizaInadimplencia: TfrmRegularizaInadimplencia;




implementation
{$R *.DFM}
uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, 
  FMostraContribuicoes, UEventos, UModulo,
  FCadOpcoesElegivel, 
  UBeneficio, UDotacao, UParticipante, fAguarde, DAPrev, USistema;



procedure TfrmRegularizaInadimplencia.FormShow(Sender: TObject);
begin
  inherited;
  qrySitPlanoPrev.Close;
  qrySitPlanoPrev.Open;
  qrySitPart.Close;
  qrySitPart.Open;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  bPossuiDivida := False;
  dTotalDivida  := 0;
  sMsg          := '';
end;

procedure TfrmRegularizaInadimplencia.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
  begin
    sIdPessoa          := MontaSelectPart.ValoresChave[0];
    sIdPessJur         := MontaSelectPart.ValoresChave[1];
    sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
    sSeqProposta       := MontaSelectPart.ValoresChave[19];

    edNome.Text        := MontaSelectPart.ValoresChave[3];
    edMatricula.Text   := MontaSelectPart.ValoresChave[4];
    edPatro.Text       := MontaSelectPart.ValoresChave[5];
    edPlano.Text       := MontaSelectPart.ValoresChave[6];

    edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
    edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
    edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
    edInscNumero.Text  := MontaSelectPart.ValoresChave[12];

    pnlInformacao.Enabled := True;
    pnlBotao.Enabled      := True;
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;
    bbtnVerificaContrib.Enabled := True;
    bPossuiDivida         := False;
    dTotalDivida          := 0;
    sMsg                  := '';
    bVerificou            := False;

    ConsPart1.sIdPessoa    := sidpessoa;
    ConsPart1.sIdTitular   := sIdPessoa;   
    ConsPart1.sSeqProposta := sseqproposta;
    ConsPart1.sIdPlanoprev := sidplanoprev;
    ConsPart1.DataBaseName := 'BaseDados';
    ConsPart1.sIdPessjur   := sidpessjur;
    ConsPart1.Enabled      := true;
    bbtnOpcoes.enabled := true;

    with qryEvento do
    begin
       Close;
       ParamByName('FlgInterno').AsString   := 'RI';
       ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
       ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
       ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
       ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
       Open;

       if IsEmpty
       then begin
          MsgDlg('Evento de Registro de Inadimplência não encontrado. Verifique.','Erro',mtError,[mbOk],0);
          LimpaCampos;
          Exit;
       end;
    end;

    dtRegistro.Text           := qryEvento.FieldByName('DATAREGISTRO').AsString;
    dtRegulariza.Text         := '';
    dblkpcmbSitPlanoPrev.Text := '';
    qrySitPart.Locate('IDSITPART',qryEvento.FieldByName('IDSITPARTATUAL').AsInteger,[]);
    edSitPart.Text            := qrySitPart.FieldByName('DESCRICAO').AsString; // prencher situacao antes do evento
    bbtnConfirmar.Enabled     := True;
    bbtnCancelar.Enabled      := True;
  end;
end;

procedure TfrmRegularizaInadimplencia.bbtnConfirmarClick(Sender: TObject);
var sMesRef, sMsgErro  : string;
  sProcessosVerificar   : string;
  iNumeroProcesso       : longint;
  bRequereuSoINSS       : boolean;
  sDescOperacao         : string;
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if Trim(dtRegulariza.Text) = ''
  then begin
     MsgDlg('A Data da Regularização deve ser informada.','Erro',mtError,[mbOk],0);
     dtRegulariza.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk],0);
     dblkpcmbSitPlanoPrev.SetFocus;
     Exit;
  end;


  if not bVerificou then bbtnVerificaContribClick(Sender);

  if bPossuiDivida
  then begin
     if MsgDlg('Este participante ainda possui dívidas previdenciárias.'+#13+#13+
               'Total da Dívida : '+FormatFloat('#0.00',dTotalDivida)+#13+#13+
               'Deseja realmente regularizar sua situação ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
     then Exit;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBasedados.dbBaseDados.StartTransaction;

  // Grava Data de Cancelamento
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = '+qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString+','+
                 '                         IDSITPART      = '+qrySitPart.FieldByName('IDSITPART').AsString+
                 ' WHERE IDPESSJUR   = ' + sIdPessJur   +
                 ' AND   IDPLANOPREV = ' + sIdPlanoPrev +
                 ' AND   SEQPROPOSTA = ' + sSeqProposta +
                 ' AND   IDPESSOA    = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        if dtmBaseDados.dbBaseDados.InTransaction
        then dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;
  end;

  // Grava Data de Cancelamento
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAVOLTA = TO_DATE('''+dtRegulariza.Text+''',''DD/MM/YYYY'') '+
                 ' WHERE  IDEVENTOSPREV = '+qryEvento.FieldByName('IDEVENTOSPREV').AsString);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        if dtmBaseDados.dbBaseDados.InTransaction
        then dtmBasedados.dbBaseDados.Rollback;
        Exit;
     end;
  end;


  if bPossuiDivida
  then sDescOperacao := 'Regularização de Inadimplência (Dívida na Data : '+FormatFloat('#0.00',dTotalDivida)+') - Matricula : '+edMatricula.Text+' - Data : '+dtRegulariza.Text
  else sDescOperacao := 'Regularização de Inadimplência (Dívida na Data : 0,00) - Matricula : '+edMatricula.Text+' - Data : '+dtRegulariza.Text;

  GravaLogTOTALPREV(sDescOperacao);

  Try
     If Not Sistema.GravaLogOperacoes(sDescOperacao)
     Then raise exception.Create('Erro ao gravar Log.')
  Except
  End;


  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Regularização efetuada com sucesso.','Informação',mtInformation,[mbOk],0);
  LimpaCampos;
end;

procedure TfrmRegularizaInadimplencia.bbtnCancelarClick(Sender: TObject);
begin
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then begin
     if dtmBasedados.dbBaseDados.InTransaction
     then dtmBasedados.dbBaseDados.RollBack;
     LimpaCampos;
  end;
  inherited;
end;

procedure TfrmRegularizaInadimplencia.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dtRegistro.Text    := '';
  dtRegulariza.Text      := '';
  dblkpcmbSitPlanoPrev.Text := '';
  edSitPart.Text := '';
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;    
end;

procedure TfrmRegularizaInadimplencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then RollBack;
end;

procedure TfrmRegularizaInadimplencia.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  inherited;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3,  EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6, '+
                 ' PATRO.NUMOPCOES    , '+
                 ' PATRO.NOMEVALORBASE1    ,  PATRO.NOMEVALORBASE2   ,  PATRO.NOMEVALORBASE3, '+
                 ' PATRO.FLGOBRIGAOP1    , PATRO.FLGOBRIGAOP2  ,  PATRO.FLGOBRIGAOP3  , '+
                 ' PATRO.FLGEDITAOP1    , PATRO.FLGEDITAOP2    ,  PATRO.FLGEDITAOP3    , '+
                 ' PATRO.IDREGRACALCOP1   ,  PATRO.IDREGRACALCOP2  ,  PATRO.IDREGRACALCOP3  ,  '+
                 ' PATRO.IDREGRAVALIDAOP1  ,   PATRO.IDREGRAVALIDAOP2  ,  PATRO.IDREGRAVALIDAOP3, '+
                 ' PATRO.NOMEVALORBASE4    ,  PATRO.NOMEVALORBASE5   ,  PATRO.NOMEVALORBASE6, '+
                 ' PATRO.FLGOBRIGAOP4    , PATRO.FLGOBRIGAOP5  ,  PATRO.FLGOBRIGAOP6  , '+
                 ' PATRO.FLGEDITAOP4    , PATRO.FLGEDITAOP5    ,  PATRO.FLGEDITAOP6    , '+
                 ' PATRO.IDREGRACALCOP4   ,  PATRO.IDREGRACALCOP5  ,  PATRO.IDREGRACALCOP6  ,  '+
                 ' PATRO.IDREGRAVALIDAOP4  ,   PATRO.IDREGRAVALIDAOP5  ,  PATRO.IDREGRAVALIDAOP6 '+
                 ' FROM ELEGPATRO EL, PATRO ' +
                 ' WHERE EL.IDPESSJUR   = ' +sidpessjur+ ' AND '+
                 ' EL.IDPESSOA = '+sidpessoa+' AND '+
                 ' EL.IDPESSJUR = PATRO.IDPESSOA ' );
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     rOpcao4 := 0;
     rOpcao5 := 0;
     rOpcao6 := 0;
  end
  else begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;

     if qryAux.FieldByName('VALORBASE4').AsString <> ''
     then rOpcao4 := qryAux.FieldByName('VALORBASE4').AsFloat
     else rOpcao4 := 0;

     if qryAux.FieldByName('VALORBASE5').AsString <> ''
     then rOpcao5 := qryAux.FieldByName('VALORBASE5').AsFloat
     else rOpcao5 := 0;

     if qryAux.FieldByName('VALORBASE6').AsString <> ''
     then rOpcao6 := qryAux.FieldByName('VALORBASE6').AsFloat
     else rOpcao6 := 0;
  end;

  bPodeAlterarOpcoes := True;

  if not qryAux.IsEmpty
  then begin // Opcoes já cadastradas
     bOpcoesExistem := True;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(edNome.text,  edPatro.text,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjur),strtoint(sidpessoa),
                                 '','');
     frmCadOpcoesElegivel.Free;
  end
  else begin // Cadastrar Opcoes
     bOpcoesExistem := False;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(edNome.text, edPatro.text,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjur), strtoint(sidpessoa),
                                 '', '');

     frmCadOpcoesElegivel.Free;
  end;

  if ((rOpcao1 >= 0) or (rOpcao2 >= 0) or (rOpcao3 >= 0)
      or (rOpcao4 >= 0) or (rOpcao5 >= 0) or (rOpcao6 >= 0)) and
     (frmCadOpcoesElegivel.ModalResult = mrok)
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE ELEGPATRO SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                    '                      VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                    '                      VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) + ',' +
                    '                      VALORBASE4 = ' + FormatFloat('#0.00000',rOpcao4) + ',' +
                    '                      VALORBASE5 = ' + FormatFloat('#0.00000',rOpcao5) + ',' +
                    '                      VALORBASE6 = ' + FormatFloat('#0.00000',rOpcao6) +
                    ' WHERE IDPESSJUR   = ' + sidpessjur   + ' AND ' +
                    '       IDPESSOA    = ' + sidpessoa   + ' ' );
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;// except
  end;//if
end;

procedure TfrmRegularizaInadimplencia.bbtnVerificaContribClick(
  Sender: TObject);
begin
  inherited;
  bPossuiDivida := False;
  bVerificou    := True;
  dTotalDivida  := 0;
  sMsg          := '';
  with qryDividas do
  begin
     Close;
     ParamByName('IDPESSJUR').AsInteger   := StrToInt(sIdPessJur);
     ParamByName('IDPLANOPREV').AsInteger := StrToInt(sIdPlanoPrev);
     ParamByName('IDPESSOA').AsInteger    := StrToInt(sIdPessoa);
     ParamByName('SEQPROPOSTA').AsInteger := StrToInt(sSeqProposta);
     Open;
  end;

  while not qryDividas.Eof do
  begin
     if qryDividas.FieldByName('TOTALDIVIDA').AsFloat <= 0
     then begin
        qryDividas.Next;
        continue;
     end;
     sMsg := sMsg+#13+
             'Mês Ref. : '+qryDividas.FieldByName('MESREFERENCIA').AsString+ ' - Valor : '+
             FormatFloat('#0.00',qryDividas.FieldByName('TOTALDIVIDA').AsFloat);
     dTotalDivida  := dTotalDivida  + qryDividas.FieldByName('TOTALDIVIDA').AsFloat;
     bPossuiDivida := True;
     qryDividas.Next;
  end;

  sMsg := sMsg + #13+#13+
          'Total : '+ FormatFloat('#0.00',dTotalDivida);
  if bPossuiDivida
  then begin
     MsgDlg('Dívidas Encontradas para a matrícula '+edMatricula.Text+' : '+
             sMsg,
             'Informação',mtInformation,[mbOK],0);
  end;
end;



end.