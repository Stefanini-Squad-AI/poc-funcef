unit FAbertFechaLote;

// Alterações:
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 22/06/2007
// Rotina      : ColocaDescricaoLote
// Pendência   : s/ numero
// Descricao   : Inclui idmodulo do BENEFICIOPREV.
//------------------------------------------------------------------------------//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables, Wwquery,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, uDataBAse, UMensErro, uAdmPrevFB, DBaseDados,
  USistema, UFuncoesUteisFB, UobjFolha;

type
  TfrmAbertFechaLote = class(TfrmSairAjuda)
    pgctrlLote: TPageControl;
    tbsAbertLote: TTabSheet;
    tbsFechaLote: TTabSheet;
    btnAbrirLote: TBitBtn;
    btnFechaLote: TBitBtn;
    edtDescrLote: TEdit;
    lblDescLote: TLabel;
    qryAbreLote: TwwQuery;
    Label2: TLabel;
    qryFechaLote: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    dsLoteAbert: TwwDataSource;
    gbPagamento: TGroupBox;
    seAno: TSpinEdit;
    lblAno: TLabel;
    cboxMes: TComboBox;
    lblMes: TLabel;
    edtDataFecha: TCMDateTimePicker;
    Animate1: TAnimate;
    lblAguarde: TLabel;
    updFechaLote: TUpdateSQL;
    qryaux: TwwQuery;
    tbsReabreLote: TTabSheet;
    bbtnReabreLote: TBitBtn;
    dbgReabre: TwwDBGrid;
    qryReabreLote: TwwQuery;
    dsLotePrevia: TwwDataSource;
    rgpConcbenef: TRadioGroup;
    updReabreLote: TUpdateSQL;
    RdgTpFolha: TRadioGroup;
    lblDataPagamento: TLabel;
    edtDataAbert: TCMDateTimePicker;
    tbsEliminacao: TTabSheet;
    dbgElimina: TwwDBGrid;
    qryEliminaLote: TwwQuery;
    dsEliminaLote: TwwDataSource;
    qryEliminaLoteIDLOTE: TFloatField;
    qryEliminaLoteMESREFERENCIA: TStringField;
    qryEliminaLoteDESCRICAO: TStringField;
    qryEliminaLoteFLGIDATMP: TFloatField;
    qryEliminaLoteJAPROC: TStringField;
    qryEliminaLoteFLGVOLTATMP: TFloatField;
    qryEliminaLoteEFETIVADO: TStringField;
    qryEliminaLoteDATAPAGAMENTO: TDateTimeField;
    qryEliminaLoteFLGPREPARADO: TFloatField;
    qryEliminaLoteDESCRTIPOFOLHA: TStringField;
    qryEliminaLoteQTREGS: TFloatField;
    qryEliminaLoteVLRTOTAL: TFloatField;
    Panel1: TPanel;
    btnElimina: TBitBtn;
    procedure btnAbrirLoteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboxMesChange(Sender: TObject);
    procedure seAnoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFechaLoteClick(Sender: TObject);
    procedure pgctrlLoteChange(Sender: TObject);
    procedure bbtnReabreLoteClick(Sender: TObject);
    procedure RdgTpFolhaClick(Sender: TObject);
    procedure btnEliminaClick(Sender: TObject);
  private
    { Private declarations }
    Ini:TTime;
    Contador : Integer;
    sSQL : String;
    sMesReferencia : string;
    procedure ColocaDescricaoLote;
  public
    { Public declarations }
  end;

var
  frmAbertFechaLote: TfrmAbertFechaLote;

implementation

{$R *.DFM}

procedure TfrmAbertFechaLote.ColocaDescricaoLote;
 var sUltDescricao: string;
begin
  sMesReferencia:=Trim(seAno.Text)+'/'+IntCod(cboxMes.ItemIndex+1,2);
  if (Sistema.IdModulo = 16) or
     (Sistema.IdModulo = 454) then 
    sUltDescricao:='Benefícios Concedidos em '+cboxMes.Text+' de '+seAno.Text
  else
    case RdgTpFolha.ItemIndex of
      1: sUltDescricao:='Preparo do Abono do ano '+copy(sMesReferencia,1,4);
      2: sUltDescricao:='Preparo da Antecipação de Abono no mês '+
           copy(sMesReferencia,6,2)+'/'+copy(sMesReferencia,1,4);
      3: sUltDescricao:='Reprocessamento do mês '+
           copy(sMesReferencia,6,2)+'/'+copy(sMesReferencia,1,4);
      4: sUltDescricao:='Pagamento Pendente do mês '+
           copy(sMesReferencia,6,2)+'/'+copy(sMesReferencia,1,4);
      5: sUltDescricao:='Extra-Folha do mês '+
           copy(sMesReferencia,6,2)+'/'+copy(sMesReferencia,1,4);
    else
      sUltDescricao:='Preparo de Manutenção do mês '+copy(sMesReferencia,6,2)+
        '/'+copy(sMesReferencia,1,4);
    end;
  edtDescrLote.text:=sUltDescricao;
  //ATUALIZAÇÃO AUTOMÁTICA DA DATA DE PAGAMENTO PELO CALENDÁRIO.
  edtDataAbert.Text:=CriticaDataCobrancaSit(qryAux, IntToStr(iIdFundacao), '',
    'AS', 'P', IntCod(cboxMes.ItemIndex+1,2), seAno.Text);
end;

procedure TfrmAbertFechaLote.FormShow(Sender: TObject);
 var AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then
  begin
    cboxMes.ItemIndex:=AMonth-1;
    cboxMes.Text:=cboxMes.Items[cboxMes.ItemIndex];
  end;
  seAno.Text:=IntToStr(AYear);

  // Buscar data Prevista para pagamento
  edtDataAbert.Text:=CriticaDataCobrancaSit(qryAux, IntToStr(iIdFundacao), '',
    'AS', 'P', Copy(DateToStr(date),4,2), Copy(DateToStr(date),7,4));

  if (Sistema.IdModulo = 16) or
     (Sistema.IdModulo = 454) then 
  begin
    RdgTpFolha.visible:=false;
    rgpConcbenef.visible:=true;
    tbsFechaLote.TabVisible:=true;
    tbsReabreLote.TabVisible:=true;
    tbsEliminacao.Tabvisible:= false;
    caption:='Abertura e Fechamento de Lotes de Concessão';
  end
  else
  begin
    RdgTpFolha.visible:=true;
    rgpConcbenef.visible:=false;
    tbsFechaLote.TabVisible:=false;
    tbsReabreLote.TabVisible:=false;
    tbsEliminacao.Tabvisible:= true;
    caption:='Abertura de Lotes de Manutenção';
  end;

  pgctrlLote.ActivePage := tbsAbertLote;
  qryFechaLote.Open;
  qryReabreLote.open;

  qryEliminaLote.parambyname('IDFUNDACAO').asinteger:=iidfundacao;
  qryEliminaLote.Open;
end;

procedure TfrmAbertFechaLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryFechaLote.Close;
  qryReabreLote.close;
end;

procedure TfrmAbertFechaLote.RdgTpFolhaClick(Sender: TObject);
begin
  inherited;
  ColocaDescricaoLote;
end;

procedure TfrmAbertFechaLote.cboxMesChange(Sender: TObject);
begin
  inherited;
  ColocaDescricaoLote;
end;

procedure TfrmAbertFechaLote.seAnoChange(Sender: TObject);
begin
  inherited;
  ColocaDescricaoLote;
end;

procedure TfrmAbertFechaLote.btnAbrirLoteClick(Sender: TObject);
 var sIdLote, sdatapreparo, sdatapagamento, sincluimes, smsg, ssql: String;
     iflgconcessao, iflgpreparado, iflgtipofolha: integer;
     cIdaTmp: Char;
begin
  inherited;
  // Critica Dados
  cIdaTmp:='0';
  iflgtipofolha:=0;
  if (Sistema.IdModulo = 16) or
     (Sistema.IdModulo = 454) then 
  begin
    if rgpConcbenef.itemindex = -1 then
    Begin
      MsgDlg('É necessário selecionar a informação '+#13+'''Pagamento do mês da Concessão''.','Erro', mtError, [mbOk, mbHelp], 0);
      rgpConcbenef.SetFocus;
      Exit;
    End;
    sincluimes:=inttostr(rgpConcbenef.itemindex);
    iflgconcessao:=1;
    iflgpreparado:=1;
  end
  else
  begin
    sincluimes:='NULL';
    iflgconcessao:=0;
    iflgpreparado:=0;

    //ALTERAÇÃO NA ORDEM DE EXECUÇÃO DA VERIFICAÇÃO DE OUTROS LOTES
    smsg:='Já existe lote(s) de ';
    Case RdgTpFolha.itemindex of
      0: begin
           iflgtipofolha:=0;
           smsg:=smsg+'manutenção anterior ao mês selecionado que não foi efetivado.';
         end;
      1: begin
           iflgtipofolha:=3;
           smsg:=smsg+'abono anual anterior ao mês selecionado que não foi efetivado.';
         end;
      2: begin
           iflgtipofolha:=4;
           smsg:=smsg+'antecipação de abono anual anterior ao mês selecionado que não foi efetivado.';
         end;
      3: begin
           iflgtipofolha:=6;
           smsg:=smsg+'reprocessamento anterior ao mês selecionado.';
         end;
      4: begin
           iflgtipofolha:=1;
           smsg:=smsg+'pagamento pendente anterior ao mês selecionado.';
         end;
      5: begin
           iflgtipofolha:=2;
           smsg:=smsg+'folha extra aberto anterior ao mês selecionado.';
         end;
      else smsg:='';
    end;

    If smsg='' then Exit;

   if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

   if not Sistema.GravaLogOperacoes('Abertura de Lote de Manutenção.') then
     Raise Exception.Create('Não foi possível gravar o log.')
   else
     dtmBaseDados.dbBaseDados.Commit;

    ssql := 'SELECT IDLOTE FROM CTRLINTERFACE WHERE (MESREFERENCIA < '+
             QuotedStr(sMesReferencia)+') AND (TIPO = ''B'') '+
            'AND (FLGPREPARADO = 0 OR FLGPREPARADO IS NULL) '+
            'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL) '+
            'AND (FLGCONCESSAO = 0 OR FLGCONCESSAO IS NULL) '+
            'AND (IDREFERENCIA IS NULL) '+
            'AND (IDPESSOA = '+inttostr(iidfundacao)+') '+
            'AND (FLGTIPOFOLHA = '+inttostr(iflgtipofolha)+')';
    With qryAux do
    begin
      Close;
      Sql.Clear;
      Sql.Add(ssql);
      Open;
      If Not IsEmpty then
      begin
        //Guarda e mostra o número dos lotes que estão em aberto do tipo que o usuário escolheu
        qryAux.First;
        sIdLote := '';
        While Not qryAux.Eof Do
        Begin
          sIdLote := sIdLote + qryAux.FieldByName('IDLOTE').AsString+' e ';
          qryAux.Next;
        End;
        sIdLote := Copy(sIdLote, 1, Length(sIdLote) - 3);
        sIdLote := sIdLote+'.';

        If qryAux.RecordCount > 1 Then
        Begin
          If MsgDlg(smsg+' Os números dos lotes são: '+sIdLote+#13+'Esta operação não pode ser efetuada.', 'Informação',
            mtInformation, [mbOK], 0) = mrOK then Exit;
        End
        Else
        Begin
          If MsgDlg(smsg+' O número do lote é: '+sIdLote+#13+'Esta operação não pode ser efetuada.', 'Informação',
            mtInformation, [mbOK], 0) = mrOK then Exit;
        End;

      end;
    end; {With}

    smsg:='Já existe um lote de ';
    Case RdgTpFolha.itemindex of
      0: smsg:=smsg+'manutenção aberto para o mês selecionado.';
      1: smsg:=smsg+'abono anual aberto para o mês selecionado.';
      2: smsg:=smsg+'antecipação de abono anual aberto para o mês selecionado.';
      3: smsg:=smsg+'reprocessamento aberto para o mês selecionado.';
      4: smsg:=smsg+'pagamento pendente aberto para o mês selecionado.';
      5: smsg:=smsg+'folha extra aberto para o mês selecionado.';
      else smsg:='';
    end;

    If FazQuery(qryAux,
         'SELECT IDLOTE FROM CTRLINTERFACE WHERE (MESREFERENCIA = '+
         QuotedStr(sMesReferencia)+') AND (TIPO = ''B'') '+
         'AND (FLGPREPARADO = 0 OR FLGPREPARADO IS NULL) '+
         'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL) '+
         'AND (FLGCONCESSAO = 0 OR FLGCONCESSAO IS NULL) '+
         'AND (IDREFERENCIA IS NULL) '+
         'AND (IDPESSOA = '+inttostr(iidfundacao)+') '+
         'AND (FLGTIPOFOLHA = '+inttostr(iflgtipofolha)+')') then
    begin
       If qryAux.recordcount >= SistemaFolha.FLGNUMLOTES then
       begin
          sMsg := 'O Número de Lotes de Manutenção excedeu o limite máximo estabelecido '+chr(13);
          sMsg := sMsg + 'na parametrização do Sistema. ';
          MsgDlg(smsg, 'Informação',mtInformation, [mbOK,mbHelp], 0);
          Exit;
       end else
       begin
           If MsgDlg(smsg+#13+'Deseja criar outro lote ? (S/N)', 'Informação',
           mtInformation, [mbYes, mbNo, mbHelp], 0) = mrNo then
           Exit;
       end;
    end;
  end;
  sdatapreparo:='TO_DATE('''+formatdatetime('dd/mm/yyyy',now)+''',''DD/MM/YYYY'')';
  sdatapagamento:='TO_DATE('''+edtDataAbert.Text+''',''DD/MM/YYYY'')';

  If (cboxMes.Text = '') Or (seAno.Text = '') Or (edtDescrLote.Text = ' ') or
     (edtDataAbert.Text = '') Then
  Begin
    MsgDlg('Faltam Preencher Campos ...','Erro', mtError, [mbOk, mbHelp], 0);
    edtDataAbert.SetFocus;
    Exit;
  End;

  // A data de previsao tem que ser no mes indicado
  If Copy(edtDataAbert.Text,7,4)+'/'+Copy(edtDataAbert.Text,4,2) < sMesReferencia then
  begin
    MsgDlg('A previsão de pagamento deve ser posterior ou no mês de competência.','Erro',
      mtError,[mbOK, mbHelp],0);
    edtDataAbert.SetFocus;
    Exit;
  end;

  // Liga Animate
  lblAguarde.Visible  :=True;
  lblAguarde.Update;
  Animate1.Visible:=True;
  Animate1.Active :=True;

  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  //Se Lote de Pagamento Pendente ou Folha Extra então FlgIdaTmp = 1
  If iFlgTipoFolha In [1,2] then cIdaTmp:='1'
  else cIdaTmp:='0';

  sSQL:='INSERT INTO CTRLINTERFACE (IDLOTE, FLGIDATMP, IDPESSOA, '+
        'FLGVOLTATMP, FLGIDAINTERFACE, FLGVOLTAINTERFACE, FLGEMITIUCC, '+
        'DATAIDATMP, DATAVOLTATMP, DATAIDAINTERFACE, DATAVOLTAINTERFA, '+
        'DATAEMITIUCC, NUMREG, VLRTOTAL, MESREFERENCIA, TIPO, FLGPREPARADO, '+
        'DATAPREPARO, DATAPAGAMENTO, DESCRICAO, FLGATRASODEVOL, FLGCONCESSAO, '+
        'FLGINCLUIMESCONC, FLGTIPOFOLHA) '+
        'VALUES ('+IntToStr(LeUltRegistro(Nil,'CTRLINTERFACE'))+','+cIdaTmp+','+
        IntToStr(iIdFUNDACAO)+','+'0,'+'0,'+'0,'+'0,'+'NULL,'+'NULL,'+
        'NULL,'+'NULL,'+'NULL,'+'NULL,'+'NULL,'+QuotedStr(sMesReferencia)+','+
        QuotedStr('B')+','+inttostr(iflgpreparado)+','+sdatapreparo+','+
        sdatapagamento+','+QuotedStr(edtDescrLote.text)+','+QuotedStr('N')+','+
        inttostr(iflgconcessao)+','+sincluimes+','+inttostr(iflgtipofolha)+')';

  With qryAbreLote do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSQL);
    Try
      ExecSQL;
      dtmBaseDados.dbBaseDados.Commit;
    except
      on E:EDBEngineError do
      begin
        MostrarErro(E);
        dtmBaseDados.dbBaseDados.Rollback;
        Exit;
      end;
    end;
  end; {With}
  // Desliga Animate
  lblAguarde.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;
  // Mostra Tempo
  Application.ProcessMessages;
  MsgDlg('Lote Aberto com Sucesso','Informação',mtInformation,[mbOk],0);
end;

procedure TfrmAbertFechaLote.btnFechaLoteClick(Sender: TObject);
begin
  inherited;
  // Critica Dados
  If (edtDataFecha.Text = '') Then
  Begin
    MsgDlg('Faltam Preencher Campos ...','Erro', mtError, [mbOk, mbHelp], 0);
    edtDataFecha.SetFocus;
    Exit;
  End;

  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  qryFechaLote.First;
  While Not qryFechaLote.EOF Do
  Begin
    If  qryFechaLote.FieldByName('FECHALOTE').AsString = '1' Then
    begin
      sSQL :='UPDATE CTRLINTERFACE SET     '+
             'FLGIDATMP = 1               ,'+
             'DATAIDATMP = TO_DATE('''+edtDataFecha.Text+''',''DD/MM/YYYY'')'+
             'WHERE IDLOTE = '+ qryFechaLote.FieldByName('IDLOTE').AsString  ;

      With qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Try
          ExecSQL;
        Except
          On E:EDBEngineError do
          begin
            MostrarErro(E);
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
          End;
        End;
      End;
    End;
    qryFechaLote.Next;
  End;
  dtmBaseDados.dbBaseDados.Commit;
  qryFechaLote.Close;
  qryFechaLote.Open;
end;

procedure TfrmAbertFechaLote.bbtnReabreLoteClick(Sender: TObject);
begin
  inherited;
  // Critica Dados
  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  qryReabreLote.First;
  While Not qryReabreLote.EOF Do
  Begin
    If  qryReabreLote.FieldByName('REABRELOTE').AsString = '1' Then
    begin
      sSQL :='UPDATE CTRLINTERFACE SET '+
             'FLGIDATMP = 0, '+
             'DATAIDATMP = NULL '+
             'WHERE IDLOTE = '+ qryReabreLote.FieldByName('IDLOTE').AsString  ;
      With qryAux do
      begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Try
          ExecSQL;
        Except
          On E:EDBEngineError do
          begin
            MostrarErro(E);
            dtmBaseDados.dbBaseDados.Rollback;
            Exit;
          End;
        End;
      End;
    End;
    qryReabreLote.Next;
  End;
  dtmBaseDados.dbBaseDados.Commit;
  qryReabreLote.Close;
  qryReabreLote.Open;
end;

procedure TfrmAbertFechaLote.pgctrlLoteChange(Sender: TObject);
begin
  inherited;
   qryFechaLote.Close;
   qryFechaLote.Open;
   qryReabreLote.Close;
   qryReabreLote.Open;
end;

procedure TfrmAbertFechaLote.btnEliminaClick(Sender: TObject);
var
   ssql : String;
begin
  inherited;

  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  sSQL :='DELETE CTRLINTERFACE '+
         'WHERE IDLOTE = '+ qryEliminaLote.FieldByName('IDLOTE').AsString  ;
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.Add(ssql);
  Try
      qryAux.ExecSQL;
  Except
     On E:EDBEngineError do
     begin
         MostrarErro(E);
         dtmBaseDados.dbBaseDados.Rollback;
         Exit;
     End;
  End;

  If MsgDlg('Deseja realmente excluir esse lote?', 'Confirmação', mtConfirmation,
    [mbYes, mbNo, mbHelp], 0) = mrYes Then
    dtmBaseDados.dbBaseDados.Commit
  Else
    dtmBaseDados.dbBaseDados.RollBack;

  qryEliminaLote.Close;
  qryEliminaLote.parambyname('IDFUNDACAO').asinteger:=iidfundacao;
  qryEliminaLote.Open;
end;

end.
{==============================================================================|
| UNIT: FABERTFECHALOTE                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CONTROLA A ABERTURA DE LOTES DE CONCESSÃO OU DE MANUTENÇÃO, E O FECHAMEN-  |
| TO DE LOTES DE CONCESSÃO. IDENTIFICA O MÓDULO E SE CONFIGURA DE ACORDO. NO   |
| CASO DO ADMPREV TRATA APENAS LOTES DE CONCESSÃO (IDMODULO = 16). NO CASO DA  |
| FOLHA DE BENEFÍCIOS TRATA OS LOTES DE MANUTENÇÃO.                            |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/07/2001 A 03/07/2001                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   INCLUSAO DO COMPONENTE rgpConcbenef PARA SELECAO DO PARAMETRO DE PAGAMENTO |
| DO MES DE CONCESSAO.                                                         |
|   INCLUSAO DA pagina REABRE LOTE                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/02/2002 A 04/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12b (FOLHA)                                      |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ADAPTAÇÃO DO FORM DO ADMPREV PARA SE CONFIGURAR TAMBÉM PARA A FOLHA.       |
|   GRAVAÇÃO DO CAMPO FLGTIPOFOLHA. CONTROLE DE EXISTÊNCIA DE LOTE DE MANUT.   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 27/02/2002 A 27/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12d                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - NÃO SE OBRIGA QUE A DATA DE PAGAMENTO SEJA NO MÊS DE REFERÊNCIA, MAS OU NO |
| PRÓPRIO MÊS OU NUM MÊS POSTERIOR.                                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/03/2002 A 08/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12e                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - SÓ VAI SER PERMITIDO ABRIR UM LOTE (MANUTENCAO, ABONO OU ANTECIPACAO DE  |
|      ABONO) SE O LOTE DO MES ANTERIOR ESTIVER EFETIVADO                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/05/2002 A 23/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12u                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - IMPLEMENTACAO DA OPCAO DE ELIMINACAO DE LOTES                            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B. Marins.                                             |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/06/2002 A 18/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Opção para criar lote de pagamento pendente e    |
|                              folha extra.                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13i                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Permitir a abertura de lotes de acordo com uma   |
|                             quantidade pre-estabelecida nos parametros gerais|
|                             do Sistema.                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/11/2002 A 14/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()   Pendência 10516.                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Opção para criar lote de "Acerto pós morte".     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/01/2003 A 13/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Mostrar na mensagem os números dos lotes abertos no mês anterior que não|
|    foram efetivados, e mostrar um confirmação na hora de excluir um lote.    |
|                                                                              |
|    - Pendência 11299.                                                        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2003 A 09/07/2003                         |
| PENDÊNCIA: 14442                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03D                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTI-FUNDAÇÃO.                                             |
|                                                                              |
|------------------------------------------------------------------------------}

