// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : GravaContribuicao
// Autor(a)    : Gleyber
// Data        : 13/08/2004
// Pendência   : 17336
// Descrição   : Acerto nos alias da query que apaga registros da HSTATRASOCONTRIB.
//-----------------------------------------------------------------------------
unit FCadContribPartTransfPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadContribParticipante, MontaSelect, Db, DBTables, Wwquery, Wwdatsrc,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, Grids, Wwdbigrd, Wwdbgrid,  wwdblook, TEdNum, ComCtrls, ExtCtrls, URegra, IvDictio,
  IvMulti, IvEMulti, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  ImgList, TB97Ctls;

type
  TfrmCadContribPartTransfPlano = class(TfrmCadContribParticipante)
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnApagDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblkpcmbContribuicaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbContribuicaoExit(Sender: TObject);
    procedure chkDescFolhaClick(Sender: TObject);
    procedure qryGridContribCalcFields(DataSet: TDataSet);
    procedure qryGridContribAfterScroll(DataSet: TDataSet);
    procedure qryContribuicaoAfterScroll(DataSet: TDataSet);
    procedure chkCobrarContribClick(Sender: TObject);
    procedure edQtdeParcelasExit(Sender: TObject);
    procedure dblkpcmbPeriodicidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dtedInicioExit(Sender: TObject);
  private
    bApagarContribuicoes : boolean;
    sValOp1, sValOp2, sValOp3 : string;
    EstadoContrib : TDataSetState;
    lIdPessoa,lIdPessJur,lIdPlanoPrev,liSeqProposta : integer; // identificadores do participante
    { Private declarations }
  public
    procedure HabilitaPainel( panel : TPanel ; flag : boolean);
    procedure AssociaContribTransf( sNomeParticip,sNomePatro,sNomePlano : string;
              iIdPessoa,iIdPessJur,iIdPlanoPrev,iSeqProposta : integer; bProcura : boolean);
    function  ValidaOpcoes : boolean;
    function  ContribuicaoExiste : boolean;
    function  GravaContribuicao : boolean;
    procedure LimpaPainel;
    procedure PreenchePainel;
    { Public declarations }
  end;

var
  frmCadContribPartTransfPlano: TfrmCadContribPartTransfPlano;

implementation

uses Umenserro, FEventoTransfPlano, Udatabase, UAdmPrev, UContribuicaoPrev,
  USistema;

{$R *.DFM}

procedure TfrmCadContribPartTransfPlano.HabilitaPainel( panel : TPanel ; flag : boolean);
begin
    panel.Visible := flag;
    
    if flag // painel vai apareceer
    then begin
       qryContribuicao.Close;
       qryContribuicao.SQL.Clear;
       qryContribuicao.SQL.Add(' SELECT C.*,CP.FLGACEITAOPCAO,CP.NUMOPCOES, '+
                               '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, '+
                               '        CP.IDREGRAVALIDAOP3                      '+
                               ' FROM   CONTRIBUICAO C, CONTPREV CP              '+
                               ' WHERE  CP.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                               '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                               '        CP.FLGPAGADOR <> ''E'' AND '+                               
                               '        CP.IDCONTRIBUICAO NOT IN '+
                               '        (SELECT CP2.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP2 '+
                               '         WHERE  CP2.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                               '                CP2.IDPESSJUR = '+IntToStr(lIdPessJur)+ ' AND '+
                               '                CP2.IDPESSOA = '+IntToStr(lIdPessoa)+') '+
                               ' ORDER BY C.NOME ');
       qryContribuicao.Open;
    end;
end;

procedure TfrmCadContribPartTransfPlano.AssociaContribTransf( sNomeParticip,sNomePatro,sNomePlano : string;
                                                     iIdPessoa,iIdPessJur,iIdPlanoPrev,iSeqProposta : integer; bProcura : boolean);
begin
   edNome.Text  := sNomeParticip;
   edPatro.Text := sNomePatro;
   edPlano.Text := sNomePlano;
   lIdPessoa := iIdPessoa;
   lIdPessJur := iIdPessJur;
   lIdPlanoPrev := iIdPlanoPrev;
   liSeqProposta := iSeqProposta;

   qryGridContrib.Close;
   qryGridContrib.ParambyName('iIdPlanoPrev').AsInteger := lIdPlanoPrev;
   qryGridContrib.ParambyName('iIdPessoa').AsInteger := lIdPessoa;
   qryGridContrib.ParambyName('iIdPessJur').AsInteger := lIdPessJur;
   qryGridContrib.ParambyName('iSeqProposta').AsInteger := liSeqProposta;
   qryGridContrib.Open;
   ShowModal;
end;

procedure TfrmCadContribPartTransfPlano.FormShow(Sender: TObject);
begin

   chkRetroativa.checked := bflgRetroativo;
   chkRetroativa.Enabled := True;

   lIdPessoa := strtoint(sIdPessoaTransf);
   lIdPessJur := strtoint(sIdPessJurDestinoTransf);
   lIdPlanoPrev := strtoint(sIdPlanoDestino);
   liSeqProposta := strtoint(sSeqPropostaTransf);

   qryGridContrib.Close;
   qryGridContrib.ParambyName('iIdPlanoPrev').AsInteger := lIdPlanoPrev;
   qryGridContrib.ParambyName('iIdPessoa').AsInteger := lIdPessoa;
   qryGridContrib.ParambyName('iIdPessJur').AsInteger := lIdPessJur;
   qryGridContrib.ParambyName('iSeqProposta').AsInteger := liSeqProposta;
   qryGridContrib.Open;

   qryContribuicao.Close;
   qryContribuicao.SQL.Clear;
   qryContribuicao.SQL.Add(' SELECT C.*,CP.FLGACEITAOPCAO,CP.NUMOPCOES, '+
                              '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, '+
                              '        CP.IDREGRAVALIDAOP3                      '+
                              ' FROM   CONTRIBUICAO C, CONTPREV CP              '+
                              ' WHERE  CP.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                              '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                              '        CP.FLGPAGADOR <> ''E'' AND '+
                              '        CP.IDCONTRIBUICAO NOT IN '+
                              '        (SELECT CP2.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP2 '+
                              '         WHERE  CP2.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                              '                CP2.IDPESSJUR = '+IntToStr(lIdPessJur)+ ' AND '+
                              '                CP2.IDPESSOA = '+IntToStr(lIdPessoa)+') '+
                              ' ORDER BY C.NOME ');
   qryContribuicao.Open;

   qryPortForma.Close; qryPortForma.Open;

   EstadoContrib := dsBrowse;
   pnlControlesDet.SendToBack;
   dbGrdDet.BringToFront;
   pnlBarraDetalhe.Enabled := True;

end;

procedure TfrmCadContribPartTransfPlano.bbtnCancelarClick(Sender: TObject);
begin

  if MsgDlg('Esta opção irá desfazer todas as modificações feitas nas Contribuições. Deseja continuar ?','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrno then
  begin
     exit;
  end;

  //delete todos AS contribuições do plano novo
  qryaux.close;
  qryaux.sql.clear;
  qryaux.sql.add(' DELETE FROM CONTRIBPREVPARTP '+
                 ' WHERE IDPESSJUR = '+sIdPessJurDestinoTransf+' AND '+
                 ' IDPESSOA = '+sIdPessoaTransf+' AND '+
                 ' IDPLANOPREV = '+sIdPlanoDestino+' AND '+
                 ' SEQPROPOSTA = '+sSeqPropostaTransf+'');
  try
      qryaux.execsql;
  except
  end;

  qryGridContrib.close;
  qryGridContrib.open;


end;

procedure TfrmCadContribPartTransfPlano.bbtnSairClick(Sender: TObject);
begin
   if MsgDlg('Deseja gravar as modificações ?','Confirmação',mtConfirmation,[mbno, mbyes],0) = mrno then
   begin
      //delete todos AS contribuições do plano novo
      qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.add(' DELETE FROM  CONTRIBPREVPARTP '+
                     ' WHERE IDPESSJUR = '+sIdPessJurDestinoTransf+' AND '+
                     ' IDPESSOA = '+sIdPessoaTransf+' AND '+
                     ' IDPLANOPREV = '+sIdPlanoDestino+' AND '+
                     ' SEQPROPOSTA = '+sSeqPropostaTransf+'');
      try
          qryaux.execsql;
      except
      end;
   end;
  inherited;

end;

procedure TfrmCadContribPartTransfPlano.FormActivate(Sender: TObject);
begin

  if not qryGridContrib.Active then Exit;

  lIdPessoa := strtoint(sIdPessoaTransf);
  lIdPessJur := strtoint(sIdPessJurDestinoTransf);
  lIdPlanoPrev := strtoint(sIdPlanoDestino);
  liSeqProposta := strtoint(sSeqPropostaTransf);

  qryContribuicao.Close;
  qryContribuicao.SQL.Clear;
  qryContribuicao.SQL.Add(' SELECT C.*,CP.FLGACEITAOPCAO,CP.NUMOPCOES, '+
                          '        CP.IDREGRAVALIDAOP1,CP.IDREGRAVALIDAOP2, '+
                          '        CP.IDREGRAVALIDAOP3                      '+
                          ' FROM   CONTRIBUICAO C, CONTPREV CP              '+
                          ' WHERE  CP.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                          '        CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                          '        CP.FLGPAGADOR <> ''E'' AND '+                          
                          '        CP.IDCONTRIBUICAO NOT IN '+
                          '        (SELECT CP2.IDCONTRIBUICAO FROM CONTRIBPREVPARTP CP2 '+
                          '         WHERE  CP2.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
                          '                CP2.IDPESSJUR = '+IntToStr(lIdPessJur)+ ' AND '+
                          '                CP2.IDPESSOA = '+IntToStr(lIdPessoa)+') '+
                          ' ORDER BY C.NOME ');
  qryContribuicao.Open;

  qryPortForma.Close;
  qryPortForma.Open;

  qryPeriodicidade.Close;
  qryPeriodicidade.Open;

  EstadoContrib := dsBrowse;
  pnlControlesDet.SendToBack;
  dbGrdDet.BringToFront;

end;

procedure TfrmCadContribPartTransfPlano.FormCreate(Sender: TObject);
begin

 bFlgRetroativo := False;
end;

function  TfrmCadContribPartTransfPlano.ValidaOpcoes : boolean;
var bErroRegra : boolean;
    sOpcao,
    sSQL : string;
begin
   Result := False;

   if edOp1.Visible
   then begin // Validar Opcao1
     sOpcao := OraNumero(edOp1.Text);
     sSQL := ' SELECT '+sOpcao+' AS VALORBASE1 FROM DUAL ';

     if (Trim(qryContribuicao.FieldbyName('IDREGRAVALIDAOP1').AsString) <> '') and
        (not RegraBooleana(qryContribuicao.FieldbyName('IDREGRAVALIDAOP1').AsString,sSQL,bErroRegra))
     then begin // Regra de validacao não satisfeita
        if not bErroRegra
        then MsgDlg(' Opção 1 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 1.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp1.SetFocus;
        Exit;
     end;
   end;

   if edOp2.Visible
   then begin // Validar Opcao2
     sOpcao := OraNumero(edOp2.Text);
     sSQL := ' SELECT '+sOpcao+' AS VALORBASE2 FROM DUAL ';
     if (Trim(qryContribuicao.FieldbyName('IDREGRAVALIDAOP2').AsString) <> '') and
        (not RegraBooleana(qryContribuicao.FieldbyName('IDREGRAVALIDAOP2').AsString,sSQL,bErroRegra))
     then begin // Regra de validacao não satisfeita
        if not bErroRegra
        then MsgDlg(' Opção 2 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 2.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp2.SetFocus;
        Exit;
     end;
   end;

   if edOp3.Visible
   then begin // Validar Opcao3
     sOpcao := OraNumero(edOp3.Text);
     sSQL := ' SELECT '+sOpcao+' AS VALORBASE3 FROM DUAL ';
     if (Trim(qryContribuicao.FieldbyName('IDREGRAVALIDAOP3').AsString) <> '') and
        (not RegraBooleana(qryContribuicao.FieldbyName('IDREGRAVALIDAOP3').AsString,sSQL,bErroRegra))
     then begin // Regra de validacao não satisfeita
        if not bErroRegra
        then MsgDlg(' Opção 3 não satisfaz as condições necessárias.','Informação',mtInformation,[mbOk,mbHelp],0)
        else MsgDlg(' Erro na Execução da Regra de Validação da Opção 3.','Informação',mtInformation,[mbOk,mbHelp],0);
        edOp3.SetFocus;
        Exit;
     end;
   end;

   Result := True;
end; 

function  TfrmCadContribPartTransfPlano.ContribuicaoExiste : boolean;
begin
   Result := True;
   with qryAux do begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP '+
              ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
              '       IDPESSJUR = '+IntToStr(lIdPessJur)+' AND '+
              '       IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND '+
              '       IDCONTRIBUICAO = '+qryContribuicao.FieldbyName('IdContribuicao').AsString);
      Open;
      if not IsEmpty
      then begin
         MsgDlg('Contribuição já cadastrada para este participante.','Erro',mtError,[mbOk,mbHelp],0);
         Close;
         Exit;
      end;
      Close;
   end;
   Result := False;
end;

function TfrmCadContribPartTransfPlano.GravaContribuicao : boolean;
var sSQLValues : string;
    cAuxSeparador : char;

begin
   Result := False;
   qryAux.Close;
   qryAux.SQL.Clear;
   dblkpcmbContribuicao.PerformSearch;
   if EstadoContrib = dsInsert
   then begin
      sSQLValues := '';
      sSQLValues := IntToStr(lIdPessoa);
      sSQLValues := sSQLValues+', '+IntToStr(lIdPessJur);
      sSQLValues := sSQLValues+', '+IntToStr(lIdPlanoPrev);
      sSQLValues := sSQLValues+', '+qryContribuicao.FieldbyName('IdContribuicao').AsString;

      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      sSQLValues := sSQLValues+', NULL';
      if Trim(cmbDiaVencimento.Text) <> ''
      then sSQLValues := sSQLValues+', '+IntToStr(cmbDiaVencimento.itemindex + 1)
      else sSQLValues := sSQLValues+', NULL';

      if chkDescFolha.Checked
      then sSQLValues := sSQLValues + ', 1'
      else sSQLValues := sSQLValues + ', 0';

      if chkCobrarContrib.Checked
      then sSQLValues := sSQLValues + ', 1'
      else sSQLValues := sSQLValues + ', 0';

  {.} cAuxSeparador := DecimalSeparator;
  {.} DecimalSeparator := '.';

      if Trim(edOp1.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp1);

      if Trim(edOp2.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp2);

      if Trim(edOp3.Text) = ''
      then sSQLValues := sSQLValues+', 0'
      else sSQLValues := sSQLValues+', '+ OraNumero(sValOp3);
  {.} DecimalSeparator := cAuxSeparador;

      if Trim(edQtdeParcelas.Text) = ''
      then sSQLValues := sSQLValues+', NULL'
      else sSQLValues := sSQLValues+', '+edQtdeParcelas.Text;

      if bFlgRetroativo or (chkRetroativa.checked)
      then sSQLValues := sSQLValues+', 1'
      else sSQLValues := sSQLValues+', 0';

      sSQLValues := sSQLValues+', 1';

      if Trim(dtedInicio.Text) <> ''
      then sSQLValues := sSQLValues+', TO_DATE('''+Trim(dtedInicio.Text)+''',''dd/mm/yyyy'')'
      else sSQLValues := sSQLValues+', NULL';

      if Trim(dtedFinal.Text) <> ''
      then sSQLValues := sSQLValues+', TO_DATE('''+Trim(dtedFinal.Text)+''',''dd/mm/yyyy'')'
      else sSQLValues := sSQLValues+', NULL';

      if Trim(dblkpcmbPeriodicidade.text) <> ''
      then sSQLValues := sSQLValues + ', '+qryPeriodicidade.FieldByName('IdTpPeriodicidade').AsString
      else sSQLValues := sSQLValues+', NULL';

      qryAux.SQL.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSOA,IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO, '+
                     '             PLANO,PLACONTAC,PLACONTAD,IDEMPRESAPROP,CODCENTROCUSTOC,CODCENTROCUSTOD,UNIDNEGOC, '+
                     '             CODPORTFORMA,DIAVENCIMENTO,FLGDESCFOLHA, FLGCOBRA, VALORBASE1,VALORBASE2,VALORBASE3, '+
                     '             QTDEPARCELAS, FLGRETROATIVO,FLGRECALCULA,DATAINICIO,DATAFINAL,IDTPPERIODICIDADE) '+
                     ' VALUES ('+sSQLValues+')');
   end 
   else begin //alteracao de contribuicao
      sSQLValues := '';
      if Trim(dblkpcmbPortForma.Text) <> ''
      then sSQLValues := ' CODPORTFORMA = '+qryPortForma.FieldByName('CodPortForma').AsString
      else sSQLValues := ' CODPORTFORMA = NULL';

      if Trim(edQtdeParcelas.Text) <> ''
      then sSQLValues := sSQLValues+', QTDEPARCELAS = '+edQtdeParcelas.Text
      else sSQLValues := sSQLValues+', QTDEPARCELAS = NULL ';

      if Trim(dtedInicio.Text) <> ''
      then sSQLValues := sSQLValues+', DATAINICIO = TO_DATE('''+dtedInicio.Text+''',''dd/mm/yyyy'') '
      else sSQLValues := sSQLValues+', DATAINICIO = NULL ';

      if Trim(dtedFinal.Text) <> ''
      then sSQLValues := sSQLValues+', DATAFINAL = TO_DATE('''+dtedFinal.Text+''',''dd/mm/yyyy'') '
      else sSQLValues := sSQLValues+', DATAFINAL = NULL ';


      if Trim(cmbDiaVencimento.Text) <> ''
      then sSQLValues := sSQLValues+', DIAVENCIMENTO = '+IntToStr(cmbDiaVencimento.itemindex + 1)
      else sSQLValues := sSQLValues+', DIAVENCIMENTO = NULL ';

      if chkDescFolha.Checked
      then sSQLValues := sSQLValues + ', FLGDESCFOLHA = 1'
      else sSQLValues := sSQLValues + ', FLGDESCFOLHA = 0';

      if chkCobrarContrib.Checked
      then sSQLValues := sSQLValues + ', FLGCOBRA = 1'
      else sSQLValues := sSQLValues + ', FLGCOBRA = 0';

  {.} cAuxSeparador := DecimalSeparator;
  {.} DecimalSeparator := '.';
      if Trim(edOp1.Text) <> ''
      then sSQLValues := sSQLValues + ', VALORBASE1 = '+ OraNumero(sValOp1)
      else sSQLValues := sSQLValues + ', VALORBASE1 = 0';

      if Trim(edOp2.Text) <> ''
      then sSQLValues := sSQLValues + ', VALORBASE2 = '+ OraNumero(sValOp2)
      else sSQLValues := sSQLValues + ', VALORBASE2 = 0';

      if Trim(edOp3.Text) <> ''
      then sSQLValues := sSQLValues + ', VALORBASE3 = '+ OraNumero(sValOp3)
      else sSQLValues := sSQLValues + ', VALORBASE3 = 0';

      if Trim(dblkpcmbPeriodicidade.text) <> ''
      then sSQLValues := sSQLValues + ', IDTPPERIODICIDADE = '+qryPeriodicidade.FieldByName('IdTpPeriodicidade').AsString
      else sSQLValues := sSQLValues+', IDTPPERIODICIDADE = NULL ';

      qryAux.SQL.Add(' UPDATE CONTRIBPREVPARTP SET '+sSQLValues+
                     ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
                     '       IDPESSJUR = '+IntToStr(lIdPessJur) +' AND '+
                     '       IDPLANOPREV = '+IntToStr(lIdPlanoPrev) + ' AND '+
                     '       IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString);
  {.} DecimalSeparator := cAuxSeparador;
   end;

   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
         MostrarErro(E);
         Exit;
      end;
   end;

   // Se o usuario mandou apagar contribuicoes a nao cobrar -> apagá-las
   if (EstadoContrib = dsEdit) and (bApagarContribuicoes)
   then begin
      // Apagar contribuicoes do juros e correcao
      qryAux.Close;
      qryAux.SQL.Clear;
      
      qryAux.SQL.Add(' DELETE FROM HSTATRASOCONTRIB HA'+
                     ' WHERE HA.NUMRECEBIMENTO IN  '+
                     ' (SELECT HS.NUMRECEBIMENTO '+
                     '  FROM   HSTCONTRIBPREV HS '+
                     '  WHERE  HS.IDPESSJUR =  '+IntToStr(lIdPessJur)+' AND       '+
                     '         HS.IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND    '+
                     '         HS.IDPESSOA = '+IntToStr(lIdPessoa)+' AND          '+
                     '         HS.SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND '+
                     '         HS.IDCONTRIBUICAO   = '+qryGridContrib.FieldByName('IdContribuicao').AsString+' AND '+
                     '         HS.SITRECEBIMENTO  = 0 AND                        '+
                     '         HS.NUMRECEBIMENTO = HA.NUMRECEBIMENTO)           ');
      
      try
         qryAux.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;
      // Apagar contribuicoes do histórico de contribuicoes
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' DELETE FROM HSTCONTRIBPREV '+
                     ' WHERE  IDPESSJUR =  '+IntToStr(lIdPessJur)+' AND       '+
                     '        IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND    '+
                     '        IDPESSOA = '+IntToStr(lIdPessoa)+' AND          '+
                     '        SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND   '+
                     '        IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString+' AND '+
                     '        SITRECEBIMENTO = 0 ');
      try
         qryAux.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;

   end;

   EstadoContrib := dsBrowse;
   Result := True;
end;

procedure TfrmCadContribPartTransfPlano.LimpaPainel;
begin
    dblkpcmbContribuicao.Text := '';
    dblkpcmbPortForma.Text := '';
    cmbDiaVencimento.Text := '';
    edQtdeParcelas.Text := '';
    dtedInicio.Text := DateToStr(date);
    dtedFinal.Text := '';
    grpOpcao.Visible := False;
    grpRecebimento.Visible := False;
    chkDescFolha.Checked := True;
    chkCobrarContrib.Checked := True;
end;

procedure TfrmCadContribPartTransfPlano.PreenchePainel;
var iNumOpcoes : integer;
begin
  dblkpcmbContribuicao.Text := qryGridContrib.FieldByName('Nome').AsString;
  dblkpcmbContribuicao.PerformSearch;
  chkDescFolha.Checked      := (qryGridContrib.FieldByName('flgDescFolha').AsInteger = 1);
  chkCobrarContrib.Checked  := (qryGridContrib.FieldByName('flgCobra').AsInteger = 1);
  grpRecebimento.Visible    := (qryGridContrib.FieldByName('flgDescFolha').AsInteger = 0);
  cmbDiaVencimento.Text     := qryGridContrib.FieldByName('DiaVencimento').AsString;
  edQtdeParcelas.Text       := qryGridContrib.FieldByName('QtdeParcelas').AsString;
  dtedInicio.Text           := qryGridContrib.FieldByName('DataInicio').AsString;
  dtedFinal.Text            := qryGridContrib.FieldByName('DataFinal').AsString;

  if qryGridContrib.FieldByName('flgAceitaOpcao').AsInteger = 1
  then begin
     iNumOpcoes := qryGridContrib.FieldByName('NumOpcoes').AsInteger;
     grpOpcao.Visible := True;
     lblNomeValorBase1.Visible := (iNumOpcoes >= 1);
     edOp1.Visible := (iNumOpcoes >= 1);
     lblNomeValorBase2.Visible := (iNumOpcoes >= 2);
     edOp2.Visible := (iNumOpcoes >= 2);
     lblNomeValorBase3.Visible := (iNumOpcoes >= 3);
     edOp3.Visible := (iNumOpcoes >= 3);
     edOp1.Text := qryGridContrib.FieldByName('ValorBase1').AsString;
     edOp2.Text := qryGridContrib.FieldByName('ValorBase2').AsString;
     edOp3.Text := qryGridContrib.FieldByName('ValorBase3').AsString;
  end
  else begin
    grpOpcao.Visible := False;
  end;

  if qryGridContrib.FieldByName('IdTpPeriodicidade').AsString <> ''
  then begin
     if qryPeriodicidade.Locate('IdTpPeriodicidade',qryGridContrib.FieldByName('IdTpPeriodicidade').AsInteger,[loCaseInsensitive,loPartialKey])
     then dblkpcmbPeriodicidade.Text := qryPeriodicidade.FieldByName('Nome').AsString
     else dblkpcmbPeriodicidade.Text := '';
  end
  else dblkpcmbPeriodicidade.Text := '';

  if qryGridContrib.FieldByName('CodPortForma').AsString <> ''
  then begin
     if qryPortForma.Locate('CodPortForma',qryGridContrib.FieldByName('CodPortForma').AsInteger,[loCaseInsensitive,loPartialKey])
     then dblkpcmbPortForma.Text := qryPortForma.FieldByName('Nome').AsString
     else dblkpcmbPortForma.Text := '';
  end
  else dblkpcmbPortForma.Text := '';

end;


procedure TfrmCadContribPartTransfPlano.sbtnInsDetClick(Sender: TObject);
begin

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnInsDet.Down := False;
     Exit;
  end;
  
  try
     dbGrdDet.SendToBack;
     HabilitaPainel(pnlControlesDet, true);
     LimpaPainel;
     // Habilitar como de contribuicao
     dblkpcmbContribuicao.Enabled := True;
     chkDescFolha.Checked := True;
     chkCobrarContrib.Checked := True;
     EstadoContrib := dsInsert;
  except
     sbtnInsDet.Down := False;
     raise;
  end; 

end;

procedure TfrmCadContribPartTransfPlano.sbtnAltDetClick(Sender: TObject);
begin


  if qryGridContrib.IsEmpty
  then begin
      MsgDlg('Não existem contribuições a alterar. ','Erro',mtError,[mbOk, mbHelp], 0);
      sbtnAltDet.Down := False;
      Exit;
  end;

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnAltDet.Down := False;
     Exit;
  end;

  if (sbtnInsDet.Down = False) and (sbtnAltDet.Down = False)
  then begin
     sbtnAltDet.Down := True;
     Exit;
  end;

  if (sbtnInsDet.Down = True) then exit;

  try
    //  Altera registro na tabela
    dbGrdDet.SendToBack;
    HabilitaPainel(pnlControlesDet,True );

    // Preencher Painel
    PreenchePainel;

    // Desabilitar como de contribuicao
    dblkpcmbContribuicao.Enabled := False;

    EstadoContrib := dsEdit;
  except
      sbtnAltDet.Down := False;
      Raise;
  end; 

  if (sbtnaltDet.Down = False)
  then begin
     sbtnAltDet.Down := True;
     Exit;
  end;

end;

procedure TfrmCadContribPartTransfPlano.sbtnApagDetClick(Sender: TObject);
begin
  
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Desce o botão Procurar
  EstadoContrib := dsBrowse;

  // testa se a tabela está vazia
  if qryGridContrib.IsEmpty
  then begin
      MsgDlg('Não existem contribuições a excluir. ','Erro',mtError,[mbOk, mbHelp], 0);
      Exit;
  end;

  // Testa se a Contribuição não é obrigatória
  if qryGridContrib.FieldByName('FLGOBRIGATORIA').AsString = 'O'
  then begin
      if MsgDlg('Esta Contribuição é obrigatória. Confirma exclusão ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
         begin
              ApagaRegistro;
              exit;
         end
      else
         begin
              sbtnExcluiDet.Down := False;
              Exit;
         end;
  end;

   { Tenta apagar o registro }
   try
      { Pergunta se deseja realmente apagar }
      if MsgDlg('Deseja excluir este registro ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
      then begin
        with qryAux do begin
           Close;
           SQL.Clear;
           SQL.Add(' DELETE FROM CONTRIBPREVPARTP '+
                   ' WHERE IDPESSOA = '+IntToStr(lIdPessoa)+' AND '+
                   '       IDPESSJUR = '+IntToStr(lIdPessJur) +' AND '+
                   '       IDPLANOPREV = '+IntToStr(lIdPlanoPrev) + ' AND '+
                   '       IDCONTRIBUICAO = '+qryGridContrib.FieldByName('IdContribuicao').AsString);
           try
              ExecSQL;
           except
              on E:EDBEngineError do
                 MostrarErro(E);
           end;
        end; 
      end;
   except Raise;
   end; 

   qryGridContrib.Close;
   qryGridContrib.Open;
   dbGrdDet.BringToFront;
   HabilitaPainel(pnlControlesDet,False );
   sbtnInsdet.Down := False;
   sbtnAltdet.Down := False;
   dbgrdDet.ApplySelected;

   { Sobe o botão de Apagar }
   sbtnExcluiDet.Down := False;
end;

procedure TfrmCadContribPartTransfPlano.bbtnOkDetClick(Sender: TObject);
begin
  
 if Trim(edOp1.Text) = '' then edOp1.Text := '0';
  if Trim(edOp2.Text) = '' then edOp2.Text := '0';
  if Trim(edOp3.Text) = '' then edOp3.Text := '0';

  try
     sValOp1 := edOp1.Text;
     sValOp2 := edOp2.Text;
     sValOp3 := edOp3.Text;
  except
      MsgDlg('Valor de Opções inválido.','Erro',mtError,[mbOk,mbHelp],0);
      edOp1.SetFocus;
      Exit;
  end;

  // Testar se Forma de Recebimento e Dia de Vencimento estao preenchidos
  if Trim(dblkpcmbContribuicao.Text) = ''
  then begin
      MsgDlg('Nome da Contribuição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbContribuicao.SetFocus;
      Exit;
  end;

  if not ValidaOpcoes
  then begin
     //Adaptacao para tirar o icone de SQL
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM DUAL');
        Open;
        Close;
     end;
     Exit;
  end;

  if EstadoContrib = dsInsert
  then begin
    if not ContribuicaoExiste
    then begin
       // Gravar contribuicao
       if GravaContribuicao
       then sbtnInsDetClick(Sender)
       else bbtnCancelarDetClick(Sender);
    end
    else bbtnCancelarDetClick(Sender);
  end
  else begin // Estado de Edicao
    GravaContribuicao;
    qryGridContrib.Close;
    qryGridContrib.Open;
    dbGrdDet.BringToFront;
    HabilitaPainel(pnlControlesDet,False );
    sbtnInsdet.Down := False;
    sbtnAltdet.Down := False;
    dbgrdDet.ApplySelected;
  end;
end;

procedure TfrmCadContribPartTransfPlano.bbtnCancelarDetClick(
  Sender: TObject);
begin

 try
      qryGridContrib.Close;
      qryGridContrib.Open;
      dbGrdDet.BringToFront;
      dbgrdDet.ApplySelected;
      HabilitaPainel(pnlControlesDet,False);
      sbtnInsDet.Down := False;
      sbtnAltDet.Down := False;
   except Raise;
   end; 


end;

procedure TfrmCadContribPartTransfPlano.dblkpcmbContribuicaoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var iNumOpcoes : integer;
begin

  if qryContribuicao.FieldByName('flgAceitaOpcao').AsInteger = 1
  then begin
     iNumOpcoes := qryContribuicao.FieldByName('NumOpcoes').AsInteger;
     if iNumOpcoes = 0
     then grpOpcao.Caption := 'Opções de Contribuição [não disponíveis] '
     else grpOpcao.Caption := 'Opções de Contribuição ';
     grpOpcao.Visible := True;
     lblNomeValorBase1.Visible := (iNumOpcoes >= 1);
     edOp1.Visible := (iNumOpcoes >= 1);
     lblNomeValorBase2.Visible := (iNumOpcoes >= 2);
     edOp2.Visible := (iNumOpcoes >= 2);
     lblNomeValorBase3.Visible := (iNumOpcoes >= 3);
     edOp3.Visible := (iNumOpcoes >= 3);
  end
  else begin
    grpOpcao.Visible := False;
  end;
  // Se a Contribuicao for obrigatoria
  if qryContribuicao.FieldByName('FLGOBRIGATORIA').AsString = 'O'
  then chkCobrarContrib.Enabled := False
  else chkCobrarContrib.Enabled := True;

  // Preencher periodicidade padrao
  if EstadoContrib = dsInsert
  then begin
     edQtdeParcelas.Text := qryContribuicao.FieldbyName('QtdeParcelas').AsString;
     if qryContribuicao.FieldByName('IdTpPeriodicidade').AsString = ''
     then Exit;
     if qryPeriodicidade.Locate('IdTpPeriodicidade',qryContribuicao.FieldByName('IdTpPeriodicidade').AsInteger,[loCaseInsensitive,loPartialKey])
     then dblkpcmbPeriodicidade.Text := qryPeriodicidade.FieldByName('Nome').AsString
     else dblkpcmbPeriodicidade.Text := '';
     try
        dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                        edQtdeParcelas.Text,
                                        qryPeriodicidade.FieldByName('QtdeMeses').AsString);
     except
     end;
  end;

end;

procedure TfrmCadContribPartTransfPlano.dblkpcmbContribuicaoExit(
  Sender: TObject);
var iNumOpcoes : integer;
begin

  if (Trim(dblkpcmbContribuicao.Text) <> '') and
     (qryContribuicao.FieldByName('flgAceitaOpcao').AsInteger = 1)
  then begin
     iNumOpcoes := qryContribuicao.FieldByName('NumOpcoes').AsInteger;
  end;

end;

procedure TfrmCadContribPartTransfPlano.chkDescFolhaClick(Sender: TObject);
begin

  grpRecebimento.Visible := not chkDescFolha.Checked;

end;

procedure TfrmCadContribPartTransfPlano.qryGridContribCalcFields(
  DataSet: TDataSet);
begin

  with qryGridContrib do
  begin
     if FieldbyName('flgPagador').AsString = 'C'
     then FieldByName('calcPagador').AsString := 'Contribuinte'
     else if FieldByName('flgPagador').AsString = 'P'
          then FieldByName('calcPagador').AsString := 'Patrocinadora'
          else FieldByName('calcPagador').AsString := 'Exclusiva da Patrocinadora';
  end;

end;

procedure TfrmCadContribPartTransfPlano.qryGridContribAfterScroll(
  DataSet: TDataSet);
var ssql : String;
begin

  bApagarContribuicoes := False;
  if (qryGridContrib.State in [dsInactive]) or (qryGridContrib.IsEmpty) then
      Exit;

  sSQL := ' SELECT FLGOBRIGATORIA FROM CONTRIBUICAO ' +
          ' WHERE IDCONTRIBUICAO = ' + qryGridContrib.FieldByName('IDCONTRIBUICAO').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  qryAux.Open;

 {Se a Contribuicao for obrigatoria}
  if qryAux.FieldByName('FLGOBRIGATORIA').AsString = 'O' then
     chkCobrarContrib.Enabled := False
  else
     chkCobrarContrib.Enabled := True;

end;

procedure TfrmCadContribPartTransfPlano.qryContribuicaoAfterScroll(
  DataSet: TDataSet);
begin

  if (EstadoContrib = dsInsert)
  then edQtdeParcelas.Text := qryContribuicao.FieldbyName('QtdeParcelas').AsString;

end;

procedure TfrmCadContribPartTransfPlano.chkCobrarContribClick(
  Sender: TObject);
begin

  dblkpcmbContribuicao.PerformSearch;
  if (not chkCobrarContrib.Checked) and (not bApagarContribuicoes)
  then begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT NUMRECEBIMENTO '+
                   ' FROM  HSTCONTRIBPREV '+
                   ' WHERE IDPESSJUR =  '+IntToStr(lIdPessJur)+' AND       '+
                   '       IDPLANOPREV = '+IntToStr(lIdPlanoPrev)+' AND    '+
                   '       IDPESSOA = '+IntToStr(lIdPessoa)+' AND          '+
                   '       IDCONTRIBUICAO   = '+qryGridContrib.FieldbyName('IdContribuicao').AsString+' AND '+
                   '       SEQPROPOSTA = '+IntToStr(liSeqProposta)+' AND '+
                   '       SITRECEBIMENTO  = 0  ');
    qryAux.Open;
    if not qryAux.IsEmpty
    then if MsgDlg('Esta contribuição já foi preparada para a cobrança. Deseja não cobrá-la ? ','Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes  // PROVISORIO
         then
            bApagarContribuicoes    := True
         else  bApagarContribuicoes := False;
    qryAux.Close;
  end;

end;

procedure TfrmCadContribPartTransfPlano.edQtdeParcelasExit(
  Sender: TObject);
begin

  try
     dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                     edQtdeParcelas.Text,
                                     qryPeriodicidade.FieldByName('QtdeMeses').AsString);
  except
  end;

end;

procedure TfrmCadContribPartTransfPlano.dblkpcmbPeriodicidadeCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin

  try
     dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                     edQtdeParcelas.Text,
                                     qryPeriodicidade.FieldByName('QtdeMeses').AsString);
  except
  end;

end;

procedure TfrmCadContribPartTransfPlano.dtedInicioExit(Sender: TObject);
begin

  try
     dtedFinal.Text := CalcDataFinal(StrToDate(dtedInicio.Text),
                                     edQtdeParcelas.Text,
                                     qryPeriodicidade.FieldByName('QtdeMeses').AsString);
  except
  end;

end;

end.
