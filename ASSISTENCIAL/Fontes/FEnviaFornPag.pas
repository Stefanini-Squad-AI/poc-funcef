unit FEnviaFornPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  checklst, wwdblook, Spin, Db, DBTables, Wwquery, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmEnviaFornPag = class(TfrmSairAjuda)
    Panel2: TPanel;
    StaticText1: TStaticText;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox2: TGroupBox;
    dblkpcmbmotivo: TwwDBLookupCombo;
    bbtnEnviar: TBitBtn;
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
    qryAux: TwwQuery;
    qry: TwwQuery;
    qrymotivo: TwwQuery;
    qryforn: TwwQuery;
    qrydeletaassist: TwwQuery;
    qryinsereassist: TwwQuery;
    qrybuscaassist: TwwQuery;
    qrylote: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    function  InformacoesOk : boolean;
    procedure bbtnEnviarClick(Sender: TObject);
    Function  EnviaFornPag( idforn : integer ): boolean ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnviaFornPag: TfrmEnviaFornPag;
  sMesReferencia : string;
  liexercicio ,
  liperiodo ,
  liempresa : longint;
  Idlote : Integer;
  Codreferencia : String;
  rResult : Real;
  Codportforma : String;
  bAlguma : Boolean;

implementation

uses UAdmAss, FTelaAut, UDataBase, Message, UMensErro, UAutorizacao, ULancContab,
     USistema, DBaseDados;

{$R *.DFM}

procedure TfrmEnviaFornPag.FormActivate(Sender: TObject);
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

function TfrmEnviaFornPag.InformacoesOk : boolean;
begin
   Result:=True;
   if Trim(cmbMesRef.Text) = '' then
   begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesRef.SetFocus;
     Result:=False;
   end;

   if Trim(spedAnoRef.Text) = '' then
   begin
     MsgDlg('Ano de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoRef.SetFocus;
     Result:=False;
   end;
end;

procedure TfrmEnviaFornPag.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
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

procedure TfrmEnviaFornPag.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmEnviaFornPag.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.Visible := True;
end;

procedure TfrmEnviaFornPag.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmEnviaFornPag.bbtnEnviarClick(Sender: TObject);
var i,marcado : integer;
    bErro : boolean;
begin
    inherited;
    marcado:=0;
    bErro:=False;
    memResult.lines.Clear;

    sMesReferencia := FloatToStr(spedAnoRef.value)+'/'+RetornaMes(cmbMesRef.text);

    if not InformacoesOK then Exit;

   // Testar se a cobranca do mes de cobranca especificado já foi enviada
   {with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FLGIDATMP FROM CTRLINTERFACE '+
              ' WHERE  MESREFERENCIA = '''+sMesReferencia+ ''' AND '+
              '        TIPO = ''A'' ');
      Open;
      if (not IsEmpty) and (FieldByName('flgIdaTmp').AsInteger = 1)
      then begin
         MsgDlg('As contribuições do mês '+Trim(cmbMesCob.Text)+'/'+Trim(spedAnoCob.Text)+' já foram enviadas para a cobrança. Se necessário, utilize a função Desfazer Envio.','Informação',mtInformation,[mbOk,mbHelp],0);
         Exit;
      end;
   end;//with}

   memResult.Lines.Add('Envio de Pagamento do fornecedor - Mês de Referência : '+sMesReferencia+'');
   memResult.Lines.Add('-----------------   -----------------             --------------- ');

   if qryForn.isempty then
   begin
      MsgDlg('Não existem Pagamentos para o envio com as opções indicadas.  Operação não efetivada. ','Erro',mtError,[mbOk,mbHelp],0);
      qryForn.Close;
      exit;
   end;
   { Configurar pBar }
   pnlProgresso.Visible := true;
   pnlProgresso.Update;
   pBar.Step := 1;
   pBar.Max := qryForn.RecordCount;
   pBar.Position := 0;

   for i := 0 to chklstForn.Items.Count - 1 do
   begin
     if not chklstForn.checked[i] then
       continue
     else
       marcado := marcado + 1;
   end;

   if not  dtmBaseDados.dbBaseDados.Intransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

   for i := 0 to chklstForn.Items.Count - 1 do
   begin
      pBar.Position := pBar.Position + 1;
      if (not chklstForn.checked[i]) and ( marcado <> 0) then
        continue;
      if qryForn.Locate('Nome',chklstForn.items[i],[loPartialKey]) then
        if not EnviaFornPag(qryforn.fieldbyname('idpessoa').AsInteger) then
        begin
              memResult.Lines.Add('Fornecedor : '+qryforn.FieldbyName('Nome').AsString+'- erro no envio');
              memResult.Lines.Add('');
              bErro := True;
        end
        else
          bErro := False;
   end; //for

   pnlProgresso.Visible := False;

   if bAlguma = False then
   begin
      MsgDlg('Não há Pagamentos a serem enviadas nos parâmetros correntes.','Informação',mtInformation,[mbOk],0);
      bbtnVerResultado.visible := false;
      dtmBaseDados.dbBaseDados.Commit;
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT * FROM DUAL');
         Open;
         Close;
      end;
      pnlProgresso.Visible := False;
      exit;
   end;

   if bErro then
   begin
      if MsgDlg('Envio de Pagamentos efetuado com alguns problemas. Deseja desfazer as transações ?','Confirmação',mtConfirmation,[mbyes, mbno],0) = mryes then
        dtmBaseDados.dbBaseDados.Rollback
      else
        dtmBaseDados.dbBaseDados.Commit;
      if chkResult.Checked then
      begin
         pnlOpcoes.SendToBack;
         pnlResult.BringToFront;
      end;
   end
   else
   begin
      MsgDlg('Envio de Pagamentos efetuado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);
      dtmBaseDados.dbBaseDados.Commit;
      bbtnVerResultado.visible := false;
   end;
  // Adaptacao para tirar o icone de SQL
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT * FROM DUAL');
     Open;
     Close;
  end;
end;

function  TFrmEnviaFornPag.EnviaFornPag( idforn : integer ): boolean ;
var idmotivo , idplanass : string;
    ordem, contador : integer;
    valor : real;
    data : TDateTime ;
    sForn, CodTipoDocHistpag ,
    sMensErro, RecPagHistPag, CodTipRecHistpag : string;
begin
   result := True;
   sMensErro := '';

   IdLote := LeUltRegistro (qryLote,'CTRLINTERFACE');

   CodPortForma := '';

   memResult.Lines.Add('Fornecedor: '+sForn+'');
   memResult.Lines.Add('---------------------');

   qrybuscaassist.close;
   qrybuscaassist.sql.clear;
   qrybuscaassist.sql.add('SELECT *  FROM HISTPAG, PLANASS '+
                          ' WHERE (HISTPAG.MES = '''+sMesReferencia+''') '+
                          ' AND   (HISTPAG.IDFORNSERV = '+inttostr(idforn)+')'+
                          ' AND   (HISTPAG.IDPLANASS = PLANASS.IDPLANASS) '+
                          ' AND   (PLANASS.IDFORNSERV = HISTPAG.IDFORNSERV) ');
   qrybuscaassist.open;
   qrybuscaassist.first;

   if qrybuscaassist.isempty then
   begin
      //result := False;
      exit;
   end;

   bAlguma := true;
   ordem := 1;
   contador := 0;
   while not qrybuscaassist.eof do
   begin

      data := qryBuscaAssist.fieldbyname('data').AsDateTime;

      valor := qryBuscaAssist.fieldbyname('VALOR').AsFloat;
      idPlanAss := qryBuscaAssist.fieldbyname('IDPLANASS').AsString;
      idMotivo := qryBuscaAssist.fieldbyname('IDMOTIVO').AsString ;
      sForn := qryForn.fieldbyname('NOME').AsString;

      CodTipoDocHistpag := qryBuscaAssist.fieldbyname('CODTIPODOCHISTPAG').AsString;
      RecPagHistPag := qryBuscaAssist.fieldbyname('RECPAGHISTPAG').AsString;
      CodTipRecHistpag := qrybuscaassist.fieldbyname('CODTIPRECHISTPAG').AsString;


      if (qryBuscaAssist.fieldbyname('VALOR').AsString <> '')   then
      begin

         qryDeletaAssist.close;
         qryDeletaAssist.sql.clear;
         qryDeletaAssist.sql.add(' SELECT * FROM TMPDESC '+
                          ' WHERE  (MESREFERENCIA = '''+sMesReferencia+''') '+
                          ' AND    (IDPESSOA = '+inttostr(idForn)+')'+
                          ' AND    (IDMOTIVO = '+idmotivo+')'+
                          ' AND    (FLGFORNPAG = 1) '+
                          ' AND    (FLGTIPODESC = ''F'') ');
         try
            qryDeletaAssist.open;
         except
            result := false;
         end;

            if not  qrydeletaassist.isempty then
            begin
               qryDeletaAssist.close;
               qryDeletaAssist.sql.clear;
               qryDeletaAssist.sql.add(' DELETE  TMPDESC '+
                                 ' WHERE  (MESREFERENCIA = '''+sMesReferencia+''') '+
                                 ' AND    (IDPESSOA = '+inttostr(idForn)+')'+
                                 ' AND    (IDMOTIVO = '+idmotivo+')'+
                                 ' AND    (FLGFORNPAG = 1) '+
                                 ' AND    (FLGTIPODESC = ''F'') ');

               try
                  qryDeletaAssist.ExecSql;
               except
                  result := false;
               end;
            end;
          //insere em tmpdesc//
         qryInsereAssist.close;
         qryInsereAssist.sql.clear;
         qryInsereAssist.sql.add
           ('INSERT INTO TMPDESC(IDPESSOA,MESREFERENCIA, '+
            ' FLGTIPODESC,VALOR,IDPLANASS,IDMOTIVO,'+
            ' ORDEM,FLGFORNPAG,FLGDESCFOLHA,DATAREFERENCIA,CODTIPDOC,RECPAG,CODTIPRECDES,'+
            ' EXERCICIO,PERIODO,IDLOTE,DATACOBRANCA,SITENVIO,DESCRICAO) '+
            ' VALUES('+inttostr(idForn)+','+
            ' '''+sMesReferencia+''',''F'',:VALOR,'+
            ' '+idPlanAss+','+idMotivo+','+inttostr(ordem)+',1,''O'', :DATA,'+
            ' :CODTIPDOC, :RECPAG, :CODTIPRECDES,:EXERCICIO,:PERIODO,'+INTTOSTR(IDLOTE)+','+
            ' :DATACOBRANCA,''0'',''Pagamento para o Fornecedor'')');
         try
            qryInsereAssist.parambyname('EXERCICIO').AsInteger := liExercicio ;
            qryInsereAssist.parambyname('PERIODO').AsInteger := liPeriodo ;
            qryInsereAssist.parambyname('VALOR').AsFloat := valor;
            qryInsereAssist.parambyname('DATA').AsDateTime := data;
            qryInsereAssist.parambyname('DATACOBRANCA').AsDate := StrtoDate(qryBuscaAssist.fieldbyname('DATA').AsString) ;

            qryInsereAssist.parambyname('CODTIPDOC').AsString := codTipoDocHistPag;
            qryInsereAssist.parambyname('RECPAG').AsString := recPagHistPag;
            qryInsereAssist.parambyname('CODTIPRECDES').AsString := codTiPrecHistPag ;

            qryInsereAssist.ExecSql;

            CodReferencia := inttostr(idlote)+'-'+copy(datetostr(date),1,10);

            qryAux.close;
            qryAux.sql.clear;
            qryAux.SQL.add(' UPDATE HISTPAG SET CODREFERENCIA = '''+CodReferencia+'''  '+
                            ' WHERE (MES = '''+sMesReferencia+''') '+
                              ' AND (IDPLANASS = '+idplanass+') '+
                              ' AND (IDMOTIVO = '+idmotivo+') '+
                              ' AND (IDFORNSERV = '+inttostr(idforn)+') ');
            try
               qryAux.execsql;
            except
            end;

         except
            memResult.Lines.Add('Erro no envio para Interface');
            memResult.Lines.Add('');
            result := false;
         end;
      end
      else
      begin
      //
      end;
   pBar.Position := pBar.Position + 1;
   qryBuscaAssist.next;
   inc(ordem);
   inc(contador);
   rResult := rResult + Valor ;
   end;

  //insere um ctrlinterface//
  if contador <> 0 then
  begin
     qryinsereassist.close;
     qryinsereassist.sql.clear;
     qryinsereassist.sql.add(' INSERT INTO CTRLINTERFACE(MESREFERENCIA,'+
                             ' TIPO,FLGIDATMP,IDPESSOA,DATAIDATMP,IDLOTE,NUMREG,VLRTOTAL,CODPORTFORMA)'+
                             ' VALUES('''+sMesReferencia+''',''F'',1,'+inttostr(idforn)+',SYSDATE,'+inttostr(idlote)+','+
                             ' '+inttostr(contador)+', :valor, :codportform )');
     try
        qryinsereassist.parambyname('valor').AsFloat := rResult ;
        qryinsereassist.parambyname('codportform').AsString := codportforma;
        qryinsereassist.ExecSql;
     except
        memResult.Lines.Add(' Erro Específico na [GRAVAÇÃO DO CONTROLE DE INTERFACE]');
        memResult.Lines.Add('');
        result := false;
     end;
  end;
end;

end.
