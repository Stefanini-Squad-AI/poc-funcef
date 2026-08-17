unit FSincoPrevAss;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 01/11/2007
// Pendência   : 26734
// Rotina      : AtualizaDados, bbtnConfirmarClick
// Descricao   : Acertando o update na Partass. Colocando commit na bbtnConfirmarClick.
//               Acertando ItemIndex no dbcFlgAcaoExit
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, DBTables, Db, Wwdatsrc, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook, Wwdbdlg;

type
  TFrmSincoPrevAss = class(TfrmOkCancelar)
    dbgSincroniza: TwwDBGrid;
    qry: TwwQuery;
    ds: TwwDataSource;
    upd: TUpdateSQL;
    dbcFlgAcao: TwwDBComboBox;
    qrySitAss: TwwQuery;
    qryAux: TwwQuery;
    qryExe: TwwQuery;
    memResult: TMemo;
    btnPrint: TBitBtn;
    savedlg: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbcFlgAcaoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    procedure AtualizaDados;
    { Private declarations }
  public
    bErro,
    bOperacao : Boolean;
    { Public declarations }
  end;

var
  FrmSincoPrevAss: TFrmSincoPrevAss;

implementation

uses UMensErro, UAdmAss, DBaseDados, UDataBase, uFuncoesUteis;

{$R *.DFM}

procedure TFrmSincoPrevAss.FormCreate(Sender: TObject);
begin
  inherited;
  qrySitAss.Close;
  qrySitAss.Open;

  dbcFlgAcao.Items.Clear;

  While Not qrySitAss.Eof do
   Begin
    dbcFlgAcao.Items.Add(qrySitAss.FieldByName('DESCRICAO').AsString + #9 + qrySitAss.FieldByName('IDSITPLANOASS').AsString );
    qrySitAss.Next;
   End;
end;

procedure TFrmSincoPrevAss.bbtnConfirmarClick(Sender: TObject);
Var
 iParts     : Integer;
 bAlgumErro : Boolean;
begin
//  inherited;
   // Verifica se as novas situações foram preenchidas
   bOperacao := True;
   qry.DisableControls;
   qry.First;
   bErro  := False;
   memResult.Lines.Clear;
   iParts := 0;

   While Not qry.Eof do
    Begin
      If Trim(qry.FieldByName('FLGACAO').AsString) = ''
       Then Begin
         MsgDlg('Existe NOVA SITUAÇÃO ASSISTENCIAL não preenchida!'+#13+#10+
                'Por favor preencha os campos necessários.','Erro',mtError,[mbOK],0);
         bErro := True;
         exit
       End;
      qry.Next;
    End;

   If bErro
    Then Exit;
   // Executa o cancelamento nas tabelas assistenciais.

   If Not dtmBaseDados.dbBaseDados.InTransaction
    Then dtmBaseDados.dbBaseDados.StartTransaction;

   memResult.BringToFront;
   btnPrint.Visible := True;
   memResult.Lines.Add('Operações de sincronização iniciado em '+DateTimeToStr(Now));
   memResult.Lines.Add(' ');

   bAlgumErro := False;

   qry.First;
   While Not qry.Eof do
    Begin
      Inc(iParts);

      AtualizaDados;

      If bErro
       Then Begin
         qryAux.Close;
         qryAux.SQL.Add('SELECT PA.INSCRICAONUMERO, PE.NOME');
         qryAux.SQL.Add('FROM PARTASS PA, PESSOA PE');
         qryAux.SQL.Add('WHERE PA.IDPESSOA =  '+qry.FieldByName('IDPESSOA').AsString);
         qryAux.SQL.Add('  AND PA.IDPESSOA = PE.IDPESSOA');

         qryAux.Open;

         memResult.Lines.Add('* - Erro na atualização de dados do participante');
         memResult.Lines.Add('Participante: '+qryAux.FieldByName('NOME').AsString);
         memResult.Lines.Add('Inscrição: '+qryAux.FieldByName('INSCRICAONUMERO').AsString);
         memResult.Lines.Add(' ');
         bErro      := False;
         bAlgumErro := True;
       End;

      qry.Next;
    End;

   memResult.Lines.Add('Término da operação de sincronização em '+DateTimeToStr(Now)+' com '+IntToStr(iParts)+' participantes sincronizados.');

   If bAlgumErro Then
     begin
       If MsgDlg('A operação de sincronização terminou com problemas.'+#13+#10+
                   'Deseja cancelar a operação de sincronização','Erro na Sincronização',mtConfirmation,[mbYes, mbNo],0) = mrNo
          Then Begin
            bOperacao := False;
            dtmBaseDados.dbBaseDados.Rollback;
          End
          Else dtmBaseDados.dbBaseDados.Commit;
     end
   else  //Hugo Luna - 31/10/2007
     dtmBaseDados.dbBaseDados.Commit;  //Hugo Luna - 31/10/2007

   qry.EnableControls;
   qry.First;
   Exit;
end;

procedure TFrmSincoPrevAss.dbcFlgAcaoExit(Sender: TObject);
begin
  inherited;
  qry.FieldByName('FLGACAO').AsInteger := dbcFlgAcao.ItemIndex + 2; //Hugo Luna - 31/10/2007
end;

procedure TFrmSincoPrevAss.AtualizaDados;
Var
  sSql : String;
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT DISTINCT PP.IDPESSJUR, PP.SEQPROPOSTA, PP.IDPLANOPREV, PP.INSCRICAONUMERO');
  qryAux.SQL.Add('FROM PARTASS PA, PARTPREVPLAN PP');
  qryAux.SQL.Add('WHERE PA.IDPESSOA      = '+qry.FieldByName('IDPESSOA').AsString );
  qryAux.SQL.Add('  AND PA.IDPESSOA      = PP.IDPESSOA');
  qryAux.SQL.Add('  AND PP.FLGDESATIVADO = 0');
  qryAux.SQL.Add('  AND (PP.IDPESSJUR       <> PA.IDPESSJUR   OR');
  qryAux.SQL.Add('       PP.SEQPROPOSTA     <> PA.SEQPROPOSTA OR');
  qryAux.SQL.Add('       PP.IDPLANOPREV     <> PA.IDPLANOPREV OR');
  qryAux.SQL.Add('       PP.INSCRICAONUMERO <> PA.INSCRICAONUMERO OR');
  qryAux.SQL.Add('       PP.SEQPROPOSTA     <> PA.SEQPROPOSTA)');

  qryAux.Open;

  qryExe.Close;
  qryExe.SQL.Clear;

  sSql := 'UPDATE PARTASS '+#13+#10+
          'SET IDSITPART = '+qry.FieldByName('FLGACAO').AsString;

  If Not qryAux.IsEmpty
   Then Begin
     If Not qryAux.FieldByName('IDPESSJUR').IsNull
      Then sSql := sSql + ', IDPESSJUR = '+qryAux.FieldByName('IDPESSJUR').AsString; //Hugo Luna - 01/11/2007

     If Not qryAux.FieldByName('SEQPROPOSTA').IsNull
      Then sSql := sSql + ', SEQPROPOSTA = '+qryAux.FieldByName('SEQPROPOSTA').AsString; //Hugo Luna - 01/11/2007

     If Not qryAux.FieldByName('IDPLANOPREV').IsNull
      Then sSql := sSql + ', IDPLANOPREV = '+qryAux.FieldByName('IDPLANOPREV').AsString; //Hugo Luna - 01/11/2007

     If Not qryAux.FieldByName('INSCRICAONUMERO').IsNull
      Then sSql := sSql + ', INSCRICAONUMERO = '+qryAux.FieldByName('INSCRICAONUMERO').AsString;  //Hugo Luna - 01/11/2007

   End;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDSITPLANOASS, FLGINTERNO');
  qryAux.SQL.Add('FROM SITPLANOASS');
  qryAux.SQL.Add('WHERE IDSITPLANOASS = '+qry.FieldByName('FLGACAO').AsString);
  qryAux.Open;

  If qryAux.FieldByName('FLGINTERNO').AsString = 'CA'
   Then  sSql := sSql + ', FLGINSCRICAOCANC = 1, '+#13+#10+
                        'DATACANCELAMENTO = SYSDATE, '+#13+#10+
                        'OBSCANCEL = '+ '''' +'CANCELADO POR OPERAÇÃO DE SINCRONIZAÇÃO'+ ''''; //Hugo Luna - 01/11/2007

  //sSql := Copy(sSql, 1, length(sSql)-3); //Hugo Luna - 01/11/2007

  sSql := sSql + ' WHERE IDPESSOA = '+qry.FieldByName('IDPESSOA').AsString;
  sSql := sSql + ' AND NVL(FLGINSCRICAOCANC,0) = 0';

  qryExe.SQL.Add(sSql);
  Try
    qryExe.ExecSQL
  Except
     bErro := False;
  End;
end;

procedure TFrmSincoPrevAss.FormShow(Sender: TObject);
begin
  inherited;
  memResult.Lines.Clear;
  dbgSincroniza.BringToFront;
  btnPrint.Visible := False;
  bOperacao := False;
end;

procedure TFrmSincoPrevAss.btnPrintClick(Sender: TObject);
begin
  if savedlg.Execute then
     memResult.Lines.SaveToFile(savedlg.filename);
end;

end.
