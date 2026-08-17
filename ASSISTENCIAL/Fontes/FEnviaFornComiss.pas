unit FEnviaFornComiss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, ComCtrls,
  checklst, wwdblook, Spin, Db, DBTables, Wwquery, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmEnviaFornComiss = class(TfrmSairAjuda)
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
    qrybuscaassist: TwwQuery;
    qryinsereassist: TwwQuery;
    qrydeletaassist: TwwQuery;
    qrylote: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    function  InformacoesOk : boolean;
    Function  EnviaFornComiss( idforn : integer ): boolean ;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnviaFornComiss: TfrmEnviaFornComiss;
  sMesReferencia : string;
  liexercicio ,
  liperiodo ,
  liempresa : longint;
  IdLote : Integer;
  CodReferencia : String;
  rResult : Real;
  CodPortForma : String;
  bAlguma : Boolean;

implementation

uses UAdmAss, FTelaAut, UDataBase, Message, UMensErro, UAutorizacao, ULancContab,
     USistema, DBaseDados;

{$R *.DFM}

procedure TfrmEnviaFornComiss.FormActivate(Sender: TObject);
begin
  inherited;
  RetornaDataCorr(cmbMesRef,spedAnoRef );

  qryMotivo.Close;
  qryMotivo.Open;
  qryForn.Close;
  qryForn.Open;
  CriaLista(chklstForn, qryForn);

  chkResult.Checked := true;
  bbtnVerResultado.Visible := false;
  pnlProgresso.Visible := false;
end;

function TfrmEnviaFornComiss.InformacoesOk : boolean;
begin
   if Trim(cmbMesRef.Text) = '' then
   begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cmbMesRef.SetFocus;
     exit;
   end;

   if Trim(spedAnoRef.Text) = '' then
   begin
     MsgDlg('Ano de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     spedAnoRef.SetFocus;
     exit;
   end;
end;

procedure TfrmEnviaFornComiss.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
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
procedure TfrmEnviaFornComiss.bbtnEnviarClick(Sender: TObject);
var i, marcado : integer;
    bErro : boolean;
begin
   inherited;
   bErro:=False;
   marcado:=0;
   memResult.lines.Clear;

   sMesReferencia := FloatToStr(spedAnoRef.value)+'/'+RetornaMes(cmbMesRef.text);

   if not InformacoesOK then
     exit;

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

   memResult.Lines.Add('Envio de Comissão - Mês de Referência : '+sMesReferencia+'');
   memResult.Lines.Add('-----------------   -----------------             --------------- ');

   if qryforn.isempty then
   begin
      MsgDlg('Não existem Comissões para o envio com as opções indicadas.  Operação não efetivada. ','Erro',mtError,[mbOk,mbHelp],0);
      qryforn.Close;
      exit;
   end;
   { Configurar pBar }
   pnlProgresso.Visible := true;
   pnlProgresso.Update;
   pBar.Step := 1;
   pBar.Max := qryforn.RecordCount;
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
      if (not chklstForn.checked[i]) and (marcado <> 0) then
        continue;
      if qryForn.Locate('Nome',chklstForn.items[i],[loPartialKey]) then
        if not EnviaFornComiss(qryforn.fieldbyname('idpessoa').AsInteger) then
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
      MsgDlg('Não há Comissões a serem enviadas nos parâmetros correntes.','Informação',mtInformation,[mbOk],0);
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
      if MsgDlg('Envio de Comissões efetuado com alguns problemas. Deseja desfazer as transações ?','Confirmação',mtConfirmation,[mbyes, mbno],0) = mryes then
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
       MsgDlg('Envio de Comissões efetuado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);
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

procedure TfrmEnviaFornComiss.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TfrmEnviaFornComiss.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.Visible := true;
end;

procedure TfrmEnviaFornComiss.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end;

function  TFrmEnviaFornComiss.EnviaFornComiss( idforn : integer ): boolean ;
var idmotivo , idplanass : string;
    ordem, contador : integer;
    valor : real;
    data : TDateTime;
    sForn, CodTipoDocHistrec, sMensErro, RecPagHistrec, CodTipoRecHistrec : string;
begin
   sMensErro := '';
   result := true;

   IdLote := LeUltRegistro (qryLote,'CTRLINTERFACE');

   CodPortForma := '';

   memResult.Lines.Add('Fornecedor: '+sForn+'');
   memResult.Lines.Add('-------------------------');

   qrybuscaassist.close;
   qrybuscaassist.sql.clear;
   qrybuscaassist.sql.add('SELECT * FROM HISTREC, PLANASS'+
                          ' WHERE (MES = '''+sMesReferencia+''') '+
                          ' AND   (HISTREC.IDFORNSERV = '+inttostr(idforn)+')'+
                          ' AND   (PLANASS.IDPLANASS = HISTREC.IDPLANASS) '+
                          ' AND   (HISTREC.IDFORNSERV = PLANASS.IDFORNSERV) ');
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

      data := qrybuscaassist.fieldbyname('datarec').AsDateTime;

      valor := qryBuscaAssist.fieldbyname('VALREC').AsFloat;
      idPlanAss := qryBuscaAssist.fieldbyname('IDPLANASS').AsString;
      idMotivo := qryBuscaAssist.fieldbyname('IDMOTIVO').AsString ;
      sForn := qryForn.fieldbyname('NOME').AsString;

      CodTipoDocHistRec := qryBuscaAssist.fieldbyname('CODTIPODOCHISTREC').AsString;
      RecPagHistRec := qryBuscaAssist.fieldbyname('RECPAGHISTREC').AsString;
      CodTipoRecHistRec := qryBuscaAssist.fieldbyname('CODTIPORECHISTREC').AsString;

      if (qryBuscaAssist.fieldbyname('VALREC').AsString <> '')   then
      begin
         qryDeletaAssist.close;
         qryDeletaAssist.sql.clear;
         qryDeletaAssist.sql.add(' SELECT * FROM TMPDESC '+
                                  ' WHERE (MESREFERENCIA = '''+sMesReferencia+''') '+
                                    ' AND (IDPESSOA = '+inttostr(idForn)+')'+
                                    ' AND (IDMOTIVO = '+idMotivo+')'+
                                    ' AND (FLGFORNCOMISS = 1) '+
                                    ' AND (FLGTIPODESC = ''G'') ');
         try
            qryDeletaAssist.open;
         except
            result := false;
         end;

         if not  qryDeletaAssist.isempty then
         begin
            qryDeletaAssist.close;
            qryDeletaAssist.sql.clear;
            qryDeletaAssist.sql.add('DELETE  TMPDESC '+
                                    ' WHERE (MESREFERENCIA = '''+sMesReferencia+''') '+
                                      ' AND (IDPESSOA = '+inttostr(idForn)+')'+
                                      ' AND (IDMOTIVO = '+idmotivo+')'+
                                      ' AND (FLGFORNCOMISS = 1) '+
                                      ' AND (FLGTIPODESC = ''G'') ');
            try
               qryDeletAassist.ExecSql;
            except
               result := false;
            end;
         end;
         //insere em tmpdesc//
         qryInsereAssist.close;
         qryInsereAssist.sql.clear;
         qryInsereAssist.sql.add('INSERT INTO TMPDESC(IDPESSOA,MESREFERENCIA, '+
                                       ' FLGTIPODESC,VALOR,IDPLANASS,IDMOTIVO,'+
                                       ' ORDEM,FLGFORNCOMISS, FLGDESCFOLHA,DATAREFERENCIA,CODTIPDOC,RECPAG,CODTIPRECDES,EXERCICIO,PERIODO,'+
                                       ' IDLOTE,DATACOBRANCA,SITENVIO,DESCRICAO) '+
                                ' VALUES ('+inttostr(idforn)+','+
                                       ' '''+smesreferencia+''',''G'',:VALOR,'+
                                       ' '+idplanass+','+idmotivo+','+inttostr(ordem)+',1,''O'', :DATA,'+
                                       ' :CODTIPDOC, :RECPAG, :CODTIPRECDES, :EXERCICIO ,:PERIODO,'+
                                       ' '+inttostr(idlote)+', :DATACOBRANCA,''0'',''Comissão paga pelo Fornecedor'')');
         try
            qryInsereAssist.parambyname('valor').AsFloat := valor;
            qryInsereAssist.parambyname('EXERCICIO').AsInteger := liexercicio ;
            qryInsereAssist.parambyname('PERIODO').AsInteger := liperiodo ;
            qryInsereAssist.parambyname('data').AsDateTime := data;
            qryInsereAssist.parambyname('DATACOBRANCA').AsDate := StrtoDate(qrybuscaassist.fieldbyname('DATAREC').AsString) ;

            qryInsereAssist.parambyname('CODTIPDOC').AsString := codtipodochistrec;
            qryInsereAssist.parambyname('RECPAG').AsString := recpaghistrec;
            qryInsereAssist.parambyname('CODTIPRECDES').AsString := codtiporechistrec ;

            qryInsereAssist.ExecSql;


            CodReferencia := inttostr(idlote)+'-'+copy(datetostr(date),1,10);

            qryaux.close;
            qryaux.sql.clear;
            qryaux.SQL.add(' UPDATE HISTREC SET CODREFERENCIA = '''+CodReferencia+'''  '+
                           ' WHERE (MES = '''+sMesReferencia+''') '+
                           ' AND   (IDPLANASS = '+idplanass+') '+
                           ' AND   (IDMOTIVO = '+idmotivo+') '+
                           ' AND   (IDFORNSERV = '+inttostr(idforn)+') ');
            try
               qryaux.execsql;
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
      qryInsereAssist.close;
      qryInsereAssist.sql.clear;
      qryInsereAssist.sql.add('INSERT INTO CTRLINTERFACE(MESREFERENCIA,'+
                                    ' TIPO,FLGIDATMP,IDPESSOA,DATAIDATMP,IDLOTE,NUMREG,VLRTOTAL,CODPORTFORMA)'+
                             ' VALUES ('''+sMesReferencia+''',''G'',1,'+inttostr(idforn)+',SYSDATE,'+
                                    ' '+inttostr(idlote)+','+inttostr(contador)+', :valor, :codportform )');
      try
         qryInsereAssist.parambyname('valor').AsFloat := rResult ;
         qryInsereAssist.parambyname('codportform').AsString := codPortForma;
         qryInsereAssist.ExecSql;
      except
         memResult.Lines.Add(' Erro Específico na [GRAVAÇÃO DO CONTROLE DE INTERFACE]');
         memResult.Lines.Add('');
         result := false;
      end;
   end;
end;

end.
