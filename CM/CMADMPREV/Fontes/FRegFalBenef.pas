// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : edilaine
// Pendência   : 85129
// Data        : 23/04/2019
// Descricao   : Quando nao ha beneficios ativos, considerar perfil e plano contabil
//               do beneficio selecionado ao buscar dados da matricula
//------------------------------------------------------------------------------
// Autor(a)    : edilaine
// Pendência   : 84575
// Data        : 12/04/2019
// Descricao   : Quando nao ha beneficios ativos, considerar o primeiro perfil
//               preenchido de beneficio encerrado
//------------------------------------------------------------------------------
// Autor(a)    : Fábio Sampaio
// Pendência   : SIG73833
// Data        : 19/09/2018
// Descricao   : Inclusão dos parâmetros IDPERFILINVEST e IDPLANPREVCONTAB na
//               AbreRequerPensionista
//------------------------------------------------------------------------------
// Autor(a)    : Taffarel Sevaybriker
// Pendência   : SIG79141
// Data        : 13/12/2018
// Descrição   : Corrigido update de cancelamento do plano na tabela PLANODEPENDENTE ao registrar falecimento.
//------------------------------------------------------------------------------
// Autor(a)    : BRUNO AZEVEDO
// Pendência   : SOL 193844 Kintana 1846004
// Data        : 01/11/2012
// Descricao   : Adicionado o SOL 190523 que não subiu corretamente para produção.
//------------------------------------------------------------------------------
// Autor(a)    : Vander Campos
// Pendência   : SOL 190523 Kintana 1801709
// Data        : 18/09/2012
// Descricao   : Ajuste na funcionalidade para que a opção "Requerer Beneficio" apresente somente os beneficios
//              cadastrados para o falecido.
//------------------------------------------------------------------------------
//Pendência   : SOL 186500/11002 KINTANA 1768929
//Responsável : BRUNO AZEVEDO
//Data        : 16/08/2012
//Descrição   : Ajuste na query de entrada da regra 24641 que determina o IDPLANPREVCONTAB.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Pendência   : SOL 136385/7362 Kintana 1527997
//Data         : 26/12/2011
// Descricao   : inclusão do campo IDEVENTOGERADOR na query de entrada da regra
//               de cálculo de valor total
//------------------------------------------------------------------------------
//Pendência   : SOL 167416 KINTANA 1468721
//Responsável : BRUNO AZEVEDO
//Data        : 27/10/2011
//Descrição   : Ajuste na consulta dos benefícios para encerramento.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 24/09/2010
// Pendência   : SOL 144325 KTN 949129
// Alteração   : Atualizar campo DATACANCELA da tabela DEPENTIT.
{-----------------------------------------------------------------------------
Rotina........: BtEncerraBeneficioClick
N. Sol........: 97656
N. Kintana....: 425066
Data..........: 02/10/2008
Responsável...: Denise Arruda
Descrição.....: Acerto na data de falecimento no momento da geração do
                demonstrativo.
                A aplicação estava manipulando incorretamente a data digitada
                pelo usuário.
-----------------------------------------------------------------------------}
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 20/07/2007
// Rotina      : Varias
// Pendência   : 24224
// Descricao   : Passar IDCALCULO para as funções de beneficio
//------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Augusto
// Data        : 04/06/2007
// Alteração   : 1) MontaSelect - Incluir beneficios encerrados.
//
//------------------------------------------------------------------------------
// Rotina      : bbtnRequerBenefClick
// Autor(a)    : Augusto
// Data        : 09/03/2004
// Alteração   : Acertos para beneficiários migrados de beneficios
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Camille
// Data        : 25.10.2004
// Pendencia   : 17994
// Alteração   : Acertos para so considerar a variavel bPossuiBenefAtivo se
//               o beneficio for normal ou retido
//------------------------------------------------------------------------------
// Rotina      : bbtnRequerBenefClick
// Autor(a)    : Augusto
// Data        : 09/03/2004
// Alteração   : Acertos para beneficiários migrados de beneficios 
//------------------------------------------------------------------------------
// Rotina      : bbtnRequerBenefClick
// Autor(a)    : Augusto
// Data        : 16/02/2004
// Alteração   : Novo parametro com o IDPLANOPREV do beneficiario
//------------------------------------------------------------------------------
// Rotina      : SB1Click
// Autor(a)    : Leo
// Data        : 07.01.2004
// Alteração   : alterações na função para habilitar o requerimento após o registro de falecimento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina    : bbtnRequerBenefClick
// Autor(a)  : Augusto
// Data      : 07/04/2003
// Alteração : Inclusão da abertura de uma transação no processo de requerimento .
// -----------------------------------------------------------------------------
// Rotina    : bbtnConfirmarClick
// Autor(a)  : Leo
// Data      : 03.07.2002
// Alteração : tirei ExecutouDesdobramento := false
// -----------------------------------------------------------------------------
// Rotina    : BtDesdobraBeneficioClick
// Autor(a)  : Leo
// Data      : 11.06.2002
// Alteração : tratamento para transação
// -----------------------------------------------------------------------------

unit FRegFalBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Wwquery, ComCtrls,
  Wwdatsrc, Grids,  Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbigrd, Mask, DBCtrls;

type
  TFrmRegFalBenef = class(TfrmOkCancelar)
    Label1: TLabel;
    SB1: TSpeedButton;
    MSBeneficiarioOLD: TMontaSelect;
    QryBenefBfciario: TwwQuery;
    DsBenefBfciario: TwwDataSource;
    QryAux: TwwQuery;
    MSBeneficiario: TMontaSelect;
    Panel2: TPanel;
    pnlTitular: TPanel;
    Label13: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pnlBotaoProcurar: TPanel;
    bbtnProcurar: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    pnlSubTitulo: TPanel;
    lblTitulo: TLabel;
    dbNomeBeneficiario: TDBText;
    Label5: TLabel;
    EdDtFalecimento: TCMDateTimePicker;
    wwDBGrid1: TwwDBGrid;
    Panel1: TPanel;
    BtEncerraBeneficio: TBitBtn;
    bbtnRequerBenef: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtEncerraBeneficioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnRequerBenefClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);

  private
    { Private declarations }
    IdBeneficiario   :Integer;
    IdTitular        :Integer;
    bPossuiBenefAtivo,
    ExecutouDesdobramento:Boolean;
    bAtualizouFalecimento : boolean;
    iIdPerfilInvest, iIdPlanPrevContab : integer;

    Function BuscaBenefBfciario(IdBeneficiario:Integer):Boolean;

  public
    { Public declarations }
  end;

var
  FrmRegFalBenef: TFrmRegFalBenef;

implementation

uses uMensErro, UDataBase,DBaseDados, Usistema,
     FCadRequerBenefPensionista, UAdmPrev, uBeneficio, FRetemEncerraNOVO;

{$R *.DFM}

procedure TFrmRegFalBenef.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  bAtualizouFalecimento    := False;
  EdDtFalecimento.ReadOnly := False;
  EdDtFalecimento.Enabled  := True;

  iIdPerfilInvest   := -1;           // Alterado por FHBS - 19/09/2018 - SIG73833
  iIdPlanPrevContab := -1;           // Alterado por FHBS - 19/09/2018 - SIG73833

  MSBeneficiario.Executar;
  if MSBeneficiario.RetornouValor
  then begin
    bbtnConfirmar.Enabled := True;
    bbtnCancelar.Enabled  := True;

    // Caso pessoa jé tenha falecido
    if Trim(MSBeneficiario.ValoresChave[8]) <> ''
    then begin
      MsgDlg('O falecimento deste beneficiário já foi registrado. '+#13+
             'Data do Falecimento : '+MSBeneficiario.ValoresChave[8]+'.',
             'Erro', mtError, [mbOk],0);
      EdDtFalecimento.Text     :=   MSBeneficiario.ValoresChave[8]; 
      EdDtFalecimento.ReadOnly := True; 
      EdDtFalecimento.Enabled  := False;
    end;

    // Guarda Dados do Beneficiario
    IdBeneficiario   := StrToInt(MSBeneficiario.ValoresChave[7]);
    IdTitular        := StrToInt(MSBeneficiario.ValoresChave[1]);
    // Busca os Beneficios do beneficiario
    if BuscaBenefBfciario(IdBeneficiario)
    then begin
      BtEncerraBeneficio.Enabled  := True;
      bbtnRequerBenef.Enabled     := True;
      bPossuiBenefAtivo           := False;
      qryBenefBfciario.First;
      while not qryBenefBfciario.Eof do
      begin
         if (qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger = 1) or
            (qryBenefBfciario.FieldByName('IDSITBENEFICIO').AsInteger = 2)
         then
         begin   // Alterado por FHBS - 19/09/2018 - SIG73833
           bPossuiBenefAtivo := True;
           if iIdPerfilInvest = -1 then
           begin
             iIdPerfilInvest   := qryBenefBfciario.FieldByName('IDPERFILINVEST').AsInteger;
             iIdPlanPrevContab := qryBenefBfciario.FieldByName('IDPLANPREVCONTAB').AsInteger;
           end;
         end;
         // Alterado por FHBS - 19/09/2018 - SIG73833

         qryBenefBfciario.Next;
      end;

      //edilaine - SIG84575 - inicio
      // nao tem beneficio ativo ou retido, pega o 1o que estiver preenchido
      if (iIdPerfilInvest = -1) and (not bPossuiBenefAtivo) then
      begin
        qryBenefBfciario.First;
        while not qryBenefBfciario.Eof do
        begin
           if (qryBenefBfciario.FieldByName('IDPERFILINVEST').AsString <> '')  and
              (qryBenefBfciario.FieldByName('NUMEROPROCESSO').AsString = MSBeneficiario.ValoresChave[0])  //edilaine - SIG85129
           then
           begin
             iIdPerfilInvest   := qryBenefBfciario.FieldByName('IDPERFILINVEST').AsInteger;
             iIdPlanPrevContab := qryBenefBfciario.FieldByName('IDPLANPREVCONTAB').AsInteger;
             break;
           end;
           qryBenefBfciario.Next;
        end;
      end;
      //edilaine - SIG84575 - fim

      qryBenefBfciario.First;

    end
    else begin
      bPossuiBenefAtivo          := False;
      BtEncerraBeneficio.Enabled := False;
      bbtnRequerBenef.Enabled    := False;
    End;
  End;
end;

//******************************************************************************
// Busca Dados dos Beneficios do Beneficiario
Function TFrmRegFalBenef.BuscaBenefBfciario(IdBeneficiario:Integer):Boolean;
Begin
  Result:= False;
  // Preenche Parametros da Consulta
  QryBenefBfciario.Close;
  QryBenefBfciario.ParamByName('IDPESSOA').AsInteger :=IdBeneficiario;
  QryBenefBfciario.Open;

  If Not QryBenefBfciario.IsEmpty
  Then Result := True;

End;

procedure TFrmRegFalBenef.FormShow(Sender: TObject);
begin
  inherited;

  bPossuiBenefAtivo     := False;
  ExecutouDesdobramento := False;

  MSBeneficiario.Filtro.Add('EL.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;

  iIdCalculoGeral := -1;

end;

procedure TFrmRegFalBenef.BtEncerraBeneficioClick(Sender: TObject);
Var
  bEncerrouBenefAnt: Boolean;
  iIdPlanoOrigem   : Integer;
  iNumDiasBenefAnt : integer;
begin
  inherited;

  if Trim(EdDtFalecimento.Text) = ''
  Then Begin
    MsgDlg('Informe a Data de Falecimento do Beneficiário.','Erro', mtError, [mbOk],0);
    EdDtFalecimento.SetFocus;
    Exit;
  End;
  
  if not dtmBaseDados.dbBaseDados.intransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  // Caso Possua Beneficio Chama Tela de Desdobramento
  If bPossuiBenefAtivo
  Then Begin

    iNumDiasBenefAnt := BuscaNumDiasBenefAnterior ( qryAux,
                                                    QryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger,
                                                    QryBenefBfciario.FieldByName('IDBENEFICIO').AsInteger );

    frmRetemEncerraNOVO := TfrmRetemEncerraNOVO.Create(Application);
    with frmRetemEncerraNOVO do
    begin
       iNumeroProcesso := QryBenefBfciario.FieldByName('NUMEROPROCESSO').AsInteger;
       iIdTitular      := IdTitular;
       iSeqProposta    := QryBenefBfciario.FieldByName('SEQPROPOSTA').AsInteger;
       iIdPessJur      := QryBenefBfciario.FieldByName('IDPESSJUR').AsInteger;
       iIdPlanoPrev    := QryBenefBfciario.FieldByName('IDPLANOPREV').AsInteger;
       iIdPlanoOrigem  := QryBenefBfciario.FieldByName('IDPLANOORIGEM').AsInteger;
       qry.Close;
       qry.ParamByName('IDPESSOA').AsInteger       := IdBeneficiario;
       qry.ParamByName('NUMEROPROCESSO').AsInteger := iNumeroProcesso;
       //BRUNO AZEVEDO SOL 167416 KINTANA 1468721
       qry.ParamByName('IDPLANOPREV').AsInteger    := iIdPlanoPrev;
       qry.Open;

       qryTitular.Close;
       qryTitular.ParamByName('IdPessoa').Value    := iIdTitular;
       qryTitular.ParamByName('IdPessJur').Value   := iIdPessJur;
       qryTitular.ParamByName('IdPlanoPrev').Value := iIdPlanoPrev;
       qryTitular.ParamByName('SeqProposta').Value := iSeqProposta;
       qryTitular.Open;

       if qry.FieldByName('IDPESSOA').AsInteger = qry.FieldByName('IDTITULAR').AsInteger
       then lblTitulo.Caption := 'Benefícios do Participante '
       else lblTitulo.Caption := 'Benefícios do Beneficiário ';

       lblBeneficiario.Caption := qry.FieldByName('NOME').AsString+' (Matricula : '+qry.FieldByName('MATRICULADEP').AsString+')';

       sbtnRetencao.Visible        := False;
       bbtnProcurar.Visible        := False;
       bbtnConfirmar.Enabled       := False;
       bbtnCancelar.Enabled        := False;
       bOperacaoEmAberto           := False;
       bVeioDoMenu                 := False;
       bObrigaDataEncerra          := True;
       sFlgEvento                  := sFlgInterno;
       //Denise Arruda 02/10/2008 Sol Nº 97656 Kintana Nº 425066
       //sDataFinalPrevista          := FormatDateTime('dd/mm/yyyy', StrToDate(edDtFalecimento.Text) - iNumDiasBenefAnt);
       sDataFinalPrevista          := FormatDateTime('dd/mm/yyyy', StrToDate(edDtFalecimento.Text));
       ShowModal;
       bEncerrouBenefAnt           := bEncerrou;
    end;
    frmRetemEncerraNOVO.Free;

    if not bEncerrouBenefAnt then begin
// Acerta Variaveis
       ExecutouDesdobramento:= False;
       Exit;
    end;
  end;
// Acerta Variaveis
  ExecutouDesdobramento:= True;
end;

procedure TFrmRegFalBenef.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
// Testa Dados da Tela
  If (not qryBenefBfciario.Active) or (qryBenefBfciario.IsEmpty)
  Then Begin
    MsgDlg('Escolha um Beneficiário ','Erro', mtError, [mbOk],0);
    Exit;
  End;

// Testa Dados da Tela
  If Trim(EdDtFalecimento.Text) = ''
  Then Begin
    MsgDlg('Informe a Data de Falecimento do Beneficiário.','Erro', mtError, [mbOk],0);
    EdDtFalecimento.SetFocus;
    Exit;
  End;

// Testa se já executou Desdobramento
  If (bPossuiBenefAtivo = True) And (ExecutouDesdobramento = False)
  Then Begin
    MsgDlg('Este beneficiário possui benefícios ATIVOS. '+#13+
           'Neste caso é OBRIGATÓRIA a execução do Encerramento de Benefícios.'+#13+
           'Clique no botão "Encerrar Benefícios" para executar o encerramento.','Erro', mtError, [mbOk],0);
    Exit;
  End;

  if not dtmBaseDados.dbBaseDados.intransaction //Taffarel - SIG79141
  then dtmBaseDados.dbBaseDados.StartTransaction; //Taffarel - SIG79141

  if dtmBaseDados.dbBaseDados.InTransaction
  then begin
    if not bAtualizouFalecimento
    then begin
      Try
         // Atualiza Data de Falecimento na PESSOAFISICA
         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add('UPDATE PESSOAFISICA SET DATAMORTE = TO_DATE('+
                        QuotedStr(EdDtFalecimento.Text)+',''DD/MM/YYYY'')'+
                       'WHERE IDPESSOA = '+ IntToStr(IdBeneficiario) );
         QryAux.ExecSQL;

         // Ádler Souza - SOL 144325 KTN 949129
         // Atualiza Data de Falecimento na DEPENTIT
         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add('UPDATE DEPENTIT SET DATACANCELA = TO_DATE('+
                        QuotedStr(EdDtFalecimento.Text)+',''DD/MM/YYYY'')'+
                       'WHERE IDPESSOA = '+ IntToStr(IdBeneficiario) );
         QryAux.ExecSQL;
         // Fim - Ádler Souza - SOL 144325 KTN 949129

         //Taffarel - SIG79141 - início
         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add(' UPDATE PLANODEPENDENTE SET DATACANCEL = TO_DATE('+QuotedStr(EdDtFalecimento.Text)+',''DD/MM/YYYY''), ' +
                        ' ID_MOTIVOCANCEL = 115' +
                        ' WHERE  IDPESSOA  = ' + IntToStr(IdBeneficiario) );
         QryAux.ExecSQL;
         //Taffarel - SIG79141 - fim

         if bPossuiBenefAtivo and
            ( CriaLogOcorrencia( qryBenefBfciario.FieldByname('IDPLANOPREV').AsString,
                               qryBenefBfciario.FieldByname('IDPESSJUR').AsString,
                               qryBenefBfciario.FieldByname('IDTITULAR').AsString,
                               qryBenefBfciario.FieldByname('IDBENEFICIO').AsString,
                               qryBenefBfciario.FieldByname('NUMEROPROCESSO').AsString,
                               qryBenefBfciario.FieldByname('IDPESSOA').AsString,
                               qryBenefBfciario.FieldByname('SEQPROPOSTA').AsString,
                               '9', 
                               FormatDateTime('dd/mm/yyyy', Date),
                               qryBenefBfciario.FieldByname('VALORATUAL').AsString,
                               qryBenefBfciario.FieldByname('VALORTOTAL').AsString,
                               qryBenefBfciario.FieldByname('VALORCOTAS').AsString,
                               qryBenefBfciario.FieldByname('DATAINICIO').AsString,
                               EdDtFalecimento.Text,
                               qryBenefBfciario.FieldByname('VALORATUAL').AsString,
                               qryBenefBfciario.FieldByname('DATAINICIO').AsString,
                               qryBenefBfciario.FieldByname('DATAFINALGRAVA').AsString,
                               qryBenefBfciario.FieldByname('IDSITBENEFICIO').AsString,
                               qryBenefBfciario.FieldByname('FLGDATAPREVISTA').AsInteger,
                               qryAux,
                               '',
                               -1,
                               iIdCalculoGeral,
                               False,
                               -1 ) <= 0 )
         then Exit;

         bAtualizouFalecimento := True;
      Except
         MsgDlg('Houve um Erro ao executar o Registro de Falecimento. ',
               'Erro', mtError, [mbOk],0);
         Raise;
         Exit;
      End;
    end;

    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

    IF dtmBaseDados.dbBaseDados.InTransaction THEN dtmBaseDados.dbBaseDados.Commit
  end
  else IF dtmBaseDados.dbBaseDados.InTransaction THEN dtmBaseDados.dbBaseDados.Rollback;

  MsgDlg('Registro de Falecimento Efetuado com Sucesso.','Informação', mtinformation, [mbOk],0);

  EdDtFalecimento.Clear;
  QryBenefBfciario.Close;
  QryBenefBfciario.ParamByName('IDPESSOA').AsInteger := -1;
  QryBenefBfciario.Open;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;
procedure TFrmRegFalBenef.bbtnCancelarClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction
  then
  begin
     if MsgDlg( 'Deseja cancelar o Registro do Falecimento e todas as operações efetuadas ?',
                'Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo
     then Exit
     else dtmBaseDados.dbBaseDados.RollBack;
  end;

  EdDtFalecimento.Clear;
  QryBenefBfciario.Close;
  QryBenefBfciario.ParamByName('IDPESSOA').AsInteger := -1;
  QryBenefBfciario.Open;
  inherited;
// Acerta Variaveis
  ExecutouDesdobramento:= False;
end;


procedure TFrmRegFalBenef.bbtnSairClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.RollBack;
 
  inherited;

end;

procedure TFrmRegFalBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.RollBack;
  inherited;
end;

procedure TFrmRegFalBenef.bbtnRequerBenefClick(Sender: TObject);
var
  sNumerosProcessos : string;
  iIdPlanoPrevTit : String;
begin
  inherited;
  if Trim(EdDtFalecimento.Text) = ''
  Then Begin
    MsgDlg('Informe a Data de Falecimento do Beneficiário.','Erro', mtError, [mbOk],0);
    EdDtFalecimento.SetFocus;
    Exit;
  End;

  if not dtmBaseDados.dbBaseDados.intransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  Try
    // Atualiza Data de Falecimento
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add('UPDATE PESSOAFISICA SET DATAMORTE = TO_DATE('+
                    QuotedStr(EdDtFalecimento.Text)+',''DD/MM/YYYY'')'+
                   'WHERE IDPESSOA = '+ IntToStr(IdBeneficiario) );
    QryAux.ExecSQL;

    // Ádler Souza - SOL 144325 KTN 949129
    // Atualiza Data de Falecimento na DEPENTIT
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add('UPDATE DEPENTIT SET DATACANCELA = TO_DATE('+
                   QuotedStr(EdDtFalecimento.Text)+',''DD/MM/YYYY'')'+
                   'WHERE IDPESSOA = '+ IntToStr(IdBeneficiario) );
    QryAux.ExecSQL;
    // Fim - Ádler Souza - SOL 144325 KTN 949129

    //Taffarel - SIG79141 - início
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add(' UPDATE PLANODEPENDENTE SET DATACANCEL = TO_DATE('+QuotedStr(EdDtFalecimento.Text)+',''DD/MM/YYYY''), ' +
                   ' ID_MOTIVOCANCEL = 115' +
                   ' WHERE  IDPESSOA  = ' + IntToStr(IdBeneficiario) );
    QryAux.ExecSQL;
    //Taffarel - SIG79141 - fim

    if bPossuiBenefAtivo and
       ( CriaLogOcorrencia( qryBenefBfciario.FieldByname('IDPLANOPREV').AsString,
                          qryBenefBfciario.FieldByname('IDPESSJUR').AsString,
                          qryBenefBfciario.FieldByname('IDTITULAR').AsString,
                          qryBenefBfciario.FieldByname('IDBENEFICIO').AsString,
                          qryBenefBfciario.FieldByname('NUMEROPROCESSO').AsString,
                          qryBenefBfciario.FieldByname('IDPESSOA').AsString,
                          qryBenefBfciario.FieldByname('SEQPROPOSTA').AsString,
                          '9',
                          FormatDateTime('dd/mm/yyyy', Date),
                          qryBenefBfciario.FieldByname('VALORATUAL').AsString,
                          qryBenefBfciario.FieldByname('VALORTOTAL').AsString,
                          qryBenefBfciario.FieldByname('VALORCOTAS').AsString,
                          qryBenefBfciario.FieldByname('DATAINICIO').AsString,
                          EdDtFalecimento.Text,
                          qryBenefBfciario.FieldByname('VALORATUAL').AsString,
                          qryBenefBfciario.FieldByname('DATAINICIO').AsString,
                          qryBenefBfciario.FieldByname('DATAFINALGRAVA').AsString,
                          qryBenefBfciario.FieldByname('IDSITBENEFICIO').AsString,
                          qryBenefBfciario.FieldByname('FLGDATAPREVISTA').AsInteger,
                          qryAux,
                          '',
                          -1,
                          iIdCalculoGeral,
                          False,
                          -1 ) <= 0 )
    then Exit;


    bAtualizouFalecimento := True;
  Except
    MsgDlg('Houve um Erro ao executar o Registro de Falecimento. ',
           'Erro', mtError, [mbOk],0);
    Raise;
    Exit;
  End;

  iIdPlanoPrevTit := BuscaPlanoOrigem( QryBenefBfciario.FieldByName('IDPESSJUR').AsInteger,
                                       IdTitular,Copy( FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                                                 Copy( FormatDateTime('dd/mm/yyyy', Date),4,2));
  try
     QryBenefBfciario.locate('NUMEROPROCESSO', MSBeneficiario.ValoresChave[0], []);   //edilaine - SIG85129
     
     AbreRequerPensionista( 'EV',
                            IntToStr(IdTitular),
                            QryBenefBfciario.FieldByName('IDPESSJUR').AsString,
                            iIdPlanoPrevTit,
                            QryBenefBfciario.FieldByName('SEQPROPOSTA').AsString,
                            IntToStr(IdBeneficiario),
                            EdDtFalecimento.Text,
                            sNumerosProcessos,
                            QryBenefBfciario.FieldByName('IDPLANOPREV').AsString,
                            '-1', // SOL 136385/7362 Kintana 1527997
                            QryBenefBfciario.FieldByName('IDBENEFICIO').AsString, //BRUNO AZEVEDO SOL 186500/11002 KINTANA 1768929
                            4, //Vander Campos - SOL 190523 Kintana 1801709
                            iIdPerfilInvest, // Alterado por FHBS - 19/09/2018 - SIG73833
                            iIdPlanPrevContab  // Alterado por FHBS - 19/09/2018 - SIG73833
                           );




  except
     Abort;
  end;

end;


end.

