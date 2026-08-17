unit fTransfPatroBatch;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 05/09/2007
// Pendência   : 26158
// Rotina      : Atualiza
// Descricao   : Alteração da rotina de movimentação de reservas pelo padrão de
//               movimentação de reservas
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 17/08/2007
// Pendência   : 26164
// Rotina      : Atualiza
// Descricao   : Ajuste na gravação da DEPENTIT e inserir ULTMESPREPARO na Benefbfciario.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/10/2006
// Pendência   : 23623
// Rotina      : Atualiza
// Descricao   : Gravação dos campos TIPOOPCAOIR e DATAOPCAOIR na Partprevplan. 
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 23/10/2006
// Pendência   : 23563
// Rotina      : Atualiza
// Descricao   : Gravação do campo IDPARTICIPANTE na ReservaPart
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 01/02/2006
// Pendência   :
// Alteração   : Acerto no cadastro da DEPENTIT
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 30/03/2005
// Pendência   : 18868
// Alteração   : Atualizar Matricula do Dependente na DEPENTIT
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 29/03/2005
// Pendência   : 18597
// Alteração   : Atualizar IDPARTO na tabela CONTRATOEMPTMO
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/10/2004
// Pendência   : 17833
// Alteração   : Acertar a inclusão na HistFuncPrev
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 30.09.2004
// Pendência   : 17811
// Alteração   : Colocar as propriedades FormStyle = fsNormal e Visible = False
//               para não dar erro na chamada
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 20.04.2004
// Pendência   : 16478
// Alteração   : Retirada do combo de evento da tela pois a mesma será chamada
//               a partir do menu Eventos, onde o evento já é selecionado
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.01.2004
// Pendência   : 15872
// Rotina      :
// Alteração   : Acerto para gravar a data final apenas na ultima linha da
//               patrocinadora de origem, que está com a data final em aberto
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 12/12/2003
// Pendência   : 15561
// Rotina      : Atualiza
// Alteração   : Alteração na query de inserção de eventos na nova patrocinadora
//               para inserir no campo IDSITFUNCNOVO o valor do campo dblkSitPatDestino
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 03.12.2003
// Pendência   : 15561
// Rotina      : Atualiza
// Alteração   : Inclusão do IDPLANOPREV em todos os WHERE pois estava dando
//               erro na transferencia de patro para quem já tinha transferencia
//               de plano
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 27/11/2003
// Pendência   : 15694
// Rotina      : Atualiza
// Alteração   : Inclusão dos campos a serem incluindos na query de insert da
//               HISTFUNCPREV
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// CRIAÇÃO:
//
//  Autor    : Carlos Gleyber Macedo de Mesquita
//  Data     : 12/04/2002
//  Objetivo : Transferir todos (ou alguns) participantes de uma patrocinadora
//             para outra sem que haja uma demissão na patrocinadora origem  e
//             uma admissão na patrocinadora destino. Isto  ocorre quando, por
//             exemplo, uma empresa "encampa"  outra  e  os funcionários   são
//             consequentementes transferidos.
//             Pendência: 5810
// --- *** ---
// ALTERAÇÕES:
//    15/07/2002 Augusto - Pesquisa por matricula (alteração Layout da tela)
//    31/07/2002 Augusto - Retirarda no Sequence e inclusão de uma variavel  }
//                         com o valor correspondente
//------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery,
  wwdbdatetimepicker, Gauges, uMensErro, dBaseDados, ComCtrls, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, MontaSelect, Grids, Wwdbigrd, Wwdbgrid,
  TB97Tlwn, CMDateTimePicker;


type
  TfrmTransfPatroBatch = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    grbOrigem: TGroupBox;
    dblkPatroOrigem: TwwDBLookupCombo;
    Label3: TLabel;
    Label1: TLabel;
    grbDestino: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    dblkPatroDestino: TwwDBLookupCombo;
    dblkFilialDestino: TwwDBLookupCombo;
    qryFilialOrig: TwwQuery;
    dblkSitPatOrigem: TwwDBLookupCombo;
    Label4: TLabel;
    Label6: TLabel;
    qrySitFunc: TwwQuery;
    dblkSitPatDestino: TwwDBLookupCombo;
    qryContrato: TwwQuery;
    qryFilialDest: TwwQuery;
    qryPart: TwwQuery;
    qryAux: TwwQuery;
    dblkPlanoPrev: TwwDBLookupCombo;
    Label10: TLabel;
    qryPlano: TwwQuery;
    grbDemissao: TGroupBox;
    Label11: TLabel;
    msBusca: TMontaSelect;
    dblkFilialOrigem: TwwDBLookupCombo;
    EdMatricDest: TEdit;
    Label13: TLabel;
    Label8: TLabel;
    QryDados: TwwQuery;
    GroupBox1: TGroupBox;
    lblBusca: TLabel;
    EdMatricula: TEdit;
    PnlNome: TPanel;
    Label14: TLabel;
    bbtnProcurar: TBitBtn;
    qryLoop: TwwQuery;
    tb97Param: TToolWindow97;
    pnlTextoFluxOper: TPanel;
    Bevel1: TBevel;
    pnlparam: TPanel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    BitBtn2: TBitBtn;
    maHelpBitBtn1: TmaHelpBitBtn;
    Toolbar972: TToolbar97;
    ToolbarSep974: TToolbarSep97;
    memresultado: TMemo;
    grbGeral: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    dblkDocContrato: TwwDBLookupCombo;
    dblkSitPatFinal: TwwDBLookupCombo;
    Label16: TLabel;
    dtDemissao: TCMDateTimePicker;
    cbOpDemissao: TwwDBComboBox;
    dtDataTransf: TCMDateTimePicker;
    qryEventoGerador: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure dblkPatroOrigemExit(Sender: TObject);
    procedure dblkPatroDestinoExit(Sender: TObject);
    procedure dblkSitPatOrigemChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkSitPatOrigemExit(Sender: TObject);
    procedure EdMatriculaExit(Sender: TObject);
    procedure BtBuscaClick(Sender: TObject);
    procedure dblkFilialOrigemChange(Sender: TObject);
    procedure dblkPlanoPrevChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure dblkPatroOrigemChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    iIdPessoa : Integer;
    Function Atualiza(sPatroOrigem, sPatroDestino, sTipoDoc, sSitFuncOrig,
                      sSitFuncDest,sDataTransf, sEventoGerador, sPlanoPrev,
                      sOpcaoData, sDataDemissao, sMatricDestino, sSitFuncNova : String;
                      iIdPessoa, iSituacao : Integer;
                      sFilialOrigem : String =''; sFilialDestino : String='') : boolean;
    function AtualizaElegPatro( sSQLDados : String ) : Boolean;
    function AtualizaPartPrevPlan( sSQLDados : String ) : Boolean;
    function AtualizaContribPrevpartP( sSQLDados : String ) : Boolean;
    function AtualizaReservaPart( sSQLDados : String ) : Boolean;
    function AtualizaBenefPlanoPart(sSQLDados: String) : Boolean;
    function AtualizaBfciarioTitPlan(sSQLDados: String) : Boolean;
    function AtualizaBenefBfciario(sSQLDados: String) : Boolean;


  public
    { Public declarations }
  end;

var
  frmTransfPatroBatch: TfrmTransfPatroBatch;

implementation

uses fAguarde, UFuncoesUteis, uDataBase, uAdmPrev, Usistema, UModulo, uMovReserva;

{$R *.DFM}

procedure TfrmTransfPatroBatch.FormShow(Sender: TObject);
begin
  inherited;
// Patro
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;
// Situação do Funcionário
  qrySitFunc.Close;
  qrySitFunc.Open;
// Documento do Contrato
  qryContrato.Close;
  qryContrato.Open;
// Evento Gerador
  qryEventoGerador.Close;
  qryEventoGerador.ParamByName('IDFUNDACAO').AsInteger      := iIdFundacao; 
  qryEventoGerador.ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador); 
  qryEventoGerador.Open;
// Plano Previdenciário
  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;
end;

procedure TfrmTransfPatroBatch.dblkPatroOrigemExit(Sender: TObject);
begin
  inherited;
// Abre Filial mostrando apenas da patro selecionada (Origem)
  If Trim(dblkPatroOrigem.Text) <> '' Then
   Begin
    qryFilialOrig.Close;
    qryFilialOrig.ParamByName('IDPESSOA').AsInteger := StrToInt(dblkPatroOrigem.LookupValue);
    qryFilialOrig.Open;

    EdMatricula.text := '';
    PnlNome.caption := '';
    iIdPessoa := 0;

   End;
end;

procedure TfrmTransfPatroBatch.dblkPatroDestinoExit(Sender: TObject);
begin
  inherited;
// Abre Filial mostrando apenas da patro selecionada (Destino)
  If Trim(dblkPatroDestino.Text) <> '' Then
   Begin
    qryFilialDest.Close;
    qryFilialDest.ParamByName('IDPESSOA').AsInteger := StrToInt(dblkPatroDestino.LookupValue);
    qryFilialDest.Open;
   End;
end;

procedure TfrmTransfPatroBatch.dblkSitPatOrigemChange(Sender: TObject);
begin
  inherited;
  grbDemissao.Visible  := (qrySitFunc.FieldByName('TIPOSIT').AsString = 'D');
  EdMatricula.text := '';
  PnlNome.caption := '';
  iIdPessoa := 0;
  EdMatricDest.text := '';
  EdMatricDest.enabled := False;
  EdMatricDest.color := clMenu;

end;

procedure TfrmTransfPatroBatch.dblkSitPatOrigemExit(Sender: TObject);
begin
  inherited;
  If grbDemissao.Visible Then cbOpDemissao.SetFocus Else dtDemissao.Text := '';
end;

procedure TfrmTransfPatroBatch.bbtnConfirmarClick(Sender: TObject);
Var
  sSql,
  sMsgRetorno : String;
  iSituacao   : Integer;
begin
  inherited;
  tb97Param.visible := false;
  memresultado.lines.clear;

  // Crítica de campos obrigatórios
  if Trim(dblkPatroOrigem.Text) = '' then   // Patro Origem
  begin
    MsgDlg('É obrigatório o preenchimento da Patrocinadora de Origem.','Erro',mtError,[mbOk,mbHelp],0);
    dblkPatroOrigem.SetFocus;
    Exit;
  end;

  if Trim(dblkPatroDestino.Text) = '' then   // Patro Destino
  begin
    MsgDlg('É obrigatório o preenchimento da Patrocinadora de Destino.','Erro',mtError,[mbOk,mbHelp],0);
    dblkPatroDestino.SetFocus;
    Exit;
  end;


  if Trim(dblkSitPatOrigem.Text) = '' then   // Situação na Origem
  begin
    MsgDlg('É obrigatório o preenchimento da Situação na Patrocinadora de Origem.','Erro',mtError,[mbOk,mbHelp],0);
    dblkSitPatOrigem.SetFocus;
    Exit;
  end;

  if Trim(dblkSitPatDestino.Text) = '' then   // Situação no Destino
  begin
    MsgDlg('É obrigatório o preenchimento da Situação na Patrocinadora de Destino.','Erro',mtError,[mbOk,mbHelp],0);
    dblkSitPatDestino.SetFocus;
    Exit;
  end;

  if Trim(dtDataTransf.Text) = '' then   // Data de Transferência
  begin
    MsgDlg('É obrigatório o preenchimento da Data de Transferência.','Erro',mtError,[mbOk,mbHelp],0);
    dtDataTransf.SetFocus;
    Exit;
  End;

  if (grbDemissao.Visible) and (Trim(cbOpDemissao.Text) = '') then   // Opção da Data de Demissão
  begin
    MsgDlg('É obrigatório o preenchimento da Opção da Data de Demissão.','Erro',mtError,[mbOk,mbHelp],0);
    cbOpDemissao.SetFocus;
    Exit;
  End;

  if Trim(dblkPlanoPrev.Text) = ''        // Plano Previdenciário
   Then
    begin
     MsgDlg('É obrigatório o preenchimento do Plano Previdenciário.','Erro',mtError,[mbOk,mbHelp],0);
     dblkPlanoPrev.SetFocus;
     Exit;
    End
   Else
   // Avalia se a Patrocinadora Destino tem o Plano selecionado
    Begin
     sSql:= 'SELECT * '+
            'FROM PLANPREVPATRO ' +
            'WHERE IDPESSJUR = '+ dblkPatroDestino.LookupValue +
            '  AND IDPLANOPREV = '+ dblkPlanoPrev.LookupValue +
            '  AND FLGATIVO = 1';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);

     qryAux.Open;

     If qryAux.IsEmpty
     Then
      begin
       MsgDlg('Plano Previdenciário escolhido não existe na Patrocinadora Destino.','Erro',mtError,[mbOk,mbHelp],0);
       dblkPlanoPrev.SetFocus;
       Exit;
      End;
    End;

  //Executa procedimento de atualização
  if not Atualiza(dblkPatroOrigem.LookupValue,dblkPatroDestino.LookupValue,
                         '', 
                         dblkSitPatOrigem.LookupValue,
                         dblkSitPatDestino.LookupValue, dtDataTransf.Text,
                         qryEventoGerador.fieldbyname('IDEVENTOGERADOR').AsString,
                         dblkPlanoPrev.LookupValue,
                         cbOpDemissao.Value, dtDemissao.Text,
                         EdMatricDest.Text, dblkSitPatFinal.LookupValue,
                         iIdPessoa, iSituacao,
                         dblkFilialOrigem.LookupValue, dblkFilialDestino.LookupValue)
  then begin
     frmAguarde.Apaga;
     MsgDlg('Erro na execução da Transferência de Patrocinadora. Transferência não Efetuada.','Erro',mtError,[mbOK],0);
  end
  else begin
     frmAguarde.Apaga;
     MsgDlg('Transferência de Patrocinadora efetuada com sucesso.','Informação',mtInformation,[mbOK],0);
  end;

  bbtnCancelarClick(self);

  if trim(memresultado.text) <> ''
  then begin
     tb97Param.visible := true;
     tb97Param.Top := 56;
     tb97Param.Left := 120;
  end;
end;

function TfrmTransfPatroBatch.Atualiza(sPatroOrigem, sPatroDestino, sTipoDoc, sSitFuncOrig,
                                       sSitFuncDest,sDataTransf, sEventoGerador, sPlanoPrev,
                                       sOpcaoData, sDataDemissao, sMatricDestino, sSitFuncNova : String;
                                       iIdPessoa, iSituacao : Integer;
                                       sFilialOrigem : String =''; sFilialDestino : String ='') : boolean;
Var
  sTexto,
  sSql, sSQLSelect,
  sSubSql,
  sFilial,
  sFlgSitFuncImed,
  sFlgSitPartImed,
  sFlgSitPlanoImed,
  sFlgEfetivado,
  sDataFimBenef,
  sMesAnt,
  sAnoAnt,
  sDataEfetivado, sMensErro   : string;
  iIdEvento : LongInt;

  bErro : Boolean;
  bExisteNoPlanoDestino,
  bExisteNoDestino : boolean;      
  bRepetePergunta  : boolean;      
  mrResult         : TModalResult; 

begin

  Result := False;
  frmAguarde.Mostra('Executando Processo de Transferência de Patrocinadora.');
  sTexto := 'Atenção!!'+#13+'Ocorreu um erro durante o processo.'+#13;



  //  Lê dados necessários do evento gerador
  sSql:= 'SELECT FLGSITFUNCIMEDIA, FLGSITPARTIMEDIA, FLGSITPLANOIMEDI '+
         'FROM EVENTOGERADOR '+
         'WHERE IDEVENTOGERADOR = ' + sEventoGerador;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);

  qryAux.Open;

  If (qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPLANOIMEDI').AsString = '1')
   Then
    Begin
     sFlgEfetivado  := '1';
     sDataEfetivado := ' To_Date(''' + DateToStr(Date) + ''',''DD/MM/YYYY'')';
    End
   Else
    Begin
     sFlgEfetivado  := '0';
     sDataEfetivado := 'NULL';
    End;

  If qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1' Then
    sFlgSitFuncImed := '1'
  Else
    sFlgSitFuncImed := '0';

  If qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1' Then
    sFlgSitPartImed := '1'
  Else
    sFlgSitPartImed := '0';

  If qryAux.FieldByName('FLGSITPLANOIMEDI').AsString  = '1' Then
    sFlgSitPlanoImed := '1'
  Else
    sFlgSitPlanoImed := '0';


  if trim(sFilialDestino) = '' then
     sFilialDestino := 'NULL';

  //  Monta a subSql de acordo com as opções escolhidas.
  sSubSql := ' SELECT EL.IDPESSJUR, PF.IDPESSOA, EL.MATRICULA, EL.DATADEMISSAO, PP.IDPLANOPREV  ' +
             ' FROM   PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP ' +
             ' WHERE  (EL.IDPESSJUR      = '+sPatroOrigem+')         ' +
             ' AND    (PP.FLGDESATIVADO  = 0 )                       ' + 
             ' AND    (PF.IDPESSOA       = EL.IDPESSOA)              ' +
             ' AND    (EL.IDPESSOA       = PP.IDPESSOA)              ' +
             
             ' AND    (EL.IDSITFUNC      = '+ sSitFuncOrig +')       ' +
             ' AND    (PP.IDPLANOPREV    = '+ sPlanoPrev +')         ';

  If Trim(sFilialOrigem)<>'' Then
    sSubSql := sSubSql + '  AND (EL.IDESTAB = '+ sFilialOrigem +') ';

  If iIdPessoa <> 0 Then
    sSubSql := sSubSql + ' AND (PF.IDPESSOA = '+ IntToStr(iIdPessoa) +' ) ';

  If (grbDemissao.visible) and (cbOpDemissao.itemindex >=0) Then
    sSubSql := sSubSql + '  AND (EL.DATADEMISSAO '+ Trim(sOpcaoData) +' TO_DATE('''+ sDataDemissao +''',''DD/MM/YYYY'')) ';


  qryLoop.close;
  qryloop.sql.text := sSubSql;
  qryLoop.open;

  if qryloop.isempty  then
  begin
     MsgDlg('Nenhum participante foi selecionado nos parâmetros atuais.','Aviso',mtConfirmation,[mbOk],0);
     frmAguarde.Apaga;
     exit;
  end;


  bErro            := False;
  bRepetePergunta  := True; 

  while not qryLoop.eof do
  begin

     If Not dtmBaseDados.dbBaseDados.InTransaction
     Then dtmBaseDados.dbBaseDados.StartTransaction;

     { Altera dados originais na ELEGPATRO }
     sSql:= 'UPDATE ELEGPATRO EL ' +
            'SET DATADEMISSAO = TO_DATE('+QuotedStr(DateToStr(StrToDate(sDataTransf)-1) )+', ''DD/MM/YYYY''), '+
            '    IDSITFUNC    = '+ sSitFuncNova +'  ' +
            'WHERE (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') ' +
            '  AND (IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+') ' ;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        bErro := True;
        sMensErro := 'Atualizando dados do elegível na patrocinadora origem.';
     end;


     
     // Verificar se a pessoa já pertenceu a patrocinadora de origem
     bExisteNoDestino := False;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT 1 FROM ELEGPATRO '+
                    ' WHERE  IDPESSJUR = '+sPatroDestino+
                    ' AND    IDPESSOA  = '+qryLoop.fieldbyname('IDPESSOA').AsString);
     qryAux.Open;
     if not qryAux.IsEmpty
     then bExisteNoDestino := True;

     if bExisteNoDestino
     then begin
        if bRepetePergunta
        then begin
           mrResult := MsgDlg('A matrícula '+qryLoop.FieldByName('MATRICULA').AsString+' já existe na patrocinadora Destino.'+#13+
                              'Deseja reativar seus dados nesta patrocinadora ? ','Confirmação',mtConfirmation,[mbYes,mbNo,mbYesToAll],0);
           if mrResult = mrNo
           then begin
              if dtmBaseDados.dbBaseDados.InTransaction
              then dtmBaseDados.dbBaseDados.RollBack;
              Exit;
           end
           else if mrResult = mrYesToAll
                then bRepetePergunta := False;
        end;
     end;

     {---------------------------------------------------------------------------}
     { Atualização cadastral - Insersão do elegível na nova patrocinadora        }
     {---------------------------------------------------}
     { Monta SQL Com os dados da Patrocinadora de Origem }
      sSQLSelect :=
             'SELECT IDPESSJURCARGO, '+sPatroDestino+' AS IDPESSJUR, IDPESSOA, CODCENTROCUSTO, ' +
             '       IDPESSJURORGAO, SIGLA, '+sSitFuncDest+' AS IDSITFUNC, ' ;

      if trim(sMatricDestino) <> '' then
         sSQLSelect := sSQLSelect + ' '+QuotedStr(sMatricDestino)+' AS MATRICULA , '
      else
         sSQLSelect := sSQLSelect + '  MATRICULA , ';

      sSQLSelect := sSQLSelect + '       TO_DATE('+QuotedStr(sDataTransf)+', ''DD/MM/YYYY'') AS DATAADMISSAO, '+
             '       SALTOTAL, PARTICIPPREVID,' +
             '       PARTICIPASSIST, IDEMPRESAPROP, NIVEL, DATAINICIOAFAST, ' +
             '       DATAFIMAFAST, TEMPOSERVANTERIOR, TEMPONAOCREDITADO, ' +
             '       TEMPOSERVANTREAL, TEMPOSITESPECIAL, VALORBASE1, VALORBASE2, ' +
             '       VALORBASE3, TEMPOSERVTOTAL, TEMPOSERVPUBLANT, TEMPOINSSAFAST, ' +
             '       TEMPOSERVPRIVANT, FLGDIRETOR, SALREFERENCIA, TEMPOSERVTOTMES, ' +
             '       TEMPOSERVTOTDIA, TEMPOSERVCALC, ' +
             '       TEMPOCOMPRADO, IDPESSJURFUNC, DATAREADMISSAO,' +
             '       CODVINCULAFUNC, MODOFUNCAO, '+sFilialDestino+'  ';

      sSQLSelect := sSQLSelect + ' FROM ELEGPATRO EL '+
                                 ' WHERE (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
                                 ' AND (IDPESSOA = '+qryLoop.fieldbyname('IDPESSOA').AsString+' )';

     if not bExisteNoDestino
     then begin
        sSql:= 'INSERT INTO ELEGPATRO (IDPESSJURCARGO, IDPESSJUR, IDPESSOA, CODCENTROCUSTO,     ' +
               '                       IDPESSJURORGAO, SIGLA, IDSITFUNC,                        ' +
               '                       MATRICULA, DATAADMISSAO, SALTOTAL, PARTICIPPREVID,       ' +
               '                       PARTICIPASSIST, IDEMPRESAPROP, NIVEL, DATAINICIOAFAST,   ' +
               '                       DATAFIMAFAST, TEMPOSERVANTERIOR, TEMPONAOCREDITADO,      ' +
               '		             TEMPOSERVANTREAL, TEMPOSITESPECIAL, VALORBASE1, VALORBASE2,   ' +
               '		             VALORBASE3, TEMPOSERVTOTAL, TEMPOSERVPUBLANT, TEMPOINSSAFAST, ' +
               '		             TEMPOSERVPRIVANT, FLGDIRETOR, SALREFERENCIA, TEMPOSERVTOTMES, ' +
               '		             TEMPOSERVTOTDIA, TEMPOSERVCALC,                               ' +
               '		             TEMPOCOMPRADO, IDPESSJURFUNC, DATAREADMISSAO,                 ' +
               '                       CODVINCULAFUNC, MODOFUNCAO, IDESTAB )                    ' ;
        sSQL := sSQL + sSQLSelect;
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        Try
          qryAux.ExecSQL;
        Except
            bErro := true;
            sMensErro := 'Inserindo elegível na nova patrocinadora'
        End;
     end
     else begin
       if not AtualizaElegPatro(sSQLSelect)
       then begin
          bErro := true;
          sMensErro := 'Atualizando elegível na nova patrocinadora'
       end;
     end;

     
     With qryAux do
      Begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT 1 ');
        SQL.Add('FROM DEPENTIT ');
        SQL.Add('WHERE IDTITULAR = '+qryLoop.fieldbyname('IDPESSOA').AsString);
        SQL.Add('  AND IDPESSOA  = '+qryLoop.fieldbyname('IDPESSOA').AsString);

        Open;

        
        If (Not IsEmpty) Then
        Begin 
          if (Trim(sMatricDestino) <> '') then
          begin
        
           Close;
           SQL.Clear;
           SQL.Add('UPDATE DEPENTIT');
           SQL.Add('SET MATRICULA = '+QuotedStr(sMatricDestino));
           SQL.Add('WHERE IDTITULAR = '+qryLoop.fieldbyname('IDPESSOA').AsString);
           SQL.Add('  AND IDPESSOA  = '+qryLoop.fieldbyname('IDPESSOA').AsString);

           Try
             ExecSQL;
           Except
             bErro := true;
             sMensErro := 'Atualizando Matrícula no cadastro de dependentes';
           End;
          end;
         End
         Else Begin // Participante NÃO EXISTE na DEPENTIT - Insere novo registro
           Close;
           SQL.Clear;
           
           SQL.Add('INSERT INTO DEPENTIT (IDTITULAR, IDPESSOA, MATRICULA, IDDEPENDENCIA )');
           SQL.Add('VALUES ('+qryLoop.fieldbyname('IDPESSOA').AsString +',');
           SQL.Add('         '+qryLoop.fieldbyname('IDPESSOA').AsString+',');
           SQL.Add('         '+QuotedStr(sMatricDestino)               +',');
           SQL.Add(QuotedStr( 'PRP' )+  ') ');
           

           Try
             ExecSQL;
           Except
             bErro := true;
             sMensErro := 'Inserindo novo registro no cadastro de dependentes';
           End;
         End;
      End;
     


     {---------------------------------------------------------------------------}
     //Atualização cadastral - Atualização do FLGDESATIVADO na PARTPREVPLAN - Etapa 1
     sSql:= 'UPDATE PARTPREVPLAN PV   ' +
            'SET PV.FLGDESATIVADO = 1 '+
            'WHERE (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') ' +
            '  AND (IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+')'+
            '  AND (IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+')';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        bErro := True;
        sMensErro := 'Desativando planos dos participantes na patrocinadora anterior.';
     end;

     // Atualização cadastral - Insersão do participante na Fundação
     sSql:= 'INSERT INTO PARTPREVPLAN (IDPESSJUR, IDPESSOA, IDPLANOPREV, IDSITPART, SEQPROPOSTA, IDSITPLANOPREV, ' +
            '                     REQUERIMENTODATA, INSCRICAONUMERO, ' +
            '                     INSCRICAODATA, INSCRICAOTIPO, SALINSCRICAO, ' +
            '                     DATAINICIOASSIST, SALPARTICIPACAO, SALMANTIDO, ' +
            '                     SALVINCULADO, VALORCALCINSS, DATACANCELAMENTO, DATAINICIOMANUT, DATAFIMASSIST, ' +
            '                     FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC, FLGDEVEPREVIDENC, VALORINFINSS, DATAINICIOSITTEMP, ' +
            '                     DATAFIMSITTEMP, SALAUXDOENCA, ' +
            '                     FLGSALVIRTBENEF, FLGDESATIVADO, DTINICIOINSC, TEMPOAFASTADO, ' +
            '                     ULTSALPART, ULTREMTOTAL, ULTSALMANUT, ULTSALMANUTPARC, FLGFITESPECIAL, ' +
            '                     FLGUSATETO, MESULTREAJSAL, SALPARTIC13, NUMPROCINSS, '+
            '                     TIPOOPCAOIR, DATAOPCAOIR ) '; 
     sSQLSelect :=
            'SELECT '+ sPatroDestino+ ' AS IDPESSJUR, IDPESSOA, IDPLANOPREV, IDSITPART, SEQPROPOSTA, IDSITPLANOPREV, ' +
            '       REQUERIMENTODATA, INSCRICAONUMERO, ' +
            '       INSCRICAODATA, INSCRICAOTIPO, SALINSCRICAO, ' +
            '       DATAINICIOASSIST, SALPARTICIPACAO, SALMANTIDO, ' +
            '       SALVINCULADO, VALORCALCINSS, DATACANCELAMENTO, DATAINICIOMANUT, DATAFIMASSIST, ' +
            '       FLGDEVEEMPRESTIMO, FLGDEVEASSISTENC, FLGDEVEPREVIDENC, VALORINFINSS, DATAINICIOSITTEMP, ' +
            '       DATAFIMSITTEMP, SALAUXDOENCA, ' +
            '       FLGSALVIRTBENEF, 0, DTINICIOINSC, TEMPOAFASTADO, ' +
            '       ULTSALPART, ULTREMTOTAL, ULTSALMANUT, ULTSALMANUTPARC, FLGFITESPECIAL, ' +
            '       FLGUSATETO, MESULTREAJSAL, SALPARTIC13, NUMPROCINSS, ' +
            '       TIPOOPCAOIR, DATAOPCAOIR  ' +              
            'FROM PARTPREVPLAN PV ' +
            'WHERE (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') ' +
            '  AND (IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+')'+
            '  AND (FLGDESATIVADO = 1) ';
     sSQL := sSQL + sSQLSelect;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     Try
       qryAux.ExecSQL;
     Except
       On E:EDatabaseError Do Begin
         { Caso Registro já exista altera dados da ElegPatro }
         if not AtualizaPartPrevPlan(sSQLSelect) then
         begin
            bErro := true;
            sMensErro := 'Inserindo participantes pela nova patrocinadora.';
         end;

       End
     End;


     {---------------------------------------------------------------------------}
     { Atualização cadastral - Insersão das contribuições na CONTRIBPREVPARTP    }
     sSql:= 'INSERT INTO CONTRIBPREVPARTP (IDPESSJUR, IDTPPERIODICIDADE, IDPESSOA, IDPLANOPREV, SEQPROPOSTA, '+
            '                           IDEMPRESAPROP, IDEMPRESAPROP13, RECPAG, RECPAGDEVOL, CODTIPRECDES, '+
            '                           CODTIPDESEMBCAR, CODCENTROCUSTOD13, IDCONTRIBUICAO, RECPAG13, PLACONTAD, '+
            ' 			         TIPCODIGO, CODCENTROCUSTOC13, CODCENTRORESPON, PLACONTAD13, PLACONTAC13, '+
            ' 			         PLANO, PLACONTAC, DIAVENCIMENTO, CODTIPDOC, '+
            '			         CODSUBCONTA, CODCENTROCUSTOD, '+
            '			         CODCENTROCUSTOC, UNIDNEGOC, IDEMPRESA, '+
            '			         CODPORTFORMA, FLGDESCFOLHA, VALORBASE1, VALORBASE2, VALORBASE3, FLGCOBRA, '+
            '			         QTDEPARCELAS, FLGRECALCULA, '+
            '			         FLGRETROATIVO, DATAINICIO,  '+
            '			         PLANO13, IDEMPRESA13, '+
            '			         UNIDNEGOC13, CODSUBCONTA13, '+
            '			         CODTIPRECDES13, TIPCODIGO13, CODTIPDOC13, CODPORTFORMA13, '+
            '			         CODCENTRORESPON13, ASSOC1OP1, ASSOC1OP2, ASSOC1OP3, ASSOC2OP1, ASSOC2OP2, '+
            '			         ASSOC2OP3, ASSOC3OP1, ASSOC3OP2, ASSOC3OP3, VALORASSOCIADO, VALORASSOCIADO2, '+
            '			         VALORASSOCIADO3, CODTIPDESEMBDEVOL, CODCCUSTODEVOL, PLACONTADEVOL, '+
            '			         CODTIPDESEMB13, ULTANO13, PLACONTADEVOLPAT, CODCCUSTODEVOLPAT, CODCCUSTOCPROVIS, '+
            '			         CODCCUSTODPROVIS, PLACONTACPROVIS, PLACONTADPROVIS, IDPLANPREVCONTAB, '+
            '			         PLACONTADBANCO13, PLACONTADBANCO, CODCCUSTDPROVIS13, CODCCUSTCPROVIS13, '+
            '			         PLACONTADPROVIS13, PLACONTACPROVIS13, PLANOPROVIS) ';
     sSQLSelect :=
            'SELECT '+ sPatroDestino +' AS IDPESSJUR, IDTPPERIODICIDADE, IDPESSOA, IDPLANOPREV, SEQPROPOSTA, IDEMPRESAPROP, '+
            '       IDEMPRESAPROP13, RECPAG, RECPAGDEVOL, CODTIPRECDES, CODTIPDESEMBCAR, CODCENTROCUSTOD13, IDCONTRIBUICAO, '+
            '       RECPAG13, PLACONTAD, TIPCODIGO, CODCENTROCUSTOC13, CODCENTRORESPON, PLACONTAD13, PLACONTAC13, '+
            '       PLANO, PLACONTAC, DIAVENCIMENTO, CODTIPDOC, CODSUBCONTA, '+
            '       CODCENTROCUSTOD, CODCENTROCUSTOC, UNIDNEGOC, '+
            '       IDEMPRESA, CODPORTFORMA, FLGDESCFOLHA, VALORBASE1, VALORBASE2, VALORBASE3, 1, '+
            '       QTDEPARCELAS, FLGRECALCULA, FLGRETROATIVO, TO_DATE('+ QuotedStr(sDataTransf) +',''DD/MM/YYYY'') AS DATAINICIO,'+
            '       PLANO13, IDEMPRESA13, '+
            '       UNIDNEGOC13, CODSUBCONTA13,  '+
            '       CODTIPRECDES13, TIPCODIGO13, CODTIPDOC13, CODPORTFORMA13, CODCENTRORESPON13, ASSOC1OP1, ASSOC1OP2, '+
            '       ASSOC1OP3, ASSOC2OP1, ASSOC2OP2, ASSOC2OP3, ASSOC3OP1, ASSOC3OP2, ASSOC3OP3, VALORASSOCIADO, '+
            '       VALORASSOCIADO2, VALORASSOCIADO3, CODTIPDESEMBDEVOL, CODCCUSTODEVOL, PLACONTADEVOL, CODTIPDESEMB13, '+
            '       ULTANO13, PLACONTADEVOLPAT, CODCCUSTODEVOLPAT, CODCCUSTOCPROVIS, CODCCUSTODPROVIS, PLACONTACPROVIS, '+
            '       PLACONTADPROVIS, IDPLANPREVCONTAB, PLACONTADBANCO13, PLACONTADBANCO, CODCCUSTDPROVIS13, '+
            '       CODCCUSTCPROVIS13, PLACONTADPROVIS13, PLACONTACPROVIS13, PLANOPROVIS '+
            'FROM CONTRIBPREVPARTP CP '+
            'WHERE (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
            '  AND (IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+') '+
            '  AND (FLGCOBRA = 1) ';
     sSQL := sSQL + sSQLSelect;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     Try
       qryAux.ExecSQL;
     Except
       On E:EDatabaseError Do Begin
         { Caso Registro já exista altera dados da ElegPatro }
         if not AtualizaContribPrevpartP(sSQLSelect) then
         begin
            bErro := true;
            sMensErro := 'Inserindo contribuiçoes na nova patrocinadora.';
         end;
       End
     End;


     { Atualização cadastral - Atualizações de Contribuições - Etapa 2           }
     sSql:= 'UPDATE CONTRIBPREVPARTP CP '+
            'SET CP.FLGCOBRA  = 0, '+
            '    CP.DATAFINAL = TO_DATE('+ QuotedStr(DateToStr(StrToDate(sDataTransf)-1) ) +',''DD/MM/YYYY'') '+
            'WHERE (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
            '  AND (IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+') '+
            '  AND (FLGCOBRA = 1) ';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        bErro := True;
        sMensErro := 'Atualizando contribuições ativas.';
     end;

     
     

     If ( Not RodaPadraoMovReserva( QryLoop.FieldByName('IDPESSJUR').AsInteger,
                                    QryLoop.FieldByName('IDPLANOPREV').AsInteger,
                                    QryLoop.FieldByName('IDPESSOA').AsInteger,
                                    QryLoop.FieldByName('SEQPROPOSTA').AsInteger,

                                    -1,
                                    StrToInt( sEventoGerador ),
                                    StrToInt( sPatroDestino ),
                                    QryLoop.FieldByName('IDPLANOPREV').AsInteger,
                                    QryEventoGerador.FieldByName('FLGINTERNO').AsString,
                                    sDataTransf,
                                    sMensErro,
                                    -1,
                                    'O',
                                    '',
                                    False,
                                    sDataTransf
                                  ) ) Then
     Begin
        bErro := True;
        sMensErro := 'Ocorreu um erro na execução do Padrão de Movimentação de Reserva ['+sMensErro+']. Verifique.';
        TiraSQL(qryAux);
        Exit;
     end;


     

     

     //Atualização cadastral - Atualização de Benefícios - Etapa 4
     sSql:= 'INSERT INTO BENEFPLANOPART (IDPESSJUR, SEQPROPOSTA, IDPLANOPREV, IDPESSOA, IDBENEFICIO, '+
            '                          IDEMPRESAPROPABN, IDEMPRESAPROP, RECPAGDEVOL, CODTIPRECEBCAP, '+
            '			       CODCENTRORESPON, CODCENTROCUSTODA, CODRECEBCAPABN, CODTIPRECDES, '+
            '			       CODCENTROCUSTOCA, RECPAG, PLACONTADABN, PLACONTACABN,'+
            '			       RECPAGABN, CODPORTFORMA, VALORBASE1, CODTIPDOC, CODSUBCONTA, '+
            '			       VALORBASE2, TIPCODIGO, UNIDNEGOC, VALORBASE3, '+
            '			       CODCENTROCUSTOD, IDEMPRESA, CODCENTROCUSTOC, PLACONTAD, IDEMPRESAABN, '+
            '			       PLANO, PLACONTAC, CODPORTFORMAABN, CODTIPDOCABN, TIPCODIGOABN, '+
            '			       CODTIPRECDESABN, CODALTERAJUROSABN, CODALTERACORRABN, PLANOABN, '+
            '			       UNIDNEGOCABN, CODCENTRORESPONA, CODSUBCONTAABN, CODTIPRECEBDEVOL, '+
            '                          CODCCUSTODEVOL, PLACONTADEVOL, CODCCUSTODEVPATA, PLACONTADEVPATA, '+
            '			       CODCCUSTODEVOLA, PLACONTADEVOLA, CODCCUSTODEVOLPAT, PLACONTADEVOLPAT, '+
            '			       CODCCUSTOCPROVIS, CODCCUSTODPROVIS, PLACONTACPROVIS, PLACONTADPROVIS, '+
            '			       IDPLANPREVCONTAB)';
     sSQLSelect :=  ' SELECT '+ sPatroDestino +' AS IDPESSJUR, SEQPROPOSTA, IDPLANOPREV, IDPESSOA, IDBENEFICIO, '+
            '       IDEMPRESAPROPABN,  IDEMPRESAPROP, RECPAGDEVOL, CODTIPRECEBCAP, '+
            '       CODCENTRORESPON, CODCENTROCUSTODA, CODRECEBCAPABN, CODTIPRECDES, '+
            '       CODCENTROCUSTOCA, RECPAG, PLACONTADABN, PLACONTACABN,'+
            '       RECPAGABN, CODPORTFORMA, VALORBASE1, CODTIPDOC, CODSUBCONTA, '+
            '       VALORBASE2, TIPCODIGO, UNIDNEGOC, VALORBASE3, '+
            '       CODCENTROCUSTOD, IDEMPRESA,  CODCENTROCUSTOC, PLACONTAD, IDEMPRESAABN, '+
            '       PLANO, PLACONTAC, CODPORTFORMAABN,  CODTIPDOCABN, TIPCODIGOABN, '+
            '       CODTIPRECDESABN, CODALTERAJUROSABN, CODALTERACORRABN, PLANOABN, '+
            '       UNIDNEGOCABN, CODCENTRORESPONA, CODSUBCONTAABN, CODTIPRECEBDEVOL, '+
            '       CODCCUSTODEVOL, PLACONTADEVOL, CODCCUSTODEVPATA, PLACONTADEVPATA, '+
            '       CODCCUSTODEVOLA, PLACONTADEVOLA, CODCCUSTODEVOLPAT, PLACONTADEVOLPAT, '+
            '       CODCCUSTOCPROVIS, CODCCUSTODPROVIS, PLACONTACPROVIS, PLACONTADPROVIS, '+
            '       IDPLANPREVCONTAB '+
            ' FROM BENEFPLANOPART BP'+
            ' WHERE (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
            '  AND (IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+') ';
     sSQL := sSQL + sSQLSelect;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        On E:EDatabaseError Do Begin
           if not AtualizaBenefPlanoPart(sSQLSelect)  then
           begin
              bErro := true;
              sMensErro := 'Atualizando benefícios.';
           end;
        end;
     end;

     //Registrando na EVENTOSPREV os participantes
     
     sSql:= 'INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, '+
            '                        IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, '+
            '                        IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, '+
            '                        IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, '+
            '                        IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, '+
            '                        FLGSITPLANOIMED, FLGEFETIVADO, INSCRICAONUMERO, DATAEFETIVADO) '+
            ' SELECT SEQEVENTOSPREV.NEXTVAL AS IDEVENTOSPREV, '+ 
            'TO_DATE(SYSDATE,''DD/MM/YYYY''), '+
            ' TO_DATE('''+ sDataTransf +''',''DD/MM/YYYY''), '+
            '       PV.IDPESSOA, '+ sPatroDestino +', PV.IDPLANOPREV, PV.SEQPROPOSTA,  '+
            '       EL.IDSITFUNC, PV.IDSITPART, PV.IDSITPLANOPREV, '+
            dblkSitPatDestino.LookupValue+', '+
            '       PV.IDSITPART, PV.IDSITPLANOPREV, '+
            sEventoGerador +', '+ sFlgSitFuncImed +', '+ sFlgSitPartImed+', '+ sFlgSitPlanoImed+', '+
            '       '+ sFlgEfetivado+', PV.INSCRICAONUMERO, ';
     If sDataEfetivado='NULL'
      Then sSql := sSql + 'TO_DATE(NULL,''DD/MM/YYYY'') '
      Else sSql := sSql + sDataEfetivado;

     sSql:= sSql +
            ' FROM ELEGPATRO EL, PARTPREVPLAN PV '+
            ' WHERE (PV.IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
            '  AND (PV.IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (PV.IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+' ) '+
            '  AND (PV.IDPESSOA = EL.IDPESSOA) '+
            '  AND (PV.IDPESSJUR = EL.IDPESSJUR) ';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        bErro := true;
        sMensErro := 'Registrando eventos dos participantes.';
     end;



     //Gravação de contribuições desativadas na HSTCONTEVENTOSPR
     sSql:= 'INSERT INTO HSTCONTEVENTOSPR (IDEVENTOSPREV, IDEVENTOGERADORF, IDPLANOPREVF, '+
            '                              IDCONTRIBUICAOF, TIPO, FLGASSOCIADA, IDASSOCIACAO) '+
            ' SELECT EP.IDEVENTOSPREV, '+ sEventoGerador +', CP.IDPLANOPREV, '+
            '       CP.IDCONTRIBUICAO, ''F'' AS TIPO, CP.FLGCOBRA AS FLGASSOCIADA, ROWNUM '+
            ' FROM '+
            ' EVENTOSPREV      EP, '+
            ' CONTRIBPREVPARTP CP '+
            ' WHERE (EP.IDEVENTOSPREV = '+IntToStr(iIdEvento)+') '+
            '  AND (EP.IDPESSOA    = CP.IDPESSOA) '+
            '  AND (EP.IDPESSJUR   = '+sPatroDestino+' ) '+
            '  AND (TO_CHAR(EP.DATAEVENTO,''DD/MM/YYYY'')  = TO_CHAR(CP.DATAFINAL + 1,''DD/MM/YYYY'')) '+
            '  AND (EP.IDPLANOPREV = CP.IDPLANOPREV) '+
            '  AND (CP.DATAFINAL   = TO_DATE('''+DateToStr(StrToDate(sDataTransf)-1)+''',''DD/MM/YYYY'') ) '+
            '  AND (CP.IDPESSJUR   = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
            '  AND (CP.IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (CP.IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+' )  '+
            '  AND (CP.FLGCOBRA = 0 ) ';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        bErro := True;
        sMensErro := 'Gravando histórico de contribuições desativadas.';
     end;


     If StrToInt(Copy(sDataTransf,4,2)) = 1
      Then sMesAnt := '12'
      Else If StrToInt(Copy(sDataTransf,4,2)) > 10
            Then sMesAnt:=IntToStr(StrToInt(Copy(sDataTransf,4,2))-1)
            Else sMesAnt:='0'+IntToStr(StrToInt(Copy(sDataTransf,4,2))-1);

     If StrToInt(Copy(sDataTransf,4,2)) = 1
      Then sAnoAnt := IntToStr(StrToInt(Copy(sDataTransf,7,4))-1)
      Else sAnoAnt := Copy(sDataTransf,7,4);

     sDataFimBenef := DateToStr(TrazUltDiaData(StrToDate('01/'+sMesAnt+'/'+sAnoAnt)));

     sSql:= ' UPDATE BENEFBFCIARIO '+
            ' SET IDSITBENEFICIO = 3, '+
            '    DATAFINAL = TO_DATE('''+ sDataFimBenef +''',''DD/MM/YYYY'') '+
            ' WHERE (IDSITBENEFICIO = 1) '+
            '  AND (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
            '  AND (IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (IDTITULAR = '+qryloop.fieldbyname('IDPESSOA').AsString+') ';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        bErro := True;
        sMensErro := 'Alterando Beneficios Ativos.';
     end;


     // Inserindo uma nova linha na BFCIARIOTITPLAN para benefícios ativos na nova patrocinadora
     sSql:= 'INSERT INTO BFCIARIOTITPLAN (IDPESSJUR, IDTITULAR, IDPLANOPREV, IDPESSOA, IDBENEFICIO,'+
            '                             SEQPROPOSTA, PRIORIDADE, PERCENTUAL, IDRESPONSAVEL, IDPLANOORIGEM )';
     sSQLSelect :=  'SELECT '+ sPatroDestino +', IDTITULAR, IDPLANOPREV, IDPESSOA, IDBENEFICIO,'+
            '       SEQPROPOSTA, PRIORIDADE, PERCENTUAL, IDRESPONSAVEL, IDPLANOORIGEM '+
            ' FROM BFCIARIOTITPLAN'+
            ' WHERE IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+
            '  AND IDPESSOA IN (SELECT IDPESSOA'+
            '      FROM BENEFBFCIARIO'+
            '      WHERE IDSITBENEFICIO = 3'+
            '      AND IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+
            '      AND IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+
            '      AND IDTITULAR = '+qryloop.fieldbyname('IDPESSOA').AsString+
            '      AND DATAFINAL = TO_DATE('''+ sDataFimBenef +''',''DD/MM/YYYY'')  )';
     sSQL := sSQL + sSQLSelect;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        On E:EDatabaseError Do Begin
           if not AtualizaBfciarioTitPlan(sSQLSelect) then
           begin
              bErro := True;
              sMensErro := 'Inserindo Responsaveis de Beneficios Ativos na nova Patrocinadora.';
           end;
        end;
     end;


     // Inserindo uma nova linha na BENEFBFCIARIO para benefícios ativos na nova patrocinadora
     sSql:= 'INSERT INTO BENEFBFCIARIO (NUMEROPROCESSO, IDPESSJUR, IDPLANOPREV, IDTITULAR, IDPESSOA, SEQPROPOSTA,'+
            '                           IDBENEFICIO, CODPORTFORMA, IDSITBENEFICIO, IDDEPENDENCIA, IDTPPAGTOBENEFIC,'+
            '                           VALORATUAL, DATAREQUERIMENTO, DATAINICIO, FLGFORMAPAGTO,'+
            '                           VALORCALCULADO, DATAULTREAJUSTE, VLRCALCINSS, VLRINFINSS, DATAINICIOINSS,'+
            '                           NUMPROCINSS, DATAINICIOFUND, VALORCOTAS, DATACONCESSAO, FLGPROVISORIO,'+
            '                           PERCPROVISORIO, PRAZOPROVISORIO, ULTMESREAJUSTE, ULTVALORATUALREAJ,'+
            '                           IDAGENCIARESGATE, DATAFINALPREVISTA, FLGDATAPREVISTA, FLGTIPOINSS, DIBBENEFANT,'+
            '                           VALORBENEFANT, VALORBINSSANT1, VALORBINSSANT2, VALORBINSSANT3, VALORTOTAL,'+
            ' ULTMESPREPARO, '+ 
            '                           FLGPOSSUIACOMPINSS, FLGBENEFMIN, VALORSRB, IDPLANOORIGEM)';
     sSQLSelect := ' SELECT NUMEROPROCESSO, '+ sPatroDestino +', IDPLANOPREV, IDTITULAR, IDPESSOA, SEQPROPOSTA,'+
            '       IDBENEFICIO, CODPORTFORMA, 1, IDDEPENDENCIA, IDTPPAGTOBENEFIC,'+
            '       VALORATUAL, DATAREQUERIMENTO, DATAINICIO, FLGFORMAPAGTO,'+
            '       VALORCALCULADO, DATAULTREAJUSTE, VLRCALCINSS, VLRINFINSS, DATAINICIOINSS,'+
            '       NUMPROCINSS, DATAINICIOFUND, VALORCOTAS, DATACONCESSAO, FLGPROVISORIO,'+
            '       PERCPROVISORIO, PRAZOPROVISORIO, ULTMESREAJUSTE, ULTVALORATUALREAJ,'+
            '       IDAGENCIARESGATE, DATAFINALPREVISTA, FLGDATAPREVISTA, FLGTIPOINSS, DIBBENEFANT,'+
            '       VALORBENEFANT, VALORBINSSANT1, VALORBINSSANT2, VALORBINSSANT3, VALORTOTAL,'+
            ' ULTMESPREPARO, '+ 
            '       FLGPOSSUIACOMPINSS, FLGBENEFMIN, VALORSRB, IDPLANOORIGEM '+
            ' FROM BENEFBFCIARIO'+
            ' WHERE (IDSITBENEFICIO = 3) '+
            '  AND (IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+') '+
            '  AND (IDPLANOPREV = '+qryloop.fieldbyname('IDPLANOPREV').AsString+') ' +
            '  AND (IDTITULAR = '+qryloop.fieldbyname('IDPESSOA').AsString+') '+
            '  AND (DATAFINAL = TO_DATE('''+ sDataFimBenef +''',''DD/MM/YYYY''))';
     sSQL := sSQL + sSQLSelect;
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        On E:EDatabaseError Do Begin
           if not AtualizaBenefBfciario(sSQLSelect)  then
           begin
              bErro := True;
             sMensErro := 'Inserindo Beneficios Ativos na nova Patrocinadora.';
           end;
        end;
     end;




     // Inserir no historico funcional a entrada na patrocinadora destino
     //
     sSql := 'INSERT INTO HISTFUNCPREV                                           '+
     
     '(SEQHISTFUNC,  IDDOCUMENTO,      CODTPINSALUBRI,  DATAFINAL,   CARGO,      '+
     ' FUNCAO,       TEMPOCALCINSALUB, DATAINICIO,      EMPRESA,     VALORCARGO, '+
     ' NUMDOCUMENTO, FLGCONTATS,       VINCEMPREG,      IDPESSJUR,   MATRICULA,  '+
     ' IDPESSOA,     TEMPOCALC,        FLGCONCOMITANTE, DATAPROCESSO)            ';
     
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT 1');
     qryAux.SQL.Add('FROM HISTFUNCPREV');
     qryAux.SQL.Add('WHERE IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString);
     qryAux.SQL.Add('  AND   IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND   DATAFINAL IS NULL  ');
     qryAux.Open;

     If Not qryAux.IsEmpty
      Then Begin // Existe registro anterior na HistfuncPrev. Apenas copia
        sSql := sSql + ' SELECT SEQHISTFUNCPREV.NEXTVAL AS SEQHISTFUNC,                            '+
        ' IDDOCUMENTO,CODTPINSALUBRI ,DATAFINAL,                                    '+
        
        ' CARGO,FUNCAO,TEMPOCALCINSALUB,                                            '+
        ' TO_DATE('''+sDataTransf+''',''DD/MM/YYYY'') ,                             '+
        ' '''+dblkPatroDestino.text+''' ,VALORCARGO,                                '+
        ' NUMDOCUMENTO,FLGCONTATS  ,VINCEMPREG ,  '+sPatroDestino                    ;

        if trim(sMatricDestino) <> '' then
           sSql := sSql + ' , '+QuotedStr(sMatricDestino)+'  , '
        else
           sSql := sSql + ' , MATRICULA , ';


        sSql := sSql + ' IDPESSOA ,TEMPOCALC,FLGCONCOMITANTE ,DATAPROCESSO '+
        ' FROM HISTFUNCPREV '+
        ' WHERE IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+' '+
        ' AND   IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString+' '+
        ' AND   DATAFINAL IS NULL  ';
      End
      Else Begin // Não existe registro anterior na HistfuncPrev. Cria um com valores defaults
        sSql := sSql +
        ' VALUES ('+
        ' SEQHISTFUNCPREV.NEXTVAL,  '+                   
        ' NULL,'+                                        
        ' NULL,'+                                        
        ' NULL,'+                                        
        ' NULL,'+                                        
        ' NULL,'+                                        
        ' 0,'+                                           
        ' TO_DATE('''+sDataTransf+''',''DD/MM/YYYY''),'+
        ' '''+dblkPatroDestino.text+''','+               
        ' NULL,'+                                        
        ' NULL,'+                                        
        ' NULL,'+                                        
        ' NULL,'+                                        
        sPatroDestino+', '+                              
        QuotedStr(sMatricDestino)+', '+                  
        qryloop.fieldbyname('IDPESSOA').AsString+','+    
        ' 0,'+                                           
        ' 0,'+                                           
        ' NULL)';                                         
      End;
     

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSql;
     except
        bErro := True;
        sMensErro := 'Inserindo Histórico Funcional pela nova patrocinadora.';
     end;

     
     // Está atualizando toda a evolução funcional da pessoa e não apenas a ultima linha
     sSql := ' UPDATE HISTFUNCPREV SET DATAFINAL = TO_DATE('''+sDataTransf+''',''DD/MM/YYYY'') -1  '+
             ' WHERE IDPESSJUR = '+qryloop.fieldbyname('IDPESSJUR').AsString+
             ' AND   IDPESSOA = '+qryloop.fieldbyname('IDPESSOA').AsString  +
             ' AND   DATAFINAL IS NULL ';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSql;
     except
        bErro := True;
        sMensErro := 'Atualizando Histórico Funcional na patrocinadora origem.';
     end;

     
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add( ' UPDATE CONTRATOEMPTMO SET IDPATRO = '+sPatroDestino+
                     ' WHERE  IDPATRO     = '+ sPatroOrigem +
                     ' AND    IDPLANOPREV = '+ sPlanoPrev   +
                     ' AND    IDPESSOA    = '+ IntToStr(iIdPessoa) );

     try
        qryAux.ExecSQL;
     except
        Exit;
     end;
     Result := False;
     


     //vefifica se a alteração foi realmente efetuada
     if bErro then
     begin
        memresultado.lines.add(' ');
        memresultado.lines.add('Erro - Matrícula: '+qryloop.fieldbyname('MATRICULA').AsString+' - '+sMensErro );
     end;

     if bErro
     then begin
        dtmBaseDados.dbBaseDados.Rollback;
        Result := False;
     end
     else begin
       
       // Adicionando Log Padrao
       Try
         If Not Sistema.GravaLogOperacoes('Transferência de Patrocinadora') Then
           raise exception.Create('Erro ao gravar Log.')
       Except
       End;
       if Trim(EdMatricula.Text) = ''
       then GravaLogTotalPrev('Transferência de Patrocinadora Em Lote - Origem : '+Trim(dblkPatroOrigem.Text)+'- Destino : '+Trim(dblkPatroDestino.Text))
       else GravaLogTotalPrev('Transferência de Patrocinadora Individual - Matricula : '+Trim(edMatricula.Text)+'- Origem : '+Trim(dblkPatroOrigem.Text)+'- Destino : '+Trim(dblkPatroDestino.Text));
       dtmBaseDados.dbBaseDados.Commit;
       Result := True;
     end;
     qryLoop.Next;
  end;
end; 


procedure TfrmTransfPatroBatch.EdMatriculaExit(Sender: TObject);
Var
  sSQL : String;
begin
  inherited;
  
  If Trim(EdMatricula.Text) = '' Then Exit;

  { Verifica origem da chamada }
  if (ActiveControl.Name <> 'bbtnSair') and
     (ActiveControl.Name <> 'bbtnCancelar')
  Then Begin
    { Utiliza variavel para escrever a query para buscar matrícula digitada }
    sSql:='SELECT '+
          '  PARTPREVPLAN.IDPESSOA,    ELEGPATRO.MATRICULA, PESSOA.NOME,      '+
          '  PARTPREVPLAN.IDPLANOPREV, ELEGPATRO.IDPESSJUR, ELEGPATRO.IDESTAB '+
          'FROM   '+
          '  PESSOA, PARTPREVPLAN, ELEGPATRO '+
          'WHERE  '+
          '  ELEGPATRO.MATRICULA = '+QuotedStr(Trim(EdMatricula.Text))+' AND '+
          '  PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR AND '+
          '  PARTPREVPLAN.IDPESSOA  = ELEGPATRO.IDPESSOA  AND '+
          '  PARTPREVPLAN.FLGDESATIVADO = 0               AND '+
          '  PESSOA.IDPESSOA        = ELEGPATRO.IDPESSOA      ';
    QryAux.SQL.Clear;
    QryAux.SQL.Add(sSql);
    QryAux.Open;
    If QryAux.IsEmpty Then Begin
      MsgDlg('Matrícula não encontrada.','Erro',mtError,[mbOk],0);
      Exit;
    End;

    if QryAux.RecordCount >1 then
    begin
       MsgDlg('Mais de um participante selecionado.','Aviso',mtConfirmation,[mbOk],0);
       BtBuscaClick(self);
    end;

    iIdPessoa := QryAux.FieldByName('IDPESSOA').AsInteger;
    PnlNome.Visible  := True;
    PnlNome.Caption  := ' '+QryAux.FieldByName('NOME').AsString;
    EdMatricula.Text := QryAux.FieldByName('MATRICULA').AsString;

    dblkPatroOrigem.LookupValue  := QryAux.FieldByName('IDPESSJUR').AsString;
    dblkPatroOrigem.PerformSearch;
    dblkPlanoPrev.LookupValue    := QryAux.FieldByName('IDPLANOPREV').AsString;
    dblkPlanoPrev.PerformSearch;

    qryFilialOrig.Close;
    qryFilialOrig.ParamByName('IDPESSOA').AsInteger := StrToInt(QryAux.FieldByName('IDPESSJUR').AsString);
    qryFilialOrig.Open;

    dblkFilialOrigem.LookupValue := QryAux.FieldByName('IDESTAB').AsString;
    dblkFilialOrigem.PerformSearch;


    dblkSitPatOrigem.SetFocus;

    EdMatricDest.Text := EdMatricula.Text;
  End;
  

end;

procedure TfrmTransfPatroBatch.BtBuscaClick(Sender: TObject);
begin
  inherited;
  
  msBusca.Executar;
  If msBusca.RetornouValor Then Begin
    iIdPessoa        := StrToInt(msBusca.ValoresChave[0]);
    PnlNome.Visible  := True;
    PnlNome.Caption  := ' '+msBusca.ValoresChave[3];
    EdMatricula.Text := msBusca.ValoresChave[4];
    EdMatricDest.Text := EdMatricula.Text;

    dblkPatroOrigem.LookupValue := msBusca.ValoresChave[1];
    dblkPatroOrigem.PerformSearch;
    dblkPlanoPrev.LookupValue   := msBusca.ValoresChave[2];
    dblkPlanoPrev.PerformSearch;
    { Filial }
    qryFilialOrig.Close;
    qryFilialOrig.ParamByName('IDPESSOA').AsInteger := StrToInt(msBusca.ValoresChave[1]);
    qryFilialOrig.Open;
    dblkFilialOrigem.LookupValue:= msBusca.ValoresChave[30];
    dblkFilialOrigem.PerformSearch;

    dblkSitPatOrigem.LookupValue   := msBusca.ValoresChave[17];
    dblkSitPatOrigem.PerformSearch;

  End;
  
end;


function TfrmTransfPatroBatch.AtualizaElegPatro(sSQLDados: String) : Boolean;
Var
  sSQLLocal : String;
begin
  result := false;

  { Busca dados da Patro atual }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQLDados);
  qryAux.Open;

  if qryaux.isempty then
  begin
     result := true;
     exit;
  end;

  { Prepara a atualização }
  sSQLLocal :=
      'UPDATE ELEGPATRO SET '+
      '	IDPESSJURCARGO    = '+QuotedStr(QryAux.FieldByName('IDPESSJURCARGO').AsString)      +', '+

      '	CODCENTROCUSTO    = '+QuotedStr(QryAux.FieldByName('CODCENTROCUSTO').AsString)      +', '+
      '  IDPESSJURORGAO    = '+QuotedStr(QryAux.FieldByName('IDPESSJURORGAO').AsString)      +', '+
      '	SIGLA             = '+QuotedStr(QryAux.FieldByName('SIGLA').AsString)               +', '+
      '	IDSITFUNC         = '+dblkSitPatDestino.LookupValue                                 +', '+
      '	MATRICULA         = '+QuotedStr(QryAux.FieldByName('MATRICULA').AsString)           +', '+
      '	DATAADMISSAO      = TO_DATE('+QuotedStr(QryAux.FieldByName('DATAADMISSAO').AsString)+', ''DD/MM/YYYY''), '+
      '	SALTOTAL          = '+OraNumero(QryAux.FieldByName('SALTOTAL').AsString)            +', '+
      '	PARTICIPPREVID    = '+OraNumero(QryAux.FieldByName('PARTICIPPREVID').AsString)      +', '+
      '	PARTICIPASSIST    = '+OraNumero(QryAux.FieldByName('PARTICIPASSIST').AsString)      +', '+
      '	IDEMPRESAPROP     = '+QuotedStr(QryAux.FieldByName('IDEMPRESAPROP').AsString)       +', '+
      '	NIVEL             = '+QuotedStr(QryAux.FieldByName('NIVEL').AsString)               +', '+
      '	DATAINICIOAFAST   = TO_DATE('+QuotedStr(QryAux.FieldByName('DATAINICIOAFAST').AsString)+', ''DD/MM/YYYY''), '+
      '	DATAFIMAFAST      = TO_DATE('+QuotedStr(QryAux.FieldByName('DATAFIMAFAST').AsString)+', ''DD/MM/YYYY''), '+
      '	DATADEMISSAO      = NULL, '+
      '	TEMPOSERVANTERIOR = '+QuotedStr(QryAux.FieldByName('TEMPOSERVANTERIOR').AsString)   +', '+
      '	TEMPONAOCREDITADO = '+QuotedStr(QryAux.FieldByName('TEMPONAOCREDITADO').AsString)   +', '+
      '	TEMPOSERVANTREAL  = '+QuotedStr(QryAux.FieldByName('TEMPOSERVANTREAL').AsString)    +', '+
      '	TEMPOSITESPECIAL  = '+QuotedStr(QryAux.FieldByName('TEMPOSITESPECIAL').AsString)    +', '+
      '	VALORBASE1        = '+OraNumero(FloatToStr(QryAux.FieldByName('VALORBASE1').AsFloat))          +', '+
      '	VALORBASE2        = '+OraNumero(FloatToStr(QryAux.FieldByName('VALORBASE2').AsFloat))          +', '+
      '	VALORBASE3        = '+OraNumero(FloatToStr(QryAux.FieldByName('VALORBASE3').AsFloat))          +', '+
      '	TEMPOSERVTOTAL    = '+QuotedStr(QryAux.FieldByName('TEMPOSERVTOTAL').AsString)      +', '+
      '	TEMPOSERVPUBLANT  = '+QuotedStr(QryAux.FieldByName('TEMPOSERVPUBLANT').AsString)    +', '+
      '	TEMPOINSSAFAST    = '+QuotedStr(QryAux.FieldByName('TEMPOINSSAFAST').AsString)      +', '+
      '	TEMPOSERVPRIVANT  = '+QuotedStr(QryAux.FieldByName('TEMPOSERVPRIVANT').AsString)    +', '+
      '	FLGDIRETOR        = '+QuotedStr(QryAux.FieldByName('FLGDIRETOR').AsString)          +', '+
      '	SALREFERENCIA     = '+OraNumero(FloatToStr(QryAux.FieldByName('SALREFERENCIA').AsFloat))       +', '+
      '	TEMPOSERVTOTMES   = '+QuotedStr(QryAux.FieldByName('TEMPOSERVTOTMES').AsString)     +', '+
      '	TEMPOSERVTOTDIA   = '+QuotedStr(QryAux.FieldByName('TEMPOSERVTOTDIA').AsString)     +', '+
      '	TEMPOSERVCALC     = '+QuotedStr(QryAux.FieldByName('TEMPOSERVCALC').AsString)       +', '+
      '	TEMPOCOMPRADO     = '+QuotedStr(QryAux.FieldByName('TEMPOCOMPRADO').AsString)       +', '+
      '	IDPESSJURFUNC     = '+QuotedStr(QryAux.FieldByName('IDPESSJURFUNC').AsString)       +', '+
      '	DATAREADMISSAO    = TO_DATE('+QuotedStr(QryAux.FieldByName('DATAREADMISSAO').AsString)+', ''DD/MM/YYYY''), '+
      '	CODVINCULAFUNC    = '+QuotedStr(QryAux.FieldByName('CODVINCULAFUNC').AsString)      +', '+
      '	MODOFUNCAO        = '+QuotedStr(QryAux.FieldByName('MODOFUNCAO').AsString)          +'  ';
  If QryAux.FindField('IDESTAB') <> Nil Then
      sSQLLocal := sSQLLocal +', '+'	IDESTAB           = '+QuotedStr(QryAux.FieldByName('IDESTAB').AsString);

  sSQLLocal := sSQLLocal +
      'WHERE (IDPESSJUR = '+ QryAux.FieldByName('IDPESSJUR').AsString  +') ' +
      '  AND (IDPESSOA = '+ QryAux.FieldByName('IDPESSOA').AsString  +') ' ;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQLLocal);

  try
     qryAux.ExecSQL;
  except
     exit;
  end;

  result := true;

end;  
 
function TfrmTransfPatroBatch.AtualizaPartPrevPlan(sSQLDados: String) : Boolean;
Var
  sSQLLocal : String;
begin
  result := false;

  { Busca dados da Patro atual }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQLDados);
  qryAux.Open;

  If QryAux.IsEmpty Then
  begin
     result := true;
     Exit;
  end;

  { Prepara a atualização }
  sSQLLocal :=
      'UPDATE PARTPREVPLAN SET FLGDESATIVADO = 0, '+
      '	IDSITPART        = '+QuotedStr(QryAux.FieldByName('IDSITPART').AsString)       +', '+
      '	IDSITPLANOPREV   = '+QryAux.FieldByName('IDSITPLANOPREV').AsString             +', '+
      '	INSCRICAONUMERO  = '+QryAux.FieldByName('INSCRICAONUMERO').AsString            +', '+
      '	INSCRICAODATA    = '+QuotedStr(QryAux.FieldByName('INSCRICAODATA').AsString)   +', '+
      '  DTINICIOINSC     = '+QuotedStr(QryAux.FieldByName('DTINICIOINSC').AsString)    +', '+
      '	REQUERIMENTODATA = '+QuotedStr(QryAux.FieldByName('REQUERIMENTODATA').AsString)+'  ';

  sSQLLocal := sSQLLocal +
      'WHERE (IDPESSJUR = '+QryAux.FieldByName('IDPESSJUR').AsString+') ' +
      '  AND (IDPESSOA = '+QryAux.FieldByName('IDPESSOA').AsString+')  '+
      '  AND (IDPLANOPREV = '+QryAux.FieldByName('IDPLANOPREV').AsString+') '; 

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQLLocal);

  try
     qryAux.ExecSQL;
  except
     exit;
  end;

  result := true;

end; 

function TfrmTransfPatroBatch.AtualizaContribPrevpartP(sSQLDados: String) : Boolean;
Var
  sSQLLocal : String;
begin
  result := false;

  { Busca dados da Patro atual }
  QryDados.Close;
  QryDados.SQL.Clear;
  QryDados.SQL.Add(sSQLDados);
  QryDados.Open;

  If QryDados.IsEmpty Then
  begin
     result := true;
     Exit;
  end;

  While Not QryDados.Eof Do Begin
    { Prepara a atualização }
    sSQLLocal :=
        'UPDATE CONTRIBPREVPARTP SET '+
        ' IDTPPERIODICIDADE  = '+QuotedStr(QryDados.FieldByName('IDTPPERIODICIDADE').AsString) +', '+
        ' IDEMPRESAPROP      = '+QuotedStr(QryDados.FieldByName('IDEMPRESAPROP').AsString)     +', '+
        ' IDEMPRESAPROP13    = '+QuotedStr(QryDados.FieldByName('IDEMPRESAPROP13').AsString)   +', '+
        ' RECPAG             = '+QuotedStr(QryDados.FieldByName('RECPAG').AsString)            +', '+
        ' RECPAGDEVOL        = '+QuotedStr(QryDados.FieldByName('RECPAGDEVOL').AsString)       +', '+
        ' CODTIPRECDES       = '+QuotedStr(QryDados.FieldByName('CODTIPRECDES').AsString)      +', '+
        ' CODTIPDESEMBCAR    = '+QuotedStr(QryDados.FieldByName('CODTIPDESEMBCAR').AsString)   +', '+
        ' CODCENTROCUSTOD13  = '+QuotedStr(QryDados.FieldByName('CODCENTROCUSTOD13').AsString) +', '+
        ' RECPAG13           = '+QuotedStr(QryDados.FieldByName('RECPAG13').AsString)          +', '+
        ' PLACONTAD          = '+QuotedStr(QryDados.FieldByName('PLACONTAD').AsString)         +', '+
        ' TIPCODIGO          = '+QuotedStr(QryDados.FieldByName('TIPCODIGO').AsString)         +', '+
        ' CODCENTROCUSTOC13  = '+QuotedStr(QryDados.FieldByName('CODCENTROCUSTOC13').AsString) +', '+
        ' CODCENTRORESPON    = '+QuotedStr(QryDados.FieldByName('CODCENTRORESPON').AsString)   +', '+
        ' PLACONTAD13        = '+QuotedStr(QryDados.FieldByName('PLACONTAD13').AsString)       +', '+
        ' PLACONTAC13        = '+QuotedStr(QryDados.FieldByName('PLACONTAC13').AsString)       +', '+
        ' PLANO              = '+QuotedStr(QryDados.FieldByName('PLANO').AsString)             +', '+
        ' PLACONTAC          = '+QuotedStr(QryDados.FieldByName('PLACONTAC').AsString)         +', '+
        ' DIAVENCIMENTO      = '+QuotedStr(QryDados.FieldByName('DIAVENCIMENTO').AsString)     +', '+
        ' CODTIPDOC          = '+QuotedStr(QryDados.FieldByName('CODTIPDOC').AsString)         +', '+
        ' CODSUBCONTA        = '+QuotedStr(QryDados.FieldByName('CODSUBCONTA').AsString)       +', '+
        ' CODCENTROCUSTOD    = '+QuotedStr(QryDados.FieldByName('CODCENTROCUSTOD').AsString)   +', '+
        ' CODCENTROCUSTOC    = '+QuotedStr(QryDados.FieldByName('CODCENTROCUSTOC').AsString)   +', '+
        ' UNIDNEGOC          = '+QuotedStr(QryDados.FieldByName('UNIDNEGOC').AsString)         +', '+
        ' IDEMPRESA          = '+QuotedStr(QryDados.FieldByName('IDEMPRESA').AsString)         +', '+
        ' CODPORTFORMA       = '+QuotedStr(QryDados.FieldByName('CODPORTFORMA').AsString)      +', '+
        ' FLGDESCFOLHA       = '+QuotedStr(QryDados.FieldByName('FLGDESCFOLHA').AsString)      +', '+
        ' VALORBASE1         = '+QuotedStr(QryDados.FieldByName('VALORBASE1').AsString)        +', '+
        ' VALORBASE2         = '+QuotedStr(QryDados.FieldByName('VALORBASE2').AsString)        +', '+
        ' VALORBASE3         = '+QuotedStr(QryDados.FieldByName('VALORBASE3').AsString)        +', '+
        ' FLGCOBRA           =1 '                                                              +', '+
        ' QTDEPARCELAS       = '+QuotedStr(QryDados.FieldByName('QTDEPARCELAS').AsString)      +', '+
        ' FLGRECALCULA       = '+QuotedStr(QryDados.FieldByName('FLGRECALCULA').AsString)      +', '+
        ' FLGRETROATIVO      = '+QuotedStr(QryDados.FieldByName('FLGRETROATIVO').AsString)     +', '+
        ' DATAINICIO         = TO_DATE('+QuotedStr(QryDados.FieldByName('DATAINICIO').AsString)+', ''DD/MM/YYYY''), '+
        ' PLANO13            = '+QuotedStr(QryDados.FieldByName('PLANO13').AsString)           +', '+
        ' IDEMPRESA13        = '+QuotedStr(QryDados.FieldByName('IDEMPRESA13').AsString)       +', '+
        ' UNIDNEGOC13        = '+QuotedStr(QryDados.FieldByName('UNIDNEGOC13').AsString)       +', '+
        ' CODSUBCONTA13      = '+QuotedStr(QryDados.FieldByName('CODSUBCONTA13').AsString)     +', '+
        ' CODTIPRECDES13     = '+QuotedStr(QryDados.FieldByName('CODTIPRECDES13').AsString)    +', '+
        ' TIPCODIGO13        = '+QuotedStr(QryDados.FieldByName('TIPCODIGO13').AsString)       +', '+
        ' CODTIPDOC13        = '+QuotedStr(QryDados.FieldByName('CODTIPDOC13').AsString)       +', '+
        ' CODPORTFORMA13     = '+QuotedStr(QryDados.FieldByName('CODPORTFORMA13').AsString)    +', '+
        ' CODCENTRORESPON13  = '+QuotedStr(QryDados.FieldByName('CODCENTRORESPON13').AsString) +', '+
        ' ASSOC1OP1          = '+QuotedStr(QryDados.FieldByName('ASSOC1OP1').AsString)         +', '+
        ' ASSOC1OP2          = '+QuotedStr(QryDados.FieldByName('ASSOC1OP2').AsString)         +', '+
        ' ASSOC1OP3          = '+QuotedStr(QryDados.FieldByName('ASSOC1OP3').AsString)         +', '+
        ' ASSOC2OP1          = '+QuotedStr(QryDados.FieldByName('ASSOC2OP1').AsString)         +', '+
        ' ASSOC2OP2          = '+QuotedStr(QryDados.FieldByName('ASSOC2OP2').AsString)         +', '+
        ' ASSOC2OP3          = '+QuotedStr(QryDados.FieldByName('ASSOC2OP3').AsString)         +', '+
        ' ASSOC3OP1          = '+QuotedStr(QryDados.FieldByName('ASSOC3OP1').AsString)         +', '+
        ' ASSOC3OP2          = '+QuotedStr(QryDados.FieldByName('ASSOC3OP2').AsString)         +', '+
        ' ASSOC3OP3          = '+QuotedStr(QryDados.FieldByName('ASSOC3OP3').AsString)         +', '+
        ' VALORASSOCIADO     = '+QuotedStr(QryDados.FieldByName('VALORASSOCIADO').AsString)    +', '+
        ' VALORASSOCIADO2    = '+QuotedStr(QryDados.FieldByName('VALORASSOCIADO2').AsString)    +', '+
        ' VALORASSOCIADO3    = '+QuotedStr(QryDados.FieldByName('VALORASSOCIADO3').AsString)   +', '+
        ' CODTIPDESEMBDEVOL  = '+QuotedStr(QryDados.FieldByName('CODTIPDESEMBDEVOL').AsString) +', '+
        ' CODCCUSTODEVOL     = '+QuotedStr(QryDados.FieldByName('CODCCUSTODEVOL').AsString)    +', '+
        ' PLACONTADEVOL      = '+QuotedStr(QryDados.FieldByName('PLACONTADEVOL').AsString)     +', '+
        ' CODTIPDESEMB13     = '+QuotedStr(QryDados.FieldByName('CODTIPDESEMB13').AsString)    +', '+
        ' ULTANO13           = '+QuotedStr(QryDados.FieldByName('ULTANO13').AsString)          +', '+
        ' PLACONTADEVOLPAT   = '+QuotedStr(QryDados.FieldByName('PLACONTADEVOLPAT').AsString)  +', '+
        ' CODCCUSTODEVOLPAT  = '+QuotedStr(QryDados.FieldByName('CODCCUSTODEVOLPAT').AsString) +', '+
        ' CODCCUSTOCPROVIS   = '+QuotedStr(QryDados.FieldByName('CODCCUSTOCPROVIS').AsString)  +', '+
        ' CODCCUSTODPROVIS   = '+QuotedStr(QryDados.FieldByName('CODCCUSTODPROVIS').AsString)  +', '+
        ' PLACONTACPROVIS    = '+QuotedStr(QryDados.FieldByName('PLACONTACPROVIS').AsString)   +', '+
        ' PLACONTADPROVIS    = '+QuotedStr(QryDados.FieldByName('PLACONTADPROVIS').AsString)   +', '+
        ' IDPLANPREVCONTAB   = '+QuotedStr(QryDados.FieldByName('IDPLANPREVCONTAB').AsString)  +', '+
        ' PLACONTADBANCO13   = '+QuotedStr(QryDados.FieldByName('PLACONTADBANCO13').AsString)  +', '+
        ' PLACONTADBANCO     = '+QuotedStr(QryDados.FieldByName('PLACONTADBANCO').AsString)    +', '+
        ' CODCCUSTDPROVIS13  = '+QuotedStr(QryDados.FieldByName('CODCCUSTDPROVIS13').AsString) +', '+
        ' CODCCUSTCPROVIS13  = '+QuotedStr(QryDados.FieldByName('CODCCUSTCPROVIS13').AsString) +', '+
        ' PLACONTADPROVIS13  = '+QuotedStr(QryDados.FieldByName('PLACONTADPROVIS13').AsString) +', '+
        ' PLACONTACPROVIS13  = '+QuotedStr(QryDados.FieldByName('PLACONTACPROVIS13').AsString) +', '+
        ' PLANOPROVIS        = '+QuotedStr(QryDados.FieldByName('PLANOPROVIS').AsString)       +'  ';

    sSQLLocal := sSQLLocal +
        'WHERE (IDPESSJUR      = '+ QryDados.FieldByName('IDPESSJUR').AsString      +' ) '+
        '  AND (IDPLANOPREV    = '+ QryDados.FieldByName('IDPLANOPREV').AsString    +' ) '+
        '  AND (IDPESSOA       = '+ QryDados.FieldByName('IDPESSOA').AsString       +' ) '+
        '  AND (SEQPROPOSTA    = '+ QryDados.FieldByName('SEQPROPOSTA').AsString    +' ) '+
        '  AND (IDCONTRIBUICAO = '+ QryDados.FieldByName('IDCONTRIBUICAO').AsString +' ) '+
        '  AND (FLGCOBRA = 1) ' ;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQLLocal);

    try
       qryAux.ExecSQL;
    except
       exit;
    end;

    QryDados.Next;
  End;

  result := true;


end; { AtualizaContribPrevpartP }

function TfrmTransfPatroBatch.AtualizaReservaPart(sSQLDados: String) : Boolean;
Var
  sSQLLocal : String;
begin
  result := false;

  { Busca dados da Patro atual }
  QryDados.Close;
  QryDados.SQL.Clear;
  QryDados.SQL.Add(sSQLDados);
  QryDados.Open;

  If QryDados.IsEmpty Then
  begin
     result := true;
     Exit;
  end;

  While Not QryDados.Eof Do Begin
    { Prepara a atualização }
    sSQLLocal :=
        'UPDATE RESERVAPART SET '+
        '	DATAREFERENCIASA  = TO_DATE('+QuotedStr(DateToStr(Trunc(QryDados.FieldByName('DATAREFERENCIASA').AsDateTime)))+', ''DD/MM/YYYY''), '+
        '	VALORRESERVA      = '+OraNumero(QryDados.FieldByName('VALORRESERVA').AsString)       +', '+
        '	PERCENTUALSAQUE   = '+QuotedStr(QryDados.FieldByName('PERCENTUALSAQUE').AsString)    +', '+
        '	FLGATIVO          = '+QuotedStr(QryDados.FieldByName('FLGATIVO').AsString)           +', '+
        '       DATADESATIV       = TO_DATE('+QuotedStr(DateToStr(QryDados.FieldByName('DATADESATIV').AsDateTime))+', ''DD/MM/YYYY''), '+
        '       DATAULTALIM       = TO_DATE('+QuotedStr(DateToStr(QryDados.FieldByName('DATAULTALIM').AsDateTime))+', ''DD/MM/YYYY''), '+
        '	FLGINCONSISTENCIA = '+QuotedStr(QryDados.FieldByName('FLGINCONSISTENCIA').AsString)  +'  ';

      sSQLLocal := sSQLLocal +
          'WHERE (IDPESSJUR      = '+ QryDados.FieldByName('IDPESSJUR').AsString      +' ) '+
          '  AND (IDPLANOPREV    = '+ QryDados.FieldByName('IDPLANOPREV').AsString    +' ) '+
          '  AND (IDPESSOA       = '+ QryDados.FieldByName('IDPESSOA').AsString       +' ) '+
          '  AND (SEQPROPOSTA    = '+ QryDados.FieldByName('SEQPROPOSTA').AsString    +' ) '+
          '  AND (IDTIPORESERVA  = '+ QryDados.FieldByName('IDTIPORESERVA').AsString  +' ) ';
    qryAux.Close;
    qryAux.SQL.Clear;
     qryAux.SQL.Add(sSQLLocal);

    try
       qryAux.ExecSQL;
    except
       exit;
    end;


    QryDados.Next;
  End;

  result := true;

end; { AtualizaReservaPart }



function TfrmTransfPatroBatch.AtualizaBenefPlanoPart(sSQLDados: String) : Boolean;
Var
  sSQLLocal : String;
begin
  result := false;

  { Busca dados da Patro atual }
  QryDados.Close;
  QryDados.SQL.Clear;
  QryDados.SQL.Add(sSQLDados);
  QryDados.Open;

  If QryDados.IsEmpty Then
  begin
     result := true;
     Exit;
  end;



  While Not QryDados.Eof Do Begin
    { Prepara a atualização }
    sSQLLocal :=
        'UPDATE BENEFPLANOPART SET '+
        ' IDPESSJUR = '''+QryDados.FieldByName('IDPESSJUR').AsString+'''   ,'+
        ' SEQPROPOSTA = '''+QryDados.FieldByName('SEQPROPOSTA').AsString+'''   ,'+
        ' IDPLANOPREV  = '''+QryDados.FieldByName('IDPLANOPREV').AsString+'''   ,'+
        ' IDPESSOA  = '''+QryDados.FieldByName('IDPESSOA').AsString+'''  ,'+
        ' IDBENEFICIO  = '''+QryDados.FieldByName('IDBENEFICIO').AsString+'''   ,'+
        ' IDEMPRESAPROPABN  = '''+QryDados.FieldByName('IDEMPRESAPROPABN').AsString+'''   ,'+
        ' IDEMPRESAPROP  = '''+QryDados.FieldByName('IDEMPRESAPROP').AsString+'''   ,'+
        ' RECPAGDEVOL  = '''+QryDados.FieldByName('RECPAGDEVOL').AsString+'''   ,'+
        ' CODTIPRECEBCAP  = '''+QryDados.FieldByName('CODTIPRECEBCAP').AsString+'''   ,'+
        ' CODCENTRORESPON  = '''+QryDados.FieldByName('CODCENTRORESPON').AsString+'''   ,'+
        ' CODCENTROCUSTODA  = '''+QryDados.FieldByName('CODCENTROCUSTODA').AsString+'''   ,'+
        ' CODRECEBCAPABN  = '''+QryDados.FieldByName('CODRECEBCAPABN').AsString+'''   ,'+
        ' CODTIPRECDES  = '''+QryDados.FieldByName('CODTIPRECDES').AsString+'''   ,'+
        ' CODCENTROCUSTOCA  = '''+QryDados.FieldByName('CODCENTROCUSTOCA').AsString+'''   ,'+
        ' RECPAG  = '''+QryDados.FieldByName('RECPAG').AsString+'''   ,'+
        ' PLACONTADABN  = '''+QryDados.FieldByName('PLACONTADABN').AsString+'''   ,'+
        ' PLACONTACABN  = '''+QryDados.FieldByName('PLACONTACABN').AsString+'''   ,'+
        ' RECPAGABN  = '''+QryDados.FieldByName('RECPAGABN').AsString+'''   ,'+
        ' CODPORTFORMA  = '''+QryDados.FieldByName('CODPORTFORMA').AsString+'''   ,'+
        ' VALORBASE1  = '''+QryDados.FieldByName('VALORBASE1').AsString+'''   ,'+
        ' CODTIPDOC  = '''+QryDados.FieldByName('CODTIPDOC').AsString+'''   ,'+
        ' CODSUBCONTA  = '''+QryDados.FieldByName('CODSUBCONTA').AsString+'''   ,'+
        ' VALORBASE2  = '''+QryDados.FieldByName('VALORBASE2').AsString+'''   ,'+
        ' TIPCODIGO  = '''+QryDados.FieldByName('TIPCODIGO').AsString+'''   ,'+
        ' UNIDNEGOC  = '''+QryDados.FieldByName('UNIDNEGOC').AsString+'''   ,'+
        ' VALORBASE3  = '''+QryDados.FieldByName('VALORBASE3').AsString+'''   ,'+
        ' CODCENTROCUSTOD  = '''+QryDados.FieldByName('CODCENTROCUSTOD').AsString+'''   ,'+
        ' IDEMPRESA  = '''+QryDados.FieldByName('IDEMPRESA').AsString+'''    ,'+
        ' CODCENTROCUSTOC  = '''+QryDados.FieldByName('CODCENTROCUSTOC').AsString+'''   ,'+
        ' PLACONTAD  = '''+QryDados.FieldByName('PLACONTAD').AsString+'''   ,'+
        ' IDEMPRESAABN  = '''+QryDados.FieldByName('IDEMPRESAABN').AsString+'''   ,'+
        ' PLANO  = '''+QryDados.FieldByName('PLANO').AsString+'''   ,'+
        ' PLACONTAC  = '''+QryDados.FieldByName('PLACONTAC').AsString+'''   ,'+
        ' CODPORTFORMAABN  = '''+QryDados.FieldByName('CODPORTFORMAABN').AsString+'''   ,'+
        ' CODTIPDOCABN  = '''+QryDados.FieldByName('CODTIPDOCABN').AsString+'''   ,'+
        ' TIPCODIGOABN  = '''+QryDados.FieldByName('CODTIPRECDESABN').AsString+'''   ,'+
        ' CODTIPRECDESABN  = '''+QryDados.FieldByName('CODTIPRECDESABN').AsString+'''   ,'+
        ' CODALTERAJUROSABN  = '''+QryDados.FieldByName('CODALTERAJUROSABN').AsString+'''   ,'+
        ' CODALTERACORRABN  = '''+QryDados.FieldByName('CODALTERACORRABN').AsString+'''   ,'+
        ' PLANOABN  = '''+QryDados.FieldByName('PLANOABN').AsString+'''   ,'+
        ' UNIDNEGOCABN  = '''+QryDados.FieldByName('UNIDNEGOCABN').AsString+'''   ,'+
        ' CODCENTRORESPONA  = '''+QryDados.FieldByName('CODCENTRORESPONA').AsString+'''   ,'+
        ' CODSUBCONTAABN  = '''+QryDados.FieldByName('CODSUBCONTAABN').AsString+'''   ,'+
        ' CODTIPRECEBDEVOL  = '''+QryDados.FieldByName('CODTIPRECEBDEVOL').AsString+'''   ,'+
        ' CODCCUSTODEVOL  = '''+QryDados.FieldByName('CODCCUSTODEVOL').AsString+'''   ,'+
        ' PLACONTADEVOL  = '''+QryDados.FieldByName('PLACONTADEVOL').AsString+'''   ,'+
        ' CODCCUSTODEVPATA  = '''+QryDados.FieldByName('CODCCUSTODEVPATA').AsString+'''   ,'+
        ' PLACONTADEVPATA  = '''+QryDados.FieldByName('PLACONTADEVPATA').AsString+'''   ,'+
        ' CODCCUSTODEVOLA  = '''+QryDados.FieldByName('CODCCUSTODEVOLA').AsString+'''   ,'+
        ' PLACONTADEVOLA  = '''+QryDados.FieldByName('PLACONTADEVOLA').AsString+'''   ,'+
        ' CODCCUSTODEVOLPAT  = '''+QryDados.FieldByName('CODCCUSTODEVOLPAT').AsString+'''   ,'+
        ' PLACONTADEVOLPAT  = '''+QryDados.FieldByName('PLACONTADEVOLPAT').AsString+'''   ,'+
        ' CODCCUSTOCPROVIS  = '''+QryDados.FieldByName('CODCCUSTOCPROVIS').AsString+'''   ,'+
        ' CODCCUSTODPROVIS  = '''+QryDados.FieldByName('CODCCUSTODPROVIS').AsString+'''   ,'+
        ' PLACONTACPROVIS  = '''+QryDados.FieldByName('PLACONTACPROVIS').AsString+'''   ,'+
        ' PLACONTADPROVIS  = '''+QryDados.FieldByName('PLACONTADPROVIS').AsString+'''   ,'+
        ' IDPLANPREVCONTAB  = '''+QryDados.FieldByName('IDPLANPREVCONTAB').AsString+'''   ';

      sSQLLocal := sSQLLocal +
          'WHERE (IDPESSJUR      = '+ QryDados.FieldByName('IDPESSJUR').AsString      +' ) '+
          '  AND (IDBENEFICIO    = '+ QryDados.FieldByName('IDBENEFICIO').AsString    +' ) '+
          '  AND (IDPESSOA       = '+ QryDados.FieldByName('IDPESSOA').AsString       +' ) '+
          '  AND (SEQPROPOSTA    = '+ QryDados.FieldByName('SEQPROPOSTA').AsString    +' ) '+
          '  AND (IDPLANOPREV  = '+ QryDados.FieldByName('IDPLANOPREV').AsString  +' ) ';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQLLocal);

    try
       qryAux.ExecSQL;
    except
       exit;
    end;


    QryDados.Next;
  End;

  result := true;

end; { AtualizaBenefPlanoPart }


function TfrmTransfPatroBatch.AtualizaBfciarioTitPlan(sSQLDados: String) : Boolean;
Var
  sSQLLocal : String;
begin
  result := false;

  { Busca dados da Patro atual }
  QryDados.Close;
  QryDados.SQL.Clear;
  QryDados.SQL.Add(sSQLDados);
  QryDados.Open;

  If QryDados.IsEmpty Then
  begin
     result := true;
     Exit;
  end;


  While Not QryDados.Eof Do Begin
    { Prepara a atualização }
    sSQLLocal :=
        'UPDATE BFCIARIOTITPLAN SET '+
        ' IDTITULAR = '''+QryDados.FieldByName('IDTITULAR').AsString+'''   ,'+
        ' IDPLANOPREV = '''+QryDados.FieldByName('IDPLANOPREV').AsString+'''   ,'+
        ' IDPESSOA  = '''+QryDados.FieldByName('IDPESSOA').AsString+'''   ,'+
        ' IDBENEFICIO  = '''+QryDados.FieldByName('IDBENEFICIO').AsString+'''  ,'+
        ' SEQPROPOSTA  = '''+QryDados.FieldByName('SEQPROPOSTA').AsString+'''   ,'+
        ' PRIORIDADE  = '''+QryDados.FieldByName('PRIORIDADE').AsString+'''   ,'+
        ' IDRESPONSAVEL  = '''+QryDados.FieldByName('IDRESPONSAVEL').AsString+'''   ,'+
        ' PERCENTUAL  = '''+QryDados.FieldByName('PERCENTUAL').AsString+'''  ';
      sSQLLocal := sSQLLocal +
          'WHERE (IDPESSJUR      = '+ QryDados.FieldByName('IDPESSJUR').AsString      +' ) '+
          '  AND (IDBENEFICIO    = '+ QryDados.FieldByName('IDBENEFICIO').AsString    +' ) '+
          '  AND (IDPESSOA       = '+ QryDados.FieldByName('IDPESSOA').AsString       +' ) '+
          '  AND (IDTITULAR       = '+ QryDados.FieldByName('IDTITULAR').AsString       +' ) '+
          '  AND (SEQPROPOSTA    = '+ QryDados.FieldByName('SEQPROPOSTA').AsString    +' ) '+
          '  AND (IDPLANOORIGEM    = '+ QryDados.FieldByName('IDPLANOORIGEM').AsString    +' ) '+
          '  AND (IDPLANOPREV  = '+ QryDados.FieldByName('IDPLANOPREV').AsString  +' ) ';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQLLocal);

    try
       qryAux.ExecSQL;
    except
       exit;
    end;


    QryDados.Next;
  End;

  result := true;

end; { AtualizaBfciarioTitPlan }



function TfrmTransfPatroBatch.AtualizaBenefBfciario(sSQLDados: String) : Boolean;
Var
  sSQLLocal : String;
begin
  result := false;

  { Busca dados da Patro atual }
  QryDados.Close;
  QryDados.SQL.Clear;
  QryDados.SQL.Add(sSQLDados);
  QryDados.Open;

  If QryDados.IsEmpty Then
  begin
     result := true;
     Exit;
  end;





  While Not QryDados.Eof Do Begin
    { Prepara a atualização }
    sSQLLocal :=
        'UPDATE BENEFBFCIARIO SET '+
        ' NUMEROPROCESSO = '''+QryDados.FieldByName('NUMEROPROCESSO').AsString+'''   ,'+
        ' IDPESSJUR  = '''+QryDados.FieldByName('IDPESSJUR').AsString+'''   ,'+
        ' IDTITULAR = '''+QryDados.FieldByName('IDTITULAR').AsString+'''   ,'+
        ' IDPLANOPREV = '''+QryDados.FieldByName('IDPLANOPREV').AsString+'''   ,'+
        ' IDPESSOA  = '''+QryDados.FieldByName('IDPESSOA').AsString+'''   ,'+
        ' IDBENEFICIO  = '''+QryDados.FieldByName('IDBENEFICIO').AsString+'''  ,'+
        ' SEQPROPOSTA  = '''+QryDados.FieldByName('SEQPROPOSTA').AsString+'''   ,'+
        ' CODPORTFORMA  = '''+QryDados.FieldByName('CODPORTFORMA').AsString+'''   ,'+
        ' IDDEPENDENCIA  = '''+QryDados.FieldByName('IDDEPENDENCIA').AsString+'''   ,'+
        ' IDSITBENEFICIO  = 1   ,'+
        ' IDTPPAGTOBENEFIC  = '''+QryDados.FieldByName('IDTPPAGTOBENEFIC').AsString+'''   ,'+
        ' VALORATUAL  = '''+QryDados.FieldByName('VALORATUAL').AsString+'''   ,'+
        ' DATAREQUERIMENTO  = TO_DATE('''+QryDados.FieldByName('DATAREQUERIMENTO').AsString+''',''DD/MM/YYYY'')   ,'+
        ' DATAINICIO  =  TO_DATE('''+QryDados.FieldByName('DATAINICIO').AsString+''',''DD/MM/YYYY'')   ,'+
        ' FLGFORMAPAGTO  = '''+QryDados.FieldByName('FLGFORMAPAGTO').AsString+'''   ,'+
        ' VALORCALCULADO  = '''+QryDados.FieldByName('VALORCALCULADO').AsString+'''   ,'+
        ' DATAULTREAJUSTE  = TO_DATE('''+QryDados.FieldByName('DATAULTREAJUSTE').AsString+''',''DD/MM/YYYY'')   ,'+
        ' VLRCALCINSS  = '''+QryDados.FieldByName('VLRCALCINSS').AsString+'''   ,'+
        ' VLRINFINSS  = '''+QryDados.FieldByName('VLRINFINSS').AsString+'''   ,'+
        ' DATAINICIOINSS  = TO_DATE('''+QryDados.FieldByName('DATAINICIOINSS').AsString+''',''DD/MM/YYYY'')   ,'+
        ' NUMPROCINSS  = '''+QryDados.FieldByName('NUMPROCINSS').AsString+'''   ,'+
        ' DATAINICIOFUND  = TO_DATE('''+QryDados.FieldByName('DATAINICIOFUND').AsString+''',''DD/MM/YYYY'')   ,'+
        ' VALORCOTAS  = '''+QryDados.FieldByName('VALORCOTAS').AsString+'''   ,'+
        ' DATACONCESSAO  = TO_DATE('''+QryDados.FieldByName('DATACONCESSAO').AsString+''',''DD/MM/YYYY'')   ,'+
        ' FLGPROVISORIO  = '''+QryDados.FieldByName('FLGPROVISORIO').AsString+'''   ,'+
        ' PERCPROVISORIO  = '''+QryDados.FieldByName('PERCPROVISORIO').AsString+'''   ,'+
        ' PRAZOPROVISORIO  = '''+QryDados.FieldByName('PRAZOPROVISORIO').AsString+'''   ,'+
        ' ULTMESREAJUSTE  = '''+QryDados.FieldByName('ULTMESREAJUSTE').AsString+'''   ,'+
        ' ULTVALORATUALREAJ  = '''+QryDados.FieldByName('ULTVALORATUALREAJ').AsString+'''   ,'+
        ' IDAGENCIARESGATE  = '''+QryDados.FieldByName('IDAGENCIARESGATE').AsString+'''   ,'+
        ' DATAFINALPREVISTA  = TO_DATE('''+QryDados.FieldByName('DATAFINALPREVISTA').AsString+''',''DD/MM/YYYY'')   ,'+
        ' FLGDATAPREVISTA  = '''+QryDados.FieldByName('FLGDATAPREVISTA').AsString+'''   ,'+
        ' FLGTIPOINSS  = '''+QryDados.FieldByName('FLGTIPOINSS').AsString+'''   ,'+
        ' DIBBENEFANT  = '''+QryDados.FieldByName('DIBBENEFANT').AsString+'''   ,'+
        ' VALORBENEFANT  = '''+QryDados.FieldByName('VALORBENEFANT').AsString+'''   ,'+
        ' VALORBINSSANT1  = '''+QryDados.FieldByName('VALORBINSSANT1').AsString+'''   ,'+
        ' VALORBINSSANT2  = '''+QryDados.FieldByName('VALORBINSSANT2').AsString+'''   ,'+
        ' VALORBINSSANT3  = '''+QryDados.FieldByName('VALORBINSSANT3').AsString+'''   ,'+
        ' VALORTOTAL  = '''+QryDados.FieldByName('VALORTOTAL').AsString+'''   ,'+
        ' FLGPOSSUIACOMPINSS  = '''+QryDados.FieldByName('FLGPOSSUIACOMPINSS').AsString+'''   ,'+
        ' FLGBENEFMIN  = '''+QryDados.FieldByName('FLGBENEFMIN').AsString+'''   ,'+
        ' VALORSRB  = '''+QryDados.FieldByName('VALORSRB').AsString+'''   ,'+
        ' IDPLANOORIGEM  = '''+QryDados.FieldByName('IDPLANOORIGEM').AsString+'''  ';
      sSQLLocal := sSQLLocal +
          'WHERE (NUMEROPROCESSO = '+ QryDados.FieldByName('NUMEROPROCESSO').AsString   +')'+
          '  AND (IDPESSJUR      = '+ QryDados.FieldByName('IDPESSJUR').AsString      +' ) '+
          '  AND (IDBENEFICIO    = '+ QryDados.FieldByName('IDBENEFICIO').AsString    +' ) '+
          '  AND (IDPESSOA       = '+ QryDados.FieldByName('IDPESSOA').AsString       +' ) '+
          '  AND (IDTITULAR       = '+ QryDados.FieldByName('IDTITULAR').AsString       +' ) '+
          '  AND (SEQPROPOSTA    = '+ QryDados.FieldByName('SEQPROPOSTA').AsString    +' ) '+
          '  AND (IDPLANOORIGEM    = '+ QryDados.FieldByName('IDPLANOORIGEM').AsString    +' ) '+
          '  AND (IDPLANOPREV  = '+ QryDados.FieldByName('IDPLANOPREV').AsString  +' ) ';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(sSQLLocal);

    try
       qryAux.ExecSQL;
    except
       exit;
    end;


    QryDados.Next;
  End;

  result := true;

end; { AtualizaBenefBfciario }




procedure TfrmTransfPatroBatch.dblkFilialOrigemChange(Sender: TObject);
begin
  inherited;
  EdMatricula.text := '';
  PnlNome.caption := '';
  iIdPessoa := 0;
  EdMatricDest.text := '';
  EdMatricDest.enabled := False;
  EdMatricDest.color := clMenu;
end;

procedure TfrmTransfPatroBatch.dblkPlanoPrevChange(Sender: TObject);
begin
  inherited;
  EdMatricula.text := '';
  PnlNome.caption := '';
  iIdPessoa := 0;
  EdMatricDest.text := '';
  EdMatricDest.enabled := False;
  EdMatricDest.color := clMenu;
end;

procedure TfrmTransfPatroBatch.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  tb97Param.visible := false;

  if dtmBaseDados.dbBaseDados.InTransaction then
  dtmBaseDados.dbBaseDados.Rollback;

  iIdPessoa := 0;
  PnlNome.Caption  := '';
  EdMatricula.Text := '';
  dblkPatroOrigem.text := '';
  dblkPlanoPrev.text := '';
  dblkSitPatOrigem.text := '';
  dblkFilialOrigem.text := '';
  grbDemissao.visible := false;
  dblkSitPatFinal.text := '';

  dblkPatroDestino.text := '';
  dblkSitPatDestino.text := '';
  dblkFilialDestino.text := '';
  dtDataTransf.text := '';
  EdMatricDest.text := '';
  EdMatricDest.enabled := False;
  EdMatricDest.color := clMenu;
 

end;

procedure TfrmTransfPatroBatch.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  iIdPessoa := 0;
  PnlNome.Caption  := '';
  EdMatricula.Text := '';
  dblkPatroOrigem.text := '';
  dblkPlanoPrev.text := '';
  dblkSitPatOrigem.text := '';
  dblkFilialOrigem.text := '';
  grbDemissao.visible := false;
  dblkSitPatFinal.text := '';

  dblkPatroDestino.text := '';
  dblkSitPatDestino.text := '';
  dblkFilialDestino.text := '';
  dtDataTransf.text := '';
  EdMatricDest.text := '';
  

  msBusca.Executar;
  If msBusca.RetornouValor Then Begin
    iIdPessoa        := StrToInt(msBusca.ValoresChave[0]);


    dblkPatroOrigem.LookupValue := msBusca.ValoresChave[1];
    dblkPatroOrigem.PerformSearch;
    
    dblkPlanoPrev.LookupValue   := msBusca.ValoresChave[2];
    dblkPlanoPrev.PerformSearch;
    
    qryFilialOrig.Close;
    qryFilialOrig.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
    qryFilialOrig.Open;
    dblkFilialOrigem.LookupValue:= msBusca.ValoresChave[30];
    dblkFilialOrigem.PerformSearch;

    dblkSitPatOrigem.LookupValue   := msBusca.ValoresChave[16];
    dblkSitPatOrigem.PerformSearch;

    PnlNome.Visible  := True;
    PnlNome.Caption  := ' '+msBusca.ValoresChave[3];
    EdMatricula.Text := msBusca.ValoresChave[4];
    EdMatricDest.Text := EdMatricula.Text;
    EdMatricDest.enabled := true;
    EdMatricDest.color := clWindow;
    iIdPessoa        := StrToInt(msBusca.ValoresChave[0]);

    
    if msBusca.ValoresChave[31] <> '' then
    begin
       cbOpDemissao.ItemIndex := 2;
       dtDemissao.Text := msBusca.ValoresChave[31];
    end;

    dblkSitPatFinal.setfocus;

  End;
end;

procedure TfrmTransfPatroBatch.dblkPatroOrigemChange(Sender: TObject);
begin
  inherited;
    qryFilialOrig.Close;
    qryFilialOrig.ParamByName('IDPESSOA').AsInteger := StrToInt(dblkPatroOrigem.LookupValue);
    qryFilialOrig.Open;

    EdMatricula.text := '';
    PnlNome.caption := '';
    iIdPessoa := 0;
    EdMatricDest.text := '';
    EdMatricDest.enabled := False;
    EdMatricDest.color := clMenu;
end;

procedure TfrmTransfPatroBatch.FormCreate(Sender: TObject);
begin
  inherited;
  tb97Param.visible := false;
end;

procedure TfrmTransfPatroBatch.BitBtn1Click(Sender: TObject);
begin
  inherited;
  tb97Param.visible := false;
end;

procedure TfrmTransfPatroBatch.BitBtn2Click(Sender: TObject);
begin
  
  tb97Param.visible := false;
end;

end.



