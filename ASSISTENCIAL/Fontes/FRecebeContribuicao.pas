unit FRecebeContribuicao;

interface
                       
uses
  Windows, Messages,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, checklst,
  ComCtrls, wwdblook, Spin, Db, DBTables,  OpenArqText, TB97,
  URegra, TB97Tlbr, IvDictio, IvMulti, IvEMulti, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, uSistema;

type
  TfrmRecebeContribuicao = class(TfrmOkCancelar)
    Panel2: TPanel;
    pnlOpcoes: TPanel;
    pnlProgresso: TPanel;
    pBar: TProgressBar;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    qryPatro: TwwQuery;
    qrymotivo: TwwQuery;
    qryAux: TwwQuery;
    qryRecebimento: TwwQuery;
    Label4: TLabel;
    qrycontribass: TwwQuery;
    qryaux2: TwwQuery;
    btncancelaprogress: TBitBtn;
    qryHstContribass: TwwQuery;
    qryHstContribassIDTITULAR: TFloatField;
    qryHstContribassIDPESSJUR: TFloatField;
    qryHstContribassIDPLANASS: TFloatField;
    qryHstContribassVALORESPERADO: TFloatField;
    qryHstContribassVALORRECEBIDO: TFloatField;
    qryHstContribassDATA: TDateTimeField;
    qryHstContribassCODDOCPREV: TFloatField;
    qryHstContribassNUMRECEBIMENTO: TFloatField;
    qryHstContribassMESCOBRANCA: TStringField;
    qryHstContribassMES: TStringField;
    qryHstContribassIDMOTIVO: TFloatField;
    qryHstContribassSITRECEBIMENTO: TStringField;
    Panel1: TPanel;
    qryHstContribassFLGCOBCARNE: TFloatField;
    GroupBox4: TGroupBox;
    bbtnReceber: TBitBtn;
    qryAcumulo: TQuery;
    qryParam: TQuery;
    qryHstContribassIDPAGADOR: TFloatField;
    Marca: TBitBtn;
    chklstPatro: TCheckListBox;
    Label1: TLabel;
    btnDesfazer: TBitBtn;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    rgrpTipoFolha: TRadioGroup;
    GroupBox3: TGroupBox;
    dtRecebimento: TCMDateTimePicker;
    bbtnVerResultado: TBitBtn;
    procedure bbtnReceberClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
  //procedure Regra1GetResult(sender: TObject);
    procedure btncancelaprogressClick(Sender: TObject);
    procedure rdgopcoesClick(Sender: TObject);
    procedure MarcaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDesfazerClick(Sender: TObject);
  private
    { Private declarations }
    bNaoExisteRecebPatro,
    bNaoExisteRecebNenhum,
    bErro,
    bCancelaEnvio          : Boolean;
    sAnoMesCobrancaTela,
    sFiltro                : String;

    Function  ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
    Function  RecebeContribuicaoFolha(piIdPatrocinadora, piFlgFundacao: integer; psPatrocinadora: string): boolean;
    Function  RecebeContribuicaoBanco(piIdPatrocinadora, piFlgFundacao: integer; psPatrocinadora: string): boolean;
    Function  DesfazRecebContribFolha(pIdPessJur: integer): boolean;
    Function  DesfazRecebContribBanco(pIdPessJur: integer): boolean;
    Function  BaixaContribCAR (psAnoMesCobranca   : string;
                               psAnoMesReferencia : string;
                               piNumRecebimento   : longint;
                               piSitRecebimento   : integer;
                               piCodDocPrev       : longint;
                               piIdMotivo         : longint;
                               pdValorEsperado    : double;
                               var sMsgErro       : string;
                               psNomeContrib      : string = '') : boolean;


    procedure AlteraHstContribAss;
    procedure AtualizaTmpDesc(psNoDocumento:String);
    procedure CriaLista(chkListX: TCheckListBox; qryLista: TwwQuery);
    procedure FazQryRecFolha(pIdPessJur:String);
    procedure FazQryRecBanco(pIdPessJur:String);
    procedure GravaVoltaInterface(iIdPatrocinadora, iIdLote : integer);

  public
    { Public declarations }
  end;

var
  frmRecebeContribuicao: TfrmRecebeContribuicao;

implementation

uses UMensErro, UDataBase, UIntegraBack, UAdmAss, uSincronismo, DBaseDados, UModulo, fAguarde;

{$R *.DFM}

{ ****************************** FUNCOES AUXILIARES ******************* }
Function TfrmRecebeContribuicao.ValidaAnoMes(sSt:String;bNum:Byte): Boolean;
begin
  Result:=False;
  If StrToIntDef(Copy(sSt,1,4),0)>0 then
   If StrToIntDef(Copy(sSt,6,2),0) In [1..12+bNum] then
     Result:=True;
end;

procedure TfrmRecebeContribuicao.CriaLista(chkListX: TCheckListBox; qryLista: TwwQuery);
begin
  chkListX.Items.Clear;
  qryLista.First;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('NOME').AsString);
        Next;
     end;
  end;
end;

procedure TfrmRecebeContribuicao.GravaVoltaInterface(iIdPatrocinadora, iIdLote : integer);
begin
   // Atualizar tabela CTRLINTERFACE
   // Gravar flgVOLTATMP = True da patrocinadora na tabela CTRLNTERFACE
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE CTRLINTERFACE SET FLGVOLTATMP = 1, ');
      SQL.Add('                          DATAVOLTATMP = SYSDATE ');
      SQL.Add(' WHERE MESREFERENCIA = ' + QuotedStr(sAnoMesCobrancaTela));
      SQL.Add('   AND IDLOTE = '+IntToStr(iIdLote));
      SQL.Add('   AND TIPO = '+QuotedStr('P'));
      SQL.Add('   AND IDPESSOA = '+IntToStr(iIdPatrocinadora));
      try
        ExecSQL;
      except
        memResult.Lines.Add(' Erro Específico da Patrocinadora[GRAVAÇÃO DO CONTROLE DE INTERFACE]');
      end;
   end;
end; //GravaVoltaInterface

{ ****************************** FUNCOES DE COBRANCA    ******************* }

function  TfrmRecebeContribuicao.RecebeContribuicaoFolha(piIdPatrocinadora, piFlgFundacao: integer;
          psPatrocinadora: string): boolean;
Var
 iIdLoteAtual,
 iControleCommit,
 iIdLoteAnterior    :    Integer;
begin
  FazQryRecFolha(IntToStr(piIdPatrocinadora));

  frmAguarde.Apaga;
  frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                     'Verificando recebimentos ...');

  bNaoExisteRecebPatro := qryRecebimento.IsEmpty;

  If bNaoExisteRecebNenhum
   Then bNaoExisteRecebNenhum := qryRecebimento.IsEmpty;


  If bNaoExisteRecebPatro
   Then Begin
     frmAguarde.Apaga;
     memResult.Lines.Add('[AVISO] - '+qryPatro.FieldbyName('NOME').AsString+' : '+
                        ' nenhuma contribuição encontrada pendente de recebimento. ');
     result := True;
     Exit;
   End;

  qryRecebimento.First;
  iIdLoteAnterior := qryRecebimento.FieldByName('IdLote').AsInteger;

  frmAguarde.Apaga;
  frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                     'Recebendo Contribuições do Lote '+IntToSTr(iIdLoteAnterior)+' ... ');

  iControleCommit := 0;

  frmAguarde.pbAguarde.Min      := 0;
  frmAguarde.pbAguarde.Position := 0;
  frmAguarde.pbAguarde.Step     := 1;
  frmAguarde.pbAguarde.Max      := qryRecebimento.RecordCount;
  frmAguarde.pbAguarde.Visible  := True;

  qryRecebimento.First;

  Result := False;
  While Not qryRecebimento.Eof do
   Begin

    frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1; // CAMILLE - 28.08.2003
    Application.ProcessMessages;

    iIdLoteAtual := qryRecebimento.FieldByName('IdLote').AsInteger;
    inc(iControleCommit);

    If iControleCommit >= 1000
     Then begin
      If dtmBaseDados.dbBaseDados.InTransaction
       Then begin
         dtmBaseDados.dbBaseDados.Commit;
         dtmBaseDados.dbBaseDados.StartTransaction;
       End;
       iControleCommit := 1;
     End;

    If (iIdLoteAtual <> iIdLoteAnterior)
     Then begin
         // Gravar volta na Controle de Interface
         frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                           'Gravando controle de contribuições ... ');

         GravaVoltaInterface(qryPatro.FieldByname('IDPESSOA').AsInteger, iIdLoteAnterior);

         // Atualizar o ctrl de interface
         With qryAux do Begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE CTRLINTERFACE ');
            SQL.Add('   SET FLGIDATMP    = 1,');
            SQL.Add('       DATAIDATMP   = SYSDATE,');
            SQL.Add('       FLGPREPARADO = 1,');
            SQL.Add('       DATAPREPARO  = SYSDATE');
            SQL.Add('WHERE IDLOTE = ' + IntToStr(iIdLoteAnterior) );
            Try
              ExecSQL;
            Except
              frmAguarde.Apaga;
              Exit;
            End; // Try
         End; // With qryAux do Begin

         frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                          'Recebendo Contribuições do Lote '+IntToSTr(iIdLoteAtual)+' ... ');
     End; // If (iIdLoteAtual <> iIdLoteAnterior)

    AlteraHstContribAss;

    qryRecebimento.Next;
   End; // While Not qryRecebimento.Eof do
  Result := True;
end;

function  TfrmRecebeContribuicao.RecebeContribuicaoBanco(piIdPatrocinadora, piFlgFundacao: integer;
          psPatrocinadora: string): boolean;
Var
 iIdLoteAtual,
 iControleCommit,
 iIdLoteAnterior    :    Integer;
 bOk                :    Boolean;
 sMsgErro           :    String;
begin
  FazQryRecBanco(IntToStr(piIdPatrocinadora));

  frmAguarde.Apaga;
  frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                     'Verificando recebimentos via banco ...');

  bNaoExisteRecebPatro := qryRecebimento.IsEmpty;

  If bNaoExisteRecebNenhum
   Then bNaoExisteRecebNenhum := qryRecebimento.IsEmpty;


  If bNaoExisteRecebPatro
   Then Begin
     frmAguarde.Apaga;
     memResult.Lines.Add('[AVISO] - '+qryPatro.FieldbyName('NOME').AsString+' : '+
                        ' nenhuma contribuição encontrada pendente de recebimento. ');
     result := True;
     Exit;
   End;

  qryRecebimento.First;
  iIdLoteAnterior := qryRecebimento.FieldByName('IdLote').AsInteger;

  frmAguarde.Apaga;
  frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                     'Recebendo Contribuições do Lote '+IntToSTr(iIdLoteAnterior)+' ... ');

  iControleCommit := 0;

  frmAguarde.pbAguarde.Min      := 0;
  frmAguarde.pbAguarde.Position := 0;
  frmAguarde.pbAguarde.Step     := 1;
  frmAguarde.pbAguarde.Max      := qryRecebimento.RecordCount;
  frmAguarde.pbAguarde.Visible  := True;

  qryRecebimento.First;

  Result := True;

  While Not qryRecebimento.Eof do
   Begin

    frmAguarde.pbAguarde.Position  := frmAguarde.pbAguarde.Position + 1; // CAMILLE - 28.08.2003
    Application.ProcessMessages;

    iIdLoteAtual := qryRecebimento.FieldByName('IdLote').AsInteger;
    inc(iControleCommit);

    If iControleCommit >= 1000
     Then begin
      If dtmBaseDados.dbBaseDados.InTransaction
       Then begin
         dtmBaseDados.dbBaseDados.Commit;
         dtmBaseDados.dbBaseDados.StartTransaction;
       End;
       iControleCommit := 1;
     End;

    If (iIdLoteAtual <> iIdLoteAnterior)
     Then begin
         // Gravar volta na Controle de Interface
         frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                           'Gravando controle de contribuições ... ');

         GravaVoltaInterface(qryPatro.FieldByname('IDPESSOA').AsInteger, iIdLoteAnterior);

         // Atualizar o ctrl de interface
         With qryAux do Begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE CTRLINTERFACE ');
            SQL.Add('   SET FLGIDATMP    = 1,');
            SQL.Add('       DATAIDATMP   = SYSDATE,');
            SQL.Add('       FLGPREPARADO = 1,');
            SQL.Add('       DATAPREPARO  = SYSDATE');
            SQL.Add('WHERE IDLOTE = ' + IntToStr(iIdLoteAnterior) );
            Try
              ExecSQL;
            Except
              bErro := True;
              frmAguarde.Apaga;
              Exit;
            End; // Try
         End; // With qryAux do Begin

         frmAguarde.Mostra(Trim(qryPatro.FieldbyName('NOME').AsString)+ ' - '+
                          'Recebendo Contribuições do Lote '+IntToSTr(iIdLoteAtual)+' ... ');
     End; // If (iIdLoteAtual <> iIdLoteAnterior)

     bOk := BaixaContribCAR(sAnoMesCobrancaTela,
                            sAnoMesCobrancaTela,
                            qryRecebimento.FieldByName('NUMRECEBIMENTO').AsInteger,
                            qryRecebimento.FieldByName('SITRECEBIMENTO').AsInteger,
                            qryRecebimento.FieldByName('CODDOCPREV').AsInteger,
                            qryRecebimento.FieldByName('IDMOTIVO').AsInteger,
                            qryRecebimento.FieldByName('VALORESPERADO').AsFloat
                            sMsgErro);
     If not bOk
      Then begin
         Result := False;
         memResult.Lines.Add('[ ERRO ] - MATRICULA : '+qryRecebimento.FieldByName('MATRICULA').AsString+' : '+sMsgErro);
      End;

     qryRecebimento.Next;
   End; // While Not qryRecebimento.Eof do

end;

function TfrmRecebeContribuicao.DesfazRecebContribFolha(pIdPessJur: integer): boolean;
begin
  // Atualiza TmpDesc Sem Divergência
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE TMPDESC ');
  qryAux.SQL.Add('   SET SITENVIO = 2');
  qryAux.SQL.Add('WHERE (MESCOBRANCA   = '+QuotedStr(sAnoMesCobrancaTela)+') ');
  qryAux.SQL.Add('  AND (IDMODULO      = '+IntToStr(Sistema.IdModulo)+') ');
  qryAux.SQL.Add('  AND (FLGTIPODESC   = ''A'') ');
  qryAux.SQL.Add('  AND (FLGALTERADOR IS NULL) ');
  qryAux.SQL.Add('  AND (IDPESSJUR     = '+IntToStr(pIdPessJur)+') ');
  qryAux.SQL.Add('  AND (SITENVIO      = ''9'' ) ');
  qryAux.SQL.Add('  AND (VALORRECEBIDO = VALOR) ');

  If rgrpTipoFolha.ItemIndex = 0
   Then qryAux.SQL.Add('  AND (FLGDESCFOLHA  = ''P'') ')
   Else qryAux.SQL.Add('  AND (FLGDESCFOLHA  = ''B'') ');

  Try
     qryAux.ExecSQL;
  Except
     memResult.Lines.Add('Erro ao atualizar registro SEM divergência na tabela do interface.');
     Result := False;
     frmAguarde.Apaga;
     Exit;
  End;

  // Atualiza TmpDesc Com Divergência
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE TMPDESC ');
  qryAux.SQL.Add('   SET SITENVIO = 1');
  qryAux.SQL.Add('WHERE (MESCOBRANCA   = '+QuotedStr(sAnoMesCobrancaTela)+') ');
  qryAux.SQL.Add('  AND (IDMODULO      = '+IntToStr(Sistema.IdModulo)+') ');
  qryAux.SQL.Add('  AND (FLGTIPODESC   = ''A'') ');
  qryAux.SQL.Add('  AND (FLGALTERADOR IS NULL) ');
  qryAux.SQL.Add('  AND (IDPESSJUR     = '+IntToStr(pIdPessJur)+') ');
  qryAux.SQL.Add('  AND (SITENVIO      = ''9'' ) ');
  qryAux.SQL.Add('  AND (VALORRECEBIDO <> VALOR) ');

  If rgrpTipoFolha.ItemIndex = 0
   Then qryAux.SQL.Add('  AND (FLGDESCFOLHA  = ''P'') ')
   Else qryAux.SQL.Add('  AND (FLGDESCFOLHA  = ''B'') ');

  Try
     qryAux.ExecSQL;
  Except
     memResult.Lines.Add('Erro ao atualizar registro COM divergência na tabela do interface.');
     Result := False;
     frmAguarde.Apaga;
     Exit;
  End;

  // Atualizando HstContribAss
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE HSTCONTRIBASS');
  qryAux.SQL.Add('   SET VALORRECEBIDO  = NULL,');
  qryAux.SQL.Add('       DATA           = NULL,');
  qryAux.SQL.Add('       SITRECEBIMENTO = 1');
  qryAux.SQL.Add('WHERE MESCOBRANCA    = '+QuotedStr(sAnoMesCobrancaTela) );
  qryAux.SQL.Add('  AND IDPESSJUR      = '+IntToStr(pIdPessJur));
  qryAux.SQL.Add('  AND SITRECEBIMENTO IN ( 2, 3)');
  qryAux.SQL.Add('  AND FLGCOBCARNE    IN ( 0, 2)');

  Try
     qryAux.ExecSQL;
  Except
     memResult.Lines.Add('Erro ao atualizar registro na tabela de histórico de contribuições assistenciais.');
     Result := False;
     frmAguarde.Apaga;
     Exit;
  End;

 Result := True;
 frmAguarde.Apaga;

 Exit;
end;

function TfrmRecebeContribuicao.DesfazRecebContribBanco(pIdPessJur: integer): boolean;
begin
  // Atualizando HstContribAss
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE HSTCONTRIBASS');
  qryAux.SQL.Add('   SET VALORRECEBIDO  = NULL,');
  qryAux.SQL.Add('       DATA           = NULL,');
  qryAux.SQL.Add('       SITRECEBIMENTO = 1');
  qryAux.SQL.Add('WHERE MESCOBRANCA    = '+QuotedStr(sAnoMesCobrancaTela) );
  qryAux.SQL.Add('  AND IDPESSJUR      = '+IntToStr(pIdPessJur));
  qryAux.SQL.Add('  AND SITRECEBIMENTO IN ( 2, 3)');
  qryAux.SQL.Add('  AND FLGCOBCARNE    = 1');

  Try
     qryAux.ExecSQL;
  Except
     memResult.Lines.Add('Erro ao atualizar registro na tabela de histórico de contribuições assistenciais.');
     Result := False;
     frmAguarde.Apaga;
     Exit;
  End;

 Result := True;
 frmAguarde.Apaga;

 Exit;
end;

function TfrmRecebeContribuicao.BaixaContribCAR(psAnoMesCobranca,
                                                psAnoMesReferencia: string;
                                                piNumRecebimento, piSitRecebimento,
                                                piCodDocPrev,
                                                piIdMotivo: Integer;
                                                pdValorEsperado: double;
                                                var sMsgErro       : string;
                                                psNomeContrib: string): boolean;
Var
    dValorRecebido      : double;
    sDataRecebimento    : string;
    iSitRecebimento     : integer;
    bBaixadoComZero     : boolean;
    dValorBaixado       : double;
    iCodAlteradorAcres  : longint;
    sNoDocumento        : string;
    dValorEsperadoOrig  : double;
    dValorPago,
    dValorCalc          : Double;
begin
   Result     := False;
   sMsgErro   := '';
   dValorPago := 0;
   // Se contribuicao nao foi enviada ou não tem documento associado
   // sair da rotina
   if (piSitRecebimento <> 1) or (piCodDocPrev <= 0)
   then begin
      Result := True;
      Exit;
   end;

   dValorEsperadoOrig  := pdValorEsperado;

   // Lógica da baixa via banco
   // 1o. Verificar o STATUS do documento. Se não for 2, significa que
   //     o documento ainda não foi baixada. Logo, o AdmPREV não irá
   //     receber. O sistema não receberá documentos parcialmente baixados
   // 2o. Estando o documento baixado, verificar se existe lancamento 5
   //     Se não existir, então o documento foi baixado com valor zero
   //     Logo o sistema deve colocar a contribuicao como "recebida com divergencia"
   //     para cair no Tratamento de Divergencias
   // 3o. Se existir o lancamento com operacao 5, então verificar o valor deste lancamento
   //     3.1. Se for menor que o valor esperado, então baixar contribuicao usando
   //          o valor da operacao 5
   //     3.2. Se for maior que o esperado
   //          Entao verificar se existe Operacao 4 com o alterador parametrizado como
   //                "acrescimo no valor da contribuicao"
   //                Se encontrar
   //                Entao baixar a contribuicao com o valor recebido = ( operacao 2 + operacao 4 )
   //                Senao baixar a contribuicao com o valor recebido = ( operacao 2 = esperado )

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT STATUS, NODOCUMENTO FROM DOCUMENTO '+
                  ' WHERE  CODDOCUMENTO = '+IntToStr(piCodDocPrev));
   qryAux.Open;
   if (qryAux.IsEmpty) or (qryAux.FieldByName('STATUS').AsString <> '2')
   then begin
      sMsgErro:=
        'O documento '+qryAux.FieldByName('NODOCUMENTO').asstring+' não está baixado. '+#13#10+
        'Por isso, a contribuição associada não pode ser recebida. '+#13#10+
        'Favor verificar o documento no Contas a Receber.'+#13#10#13#10;
      Result := True;
      Exit;
   end;

   sNoDocumento := qryAux.FieldByName('NODOCUMENTO').AsString;

   // Buscar total das contribuicoes no mesmo documento para comparar com valor
   // baixado do documento
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT SUM(VALORESPERADO) AS TOTALESPERADO '+
                  ' FROM   HSTCONTRIBASS                                                            '+
                  ' WHERE  CODDOCPREV = '+IntToStr(piCodDocPrev)                         );
   qryAux.Open;

   If (not qryAux.IsEmpty) and (qryAux.FieldbyName('TOTALESPERADO').AsFloat > 0)
    Then pdValorEsperado := qryAux.FieldbyName('TOTALESPERADO').AsFloat;

   bBaixadoComZero := False;

   // Procurar a data que o participante pagou a cobrança
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(
     'SELECT MAX(DATALANCTO) AS DATAPAGTO, '+#13#10+
     '       SUM(DECODE(DEBCRE,''C'',VALOR,''D'',-VALOR,0)) AS VALOR '+#13#10+
     'FROM LANCTODOCUM '+#13#10+
     'WHERE CODDOCUMENTO = '+IntToStr(piCodDocPrev)+#13#10+
                  ' AND    OPERACAO     = ''5'' ');
   qryAux.Open;

   If qryAux.IsEmpty
    Then begin
      bBaixadoComZero   := True;
      dValorBaixado     := 0;
      sDataRecebimento  := DateToStr(date);
    End
    Else Begin
     If qryAux.FieldByName('VALOR').AsFloat <= 0
      Then Begin
       bBaixadoComZero   := True;
       dValorBaixado     := 0;
       sDataRecebimento  := DateToStr(date);
      End
      Else Begin
       bBaixadoComZero  := False;
       dValorBaixado    := qryAux.FieldByName('VALOR').AsFloat;
        If Trim(qryAux.FieldByName('DataPagto').AsString) <> ''
         Then sDataRecebimento := qryAux.FieldByName('DataPagto').AsString
         Else sDataRecebimento  := DateToStr(date);
      End;
    End;

   dValorBaixado   :=  StrToFloat(FormatFloat('#0.00',dValorBaixado));
   pdValorEsperado :=  StrToFloat(FormatFloat('#0.00',pdValorEsperado));
   dValorRecebido  := dValorEsperadoOrig;

   // Baixa com Valor Zerado
   If bBaixadoComZero
    Then Begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE HSTCONTRIBASS');
      qryAux.SQL.Add('SET    SITRECEBIMENTO  = 3,');
      qryAux.SQL.Add('       VALORRECEBIDO   = 0,');
      qryAux.SQL.Add('       DATA            = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') ');
      qryAux.SQL.Add('WHERE (NUMRECEBIMENTO  = '+IntToStr(piNumRecebimento)+')');
      qryAux.SQL.Add('  AND (MES             = '''+psAnoMesReferencia+''')');
      qryAux.SQL.Add('  AND (MESCOBRANCA     = '''+psAnoMesCobranca+''')');
      qryAux.SQL.Add('  AND (IDMOTIVO        = '+IntToStr(piIdMotivo)+')');

      dValorPago := dValorPago + 0;

      Try
         qryAux.ExecSQL;
      Except
         sMsgErro := 'Erro na atualização do valor recebido no histórico. ';
         Exit;
      End;
    End // If bBaixadoComZero

    Else
    //
    // Se a contribuicao foi paga a MENOR ou a menor avisar ao usuário
    //
    If dValorBaixado < pdValorEsperado
     Then sMsgErro := '   [AVISO ] Documento No. '+sNoDocumento+' baixado no CAR com valor MENOR que o esperado   '+#13+#10+
                      '            pelo ASSISTENCIAL. Verifique. [Mês:'+psAnoMesReferencia+'-Contrib:'+psNomeContrib+']'+#13+#10+
                      '            ATENÇÃO : ESTA CONTRIBUIÇÃO FOI RECEBIDA PELO SISTEMA ASSISTENCIAL.             '
     Else If dValorBaixado > pdValorEsperado
           Then sMsgErro := '   [AVISO ] Documento No. '+sNoDocumento+' baixado no CAR com valor MAIOR que o esperado   '+#13+#10+
                            '            pelo ASSISTENCIAL. Verifique. [Mês:'+psAnoMesReferencia+'-Contrib:'+psNomeContrib+']'+#13+#10+
                            '            ATENÇÃO : ESTA CONTRIBUIÇÃO FOI RECEBIDA PELO SISTEMA ASSISTENCIAL.             ';

    // 1º - Verifica o total de valor já recebido
    //      para este documento na HSTCONTRIBASS
    qryAux2.Close;
    qryAux2.SQL.Clear;
    qryAux2.SQL.Add('SELECT SUM(VALORRECEBIDO) VALORRECEBIDO');
    qryAux2.SQL.Add('FROM HSTCONTRIBASS');
    qryAux2.SQL.Add('WHERE (CODDOCPREV = '+IntToStr(piCodDocPrev)+')');
    qryAux2.SQL.Add('  AND (MES              = '''+psAnoMesReferencia+''')');
    qryAux2.SQL.Add('  AND (MESCOBRANCA      = '''+psAnoMesCobranca+''')');
    qryAux2.SQL.Add('  AND (IDMOTIVO         = '+IntToStr(piIdMotivo)+')');
    qryAux2.SQL.Add('  AND (VALORRECEBIDO    > 0)');
    qryAux2.Open;

    dValorPago := dValorPago + qryAux2.FieldByName('VALORRECEBIDO').AsFloat;

    dValorRecebido := dValorBaixado - dValorPago;

     // 2º - Baixa a Contribuição com o saldo restante
     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add('SELECT VALORESPERADO ');
     qryAux2.SQL.Add('FROM HSTCONTRIBASS');
     qryAux2.SQL.Add('WHERE (NUMRECEBIMENTO = '+IntToStr(piNumRecebimento)+')');
     qryAux2.SQL.Add('  AND (MES            = '''+psAnoMesReferencia+''')');
     qryAux2.SQL.Add('  AND (MESCOBRANCA    = '''+psAnoMesCobranca+''')');
     qryAux2.SQL.Add('  AND (IDMOTIVO       = '+IntToStr(piIdMotivo)+')');
     qryAux2.SQL.Add('  AND (NVL(VALORRECEBIDO,0) = 0)');

     qryAux2.Open;

     dValorCalc      := qryAux2.FieldByName('VALORESPERADO').AsFloat;
     iSitRecebimento := 2;

     // Se o valor da contribuição for diferente
     // saldo a receber, irá dar baixa somente no saldo
     If dValorCalc <> dValorRecebido
      Then Begin
        dValorCalc      := dValorRecebido;
        iSitRecebimento := 3;
      End;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('UPDATE HSTCONTRIBASS');
     qryAux.SQL.Add('SET    SITRECEBIMENTO  = '+IntToStr(iSitRecebimento)+',');
     qryAux.SQL.Add('       VALORRECEBIDO   = '+OraNumero(FormatFloat('#0.00', dValorCalc))+',');
     qryAux.SQL.Add('       DATA            = TO_DATE('''+sDataRecebimento+''', ''dd/mm/yyyy'') ');
     qryAux.SQL.Add('WHERE (NUMRECEBIMENTO  = '+IntToStr(piNumRecebimento)+')');
     qryAux.SQL.Add('  AND (MES             = '''+psAnoMesReferencia+''')');
     qryAux.SQL.Add('  AND (MESCOBRANCA     = '''+psAnoMesCobranca+''')');
     qryAux.SQL.Add('  AND (IDMOTIVO        = '+IntToStr(piIdMotivo)+')');

     Try
        qryAux.ExecSQL;
     Except
        sMsgErro := 'Erro na atualização do valor recebido no histórico. ';
        Exit;
     End;

   Result := True;
end;

procedure TfrmRecebeContribuicao.AlteraHstContribAss;
Var
  dValorEsperado,
  dValorRecebido    :  Double;

  cAuxSeparador,
  DecimalSeparator,
  sValorEsperado,
  sValorRecebido    :  String;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT SUM(VALORESPERADO) VALORESPERADO');
  qryAux.SQL.Add('FROM HSTCONTRIBASS');
  qryAux.SQL.Add('WHERE MES            = '+QuotedStr(qryRecebimento.FieldByName('MESREFERENCIA').AsString));
  qryAux.SQL.Add('  AND MESCOBRANCA    = '+QuotedStr(qryRecebimento.FieldByName('MESCOBRANCA').AsString));
  qryAux.SQL.Add('  AND IDPLANASS      = '+qryRecebimento.FieldByName('IDPLANASS').AsString);
  qryAux.SQL.Add('  AND IDTITULAR      = '+qryRecebimento.FieldByName('IDTITULAR').AsString);
  qryAux.SQL.Add('  AND IDCONTASS      = '+qryRecebimento.FieldByName('IDDESCONTO').AsString);
  qryAux.SQL.Add('  AND IDMOTIVO       = '+qryRecebimento.FieldByName('IDMOTIVO').AsString);
  qryAux.Open;

  If Trim(qryAux.FieldByName('VALORESPERADO').AsString) = ''
   Then dValorEsperado := 0
   Else dValorEsperado := qryAux.FieldByName('VALORESPERADO').AsFloat;

  If Trim(qryRecebimento.FieldByName('VALORRECEBIDO').AsString) = ''
   Then dValorRecebido := 0
   Else dValorRecebido := qryRecebimento.FieldByName('VALORRECEBIDO').AsFloat;

  cAuxSeparador    := DecimalSeparator;
  DecimalSeparator := '.';
  sValorRecebido   := FormatFloat('#0.00',dValorRecebido);
  sValorEsperado   := FormatFloat('#0.00',dValorEsperado);
  DecimalSeparator := cAuxSeparador;

  If sValorEsperado = sValorRecebido
   Then Begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE HSTCONTRIBASS ');
      qryAux.SQL.Add('   SET VALORRECEBIDO  = VALORESPERADO, ');
      qryAux.SQL.Add('       DATA           = '+QuotedStr(dtRecebimento.Text)+', ');
      qryAux.SQL.Add('       SITRECEBIMENTO = 2 ');
      qryAux.SQL.Add('WHERE MES            = '+QuotedStr(qryRecebimento.FieldByName('MESREFERENCIA').AsString));
      qryAux.SQL.Add('  AND MESCOBRANCA    = '+QuotedStr(qryRecebimento.FieldByName('MESCOBRANCA').AsString));
      qryAux.SQL.Add('  AND IDPLANASS      = '+qryRecebimento.FieldByName('IDPLANASS').AsString);
      qryAux.SQL.Add('  AND IDTITULAR      = '+qryRecebimento.FieldByName('IDTITULAR').AsString);
      qryAux.SQL.Add('  AND IDCONTASS      = '+qryRecebimento.FieldByName('IDDESCONTO').AsString);
      qryAux.SQL.Add('  AND IDMOTIVO       = '+qryRecebimento.FieldByName('IDMOTIVO').AsString);

      Try
        qryAux.ExecSQL;
        AtualizaTmpDesc('');
      Except
        memResult.Lines.Add(' Erro: Documento nº '+qryRecebimento.FieldByName('NODOCUMENTO').AsString+' não encontrado.');
      End;
   End
   Else Begin
    qryAux2.Close;
    qryAux2.SQL.Clear;
    qryAux2.SQL.Add('SELECT NUMRECEBIMENTO, VALORESPERADO');
    qryAux2.SQL.Add('FROM HSTCONTRIBASS');
    qryAux2.SQL.Add('WHERE MES            = '+QuotedStr(qryRecebimento.FieldByName('MESREFERENCIA').AsString));
    qryAux2.SQL.Add('  AND MESCOBRANCA    = '+QuotedStr(qryRecebimento.FieldByName('MESCOBRANCA').AsString));
    qryAux2.SQL.Add('  AND IDPLANASS      = '+qryRecebimento.FieldByName('IDPLANASS').AsString);
    qryAux2.SQL.Add('  AND IDTITULAR      = '+qryRecebimento.FieldByName('IDTITULAR').AsString);
    qryAux2.SQL.Add('  AND IDCONTASS      = '+qryRecebimento.FieldByName('IDDESCONTO').AsString);
    qryAux2.SQL.Add('  AND IDMOTIVO       = '+qryRecebimento.FieldByName('IDMOTIVO').AsString);
    qryAux2.SQL.Add('  AND IDMOTIVO       = '+qryRecebimento.FieldByName('IDMOTIVO').AsString);
    qryAux2.Open;


    While Not qryaux2.Eof do
     Begin
      cAuxSeparador    := DecimalSeparator;
      DecimalSeparator := '.';
      If qryAux2.RecordCount = 1
       Then sValorEsperado       := OraNumero(FormatFloat('#0.00',dValorRecebido))
       Else If (dValorRecebido > qryaux2.FieldByName('VALORESPERADO').AsFloat)
             Then sValorEsperado := OraNumero(FormatFloat('#0.00',dValorEsperado))
             Else sValorEsperado := OraNumero(FormatFloat('#0.00',dValorRecebido));
      dValorRecebido             := dValorRecebido - qryaux2.FieldByName('VALORESPERADO').AsFloat;
      DecimalSeparator           := cAuxSeparador;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('UPDATE HSTCONTRIBASS ');
      qryAux.SQL.Add('   SET VALORRECEBIDO  = '+sValorEsperado+',');
      qryAux.SQL.Add('       DATA           = '+QuotedStr(dtRecebimento.Text)+', ');
      qryAux.SQL.Add('       SITRECEBIMENTO = 3 ');
      qryAux.SQL.Add('WHERE MES            = '+QuotedStr(qryRecebimento.FieldByName('MESREFERENCIA').AsString));
      qryAux.SQL.Add('  AND MESCOBRANCA    = '+QuotedStr(qryRecebimento.FieldByName('MESCOBRANCA').AsString));
      qryAux.SQL.Add('  AND IDPLANASS      = '+qryRecebimento.FieldByName('IDPLANASS').AsString);
      qryAux.SQL.Add('  AND IDTITULAR      = '+qryRecebimento.FieldByName('IDTITULAR').AsString);
      qryAux.SQL.Add('  AND IDCONTASS      = '+qryRecebimento.FieldByName('IDDESCONTO').AsString);
      qryAux.SQL.Add('  AND IDMOTIVO       = '+qryRecebimento.FieldByName('IDMOTIVO').AsString);
      qryAux.SQL.Add('  AND NUMRECEBIMENTO = '+qryAux2.FieldByName('NUMRECEBIMENTO').AsString);

      Try
        qryAux.ExecSQL;
        AtualizaTmpDesc(qryRecebimento.FieldByName('NODOCUMENTO').AsString);
      Except
        memResult.Lines.Add(' Erro: Documento nº '+qryRecebimento.FieldByName('NODOCUMENTO').AsString+' não encontrado.');
      End;

      If dValorRecebido < 0
       Then Break;

      qryAux2.Next;
     End;

   End;
end;

procedure TfrmRecebeContribuicao.AtualizaTmpDesc(psNoDocumento:String);
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE TMPDESC');
  qryAux.SQL.Add('SET SITENVIO = 9');
  qryAux.SQL.Add('WHERE IDMODULO       = 17');
  qryAux.SQL.Add('  AND MESREFERENCIA  = '+QuotedStr(qryRecebimento.FieldByName('MESREFERENCIA').AsString));
  qryAux.SQL.Add('  AND MESCOBRANCA    = '+QuotedStr(qryRecebimento.FieldByName('MESCOBRANCA').AsString));
  qryAux.SQL.Add('  AND IDPLANASS      = '+qryRecebimento.FieldByName('IDPLANASS').AsString);
  qryAux.SQL.Add('  AND IDPESSOA       = '+qryRecebimento.FieldByName('IDTITULAR').AsString);
  qryAux.SQL.Add('  AND IDDESCONTO     = '+qryRecebimento.FieldByName('IDDESCONTO').AsString);
  qryAux.SQL.Add('  AND IDMOTIVO       = '+qryRecebimento.FieldByName('IDMOTIVO').AsString);

  If Trim(psNoDocumento) <> ''
   Then qryAux.SQL.Add('  AND NODOCUMENTO    = '+qryRecebimento.FieldByName('NODOCUMENTO').AsString);
   
  try
    qryAux.ExecSQL;
  except
    memResult.Lines.Add(' Erro ao atualizar a tabela temporária de descontos.');
  end;
end;

Procedure TfrmRecebeContribuicao.FazQryRecFolha(pIdPessJur:String);
begin
   (* TMPDESC - SITENVIO - 1 = Recebido com divergência *)
   (*                      2 = Recebido ok              *)

   qryRecebimento.Close;
   qryRecebimento.SQL.Clear;
   qryRecebimento.SQL.Add('SELECT TD.MESCOBRANCA, TD.MESREFERENCIA, TD.VALOR, ');
   qryRecebimento.SQL.Add('       TD.VALORRECEBIDO, TD.IDTITULAR, TD.IDPLANASS,');
   qryRecebimento.SQL.Add('       TD.IDPESSJUR, TD.IDPLANOPREV, TD.IDPESSOA, TD.IDDESCONTO, ');
   qryRecebimento.SQL.Add('       TD.IDMOTIVO, TD.DATARECEBIMENTO, TD.IDPROVENTO, ');
   qryRecebimento.SQL.Add('       TD.NUMPRIORIDADE, TD.ORDEM, TD.CODPROVDESC, TD.MATRICULA, ');
   qryRecebimento.SQL.Add('       TD.INSCRICAONUMERO, TD.DATACOBRANCA, TD.CODRETORNO, ');
   qryRecebimento.SQL.Add('       TD.FLGDESCONTO, TD.FLGDESCFOLHA, TD.CODDOCUMENTOPREV, ');
   qryRecebimento.SQL.Add('       TD.PLNCODIGOPREV, TD.CODDOCUMENTOEFET, TD.PLNCODIGOEFET, ');
   qryRecebimento.SQL.Add('       TD.IDLOTE, TD.ORDEM, TD.IDPESSJUR, TD.SEQPROPOSTA, ');
   qryRecebimento.SQL.Add('       TD.NODOCUMENTO ');
   qryRecebimento.SQL.Add('       FROM TMPDESC TD, FUNDACAO FD ');
   qryRecebimento.SQL.Add('WHERE (TD.MESCOBRANCA = '+QuotedStr(sAnoMesCobrancaTela)+') ');
   qryRecebimento.SQL.Add('  AND (TD.IDMODULO = '+IntToStr(Sistema.IdModulo)+') ');
   qryRecebimento.SQL.Add('  AND (TD.FLGTIPODESC = ''A'') ');
   qryRecebimento.SQL.Add(sFiltro);
   qryRecebimento.SQL.Add('  AND (TD.FLGALTERADOR IS NULL) ');
   qryRecebimento.SQL.Add('  AND (TD.IDPESSJUR = '+pIdPessJur+') ');
   qryRecebimento.SQL.Add('  AND (TD.SITENVIO IN (''2'',''1'')) ');
   qryRecebimento.SQL.Add('  AND (FD.IDPESSOA = FD.IDPESSOA) ');
   qryRecebimento.SQL.Add('  AND (TD.VALOR IS NOT NULL)');

   If rgrpTipoFolha.ItemIndex = 0
    Then qryRecebimento.SQL.Add('  AND (TD.FLGDESCFOLHA = ''P'') ')
    Else qryRecebimento.SQL.Add('  AND (TD.FLGDESCFOLHA = ''B'') ');

   qryRecebimento.SQL.Add('ORDER BY TD.IDLOTE, TD.IDPESSOA ');

   qryRecebimento.Open;
   qryRecebimento.First;
end;


procedure TfrmRecebeContribuicao.FazQryRecBanco(pIdPessJur: String);
begin
   qryRecebimento.Close;
   qryRecebimento.SQL.Clear;
   qryRecebimento.SQL.Add('SELECT H.MES, H.SEQPROPOSTA, H.IDMOTIVO, H.IDPLANASS, H.MESCOBRANCA,');
   qryRecebimento.SQL.Add('       H.IDPLANOPREV, H.IDPESSJUR, H.IDCONTASS, H.IDTITULAR,');
   qryRecebimento.SQL.Add('       H.IDDEPENDENTE, H.VALORESPERADO, H.IDPAGADOR, ');
   qryRecebimento.SQL.Add('       H.IDREGRA, H.VALORRECEBIDO, H.DATA, H.CODPORTFORMA,');
   qryRecebimento.SQL.Add('       H.CODDOCPREV, H.PLNCODPREV, H.DATAPREVISAO, ');
   qryRecebimento.SQL.Add('       H.SITRECEBIMENTO, H.NUMRECEBIMENTO, H.FLGCOBCARNE,');
   qryRecebimento.SQL.Add('       H.CODREFERENCIA, H.IDTIPO, H.IDLOTE, H.RUBRICA, ');
   qryRecebimento.SQL.Add('       E.MATRICULA ');
   qryRecebimento.SQL.Add('FROM HSTCONTRIBASS H, ELEGPATRO E ');
   qryRecebimento.SQL.Add('WHERE H.MESCOBRANCA    = '+QuotedStr(sAnoMesCobrancaTela) );
   qryRecebimento.SQL.Add('  AND H.IDPESSJUR      = '+pIdPessJur);
   qryRecebimento.SQL.Add('  AND H.SITRECEBIMENTO = 1');
   qryRecebimento.SQL.Add('  AND H.FLGCOBCARNE    = 1');
   qryRecebimento.SQL.Add('  AND H.IDTITULAR      = E.IDPESSOA');
   qryRecebimento.SQL.Add('  AND H.IDPESSJUR      = E.IDPESSJUR');
   qryRecebimento.SQL.Add('ORDER BY H.IDLOTE, H.IDTITULAR ');

   qryRecebimento.Open;
   qryRecebimento.First;
end;

(**************************** FUNCOES DO FORMULARIO ************************)
procedure TfrmRecebeContribuicao.bbtnReceberClick(Sender: TObject);
Var
  i                      : integer;
  iIdPatrocinadora,
  iFlgFundacao           : longint;
  sLogTotalPrev,
  sNomePatro,
  sMsgErro               : string;
  bErro,
  bInterrompida          : boolean;
begin
  // Não permitir que esta operação seja efetuada por usuário SUPER
  If UpperCase(Sistema.NomeUsuario) = 'SUPER' Then
    If MsgDlg('ATENÇÃO !!'+#13+#13+
              'Realizar recebimentos de contribuição com o usuário "SUPER" poderá causar erros em operações contábeis.'+#13+
              'Deseja continuar assim mesmo ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    begin
      frmAguarde.Apaga;
      Exit;
    End;

  // Crítica Inicial
  frmAguarde.Mostra('Verificando informações iniciais ...');

  If Trim(cmbMesCob.Text) = ''
   Then begin
    frmAguarde.Apaga;
    MsgDlg('Mês de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk],0);
    cmbMesCob.SetFocus;
    Exit;
   End;

  If Trim(spedAnoCob.Text) = ''
   Then begin
    frmAguarde.Apaga;
    MsgDlg('Ano de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk],0);
    spedAnoCob.SetFocus;
    Exit;
   End;

  For i := 0 to chklstPatro.Items.Count - 1 do
   Begin
    If (chklstPatro.checked[i])
     then Break;
   End;

  If i = (chklstPatro.Items.Count)
   Then begin
    frmAguarde.Apaga;
    MsgDlg('Marque ao menos uma patrocinadora para efetuar o recebimento. ','Erro',mtError,[mbOk],0);
    Exit;
   End;


  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';

  If cmbMesCob.ItemIndex <= 8
   Then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
   Else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);

  memResult.Lines.Clear;

  memResult.Lines.Add('RECEBIMENTO DE CONTRIBUIÇÕES ASSISTENCIAIS - DATA : '+DateToStr(date)+' LISTA DE EXCEÇÕES ');
  memResult.Lines.Add('--------------------------------------------------------------------');
  memResult.Lines.Add('MÊS DE COBRANÇA : '+Trim(sAnoMesCobrancaTela));
  memResult.Lines.Add(' ');
  memResult.Lines.Add('Início do Processamento : '+DateTimeToStr(now));

  frmAguarde.Mostra('Iniciando Recebimento ... ');

  // Para cada patrocinadora, fazer o RECEBIMENTO  da cobrança
  For i := 0 to chklstPatro.Items.Count - 1 Do
   Begin

     If (not chklstPatro.checked[i])
      Then continue;

     If not qryPatro.Locate('Nome',chklstPatro.items[i],[loCaseInsensitive,loPartialKey])
      Then continue;

     iIdPatrocinadora := qryPatro.FieldByName('IDPESSOA').AsInteger;
     sNomePatro       := qryPatro.FieldByName('NOME').AsString;
     iFlgFundacao     := qryPatro.FieldByName('FLGFUNDACAO').AsInteger;

     // Gravar memo de Resultado
     memResult.Lines.Add('--------------------------------------------------------------------');
     memResult.Lines.Add('Patrocinadora : '+qryPatro.FieldByName('NOME').AsString);
     memResult.Lines.Add('--------------------------------------------------------------------');

     bErro := False;

     If not dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.StartTransaction;

     // para ser usado nas funcoes
     // Receber contribuicoes da patrocinadora :
     // Para cada lote fazer
     //    -> Ler da tmpdesc
     //    -> Verificar se existe no hst
     //    -> Se existe, atualizar


     // Receber Contribuições Assistenciais da Folha da Patrocinadora
     If (rgrpTipoFolha.ItemIndex = 0) or (rgrpTipoFolha.ItemIndex = 1)
      Then begin

       If not RecebeContribuicaoFolha(iIdPatrocinadora, iFlgFundacao, sNomePatro)
        Then bErro := True;

      End // If (rgrpTipoFolha.ItemIndex = 0) or (rgrpTipoFolha.ItemIndex = 1)

     // Receber Contribuições Assistenciais via Boleto Bancário
      Else begin

       If not RecebeContribuicaoBanco(iIdPatrocinadora, iFlgFundacao, sNomePatro)
        Then bErro := True;

      End; // If (rgrpTipoFolha.ItemIndex = 0) or (rgrpTipoFolha.ItemIndex = 1)

     If bNaoExisteRecebPatro
      Then Begin
        frmAguarde.Apaga;
        MsgDlg(' Não existem contribuições a serem recebidas da Patrocinadora ' + sNomePatro +'.','Informação',mtInformation,[mbOk,mbHelp],0);
        memResult.Lines.Add(' ');
        memResult.Lines.Add('[AVISO] - Não existem contribuições a serem recebidas da Patrocinadora.');

        If dtmBaseDados.dbBaseDados.InTransaction
         Then dtmBaseDados.dbBaseDados.RollBack;

        Continue;
      End;  // If bNaoExisteRecebPatro

      If not FechaMesSistema (qryAux,
                              sAnoMesCobrancaTela,
                              DateToStr(date),
                              iIdPatrocinadora,
                              cteIdModuloAdmPREV,
                              'R', 'A')
       Then begin
         bErro := True;
         memResult.Lines.Add('[ERRO ] - Fechamento do Recebimento de Contribuições da patrocinadora.');
       End;

      If dtmBaseDados.dbBaseDados.InTransaction
       Then begin

         sLogTotalPrev := 'Recebimento Contrib.Assistenciais. - Mês '+sAnoMesCobrancaTela+' - Patro: '+sNomePatro;
         frmAguarde.Apaga;
         pnlResult.BringToFront;

         If (bErro)
          Then begin
            memResult.Lines.Add('**********************************************');
            memResult.Lines.Add('ATENÇÃO!!');
            memResult.Lines.Add('Recebimento da Patrocinadora ' + sNomePatro + ' foi efetuado com problemas em algumas contribuições.');
            memResult.Lines.Add('Favor corrigir os erros apresentados no log de erros.');
            memResult.Lines.Add('É RECOMENDÁVEL QUE SEJA DESFEITO O RECEBIMENTO.');
            memResult.Lines.Add('**********************************************');

            bInterrompida := False;

            If Not GravaLogTOTALPREV(sLogTotalPrev)
            Then Begin
              bErro := True;
              memResult.Lines.Add(' ');
              memResult.Lines.Add('[ERRO ] - Gravação do Log.');
            End;

            If dtmBaseDados.dbBaseDados.InTransaction
             Then dtmBaseDados.dbBaseDados.Commit;
          End
          Else begin
            bInterrompida := False;
            If not GravaLogTOTALPREV(sLogTotalPrev)
             Then begin
               bErro := True;
               memResult.Lines.Add(' ');
               memResult.Lines.Add('[ERRO ] - Gravação do Log.');
             End;
            If dtmBaseDados.dbBaseDados.InTransaction
             Then dtmBaseDados.dbBaseDados.Commit;
         End;
      End;
      memResult.Lines.Add('--------------------------------------------------------------------');

   End; // For i := 0 to chklstPatro.Items.Count - 1 Do


end;

procedure TfrmRecebeContribuicao.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.Visible := True;
end;

procedure TfrmRecebeContribuicao.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmRecebeContribuicao.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmRecebeContribuicao.btncancelaprogressClick(Sender: TObject);
begin
  //inherited;
  bCancelaEnvio := true;
  pnlProgresso.Visible := False;
  pnlOpcoes.enabled := true;

  dtmBaseDados.dbBaseDados.RollBack;
  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM DUAL');
    Open;
    Close;
  end;
  Application.ProcessMessages;
end;

procedure TfrmRecebeContribuicao.rdgopcoesClick(Sender: TObject);
Var Ind: Integer;
    sIdPessJur : string;
begin
  inherited;
  sIdPessJur := '(';
  chklstPatro.Enabled:=True;
  With chklstPatro do
   For Ind:= 0 to Items.Count - 1 do
   begin

     if Checked[Ind] then
     begin
       If qryPatro.Locate('NOME', Items[Ind], [loPartialKey]) then
         sIdPessJur := sidPessjur + qryPatro.FieldByName('IDPESSOA').AsString + ',';
     end;
   end;
   sIdPessJur[length(sIdpessjur)] := ')';

   sFiltro:='  AND (TD.IDPESSJUR in '+ sIdPessJur + ') '+#13+#10;

   Case rgrpTipoFolha.ItemIndex Of
     0 : sFiltro := sFiltro+
                  '  AND (TD.FLGDESCFOLHA = ''P'') '+#13+#10+
                  '  AND (TD.IDPESSJUR <> FD.IDPESSOA) '+#13+#10;
     2 : sFiltro := sFiltro+
                  '  AND (TD.FLGDESCFOLHA = ''P'') '+#13+#10+
                  '  AND (TD.IDPESSJUR = FD.IDPESSOA) '+#13+#10;
     3 : sFiltro := sFiltro+
                  '  AND (TD.FLGDESCFOLHA = ''B'') '+#13+#10;
   end; {Case}

   If (rgrpTipoFolha.ItemIndex = 0)And
      (IntegraBack.Contabilidade = 'N') then
   begin
     MsgDlg('Para utilizar essa opção, é necessário'+#13+
            'que o sistema esteja integrado com a Contabilidade.',
            'Informação', mtError, [mbOk,mbHelp], 0);
     rgrpTipoFolha.ItemIndex:=-1;
   end;
end;

procedure TfrmRecebeContribuicao.MarcaClick(Sender: TObject);
var i : integer;
begin
  inherited;
  for i := 0 to chklstPatro.Items.Count - 1 do
    chklstPatro.Checked[i] := not chklstPatro.Checked[i];
end;

procedure TfrmRecebeContribuicao.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  If (AMonth >= 1) and (AMonth <= 12)
   Then begin
     cmbMesCob.ItemIndex := AMonth - 1;
     cmbMesCob.Text := cmbMesCob.Items[cmbMesCob.ItemIndex];
     spedAnoCob.Text := IntToStr(AYear);
   End;
  spedAnoCob.Text := IntToStr(AYear);
  dtRecebimento.Text := DateToStr(date);

  sFiltro:='';
  sAnoMesCobrancaTela:='';
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then
  begin
     cmbMesCob.ItemIndex := AMonth - 1;
     cmbMesCob.Text := cmbMesCob.Items[cmbMesCob.ItemIndex];
     cmbMesCob.ItemIndex := AMonth - 1;
     spedAnoCob.Text := IntToStr(AYear);
  end;

  // Preencher chkList da Patrocinadora
  qrymotivo.close;  qrymotivo.open;

  qryPatro.Close;   qryPatro.Open;
  CriaLista(chklstPatro,qrypatro);
  //=========
  bbtnVerResultado.Visible := False;

  // Configurar painéis
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  pnlProgresso.Visible := False;

  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible := False;
end;

procedure TfrmRecebeContribuicao.btnDesfazerClick(Sender: TObject);
Var
  i,
  iIdPatrocinadora :  Integer;
  sNomePatro       :  String;
begin
  inherited;
  // Crítica Inicial
  frmAguarde.Mostra('Verificando informações iniciais ...');

  If Trim(cmbMesCob.Text) = ''
   Then begin
    frmAguarde.Apaga;
    MsgDlg('Mês de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk],0);
    cmbMesCob.SetFocus;
    Exit;
   End;

  If Trim(spedAnoCob.Text) = ''
   Then begin
    frmAguarde.Apaga;
    MsgDlg('Ano de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk],0);
    spedAnoCob.SetFocus;
    Exit;
   End;

  For i := 0 to chklstPatro.Items.Count - 1 do
   Begin
    If (chklstPatro.checked[i])
     then Break;
   End;

  If i = (chklstPatro.Items.Count)
   Then begin
    frmAguarde.Apaga;
    MsgDlg('Marque ao menos uma patrocinadora para efetuar o recebimento. ','Erro',mtError,[mbOk],0);
    Exit;
   End;

  // ***************************************************************************
  // Desfazer Recebimento de Contribuições :
  // 1. Atualizar TmpDesc com sitenvio = 2 caso esperado = recebido
  //                       ou sitenvio = 1 caso esperado <> recebido
  // 2. Atualizar HstContribAss colocando a situacao das contribuicoes
  //    dos participantes como 1 (enviada e nao recebida), valorrecebido = nulo
  //    e data do recebimento = nulo
  // 3. Atualizar flag na ctrlinterface (flgvoltatmp = 0)

  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';

  If Not dtmBaseDados.dbBaseDados.InTransaction
   Then dtmBaseDados.dbBaseDados.StartTransaction;

  If cmbMesCob.ItemIndex <= 8
   Then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
   Else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);

  memResult.Lines.Clear;

  memResult.Lines.Add('DESFAZER RECEBIMENTO DE CONTRIBUIÇÕES ASSISTENCIAIS - DATA : '+DateToStr(date)+' LISTA DE EXCEÇÕES ');
  memResult.Lines.Add('----------------------------------------------------------------------------');
  memResult.Lines.Add('MÊS DE COBRANÇA : '+Trim(sAnoMesCobrancaTela));
  memResult.Lines.Add(' ');
  memResult.Lines.Add('Início do Processamento : '+DateTimeToStr(now));

  frmAguarde.Apaga;
  frmAguarde.Mostra('Iniciando Desfazer ... ');

  For i := 0 to chklstPatro.Items.Count - 1 Do
   Begin

     If (not chklstPatro.checked[i])
      Then continue;

     If not qryPatro.Locate('Nome',chklstPatro.items[i],[loCaseInsensitive,loPartialKey])
      Then continue;

     iIdPatrocinadora := qryPatro.FieldByName('IDPESSOA').AsInteger;
     sNomePatro       := qryPatro.FieldByName('NOME').AsString;

     // Gravar memo de Resultado
     memResult.Lines.Add('--------------------------------------------------------------------');
     memResult.Lines.Add('Patrocinadora : '+qryPatro.FieldByName('NOME').AsString);
     memResult.Lines.Add('--------------------------------------------------------------------');

     If not dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.StartTransaction;

     // Operação de Desfazer para qualquer tipo de folha.
     If (rgrpTipoFolha.ItemIndex = 0) or (rgrpTipoFolha.ItemIndex = 1)
      Then Begin
        If Not DesfazRecebContribFolha(iIdPatrocinadora)
         Then Begin
           dtmBaseDados.dbBaseDados.Rollback;
           memResult.Lines.Add('Erros ocorridos cancelaram toda a operação de desfazer da patrocinadora '+qryPatro.FieldByName('NOME').AsString);
         End
         Else Begin
           dtmBaseDados.dbBaseDados.Commit;
           memResult.Lines.Add('Operação de desfazer da patrocinadora '+qryPatro.FieldByName('NOME').AsString+' terminado com sucesso.');
         End;
        pnlResult.BringToFront;
        frmAguarde.Apaga;
      End
     // Operação de Desfazer para Recebimento Bancário.
      Else Begin
        If MsgDlg('ATENÇÃO !!'+#13+#13+
                  'A Operação de DESFAZER RECEBIMENTO de BOLETO BANCÁRIO só irá ser realizada nos dados do Assistencial.'+#13+
                  'Para desfazer o recebimento bancário, efetue a devida operação no sistema de CONTAS A RECEBER.'+#13+
                  'Deseja continuar assim mesmo ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
         Then Exit;

        If Not DesfazRecebContribBanco(iIdPatrocinadora)
         Then Begin
           dtmBaseDados.dbBaseDados.Rollback;
           memResult.Lines.Add('Erros ocorridos cancelaram toda a operação de desfazer da patrocinadora '+qryPatro.FieldByName('NOME').AsString);
         End
         Else Begin
           dtmBaseDados.dbBaseDados.Commit;
           memResult.Lines.Add('Operação de desfazer da patrocinadora '+qryPatro.FieldByName('NOME').AsString+' terminado com sucesso.');
         End;
        pnlResult.BringToFront;
        frmAguarde.Apaga;
      End; // Else Begin

   End;
end;

end.
