unit FAtualizaPorIndice;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)   :  Jéssica Lana Nunes dos Santos
// Data       :  05/03/2009
// Pendência  : SOL 109421 KINTANA 496332
// Descricao  :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 28/06/2007
// Rotina      : sbtnListaPessoasClick, MontaStringMatriculas, FormShow,
//               bbtnEnviarClick, bbtnDesfazerClick
// Pendencia   : 25700
// Alteração   : Inclusão da rotina de atualizar reservas por lista de arquivos.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/06/2007
// Rotina      : FormShow, OpcoesOK, bbtnDesfazerClick
// Pendencia   : 24778
// Alteração   : Inclusão de seleção por reserva e situação do participante
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 04/10/2006
// Rotina      : UltAlimentacao
// Pendencia   : 23395
// Alteração   : Exibe a data da ultima atualização quando for o desfazer individual
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 18/09/2006
// Rotina      : Processar
// Pendencia   : 23298
// Alteração   : Opção para tratamento de uma regra na atualização por indice
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 01/09/2006
// Rotina      : Processar
// Pendencia   : 20412
// Alteração   : Tratando erro quando o  sequence estiver desatualizado
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 09/08/2006
// Rotina      : Desfazer
// Pendencia   : 22938
// Alteração   : Tratar atualização de reservas vinculadas a plano cancelado.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/06/2006
// Rotina      : Desfazer
// Pendencia   : 21858
// Alteração   : Não desfazer registros com Eventogerador preenchido
//------------------------------------------------------------------------------
// Autor(a)    : Bruno Bastos
// Data        : 30/11/2005
// Rotina      : bbtnDesfazerClick
// Pendencia   : 20356
// Alteração   : Filtar na query que busca os registros a ser desfeito, entre a
//               data inicial e a data final, não somente pela data final como
//               estava sendo feita.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/09/2005
// Rotina      : bbtnEnviarClick
// Pendencia   : 20225
// Alteração   : Atualizar VLRREAL e VLRCOTAS
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/04/2005
// Rotina      : bbtnEnviarClick
// Pendencia   : 19075
// Alteração   : Impede a atualização de reservas para participantes falecidos.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 12/01/2005
// Pendencia   : 18270
// Alteração   : Acerto na atualização das data de ultima atualziação (DATAULTATUALIZA)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 15.09.2004
// Rotina      : ----
// Pendencia   : 17685
// Alteração   : Opção de não pedir a data de alimentacao e usar como esta
//               a data de recebimento de contribuicoes
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 19.09.2003
// Pendencia   : 14980
// Alteração   : Alimentar só a partir da inscricao do participantes
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 22.07.2003
// Pendencia   : 14611
// Alteração   : Não estava alimentando se a opcao fosse individual
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 23.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Grids,
  Wwdbigrd, Wwdbgrid, CheckLst, ComCtrls, Db, DBTables, Wwquery,
  MontaSelect, Gauges, Wwdatsrc, wwdblook;

type
  TfrmAtualizaPorIndice = class(TfrmOkCancelar)
    Panel2: TPanel;
    StaticText1: TStaticText;
    GroupBox1: TGroupBox;
    bbtnEnviar: TBitBtn;
    bbtnDesfazer: TBitBtn;
    MontaSelectPart: TMontaSelect;
    SaveDlg: TSaveDialog;
    pnlProgresso: TPanel;
    LblPlano: TLabel;
    pBar: TGauge;
    LblReserva: TLabel;
    Label1: TLabel;
    lblcontador: TLabel;
    btncancelaprogress: TBitBtn;
    pnlOpcoes: TPanel;
    pgctrlReserva: TPageControl;
    tbsPrincipal: TTabSheet;
    lbPatro: TLabel;
    Label7: TLabel;
    chklstPatro: TCheckListBox;
    chklstPlano: TCheckListBox;
    tbshtpart: TTabSheet;
    lblParticip: TLabel;
    StaticText2: TStaticText;
    bbtnVerResultado: TBitBtn;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    StaticText3: TStaticText;
    qryReservaxPlano: TwwQuery;
    qryReservasACalcular: TwwQuery;
    qryIndices: TwwQuery;
    qryAux: TwwQuery;
    dtpAtualizaAte: TCMDateTimePicker;
    rgrpTipoAtualiza: TRadioGroup;
    Label2: TLabel;
    chkResult: TCheckBox;
    dtInicioAtualiza: TCMDateTimePicker;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryPlanoParticip: TwwQuery;
    wwDataSource1: TwwDataSource;
    Label4: TLabel;
    chklstReserva: TCheckListBox;
    Label5: TLabel;
    chklstSitPart: TCheckListBox;
    Label6: TLabel;
    qryReserva: TwwQuery;
    qrySitPart: TwwQuery;
    rgrTipo: TRadioGroup;
    pnlSelecaoIndividual: TPanel;
    pnlListaArquivo: TPanel;
    grpInfo: TGroupBox;
    lbInfo: TLabel;
    edMatricula: TEdit;
    edPatro: TEdit;
    edNome: TEdit;
    lblMatricula: TLabel;
    dblkpPlanoParticip: TwwDBLookupCombo;
    Label3: TLabel;
    lblPatro: TLabel;
    edPlano: TEdit;
    Label8: TLabel;
    bbtnProcurar: TBitBtn;
    btndesfazselec: TBitBtn;
    edtListaPessoas: TEdit;
    lblListaPessoas: TLabel;
    sbtnListaPessoas: TSpeedButton;
    OpenDlg: TOpenDialog;

    procedure FormShow(Sender: TObject);
    procedure bbtnEnviarClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure btndesfazselecClick(Sender: TObject);
    procedure rgrpTipoAtualizaClick(Sender: TObject);
    procedure dblkpPlanoParticipChange(Sender: TObject);
    procedure rgrTipoClick(Sender: TObject);
    procedure sbtnListaPessoasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private // Private declarations

    bcancelaenvio : Boolean;
    sDescOperacao    : string;
    gUsaCRespon,
    gCodCentroRespon,
    gUsaAbc:string;
    gUnidNegoc,
    gMoedaCorrente:Integer;

    bFlgIntContab,
    bErro,
    bErros,
    bGravou: boolean;

    strPatro, strPlano,
    sMatriculas,
    strReserva,
    strSitPart : string;  

    F, X       : TextFile; 


    iIdHistorico : longint;

    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);

    function  OpcoesOK(pbAlimenta : Boolean) : boolean;

    Function InsereMovimentoReserva( pdValorAtualizado, pdValorAcumulado : Double;
                                     psDataInidice : String;
                                     pdValorIndice : Double ): Boolean;

    Function UltAlimentacao(sIdPessjur, sIdPessoa, sIdPlanoPrev:String):String; 

    Function MontaStringMatriculas : String;


  public  // Public declarations

    bCalculouAlguem : boolean;
    ordem, idlote, contador : integer;


  end;



var
  frmAtualizaPorIndice: TfrmAtualizaPorIndice;



implementation
{$R *.DFM}
uses
  UDataBase, UMensErro, UAdmPrev, DBaseDados, UMovReserva,  USistema,
  UFuncoesUteis,  fAguarde, UModulo, DAPrev;




procedure TfrmAtualizaPorIndice.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
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

function TfrmAtualizaPorIndice.OpcoesOK(pbAlimenta : Boolean) : boolean;
var
   i : integer;
begin
  Result := False;

 {Preencher string com Id's das patrocinadoras selecionadas}
  strPatro := '';
  for i := 0 to chklstPatro.Items.Count - 1 do
  begin
      if chklstPatro.checked[i]
      then begin
         if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey])
         then strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
      end;
  end;

  If Trim(strPatro) <> '' Then
    strPatro := Copy(strPatro, 1, Length(strPatro) - 2)
  Else
  Begin
    MsgDlg('Preencha pelo menos uma patrocinadora para esta operação. ','Erro',mtError,[mbOk],0);
    chklstPatro.SetFocus;
    Exit;
  End;


 {Preencher string com Id's dos planos selecionados}
  strPlano := '';
  for i := 0 to chklstPlano.Items.Count - 1 do
  begin
     if chklstPlano.checked[i]
     then begin
        if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive, loPartialKey])
        then strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
     end;
  end;

  If Trim(strPlano) <> '' Then
    strPlano := Copy(strPlano, 1, Length(strPlano) - 2)
  Else
  Begin
    MsgDlg('Preencha pelo menos um plano previdenciário para esta operação. ','Erro',mtError,[mbOk],0);
    chklstPlano.SetFocus;
    Exit;
  End;

 {Preencher string com Id's das reservas selecionadas}
  strReserva := '';
  For i := 0 to chklstReserva.Items.Count - 1 Do
  Begin
    If chklstReserva.checked[i] Then
     Begin
       If qryReserva.Locate('NOME',chklstReserva.Items[i],[loCaseInsensitive, loPartialKey]) Then
         strReserva := strReserva + qryReserva.FieldByName('IDTIPORESERVA').AsString+ ', ';
     End;
  End;

  If Trim(strReserva) <> '' Then
    strReserva := Copy(strReserva, 1, Length(strReserva) - 2)
  Else
  Begin
    MsgDlg('Preencha pelo menos uma reserva para esta operação. ','Erro',mtError,[mbOk],0);
    chklstReserva.SetFocus;
    Exit;
  End;

 {Preencher string com Id's das situações selecionadas}
  strSitPart := '';
  If pbAlimenta Then
  Begin
    For i := 0 to chklstSitPart.Items.Count - 1 Do
    Begin
      If chklstSitPart.checked[i] Then
       Begin
         If qrySitPart.Locate('NOME',chklstSitPart.Items[i],[loCaseInsensitive, loPartialKey]) Then
           strSitPart := strSitPart + qrySitPart.FieldByName('IDSITPART').AsString+ ', ';
       End;
    End;

    If Trim(strSitPart) <> '' Then
      strSitPart := Copy(strSitPart, 1, Length(strSitPart) - 2);
  End
  Else
    MsgDlg('Para operação de DESFAZER a situação do participante não é considerada. ','Atençao',mtInformation,[mbOk],0);

 {Verifica se o arquivo foi selecionado}
  If rgrpTipoAtualiza.ItemIndex = 1 Then
    If Trim(edtListaPessoas.Text) = '' Then
    Begin
      MsgDlg('Indique o Arquivo com a Lista.','Erro',mtError,[mbOk],0);
      Exit;
    End;

  Result := True;
end; //opcoesOK

procedure TfrmAtualizaPorIndice.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  pgctrlReserva.ActivePage := tbsPrincipal;

  dtpAtualizaAte.Date := Now;

  rgrTipo.ItemIndex := 0;
  pnlSelecaoIndividual.BringToFront;

  // Preencher chkList da Patrocinadora
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
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

  // Preenche ChkList dos Planos
  qryReserva.Open;
  CriaLista(chklstReserva, qryReserva);

  // Preenche ChkList dos Planos
  qrySitPart.Open;
  CriaLista(chklstSitPart, qrySitPart);

  // Configurar painéis
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;

  //pnlProgresso.Visible := False;
  bbtnVerResultado.visible := False;
  chkResult.Checked := True;

  bbtnConfirmar.Visible := False;
  bbtnCancelar.Visible  := False;
end;

procedure TfrmAtualizaPorIndice.bbtnEnviarClick(Sender: TObject);
var
  sSQLReservaPlano,
  sSQL,mes,ano : string;
  i,j,cont     : integer;

  dValorAtualizado : Extended;
  strPlanoLog      : string;
  sMaiorDataIndice : string;
  sAnoMesMorte     : string;
  sAnoMesParar     : string;
  sAnoMesCancel    : string;
  dValorAcumulado  : double;
  iIdPessoaAtual   : longint;

  dtDataInicio : TDate;

  sDataCancelamento, 
  sIdRegraAtualiza, sResultadoRegra,
  sDataInicio,      sAnoMesInicio,   sAnoMesAtual, sAnoMesFinal : String;

  iIdCalculo : Integer;

  dValorAtualizar : Double;

begin

  inherited;

  Contador            := 0;
  Cont                := 0;
  sMatriculas         := '';

  lblContador.Caption := inttostr(contador);

  bCalculouAlguem     := False;
  pnlFundo.enabled    := False;
  bCancelaenvio       := False;
  bErros              := False;     

  pnlProgresso.Update;
  Application.ProcessMessages;
  frmAtualizaPorIndice.update;

  if bCancelaenvio then begin
     memResult.Lines.Add('***********************************');
     memResult.Lines.Add('Processo interrompido pelo usuário.');
     memResult.Lines.Add('***********************************');
     exit;
  end;

  if Trim(dtpAtualizaAte.Text) = '' then begin
     MsgDlg('Data de Atualização não foi preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
     dtpAtualizaAte.SetFocus;
     Exit;
  end;

  // Testar se existem dados na tabelas com as opcoes preenchidas
  // Se OpcoesOK retornar True, a qryReservasACalcular estará preenchida com os registros a calcular
  // Senao, a qryReservasACalcular estará fechada

  If (rgrTipo.ItemIndex < 1) And (not OpcoesOK(True)) Then
    Exit
  Else
    If Trim(edtListaPessoas.Text) <> '' Then
      sMatriculas := MontaStringMatriculas;

  if chkResult.Checked then begin
    memResult.Font.Color := clWindowText;
    memResult.Lines.Clear;
    memResult.Lines.Add('Atualização de Contas de Reserva por Índice / '+lbPatro.Caption+' - Data : '+DateToStr(date)+'    LISTA DE EXCEÇÕES ');
    memResult.Lines.Add('');
    memResult.Lines.Add('Atualizar até  '+Trim(dtpAtualizaAte.Text));
    memResult.Lines.Add('-------------------------------------------------------------------------------------------------------------------');
  end;

  pnlProgresso.Visible := True;
  pnlProgresso.BringToFront;
  pBar.progress := 0;

  IdLote := LeUltRegistro (nil,'CTRLINTERFACE');

  if Trim(edNome.Text) <> '' then begin
     strPlano      := qryPlanoParticip.FieldByName('IDPLANOPREV').AsString;  
     strPatro      := MontaSelectPart.ValoresChave[1];
     sDescOperacao := 'Atualização de Reserva por Índice até '+dtpAtualizaAte.Text+ '[Matrícula : '+edMatricula.Text+']';
  end
  else sDescOperacao := 'Atualização de Reserva por Índice até '+dtpAtualizaAte.Text+ '[Patros.: '+strPatro+'-Planos:'+strPlano+']';

  if not GravaLogTOTALPREV (sDescOperacao)
  then begin
     memResult.Lines.Add(' Erro na Gravação do Log.');
     if chkResult.checked
     then begin
        pnlOpcoes.SendToBack;
        pnlResult.BringToFront;
     end;
     MsgDlg('Operação Interrompida com Erros.','Erro',mtError,[mbOk, mbHelp],0);
     Exit;
  end;


  { Verifica para todos os planos selecionados quais as suas respectivas reservas }

  { Alterado para poder escolher se deseja processar todos os meses anteriores    }
  { em aberto ou não, melhorando a performance do processo.                       }
  qryReservaxPlano.close;

  sSQLReservaPlano := ' SELECT DISTINCT      RP.IDPLANOPREV,     RP.CODHIERARQUIA,        ' +
                      '  RP.IDTIPORESERVA,   RP.NOME ,           RP.FLGCONTROLE,          ' +
                      '  RP.INDICECORRECAO,  RP.FLGCOLETIVA,     RP.IDREGRAPAGTORESE,     ' +

                      '  PL.IDPLANOPREV,     PL.NOME NOMEPLANO,  PL.FLGRESERVAULTCOT      ' +

                      ' FROM                                                              ' +
                      '  PLANPREV PL,    RESERVAXPLANO RP                                 ' +
                      ' WHERE (RP.ANALITICOSINTETI = ''A'')                               ' +
                      '  AND (RP.FLGMODATUALIZACAO = 1 )                                  ' ;

  If Trim(strReserva) <> '' Then
    sSQLReservaPlano := sSQLReservaPlano +
                      '  AND (RP.IDTIPORESERVA     IN ('+strReserva+') )                  ' ; 

  sSQLReservaPlano := sSQLReservaPlano +
                      '  AND (RP.IDPLANOPREV       IN ('+strPlano+') )                    ' +
                      '  AND (PL.IDPLANOPREV       = RP.IDPLANOPREV)                      ' +
                      '  AND (RP.IDTIPORESERVA NOT IN (                    ' +
                      '                                SELECT IDTIPORESERVA       ' +
                      '                                FROM RESERVAXCONTRIB                    ' +
                      '                                WHERE IDPLANOPREV   IN ('+strPlano+')   ' ;

  If Trim(strReserva) <> '' Then
    sSQLReservaPlano := sSQLReservaPlano +
                      '                                  AND IDTIPORESERVA IN ('+strReserva+') ' ; 

  sSQLReservaPlano := sSQLReservaPlano +
                      '                               ))                                       ' +
                      ' ORDER BY RP.IDPLANOPREV, RP.CODHIERARQUIA                         ' ;

  qryReservaxPlano.SQL.Clear;
  qryReservaxPlano.SQL.Add(sSQLReservaPlano);
  qryReservaxPlano.Open;

  if qryReservaxPlano.IsEmpty then Begin
    pnlfundo.enabled     := True;
    pnlProgresso.Visible := False;
    pnlProgresso.Sendtoback ;
    MsgDlg('Não foram encontrados registros para processar.', 'Erro',
           mtError,[mbOk, mbHelp],0);
    Exit;
  End;

  lblPlano.caption   := 'Plano: '+qryReservaxPlano.FieldByName('NOMEPLANO').AsString;

  pnlProgresso.Update;
  Application.ProcessMessages;
  frmAtualizaPorIndice.update;

  if bCancelaenvio then begin
       memResult.Lines.Add('***********************************');
       memResult.Lines.Add('Processo interrompido pelo usuário.');
       memResult.Lines.Add('***********************************');
       exit;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  sMaiorDataIndice := '';

  qryReservaxPlano.First;
  while not qryReservaxPlano.Eof do begin

     lblReserva.Caption := 'Reserva : '+qryReservaxPlano.FieldByName('Nome').AsString;

     with qryReservasACalcular do begin

        Close;
        SQL.Clear;
        SQL.Add(' SELECT EL.MATRICULA, R.IDPESSJUR, R.IDPLANOPREV, R.IDPESSOA, R.SEQPROPOSTA, R.IDTIPORESERVA, '+
                '        R.VALORRESERVA, RP.FLGCOLETIVA, R.DATAULTATUALIZA                                     '+
                ' FROM   PESSOAFISICA PF, ELEGPATRO EL, RESERVAPART R, RESERVAXPLANO RP, PARTPREVPLAN PP       '+ 
                ' WHERE  R.IDPESSJUR     IN ('+strPatro+')'+
                ' AND    R.IDPLANOPREV   = '+qryReservaxPlano.FieldbyName('IDPLANOPREV').AsString+
                ' AND    R.IDTIPORESERVA = '+qryReservaxPlano.FieldbyName('IDTIPORESERVA').AsString);

        if Trim(edNome.Text) <> ''
        then SQL.Add(' AND R.IDPESSOA = '+MontaSelectPart.ValoresChave[0]);

        If Trim(sMatriculas) <> '' Then
          SQL.Add(' AND EL.MATRICULA IN ('+sMatriculas+')');

        if Trim(strSitPart) <> ''
        then SQL.Add(' AND PP.IDSITPART IN ('+strSitPart+')');

        SQL.Add(' AND    RP.IDPLANOPREV = R.IDPLANOPREV     '+
                ' AND    RP.IDTIPORESERVA = R.IDTIPORESERVA '+
                ' AND    EL.IDPESSJUR     = R.IDPESSJUR     '+
                ' AND    EL.IDPESSOA      = R.IDPESSOA      '+
                ' AND    EL.IDPESSOA      = PF.IDPESSOA     '+
                ' AND    PP.IDPESSOA      = EL.IDPESSOA     '+
                ' AND    PP.IDPESSJUR     = EL.IDPESSJUR    '+
                ' AND    PP.IDPLANOPREV   = R.IDPLANOPREV   '+ 
                ' AND    PF.DATAMORTE IS NULL               '+
                ' ORDER BY R.IDPESSOA                       ');
        Open;

     end; { with qryReservasACalcular do begin }

     {-----------------------------------------------------------------------}
     while not qryReservasACalcular.Eof do begin

        {-----------------------------------------------------------------------------}
        { Caso mesmo sendo atualizada por indice tenha uma Regra de Calculo associada }
        { executar a regra e atualizar a reserva.                                     }
        sIdRegraAtualiza := QryReservaXPlano.FieldByName('IDREGRAPAGTORESE').AsString;
        If ( Trim( sIdRegraAtualiza ) <> '' ) Then Begin

          If ( rgrpTipoAtualiza.ItemIndex = 0 ) Then Begin

            If QryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsString <> ''
            then dtDataInicio := qryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsDateTime
            else dtDataInicio := StrToDate('01/01/1901');

          End Else Begin

            If ( QryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsString <> '' ) And
               ( StrToDate( dtInicioAtualiza.Text ) < QryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsDateTime )
            then dtDataInicio := QryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsDateTime
            else dtDataInicio := StrToDate( dtInicioAtualiza.Text );

          End;

          sAnoMesInicio := FormatDateTime( 'YYYY/MM', dtDataInicio );
          sAnoMesAtual  := sAnoMesInicio;

          sAnoMesFinal  := FormatDateTime( 'YYYY/MM', dtpAtualizaAte.Date );

          { Busca dados do associado }
          sSQL := 'SELECT '+
                  '  P.IDPESSOA,       P.NOME,              '+
                  '  EL.MATRICULA,     EL.IDSITFUNC,        '+
                  '  PP.IDSITPART,     PP.IDSITPLANOPREV,   '+
                  '  PP.INSCRICAODATA, PP.DATACANCELAMENTO, '+
                  '  PF.DATAMORTE,     PF.SEXO, '+

                  QuotedStr( sAnoMesInicio ) + ' AS ANOMESINICIO, '+
                  QuotedStr( sAnoMesAtual )  + ' AS ANOMESATUAL,  '+
                  QuotedStr( sAnoMesAtual )  + ' AS ANOMESREF,    '+
                  QuotedStr( sAnoMesFinal )  + ' AS ANOMESFINAL   '+

                  'FROM   '+
                  '  PARTPREVPLAN PP, ELEGPATRO EL, PESSOA P, PESSOAFISICA PF '+
                  'WHERE  '+
                  '     PP.IDPESSJUR   = '+ QryReservasACalcular.FieldbyName('IDPESSJUR').AsString   +
                  ' AND PP.IDPLANOPREV = '+ QryReservasACalcular.FieldbyName('IDPLANOPREV').AsString +
                  ' AND PP.IDPESSOA    = '+ QryReservasACalcular.FieldbyName('IDPESSOA').AsString    +
                  ' AND PP.SEQPROPOSTA = '+ QryReservasACalcular.FieldbyName('SEQPROPOSTA').AsString +
                  ' AND PP.IDPESSOA    = PF.IDPESSOA    '+
                  ' AND   PP.IDPESSOA  = P.IDPESSOA   '+

                  ' AND   PP.IDPESSJUR = EL.IDPESSJUR '+
                  ' AND   PP.IDPESSOA  = EL.IDPESSOA  ';

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.Open;

          sDataCancelamento := QryAux.FieldByName('DATACANCELAMENTO').AsString;

          sAnoMesCancel := '';
          If ( QryAux.FieldByName('DATACANCELAMENTO').AsString <> '' ) Then Begin
            sAnoMesCancel := FormatDateTime( 'YYYY/MM', QryAux.FieldByName('DATACANCELAMENTO').AsDateTime );
            sAnoMesCancel := SAnoMesAnterior( sAnoMesCancel );
          End;

          sAnoMesMorte := '';
          If ( QryAux.FieldByName('DATAMORTE').AsString <> '' ) Then Begin
            sAnoMesMorte := FormatDateTime( 'YYYY/MM', QryAux.FieldByName('DATAMORTE').AsDateTime );
            sAnoMesMorte := SAnoMesAnterior( sAnoMesMorte );
          End;

          While ( sAnoMesAtual <= sAnoMesFinal ) Do Begin

            { Testes de elegibilidade }

            { Data de cancelamento }
            If ( sAnoMesCancel <> '' ) Then Begin
              If ( sAnoMesAtual > sAnoMesCancel ) Then Begin
                sAnoMesAtual := ProximoAnoMes( StrToInt( Copy( sAnoMesAtual, 6,2 ) ),
                                               StrToInt( Copy( sAnoMesAtual, 1,4 ) ) );
                Continue;
              End;
            End;

            { Data de falecimento }
            If ( sAnoMesMorte <> '' ) Then Begin
              If ( sAnoMesAtual > sAnoMesMorte ) Then Begin
                sAnoMesAtual := ProximoAnoMes( StrToInt( Copy( sAnoMesAtual, 6,2 ) ),
                                               StrToInt( Copy( sAnoMesAtual, 1,4 ) ) );
                Continue;
              End;
            End;

            sResultadoRegra := RegraNumerica( sIdRegraAtualiza, sSQL, bErro, iIdCalculo );

            InsereMovimentoReserva( dValorAtualizado, dValorAcumulado, '', 1 );

            sAnoMesAtual := ProximoAnoMes( StrToInt( Copy( sAnoMesAtual, 6,2 ) ),
                                           StrToInt( Copy( sAnoMesAtual, 1,4 ) ) );

          End; { While ( sAnoMesAtual <= sAnoMesFinal ) Do Begin }

          { Fazer o commit por reservaxpessoa }
          if dtmBaseDados.dbBaseDados.InTransaction then begin
            If bErro Then
            Begin
              dtmBaseDados.dbBaseDados.Rollback;
              dtmBaseDados.dbBaseDados.StartTransaction;
              memResult.Lines.Add('Ocorreu erro durante a execução da regra, o registro foi desfeito');
              bErros := True;
              bErro  := False;
              Continue;
            End
            Else
            Begin
              dtmBaseDados.dbBaseDados.Commit;
              dtmBaseDados.dbBaseDados.StartTransaction;
            End
          end;

          QryReservasACalcular.Next;

          Continue;

        End; { If ( Trim( sIdRegraAtualiza ) <> '' ) Then Begin }

        {-----------------------------------------------------------------------------}


        // Para cada reserva abrir tabela com todos os indices da data posterior
        // a data da ultima atualizacao até a data limite indicada na tela

        qryIndices.Close;
        qryIndices.ParamByName('MOECODIGO').AsInteger := qryReservaxPlano.FieldbyName('INDICECORRECAO').AsInteger;

        if rgrpTipoAtualiza.ItemIndex = 0 then begin
           if qryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsString <> ''
           then qryIndices.ParamByName('ULTIMADATA').AsDateTime := qryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsDateTime
           else qryIndices.ParamByName('ULTIMADATA').AsDateTime := StrToDate('01/01/1901');
        end else begin
           if (qryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsString <> '') and
              (StrToDate(dtInicioAtualiza.Text) < qryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsDateTime )
           then qryIndices.ParamByName('ULTIMADATA').AsDateTime := qryReservasACalcular.FieldbyName('DATAULTATUALIZA').AsDateTime
           else qryIndices.ParamByName('ULTIMADATA').AsDateTime := StrToDate(dtInicioAtualiza.Text);
        end;

        qryIndices.ParamByName('DATALIMITE').AsDateTime := StrToDate(dtpAtualizaAte.Text);
        qryIndices.Open;

        if qryIndices.IsEmpty then begin
           memResult.Lines.Add('');
           memResult.Lines.Add('Matrícula : '+qryReservasACalcular.FieldByName('MATRICULA').AsString+' : '+
                               'índice no período de '+qryIndices.ParamByName('ULTIMADATA').AsString+' a '+qryIndices.ParamByName('DATALIMITE').AsString+' não encontrado');
        end;

        dValorAtualizado  := qryReservasACalcular.FieldbyName('VALORRESERVA').AsFloat;
        dValorAcumulado   := dValorAtualizado;

        While not qryIndices.Eof do begin

           // Se a reserva não for coletiva, verificar se o participante já era inscrito nessa data
           if qryReservasACalcular.FieldByName('FLGCOLETIVA').AsInteger = 0 then begin

              sSQL := ' SELECT PP.INSCRICAODATA, PP.DATACANCELAMENTO '+
                      ' FROM   PARTPREVPLAN PP  '+
                      ' WHERE  PP.IDPESSJUR   = '+qryReservasACalcular.FieldbyName('IDPESSJUR').AsString+
                      ' AND    PP.IDPLANOPREV = '+qryReservasACalcular.FieldbyName('IDPLANOPREV').AsString+
                      ' AND    PP.IDPESSOA    = '+qryReservasACalcular.FieldbyName('IDPESSOA').AsString+
                      ' AND    PP.SEQPROPOSTA = '+qryReservasACalcular.FieldbyName('SEQPROPOSTA').AsString+
                      ' AND    PP.INSCRICAODATA <= TO_DATE('''+qryIndices.FieldbyName('COTDATA').AsString+''',''DD/MM/YYYY'') ';

              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(sSQL);
              qryAux.Open;

              // Participante não era inscrito nesta data
              if qryAux.IsEmpty then begin
                 qryIndices.Next;
                 continue;
              end;

              if (qryAux.FieldByName('DATACANCELAMENTO').AsString <> '') then begin
                 sAnoMesCancel := Copy(qryAux.FieldByName('DATACANCELAMENTO').AsString,7,4)+'/'+Copy(qryAux.FieldByName('DATACANCELAMENTO').AsString,4,2);
                 sAnoMesParar  := SAnoMesAnterior(sAnoMesCancel);

                 // Participante cancelado na data
                 if Copy(qryIndices.FieldbyName('COTDATA').AsString,7,4)+'/'+
                         Copy(qryIndices.FieldbyName('COTDATA').AsString,4,2) > sAnoMesParar
                 then begin

                    qryIndices.Next;
                    continue;

                 end;
              end;

              sSQL := ' SELECT PF.DATAMORTE'+
                      ' FROM   PESSOAFISICA PF  '+
                      ' WHERE  PF.IDPESSOA    = '+qryReservasACalcular.FieldbyName('IDPESSOA').AsString ;
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(sSQL);
              qryAux.Open;

              // Participante falecido na data
              if (qryAux.FieldByName('DATAMORTE').AsString <> '') then begin
                 sAnoMesMorte := Copy(qryAux.FieldByName('DATAMORTE').AsString,7,4)+'/'+Copy(qryAux.FieldByName('DATAMORTE').AsString,4,2);
                 sAnoMesParar := SAnoMesAnterior(sAnoMesMorte);
                 if Copy(qryIndices.FieldbyName('COTDATA').AsString,7,4)+'/'+
                    Copy(qryIndices.FieldbyName('COTDATA').AsString,4,2) > sAnoMesParar
                 then begin
                    qryIndices.Next;
                    continue;
                 end;
              end;
           end;

           dValorAtualizado := dValorAtualizado *
                               qryIndices.FieldByName('COTVALOR').AsFloat;

           InsereMovimentoReserva( dValorAtualizado, dValorAcumulado,
                                   qryIndices.FieldByName('COTDATA').AsString,
                                   qryIndices.FieldByName('COTVALOR').AsFloat );

           sMaiorDataIndice := qryIndices.FieldByName('COTDATA').AsString;

           dValorAcumulado   := dValorAtualizado;

           qryIndices.Next;

        End; { while not qryIndices.Eof do begin }


        If Trim(sMaiorDataIndice) <> '' Then Begin

          // Atualizar campo DATAULTATUALIZA da RESERVA
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' UPDATE RESERVAPART SET DATAULTATUALIZA = TO_DATE('''+sMaiorDataIndice+''',''DD/MM/YYYY'') '+
                         ' WHERE  IDPESSJUR    = '+qryReservasACalcular.FieldbyName('IDPESSJUR').AsString+
                         ' AND    IDPLANOPREV  = '+qryReservasACalcular.FieldbyName('IDPLANOPREV').AsString+
                         ' AND    IDPESSOA     = '+qryReservasACalcular.FieldbyName('IDPESSOA').AsString+
                         ' AND    IDTIPORESERVA = '+qryReservasACalcular.FieldbyName('IDTIPORESERVA').AsString);
          try
             qryAux.ExecSQL;
          except
             bErro := True;
             memResult.Lines.Add(' Erro ao atualizar data da atualização na tabela de reservas.');
          end;

        End;

        // Fazer o commit por reservaxpessoa
        if dtmBaseDados.dbBaseDados.InTransaction then begin
           If bErro Then
           Begin
             dtmBaseDados.dbBaseDados.Rollback;
             dtmBaseDados.dbBaseDados.StartTransaction;
             memResult.Lines.Add('Ocorreu erro ao atualizar data da atualização na tabela de reservas, o registro foi desfeito');
             bErro  := False;
             bErros := True;
             Continue;
           End
           Else
           Begin
             dtmBaseDados.dbBaseDados.Commit;
             dtmBaseDados.dbBaseDados.StartTransaction;
           End
        end;

        qryReservasACalcular.Next;

     end;
     {-----------------------------------------------------------------------}


     qryReservaxPlano.Next;

     If bErro Then
     Begin
       dtmBaseDados.dbBaseDados.Rollback;
       dtmBaseDados.dbBaseDados.StartTransaction;
       memResult.Lines.Add('Ocorreu erro durante a operação, o registro foi desfeito');
       bErro  := False;
       bErros := True;
       Continue;
     End
     Else
     Begin
       dtmBaseDados.dbBaseDados.Commit;
       dtmBaseDados.dbBaseDados.StartTransaction;
     End
  end;

  // Adicionando Log Padrao
  Try
    If Not Sistema.GravaLogOperacoes(Self.Caption)
    Then raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  // Fazer o commit por patroxplano
  if dtmBaseDados.dbBaseDados.InTransaction
  then if bErros then begin
         dtmBaseDados.dbBaseDados.Rollback;
         memResult.Lines.Add('Ocorreram erros durante a atualização das reservas. Alguns registros podem ter sido desfeitos.');
       end else begin
         dtmBaseDados.dbBaseDados.Commit;
         memResult.Lines.Add('Operação realizada com sucesso');
       end;

  pbar.Progress := pbar.MaxValue;
  pnlProgresso.Visible := False;
  pnlfundo.enabled:=true;
  pnlProgresso.Sendtoback ;

  if chkResult.checked then begin
     pnlOpcoes.SendToBack;
     pnlResult.BringToFront;
  end;

  TiraQuery(qryAux);

end;

procedure TfrmAtualizaPorIndice.bbtnDesfazerClick(Sender: TObject);
var
    sAnoMesReferencia,
    sSQL, sMsgErro     : string;
    i                  : integer;
    iIdPessoaAtual,
    iIdReservaAtual,
    iIdPessJurAtual,
    iIdPlanoPrevAtual  : longint;
    dTotalReserva      : double;
    bDesfaz13          : Boolean;
    dSaldo             : double;
    sDataIndice        : string;
begin
  inherited;

  If (rgrTipo.ItemIndex < 1) And (not OpcoesOK(False)) Then
    Exit
  Else
    If Trim(edtListaPessoas.Text) <> '' Then
      sMatriculas := MontaStringMatriculas;

  if Trim(edNome.Text) <> ''
  then begin
     strPlano      := qryPlanoParticip.FieldByName('IDPLANOPREV').AsString;  
     strPatro      := MontaSelectPart.ValoresChave[1];
     sDescOperacao := 'Desfazer Atualização de Reserva até '+dtpAtualizaAte.Text+ '[Matrícula : '+edMatricula.Text+']';
  end
  else sDescOperacao := 'Desfazer Atualização de Reserva até '+dtpAtualizaAte.Text+ '[Patros.: '+strPatro+'-Planos:'+strPlano+']';

  if MsgDlg('Todas as atualizações feitas no dia '+dtpAtualizaAte.Text+ #13+
            'para as patrocinadoras, planos ou participante selecionados '+#13+
            'serão desfeitas. '+#13+
            'Deseja continuar ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo
  then Exit;

  // ***** Filtrar do Historico de Movimento de Reserva todas as reservas com as
  //       condições da tela
  sSQL := ' SELECT HM.DATAALIMENTACAO, HM.IDCONTRIBUICAO, HM.IDPESSJUR,      '+
          '        HM.IDPESSOA,        HM.IDPLANOPREV,    HM.IDTIPORESERVA,  '+
          '        HM.MESREFERENCIA ,   HM.SEQPROPOSTA,    HM.VLRCOTAS,      '+
          '        HM.IDHISTRESERVA,   RP.FLGCOLETIVA, HM.FLGENTRADA, HM.PLNCODIGO '+
          ' FROM   RESERVAXPLANO RP, HISTMOVRESERVA HM, ELEGPATRO EL        '+
          ' WHERE  (HM.IDPESSJUR     IN ('  + strPatro          +') )       '+
          ' AND    (HM.IDPLANOPREV   IN ('  + strPlano          +') )       ';

  If Trim(strReserva) <> '' Then
    sSQL := sSQL +
          ' AND    (HM.IDTIPORESERVA IN ('  + strReserva        +') )       '; 

  sSQL := sSQL +
          ' AND    (HM.IDEVENTOGERADOR IS NULL)                             '+
          ' AND    (HM.IDPESSOA      = EL.IDPESSOA)                         '+
          ' AND    (HM.IDPESSJUR     = EL.IDPESSJUR)                        '+ 
          ' AND    (HM.DATAALIMENTACAO BETWEEN TO_DATE('''+

          dtInicioAtualiza.Text+''',''DD/MM/YYYY'') AND TO_DATE('''+
          dtpAtualizaAte.Text+''',''DD/MM/YYYY''))  ';


  if Trim(edNome.Text) <> ''
  then sSQL := sSQL + ' AND (HM.IDPESSOA = '+OraNumero(MontaSelectPart.ValoresChave[0])+')';

  If Trim(sMatriculas) <> '' Then
    sSQL := sSQL + ' AND    (EL.MATRICULA IN ('+sMatriculas+') )';


  sSQL := sSQL+' AND    (HM.IDPLANOPREV   = RP.IDPLANOPREV )           '+
          ' AND    (HM.IDTIPORESERVA = RP.IDTIPORESERVA)          '+
          ' AND    (RP.FLGMODATUALIZACAO = 1)                     '+
          ' ORDER BY HM.IDPESSOA, HM.IDTIPORESERVA                ';

  with qryReservasACalcular do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     try
        Open;
     except
        MsgDlg(' Erro ao buscar reservas para desfazer alimentação.','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;

     dtmBaseDados.dbBaseDados.StartTransaction;

     if not GravaLogTOTALPREV (sDescOperacao)
     then begin
        memResult.Lines.Add(' Erro na Gravação do Log.');
        if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
        if chkResult.checked
        then begin
           pnlOpcoes.SendToBack;
           pnlResult.BringToFront;
        end;
        MsgDlg('Operação Interrompida com Erros.','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;

     First;
     // Enquanto houver reserva para desalimentar faça :
     // 1. Enquanto a contribuicao for da mesma reserva fazer
     //    1.1. TotalReserva := TotalReserva + valor desta contribuicao
     //    1.2. Atualizar historico desta contribuicao como nao alimentada
     //    1.3. Apagar historico de reserva
     // 2. Atualizar reserva com TotalReserva

     i := 0;
     while not Eof do
     begin
        iIdPessoaAtual := FieldByName('IDPESSOA').AsInteger;
        { Augusto 14/01/2003 }
        iIdPessJurAtual   := FieldByName('IDPESSJUR').AsInteger;
        iIdPlanoPrevAtual := FieldByName('IDPLANOPREV').AsInteger;
        {*}

        while (iIdPessoaAtual = FieldByName('IdPessoa').AsInteger) and (not Eof) do
        begin
           iIdReservaAtual := FieldByName('IdTipoReserva').AsInteger;
           dTotalReserva   := 0;

           //leorefer - 1508 - inicio
           while (iIdReservaAtual = FieldByName('IdTipoReserva').AsInteger) and (not Eof) and
                 (iIdPessoaAtual = FieldByName('IdPessoa').AsInteger)  do
           //leorefer - 1508 - fim
           begin
              inc(i);
              frmAguarde.Mostra('Desfazendo Atualização - Registros : '+IntToStr(i));
              Application.ProcessMessages;

              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(' DELETE FROM HISTMOVRESERVA '+
                             ' WHERE  IDHISTRESERVA = '+FieldbyName('IdHistReserva').AsString+
                             ' AND    IDPESSJUR      = '+FieldbyName('IdPessJur').AsString+
                             ' AND    IDPLANOPREV    = '+FieldbyName('IdPlanoPrev').AsString+
                             ' AND    IDPESSOA       = '+FieldbyName('IdPessoa').AsString+
                             ' AND    SEQPROPOSTA    = '+FieldbyName('SeqProposta').AsString+
                             ' AND    IDTIPORESERVA  = '+IntToStr(iIdReservaAtual) );
              try
                 qryAux.ExecSQL;
              except
                 frmAguarde.Apaga;
                 if dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.RollBack;
                 MsgDlg('Erro ao apagar movimento de reserva.','Erro',mtError,[mbOk, mbHelp],0);
                 Exit;
              end;

              Next;
           end; // while a mesma reserva da mesma pessoa

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' SELECT DATAINDICE, SALDOREAL FROM HISTMOVRESERVA '+
                          ' WHERE  IDPESSJUR      = '+ IntToStr(iIdPessJurAtual)   +
                          ' AND    IDPLANOPREV    = '+ IntToStr(iIdPlanoPrevAtual) +
                          ' AND    IDPESSOA       = '+ IntToStr(iIdPessoaAtual)    +
                          ' AND    SEQPROPOSTA    = '+FieldbyName('SeqProposta').AsString+
                          ' AND    IDTIPORESERVA  = '+IntToStr(iIdReservaAtual)+
                          ' ORDER BY MESREFERENCIA DESC, DATAMOV DESC ' );
           qryAux.Open;
           if qryAux.IsEmpty
           then begin
              dSaldo      := 0;
              sDataIndice := 'NULL';
           end
           else begin
              dSaldo      := qryAux.FieldByname('SALDOREAL').AsFloat;
              if Trim(qryAux.FieldByName('DATAINDICE').AsString) <> ''
              then sDataIndice := 'TO_DATE('''+qryAux.FieldByName('DATAINDICE').AsString+''',''DD/MM/YYYY'')'
              else sDataIndice := 'NULL';
           end;

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Add(' UPDATE RESERVAPART SET VALORRESERVA     = '+OraNumero(FloatToStr(dSaldo))+','+
                          '                        DATAULTATUALIZA  = '+sDataIndice+
                          ' WHERE  IDPESSJUR      = '+ IntToStr(iIdPessJurAtual)   +
                          ' AND    IDPLANOPREV    = '+ IntToStr(iIdPlanoPrevAtual) +
                          ' AND    IDPESSOA       = '+ IntToStr(iIdPessoaAtual)    +
                          ' AND    SEQPROPOSTA    = '+FieldbyName('SeqProposta').AsString+
                          ' AND    IDTIPORESERVA  = '+IntToStr(iIdReservaAtual) );
           try
              qryAux.ExecSQL;
           except
              frmAguarde.Apaga;
              if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
              MsgDlg('Erro ao atualizar valor da reserva.','Erro',mtError,[mbOk, mbHelp],0);
              Exit;
           end;
        end; // while a mesma pessoa
     end; // while not Eof
  end; // with

  frmAguarde.Apaga;
  if MsgDlg('Desfazer Atualização até '+dtpAtualizaAte.Text+' finalizado com sucesso. '+#13+
            'Deseja efetivar a operação ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbHelp],0) = mrYes
  then begin
     try
        if dtmBaseDados.dbBaseDados.InTransaction then     dtmBaseDados.dbBaseDados.Commit;
     except
        MsgDlg('Erro ao efetivar a operação.','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;
  end
  else begin
     try
        if dtmBaseDados.dbBaseDados.InTransaction then   dtmBaseDados.dbBaseDados.Rollback;
     except
        MsgDlg('Erro ao cancelar a operação.','Erro',mtError,[mbOk, mbHelp],0);
        Exit;
     end;
  end;

  MsgDlg('Processo finalizado com sucesso.','Informação',mtInformation,[mbOk, mbHelp],0);
end;

procedure TfrmAtualizaPorIndice.bbtnVoltarClick(Sender: TObject);
begin
  inherited;
  pnlResult.SendToBack;
  pnlOpcoes.BringToFront;
  bbtnVerResultado.visible := True;

end;

procedure TfrmAtualizaPorIndice.bbtnVerResultadoClick(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pnlOpcoes.SendToBack;

end;



procedure TfrmAtualizaPorIndice.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
     memResult.Lines.SaveToFile(savedlg.filename);
end;



procedure TfrmAtualizaPorIndice.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  dblkpPlanoParticip.Enabled := False;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     edNome.Text      := MontaSelectPart.ValoresChave[2];
     edMatricula.Text := MontaSelectPart.ValoresChave[3];
     edPatro.Text     := MontaSelectPart.ValoresChave[4];
     edPlano.Text     := MontaSelectPart.ValoresChave[6];

     qryPlanoParticip.Close;
     qryPlanoParticip.ParamByName('IDPESSOA').AsString :=  MontaSelectPart.ValoresChave[0];
     qryPlanoParticip.ParamByName('IDPESSJUR').AsString :=  MontaSelectPart.ValoresChave[1];
     qryPlanoParticip.Open;

     dblkpPlanoParticip.Enabled := True;
     dblkpPlanoParticip.DisplayValue := qryPlanoParticip.FieldByName('NOME').AsString;
  end;
end;



procedure TfrmAtualizaPorIndice.btndesfazselecClick(Sender: TObject);
begin
  inherited;
  edNome.Text      := '';
  edMatricula.Text := '';
  edPatro.Text     := '';
  edPlano.Text     := '';

  qryPlanoParticip.Close;
  dblkpPlanoParticip.Enabled := False;
  dblkpPlanoParticip.Clear;

  lbInfo.Caption := '';
end;



procedure TfrmAtualizaPorIndice.rgrpTipoAtualizaClick(Sender: TObject);
begin
   inherited;
   dtInicioAtualiza.Visible := (rgrpTipoAtualiza.ItemIndex = 1);
end;

{------------------------------------------------------------------------------}
{ Inserir movimentação na reserva. Historicos e Saldos                         }
Function TfrmAtualizaPorIndice.InsereMovimentoReserva( pdValorAtualizado, pdValorAcumulado : Double;
                                                       psDataInidice : String;
                                                       pdValorIndice : Double ): Boolean;
Var
  sSQL : String;
Begin

  iIdHistorico := LeUltRegistro(nil,'HISTMOVRESERVA');

  sSQL := ' INSERT INTO HISTMOVRESERVA(                                                         '+
          '             IDHISTRESERVA,   IDTIPORESERVA,  DATAALIMENTACAO,      VLRREAL,         '+
          '             VLRCOTAS,        IDBENEFICIO,    IDCONTRIBUICAO,       IDEVENTOGERADOR, '+
          '             SALDOREAL,       SALDOCOTAS,     IDPLANOPREV,          IDPESSOA,        '+
          '             IDPESSJUR,       FLGENTRADA,     IDREGRACALCULO,       PERCENTUAL,      '+
          '             SEQPROPOSTA,     IDPARTICIPANTE, SALDOREALCONT,        VALORINDICE,     '+
          '             MESREFERENCIA,   DATAMOV,        DATAINDICE,           SALDOCORRIGIDO,  '+
          '             INDICECORRECAO  )                                                       '+
          ' VALUES (                                                                            '+
          IntToStr(iIdHistorico)+','+
          qryReservaxPlano.FieldbyName('IDTIPORESERVA').AsString+','+
          'TO_DATE('''+dtpAtualizaAte.Text+''',''DD/MM/YYYY'') , '+

          OraNumero( FloatToStr( pdValorAtualizado - pdValorAcumulado ) ) +','+
          OraNumero( FloatToStr( pdValorAtualizado - pdValorAcumulado ) ) +','+

          'NULL, '+
          'NULL, '+
          'NULL, '+
          OraNumero( FloatToStr( pdValorAtualizado ) )+','+
          OraNumero( FloatToStr( pdValorAtualizado ) )+','+
          qryReservasACalcular.FieldbyName('IDPLANOPREV').AsString+','+
          qryReservasACalcular.FieldbyName('IDPESSOA').AsString+','+
          qryReservasACalcular.FieldbyName('IDPESSJUR').AsString+','+
          '1,'+
          'NULL,'+
          '0,'+
          qryReservasACalcular.FieldbyName('SEQPROPOSTA').AsString+','+
          qryReservasACalcular.FieldbyName('IDPESSOA').AsString+','+
          '0,'+
          OraNumero( FloatToStr( pdValorIndice ) )+','+
          ''''+Copy( psDataInidice , 7, 4 )+'/'+Copy( psDataInidice, 4, 2 )+''','+
          'SYSDATE,' +
          'TO_DATE('''+ psDataInidice +''',''DD/MM/YYYY'') , '+
          OraNumero(FloatToStr( pdValorAtualizado))+','+
          OraNumero( FloatToStr( pdValorIndice ) )+')' ;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
     qryAux.ExecSQL;
  except
     bErro := True;
  end;

  sSQL := ' UPDATE RESERVAPART SET VALORRESERVA = '+OraNumero( FloatToStr( pdValorAtualizado ) )+
          ' WHERE  IDPESSJUR    = '+qryReservasACalcular.FieldbyName('IDPESSJUR').AsString+
          ' AND    IDPLANOPREV  = '+qryReservasACalcular.FieldbyName('IDPLANOPREV').AsString+
          ' AND    IDPESSOA     = '+qryReservasACalcular.FieldbyName('IDPESSOA').AsString+
          ' AND    IDTIPORESERVA = '+qryReservasACalcular.FieldbyName('IDTIPORESERVA').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);

  try
     qryAux.ExecSQL;
  except
     bErro := True;
  end;


End; { TfrmAtualizaPorIndice.InsereMovimentoReserva }

function TfrmAtualizaPorIndice.UltAlimentacao(sIdPessjur, sIdPessoa,
  sIdPlanoPrev: String): String;
begin
   Result := '';

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT MAX(DATAALIMENTACAO) AS ULTIMA_ALIMENTACAO ');
   qryAux.SQL.Add(' FROM HISTMOVRESERVA                               ');
   qryAux.SQL.Add(' WHERE (IDPESSJUR   = ' + sIdPessjur   + ' )       ');
   qryAux.SQL.Add('   AND (IDPESSOA    = ' + sIdPessoa    + ' )       ');
   qryAux.SQL.Add('   AND (IDPLANOPREV = ' + sIdPlanoPrev + ' )       ');
   qryAux.SQL.Add('   AND (SEQPROPOSTA = 1 )                          ');
   qryAux.Open;

   If qryAux.FieldbyName('ULTIMA_ALIMENTACAO').AsString <> '' Then
      Result := 'Data da última alimentação: ' + qryAux.FieldbyName('ULTIMA_ALIMENTACAO').AsString;
end;

procedure TfrmAtualizaPorIndice.dblkpPlanoParticipChange(Sender: TObject);
begin
  inherited;
   { Localiza data da ultima atualização }
   lbInfo.Caption := UltAlimentacao(MontaSelectPart.ValoresChave[1],
                                    MontaSelectPart.ValoresChave[0],
                                    qryPlanoParticip.FieldByName('IDPLANOPREV').AsString);
end;

procedure TfrmAtualizaPorIndice.rgrTipoClick(Sender: TObject);
begin
  inherited;
  If rgrTipo.ItemIndex = 0 Then
    pnlSelecaoIndividual.BringToFront
  Else
    pnlListaArquivo.BringToFront;
end;



procedure TfrmAtualizaPorIndice.sbtnListaPessoasClick(Sender: TObject);
begin
  inherited;
  If Not OpenDlg.Execute Then
    Exit;

  edtListaPessoas.Text := OpenDlg.FileName;
end;

function TfrmAtualizaPorIndice.MontaStringMatriculas: String;
Var
  sSql,
  sMatrLidas,
  sLinha      : string;
  i           : Integer;
begin
   // Lê as matriculas e monta a variável para retorno
   frmAguarde.Mostra('Lendo dados do arquivo escolhido.');

   Result     := '';
   sMatrLidas := '';

    Try
      AssignFile(X, edtListaPessoas.Text);
      Reset(X);
    Except
      MsgDlg('Erro ao abrir arquivo. Verifique.','Erro',mtError,[mbOK],0);
      Exit;
    End;

   While Not Eof(X) Do
   Begin
     Readln(X, sLinha);
     If Trim(sMatrLidas) = '' Then
       sMatrLidas := ''''+Trim(sLinha)+''''
     Else
       sMatrLidas := sMatrLidas+','+''''+Trim(sLinha)+'''';
   End;

   Result := sMatrLidas;
   // Monta as demais variaveis utilizadas no processo
   // 1º - strPlano
   sSql := 'SELECT DISTINCT'                                 + #13 +
           '  PLP.IDPLANOPREV, PLP.NOME '                    + #13 +
           'FROM '                                           + #13 +
           '  PARTPREVPLAN PPP, ELEGPATRO ELP, PLANPREV PLP '+ #13 +
           'WHERE '                                          + #13 +
           '      ELP.IDPESSOA    = PPP.IDPESSOA '           + #13 +
           '  AND ELP.IDPESSJUR   = PPP.IDPESSJUR '          + #13 +
           '  AND PPP.IDPLANOPREV = PLP.IDPLANOPREV '        + #13 +
           '  AND PPP.FLGDESATIVADO = 0 '                    + #13 +
           '  AND ELP.MATRICULA IN (' + sMatrLidas + ') '    + #13 ;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSql);

   qryAux.Open;

   strPlano := '';

   While Not qryAux.Eof do
   Begin
     strPlano := strPlano + qryAux.FieldByName('IDPLANOPREV').AsString+ ', ';

     qryAux.Next;
   End;

   strPlano := Copy(strPlano, 1, Length(strPlano) - 2);

   // 2º - strPatro
   sSql := 'SELECT DISTINCT'                                 + #13 +
           '  ELP.IDPESSJUR, PES.NOME '                      + #13 +
           'FROM '                                           + #13 +
           '  PARTPREVPLAN PPP, ELEGPATRO ELP, PESSOA PES '  + #13 +
           'WHERE '                                          + #13 +
           '      ELP.IDPESSOA    = PPP.IDPESSOA '           + #13 +
           '  AND ELP.IDPESSJUR   = PPP.IDPESSJUR '          + #13 +
           '  AND PPP.IDPESSJUR   = PES.IDPESSOA '           + #13 +
           '  AND PPP.FLGDESATIVADO = 0 '                    + #13 +
           '  AND ELP.MATRICULA IN (' + sMatrLidas + ') '    + #13 ;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSql);

   qryAux.Open;

   strPatro := '';

   While Not qryAux.Eof do
   Begin
     strPatro := strPatro + qryAux.FieldByName('IDPESSJUR').AsString+ ', ';

     qryAux.Next;
   End;

   strPatro := Copy(strPatro, 1, Length(strPatro) - 2);

   // 2º - Reservas

   // Se tiver alguma reserva marcada, considera a marcada
   // senão usa todas as reservas
   strReserva := '';
   For i := 0 to chklstReserva.Items.Count - 1 Do
   Begin
     If chklstReserva.checked[i] Then
      Begin
        If qryReserva.Locate('NOME',chklstReserva.Items[i],[loCaseInsensitive, loPartialKey]) Then
          strReserva := strReserva + qryReserva.FieldByName('IDTIPORESERVA').AsString+ ', ';
      End;
   End;

   If Trim(strReserva) = '' Then
   Begin
     sSql := 'SELECT DISTINCT '                                                           + #13 +
             '  RP.IDTIPORESERVA,   RP.NOME '                                             + #13 +
             'FROM                          '                                             + #13 +
             '  PLANPREV PL,    RESERVAXPLANO RP '                                        + #13 +
             'WHERE (RP.ANALITICOSINTETI = ''A'') '                                       + #13 +
             '  AND (RP.FLGMODATUALIZACAO = 1 )  '                                        + #13 +
             '  AND (PL.IDPLANOPREV       = RP.IDPLANOPREV) '                             + #13 +
             '  AND (RP.IDTIPORESERVA NOT IN ( '                                          + #13 +
             '                                SELECT RC.IDTIPORESERVA '                   + #13 +
             '                                FROM RESERVAXCONTRIB RC '                   + #13 +
             '                                WHERE RC.IDPLANOPREV = RP.IDPLANOPREV '     + #13 +
             '                                  AND RC.IDTIPORESERVA = RP.IDTIPORESERVA ' + #13 +
             '                               ) ) '                                        + #13 ;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);

     qryAux.Open;

     strReserva := '';

     While Not qryAux.Eof do
     Begin
       strReserva := strReserva + qryAux.FieldByName('IDTIPORESERVA').AsString+ ', ';

       qryAux.Next;
     End;
   End;

   strReserva := Copy(strReserva, 1, Length(strReserva) - 2);

   frmAguarde.Apaga;
end;




procedure TfrmAtualizaPorIndice.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  OpenDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.