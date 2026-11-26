Unit FAberturaFitaCredit;
//------------------------------------------------------------------------------
//WO          : 6246/6195
//Responsável : Paulo Nobre
//Data        : 15/03/2023
//Descrição   : Reestruturação de rotinas visando a melhoria da Performance:
//              1. Criada Procedure _CarregarMatriculas - Carregar num dataresult,
//                 antes do loop principal, todas as matriculas disponiveis no
//                 arquivo texto;
//              2. Novas query foram reescritas para trazer as matriculas acima;
//              3. No loop pricipal foi usado um controle para somente ler as
//                 na primeira passagem, depois não mais;
//              4. Evitado que durante o loop principal, o memo ficasse sendo
//                 atualizado. Foi usado uma stringlist para isto e ao final
//                 descarregado no memo;
//------------------------------------------------------------------------------
//SIG         : 125552
//Responsável : Andre Imakawa
//Data        : 25/05/2022
//Descrição   : Melhoria de Performance quando arquivo baseado na Previa.
//------------------------------------------------------------------------------
//SIG         : 120084
//Responsável : Andre Imakawa
//Data        : 19/10/2021
//Descrição   : Ajuste na rotina que recupera os lotes.
//------------------------------------------------------------------------------
//SIG         : 116097
//Responsável : Andre Imakawa
//Data        : 19/05/2021
//Descrição   : Zerar variavel iContaVersao a cada matricula.
//------------------------------------------------------------------------------
//Alterações:
//Rotina             :
//N. SIG..........   : 60540
//Data da Alteração: :
//Alteração Form:    : FRemessaEletronica
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adequação da funcionalidade para leitura de arquivos no convênio SIACC.
//*********************************************************************************
//------------------------------------------------------------------------------
//SIG         : 78215
//Responsável : Andre Imakawa
//Data        : 14/11/2018
//Descrição   : Correção na quebra do IN para o campo IDLOTE
//------------------------------------------------------------------------------
//SIG         : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 19/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//SOL         : 164921
//KINTANA     : 1421942
//Responsável : BRUNO AZEVEDO
//Descrição   : Ajuste na geração de fita de crédito.
//------------------------------------------------------------------------------
//Pendência   : SOL 136954 KINTANA  822329
//Responsável : Flávio Nogueira
//Descrição   : Implementação das informações Abertura da Fita de Crédito por Plano
//--------------------------------------------------------------------------------

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, dbasedados,
  uSistema, Printers, ComCtrls, uCMMath, Gauges, uCmSqlParams,
  DBClient, uCMClientDataSet,

  uCtrlPadroes;                                   // Paulo Nobre - WO6246

Type

  TFitaCredito = Class
  Private
    Fvalor: Real;
    FPlano: String;
    FID_Plano: integer;

  Public
    Property Valor: Real Read Fvalor Write FValor;
    Property Plano: String Read FPlano Write FPlano;
    Property ID_Plano: integer Read FID_Plano Write FID_Plano;
    Constructor Create;
    Destructor Destroy;

  End;

  TFrmAberturaFitaCredito = Class(TfrmSairAjuda)
    btnPtocessar: TBitBtn;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    txArqEnt: TEdit;
    EdtMensagem: TEdit;
    QryAuxiliar: TwwQuery;
    QryAux1: TwwQuery;
    REdtPrinter: TRichEdit;
    dlgSalvaArq: TSaveDialog;
    dlgAbreArq: TOpenDialog;
    PrintDialog: TPrintDialog;
    mmObs: TRichEdit;
    qryDepentit: TwwQuery;
    qryDepentitMATRICULA: TStringField;
    qryArquivoxDocum: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    qryVersaoFolha: TwwQuery;
    qryArqPagto: TwwQuery;
    qryArqPagtoIDARQUIVOPAGTO: TFloatField;
    cdsMatriculas: TCMClientDataSet;
    sqlMatriculas: TCMSqlParams;
    cdsMatriculasCODDOCARQ: TFloatField;
    cdsMatriculasIDPESSOA: TFloatField;
    cdsMatriculasIDTITULAR: TFloatField;
    cdsMatriculasNOME: TStringField;
    cdsMatriculasMATRICULA: TStringField;
    cdsMatriculasIDPESSOAETITULAR: TStringField;
    Procedure btnPtocessarClick(Sender: TObject);
    Procedure btnImprimirClick(Sender: TObject);
    Procedure btnCancelarClick(Sender: TObject);
    Procedure SpeedButton1Click(Sender: TObject);
    Procedure btn1Click(Sender: TObject);
    Procedure Button1Click(Sender: TObject);
  Private
    { Private declarations }
    Procedure DeterminaInfoConvenioSIACC(pLinha: String);

    // Paulo Nobre - WO6246 - Inicio
    //    Function RetornaMatricula(pCodDocArq: Integer): String;
    //    Function RetornaIdPessoaTitularLinha(pCodDocArq, pIdentificador: integer; pPrevia: boolean; Var pIdPessoa, pIdTitular: String; Var pNome, pMatricula: String): String;
    // Paulo Nobre - WO6246 - Fim

    Procedure Monitoramento(pRotina: String; ptipo: Integer; pErro: String = ''); // Andre Imakawa - SIG 116097

    Procedure _CarregarMatriculas(pLinha: String; pArquivoPrevia: boolean); // Paulo Nobre - WO6246

  Public
    { Public declarations }
    Cancelar: Boolean;
    sNomeArquivoSaida: String;
    Procedure ImprimirMemoComCanvas(Memo: TMemo);
    Function Completa(sNome: String; iTam: integer): String;
  End;

Var
  FrmAberturaFitaCredito: TFrmAberturaFitaCredito;
  sMatricula, sNomeEntidade, sIdPessoa, sIdTitular, sIdPessoaIdTitular, sCodDoArq: String; // Paulo Nobre - WO6246

Implementation

Uses FPrincipal, FAguarde;

{$R *.DFM}

Procedure TFrmAberturaFitaCredito.ImprimirMemoComCanvas(Memo: TMemo);
Const
  cEspacoLinha = 5;
  cMargemSuperior = 50;
  cMargemEsquerda = 30;
Var
  AlturaLinha, Y, I: integer;
Begin

  Printer.BeginDoc;
  Try
    { Usa na impressora a mesma fonte do memo }
    Printer.Canvas.Font.Assign(Memo.Font);

    AlturaLinha := Printer.Canvas.TextHeight('Tg');

    Y := cMargemSuperior;
    For I := 0 To Memo.Lines.Count - 1 Do
    Begin

      If Y > Printer.PageHeight Then
      Begin
        Printer.NewPage;
        Y := cMargemSuperior;
      End;

      Printer.Canvas.TextOut(cMargemEsquerda, Y, Memo.Lines[I]);

      Y := Y + AlturaLinha + cEspacoLinha;
    End;
  Finally
    Printer.EndDoc;
  End;
End;

Procedure TFrmAberturaFitaCredito.btnPtocessarClick(Sender: TObject);
Var sSql, sSql1, sSql2, sSql3, sSql4,
  {sIdPessoa, sIdTitular,}sLinha, sVersao: String; // Paulo Nobre - WO6246
  arqEntrada: TextFile;
  {sMatricula, sNomeEntidade,}sConvenio, sAux: String; // Paulo Nobre - WO6246
  dReplan, dReplanEx, dReb1, dRebEx, dReb98, dReb2002, dReplanSald: double;
  dNp, dNpPmpp: double;
  dLiquido, dTeste, dTeste2: double;
  iContTotal, iContReg, i, iContaVersao: integer;
  bMudou, bPrevia: boolean;
  sIdPessoaAnt, sIdTitularAnt: String;
  iNovoIn: integer;                               // Andre Imakawa - SIG78215
  arqSaida: TextFile;

  iTipoLinha: Integer;                            // Cássio Rovaroto - SIG nº 60540
  iIdentificador: Integer;                        // André Imakawa  - SIG 60540
  bArquivoPrevia: Boolean;                        // André Imakawa  - SIG 60540 -- True = Previa / False = Efetivação

  ListaMemo: TStringList;                         // Paulo Nobre - WO6246

Begin

  // Paulo Nobre - WO6246 - Inicio
  ListaMemo := TStringList.Create;
  sMatricula := '';
  sNomeEntidade := '';
  sIdPessoa := '';
  sIdTitular := '';
  sIdPessoaIdTitular := '';
  sCodDoArq := '';
  // Paulo Nobre - WO6246 - Fim

  btnPtocessar.Enabled := false;
  btnCancelar.enabled := true;
  btnImprimir.enabled := false;
  bbtnSair.Enabled := False;
  If trim(txArqEnt.Text) = '' Then
    Application.MessageBox('Não existe arquivo a processar.', PChar(frmPrincipal.Caption), MB_OK + MB_ICONINFORMATION);

  Try
    Try
      Monitoramento('ABERTURA DE FITA DE CREDITO', 0);
      //Abre os arquivos de entrada e de saida conforme caminho especificado em txArqSai e txArqEnt e txArqUpd
      //<---------------------------------------------------------------------------
      Screen.Cursor := crHourGlass;

      mmObs.Lines.Clear;

      ListaMemo.Clear;                            // Paulo Nobre - WO6246

      //FITACREDITO_DDMMAAAA_HHMMSS.txt
      AssignFile(arqEntrada, txArqEnt.Text);
      sNomeArquivoSaida := 'C:\Planus\Temp\' + 'FITACREDITO_' + FormatDateTime('ddmmyyyy', Now) + '_' + FormatDateTime('hhnnss', Now) + '.Txt'; //TxtCaminho + 'Demonstrativo.txt';

      ReSet(arqEntrada);

      AssignFile(arqSaida, sNomeArquivoSaida);

      If FileExists(sNomeArquivoSaida) Then
        Append(arqSaida)                          //adiciona no existente
      Else
        ReWrite(arqSaida);                        //cria, pois não existe.

      //Cássio Rovaroto - SIG nº 60540 - Início
      iTipoLinha := -1;
      ReadLn(arqEntrada, sLinha);

      If Copy(sLinha, 1, 1) = 'A' Then
        iTipoLinha := 1                           //SICOV
      Else If Copy(sLinha, 8, 1) = '0' Then
      Begin
        iTipoLinha := 2;                          //SIACC
        sConvenio := copy(sLinha, 33, 6);         // Código do convênio no leiaute SIACC.
        If copy(sLinha, 192, 20) <> '' Then
        Begin
          If pos('P', copy(sLinha, 192, 20)) <> 0 Then // Prévia
          Begin
            iIdentificador := StrToInt(copy(copy(sLinha, 192, 20), pos('P', copy(sLinha, 192, 20)) + 1, length(copy(sLinha, 192, 20)) - (pos('P', copy(sLinha, 192, 20)))));
            bArquivoPrevia := True;
          End
          Else                                    // Folhas Normais
          Begin
            iIdentificador := StrToInt(copy(sLinha, 192, 20));
            bArquivoPrevia := False;
          End;
        End
        Else
        Begin
          Application.MessageBox(PChar('Não foi possível identificar o arquivo.' + #10#13),
            PChar(frmPrincipal.Caption), MB_OK + MB_ICONERROR);
          CloseFile(arqEntrada);
          Exit;
        End;
      End
      Else
        iTipoLinha := -1;                         //Convênio não definido

      // Paulo Nobre - WO6246 - Inicio
      // Carregando de uma vez todas as matriculas do arquivo da fita antes do loop
      //
      _CarregarMatriculas(sLinha, bArquivoPrevia);
      //
      // Paulo Nobre - WO6246 - Fim

      //CloseFile(arqEntrada);
      Reset(arqEntrada);
      //Cássio Rovaroto - SIG nº 60540 - Fim

      iContTotal := 0;

      //Faz um loop no arquivo para ler a quantidade total de registros
      While Not Eof(arqEntrada) Do
      Begin
        ReadLn(arqEntrada, sLinha);
        Inc(iContTotal);
      End;

      CloseFile(arqEntrada);
      ReSet(arqEntrada);

      iContReg := 0;
      iContaVersao := 0;
      iNovoIn := 0;                               // Andre Imakawa - SIG78215
      sMatricula := '';

      dRebEx := 0;
      dReplan := 0;
      dReb98 := 0;
      dReplanEx := 0;
      dReb1 := 0;
      dReb2002 := 0;
      dReplanSald := 0;
      dNp := 0;
      dNpPmpp := 0;
      dTeste := 0;

      btnPtocessar.Enabled := false;
      btnCancelar.enabled := true;
      btnImprimir.enabled := false;

      sIdPessoaAnt := '';
      sIdTitularAnt := '';
      sVersao := '';
      sSql1 := '';
      sSql2 := '';
      sSql3 := '';
      sSql4 := '';
      bPrevia := false;
      Cancelar := False;

      mmObs.Lines.Add(Completa('Início do processo', 10) + ':' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      mmObs.Lines.Add('');

      WriteLn(arqSaida, Completa('Início do processo', 10) + ': ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      WriteLn(arqSaida, '');
      // sSqlIn := ''

      While Not Eof(arqEntrada) Do
      Begin

        If Cancelar Then
        Begin
          mmObs.Lines.Clear;
          txArqEnt.Text := '';
          EdtMensagem.Text := '';
          Exit;
        End;

        ReadLn(arqEntrada, sLinha);

        inc(iContReg);

        // Paulo Nobre - WO6246 - Inicio
        EdtMensagem.Text := 'Processando registro ' + IntToStr(iContReg) + ' de ' + IntToStr(iContTotal);
        Application.ProcessMessages;
        // Paulo Nobre - WO6246 - Fim

        //Cássio Rovaroto - SIG nº 60540 - Início
        //if copy(slinha,1,1) = 'E' then

        // Empréstimo
        If (iTipoLinha = 1) And (copy(slinha, 1, 1) = 'E') Then
        Begin
          // Paulo Nobre - WO6246 - Inicio
          // Selecionando o id da folha somente na primeira passagem, depois não mais
          If sVersao = '' Then
          Begin
            sSql := '';
            //        sSql := sSql + 'select /*+rule*/ idhstfolhabenef ';   //Everson TIBERO
            sSql := sSql + 'select  idhstfolhabenef '; //Everson TIBERO
            sSql := sSql + 'from   hstfolhabenef ';
            sSql := sSql + 'where  mesreferencia = ' + '''' + copy(slinha, 45, 4) + '/' + copy(slinha, 49, 2) + ''' ';
            sSql := sSql + 'and    FLGTIPOFOLHA IN (0,6) ';
            sSql := sSql + 'and    FLGESTADO = 1 ';
            sSql := sSql + 'and    UPPER(HISTORICO) NOT like ' + '''' + '%RESG%' + '''';
            sSql := sSql + 'and    UPPER(HISTORICO) NOT like ' + '''' + '%RE%' + '''';
            sSql := sSql + 'and    UPPER(HISTORICO) NOT like ' + '''' + '%PORT%' + '''';
            sSql := sSql + 'ORDER BY IDHSTFOLHABENEF DESC ';

            qryVersaoFolha.Close;
            qryVersaoFolha.Sql.text := sSql;
            qryVersaoFolha.Open;

            If qryVersaoFolha.eof Then
            Begin
              sSql := '';
              //           sSql := sSql + 'select /*+rule*/ idlote '; //Everson TIBERO
              sSql := sSql + 'select  idlote ';   //Everson TIBERO
              sSql := sSql + 'from   ctrlinterface ';
              sSql := sSql + 'where  tipo = ''B'' ';
              sSql := sSql + 'and    flgidatmp = 1 ';
              sSql := sSql + 'and    flgtipofolha <> 2 ';
              sSql := sSql + 'and    upper(descricao) not like ''%RESG%'' ';
              sSql := sSql + 'and    upper(descricao) not like ''%PORT%'' ';
              sSql := sSql + 'and    mesreferencia = ' + '''' + copy(slinha, 45, 4) + '/' + copy(slinha, 49, 2) + '''';

              qryVersaoFolha.Close;
              qryVersaoFolha.Sql.text := sSql;
              qryVersaoFolha.Open;

              //qryVersaoFolha.first;
              sSql1 := '';                        // Andre Imakawa - SIG78215
              iNovoIn := 0;                       // Andre Imakawa - SIG78215
              iContaVersao := 0;                  // Andre Imakawa - SIG116097
              sVersao := '';
              While Not qryVersaoFolha.Eof Do
              Begin
                sVersao := sVersao + trim(inttostr(qryVersaoFolha.FieldValues['idlote'])) + ', ';
                inc(iContaVersao);
                If iContaVersao Mod 900 = 0 Then  // testar com 3
                Begin
                  //BRUNO AZEVEDO SOL 164921 KINTANA 1421942
                  sVersao := copy(sVersao, 1, (length(sVersao) - 2));
                  // Andre Imakawa - SIG78215 - Inicio
                  If sSql1 = '' Then
                    sSql1 := ' and  previa.idlote in (' + sVersao + ') '
                  Else If iNovoIn = 1 Then
                  Begin
                    sSql1 := copy(trim(sSql1), pos('and', sSql1) + 2, length(trim(sSql1)));
                    sSql1 := 'and (' + sSql1 + ' or   previa.idlote in (' + sVersao + ')) ';
                  End
                  Else
                  Begin
                    sSql1 := copy(trim(sSql1), 1, (length(trim(sSql1)) - 1));
                    sSql1 := sSql1 + ' or  previa.idlote in (' + sVersao + ')) ';
                  End;
                  // Andre Imakawa - SIG78215 - Fim
                  inc(iNovoIn);                   // Andre Imakawa - SIG78215
                  sVersao := '';
                  iContaVersao := 0;
                End;

                qryVersaoFolha.next;

              End;
              If sSql1 = '' Then
                sVersao := copy(trim(sVersao), 1, (length(trim(sVersao)) - 1));

              bPrevia := true;
            End
            Else
              sVersao := trim(inttostr(qryVersaoFolha.FieldValues['idhstfolhabenef']));
          End;
          // Paulo Nobre - WO6246 - Fim

          sConvenio := trim(copy(slinha, 3, 20));

        End
          // Outras folhas - Lendo as linhas "A" com os nomes das Pessoas
        Else If (iTipoLinha = 2) And (Copy(sLinha, 14, 1) = 'A') And (sVersao = '') Then // Andre Imakawa - SIG 120084
        Begin
          // Paulo Nobre - WO6246 - Inicio
          // Selecionando o id da folha somente na primeira passagem, depois não mais
          If sVersao = '' Then
          Begin
            sSql := '';
            //sSql := sSql + 'SELECT /*+rule*/ IDHSTFOLHABENEF ';
            sSql := sSql + 'SELECT IDHSTFOLHABENEF ';
            sSql := sSql + 'FROM  HSTFOLHABENEF ';
            sSql := sSql + 'WHERE MESREFERENCIA = ' + '''' + copy(slinha, 98, 4) + '/' + copy(slinha, 96, 2) + ''' ';
            sSql := sSql + '      AND FLGTIPOFOLHA IN (0,6) ';
            sSql := sSql + '      AND FLGESTADO = 1 ';
            sSql := sSql + '      AND VALORLIQTOTAL <> 0  ';
            sSql := sSql + '      AND UPPER(HISTORICO) NOT LIKE ' + '''' + '%RESG%' + '''';
            sSql := sSql + '      AND UPPER(HISTORICO) NOT LIKE ' + '''' + '%RE%' + '''';
            sSql := sSql + '      AND UPPER(HISTORICO) NOT LIKE ' + '''' + '%PORT%' + '''';
            sSql := sSql + 'ORDER BY IDHSTFOLHABENEF DESC';

            qryVersaoFolha.Close;
            qryVersaoFolha.SQL.Text := sSql;
            qryVersaoFolha.Open;

            If qryVersaoFolha.Eof Then
            Begin
              // Selecionando a folha somente na primeira passagem, depois não mais
              If sVersao = '' Then
              Begin
                sSql := '';
                //sSql := sSql + 'SELECT /*+rule*/ IDLOTE ';
                sSql := sSql + 'SELECT IDLOTE ';
                sSql := sSql + 'FROM   CTRLINTERFACE ';
                sSql := sSql + 'WHERE  TIPO = ''B'' ';
                sSql := sSql + 'AND    FLGIDATMP = 1 ';
                sSql := sSql + 'AND    FLGTIPOFOLHA <> 2 ';
                sSql := sSql + 'AND    UPPER(DESCRICAO) NOT LIKE ''%RESG%'' ';
                sSql := sSql + 'AND    UPPER(DESCRICAO) NOT LIKE ''%PORT%'' ';
                sSql := sSql + 'AND    MESREFERENCIA = ' + '''' + copy(slinha, 98, 4) + '/' + copy(slinha, 96, 2) + '''';

                qryVersaoFolha.Close;
                qryVersaoFolha.SQL.Text := sSql;
                qryVersaoFolha.Open;
              End;
              //qryVersaoFolha.first;

              sVersao := '';
              sSql1 := '';                        // Andre Imakawa - SIG78215
              iNovoIn := 0;                       // Andre Imakawa - SIG78215
              iContaVersao := 0;                  // Andre Imakawa - SIG116097
              While Not qryVersaoFolha.Eof Do
              Begin
                sVersao := sVersao + Trim(IntToStr(qryVersaoFolha.FieldValues['IDLOTE'])) + ', ';
                inc(iContaVersao);
                If iContaVersao Mod 900 = 0 Then  // testar com 3
                Begin
                  //BRUNO AZEVEDO SOL 164921 KINTANA 1421942
                  sVersao := copy(sVersao, 1, (length(sVersao) - 2));

                  // Andre Imakawa - SIG78215 - Inicio
                  If sSql1 = '' Then
                    sSql1 := ' and  previa.idlote in (' + sVersao + ') '
                  Else If iNovoIn = 1 Then
                  Begin
                    sSql1 := copy(trim(sSql1), pos('and', sSql1) + 2, length(trim(sSql1)));
                    sSql1 := 'and (' + sSql1 + ' or   previa.idlote in (' + sVersao + ')) ';
                  End
                  Else
                  Begin
                    sSql1 := copy(trim(sSql1), 1, (length(trim(sSql1)) - 1));
                    sSql1 := sSql1 + ' or  previa.idlote in (' + sVersao + ')) ';
                  End;
                  // Andre Imakawa - SIG78215 - Fim
                  inc(iNovoIn);                   // Andre Imakawa - SIG78215

                  //sSql1        := sSql1 + sSql1 + 'AND   PREVIA.IDLOTE IN (' + sVersao + ') ';
                  sVersao := '';
                  iContaVersao := 0;
                End;

                qryVersaoFolha.next;

              End;

              If sSql1 = '' Then
                sVersao := copy(trim(sVersao), 1, (length(trim(sVersao)) - 1));

              bPrevia := true;
            End
            Else
              sVersao := trim(inttostr(qryVersaoFolha.FieldValues['IDHSTFOLHABENEF']));
          End;
          // Paulo Nobre - WO6246 - Fim

        End;

        If sConvenio = '' Then
          sConvenio := '1';

        //Cássio Rovaroto - SIG nº 60540 - Início
        //if sConvenio = '6074' then
        If (sConvenio = '6074') Or (sConvenio = '338872') Then // Andre Imakawa - SIG 60540 - 290508
          //Cássio Rovaroto - SIG nº 60540 - Início
        Begin
          sVersao := '';
          sVersao := InputBox('Informar a versão do adiantamento.', 'Versão:', '');

          If sVersao = '' Then
          Begin
            Application.MessageBox(PChar('É necessário identificar a versão do adantamento.'),
              PChar(frmPrincipal.Caption), MB_OK + MB_ICONERROR);
            Screen.Cursor := crDefault;
            exit;
          End;
        End;

        //Cássio Rovaroto - SIG nº 60540 - Início
        //if copy(slinha,1,1) = 'E' then
        If ((iTipoLinha = 1) And (copy(slinha, 1, 1) = 'E')) Or
          ((iTipoLinha = 2) And (Copy(sLinha, 14, 1) = 'A')) Then
        Begin
          If (iTipoLinha = 2) And (Copy(sLinha, 14, 1) = 'A') Then
            DeterminaInfoConvenioSIACC(sLinha)
          Else
          Begin
            If sConvenio = '6045' Then
              sNomeEntidade := trim(copy(slinha, 90, 41))
            Else
              sMatricula := copy(slinha, 2, 7);

            //sTipo := copy(slinha,3,1); // 1 - assoc, 2 - consignatario

            {if ((sMatricula+sTipo) <> (sMatrAnterior+sTipoAnterior)) then
            begin
                sMatrAnterior := sMatricula;
                sTipoAnterior := sTipo;}

            // Busca o idtitular e idpessoa
            {sSql := '';
            sSql := sSql + 'select distinct IDPLANOCONTABIL ';
            sSql := sSql + 'from  cm.depentit, cm.histrubsal ';
            sSql := sSql + 'where depentit.idtitular = histrubsal.idtitular ';
            sSql := sSql + 'and   depentit.idpessoa  = histrubsal.idpessoa ';
            sSql := sSql + 'and   histrubsal.idhstfolhabenef = ' + sVersao + ' ';
            sSql := sSql + 'and   depentit.matricula = ' + '''' + sMatricula + '''';
            sSql := sSql + 'order by  IDPLANOCONTABIL desc';

            QryAux1.Close;
            QryAux1.Sql.text := sSql;
            QryAux1.Open;

              // Verifica se foi encontrado o idpessoa e idtitular
              if QryAux1.Eof then
              begin}
            sIdTitular := '';
            sIdPessoa := '';
            sAux := '';
            sAux := trim(copy(slinha, 70, 19));

            bMudou := false;

            For i := 1 To Length(sAux) Do
            Begin
              If (trim(sAux[i]) <> '') And (Not bMudou) Then
                sIdTitular := sIdTitular + sAux[i]
              Else
              Begin
                bMudou := true;
                sIdPessoa := sIdPessoa + trim(sAux[i]);
              End;
            End;

            //bPrevia := true;
            //sVersao := '4602,4603,4604,4828';
          End;

          If bPrevia Then
          Begin
            If (sConvenio = '6045') Or (sConvenio = '338869') Then // Andre Imakawa - SIG 60540 - 290507
            Begin
              // Busca a entidade
              sSql := '';
              //            sSql := sSql + 'select  /*+rule*/';  //Everson TIBERO
              sSql := sSql + 'select  ';          //Everson TIBERO
              //sSql := sSql + 'select  ';
              sSql := sSql + 'PREVIA.IDPLANOPREV, PREVIA.IDPLANOCONTABIL, ';
              sSql := sSql + 'SUM(DECODE(DECODE(PREVIA.flgdesconto, null, ';
              sSql := sSql + 'PROVDESC.FLGDESCONTO, PREVIA.FLGDESCONTO), ';
              sSql := sSql + '0, -PREVIA.VALORPROVENTO, PREVIA.VALORPROVENTO)) VALOR ';
              sSql := sSql + 'FROM  CM.PREVIA, CM.PROVDESC ';
              sSql := sSql + 'WHERE PREVIA.IDRUBRICA = PROVDESC.IDPROVENTO ';
              sSql := sSql + 'AND   DECODE(PREVIA.FLGESPECIAL, NULL, ';
              sSql := sSql + 'PROVDESC.FLGESPECIAL, PREVIA.FLGESPECIAL) <> 2 ';
              sSql := sSql + 'AND   DECODE(previa.flgdesconto, NULL, ';
              sSql := sSql + 'PROVDESC.FLGDESCONTO, PREVIA.FLGDESCONTO) IN (0,1) ';
              sSql := sSql + 'AND   PREVIA.IDFAVORECIDO = ' + sIdTitular + ' ';
              // Andre Imakawa - SIG78215 - Inicio
              If sSql1 = '' Then
                sSql := sSql + ' and   previa.idlote in (' + sVersao + ') '
              Else
                sSql := sSql + sSql1;
              // Andre Imakawa - SIG78215 - Fim
              //sSql := sSql + 'and   previa.idlote in (' + sVersao + ') ';
              sSql := sSql + 'GROUP BY PREVIA.IDPLANOPREV, PREVIA.IDPLANOCONTABIL';
            End
            Else
            Begin
              // Busca o Plano Contabil das Pessoas
              sSql := '';
              //sSql := sSql + 'select /*+index(previa Xie6previa)*/ ';
    //            sSql := sSql + 'select  /*+rule*/'; //Everson TIBERO
              sSql := sSql + 'select  ';          //Everson TIBERO
              sSql := sSql + 'PREVIA.IDPLANOPREV, PREVIA.IDPLANOCONTABIL, ';
              sSql := sSql + 'SUM(DECODE(DECODE(PREVIA.FLGDESCONTO, null, ';
              sSql := sSql + 'PROVDESC.FLGDESCONTO, PREVIA.FLGDESCONTO), ';
              sSql := sSql + '0, PREVIA.VALORPROVENTO, -PREVIA.VALORPROVENTO)) VALOR ';
              sSql := sSql + 'FROM  CM.PREVIA, CM.PROVDESC ';
              sSql := sSql + 'WHERE PREVIA.IDRUBRICA = PROVDESC.IDPROVENTO ';
              sSql := sSql + 'AND   DECODE(PREVIA.FLGESPECIAL, NULL, ';
              sSql := sSql + 'PROVDESC.FLGESPECIAL, PREVIA.FLGESPECIAL) <> 2 ';
              sSql := sSql + 'AND   DECODE(PREVIA.FLGDESCONTO, NULL, ';
              sSql := sSql + 'PROVDESC.FLGDESCONTO, PREVIA.FLGDESCONTO) IN (0,1) ';
              //sSql := sSql + 'and   previa.CODPORTFORMA = 92 ';
              sSql := sSql + 'AND   PREVIA.IDTITULAR       = ' + sIdTitular + ' ';
              sSql := sSql + 'AND   PREVIA.IDRESPONSAVEL   = ' + sIdPessoa + ' ';
              // Andre Imakawa - SIG78215 - Inicio
              If sSql1 = '' Then
                sSql := sSql + ' and   previa.idlote in (' + sVersao + ') '
              Else
                sSql := sSql + sSql1;
              // Andre Imakawa - SIG78215 - Fim
              //sSql := sSql + 'and   previa.idlote in (' + sVersao + ') ';
              sSql := sSql + 'GROUP BY PREVIA.IDPLANOPREV, PREVIA.IDPLANOCONTABIL';
            End;
          End
          Else
          Begin
            If (sConvenio = '6045') Or (sConvenio = '338869') Then // Andre Imakawa - SIG 60540 - 290507
            Begin
              // Busca a entidade
              sSql := '';
              //            sSql := sSql + 'select  /*+rule*/'; //Everson TIBERO
              sSql := sSql + 'select  ';          //Everson TIBERO
              sSql := sSql + 'HISTRUBSAL.IDPLANOPREV, HISTRUBSAL.IDPLANOCONTABIL, ';
              sSql := sSql + 'SUM(DECODE(DECODE(HISTRUBSAL.FLGDESCONTO, NULL, ';
              sSql := sSql + 'PROVDESC.FLGDESCONTO, HISTRUBSAL.FLGDESCONTO), ';
              sSql := sSql + '0, -HISTRUBSAL.VALORPROVENTO, HISTRUBSAL.VALORPROVENTO)) VALOR ';
              sSql := sSql + 'FROM  CM.HISTRUBSAL, CM.PROVDESC ';
              sSql := sSql + 'WHERE HISTRUBSAL.IDRUBRICA = PROVDESC.IDPROVENTO ';
              sSql := sSql + 'AND   DECODE(HISTRUBSAL.FLGESPECIAL, NULL, ';
              sSql := sSql + 'PROVDESC.FLGESPECIAL, HISTRUBSAL.FLGESPECIAL) <> 2 ';
              sSql := sSql + 'AND   DECODE(HISTRUBSAL.FLGDESCONTO, NULL, ';
              sSql := sSql + 'PROVDESC.FLGDESCONTO, HISTRUBSAL.FLGDESCONTO) IN (0,1) ';
              sSql := sSql + 'AND   HISTRUBSAL.IDFAVORECIDO = ' + sIdTitular + ' ';
              sSql := sSql + 'AND   HISTRUBSAL.IDHSTFOLHABENEF = ' + sVersao + ' ';
              sSql := sSql + 'GROUP BY HISTRUBSAL.IDPLANOPREV, HISTRUBSAL.IDPLANOCONTABIL';
            End
            Else
            Begin
              // Busca pelo idtitular e idpessoa e versão da folha
              sSql := '';
              //            sSql := sSql + ' select /*+rule*/'; //IDPLANOCONTABIL,  '; //Everson TIBERO
              sSql := sSql + ' SELECT ';          //IDPLANOCONTABIL,  ';            //Everson TIBERO
              sSql := sSql + ' HISTRUBSAL.IDPLANOPREV, HISTRUBSAL.IDPLANOCONTABIL, ';
              sSql := sSql + ' SUM(DECODE(DECODE(HISTRUBSAL.FLGDESCONTO, null, ';
              sSql := sSql + ' PROVDESC.FLGDESCONTO, HISTRUBSAL.FLGDESCONTO), ';
              sSql := sSql + ' 0, HISTRUBSAL.VALORPROVENTO, -HISTRUBSAL.VALORPROVENTO)) VALOR ';
              sSql := sSql + ' FROM  CM.HISTRUBSAL, CM.PROVDESC ';
              sSql := sSql + ' WHERE HISTRUBSAL.IDRUBRICA = PROVDESC.IDPROVENTO ';
              sSql := sSql + ' AND   DECODE(HISTRUBSAL.FLGESPECIAL, NULL, ';
              sSql := sSql + ' PROVDESC.FLGESPECIAL, HISTRUBSAL.FLGESPECIAL) <> 2 ';
              sSql := sSql + ' AND   DECODE(HISTRUBSAL.FLGDESCONTO, NULL, ';
              sSql := sSql + ' PROVDESC.FLGDESCONTO, HISTRUBSAL.FLGDESCONTO) in (0,1) ';
              sSql := sSql + ' AND   nvl(HISTRUBSAL.FLGESTORNO,0) = 0 ';
              sSql := sSql + ' AND   HISTRUBSAL.IDTITULAR       = ' + sIdTitular + ' ';
              sSql := sSql + ' AND   HISTRUBSAL.IDRESPONSAVEL   = ' + sIdPessoa + ' ';
              sSql := sSql + ' AND   HISTRUBSAL.IDHSTFOLHABENEF = ' + sVersao + ' ';
              sSql := sSql + ' GROUP BY HISTRUBSAL.IDPLANOPREV, HISTRUBSAL.IDPLANOCONTABIL ';
            End;
          End;

          QryAux1.Close;
          QryAux1.Sql.text := sSql;
          QryAux1.Open;
          //end;

          If QryAux1.Eof Then
          Begin
            If (sConvenio = '6045') Or (sConvenio = '338869') Then // Andre Imakawa - SIG 60540 - 290507
              //   mmObs.Lines.Add('Não foi encontrado o Plano Contábil para Entidade: ' + sNomeEntidade)
              ListaMemo.Add('Não foi encontrado o Plano Contábil para Entidade: ' + sNomeEntidade) // Paulo Nobre - WO6246
            Else
              //   mmObs.Lines.Add('Não foi encontrado o Plano Contábil para Matrícula: ' + sMatricula);
              ListaMemo.Add('Não foi encontrado o Plano Contábil para Matrícula: ' + sMatricula); // Paulo Nobre - WO6246
          End
          Else
          Begin
            // Achando o Valor liquido da Pessoa
            QryAux1.First;
            dLiquido := 0;
            While Not QryAux1.Eof Do
            Begin
              dLiquido := dLiquido + QryAux1.FieldValues['VALOR'];
              QryAux1.Next;
            End;

            If (iTipoLinha = 1) And (copy(slinha, 1, 1) = 'E') Then
              dTeste2 := (strtofloat(copy(slinha, 53, 15)) / 100)
            Else
              dTeste2 := (strtofloat(copy(slinha, 120, 15)) / 100);

            If FloatToStr(roundCM(dTeste2, 2)) <> FloatToStr(roundCM(dLiquido, 2)) Then
            Begin
              If sConvenio = '6045' Then
                //mmObs.Lines.Add('O líquido da Entidade: ' + sNomeEntidade + ' na base de dados : ' +
                //floattostr(dLiquido) + ' difere do arquivo: ' + floattostr((strtofloat(copy(slinha,53,15))/100)))
              Else
                mmObs.Lines.Add('O líquido da Matrícula: ' + sMatricula + ' na base de dados : ' +
                  floattostr(dLiquido) + ' difere do arquivo: ' + floattostr((strtofloat(copy(slinha, 120, 15)) / 100)));
              Exit;
            End;

            If (sIdPessoaAnt + sIdTitularAnt) <> (sIdPessoa + sIdTitular) Then
            Begin
              QryAux1.First;

              sIdPessoaAnt := sIdPessoa;
              sIdTitularAnt := sIdTitular;

              While Not QryAux1.Eof Do
              Begin
                Case strtoint(QryAux1.FieldValues['IDPLANOCONTABIL']) Of
                  2:
                    Begin
                      If strtoint(QryAux1.FieldValues['IDPLANOPREV']) = 66 Then
                      Begin
                        dReb1 := dReb1 + QryAux1.FieldValues['VALOR'];
                        {mmObs.Lines.Add('Plano Prev: ' + inttostr(QryAux1.FieldValues['IDPLANOPREV']) +
                                         ' Plano Contábil: ' + inttostr(QryAux1.FieldValues['IDPLANOCONTABIL']) +
                                         ' IdTitular: ' + sIdTitular + //inttostr(QryAux1.FieldValues['IDTITULAR']) +
                                         ' IdPessoa: ' + sIdPessoa + //inttostr(QryAux1.FieldValues['IDRESPONSAVEL']) +
                                         ' Valor: ' + floattostr(QryAux1.FieldValues['VALOR']));}
                      End
                      Else
                        //IF QryAux1.FieldValues['IDPLANOPREV'] = 66 then
                        dReplan := dReplan + QryAux1.FieldValues['VALOR'];

                    End;
                  19: dReb98 := dReb98 + QryAux1.FieldValues['VALOR'];
                  28: dReplanSald := dReplanSald + QryAux1.FieldValues['VALOR'];
                  22:
                    Begin
                      If strtoint(QryAux1.FieldValues['IDPLANOPREV']) = 66 Then
                      Begin
                        dRebEx := dRebEx + QryAux1.FieldValues['VALOR'];
                        {mmObs.Lines.Add('Plano Prev: ' + inttostr(QryAux1.FieldValues['IDPLANOPREV']) +
                                         ' Plano Contábil: ' + inttostr(QryAux1.FieldValues['IDPLANOCONTABIL']) +
                                         ' IdTitular: ' + sIdTitular + //inttostr(QryAux1.FieldValues['IDTITULAR']) +
                                         ' IdPessoa: ' + sIdPessoa + //inttostr(QryAux1.FieldValues['IDRESPONSAVEL']) +
                                         ' Valor: ' + floattostr(QryAux1.FieldValues['VALOR']));}
                      End
                      Else
                        //IF QryAux1.FieldValues['IDPLANOPREV'] = 2 then
                        dReplanEx := dReplanEx + QryAux1.FieldValues['VALOR'];
                    End;
                  66:
                    Begin
                      {mmObs.Lines.Add('Reb1 Titular:' + chr(9) + sIdTitular +
                                       ' Pessoa:' + chr(9) + sIdPessoa + ' Valor:' + chr(9) +
                                       floattostr(QryAux1.FieldValues['VALOR']));}
                      dReb2002 := dReb2002 + QryAux1.FieldValues['VALOR'];
                    End;
                  74:
                    Begin
                      {mmObs.Lines.Add('Reb1 Titular:' + chr(9) + sIdTitular +
                                       ' Pessoa:' + chr(9) + sIdPessoa + ' Valor:' + chr(9) +
                                       floattostr(QryAux1.FieldValues['VALOR']));}
                      dNp := dNp + QryAux1.FieldValues['VALOR'];
                    End;
                  75:
                    Begin
                      {mmObs.Lines.Add('Reb1 Titular:' + chr(9) + sIdTitular +
                                       ' Pessoa:' + chr(9) + sIdPessoa + ' Valor:' + chr(9) +
                                       floattostr(QryAux1.FieldValues['VALOR']));}
                      dNpPmpp := dNpPmpp + QryAux1.FieldValues['VALOR'];
                    End;
                Else
                  dTeste := dTeste + QryAux1.FieldValues['VALOR'];
                End;

                QryAux1.Next;

              End;
            End
            Else
            Begin
              If (sConvenio <> '6045') Or (sConvenio <> '338869') Then // Andre Imakawa - SIG 60540 - 290507
                //              mmObs.Lines.Add('Erro Titular: ' + sIdTitular + ' Pessoa: ' + sIdPessoa);
                ListaMemo.Add('Erro Titular: ' + sIdTitular + ' Pessoa: ' + sIdPessoa); // Paulo Nobre - WO6246
            End;
          End;
        End;
        //end;
     //end;
    //      EdtMensagem.Text := 'Lendo registro ' + IntToStr(iContReg) + ' de ' + IntToStr(iContTotal);
    //    Application.ProcessMessages;
      End;

      mmObs.Lines.Add(ListaMemo.Text);            // Paulo Nobre - WO6246

      //Cássio Rovaroto - SIG nº 60540 - Fim
      //------------------------------------------------------------------------->
      // Lista os resultados
      //<-------------------------------------------------------------------------
      // Assitidos

      //Cássio Rovaroto - SIG nº 60540 - Início
      {case strtoint(sConvenio) of
        1: sConvenio := 'Consignatários Doc Outros Bancos';
        4261: sConvenio := 'Assistidos';
        6074: sConvenio := 'Adiantamentos';
        6047: sConvenio := 'Consignatários';
        6045: sConvenio := 'Entidades';
        6078: sConvenio := 'Auxílio Funeral';
      end;}
      Case strtoint(sConvenio) Of
        1: sConvenio := 'Consignatários Doc Outros Bancos';
        4261, 290511: sConvenio := 'Assistidos';
        6074, 338872: sConvenio := 'Adiantamentos';
        6047, 336228: sConvenio := 'Consignatários';
        6045, 338869: sConvenio := 'Entidades';
        6078: sConvenio := 'Auxílio Funeral';
      End;
      //Cássio Rovaroto - SIG nº 60540 - Fim

      If dTeste > 0 Then
        mmObs.Lines.Add('Valor sem plano contábil identificado: ' + floattostr(dTeste));

      mmObs.Lines.Add('Consignatários');
      WriteLn(arqSaida, 'Consignatários');
      mmObs.Lines.Add('');
      WriteLn(arqSaida, Completa('REB 1 EX/PREVHAB', 30) + ':' + FormatFloat('R$ #,##0.00', dRebEx));
      mmObs.Lines.Add(Completa('REB 1 EX/PREVHAB', 30) + ':' + FormatFloat('R$ #,##0.00', dRebEx));

      mmObs.Lines.Add(Completa('REG/REPLAN', 30) + ':' + FormatFloat('R$ #,##0.00', dReplan));
      WriteLn(arqSaida, Completa('REG/REPLAN', 30) + ':' + FormatFloat('R$ #,##0.00', dReplan));

      mmObs.Lines.Add(Completa('REB 1998', 30) + ':' + FormatFloat('R$ #,##0.00', dReb98));
      WriteLn(arqSaida, Completa('REB 1998', 30) + ':' + FormatFloat('R$ #,##0.00', dReb98));

      mmObs.Lines.Add(Completa('REPLAN EX/PREVHAB', 30) + ':' + FormatFloat('R$ #,##0.00', dReplanEx));
      WriteLn(arqSaida, Completa('REPLAN EX/PREVHAB', 30) + ':' + FormatFloat('R$ #,##0.00', dReplanEx));

      mmObs.Lines.Add(Completa('REPLAN SALDADO', 30) + ':' + FormatFloat('R$ #,##0.00', dReplanSald));
      WriteLn(arqSaida, Completa('REPLAN SALDADO', 30) + ':' + FormatFloat('R$ #,##0.00', dReplanSald));

      mmObs.Lines.Add(Completa('REB 1 CAIXA', 30) + ':' + FormatFloat('R$ #,##0.00', dReb1));
      WriteLn(arqSaida, Completa('REB 1 CAIXA', 30) + ':' + FormatFloat('R$ #,##0.00', dReb1));

      mmObs.Lines.Add(Completa('REB 2002', 30) + ':' + FormatFloat('R$ #,##0.00', dReb2002));
      WriteLn(arqSaida, Completa('REB 2002', 30) + ':' + FormatFloat('R$ #,##0.00', dReb2002));

      mmObs.Lines.Add(Completa('NOVO PLANO', 30) + ':' + FormatFloat('R$ #,##0.00', dNp));
      WriteLn(arqSaida, Completa('NOVO PLANO', 30) + ':' + FormatFloat('R$ #,##0.00', dNp));

      mmObs.Lines.Add(Completa('NOVO PLANO PMPP', 30) + ':' + FormatFloat('R$ #,##0.00', dNpPmpp));
      WriteLn(arqSaida, Completa('NOVO PLANO PMPP', 30) + ':' + FormatFloat('R$ #,##0.00', dNpPmpp));
      mmObs.Lines.Add('');
      WriteLn(arqSaida, '');
      mmObs.Lines.Add(Completa('TOTAL FITA', 30) + ':' + FormatFloat('R$ #,##0.00', (dRebEx + dReplan +
        dReb98 + dReplanEx + dReb1 + dReb2002 +
        dReplanSald + dNp + dNpPmpp)));
      WriteLn(arqSaida, Completa('TOTAL FITA', 30) + ':' + FormatFloat('R$ #,##0.00', (dRebEx + dReplan +
        dReb98 + dReplanEx + dReb1 + dReb2002 +
        dReplanSald + dNp + dNpPmpp)));
      mmObs.Lines.Add('');
      WriteLn(arqSaida, '');
      //------------------------------------------------------------------------->
      //Fecha os arquivos
      //<-------------------------------------------------------------------------
      mmObs.Lines.Add(Completa('Término do processo', 10) + ':' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      WriteLn(arqSaida, Completa('Término do processo', 10) + ':' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      CloseFile(arqEntrada);
      CloseFile(arqSaida);
      //Application.MessageBox('Operação concluída com sucesso.',PChar(frmPrincipal.Caption),MB_OK + MB_ICONINFORMATION);

      btnPtocessar.Enabled := true;
      btnCancelar.enabled := true;
      btnImprimir.enabled := true;

      Screen.Cursor := crDefault;
      Monitoramento('ABERTURA DE FITA DE CREDITO', 1);

      //------------------------------------------------------------------------->
    Except
      //Se houver erro é mostrado uma mensagem e tenta fechar os arquivos.
      //<-------------------------------------------------------------------------

      On E: Exception Do
      Begin
        Monitoramento('ABERTURA DE FITA DE CREDITO', 2, 'ERRRO NA ABERTURA DA FITA.');
        Application.MessageBox(PChar('Não foi possível concluir a operação.' + #10#13 + E.Message),
          PChar(frmPrincipal.Caption), MB_OK + MB_ICONERROR);
        Try
          CloseFile(arqEntrada);
        Finally
          EdtMensagem.Text := '';
          Screen.Cursor := crDefault;
        End;
      End;
      //------------------------------------------------------------------------->
    End
  Finally
    FreeAndNil(ListaMemo);                        // Paulo Nobre - WO6246
  End;

  bbtnSair.Enabled := true;
  btnPtocessar.Enabled := False;
End;

{procedure TFrmAberturaFitaCredito.ImprimirMemoComCanvas(Memo: TMemo);

var
  AlturaLinha, Y, I: integer;
begin

  Printer.BeginDoc;
  try
    { Usa na impressora a mesma fonte do memo
    Printer.Canvas.Font.Assign(Memo.Font);

    AlturaLinha := Printer.Canvas.TextHeight('Tg');

    Y := cMargemSuperior;
    for I := 0 to Memo.Lines.Count -1 do begin

      if Y > Printer.PageHeight then begin
        Printer.NewPage;
        Y := cMargemSuperior;
      end;

      Printer.Canvas.TextOut(cMargemEsquerda, Y, Memo.Lines[I]);

      Y := Y + AlturaLinha + cEspacoLinha;
    end;
  finally
    Printer.EndDoc;
  end;
end;       }

Procedure TFrmAberturaFitaCredito.btnImprimirClick(Sender: TObject);
Var linha, tm, i: integer;
Begin
  If PrintDialog.Execute Then
    mmObs.Print('');
End;

Procedure TFrmAberturaFitaCredito.btnCancelarClick(Sender: TObject);
Begin
  Inherited;
  If Application.MessageBox('Confirma Cancelamento?', PChar(frmPrincipal.Caption), MB_YESNO + MB_ICONQUESTION) = mrYes Then
  Begin

    Cancelar := True;
    mmObs.Lines.Clear;
    txArqEnt.Text := '';
    EdtMensagem.Text := '';
    btnCancelar.Enabled := False;
    btnImprimir.Enabled := False;
    //btnCancelar.Enabled:=False ;
   // btnPtocessar.Enabled:=False;
   // btnImprimir.Enabled:=False ;
    bbtnSair.Enabled := true;
  End;
End;

Procedure TFrmAberturaFitaCredito.SpeedButton1Click(Sender: TObject);
Begin
  Inherited;
  sNomeArquivoSaida := '';
  Cancelar := True;
  btnCancelar.Enabled := False;
  btnPtocessar.Enabled := False;
  btnImprimir.Enabled := False;
  If dlgAbreArq.Execute Then
    txArqEnt.Text := dlgAbreArq.FileName;
  If Trim(txArqEnt.Text) = '' Then
    Exit;

  btnPtocessar.Enabled := true;
End;

{ TFitaCredito }

Constructor TFitaCredito.Create;
Begin

End;

Destructor TFitaCredito.Destroy;
Begin

End;

Function TFrmAberturaFitaCredito.Completa(sNome: String; iTam: integer): String;
Var
  i, k: integer;
  Espacos: String;
Begin
  sNome := trim(sNome);
  i := length(sNome);
  Espacos := '';
  For k := 1 To (iTam - i) Do
    Espacos := Espacos + ' ';

  Result := sNome + Espacos;
End;

Procedure TFrmAberturaFitaCredito.btn1Click(Sender: TObject);
Begin
  Inherited;
  mmObs.Lines.Add(completa('REB 1 EX/PREVHAB', 25) + Trim(FormatFloat('R$ #,##0.00', 10)));
  mmObs.Lines.Add(completa('REG/REPLAN', 25) + Trim(FormatFloat('R$ #,##0.00', 20)));

End;

Procedure TFrmAberturaFitaCredito.Button1Click(Sender: TObject);
Begin
  Inherited;
  mmObs.Lines.Add('Consignatários');
  mmObs.Lines.Add('');
  mmObs.Lines.Add(Completa('REB 1 EX/PREVHAB', 30) + ':' + FormatFloat('R$ #,##0.00', 10));
  mmObs.Lines.Add(Completa('REG/REPLAN', 30) + ':' + FormatFloat('R$ #,##0.00', 1));
  mmObs.Lines.Add(Completa('REB 1998', 30) + ':' + FormatFloat('R$ #,##0.00', 2));
  mmObs.Lines.Add(Completa('REPLAN EX/PREVHAB', 30) + ':' + FormatFloat('R$ #,##0.00', 1));
  mmObs.Lines.Add(Completa('REPLAN SALDADO', 30) + ':' + FormatFloat('R$ #,##0.00', 0));
  mmObs.Lines.Add(Completa('REB 1 CAIXA', 30) + ':' + FormatFloat('R$ #,##0.00', 12));
  mmObs.Lines.Add(Completa('REB 2002', 30) + ':' + FormatFloat('R$ #,##0.00', 12));
  mmObs.Lines.Add(Completa('NOVO PLANO', 30) + ':' + FormatFloat('R$ #,##0.00', 45));
  mmObs.Lines.Add(Completa('NOVO PLANO PMPP', 30) + ':' + FormatFloat('R$ #,##0.00', 44));
  mmObs.Lines.Add('');
End;

// Paulo Nobre - WO6246 - Inicio
Procedure TFrmAberturaFitaCredito.DeterminaInfoConvenioSIACC(pLinha: String);
Var
  iCodDocArq: integer;
  // sIdPessoaIdTitular: String;
Begin
  iCodDocArq := StrToInt(copy(pLinha, 74, 6));    // Codigo identificar único nos registros de cada Pessoa

  Screen.Cursor := crSQLWait;
  If cdsMatriculas.Locate('CODDOCARQ', iCodDocArq, []) Then
  Begin
    sCodDoArq := cdsMatriculas.FieldByName('CODDOCARQ').AsString;
    sIdPessoa := cdsMatriculas.FieldByName('IDPESSOA').AsString;
    sIdTitular := cdsMatriculas.FieldByName('IDTITULAR').AsString;
    sNomeEntidade := cdsMatriculas.FieldByName('NOME').AsString;
    sMatricula := cdsMatriculas.FieldByName('MATRICULA').AsString;
    sIdPessoaIdTitular := cdsMatriculas.FieldByName('IDPESSOAETITULAR').AsString;
  End;
  Screen.Cursor := crDefault;

  {  if qryContaContrib.Locate('IDPESSJUR;IDPLANOPREV;IDCONTRIBUICAO',
        vararrayof([qryAux.fieldbyname('idpessjur').asinteger,
                    liidplanoprev, liidcontribuicao]),
        [loPartialKey]) then
     begin
       if Copy(qryAux.fieldbyname('MesReferencia').AsString,6,2) = '13' then
       begin
         sPlaContaC      :=trim(qryContaContrib.fieldbyname('PLACONTAC13').asstring);
         sCodCentroCustoC:=trim(qryContaContrib.fieldbyname('CODCENTROCUSTOC13').asstring);
         sUnidNegoc      :=trim(qryContaContrib.fieldbyname('UNIDNEGOC13').asstring);
         sCodCentroRespon:=trim(qryContaContrib.fieldbyname('CODCENTRORESPON13').asstring);
         sCodSubConta    :=trim(qryContaContrib.fieldbyname('CODSUBCONTA13').asstring);   }

   // Andre Imakawa - SIG 125552 - Inicio
 //  If Not (pPrevia) Then
 //    vMatricula := RetornaMatricula(iCodDocArq);
   // Andre Imakawa - SIG 125552 - Fim

 //  sIdPessoaIdTitular := RetornaIdPessoaTitularLinha(iCodDocArq, pIdentificador, pPrevia, vIdPessoa, vIdTitular, vNomeEntidade, vMatricula);
End;

{Function TFrmAberturaFitaCredito.RetornaMatricula(pCodDocArq: Integer): String;
Var
  //qryDepentit: TwwQuery;
  sSQL: String;
Begin
  Result := '';
  // qryDepentit := TwwQuery.Create(nil);

  // try
  //   qryDepentit.DatabaseName := 'BaseDados';

 { sSQL := 'SELECT DE.MATRICULA                                                               ' + #13#10 +
    '      FROM ARQUIVOXDOCUM AD                                                             ' + #13#10 +
    '      JOIN DOCUMENTOXPESSOAS DP ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS ' + #13#10 +
    '      JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AD.IDARQUIVOPAGTO                     ' + #13#10 +
    '      JOIN DEPENTIT DE ON DE.IDTITULAR = DP.IDTITULAR AND DE.IDPESSOA = DP.IDFORCLI     ' + #13#10 +
    '      WHERE AD.CODDOCARQ = ' + IntToStr(pCodDocArq);
  qryDepentit.SQL.Text := sSQL;

  Result := qryDepentit.FieldByName('MATRICULA').AsString;

  qryDepentit.Close;

  //  finally
   //   FreeAndNil(qryDepentit);
   // end;

End;

Function TFrmAberturaFitaCredito.RetornaIdPessoaTitularLinha(
  pCodDocArq, pIdentificador: integer; pPrevia: boolean; Var pIdPessoa, pIdTitular: String;
  Var pNome, pMatricula: String): String;
Var
  // qryArquivoxDocum: TwwQuery;
  sSQL: String;
Begin
  Result := '';
  // qryArquivoxDocum := TwwQuery.Create(nil);
  // try
   //  qryArquivoxDocum.DatabaseName := 'BaseDados';

     // Andre Imakawa - SIG 60540 - Inicio
{  If pPrevia Then
  Begin
    sSQL := 'SELECT RPD.IDRESPONSAVEL AS IDPESSOA,                                              ' + #10#13 +
      '	      RPD.IDTITULAR AS IDTITULAR,                                                       ' + #10#13 +
      '	      P.NOME AS NOME,                                                                   ' + #10#13 +
      '	      RPD.MATRICULA AS MATRICULA,                                                       ' + #10#13 +
      '	      TO_CHAR(RPD.IDRESPONSAVEL) || '','' || TO_CHAR(RPD.IDTITULAR) AS IDPESSOAETITULAR ' + #10#13 +
      'FROM CM.REMESSAPREVIA RP                                                                 ' + #10#13 +
      'INNER JOIN CM.REMESSAPREVIA_DETALHE RPD ON RP.IDREMESSAPREVIA = RPD.IDREMESSAPREVIA      ' + #10#13 +
      'INNER JOIN CM.PESSOA P ON P.IDPESSOA = RPD.IDRESPONSAVEL                                 ' + #10#13 +
      'WHERE RP.IDREMESSAPREVIA = ' + IntToStr(pIdentificador) + #10#13 +
      '      AND RPD.CODDOCARQ = ' + IntToStr(pCodDocArq);
  End
    // Andre Imakawa - SIG 60540 - Fim
  Else
  Begin
    sSQL := 'SELECT DP.IDFORCLI AS IDPESSOA,                                               ' + #10#13 +
      '       DP.IDTITULAR AS IDTITULAR,                                                   ' + #10#13 +
      '       DP.RAZAOSOCIAL AS NOME,                                                      ' + #10#13 +
      '	      "" AS MATRICULA,                                                             ' + #10#13 +
      '       TO_CHAR(DP.IDFORCLI) || '','' || TO_CHAR(DP.IDTITULAR) AS IDPESSOAETITULAR   ' + #10#13 +
      'FROM ARQUIVOXDOCUM AD                                                              ' + #10#13 +
      'JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AD.IDARQUIVOPAGTO                      ' + #10#13 +
      'JOIN DOCUMENTOXPESSOAS DP ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS  ' + #10#13 +
      'WHERE AP.IDARQUIVOPAGTO = ' + IntToStr(pIdentificador) + #10#13 +
      '      AND AD.CODDOCARQ = ' + IntToStr(pCodDocArq);
  End;
  qryArquivoxDocum.SQL.Text := sSQL;

    pIdPessoa := qryArquivoxDocum.FieldByName('IDPESSOA').AsString;
    pIdTitular := qryArquivoxDocum.FieldByName('IDTITULAR').AsString;
    pNome := qryArquivoxDocum.FieldByName('NOME').AsString;
    pMatricula := qryArquivoxDocum.FieldByName('MATRICULA').AsString;
    Result := qryArquivoxDocum.FieldByName('IDPESSOAETITULAR').AsString;

    qryArquivoxDocum.Close;
  End;

  // finally
   //  FreeAndNil(qryArquivoxDocum);
  // end;
End;      }
// Paulo Nobre - WO6246 - Fim

// Andre Imakawa - SIG 116097 - Inicio
Procedure TFrmAberturaFitaCredito.Monitoramento(pRotina: String; ptipo: Integer; pErro: String = '');
Var lParams: TStringList;
  lResponse: TStringStream;
  sHeader, sUsuario, sHorario, sErro, sMensagem, sIdExec: String;
  sGrupo, sQuebra: String;
  dia: TDateTime;
  sMaquina, sRetorno: String;
Begin
  Inherited;

  exit;                                           // Paulo Nobre - WO6246

  sQuebra := ' \ue008\ue007\ue000';

  If Copy(UpperCase(Sistema.AliasServidor), 1, 8) <> 'PRODUCAO' Then
    sGrupo := 'Checklist Sistemas'
  Else
    sGrupo := 'Monitoramento';

  Try
    Try

      Case ptipo Of
        0: sHeader := ' - INICIO';
        1: sHeader := ' - FIM';
      End;
      sHeader := sHeader + '';

      sUsuario := 'USUARIO: ' + Sistema.NomeUsuario;
      sHorario := 'HORARIO: ' + formatdatetime('dd/mm/yyyy hh:nn:ss', now);
      sMaquina := 'MAQUINA: ' + UpperCase(trim(FuncaoGeral.GetNomeComputador));
      sErro := 'MSG: ' + pErro;

      lParams := TStringList.Create;
      lResponse := TStringStream.Create('');

      Case ptipo Of
        0, 1: sMensagem := '{"numero":"' + sGrupo + '","mensagem":"' + pRotina + sHeader + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina + '"}';
        2: sMensagem := '{"numero":"' + sGrupo + '","mensagem":"' + pRotina + sHeader + sQuebra + sErro + sQuebra + sUsuario + sQuebra + sHorario + sQuebra + sMaquina + '"}';
      End;

      FuncaoGeral.RequestAPI('http://mw.funcef.com.br:5000/api/envia', sMensagem, sRetorno, 'application/json', '');
    Except
      On E: Exception Do
      Begin

      End;
    End;
  Finally
    FreeAndNil(lParams);
    FreeAndNil(lResponse);
  End;
End;
// Andre Imakawa - SIG 116097 - Fim

// Paulo Nobre - WO6246 - Inicio
Procedure TFrmAberturaFitaCredito._CarregarMatriculas(pLinha: String; pArquivoPrevia: Boolean);
Var
  sSql: String;
Begin
  Inherited;

  Screen.Cursor := crSQLWait;
  sSql := '';
  cdsMatriculas.Active := false;

  If pArquivoPrevia Then
  Begin
    sSql := '       SELECT RPD.CODDOCARQ,                                                                     ';
    sSql := sSql + '       RPD.IDRESPONSAVEL AS IDPESSOA,                                                     ';
    sSql := sSql + '       RPD.IDTITULAR AS IDTITULAR,                                                        ';
    sSql := sSql + '       P.NOME As NOME,                                                                    ';
    sSql := sSql + '       RPD.MATRICULA AS MATRICULA,                                                        ';
    sSql := sSql + '      (TO_CHAR(RPD.IDRESPONSAVEL)|| '','' || TO_CHAR(RPD.IDTITULAR)) As IDPESSOAETITULAR  ';
    sSql := sSql + 'FROM CM.REMESSAPREVIA RP                                                                  ';
    sSql := sSql + 'INNER JOIN CM.REMESSAPREVIA_DETALHE RPD ON RP.IDREMESSAPREVIA = RPD.IDREMESSAPREVIA       ';
    sSql := sSql + 'INNER JOIN CM.PESSOA P ON P.IDPESSOA = RPD.IDRESPONSAVEL                                  ';
    sSql := sSql + 'WHERE RP.IDREMESSAPREVIA = ' + copy(pLinha, 158, 6); // IDREMESSAPREVIA
    sSql := sSql + ' ORDER BY RPD.CODDOCARQ                                                                   ';
  End
  Else
  Begin
    qryArqPagto.Close;
    qryArqPagto.Params[0].AsInteger := StrToInt(copy(pLinha, 33, 6)); // NUMEMPRESABANCO
    qryArqPagto.Params[1].AsInteger := StrToInt(copy(pLinha, 158, 6)); // NSA
    qryArqPagto.Open;

    sSql := '       SELECT AD.CODDOCARQ,                                                                    ';
    sSql := sSql + '       DP.IDFORCLI AS IDPESSOA,                                                         ';
    sSql := sSql + '       DP.IDTITULAR AS IDTITULAR,                                                       ';
    sSql := sSql + '       DP.RAZAOSOCIAL AS NOME,                                                          ';
    sSql := sSql + '       DE.MATRICULA AS MATRICULA,                                                       ';
    sSql := sSql + '       (TO_CHAR(DP.IDFORCLI) || '','' || TO_CHAR(DP.IDTITULAR)) AS IDPESSOAETITULAR     ';
    sSql := sSql + 'FROM ARQUIVOXDOCUM AD                                                                   ';
    sSql := sSql + 'JOIN DOCUMENTOXPESSOAS DP ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.IDDOCUMENTOXPESSOAS       ';
    sSql := sSql + 'JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AD.IDARQUIVOPAGTO                           ';
    sSql := sSql + 'JOIN DEPENTIT DE ON DE.IDTITULAR = DP.IDTITULAR AND DE.IDPESSOA = DP.IDFORCLI           ';
    sSql := sSql + 'WHERE AP.IDARQUIVOPAGTO = ' + qryArqPagto.Fieldbyname('IDARQUIVOPAGTO').asString;
    sSql := sSql + ' ORDER BY AD.CODDOCARQ                                                                  ';

  End;

  cdsMatriculas.data := Padroes.GetDataPacket(sSql);
  Screen.Cursor := crDefault;
End;
// Paulo Nobre - WO6246 - Fim

End.

