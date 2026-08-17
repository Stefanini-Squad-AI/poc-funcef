unit FCadCopiaTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, DBTables, Db, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdblook, DBGrids, faMensagem;

type
  TFrmCadCopiaTabela = class(TfrmCadastroCSInv)
    dbProducao: TDatabase;
    seProducao: TSession;
    pnlDetalhe: TPanel;
    pnlGrid: TPanel;
    mmSelecao: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btExecSelec: TButton;
    dsTabela: TwwDataSource;
    qryTabela: TwwQuery;
    QryCopiaTabela: TwwQuery;
    dblTabelaCarga: TwwDBLookupCombo;
    qryTabelaCarga: TwwQuery;
    dbgSelect: TDBGrid;
    dbgCarga: TDBGrid;
    SpeedButton1: TSpeedButton;
    wwQuery1: TwwQuery;
    wwQuery2: TwwQuery;
    wwQuery1SIGLAACAOBOLSA: TStringField;
    wwQuery1SIGLAEMISSOR: TStringField;
    fraMens: TfraMensagem;
    procedure FormCreate(Sender: TObject);
    procedure btExecSelecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadCopiaTabela: TFrmCadCopiaTabela;

implementation

uses UDataBase, uBibliotecaInvest, uSistema, dBaseDados, UOperComum, UmensErro;

{$R *.DFM}

procedure TFrmCadCopiaTabela.FormCreate(Sender: TObject);
begin
  inherited;
   dbProducao.Connected := False;
   dbProducao.Connected := True;
   fraMens.Apaga;
end;

procedure TFrmCadCopiaTabela.btExecSelecClick(Sender: TObject);
begin
  inherited;
   if Trim(mmSelecao.Lines.Text) <> '' then
   begin
      qryTabela.Close;
      qryTabela.sql.Clear;
      qryTabela.sql.Add(''+Trim(mmSelecao.Lines.Text)+'');
      qryTabela.Open;
   end;
   dblTabelaCarga.Text := '';
   qry.Close;
end;

procedure TFrmCadCopiaTabela.FormShow(Sender: TObject);
begin
  inherited;

   pnlFundo.Enabled := true;
   bbtnConfirmar.Enabled := true;
   bbtnCancelar.Enabled := true;

   qryTabelaCarga.Open;
end;

procedure TFrmCadCopiaTabela.bbtnConfirmarClick(Sender: TObject);
var
 i : integer;
 sSql : String;
begin
//  inherited;

   if Trim(dblTabelaCarga.Text) = '' then
      exit;

   if Trim(mmSelecao.Lines.Text) = '' then
      exit;

   try
      qryTabela.First;
      while not qryTabela.Eof do
      begin

         sSql := '';
         sSql := sSql + 'INSERT INTO '+Trim(dblTabelaCarga.Text)+' (';
         for i:=0 to qryTabela.FieldCount - 1 do
         begin
            if ((qryTabela.Fields[i].FieldName <> 'TRGDTINCLUSAO') and
                (qryTabela.Fields[i].FieldName <> 'TRGUSERINCLUSAO')) then
               sSql := sSql + qryTabela.Fields[i].FieldName+',';
         end;

         Delete(sSql,Length(sSql),Length(sSql));
         sSql := sSql +') VALUES (';

         for i:=0 to qryTabela.FieldCount - 1 do
         begin
            if ((qryTabela.Fields[i].FieldName <> 'TRGDTINCLUSAO') and
                (qryTabela.Fields[i].FieldName <> 'TRGUSERINCLUSAO')) then
            begin
               if not qryTabela.Fields[i].IsNull then
               begin
                  if (TField(qryTabela.Fields[i]) is TDateField) or
                     (TField(qryTabela.Fields[i]) is TDateTimeField) then
                     sSql := sSql +'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',qryTabela.Fields[i].AsDateTime))+',''DD/MM/YYYY''),'
                  else if TField(qryTabela.Fields[i]) is TFloatField then
                     sSql := sSql +OperComum.OraNumero(qryTabela.Fields[i].AsFloat)+','
                  else if TField(qryTabela.Fields[i]) is TStringField then
                     sSql := sSql +QuotedStr(qryTabela.Fields[i].AsString)+','
                  else if TField(qryTabela.Fields[i]) is TIntegerField then
                     sSql := sSql +qryTabela.Fields[i].AsString+','
                  else
                     sSql := sSql +'null,';
               end
               else
                  sSql := sSql +'null,';
            end;
         end;

         Delete(sSql,Length(sSql),Length(sSql));

         sSql := sSql +')';

         Try
            If not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            QryCopiaTabela.Close;
            QryCopiaTabela.Sql.Clear;
            QryCopiaTabela.Sql.Add(sSql);
            QryCopiaTabela.ExecSQL;

            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;

         except
            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            Abort;
         end;

         qryTabela.Next;
      end;
      qry.Close;
      qry.sql.Clear;
      qry.sql.Add('select * from '+Trim(dblTabelaCarga.Text));
      qry.Open;
   except
      qry.Close;
   end;

   pnlFundo.Enabled      := true;
   bbtnConfirmar.Enabled := true;
   bbtnCancelar.Enabled  := true;
end;

procedure TFrmCadCopiaTabela.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := true;
   bbtnConfirmar.Enabled := true;
   bbtnCancelar.Enabled := true;
end;

procedure TFrmCadCopiaTabela.SpeedButton1Click(Sender: TObject);
begin
   inherited;
   try
      dsTabela.DataSet := wwQuery1;
      wwQuery1.Open;
      try
         If not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         fraMens.Mostra;
         fraMens.Max := wwQuery1.RecordCount;
         while not wwQuery1.Eof do
         begin
            fraMens.Mes := 'Verificando ' + wwQuery1SIGLAEMISSOR.AsString;
            wwQuery2.SQL.Clear;
            wwQuery2.SQL.Add('UPDATE EMISSOR');
            wwQuery2.SQL.Add('SET SIGLAEMISSOR = ' + QuotedStr(wwQuery1SIGLAEMISSOR.AsString));
            wwQuery2.SQL.Add('WHERE IDEMISSOR in');
            wwQuery2.SQL.Add('         (SELECT E.IDEMISSOR');
            wwQuery2.SQL.Add('          FROM ACOESXBOLSA A, INVESTIMENTO I, EMISSOR E');
            wwQuery2.SQL.Add('          WHERE A.IDBOLSAVALORES = 23');
            wwQuery2.SQL.Add('            AND A.IDACAO = I.IDINVESTIMENTO');
            wwQuery2.SQL.Add('            AND I.IDEMISSOR = E.IDEMISSOR');
            wwQuery2.SQL.Add('            AND A.SIGLAACAOBOLSA = ' + QuotedStr(wwQuery1SIGLAACAOBOLSA.AsString) + ') ');
            wwQuery2.ExecSQL;
            wwQuery1.Next;
            fraMens.Incrementa;
         end;

         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         qry.SQL.Clear;
         qry.SQL.Add('SELECT SIGLAEMISSOR');
         qry.SQL.Add('FROM EMISSOR');
         qry.Open;

      except
         on E:Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Erro: ' + E.Message, 'Erro', mtError, [mbOk], 0);
         end;
      end;
   finally
      wwQuery1.Close;
      dsTabela.DataSet := qryTabela;
      fraMens.Apaga;
   end;
end;

end.



