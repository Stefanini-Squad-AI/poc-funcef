// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  : Claudio Faria
// Data      : 04/09/2007
// Rotina    : bbtnConfirmarClick
// Pendencia : 22119
// Alteração : Confirmar que a FrmAguarde seja sempre fechada qdo terminar a uma operação
// ----------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 12/12/2002
// Alteração   : Retirada da Aba SQL
// -----------------------------------------------------------------------------
// Rotina      : AcertaUltMesPreparo
// Autor(a)    : Camille
// Data        : 20.11.2002
// Alteração   : Criação da Aba SQL
// -----------------------------------------------------------------------------
// Rotina      : AcertaUltMesPreparo
// Autor(a)    : Camille
// Data        : 01.04.2002
// Alteração   : Criação da rotina AcertaUltMesPreparo para percorrer a tabela
//               de contribuições (CONTRIBPREVPARTP) e preencher o campo ULTMESPREPARO
//               com o maior mês encontrado no histórico
// -----------------------------------------------------------------------------
// Rotina      : AcertaTransfPlano
// Autor(a)    : Camille
// Data        : 23.04.2002
// Alteração   : Criação da rotina AcertaTransfPlano para percorrer a tabela
//               de eventos (EVENTOSPREV) e verificar se, para todos os eventos
//               da categoria TP (Transferencia de Plano) os dados estão gravados
//               corretamente.
// -----------------------------------------------------------------------------
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
    tbsTransfPlano: TTabSheet;
    Label3: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AcertaSequence;
    procedure AcertaUltMesPreparo;
    procedure AcertaTransfPlano;
  end;

var
  frmAcertaSequence: TfrmAcertaSequence;

implementation

uses fAguarde, UDataBase, UMensErro, DBaseDados;

{$R *.DFM}

procedure TfrmAcertaSequence.bbtnConfirmarClick(Sender: TObject);
var i : word;
begin
  inherited;

  if pgctrlAcerto.ActivePage = tbsAcertaSequence
  then AcertaSequence
  else if pgctrlAcerto.ActivePage = tbsAcertaUltMesPreparo
       then AcertaUltMesPreparo
       else if pgctrlAcerto.ActivePage = tbsTransfPlano
            then AcertaTransfPlano;
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

  Try 
    frmAguarde.Mostra('Gerando Sequence ...');
    for i := 1 to iDiferenca do
    begin
        LeUltRegistro(qry, UpperCase(Trim(edTabela.Text)));
        lblIncrement.Caption := 'Incrementados : '+IntToStr(i);
        lblIncrement.Repaint;
        frmAguarde.Repaint;
    end;
  Finally
    frmAguarde.Apaga; 
  End;
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

procedure TfrmAcertaSequence.AcertaTransfPlano;
var iIdEventoInscricao : longint;
    sSQL               : string;
begin
    with qry do
    begin
       Close;
       SQL.Clear;
       SQl.Add(' SELECT E.IDEVENTOSPREV,   E.IDEVENTOGERADOR,                                             '+
               '        E.IDPESSJUR,       E.IDPLANOPREV AS IDPLANOORIGEM,                                '+
               '        E.IDPESSOA,        E.SEQPROPOSTA,                                                 '+
               '        E.IDSITPLANOATUAL AS IDSITPLANOATUALORIG,                                         '+
               '        E.IDSITFUNCATUAL  AS IDSITFUNCATUALORIG,                                          '+
               '        E.IDSITPARTATUAL  AS IDSITPARTATUALORIG,                                          '+
               '        E.IDSITPLANONOVO  AS IDSITPLANONOVOORIG,                                          '+
               '        E.IDSITFUNCNOVO   AS IDSITFUNCNOVOORIG,                                           '+
               '        E.IDSITPARTNOVO   AS IDSITPARTNOVOORIG,                                           '+
               '        E.IDSITPLANOATUAL,                                                                '+
               '        E.IDSITPLANONOVO,                                                                 '+
               '        DECODE(E.IDSITFUNCATUAL, NULL, EL.IDSITFUNC, E.IDSITFUNCATUAL) AS IDSITFUNCATUAL, '+
               '        DECODE(E.IDSITPARTATUAL, NULL, PP.IDSITPART, E.IDSITPARTATUAL) AS IDSITPARTATUAL, '+
               '        DECODE(E.IDSITFUNCNOVO,  NULL, EL.IDSITFUNC, E.IDSITFUNCNOVO)  AS IDSITFUNCNOVO,  '+
               '        DECODE(E.IDSITPARTNOVO,  NULL, PP.IDSITPART, E.IDSITPARTNOVO)  AS IDSITPARTNOVO,  '+
               '        E.INSCRICAONUMERO, E.DATAREGISTRO,   E.DATAEVENTO,                                '+
               '        PP.IDPLANOPREV AS IDPLANODESTINO,                                                 '+
               '        PP.INSCRICAONUMERO AS INSCRICAODESTINO,                                           '+
               '        EL.IDSITFUNC,      PP.IDSITPART                                                   '+
               ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, EVENTOSPREV E, EVENTOGERADOR EG                    '+
               ' WHERE  EG.FLGINTERNO     = ''TP''                                                        '+
               ' AND    E.IDEVENTOGERADOR = EG.IDEVENTOGERADOR                                            '+
               ' AND    PP.IDPESSJUR      = E.IDPESSJUR                                                   '+
               ' AND    PP.IDPLANOPREV    = PP.IDPLANOPREV                                                '+
               ' AND    PP.IDPESSOA       = E.IDPESSOA                                                    '+
               ' AND    PP.SEQPROPOSTA    = E.SEQPROPOSTA                                                 '+
               ' AND    PP.IDPLANOPREV    <> E.IDPLANOPREV                                                '+
               ' AND    PP.FLGDESATIVADO  = 0                                                             '+
               ' AND    EL.IDPESSJUR      = PP.IDPESSJUR                                                  '+
               ' AND    EL.IDPESSOA       = PP.IDPESSOA                                                   ');
       Open;

       if IsEmpty
       then begin
          Close;
          MsgDlg('Nenhum evento da categoria "Transferência de Plano" encontrada. ','Informação', mtInformation, [mbOk],0);
          Exit;
       end;
    end;

    // Buscar codigo do evento de inscricao no plano
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT MAX(IDEVENTOGERADOR) AS IDEVENTOGERADOR  '+
                   ' FROM   EVENTOGERADOR                            '+
                   ' WHERE  FLGINTERNO     = ''IP''                  ');
    qryAux.Open;
    if qryAux.IsEmpty or (qryAux.FieldByName('IDEVENTOGERADOR').AsString = '')
    then begin
       Close;
       MsgDlg('Nenhum evento da categoria "Inscrição no Plano" encontrada. ','Erro', mtError, [mbOk],0);
       Exit;
    end;

    iIdEventoInscricao := qryAux.FieldByName('IDEVENTOGERADOR').AsInteger;

    dtmBaseDados.dbBaseDados.StartTransaction;

    while not qry.Eof do
    begin
       // Verificar se algum dos campos da eventosprev está nulo
       sSQL := '';
       if qry.FieldbyName('IDSITFUNCNOVOORIG').AsString = ''
       then sSQL := sSQL +', IDSITFUNCNOVO = '+qry.FieldByName('IDSITFUNC').AsString;

       if qry.FieldbyName('IDSITFUNCATUALORIG').AsString = ''
       then sSQL := sSQL +', IDSITFUNCATUAL = '+qry.FieldByName('IDSITFUNC').AsString;

       if qry.FieldbyName('IDSITPARTNOVOORIG').AsString = ''
       then sSQL := sSQL +', IDSITPARTNOVO = '+qry.FieldByName('IDSITPART').AsString;

       if qry.FieldbyName('IDSITPARTATUALORIG').AsString = ''
       then sSQL := sSQL +', IDSITPARTATUAL = '+qry.FieldByName('IDSITPART').AsString;

       if Trim(sSQL) <> ''
       then begin
          sSQL := Copy(sSQL, 2, Length(sSQL) - 1);
          qryAux.Close;
          qryAux.SQl.Clear;
          qryAux.SQL.Add('UPDATE EVENTOSPREV SET '+sSQL+
                         'WHERE  IDEVENTOSPREV = '+qry.FieldByName('IDEVENTOSPREV').AsString);
          try
             qryAux.ExecSQL;
          except
             dtmBaseDados.dbBaseDados.RollBack;
             MsgDlg('Erro ao atualizar campos na tabela de eventos.','Erro', mtError, [mbOk],0);
             Exit;
          end;
       end;

       // Verificar se existe uma linha na eventos prev com a inscricao no evento destino
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' SELECT E.IDEVENTOSPREV,   E.IDEVENTOGERADOR,                   '+
                      '        E.IDPESSJUR,       E.IDPLANOPREV AS IDPLANOORIGEM,      '+
                      '        E.IDPESSOA,        E.SEQPROPOSTA,                       '+
                      '        E.IDSITPLANOATUAL, E.IDSITFUNCATUAL, E.IDSITPARTATUAL,  '+
                      '        E.IDSITPLANONOVO,  E.IDSITFUNCNOVO,  E.IDSITPARTNOVO,   '+
                      '        E.INSCRICAONUMERO, E.DATAREGISTRO,   E.DATAEVENTO       '+
                      ' FROM   EVENTOGERADOR EG,  EVENTOSPREV E                        '+
                      ' WHERE  EG.FLGINTERNO     = ''IP''                              '+
                      ' AND    E.IDEVENTOGERADOR = EG.IDEVENTOGERADOR                  '+
                      ' AND    E.IDPESSJUR       = '+qry.FieldByName('IDPESSJUR').AsString+
                      ' AND    E.IDPLANOPREV     = '+qry.FieldByName('IDPLANODESTINO').AsString+
                      ' AND    E.IDPESSOA        = '+qry.FieldByName('IDPESSOA').AsString+
                      ' AND    E.SEQPROPOSTA     = '+qry.FieldByName('SEQPROPOSTA').AsString);
       qryAux.Open;
       if qryAux.IsEmpty
       then begin
          // Inserir inscricao no plano destino
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' INSERT INTO EVENTOSPREV ( '+
                         '        IDEVENTOSPREV,   IDEVENTOGERADOR,                   '+
                         '        IDPESSJUR,       IDPLANOPREV ,                      '+
                         '        IDPESSOA,        SEQPROPOSTA,                       '+
                         '        IDSITPLANOATUAL, IDSITFUNCATUAL, IDSITPARTATUAL,    '+
                         '        IDSITPLANONOVO,  IDSITFUNCNOVO,  IDSITPARTNOVO,     '+
                         '        INSCRICAONUMERO, DATAREGISTRO,   DATAEVENTO )       '+
                         ' VALUES ('+IntToStr(LeUltRegistro(nil,'EVENTOSPREV')) +','+
                                     IntToStr(iIdEventoInscricao)               +','+
                                     qry.FieldByName('IDPESSJUR').AsString      +','+
                                     qry.FieldByName('IDPLANODESTINO').AsString +','+
                                     qry.FieldByName('IDPESSOA').AsString       +','+
                                     qry.FieldByName('SEQPROPOSTA').AsString    +','+
                                     qry.FieldByName('IDSITPLANONOVO').AsString +','+
                                     qry.FieldByName('IDSITFUNCNOVO').AsString  +','+
                                     qry.FieldByName('IDSITPARTNOVO').AsString  +','+
                                     qry.FieldByName('IDSITPLANONOVO').AsString +','+
                                     qry.FieldByName('IDSITFUNCNOVO').AsString  +','+
                                     qry.FieldByName('IDSITPARTNOVO').AsString  +','+
                                     qry.FieldByName('INSCRICAODESTINO').AsString+','+
                         ' TO_DATE('''+qry.FieldByName('DATAREGISTRO').AsString  +''',''DD/MM/YYYY'') ,' +
                         ' TO_DATE('''+qry.FieldByName('DATAEVENTO').AsString    +''',''DD/MM/YYYY'') )' );
          try
             qryAux.ExecSQL;
          except
             dtmBaseDados.dbBaseDados.RollBack;
             MsgDlg('Erro ao inserir evento de inscrição no plano destino.','Erro', mtError, [mbOk],0);
             Exit;
          end;
       end;

       // Verificar se a data final das contribuicoes está com a data do evento
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL = TO_DATE('''+qry.FieldByName('DATAEVENTO').AsString    +''',''DD/MM/YYYY'') '+
                      ' WHERE  IDPESSJUR       = '+qry.FieldByName('IDPESSJUR').AsString+
                      ' AND    IDPLANOPREV     = '+qry.FieldByName('IDPLANOORIGEM').AsString+
                      ' AND    IDPESSOA        = '+qry.FieldByName('IDPESSOA').AsString+
                      ' AND    SEQPROPOSTA     = '+qry.FieldByName('SEQPROPOSTA').AsString+
                      ' AND    FLGCOBRA        = 0 '+
                      ' AND    DATAFINAL       IS NULL ');
       try
          qryAux.ExecSQL;
       except
          dtmBaseDados.dbBaseDados.RollBack;
          MsgDlg('Erro ao atualizar data final de contribuições. ','Erro', mtError, [mbOk],0);
          Exit;
       end;

       qry.Next;
    end;
    dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Acerto dos eventos de Transferência de Plano efetuado com sucesso.','Informação', mtInformation, [mbOk],0);
end; // AcertaTransfPlano

procedure TfrmAcertaSequence.FormShow(Sender: TObject);
begin
  inherited;
  pgctrlAcerto.ActivePage := tbsAcertaSequence;
end;

end.


