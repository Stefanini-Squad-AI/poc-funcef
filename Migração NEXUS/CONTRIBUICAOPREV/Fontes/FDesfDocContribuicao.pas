unit FDesfDocContribuicao;

// Alterações:
//------------------------------------------------------------------------------
//Alteração  : funcionalidade renomeada
//Nº SIG.....: 33372
//Data.......: 29/11/2016
//Responsável: Edilaine Ferraresi
//Descrição..: Ajustes para Equacionamento - Recebimento Contrib via Folha através de procedure
//------------------------------------------------------------------------------
// Autor(a)    : Vinicius Ferreira
// Data        : 06/06/2011
// SOL         : 154383
// Kintana     : 1189116
// Descricao   : Criar campo de histórico do lançamento (financeiro)
// ------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Db, Wwdatsrc, DBTables, Wwquery,
  Wwdbigrd, Wwdbgrid, wwstorep, ComCtrls;

type
  TfrmDesfDocContribuicao = class(TfrmOkCancelar)
    PnlGrid: TPanel;
    PnlSelecao: TPanel;
    edCodDoc: TEdit;
    Label1: TLabel;
    BtBusca: TSpeedButton;
    BtDesfazer: TSpeedButton;
    BtAll: TSpeedButton;
    qryGrid: TwwQuery;
    dsGrid: TwwDataSource;
    qryGridSELECAO: TStringField;
    qryGridCODDOCUMENTOPREV: TFloatField;
    qryGridVALOR: TFloatField;
    dbGrid: TwwDBGrid;
    updGrid: TUpdateSQL;
    lbMensagem: TLabel;
    spDesfazerDoc: TwwStoredProc;
    prbReproc: TProgressBar;
    qryGridHSTCOMPL: TStringField;
    procedure BtBuscaClick(Sender: TObject);
    procedure BtAllClick(Sender: TObject);
    procedure BtDesfazerClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DesfazerDocumento(iCodDoc : Integer; var sErroProcesso : String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesfDocContribuicao: TfrmDesfDocContribuicao;

implementation

{$R *.DFM}

uses UMensErro, DBaseDados,
     FRecebeContribuicaoNovo;   //edilaine - SIG33372

procedure TfrmDesfDocContribuicao.BtBuscaClick(Sender: TObject);
begin
  inherited;

  BtBusca.Down := False;

  if qryGrid.IsEmpty then
     exit;

  if (Trim(edCodDoc.Text) = '') then
  begin
     MsgDlg('Preencha o Código do Documento.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if not qryGrid.Locate('CODDOCUMENTOPREV', Trim(edCodDoc.Text), []) then
  begin
     MsgDlg('Código do Documento não encontrado.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  dbGrid.Options   := dbGrid.Options + [TwwDBgridOption(dgEditing)];

  qryGrid.Edit;
  qryGrid.FieldByName('SELECAO').AsString := 'S';
  qryGrid.Post;
end;

procedure TfrmDesfDocContribuicao.BtAllClick(Sender: TObject);
var iReg : Integer;
begin
  inherited;
  BtAll.Down := False;  
  if qryGrid.IsEmpty then
     exit;
  edCodDoc.Text := '';
  iReg := 0;
  qryGrid.First;
  while not qryGrid.eof do
  begin
     if (qryGrid.FieldByName('SELECAO').AsString = 'S') then
     begin
        qryGrid.Next;
        continue;
     end;
     qryGrid.Edit;
     qryGrid.FieldByName('SELECAO').AsString := 'S';
     qryGrid.Post;
     iReg := iReg + 1;
     qryGrid.Next;
  end;
  qryGrid.First;
  lbMensagem.Caption := IntToStr(iReg)+' registros.';
end;

procedure TfrmDesfDocContribuicao.BtDesfazerClick(Sender: TObject);
begin
  inherited;
  BtDesfazer.Down := False;

  if qryGrid.IsEmpty then
     exit;

  edCodDoc.Text := '';
  lbMensagem.Caption := '';
  qryGrid.First;
  while not qryGrid.eof do
  begin
     if (qryGrid.FieldByName('SELECAO').AsString = 'N') then
     begin
        qryGrid.Next;
        continue;
     end;
     qryGrid.Edit;
     qryGrid.FieldByName('SELECAO').AsString := 'N';
     qryGrid.Post;
     qryGrid.Next;
  end;
  qryGrid.First;
end;

procedure TfrmDesfDocContribuicao.DesfazerDocumento(iCodDoc : Integer; var sErroProcesso : String);
begin
   spDesfazerDoc.Close;
   spDesfazerDoc.ParamByName('PCODDOCUMENTO').AsInteger := iCodDoc;
   if not(spDesfazerDoc.Prepared) then spDesfazerDoc.Prepare;
   spDesfazerDoc.ExecProc;
   sErroProcesso := spDesfazerDoc.ParamByName('POUTERRO').AsString;
end;

procedure TfrmDesfDocContribuicao.bbtnConfirmarClick(Sender: TObject);
var sErro : String;
begin
  inherited;

  BtDesfazer.Down := False;

  if qryGrid.IsEmpty then
     exit;

  if Trim(edCodDoc.Text) = '' then
  begin
     if not qryGrid.Locate('SELECAO', 'S', []) then
     begin
        MsgDlg('Não foi selecionado nenhum Código do Documento.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     qryGrid.First;

     // Prepara o progressbar
     prbReproc.Visible  := True;
     prbReproc.Position := 0;
     prbReproc.Max      := qryGrid.RecordCount;

     Application.ProcessMessages;

     qryGrid.DisableControls;

     while not qryGrid.eof do
     begin
        prbReproc.StepIt;
        Application.ProcessMessages;

        if (qryGrid.FieldByName('SELECAO').AsString = 'N') then
        begin
           qryGrid.Next;
           continue;
        end;

        try
           if not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;

           DesfazerDocumento(qryGrid.FieldByName('CODDOCUMENTOPREV').AsInteger, sErro);

           if sErro <> 'OK' then
              raise Exception.Create(sErro);

           dtmBaseDados.dbBaseDados.Commit;

        except
           if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;

           if MsgDlg('Ocorreu um problema no desfazer do Código do Documento '+Trim(edCodDoc.Text)+'.'#13+
                     sErro+#13+' Deseja continuar?', 'Erro', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
           begin
              qryGrid.EnableControls;
              prbReproc.Visible := False;
              exit;
           end;
        end;

        qryGrid.Delete;
     end;

     prbReproc.StepIt;
     Application.ProcessMessages;

     qryGrid.First;
     qryGrid.EnableControls;

     MsgDlg('Processamento efetuado com sucesso','Mensagem',mtInformation,[mbOk,mbHelp],0);

     prbReproc.Position := 0;
     prbReproc.Visible  := False;
  end
  else
  begin
     if not qryGrid.Locate('CODDOCUMENTOPREV', Trim(edCodDoc.Text), []) then
     begin
        MsgDlg('Código do Documento não encontrado.','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     try
        if not dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.StartTransaction;

        DesfazerDocumento(qryGrid.FieldByName('CODDOCUMENTOPREV').AsInteger, sErro);

        if sErro <> 'OK' then
           raise Exception.Create(sErro);

        dtmBaseDados.dbBaseDados.Commit;
     except
        if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Ocorreu um problema no desfazer do Código do Documento '+Trim(edCodDoc.Text)+'.'#13+
               sErro,'Erro',mtError,[mbOk,mbHelp],0);
     end;

     qryGrid.Delete;

     MsgDlg('Processamento efetuado com sucesso.','Mensagem',mtInformation,[mbOk,mbHelp],0);
  end;
end;

procedure TfrmDesfDocContribuicao.FormCreate(Sender: TObject);
begin
  // Vinicius Ferreira SOL 154383 KINTANA 1189116 - atualizei a qry
  inherited;
   qryGrid.Close;
   qryGrid.SQL.Clear;
   qryGrid.SQL.Add(' SELECT ''N'' AS SELECAO, ');
   qryGrid.SQL.Add('       HC.CODDOCUMENTOPREV, ');
   qryGrid.SQL.Add('      (SUM(DECODE(HC.FLGDEVOLUCAO, 0, HC.VALORESPERADO, 0)) - SUM(DECODE(HC.FLGDEVOLUCAO, 1, HC.VALORESPERADO, 0))) AS VALOR, DECODE(l.operacao,2,l.historicocompl,'''') HSTCOMPL');
   qryGrid.SQL.Add(' FROM HSTCONTRIBPREV HC, DOCUMENTO D, LANCTODOCUM L');
   qryGrid.SQL.Add(' WHERE');
   qryGrid.SQL.Add('       (HC.DATAPREVISAORECE = TO_DATE('+QuotedStr(frmRecebeContribuicaoNovo.dtRecebimento.Text)+','+QuotedStr('DD/MM/YYYY')+') )');     // edilaine - SIG33372
   qryGrid.SQL.Add('   AND (HC.IDPLANOPREV  IN ('+frmRecebeContribuicaoNovo.sIDPlanosDesfDoc+') )');                // edilaine - SIG33372
   qryGrid.SQL.Add('   AND (HC.CODDOCUMENTOPREV IS NOT NULL)');
   qryGrid.SQL.Add('   AND (D.CODDOCUMENTO  = HC.CODDOCUMENTOPREV)');
   qryGrid.SQL.Add('   AND (L.CODDOCUMENTO  = HC.CODDOCUMENTOPREV)');
   qryGrid.SQL.Add('   AND (D.STATUS       <> 2)');
   qryGrid.SQL.Add('   AND (NOT ((HC.FLGDESCFOLHA = 0) AND(D.EMISBLOQ = ''S'')))');
   qryGrid.SQL.Add('   AND (NOT EXISTS (SELECT 1 FROM LANCTODOCUM LA WHERE (RTRIM(LA.OPERACAO) = ''5'') AND (LA.CODDOCUMENTO = D.CODDOCUMENTO))) ');
   qryGrid.SQL.Add('   AND (NVL(L.CODALTERADOR,0) NOT IN (SELECT DISTINCT NVL(P1.CODALTBAIXANPAGO,0)');
   qryGrid.SQL.Add('                                      FROM PLANPREV P1');
   qryGrid.SQL.Add('                                      WHERE (P1.IDPLANOPREV = HC.IDPLANOPREV)) )');
   qryGrid.SQL.Add(' GROUP BY HC.CODDOCUMENTOPREV, DECODE(l.operacao,2,l.historicocompl,'''')');
   qryGrid.Open;
   if qryGrid.IsEmpty then
      qryGrid.Close;
end;

end.


