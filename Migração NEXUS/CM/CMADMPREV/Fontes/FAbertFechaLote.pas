// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 63067 - KTN 524520
//Responsável : Fernando Xavier
//Data        : 05/01/2012
//Descrição   : Cadastro Previdenciário - Resgate de Contribuições
//DFM         : lblResgateParcelado;rbResgateParceladoSim;rbResgateParceladoNao;
//------------------------------------------------------------------------------
//Pendência   : SOL 153646 KINTANA 1161311
//Responsável : BRUNO AZEVEDO
//Data        : 25/02/2011
//Descrição   : Trava ao abrir um lote com mês de referência divergente com mês de pag.
//------------------------------------------------------------------------------
// Pencencia  SOL 137663  Kintana 833903
// Autor(a)   : Renato Visoni
// Descrição  : inclusão do flag Lote Processado
//--------------------------------------------------------------------------------
// Autor(a)   : Fernando Xavier
// SOL 135541 Kintana 807191
// Data       : 20/07/2010
// Descrição  : inclusão do flag Lote para Pagamento de Resgate
//--------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 16/08/2007
// Alteração   : Troca do DateToStr para FormatDateTime
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FAbertFechaLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables, Wwquery,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, uDataBAse, UMensErro, UAdmPrev, DBaseDados,
  USistema, UFuncoesUteis;

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
    btnElimina: TBitBtn;
    qryEliminaLote: TwwQuery;
    dsEliminaLote: TwwDataSource;
    Panel1: TPanel;
    rbProcessadoSim: TRadioButton;
    rbProcessadoNao: TRadioButton;
    lblLoteProcessado: TLabel;
    Panel2: TPanel;
    lbl_abrelote: TLabel;
    rdsim: TRadioButton;
    rdnao: TRadioButton;
    lblResgateParcelado: TLabel;
    rbResgateParceladoSim: TRadioButton;
    rbResgateParceladoNao: TRadioButton;
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
    procedure rdnaoClick(Sender: TObject);
    procedure rdsimClick(Sender: TObject);
    procedure rbResgateParceladoSimClick(Sender: TObject);
    procedure rbResgateParceladoNaoClick(Sender: TObject);
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
  if (Sistema.IdModulo = 456) or (Sistema.IdModulo = 454) then
    sUltDescricao:='Benefícios Concedidos em '+cboxMes.Text+' de '+seAno.Text
  else
    case RdgTpFolha.ItemIndex of
      1: sUltDescricao:='Preparo do Abono do ano '+copy(sMesReferencia,1,4);
      2: sUltDescricao:='Preparo da Antecipação de Abono no mês '+
           copy(sMesReferencia,6,2)+'/'+copy(sMesReferencia,1,4);
      3: sUltDescricao:='Reprocessamento do mês '+
           copy(sMesReferencia,6,2)+'/'+copy(sMesReferencia,1,4);
    else
      sUltDescricao:='Preparo de Manutenção do mês '+copy(sMesReferencia,6,2)+
        '/'+copy(sMesReferencia,1,4);
    end;
  edtDescrLote.text:=sUltDescricao;
  
  edtDataAbert.Text:=CriticaDataCobrancaSit(qryAux, IntToStr(iIdFundacao), '',
    'AS', 'P', IntCod(cboxMes.ItemIndex+1,2), seAno.Text);
end;

procedure TfrmAbertFechaLote.FormShow(Sender: TObject);
 var AYear, AMonth, ADay: Word;
begin
  inherited;

  rdnao.Checked           := True;
  rbProcessadoNao.Checked := True;
  
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12) then
  begin
    cboxMes.ItemIndex:=AMonth-1;
    cboxMes.Text:=cboxMes.Items[cboxMes.ItemIndex];
  end;
  seAno.Text:=IntToStr(AYear);

  
  edtDataAbert.Text:=CriticaDataCobrancaSit(qryAux, IntToStr(iIdFundacao), '',
    'AS', 'P', Copy(FormatDateTime('dd/mm/yyyy',Date) ,4,2), Copy(FormatDateTime('dd/mm/yyyy',date),7,4));
  
  if (Sistema.IdModulo = 456) or (Sistema.IdModulo = 454) then
  begin
    RdgTpFolha.visible:=false;
    rgpConcbenef.visible:=true;
    tbsFechaLote.TabVisible:=true;
    tbsReabreLote.TabVisible:=true;
    tbsEliminacao.Tabvisible:= false;
    caption:='Abertura e Fechamento de Lotes de Concessão';
    lbl_abrelote.Visible   := true;
    rdsim.Visible          := true;
    rdnao.Visible          := true;
  end
  else
  begin
    RdgTpFolha.visible:=true;
    rgpConcbenef.visible:=false;
    tbsFechaLote.TabVisible:=false;
    tbsReabreLote.TabVisible:=false;
    tbsEliminacao.Tabvisible:= true;
    caption:='Abertura de Lotes de Manutenção';
    lbl_abrelote.Visible   := false;
    rdsim.Visible          := false;
    rdnao.Visible          := false;
  end;

  pgctrlLote.ActivePage := tbsAbertLote;
  qryFechaLote.Close;
  qryFechaLote.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryFechaLote.Open;

  qryReabreLote.Close;
  qryReabreLote.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryReabreLote.Open;

  qryEliminaLote.Close;
  qryEliminaLote.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
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
 var sdatapreparo, sdatapagamento, sincluimes, smsg, ssql: String;
     iflgconcessao, iflgpreparado, iflgtipofolha,
     iflgresgate: integer; //SOL 135541 Kintana 807191
     iFlgLoteProcessado, // Renato Visoni SOL 137663  Kintana 833903
     iFlgResgateParcelado // SOL 63067 - KTN 524520
     : Integer;

begin
  inherited;
  // Critica Dados
  
  if (Sistema.IdModulo = 456) or (Sistema.IdModulo = 454) then
  begin
    if rgpConcbenef.itemindex = -1 then
    Begin
      MsgDlg('É necessário selecionar a informação '+#13+'''Pagamento do mês da Concessão''.','Erro', mtError, [mbOk, mbHelp], 0);
      rgpConcbenef.SetFocus;
      Exit;
    End;

    //BRUNO AZEVEDO SOL 153646 KINTANA 1161311
    if (IntCod(cboxMes.ItemIndex+1,2) <> FormatDateTime('mm',edtDataAbert.Date)) then begin
      MsgDlg('Mês de referência divergente com mês de pagamento.','Erro', mtError, [mbOk], 0);
      Exit;
    end;
    //BRUNO AZEVEDO SOL 153646 KINTANA 1161311
    
    sincluimes:=inttostr(rgpConcbenef.itemindex);
    iflgconcessao:=1;
    iflgpreparado:=1;
    iflgtipofolha:=0;
  end
  else
  begin
    sincluimes:='NULL';
    iflgconcessao:=0;
    iflgpreparado:=0;

    
    
    case RdgTpFolha.itemindex of
      0: begin
           iflgtipofolha:=0;
           smsg:='Já existe um lote de manutenção para o mês selecionado que não foi efetivado.';
         end;
      1: begin
           iflgtipofolha:=3;
           smsg:='Já existe um lote de abono anual para o mês selecionado que não foi efetivado.';
         end;
      2: begin
           iflgtipofolha:=4;
           smsg:='Já existe um lote de antecipação de abono anual para o mês selecionado que não foi efetivado.';
         end;
      3: begin
           iflgtipofolha:=6;
           smsg:='Já existe um lote de reprocessamento aberto para o mês selecionado.';
         end;
    end;

    ssql := 'SELECT IDLOTE FROM CTRLINTERFACE WHERE (MESREFERENCIA < '+
             QuotedStr(sMesReferencia)+') AND (TIPO = ''B'') '+
            
            
            'AND (FLGPREPARADO = 0 OR FLGPREPARADO IS NULL) '+
            'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL) '+
            'AND (FLGCONCESSAO = 0 OR FLGCONCESSAO IS NULL) '+
            'AND (IDREFERENCIA IS NULL) '+
            
            'AND (FLGTIPOFOLHA = '+inttostr(iflgtipofolha)+')';

    qryAux.close;
    qryAux.sql.clear;
    qryAux.sql.add(ssql);
    qryAux.Open;


    If not qryAux.isempty then
    begin
      if MsgDlg(smsg+#13+'Esta operação não pode ser efetuada', 'Informação',
           mtInformation, [mbOK], 0) = mrOK then
        exit;
    end;


    case RdgTpFolha.itemindex of
      0: begin
           iflgtipofolha:=0;
           smsg:='Já existe um lote de manutenção aberto para o mês selecionado.';
         end;
      1: begin
           iflgtipofolha:=3;
           smsg:='Já existe um lote de abono anual aberto para o mês selecionado.';
         end;
      2: begin
           iflgtipofolha:=4;
           smsg:='Já existe um lote de antecipação de abono anual aberto para o mês selecionado.';
         end;
      3: begin
           iflgtipofolha:=6;
           smsg:='Já existe um lote de reprocessamento aberto para o mês selecionado.';
         end;
    end;

    if FazQuery(qryAux,
                'SELECT IDLOTE FROM CTRLINTERFACE WHERE (MESREFERENCIA = '+
                QuotedStr(sMesReferencia)+') AND (TIPO = ''B'') '+
                'AND (FLGPREPARADO = 0 OR FLGPREPARADO IS NULL) '+
                'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL) '+
                'AND (FLGCONCESSAO = 0 OR FLGCONCESSAO IS NULL) '+
                'AND (IDREFERENCIA IS NULL) '+
                'AND (FLGTIPOFOLHA = '+inttostr(iflgtipofolha)+')') then
    begin
      if MsgDlg(smsg+#13+'Deseja criar outro lote ? (S/N)', 'Informação',
           mtInformation, [mbYes, mbNo, mbHelp], 0) = mrNo then
        exit;
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
  if Copy(edtDataAbert.Text,7,4)+'/'+Copy(edtDataAbert.Text,4,2) < sMesReferencia then
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

  
  ssql := ' SELECT IDLOTE FROM CTRLINTERFACE '+
          ' WHERE (MESREFERENCIA = '+QuotedStr(sMesReferencia)+') '+
          ' AND   (TIPO = ''B''                                 ) '+
          ' AND   (FLGTIPOFOLHA = '+inttostr(iflgtipofolha)+'   ) '+
          ' AND   (TO_CHAR(DATAPAGAMENTO,''DD/MM/YYYY'') = '''+edtDataAbert.Text+''') '+
          ' AND   (DESCRICAO = '''+edtDescrLote.text+''') ';

  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(ssql);
  qryAux.Open;
  if not qryAux.IsEmpty
  then begin
    MsgDlg('Já existe lote com mesmo mês de referência, data de pagamento e descrição. '+#13+
           '[Lote No. :'+qryAux.FieldbyName('IDLOTE').AsString+']'+#13+
           'Não é permitida a abertura de lotes idênticos. Verifique.','Erro', mtError, [mbOk, mbHelp], 0);
    edtDescrLote.SetFocus;
    Exit;
  end;


  If Not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;
  //inicio SOL 135541 Kintana 807191
  if rdsim.Checked  then
     iflgresgate   := 1
  else iflgresgate   := 0;
  //fim SOL 135541 Kintana 807191

  //Renato Visoni SOL 137663  Kintana 833903
  if rbProcessadoSim.Checked then begin
    iFlgLoteProcessado := 1;
  end else begin
    iFlgLoteProcessado := 0;
  end;
  //Renato Visoni SOL 137663  Kintana 833903    


  // SOL 63067 - KTN 524520
  if rbResgateParceladoSim.Checked then begin
    iFlgResgateParcelado := 1;
  end else begin
    iFlgResgateParcelado := 0;
  end;
  // SOL 63067 - KTN 524520

  sSQL:='INSERT INTO CTRLINTERFACE (IDLOTE, FLGIDATMP, IDPESSOA, '+
        'FLGVOLTATMP, FLGIDAINTERFACE, FLGVOLTAINTERFACE, FLGEMITIUCC, '+
        'DATAIDATMP, DATAVOLTATMP, DATAIDAINTERFACE, DATAVOLTAINTERFA, '+
        'DATAEMITIUCC, NUMREG, VLRTOTAL, MESREFERENCIA, TIPO, FLGPREPARADO, '+
        'DATAPREPARO, DATAPAGAMENTO, DESCRICAO, FLGATRASODEVOL, FLGCONCESSAO, '+
        'FLGINCLUIMESCONC, FLGTIPOFOLHA, FLGRESGATE, FLGLOTEPROCESSADO, '+   //SOL 135541 Kintana 807191
        'FLGRESGATEPARCELADO ) '+ // SOL 63067 - KTN 524520
        'VALUES ('+IntToStr(LeUltRegistro(Nil,'CTRLINTERFACE'))+','+'0,'+
        IntToStr(iIdFUNDACAO)+','+'0,'+'0,'+'0,'+'0,'+'NULL,'+'NULL,'+
        'NULL,'+'NULL,'+'NULL,'+'NULL,'+'NULL,'+QuotedStr(sMesReferencia)+','+
        QuotedStr('B')+','+inttostr(iflgpreparado)+','+sdatapreparo+','+
        sdatapagamento+','+QuotedStr(edtDescrLote.text)+','+QuotedStr('N')+','+
        inttostr(iflgconcessao)+','+sincluimes+','+inttostr(iflgtipofolha)+','+inttostr(iflgresgate)+//SOL 135541 Kintana 807191
        ','+ inttostr(iFlgLoteProcessado)+ //Renato Visoni SOL 137663  Kintana 833903
        ','+ inttostr(iFlgResgateParcelado)+ // SOL 63067 - KTN 524520
        ')';

  with qryAbreLote do
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
  end;
  // Desliga Animate
  lblAguarde.Visible  :=False;
  Animate1.Visible:=False;
  Animate1.Active :=False;
  // Mostra Tempo
  Application.ProcessMessages;

      
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

  MsgDlg('Lote Aberto com Sucesso','Informação',mtInformation,[mbOk],0);
end;

procedure TfrmAbertFechaLote.btnFechaLoteClick(Sender: TObject);
begin
  inherited;  // Critica Dados
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
  dtmBaseDados.dbBaseDados.Commit;
  qryEliminaLote.Close;
  qryEliminaLote.Open;
end;

procedure TfrmAbertFechaLote.rdnaoClick(Sender: TObject);
begin
  inherited;
  if rdsim.Checked  then
     rdsim.Checked := false;
end;

procedure TfrmAbertFechaLote.rdsimClick(Sender: TObject);
begin
  inherited;
  if rdnao.Checked  then
     rdnao.Checked := false;
end;

procedure TfrmAbertFechaLote.rbResgateParceladoSimClick(Sender: TObject);
begin
  inherited;
  if rbResgateParceladoSim.Checked  then
     rbResgateParceladoNao.Checked := false;

end;

procedure TfrmAbertFechaLote.rbResgateParceladoNaoClick(Sender: TObject);
begin
  inherited;
  if rbResgateParceladoNao.Checked  then
     rbResgateParceladoSim.Checked := false;
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
| DESENVOLVEDOR: GLEYBER                                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/08/2002 A 23/08/20023                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Permissão para selecionar o lote no fechamento   |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

