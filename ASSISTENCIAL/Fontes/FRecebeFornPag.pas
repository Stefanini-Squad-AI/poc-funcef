unit FRecebeFornPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ComCtrls, checklst, wwdblook, Spin,
  MAHlpBtn, Buttons, TB97, ExtCtrls, Db, DBTables, Wwquery, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRecebFornPag = class(TfrmSairAjuda)
    Panel2: TPanel;
    StaticText1: TStaticText;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox2: TGroupBox;
    dblkpcmbmotivo: TwwDBLookupCombo;
    bbtnReceber: TBitBtn;
    GroupBox3: TGroupBox;
    dtRecebimento: TCMDateTimePicker;
    pnlOpcoes: TPanel;
    Label1: TLabel;
    chklstForn: TCheckListBox;
    StaticText2: TStaticText;
    chkResult: TCheckBox;
    pnlProgresso: TPanel;
    Label4: TLabel;
    pBar: TProgressBar;
    bbtnVerResultado: TBitBtn;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    qryRecebimento: TwwQuery;
    qryAux: TwwQuery;
    qrymotivo: TwwQuery;
    qryforn: TwwQuery;
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnReceberClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    function  InformacoesOk : boolean;
    function  RecebeFornPag(IdForn : integer; sForn : string) : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecebFornPag: TfrmRecebFornPag;
  sMesReferencia : string;
  brecebida,balguma,berro : boolean;
implementation

uses UMensErro, UAdmAss, DBaseDados;

{$R *.DFM}

procedure TfrmRecebFornPag.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.Visible := True;
end;

procedure TfrmRecebFornPag.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);

end;

procedure TfrmRecebFornPag.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmRecebFornPag.bbtnReceberClick(Sender: TObject);
var i, marcado : integer;
begin

  inherited;

  balguma := false;
  berro := false;
  marcado:=0;
  memResult.lines.Clear;

  if not InformacoesOK then Exit;

  sMesReferencia := FloatToStr(spedAnoRef.value)+'/'+RetornaMes(cmbMesRef.text);

  if IdMotivoPag <= 0
  then begin
     MsgDlg('O Motivo[default] para o Recebimento de Pagamentos feitos aos fornecedores Assistenciais deverá ser preenchido. Utilize a tela de Parâmetros do Sistema.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;


   { Configurar pBar }
   pnlProgresso.Visible := True;
   pnlProgresso.BringToFront;
   pnlProgresso.Update;
   pBar.Step := 1;
   pBar.Max := chklstForn.Items.Count;
   pBar.Position := 0;


   memResult.Lines.Add('Recebimento de Pagamentos - Data : '+DateToStr(date)+'    LISTA DE EXCEÇÕES ');
   memResult.Lines.Add('---------------------------- ');

   for i := 0 to chklstForn.Items.Count - 1 do
   begin
         if not chklstForn.checked[i] then
         continue
         else marcado := marcado + 1;
   end;

   if not  dtmBaseDados.dbBaseDados.Intransaction then
   dtmBaseDados.dbBaseDados.StartTransaction;

   for i := 0 to chklstForn.Items.Count - 1 do
   begin
      pBar.Position := pBar.Position + 1;
      if (not chklstForn.checked[i]) and ( marcado <> 0) then continue;

      if qryforn.Locate('Nome',chklstForn.items[i],[loPartialKey])
      then
      begin
         if not RecebeFornPag(qryforn.FieldByName('IdPessoa').AsInteger,
                              qryforn.FieldByName('Nome').AsString)
         then
         begin
            memResult.Lines.Add('Fornecedor : '+qryforn.FieldbyName('Nome').AsString+'- erro no recebimento');
            memResult.Lines.Add('');
            bErro := true;
      end;
  end; //for i := 0 to chklstForn;


  pnlProgresso.Visible := False;


  if bAlguma = False then
  begin
     MsgDlg('Não há Recebimentos a serem efetivados nos parâmetros correntes.','Informação',mtInformation,[mbOk],0);
     bbtnVerResultado.visible := false;
     dtmBaseDados.dbBaseDados.Commit;
    with qryAux do begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT * FROM DUAL');
       Open;
        Close;
    end;
     Exit;
  end;


  if berro then
  begin
     if MsgDlg('Recebimento de Pagamentos efetuado com alguns problemas. Deseja desfazer as transações ?','Confirmação',mtConfirmation,[mbyes, mbno],0) = mryes then
     dtmBaseDados.dbBaseDados.Rollback
     else dtmBaseDados.dbBaseDados.Commit;

     if chkResult.Checked
     then begin
        pnlOpcoes.SendToBack;
        pnlResult.BringToFront;
     end;
     end
     else
     begin
        MsgDlg('Recebimento de Pagamentos efetuado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.Commit;
        bbtnVerResultado.visible := false;
     end;
  end;



  // Adaptacao para tirar o icone de SQL
  with qryAux do begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT * FROM DUAL');
     Open;
     Close;
  end;

end;

procedure TfrmRecebFornPag.FormActivate(Sender: TObject);
begin
  inherited;
  RetornaDataCorr(cmbMesRef,spedAnoRef );
  dblkpcmbMotivo.Text := '';

  qryMotivo.Close;  qryMotivo.Open;
  qryForn.Close;   qryForn.Open;
  CriaLista(chklstForn,qryForn);

  chkResult.Checked := True;
  bbtnVerResultado.Visible := False;
  pnlProgresso.Visible := False;
end;

procedure TfrmRecebFornPag.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

function TfrmRecebFornPag.InformacoesOk : boolean;
begin
   if Trim(cmbMesRef.Text) = ''
   then begin
     MsgDlg('Mês de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesRef.SetFocus;
     Exit;
   end;

   if Trim(spedAnoRef.Text) = ''
   then begin
     MsgDlg('Ano de Referência do Recebimento não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoRef.SetFocus;
     Exit;
   end;

end;

function  TfrmRecebFornPag.RecebeFornPag(IdForn : integer; sForn : string) : boolean;
var sSQL : string;
    cAuxSeparador : char;
    rValorEsperado,
    rValorRecebido : real;
    sValorRecebido,
    sValorEsperado : string;
    bErro : Boolean;
begin
   Result := False;
   bErro  := False;

   memResult.Lines.Add('Fornecedor: '+sForn);
   memResult.Lines.Add('------------------');

   // Verificar se o interface já voltou da patrocinadora
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FLGVOLTATMP,FLGVOLTAINTERFACE FROM CTRLINTERFACE '+
              ' WHERE MESREFERENCIA = '''+sMesReferencia+''' AND '+
              '       TIPO = ''F'' AND '+
              '       IDPESSOA = '+IntToStr(Idforn)+'');
      Open;
      if isempty
      then begin // O interface desta patrocinadora não foi enviado
         Close;
         memResult.Lines.Add('A previsão de pagamentos do fornecedor não foram enviadas até o momento. Verifique o Controle de Pagamentos.');
         Exit;
      end //then - if isempty
      else begin
         // Testar se a cobrança já voltou da patrocinadora
         if FieldByName('FLGVOLTAINTERFACE').AsInteger = 0
         then begin
            Close;
            memResult.Lines.Add('O interface de volta do fornecedor não foi recebido até o momento. Verifique o Controle de Pagamentos.');
            Exit;
         end;
         // Testar se a cobrança já foi recebida
         bRecebida := False;
         if FieldByName('FLGVOLTATMP').AsInteger = 1
         then begin
            Close;
            if MsgDlg('A confirmação dos pagamentos feitos ao fornecedor '+sForn+' já foi feita. Deseja refazer o recebimento ?','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
            then bRecebida := True
            else Exit;
         end;
      end; //else - if isempty
   end;


   // Selecionar registros da TMPDESC das contribuicoes da patrocinadora em questão
   qryRecebimento.Close;
   qryRecebimento.SQL.Clear;
   qryRecebimento.SQL.Add(' SELECT MESCOBRANCA,MESREFERENCIA,VALOR,VALORRECEBIDO,IDPLANASS, '+
                  '         IDPESSJUR,IDPLANOPREV,IDPESSOA,IDDESCONTO,IDMOTIVO,DATARECEBIMENTO, '+
                  '         IDPROVENTO,NUMPRIORIDADE,ORDEM,CODPROVDESC,MATRICULA,INSCRICAONUMERO,VALORBASE1, '+
                  '         VALORBASE2,VALORBASE3,CODRETORNO,FLGDESCONTO '+
                  '         CODDOCUMENTOPREV, PLNCODIGOPREV, CODDOCUMENTOEFET,PLNCODIGOEFET, '+
                  '         IDLOTE, ORDEM , IDPESSOA , IDPESSJUR '+
                  ' FROM    TMPDESC '+
                  ' WHERE   MESREFERENCIA <= '''+sMesReferencia+''' AND '+
                  '         FLGTIPODESC = ''F'' AND FLGFORNPAG = 1 '+
                  '         AND (SITENVIO = ''2'' OR (SITENVIO = ''1'' AND VALOR IS NOT NULL)) ');

   qryRecebimento.Open;
   qryRecebimento.First;

   if qryrecebimento.isempty then
   begin
      memResult.Lines.Add('  Não há recebimentos a serem efetivados');
      memResult.Lines.Add('');
      Exit;
   end;

   balguma := true;

   while not qryRecebimento.Eof do
   begin
      // Gravar recebimento na tabela HSTCONTRIBPREV
      rValorRecebido := qryRecebimento.FieldByName('VALORRECEBIDO').AsFloat;
      rValorEsperado := qryRecebimento.FieldByName('VALOR').AsFloat;
   {.}cAuxSeparador := DecimalSeparator;
      DecimalSeparator := '.';
      sValorRecebido := FormatFloat('#0.00',rValorRecebido);
      sValorEsperado := FormatFloat('#0.00',rValorEsperado);
   {.}DecimalSeparator := cAuxSeparador;

      sSQL := ' VALORPAGO = '+sValorRecebido;
      sSQL := sSQL +', DATAEFET = TO_DATE('''+qryRecebimento.FieldByName('DataRecebimento').AsString+''', ''dd/mm/yyyy'') ';

      if qryrecebimento.fieldbyname('CODDOCUMENTOEFET').AsString <> '' then
         sSQL := sSQL +', CODDOCUMENTO ='+qryRecebimento.FieldByName('CODDOCUMENTOEFET').AsString+'';

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE HISTPAG SET '+sSQL+
                     ' WHERE  IDFORNSERV = '+inttostr(IdForn)+''+
                     ' AND IDPLANASS = '+qryRecebimento.FieldByName('IDPLANASS').AsString+''+
                     ' AND IDMOTIVO = '+qryRecebimento.FieldByName('IDMOTIVO').AsString+''+
                     ' AND MES = '''+qryRecebimento.FieldByName('MESREFERENCIA').AsString+''' ');
      try
         qryAux.ExecSQL;
      except
         memResult.Lines.Add('Erro[Gravação] do Pagamento ');
         memResult.Lines.Add('');
         bErro := true;
      end;//try

        //ATUALIZA TMPDESC SITENVIO = 9
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE TMPDESC SET SITENVIO = ''9'' '+
                     ' WHERE  IDLOTE = '+qryRecebimento.FieldByName('IDLOTE').AsString+''+
                     ' AND ORDEM = '+qryRecebimento.FieldByName('ORDEM').AsString+''+
                     ' AND IDPLANOPREV = '+qryRecebimento.FieldByName('IDPLANOPREV').AsString+''+
                     ' AND IDDESCONTO = '+qryRecebimento.FieldByName('IDDESCONTO').AsString+''+
                     ' AND MESREFERENCIA = '''+qryRecebimento.FieldByName('MESREFERENCIA').AsString+''' '+
                     ' AND IDPESSOA = '+qryRecebimento.FieldByName('IDPESSOA').AsString+' ');
      try
         qryAux.ExecSQL;
      except
         memResult.Lines.Add('Erro na atualização da situação no Interface.');
         memResult.Lines.Add('');
         bErro := true;
      end;

      qryrecebimento.next;
   end;//while


   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE CTRLINTERFACE SET FLGVOLTATMP = 1 ,DATAVOLTATMP = SYSDATE '+
              ' WHERE MESREFERENCIA = '''+sMesReferencia+''' AND '+
              '       IDPESSOA = '+inttostr(IdForn)+'');
      try
        ExecSQL;
      except
        memResult.Lines.Add(' Erro Específico da Patrocinadora[GRAVAÇÃO DO CONTROLE DE INTERFACE]');
        memResult.Lines.Add('');
        bErro := true;
      end;
   end;

   if not berro then
   Result := True;
end;


end.
