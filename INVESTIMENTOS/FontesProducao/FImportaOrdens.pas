//******************************************************************************
//Data	      : 22/06/2011
//Responsável : Otacilio
//Kintana     : 1229326
//SOL         : 155955/4501
//Motivo(S)   : Alteração na regra da boleta para inclusão da carteira junto ao agrupamento já existente
//******************************************************************************
//Data	    : 01/12/2010
//Analista  : Paulo Nobre
//Kintana   : 1047986
//SOL       : 148648
//Motivo(S) : Colocado o parâmetro correto da Carteira, na função RetornaQtde()
//******************************************************************************
//Data	    : 09/06/2010
//Analista  : Adilson Filho
//Kintana   : 829671
//SOL       : 137349
//Motivo(S) : Funcionalidade LocalizadePara(), como solução para considerar o
//            id da carteira de investimento inserido no campo idcarteirainvest
//            na tabela custodianteplano
//******************************************************************************
//Data	    : 23/09/2009
//Analista  : Thiago Passos
//Pendencia : 636261
//SOL       : 124733
//Motivo(S) : Implementação do Layout Bradesco
//******************************************************************************
//Data	    : 13/05/2008
//Código    : Al_6
//Pendencia : 25997
//SOL       : 65587
//Motivo(S) : Testar periodo contabil antes da importação.
//******************************************************************************
//Data	    : 09/08/2006
//Código    : Al_5
//Pendencia : 25728
//SOL       : 63282
//Motivo(S) : Implementação do acesso as carteiras por grupo
//******************************************************************************
//Data	    : 25/07/2006
//Código    : Al_4
//Pendencia : 99999
//SOL       :
//Motivo(S) : Implementação de segregação de Planos
//******************************************************************************
//Data	    : 12/04/2006
//Código    : Al_3
//Pendencia :
//SOL       : 42169
//Motivo(S) : Implementação de Crítica para quantidade da ordem iqual a zero
//******************************************************************************
// Data     : 11/02/2005
// Código   : AL_2  (AL_1 está na versão Beta)
// Motivo   : Alteração na query da rotina PosicionaNumDocumento para gerar novas
//            boletas no caso de operações CCI e Normais na mesma corretora
//            no mesmo dia
//            Alterado tb o Layout do form e o SQL da query qryOperacoes (DFM)
//******************************************************************************

Unit FImportaOrdens;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Db,
   DBTables, Wwquery, wwdblook, ComObj, USistema, FOkCancelarInv,
   faMensagem, fcLabel, uCtrlAcessoCarteira, uCtrlPadroes, uCtrlParamInvest,
   DBClient, uCMClientDataSet, UBibliotecaInvest, uCtrlRendaVariavel, UOperComum,
   //Al_6
   uCtrlInvContab, Grids, DBGrids, Menus;

Type
   TfrmImportaOrdens = Class(TfrmOkCancelarInv)
      OpenDialog1: TOpenDialog;
      fraMens: TfraMensagem;
      pnlDados: TPanel;
      Label1: TLabel;
      SB1: TSpeedButton;
      edtArquivo: TEdit;
      DBGrid1: TDBGrid;
      Label2: TLabel;
      DsOrdem: TDataSource;
      PopupMenu1: TPopupMenu;
      ExcluirImportao1: TMenuItem;
      QryOrdem: TQuery;
      QryOrdemCodigoImportao: TFloatField;
      QryOrdemDataOperao: TDateTimeField;
      QryOrdemConferncia: TFloatField;
      QryOrdemAutoriza: TFloatField;
      QryOrdemCalculaDespesa: TFloatField;
      QryOrdemTotalOrdensImportadas: TFloatField;
    Label3: TLabel;
    StaticText1: TStaticText;
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure SB1Click(Sender: TObject);

      Function DataHoraImp: TDateTime;
      Function LocalizaDePara(sCampo, CarteiraCustodiante: String; iCodContaInvestimento: integer; IdCustodiante: integer): integer;
      Function RetornaIdInvestimento(CodigoAcaoBolsa: String; BolsaValores: String): integer;
      Function RetornaCorretora(sCorretora: String): Integer;
      Function RetornaTipoOperacao(sOperacao: String; iCodContaInvestimento: integer; idCodigoCustodiante: String): Integer;
      Function RetornaBolsadeValores(sBolsa: String): integer;
      Function RetornaStatusMovInv: String;
      Function RetornaQtde(fQtde: Double; sNaturezaOperacao: String): Double;

      Procedure ValidaImportacao;
      Procedure InsereTabTemp;
      Procedure ImportaOrdens;
      Procedure ExcluiImportacao(iCodigoImportacao: integer);
      Procedure FormCreate(Sender: TObject);
      Procedure PopupMenu1Popup(Sender: TObject);
      Procedure ExcluirImportao1Click(Sender: TObject);


   Private
      { Private declarations }
      CtrlAcessoCart: TCtrlAcessoCarteira;
      cdsCarteiras: TCMClientDataSet;
      CtrlRV: TCtrlRendaVariavel;

      // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
      procedure BuscaValorRegraBoleta;
   Public
      { Public declarations }
      RegOrdens: Record
         iSequencia: integer;
         sDataOperacao: String;
         sCarteira: String;
         sNaturezaOperacao: String;
         sOperacao: String;
         sCorretora: String;
         sAgenteCompensacao: String;
         sBolsa: String;
         sPraca: String;
         sPapel: String;
         fQuantidade: Double;
         fPreco: Double;
         sCorretagem: String;
         fDevolucaoCorretagem: Double;
         sCodigoLocalCustodia: String;
         dDataHora: TDateTime;
         IdCarteiraInvest: integer;
         sTipoPapel: String;
         sClearing: String;
         sSubSegmentoSPC: String;
         iCodContaInvestimento: integer;
         sLinhaFormatada: String;
      End;
   End;

   // DialogBox com Duracao para fechar.
   TMessageDlgTimer = Class(TComponent)
   Private
      // Variaveis Privadas
      FrmShowMessage: TForm;
      FDuracao: Integer;
      Timer: TTimer;
      Inicio: TTime;

   Public
      // Procedimentos Publicos
      Procedure Mostrar(Titulo, Mensagem: String; Duracao: Integer);
      Procedure Fechar;
      Procedure MessageDlgTimer(Sender: TObject);

      Procedure SetDuracao(iDuracao: Integer);

      Property Duracao: Integer Read FDuracao Write SetDuracao;
   End;
Var
   frmImportaOrdens: TfrmImportaOrdens;

Implementation

Uses UDiasUteisInv, fAguarde, DBaseDados, UDataBase, UMensErro;

{$R *.DFM}

Procedure TMessageDlgTimer.Mostrar(Titulo, Mensagem: String; Duracao: Integer);
Begin
   // Cria Objetos Locais
   Timer := TTimer.Create(Nil);

   // Cria Caixa de Dialogo propria
   FrmShowMessage := CreateMessageDialog(Mensagem, mtInformation, [mbOK]);
   FrmShowMessage.Caption := Titulo;

   // Guarda o Inicio e Dispara o Timer
   Inicio := Time;

   // Parametriza o Timer
   Timer.Interval := 4000;
   Timer.OnTimer := MessageDlgTimer;
   Timer.Enabled := True;

   SetDuracao(Duracao);

   // mostra Caixa de Dialogo
   FrmShowMessage.ShowModal;
End;

Procedure TMessageDlgTimer.Fechar;
Begin
   FDuracao := 0;
   MessageDlgTimer(Self);
End;

//------------------------------------------------------------------------------
// Tempo do Objeto

Procedure TMessageDlgTimer.MessageDlgTimer(Sender: TObject);
Begin
   // Caso caixa não tenha sido Fechada, Fecha Libera
   If (StrToInt(FormatDateTime('NN', Time - Inicio)) >= FDuracao) Then Begin
         Try
            // Fecha o DialogBox
            FrmShowMessage.Close;
            // Desliga Timer
            Timer.OnTimer := Nil;
            Timer.Enabled := False;
         Finally
         End;
      End;
End;

Procedure TMessageDlgTimer.SetDuracao(iDuracao: Integer);
Begin
   If iDuracao > 60 Then Begin
         iDuracao := 60;
      End;
   FDuracao := iDuracao;
End;

Procedure TfrmImportaOrdens.bbtnConfirmarClick(Sender: TObject);
Var
   QryDadosTemp: TwwQuery;
   dHora: TDateTime;
   Mensagem: TMessageDlgTimer;
   Arquivo: TStringList;
   iLinha: integer;
   sLogErro: TStringList;
   sNomeLog: String;
   sDelimitador: String;
   sArquivoFormatado: TStringList;
   sCabecalho: String;
Begin
   sDelimitador := '#';
   Arquivo := TStringList.Create();
   sArquivoFormatado := TStringList.Create();
   //Valida Existencia do Arquivo
   If Trim(edtArquivo.Text) = '' Then
      Begin
         MsgDlg('Arquivo não Informado', 'Mensagem do Sistema', MtWarning, [mbok], 0);
         abort;
      End;

   // Testa se Arquivo Especificado Existe
   If Not (FileExists(edtArquivo.Text)) Then
      Begin
         MsgDlg('O Arquivo não Existe ou é Inválido', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Abort;
      End;

   //Carrega o Arquivo em Memoria
   Arquivo.LoadFromFile(edtArquivo.Text);

   //Identifica o cabecalho do arquivo
   If Trim(Arquivo.Strings[0]) <> '0#RV' Then
      Begin
         Showmessage('Arquivo Inválido !' + chr(13) + 'O cabeçalho não está no padrão do arquivo de Renda Variável');
         abort;
      End;

   QryDadosTemp := TwwQuery.Create(Nil);
   QryDadosTemp.DatabaseName := 'BaseDados';
   QryDadosTemp.Close;
   QryDadosTemp.SQL.Clear;
   dHora := DataHoraImp;
   //Loop Principal da Importacao
   ExecutaQuery(QryDadosTemp, 'DELETE FROM INVESTIMENTOGLOBAL WHERE IDCHAVETEMP =''ORDTEMP'' ');
   ExecutaQuery(QryDadosTemp, 'DELETE FROM INVESTIMENTOGLOBAL WHERE IDCHAVETEMP =''ORDMOVERR'' ');
   For iLinha := 0 To Arquivo.Count - 1 Do
      Begin
         //Mapea os campos do arquivo

         If Arquivo.Strings[iLinha] = '99#RV' Then //Se for o rodape sai do loop
            break;

         If Trim(Arquivo.Strings[iLinha]) <> '0#RV' Then //Se for o Cabecalho, pula
            Begin
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));
               RegOrdens.iSequencia := iLinha;

               //Data da Operacao
               RegOrdens.sDataOperacao := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               RegOrdens.sDataoperacao := Trim(Copy(RegOrdens.sDataoperacao, 7, 2)) + '/' + Trim(Copy(RegOrdens.sDataoperacao, 5, 2)) + '/' + Trim(Copy(RegOrdens.sDataoperacao, 1, 4));
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Plano/Patro (Fazer De/Para)
               RegOrdens.sCarteira := inttostr(strtoint(copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1)));
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Compra e Venda
               RegOrdens.sNaturezaOperacao := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Tipo de Movimento
               RegOrdens.sOperacao := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Praça
               RegOrdens.sBolsa := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Papel
               RegOrdens.sPapel := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Tipo de Papel
               RegOrdens.sTipoPapel := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Corretora
               RegOrdens.sCorretora := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Ag. Compensacao
               RegOrdens.sAgenteCompensacao := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Quantidade
               RegOrdens.fQuantidade := StrToFloat(copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1));
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Preço
               RegOrdens.fPreco := StrToFloat(copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1));
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Devolução de Corretagem
               RegOrdens.fDevolucaoCorretagem := StrToFloat(copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1));
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Corretagem
               RegOrdens.sCorretagem := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Clearing
               RegOrdens.sClearing := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Local da Custodia
               RegOrdens.sCodigoLocalCustodia := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //SubSegmentoSPC
               RegOrdens.sSubSegmentoSPC := copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1);
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

               //Cod Conta Investimento
               RegOrdens.iCodContaInvestimento := StrToInt(copy(Arquivo.Strings[iLinha], 1, pos(sDelimitador, Arquivo.Strings[iLinha]) - 1));
               Arquivo.Strings[iLinha] := copy(Arquivo.Strings[iLinha], Pos(sDelimitador, Arquivo.Strings[iLinha]) + 1, Length(Arquivo.Strings[iLinha]));

//               RegOrdens.IdCarteiraInvest := 0;
               RegOrdens.dDataHora := dHora;

               RegOrdens.sLinhaFormatada := RegOrdens.sDataOperacao;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sCarteira;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sNaturezaOperacao;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sOperacao;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sBolsa;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sPapel;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sTipoPapel;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sCorretora;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sAgenteCompensacao;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + FloatToStr(RegOrdens.fQuantidade);
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + FloatToStr(RegOrdens.fPreco);
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + FloatToStr(RegOrdens.fDevolucaoCorretagem);
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sCorretagem;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sClearing;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sCodigoLocalCustodia;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + RegOrdens.sSubSegmentoSPC;
               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + IntToStr(RegOrdens.iCodContaInvestimento);
//               RegOrdens.sLinhaFormatada := RegOrdens.sLinhaFormatada + ';' + IntToStr(RegOrdens.IdCarteiraInvest);

               sArquivoFormatado.Add(RegOrdens.sLinhaFormatada);
               //Al_6
               //Testa periodo contabil antes da importação.

               If iLinha = 1 Then //Verifica só a primeira vez do Loop, senao fica lento e desnecessario
                  Begin
                     If Not CtrlInvContab.TestaPeriodo(RegOrdens.sDataOperacao, iTipoInvestUsu) Then
                        Begin
                           MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
                           Exit;
                        End;
                  End;
               InsereTabTemp;

            End; //Fim do "Se for cabecalho, pula"
      End; //Fim do Loop

   ValidaImportacao;

   QryDadosTemp.Close;
   QryDadosTemp.SQL.Clear;
   FazQuery(QryDadosTemp, 'SELECT CAMPO1 LINHA ,CAMPO2 MENSAGEM FROM INVESTIMENTOGLOBAL WHERE IDCHAVETEMP =''ORDMOVERR'' ');

   If QryDadosTemp.RecordCount = 0 Then
      Begin
         ImportaOrdens;
         QryOrdem.Close;
         QryOrdem.Open;
         ShowMessage('Importação Realizada com Sucesso');
      End
   Else
      Begin
         sLogErro := TStringList.Create;
         sNomeLog := Sistema.RetornaCaminhoArquivos(Sistema.idEmpresa) + '\RV_LogErroImportacaoOrdens_' + FormatDateTime('ddmmyyyy_hhmm', (now)) + '.csv';
         sLogErro.Add(';Log de Inconsistencia - Gerado na Importação de dados do RV em ' + FormatDateTime('dd/mm/yyyy hh:mm', (now)));

         sCabecalho := 'Linha;Mensagem;Data de Operação;Plano[Bradesco];Compra/Venda;';
         sCabecalho := sCabecalho + 'Tipo Movimento;Praça;Papel;Tipo do Papel;Corretora;Ag.Compensação;';
         sCabecalho := sCabecalho + 'Quantidade;Preço;Devolução de Corretagem;Corretagem;Clearing;';
         sCabecalho := sCabecalho + 'Local Custodia;SubSegmento SPC;Cód. Conta Investimento;Carteira Invest[Funcef]';

         sLogErro.Add(sCabecalho);
         While Not QryDadosTemp.Eof Do
            Begin
               sLogErro.Add(IntToStr(QryDadosTemp.FieldByName('Linha').AsInteger + 1) + ';' + QryDadosTemp.FieldByName('Mensagem').Asstring + ';' + sArquivoFormatado.Strings[QryDadosTemp.FieldByName('Linha').AsInteger - 1]);
               QryDadosTemp.Next;
            End;
         sLogErro.SaveToFile(sNomeLog);

         showmessage('Ocorreram ' + IntToStr(QryDadosTemp.RecordCount) + ' erros na Importacao ' + chr(13) + 'Verifique o Log em ' + sNomeLog);
      End;
   edtArquivo.text := '';

   FreeAndNil(sLogErro);
   FreeAndNil(QryDadosTemp);
   FreeAndNil(Arquivo);
   FreeAndNil(sArquivoFormatado);

End;

Procedure TfrmImportaOrdens.FormShow(Sender: TObject);
Begin
   Inherited;
   QryOrdem.Close;
   QryOrdem.Open;

   fraMens.Apaga;

   // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
   BuscaValorRegraBoleta;
End;

Procedure TfrmImportaOrdens.SB1Click(Sender: TObject);
Begin

   If (OpenDialog1.Execute) Then
      edtArquivo.Text := UpperCase(OpenDialog1.FileName);

End;

Function TfrmImportaOrdens.DataHoraImp: TDateTime;
Var
   QryHora: TwwQuery;
Begin
   QryHora := TwwQuery.Create(Nil);
   QryHora.DataBaseName := 'BaseDados';
   FazQuery(QryHora, 'SELECT SYSDATE FROM DUAL');
   Result := QryHora.FieldByName('Sysdate').AsDateTime;
   FreeAndNil(QryHora);
End;

Function TfrmImportaOrdens.LocalizaDePara(sCampo, CarteiraCustodiante: String; iCodContaInvestimento: integer; IdCustodiante: integer): integer;
Var QryAux: TwwQuery;
Begin
   // Localiza Plano/Patro ou Carteira (Planus)
   QryAux := TwwQuery.Create(Nil);
   QryAux.DatabaseName := 'BaseDados';
   FazQuery(QryAux, 'SELECT idplanprevctbpatr, idcarteirainvest FROM custodianteplano WHERE idcustodiante = ' + IntToStr(idcustodiante) + ' AND CodigoCustodiante = ' + QuotedStr(CarteiraCustodiante) + ' AND CodigoContaInvestimento = ' + IntToStr(iCodContaInvestimento));
   If QryAux.RecordCount > 0 Then
      Begin
         If sCampo = 'P' Then
            result := QryAux.FieldByName('idplanprevctbpatr').AsInteger
         Else // 'C'
            result := QryAux.FieldByName('idcarteirainvest').AsInteger;
      End
   Else
      result := 0;
   QryAux.Close;
   FreeAndNil(QryAux);
End;

Function TfrmImportaOrdens.RetornaIdInvestimento(CodigoAcaoBolsa, BolsaValores: String): integer;
Var
   QryBuscaInv: TwwQuery;
   sSQL: String;
Begin

   QryBuscaInv := TwwQuery.Create(Nil);
   QryBuscaInv.DatabaseName := 'BaseDados';
   sSQL := 'SELECT IdAcao FROM ACOESXBOLSA ACAO,BOLSAVALORES BV ';
   sSQL := sSQL + '  WHERE ACAO.siglaacaobolsa = ' + QuotedStr(Trim(CodigoAcaoBolsa));
   sSQL := sSQL + '  AND   BV.sglbolsavalores = ' + UpperCase(QuotedStr(Trim(BolsaValores)));
   sSQL := sSQL + '  AND   ACAO.idbolsavalores = BV.idbolsavalores ';

   FazQuery(QryBuscaInv, sSQL);

   If QryBuscaInv.RecordCount > 0 Then
      result := QryBuscaInv.FieldByName('IdAcao').Asinteger
   Else
      result := 0;

   FreeAndNil(QryBuscaInv);
End;

Procedure TfrmImportaOrdens.InsereTabTemp;
Var
   QryTemp: TwwQuery;
Begin
   QryTemp := TwwQuery.Create(Nil);
   QryTemp.DatabaseName := 'BaseDados';
   QryTemp.Close;
   QryTemp.SQL.Clear;
   QryTemp.SQL.Add(' INSERT INTO CM.INVESTIMENTOGLOBAL(IDCHAVETEMP                     ');
   QryTemp.SQL.Add('                               ,IDINVESTIMENTO                  ');
   QryTemp.SQL.Add('                               ,IDPLANPREVCTBPATR               ');
   QryTemp.SQL.Add('                               ,CAMPO1 --IDORDMOVINV            ');
   QryTemp.SQL.Add('                               ,CAMPO2 --DATAORDMOVINV          ');
   QryTemp.SQL.Add('                               ,CAMPO3 --IDUSUARIO              ');
   QryTemp.SQL.Add('                               ,CAMPO4 --IDTIPOINVEST           ');
   QryTemp.SQL.Add('                               ,CAMPO5 --IDCARTEIRAINVEST       ');
   QryTemp.SQL.Add('                               ,CAMPO6 --IDCARTEIRAGERENC       ');
   QryTemp.SQL.Add('                               ,CAMPO7 --IDCORRETVALORES        ');
   QryTemp.SQL.Add('                               ,CAMPO8 --IDTIPOOPERACAO         ');
   QryTemp.SQL.Add('                               ,CAMPO9 --IDBOLSAVALORES         ');
   QryTemp.SQL.Add('                               ,CAMPO10 --IDCUSTODIANTE         ');
   QryTemp.SQL.Add('                               ,CAMPO11 --STAMOVINV             ');
   QryTemp.SQL.Add('                               ,CAMPO12 --QTDEORDENADA          ');
   QryTemp.SQL.Add('                               ,CAMPO13 --PUORDMOVINV           ');
   QryTemp.SQL.Add('                               ,CAMPO14 --NUMDOCMOVINV          ');
   QryTemp.SQL.Add('                               ,CAMPO15 --SEQUENCIAL            ');
   QryTemp.SQL.Add('                               ,CAMPO16 --SEQUENCIAL            ');
   QryTemp.SQL.Add('                               ,CAMPO17 --SEQUENCIAL            ');
   QryTemp.SQL.Add('                               )VALUES                          ');
   QryTemp.SQL.Add('                              ( :IDCHAVETEMP                     ');
   QryTemp.SQL.Add('                               ,:IDINVESTIMENTO                  ');
   QryTemp.SQL.Add('                               ,:IDPLANPREVCTBPATR               ');
   QryTemp.SQL.Add('                               ,:IDORDMOVINV                     ');
   QryTemp.SQL.Add('                               ,:DATAORDMOVINV                   ');
   QryTemp.SQL.Add('                               ,:IDUSUARIO                       ');
   QryTemp.SQL.Add('                               ,:IDTIPOINVEST                    ');
   QryTemp.SQL.Add('                               ,:IDCARTEIRAINVEST                ');
   QryTemp.SQL.Add('                               ,:IDCARTEIRAGERENC                ');
   QryTemp.SQL.Add('                               ,:IDCORRETVALORES                 ');
   QryTemp.SQL.Add('                               ,:IDTIPOOPERACAO                  ');
   QryTemp.SQL.Add('                               ,:IDBOLSAVALORES                  ');
   QryTemp.SQL.Add('                               ,:IDCUSTODIANTE                   ');
   QryTemp.SQL.Add('                               ,:STAMOVINV                       ');
   QryTemp.SQL.Add('                               ,:QTDEORDENADA                    ');
   QryTemp.SQL.Add('                               ,:PUORDMOVINV                     ');
   QryTemp.SQL.Add('                               ,:NUMDOCMOVINV                    ');
   QryTemp.SQL.Add('                               ,:SEQUENCIAL                      ');
   QryTemp.SQL.Add('                               ,''I''                            ');
   QryTemp.SQL.Add('                               ,''S''                            ');
   QryTemp.SQL.Add('                              )                                  ');

   QryTemp.ParamByName('IDCHAVETEMP').DataType := ftString;
   QryTemp.ParamByName('IDCHAVETEMP').AsString := 'ORDTEMP';

   QryTemp.ParamByName('IDINVESTIMENTO').DataType := ftInteger;
   QryTemp.ParamByName('IDINVESTIMENTO').AsInteger := RetornaIdInvestimento(RegOrdens.sPapel, RegOrdens.sBolsa);

   QryTemp.ParamByName('IDPLANPREVCTBPATR').DataType := ftInteger;
   QryTemp.ParamByName('IDPLANPREVCTBPATR').AsInteger := LocalizaDePara('P', RegOrdens.sCarteira, RegOrdens.iCodContaInvestimento, CtrlPInv.IdCustoDiaRenFix);

   QryTemp.ParamByName('IDORDMOVINV').DataType := ftString;
   QryTemp.ParamByName('IDORDMOVINV').AsString := IntToStr(LeUltRegistro(Nil, 'ORDMOVINV'));

   QryTemp.ParamByName('DATAORDMOVINV').DataType := ftString;
   QryTemp.ParamByName('DATAORDMOVINV').AsString := RegOrdens.sDataOperacao;

   QryTemp.ParamByName('IDUSUARIO').DataType := ftString;
   QryTemp.ParamByName('IDUSUARIO').AsString := IntToStr(Sistema.IdUsuario);

   QryTemp.ParamByName('IDTIPOINVEST').DataType := ftString;
   QryTemp.ParamByName('IDTIPOINVEST').AsString := '2'; // Renda Variável

   QryTemp.ParamByName('IDCARTEIRAINVEST').DataType := ftInteger; //Adilson Kintana: 928394 SOL: 143356
   QryTemp.ParamByName('IDCARTEIRAINVEST').AsInteger := LocalizaDePara('C', RegOrdens.sCarteira, RegOrdens.iCodContaInvestimento, CtrlPInv.IdCustoDiaRenFix); // Adilson Kintana: 928394 SOL: 143356

   QryTemp.ParamByName('IDCARTEIRAGERENC').DataType := ftString;
   QryTemp.ParamByName('IDCARTEIRAGERENC').AsString := '';

   QryTemp.ParamByName('IDCORRETVALORES').DataType := ftString;
   QryTemp.ParamByName('IDCORRETVALORES').AsString := IntToStr(RetornaCorretora(RegOrdens.sCorretora));

   QryTemp.ParamByName('IDTIPOOPERACAO').DataType := ftString;
   QryTemp.ParamByName('IDTIPOOPERACAO').AsString := IntToStr(RetornaTipoOperacao(RegOrdens.sNaturezaOperacao, RegOrdens.iCodContaInvestimento, RegOrdens.sCarteira));

   QryTemp.ParamByName('IDBOLSAVALORES').DataType := ftString;
   QryTemp.ParamByName('IDBOLSAVALORES').AsString := IntTostr(RetornaBolsadeValores(RegOrdens.sBolsa));

   QryTemp.ParamByName('IDCUSTODIANTE').DataType := ftString;
   QryTemp.ParamByName('IDCUSTODIANTE').AsString := inttostr(CtrlPInv.IdCustoDiaRenFix); // 10 = Bradesco

   QryTemp.ParamByName('STAMOVINV').DataType := ftString;
   QryTemp.ParamByName('STAMOVINV').AsString := RetornaStatusMovInv;

   QryTemp.ParamByName('QTDEORDENADA').DataType := ftString;
   QryTemp.ParamByName('QTDEORDENADA').AsString := FloatToStr(RetornaQtde(RegOrdens.fQuantidade, RegOrdens.sNaturezaOperacao));

   QryTemp.ParamByName('PUORDMOVINV').DataType := ftString;
   QryTemp.ParamByName('PUORDMOVINV').AsString := FloatToStr(OperComum.Trunca(RegOrdens.fPreco, 8));

   QryTemp.ParamByName('NUMDOCMOVINV').DataType := ftString;
   QryTemp.ParamByName('NUMDOCMOVINV').AsString := '';

   QryTemp.ParamByName('SEQUENCIAL').DataType := ftString;
   QryTemp.ParamByName('SEQUENCIAL').AsString := InttoStr(RegOrdens.iSequencia);

   QryTemp.ExecSQL;
   FreeAndNil(QryTemp);
End;

Function TfrmImportaOrdens.RetornaCorretora(sCorretora: String): Integer;
Var
   QryAux: TwwQuery;
Begin
   QryAux := TwwQuery.Create(Nil);

   QryAux.DatabaseName := 'BaseDados';
   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add('SELECT IdCorretValores FROM CORRETVALORES WHERE SglCorretCustodiante = ' + QuotedStr(Trim(sCorretora)));
   QryAux.Open;

   If QryAux.RecordCount > 0 Then
      result := QryAux.FieldByName('IdCorretValores').AsInteger Else result := 0;

   FreeAndNil(QryAux);
End;

Function TfrmImportaOrdens.RetornaTipoOperacao(sOperacao: String; iCodContaInvestimento: integer; idCodigoCustodiante: String): Integer;
Var
   QryAux: TwwQuery;

Begin

   QryAux := TwwQuery.Create(Nil);
   QryAux.DataBaseName := 'BaseDados';

   FazQuery(QryAux, 'select nvl(idtipooperacaoVenda,0) idtipooperacaoVenda,nvl(idTipoOperacaoCompra,0) idTipoOperacaoCompra from custodianteplano where idtipoinvest = 2 and codigocontainvestimento = ' + IntTostr(iCodContaInvestimento) + ' and CodigoCustodiante = ' + QuotedStr(idcodigocustodiante));
   If QryAux.RecordCount > 0 Then
      Begin
         If UpperCase(sOperacao) = 'C' Then
            result := QryAux.FieldByName('idTipoOperacaoCompra').Asinteger
         Else If UpperCase(sOperacao) = 'V' Then
            result := QryAux.FieldByName('idTipoOperacaoVenda').Asinteger;
      End Else result := 0;

End;

Function TfrmImportaOrdens.RetornaBolsadeValores(sBolsa: String): integer;
Var
   QryAux: TwwQuery;

Begin
   QryAux := TwwQuery.Create(Nil);
   QryAux.DatabaseName := 'BaseDados';
   QryAux.Close;

   FazQuery(QryAux, 'SELECT IdBolsaValores FROM BolsaValores WHERE SglBolsaValores = ' + QuotedStr(sBolsa));
   If QryAux.RecordCount > 0 Then
      result := QryAux.FieldByName('IdBolsaValores').AsInteger Else Result := 0;

   FreeAndNil(QryAux);

End;

Function TfrmImportaOrdens.RetornaStatusMovInv: String;

Begin
   If Prpi.FLGORDMOVINV = 'N' Then
      result := 'A'
   Else
      result := '';
End;

Function TfrmImportaOrdens.RetornaQtde(fQtde: Double; sNaturezaOperacao: String): Double;
Begin
   If UpperCase(sNaturezaOperacao) = 'V' Then
      Begin
         CtrlRV.BuscaSaldoRV.Executa(StrToDate(RegOrdens.sDataOperacao), // Data
            LocalizaDePara('P', RegOrdens.sCarteira, RegOrdens.iCodContaInvestimento, 10), // Plano/Patro
            RetornaIdInvestimento(RegOrdens.sPapel, RegOrdens.sBolsa), // Investimento
            LocalizaDePara('C', RegOrdens.sCarteira, RegOrdens.iCodContaInvestimento, CtrlPInv.IdCustoDiaRenFix), // Carteira
            0,
            9999999, -1);

         If (fQtde > CtrlRV.BuscaSaldoRV.SaldoQtdTotal) Then
            result := 0
         Else
            result := fQtde;
      End
   Else
      result := fQtde;
End;

Procedure TfrmImportaOrdens.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlRV := TCtrlRendavariavel.Create;
   CtrlRV.InitializeAs(Padroes);
End;

Procedure TfrmImportaOrdens.ImportaOrdens;
Var
   QryImp: TwwQuery;
Begin

   If Not dtmbasedados.dbBaseDados.InTransaction Then
      dtmbasedados.dbBaseDados.StartTransaction;

   QryImp := TwwQuery.Create(Nil);
   QryImp.DatabaseName := 'BaseDados';
   QryImp.Close;
   QryImp.SQL.Clear;
   QryImp.SQL.Add(' DECLARE                                                    ');
   QryImp.SQL.Add(' vRegraBoleta NUMBER;                                       ');
   QryImp.SQL.Add(' vSQLBoleta VARCHAR2(4000);                                 ');
   QryImp.SQL.Add(' vBoleta VARCHAR2(20);                                      ');
   QryImp.SQL.Add(' vIdImportacao NUMBER;                                      ');

   QryImp.SQL.Add(' BEGIN                                                      ');

   // IMPORTACAO (INSERT NA TABELA ORDMOVINV)
   QryImp.SQL.Add('     SELECT regraboleta INTO vRegraBoleta FROM PARAMINVEST; ');

   QryImp.SQL.Add('     SELECT nvl(MAX(IDIMPORTACAO),0)+1 INTO vIdImportacao FROM ORDMOVINV ; ');

   // DATA/CORRETORA/PLANO  RegraBoleta = 0
   // DATA/CORRETORA        RegraBoleta = 1

   QryImp.SQL.Add('     FOR cBoleta IN ( SELECT TO_DATE(CAMPO2,''DD/MM/YYYY'') DATAORDMOVINV ');
   QryImp.SQL.Add('                            ,(CASE WHEN vRegraBoleta = 0 THEN IDPLANPREVCTBPATR ELSE NULL END) IDPLANPREVCTBPATR ');
   // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
   QryImp.SQL.Add('                            ,(CASE WHEN vRegraBoleta = 0 THEN CAMPO5 ELSE NULL END) IDCARTEIRAINVEST ');
   QryImp.SQL.Add('                            ,CAMPO7 IDCORRETVALORES ');
   QryImp.SQL.Add('                      FROM INVESTIMENTOGLOBAL  ');
   // Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
   QryImp.SQL.Add('                      GROUP BY TO_DATE(CAMPO2,''DD/MM/YYYY'') ,(CASE WHEN vRegraBoleta =0 THEN IDPLANPREVCTBPATR ELSE NULL END),CAMPO7, (CASE WHEN vRegraBoleta = 0 THEN CAMPO5 ELSE NULL END)) LOOP ');

   QryImp.SQL.Add('         --GERA UMA BOLETA '); // pnobreza
   QryImp.SQL.Add('SELECT ''RV-''||TO_CHAR(SYSDATE,''YY'')||''/''||LPAD(CM.SEQCONTDOCRENVAR' + FormatDateTime('YY', Now) + '.NEXTVAL,length(CM.SEQCONTDOCRENVAR' + FormatDateTime('YY', Now) + '.CURRVAL),''0'') INTO vBoleta FROM DUAL; ');

   QryImp.SQL.Add('         FOR cImp IN (SELECT IDCHAVETEMP                                                                                ');
   QryImp.SQL.Add('                            ,IDINVESTIMENTO                                                                             ');
   QryImp.SQL.Add('                            ,IDPLANPREVCTBPATR                                                                          ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO1) IDORDMOVINV                                                              ');
   QryImp.SQL.Add('                            ,TO_DATE(CAMPO2,''DD/MM/YYYY HH24:MI:SS'') DATAORDMOVINV                                                                       ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO3) IDUSUARIO                                                                ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO4) IDTIPOINVEST                                                             ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO5) IDCARTEIRAINVEST                                                         ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO6) IDCARTEIRAGERENC                                                         ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO7) IDCORRETVALORES                                                          ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO8) IDTIPOOPERACAO                                                           ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO9) IDBOLSAVALORES                                                           ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO10) IDCUSTODIANTE                                                           ');
   QryImp.SQL.Add('                            ,CAMPO11 STATMOVINV                                                                         ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO12) QTDEORDENADA                                                            ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO13) PUORDMOVINV                                                             ');
   QryImp.SQL.Add('                            ,CAMPO14 NUMDOCMOVINV                                                                       ');
   QryImp.SQL.Add('                            ,CAMPO15 SEQUENCIAL                                                                         ');
   QryImp.SQL.Add('                            ,CAMPO16 TIPOINCLUSAO                                                                       ');
   QryImp.SQL.Add('                      FROM INVESTIMENTOGLOBAL                                                                           ');
   QryImp.SQL.Add('                      WHERE IDCHAVETEMP = ''ORDTEMP''                                                                     ');
   QryImp.SQL.Add('                      AND   CAMPO17 = ''S'' --Os Registros Sem Erros                                                      ');
   QryImp.SQL.Add('                      AND   TO_DATE(CAMPO2,''DD/MM/YYYY'') = cBoleta.DataOrdMovInv                                        ');
   QryImp.SQL.Add('                      AND   CAMPO7 = cBoleta.IDCORRETVALORES                                                            ');
   QryImp.SQL.Add('                      AND   (cBoleta.IDPLANPREVCTBPATR IS NULL OR IDPLANPREVCTBPATR = cBoleta.IDPLANPREVCTBPATR )       ');
   QryImp.SQL.Add('                      AND   (cBoleta.IDCARTEIRAINVEST IS NULL OR CAMPO5 = cBoleta.IDCARTEIRAINVEST) ) LOOP ');

   QryImp.SQL.Add('                      INSERT INTO ORDMOVINV              ');
   QryImp.SQL.Add('                                 (IDORDMOVINV            ');
   QryImp.SQL.Add('                                , IDCORRETVALORES        ');
   QryImp.SQL.Add('                                , IDINVESTIMENTO         ');
   QryImp.SQL.Add('                                , PUORDMOVINV            ');
   QryImp.SQL.Add('                                , DATAORDMOVINV          ');
   QryImp.SQL.Add('                                , QTDEORDMOVINV          ');
   QryImp.SQL.Add('                                , NUMDOCMOVINV           ');
   QryImp.SQL.Add('                                , STATMOVINV             ');
   QryImp.SQL.Add('                                , IDUSUARIO              ');
   QryImp.SQL.Add('                                , IDTIPOINVEST           ');
   QryImp.SQL.Add('                                , IDTIPOOPERACAO         ');
   QryImp.SQL.Add('                                , IDCARTEIRAINVEST       ');
   QryImp.SQL.Add('                                , IDCARTEIRAGERENC       ');
   QryImp.SQL.Add('                                , IDBOLSAVALORES         ');
   QryImp.SQL.Add('                                , IDCUSTODIANTE          ');
   QryImp.SQL.Add('                                , QTDEORDENADA           ');
   QryImp.SQL.Add('                                , IDPLANPREVCTBPATR      ');
   QryImp.SQL.Add('                                , TIPOINCLUSAO          ');
   QryImp.SQL.Add('                                , OBSMOVINV              ');
   QryImp.SQL.Add('                                , IdImportacao)              ');

   QryImp.SQL.Add('                      VALUES                             ');
   QryImp.SQL.Add('                               (  cImp.IDORDMOVINV    ');
   QryImp.SQL.Add('                               ,  cImp.IDCORRETVALORES   ');
   QryImp.SQL.Add('                               ,  cImp.IdInvestimento    ');
   QryImp.SQL.Add('                               ,  cImp.PUORDMOVINV       ');
   QryImp.SQL.Add('                               ,  cImp.DATAORDMOVINV     ');
   QryImp.SQL.Add('                               ,  cImp.QTDEORDENADA      ');
   QryImp.SQL.Add('                               ,  vBoleta                ');
   QryImp.SQL.Add('                               ,  cImp.STATMOVINV        ');
   QryImp.SQL.Add('                               ,  cImp.IDUSUARIO         ');
   QryImp.SQL.Add('                               ,  cImp.IDTIPOINVEST      ');
   QryImp.SQL.Add('                               ,  cImp.IDTIPOOPERACAO    ');
   QryImp.SQL.Add('                               ,  cImp.IDCARTEIRAINVEST  ');
   QryImp.SQL.Add('                               ,  cImp.IDCARTEIRAGERENC  ');
   QryImp.SQL.Add('                               ,  cImp.IDBOLSAVALORES    ');
   QryImp.SQL.Add('                               ,  cImp.IDCUSTODIANTE     ');
   QryImp.SQL.Add('                               ,  cImp.QTDEORDENADA      ');
   QryImp.SQL.Add('                               ,  cImp.IDPLANPREVCTBPATR ');
   QryImp.SQL.Add('                               ,  cImp.TIPOINCLUSAO      ');
   QryImp.SQL.Add('                               ,  ''''  ');
   QryImp.SQL.Add('                               ,  vIdImportacao );  ');
   QryImp.SQL.Add('                      END LOOP; ');
   QryImp.SQL.Add('     END LOOP; ');
   QryImp.SQL.Add(' END;  ');
   QryImp.ExecSQL;

   dtmbasedados.dbBaseDados.Commit;

   FreeAndNil(QryImp);

End;

Procedure TfrmImportaOrdens.ValidaImportacao;
Var
   QryImp: TwwQuery;
Begin
   QryImp := TwwQuery.Create(Nil);
   QryImp.DatabaseName := 'BaseDados';
   QryImp.Close;
   QryImp.SQL.Clear;
   QryImp.SQL.Add('  DECLARE ');
   QryImp.SQL.Add(' vCount NUMBER; ');
   QryImp.SQL.Add(' BEGIN ');
   QryImp.SQL.Add('         FOR cImp IN (SELECT IDCHAVETEMP                                                                                ');
   QryImp.SQL.Add('                            ,IDINVESTIMENTO                                                                             ');
   QryImp.SQL.Add('                            ,IDPLANPREVCTBPATR                                                                          ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO1) IDORDMOVINV                                                              ');
   QryImp.SQL.Add('                            ,TO_DATE(CAMPO2,''DD/MM/YYYY'') DATAORDMOVINV                                    ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO3) IDUSUARIO                                                                ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO4) IDTIPOINVEST                                                             ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO5) IDCARTEIRAINVEST                                                         ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO6) IDCARTEIRAGERENC                                                         ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO7) IDCORRETVALORES                                                          ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO8) IDTIPOOPERACAO                                                           ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO9) IDBOLSAVALORES                                                           ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO10) IDCUSTODIANTE                                                           ');
   QryImp.SQL.Add('                            ,CAMPO11 STATMOVINV                                                                         ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO12) QTDEORDENADA                                                            ');
   QryImp.SQL.Add('                            ,TO_NUMBER(CAMPO13) PUORDMOVINV                                                             ');
   QryImp.SQL.Add('                            ,CAMPO14 NUMDOCMOVINV                                                                       ');
   QryImp.SQL.Add('                            ,CAMPO15 SEQUENCIAL                                                                         ');
   QryImp.SQL.Add('                            ,CAMPO16 TIPOINCLUSAO                                                                       ');
   QryImp.SQL.Add('                      FROM INVESTIMENTOGLOBAL                                                                           ');
   QryImp.SQL.Add('                      WHERE IDCHAVETEMP = ''ORDTEMP'') LOOP                                                             ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM INVESTIMENTO WHERE idinvestimento = cImp.IdInvestimento; ');
   QryImp.SQL.Add('              IF vCount = 0 THEN                                                                        ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Acao não encontrada no sistema''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM VWPLANPREVCTBPATR WHERE IDPLANPREVCTBPATR = cImp.IDPLANPREVCTBPATR; ');
   QryImp.SQL.Add('              IF vCount = 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Plano não encontrado no sistema''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM CARTEIRAINVEST WHERE IDCARTEIRAINVEST = cImp.idCarteiraInvest; ');
   QryImp.SQL.Add('              IF vCount = 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Carteira não encontrada no sistema''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM CORRETVALORES WHERE IDCORRETVALORES = cImp.IDCORRETVALORES; ');
   QryImp.SQL.Add('              IF vCount = 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Corretora não encontrada no sistema''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM TIPOOPERACAO WHERE IDTIPOOPERACAO = cImp.IDTIPOOPERACAO AND IDTIPOINVEST = 2; ');
   QryImp.SQL.Add('              IF vCount = 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Tipo de Operação não encontrada no sistema''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM BOLSAVALORES WHERE IDBOLSAVALORES = cImp.IDBOLSAVALORES; ');
   QryImp.SQL.Add('              IF vCount = 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Bolsa não encontrada no sistema''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              IF cImp.QTDEORDENADA = 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Quantidade está zerada no arquivo OU não há saldo suficiente para Venda ''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              IF cImp.PUORDMOVINV = 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Preco está zerado no arquivo''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('              END IF; ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM ORDMOVINV WHERE IDINVESTIMENTO    = cImp.IdInvestimento ');
   QryImp.SQL.Add('                                                         AND   IDCORRETVALORES   = cImp.IDCORRETVALORES ');
   QryImp.SQL.Add('                                                         AND   IDTIPOOPERACAO    = cImp.IDTIPOOPERACAO  ');
   QryImp.SQL.Add('                                                         AND   DATAORDMOVINV     = cImp.DATAORDMOVINV   ');
   QryImp.SQL.Add('                                                         AND   IDPLANPREVCTBPATR = cImp.IDPLANPREVCTBPATR ');
   QryImp.SQL.Add('                                                         AND   IDCARTEIRAINVEST  = cImp.IDCARTEIRAINVEST; '); // pnobreza

   QryImp.SQL.Add('             IF vCount > 0 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Essa operação já foi importada''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('             END IF; ');

   QryImp.SQL.Add('              SELECT COUNT(1) INTO vCount FROM INVESTIMENTOGLOBAL WHERE IDINVESTIMENTO    = cImp.IdInvestimento ');
   QryImp.SQL.Add('                                                         AND   TO_NUMBER(CAMPO7)    = cImp.IDCORRETVALORES ');
   QryImp.SQL.Add('                                                         AND   TO_NUMBER(CAMPO8)    = cImp.IDTIPOOPERACAO  ');
   QryImp.SQL.Add('                                                         AND   TO_DATE(CAMPO2,''DD/MM/YYYY'') = cImp.DATAORDMOVINV   ');
   QryImp.SQL.Add('                                                         AND   IDPLANPREVCTBPATR = cImp.IDPLANPREVCTBPATR ');
   QryImp.SQL.Add('                                                         AND   TO_NUMBER(CAMPO5) = cImp.IDCARTEIRAINVEST  '); // pnobreza
   QryImp.SQL.Add('                                                         AND   TO_NUMBER(CAMPO12) = cImp.QTDEORDENADA; ');

   QryImp.SQL.Add('             IF vCount > 1 THEN ');
   QryImp.SQL.Add('                 INSERT INTO INVESTIMENTOGLOBAL (IDCHAVETEMP,CAMPO1,CAMPO2)VALUES(''ORDMOVERR'',cImp.Sequencial,''Essa operação está duplicada no arquivo''); ');
   QryImp.SQL.Add('                 UPDATE INVESTIMENTOGLOBAL SET CAMPO17 = ''N'' WHERE CAMPO15 = cImp.SEQUENCIAL AND IDCHAVETEMP = cImp.IDCHAVETEMP; ');
   QryImp.SQL.Add('             END IF; ');

   QryImp.SQL.Add('        END LOOP;   ');

   QryImp.SQL.Add(' END; ');

   QryImp.ExecSQL;

   FreeAndNil(QryImp);
End;

Procedure TfrmImportaOrdens.PopupMenu1Popup(Sender: TObject);
Begin
   Inherited;

   PopupMenu1.Items.Items[0].Caption := ' Excluir Codigo Importação ' + QryOrdem.fieldbyname('Codigo Importação').Asstring;

End;

Procedure TfrmImportaOrdens.ExcluiImportacao(iCodigoImportacao: integer);
Var
   QryAux: TwwQuery;
Begin

   QryAux := TwwQuery.Create(Nil);
   QryAux.DataBaseName := 'BaseDados';
   Try
      ExecutaQuery(QryAux, 'DELETE FROM ORDMOVINV WHERE IDIMPORTACAO = ' + IntToStr(iCodigoImportacao));
      Showmessage('Exclusão Realizada com Sucesso!');
   Except
      Showmessage('Erro ao Excluir o Codigo de Importacao' + IntToStr(iCodigoImportacao));
   End;

   FreeAndNil(QryAux);
End;

Procedure TfrmImportaOrdens.ExcluirImportao1Click(Sender: TObject);
Begin
   Inherited;

   If QryOrdem.fieldbyname('Calcula Despesa').asinteger = 0 Then //Se ainda nao calculou despesa, pode excluir
      Begin

         If (QryOrdem.fieldbyname('Conferência').asinteger > 0) Or (QryOrdem.fieldbyname('Autoriza').asinteger > 0) Then
            Begin
               //Pergunta se quer excluir mesmo tendo conferencias e autorizacoes
               If MsgDlg('Já existe Conferência e/ou Autorização para essa Importação' + chr(13) + 'Deseja Realmente excluir ?', 'Mensagem do Sistema ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
                  ExcluiImportacao(QryOrdem.fieldbyname('Codigo Importação').AsInteger);
            End
         Else
            Begin //Como nao existe Conferencia nem Autorizacao - Exclui sem perguntar
               ExcluiImportacao(QryOrdem.fieldbyname('Codigo Importação').AsInteger);
            End;

      End
   Else
      Begin
         ShowMessage('Essa Importação já possui despesas calculadas' + chr(13) + 'A Exclusão não é permitida');
      End;

   QryOrdem.Close;
   QryOrdem.open;
End;

// Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011
procedure TfrmImportaOrdens.BuscaValorRegraBoleta;
var QryAux: TwwQuery;
begin
   Try
      QryAux := TwwQuery.Create(Nil);
      QryAux.DataBaseName := 'BaseDados';
      FazQuery(QryAux, 'SELECT REGRABOLETA FROM PARAMINVEST');

      if Trim(QryAux.FieldByName('REGRABOLETA').AsString) = '1' then
         StaticText1.Caption := '1 - Data/Corretora (Anterior)'
      else
         StaticText1.Caption := '2 - Data/Corretora/Plano/Carteira (Atual)'
   finally
      FreeAndNil(QryAux);
   End;
end;
// Otacilio SOL 155955/4501 / KT 1229326 - 22.06.2011

End.

// exemplo do arquivo texto gerado pelo Custodiante contendo o movimento de investimentos de compra e venda

//0#RV
//#20100521#110099#V#N#BOVESPA#AMBV2#V#SANTANDE#SANTANDE#53#0,9#90#S#02#02##16190#14#
//#20100521#110129#V#N#BOVESPA#AMBV2#V#SANTANDE#SANTANDE#4#0,9#90#S#02#02##16198#14#
//#20100521#110009#V#N#BOVESPA#AMBV2#V#SANTANDE#SANTANDE#1#0,9#90#S#02#02##16174#14#
//#20100521#110099#V#N#BOVESPA#ITSA2#V#SANTANDE#SANTANDE#2099#1,49550458715596#90#S#02#02##16190#14#
//#20100521#110129#V#N#BOVESPA#ITSA2#V#SANTANDE#SANTANDE#196#1,49550458715596#90#S#02#02##16198#14#
//#20100521#110009#V#N#BOVESPA#ITSA2#V#SANTANDE#SANTANDE#69#1,49550458715596#90#S#02#02##16174#14#
//#20100521#110069#V#N#BOVESPA#ITSA2#V#SANTANDE#SANTANDE#34#1,49550458715596#90#S#02#02##16182#14#
//#20100521#110099#V#N#BOVESPA#PCAR13#V#SANTANDE#SANTANDE#64#0,06#90#S#02#02##16190#14#
//#20100521#110129#V#N#BOVESPA#PCAR13#V#SANTANDE#SANTANDE#6#0,06#90#S#02#02##16198#14#
//#20100521#110009#V#N#BOVESPA#PCAR13#V#SANTANDE#SANTANDE#2#0,06#90#S#02#02##16174#14#
//#20100521#110069#V#N#BOVESPA#PCAR13#V#SANTANDE#SANTANDE#1#0,06#90#S#02#02##16182#14#
//99#RV

