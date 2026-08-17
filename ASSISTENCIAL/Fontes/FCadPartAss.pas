unit FCadPartAss;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 29/10/2007
// Rotina      : dbrgflgcobcarne
// Pendencia   : 26638
// Alteração   : Acrescentado radiogroup para controlar a forma de pagamento com FLGCOBCARNE
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/01/2007
// Rotina      : qryDetAfterScroll
// Pendencia   : 24812
// Alteração   : Correção para gravar corretamente as contribuições.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, DBCtrls, StdCtrls, Db, DBTables, Wwquery,
  CmEventosCadastro, ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CheckLst, DBGrids, uCmTypes;

type
  TFrmCadPartAss = class(TfrmCadMestreDetalheCS)
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    lblFalecido: TLabel;
    Label9: TLabel;
    dbtMatricula: TDBText;
    dbtInscricao: TDBText;
    dbtNomeParticip: TDBText;
    dbtDepend: TDBText;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbtPatro: TDBText;
    dbtSituacao: TDBText;
    dbtPlano: TDBText;
    dbtDataInscricao: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbtNasc: TDBText;
    dbtSexo: TDBText;
    dbtEstCivil: TDBText;
    dbtBanco: TDBText;
    dbtConta: TDBText;
    Label14: TLabel;
    dbtEndCompleto: TDBText;
    qryDet: TwwQuery;
    qryPlanos: TwwQuery;
    btnOpcoes: TBitBtn;
    chkContrib: TCheckListBox;
    dblkPlano: TwwDBLookupCombo;
    Label15: TLabel;
    dbtpDataInscricao: TwwDBDateTimePicker;
    Label49: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    GroupBox1: TGroupBox;
    chkOpcaoA: TDBCheckBox;
    qrySitPlanoAss: TwwQuery;
    Label17: TLabel;
    dblkSitPlanoAss: TwwDBLookupCombo;
    updDet: TUpdateSQL;
    qryContass: TwwQuery;
    dsContass: TwwDataSource;
    edtCobra: TEdit;
    qryAux: TwwQuery;
    updContass: TUpdateSQL;
    qryContribAss: TwwQuery;
    dblkCodPortForma: TwwDBLookupCombo;
    Label19: TLabel;
    qryPortForma: TwwQuery;
    Label20: TLabel;
    dbrgflgcobcarne: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblkPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnOpcoesClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkContribClickCheck(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
  private
    OperacaoDetalhe : TOperacao;

    // Variável para controlar mudanças na contribuição
    // Valores:
    // 0 - Não houve mudanças
    // 1 - Mudanças em contribuicao
    iMudouCobranca  : Integer;

    procedure FormaCobranca;
    procedure MontaPlanos(piFlagInsert:Integer);
    procedure MontaContribuicoes(piFlagInsert:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPartAss: TFrmCadPartAss;

implementation

uses uMensErro, UDataBase, FCadOpcoesPartAss, DBaseDados;

{$R *.DFM}

procedure TFrmCadPartAss.FormaCobranca;
begin
  If qry.FieldByName('FLGINTERNO').AsString = 'AT'
   Then edtCobra.Text := 'FOLHA DE PAGAMENTO'
   Else If qry.FieldByName('FLGINTERNO').AsString = 'AS'
         Then edtCobra.Text := 'FOLHA DE BENEFÍCIO'
         Else If (qry.FieldByName('FLGINTERNO').AsString = 'MA') Or
                 (qry.FieldByName('FLGINTERNO').AsString = 'MP')
               Then edtCobra.Text := 'BOLETO BANCÁRIO';
end;

procedure TFrmCadPartAss.MontaPlanos(piFlagInsert: Integer);
begin
  With qryPlanos do
   Begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT FLGACEITAOPCAO, IDPLANASS, IDPESSOA, IDREGRAATRASOJUR, IDFORNSERV,');
     SQL.Add('       CODPORTFORMA, CODTIPODOCHISTPAG, IDPRODASS, RECPAGHISTPAG, NOME,');
     SQL.Add('       CODTIPORECHISTREC, IDREGRAADMINISTR, RECPAGHISTREC, FLGFECHADO,');
     SQL.Add('       IDREGRACOBRANCA, IDREGRAGERAL, IDREGRAADMISSAO, IDREGRAPAGAMENTO,');
     SQL.Add('       IDREGRABENEFICIA, IDREGRACANCELAME, IDREGRADESISTENC, IDREGRACOMISSAO,');
     SQL.Add('       NUMCONTRATO, DATAINICIOVIGENC, DATAINICIOCOM, CODTIPRECHISTPAG,');
     SQL.Add('       CODTIPODOCHISTREC, IDREGRAATRASOCOR, IDREGRADEVOLJUROS, IDREGRADEVOLCORR,');
     SQL.Add('       IDFORNSERV2, COMISSFORN, COMISSFUND, FLGOPCAOA, TIPOFORNSERV2,');
     SQL.Add('       FLGOPCAOB, FLGATIVO, OPCAOAIDENT, OPCAOBDIF,');
     SQL.Add('       NUMOPCOES, IDREGRAVALOP1, IDREGRAVALOP2, IDREGRAVALOP3,');
     SQL.Add('       IDREGRAVALOP4, IDREGRAVALOP5, IDREGRAVALOP6, IDREGRAVALOP7,');
     SQL.Add('       IDREGRAVALOP8, IDREGRACALCOP1, IDREGRACALCOP2, IDREGRACALCOP3,');
     SQL.Add('       IDREGRACALCOP4, IDREGRACALCOP5, IDREGRACALCOP6, IDREGRACALCOP7,');
     SQL.Add('       IDREGRACALCOP8, NOMEVALORBASE1, NOMEVALORBASE2, NOMEVALORBASE3,');
     SQL.Add('       NOMEVALORBASE4, NOMEVALORBASE5, NOMEVALORBASE6, NOMEVALORBASE7,');
     SQL.Add('       NOMEVALORBASE8, FLGOBRIGAOP1, FLGOBRIGAOP2, FLGOBRIGAOP3,');
     SQL.Add('       FLGOBRIGAOP4, FLGOBRIGAOP5, FLGOBRIGAOP6, FLGOBRIGAOP7,');
     SQL.Add('       FLGOBRIGAOP8, FLGEDITAOP1, FLGEDITAOP2, FLGEDITAOP3,');
     SQL.Add('       FLGEDITAOP4, FLGEDITAOP5, FLGEDITAOP6, FLGEDITAOP7, FLGEDITAOP8');
     SQL.Add('FROM PLANASS');
     SQL.Add('WHERE FLGATIVO = 1');
     If piFlagInsert = 1
      Then Begin
        SQL.Add('  AND IDPLANASS NOT IN (SELECT P.IDPLANASS');
        SQL.Add('                        FROM PARTASS P, BENEFASS BA,');
        SQL.Add('                             PLANPREV PP, PLANASS PA,');
        SQL.Add('                             SITPLANOASS S');
        SQL.Add('                        WHERE (P.IDPESSOA = '+qry.FieldByName('IDPESSOA').AsString+')');
        SQL.Add('                          AND (P.FLGINSCRICAOCANC = 0) ');
        SQL.Add('                          AND (P.IDPESSOA = BA.IDTITULAR(+))');
        SQL.Add('                          AND (P.IDPESSJUR = BA.IDPESSJUR(+))');
        SQL.Add('                          AND (P.IDPLANOPREV = BA.IDPLANOPREV(+))');
        SQL.Add('                          AND (P.IDPLANASS = BA.IDPLANASS(+))');
        SQL.Add('                          AND (P.IDPESSOA = BA.IDDEPENDENTE(+))');
        SQL.Add('                          AND (P.SEQPROPOSTA = BA.SEQPROPOSTA(+))');
        SQL.Add('                          AND (P.IDPLANASS = PA.IDPLANASS)');
        SQL.Add('                          AND (P.IDPLANOPREV = PP.IDPLANOPREV)');
        SQL.Add('                          AND (P.IDSITPART= S.IDSITPLANOASS)  )');
      End;
     Open;
   End;
end;

procedure TFrmCadPartAss.MontaContribuicoes(piFlagInsert: Integer);
Var
 i : Integer;
begin
  With qryContribAss do
   Begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT (ROWNUM -1) ITEM, SUB.*');
     SQL.Add('FROM (SELECT DISTINCT CB.IDCONTASS, CT.NOME, CB.CODPORTFORMA,');
     SQL.Add('             CA.FLGATIVO FLGPAGA');
     SQL.Add('      FROM CONTRIBASS CB, CONTRIBUICAO CT,');
     SQL.Add('          (SELECT C.IDPLANASS, C.IDCONTASS, C.FLGATIVO');
     SQL.Add('           FROM CONTASS C');
     SQL.Add('           WHERE C.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString);
     SQL.Add('             AND C.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString);
     SQL.Add('             AND C.IDTITULAR    = '+qry.FieldByName('IDPESSOA').AsString);
     SQL.Add('             AND C.IDDEPENDENTE = '+qry.FieldByName('IDPESSOA').AsString);
     If piFlagInsert = 1
      Then Begin
        SQL.Add('             AND C.IDPLANASS    = -1');
        SQL.Add('             AND C.SEQPROPOSTA  = -1) CA');
        SQL.Add('           WHERE CB.IDCONTASS = CT.IDCONTRIBUICAO');
        SQL.Add('             AND CB.IDPLANASS = -1');
      End
      Else Begin
        SQL.Add('             AND C.IDPLANASS    = '+qryDet.FieldByName('IDPLANASS').AsString);
        SQL.Add('             AND C.SEQPROPOSTA  = '+qryDet.ParamByName('SEQPROPOSTA').AsString+') CA');
        SQL.Add('           WHERE CB.IDCONTASS = CT.IDCONTRIBUICAO');
        SQL.Add('             AND CB.IDPLANASS = '+qryDet.FieldByName('IDPLANASS').AsString);
      End;
      SQL.Add('             AND CB.IDCONTASS = CA.IDCONTASS (+)');
      SQL.Add('           ORDER BY CT.NOME) SUB');

     Open;

     chkContrib.Items.Clear;
     i := 0;
     While Not Eof do
      Begin
       chkContrib.Items.Add(Trim(FieldByName('NOME').AsString));
       chkContrib.Checked[i] := (FieldByName('FLGPAGA').AsInteger = 1);
       Inc(i);
       Next;
      End;
   End;
end;

procedure TFrmCadPartAss.FormShow(Sender: TObject);
begin
  inherited;
  // Abertura das queries
  qry.ParamByName('IDPESSOA').AsInteger       := -1;
  qry.Open;

  qryDet.ParamByName('IDPESSJUR').AsInteger   := -1;
  qryDet.ParamByName('SEQPROPOSTA').AsInteger := -1;
  qryDet.ParamByName('IDPLANOPREV').AsInteger := -1;
  qryDet.ParamByName('IDPESSOA').AsInteger    := -1;
  qryDet.Open;

  qryPlanos.ParamByName('IDPESSOA').AsInteger := -1;
  qryPlanos.Open;

  qrySitPlanoAss.Open;


  qryPortForma.Close;
  qryPortForma.Open;

  // limpando Variáveis
  lblFalecido.Caption := '';
  edtCobra.Text       := '';
end;

procedure TFrmCadPartAss.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor
   Then Begin
     // Verifica se o participante é pensionista e não possui Nucleo Familiar
     If (MontaSelect.ValoresChave[2] = '') and (MontaSelect.ValoresChave[3] <> '')
      Then Begin
        MsgDlg('O participante é falecido e não tem responsável'+#13+
               'pelo grupo  familiar  cadastrado. É  necessário'+#13+
               'primeiro cadastrar NUCLEO FAMILIAR.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
        Abort;
      End;
      // Abertura das queries
      qry.Close;
      qry.ParamByName('IDPESSOA').AsInteger       := StrToInt(MontaSelect.ValoresChave[1]);
      qry.Open;

      qryDet.Close;
      qryDet.ParamByName('IDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[4]);
      qryDet.ParamByName('SEQPROPOSTA').AsInteger := StrToInt(MontaSelect.ValoresChave[6]);
      qryDet.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[5]);
      qryDet.ParamByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[1]);
      qryDet.Open;

      MontaPlanos(0); // Gleyber - 20/03/2007 - Pendência 24812

      qryContAss.Close;
      qryContAss.ParamByName('IDPLANOPREV').AsInteger  := StrToInt(MontaSelect.ValoresChave[5]);
      qryContAss.ParamByName('IDPESSJUR').AsInteger    := StrToInt(MontaSelect.ValoresChave[4]);
      qryContAss.ParamByName('IDTITULAR').AsInteger    := StrToInt(MontaSelect.ValoresChave[1]);
      qryContAss.ParamByName('IDDEPENDENTE').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
      qryContAss.ParamByName('SEQPROPOSTA').AsInteger  := StrToInt(MontaSelect.ValoresChave[6]);
      qryContAss.Open;

      // Participante Falecido
      If qry.FieldByName('IDRESPONSAVEL').asString <> ''
       Then lblFalecido.Caption:='Falecido: '+qry.FieldByName('NOME').AsString
       Else lblFalecido.Caption:='';

      OperacaoDetalhe := opIdle;
   End;
end;

procedure TFrmCadPartAss.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  FormaCobranca;
  MontaPlanos(1);
  MontaContribuicoes(1);
  OperacaoDetalhe := opInserir;
  iMudouCobranca  := 0;
end;

procedure TFrmCadPartAss.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  FormaCobranca;
  MontaPlanos(0);
  MontaContribuicoes(0);
  OperacaoDetalhe   := opAlterar;
  btnOpcoes.Enabled := (qryPlanos.FieldByName('FLGACEITAOPCAO').AsInteger = 1);
    iMudouCobranca  := 0;
end;

procedure TFrmCadPartAss.bbtnOkDetClick(Sender: TObject);
Var
 i         : Integer;
 bSelected : Boolean;
begin
  // Crítica de campos
  If Trim(dblkPlano.Text) = ''
   Then Begin
    MsgDlg('É necessário escolher o plano assistencial primeiro.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dblkPlano.SetFocus;
    Exit;
   End;

  //CPrev - 26638 - Inicio
  if (dbrgflgcobcarne.ItemIndex = 1) and (dblkCodPortForma.Text = '') then
    begin
      MsgDlg('É necessário escolher a forma de cobrança.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
      dblkCodPortForma.setfocus;
      Exit;
    end;
  //CPrev - 26638 - Fim

  If Trim(dbtpDataInscricao.Text) = ''
   Then Begin
    MsgDlg('É necessário preencher a data de inscrição no plano assistencial primeiro.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dbtpDataInscricao.SetFocus;
    Exit;
   End;

  If Trim(dblkSitPlanoAss.Text) = ''
   Then Begin
    MsgDlg('É necessário preencher a situação no plano assistencial primeiro.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dblkSitPlanoAss.SetFocus;
    Exit;
   End;

  bSelected := False;
  for i := 0 to (chkContrib.Items.Count - 1) do bSelected := (bSelected) or (chkContrib.Checked[i]);  // Gleyber - 14/02/2007 - Pendência 24340

  If Not bSelected
   Then Begin
    MsgDlg('Escolha a contribuição assistencial que o participante irá pagar primeiro.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    Exit;
   End;

  qryDet.FieldByName('NOME').AsString      := dblkPlano.Text;
  qryDet.FieldByName('DESCRICAO').AsString := dblkSitPlanoAss.Text;

  If OperacaoDetalhe = OpInserir
   Then Begin
    qryDet.FieldByName('IDPESSJUR').AsString   := qry.FieldByName('IDPESSJUR').AsString;
    qryDet.FieldByName('SEQPROPOSTA').AsString := qry.FieldByName('SEQPROPOSTA').AsString;
    qryDet.FieldByName('IDPLANOPREV').AsString := qry.FieldByName('IDPLANOPREV').AsString;
    qryDet.FieldByName('IDPESSOA').AsString    := qry.FieldByName('IDPESSOA').AsString;
   End
   Else OperacaoDetalhe := opIdle;

  inherited;
end;

procedure TFrmCadPartAss.dblkPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  btnOpcoes.Enabled := (OperacaoDetalhe = OpInserir) And (qryPlanos.FieldByName('FLGACEITAOPCAO').AsInteger = 1);

  // Gleyber - 20/03/2007 - Pendência 24812 - Início
  qryContass.Filtered := False;
  If qryDet.State <> dsInsert
  Then Begin
    qryContass.Filter   := 'IDPLANASS='+qryDet.FieldByName('IDPLANASS').AsString;
    qryContass.Filtered := True;
  End;
  qryContass.First;
  // Gleyber - 20/03/2007 - Pendência 24812 - Fim

  MontaContribuicoes(0);
end;

procedure TFrmCadPartAss.btnOpcoesClick(Sender: TObject);
begin
  inherited;

  If Trim(dblkPlano.Text) = ''
  Then Begin
     MsgDlg('Escolha o plano assistencial do participante primeiro.',
            'ATENÇÃO',mtError,[mbOk,mbHelp],0);
     Exit;
  End;

  FrmCadOpcoesPartAss := TFrmCadOpcoesPartAss.Create(Application);
  With FrmCadOpcoesPartAss do
   Begin
     qryPlano.Close;
     qryPlano.ParamByName('IDPLANASS').AsInteger := StrToInt(dblkPlano.LookupValue);
     qryPlano.Open;

     edNomePartAss.Text := qry.FieldByName('NOMERESPONSAVEL').AsString;
     edPlanAss.Text     := dblkPlano.Text;

     If OperacaoDetalhe = opInserir
      Then Begin
         edOpcao1.Text := '';
         edOpcao2.Text := '';
         edOpcao3.Text := '';
         edOpcao4.Text := '';
         edOpcao5.Text := '';
         edOpcao6.Text := '';
         edOpcao7.Text := '';
         edOpcao8.Text := '';
      End
      Else Begin
         edOpcao1.Text := qryDet.FieldByName('VALORBASE1').AsString;
         edOpcao2.Text := qryDet.FieldByName('VALORBASE2').AsString;
         edOpcao3.Text := qryDet.FieldByName('VALORBASE3').AsString;
         edOpcao4.Text := qryDet.FieldByName('VALORBASE4').AsString;
         edOpcao5.Text := qryDet.FieldByName('VALORBASE5').AsString;
         edOpcao6.Text := qryDet.FieldByName('VALORBASE6').AsString;
         edOpcao7.Text := qryDet.FieldByName('VALORBASE7').AsString;
         edOpcao8.Text := qryDet.FieldByName('VALORBASE8').AsString;
      End;

     ShowModal;

     If Trim(edOpcao1.Text) <> ''
      Then qryDet.FieldByName('VALORBASE1').AsFloat := StrToFloat(edOpcao1.Text);

     If Trim(edOpcao2.Text) <> ''
      Then qryDet.FieldByName('VALORBASE2').AsFloat := StrToFloat(edOpcao2.Text);

     If Trim(edOpcao3.Text) <> ''
      Then qryDet.FieldByName('VALORBASE3').AsFloat := StrToFloat(edOpcao3.Text);

     If Trim(edOpcao4.Text) <> ''
      Then qryDet.FieldByName('VALORBASE4').AsFloat := StrToFloat(edOpcao4.Text);

     If Trim(edOpcao5.Text) <> ''
      Then qryDet.FieldByName('VALORBASE5').AsFloat := StrToFloat(edOpcao5.Text);

     If Trim(edOpcao6.Text) <> ''
      Then qryDet.FieldByName('VALORBASE6').AsFloat := StrToFloat(edOpcao6.Text);

     If Trim(edOpcao7.Text) <> ''
      Then qryDet.FieldByName('VALORBASE7').AsFloat := StrToFloat(edOpcao7.Text);

     If Trim(edOpcao8.Text) <> ''
      Then qryDet.FieldByName('VALORBASE8').AsFloat := StrToFloat(edOpcao8.Text);
      
   End;
  FrmCadOpcoesPartAss.Free;
end;

procedure TFrmCadPartAss.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opIdle;
end;

procedure TFrmCadPartAss.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  OperacaoDetalhe := opIdle;
end;

procedure TFrmCadPartAss.bbtnConfirmarClick(Sender: TObject);
begin
  If OperacaoDetalhe <> opIdle
   Then Begin
     MsgDlg('Existe uma tela em edição. Confirme ou cancele a operação primeiro.',
            'ATENÇÃO',mtError,[mbOk,mbHelp],0);
     Exit;
   End;
  inherited;

  // Atualizar contribuições, caso seja necessário
  If iMudouCobranca = 1
   Then Begin
     If MsgDlg('Houve mudança de contribuição associada para o participante.'+#13+#10+
               'Deseja associar igualmente aos dependentes ?',
               'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
      Then Begin
        If Not dtmBaseDados.dbBaseDados.InTransaction
         Then dtmBaseDados.dbBaseDados.StartTransaction;

        Try
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('UPDATE CONTASS CT');
          qryAux.SQL.Add('SET CT.FLGATIVO = 0');
          qryAux.SQL.Add('WHERE CT.IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString);
          qryAux.SQL.Add('  AND CT.IDDEPENDENTE <> CT.IDTITULAR');
          qryAux.SQL.Add('  AND CT.FLGATIVO = 1');
          qryAux.SQL.Add('  AND CT.IDCONTASS = (SELECT C.IDCONTASS');
          qryAux.SQL.Add('                       FROM CONTASS C');
          qryAux.SQL.Add('                       WHERE C.IDTITULAR = CT.IDTITULAR');
          qryAux.SQL.Add('                         AND C.IDDEPENDENTE = C.IDTITULAR ');
          qryAux.SQL.Add('                         AND C.FLGATIVO = 0)');

          qryAux.ExecSQL;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('UPDATE CONTASS CT');
          qryAux.SQL.Add('SET CT.FLGATIVO = 1');
          qryAux.SQL.Add('WHERE CT.IDTITULAR = '+qry.FieldByName('IDPESSOA').AsString);
          qryAux.SQL.Add('  AND CT.IDDEPENDENTE <> CT.IDTITULAR');
          qryAux.SQL.Add('  AND CT.FLGATIVO = 0');
          qryAux.SQL.Add('  AND CT.IDCONTASS = (SELECT C.IDCONTASS');
          qryAux.SQL.Add('                      FROM CONTASS C');
          qryAux.SQL.Add('                      WHERE C.IDTITULAR = CT.IDTITULAR');
          qryAux.SQL.Add('                        AND C.IDDEPENDENTE = C.IDTITULAR ');
          qryAux.SQL.Add('                        AND C.FLGATIVO = 1)');

          qryAux.ExecSQL;

          dtmBaseDados.dbBaseDados.Commit;
          MsgDlg('Contribuições dos dependentes associadas com sucesso.',
                 'AVISO',mtInformation,[mbOk],0);
        Except
          MsgDlg('Erro na atualização das contribuições dos dependentes.',
                 'ERRO',mtError,[mbOk],0);
          dtmBaseDados.dbBaseDados.Rollback;
        End;
      End;
   End;
  iMudouCobranca := 0;
end;

procedure TFrmCadPartAss.chkContribClickCheck(Sender: TObject);
Var
 iItem : Integer;
begin
  inherited;
  iItem := chkContrib.ItemIndex;

  iMudouCobranca  := 1;

  qryContribAss.Locate('ITEM',iItem,[loPartialKey]);

  If chkContrib.Checked[iItem]
   Then Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT 1');
     qryAux.SQL.Add('FROM CONTASS ');
     qryAux.SQL.Add('WHERE IDPLANASS    = '+qryDet.FieldByName('IDPLANASS').AsString);
     qryAux.SQL.Add('  AND IDTITULAR    = '+qry.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND IDDEPENDENTE = '+qry.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString);
     qryAux.SQL.Add('  AND IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString);
     qryAux.SQL.Add('  AND IDCONTASS    = '+qryContribAss.FieldByName('IDCONTASS').AsString);

     qryAux.Open;

     If qryAux.IsEmpty
      Then Begin
         qryContass.Insert;
         qryContass.FieldByName('IDPLANASS').AsInteger    := qryDet.FieldByName('IDPLANASS').AsInteger;
         qryContass.FieldByName('IDTITULAR').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
         qryContass.FieldByName('IDDEPENDENTE').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
         qryContass.FieldByName('IDPLANOPREV').AsInteger  := qry.FieldByName('IDPLANOPREV').AsInteger;
         qryContass.FieldByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
         qryContass.FieldByName('IDCONTASS').AsInteger    := qryContribAss.FieldByName('IDCONTASS').AsInteger;
         qryContass.FieldByName('FLGATIVO').AsInteger     := 1;
         qryContass.FieldByName('RECPAG').AsString        := 'R';
         qryContass.FieldByName('IDPAGADOR').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
         qryContass.FieldByName('SEQPROPOSTA').AsInteger  := qry.FieldByName('SEQPROPOSTA').AsInteger;

         qryContass.Post;
      End
      Else If qryContass.Locate('IDCONTASS', qryContribAss.FieldByName('IDCONTASS').AsInteger,[loPartialKey])
            Then Begin
              qryContass.Edit;
              qryContass.FieldByName('FLGATIVO').AsInteger     := 1;

              qryContass.Post;
            End;


   End
   Else If qryContass.Locate('IDCONTASS', qryContribAss.FieldByName('IDCONTASS').AsInteger,[loPartialKey])
         Then Begin
           qryContass.Edit;
           qryContass.FieldByName('FLGATIVO').AsInteger     := 0;
           qryContass.Post;
         End;

end;

procedure TFrmCadPartAss.CmeCadastroConfirma(Sender: TObject);
begin
  AplicaAlteracoes([qryContass, qryDet]); 
  inherited;
end;

procedure TFrmCadPartAss.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  // Gleyber - 20/03/2007 - Pendência 24812 - Início
  qryContass.Filtered := False;
  If (qryDet.State <> dsInsert) And (Trim(dblkPlano.Text) <> '') 
  Then Begin
    qryContass.Filter   := 'IDPLANASS='+qryDet.FieldByName('IDPLANASS').AsString;
    qryContass.Filtered := True;
  End;
  qryContass.First;
  // Gleyber - 20/03/2007 - Pendência 24812 - Fim
end;

end.
