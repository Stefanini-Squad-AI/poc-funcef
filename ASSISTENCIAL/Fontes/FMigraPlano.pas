unit FMigraPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, StdCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker;

type
  TFrmMigraPlano = class(TfrmOkCancelar)
    dsPlanos: TwwDataSource;
    qryPlanos: TwwQuery;
    GroupBox1: TGroupBox;
    dblkPlanosOrigem: TDBLookupComboBox;
    Label1: TLabel;
    dblkPlanosDestino: TDBLookupComboBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    dblkFiltroPatro: TDBLookupComboBox;
    Label3: TLabel;
    dsPatro: TwwDataSource;
    qryPatro: TwwQuery;
    Label4: TLabel;
    dblkFiltroPlanPrev: TDBLookupComboBox;
    dsPlanPrev: TwwDataSource;
    qryPlanPrev: TwwQuery;
    dblkFiltroSitPart: TDBLookupComboBox;
    Label5: TLabel;
    dblkFiltroSitFunc: TDBLookupComboBox;
    Label6: TLabel;
    dsSitPart: TwwDataSource;
    qrySitPart: TwwQuery;
    dsSitFunc: TwwDataSource;
    qrySitFunc: TwwQuery;
    Label7: TLabel;
    dtpDataDesligamento: TwwDBDateTimePicker;
    dtpDataInscricao: TwwDBDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    edtMotivoPadrao: TEdit;
    btnMigra: TBitBtn;
    qryPartass: TwwQuery;
    qryInsContribPlanPrevA: TwwQuery;
    qryInsBenefass: TwwQuery;
    memResult: TMemo;
    qryExec: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure dblkPlanosDestinoExit(Sender: TObject);
    procedure btnMigraClick(Sender: TObject);
  private
    { Private declarations }
    function InsereNovoPlano : Boolean;
    function InsereNovasContribuicoes : Boolean;
    function InsereBeneficiarioNovoPlano : Boolean;
  public
    { Public declarations }
  end;

var
  FrmMigraPlano: TFrmMigraPlano;

implementation

uses UMensErro, UAdmAss, DBaseDados, UDataBase, uFuncoesUteis, fAguarde;

{$R *.DFM}

procedure TFrmMigraPlano.FormShow(Sender: TObject);
begin
  inherited;
  // Abrir queries
  qryPlanos.Open;
  qryPatro.Open;
  qryPlanPrev.Open;
  qrySitPart.Open;
  qrySitFunc.Open;
end;

procedure TFrmMigraPlano.dblkPlanosDestinoExit(Sender: TObject);
begin
  inherited;
  If Trim(dblkPlanosDestino.Text) <> ''
   Then If MsgDlg('Deseja incluir no motivo padrão o nome do novo plano?', 'Atenção',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes
         Then edtMotivoPadrao.Text := 'MIGRAÇÃO PARA O PLANO '+QuotedStr(dblkPlanosDestino.Text);
end;

procedure TFrmMigraPlano.btnMigraClick(Sender: TObject);
Var
  sSql : String;
begin
  inherited;
  //inherited;
  // Critica preenchimento de campos obrigatórios.
  If Trim(dblkPlanosOrigem.Text) = ''
   Then Begin
     MsgDlg('É necessário o preenchimento do Plano Assistencial de Origem.',
            'Erro',mtInformation,[mbOk],0);
     dblkPlanosOrigem.SetFocus;
     Exit;
   End;

  If Trim(dblkPlanosDestino.Text) = ''
   Then Begin
     MsgDlg('É necessário o preenchimento do Plano Assistencial de Destino.',
            'Erro',mtInformation,[mbOk],0);
     dblkPlanosDestino.SetFocus;
     Exit;
   End;

  If Trim(dtpDataDesligamento.Text) = ''
   Then Begin
     MsgDlg('É necessário o preenchimento da data de desligamento do plano de origem.',
            'Erro',mtInformation,[mbOk],0);
     dtpDataDesligamento.SetFocus;
     Exit;
   End;

  If Trim(dtpDataInscricao.Text) = ''
   Then Begin
     MsgDlg('É necessário o preenchimento da data de inscrição do plano de origem.',
            'Erro',mtInformation,[mbOk],0);
     dtpDataInscricao.SetFocus;
     Exit;
   End;
  // Rotina de migração

  // Montando a query de seleção dos participantes
  sSQL := 'SELECT PA.COMISSFORN, PA.COMISSFUND, PA.DATACANCELAMENTO, PA.DATAENTRADA, PA.FLGINSCRICAOCANC, '+#13+#10+
          '       PA.FLGOPCAOA,  PA.FLGOPCAOB, PA.FLGPARTBENEF, PA.IDFORNSERV2, PA.IDNUCLEO, PA.IDPESSJUR, '+#13+#10+
          '       PA.IDPESSOA, PA.IDPLANASS, PA.IDPLANOPREV, PA.IDSITPART, PA.INSCRICAONUMERO, '+#13+#10+
          '       PA.INSCRICAOTIPO, PA.OBSCANCEL, PA.OPCAOA, PA.OPCAOB, PA.SEQPROPOSTA, PA.TIPOFORNSERV2, '+#13+#10+
          '       PA.VALORBASE1, PA.VALORBASE2, PA.VALORBASE3, PA.VALORBASE4,'+#13+#10+
          '       PA.VALORBASE5, PA.VALORBASE6, PA.VALORBASE7, PA.VALORBASE8'+#13+#10+
          'FROM PARTASS PA, PARTPREVPLAN PP, ELEGPATRO EL'+#13+#10+
          'WHERE NVL(PA.FLGINSCRICAOCANC,0) = 0'+#13+#10+
          '  AND PP.IDPESSJUR        = PA.IDPESSJUR '+#13+#10+
          '  AND PP.IDPLANOPREV      = PA.IDPLANOPREV '+#13+#10+
          '  AND PP.IDPESSOA         = PA.IDPESSOA '+#13+#10+
          '  AND PP.SEQPROPOSTA      = PA.SEQPROPOSTA '+#13+#10+
          '  AND EL.IDPESSJUR        = PP.IDPESSJUR '+#13+#10+
          '  AND EL.IDPESSOA         = PP.IDPESSOA '+#13+#10+
          '  AND PA.FLGINSCRICAOCANC = 0'+#13+#10+
          '  AND PA.IDPLANASS        = '+IntToStr(dblkPlanosOrigem.KeyValue)+#13+#10;

  If Trim(dblkFiltroPatro.Text) <> ''
   Then sSql := sSql + '  AND PA.IDPESSJUR   = '+IntToStr(dblkFiltroPatro.KeyValue)+#13+#10;

  If Trim(dblkFiltroPlanPrev.Text) <> ''
   Then sSql := sSql + '  AND PP.IDPLANOPREV = '+IntToStr(dblkFiltroPlanPrev.KeyValue)+#13+#10;

  If Trim(dblkFiltroSitPart.Text) <> ''
   Then sSql := sSql + '  AND PP.IDSITPART   = '+IntToStr(dblkFiltroSitPart.KeyValue)+#13+#10;

  If Trim(dblkFiltroSitFunc.Text) <> ''
   Then sSql := sSql + '  AND EL.IDSITFUNC   = '+IntToStr(dblkFiltroSitFunc.KeyValue)+#13+#10;

  qryPartass.Close;
  qryPartass.SQL.Clear;
  qryPartass.SQL.Add(sSql);
  qryPartass.Open;

  frmAguarde.Mostra('Migrando para o novo plano...');
  frmAguarde.pbAguarde.Visible := True;
  frmAguarde.pbAguarde.Max     := qryPartass.RecordCount;

  memResult.Lines.Clear;

  While Not qryPartass.Eof do
   Begin
     If Not dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.StartTransaction;

     frmAguarde.pbAguarde.Position := qryPartass.RecNo;

     If Not InsereNovoPlano
      Then Begin
         dtmBaseDados.dbBaseDados.Rollback;
         memResult.Lines.Add('- Não foi possível inserir o participante de inscrição '+
                             qryPartass.FieldByName('INSCRICAONUMERO').AsString+
                             ' no novo plano. Erro na PARTASS.');
         qryPartass.Next;
         Continue;
      End;

     If Not InsereNovasContribuicoes
      Then Begin
         dtmBaseDados.dbBaseDados.Rollback;
         memResult.Lines.Add('- Não foi possível inserir as novas contribuições do participante de inscrição '+
                             qryPartass.FieldByName('INSCRICAONUMERO').AsString+
                             ' no novo plano. Erro na CONTASS.');
         qryPartass.Next;
         Continue;
      End;

     If Not InsereBeneficiarioNovoPlano
      Then Begin
         dtmBaseDados.dbBaseDados.Rollback;
         memResult.Lines.Add('- Não foi possível inserir os beneficiários do participante de inscrição '+
                             qryPartass.FieldByName('INSCRICAONUMERO').AsString+
                             ' no novo plano. Erro na BENEFASS/BFCIARIOTITASS.');
         qryPartass.Next;
         Continue;
      End;

     qryPartass.Next;
     dtmBaseDados.dbBaseDados.Commit;
   End;

   frmAguarde.Apaga;

   If memResult.Lines.Count > 1
    Then Begin
      memResult.Lines.SaveToFile('C:\LogMigraAssistencial.txt');
      MsgDlg('Log da migração salvo em C:\ com o nome de LOGMIGRAASSISTENCIAL.TXT.','Aviso',mtInformation,[mbOk], 0);
    End;
end;

function TFrmMigraPlano.InsereNovoPlano: Boolean;
begin
 // Insere no plano novo
 qryExec.Close;
 qryExec.SQL.Clear;
 qryExec.SQL.Add('INSERT INTO PARTASS (IDPESSJUR, SEQPROPOSTA, IDPLANOPREV, IDPESSOA, IDPLANASS, IDSITPART, DATAENTRADA,');
 qryExec.SQL.Add('                     INSCRICAONUMERO, FLGPARTBENEF, OPCAOA, OPCAOB, FLGOPCAOA, FLGOPCAOB,');
 qryExec.SQL.Add('                     VALORBASE1, VALORBASE2, VALORBASE3, VALORBASE4,');
 qryExec.SQL.Add('                     VALORBASE5, VALORBASE6, VALORBASE7, VALORBASE8)');
 qryExec.SQL.Add('VALUES(');
 qryExec.SQL.Add(qryPartass.FieldByName('IDPESSJUR').Asstring+',');
 qryExec.SQL.Add(qryPartass.FieldByName('SEQPROPOSTA').Asstring+',');
 qryExec.SQL.Add(qryPartass.FieldByName('IDPLANOPREV').Asstring+',');
 qryExec.SQL.Add(qryPartass.FieldByName('IDPESSOA').Asstring+',');
 qryExec.SQL.Add(IntToStr(dblkPlanosDestino.KeyValue)+',');
 qryExec.SQL.Add(qryPartass.FieldByName('IDSITPART').Asstring+',');
 qryExec.SQL.Add('TO_DATE('+QuotedStr(DateToStr(dtpDataInscricao.Date))+',''DD/MM/YYYY''),');
 qryExec.SQL.Add(qryPartass.FieldByName('INSCRICAONUMERO').Asstring+',');
 qryExec.SQL.Add(qryPartass.FieldByName('FLGPARTBENEF').Asstring+',');
 qryExec.SQL.Add(QuotedStr(qryPartass.FieldByName('OPCAOA').Asstring)+',');
 qryExec.SQL.Add(QuotedStr(qryPartass.FieldByName('OPCAOB').Asstring)+',');
 qryExec.SQL.Add(QuotedStr(qryPartass.FieldByName('FLGOPCAOA').Asstring)+',');
 qryExec.SQL.Add(QuotedStr(qryPartass.FieldByName('FLGOPCAOB').Asstring)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE1').AsInteger)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE2').AsInteger)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE3').AsInteger)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE4').AsInteger)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE5').AsInteger)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE6').AsInteger)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE7').AsInteger)+',');
 qryExec.SQL.Add(IntToStr(qryPartass.FieldByName('VALORBASE8').AsInteger)+')');

 Try
  qryExec.ExecSQL
 Except
  Result := False;
  Exit;
 End;

 // Cancela o plano antigo.
 qryExec.Close;
 qryExec.SQL.Clear;
 qryExec.SQL.Add('UPDATE PARTASS');
 qryExec.SQL.Add('   SET FLGINSCRICAOCANC = 1,');
 qryExec.SQL.Add('       DATACANCELAMENTO = TO_DATE('+QuotedStr(DateToStr(dtpDataDesligamento.Date))+',''DD/MM/YYYY''),');
 qryExec.SQL.Add('       OBSCANCEL        ='+QuotedStr(edtMotivoPadrao.Text));
 qryExec.SQL.Add('WHERE IDPLANASS = '+IntToStr(dblkPlanosOrigem.KeyValue));
 qryExec.SQL.Add('  AND IDPESSOA  = '+qryPartass.FieldByName('IDPESSOA').Asstring);

 Try
  qryExec.ExecSQL
 Except
  Result := False;
  Exit;
 End;

end;

function TFrmMigraPlano.InsereNovasContribuicoes: Boolean;
begin
 // Insere as contribuições do participante no novo plano.
 qryExec.Close;
 qryExec.SQL.Clear;
 qryExec.SQL.Add('INSERT INTO CONTASS (IDPLANASS, IDPLANOPREV, IDPESSJUR, IDTITULAR, IDCONTASS, IDDEPENDENTE,');
 qryExec.SQL.Add('                     SEQPROPOSTA, RECPAG, FLGATIVO, FLGFOLHA, FLGCOBCARNE, IDPAGADOR)');
 qryExec.SQL.Add('SELECT '+IntToStr(dblkPlanosDestino.KeyValue)+' AS IDPLANASS, CT.IDPLANOPREV, CT.IDPESSJUR, CT.IDTITULAR, CB_NEW.IDCONTASS, CT.IDDEPENDENTE,');
 qryExec.SQL.Add('       CT.SEQPROPOSTA, CT.RECPAG, CT.FLGATIVO, CT.FLGFOLHA, CT.FLGCOBCARNE, CT.IDPAGADOR');
 qryExec.SQL.Add('FROM CONTASS CT, CONTRIBASS CB, CONTRIBASS CB_NEW');
 qryExec.SQL.Add('WHERE CT.IDTITULAR       = '+qryPartAss.FieldByName('IDPESSOA').AsString);
 qryExec.SQL.Add('  AND CT.FLGATIVO        = 1');
 qryExec.SQL.Add('  AND CB.IDPLANASS       = CT.IDPLANASS');
 qryExec.SQL.Add('  AND CB.IDCONTASS       = CT.IDCONTASS');
 qryExec.SQL.Add('  AND CB_NEW.IDPLANASS   = '+IntToStr(dblkPlanosDestino.KeyValue));
 qryExec.SQL.Add('  AND CB_NEW.FLGCOBCARNE = CB.FLGCOBCARNE');

 Try
  qryExec.ExecSQL
 Except
  Result := False;
  Exit;
 End;

 // Cancela as contribuições no plano antigo.
 qryExec.Close;
 qryExec.SQL.Clear;
 qryExec.SQL.Add('UPDATE CONTASS');
 qryExec.SQL.Add('   SET FLGATIVO = 0');
 qryExec.SQL.Add('WHERE IDPLANASS = '+IntToStr(dblkPlanosOrigem.KeyValue));
 qryExec.SQL.Add('  AND IDTITULAR = '+qryPartass.FieldByName('IDPESSOA').Asstring);
 qryExec.SQL.Add('  AND FLGATIVO  = 1');

 Try
  qryExec.ExecSQL
 Except
  Result := False;
  Exit;
 End;

end;

function TFrmMigraPlano.InsereBeneficiarioNovoPlano: Boolean;
begin
 // Inscreve o beneficiário no novo plano
 qryExec.Close;
 qryExec.SQL.Clear;
 qryExec.SQL.Add('INSERT INTO BENEFASS (IDTITULAR, IDPESSJUR, IDPLANOPREV, IDPLANASS, IDDEPENDENTE, TIPO, SEQPROPOSTA,');
 qryExec.SQL.Add('                      RESPONSAVELPAG, PERCPAGMTO, FLGATIVO, DATAENTRADA)');
 qryExec.SQL.Add('SELECT IDTITULAR, IDPESSJUR, IDPLANOPREV, '+IntToStr(dblkPlanosDestino.KeyValue)+' AS IDPLANASS, IDDEPENDENTE, TIPO, SEQPROPOSTA,');
 qryExec.SQL.Add('       RESPONSAVELPAG, PERCPAGMTO, FLGATIVO, TO_DATE('+QuotedStr(DateToStr(dtpDataInscricao.Date))+',''DD/MM/YYYY'') AS DATAENTRADA');
 qryExec.SQL.Add('FROM BENEFASS');
 qryExec.SQL.Add('WHERE IDTITULAR = '+qryPartass.FieldByName('IDPESSOA').Asstring);
 qryExec.SQL.Add('  AND IDPLANASS = '+IntToStr(dblkPlanosOrigem.KeyValue));
 qryExec.SQL.Add('  AND FLGATIVO  = 1');

 Try
  qryExec.ExecSQL
 Except
  Result := False;
  Exit;
 End;


 // Cancela os beneficiários no plano antigo
 qryExec.Close;
 qryExec.SQL.Clear;
 qryExec.SQL.Add('UPDATE BENEFASS');
 qryExec.SQL.Add('   SET DTCANCELAMENTO = TO_DATE('+QuotedStr(DateToStr(dtpDataDesligamento.Date))+',''DD/MM/YYYY''),');
 qryExec.SQL.Add('       FLGATIVO       = 0,');
 qryExec.SQL.Add('       OBSCANCEL      ='+QuotedStr(edtMotivoPadrao.Text));
 qryExec.SQL.Add('WHERE IDPLANASS = '+IntToStr(dblkPlanosOrigem.KeyValue));
 qryExec.SQL.Add('  AND IDTITULAR = '+qryPartass.FieldByName('IDPESSOA').Asstring);
 qryExec.SQL.Add('  AND FLGATIVO  = 1');

 Try
  qryExec.ExecSQL
 Except
  Result := False;
  Exit;
 End;

end;

end.
