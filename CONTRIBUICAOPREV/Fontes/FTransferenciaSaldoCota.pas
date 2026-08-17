{
*****************************************************************************
***************************** REGISTRO DE ALTERAÇÕES ************************
*****************************************************************************  }
//-----------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Solicitação : WO6161
// Data        : 14/12/2023    (merge 05/06/2025)
// Responsável : Paulo Nobre
// Descrição   : Refletir na HSTCONTRIBPREV a mesma movimentação de saldos que estão
//               sendo realizados na HISTMOVRESERVA de uma matricula X de uma Pessoa
//               para uma matricula Y da mesma Pessoa.
//-----------------------------------------------------------------------------------
// Pendência   : SIG103759
// Responsável : Taffarel Sevaybriker
// Data        : 03/11/2020
// Descrição   : Correção de erro de dataset na transferência de saldo de cota.
// --------------------------------------------------------------------------------
// Pendência   : SOL:265071 - PPM:1163508
// Responsável : Michelle Suellyn Mota
// Data        : 23/11/2015
// Descrição   : Limpa tela quando zera saldo de cota.
// --------------------------------------------------------------------------------
// Pendência   : SOL 132490 KINTANA 765970
// Responsável : BRUNO AZEVEDO
// Data        : 23/01/2011
// Descrição   : Criação da Funcionalidade "Transferência de Saldo de Conta".
//--------------------------------------------------------------------------------
Unit FTransferenciaSaldoCota;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, TB97Ctls, ComCtrls, Spin,
  wwdblook, Menus, DBCtrls, Mask, wwdbedit, wwdbdatetimepicker,
  CMDateTimePicker, TEdNum, UConsPart, UCtrlDocumento, UCtrlLancamento,
  uMovReserva, fSolicitaDataAlimentacao,
  UContribuicaoPrev, DBClient, uCMClientDataSet;  // Paulo Nobre - WO6161

Type
  TfrmTransferenciaSaldoCota = Class(TfrmOkCancelar)
    pmlParticipante: TPanel;
    stxtProcesso: TStaticText;
    MontaSelect: TMontaSelect;
    pnlContribuicoes: TPanel;
    pcTransf: TPageControl;
    tbsTransferencia: TTabSheet;
    gridMatricula1: TwwDBGrid;
    tbsDesfazerTransferencia: TTabSheet;
    Panel7: TPanel;
    bbtnProcurar: TBitBtn;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lblParticipante: TLabel;
    lblPatrocinadora: TLabel;
    lblMatricula: TLabel;
    lblPlano: TLabel;
    lblSituacao: TLabel;
    lblInscricao: TLabel;
    btnMatric2ParaMatric1: TSpeedButton;
    btnMatric1ParaMatric2: TSpeedButton;
    lblMatricula1: TLabel;
    dsMatricula1: TDataSource;
    qryMatricula1: TQuery;
    qryMatricula2: TQuery;
    dsMatricula2: TDataSource;
    lblSaldosReserva1: TLabel;
    LblSaldoResControle1: TLabel;
    gridMatricula2: TwwDBGrid;
    lblMatricula2: TLabel;
    lblSaldosReserva2: TLabel;
    LblSaldoResControle2: TLabel;
    qryChecaMatriculas: TQuery;
    updMatricula1: TUpdateSQL;
    updMatricula2: TUpdateSQL;
    qryAux: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    BitBtn1: TBitBtn;
    qryIndice: TwwQuery;
    qryDesfazer: TwwQuery;
    dsDesfazer: TDataSource;
    qryHistMovReserva: TwwQuery;
    qryHistContribPrev: TwwQuery;
    dsHistMovReserva: TDataSource;
    dsHistContribPrev: TDataSource;
    qryAux2: TwwQuery;
    Procedure FormShow(Sender: TObject);
    Procedure bbtnProcurarClick(Sender: TObject);
    Procedure btnMatric1ParaMatric2Click(Sender: TObject);
    Procedure btnMatric2ParaMatric1Click(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure BitBtn1Click(Sender: TObject);
    Procedure AtualizaReservaPart(pIdPessoa, pIdPessJur, pIdPlanoPrev: Integer);
    Procedure FormCreate(Sender: TObject);        //Michelle Mota - SOL:265071 - PPM:1163508
  Private
    Procedure CarregaReservaMatriculas(pQryDados: TQuery; Limpar: integer = 0); //Taffarel - SIG103759
    Procedure CarregaDesfazer(pQryDados: TQuery);
    Procedure AtualizaSaldo();
    Function BuscaDataAlimentacao(): TDatetime;

  Public
    Procedure LimpaTela;
    Procedure _AtualizaFrmProgresso(Var iContador: integer); // Paulo Nobre - WO6161
  End;

Var
  frmTransferenciaSaldoCota: TfrmTransferenciaSaldoCota;
  Processou: Boolean;                             // Variável de controle de interface - Michelle Mota - SOL:265071 - PPM:1163508

Implementation
{$R *.DFM}

Uses
  FAguarde, UParticipante, FTelaAut, UMensErro, DBaseDados, USistema, UModulo, FProgresso;

Procedure TfrmTransferenciaSaldoCota.bbtnProcurarClick(Sender: TObject);
Begin
  Inherited;
  Try
    MontaSelect.Executar;
    pcTransf.ActivePage := tbsTransferencia;
    If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '')
      Then
    Begin
      lblParticipante.Caption := MontaSelect.ValoresChave[3];
      lblMatricula.Caption := MontaSelect.ValoresChave[4];
      lblPatrocinadora.Caption := MontaSelect.ValoresChave[5];
      lblPlano.Caption := MontaSelect.ValoresChave[6];
      lblSituacao.Caption := MontaSelect.ValoresChave[8];
      lblInscricao.Caption := MontaSelect.ValoresChave[12];

      qryChecaMatriculas.Close;
      qryChecaMatriculas.Sql.Clear;
      qryChecaMatriculas.Sql.Add('SELECT P1.NUMDOCUMENTO, P1.IDPESSOA AS PESSOA1, P2.IDPESSOA AS PESSOA2, ');
      qryChecaMatriculas.Sql.Add('       PPP1.IDPLANOPREV AS PLANO, PPP1.IDPESSJUR AS IDPESSJUR, PPP2.IDPLANOPREV, ');
      qryChecaMatriculas.Sql.Add('       DPT1.MATRICULA AS MATRICULA1, DPT2.MATRICULA AS MATRICULA2 ');
      qryChecaMatriculas.Sql.Add('       FROM PESSOA P1 ');
      qryChecaMatriculas.Sql.Add(' INNER JOIN PESSOA P2 ON ');
      qryChecaMatriculas.Sql.Add('       P2.NUMDOCUMENTO = P1.NUMDOCUMENTO ');
      qryChecaMatriculas.Sql.Add(' INNER JOIN PARTPREVPLAN PPP1 ON ');
      qryChecaMatriculas.Sql.Add('       PPP1.IDPESSOA = P1.IDPESSOA ');
      qryChecaMatriculas.Sql.Add(' INNER JOIN PARTPREVPLAN PPP2 ON ');
      qryChecaMatriculas.Sql.Add('       PPP2.IDPESSOA = P2.IDPESSOA ');
      qryChecaMatriculas.Sql.Add('   AND PPP2.IDPLANOPREV = PPP1.IDPLANOPREV ');
      qryChecaMatriculas.Sql.Add(' INNER JOIN DEPENTIT DPT1 ON ');
      qryChecaMatriculas.Sql.Add('       DPT1.IDPESSOA = P1.IDPESSOA ');
      qryChecaMatriculas.Sql.Add(' INNER JOIN DEPENTIT DPT2 ON ');
      qryChecaMatriculas.Sql.Add('       DPT2.IDPESSOA = P2.IDPESSOA ');
      qryChecaMatriculas.Sql.Add(' WHERE P1.IDPESSOA = ' + MontaSelect.ValoresChave[0]);
      qryChecaMatriculas.Sql.Add('   AND P1.IDPESSOA <> P2.IDPESSOA ');
      qryChecaMatriculas.Open;

      If (qryChecaMatriculas.RecordCount > 0) Then
      Begin
        CarregaReservaMatriculas(qryChecaMatriculas);
        CarregaDesfazer(qryChecaMatriculas);

        lblMatricula1.Caption := 'Matricula: ' + qryChecaMatriculas.FieldByName('MATRICULA1').AsString;
        lblMatricula2.Caption := 'Matricula: ' + qryChecaMatriculas.FieldByName('MATRICULA2').AsString;

        AtualizaSaldo();
      End
      Else
      Begin
        // Paulo Nobre - WO6161 - Inicio
        MsgDlg('O participante inserido não possui mais de uma matrícula para o mesmo plano e vinculado a mesma patrocinadora.', 'Informação', mtInformation, [mbOk], 0);
        // Paulo Nobre - WO6161 - Fim
        Exit;
      End;
    End
    Else
    Begin
      LimpaTela;
    End;
  Finally
    screen.Cursor := crDefault;
  End;
End;

Procedure TfrmTransferenciaSaldoCota.LimpaTela;
Begin
  lblParticipante.Caption := '';
  lblMatricula.Caption := '';
  lblPatrocinadora.Caption := '';
  lblPlano.Caption := '';
  lblSituacao.Caption := '';
  lblInscricao.Caption := '';
End;

Procedure TfrmTransferenciaSaldoCota.FormShow(Sender: TObject);
Begin
  Inherited;
  WindowState := wsMaximized;
  LimpaTela;
  MontaSelect.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = 1)');

  lblMatricula1.Caption := 'Matricula';
  lblMatricula2.Caption := 'Matricula';
  pcTransf.activepage := tbsTransferencia;
End;

Procedure TfrmTransferenciaSaldoCota.CarregaReservaMatriculas(pQryDados: TQuery; Limpar: integer = 0);
Var
  sCampos: String;
  //Taffarel - SIG103759 - início
  IdPessoa1: String;
  IdPessoa2: String;
  IdPessJur: String;
  IdPlano: String;

Begin
  If (pQryDados <> Nil) Then
  Begin
    IdPessoa1 := pQryDados.FieldByName('PESSOA1').AsString;
    IdPessoa2 := pQryDados.FieldByName('PESSOA2').AsString;
    IdPessJur := pQryDados.FieldByName('IDPESSJUR').AsString;
    IdPlano := pQryDados.FieldByName('PLANO').AsString;
  End
  Else
  Begin
    idPessoa1 := '-1';
    IdPessoa2 := idPessoa1;
    IdPessJur := idPessoa1;
    IdPlano := idPessoa1;
  End;
  //Taffarel - SIG103759 - fim

  pcTransf.ActivePageIndex := 0;

  sCampos := 'HMR.IDHISTRESERVA AS CODIGO, ' +
    'HMR.MESREFERENCIA AS REFERENCIA, ' +
    'DECODE(HMR.FLGENTRADA,1,''E'',''S'') AS ES, ' +
    'HMR.SALDOCOTAS AS SALDOCOTAS, ' +
    'HMR.VALORINDICE AS VALORINDICE, ' +
    'HMR.SALDOREAL AS SALDOREAL, ' +
    'HMR.VLRCOTAS AS VALORCOTAS, ' +
    'HMR.VLRREAL AS VALORREAL, ' +
    'RXP.NOME, ' +
    'HMR.DATAALIMENTACAO AS ALIMENTACAO, ' +
    'HMR.DATAMOV AS MOVIMENTO, ' +
    'CON.NOME AS CONTRIBUICAO, ' +
    'HMR.IDPESSJUR AS PATROCINADORA, ' +
    'HMR.IDPESSOAORIGEM AS IDPESSOAORIGEM, ' +
    'HMR.IDPESSOA AS IDPESSOA, ' +
    'NVL(RXP.FLGCOLETIVA,0) AS FLGCOLETIVA, ' +
    'NVL(RXP.FLGCONTROLE,0) AS FLGCONTROLE, ' +
    'CO.COTVALOR*RS.VALORRESERVA AS VLRATUAL, ' +
    'RXP.FLGTITULARCOLET, ' +
    'CO.COTVALOR, ' +
    'HMR.IDTIPORESERVA ';

  If (Limpar = 1) Or (Limpar = 0) Then            //Taffarel - SIG103759
  Begin
    qryMatricula1.Close;
    qryMatricula1.Sql.Clear;
    qryMatricula1.Sql.Add('SELECT ' + sCampos + ' ');
    qryMatricula1.Sql.Add('  FROM HISTMOVRESERVA HMR, ');
    qryMatricula1.Sql.Add('  (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX ');
    qryMatricula1.Sql.Add('          FROM RESERVAPART RP1, RESERVAXPLANO TP1, COTACAOMOEDA CO1 ');
    //Taffarel - SIG103759 - início
    //qryMatricula1.Sql.Add('         WHERE RP1.IDPESSJUR = ' + pQryDados.FieldByName('IDPESSJUR').AsString);
    //qryMatricula1.Sql.Add('           AND RP1.IDPESSOA = ' + pQryDados.FieldByName('PESSOA1').AsString);
    //qryMatricula1.Sql.Add('           AND RP1.IDPLANOPREV = ' + pQryDados.FieldByName('PLANO').AsString);
    qryMatricula1.Sql.Add('         WHERE RP1.IDPESSJUR = ' + IdPessJur);
    qryMatricula1.Sql.Add('           AND RP1.IDPESSOA = ' + IdPessoa1);
    qryMatricula1.Sql.Add('           AND RP1.IDPLANOPREV = ' + IdPlano);
    //Taffarel - SIG103759 - fim
    qryMatricula1.Sql.Add('           AND TP1.IDPLANOPREV = RP1.IDPLANOPREV ');
    qryMatricula1.Sql.Add('           AND TP1.IDTIPORESERVA = RP1.IDTIPORESERVA ');
    qryMatricula1.Sql.Add('           AND CO1.MOECODIGO = TP1.INDICEREAJUSTE ');
    qryMatricula1.Sql.Add('         GROUP BY TP1.INDICEREAJUSTE) MAXDATA, ');
    qryMatricula1.Sql.Add(' RESERVAXPLANO RXP, ');
    qryMatricula1.Sql.Add(' CONTRIBUICAO CON, ');
    qryMatricula1.Sql.Add(' COTACAOMOEDA CO, ');
    qryMatricula1.Sql.Add(' RESERVAPART RS ');
    qryMatricula1.Sql.Add(' WHERE RXP.IDTIPORESERVA = HMR.IDTIPORESERVA ');
    qryMatricula1.Sql.Add('   AND CON.IDCONTRIBUICAO(+) = HMR.IDCONTRIBUICAO ');
    qryMatricula1.Sql.Add('   AND RXP.INDICEREAJUSTE = MAXDATA.INDICERE(+) ');
    qryMatricula1.Sql.Add('   AND CO.MOECODIGO(+) = MAXDATA.INDICERE ');
    qryMatricula1.Sql.Add('   AND CO.COTDATA(+) = MAXDATA.DATAMAX ');
    qryMatricula1.Sql.Add('   AND RS.IDPESSJUR = HMR.IDPESSJUR ');
    qryMatricula1.Sql.Add('   AND RS.IDPESSOA = HMR.IDPESSOA ');
    qryMatricula1.Sql.Add('   AND RS.IDPLANOPREV = HMR.IDPLANOPREV ');
    qryMatricula1.Sql.Add('   AND RS.SEQPROPOSTA = HMR.SEQPROPOSTA ');
    qryMatricula1.Sql.Add('   AND RS.IDTIPORESERVA = RXP.IDTIPORESERVA ');
    //Taffarel - SIG103759 - início
    //qryMatricula1.Sql.Add('   AND HMR.IDPESSOA = ' + pQryDados.FieldByName('PESSOA1').AsString);
    //qryMatricula1.Sql.Add('   AND HMR.IDPLANOPREV = ' + pQryDados.FieldByName('PLANO').AsString);
    //qryMatricula1.Sql.Add('   AND HMR.IDPESSJUR = ' + pQryDados.FieldByName('IDPESSJUR').AsString);
    qryMatricula1.Sql.Add('   AND HMR.IDPESSOA = ' + IdPessoa1);
    qryMatricula1.Sql.Add('   AND HMR.IDPLANOPREV = ' + IdPlano);
    qryMatricula1.Sql.Add('   AND HMR.IDPESSJUR = ' + IdPessJur);
    //Taffarel - SIG103759 - fim
    qryMatricula1.Sql.Add('   AND HMR.IDBENEFICIO IS NULL ');
    qryMatricula1.Sql.Add(' ORDER BY HMR.IDTIPORESERVA, HMR.MESREFERENCIA ');
    qryMatricula1.Open;
  End;

  If (Limpar = 2) Or (Limpar = 0) Then            //Taffarel - SIG103759
  Begin
    qryMatricula2.Close;
    qryMatricula2.Sql.Clear;
    qryMatricula2.Sql.Add('SELECT ' + sCampos + ' ');
    qryMatricula2.Sql.Add('  FROM HISTMOVRESERVA HMR, ');
    qryMatricula2.Sql.Add('  (SELECT TP1.INDICEREAJUSTE INDICERE, MAX(COTDATA) AS DATAMAX ');
    qryMatricula2.Sql.Add('          FROM RESERVAPART RP1, RESERVAXPLANO TP1, COTACAOMOEDA CO1 ');
    //Taffarel - SIG103759 - início
    //qryMatricula2.Sql.Add('         WHERE RP1.IDPESSJUR = ' + pQryDados.FieldByName('IDPESSJUR').AsString);
    //qryMatricula2.Sql.Add('           AND RP1.IDPESSOA = ' + pQryDados.FieldByName('PESSOA2').AsString);
    //qryMatricula2.Sql.Add('           AND RP1.IDPLANOPREV = ' + pQryDados.FieldByName('PLANO').AsString);
    qryMatricula2.Sql.Add('         WHERE RP1.IDPESSJUR = ' + IdPessJur);
    qryMatricula2.Sql.Add('           AND RP1.IDPESSOA = ' + IdPessoa2);
    qryMatricula2.Sql.Add('           AND RP1.IDPLANOPREV = ' + IdPlano);
    //Taffarel - SIG103759 - fim
    qryMatricula2.Sql.Add('           AND TP1.IDPLANOPREV = RP1.IDPLANOPREV ');
    qryMatricula2.Sql.Add('           AND TP1.IDTIPORESERVA = RP1.IDTIPORESERVA ');
    qryMatricula2.Sql.Add('           AND CO1.MOECODIGO = TP1.INDICEREAJUSTE ');
    qryMatricula2.Sql.Add('         GROUP BY TP1.INDICEREAJUSTE) MAXDATA, ');
    qryMatricula2.Sql.Add(' RESERVAXPLANO RXP, ');
    qryMatricula2.Sql.Add(' CONTRIBUICAO CON, ');
    qryMatricula2.Sql.Add(' COTACAOMOEDA CO, ');
    qryMatricula2.Sql.Add(' RESERVAPART RS ');
    qryMatricula2.Sql.Add(' WHERE RXP.IDTIPORESERVA = HMR.IDTIPORESERVA ');
    qryMatricula2.Sql.Add('   AND CON.IDCONTRIBUICAO(+) = HMR.IDCONTRIBUICAO ');
    qryMatricula2.Sql.Add('   AND RXP.INDICEREAJUSTE = MAXDATA.INDICERE(+) ');
    qryMatricula2.Sql.Add('   AND CO.MOECODIGO(+) = MAXDATA.INDICERE ');
    qryMatricula2.Sql.Add('   AND CO.COTDATA(+) = MAXDATA.DATAMAX ');
    qryMatricula2.Sql.Add('   AND RS.IDPESSJUR = HMR.IDPESSJUR ');
    qryMatricula2.Sql.Add('   AND RS.IDPESSOA = HMR.IDPESSOA ');
    qryMatricula2.Sql.Add('   AND RS.IDPLANOPREV = HMR.IDPLANOPREV ');
    qryMatricula2.Sql.Add('   AND RS.SEQPROPOSTA = HMR.SEQPROPOSTA ');
    qryMatricula2.Sql.Add('   AND RS.IDTIPORESERVA = RXP.IDTIPORESERVA ');
    //Taffarel - SIG103759 - início
    //qryMatricula2.Sql.Add('   AND HMR.IDPESSOA = ' + pQryDados.FieldByName('PESSOA2').AsString);
    //qryMatricula2.Sql.Add('   AND HMR.IDPLANOPREV = ' + pQryDados.FieldByName('PLANO').AsString);
    //qryMatricula2.Sql.Add('   AND HMR.IDPESSJUR = ' + pQryDados.FieldByName('IDPESSJUR').AsString);
    qryMatricula2.Sql.Add('   AND HMR.IDPESSOA = ' + IdPessoa2);
    qryMatricula2.Sql.Add('   AND HMR.IDPLANOPREV = ' + IdPlano);
    qryMatricula2.Sql.Add('   AND HMR.IDPESSJUR = ' + IdPessJur);
    //Taffarel - SIG103759 - fim
    qryMatricula2.Sql.Add('   AND HMR.IDBENEFICIO IS NULL ');
    qryMatricula2.Sql.Add(' ORDER BY HMR.IDTIPORESERVA, HMR.MESREFERENCIA  ');
    qryMatricula2.Open;
  End;
End;

Procedure TfrmTransferenciaSaldoCota.btnMatric1ParaMatric2Click(Sender: TObject);
Var
  i: Integer;
Begin
  Try
    Inherited;
    screen.Cursor := crSQLWait;
    qryMatricula1.DisableControls;
    qryMatricula1.First;
    While Not qryMatricula1.Eof Do
    Begin
      qryMatricula2.Insert;
      For i := 0 To qryMatricula1.Fields.Count - 1 Do
      Begin
        If (qryMatricula1.Fields[i].FieldName = 'IDPESSOAORIGEM') Then
        Begin
          qryMatricula2.FieldByName('IDPESSOAORIGEM').AsString := qryMatricula1.FieldByName('IDPESSOA').AsString;
        End
        Else
        Begin
          If (qryMatricula1.Fields[i].FieldName <> 'IDPESSOA') Then
          Begin
            qryMatricula2.FieldByName(qryMatricula1.Fields[i].FieldName).AsString := qryMatricula1.FieldByName(qryMatricula1.Fields[i].FieldName).AsString;
          End;
        End;
      End;
      qryMatricula2.Post;

      qryMatricula1.Next;
    End;
    qryMatricula1.First;
    While Not qryMatricula1.Eof Do
    Begin
      qryMatricula1.Delete;
    End;
    qryMatricula2.First;
    qryMatricula1.EnableControls;
    Processou := False;                           // Michelle Mota - SOL:265071 - PPM:1163508
    AtualizaSaldo();
  Finally
    screen.Cursor := crDefault;
  End;
End;

Procedure TfrmTransferenciaSaldoCota.btnMatric2ParaMatric1Click(
  Sender: TObject);
Var
  i: Integer;
Begin
  Try
    Inherited;
    screen.Cursor := crSQLWait;

    qryMatricula2.DisableControls;
    qryMatricula2.First;
    While Not qryMatricula2.Eof Do
    Begin
      qryMatricula1.Insert;
      For i := 0 To qryMatricula2.Fields.Count - 1 Do
      Begin
        If (qryMatricula2.Fields[i].FieldName = 'IDPESSOAORIGEM') Then
        Begin
          qryMatricula1.FieldByName('IDPESSOAORIGEM').AsString := qryMatricula2.FieldByName('IDPESSOA').AsString;
        End
        Else
        Begin
          If (qryMatricula2.Fields[i].FieldName <> 'IDPESSOA') Then
          Begin
            qryMatricula1.FieldByName(qryMatricula2.Fields[i].FieldName).AsString := qryMatricula2.FieldByName(qryMatricula2.Fields[i].FieldName).AsString;
          End;
        End;
      End;
      qryMatricula1.Post;

      qryMatricula2.Next;
    End;
    qryMatricula2.First;
    While Not qryMatricula2.Eof Do
    Begin
      qryMatricula2.Delete;
    End;
    qryMatricula1.First;
    qryMatricula2.EnableControls;
    Processou := False;                           // Michelle Mota - SOL:265071 - PPM:1163508
    AtualizaSaldo();
  Finally
    screen.Cursor := crDefault;
  End;
End;

Procedure TfrmTransferenciaSaldoCota.bbtnConfirmarClick(Sender: TObject);
Var
  sOrigem: String;
  sFlgEntrada: String;
  dDataAlimentacao: TDateTime;
  sTipoReserva: String;
  dDataIndice: TDateTime;
  fValorCotas: Extended;
  iContador, iFlgDev, iNumreceb: Integer;         // Paulo Nobre - WO6161
Begin
  Inherited;
  Try
    If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
    Begin
      dtmBaseDados.dbBaseDados.StartTransaction();
    End;

    sOrigem := '';
    If (qryMatricula1.RecordCount = 0) Then
    Begin
      sOrigem := 'De1Para2';
    End
    Else If (qryMatricula2.RecordCount = 0) Then
    Begin
      sOrigem := 'De2Para1';
    End
    Else
    Begin
      sOrigem := '';
      MsgDlg('É necessário transferir as reservas entre as matrículas para o processamento.', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    End;

    dDataAlimentacao := BuscaDataAlimentacao();

    qryMatricula1.DisableControls;
    qryMatricula2.DisableControls;

    If (sOrigem = 'De1Para2') Then                // Se movimentou da Matricula 1 para a matricula 2
    Begin
      // Selecionando as reservas da Pessoa 1
      qryHistMovReserva.Close;
      qryHistMovReserva.Sql.Clear;
      qryHistMovReserva.Sql.Add('SELECT * FROM HISTMOVRESERVA HMR');
      qryHistMovReserva.Sql.Add('WHERE HMR.IDPESSOA = ' + qryChecaMatriculas.FieldByName('PESSOA1').AsString);
      qryHistMovReserva.Sql.Add('      AND HMR.IDPLANOPREV = ' + qryChecaMatriculas.FieldByName('PLANO').AsString);
      qryHistMovReserva.Sql.Add('      AND HMR.IDPESSJUR = ' + qryChecaMatriculas.FieldByName('IDPESSJUR').AsString);
      qryHistMovReserva.Sql.Add('      AND HMR.IDBENEFICIO IS NULL');
      qryHistMovReserva.Sql.Add('      AND (HMR.IDPESSOAORIGEM IS NULL AND HMR.IDPESSOADESTINO IS NULL) '); // Paulo Nobre - WO6161
      qryHistMovReserva.Sql.Add('ORDER BY HMR.IDTIPORESERVA, HMR.MESREFERENCIA');
      qryHistMovReserva.Open;

      sTipoReserva := '';
      fValorCotas := 0;

      // Paulo Nobre - WO6161 - Inicio
      // Macete pra atualizar o recordcount da query, pois o mesmo não está atualizando de forma default - BUG
      qryHistMovReserva.Last;
      qryHistMovReserva.First;

      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, Transferindo Reservas da Mat.: ' + lblMatricula1.Caption + ' para a Mat.: ' + lblMatricula2.Caption, True, False, True, 0, qryHistMovReserva.recordcount);
      Application.ProcessMessages;
      // Paulo Nobre - WO6161 - Fim

      While Not qryHistMovReserva.Eof Do
      Begin
        // Para cada tipo de reserva da pessoa selecionar o indice de reajuste deste tipo de reserva
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Add('SELECT IDTIPORESERVA, INDICEREAJUSTE');
        qryAux.Sql.Add('FROM RESERVAXPLANO');
        qryAux.Sql.Add('WHERE IDTIPORESERVA = ' + qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString);
        qryAux.Sql.Add('      AND IDPLANOPREV = ' + qryChecaMatriculas.FieldByName('PLANO').AsString);
        qryAux.Open;

        // Selecionando o maior valor da cota baseado na dataindice de 30 dias atrás
        dDataIndice := (dDataAlimentacao - 30);
        qryIndice.Close;
        qryIndice.Sql.Clear;
        qryIndice.Sql.Add('SELECT COTDATA, COTVALOR');
        qryIndice.Sql.Add('FROM COTACAOMOEDA');
        qryIndice.Sql.Add('WHERE MOECODIGO = ' + qryAux.FieldByName('INDICEREAJUSTE').AsString);
        qryIndice.Sql.Add('      AND COTDATA IN');
        qryIndice.Sql.Add('       (SELECT MAX(COTDATA)');
        qryIndice.Sql.Add('        FROM COTACAOMOEDA');
        qryIndice.Sql.Add('        WHERE MOECODIGO = ' + qryAux.FieldByName('INDICEREAJUSTE').AsString);
        qryIndice.Sql.Add('              AND COTDATA <= TO_DATE(''' + '01/' + Copy(DateToStr(dDataIndice), 4, 10) + ''', ''DD/MM/YYYY''))');
        qryIndice.Open;

        //GERAR A MOVIMENTAÇÃO NA HISTMOVRESREVA PARA A PESSOA 2
        GeraHistMovReservaContribuicao(qryAux,
          qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
          qryChecaMatriculas.FieldByName('PLANO').AsInteger,
          qryChecaMatriculas.FieldByName('PESSOA2').AsInteger,
          qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistMovReserva.FieldByName('IDTIPORESERVA').AsInteger,
          qryHistMovReserva.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
          qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
          0,
          qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat,
          qryHistMovReserva.FieldByName('VLRREAL').AsFloat,
          qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
          qryIndice.FieldByName('COTVALOR').AsFloat,
          qryIndice.FieldByName('COTDATA').AsString,
          qryHistMovReserva.FieldByName('DATAMOV').AsString,
          qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
          qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger, // 0 = saida / 1 = entrada
          1,                                      // Alimentacao manual
          DateToStr(dDataAlimentacao),
          qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOAORIGEM
          qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOADESTINO
          '', 0,                                                     // Paulo Nobre - WO6161
          qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger  // Paulo Nobre - WO6161
          );

        If ((sTipoReserva <> qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString) And (sTipoReserva <> '')) Then
        Begin
          //GERAR A MOVIMENTAÇÃO NA HISTMOVRESERV PARA ZERAR O SALDO DA MATRICULA ANTERIOR
          sFlgEntrada := '0';                     // 0 = saida
          GeraHistMovReservaContribuicao(qryAux,
            qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
            qryChecaMatriculas.FieldByName('PLANO').AsInteger,
            qryChecaMatriculas.FieldByName('PESSOA1').AsInteger,
            qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
            StrToInt(sTipoReserva),
            0,                                    // IDCONTRIBUICAO
            qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
            qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
            0,
            fValorCotas,
            fValorCotas * qryIndice.FieldByName('COTVALOR').AsFloat,
            qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
            qryHistMovReserva.FieldByName('VALORINDICE').AsFloat,
            qryHistMovReserva.FieldByName('DATAINDICE').AsString,
            qryHistMovReserva.FieldByName('DATAMOV').AsString,
            qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
            StrToInt(sFlgEntrada),                // 0 = saida
            1,                                    // Alimentacao manual
            DateToStr(dDataAlimentacao),
            qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOAORIGEM
            qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOADESTINO
            '', 0,                                                     // Paulo Nobre - WO6161
            qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger  // Paulo Nobre - WO6161
            );

          fValorCotas := 0;
          sTipoReserva := qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString;
          If (qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger = 0) Then
          Begin
            fValorCotas := fValorCotas - qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End
          Else
          Begin
            fValorCotas := fValorCotas + qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End;

        End
        Else
        Begin
          sTipoReserva := qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString;
          If (qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger = 0) Then
          Begin
            fValorCotas := fValorCotas - qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End
          Else
          Begin
            fValorCotas := fValorCotas + qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End;
        End;

        qryHistMovReserva.Next;
        _AtualizaFrmProgresso(iContador);         // Paulo Nobre - WO6161
      End;

      //GERAR A MOVIMENTAÇÃO NA HISTMOVRESREVA PARA ESTORNAR A MATRICULA ANTERIOR - Ultima Reserva da Pessoa 1
      sFlgEntrada := '0';                         // 0 = saida
      GeraHistMovReservaContribuicao(qryAux,
        qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
        qryChecaMatriculas.FieldByName('PLANO').AsInteger,
        qryChecaMatriculas.FieldByName('PESSOA1').AsInteger,
        qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
        StrToInt(sTipoReserva),
        0,                                        // IDCONTRIBUICAO
        qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
        qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
        0,
        fValorCotas,
        fValorCotas * qryIndice.FieldByName('COTVALOR').AsFloat,
        qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
        qryHistMovReserva.FieldByName('VALORINDICE').AsFloat,
        qryHistMovReserva.FieldByName('DATAINDICE').AsString,
        qryHistMovReserva.FieldByName('DATAMOV').AsString,
        qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
        StrToInt(sFlgEntrada),                    // 0 = saida
        1,
        DateToStr(dDataAlimentacao),
        qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOAORIGEM
        qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOADESTINO
        '', 0,                                                     // Paulo Nobre - WO6161
        qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger  // Paulo Nobre - WO6161
        );

      frmProgresso.EscondeFormProgresso;          // Paulo Nobre - WO6161

      //
      // Paulo Nobre - WO6161 - Inicio
      //
      // Selecionando todas as Contribuições da Pessoa 1
      //
      qryHistContribPrev.Close;
      qryHistContribPrev.Sql.Clear;
      qryHistContribPrev.Sql.Add('SELECT * FROM HSTCONTRIBPREV HCP');
      qryHistContribPrev.Sql.Add(' WHERE HCP.IDPESSOA = ' + qryChecaMatriculas.FieldByName('PESSOA1').AsString);
      qryHistContribPrev.Sql.Add('       AND HCP.IDPLANOPREV = ' + qryChecaMatriculas.FieldByName('PLANO').AsString);
      qryHistContribPrev.Sql.Add('       AND HCP.IDPESSJUR = ' + qryChecaMatriculas.FieldByName('IDPESSJUR').AsString);
      qryHistContribPrev.Sql.Add('       AND HCP.IDPESSOAORIGEM IS NULL '); // Paulo Nobre - WO6161
      qryHistContribPrev.Open;

      // Macete pra atualizar o recordcount da query, pois o mesmo não está atualizando de forma default - BUG
      qryHistContribPrev.Last;
      qryHistContribPrev.First;

      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, Transferindo Contribuições da Mat.: ' + lblMatricula1.Caption + ' para a Mat.: ' + lblMatricula2.Caption, True, False, True, 0, qryHistContribPrev.recordcount);
      Application.ProcessMessages;
      While Not qryHistContribPrev.Eof Do
      Begin
        //
        // Incluindo todo o movimento da Pessoa 1 como Pessoa 2 na tabela HSTCONTRIBPREV
        //
        iNumreceb := InsereHstContribPREV(qryAux,
          qryChecaMatriculas.FieldByName('PESSOA2').AsInteger,
          qryHistContribPrev.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistContribPrev.FieldByName('IDPESSJUR').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANOPREV').AsInteger,
          qryHistContribPrev.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistContribPrev.FieldByName('IDMOTIVO').AsInteger,
          qryHistContribPrev.FieldByName('MESREFERENCIA').AsString,
          qryHistContribPrev.FieldByName('MESCOBRANCA').AsString,
          qryHistContribPrev.FieldByName('CODPORTFORMA').AsInteger,
          qryHistContribPrev.FieldByName('DATAPREVISAORECE').AsString,
          qryHistContribPrev.FieldByName('DATARECEBIMENTO').AsString,
          qryHistContribPrev.FieldByName('VALORESPERADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORCALCULADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORRECEBIDO').AsFloat,
          qryHistContribPrev.FieldByName('IDREGRACALCULO').AsInteger,
          qryHistContribPrev.FieldByName('FLGDESCFOLHA').AsInteger,
          qryHistContribPrev.FieldByName('VALOROP1').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP2').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP3').AsFloat,
          qryHistContribPrev.FieldByName('DATAINICIO').AsString,
          qryHistContribPrev.FieldByName('DATAFINAL').AsString,
          qryHistContribPrev.FieldByName('FLGSITFUNDACAO').AsString,
          qryHistContribPrev.FieldByName('SITRECEBIMENTO').AsInteger,
          qryHistContribPrev.FieldByName('PARCELA').AsInteger,
          qryHistContribPrev.FieldByName('IDLOTE').AsInteger,
          char(qryHistContribPrev.FieldByName('TIPO').asString[1]),
          qryHistContribPrev.FieldByName('FLGCALCRESERVA').AsInteger,
          0,                                      // FLGDEVOLUCAO   ( 0 = Cobrança Normal / 1 = Devolução )
          qryHistContribPrev.FieldByName('FLGCONCESSAO').AsInteger,
          qryHistContribPrev.FieldByName('FLGEVENTO').AsInteger,
          qryHistContribPrev.FieldByName('FOLHAORIGEM').AsString,
          qryHistContribPrev.FieldByName('IDMOVBENEF').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANPREVCONTAB').AsString,
          qryChecaMatriculas.FieldByName('PESSOA1').AsInteger);                 // Paulo Nobre - WO6161

        // Compatibilizando os NumRecebimentos do Mov. da Reserva da Pessoa 2 (destino)
        // com os novos Historicos de contribuições transferidos da Pessoa 1 (origem)
        //
        qryAux2.Close;
        qryAux2.Sql.Clear;
        qryAux2.Sql.Add('UPDATE HISTMOVRESERVA SET NUMRECEBIMENTO = ' + inttostr(iNumreceb));
        qryAux2.Sql.Add('WHERE IDPLANOPREV = ' + qryHistContribPrev.FieldByName('IDPLANOPREV').AsString);
        qryAux2.Sql.Add('      AND IDPESSOA = ' + qryChecaMatriculas.FieldByName('PESSOA2').AsString);
        qryAux2.Sql.Add('      AND IDPESSJUR = ' + qryHistContribPrev.FieldByName('IDPESSJUR').AsString);
        qryAux2.Sql.Add('      AND SEQPROPOSTA = ' + qryHistContribPrev.FieldByName('SEQPROPOSTA').AsString);
        qryAux2.Sql.Add('      AND NUMRECEBIMENTO = ' + qryHistContribPrev.FieldByName('NUMRECEBIMENTO').AsString);
        qryAux2.ExecSql;

        //
        // Baixando todo o movimento (zerando o saldo) da Pessoa 1 na tabela HSTCONTRIBPREV
        //
        If qryHistContribPrev.FieldByName('FLGDEVOLUCAO').AsInteger = 1 Then // 1 = Devolução
          iFlgDev := 0                            // 0 = Cobrança Normal
        Else
          iFlgDev := 1;                           // 1 = Devolução

        InsereHstContribPREV(qryAux,
          qryChecaMatriculas.FieldByName('PESSOA1').AsInteger,
          qryHistContribPrev.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistContribPrev.FieldByName('IDPESSJUR').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANOPREV').AsInteger,
          qryHistContribPrev.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistContribPrev.FieldByName('IDMOTIVO').AsInteger,
          qryHistContribPrev.FieldByName('MESREFERENCIA').AsString,
          qryHistContribPrev.FieldByName('MESCOBRANCA').AsString,
          qryHistContribPrev.FieldByName('CODPORTFORMA').AsInteger,
          qryHistContribPrev.FieldByName('DATAPREVISAORECE').AsString,
          qryHistContribPrev.FieldByName('DATARECEBIMENTO').AsString,
          qryHistContribPrev.FieldByName('VALORESPERADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORCALCULADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORRECEBIDO').AsFloat,
          qryHistContribPrev.FieldByName('IDREGRACALCULO').AsInteger,
          qryHistContribPrev.FieldByName('FLGDESCFOLHA').AsInteger,
          qryHistContribPrev.FieldByName('VALOROP1').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP2').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP3').AsFloat,
          qryHistContribPrev.FieldByName('DATAINICIO').AsString,
          qryHistContribPrev.FieldByName('DATAFINAL').AsString,
          qryHistContribPrev.FieldByName('FLGSITFUNDACAO').AsString,
          qryHistContribPrev.FieldByName('SITRECEBIMENTO').AsInteger,
          qryHistContribPrev.FieldByName('PARCELA').AsInteger,
          qryHistContribPrev.FieldByName('IDLOTE').AsInteger,
          char(qryHistContribPrev.FieldByName('TIPO').asString[1]),
          qryHistContribPrev.FieldByName('FLGCALCRESERVA').AsInteger,
          iFlgDev,                                // FLGDEVOLUCAO   ( 0 = Cobrança Normal / 1 = Devolução )
          qryHistContribPrev.FieldByName('FLGCONCESSAO').AsInteger,
          qryHistContribPrev.FieldByName('FLGEVENTO').AsInteger,
          qryHistContribPrev.FieldByName('FOLHAORIGEM').AsString,
          qryHistContribPrev.FieldByName('IDMOVBENEF').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANPREVCONTAB').AsString,
          qryChecaMatriculas.FieldByName('PESSOA1').AsInteger);           // Paulo Nobre - WO6161

        qryHistContribPrev.Next;
        _AtualizaFrmProgresso(iContador);
      End;

      frmProgresso.EscondeFormProgresso;

      //
      // Paulo Nobre - WO6161 - Fim
    End
    Else If (sOrigem = 'De2Para1') Then           // Se movimentou da Matricula 2 para a Matricula 1
    Begin
      // Selecionando as reservas da Pessoa 2
      qryHistMovReserva.Close;
      qryHistMovReserva.Sql.Clear;
      qryHistMovReserva.Sql.Add('SELECT * FROM HISTMOVRESERVA HMR');
      qryHistMovReserva.Sql.Add('WHERE HMR.IDPESSOA = ' + qryChecaMatriculas.FieldByName('PESSOA2').AsString);
      qryHistMovReserva.Sql.Add('      AND HMR.IDPLANOPREV = ' + qryChecaMatriculas.FieldByName('PLANO').AsString);
      qryHistMovReserva.Sql.Add('      AND HMR.IDPESSJUR = ' + qryChecaMatriculas.FieldByName('IDPESSJUR').AsString);
      qryHistMovReserva.Sql.Add('      AND HMR.IDBENEFICIO IS NULL');
      qryHistMovReserva.Sql.Add('      AND (HMR.IDPESSOAORIGEM IS NULL AND HMR.IDPESSOADESTINO IS NULL) '); // Paulo Nobre - WO6161
      qryHistMovReserva.Sql.Add('ORDER BY HMR.IDTIPORESERVA, HMR.MESREFERENCIA');
      qryHistMovReserva.Open;

      sTipoReserva := '';
      fValorCotas := 0;

      // Paulo Nobre - WO6161 - Inicio
      // Macete pra atualizar o recordcount da query, pois o mesmo não está atualizando de forma default - BUG
      qryHistMovReserva.Last;
      qryHistMovReserva.First;

      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, Transferindo Reservas da Mat.: ' + lblMatricula2.Caption + ' para a Mat.: ' + lblMatricula1.Caption, True, False, True, 0, qryHistMovReserva.recordcount);
      Application.ProcessMessages;
      // Paulo Nobre - WO6161 - Fim

      While Not qryHistMovReserva.Eof Do
      Begin
        // Para cada tipo de reserva da pessoa selecionar o indice de reajuste deste tipo de reserva
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Add('SELECT IDTIPORESERVA, INDICEREAJUSTE');
        qryAux.Sql.Add('FROM RESERVAXPLANO');
        qryAux.Sql.Add('WHERE IDTIPORESERVA = ' + qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString);
        qryAux.Sql.Add('      AND IDPLANOPREV = ' + qryChecaMatriculas.FieldByName('PLANO').AsString);
        qryAux.Open;

        // Selecionando o maior valor da cota baseado na dataindice de 30 dias atrás
        dDataIndice := (dDataAlimentacao - 30);
        qryIndice.Close;
        qryIndice.Sql.Clear;
        qryIndice.Sql.Add('SELECT COTDATA, COTVALOR');
        qryIndice.Sql.Add('FROM COTACAOMOEDA');
        qryIndice.Sql.Add('WHERE MOECODIGO = ' + qryAux.FieldByName('INDICEREAJUSTE').AsString);
        qryIndice.Sql.Add('      AND COTDATA IN');
        qryIndice.Sql.Add('       (SELECT MAX(COTDATA)');
        qryIndice.Sql.Add('        FROM COTACAOMOEDA');
        qryIndice.Sql.Add('        WHERE MOECODIGO = ' + qryAux.FieldByName('INDICEREAJUSTE').AsString);
        qryIndice.Sql.Add('              AND COTDATA <= TO_DATE(''' + '01/' + Copy(DateToStr(dDataIndice), 4, 10) + ''', ''DD/MM/YYYY''))');
        qryIndice.Open;

        //GERAR A MOVIMENTAÇÃO NA HISTMOVRESREVA PARA A PESSOA 1
        GeraHistMovReservaContribuicao(qryAux,
          qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
          qryChecaMatriculas.FieldByName('PLANO').AsInteger,
          qryChecaMatriculas.FieldByName('PESSOA1').AsInteger,
          qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistMovReserva.FieldByName('IDTIPORESERVA').AsInteger,
          qryHistMovReserva.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
          qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
          0,
          qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat,
          qryHistMovReserva.FieldByName('VLRREAL').AsFloat,
          qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
          qryIndice.FieldByName('COTVALOR').AsFloat,
          qryIndice.FieldByName('COTDATA').AsString,
          qryHistMovReserva.FieldByName('DATAMOV').AsString,
          qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
          qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger,
          1,                                      // Alimentacao manual
          DateToStr(dDataAlimentacao),
          qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOAORIGEM
          qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOADESTINO
          '', 0,                                                    // Paulo Nobre - WO6161
          qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger // Paulo Nobre - WO6161
          );

        If ((sTipoReserva <> qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString) And (sTipoReserva <> '')) Then
        Begin
          //GERAR A MOVIMENTAÇÃO NA HISTMOVRESERV PARA ZERAR O SALDO DA MATRICULA ANTERIOR
          sFlgEntrada := '0';                     // 0 = saida
          GeraHistMovReservaContribuicao(qryAux,
            qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
            qryChecaMatriculas.FieldByName('PLANO').AsInteger,
            qryChecaMatriculas.FieldByName('PESSOA2').AsInteger,
            qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
            StrToInt(sTipoReserva),
            0,                                    // IDCONTRIBUICAO
            qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
            qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
            0,
            fValorCotas,
            fValorCotas * qryIndice.FieldByName('COTVALOR').AsFloat,
            qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
            qryHistMovReserva.FieldByName('VALORINDICE').AsFloat,
            qryHistMovReserva.FieldByName('DATAINDICE').AsString,
            qryHistMovReserva.FieldByName('DATAMOV').AsString,
            qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
            StrToInt(sFlgEntrada),                // 0 = saida
            1,                                    // Alimentacao manual
            DateToStr(dDataAlimentacao),
            qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOAORIGEM
            qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOADESTINO
            '', 0,                                                    // Paulo Nobre - WO6161
            qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger // Paulo Nobre - WO6161
            );

          fValorCotas := 0;
          sTipoReserva := qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString;
          If (qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger = 0) Then
          Begin
            fValorCotas := fValorCotas - qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End
          Else
          Begin
            fValorCotas := fValorCotas + qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End;

        End
        Else
        Begin
          sTipoReserva := qryHistMovReserva.FieldByName('IDTIPORESERVA').AsString;
          If (qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger = 0) Then
          Begin
            fValorCotas := fValorCotas - qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End
          Else
          Begin
            fValorCotas := fValorCotas + qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat;
          End;
        End;

        qryHistMovReserva.Next;
      End;

      //GERAR A MOVIMENTAÇÃO NA HISTMOVRESREVA PARA ZERAR O SALDO DA MATRICULA ANTERIOR - Ultima Reserva da Pessoa 2
      sFlgEntrada := '0';                         // 0 = saida
      GeraHistMovReservaContribuicao(qryAux,
        qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
        qryChecaMatriculas.FieldByName('PLANO').AsInteger,
        qryChecaMatriculas.FieldByName('PESSOA2').AsInteger,
        qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
        StrToInt(sTipoReserva),
        0,                                        //IDCONTRIBUICAO
        qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
        qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
        0,
        fValorCotas,
        fValorCotas * qryIndice.FieldByName('COTVALOR').AsFloat,
        qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
        qryHistMovReserva.FieldByName('VALORINDICE').AsFloat,
        qryHistMovReserva.FieldByName('DATAINDICE').AsString,
        qryHistMovReserva.FieldByName('DATAMOV').AsString,
        qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
        StrToInt(sFlgEntrada),                    // 0 = saida
        1,
        DateToStr(dDataAlimentacao),
        qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOAORIGEM
        qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOADESTINO
        '', 0,                                                    // Paulo Nobre - WO6161
        qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger // Paulo Nobre - WO6161
        );

      //
      // Paulo Nobre - WO6161 - Inicio
      //
      // Selecionando todas as Contribuições da Pessoa 2
      //
      qryHistContribPrev.Close;
      qryHistContribPrev.Sql.Clear;
      qryHistContribPrev.Sql.Add('SELECT * FROM HSTCONTRIBPREV HCP');
      qryHistContribPrev.Sql.Add(' WHERE HCP.IDPESSOA = ' + qryChecaMatriculas.FieldByName('PESSOA2').AsString);
      qryHistContribPrev.Sql.Add('       AND HCP.IDPLANOPREV = ' + qryChecaMatriculas.FieldByName('PLANO').AsString);
      qryHistContribPrev.Sql.Add('       AND HCP.IDPESSJUR = ' + qryChecaMatriculas.FieldByName('IDPESSJUR').AsString);
      qryHistContribPrev.Sql.Add('       AND HCP.IDPESSOAORIGEM IS NULL '); // Paulo Nobre - WO6161
      qryHistContribPrev.Open;

      // Macete pra atualizar o recordcount da query, pois o mesmo não está atualizando de forma default - BUG
      qryHistContribPrev.Last;
      qryHistContribPrev.First;

      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, Transferindo Contribuições da Mat.: ' + lblMatricula2.Caption + ' para a Mat.: ' + lblMatricula1.Caption, True, False, True, 0, qryHistContribPrev.recordcount);
      Application.ProcessMessages;
      While Not qryHistContribPrev.Eof Do
      Begin
        //
        // Incluindo todo o movimento da Pessoa 2 como Pessoa 1 na tabela HSTCONTRIBPREV
        //
        iNumreceb := InsereHstContribPREV(qryAux,
          qryChecaMatriculas.FieldByName('PESSOA1').AsInteger,
          qryHistContribPrev.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistContribPrev.FieldByName('IDPESSJUR').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANOPREV').AsInteger,
          qryHistContribPrev.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistContribPrev.FieldByName('IDMOTIVO').AsInteger,
          qryHistContribPrev.FieldByName('MESREFERENCIA').AsString,
          qryHistContribPrev.FieldByName('MESCOBRANCA').AsString,
          qryHistContribPrev.FieldByName('CODPORTFORMA').AsInteger,
          qryHistContribPrev.FieldByName('DATAPREVISAORECE').AsString,
          qryHistContribPrev.FieldByName('DATARECEBIMENTO').AsString,
          qryHistContribPrev.FieldByName('VALORESPERADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORCALCULADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORRECEBIDO').AsFloat,
          qryHistContribPrev.FieldByName('IDREGRACALCULO').AsInteger,
          qryHistContribPrev.FieldByName('FLGDESCFOLHA').AsInteger,
          qryHistContribPrev.FieldByName('VALOROP1').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP2').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP3').AsFloat,
          qryHistContribPrev.FieldByName('DATAINICIO').AsString,
          qryHistContribPrev.FieldByName('DATAFINAL').AsString,
          qryHistContribPrev.FieldByName('FLGSITFUNDACAO').AsString,
          qryHistContribPrev.FieldByName('SITRECEBIMENTO').AsInteger,
          qryHistContribPrev.FieldByName('PARCELA').AsInteger,
          qryHistContribPrev.FieldByName('IDLOTE').AsInteger,
          char(qryHistContribPrev.FieldByName('TIPO').asString[1]),
          qryHistContribPrev.FieldByName('FLGCALCRESERVA').AsInteger,
          0,                                      // FLGDEVOLUCAO   ( 0 = Cobrança Normal / 1 = Devolução )
          qryHistContribPrev.FieldByName('FLGCONCESSAO').AsInteger,
          qryHistContribPrev.FieldByName('FLGEVENTO').AsInteger,
          qryHistContribPrev.FieldByName('FOLHAORIGEM').AsString,
          qryHistContribPrev.FieldByName('IDMOVBENEF').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANPREVCONTAB').AsString,
          qryChecaMatriculas.FieldByName('PESSOA2').AsInteger);         // Paulo Nobre - WO6161

        // Compatibilizando os NumRecebimentos do Mov. da Reserva da Pessoa 1 (destino)
        // com os novos Historicos de contrinuições transferidos da Pessoa 2 (origem)
        qryAux2.Close;
        qryAux2.Sql.Clear;
        qryAux2.Sql.Add('UPDATE HISTMOVRESERVA SET NUMRECEBIMENTO = ' + inttostr(iNumreceb));
        qryAux2.Sql.Add('WHERE IDPLANOPREV = ' + qryHistContribPrev.FieldByName('IDPLANOPREV').AsString);
        qryAux2.Sql.Add('      AND IDPESSOA = ' + qryChecaMatriculas.FieldByName('PESSOA1').AsString);
        qryAux2.Sql.Add('      AND IDPESSJUR = ' + qryHistContribPrev.FieldByName('IDPESSJUR').AsString);
        qryAux2.Sql.Add('      AND SEQPROPOSTA = ' + qryHistContribPrev.FieldByName('SEQPROPOSTA').AsString);
        qryAux2.Sql.Add('      AND NUMRECEBIMENTO = ' + qryHistContribPrev.FieldByName('NUMRECEBIMENTO').AsString);
        qryAux2.ExecSql;

        //
        // Baixando todo o movimento (zerando o saldo) da Pessoa 2 na tabela HSTCONTRIBPREV
        //
        If qryHistContribPrev.FieldByName('FLGDEVOLUCAO').AsInteger = 1 Then // 1 = Devolução
          iFlgDev := 0                            // 0 = Cobrança Normal
        Else
          iFlgDev := 1;                           // 1 = Devolução

        InsereHstContribPREV(qryAux,
          qryChecaMatriculas.FieldByName('PESSOA2').AsInteger,
          qryHistContribPrev.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistContribPrev.FieldByName('IDPESSJUR').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANOPREV').AsInteger,
          qryHistContribPrev.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistContribPrev.FieldByName('IDMOTIVO').AsInteger,
          qryHistContribPrev.FieldByName('MESREFERENCIA').AsString,
          qryHistContribPrev.FieldByName('MESCOBRANCA').AsString,
          qryHistContribPrev.FieldByName('CODPORTFORMA').AsInteger,
          qryHistContribPrev.FieldByName('DATAPREVISAORECE').AsString,
          qryHistContribPrev.FieldByName('DATARECEBIMENTO').AsString,
          qryHistContribPrev.FieldByName('VALORESPERADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORCALCULADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORRECEBIDO').AsFloat,
          qryHistContribPrev.FieldByName('IDREGRACALCULO').AsInteger,
          qryHistContribPrev.FieldByName('FLGDESCFOLHA').AsInteger,
          qryHistContribPrev.FieldByName('VALOROP1').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP2').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP3').AsFloat,
          qryHistContribPrev.FieldByName('DATAINICIO').AsString,
          qryHistContribPrev.FieldByName('DATAFINAL').AsString,
          qryHistContribPrev.FieldByName('FLGSITFUNDACAO').AsString,
          qryHistContribPrev.FieldByName('SITRECEBIMENTO').AsInteger,
          qryHistContribPrev.FieldByName('PARCELA').AsInteger,
          qryHistContribPrev.FieldByName('IDLOTE').AsInteger,
          char(qryHistContribPrev.FieldByName('TIPO').asString[1]),
          qryHistContribPrev.FieldByName('FLGCALCRESERVA').AsInteger,
          iFlgDev,                                // FLGDEVOLUCAO   ( 0 = Cobrança Normal / 1 = Devolução )
          qryHistContribPrev.FieldByName('FLGCONCESSAO').AsInteger,
          qryHistContribPrev.FieldByName('FLGEVENTO').AsInteger,
          qryHistContribPrev.FieldByName('FOLHAORIGEM').AsString,
          qryHistContribPrev.FieldByName('IDMOVBENEF').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANPREVCONTAB').AsString,
          qryChecaMatriculas.FieldByName('PESSOA2').AsInteger);      // Paulo Nobre - WO6161

        qryHistContribPrev.Next;
        _AtualizaFrmProgresso(iContador);
      End;

      frmProgresso.EscondeFormProgresso;

      //
      // Paulo Nobre - WO6161 - Fim

    End;
    qryMatricula1.EnableControls;
    qryMatricula2.EnableControls;

    qryMatricula1.Cancel;
    qryMatricula1.Close;

    qryMatricula2.Cancel;
    qryMatricula2.Close;

    If (MsgDlg('Deseja gravar as alterações efetuadas pela transferência?',
      'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
    Begin
      MsgDlg('Transferência gerada com sucesso.', 'Informação', mtInformation, [mbOk], 0);

      AtualizaReservaPart(qryChecaMatriculas.FieldByName('PESSOA2').AsInteger,
        qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
        qryChecaMatriculas.FieldByName('PLANO').AsInteger);

      AtualizaReservaPart(qryChecaMatriculas.FieldByName('PESSOA1').AsInteger,
        qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
        qryChecaMatriculas.FieldByName('PLANO').AsInteger);

      If (dtmBaseDados.dbBaseDados.InTransaction) Then
      Begin
        dtmBaseDados.dbBaseDados.Commit;
      End;

      CarregaReservaMatriculas(qryChecaMatriculas);
      CarregaDesfazer(qryChecaMatriculas);

      lblMatricula1.Caption := 'Matricula: ' + qryChecaMatriculas.FieldByName('MATRICULA1').AsString;
      lblMatricula2.Caption := 'Matricula: ' + qryChecaMatriculas.FieldByName('MATRICULA2').AsString;

      Processou := True;                          // Michelle Mota - SOL:265071 - PPM:1163508
      AtualizaSaldo();

    End
    Else
    Begin
      MsgDlg('Transferência cancelada.', 'Informação', mtInformation, [mbOk], 0);
      If (dtmBaseDados.dbBaseDados.InTransaction) Then
        dtmBaseDados.dbBaseDados.Rollback;
    End;
  Finally
    If (dtmBaseDados.dbBaseDados.InTransaction) Then
    Begin
      dtmBaseDados.dbBaseDados.Rollback;
      frmProgresso.EscondeFormProgresso;          // Paulo Nobre - WO6161
    End;
  End;
End;

Procedure TfrmTransferenciaSaldoCota.AtualizaSaldo();
Var
  TotalSaldo, TotSdoResCtrl: Extended;
  sTipoReserva: String;
  fValorCotasAnt: Extended;

  Function ZeraSaldo(saldo: Integer): String;
  Begin
    If (saldo = 1) Then
      result := 'Saldo de Res. do Participante: R$ ' + FormatFloat('#,##0.00', 0)
    Else
      result := 'Saldo de Res. de Controle: R$ ' + FormatFloat('#,##0.00', 0);
  End;

Begin
  //MATRICULA 1
  TotalSaldo := 0;
  TotSdoResCtrl := 0;
  lblSaldosReserva1.Caption := 'Saldo de Res. do Participante: R$ ';
  LblSaldoResControle1.Caption := 'Saldo de Res. de Controle: R$ ';
  qryMatricula1.DisableControls;
  qryMatricula1.First;

  sTipoReserva := '';
  While Not qryMatricula1.EOF Do
  Begin
    //ATUALIZAR SALDOS E COTAS
    If (sTipoReserva <> qryMatricula1.FieldByName('IDTIPORESERVA').AsString) Then
    Begin
      //PRIMEIRA RESERVA DESTE TIPO DE RESERVA
      fValorCotasAnt := 0;

      qryMatricula1.Edit;
      qryMatricula1.FieldByName('VALORREAL').AsFloat := qryMatricula1.FieldByName('VALORCOTAS').AsFloat *
        qryMatricula1.FieldByName('VALORINDICE').AsFloat;
      qryMatricula1.FieldByName('SALDOCOTAS').AsFloat := qryMatricula1.FieldByName('VALORCOTAS').AsFloat;
      qryMatricula1.FieldByName('SALDOREAL').AsFloat := qryMatricula1.FieldByName('VALORCOTAS').AsFloat *
        qryMatricula1.FieldByName('VALORINDICE').AsFloat;
      qryMatricula1.Post;
    End
    Else
    Begin
      //DEMAIS RESERVAS
      qryMatricula1.Edit;
      qryMatricula1.FieldByName('VALORREAL').AsFloat := qryMatricula1.FieldByName('VALORCOTAS').AsFloat *
        qryMatricula1.FieldByName('VALORINDICE').AsFloat;
      If (qryMatricula1.FieldByName('ES').AsString = 'S') Then
      Begin
        qryMatricula1.FieldByName('SALDOCOTAS').AsFloat := fValorCotasAnt - qryMatricula1.FieldByName('VALORCOTAS').AsFloat;
      End
      Else
      Begin
        qryMatricula1.FieldByName('SALDOCOTAS').AsFloat := fValorCotasAnt + qryMatricula1.FieldByName('VALORCOTAS').AsFloat;
      End;
      qryMatricula1.FieldByName('SALDOREAL').AsFloat := qryMatricula1.FieldByName('SALDOCOTAS').AsFloat *
        qryMatricula1.FieldByName('VALORINDICE').AsFloat;
      qryMatricula1.Post;
    End;
    fValorCotasAnt := fValorCotasAnt + qryMatricula1.FieldByName('VALORCOTAS').AsFloat;
    sTipoReserva := qryMatricula1.FieldByName('IDTIPORESERVA').AsString;

    If (qryMatricula1.FieldByName('FLGCOLETIVA').asInteger = 0) Or (qryMatricula1.FieldByName('FLGCOLETIVA').isnull) Then
    Begin
      If qryMatricula1.FieldByName('FLGCONTROLE').asInteger = 0 Then
      Begin
        If qryMatricula1.FieldByName('ES').AsString = 'S' Then
        Begin
          TotalSaldo := TotalSaldo - qryMatricula1.FieldByName('VALORCOTAS').asFloat * qryMatricula1.FieldByName('COTVALOR').asFloat;
        End
        Else
        Begin
          TotalSaldo := TotalSaldo + qryMatricula1.FieldByName('VALORCOTAS').asFloat * qryMatricula1.FieldByName('COTVALOR').asFloat;
        End;
      End
      Else
      Begin
        If (qryMatricula1.FieldByName('FLGTITULARCOLET').asString = 'T') Then
        Begin
          If qryMatricula1.FieldByName('ES').AsString = 'S' Then
          Begin
            TotSdoResCtrl := TotSdoResCtrl - qryMatricula1.FieldByName('VALORCOTAS').asFloat * qryMatricula1.FieldByName('COTVALOR').asFloat;
          End
          Else
          Begin
            TotSdoResCtrl := TotSdoResCtrl + qryMatricula1.FieldByName('VALORCOTAS').asFloat * qryMatricula1.FieldByName('COTVALOR').asFloat;
          End;
        End;
      End;
    End;

    qryMatricula1.Next;
  End;

  qryMatricula1.First;
  qryMatricula1.EnableControls;
  lblSaldosReserva1.Caption := lblSaldosReserva1.Caption + FormatFloat('#,##0.00', TotalSaldo);
  LblSaldoResControle1.Caption := LblSaldoResControle1.Caption + FormatFloat('#,##0.00', TotSdoResCtrl);
  // Início - Michelle Mota - SOL:265071 - PPM:1163508
  If (FormatFloat('#,##0.00', TotalSaldo) = '0,00') And (Processou) Then
  Begin
    //qryMatricula1.Close; //Taffarel - SIG103759
    CarregaReservaMatriculas(Nil, 1);             //Taffarel - SIG103759
    TotSdoResCtrl := 0;
    //LblSaldoResControle1.Caption := LblSaldoResControle1.Caption + FormatFloat('#,##0.00', TotSdoResCtrl);
    LblSaldoResControle1.Caption := ZeraSaldo(2); //Taffarel - SIG103759
  End;
  // Término - Michelle Mota - SOL:265071 - PPM:1163508
  //MATRICULA 2

  TotalSaldo := 0;
  TotSdoResCtrl := 0;
  lblSaldosReserva2.Caption := 'Saldo de Res. do Participante: R$ ';
  LblSaldoResControle2.Caption := 'Saldo de Res. de Controle: R$ ';
  qryMatricula2.DisableControls;
  qryMatricula2.First;

  sTipoReserva := '';
  While Not qryMatricula2.EOF Do
  Begin
    //ATUALIZAR SALDOS E COTAS
    If (sTipoReserva <> qryMatricula2.FieldByName('IDTIPORESERVA').AsString) Then
    Begin
      //PRIMEIRA RESERVA DESTE TIPO DE RESERVA
      fValorCotasAnt := 0;

      qryMatricula2.Edit;
      qryMatricula2.FieldByName('VALORREAL').AsFloat := qryMatricula2.FieldByName('VALORCOTAS').AsFloat *
        qryMatricula2.FieldByName('VALORINDICE').AsFloat;
      qryMatricula2.FieldByName('SALDOCOTAS').AsFloat := qryMatricula2.FieldByName('VALORCOTAS').AsFloat;
      qryMatricula2.FieldByName('SALDOREAL').AsFloat := qryMatricula2.FieldByName('VALORCOTAS').AsFloat *
        qryMatricula2.FieldByName('VALORINDICE').AsFloat;
      qryMatricula2.Post;
    End
    Else
    Begin
      //DEMAIS RESERVAS
      qryMatricula2.Edit;
      qryMatricula2.FieldByName('VALORREAL').AsFloat := qryMatricula2.FieldByName('VALORCOTAS').AsFloat *
        qryMatricula2.FieldByName('VALORINDICE').AsFloat;
      If (qryMatricula2.FieldByName('ES').AsString = 'S') Then
      Begin
        qryMatricula2.FieldByName('SALDOCOTAS').AsFloat := fValorCotasAnt - qryMatricula2.FieldByName('VALORCOTAS').AsFloat;
      End
      Else
      Begin
        qryMatricula2.FieldByName('SALDOCOTAS').AsFloat := fValorCotasAnt + qryMatricula2.FieldByName('VALORCOTAS').AsFloat;
      End;
      qryMatricula2.FieldByName('SALDOREAL').AsFloat := qryMatricula2.FieldByName('SALDOCOTAS').AsFloat *
        qryMatricula2.FieldByName('VALORINDICE').AsFloat;
      qryMatricula2.Post;
    End;
    fValorCotasAnt := fValorCotasAnt + qryMatricula2.FieldByName('VALORCOTAS').AsFloat;
    sTipoReserva := qryMatricula2.FieldByName('IDTIPORESERVA').AsString;

    If (qryMatricula2.FieldByName('FLGCOLETIVA').asInteger = 0) Or (qryMatricula2.FieldByName('FLGCOLETIVA').isnull) Then
    Begin
      If qryMatricula2.FieldByName('FLGCONTROLE').asInteger = 0 Then
      Begin
        If (qryMatricula2.FieldByName('ES').AsString = 'S') Then
        Begin
          TotalSaldo := TotalSaldo - qryMatricula2.FieldByName('VALORCOTAS').asFloat * qryMatricula2.FieldByName('COTVALOR').asFloat;
        End
        Else
        Begin
          TotalSaldo := TotalSaldo + qryMatricula2.FieldByName('VALORCOTAS').asFloat * qryMatricula2.FieldByName('COTVALOR').asFloat;
        End;
      End
      Else
      Begin
        If (qryMatricula2.FieldByName('FLGTITULARCOLET').asString = 'T') Then
        Begin
          If (qryMatricula2.FieldByName('ES').AsString = 'S') Then
          Begin
            TotSdoResCtrl := TotSdoResCtrl - qryMatricula2.FieldByName('VALORCOTAS').asFloat * qryMatricula2.FieldByName('COTVALOR').asFloat;
          End
          Else
          Begin
            TotSdoResCtrl := TotSdoResCtrl + qryMatricula2.FieldByName('VALORCOTAS').asFloat * qryMatricula2.FieldByName('COTVALOR').asFloat;
          End;
        End;
      End;
    End;

    qryMatricula2.Next;
  End;

  qryMatricula2.First;
  qryMatricula2.EnableControls;
  lblSaldosReserva2.Caption := lblSaldosReserva2.Caption + FormatFloat('#,##0.00', TotalSaldo);
  LblSaldoResControle2.Caption := LblSaldoResControle2.Caption + FormatFloat('#,##0.00', TotSdoResCtrl);
  // Início - Michelle Mota - SOL:265071 - PPM:1163508
  If (FormatFloat('#,##0.00', TotalSaldo) = '0,00') And (Processou) Then
  Begin
    //qryMatricula2.Close; //Taffarel - SIG103759
    CarregaReservaMatriculas(Nil, 2);             //Taffarel - SIG103759
    TotSdoResCtrl := 0;
    //LblSaldoResControle2.Caption := LblSaldoResControle2.Caption + FormatFloat('#,##0.00', TotSdoResCtrl);
    LblSaldoResControle2.Caption := ZeraSaldo(2); //Taffarel - SIG103759
  End;
  // Término - Michelle Mota - SOL:265071 - PPM:1163508

End;

Procedure TfrmTransferenciaSaldoCota.BitBtn1Click(Sender: TObject);
Var
  sFlgEntrada: String;
  iContador, iFlgDev: Integer;                             // Paulo Nobre - WO6161
Begin
  Inherited;

  If (qryDesfazer.RecordCount > 0) Then
  Begin
    Try
      If Not (dtmBaseDados.dbBaseDados.InTransaction) Then
      Begin
        dtmBaseDados.dbBaseDados.StartTransaction();
      End;

      qryDesfazer.First;

      qryHistMovReserva.Close;
      qryHistMovReserva.Sql.Clear;
      qryHistMovReserva.Sql.Add('SELECT * FROM HISTMOVRESERVA HMR');
      qryHistMovReserva.Sql.Add('WHERE HMR.IDPESSOA = ' + qryDesfazer.FieldByName('IDPESSOAORIGEM').AsString);
      qryHistMovReserva.Sql.Add('      AND HMR.IDPESSOAORIGEM IS NOT NULL');
      qryHistMovReserva.Sql.Add('ORDER BY HMR.IDTIPORESERVA, HMR.MESREFERENCIA');
      qryHistMovReserva.Open;

      // Paulo Nobre - WO6161 - Inicio
      // Macete pra atualizar o recordcount da query, pois o mesmo não está atualizando de forma default - BUG
      qryHistMovReserva.Last;
      qryHistMovReserva.First;

      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, Desfazendo Reservas Transferidas da Pessoa: ' + qryDesfazer.FieldByName('IDPESSOAORIGEM').AsString, True, False, True, 0, qryHistMovReserva.recordcount);
      Application.ProcessMessages;
      // Paulo Nobre - WO6161 - Fim

      While Not qryHistMovReserva.Eof Do
      Begin
        If (qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger = 0) Then // Saida
          sFlgEntrada := '1'                      // Entrada
        Else
          sFlgEntrada := '0';                     // Saida

        //LANÇAMENTO NA MATRICULA ORIGEM PARA ANULAR O ESTORNO
        GeraHistMovReservaContribuicao(qryAux,
          qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
          qryChecaMatriculas.FieldByName('PLANO').AsInteger,
          qryDesfazer.FieldByName('IDPESSOAORIGEM').AsInteger,
          qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistMovReserva.FieldByName('IDTIPORESERVA').AsInteger,
          qryHistMovReserva.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
          qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
          0,
          qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat,
          qryHistMovReserva.FieldByName('VLRREAL').AsFloat,
          qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
          qryHistMovReserva.FieldByName('VALORINDICE').AsFloat,
          qryHistMovReserva.FieldByName('DATAINDICE').AsString,
          qryHistMovReserva.FieldByName('DATAMOV').AsString,
          qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
          StrToInt(sFlgEntrada),
          1,
          qryHistMovReserva.FieldByName('DATAALIMENTACAO').AsString,
          qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOAORIGEM
          qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOADESTINO
          '', 0,                                                    // Paulo Nobre - WO6161
          qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger // Paulo Nobre - WO6161
          );

        //LANÇAMENTO NA MATRICULA DESTINO PARA ANULAR A IDA
        GeraHistMovReservaContribuicao(qryAux,
          qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
          qryChecaMatriculas.FieldByName('PLANO').AsInteger,
          qryDesfazer.FieldByName('IDPESSOADESTINO').AsInteger,
          qryHistMovReserva.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistMovReserva.FieldByName('IDTIPORESERVA').AsInteger,
          qryHistMovReserva.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistMovReserva.FieldByName('IDEVENTOGERADOR').AsInteger,
          qryHistMovReserva.FieldByName('IDREGRACALCULO').AsInteger,
          0,
          qryHistMovReserva.FieldByName('VLRCOTAS').AsFloat,
          qryHistMovReserva.FieldByName('VLRREAL').AsFloat,
          qryHistMovReserva.FieldByName('SALDOREAL').AsFloat,
          qryHistMovReserva.FieldByName('VALORINDICE').AsFloat,
          qryHistMovReserva.FieldByName('DATAINDICE').AsString,
          qryHistMovReserva.FieldByName('DATAMOV').AsString,
          qryHistMovReserva.FieldByName('MESREFERENCIA').AsString,
          qryHistMovReserva.FieldByName('FLGENTRADA').AsInteger,
          1,
          qryHistMovReserva.FieldByName('DATAALIMENTACAO').AsString,
          qryChecaMatriculas.FieldByName('PESSOA1').AsString, //IDPESSOAORIGEM
          qryChecaMatriculas.FieldByName('PESSOA2').AsString, //IDPESSOADESTINO
          '', 0,                                                    // Paulo Nobre - WO6161
          qryHistMovReserva.FieldByName('NUMRECEBIMENTO').AsInteger // Paulo Nobre - WO6161
          );

        qryHistMovReserva.Next;
        _AtualizaFrmProgresso(iContador);         // Paulo Nobre - WO6161
      End;

      // Paulo Nobre - WO6161 - Inicio

      frmProgresso.EscondeFormProgresso;

      {    qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add('UPDATE HISTMOVRESERVA SET IDPESSOAORIGEM = NULL, IDPESSOADESTINO = NULL');
          qryAux.Sql.Add(' WHERE IDPESSOA = ' + qryDesfazer.FieldByName('IDPESSOAORIGEM').AsString);
          qryAux.Sql.Add('   AND IDPESSOAORIGEM IS NOT NULL');
          qryAux.ExecSql;

          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add('UPDATE HISTMOVRESERVA SET IDPESSOAORIGEM = NULL, IDPESSOADESTINO = NULL');
          qryAux.Sql.Add(' WHERE IDPESSOA = ' + qryDesfazer.FieldByName('IDPESSOADESTINO').AsString);
          qryAux.Sql.Add('   AND IDPESSOADESTINO IS NOT NULL');
          qryAux.ExecSql;     }

      //
      // Selecionando todas as Contribuições da Pessoa 2 oriundos da Pessoa 1
      //
      qryHistContribPrev.Close;
      qryHistContribPrev.Sql.Clear;
      qryHistContribPrev.Sql.Add('SELECT * FROM HSTCONTRIBPREV HCP');
      qryHistContribPrev.Sql.Add(' WHERE HCP.IDPESSOA = ' + qryDesfazer.FieldByName('IDPESSOADESTINO').AsString);
      qryHistContribPrev.Sql.Add('       AND HCP.IDPESSOAORIGEM = ' + qryDesfazer.FieldByName('IDPESSOAORIGEM').AsString);
      qryHistContribPrev.Open;

      // Macete pra atualizar o recordcount da query, pois o mesmo não está atualizando de forma default - BUG
      qryHistContribPrev.Last;
      qryHistContribPrev.First;

      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, Desfazendo Contribuições Transferidas da Pessoa: ' + qryDesfazer.FieldByName('IDPESSOAORIGEM').AsString, True, False, True, 0, qryHistContribPrev.recordcount);
      Application.ProcessMessages;
      While Not qryHistContribPrev.Eof Do
      Begin
        //
        // Desfazendo todo o movimento da Pessoa 2 oriundos da Pessoa 1 na tabela HSTCONTRIBPREV
        //
        InsereHstContribPREV(qryAux,
          qryDesfazer.FieldByName('IDPESSOADESTINO').AsInteger,
          qryHistContribPrev.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistContribPrev.FieldByName('IDPESSJUR').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANOPREV').AsInteger,
          qryHistContribPrev.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistContribPrev.FieldByName('IDMOTIVO').AsInteger,
          qryHistContribPrev.FieldByName('MESREFERENCIA').AsString,
          qryHistContribPrev.FieldByName('MESCOBRANCA').AsString,
          qryHistContribPrev.FieldByName('CODPORTFORMA').AsInteger,
          qryHistContribPrev.FieldByName('DATAPREVISAORECE').AsString,
          qryHistContribPrev.FieldByName('DATARECEBIMENTO').AsString,
          qryHistContribPrev.FieldByName('VALORESPERADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORCALCULADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORRECEBIDO').AsFloat,
          qryHistContribPrev.FieldByName('IDREGRACALCULO').AsInteger,
          qryHistContribPrev.FieldByName('FLGDESCFOLHA').AsInteger,
          qryHistContribPrev.FieldByName('VALOROP1').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP2').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP3').AsFloat,
          qryHistContribPrev.FieldByName('DATAINICIO').AsString,
          qryHistContribPrev.FieldByName('DATAFINAL').AsString,
          qryHistContribPrev.FieldByName('FLGSITFUNDACAO').AsString,
          qryHistContribPrev.FieldByName('SITRECEBIMENTO').AsInteger,
          qryHistContribPrev.FieldByName('PARCELA').AsInteger,
          qryHistContribPrev.FieldByName('IDLOTE').AsInteger,
          char(qryHistContribPrev.FieldByName('TIPO').asString[1]),
          qryHistContribPrev.FieldByName('FLGCALCRESERVA').AsInteger,
          1,                                      // FLGDEVOLUCAO   ( 0 = Cobrança Normal / 1 = Devolução )
          qryHistContribPrev.FieldByName('FLGCONCESSAO').AsInteger,
          qryHistContribPrev.FieldByName('FLGEVENTO').AsInteger,
          qryHistContribPrev.FieldByName('FOLHAORIGEM').AsString,
          qryHistContribPrev.FieldByName('IDMOVBENEF').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANPREVCONTAB').AsString,
          qryDesfazer.FieldByName('IDPESSOAORIGEM').AsInteger);         // Paulo Nobre - WO6161

        //
        // Desfazendo todo o movimento da Pessoa 1 (de origem) na tabela HSTCONTRIBPREV
        //
        If qryHistContribPrev.FieldByName('FLGDEVOLUCAO').AsInteger = 0 Then // 0 = Cobrança Normal
          iFlgDev := 1                            // 1 = Devolução
        Else
          iFlgDev := 0;

        InsereHstContribPREV(qryAux,
          qryDesfazer.FieldByName('IDPESSOAORIGEM').AsInteger,
          qryHistContribPrev.FieldByName('SEQPROPOSTA').AsInteger,
          qryHistContribPrev.FieldByName('IDPESSJUR').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANOPREV').AsInteger,
          qryHistContribPrev.FieldByName('IDCONTRIBUICAO').AsInteger,
          qryHistContribPrev.FieldByName('IDMOTIVO').AsInteger,
          qryHistContribPrev.FieldByName('MESREFERENCIA').AsString,
          qryHistContribPrev.FieldByName('MESCOBRANCA').AsString,
          qryHistContribPrev.FieldByName('CODPORTFORMA').AsInteger,
          qryHistContribPrev.FieldByName('DATAPREVISAORECE').AsString,
          qryHistContribPrev.FieldByName('DATARECEBIMENTO').AsString,
          qryHistContribPrev.FieldByName('VALORESPERADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORCALCULADO').AsFloat,
          qryHistContribPrev.FieldByName('VALORRECEBIDO').AsFloat,
          qryHistContribPrev.FieldByName('IDREGRACALCULO').AsInteger,
          qryHistContribPrev.FieldByName('FLGDESCFOLHA').AsInteger,
          qryHistContribPrev.FieldByName('VALOROP1').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP2').AsFloat,
          qryHistContribPrev.FieldByName('VALOROP3').AsFloat,
          qryHistContribPrev.FieldByName('DATAINICIO').AsString,
          qryHistContribPrev.FieldByName('DATAFINAL').AsString,
          qryHistContribPrev.FieldByName('FLGSITFUNDACAO').AsString,
          qryHistContribPrev.FieldByName('SITRECEBIMENTO').AsInteger,
          qryHistContribPrev.FieldByName('PARCELA').AsInteger,
          qryHistContribPrev.FieldByName('IDLOTE').AsInteger,
          char(qryHistContribPrev.FieldByName('TIPO').asString[1]),
          qryHistContribPrev.FieldByName('FLGCALCRESERVA').AsInteger,
          iFlgDev,                                // FLGDEVOLUCAO   ( 0 = Cobrança Normal / 1 = Devolução )
          qryHistContribPrev.FieldByName('FLGCONCESSAO').AsInteger,
          qryHistContribPrev.FieldByName('FLGEVENTO').AsInteger,
          qryHistContribPrev.FieldByName('FOLHAORIGEM').AsString,
          qryHistContribPrev.FieldByName('IDMOVBENEF').AsInteger,
          qryHistContribPrev.FieldByName('IDPLANPREVCONTAB').AsString,
          qryDesfazer.FieldByName('IDPESSOAORIGEM').AsInteger);         // Paulo Nobre - WO6161

        qryHistContribPrev.Next;
        _AtualizaFrmProgresso(iContador);
      End;

      frmProgresso.EscondeFormProgresso;

      // Paulo Nobre - WO6161 - Fim

      If (MsgDlg('Deseja gravar as alterações efetuadas pelo desfazer transferência?',
        'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
        MsgDlg('Transferência desfeita com sucesso.', 'Informação', mtInformation, [mbOk], 0);

        AtualizaReservaPart(qryChecaMatriculas.FieldByName('PESSOA2').AsInteger,
          qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
          qryChecaMatriculas.FieldByName('PLANO').AsInteger);

        AtualizaReservaPart(qryChecaMatriculas.FieldByName('PESSOA1').AsInteger,
          qryChecaMatriculas.FieldByName('IDPESSJUR').AsInteger,
          qryChecaMatriculas.FieldByName('PLANO').AsInteger);

        If (dtmBaseDados.dbBaseDados.InTransaction) Then
        Begin
          dtmBaseDados.dbBaseDados.Commit;
        End;

        CarregaReservaMatriculas(qryChecaMatriculas);
        CarregaDesfazer(qryChecaMatriculas);

        lblMatricula1.Caption := 'Matricula: ' + qryChecaMatriculas.FieldByName('MATRICULA1').AsString;
        lblMatricula2.Caption := 'Matricula: ' + qryChecaMatriculas.FieldByName('MATRICULA2').AsString;

        AtualizaSaldo();
      End
      Else
      Begin
        MsgDlg('Desfazer transferência cancelada.', 'Informação', mtInformation, [mbOk], 0);
        If (dtmBaseDados.dbBaseDados.InTransaction) Then
        Begin
          dtmBaseDados.dbBaseDados.Rollback;
        End;
      End;
    Finally
      If (dtmBaseDados.dbBaseDados.InTransaction) Then
      Begin
        dtmBaseDados.dbBaseDados.Rollback;
      End;
    End;
  End
  Else
  Begin
    MsgDlg('Não existem registros para desfazer a transferência.', 'Informação', mtInformation, [mbOk], 0);
  End;
End;

Function TfrmTransferenciaSaldoCota.BuscaDataAlimentacao(): TDatetime;
Begin
  Result := -1;

  MsgDlg('Informar a data para a alimentação. ', 'Informação', mtInformation, [mbOk], 0);

  Try
    AbrirFormModal(frmSolicitaDataAlimentacao, TfrmSolicitaDataAlimentacao);
  Except
  End;
  Result := frmSolicitaDataAlimentacao.DataAlimentacao;
  frmSolicitaDataAlimentacao.Close;
End;

Procedure TfrmTransferenciaSaldoCota.AtualizaReservaPart(pIdPessoa, pIdPessJur, pIdPlanoPrev: Integer);
Var
  SP_PROC: TStoredProc;
Begin
  Try
    SP_PROC := TStoredProc.Create(Application);
    SP_PROC.DatabaseName := 'BaseDados';

    SP_PROC.StoredProcName := 'PCK_CTB_FUNCAO_RESERVA.PR_ATUALIZA_SALDO_PART';

    SP_PROC.Params.CreateParam(ftInteger, 'inIdPessoa', ptinput);
    SP_PROC.Params.CreateParam(ftInteger, 'inIdPessJur', ptinput);
    SP_PROC.Params.CreateParam(ftInteger, 'inIdPlanoPrev', ptinput);

    If (pIdPessoa <> 0) Then
    Begin
      SP_PROC.parambyName('inIdPessoa').asInteger := pIdPessoa;
    End
    Else
    Begin
      SP_PROC.parambyName('inIdPessoa').Clear;
    End;

    If pIdPessJur <> 0 Then
    Begin
      SP_PROC.parambyName('inIdPessJur').asInteger := pIdPessJur;
    End
    Else
    Begin
      SP_PROC.parambyName('inIdPessJur').Clear;
    End;

    If pIdPlanoPrev <> 0 Then
    Begin
      SP_PROC.parambyName('inIdPlanoPrev').asInteger := pIdPlanoPrev;
    End
    Else
    Begin
      SP_PROC.parambyName('inIdPlanoPrev').Clear;
    End;

    SP_PROC.Prepare;
    SP_PROC.ExecProc;

    SP_PROC.Destroy;
  Except
    MsgDlg('Erro ao Atualizar Saldo.', 'Erro', mtError, [mbOk], 0);
  End;
End;

Procedure TfrmTransferenciaSaldoCota.CarregaDesfazer(pQryDados: TQuery);
Begin
  qryDesfazer.Close;
  qryDesfazer.Sql.Clear;
  qryDesfazer.Sql.Add('select HST.DATAMOV,');
  qryDesfazer.Sql.Add('       (select MATRICULA from DEPENTIT where IDPESSOA = HST.IDPESSOADESTINO and ROWNUM = 1) as MATRICULA,');
  qryDesfazer.Sql.Add('       HST.IDPESSOA,');
  qryDesfazer.Sql.Add('       HST.IDPESSOAORIGEM,');
  qryDesfazer.Sql.Add('       HST.IDPESSOADESTINO,');
  qryDesfazer.Sql.Add('       (select MATRICULA from DEPENTIT where IDPESSOA = HST.IDPESSOAORIGEM and ROWNUM = 1) as ORIGEM,');
  qryDesfazer.Sql.Add('       HST.IDTIPORESERVA,');
  qryDesfazer.Sql.Add('       decode(HST.FLGENTRADA, 1, ''E'', ''S'') as ES,');
  qryDesfazer.Sql.Add('       sum(VLRCOTAS) as SALDO,');
  qryDesfazer.Sql.Add('       (select NOME from PESSOA where IDPESSOA = substr(HST.TRGUSERINCLUSAO, 3, 10) and ROWNUM = 1) as NOME');
  qryDesfazer.Sql.Add('  from HISTMOVRESERVA HST');
  qryDesfazer.Sql.Add(' where HST.IDPESSOA = (select IDPESSOAORIGEM');
  qryDesfazer.Sql.Add('                         from HISTMOVRESERVA');
  qryDesfazer.Sql.Add('                        where IDPESSOA = ' + pQryDados.FieldByName('PESSOA1').AsString);
  qryDesfazer.Sql.Add('                          and IDPESSOAORIGEM is not null');
  qryDesfazer.Sql.Add('                          and ROWNUM = 1)');
  qryDesfazer.Sql.Add('   and HST.IDPESSOAORIGEM is not null');
  qryDesfazer.Sql.Add(' group by HST.DATAMOV,');
  qryDesfazer.Sql.Add('          HST.IDPESSOADESTINO,');
  qryDesfazer.Sql.Add('          HST.IDPESSOA,');
  qryDesfazer.Sql.Add('          HST.IDPESSOAORIGEM,');
  qryDesfazer.Sql.Add('          HST.FLGENTRADA,');
  qryDesfazer.Sql.Add('          HST.IDTIPORESERVA,');
  qryDesfazer.Sql.Add('          HST.TRGUSERINCLUSAO');
  qryDesfazer.Open;
End;

Procedure TfrmTransferenciaSaldoCota.FormCreate(Sender: TObject);
Begin
  Inherited;
  Processou := True;                              // Michelle Mota - SOL:265071 - PPM:1163508
End;

Procedure TfrmTransferenciaSaldoCota._AtualizaFrmProgresso(Var iContador: Integer);
Begin
  inc(iContador);
  frmProgresso.AndaFormProgresso(iContador);
  Application.ProcessMessages;
End;

End.

