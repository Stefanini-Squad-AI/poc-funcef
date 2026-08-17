// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : AcertaUltMesPreparo
// Autor(a)    : Camille
// Data        : 01.04.2002
// Alteração   : Criação da rotina AcertaUltMesPreparo para percorrer a tabela
//               de contribuições (CONTRIBPREVPARTP) e preencher o campo ULTMESPREPARO
//               com o maior mês encontrado no histórico
// -----------------------------------------------------------------------------
// *****************************************************************************
unit FAcertaSequence;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmAcertaSequence = class(TfrmOkCancelar)
    qry: TwwQuery;
    pgctrlAcerto: TPageControl;
    tbsAcertaSequence: TTabSheet;
    tbsAcertaUltMesPreparo: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    lblMaxTabela: TLabel;
    lblSequence: TLabel;
    lblIncrement: TLabel;
    edTabela: TEdit;
    edSequence: TEdit;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    updPatro: TUpdateSQL;
    updPlano: TUpdateSQL;
    dbgrdPatro: TwwDBGrid;
    dsPatro: TwwDataSource;
    dsPlano: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    qryAux: TwwQuery;
    lblContUltMesPreparo: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AcertaSequence;
    procedure AcertaUltMesPreparo;
  end;

var
  frmAcertaSequence: TfrmAcertaSequence;

implementation

uses fAguarde, UDataBase, UMensErro, DBaseDados;

{$R *.DFM}

procedure TfrmAcertaSequence.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if pgctrlAcerto.ActivePage = tbsAcertaSequence
  then AcertaSequence
  else if pgctrlAcerto.ActivePage = tbsAcertaUltMesPreparo
       then AcertaUltMesPreparo;
end;

procedure TfrmAcertaSequence.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close; qryPatro.Open;
  qryPlano.Close; qryPlano.Open;
end;

procedure TfrmAcertaSequence.AcertaSequence;
var i, iMaximo, iAtual, iDiferenca : integer;
begin
  inherited;

  if Trim(edTabela.Text) = '' then Exit;
  if Trim(edSequence.Text) = '' then Exit;
  // verificar valor atual
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT MAX('+Trim(edSequence.Text)+') AS ATUAL FROM '+Trim(edTabela.Text));
  qry.Open;
  if qry.IsEmpty then Exit;
  iMaximo := qry.FieldByName('Atual').AsInteger;
  lblMaxTabela.Caption := 'Máximo na Tabela : '+IntToStr(iMaximo);

  // verificar valor do sequence
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(' SELECT SEQ'+Trim(edTabela.Text)+'.NEXTVAL AS VALORSEQ FROM DUAL ');
  qry.Open;
  if qry.IsEmpty then Exit;
  iAtual  := qry.FieldByName('ValorSeq').AsInteger;
  lblSequence.Caption := 'Sequence : '+IntToStr(iAtual);

  iDiferenca := iMaximo - iAtual + 1;

  frmAguarde.Mostra('Gerando Sequence ...');
  for i := 1 to iDiferenca do
  begin
      LeUltRegistro(qry, UpperCase(Trim(edTabela.Text)));
      lblIncrement.Caption := 'Incrementados : '+IntToStr(i);
      lblIncrement.Repaint;
      frmAguarde.Repaint;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmAcertaSequence.AcertaUltMesPreparo;
var sPatros, sPlanos : string;
    i                : longint;
begin

   // Preencher planos e patrocinadoras selecionadas
   sPatros := '';
   sPlanos := '';

   qryPatro.First;
   while not qryPatro.Eof do
   begin
      if qryPatro.FieldByName('FLGPROCESSA').AsInteger = 1
      then begin
         if Trim(sPatros) = ''
         then sPatros := qryPatro.FieldByName('IDPESSOA').AsString
         else sPatros := sPatros +','+qryPatro.FieldByName('IDPESSOA').AsString;
      end;
      qryPatro.Next;
   end;

   qryPlano.First;
   while not qryPlano.Eof do
   begin
      if qryPlano.FieldByName('FLGPROCESSA').AsInteger = 1
      then begin
         if Trim(sPlanos) = ''
         then sPlanos := qryPlano.FieldByName('IDPLANOPREV').AsString
         else sPlanos := sPlanos +','+qryPlano.FieldByName('IDPLANOPREV').AsString;
      end;
      qryPlano.Next;
   end;

   // Se não houver nennhum plano e nenhuma patrocinadora selecionada, sair
   if (Trim(sPatros) = '') and (Trim(sPlanos) = '')
   then begin
      MsgDlg('Nenhuma patrocinadora e nenhum plano selecionados. Verifique.','Erro', mtError, [mbOk],0);
      Exit;
   end;

   dtmBaseDados.dbBaseDados.StartTransaction;
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, IDCONTRIBUICAO, MAX(MESCOBRANCA) AS MAIORMES '+
              ' FROM    HSTCONTRIBPREV                                         '+
              ' WHERE   MESREFERENCIA = MESCOBRANCA                            ');
      if Trim(sPatros) <> ''
      then SQL.Add('AND IDPESSJUR IN ('+sPatros+') ');

      if Trim(sPlanos) <> ''
      then SQL.Add('AND IDPLANOPREV IN ('+sPlanos+') ');

      SQL.Add(' GROUP BY IDPESSJUR, IDPLANOPREV, IDPESSOA, SEQPROPOSTA, IDCONTRIBUICAO ');
      Open;

      i := 0;
      while not Eof do
      begin
         if Trim(FieldByName('MAIORMES').AsString) = ''
         then begin
            Next;
            continue;
         end;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQl.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+FieldByName('MAIORMES').AsString+''''+
                        ' WHERE  IDPESSJUR   = '+FieldByName('IDPESSJUR').AsString+
                        ' AND    IDPLANOPREV = '+FieldByName('IDPLANOPREV').AsString+
                        ' AND    IDPESSOA    = '+FieldByName('IDPESSOA').AsString+
                        ' AND    SEQPROPOSTA = 1 '+
                        ' AND    IDCONTRIBUICAO = '+FieldByName('IDCONTRIBUICAO').AsString);
         try
            qryAux.ExecSQL;
         except
            dtmBaseDados.dbBaseDados.RollBack;
            MsgDlg('Erro ao atualizar tabela de contribuições. Processo Cancelado.','Erro',mtError,[mbOk],0);
            Exit;
         end;
         inc(i);
         lblContUltMesPreparo.Caption := 'Registros Atualizados : '+IntToStr(i);
         lblContUltMesPreparo.Repaint;
         Next;
      end;
   end;

   if qry.IsEmpty
   then begin
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Nenhum registro encontrado para a(s) patrocinadora(a) e plano(s) indicado(s). Verifique','Informação',mtInformation,[mbOk],0);
   end
   else begin
      if MsgDlg('Operação terminada com sucesso. Deseja confirmar a operação ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrYes
      then dtmBaseDados.dbBaseDados.Commit
      else dtmBaseDados.dbBaseDados.RollBack;
   end;
end;

end.
