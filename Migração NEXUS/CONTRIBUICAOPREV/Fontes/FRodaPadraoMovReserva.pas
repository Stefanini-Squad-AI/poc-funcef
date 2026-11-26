// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)   :  Jéssica Lana Nunes dos Santos
// Data       :  05/03/2009
// Pendência  : SOL 109421 KINTANA 496332
// Descricao  :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Rotina      : GravaFlag
// Autor(a)    : Gleyber
// Data        : 01/08/2006
// Pendência   : 22501
// Descricao   : Acerto na query de update
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
// Rotina    : Confecção da tela
// Autor(a)  : Gleyber
// Data      : 06/01/2004 
// Pendência : 15091
// Descrição : Confecção desta tela para atender a pendência.
// -----------------------------------------------------------------------------
unit FRodaPadraoMovReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, MontaSelect, Gauges, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, StdCtrls, CheckLst, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, TB97Ctls,
  UCtrlLancamento;

type
  TFrmRodaPadraoMovReserva = class(TfrmOkCancelar)
    Panel1: TPanel;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    StaticText3: TStaticText;
    pnlOpcoes: TPanel;
    pgctrlReserva: TPageControl;
    tbsPrincipal: TTabSheet;
    lbPatro: TLabel;
    Label7: TLabel;
    chklstPatro: TCheckListBox;
    chklstPlano: TCheckListBox;
    tbshtpart: TTabSheet;
    lblParticip: TLabel;
    lblPatro: TLabel;
    Label3: TLabel;
    lblMatricula: TLabel;
    bbtnProcurar: TBitBtn;
    edNome: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    edMatricula: TEdit;
    btndesfazselec: TBitBtn;
    StaticText2: TStaticText;
    bbtnVerResultado: TBitBtn;
    IvExtendedTranslator1: TIvExtendedTranslator;
    pnlProgresso: TPanel;
    lblMatPatro: TLabel;
    lblPlanoBenef: TLabel;
    Label1: TLabel;
    lblcontador: TLabel;
    btncancelaprogress: TBitBtn;
    MontaSelectPart: TMontaSelect;
    SaveDlg: TSaveDialog;
    qryAux: TwwQuery;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    chklstBenef: TCheckListBox;
    Label4: TLabel;
    qryBenef: TwwQuery;
    qry: TwwQuery;
    Panel2: TPanel;
    StaticText1: TStaticText;
    bbtnProcessar: TBitBtn;
    bbtnDesfazer: TBitBtn;
    pBar: TProgressBar;

    procedure FormShow(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure btndesfazselecClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure btncancelaprogressClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }

    CtrlLancamento : TCtrlLancamento;
    bcancelaenvio,
    bCalculouAlguem : Boolean;

    ordem,
    idlote,
    contador : integer;

    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
    procedure GravaFlag(psTipoFlag : String);


  public  { Public declarations }


  end;




var
  FrmRodaPadraoMovReserva: TFrmRodaPadraoMovReserva;




implementation
{$R *.DFM}
uses 
  UDataBase, UMensErro, UAdmPrev, DBaseDados, UMovReserva,  USistema,
  UFuncoesUteis, fAguarde, UModulo, DAPrev,  UIntegraBack;




procedure TFrmRodaPadraoMovReserva.CriaLista(chkListX: TCheckListBox;
  qryLista: TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('NOME').AsString);
        Next;
     end;
  end;
end;

procedure TFrmRodaPadraoMovReserva.GravaFlag(psTipoFlag : String);
begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add ('UPDATE BENEFBFCIARIO ');
   qryAux.SQL.Add ('SET FLGMOVEURESERVA = '+psTipoFlag);
   qryAux.SQL.Add ('WHERE IDPLANOPREV     = '+qry.FieldByName('IDPLANOPREV').AsString);  
   qryAux.SQL.Add ('  AND IDPESSJUR      = '+qry.FieldByName('IDPESSJUR').AsString);
   qryAux.SQL.Add ('  AND IDTITULAR      = '+qry.FieldByName('IDTITULAR').AsString);
   qryAux.SQL.Add ('  AND NUMEROPROCESSO = '+qry.FieldByName('NUMEROPROCESSO').AsString);
   qryAux.SQL.Add ('  AND IDBENEFICIO    = '+qry.FieldByName('IDBENEFICIO').AsString);
   qryAux.SQL.Add ('  AND IDPESSOA       = '+qry.FieldByName('IDPESSOA').AsString);
   qryAux.SQL.Add ('  AND SEQPROPOSTA    = '+qry.FieldByName('SEQPROPOSTA').AsString);

   qryAux.ExecSQL;
end;

procedure TFrmRodaPadraoMovReserva.FormShow(Sender: TObject);
begin
  inherited;
  pgctrlReserva.ActivePage := tbsPrincipal;

  // Preencher chkList da Patrocinadora
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;
  CriaLista(chkLstPatro, qryPatro);

  // Preenche ChkList dos Planos
  qryPlano.Close;
  qryPlano.Sql.Clear;
  qryPlano.Sql.Add(' SELECT * FROM PLANPREV '+
                   ' WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO PLP, PATRO P '+
                   '                       WHERE   P.IDFUNDACAO = '+IntToStr(iIdFundacao)          +
                   '                       AND     PLP.IDPESSJUR = P.IDPESSOA )                   '+
                   ' ORDER  BY NOME                                                               ');
  qryPlano.Open;
  CriaLista(chklstPlano, qryPlano);

  // Preenche ChkList dos Benefícios
  qryBenef.Close;
  qryBenef.Sql.Clear;
  qryBenef.Sql.Add(' SELECT DISTINCT BF.IDBENEFICIO, BF.NOME '+
                   ' FROM BENEFPLANPREV BP, BENEFICIO BF '+
                   ' WHERE BP.IDBENEFICIO = BF.IDBENEFICIO ');
  qryBenef.Open;
  CriaLista(chklstBenef, qryBenef);

  // Configurar painéis
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;

  bbtnVerResultado.visible := False;
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
end;

procedure TFrmRodaPadraoMovReserva.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;
end;

procedure TFrmRodaPadraoMovReserva.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     edNome.Text      := MontaSelectPart.ValoresChave[1];
     edMatricula.Text := MontaSelectPart.ValoresChave[4];
     edPatro.Text     := MontaSelectPart.ValoresChave[3];
     edPlano.Text     := MontaSelectPart.ValoresChave[11];
  end;
end;

procedure TFrmRodaPadraoMovReserva.btndesfazselecClick(Sender: TObject);
begin
  inherited;
  edNome.Text      := '';
  edMatricula.Text := '';
  edPatro.Text     := '';
  edPlano.Text     := '';
end;

procedure TFrmRodaPadraoMovReserva.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  If savedlg.Execute
   Then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TFrmRodaPadraoMovReserva.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.visible := True;
end;

procedure TFrmRodaPadraoMovReserva.bbtnProcessarClick(Sender: TObject);
var
  sSQL,
  sSQLFim,
  sIdsPatros,
  sIdsPlanos,
  sIdsBenefs,
  sMsgErro       : String;

  iContaPatro,
  iContaPlano,
  iContaBenef    : Integer;
begin
  inherited;
  pBar.Max            := 0;
  Contador            := 0;
  bCalculouAlguem     := false;
  pnlFundo.enabled    := False;
  bCancelaenvio       := False;


  pnlProgresso.Update;
  Application.ProcessMessages;
  FrmRodaPadraoMovReserva.update;

  if bCancelaenvio
  then begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     exit;
  end;

  // Pega os IDs das patrocinadoras selecionadas
  sIdsPatros := '';
  For iContaPatro := 0 To chklstPatro.Items.Count - 1 do
   If chklstPatro.checked[iContaPatro]
    Then If qryPatro.Locate('NOME',chklstPatro.Items[iContaPatro],[loCaseInsensitive, loPartialKey])
          Then sIdsPatros := sIdsPatros+qryPatro.FieldByName('IDPESSOA').AsString + ', ';
  If Trim(sIdsPatros) <> ''
   Then sIdsPatros := Copy(sIdsPatros, 1, (Length(sIdsPatros)-2));

  // Pega os IDs dos planos selecionados
  sIdsPlanos := '';
  For iContaPlano := 0 To chklstPlano.Items.Count - 1 do
   If chklstPlano.Checked[iContaPlano]
    Then If qryPlano.Locate('NOME',chklstPlano.Items[iContaPlano],[loCaseInsensitive, loPartialKey])
          Then sIdsPlanos := sIdsPlanos+qryPlano.FieldByName('IDPLANOPREV').AsString + ', ';
  If Trim(sIdsPlanos) <> ''
   Then sIdsPlanos := Copy(sIdsPlanos, 1, (Length(sIdsPlanos)-2));

  // Pega os IDs dos benefícios selecionados
  sIdsBenefs := '';
  For iContaBenef := 0 To chklstBenef.Items.Count - 1 do
   If chklstBenef.Checked[iContaBenef]
    Then If qryBenef.Locate('NOME',chklstBenef.Items[iContaBenef],[loCaseInsensitive, loPartialKey])
          Then sIdsBenefs := sIdsBenefs+qryBenef.FieldByName('IDBENEFICIO').AsString + ', ';
  If Trim(sIdsBenefs) <> ''
   Then sIdsBenefs := Copy(sIdsBenefs, 1, (Length(sIdsBenefs)-2));

  // Monta o complemento da query de acordo com as opções escolhidas
  sSqlFim := '';
  // Escolheu apenas um participante
  If Trim(edNome.Text) <> ''
   Then sSQLFim := '   AND ( BF.IDTITULAR         = '+MontaSelectPart.ValoresChave[0]+' ) '
  // Escolheu através das seleções
   Else Begin
      If Trim(sIdsPatros) <> ''
       Then sSQLFim := '   AND ( BF.IDPESSJUR IN ('+sIdsPatros+') ) ';

      If Trim(sIdsPlanos) <> ''
       Then sSQLFim := sSQLFim + '   AND ( BF.IDPLANOORIGEM IN ('+sIdsPlanos+') ) ';

      If Trim(sIdsBenefs) <> ''
       Then sSQLFim := sSQLFim + '   AND ( BF.IDBENEFICIO IN ('+sIdsBenefs+') ) ';
   End;

  If sSQLFim = ''
   Then If MsgDlg('Nenhuma opção de seleção escolhida.'+#13#10+
                  'Deseja continuar com o PROCESSAR assim mesmo ?','Confirmação',
                  mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrno
         Then Exit;

  memResult.Font.Color := clWindowText;
  memResult.Lines.Clear;
  memResult.Lines.Add('Processamento de Movimentação Padrão de Reservas / '+lbPatro.Caption+' - Data : '+DateToStr(date)+'    LISTA DE EXCEÇÕES ');
  memResult.Lines.Add('');
  memResult.Lines.Add('-------------------------------------------------------------------------------------------------------------------');

  pnlProgresso.Visible := True;
  pnlProgresso.BringToFront;
  pBar.Position := 0;

  If Not GravaLogTOTALPREV ('Processamento de Movimentação Padrão de Reservas - '+DateToStr(date))
  Then Begin
     memResult.Lines.Add(' Erro na Gravação do Log.');
     If dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.RollBack;
     pnlOpcoes.SendToBack;
     pnlResult.BringToFront;
     MsgDlg('Operação Interrompida com Erros.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  If Not dtmBaseDados.dbBaseDados.InTransaction
   Then dtmBaseDados.dbBaseDados.StartTransaction;

  // Monta a query que pegará os benefícios que não tenham realizado
  // a movimentação padrão de reservas
  sSQL := ' SELECT EL.MATRICULA, BF.IDPESSJUR, BF.IDPLANOORIGEM, '+
          '        BF.IDTITULAR, BF.SEQPROPOSTA, PB.IDEVENTOGERADOR, '+
          '        EG.FLGINTERNO, CI.DATAPAGAMENTO, BF.DATAFINAL, ' +
          '        BF.IDPLANOPREV, BF.IDPESSOA, BF.IDBENEFICIO, BF.NUMEROPROCESSO, '+
          '        PT.NOME AS NOMEPATRO, PP.NOME AS NOMEPLANO, BE.NOME AS NOMEBENEFICIO '+
          ' FROM PESSOA PT, ELEGPATRO EL, BENEFBFCIARIO BF, BENEFPLANPREV BP, '+
          '      PROCESSOBENEF PB, EVENTOGERADOR EG, MOVBENEF MB, CTRLINTERFACE  CI, ' +
          '      BENEFICIO BE, PLANPREV PP  ' +
          ' WHERE ( EL.IDPESSOA          = BF.IDTITULAR ) '+
          '   AND ( EL.IDPESSJUR         = BF.IDPESSJUR ) '+
          // Filtro para pegar apenas benefícios que não tenham movimentado reservas
          '   AND ( BF.FLGMOVEURESERVA   = 0 ) ' +
          '   AND ( BP.IDBENEFICIO       = BF.IDBENEFICIO )  ' +
          // Filtro para pegar apenas benefícios parametrizados para rodar movimentação após a concessão
          '   AND ( BP.FLGMOVRESAPOSCONC = 1 ) ' +
          '   AND ( BF.NUMEROPROCESSO    = PB.NUMEROPROCESSO ) ' +
          '   AND ( PB.IDEVENTOGERADOR   = EG.IDEVENTOGERADOR ) ' +
          '   AND ( BF.NUMEROPROCESSO    = MB.NUMEROPROCESSO ) ' +
          '   AND ( BF.IDTITULAR         = MB.IDTITULAR ) ' +
          '   AND ( BF.IDPESSOA          = MB.IDPESSOA ) '+
          '   AND ( BF.IDBENEFICIO       = MB.IDBENEFICIO ) '+
          // Filtro para pegar apenas concessão
          '   AND ( MB.TIPOMOV           = 7 ) '+
          '   AND ( MB.IDLOTEMOV         = CI.IDLOTE ) '+
          '   AND ( PT.IDPESSOA          = BF.IDPESSJUR ) '+
          '   AND ( PP.IDPLANOPREV       = BF.IDPLANOPREV ) '+
          '   AND ( BE.IDBENEFICIO       = BF.IDBENEFICIO ) '+
          // Coloca o complemento de acordo com as opções escolhidas
          sSQLFim +
          ' ORDER BY EL.MATRICULA ' ;

   qry.SQL.Clear;
   qry.SQL.Add(sSQL);
   qry.Open;

   if bCancelaenvio
   then begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;

   pBar.Max      := qry.RecordCount;

   While Not qry.Eof do
    Begin
      If Not RodaPadraoMovReserva(qry.FieldByName('IDPESSJUR').AsInteger,
                                  qry.FieldByName('IDPLANOORIGEM').AsInteger,
                                  qry.FieldByName('IDTITULAR').AsInteger,
                                  qry.FieldByName('SEQPROPOSTA').AsInteger,
                                  -1,
                                  qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                                  -1,
                                  qry.FieldByName('IDPLANOORIGEM').AsInteger,
                                  qry.FieldbyName('FLGINTERNO').AsString,
                                  qry.FieldbyName('DATAPAGAMENTO').AsString,
                                  sMsgErro,
                                  qry.FieldbyName('NUMEROPROCESSO').AsInteger,
                                  'C',
                                  qry.FieldbyName('DATAFINAL').AsString )
      Then Begin // Erro
         memResult.Lines.Add('');
         memResult.Lines.Add('Matrícula: '+qry.FieldByName('MATRICULA').AsString+'. Erro reportado: '+sMsgErro+'.');
         memResult.Lines.Add('');
      End
      Else Begin // Ok
        GravaFLag('1');  // Moveu a reserva
      End;

    If bCancelaenvio
     Then Begin
        memResult.Lines.Add('***********************************');
        memResult.Lines.Add('Processo interrompido pelo usuário.');
        memResult.Lines.Add('***********************************');
        If dtmBaseDados.dbBaseDados.InTransaction
         Then dtmBaseDados.dbBaseDados.RollBack;
        pnlOpcoes.SendToBack;
        pnlResult.BringToFront;
        MsgDlg('Operação Interrompida Pelo Usuário.','Aviso',mtError,[mbOk, mbHelp],0);
        Exit;
     End;

    // Informações para usuário (pnlProgresso)
    pBar.Position         := pBar.Position + 1;
    lblMatPatro.Caption   := 'Matrícula: '+qry.FieldByName('MATRICULA').AsString+'   '+
                             'Patro: '+qry.FieldByName('NOMEPATRO').AsString;
    lblPlanoBenef.Caption := 'Plano: '+qry.FieldByName('NOMEPLANO').AsString+'   '+
                             'Benefício: '+qry.FieldByName('NOMEBENEFICIO').AsString;
    lblcontador.Caption   := FormatFloat('00000000',qry.Recno);
    pnlProgresso.Update;
    Application.ProcessMessages;
    FrmRodaPadraoMovReserva.update;

    qry.Next;

    End; // While Not qry.Eof do

   // Gravando log de operações
   Try
    If Not Sistema.GravaLogOperacoes(Self.Caption)
     Then Raise exception.Create('Erro ao gravar Log.')
   Except
   End;

   // Fazendo o commit final
   If dtmBaseDados.dbBaseDados.InTransaction
    Then dtmBaseDados.dbBaseDados.Commit;

   memResult.Lines.Add('Operação realizada com sucesso');
   pnlProgresso.Visible := False;
   pnlfundo.enabled:=true;
   pnlProgresso.Sendtoback ;

   pnlOpcoes.SendToBack;
   pnlResult.BringToFront;
end;

procedure TFrmRodaPadraoMovReserva.bbtnDesfazerClick(Sender: TObject);
var
  sSQL,
  sSQLFim,
  sIdsPatros,
  sIdsPlanos,
  sIdsBenefs,
  sPlanilha,
  sMsgErro       : String;

  iContaPatro,
  iContaPlano,
  iContaBenef    : Integer;
begin
  inherited;
  pBar.Max            := 0;
  Contador            := 0;
  bCalculouAlguem     := false;
  pnlFundo.enabled    := False;
  bCancelaenvio       := False;


  pnlProgresso.Update;
  Application.ProcessMessages;
  FrmRodaPadraoMovReserva.update;

  if bCancelaenvio
  then begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     exit;
  end;

  // Pega os IDs das patrocinadoras selecionadas
  sIdsPatros := '';
  For iContaPatro := 0 To chklstPatro.Items.Count - 1 do
   If chklstPatro.checked[iContaPatro]
    Then If qryPatro.Locate('NOME',chklstPatro.Items[iContaPatro],[loCaseInsensitive, loPartialKey])
          Then sIdsPatros := sIdsPatros+qryPatro.FieldByName('IDPESSOA').AsString + ', ';
  If Trim(sIdsPatros) <> ''
   Then sIdsPatros := Copy(sIdsPatros, 1, (Length(sIdsPatros)-2));

  // Pega os IDs dos planos selecionados
  sIdsPlanos := '';
  For iContaPlano := 0 To chklstPlano.Items.Count - 1 do
   If chklstPlano.Checked[iContaPlano]
    Then If qryPlano.Locate('NOME',chklstPlano.Items[iContaPlano],[loCaseInsensitive, loPartialKey])
          Then sIdsPlanos := sIdsPlanos+qryPlano.FieldByName('IDPLANOPREV').AsString + ', ';
  If Trim(sIdsPlanos) <> ''
   Then sIdsPlanos := Copy(sIdsPlanos, 1, (Length(sIdsPlanos)-2));

  // Pega os IDs dos benefícios selecionados
  sIdsBenefs := '';
  For iContaBenef := 0 To chklstBenef.Items.Count - 1 do
   If chklstBenef.Checked[iContaBenef]
    Then If qryBenef.Locate('NOME',chklstBenef.Items[iContaBenef],[loCaseInsensitive, loPartialKey])
          Then sIdsBenefs := sIdsBenefs+qryBenef.FieldByName('IDBENEFICIO').AsString + ', ';
  If Trim(sIdsBenefs) <> ''
   Then sIdsBenefs := Copy(sIdsBenefs, 1, (Length(sIdsBenefs)-2));

  // Monta o complemento da query de acordo com as opções escolhidas
  sSqlFim := '';
  // Escolheu apenas um participante
  If Trim(edNome.Text) <> ''
   Then sSQLFim := '   AND ( BF.IDTITULAR         = '+MontaSelectPart.ValoresChave[0]+' ) '
  // Escolheu através das seleções
   Else Begin
      If Trim(sIdsPatros) <> ''
       Then sSQLFim := '   AND ( BF.IDPESSJUR IN ('+sIdsPatros+') ) ';

      If Trim(sIdsPlanos) <> ''
       Then sSQLFim := sSQLFim + '   AND ( BF.IDPLANOORIGEM IN ('+sIdsPlanos+') ) ';

      If Trim(sIdsBenefs) <> ''
       Then sSQLFim := sSQLFim + '   AND ( BF.IDBENEFICIO IN ('+sIdsBenefs+') ) ';
   End;

  If sSQLFim = ''
   Then If MsgDlg('Nenhuma opção de seleção escolhida.'+#13#10+
                  'Deseja continuar com o DESFAZER assim mesmo ?','Confirmação',
                  mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrno
         Then Exit;

  memResult.Font.Color := clWindowText;
  memResult.Lines.Clear;
  memResult.Lines.Add('Desfazer Movimentação Padrão de Reservas / '+lbPatro.Caption+' - Data : '+DateToStr(date)+'    LISTA DE EXCEÇÕES ');
  memResult.Lines.Add('');
  memResult.Lines.Add('-------------------------------------------------------------------------------------------------------------------');

  pnlProgresso.Visible := True;
  pnlProgresso.BringToFront;
  pBar.Position := 0;

  If Not GravaLogTOTALPREV ('Desfazer Movimentação Padrão de Reservas - '+DateToStr(date))
  Then Begin
     memResult.Lines.Add(' Erro na Gravação do Log.');
     If dtmBaseDados.dbBaseDados.InTransaction
      Then dtmBaseDados.dbBaseDados.RollBack;
     pnlOpcoes.SendToBack;
     pnlResult.BringToFront;
     MsgDlg('Operação Interrompida com Erros.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;

  If Not dtmBaseDados.dbBaseDados.InTransaction
   Then dtmBaseDados.dbBaseDados.StartTransaction;

  // Monta a query que pegará os benefícios que já tenham realizado
  // a movimentação padrão de reservas
  sSQL := ' SELECT EL.MATRICULA, BF.IDPESSJUR, BF.IDPLANOORIGEM, '+
          '        BF.IDTITULAR, BF.SEQPROPOSTA, PB.IDEVENTOGERADOR, '+
          '        EG.FLGINTERNO, CI.DATAPAGAMENTO, BF.DATAFINAL, BF.NUMEROPROCESSO, ' +
          '        BF.IDPLANOPREV, BF.IDPESSOA, BF.IDBENEFICIO, BF.DATACONCESSAO, '+
          '        PT.NOME AS NOMEPATRO, PP.NOME AS NOMEPLANO, BE.NOME AS NOMEBENEFICIO '+
          ' FROM PESSOA PT, ELEGPATRO EL, BENEFBFCIARIO BF, BENEFPLANPREV BP, '+
          '      PROCESSOBENEF PB, EVENTOGERADOR EG, MOVBENEF MB, CTRLINTERFACE  CI, ' +
          '      BENEFICIO BE, PLANPREV PP  ' +
          ' WHERE ( EL.IDPESSOA          = BF.IDTITULAR ) '+
          '   AND ( EL.IDPESSJUR         = BF.IDPESSJUR ) '+
          // Filtro para pegar apenas benefícios que já tenham movimentado reservas
          '   AND ( BF.FLGMOVEURESERVA   = 1 ) ' +
          '   AND ( BP.IDBENEFICIO       = BF.IDBENEFICIO )  ' +
          // Filtro para pegar apenas benefícios parametrizados para rodar movimentação após a concessão
          '   AND ( BP.FLGMOVRESAPOSCONC = 1 ) ' +
          '   AND ( BF.NUMEROPROCESSO    = PB.NUMEROPROCESSO ) ' +
          '   AND ( PB.IDEVENTOGERADOR   = EG.IDEVENTOGERADOR ) ' +
          '   AND ( BF.NUMEROPROCESSO    = MB.NUMEROPROCESSO ) ' +
          '   AND ( BF.IDTITULAR         = MB.IDTITULAR ) ' +
          '   AND ( BF.IDPESSOA          = MB.IDPESSOA ) '+
          '   AND ( BF.IDBENEFICIO       = MB.IDBENEFICIO ) '+
          // Filtro para pegar apenas concessão
          '   AND ( MB.TIPOMOV           = 7 ) '+
          '   AND ( MB.IDLOTEMOV         = CI.IDLOTE ) '+
          '   AND ( PT.IDPESSOA          = BF.IDPESSJUR ) '+
          '   AND ( PP.IDPLANOPREV       = BF.IDPLANOPREV ) '+
          '   AND ( BE.IDBENEFICIO       = BF.IDBENEFICIO ) '+
          // Coloca o complemento de acordo com as opções escolhidas
          sSQLFim +
          //
          ' ORDER BY EL.MATRICULA ' ;

   qry.SQL.Clear;
   qry.SQL.Add(sSQL);
   qry.Open;

   if bCancelaenvio
   then begin
      memResult.Lines.Add('***********************************');
      memResult.Lines.Add('Processo interrompido pelo usuário.');
      memResult.Lines.Add('***********************************');
      exit;
   end;

   pBar.Max         := qry.RecordCount;
   sPlanilha        := '';

   While Not qry.Eof do
    Begin

      If Not DesfazPadraoMovReserva(qry.FieldByName('IDPESSJUR').AsInteger,
                                    qry.FieldByName('IDPLANOORIGEM').AsInteger,
                                    qry.FieldByName('IDTITULAR').AsInteger,
                                    qry.FieldByName('SEQPROPOSTA').AsInteger,
                                    qry.FieldByName('IDBENEFICIO').AsInteger,
                                    qry.FieldByName('IDEVENTOGERADOR').AsInteger,
                                    qry.FieldByName('DATACONCESSAO').AsString,
                                    qry.FieldByName('NUMEROPROCESSO').AsInteger,
                                    sPlanilha)
      Then Begin // Erro
         memResult.Lines.Add('');
         memResult.Lines.Add('Matrícula: '+qry.FieldByName('MATRICULA').AsString+'. Erro reportado: '+sMsgErro+'.');
         memResult.Lines.Add('');
      End
      Else Begin // Ok
        GravaFLag('0'); // Desfez a movimentação
        // Exclui a planilha contábil
        Try
          if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                   StrToInt(sPlanilha),                    // iPlnCodigo
                                                   Sistema.IdModulo,                       // iModuloOrigem
                                                   0,                                      // iNumLan
                                                   Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                   True                                    // bExcluiPlanilha
                                                  )
          then begin
              memResult.Lines.Add('***********************************');
              memResult.Lines.Add('Erro ao excluir a planilha contábil.');
              memResult.Lines.Add('***********************************');
              If dtmBaseDados.dbBaseDados.InTransaction
               Then dtmBaseDados.dbBaseDados.RollBack;
              pnlOpcoes.SendToBack;
              pnlResult.BringToFront;
              MsgDlg('Erro ao excluir a planilha contábil.','Erro',mtError,[mbOk, mbHelp],0);
              Exit;
          end;

        Except
          memResult.Lines.Add('***********************************');
          memResult.Lines.Add('Erro ao excluir a planilha contábil.');
          memResult.Lines.Add('***********************************');
          If dtmBaseDados.dbBaseDados.InTransaction
           Then dtmBaseDados.dbBaseDados.RollBack;
          pnlOpcoes.SendToBack;
          pnlResult.BringToFront;
          MsgDlg('Erro ao excluir a planilha contábil.','Erro',mtError,[mbOk, mbHelp],0);
          Exit;
        End;

      End;

    If bCancelaenvio
     Then Begin
        memResult.Lines.Add('***********************************');
        memResult.Lines.Add('Processo interrompido pelo usuário.');
        memResult.Lines.Add('***********************************');
        If dtmBaseDados.dbBaseDados.InTransaction
         Then dtmBaseDados.dbBaseDados.RollBack;
        pnlOpcoes.SendToBack;
        pnlResult.BringToFront;
        MsgDlg('Operação Interrompida Pelo Usuário.','Aviso',mtError,[mbOk, mbHelp],0);
        Exit;
     End;

    pBar.Position         := pBar.Position + 1;
    lblMatPatro.Caption   := 'Matrícula: '+qry.FieldByName('MATRICULA').AsString+'   '+
                             'Patro: '+qry.FieldByName('NOMEPATRO').AsString;
    lblPlanoBenef.Caption := 'Plano: '+qry.FieldByName('NOMEPLANO').AsString+'   '+
                             'Benefício: '+qry.FieldByName('NOMEBENEFICIO').AsString;
    lblcontador.Caption   := FormatFloat('00000000',qry.Recno);
    pnlProgresso.Update;
    Application.ProcessMessages;
    FrmRodaPadraoMovReserva.update;

    qry.Next;

    End; // While Not qry.Eof do

   // Gravando log de operações
   Try
    If Not Sistema.GravaLogOperacoes(Self.Caption)
     Then Raise exception.Create('Erro ao gravar Log.')
   Except
   End;

   // Fazendo o commit final
   If dtmBaseDados.dbBaseDados.InTransaction
    Then dtmBaseDados.dbBaseDados.Commit;

   memResult.Lines.Add('Operação realizada com sucesso');
   pnlProgresso.Visible := False;
   pnlfundo.enabled:=true;
   pnlProgresso.Sendtoback ;

   pnlOpcoes.SendToBack;
   pnlResult.BringToFront;
end;

procedure TFrmRodaPadraoMovReserva.btncancelaprogressClick(Sender: TObject);
begin
  pnlfundo.enabled:=True;
  pnlprogresso.visible:=False;
  bcancelaenvio := True;

  If dtmBaseDados.dbBaseDados.InTransaction
   Then dtmBaseDados.dbBaseDados.RollBack;

 Application.ProcessMessages;
 FrmRodaPadraoMovReserva.update;
end;



procedure TFrmRodaPadraoMovReserva.FormCreate(Sender: TObject);
begin
  inherited;
   try
   //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
   SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)'+\';

      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;
end;



procedure TFrmRodaPadraoMovReserva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil( CtrlLancamento );  
  inherited;
end;



end.